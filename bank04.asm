bank $04
org $A000

main_doc_flash_j:
  JMP code_04A030                           ; $04A000 |

main_doc_wood_j:
  JMP code_04A250                           ; $04A003 |

main_doc_crash_j:
  JMP code_04A49A                           ; $04A006 |

main_doc_metal_j:
  JMP code_04A6E5                           ; $04A009 |

  JMP code_04A13C                           ; $04A00C |

  JMP code_04A44D                           ; $04A00F |

  JMP code_04A465                           ; $04A012 |

  JMP code_04A633                           ; $04A015 |

  JMP code_04A887                           ; $04A018 |

  JMP code_04A01E                           ; $04A01B |

code_04A01E:
  RTS                                       ; $04A01E |

  db $F3, $AA, $B5, $89, $5D, $BA, $F8, $AA ; $04A01F |
  db $37, $28, $DF, $8A, $3D, $A2           ; $04A027 |

  JMP code_04A887                           ; $04A02D |

code_04A030:
  LDA $0300,x                               ; $04A030 |
  AND #$0F                                  ; $04A033 |
  BNE code_04A04C                           ; $04A035 |
  LDA $0300,x                               ; $04A037 |
  ORA #$40                                  ; $04A03A |
  STA $0300,x                               ; $04A03C |
  INC $0300,x                               ; $04A03F |
  LDA #$60                                  ; $04A042 |
  STA $0500,x                               ; $04A044 |
  LDA #$08                                  ; $04A047 |
  STA $0520,x                               ; $04A049 |
code_04A04C:
  LDA $0300,x                               ; $04A04C |
  AND #$02                                  ; $04A04F |
  BNE code_04A0A7                           ; $04A051 |
  LDY #$1E                                  ; $04A053 |
  JSR code_1FF67C                           ; $04A055 |
  ROL $0F                                   ; $04A058 |
  LDA $04A0,x                               ; $04A05A |
  AND #$01                                  ; $04A05D |
  BEQ code_04A069                           ; $04A05F |
  LDY #$20                                  ; $04A061 |
  JSR code_1FF580                           ; $04A063 |
  JMP code_04A06E                           ; $04A066 |

code_04A069:
  LDY #$21                                  ; $04A069 |
  JSR code_1FF5C4                           ; $04A06B |
code_04A06E:
  LDA $0F                                   ; $04A06E |
  AND #$01                                  ; $04A070 |
  BEQ code_04A0A6                           ; $04A072 |
  DEC $0500,x                               ; $04A074 |
  BNE code_04A082                           ; $04A077 |
  LDA #$06                                  ; $04A079 |
  JSR reset_sprite_anim                     ; $04A07B |
  INC $0300,x                               ; $04A07E |
  RTS                                       ; $04A081 |

code_04A082:
  LDA $10                                   ; $04A082 |
  AND #$10                                  ; $04A084 |
  BEQ code_04A09A                           ; $04A086 |
  LDA #$03                                  ; $04A088 |
  JSR reset_sprite_anim                     ; $04A08A |
  LDA #$9E                                  ; $04A08D |
  STA $0440,x                               ; $04A08F |
  LDA #$04                                  ; $04A092 |
  STA $0460,x                               ; $04A094 |
  JMP face_player                           ; $04A097 |

code_04A09A:
  LDA $05C0,x                               ; $04A09A |
  CMP #$05                                  ; $04A09D |
  BEQ code_04A0A6                           ; $04A09F |
  LDA #$05                                  ; $04A0A1 |
  JSR reset_sprite_anim                     ; $04A0A3 |
code_04A0A6:
  RTS                                       ; $04A0A6 |

code_04A0A7:
  LDA $05C0,x                               ; $04A0A7 |
  CMP #$06                                  ; $04A0AA |
  BNE code_04A0C5                           ; $04A0AC |
  LDA $05E0,x                               ; $04A0AE |
  ORA $05A0,x                               ; $04A0B1 |
  BNE code_04A0F4                           ; $04A0B4 |
  JSR code_04A1B4                           ; $04A0B6 |
  LDA #$02                                  ; $04A0B9 |
  JSR reset_sprite_anim                     ; $04A0BB |
  JSR face_player                           ; $04A0BE |
  JSR code_1FF883                           ; $04A0C1 |
  RTS                                       ; $04A0C4 |

code_04A0C5:
  DEC $0520,x                               ; $04A0C5 |
  BNE code_04A0F4                           ; $04A0C8 |
  LDA #$08                                  ; $04A0CA |
  STA $0520,x                               ; $04A0CC |
  JSR code_04A0F5                           ; $04A0CF |
  INC $0500,x                               ; $04A0D2 |
  LDA $0500,x                               ; $04A0D5 |
  CMP #$06                                  ; $04A0D8 |
  BCS code_04A0DD                           ; $04A0DA |
  RTS                                       ; $04A0DC |

code_04A0DD:
  LDA #$05                                  ; $04A0DD |
  JSR reset_sprite_anim                     ; $04A0DF |
  LDA #$60                                  ; $04A0E2 |
  STA $0500,x                               ; $04A0E4 |
  DEC $0300,x                               ; $04A0E7 |
  LDA $30                                   ; $04A0EA |
  CMP #$0E                                  ; $04A0EC |
  BEQ code_04A0F4                           ; $04A0EE |
  LDA #$00                                  ; $04A0F0 |
  STA $30                                   ; $04A0F2 |
code_04A0F4:
  RTS                                       ; $04A0F4 |

code_04A0F5:
  JSR find_enemy_freeslot_y                 ; $04A0F5 |
  BCS code_04A139                           ; $04A0F8 |
  STY $00                                   ; $04A0FA |
  LDA $04A0,x                               ; $04A0FC |
  STA $04A0,y                               ; $04A0FF |
  AND #$01                                  ; $04A102 |
  TAY                                       ; $04A104 |
  LDA $0360,x                               ; $04A105 |
  CLC                                       ; $04A108 |
  ADC $A13A,y                               ; $04A109 |
  LDY $00                                   ; $04A10C |
  STA $0360,y                               ; $04A10E |
  LDA $0380,x                               ; $04A111 |
  STA $0380,y                               ; $04A114 |
  LDA $03C0,x                               ; $04A117 |
  STA $03C0,y                               ; $04A11A |
  LDA #$00                                  ; $04A11D |
  STA $04E0,y                               ; $04A11F |
  STA $0400,y                               ; $04A122 |
  LDA #$08                                  ; $04A125 |
  STA $0420,y                               ; $04A127 |
  LDA #$58                                  ; $04A12A |
  JSR code_1FF846                           ; $04A12C |
  LDA #$8B                                  ; $04A12F |
  STA $0480,y                               ; $04A131 |
  LDA #$A4                                  ; $04A134 |
  STA $0320,y                               ; $04A136 |
code_04A139:
  RTS                                       ; $04A139 |

  db $E9, $17                               ; $04A13A |

code_04A13C:
  LDA $0300,x                               ; $04A13C |
  AND #$0F                                  ; $04A13F |
  BNE code_04A182                           ; $04A141 |
  STA $0540,x                               ; $04A143 |
  INC $0300,x                               ; $04A146 |
  JSR code_1FF8C2                           ; $04A149 |
  CMP #$18                                  ; $04A14C |
  BCC code_04A182                           ; $04A14E |
  LDA $03C0                                 ; $04A150 |
  STA $0500,x                               ; $04A153 |
  LDA $E4                                   ; $04A156 |
  ADC $E5                                   ; $04A158 |
  STA $E4                                   ; $04A15A |
  AND #$0F                                  ; $04A15C |
  TAY                                       ; $04A15E |
  LDA $03C0,x                               ; $04A15F |
  CLC                                       ; $04A162 |
  ADC $A1A4,y                               ; $04A163 |
  STA $03C0                                 ; $04A166 |
  LDA #$00                                  ; $04A169 |
  STA $02                                   ; $04A16B |
  LDA #$08                                  ; $04A16D |
  STA $03                                   ; $04A16F |
  JSR code_1FFC63                           ; $04A171 |
  LDA $0C                                   ; $04A174 |
  STA $04A0,x                               ; $04A176 |
  LDA $0500,x                               ; $04A179 |
  STA $03C0                                 ; $04A17C |
  INC $0540,x                               ; $04A17F |
code_04A182:
  LDA $0540,x                               ; $04A182 |
  BEQ code_04A197                           ; $04A185 |
  LDA $04A0,x                               ; $04A187 |
  AND #$08                                  ; $04A18A |
  BEQ code_04A194                           ; $04A18C |
  JSR move_sprite_up                        ; $04A18E |
  JMP code_04A197                           ; $04A191 |

code_04A194:
  JSR move_sprite_down                      ; $04A194 |
code_04A197:
  LDA $04A0,x                               ; $04A197 |
  AND #$01                                  ; $04A19A |
  BEQ code_04A1A1                           ; $04A19C |
  JMP move_sprite_right                     ; $04A19E |

code_04A1A1:
  JMP move_sprite_left                      ; $04A1A1 |

  db $24, $0C, $10, $00, $E0, $F4, $10, $F8 ; $04A1A4 |
  db $18, $F0, $08, $10, $00, $F0, $00, $E8 ; $04A1AC |

code_04A1B4:
  LDY #$68                                  ; $04A1B4 |
code_04A1B6:
  LDA $A1E4,y                               ; $04A1B6 |
  STA $0200,y                               ; $04A1B9 |
  LDA $A1E5,y                               ; $04A1BC |
  STA $0201,y                               ; $04A1BF |
  LDA $A1E6,y                               ; $04A1C2 |
  STA $0202,y                               ; $04A1C5 |
  LDA $A1E7,y                               ; $04A1C8 |
  STA $0203,y                               ; $04A1CB |
  DEY                                       ; $04A1CE |
  DEY                                       ; $04A1CF |
  DEY                                       ; $04A1D0 |
  DEY                                       ; $04A1D1 |
  BPL code_04A1B6                           ; $04A1D2 |
  LDA $30                                   ; $04A1D4 |
  CMP #$0E                                  ; $04A1D6 |
  BEQ code_04A1E3                           ; $04A1D8 |
  LDA #$07                                  ; $04A1DA |
  STA $30                                   ; $04A1DC |
  LDA #$1E                                  ; $04A1DE |
  STA $0500                                 ; $04A1E0 |
code_04A1E3:
  RTS                                       ; $04A1E3 |

  db $20, $F7, $03, $20, $20, $F7, $03, $88 ; $04A1E4 |
  db $30, $F7, $03, $E0, $40, $F7, $03, $58 ; $04A1EC |
  db $70, $F7, $03, $C0, $80, $F7, $03, $50 ; $04A1F4 |
  db $B0, $F7, $03, $A0, $C0, $F7, $03, $E8 ; $04A1FC |
  db $D0, $F7, $03, $18, $10, $F8, $03, $58 ; $04A204 |
  db $40, $F8, $03, $D0, $50, $F8, $03, $20 ; $04A20C |
  db $60, $F8, $03, $80, $70, $F8, $03, $E8 ; $04A214 |
  db $88, $F8, $03, $B0, $98, $F8, $03, $28 ; $04A21C |
  db $D0, $F8, $03, $C0, $D8, $F8, $03, $60 ; $04A224 |
  db $18, $F9, $03, $C8, $30, $F9, $03, $40 ; $04A22C |
  db $38, $F9, $03, $A0, $60, $F9, $03, $40 ; $04A234 |
  db $78, $F9, $03, $80, $88, $F9, $03, $E8 ; $04A23C |
  db $B8, $F9, $03, $30, $C0, $F9, $03, $C8 ; $04A244 |
  db $D8, $F9, $03, $D8                     ; $04A24C |

code_04A250:
  LDA $0300,x                               ; $04A250 |
  AND #$0F                                  ; $04A253 |
  TAY                                       ; $04A255 |
  LDA $A263,y                               ; $04A256 |
  STA $00                                   ; $04A259 |
  LDA $A269,y                               ; $04A25B |
  STA $01                                   ; $04A25E |
  JMP ($0000)                               ; $04A260 |

  db $6F, $92, $B5, $CA, $FD, $46, $A2, $A2 ; $04A263 |
  db $A2, $A2, $A2, $A3                     ; $04A26B |

  LDA #$9E                                  ; $04A26F |
  STA $0440,x                               ; $04A271 |
  LDA #$04                                  ; $04A274 |
  STA $0460,x                               ; $04A276 |
  LDA $0300,x                               ; $04A279 |
  ORA #$40                                  ; $04A27C |
  STA $0300,x                               ; $04A27E |
  INC $0300,x                               ; $04A281 |
  LDA #$12                                  ; $04A284 |
  STA $0500,x                               ; $04A286 |
  LDA #$60                                  ; $04A289 |
  STA $0560,x                               ; $04A28B |
  JSR code_04A382                           ; $04A28E |
  RTS                                       ; $04A291 |

  DEC $0500,x                               ; $04A292 |
  BNE code_04A2B1                           ; $04A295 |
  LDA #$12                                  ; $04A297 |
  STA $0500,x                               ; $04A299 |
  JSR code_04A3C1                           ; $04A29C |
  INC $0520,x                               ; $04A29F |
  LDA $0520,x                               ; $04A2A2 |
  CMP #$04                                  ; $04A2A5 |
  BCC code_04A2B1                           ; $04A2A7 |
  LDA #$2E                                  ; $04A2A9 |
  STA $0520,x                               ; $04A2AB |
  INC $0300,x                               ; $04A2AE |
