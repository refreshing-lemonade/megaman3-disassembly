bank $03
org $A000

  LDA #$33                                  ; $03A000 |
  JSR code_1FF898                           ; $03A002 |
  LDA #$80                                  ; $03A005 |
  STA $0310                                 ; $03A007 |
  STA $0590                                 ; $03A00A |
  LDA $A139,y                               ; $03A00D |
  STA $05D0                                 ; $03A010 |
  LDA $A14B,y                               ; $03A013 |
  STA $0410                                 ; $03A016 |
  LDA $A15D,y                               ; $03A019 |
  STA $0430                                 ; $03A01C |
  LDA $A16F,y                               ; $03A01F |
  STA $0450                                 ; $03A022 |
  LDA $A181,y                               ; $03A025 |
  STA $0470                                 ; $03A028 |
  LDA $A193,y                               ; $03A02B |
  STA $03D0                                 ; $03A02E |
  LDA $A1A5,y                               ; $03A031 |
  STA $0370                                 ; $03A034 |
  LDX #$07                                  ; $03A037 |
code_03A039:
  LDA $A1D9,x                               ; $03A039 |
  STA $0610,x                               ; $03A03C |
  STA $0630,x                               ; $03A03F |
  DEX                                       ; $03A042 |
  BPL code_03A039                           ; $03A043 |
  LDA $A1B7,y                               ; $03A045 |
  JSR $938B                                 ; $03A048 |
  JSR update_CHR_banks                      ; $03A04B |
  LDA #$00                                  ; $03A04E |
  STA $05F0                                 ; $03A050 |
  STA $05B0                                 ; $03A053 |
  STA $0300                                 ; $03A056 |
  LDA #$40                                  ; $03A059 |
  STA $99                                   ; $03A05B |
code_03A05D:
  LDA $FC                                   ; $03A05D |
  CLC                                       ; $03A05F |
  ADC #$04                                  ; $03A060 |
  STA $FC                                   ; $03A062 |
  LDA $FD                                   ; $03A064 |
  ADC #$00                                  ; $03A066 |
  AND #$01                                  ; $03A068 |
  STA $FD                                   ; $03A06A |
  LDX #$10                                  ; $03A06C |
  JSR code_1FF797                           ; $03A06E |
  LDA $0470                                 ; $03A071 |
  BPL code_03A082                           ; $03A074 |
  LDA #$70                                  ; $03A076 |
  CMP $03D0                                 ; $03A078 |
  BCS code_03A082                           ; $03A07B |
  STA $03D0                                 ; $03A07D |
  BNE code_03A095                           ; $03A080 |
code_03A082:
  LDA $0350                                 ; $03A082 |
  CLC                                       ; $03A085 |
  ADC $0410                                 ; $03A086 |
  STA $0350                                 ; $03A089 |
  LDA $0370                                 ; $03A08C |
  ADC $0430                                 ; $03A08F |
  STA $0370                                 ; $03A092 |
code_03A095:
  JSR code_1FFD52                           ; $03A095 |
  LDA #$00                                  ; $03A098 |
  STA $05F0                                 ; $03A09A |
  LDA $FC                                   ; $03A09D |
  BNE code_03A05D                           ; $03A09F |
  LDA #$7E                                  ; $03A0A1 |
  STA $E9                                   ; $03A0A3 |
  JSR update_CHR_banks                      ; $03A0A5 |
  LDA #$3C                                  ; $03A0A8 |
code_03A0AA:
  PHA                                       ; $03A0AA |
  JSR code_1FFD52                           ; $03A0AB |
  LDA #$00                                  ; $03A0AE |
  STA $05F0                                 ; $03A0B0 |
  PLA                                       ; $03A0B3 |
  SEC                                       ; $03A0B4 |
  SBC #$01                                  ; $03A0B5 |
  BNE code_03A0AA                           ; $03A0B7 |
code_03A0B9:
  JSR code_1FFD52                           ; $03A0B9 |
  LDY $22                                   ; $03A0BC |
  LDA $A1C9,y                               ; $03A0BE |
  CMP $05B0                                 ; $03A0C1 |
  BNE code_03A0B9                           ; $03A0C4 |
  LDA #$03                                  ; $03A0C6 |
  STA $F5                                   ; $03A0C8 |
  JSR select_PRG_banks                      ; $03A0CA |
  JMP code_03A0D0                           ; $03A0CD |

code_03A0D0:
  LDA $60                                   ; $03A0D0 |
  BNE code_03A122                           ; $03A0D2 |
  LDA $FD                                   ; $03A0D4 |
  AND #$01                                  ; $03A0D6 |
  ASL                                       ; $03A0D8 |
  ASL                                       ; $03A0D9 |
  ORA #$22                                  ; $03A0DA |
  STA $0780                                 ; $03A0DC |
  LDA #$2B                                  ; $03A0DF |
  STA $0781                                 ; $03A0E1 |
  LDA #$00                                  ; $03A0E4 |
  STA $0782                                 ; $03A0E6 |
  STA $95                                   ; $03A0E9 |
  LDA #$FF                                  ; $03A0EB |
  STA $0784                                 ; $03A0ED |
  LDA $22                                   ; $03A0F0 |
  ASL                                       ; $03A0F2 |
  STA $00                                   ; $03A0F3 |
  ASL                                       ; $03A0F5 |
  ASL                                       ; $03A0F6 |
  ADC $00                                   ; $03A0F7 |
  STA $10                                   ; $03A0F9 |
code_03A0FB:
  LDY $10                                   ; $03A0FB |
  LDA $A1E1,y                               ; $03A0FD |
  STA $0783                                 ; $03A100 |
  INC $19                                   ; $03A103 |
  LDA #$00                                  ; $03A105 |
  STA $EE                                   ; $03A107 |
  JSR code_1FFF21                           ; $03A109 |
  INC $EE                                   ; $03A10C |
  INC $95                                   ; $03A10E |
  LDA $95                                   ; $03A110 |
  AND #$03                                  ; $03A112 |
  BNE code_03A0FB                           ; $03A114 |
  INC $10                                   ; $03A116 |
  INC $0781                                 ; $03A118 |
  LDA $0781                                 ; $03A11B |
  CMP #$35                                  ; $03A11E |
  BNE code_03A0FB                           ; $03A120 |
code_03A122:
  LDA #$00                                  ; $03A122 |
