#include <stdio.h>
#include <include/stdint.h>
#include "audio.h"

// ─── Hardware registers & vectors ─────────────────────────────────────────────
#define SID         ((volatile uint8_t*)0xD400)   // SID base address
#define CIA2_ICR    (*(volatile uint8_t*)0xDD0D)  // CIA2 interrupt control register
#define CIA2_CRA    (*(volatile uint8_t*)0xDD0E)  // CIA2 control register A
#define CIA2_TALO   (*(volatile uint8_t*)0xDD04)  // CIA2 Timer A low byte
#define CIA2_TAHI   (*(volatile uint8_t*)0xDD05)  // CIA2 Timer A high byte
#define CPU_BANK    (*(volatile uint8_t*)0x01)    // CPU bank register
#define NMI_VECTOR  ((volatile uint8_t*)0xFFFA)   // NMI vector location

// ─── Sample data symbols (provided by linker) ─────────────────────────────────
extern const uint8_t sample_data[];       // binary audio start
extern const uint8_t sample_data_end[];   // binary audio end
#define DATASTART   (sample_data)
#define DATASTOP    (sample_data_end)

// ─── Shared state for playback ────────────────────────────────────────────────
volatile uint8_t flag = 0, sample = 0, done = 0;
volatile const uint8_t* ptr = 0;  // current playback pointer

// ─── Forward declaration ──────────────────────────────────────────────────────
void play_digi(void);
void nmi_handler(void);

// ─── play_digi: sets up SID, CIA2, NMI vector, then waits ─────────────────────
void play_digi(void) {
    __asm { PHA TXA PHA }          // Save A and X

    CIA2_ICR = 0;                  // Disable CIA2 interrupts
    (void)CIA2_ICR;                // Clear any pending interrupts
    __asm { SEI }                  // Disable IRQs globally

    CPU_BANK = 0x35;               // Bank out KERNAL to access RAM

    // Reset all SID registers
    for (uint8_t i = 0; i < 25; i++) SID[i] = 0;

    // Basic SID filter/volume config
    SID[5]  = 0;
    SID[6]  = 0xF0;
    SID[4]  = 1;
    SID[0x0C] = 0;
    SID[0x0D] = 0xF0;
    SID[0x0B] = 1;
    SID[0x13] = 0;
    SID[0x14] = 0xF0;
    SID[0x12] = 1;
    SID[0x15] = 0;
    SID[0x16] = 0x10;
    SID[0x17] = 0xF7;

    // Point NMI vector to our handler
    uint16_t addr = (uint16_t)&nmi_handler;
    NMI_VECTOR[0] = (uint8_t)(addr & 0xFF);   // Low byte
    NMI_VECTOR[1] = (uint8_t)(addr >> 8);     // High byte

    // Init playback state
    flag = 0x55;
    ptr = DATASTART;
    sample = *ptr++;              // Load first sample nibble

    // Setup CIA2 Timer A to fire NMI at ~8kHz
    CIA2_TALO = 0x80;
    CIA2_TAHI = 0x00;
    CIA2_ICR  = 0x81;             // Enable Timer A interrupt
    CIA2_CRA  = 0x11;             // Start Timer A

    done = 0;
    while (!done);               // Spin until playback is complete

    __asm { PLA TAX PLA CLI }    // Restore A, X and enable IRQs
}

// ─── NMI handler (called ~8kHz via CIA2) ──────────────────────────────────────
void nmi_handler(void) {
    __asm {
        PHA                         ; Save A

        LDA sample
        ORA #$10
        AND #$1F
        STA $D418                   ; Set SID volume (4-bit audio nibble)

        LDA $DD0D                   ; Clear CIA2 interrupt source

        ASL flag                    ; Shift flag to toggle every other call
        BCC loadnew                 ; Every 2nd NMI, load new nibble
        INC flag

        LDA sample
        LSR                         ; Shift out high nibble for next call
        STA sample
        PLA
        RTI

    loadnew:
        LDY #0
        LDA (ptr),Y                 ; Load next byte from pointer
        STA sample
        INC ptr                     ; Increment low byte of pointer
        BNE check_done
        INC ptr+1                   ; If wrapped, increment high byte

    check_done:
        LDA ptr+1
        CMP #>sample_data_end
        BNE exit_nmi
        LDA ptr
        CMP #<sample_data_end
        BNE exit_nmi

    stop_playback:
        LDA #$08
        STA $DD0E                   ; Stop Timer A
        LDA #$4F
        STA $DD0D                   ; Disable NMI source
        LDA $DD0D                   ; Clear pending
        LDA #$37
        STA $01                     ; Restore KERNAL bank
        INC done                    ; Signal completion

    exit_nmi:
        PLA
        RTI
    }
}