code_04A2B1:
  JSR code_04A377                           ; $04A2B1 |
  RTS                                       ; $04A2B4 |

  DEC $0520,x                               ; $04A2B5 |
  BNE code_04A2B1                           ; $04A2B8 |
  LDA #$00                                  ; $04A2BA |
  STA $00                                   ; $04A2BC |
  JSR code_04A3FB                           ; $04A2BE |
  INC $0300,x                               ; $04A2C1 |
  LDA #$24                                  ; $04A2C4 |
  STA $0540,x                               ; $04A2C6 |
  RTS                                       ; $04A2C9 |

  JSR code_04A377                           ; $04A2CA |
  DEC $0540,x                               ; $04A2CD |
  BNE code_04A2FC                           ; $04A2D0 |
  LDA #$0F                                  ; $04A2D2 |
  STA $0540,x                               ; $04A2D4 |
  INC $0300,x                               ; $04A2D7 |
  LDA #$80                                  ; $04A2DA |
  STA $00                                   ; $04A2DC |
  LDY #$1F                                  ; $04A2DE |
code_04A2E0:
  LDA $0300,y                               ; $04A2E0 |
  BMI code_04A2EB                           ; $04A2E3 |
code_04A2E5:
  DEY                                       ; $04A2E5 |
  CPY #$0F                                  ; $04A2E6 |
  BNE code_04A2E0                           ; $04A2E8 |
  RTS                                       ; $04A2EA |

code_04A2EB:
  LDA $00                                   ; $04A2EB |
  CMP $04C0,y                               ; $04A2ED |
  BNE code_04A2E5                           ; $04A2F0 |
  LDA #$3C                                  ; $04A2F2 |
  STA $0320,y                               ; $04A2F4 |
  LDA #$8D                                  ; $04A2F7 |
  STA $0480,y                               ; $04A2F9 |
code_04A2FC:
  RTS                                       ; $04A2FC |

  LDA $0540,x                               ; $04A2FD |
  BEQ code_04A306                           ; $04A300 |
  DEC $0540,x                               ; $04A302 |
  RTS                                       ; $04A305 |

code_04A306:
  LDA $04A0,x                               ; $04A306 |
  AND #$01                                  ; $04A309 |
  BEQ code_04A315                           ; $04A30B |
  LDY #$20                                  ; $04A30D |
  JSR code_1FF580                           ; $04A30F |
  JMP code_04A31A                           ; $04A312 |

code_04A315:
  LDY #$21                                  ; $04A315 |
  JSR code_1FF5C4                           ; $04A317 |
code_04A31A:
  LDY #$1E                                  ; $04A31A |
  JSR code_1FF67C                           ; $04A31C |
  BCC code_04A332                           ; $04A31F |
  LDA #$9E                                  ; $04A321 |
  STA $0440,x                               ; $04A323 |
  LDA #$04                                  ; $04A326 |
  STA $0460,x                               ; $04A328 |
  INC $0300,x                               ; $04A32B |
  LDA #$1D                                  ; $04A32E |
  BNE code_04A343                           ; $04A330 |
code_04A332:
  LDA $05C0,x                               ; $04A332 |
  CMP #$1D                                  ; $04A335 |
  BNE code_04A2FC                           ; $04A337 |
  LDA $05E0,x                               ; $04A339 |
  ORA $05A0,x                               ; $04A33C |
  BNE code_04A2FC                           ; $04A33F |
  LDA #$03                                  ; $04A341 |
code_04A343:
  JMP reset_sprite_anim                     ; $04A343 |

  LDA $05A0,x                               ; $04A346 |
  CMP #$01                                  ; $04A349 |
  BNE code_04A357                           ; $04A34B |
  LDA #$01                                  ; $04A34D |
  STA $05A0,x                               ; $04A34F |
  LDA #$00                                  ; $04A352 |
  STA $05E0,x                               ; $04A354 |
code_04A357:
  DEC $0560,x                               ; $04A357 |
  BNE code_04A376                           ; $04A35A |
  DEC $0300,x                               ; $04A35C |
  DEC $0300,x                               ; $04A35F |
  DEC $0300,x                               ; $04A362 |
  DEC $0300,x                               ; $04A365 |
  LDA #$60                                  ; $04A368 |
  STA $0560,x                               ; $04A36A |
  JSR face_player                           ; $04A36D |
  JSR code_1FF883                           ; $04A370 |
  JSR code_04A382                           ; $04A373 |
code_04A376:
  RTS                                       ; $04A376 |

code_04A377:
  LDA #$01                                  ; $04A377 |
  STA $05A0,x                               ; $04A379 |
  LDA #$00                                  ; $04A37C |
  STA $05E0,x                               ; $04A37E |
  RTS                                       ; $04A381 |

code_04A382:
  JSR find_enemy_freeslot_y                 ; $04A382 |
  BCS code_04A3FA                           ; $04A385 |
  LDA $04A0,x                               ; $04A387 |
  STA $04A0,y                               ; $04A38A |
  LDA $0360,x                               ; $04A38D |
  STA $0360,y                               ; $04A390 |
  LDA $0380,x                               ; $04A393 |
  STA $0380,y                               ; $04A396 |
  LDA $03C0,x                               ; $04A399 |
  STA $03C0,y                               ; $04A39C |
  LDA #$00                                  ; $04A39F |
  STA $04E0,y                               ; $04A3A1 |
  STA $0400,y                               ; $04A3A4 |
  LDA #$A9                                  ; $04A3A7 |
  STA $0320,y                               ; $04A3A9 |
  LDA #$1B                                  ; $04A3AC |
  JSR code_1FF846                           ; $04A3AE |
  LDA #$AD                                  ; $04A3B1 |
  STA $0480,y                               ; $04A3B3 |
  LDA #$80                                  ; $04A3B6 |
  STA $04C0,y                               ; $04A3B8 |
  LDA #$04                                  ; $04A3BB |
  STA $0420,y                               ; $04A3BD |
  RTS                                       ; $04A3C0 |

code_04A3C1:
  JSR find_enemy_freeslot_y                 ; $04A3C1 |
  BCS code_04A3FA                           ; $04A3C4 |
  LDA $04A0,x                               ; $04A3C6 |
  STA $04A0,y                               ; $04A3C9 |
  LDA $0360,x                               ; $04A3CC |
  STA $0360,y                               ; $04A3CF |
  LDA $0380,x                               ; $04A3D2 |
  STA $0380,y                               ; $04A3D5 |
  LDA $03C0,x                               ; $04A3D8 |
  STA $03C0,y                               ; $04A3DB |
  LDA #$00                                  ; $04A3DE |
  STA $04E0,y                               ; $04A3E0 |
  STA $0440,y                               ; $04A3E3 |
  LDA #$12                                  ; $04A3E6 |
  JSR code_1FF846                           ; $04A3E8 |
  LDA #$8B                                  ; $04A3EB |
  STA $0480,y                               ; $04A3ED |
  LDA #$04                                  ; $04A3F0 |
  STA $0460,y                               ; $04A3F2 |
  LDA #$A5                                  ; $04A3F5 |
  STA $0320,y                               ; $04A3F7 |
code_04A3FA:
  RTS                                       ; $04A3FA |

code_04A3FB:
  JSR find_enemy_freeslot_y                 ; $04A3FB |
  BCS code_04A3FA                           ; $04A3FE |
  LDA #$02                                  ; $04A400 |
  STA $04A0,y                               ; $04A402 |
  LDA $0380,x                               ; $04A405 |
  STA $0380,y                               ; $04A408 |
  LDA #$20                                  ; $04A40B |
  STA $03C0,y                               ; $04A40D |
  LDA #$00                                  ; $04A410 |
  STA $04E0,y                               ; $04A412 |
  LDA #$12                                  ; $04A415 |
  JSR code_1FF846                           ; $04A417 |
  LDA #$8B                                  ; $04A41A |
  STA $0480,y                               ; $04A41C |
  LDA #$62                                  ; $04A41F |
  STA $0400,y                               ; $04A421 |
  STA $0440,y                               ; $04A424 |
  LDA #$01                                  ; $04A427 |
  STA $0420,y                               ; $04A429 |
  STA $0460,y                               ; $04A42C |
  LDA #$A6                                  ; $04A42F |
  STA $0320,y                               ; $04A431 |
  STX $01                                   ; $04A434 |
  LDX $00                                   ; $04A436 |
  LDA $A449,x                               ; $04A438 |
  STA $0360,y                               ; $04A43B |
  LDX $01                                   ; $04A43E |
  INC $00                                   ; $04A440 |
  LDA $00                                   ; $04A442 |
  CMP #$04                                  ; $04A444 |
  BCC code_04A3FB                           ; $04A446 |
  RTS                                       ; $04A448 |

  db $40, $70, $A0, $D0                     ; $04A449 |

code_04A44D:
  LDA #$00                                  ; $04A44D |
  STA $05E0,x                               ; $04A44F |
  STA $05A0,x                               ; $04A452 |
  JSR move_sprite_up                        ; $04A455 |
  LDA $03C0,x                               ; $04A458 |
  CMP #$04                                  ; $04A45B |
  BCS code_04A464                           ; $04A45D |
  LDA #$00                                  ; $04A45F |
  STA $0300,x                               ; $04A461 |
code_04A464:
  RTS                                       ; $04A464 |

code_04A465:
  LDA $0300,x                               ; $04A465 |
  AND #$0F                                  ; $04A468 |
  BNE code_04A474                           ; $04A46A |
  LDA #$0F                                  ; $04A46C |
  STA $0500,x                               ; $04A46E |
  INC $0300,x                               ; $04A471 |
code_04A474:
  LDA $04A0,x                               ; $04A474 |
  AND #$01                                  ; $04A477 |
  BEQ code_04A481                           ; $04A479 |
  JSR move_sprite_right                     ; $04A47B |
  JMP code_04A484                           ; $04A47E |

code_04A481:
  JSR move_sprite_left                      ; $04A481 |
code_04A484:
  JSR move_sprite_down                      ; $04A484 |
  DEC $0500,x                               ; $04A487 |
  BNE code_04A499                           ; $04A48A |
  LDA $04A0,x                               ; $04A48C |
  EOR #$03                                  ; $04A48F |
  STA $04A0,x                               ; $04A491 |
  LDA #$0F                                  ; $04A494 |
  STA $0500,x                               ; $04A496 |
code_04A499:
  RTS                                       ; $04A499 |

code_04A49A:
  LDA $0300,x                               ; $04A49A |
  AND #$0F                                  ; $04A49D |
  BNE code_04A4B9                           ; $04A49F |
  JSR reset_gravity                         ; $04A4A1 |
  LDA $0300,x                               ; $04A4A4 |
  ORA #$40                                  ; $04A4A7 |
  STA $0300,x                               ; $04A4A9 |
  INC $0300,x                               ; $04A4AC |
  LDA #$05                                  ; $04A4AF |
  JSR reset_sprite_anim                     ; $04A4B1 |
  LDA #$96                                  ; $04A4B4 |
  STA $0520,x                               ; $04A4B6 |
code_04A4B9:
  LDA $0300,x                               ; $04A4B9 |
  AND #$02                                  ; $04A4BC |
  BNE code_04A522                           ; $04A4BE |
  LDA $04A0,x                               ; $04A4C0 |
  AND #$01                                  ; $04A4C3 |
  BEQ code_04A4D6                           ; $04A4C5 |
  LDY #$20                                  ; $04A4C7 |
  JSR code_1FF580                           ; $04A4C9 |
  LDA $0360,x                               ; $04A4CC |
  CMP #$CC                                  ; $04A4CF |
  BCS code_04A4E2                           ; $04A4D1 |
  JMP code_04A4EA                           ; $04A4D3 |

code_04A4D6:
  LDY #$21                                  ; $04A4D6 |
  JSR code_1FF5C4                           ; $04A4D8 |
  LDA $0360,x                               ; $04A4DB |
  CMP #$34                                  ; $04A4DE |
  BCS code_04A4EA                           ; $04A4E0 |
code_04A4E2:
  LDA $04A0,x                               ; $04A4E2 |
  EOR #$03                                  ; $04A4E5 |
  STA $04A0,x                               ; $04A4E7 |
code_04A4EA:
  LDY #$1E                                  ; $04A4EA |
  JSR code_1FF67C                           ; $04A4EC |
  LDA $0500,x                               ; $04A4EF |
  BNE code_04A504                           ; $04A4F2 |
  LDA $14                                   ; $04A4F4 |
  AND #$40                                  ; $04A4F6 |
  BEQ code_04A503                           ; $04A4F8 |
  INC $0300,x                               ; $04A4FA |
  JSR code_04A599                           ; $04A4FD |
  INC $0500,x                               ; $04A500 |
code_04A503:
  RTS                                       ; $04A503 |

code_04A504:
  DEC $0520,x                               ; $04A504 |
  BNE code_04A515                           ; $04A507 |
  INC $0300,x                               ; $04A509 |
  JSR code_04A599                           ; $04A50C |
  LDA #$96                                  ; $04A50F |
  STA $0520,x                               ; $04A511 |
  RTS                                       ; $04A514 |

code_04A515:
  LDA $14                                   ; $04A515 |
  AND #$40                                  ; $04A517 |
  BEQ code_04A503                           ; $04A519 |
  INC $0300,x                               ; $04A51B |
  JSR code_04A599                           ; $04A51E |
  RTS                                       ; $04A521 |