code_03A124:
  PHA                                       ; $03A124 |
  LDA #$00                                  ; $03A125 |
  STA $EE                                   ; $03A127 |
  JSR code_1FFF21                           ; $03A129 |
  INC $EE                                   ; $03A12C |
  PLA                                       ; $03A12E |
  SEC                                       ; $03A12F |
  SBC #$01                                  ; $03A130 |
  BNE code_03A124                           ; $03A132 |
  LDA #$00                                  ; $03A134 |
  STA $EE                                   ; $03A136 |
  RTS                                       ; $03A138 |

  db $36, $22, $26, $2B, $00, $45, $32, $1F ; $03A139 |
  db $3F, $65, $00, $65, $00, $00, $00, $65 ; $03A141 |
  db $00, $65, $89, $00, $77, $3C, $00, $C4 ; $03A149 |
  db $00, $00, $00, $89, $00, $77, $3C, $00 ; $03A151 |
  db $C4, $00, $00, $00, $03, $00, $FC, $02 ; $03A159 |
  db $00, $FD, $03, $00, $FD, $03, $00, $FC ; $03A161 |
  db $02, $00, $FD, $03, $00, $FD, $C0, $D4 ; $03A169 |
  db $C0, $79, $00, $79, $A8, $54, $A8, $C0 ; $03A171 |
  db $D4, $C0, $79, $00, $79, $A8, $54, $A8 ; $03A179 |
  db $FF, $02, $FF, $04, $00, $04, $05, $06 ; $03A181 |
  db $05, $FF, $02, $FF, $04, $00, $04, $05 ; $03A189 |
  db $06, $05, $30, $30, $30, $70, $70, $70 ; $03A191 |
  db $B0, $B0, $B0, $30, $30, $30, $70, $70 ; $03A199 |
  db $70, $B0, $B0, $B0, $30, $80, $D0, $30 ; $03A1A1 |
  db $80, $D0, $30, $80, $D0, $30, $80, $D0 ; $03A1A9 |
  db $30, $80, $D0, $30, $80, $D0, $28, $26 ; $03A1B1 |
  db $25, $24, $00, $2A, $27, $23, $29, $1E ; $03A1B9 |
  db $00, $1E, $00, $00, $00, $1E, $00, $1E ; $03A1C1 |
  db $04, $03, $05, $06, $02, $02, $08, $03 ; $03A1C9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03A1D1 |
  db $0F, $0F, $2C, $11, $0F, $0F, $30, $37 ; $03A1D9 |
  db $17, $0E, $0E, $0D, $15, $0E, $25, $16 ; $03A1E1 |
  db $0A, $17, $16, $0A, $10, $17, $0E, $1D ; $03A1E9 |
  db $25, $16, $0A, $17, $10, $0E, $16, $12 ; $03A1F1 |
  db $17, $12, $25, $16, $0A, $17, $11, $0A ; $03A1F9 |
  db $1B, $0D, $25, $25, $25, $16, $0A, $17 ; $03A201 |
  db $1D, $18, $19, $25, $25, $25, $25, $16 ; $03A209 |
  db $0A, $17, $1C, $17, $0A, $14, $0E, $25 ; $03A211 |
  db $25, $16, $0A, $17, $1C, $19, $0A, $1B ; $03A219 |
  db $14, $25, $25, $16, $0A, $17, $1C, $11 ; $03A221 |
  db $0A, $0D, $18, $20, $25, $16, $0A, $17 ; $03A229 |
  db $AE, $C0, $02, $C8, $AE, $C1, $02, $D0 ; $03A231 |
  db $B6, $C2, $02, $C8, $B6, $C3, $02, $D0 ; $03A239 |
  db $2F, $C4, $02, $C7, $2F, $C5, $02, $D0 ; $03A241 |
  db $AE, $DC, $02, $29, $AE, $DD, $02, $31 ; $03A249 |
  db $B6, $DE, $02, $29, $B6, $DF, $02, $31 ; $03A251 |
  db $67, $C6, $02, $28, $6F, $C7, $02, $20 ; $03A259 |
  db $6F, $C8, $02, $28, $6F, $C9, $02, $30 ; $03A261 |
  db $77, $CA, $02, $27, $77, $CB, $02, $2F ; $03A269 |
  db $6D, $D8, $02, $C8, $6D, $D9, $02, $D0 ; $03A271 |
  db $75, $DA, $02, $C8, $75, $DB, $02, $D0 ; $03A279 |
  db $7D, $EC, $02, $CC, $2B, $E0, $02, $78 ; $03A281 |
  db $2A, $E2, $02, $80, $33, $E1, $02, $78 ; $03A289 |
  db $32, $E3, $02, $80, $9E, $D4, $01, $79 ; $03A291 |
  db $9E, $D4, $01, $85, $A6, $D5, $01, $79 ; $03A299 |
  db $AE, $D6, $01, $79, $AE, $D7, $01, $81 ; $03A2A1 |
  db $1C, $CC, $01, $25, $1C, $CD, $01, $2D ; $03A2A9 |
  db $24, $CE, $01, $24, $24, $CF, $01, $2D ; $03A2B1 |
  db $24, $D0, $01, $35, $34, $D1, $02, $25 ; $03A2B9 |
  db $34, $D2, $02, $2D, $34, $D3, $02, $35 ; $03A2C1 |
  db $67, $E6, $03, $74, $67, $6F, $03, $7C ; $03A2C9 |
  db $67, $E6, $43, $84, $6F, $E7, $03, $74 ; $03A2D1 |
  db $6F, $E8, $03, $7C, $6F, $E7, $43, $84 ; $03A2D9 |
  db $77, $E9, $03, $74, $77, $EA, $03, $7C ; $03A2E1 |
  db $77, $EB, $03, $84, $58, $E4, $00, $67 ; $03A2E9 |
  db $58, $E4, $00, $91, $7E, $E4, $00, $67 ; $03A2F1 |
  db $7E, $E4, $00, $91, $22, $EA, $0F, $1C ; $03A2F9 |
  db $1D, $0A, $10, $0E, $25, $25, $1C, $0E ; $03A301 |
  db $15, $0E, $0C, $1D, $25, $25, $25, $23 ; $03A309 |
  db $2A, $0A, $19, $0A, $1C, $1C, $25, $25 ; $03A311 |
  db $25, $20, $18, $1B, $0D, $21, $D7, $02 ; $03A319 |
  db $34, $17, $0D, $FF, $23, $0A, $0A, $10 ; $03A321 |
  db $0A, $16, $0E, $25, $25, $25, $18, $1F ; $03A329 |
  db $0E, $1B, $21, $D7, $02, $34, $17, $0D ; $03A331 |
  db $FF, $22, $EA, $0C, $1C, $1D, $0A, $10 ; $03A339 |
  db $0E, $25, $25, $1C, $0E, $15, $0E, $0C ; $03A341 |
  db $1D, $23, $0A, $0A, $25, $25, $25, $25 ; $03A349 |
  db $25, $25, $25, $25, $25, $25, $25, $23 ; $03A351 |
  db $2A, $07, $0C, $18, $17, $1D, $12, $17 ; $03A359 |
  db $1E, $0E, $21, $D7, $02, $34, $17, $0D ; $03A361 |
  db $FF, $20, $4A, $0B, $19, $1E, $1C, $11 ; $03A369 |
  db $25, $25, $25, $1C, $1D, $0A, $1B, $1D ; $03A371 |
  db $21, $23, $05, $1C, $19, $0A, $1B, $14 ; $03A379 |
  db $25, $21, $2D, $05, $1C, $17, $0A, $14 ; $03A381 |
  db $0E, $25, $21, $37, $05, $17, $0E, $0E ; $03A389 |
  db $0D, $15, $0E, $21, $43, $05, $25, $25 ; $03A391 |
  db $25, $16, $0A, $17, $21, $4D, $05, $25 ; $03A399 |
  db $25, $25, $16, $0A, $17, $21, $57, $05 ; $03A3A1 |
  db $25, $25, $25, $16, $0A, $17, $FF, $22 ; $03A3A9 |
  db $23, $05, $11, $0A, $1B, $0D, $25, $25 ; $03A3B1 |
  db $22, $37, $05, $1D, $18, $19, $25, $25 ; $03A3B9 |
  db $25, $22, $43, $05, $25, $25, $25, $16 ; $03A3C1 |
  db $0A, $17, $22, $57, $05, $25, $25, $25 ; $03A3C9 |
  db $16, $0A, $17, $23, $23, $05, $10, $0E ; $03A3D1 |
  db $16, $12, $17, $12, $23, $2D, $05, $16 ; $03A3D9 |
  db $0A, $10, $17, $0E, $1D, $23, $37, $05 ; $03A3E1 |
  db $1C, $11, $0A, $0D, $18, $20, $23, $43 ; $03A3E9 |
  db $05, $25, $25, $25, $16, $0A, $17, $23 ; $03A3F1 |
  db $4D, $05, $25, $25, $25, $16, $0A, $17 ; $03A3F9 |
  db $23, $57, $05, $25, $25, $25, $16, $0A ; $03A401 |
  db $17, $FF, $21, $88, $06, $22, $18, $1E ; $03A409 |
  db $25, $10, $18, $1D, $FF, $21, $E5, $0C ; $03A411 |
  db $17, $0E, $0E, $0D, $15, $0E, $25, $0C ; $03A419 |
  db $0A, $17, $17, $18, $17, $22, $4A, $02 ; $03A421 |
  db $0A, $17, $0D, $22, $88, $08, $1B, $1E ; $03A429 |
  db $1C, $11, $25, $25, $13, $0E, $1D, $FF ; $03A431 |
  db $21, $E5, $0D, $16, $0A, $10, $17, $0E ; $03A439 |
  db $1D, $25, $16, $12, $1C, $1C, $12, $15 ; $03A441 |
  db $0E, $FF, $21, $E5, $0B, $10, $0E, $16 ; $03A449 |
  db $12, $17, $12, $25, $15, $0A, $1C, $0E ; $03A451 |
  db $1B, $FF, $21, $E7, $0B, $11, $0A, $1B ; $03A459 |
  db $0D, $25, $14, $17, $1E, $0C, $14, $15 ; $03A461 |
  db $0E, $FF, $21, $E7, $07, $1D, $18, $19 ; $03A469 |
  db $25, $1C, $19, $12, $17, $FF, $21, $E7 ; $03A471 |
  db $0B, $1C, $0E, $0A, $1B, $0C, $11, $25 ; $03A479 |
  db $1C, $17, $0A, $14, $0E, $FF, $21, $E6 ; $03A481 |
  db $0A, $1C, $19, $0A, $1B, $14, $25, $1C ; $03A489 |
  db $11, $18, $0C, $14, $FF, $21, $E5, $0B ; $03A491 |
  db $1C, $11, $0A, $0D, $18, $20, $25, $0B ; $03A499 |
  db $15, $0A, $0D, $0E, $22, $4A, $02, $0A ; $03A4A1 |
  db $17, $0D, $22, $88, $0A, $1B, $1E, $1C ; $03A4A9 |
  db $11, $25, $16, $0A, $1B, $12, $17, $0E ; $03A4B1 |
  db $FF, $22, $2D, $05, $0B, $1B, $0E, $0A ; $03A4B9 |
  db $14, $25, $22, $4D, $05, $25, $25, $25 ; $03A4C1 |
  db $16, $0A, $17, $FF, $22, $EA, $0F, $19 ; $03A4C9 |
  db $0A, $1C, $1C, $25, $20, $18, $1B, $0D ; $03A4D1 |
  db $25, $0E, $1B, $1B, $18, $1B, $29, $23 ; $03A4D9 |
  db $2A, $0A, $25, $25, $25, $25, $25, $25 ; $03A4E1 |
  db $25, $25, $25, $25, $25, $FF, $21, $67 ; $03A4E9 |
  db $12, $3C, $01, $09, $09, $00, $25, $0C ; $03A4F1 |
  db $0A, $19, $0C, $18, $16, $25, $0C, $18 ; $03A4F9 |
  db $26, $15, $1D, $0D, $21, $A1, $1E, $1D ; $03A501 |
  db $16, $25, $0A, $17, $0D, $25, $3C, $01 ; $03A509 |
  db $09, $09, $00, $25, $0C, $0A, $19, $0C ; $03A511 |
  db $18, $16, $25, $1E, $26, $1C, $26, $0A ; $03A519 |
  db $26, $27, $12, $17, $0C, $26, $FF, $21 ; $03A521 |
  db $EB, $0A, $15, $12, $0C, $0E, $17, $1C ; $03A529 |
  db $0E, $0D, $25, $0B, $22, $22, $24, $18 ; $03A531 |
  db $17, $12, $17, $1D, $0E, $17, $0D, $18 ; $03A539 |
  db $25, $18, $0F, $25, $0A, $16, $0E, $1B ; $03A541 |
  db $12, $0C, $0A, $26, $25, $12, $17, $0C ; $03A549 |
  db $26, $FF, $22, $EA, $0F, $1C, $1D, $0A ; $03A551 |
  db $10, $0E, $25, $25, $1C, $0E, $15, $0E ; $03A559 |
  db $0C, $1D, $25, $25, $25, $21, $D7, $02 ; $03A561 |
  db $34, $17, $0D, $FF, $FD, $25, $3A, $6A ; $03A569 |
  db $B0, $0B, $16, $39, $4B, $5B, $6B, $77 ; $03A571 |
  db $87, $96, $BA, $CD, $EF, $28, $53, $A2 ; $03A579 |
  db $A3, $A3, $A3, $A3, $A4, $A4, $A4, $A4 ; $03A581 |
  db $A4, $A4, $A4, $A4, $A4, $A4, $A4, $A4 ; $03A589 |
  db $A5, $A5                               ; $03A591 |

code_03A593:
  LDA #$00                                  ; $03A593 |
  STA $11                                   ; $03A595 |
  LDY #$2F                                  ; $03A597 |
code_03A599:
  STA $0150,y                               ; $03A599 |
  DEY                                       ; $03A59C |
  BPL code_03A599                           ; $03A59D |
  LDA #$24                                  ; $03A59F |
  STA $10                                   ; $03A5A1 |
  LDY #$14                                  ; $03A5A3 |
code_03A5A5:
  LDA $A6FF,y                               ; $03A5A5 |
  STA $0204,y                               ; $03A5A8 |
  LDA $A700,y                               ; $03A5AB |
  STA $0205,y                               ; $03A5AE |
  LDA $A701,y                               ; $03A5B1 |
  STA $0206,y                               ; $03A5B4 |
  LDA $A702,y                               ; $03A5B7 |
  STA $0207,y                               ; $03A5BA |
  DEY                                       ; $03A5BD |
  DEY                                       ; $03A5BE |
  DEY                                       ; $03A5BF |
  DEY                                       ; $03A5C0 |
  BPL code_03A5A5                           ; $03A5C1 |
code_03A5C3:
  LDA $14                                   ; $03A5C3 |
  AND #$80                                  ; $03A5C5 |
  BNE code_03A603                           ; $03A5C7 |
  LDA $14                                   ; $03A5C9 |
  AND #$03                                  ; $03A5CB |
  BEQ code_03A5E2                           ; $03A5CD |
  LDA $10                                   ; $03A5CF |
  CMP #$26                                  ; $03A5D1 |
  BEQ code_03A5F2                           ; $03A5D3 |
  LDA #$24                                  ; $03A5D5 |
  CMP $10                                   ; $03A5D7 |
  BNE code_03A5DD                           ; $03A5D9 |
  LDA #$25                                  ; $03A5DB |
code_03A5DD:
  STA $10                                   ; $03A5DD |
  JMP code_03A5F2                           ; $03A5DF |

code_03A5E2:
  LDA $14                                   ; $03A5E2 |
  AND #$0C                                  ; $03A5E4 |
  BEQ code_03A5F2                           ; $03A5E6 |
  LDA #$26                                  ; $03A5E8 |
  CMP $10                                   ; $03A5EA |
  BNE code_03A5F0                           ; $03A5EC |
  LDA #$24                                  ; $03A5EE |
code_03A5F0:
  STA $10                                   ; $03A5F0 |
code_03A5F2:
  JSR code_03A681                           ; $03A5F2 |
  LDA #$00                                  ; $03A5F5 |
  STA $EE                                   ; $03A5F7 |
  JSR code_1FFF21                           ; $03A5F9 |
  INC $EE                                   ; $03A5FC |
  INC $95                                   ; $03A5FE |
  JMP code_03A5C3                           ; $03A600 |

code_03A603:
  LDA $10                                   ; $03A603 |
  CMP #$26                                  ; $03A605 |
  BNE code_03A60C                           ; $03A607 |
  JMP code_03A765                           ; $03A609 |

code_03A60C:
  LDA $10                                   ; $03A60C |
  AND #$01                                  ; $03A60E |
  STA $13                                   ; $03A610 |
  LDA #$00                                  ; $03A612 |
  STA $10                                   ; $03A614 |
  LDA #$00                                  ; $03A616 |
  STA $11                                   ; $03A618 |
  BEQ code_03A66D                           ; $03A61A |
code_03A61C:
  LDA $14                                   ; $03A61C |
  AND #$40                                  ; $03A61E |
  BEQ code_03A62D                           ; $03A620 |
  LDA #$24                                  ; $03A622 |
  STA $10                                   ; $03A624 |
  LDA #$00                                  ; $03A626 |
  STA $11                                   ; $03A628 |
  JMP code_03A5C3                           ; $03A62A |

code_03A62D:
  LDA $14                                   ; $03A62D |
  AND #$80                                  ; $03A62F |
  BEQ code_03A66D                           ; $03A631 |
  LDA $10                                   ; $03A633 |
  CLC                                       ; $03A635 |
  ADC $11                                   ; $03A636 |
  TAY                                       ; $03A638 |
  ASL                                       ; $03A639 |
  ASL                                       ; $03A63A |
  TAX                                       ; $03A63B |
  LDA $0150,y                               ; $03A63C |
  BPL code_03A64D                           ; $03A63F |
  LDA #$F8                                  ; $03A641 |
  STA $021C,x                               ; $03A643 |
  LDA #$00                                  ; $03A646 |
  STA $0150,y                               ; $03A648 |
  BEQ code_03A66D                           ; $03A64B |
