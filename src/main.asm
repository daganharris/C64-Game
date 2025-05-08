; Compiled with 1.31.260.0
--------------------------------------------------------------------
tworks:
00f7 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 87 4b STX $4b87 ; (spentry + 0)
0811 : a2 4e __ LDX #$4e
0813 : a0 80 __ LDY #$80
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 b1 __ CPX #$b1
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 ec __ CPY #$ec
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 ff __ CPX #$ff
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 42 __ LDA #$42
083d : 85 23 __ STA SP + 0 
083f : a9 c7 __ LDA #$c7
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 0a JSR $0a00 ; (main.s1000 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
0a00 : a2 38 __ LDX #$38
0a02 : b5 53 __ LDA T1 + 0,x 
0a04 : 9d 44 c7 STA $c744,x ; (main@stack + 0)
0a07 : ca __ __ DEX
0a08 : 10 f8 __ BPL $0a02 ; (main.s1000 + 2)
0a0a : 38 __ __ SEC
0a0b : a5 23 __ LDA SP + 0 
0a0d : e9 06 __ SBC #$06
0a0f : 85 23 __ STA SP + 0 
0a11 : b0 02 __ BCS $0a15 ; (main.s0 + 0)
0a13 : c6 24 __ DEC SP + 1 
.s0:
0a15 : a9 36 __ LDA #$36
0a17 : 85 01 __ STA $01 
0a19 : a9 3b __ LDA #$3b
0a1b : 8d 11 d0 STA $d011 
0a1e : a9 08 __ LDA #$08
0a20 : 8d 16 d0 STA $d016 
0a23 : ad 00 dd LDA $dd00 
0a26 : 29 fc __ AND #$fc
0a28 : 8d 00 dd STA $dd00 
0a2b : a9 28 __ LDA #$28
0a2d : 8d 18 d0 STA $d018 
0a30 : a9 01 __ LDA #$01
0a32 : 8d 21 d0 STA $d021 
0a35 : 8d 20 d0 STA $d020 
0a38 : a9 00 __ LDA #$00
0a3a : 85 0f __ STA P2 
0a3c : 85 10 __ STA P3 
0a3e : a9 db __ LDA #$db
0a40 : 8d fa ff STA $fffa 
0a43 : a9 28 __ LDA #$28
0a45 : 8d fb ff STA $fffb 
0a48 : a9 00 __ LDA #$00
0a4a : 8d fe ff STA $fffe 
0a4d : a9 29 __ LDA #$29
0a4f : 8d ff ff STA $ffff 
0a52 : a9 35 __ LDA #$35
0a54 : 85 01 __ STA $01 
0a56 : a9 40 __ LDA #$40
0a58 : 85 11 __ STA P4 
0a5a : a9 1f __ LDA #$1f
0a5c : 85 12 __ STA P5 
0a5e : a9 01 __ LDA #$01
0a60 : a2 fa __ LDX #$fa
.l1003:
0a62 : ca __ __ DEX
0a63 : 9d 00 c8 STA $c800,x 
0a66 : 9d fa c8 STA $c8fa,x 
0a69 : 9d f4 c9 STA $c9f4,x 
0a6c : 9d ee ca STA $caee,x 
0a6f : d0 f1 __ BNE $0a62 ; (main.l1003 + 0)
.s1002:
0a71 : a9 00 __ LDA #$00
0a73 : 85 0d __ STA P0 
0a75 : a9 e0 __ LDA #$e0
0a77 : 85 0e __ STA P1 
0a79 : 20 17 29 JSR $2917 ; (memset.s0 + 0)
0a7c : a2 00 __ LDX #$00
.l1134:
0a7e : bd 34 29 LDA $2934,x 
0a81 : e8 __ __ INX
0a82 : a8 __ __ TAY
0a83 : d0 f9 __ BNE $0a7e ; (main.l1134 + 0)
.s1135:
0a85 : 86 17 __ STX P10 
0a87 : 85 13 __ STA P6 
0a89 : 85 14 __ STA P7 
0a8b : a9 33 __ LDA #$33
0a8d : 85 15 __ STA P8 
0a8f : a9 29 __ LDA #$29
0a91 : 85 16 __ STA P9 
0a93 : 20 46 29 JSR $2946 ; (bm_put_chars.s1000 + 0)
0a96 : a9 00 __ LDA #$00
0a98 : 85 5f __ STA T4 + 0 
0a9a : 85 53 __ STA T1 + 0 
.l15:
0a9c : a5 53 __ LDA T1 + 0 
0a9e : 0a __ __ ASL
0a9f : 0a __ __ ASL
0aa0 : 85 57 __ STA T2 + 0 
0aa2 : a9 00 __ LDA #$00
0aa4 : 85 63 __ STA T5 + 0 
.l17:
0aa6 : a5 5f __ LDA T4 + 0 
0aa8 : c5 63 __ CMP T5 + 0 
0aaa : d0 06 __ BNE $0ab2 ; (main.s290 + 0)
.s289:
0aac : a9 3f __ LDA #$3f
0aae : a0 80 __ LDY #$80
0ab0 : d0 03 __ BNE $0ab5 ; (main.s291 + 0)
.s290:
0ab2 : a9 00 __ LDA #$00
0ab4 : a8 __ __ TAY
.s291:
0ab5 : 85 46 __ STA T0 + 3 
0ab7 : a5 57 __ LDA T2 + 0 
0ab9 : 0a __ __ ASL
0aba : 0a __ __ ASL
0abb : aa __ __ TAX
0abc : a9 00 __ LDA #$00
0abe : 9d c0 4f STA $4fc0,x ; (wmat + 0)
0ac1 : 9d c1 4f STA $4fc1,x ; (wmat + 1)
0ac4 : 98 __ __ TYA
0ac5 : 9d c2 4f STA $4fc2,x ; (wmat + 2)
0ac8 : a5 46 __ LDA T0 + 3 
0aca : 9d c3 4f STA $4fc3,x ; (wmat + 3)
0acd : e6 57 __ INC T2 + 0 
0acf : e6 63 __ INC T5 + 0 
0ad1 : a5 63 __ LDA T5 + 0 
0ad3 : c9 04 __ CMP #$04
0ad5 : 90 cf __ BCC $0aa6 ; (main.l17 + 0)
.s16:
0ad7 : e6 53 __ INC T1 + 0 
0ad9 : e6 5f __ INC T4 + 0 
0adb : a5 5f __ LDA T4 + 0 
0add : c9 04 __ CMP #$04
0adf : 90 bb __ BCC $0a9c ; (main.l15 + 0)
.s14:
0ae1 : a9 00 __ LDA #$00
0ae3 : 8d 00 51 STA $5100 ; (pmat + 0)
0ae6 : 8d 01 51 STA $5101 ; (pmat + 1)
0ae9 : 8d 04 51 STA $5104 ; (pmat + 4)
0aec : 8d 05 51 STA $5105 ; (pmat + 5)
0aef : 8d 06 51 STA $5106 ; (pmat + 6)
0af2 : 8d 07 51 STA $5107 ; (pmat + 7)
0af5 : 8d 08 51 STA $5108 ; (pmat + 8)
0af8 : 8d 09 51 STA $5109 ; (pmat + 9)
0afb : 8d 0a 51 STA $510a ; (pmat + 10)
0afe : 8d 0b 51 STA $510b ; (pmat + 11)
0b01 : 8d 0c 51 STA $510c ; (pmat + 12)
0b04 : 8d 0d 51 STA $510d ; (pmat + 13)
0b07 : 8d 0e 51 STA $510e ; (pmat + 14)
0b0a : 8d 0f 51 STA $510f ; (pmat + 15)
0b0d : 8d 10 51 STA $5110 ; (pmat + 16)
0b10 : 8d 11 51 STA $5111 ; (pmat + 17)
0b13 : 8d 12 51 STA $5112 ; (pmat + 18)
0b16 : 8d 13 51 STA $5113 ; (pmat + 19)
0b19 : 8d 14 51 STA $5114 ; (pmat + 20)
0b1c : 8d 15 51 STA $5115 ; (pmat + 21)
0b1f : 8d 18 51 STA $5118 ; (pmat + 24)
0b22 : 8d 19 51 STA $5119 ; (pmat + 25)
0b25 : 8d 1a 51 STA $511a ; (pmat + 26)
0b28 : 8d 1b 51 STA $511b ; (pmat + 27)
0b2b : 8d 1c 51 STA $511c ; (pmat + 28)
0b2e : 8d 1d 51 STA $511d ; (pmat + 29)
0b31 : 8d 1e 51 STA $511e ; (pmat + 30)
0b34 : 8d 1f 51 STA $511f ; (pmat + 31)
0b37 : 8d 20 51 STA $5120 ; (pmat + 32)
0b3a : 8d 21 51 STA $5121 ; (pmat + 33)
0b3d : 8d 22 51 STA $5122 ; (pmat + 34)
0b40 : 8d 23 51 STA $5123 ; (pmat + 35)
0b43 : 8d 24 51 STA $5124 ; (pmat + 36)
0b46 : 8d 25 51 STA $5125 ; (pmat + 37)
0b49 : 8d 26 51 STA $5126 ; (pmat + 38)
0b4c : 8d 27 51 STA $5127 ; (pmat + 39)
0b4f : 8d 28 51 STA $5128 ; (pmat + 40)
0b52 : 8d 29 51 STA $5129 ; (pmat + 41)
0b55 : 8d 2c 51 STA $512c ; (pmat + 44)
0b58 : 8d 2d 51 STA $512d ; (pmat + 45)
0b5b : 8d 30 51 STA $5130 ; (pmat + 48)
0b5e : 8d 31 51 STA $5131 ; (pmat + 49)
0b61 : 8d 32 51 STA $5132 ; (pmat + 50)
0b64 : 8d 33 51 STA $5133 ; (pmat + 51)
0b67 : 8d 34 51 STA $5134 ; (pmat + 52)
0b6a : 8d 35 51 STA $5135 ; (pmat + 53)
0b6d : 8d 36 51 STA $5136 ; (pmat + 54)
0b70 : 8d 37 51 STA $5137 ; (pmat + 55)
0b73 : 8d 38 51 STA $5138 ; (pmat + 56)
0b76 : 8d 39 51 STA $5139 ; (pmat + 57)
0b79 : 8d 3a 51 STA $513a ; (pmat + 58)
0b7c : 8d 3b 51 STA $513b ; (pmat + 59)
0b7f : 8d 3c 51 STA $513c ; (pmat + 60)
0b82 : 8d 3d 51 STA $513d ; (pmat + 61)
0b85 : 8d 3e 51 STA $513e ; (pmat + 62)
0b88 : 8d 3f 51 STA $513f ; (pmat + 63)
0b8b : a9 80 __ LDA #$80
0b8d : 8d 02 51 STA $5102 ; (pmat + 2)
0b90 : 8d 16 51 STA $5116 ; (pmat + 22)
0b93 : 8d 2a 51 STA $512a ; (pmat + 42)
0b96 : 8d 2e 51 STA $512e ; (pmat + 46)
0b99 : a9 3f __ LDA #$3f
0b9b : 8d 03 51 STA $5103 ; (pmat + 3)
0b9e : 8d 17 51 STA $5117 ; (pmat + 23)
0ba1 : 8d 2b 51 STA $512b ; (pmat + 43)
0ba4 : 8d 2f 51 STA $512f ; (pmat + 47)
0ba7 : a9 00 __ LDA #$00
0ba9 : 85 6b __ STA T8 + 0 
0bab : 85 6c __ STA T8 + 1 
0bad : a9 f1 __ LDA #$f1
0baf : 85 67 __ STA T7 + 0 
0bb1 : a9 ff __ LDA #$ff
0bb3 : 85 68 __ STA T7 + 1 
.l18:
0bb5 : a5 67 __ LDA T7 + 0 
0bb7 : 85 1b __ STA ACCU + 0 
0bb9 : a5 68 __ LDA T7 + 1 
0bbb : 85 1c __ STA ACCU + 1 
0bbd : 20 b3 48 JSR $48b3 ; (sint16_to_float + 0)
0bc0 : a9 88 __ LDA #$88
0bc2 : 85 04 __ STA WORK + 1 
0bc4 : 85 05 __ STA WORK + 2 
0bc6 : 20 ed 4a JSR $4aed ; (freg@proxy + 0)
0bc9 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0bcc : a5 1b __ LDA ACCU + 0 
0bce : 85 5b __ STA T3 + 0 
0bd0 : a5 1c __ LDA ACCU + 1 
0bd2 : 85 5c __ STA T3 + 1 
0bd4 : a5 1d __ LDA ACCU + 2 
0bd6 : 85 5d __ STA T3 + 2 
0bd8 : a5 1e __ LDA ACCU + 3 
0bda : 85 5e __ STA T3 + 3 
0bdc : a2 1b __ LDX #$1b
0bde : 20 61 45 JSR $4561 ; (freg + 4)
0be1 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0be4 : a5 1b __ LDA ACCU + 0 
0be6 : 85 5f __ STA T4 + 0 
0be8 : a5 1c __ LDA ACCU + 1 
0bea : 85 60 __ STA T4 + 1 
0bec : a5 1d __ LDA ACCU + 2 
0bee : 85 61 __ STA T4 + 2 
0bf0 : a5 1e __ LDA ACCU + 3 
0bf2 : 85 62 __ STA T4 + 3 
0bf4 : a9 00 __ LDA #$00
0bf6 : 85 6f __ STA T9 + 0 
.l21:
0bf8 : 38 __ __ SEC
0bf9 : a9 0f __ LDA #$0f
0bfb : e5 6f __ SBC T9 + 0 
0bfd : 85 1b __ STA ACCU + 0 
0bff : a9 00 __ LDA #$00
0c01 : e9 00 __ SBC #$00
0c03 : 85 1c __ STA ACCU + 1 
0c05 : 20 b3 48 JSR $48b3 ; (sint16_to_float + 0)
0c08 : a9 88 __ LDA #$88
0c0a : 85 04 __ STA WORK + 1 
0c0c : 85 05 __ STA WORK + 2 
0c0e : 20 ed 4a JSR $4aed ; (freg@proxy + 0)
0c11 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0c14 : a5 1b __ LDA ACCU + 0 
0c16 : 85 63 __ STA T5 + 0 
0c18 : a5 1c __ LDA ACCU + 1 
0c1a : 85 64 __ STA T5 + 1 
0c1c : a5 1d __ LDA ACCU + 2 
0c1e : 85 65 __ STA T5 + 2 
0c20 : a5 1e __ LDA ACCU + 3 
0c22 : 85 66 __ STA T5 + 3 
0c24 : a2 1b __ LDX #$1b
0c26 : 20 61 45 JSR $4561 ; (freg + 4)
0c29 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0c2c : a2 5f __ LDX #$5f
0c2e : 20 61 45 JSR $4561 ; (freg + 4)
0c31 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
0c34 : a5 1b __ LDA ACCU + 0 
0c36 : 85 43 __ STA T0 + 0 
0c38 : a5 1c __ LDA ACCU + 1 
0c3a : 85 44 __ STA T0 + 1 
0c3c : a5 1e __ LDA ACCU + 3 
0c3e : 85 46 __ STA T0 + 3 
0c40 : 29 7f __ AND #$7f
0c42 : 05 1d __ ORA ACCU + 2 
0c44 : 05 1c __ ORA ACCU + 1 
0c46 : a6 1d __ LDX ACCU + 2 
0c48 : 86 45 __ STX T0 + 2 
0c4a : 05 1b __ ORA ACCU + 0 
0c4c : d0 03 __ BNE $0c51 ; (main.s1133 + 0)
0c4e : 4c dc 27 JMP $27dc ; (main.s23 + 0)
.s1133:
0c51 : 24 1e __ BIT ACCU + 3 
0c53 : 10 f9 __ BPL $0c4e ; (main.l21 + 86)
.s24:
0c55 : a9 00 __ LDA #$00
0c57 : 85 53 __ STA T1 + 0 
0c59 : 85 54 __ STA T1 + 1 
0c5b : 85 55 __ STA T1 + 2 
.s22:
0c5d : 85 56 __ STA T1 + 3 
0c5f : a9 00 __ LDA #$00
0c61 : 85 1b __ STA ACCU + 0 
0c63 : 85 1c __ STA ACCU + 1 
0c65 : a9 80 __ LDA #$80
0c67 : 85 1d __ STA ACCU + 2 
0c69 : a9 41 __ LDA #$41
0c6b : 85 1e __ STA ACCU + 3 
0c6d : a2 53 __ LDX #$53
0c6f : 20 61 45 JSR $4561 ; (freg + 4)
0c72 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0c75 : 20 d3 4a JSR $4ad3 ; (freg@proxy + 0)
0c78 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
0c7b : 20 d4 32 JSR $32d4 ; (sin@proxy + 0)
0c7e : a5 1b __ LDA ACCU + 0 
0c80 : 85 57 __ STA T2 + 0 
0c82 : a5 1c __ LDA ACCU + 1 
0c84 : 85 58 __ STA T2 + 1 
0c86 : a5 1d __ LDA ACCU + 2 
0c88 : 85 59 __ STA T2 + 2 
0c8a : a5 1e __ LDA ACCU + 3 
0c8c : 85 5a __ STA T2 + 3 
0c8e : a9 00 __ LDA #$00
0c90 : 85 1b __ STA ACCU + 0 
0c92 : 85 1c __ STA ACCU + 1 
0c94 : 85 1d __ STA ACCU + 2 
0c96 : a9 c0 __ LDA #$c0
0c98 : 85 1e __ STA ACCU + 3 
0c9a : a2 53 __ LDX #$53
0c9c : 20 61 45 JSR $4561 ; (freg + 4)
0c9f : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0ca2 : a5 1b __ LDA ACCU + 0 
0ca4 : 85 0d __ STA P0 
0ca6 : a5 1c __ LDA ACCU + 1 
0ca8 : 85 0e __ STA P1 
0caa : a5 1d __ LDA ACCU + 2 
0cac : 85 0f __ STA P2 
0cae : a5 1e __ LDA ACCU + 3 
0cb0 : 85 10 __ STA P3 
0cb2 : 20 0d 35 JSR $350d ; (exp.s0 + 0)
0cb5 : a5 1b __ LDA ACCU + 0 
0cb7 : 85 43 __ STA T0 + 0 
0cb9 : a5 1c __ LDA ACCU + 1 
0cbb : 85 44 __ STA T0 + 1 
0cbd : a5 1d __ LDA ACCU + 2 
0cbf : 85 45 __ STA T0 + 2 
0cc1 : a5 1e __ LDA ACCU + 3 
0cc3 : 85 46 __ STA T0 + 3 
0cc5 : a9 74 __ LDA #$74
0cc7 : 85 1b __ STA ACCU + 0 
0cc9 : a9 01 __ LDA #$01
0ccb : 85 1c __ STA ACCU + 1 
0ccd : a5 6f __ LDA T9 + 0 
0ccf : 20 25 45 JSR $4525 ; (mul16by8 + 0)
0cd2 : 18 __ __ CLC
0cd3 : a5 1b __ LDA ACCU + 0 
0cd5 : 65 6b __ ADC T8 + 0 
0cd7 : a8 __ __ TAY
0cd8 : a5 1c __ LDA ACCU + 1 
0cda : 65 6c __ ADC T8 + 1 
0cdc : aa __ __ TAX
0cdd : 98 __ __ TYA
0cde : 18 __ __ CLC
0cdf : 69 40 __ ADC #$40
0ce1 : 85 47 __ STA T6 + 0 
0ce3 : 8a __ __ TXA
0ce4 : 69 51 __ ADC #$51
0ce6 : 85 48 __ STA T6 + 1 
0ce8 : a5 5b __ LDA T3 + 0 
0cea : a0 00 __ LDY #$00
0cec : 91 47 __ STA (T6 + 0),y 
0cee : a5 5c __ LDA T3 + 1 
0cf0 : c8 __ __ INY
0cf1 : 91 47 __ STA (T6 + 0),y 
0cf3 : a5 5d __ LDA T3 + 2 
0cf5 : c8 __ __ INY
0cf6 : 91 47 __ STA (T6 + 0),y 
0cf8 : a5 5e __ LDA T3 + 3 
0cfa : c8 __ __ INY
0cfb : 91 47 __ STA (T6 + 0),y 
0cfd : a5 63 __ LDA T5 + 0 
0cff : a0 08 __ LDY #$08
0d01 : 91 47 __ STA (T6 + 0),y 
0d03 : a5 64 __ LDA T5 + 1 
0d05 : c8 __ __ INY
0d06 : 91 47 __ STA (T6 + 0),y 
0d08 : a5 65 __ LDA T5 + 2 
0d0a : c8 __ __ INY
0d0b : 91 47 __ STA (T6 + 0),y 
0d0d : a5 66 __ LDA T5 + 3 
0d0f : c8 __ __ INY
0d10 : 91 47 __ STA (T6 + 0),y 
0d12 : a5 57 __ LDA T2 + 0 
0d14 : 85 53 __ STA T1 + 0 
0d16 : a5 58 __ LDA T2 + 1 
0d18 : 85 54 __ STA T1 + 1 
0d1a : a5 59 __ LDA T2 + 2 
0d1c : 85 55 __ STA T1 + 2 
0d1e : a5 5a __ LDA T2 + 3 
0d20 : 49 80 __ EOR #$80
0d22 : 85 56 __ STA T1 + 3 
0d24 : a2 53 __ LDX #$53
0d26 : 20 74 4b JSR $4b74 ; (freg@proxy + 0)
0d29 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0d2c : a9 00 __ LDA #$00
0d2e : 85 03 __ STA WORK + 0 
0d30 : 85 04 __ STA WORK + 1 
0d32 : 85 05 __ STA WORK + 2 
0d34 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
0d37 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0d3a : a5 1b __ LDA ACCU + 0 
0d3c : a0 04 __ LDY #$04
0d3e : 91 47 __ STA (T6 + 0),y 
0d40 : a5 1c __ LDA ACCU + 1 
0d42 : c8 __ __ INY
0d43 : 91 47 __ STA (T6 + 0),y 
0d45 : a5 1d __ LDA ACCU + 2 
0d47 : c8 __ __ INY
0d48 : 91 47 __ STA (T6 + 0),y 
0d4a : a5 1e __ LDA ACCU + 3 
0d4c : c8 __ __ INY
0d4d : 91 47 __ STA (T6 + 0),y 
0d4f : e6 6f __ INC T9 + 0 
0d51 : a5 6f __ LDA T9 + 0 
0d53 : c9 1f __ CMP #$1f
0d55 : b0 03 __ BCS $0d5a ; (main.s19 + 0)
0d57 : 4c f8 0b JMP $0bf8 ; (main.l21 + 0)
.s19:
0d5a : e6 67 __ INC T7 + 0 
0d5c : d0 02 __ BNE $0d60 ; (main.s1149 + 0)
.s1148:
0d5e : e6 68 __ INC T7 + 1 
.s1149:
0d60 : 18 __ __ CLC
0d61 : a5 6b __ LDA T8 + 0 
0d63 : 69 0c __ ADC #$0c
0d65 : 85 6b __ STA T8 + 0 
0d67 : a5 6c __ LDA T8 + 1 
0d69 : 69 00 __ ADC #$00
0d6b : 85 6c __ STA T8 + 1 
0d6d : c9 01 __ CMP #$01
0d6f : f0 03 __ BEQ $0d74 ; (main.s1130 + 0)
0d71 : 4c b5 0b JMP $0bb5 ; (main.l18 + 0)
.s1130:
0d74 : a5 6b __ LDA T8 + 0 
0d76 : c9 74 __ CMP #$74
0d78 : d0 f7 __ BNE $0d71 ; (main.s1149 + 17)
.s20:
0d7a : a2 00 __ LDX #$00
.l1136:
0d7c : bd 3f 36 LDA $363f,x 
0d7f : e8 __ __ INX
0d80 : a8 __ __ TAY
0d81 : d0 f9 __ BNE $0d7c ; (main.l1136 + 0)
.s1137:
0d83 : 86 17 __ STX P10 
0d85 : a9 08 __ LDA #$08
0d87 : 85 13 __ STA P6 
0d89 : a9 36 __ LDA #$36
0d8b : 85 16 __ STA P9 
0d8d : a9 3e __ LDA #$3e
0d8f : 85 15 __ STA P8 
0d91 : 20 f9 28 JSR $28f9 ; (bm_put_chars@proxy + 0)
0d94 : a9 00 __ LDA #$00
0d96 : 8d e3 4d STA $4de3 ; (vlight + 0)
0d99 : 8d e4 4d STA $4de4 ; (vlight + 1)
0d9c : 8d e5 4d STA $4de5 ; (vlight + 2)
0d9f : 8d e7 4d STA $4de7 ; (vlight + 4)
0da2 : 8d e8 4d STA $4de8 ; (vlight + 5)
0da5 : 8d e9 4d STA $4de9 ; (vlight + 6)
0da8 : 8d eb 4d STA $4deb ; (vlight + 8)
0dab : 8d ec 4d STA $4dec ; (vlight + 9)
0dae : a9 40 __ LDA #$40
0db0 : 85 46 __ STA T0 + 3 
0db2 : 8d e6 4d STA $4de6 ; (vlight + 3)
0db5 : a9 c0 __ LDA #$c0
0db7 : 8d ea 4d STA $4dea ; (vlight + 7)
0dba : a9 bf __ LDA #$bf
0dbc : 8d ee 4d STA $4dee ; (vlight + 11)
0dbf : a9 10 __ LDA #$10
0dc1 : 85 1d __ STA ACCU + 2 
0dc3 : a9 41 __ LDA #$41
0dc5 : 85 1e __ STA ACCU + 3 
0dc7 : a9 80 __ LDA #$80
0dc9 : 8d ed 4d STA $4ded ; (vlight + 10)
0dcc : a9 00 __ LDA #$00
0dce : 85 43 __ STA T0 + 0 
0dd0 : 85 44 __ STA T0 + 1 
0dd2 : 85 45 __ STA T0 + 2 
0dd4 : 85 1b __ STA ACCU + 0 
0dd6 : 85 1c __ STA ACCU + 1 
0dd8 : a2 43 __ LDX #$43
0dda : 20 61 45 JSR $4561 ; (freg + 4)
0ddd : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
0de0 : a2 43 __ LDX #$43
0de2 : 20 61 45 JSR $4561 ; (freg + 4)
0de5 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
0de8 : a9 00 __ LDA #$00
0dea : 85 03 __ STA WORK + 0 
0dec : 85 04 __ STA WORK + 1 
0dee : 85 05 __ STA WORK + 2 
0df0 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
0df3 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0df6 : a5 1b __ LDA ACCU + 0 
0df8 : 85 43 __ STA T0 + 0 
0dfa : a5 1c __ LDA ACCU + 1 
0dfc : 85 44 __ STA T0 + 1 
0dfe : a5 1d __ LDA ACCU + 2 
0e00 : 85 45 __ STA T0 + 2 
0e02 : a5 1e __ LDA ACCU + 3 
0e04 : 85 46 __ STA T0 + 3 
0e06 : a9 00 __ LDA #$00
0e08 : 85 1b __ STA ACCU + 0 
0e0a : 85 1c __ STA ACCU + 1 
0e0c : a2 43 __ LDX #$43
0e0e : 20 69 4b JSR $4b69 ; (freg@proxy + 0)
0e11 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
0e14 : a2 43 __ LDX #$43
0e16 : 20 61 45 JSR $4561 ; (freg + 4)
0e19 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
0e1c : a9 00 __ LDA #$00
0e1e : 85 03 __ STA WORK + 0 
0e20 : 85 04 __ STA WORK + 1 
0e22 : 85 05 __ STA WORK + 2 
0e24 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
0e27 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0e2a : a5 1b __ LDA ACCU + 0 
0e2c : 85 43 __ STA T0 + 0 
0e2e : a5 1c __ LDA ACCU + 1 
0e30 : 85 44 __ STA T0 + 1 
0e32 : a5 1d __ LDA ACCU + 2 
0e34 : 85 45 __ STA T0 + 2 
0e36 : a5 1e __ LDA ACCU + 3 
0e38 : 85 46 __ STA T0 + 3 
0e3a : a9 00 __ LDA #$00
0e3c : 85 1b __ STA ACCU + 0 
0e3e : 85 1c __ STA ACCU + 1 
0e40 : a2 43 __ LDX #$43
0e42 : 20 69 4b JSR $4b69 ; (freg@proxy + 0)
0e45 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
0e48 : a2 43 __ LDX #$43
0e4a : 20 61 45 JSR $4561 ; (freg + 4)
0e4d : 20 a8 45 JSR $45a8 ; (faddsub + 6)
0e50 : a9 00 __ LDA #$00
0e52 : 85 03 __ STA WORK + 0 
0e54 : 85 04 __ STA WORK + 1 
0e56 : 85 05 __ STA WORK + 2 
0e58 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
0e5b : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0e5e : a5 1b __ LDA ACCU + 0 
0e60 : 85 43 __ STA T0 + 0 
0e62 : a5 1c __ LDA ACCU + 1 
0e64 : 85 44 __ STA T0 + 1 
0e66 : a5 1d __ LDA ACCU + 2 
0e68 : 85 45 __ STA T0 + 2 
0e6a : a5 1e __ LDA ACCU + 3 
0e6c : 85 46 __ STA T0 + 3 
0e6e : a9 00 __ LDA #$00
0e70 : 85 1b __ STA ACCU + 0 
0e72 : 85 1c __ STA ACCU + 1 
0e74 : a2 43 __ LDX #$43
0e76 : 20 69 4b JSR $4b69 ; (freg@proxy + 0)
0e79 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
0e7c : a2 43 __ LDX #$43
0e7e : 20 61 45 JSR $4561 ; (freg + 4)
0e81 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
0e84 : a9 00 __ LDA #$00
0e86 : 85 03 __ STA WORK + 0 
0e88 : 85 04 __ STA WORK + 1 
0e8a : 85 05 __ STA WORK + 2 
0e8c : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
0e8f : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0e92 : a5 1b __ LDA ACCU + 0 
0e94 : 85 43 __ STA T0 + 0 
0e96 : a5 1c __ LDA ACCU + 1 
0e98 : 85 44 __ STA T0 + 1 
0e9a : a5 1d __ LDA ACCU + 2 
0e9c : 85 45 __ STA T0 + 2 
0e9e : a5 1e __ LDA ACCU + 3 
0ea0 : 85 46 __ STA T0 + 3 
0ea2 : a9 00 __ LDA #$00
0ea4 : 85 57 __ STA T2 + 0 
0ea6 : 85 1b __ STA ACCU + 0 
0ea8 : 85 1c __ STA ACCU + 1 
0eaa : a2 43 __ LDX #$43
0eac : 20 5e 4b JSR $4b5e ; (freg@proxy + 0)
0eaf : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
0eb2 : a5 1b __ LDA ACCU + 0 
0eb4 : 85 43 __ STA T0 + 0 
0eb6 : a5 1c __ LDA ACCU + 1 
0eb8 : 85 44 __ STA T0 + 1 
0eba : a5 1d __ LDA ACCU + 2 
0ebc : 85 45 __ STA T0 + 2 
0ebe : a5 1e __ LDA ACCU + 3 
0ec0 : 85 46 __ STA T0 + 3 
.l30:
0ec2 : a6 57 __ LDX T2 + 0 
0ec4 : bd e3 4d LDA $4de3,x ; (vlight + 0)
0ec7 : 85 1b __ STA ACCU + 0 
0ec9 : bd e4 4d LDA $4de4,x ; (vlight + 1)
0ecc : 85 1c __ STA ACCU + 1 
0ece : bd e5 4d LDA $4de5,x ; (vlight + 2)
0ed1 : 85 1d __ STA ACCU + 2 
0ed3 : bd e6 4d LDA $4de6,x ; (vlight + 3)
0ed6 : 85 1e __ STA ACCU + 3 
0ed8 : a2 43 __ LDX #$43
0eda : 20 61 45 JSR $4561 ; (freg + 4)
0edd : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0ee0 : a5 1b __ LDA ACCU + 0 
0ee2 : a6 57 __ LDX T2 + 0 
0ee4 : 9d e3 4d STA $4de3,x ; (vlight + 0)
0ee7 : a5 1c __ LDA ACCU + 1 
0ee9 : 9d e4 4d STA $4de4,x ; (vlight + 1)
0eec : a5 1d __ LDA ACCU + 2 
0eee : 9d e5 4d STA $4de5,x ; (vlight + 2)
0ef1 : a5 1e __ LDA ACCU + 3 
0ef3 : 9d e6 4d STA $4de6,x ; (vlight + 3)
0ef6 : 8a __ __ TXA
0ef7 : 18 __ __ CLC
0ef8 : 69 04 __ ADC #$04
0efa : 85 57 __ STA T2 + 0 
0efc : c9 0c __ CMP #$0c
0efe : d0 c2 __ BNE $0ec2 ; (main.l30 + 0)
.s27:
0f00 : a9 00 __ LDA #$00
.l32:
0f02 : 85 53 __ STA T1 + 0 
0f04 : aa __ __ TAX
0f05 : bd c0 4f LDA $4fc0,x ; (wmat + 0)
0f08 : 85 1b __ STA ACCU + 0 
0f0a : bd c1 4f LDA $4fc1,x ; (wmat + 1)
0f0d : 85 1c __ STA ACCU + 1 
0f0f : bd c2 4f LDA $4fc2,x ; (wmat + 2)
0f12 : 85 1d __ STA ACCU + 2 
0f14 : bd c3 4f LDA $4fc3,x ; (wmat + 3)
0f17 : 85 1e __ STA ACCU + 3 
0f19 : a9 00 __ LDA #$00
0f1b : 85 03 __ STA WORK + 0 
0f1d : 85 04 __ STA WORK + 1 
0f1f : a9 90 __ LDA #$90
0f21 : 85 05 __ STA WORK + 2 
0f23 : 20 cc 4a JSR $4acc ; (freg@proxy + 0)
0f26 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
0f29 : a5 1b __ LDA ACCU + 0 
0f2b : a6 53 __ LDX T1 + 0 
0f2d : 9d c0 4f STA $4fc0,x ; (wmat + 0)
0f30 : a5 1c __ LDA ACCU + 1 
0f32 : 9d c1 4f STA $4fc1,x ; (wmat + 1)
0f35 : a5 1d __ LDA ACCU + 2 
0f37 : 9d c2 4f STA $4fc2,x ; (wmat + 2)
0f3a : a5 1e __ LDA ACCU + 3 
0f3c : 9d c3 4f STA $4fc3,x ; (wmat + 3)
0f3f : 8a __ __ TXA
0f40 : 18 __ __ CLC
0f41 : 69 04 __ ADC #$04
0f43 : c9 40 __ CMP #$40
0f45 : d0 bb __ BNE $0f02 ; (main.l32 + 0)
.s31:
0f47 : a9 ef __ LDA #$ef
0f49 : 8d 8c 7e STA $7e8c ; (tmat + 0)
0f4c : 8d b4 7e STA $7eb4 ; (tmat + 40)
0f4f : a9 90 __ LDA #$90
0f51 : 8d 8d 7e STA $7e8d ; (tmat + 1)
0f54 : 8d b5 7e STA $7eb5 ; (tmat + 41)
0f57 : a9 74 __ LDA #$74
0f59 : 8d 8e 7e STA $7e8e ; (tmat + 2)
0f5c : 8d b6 7e STA $7eb6 ; (tmat + 42)
0f5f : a9 3f __ LDA #$3f
0f61 : 8d 8f 7e STA $7e8f ; (tmat + 3)
0f64 : 8d a3 7e STA $7ea3 ; (tmat + 23)
0f67 : 8d b7 7e STA $7eb7 ; (tmat + 43)
0f6a : 8d cb 7e STA $7ecb ; (tmat + 63)
0f6d : 8d 4f 7e STA $7e4f ; (rmat + 3)
0f70 : 8d 63 7e STA $7e63 ; (rmat + 23)
0f73 : 8d 67 7e STA $7e67 ; (rmat + 27)
0f76 : 8d 77 7e STA $7e77 ; (rmat + 43)
0f79 : 8d 8b 7e STA $7e8b ; (rmat + 63)
0f7c : a9 00 __ LDA #$00
0f7e : 85 6b __ STA T8 + 0 
0f80 : 8d 90 7e STA $7e90 ; (tmat + 4)
0f83 : 8d 91 7e STA $7e91 ; (tmat + 5)
0f86 : 8d 92 7e STA $7e92 ; (tmat + 6)
0f89 : 8d 93 7e STA $7e93 ; (tmat + 7)
0f8c : 8d 98 7e STA $7e98 ; (tmat + 12)
0f8f : 8d 99 7e STA $7e99 ; (tmat + 13)
0f92 : 8d 9a 7e STA $7e9a ; (tmat + 14)
0f95 : 8d 9b 7e STA $7e9b ; (tmat + 15)
0f98 : 8d 9c 7e STA $7e9c ; (tmat + 16)
0f9b : 8d 9d 7e STA $7e9d ; (tmat + 17)
0f9e : 8d 9e 7e STA $7e9e ; (tmat + 18)
0fa1 : 8d 9f 7e STA $7e9f ; (tmat + 19)
0fa4 : 8d a0 7e STA $7ea0 ; (tmat + 20)
0fa7 : 8d a1 7e STA $7ea1 ; (tmat + 21)
0faa : 8d a4 7e STA $7ea4 ; (tmat + 24)
0fad : 8d a5 7e STA $7ea5 ; (tmat + 25)
0fb0 : 8d a6 7e STA $7ea6 ; (tmat + 26)
0fb3 : 8d a7 7e STA $7ea7 ; (tmat + 27)
0fb6 : 8d a8 7e STA $7ea8 ; (tmat + 28)
0fb9 : 8d a9 7e STA $7ea9 ; (tmat + 29)
0fbc : 8d aa 7e STA $7eaa ; (tmat + 30)
0fbf : 8d ab 7e STA $7eab ; (tmat + 31)
0fc2 : 8d b0 7e STA $7eb0 ; (tmat + 36)
0fc5 : 8d b1 7e STA $7eb1 ; (tmat + 37)
0fc8 : 8d b2 7e STA $7eb2 ; (tmat + 38)
0fcb : 8d b3 7e STA $7eb3 ; (tmat + 39)
0fce : 8d b8 7e STA $7eb8 ; (tmat + 44)
0fd1 : 8d b9 7e STA $7eb9 ; (tmat + 45)
0fd4 : 8d ba 7e STA $7eba ; (tmat + 46)
0fd7 : 8d bb 7e STA $7ebb ; (tmat + 47)
0fda : 8d bc 7e STA $7ebc ; (tmat + 48)
0fdd : 8d bd 7e STA $7ebd ; (tmat + 49)
0fe0 : 8d be 7e STA $7ebe ; (tmat + 50)
0fe3 : 8d bf 7e STA $7ebf ; (tmat + 51)
0fe6 : 8d c0 7e STA $7ec0 ; (tmat + 52)
0fe9 : 8d c1 7e STA $7ec1 ; (tmat + 53)
0fec : 8d c2 7e STA $7ec2 ; (tmat + 54)
0fef : 8d c3 7e STA $7ec3 ; (tmat + 55)
0ff2 : 8d c4 7e STA $7ec4 ; (tmat + 56)
0ff5 : 8d c5 7e STA $7ec5 ; (tmat + 57)
0ff8 : 8d c6 7e STA $7ec6 ; (tmat + 58)
0ffb : 8d c7 7e STA $7ec7 ; (tmat + 59)
0ffe : 8d c8 7e STA $7ec8 ; (tmat + 60)
1001 : 8d c9 7e STA $7ec9 ; (tmat + 61)
1004 : 8d 4c 7e STA $7e4c ; (rmat + 0)
1007 : 8d 4d 7e STA $7e4d ; (rmat + 1)
100a : 8d 50 7e STA $7e50 ; (rmat + 4)
100d : 8d 51 7e STA $7e51 ; (rmat + 5)
1010 : 8d 52 7e STA $7e52 ; (rmat + 6)
1013 : 8d 53 7e STA $7e53 ; (rmat + 7)
1016 : 8d 54 7e STA $7e54 ; (rmat + 8)
1019 : 8d 55 7e STA $7e55 ; (rmat + 9)
101c : 8d 56 7e STA $7e56 ; (rmat + 10)
101f : 8d 57 7e STA $7e57 ; (rmat + 11)
1022 : 8d 58 7e STA $7e58 ; (rmat + 12)
1025 : 8d 59 7e STA $7e59 ; (rmat + 13)
1028 : 8d 5a 7e STA $7e5a ; (rmat + 14)
102b : 8d 5b 7e STA $7e5b ; (rmat + 15)
102e : 8d 5c 7e STA $7e5c ; (rmat + 16)
1031 : 8d 5d 7e STA $7e5d ; (rmat + 17)
1034 : 8d 5e 7e STA $7e5e ; (rmat + 18)
1037 : 8d 5f 7e STA $7e5f ; (rmat + 19)
103a : 8d 68 7e STA $7e68 ; (rmat + 28)
103d : 8d 69 7e STA $7e69 ; (rmat + 29)
1040 : 8d 6a 7e STA $7e6a ; (rmat + 30)
1043 : 8d 6b 7e STA $7e6b ; (rmat + 31)
1046 : 8d 6c 7e STA $7e6c ; (rmat + 32)
1049 : 8d 6d 7e STA $7e6d ; (rmat + 33)
104c : 8d 6e 7e STA $7e6e ; (rmat + 34)
104f : 8d 6f 7e STA $7e6f ; (rmat + 35)
1052 : 8d 78 7e STA $7e78 ; (rmat + 44)
1055 : 8d 79 7e STA $7e79 ; (rmat + 45)
1058 : 8d 7a 7e STA $7e7a ; (rmat + 46)
105b : 8d 7b 7e STA $7e7b ; (rmat + 47)
105e : 8d 7c 7e STA $7e7c ; (rmat + 48)
1061 : 8d 7d 7e STA $7e7d ; (rmat + 49)
1064 : 8d 7e 7e STA $7e7e ; (rmat + 50)
1067 : 8d 7f 7e STA $7e7f ; (rmat + 51)
106a : 8d 80 7e STA $7e80 ; (rmat + 52)
106d : 8d 81 7e STA $7e81 ; (rmat + 53)
1070 : 8d 82 7e STA $7e82 ; (rmat + 54)
1073 : 8d 83 7e STA $7e83 ; (rmat + 55)
1076 : 8d 84 7e STA $7e84 ; (rmat + 56)
1079 : 8d 85 7e STA $7e85 ; (rmat + 57)
107c : 8d 86 7e STA $7e86 ; (rmat + 58)
107f : 8d 87 7e STA $7e87 ; (rmat + 59)
1082 : 8d 88 7e STA $7e88 ; (rmat + 60)
1085 : 8d 89 7e STA $7e89 ; (rmat + 61)
1088 : a9 6d __ LDA #$6d
108a : 8d 94 7e STA $7e94 ; (tmat + 8)
108d : 8d ac 7e STA $7eac ; (tmat + 32)
1090 : a9 4e __ LDA #$4e
1092 : 8d 95 7e STA $7e95 ; (tmat + 9)
1095 : 8d ad 7e STA $7ead ; (tmat + 33)
1098 : a9 97 __ LDA #$97
109a : 8d 96 7e STA $7e96 ; (tmat + 10)
109d : 8d ae 7e STA $7eae ; (tmat + 34)
10a0 : a9 80 __ LDA #$80
10a2 : 8d a2 7e STA $7ea2 ; (tmat + 22)
10a5 : 8d ca 7e STA $7eca ; (tmat + 62)
10a8 : 8d 4e 7e STA $7e4e ; (rmat + 2)
10ab : 8d 8a 7e STA $7e8a ; (rmat + 62)
10ae : a9 be __ LDA #$be
10b0 : 8d 97 7e STA $7e97 ; (tmat + 11)
10b3 : a9 08 __ LDA #$08
10b5 : 8d 60 7e STA $7e60 ; (rmat + 20)
10b8 : 8d 74 7e STA $7e74 ; (rmat + 40)
10bb : a9 3e __ LDA #$3e
10bd : 8d af 7e STA $7eaf ; (tmat + 35)
10c0 : a9 99 __ LDA #$99
10c2 : 8d 61 7e STA $7e61 ; (rmat + 21)
10c5 : 8d 75 7e STA $7e75 ; (rmat + 41)
10c8 : a9 0e __ LDA #$0e
10ca : 8d 62 7e STA $7e62 ; (rmat + 22)
10cd : 8d 76 7e STA $7e76 ; (rmat + 42)
10d0 : a9 7a __ LDA #$7a
10d2 : 8d 64 7e STA $7e64 ; (rmat + 24)
10d5 : 8d 70 7e STA $7e70 ; (rmat + 36)
10d8 : a9 9b __ LDA #$9b
10da : 8d 65 7e STA $7e65 ; (rmat + 25)
10dd : 8d 71 7e STA $7e71 ; (rmat + 37)
10e0 : a9 54 __ LDA #$54
10e2 : 8d 66 7e STA $7e66 ; (rmat + 26)
10e5 : 8d 72 7e STA $7e72 ; (rmat + 38)
10e8 : a9 bf __ LDA #$bf
10ea : 8d 73 7e STA $7e73 ; (rmat + 39)
10ed : a9 00 __ LDA #$00
.l34:
10ef : 0a __ __ ASL
10f0 : 0a __ __ ASL
10f1 : 85 71 __ STA T10 + 0 
10f3 : aa __ __ TAX
10f4 : a9 00 __ LDA #$00
10f6 : 85 6f __ STA T9 + 0 
10f8 : bd 50 7e LDA $7e50,x ; (rmat + 4)
10fb : 85 5b __ STA T3 + 0 
10fd : bd 51 7e LDA $7e51,x ; (rmat + 5)
1100 : 85 5c __ STA T3 + 1 
1102 : bd 52 7e LDA $7e52,x ; (rmat + 6)
1105 : 85 5d __ STA T3 + 2 
1107 : bd 53 7e LDA $7e53,x ; (rmat + 7)
110a : 85 5e __ STA T3 + 3 
110c : bd 54 7e LDA $7e54,x ; (rmat + 8)
110f : 85 57 __ STA T2 + 0 
1111 : bd 55 7e LDA $7e55,x ; (rmat + 9)
1114 : 85 58 __ STA T2 + 1 
1116 : bd 56 7e LDA $7e56,x ; (rmat + 10)
1119 : 85 59 __ STA T2 + 2 
111b : bd 57 7e LDA $7e57,x ; (rmat + 11)
111e : 85 5a __ STA T2 + 3 
1120 : bd 58 7e LDA $7e58,x ; (rmat + 12)
1123 : 85 53 __ STA T1 + 0 
1125 : bd 59 7e LDA $7e59,x ; (rmat + 13)
1128 : 85 54 __ STA T1 + 1 
112a : bd 5a 7e LDA $7e5a,x ; (rmat + 14)
112d : 85 55 __ STA T1 + 2 
112f : bd 5b 7e LDA $7e5b,x ; (rmat + 15)
1132 : 85 56 __ STA T1 + 3 
1134 : bd 4c 7e LDA $7e4c,x ; (rmat + 0)
1137 : 85 43 __ STA T0 + 0 
1139 : bd 4d 7e LDA $7e4d,x ; (rmat + 1)
113c : 85 44 __ STA T0 + 1 
113e : bd 4e 7e LDA $7e4e,x ; (rmat + 2)
1141 : 85 45 __ STA T0 + 2 
1143 : bd 4f 7e LDA $7e4f,x ; (rmat + 3)
1146 : 85 46 __ STA T0 + 3 
.l36:
1148 : a6 6f __ LDX T9 + 0 
114a : bd bc 7e LDA $7ebc,x ; (tmat + 48)
114d : 85 1b __ STA ACCU + 0 
114f : bd bd 7e LDA $7ebd,x ; (tmat + 49)
1152 : 85 1c __ STA ACCU + 1 
1154 : bd be 7e LDA $7ebe,x ; (tmat + 50)
1157 : 85 1d __ STA ACCU + 2 
1159 : bd bf 7e LDA $7ebf,x ; (tmat + 51)
115c : 85 1e __ STA ACCU + 3 
115e : a2 53 __ LDX #$53
1160 : 20 61 45 JSR $4561 ; (freg + 4)
1163 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1166 : a5 1b __ LDA ACCU + 0 
1168 : 85 67 __ STA T7 + 0 
116a : a5 1c __ LDA ACCU + 1 
116c : 85 68 __ STA T7 + 1 
116e : a5 1d __ LDA ACCU + 2 
1170 : 85 69 __ STA T7 + 2 
1172 : a5 1e __ LDA ACCU + 3 
1174 : 85 6a __ STA T7 + 3 
1176 : a6 6f __ LDX T9 + 0 
1178 : bd ac 7e LDA $7eac,x ; (tmat + 32)
117b : 85 1b __ STA ACCU + 0 
117d : bd ad 7e LDA $7ead,x ; (tmat + 33)
1180 : 85 1c __ STA ACCU + 1 
1182 : bd ae 7e LDA $7eae,x ; (tmat + 34)
1185 : 85 1d __ STA ACCU + 2 
1187 : bd af 7e LDA $7eaf,x ; (tmat + 35)
118a : 85 1e __ STA ACCU + 3 
118c : a2 57 __ LDX #$57
118e : 20 61 45 JSR $4561 ; (freg + 4)
1191 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1194 : a5 1b __ LDA ACCU + 0 
1196 : 85 47 __ STA T6 + 0 
1198 : a5 1c __ LDA ACCU + 1 
119a : 85 48 __ STA T6 + 1 
119c : a5 1d __ LDA ACCU + 2 
119e : 85 49 __ STA T6 + 2 
11a0 : a5 1e __ LDA ACCU + 3 
11a2 : 85 4a __ STA T6 + 3 
11a4 : a6 6f __ LDX T9 + 0 
11a6 : bd 9c 7e LDA $7e9c,x ; (tmat + 16)
11a9 : 85 1b __ STA ACCU + 0 
11ab : bd 9d 7e LDA $7e9d,x ; (tmat + 17)
11ae : 85 1c __ STA ACCU + 1 
11b0 : bd 9e 7e LDA $7e9e,x ; (tmat + 18)
11b3 : 85 1d __ STA ACCU + 2 
11b5 : bd 9f 7e LDA $7e9f,x ; (tmat + 19)
11b8 : 85 1e __ STA ACCU + 3 
11ba : a2 5b __ LDX #$5b
11bc : 20 61 45 JSR $4561 ; (freg + 4)
11bf : 20 73 34 JSR $3473 ; (crt_fmul + 0)
11c2 : a5 1b __ LDA ACCU + 0 
11c4 : 85 63 __ STA T5 + 0 
11c6 : a5 1c __ LDA ACCU + 1 
11c8 : 85 64 __ STA T5 + 1 
11ca : a5 1d __ LDA ACCU + 2 
11cc : 85 65 __ STA T5 + 2 
11ce : a5 1e __ LDA ACCU + 3 
11d0 : 85 66 __ STA T5 + 3 
11d2 : a6 6f __ LDX T9 + 0 
11d4 : bd 8c 7e LDA $7e8c,x ; (tmat + 0)
11d7 : 85 1b __ STA ACCU + 0 
11d9 : bd 8d 7e LDA $7e8d,x ; (tmat + 1)
11dc : 85 1c __ STA ACCU + 1 
11de : bd 8e 7e LDA $7e8e,x ; (tmat + 2)
11e1 : 85 1d __ STA ACCU + 2 
11e3 : bd 8f 7e LDA $7e8f,x ; (tmat + 3)
11e6 : 85 1e __ STA ACCU + 3 
11e8 : a2 43 __ LDX #$43
11ea : 20 61 45 JSR $4561 ; (freg + 4)
11ed : 20 73 34 JSR $3473 ; (crt_fmul + 0)
11f0 : a2 63 __ LDX #$63
11f2 : 20 61 45 JSR $4561 ; (freg + 4)
11f5 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
11f8 : a2 47 __ LDX #$47
11fa : 20 61 45 JSR $4561 ; (freg + 4)
11fd : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1200 : a2 67 __ LDX #$67
1202 : 20 61 45 JSR $4561 ; (freg + 4)
1205 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1208 : a5 1b __ LDA ACCU + 0 
120a : a6 6f __ LDX T9 + 0 
120c : 9d ad c7 STA $c7ad,x ; (ma + 0)
120f : a5 1c __ LDA ACCU + 1 
1211 : 9d ae c7 STA $c7ae,x ; (ma + 1)
1214 : a5 1d __ LDA ACCU + 2 
1216 : 9d af c7 STA $c7af,x ; (ma + 2)
1219 : a5 1e __ LDA ACCU + 3 
121b : 9d b0 c7 STA $c7b0,x ; (ma + 3)
121e : 8a __ __ TXA
121f : 18 __ __ CLC
1220 : 69 04 __ ADC #$04
1222 : 85 6f __ STA T9 + 0 
1224 : c9 10 __ CMP #$10
1226 : f0 03 __ BEQ $122b ; (main.s37 + 0)
1228 : 4c 48 11 JMP $1148 ; (main.l36 + 0)
.s37:
122b : a2 00 __ LDX #$00
122d : a4 71 __ LDY T10 + 0 
.l1138:
122f : bd ad c7 LDA $c7ad,x ; (ma + 0)
1232 : 99 4c 7e STA $7e4c,y ; (rmat + 0)
1235 : bd ae c7 LDA $c7ae,x ; (ma + 1)
1238 : 99 4d 7e STA $7e4d,y ; (rmat + 1)
123b : bd af c7 LDA $c7af,x ; (ma + 2)
123e : 99 4e 7e STA $7e4e,y ; (rmat + 2)
1241 : bd b0 c7 LDA $c7b0,x ; (ma + 3)
1244 : 99 4f 7e STA $7e4f,y ; (rmat + 3)
1247 : 98 __ __ TYA
1248 : 18 __ __ CLC
1249 : 69 04 __ ADC #$04
124b : a8 __ __ TAY
124c : 8a __ __ TXA
124d : 18 __ __ CLC
124e : 69 04 __ ADC #$04
1250 : aa __ __ TAX
1251 : e0 10 __ CPX #$10
1253 : d0 da __ BNE $122f ; (main.l1138 + 0)
.s1139:
1255 : 18 __ __ CLC
1256 : a5 6b __ LDA T8 + 0 
1258 : 69 04 __ ADC #$04
125a : 85 6b __ STA T8 + 0 
125c : c9 10 __ CMP #$10
125e : f0 03 __ BEQ $1263 ; (main.s33 + 0)
1260 : 4c ef 10 JMP $10ef ; (main.l34 + 0)
.s33:
1263 : a9 00 __ LDA #$00
.l40:
1265 : 85 6b __ STA T8 + 0 
1267 : 0a __ __ ASL
1268 : 0a __ __ ASL
1269 : 85 71 __ STA T10 + 0 
126b : aa __ __ TAX
126c : bd 50 7e LDA $7e50,x ; (rmat + 4)
126f : 85 5b __ STA T3 + 0 
1271 : a9 00 __ LDA #$00
1273 : 85 6f __ STA T9 + 0 
1275 : bd 51 7e LDA $7e51,x ; (rmat + 5)
1278 : 85 5c __ STA T3 + 1 
127a : bd 52 7e LDA $7e52,x ; (rmat + 6)
127d : 85 5d __ STA T3 + 2 
127f : bd 53 7e LDA $7e53,x ; (rmat + 7)
1282 : 85 5e __ STA T3 + 3 
1284 : bd 54 7e LDA $7e54,x ; (rmat + 8)
1287 : 85 57 __ STA T2 + 0 
1289 : bd 55 7e LDA $7e55,x ; (rmat + 9)
128c : 85 58 __ STA T2 + 1 
128e : bd 56 7e LDA $7e56,x ; (rmat + 10)
1291 : 85 59 __ STA T2 + 2 
1293 : bd 57 7e LDA $7e57,x ; (rmat + 11)
1296 : 85 5a __ STA T2 + 3 
1298 : bd 58 7e LDA $7e58,x ; (rmat + 12)
129b : 85 53 __ STA T1 + 0 
129d : bd 59 7e LDA $7e59,x ; (rmat + 13)
12a0 : 85 54 __ STA T1 + 1 
12a2 : bd 5a 7e LDA $7e5a,x ; (rmat + 14)
12a5 : 85 55 __ STA T1 + 2 
12a7 : bd 5b 7e LDA $7e5b,x ; (rmat + 15)
12aa : 85 56 __ STA T1 + 3 
12ac : bd 4c 7e LDA $7e4c,x ; (rmat + 0)
12af : 85 43 __ STA T0 + 0 
12b1 : bd 4d 7e LDA $7e4d,x ; (rmat + 1)
12b4 : 85 44 __ STA T0 + 1 
12b6 : bd 4e 7e LDA $7e4e,x ; (rmat + 2)
12b9 : 85 45 __ STA T0 + 2 
12bb : bd 4f 7e LDA $7e4f,x ; (rmat + 3)
12be : 85 46 __ STA T0 + 3 
.l42:
12c0 : a6 6f __ LDX T9 + 0 
12c2 : bd f0 4f LDA $4ff0,x ; (wmat + 48)
12c5 : 85 1b __ STA ACCU + 0 
12c7 : bd f1 4f LDA $4ff1,x ; (wmat + 49)
12ca : 85 1c __ STA ACCU + 1 
12cc : bd f2 4f LDA $4ff2,x ; (wmat + 50)
12cf : 85 1d __ STA ACCU + 2 
12d1 : bd f3 4f LDA $4ff3,x ; (wmat + 51)
12d4 : 85 1e __ STA ACCU + 3 
12d6 : a2 53 __ LDX #$53
12d8 : 20 61 45 JSR $4561 ; (freg + 4)
12db : 20 73 34 JSR $3473 ; (crt_fmul + 0)
12de : a5 1b __ LDA ACCU + 0 
12e0 : 85 67 __ STA T7 + 0 
12e2 : a5 1c __ LDA ACCU + 1 
12e4 : 85 68 __ STA T7 + 1 
12e6 : a5 1d __ LDA ACCU + 2 
12e8 : 85 69 __ STA T7 + 2 
12ea : a5 1e __ LDA ACCU + 3 
12ec : 85 6a __ STA T7 + 3 
12ee : a6 6f __ LDX T9 + 0 
12f0 : bd e0 4f LDA $4fe0,x ; (wmat + 32)
12f3 : 85 1b __ STA ACCU + 0 
12f5 : bd e1 4f LDA $4fe1,x ; (wmat + 33)
12f8 : 85 1c __ STA ACCU + 1 
12fa : bd e2 4f LDA $4fe2,x ; (wmat + 34)
12fd : 85 1d __ STA ACCU + 2 
12ff : bd e3 4f LDA $4fe3,x ; (wmat + 35)
1302 : 85 1e __ STA ACCU + 3 
1304 : a2 57 __ LDX #$57
1306 : 20 61 45 JSR $4561 ; (freg + 4)
1309 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
130c : a5 1b __ LDA ACCU + 0 
130e : 85 47 __ STA T6 + 0 
1310 : a5 1c __ LDA ACCU + 1 
1312 : 85 48 __ STA T6 + 1 
1314 : a5 1d __ LDA ACCU + 2 
1316 : 85 49 __ STA T6 + 2 
1318 : a5 1e __ LDA ACCU + 3 
131a : 85 4a __ STA T6 + 3 
131c : a6 6f __ LDX T9 + 0 
131e : bd d0 4f LDA $4fd0,x ; (wmat + 16)
1321 : 85 1b __ STA ACCU + 0 
1323 : bd d1 4f LDA $4fd1,x ; (wmat + 17)
1326 : 85 1c __ STA ACCU + 1 
1328 : bd d2 4f LDA $4fd2,x ; (wmat + 18)
132b : 85 1d __ STA ACCU + 2 
132d : bd d3 4f LDA $4fd3,x ; (wmat + 19)
1330 : 85 1e __ STA ACCU + 3 
1332 : a2 5b __ LDX #$5b
1334 : 20 61 45 JSR $4561 ; (freg + 4)
1337 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
133a : a5 1b __ LDA ACCU + 0 
133c : 85 63 __ STA T5 + 0 
133e : a5 1c __ LDA ACCU + 1 
1340 : 85 64 __ STA T5 + 1 
1342 : a5 1d __ LDA ACCU + 2 
1344 : 85 65 __ STA T5 + 2 
1346 : a5 1e __ LDA ACCU + 3 
1348 : 85 66 __ STA T5 + 3 
134a : a6 6f __ LDX T9 + 0 
134c : bd c0 4f LDA $4fc0,x ; (wmat + 0)
134f : 85 1b __ STA ACCU + 0 
1351 : bd c1 4f LDA $4fc1,x ; (wmat + 1)
1354 : 85 1c __ STA ACCU + 1 
1356 : bd c2 4f LDA $4fc2,x ; (wmat + 2)
1359 : 85 1d __ STA ACCU + 2 
135b : bd c3 4f LDA $4fc3,x ; (wmat + 3)
135e : 85 1e __ STA ACCU + 3 
1360 : a2 43 __ LDX #$43
1362 : 20 61 45 JSR $4561 ; (freg + 4)
1365 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1368 : a2 63 __ LDX #$63
136a : 20 61 45 JSR $4561 ; (freg + 4)
136d : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1370 : a2 47 __ LDX #$47
1372 : 20 61 45 JSR $4561 ; (freg + 4)
1375 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1378 : a2 67 __ LDX #$67
137a : 20 61 45 JSR $4561 ; (freg + 4)
137d : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1380 : a5 1b __ LDA ACCU + 0 
1382 : a6 6f __ LDX T9 + 0 
1384 : 9d 9d c7 STA $c79d,x ; (ma + 0)
1387 : a5 1c __ LDA ACCU + 1 
1389 : 9d 9e c7 STA $c79e,x ; (ma + 1)
138c : a5 1d __ LDA ACCU + 2 
138e : 9d 9f c7 STA $c79f,x ; (ma + 2)
1391 : a5 1e __ LDA ACCU + 3 
1393 : 9d a0 c7 STA $c7a0,x ; (ma + 3)
1396 : 8a __ __ TXA
1397 : 18 __ __ CLC
1398 : 69 04 __ ADC #$04
139a : 85 6f __ STA T9 + 0 
139c : c9 10 __ CMP #$10
139e : f0 03 __ BEQ $13a3 ; (main.s43 + 0)
13a0 : 4c c0 12 JMP $12c0 ; (main.l42 + 0)
.s43:
13a3 : a2 00 __ LDX #$00
13a5 : a4 71 __ LDY T10 + 0 
.l1140:
13a7 : bd 9d c7 LDA $c79d,x ; (ma + 0)
13aa : 99 4c 7e STA $7e4c,y ; (rmat + 0)
13ad : bd 9e c7 LDA $c79e,x ; (ma + 1)
13b0 : 99 4d 7e STA $7e4d,y ; (rmat + 1)
13b3 : bd 9f c7 LDA $c79f,x ; (ma + 2)
13b6 : 99 4e 7e STA $7e4e,y ; (rmat + 2)
13b9 : bd a0 c7 LDA $c7a0,x ; (ma + 3)
13bc : 99 4f 7e STA $7e4f,y ; (rmat + 3)
13bf : 98 __ __ TYA
13c0 : 18 __ __ CLC
13c1 : 69 04 __ ADC #$04
13c3 : a8 __ __ TAY
13c4 : 8a __ __ TXA
13c5 : 18 __ __ CLC
13c6 : 69 04 __ ADC #$04
13c8 : aa __ __ TAX
13c9 : e0 10 __ CPX #$10
13cb : d0 da __ BNE $13a7 ; (main.l1140 + 0)
.s1141:
13cd : 18 __ __ CLC
13ce : a5 6b __ LDA T8 + 0 
13d0 : 69 04 __ ADC #$04
13d2 : c9 10 __ CMP #$10
13d4 : f0 03 __ BEQ $13d9 ; (main.s39 + 0)
13d6 : 4c 65 12 JMP $1265 ; (main.l40 + 0)
.s39:
13d9 : ad 84 7e LDA $7e84 ; (rmat + 56)
13dc : 85 1b __ STA ACCU + 0 
13de : ad 85 7e LDA $7e85 ; (rmat + 57)
13e1 : 85 1c __ STA ACCU + 1 
13e3 : ad 86 7e LDA $7e86 ; (rmat + 58)
13e6 : 85 1d __ STA ACCU + 2 
13e8 : ad 87 7e LDA $7e87 ; (rmat + 59)
13eb : 85 1e __ STA ACCU + 3 
13ed : a9 00 __ LDA #$00
13ef : 85 03 __ STA WORK + 0 
13f1 : 85 04 __ STA WORK + 1 
13f3 : a9 a0 __ LDA #$a0
13f5 : 85 05 __ STA WORK + 2 
13f7 : 20 cc 4a JSR $4acc ; (freg@proxy + 0)
13fa : 20 a8 45 JSR $45a8 ; (faddsub + 6)
13fd : a5 1b __ LDA ACCU + 0 
13ff : 8d 84 7e STA $7e84 ; (rmat + 56)
1402 : a5 1c __ LDA ACCU + 1 
1404 : 8d 85 7e STA $7e85 ; (rmat + 57)
1407 : a5 1d __ LDA ACCU + 2 
1409 : 8d 86 7e STA $7e86 ; (rmat + 58)
140c : a5 1e __ LDA ACCU + 3 
140e : 8d 87 7e STA $7e87 ; (rmat + 59)
1411 : a2 3f __ LDX #$3f
.l1004:
1413 : bd 00 51 LDA $5100,x ; (pmat + 0)
1416 : 9d 8c 7e STA $7e8c,x ; (tmat + 0)
1419 : ca __ __ DEX
141a : 10 f7 __ BPL $1413 ; (main.l1004 + 0)
.s1005:
141c : a9 00 __ LDA #$00
141e : 85 6b __ STA T8 + 0 
.l46:
1420 : a9 00 __ LDA #$00
1422 : 85 6f __ STA T9 + 0 
1424 : 85 71 __ STA T10 + 0 
1426 : a5 6b __ LDA T8 + 0 
1428 : 0a __ __ ASL
1429 : 0a __ __ ASL
142a : a8 __ __ TAY
142b : be 9c 7e LDX $7e9c,y ; (tmat + 16)
142e : 86 5b __ STX T3 + 0 
1430 : be 9d 7e LDX $7e9d,y ; (tmat + 17)
1433 : 86 5c __ STX T3 + 1 
1435 : be 9e 7e LDX $7e9e,y ; (tmat + 18)
1438 : 86 5d __ STX T3 + 2 
143a : be 9f 7e LDX $7e9f,y ; (tmat + 19)
143d : 86 5e __ STX T3 + 3 
143f : be ac 7e LDX $7eac,y ; (tmat + 32)
1442 : 86 57 __ STX T2 + 0 
1444 : be ad 7e LDX $7ead,y ; (tmat + 33)
1447 : 86 58 __ STX T2 + 1 
1449 : be ae 7e LDX $7eae,y ; (tmat + 34)
144c : 86 59 __ STX T2 + 2 
144e : be af 7e LDX $7eaf,y ; (tmat + 35)
1451 : 86 5a __ STX T2 + 3 
1453 : be bc 7e LDX $7ebc,y ; (tmat + 48)
1456 : 86 53 __ STX T1 + 0 
1458 : be bd 7e LDX $7ebd,y ; (tmat + 49)
145b : 86 54 __ STX T1 + 1 
145d : be be 7e LDX $7ebe,y ; (tmat + 50)
1460 : 86 55 __ STX T1 + 2 
1462 : be bf 7e LDX $7ebf,y ; (tmat + 51)
1465 : 86 56 __ STX T1 + 3 
1467 : 18 __ __ CLC
1468 : 69 8c __ ADC #$8c
146a : 85 73 __ STA T11 + 0 
146c : a9 7e __ LDA #$7e
146e : 69 00 __ ADC #$00
1470 : 85 74 __ STA T11 + 1 
1472 : b9 8c 7e LDA $7e8c,y ; (tmat + 0)
1475 : 85 43 __ STA T0 + 0 
1477 : b9 8d 7e LDA $7e8d,y ; (tmat + 1)
147a : 85 44 __ STA T0 + 1 
147c : b9 8e 7e LDA $7e8e,y ; (tmat + 2)
147f : 85 45 __ STA T0 + 2 
1481 : b9 8f 7e LDA $7e8f,y ; (tmat + 3)
1484 : 85 46 __ STA T0 + 3 
.l48:
1486 : a6 6f __ LDX T9 + 0 
1488 : bd 58 7e LDA $7e58,x ; (rmat + 12)
148b : 85 1b __ STA ACCU + 0 
148d : bd 59 7e LDA $7e59,x ; (rmat + 13)
1490 : 85 1c __ STA ACCU + 1 
1492 : bd 5a 7e LDA $7e5a,x ; (rmat + 14)
1495 : 85 1d __ STA ACCU + 2 
1497 : bd 5b 7e LDA $7e5b,x ; (rmat + 15)
149a : 85 1e __ STA ACCU + 3 
149c : a2 53 __ LDX #$53
149e : 20 61 45 JSR $4561 ; (freg + 4)
14a1 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
14a4 : a5 1b __ LDA ACCU + 0 
14a6 : 85 67 __ STA T7 + 0 
14a8 : a5 1c __ LDA ACCU + 1 
14aa : 85 68 __ STA T7 + 1 
14ac : a5 1d __ LDA ACCU + 2 
14ae : 85 69 __ STA T7 + 2 
14b0 : a5 1e __ LDA ACCU + 3 
14b2 : 85 6a __ STA T7 + 3 
14b4 : a6 6f __ LDX T9 + 0 
14b6 : bd 54 7e LDA $7e54,x ; (rmat + 8)
14b9 : 85 1b __ STA ACCU + 0 
14bb : bd 55 7e LDA $7e55,x ; (rmat + 9)
14be : 85 1c __ STA ACCU + 1 
14c0 : bd 56 7e LDA $7e56,x ; (rmat + 10)
14c3 : 85 1d __ STA ACCU + 2 
14c5 : bd 57 7e LDA $7e57,x ; (rmat + 11)
14c8 : 85 1e __ STA ACCU + 3 
14ca : a2 57 __ LDX #$57
14cc : 20 61 45 JSR $4561 ; (freg + 4)
14cf : 20 73 34 JSR $3473 ; (crt_fmul + 0)
14d2 : a5 1b __ LDA ACCU + 0 
14d4 : 85 47 __ STA T6 + 0 
14d6 : a5 1c __ LDA ACCU + 1 
14d8 : 85 48 __ STA T6 + 1 
14da : a5 1d __ LDA ACCU + 2 
14dc : 85 49 __ STA T6 + 2 
14de : a5 1e __ LDA ACCU + 3 
14e0 : 85 4a __ STA T6 + 3 
14e2 : a6 6f __ LDX T9 + 0 
14e4 : bd 50 7e LDA $7e50,x ; (rmat + 4)
14e7 : 85 1b __ STA ACCU + 0 
14e9 : bd 51 7e LDA $7e51,x ; (rmat + 5)
14ec : 85 1c __ STA ACCU + 1 
14ee : bd 52 7e LDA $7e52,x ; (rmat + 6)
14f1 : 85 1d __ STA ACCU + 2 
14f3 : bd 53 7e LDA $7e53,x ; (rmat + 7)
14f6 : 85 1e __ STA ACCU + 3 
14f8 : a2 5b __ LDX #$5b
14fa : 20 61 45 JSR $4561 ; (freg + 4)
14fd : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1500 : a5 1b __ LDA ACCU + 0 
1502 : 85 63 __ STA T5 + 0 
1504 : a5 1c __ LDA ACCU + 1 
1506 : 85 64 __ STA T5 + 1 
1508 : a5 1d __ LDA ACCU + 2 
150a : 85 65 __ STA T5 + 2 
150c : a5 1e __ LDA ACCU + 3 
150e : 85 66 __ STA T5 + 3 
1510 : a6 6f __ LDX T9 + 0 
1512 : bd 4c 7e LDA $7e4c,x ; (rmat + 0)
1515 : 85 1b __ STA ACCU + 0 
1517 : bd 4d 7e LDA $7e4d,x ; (rmat + 1)
151a : 85 1c __ STA ACCU + 1 
151c : bd 4e 7e LDA $7e4e,x ; (rmat + 2)
151f : 85 1d __ STA ACCU + 2 
1521 : bd 4f 7e LDA $7e4f,x ; (rmat + 3)
1524 : 85 1e __ STA ACCU + 3 
1526 : a2 43 __ LDX #$43
1528 : 20 61 45 JSR $4561 ; (freg + 4)
152b : 20 73 34 JSR $3473 ; (crt_fmul + 0)
152e : a2 63 __ LDX #$63
1530 : 20 61 45 JSR $4561 ; (freg + 4)
1533 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1536 : a2 47 __ LDX #$47
1538 : 20 61 45 JSR $4561 ; (freg + 4)
153b : 20 a8 45 JSR $45a8 ; (faddsub + 6)
153e : a2 67 __ LDX #$67
1540 : 20 61 45 JSR $4561 ; (freg + 4)
1543 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1546 : a5 1b __ LDA ACCU + 0 
1548 : a6 71 __ LDX T10 + 0 
154a : 9d 8d c7 STA $c78d,x ; (ma + 0)
154d : a5 1c __ LDA ACCU + 1 
154f : 9d 8e c7 STA $c78e,x ; (ma + 1)
1552 : a5 1d __ LDA ACCU + 2 
1554 : 9d 8f c7 STA $c78f,x ; (ma + 2)
1557 : a5 1e __ LDA ACCU + 3 
1559 : 9d 90 c7 STA $c790,x ; (ma + 3)
155c : 8a __ __ TXA
155d : 18 __ __ CLC
155e : 69 04 __ ADC #$04
1560 : 85 71 __ STA T10 + 0 
1562 : 18 __ __ CLC
1563 : a5 6f __ LDA T9 + 0 
1565 : 69 10 __ ADC #$10
1567 : 85 6f __ STA T9 + 0 
1569 : c9 40 __ CMP #$40
156b : f0 03 __ BEQ $1570 ; (main.s49 + 0)
156d : 4c 86 14 JMP $1486 ; (main.l48 + 0)
.s49:
1570 : a2 00 __ LDX #$00
1572 : 86 57 __ STX T2 + 0 
.l50:
1574 : bd 8e c7 LDA $c78e,x ; (ma + 1)
1577 : 85 44 __ STA T0 + 1 
1579 : bd 8f c7 LDA $c78f,x ; (ma + 2)
157c : 85 45 __ STA T0 + 2 
157e : bd 90 c7 LDA $c790,x ; (ma + 3)
1581 : 85 46 __ STA T0 + 3 
1583 : bd 8d c7 LDA $c78d,x ; (ma + 0)
1586 : a4 57 __ LDY T2 + 0 
1588 : 91 73 __ STA (T11 + 0),y 
158a : a5 44 __ LDA T0 + 1 
158c : c8 __ __ INY
158d : 91 73 __ STA (T11 + 0),y 
158f : a5 45 __ LDA T0 + 2 
1591 : c8 __ __ INY
1592 : 91 73 __ STA (T11 + 0),y 
1594 : a5 46 __ LDA T0 + 3 
1596 : c8 __ __ INY
1597 : 91 73 __ STA (T11 + 0),y 
1599 : 98 __ __ TYA
159a : 18 __ __ CLC
159b : 69 0d __ ADC #$0d
159d : 85 57 __ STA T2 + 0 
159f : 8a __ __ TXA
15a0 : 18 __ __ CLC
15a1 : 69 04 __ ADC #$04
15a3 : aa __ __ TAX
15a4 : e0 10 __ CPX #$10
15a6 : d0 cc __ BNE $1574 ; (main.l50 + 0)
.s47:
15a8 : e6 6b __ INC T8 + 0 
15aa : a5 6b __ LDA T8 + 0 
15ac : c9 04 __ CMP #$04
15ae : f0 03 __ BEQ $15b3 ; (main.s45 + 0)
15b0 : 4c 20 14 JMP $1420 ; (main.l46 + 0)
.s45:
15b3 : a9 00 __ LDA #$00
15b5 : 85 47 __ STA T6 + 0 
15b7 : 85 67 __ STA T7 + 0 
15b9 : 85 68 __ STA T7 + 1 
.l51:
15bb : a9 00 __ LDA #$00
15bd : 85 6b __ STA T8 + 0 
15bf : 85 6f __ STA T9 + 0 
15c1 : 85 70 __ STA T9 + 1 
15c3 : 18 __ __ CLC
.l54:
15c4 : a5 6f __ LDA T9 + 0 
15c6 : 65 67 __ ADC T7 + 0 
15c8 : a8 __ __ TAY
15c9 : a5 70 __ LDA T9 + 1 
15cb : 65 68 __ ADC T7 + 1 
15cd : aa __ __ TAX
15ce : 98 __ __ TYA
15cf : 18 __ __ CLC
15d0 : 69 40 __ ADC #$40
15d2 : 85 57 __ STA T2 + 0 
15d4 : 8a __ __ TXA
15d5 : 69 51 __ ADC #$51
15d7 : 85 58 __ STA T2 + 1 
15d9 : a0 00 __ LDY #$00
15db : 84 71 __ STY T10 + 0 
15dd : b1 57 __ LDA (T2 + 0),y 
15df : 85 43 __ STA T0 + 0 
15e1 : c8 __ __ INY
15e2 : b1 57 __ LDA (T2 + 0),y 
15e4 : 85 44 __ STA T0 + 1 
15e6 : c8 __ __ INY
15e7 : b1 57 __ LDA (T2 + 0),y 
15e9 : 85 45 __ STA T0 + 2 
15eb : c8 __ __ INY
15ec : b1 57 __ LDA (T2 + 0),y 
15ee : 85 46 __ STA T0 + 3 
15f0 : c8 __ __ INY
15f1 : b1 57 __ LDA (T2 + 0),y 
15f3 : 85 53 __ STA T1 + 0 
15f5 : c8 __ __ INY
15f6 : b1 57 __ LDA (T2 + 0),y 
15f8 : 85 54 __ STA T1 + 1 
15fa : c8 __ __ INY
15fb : b1 57 __ LDA (T2 + 0),y 
15fd : 85 55 __ STA T1 + 2 
15ff : c8 __ __ INY
1600 : b1 57 __ LDA (T2 + 0),y 
1602 : 85 56 __ STA T1 + 3 
1604 : a0 09 __ LDY #$09
1606 : b1 57 __ LDA (T2 + 0),y 
1608 : aa __ __ TAX
1609 : c8 __ __ INY
160a : b1 57 __ LDA (T2 + 0),y 
160c : 85 59 __ STA T2 + 2 
160e : c8 __ __ INY
160f : b1 57 __ LDA (T2 + 0),y 
1611 : 85 5a __ STA T2 + 3 
1613 : a0 08 __ LDY #$08
1615 : b1 57 __ LDA (T2 + 0),y 
1617 : 86 58 __ STX T2 + 1 
1619 : 85 57 __ STA T2 + 0 
.l55:
161b : a6 71 __ LDX T10 + 0 
161d : bd ac 7e LDA $7eac,x ; (tmat + 32)
1620 : 85 1b __ STA ACCU + 0 
1622 : bd ad 7e LDA $7ead,x ; (tmat + 33)
1625 : 85 1c __ STA ACCU + 1 
1627 : bd ae 7e LDA $7eae,x ; (tmat + 34)
162a : 85 1d __ STA ACCU + 2 
162c : bd af 7e LDA $7eaf,x ; (tmat + 35)
162f : 85 1e __ STA ACCU + 3 
1631 : a2 57 __ LDX #$57
1633 : 20 61 45 JSR $4561 ; (freg + 4)
1636 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1639 : a5 1b __ LDA ACCU + 0 
163b : 85 63 __ STA T5 + 0 
163d : a5 1c __ LDA ACCU + 1 
163f : 85 64 __ STA T5 + 1 
1641 : a5 1d __ LDA ACCU + 2 
1643 : 85 65 __ STA T5 + 2 
1645 : a5 1e __ LDA ACCU + 3 
1647 : 85 66 __ STA T5 + 3 
1649 : a6 71 __ LDX T10 + 0 
164b : bd 9c 7e LDA $7e9c,x ; (tmat + 16)
164e : 85 1b __ STA ACCU + 0 
1650 : bd 9d 7e LDA $7e9d,x ; (tmat + 17)
1653 : 85 1c __ STA ACCU + 1 
1655 : bd 9e 7e LDA $7e9e,x ; (tmat + 18)
1658 : 85 1d __ STA ACCU + 2 
165a : bd 9f 7e LDA $7e9f,x ; (tmat + 19)
165d : 85 1e __ STA ACCU + 3 
165f : a2 53 __ LDX #$53
1661 : 20 61 45 JSR $4561 ; (freg + 4)
1664 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1667 : a5 1b __ LDA ACCU + 0 
1669 : 85 5f __ STA T4 + 0 
166b : a5 1c __ LDA ACCU + 1 
166d : 85 60 __ STA T4 + 1 
166f : a5 1d __ LDA ACCU + 2 
1671 : 85 61 __ STA T4 + 2 
1673 : a5 1e __ LDA ACCU + 3 
1675 : 85 62 __ STA T4 + 3 
1677 : a6 71 __ LDX T10 + 0 
1679 : bd 8c 7e LDA $7e8c,x ; (tmat + 0)
167c : 85 1b __ STA ACCU + 0 
167e : bd 8d 7e LDA $7e8d,x ; (tmat + 1)
1681 : 85 1c __ STA ACCU + 1 
1683 : bd 8e 7e LDA $7e8e,x ; (tmat + 2)
1686 : 85 1d __ STA ACCU + 2 
1688 : bd 8f 7e LDA $7e8f,x ; (tmat + 3)
168b : 85 1e __ STA ACCU + 3 
168d : a2 43 __ LDX #$43
168f : 20 61 45 JSR $4561 ; (freg + 4)
1692 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1695 : a2 5f __ LDX #$5f
1697 : 20 61 45 JSR $4561 ; (freg + 4)
169a : 20 a8 45 JSR $45a8 ; (faddsub + 6)
169d : a2 63 __ LDX #$63
169f : 20 61 45 JSR $4561 ; (freg + 4)
16a2 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
16a5 : a6 71 __ LDX T10 + 0 
16a7 : bd bc 7e LDA $7ebc,x ; (tmat + 48)
16aa : 85 5f __ STA T4 + 0 
16ac : bd bd 7e LDA $7ebd,x ; (tmat + 49)
16af : 85 60 __ STA T4 + 1 
16b1 : bd be 7e LDA $7ebe,x ; (tmat + 50)
16b4 : 85 61 __ STA T4 + 2 
16b6 : bd bf 7e LDA $7ebf,x ; (tmat + 51)
16b9 : 85 62 __ STA T4 + 3 
16bb : a2 5f __ LDX #$5f
16bd : 20 61 45 JSR $4561 ; (freg + 4)
16c0 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
16c3 : a5 1b __ LDA ACCU + 0 
16c5 : a6 71 __ LDX T10 + 0 
16c7 : 9d 81 c7 STA $c781,x ; (vt + 0)
16ca : a5 1c __ LDA ACCU + 1 
16cc : 9d 82 c7 STA $c782,x ; (vt + 1)
16cf : a5 1d __ LDA ACCU + 2 
16d1 : 9d 83 c7 STA $c783,x ; (vt + 2)
16d4 : a5 1e __ LDA ACCU + 3 
16d6 : 9d 84 c7 STA $c784,x ; (vt + 3)
16d9 : 8a __ __ TXA
16da : 18 __ __ CLC
16db : 69 04 __ ADC #$04
16dd : 85 71 __ STA T10 + 0 
16df : c9 0c __ CMP #$0c
16e1 : f0 03 __ BEQ $16e6 ; (main.s56 + 0)
16e3 : 4c 1b 16 JMP $161b ; (main.l55 + 0)
.s56:
16e6 : a2 0b __ LDX #$0b
.l1006:
16e8 : bd 81 c7 LDA $c781,x ; (vt + 0)
16eb : 9d d9 c7 STA $c7d9,x ; (vp + 0)
16ee : ca __ __ DEX
16ef : 10 f7 __ BPL $16e8 ; (main.l1006 + 0)
.s1007:
16f1 : ad d9 c7 LDA $c7d9 ; (vp + 0)
16f4 : 85 1b __ STA ACCU + 0 
16f6 : ad da c7 LDA $c7da ; (vp + 1)
16f9 : 85 1c __ STA ACCU + 1 
16fb : ad db c7 LDA $c7db ; (vp + 2)
16fe : 85 1d __ STA ACCU + 2 
1700 : ad dc c7 LDA $c7dc ; (vp + 3)
1703 : 85 1e __ STA ACCU + 3 
1705 : ad e1 c7 LDA $c7e1 ; (vp + 8)
1708 : 85 53 __ STA T1 + 0 
170a : ad e2 c7 LDA $c7e2 ; (vp + 9)
170d : 85 54 __ STA T1 + 1 
170f : ad e3 c7 LDA $c7e3 ; (vp + 10)
1712 : 85 55 __ STA T1 + 2 
1714 : ad e4 c7 LDA $c7e4 ; (vp + 11)
1717 : 85 56 __ STA T1 + 3 
1719 : a2 53 __ LDX #$53
171b : 20 61 45 JSR $4561 ; (freg + 4)
171e : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
1721 : a5 1b __ LDA ACCU + 0 
1723 : 85 43 __ STA T0 + 0 
1725 : 8d d9 c7 STA $c7d9 ; (vp + 0)
1728 : a5 1c __ LDA ACCU + 1 
172a : 85 44 __ STA T0 + 1 
172c : 8d da c7 STA $c7da ; (vp + 1)
172f : a5 1d __ LDA ACCU + 2 
1731 : 85 45 __ STA T0 + 2 
1733 : 8d db c7 STA $c7db ; (vp + 2)
1736 : a5 1e __ LDA ACCU + 3 
1738 : 85 46 __ STA T0 + 3 
173a : 8d dc c7 STA $c7dc ; (vp + 3)
173d : ad dd c7 LDA $c7dd ; (vp + 4)
1740 : 85 1b __ STA ACCU + 0 
1742 : ad de c7 LDA $c7de ; (vp + 5)
1745 : 85 1c __ STA ACCU + 1 
1747 : ad df c7 LDA $c7df ; (vp + 6)
174a : 85 1d __ STA ACCU + 2 
174c : ad e0 c7 LDA $c7e0 ; (vp + 7)
174f : 85 1e __ STA ACCU + 3 
1751 : a2 53 __ LDX #$53
1753 : 20 61 45 JSR $4561 ; (freg + 4)
1756 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
1759 : a5 1b __ LDA ACCU + 0 
175b : 85 57 __ STA T2 + 0 
175d : 8d dd c7 STA $c7dd ; (vp + 4)
1760 : a5 1c __ LDA ACCU + 1 
1762 : 85 58 __ STA T2 + 1 
1764 : 8d de c7 STA $c7de ; (vp + 5)
1767 : a5 1d __ LDA ACCU + 2 
1769 : 85 59 __ STA T2 + 2 
176b : 8d df c7 STA $c7df ; (vp + 6)
176e : a5 1e __ LDA ACCU + 3 
1770 : 85 5a __ STA T2 + 3 
1772 : 8d e0 c7 STA $c7e0 ; (vp + 7)
1775 : a5 47 __ LDA T6 + 0 
1777 : 0a __ __ ASL
1778 : 0a __ __ ASL
1779 : 85 5b __ STA T3 + 0 
177b : a5 6b __ LDA T8 + 0 
177d : 85 1b __ STA ACCU + 0 
177f : a9 00 __ LDA #$00
1781 : 85 1c __ STA ACCU + 1 
1783 : a9 7c __ LDA #$7c
1785 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
1788 : 18 __ __ CLC
1789 : a9 d0 __ LDA #$d0
178b : 65 1b __ ADC ACCU + 0 
178d : 85 63 __ STA T5 + 0 
178f : a9 8d __ LDA #$8d
1791 : 65 1c __ ADC ACCU + 1 
1793 : 85 64 __ STA T5 + 1 
1795 : a5 53 __ LDA T1 + 0 
1797 : a4 5b __ LDY T3 + 0 
1799 : 91 63 __ STA (T5 + 0),y 
179b : a5 54 __ LDA T1 + 1 
179d : c8 __ __ INY
179e : 91 63 __ STA (T5 + 0),y 
17a0 : a5 55 __ LDA T1 + 2 
17a2 : c8 __ __ INY
17a3 : 91 63 __ STA (T5 + 0),y 
17a5 : a5 56 __ LDA T1 + 3 
17a7 : c8 __ __ INY
17a8 : 91 63 __ STA (T5 + 0),y 
17aa : 18 __ __ CLC
17ab : a9 cc __ LDA #$cc
17ad : 65 1b __ ADC ACCU + 0 
17af : 85 53 __ STA T1 + 0 
17b1 : a9 7e __ LDA #$7e
17b3 : 65 1c __ ADC ACCU + 1 
17b5 : 85 54 __ STA T1 + 1 
17b7 : a9 00 __ LDA #$00
17b9 : 85 1b __ STA ACCU + 0 
17bb : 85 1c __ STA ACCU + 1 
17bd : a2 43 __ LDX #$43
17bf : 20 53 4b JSR $4b53 ; (freg@proxy + 0)
17c2 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
17c5 : a9 00 __ LDA #$00
17c7 : 85 03 __ STA WORK + 0 
17c9 : 85 04 __ STA WORK + 1 
17cb : a9 20 __ LDA #$20
17cd : 85 05 __ STA WORK + 2 
17cf : a9 43 __ LDA #$43
17d1 : 85 06 __ STA WORK + 3 
17d3 : 20 71 45 JSR $4571 ; (freg + 20)
17d6 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
17d9 : 20 65 48 JSR $4865 ; (f32_to_i16 + 0)
17dc : a5 1b __ LDA ACCU + 0 
17de : a4 5b __ LDY T3 + 0 
17e0 : 91 53 __ STA (T1 + 0),y 
17e2 : a5 1c __ LDA ACCU + 1 
17e4 : c8 __ __ INY
17e5 : 91 53 __ STA (T1 + 0),y 
17e7 : a9 00 __ LDA #$00
17e9 : 85 1b __ STA ACCU + 0 
17eb : 85 1c __ STA ACCU + 1 
17ed : a2 57 __ LDX #$57
17ef : 20 53 4b JSR $4b53 ; (freg@proxy + 0)
17f2 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
17f5 : a9 00 __ LDA #$00
17f7 : 85 03 __ STA WORK + 0 
17f9 : 85 04 __ STA WORK + 1 
17fb : a9 a0 __ LDA #$a0
17fd : 85 05 __ STA WORK + 2 
17ff : a9 42 __ LDA #$42
1801 : 85 06 __ STA WORK + 3 
1803 : 20 71 45 JSR $4571 ; (freg + 20)
1806 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1809 : 20 65 48 JSR $4865 ; (f32_to_i16 + 0)
180c : a5 1b __ LDA ACCU + 0 
180e : a4 5b __ LDY T3 + 0 
1810 : c8 __ __ INY
1811 : c8 __ __ INY
1812 : 91 53 __ STA (T1 + 0),y 
1814 : a5 1c __ LDA ACCU + 1 
1816 : c8 __ __ INY
1817 : 91 53 __ STA (T1 + 0),y 
1819 : 18 __ __ CLC
181a : a5 6f __ LDA T9 + 0 
181c : 69 74 __ ADC #$74
181e : 85 6f __ STA T9 + 0 
1820 : a5 70 __ LDA T9 + 1 
1822 : 69 01 __ ADC #$01
1824 : 85 70 __ STA T9 + 1 
1826 : e6 6b __ INC T8 + 0 
1828 : a5 6b __ LDA T8 + 0 
182a : c9 1f __ CMP #$1f
182c : b0 03 __ BCS $1831 ; (main.s52 + 0)
182e : 4c c4 15 JMP $15c4 ; (main.l54 + 0)
.s52:
1831 : a5 67 __ LDA T7 + 0 
1833 : 69 0b __ ADC #$0b
1835 : 85 67 __ STA T7 + 0 
1837 : 90 02 __ BCC $183b ; (main.s1153 + 0)
.s1152:
1839 : e6 68 __ INC T7 + 1 
.s1153:
183b : e6 47 __ INC T6 + 0 
183d : a5 47 __ LDA T6 + 0 
183f : c9 1f __ CMP #$1f
1841 : b0 03 __ BCS $1846 ; (main.s53 + 0)
1843 : 4c bb 15 JMP $15bb ; (main.l51 + 0)
.s53:
1846 : a2 00 __ LDX #$00
.l57:
1848 : e8 __ __ INX
1849 : bd 52 36 LDA $3652,x 
184c : d0 fa __ BNE $1848 ; (main.l57 + 0)
.s58:
184e : 86 17 __ STX P10 
1850 : a9 10 __ LDA #$10
1852 : 85 13 __ STA P6 
1854 : a9 36 __ LDA #$36
1856 : 85 16 __ STA P9 
1858 : a9 52 __ LDA #$52
185a : 85 15 __ STA P8 
185c : 20 f9 28 JSR $28f9 ; (bm_put_chars@proxy + 0)
185f : a9 00 __ LDA #$00
.l59:
1861 : 85 57 __ STA T2 + 0 
1863 : 85 1b __ STA ACCU + 0 
1865 : a9 00 __ LDA #$00
1867 : 85 1c __ STA ACCU + 1 
1869 : a9 1e __ LDA #$1e
186b : 20 25 45 JSR $4525 ; (mul16by8 + 0)
186e : a5 1b __ LDA ACCU + 0 
1870 : 85 67 __ STA T7 + 0 
1872 : a5 1c __ LDA ACCU + 1 
1874 : 85 68 __ STA T7 + 1 
1876 : a5 57 __ LDA T2 + 0 
1878 : 85 1b __ STA ACCU + 0 
187a : a9 00 __ LDA #$00
187c : 85 1c __ STA ACCU + 1 
187e : a9 7c __ LDA #$7c
1880 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
1883 : 18 __ __ CLC
1884 : a9 d0 __ LDA #$d0
1886 : 65 1b __ ADC ACCU + 0 
1888 : 85 47 __ STA T6 + 0 
188a : a9 8d __ LDA #$8d
188c : 65 1c __ ADC ACCU + 1 
188e : 85 48 __ STA T6 + 1 
1890 : a6 57 __ LDX T2 + 0 
1892 : e8 __ __ INX
1893 : 86 5f __ STX T4 + 0 
1895 : 86 1b __ STX ACCU + 0 
1897 : a9 00 __ LDA #$00
1899 : 85 6b __ STA T8 + 0 
189b : 85 1c __ STA ACCU + 1 
189d : a9 7c __ LDA #$7c
189f : 20 25 45 JSR $4525 ; (mul16by8 + 0)
18a2 : 18 __ __ CLC
18a3 : a9 d0 __ LDA #$d0
18a5 : 65 1b __ ADC ACCU + 0 
18a7 : 85 63 __ STA T5 + 0 
18a9 : a9 8d __ LDA #$8d
18ab : 65 1c __ ADC ACCU + 1 
18ad : 85 64 __ STA T5 + 1 
18af : 18 __ __ CLC
.l1144:
18b0 : a5 67 __ LDA T7 + 0 
18b2 : 65 6b __ ADC T8 + 0 
18b4 : 85 43 __ STA T0 + 0 
18b6 : a5 68 __ LDA T7 + 1 
18b8 : 69 00 __ ADC #$00
18ba : 85 1c __ STA ACCU + 1 
18bc : aa __ __ TAX
18bd : a5 43 __ LDA T0 + 0 
18bf : 0a __ __ ASL
18c0 : 26 1c __ ROL ACCU + 1 
18c2 : 18 __ __ CLC
18c3 : 65 43 __ ADC T0 + 0 
18c5 : 85 43 __ STA T0 + 0 
18c7 : 8a __ __ TXA
18c8 : 65 1c __ ADC ACCU + 1 
18ca : 06 43 __ ASL T0 + 0 
18cc : 2a __ __ ROL
18cd : aa __ __ TAX
18ce : 18 __ __ CLC
18cf : a9 d4 __ LDA #$d4
18d1 : 65 43 __ ADC T0 + 0 
18d3 : 85 6f __ STA T9 + 0 
18d5 : 8a __ __ TXA
18d6 : 69 9c __ ADC #$9c
18d8 : 85 70 __ STA T9 + 1 
18da : a5 6b __ LDA T8 + 0 
18dc : a0 04 __ LDY #$04
18de : 91 6f __ STA (T9 + 0),y 
18e0 : a5 57 __ LDA T2 + 0 
18e2 : c8 __ __ INY
18e3 : 91 6f __ STA (T9 + 0),y 
18e5 : a5 6b __ LDA T8 + 0 
18e7 : 0a __ __ ASL
18e8 : 0a __ __ ASL
18e9 : 85 71 __ STA T10 + 0 
18eb : e6 6b __ INC T8 + 0 
18ed : a5 6b __ LDA T8 + 0 
18ef : 0a __ __ ASL
18f0 : 0a __ __ ASL
18f1 : 85 73 __ STA T11 + 0 
18f3 : a8 __ __ TAY
18f4 : b1 47 __ LDA (T6 + 0),y 
18f6 : 85 53 __ STA T1 + 0 
18f8 : c8 __ __ INY
18f9 : b1 47 __ LDA (T6 + 0),y 
18fb : 85 54 __ STA T1 + 1 
18fd : c8 __ __ INY
18fe : b1 47 __ LDA (T6 + 0),y 
1900 : 85 55 __ STA T1 + 2 
1902 : c8 __ __ INY
1903 : b1 47 __ LDA (T6 + 0),y 
1905 : 85 56 __ STA T1 + 3 
1907 : a4 71 __ LDY T10 + 0 
1909 : b1 47 __ LDA (T6 + 0),y 
190b : 85 1b __ STA ACCU + 0 
190d : c8 __ __ INY
190e : b1 47 __ LDA (T6 + 0),y 
1910 : 85 1c __ STA ACCU + 1 
1912 : c8 __ __ INY
1913 : b1 47 __ LDA (T6 + 0),y 
1915 : 85 1d __ STA ACCU + 2 
1917 : c8 __ __ INY
1918 : b1 47 __ LDA (T6 + 0),y 
191a : 85 1e __ STA ACCU + 3 
191c : a2 53 __ LDX #$53
191e : 20 61 45 JSR $4561 ; (freg + 4)
1921 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1924 : a4 71 __ LDY T10 + 0 
1926 : b1 63 __ LDA (T5 + 0),y 
1928 : 85 53 __ STA T1 + 0 
192a : c8 __ __ INY
192b : b1 63 __ LDA (T5 + 0),y 
192d : 85 54 __ STA T1 + 1 
192f : c8 __ __ INY
1930 : b1 63 __ LDA (T5 + 0),y 
1932 : 85 55 __ STA T1 + 2 
1934 : c8 __ __ INY
1935 : b1 63 __ LDA (T5 + 0),y 
1937 : 85 56 __ STA T1 + 3 
1939 : a2 53 __ LDX #$53
193b : 20 61 45 JSR $4561 ; (freg + 4)
193e : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1941 : a4 73 __ LDY T11 + 0 
1943 : b1 63 __ LDA (T5 + 0),y 
1945 : 85 53 __ STA T1 + 0 
1947 : c8 __ __ INY
1948 : b1 63 __ LDA (T5 + 0),y 
194a : 85 54 __ STA T1 + 1 
194c : c8 __ __ INY
194d : b1 63 __ LDA (T5 + 0),y 
194f : 85 55 __ STA T1 + 2 
1951 : c8 __ __ INY
1952 : b1 63 __ LDA (T5 + 0),y 
1954 : 85 56 __ STA T1 + 3 
1956 : a2 53 __ LDX #$53
1958 : 20 61 45 JSR $4561 ; (freg + 4)
195b : 20 a8 45 JSR $45a8 ; (faddsub + 6)
195e : a5 1b __ LDA ACCU + 0 
1960 : a0 00 __ LDY #$00
1962 : 91 6f __ STA (T9 + 0),y 
1964 : a5 1c __ LDA ACCU + 1 
1966 : c8 __ __ INY
1967 : 91 6f __ STA (T9 + 0),y 
1969 : a5 1d __ LDA ACCU + 2 
196b : c8 __ __ INY
196c : 91 6f __ STA (T9 + 0),y 
196e : a5 1e __ LDA ACCU + 3 
1970 : c8 __ __ INY
1971 : 91 6f __ STA (T9 + 0),y 
1973 : a5 6b __ LDA T8 + 0 
1975 : c9 1e __ CMP #$1e
1977 : b0 03 __ BCS $197c ; (main.s60 + 0)
1979 : 4c b0 18 JMP $18b0 ; (main.l1144 + 0)
.s60:
197c : a5 5f __ LDA T4 + 0 
197e : c9 1e __ CMP #$1e
1980 : b0 03 __ BCS $1985 ; (main.s61 + 0)
1982 : 4c 61 18 JMP $1861 ; (main.l59 + 0)
.s61:
1985 : a9 d4 __ LDA #$d4
1987 : 88 __ __ DEY
1988 : 91 23 __ STA (SP + 0),y 
198a : a9 9c __ LDA #$9c
198c : c8 __ __ INY
198d : 91 23 __ STA (SP + 0),y 
198f : a9 84 __ LDA #$84
1991 : c8 __ __ INY
1992 : 91 23 __ STA (SP + 0),y 
1994 : a9 03 __ LDA #$03
1996 : c8 __ __ INY
1997 : 91 23 __ STA (SP + 0),y 
1999 : 20 63 36 JSR $3663 ; (qsort.s1000 + 0)
199c : a2 00 __ LDX #$00
.l63:
199e : e8 __ __ INX
199f : bd 68 38 LDA $3868,x 
19a2 : d0 fa __ BNE $199e ; (main.l63 + 0)
.s64:
19a4 : 86 17 __ STX P10 
19a6 : a9 18 __ LDA #$18
19a8 : 85 13 __ STA P6 
19aa : a9 38 __ LDA #$38
19ac : 85 16 __ STA P9 
19ae : a9 68 __ LDA #$68
19b0 : 85 15 __ STA P8 
19b2 : 20 f9 28 JSR $28f9 ; (bm_put_chars@proxy + 0)
19b5 : a9 d4 __ LDA #$d4
19b7 : 85 79 __ STA T14 + 0 
19b9 : a9 9c __ LDA #$9c
19bb : 85 7a __ STA T14 + 1 
.l65:
19bd : a0 04 __ LDY #$04
19bf : b1 79 __ LDA (T14 + 0),y 
19c1 : 85 6f __ STA T9 + 0 
19c3 : 0a __ __ ASL
19c4 : aa __ __ TAX
19c5 : a9 00 __ LDA #$00
19c7 : 2a __ __ ROL
19c8 : 85 1c __ STA ACCU + 1 
19ca : 8a __ __ TXA
19cb : 71 79 __ ADC (T14 + 0),y 
19cd : 85 57 __ STA T2 + 0 
19cf : a5 1c __ LDA ACCU + 1 
19d1 : 69 00 __ ADC #$00
19d3 : 06 57 __ ASL T2 + 0 
19d5 : 2a __ __ ROL
19d6 : 06 57 __ ASL T2 + 0 
19d8 : 2a __ __ ROL
19d9 : 85 58 __ STA T2 + 1 
19db : c8 __ __ INY
19dc : b1 79 __ LDA (T14 + 0),y 
19de : 85 71 __ STA T10 + 0 
19e0 : a2 74 __ LDX #$74
19e2 : 86 1b __ STX ACCU + 0 
19e4 : a2 01 __ LDX #$01
19e6 : 86 1c __ STX ACCU + 1 
19e8 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
19eb : 18 __ __ CLC
19ec : a9 40 __ LDA #$40
19ee : 65 1b __ ADC ACCU + 0 
19f0 : 85 5b __ STA T3 + 0 
19f2 : a9 51 __ LDA #$51
19f4 : 65 1c __ ADC ACCU + 1 
19f6 : 85 5c __ STA T3 + 1 
19f8 : 18 __ __ CLC
19f9 : a5 5b __ LDA T3 + 0 
19fb : 65 57 __ ADC T2 + 0 
19fd : 85 5f __ STA T4 + 0 
19ff : a5 5c __ LDA T3 + 1 
1a01 : 65 58 __ ADC T2 + 1 
1a03 : 85 60 __ STA T4 + 1 
1a05 : 18 __ __ CLC
1a06 : a5 6f __ LDA T9 + 0 
1a08 : 69 01 __ ADC #$01
1a0a : 85 73 __ STA T11 + 0 
1a0c : a9 00 __ LDA #$00
1a0e : 2a __ __ ROL
1a0f : 85 74 __ STA T11 + 1 
1a11 : a5 73 __ LDA T11 + 0 
1a13 : 0a __ __ ASL
1a14 : a8 __ __ TAY
1a15 : a5 74 __ LDA T11 + 1 
1a17 : 2a __ __ ROL
1a18 : aa __ __ TAX
1a19 : 98 __ __ TYA
1a1a : 18 __ __ CLC
1a1b : 65 73 __ ADC T11 + 0 
1a1d : 85 63 __ STA T5 + 0 
1a1f : 8a __ __ TXA
1a20 : 65 74 __ ADC T11 + 1 
1a22 : 06 63 __ ASL T5 + 0 
1a24 : 2a __ __ ROL
1a25 : 06 63 __ ASL T5 + 0 
1a27 : 2a __ __ ROL
1a28 : 85 64 __ STA T5 + 1 
1a2a : 18 __ __ CLC
1a2b : a5 71 __ LDA T10 + 0 
1a2d : 69 01 __ ADC #$01
1a2f : 85 75 __ STA T12 + 0 
1a31 : a2 74 __ LDX #$74
1a33 : 86 1b __ STX ACCU + 0 
1a35 : a2 01 __ LDX #$01
1a37 : 86 1c __ STX ACCU + 1 
1a39 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
1a3c : 18 __ __ CLC
1a3d : a9 40 __ LDA #$40
1a3f : 65 1b __ ADC ACCU + 0 
1a41 : 85 47 __ STA T6 + 0 
1a43 : a9 51 __ LDA #$51
1a45 : 65 1c __ ADC ACCU + 1 
1a47 : 85 48 __ STA T6 + 1 
1a49 : 18 __ __ CLC
1a4a : a5 47 __ LDA T6 + 0 
1a4c : 65 63 __ ADC T5 + 0 
1a4e : 85 67 __ STA T7 + 0 
1a50 : a5 48 __ LDA T6 + 1 
1a52 : 65 64 __ ADC T5 + 1 
1a54 : 85 68 __ STA T7 + 1 
1a56 : a9 00 __ LDA #$00
1a58 : 85 6b __ STA T8 + 0 
1a5a : 85 77 __ STA T13 + 0 
.l68:
1a5c : a4 77 __ LDY T13 + 0 
1a5e : b1 5f __ LDA (T4 + 0),y 
1a60 : 85 53 __ STA T1 + 0 
1a62 : c8 __ __ INY
1a63 : b1 5f __ LDA (T4 + 0),y 
1a65 : 85 54 __ STA T1 + 1 
1a67 : c8 __ __ INY
1a68 : b1 5f __ LDA (T4 + 0),y 
1a6a : 85 55 __ STA T1 + 2 
1a6c : c8 __ __ INY
1a6d : b1 5f __ LDA (T4 + 0),y 
1a6f : 85 56 __ STA T1 + 3 
1a71 : a4 6b __ LDY T8 + 0 
1a73 : b1 67 __ LDA (T7 + 0),y 
1a75 : 85 1b __ STA ACCU + 0 
1a77 : c8 __ __ INY
1a78 : b1 67 __ LDA (T7 + 0),y 
1a7a : 85 1c __ STA ACCU + 1 
1a7c : c8 __ __ INY
1a7d : b1 67 __ LDA (T7 + 0),y 
1a7f : 85 1d __ STA ACCU + 2 
1a81 : c8 __ __ INY
1a82 : b1 67 __ LDA (T7 + 0),y 
1a84 : 85 1e __ STA ACCU + 3 
1a86 : c8 __ __ INY
1a87 : 84 6b __ STY T8 + 0 
1a89 : a2 53 __ LDX #$53
1a8b : 20 61 45 JSR $4561 ; (freg + 4)
1a8e : a5 1e __ LDA ACCU + 3 
1a90 : 49 80 __ EOR #$80
1a92 : 85 1e __ STA ACCU + 3 
1a94 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1a97 : a5 1b __ LDA ACCU + 0 
1a99 : a6 77 __ LDX T13 + 0 
1a9b : 9d cd c7 STA $c7cd,x ; (d0 + 0)
1a9e : a5 1c __ LDA ACCU + 1 
1aa0 : 9d ce c7 STA $c7ce,x ; (d0 + 1)
1aa3 : a5 1d __ LDA ACCU + 2 
1aa5 : 9d cf c7 STA $c7cf,x ; (d0 + 2)
1aa8 : a5 1e __ LDA ACCU + 3 
1aaa : 9d d0 c7 STA $c7d0,x ; (d0 + 3)
1aad : 8a __ __ TXA
1aae : 18 __ __ CLC
1aaf : 69 04 __ ADC #$04
1ab1 : 85 77 __ STA T13 + 0 
1ab3 : a5 6b __ LDA T8 + 0 
1ab5 : c9 0c __ CMP #$0c
1ab7 : d0 a3 __ BNE $1a5c ; (main.l68 + 0)
.s67:
1ab9 : 18 __ __ CLC
1aba : a5 47 __ LDA T6 + 0 
1abc : 65 57 __ ADC T2 + 0 
1abe : 85 57 __ STA T2 + 0 
1ac0 : a5 48 __ LDA T6 + 1 
1ac2 : 65 58 __ ADC T2 + 1 
1ac4 : 85 58 __ STA T2 + 1 
1ac6 : 18 __ __ CLC
1ac7 : a5 5b __ LDA T3 + 0 
1ac9 : 65 63 __ ADC T5 + 0 
1acb : 85 5b __ STA T3 + 0 
1acd : a5 5c __ LDA T3 + 1 
1acf : 65 64 __ ADC T5 + 1 
1ad1 : 85 5c __ STA T3 + 1 
1ad3 : a9 00 __ LDA #$00
.l70:
1ad5 : 85 5f __ STA T4 + 0 
1ad7 : a8 __ __ TAY
1ad8 : b1 57 __ LDA (T2 + 0),y 
1ada : 85 53 __ STA T1 + 0 
1adc : c8 __ __ INY
1add : b1 57 __ LDA (T2 + 0),y 
1adf : 85 54 __ STA T1 + 1 
1ae1 : c8 __ __ INY
1ae2 : b1 57 __ LDA (T2 + 0),y 
1ae4 : 85 55 __ STA T1 + 2 
1ae6 : c8 __ __ INY
1ae7 : b1 57 __ LDA (T2 + 0),y 
1ae9 : 85 56 __ STA T1 + 3 
1aeb : 88 __ __ DEY
1aec : 88 __ __ DEY
1aed : 88 __ __ DEY
1aee : b1 5b __ LDA (T3 + 0),y 
1af0 : 85 1b __ STA ACCU + 0 
1af2 : c8 __ __ INY
1af3 : b1 5b __ LDA (T3 + 0),y 
1af5 : 85 1c __ STA ACCU + 1 
1af7 : c8 __ __ INY
1af8 : b1 5b __ LDA (T3 + 0),y 
1afa : 85 1d __ STA ACCU + 2 
1afc : c8 __ __ INY
1afd : b1 5b __ LDA (T3 + 0),y 
1aff : 85 1e __ STA ACCU + 3 
1b01 : a2 53 __ LDX #$53
1b03 : 20 61 45 JSR $4561 ; (freg + 4)
1b06 : a5 1e __ LDA ACCU + 3 
1b08 : 49 80 __ EOR #$80
1b0a : 85 1e __ STA ACCU + 3 
1b0c : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1b0f : a5 1b __ LDA ACCU + 0 
1b11 : a6 5f __ LDX T4 + 0 
1b13 : 9d c1 c7 STA $c7c1,x ; (d1 + 0)
1b16 : a5 1c __ LDA ACCU + 1 
1b18 : 9d c2 c7 STA $c7c2,x ; (d1 + 1)
1b1b : a5 1d __ LDA ACCU + 2 
1b1d : 9d c3 c7 STA $c7c3,x ; (d1 + 2)
1b20 : a5 1e __ LDA ACCU + 3 
1b22 : 9d c4 c7 STA $c7c4,x ; (d1 + 3)
1b25 : 8a __ __ TXA
1b26 : 18 __ __ CLC
1b27 : 69 04 __ ADC #$04
1b29 : c9 0c __ CMP #$0c
1b2b : d0 a8 __ BNE $1ad5 ; (main.l70 + 0)
.s69:
1b2d : ad cd c7 LDA $c7cd ; (d0 + 0)
1b30 : 85 63 __ STA T5 + 0 
1b32 : ad ce c7 LDA $c7ce ; (d0 + 1)
1b35 : 85 64 __ STA T5 + 1 
1b37 : ad cf c7 LDA $c7cf ; (d0 + 2)
1b3a : 85 65 __ STA T5 + 2 
1b3c : ad d0 c7 LDA $c7d0 ; (d0 + 3)
1b3f : 85 66 __ STA T5 + 3 
1b41 : ad c5 c7 LDA $c7c5 ; (d1 + 4)
1b44 : 85 53 __ STA T1 + 0 
1b46 : 85 1b __ STA ACCU + 0 
1b48 : ad c6 c7 LDA $c7c6 ; (d1 + 5)
1b4b : 85 54 __ STA T1 + 1 
1b4d : 85 1c __ STA ACCU + 1 
1b4f : ad c7 c7 LDA $c7c7 ; (d1 + 6)
1b52 : 85 55 __ STA T1 + 2 
1b54 : 85 1d __ STA ACCU + 2 
1b56 : ad c8 c7 LDA $c7c8 ; (d1 + 7)
1b59 : 85 56 __ STA T1 + 3 
1b5b : 85 1e __ STA ACCU + 3 
1b5d : a2 63 __ LDX #$63
1b5f : 20 61 45 JSR $4561 ; (freg + 4)
1b62 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1b65 : a5 1b __ LDA ACCU + 0 
1b67 : 85 5b __ STA T3 + 0 
1b69 : a5 1c __ LDA ACCU + 1 
1b6b : 85 5c __ STA T3 + 1 
1b6d : a5 1d __ LDA ACCU + 2 
1b6f : 85 5d __ STA T3 + 2 
1b71 : a5 1e __ LDA ACCU + 3 
1b73 : 85 5e __ STA T3 + 3 
1b75 : ad c1 c7 LDA $c7c1 ; (d1 + 0)
1b78 : 85 5f __ STA T4 + 0 
1b7a : ad c2 c7 LDA $c7c2 ; (d1 + 1)
1b7d : 85 60 __ STA T4 + 1 
1b7f : ad c3 c7 LDA $c7c3 ; (d1 + 2)
1b82 : 85 61 __ STA T4 + 2 
1b84 : ad c4 c7 LDA $c7c4 ; (d1 + 3)
1b87 : 85 62 __ STA T4 + 3 
1b89 : a2 5f __ LDX #$5f
1b8b : 20 3c 4b JSR $4b3c ; (freg@proxy + 0)
1b8e : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1b91 : a2 5b __ LDX #$5b
1b93 : 20 61 45 JSR $4561 ; (freg + 4)
1b96 : a5 1e __ LDA ACCU + 3 
1b98 : 49 80 __ EOR #$80
1b9a : 85 1e __ STA ACCU + 3 
1b9c : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1b9f : a5 1b __ LDA ACCU + 0 
1ba1 : 85 47 __ STA T6 + 0 
1ba3 : a5 1c __ LDA ACCU + 1 
1ba5 : 85 48 __ STA T6 + 1 
1ba7 : a5 1d __ LDA ACCU + 2 
1ba9 : 85 49 __ STA T6 + 2 
1bab : a5 1e __ LDA ACCU + 3 
1bad : 85 4a __ STA T6 + 3 
1baf : a2 1b __ LDX #$1b
1bb1 : 20 61 45 JSR $4561 ; (freg + 4)
1bb4 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1bb7 : a5 1b __ LDA ACCU + 0 
1bb9 : 85 67 __ STA T7 + 0 
1bbb : a5 1c __ LDA ACCU + 1 
1bbd : 85 68 __ STA T7 + 1 
1bbf : a5 1d __ LDA ACCU + 2 
1bc1 : 85 69 __ STA T7 + 2 
1bc3 : a5 1e __ LDA ACCU + 3 
1bc5 : 85 6a __ STA T7 + 3 
1bc7 : a2 53 __ LDX #$53
1bc9 : 20 25 4b JSR $4b25 ; (freg@proxy + 0)
1bcc : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1bcf : a5 1b __ LDA ACCU + 0 
1bd1 : 85 5b __ STA T3 + 0 
1bd3 : a5 1c __ LDA ACCU + 1 
1bd5 : 85 5c __ STA T3 + 1 
1bd7 : a5 1d __ LDA ACCU + 2 
1bd9 : 85 5d __ STA T3 + 2 
1bdb : a5 1e __ LDA ACCU + 3 
1bdd : 85 5e __ STA T3 + 3 
1bdf : ad c9 c7 LDA $c7c9 ; (d1 + 8)
1be2 : 85 53 __ STA T1 + 0 
1be4 : ad ca c7 LDA $c7ca ; (d1 + 9)
1be7 : 85 54 __ STA T1 + 1 
1be9 : ad cb c7 LDA $c7cb ; (d1 + 10)
1bec : 85 55 __ STA T1 + 2 
1bee : ad cc c7 LDA $c7cc ; (d1 + 11)
1bf1 : 85 56 __ STA T1 + 3 
1bf3 : a2 53 __ LDX #$53
1bf5 : 20 3c 4b JSR $4b3c ; (freg@proxy + 0)
1bf8 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1bfb : a2 5b __ LDX #$5b
1bfd : 20 61 45 JSR $4561 ; (freg + 4)
1c00 : 20 a2 45 JSR $45a2 ; (faddsub + 0)
1c03 : a5 1b __ LDA ACCU + 0 
1c05 : 85 43 __ STA T0 + 0 
1c07 : a5 1c __ LDA ACCU + 1 
1c09 : 85 44 __ STA T0 + 1 
1c0b : a5 1d __ LDA ACCU + 2 
1c0d : 85 45 __ STA T0 + 2 
1c0f : a5 1e __ LDA ACCU + 3 
1c11 : 85 46 __ STA T0 + 3 
1c13 : a2 1b __ LDX #$1b
1c15 : 20 61 45 JSR $4561 ; (freg + 4)
1c18 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1c1b : a5 1b __ LDA ACCU + 0 
1c1d : 85 6b __ STA T8 + 0 
1c1f : a5 1c __ LDA ACCU + 1 
1c21 : 85 6c __ STA T8 + 1 
1c23 : a5 1d __ LDA ACCU + 2 
1c25 : 85 6d __ STA T8 + 2 
1c27 : a5 1e __ LDA ACCU + 3 
1c29 : 85 6e __ STA T8 + 3 
1c2b : a2 63 __ LDX #$63
1c2d : 20 12 4b JSR $4b12 ; (freg@proxy + 0)
1c30 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1c33 : a5 1b __ LDA ACCU + 0 
1c35 : 85 5b __ STA T3 + 0 
1c37 : a5 1c __ LDA ACCU + 1 
1c39 : 85 5c __ STA T3 + 1 
1c3b : a5 1d __ LDA ACCU + 2 
1c3d : 85 5d __ STA T3 + 2 
1c3f : a5 1e __ LDA ACCU + 3 
1c41 : 85 5e __ STA T3 + 3 
1c43 : a2 5f __ LDX #$5f
1c45 : 20 25 4b JSR $4b25 ; (freg@proxy + 0)
1c48 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1c4b : a2 5b __ LDX #$5b
1c4d : 20 61 45 JSR $4561 ; (freg + 4)
1c50 : 20 a2 45 JSR $45a2 ; (faddsub + 0)
1c53 : a5 1b __ LDA ACCU + 0 
1c55 : 85 53 __ STA T1 + 0 
1c57 : a5 1c __ LDA ACCU + 1 
1c59 : 85 54 __ STA T1 + 1 
1c5b : a5 1d __ LDA ACCU + 2 
1c5d : 85 55 __ STA T1 + 2 
1c5f : a5 1e __ LDA ACCU + 3 
1c61 : 85 56 __ STA T1 + 3 
1c63 : a2 1b __ LDX #$1b
1c65 : 20 61 45 JSR $4561 ; (freg + 4)
1c68 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1c6b : a2 6b __ LDX #$6b
1c6d : 20 61 45 JSR $4561 ; (freg + 4)
1c70 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1c73 : a2 67 __ LDX #$67
1c75 : 20 61 45 JSR $4561 ; (freg + 4)
1c78 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1c7b : a5 1b __ LDA ACCU + 0 
1c7d : 85 57 __ STA T2 + 0 
1c7f : a5 1c __ LDA ACCU + 1 
1c81 : 85 58 __ STA T2 + 1 
1c83 : a5 1e __ LDA ACCU + 3 
1c85 : 85 5a __ STA T2 + 3 
1c87 : 29 7f __ AND #$7f
1c89 : 05 1d __ ORA ACCU + 2 
1c8b : 05 1c __ ORA ACCU + 1 
1c8d : a6 1d __ LDX ACCU + 2 
1c8f : 86 59 __ STX T2 + 2 
1c91 : 05 1b __ ORA ACCU + 0 
1c93 : d0 03 __ BNE $1c98 ; (main.s1115 + 0)
1c95 : 4c c1 26 JMP $26c1 ; (main.s72 + 0)
.s1115:
1c98 : 24 1e __ BIT ACCU + 3 
1c9a : 10 f9 __ BPL $1c95 ; (main.s69 + 360)
.s73:
1c9c : a9 00 __ LDA #$00
1c9e : 85 57 __ STA T2 + 0 
1ca0 : 85 58 __ STA T2 + 1 
1ca2 : a9 7f __ LDA #$7f
1ca4 : a2 80 __ LDX #$80
.s121:
1ca6 : 86 59 __ STX T2 + 2 
1ca8 : 85 5a __ STA T2 + 3 
1caa : a2 57 __ LDX #$57
1cac : 20 12 4b JSR $4b12 ; (freg@proxy + 0)
1caf : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1cb2 : a5 1b __ LDA ACCU + 0 
1cb4 : 85 5b __ STA T3 + 0 
1cb6 : a5 1c __ LDA ACCU + 1 
1cb8 : 85 5c __ STA T3 + 1 
1cba : a5 1d __ LDA ACCU + 2 
1cbc : 85 5d __ STA T3 + 2 
1cbe : a5 1e __ LDA ACCU + 3 
1cc0 : 85 5e __ STA T3 + 3 
1cc2 : a5 47 __ LDA T6 + 0 
1cc4 : 85 1b __ STA ACCU + 0 
1cc6 : a5 48 __ LDA T6 + 1 
1cc8 : 85 1c __ STA ACCU + 1 
1cca : a5 49 __ LDA T6 + 2 
1ccc : 85 1d __ STA ACCU + 2 
1cce : a5 4a __ LDA T6 + 3 
1cd0 : 85 1e __ STA ACCU + 3 
1cd2 : a2 57 __ LDX #$57
1cd4 : 20 61 45 JSR $4561 ; (freg + 4)
1cd7 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1cda : a5 1b __ LDA ACCU + 0 
1cdc : 85 53 __ STA T1 + 0 
1cde : a5 1c __ LDA ACCU + 1 
1ce0 : 85 54 __ STA T1 + 1 
1ce2 : a5 1d __ LDA ACCU + 2 
1ce4 : 85 55 __ STA T1 + 2 
1ce6 : a5 1e __ LDA ACCU + 3 
1ce8 : 85 56 __ STA T1 + 3 
1cea : a2 57 __ LDX #$57
1cec : 20 74 4b JSR $4b74 ; (freg@proxy + 0)
1cef : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1cf2 : a5 1b __ LDA ACCU + 0 
1cf4 : 85 43 __ STA T0 + 0 
1cf6 : a5 1c __ LDA ACCU + 1 
1cf8 : 85 44 __ STA T0 + 1 
1cfa : a5 1d __ LDA ACCU + 2 
1cfc : 85 45 __ STA T0 + 2 
1cfe : a5 1e __ LDA ACCU + 3 
1d00 : 85 46 __ STA T0 + 3 
1d02 : ad e7 4d LDA $4de7 ; (vlight + 4)
1d05 : 85 1b __ STA ACCU + 0 
1d07 : a9 aa __ LDA #$aa
1d09 : 85 8b __ STA T23 + 0 
1d0b : ad e8 4d LDA $4de8 ; (vlight + 5)
1d0e : 85 1c __ STA ACCU + 1 
1d10 : ad e9 4d LDA $4de9 ; (vlight + 6)
1d13 : 85 1d __ STA ACCU + 2 
1d15 : ad ea 4d LDA $4dea ; (vlight + 7)
1d18 : 85 1e __ STA ACCU + 3 
1d1a : a2 5b __ LDX #$5b
1d1c : 20 61 45 JSR $4561 ; (freg + 4)
1d1f : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1d22 : a5 1b __ LDA ACCU + 0 
1d24 : 85 5b __ STA T3 + 0 
1d26 : a5 1c __ LDA ACCU + 1 
1d28 : 85 5c __ STA T3 + 1 
1d2a : a5 1d __ LDA ACCU + 2 
1d2c : 85 5d __ STA T3 + 2 
1d2e : a5 1e __ LDA ACCU + 3 
1d30 : 85 5e __ STA T3 + 3 
1d32 : ad e3 4d LDA $4de3 ; (vlight + 0)
1d35 : 85 1b __ STA ACCU + 0 
1d37 : ad e4 4d LDA $4de4 ; (vlight + 1)
1d3a : 85 1c __ STA ACCU + 1 
1d3c : ad e5 4d LDA $4de5 ; (vlight + 2)
1d3f : 85 1d __ STA ACCU + 2 
1d41 : ad e6 4d LDA $4de6 ; (vlight + 3)
1d44 : 85 1e __ STA ACCU + 3 
1d46 : a2 43 __ LDX #$43
1d48 : 20 61 45 JSR $4561 ; (freg + 4)
1d4b : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1d4e : a2 5b __ LDX #$5b
1d50 : 20 61 45 JSR $4561 ; (freg + 4)
1d53 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1d56 : a5 1b __ LDA ACCU + 0 
1d58 : 85 43 __ STA T0 + 0 
1d5a : a5 1c __ LDA ACCU + 1 
1d5c : 85 44 __ STA T0 + 1 
1d5e : a5 1d __ LDA ACCU + 2 
1d60 : 85 45 __ STA T0 + 2 
1d62 : a5 1e __ LDA ACCU + 3 
1d64 : 85 46 __ STA T0 + 3 
1d66 : ad eb 4d LDA $4deb ; (vlight + 8)
1d69 : 85 1b __ STA ACCU + 0 
1d6b : ad ec 4d LDA $4dec ; (vlight + 9)
1d6e : 85 1c __ STA ACCU + 1 
1d70 : ad ed 4d LDA $4ded ; (vlight + 10)
1d73 : 85 1d __ STA ACCU + 2 
1d75 : ad ee 4d LDA $4dee ; (vlight + 11)
1d78 : 85 1e __ STA ACCU + 3 
1d7a : a2 53 __ LDX #$53
1d7c : 20 61 45 JSR $4561 ; (freg + 4)
1d7f : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1d82 : a2 43 __ LDX #$43
1d84 : 20 61 45 JSR $4561 ; (freg + 4)
1d87 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
1d8a : a5 1e __ LDA ACCU + 3 
1d8c : 29 7f __ AND #$7f
1d8e : 05 1d __ ORA ACCU + 2 
1d90 : 05 1c __ ORA ACCU + 1 
1d92 : 05 1b __ ORA ACCU + 0 
1d94 : f0 04 __ BEQ $1d9a ; (main.s373 + 0)
.s1114:
1d96 : 24 1e __ BIT ACCU + 3 
1d98 : 10 06 __ BPL $1da0 ; (main.s75 + 0)
.s373:
1d9a : a9 08 __ LDA #$08
1d9c : 85 43 __ STA T0 + 0 
1d9e : d0 3a __ BNE $1dda ; (main.s76 + 0)
.s75:
1da0 : a5 1b __ LDA ACCU + 0 
1da2 : 85 43 __ STA T0 + 0 
1da4 : a5 1c __ LDA ACCU + 1 
1da6 : 85 44 __ STA T0 + 1 
1da8 : a5 1d __ LDA ACCU + 2 
1daa : 85 45 __ STA T0 + 2 
1dac : a5 1e __ LDA ACCU + 3 
1dae : 85 46 __ STA T0 + 3 
1db0 : a9 00 __ LDA #$00
1db2 : 85 1b __ STA ACCU + 0 
1db4 : 85 1c __ STA ACCU + 1 
1db6 : a2 43 __ LDX #$43
1db8 : 20 69 4b JSR $4b69 ; (freg@proxy + 0)
1dbb : 20 73 34 JSR $3473 ; (crt_fmul + 0)
1dbe : 20 65 48 JSR $4865 ; (f32_to_i16 + 0)
1dc1 : 38 __ __ SEC
1dc2 : a9 08 __ LDA #$08
1dc4 : e5 1b __ SBC ACCU + 0 
1dc6 : 85 43 __ STA T0 + 0 
1dc8 : a9 00 __ LDA #$00
1dca : e5 1c __ SBC ACCU + 1 
1dcc : 30 08 __ BMI $1dd6 ; (main.s77 + 0)
.s1113:
1dce : d0 0a __ BNE $1dda ; (main.s76 + 0)
.s1112:
1dd0 : a5 43 __ LDA T0 + 0 
1dd2 : c9 05 __ CMP #$05
1dd4 : b0 04 __ BCS $1dda ; (main.s76 + 0)
.s77:
1dd6 : a9 ff __ LDA #$ff
1dd8 : 85 8b __ STA T23 + 0 
.s76:
1dda : a5 6f __ LDA T9 + 0 
1ddc : 0a __ __ ASL
1ddd : 85 53 __ STA T1 + 0 
1ddf : a9 00 __ LDA #$00
1de1 : 85 1c __ STA ACCU + 1 
1de3 : 2a __ __ ROL
1de4 : 06 53 __ ASL T1 + 0 
1de6 : 2a __ __ ROL
1de7 : 85 54 __ STA T1 + 1 
1de9 : a5 71 __ LDA T10 + 0 
1deb : 85 1b __ STA ACCU + 0 
1ded : a9 7c __ LDA #$7c
1def : 20 25 45 JSR $4525 ; (mul16by8 + 0)
1df2 : 18 __ __ CLC
1df3 : a9 cc __ LDA #$cc
1df5 : 65 1b __ ADC ACCU + 0 
1df7 : 85 85 __ STA T20 + 0 
1df9 : a8 __ __ TAY
1dfa : a9 7e __ LDA #$7e
1dfc : 65 1c __ ADC ACCU + 1 
1dfe : 85 58 __ STA T2 + 1 
1e00 : 18 __ __ CLC
1e01 : 65 54 __ ADC T1 + 1 
1e03 : 85 68 __ STA T7 + 1 
1e05 : a5 53 __ LDA T1 + 0 
1e07 : 85 67 __ STA T7 + 0 
1e09 : 85 7f __ STA T17 + 0 
1e0b : b1 67 __ LDA (T7 + 0),y 
1e0d : 85 6b __ STA T8 + 0 
1e0f : 85 63 __ STA T5 + 0 
1e11 : a9 00 __ LDA #$00
1e13 : 85 1c __ STA ACCU + 1 
1e15 : c8 __ __ INY
1e16 : b1 67 __ LDA (T7 + 0),y 
1e18 : 85 6c __ STA T8 + 1 
1e1a : 85 64 __ STA T5 + 1 
1e1c : c8 __ __ INY
1e1d : b1 67 __ LDA (T7 + 0),y 
1e1f : 85 6f __ STA T9 + 0 
1e21 : 85 47 __ STA T6 + 0 
1e23 : c8 __ __ INY
1e24 : b1 67 __ LDA (T7 + 0),y 
1e26 : 85 70 __ STA T9 + 1 
1e28 : 85 48 __ STA T6 + 1 
1e2a : a5 73 __ LDA T11 + 0 
1e2c : 0a __ __ ASL
1e2d : 85 5b __ STA T3 + 0 
1e2f : a5 74 __ LDA T11 + 1 
1e31 : 2a __ __ ROL
1e32 : 06 5b __ ASL T3 + 0 
1e34 : 2a __ __ ROL
1e35 : 85 5c __ STA T3 + 1 
1e37 : 18 __ __ CLC
1e38 : 65 58 __ ADC T2 + 1 
1e3a : 85 86 __ STA T20 + 1 
1e3c : a5 75 __ LDA T12 + 0 
1e3e : 85 1b __ STA ACCU + 0 
1e40 : a9 7c __ LDA #$7c
1e42 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
1e45 : 18 __ __ CLC
1e46 : a9 cc __ LDA #$cc
1e48 : 65 1b __ ADC ACCU + 0 
1e4a : 85 71 __ STA T10 + 0 
1e4c : a9 7e __ LDA #$7e
1e4e : 65 1c __ ADC ACCU + 1 
1e50 : aa __ __ TAX
1e51 : 18 __ __ CLC
1e52 : 65 5c __ ADC T3 + 1 
1e54 : 85 72 __ STA T10 + 1 
1e56 : a4 5b __ LDY T3 + 0 
1e58 : b1 71 __ LDA (T10 + 0),y 
1e5a : 85 73 __ STA T11 + 0 
1e5c : 85 75 __ STA T12 + 0 
1e5e : c8 __ __ INY
1e5f : b1 71 __ LDA (T10 + 0),y 
1e61 : 85 74 __ STA T11 + 1 
1e63 : 85 76 __ STA T12 + 1 
1e65 : c8 __ __ INY
1e66 : b1 71 __ LDA (T10 + 0),y 
1e68 : 85 77 __ STA T13 + 0 
1e6a : 85 7b __ STA T15 + 0 
1e6c : c8 __ __ INY
1e6d : b1 71 __ LDA (T10 + 0),y 
1e6f : 85 78 __ STA T13 + 1 
1e71 : 85 7c __ STA T15 + 1 
1e73 : a5 43 __ LDA T0 + 0 
1e75 : 0a __ __ ASL
1e76 : 0a __ __ ASL
1e77 : 0a __ __ ASL
1e78 : 18 __ __ CLC
1e79 : 69 00 __ ADC #$00
1e7b : 85 7d __ STA T16 + 0 
1e7d : a9 4e __ LDA #$4e
1e7f : 69 00 __ ADC #$00
1e81 : 85 7e __ STA T16 + 1 
1e83 : 88 __ __ DEY
1e84 : 88 __ __ DEY
1e85 : 88 __ __ DEY
1e86 : b1 85 __ LDA (T20 + 0),y 
1e88 : 85 87 __ STA T21 + 0 
1e8a : c8 __ __ INY
1e8b : b1 85 __ LDA (T20 + 0),y 
1e8d : 85 88 __ STA T21 + 1 
1e8f : 8a __ __ TXA
1e90 : 18 __ __ CLC
1e91 : 65 54 __ ADC T1 + 1 
1e93 : 85 80 __ STA T17 + 1 
1e95 : a4 71 __ LDY T10 + 0 
1e97 : b1 7f __ LDA (T17 + 0),y 
1e99 : 85 81 __ STA T18 + 0 
1e9b : c8 __ __ INY
1e9c : b1 7f __ LDA (T17 + 0),y 
1e9e : 85 82 __ STA T18 + 1 
1ea0 : c8 __ __ INY
1ea1 : b1 7f __ LDA (T17 + 0),y 
1ea3 : 85 83 __ STA T19 + 0 
1ea5 : c8 __ __ INY
1ea6 : b1 7f __ LDA (T17 + 0),y 
1ea8 : 85 84 __ STA T19 + 1 
1eaa : a4 5b __ LDY T3 + 0 
1eac : c8 __ __ INY
1ead : c8 __ __ INY
1eae : b1 85 __ LDA (T20 + 0),y 
1eb0 : 85 89 __ STA T22 + 0 
1eb2 : c8 __ __ INY
1eb3 : b1 85 __ LDA (T20 + 0),y 
1eb5 : 85 8a __ STA T22 + 1 
1eb7 : c5 70 __ CMP T9 + 1 
1eb9 : d0 08 __ BNE $1ec3 ; (main.s1111 + 0)
.s1108:
1ebb : a5 89 __ LDA T22 + 0 
1ebd : c5 6f __ CMP T9 + 0 
.s1109:
1ebf : 90 08 __ BCC $1ec9 ; (main.s83 + 0)
1ec1 : b0 1b __ BCS $1ede ; (main.s81 + 0)
.s1111:
1ec3 : 45 70 __ EOR T9 + 1 
1ec5 : 10 f8 __ BPL $1ebf ; (main.s1109 + 0)
.s1110:
1ec7 : 90 15 __ BCC $1ede ; (main.s81 + 0)
.s83:
1ec9 : a5 8a __ LDA T22 + 1 
1ecb : c5 78 __ CMP T13 + 1 
1ecd : d0 09 __ BNE $1ed8 ; (main.s1107 + 0)
.s1104:
1ecf : a5 89 __ LDA T22 + 0 
1ed1 : c5 77 __ CMP T13 + 0 
.s1105:
1ed3 : b0 09 __ BCS $1ede ; (main.s81 + 0)
1ed5 : 4c 8d 26 JMP $268d ; (main.s80 + 0)
.s1107:
1ed8 : 45 78 __ EOR T13 + 1 
1eda : 10 f7 __ BPL $1ed3 ; (main.s1105 + 0)
.s1106:
1edc : b0 f7 __ BCS $1ed5 ; (main.s1105 + 2)
.s81:
1ede : a5 78 __ LDA T13 + 1 
1ee0 : c5 70 __ CMP T9 + 1 
1ee2 : d0 09 __ BNE $1eed ; (main.s1099 + 0)
.s1096:
1ee4 : a5 77 __ LDA T13 + 0 
1ee6 : c5 6f __ CMP T9 + 0 
.s1097:
1ee8 : b0 09 __ BCS $1ef3 ; (main.s82 + 0)
1eea : 4c 61 26 JMP $2661 ; (main.s84 + 0)
.s1099:
1eed : 45 70 __ EOR T9 + 1 
1eef : 10 f7 __ BPL $1ee8 ; (main.s1097 + 0)
.s1098:
1ef1 : b0 f7 __ BCS $1eea ; (main.s1097 + 2)
.s82:
1ef3 : a5 78 __ LDA T13 + 1 
1ef5 : c5 8a __ CMP T22 + 1 
1ef7 : d0 05 __ BNE $1efe ; (main.s1095 + 0)
.s1088:
1ef9 : a5 77 __ LDA T13 + 0 
1efb : 4c 5c 26 JMP $265c ; (main.s1142 + 0)
.s1095:
1efe : 45 8a __ EOR T22 + 1 
1f00 : 30 05 __ BMI $1f07 ; (main.s1102 + 0)
.s1101:
1f02 : b0 05 __ BCS $1f09 ; (main.s86 + 0)
1f04 : 4c 20 26 JMP $2620 ; (main.s85 + 0)
.s1102:
1f07 : b0 fb __ BCS $1f04 ; (main.s1101 + 2)
.s86:
1f09 : a5 48 __ LDA T6 + 1 
1f0b : c5 7c __ CMP T15 + 1 
1f0d : d0 09 __ BNE $1f18 ; (main.s1083 + 0)
.s1080:
1f0f : a5 47 __ LDA T6 + 0 
1f11 : c5 7b __ CMP T15 + 0 
.s1085:
1f13 : b0 09 __ BCS $1f1e ; (main.s79 + 0)
1f15 : 4c c7 23 JMP $23c7 ; (main.s87 + 0)
.s1083:
1f18 : 45 7c __ EOR T15 + 1 
1f1a : 10 f7 __ BPL $1f13 ; (main.s1085 + 0)
.s1086:
1f1c : b0 f7 __ BCS $1f15 ; (main.s1085 + 2)
.s79:
1f1e : a5 6c __ LDA T8 + 1 
1f20 : 85 64 __ STA T5 + 1 
1f22 : a5 6f __ LDA T9 + 0 
1f24 : 85 47 __ STA T6 + 0 
1f26 : a5 70 __ LDA T9 + 1 
1f28 : 85 48 __ STA T6 + 1 
1f2a : a5 73 __ LDA T11 + 0 
1f2c : 85 75 __ STA T12 + 0 
1f2e : a5 74 __ LDA T11 + 1 
1f30 : 85 76 __ STA T12 + 1 
1f32 : a5 77 __ LDA T13 + 0 
1f34 : 85 7b __ STA T15 + 0 
1f36 : a5 81 __ LDA T18 + 0 
1f38 : 85 87 __ STA T21 + 0 
1f3a : a5 82 __ LDA T18 + 1 
1f3c : 85 88 __ STA T21 + 1 
1f3e : a5 83 __ LDA T19 + 0 
1f40 : 85 89 __ STA T22 + 0 
1f42 : a5 78 __ LDA T13 + 1 
1f44 : 85 7c __ STA T15 + 1 
1f46 : a4 6b __ LDY T8 + 0 
1f48 : a6 84 __ LDX T19 + 1 
1f4a : 86 8a __ STX T22 + 1 
1f4c : c5 70 __ CMP T9 + 1 
1f4e : d0 08 __ BNE $1f58 ; (main.s1060 + 0)
.s1057:
1f50 : a5 77 __ LDA T13 + 0 
1f52 : c5 6f __ CMP T9 + 0 
.s1058:
1f54 : 90 08 __ BCC $1f5e ; (main.s98 + 0)
1f56 : b0 1b __ BCS $1f73 ; (main.s96 + 0)
.s1060:
1f58 : 45 70 __ EOR T9 + 1 
1f5a : 10 f8 __ BPL $1f54 ; (main.s1058 + 0)
.s1059:
1f5c : 90 15 __ BCC $1f73 ; (main.s96 + 0)
.s98:
1f5e : a5 78 __ LDA T13 + 1 
1f60 : c5 84 __ CMP T19 + 1 
1f62 : d0 09 __ BNE $1f6d ; (main.s1056 + 0)
.s1053:
1f64 : a5 77 __ LDA T13 + 0 
1f66 : c5 83 __ CMP T19 + 0 
.s1054:
1f68 : b0 09 __ BCS $1f73 ; (main.s96 + 0)
1f6a : 4c 98 23 JMP $2398 ; (main.s95 + 0)
.s1056:
1f6d : 45 84 __ EOR T19 + 1 
1f6f : 10 f7 __ BPL $1f68 ; (main.s1054 + 0)
.s1055:
1f71 : b0 f7 __ BCS $1f6a ; (main.s1054 + 2)
.s96:
1f73 : 8a __ __ TXA
1f74 : e4 70 __ CPX T9 + 1 
1f76 : d0 09 __ BNE $1f81 ; (main.s1048 + 0)
.s1045:
1f78 : a5 83 __ LDA T19 + 0 
1f7a : c5 6f __ CMP T9 + 0 
.s1046:
1f7c : b0 09 __ BCS $1f87 ; (main.s97 + 0)
1f7e : 4c 72 23 JMP $2372 ; (main.s99 + 0)
.s1048:
1f81 : 45 70 __ EOR T9 + 1 
1f83 : 10 f7 __ BPL $1f7c ; (main.s1046 + 0)
.s1047:
1f85 : b0 f7 __ BCS $1f7e ; (main.s1046 + 2)
.s97:
1f87 : 8a __ __ TXA
1f88 : e4 78 __ CPX T13 + 1 
1f8a : d0 05 __ BNE $1f91 ; (main.s1044 + 0)
.s1037:
1f8c : a5 83 __ LDA T19 + 0 
1f8e : 4c 6d 23 JMP $236d ; (main.s1143 + 0)
.s1044:
1f91 : 45 78 __ EOR T13 + 1 
1f93 : 30 05 __ BMI $1f9a ; (main.s1051 + 0)
.s1050:
1f95 : b0 05 __ BCS $1f9c ; (main.s101 + 0)
1f97 : 4c 31 23 JMP $2331 ; (main.s100 + 0)
.s1051:
1f9a : b0 fb __ BCS $1f97 ; (main.s1050 + 2)
.s101:
1f9c : a5 48 __ LDA T6 + 1 
1f9e : c5 8a __ CMP T22 + 1 
1fa0 : d0 09 __ BNE $1fab ; (main.s1032 + 0)
.s1029:
1fa2 : a5 47 __ LDA T6 + 0 
1fa4 : c5 89 __ CMP T22 + 0 
.s1034:
1fa6 : b0 09 __ BCS $1fb1 ; (main.s78 + 0)
1fa8 : 4c de 20 JMP $20de ; (main.s102 + 0)
.s1032:
1fab : 45 8a __ EOR T22 + 1 
1fad : 10 f7 __ BPL $1fa6 ; (main.s1034 + 0)
.s1035:
1faf : b0 f7 __ BCS $1fa8 ; (main.s1034 + 2)
.s78:
1fb1 : a4 5b __ LDY T3 + 0 
1fb3 : b1 85 __ LDA (T20 + 0),y 
1fb5 : 85 17 __ STA P10 
1fb7 : c8 __ __ INY
1fb8 : b1 85 __ LDA (T20 + 0),y 
1fba : 85 18 __ STA P11 
1fbc : c8 __ __ INY
1fbd : b1 85 __ LDA (T20 + 0),y 
1fbf : 8d f6 c7 STA $c7f6 ; (sstack + 0)
1fc2 : c8 __ __ INY
1fc3 : b1 85 __ LDA (T20 + 0),y 
1fc5 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
1fc8 : a4 85 __ LDY T20 + 0 
1fca : b1 67 __ LDA (T7 + 0),y 
1fcc : 85 13 __ STA P6 
1fce : c8 __ __ INY
1fcf : b1 67 __ LDA (T7 + 0),y 
1fd1 : 85 14 __ STA P7 
1fd3 : c8 __ __ INY
1fd4 : b1 67 __ LDA (T7 + 0),y 
1fd6 : 85 15 __ STA P8 
1fd8 : c8 __ __ INY
1fd9 : b1 67 __ LDA (T7 + 0),y 
1fdb : 85 16 __ STA P9 
1fdd : a5 8b __ LDA T23 + 0 
1fdf : 8d f8 c7 STA $c7f8 ; (sstack + 2)
1fe2 : 20 2c 3c JSR $3c2c ; (bm_line.s1000 + 0)
1fe5 : a4 5b __ LDY T3 + 0 
1fe7 : b1 71 __ LDA (T10 + 0),y 
1fe9 : 85 17 __ STA P10 
1feb : c8 __ __ INY
1fec : b1 71 __ LDA (T10 + 0),y 
1fee : 85 18 __ STA P11 
1ff0 : c8 __ __ INY
1ff1 : b1 71 __ LDA (T10 + 0),y 
1ff3 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
1ff6 : c8 __ __ INY
1ff7 : b1 71 __ LDA (T10 + 0),y 
1ff9 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
1ffc : a4 71 __ LDY T10 + 0 
1ffe : b1 7f __ LDA (T17 + 0),y 
2000 : 85 13 __ STA P6 
2002 : c8 __ __ INY
2003 : b1 7f __ LDA (T17 + 0),y 
2005 : 85 14 __ STA P7 
2007 : c8 __ __ INY
2008 : b1 7f __ LDA (T17 + 0),y 
200a : 85 15 __ STA P8 
200c : c8 __ __ INY
200d : b1 7f __ LDA (T17 + 0),y 
200f : 85 16 __ STA P9 
2011 : a5 8b __ LDA T23 + 0 
2013 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
2016 : 20 2c 3c JSR $3c2c ; (bm_line.s1000 + 0)
2019 : a4 71 __ LDY T10 + 0 
201b : b1 7f __ LDA (T17 + 0),y 
201d : 85 17 __ STA P10 
201f : c8 __ __ INY
2020 : b1 7f __ LDA (T17 + 0),y 
2022 : 85 18 __ STA P11 
2024 : c8 __ __ INY
2025 : c8 __ __ INY
2026 : b1 7f __ LDA (T17 + 0),y 
2028 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
202b : a4 85 __ LDY T20 + 0 
202d : b1 67 __ LDA (T7 + 0),y 
202f : 85 13 __ STA P6 
2031 : c8 __ __ INY
2032 : b1 67 __ LDA (T7 + 0),y 
2034 : 85 14 __ STA P7 
2036 : c8 __ __ INY
2037 : b1 67 __ LDA (T7 + 0),y 
2039 : 85 15 __ STA P8 
203b : c8 __ __ INY
203c : b1 67 __ LDA (T7 + 0),y 
203e : 85 16 __ STA P9 
2040 : a4 71 __ LDY T10 + 0 
2042 : c8 __ __ INY
2043 : c8 __ __ INY
2044 : b1 7f __ LDA (T17 + 0),y 
2046 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
2049 : a5 8b __ LDA T23 + 0 
204b : 8d f8 c7 STA $c7f8 ; (sstack + 2)
204e : 20 2c 3c JSR $3c2c ; (bm_line.s1000 + 0)
2051 : a4 5b __ LDY T3 + 0 
2053 : b1 71 __ LDA (T10 + 0),y 
2055 : 85 17 __ STA P10 
2057 : c8 __ __ INY
2058 : b1 71 __ LDA (T10 + 0),y 
205a : 85 18 __ STA P11 
205c : c8 __ __ INY
205d : b1 71 __ LDA (T10 + 0),y 
205f : 8d f6 c7 STA $c7f6 ; (sstack + 0)
2062 : c8 __ __ INY
2063 : b1 71 __ LDA (T10 + 0),y 
2065 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
2068 : 88 __ __ DEY
2069 : 88 __ __ DEY
206a : 88 __ __ DEY
206b : b1 85 __ LDA (T20 + 0),y 
206d : 85 13 __ STA P6 
206f : c8 __ __ INY
2070 : b1 85 __ LDA (T20 + 0),y 
2072 : 85 14 __ STA P7 
2074 : c8 __ __ INY
2075 : b1 85 __ LDA (T20 + 0),y 
2077 : 85 15 __ STA P8 
2079 : c8 __ __ INY
207a : b1 85 __ LDA (T20 + 0),y 
207c : 85 16 __ STA P9 
207e : a5 8b __ LDA T23 + 0 
2080 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
2083 : 20 2c 3c JSR $3c2c ; (bm_line.s1000 + 0)
2086 : 18 __ __ CLC
2087 : a5 79 __ LDA T14 + 0 
2089 : 69 06 __ ADC #$06
208b : 85 79 __ STA T14 + 0 
208d : 90 02 __ BCC $2091 ; (main.s1157 + 0)
.s1156:
208f : e6 7a __ INC T14 + 1 
.s1157:
2091 : c9 ec __ CMP #$ec
2093 : f0 03 __ BEQ $2098 ; (main.s1008 + 0)
2095 : 4c bd 19 JMP $19bd ; (main.l65 + 0)
.s1008:
2098 : a5 7a __ LDA T14 + 1 
209a : c9 b1 __ CMP #$b1
209c : d0 f7 __ BNE $2095 ; (main.s1157 + 4)
.s66:
209e : a9 36 __ LDA #$36
20a0 : 85 01 __ STA $01 
20a2 : 20 1e 45 JSR $451e ; (getch.l53 + 0)
20a5 : a9 1b __ LDA #$1b
20a7 : 8d 11 d0 STA $d011 
20aa : a9 08 __ LDA #$08
20ac : 8d 16 d0 STA $d016 
20af : ad 00 dd LDA $dd00 
20b2 : 29 fc __ AND #$fc
20b4 : 09 03 __ ORA #$03
20b6 : 8d 00 dd STA $dd00 
20b9 : a9 00 __ LDA #$00
20bb : 85 1b __ STA ACCU + 0 
20bd : 85 1c __ STA ACCU + 1 
20bf : a9 14 __ LDA #$14
20c1 : 8d 18 d0 STA $d018 
20c4 : a9 37 __ LDA #$37
20c6 : 85 01 __ STA $01 
.s1001:
20c8 : 18 __ __ CLC
20c9 : a5 23 __ LDA SP + 0 
20cb : 69 06 __ ADC #$06
20cd : 85 23 __ STA SP + 0 
20cf : 90 02 __ BCC $20d3 ; (main.s1001 + 11)
20d1 : e6 24 __ INC SP + 1 
20d3 : a2 38 __ LDX #$38
20d5 : bd 44 c7 LDA $c744,x ; (main@stack + 0)
20d8 : 95 53 __ STA T1 + 0,x 
20da : ca __ __ DEX
20db : 10 f8 __ BPL $20d5 ; (main.s1001 + 13)
20dd : 60 __ __ RTS
.s102:
20de : 84 0f __ STY P2 
20e0 : 84 13 __ STY P6 
20e2 : a5 64 __ LDA T5 + 1 
20e4 : 85 46 __ STA T0 + 3 
20e6 : 85 10 __ STA P3 
20e8 : 85 14 __ STA P7 
20ea : a9 00 __ LDA #$00
20ec : 85 43 __ STA T0 + 0 
20ee : 85 0d __ STA P0 
20f0 : 85 11 __ STA P4 
20f2 : 85 44 __ STA T0 + 1 
20f4 : 85 0e __ STA P1 
20f6 : 85 12 __ STA P5 
20f8 : 38 __ __ SEC
20f9 : a5 87 __ LDA T21 + 0 
20fb : e5 0f __ SBC P2 
20fd : 85 1d __ STA ACCU + 2 
20ff : a5 88 __ LDA T21 + 1 
2101 : e5 10 __ SBC P3 
2103 : 85 1e __ STA ACCU + 3 
2105 : 38 __ __ SEC
2106 : a5 89 __ LDA T22 + 0 
2108 : e5 47 __ SBC T6 + 0 
210a : 85 03 __ STA WORK + 0 
210c : a5 8a __ LDA T22 + 1 
210e : e5 48 __ SBC T6 + 1 
2110 : 85 04 __ STA WORK + 1 
2112 : 29 80 __ AND #$80
2114 : 10 02 __ BPL $2118 ; (main.s102 + 58)
2116 : a9 ff __ LDA #$ff
2118 : 85 06 __ STA WORK + 3 
211a : 85 05 __ STA WORK + 2 
211c : a9 00 __ LDA #$00
211e : 85 1b __ STA ACCU + 0 
2120 : 85 1c __ STA ACCU + 1 
2122 : 20 a6 49 JSR $49a6 ; (divs32 + 0)
2125 : a5 1b __ LDA ACCU + 0 
2127 : 85 5f __ STA T4 + 0 
2129 : a5 1c __ LDA ACCU + 1 
212b : 85 60 __ STA T4 + 1 
212d : a5 1d __ LDA ACCU + 2 
212f : 85 61 __ STA T4 + 2 
2131 : a5 1e __ LDA ACCU + 3 
2133 : 85 62 __ STA T4 + 3 
2135 : a5 48 __ LDA T6 + 1 
2137 : c5 7c __ CMP T15 + 1 
2139 : d0 09 __ BNE $2144 ; (main.s1028 + 0)
.s1025:
213b : a5 47 __ LDA T6 + 0 
213d : c5 7b __ CMP T15 + 0 
.s1026:
213f : b0 09 __ BCS $214a ; (main.s104 + 0)
2141 : 4c 1a 22 JMP $221a ; (main.s103 + 0)
.s1028:
2144 : 45 7c __ EOR T15 + 1 
2146 : 10 f7 __ BPL $213f ; (main.s1026 + 0)
.s1027:
2148 : b0 f7 __ BCS $2141 ; (main.s1026 + 2)
.s104:
214a : a5 7b __ LDA T15 + 0 
214c : 8d fa c7 STA $c7fa ; (sstack + 4)
214f : a5 7c __ LDA T15 + 1 
2151 : 8d fb c7 STA $c7fb ; (sstack + 5)
2154 : a5 89 __ LDA T22 + 0 
2156 : 8d fc c7 STA $c7fc ; (sstack + 6)
2159 : 38 __ __ SEC
215a : e5 7b __ SBC T15 + 0 
215c : 85 03 __ STA WORK + 0 
215e : a5 8a __ LDA T22 + 1 
2160 : 8d fd c7 STA $c7fd ; (sstack + 7)
2163 : e5 7c __ SBC T15 + 1 
2165 : 85 04 __ STA WORK + 1 
2167 : 29 80 __ AND #$80
2169 : 10 02 __ BPL $216d ; (main.s104 + 35)
216b : a9 ff __ LDA #$ff
216d : 85 06 __ STA WORK + 3 
216f : 85 05 __ STA WORK + 2 
2171 : a5 7d __ LDA T16 + 0 
2173 : 8d fe c7 STA $c7fe ; (sstack + 8)
2176 : a5 7e __ LDA T16 + 1 
2178 : 8d ff c7 STA $c7ff ; (sstack + 9)
217b : 38 __ __ SEC
217c : a5 87 __ LDA T21 + 0 
217e : e5 75 __ SBC T12 + 0 
2180 : 85 1d __ STA ACCU + 2 
2182 : a5 88 __ LDA T21 + 1 
2184 : e5 76 __ SBC T12 + 1 
2186 : 85 1e __ STA ACCU + 3 
2188 : a9 00 __ LDA #$00
218a : 85 1b __ STA ACCU + 0 
218c : 85 1c __ STA ACCU + 1 
218e : 20 a6 49 JSR $49a6 ; (divs32 + 0)
2191 : a5 76 __ LDA T12 + 1 
2193 : c5 46 __ CMP T0 + 3 
2195 : f0 74 __ BEQ $220b ; (main.s1010 + 0)
.s1015:
2197 : 45 46 __ EOR T0 + 3 
2199 : 30 04 __ BMI $219f ; (main.s1014 + 0)
.s1013:
219b : b0 04 __ BCS $21a1 ; (main.s109 + 0)
219d : 90 34 __ BCC $21d3 ; (main.s108 + 0)
.s1014:
219f : b0 32 __ BCS $21d3 ; (main.s108 + 0)
.s109:
21a1 : a9 00 __ LDA #$00
21a3 : 85 11 __ STA P4 
21a5 : 85 12 __ STA P5 
21a7 : a5 75 __ LDA T12 + 0 
21a9 : 85 13 __ STA P6 
21ab : a5 76 __ LDA T12 + 1 
21ad : 85 14 __ STA P7 
21af : a5 5f __ LDA T4 + 0 
21b1 : 85 15 __ STA P8 
21b3 : a5 60 __ LDA T4 + 1 
21b5 : 85 16 __ STA P9 
21b7 : a5 61 __ LDA T4 + 2 
21b9 : 85 17 __ STA P10 
21bb : a5 62 __ LDA T4 + 3 
21bd : 85 18 __ STA P11 
21bf : a5 1b __ LDA ACCU + 0 
21c1 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
21c4 : a5 1c __ LDA ACCU + 1 
21c6 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
21c9 : a5 1d __ LDA ACCU + 2 
21cb : 8d f8 c7 STA $c7f8 ; (sstack + 2)
21ce : a5 1e __ LDA ACCU + 3 
21d0 : 4c 02 22 JMP $2202 ; (main.s585 + 0)
.s108:
21d3 : a9 00 __ LDA #$00
21d5 : 85 0d __ STA P0 
21d7 : 85 0e __ STA P1 
21d9 : a5 75 __ LDA T12 + 0 
21db : 85 0f __ STA P2 
21dd : a5 76 __ LDA T12 + 1 
21df : 85 10 __ STA P3 
21e1 : a5 1b __ LDA ACCU + 0 
21e3 : 85 15 __ STA P8 
21e5 : a5 1c __ LDA ACCU + 1 
21e7 : 85 16 __ STA P9 
21e9 : a5 1d __ LDA ACCU + 2 
21eb : 85 17 __ STA P10 
21ed : a5 1e __ LDA ACCU + 3 
21ef : 85 18 __ STA P11 
21f1 : a5 5f __ LDA T4 + 0 
21f3 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
21f6 : a5 60 __ LDA T4 + 1 
21f8 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
21fb : a5 61 __ LDA T4 + 2 
21fd : 8d f8 c7 STA $c7f8 ; (sstack + 2)
2200 : a5 62 __ LDA T4 + 3 
.s585:
2202 : 8d f9 c7 STA $c7f9 ; (sstack + 3)
2205 : 20 79 38 JSR $3879 ; (bm_trapezoid_fill.s1000 + 0)
2208 : 4c b1 1f JMP $1fb1 ; (main.s78 + 0)
.s1010:
220b : a5 75 __ LDA T12 + 0 
220d : c5 0f __ CMP P2 
220f : d0 8a __ BNE $219b ; (main.s1013 + 0)
.s1011:
2211 : a5 44 __ LDA T0 + 1 
2213 : d0 be __ BNE $21d3 ; (main.s108 + 0)
.s1012:
2215 : c5 43 __ CMP T0 + 0 
2217 : 4c 9b 21 JMP $219b ; (main.s1013 + 0)
.s103:
221a : a5 47 __ LDA T6 + 0 
221c : 8d fa c7 STA $c7fa ; (sstack + 4)
221f : a5 48 __ LDA T6 + 1 
2221 : 8d fb c7 STA $c7fb ; (sstack + 5)
2224 : a5 7b __ LDA T15 + 0 
2226 : 8d fc c7 STA $c7fc ; (sstack + 6)
2229 : 38 __ __ SEC
222a : e5 47 __ SBC T6 + 0 
222c : 85 53 __ STA T1 + 0 
222e : 85 03 __ STA WORK + 0 
2230 : a5 7c __ LDA T15 + 1 
2232 : 8d fd c7 STA $c7fd ; (sstack + 7)
2235 : e5 48 __ SBC T6 + 1 
2237 : 85 54 __ STA T1 + 1 
2239 : 85 04 __ STA WORK + 1 
223b : 29 80 __ AND #$80
223d : 10 02 __ BPL $2241 ; (main.s103 + 39)
223f : a9 ff __ LDA #$ff
2241 : 85 55 __ STA T1 + 2 
2243 : 85 06 __ STA WORK + 3 
2245 : 85 05 __ STA WORK + 2 
2247 : a5 7d __ LDA T16 + 0 
2249 : 8d fe c7 STA $c7fe ; (sstack + 8)
224c : a5 7e __ LDA T16 + 1 
224e : 8d ff c7 STA $c7ff ; (sstack + 9)
2251 : 38 __ __ SEC
2252 : a5 75 __ LDA T12 + 0 
2254 : e5 0f __ SBC P2 
2256 : 85 1d __ STA ACCU + 2 
2258 : a5 76 __ LDA T12 + 1 
225a : e5 10 __ SBC P3 
225c : 85 1e __ STA ACCU + 3 
225e : a9 00 __ LDA #$00
2260 : 85 1b __ STA ACCU + 0 
2262 : 85 1c __ STA ACCU + 1 
2264 : 20 a6 49 JSR $49a6 ; (divs32 + 0)
2267 : a5 1e __ LDA ACCU + 3 
2269 : c5 62 __ CMP T4 + 3 
226b : d0 03 __ BNE $2270 ; (main.s1024 + 0)
226d : 4c 1b 23 JMP $231b ; (main.s1019 + 0)
.s1024:
2270 : 45 62 __ EOR T4 + 3 
2272 : 30 04 __ BMI $2278 ; (main.s1023 + 0)
.s1022:
2274 : b0 04 __ BCS $227a ; (main.s106 + 0)
2276 : 90 26 __ BCC $229e ; (main.s105 + 0)
.s1023:
2278 : b0 24 __ BCS $229e ; (main.s105 + 0)
.s106:
227a : a5 5f __ LDA T4 + 0 
227c : 85 15 __ STA P8 
227e : a5 60 __ LDA T4 + 1 
2280 : 85 16 __ STA P9 
2282 : a5 61 __ LDA T4 + 2 
2284 : 85 17 __ STA P10 
2286 : a5 62 __ LDA T4 + 3 
2288 : 85 18 __ STA P11 
228a : a5 1b __ LDA ACCU + 0 
228c : 8d f6 c7 STA $c7f6 ; (sstack + 0)
228f : a5 1c __ LDA ACCU + 1 
2291 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
2294 : a5 1d __ LDA ACCU + 2 
2296 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
2299 : a5 1e __ LDA ACCU + 3 
229b : 4c bf 22 JMP $22bf ; (main.s577 + 0)
.s105:
229e : a5 1b __ LDA ACCU + 0 
22a0 : 85 15 __ STA P8 
22a2 : a5 1c __ LDA ACCU + 1 
22a4 : 85 16 __ STA P9 
22a6 : a5 1d __ LDA ACCU + 2 
22a8 : 85 17 __ STA P10 
22aa : a5 1e __ LDA ACCU + 3 
22ac : 85 18 __ STA P11 
22ae : a5 5f __ LDA T4 + 0 
22b0 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
22b3 : a5 60 __ LDA T4 + 1 
22b5 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
22b8 : a5 61 __ LDA T4 + 2 
22ba : 8d f8 c7 STA $c7f8 ; (sstack + 2)
22bd : a5 62 __ LDA T4 + 3 
.s577:
22bf : 8d f9 c7 STA $c7f9 ; (sstack + 3)
22c2 : 20 79 38 JSR $3879 ; (bm_trapezoid_fill.s1000 + 0)
22c5 : a5 8a __ LDA T22 + 1 
22c7 : c5 7c __ CMP T15 + 1 
22c9 : d0 09 __ BNE $22d4 ; (main.s107 + 0)
.s1016:
22cb : a5 89 __ LDA T22 + 0 
22cd : c5 7b __ CMP T15 + 0 
22cf : d0 03 __ BNE $22d4 ; (main.s107 + 0)
22d1 : 4c b1 1f JMP $1fb1 ; (main.s78 + 0)
.s107:
22d4 : a5 5f __ LDA T4 + 0 
22d6 : 85 1b __ STA ACCU + 0 
22d8 : a5 60 __ LDA T4 + 1 
22da : 85 1c __ STA ACCU + 1 
22dc : a5 61 __ LDA T4 + 2 
22de : 85 1d __ STA ACCU + 2 
22e0 : a5 62 __ LDA T4 + 3 
22e2 : 85 1e __ STA ACCU + 3 
22e4 : a5 53 __ LDA T1 + 0 
22e6 : 85 03 __ STA WORK + 0 
22e8 : a5 54 __ LDA T1 + 1 
22ea : 85 04 __ STA WORK + 1 
22ec : a5 55 __ LDA T1 + 2 
22ee : 85 05 __ STA WORK + 2 
22f0 : 85 06 __ STA WORK + 3 
22f2 : 20 4d 49 JSR $494d ; (mul32 + 0)
22f5 : a5 07 __ LDA WORK + 4 
22f7 : 85 43 __ STA T0 + 0 
22f9 : 85 0d __ STA P0 
22fb : 85 11 __ STA P4 
22fd : a5 08 __ LDA WORK + 5 
22ff : 85 44 __ STA T0 + 1 
2301 : 85 0e __ STA P1 
2303 : 85 12 __ STA P5 
2305 : 18 __ __ CLC
2306 : a5 09 __ LDA WORK + 6 
2308 : 65 0f __ ADC P2 
230a : 85 0f __ STA P2 
230c : 85 13 __ STA P6 
230e : a5 0a __ LDA WORK + 7 
2310 : 65 10 __ ADC P3 
2312 : 85 46 __ STA T0 + 3 
2314 : 85 10 __ STA P3 
2316 : 85 14 __ STA P7 
2318 : 4c 4a 21 JMP $214a ; (main.s104 + 0)
.s1019:
231b : a5 1d __ LDA ACCU + 2 
231d : c5 61 __ CMP T4 + 2 
231f : f0 03 __ BEQ $2324 ; (main.s1020 + 0)
2321 : 4c 74 22 JMP $2274 ; (main.s1022 + 0)
.s1020:
2324 : a5 1c __ LDA ACCU + 1 
2326 : c5 60 __ CMP T4 + 1 
2328 : d0 f7 __ BNE $2321 ; (main.s1019 + 6)
.s1021:
232a : a5 1b __ LDA ACCU + 0 
232c : c5 5f __ CMP T4 + 0 
232e : 4c 74 22 JMP $2274 ; (main.s1022 + 0)
.s100:
2331 : a5 7b __ LDA T15 + 0 
2333 : 85 43 __ STA T0 + 0 
2335 : a5 7c __ LDA T15 + 1 
2337 : 85 44 __ STA T0 + 1 
2339 : a5 89 __ LDA T22 + 0 
233b : 85 7b __ STA T15 + 0 
233d : a5 8a __ LDA T22 + 1 
233f : 85 7c __ STA T15 + 1 
2341 : a5 43 __ LDA T0 + 0 
2343 : 85 89 __ STA T22 + 0 
2345 : a5 44 __ LDA T0 + 1 
2347 : 85 8a __ STA T22 + 1 
2349 : a5 87 __ LDA T21 + 0 
234b : a6 75 __ LDX T12 + 0 
234d : 86 87 __ STX T21 + 0 
234f : 85 75 __ STA T12 + 0 
2351 : a5 88 __ LDA T21 + 1 
2353 : a6 76 __ LDX T12 + 1 
2355 : 86 88 __ STX T21 + 1 
2357 : 85 76 __ STA T12 + 1 
2359 : a5 48 __ LDA T6 + 1 
235b : c5 44 __ CMP T0 + 1 
235d : d0 07 __ BNE $2366 ; (main.s1036 + 0)
.s1033:
235f : a5 47 __ LDA T6 + 0 
2361 : c5 43 __ CMP T0 + 0 
2363 : 4c a6 1f JMP $1fa6 ; (main.s1034 + 0)
.s1036:
2366 : 45 44 __ EOR T0 + 1 
2368 : 10 f9 __ BPL $2363 ; (main.s1033 + 4)
236a : 4c af 1f JMP $1faf ; (main.s1035 + 0)
.s1143:
236d : c5 77 __ CMP T13 + 0 
236f : 4c 95 1f JMP $1f95 ; (main.s1050 + 0)
.s99:
2372 : 86 48 __ STX T6 + 1 
2374 : 84 87 __ STY T21 + 0 
2376 : a5 83 __ LDA T19 + 0 
2378 : 85 47 __ STA T6 + 0 
237a : a5 6f __ LDA T9 + 0 
237c : 85 89 __ STA T22 + 0 
237e : a5 82 __ LDA T18 + 1 
2380 : 85 64 __ STA T5 + 1 
2382 : a5 6c __ LDA T8 + 1 
2384 : 85 88 __ STA T21 + 1 
2386 : a5 70 __ LDA T9 + 1 
2388 : 85 8a __ STA T22 + 1 
238a : a4 81 __ LDY T18 + 0 
238c : c5 78 __ CMP T13 + 1 
238e : f0 03 __ BEQ $2393 ; (main.s1041 + 0)
2390 : 4c 91 1f JMP $1f91 ; (main.s1044 + 0)
.s1041:
2393 : a5 6f __ LDA T9 + 0 
2395 : 4c 6d 23 JMP $236d ; (main.s1143 + 0)
.s95:
2398 : 84 75 __ STY T12 + 0 
239a : a5 77 __ LDA T13 + 0 
239c : 85 47 __ STA T6 + 0 
239e : a5 78 __ LDA T13 + 1 
23a0 : 85 48 __ STA T6 + 1 
23a2 : a5 6f __ LDA T9 + 0 
23a4 : 85 7b __ STA T15 + 0 
23a6 : a5 70 __ LDA T9 + 1 
23a8 : 85 7c __ STA T15 + 1 
23aa : a5 74 __ LDA T11 + 1 
23ac : 85 64 __ STA T5 + 1 
23ae : a5 6c __ LDA T8 + 1 
23b0 : 85 76 __ STA T12 + 1 
23b2 : 8a __ __ TXA
23b3 : a4 73 __ LDY T11 + 0 
23b5 : c5 70 __ CMP T9 + 1 
23b7 : d0 07 __ BNE $23c0 ; (main.s1052 + 0)
.s1049:
23b9 : a5 83 __ LDA T19 + 0 
23bb : c5 6f __ CMP T9 + 0 
23bd : 4c 95 1f JMP $1f95 ; (main.s1050 + 0)
.s1052:
23c0 : 45 70 __ EOR T9 + 1 
23c2 : 10 f9 __ BPL $23bd ; (main.s1049 + 4)
23c4 : 4c 9a 1f JMP $1f9a ; (main.s1051 + 0)
.s87:
23c7 : a5 64 __ LDA T5 + 1 
23c9 : 85 46 __ STA T0 + 3 
23cb : 85 10 __ STA P3 
23cd : 85 14 __ STA P7 
23cf : a5 63 __ LDA T5 + 0 
23d1 : 85 45 __ STA T0 + 2 
23d3 : 85 0f __ STA P2 
23d5 : 85 13 __ STA P6 
23d7 : a9 00 __ LDA #$00
23d9 : 85 43 __ STA T0 + 0 
23db : 85 0d __ STA P0 
23dd : 85 11 __ STA P4 
23df : 85 44 __ STA T0 + 1 
23e1 : 85 0e __ STA P1 
23e3 : 85 12 __ STA P5 
23e5 : 38 __ __ SEC
23e6 : a5 75 __ LDA T12 + 0 
23e8 : e5 0f __ SBC P2 
23ea : 85 1d __ STA ACCU + 2 
23ec : a5 76 __ LDA T12 + 1 
23ee : e5 10 __ SBC P3 
23f0 : 85 1e __ STA ACCU + 3 
23f2 : 38 __ __ SEC
23f3 : a5 7b __ LDA T15 + 0 
23f5 : e5 47 __ SBC T6 + 0 
23f7 : 85 03 __ STA WORK + 0 
23f9 : a5 7c __ LDA T15 + 1 
23fb : e5 48 __ SBC T6 + 1 
23fd : 85 04 __ STA WORK + 1 
23ff : 29 80 __ AND #$80
2401 : 10 02 __ BPL $2405 ; (main.s87 + 62)
2403 : a9 ff __ LDA #$ff
2405 : 85 06 __ STA WORK + 3 
2407 : 85 05 __ STA WORK + 2 
2409 : a9 00 __ LDA #$00
240b : 85 1b __ STA ACCU + 0 
240d : 85 1c __ STA ACCU + 1 
240f : 20 a6 49 JSR $49a6 ; (divs32 + 0)
2412 : a5 1b __ LDA ACCU + 0 
2414 : 85 5f __ STA T4 + 0 
2416 : a5 1c __ LDA ACCU + 1 
2418 : 85 60 __ STA T4 + 1 
241a : a5 1d __ LDA ACCU + 2 
241c : 85 61 __ STA T4 + 2 
241e : a5 1e __ LDA ACCU + 3 
2420 : 85 62 __ STA T4 + 3 
2422 : a5 48 __ LDA T6 + 1 
2424 : c5 8a __ CMP T22 + 1 
2426 : d0 09 __ BNE $2431 ; (main.s1079 + 0)
.s1076:
2428 : a5 47 __ LDA T6 + 0 
242a : c5 89 __ CMP T22 + 0 
.s1077:
242c : b0 09 __ BCS $2437 ; (main.s89 + 0)
242e : 4c 07 25 JMP $2507 ; (main.s88 + 0)
.s1079:
2431 : 45 8a __ EOR T22 + 1 
2433 : 10 f7 __ BPL $242c ; (main.s1077 + 0)
.s1078:
2435 : b0 f7 __ BCS $242e ; (main.s1077 + 2)
.s89:
2437 : a5 89 __ LDA T22 + 0 
2439 : 8d fa c7 STA $c7fa ; (sstack + 4)
243c : a5 8a __ LDA T22 + 1 
243e : 8d fb c7 STA $c7fb ; (sstack + 5)
2441 : a5 7b __ LDA T15 + 0 
2443 : 8d fc c7 STA $c7fc ; (sstack + 6)
2446 : 38 __ __ SEC
2447 : e5 89 __ SBC T22 + 0 
2449 : 85 03 __ STA WORK + 0 
244b : a5 7c __ LDA T15 + 1 
244d : 8d fd c7 STA $c7fd ; (sstack + 7)
2450 : e5 8a __ SBC T22 + 1 
2452 : 85 04 __ STA WORK + 1 
2454 : 29 80 __ AND #$80
2456 : 10 02 __ BPL $245a ; (main.s89 + 35)
2458 : a9 ff __ LDA #$ff
245a : 85 06 __ STA WORK + 3 
245c : 85 05 __ STA WORK + 2 
245e : a5 7d __ LDA T16 + 0 
2460 : 8d fe c7 STA $c7fe ; (sstack + 8)
2463 : a5 7e __ LDA T16 + 1 
2465 : 8d ff c7 STA $c7ff ; (sstack + 9)
2468 : 38 __ __ SEC
2469 : a5 75 __ LDA T12 + 0 
246b : e5 87 __ SBC T21 + 0 
246d : 85 1d __ STA ACCU + 2 
246f : a5 76 __ LDA T12 + 1 
2471 : e5 88 __ SBC T21 + 1 
2473 : 85 1e __ STA ACCU + 3 
2475 : a9 00 __ LDA #$00
2477 : 85 1b __ STA ACCU + 0 
2479 : 85 1c __ STA ACCU + 1 
247b : 20 a6 49 JSR $49a6 ; (divs32 + 0)
247e : a5 88 __ LDA T21 + 1 
2480 : c5 46 __ CMP T0 + 3 
2482 : f0 74 __ BEQ $24f8 ; (main.s1061 + 0)
.s1066:
2484 : 45 46 __ EOR T0 + 3 
2486 : 30 04 __ BMI $248c ; (main.s1065 + 0)
.s1064:
2488 : b0 04 __ BCS $248e ; (main.s94 + 0)
248a : 90 34 __ BCC $24c0 ; (main.s93 + 0)
.s1065:
248c : b0 32 __ BCS $24c0 ; (main.s93 + 0)
.s94:
248e : a9 00 __ LDA #$00
2490 : 85 11 __ STA P4 
2492 : 85 12 __ STA P5 
2494 : a5 87 __ LDA T21 + 0 
2496 : 85 13 __ STA P6 
2498 : a5 88 __ LDA T21 + 1 
249a : 85 14 __ STA P7 
249c : a5 5f __ LDA T4 + 0 
249e : 85 15 __ STA P8 
24a0 : a5 60 __ LDA T4 + 1 
24a2 : 85 16 __ STA P9 
24a4 : a5 61 __ LDA T4 + 2 
24a6 : 85 17 __ STA P10 
24a8 : a5 62 __ LDA T4 + 3 
24aa : 85 18 __ STA P11 
24ac : a5 1b __ LDA ACCU + 0 
24ae : 8d f6 c7 STA $c7f6 ; (sstack + 0)
24b1 : a5 1c __ LDA ACCU + 1 
24b3 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
24b6 : a5 1d __ LDA ACCU + 2 
24b8 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
24bb : a5 1e __ LDA ACCU + 3 
24bd : 4c ef 24 JMP $24ef ; (main.s586 + 0)
.s93:
24c0 : a9 00 __ LDA #$00
24c2 : 85 0d __ STA P0 
24c4 : 85 0e __ STA P1 
24c6 : a5 87 __ LDA T21 + 0 
24c8 : 85 0f __ STA P2 
24ca : a5 88 __ LDA T21 + 1 
24cc : 85 10 __ STA P3 
24ce : a5 1b __ LDA ACCU + 0 
24d0 : 85 15 __ STA P8 
24d2 : a5 1c __ LDA ACCU + 1 
24d4 : 85 16 __ STA P9 
24d6 : a5 1d __ LDA ACCU + 2 
24d8 : 85 17 __ STA P10 
24da : a5 1e __ LDA ACCU + 3 
24dc : 85 18 __ STA P11 
24de : a5 5f __ LDA T4 + 0 
24e0 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
24e3 : a5 60 __ LDA T4 + 1 
24e5 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
24e8 : a5 61 __ LDA T4 + 2 
24ea : 8d f8 c7 STA $c7f8 ; (sstack + 2)
24ed : a5 62 __ LDA T4 + 3 
.s586:
24ef : 8d f9 c7 STA $c7f9 ; (sstack + 3)
24f2 : 20 79 38 JSR $3879 ; (bm_trapezoid_fill.s1000 + 0)
24f5 : 4c 1e 1f JMP $1f1e ; (main.s79 + 0)
.s1061:
24f8 : a5 87 __ LDA T21 + 0 
24fa : c5 45 __ CMP T0 + 2 
24fc : d0 8a __ BNE $2488 ; (main.s1064 + 0)
.s1062:
24fe : a5 44 __ LDA T0 + 1 
2500 : d0 be __ BNE $24c0 ; (main.s93 + 0)
.s1063:
2502 : c5 43 __ CMP T0 + 0 
2504 : 4c 88 24 JMP $2488 ; (main.s1064 + 0)
.s88:
2507 : a5 47 __ LDA T6 + 0 
2509 : 8d fa c7 STA $c7fa ; (sstack + 4)
250c : a5 48 __ LDA T6 + 1 
250e : 8d fb c7 STA $c7fb ; (sstack + 5)
2511 : a5 89 __ LDA T22 + 0 
2513 : 8d fc c7 STA $c7fc ; (sstack + 6)
2516 : 38 __ __ SEC
2517 : e5 47 __ SBC T6 + 0 
2519 : 85 53 __ STA T1 + 0 
251b : 85 03 __ STA WORK + 0 
251d : a5 8a __ LDA T22 + 1 
251f : 8d fd c7 STA $c7fd ; (sstack + 7)
2522 : e5 48 __ SBC T6 + 1 
2524 : 85 54 __ STA T1 + 1 
2526 : 85 04 __ STA WORK + 1 
2528 : 29 80 __ AND #$80
252a : 10 02 __ BPL $252e ; (main.s88 + 39)
252c : a9 ff __ LDA #$ff
252e : 85 55 __ STA T1 + 2 
2530 : 85 06 __ STA WORK + 3 
2532 : 85 05 __ STA WORK + 2 
2534 : a5 7d __ LDA T16 + 0 
2536 : 8d fe c7 STA $c7fe ; (sstack + 8)
2539 : a5 7e __ LDA T16 + 1 
253b : 8d ff c7 STA $c7ff ; (sstack + 9)
253e : 38 __ __ SEC
253f : a5 87 __ LDA T21 + 0 
2541 : e5 0f __ SBC P2 
2543 : 85 1d __ STA ACCU + 2 
2545 : a5 88 __ LDA T21 + 1 
2547 : e5 10 __ SBC P3 
2549 : 85 1e __ STA ACCU + 3 
254b : a9 00 __ LDA #$00
254d : 85 1b __ STA ACCU + 0 
254f : 85 1c __ STA ACCU + 1 
2551 : 20 a6 49 JSR $49a6 ; (divs32 + 0)
2554 : a5 1e __ LDA ACCU + 3 
2556 : c5 62 __ CMP T4 + 3 
2558 : d0 03 __ BNE $255d ; (main.s1075 + 0)
255a : 4c 0a 26 JMP $260a ; (main.s1070 + 0)
.s1075:
255d : 45 62 __ EOR T4 + 3 
255f : 30 04 __ BMI $2565 ; (main.s1074 + 0)
.s1073:
2561 : b0 04 __ BCS $2567 ; (main.s91 + 0)
2563 : 90 26 __ BCC $258b ; (main.s90 + 0)
.s1074:
2565 : b0 24 __ BCS $258b ; (main.s90 + 0)
.s91:
2567 : a5 5f __ LDA T4 + 0 
2569 : 85 15 __ STA P8 
256b : a5 60 __ LDA T4 + 1 
256d : 85 16 __ STA P9 
256f : a5 61 __ LDA T4 + 2 
2571 : 85 17 __ STA P10 
2573 : a5 62 __ LDA T4 + 3 
2575 : 85 18 __ STA P11 
2577 : a5 1b __ LDA ACCU + 0 
2579 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
257c : a5 1c __ LDA ACCU + 1 
257e : 8d f7 c7 STA $c7f7 ; (sstack + 1)
2581 : a5 1d __ LDA ACCU + 2 
2583 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
2586 : a5 1e __ LDA ACCU + 3 
2588 : 4c ac 25 JMP $25ac ; (main.s571 + 0)
.s90:
258b : a5 1b __ LDA ACCU + 0 
258d : 85 15 __ STA P8 
258f : a5 1c __ LDA ACCU + 1 
2591 : 85 16 __ STA P9 
2593 : a5 1d __ LDA ACCU + 2 
2595 : 85 17 __ STA P10 
2597 : a5 1e __ LDA ACCU + 3 
2599 : 85 18 __ STA P11 
259b : a5 5f __ LDA T4 + 0 
259d : 8d f6 c7 STA $c7f6 ; (sstack + 0)
25a0 : a5 60 __ LDA T4 + 1 
25a2 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
25a5 : a5 61 __ LDA T4 + 2 
25a7 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
25aa : a5 62 __ LDA T4 + 3 
.s571:
25ac : 8d f9 c7 STA $c7f9 ; (sstack + 3)
25af : 20 79 38 JSR $3879 ; (bm_trapezoid_fill.s1000 + 0)
25b2 : a5 7c __ LDA T15 + 1 
25b4 : c5 8a __ CMP T22 + 1 
25b6 : d0 09 __ BNE $25c1 ; (main.s92 + 0)
.s1067:
25b8 : a5 7b __ LDA T15 + 0 
25ba : c5 89 __ CMP T22 + 0 
25bc : d0 03 __ BNE $25c1 ; (main.s92 + 0)
25be : 4c 1e 1f JMP $1f1e ; (main.s79 + 0)
.s92:
25c1 : a5 5f __ LDA T4 + 0 
25c3 : 85 1b __ STA ACCU + 0 
25c5 : a5 60 __ LDA T4 + 1 
25c7 : 85 1c __ STA ACCU + 1 
25c9 : a5 61 __ LDA T4 + 2 
25cb : 85 1d __ STA ACCU + 2 
25cd : a5 62 __ LDA T4 + 3 
25cf : 85 1e __ STA ACCU + 3 
25d1 : a5 53 __ LDA T1 + 0 
25d3 : 85 03 __ STA WORK + 0 
25d5 : a5 54 __ LDA T1 + 1 
25d7 : 85 04 __ STA WORK + 1 
25d9 : a5 55 __ LDA T1 + 2 
25db : 85 05 __ STA WORK + 2 
25dd : 85 06 __ STA WORK + 3 
25df : 20 4d 49 JSR $494d ; (mul32 + 0)
25e2 : a5 07 __ LDA WORK + 4 
25e4 : 85 43 __ STA T0 + 0 
25e6 : 85 0d __ STA P0 
25e8 : 85 11 __ STA P4 
25ea : a5 08 __ LDA WORK + 5 
25ec : 85 44 __ STA T0 + 1 
25ee : 85 0e __ STA P1 
25f0 : 85 12 __ STA P5 
25f2 : 18 __ __ CLC
25f3 : a5 09 __ LDA WORK + 6 
25f5 : 65 0f __ ADC P2 
25f7 : 85 45 __ STA T0 + 2 
25f9 : 85 0f __ STA P2 
25fb : 85 13 __ STA P6 
25fd : a5 0a __ LDA WORK + 7 
25ff : 65 10 __ ADC P3 
2601 : 85 46 __ STA T0 + 3 
2603 : 85 10 __ STA P3 
2605 : 85 14 __ STA P7 
2607 : 4c 37 24 JMP $2437 ; (main.s89 + 0)
.s1070:
260a : a5 1d __ LDA ACCU + 2 
260c : c5 61 __ CMP T4 + 2 
260e : f0 03 __ BEQ $2613 ; (main.s1071 + 0)
2610 : 4c 61 25 JMP $2561 ; (main.s1073 + 0)
.s1071:
2613 : a5 1c __ LDA ACCU + 1 
2615 : c5 60 __ CMP T4 + 1 
2617 : d0 f7 __ BNE $2610 ; (main.s1070 + 6)
.s1072:
2619 : a5 1b __ LDA ACCU + 0 
261b : c5 5f __ CMP T4 + 0 
261d : 4c 61 25 JMP $2561 ; (main.s1073 + 0)
.s85:
2620 : a5 89 __ LDA T22 + 0 
2622 : 85 43 __ STA T0 + 0 
2624 : a5 8a __ LDA T22 + 1 
2626 : 85 44 __ STA T0 + 1 
2628 : a5 7b __ LDA T15 + 0 
262a : 85 89 __ STA T22 + 0 
262c : a5 7c __ LDA T15 + 1 
262e : 85 8a __ STA T22 + 1 
2630 : a5 43 __ LDA T0 + 0 
2632 : 85 7b __ STA T15 + 0 
2634 : a5 44 __ LDA T0 + 1 
2636 : 85 7c __ STA T15 + 1 
2638 : a5 75 __ LDA T12 + 0 
263a : a6 87 __ LDX T21 + 0 
263c : 86 75 __ STX T12 + 0 
263e : 85 87 __ STA T21 + 0 
2640 : a5 76 __ LDA T12 + 1 
2642 : a6 88 __ LDX T21 + 1 
2644 : 86 76 __ STX T12 + 1 
2646 : 85 88 __ STA T21 + 1 
2648 : a5 48 __ LDA T6 + 1 
264a : c5 44 __ CMP T0 + 1 
264c : d0 07 __ BNE $2655 ; (main.s1087 + 0)
.s1084:
264e : a5 47 __ LDA T6 + 0 
2650 : c5 43 __ CMP T0 + 0 
2652 : 4c 13 1f JMP $1f13 ; (main.s1085 + 0)
.s1087:
2655 : 45 44 __ EOR T0 + 1 
2657 : 10 f9 __ BPL $2652 ; (main.s1084 + 4)
2659 : 4c 1c 1f JMP $1f1c ; (main.s1086 + 0)
.s1142:
265c : c5 89 __ CMP T22 + 0 
265e : 4c 02 1f JMP $1f02 ; (main.s1101 + 0)
.s84:
2661 : a5 77 __ LDA T13 + 0 
2663 : 85 47 __ STA T6 + 0 
2665 : a5 78 __ LDA T13 + 1 
2667 : 85 48 __ STA T6 + 1 
2669 : a5 6f __ LDA T9 + 0 
266b : 85 7b __ STA T15 + 0 
266d : a5 73 __ LDA T11 + 0 
266f : 85 63 __ STA T5 + 0 
2671 : a5 74 __ LDA T11 + 1 
2673 : 85 64 __ STA T5 + 1 
2675 : a5 6b __ LDA T8 + 0 
2677 : 85 75 __ STA T12 + 0 
2679 : a5 6c __ LDA T8 + 1 
267b : 85 76 __ STA T12 + 1 
267d : a5 70 __ LDA T9 + 1 
267f : 85 7c __ STA T15 + 1 
2681 : c5 8a __ CMP T22 + 1 
2683 : f0 03 __ BEQ $2688 ; (main.s1092 + 0)
2685 : 4c fe 1e JMP $1efe ; (main.s1095 + 0)
.s1092:
2688 : a5 6f __ LDA T9 + 0 
268a : 4c 5c 26 JMP $265c ; (main.s1142 + 0)
.s80:
268d : a5 89 __ LDA T22 + 0 
268f : 85 47 __ STA T6 + 0 
2691 : a5 8a __ LDA T22 + 1 
2693 : 85 48 __ STA T6 + 1 
2695 : a5 6f __ LDA T9 + 0 
2697 : 85 89 __ STA T22 + 0 
2699 : a5 70 __ LDA T9 + 1 
269b : 85 8a __ STA T22 + 1 
269d : a5 87 __ LDA T21 + 0 
269f : 85 63 __ STA T5 + 0 
26a1 : a5 88 __ LDA T21 + 1 
26a3 : 85 64 __ STA T5 + 1 
26a5 : a5 6b __ LDA T8 + 0 
26a7 : 85 87 __ STA T21 + 0 
26a9 : a5 6c __ LDA T8 + 1 
26ab : 85 88 __ STA T21 + 1 
26ad : a5 78 __ LDA T13 + 1 
26af : c5 70 __ CMP T9 + 1 
26b1 : d0 07 __ BNE $26ba ; (main.s1103 + 0)
.s1100:
26b3 : a5 77 __ LDA T13 + 0 
26b5 : c5 6f __ CMP T9 + 0 
26b7 : 4c 02 1f JMP $1f02 ; (main.s1101 + 0)
.s1103:
26ba : 45 70 __ EOR T9 + 1 
26bc : 10 f9 __ BPL $26b7 ; (main.s1100 + 4)
26be : 4c 07 1f JMP $1f07 ; (main.s1102 + 0)
.s72:
26c1 : 8a __ __ TXA
26c2 : 0a __ __ ASL
26c3 : a5 1e __ LDA ACCU + 3 
26c5 : 2a __ __ ROL
26c6 : aa __ __ TAX
26c7 : a9 00 __ LDA #$00
26c9 : 69 ff __ ADC #$ff
26cb : 49 ff __ EOR #$ff
26cd : a8 __ __ TAY
26ce : 8a __ __ TXA
26cf : 38 __ __ SEC
26d0 : e9 7f __ SBC #$7f
26d2 : aa __ __ TAX
26d3 : b0 01 __ BCS $26d6 ; (main.s1155 + 0)
.s1154:
26d5 : 88 __ __ DEY
.s1155:
26d6 : 98 __ __ TYA
26d7 : 0a __ __ ASL
26d8 : 8a __ __ TXA
26d9 : 69 00 __ ADC #$00
26db : 85 5b __ STA T3 + 0 
26dd : 98 __ __ TYA
26de : 69 00 __ ADC #$00
26e0 : c9 80 __ CMP #$80
26e2 : 6a __ __ ROR
26e3 : 66 5b __ ROR T3 + 0 
26e5 : a8 __ __ TAY
26e6 : 18 __ __ CLC
26e7 : a5 5b __ LDA T3 + 0 
26e9 : 69 7f __ ADC #$7f
26eb : aa __ __ TAX
26ec : 98 __ __ TYA
26ed : 69 00 __ ADC #$00
26ef : 4a __ __ LSR
26f0 : 8a __ __ TXA
26f1 : 6a __ __ ROR
26f2 : 8d 80 c7 STA $c780 ; (x + 3)
26f5 : a9 00 __ LDA #$00
26f7 : 6a __ __ ROR
26f8 : 85 5d __ STA T3 + 2 
26fa : a5 1b __ LDA ACCU + 0 
26fc : 85 5b __ STA T3 + 0 
26fe : a5 1c __ LDA ACCU + 1 
2700 : 85 5c __ STA T3 + 1 
2702 : ad 80 c7 LDA $c780 ; (x + 3)
2705 : 85 5e __ STA T3 + 3 
2707 : a2 5b __ LDX #$5b
2709 : 20 61 45 JSR $4561 ; (freg + 4)
270c : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
270f : a2 5b __ LDX #$5b
2711 : 20 61 45 JSR $4561 ; (freg + 4)
2714 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
2717 : a9 00 __ LDA #$00
2719 : 85 03 __ STA WORK + 0 
271b : 85 04 __ STA WORK + 1 
271d : 85 05 __ STA WORK + 2 
271f : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
2722 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
2725 : a5 1b __ LDA ACCU + 0 
2727 : 85 5b __ STA T3 + 0 
2729 : a5 1c __ LDA ACCU + 1 
272b : 85 5c __ STA T3 + 1 
272d : a5 1d __ LDA ACCU + 2 
272f : 85 5d __ STA T3 + 2 
2731 : a5 1e __ LDA ACCU + 3 
2733 : 85 5e __ STA T3 + 3 
2735 : a2 5b __ LDX #$5b
2737 : 20 ff 4a JSR $4aff ; (freg@proxy + 0)
273a : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
273d : a2 5b __ LDX #$5b
273f : 20 61 45 JSR $4561 ; (freg + 4)
2742 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
2745 : a9 00 __ LDA #$00
2747 : 85 03 __ STA WORK + 0 
2749 : 85 04 __ STA WORK + 1 
274b : 85 05 __ STA WORK + 2 
274d : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
2750 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
2753 : a5 1b __ LDA ACCU + 0 
2755 : 85 5b __ STA T3 + 0 
2757 : a5 1c __ LDA ACCU + 1 
2759 : 85 5c __ STA T3 + 1 
275b : a5 1d __ LDA ACCU + 2 
275d : 85 5d __ STA T3 + 2 
275f : a5 1e __ LDA ACCU + 3 
2761 : 85 5e __ STA T3 + 3 
2763 : a2 5b __ LDX #$5b
2765 : 20 ff 4a JSR $4aff ; (freg@proxy + 0)
2768 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
276b : a2 5b __ LDX #$5b
276d : 20 61 45 JSR $4561 ; (freg + 4)
2770 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
2773 : a9 00 __ LDA #$00
2775 : 85 03 __ STA WORK + 0 
2777 : 85 04 __ STA WORK + 1 
2779 : 85 05 __ STA WORK + 2 
277b : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
277e : 20 73 34 JSR $3473 ; (crt_fmul + 0)
2781 : a5 1b __ LDA ACCU + 0 
2783 : 85 5b __ STA T3 + 0 
2785 : a5 1c __ LDA ACCU + 1 
2787 : 85 5c __ STA T3 + 1 
2789 : a5 1d __ LDA ACCU + 2 
278b : 85 5d __ STA T3 + 2 
278d : a5 1e __ LDA ACCU + 3 
278f : 85 5e __ STA T3 + 3 
2791 : a2 5b __ LDX #$5b
2793 : 20 ff 4a JSR $4aff ; (freg@proxy + 0)
2796 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
2799 : a2 5b __ LDX #$5b
279b : 20 61 45 JSR $4561 ; (freg + 4)
279e : 20 a8 45 JSR $45a8 ; (faddsub + 6)
27a1 : a9 00 __ LDA #$00
27a3 : 85 03 __ STA WORK + 0 
27a5 : 85 04 __ STA WORK + 1 
27a7 : 85 05 __ STA WORK + 2 
27a9 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
27ac : 20 73 34 JSR $3473 ; (crt_fmul + 0)
27af : a5 1b __ LDA ACCU + 0 
27b1 : 85 57 __ STA T2 + 0 
27b3 : a5 1c __ LDA ACCU + 1 
27b5 : 85 58 __ STA T2 + 1 
27b7 : a5 1d __ LDA ACCU + 2 
27b9 : 85 59 __ STA T2 + 2 
27bb : a5 1e __ LDA ACCU + 3 
27bd : 85 5a __ STA T2 + 3 
27bf : a9 00 __ LDA #$00
27c1 : 85 1b __ STA ACCU + 0 
27c3 : 85 1c __ STA ACCU + 1 
27c5 : a2 57 __ LDX #$57
27c7 : 20 5e 4b JSR $4b5e ; (freg@proxy + 0)
27ca : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
27cd : a5 1b __ LDA ACCU + 0 
27cf : 85 57 __ STA T2 + 0 
27d1 : a5 1c __ LDA ACCU + 1 
27d3 : 85 58 __ STA T2 + 1 
27d5 : a5 1e __ LDA ACCU + 3 
27d7 : a6 1d __ LDX ACCU + 2 
27d9 : 4c a6 1c JMP $1ca6 ; (main.s121 + 0)
.s23:
27dc : 8a __ __ TXA
27dd : 0a __ __ ASL
27de : a5 1e __ LDA ACCU + 3 
27e0 : 2a __ __ ROL
27e1 : aa __ __ TAX
27e2 : a9 00 __ LDA #$00
27e4 : 69 ff __ ADC #$ff
27e6 : 49 ff __ EOR #$ff
27e8 : a8 __ __ TAY
27e9 : 8a __ __ TXA
27ea : 38 __ __ SEC
27eb : e9 7f __ SBC #$7f
27ed : aa __ __ TAX
27ee : b0 01 __ BCS $27f1 ; (main.s1147 + 0)
.s1146:
27f0 : 88 __ __ DEY
.s1147:
27f1 : 98 __ __ TYA
27f2 : 0a __ __ ASL
27f3 : 8a __ __ TXA
27f4 : 69 00 __ ADC #$00
27f6 : 85 53 __ STA T1 + 0 
27f8 : 98 __ __ TYA
27f9 : 69 00 __ ADC #$00
27fb : c9 80 __ CMP #$80
27fd : 6a __ __ ROR
27fe : 66 53 __ ROR T1 + 0 
2800 : a8 __ __ TAY
2801 : 18 __ __ CLC
2802 : a5 53 __ LDA T1 + 0 
2804 : 69 7f __ ADC #$7f
2806 : aa __ __ TAX
2807 : 98 __ __ TYA
2808 : 69 00 __ ADC #$00
280a : 4a __ __ LSR
280b : 8a __ __ TXA
280c : 6a __ __ ROR
280d : 8d c0 c7 STA $c7c0 ; (x + 3)
2810 : a9 00 __ LDA #$00
2812 : 6a __ __ ROR
2813 : 85 55 __ STA T1 + 2 
2815 : a5 1b __ LDA ACCU + 0 
2817 : 85 53 __ STA T1 + 0 
2819 : a5 1c __ LDA ACCU + 1 
281b : 85 54 __ STA T1 + 1 
281d : ad c0 c7 LDA $c7c0 ; (x + 3)
2820 : 85 56 __ STA T1 + 3 
2822 : a2 53 __ LDX #$53
2824 : 20 61 45 JSR $4561 ; (freg + 4)
2827 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
282a : a2 53 __ LDX #$53
282c : 20 61 45 JSR $4561 ; (freg + 4)
282f : 20 a8 45 JSR $45a8 ; (faddsub + 6)
2832 : a9 00 __ LDA #$00
2834 : 85 03 __ STA WORK + 0 
2836 : 85 04 __ STA WORK + 1 
2838 : 85 05 __ STA WORK + 2 
283a : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
283d : 20 73 34 JSR $3473 ; (crt_fmul + 0)
2840 : a5 1b __ LDA ACCU + 0 
2842 : 85 53 __ STA T1 + 0 
2844 : a5 1c __ LDA ACCU + 1 
2846 : 85 54 __ STA T1 + 1 
2848 : a5 1d __ LDA ACCU + 2 
284a : 85 55 __ STA T1 + 2 
284c : a5 1e __ LDA ACCU + 3 
284e : 85 56 __ STA T1 + 3 
2850 : a2 53 __ LDX #$53
2852 : 20 74 4b JSR $4b74 ; (freg@proxy + 0)
2855 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
2858 : a2 53 __ LDX #$53
285a : 20 61 45 JSR $4561 ; (freg + 4)
285d : 20 a8 45 JSR $45a8 ; (faddsub + 6)
2860 : a9 00 __ LDA #$00
2862 : 85 03 __ STA WORK + 0 
2864 : 85 04 __ STA WORK + 1 
2866 : 85 05 __ STA WORK + 2 
2868 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
286b : 20 73 34 JSR $3473 ; (crt_fmul + 0)
286e : a5 1b __ LDA ACCU + 0 
2870 : 85 53 __ STA T1 + 0 
2872 : a5 1c __ LDA ACCU + 1 
2874 : 85 54 __ STA T1 + 1 
2876 : a5 1d __ LDA ACCU + 2 
2878 : 85 55 __ STA T1 + 2 
287a : a5 1e __ LDA ACCU + 3 
287c : 85 56 __ STA T1 + 3 
287e : a2 53 __ LDX #$53
2880 : 20 74 4b JSR $4b74 ; (freg@proxy + 0)
2883 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
2886 : a2 53 __ LDX #$53
2888 : 20 61 45 JSR $4561 ; (freg + 4)
288b : 20 a8 45 JSR $45a8 ; (faddsub + 6)
288e : a9 00 __ LDA #$00
2890 : 85 03 __ STA WORK + 0 
2892 : 85 04 __ STA WORK + 1 
2894 : 85 05 __ STA WORK + 2 
2896 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
2899 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
289c : a5 1b __ LDA ACCU + 0 
289e : 85 53 __ STA T1 + 0 
28a0 : a5 1c __ LDA ACCU + 1 
28a2 : 85 54 __ STA T1 + 1 
28a4 : a5 1d __ LDA ACCU + 2 
28a6 : 85 55 __ STA T1 + 2 
28a8 : a5 1e __ LDA ACCU + 3 
28aa : 85 56 __ STA T1 + 3 
28ac : a2 53 __ LDX #$53
28ae : 20 74 4b JSR $4b74 ; (freg@proxy + 0)
28b1 : 20 bd 46 JSR $46bd ; (crt_fdiv + 0)
28b4 : a2 53 __ LDX #$53
28b6 : 20 61 45 JSR $4561 ; (freg + 4)
28b9 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
28bc : a9 00 __ LDA #$00
28be : 85 03 __ STA WORK + 0 
28c0 : 85 04 __ STA WORK + 1 
28c2 : 85 05 __ STA WORK + 2 
28c4 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
28c7 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
28ca : a5 1b __ LDA ACCU + 0 
28cc : 85 53 __ STA T1 + 0 
28ce : a5 1c __ LDA ACCU + 1 
28d0 : 85 54 __ STA T1 + 1 
28d2 : a5 1d __ LDA ACCU + 2 
28d4 : 85 55 __ STA T1 + 2 
28d6 : a5 1e __ LDA ACCU + 3 
28d8 : 4c 5d 0c JMP $0c5d ; (main.s22 + 0)
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
28db : 48 __ __ PHA
28dc : 8a __ __ TXA
28dd : 48 __ __ PHA
28de : a9 28 __ LDA #$28
28e0 : 48 __ __ PHA
28e1 : a9 f2 __ LDA #$f2
28e3 : 48 __ __ PHA
28e4 : ba __ __ TSX
28e5 : bd 05 01 LDA $0105,x 
28e8 : 48 __ __ PHA
28e9 : a6 01 __ LDX $01 
28eb : a9 36 __ LDA #$36
28ed : 85 01 __ STA $01 
28ef : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
28f2 : 86 01 __ STX $01 
28f4 : 68 __ __ PLA
28f5 : aa __ __ TAX
28f6 : 68 __ __ PLA
28f7 : 40 __ __ RTI
28f8 : 60 __ __ RTS
--------------------------------------------------------------------
bm_put_chars@proxy: ; bm_put_chars@proxy
28f9 : a9 00 __ LDA #$00
28fb : 85 14 __ STA P7 
28fd : 4c 46 29 JMP $2946 ; (bm_put_chars.s1000 + 0)
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
2900 : 48 __ __ PHA
2901 : 8a __ __ TXA
2902 : 48 __ __ PHA
2903 : a9 28 __ LDA #$28
2905 : 48 __ __ PHA
2906 : a9 f2 __ LDA #$f2
2908 : 48 __ __ PHA
2909 : ba __ __ TSX
290a : bd 05 01 LDA $0105,x 
290d : 48 __ __ PHA
290e : a6 01 __ LDX $01 
2910 : a9 36 __ LDA #$36
2912 : 85 01 __ STA $01 
2914 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(,,)->void
.s0:
2917 : a5 0f __ LDA P2 
2919 : a6 12 __ LDX P5 
291b : f0 0c __ BEQ $2929 ; (memset.s0 + 18)
291d : a0 00 __ LDY #$00
291f : 91 0d __ STA (P0),y 
2921 : c8 __ __ INY
2922 : d0 fb __ BNE $291f ; (memset.s0 + 8)
2924 : e6 0e __ INC P1 
2926 : ca __ __ DEX
2927 : d0 f6 __ BNE $291f ; (memset.s0 + 8)
2929 : a4 11 __ LDY P4 
292b : f0 05 __ BEQ $2932 ; (memset.s1001 + 0)
292d : 88 __ __ DEY
292e : 91 0d __ STA (P0),y 
2930 : d0 fb __ BNE $292d ; (memset.s0 + 22)
.s1001:
2932 : 60 __ __ RTS
--------------------------------------------------------------------
2933 : __ __ __ BYT 50 72 65 70 61 72 69 6e 67 20 66 75 6e 63 74 69 : Preparing functi
2943 : __ __ __ BYT 6f 6e 00                                        : on.
--------------------------------------------------------------------
bm_put_chars: ; bm_put_chars(,,,,,,enum BlitOp)->void
.s1000:
2946 : a5 53 __ LDA T9 + 0 
2948 : 8d ee c7 STA $c7ee ; (bm_trapezoid_fill@stack + 9)
294b : a5 54 __ LDA T9 + 1 
294d : 8d ef c7 STA $c7ef ; (bm_trapezoid_fill@stack + 10)
.s0:
2950 : a5 14 __ LDA P7 ; (y + 1)
2952 : a6 13 __ LDX P6 ; (y + 0)
2954 : 86 4f __ STX T6 + 0 
2956 : cd 8f 4b CMP $4b8f ; (SRect + 7)
2959 : d0 07 __ BNE $2962 ; (bm_put_chars.s1027 + 0)
.s1024:
295b : ec 8e 4b CPX $4b8e ; (SRect + 6)
.s1025:
295e : 90 09 __ BCC $2969 ; (bm_put_chars.s4 + 0)
2960 : b0 39 __ BCS $299b ; (bm_put_chars.s1001 + 0)
.s1027:
2962 : 4d 8f 4b EOR $4b8f ; (SRect + 7)
2965 : 10 f7 __ BPL $295e ; (bm_put_chars.s1025 + 0)
.s1026:
2967 : 90 32 __ BCC $299b ; (bm_put_chars.s1001 + 0)
.s4:
2969 : ad 8c 4b LDA $4b8c ; (SRect + 4)
296c : 85 43 __ STA T0 + 0 
296e : ad 8d 4b LDA $4b8d ; (SRect + 5)
2971 : 30 28 __ BMI $299b ; (bm_put_chars.s1001 + 0)
.s1023:
2973 : 85 44 __ STA T0 + 1 
2975 : 05 43 __ ORA T0 + 0 
2977 : f0 22 __ BEQ $299b ; (bm_put_chars.s1001 + 0)
.s3:
2979 : 8a __ __ TXA
297a : 18 __ __ CLC
297b : 69 08 __ ADC #$08
297d : 85 45 __ STA T1 + 0 
297f : a5 14 __ LDA P7 ; (y + 1)
2981 : 69 00 __ ADC #$00
2983 : 85 46 __ STA T1 + 1 
2985 : ad 8b 4b LDA $4b8b ; (SRect + 3)
2988 : c5 46 __ CMP T1 + 1 
298a : d0 09 __ BNE $2995 ; (bm_put_chars.s1022 + 0)
.s1019:
298c : ad 8a 4b LDA $4b8a ; (SRect + 2)
298f : c5 45 __ CMP T1 + 0 
.s1020:
2991 : b0 08 __ BCS $299b ; (bm_put_chars.s1001 + 0)
2993 : 90 11 __ BCC $29a6 ; (bm_put_chars.s2 + 0)
.s1022:
2995 : 45 46 __ EOR T1 + 1 
2997 : 10 f8 __ BPL $2991 ; (bm_put_chars.s1020 + 0)
.s1021:
2999 : b0 0b __ BCS $29a6 ; (bm_put_chars.s2 + 0)
.s1001:
299b : ad ee c7 LDA $c7ee ; (bm_trapezoid_fill@stack + 9)
299e : 85 53 __ STA T9 + 0 
29a0 : ad ef c7 LDA $c7ef ; (bm_trapezoid_fill@stack + 10)
29a3 : 85 54 __ STA T9 + 1 
29a5 : 60 __ __ RTS
.s2:
29a6 : a9 00 __ LDA #$00
29a8 : 85 51 __ STA T8 + 0 
29aa : 85 52 __ STA T8 + 1 
29ac : a5 17 __ LDA P10 ; (len + 0)
29ae : 85 53 __ STA T9 + 0 
29b0 : ad 88 4b LDA $4b88 ; (SRect + 0)
29b3 : 85 47 __ STA T2 + 0 
29b5 : ad 89 4b LDA $4b89 ; (SRect + 1)
29b8 : 30 09 __ BMI $29c3 ; (bm_put_chars.s8 + 0)
.s1018:
29ba : 85 48 __ STA T2 + 1 
29bc : 05 47 __ ORA T2 + 0 
29be : f0 03 __ BEQ $29c3 ; (bm_put_chars.s8 + 0)
29c0 : 4c 00 31 JMP $3100 ; (bm_put_chars.s7 + 0)
.s8:
29c3 : a9 00 __ LDA #$00
29c5 : 85 10 __ STA P3 
29c7 : a5 17 __ LDA P10 ; (len + 0)
29c9 : f0 3b __ BEQ $2a06 ; (bm_put_chars.s13 + 0)
.s401:
29cb : a9 00 __ LDA #$00
29cd : 85 49 __ STA T3 + 0 
29cf : 85 4a __ STA T3 + 1 
.s1055:
29d1 : a5 4a __ LDA T3 + 1 
29d3 : a0 00 __ LDY #$00
29d5 : c5 44 __ CMP T0 + 1 
29d7 : f0 25 __ BEQ $29fe ; (bm_put_chars.l1010 + 0)
.s1013:
29d9 : 45 44 __ EOR T0 + 1 
29db : 10 25 __ BPL $2a02 ; (bm_put_chars.s1011 + 0)
.s1012:
29dd : 90 25 __ BCC $2a04 ; (bm_put_chars.s1056 + 0)
.l12:
29df : b1 15 __ LDA (P8),y ; (str + 0)
29e1 : 38 __ __ SEC
29e2 : e9 20 __ SBC #$20
29e4 : aa __ __ TAX
29e5 : bd f0 4b LDA $4bf0,x ; (TinyFont + 96)
29e8 : 4a __ __ LSR
29e9 : 4a __ __ LSR
29ea : 38 __ __ SEC
29eb : 65 49 __ ADC T3 + 0 
29ed : 85 49 __ STA T3 + 0 
29ef : a9 00 __ LDA #$00
29f1 : 65 4a __ ADC T3 + 1 
29f3 : c8 __ __ INY
29f4 : c4 17 __ CPY P10 ; (len + 0)
29f6 : b0 0c __ BCS $2a04 ; (bm_put_chars.s1056 + 0)
.s14:
29f8 : 85 4a __ STA T3 + 1 
29fa : c5 44 __ CMP T0 + 1 
29fc : d0 db __ BNE $29d9 ; (bm_put_chars.s1013 + 0)
.l1010:
29fe : a5 49 __ LDA T3 + 0 
2a00 : c5 43 __ CMP T0 + 0 
.s1011:
2a02 : 90 db __ BCC $29df ; (bm_put_chars.l12 + 0)
.s1056:
2a04 : 84 10 __ STY P3 
.s13:
2a06 : a5 51 __ LDA T8 + 0 
2a08 : 29 07 __ AND #$07
2a0a : 85 53 __ STA T9 + 0 
2a0c : 85 0d __ STA P0 
2a0e : a5 15 __ LDA P8 ; (str + 0)
2a10 : 85 0e __ STA P1 
2a12 : a5 16 __ LDA P9 ; (str + 1)
2a14 : 85 0f __ STA P2 
2a16 : 20 60 31 JSR $3160 ; (bmu_text.s0 + 0)
2a19 : a5 1b __ LDA ACCU + 0 
2a1b : 85 43 __ STA T0 + 0 
2a1d : a5 1c __ LDA ACCU + 1 
2a1f : 85 44 __ STA T0 + 1 
2a21 : a5 4f __ LDA T6 + 0 
2a23 : 85 45 __ STA T1 + 0 
2a25 : a5 14 __ LDA P7 ; (y + 1)
2a27 : 85 46 __ STA T1 + 1 
2a29 : a9 00 __ LDA #$00
2a2b : 85 54 __ STA T9 + 1 
2a2d : 85 48 __ STA T2 + 1 
2a2f : 85 49 __ STA T3 + 0 
2a31 : 85 4a __ STA T3 + 1 
2a33 : a9 08 __ LDA #$08
2a35 : 85 47 __ STA T2 + 0 
2a37 : 38 __ __ SEC
2a38 : a5 51 __ LDA T8 + 0 
2a3a : ed 88 4b SBC $4b88 ; (SRect + 0)
2a3d : 85 4b __ STA T4 + 0 
2a3f : a5 52 __ LDA T8 + 1 
2a41 : ed 89 4b SBC $4b89 ; (SRect + 1)
2a44 : 10 29 __ BPL $2a6f ; (bm_put_chars.s16 + 0)
.s15:
2a46 : 85 4c __ STA T4 + 1 
2a48 : 38 __ __ SEC
2a49 : a5 51 __ LDA T8 + 0 
2a4b : e5 4b __ SBC T4 + 0 
2a4d : 85 51 __ STA T8 + 0 
2a4f : a5 52 __ LDA T8 + 1 
2a51 : e5 4c __ SBC T4 + 1 
2a53 : 85 52 __ STA T8 + 1 
2a55 : 18 __ __ CLC
2a56 : a5 1b __ LDA ACCU + 0 
2a58 : 65 4b __ ADC T4 + 0 
2a5a : 85 43 __ STA T0 + 0 
2a5c : a5 1c __ LDA ACCU + 1 
2a5e : 65 4c __ ADC T4 + 1 
2a60 : 85 44 __ STA T0 + 1 
2a62 : 38 __ __ SEC
2a63 : a5 53 __ LDA T9 + 0 
2a65 : e5 4b __ SBC T4 + 0 
2a67 : 85 53 __ STA T9 + 0 
2a69 : a9 00 __ LDA #$00
2a6b : e5 4c __ SBC T4 + 1 
2a6d : 85 54 __ STA T9 + 1 
.s16:
2a6f : a5 43 __ LDA T0 + 0 
2a71 : 85 4b __ STA T4 + 0 
2a73 : a5 44 __ LDA T0 + 1 
2a75 : 85 4c __ STA T4 + 1 
2a77 : ad 8a 4b LDA $4b8a ; (SRect + 2)
2a7a : 85 03 __ STA WORK + 0 
2a7c : ad 8b 4b LDA $4b8b ; (SRect + 3)
2a7f : 85 04 __ STA WORK + 1 
2a81 : 38 __ __ SEC
2a82 : a5 4f __ LDA T6 + 0 
2a84 : e5 03 __ SBC WORK + 0 
2a86 : 85 4d __ STA T5 + 0 
2a88 : a5 14 __ LDA P7 ; (y + 1)
2a8a : e5 04 __ SBC WORK + 1 
2a8c : 10 29 __ BPL $2ab7 ; (bm_put_chars.s18 + 0)
.s17:
2a8e : 85 4e __ STA T5 + 1 
2a90 : 38 __ __ SEC
2a91 : a5 4f __ LDA T6 + 0 
2a93 : e5 4d __ SBC T5 + 0 
2a95 : 85 45 __ STA T1 + 0 
2a97 : a5 14 __ LDA P7 ; (y + 1)
2a99 : e5 4e __ SBC T5 + 1 
2a9b : 85 46 __ STA T1 + 1 
2a9d : 18 __ __ CLC
2a9e : a5 4d __ LDA T5 + 0 
2aa0 : 69 08 __ ADC #$08
2aa2 : 85 47 __ STA T2 + 0 
2aa4 : a5 4e __ LDA T5 + 1 
2aa6 : 69 00 __ ADC #$00
2aa8 : 85 48 __ STA T2 + 1 
2aaa : 38 __ __ SEC
2aab : a9 00 __ LDA #$00
2aad : e5 4d __ SBC T5 + 0 
2aaf : 85 49 __ STA T3 + 0 
2ab1 : a9 00 __ LDA #$00
2ab3 : e5 4e __ SBC T5 + 1 
2ab5 : 85 4a __ STA T3 + 1 
.s18:
2ab7 : ad 8c 4b LDA $4b8c ; (SRect + 4)
2aba : 38 __ __ SEC
2abb : e5 51 __ SBC T8 + 0 
2abd : aa __ __ TAX
2abe : ad 8d 4b LDA $4b8d ; (SRect + 5)
2ac1 : e5 52 __ SBC T8 + 1 
2ac3 : a8 __ __ TAY
2ac4 : 8a __ __ TXA
2ac5 : 38 __ __ SEC
2ac6 : e5 43 __ SBC T0 + 0 
2ac8 : 85 4d __ STA T5 + 0 
2aca : 98 __ __ TYA
2acb : e5 44 __ SBC T0 + 1 
2acd : 10 0d __ BPL $2adc ; (bm_put_chars.s20 + 0)
.s19:
2acf : aa __ __ TAX
2ad0 : 18 __ __ CLC
2ad1 : a5 43 __ LDA T0 + 0 
2ad3 : 65 4d __ ADC T5 + 0 
2ad5 : 85 4b __ STA T4 + 0 
2ad7 : 8a __ __ TXA
2ad8 : 65 44 __ ADC T0 + 1 
2ada : 85 4c __ STA T4 + 1 
.s20:
2adc : ad 8e 4b LDA $4b8e ; (SRect + 6)
2adf : 38 __ __ SEC
2ae0 : e5 45 __ SBC T1 + 0 
2ae2 : aa __ __ TAX
2ae3 : ad 8f 4b LDA $4b8f ; (SRect + 7)
2ae6 : e5 46 __ SBC T1 + 1 
2ae8 : a8 __ __ TAY
2ae9 : 8a __ __ TXA
2aea : 38 __ __ SEC
2aeb : e5 47 __ SBC T2 + 0 
2aed : 85 43 __ STA T0 + 0 
2aef : 98 __ __ TYA
2af0 : e5 48 __ SBC T2 + 1 
2af2 : 10 0d __ BPL $2b01 ; (bm_put_chars.s22 + 0)
.s21:
2af4 : aa __ __ TAX
2af5 : 18 __ __ CLC
2af6 : a5 47 __ LDA T2 + 0 
2af8 : 65 43 __ ADC T0 + 0 
2afa : 85 47 __ STA T2 + 0 
2afc : 8a __ __ TXA
2afd : 65 48 __ ADC T2 + 1 
2aff : 85 48 __ STA T2 + 1 
.s22:
2b01 : a5 4c __ LDA T4 + 1 
2b03 : 10 03 __ BPL $2b08 ; (bm_put_chars.s1009 + 0)
2b05 : 4c 9b 29 JMP $299b ; (bm_put_chars.s1001 + 0)
.s1009:
2b08 : 05 4b __ ORA T4 + 0 
2b0a : f0 f9 __ BEQ $2b05 ; (bm_put_chars.s22 + 4)
.s24:
2b0c : a5 48 __ LDA T2 + 1 
2b0e : 30 f5 __ BMI $2b05 ; (bm_put_chars.s22 + 4)
.s1008:
2b10 : 05 47 __ ORA T2 + 0 
2b12 : f0 f1 __ BEQ $2b05 ; (bm_put_chars.s22 + 4)
.s23:
2b14 : a5 45 __ LDA T1 + 0 
2b16 : 29 f8 __ AND #$f8
2b18 : 85 1b __ STA ACCU + 0 
2b1a : a5 46 __ LDA T1 + 1 
2b1c : 85 1c __ STA ACCU + 1 
2b1e : ad d7 4d LDA $4dd7 ; (Screen + 4)
2b21 : 85 4d __ STA T5 + 0 
2b23 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
2b26 : ad d3 4d LDA $4dd3 ; (Screen + 0)
2b29 : 18 __ __ CLC
2b2a : 65 1b __ ADC ACCU + 0 
2b2c : 85 43 __ STA T0 + 0 
2b2e : ad d4 4d LDA $4dd4 ; (Screen + 1)
2b31 : 65 1c __ ADC ACCU + 1 
2b33 : aa __ __ TAX
2b34 : a5 51 __ LDA T8 + 0 
2b36 : 29 f8 __ AND #$f8
2b38 : 18 __ __ CLC
2b39 : 65 43 __ ADC T0 + 0 
2b3b : 85 43 __ STA T0 + 0 
2b3d : 8a __ __ TXA
2b3e : 65 52 __ ADC T8 + 1 
2b40 : aa __ __ TAX
2b41 : a5 45 __ LDA T1 + 0 
2b43 : 29 07 __ AND #$07
2b45 : 18 __ __ CLC
2b46 : 65 43 __ ADC T0 + 0 
2b48 : 85 43 __ STA T0 + 0 
2b4a : 90 01 __ BCC $2b4d ; (bm_put_chars.s1076 + 0)
.s1075:
2b4c : e8 __ __ INX
.s1076:
2b4d : 86 44 __ STX T0 + 1 
2b4f : a5 49 __ LDA T3 + 0 
2b51 : 29 f8 __ AND #$f8
2b53 : 85 1b __ STA ACCU + 0 
2b55 : a5 4a __ LDA T3 + 1 
2b57 : 85 1c __ STA ACCU + 1 
2b59 : ad bf 4d LDA $4dbf ; (tbitmap + 4)
2b5c : 85 4f __ STA T6 + 0 
2b5e : 20 25 45 JSR $4525 ; (mul16by8 + 0)
2b61 : ad bb 4d LDA $4dbb ; (tbitmap + 0)
2b64 : 18 __ __ CLC
2b65 : 65 1b __ ADC ACCU + 0 
2b67 : 85 45 __ STA T1 + 0 
2b69 : ad bc 4d LDA $4dbc ; (tbitmap + 1)
2b6c : 65 1c __ ADC ACCU + 1 
2b6e : aa __ __ TAX
2b6f : a5 53 __ LDA T9 + 0 
2b71 : 29 f8 __ AND #$f8
2b73 : 18 __ __ CLC
2b74 : 65 45 __ ADC T1 + 0 
2b76 : 85 45 __ STA T1 + 0 
2b78 : 8a __ __ TXA
2b79 : 65 54 __ ADC T9 + 1 
2b7b : aa __ __ TAX
2b7c : a5 49 __ LDA T3 + 0 
2b7e : 29 07 __ AND #$07
2b80 : 18 __ __ CLC
2b81 : 65 45 __ ADC T1 + 0 
2b83 : 85 45 __ STA T1 + 0 
2b85 : 90 01 __ BCC $2b88 ; (bm_put_chars.s1078 + 0)
.s1077:
2b87 : e8 __ __ INX
.s1078:
2b88 : 86 46 __ STX T1 + 1 
2b8a : 18 __ __ CLC
2b8b : a5 51 __ LDA T8 + 0 
2b8d : 65 4b __ ADC T4 + 0 
2b8f : 85 50 __ STA T7 + 0 
2b91 : 29 07 __ AND #$07
2b93 : aa __ __ TAX
2b94 : bd cb 4d LDA $4dcb,x ; (rmask + 0)
2b97 : 85 1b __ STA ACCU + 0 
2b99 : a5 51 __ LDA T8 + 0 
2b9b : 29 07 __ AND #$07
2b9d : aa __ __ TAX
2b9e : bd c3 4d LDA $4dc3,x ; (lmask + 0)
2ba1 : 85 4b __ STA T4 + 0 
2ba3 : a5 52 __ LDA T8 + 1 
2ba5 : 65 4c __ ADC T4 + 1 
2ba7 : 4a __ __ LSR
2ba8 : 66 50 __ ROR T7 + 0 
2baa : 4a __ __ LSR
2bab : 66 50 __ ROR T7 + 0 
2bad : 4a __ __ LSR
2bae : 66 50 __ ROR T7 + 0 
2bb0 : a5 52 __ LDA T8 + 1 
2bb2 : 4a __ __ LSR
2bb3 : 66 51 __ ROR T8 + 0 
2bb5 : 4a __ __ LSR
2bb6 : 66 51 __ ROR T8 + 0 
2bb8 : 4a __ __ LSR
2bb9 : 66 51 __ ROR T8 + 0 
2bbb : 38 __ __ SEC
2bbc : a5 50 __ LDA T7 + 0 
2bbe : e5 51 __ SBC T8 + 0 
2bc0 : 85 50 __ STA T7 + 0 
2bc2 : a5 53 __ LDA T9 + 0 
2bc4 : 29 07 __ AND #$07
2bc6 : 85 51 __ STA T8 + 0 
2bc8 : 8a __ __ TXA
2bc9 : 38 __ __ SEC
2bca : e5 51 __ SBC T8 + 0 
2bcc : 85 49 __ STA T3 + 0 
2bce : f0 0d __ BEQ $2bdd ; (bm_put_chars.s29 + 0)
.s31:
2bd0 : 30 0b __ BMI $2bdd ; (bm_put_chars.s29 + 0)
.s32:
2bd2 : 18 __ __ CLC
2bd3 : a5 45 __ LDA T1 + 0 
2bd5 : 69 f8 __ ADC #$f8
2bd7 : 85 45 __ STA T1 + 0 
2bd9 : b0 02 __ BCS $2bdd ; (bm_put_chars.s29 + 0)
.s1083:
2bdb : c6 46 __ DEC T1 + 1 
.s29:
2bdd : a9 00 __ LDA #$00
2bdf : 8d 01 50 STA $5001 ; (BLIT_CODE + 1)
2be2 : 85 51 __ STA T8 + 0 
2be4 : a9 a0 __ LDA #$a0
2be6 : 8d 00 50 STA $5000 ; (BLIT_CODE + 0)
2be9 : a5 50 __ LDA T7 + 0 
2beb : 85 1c __ STA ACCU + 1 
2bed : d0 06 __ BNE $2bf5 ; (bm_put_chars.s36 + 0)
.s35:
2bef : a5 1b __ LDA ACCU + 0 
2bf1 : 25 4b __ AND T4 + 0 
2bf3 : 85 4b __ STA T4 + 0 
.s36:
2bf5 : a5 49 __ LDA T3 + 0 
2bf7 : 29 07 __ AND #$07
2bf9 : 85 1d __ STA ACCU + 2 
2bfb : a2 02 __ LDX #$02
2bfd : 86 49 __ STX T3 + 0 
2bff : a6 4b __ LDX T4 + 0 
2c01 : e8 __ __ INX
2c02 : d0 03 __ BNE $2c07 ; (bm_put_chars.s38 + 0)
2c04 : 4c aa 30 JMP $30aa ; (bm_put_chars.s37 + 0)
.s38:
2c07 : aa __ __ TAX
2c08 : f0 47 __ BEQ $2c51 ; (bm_put_chars.s48 + 0)
.s47:
2c0a : a9 03 __ LDA #$03
2c0c : 8d 03 50 STA $5003 ; (BLIT_CODE + 3)
2c0f : 8d 08 50 STA $5008 ; (BLIT_CODE + 8)
2c12 : 8d 0c 50 STA $500c ; (BLIT_CODE + 12)
2c15 : a9 b1 __ LDA #$b1
2c17 : 8d 02 50 STA $5002 ; (BLIT_CODE + 2)
2c1a : a9 85 __ LDA #$85
2c1c : 8d 04 50 STA $5004 ; (BLIT_CODE + 4)
2c1f : 8d 0b 50 STA $500b ; (BLIT_CODE + 11)
2c22 : a9 08 __ LDA #$08
2c24 : 8d 05 50 STA $5005 ; (BLIT_CODE + 5)
2c27 : 8d 0a 50 STA $500a ; (BLIT_CODE + 10)
2c2a : a9 18 __ LDA #$18
2c2c : 8d 06 50 STA $5006 ; (BLIT_CODE + 6)
2c2f : a9 a5 __ LDA #$a5
2c31 : 8d 07 50 STA $5007 ; (BLIT_CODE + 7)
2c34 : a9 69 __ LDA #$69
2c36 : 8d 09 50 STA $5009 ; (BLIT_CODE + 9)
2c39 : a9 90 __ LDA #$90
2c3b : 8d 0d 50 STA $500d ; (BLIT_CODE + 13)
2c3e : a9 02 __ LDA #$02
2c40 : 8d 0e 50 STA $500e ; (BLIT_CODE + 14)
2c43 : a9 e6 __ LDA #$e6
2c45 : 8d 0f 50 STA $500f ; (BLIT_CODE + 15)
2c48 : a9 04 __ LDA #$04
2c4a : 8d 10 50 STA $5010 ; (BLIT_CODE + 16)
2c4d : a9 11 __ LDA #$11
2c4f : 85 49 __ STA T3 + 0 
.s48:
2c51 : a5 49 __ LDA T3 + 0 
2c53 : aa __ __ TAX
2c54 : 18 __ __ CLC
2c55 : 69 02 __ ADC #$02
2c57 : 85 53 __ STA T9 + 0 
2c59 : a5 1d __ LDA ACCU + 2 
2c5b : d0 11 __ BNE $2c6e ; (bm_put_chars.s49 + 0)
.s50:
2c5d : a9 b1 __ LDA #$b1
2c5f : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2c62 : a9 03 __ LDA #$03
2c64 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2c67 : a5 53 __ LDA T9 + 0 
.s1040:
2c69 : 85 49 __ STA T3 + 0 
2c6b : 4c d8 2c JMP $2cd8 ; (bm_put_chars.s46 + 0)
.s49:
2c6e : a9 a5 __ LDA #$a5
2c70 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2c73 : a9 08 __ LDA #$08
2c75 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2c78 : a5 1d __ LDA ACCU + 2 
2c7a : c9 05 __ CMP #$05
2c7c : b0 0a __ BCS $2c88 ; (bm_put_chars.s53 + 0)
.s55:
2c7e : a9 4a __ LDA #$4a
2c80 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2c83 : 8a __ __ TXA
2c84 : 69 03 __ ADC #$03
2c86 : 85 53 __ STA T9 + 0 
.s53:
2c88 : a9 85 __ LDA #$85
2c8a : a6 53 __ LDX T9 + 0 
2c8c : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2c8f : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
2c92 : a9 09 __ LDA #$09
2c94 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2c97 : a9 b1 __ LDA #$b1
2c99 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2c9c : a9 03 __ LDA #$03
2c9e : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
2ca1 : a9 08 __ LDA #$08
2ca3 : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
2ca6 : a4 1d __ LDY ACCU + 2 
2ca8 : c0 05 __ CPY #$05
2caa : 90 03 __ BCC $2caf ; (bm_put_chars.s65 + 0)
2cac : 4c 70 30 JMP $3070 ; (bm_put_chars.s64 + 0)
.s65:
2caf : 8a __ __ TXA
2cb0 : 69 06 __ ADC #$06
2cb2 : c0 02 __ CPY #$02
2cb4 : 90 19 __ BCC $2ccf ; (bm_put_chars.s69 + 0)
.s241:
2cb6 : aa __ __ TAX
2cb7 : 88 __ __ DEY
.l1036:
2cb8 : a9 6a __ LDA #$6a
2cba : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2cbd : a9 46 __ LDA #$46
2cbf : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2cc2 : a9 09 __ LDA #$09
2cc4 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2cc7 : 8a __ __ TXA
2cc8 : 18 __ __ CLC
2cc9 : 69 03 __ ADC #$03
2ccb : aa __ __ TAX
2ccc : 88 __ __ DEY
2ccd : d0 e9 __ BNE $2cb8 ; (bm_put_chars.l1036 + 0)
.s69:
2ccf : aa __ __ TAX
2cd0 : e8 __ __ INX
2cd1 : 86 49 __ STX T3 + 0 
2cd3 : a9 6a __ LDA #$6a
2cd5 : 9d ff 4f STA $4fff,x ; (wmat + 63)
.s46:
2cd8 : a9 ff __ LDA #$ff
2cda : 45 4b __ EOR T4 + 0 
2cdc : f0 2e __ BEQ $2d0c ; (bm_put_chars.s88 + 0)
.s87:
2cde : aa __ __ TAX
2cdf : a9 85 __ LDA #$85
2ce1 : a4 49 __ LDY T3 + 0 
2ce3 : 99 00 50 STA $5000,y ; (BLIT_CODE + 0)
2ce6 : a9 09 __ LDA #$09
2ce8 : 99 01 50 STA $5001,y ; (BLIT_CODE + 1)
2ceb : 99 07 50 STA $5007,y ; (BLIT_CODE + 7)
2cee : a9 51 __ LDA #$51
2cf0 : 99 02 50 STA $5002,y ; (BLIT_CODE + 2)
2cf3 : a9 05 __ LDA #$05
2cf5 : 99 03 50 STA $5003,y ; (BLIT_CODE + 3)
2cf8 : a9 29 __ LDA #$29
2cfa : 99 04 50 STA $5004,y ; (BLIT_CODE + 4)
2cfd : 8a __ __ TXA
2cfe : 99 05 50 STA $5005,y ; (BLIT_CODE + 5)
2d01 : a9 45 __ LDA #$45
2d03 : 99 06 50 STA $5006,y ; (BLIT_CODE + 6)
2d06 : 98 __ __ TYA
2d07 : 18 __ __ CLC
2d08 : 69 08 __ ADC #$08
2d0a : 85 49 __ STA T3 + 0 
.s88:
2d0c : a9 91 __ LDA #$91
2d0e : a6 49 __ LDX T3 + 0 
2d10 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2d13 : a9 05 __ LDA #$05
2d15 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2d18 : a5 50 __ LDA T7 + 0 
2d1a : d0 07 __ BNE $2d23 ; (bm_put_chars.s92 + 0)
.s622:
2d1c : e8 __ __ INX
2d1d : e8 __ __ INX
2d1e : 86 49 __ STX T3 + 0 
2d20 : 4c 45 2d JMP $2d45 ; (bm_put_chars.s94 + 0)
.s92:
2d23 : a9 a0 __ LDA #$a0
2d25 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2d28 : 8a __ __ TXA
2d29 : 18 __ __ CLC
2d2a : 69 04 __ ADC #$04
2d2c : 85 49 __ STA T3 + 0 
2d2e : a9 08 __ LDA #$08
2d30 : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
2d33 : 85 51 __ STA T8 + 0 
2d35 : a5 50 __ LDA T7 + 0 
.s93:
2d37 : c9 02 __ CMP #$02
2d39 : 90 03 __ BCC $2d3e ; (bm_put_chars.s96 + 0)
2d3b : 4c df 2e JMP $2edf ; (bm_put_chars.s95 + 0)
.s96:
2d3e : a5 1b __ LDA ACCU + 0 
2d40 : f0 03 __ BEQ $2d45 ; (bm_put_chars.s94 + 0)
2d42 : 4c e1 2d JMP $2de1 ; (bm_put_chars.s162 + 0)
.s94:
2d45 : a9 60 __ LDA #$60
2d47 : a6 49 __ LDX T3 + 0 
2d49 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2d4c : a5 45 __ LDA T1 + 0 
2d4e : 85 49 __ STA T3 + 0 
2d50 : a5 46 __ LDA T1 + 1 
2d52 : 85 4a __ STA T3 + 1 
2d54 : a5 47 __ LDA T2 + 0 
2d56 : 85 50 __ STA T7 + 0 
2d58 : a5 4d __ LDA T5 + 0 
2d5a : 0a __ __ ASL
2d5b : 85 47 __ STA T2 + 0 
2d5d : a9 00 __ LDA #$00
2d5f : 2a __ __ ROL
2d60 : 06 47 __ ASL T2 + 0 
2d62 : 2a __ __ ROL
2d63 : 06 47 __ ASL T2 + 0 
2d65 : 2a __ __ ROL
2d66 : aa __ __ TAX
2d67 : 38 __ __ SEC
2d68 : a5 47 __ LDA T2 + 0 
2d6a : e9 08 __ SBC #$08
2d6c : 85 4b __ STA T4 + 0 
2d6e : 8a __ __ TXA
2d6f : e9 00 __ SBC #$00
2d71 : 85 4c __ STA T4 + 1 
2d73 : a5 4f __ LDA T6 + 0 
2d75 : 0a __ __ ASL
2d76 : 85 47 __ STA T2 + 0 
2d78 : a9 00 __ LDA #$00
2d7a : 2a __ __ ROL
2d7b : 06 47 __ ASL T2 + 0 
2d7d : 2a __ __ ROL
2d7e : 06 47 __ ASL T2 + 0 
2d80 : 2a __ __ ROL
2d81 : aa __ __ TAX
2d82 : 38 __ __ SEC
2d83 : a5 47 __ LDA T2 + 0 
2d85 : e9 08 __ SBC #$08
2d87 : 85 47 __ STA T2 + 0 
2d89 : 8a __ __ TXA
2d8a : e9 00 __ SBC #$00
2d8c : 85 48 __ STA T2 + 1 
.l217:
2d8e : a5 45 __ LDA T1 + 0 
2d90 : 85 03 __ STA WORK + 0 
2d92 : a5 46 __ LDA T1 + 1 
2d94 : 85 04 __ STA WORK + 1 
2d96 : a5 44 __ LDA T0 + 1 
2d98 : 85 06 __ STA WORK + 3 
2d9a : a5 43 __ LDA T0 + 0 
2d9c : 85 05 __ STA WORK + 2 
2d9e : 29 07 __ AND #$07
2da0 : a8 __ __ TAY
2da1 : b1 49 __ LDA (T3 + 0),y 
2da3 : 85 07 __ STA WORK + 4 
2da5 : 20 00 50 JSR $5000 ; (BLIT_CODE + 0)
2da8 : e6 45 __ INC T1 + 0 
2daa : d0 02 __ BNE $2dae ; (bm_put_chars.s1080 + 0)
.s1079:
2dac : e6 46 __ INC T1 + 1 
.s1080:
2dae : a5 45 __ LDA T1 + 0 
2db0 : 29 07 __ AND #$07
2db2 : d0 0d __ BNE $2dc1 ; (bm_put_chars.s220 + 0)
.s219:
2db4 : 18 __ __ CLC
2db5 : a5 45 __ LDA T1 + 0 
2db7 : 65 47 __ ADC T2 + 0 
2db9 : 85 45 __ STA T1 + 0 
2dbb : a5 46 __ LDA T1 + 1 
2dbd : 65 48 __ ADC T2 + 1 
2dbf : 85 46 __ STA T1 + 1 
.s220:
2dc1 : e6 43 __ INC T0 + 0 
2dc3 : d0 02 __ BNE $2dc7 ; (bm_put_chars.s1082 + 0)
.s1081:
2dc5 : e6 44 __ INC T0 + 1 
.s1082:
2dc7 : a5 43 __ LDA T0 + 0 
2dc9 : 29 07 __ AND #$07
2dcb : d0 0d __ BNE $2dda ; (bm_put_chars.s419 + 0)
.s221:
2dcd : 18 __ __ CLC
2dce : a5 43 __ LDA T0 + 0 
2dd0 : 65 4b __ ADC T4 + 0 
2dd2 : 85 43 __ STA T0 + 0 
2dd4 : a5 44 __ LDA T0 + 1 
2dd6 : 65 4c __ ADC T4 + 1 
2dd8 : 85 44 __ STA T0 + 1 
.s419:
2dda : c6 50 __ DEC T7 + 0 
2ddc : d0 b0 __ BNE $2d8e ; (bm_put_chars.l217 + 0)
2dde : 4c 9b 29 JMP $299b ; (bm_put_chars.s1001 + 0)
.s162:
2de1 : a5 49 __ LDA T3 + 0 
2de3 : aa __ __ TAX
2de4 : 18 __ __ CLC
2de5 : 69 02 __ ADC #$02
2de7 : 85 50 __ STA T7 + 0 
2de9 : 85 49 __ STA T3 + 0 
2deb : a5 1d __ LDA ACCU + 2 
2ded : d0 0c __ BNE $2dfb ; (bm_put_chars.s164 + 0)
.s165:
2def : a9 b1 __ LDA #$b1
2df1 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2df4 : a9 03 __ LDA #$03
2df6 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2df9 : d0 72 __ BNE $2e6d ; (bm_put_chars.s163 + 0)
.s164:
2dfb : a9 a5 __ LDA #$a5
2dfd : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2e00 : a9 08 __ LDA #$08
2e02 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2e05 : a5 1d __ LDA ACCU + 2 
2e07 : c9 05 __ CMP #$05
2e09 : b0 0a __ BCS $2e15 ; (bm_put_chars.s168 + 0)
.s170:
2e0b : a9 4a __ LDA #$4a
2e0d : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2e10 : 8a __ __ TXA
2e11 : 69 03 __ ADC #$03
2e13 : 85 50 __ STA T7 + 0 
.s168:
2e15 : a9 85 __ LDA #$85
2e17 : a6 50 __ LDX T7 + 0 
2e19 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2e1c : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
2e1f : a9 09 __ LDA #$09
2e21 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2e24 : a9 b1 __ LDA #$b1
2e26 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2e29 : a9 03 __ LDA #$03
2e2b : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
2e2e : a9 08 __ LDA #$08
2e30 : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
2e33 : a4 1d __ LDY ACCU + 2 
2e35 : c0 05 __ CPY #$05
2e37 : 90 0b __ BCC $2e44 ; (bm_put_chars.s180 + 0)
.s179:
2e39 : a9 0a __ LDA #$0a
2e3b : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
2e3e : 8a __ __ TXA
2e3f : 69 06 __ ADC #$06
2e41 : 4c b0 2e JMP $2eb0 ; (bm_put_chars.l1038 + 0)
.s180:
2e44 : 8a __ __ TXA
2e45 : 69 06 __ ADC #$06
2e47 : c0 02 __ CPY #$02
2e49 : 90 19 __ BCC $2e64 ; (bm_put_chars.s184 + 0)
.s237:
2e4b : aa __ __ TAX
2e4c : 88 __ __ DEY
.l1030:
2e4d : a9 6a __ LDA #$6a
2e4f : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2e52 : a9 46 __ LDA #$46
2e54 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2e57 : a9 09 __ LDA #$09
2e59 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2e5c : 8a __ __ TXA
2e5d : 18 __ __ CLC
2e5e : 69 03 __ ADC #$03
2e60 : aa __ __ TAX
2e61 : 88 __ __ DEY
2e62 : d0 e9 __ BNE $2e4d ; (bm_put_chars.l1030 + 0)
.s184:
2e64 : aa __ __ TAX
2e65 : e8 __ __ INX
2e66 : 86 49 __ STX T3 + 0 
2e68 : a9 6a __ LDA #$6a
2e6a : 9d ff 4f STA $4fff,x ; (wmat + 63)
.s163:
2e6d : a9 ff __ LDA #$ff
2e6f : 45 1b __ EOR ACCU + 0 
2e71 : f0 2e __ BEQ $2ea1 ; (bm_put_chars.s202 + 0)
.s201:
2e73 : aa __ __ TAX
2e74 : a9 85 __ LDA #$85
2e76 : a4 49 __ LDY T3 + 0 
2e78 : 99 00 50 STA $5000,y ; (BLIT_CODE + 0)
2e7b : a9 09 __ LDA #$09
2e7d : 99 01 50 STA $5001,y ; (BLIT_CODE + 1)
2e80 : 99 07 50 STA $5007,y ; (BLIT_CODE + 7)
2e83 : a9 51 __ LDA #$51
2e85 : 99 02 50 STA $5002,y ; (BLIT_CODE + 2)
2e88 : a9 05 __ LDA #$05
2e8a : 99 03 50 STA $5003,y ; (BLIT_CODE + 3)
2e8d : a9 29 __ LDA #$29
2e8f : 99 04 50 STA $5004,y ; (BLIT_CODE + 4)
2e92 : 8a __ __ TXA
2e93 : 99 05 50 STA $5005,y ; (BLIT_CODE + 5)
2e96 : a9 45 __ LDA #$45
2e98 : 99 06 50 STA $5006,y ; (BLIT_CODE + 6)
2e9b : 98 __ __ TYA
2e9c : 18 __ __ CLC
2e9d : 69 08 __ ADC #$08
2e9f : 85 49 __ STA T3 + 0 
.s202:
2ea1 : a9 91 __ LDA #$91
2ea3 : a6 49 __ LDX T3 + 0 
2ea5 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2ea8 : a9 05 __ LDA #$05
2eaa : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2ead : 4c 1c 2d JMP $2d1c ; (bm_put_chars.s622 + 0)
.l1038:
2eb0 : aa __ __ TAX
2eb1 : 18 __ __ CLC
2eb2 : 69 03 __ ADC #$03
2eb4 : 85 49 __ STA T3 + 0 
2eb6 : c0 07 __ CPY #$07
2eb8 : b0 14 __ BCS $2ece ; (bm_put_chars.s182 + 0)
.s181:
2eba : a9 26 __ LDA #$26
2ebc : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2ebf : a9 09 __ LDA #$09
2ec1 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2ec4 : a9 0a __ LDA #$0a
2ec6 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2ec9 : a5 49 __ LDA T3 + 0 
2ecb : c8 __ __ INY
2ecc : 90 e2 __ BCC $2eb0 ; (bm_put_chars.l1038 + 0)
.s182:
2ece : a9 a5 __ LDA #$a5
2ed0 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2ed3 : a9 09 __ LDA #$09
2ed5 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2ed8 : a9 2a __ LDA #$2a
2eda : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2edd : b0 8e __ BCS $2e6d ; (bm_put_chars.s163 + 0)
.s95:
2edf : a9 02 __ LDA #$02
2ee1 : c5 1c __ CMP ACCU + 1 
2ee3 : a9 00 __ LDA #$00
2ee5 : 2a __ __ ROL
2ee6 : 49 01 __ EOR #$01
2ee8 : 85 1e __ STA ACCU + 3 
2eea : f0 19 __ BEQ $2f05 ; (bm_put_chars.s101 + 0)
.s97:
2eec : a9 a2 __ LDA #$a2
2eee : a6 49 __ LDX T3 + 0 
2ef0 : e8 __ __ INX
2ef1 : e8 __ __ INX
2ef2 : 86 49 __ STX T3 + 0 
2ef4 : 9d fe 4f STA $4ffe,x ; (wmat + 62)
2ef7 : 38 __ __ SEC
2ef8 : a5 1c __ LDA ACCU + 1 
2efa : e9 01 __ SBC #$01
2efc : 9d ff 4f STA $4fff,x ; (wmat + 63)
2eff : a5 1c __ LDA ACCU + 1 
2f01 : c9 20 __ CMP #$20
2f03 : b0 0e __ BCS $2f13 ; (bm_put_chars.s104 + 0)
.s101:
2f05 : a5 1d __ LDA ACCU + 2 
2f07 : d0 0a __ BNE $2f13 ; (bm_put_chars.s104 + 0)
.s99:
2f09 : a9 18 __ LDA #$18
2f0b : a6 49 __ LDX T3 + 0 
2f0d : e8 __ __ INX
2f0e : 86 49 __ STX T3 + 0 
2f10 : 9d ff 4f STA $4fff,x ; (wmat + 63)
.s104:
2f13 : a5 49 __ LDA T3 + 0 
2f15 : aa __ __ TAX
2f16 : 18 __ __ CLC
2f17 : 69 02 __ ADC #$02
2f19 : 85 50 __ STA T7 + 0 
2f1b : a5 1d __ LDA ACCU + 2 
2f1d : d0 0c __ BNE $2f2b ; (bm_put_chars.s106 + 0)
.s107:
2f1f : a9 b1 __ LDA #$b1
2f21 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2f24 : a9 03 __ LDA #$03
2f26 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2f29 : d0 6a __ BNE $2f95 ; (bm_put_chars.s105 + 0)
.s106:
2f2b : a9 a5 __ LDA #$a5
2f2d : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2f30 : a9 08 __ LDA #$08
2f32 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2f35 : a5 1d __ LDA ACCU + 2 
2f37 : c9 05 __ CMP #$05
2f39 : b0 0a __ BCS $2f45 ; (bm_put_chars.s110 + 0)
.s112:
2f3b : a9 4a __ LDA #$4a
2f3d : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2f40 : 8a __ __ TXA
2f41 : 69 03 __ ADC #$03
2f43 : 85 50 __ STA T7 + 0 
.s110:
2f45 : a9 85 __ LDA #$85
2f47 : a6 50 __ LDX T7 + 0 
2f49 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2f4c : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
2f4f : a9 09 __ LDA #$09
2f51 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2f54 : a9 b1 __ LDA #$b1
2f56 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2f59 : a9 03 __ LDA #$03
2f5b : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
2f5e : a9 08 __ LDA #$08
2f60 : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
2f63 : a4 1d __ LDY ACCU + 2 
2f65 : c0 05 __ CPY #$05
2f67 : 90 03 __ BCC $2f6c ; (bm_put_chars.s122 + 0)
2f69 : 4c 34 30 JMP $3034 ; (bm_put_chars.s121 + 0)
.s122:
2f6c : 8a __ __ TXA
2f6d : 69 06 __ ADC #$06
2f6f : c0 02 __ CPY #$02
2f71 : 90 19 __ BCC $2f8c ; (bm_put_chars.s126 + 0)
.s239:
2f73 : aa __ __ TAX
2f74 : 88 __ __ DEY
.l1032:
2f75 : a9 6a __ LDA #$6a
2f77 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
2f7a : a9 46 __ LDA #$46
2f7c : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
2f7f : a9 09 __ LDA #$09
2f81 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
2f84 : 8a __ __ TXA
2f85 : 18 __ __ CLC
2f86 : 69 03 __ ADC #$03
2f88 : aa __ __ TAX
2f89 : 88 __ __ DEY
2f8a : d0 e9 __ BNE $2f75 ; (bm_put_chars.l1032 + 0)
.s126:
2f8c : aa __ __ TAX
2f8d : e8 __ __ INX
2f8e : 86 50 __ STX T7 + 0 
2f90 : a9 6a __ LDA #$6a
2f92 : 9d ff 4f STA $4fff,x ; (wmat + 63)
.s105:
2f95 : a9 91 __ LDA #$91
2f97 : a4 50 __ LDY T7 + 0 
2f99 : 99 00 50 STA $5000,y ; (BLIT_CODE + 0)
2f9c : a9 05 __ LDA #$05
2f9e : 99 01 50 STA $5001,y ; (BLIT_CODE + 1)
2fa1 : a5 1e __ LDA ACCU + 3 
2fa3 : d0 16 __ BNE $2fbb ; (bm_put_chars.s149 + 0)
.s150:
2fa5 : a9 a0 __ LDA #$a0
2fa7 : 99 02 50 STA $5002,y ; (BLIT_CODE + 2)
2faa : 18 __ __ CLC
2fab : a5 51 __ LDA T8 + 0 
2fad : 69 08 __ ADC #$08
2faf : 99 03 50 STA $5003,y ; (BLIT_CODE + 3)
2fb2 : 98 __ __ TYA
2fb3 : 18 __ __ CLC
2fb4 : 69 04 __ ADC #$04
.s1039:
2fb6 : 85 49 __ STA T3 + 0 
2fb8 : 4c 3e 2d JMP $2d3e ; (bm_put_chars.s96 + 0)
.s149:
2fbb : a9 1f __ LDA #$1f
2fbd : c5 1c __ CMP ACCU + 1 
2fbf : a9 00 __ LDA #$00
2fc1 : 2a __ __ ROL
2fc2 : 49 01 __ EOR #$01
2fc4 : 85 53 __ STA T9 + 0 
2fc6 : d0 08 __ BNE $2fd0 ; (bm_put_chars.s151 + 0)
.s153:
2fc8 : c8 __ __ INY
2fc9 : c8 __ __ INY
2fca : a5 1d __ LDA ACCU + 2 
2fcc : f0 0a __ BEQ $2fd8 ; (bm_put_chars.s152 + 0)
.s1085:
2fce : a4 50 __ LDY T7 + 0 
.s151:
2fd0 : a9 18 __ LDA #$18
2fd2 : 99 02 50 STA $5002,y ; (BLIT_CODE + 2)
2fd5 : c8 __ __ INY
2fd6 : c8 __ __ INY
2fd7 : c8 __ __ INY
.s152:
2fd8 : a9 98 __ LDA #$98
2fda : 99 00 50 STA $5000,y ; (BLIT_CODE + 0)
2fdd : a9 69 __ LDA #$69
2fdf : 99 01 50 STA $5001,y ; (BLIT_CODE + 1)
2fe2 : a9 08 __ LDA #$08
2fe4 : 99 02 50 STA $5002,y ; (BLIT_CODE + 2)
2fe7 : a9 a8 __ LDA #$a8
2fe9 : 99 03 50 STA $5003,y ; (BLIT_CODE + 3)
2fec : 98 __ __ TYA
2fed : 18 __ __ CLC
2fee : 69 04 __ ADC #$04
2ff0 : aa __ __ TAX
2ff1 : a5 53 __ LDA T9 + 0 
2ff3 : f0 1f __ BEQ $3014 ; (bm_put_chars.s155 + 0)
.s154:
2ff5 : a9 90 __ LDA #$90
2ff7 : 99 04 50 STA $5004,y ; (BLIT_CODE + 4)
2ffa : a9 04 __ LDA #$04
2ffc : 99 05 50 STA $5005,y ; (BLIT_CODE + 5)
2fff : 99 07 50 STA $5007,y ; (BLIT_CODE + 7)
3002 : a9 e6 __ LDA #$e6
3004 : 99 06 50 STA $5006,y ; (BLIT_CODE + 6)
3007 : 99 08 50 STA $5008,y ; (BLIT_CODE + 8)
300a : a9 06 __ LDA #$06
300c : 99 09 50 STA $5009,y ; (BLIT_CODE + 9)
300f : 98 __ __ TYA
3010 : 18 __ __ CLC
3011 : 69 0a __ ADC #$0a
3013 : aa __ __ TAX
.s155:
3014 : a9 ca __ LDA #$ca
3016 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
3019 : a9 d0 __ LDA #$d0
301b : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
301e : 8a __ __ TXA
301f : 18 __ __ CLC
3020 : 69 01 __ ADC #$01
3022 : 49 ff __ EOR #$ff
3024 : 38 __ __ SEC
3025 : 65 49 __ ADC T3 + 0 
3027 : 38 __ __ SEC
3028 : e9 02 __ SBC #$02
302a : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
302d : 8a __ __ TXA
302e : 18 __ __ CLC
302f : 69 03 __ ADC #$03
3031 : 4c b6 2f JMP $2fb6 ; (bm_put_chars.s1039 + 0)
.s121:
3034 : a9 0a __ LDA #$0a
3036 : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
3039 : 8a __ __ TXA
303a : 69 06 __ ADC #$06
303c : c0 07 __ CPY #$07
303e : aa __ __ TAX
303f : b0 18 __ BCS $3059 ; (bm_put_chars.s124 + 0)
.l1069:
3041 : a9 26 __ LDA #$26
3043 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
3046 : a9 09 __ LDA #$09
3048 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
304b : a9 0a __ LDA #$0a
304d : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
3050 : 8a __ __ TXA
3051 : 69 03 __ ADC #$03
3053 : c8 __ __ INY
3054 : c0 07 __ CPY #$07
3056 : aa __ __ TAX
3057 : 90 e8 __ BCC $3041 ; (bm_put_chars.l1069 + 0)
.s124:
3059 : a9 a5 __ LDA #$a5
305b : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
305e : a9 09 __ LDA #$09
3060 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
3063 : a9 2a __ LDA #$2a
3065 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
3068 : 8a __ __ TXA
3069 : 69 02 __ ADC #$02
306b : 85 50 __ STA T7 + 0 
306d : 4c 95 2f JMP $2f95 ; (bm_put_chars.s105 + 0)
.s64:
3070 : a9 0a __ LDA #$0a
3072 : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
3075 : 8a __ __ TXA
3076 : 69 06 __ ADC #$06
3078 : c0 07 __ CPY #$07
307a : aa __ __ TAX
307b : b0 18 __ BCS $3095 ; (bm_put_chars.s67 + 0)
.l1071:
307d : a9 26 __ LDA #$26
307f : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
3082 : a9 09 __ LDA #$09
3084 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
3087 : a9 0a __ LDA #$0a
3089 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
308c : 8a __ __ TXA
308d : 69 03 __ ADC #$03
308f : c8 __ __ INY
3090 : c0 07 __ CPY #$07
3092 : aa __ __ TAX
3093 : 90 e8 __ BCC $307d ; (bm_put_chars.l1071 + 0)
.s67:
3095 : a9 a5 __ LDA #$a5
3097 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
309a : a9 09 __ LDA #$09
309c : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
309f : a9 2a __ LDA #$2a
30a1 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
30a4 : 8a __ __ TXA
30a5 : 69 02 __ ADC #$02
30a7 : 4c 69 2c JMP $2c69 ; (bm_put_chars.s1040 + 0)
.s37:
30aa : e6 1c __ INC ACCU + 1 
30ac : aa __ __ TAX
30ad : f0 47 __ BEQ $30f6 ; (bm_put_chars.s41 + 0)
.s40:
30af : a9 03 __ LDA #$03
30b1 : 8d 03 50 STA $5003 ; (BLIT_CODE + 3)
30b4 : 8d 08 50 STA $5008 ; (BLIT_CODE + 8)
30b7 : 8d 0c 50 STA $500c ; (BLIT_CODE + 12)
30ba : a9 b1 __ LDA #$b1
30bc : 8d 02 50 STA $5002 ; (BLIT_CODE + 2)
30bf : a9 85 __ LDA #$85
30c1 : 8d 04 50 STA $5004 ; (BLIT_CODE + 4)
30c4 : 8d 0b 50 STA $500b ; (BLIT_CODE + 11)
30c7 : a9 08 __ LDA #$08
30c9 : 8d 05 50 STA $5005 ; (BLIT_CODE + 5)
30cc : 8d 0a 50 STA $500a ; (BLIT_CODE + 10)
30cf : a9 18 __ LDA #$18
30d1 : 8d 06 50 STA $5006 ; (BLIT_CODE + 6)
30d4 : a9 a5 __ LDA #$a5
30d6 : 8d 07 50 STA $5007 ; (BLIT_CODE + 7)
30d9 : a9 69 __ LDA #$69
30db : 8d 09 50 STA $5009 ; (BLIT_CODE + 9)
30de : a9 90 __ LDA #$90
30e0 : 8d 0d 50 STA $500d ; (BLIT_CODE + 13)
30e3 : a9 02 __ LDA #$02
30e5 : 8d 0e 50 STA $500e ; (BLIT_CODE + 14)
30e8 : a9 e6 __ LDA #$e6
30ea : 8d 0f 50 STA $500f ; (BLIT_CODE + 15)
30ed : a9 04 __ LDA #$04
30ef : 8d 10 50 STA $5010 ; (BLIT_CODE + 16)
30f2 : a9 11 __ LDA #$11
30f4 : 85 49 __ STA T3 + 0 
.s41:
30f6 : a5 1c __ LDA ACCU + 1 
30f8 : d0 03 __ BNE $30fd ; (bm_put_chars.s41 + 7)
30fa : 4c 45 2d JMP $2d45 ; (bm_put_chars.s94 + 0)
30fd : 4c 37 2d JMP $2d37 ; (bm_put_chars.s93 + 0)
.s7:
3100 : a9 00 __ LDA #$00
3102 : 85 50 __ STA T7 + 0 
3104 : a5 17 __ LDA P10 ; (len + 0)
3106 : f0 32 __ BEQ $313a ; (bm_put_chars.s10 + 0)
.s243:
3108 : a5 15 __ LDA P8 ; (str + 0)
310a : 85 49 __ STA T3 + 0 
310c : a5 16 __ LDA P9 ; (str + 1)
310e : 85 4a __ STA T3 + 1 
3110 : a0 00 __ LDY #$00
.l9:
3112 : b1 49 __ LDA (T3 + 0),y 
3114 : 38 __ __ SEC
3115 : e9 20 __ SBC #$20
3117 : aa __ __ TAX
3118 : bd f0 4b LDA $4bf0,x ; (TinyFont + 96)
311b : 4a __ __ LSR
311c : 4a __ __ LSR
311d : 38 __ __ SEC
311e : 65 51 __ ADC T8 + 0 
3120 : aa __ __ TAX
3121 : a9 00 __ LDA #$00
3123 : 65 52 __ ADC T8 + 1 
3125 : 30 08 __ BMI $312f ; (bm_put_chars.s11 + 0)
.s1017:
3127 : c5 48 __ CMP T2 + 1 
3129 : d0 02 __ BNE $312d ; (bm_put_chars.s1015 + 0)
.s1014:
312b : e4 47 __ CPX T2 + 0 
.s1015:
312d : b0 09 __ BCS $3138 ; (bm_put_chars.s1053 + 0)
.s11:
312f : 86 51 __ STX T8 + 0 
3131 : 85 52 __ STA T8 + 1 
3133 : c8 __ __ INY
3134 : c4 53 __ CPY T9 + 0 
3136 : 90 da __ BCC $3112 ; (bm_put_chars.l9 + 0)
.s1053:
3138 : 84 50 __ STY T7 + 0 
.s10:
313a : 18 __ __ CLC
313b : a5 15 __ LDA P8 ; (str + 0)
313d : 65 50 __ ADC T7 + 0 
313f : 85 15 __ STA P8 ; (str + 0)
3141 : 90 02 __ BCC $3145 ; (bm_put_chars.s1074 + 0)
.s1073:
3143 : e6 16 __ INC P9 ; (str + 1)
.s1074:
3145 : a5 51 __ LDA T8 + 0 
3147 : 85 49 __ STA T3 + 0 
3149 : a5 52 __ LDA T8 + 1 
314b : 85 4a __ STA T3 + 1 
314d : a9 00 __ LDA #$00
314f : 85 10 __ STA P3 
3151 : a5 53 __ LDA T9 + 0 
3153 : 38 __ __ SEC
3154 : e5 50 __ SBC T7 + 0 
3156 : 85 17 __ STA P10 ; (len + 0)
3158 : d0 03 __ BNE $315d ; (bm_put_chars.s1074 + 24)
315a : 4c 06 2a JMP $2a06 ; (bm_put_chars.s13 + 0)
315d : 4c d1 29 JMP $29d1 ; (bm_put_chars.s1055 + 0)
--------------------------------------------------------------------
bmu_text: ; bmu_text(,,,)->i16
.s0:
3160 : a9 00 __ LDA #$00
3162 : 85 f7 __ STA $f7 ; (tworks + 0)
3164 : 85 f8 __ STA $f8 ; (tworks + 1)
3166 : 85 f9 __ STA $f9 ; (tworks + 2)
3168 : 85 fa __ STA $fa ; (tworks + 3)
316a : 85 fb __ STA $fb ; (tworks + 4)
316c : 85 fc __ STA $fc ; (tworks + 5)
316e : 85 fd __ STA $fd ; (tworks + 6)
3170 : 85 fe __ STA $fe ; (tworks + 7)
3172 : 85 1b __ STA ACCU + 0 
3174 : 85 1c __ STA ACCU + 1 
3176 : ad bb 4d LDA $4dbb ; (tbitmap + 0)
3179 : 85 43 __ STA T1 + 0 
317b : ad bc 4d LDA $4dbc ; (tbitmap + 1)
317e : 85 44 __ STA T1 + 1 
3180 : a5 10 __ LDA P3 ; (len + 0)
3182 : d0 03 __ BNE $3187 ; (bmu_text.s21 + 0)
3184 : 4c 79 32 JMP $3279 ; (bmu_text.s1004 + 0)
.s21:
3187 : a9 00 __ LDA #$00
3189 : 85 48 __ STA T8 + 0 
318b : 85 1d __ STA ACCU + 2 
.l2:
318d : a4 1d __ LDY ACCU + 2 
318f : b1 0e __ LDA (P1),y ; (str + 0)
3191 : 38 __ __ SEC
3192 : e9 20 __ SBC #$20
3194 : aa __ __ TAX
3195 : bd f0 4b LDA $4bf0,x ; (TinyFont + 96)
3198 : 4a __ __ LSR
3199 : 4a __ __ LSR
319a : 85 1e __ STA ACCU + 3 
319c : 38 __ __ SEC
319d : 65 1b __ ADC ACCU + 0 
319f : 85 1b __ STA ACCU + 0 
31a1 : 90 02 __ BCC $31a5 ; (bmu_text.s1007 + 0)
.s1006:
31a3 : e6 1c __ INC ACCU + 1 
.s1007:
31a5 : a5 1e __ LDA ACCU + 3 
31a7 : f0 76 __ BEQ $321f ; (bmu_text.s8 + 0)
.s20:
31a9 : 18 __ __ CLC
31aa : a9 50 __ LDA #$50
31ac : 7d 90 4b ADC $4b90,x ; (TinyFont + 0)
31af : 85 45 __ STA T4 + 0 
31b1 : bd f0 4b LDA $4bf0,x ; (TinyFont + 96)
31b4 : 29 03 __ AND #$03
31b6 : 69 4c __ ADC #$4c
31b8 : 85 46 __ STA T4 + 1 
31ba : a0 00 __ LDY #$00
31bc : 84 47 __ STY T7 + 0 
31be : a6 0d __ LDX P0 ; (lx + 0)
.l6:
31c0 : b1 45 __ LDA (T4 + 0),y 
31c2 : 0a __ __ ASL
31c3 : 26 f7 __ ROL $f7 ; (tworks + 0)
31c5 : 0a __ __ ASL
31c6 : 26 f8 __ ROL $f8 ; (tworks + 1)
31c8 : 0a __ __ ASL
31c9 : 26 f9 __ ROL $f9 ; (tworks + 2)
31cb : 0a __ __ ASL
31cc : 26 fa __ ROL $fa ; (tworks + 3)
31ce : 0a __ __ ASL
31cf : 26 fb __ ROL $fb ; (tworks + 4)
31d1 : 0a __ __ ASL
31d2 : 26 fc __ ROL $fc ; (tworks + 5)
31d4 : 0a __ __ ASL
31d5 : 26 fd __ ROL $fd ; (tworks + 6)
31d7 : 0a __ __ ASL
31d8 : 26 fe __ ROL $fe ; (tworks + 7)
31da : e8 __ __ INX
31db : e0 08 __ CPX #$08
31dd : d0 36 __ BNE $3215 ; (bmu_text.s52 + 0)
.s9:
31df : a5 f7 __ LDA $f7 ; (tworks + 0)
31e1 : a0 00 __ LDY #$00
31e3 : 91 43 __ STA (T1 + 0),y 
31e5 : a5 f8 __ LDA $f8 ; (tworks + 1)
31e7 : c8 __ __ INY
31e8 : 91 43 __ STA (T1 + 0),y 
31ea : a5 f9 __ LDA $f9 ; (tworks + 2)
31ec : c8 __ __ INY
31ed : 91 43 __ STA (T1 + 0),y 
31ef : a5 fa __ LDA $fa ; (tworks + 3)
31f1 : c8 __ __ INY
31f2 : 91 43 __ STA (T1 + 0),y 
31f4 : a5 fb __ LDA $fb ; (tworks + 4)
31f6 : c8 __ __ INY
31f7 : 91 43 __ STA (T1 + 0),y 
31f9 : a5 fc __ LDA $fc ; (tworks + 5)
31fb : c8 __ __ INY
31fc : 91 43 __ STA (T1 + 0),y 
31fe : a5 fd __ LDA $fd ; (tworks + 6)
3200 : c8 __ __ INY
3201 : 91 43 __ STA (T1 + 0),y 
3203 : a5 fe __ LDA $fe ; (tworks + 7)
3205 : c8 __ __ INY
3206 : 91 43 __ STA (T1 + 0),y 
3208 : 18 __ __ CLC
3209 : a5 43 __ LDA T1 + 0 
320b : 69 08 __ ADC #$08
320d : 85 43 __ STA T1 + 0 
320f : 90 02 __ BCC $3213 ; (bmu_text.s1009 + 0)
.s1008:
3211 : e6 44 __ INC T1 + 1 
.s1009:
3213 : a2 00 __ LDX #$00
.s52:
3215 : e6 47 __ INC T7 + 0 
3217 : a4 47 __ LDY T7 + 0 
3219 : c4 1e __ CPY ACCU + 3 
321b : 90 a3 __ BCC $31c0 ; (bmu_text.l6 + 0)
.s1003:
321d : 86 0d __ STX P0 ; (lx + 0)
.s8:
321f : 06 f7 __ ASL $f7 ; (tworks + 0)
3221 : 06 f8 __ ASL $f8 ; (tworks + 1)
3223 : 06 f9 __ ASL $f9 ; (tworks + 2)
3225 : 06 fa __ ASL $fa ; (tworks + 3)
3227 : 06 fb __ ASL $fb ; (tworks + 4)
3229 : 06 fc __ ASL $fc ; (tworks + 5)
322b : 06 fd __ ASL $fd ; (tworks + 6)
322d : 06 fe __ ASL $fe ; (tworks + 7)
322f : e6 0d __ INC P0 ; (lx + 0)
3231 : a5 0d __ LDA P0 ; (lx + 0)
3233 : c9 08 __ CMP #$08
3235 : d0 35 __ BNE $326c ; (bmu_text.s51 + 0)
.s12:
3237 : a5 f7 __ LDA $f7 ; (tworks + 0)
3239 : a0 00 __ LDY #$00
323b : 84 0d __ STY P0 ; (lx + 0)
323d : 91 43 __ STA (T1 + 0),y 
323f : a5 f8 __ LDA $f8 ; (tworks + 1)
3241 : c8 __ __ INY
3242 : 91 43 __ STA (T1 + 0),y 
3244 : a5 f9 __ LDA $f9 ; (tworks + 2)
3246 : c8 __ __ INY
3247 : 91 43 __ STA (T1 + 0),y 
3249 : a5 fa __ LDA $fa ; (tworks + 3)
324b : c8 __ __ INY
324c : 91 43 __ STA (T1 + 0),y 
324e : a5 fb __ LDA $fb ; (tworks + 4)
3250 : c8 __ __ INY
3251 : 91 43 __ STA (T1 + 0),y 
3253 : a5 fc __ LDA $fc ; (tworks + 5)
3255 : c8 __ __ INY
3256 : 91 43 __ STA (T1 + 0),y 
3258 : a5 fd __ LDA $fd ; (tworks + 6)
325a : c8 __ __ INY
325b : 91 43 __ STA (T1 + 0),y 
325d : a5 fe __ LDA $fe ; (tworks + 7)
325f : c8 __ __ INY
3260 : 91 43 __ STA (T1 + 0),y 
3262 : a5 43 __ LDA T1 + 0 
3264 : 69 07 __ ADC #$07
3266 : 85 43 __ STA T1 + 0 
3268 : 90 02 __ BCC $326c ; (bmu_text.s51 + 0)
.s1010:
326a : e6 44 __ INC T1 + 1 
.s51:
326c : e6 1d __ INC ACCU + 2 
326e : e6 48 __ INC T8 + 0 
3270 : a5 48 __ LDA T8 + 0 
3272 : c5 10 __ CMP P3 ; (len + 0)
3274 : b0 03 __ BCS $3279 ; (bmu_text.s1004 + 0)
3276 : 4c 8d 31 JMP $318d ; (bmu_text.l2 + 0)
.s1004:
3279 : a6 0d __ LDX P0 ; (lx + 0)
327b : e0 08 __ CPX #$08
327d : b0 15 __ BCS $3294 ; (bmu_text.s17 + 0)
.l16:
327f : 06 f7 __ ASL $f7 ; (tworks + 0)
3281 : 06 f8 __ ASL $f8 ; (tworks + 1)
3283 : 06 f9 __ ASL $f9 ; (tworks + 2)
3285 : 06 fa __ ASL $fa ; (tworks + 3)
3287 : 06 fb __ ASL $fb ; (tworks + 4)
3289 : 06 fc __ ASL $fc ; (tworks + 5)
328b : 06 fd __ ASL $fd ; (tworks + 6)
328d : 06 fe __ ASL $fe ; (tworks + 7)
328f : e8 __ __ INX
3290 : e0 08 __ CPX #$08
3292 : 90 eb __ BCC $327f ; (bmu_text.l16 + 0)
.s17:
3294 : a5 f7 __ LDA $f7 ; (tworks + 0)
3296 : a0 00 __ LDY #$00
3298 : 91 43 __ STA (T1 + 0),y 
329a : a5 f8 __ LDA $f8 ; (tworks + 1)
329c : c8 __ __ INY
329d : 91 43 __ STA (T1 + 0),y 
329f : a5 f9 __ LDA $f9 ; (tworks + 2)
32a1 : c8 __ __ INY
32a2 : 91 43 __ STA (T1 + 0),y 
32a4 : a5 fa __ LDA $fa ; (tworks + 3)
32a6 : c8 __ __ INY
32a7 : 91 43 __ STA (T1 + 0),y 
32a9 : a5 fb __ LDA $fb ; (tworks + 4)
32ab : c8 __ __ INY
32ac : 91 43 __ STA (T1 + 0),y 
32ae : a5 fc __ LDA $fc ; (tworks + 5)
32b0 : c8 __ __ INY
32b1 : 91 43 __ STA (T1 + 0),y 
32b3 : a5 fd __ LDA $fd ; (tworks + 6)
32b5 : c8 __ __ INY
32b6 : 91 43 __ STA (T1 + 0),y 
32b8 : a5 fe __ LDA $fe ; (tworks + 7)
32ba : c8 __ __ INY
32bb : 91 43 __ STA (T1 + 0),y 
.s1001:
32bd : 60 __ __ RTS
--------------------------------------------------------------------
sin@proxy: ; sin@proxy
32d4 : a5 1b __ LDA ACCU + 0 
32d6 : 85 0d __ STA P0 
32d8 : a5 1c __ LDA ACCU + 1 
32da : 85 0e __ STA P1 
32dc : a5 1d __ LDA ACCU + 2 
32de : 85 0f __ STA P2 
32e0 : a5 1e __ LDA ACCU + 3 
32e2 : 85 10 __ STA P3 
--------------------------------------------------------------------
sin: ; sin()->float
.s0:
32e4 : a5 0d __ LDA P0 ; (f + 0)
32e6 : 85 43 __ STA T0 + 0 
32e8 : a5 0e __ LDA P1 ; (f + 1)
32ea : 85 44 __ STA T0 + 1 
32ec : a5 0f __ LDA P2 ; (f + 2)
32ee : 85 45 __ STA T0 + 2 
32f0 : a5 10 __ LDA P3 ; (f + 3)
32f2 : 29 7f __ AND #$7f
32f4 : 05 0f __ ORA P2 ; (f + 2)
32f6 : 05 0e __ ORA P1 ; (f + 1)
32f8 : 05 0d __ ORA P0 ; (f + 0)
32fa : f0 0e __ BEQ $330a ; (sin.s9 + 0)
.s1018:
32fc : 24 10 __ BIT P3 ; (f + 3)
32fe : 10 0a __ BPL $330a ; (sin.s9 + 0)
.s8:
3300 : a9 00 __ LDA #$00
3302 : 85 47 __ STA T1 + 0 
3304 : 85 48 __ STA T1 + 1 
3306 : a9 bf __ LDA #$bf
3308 : d0 08 __ BNE $3312 ; (sin.s10 + 0)
.s9:
330a : a9 00 __ LDA #$00
330c : 85 47 __ STA T1 + 0 
330e : 85 48 __ STA T1 + 1 
3310 : a9 3f __ LDA #$3f
.s10:
3312 : 85 4a __ STA T1 + 3 
3314 : a5 10 __ LDA P3 ; (f + 3)
3316 : 29 7f __ AND #$7f
3318 : 85 46 __ STA T0 + 3 
331a : a9 80 __ LDA #$80
331c : 85 49 __ STA T1 + 2 
331e : a9 83 __ LDA #$83
3320 : 85 1b __ STA ACCU + 0 
3322 : a9 3e __ LDA #$3e
3324 : 85 1e __ STA ACCU + 3 
3326 : a9 f9 __ LDA #$f9
3328 : 85 1c __ STA ACCU + 1 
332a : a9 22 __ LDA #$22
332c : 85 1d __ STA ACCU + 2 
332e : a2 43 __ LDX #$43
3330 : 20 61 45 JSR $4561 ; (freg + 4)
3333 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
3336 : a5 1b __ LDA ACCU + 0 
3338 : 85 43 __ STA T0 + 0 
333a : a5 1c __ LDA ACCU + 1 
333c : 85 44 __ STA T0 + 1 
333e : a5 1d __ LDA ACCU + 2 
3340 : 85 45 __ STA T0 + 2 
3342 : a5 1e __ LDA ACCU + 3 
3344 : 85 46 __ STA T0 + 3 
3346 : 20 81 45 JSR $4581 ; (freg + 36)
3349 : 20 6b 47 JSR $476b ; (fround + 0)
334c : a2 43 __ LDX #$43
334e : 20 61 45 JSR $4561 ; (freg + 4)
3351 : a5 1e __ LDA ACCU + 3 
3353 : 49 80 __ EOR #$80
3355 : 85 1e __ STA ACCU + 3 
3357 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
335a : a5 1b __ LDA ACCU + 0 
335c : 85 43 __ STA T0 + 0 
335e : a5 1c __ LDA ACCU + 1 
3360 : 85 44 __ STA T0 + 1 
3362 : a6 1d __ LDX ACCU + 2 
3364 : 86 45 __ STX T0 + 2 
3366 : a5 1e __ LDA ACCU + 3 
3368 : 85 46 __ STA T0 + 3 
336a : 30 3d __ BMI $33a9 ; (sin.s13 + 0)
.s1013:
336c : c9 3f __ CMP #$3f
336e : d0 0d __ BNE $337d ; (sin.s1017 + 0)
.s1014:
3370 : 8a __ __ TXA
3371 : d0 0a __ BNE $337d ; (sin.s1017 + 0)
.s1015:
3373 : a5 1c __ LDA ACCU + 1 
3375 : 38 __ __ SEC
3376 : d0 05 __ BNE $337d ; (sin.s1017 + 0)
.s1016:
3378 : a5 1b __ LDA ACCU + 0 
337a : 38 __ __ SEC
337b : f0 02 __ BEQ $337f ; (sin.s1 + 0)
.s1017:
337d : 90 2a __ BCC $33a9 ; (sin.s13 + 0)
.s1:
337f : a5 4a __ LDA T1 + 3 
3381 : 49 80 __ EOR #$80
3383 : 85 4a __ STA T1 + 3 
3385 : a9 00 __ LDA #$00
3387 : 85 1b __ STA ACCU + 0 
3389 : 85 1c __ STA ACCU + 1 
338b : 85 1d __ STA ACCU + 2 
338d : a9 bf __ LDA #$bf
338f : 85 1e __ STA ACCU + 3 
3391 : a2 43 __ LDX #$43
3393 : 20 61 45 JSR $4561 ; (freg + 4)
3396 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
3399 : a5 1b __ LDA ACCU + 0 
339b : 85 43 __ STA T0 + 0 
339d : a5 1c __ LDA ACCU + 1 
339f : 85 44 __ STA T0 + 1 
33a1 : a5 1d __ LDA ACCU + 2 
33a3 : 85 45 __ STA T0 + 2 
33a5 : a5 1e __ LDA ACCU + 3 
33a7 : 85 46 __ STA T0 + 3 
.s13:
33a9 : a5 1e __ LDA ACCU + 3 
33ab : 30 39 __ BMI $33e6 ; (sin.s6 + 0)
.s1005:
33ad : c9 3e __ CMP #$3e
33af : d0 0f __ BNE $33c0 ; (sin.s1009 + 0)
.s1006:
33b1 : a5 1d __ LDA ACCU + 2 
33b3 : c9 80 __ CMP #$80
33b5 : d0 09 __ BNE $33c0 ; (sin.s1009 + 0)
.s1007:
33b7 : a5 1c __ LDA ACCU + 1 
33b9 : d0 05 __ BNE $33c0 ; (sin.s1009 + 0)
.s1008:
33bb : a5 1b __ LDA ACCU + 0 
33bd : 38 __ __ SEC
33be : f0 02 __ BEQ $33c2 ; (sin.s4 + 0)
.s1009:
33c0 : 90 24 __ BCC $33e6 ; (sin.s6 + 0)
.s4:
33c2 : a9 00 __ LDA #$00
33c4 : 85 1b __ STA ACCU + 0 
33c6 : 85 1c __ STA ACCU + 1 
33c8 : 85 1d __ STA ACCU + 2 
33ca : a9 3f __ LDA #$3f
33cc : 85 1e __ STA ACCU + 3 
33ce : a2 43 __ LDX #$43
33d0 : 20 61 45 JSR $4561 ; (freg + 4)
33d3 : 20 a2 45 JSR $45a2 ; (faddsub + 0)
33d6 : a5 1b __ LDA ACCU + 0 
33d8 : 85 43 __ STA T0 + 0 
33da : a5 1c __ LDA ACCU + 1 
33dc : 85 44 __ STA T0 + 1 
33de : a5 1d __ LDA ACCU + 2 
33e0 : 85 45 __ STA T0 + 2 
33e2 : a5 1e __ LDA ACCU + 3 
33e4 : 85 46 __ STA T0 + 3 
.s6:
33e6 : a9 98 __ LDA #$98
33e8 : 85 1b __ STA ACCU + 0 
33ea : a9 42 __ LDA #$42
33ec : 85 1e __ STA ACCU + 3 
33ee : a9 ec __ LDA #$ec
33f0 : 85 1c __ STA ACCU + 1 
33f2 : a9 5e __ LDA #$5e
33f4 : 85 1d __ STA ACCU + 2 
33f6 : a2 43 __ LDX #$43
33f8 : 20 61 45 JSR $4561 ; (freg + 4)
33fb : 20 73 34 JSR $3473 ; (crt_fmul + 0)
33fe : a9 f8 __ LDA #$f8
3400 : 85 03 __ STA WORK + 0 
3402 : a9 c5 __ LDA #$c5
3404 : 85 04 __ STA WORK + 1 
3406 : a9 13 __ LDA #$13
3408 : 85 05 __ STA WORK + 2 
340a : 20 cc 4a JSR $4acc ; (freg@proxy + 0)
340d : 20 a8 45 JSR $45a8 ; (faddsub + 6)
3410 : a2 43 __ LDX #$43
3412 : 20 61 45 JSR $4561 ; (freg + 4)
3415 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
3418 : a9 6e __ LDA #$6e
341a : 85 03 __ STA WORK + 0 
341c : a9 c2 __ LDA #$c2
341e : 85 06 __ STA WORK + 3 
3420 : a9 27 __ LDA #$27
3422 : 85 04 __ STA WORK + 1 
3424 : a9 2a __ LDA #$2a
3426 : 85 05 __ STA WORK + 2 
3428 : 20 71 45 JSR $4571 ; (freg + 20)
342b : 20 a8 45 JSR $45a8 ; (faddsub + 6)
342e : a2 43 __ LDX #$43
3430 : 20 61 45 JSR $4561 ; (freg + 4)
3433 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
3436 : a9 df __ LDA #$df
3438 : 85 03 __ STA WORK + 0 
343a : a9 af __ LDA #$af
343c : 85 04 __ STA WORK + 1 
343e : a9 5c __ LDA #$5c
3440 : 85 05 __ STA WORK + 2 
3442 : 20 f8 4a JSR $4af8 ; (freg@proxy + 0)
3445 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
3448 : a2 43 __ LDX #$43
344a : 20 61 45 JSR $4561 ; (freg + 4)
344d : 20 73 34 JSR $3473 ; (crt_fmul + 0)
3450 : a9 b6 __ LDA #$b6
3452 : 85 03 __ STA WORK + 0 
3454 : a9 40 __ LDA #$40
3456 : 85 06 __ STA WORK + 3 
3458 : a9 0f __ LDA #$0f
345a : 85 04 __ STA WORK + 1 
345c : a9 c9 __ LDA #$c9
345e : 85 05 __ STA WORK + 2 
3460 : 20 71 45 JSR $4571 ; (freg + 20)
3463 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
3466 : a2 43 __ LDX #$43
3468 : 20 61 45 JSR $4561 ; (freg + 4)
346b : 20 73 34 JSR $3473 ; (crt_fmul + 0)
346e : a2 47 __ LDX #$47
3470 : 20 61 45 JSR $4561 ; (freg + 4)
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
3473 : a5 1b __ LDA ACCU + 0 
3475 : 05 1c __ ORA ACCU + 1 
3477 : 05 1d __ ORA ACCU + 2 
3479 : f0 0e __ BEQ $3489 ; (crt_fmul + 22)
347b : a5 03 __ LDA WORK + 0 
347d : 05 04 __ ORA WORK + 1 
347f : 05 05 __ ORA WORK + 2 
3481 : d0 09 __ BNE $348c ; (crt_fmul + 25)
3483 : 85 1b __ STA ACCU + 0 
3485 : 85 1c __ STA ACCU + 1 
3487 : 85 1d __ STA ACCU + 2 
3489 : 85 1e __ STA ACCU + 3 
348b : 60 __ __ RTS
348c : a5 1e __ LDA ACCU + 3 
348e : 45 06 __ EOR WORK + 3 
3490 : 29 80 __ AND #$80
3492 : 85 1e __ STA ACCU + 3 
3494 : a9 ff __ LDA #$ff
3496 : c5 07 __ CMP WORK + 4 
3498 : f0 42 __ BEQ $34dc ; (crt_fmul + 105)
349a : c5 08 __ CMP WORK + 5 
349c : f0 3e __ BEQ $34dc ; (crt_fmul + 105)
349e : a9 00 __ LDA #$00
34a0 : 85 09 __ STA WORK + 6 
34a2 : 85 0a __ STA WORK + 7 
34a4 : 85 0b __ STA WORK + 8 
34a6 : a4 1b __ LDY ACCU + 0 
34a8 : a5 03 __ LDA WORK + 0 
34aa : d0 06 __ BNE $34b2 ; (crt_fmul + 63)
34ac : a5 04 __ LDA WORK + 1 
34ae : f0 0a __ BEQ $34ba ; (crt_fmul + 71)
34b0 : d0 05 __ BNE $34b7 ; (crt_fmul + 68)
34b2 : 20 8f 46 JSR $468f ; (crt_fmul8 + 0)
34b5 : a5 04 __ LDA WORK + 1 
34b7 : 20 8f 46 JSR $468f ; (crt_fmul8 + 0)
34ba : a5 05 __ LDA WORK + 2 
34bc : 20 8f 46 JSR $468f ; (crt_fmul8 + 0)
34bf : 38 __ __ SEC
34c0 : a5 0b __ LDA WORK + 8 
34c2 : 30 06 __ BMI $34ca ; (crt_fmul + 87)
34c4 : 06 09 __ ASL WORK + 6 
34c6 : 26 0a __ ROL WORK + 7 
34c8 : 2a __ __ ROL
34c9 : 18 __ __ CLC
34ca : 29 7f __ AND #$7f
34cc : 85 0b __ STA WORK + 8 
34ce : a5 07 __ LDA WORK + 4 
34d0 : 65 08 __ ADC WORK + 5 
34d2 : 90 19 __ BCC $34ed ; (crt_fmul + 122)
34d4 : e9 7f __ SBC #$7f
34d6 : b0 04 __ BCS $34dc ; (crt_fmul + 105)
34d8 : c9 ff __ CMP #$ff
34da : d0 15 __ BNE $34f1 ; (crt_fmul + 126)
34dc : a5 1e __ LDA ACCU + 3 
34de : 09 7f __ ORA #$7f
34e0 : 85 1e __ STA ACCU + 3 
34e2 : a9 80 __ LDA #$80
34e4 : 85 1d __ STA ACCU + 2 
34e6 : a9 00 __ LDA #$00
34e8 : 85 1b __ STA ACCU + 0 
34ea : 85 1c __ STA ACCU + 1 
34ec : 60 __ __ RTS
34ed : e9 7e __ SBC #$7e
34ef : 90 15 __ BCC $3506 ; (crt_fmul + 147)
34f1 : 4a __ __ LSR
34f2 : 05 1e __ ORA ACCU + 3 
34f4 : 85 1e __ STA ACCU + 3 
34f6 : a9 00 __ LDA #$00
34f8 : 6a __ __ ROR
34f9 : 05 0b __ ORA WORK + 8 
34fb : 85 1d __ STA ACCU + 2 
34fd : a5 0a __ LDA WORK + 7 
34ff : 85 1c __ STA ACCU + 1 
3501 : a5 09 __ LDA WORK + 6 
3503 : 85 1b __ STA ACCU + 0 
3505 : 60 __ __ RTS
3506 : a9 00 __ LDA #$00
3508 : 85 1e __ STA ACCU + 3 
350a : f0 d8 __ BEQ $34e4 ; (crt_fmul + 113)
350c : 60 __ __ RTS
--------------------------------------------------------------------
exp: ; exp()->float
.s0:
350d : a9 00 __ LDA #$00
350f : 8d f2 c7 STA $c7f2 ; (bm_trapezoid_fill@stack + 13)
3512 : 8d f3 c7 STA $c7f3 ; (bm_trapezoid_fill@stack + 14)
3515 : a5 0d __ LDA P0 ; (f + 0)
3517 : 85 1b __ STA ACCU + 0 
3519 : a5 0e __ LDA P1 ; (f + 1)
351b : 85 1c __ STA ACCU + 1 
351d : a5 0f __ LDA P2 ; (f + 2)
351f : 85 1d __ STA ACCU + 2 
3521 : a5 10 __ LDA P3 ; (f + 3)
3523 : 85 1e __ STA ACCU + 3 
3525 : a9 3b __ LDA #$3b
3527 : 85 03 __ STA WORK + 0 
3529 : a9 aa __ LDA #$aa
352b : 85 04 __ STA WORK + 1 
352d : a9 b8 __ LDA #$b8
352f : 85 05 __ STA WORK + 2 
3531 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
3534 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
3537 : a5 1b __ LDA ACCU + 0 
3539 : 85 43 __ STA T0 + 0 
353b : a5 1c __ LDA ACCU + 1 
353d : 85 44 __ STA T0 + 1 
353f : a5 1d __ LDA ACCU + 2 
3541 : 85 45 __ STA T0 + 2 
3543 : a5 1e __ LDA ACCU + 3 
3545 : 85 46 __ STA T0 + 3 
3547 : 20 81 45 JSR $4581 ; (freg + 36)
354a : 20 6b 47 JSR $476b ; (fround + 0)
354d : a5 1b __ LDA ACCU + 0 
354f : 85 47 __ STA T1 + 0 
3551 : a5 1c __ LDA ACCU + 1 
3553 : 85 48 __ STA T1 + 1 
3555 : a5 1d __ LDA ACCU + 2 
3557 : 85 49 __ STA T1 + 2 
3559 : a5 1e __ LDA ACCU + 3 
355b : 85 4a __ STA T1 + 3 
355d : 20 65 48 JSR $4865 ; (f32_to_i16 + 0)
3560 : 18 __ __ CLC
3561 : a5 1b __ LDA ACCU + 0 
3563 : 69 7f __ ADC #$7f
3565 : aa __ __ TAX
3566 : a5 1c __ LDA ACCU + 1 
3568 : 69 00 __ ADC #$00
356a : 4a __ __ LSR
356b : 8a __ __ TXA
356c : 6a __ __ ROR
356d : 8d f5 c7 STA $c7f5 ; (bm_trapezoid_fill@stack + 16)
3570 : a9 00 __ LDA #$00
3572 : 6a __ __ ROR
3573 : 8d f4 c7 STA $c7f4 ; (bm_trapezoid_fill@stack + 15)
3576 : a2 47 __ LDX #$47
3578 : 20 74 4b JSR $4b74 ; (freg@proxy + 0)
357b : 20 a2 45 JSR $45a2 ; (faddsub + 0)
357e : a5 1b __ LDA ACCU + 0 
3580 : 85 43 __ STA T0 + 0 
3582 : a5 1c __ LDA ACCU + 1 
3584 : 85 44 __ STA T0 + 1 
3586 : a5 1d __ LDA ACCU + 2 
3588 : 85 45 __ STA T0 + 2 
358a : a5 1e __ LDA ACCU + 3 
358c : 85 46 __ STA T0 + 3 
358e : a9 fc __ LDA #$fc
3590 : 85 03 __ STA WORK + 0 
3592 : a9 3a __ LDA #$3a
3594 : 85 06 __ STA WORK + 3 
3596 : a9 4d __ LDA #$4d
3598 : 85 04 __ STA WORK + 1 
359a : a9 f8 __ LDA #$f8
359c : 85 05 __ STA WORK + 2 
359e : 20 71 45 JSR $4571 ; (freg + 20)
35a1 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
35a4 : a9 70 __ LDA #$70
35a6 : 85 03 __ STA WORK + 0 
35a8 : a9 3c __ LDA #$3c
35aa : 85 06 __ STA WORK + 3 
35ac : a9 7c __ LDA #$7c
35ae : 85 04 __ STA WORK + 1 
35b0 : a9 12 __ LDA #$12
35b2 : 85 05 __ STA WORK + 2 
35b4 : 20 71 45 JSR $4571 ; (freg + 20)
35b7 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
35ba : a2 43 __ LDX #$43
35bc : 20 61 45 JSR $4561 ; (freg + 4)
35bf : 20 73 34 JSR $3473 ; (crt_fmul + 0)
35c2 : a9 42 __ LDA #$42
35c4 : 85 03 __ STA WORK + 0 
35c6 : a9 de __ LDA #$de
35c8 : 85 04 __ STA WORK + 1 
35ca : a9 64 __ LDA #$64
35cc : 85 05 __ STA WORK + 2 
35ce : 20 f8 4a JSR $4af8 ; (freg@proxy + 0)
35d1 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
35d4 : a2 43 __ LDX #$43
35d6 : 20 61 45 JSR $4561 ; (freg + 4)
35d9 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
35dc : a9 2e __ LDA #$2e
35de : 85 03 __ STA WORK + 0 
35e0 : a9 3e __ LDA #$3e
35e2 : 85 06 __ STA WORK + 3 
35e4 : a9 e5 __ LDA #$e5
35e6 : 85 04 __ STA WORK + 1 
35e8 : a9 75 __ LDA #$75
35ea : 85 05 __ STA WORK + 2 
35ec : 20 71 45 JSR $4571 ; (freg + 20)
35ef : 20 a8 45 JSR $45a8 ; (faddsub + 6)
35f2 : a2 43 __ LDX #$43
35f4 : 20 61 45 JSR $4561 ; (freg + 4)
35f7 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
35fa : a9 b7 __ LDA #$b7
35fc : 85 03 __ STA WORK + 0 
35fe : a9 72 __ LDA #$72
3600 : 85 04 __ STA WORK + 1 
3602 : a9 31 __ LDA #$31
3604 : 85 05 __ STA WORK + 2 
3606 : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
3609 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
360c : a2 43 __ LDX #$43
360e : 20 61 45 JSR $4561 ; (freg + 4)
3611 : 20 73 34 JSR $3473 ; (crt_fmul + 0)
3614 : a9 00 __ LDA #$00
3616 : 85 03 __ STA WORK + 0 
3618 : 85 04 __ STA WORK + 1 
361a : a9 80 __ LDA #$80
361c : 85 05 __ STA WORK + 2 
361e : 20 e6 4a JSR $4ae6 ; (freg@proxy + 0)
3621 : 20 a8 45 JSR $45a8 ; (faddsub + 6)
3624 : ad f2 c7 LDA $c7f2 ; (bm_trapezoid_fill@stack + 13)
3627 : 85 03 __ STA WORK + 0 
3629 : ad f3 c7 LDA $c7f3 ; (bm_trapezoid_fill@stack + 14)
362c : 85 04 __ STA WORK + 1 
362e : ad f4 c7 LDA $c7f4 ; (bm_trapezoid_fill@stack + 15)
3631 : 85 05 __ STA WORK + 2 
3633 : ad f5 c7 LDA $c7f5 ; (bm_trapezoid_fill@stack + 16)
3636 : 85 06 __ STA WORK + 3 
3638 : 20 71 45 JSR $4571 ; (freg + 20)
363b : 4c 73 34 JMP $3473 ; (crt_fmul + 0)
--------------------------------------------------------------------
363e : __ __ __ BYT 50 72 6f 6a 65 63 74 69 6e 67 20 76 65 72 74 69 : Projecting verti
364e : __ __ __ BYT 63 65 73 00                                     : ces.
--------------------------------------------------------------------
3652 : __ __ __ BYT 53 6f 72 74 69 6e 67 20 73 75 72 66 61 63 65 73 : Sorting surfaces
3662 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
qsort: ; qsort(,)->void
.s1000:
3663 : 38 __ __ SEC
3664 : a5 23 __ LDA SP + 0 
3666 : e9 14 __ SBC #$14
3668 : 85 23 __ STA SP + 0 
366a : b0 02 __ BCS $366e ; (qsort.s1000 + 11)
366c : c6 24 __ DEC SP + 1 
366e : a0 0d __ LDY #$0d
3670 : a2 07 __ LDX #$07
3672 : b5 53 __ LDA T0 + 0,x 
3674 : 91 23 __ STA (SP + 0),y 
3676 : 88 __ __ DEY
3677 : ca __ __ DEX
3678 : 10 f8 __ BPL $3672 ; (qsort.s1000 + 15)
.s0:
367a : a0 18 __ LDY #$18
367c : b1 23 __ LDA (SP + 0),y 
367e : 85 57 __ STA T5 + 0 
3680 : c8 __ __ INY
3681 : b1 23 __ LDA (SP + 0),y 
3683 : 30 0a __ BMI $368f ; (qsort.s1001 + 0)
.s1003:
3685 : 85 58 __ STA T5 + 1 
3687 : d0 1e __ BNE $36a7 ; (qsort.s1 + 0)
.s1002:
3689 : a5 57 __ LDA T5 + 0 
368b : c9 02 __ CMP #$02
368d : b0 18 __ BCS $36a7 ; (qsort.s1 + 0)
.s1001:
368f : a0 0d __ LDY #$0d
3691 : a2 07 __ LDX #$07
3693 : b1 23 __ LDA (SP + 0),y 
3695 : 95 53 __ STA T0 + 0,x 
3697 : 88 __ __ DEY
3698 : ca __ __ DEX
3699 : 10 f8 __ BPL $3693 ; (qsort.s1001 + 4)
369b : 18 __ __ CLC
369c : a5 23 __ LDA SP + 0 
369e : 69 14 __ ADC #$14
36a0 : 85 23 __ STA SP + 0 
36a2 : 90 02 __ BCC $36a6 ; (qsort.s1001 + 23)
36a4 : e6 24 __ INC SP + 1 
36a6 : 60 __ __ RTS
.s1:
36a7 : a0 16 __ LDY #$16
36a9 : b1 23 __ LDA (SP + 0),y 
36ab : 85 47 __ STA T2 + 0 
36ad : c8 __ __ INY
36ae : b1 23 __ LDA (SP + 0),y 
36b0 : 85 48 __ STA T2 + 1 
36b2 : 18 __ __ CLC
36b3 : a5 23 __ LDA SP + 0 
36b5 : 69 0e __ ADC #$0e
36b7 : 85 1f __ STA ADDR + 0 
36b9 : a5 24 __ LDA SP + 1 
36bb : 69 00 __ ADC #$00
36bd : 85 20 __ STA ADDR + 1 
36bf : a0 00 __ LDY #$00
36c1 : b1 47 __ LDA (T2 + 0),y 
36c3 : 91 1f __ STA (ADDR + 0),y 
36c5 : c8 __ __ INY
36c6 : b1 47 __ LDA (T2 + 0),y 
36c8 : 91 1f __ STA (ADDR + 0),y 
36ca : c8 __ __ INY
36cb : b1 47 __ LDA (T2 + 0),y 
36cd : 91 1f __ STA (ADDR + 0),y 
36cf : c8 __ __ INY
36d0 : b1 47 __ LDA (T2 + 0),y 
36d2 : 91 1f __ STA (ADDR + 0),y 
36d4 : c8 __ __ INY
36d5 : b1 47 __ LDA (T2 + 0),y 
36d7 : 91 1f __ STA (ADDR + 0),y 
36d9 : c8 __ __ INY
36da : b1 47 __ LDA (T2 + 0),y 
36dc : 91 1f __ STA (ADDR + 0),y 
36de : 38 __ __ SEC
36df : a5 57 __ LDA T5 + 0 
36e1 : e9 01 __ SBC #$01
36e3 : 85 49 __ STA T3 + 0 
36e5 : a5 58 __ LDA T5 + 1 
36e7 : e9 00 __ SBC #$00
36e9 : 85 4a __ STA T3 + 1 
36eb : a9 00 __ LDA #$00
36ed : 85 59 __ STA T6 + 0 
36ef : 85 5a __ STA T6 + 1 
36f1 : 18 __ __ CLC
36f2 : a5 47 __ LDA T2 + 0 
36f4 : 69 06 __ ADC #$06
36f6 : 85 4b __ STA T4 + 0 
36f8 : a5 48 __ LDA T2 + 1 
36fa : 69 00 __ ADC #$00
36fc : 85 4c __ STA T4 + 1 
36fe : a0 00 __ LDY #$00
3700 : b1 47 __ LDA (T2 + 0),y 
3702 : 85 53 __ STA T0 + 0 
3704 : c8 __ __ INY
3705 : b1 47 __ LDA (T2 + 0),y 
3707 : 85 54 __ STA T0 + 1 
3709 : c8 __ __ INY
370a : b1 47 __ LDA (T2 + 0),y 
370c : 85 55 __ STA T0 + 2 
370e : c8 __ __ INY
370f : b1 47 __ LDA (T2 + 0),y 
3711 : 85 56 __ STA T0 + 3 
.l5:
3713 : a0 00 __ LDY #$00
3715 : b1 4b __ LDA (T4 + 0),y 
3717 : 85 1b __ STA ACCU + 0 
3719 : c8 __ __ INY
371a : b1 4b __ LDA (T4 + 0),y 
371c : 85 1c __ STA ACCU + 1 
371e : c8 __ __ INY
371f : b1 4b __ LDA (T4 + 0),y 
3721 : 85 1d __ STA ACCU + 2 
3723 : c8 __ __ INY
3724 : b1 4b __ LDA (T4 + 0),y 
3726 : 85 1e __ STA ACCU + 3 
3728 : a5 53 __ LDA T0 + 0 
372a : 85 03 __ STA WORK + 0 
372c : a5 54 __ LDA T0 + 1 
372e : 85 04 __ STA WORK + 1 
3730 : a5 55 __ LDA T0 + 2 
3732 : 85 05 __ STA WORK + 2 
3734 : a5 56 __ LDA T0 + 3 
3736 : 85 06 __ STA WORK + 3 
3738 : 20 fe 48 JSR $48fe ; (crt_fcmp + 0)
373b : 10 03 __ BPL $3740 ; (qsort.s19 + 0)
373d : 4c ed 37 JMP $37ed ; (qsort.s8 + 0)
.s19:
3740 : 18 __ __ CLC
3741 : a5 4b __ LDA T4 + 0 
3743 : 69 06 __ ADC #$06
3745 : 85 4b __ STA T4 + 0 
3747 : 90 02 __ BCC $374b ; (qsort.s1007 + 0)
.s1006:
3749 : e6 4c __ INC T4 + 1 
.s1007:
374b : a5 49 __ LDA T3 + 0 
374d : d0 02 __ BNE $3751 ; (qsort.s1009 + 0)
.s1008:
374f : c6 4a __ DEC T3 + 1 
.s1009:
3751 : c6 49 __ DEC T3 + 0 
3753 : d0 be __ BNE $3713 ; (qsort.l5 + 0)
.s1010:
3755 : a5 4a __ LDA T3 + 1 
3757 : d0 ba __ BNE $3713 ; (qsort.l5 + 0)
.s7:
3759 : a5 59 __ LDA T6 + 0 
375b : 0a __ __ ASL
375c : a8 __ __ TAY
375d : a5 5a __ LDA T6 + 1 
375f : 2a __ __ ROL
3760 : aa __ __ TAX
3761 : 98 __ __ TYA
3762 : 18 __ __ CLC
3763 : 65 59 __ ADC T6 + 0 
3765 : 85 53 __ STA T0 + 0 
3767 : 8a __ __ TXA
3768 : 65 5a __ ADC T6 + 1 
376a : 06 53 __ ASL T0 + 0 
376c : 2a __ __ ROL
376d : aa __ __ TAX
376e : 18 __ __ CLC
376f : a5 47 __ LDA T2 + 0 
3771 : 65 53 __ ADC T0 + 0 
3773 : 85 53 __ STA T0 + 0 
3775 : 8a __ __ TXA
3776 : 65 48 __ ADC T2 + 1 
3778 : 85 54 __ STA T0 + 1 
377a : 18 __ __ CLC
377b : a5 23 __ LDA SP + 0 
377d : 69 0e __ ADC #$0e
377f : 85 1b __ STA ACCU + 0 
3781 : a5 24 __ LDA SP + 1 
3783 : 69 00 __ ADC #$00
3785 : 85 1c __ STA ACCU + 1 
3787 : a0 00 __ LDY #$00
3789 : b1 1b __ LDA (ACCU + 0),y 
378b : 91 53 __ STA (T0 + 0),y 
378d : c8 __ __ INY
378e : b1 1b __ LDA (ACCU + 0),y 
3790 : 91 53 __ STA (T0 + 0),y 
3792 : c8 __ __ INY
3793 : b1 1b __ LDA (ACCU + 0),y 
3795 : 91 53 __ STA (T0 + 0),y 
3797 : c8 __ __ INY
3798 : b1 1b __ LDA (ACCU + 0),y 
379a : 91 53 __ STA (T0 + 0),y 
379c : c8 __ __ INY
379d : b1 1b __ LDA (ACCU + 0),y 
379f : 91 53 __ STA (T0 + 0),y 
37a1 : c8 __ __ INY
37a2 : b1 1b __ LDA (ACCU + 0),y 
37a4 : 91 53 __ STA (T0 + 0),y 
37a6 : a5 47 __ LDA T2 + 0 
37a8 : a0 02 __ LDY #$02
37aa : 91 23 __ STA (SP + 0),y 
37ac : a5 48 __ LDA T2 + 1 
37ae : c8 __ __ INY
37af : 91 23 __ STA (SP + 0),y 
37b1 : a5 59 __ LDA T6 + 0 
37b3 : c8 __ __ INY
37b4 : 91 23 __ STA (SP + 0),y 
37b6 : a5 5a __ LDA T6 + 1 
37b8 : c8 __ __ INY
37b9 : 91 23 __ STA (SP + 0),y 
37bb : 20 63 36 JSR $3663 ; (qsort.s1000 + 0)
37be : 18 __ __ CLC
37bf : a5 53 __ LDA T0 + 0 
37c1 : 69 06 __ ADC #$06
37c3 : a0 02 __ LDY #$02
37c5 : 91 23 __ STA (SP + 0),y 
37c7 : a5 54 __ LDA T0 + 1 
37c9 : 69 00 __ ADC #$00
37cb : c8 __ __ INY
37cc : 91 23 __ STA (SP + 0),y 
37ce : 38 __ __ SEC
37cf : a5 57 __ LDA T5 + 0 
37d1 : e5 59 __ SBC T6 + 0 
37d3 : a8 __ __ TAY
37d4 : a5 58 __ LDA T5 + 1 
37d6 : e5 5a __ SBC T6 + 1 
37d8 : aa __ __ TAX
37d9 : 98 __ __ TYA
37da : 38 __ __ SEC
37db : e9 01 __ SBC #$01
37dd : a0 04 __ LDY #$04
37df : 91 23 __ STA (SP + 0),y 
37e1 : 8a __ __ TXA
37e2 : e9 00 __ SBC #$00
37e4 : c8 __ __ INY
37e5 : 91 23 __ STA (SP + 0),y 
37e7 : 20 63 36 JSR $3663 ; (qsort.s1000 + 0)
37ea : 4c 8f 36 JMP $368f ; (qsort.s1001 + 0)
.s8:
37ed : a5 59 __ LDA T6 + 0 
37ef : 0a __ __ ASL
37f0 : a8 __ __ TAY
37f1 : a5 5a __ LDA T6 + 1 
37f3 : 2a __ __ ROL
37f4 : aa __ __ TAX
37f5 : 98 __ __ TYA
37f6 : 18 __ __ CLC
37f7 : 65 59 __ ADC T6 + 0 
37f9 : 85 43 __ STA T1 + 0 
37fb : 8a __ __ TXA
37fc : 65 5a __ ADC T6 + 1 
37fe : 06 43 __ ASL T1 + 0 
3800 : 2a __ __ ROL
3801 : aa __ __ TAX
3802 : 18 __ __ CLC
3803 : a5 47 __ LDA T2 + 0 
3805 : 65 43 __ ADC T1 + 0 
3807 : 85 43 __ STA T1 + 0 
3809 : 8a __ __ TXA
380a : 65 48 __ ADC T2 + 1 
380c : 85 44 __ STA T1 + 1 
380e : a0 00 __ LDY #$00
3810 : b1 4b __ LDA (T4 + 0),y 
3812 : 91 43 __ STA (T1 + 0),y 
3814 : c8 __ __ INY
3815 : b1 4b __ LDA (T4 + 0),y 
3817 : 91 43 __ STA (T1 + 0),y 
3819 : c8 __ __ INY
381a : b1 4b __ LDA (T4 + 0),y 
381c : 91 43 __ STA (T1 + 0),y 
381e : c8 __ __ INY
381f : b1 4b __ LDA (T4 + 0),y 
3821 : 91 43 __ STA (T1 + 0),y 
3823 : c8 __ __ INY
3824 : b1 4b __ LDA (T4 + 0),y 
3826 : 91 43 __ STA (T1 + 0),y 
3828 : c8 __ __ INY
3829 : b1 4b __ LDA (T4 + 0),y 
382b : 91 43 __ STA (T1 + 0),y 
382d : c8 __ __ INY
382e : b1 43 __ LDA (T1 + 0),y 
3830 : a0 00 __ LDY #$00
3832 : 91 4b __ STA (T4 + 0),y 
3834 : a0 07 __ LDY #$07
3836 : b1 43 __ LDA (T1 + 0),y 
3838 : a0 01 __ LDY #$01
383a : 91 4b __ STA (T4 + 0),y 
383c : a0 08 __ LDY #$08
383e : b1 43 __ LDA (T1 + 0),y 
3840 : a0 02 __ LDY #$02
3842 : 91 4b __ STA (T4 + 0),y 
3844 : a0 09 __ LDY #$09
3846 : b1 43 __ LDA (T1 + 0),y 
3848 : a0 03 __ LDY #$03
384a : 91 4b __ STA (T4 + 0),y 
384c : a0 0a __ LDY #$0a
384e : b1 43 __ LDA (T1 + 0),y 
3850 : a0 04 __ LDY #$04
3852 : 91 4b __ STA (T4 + 0),y 
3854 : a0 0b __ LDY #$0b
3856 : b1 43 __ LDA (T1 + 0),y 
3858 : a0 05 __ LDY #$05
385a : 91 4b __ STA (T4 + 0),y 
385c : e6 59 __ INC T6 + 0 
385e : f0 03 __ BEQ $3863 ; (qsort.s1004 + 0)
3860 : 4c 40 37 JMP $3740 ; (qsort.s19 + 0)
.s1004:
3863 : e6 5a __ INC T6 + 1 
3865 : 4c 40 37 JMP $3740 ; (qsort.s19 + 0)
--------------------------------------------------------------------
3868 : __ __ __ BYT 44 72 61 77 69 6e 67 20 73 75 72 66 61 63 65 73 : Drawing surfaces
3878 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
bm_trapezoid_fill: ; bm_trapezoid_fill(,,,,,,,,)->void
.s1000:
3879 : a2 07 __ LDX #$07
387b : b5 53 __ LDA T6 + 0,x 
387d : 9d e5 c7 STA $c7e5,x ; (bm_trapezoid_fill@stack + 0)
3880 : ca __ __ DEX
3881 : 10 f8 __ BPL $387b ; (bm_trapezoid_fill.s1000 + 2)
.s0:
3883 : ad 8b 4b LDA $4b8b ; (SRect + 3)
3886 : cd fd c7 CMP $c7fd ; (sstack + 7)
3889 : d0 0a __ BNE $3895 ; (bm_trapezoid_fill.s1032 + 0)
.s1029:
388b : ad 8a 4b LDA $4b8a ; (SRect + 2)
388e : cd fc c7 CMP $c7fc ; (sstack + 6)
.s1030:
3891 : 90 09 __ BCC $389c ; (bm_trapezoid_fill.s4 + 0)
3893 : b0 26 __ BCS $38bb ; (bm_trapezoid_fill.s1001 + 0)
.s1032:
3895 : 4d fd c7 EOR $c7fd ; (sstack + 7)
3898 : 10 f7 __ BPL $3891 ; (bm_trapezoid_fill.s1030 + 0)
.s1031:
389a : 90 1f __ BCC $38bb ; (bm_trapezoid_fill.s1001 + 0)
.s4:
389c : ad fa c7 LDA $c7fa ; (sstack + 4)
389f : 85 4e __ STA T4 + 0 
38a1 : ad fb c7 LDA $c7fb ; (sstack + 5)
38a4 : 85 4f __ STA T4 + 1 
38a6 : cd 8f 4b CMP $4b8f ; (SRect + 7)
38a9 : d0 09 __ BNE $38b4 ; (bm_trapezoid_fill.s1028 + 0)
.s1025:
38ab : a5 4e __ LDA T4 + 0 
38ad : cd 8e 4b CMP $4b8e ; (SRect + 6)
.s1026:
38b0 : b0 09 __ BCS $38bb ; (bm_trapezoid_fill.s1001 + 0)
38b2 : 90 12 __ BCC $38c6 ; (bm_trapezoid_fill.s3 + 0)
.s1028:
38b4 : 4d 8f 4b EOR $4b8f ; (SRect + 7)
38b7 : 10 f7 __ BPL $38b0 ; (bm_trapezoid_fill.s1026 + 0)
.s1027:
38b9 : b0 0b __ BCS $38c6 ; (bm_trapezoid_fill.s3 + 0)
.s1001:
38bb : a2 07 __ LDX #$07
38bd : bd e5 c7 LDA $c7e5,x ; (bm_trapezoid_fill@stack + 0)
38c0 : 95 53 __ STA T6 + 0,x 
38c2 : ca __ __ DEX
38c3 : 10 f8 __ BPL $38bd ; (bm_trapezoid_fill.s1001 + 2)
38c5 : 60 __ __ RTS
.s3:
38c6 : a5 0d __ LDA P0 ; (x0 + 0)
38c8 : 85 43 __ STA T0 + 0 
38ca : a5 0e __ LDA P1 ; (x0 + 1)
38cc : 85 44 __ STA T0 + 1 
38ce : a5 0f __ LDA P2 ; (x0 + 2)
38d0 : 85 45 __ STA T0 + 2 
38d2 : a5 10 __ LDA P3 ; (x0 + 3)
38d4 : 85 46 __ STA T0 + 3 
38d6 : a5 11 __ LDA P4 ; (x1 + 0)
38d8 : 85 47 __ STA T1 + 0 
38da : a5 12 __ LDA P5 ; (x1 + 1)
38dc : 85 48 __ STA T1 + 1 
38de : a5 13 __ LDA P6 ; (x1 + 2)
38e0 : 85 49 __ STA T1 + 2 
38e2 : a5 14 __ LDA P7 ; (x1 + 3)
38e4 : 85 4a __ STA T1 + 3 
38e6 : ad 8f 4b LDA $4b8f ; (SRect + 7)
38e9 : cd fd c7 CMP $c7fd ; (sstack + 7)
38ec : d0 0a __ BNE $38f8 ; (bm_trapezoid_fill.s1024 + 0)
.s1021:
38ee : ad 8e 4b LDA $4b8e ; (SRect + 6)
38f1 : cd fc c7 CMP $c7fc ; (sstack + 6)
.s1022:
38f4 : 90 09 __ BCC $38ff ; (bm_trapezoid_fill.s6 + 0)
38f6 : b0 13 __ BCS $390b ; (bm_trapezoid_fill.s8 + 0)
.s1024:
38f8 : 4d fd c7 EOR $c7fd ; (sstack + 7)
38fb : 10 f7 __ BPL $38f4 ; (bm_trapezoid_fill.s1022 + 0)
.s1023:
38fd : 90 0c __ BCC $390b ; (bm_trapezoid_fill.s8 + 0)
.s6:
38ff : ad 8e 4b LDA $4b8e ; (SRect + 6)
3902 : 8d fc c7 STA $c7fc ; (sstack + 6)
3905 : ad 8f 4b LDA $4b8f ; (SRect + 7)
3908 : 8d fd c7 STA $c7fd ; (sstack + 7)
.s8:
390b : a5 4f __ LDA T4 + 1 
390d : cd 8b 4b CMP $4b8b ; (SRect + 3)
3910 : d0 0a __ BNE $391c ; (bm_trapezoid_fill.s1020 + 0)
.s1017:
3912 : a5 4e __ LDA T4 + 0 
3914 : cd 8a 4b CMP $4b8a ; (SRect + 2)
.s1018:
3917 : b0 0a __ BCS $3923 ; (bm_trapezoid_fill.s11 + 0)
3919 : 4c 9a 3b JMP $3b9a ; (bm_trapezoid_fill.s9 + 0)
.s1020:
391c : 4d 8b 4b EOR $4b8b ; (SRect + 3)
391f : 10 f6 __ BPL $3917 ; (bm_trapezoid_fill.s1018 + 0)
.s1019:
3921 : b0 f6 __ BCS $3919 ; (bm_trapezoid_fill.s1018 + 2)
.s11:
3923 : ad fa c7 LDA $c7fa ; (sstack + 4)
3926 : cd fc c7 CMP $c7fc ; (sstack + 6)
3929 : b0 90 __ BCS $38bb ; (bm_trapezoid_fill.s1001 + 0)
.s54:
392b : 85 4e __ STA T4 + 0 
392d : 29 f8 __ AND #$f8
392f : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
3931 : ad fb c7 LDA $c7fb ; (sstack + 5)
3934 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3936 : ad d7 4d LDA $4dd7 ; (Screen + 4)
3939 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
393c : ad d3 4d LDA $4dd3 ; (Screen + 0)
393f : 18 __ __ CLC
3940 : 65 1b __ ADC ACCU + 0 ; (dx1 + 2)
3942 : 85 4b __ STA T2 + 0 
3944 : ad d4 4d LDA $4dd4 ; (Screen + 1)
3947 : 65 1c __ ADC ACCU + 1 ; (dx1 + 3)
3949 : aa __ __ TAX
394a : a5 4e __ LDA T4 + 0 
394c : 85 1d __ STA ACCU + 2 ; (y0 + 0)
394e : 29 07 __ AND #$07
3950 : 18 __ __ CLC
3951 : 65 4b __ ADC T2 + 0 
3953 : 85 50 __ STA T5 + 0 
3955 : 90 01 __ BCC $3958 ; (bm_trapezoid_fill.s1043 + 0)
.s1042:
3957 : e8 __ __ INX
.s1043:
3958 : 86 51 __ STX T5 + 1 
395a : ad d7 4d LDA $4dd7 ; (Screen + 4)
395d : 0a __ __ ASL
395e : 85 4b __ STA T2 + 0 
3960 : a9 00 __ LDA #$00
3962 : 2a __ __ ROL
3963 : 06 4b __ ASL T2 + 0 
3965 : 2a __ __ ROL
3966 : 06 4b __ ASL T2 + 0 
3968 : 2a __ __ ROL
3969 : aa __ __ TAX
396a : 38 __ __ SEC
396b : a5 4b __ LDA T2 + 0 
396d : e9 08 __ SBC #$08
396f : 85 53 __ STA T6 + 0 
3971 : 8a __ __ TXA
3972 : e9 00 __ SBC #$00
3974 : 85 54 __ STA T6 + 1 
3976 : ad fe c7 LDA $c7fe ; (sstack + 8)
3979 : 85 55 __ STA T7 + 0 
397b : ad ff c7 LDA $c7ff ; (sstack + 9)
397e : 85 56 __ STA T7 + 1 
.l13:
3980 : a5 4e __ LDA T4 + 0 
3982 : 29 07 __ AND #$07
3984 : a8 __ __ TAY
3985 : b1 55 __ LDA (T7 + 0),y 
3987 : 85 1e __ STA ACCU + 3 ; (y0 + 1)
3989 : a5 46 __ LDA T0 + 3 
398b : 30 0d __ BMI $399a ; (bm_trapezoid_fill.s21 + 0)
.s1016:
398d : a8 __ __ TAY
398e : a6 45 __ LDX T0 + 2 
3990 : cd 89 4b CMP $4b89 ; (SRect + 1)
3993 : d0 03 __ BNE $3998 ; (bm_trapezoid_fill.s1014 + 0)
.s1013:
3995 : ec 88 4b CPX $4b88 ; (SRect + 0)
.s1014:
3998 : b0 06 __ BCS $39a0 ; (bm_trapezoid_fill.s112 + 0)
.s21:
399a : ac 89 4b LDY $4b89 ; (SRect + 1)
399d : ae 88 4b LDX $4b88 ; (SRect + 0)
.s112:
39a0 : a5 49 __ LDA T1 + 2 
39a2 : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
39a4 : a5 4a __ LDA T1 + 3 
39a6 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
39a8 : 30 11 __ BMI $39bb ; (bm_trapezoid_fill.s26 + 0)
.s1012:
39aa : ad 8d 4b LDA $4b8d ; (SRect + 5)
39ad : c5 4a __ CMP T1 + 3 
39af : d0 05 __ BNE $39b6 ; (bm_trapezoid_fill.s1010 + 0)
.s1009:
39b1 : ad 8c 4b LDA $4b8c ; (SRect + 4)
39b4 : c5 49 __ CMP T1 + 2 
.s1010:
39b6 : b0 03 __ BCS $39bb ; (bm_trapezoid_fill.s26 + 0)
39b8 : 4c 84 3b JMP $3b84 ; (bm_trapezoid_fill.s24 + 0)
.s26:
39bb : 24 4a __ BIT T1 + 3 
39bd : 10 03 __ BPL $39c2 ; (bm_trapezoid_fill.s1005 + 0)
39bf : 4c 24 3b JMP $3b24 ; (bm_trapezoid_fill.s16 + 0)
.s1005:
39c2 : c4 4a __ CPY T1 + 3 
39c4 : d0 02 __ BNE $39c8 ; (bm_trapezoid_fill.s1003 + 0)
.s1002:
39c6 : e4 49 __ CPX T1 + 2 
.s1003:
39c8 : b0 f5 __ BCS $39bf ; (bm_trapezoid_fill.s26 + 4)
.s27:
39ca : 8a __ __ TXA
39cb : 29 f8 __ AND #$f8
39cd : 85 57 __ STA T8 + 0 
39cf : 18 __ __ CLC
39d0 : 65 50 __ ADC T5 + 0 
39d2 : 85 59 __ STA T9 + 0 
39d4 : 98 __ __ TYA
39d5 : 29 7f __ AND #$7f
39d7 : 85 58 __ STA T8 + 1 
39d9 : 65 51 __ ADC T5 + 1 
39db : 85 5a __ STA T9 + 1 
39dd : a5 1b __ LDA ACCU + 0 ; (dx1 + 2)
39df : 29 07 __ AND #$07
39e1 : a8 __ __ TAY
39e2 : 8a __ __ TXA
39e3 : 29 07 __ AND #$07
39e5 : aa __ __ TAX
39e6 : a5 1b __ LDA ACCU + 0 ; (dx1 + 2)
39e8 : 29 f8 __ AND #$f8
39ea : 38 __ __ SEC
39eb : e5 57 __ SBC T8 + 0 
39ed : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
39ef : a5 1c __ LDA ACCU + 1 ; (dx1 + 3)
39f1 : e5 58 __ SBC T8 + 1 
39f3 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
39f5 : 05 1b __ ORA ACCU + 0 ; (dx1 + 2)
39f7 : d0 1d __ BNE $3a16 ; (bm_trapezoid_fill.s31 + 0)
.s30:
39f9 : b9 cb 4d LDA $4dcb,y ; (rmask + 0)
39fc : 3d c3 4d AND $4dc3,x ; (lmask + 0)
39ff : 85 57 __ STA T8 + 0 
3a01 : a0 00 __ LDY #$00
.s32:
3a03 : a9 ff __ LDA #$ff
3a05 : 45 57 __ EOR T8 + 0 
3a07 : 31 59 __ AND (T9 + 0),y 
3a09 : 85 4b __ STA T2 + 0 
3a0b : a5 1e __ LDA ACCU + 3 ; (y0 + 1)
3a0d : 25 57 __ AND T8 + 0 
3a0f : 05 4b __ ORA T2 + 0 
3a11 : 91 59 __ STA (T9 + 0),y 
3a13 : 4c 24 3b JMP $3b24 ; (bm_trapezoid_fill.s16 + 0)
.s31:
3a16 : b9 cb 4d LDA $4dcb,y ; (rmask + 0)
3a19 : 85 57 __ STA T8 + 0 
3a1b : a9 ff __ LDA #$ff
3a1d : 5d c3 4d EOR $4dc3,x ; (lmask + 0)
3a20 : a0 00 __ LDY #$00
3a22 : 31 59 __ AND (T9 + 0),y 
3a24 : 85 4b __ STA T2 + 0 
3a26 : a5 1e __ LDA ACCU + 3 ; (y0 + 1)
3a28 : 3d c3 4d AND $4dc3,x ; (lmask + 0)
3a2b : 05 4b __ ORA T2 + 0 
3a2d : 91 59 __ STA (T9 + 0),y 
3a2f : a0 08 __ LDY #$08
3a31 : a5 1c __ LDA ACCU + 1 ; (dx1 + 3)
3a33 : d0 03 __ BNE $3a38 ; (bm_trapezoid_fill.s33 + 0)
3a35 : 4c d7 3a JMP $3ad7 ; (bm_trapezoid_fill.s34 + 0)
.s33:
3a38 : a5 1e __ LDA ACCU + 3 ; (y0 + 1)
3a3a : 91 59 __ STA (T9 + 0),y 
3a3c : a0 10 __ LDY #$10
3a3e : 91 59 __ STA (T9 + 0),y 
3a40 : a0 18 __ LDY #$18
3a42 : 91 59 __ STA (T9 + 0),y 
3a44 : a0 20 __ LDY #$20
3a46 : 91 59 __ STA (T9 + 0),y 
3a48 : a0 28 __ LDY #$28
3a4a : 91 59 __ STA (T9 + 0),y 
3a4c : a0 30 __ LDY #$30
3a4e : 91 59 __ STA (T9 + 0),y 
3a50 : a0 38 __ LDY #$38
3a52 : 91 59 __ STA (T9 + 0),y 
3a54 : a0 40 __ LDY #$40
3a56 : 91 59 __ STA (T9 + 0),y 
3a58 : a0 48 __ LDY #$48
3a5a : 91 59 __ STA (T9 + 0),y 
3a5c : a0 50 __ LDY #$50
3a5e : 91 59 __ STA (T9 + 0),y 
3a60 : a0 58 __ LDY #$58
3a62 : 91 59 __ STA (T9 + 0),y 
3a64 : a0 60 __ LDY #$60
3a66 : 91 59 __ STA (T9 + 0),y 
3a68 : a0 68 __ LDY #$68
3a6a : 91 59 __ STA (T9 + 0),y 
3a6c : a0 70 __ LDY #$70
3a6e : 91 59 __ STA (T9 + 0),y 
3a70 : a0 78 __ LDY #$78
3a72 : 91 59 __ STA (T9 + 0),y 
3a74 : a0 80 __ LDY #$80
3a76 : 91 59 __ STA (T9 + 0),y 
3a78 : a0 88 __ LDY #$88
3a7a : 91 59 __ STA (T9 + 0),y 
3a7c : a0 90 __ LDY #$90
3a7e : 91 59 __ STA (T9 + 0),y 
3a80 : a0 98 __ LDY #$98
3a82 : 91 59 __ STA (T9 + 0),y 
3a84 : a0 a0 __ LDY #$a0
3a86 : 91 59 __ STA (T9 + 0),y 
3a88 : a0 a8 __ LDY #$a8
3a8a : 91 59 __ STA (T9 + 0),y 
3a8c : a0 b0 __ LDY #$b0
3a8e : 91 59 __ STA (T9 + 0),y 
3a90 : a0 b8 __ LDY #$b8
3a92 : 91 59 __ STA (T9 + 0),y 
3a94 : a0 c0 __ LDY #$c0
3a96 : 91 59 __ STA (T9 + 0),y 
3a98 : a0 c8 __ LDY #$c8
3a9a : 91 59 __ STA (T9 + 0),y 
3a9c : a0 d0 __ LDY #$d0
3a9e : 91 59 __ STA (T9 + 0),y 
3aa0 : a0 d8 __ LDY #$d8
3aa2 : 91 59 __ STA (T9 + 0),y 
3aa4 : a0 e0 __ LDY #$e0
3aa6 : 91 59 __ STA (T9 + 0),y 
3aa8 : a0 e8 __ LDY #$e8
3aaa : 91 59 __ STA (T9 + 0),y 
3aac : a0 f0 __ LDY #$f0
3aae : 91 59 __ STA (T9 + 0),y 
3ab0 : a0 f8 __ LDY #$f8
3ab2 : 91 59 __ STA (T9 + 0),y 
3ab4 : e6 5a __ INC T9 + 1 
3ab6 : 38 __ __ SEC
3ab7 : a5 1b __ LDA ACCU + 0 ; (dx1 + 2)
3ab9 : e9 f8 __ SBC #$f8
3abb : 85 4b __ STA T2 + 0 
3abd : c9 01 __ CMP #$01
3abf : a0 00 __ LDY #$00
3ac1 : b0 03 __ BCS $3ac6 ; (bm_trapezoid_fill.s1036 + 0)
3ac3 : 4c 03 3a JMP $3a03 ; (bm_trapezoid_fill.s32 + 0)
.s1036:
3ac6 : a6 1e __ LDX ACCU + 3 ; (y0 + 1)
3ac8 : 18 __ __ CLC
.l1040:
3ac9 : 8a __ __ TXA
3aca : 91 59 __ STA (T9 + 0),y 
3acc : 98 __ __ TYA
3acd : 69 08 __ ADC #$08
3acf : a8 __ __ TAY
3ad0 : c4 4b __ CPY T2 + 0 
3ad2 : 90 f5 __ BCC $3ac9 ; (bm_trapezoid_fill.l1040 + 0)
3ad4 : 4c 03 3a JMP $3a03 ; (bm_trapezoid_fill.s32 + 0)
.s34:
3ad7 : a5 1b __ LDA ACCU + 0 ; (dx1 + 2)
3ad9 : 85 4b __ STA T2 + 0 
3adb : c9 80 __ CMP #$80
3add : 90 3e __ BCC $3b1d ; (bm_trapezoid_fill.s47 + 0)
.s40:
3adf : a5 1e __ LDA ACCU + 3 ; (y0 + 1)
3ae1 : 91 59 __ STA (T9 + 0),y 
3ae3 : a0 10 __ LDY #$10
3ae5 : 91 59 __ STA (T9 + 0),y 
3ae7 : a0 18 __ LDY #$18
3ae9 : 91 59 __ STA (T9 + 0),y 
3aeb : a0 20 __ LDY #$20
3aed : 91 59 __ STA (T9 + 0),y 
3aef : a0 28 __ LDY #$28
3af1 : 91 59 __ STA (T9 + 0),y 
3af3 : a0 30 __ LDY #$30
3af5 : 91 59 __ STA (T9 + 0),y 
3af7 : a0 38 __ LDY #$38
3af9 : 91 59 __ STA (T9 + 0),y 
3afb : a0 40 __ LDY #$40
3afd : 91 59 __ STA (T9 + 0),y 
3aff : a0 48 __ LDY #$48
3b01 : 91 59 __ STA (T9 + 0),y 
3b03 : a0 50 __ LDY #$50
3b05 : 91 59 __ STA (T9 + 0),y 
3b07 : a0 58 __ LDY #$58
3b09 : 91 59 __ STA (T9 + 0),y 
3b0b : a0 60 __ LDY #$60
3b0d : 91 59 __ STA (T9 + 0),y 
3b0f : a0 68 __ LDY #$68
3b11 : 91 59 __ STA (T9 + 0),y 
3b13 : a0 70 __ LDY #$70
3b15 : 91 59 __ STA (T9 + 0),y 
3b17 : a0 78 __ LDY #$78
3b19 : 91 59 __ STA (T9 + 0),y 
3b1b : a0 80 __ LDY #$80
.s47:
3b1d : c4 1b __ CPY ACCU + 0 ; (dx1 + 2)
3b1f : 90 a5 __ BCC $3ac6 ; (bm_trapezoid_fill.s1036 + 0)
3b21 : 4c 03 3a JMP $3a03 ; (bm_trapezoid_fill.s32 + 0)
.s16:
3b24 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
3b27 : 18 __ __ CLC
3b28 : 65 47 __ ADC T1 + 0 
3b2a : 85 47 __ STA T1 + 0 
3b2c : ad f7 c7 LDA $c7f7 ; (sstack + 1)
3b2f : 65 48 __ ADC T1 + 1 
3b31 : 85 48 __ STA T1 + 1 
3b33 : ad f8 c7 LDA $c7f8 ; (sstack + 2)
3b36 : 65 49 __ ADC T1 + 2 
3b38 : 85 49 __ STA T1 + 2 
3b3a : ad f9 c7 LDA $c7f9 ; (sstack + 3)
3b3d : 65 4a __ ADC T1 + 3 
3b3f : 85 4a __ STA T1 + 3 
3b41 : 18 __ __ CLC
3b42 : a5 15 __ LDA P8 ; (dx0 + 0)
3b44 : 65 43 __ ADC T0 + 0 
3b46 : 85 43 __ STA T0 + 0 
3b48 : a5 16 __ LDA P9 ; (dx0 + 1)
3b4a : 65 44 __ ADC T0 + 1 
3b4c : 85 44 __ STA T0 + 1 
3b4e : a5 17 __ LDA P10 ; (dx0 + 2)
3b50 : 65 45 __ ADC T0 + 2 
3b52 : 85 45 __ STA T0 + 2 
3b54 : a5 18 __ LDA P11 ; (dx0 + 3)
3b56 : 65 46 __ ADC T0 + 3 
3b58 : 85 46 __ STA T0 + 3 
3b5a : e6 50 __ INC T5 + 0 
3b5c : d0 02 __ BNE $3b60 ; (bm_trapezoid_fill.s1045 + 0)
.s1044:
3b5e : e6 51 __ INC T5 + 1 
.s1045:
3b60 : a5 50 __ LDA T5 + 0 
3b62 : 29 07 __ AND #$07
3b64 : d0 0d __ BNE $3b73 ; (bm_trapezoid_fill.s14 + 0)
.s50:
3b66 : 18 __ __ CLC
3b67 : a5 50 __ LDA T5 + 0 
3b69 : 65 53 __ ADC T6 + 0 
3b6b : 85 50 __ STA T5 + 0 
3b6d : a5 51 __ LDA T5 + 1 
3b6f : 65 54 __ ADC T6 + 1 
3b71 : 85 51 __ STA T5 + 1 
.s14:
3b73 : e6 4e __ INC T4 + 0 
3b75 : e6 1d __ INC ACCU + 2 ; (y0 + 0)
3b77 : a5 1d __ LDA ACCU + 2 ; (y0 + 0)
3b79 : cd fc c7 CMP $c7fc ; (sstack + 6)
3b7c : b0 03 __ BCS $3b81 ; (bm_trapezoid_fill.s14 + 14)
3b7e : 4c 80 39 JMP $3980 ; (bm_trapezoid_fill.l13 + 0)
3b81 : 4c bb 38 JMP $38bb ; (bm_trapezoid_fill.s1001 + 0)
.s24:
3b84 : ad 8c 4b LDA $4b8c ; (SRect + 4)
3b87 : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
3b89 : ad 8d 4b LDA $4b8d ; (SRect + 5)
3b8c : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3b8e : c4 1c __ CPY ACCU + 1 ; (dx1 + 3)
3b90 : f0 03 __ BEQ $3b95 ; (bm_trapezoid_fill.s1006 + 0)
3b92 : 4c c8 39 JMP $39c8 ; (bm_trapezoid_fill.s1003 + 0)
.s1006:
3b95 : e4 1b __ CPX ACCU + 0 ; (dx1 + 2)
3b97 : 4c c8 39 JMP $39c8 ; (bm_trapezoid_fill.s1003 + 0)
.s9:
3b9a : ad 8a 4b LDA $4b8a ; (SRect + 2)
3b9d : 8d fa c7 STA $c7fa ; (sstack + 4)
3ba0 : 38 __ __ SEC
3ba1 : e5 4e __ SBC T4 + 0 
3ba3 : 85 4b __ STA T2 + 0 
3ba5 : 85 03 __ STA WORK + 0 
3ba7 : ad 8b 4b LDA $4b8b ; (SRect + 3)
3baa : 8d fb c7 STA $c7fb ; (sstack + 5)
3bad : e5 4f __ SBC T4 + 1 
3baf : 85 4c __ STA T2 + 1 
3bb1 : 85 04 __ STA WORK + 1 
3bb3 : 29 80 __ AND #$80
3bb5 : 10 02 __ BPL $3bb9 ; (bm_trapezoid_fill.s9 + 31)
3bb7 : a9 ff __ LDA #$ff
3bb9 : 85 4d __ STA T2 + 2 
3bbb : 85 06 __ STA WORK + 3 
3bbd : 85 05 __ STA WORK + 2 
3bbf : ad f6 c7 LDA $c7f6 ; (sstack + 0)
3bc2 : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
3bc4 : ad f7 c7 LDA $c7f7 ; (sstack + 1)
3bc7 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3bc9 : ad f8 c7 LDA $c7f8 ; (sstack + 2)
3bcc : 85 1d __ STA ACCU + 2 ; (y0 + 0)
3bce : ad f9 c7 LDA $c7f9 ; (sstack + 3)
3bd1 : 85 1e __ STA ACCU + 3 ; (y0 + 1)
3bd3 : 20 4d 49 JSR $494d ; (mul32 + 0)
3bd6 : 18 __ __ CLC
3bd7 : a5 07 __ LDA WORK + 4 
3bd9 : 65 11 __ ADC P4 ; (x1 + 0)
3bdb : 85 47 __ STA T1 + 0 
3bdd : a5 08 __ LDA WORK + 5 
3bdf : 65 12 __ ADC P5 ; (x1 + 1)
3be1 : 85 48 __ STA T1 + 1 
3be3 : a5 09 __ LDA WORK + 6 
3be5 : 65 13 __ ADC P6 ; (x1 + 2)
3be7 : 85 49 __ STA T1 + 2 
3be9 : a5 0a __ LDA WORK + 7 
3beb : 65 14 __ ADC P7 ; (x1 + 3)
3bed : 85 4a __ STA T1 + 3 
3bef : a5 15 __ LDA P8 ; (dx0 + 0)
3bf1 : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
3bf3 : a5 16 __ LDA P9 ; (dx0 + 1)
3bf5 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3bf7 : a5 17 __ LDA P10 ; (dx0 + 2)
3bf9 : 85 1d __ STA ACCU + 2 ; (y0 + 0)
3bfb : a5 18 __ LDA P11 ; (dx0 + 3)
3bfd : 85 1e __ STA ACCU + 3 ; (y0 + 1)
3bff : a5 4b __ LDA T2 + 0 
3c01 : 85 03 __ STA WORK + 0 
3c03 : a5 4c __ LDA T2 + 1 
3c05 : 85 04 __ STA WORK + 1 
3c07 : a5 4d __ LDA T2 + 2 
3c09 : 85 05 __ STA WORK + 2 
3c0b : 85 06 __ STA WORK + 3 
3c0d : 20 4d 49 JSR $494d ; (mul32 + 0)
3c10 : 18 __ __ CLC
3c11 : a5 07 __ LDA WORK + 4 
3c13 : 65 0d __ ADC P0 ; (x0 + 0)
3c15 : 85 43 __ STA T0 + 0 
3c17 : a5 08 __ LDA WORK + 5 
3c19 : 65 0e __ ADC P1 ; (x0 + 1)
3c1b : 85 44 __ STA T0 + 1 
3c1d : a5 09 __ LDA WORK + 6 
3c1f : 65 0f __ ADC P2 ; (x0 + 2)
3c21 : 85 45 __ STA T0 + 2 
3c23 : a5 0a __ LDA WORK + 7 
3c25 : 65 10 __ ADC P3 ; (x0 + 3)
3c27 : 85 46 __ STA T0 + 3 
3c29 : 4c 23 39 JMP $3923 ; (bm_trapezoid_fill.s11 + 0)
--------------------------------------------------------------------
bm_line: ; bm_line(,,,,,,,enum LineOp)->void
.s1000:
3c2c : a5 53 __ LDA T11 + 0 
3c2e : 8d ed c7 STA $c7ed ; (bm_trapezoid_fill@stack + 8)
3c31 : a5 54 __ LDA T12 + 0 
3c33 : 8d ee c7 STA $c7ee ; (bm_trapezoid_fill@stack + 9)
.s0:
3c36 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
3c39 : 85 47 __ STA T2 + 0 
3c3b : 38 __ __ SEC
3c3c : e5 15 __ SBC P8 ; (y0 + 0)
3c3e : 85 4b __ STA T4 + 0 
3c40 : ad f7 c7 LDA $c7f7 ; (sstack + 1)
3c43 : 85 48 __ STA T2 + 1 
3c45 : e5 16 __ SBC P9 ; (y0 + 1)
3c47 : 85 4c __ STA T4 + 1 
3c49 : 38 __ __ SEC
3c4a : a5 17 __ LDA P10 ; (x1 + 0)
3c4c : e5 13 __ SBC P6 ; (x0 + 0)
3c4e : 85 50 __ STA T7 + 0 
3c50 : a5 18 __ LDA P11 ; (x1 + 1)
3c52 : e5 14 __ SBC P7 ; (x0 + 1)
3c54 : 85 51 __ STA T7 + 1 
3c56 : 30 07 __ BMI $3c5f ; (bm_line.s2 + 0)
.s1092:
3c58 : 05 50 __ ORA T7 + 0 
3c5a : f0 03 __ BEQ $3c5f ; (bm_line.s2 + 0)
3c5c : 4c 95 43 JMP $4395 ; (bm_line.s1 + 0)
.s2:
3c5f : a5 14 __ LDA P7 ; (x0 + 1)
3c61 : 10 03 __ BPL $3c66 ; (bm_line.s1071 + 0)
3c63 : 4c 50 3d JMP $3d50 ; (bm_line.s1001 + 0)
.s1071:
3c66 : cd 89 4b CMP $4b89 ; (SRect + 1)
3c69 : d0 05 __ BNE $3c70 ; (bm_line.s1069 + 0)
.s1068:
3c6b : a5 13 __ LDA P6 ; (x0 + 0)
3c6d : cd 88 4b CMP $4b88 ; (SRect + 0)
.s1069:
3c70 : 90 f1 __ BCC $3c63 ; (bm_line.s2 + 4)
.s26:
3c72 : a5 18 __ LDA P11 ; (x1 + 1)
3c74 : 30 1a __ BMI $3c90 ; (bm_line.s28 + 0)
.s1067:
3c76 : cd 8d 4b CMP $4b8d ; (SRect + 5)
3c79 : d0 05 __ BNE $3c80 ; (bm_line.s1065 + 0)
.s1064:
3c7b : a5 17 __ LDA P10 ; (x1 + 0)
3c7d : cd 8c 4b CMP $4b8c ; (SRect + 4)
.s1065:
3c80 : b0 e1 __ BCS $3c63 ; (bm_line.s2 + 4)
.s25:
3c82 : a5 18 __ LDA P11 ; (x1 + 1)
3c84 : cd 89 4b CMP $4b89 ; (SRect + 1)
3c87 : d0 05 __ BNE $3c8e ; (bm_line.s1061 + 0)
.s1060:
3c89 : a5 17 __ LDA P10 ; (x1 + 0)
3c8b : cd 88 4b CMP $4b88 ; (SRect + 0)
.s1061:
3c8e : b0 40 __ BCS $3cd0 ; (bm_line.s1059 + 0)
.s28:
3c90 : a5 4b __ LDA T4 + 0 
3c92 : 85 0f __ STA P2 
3c94 : a5 4c __ LDA T4 + 1 
3c96 : 85 10 __ STA P3 
3c98 : a5 50 __ LDA T7 + 0 
3c9a : 85 11 __ STA P4 
3c9c : a5 51 __ LDA T7 + 1 
3c9e : 85 12 __ STA P5 
3ca0 : ad 88 4b LDA $4b88 ; (SRect + 0)
3ca3 : 38 __ __ SEC
3ca4 : e5 17 __ SBC P10 ; (x1 + 0)
3ca6 : 85 0d __ STA P0 
3ca8 : ad 89 4b LDA $4b89 ; (SRect + 1)
3cab : e5 18 __ SBC P11 ; (x1 + 1)
3cad : 85 0e __ STA P1 
3caf : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
3cb2 : 18 __ __ CLC
3cb3 : a5 1b __ LDA ACCU + 0 ; (pattern + 0)
3cb5 : 65 47 __ ADC T2 + 0 
3cb7 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
3cba : a5 1c __ LDA ACCU + 1 
3cbc : 65 48 __ ADC T2 + 1 
3cbe : 8d f7 c7 STA $c7f7 ; (sstack + 1)
3cc1 : ad 88 4b LDA $4b88 ; (SRect + 0)
3cc4 : 85 17 __ STA P10 ; (x1 + 0)
3cc6 : ad 89 4b LDA $4b89 ; (SRect + 1)
3cc9 : 85 18 __ STA P11 ; (x1 + 1)
3ccb : 2c 8d 4b BIT $4b8d ; (SRect + 5)
3cce : 30 0e __ BMI $3cde ; (bm_line.s31 + 0)
.s1059:
3cd0 : a5 14 __ LDA P7 ; (x0 + 1)
3cd2 : cd 8d 4b CMP $4b8d ; (SRect + 5)
3cd5 : d0 05 __ BNE $3cdc ; (bm_line.s1057 + 0)
.s1100:
3cd7 : a5 13 __ LDA P6 ; (x0 + 0)
3cd9 : cd 8c 4b CMP $4b8c ; (SRect + 4)
.s1057:
3cdc : 90 45 __ BCC $3d23 ; (bm_line.s3 + 0)
.s31:
3cde : a5 4b __ LDA T4 + 0 
3ce0 : 85 0f __ STA P2 
3ce2 : a5 4c __ LDA T4 + 1 
3ce4 : 85 10 __ STA P3 
3ce6 : a5 50 __ LDA T7 + 0 
3ce8 : 85 11 __ STA P4 
3cea : a5 51 __ LDA T7 + 1 
3cec : 85 12 __ STA P5 
3cee : 18 __ __ CLC
3cef : a5 13 __ LDA P6 ; (x0 + 0)
3cf1 : 69 01 __ ADC #$01
3cf3 : a4 14 __ LDY P7 ; (x0 + 1)
3cf5 : 90 01 __ BCC $3cf8 ; (bm_line.s1122 + 0)
.s1121:
3cf7 : c8 __ __ INY
.s1122:
3cf8 : 38 __ __ SEC
3cf9 : ed 8c 4b SBC $4b8c ; (SRect + 4)
3cfc : 85 0d __ STA P0 
3cfe : 98 __ __ TYA
3cff : ed 8d 4b SBC $4b8d ; (SRect + 5)
3d02 : 85 0e __ STA P1 
3d04 : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
3d07 : 38 __ __ SEC
3d08 : a5 15 __ LDA P8 ; (y0 + 0)
3d0a : e5 1b __ SBC ACCU + 0 ; (pattern + 0)
3d0c : 85 15 __ STA P8 ; (y0 + 0)
3d0e : a5 16 __ LDA P9 ; (y0 + 1)
3d10 : e5 1c __ SBC ACCU + 1 
3d12 : 85 16 __ STA P9 ; (y0 + 1)
3d14 : ad 8c 4b LDA $4b8c ; (SRect + 4)
3d17 : 38 __ __ SEC
3d18 : e9 01 __ SBC #$01
3d1a : 85 13 __ STA P6 ; (x0 + 0)
3d1c : ad 8d 4b LDA $4b8d ; (SRect + 5)
3d1f : e9 00 __ SBC #$00
3d21 : 85 14 __ STA P7 ; (x0 + 1)
.s3:
3d23 : a5 4c __ LDA T4 + 1 
3d25 : 30 07 __ BMI $3d2e ; (bm_line.s35 + 0)
.s1051:
3d27 : 05 4b __ ORA T4 + 0 
3d29 : f0 03 __ BEQ $3d2e ; (bm_line.s35 + 0)
3d2b : 4c c3 42 JMP $42c3 ; (bm_line.s34 + 0)
.s35:
3d2e : a5 16 __ LDA P9 ; (y0 + 1)
3d30 : 30 1e __ BMI $3d50 ; (bm_line.s1001 + 0)
.s1030:
3d32 : cd 8b 4b CMP $4b8b ; (SRect + 3)
3d35 : d0 05 __ BNE $3d3c ; (bm_line.s1028 + 0)
.s1027:
3d37 : a5 15 __ LDA P8 ; (y0 + 0)
3d39 : cd 8a 4b CMP $4b8a ; (SRect + 2)
.s1028:
3d3c : 90 12 __ BCC $3d50 ; (bm_line.s1001 + 0)
.s59:
3d3e : ad f7 c7 LDA $c7f7 ; (sstack + 1)
3d41 : 30 2a __ BMI $3d6d ; (bm_line.s61 + 0)
.s1026:
3d43 : cd 8f 4b CMP $4b8f ; (SRect + 7)
3d46 : d0 06 __ BNE $3d4e ; (bm_line.s1024 + 0)
.s1023:
3d48 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
3d4b : cd 8e 4b CMP $4b8e ; (SRect + 6)
.s1024:
3d4e : 90 0b __ BCC $3d5b ; (bm_line.s58 + 0)
.s1001:
3d50 : ad ed c7 LDA $c7ed ; (bm_trapezoid_fill@stack + 8)
3d53 : 85 53 __ STA T11 + 0 
3d55 : ad ee c7 LDA $c7ee ; (bm_trapezoid_fill@stack + 9)
3d58 : 85 54 __ STA T12 + 0 
3d5a : 60 __ __ RTS
.s58:
3d5b : ad f7 c7 LDA $c7f7 ; (sstack + 1)
3d5e : 30 0d __ BMI $3d6d ; (bm_line.s61 + 0)
.s1022:
3d60 : cd 8b 4b CMP $4b8b ; (SRect + 3)
3d63 : d0 06 __ BNE $3d6b ; (bm_line.s1020 + 0)
.s1019:
3d65 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
3d68 : cd 8a 4b CMP $4b8a ; (SRect + 2)
.s1020:
3d6b : b0 42 __ BCS $3daf ; (bm_line.s1018 + 0)
.s61:
3d6d : a5 50 __ LDA T7 + 0 
3d6f : 85 0f __ STA P2 
3d71 : a5 51 __ LDA T7 + 1 
3d73 : 85 10 __ STA P3 
3d75 : a5 4b __ LDA T4 + 0 
3d77 : 85 11 __ STA P4 
3d79 : a5 4c __ LDA T4 + 1 
3d7b : 85 12 __ STA P5 
3d7d : ad 8a 4b LDA $4b8a ; (SRect + 2)
3d80 : 38 __ __ SEC
3d81 : ed f6 c7 SBC $c7f6 ; (sstack + 0)
3d84 : 85 0d __ STA P0 
3d86 : ad 8b 4b LDA $4b8b ; (SRect + 3)
3d89 : ed f7 c7 SBC $c7f7 ; (sstack + 1)
3d8c : 85 0e __ STA P1 
3d8e : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
3d91 : 18 __ __ CLC
3d92 : a5 17 __ LDA P10 ; (x1 + 0)
3d94 : 65 1b __ ADC ACCU + 0 ; (pattern + 0)
3d96 : 85 17 __ STA P10 ; (x1 + 0)
3d98 : a5 18 __ LDA P11 ; (x1 + 1)
3d9a : 65 1c __ ADC ACCU + 1 
3d9c : 85 18 __ STA P11 ; (x1 + 1)
3d9e : ad 8a 4b LDA $4b8a ; (SRect + 2)
3da1 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
3da4 : ad 8b 4b LDA $4b8b ; (SRect + 3)
3da7 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
3daa : 2c 8f 4b BIT $4b8f ; (SRect + 7)
3dad : 30 0e __ BMI $3dbd ; (bm_line.s64 + 0)
.s1018:
3daf : a5 16 __ LDA P9 ; (y0 + 1)
3db1 : cd 8f 4b CMP $4b8f ; (SRect + 7)
3db4 : d0 05 __ BNE $3dbb ; (bm_line.s1016 + 0)
.s1098:
3db6 : a5 15 __ LDA P8 ; (y0 + 0)
3db8 : cd 8e 4b CMP $4b8e ; (SRect + 6)
.s1016:
3dbb : 90 45 __ BCC $3e02 ; (bm_line.s36 + 0)
.s64:
3dbd : a5 50 __ LDA T7 + 0 
3dbf : 85 0f __ STA P2 
3dc1 : a5 51 __ LDA T7 + 1 
3dc3 : 85 10 __ STA P3 
3dc5 : a5 4b __ LDA T4 + 0 
3dc7 : 85 11 __ STA P4 
3dc9 : a5 4c __ LDA T4 + 1 
3dcb : 85 12 __ STA P5 
3dcd : 18 __ __ CLC
3dce : a5 15 __ LDA P8 ; (y0 + 0)
3dd0 : 69 01 __ ADC #$01
3dd2 : a4 16 __ LDY P9 ; (y0 + 1)
3dd4 : 90 01 __ BCC $3dd7 ; (bm_line.s1120 + 0)
.s1119:
3dd6 : c8 __ __ INY
.s1120:
3dd7 : 38 __ __ SEC
3dd8 : ed 8e 4b SBC $4b8e ; (SRect + 6)
3ddb : 85 0d __ STA P0 
3ddd : 98 __ __ TYA
3dde : ed 8f 4b SBC $4b8f ; (SRect + 7)
3de1 : 85 0e __ STA P1 
3de3 : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
3de6 : 38 __ __ SEC
3de7 : a5 13 __ LDA P6 ; (x0 + 0)
3de9 : e5 1b __ SBC ACCU + 0 ; (pattern + 0)
3deb : 85 13 __ STA P6 ; (x0 + 0)
3ded : a5 14 __ LDA P7 ; (x0 + 1)
3def : e5 1c __ SBC ACCU + 1 
3df1 : 85 14 __ STA P7 ; (x0 + 1)
3df3 : ad 8e 4b LDA $4b8e ; (SRect + 6)
3df6 : 38 __ __ SEC
3df7 : e9 01 __ SBC #$01
3df9 : 85 15 __ STA P8 ; (y0 + 0)
3dfb : ad 8f 4b LDA $4b8f ; (SRect + 7)
3dfe : e9 00 __ SBC #$00
3e00 : 85 16 __ STA P9 ; (y0 + 1)
.s36:
3e02 : ad f8 c7 LDA $c7f8 ; (sstack + 2)
3e05 : d0 08 __ BNE $3e0f ; (bm_line.s69 + 0)
.s68:
3e07 : a9 ff __ LDA #$ff
3e09 : 85 43 __ STA T10 + 0 
3e0b : a9 02 __ LDA #$02
3e0d : d0 0c __ BNE $3e1b ; (bm_line.s70 + 0)
.s69:
3e0f : 85 43 __ STA T10 + 0 
3e11 : c9 ff __ CMP #$ff
3e13 : d0 04 __ BNE $3e19 ; (bm_line.s323 + 0)
.s78:
3e15 : a9 01 __ LDA #$01
3e17 : d0 02 __ BNE $3e1b ; (bm_line.s70 + 0)
.s323:
3e19 : a9 00 __ LDA #$00
.s70:
3e1b : 85 52 __ STA T9 + 0 
3e1d : 38 __ __ SEC
3e1e : a5 17 __ LDA P10 ; (x1 + 0)
3e20 : e5 13 __ SBC P6 ; (x0 + 0)
3e22 : 85 47 __ STA T2 + 0 
3e24 : a5 18 __ LDA P11 ; (x1 + 1)
3e26 : e5 14 __ SBC P7 ; (x0 + 1)
3e28 : 85 48 __ STA T2 + 1 
3e2a : 10 11 __ BPL $3e3d ; (bm_line.s81 + 0)
.s79:
3e2c : 38 __ __ SEC
3e2d : a9 00 __ LDA #$00
3e2f : e5 47 __ SBC T2 + 0 
3e31 : 85 47 __ STA T2 + 0 
3e33 : a9 00 __ LDA #$00
3e35 : e5 48 __ SBC T2 + 1 
3e37 : 85 48 __ STA T2 + 1 
3e39 : a9 01 __ LDA #$01
3e3b : d0 02 __ BNE $3e3f ; (bm_line.s333 + 0)
.s81:
3e3d : a9 00 __ LDA #$00
.s333:
3e3f : 85 53 __ STA T11 + 0 
3e41 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
3e44 : 38 __ __ SEC
3e45 : e5 15 __ SBC P8 ; (y0 + 0)
3e47 : 85 49 __ STA T3 + 0 
3e49 : ad f7 c7 LDA $c7f7 ; (sstack + 1)
3e4c : e5 16 __ SBC P9 ; (y0 + 1)
3e4e : 85 4a __ STA T3 + 1 
3e50 : 10 11 __ BPL $3e63 ; (bm_line.s84 + 0)
.s82:
3e52 : 38 __ __ SEC
3e53 : a9 00 __ LDA #$00
3e55 : e5 49 __ SBC T3 + 0 
3e57 : 85 49 __ STA T3 + 0 
3e59 : a9 00 __ LDA #$00
3e5b : e5 4a __ SBC T3 + 1 
3e5d : 85 4a __ STA T3 + 1 
3e5f : a9 01 __ LDA #$01
3e61 : d0 02 __ BNE $3e65 ; (bm_line.s371 + 0)
.s84:
3e63 : a9 00 __ LDA #$00
.s371:
3e65 : 85 54 __ STA T12 + 0 
3e67 : a5 4a __ LDA T3 + 1 
3e69 : c5 48 __ CMP T2 + 1 
3e6b : d0 04 __ BNE $3e71 ; (bm_line.s1009 + 0)
.s1008:
3e6d : a5 49 __ LDA T3 + 0 
3e6f : c5 47 __ CMP T2 + 0 
.s1009:
3e71 : b0 06 __ BCS $3e79 ; (bm_line.s86 + 0)
.s85:
3e73 : a5 48 __ LDA T2 + 1 
3e75 : a4 47 __ LDY T2 + 0 
3e77 : 90 04 __ BCC $3e7d ; (bm_line.s87 + 0)
.s86:
3e79 : a5 4a __ LDA T3 + 1 
3e7b : a4 49 __ LDY T3 + 0 
.s87:
3e7d : c8 __ __ INY
3e7e : 8c 03 50 STY $5003 ; (BLIT_CODE + 3)
3e81 : 85 4c __ STA T4 + 1 
3e83 : a5 15 __ LDA P8 ; (y0 + 0)
3e85 : 29 07 __ AND #$07
3e87 : 8d 01 50 STA $5001 ; (BLIT_CODE + 1)
3e8a : a9 a2 __ LDA #$a2
3e8c : 8d 02 50 STA $5002 ; (BLIT_CODE + 2)
3e8f : 38 __ __ SEC
3e90 : a5 49 __ LDA T3 + 0 
3e92 : e5 47 __ SBC T2 + 0 
3e94 : 85 4d __ STA T5 + 0 
3e96 : a5 4a __ LDA T3 + 1 
3e98 : e5 48 __ SBC T2 + 1 
3e9a : 85 4e __ STA T5 + 1 
3e9c : a5 4d __ LDA T5 + 0 
3e9e : 4a __ __ LSR
3e9f : b0 0c __ BCS $3ead ; (bm_line.s88 + 0)
.s89:
3ea1 : a5 4e __ LDA T5 + 1 
3ea3 : c9 80 __ CMP #$80
3ea5 : 6a __ __ ROR
3ea6 : 85 4e __ STA T5 + 1 
3ea8 : 66 4d __ ROR T5 + 0 
3eaa : 4c b5 3e JMP $3eb5 ; (bm_line.s90 + 0)
.s88:
3ead : 06 49 __ ASL T3 + 0 
3eaf : 26 4a __ ROL T3 + 1 
3eb1 : 06 47 __ ASL T2 + 0 
3eb3 : 26 48 __ ROL T2 + 1 
.s90:
3eb5 : ad d7 4d LDA $4dd7 ; (Screen + 4)
3eb8 : 0a __ __ ASL
3eb9 : 85 50 __ STA T7 + 0 
3ebb : a9 a0 __ LDA #$a0
3ebd : 8d 00 50 STA $5000 ; (BLIT_CODE + 0)
3ec0 : a9 a5 __ LDA #$a5
3ec2 : 8d 04 50 STA $5004 ; (BLIT_CODE + 4)
3ec5 : a9 0a __ LDA #$0a
3ec7 : 8d 05 50 STA $5005 ; (BLIT_CODE + 5)
3eca : a9 00 __ LDA #$00
3ecc : 2a __ __ ROL
3ecd : 06 50 __ ASL T7 + 0 
3ecf : 2a __ __ ROL
3ed0 : 06 50 __ ASL T7 + 0 
3ed2 : 2a __ __ ROL
3ed3 : 85 51 __ STA T7 + 1 
3ed5 : a5 54 __ LDA T12 + 0 
3ed7 : f0 0d __ BEQ $3ee6 ; (bm_line.s307 + 0)
.s305:
3ed9 : 38 __ __ SEC
3eda : a9 00 __ LDA #$00
3edc : e5 50 __ SBC T7 + 0 
3ede : 85 50 __ STA T7 + 0 
3ee0 : a9 00 __ LDA #$00
3ee2 : e5 51 __ SBC T7 + 1 
3ee4 : 85 51 __ STA T7 + 1 
.s307:
3ee6 : a5 15 __ LDA P8 ; (y0 + 0)
3ee8 : 29 f8 __ AND #$f8
3eea : 85 1b __ STA ACCU + 0 ; (pattern + 0)
3eec : a5 16 __ LDA P9 ; (y0 + 1)
3eee : 85 1c __ STA ACCU + 1 
3ef0 : ad d7 4d LDA $4dd7 ; (Screen + 4)
3ef3 : 20 25 45 JSR $4525 ; (mul16by8 + 0)
3ef6 : ad d3 4d LDA $4dd3 ; (Screen + 0)
3ef9 : 18 __ __ CLC
3efa : 65 1b __ ADC ACCU + 0 ; (pattern + 0)
3efc : 85 45 __ STA T1 + 0 
3efe : ad d4 4d LDA $4dd4 ; (Screen + 1)
3f01 : 65 1c __ ADC ACCU + 1 
3f03 : aa __ __ TAX
3f04 : a5 13 __ LDA P6 ; (x0 + 0)
3f06 : 29 f8 __ AND #$f8
3f08 : 18 __ __ CLC
3f09 : 65 45 __ ADC T1 + 0 
3f0b : 85 45 __ STA T1 + 0 
3f0d : 8a __ __ TXA
3f0e : 65 14 __ ADC P7 ; (x0 + 1)
3f10 : 85 46 __ STA T1 + 1 
3f12 : a5 47 __ LDA T2 + 0 
3f14 : 05 49 __ ORA T3 + 0 
3f16 : 29 80 __ AND #$80
3f18 : 85 4f __ STA T6 + 0 
3f1a : a5 48 __ LDA T2 + 1 
3f1c : 05 4a __ ORA T3 + 1 
3f1e : 05 4f __ ORA T6 + 0 
3f20 : f0 02 __ BEQ $3f24 ; (bm_line.s1109 + 0)
.s1108:
3f22 : a9 01 __ LDA #$01
.s1109:
3f24 : 85 1b __ STA ACCU + 0 ; (pattern + 0)
3f26 : a5 13 __ LDA P6 ; (x0 + 0)
3f28 : 29 07 __ AND #$07
3f2a : aa __ __ TAX
3f2b : bd 68 4e LDA $4e68,x ; (bitshift + 32)
3f2e : 85 44 __ STA T0 + 0 
3f30 : a2 06 __ LDX #$06
3f32 : 86 4f __ STX T6 + 0 
3f34 : a5 52 __ LDA T9 + 0 
3f36 : c9 02 __ CMP #$02
3f38 : d0 03 __ BNE $3f3d ; (bm_line.s161 + 0)
3f3a : 4c 7b 42 JMP $427b ; (bm_line.s144 + 0)
.s161:
3f3d : 90 03 __ BCC $3f42 ; (bm_line.s163 + 0)
3f3f : 4c cc 3f JMP $3fcc ; (bm_line.s162 + 0)
.s163:
3f42 : a8 __ __ TAY
3f43 : d0 4a __ BNE $3f8f ; (bm_line.s116 + 0)
.s99:
3f45 : 8e 06 50 STX $5006 ; (BLIT_CODE + 6)
3f48 : 8e 09 50 STX $5009 ; (BLIT_CODE + 9)
3f4b : a9 07 __ LDA #$07
3f4d : 8d 07 50 STA $5007 ; (BLIT_CODE + 7)
3f50 : 8d 0b 50 STA $500b ; (BLIT_CODE + 11)
3f53 : a9 03 __ LDA #$03
3f55 : 8d 0d 50 STA $500d ; (BLIT_CODE + 13)
3f58 : 8d 13 50 STA $5013 ; (BLIT_CODE + 19)
3f5b : 8d 15 50 STA $5015 ; (BLIT_CODE + 21)
3f5e : a9 90 __ LDA #$90
3f60 : 8d 08 50 STA $5008 ; (BLIT_CODE + 8)
3f63 : a9 e6 __ LDA #$e6
3f65 : 8d 0a 50 STA $500a ; (BLIT_CODE + 10)
3f68 : a9 11 __ LDA #$11
3f6a : 8d 0c 50 STA $500c ; (BLIT_CODE + 12)
3f6d : a9 d0 __ LDA #$d0
3f6f : 8d 0e 50 STA $500e ; (BLIT_CODE + 14)
3f72 : a9 04 __ LDA #$04
3f74 : 8d 0f 50 STA $500f ; (BLIT_CODE + 15)
3f77 : a9 49 __ LDA #$49
3f79 : 8d 10 50 STA $5010 ; (BLIT_CODE + 16)
3f7c : a9 ff __ LDA #$ff
3f7e : 8d 11 50 STA $5011 ; (BLIT_CODE + 17)
3f81 : a9 31 __ LDA #$31
3f83 : 8d 12 50 STA $5012 ; (BLIT_CODE + 18)
3f86 : a9 91 __ LDA #$91
3f88 : 8d 14 50 STA $5014 ; (BLIT_CODE + 20)
3f8b : a9 16 __ LDA #$16
3f8d : 90 3b __ BCC $3fca ; (bm_line.s1101 + 0)
.s116:
3f8f : a6 43 __ LDX T10 + 0 
3f91 : e8 __ __ INX
3f92 : f0 1e __ BEQ $3fb2 ; (bm_line.s119 + 0)
.s117:
3f94 : a9 06 __ LDA #$06
3f96 : 8d 06 50 STA $5006 ; (BLIT_CODE + 6)
3f99 : 8d 09 50 STA $5009 ; (BLIT_CODE + 9)
3f9c : a9 07 __ LDA #$07
3f9e : 8d 07 50 STA $5007 ; (BLIT_CODE + 7)
3fa1 : 8d 0b 50 STA $500b ; (BLIT_CODE + 11)
3fa4 : a9 90 __ LDA #$90
3fa6 : 8d 08 50 STA $5008 ; (BLIT_CODE + 8)
3fa9 : a9 e6 __ LDA #$e6
3fab : 8d 0a 50 STA $500a ; (BLIT_CODE + 10)
3fae : a9 0c __ LDA #$0c
3fb0 : 85 4f __ STA T6 + 0 
.s119:
3fb2 : a9 11 __ LDA #$11
3fb4 : a6 4f __ LDX T6 + 0 
3fb6 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
3fb9 : a9 03 __ LDA #$03
3fbb : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
3fbe : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
3fc1 : a9 91 __ LDA #$91
3fc3 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
3fc6 : 8a __ __ TXA
3fc7 : 18 __ __ CLC
3fc8 : 69 04 __ ADC #$04
.s1101:
3fca : 85 4f __ STA T6 + 0 
.s162:
3fcc : a5 49 __ LDA T3 + 0 
3fce : 05 4a __ ORA T3 + 1 
3fd0 : f0 03 __ BEQ $3fd5 ; (bm_line.s168 + 0)
3fd2 : 4c af 40 JMP $40af ; (bm_line.s166 + 0)
.s168:
3fd5 : a5 47 __ LDA T2 + 0 
3fd7 : 05 48 __ ORA T2 + 1 
3fd9 : f0 7a __ BEQ $4055 ; (bm_line.s268 + 0)
.s266:
3fdb : a9 0a __ LDA #$0a
3fdd : a4 4f __ LDY T6 + 0 
3fdf : 99 01 50 STA $5001,y ; (BLIT_CODE + 1)
3fe2 : 99 05 50 STA $5005,y ; (BLIT_CODE + 5)
3fe5 : a9 90 __ LDA #$90
3fe7 : 99 02 50 STA $5002,y ; (BLIT_CODE + 2)
3fea : a9 0c __ LDA #$0c
3fec : 99 03 50 STA $5003,y ; (BLIT_CODE + 3)
3fef : a9 a5 __ LDA #$a5
3ff1 : 99 06 50 STA $5006,y ; (BLIT_CODE + 6)
3ff4 : a9 03 __ LDA #$03
3ff6 : 99 07 50 STA $5007,y ; (BLIT_CODE + 7)
3ff9 : a9 69 __ LDA #$69
3ffb : 99 08 50 STA $5008,y ; (BLIT_CODE + 8)
3ffe : a5 53 __ LDA T11 + 0 
4000 : f0 09 __ BEQ $400b ; (bm_line.s315 + 0)
.s314:
4002 : a9 06 __ LDA #$06
4004 : 99 00 50 STA $5000,y ; (BLIT_CODE + 0)
4007 : a0 22 __ LDY #$22
4009 : d0 07 __ BNE $4012 ; (bm_line.s319 + 0)
.s315:
400b : a9 46 __ LDA #$46
400d : 99 00 50 STA $5000,y ; (BLIT_CODE + 0)
4010 : a0 62 __ LDY #$62
.s319:
4012 : a9 02 __ LDA #$02
4014 : a6 4f __ LDX T6 + 0 
4016 : 9d 0b 50 STA $500b,x ; (BLIT_CODE + 11)
4019 : 98 __ __ TYA
401a : 09 04 __ ORA #$04
401c : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
401f : a5 53 __ LDA T11 + 0 
4021 : f0 0e __ BEQ $4031 ; (bm_line.s278 + 0)
.s277:
4023 : a9 f8 __ LDA #$f8
4025 : 9d 09 50 STA $5009,x ; (BLIT_CODE + 9)
4028 : a9 b0 __ LDA #$b0
402a : 9d 0a 50 STA $500a,x ; (BLIT_CODE + 10)
402d : a9 c6 __ LDA #$c6
402f : d0 0c __ BNE $403d ; (bm_line.s279 + 0)
.s278:
4031 : a9 08 __ LDA #$08
4033 : 9d 09 50 STA $5009,x ; (BLIT_CODE + 9)
4036 : a9 90 __ LDA #$90
4038 : 9d 0a 50 STA $500a,x ; (BLIT_CODE + 10)
403b : a9 e6 __ LDA #$e6
.s279:
403d : 9d 0c 50 STA $500c,x ; (BLIT_CODE + 12)
4040 : a9 04 __ LDA #$04
4042 : 9d 0d 50 STA $500d,x ; (BLIT_CODE + 13)
4045 : a9 85 __ LDA #$85
4047 : 9d 0e 50 STA $500e,x ; (BLIT_CODE + 14)
404a : a9 03 __ LDA #$03
404c : 9d 0f 50 STA $500f,x ; (BLIT_CODE + 15)
404f : 8a __ __ TXA
4050 : 18 __ __ CLC
4051 : 69 10 __ ADC #$10
4053 : 85 4f __ STA T6 + 0 
.s268:
4055 : a9 ca __ LDA #$ca
4057 : a6 4f __ LDX T6 + 0 
4059 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
405c : a9 d0 __ LDA #$d0
405e : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
4061 : a9 c6 __ LDA #$c6
4063 : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
4066 : a9 0b __ LDA #$0b
4068 : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
406b : a9 10 __ LDA #$10
406d : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
4070 : a9 60 __ LDA #$60
4072 : 9d 07 50 STA $5007,x ; (BLIT_CODE + 7)
4075 : 8a __ __ TXA
4076 : 18 __ __ CLC
4077 : 69 01 __ ADC #$01
4079 : 49 ff __ EOR #$ff
407b : 18 __ __ CLC
407c : 69 03 __ ADC #$03
407e : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
4081 : 8a __ __ TXA
4082 : 18 __ __ CLC
4083 : 69 05 __ ADC #$05
4085 : 49 ff __ EOR #$ff
4087 : 18 __ __ CLC
4088 : 69 03 __ ADC #$03
408a : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
408d : a5 4c __ LDA T4 + 1 
408f : 85 0b __ STA WORK + 8 
4091 : a5 45 __ LDA T1 + 0 
4093 : 85 03 __ STA WORK + 0 
4095 : a5 46 __ LDA T1 + 1 
4097 : 85 04 __ STA WORK + 1 
4099 : a5 4d __ LDA T5 + 0 
409b : 85 05 __ STA WORK + 2 
409d : a5 4e __ LDA T5 + 1 
409f : 85 06 __ STA WORK + 3 
40a1 : a5 44 __ LDA T0 + 0 
40a3 : 85 0a __ STA WORK + 7 
40a5 : a5 43 __ LDA T10 + 0 
40a7 : 85 07 __ STA WORK + 4 
40a9 : 20 00 50 JSR $5000 ; (BLIT_CODE + 0)
40ac : 4c 50 3d JMP $3d50 ; (bm_line.s1001 + 0)
.s166:
40af : a5 47 __ LDA T2 + 0 
40b1 : 05 48 __ ORA T2 + 1 
40b3 : f0 32 __ BEQ $40e7 ; (bm_line.s171 + 0)
.s169:
40b5 : a9 a5 __ LDA #$a5
40b7 : a6 4f __ LDX T6 + 0 
40b9 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
40bc : 18 __ __ CLC
40bd : a5 1b __ LDA ACCU + 0 ; (pattern + 0)
40bf : 69 05 __ ADC #$05
40c1 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
40c4 : a5 1b __ LDA ACCU + 0 ; (pattern + 0)
40c6 : f0 04 __ BEQ $40cc ; (bm_line.s1110 + 0)
.s1111:
40c8 : a0 21 __ LDY #$21
40ca : d0 02 __ BNE $40ce ; (bm_line.s1112 + 0)
.s1110:
40cc : a0 1b __ LDY #$1b
.s1112:
40ce : a9 30 __ LDA #$30
40d0 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
40d3 : a5 54 __ LDA T12 + 0 
40d5 : d0 01 __ BNE $40d8 ; (bm_line.s176 + 0)
.s174:
40d7 : c8 __ __ INY
.s176:
40d8 : 98 __ __ TYA
40d9 : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
40dc : 8a __ __ TXA
40dd : 18 __ __ CLC
40de : 69 04 __ ADC #$04
40e0 : 85 4f __ STA T6 + 0 
40e2 : a9 00 __ LDA #$00
40e4 : c5 1b __ CMP ACCU + 0 ; (pattern + 0)
40e6 : 2a __ __ ROL
.s171:
40e7 : a8 __ __ TAY
40e8 : a6 4f __ LDX T6 + 0 
40ea : a5 54 __ LDA T12 + 0 
40ec : f0 03 __ BEQ $40f1 ; (bm_line.s180 + 0)
40ee : 4c 11 42 JMP $4211 ; (bm_line.s179 + 0)
.s180:
40f1 : a9 c8 __ LDA #$c8
40f3 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
40f6 : a9 c0 __ LDA #$c0
40f8 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
40fb : a9 08 __ LDA #$08
40fd : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
4100 : a9 d0 __ LDA #$d0
4102 : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
4105 : a9 a0 __ LDA #$a0
4107 : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
410a : a9 00 __ LDA #$00
410c : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
410f : a9 a5 __ LDA #$a5
4111 : 9d 07 50 STA $5007,x ; (BLIT_CODE + 7)
4114 : 9d 0d 50 STA $500d,x ; (BLIT_CODE + 13)
4117 : a9 03 __ LDA #$03
4119 : 9d 08 50 STA $5008,x ; (BLIT_CODE + 8)
411c : 9d 0c 50 STA $500c,x ; (BLIT_CODE + 12)
411f : a9 69 __ LDA #$69
4121 : 9d 09 50 STA $5009,x ; (BLIT_CODE + 9)
4124 : 9d 0f 50 STA $500f,x ; (BLIT_CODE + 15)
4127 : a9 85 __ LDA #$85
4129 : 9d 0b 50 STA $500b,x ; (BLIT_CODE + 11)
412c : 9d 11 50 STA $5011,x ; (BLIT_CODE + 17)
412f : a9 04 __ LDA #$04
4131 : 9d 0e 50 STA $500e,x ; (BLIT_CODE + 14)
4134 : 9d 12 50 STA $5012,x ; (BLIT_CODE + 18)
4137 : 98 __ __ TYA
4138 : f0 04 __ BEQ $413e ; (bm_line.s1116 + 0)
.s1117:
413a : a9 10 __ LDA #$10
413c : d0 02 __ BNE $4140 ; (bm_line.s1118 + 0)
.s1116:
413e : a9 0e __ LDA #$0e
.s1118:
4140 : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
4143 : 38 __ __ SEC
4144 : a5 50 __ LDA T7 + 0 
4146 : e9 01 __ SBC #$01
4148 : 9d 0a 50 STA $500a,x ; (BLIT_CODE + 10)
414b : a5 51 __ LDA T7 + 1 
414d : e9 00 __ SBC #$00
414f : 9d 10 50 STA $5010,x ; (BLIT_CODE + 16)
4152 : 8a __ __ TXA
4153 : 18 __ __ CLC
4154 : 69 13 __ ADC #$13
4156 : 85 4f __ STA T6 + 0 
4158 : aa __ __ TAX
4159 : a5 47 __ LDA T2 + 0 
415b : 05 48 __ ORA T2 + 1 
415d : d0 03 __ BNE $4162 ; (bm_line.s222 + 0)
415f : 4c 55 40 JMP $4055 ; (bm_line.s268 + 0)
.s222:
4162 : a9 a5 __ LDA #$a5
4164 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
4167 : a9 05 __ LDA #$05
4169 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
416c : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
416f : a9 38 __ LDA #$38
4171 : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
4174 : a9 e9 __ LDA #$e9
4176 : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
4179 : a9 85 __ LDA #$85
417b : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
417e : a5 47 __ LDA T2 + 0 
4180 : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
4183 : a5 1b __ LDA ACCU + 0 ; (pattern + 0)
4185 : d0 2a __ BNE $41b1 ; (bm_line.s233 + 0)
.s234:
4187 : a9 10 __ LDA #$10
4189 : 9d 07 50 STA $5007,x ; (BLIT_CODE + 7)
418c : a9 15 __ LDA #$15
418e : 9d 08 50 STA $5008,x ; (BLIT_CODE + 8)
4191 : a9 18 __ LDA #$18
4193 : 9d 09 50 STA $5009,x ; (BLIT_CODE + 9)
4196 : a9 69 __ LDA #$69
4198 : 9d 0a 50 STA $500a,x ; (BLIT_CODE + 10)
419b : a5 49 __ LDA T3 + 0 
419d : 9d 0b 50 STA $500b,x ; (BLIT_CODE + 11)
41a0 : a9 85 __ LDA #$85
41a2 : 9d 0c 50 STA $500c,x ; (BLIT_CODE + 12)
41a5 : a9 05 __ LDA #$05
41a7 : 9d 0d 50 STA $500d,x ; (BLIT_CODE + 13)
41aa : 8a __ __ TXA
41ab : 18 __ __ CLC
41ac : 69 0e __ ADC #$0e
41ae : 4c 0c 42 JMP $420c ; (bm_line.s1102 + 0)
.s233:
41b1 : a9 a5 __ LDA #$a5
41b3 : 9d 07 50 STA $5007,x ; (BLIT_CODE + 7)
41b6 : 9d 10 50 STA $5010,x ; (BLIT_CODE + 16)
41b9 : 9d 16 50 STA $5016,x ; (BLIT_CODE + 22)
41bc : a9 06 __ LDA #$06
41be : 9d 08 50 STA $5008,x ; (BLIT_CODE + 8)
41c1 : 9d 0c 50 STA $500c,x ; (BLIT_CODE + 12)
41c4 : 9d 17 50 STA $5017,x ; (BLIT_CODE + 23)
41c7 : 9d 1b 50 STA $501b,x ; (BLIT_CODE + 27)
41ca : a9 e9 __ LDA #$e9
41cc : 9d 09 50 STA $5009,x ; (BLIT_CODE + 9)
41cf : a9 85 __ LDA #$85
41d1 : 9d 0b 50 STA $500b,x ; (BLIT_CODE + 11)
41d4 : 9d 14 50 STA $5014,x ; (BLIT_CODE + 20)
41d7 : 9d 1a 50 STA $501a,x ; (BLIT_CODE + 26)
41da : a9 10 __ LDA #$10
41dc : 9d 0d 50 STA $500d,x ; (BLIT_CODE + 13)
41df : a9 1d __ LDA #$1d
41e1 : 9d 0e 50 STA $500e,x ; (BLIT_CODE + 14)
41e4 : a9 18 __ LDA #$18
41e6 : 9d 0f 50 STA $500f,x ; (BLIT_CODE + 15)
41e9 : a9 05 __ LDA #$05
41eb : 9d 11 50 STA $5011,x ; (BLIT_CODE + 17)
41ee : 9d 15 50 STA $5015,x ; (BLIT_CODE + 21)
41f1 : a9 69 __ LDA #$69
41f3 : 9d 12 50 STA $5012,x ; (BLIT_CODE + 18)
41f6 : 9d 18 50 STA $5018,x ; (BLIT_CODE + 24)
41f9 : a5 49 __ LDA T3 + 0 
41fb : 9d 13 50 STA $5013,x ; (BLIT_CODE + 19)
41fe : a5 48 __ LDA T2 + 1 
4200 : 9d 0a 50 STA $500a,x ; (BLIT_CODE + 10)
4203 : a5 4a __ LDA T3 + 1 
4205 : 9d 19 50 STA $5019,x ; (BLIT_CODE + 25)
4208 : 8a __ __ TXA
4209 : 18 __ __ CLC
420a : 69 1c __ ADC #$1c
.s1102:
420c : 85 4f __ STA T6 + 0 
420e : 4c d5 3f JMP $3fd5 ; (bm_line.s168 + 0)
.s179:
4211 : a9 88 __ LDA #$88
4213 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
4216 : a9 10 __ LDA #$10
4218 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
421b : a9 18 __ LDA #$18
421d : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
4220 : a9 a0 __ LDA #$a0
4222 : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
4225 : a9 07 __ LDA #$07
4227 : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
422a : a9 a5 __ LDA #$a5
422c : 9d 06 50 STA $5006,x ; (BLIT_CODE + 6)
422f : 9d 0c 50 STA $500c,x ; (BLIT_CODE + 12)
4232 : a9 03 __ LDA #$03
4234 : 9d 07 50 STA $5007,x ; (BLIT_CODE + 7)
4237 : 9d 0b 50 STA $500b,x ; (BLIT_CODE + 11)
423a : a9 69 __ LDA #$69
423c : 9d 08 50 STA $5008,x ; (BLIT_CODE + 8)
423f : 9d 0e 50 STA $500e,x ; (BLIT_CODE + 14)
4242 : a9 85 __ LDA #$85
4244 : 9d 0a 50 STA $500a,x ; (BLIT_CODE + 10)
4247 : 9d 10 50 STA $5010,x ; (BLIT_CODE + 16)
424a : a9 04 __ LDA #$04
424c : 9d 0d 50 STA $500d,x ; (BLIT_CODE + 13)
424f : 9d 11 50 STA $5011,x ; (BLIT_CODE + 17)
4252 : 98 __ __ TYA
4253 : f0 04 __ BEQ $4259 ; (bm_line.s1113 + 0)
.s1114:
4255 : a9 11 __ LDA #$11
4257 : d0 02 __ BNE $425b ; (bm_line.s1115 + 0)
.s1113:
4259 : a9 0f __ LDA #$0f
.s1115:
425b : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
425e : a5 50 __ LDA T7 + 0 
4260 : 9d 09 50 STA $5009,x ; (BLIT_CODE + 9)
4263 : a5 51 __ LDA T7 + 1 
4265 : 9d 0f 50 STA $500f,x ; (BLIT_CODE + 15)
4268 : 8a __ __ TXA
4269 : 18 __ __ CLC
426a : 69 12 __ ADC #$12
426c : 85 4f __ STA T6 + 0 
426e : aa __ __ TAX
426f : a5 47 __ LDA T2 + 0 
4271 : 05 48 __ ORA T2 + 1 
4273 : f0 03 __ BEQ $4278 ; (bm_line.s1115 + 29)
4275 : 4c 62 41 JMP $4162 ; (bm_line.s222 + 0)
4278 : 4c 55 40 JMP $4055 ; (bm_line.s268 + 0)
.s144:
427b : a4 43 __ LDY T10 + 0 
427d : c8 __ __ INY
427e : f0 1e __ BEQ $429e ; (bm_line.s147 + 0)
.s145:
4280 : 8e 06 50 STX $5006 ; (BLIT_CODE + 6)
4283 : a9 07 __ LDA #$07
4285 : 8d 07 50 STA $5007 ; (BLIT_CODE + 7)
4288 : 8d 0b 50 STA $500b ; (BLIT_CODE + 11)
428b : a9 90 __ LDA #$90
428d : 8d 08 50 STA $5008 ; (BLIT_CODE + 8)
4290 : a9 08 __ LDA #$08
4292 : 8d 09 50 STA $5009 ; (BLIT_CODE + 9)
4295 : a9 e6 __ LDA #$e6
4297 : 8d 0a 50 STA $500a ; (BLIT_CODE + 10)
429a : a9 0c __ LDA #$0c
429c : 85 4f __ STA T6 + 0 
.s147:
429e : a9 49 __ LDA #$49
42a0 : a6 4f __ LDX T6 + 0 
42a2 : 9d 00 50 STA $5000,x ; (BLIT_CODE + 0)
42a5 : a9 ff __ LDA #$ff
42a7 : 9d 01 50 STA $5001,x ; (BLIT_CODE + 1)
42aa : a9 31 __ LDA #$31
42ac : 9d 02 50 STA $5002,x ; (BLIT_CODE + 2)
42af : a9 03 __ LDA #$03
42b1 : 9d 03 50 STA $5003,x ; (BLIT_CODE + 3)
42b4 : 9d 05 50 STA $5005,x ; (BLIT_CODE + 5)
42b7 : a9 91 __ LDA #$91
42b9 : 9d 04 50 STA $5004,x ; (BLIT_CODE + 4)
42bc : 8a __ __ TXA
42bd : 18 __ __ CLC
42be : 69 06 __ ADC #$06
42c0 : 4c ca 3f JMP $3fca ; (bm_line.s1101 + 0)
.s34:
42c3 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
42c6 : 85 49 __ STA T3 + 0 
42c8 : ad f7 c7 LDA $c7f7 ; (sstack + 1)
42cb : 10 03 __ BPL $42d0 ; (bm_line.s1050 + 0)
42cd : 4c 50 3d JMP $3d50 ; (bm_line.s1001 + 0)
.s1050:
42d0 : 85 4a __ STA T3 + 1 
42d2 : cd 8b 4b CMP $4b8b ; (SRect + 3)
42d5 : d0 05 __ BNE $42dc ; (bm_line.s1048 + 0)
.s1047:
42d7 : a5 49 __ LDA T3 + 0 
42d9 : cd 8a 4b CMP $4b8a ; (SRect + 2)
.s1048:
42dc : 90 ef __ BCC $42cd ; (bm_line.s34 + 10)
.s44:
42de : a5 16 __ LDA P9 ; (y0 + 1)
42e0 : 30 1a __ BMI $42fc ; (bm_line.s46 + 0)
.s1046:
42e2 : cd 8f 4b CMP $4b8f ; (SRect + 7)
42e5 : d0 05 __ BNE $42ec ; (bm_line.s1044 + 0)
.s1043:
42e7 : a5 15 __ LDA P8 ; (y0 + 0)
42e9 : cd 8e 4b CMP $4b8e ; (SRect + 6)
.s1044:
42ec : b0 df __ BCS $42cd ; (bm_line.s34 + 10)
.s43:
42ee : a5 16 __ LDA P9 ; (y0 + 1)
42f0 : cd 8b 4b CMP $4b8b ; (SRect + 3)
42f3 : d0 05 __ BNE $42fa ; (bm_line.s1040 + 0)
.s1039:
42f5 : a5 15 __ LDA P8 ; (y0 + 0)
42f7 : cd 8a 4b CMP $4b8a ; (SRect + 2)
.s1040:
42fa : b0 3e __ BCS $433a ; (bm_line.s1038 + 0)
.s46:
42fc : a5 50 __ LDA T7 + 0 
42fe : 85 0f __ STA P2 
4300 : a5 51 __ LDA T7 + 1 
4302 : 85 10 __ STA P3 
4304 : a5 4b __ LDA T4 + 0 
4306 : 85 11 __ STA P4 
4308 : a5 4c __ LDA T4 + 1 
430a : 85 12 __ STA P5 
430c : ad 8a 4b LDA $4b8a ; (SRect + 2)
430f : 38 __ __ SEC
4310 : e5 15 __ SBC P8 ; (y0 + 0)
4312 : 85 0d __ STA P0 
4314 : ad 8b 4b LDA $4b8b ; (SRect + 3)
4317 : e5 16 __ SBC P9 ; (y0 + 1)
4319 : 85 0e __ STA P1 
431b : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
431e : 18 __ __ CLC
431f : a5 13 __ LDA P6 ; (x0 + 0)
4321 : 65 1b __ ADC ACCU + 0 ; (pattern + 0)
4323 : 85 13 __ STA P6 ; (x0 + 0)
4325 : a5 14 __ LDA P7 ; (x0 + 1)
4327 : 65 1c __ ADC ACCU + 1 
4329 : 85 14 __ STA P7 ; (x0 + 1)
432b : ad 8a 4b LDA $4b8a ; (SRect + 2)
432e : 85 15 __ STA P8 ; (y0 + 0)
4330 : ad 8b 4b LDA $4b8b ; (SRect + 3)
4333 : 85 16 __ STA P9 ; (y0 + 1)
4335 : 2c 8f 4b BIT $4b8f ; (SRect + 7)
4338 : 30 11 __ BMI $434b ; (bm_line.s49 + 0)
.s1038:
433a : a5 4a __ LDA T3 + 1 
433c : cd 8f 4b CMP $4b8f ; (SRect + 7)
433f : d0 05 __ BNE $4346 ; (bm_line.s1036 + 0)
.s1097:
4341 : a5 49 __ LDA T3 + 0 
4343 : cd 8e 4b CMP $4b8e ; (SRect + 6)
.s1036:
4346 : b0 03 __ BCS $434b ; (bm_line.s49 + 0)
4348 : 4c 02 3e JMP $3e02 ; (bm_line.s36 + 0)
.s49:
434b : a5 50 __ LDA T7 + 0 
434d : 85 0f __ STA P2 
434f : a5 51 __ LDA T7 + 1 
4351 : 85 10 __ STA P3 
4353 : a5 4b __ LDA T4 + 0 
4355 : 85 11 __ STA P4 
4357 : a5 4c __ LDA T4 + 1 
4359 : 85 12 __ STA P5 
435b : 18 __ __ CLC
435c : a5 49 __ LDA T3 + 0 
435e : 69 01 __ ADC #$01
4360 : a4 4a __ LDY T3 + 1 
4362 : 90 01 __ BCC $4365 ; (bm_line.s1106 + 0)
.s1105:
4364 : c8 __ __ INY
.s1106:
4365 : 38 __ __ SEC
4366 : ed 8e 4b SBC $4b8e ; (SRect + 6)
4369 : 85 0d __ STA P0 
436b : 98 __ __ TYA
436c : ed 8f 4b SBC $4b8f ; (SRect + 7)
436f : 85 0e __ STA P1 
4371 : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
4374 : 38 __ __ SEC
4375 : a5 17 __ LDA P10 ; (x1 + 0)
4377 : e5 1b __ SBC ACCU + 0 ; (pattern + 0)
4379 : 85 17 __ STA P10 ; (x1 + 0)
437b : a5 18 __ LDA P11 ; (x1 + 1)
437d : e5 1c __ SBC ACCU + 1 
437f : 85 18 __ STA P11 ; (x1 + 1)
4381 : ad 8e 4b LDA $4b8e ; (SRect + 6)
4384 : 38 __ __ SEC
4385 : e9 01 __ SBC #$01
4387 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
438a : ad 8f 4b LDA $4b8f ; (SRect + 7)
438d : e9 00 __ SBC #$00
438f : 8d f7 c7 STA $c7f7 ; (sstack + 1)
4392 : 4c 02 3e JMP $3e02 ; (bm_line.s36 + 0)
.s1:
4395 : a5 18 __ LDA P11 ; (x1 + 1)
4397 : 10 03 __ BPL $439c ; (bm_line.s1091 + 0)
4399 : 4c 50 3d JMP $3d50 ; (bm_line.s1001 + 0)
.s1091:
439c : cd 89 4b CMP $4b89 ; (SRect + 1)
439f : d0 05 __ BNE $43a6 ; (bm_line.s1089 + 0)
.s1088:
43a1 : a5 17 __ LDA P10 ; (x1 + 0)
43a3 : cd 88 4b CMP $4b88 ; (SRect + 0)
.s1089:
43a6 : 90 f1 __ BCC $4399 ; (bm_line.s1 + 4)
.s11:
43a8 : a5 14 __ LDA P7 ; (x0 + 1)
43aa : 30 1a __ BMI $43c6 ; (bm_line.s13 + 0)
.s1087:
43ac : cd 8d 4b CMP $4b8d ; (SRect + 5)
43af : d0 05 __ BNE $43b6 ; (bm_line.s1085 + 0)
.s1084:
43b1 : a5 13 __ LDA P6 ; (x0 + 0)
43b3 : cd 8c 4b CMP $4b8c ; (SRect + 4)
.s1085:
43b6 : b0 e1 __ BCS $4399 ; (bm_line.s1 + 4)
.s10:
43b8 : a5 14 __ LDA P7 ; (x0 + 1)
43ba : cd 89 4b CMP $4b89 ; (SRect + 1)
43bd : d0 05 __ BNE $43c4 ; (bm_line.s1081 + 0)
.s1080:
43bf : a5 13 __ LDA P6 ; (x0 + 0)
43c1 : cd 88 4b CMP $4b88 ; (SRect + 0)
.s1081:
43c4 : b0 3e __ BCS $4404 ; (bm_line.s1079 + 0)
.s13:
43c6 : a5 4b __ LDA T4 + 0 
43c8 : 85 0f __ STA P2 
43ca : a5 4c __ LDA T4 + 1 
43cc : 85 10 __ STA P3 
43ce : a5 50 __ LDA T7 + 0 
43d0 : 85 11 __ STA P4 
43d2 : a5 51 __ LDA T7 + 1 
43d4 : 85 12 __ STA P5 
43d6 : ad 88 4b LDA $4b88 ; (SRect + 0)
43d9 : 38 __ __ SEC
43da : e5 13 __ SBC P6 ; (x0 + 0)
43dc : 85 0d __ STA P0 
43de : ad 89 4b LDA $4b89 ; (SRect + 1)
43e1 : e5 14 __ SBC P7 ; (x0 + 1)
43e3 : 85 0e __ STA P1 
43e5 : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
43e8 : 18 __ __ CLC
43e9 : a5 1b __ LDA ACCU + 0 ; (pattern + 0)
43eb : 65 15 __ ADC P8 ; (y0 + 0)
43ed : 85 15 __ STA P8 ; (y0 + 0)
43ef : a5 1c __ LDA ACCU + 1 
43f1 : 65 16 __ ADC P9 ; (y0 + 1)
43f3 : 85 16 __ STA P9 ; (y0 + 1)
43f5 : ad 88 4b LDA $4b88 ; (SRect + 0)
43f8 : 85 13 __ STA P6 ; (x0 + 0)
43fa : ad 89 4b LDA $4b89 ; (SRect + 1)
43fd : 85 14 __ STA P7 ; (x0 + 1)
43ff : 2c 8d 4b BIT $4b8d ; (SRect + 5)
4402 : 30 11 __ BMI $4415 ; (bm_line.s16 + 0)
.s1079:
4404 : a5 18 __ LDA P11 ; (x1 + 1)
4406 : cd 8d 4b CMP $4b8d ; (SRect + 5)
4409 : d0 05 __ BNE $4410 ; (bm_line.s1077 + 0)
.s1099:
440b : a5 17 __ LDA P10 ; (x1 + 0)
440d : cd 8c 4b CMP $4b8c ; (SRect + 4)
.s1077:
4410 : b0 03 __ BCS $4415 ; (bm_line.s16 + 0)
4412 : 4c 23 3d JMP $3d23 ; (bm_line.s3 + 0)
.s16:
4415 : a5 4b __ LDA T4 + 0 
4417 : 85 0f __ STA P2 
4419 : a5 4c __ LDA T4 + 1 
441b : 85 10 __ STA P3 
441d : a5 50 __ LDA T7 + 0 
441f : 85 11 __ STA P4 
4421 : a5 51 __ LDA T7 + 1 
4423 : 85 12 __ STA P5 
4425 : 18 __ __ CLC
4426 : a5 17 __ LDA P10 ; (x1 + 0)
4428 : 69 01 __ ADC #$01
442a : a4 18 __ LDY P11 ; (x1 + 1)
442c : 90 01 __ BCC $442f ; (bm_line.s1104 + 0)
.s1103:
442e : c8 __ __ INY
.s1104:
442f : 38 __ __ SEC
4430 : ed 8c 4b SBC $4b8c ; (SRect + 4)
4433 : 85 0d __ STA P0 
4435 : 98 __ __ TYA
4436 : ed 8d 4b SBC $4b8d ; (SRect + 5)
4439 : 85 0e __ STA P1 
443b : 20 5f 44 JSR $445f ; (lmuldiv16s.s0 + 0)
443e : 38 __ __ SEC
443f : a5 47 __ LDA T2 + 0 
4441 : e5 1b __ SBC ACCU + 0 ; (pattern + 0)
4443 : 8d f6 c7 STA $c7f6 ; (sstack + 0)
4446 : a5 48 __ LDA T2 + 1 
4448 : e5 1c __ SBC ACCU + 1 
444a : 8d f7 c7 STA $c7f7 ; (sstack + 1)
444d : ad 8c 4b LDA $4b8c ; (SRect + 4)
4450 : 38 __ __ SEC
4451 : e9 01 __ SBC #$01
4453 : 85 17 __ STA P10 ; (x1 + 0)
4455 : ad 8d 4b LDA $4b8d ; (SRect + 5)
4458 : e9 00 __ SBC #$00
445a : 85 18 __ STA P11 ; (x1 + 1)
445c : 4c 23 3d JMP $3d23 ; (bm_line.s3 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(,,)->i16
.s0:
445f : a9 00 __ LDA #$00
4461 : 24 0e __ BIT P1 ; (a + 1)
4463 : 10 0d __ BPL $4472 ; (lmuldiv16s.s11 + 0)
.s1:
4465 : 38 __ __ SEC
4466 : e5 0d __ SBC P0 ; (a + 0)
4468 : 85 0d __ STA P0 ; (a + 0)
446a : a9 00 __ LDA #$00
446c : e5 0e __ SBC P1 ; (a + 1)
446e : 85 0e __ STA P1 ; (a + 1)
4470 : a9 01 __ LDA #$01
.s11:
4472 : 85 43 __ STA T1 + 0 
4474 : 24 10 __ BIT P3 ; (b + 1)
4476 : 10 14 __ BPL $448c ; (lmuldiv16s.s12 + 0)
.s4:
4478 : 38 __ __ SEC
4479 : a9 00 __ LDA #$00
447b : e5 0f __ SBC P2 ; (b + 0)
447d : 85 0f __ STA P2 ; (b + 0)
447f : a9 00 __ LDA #$00
4481 : e5 10 __ SBC P3 ; (b + 1)
4483 : 85 10 __ STA P3 ; (b + 1)
4485 : a9 00 __ LDA #$00
4487 : c5 43 __ CMP T1 + 0 
4489 : 2a __ __ ROL
448a : 85 43 __ STA T1 + 0 
.s12:
448c : 24 12 __ BIT P5 ; (c + 1)
448e : 10 14 __ BPL $44a4 ; (lmuldiv16s.s9 + 0)
.s7:
4490 : 38 __ __ SEC
4491 : a9 00 __ LDA #$00
4493 : e5 11 __ SBC P4 ; (c + 0)
4495 : 85 11 __ STA P4 ; (c + 0)
4497 : a9 00 __ LDA #$00
4499 : e5 12 __ SBC P5 ; (c + 1)
449b : 85 12 __ STA P5 ; (c + 1)
449d : a9 00 __ LDA #$00
449f : c5 43 __ CMP T1 + 0 
44a1 : 2a __ __ ROL
44a2 : 85 43 __ STA T1 + 0 
.s9:
44a4 : a9 00 __ LDA #$00
44a6 : 85 05 __ STA WORK + 2 
44a8 : 85 06 __ STA WORK + 3 
44aa : a5 0d __ LDA P0 ; (a + 0)
44ac : 38 __ __ SEC
44ad : a0 08 __ LDY #$08
44af : 6a __ __ ROR
44b0 : 90 0f __ BCC $44c1 ; (lmuldiv16s.s9 + 29)
44b2 : aa __ __ TAX
44b3 : 18 __ __ CLC
44b4 : a5 05 __ LDA WORK + 2 
44b6 : 65 0f __ ADC P2 ; (b + 0)
44b8 : 85 05 __ STA WORK + 2 
44ba : a5 06 __ LDA WORK + 3 
44bc : 65 10 __ ADC P3 ; (b + 1)
44be : 85 06 __ STA WORK + 3 
44c0 : 8a __ __ TXA
44c1 : 66 06 __ ROR WORK + 3 
44c3 : 66 05 __ ROR WORK + 2 
44c5 : 88 __ __ DEY
44c6 : d0 e7 __ BNE $44af ; (lmuldiv16s.s9 + 11)
44c8 : 6a __ __ ROR
44c9 : 90 07 __ BCC $44d2 ; (lmuldiv16s.s9 + 46)
44cb : 85 03 __ STA WORK + 0 
44cd : a5 0e __ LDA P1 ; (a + 1)
44cf : 18 __ __ CLC
44d0 : 90 db __ BCC $44ad ; (lmuldiv16s.s9 + 9)
44d2 : 38 __ __ SEC
44d3 : 85 04 __ STA WORK + 1 
44d5 : a2 08 __ LDX #$08
44d7 : 26 04 __ ROL WORK + 1 
44d9 : 26 05 __ ROL WORK + 2 
44db : 26 06 __ ROL WORK + 3 
44dd : 90 0c __ BCC $44eb ; (lmuldiv16s.s9 + 71)
44df : a5 05 __ LDA WORK + 2 
44e1 : e5 11 __ SBC P4 ; (c + 0)
44e3 : a8 __ __ TAY
44e4 : a5 06 __ LDA WORK + 3 
44e6 : e5 12 __ SBC P5 ; (c + 1)
44e8 : 38 __ __ SEC
44e9 : b0 0c __ BCS $44f7 ; (lmuldiv16s.s9 + 83)
44eb : 38 __ __ SEC
44ec : a5 05 __ LDA WORK + 2 
44ee : e5 11 __ SBC P4 ; (c + 0)
44f0 : a8 __ __ TAY
44f1 : a5 06 __ LDA WORK + 3 
44f3 : e5 12 __ SBC P5 ; (c + 1)
44f5 : 90 04 __ BCC $44fb ; (lmuldiv16s.s9 + 87)
44f7 : 85 06 __ STA WORK + 3 
44f9 : 84 05 __ STY WORK + 2 
44fb : ca __ __ DEX
44fc : d0 d9 __ BNE $44d7 ; (lmuldiv16s.s9 + 51)
44fe : a5 04 __ LDA WORK + 1 
4500 : 2a __ __ ROL
4501 : 90 07 __ BCC $450a ; (lmuldiv16s.s9 + 102)
4503 : 85 1c __ STA ACCU + 1 
4505 : a5 03 __ LDA WORK + 0 
4507 : 18 __ __ CLC
4508 : 90 c9 __ BCC $44d3 ; (lmuldiv16s.s9 + 47)
450a : 85 1b __ STA ACCU + 0 
450c : a5 43 __ LDA T1 + 0 
450e : f0 0d __ BEQ $451d ; (lmuldiv16s.s1001 + 0)
4510 : 38 __ __ SEC
4511 : a9 00 __ LDA #$00
4513 : e5 1b __ SBC ACCU + 0 
4515 : 85 1b __ STA ACCU + 0 
4517 : a9 00 __ LDA #$00
4519 : e5 1c __ SBC ACCU + 1 
451b : 85 1c __ STA ACCU + 1 
.s1001:
451d : 60 __ __ RTS
--------------------------------------------------------------------
getch: ; getch()->void
.l53:
451e : 20 e4 ff JSR $ffe4 
4521 : aa __ __ TAX
4522 : f0 fa __ BEQ $451e ; (getch.l53 + 0)
.s1001:
4524 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
4525 : 4a __ __ LSR
4526 : f0 2e __ BEQ $4556 ; (mul16by8 + 49)
4528 : a2 00 __ LDX #$00
452a : a0 00 __ LDY #$00
452c : 90 13 __ BCC $4541 ; (mul16by8 + 28)
452e : a4 1b __ LDY ACCU + 0 
4530 : a6 1c __ LDX ACCU + 1 
4532 : b0 0d __ BCS $4541 ; (mul16by8 + 28)
4534 : 85 02 __ STA $02 
4536 : 18 __ __ CLC
4537 : 98 __ __ TYA
4538 : 65 1b __ ADC ACCU + 0 
453a : a8 __ __ TAY
453b : 8a __ __ TXA
453c : 65 1c __ ADC ACCU + 1 
453e : aa __ __ TAX
453f : a5 02 __ LDA $02 
4541 : 06 1b __ ASL ACCU + 0 
4543 : 26 1c __ ROL ACCU + 1 
4545 : 4a __ __ LSR
4546 : 90 f9 __ BCC $4541 ; (mul16by8 + 28)
4548 : d0 ea __ BNE $4534 ; (mul16by8 + 15)
454a : 18 __ __ CLC
454b : 98 __ __ TYA
454c : 65 1b __ ADC ACCU + 0 
454e : 85 1b __ STA ACCU + 0 
4550 : 8a __ __ TXA
4551 : 65 1c __ ADC ACCU + 1 
4553 : 85 1c __ STA ACCU + 1 
4555 : 60 __ __ RTS
4556 : b0 04 __ BCS $455c ; (mul16by8 + 55)
4558 : 85 1b __ STA ACCU + 0 
455a : 85 1c __ STA ACCU + 1 
455c : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
455d : b1 19 __ LDA (IP + 0),y 
455f : c8 __ __ INY
4560 : aa __ __ TAX
4561 : b5 00 __ LDA $00,x 
4563 : 85 03 __ STA WORK + 0 
4565 : b5 01 __ LDA $01,x 
4567 : 85 04 __ STA WORK + 1 
4569 : b5 02 __ LDA $02,x 
456b : 85 05 __ STA WORK + 2 
456d : b5 03 __ LDA WORK + 0,x 
456f : 85 06 __ STA WORK + 3 
4571 : a5 05 __ LDA WORK + 2 
4573 : 0a __ __ ASL
4574 : a5 06 __ LDA WORK + 3 
4576 : 2a __ __ ROL
4577 : 85 08 __ STA WORK + 5 
4579 : f0 06 __ BEQ $4581 ; (freg + 36)
457b : a5 05 __ LDA WORK + 2 
457d : 09 80 __ ORA #$80
457f : 85 05 __ STA WORK + 2 
4581 : a5 1d __ LDA ACCU + 2 
4583 : 0a __ __ ASL
4584 : a5 1e __ LDA ACCU + 3 
4586 : 2a __ __ ROL
4587 : 85 07 __ STA WORK + 4 
4589 : f0 06 __ BEQ $4591 ; (freg + 52)
458b : a5 1d __ LDA ACCU + 2 
458d : 09 80 __ ORA #$80
458f : 85 1d __ STA ACCU + 2 
4591 : 60 __ __ RTS
4592 : 06 1e __ ASL ACCU + 3 
4594 : a5 07 __ LDA WORK + 4 
4596 : 6a __ __ ROR
4597 : 85 1e __ STA ACCU + 3 
4599 : b0 06 __ BCS $45a1 ; (freg + 68)
459b : a5 1d __ LDA ACCU + 2 
459d : 29 7f __ AND #$7f
459f : 85 1d __ STA ACCU + 2 
45a1 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
45a2 : a5 06 __ LDA WORK + 3 
45a4 : 49 80 __ EOR #$80
45a6 : 85 06 __ STA WORK + 3 
45a8 : a9 ff __ LDA #$ff
45aa : c5 07 __ CMP WORK + 4 
45ac : f0 04 __ BEQ $45b2 ; (faddsub + 16)
45ae : c5 08 __ CMP WORK + 5 
45b0 : d0 11 __ BNE $45c3 ; (faddsub + 33)
45b2 : a5 1e __ LDA ACCU + 3 
45b4 : 09 7f __ ORA #$7f
45b6 : 85 1e __ STA ACCU + 3 
45b8 : a9 80 __ LDA #$80
45ba : 85 1d __ STA ACCU + 2 
45bc : a9 00 __ LDA #$00
45be : 85 1b __ STA ACCU + 0 
45c0 : 85 1c __ STA ACCU + 1 
45c2 : 60 __ __ RTS
45c3 : 38 __ __ SEC
45c4 : a5 07 __ LDA WORK + 4 
45c6 : e5 08 __ SBC WORK + 5 
45c8 : f0 38 __ BEQ $4602 ; (faddsub + 96)
45ca : aa __ __ TAX
45cb : b0 25 __ BCS $45f2 ; (faddsub + 80)
45cd : e0 e9 __ CPX #$e9
45cf : b0 0e __ BCS $45df ; (faddsub + 61)
45d1 : a5 08 __ LDA WORK + 5 
45d3 : 85 07 __ STA WORK + 4 
45d5 : a9 00 __ LDA #$00
45d7 : 85 1b __ STA ACCU + 0 
45d9 : 85 1c __ STA ACCU + 1 
45db : 85 1d __ STA ACCU + 2 
45dd : f0 23 __ BEQ $4602 ; (faddsub + 96)
45df : a5 1d __ LDA ACCU + 2 
45e1 : 4a __ __ LSR
45e2 : 66 1c __ ROR ACCU + 1 
45e4 : 66 1b __ ROR ACCU + 0 
45e6 : e8 __ __ INX
45e7 : d0 f8 __ BNE $45e1 ; (faddsub + 63)
45e9 : 85 1d __ STA ACCU + 2 
45eb : a5 08 __ LDA WORK + 5 
45ed : 85 07 __ STA WORK + 4 
45ef : 4c 02 46 JMP $4602 ; (faddsub + 96)
45f2 : e0 18 __ CPX #$18
45f4 : b0 33 __ BCS $4629 ; (faddsub + 135)
45f6 : a5 05 __ LDA WORK + 2 
45f8 : 4a __ __ LSR
45f9 : 66 04 __ ROR WORK + 1 
45fb : 66 03 __ ROR WORK + 0 
45fd : ca __ __ DEX
45fe : d0 f8 __ BNE $45f8 ; (faddsub + 86)
4600 : 85 05 __ STA WORK + 2 
4602 : a5 1e __ LDA ACCU + 3 
4604 : 29 80 __ AND #$80
4606 : 85 1e __ STA ACCU + 3 
4608 : 45 06 __ EOR WORK + 3 
460a : 30 31 __ BMI $463d ; (faddsub + 155)
460c : 18 __ __ CLC
460d : a5 1b __ LDA ACCU + 0 
460f : 65 03 __ ADC WORK + 0 
4611 : 85 1b __ STA ACCU + 0 
4613 : a5 1c __ LDA ACCU + 1 
4615 : 65 04 __ ADC WORK + 1 
4617 : 85 1c __ STA ACCU + 1 
4619 : a5 1d __ LDA ACCU + 2 
461b : 65 05 __ ADC WORK + 2 
461d : 85 1d __ STA ACCU + 2 
461f : 90 08 __ BCC $4629 ; (faddsub + 135)
4621 : 66 1d __ ROR ACCU + 2 
4623 : 66 1c __ ROR ACCU + 1 
4625 : 66 1b __ ROR ACCU + 0 
4627 : e6 07 __ INC WORK + 4 
4629 : a5 07 __ LDA WORK + 4 
462b : c9 ff __ CMP #$ff
462d : f0 83 __ BEQ $45b2 ; (faddsub + 16)
462f : 4a __ __ LSR
4630 : 05 1e __ ORA ACCU + 3 
4632 : 85 1e __ STA ACCU + 3 
4634 : b0 06 __ BCS $463c ; (faddsub + 154)
4636 : a5 1d __ LDA ACCU + 2 
4638 : 29 7f __ AND #$7f
463a : 85 1d __ STA ACCU + 2 
463c : 60 __ __ RTS
463d : 38 __ __ SEC
463e : a5 1b __ LDA ACCU + 0 
4640 : e5 03 __ SBC WORK + 0 
4642 : 85 1b __ STA ACCU + 0 
4644 : a5 1c __ LDA ACCU + 1 
4646 : e5 04 __ SBC WORK + 1 
4648 : 85 1c __ STA ACCU + 1 
464a : a5 1d __ LDA ACCU + 2 
464c : e5 05 __ SBC WORK + 2 
464e : 85 1d __ STA ACCU + 2 
4650 : b0 19 __ BCS $466b ; (faddsub + 201)
4652 : 38 __ __ SEC
4653 : a9 00 __ LDA #$00
4655 : e5 1b __ SBC ACCU + 0 
4657 : 85 1b __ STA ACCU + 0 
4659 : a9 00 __ LDA #$00
465b : e5 1c __ SBC ACCU + 1 
465d : 85 1c __ STA ACCU + 1 
465f : a9 00 __ LDA #$00
4661 : e5 1d __ SBC ACCU + 2 
4663 : 85 1d __ STA ACCU + 2 
4665 : a5 1e __ LDA ACCU + 3 
4667 : 49 80 __ EOR #$80
4669 : 85 1e __ STA ACCU + 3 
466b : a5 1d __ LDA ACCU + 2 
466d : 30 ba __ BMI $4629 ; (faddsub + 135)
466f : 05 1c __ ORA ACCU + 1 
4671 : 05 1b __ ORA ACCU + 0 
4673 : f0 0f __ BEQ $4684 ; (faddsub + 226)
4675 : c6 07 __ DEC WORK + 4 
4677 : f0 0b __ BEQ $4684 ; (faddsub + 226)
4679 : 06 1b __ ASL ACCU + 0 
467b : 26 1c __ ROL ACCU + 1 
467d : 26 1d __ ROL ACCU + 2 
467f : 10 f4 __ BPL $4675 ; (faddsub + 211)
4681 : 4c 29 46 JMP $4629 ; (faddsub + 135)
4684 : a9 00 __ LDA #$00
4686 : 85 1b __ STA ACCU + 0 
4688 : 85 1c __ STA ACCU + 1 
468a : 85 1d __ STA ACCU + 2 
468c : 85 1e __ STA ACCU + 3 
468e : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
468f : 38 __ __ SEC
4690 : 6a __ __ ROR
4691 : 90 1e __ BCC $46b1 ; (crt_fmul8 + 34)
4693 : aa __ __ TAX
4694 : 18 __ __ CLC
4695 : 98 __ __ TYA
4696 : 65 09 __ ADC WORK + 6 
4698 : 85 09 __ STA WORK + 6 
469a : a5 0a __ LDA WORK + 7 
469c : 65 1c __ ADC ACCU + 1 
469e : 85 0a __ STA WORK + 7 
46a0 : a5 0b __ LDA WORK + 8 
46a2 : 65 1d __ ADC ACCU + 2 
46a4 : 6a __ __ ROR
46a5 : 85 0b __ STA WORK + 8 
46a7 : 8a __ __ TXA
46a8 : 66 0a __ ROR WORK + 7 
46aa : 66 09 __ ROR WORK + 6 
46ac : 4a __ __ LSR
46ad : f0 0d __ BEQ $46bc ; (crt_fmul8 + 45)
46af : b0 e2 __ BCS $4693 ; (crt_fmul8 + 4)
46b1 : 66 0b __ ROR WORK + 8 
46b3 : 66 0a __ ROR WORK + 7 
46b5 : 66 09 __ ROR WORK + 6 
46b7 : 4a __ __ LSR
46b8 : 90 f7 __ BCC $46b1 ; (crt_fmul8 + 34)
46ba : d0 d7 __ BNE $4693 ; (crt_fmul8 + 4)
46bc : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
46bd : a5 1b __ LDA ACCU + 0 
46bf : 05 1c __ ORA ACCU + 1 
46c1 : 05 1d __ ORA ACCU + 2 
46c3 : d0 03 __ BNE $46c8 ; (crt_fdiv + 11)
46c5 : 85 1e __ STA ACCU + 3 
46c7 : 60 __ __ RTS
46c8 : a5 1e __ LDA ACCU + 3 
46ca : 45 06 __ EOR WORK + 3 
46cc : 29 80 __ AND #$80
46ce : 85 1e __ STA ACCU + 3 
46d0 : a5 08 __ LDA WORK + 5 
46d2 : f0 62 __ BEQ $4736 ; (crt_fdiv + 121)
46d4 : a5 07 __ LDA WORK + 4 
46d6 : c9 ff __ CMP #$ff
46d8 : f0 5c __ BEQ $4736 ; (crt_fdiv + 121)
46da : a9 00 __ LDA #$00
46dc : 85 09 __ STA WORK + 6 
46de : 85 0a __ STA WORK + 7 
46e0 : 85 0b __ STA WORK + 8 
46e2 : a2 18 __ LDX #$18
46e4 : a5 1b __ LDA ACCU + 0 
46e6 : c5 03 __ CMP WORK + 0 
46e8 : a5 1c __ LDA ACCU + 1 
46ea : e5 04 __ SBC WORK + 1 
46ec : a5 1d __ LDA ACCU + 2 
46ee : e5 05 __ SBC WORK + 2 
46f0 : 90 13 __ BCC $4705 ; (crt_fdiv + 72)
46f2 : a5 1b __ LDA ACCU + 0 
46f4 : e5 03 __ SBC WORK + 0 
46f6 : 85 1b __ STA ACCU + 0 
46f8 : a5 1c __ LDA ACCU + 1 
46fa : e5 04 __ SBC WORK + 1 
46fc : 85 1c __ STA ACCU + 1 
46fe : a5 1d __ LDA ACCU + 2 
4700 : e5 05 __ SBC WORK + 2 
4702 : 85 1d __ STA ACCU + 2 
4704 : 38 __ __ SEC
4705 : 26 09 __ ROL WORK + 6 
4707 : 26 0a __ ROL WORK + 7 
4709 : 26 0b __ ROL WORK + 8 
470b : ca __ __ DEX
470c : f0 0a __ BEQ $4718 ; (crt_fdiv + 91)
470e : 06 1b __ ASL ACCU + 0 
4710 : 26 1c __ ROL ACCU + 1 
4712 : 26 1d __ ROL ACCU + 2 
4714 : b0 dc __ BCS $46f2 ; (crt_fdiv + 53)
4716 : 90 cc __ BCC $46e4 ; (crt_fdiv + 39)
4718 : 38 __ __ SEC
4719 : a5 0b __ LDA WORK + 8 
471b : 30 06 __ BMI $4723 ; (crt_fdiv + 102)
471d : 06 09 __ ASL WORK + 6 
471f : 26 0a __ ROL WORK + 7 
4721 : 2a __ __ ROL
4722 : 18 __ __ CLC
4723 : 29 7f __ AND #$7f
4725 : 85 0b __ STA WORK + 8 
4727 : a5 07 __ LDA WORK + 4 
4729 : e5 08 __ SBC WORK + 5 
472b : 90 1a __ BCC $4747 ; (crt_fdiv + 138)
472d : 18 __ __ CLC
472e : 69 7f __ ADC #$7f
4730 : b0 04 __ BCS $4736 ; (crt_fdiv + 121)
4732 : c9 ff __ CMP #$ff
4734 : d0 15 __ BNE $474b ; (crt_fdiv + 142)
4736 : a5 1e __ LDA ACCU + 3 
4738 : 09 7f __ ORA #$7f
473a : 85 1e __ STA ACCU + 3 
473c : a9 80 __ LDA #$80
473e : 85 1d __ STA ACCU + 2 
4740 : a9 00 __ LDA #$00
4742 : 85 1c __ STA ACCU + 1 
4744 : 85 1b __ STA ACCU + 0 
4746 : 60 __ __ RTS
4747 : 69 7f __ ADC #$7f
4749 : 90 15 __ BCC $4760 ; (crt_fdiv + 163)
474b : 4a __ __ LSR
474c : 05 1e __ ORA ACCU + 3 
474e : 85 1e __ STA ACCU + 3 
4750 : a9 00 __ LDA #$00
4752 : 6a __ __ ROR
4753 : 05 0b __ ORA WORK + 8 
4755 : 85 1d __ STA ACCU + 2 
4757 : a5 0a __ LDA WORK + 7 
4759 : 85 1c __ STA ACCU + 1 
475b : a5 09 __ LDA WORK + 6 
475d : 85 1b __ STA ACCU + 0 
475f : 60 __ __ RTS
4760 : a9 00 __ LDA #$00
4762 : 85 1e __ STA ACCU + 3 
4764 : 85 1d __ STA ACCU + 2 
4766 : 85 1c __ STA ACCU + 1 
4768 : 85 1b __ STA ACCU + 0 
476a : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
476b : 24 1e __ BIT ACCU + 3 
476d : 10 13 __ BPL $4782 ; (fround + 23)
476f : 30 6b __ BMI $47dc ; (fround + 113)
4771 : 24 1e __ BIT ACCU + 3 
4773 : 30 0d __ BMI $4782 ; (fround + 23)
4775 : 10 65 __ BPL $47dc ; (fround + 113)
4777 : a9 00 __ LDA #$00
4779 : 85 1b __ STA ACCU + 0 
477b : 85 1c __ STA ACCU + 1 
477d : 85 1d __ STA ACCU + 2 
477f : 85 1e __ STA ACCU + 3 
4781 : 60 __ __ RTS
4782 : a5 07 __ LDA WORK + 4 
4784 : c9 7f __ CMP #$7f
4786 : 90 ef __ BCC $4777 ; (fround + 12)
4788 : c9 87 __ CMP #$87
478a : 90 16 __ BCC $47a2 ; (fround + 55)
478c : c9 8f __ CMP #$8f
478e : 90 26 __ BCC $47b6 ; (fround + 75)
4790 : c9 97 __ CMP #$97
4792 : b0 34 __ BCS $47c8 ; (fround + 93)
4794 : 38 __ __ SEC
4795 : e9 8f __ SBC #$8f
4797 : aa __ __ TAX
4798 : a5 1b __ LDA ACCU + 0 
479a : 3d db 4d AND $4ddb,x ; (ubitmask + 0)
479d : 85 1b __ STA ACCU + 0 
479f : 4c c8 47 JMP $47c8 ; (fround + 93)
47a2 : 38 __ __ SEC
47a3 : e9 7f __ SBC #$7f
47a5 : aa __ __ TAX
47a6 : a5 1d __ LDA ACCU + 2 
47a8 : 3d db 4d AND $4ddb,x ; (ubitmask + 0)
47ab : 85 1d __ STA ACCU + 2 
47ad : a9 00 __ LDA #$00
47af : 85 1b __ STA ACCU + 0 
47b1 : 85 1c __ STA ACCU + 1 
47b3 : 4c c8 47 JMP $47c8 ; (fround + 93)
47b6 : 38 __ __ SEC
47b7 : e9 87 __ SBC #$87
47b9 : aa __ __ TAX
47ba : a5 1c __ LDA ACCU + 1 
47bc : 3d db 4d AND $4ddb,x ; (ubitmask + 0)
47bf : 85 1c __ STA ACCU + 1 
47c1 : a9 00 __ LDA #$00
47c3 : 85 1b __ STA ACCU + 0 
47c5 : 4c c8 47 JMP $47c8 ; (fround + 93)
47c8 : 4c 92 45 JMP $4592 ; (freg + 53)
47cb : a9 7f __ LDA #$7f
47cd : 85 07 __ STA WORK + 4 
47cf : a9 00 __ LDA #$00
47d1 : 85 1b __ STA ACCU + 0 
47d3 : 85 1c __ STA ACCU + 1 
47d5 : a9 80 __ LDA #$80
47d7 : 85 1d __ STA ACCU + 2 
47d9 : 4c 92 45 JMP $4592 ; (freg + 53)
47dc : a5 1b __ LDA ACCU + 0 
47de : 05 1c __ ORA ACCU + 1 
47e0 : 05 1d __ ORA ACCU + 2 
47e2 : f0 93 __ BEQ $4777 ; (fround + 12)
47e4 : a5 07 __ LDA WORK + 4 
47e6 : c9 7f __ CMP #$7f
47e8 : 90 e1 __ BCC $47cb ; (fround + 96)
47ea : c9 87 __ CMP #$87
47ec : 90 2e __ BCC $481c ; (fround + 177)
47ee : c9 8f __ CMP #$8f
47f0 : 90 4c __ BCC $483e ; (fround + 211)
47f2 : c9 97 __ CMP #$97
47f4 : b0 6c __ BCS $4862 ; (fround + 247)
47f6 : 38 __ __ SEC
47f7 : e9 8f __ SBC #$8f
47f9 : aa __ __ TAX
47fa : 18 __ __ CLC
47fb : bd db 4d LDA $4ddb,x ; (ubitmask + 0)
47fe : 49 ff __ EOR #$ff
4800 : 65 1b __ ADC ACCU + 0 
4802 : 85 1b __ STA ACCU + 0 
4804 : a9 00 __ LDA #$00
4806 : 65 1c __ ADC ACCU + 1 
4808 : 85 1c __ STA ACCU + 1 
480a : a9 00 __ LDA #$00
480c : 65 1d __ ADC ACCU + 2 
480e : 90 07 __ BCC $4817 ; (fround + 172)
4810 : 6a __ __ ROR
4811 : 66 1c __ ROR ACCU + 1 
4813 : 66 1b __ ROR ACCU + 0 
4815 : e6 07 __ INC WORK + 4 
4817 : 85 1d __ STA ACCU + 2 
4819 : 4c 82 47 JMP $4782 ; (fround + 23)
481c : 38 __ __ SEC
481d : e9 7f __ SBC #$7f
481f : aa __ __ TAX
4820 : 18 __ __ CLC
4821 : a9 ff __ LDA #$ff
4823 : 65 1b __ ADC ACCU + 0 
4825 : a9 ff __ LDA #$ff
4827 : 65 1c __ ADC ACCU + 1 
4829 : bd db 4d LDA $4ddb,x ; (ubitmask + 0)
482c : 49 ff __ EOR #$ff
482e : 65 1d __ ADC ACCU + 2 
4830 : 90 07 __ BCC $4839 ; (fround + 206)
4832 : 6a __ __ ROR
4833 : 66 1c __ ROR ACCU + 1 
4835 : 66 1b __ ROR ACCU + 0 
4837 : e6 07 __ INC WORK + 4 
4839 : 85 1d __ STA ACCU + 2 
483b : 4c 82 47 JMP $4782 ; (fround + 23)
483e : 38 __ __ SEC
483f : e9 87 __ SBC #$87
4841 : aa __ __ TAX
4842 : 18 __ __ CLC
4843 : a9 ff __ LDA #$ff
4845 : 65 1b __ ADC ACCU + 0 
4847 : bd db 4d LDA $4ddb,x ; (ubitmask + 0)
484a : 49 ff __ EOR #$ff
484c : 65 1c __ ADC ACCU + 1 
484e : 85 1c __ STA ACCU + 1 
4850 : a9 00 __ LDA #$00
4852 : 65 1d __ ADC ACCU + 2 
4854 : 90 07 __ BCC $485d ; (fround + 242)
4856 : 6a __ __ ROR
4857 : 66 1c __ ROR ACCU + 1 
4859 : 66 1b __ ROR ACCU + 0 
485b : e6 07 __ INC WORK + 4 
485d : 85 1d __ STA ACCU + 2 
485f : 4c 82 47 JMP $4782 ; (fround + 23)
4862 : 4c 92 45 JMP $4592 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
4865 : 20 81 45 JSR $4581 ; (freg + 36)
4868 : a5 07 __ LDA WORK + 4 
486a : c9 7f __ CMP #$7f
486c : b0 07 __ BCS $4875 ; (f32_to_i16 + 16)
486e : a9 00 __ LDA #$00
4870 : 85 1b __ STA ACCU + 0 
4872 : 85 1c __ STA ACCU + 1 
4874 : 60 __ __ RTS
4875 : 38 __ __ SEC
4876 : e9 8e __ SBC #$8e
4878 : 90 16 __ BCC $4890 ; (f32_to_i16 + 43)
487a : 24 1e __ BIT ACCU + 3 
487c : 30 09 __ BMI $4887 ; (f32_to_i16 + 34)
487e : a9 ff __ LDA #$ff
4880 : 85 1b __ STA ACCU + 0 
4882 : a9 7f __ LDA #$7f
4884 : 85 1c __ STA ACCU + 1 
4886 : 60 __ __ RTS
4887 : a9 00 __ LDA #$00
4889 : 85 1b __ STA ACCU + 0 
488b : a9 80 __ LDA #$80
488d : 85 1c __ STA ACCU + 1 
488f : 60 __ __ RTS
4890 : aa __ __ TAX
4891 : 46 1d __ LSR ACCU + 2 
4893 : 66 1c __ ROR ACCU + 1 
4895 : e8 __ __ INX
4896 : d0 f9 __ BNE $4891 ; (f32_to_i16 + 44)
4898 : 24 1e __ BIT ACCU + 3 
489a : 10 0e __ BPL $48aa ; (f32_to_i16 + 69)
489c : 38 __ __ SEC
489d : a9 00 __ LDA #$00
489f : e5 1c __ SBC ACCU + 1 
48a1 : 85 1b __ STA ACCU + 0 
48a3 : a9 00 __ LDA #$00
48a5 : e5 1d __ SBC ACCU + 2 
48a7 : 85 1c __ STA ACCU + 1 
48a9 : 60 __ __ RTS
48aa : a5 1c __ LDA ACCU + 1 
48ac : 85 1b __ STA ACCU + 0 
48ae : a5 1d __ LDA ACCU + 2 
48b0 : 85 1c __ STA ACCU + 1 
48b2 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
48b3 : 24 1c __ BIT ACCU + 1 
48b5 : 30 03 __ BMI $48ba ; (sint16_to_float + 7)
48b7 : 4c d1 48 JMP $48d1 ; (uint16_to_float + 0)
48ba : 38 __ __ SEC
48bb : a9 00 __ LDA #$00
48bd : e5 1b __ SBC ACCU + 0 
48bf : 85 1b __ STA ACCU + 0 
48c1 : a9 00 __ LDA #$00
48c3 : e5 1c __ SBC ACCU + 1 
48c5 : 85 1c __ STA ACCU + 1 
48c7 : 20 d1 48 JSR $48d1 ; (uint16_to_float + 0)
48ca : a5 1e __ LDA ACCU + 3 
48cc : 09 80 __ ORA #$80
48ce : 85 1e __ STA ACCU + 3 
48d0 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
48d1 : a5 1b __ LDA ACCU + 0 
48d3 : 05 1c __ ORA ACCU + 1 
48d5 : d0 05 __ BNE $48dc ; (uint16_to_float + 11)
48d7 : 85 1d __ STA ACCU + 2 
48d9 : 85 1e __ STA ACCU + 3 
48db : 60 __ __ RTS
48dc : a2 8e __ LDX #$8e
48de : a5 1c __ LDA ACCU + 1 
48e0 : 30 06 __ BMI $48e8 ; (uint16_to_float + 23)
48e2 : ca __ __ DEX
48e3 : 06 1b __ ASL ACCU + 0 
48e5 : 2a __ __ ROL
48e6 : 10 fa __ BPL $48e2 ; (uint16_to_float + 17)
48e8 : 29 7f __ AND #$7f
48ea : 85 1d __ STA ACCU + 2 
48ec : a5 1b __ LDA ACCU + 0 
48ee : 85 1c __ STA ACCU + 1 
48f0 : 8a __ __ TXA
48f1 : 4a __ __ LSR
48f2 : 85 1e __ STA ACCU + 3 
48f4 : a9 00 __ LDA #$00
48f6 : 85 1b __ STA ACCU + 0 
48f8 : 6a __ __ ROR
48f9 : 05 1d __ ORA ACCU + 2 
48fb : 85 1d __ STA ACCU + 2 
48fd : 60 __ __ RTS
--------------------------------------------------------------------
crt_fcmp: ; crt_fcmp
48fe : a5 1e __ LDA ACCU + 3 
4900 : 45 06 __ EOR WORK + 3 
4902 : 10 1e __ BPL $4922 ; (crt_fcmp + 36)
4904 : a5 1e __ LDA ACCU + 3 
4906 : 29 7f __ AND #$7f
4908 : 05 1d __ ORA ACCU + 2 
490a : 05 1c __ ORA ACCU + 1 
490c : 05 1b __ ORA ACCU + 0 
490e : d0 0c __ BNE $491c ; (crt_fcmp + 30)
4910 : a5 06 __ LDA WORK + 3 
4912 : 29 7f __ AND #$7f
4914 : 05 05 __ ORA WORK + 2 
4916 : 05 04 __ ORA WORK + 1 
4918 : 05 03 __ ORA WORK + 0 
491a : f0 1e __ BEQ $493a ; (crt_fcmp + 60)
491c : a5 1e __ LDA ACCU + 3 
491e : 30 23 __ BMI $4943 ; (crt_fcmp + 69)
4920 : 10 28 __ BPL $494a ; (crt_fcmp + 76)
4922 : a5 1e __ LDA ACCU + 3 
4924 : c5 06 __ CMP WORK + 3 
4926 : d0 15 __ BNE $493d ; (crt_fcmp + 63)
4928 : a5 1d __ LDA ACCU + 2 
492a : c5 05 __ CMP WORK + 2 
492c : d0 0f __ BNE $493d ; (crt_fcmp + 63)
492e : a5 1c __ LDA ACCU + 1 
4930 : c5 04 __ CMP WORK + 1 
4932 : d0 09 __ BNE $493d ; (crt_fcmp + 63)
4934 : a5 1b __ LDA ACCU + 0 
4936 : c5 03 __ CMP WORK + 0 
4938 : d0 03 __ BNE $493d ; (crt_fcmp + 63)
493a : a9 00 __ LDA #$00
493c : 60 __ __ RTS
493d : b0 07 __ BCS $4946 ; (crt_fcmp + 72)
493f : 24 1e __ BIT ACCU + 3 
4941 : 30 07 __ BMI $494a ; (crt_fcmp + 76)
4943 : a9 01 __ LDA #$01
4945 : 60 __ __ RTS
4946 : 24 1e __ BIT ACCU + 3 
4948 : 30 f9 __ BMI $4943 ; (crt_fcmp + 69)
494a : a9 ff __ LDA #$ff
494c : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
494d : a9 00 __ LDA #$00
494f : 85 07 __ STA WORK + 4 
4951 : 85 08 __ STA WORK + 5 
4953 : 85 09 __ STA WORK + 6 
4955 : 85 0a __ STA WORK + 7 
4957 : a5 03 __ LDA WORK + 0 
4959 : 20 68 49 JSR $4968 ; (mul32 + 27)
495c : a5 04 __ LDA WORK + 1 
495e : 20 68 49 JSR $4968 ; (mul32 + 27)
4961 : a5 05 __ LDA WORK + 2 
4963 : 20 68 49 JSR $4968 ; (mul32 + 27)
4966 : a5 06 __ LDA WORK + 3 
4968 : d0 0f __ BNE $4979 ; (mul32 + 44)
496a : a6 1d __ LDX ACCU + 2 
496c : 86 1e __ STX ACCU + 3 
496e : a6 1c __ LDX ACCU + 1 
4970 : 86 1d __ STX ACCU + 2 
4972 : a6 1b __ LDX ACCU + 0 
4974 : 86 1c __ STX ACCU + 1 
4976 : 85 1b __ STA ACCU + 0 
4978 : 60 __ __ RTS
4979 : 38 __ __ SEC
497a : 6a __ __ ROR
497b : 90 1b __ BCC $4998 ; (mul32 + 75)
497d : aa __ __ TAX
497e : 18 __ __ CLC
497f : a5 07 __ LDA WORK + 4 
4981 : 65 1b __ ADC ACCU + 0 
4983 : 85 07 __ STA WORK + 4 
4985 : a5 08 __ LDA WORK + 5 
4987 : 65 1c __ ADC ACCU + 1 
4989 : 85 08 __ STA WORK + 5 
498b : a5 09 __ LDA WORK + 6 
498d : 65 1d __ ADC ACCU + 2 
498f : 85 09 __ STA WORK + 6 
4991 : a5 0a __ LDA WORK + 7 
4993 : 65 1e __ ADC ACCU + 3 
4995 : 85 0a __ STA WORK + 7 
4997 : 8a __ __ TXA
4998 : 06 1b __ ASL ACCU + 0 
499a : 26 1c __ ROL ACCU + 1 
499c : 26 1d __ ROL ACCU + 2 
499e : 26 1e __ ROL ACCU + 3 
49a0 : 4a __ __ LSR
49a1 : 90 f5 __ BCC $4998 ; (mul32 + 75)
49a3 : d0 d8 __ BNE $497d ; (mul32 + 48)
49a5 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
49a6 : 24 1e __ BIT ACCU + 3 
49a8 : 10 0d __ BPL $49b7 ; (divs32 + 17)
49aa : 20 c1 49 JSR $49c1 ; (negaccu32 + 0)
49ad : 24 06 __ BIT WORK + 3 
49af : 10 0d __ BPL $49be ; (divs32 + 24)
49b1 : 20 db 49 JSR $49db ; (negtmp32 + 0)
49b4 : 4c f5 49 JMP $49f5 ; (divmod32 + 0)
49b7 : 24 06 __ BIT WORK + 3 
49b9 : 10 f9 __ BPL $49b4 ; (divs32 + 14)
49bb : 20 db 49 JSR $49db ; (negtmp32 + 0)
49be : 20 f5 49 JSR $49f5 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
49c1 : 38 __ __ SEC
49c2 : a9 00 __ LDA #$00
49c4 : e5 1b __ SBC ACCU + 0 
49c6 : 85 1b __ STA ACCU + 0 
49c8 : a9 00 __ LDA #$00
49ca : e5 1c __ SBC ACCU + 1 
49cc : 85 1c __ STA ACCU + 1 
49ce : a9 00 __ LDA #$00
49d0 : e5 1d __ SBC ACCU + 2 
49d2 : 85 1d __ STA ACCU + 2 
49d4 : a9 00 __ LDA #$00
49d6 : e5 1e __ SBC ACCU + 3 
49d8 : 85 1e __ STA ACCU + 3 
49da : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
49db : 38 __ __ SEC
49dc : a9 00 __ LDA #$00
49de : e5 03 __ SBC WORK + 0 
49e0 : 85 03 __ STA WORK + 0 
49e2 : a9 00 __ LDA #$00
49e4 : e5 04 __ SBC WORK + 1 
49e6 : 85 04 __ STA WORK + 1 
49e8 : a9 00 __ LDA #$00
49ea : e5 05 __ SBC WORK + 2 
49ec : 85 05 __ STA WORK + 2 
49ee : a9 00 __ LDA #$00
49f0 : e5 06 __ SBC WORK + 3 
49f2 : 85 06 __ STA WORK + 3 
49f4 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
49f5 : 84 02 __ STY $02 
49f7 : a0 20 __ LDY #$20
49f9 : a9 00 __ LDA #$00
49fb : 85 07 __ STA WORK + 4 
49fd : 85 08 __ STA WORK + 5 
49ff : 85 09 __ STA WORK + 6 
4a01 : 85 0a __ STA WORK + 7 
4a03 : a5 05 __ LDA WORK + 2 
4a05 : 05 06 __ ORA WORK + 3 
4a07 : d0 78 __ BNE $4a81 ; (divmod32 + 140)
4a09 : a5 04 __ LDA WORK + 1 
4a0b : d0 27 __ BNE $4a34 ; (divmod32 + 63)
4a0d : 18 __ __ CLC
4a0e : 26 1b __ ROL ACCU + 0 
4a10 : 26 1c __ ROL ACCU + 1 
4a12 : 26 1d __ ROL ACCU + 2 
4a14 : 26 1e __ ROL ACCU + 3 
4a16 : 2a __ __ ROL
4a17 : 90 05 __ BCC $4a1e ; (divmod32 + 41)
4a19 : e5 03 __ SBC WORK + 0 
4a1b : 38 __ __ SEC
4a1c : b0 06 __ BCS $4a24 ; (divmod32 + 47)
4a1e : c5 03 __ CMP WORK + 0 
4a20 : 90 02 __ BCC $4a24 ; (divmod32 + 47)
4a22 : e5 03 __ SBC WORK + 0 
4a24 : 88 __ __ DEY
4a25 : d0 e7 __ BNE $4a0e ; (divmod32 + 25)
4a27 : 85 07 __ STA WORK + 4 
4a29 : 26 1b __ ROL ACCU + 0 
4a2b : 26 1c __ ROL ACCU + 1 
4a2d : 26 1d __ ROL ACCU + 2 
4a2f : 26 1e __ ROL ACCU + 3 
4a31 : a4 02 __ LDY $02 
4a33 : 60 __ __ RTS
4a34 : a5 1e __ LDA ACCU + 3 
4a36 : d0 10 __ BNE $4a48 ; (divmod32 + 83)
4a38 : a6 1d __ LDX ACCU + 2 
4a3a : 86 1e __ STX ACCU + 3 
4a3c : a6 1c __ LDX ACCU + 1 
4a3e : 86 1d __ STX ACCU + 2 
4a40 : a6 1b __ LDX ACCU + 0 
4a42 : 86 1c __ STX ACCU + 1 
4a44 : 85 1b __ STA ACCU + 0 
4a46 : a0 18 __ LDY #$18
4a48 : 18 __ __ CLC
4a49 : 26 1b __ ROL ACCU + 0 
4a4b : 26 1c __ ROL ACCU + 1 
4a4d : 26 1d __ ROL ACCU + 2 
4a4f : 26 1e __ ROL ACCU + 3 
4a51 : 26 07 __ ROL WORK + 4 
4a53 : 26 08 __ ROL WORK + 5 
4a55 : 90 0c __ BCC $4a63 ; (divmod32 + 110)
4a57 : a5 07 __ LDA WORK + 4 
4a59 : e5 03 __ SBC WORK + 0 
4a5b : aa __ __ TAX
4a5c : a5 08 __ LDA WORK + 5 
4a5e : e5 04 __ SBC WORK + 1 
4a60 : 38 __ __ SEC
4a61 : b0 0c __ BCS $4a6f ; (divmod32 + 122)
4a63 : 38 __ __ SEC
4a64 : a5 07 __ LDA WORK + 4 
4a66 : e5 03 __ SBC WORK + 0 
4a68 : aa __ __ TAX
4a69 : a5 08 __ LDA WORK + 5 
4a6b : e5 04 __ SBC WORK + 1 
4a6d : 90 04 __ BCC $4a73 ; (divmod32 + 126)
4a6f : 86 07 __ STX WORK + 4 
4a71 : 85 08 __ STA WORK + 5 
4a73 : 88 __ __ DEY
4a74 : d0 d3 __ BNE $4a49 ; (divmod32 + 84)
4a76 : 26 1b __ ROL ACCU + 0 
4a78 : 26 1c __ ROL ACCU + 1 
4a7a : 26 1d __ ROL ACCU + 2 
4a7c : 26 1e __ ROL ACCU + 3 
4a7e : a4 02 __ LDY $02 
4a80 : 60 __ __ RTS
4a81 : a0 10 __ LDY #$10
4a83 : a5 1e __ LDA ACCU + 3 
4a85 : 85 08 __ STA WORK + 5 
4a87 : a5 1d __ LDA ACCU + 2 
4a89 : 85 07 __ STA WORK + 4 
4a8b : a9 00 __ LDA #$00
4a8d : 85 1d __ STA ACCU + 2 
4a8f : 85 1e __ STA ACCU + 3 
4a91 : 18 __ __ CLC
4a92 : 26 1b __ ROL ACCU + 0 
4a94 : 26 1c __ ROL ACCU + 1 
4a96 : 26 07 __ ROL WORK + 4 
4a98 : 26 08 __ ROL WORK + 5 
4a9a : 26 09 __ ROL WORK + 6 
4a9c : 26 0a __ ROL WORK + 7 
4a9e : a5 07 __ LDA WORK + 4 
4aa0 : c5 03 __ CMP WORK + 0 
4aa2 : a5 08 __ LDA WORK + 5 
4aa4 : e5 04 __ SBC WORK + 1 
4aa6 : a5 09 __ LDA WORK + 6 
4aa8 : e5 05 __ SBC WORK + 2 
4aaa : aa __ __ TAX
4aab : a5 0a __ LDA WORK + 7 
4aad : e5 06 __ SBC WORK + 3 
4aaf : 90 11 __ BCC $4ac2 ; (divmod32 + 205)
4ab1 : 86 09 __ STX WORK + 6 
4ab3 : 85 0a __ STA WORK + 7 
4ab5 : a5 07 __ LDA WORK + 4 
4ab7 : e5 03 __ SBC WORK + 0 
4ab9 : 85 07 __ STA WORK + 4 
4abb : a5 08 __ LDA WORK + 5 
4abd : e5 04 __ SBC WORK + 1 
4abf : 85 08 __ STA WORK + 5 
4ac1 : 38 __ __ SEC
4ac2 : 88 __ __ DEY
4ac3 : d0 cd __ BNE $4a92 ; (divmod32 + 157)
4ac5 : 26 1b __ ROL ACCU + 0 
4ac7 : 26 1c __ ROL ACCU + 1 
4ac9 : a4 02 __ LDY $02 
4acb : 60 __ __ RTS
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4acc : a9 41 __ LDA #$41
4ace : 85 06 __ STA WORK + 3 
4ad0 : 4c 71 45 JMP $4571 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4ad3 : a9 db __ LDA #$db
4ad5 : 85 03 __ STA WORK + 0 
4ad7 : a9 0f __ LDA #$0f
4ad9 : 85 04 __ STA WORK + 1 
4adb : a9 c9 __ LDA #$c9
4add : 85 05 __ STA WORK + 2 
4adf : a9 3f __ LDA #$3f
4ae1 : 85 06 __ STA WORK + 3 
4ae3 : 4c 71 45 JMP $4571 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4ae6 : a9 3f __ LDA #$3f
4ae8 : 85 06 __ STA WORK + 3 
4aea : 4c 71 45 JMP $4571 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4aed : a9 89 __ LDA #$89
4aef : 85 03 __ STA WORK + 0 
4af1 : a9 3d __ LDA #$3d
4af3 : 85 06 __ STA WORK + 3 
4af5 : 4c 71 45 JMP $4571 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4af8 : a9 3d __ LDA #$3d
4afa : 85 06 __ STA WORK + 3 
4afc : 4c 71 45 JMP $4571 ; (freg + 20)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4aff : a5 57 __ LDA $57 
4b01 : 85 1b __ STA ACCU + 0 
4b03 : a5 58 __ LDA $58 
4b05 : 85 1c __ STA ACCU + 1 
4b07 : a5 59 __ LDA $59 
4b09 : 85 1d __ STA ACCU + 2 
4b0b : a5 5a __ LDA $5a 
4b0d : 85 1e __ STA ACCU + 3 
4b0f : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b12 : a5 53 __ LDA $53 
4b14 : 85 1b __ STA ACCU + 0 
4b16 : a5 54 __ LDA $54 
4b18 : 85 1c __ STA ACCU + 1 
4b1a : a5 55 __ LDA $55 
4b1c : 85 1d __ STA ACCU + 2 
4b1e : a5 56 __ LDA $56 
4b20 : 85 1e __ STA ACCU + 3 
4b22 : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b25 : ad d5 c7 LDA $c7d5 ; (d0 + 8)
4b28 : 85 1b __ STA ACCU + 0 
4b2a : ad d6 c7 LDA $c7d6 ; (d0 + 9)
4b2d : 85 1c __ STA ACCU + 1 
4b2f : ad d7 c7 LDA $c7d7 ; (d0 + 10)
4b32 : 85 1d __ STA ACCU + 2 
4b34 : ad d8 c7 LDA $c7d8 ; (d0 + 11)
4b37 : 85 1e __ STA ACCU + 3 
4b39 : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b3c : ad d1 c7 LDA $c7d1 ; (d0 + 4)
4b3f : 85 1b __ STA ACCU + 0 
4b41 : ad d2 c7 LDA $c7d2 ; (d0 + 5)
4b44 : 85 1c __ STA ACCU + 1 
4b46 : ad d3 c7 LDA $c7d3 ; (d0 + 6)
4b49 : 85 1d __ STA ACCU + 2 
4b4b : ad d4 c7 LDA $c7d4 ; (d0 + 7)
4b4e : 85 1e __ STA ACCU + 3 
4b50 : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b53 : a9 0c __ LDA #$0c
4b55 : 85 1d __ STA ACCU + 2 
4b57 : a9 43 __ LDA #$43
4b59 : 85 1e __ STA ACCU + 3 
4b5b : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b5e : a9 80 __ LDA #$80
4b60 : 85 1d __ STA ACCU + 2 
4b62 : a9 3f __ LDA #$3f
4b64 : 85 1e __ STA ACCU + 3 
4b66 : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b69 : a9 10 __ LDA #$10
4b6b : 85 1d __ STA ACCU + 2 
4b6d : a9 41 __ LDA #$41
4b6f : 85 1e __ STA ACCU + 3 
4b71 : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
freg@proxy: ; freg@proxy
4b74 : a5 43 __ LDA $43 
4b76 : 85 1b __ STA ACCU + 0 
4b78 : a5 44 __ LDA $44 
4b7a : 85 1c __ STA ACCU + 1 
4b7c : a5 45 __ LDA $45 
4b7e : 85 1d __ STA ACCU + 2 
4b80 : a5 46 __ LDA $46 
4b82 : 85 1e __ STA ACCU + 3 
4b84 : 4c 61 45 JMP $4561 ; (freg + 4)
--------------------------------------------------------------------
spentry:
4b87 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
SRect:
4b88 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
TinyFont:
4b90 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
4ba0 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
4bb0 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
4bc0 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
4bd0 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
4be0 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
4bf0 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
4c00 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
4c10 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
4c20 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
4c30 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
4c40 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
4c50 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
4c60 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
4c70 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
4c80 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
4c90 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
4ca0 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
4cb0 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
4cc0 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
4cd0 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
4ce0 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
4cf0 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
4d00 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
4d10 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
4d20 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
4d30 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
4d40 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
4d50 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
4d60 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
4d70 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
4d80 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
4d90 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
4da0 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
4db0 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
4dbb : __ __ __ BYT 80 4e 00 00 28 01 40 01                         : .N..(.@.
--------------------------------------------------------------------
lmask:
4dc3 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
4dcb : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
Screen:
4dd3 : __ __ __ BYT 00 e0 00 00 28 19 40 01                         : ....(.@.
--------------------------------------------------------------------
ubitmask:
4ddb : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
vlight:
4de3 : __ __ __ BSS	12
--------------------------------------------------------------------
NineShadesOfGrey:
4e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 00 88 00 22 00 88 00 : ........"..."...
4e10 : __ __ __ BYT 22 88 22 88 22 88 22 88 88 55 22 55 88 55 22 55 : "."."."..U"U.U"U
4e20 : __ __ __ BYT aa 55 aa 55 aa 55 aa 55 bb 55 ee 55 bb 55 ee 55 : .U.U.U.U.U.U.U.U
4e30 : __ __ __ BYT dd 77 dd 77 dd 77 dd 77 ff ee ff bb ff ee ff bb : .w.w.w.w........
4e40 : __ __ __ BYT ff ff ff ff ff ff ff ff                         : ........
--------------------------------------------------------------------
bitshift:
4e48 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
4e58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4e68 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
4e78 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
tbuffer:
4e80 : __ __ __ BSS	320
--------------------------------------------------------------------
wmat:
4fc0 : __ __ __ BSS	64
--------------------------------------------------------------------
BLIT_CODE:
5000 : __ __ __ BSS	224
--------------------------------------------------------------------
pmat:
5100 : __ __ __ BSS	64
--------------------------------------------------------------------
v:
5140 : __ __ __ BSS	11532
--------------------------------------------------------------------
rmat:
7e4c : __ __ __ BSS	64
--------------------------------------------------------------------
tmat:
7e8c : __ __ __ BSS	64
--------------------------------------------------------------------
p:
7ecc : __ __ __ BSS	3844
--------------------------------------------------------------------
z:
8dd0 : __ __ __ BSS	3844
--------------------------------------------------------------------
surfs:
9cd4 : __ __ __ BSS	5400
