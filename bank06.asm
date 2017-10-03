bank $06
org $A000

main_needle_man_j:
  JMP code_06A01C                           ; $06A000 |

main_magnet_man_j:
  JMP code_06A24E                           ; $06A003 |

main_top_man_j:
  JMP code_06A4B3                           ; $06A006 |

main_shadow_man_j:
  JMP code_06A698                           ; $06A009 |

  JMP code_06A472                           ; $06A00C |

  JMP code_06A62B                           ; $06A00F |

  JMP code_06A8E0                           ; $06A012 |

  JMP code_06A01C                           ; $06A015 |

  JMP code_06A698                           ; $06A018 |

  RTS                                       ; $06A01B |

code_06A01C:
  LDA $0300,x                               ; $06A01C |
  AND #$0F                                  ; $06A01F |
  TAY                                       ; $06A021 |
  LDA $A02F,y                               ; $06A022 |
  STA $00                                   ; $06A025 |
  LDA $A034,y                               ; $06A027 |
  STA $01                                   ; $06A02A |
  JMP ($0000)                               ; $06A02C |

  db $39, $4D, $68, $F4, $50, $A0, $A0, $A0 ; $06A02F |
  db $A0, $A1                               ; $06A037 |

  LDA #$78                                  ; $06A039 |
  STA $0500,x                               ; $06A03B |
  JSR code_06A188                           ; $06A03E |
  LDA $0300,x                               ; $06A041 |
  ORA #$40                                  ; $06A044 |
  STA $0300,x                               ; $06A046 |
  INC $0300,x                               ; $06A049 |
  RTS                                       ; $06A04C |

  LDA #$00                                  ; $06A04D |
  STA $05E0,x                               ; $06A04F |
  STA $05A0,x                               ; $06A052 |
  DEC $0500,x                               ; $06A055 |
  BNE code_06A05E                           ; $06A058 |
  INC $0300,x                               ; $06A05A |
  RTS                                       ; $06A05D |

code_06A05E:
  LDA $14                                   ; $06A05E |
  AND #$40                                  ; $06A060 |
  BEQ code_06A067                           ; $06A062 |
  INC $0300,x                               ; $06A064 |
code_06A067:
  RTS                                       ; $06A067 |

  LDA $05C0,x                               ; $06A068 |
  CMP #$28                                  ; $06A06B |
  BEQ code_06A0AD                           ; $06A06D |
  LDY #$1E                                  ; $06A06F |
  JSR code_1FF67C                           ; $06A071 |
  BCC code_06A093                           ; $06A074 |
  LDA #$29                                  ; $06A076 |
  JSR reset_sprite_anim                     ; $06A078 |
  LDA #$02                                  ; $06A07B |
  STA $05A0,x                               ; $06A07D |
  LDA #$00                                  ; $06A080 |
  STA $05E0,x                               ; $06A082 |
  LDA #$08                                  ; $06A085 |
  STA $0540,x                               ; $06A087 |
  INC $0300,x                               ; $06A08A |
  JSR face_player                           ; $06A08D |
  JMP code_06A1A2                           ; $06A090 |

code_06A093:
  LDA $0460,x                               ; $06A093 |
  BMI code_06A0A3                           ; $06A096 |
  LDA #$01                                  ; $06A098 |
  STA $05A0,x                               ; $06A09A |
  LDA #$00                                  ; $06A09D |
  STA $05E0,x                               ; $06A09F |
  RTS                                       ; $06A0A2 |

code_06A0A3:
  LDA $0540,x                               ; $06A0A3 |
  BNE code_06A0EE                           ; $06A0A6 |
  LDA #$28                                  ; $06A0A8 |
  JSR reset_sprite_anim                     ; $06A0AA |
code_06A0AD:
  JSR code_06A836                           ; $06A0AD |
  LDA $0500,x                               ; $06A0B0 |
  BNE code_06A0C2                           ; $06A0B3 |
  LDA $05A0,x                               ; $06A0B5 |
  CMP #$01                                  ; $06A0B8 |
  BNE code_06A0D4                           ; $06A0BA |
  JSR code_06A1E0                           ; $06A0BC |
  INC $0500,x                               ; $06A0BF |
code_06A0C2:
  LDA $0520,x                               ; $06A0C2 |
  BNE code_06A0D4                           ; $06A0C5 |
  LDA $05A0,x                               ; $06A0C7 |
  CMP #$03                                  ; $06A0CA |
  BNE code_06A0D4                           ; $06A0CC |
  JSR code_06A1E0                           ; $06A0CE |
  INC $0520,x                               ; $06A0D1 |
code_06A0D4:
  LDA $05A0,x                               ; $06A0D4 |
  CMP #$03                                  ; $06A0D7 |
  BNE code_06A0F3                           ; $06A0D9 |
  LDA #$00                                  ; $06A0DB |
  STA $0500,x                               ; $06A0DD |
  STA $0520,x                               ; $06A0E0 |
  LDA #$29                                  ; $06A0E3 |
  JSR reset_sprite_anim                     ; $06A0E5 |
  LDA #$10                                  ; $06A0E8 |
  STA $0540,x                               ; $06A0EA |
  RTS                                       ; $06A0ED |

code_06A0EE:
  DEC $0540,x                               ; $06A0EE |
  BNE code_06A0F3                           ; $06A0F1 |
code_06A0F3:
  RTS                                       ; $06A0F3 |

  LDA $05A0,x                               ; $06A0F4 |
  CMP #$02                                  ; $06A0F7 |
  BEQ code_06A132                           ; $06A0F9 |
  LDA #$01                                  ; $06A0FB |
  STA $05A0,x                               ; $06A0FD |
  LDA #$00                                  ; $06A100 |
  STA $05E0,x                               ; $06A102 |
  LDA $04A0,x                               ; $06A105 |
  AND #$01                                  ; $06A108 |
  BEQ code_06A114                           ; $06A10A |
  LDY #$20                                  ; $06A10C |
  JSR code_1FF580                           ; $06A10E |
  JMP code_06A119                           ; $06A111 |

code_06A114:
  LDY #$21                                  ; $06A114 |
  JSR code_1FF5C4                           ; $06A116 |
code_06A119:
  LDY #$1E                                  ; $06A119 |
  JSR code_1FF67C                           ; $06A11B |
  BCC code_06A14F                           ; $06A11E |
  LDA #$02                                  ; $06A120 |
  STA $05A0,x                               ; $06A122 |
  LDA #$00                                  ; $06A125 |
  STA $05E0,x                               ; $06A127 |
  JSR code_06A836                           ; $06A12A |
  LDA #$08                                  ; $06A12D |
  STA $0540,x                               ; $06A12F |
code_06A132:
  DEC $0540,x                               ; $06A132 |
  BNE code_06A14F                           ; $06A135 |
  LDA $0560,x                               ; $06A137 |
  BNE code_06A145                           ; $06A13A |
  LDA #$C2                                  ; $06A13C |
  STA $0300,x                               ; $06A13E |
  JSR code_06A188                           ; $06A141 |
  RTS                                       ; $06A144 |

code_06A145:
  LDA #$2A                                  ; $06A145 |
  JSR reset_sprite_anim                     ; $06A147 |
  LDA #$C4                                  ; $06A14A |
  STA $0300,x                               ; $06A14C |
code_06A14F:
  RTS                                       ; $06A14F |

  LDA $05A0,x                               ; $06A150 |
  CMP #$04                                  ; $06A153 |
  BNE code_06A176                           ; $06A155 |
  LDA $05E0,x                               ; $06A157 |
  AND #$08                                  ; $06A15A |
  BEQ code_06A176                           ; $06A15C |
  LDA #$C0                                  ; $06A15E |
  STA $0320,x                               ; $06A160 |
  LDA #$29                                  ; $06A163 |
  JSR reset_sprite_anim                     ; $06A165 |
  LDA #$C3                                  ; $06A168 |
  STA $0300,x                               ; $06A16A |
  JSR code_06A1A2                           ; $06A16D |
code_06A170:
  LDA #$CA                                  ; $06A170 |
  STA $0480,x                               ; $06A172 |
  RTS                                       ; $06A175 |

code_06A176:
  LDA $05A0,x                               ; $06A176 |
  CMP #$02                                  ; $06A179 |
  BNE code_06A170                           ; $06A17B |
  LDA #$D2                                  ; $06A17D |
  STA $0480,x                               ; $06A17F |
  LDA #$C7                                  ; $06A182 |
  STA $0320,x                               ; $06A184 |
  RTS                                       ; $06A187 |

code_06A188:
  LDA $E4                                   ; $06A188 |
  ADC $E5                                   ; $06A18A |
  STA $E5                                   ; $06A18C |
  AND #$01                                  ; $06A18E |
  TAY                                       ; $06A190 |
  LDA $A19E,y                               ; $06A191 |
  STA $0440,x                               ; $06A194 |
  LDA $A1A0,y                               ; $06A197 |
  STA $0460,x                               ; $06A19A |
  RTS                                       ; $06A19D |

  db $88, $3C, $06, $09                     ; $06A19E |

code_06A1A2:
  LDA #$88                                  ; $06A1A2 |
  STA $0440,x                               ; $06A1A4 |
  LDA #$06                                  ; $06A1A7 |
  STA $0460,x                               ; $06A1A9 |
  LDA $E4                                   ; $06A1AC |
  ADC $E5                                   ; $06A1AE |
  STA $E5                                   ; $06A1B0 |
  AND #$07                                  ; $06A1B2 |
  TAY                                       ; $06A1B4 |
  LDA $A1C8,y                               ; $06A1B5 |
  STA $0400,x                               ; $06A1B8 |
  LDA $A1D0,y                               ; $06A1BB |
  STA $0420,x                               ; $06A1BE |
  LDA $A1D8,y                               ; $06A1C1 |
  STA $0560,x                               ; $06A1C4 |
  RTS                                       ; $06A1C7 |

  db $00, $80, $80, $00, $00, $80, $80, $80 ; $06A1C8 |
  db $00, $01, $02, $00, $00, $01, $03, $02 ; $06A1D0 |
  db $FF, $00, $FF, $FF, $00, $FF, $00, $FF ; $06A1D8 |

code_06A1E0:
  JSR find_enemy_freeslot_y                 ; $06A1E0 |
  BCS code_06A245                           ; $06A1E3 |
  STY $00                                   ; $06A1E5 |
  LDA $04A0,x                               ; $06A1E7 |
  STA $04A0,y                               ; $06A1EA |
  AND #$02                                  ; $06A1ED |
  TAY                                       ; $06A1EF |
  LDA $05A0,x                               ; $06A1F0 |
  CMP #$01                                  ; $06A1F3 |
  BNE code_06A211                           ; $06A1F5 |
  LDA $0360,x                               ; $06A1F7 |
  CLC                                       ; $06A1FA |
  ADC $A246,y                               ; $06A1FB |
  PHA                                       ; $06A1FE |
  LDA $0380,x                               ; $06A1FF |
  ADC $A247,y                               ; $06A202 |
  LDY $00                                   ; $06A205 |
  STA $0380,y                               ; $06A207 |
  PLA                                       ; $06A20A |
  STA $0360,y                               ; $06A20B |
  JMP code_06A228                           ; $06A20E |

code_06A211:
  LDA $0360,x                               ; $06A211 |
  CLC                                       ; $06A214 |
  ADC $A24A,y                               ; $06A215 |
  PHA                                       ; $06A218 |
  LDA $0380,x                               ; $06A219 |
  ADC $A24B,y                               ; $06A21C |
  LDY $00                                   ; $06A21F |
  STA $0380,y                               ; $06A221 |
  PLA                                       ; $06A224 |
  STA $0360,y                               ; $06A225 |
code_06A228:
  LDA $03C0,x                               ; $06A228 |
  CLC                                       ; $06A22B |
  ADC #$07                                  ; $06A22C |
  STA $03C0,y                               ; $06A22E |
  LDA #$00                                  ; $06A231 |
  STA $04E0,y                               ; $06A233 |
  LDA #$27                                  ; $06A236 |
  JSR code_1FF846                           ; $06A238 |
  LDA #$8B                                  ; $06A23B |
  STA $0480,y                               ; $06A23D |
  LDA #$AF                                  ; $06A240 |
  STA $0320,y                               ; $06A242 |
code_06A245:
  RTS                                       ; $06A245 |

  db $15, $00, $EB, $FF, $02, $00, $FE, $FF ; $06A246 |

code_06A24E:
  LDA $0300,x                               ; $06A24E |
  AND #$0F                                  ; $06A251 |
  TAY                                       ; $06A253 |
  LDA $A261,y                               ; $06A254 |
  STA $00                                   ; $06A257 |
  LDA $A266,y                               ; $06A259 |
  STA $01                                   ; $06A25C |
  JMP ($0000)                               ; $06A25E |

  db $6B, $EB, $0C, $76, $A5, $A2, $A2, $A3 ; $06A261 |
  db $A3, $A3                               ; $06A269 |

  LDA $0520,x                               ; $06A26B |
  BNE code_06A2E7                           ; $06A26E |
  LDA $0300,x                               ; $06A270 |
  ORA #$40                                  ; $06A273 |
  STA $0300,x                               ; $06A275 |
  LDA $0560,x                               ; $06A278 |
  AND #$01                                  ; $06A27B |
  BEQ code_06A28D                           ; $06A27D |
  LDA $0580,x                               ; $06A27F |
  ORA #$40                                  ; $06A282 |
  STA $0580,x                               ; $06A284 |
  JSR code_1FF71D                           ; $06A287 |
  JMP code_06A298                           ; $06A28A |

