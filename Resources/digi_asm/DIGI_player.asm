.include "memoryMap.asm"
.include "3_2_1_go.asm"

.segment "CODE"

.export _play_digi

flagSeed = $55         ; flag seed, 8kHz
freq     = $80         ; CIA NMI timer delay, 8kHz
;flagSeed = $00        ; flag seed, 4Hz
;freq    = $100        ; CIA NMI timer delay, 4kHz

_play_digi:
        PHA                     ; We need to save both A
        TXA                     ;
        PHA                     ; and X as we use them

        ; disable interrupts
        LDA #$00                ; was $7f in the_c64_digi.txt
        STA $DC0D               ; ICR CIA #2
        STA $DD0D               ; read acks any pending interrupt
        LDA $DC0D
        LDA $DD0D
        SEI                     ; disables maskable interrupts

        ; switch out kernal rom while sample playing
        LDA #$35                ;
        STA $01                 ; 6510 banking register

        ; initialize SID
        LDA #$00                ; zeros out all SID registers
        LDX #$00                ;
@SIDCLR:
        STA SID,x               ; 
        INX                     ;
        BNE @SIDCLR             ;

        ; SID voices modulated too, increases volume on 8580 SIDs
        LDA #$00                ; 
        STA SID+$05             ; voice 1 Attach/Decay 
        LDA #$F0                ;
        STA SID+$06             ;         Systain/Release 
        LDA #$01                ;
        STA SID+$04             ;         ctrl 
        LDA #$00 
        STA SID+$0C             ; voice 2 Attach/Decay 
        LDA #$F0                ;
        STA SID+$0D             ;         Systain/Release 
        LDA #$01                ;
        STA SID+$0B             ;         ctrl 
        LDA #$00        
        STA SID+$13             ; voice 3 Attach/Decay 
        LDA #$F0                ;
        STA SID+$14             ;         Systain/Release 
        LDA #$01                ;
        STA SID+$12             ;         ctrl 
        LDA #$00 
        STA SID+$15             ; filter  lo 
        LDA #$10                ;
        STA SID+$16             ; filter  hi 
        LDA #$F7                ;
        STA SID+$17             ; filter  voices+reso 

        ; point to our player routine
        LDA #<NMI_HANDLER       ; set NMI handler address low byte
        STA $FFFA               ;
        LDA #>NMI_HANDLER       ; set NMI handler address hi byte
        STA $FFFB               ;

        LDA #<DATASTART         ; low byte
        STA loadnew+1           ;
        LDA #>DATASTART         ; high byte
        STA loadnew+2           ;

        LDA #flagSeed           ; initialize flag used for
        STA flag                ; indicating which nibble to play
        LDA DATASTART           ; loads first sample byte
        STA sample              ; save to temp storage address
        INC loadnew+1           ; # - increment self-mod pointer LSB

        ; setup CIA #2, do last as it starts interrupts!
        LDA #<freq              ; interrupt freq
        STA $DD04               ; TA LO
        LDA #>freq              ;
        STA $DD05               ; TA HI

        LDA #$81                ; ICR set to TMR A underflow
        STA $DD0D               ; ICR CIA #2
        LDA #$11                ;
        STA $DD0E               ; CRA interrupt enable

        LDA #$00                ;
        STA done                ; reset player done flag

pause:
        LDA done                ; player sets 'done' flag when finished, pause
        BEQ pause               ; until then for clean return to BASIC

        PLA                     ; Let's get our saved
        TAX                     ; X register and
        PLA                     ; A register back
        CLI                     ; enable maskable interrupts again
        RTS                     ; and return


;-------------------------------------------------------------------------------
; NMI handler routine, plays one 4bit sample per pass
NMI_HANDLER:        
        PHA                     ; Save state

        ; play 4-bit sample
        LDA sample              ; load sample byte
        ORA #$10                ; make sure we don't kill filter settings
        AND #$1F                ; clear any high bits
        STA SID+$18             ; save to SID volume register
        ; Removed screen clearing code
        LDA $DD0D               ; clear NMI
        ASL flag                ; shift pattern left through flag byte
        BCC loadnew             ; branch if carry clear
        INC flag                ; skip to load new byte

shftupr:
        LDA sample              ; shift upper nibble down
        LSR A                   ; shift right 1 bit
        STA sample              ; store the shifted value

        PLA                     ; restore state
        RTI                     ; return from interrupt

loadnew:
        LDA $FFFF               ; self-mod pointer to sample
        STA sample              ; save to temp location
        INC loadnew+1           ; increment pointer LSB
        BEQ @nextPage           ; did we cross a page boundary?

        PLA                     ; return to NMI
        RTI                     ; faster than branches

@nextPage:
        LDA loadnew+2           ; increment pointer MSB
        ADC #$01                ; add 1
        CMP #>DATASTOP          ; check if we're done
        BEQ @stop               ; if done, stop
        STA loadnew+2           ; save new MSB

        PLA                     ; return to NMI
        RTI                     ; faster than branches

@stop:
        LDA #$08                ; turn off NMI
        STA $DD0E               ; stop NMI timer
        LDA #$4F                ; disable CIA-2 NMIs
        STA $DD0D               ; ICR - interrupt control/status
        LDA $DD0D               ; clear any pending interrupts

        LDA #$37                ; reset kernal banking
        STA $01                 ; restore kernal

        INC done                ; set done flag
        
        PLA                     ; restore state
        RTI                     ; return from interrupt

        RTS