code_03A64D:
  LDA #$F0                                  ; $03A64D |
  ORA $13                                   ; $03A64F |
  STA $0150,y                               ; $03A651 |
  LDA $A73E,y                               ; $03A654 |
  STA $021C,x                               ; $03A657 |
  LDA #$E4                                  ; $03A65A |
  CLC                                       ; $03A65C |
  ADC $13                                   ; $03A65D |
  STA $021D,x                               ; $03A65F |
  LDA #$00                                  ; $03A662 |
  STA $021E,x                               ; $03A664 |
  LDA $A717,y                               ; $03A667 |
  STA $021F,x                               ; $03A66A |
code_03A66D:
  JSR code_03A6AF                           ; $03A66D |
  JSR code_03A681                           ; $03A670 |
  LDA #$00                                  ; $03A673 |
  STA $EE                                   ; $03A675 |
  JSR code_1FFF21                           ; $03A677 |
  INC $EE                                   ; $03A67A |
  INC $95                                   ; $03A67C |
  JMP code_03A61C                           ; $03A67E |

code_03A681:
  LDA $10                                   ; $03A681 |
  CLC                                       ; $03A683 |
  ADC $11                                   ; $03A684 |
  TAY                                       ; $03A686 |
  LDA $A717,y                               ; $03A687 |
  STA $00                                   ; $03A68A |
  LDA $A73E,y                               ; $03A68C |
  STA $01                                   ; $03A68F |
  LDX #$0C                                  ; $03A691 |
  LDY #$03                                  ; $03A693 |
code_03A695:
  LDA $00                                   ; $03A695 |
  CLC                                       ; $03A697 |
  ADC $A6FB,y                               ; $03A698 |
  STA $0207,x                               ; $03A69B |
  LDA $01                                   ; $03A69E |
  CLC                                       ; $03A6A0 |
  ADC $A6F7,y                               ; $03A6A1 |
  STA $0204,x                               ; $03A6A4 |
  DEX                                       ; $03A6A7 |
  DEX                                       ; $03A6A8 |
  DEX                                       ; $03A6A9 |
  DEX                                       ; $03A6AA |
  DEY                                       ; $03A6AB |
  BPL code_03A695                           ; $03A6AC |
  RTS                                       ; $03A6AE |

code_03A6AF:
  LDA $14                                   ; $03A6AF |
  AND #$03                                  ; $03A6B1 |
  BEQ code_03A6CF                           ; $03A6B3 |
  AND #$01                                  ; $03A6B5 |
  BEQ code_03A6C7                           ; $03A6B7 |
  INC $10                                   ; $03A6B9 |
  LDA $10                                   ; $03A6BB |
  CMP #$06                                  ; $03A6BD |
  BNE code_03A6CF                           ; $03A6BF |
  LDA #$00                                  ; $03A6C1 |
  STA $10                                   ; $03A6C3 |
  BEQ code_03A6CF                           ; $03A6C5 |
code_03A6C7:
  DEC $10                                   ; $03A6C7 |
  BPL code_03A6CF                           ; $03A6C9 |
  LDA #$05                                  ; $03A6CB |
  STA $10                                   ; $03A6CD |
code_03A6CF:
  LDA $14                                   ; $03A6CF |
  AND #$0C                                  ; $03A6D1 |
  BEQ code_03A6F6                           ; $03A6D3 |
  AND #$04                                  ; $03A6D5 |
  BNE code_03A6E7                           ; $03A6D7 |
  LDA $11                                   ; $03A6D9 |
  SEC                                       ; $03A6DB |
  SBC #$06                                  ; $03A6DC |
  STA $11                                   ; $03A6DE |
  BCS code_03A6E6                           ; $03A6E0 |
  LDA #$1E                                  ; $03A6E2 |
  STA $11                                   ; $03A6E4 |
code_03A6E6:
  RTS                                       ; $03A6E6 |

code_03A6E7:
  LDA $11                                   ; $03A6E7 |
  CLC                                       ; $03A6E9 |
  ADC #$06                                  ; $03A6EA |
  STA $11                                   ; $03A6EC |
  CMP #$1F                                  ; $03A6EE |
  BCC code_03A6F6                           ; $03A6F0 |
  LDA #$00                                  ; $03A6F2 |
  STA $11                                   ; $03A6F4 |
code_03A6F6:
  RTS                                       ; $03A6F6 |

  db $FC, $FC, $04, $04, $FC, $04, $FC, $04 ; $03A6F7 |
  db $3B, $EE, $00, $B4, $3B, $EE, $40, $BC ; $03A6FF |
  db $43, $EE, $80, $B4, $43, $EE, $C0, $BC ; $03A707 |
  db $3F, $E4, $00, $B8, $3F, $E5, $00, $C8 ; $03A70F |
  db $38, $48, $58, $68, $78, $88, $38, $48 ; $03A717 |
  db $58, $68, $78, $88, $38, $48, $58, $68 ; $03A71F |
  db $78, $88, $38, $48, $58, $68, $78, $88 ; $03A727 |
  db $38, $48, $58, $68, $78, $88, $38, $48 ; $03A72F |
  db $58, $68, $78, $88, $B8, $C8, $C0, $27 ; $03A737 |
  db $27, $27, $27, $27, $27, $37, $37, $37 ; $03A73F |
  db $37, $37, $37, $47, $47, $47, $47, $47 ; $03A747 |
  db $47, $5F, $5F, $5F, $5F, $5F, $5F, $6F ; $03A74F |
  db $6F, $6F, $6F, $6F, $6F, $7F, $7F, $7F ; $03A757 |
  db $7F, $7F, $7F, $3F, $3F, $70           ; $03A75F |

code_03A765:
  LDA #$00                                  ; $03A765 |
  STA $60                                   ; $03A767 |
  STA $61                                   ; $03A769 |
  STA $EE                                   ; $03A76B |
  LDY #$0C                                  ; $03A76D |
code_03A76F:
  LDX $A9DF,y                               ; $03A76F |
  LDA $0150,x                               ; $03A772 |
  BNE code_03A77C                           ; $03A775 |
  DEY                                       ; $03A777 |
  BPL code_03A76F                           ; $03A778 |
  BMI code_03A7A6                           ; $03A77A |
code_03A77C:
  LDA $FD                                   ; $03A77C |
  ASL                                       ; $03A77E |
  ASL                                       ; $03A77F |
  AND #$04                                  ; $03A780 |
  STA $10                                   ; $03A782 |
  LDX #$0F                                  ; $03A784 |
  JSR $939E                                 ; $03A786 |
  LDX #$B4                                  ; $03A789 |
  JSR code_1FFF1A                           ; $03A78B |
  LDX #$00                                  ; $03A78E |
  JSR $939E                                 ; $03A790 |
  LDY #$04                                  ; $03A793 |
  LDA #$F8                                  ; $03A795 |
code_03A797:
  STA $0200,y                               ; $03A797 |
  INY                                       ; $03A79A |
  INY                                       ; $03A79B |
  INY                                       ; $03A79C |
  INY                                       ; $03A79D |
  BNE code_03A797                           ; $03A79E |
  JSR code_1FFF21                           ; $03A7A0 |
  JMP code_03A593                           ; $03A7A3 |

code_03A7A6:
  LDY #$00                                  ; $03A7A6 |
code_03A7A8:
  LDX $A9B1,y                               ; $03A7A8 |
  LDA $0150,x                               ; $03A7AB |
  BEQ code_03A804                           ; $03A7AE |
  AND #$01                                  ; $03A7B0 |
  BEQ code_03A7C4                           ; $03A7B2 |
  LDX $A9B7,y                               ; $03A7B4 |
  LDA $0150,x                               ; $03A7B7 |
  BNE code_03A77C                           ; $03A7BA |
  LDA $A9C8,y                               ; $03A7BC |
  ORA $A9CE,y                               ; $03A7BF |
  BNE code_03A7CF                           ; $03A7C2 |
code_03A7C4:
  LDX $A9B7,y                               ; $03A7C4 |
  LDA $0150,x                               ; $03A7C7 |
  BNE code_03A77C                           ; $03A7CA |
  LDA $A9C8,y                               ; $03A7CC |
code_03A7CF:
  ORA $61                                   ; $03A7CF |
  STA $61                                   ; $03A7D1 |
code_03A7D3:
  INY                                       ; $03A7D3 |
  CPY #$04                                  ; $03A7D4 |
  BCC code_03A7A8                           ; $03A7D6 |
  CPY #$06                                  ; $03A7D8 |
  BEQ code_03A816                           ; $03A7DA |
  LDA $60                                   ; $03A7DC |
  BNE code_03A7A8                           ; $03A7DE |
  LDA $61                                   ; $03A7E0 |
  CMP #$FF                                  ; $03A7E2 |
  BNE code_03A7F0                           ; $03A7E4 |
  LDA #$09                                  ; $03A7E6 |
  STA $60                                   ; $03A7E8 |
  LDA #$3A                                  ; $03A7EA |
  STA $61                                   ; $03A7EC |
  BNE code_03A7A8                           ; $03A7EE |
code_03A7F0:
  LDA $0157                                 ; $03A7F0 |
  ORA $0150                                 ; $03A7F3 |
  ORA $015B                                 ; $03A7F6 |
  ORA $0153                                 ; $03A7F9 |
  ORA $0168                                 ; $03A7FC |
  BEQ code_03A833                           ; $03A7FF |
  JMP code_03A77C                           ; $03A801 |

code_03A804:
  LDX $A9B7,y                               ; $03A804 |
  LDA $0150,x                               ; $03A807 |
  BEQ code_03A7D3                           ; $03A80A |
  LDA $61                                   ; $03A80C |
  ORA $A9CE,y                               ; $03A80E |
  STA $61                                   ; $03A811 |
  JMP code_03A7D3                           ; $03A813 |

code_03A816:
  LDA $61                                   ; $03A816 |
  CMP #$FF                                  ; $03A818 |
  BNE code_03A82B                           ; $03A81A |
  LDA #$12                                  ; $03A81C |
  STA $60                                   ; $03A81E |
  LDA $0168                                 ; $03A820 |
  BEQ code_03A833                           ; $03A823 |
  LDA #$FF                                  ; $03A825 |
  STA $60                                   ; $03A827 |
  BNE code_03A833                           ; $03A829 |
code_03A82B:
  LDA $0168                                 ; $03A82B |
  BEQ code_03A833                           ; $03A82E |
  JMP code_03A77C                           ; $03A830 |

code_03A833:
  LDY #$09                                  ; $03A833 |
  LDA #$01                                  ; $03A835 |
  STA $00                                   ; $03A837 |
code_03A839:
  LDX $A9BE,y                               ; $03A839 |
  LDA $0150,x                               ; $03A83C |
  BEQ code_03A843                           ; $03A83F |
  DEC $00                                   ; $03A841 |
code_03A843:
  DEY                                       ; $03A843 |
  BPL code_03A839                           ; $03A844 |
  LDA $00                                   ; $03A846 |
  BEQ code_03A84D                           ; $03A848 |
  JMP code_03A77C                           ; $03A84A |

code_03A84D:
  LDY #$09                                  ; $03A84D |
code_03A84F:
  LDX $A9BE,y                               ; $03A84F |
  LDA $0150,x                               ; $03A852 |
  BNE code_03A85D                           ; $03A855 |
  DEY                                       ; $03A857 |
  BPL code_03A84F                           ; $03A858 |
  JMP code_03A77C                           ; $03A85A |

code_03A85D:
  JSR code_03A88E                           ; $03A85D |
  LDA $A9D5,y                               ; $03A860 |
  STA $AF                                   ; $03A863 |
  LDY #$04                                  ; $03A865 |
  LDA #$F8                                  ; $03A867 |
code_03A869:
  STA $0200,y                               ; $03A869 |
  DEY                                       ; $03A86C |
  DEY                                       ; $03A86D |
  DEY                                       ; $03A86E |
  DEY                                       ; $03A86F |
  BNE code_03A869                           ; $03A870 |
  LDA $60                                   ; $03A872 |
  BMI code_03A879                           ; $03A874 |
  JMP $9212                                 ; $03A876 |