code_06A28D:
  LDA $0580,x                               ; $06A28D |
  AND #$BF                                  ; $06A290 |
  STA $0580,x                               ; $06A292 |
  JSR code_1FF73B                           ; $06A295 |
code_06A298:
  LDY #$22                                  ; $06A298 |
  JSR code_1FF67C                           ; $06A29A |
  BCC code_06A2E2                           ; $06A29D |
  LDA $0500,x                               ; $06A29F |
  TAY                                       ; $06A2A2 |
  LDA $A419,y                               ; $06A2A3 |
  STA $0440,x                               ; $06A2A6 |
  LDA $A41C,y                               ; $06A2A9 |
  STA $0460,x                               ; $06A2AC |
  LDA $A41F,y                               ; $06A2AF |
  STA $0400,x                               ; $06A2B2 |
  LDA $A422,y                               ; $06A2B5 |
  STA $0420,x                               ; $06A2B8 |
  LDA #$1F                                  ; $06A2BB |
  JSR reset_sprite_anim                     ; $06A2BD |
  LDA #$04                                  ; $06A2C0 |
  STA $0520,x                               ; $06A2C2 |
  INC $0500,x                               ; $06A2C5 |
  LDA $0500,x                               ; $06A2C8 |
  CMP #$03                                  ; $06A2CB |
  BCC code_06A2E1                           ; $06A2CD |
  INC $0300,x                               ; $06A2CF |
  LDA #$00                                  ; $06A2D2 |
  STA $0500,x                               ; $06A2D4 |
  LDA #$3C                                  ; $06A2D7 |
  STA $0440,x                               ; $06A2D9 |
  LDA #$09                                  ; $06A2DC |
  STA $0460,x                               ; $06A2DE |
code_06A2E1:
  RTS                                       ; $06A2E1 |

code_06A2E2:
  LDA #$20                                  ; $06A2E2 |
  JMP reset_sprite_anim                     ; $06A2E4 |

code_06A2E7:
  DEC $0520,x                               ; $06A2E7 |
  RTS                                       ; $06A2EA |

  LDA $E4                                   ; $06A2EB |
  ADC $E5                                   ; $06A2ED |
  STA $E4                                   ; $06A2EF |
  AND #$01                                  ; $06A2F1 |
  BNE code_06A2F9                           ; $06A2F3 |
  INC $0300,x                               ; $06A2F5 |
  RTS                                       ; $06A2F8 |

code_06A2F9:
  LDA #$C4                                  ; $06A2F9 |
  STA $0300,x                               ; $06A2FB |
  LDA #$F0                                  ; $06A2FE |
  STA $0540,x                               ; $06A300 |
  LDA #$1E                                  ; $06A303 |
  JSR reset_sprite_anim                     ; $06A305 |
  JSR code_06A3FC                           ; $06A308 |
  RTS                                       ; $06A30B |

  LDA $05C0,x                               ; $06A30C |
  CMP #$21                                  ; $06A30F |
  BEQ code_06A333                           ; $06A311 |
  LDA #$20                                  ; $06A313 |
  JSR reset_sprite_anim                     ; $06A315 |
  LDY #$23                                  ; $06A318 |
  JSR code_1FF67C                           ; $06A31A |
  LDA $10                                   ; $06A31D |
  AND #$10                                  ; $06A31F |
  BEQ code_06A332                           ; $06A321 |
  LDA #$21                                  ; $06A323 |
  JSR reset_sprite_anim                     ; $06A325 |
  LDA #$00                                  ; $06A328 |
  STA $0520,x                               ; $06A32A |
  LDA #$06                                  ; $06A32D |
  STA $0500,x                               ; $06A32F |
code_06A332:
  RTS                                       ; $06A332 |

code_06A333:
  JSR code_06A3FC                           ; $06A333 |
  DEC $0500,x                               ; $06A336 |
  BNE code_06A375                           ; $06A339 |
  LDA #$06                                  ; $06A33B |
  STA $0500,x                               ; $06A33D |
  LDA $05A0,x                               ; $06A340 |
  CMP #$01                                  ; $06A343 |
  BNE code_06A375                           ; $06A345 |
  JSR code_06A425                           ; $06A347 |
  LDA #$2A                                  ; $06A34A |
  JSR code_1FF89A                           ; $06A34C |
  INC $0520,x                               ; $06A34F |
  LDA $0520,x                               ; $06A352 |
  CMP #$03                                  ; $06A355 |
  BCC code_06A375                           ; $06A357 |
  INC $0300,x                               ; $06A359 |
  LDA #$00                                  ; $06A35C |
  STA $0500,x                               ; $06A35E |
  LDA #$1E                                  ; $06A361 |
  STA $0540,x                               ; $06A363 |
  LDA #$20                                  ; $06A366 |
  JSR reset_sprite_anim                     ; $06A368 |
  LDA #$80                                  ; $06A36B |
  STA $0440,x                               ; $06A36D |
  LDA #$06                                  ; $06A370 |
  STA $0460,x                               ; $06A372 |
code_06A375:
  RTS                                       ; $06A375 |

  LDA $0500,x                               ; $06A376 |
  BNE code_06A383                           ; $06A379 |
  DEC $0540,x                               ; $06A37B |
  BNE code_06A375                           ; $06A37E |
  INC $0500,x                               ; $06A380 |
code_06A383:
  LDY #$1E                                  ; $06A383 |
  JSR code_1FF606                           ; $06A385 |
  BCC code_06A3A4                           ; $06A388 |
  LDA #$1F                                  ; $06A38A |
  JSR reset_sprite_anim                     ; $06A38C |
  JSR reset_gravity                         ; $06A38F |
  LDA $0560,x                               ; $06A392 |
  EOR #$01                                  ; $06A395 |
  STA $0560,x                               ; $06A397 |
  LDA #$C0                                  ; $06A39A |
  STA $0300,x                               ; $06A39C |
  LDA #$00                                  ; $06A39F |
  STA $0500,x                               ; $06A3A1 |
code_06A3A4:
  RTS                                       ; $06A3A4 |

  JSR code_1FF8C2                           ; $06A3A5 |
  CMP #$18                                  ; $06A3A8 |
  BCC code_06A3E8                           ; $06A3AA |
  LDA $0580,x                               ; $06A3AC |
  AND #$40                                  ; $06A3AF |
  BNE code_06A3B7                           ; $06A3B1 |
  LDA #$01                                  ; $06A3B3 |
  BNE code_06A3B9                           ; $06A3B5 |
code_06A3B7:
  LDA #$02                                  ; $06A3B7 |
code_06A3B9:
  STA $36                                   ; $06A3B9 |
  LDA #$00                                  ; $06A3BB |
  STA $37                                   ; $06A3BD |
  LDA #$01                                  ; $06A3BF |
  STA $38                                   ; $06A3C1 |
  LDA $05A0,x                               ; $06A3C3 |
  CMP #$04                                  ; $06A3C6 |
  BNE code_06A3D2                           ; $06A3C8 |
  LDA $05E0,x                               ; $06A3CA |
  BEQ code_06A3D2                           ; $06A3CD |
  INC $05A0,x                               ; $06A3CF |
code_06A3D2:
  LDA $05A0,x                               ; $06A3D2 |
  CMP #$06                                  ; $06A3D5 |
  BNE code_06A3E3                           ; $06A3D7 |
  LDA $05E0,x                               ; $06A3D9 |
  BEQ code_06A3E3                           ; $06A3DC |
  LDA #$05                                  ; $06A3DE |
  STA $05A0,x                               ; $06A3E0 |
code_06A3E3:
  DEC $0540,x                               ; $06A3E3 |
  BNE code_06A3F6                           ; $06A3E6 |
code_06A3E8:
  LDA #$C3                                  ; $06A3E8 |
  STA $0300,x                               ; $06A3EA |
  LDA #$CA                                  ; $06A3ED |
  STA $0480,x                               ; $06A3EF |
  STA $0500,x                               ; $06A3F2 |
  RTS                                       ; $06A3F5 |

code_06A3F6:
  LDA #$AA                                  ; $06A3F6 |
  STA $0480,x                               ; $06A3F8 |
  RTS                                       ; $06A3FB |

code_06A3FC:
  JSR face_player                           ; $06A3FC |
  LDA $04A0,x                               ; $06A3FF |
  AND #$01                                  ; $06A402 |
  BEQ code_06A410                           ; $06A404 |
  LDA $0580,x                               ; $06A406 |
  ORA #$40                                  ; $06A409 |
  STA $0580,x                               ; $06A40B |
  BNE code_06A418                           ; $06A40E |
code_06A410:
  LDA $0580,x                               ; $06A410 |
  AND #$BF                                  ; $06A413 |
  STA $0580,x                               ; $06A415 |
code_06A418:
  RTS                                       ; $06A418 |

  db $9E, $88, $88, $04, $06, $06, $B3, $00 ; $06A419 |
  db $00, $01, $02, $02                     ; $06A421 |

code_06A425:
  JSR find_enemy_freeslot_y                 ; $06A425 |
  BCS code_06A46F                           ; $06A428 |
  STY $00                                   ; $06A42A |
  LDA $04A0,x                               ; $06A42C |
  STA $04A0,y                               ; $06A42F |
  AND #$01                                  ; $06A432 |
  TAY                                       ; $06A434 |
  LDA $0360,x                               ; $06A435 |
  CLC                                       ; $06A438 |
  ADC $A470,y                               ; $06A439 |
  LDY $00                                   ; $06A43C |
  STA $0360,y                               ; $06A43E |
  LDA $0380,x                               ; $06A441 |
  STA $0380,y                               ; $06A444 |
  LDA $03C0,x                               ; $06A447 |
  STA $03C0,y                               ; $06A44A |
  LDA #$00                                  ; $06A44D |
  STA $03E0,y                               ; $06A44F |
  STA $0400,y                               ; $06A452 |
  STA $0440,x                               ; $06A455 |
  LDA #$04                                  ; $06A458 |
  STA $0420,y                               ; $06A45A |
  STA $0460,y                               ; $06A45D |
  LDA #$4D                                  ; $06A460 |
  JSR code_1FF846                           ; $06A462 |
  LDA #$80                                  ; $06A465 |
  STA $0480,y                               ; $06A467 |
  LDA #$C4                                  ; $06A46A |
  STA $0320,y                               ; $06A46C |
code_06A46F:
  RTS                                       ; $06A46F |

  db $EC, $14                               ; $06A470 |

code_06A472:
  LDA $05C0,x                               ; $06A472 |
  CMP #$51                                  ; $06A475 |
  BEQ code_06A49C                           ; $06A477 |
  LDA $0300,x                               ; $06A479 |
  AND #$0F                                  ; $06A47C |
  BNE code_06A49C                           ; $06A47E |
  LDA $04A0,x                               ; $06A480 |
  AND #$01                                  ; $06A483 |
  BEQ code_06A48D                           ; $06A485 |
  JSR code_1FF71D                           ; $06A487 |
  JMP code_06A490                           ; $06A48A |

code_06A48D:
  JSR code_1FF73B                           ; $06A48D |
code_06A490:
  JSR code_1FF8C2                           ; $06A490 |
  CMP #$06                                  ; $06A493 |
  BCS code_06A4B2                           ; $06A495 |
  LDA #$51                                  ; $06A497 |
  JSR reset_sprite_anim                     ; $06A499 |
code_06A49C:
  LDA $05C0,x                               ; $06A49C |
  CMP #$59                                  ; $06A49F |
  BEQ code_06A4B2                           ; $06A4A1 |
  LDY #$12                                  ; $06A4A3 |
  JSR code_1FF606                           ; $06A4A5 |
  BCC code_06A4B2                           ; $06A4A8 |
  LDA #$59                                  ; $06A4AA |
  JSR reset_sprite_anim                     ; $06A4AC |
  INC $0300,x                               ; $06A4AF |
code_06A4B2:
  RTS                                       ; $06A4B2 |

code_06A4B3:
  LDA $0300,x                               ; $06A4B3 |
  AND #$0F                                  ; $06A4B6 |
  TAY                                       ; $06A4B8 |
  LDA $A4C6,y                               ; $06A4B9 |
  STA $00                                   ; $06A4BC |
  LDA $A4CA,y                               ; $06A4BE |
  STA $01                                   ; $06A4C1 |
  JMP ($0000)                               ; $06A4C3 |

  db $CE, $E2, $3A, $75, $A4, $A4, $A5, $A5 ; $06A4C6 |

  LDA #$3C                                  ; $06A4CE |
  STA $0500,x                               ; $06A4D0 |
  STA $0520,x                               ; $06A4D3 |
  LDA $0300,x                               ; $06A4D6 |
  ORA #$40                                  ; $06A4D9 |
  STA $0300,x                               ; $06A4DB |
  INC $0300,x                               ; $06A4DE |
  RTS                                       ; $06A4E1 |

  LDA #$CA                                  ; $06A4E2 |
  STA $0480,x                               ; $06A4E4 |
  LDA $05A0,x                               ; $06A4E7 |
  CMP #$02                                  ; $06A4EA |
  BNE code_06A4FD                           ; $06A4EC |
  LDA $0540,x                               ; $06A4EE |
  BNE code_06A4FD                           ; $06A4F1 |
  LDA #$00                                  ; $06A4F3 |
  STA $01                                   ; $06A4F5 |
  JSR code_06A5BC                           ; $06A4F7 |
  INC $0540,x                               ; $06A4FA |
code_06A4FD:
  LDA $05A0,x                               ; $06A4FD |
  CMP #$03                                  ; $06A500 |
  BNE code_06A525                           ; $06A502 |
  LDA $05E0,x                               ; $06A504 |
  AND #$08                                  ; $06A507 |
  BEQ code_06A525                           ; $06A509 |
  LDY #$1F                                  ; $06A50B |
  LDA #$10                                  ; $06A50D |