code_04A522:
  LDA $04A0,x                               ; $04A522 |
  AND #$01                                  ; $04A525 |
  BEQ code_04A534                           ; $04A527 |
  LDY #$20                                  ; $04A529 |
  JSR code_1FF580                           ; $04A52B |
  JSR code_04A5C1                           ; $04A52E |
  JMP code_04A53C                           ; $04A531 |

code_04A534:
  LDY #$21                                  ; $04A534 |
  JSR code_1FF5C4                           ; $04A536 |
  JSR code_04A5C1                           ; $04A539 |
code_04A53C:
  LDY #$1E                                  ; $04A53C |
  JSR code_1FF67C                           ; $04A53E |
  BCC code_04A55D                           ; $04A541 |
  DEC $0300,x                               ; $04A543 |
  JSR reset_gravity                         ; $04A546 |
  LDA #$4C                                  ; $04A549 |
  STA $0400,x                               ; $04A54B |
  LDA #$01                                  ; $04A54E |
  STA $0420,x                               ; $04A550 |
  LDA #$00                                  ; $04A553 |
  STA $0540,x                               ; $04A555 |
  LDA #$05                                  ; $04A558 |
  JMP reset_sprite_anim                     ; $04A55A |

code_04A55D:
  LDA $05C0,x                               ; $04A55D |
  CMP #$04                                  ; $04A560 |
  BEQ code_04A598                           ; $04A562 |
  LDA $0460,x                               ; $04A564 |
  BPL code_04A593                           ; $04A567 |
  LDA $04A0,x                               ; $04A569 |
  STA $0540,x                               ; $04A56C |
  LDA #$04                                  ; $04A56F |
  JSR reset_sprite_anim                     ; $04A571 |
  LDA $04A0,x                               ; $04A574 |
  PHA                                       ; $04A577 |
  JSR face_player                           ; $04A578 |
  PLA                                       ; $04A57B |
  CMP $04A0,x                               ; $04A57C |
  BEQ code_04A589                           ; $04A57F |
  LDA $0580,x                               ; $04A581 |
  EOR #$40                                  ; $04A584 |
  STA $0580,x                               ; $04A586 |
code_04A589:
  JSR code_04A5E3                           ; $04A589 |
  LDA $0540,x                               ; $04A58C |
  STA $04A0,x                               ; $04A58F |
  RTS                                       ; $04A592 |

code_04A593:
  LDA #$03                                  ; $04A593 |
  JSR reset_sprite_anim                     ; $04A595 |
code_04A598:
  RTS                                       ; $04A598 |

code_04A599:
  LDA #$88                                  ; $04A599 |
  STA $0440,x                               ; $04A59B |
  LDA #$07                                  ; $04A59E |
  STA $0460,x                               ; $04A5A0 |
  LDA $E4                                   ; $04A5A3 |
  ADC $E5                                   ; $04A5A5 |
  STA $E5                                   ; $04A5A7 |
  AND #$03                                  ; $04A5A9 |
  TAY                                       ; $04A5AB |
  LDA $A5B9,y                               ; $04A5AC |
  STA $0400,x                               ; $04A5AF |
  LDA $A5BD,y                               ; $04A5B2 |
  STA $0420,x                               ; $04A5B5 |
  RTS                                       ; $04A5B8 |

  db $00, $80, $00, $00, $01, $01, $01, $02 ; $04A5B9 |

code_04A5C1:
  LDA $04A0,x                               ; $04A5C1 |
  STA $0540,x                               ; $04A5C4 |
  LDA $04A0,x                               ; $04A5C7 |
  PHA                                       ; $04A5CA |
  JSR face_player                           ; $04A5CB |
  PLA                                       ; $04A5CE |
  CMP $04A0,x                               ; $04A5CF |
  BEQ code_04A5DC                           ; $04A5D2 |
  LDA $0580,x                               ; $04A5D4 |
  EOR #$40                                  ; $04A5D7 |
  STA $0580,x                               ; $04A5D9 |
code_04A5DC:
  LDA $0540,x                               ; $04A5DC |
  STA $04A0,x                               ; $04A5DF |
  RTS                                       ; $04A5E2 |

code_04A5E3:
  LDY #$1F                                  ; $04A5E3 |
  LDA #$80                                  ; $04A5E5 |
code_04A5E7:
  CMP $04C0,y                               ; $04A5E7 |
  BEQ code_04A632                           ; $04A5EA |
  DEY                                       ; $04A5EC |
  CPY #$0F                                  ; $04A5ED |
  BNE code_04A5E7                           ; $04A5EF |
  JSR find_enemy_freeslot_y                 ; $04A5F1 |
  BCS code_04A632                           ; $04A5F4 |
  STY $00                                   ; $04A5F6 |
  LDA $04A0,x                               ; $04A5F8 |
  STA $04A0,y                               ; $04A5FB |
  AND #$01                                  ; $04A5FE |
  TAY                                       ; $04A600 |
  LDA $0360,x                               ; $04A601 |
  CLC                                       ; $04A604 |
  ADC $A13A,y                               ; $04A605 |
  LDY $00                                   ; $04A608 |
  STA $0360,y                               ; $04A60A |
  LDA $0380,x                               ; $04A60D |
  STA $0380,y                               ; $04A610 |
  LDA $03C0,x                               ; $04A613 |
  STA $03C0,y                               ; $04A616 |
  LDA #$00                                  ; $04A619 |
  STA $04E0,y                               ; $04A61B |
  LDA #$80                                  ; $04A61E |
  STA $04C0,y                               ; $04A620 |
  LDA #$0B                                  ; $04A623 |
  JSR code_1FF846                           ; $04A625 |
  LDA #$80                                  ; $04A628 |
  STA $0480,y                               ; $04A62A |
  LDA #$A7                                  ; $04A62D |
  STA $0320,y                               ; $04A62F |
code_04A632:
  RTS                                       ; $04A632 |

code_04A633:
  LDA $0300,x                               ; $04A633 |
  AND #$0F                                  ; $04A636 |
  BNE code_04A66E                           ; $04A638 |
  LDA #$1E                                  ; $04A63A |
  STA $0500,x                               ; $04A63C |
  LDA #$00                                  ; $04A63F |
  STA $02                                   ; $04A641 |
  LDA #$04                                  ; $04A643 |
  STA $03                                   ; $04A645 |
  LDA $0360,x                               ; $04A647 |
  STA $0520,x                               ; $04A64A |
  LDA $04A0,x                               ; $04A64D |
  AND #$01                                  ; $04A650 |
  TAY                                       ; $04A652 |
  LDA $0360,x                               ; $04A653 |
  CLC                                       ; $04A656 |
  ADC $A6E3,y                               ; $04A657 |
  STA $0360,x                               ; $04A65A |
  JSR code_1FFC63                           ; $04A65D |
  LDA $0520,x                               ; $04A660 |
  STA $0360,x                               ; $04A663 |
  LDA $0C                                   ; $04A666 |
  STA $04A0,x                               ; $04A668 |
  INC $0300,x                               ; $04A66B |
code_04A66E:
  LDA $0300,x                               ; $04A66E |
  AND #$02                                  ; $04A671 |
  BNE code_04A6BA                           ; $04A673 |
  LDA $04A0,x                               ; $04A675 |
  AND #$08                                  ; $04A678 |
  BEQ code_04A684                           ; $04A67A |
  LDY #$13                                  ; $04A67C |
  JSR code_1FF642                           ; $04A67E |
  JMP code_04A689                           ; $04A681 |

code_04A684:
  LDY #$12                                  ; $04A684 |
  JSR code_1FF606                           ; $04A686 |
code_04A689:
  BCS code_04A6B1                           ; $04A689 |
  LDA $04A0,x                               ; $04A68B |
  AND #$01                                  ; $04A68E |
  BEQ code_04A6A2                           ; $04A690 |
  LDY #$1E                                  ; $04A692 |
  JSR code_1FF580                           ; $04A694 |
  LDA $0580,x                               ; $04A697 |
  AND #$BF                                  ; $04A69A |
  STA $0580,x                               ; $04A69C |
  JMP code_04A6AF                           ; $04A69F |

code_04A6A2:
  LDY #$1F                                  ; $04A6A2 |
  JSR code_1FF5C4                           ; $04A6A4 |
  LDA $0580,x                               ; $04A6A7 |
  ORA #$40                                  ; $04A6AA |
  STA $0580,x                               ; $04A6AC |
code_04A6AF:
  BCC code_04A6E2                           ; $04A6AF |
code_04A6B1:
  LDA #$0C                                  ; $04A6B1 |
  JSR reset_sprite_anim                     ; $04A6B3 |
  INC $0300,x                               ; $04A6B6 |
  RTS                                       ; $04A6B9 |

code_04A6BA:
  LDA $05C0,x                               ; $04A6BA |
  CMP #$0C                                  ; $04A6BD |
  BNE code_04A6CE                           ; $04A6BF |
  LDA $05E0,x                               ; $04A6C1 |
  ORA $05A0,x                               ; $04A6C4 |
  BNE code_04A6CE                           ; $04A6C7 |
  LDA #$0D                                  ; $04A6C9 |
  JSR reset_sprite_anim                     ; $04A6CB |
code_04A6CE:
  DEC $0500,x                               ; $04A6CE |
  BNE code_04A6E2                           ; $04A6D1 |
  LDA #$59                                  ; $04A6D3 |
  JSR reset_sprite_anim                     ; $04A6D5 |
  LDA #$00                                  ; $04A6D8 |
  STA $0500,x                               ; $04A6DA |
  LDA #$48                                  ; $04A6DD |
  STA $0320,x                               ; $04A6DF |
code_04A6E2:
  RTS                                       ; $04A6E2 |

  db $18, $E8                               ; $04A6E3 |

code_04A6E5:
  LDA $0300,x                               ; $04A6E5 |
  AND #$0F                                  ; $04A6E8 |
  BNE code_04A6FC                           ; $04A6EA |
  LDA #$B4                                  ; $04A6EC |
  STA $0500,x                               ; $04A6EE |
  LDA #$07                                  ; $04A6F1 |
  STA $0560,x                               ; $04A6F3 |
  JSR code_04A81F                           ; $04A6F6 |
  INC $0300,x                               ; $04A6F9 |
code_04A6FC:
  LDA $0300,x                               ; $04A6FC |
  AND #$0F                                  ; $04A6FF |
  CMP #$02                                  ; $04A701 |
  BEQ code_04A73C                           ; $04A703 |
  CMP #$03                                  ; $04A705 |
  BEQ code_04A77E                           ; $04A707 |
  JSR code_04A377                           ; $04A709 |
  JSR code_1FF8C2                           ; $04A70C |
  CMP #$28                                  ; $04A70F |
  BCS code_04A724                           ; $04A711 |
  LDA #$2A                                  ; $04A713 |
  STA $0440,x                               ; $04A715 |
  LDA #$08                                  ; $04A718 |
  STA $0460,x                               ; $04A71A |
  INC $0300,x                               ; $04A71D |
  INC $0300,x                               ; $04A720 |
  RTS                                       ; $04A723 |

code_04A724:
  DEC $0500,x                               ; $04A724 |
  BNE code_04A732                           ; $04A727 |
  LDA #$B4                                  ; $04A729 |
  STA $0500,x                               ; $04A72B |
  INC $0300,x                               ; $04A72E |
  RTS                                       ; $04A731 |

code_04A732:
  LDA $14                                   ; $04A732 |
  AND #$40                                  ; $04A734 |
  BEQ code_04A73B                           ; $04A736 |
  INC $0300,x                               ; $04A738 |
code_04A73B:
  RTS                                       ; $04A73B |

code_04A73C:
  LDA $05C0,x                               ; $04A73C |
  CMP #$04                                  ; $04A73F |
  BNE code_04A748                           ; $04A741 |
  DEC $0560,x                               ; $04A743 |
  BNE code_04A73B                           ; $04A746 |
code_04A748:
  LDY #$1E                                  ; $04A748 |
  JSR code_1FF67C                           ; $04A74A |
  BCC code_04A75B                           ; $04A74D |
  JSR code_04A81F                           ; $04A74F |
  LDA #$1D                                  ; $04A752 |
  JSR reset_sprite_anim                     ; $04A754 |
  DEC $0300,x                               ; $04A757 |
  RTS                                       ; $04A75A |

code_04A75B:
  LDA #$03                                  ; $04A75B |
  JSR reset_sprite_anim                     ; $04A75D |
  LDA $0460,x                               ; $04A760 |
  BPL code_04A77D                           ; $04A763 |
  DEC $0520,x                               ; $04A765 |
  BNE code_04A77D                           ; $04A768 |
  LDA $0540,x                               ; $04A76A |
  STA $0520,x                               ; $04A76D |
  JSR code_04A84A                           ; $04A770 |
  LDA #$04                                  ; $04A773 |
  JSR reset_sprite_anim                     ; $04A775 |
  LDA #$07                                  ; $04A778 |
  STA $0560,x                               ; $04A77A |
code_04A77D:
  RTS                                       ; $04A77D |

code_04A77E:
  LDA $05E0,x                               ; $04A77E |
  ORA $05A0,x                               ; $04A781 |
  BNE code_04A78B                           ; $04A784 |
  LDA #$03                                  ; $04A786 |
  JSR reset_sprite_anim                     ; $04A788 |
code_04A78B:
  LDA $04A0,x                               ; $04A78B |
  AND #$01                                  ; $04A78E |
  BEQ code_04A798                           ; $04A790 |
  JSR move_sprite_right                     ; $04A792 |
  JMP code_04A79B                           ; $04A795 |