code_03A879:
  PLA                                       ; $03A879 |
  PLA                                       ; $03A87A |
  LDA #$80                                  ; $03A87B |
  STA $74                                   ; $03A87D |
  LDA #$00                                  ; $03A87F |
  STA $75                                   ; $03A881 |
  LDY #$1F                                  ; $03A883 |
code_03A885:
  STA $0150,y                               ; $03A885 |
  DEY                                       ; $03A888 |
  BPL code_03A885                           ; $03A889 |
  JMP code_1ECBCE                           ; $03A88B |

code_03A88E:
  STY $00                                   ; $03A88E |
  LDY #$00                                  ; $03A890 |
code_03A892:
  LDX $A9B1,y                               ; $03A892 |
  LDA $0150,x                               ; $03A895 |
  BEQ code_03A8A9                           ; $03A898 |
  PHA                                       ; $03A89A |
  LDX $A9EC,y                               ; $03A89B |
  LDA #$9C                                  ; $03A89E |
  STA $A2,x                                 ; $03A8A0 |
  PLA                                       ; $03A8A2 |
  AND #$01                                  ; $03A8A3 |
  BEQ code_03A8B8                           ; $03A8A5 |
  BNE code_03A8B1                           ; $03A8A7 |
code_03A8A9:
  LDX $A9B7,y                               ; $03A8A9 |
  LDA $0150,x                               ; $03A8AC |
  BEQ code_03A8B8                           ; $03A8AF |
code_03A8B1:
  LDX $A9F2,y                               ; $03A8B1 |
  LDA #$9C                                  ; $03A8B4 |
  STA $A2,x                                 ; $03A8B6 |
code_03A8B8:
  INY                                       ; $03A8B8 |
  CPY #$04                                  ; $03A8B9 |
  BNE code_03A892                           ; $03A8BB |
  LDA #$9C                                  ; $03A8BD |
  STA $A9                                   ; $03A8BF |
  LDY $0164                                 ; $03A8C1 |
  BEQ code_03A8C8                           ; $03A8C4 |
  STA $AD                                   ; $03A8C6 |
code_03A8C8:
  LDY $0167                                 ; $03A8C8 |
  BNE code_03A8D4                           ; $03A8CB |
  LDY $0171                                 ; $03A8CD |
  CPY #$F1                                  ; $03A8D0 |
  BNE code_03A8D6                           ; $03A8D2 |
code_03A8D4:
  STA $AB                                   ; $03A8D4 |
code_03A8D6:
  LDA #$02                                  ; $03A8D6 |
  STA $AE                                   ; $03A8D8 |
  LDY $00                                   ; $03A8DA |
  RTS                                       ; $03A8DC |

  LDA $61                                   ; $03A8DD |
  STA $10                                   ; $03A8DF |
  LDA $60                                   ; $03A8E1 |
  BEQ code_03A8E9                           ; $03A8E3 |
  LDA #$FF                                  ; $03A8E5 |
  STA $10                                   ; $03A8E7 |
code_03A8E9:
  LDY #$00                                  ; $03A8E9 |
code_03A8EB:
  LDA #$00                                  ; $03A8EB |
  STA $13                                   ; $03A8ED |
  LDA $10                                   ; $03A8EF |
  AND #$03                                  ; $03A8F1 |
  BEQ code_03A90B                           ; $03A8F3 |
  CMP #$03                                  ; $03A8F5 |
  BEQ code_03A906                           ; $03A8F7 |
  AND #$01                                  ; $03A8F9 |
  BNE code_03A908                           ; $03A8FB |
  LDA $A9B7,y                               ; $03A8FD |
  JSR code_03A988                           ; $03A900 |
  JMP code_03A90B                           ; $03A903 |

code_03A906:
  INC $13                                   ; $03A906 |
code_03A908:
  JSR code_03A985                           ; $03A908 |
code_03A90B:
  LSR $10                                   ; $03A90B |
  LSR $10                                   ; $03A90D |
  INY                                       ; $03A90F |
  CPY #$04                                  ; $03A910 |
  BNE code_03A8EB                           ; $03A912 |
  LDA $61                                   ; $03A914 |
  STA $10                                   ; $03A916 |
  LDA $60                                   ; $03A918 |
  BEQ code_03A975                           ; $03A91A |
  CMP #$12                                  ; $03A91C |
  BCC code_03A924                           ; $03A91E |
  LDA #$FF                                  ; $03A920 |
  STA $10                                   ; $03A922 |
code_03A924:
  LDA #$00                                  ; $03A924 |
  STA $13                                   ; $03A926 |
  LDY #$04                                  ; $03A928 |
  LDA $10                                   ; $03A92A |
  AND #$05                                  ; $03A92C |
  BEQ code_03A946                           ; $03A92E |
  CMP #$05                                  ; $03A930 |
  BEQ code_03A941                           ; $03A932 |
  AND #$01                                  ; $03A934 |
  BNE code_03A943                           ; $03A936 |
  LDA $A9B7,y                               ; $03A938 |
  JSR code_03A988                           ; $03A93B |
  JMP code_03A946                           ; $03A93E |

code_03A941:
  INC $13                                   ; $03A941 |
code_03A943:
  JSR code_03A985                           ; $03A943 |
code_03A946:
  LDA #$00                                  ; $03A946 |
  STA $13                                   ; $03A948 |
  LDY #$05                                  ; $03A94A |
  LDA $10                                   ; $03A94C |
  AND #$C0                                  ; $03A94E |
  BEQ code_03A968                           ; $03A950 |
  CMP #$C0                                  ; $03A952 |
  BEQ code_03A963                           ; $03A954 |
  AND #$40                                  ; $03A956 |
  BNE code_03A965                           ; $03A958 |
  LDA $A9B7,y                               ; $03A95A |
  JSR code_03A988                           ; $03A95D |
  JMP code_03A968                           ; $03A960 |

code_03A963:
  INC $13                                   ; $03A963 |
code_03A965:
  JSR code_03A985                           ; $03A965 |
code_03A968:
  LDA $60                                   ; $03A968 |
  BPL code_03A975                           ; $03A96A |
  LDA #$00                                  ; $03A96C |
  STA $13                                   ; $03A96E |
  LDY #$0C                                  ; $03A970 |
  JSR code_03A985                           ; $03A972 |
code_03A975:
  LDA #$00                                  ; $03A975 |
  STA $13                                   ; $03A977 |
  LDA $AF                                   ; $03A979 |
  CMP #$09                                  ; $03A97B |
  BCC code_03A981                           ; $03A97D |
  LDA #$09                                  ; $03A97F |
code_03A981:
  CLC                                       ; $03A981 |
  ADC #$0D                                  ; $03A982 |
  TAY                                       ; $03A984 |
code_03A985:
  LDA $A9B1,y                               ; $03A985 |