code_06A50F:
  CMP $04C0,y                               ; $06A50F |
  BEQ code_06A51B                           ; $06A512 |
  DEY                                       ; $06A514 |
  CPY #$0F                                  ; $06A515 |
  BNE code_06A50F                           ; $06A517 |
  BEQ code_06A525                           ; $06A519 |
code_06A51B:
  LDA #$C5                                  ; $06A51B |
  STA $0320,y                               ; $06A51D |
  DEY                                       ; $06A520 |
  LDA #$10                                  ; $06A521 |
  BNE code_06A50F                           ; $06A523 |
code_06A525:
  LDA $05A0,x                               ; $06A525 |
  CMP #$05                                  ; $06A528 |
  BNE code_06A539                           ; $06A52A |
  LDA $05E0,x                               ; $06A52C |
  BEQ code_06A539                           ; $06A52F |
  INC $0300,x                               ; $06A531 |
  LDA #$44                                  ; $06A534 |
  JSR reset_sprite_anim                     ; $06A536 |
code_06A539:
  RTS                                       ; $06A539 |

  LDA $05C0,x                               ; $06A53A |
  CMP #$47                                  ; $06A53D |
  BEQ code_06A555                           ; $06A53F |
  LDA $0540,x                               ; $06A541 |
  BEQ code_06A564                           ; $06A544 |
  DEC $0500,x                               ; $06A546 |
  BNE code_06A539                           ; $06A549 |
  LDA #$47                                  ; $06A54B |
  JSR reset_sprite_anim                     ; $06A54D |
  LDA #$AA                                  ; $06A550 |
  STA $0480,x                               ; $06A552 |
code_06A555:
  LDA $05A0,x                               ; $06A555 |
  CMP #$02                                  ; $06A558 |
  BNE code_06A564                           ; $06A55A |
  LDA #$48                                  ; $06A55C |
  JSR reset_sprite_anim                     ; $06A55E |
  DEC $0540,x                               ; $06A561 |
code_06A564:
  DEC $0520,x                               ; $06A564 |
  BNE code_06A539                           ; $06A567 |
  INC $0300,x                               ; $06A569 |
  LDA #$78                                  ; $06A56C |
  STA $0500,x                               ; $06A56E |
  STA $0520,x                               ; $06A571 |
  RTS                                       ; $06A574 |

  LDA $0560,x                               ; $06A575 |
  AND #$01                                  ; $06A578 |
  BEQ code_06A589                           ; $06A57A |
  JSR code_1FF71D                           ; $06A57C |
  LDA $0360,x                               ; $06A57F |
  CMP #$D0                                  ; $06A582 |
  BCS code_06A593                           ; $06A584 |
  JMP code_06A5BB                           ; $06A586 |

code_06A589:
  JSR code_1FF73B                           ; $06A589 |
  LDA $0360,x                               ; $06A58C |
  CMP #$30                                  ; $06A58F |
  BCS code_06A5BB                           ; $06A591 |
code_06A593:
  LDA $0560,x                               ; $06A593 |
  EOR #$01                                  ; $06A596 |
  STA $0560,x                               ; $06A598 |
  LDA $04A0,x                               ; $06A59B |
  EOR #$03                                  ; $06A59E |
  STA $04A0,x                               ; $06A5A0 |
  LDA $0580,x                               ; $06A5A3 |
  EOR #$40                                  ; $06A5A6 |
  STA $0580,x                               ; $06A5A8 |
  LDA #$49                                  ; $06A5AB |
  JSR reset_sprite_anim                     ; $06A5AD |
  DEC $0300,x                               ; $06A5B0 |
  DEC $0300,x                               ; $06A5B3 |
  LDA #$00                                  ; $06A5B6 |
  STA $0540,x                               ; $06A5B8 |
code_06A5BB:
  RTS                                       ; $06A5BB |

code_06A5BC:
  JSR find_enemy_freeslot_y                 ; $06A5BC |
  BCS code_06A624                           ; $06A5BF |
  STY $00                                   ; $06A5C1 |
  LDA $04A0,x                               ; $06A5C3 |
  STA $04A0,y                               ; $06A5C6 |
  AND #$01                                  ; $06A5C9 |
  TAY                                       ; $06A5CB |
  LDA $0360,x                               ; $06A5CC |
  LDY $00                                   ; $06A5CF |
  STA $0360,y                               ; $06A5D1 |
  LDA $0380,x                               ; $06A5D4 |
  STA $0380,y                               ; $06A5D7 |
  LDA $03C0,x                               ; $06A5DA |
  SEC                                       ; $06A5DD |
  SBC #$0E                                  ; $06A5DE |
  STA $03C0,y                               ; $06A5E0 |
  LDA #$00                                  ; $06A5E3 |
  STA $04E0,y                               ; $06A5E5 |
  STA $0320,y                               ; $06A5E8 |
  STA $0400,y                               ; $06A5EB |
  STA $0440,y                               ; $06A5EE |
  LDA #$04                                  ; $06A5F1 |
  STA $0420,y                               ; $06A5F3 |
  STA $0460,y                               ; $06A5F6 |
  LDA #$46                                  ; $06A5F9 |
  JSR code_1FF846                           ; $06A5FB |
  LDA #$8B                                  ; $06A5FE |
  STA $0480,y                               ; $06A600 |
  LDA #$10                                  ; $06A603 |
  STA $04C0,y                               ; $06A605 |
  LDY $01                                   ; $06A608 |
  LDA $A625,y                               ; $06A60A |
  LDY $00                                   ; $06A60D |
  STA $0500,y                               ; $06A60F |
  LDY $01                                   ; $06A612 |
  LDA $A628,y                               ; $06A614 |
  LDY $00                                   ; $06A617 |
  STA $0520,y                               ; $06A619 |
  INC $01                                   ; $06A61C |
  LDA $01                                   ; $06A61E |
  CMP #$03                                  ; $06A620 |
  BCC code_06A5BC                           ; $06A622 |
code_06A624:
  RTS                                       ; $06A624 |

  db $08, $10, $18, $32, $2A, $1E           ; $06A625 |

code_06A62B:
  LDA $0300,x                               ; $06A62B |
  AND #$0F                                  ; $06A62E |
  BNE code_06A653                           ; $06A630 |
  LDA $04A0,x                               ; $06A632 |
  AND #$01                                  ; $06A635 |
  BEQ code_06A63F                           ; $06A637 |
  JSR code_1FF71D                           ; $06A639 |
  JMP code_06A642                           ; $06A63C |

code_06A63F:
  JSR code_1FF73B                           ; $06A63F |
code_06A642:
  JSR code_1FF779                           ; $06A642 |
  DEC $0500,x                               ; $06A645 |
  BNE code_06A652                           ; $06A648 |
  LDA #$00                                  ; $06A64A |
  STA $0500,x                               ; $06A64C |
  INC $0300,x                               ; $06A64F |
code_06A652:
  RTS                                       ; $06A652 |

code_06A653:
  LDA $0300,x                               ; $06A653 |
  AND #$02                                  ; $06A656 |
  BNE code_06A663                           ; $06A658 |
  DEC $0520,x                               ; $06A65A |
  BNE code_06A652                           ; $06A65D |
  INC $0300,x                               ; $06A65F |
  RTS                                       ; $06A662 |

code_06A663:
  LDA $0500,x                               ; $06A663 |
  BNE code_06A67B                           ; $06A666 |
  LDA #$33                                  ; $06A668 |
  STA $02                                   ; $06A66A |
  LDA #$05                                  ; $06A66C |
  STA $03                                   ; $06A66E |
  JSR code_1FFC63                           ; $06A670 |
  LDA $0C                                   ; $06A673 |
  STA $04A0,x                               ; $06A675 |
  INC $0500,x                               ; $06A678 |
code_06A67B:
  LDA $04A0,x                               ; $06A67B |
  AND #$08                                  ; $06A67E |
  BEQ code_06A688                           ; $06A680 |
  JSR code_1FF779                           ; $06A682 |
  JMP code_06A68B                           ; $06A685 |

code_06A688:
  JSR code_1FF759                           ; $06A688 |
code_06A68B:
  LDA $04A0,x                               ; $06A68B |
  AND #$01                                  ; $06A68E |
  BEQ code_06A695                           ; $06A690 |
  JMP code_1FF71D                           ; $06A692 |

code_06A695:
  JMP code_1FF73B                           ; $06A695 |

code_06A698:
  LDA $0300,x                               ; $06A698 |
  AND #$0F                                  ; $06A69B |
  TAY                                       ; $06A69D |
  LDA $A6AB,y                               ; $06A69E |
  STA $00                                   ; $06A6A1 |
  LDA $A6B0,y                               ; $06A6A3 |
  STA $01                                   ; $06A6A6 |
  JMP ($0000)                               ; $06A6A8 |

  db $B5, $D6, $30, $93, $EE, $A6, $A6, $A7 ; $06A6AB |
  db $A7, $A7                               ; $06A6B3 |

  LDA #$00                                  ; $06A6B5 |
  STA $0500,x                               ; $06A6B7 |
  STA $0520,x                               ; $06A6BA |
  STA $0560,x                               ; $06A6BD |
  LDA #$80                                  ; $06A6C0 |
  STA $0400,x                               ; $06A6C2 |
  LDA #$00                                  ; $06A6C5 |
  STA $0420,x                               ; $06A6C7 |
  LDA $0300,x                               ; $06A6CA |
  ORA #$40                                  ; $06A6CD |
  STA $0300,x                               ; $06A6CF |
  INC $0300,x                               ; $06A6D2 |
  RTS                                       ; $06A6D5 |

  LDA $0520,x                               ; $06A6D6 |
  BNE code_06A722                           ; $06A6D9 |
  LDA $04A0,x                               ; $06A6DB |
  AND #$01                                  ; $06A6DE |
  BEQ code_06A6EA                           ; $06A6E0 |
  LDY #$24                                  ; $06A6E2 |
  JSR code_1FF580                           ; $06A6E4 |
  JMP code_06A6EF                           ; $06A6E7 |

code_06A6EA:
  LDY #$25                                  ; $06A6EA |
  JSR code_1FF5C4                           ; $06A6EC |
code_06A6EF:
  LDY #$22                                  ; $06A6EF |
  JSR code_1FF67C                           ; $06A6F1 |
  BCC code_06A714                           ; $06A6F4 |
  LDA #$40                                  ; $06A6F6 |
  JSR reset_sprite_anim                     ; $06A6F8 |
  LDA #$04                                  ; $06A6FB |
  STA $0520,x                               ; $06A6FD |
  JSR code_06A84C                           ; $06A700 |
  JSR code_06A836                           ; $06A703 |
  INC $0500,x                               ; $06A706 |
  LDA $0500,x                               ; $06A709 |
  CMP #$03                                  ; $06A70C |
  BCC code_06A72F                           ; $06A70E |
  INC $0300,x                               ; $06A710 |
  RTS                                       ; $06A713 |

code_06A714:
  LDA #$40                                  ; $06A714 |
  JSR reset_sprite_anim                     ; $06A716 |
  LDA #$00                                  ; $06A719 |
  STA $05E0,x                               ; $06A71B |
  STA $05A0,x                               ; $06A71E |
  RTS                                       ; $06A721 |

code_06A722:
  LDA #$01                                  ; $06A722 |
  STA $05A0,x                               ; $06A724 |
  LDA #$00                                  ; $06A727 |
  STA $05E0,x                               ; $06A729 |
  DEC $0520,x                               ; $06A72C |
code_06A72F:
  RTS                                       ; $06A72F |

  LDA $0540,x                               ; $06A730 |
  BNE code_06A743                           ; $06A733 |
  INC $0300,x                               ; $06A735 |
  LDA #$41                                  ; $06A738 |
  JSR reset_sprite_anim                     ; $06A73A |
  LDA #$00                                  ; $06A73D |
  STA $0520,x                               ; $06A73F |
  RTS                                       ; $06A742 |

code_06A743:
  INC $0300,x                               ; $06A743 |
  INC $0300,x                               ; $06A746 |
  LDA #$08                                  ; $06A749 |
  STA $0500,x                               ; $06A74B |
  LDA #$00                                  ; $06A74E |
  STA $0520,x                               ; $06A750 |
  LDA #$3E                                  ; $06A753 |
  JSR reset_sprite_anim                     ; $06A755 |
  LDA #$C8                                  ; $06A758 |
  STA $0320,x                               ; $06A75A |
  LDA $0360,x                               ; $06A75D |
  STA $0370                                 ; $06A760 |
  LDA $0380,x                               ; $06A763 |
  STA $0390                                 ; $06A766 |
  LDA $03C0,x                               ; $06A769 |
  STA $03D0                                 ; $06A76C |
  LDA #$00                                  ; $06A76F |
  STA $04F0                                 ; $06A771 |
  STA $0490                                 ; $06A774 |
  STA $0330                                 ; $06A777 |
  LDY #$10                                  ; $06A77A |
  LDA #$5A                                  ; $06A77C |
  JSR code_1FF846                           ; $06A77E |
  LDA #$C3                                  ; $06A781 |
  STA $0480,x                               ; $06A783 |
  LDA #$00                                  ; $06A786 |
  STA $0400,x                               ; $06A788 |
  LDA #$04                                  ; $06A78B |
  STA $0420,x                               ; $06A78D |
  JMP face_player                           ; $06A790 |

  LDA $0520,x                               ; $06A793 |
  BNE code_06A7B4                           ; $06A796 |
  LDA $05A0,x                               ; $06A798 |
  CMP #$00                                  ; $06A79B |
  BNE code_06A7ED                           ; $06A79D |
  JSR code_06A836                           ; $06A79F |
  LDA #$00                                  ; $06A7A2 |
  STA $01                                   ; $06A7A4 |
  JSR code_06A874                           ; $06A7A6 |
  LDA #$14                                  ; $06A7A9 |
  STA $0500,x                               ; $06A7AB |
  LDA #$FF                                  ; $06A7AE |
  STA $0520,x                               ; $06A7B0 |
  RTS                                       ; $06A7B3 |