code_04A798:
  JSR move_sprite_left                      ; $04A798 |
code_04A79B:
  LDY #$1E                                  ; $04A79B |
  JSR code_1FF67C                           ; $04A79D |
  BCC code_04A7E1                           ; $04A7A0 |
  LDA #$2A                                  ; $04A7A2 |
  STA $0440,x                               ; $04A7A4 |
  LDA #$08                                  ; $04A7A7 |
  STA $0460,x                               ; $04A7A9 |
  LDA #$1D                                  ; $04A7AC |
  JSR reset_sprite_anim                     ; $04A7AE |
  LDA $04A0,x                               ; $04A7B1 |
  AND #$01                                  ; $04A7B4 |
  BEQ code_04A7C2                           ; $04A7B6 |
  LDA $0580,x                               ; $04A7B8 |
  AND #$BF                                  ; $04A7BB |
  STA $0580,x                               ; $04A7BD |
  BNE code_04A7CA                           ; $04A7C0 |
code_04A7C2:
  LDA $0580,x                               ; $04A7C2 |
  ORA #$40                                  ; $04A7C5 |
  STA $0580,x                               ; $04A7C7 |
code_04A7CA:
  LDA $04A0,x                               ; $04A7CA |
  EOR #$03                                  ; $04A7CD |
  STA $04A0,x                               ; $04A7CF |
  DEC $0300,x                               ; $04A7D2 |
  DEC $0300,x                               ; $04A7D5 |
  JSR code_04A81F                           ; $04A7D8 |
  LDA #$07                                  ; $04A7DB |
  STA $0560,x                               ; $04A7DD |
  RTS                                       ; $04A7E0 |

code_04A7E1:
  LDA $0460,x                               ; $04A7E1 |
  BPL code_04A81E                           ; $04A7E4 |
  LDA $0540,x                               ; $04A7E6 |
  BEQ code_04A81E                           ; $04A7E9 |
  LDA $04A0,x                               ; $04A7EB |
  STA $0F                                   ; $04A7EE |
  LDA $04A0,x                               ; $04A7F0 |
  AND #$01                                  ; $04A7F3 |
  BEQ code_04A801                           ; $04A7F5 |
  LDA $0580,x                               ; $04A7F7 |
  AND #$BF                                  ; $04A7FA |
  STA $0580,x                               ; $04A7FC |
  BNE code_04A809                           ; $04A7FF |
code_04A801:
  LDA $0580,x                               ; $04A801 |
  ORA #$40                                  ; $04A804 |
  STA $0580,x                               ; $04A806 |
code_04A809:
  JSR face_player                           ; $04A809 |
  JSR code_04A84A                           ; $04A80C |
  LDA #$04                                  ; $04A80F |
  JSR reset_sprite_anim                     ; $04A811 |
  LDA #$00                                  ; $04A814 |
  STA $0540,x                               ; $04A816 |
  LDA $0F                                   ; $04A819 |
  STA $04A0,x                               ; $04A81B |
code_04A81E:
  RTS                                       ; $04A81E |

code_04A81F:
  LDA $E4                                   ; $04A81F |
  ADC $E5                                   ; $04A821 |
  STA $E5                                   ; $04A823 |
  AND #$03                                  ; $04A825 |
  TAY                                       ; $04A827 |
  LDA $A83E,y                               ; $04A828 |
  STA $0440,x                               ; $04A82B |
  LDA $A842,y                               ; $04A82E |
  STA $0460,x                               ; $04A831 |
  LDA $A846,y                               ; $04A834 |
  STA $0520,x                               ; $04A837 |
  STA $0540,x                               ; $04A83A |
  RTS                                       ; $04A83D |

  db $88, $00, $9E, $88, $06, $08, $04, $06 ; $04A83E |
  db $0A, $08, $0D, $0A                     ; $04A846 |

code_04A84A:
  JSR find_enemy_freeslot_y                 ; $04A84A |
  BCS code_04A886                           ; $04A84D |
  STY $00                                   ; $04A84F |
  LDA $04A0,x                               ; $04A851 |
  STA $04A0,y                               ; $04A854 |
  AND #$01                                  ; $04A857 |
  TAY                                       ; $04A859 |
  LDA $0360,x                               ; $04A85A |
  CLC                                       ; $04A85D |
  ADC $A13A,y                               ; $04A85E |
  LDY $00                                   ; $04A861 |
  STA $0360,y                               ; $04A863 |
  LDA $0380,x                               ; $04A866 |
  STA $0380,y                               ; $04A869 |
  LDA $03C0,x                               ; $04A86C |
  STA $03C0,y                               ; $04A86F |
  LDA #$00                                  ; $04A872 |
  STA $04E0,y                               ; $04A874 |
  LDA #$0E                                  ; $04A877 |
  JSR code_1FF846                           ; $04A879 |
  LDA #$80                                  ; $04A87C |
  STA $0480,y                               ; $04A87E |
  LDA #$A8                                  ; $04A881 |
  STA $0320,y                               ; $04A883 |
code_04A886:
  RTS                                       ; $04A886 |

code_04A887:
  LDA $0300,x                               ; $04A887 |
  AND #$0F                                  ; $04A88A |
  BNE code_04A8A1                           ; $04A88C |
  INC $0300,x                               ; $04A88E |
  LDA #$00                                  ; $04A891 |
  STA $02                                   ; $04A893 |
  LDA #$04                                  ; $04A895 |
  STA $03                                   ; $04A897 |
  JSR code_1FFC63                           ; $04A899 |
  LDA $0C                                   ; $04A89C |
  STA $04A0,x                               ; $04A89E |
code_04A8A1:
  LDA $04A0,x                               ; $04A8A1 |
  AND #$08                                  ; $04A8A4 |
  BEQ code_04A8AE                           ; $04A8A6 |
  JSR move_sprite_up                        ; $04A8A8 |
  JMP code_04A8B1                           ; $04A8AB |

code_04A8AE:
  JSR move_sprite_down                      ; $04A8AE |