code_03A988:
  STY $00                                   ; $03A988 |
  TAY                                       ; $03A98A |
  ASL                                       ; $03A98B |
  ASL                                       ; $03A98C |
  TAX                                       ; $03A98D |
  LDA #$F0                                  ; $03A98E |
  ORA $13                                   ; $03A990 |
  STA $0150,y                               ; $03A992 |
  LDA $A73E,y                               ; $03A995 |
  STA $021C,x                               ; $03A998 |
  LDA #$E4                                  ; $03A99B |
  CLC                                       ; $03A99D |
  ADC $13                                   ; $03A99E |
  STA $021D,x                               ; $03A9A0 |
  LDA #$00                                  ; $03A9A3 |
  STA $021E,x                               ; $03A9A5 |
  LDA $A717,y                               ; $03A9A8 |
  STA $021F,x                               ; $03A9AB |
  LDY $00                                   ; $03A9AE |
  RTS                                       ; $03A9B0 |

  db $14, $0A, $02, $21, $07, $00, $22, $0F ; $03A9B1 |
  db $23, $17, $0B, $03, $18, $10, $1D, $1B ; $03A9B9 |
  db $09, $04, $0C, $13, $0E, $1F, $05, $01 ; $03A9C1 |
  db $04, $10, $40, $3B, $7A, $02, $08, $20 ; $03A9C9 |
  db $80, $3E, $BA, $FF, $00, $01, $02, $03 ; $03A9D1 |
  db $04, $05, $06, $07, $08, $09, $01, $06 ; $03A9D9 |
  db $08, $0D, $11, $12, $15, $16, $19, $1A ; $03A9E1 |
  db $1C, $1E, $20, $02, $01, $05, $08, $00 ; $03A9E9 |
  db $00, $04, $03, $06, $0A, $00, $24, $80 ; $03A9F1 |
  db $58, $80, $D0, $82, $91, $80, $00, $00 ; $03A9F9 |
  db $01, $02, $03, $04, $05, $06, $07, $08 ; $03AA01 |
  db $09, $0A, $0B, $0C, $0D, $0E, $0F, $10 ; $03AA09 |
  db $11, $12, $13, $14, $15, $16, $17, $18 ; $03AA11 |
  db $42, $00, $00, $20, $00, $00, $C0, $00 ; $03AA19 |
  db $20, $80, $20, $80, $00, $00, $04, $03 ; $03AA21 |
  db $10, $00, $44, $00, $21, $02, $12, $15 ; $03AA29 |
  db $06, $06, $28, $08, $52, $20, $44, $22 ; $03AA31 |
  db $38, $22, $41, $08, $40, $02, $00, $25 ; $03AA39 |
  db $80, $A2, $80, $80, $A3, $80, $A1, $40 ; $03AA41 |
  db $40, $60, $20, $20, $80, $00, $20, $00 ; $03AA49 |
  db $00, $00, $00, $02, $10, $00, $03, $00 ; $03AA51 |
  db $41, $02, $04, $00, $04, $20, $00, $2F ; $03AA59 |
  db $00, $17, $00, $05, $00, $17, $00, $05 ; $03AA61 |
  db $00, $2D, $00, $00, $00, $2F, $00, $0E ; $03AA69 |
  db $00, $0E, $00, $0B, $00, $0B, $00, $24 ; $03AA71 |
  db $00, $0D, $00, $00, $21, $02, $25, $50 ; $03AA79 |
  db $52, $0F, $37, $27, $06, $0F, $07, $08 ; $03AA81 |
  db $09, $0F, $39, $29, $19, $0F, $21, $08 ; $03AA89 |
  db $30, $00, $00, $00, $00, $20, $0C, $20 ; $03AA91 |
  db $90, $20, $A0, $20, $C4, $80, $40, $00 ; $03AA99 |
  db $00, $02, $02, $00, $08, $22, $01, $02 ; $03AAA1 |
  db $04, $00, $04, $20, $01, $80, $44, $00 ; $03AAA9 |
  db $90, $00, $00, $00, $40, $00, $00, $00 ; $03AAB1 |
  db $A0, $88, $08, $AA, $19, $00, $4C, $20 ; $03AAB9 |
  db $10, $00, $00, $08, $28, $22, $40, $28 ; $03AAC1 |
  db $10, $00, $20, $00, $01, $20, $02, $02 ; $03AAC9 |
  db $00, $20, $20, $88, $10, $20, $01, $00 ; $03AAD1 |
  db $02, $00, $06, $20, $80, $00, $04, $80 ; $03AAD9 |
  db $49, $8A, $00, $08, $25, $A8, $21, $80 ; $03AAE1 |
  db $00, $00, $02, $00, $04, $AA, $22, $05 ; $03AAE9 |
  db $0B, $00, $0D, $0A, $40, $28, $45, $0C ; $03AAF1 |
  db $16, $FF, $A3, $80, $13, $80, $60, $01 ; $03AAF9 |
  db $02, $03, $04, $04, $04, $05, $05, $05 ; $03AB01 |
  db $05, $06, $08, $08, $0A, $0A, $0B, $0D ; $03AB09 |
  db $0E, $0F, $0F, $10, $10, $10, $10, $10 ; $03AB11 |
  db $11, $11, $11, $11, $11, $11, $11, $12 ; $03AB19 |
  db $12, $12, $12, $13, $14, $15, $17, $FF ; $03AB21 |
  db $00, $28, $02, $88, $08, $08, $40, $00 ; $03AB29 |
  db $08, $22, $30, $00, $04, $02, $00, $02 ; $03AB31 |
  db $40, $00, $20, $A2, $28, $02, $4B, $00 ; $03AB39 |
  db $08, $00, $00, $00, $02, $20, $00, $00 ; $03AB41 |
  db $E1, $08, $00, $00, $03, $02, $01, $00 ; $03AB49 |
  db $81, $00, $90, $00, $00, $20, $40, $00 ; $03AB51 |
  db $73, $00, $E7, $00, $00, $08, $22, $00 ; $03AB59 |
  db $91, $80, $00, $22, $84, $28, $80, $00 ; $03AB61 |
  db $01, $00, $0A, $00, $20, $00, $03, $20 ; $03AB69 |
  db $28, $A0, $40, $00, $A0, $80, $32, $20 ; $03AB71 |
  db $00, $20, $C0, $00, $1C, $00, $01, $00 ; $03AB79 |
  db $0A, $00, $50, $08, $08, $00, $05, $02 ; $03AB81 |
  db $20, $80, $30, $00, $10, $00, $48, $00 ; $03AB89 |
  db $20, $20, $00, $00, $01, $88, $00, $00 ; $03AB91 |
  db $0D, $00, $20, $82, $68, $02, $44, $00 ; $03AB99 |
  db $00, $20, $00, $00, $00, $00, $11, $02 ; $03ABA1 |
  db $00, $00, $04, $08, $21, $00, $00, $00 ; $03ABA9 |
  db $10, $20, $10, $AA, $02, $02, $08, $00 ; $03ABB1 |
  db $00, $00, $00, $80, $00, $20, $84, $10 ; $03ABB9 |
  db $27, $80, $44, $30, $22, $00, $62, $00 ; $03ABC1 |
  db $20, $08, $04, $00, $01, $80, $00, $80 ; $03ABC9 |
  db $04, $80, $00, $00, $00, $20, $00, $02 ; $03ABD1 |
  db $2C, $08, $01, $02, $88, $00, $00, $20 ; $03ABD9 |
  db $40, $02, $80, $22, $80, $0A, $80, $A8 ; $03ABE1 |
  db $14, $80, $46, $00, $A0, $80, $00, $08 ; $03ABE9 |
  db $90, $28, $34, $02, $04, $00, $31, $80 ; $03ABF1 |
  db $49, $82, $20, $82, $00, $A0, $1A, $78 ; $03ABF9 |
  db $88, $88, $70, $90, $B0, $30, $50, $70 ; $03AC01 |
  db $90, $78, $28, $C8, $28, $68, $68, $28 ; $03AC09 |
  db $28, $48, $88, $38, $48, $58, $68, $78 ; $03AC11 |
  db $50, $70, $90, $A8, $B0, $D0, $F0, $10 ; $03AC19 |
  db $30, $50, $70, $30, $D8, $C8, $C8, $FF ; $03AC21 |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $03AC29 |
  db $00, $00, $40, $00, $40, $00, $00, $00 ; $03AC31 |
  db $00, $00, $01, $06, $00, $40, $00, $00 ; $03AC39 |
  db $00, $00, $00, $04, $10, $08, $00, $00 ; $03AC41 |
  db $00, $45, $00, $00, $00, $00, $00, $01 ; $03AC49 |
  db $00, $01, $00, $42, $00, $00, $00, $11 ; $03AC51 |
  db $00, $90, $00, $10, $00, $00, $04, $90 ; $03AC59 |
  db $00, $00, $00, $00, $00, $40, $04, $00 ; $03AC61 |
  db $00, $02, $40, $00, $00, $00, $00, $00 ; $03AC69 |
  db $00, $00, $00, $04, $00, $06, $00, $80 ; $03AC71 |
  db $10, $23, $01, $00, $00, $01, $00, $00 ; $03AC79 |
  db $00, $00, $00, $00, $00, $04, $00, $82 ; $03AC81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03AC89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03AC91 |
  db $00, $00, $00, $02, $00, $08, $00, $20 ; $03AC99 |
  db $00, $20, $00, $00, $00, $00, $00, $00 ; $03ACA1 |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $03ACA9 |
  db $00, $00, $00, $20, $00, $10, $00, $00 ; $03ACB1 |
  db $00, $81, $00, $00, $00, $09, $04, $80 ; $03ACB9 |
  db $10, $00, $00, $00, $00, $00, $00, $00 ; $03ACC1 |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $03ACC9 |
  db $40, $10, $00, $20, $00, $00, $00, $00 ; $03ACD1 |
  db $00, $01, $00, $00, $01, $00, $10, $00 ; $03ACD9 |
  db $00, $44, $14, $04, $00, $00, $50, $01 ; $03ACE1 |
  db $00, $60, $04, $00, $00, $00, $05, $02 ; $03ACE9 |
  db $01, $00, $00, $00, $00, $00, $00, $03 ; $03ACF1 |
  db $14, $00, $10, $00, $01, $18, $01, $28 ; $03ACF9 |
  db $28, $28, $B8, $B8, $B8, $58, $68, $68 ; $03AD01 |
  db $68, $50, $B0, $A0, $98, $90, $B0, $84 ; $03AD09 |
  db $A4, $44, $58, $A4, $3C, $3C, $3C, $34 ; $03AD11 |
  db $B8, $B8, $B8, $38, $B8, $B8, $D8, $B8 ; $03AD19 |
  db $B8, $C8, $B8, $04, $B8, $A8, $00, $FF ; $03AD21 |
  db $40, $00, $00, $02, $00, $20, $00, $00 ; $03AD29 |
  db $00, $08, $04, $00, $00, $00, $00, $00 ; $03AD31 |
  db $00, $0A, $04, $00, $00, $00, $00, $00 ; $03AD39 |
  db $00, $08, $00, $00, $01, $00, $00, $00 ; $03AD41 |
  db $00, $00, $00, $80, $10, $00, $00, $00 ; $03AD49 |
  db $00, $04, $00, $02, $00, $00, $00, $00 ; $03AD51 |
  db $01, $00, $00, $00, $00, $00, $00, $04 ; $03AD59 |
  db $10, $08, $00, $02, $00, $00, $00, $90 ; $03AD61 |
  db $00, $40, $00, $00, $00, $00, $00, $02 ; $03AD69 |
  db $00, $80, $00, $08, $00, $09, $10, $00 ; $03AD71 |
  db $00, $02, $11, $80, $10, $00, $00, $00 ; $03AD79 |
  db $00, $20, $00, $00, $01, $01, $00, $00 ; $03AD81 |
  db $04, $00, $00, $00, $00, $00, $00, $04 ; $03AD89 |
  db $00, $00, $00, $00, $40, $02, $00, $20 ; $03AD91 |
  db $00, $00, $04, $00, $11, $00, $00, $00 ; $03AD99 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $03ADA1 |
  db $00, $80, $00, $00, $00, $08, $00, $01 ; $03ADA9 |
  db $00, $00, $01, $04, $00, $00, $00, $00 ; $03ADB1 |
  db $00, $00, $00, $00, $00, $80, $00, $00 ; $03ADB9 |
  db $00, $00, $00, $00, $00, $00, $00, $04 ; $03ADC1 |
  db $00, $81, $00, $00, $00, $00, $00, $00 ; $03ADC9 |
  db $00, $00, $00, $00, $40, $00, $00, $00 ; $03ADD1 |
  db $10, $00, $00, $00, $00, $10, $00, $44 ; $03ADD9 |
  db $00, $02, $00, $81, $00, $00, $00, $00 ; $03ADE1 |
  db $40, $00, $14, $08, $01, $14, $00, $00 ; $03ADE9 |
  db $00, $00, $40, $00, $45, $00, $00, $44 ; $03ADF1 |
  db $00, $40, $00, $29, $00, $24, $04, $1F ; $03ADF9 |
  db $1F, $1F, $21, $21, $21, $50, $21, $21 ; $03AE01 |
  db $21, $03, $1D, $1D, $50, $03, $1D, $12 ; $03AE09 |
  db $12, $12, $54, $09, $51, $51, $51, $09 ; $03AE11 |
  db $21, $21, $21, $1F, $21, $21, $21, $21 ; $03AE19 |
  db $21, $21, $21, $3E, $50, $13, $4A, $FF ; $03AE21 |
  db $00, $00, $04, $00, $00, $00, $00, $00 ; $03AE29 |
  db $00, $00, $00, $20, $00, $00, $04, $00 ; $03AE31 |
  db $00, $02, $00, $00, $00, $00, $00, $00 ; $03AE39 |
  db $00, $00, $01, $00, $04, $50, $10, $01 ; $03AE41 |
  db $00, $00, $40, $00, $00, $82, $00, $00 ; $03AE49 |
  db $00, $20, $40, $00, $00, $00, $01, $20 ; $03AE51 |
  db $00, $00, $00, $00, $00, $00, $10, $04 ; $03AE59 |
  db $00, $22, $04, $06, $04, $10, $04, $00 ; $03AE61 |
  db $00, $00, $00, $04, $40, $00, $00, $00 ; $03AE69 |
  db $00, $00, $00, $80, $10, $00, $00, $00 ; $03AE71 |
  db $00, $86, $01, $01, $10, $00, $00, $08 ; $03AE79 |
  db $10, $00, $10, $00, $00, $04, $00, $00 ; $03AE81 |
  db $00, $00, $00, $00, $00, $00, $00, $02 ; $03AE89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03AE91 |
  db $00, $40, $00, $00, $00, $00, $00, $00 ; $03AE99 |
  db $00, $00, $00, $00, $00, $00, $00, $02 ; $03AEA1 |
  db $00, $22, $00, $00, $04, $00, $00, $00 ; $03AEA9 |
  db $40, $00, $10, $00, $00, $80, $40, $00 ; $03AEB1 |
  db $00, $20, $00, $00, $04, $00, $00, $00 ; $03AEB9 |
  db $00, $00, $00, $00, $00, $40, $10, $00 ; $03AEC1 |
  db $00, $00, $04, $00, $04, $00, $00, $00 ; $03AEC9 |
  db $00, $90, $00, $00, $10, $00, $14, $00 ; $03AED1 |
  db $00, $08, $04, $08, $10, $00, $00, $20 ; $03AED9 |
  db $10, $40, $00, $00, $40, $40, $44, $80 ; $03AEE1 |
  db $04, $00, $10, $00, $01, $01, $00, $1A ; $03AEE9 |
  db $00, $00, $00, $08, $00, $00, $00, $00 ; $03AEF1 |
  db $00, $51, $04, $02, $05, $00, $00, $00 ; $03AEF9 |
  db $01, $02, $03, $04, $04, $04, $05, $04 ; $03AF01 |
  db $06, $07, $04, $04, $04, $08, $09, $0A ; $03AF09 |
  db $0B, $0C, $0D, $0E, $04, $0A, $0B, $0F ; $03AF11 |
  db $10, $11, $12, $13, $14, $0F, $10, $15 ; $03AF19 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03AF21 |
  db $15, $15, $15, $15, $15, $15, $15, $16 ; $03AF29 |
  db $16, $16, $16, $16, $16, $16, $16, $17 ; $03AF31 |
  db $17, $17, $17, $17, $17, $17, $17, $00 ; $03AF39 |
  db $02, $18, $19, $04, $04, $04, $04, $04 ; $03AF41 |
  db $04, $04, $04, $0E, $04, $06, $07, $0C ; $03AF49 |
  db $0D, $04, $04, $0A, $0B, $0C, $0D, $11 ; $03AF51 |
  db $12, $13, $14, $0F, $10, $11, $12, $15 ; $03AF59 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03AF61 |
  db $15, $15, $15, $15, $15, $15, $15, $16 ; $03AF69 |
  db $16, $16, $16, $16, $16, $16, $16, $17 ; $03AF71 |
  db $17, $17, $17, $17, $17, $17, $17, $04 ; $03AF79 |
  db $1A, $1B, $00, $01, $02, $03, $0E, $04 ; $03AF81 |
  db $0E, $04, $04, $1C, $04, $04, $04, $04 ; $03AF89 |
  db $04, $0A, $0B, $0C, $0D, $06, $07, $13 ; $03AF91 |
  db $14, $0F, $10, $11, $12, $13, $14, $15 ; $03AF99 |
  db $15, $15, $15, $15, $15, $15, $15, $1D ; $03AFA1 |
  db $1E, $1F, $15, $15, $15, $15, $15, $17 ; $03AFA9 |
  db $17, $20, $16, $16, $16, $16, $16, $17 ; $03AFB1 |
  db $17, $17, $17, $17, $17, $17, $17, $04 ; $03AFB9 |
  db $04, $04, $05, $00, $02, $18, $19, $04 ; $03AFC1 |
  db $04, $0E, $04, $06, $07, $04, $04, $0A ; $03AFC9 |
  db $0B, $0C, $0D, $04, $04, $0A, $0B, $0F ; $03AFD1 |
  db $10, $11, $12, $13, $14, $0F, $10, $21 ; $03AFD9 |
  db $22, $23, $16, $24, $15, $15, $15, $25 ; $03AFE1 |
  db $17, $17, $17, $17, $16, $26, $15, $17 ; $03AFE9 |
  db $17, $17, $17, $17, $17, $17, $16, $17 ; $03AFF1 |
  db $17, $17, $17, $17, $17, $17, $17, $04 ; $03AFF9 |
  db $0E, $04, $04, $0A, $0B, $27, $17, $04 ; $03B001 |
  db $0A, $0B, $0C, $0F, $10, $11, $28, $0C ; $03B009 |
  db $0F, $10, $11, $15, $15, $15, $29, $11 ; $03B011 |
  db $15, $15, $15, $15, $15, $15, $15, $2A ; $03B019 |
  db $2B, $15, $15, $15, $15, $15, $15, $2C ; $03B021 |
  db $17, $24, $2D, $2D, $2D, $1D, $24, $17 ; $03B029 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B031 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B039 |
  db $2E, $2E, $2E, $2F, $30, $2E, $17, $31 ; $03B041 |
  db $32, $33, $33, $34, $35, $36, $2C, $31 ; $03B049 |
  db $37, $15, $15, $15, $38, $39, $2C, $30 ; $03B051 |
  db $1E, $3A, $3A, $3A, $3B, $3C, $2C, $15 ; $03B059 |
  db $30, $17, $17, $17, $2E, $2F, $2C, $15 ; $03B061 |
  db $15, $3D, $3E, $3F, $15, $38, $2C, $16 ; $03B069 |
  db $16, $16, $16, $16, $16, $16, $17, $17 ; $03B071 |
  db $17, $17, $17, $17, $17, $17, $17, $40 ; $03B079 |
  db $41, $42, $43, $43, $43, $44, $45, $40 ; $03B081 |
  db $41, $36, $36, $36, $36, $36, $46, $40 ; $03B089 |
  db $41, $47, $48, $48, $48, $49, $4A, $40 ; $03B091 |
  db $41, $48, $4B, $4C, $4D, $48, $4E, $40 ; $03B099 |
  db $4F, $49, $50, $51, $52, $47, $4A, $40 ; $03B0A1 |
  db $53, $48, $50, $54, $36, $47, $4E, $40 ; $03B0A9 |
  db $55, $4C, $40, $56, $4C, $4C, $57, $40 ; $03B0B1 |
  db $40, $40, $40, $41, $50, $40, $40, $17 ; $03B0B9 |
  db $58, $2E, $2E, $2E, $2E, $59, $17, $17 ; $03B0C1 |
  db $5A, $36, $36, $36, $36, $5B, $2E, $17 ; $03B0C9 |
  db $5C, $5D, $5E, $47, $48, $5F, $36, $17 ; $03B0D1 |
  db $60, $2C, $17, $61, $48, $48, $47, $17 ; $03B0D9 |
  db $60, $2C, $17, $17, $61, $47, $48, $17 ; $03B0E1 |
  db $60, $2C, $17, $17, $17, $61, $47, $17 ; $03B0E9 |
  db $60, $2C, $17, $17, $17, $17, $16, $17 ; $03B0F1 |
  db $60, $2C, $17, $17, $17, $17, $17, $17 ; $03B0F9 |
  db $17, $17, $17, $17, $17, $17, $17, $2E ; $03B101 |
  db $17, $2E, $62, $63, $64, $2E, $2E, $36 ; $03B109 |
  db $65, $36, $36, $47, $36, $36, $36, $48 ; $03B111 |
  db $47, $48, $49, $48, $49, $48, $47, $49 ; $03B119 |
  db $48, $48, $48, $48, $47, $48, $48, $48 ; $03B121 |
  db $48, $49, $48, $47, $48, $66, $67, $16 ; $03B129 |
  db $16, $16, $16, $16, $16, $17, $17, $17 ; $03B131 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B139 |
  db $17, $17, $17, $17, $31, $68, $2C, $2E ; $03B141 |
  db $17, $17, $62, $63, $69, $6A, $2C, $36 ; $03B149 |
  db $6B, $69, $36, $48, $36, $68, $2C, $48 ; $03B151 |
  db $48, $36, $48, $47, $48, $48, $2C, $48 ; $03B159 |
  db $6C, $48, $47, $48, $47, $48, $2C, $16 ; $03B161 |
  db $16, $16, $16, $16, $16, $16, $17, $17 ; $03B169 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B171 |
  db $17, $17, $17, $17, $17, $17, $17, $40 ; $03B179 |
  db $6D, $40, $40, $6D, $6E, $6F, $50, $40 ; $03B181 |
  db $6D, $40, $40, $6D, $6E, $70, $50, $40 ; $03B189 |
  db $71, $43, $43, $71, $52, $6F, $50, $6E ; $03B191 |
  db $36, $36, $36, $36, $36, $70, $50, $6E ; $03B199 |
  db $47, $47, $48, $49, $48, $70, $50, $40 ; $03B1A1 |
  db $4C, $4C, $4C, $4C, $4D, $6F, $50, $40 ; $03B1A9 |
  db $40, $40, $40, $40, $6E, $6F, $50, $40 ; $03B1B1 |
  db $40, $40, $40, $40, $6E, $70, $50, $31 ; $03B1B9 |
  db $72, $17, $17, $17, $17, $17, $17, $31 ; $03B1C1 |
  db $73, $2E, $2E, $2E, $2E, $2E, $17, $31 ; $03B1C9 |
  db $74, $75, $36, $36, $76, $36, $2C, $31 ; $03B1D1 |
  db $6A, $77, $47, $48, $78, $47, $2C, $31 ; $03B1D9 |
  db $79, $7A, $7B, $7B, $7C, $7D, $2C, $31 ; $03B1E1 |
  db $48, $7E, $48, $47, $7F, $6C, $2C, $17 ; $03B1E9 |
  db $80, $16, $16, $80, $24, $81, $2C, $17 ; $03B1F1 |
  db $82, $17, $17, $82, $31, $68, $2C, $83 ; $03B1F9 |
  db $43, $43, $43, $84, $85, $86, $86, $6E ; $03B201 |
  db $87, $87, $87, $88, $89, $8A, $86, $6E ; $03B209 |
  db $8B, $86, $8A, $8C, $89, $86, $86, $6E ; $03B211 |
  db $8D, $8E, $86, $8C, $89, $8B, $86, $6E ; $03B219 |
  db $8F, $6E, $8B, $90, $89, $86, $8A, $6E ; $03B221 |
  db $8F, $6E, $86, $91, $92, $93, $4C, $6E ; $03B229 |
  db $8F, $40, $4C, $4C, $4C, $57, $40, $6E ; $03B231 |
  db $8F, $40, $40, $40, $40, $40, $40, $8B ; $03B239 |
  db $94, $45, $40, $40, $40, $40, $40, $8B ; $03B241 |
  db $95, $96, $97, $40, $40, $40, $40, $86 ; $03B249 |
  db $98, $99, $97, $40, $40, $40, $40, $8A ; $03B251 |
  db $9A, $8A, $94, $43, $43, $43, $43, $8A ; $03B259 |
  db $9B, $99, $9C, $9D, $9E, $9C, $9D, $4C ; $03B261 |
  db $4C, $9F, $86, $A0, $86, $8A, $A0, $40 ; $03B269 |
  db $40, $40, $4C, $4C, $4C, $4C, $4C, $40 ; $03B271 |
  db $40, $40, $40, $40, $40, $40, $40, $40 ; $03B279 |
  db $40, $40, $43, $43, $43, $43, $43, $40 ; $03B281 |
  db $40, $6E, $A1, $87, $A2, $A3, $87, $40 ; $03B289 |
  db $40, $6E, $98, $A4, $99, $A5, $A6, $43 ; $03B291 |
  db $43, $52, $9A, $86, $8B, $4B, $4C, $9E ; $03B299 |
  db $9C, $A7, $9B, $A8, $A9, $40, $40, $8A ; $03B2A1 |
  db $86, $A6, $9A, $AA, $AB, $AC, $AB, $4C ; $03B2A9 |
  db $4C, $4C, $4C, $4C, $4C, $4C, $4C, $40 ; $03B2B1 |
  db $40, $40, $40, $40, $40, $40, $40, $43 ; $03B2B9 |
  db $43, $43, $43, $AD, $AE, $41, $50, $87 ; $03B2C1 |
  db $87, $87, $87, $AF, $AE, $41, $50, $86 ; $03B2C9 |
  db $86, $8A, $8B, $86, $AE, $41, $50, $4C ; $03B2D1 |
  db $4C, $4C, $4C, $4C, $B0, $AD, $50, $40 ; $03B2D9 |
  db $40, $40, $40, $40, $B0, $AF, $50, $AB ; $03B2E1 |
  db $AB, $AB, $AB, $AB, $B1, $8A, $50, $4C ; $03B2E9 |
  db $4C, $4C, $4C, $4C, $4C, $4C, $40, $40 ; $03B2F1 |
  db $40, $40, $40, $40, $40, $40, $40, $31 ; $03B2F9 |
  db $72, $17, $2E, $2E, $2E, $2E, $17, $31 ; $03B301 |
  db $B2, $B3, $36, $36, $36, $36, $2C, $31 ; $03B309 |
  db $6A, $B4, $16, $16, $B5, $3C, $2C, $31 ; $03B311 |
  db $6A, $30, $2E, $2E, $B6, $60, $2C, $31 ; $03B319 |
  db $48, $36, $36, $36, $B7, $60, $2C, $B8 ; $03B321 |
  db $B9, $B9, $BA, $BB, $B7, $60, $2C, $17 ; $03B329 |
  db $17, $17, $17, $60, $B7, $60, $2C, $17 ; $03B331 |
  db $17, $17, $17, $60, $B7, $60, $2C, $6E ; $03B339 |
  db $04, $1A, $1B, $00, $01, $02, $03, $6E ; $03B341 |
  db $07, $04, $04, $04, $06, $07, $04, $6E ; $03B349 |
  db $0A, $0B, $0C, $0D, $0E, $04, $0A, $6E ; $03B351 |
  db $0F, $10, $11, $12, $13, $14, $0F, $6E ; $03B359 |
  db $15, $15, $15, $15, $15, $15, $15, $6E ; $03B361 |
  db $15, $2D, $2D, $2D, $2D, $2D, $15, $6E ; $03B369 |
  db $8D, $4C, $4C, $4C, $4C, $4D, $2D, $6E ; $03B371 |
  db $8F, $40, $40, $40, $40, $40, $4C, $04 ; $03B379 |
  db $04, $05, $00, $01, $02, $18, $50, $04 ; $03B381 |
  db $06, $07, $04, $1C, $04, $04, $50, $0B ; $03B389 |
  db $0C, $0D, $0E, $04, $0A, $0B, $50, $10 ; $03B391 |
  db $11, $12, $13, $14, $0F, $10, $50, $15 ; $03B399 |
  db $15, $15, $15, $15, $15, $15, $50, $2D ; $03B3A1 |
  db $2D, $15, $2D, $15, $15, $15, $50, $4B ; $03B3A9 |
  db $BC, $BD, $A9, $4C, $4C, $BE, $50, $40 ; $03B3B1 |
  db $BF, $BF, $BF, $BF, $BF, $C0, $50, $31 ; $03B3B9 |
  db $A2, $95, $87, $87, $A3, $AF, $2C, $31 ; $03B3C1 |
  db $C1, $98, $99, $A4, $C2, $C3, $2C, $31 ; $03B3C9 |
  db $86, $C4, $86, $8B, $A0, $8A, $2C, $31 ; $03B3D1 |
  db $C1, $98, $99, $99, $A5, $C3, $2C, $31 ; $03B3D9 |
  db $8A, $9A, $86, $8A, $A0, $8A, $2C, $31 ; $03B3E1 |
  db $86, $C5, $3B, $1E, $C6, $8A, $2C, $17 ; $03B3E9 |
  db $16, $17, $17, $17, $17, $16, $17, $17 ; $03B3F1 |
  db $17, $17, $C7, $C7, $17, $17, $17, $40 ; $03B3F9 |
  db $40, $6E, $48, $48, $50, $40, $40, $40 ; $03B401 |
  db $40, $6E, $48, $48, $50, $40, $40, $40 ; $03B409 |
  db $40, $6E, $48, $49, $50, $40, $40, $40 ; $03B411 |
  db $C8, $C9, $48, $48, $CA, $CB, $40, $6E ; $03B419 |
  db $CC, $CD, $48, $48, $CE, $CF, $D0, $6E ; $03B421 |
  db $49, $48, $48, $48, $48, $D1, $2C, $6E ; $03B429 |
  db $D2, $D3, $4C, $4C, $4C, $4C, $40, $6E ; $03B431 |
  db $6A, $6D, $40, $40, $40, $40, $40, $31 ; $03B439 |
  db $6F, $82, $2E, $2E, $2E, $2E, $17, $31 ; $03B441 |
  db $70, $D4, $87, $87, $87, $87, $2C, $31 ; $03B449 |
  db $6F, $87, $86, $86, $8B, $86, $2C, $31 ; $03B451 |
  db $86, $86, $8B, $86, $8A, $86, $30, $31 ; $03B459 |
  db $86, $8B, $86, $86, $86, $86, $D5, $31 ; $03B461 |
  db $86, $86, $86, $8B, $86, $8A, $D6, $17 ; $03B469 |
  db $16, $16, $16, $16, $16, $16, $16, $17 ; $03B471 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B479 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B481 |
  db $17, $17, $17, $17, $17, $17, $17, $17 ; $03B489 |
  db $17, $17, $17, $17, $17, $17, $17, $2E ; $03B491 |
  db $2E, $2E, $2E, $2E, $2E, $2E, $2E, $D7 ; $03B499 |
  db $87, $87, $87, $87, $A2, $87, $D5, $D8 ; $03B4A1 |
  db $8A, $86, $8B, $86, $86, $8A, $D6, $16 ; $03B4A9 |
  db $16, $16, $16, $16, $16, $16, $16, $17 ; $03B4B1 |
  db $17, $17, $17, $17, $17, $17, $17, $D9 ; $03B4B9 |
  db $C7, $C7, $C7, $C7, $C7, $C7, $DA, $DB ; $03B4C1 |
  db $86, $86, $8A, $86, $8B, $86, $DC, $DB ; $03B4C9 |
  db $8A, $86, $86, $86, $86, $86, $DC, $DD ; $03B4D1 |
  db $86, $86, $8B, $86, $86, $8A, $DC, $DE ; $03B4D9 |
  db $86, $86, $86, $86, $86, $86, $DC, $D8 ; $03B4E1 |
  db $8B, $86, $86, $86, $86, $8B, $DC, $16 ; $03B4E9 |
  db $16, $16, $16, $16, $16, $16, $DF, $17 ; $03B4F1 |
  db $17, $17, $17, $17, $17, $17, $17, $E0 ; $03B4F9 |
  db $04, $1A, $1B, $00, $01, $02, $E1, $E0 ; $03B501 |
  db $08, $09, $04, $04, $06, $07, $E2, $E0 ; $03B509 |
  db $0A, $0B, $0C, $0D, $0E, $04, $E2, $E3 ; $03B511 |
  db $0F, $10, $11, $12, $13, $14, $E4, $E5 ; $03B519 |
  db $15, $15, $15, $15, $15, $15, $E6, $E5 ; $03B521 |
  db $15, $4B, $4C, $4C, $4D, $15, $E6, $4C ; $03B529 |
  db $4C, $40, $40, $40, $40, $4C, $4C, $40 ; $03B531 |
  db $40, $40, $40, $40, $40, $40, $40, $15 ; $03B539 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B541 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B549 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B551 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B559 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B561 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B569 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B571 |
  db $15, $15, $15, $15, $15, $15, $15, $31 ; $03B579 |
  db $72, $17, $2E, $2E, $2E, $2E, $17, $31 ; $03B581 |
  db $B2, $B3, $36, $36, $36, $36, $2C, $31 ; $03B589 |
  db $6A, $B4, $16, $16, $B5, $3C, $2C, $31 ; $03B591 |
  db $6A, $30, $2E, $2E, $B6, $60, $2C, $31 ; $03B599 |
  db $48, $36, $36, $36, $B7, $60, $2C, $B8 ; $03B5A1 |
  db $B9, $B9, $BA, $BB, $B7, $60, $2C, $17 ; $03B5A9 |
  db $17, $17, $17, $60, $B7, $60, $2C, $17 ; $03B5B1 |
  db $17, $17, $17, $60, $B7, $60, $2C, $31 ; $03B5B9 |
  db $A2, $95, $87, $87, $A3, $AF, $2C, $31 ; $03B5C1 |
  db $C1, $98, $99, $A4, $C2, $C3, $2C, $31 ; $03B5C9 |
  db $86, $C4, $86, $8B, $A0, $8A, $2C, $31 ; $03B5D1 |
  db $C1, $98, $99, $99, $A5, $C3, $2C, $31 ; $03B5D9 |
  db $8A, $9A, $86, $8A, $A0, $8A, $2C, $31 ; $03B5E1 |
  db $86, $C5, $3B, $1E, $C6, $8A, $2C, $17 ; $03B5E9 |
  db $16, $17, $17, $17, $17, $16, $17, $17 ; $03B5F1 |
  db $17, $17, $C7, $C7, $17, $17, $17, $15 ; $03B5F9 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B601 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B609 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B611 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B619 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B621 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B629 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B631 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B639 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B641 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B649 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B651 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B659 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B661 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B669 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B671 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B679 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B681 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B689 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B691 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B699 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6A1 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6A9 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6B1 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6B9 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6C1 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6C9 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6D1 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6D9 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6E1 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6E9 |
  db $15, $15, $15, $15, $15, $15, $15, $15 ; $03B6F1 |
  db $15, $15, $15, $15, $15, $15, $15, $50 ; $03B6F9 |
  db $51, $58, $59, $51, $51, $5A, $51, $51 ; $03B701 |
  db $51, $5B, $5C, $57, $47, $5D, $08, $08 ; $03B709 |
  db $08, $08, $08, $58, $59, $08, $08, $5E ; $03B711 |
  db $60, $08, $08, $61, $65, $08, $08, $08 ; $03B719 |
  db $08, $5E, $60, $08, $08, $61, $65, $08 ; $03B721 |
  db $08, $08, $4D, $08, $08, $4E, $4F, $08 ; $03B729 |
  db $08, $4A, $4B, $08, $08, $4C, $08, $08 ; $03B731 |
  db $08, $5E, $5F, $4D, $55, $55, $00, $56 ; $03B739 |
  db $45, $00, $00, $45, $53, $00, $00, $54 ; $03B741 |
  db $4D, $00, $55, $4E, $4D, $56, $55, $4F ; $03B749 |
  db $4A, $45, $52, $00, $00, $00, $00, $01 ; $03B751 |
  db $02, $0E, $0F, $06, $07, $0E, $0F, $51 ; $03B759 |
  db $5B, $5D, $08, $5C, $5D, $08, $08, $08 ; $03B761 |
  db $58, $08, $08, $59, $50, $08, $08, $08 ; $03B769 |
  db $38, $08, $08, $00, $16, $22, $0F, $01 ; $03B771 |
  db $15, $0E, $0F, $00, $00, $21, $00, $06 ; $03B779 |
  db $02, $0E, $0F, $00, $00, $00, $20, $00 ; $03B781 |
  db $00, $03, $04, $00, $16, $03, $0F, $01 ; $03B789 |
  db $15, $0E, $19, $14, $07, $18, $0F, $17 ; $03B791 |
  db $00, $0E, $23, $08, $12, $4A, $2A, $10 ; $03B799 |
  db $07, $1C, $0F, $00, $12, $00, $2A, $00 ; $03B7A1 |
  db $00, $22, $04, $14, $15, $0E, $19, $10 ; $03B7A9 |
  db $07, $18, $0F, $00, $00, $3A, $3B, $06 ; $03B7B1 |
  db $07, $09, $0A, $13, $0D, $1F, $0D, $10 ; $03B7B9 |
  db $07, $1C, $0A, $06, $11, $0E, $19, $2E ; $03B7C1 |
  db $46, $3E, $6C, $6D, $6E, $00, $00, $6D ; $03B7C9 |
  db $0D, $00, $00, $2E, $46, $6F, $24, $2E ; $03B7D1 |
  db $46, $3E, $24, $6C, $00, $00, $00, $00 ; $03B7D9 |
  db $6F, $00, $00, $24, $3E, $6F, $24, $3A ; $03B7E1 |
  db $3B, $03, $04, $14, $02, $0E, $0F, $17 ; $03B7E9 |
  db $05, $1B, $0D, $2A, $0C, $00, $00, $0B ; $03B7F1 |
  db $0C, $00, $00, $0B, $2B, $00, $00, $0E ; $03B7F9 |
  db $0F, $06, $07, $1B, $0D, $13, $0D, $18 ; $03B801 |
  db $0F, $0B, $0C, $0E, $0F, $0B, $0C, $0E ; $03B809 |
  db $0F, $0B, $63, $0E, $0F, $0B, $07, $2E ; $03B811 |
  db $12, $3E, $1A, $24, $3E, $25, $24, $24 ; $03B819 |
  db $3E, $3E, $24, $24, $25, $25, $24, $24 ; $03B821 |
  db $12, $3E, $1A, $22, $04, $10, $07, $03 ; $03B829 |
  db $04, $06, $07, $03, $23, $06, $11, $24 ; $03B831 |
  db $12, $25, $1A, $1B, $3E, $13, $24, $18 ; $03B839 |
  db $0F, $10, $07, $0E, $0F, $06, $0C, $0E ; $03B841 |
  db $19, $0B, $2B, $1B, $24, $13, $3E, $21 ; $03B849 |
  db $46, $13, $24, $0E, $04, $06, $07, $1B ; $03B851 |
  db $05, $13, $0D, $03, $0F, $06, $07, $06 ; $03B859 |
  db $07, $0E, $0A, $06, $07, $09, $0F, $13 ; $03B861 |
  db $46, $1B, $24, $46, $12, $3E, $1E, $13 ; $03B869 |
  db $24, $1B, $05, $24, $25, $22, $04, $24 ; $03B871 |
  db $3E, $03, $23, $24, $46, $3E, $24, $13 ; $03B879 |
  db $0D, $1B, $0D, $17, $3E, $0E, $23, $06 ; $03B881 |
  db $07, $09, $1D, $0B, $0C, $46, $2E, $06 ; $03B889 |
  db $07, $1C, $0A, $1E, $1F, $46, $2E, $24 ; $03B891 |
  db $3E, $22, $04, $3E, $16, $03, $0F, $0D ; $03B899 |
  db $25, $0D, $24, $06, $11, $1C, $1D, $0D ; $03B8A1 |
  db $3E, $0D, $24, $1E, $0C, $46, $2E, $24 ; $03B8A9 |
  db $25, $3E, $24, $30, $0F, $30, $07, $0E ; $03B8B1 |
  db $19, $06, $11, $0D, $24, $0D, $25, $0D ; $03B8B9 |
  db $24, $0D, $3E, $30, $0F, $31, $0C, $0D ; $03B8C1 |
  db $12, $0D, $1A, $0D, $12, $0D, $1E, $0D ; $03B8C9 |
  db $46, $0D, $24, $32, $46, $32, $24, $2E ; $03B8D1 |
  db $32, $3E, $32, $32, $3E, $33, $24, $24 ; $03B8D9 |
  db $32, $3E, $33, $35, $36, $3E, $24, $3F ; $03B8E1 |
  db $37, $34, $24, $35, $35, $3E, $24, $36 ; $03B8E9 |
  db $3F, $3E, $34, $37, $35, $25, $24, $32 ; $03B8F1 |
  db $3E, $32, $24, $24, $32, $3E, $32, $2C ; $03B8F9 |
  db $02, $30, $0F, $05, $25, $0D, $24, $30 ; $03B901 |
  db $07, $30, $0F, $0E, $07, $06, $0F, $0E ; $03B909 |
  db $30, $0B, $30, $30, $24, $30, $25, $3E ; $03B911 |
  db $24, $24, $3E, $46, $2E, $24, $3E, $46 ; $03B919 |
  db $30, $24, $30, $30, $24, $30, $3E, $3E ; $03B921 |
  db $24, $24, $25, $25, $24, $24, $25, $3E ; $03B929 |
  db $30, $24, $30, $05, $20, $0D, $12, $03 ; $03B931 |
  db $15, $06, $11, $0D, $1A, $0D, $12, $25 ; $03B939 |
  db $30, $24, $30, $3E, $31, $24, $46, $31 ; $03B941 |
  db $24, $2E, $25, $3E, $20, $24, $12, $18 ; $03B949 |
  db $0F, $1E, $0C, $26, $2E, $32, $25, $46 ; $03B951 |
  db $2A, $24, $46, $0E, $0F, $10, $07, $33 ; $03B959 |
  db $24, $3F, $37, $3E, $24, $35, $35, $34 ; $03B961 |
  db $24, $32, $3E, $32, $24, $3F, $37, $46 ; $03B969 |
  db $2E, $35, $35, $46, $39, $36, $3F, $46 ; $03B971 |
  db $2E, $37, $35, $21, $24, $06, $15, $3E ; $03B979 |
  db $34, $24, $32, $26, $2E, $32, $3E, $46 ; $03B981 |
  db $2E, $24, $25, $46, $26, $24, $32, $25 ; $03B989 |
  db $24, $35, $35, $3E, $33, $36, $3F, $25 ; $03B991 |
  db $24, $24, $3E, $46, $2E, $35, $36, $3E ; $03B999 |
  db $24, $14, $02, $22, $04, $06, $07, $1C ; $03B9A1 |
  db $0A, $2E, $46, $09, $0A, $2E, $46, $09 ; $03B9A9 |
  db $0A, $2E, $26, $1B, $0D, $1D, $0D, $18 ; $03B9B1 |
  db $30, $10, $30, $46, $24, $24, $3E, $0E ; $03B9B9 |
  db $30, $06, $30, $09, $31, $2E, $46, $0D ; $03B9C1 |
  db $28, $0D, $2E, $0B, $2B, $46, $2E, $14 ; $03B9C9 |
  db $02, $18, $0F, $01, $2C, $0E, $30, $06 ; $03B9D1 |
  db $30, $0E, $30, $10, $30, $18, $30, $06 ; $03B9D9 |
  db $11, $0E, $0F, $24, $3E, $03, $04, $24 ; $03B9E1 |
  db $25, $03, $04, $24, $3E, $21, $05, $03 ; $03B9E9 |
  db $23, $06, $07, $3A, $3B, $01, $02, $21 ; $03B9F1 |
  db $05, $13, $0D, $09, $0A, $46, $2E, $2B ; $03B9F9 |
  db $0D, $46, $24, $3E, $24, $35, $36, $24 ; $03BA01 |
  db $33, $36, $3F, $3E, $24, $37, $35, $34 ; $03BA09 |
  db $24, $32, $25, $32, $24, $22, $04, $25 ; $03BA11 |
  db $32, $03, $23, $0B, $0C, $2E, $46, $0E ; $03BA19 |
  db $0F, $0A, $07, $0E, $1D, $29, $2E, $18 ; $03BA21 |
  db $0A, $2A, $2E, $09, $0F, $46, $07, $2E ; $03BA29 |
  db $62, $3E, $2E, $2E, $3E, $3E, $24, $2E ; $03BA31 |
  db $25, $3E, $24, $24, $1E, $3E, $2E, $06 ; $03BA39 |
  db $07, $18, $0F, $24, $24, $3E, $24, $05 ; $03BA41 |
  db $3E, $0D, $24, $2C, $20, $30, $07, $30 ; $03BA49 |
  db $11, $31, $62, $46, $2F, $24, $2F, $3E ; $03BA51 |
  db $2F, $24, $2F, $68, $2E, $69, $25, $6A ; $03BA59 |
  db $24, $6B, $3E, $06, $0C, $1B, $46, $0B ; $03BA61 |
  db $07, $2E, $1A, $13, $24, $1B, $3E, $3E ; $03BA69 |
  db $12, $24, $1A, $13, $24, $1F, $3E, $68 ; $03BA71 |
  db $24, $69, $3E, $01, $07, $0E, $0F, $30 ; $03BA79 |
  db $08, $30, $08, $57, $30, $5D, $30, $08 ; $03BA81 |
  db $30, $08, $30, $30, $4A, $30, $52, $4D ; $03BA89 |
  db $30, $55, $30, $30, $00, $30, $00, $00 ; $03BA91 |
  db $30, $00, $30, $30, $30, $30, $30, $31 ; $03BA99 |
  db $31, $2E, $46, $08, $08, $48, $49, $30 ; $03BAA1 |
  db $08, $30, $49, $08, $08, $48, $40, $08 ; $03BAA9 |
  db $08, $41, $49, $08, $30, $48, $30, $32 ; $03BAB1 |
  db $24, $32, $25, $32, $24, $16, $17, $25 ; $03BAB9 |
  db $32, $16, $17, $30, $11, $30, $62, $30 ; $03BAC1 |
  db $2E, $30, $3E, $30, $24, $30, $2C, $06 ; $03BAC9 |
  db $07, $0E, $0F, $00, $00, $00, $00, $00 ; $03BAD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BAD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BAE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BAE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BAF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BAF9 |
  db $01, $03, $05, $07, $3A, $10, $12, $3C ; $03BB01 |
  db $30, $32, $10, $12, $3A, $30, $32, $24 ; $03BB09 |
  db $12, $26, $10, $0D, $03, $1A, $01, $44 ; $03BB11 |
  db $32, $46, $30, $44, $32, $46, $30, $1E ; $03BB19 |
  db $05, $29, $07, $50, $52, $68, $BA, $26 ; $03BB21 |
  db $10, $24, $12, $2E, $12, $64, $6A, $38 ; $03BB29 |
  db $38, $4A, $4A, $5A, $4C, $4C, $4D, $91 ; $03BB31 |
  db $68, $AC, $AE, $30, $32, $48, $4E, $3C ; $03BB39 |
  db $74, $00, $00, $3C, $A9, $6C, $93, $3C ; $03BB41 |
  db $3C, $3C, $3C, $3C, $7C, $7E, $9B, $70 ; $03BB49 |
  db $70, $86, $88, $8A, $9C, $9E, $70, $3C ; $03BB51 |
  db $75, $70, $70, $70, $93, $3C, $A1, $96 ; $03BB59 |
  db $70, $B0, $12, $44, $94, $93, $00, $64 ; $03BB61 |
  db $48, $50, $52, $50, $64, $6C, $2D, $00 ; $03BB69 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BB71 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BB79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BB81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BB89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BB91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BB99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BBF9 |
  db $02, $04, $06, $08, $3B, $11, $13, $3C ; $03BC01 |
  db $31, $33, $11, $13, $3B, $31, $33, $11 ; $03BC09 |
  db $25, $13, $27, $02, $0E, $04, $18, $31 ; $03BC11 |
  db $45, $33, $47, $31, $45, $33, $47, $08 ; $03BC19 |
  db $1D, $06, $2B, $51, $53, $69, $BB, $13 ; $03BC21 |
  db $27, $11, $25, $2F, $13, $65, $6B, $39 ; $03BC29 |
  db $39, $4B, $4B, $5B, $4C, $4D, $4C, $91 ; $03BC31 |
  db $69, $AD, $AF, $31, $33, $49, $4F, $71 ; $03BC39 |
  db $3C, $00, $00, $3C, $AA, $6D, $3C, $3C ; $03BC41 |
  db $3C, $3C, $3C, $3C, $7D, $7F, $3C, $70 ; $03BC49 |
  db $70, $87, $89, $8B, $9D, $9F, $92, $90 ; $03BC51 |
  db $70, $70, $70, $92, $91, $97, $94, $70 ; $03BC59 |
  db $95, $27, $13, $13, $3C, $3C, $00, $65 ; $03BC61 |
  db $49, $51, $53, $A7, $65, $6D, $49, $00 ; $03BC69 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BC71 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BC79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BC81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BC89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BC91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BC99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BCF9 |
  db $20, $22, $40, $42, $3A, $20, $22, $3C ; $03BD01 |
  db $09, $0B, $14, $16, $3A, $40, $42, $34 ; $03BD09 |
  db $22, $36, $20, $34, $22, $36, $20, $54 ; $03BD11 |
  db $42, $56, $40, $0F, $0B, $19, $09, $56 ; $03BD19 |
  db $40, $54, $42, $60, $62, $4A, $5C, $1C ; $03BD21 |
  db $14, $2A, $16, $3E, $22, $60, $6A, $3E ; $03BD29 |
  db $6E, $4A, $5A, $4A, $5C, $5C, $5D, $3C ; $03BD31 |
  db $5A, $BC, $BE, $40, $67, $58, $5E, $80 ; $03BD39 |
  db $84, $00, $00, $99, $00, $62, $94, $72 ; $03BD41 |
  db $82, $76, $78, $7A, $8C, $8E, $AB, $75 ; $03BD49 |
  db $70, $A8, $00, $98, $A8, $A8, $70, $3C ; $03BD51 |
  db $3C, $75, $70, $93, $3C, $3C, $3C, $91 ; $03BD59 |
  db $91, $B1, $B2, $54, $3C, $3C, $00, $60 ; $03BD61 |
  db $58, $60, $62, $A3, $B6, $B8, $00, $00 ; $03BD69 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BD71 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BD79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BD81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BD89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BD91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BD99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BDF9 |
  db $21, $23, $41, $43, $3B, $21, $23, $3C ; $03BE01 |
  db $0A, $0C, $15, $17, $3B, $41, $43, $21 ; $03BE09 |
  db $35, $23, $37, $21, $35, $23, $37, $41 ; $03BE11 |
  db $55, $43, $57, $0A, $1F, $0C, $28, $43 ; $03BE19 |
  db $57, $41, $55, $61, $63, $4B, $5C, $17 ; $03BE21 |
  db $1B, $15, $2C, $3F, $A0, $61, $6B, $3F ; $03BE29 |
  db $6F, $4B, $5B, $4B, $5C, $5D, $5C, $3C ; $03BE31 |
  db $5B, $BD, $BF, $66, $43, $59, $5F, $81 ; $03BE39 |
  db $85, $00, $00, $9A, $98, $63, $3C, $73 ; $03BE41 |
  db $83, $77, $79, $7B, $8D, $8F, $3C, $70 ; $03BE49 |
  db $70, $00, $00, $00, $98, $87, $95, $3C ; $03BE51 |
  db $90, $70, $92, $3C, $3C, $3C, $3C, $91 ; $03BE59 |
  db $91, $B3, $A0, $A0, $3C, $3C, $00, $61 ; $03BE61 |
  db $59, $61, $63, $A6, $B7, $B9, $3D, $00 ; $03BE69 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BE71 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BE79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BE81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BE89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BE91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BE99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BED1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BED9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BEF9 |
  db $10, $10, $10, $10, $40, $10, $10, $03 ; $03BF01 |
  db $10, $10, $10, $10, $20, $10, $10, $10 ; $03BF09 |
  db $10, $10, $10, $10, $10, $10, $10, $10 ; $03BF11 |
  db $10, $10, $10, $10, $10, $10, $10, $10 ; $03BF19 |
  db $10, $10, $10, $01, $01, $01, $01, $10 ; $03BF21 |
  db $10, $10, $10, $12, $10, $01, $10, $12 ; $03BF29 |
  db $12, $01, $01, $01, $01, $01, $01, $03 ; $03BF31 |
  db $01, $12, $12, $10, $10, $01, $01, $03 ; $03BF39 |
  db $03, $10, $10, $03, $03, $01, $03, $03 ; $03BF41 |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $03BF49 |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $03BF51 |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $03BF59 |
  db $03, $10, $10, $10, $03, $03, $10, $11 ; $03BF61 |
  db $11, $11, $11, $01, $01, $01, $01, $00 ; $03BF69 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BF71 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BF79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BF81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BF89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BF91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BF99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $03BFF1 |
  db $00, $00, $C0, $00, $FE, $43, $C1      ; $03BFF9 |