code_06A7B4:
  LDA $05A0,x                               ; $06A7B4 |
  BNE code_06A7D7                           ; $06A7B7 |
  DEC $0500,x                               ; $06A7B9 |
  BNE code_06A7CE                           ; $06A7BC |
  LDA #$2E                                  ; $06A7BE |
  JSR code_1FF89A                           ; $06A7C0 |
  LDA #$01                                  ; $06A7C3 |
  STA $05A0,x                               ; $06A7C5 |
  LDA #$00                                  ; $06A7C8 |
  STA $05E0,x                               ; $06A7CA |
  RTS                                       ; $06A7CD |

code_06A7CE:
  LDA #$00                                  ; $06A7CE |
  STA $05A0,x                               ; $06A7D0 |
  STA $05E0,x                               ; $06A7D3 |
  RTS                                       ; $06A7D6 |

code_06A7D7:
  LDA $05E0,x                               ; $06A7D7 |
  AND #$08                                  ; $06A7DA |
  BEQ code_06A7E1                           ; $06A7DC |
  INC $05A0,x                               ; $06A7DE |
code_06A7E1:
  LDA $05A0,x                               ; $06A7E1 |
  CMP #$06                                  ; $06A7E4 |
  BNE code_06A7ED                           ; $06A7E6 |
  LDA #$C0                                  ; $06A7E8 |
  STA $0300,x                               ; $06A7EA |
code_06A7ED:
  RTS                                       ; $06A7ED |

  LDA $0520,x                               ; $06A7EE |
  BEQ code_06A7F8                           ; $06A7F1 |
  DEC $0500,x                               ; $06A7F3 |
  BEQ code_06A81E                           ; $06A7F6 |
code_06A7F8:
  LDA $04A0,x                               ; $06A7F8 |
  AND #$01                                  ; $06A7FB |
  BEQ code_06A807                           ; $06A7FD |
  LDY #$24                                  ; $06A7FF |
  JSR code_1FF580                           ; $06A801 |
  JMP code_06A80C                           ; $06A804 |

code_06A807:
  LDY #$25                                  ; $06A807 |
  JSR code_1FF5C4                           ; $06A809 |
code_06A80C:
  BCS code_06A81E                           ; $06A80C |
  LDA $0520,x                               ; $06A80E |
  BNE code_06A835                           ; $06A811 |
  JSR code_1FF8C2                           ; $06A813 |
  CMP #$08                                  ; $06A816 |
  BCS code_06A835                           ; $06A818 |
  INC $0520,x                               ; $06A81A |
  RTS                                       ; $06A81D |

code_06A81E:
  LDA #$3D                                  ; $06A81E |
  JSR reset_sprite_anim                     ; $06A820 |
  LDA #$C0                                  ; $06A823 |
  STA $0300,x                               ; $06A825 |
  LDA #$CA                                  ; $06A828 |
  STA $0480,x                               ; $06A82A |
  JSR code_06A836                           ; $06A82D |
  LDA #$C3                                  ; $06A830 |
  STA $0320,x                               ; $06A832 |
code_06A835:
  RTS                                       ; $06A835 |

code_06A836:
  LDA $04A0,x                               ; $06A836 |
  PHA                                       ; $06A839 |
  JSR face_player                           ; $06A83A |
  PLA                                       ; $06A83D |
  CMP $04A0,x                               ; $06A83E |
  BEQ code_06A84B                           ; $06A841 |
  LDA $0580,x                               ; $06A843 |
  EOR #$40                                  ; $06A846 |
  STA $0580,x                               ; $06A848 |
code_06A84B:
  RTS                                       ; $06A84B |

code_06A84C:
  LDA $E4                                   ; $06A84C |
  ADC $E5                                   ; $06A84E |
  STA $E5                                   ; $06A850 |
  AND #$03                                  ; $06A852 |
  TAY                                       ; $06A854 |
  LDA $A868,y                               ; $06A855 |
  STA $0440,x                               ; $06A858 |
  LDA $A86C,y                               ; $06A85B |
  STA $0460,x                               ; $06A85E |
  LDA $A870,y                               ; $06A861 |
  STA $0540,x                               ; $06A864 |
  RTS                                       ; $06A867 |

  db $9E, $88, $00, $88, $04, $06, $08, $06 ; $06A868 |
  db $00, $01, $00, $01                     ; $06A870 |

code_06A874:
  JSR find_enemy_freeslot_y                 ; $06A874 |
  BCS code_06A8D7                           ; $06A877 |
  STY $00                                   ; $06A879 |
  LDA $04A0,x                               ; $06A87B |
  STA $04A0,y                               ; $06A87E |
  AND #$01                                  ; $06A881 |
  TAY                                       ; $06A883 |
  LDA $0360,x                               ; $06A884 |
  LDY $00                                   ; $06A887 |
  STA $0360,y                               ; $06A889 |
  LDA $0380,x                               ; $06A88C |
  STA $0380,y                               ; $06A88F |
  LDA $03C0,x                               ; $06A892 |
  SEC                                       ; $06A895 |
  SBC #$18                                  ; $06A896 |
  STA $03C0,y                               ; $06A898 |
  LDA #$00                                  ; $06A89B |
  STA $04E0,y                               ; $06A89D |
  LDA #$42                                  ; $06A8A0 |
  JSR code_1FF846                           ; $06A8A2 |
  LDA #$80                                  ; $06A8A5 |
  STA $0480,y                               ; $06A8A7 |
  LDA #$C6                                  ; $06A8AA |
  STA $0320,y                               ; $06A8AC |
  STX $03                                   ; $06A8AF |
  LDA $01                                   ; $06A8B1 |
  ASL                                       ; $06A8B3 |
  TAX                                       ; $06A8B4 |
  LDA $A8D8,x                               ; $06A8B5 |
  STA $0440,y                               ; $06A8B8 |
  LDA $A8D9,x                               ; $06A8BB |
  STA $0460,y                               ; $06A8BE |
  LDA $A8DC,x                               ; $06A8C1 |
  STA $0400,y                               ; $06A8C4 |
  LDA $A8DD,x                               ; $06A8C7 |
  STA $0420,y                               ; $06A8CA |
  LDX $03                                   ; $06A8CD |
  INC $01                                   ; $06A8CF |
  LDA $01                                   ; $06A8D1 |
  CMP #$02                                  ; $06A8D3 |
  BCC code_06A874                           ; $06A8D5 |
code_06A8D7:
  RTS                                       ; $06A8D7 |

  db $D2, $FC, $00, $00, $2E, $03, $80, $04 ; $06A8D8 |

code_06A8E0:
  LDA $05C0,x                               ; $06A8E0 |
  CMP #$42                                  ; $06A8E3 |
  BNE code_06A8FC                           ; $06A8E5 |
  LDA $05A0,x                               ; $06A8E7 |
  CMP #$06                                  ; $06A8EA |
  BNE code_06A929                           ; $06A8EC |
  LDA #$43                                  ; $06A8EE |
  JSR reset_sprite_anim                     ; $06A8F0 |
  LDA $03C0,x                               ; $06A8F3 |
  CLC                                       ; $06A8F6 |
  ADC #$0E                                  ; $06A8F7 |
  STA $03C0,x                               ; $06A8F9 |
code_06A8FC:
  LDA #$00                                  ; $06A8FC |
  STA $02                                   ; $06A8FE |
  LDA $0460,x                               ; $06A900 |
  BPL code_06A907                           ; $06A903 |
  DEC $02                                   ; $06A905 |
code_06A907:
  LDA $03A0,x                               ; $06A907 |
  CLC                                       ; $06A90A |
  ADC $0440,x                               ; $06A90B |
  STA $03A0,x                               ; $06A90E |
  LDA $03C0,x                               ; $06A911 |
  ADC $0460,x                               ; $06A914 |
  STA $03C0,x                               ; $06A917 |
  LDA $03E0,x                               ; $06A91A |
  ADC $02                                   ; $06A91D |
  BNE code_06A924                           ; $06A91F |
  JMP code_06A68B                           ; $06A921 |

code_06A924:
  LDA #$00                                  ; $06A924 |
  STA $0300,x                               ; $06A926 |