code_04A8B1:
  JMP code_04A197                           ; $04A8B1 |

  db $08, $FC, $88, $BF, $08, $B6, $88, $50 ; $04A8B4 |
  db $A8, $C5, $A2, $BF, $8A, $ED, $28, $A0 ; $04A8BC |
  db $A2, $7E, $82, $F8, $28, $7F, $AA, $EA ; $04A8C4 |
  db $A8, $73, $8A, $B2, $28, $F3, $82, $D3 ; $04A8CC |
  db $A8, $FC, $AB, $FA, $8A, $41, $2A, $FF ; $04A8D4 |
  db $A8, $D4, $AA, $9F, $AA, $7A, $AA, $BE ; $04A8DC |
  db $20, $85, $AA, $4D, $8A, $DB, $68, $E7 ; $04A8E4 |
  db $A0, $F9, $88, $E7, $02, $88, $AA, $FF ; $04A8EC |
  db $82, $F5, $AA, $D8, $A8, $FE, $82, $5C ; $04A8F4 |
  db $28, $DB, $02, $8E, $2A, $5D, $A2, $FF ; $04A8FC |
  db $0A, $27, $A8, $9D, $88, $7D, $A0, $86 ; $04A904 |
  db $0A, $F4, $80, $DC, $06, $C4, $A0, $DF ; $04A90C |
  db $AA, $49, $08, $FD, $00, $97, $A0, $DD ; $04A914 |
  db $AA, $BE, $A8, $CF, $00, $CE, $A2, $47 ; $04A91C |
  db $03, $F2, $8A, $96, $9A, $DF, $A2, $FE ; $04A924 |
  db $2A, $6E, $82, $29, $A2, $7F, $AA, $8D ; $04A92C |
  db $A8, $7B, $AA, $77, $82, $75, $AA, $D4 ; $04A934 |
  db $A8, $EB, $AA, $5A, $02, $F5, $AA, $DA ; $04A93C |
  db $02, $19, $AA, $EA, $88, $DB, $A8, $9C ; $04A944 |
  db $2A, $97, $82, $F7, $32, $ED, $80, $67 ; $04A94C |
  db $A2, $DF, $2A, $3B, $AA, $BB, $AA, $F7 ; $04A954 |
  db $2A, $FF, $88, $FF, $88, $5B, $A8, $65 ; $04A95C |
  db $02, $67, $AA, $5D, $A8, $C3, $80, $F1 ; $04A964 |
  db $AB, $F6, $A2, $CF, $2A, $43, $AA, $CF ; $04A96C |
  db $AA, $7D, $20, $9F, $AA, $EE, $8A, $6E ; $04A974 |
  db $A8, $FF, $AA, $FA, $22, $8F, $2A, $DB ; $04A97C |
  db $AA, $53, $02, $DE, $A8, $81, $A0, $7F ; $04A984 |
  db $0A, $E5, $90, $51, $A2, $88, $82, $CC ; $04A98C |
  db $08, $B4, $22, $5B, $AA, $F9, $A2, $EE ; $04A994 |
  db $0A, $DF, $A8, $DE, $88, $35, $22, $C3 ; $04A99C |
  db $08, $FE, $28, $7A, $A2, $47, $8A, $EB ; $04A9A4 |
  db $80, $59, $8A, $DE, $B8, $7C, $A2, $6E ; $04A9AC |
  db $0A, $9C, $22, $4F, $28, $BD, $A8, $F9 ; $04A9B4 |
  db $AA, $AF, $AA, $97, $2A, $EF, $AA, $DA ; $04A9BC |
  db $3A, $22, $2A, $3C, $AA, $D3, $A8, $0E ; $04A9C4 |
  db $C8, $B7, $AA, $8D, $82, $EE, $02, $B7 ; $04A9CC |
  db $AA, $F5, $2A, $D8, $AA, $5C, $AB, $7C ; $04A9D4 |
  db $22, $E7, $AA, $7F, $A8, $6A, $A8, $6D ; $04A9DC |
  db $A8, $D2, $28, $0B, $AA, $B7, $A3, $52 ; $04A9E4 |
  db $88, $8B, $0C, $AD, $8A, $D7, $AA, $52 ; $04A9EC |
  db $82, $71, $22, $F7, $0B, $1F, $0A, $BE ; $04A9F4 |
  db $A2, $F7, $8A, $F9, $00, $01, $02, $03 ; $04A9FC |
  db $04, $05, $06, $07, $08, $0A, $0B, $0C ; $04AA04 |
  db $0D, $0E, $0F, $10, $11, $12, $13, $14 ; $04AA0C |
  db $15, $16, $2A, $7A, $A2, $7E, $82, $9E ; $04AA14 |
  db $98, $FF, $A0, $DD, $2A, $78, $22, $BC ; $04AA1C |
  db $BA, $1C, $28, $FE, $A8, $E9, $AA, $FB ; $04AA24 |
  db $8A, $E9, $28, $8E, $13, $18, $18, $59 ; $04AA2C |
  db $88, $69, $AA, $63, $2A, $71, $A8, $68 ; $04AA34 |
  db $AA, $5F, $02, $CF, $23, $40, $40, $40 ; $04AA3C |
  db $62, $40, $40, $61, $20, $80, $A3, $20 ; $04AA44 |
  db $20, $00, $82, $EE, $20, $0F, $82, $9F ; $04AA4C |
  db $82, $7D, $2A, $DF, $A8, $DA, $A8, $5B ; $04AA54 |
  db $AA, $7A, $AA, $DF, $02, $01, $31, $00 ; $04AA5C |
  db $0A, $00, $02, $00, $2D, $01, $00, $02 ; $04AA64 |
  db $2B, $02, $31, $02, $2B, $02, $00, $02 ; $04AA6C |
  db $31, $01, $31, $01, $2A, $01, $00, $7F ; $04AA74 |
  db $0A, $CE, $A8, $EC, $58, $5A, $0F, $20 ; $04AA7C |
  db $1A, $21, $0F, $20, $1A, $2A, $0F, $20 ; $04AA84 |
  db $10, $00, $0F, $27, $17, $00, $00, $00 ; $04AA8C |
  db $00, $00, $0F, $20, $1A, $21, $0F, $20 ; $04AA94 |
  db $1A, $2A, $0F, $20, $10, $00, $0F, $31 ; $04AA9C |
  db $21, $21, $8B, $00, $00, $00, $0F, $20 ; $04AAA4 |
  db $1A, $21, $0F, $20, $1A, $2A, $0F, $20 ; $04AAAC |
  db $10, $00, $0F, $0F, $0F, $0F, $00, $00 ; $04AAB4 |
  db $00, $00, $A8, $38, $A8, $A1, $02, $77 ; $04AABC |
  db $80, $77, $28, $89, $08, $A7, $82, $EF ; $04AAC4 |
  db $AA, $C6, $A2, $F2, $AA, $50, $2A, $3F ; $04AACC |
  db $0A, $E3, $28, $D3, $08, $FB, $A8, $BF ; $04AAD4 |
  db $0A, $FE, $28, $AF, $88, $F6, $A6, $BE ; $04AADC |
  db $AA, $BF, $A8, $7E, $A0, $EE, $A8, $6E ; $04AAE4 |
  db $2A, $7E, $8A, $DF, $07, $0B, $A8, $FD ; $04AAEC |
  db $20, $ED, $AA, $DB, $0C, $14, $FF, $5A ; $04AAF4 |
  db $8A, $5F, $A8, $2C, $01, $01, $01, $01 ; $04AAFC |
  db $02, $02, $02, $03, $03, $03, $03, $03 ; $04AB04 |
  db $04, $05, $05, $05, $05, $06, $08, $09 ; $04AB0C |
  db $09, $09, $09, $0A, $0A, $0B, $0B, $0B ; $04AB14 |
  db $0B, $0B, $0D, $0E, $0E, $0E, $0E, $0E ; $04AB1C |
  db $0F, $0F, $10, $11, $12, $12, $12, $12 ; $04AB24 |
  db $13, $15, $FF, $9D, $AA, $69, $8A, $FC ; $04AB2C |
  db $88, $DD, $28, $9D, $A2, $FC, $28, $36 ; $04AB34 |
  db $A8, $9E, $2B, $DF, $82, $F7, $08, $93 ; $04AB3C |
  db $A8, $55, $AA, $F4, $AA, $FE, $08, $F7 ; $04AB44 |
  db $98, $7F, $A0, $47, $AA, $CA, $20, $2E ; $04AB4C |
  db $8A, $7F, $80, $7F, $8A, $6E, $A0, $5B ; $04AB54 |
  db $02, $E3, $8A, $47, $80, $6F, $A8, $BE ; $04AB5C |
  db $8A, $D9, $22, $D5, $A2, $FA, $8A, $39 ; $04AB64 |
  db $A3, $FB, $88, $EF, $80, $BC, $09, $2F ; $04AB6C |
  db $AA, $FB, $A8, $DA, $0A, $FF, $A0, $A7 ; $04AB74 |
  db $A8, $3E, $AA, $3F, $A8, $85, $A2, $58 ; $04AB7C |
  db $0A, $D3, $AA, $74, $A0, $96, $88, $DF ; $04AB84 |
  db $2A, $D3, $2A, $E7, $BA, $B1, $A2, $ED ; $04AB8C |
  db $A0, $5A, $0A, $ED, $AA, $58, $82, $1E ; $04AB94 |
  db $AA, $EF, $8A, $FD, $A8, $95, $80, $7B ; $04AB9C |
  db $28, $FB, $88, $83, $28, $AF, $CA, $2F ; $04ABA4 |
  db $88, $FB, $8E, $26, $A2, $80, $22, $4E ; $04ABAC |
  db $A2, $F7, $AA, $D3, $AA, $AA, $8E, $77 ; $04ABB4 |
  db $A8, $3F, $AE, $DF, $1E, $2D, $AA, $AF ; $04ABBC |
  db $2A, $4B, $80, $BC, $08, $FF, $2A, $B9 ; $04ABC4 |
  db $0A, $BA, $2A, $E9, $A8, $65, $8A, $9F ; $04ABCC |
  db $00, $BA, $08, $7A, $1A, $F3, $0A, $3D ; $04ABD4 |
  db $A2, $FD, $AA, $79, $88, $EE, $A2, $5E ; $04ABDC |
  db $82, $4D, $28, $0C, $AA, $63, $A8, $57 ; $04ABE4 |
  db $AA, $AE, $A8, $82, $A2, $7F, $A8, $76 ; $04ABEC |
  db $22, $A2, $AA, $C8, $A8, $FD, $0A, $FB ; $04ABF4 |
  db $AA, $EF, $2A, $57, $18, $48, $B8, $F8 ; $04ABFC |
  db $58, $B8, $D8, $28, $48, $58, $88, $B8 ; $04AC04 |
  db $3E, $97, $98, $A8, $B8, $98, $48, $28 ; $04AC0C |
  db $68, $98, $A8, $38, $68, $A0, $89, $8C ; $04AC14 |
  db $C7, $AC, $80, $A0, $89, $8C, $C7, $AC ; $04AC1C |
  db $98, $C8, $B8, $D0, $18, $58, $98, $E8 ; $04AC24 |
  db $30, $C0, $FF, $10, $2E, $00, $44, $00 ; $04AC2C |
  db $08, $04, $CA, $00, $39, $04, $92, $10 ; $04AC34 |
  db $D0, $05, $0D, $00, $91, $14, $2A, $04 ; $04AC3C |
  db $02, $00, $00, $41, $10, $01, $29, $14 ; $04AC44 |
  db $10, $40, $80, $00, $92, $04, $68, $05 ; $04AC4C |
  db $03, $04, $46, $44, $84, $00, $96, $05 ; $04AC54 |
  db $80, $80, $00, $00, $A4, $50, $38, $00 ; $04AC5C |
  db $10, $00, $16, $04, $80, $44, $16, $01 ; $04AC64 |
  db $61, $44, $71, $04, $12, $01, $81, $10 ; $04AC6C |
  db $A2, $54, $47, $00, $13, $48, $50, $00 ; $04AC74 |
  db $44, $00, $00, $04, $10, $00, $40, $01 ; $04AC7C |
  db $06, $10, $20, $04, $40, $00, $80, $10 ; $04AC84 |
  db $80, $50, $00, $01, $20, $00, $9A, $08 ; $04AC8C |
  db $01, $40, $04, $00, $1C, $00, $C4, $40 ; $04AC94 |
  db $20, $41, $C0, $00, $62, $14, $C0, $01 ; $04AC9C |
  db $80, $10, $00, $00, $40, $01, $60, $00 ; $04ACA4 |
  db $BB, $04, $00, $40, $80, $10, $C9, $D0 ; $04ACAC |
  db $02, $50, $30, $01, $09, $40, $32, $01 ; $04ACB4 |
  db $40, $80, $02, $A0, $08, $10, $A0, $40 ; $04ACBC |
  db $00, $00, $A0, $04, $08, $00, $40, $50 ; $04ACC4 |
  db $84, $90, $10, $00, $05, $00, $8A, $12 ; $04ACCC |
  db $60, $02, $00, $00, $18, $40, $08, $00 ; $04ACD4 |
  db $54, $94, $09, $44, $22, $40, $00, $07 ; $04ACDC |
  db $04, $50, $6B, $40, $90, $04, $70, $50 ; $04ACE4 |
  db $40, $10, $84, $51, $B0, $00, $82, $50 ; $04ACEC |
  db $07, $21, $29, $10, $0E, $48, $43, $40 ; $04ACF4 |
  db $1A, $00, $E0, $51, $88, $78, $88, $B8 ; $04ACFC |
  db $B8, $48, $88, $B8, $28, $88, $48, $48 ; $04AD04 |
  db $30, $5A, $98, $5A, $5A, $68, $A4, $44 ; $04AD0C |
  db $58, $58, $A4, $54, $74, $00, $43, $53 ; $04AD14 |
  db $3F, $2F, $50, $00, $73, $83, $6F, $5F ; $04AD1C |
  db $64, $48, $30, $F0, $04, $F0, $04, $F0 ; $04AD24 |
  db $04, $00, $FF, $51, $02, $21, $08, $01 ; $04AD2C |
  db $0A, $41, $08, $00, $40, $50, $06, $04 ; $04AD34 |
  db $0E, $44, $F2, $84, $00, $01, $44, $00 ; $04AD3C |
  db $00, $51, $10, $00, $04, $00, $30, $00 ; $04AD44 |
  db $04, $30, $00, $00, $CC, $00, $05, $10 ; $04AD4C |
  db $80, $40, $35, $00, $26, $00, $21, $01 ; $04AD54 |
  db $61, $01, $8C, $10, $00, $00, $06, $00 ; $04AD5C |
  db $CC, $00, $67, $04, $0C, $40, $42, $51 ; $04AD64 |
  db $07, $00, $92, $11, $95, $44, $36, $41 ; $04AD6C |
  db $75, $10, $90, $04, $E2, $01, $6D, $00 ; $04AD74 |
  db $9C, $14, $91, $05, $00, $00, $09, $00 ; $04AD7C |
  db $00, $01, $80, $01, $05, $04, $A0, $04 ; $04AD84 |
  db $81, $15, $00, $40, $0E, $00, $04, $40 ; $04AD8C |
  db $00, $00, $18, $00, $0A, $01, $00, $01 ; $04AD94 |
  db $04, $00, $59, $10, $04, $04, $56, $14 ; $04AD9C |
  db $2A, $14, $41, $00, $C2, $40, $33, $11 ; $04ADA4 |
  db $A0, $00, $80, $11, $9C, $40, $48, $05 ; $04ADAC |
  db $10, $60, $50, $01, $57, $11, $80, $01 ; $04ADB4 |
  db $00, $11, $30, $50, $62, $00, $34, $04 ; $04ADBC |
  db $20, $00, $60, $00, $02, $11, $0D, $00 ; $04ADC4 |
  db $00, $00, $14, $40, $08, $41, $21, $00 ; $04ADCC |
  db $00, $00, $91, $05, $0E, $00, $20, $01 ; $04ADD4 |
  db $C2, $20, $6C, $45, $F4, $40, $88, $05 ; $04ADDC |
  db $46, $80, $61, $10, $09, $41, $4E, $00 ; $04ADE4 |
  db $C0, $20, $92, $04, $10, $15, $A1, $01 ; $04ADEC |
  db $71, $18, $C1, $05, $C5, $44, $AC, $11 ; $04ADF4 |
  db $46, $07, $B3, $01, $20, $20, $20, $26 ; $04ADFC |
  db $26, $20, $26, $26, $20, $20, $26, $50 ; $04AE04 |
  db $62, $51, $52, $51, $51, $20, $12, $12 ; $04AE0C |
  db $55, $50, $12, $09, $09, $77, $72, $73 ; $04AE14 |
  db $75, $76, $62, $77, $72, $73, $75, $76 ; $04AE1C |
  db $09, $50, $62, $27, $27, $27, $27, $27 ; $04AE24 |
  db $27, $4B, $FF, $00, $02, $00, $98, $00 ; $04AE2C |
  db $40, $00, $E4, $40, $41, $04, $9D, $00 ; $04AE34 |
  db $91, $00, $82, $01, $20, $04, $14, $00 ; $04AE3C |
  db $00, $00, $00, $00, $84, $11, $00, $00 ; $04AE44 |
  db $08, $01, $24, $40, $28, $14, $E8, $59 ; $04AE4C |
  db $00, $00, $21, $40, $40, $00, $00, $00 ; $04AE54 |
  db $40, $40, $A1, $C0, $04, $01, $04, $40 ; $04AE5C |
  db $40, $4C, $90, $40, $8C, $14, $01, $CC ; $04AE64 |
  db $09, $04, $74, $00, $02, $11, $10, $04 ; $04AE6C |
  db $C8, $40, $98, $31, $98, $05, $45, $05 ; $04AE74 |
  db $78, $04, $1C, $04, $01, $10, $10, $10 ; $04AE7C |
  db $09, $00, $11, $11, $68, $01, $20, $10 ; $04AE84 |
  db $21, $01, $30, $00, $00, $00, $20, $00 ; $04AE8C |
  db $01, $10, $20, $10, $40, $40, $02, $00 ; $04AE94 |
  db $3E, $00, $18, $40, $C8, $04, $A4, $10 ; $04AE9C |
  db $40, $00, $31, $10, $46, $10, $07, $00 ; $04AEA4 |
  db $62, $C1, $00, $46, $B0, $C4, $90, $C0 ; $04AEAC |
  db $20, $50, $48, $41, $C8, $42, $C0, $18 ; $04AEB4 |
  db $63, $50, $40, $50, $00, $10, $D2, $44 ; $04AEBC |
  db $28, $00, $00, $41, $10, $01, $21, $40 ; $04AEC4 |
  db $4B, $05, $06, $00, $00, $C4, $08, $41 ; $04AECC |
  db $34, $10, $20, $01, $C8, $44, $04, $00 ; $04AED4 |
  db $60, $14, $00, $10, $0E, $40, $14, $02 ; $04AEDC |
  db $9E, $41, $A1, $51, $19, $45, $82, $44 ; $04AEE4 |
  db $29, $14, $B1, $15, $92, $42, $67, $40 ; $04AEEC |
  db $28, $00, $E0, $10, $16, $00, $04, $84 ; $04AEF4 |
  db $D2, $40, $50, $01, $00, $00, $00, $01 ; $04AEFC |
  db $02, $00, $00, $00, $03, $04, $05, $06 ; $04AF04 |
  db $07, $08, $09, $08, $0A, $0B, $0C, $0D ; $04AF0C |
  db $0E, $03, $0F, $05, $10, $11, $12, $13 ; $04AF14 |
  db $14, $15, $0B, $16, $0A, $0B, $0C, $17 ; $04AF1C |
  db $18, $19, $1A, $1B, $19, $1C, $1B, $1D ; $04AF24 |
  db $1E, $08, $1F, $08, $20, $21, $20, $20 ; $04AF2C |
  db $20, $20, $21, $20, $22, $23, $22, $22 ; $04AF34 |
  db $22, $22, $23, $22, $01, $02, $00, $00 ; $04AF3C |
  db $00, $01, $02, $00, $06, $07, $08, $09 ; $04AF44 |
  db $08, $06, $07, $03, $0D, $0E, $03, $0F ; $04AF4C |
  db $05, $0D, $0E, $0A, $13, $14, $15, $0B ; $04AF54 |
  db $16, $13, $14, $10, $17, $18, $19, $24 ; $04AF5C |
  db $1B, $17, $18, $0A, $1D, $1E, $25, $26 ; $04AF64 |
  db $27, $1D, $1E, $19, $20, $20, $28, $29 ; $04AF6C |
  db $2A, $20, $20, $20, $22, $22, $22, $23 ; $04AF74 |
  db $22, $22, $22, $22, $00, $00, $01, $02 ; $04AF7C |
  db $00, $00, $00, $00, $04, $05, $06, $07 ; $04AF84 |
  db $03, $04, $05, $08, $0B, $0C, $0D, $0E ; $04AF8C |
  db $0A, $0B, $0C, $08, $11, $12, $13, $14 ; $04AF94 |
  db $10, $11, $12, $08, $0B, $0C, $17, $18 ; $04AF9C |
  db $0A, $0B, $2B, $2C, $1C, $1B, $1D, $1E ; $04AFA4 |
  db $19, $1C, $2D, $2E, $21, $20, $20, $20 ; $04AFAC |
  db $20, $21, $2F, $30, $23, $22, $22, $22 ; $04AFB4 |
  db $22, $23, $2F, $30, $00, $00, $00, $00 ; $04AFBC |
  db $00, $00, $00, $31, $08, $08, $08, $08 ; $04AFC4 |
  db $08, $08, $08, $32, $08, $08, $08, $08 ; $04AFCC |
  db $33, $2C, $08, $32, $08, $34, $35, $08 ; $04AFD4 |
  db $2D, $2E, $08, $32, $08, $36, $37, $08 ; $04AFDC |
  db $38, $39, $08, $32, $08, $08, $08, $08 ; $04AFE4 |
  db $3A, $3B, $3C, $32, $20, $20, $21, $20 ; $04AFEC |
  db $20, $20, $3D, $32, $22, $22, $23, $22 ; $04AFF4 |
  db $22, $22, $3E, $32, $3F, $00, $00, $00 ; $04AFFC |
  db $00, $00, $40, $32, $41, $42, $08, $08 ; $04B004 |
  db $08, $08, $36, $32, $41, $43, $44, $08 ; $04B00C |
  db $08, $08, $08, $32, $41, $45, $2A, $44 ; $04B014 |
  db $08, $08, $08, $32, $41, $46, $22, $2A ; $04B01C |
  db $44, $08, $08, $32, $41, $46, $47, $47 ; $04B024 |
  db $2A, $44, $08, $32, $41, $46, $47, $47 ; $04B02C |
  db $22, $2A, $20, $28, $41, $46, $22, $22 ; $04B034 |
  db $22, $22, $48, $22, $41, $49, $22, $22 ; $04B03C |
  db $4A, $00, $31, $22, $41, $4B, $00, $4C ; $04B044 |
  db $4D, $08, $4E, $4F, $41, $37, $08, $50 ; $04B04C |
  db $51, $08, $08, $52, $41, $08, $08, $53 ; $04B054 |
  db $54, $55, $56, $52, $41, $08, $08, $57 ; $04B05C |
  db $08, $50, $51, $52, $2A, $20, $20, $20 ; $04B064 |
  db $20, $20, $58, $52, $22, $22, $22, $22 ; $04B06C |
  db $22, $22, $59, $5A, $22, $22, $22, $22 ; $04B074 |
  db $22, $22, $5B, $5C, $22, $4A, $00, $4F ; $04B07C |
  db $22, $22, $02, $52, $4A, $5D, $08, $5E ; $04B084 |
  db $00, $00, $07, $52, $4D, $08, $08, $08 ; $04B08C |
  db $08, $08, $37, $52, $4D, $08, $08, $08 ; $04B094 |
  db $08, $08, $42, $5F, $4D, $3C, $08, $08 ; $04B09C |
  db $42, $3C, $60, $61, $62, $63, $08, $08 ; $04B0A4 |
  db $60, $64, $08, $52, $65, $66, $20, $67 ; $04B0AC |
  db $68, $68, $68, $69, $65, $6A, $22, $22 ; $04B0B4 |
  db $22, $22, $22, $22, $4D, $6B, $6C, $6D ; $04B0BC |
  db $6E, $6F, $6F, $70, $4D, $06, $71, $72 ; $04B0C4 |
  db $08, $08, $08, $08, $4D, $36, $08, $08 ; $04B0CC |
  db $08, $08, $3C, $08, $4D, $08, $08, $08 ; $04B0D4 |
  db $08, $08, $73, $74, $4D, $08, $08, $42 ; $04B0DC |
  db $08, $08, $36, $08, $75, $20, $76, $77 ; $04B0E4 |
  db $08, $08, $08, $08, $23, $22, $78, $79 ; $04B0EC |
  db $20, $20, $20, $20, $22, $22, $22, $30 ; $04B0F4 |
  db $22, $22, $22, $22, $00, $00, $00, $00 ; $04B0FC |
  db $00, $00, $00, $00, $7A, $7B, $7C, $7D ; $04B104 |
  db $7E, $7A, $7B, $7C, $7F, $80, $81, $82 ; $04B10C |
  db $83, $7F, $80, $84, $74, $74, $74, $74 ; $04B114 |
  db $85, $86, $87, $73, $7A, $7B, $7C, $7D ; $04B11C |
  db $88, $7A, $7B, $89, $7F, $80, $81, $82 ; $04B124 |
  db $8A, $7F, $80, $81, $20, $20, $20, $21 ; $04B12C |
  db $20, $20, $20, $21, $22, $22, $22, $23 ; $04B134 |
  db $22, $22, $22, $23, $8B, $8B, $8B, $8B ; $04B13C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B144 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B14C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B154 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B15C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B164 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B16C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B174 |
  db $8B, $8B, $8B, $8B, $00, $00, $8C, $00 ; $04B17C |
  db $00, $8C, $00, $31, $7D, $8D, $8E, $08 ; $04B184 |
  db $08, $8E, $08, $32, $82, $8F, $90, $08 ; $04B18C |
  db $08, $91, $08, $32, $74, $74, $74, $74 ; $04B194 |
  db $74, $85, $08, $32, $7D, $7E, $7A, $7B ; $04B19C |
  db $08, $37, $08, $32, $82, $8A, $7F, $80 ; $04B1A4 |
  db $08, $08, $3C, $32, $20, $20, $20, $21 ; $04B1AC |
  db $20, $20, $3D, $32, $22, $22, $22, $23 ; $04B1B4 |
  db $22, $22, $3E, $32, $3F, $00, $00, $00 ; $04B1BC |
  db $00, $00, $92, $32, $41, $08, $08, $08 ; $04B1C4 |
  db $08, $08, $36, $32, $41, $42, $08, $08 ; $04B1CC |
  db $08, $08, $08, $32, $41, $93, $27, $08 ; $04B1D4 |
  db $08, $08, $08, $32, $41, $94, $2A, $27 ; $04B1DC |
  db $08, $08, $08, $32, $41, $46, $47, $2A ; $04B1E4 |
  db $27, $08, $08, $32, $41, $46, $47, $47 ; $04B1EC |
  db $2A, $20, $20, $28, $41, $95, $22, $22 ; $04B1F4 |
  db $22, $22, $48, $22, $41, $96, $00, $00 ; $04B1FC |
  db $00, $00, $00, $31, $41, $97, $97, $98 ; $04B204 |
  db $99, $9A, $98, $32, $41, $8B, $8B, $9B ; $04B20C |
  db $9C, $9D, $9B, $32, $41, $9E, $9E, $9F ; $04B214 |
  db $A0, $20, $A1, $32, $A2, $A3, $A3, $A4 ; $04B21C |
  db $A5, $22, $A6, $32, $22, $47, $47, $47 ; $04B224 |
  db $2F, $22, $A7, $32, $22, $22, $22, $22 ; $04B22C |
  db $2F, $22, $A7, $32, $22, $22, $22, $22 ; $04B234 |
  db $2F, $22, $A8, $32, $3F, $00, $00, $00 ; $04B23C |
  db $00, $00, $92, $32, $41, $08, $08, $08 ; $04B244 |
  db $08, $08, $36, $A9, $41, $08, $3C, $08 ; $04B24C |
  db $08, $08, $42, $AA, $41, $08, $73, $74 ; $04B254 |
  db $74, $74, $85, $AB, $41, $08, $36, $08 ; $04B25C |
  db $08, $08, $37, $08, $41, $08, $08, $08 ; $04B264 |
  db $08, $08, $08, $08, $2A, $20, $21, $20 ; $04B26C |
  db $20, $20, $21, $20, $22, $22, $23, $22 ; $04B274 |
  db $22, $22, $23, $22, $3F, $00, $00, $00 ; $04B27C |
  db $00, $00, $00, $00, $AC, $08, $08, $08 ; $04B284 |
  db $08, $08, $08, $AD, $08, $08, $08, $08 ; $04B28C |
  db $08, $08, $08, $AE, $08, $08, $08, $25 ; $04B294 |
  db $27, $08, $08, $AF, $08, $08, $25, $28 ; $04B29C |
  db $2A, $27, $08, $B0, $08, $25, $28, $47 ; $04B2A4 |
  db $47, $2A, $27, $AF, $20, $28, $29, $29 ; $04B2AC |
  db $29, $29, $2A, $20, $22, $22, $23, $23 ; $04B2B4 |
  db $23, $23, $22, $22, $00, $00, $00, $00 ; $04B2BC |
  db $2F, $22, $A7, $32, $B1, $B1, $B2, $B1 ; $04B2C4 |
  db $38, $22, $A8, $32, $97, $97, $B3, $97 ; $04B2CC |
  db $B4, $B5, $B6, $32, $8B, $8B, $9B, $8B ; $04B2D4 |
  db $B7, $B8, $B9, $32, $BA, $BA, $9F, $BA ; $04B2DC |
  db $BB, $BC, $BD, $BE, $BF, $BF, $9B, $BF ; $04B2E4 |
  db $2D, $22, $22, $22, $20, $20, $21, $20 ; $04B2EC |
  db $2F, $22, $22, $22, $22, $22, $23, $22 ; $04B2F4 |
  db $2F, $22, $22, $22, $41, $C0, $00, $00 ; $04B2FC |
  db $00, $00, $00, $31, $41, $C1, $08, $08 ; $04B304 |
  db $08, $08, $08, $32, $41, $08, $08, $08 ; $04B30C |
  db $08, $08, $C2, $32, $41, $08, $C3, $08 ; $04B314 |
  db $C3, $08, $08, $32, $41, $08, $08, $08 ; $04B31C |
  db $08, $08, $C2, $32, $41, $08, $08, $08 ; $04B324 |
  db $08, $08, $3C, $32, $2A, $68, $68, $68 ; $04B32C |
  db $C4, $20, $A1, $32, $22, $22, $22, $22 ; $04B334 |
  db $22, $22, $A6, $32, $47, $30, $00, $00 ; $04B33C |
  db $00, $00, $00, $00, $47, $30, $08, $08 ; $04B344 |
  db $3C, $08, $08, $3C, $47, $30, $08, $3C ; $04B34C |
  db $73, $74, $74, $C5, $47, $02, $08, $73 ; $04B354 |
  db $85, $08, $08, $25, $3F, $07, $C6, $C7 ; $04B35C |
  db $C8, $C9, $08, $32, $41, $CA, $CB, $CC ; $04B364 |
  db $CC, $CD, $08, $32, $41, $93, $20, $20 ; $04B36C |
  db $20, $20, $20, $28, $41, $CE, $22, $22 ; $04B374 |
  db $22, $22, $22, $22, $00, $00, $00, $00 ; $04B37C |
  db $00, $07, $08, $08, $08, $08, $08, $08 ; $04B384 |
  db $08, $37, $08, $08, $08, $08, $08, $08 ; $04B38C |
  db $08, $08, $08, $08, $20, $20, $44, $08 ; $04B394 |
  db $08, $08, $08, $08, $47, $47, $2A, $44 ; $04B39C |
  db $08, $08, $08, $08, $47, $47, $22, $2A ; $04B3A4 |
  db $44, $42, $08, $08, $47, $47, $22, $22 ; $04B3AC |
  db $2A, $CF, $08, $08, $47, $47, $22, $22 ; $04B3B4 |
  db $22, $D0, $08, $08, $08, $08, $08, $08 ; $04B3BC |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3C4 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3CC |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3D4 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3DC |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3E4 |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3EC |
  db $08, $08, $08, $08, $08, $08, $08, $08 ; $04B3F4 |
  db $08, $08, $08, $08, $08, $08, $8C, $22 ; $04B3FC |
  db $22, $22, $22, $22, $08, $08, $D1, $00 ; $04B404 |
  db $00, $00, $00, $00, $08, $08, $D2, $08 ; $04B40C |
  db $08, $08, $08, $D3, $08, $08, $D4, $08 ; $04B414 |
  db $08, $08, $3C, $D3, $08, $08, $D5, $D6 ; $04B41C |
  db $D6, $D6, $A0, $20, $08, $08, $2D, $22 ; $04B424 |
  db $22, $22, $A5, $22, $08, $08, $2F, $22 ; $04B42C |
  db $22, $22, $2F, $22, $08, $08, $2F, $22 ; $04B434 |
  db $22, $22, $D7, $22, $47, $22, $47, $22 ; $04B43C |
  db $47, $22, $47, $22, $00, $00, $00, $00 ; $04B444 |
  db $00, $00, $00, $00, $D8, $08, $08, $08 ; $04B44C |
  db $08, $08, $08, $D3, $D8, $08, $08, $08 ; $04B454 |
  db $08, $08, $08, $D3, $20, $20, $20, $20 ; $04B45C |
  db $20, $20, $20, $20, $47, $22, $47, $22 ; $04B464 |
  db $47, $22, $47, $22, $22, $22, $22, $22 ; $04B46C |
  db $22, $22, $22, $22, $22, $22, $22, $22 ; $04B474 |
  db $22, $22, $22, $22, $4A, $00, $00, $00 ; $04B47C |
  db $00, $00, $00, $4C, $5D, $D9, $DA, $08 ; $04B484 |
  db $08, $D9, $DA, $52, $D8, $13, $14, $08 ; $04B48C |
  db $08, $13, $14, $52, $D8, $DB, $DC, $08 ; $04B494 |
  db $08, $DB, $DC, $52, $DD, $13, $14, $08 ; $04B49C |
  db $08, $13, $14, $52, $4D, $DE, $DF, $08 ; $04B4A4 |
  db $08, $DE, $DF, $52, $E0, $21, $21, $20 ; $04B4AC |
  db $20, $21, $21, $E1, $22, $23, $23, $22 ; $04B4B4 |
  db $22, $23, $23, $22, $8B, $8B, $8B, $8B ; $04B4BC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4C4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4CC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4D4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4DC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4E4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4EC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4F4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B4FC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B504 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B50C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B514 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B51C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B524 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B52C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B534 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B53C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B544 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B54C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B554 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B55C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B564 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B56C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B574 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B57C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B584 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B58C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B594 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B59C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5A4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5AC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5B4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5BC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5C4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5CC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5D4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5DC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5E4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5EC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5F4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B5FC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B604 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B60C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B614 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B61C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B624 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B62C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B634 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B63C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B644 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B64C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B654 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B65C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B664 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B66C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B674 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B67C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B684 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B68C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B694 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B69C |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6A4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6AC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6B4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6BC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6C4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6CC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6D4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6DC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6E4 |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6EC |
  db $8B, $8B, $8B, $8B, $8B, $8B, $8B, $8B ; $04B6F4 |
  db $8B, $8B, $8B, $8B, $16, $15, $AE, $AD ; $04B6FC |
  db $B8, $15, $98, $16, $16, $BB, $15, $9B ; $04B704 |
  db $04, $04, $04, $C0, $D4, $D5, $C1, $C2 ; $04B70C |
  db $04, $04, $C3, $04, $A4, $15, $AC, $AD ; $04B714 |
  db $16, $A7, $AE, $AF, $04, $04, $04, $04 ; $04B71C |
  db $D9, $DA, $D4, $D5, $04, $C8, $04, $C8 ; $04B724 |
  db $C9, $CA, $C9, $CA, $CB, $04, $CB, $04 ; $04B72C |
  db $09, $D4, $C0, $C1, $D5, $09, $C2, $C3 ; $04B734 |
  db $D9, $DA, $C1, $C2, $04, $D0, $04, $C0 ; $04B73C |
  db $D1, $D2, $C1, $C2, $D3, $04, $C3, $04 ; $04B744 |
  db $C8, $C9, $C8, $C9, $CA, $CB, $CA, $CB ; $04B74C |
  db $C4, $C8, $C4, $C8, $CB, $C4, $CB, $C4 ; $04B754 |
  db $D0, $D1, $04, $D9, $D2, $D3, $DA, $04 ; $04B75C |
  db $04, $D0, $04, $04, $D1, $D2, $D9, $DA ; $04B764 |
  db $D3, $04, $04, $04, $D1, $D2, $DC, $DD ; $04B76C |
  db $04, $DC, $04, $D9, $DD, $04, $DA, $04 ; $04B774 |
  db $DC, $DD, $D9, $DA, $A2, $A1, $15, $16 ; $04B77C |
  db $A2, $A1, $70, $71, $16, $15, $15, $16 ; $04B784 |
  db $78, $79, $15, $16, $BF, $B7, $BC, $BD ; $04B78C |
  db $BF, $A1, $BC, $16, $A6, $A5, $15, $16 ; $04B794 |
  db $A2, $B7, $15, $BD, $A6, $15, $15, $16 ; $04B79C |
  db $16, $15, $70, $71, $16, $A5, $15, $16 ; $04B7A4 |
  db $CB, $04, $A0, $A1, $04, $08, $A2, $A3 ; $04B7AC |
  db $A8, $15, $B0, $16, $16, $AB, $15, $B3 ; $04B7B4 |
  db $B8, $15, $B8, $16, $16, $BB, $15, $BB ; $04B7BC |
  db $16, $15, $AA, $16, $B4, $15, $BC, $16 ; $04B7C4 |
  db $08, $04, $A0, $A1, $08, $04, $10, $11 ; $04B7CC |
  db $04, $08, $11, $12, $09, $04, $04, $04 ; $04B7D4 |
  db $04, $09, $04, $04, $98, $15, $A4, $16 ; $04B7DC |
  db $16, $9B, $15, $A7, $AC, $AE, $09, $04 ; $04B7E4 |
  db $AD, $AF, $04, $09, $04, $04, $08, $04 ; $04B7EC |
  db $A3, $06, $AB, $07, $9A, $07, $A7, $07 ; $04B7F4 |
  db $16, $15, $15, $A9, $A7, $07, $AF, $07 ; $04B7FC |
  db $16, $B5, $15, $BD, $04, $04, $04, $08 ; $04B804 |
  db $04, $A0, $04, $A8, $B7, $04, $A5, $B7 ; $04B80C |
  db $06, $B0, $07, $B8, $07, $B8, $07, $B8 ; $04B814 |
  db $70, $71, $78, $79, $16, $16, $15, $16 ; $04B81C |
  db $04, $B8, $04, $98, $16, $15, $A9, $AD ; $04B824 |
  db $04, $A4, $04, $AC, $16, $15, $AE, $BE ; $04B82C |
  db $BD, $04, $B5, $04, $B4, $15, $9E, $AD ; $04B834 |
  db $16, $15, $AE, $AA, $04, $9E, $04, $04 ; $04B83C |
  db $9F, $04, $04, $04, $04, $BC, $04, $B4 ; $04B844 |
  db $BF, $A1, $BC, $A9, $A2, $A1, $AE, $AD ; $04B84C |
  db $A2, $A1, $AE, $AA, $B7, $04, $BD, $04 ; $04B854 |
  db $9E, $9F, $04, $04, $B7, $04, $B5, $08 ; $04B85C |
  db $A5, $A0, $15, $A8, $06, $BC, $07, $B4 ; $04B864 |
  db $16, $B0, $15, $B8, $07, $BC, $07, $B4 ; $04B86C |
  db $BD, $04, $9F, $04, $04, $BC, $04, $9E ; $04B874 |
  db $04, $BC, $08, $B4, $04, $10, $04, $09 ; $04B87C |
  db $12, $BC, $09, $B4, $BD, $06, $B5, $07 ; $04B884 |
  db $A3, $04, $AB, $04, $12, $04, $09, $04 ; $04B88C |
  db $BD, $07, $B5, $07, $B3, $A1, $BB, $16 ; $04B894 |
  db $D6, $C6, $15, $CE, $C6, $C7, $CE, $CF ; $04B89C |
  db $C6, $B6, $CE, $16, $BB, $15, $BB, $16 ; $04B8A4 |
  db $BB, $15, $98, $16, $16, $15, $15, $70 ; $04B8AC |
  db $16, $15, $71, $A9, $16, $A9, $AE, $9F ; $04B8B4 |
  db $AD, $AE, $04, $04, $BE, $15, $9E, $AD ; $04B8BC |
  db $16, $78, $AE, $AD, $79, $B5, $AE, $9F ; $04B8C4 |
  db $A0, $B1, $AC, $B9, $B2, $B1, $BA, $B9 ; $04B8CC |
  db $A5, $A1, $70, $71, $A2, $A1, $15, $70 ; $04B8D4 |
  db $A2, $A3, $71, $AB, $16, $78, $15, $16 ; $04B8DC |
  db $79, $B3, $15, $BB, $C0, $C1, $C8, $C9 ; $04B8E4 |
  db $C2, $C3, $CA, $CB, $04, $C0, $C4, $C8 ; $04B8EC |
  db $C1, $C2, $C9, $CA, $C3, $04, $CB, $C4 ; $04B8F4 |
  db $C8, $C9, $D0, $D1, $CA, $CB, $D2, $D3 ; $04B8FC |
  db $C4, $C8, $04, $D0, $C9, $CA, $D1, $D2 ; $04B904 |
  db $CB, $C4, $D3, $08, $C4, $C8, $08, $D0 ; $04B90C |
  db $B2, $A3, $BA, $AF, $04, $D9, $04, $DC ; $04B914 |
  db $DA, $04, $DD, $04, $C3, $09, $CB, $C4 ; $04B91C |
  db $09, $C0, $C4, $C8, $CB, $C4, $D3, $04 ; $04B924 |
  db $00, $00, $00, $00, $B8, $BB, $B8, $BB ; $04B92C |
  db $C3, $04, $CB, $04, $98, $9B, $A4, $A7 ; $04B934 |
  db $CB, $04, $D3, $04, $AC, $AF, $09, $09 ; $04B93C |
  db $AC, $AF, $09, $0B, $A7, $04, $AF, $04 ; $04B944 |
  db $06, $A0, $07, $A8, $07, $B0, $07, $B8 ; $04B94C |
  db $07, $98, $07, $A4, $00, $A4, $00, $AC ; $04B954 |
  db $81, $81, $00, $00, $82, $81, $83, $00 ; $04B95C |
  db $81, $81, $84, $85, $81, $81, $86, $87 ; $04B964 |
  db $83, $00, $83, $00, $8C, $8D, $94, $95 ; $04B96C |
  db $8E, $8F, $96, $97, $91, $92, $81, $81 ; $04B974 |
  db $83, $00, $83, $81, $A0, $A1, $A8, $16 ; $04B97C |
  db $A3, $0D, $AB, $0E, $16, $B5, $15, $A5 ; $04B984 |
  db $00, $00, $A1, $A2, $83, $00, $A1, $A2 ; $04B98C |
  db $B0, $15, $B8, $16, $B3, $0E, $BB, $0E ; $04B994 |
  db $BB, $0E, $BB, $0E, $9B, $0E, $A7, $0E ; $04B99C |
  db $B4, $15, $BC, $A9, $B4, $B5, $BC, $BD ; $04B9A4 |
  db $A6, $B5, $AD, $9F, $16, $B5, $AE, $9F ; $04B9AC |
  db $80, $00, $88, $00, $88, $81, $88, $00 ; $04B9B4 |
  db $88, $00, $88, $00, $88, $00, $88, $81 ; $04B9BC |
  db $00, $00, $91, $92, $82, $00, $83, $00 ; $04B9C4 |
  db $83, $81, $83, $00, $AC, $AE, $00, $00 ; $04B9CC |
  db $AD, $AE, $00, $00, $AF, $0E, $82, $0E ; $04B9D4 |
  db $84, $85, $8C, $8D, $86, $87, $8E, $8F ; $04B9DC |
  db $83, $0E, $83, $0E, $00, $00, $81, $81 ; $04B9E4 |
  db $94, $95, $A0, $A1, $96, $97, $A2, $A1 ; $04B9EC |
  db $83, $00, $A2, $A1, $B4, $15, $B6, $16 ; $04B9F4 |
  db $00, $00, $89, $8A, $07, $A4, $07, $AC ; $04B9FC |
  db $07, $09, $07, $04, $04, $04, $13, $04 ; $04BA04 |
  db $04, $04, $04, $13, $D7, $A1, $15, $16 ; $04BA0C |
  db $A3, $04, $AF, $04, $08, $04, $A0, $B1 ; $04BA14 |
  db $09, $04, $B2, $B1, $04, $09, $B2, $B1 ; $04BA1C |
  db $04, $08, $B2, $A3, $04, $09, $04, $08 ; $04BA24 |
  db $AC, $B9, $09, $04, $BA, $B9, $04, $04 ; $04BA2C |
  db $BA, $AF, $04, $09, $07, $99, $07, $A4 ; $04BA34 |
  db $A2, $A3, $15, $AB, $16, $B3, $15, $BB ; $04BA3C |
  db $B8, $BB, $98, $9B, $A4, $A7, $AC, $AF ; $04BA44 |
  db $04, $0F, $04, $0F, $09, $09, $04, $04 ; $04BA4C |
  db $08, $04, $A0, $A2, $04, $04, $A1, $A2 ; $04BA54 |
  db $B8, $15, $BB, $16, $17, $04, $17, $04 ; $04BA5C |
  db $04, $D4, $C0, $C1, $D5, $04, $C2, $C3 ; $04BA64 |
  db $D0, $D1, $C0, $C1, $D2, $D3, $C2, $C3 ; $04BA6C |
  db $B7, $04, $B5, $04, $D0, $D1, $04, $DC ; $04BA74 |
  db $D2, $D3, $DD, $04, $A5, $A1, $15, $16 ; $04BA7C |
  db $A2, $B6, $15, $16, $16, $AB, $15, $BB ; $04BA84 |
  db $09, $07, $04, $07, $A2, $B0, $15, $B8 ; $04BA8C |
  db $16, $B8, $15, $B8, $00, $00, $00, $00 ; $04BA94 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BA9C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAA4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAAC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BABC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAC4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BACC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAD4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BADC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BAF4 |
  db $00, $00, $00, $00, $00, $00, $10, $0C ; $04BAFC |
  db $11, $00, $0E, $0E, $11, $13, $11, $13 ; $04BB04 |
  db $11, $8C, $8C, $1E, $28, $26, $2A, $6E ; $04BB0C |
  db $FF, $22, $20, $11, $02, $FF, $FF, $FF ; $04BB14 |
  db $FF, $FF, $FF, $FF, $3B, $4C, $4C, $5C ; $04BB1C |
  db $5B, $67, $BC, $67, $4B, $4C, $4C, $4C ; $04BB24 |
  db $4C, $5C, $4B, $4C, $11, $11, $FF, $04 ; $04BB2C |
  db $FF, $FF, $FF, $FF, $B0, $10, $A0, $79 ; $04BB34 |
  db $FF, $FF, $FF, $FF, $11, $11, $C1, $C3 ; $04BB3C |
  db $C5, $00, $FE, $00, $11, $CD, $10, $10 ; $04BB44 |
  db $10, $CF, $FE, $00, $D6, $10, $10, $8E ; $04BB4C |
  db $10, $D8, $11, $11, $DE, $10, $AC, $AE ; $04BB54 |
  db $10, $E0, $FD, $FD, $E6, $10, $10, $10 ; $04BB5C |
  db $10, $E8, $FE, $11, $11, $EE, $F0, $10 ; $04BB64 |
  db $F2, $FB, $00, $00, $88, $8A, $FF, $FF ; $04BB6C |
  db $FF, $FF, $FF, $FF, $A8, $AA, $FF, $FF ; $04BB74 |
  db $FF, $FF, $FF, $FF, $00, $00, $00, $60 ; $04BB7C |
  db $00, $62, $00, $00, $50, $40, $42, $B8 ; $04BB84 |
  db $80, $82, $84, $86, $FF, $00, $00, $FF ; $04BB8C |
  db $00, $A2, $A4, $A6, $7C, $68, $6A, $7C ; $04BB94 |
  db $FF, $FF, $4F, $44, $28, $24, $26, $2A ; $04BB9C |
  db $28, $22, $0B, $6D, $48, $20, $09, $6D ; $04BBA4 |
  db $48, $44, $46, $4A, $68, $06, $06, $6A ; $04BBAC |
  db $2C, $22, $0B, $26, $7C, $20, $22, $7C ; $04BBB4 |
  db $2C, $20, $09, $2F, $11, $E4, $11, $11 ; $04BBBC |
  db $D1, $00, $11, $11, $D0, $C5, $C4, $C6 ; $04BBC4 |
  db $00, $00, $AC, $AE, $F0, $F2, $F1, $F1 ; $04BBCC |
  db $E4, $11, $26, $CE, $00, $E4, $11, $00 ; $04BBD4 |
  db $F4, $F5, $00, $00, $00, $00, $00, $00 ; $04BBDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BBE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BBEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BBF4 |
  db $00, $00, $00, $00, $00, $00, $10, $0D ; $04BBFC |
  db $11, $00, $0F, $0F, $11, $13, $11, $13 ; $04BC04 |
  db $11, $8F, $8F, $1F, $29, $24, $28, $6F ; $04BC0C |
  db $FF, $23, $21, $11, $02, $FF, $FF, $FF ; $04BC14 |
  db $FF, $FF, $FF, $FF, $4C, $4C, $2B, $5C ; $04BC1C |
  db $5C, $67, $67, $BF, $4C, $4C, $4D, $4C ; $04BC24 |
  db $4C, $5D, $4C, $4D, $11, $11, $FF, $05 ; $04BC2C |
  db $FF, $FF, $FF, $FF, $10, $10, $B0, $7A ; $04BC34 |
  db $FF, $FF, $FF, $FF, $11, $C0, $C2, $C4 ; $04BC3C |
  db $11, $00, $11, $00, $CC, $10, $10, $10 ; $04BC44 |
  db $CE, $11, $FD, $00, $D7, $10, $8D, $10 ; $04BC4C |
  db $10, $D9, $11, $FE, $DF, $10, $AD, $AF ; $04BC54 |
  db $10, $E1, $FD, $FE, $E7, $10, $10, $10 ; $04BC5C |
  db $10, $E9, $11, $FE, $FA, $EF, $10, $F1 ; $04BC64 |
  db $F3, $11, $00, $00, $89, $8B, $FF, $FF ; $04BC6C |
  db $FF, $FF, $FF, $FF, $A9, $AB, $FF, $FF ; $04BC74 |
  db $FF, $FF, $FF, $FF, $00, $00, $00, $61 ; $04BC7C |
  db $00, $63, $00, $00, $51, $41, $00, $BA ; $04BC84 |
  db $81, $83, $85, $87, $FF, $00, $00, $FF ; $04BC8C |
  db $A1, $A3, $A5, $A7, $7D, $69, $6B, $7D ; $04BC94 |
  db $FF, $FF, $47, $4E, $29, $25, $27, $28 ; $04BC9C |
  db $6C, $0A, $21, $28, $6C, $08, $23, $48 ; $04BCA4 |
  db $49, $45, $47, $48, $69, $07, $07, $6B ; $04BCAC |
  db $21, $2D, $23, $2E, $7D, $21, $23, $7D ; $04BCB4 |
  db $23, $2D, $21, $27, $11, $11, $E4, $11 ; $04BCBC |
  db $D2, $00, $11, $11, $C4, $C6, $C5, $D3 ; $04BCC4 |
  db $00, $00, $AD, $AF, $F1, $F1, $F2, $F3 ; $04BCCC |
  db $11, $E4, $CF, $27, $00, $11, $E4, $00 ; $04BCD4 |
  db $F5, $F6, $00, $00, $00, $00, $00, $00 ; $04BCDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BCE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BCEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BCF4 |
  db $00, $00, $00, $00, $00, $00, $10, $1C ; $04BCFC |
  db $11, $00, $0E, $0E, $03, $11, $03, $03 ; $04BD04 |
  db $12, $8C, $8C, $1E, $58, $54, $5A, $7E ; $04BD0C |
  db $FF, $32, $30, $11, $4C, $FF, $FF, $FF ; $04BD14 |
  db $FF, $FF, $FF, $FF, $4B, $4C, $4C, $11 ; $04BD1C |
  db $11, $4C, $4B, $4C, $5B, $5C, $5C, $3B ; $04BD24 |
  db $4C, $11, $4B, $4C, $11, $B0, $FF, $14 ; $04BD2C |
  db $FF, $FF, $FF, $FF, $10, $10, $10, $79 ; $04BD34 |
  db $FF, $FF, $FF, $FF, $11, $C6, $C8, $10 ; $04BD3C |
  db $CA, $11, $FE, $FE, $D0, $D2, $10, $10 ; $04BD44 |
  db $10, $D4, $FE, $11, $DA, $10, $9C, $9E ; $04BD4C |
  db $10, $DC, $FC, $FC, $E2, $10, $10, $BE ; $04BD54 |
  db $10, $E4, $11, $11, $11, $EB, $10, $10 ; $04BD5C |
  db $10, $ED, $FE, $11, $11, $11, $F5, $F7 ; $04BD64 |
  db $F9, $FB, $11, $FB, $98, $9A, $FF, $FF ; $04BD6C |
  db $FF, $FF, $FF, $FF, $B8, $BA, $FF, $FF ; $04BD74 |
  db $FF, $FF, $FF, $FF, $50, $52, $60, $60 ; $04BD7C |
  db $70, $72, $74, $76, $50, $00, $00, $B8 ; $04BD84 |
  db $90, $92, $94, $96, $FF, $40, $42, $FF ; $04BD8C |
  db $00, $B2, $B4, $B6, $78, $78, $7C, $7C ; $04BD94 |
  db $FF, $FF, $5F, $55, $38, $34, $36, $3A ; $04BD9C |
  db $38, $32, $1B, $6D, $58, $30, $19, $6D ; $04BDA4 |
  db $58, $54, $56, $5A, $7C, $32, $30, $7C ; $04BDAC |
  db $3C, $32, $1B, $36, $7C, $16, $16, $7C ; $04BDB4 |
  db $3C, $30, $19, $3F, $C0, $C2, $C1, $C1 ; $04BDBC |
  db $E1, $00, $9C, $9E, $E0, $D5, $D4, $D6 ; $04BDC4 |
  db $00, $00, $BC, $BE, $11, $E4, $11, $11 ; $04BDCC |
  db $F4, $F5, $36, $DE, $00, $E4, $11, $00 ; $04BDD4 |
  db $E4, $11, $00, $00, $00, $00, $00, $00 ; $04BDDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BDE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BDEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BDF4 |
  db $00, $00, $00, $00, $00, $00, $10, $1D ; $04BDFC |
  db $11, $00, $0F, $0F, $03, $11, $03, $03 ; $04BE04 |
  db $12, $8F, $8F, $1F, $59, $56, $58, $7F ; $04BE0C |
  db $FF, $33, $31, $11, $4C, $FF, $FF, $FF ; $04BE14 |
  db $FF, $FF, $FF, $FF, $4C, $4C, $4D, $11 ; $04BE1C |
  db $11, $4C, $4C, $4D, $5C, $5C, $5D, $4C ; $04BE24 |
  db $2B, $11, $4C, $4D, $A0, $A0, $FF, $15 ; $04BE2C |
  db $FF, $FF, $FF, $FF, $10, $10, $10, $7A ; $04BE34 |
  db $FF, $FF, $FF, $FF, $11, $C7, $10, $C9 ; $04BE3C |
  db $CB, $11, $FC, $11, $D1, $10, $10, $10 ; $04BE44 |
  db $D3, $D5, $11, $FE, $DB, $10, $9D, $9F ; $04BE4C |
  db $10, $DD, $FC, $FE, $E3, $10, $BD, $10 ; $04BE54 |
  db $10, $E5, $11, $FE, $EA, $10, $10, $10 ; $04BE5C |
  db $EC, $11, $11, $FE, $FA, $F4, $F6, $F8 ; $04BE64 |
  db $11, $11, $FA, $11, $99, $9B, $FF, $FF ; $04BE6C |
  db $FF, $FF, $FF, $FF, $B9, $BB, $FF, $FF ; $04BE74 |
  db $FF, $FF, $FF, $FF, $51, $52, $61, $61 ; $04BE7C |
  db $71, $73, $75, $77, $51, $00, $00, $BA ; $04BE84 |
  db $91, $93, $95, $97, $FF, $41, $00, $FF ; $04BE8C |
  db $B1, $B3, $B5, $B7, $7D, $7D, $7B, $7B ; $04BE94 |
  db $FF, $FF, $57, $5E, $39, $35, $37, $38 ; $04BE9C |
  db $6C, $1A, $31, $38, $6C, $18, $33, $58 ; $04BEA4 |
  db $59, $55, $57, $58, $7D, $33, $31, $7D ; $04BEAC |
  db $31, $3D, $33, $3E, $7D, $17, $17, $7D ; $04BEB4 |
  db $33, $3D, $31, $37, $C1, $C1, $C2, $C3 ; $04BEBC |
  db $E2, $00, $9D, $9F, $D4, $D6, $D5, $E3 ; $04BEC4 |
  db $00, $00, $BD, $BF, $11, $11, $E4, $11 ; $04BECC |
  db $F5, $F6, $DF, $37, $00, $11, $E4, $00 ; $04BED4 |
  db $11, $E4, $00, $00, $00, $00, $00, $00 ; $04BEDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BEE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BEEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BEF4 |
  db $00, $00, $00, $00, $00, $00, $03, $52 ; $04BEFC |
  db $00, $00, $40, $20, $00, $00, $02, $00 ; $04BF04 |
  db $00, $40, $20, $12, $12, $10, $12, $10 ; $04BF0C |
  db $10, $11, $11, $10, $13, $00, $00, $00 ; $04BF14 |
  db $10, $00, $10, $00, $03, $03, $03, $03 ; $04BF1C |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $04BF24 |
  db $03, $03, $03, $03, $03, $03, $00, $03 ; $04BF2C |
  db $00, $00, $00, $00, $03, $03, $03, $03 ; $04BF34 |
  db $00, $00, $00, $00, $02, $03, $03, $03 ; $04BF3C |
  db $03, $02, $02, $02, $03, $03, $03, $03 ; $04BF44 |
  db $03, $03, $02, $02, $03, $03, $03, $03 ; $04BF4C |
  db $03, $03, $02, $02, $03, $03, $03, $03 ; $04BF54 |
  db $03, $03, $02, $02, $03, $03, $03, $03 ; $04BF5C |
  db $03, $03, $02, $02, $02, $03, $03, $03 ; $04BF64 |
  db $03, $02, $02, $02, $12, $12, $00, $00 ; $04BF6C |
  db $00, $00, $00, $00, $12, $11, $00, $00 ; $04BF74 |
  db $00, $00, $00, $00, $02, $02, $02, $02 ; $04BF7C |
  db $03, $03, $03, $03, $02, $02, $02, $03 ; $04BF84 |
  db $03, $03, $03, $03, $00, $02, $02, $10 ; $04BF8C |
  db $03, $03, $03, $03, $12, $12, $12, $12 ; $04BF94 |
  db $00, $00, $10, $10, $12, $10, $10, $12 ; $04BF9C |
  db $12, $11, $11, $12, $12, $11, $11, $12 ; $04BFA4 |
  db $12, $10, $10, $12, $12, $11, $11, $12 ; $04BFAC |
  db $11, $11, $11, $10, $12, $11, $11, $12 ; $04BFB4 |
  db $11, $11, $11, $10, $03, $03, $03, $03 ; $04BFBC |
  db $03, $00, $00, $00, $03, $03, $03, $03 ; $04BFC4 |
  db $00, $00, $50, $50, $03, $03, $03, $03 ; $04BFCC |
  db $03, $03, $10, $10, $00, $03, $03, $00 ; $04BFD4 |
  db $03, $03, $00, $00, $00, $00, $00, $00 ; $04BFDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BFE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BFEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $04BFF4 |
  db $00, $00, $00, $00                     ; $04BFFC |

