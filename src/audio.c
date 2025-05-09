#include <stdio.h>
#include <include/stdint.h>
#include "audio.h"

// ─── Hardware registers & vectors ─────────────────────────────────────────────
#define SID         ((volatile uint8_t*)0xD400)
#define CIA2_ICR    (*(volatile uint8_t*)0xDD0D)
#define CIA2_CRA    (*(volatile uint8_t*)0xDD0E)
#define CIA2_TALO   (*(volatile uint8_t*)0xDD04)
#define CIA2_TAHI   (*(volatile uint8_t*)0xDD05)
#define CPU_BANK    (*(volatile uint8_t*)0x01)
#define NMI_VECTOR  ((volatile uint8_t*)0xFFFA)

// ─── Sample data symbols (linker provides these) ───────────────────────────────
extern const uint8_t sample_data[];      // start of your binary
extern const uint8_t sample_data_end[];  // one past the last byte
#define DATASTART   (sample_data)
#define DATASTOP    (sample_data_end)

// ─── Shared state for playback ─────────────────────────────────────────────────
volatile uint8_t flag, sample, done;
volatile const uint8_t* ptr;

// ─── Forward decl ──────────────────────────────────────────────────────────────
void __fastcall__ play_digi(void);
__interrupt__ void __fastcall__ nmi_handler(void);

// ─── play_digi: sets up SID, CIA2, NMI vector, then waits ────────────────────
void __fastcall__ play_digi(void) {
    // save A,X
    __asm{"PHA\nTXA\nPHA"};

    // disable interrupts
    CIA2_ICR = 0;
    (void)CIA2_ICR;
    __asm__("SEI");

    // bank out KERNAL
    CPU_BANK = 0x35;

    // clear all SID regs
    for (uint8_t i=0;i<25;i++) SID[i]=0;

    // simple voice & filter init
    SID[5]=0; SID[6]=0xF0; SID[4]=1;
    SID[0x0C]=0; SID[0x0D]=0xF0; SID[0x0B]=1;
    SID[0x13]=0; SID[0x14]=0xF0; SID[0x12]=1;
    SID[0x15]=0; SID[0x16]=0x10; SID[0x17]=0xF7;

    // point NMI vector at our handler
    uint16_t addr = (uint16_t)nmi_handler;
    NMI_VECTOR[0] = addr & 0xFF;
    NMI_VECTOR[1] = addr >> 8;

    // init playback vars
    flag = 0x55;
    ptr  = DATASTART;
    sample = *ptr++;

    // start CIA2 Timer A @8kHz
    CIA2_TALO = 0x80;
    CIA2_TAHI = 0x00;
    CIA2_ICR  = 0x81; // enable underflow NMI
    CIA2_CRA  = 0x11;

    done = 0;
    while (!done) ;   // spin until sample end

    // restore A,X and re-enable interrupts
    __asm{"PLA\nTAX\nPLA\nCLI"};
}

// ─── NMI handler in inline asm ─────────────────────────────────────────────────
__interrupt__ void __fastcall__ nmi_handler(void) {
    __asm {
        PHA                       ; save A

        LDA sample
        ORA #$10
        AND #$1F
        STA $D418                 ; SID volume

        LDA $DD0D                 ; clear CIA2 NMI

        ASL flag
        BCC loadnew
        INC flag

        LDA sample
        LSR
        STA sample
        PLA
        RTI

    loadnew:
        LDA ptr,Y                 ; load new sample nibble
        STA sample
        INC ptr                   ; low-byte
        BNE check_done
        INC ptr+1                 ; high-byte if wrapped

    check_done:
        LDA ptr+1
        CMP #>DATASTOP
        BNE exit_nmi
        LDA ptr
        CMP #<DATASTOP
        BNE exit_nmi

    stop_playback:
        LDA #$08
        STA $DD0E                 ; stop Timer A
        LDA #$4F
        STA $DD0D                 ; disable NMI source
        LDA $DD0D                 ; clear pending
        LDA #$37
        STA $01                   ; restore KERNAL bank
        INC done

    exit_nmi:
        PLA
        RTI
    }
}