code_06A929:
  RTS                                       ; $06A929 |

  db $AA, $81, $0A, $B6, $03, $D7, $A9, $F9 ; $06A92A |
  db $A8, $3C, $E2, $71, $20, $F7, $22, $9B ; $06A932 |
  db $A0, $ED, $AA, $32, $8A, $BD, $0A, $4F ; $06A93A |
  db $AA, $55, $EA, $6B, $A0, $B2, $BA, $C7 ; $06A942 |
  db $90, $7F, $A8, $47, $88, $F2, $A0, $C2 ; $06A94A |
  db $8A, $7F, $A2, $E3, $A2, $A7, $22, $BF ; $06A952 |
  db $8A, $F1, $AA, $EF, $A2, $FA, $80, $E6 ; $06A95A |
  db $AA, $F7, $88, $E7, $2A, $FD, $AE, $C8 ; $06A962 |
  db $22, $71, $80, $F9, $A2, $B6, $88, $99 ; $06A96A |
  db $28, $36, $2A, $98, $A2, $6E, $A2, $76 ; $06A972 |
  db $A9, $FF, $8A, $D3, $22, $3C, $8A, $73 ; $06A97A |
  db $2A, $D6, $28, $15, $09, $B0, $2E, $7F ; $06A982 |
  db $A2, $E4, $EA, $7D, $0A, $51, $8A, $C5 ; $06A98A |
  db $80, $57, $A8, $C4, $82, $54, $A2, $EF ; $06A992 |
  db $AA, $C1, $AA, $DE, $2A, $F1, $82, $66 ; $06A99A |
  db $8A, $10, $23, $1F, $AA, $7C, $3A, $7C ; $06A9A2 |
  db $8A, $E7, $88, $FA, $20, $0D, $A2, $1D ; $06A9AA |
  db $20, $63, $A8, $FC, $88, $7D, $A8, $4B ; $06A9B2 |
  db $80, $FD, $AA, $E5, $22, $E9, $A0, $FC ; $06A9BA |
  db $A2, $39, $80, $1C, $AA, $54, $A8, $AB ; $06A9C2 |
  db $8E, $2D, $82, $7F, $8A, $33, $8A, $F7 ; $06A9CA |
  db $AA, $DF, $02, $3F, $A0, $FC, $A3, $74 ; $06A9D2 |
  db $AA, $B7, $AA, $EF, $2A, $FF, $A8, $6A ; $06A9DA |
  db $A0, $BF, $A2, $BF, $08, $DE, $80, $F2 ; $06A9E2 |
  db $A2, $FF, $28, $73, $82, $38, $18, $FF ; $06A9EA |
  db $88, $DD, $A8, $FF, $8A, $FC, $8A, $F6 ; $06A9F2 |
  db $AA, $FF, $A2, $F3, $AA, $EC, $00, $01 ; $06A9FA |
  db $02, $03, $04, $05, $06, $07, $08, $09 ; $06AA02 |
  db $0A, $0B, $0C, $0D, $0E, $0F, $10, $11 ; $06AA0A |
  db $12, $13, $14, $15, $16, $17, $20, $EF ; $06AA12 |
  db $28, $BF, $A2, $D5, $AA, $EF, $88, $DF ; $06AA1A |
  db $A0, $EE, $28, $F6, $08, $6F, $AA, $5E ; $06AA22 |
  db $4A, $B8, $B2, $4F, $02, $6C, $15, $24 ; $06AA2A |
  db $30, $FE, $A8, $F1, $A8, $BE, $82, $77 ; $06AA32 |
  db $A2, $9B, $22, $EB, $0A, $BF, $80, $A3 ; $06AA3A |
  db $80, $A2, $80, $A1, $40, $40, $40, $62 ; $06AA42 |
  db $63, $20, $20, $00, $88, $63, $88, $EF ; $06AA4A |
  db $82, $FB, $22, $7C, $AA, $E6, $8A, $6D ; $06AA52 |
  db $A8, $08, $A8, $FB, $0A, $FC, $08, $00 ; $06AA5A |
  db $1A, $00, $17, $00, $03, $00, $2D, $00 ; $06AA62 |
  db $08, $00, $00, $00, $00, $00, $00, $01 ; $06AA6A |
  db $32, $01, $02, $00, $00, $00, $28, $00 ; $06AA72 |
  db $00, $38, $A0, $BE, $A2, $EF, $54, $56 ; $06AA7A |
  db $0F, $20, $32, $02, $0F, $20, $32, $26 ; $06AA82 |
  db $0F, $20, $32, $0F, $0F, $1B, $1B, $0F ; $06AA8A |
  db $87, $88, $89, $00, $0F, $20, $32, $02 ; $06AA92 |
  db $0F, $20, $32, $26, $0F, $20, $32, $0F ; $06AA9A |
  db $0F, $20, $10, $16, $87, $88, $00, $00 ; $06AAA2 |
  db $8A, $EE, $0A, $FE, $A8, $D3, $8A, $FD ; $06AAAA |
  db $A8, $B9, $AA, $91, $24, $CD, $83, $7F ; $06AAB2 |
  db $AA, $E7, $A0, $EF, $2A, $FE, $0A, $35 ; $06AABA |
  db $28, $F7, $A8, $FF, $AA, $5D, $A6, $FD ; $06AAC2 |
  db $AA, $36, $0A, $D6, $28, $7D, $AA, $EA ; $06AACA |
  db $A2, $36, $8A, $F4, $23, $56, $A8, $EA ; $06AAD2 |
  db $E8, $FC, $8A, $EE, $28, $DF, $2A, $18 ; $06AADA |
  db $08, $D9, $0A, $F4, $99, $D7, $A2, $DE ; $06AAE2 |
  db $20, $FA, $82, $73, $22, $A9, $09, $0B ; $06AAEA |
  db $AA, $B7, $A8, $ED, $28, $4C, $0F, $16 ; $06AAF2 |
  db $FF, $4F, $AA, $DF, $AA, $BD, $00, $01 ; $06AAFA |
  db $02, $03, $03, $03, $03, $04, $05, $06 ; $06AB02 |
  db $07, $07, $07, $08, $08, $09, $09, $09 ; $06AB0A |
  db $0A, $0B, $0B, $0B, $10, $10, $11, $12 ; $06AB12 |
  db $12, $12, $12, $13, $13, $14, $14, $14 ; $06AB1A |
  db $14, $14, $14, $15, $15, $15, $17, $FF ; $06AB22 |
  db $08, $5F, $88, $E1, $2A, $FD, $AA, $7F ; $06AB2A |
  db $02, $D0, $AA, $B7, $22, $5F, $A0, $EF ; $06AB32 |
  db $AA, $E8, $8A, $9F, $A8, $BC, $AA, $4B ; $06AB3A |
  db $2A, $5E, $08, $CC, $AA, $BB, $82, $E9 ; $06AB42 |
  db $A0, $CE, $20, $DA, $A2, $BF, $82, $BB ; $06AB4A |
  db $8A, $86, $3A, $5F, $8A, $FA, $AA, $F4 ; $06AB52 |
  db $00, $AD, $AA, $BE, $00, $6F, $88, $B9 ; $06AB5A |
  db $00, $92, $2A, $C4, $AA, $3C, $42, $FC ; $06AB62 |
  db $2A, $BB, $A8, $AA, $A2, $5D, $0A, $FC ; $06AB6A |
  db $AA, $D7, $A8, $6C, $A8, $CF, $EA, $47 ; $06AB72 |
  db $82, $3B, $20, $DB, $A8, $FF, $82, $9B ; $06AB7A |
  db $28, $CE, $2A, $F9, $02, $87, $2A, $E5 ; $06AB82 |
  db $2A, $5D, $A8, $AF, $B8, $8E, $2A, $39 ; $06AB8A |
  db $A8, $D3, $22, $79, $AA, $34, $AA, $F5 ; $06AB92 |
  db $DA, $7E, $AA, $E3, $A2, $FD, $2A, $21 ; $06AB9A |
  db $8A, $B8, $80, $DF, $AA, $FE, $28, $FD ; $06ABA2 |
  db $AA, $F7, $AA, $5D, $2A, $7D, $80, $AF ; $06ABAA |
  db $0A, $F3, $02, $A9, $83, $BA, $2A, $A5 ; $06ABB2 |
  db $A8, $F6, $A8, $B0, $2A, $BF, $16, $28 ; $06ABBA |
  db $8A, $D1, $2A, $59, $AA, $4E, $AA, $5E ; $06ABC2 |
  db $02, $E5, $02, $2D, $88, $EB, $8E, $96 ; $06ABCA |
  db $2A, $F7, $22, $92, $2C, $BB, $AA, $95 ; $06ABD2 |
  db $AA, $DF, $88, $59, $AE, $DF, $A2, $11 ; $06ABDA |
  db $AA, $72, $82, $70, $AF, $89, $8A, $9F ; $06ABE2 |
  db $8A, $BE, $A0, $95, $AE, $EF, $AA, $8A ; $06ABEA |
  db $A2, $37, $8A, $BE, $AA, $FF, $28, $FC ; $06ABF2 |
  db $2A, $C3, $2A, $31, $8A, $CD, $48, $A8 ; $06ABFA |
  db $90, $10, $68, $90, $E8, $10, $70, $F8 ; $06AC02 |
  db $38, $68, $98, $78, $D8, $38, $68, $98 ; $06AC0A |
  db $D0, $10, $48, $76, $50, $F0, $90, $C8 ; $06AC12 |
  db $D8, $E8, $F8, $C8, $D8, $08, $18, $68 ; $06AC1A |
  db $98, $B8, $F8, $08, $28, $68, $D8, $FF ; $06AC22 |
  db $B2, $10, $10, $00, $12, $04, $24, $40 ; $06AC2A |
  db $84, $04, $C5, $00, $14, $00, $8B, $40 ; $06AC32 |
  db $18, $10, $30, $11, $40, $11, $62, $10 ; $06AC3A |
  db $00, $20, $08, $40, $0C, $01, $0E, $00 ; $06AC42 |
  db $16, $80, $00, $40, $C8, $20, $40, $00 ; $06AC4A |
  db $C0, $40, $02, $00, $06, $00, $84, $01 ; $06AC52 |
  db $65, $00, $20, $00, $80, $50, $20, $40 ; $06AC5A |
  db $2C, $10, $F0, $40, $E4, $10, $88, $11 ; $06AC62 |
  db $08, $40, $60, $C0, $64, $11, $91, $55 ; $06AC6A |
  db $21, $00, $20, $44, $A0, $00, $03, $05 ; $06AC72 |
  db $69, $00, $00, $51, $C8, $51, $21, $04 ; $06AC7A |
  db $00, $10, $00, $00, $00, $40, $00, $00 ; $06AC82 |
  db $20, $00, $40, $00, $14, $00, $20, $05 ; $06AC8A |
  db $08, $00, $40, $40, $00, $00, $02, $00 ; $06AC92 |
  db $04, $00, $3B, $24, $87, $01, $84, $41 ; $06AC9A |
  db $04, $44, $21, $14, $11, $14, $44, $14 ; $06ACA2 |
  db $00, $00, $0A, $14, $02, $41, $00, $10 ; $06ACAA |
  db $39, $40, $45, $20, $C8, $00, $8A, $05 ; $06ACB2 |
  db $20, $00, $50, $81, $4D, $0C, $12, $00 ; $06ACBA |
  db $60, $41, $25, $00, $B0, $00, $5C, $10 ; $06ACC2 |
  db $40, $51, $00, $10, $04, $20, $84, $00 ; $06ACCA |
  db $07, $00, $04, $20, $11, $10, $57, $00 ; $06ACD2 |
  db $50, $00, $3C, $41, $08, $01, $0A, $41 ; $06ACDA |
  db $29, $06, $0C, $54, $08, $04, $E2, $54 ; $06ACE2 |
  db $80, $00, $48, $00, $4C, $01, $0E, $00 ; $06ACEA |
  db $F0, $50, $F0, $44, $87, $51, $89, $50 ; $06ACF2 |
  db $E1, $41, $C1, $41, $0F, $55, $58, $70 ; $06ACFA |
  db $54, $54, $80, $54, $80, $54, $50, $C8 ; $06AD02 |
  db $98, $D8, $88, $70, $70, $A4, $58, $58 ; $06AD0A |
  db $98, $98, $98, $98, $40, $40, $40, $BC ; $06AD12 |
  db $BC, $BC, $BC, $B8, $48, $90, $38, $58 ; $06AD1A |
  db $98, $38, $68, $C8, $48, $68, $00, $FF ; $06AD22 |
  db $A0, $40, $40, $00, $20, $00, $E1, $40 ; $06AD2A |
  db $95, $01, $B0, $01, $C0, $40, $89, $44 ; $06AD32 |
  db $A1, $04, $04, $04, $FE, $07, $70, $00 ; $06AD3A |
  db $30, $10, $A0, $10, $20, $00, $01, $00 ; $06AD42 |
  db $20, $00, $06, $01, $A0, $01, $8A, $00 ; $06AD4A |
  db $A5, $11, $A0, $04, $80, $10, $C4, $10 ; $06AD52 |
  db $89, $00, $C2, $00, $9C, $45, $00, $41 ; $06AD5A |
  db $A4, $00, $45, $84, $69, $14, $08, $00 ; $06AD62 |
  db $05, $11, $48, $14, $83, $01, $28, $05 ; $06AD6A |
  db $60, $15, $E2, $10, $1A, $21, $81, $55 ; $06AD72 |
  db $08, $00, $A3, $21, $CD, $44, $09, $10 ; $06AD7A |
  db $01, $04, $22, $00, $00, $00, $00, $00 ; $06AD82 |
  db $00, $00, $A1, $04, $25, $01, $00, $00 ; $06AD8A |
  db $0D, $04, $81, $00, $54, $01, $83, $00 ; $06AD92 |
  db $00, $00, $3E, $00, $CA, $40, $50, $14 ; $06AD9A |
  db $00, $00, $0C, $15, $88, $04, $21, $40 ; $06ADA2 |
  db $18, $00, $09, $44, $66, $40, $C0, $10 ; $06ADAA |
  db $80, $40, $22, $02, $30, $91, $12, $00 ; $06ADB2 |
  db $A4, $20, $82, $50, $84, $40, $00, $20 ; $06ADBA |
  db $04, $03, $01, $54, $00, $10, $20, $01 ; $06ADC2 |
  db $20, $00, $28, $10, $05, $00, $10, $00 ; $06ADCA |
  db $68, $18, $02, $00, $45, $00, $51, $00 ; $06ADD2 |
  db $20, $02, $B0, $00, $48, $01, $DA, $10 ; $06ADDA |
  db $96, $55, $A9, $55, $4C, $10, $B5, $05 ; $06ADE2 |
  db $E9, $00, $C5, $15, $32, $14, $D0, $00 ; $06ADEA |
  db $59, $40, $9D, $04, $FD, $04, $87, $00 ; $06ADF2 |
  db $7A, $44, $11, $04, $28, $00, $36, $64 ; $06ADFA |
  db $24, $24, $65, $24, $65, $24, $03, $2D ; $06AE02 |
  db $2D, $2D, $2D, $64, $64, $12, $50, $52 ; $06AE0A |
  db $36, $36, $36, $36, $63, $63, $63, $53 ; $06AE12 |
  db $53, $53, $53, $2D, $20, $2D, $20, $20 ; $06AE1A |
  db $2D, $20, $20, $2D, $20, $20, $4D, $FF ; $06AE22 |
  db $40, $04, $01, $41, $48, $04, $0C, $40 ; $06AE2A |
  db $00, $40, $43, $04, $11, $44, $A0, $05 ; $06AE32 |
  db $00, $04, $01, $04, $69, $40, $C0, $01 ; $06AE3A |
  db $04, $00, $10, $41, $20, $11, $08, $00 ; $06AE42 |
  db $48, $00, $00, $05, $80, $00, $02, $00 ; $06AE4A |
  db $40, $00, $10, $41, $20, $00, $44, $40 ; $06AE52 |
  db $11, $00, $18, $00, $C4, $41, $80, $80 ; $06AE5A |
  db $22, $15, $08, $04, $2A, $10, $64, $15 ; $06AE62 |
  db $00, $00, $60, $00, $88, $60, $14, $00 ; $06AE6A |
  db $80, $50, $5D, $00, $A0, $44, $26, $40 ; $06AE72 |
  db $13, $01, $4A, $05, $78, $C8, $00, $00 ; $06AE7A |
  db $19, $41, $40, $81, $00, $14, $10, $05 ; $06AE82 |
  db $E0, $01, $92, $01, $04, $00, $4C, $00 ; $06AE8A |
  db $88, $40, $40, $10, $85, $40, $68, $00 ; $06AE92 |
  db $82, $00, $12, $50, $0F, $00, $80, $42 ; $06AE9A |
  db $01, $00, $55, $50, $08, $01, $80, $50 ; $06AEA2 |
  db $80, $05, $20, $10, $81, $20, $10, $51 ; $06AEAA |
  db $22, $04, $8F, $00, $4D, $50, $A2, $01 ; $06AEB2 |
  db $04, $40, $80, $80, $65, $80, $C0, $20 ; $06AEBA |
  db $00, $00, $82, $00, $00, $04, $11, $00 ; $06AEC2 |
  db $24, $10, $15, $00, $80, $40, $09, $44 ; $06AECA |
  db $02, $04, $00, $10, $80, $11, $CD, $44 ; $06AED2 |
  db $00, $00, $80, $00, $65, $40, $22, $19 ; $06AEDA |
  db $70, $41, $61, $01, $E2, $69, $A2, $00 ; $06AEE2 |
  db $49, $50, $EA, $10, $74, $45, $84, $44 ; $06AEEA |
  db $95, $14, $5D, $00, $B1, $40, $0A, $50 ; $06AEF2 |
  db $20, $05, $A4, $16, $5F, $00, $00, $01 ; $06AEFA |
  db $02, $03, $03, $03, $03, $03, $00, $04 ; $06AF02 |
  db $05, $06, $07, $07, $07, $08, $00, $09 ; $06AF0A |
  db $0A, $0B, $0C, $0D, $0E, $0F, $10, $11 ; $06AF12 |
  db $11, $11, $11, $12, $13, $0F, $14, $15 ; $06AF1A |
  db $16, $0E, $0E, $17, $18, $0F, $19, $1A ; $06AF22 |
  db $0A, $0B, $0C, $0D, $0E, $0F, $1B, $1B ; $06AF2A |
  db $1B, $1B, $1B, $1B, $1B, $1C, $03, $03 ; $06AF32 |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $06AF3A |
  db $03, $03, $03, $03, $03, $03, $1D, $07 ; $06AF42 |
  db $07, $1E, $07, $07, $07, $07, $00, $0E ; $06AF4A |
  db $0E, $1F, $14, $20, $14, $15, $00, $21 ; $06AF52 |
  db $22, $23, $24, $25, $24, $26, $00, $27 ; $06AF5A |
  db $28, $29, $19, $2A, $19, $1A, $00, $0E ; $06AF62 |
  db $2B, $1B, $1B, $1B, $1B, $2C, $00, $2D ; $06AF6A |
  db $02, $03, $03, $03, $03, $2E, $00, $01 ; $06AF72 |
  db $02, $03, $03, $03, $03, $03, $03, $03 ; $06AF7A |
  db $03, $03, $2F, $03, $03, $03, $07, $07 ; $06AF82 |
  db $07, $07, $2F, $07, $07, $07, $0E, $30 ; $06AF8A |
  db $30, $30, $31, $32, $32, $32, $0E, $33 ; $06AF92 |
  db $33, $34, $35, $36, $37, $38, $0E, $0E ; $06AF9A |
  db $39, $3A, $09, $0A, $3B, $3C, $3D, $0C ; $06AFA2 |
  db $0D, $33, $0E, $3E, $38, $0E, $1B, $1B ; $06AFAA |
  db $1B, $1B, $1B, $3F, $2C, $0E, $03, $03 ; $06AFB2 |
  db $03, $03, $03, $03, $00, $0E, $2F, $03 ; $06AFBA |
  db $03, $03, $2F, $03, $03, $03, $2F, $07 ; $06AFC2 |
  db $07, $07, $2F, $07, $07, $07, $31, $32 ; $06AFCA |
  db $32, $32, $31, $32, $32, $32, $0E, $40 ; $06AFD2 |
  db $36, $37, $0E, $38, $38, $37, $0E, $41 ; $06AFDA |
  db $42, $43, $3C, $17, $0E, $44, $0E, $09 ; $06AFE2 |
  db $0A, $0B, $0C, $0D, $0E, $38, $45, $1B ; $06AFEA |
  db $1B, $1B, $1B, $1B, $1B, $1B, $0F, $03 ; $06AFF2 |
  db $03, $03, $03, $03, $03, $03, $2F, $03 ; $06AFFA |
  db $03, $03, $03, $03, $46, $0F, $2F, $07 ; $06B002 |
  db $07, $07, $07, $07, $47, $0F, $31, $30 ; $06B00A |
  db $30, $32, $32, $0E, $01, $0F, $0E, $34 ; $06B012 |
  db $48, $2C, $37, $0E, $0E, $0F, $49, $3A ; $06B01A |
  db $4A, $00, $3B, $4B, $4C, $1C, $0E, $33 ; $06B022 |
  db $0F, $2E, $1B, $1C, $03, $03, $1B, $1B ; $06B02A |
  db $1C, $03, $03, $03, $03, $03, $03, $03 ; $06B032 |
  db $03, $03, $03, $03, $03, $03, $4D, $4E ; $06B03A |
  db $4F, $4F, $4F, $4F, $4F, $50, $4D, $51 ; $06B042 |
  db $20, $14, $14, $20, $14, $52, $4D, $53 ; $06B04A |
  db $2A, $19, $19, $2A, $19, $52, $4D, $24 ; $06B052 |
  db $25, $54, $24, $25, $24, $52, $4D, $19 ; $06B05A |
  db $55, $56, $57, $2A, $19, $52, $58, $59 ; $06B062 |
  db $5A, $5B, $58, $57, $24, $52, $5B, $5B ; $06B06A |
  db $5B, $5B, $5B, $58, $5C, $52, $5B, $5B ; $06B072 |
  db $5B, $5B, $5B, $5B, $5D, $52, $5E, $5F ; $06B07A |
  db $5E, $5F, $5E, $1D, $07, $07, $60, $61 ; $06B082 |
  db $60, $61, $60, $00, $62, $62, $63, $64 ; $06B08A |
  db $63, $64, $63, $00, $0E, $65, $1D, $07 ; $06B092 |
  db $66, $07, $07, $67, $28, $68, $00, $15 ; $06B09A |
  db $14, $15, $14, $15, $0E, $17, $00, $26 ; $06B0A2 |
  db $24, $26, $24, $26, $0C, $0D, $00, $69 ; $06B0AA |
  db $1B, $1B, $1B, $1B, $2C, $0E, $00, $6A ; $06B0B2 |
  db $03, $03, $03, $03, $00, $0E, $07, $07 ; $06B0BA |
  db $07, $07, $07, $07, $07, $6B, $62, $62 ; $06B0C2 |
  db $62, $62, $62, $62, $62, $6C, $30, $0E ; $06B0CA |
  db $32, $6D, $0E, $65, $30, $6E, $6F, $0E ; $06B0D2 |
  db $70, $71, $72, $73, $74, $75, $33, $0E ; $06B0DA |
  db $76, $77, $0E, $78, $79, $7A, $0E, $0E ; $06B0E2 |
  db $0E, $0E, $0E, $0E, $45, $1B, $0E, $0E ; $06B0EA |
  db $0E, $0E, $0E, $0E, $0F, $03, $0E, $0E ; $06B0F2 |
  db $0E, $0E, $0E, $0E, $0F, $03, $03, $03 ; $06B0FA |
  db $03, $03, $03, $03, $7B, $0F, $07, $07 ; $06B102 |
  db $07, $07, $07, $07, $47, $0F, $6E, $0E ; $06B10A |
  db $0E, $41, $42, $0E, $01, $0F, $79, $65 ; $06B112 |
  db $0E, $7C, $7D, $0E, $0E, $0F, $28, $7E ; $06B11A |
  db $3D, $0C, $0D, $0E, $0E, $0F, $2C, $0E ; $06B122 |
  db $45, $2C, $0E, $45, $1B, $1C, $00, $0E ; $06B12A |
  db $0F, $00, $0E, $0F, $03, $03, $00, $0E ; $06B132 |
  db $0F, $00, $0E, $0F, $03, $03, $4D, $7F ; $06B13A |
  db $80, $4F, $4F, $4F, $4F, $50, $4D, $7F ; $06B142 |
  db $4D, $15, $14, $14, $1F, $52, $4D, $7F ; $06B14A |
  db $4D, $1A, $19, $19, $29, $52, $4D, $4E ; $06B152 |
  db $81, $82, $82, $83, $23, $52, $4D, $84 ; $06B15A |
  db $85, $86, $87, $17, $23, $52, $4D, $1A ; $06B162 |
  db $0A, $0B, $0C, $0D, $29, $52, $58, $59 ; $06B16A |
  db $59, $59, $59, $59, $5C, $52, $5B, $5B ; $06B172 |
  db $5B, $5B, $5B, $5B, $5D, $52, $5E, $5F ; $06B17A |
  db $5E, $5F, $5E, $5F, $5E, $5F, $63, $64 ; $06B182 |
  db $63, $64, $63, $64, $63, $64, $1D, $07 ; $06B18A |
  db $88, $07, $07, $07, $07, $07, $00, $16 ; $06B192 |
  db $32, $32, $89, $32, $32, $0E, $00, $42 ; $06B19A |
  db $43, $8A, $8A, $8B, $76, $0E, $00, $0A ; $06B1A2 |
  db $0B, $8C, $0B, $8C, $45, $1B, $00, $69 ; $06B1AA |
  db $1B, $1B, $1B, $1B, $1C, $03, $00, $6A ; $06B1B2 |
  db $03, $03, $03, $03, $03, $03, $5E, $5F ; $06B1BA |
  db $5E, $5F, $5E, $5F, $5E, $5F, $63, $64 ; $06B1C2 |
  db $63, $64, $63, $64, $63, $64, $07, $07 ; $06B1CA |
  db $07, $07, $07, $08, $03, $03, $0E, $0E ; $06B1D2 |
  db $0E, $0E, $0E, $0F, $03, $03, $0E, $0E ; $06B1DA |
  db $0E, $0E, $0E, $0F, $03, $03, $1B, $1B ; $06B1E2 |
  db $1B, $2C, $0E, $0F, $03, $03, $03, $03 ; $06B1EA |
  db $03, $00, $0E, $0F, $03, $03, $03, $03 ; $06B1F2 |
  db $8D, $8E, $0E, $0F, $03, $03, $5B, $5B ; $06B1FA |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B202 |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B20A |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B212 |
  db $4D, $19, $19, $52, $5B, $5B, $5B, $5B ; $06B21A |
  db $4D, $8F, $8F, $52, $5B, $5B, $5B, $5B ; $06B222 |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B22A |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B232 |
  db $4D, $0E, $0E, $52, $5B, $5B, $03, $03 ; $06B23A |
  db $00, $0E, $0E, $0F, $03, $03, $03, $03 ; $06B242 |
  db $00, $19, $19, $0F, $03, $03, $03, $03 ; $06B24A |
  db $00, $8F, $8F, $0F, $03, $03, $03, $03 ; $06B252 |
  db $00, $0E, $0E, $0F, $03, $03, $03, $03 ; $06B25A |
  db $00, $0E, $0E, $0F, $03, $03, $03, $03 ; $06B262 |
  db $00, $19, $19, $0F, $03, $03, $03, $03 ; $06B26A |
  db $00, $8F, $8F, $0F, $03, $03, $03, $03 ; $06B272 |
  db $00, $0E, $0E, $0F, $03, $03, $5B, $5B ; $06B27A |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B282 |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B28A |
  db $4D, $0E, $0E, $52, $5B, $5B, $5B, $5B ; $06B292 |
  db $4D, $19, $19, $52, $5B, $5B, $5B, $5B ; $06B29A |
  db $4D, $24, $24, $52, $5B, $5B, $5B, $5B ; $06B2A2 |
  db $4D, $19, $19, $52, $5B, $5B, $5B, $5B ; $06B2AA |
  db $4D, $8F, $8F, $52, $5B, $5B, $5B, $5B ; $06B2B2 |
  db $4D, $0E, $0E, $52, $5B, $5B, $03, $03 ; $06B2BA |
  db $00, $0E, $0E, $0F, $03, $5F, $1D, $07 ; $06B2C2 |
  db $67, $19, $19, $6C, $90, $91, $00, $14 ; $06B2CA |
  db $1F, $24, $24, $14, $1F, $14, $00, $92 ; $06B2D2 |
  db $93, $92, $92, $92, $93, $92, $00, $24 ; $06B2DA |
  db $23, $24, $24, $24, $23, $24, $00, $24 ; $06B2E2 |
  db $23, $24, $24, $24, $23, $24, $2E, $1B ; $06B2EA |
  db $1B, $1B, $1B, $1B, $1B, $1B, $03, $03 ; $06B2F2 |
  db $03, $03, $03, $03, $03, $03, $5E, $03 ; $06B2FA |
  db $2F, $03, $5F, $5E, $03, $2F, $94, $07 ; $06B302 |
  db $2F, $07, $91, $94, $07, $2F, $14, $95 ; $06B30A |
  db $96, $97, $14, $1F, $95, $96, $92, $98 ; $06B312 |
  db $0E, $99, $92, $93, $98, $0E, $24, $9A ; $06B31A |
  db $0E, $9B, $24, $23, $9A, $0E, $45, $2C ; $06B322 |
  db $9C, $45, $1B, $1B, $2C, $9C, $1C, $00 ; $06B32A |
  db $9C, $0F, $03, $03, $00, $9D, $03, $00 ; $06B332 |
  db $9C, $0F, $03, $03, $00, $9C, $03, $5F ; $06B33A |
  db $5E, $03, $2F, $03, $5F, $5E, $07, $91 ; $06B342 |
  db $94, $07, $2F, $07, $91, $9E, $97, $14 ; $06B34A |
  db $1F, $95, $96, $97, $14, $0F, $99, $92 ; $06B352 |
  db $93, $98, $0E, $99, $92, $0F, $9B, $24 ; $06B35A |
  db $23, $9A, $0E, $9B, $24, $0F, $45, $1B ; $06B362 |
  db $1B, $2C, $9C, $45, $9F, $0F, $0F, $03 ; $06B36A |
  db $03, $00, $9C, $0F, $7B, $0F, $0F, $03 ; $06B372 |
  db $03, $00, $9D, $0F, $A0, $0F, $1D, $07 ; $06B37A |
  db $07, $10, $11, $A1, $A2, $A3, $00, $15 ; $06B382 |
  db $14, $14, $15, $0E, $0E, $0F, $00, $A4 ; $06B38A |
  db $92, $92, $A4, $0E, $45, $1C, $00, $26 ; $06B392 |
  db $24, $45, $1B, $1B, $1C, $03, $00, $A4 ; $06B39A |
  db $92, $6C, $07, $07, $08, $1D, $00, $26 ; $06B3A2 |
  db $24, $14, $15, $0E, $A5, $8E, $A6, $1B ; $06B3AA |
  db $1B, $1B, $1B, $1B, $1B, $1B, $03, $03 ; $06B3B2 |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $06B3BA |
  db $03, $8D, $A7, $A7, $A7, $A7, $03, $03 ; $06B3C2 |
  db $1D, $67, $95, $89, $0E, $0E, $03, $1D ; $06B3CA |
  db $67, $A8, $A9, $AA, $AB, $22, $1D, $67 ; $06B3D2 |
  db $14, $24, $AC, $3B, $AD, $28, $67, $AE ; $06B3DA |
  db $92, $92, $3E, $38, $0E, $0E, $0E, $9B ; $06B3E2 |
  db $24, $45, $AF, $0E, $0E, $0E, $1B, $1B ; $06B3EA |
  db $1B, $1C, $00, $0E, $0E, $0E, $03, $03 ; $06B3F2 |
  db $03, $03, $00, $0E, $0E, $0E, $A7, $A7 ; $06B3FA |
  db $A7, $A7, $A7, $A7, $A7, $A7, $0E, $6E ; $06B402 |
  db $32, $89, $32, $89, $0E, $79, $B0, $B1 ; $06B40A |
  db $AA, $B2, $76, $B3, $AB, $22, $68, $B4 ; $06B412 |
  db $76, $0E, $0E, $44, $AD, $28, $0E, $B5 ; $06B41A |
  db $0E, $32, $0E, $38, $0E, $0E, $0E, $B6 ; $06B422 |
  db $0E, $B7, $0E, $0E, $B8, $0E, $0E, $B6 ; $06B42A |
  db $0E, $B9, $0E, $0E, $BA, $0E, $0E, $B6 ; $06B432 |
  db $0E, $B9, $0E, $0E, $BA, $0E, $A7, $A7 ; $06B43A |
  db $A7, $A7, $A7, $BB, $03, $03, $79, $6E ; $06B442 |
  db $97, $14, $14, $6C, $08, $03, $B0, $BC ; $06B44A |
  db $BD, $19, $19, $BE, $6C, $08, $68, $B4 ; $06B452 |
  db $9B, $24, $24, $26, $14, $6C, $0E, $33 ; $06B45A |
  db $BD, $19, $19, $1A, $19, $BF, $0E, $0E ; $06B462 |
  db $45, $2C, $24, $26, $24, $C0, $0E, $0E ; $06B46A |
  db $0F, $2E, $1B, $1B, $1B, $1B, $0E, $0E ; $06B472 |
  db $0F, $03, $03, $03, $03, $03, $03, $03 ; $06B47A |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $06B482 |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $06B48A |
  db $03, $03, $03, $03, $03, $03, $07, $07 ; $06B492 |
  db $07, $07, $07, $C1, $C2, $C3, $C4, $15 ; $06B49A |
  db $14, $14, $14, $15, $19, $C5, $C6, $26 ; $06B4A2 |
  db $24, $24, $24, $26, $C7, $C8, $1B, $1B ; $06B4AA |
  db $1B, $1B, $1B, $1B, $1C, $03, $03, $03 ; $06B4B2 |
  db $03, $03, $03, $03, $03, $03, $C9, $07 ; $06B4BA |
  db $07, $07, $07, $07, $07, $CA, $CB, $15 ; $06B4C2 |
  db $0E, $0E, $32, $32, $1F, $CC, $CD, $1A ; $06B4CA |
  db $41, $42, $CE, $CF, $29, $D0, $D1, $26 ; $06B4D2 |
  db $D2, $D3, $3B, $D4, $23, $D5, $D6, $1A ; $06B4DA |
  db $0E, $2B, $D7, $38, $29, $D0, $D8, $D9 ; $06B4E2 |
  db $DA, $DB, $DC, $DD, $23, $D5, $03, $03 ; $06B4EA |
  db $03, $03, $03, $DC, $1B, $DB, $03, $03 ; $06B4F2 |
  db $03, $03, $03, $03, $03, $03, $0E, $0E ; $06B4FA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B502 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B50A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B512 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B51A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B522 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B52A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B532 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B53A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B542 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B54A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B552 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B55A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B562 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B56A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B572 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B57A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B582 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B58A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B592 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B59A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5A2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5AA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5B2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5BA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5C2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5CA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5D2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5DA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5E2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5EA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5F2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B5FA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B602 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B60A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B612 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B61A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B622 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B62A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B632 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B63A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B642 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B64A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B652 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B65A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B662 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B66A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B672 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B67A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B682 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B68A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B692 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B69A |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6A2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6AA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6B2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6BA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6C2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6CA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6D2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6DA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6E2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6EA |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E ; $06B6F2 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $1F, $2E ; $06B6FA |
  db $17, $2A, $00, $07, $00, $07, $00, $2C ; $06B702 |
  db $00, $28, $1F, $1E, $17, $16, $00, $07 ; $06B70A |
  db $A6, $07, $00, $2C, $00, $30, $08, $09 ; $06B712 |
  db $35, $31, $1F, $1E, $35, $31, $1F, $1E ; $06B71A |
  db $3D, $16, $A2, $A3, $AA, $00, $A3, $A4 ; $06B722 |
  db $00, $AC, $A5, $B6, $00, $BE, $B6, $B7 ; $06B72A |
  db $BF, $BE, $A8, $A9, $00, $00, $00, $00 ; $06B732 |
  db $00, $00, $28, $1E, $2C, $16, $1F, $3E ; $06B73A |
  db $35, $31, $21, $25, $35, $31, $21, $26 ; $06B742 |
  db $35, $32, $06, $00, $07, $00, $74, $74 ; $06B74A |
  db $6C, $6C, $74, $75, $6C, $6D, $00, $00 ; $06B752 |
  db $00, $A7, $00, $00, $A0, $A1, $07, $00 ; $06B75A |
  db $07, $00, $64, $64, $6C, $6C, $64, $65 ; $06B762 |
  db $6C, $6D, $21, $25, $17, $16, $3B, $1E ; $06B76A |
  db $17, $16, $1F, $1E, $17, $38, $0A, $0B ; $06B772 |
  db $35, $31, $73, $74, $6B, $6C, $75, $74 ; $06B77A |
  db $6D, $6C, $00, $A6, $A5, $A2, $00, $00 ; $06B782 |
  db $A3, $A3, $6B, $6C, $6B, $6C, $6C, $6C ; $06B78A |
  db $6C, $6C, $6D, $6C, $6D, $6C, $6C, $6D ; $06B792 |
  db $6C, $6D, $A5, $A2, $00, $AA, $A3, $A3 ; $06B79A |
  db $00, $00, $63, $64, $6B, $6C, $65, $64 ; $06B7A2 |
  db $6D, $6C, $00, $24, $00, $28, $21, $26 ; $06B7AA |
  db $17, $2A, $00, $06, $00, $07, $1F, $3E ; $06B7B2 |
  db $17, $16, $14, $15, $14, $15, $B0, $00 ; $06B7BA |
  db $B8, $00, $1A, $1B, $00, $00, $00, $B0 ; $06B7C2 |
  db $00, $B8, $B1, $00, $00, $00, $B8, $00 ; $06B7CA |
  db $B8, $00, $00, $00, $A6, $00, $00, $B1 ; $06B7D2 |
  db $00, $A7, $00, $B8, $00, $B8, $00, $B1 ; $06B7DA |
  db $00, $00, $00, $BC, $A0, $A1, $B7, $BA ; $06B7E2 |
  db $B8, $00, $B9, $B7, $00, $B8, $BD, $00 ; $06B7EA |
  db $00, $00, $B6, $B6, $BE, $BF, $20, $26 ; $06B7F2 |
  db $2C, $2A, $3B, $3E, $17, $16, $00, $B1 ; $06B7FA |
  db $A6, $00, $A2, $A3, $A2, $A3, $A3, $A4 ; $06B802 |
  db $A3, $A4, $B9, $B7, $00, $00, $BC, $B7 ; $06B80A |
  db $00, $B8, $20, $25, $2C, $16, $2A, $07 ; $06B812 |
  db $2A, $07, $2A, $07, $36, $07, $B1, $24 ; $06B81A |
  db $00, $28, $BA, $B9, $00, $00, $A5, $2C ; $06B822 |
  db $24, $3B, $BD, $00, $24, $21, $20, $25 ; $06B82A |
  db $3F, $16, $17, $2A, $1F, $2E, $07, $28 ; $06B832 |
  db $07, $34, $17, $16, $31, $35, $17, $16 ; $06B83A |
  db $39, $1E, $07, $74, $07, $6C, $2C, $16 ; $06B842 |
  db $28, $1E, $07, $64, $07, $6C, $24, $22 ; $06B84A |
  db $28, $2A, $24, $21, $28, $1E, $3F, $3A ; $06B852 |
  db $1F, $1E, $25, $22, $1F, $2A, $17, $3A ; $06B85A |
  db $1F, $1E, $25, $21, $1F, $1E, $3F, $16 ; $06B862 |
  db $1F, $1E, $17, $16, $1F, $1E, $26, $06 ; $06B86A |
  db $2A, $07, $2E, $07, $2A, $07, $1F, $1E ; $06B872 |
  db $41, $16, $1F, $1E, $17, $40, $49, $1E ; $06B87A |
  db $41, $16, $1F, $48, $17, $40, $66, $6E ; $06B882 |
  db $00, $00, $49, $1E, $17, $16, $1F, $48 ; $06B88A |
  db $17, $16, $00, $00, $A7, $00, $0C, $0B ; $06B892 |
  db $35, $31, $1F, $2E, $35, $32, $A4, $B9 ; $06B89A |
  db $AC, $00, $06, $24, $07, $28, $07, $2C ; $06B8A2 |
  db $07, $28, $1F, $1E, $39, $16, $28, $1E ; $06B8AA |
  db $34, $31, $00, $00, $00, $A6, $00, $00 ; $06B8B2 |
  db $B0, $00, $B7, $00, $B8, $00, $BC, $B7 ; $06B8BA |
  db $BC, $B7, $BA, $A2, $BA, $A2, $A3, $A3 ; $06B8C2 |
  db $A3, $A3, $A4, $B9, $A4, $B9, $B7, $BD ; $06B8CA |
  db $B7, $BD, $B8, $00, $B1, $A6, $00, $B8 ; $06B8D2 |
  db $00, $B1, $00, $AA, $00, $00, $AC, $00 ; $06B8DA |
  db $00, $00, $B8, $00, $B1, $00, $00, $A2 ; $06B8E2 |
  db $00, $AA, $2A, $07, $2E, $07, $AA, $00 ; $06B8EA |
  db $00, $00, $00, $AC, $A0, $A1, $A4, $A5 ; $06B8F2 |
  db $AC, $00, $07, $28, $07, $2C, $17, $16 ; $06B8FA |
  db $1F, $3C, $17, $3A, $31, $35, $25, $21 ; $06B902 |
  db $31, $35, $25, $22, $31, $36, $6C, $75 ; $06B90A |
  db $6C, $6D, $00, $A7, $A3, $A4, $B1, $B8 ; $06B912 |
  db $00, $B1, $B1, $B1, $00, $00, $0D, $0B ; $06B91A |
  db $35, $31, $00, $00, $00, $B0, $BB, $B7 ; $06B922 |
  db $00, $00, $BD, $B8, $00, $B1, $B6, $B7 ; $06B92A |
  db $BF, $BF, $1F, $3C, $17, $2A, $31, $36 ; $06B932 |
  db $00, $00, $6C, $6C, $67, $67, $08, $0E ; $06B93A |
  db $35, $31, $1F, $48, $35, $31, $6C, $6C ; $06B942 |
  db $64, $64, $6B, $6C, $63, $64, $49, $1E ; $06B94A |
  db $35, $31, $75, $00, $6D, $00, $1C, $1D ; $06B952 |
  db $00, $00, $00, $73, $00, $6B, $6D, $00 ; $06B95A |
  db $65, $00, $00, $6B, $00, $63, $6D, $00 ; $06B962 |
  db $6D, $00, $00, $6B, $00, $6B, $12, $13 ; $06B96A |
  db $10, $11, $12, $12, $10, $11, $49, $1E ; $06B972 |
  db $3D, $16, $22, $06, $2E, $07, $2E, $07 ; $06B97A |
  db $2E, $07, $3B, $1E, $35, $31, $2A, $00 ; $06B982 |
  db $36, $00, $28, $1E, $28, $16, $6C, $6D ; $06B98A |
  db $64, $65, $30, $35, $00, $00, $1F, $3A ; $06B992 |
  db $17, $16, $31, $35, $6E, $66, $74, $74 ; $06B99A |
  db $64, $64, $6D, $A7, $65, $A4, $00, $B8 ; $06B9A2 |
  db $B9, $B7, $00, $A6, $BA, $A2, $6D, $A4 ; $06B9AA |
  db $6D, $AC, $BA, $A2, $00, $AA, $00, $73 ; $06B9B2 |
  db $00, $63, $3B, $2E, $17, $2A, $A7, $00 ; $06B9BA |
  db $A4, $B9, $B8, $00, $B7, $BA, $00, $B8 ; $06B9C2 |
  db $BD, $B1, $00, $B8, $BC, $B7, $B7, $BD ; $06B9CA |
  db $B8, $00, $B1, $00, $00, $90, $00, $98 ; $06B9D2 |
  db $00, $98, $90, $B8, $98, $B1, $90, $90 ; $06B9DA |
  db $98, $98, $98, $00, $98, $00, $98, $98 ; $06B9E2 |
  db $98, $98, $39, $1E, $2C, $16, $B8, $00 ; $06B9EA |
  db $B7, $BD, $00, $63, $00, $6B, $74, $74 ; $06B9F2 |
  db $6C, $6D, $74, $0F, $6C, $0F, $6C, $0F ; $06B9FA |
  db $6C, $0F, $1F, $3C, $35, $32, $31, $35 ; $06BA02 |
  db $74, $74, $31, $35, $74, $0F, $02, $74 ; $06BA0A |
  db $03, $6C, $64, $0F, $6C, $0F, $03, $6C ; $06BA12 |
  db $03, $6C, $6C, $6C, $24, $21, $6C, $0F ; $06BA1A |
  db $25, $21, $1F, $1E, $3C, $31, $1F, $1E ; $06BA22 |
  db $35, $39, $2A, $74, $2E, $6C, $74, $2C ; $06BA2A |
  db $6C, $28, $2A, $64, $2E, $6C, $B9, $B7 ; $06BA32 |
  db $B9, $B7, $BB, $B7, $BB, $B7, $64, $2C ; $06BA3A |
  db $6C, $28, $32, $6C, $02, $6C, $A2, $A3 ; $06BA42 |
  db $00, $00, $A3, $A4, $00, $00, $BB, $B7 ; $06BA4A |
  db $00, $B8, $6C, $2C, $6C, $28, $01, $64 ; $06BA52 |
  db $03, $6C, $22, $B1, $2E, $00, $03, $6C ; $06BA5A |
  db $25, $21, $6C, $6D, $25, $21, $00, $24 ; $06BA62 |
  db $25, $3B, $21, $3F, $17, $16, $3A, $25 ; $06BA6A |
  db $17, $16, $22, $00, $2E, $00, $00, $91 ; $06BA72 |
  db $00, $00, $00, $00, $91, $00, $C0, $85 ; $06BA7A |
  db $85, $80, $86, $87, $81, $88, $8D, $8E ; $06BA82 |
  db $82, $80, $8F, $C7, $81, $84, $85, $86 ; $06BA8A |
  db $80, $81, $82, $88, $88, $82, $89, $82 ; $06BA92 |
  db $80, $81, $80, $81, $88, $89, $82, $89 ; $06BA9A |
  db $82, $80, $12, $13, $12, $12, $12, $13 ; $06BAA2 |
  db $13, $12, $12, $12, $13, $12, $90, $00 ; $06BAAA |
  db $98, $00, $00, $90, $00, $98, $00, $00 ; $06BAB2 |
  db $00, $90, $00, $00, $00, $00, $00, $00 ; $06BABA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BAC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BACA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BAD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BADA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BAE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BAEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BAF2 |
  db $00, $00, $00, $00, $00, $00, $00, $23 ; $06BAFA |
  db $00, $33, $04, $0E, $0E, $0E, $27, $2A ; $06BB02 |
  db $27, $29, $27, $27, $2D, $1E, $06, $08 ; $06BB0A |
  db $84, $86, $0A, $0C, $40, $42, $30, $20 ; $06BB12 |
  db $1A, $1C, $0A, $0C, $60, $62, $44, $4D ; $06BB1A |
  db $46, $44, $44, $4D, $46, $44, $48, $00 ; $06BB22 |
  db $4A, $48, $48, $00, $4A, $48, $64, $4E ; $06BB2A |
  db $66, $00, $64, $4E, $66, $00, $68, $4E ; $06BB32 |
  db $4A, $7A, $68, $4E, $4A, $7A, $80, $82 ; $06BB3A |
  db $88, $8A, $11, $13, $8C, $8E, $A0, $A2 ; $06BB42 |
  db $A8, $AA, $10, $10, $AC, $AE, $C1, $82 ; $06BB4A |
  db $06, $16, $08, $09, $00, $00, $35, $00 ; $06BB52 |
  db $06, $06, $C5, $00, $9D, $00, $44, $4D ; $06BB5A |
  db $46, $22, $23, $23, $6C, $33, $48, $00 ; $06BB62 |
  db $4A, $32, $33, $33, $6C, $08, $64, $4E ; $06BB6A |
  db $66, $00, $00, $00, $33, $9D, $68, $4E ; $06BB72 |
  db $4A, $7A, $8C, $00, $8C, $00, $CC, $CE ; $06BB7A |
  db $CA, $00, $00, $00, $00, $00, $EC, $EE ; $06BB82 |
  db $00, $00, $EB, $00, $00, $00, $11, $11 ; $06BB8A |
  db $01, $01, $01, $01, $01, $01, $C5, $01 ; $06BB92 |
  db $01, $01, $01, $01, $01, $01, $00, $00 ; $06BB9A |
  db $AC, $C8, $C7, $C3, $00, $00, $F1, $E3 ; $06BBA2 |
  db $00, $01, $F7, $01, $01, $01, $E5, $4C ; $06BBAA |
  db $01, $01, $01, $01, $20, $8E, $E0, $C3 ; $06BBB2 |
  db $AD, $AD, $00, $AD, $AE, $B4, $00, $00 ; $06BBBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBCA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBDA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BBF2 |
  db $00, $00, $00, $00, $00, $00, $00, $23 ; $06BBFA |
  db $00, $33, $05, $0F, $0F, $0F, $28, $2F ; $06BC02 |
  db $2A, $2F, $2B, $2C, $2E, $1F, $07, $09 ; $06BC0A |
  db $85, $87, $0B, $0D, $41, $43, $21, $31 ; $06BC12 |
  db $1B, $1D, $0B, $0D, $61, $63, $45, $4D ; $06BC1A |
  db $47, $47, $45, $4D, $47, $47, $49, $00 ; $06BC22 |
  db $4B, $4B, $49, $00, $4B, $4B, $65, $4F ; $06BC2A |
  db $67, $00, $65, $4F, $67, $00, $4F, $6B ; $06BC32 |
  db $79, $49, $4F, $6B, $79, $49, $81, $83 ; $06BC3A |
  db $89, $8B, $11, $10, $8D, $8F, $A1, $A3 ; $06BC42 |
  db $A9, $AB, $10, $14, $AD, $AF, $81, $C0 ; $06BC4A |
  db $07, $17, $08, $09, $00, $00, $00, $36 ; $06BC52 |
  db $06, $06, $C6, $00, $9D, $00, $45, $4D ; $06BC5A |
  db $47, $23, $23, $24, $6D, $33, $49, $00 ; $06BC62 |
  db $4B, $33, $33, $34, $6D, $08, $65, $4F ; $06BC6A |
  db $67, $00, $00, $00, $9D, $33, $4F, $6B ; $06BC72 |
  db $79, $49, $00, $8D, $00, $8D, $CD, $CF ; $06BC7A |
  db $CB, $00, $00, $00, $00, $00, $ED, $EF ; $06BC82 |
  db $00, $EA, $00, $00, $00, $00, $12, $12 ; $06BC8A |
  db $01, $01, $01, $01, $01, $01, $C6, $01 ; $06BC92 |
  db $01, $01, $01, $01, $01, $01, $00, $00 ; $06BC9A |
  db $C7, $C9, $AD, $C3, $00, $00, $E2, $E4 ; $06BCA2 |
  db $F7, $01, $00, $01, $01, $01, $E6, $5F ; $06BCAA |
  db $01, $01, $01, $01, $21, $8F, $C2, $AC ; $06BCB2 |
  db $C3, $AC, $AC, $00, $AF, $B5, $00, $00 ; $06BCBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCCA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCDA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BCF2 |
  db $00, $00, $00, $00, $00, $00, $00, $33 ; $06BCFA |
  db $33, $33, $0E, $25, $0E, $0E, $37, $3A ; $06BD02 |
  db $37, $39, $37, $37, $3D, $1E, $16, $18 ; $06BD0A |
  db $94, $96, $0A, $0C, $50, $52, $30, $20 ; $06BD12 |
  db $00, $00, $1A, $1C, $70, $72, $54, $5C ; $06BD1A |
  db $56, $54, $54, $5C, $56, $54, $48, $00 ; $06BD22 |
  db $5A, $48, $48, $00, $5A, $48, $74, $5E ; $06BD2A |
  db $76, $00, $74, $5E, $76, $00, $5A, $6A ; $06BD32 |
  db $78, $5C, $5A, $6A, $78, $5C, $90, $92 ; $06BD3A |
  db $98, $9A, $10, $13, $9C, $9E, $B0, $B2 ; $06BD42 |
  db $B8, $BA, $12, $10, $BC, $BE, $D1, $92 ; $06BD4A |
  db $06, $16, $18, $19, $00, $00, $35, $00 ; $06BD52 |
  db $06, $06, $D5, $00, $00, $9C, $01, $01 ; $06BD5A |
  db $01, $32, $33, $33, $7C, $15, $01, $00 ; $06BD62 |
  db $01, $32, $33, $33, $7C, $18, $01, $01 ; $06BD6A |
  db $01, $32, $33, $33, $8C, $00, $01, $01 ; $06BD72 |
  db $01, $01, $8C, $00, $33, $9C, $DC, $DE ; $06BD7A |
  db $DA, $00, $FB, $00, $E8, $F8, $FC, $FE ; $06BD82 |
  db $00, $00, $FB, $EA, $E9, $F9, $D5, $13 ; $06BD8A |
  db $01, $01, $01, $01, $01, $01, $D5, $01 ; $06BD92 |
  db $01, $01, $01, $01, $01, $01, $E1, $D3 ; $06BD9A |
  db $BC, $D8, $D7, $C3, $00, $E7, $F0, $F3 ; $06BDA2 |
  db $00, $01, $00, $01, $01, $01, $58, $F5 ; $06BDAA |
  db $01, $01, $01, $01, $30, $9E, $E0, $C3 ; $06BDB2 |
  db $BD, $BD, $00, $BD, $BE, $B6, $00, $00 ; $06BDBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDCA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDDA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BDF2 |
  db $00, $00, $00, $00, $00, $00, $00, $33 ; $06BDFA |
  db $33, $33, $0F, $26, $0F, $0F, $38, $3F ; $06BE02 |
  db $3A, $3F, $3B, $3C, $3E, $1F, $17, $19 ; $06BE0A |
  db $95, $97, $0B, $0D, $51, $53, $21, $31 ; $06BE12 |
  db $00, $00, $1B, $1D, $71, $73, $55, $5D ; $06BE1A |
  db $57, $57, $55, $5D, $57, $57, $59, $00 ; $06BE22 |
  db $4B, $4B, $59, $00, $4B, $4B, $75, $5E ; $06BE2A |
  db $77, $00, $75, $5E, $77, $00, $69, $59 ; $06BE32 |
  db $5D, $7B, $69, $59, $5D, $7B, $91, $93 ; $06BE3A |
  db $99, $9B, $10, $10, $9D, $9F, $B1, $B3 ; $06BE42 |
  db $B9, $BB, $12, $14, $BD, $BF, $91, $D0 ; $06BE4A |
  db $07, $17, $18, $19, $00, $00, $00, $36 ; $06BE52 |
  db $06, $7F, $D6, $00, $00, $9C, $55, $5D ; $06BE5A |
  db $57, $33, $33, $34, $7D, $15, $59, $00 ; $06BE62 |
  db $4B, $33, $33, $34, $7D, $18, $75, $5E ; $06BE6A |
  db $77, $33, $33, $34, $00, $8D, $69, $59 ; $06BE72 |
  db $5D, $7B, $00, $8D, $9C, $33, $DD, $DF ; $06BE7A |
  db $DB, $FA, $00, $EA, $E9, $F9, $FD, $FF ; $06BE82 |
  db $00, $FA, $00, $E8, $F8, $00, $D6, $14 ; $06BE8A |
  db $01, $01, $01, $01, $01, $01, $D6, $01 ; $06BE92 |
  db $01, $01, $01, $01, $01, $01, $D2, $D4 ; $06BE9A |
  db $D7, $D9, $BD, $C3, $E7, $00, $F2, $F4 ; $06BEA2 |
  db $00, $01, $00, $01, $01, $01, $5B, $F6 ; $06BEAA |
  db $01, $01, $01, $01, $31, $9F, $C2, $BC ; $06BEB2 |
  db $C3, $BC, $BC, $00, $BF, $B7, $00, $00 ; $06BEBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BEC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BECA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BED2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BEDA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BEE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BEEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BEF2 |
  db $00, $00, $00, $00, $00, $00, $00, $10 ; $06BEFA |
  db $10, $10, $40, $20, $40, $20, $11, $12 ; $06BF02 |
  db $11, $12, $11, $11, $12, $10, $03, $03 ; $06BF0A |
  db $13, $13, $10, $10, $10, $10, $03, $03 ; $06BF12 |
  db $10, $10, $10, $10, $10, $10, $11, $11 ; $06BF1A |
  db $11, $11, $12, $12, $12, $12, $11, $11 ; $06BF22 |
  db $11, $11, $12, $12, $12, $12, $11, $11 ; $06BF2A |
  db $11, $00, $12, $12, $12, $00, $11, $11 ; $06BF32 |
  db $11, $11, $12, $12, $12, $12, $11, $12 ; $06BF3A |
  db $50, $50, $10, $10, $00, $00, $10, $10 ; $06BF42 |
  db $51, $51, $10, $10, $00, $00, $11, $12 ; $06BF4A |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BF52 |
  db $00, $00, $02, $00, $00, $00, $13, $13 ; $06BF5A |
  db $13, $00, $00, $00, $51, $00, $13, $13 ; $06BF62 |
  db $13, $00, $00, $00, $52, $00, $13, $13 ; $06BF6A |
  db $13, $00, $00, $00, $00, $00, $13, $13 ; $06BF72 |
  db $13, $13, $00, $00, $00, $00, $63, $63 ; $06BF7A |
  db $63, $63, $63, $63, $63, $63, $63, $63 ; $06BF82 |
  db $00, $63, $63, $63, $63, $63, $10, $10 ; $06BF8A |
  db $00, $00, $00, $00, $00, $00, $10, $00 ; $06BF92 |
  db $00, $00, $00, $00, $00, $00, $03, $03 ; $06BF9A |
  db $03, $03, $03, $03, $03, $03, $03, $03 ; $06BFA2 |
  db $03, $00, $03, $00, $00, $00, $03, $03 ; $06BFAA |
  db $00, $00, $00, $00, $03, $03, $03, $03 ; $06BFB2 |
  db $03, $03, $03, $03, $03, $03, $00, $00 ; $06BFBA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFC2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFCA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFD2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFDA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFE2 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFEA |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $06BFF2 |
  db $00, $00, $00, $00, $00, $00           ; $06BFFA |

