bank $07
org $A000

main_hard_man_j:
  JMP code_07A019                           ; $07A000 |

  JMP code_07A277                           ; $07A003 |

main_spark_man_j:
  JMP code_07A319                           ; $07A006 |

  NOP                                       ; $07A009 |
  NOP                                       ; $07A00A |
  NOP                                       ; $07A00B |

main_snake_man_j:
  JMP code_07A51B                           ; $07A00C |

  NOP                                       ; $07A00F |
  NOP                                       ; $07A010 |
  NOP                                       ; $07A011 |

main_gemini_man_j:
  JMP main_gemini_man                       ; $07A012 |

  JMP code_07A972                           ; $07A015 |

  RTS                                       ; $07A018 |

code_07A019:
  LDA $0300,x                               ; $07A019 |
  AND #$0F                                  ; $07A01C |
  TAY                                       ; $07A01E |
  LDA $A02C,y                               ; $07A01F |
  STA $00                                   ; $07A022 |
  LDA $A031,y                               ; $07A024 |
  STA $01                                   ; $07A027 |
  JMP ($0000)                               ; $07A029 |

  db $36, $52, $B2, $66, $CF, $A0, $A0, $A0 ; $07A02C |
  db $A1, $A1                               ; $07A034 |

  LDA #$00                                  ; $07A036 |
  STA $0500,x                               ; $07A038 |
  STA $0520,x                               ; $07A03B |
  STA $0540,x                               ; $07A03E |
  LDA #$3D                                  ; $07A041 |
  STA $0560,x                               ; $07A043 |
  LDA $0300,x                               ; $07A046 |
  ORA #$40                                  ; $07A049 |
  STA $0300,x                               ; $07A04B |
  INC $0300,x                               ; $07A04E |
  RTS                                       ; $07A051 |

  LDA $04A0,x                               ; $07A052 |
  PHA                                       ; $07A055 |
  JSR face_player                           ; $07A056 |
  PLA                                       ; $07A059 |
  CMP $04A0,x                               ; $07A05A |
  BEQ code_07A067                           ; $07A05D |
  LDA $0580,x                               ; $07A05F |
  EOR #$40                                  ; $07A062 |
  STA $0580,x                               ; $07A064 |
code_07A067:
  LDA $0500,x                               ; $07A067 |
  BNE code_07A079                           ; $07A06A |
  LDA $05A0,x                               ; $07A06C |
  CMP #$05                                  ; $07A06F |
  BNE code_07A08B                           ; $07A071 |
  JSR code_07A22E                           ; $07A073 |
  INC $0500,x                               ; $07A076 |
code_07A079:
  LDA $0520,x                               ; $07A079 |
  BNE code_07A08B                           ; $07A07C |
  LDA $05A0,x                               ; $07A07E |
  CMP #$08                                  ; $07A081 |
  BNE code_07A08B                           ; $07A083 |
  JSR code_07A22E                           ; $07A085 |
  INC $0520,x                               ; $07A088 |
code_07A08B:
  LDA $05A0,x                               ; $07A08B |
  CMP #$0B                                  ; $07A08E |
  BNE code_07A0B1                           ; $07A090 |
  LDA #$2F                                  ; $07A092 |
  JSR reset_sprite_anim                     ; $07A094 |
  LDA #$00                                  ; $07A097 |
  STA $0500,x                               ; $07A099 |
  JSR code_07A1FF                           ; $07A09C |
  LDA #$68                                  ; $07A09F |
  STA $0440,x                               ; $07A0A1 |
  LDA #$08                                  ; $07A0A4 |
  STA $0460,x                               ; $07A0A6 |
  INC $0300,x                               ; $07A0A9 |
  LDA #$1E                                  ; $07A0AC |
  STA $0520,x                               ; $07A0AE |
code_07A0B1:
  RTS                                       ; $07A0B1 |

  LDA $0520,x                               ; $07A0B2 |
  BEQ code_07A0C5                           ; $07A0B5 |
  DEC $0520,x                               ; $07A0B7 |
  LDA #$00                                  ; $07A0BA |
  STA $05E0,x                               ; $07A0BC |
  LDA #$01                                  ; $07A0BF |
  STA $05A0,x                               ; $07A0C1 |
  RTS                                       ; $07A0C4 |

code_07A0C5:
  LDA $0500,x                               ; $07A0C5 |
  BNE code_07A128                           ; $07A0C8 |
  LDA $04A0,x                               ; $07A0CA |
  AND #$01                                  ; $07A0CD |
  BEQ code_07A0D9                           ; $07A0CF |
  LDY #$22                                  ; $07A0D1 |
  JSR code_1FF580                           ; $07A0D3 |
  JMP code_07A0DE                           ; $07A0D6 |

code_07A0D9:
  LDY #$23                                  ; $07A0D9 |
  JSR code_1FF5C4                           ; $07A0DB |
code_07A0DE:
  LDY #$26                                  ; $07A0DE |
  JSR code_1FF67C                           ; $07A0E0 |
  BCC code_07A106                           ; $07A0E3 |
  LDA #$30                                  ; $07A0E5 |
  JSR reset_sprite_anim                     ; $07A0E7 |
  LDA #$04                                  ; $07A0EA |
  STA $05A0,x                               ; $07A0EC |
  LDA #$00                                  ; $07A0EF |
  STA $05E0,x                               ; $07A0F1 |
  INC $0300,x                               ; $07A0F4 |
  LDA $30                                   ; $07A0F7 |
  CMP #$0E                                  ; $07A0F9 |
  BEQ code_07A165                           ; $07A0FB |
  CMP #$0F                                  ; $07A0FD |
  BEQ code_07A165                           ; $07A0FF |
  LDA #$0F                                  ; $07A101 |
  STA $30                                   ; $07A103 |
  RTS                                       ; $07A105 |

code_07A106:
  LDA #$00                                  ; $07A106 |
  STA $05E0,x                               ; $07A108 |
  STA $05A0,x                               ; $07A10B |
  JSR code_1FF8C2                           ; $07A10E |
  CMP #$08                                  ; $07A111 |
  BCS code_07A127                           ; $07A113 |
  LDA #$30                                  ; $07A115 |
  JSR reset_sprite_anim                     ; $07A117 |
  INC $0500,x                               ; $07A11A |
  LDA #$00                                  ; $07A11D |
  STA $0440,x                               ; $07A11F |
  LDA #$05                                  ; $07A122 |
  STA $0460,x                               ; $07A124 |
code_07A127:
  RTS                                       ; $07A127 |

code_07A128:
  LDA $05A0,x                               ; $07A128 |
  CMP #$03                                  ; $07A12B |
  BNE code_07A127                           ; $07A12D |
  LDA #$03                                  ; $07A12F |
  STA $05A0,x                               ; $07A131 |
  LDA #$00                                  ; $07A134 |
  STA $05E0,x                               ; $07A136 |
  LDA #$30                                  ; $07A139 |
  JSR submit_sound_ID                       ; $07A13B |
  LDY #$26                                  ; $07A13E |
  JSR code_1FF606                           ; $07A140 |
  BCC code_07A127                           ; $07A143 |
  LDA #$30                                  ; $07A145 |
  JSR reset_sprite_anim                     ; $07A147 |
  LDA #$04                                  ; $07A14A |
  STA $05A0,x                               ; $07A14C |
  LDA #$00                                  ; $07A14F |
  STA $05E0,x                               ; $07A151 |
  INC $0300,x                               ; $07A154 |
  LDA $30                                   ; $07A157 |
  CMP #$0E                                  ; $07A159 |
  BEQ code_07A165                           ; $07A15B |
  CMP #$0F                                  ; $07A15D |
  BEQ code_07A165                           ; $07A15F |
  LDA #$0F                                  ; $07A161 |
  STA $30                                   ; $07A163 |
code_07A165:
  RTS                                       ; $07A165 |

  LDA $0560,x                               ; $07A166 |
  BEQ code_07A1A0                           ; $07A169 |
  DEC $0560,x                               ; $07A16B |
  BEQ code_07A1A0                           ; $07A16E |
  LDA #$CA                                  ; $07A170 |
  STA $0480,x                               ; $07A172 |
  LDA #$04                                  ; $07A175 |
  STA $05A0,x                               ; $07A177 |
  LDA #$00                                  ; $07A17A |
  STA $05E0,x                               ; $07A17C |
  LDA #$9E                                  ; $07A17F |
  STA $0440,x                               ; $07A181 |
  LDA #$04                                  ; $07A184 |
  STA $0460,x                               ; $07A186 |
  LDA $0560,x                               ; $07A189 |
  AND #$01                                  ; $07A18C |
  BNE code_07A198                           ; $07A18E |
  LDA $FA                                   ; $07A190 |
  CLC                                       ; $07A192 |
  ADC #$02                                  ; $07A193 |
  STA $FA                                   ; $07A195 |
  RTS                                       ; $07A197 |

code_07A198:
  LDA $FA                                   ; $07A198 |
  SEC                                       ; $07A19A |
  SBC #$02                                  ; $07A19B |
  STA $FA                                   ; $07A19D |
  RTS                                       ; $07A19F |

code_07A1A0:
  LDY #$26                                  ; $07A1A0 |
  JSR code_1FF67C                           ; $07A1A2 |
  BCC code_07A1BA                           ; $07A1A5 |
  LDA $30                                   ; $07A1A7 |
  CMP #$0E                                  ; $07A1A9 |
  BEQ code_07A1B1                           ; $07A1AB |
  LDA #$01                                  ; $07A1AD |
  STA $30                                   ; $07A1AF |
code_07A1B1:
  INC $0300,x                               ; $07A1B1 |
  LDA #$10                                  ; $07A1B4 |
  STA $0540,x                               ; $07A1B6 |
  RTS                                       ; $07A1B9 |

code_07A1BA:
  LDA #$D0                                  ; $07A1BA |
  STA $0480,x                               ; $07A1BC |
  LDA $05A0,x                               ; $07A1BF |
  CMP #$04                                  ; $07A1C2 |
  BNE code_07A1CE                           ; $07A1C4 |
  LDA #$00                                  ; $07A1C6 |
  STA $05E0,x                               ; $07A1C8 |
  INC $05A0,x                               ; $07A1CB |
code_07A1CE:
  RTS                                       ; $07A1CE |

  DEC $0540,x                               ; $07A1CF |
  BNE code_07A1EF                           ; $07A1D2 |
  LDA #$C1                                  ; $07A1D4 |
  STA $0300,x                               ; $07A1D6 |
  LDA #$00                                  ; $07A1D9 |
  STA $0500,x                               ; $07A1DB |
  STA $0520,x                               ; $07A1DE |
  STA $0540,x                               ; $07A1E1 |
  LDA #$3D                                  ; $07A1E4 |
  STA $0560,x                               ; $07A1E6 |
  LDA #$2C                                  ; $07A1E9 |
  JSR reset_sprite_anim                     ; $07A1EB |
  RTS                                       ; $07A1EE |

code_07A1EF:
  LDA #$2F                                  ; $07A1EF |
  JSR reset_sprite_anim                     ; $07A1F1 |
  LDA #$00                                  ; $07A1F4 |
  STA $05E0,x                               ; $07A1F6 |
  LDA #$01                                  ; $07A1F9 |
  STA $05A0,x                               ; $07A1FB |
  RTS                                       ; $07A1FE |

code_07A1FF:
  JSR code_1FF8C2                           ; $07A1FF |
  LDY #$06                                  ; $07A202 |
code_07A204:
  CMP $A219,y                               ; $07A204 |
  BCC code_07A20C                           ; $07A207 |
  DEY                                       ; $07A209 |
  BNE code_07A204                           ; $07A20A |
code_07A20C:
  LDA $A220,y                               ; $07A20C |
  STA $0400,x                               ; $07A20F |
  LDA $A227,y                               ; $07A212 |
  STA $0420,x                               ; $07A215 |
  RTS                                       ; $07A218 |

  db $79, $6A, $5B, $4C, $3D, $2E, $1F, $80 ; $07A219 |
  db $00, $80, $00, $80, $00, $80, $03, $03 ; $07A221 |
  db $02, $02, $01, $01, $00                ; $07A229 |

code_07A22E:
  JSR find_enemy_freeslot_y                 ; $07A22E |
  BCS code_07A272                           ; $07A231 |
  STY $00                                   ; $07A233 |
  LDA $04A0,x                               ; $07A235 |
  STA $04A0,y                               ; $07A238 |
  AND #$02                                  ; $07A23B |
  TAY                                       ; $07A23D |
  LDA $0360,x                               ; $07A23E |
  CLC                                       ; $07A241 |
  ADC $A273,y                               ; $07A242 |
  PHA                                       ; $07A245 |
  LDA $0380,x                               ; $07A246 |
  ADC $A274,y                               ; $07A249 |
  LDY $00                                   ; $07A24C |
  STA $0380,y                               ; $07A24E |
  PLA                                       ; $07A251 |
  STA $0360,y                               ; $07A252 |
  LDA $03C0,x                               ; $07A255 |
  CLC                                       ; $07A258 |
  ADC #$06                                  ; $07A259 |
  STA $03C0,y                               ; $07A25B |
  LDA #$00                                  ; $07A25E |
  STA $04E0,y                               ; $07A260 |
  LDA #$2D                                  ; $07A263 |
  JSR code_1FF846                           ; $07A265 |
  LDA #$8B                                  ; $07A268 |
  STA $0480,y                               ; $07A26A |
  LDA #$D1                                  ; $07A26D |
  STA $0320,y                               ; $07A26F |
code_07A272:
  RTS                                       ; $07A272 |

  db $04, $00, $FC, $FF                     ; $07A273 |

code_07A277:
  LDA $0300,x                               ; $07A277 |
  AND #$0F                                  ; $07A27A |
  BNE code_07A28F                           ; $07A27C |
  STA $0500,x                               ; $07A27E |
  STA $0520,x                               ; $07A281 |
  LDA #$0C                                  ; $07A284 |
  STA $0540,x                               ; $07A286 |
  JSR code_07A308                           ; $07A289 |
  INC $0300,x                               ; $07A28C |
code_07A28F:
  LDA $0300,x                               ; $07A28F |
  AND #$02                                  ; $07A292 |
  BNE code_07A2EE                           ; $07A294 |
  LDA $04A0,x                               ; $07A296 |
  AND #$08                                  ; $07A299 |
  BEQ code_07A2A8                           ; $07A29B |
  JSR code_1FF779                           ; $07A29D |
  LDA $03E0,x                               ; $07A2A0 |
  BNE code_07A302                           ; $07A2A3 |
  JMP code_07A2B0                           ; $07A2A5 |

code_07A2A8:
  JSR code_1FF759                           ; $07A2A8 |
  LDA $03E0,x                               ; $07A2AB |
  BNE code_07A302                           ; $07A2AE |
code_07A2B0:
  JSR code_1FF883                           ; $07A2B0 |
  LDA $04A0,x                               ; $07A2B3 |
  AND #$01                                  ; $07A2B6 |
  BEQ code_07A2C0                           ; $07A2B8 |
  JSR code_1FF71D                           ; $07A2BA |
  JMP code_07A2C3                           ; $07A2BD |

code_07A2C0:
  JSR code_1FF73B                           ; $07A2C0 |
code_07A2C3:
  LDA $0500,x                               ; $07A2C3 |
  BNE code_07A2D3                           ; $07A2C6 |
  JSR code_1FF8C2                           ; $07A2C8 |
  CMP #$0C                                  ; $07A2CB |
  BCS code_07A2D2                           ; $07A2CD |
  INC $0500,x                               ; $07A2CF |
code_07A2D2:
  RTS                                       ; $07A2D2 |

code_07A2D3:
  LDA $0520,x                               ; $07A2D3 |
  BNE code_07A2D2                           ; $07A2D6 |
  DEC $0540,x                               ; $07A2D8 |
  BNE code_07A2D2                           ; $07A2DB |
  LDA #$0C                                  ; $07A2DD |
  STA $0540,x                               ; $07A2DF |
  INC $0520,x                               ; $07A2E2 |
  LDA #$2E                                  ; $07A2E5 |
  JSR reset_sprite_anim                     ; $07A2E7 |
  INC $0300,x                               ; $07A2EA |
  RTS                                       ; $07A2ED |

code_07A2EE:
  LDA $05E0,x                               ; $07A2EE |
  ORA $05A0,x                               ; $07A2F1 |
  BNE code_07A301                           ; $07A2F4 |
  LDA #$2D                                  ; $07A2F6 |
  JSR reset_sprite_anim                     ; $07A2F8 |
  JSR code_07A308                           ; $07A2FB |
  DEC $0300,x                               ; $07A2FE |
code_07A301:
  RTS                                       ; $07A301 |

code_07A302:
  LDA #$00                                  ; $07A302 |
  STA $0300,x                               ; $07A304 |
  RTS                                       ; $07A307 |

code_07A308:
  LDA #$4C                                  ; $07A308 |
  STA $02                                   ; $07A30A |
  LDA #$03                                  ; $07A30C |
  STA $03                                   ; $07A30E |
  JSR code_1FFC63                           ; $07A310 |
  LDA $0C                                   ; $07A313 |
  STA $04A0,x                               ; $07A315 |
  RTS                                       ; $07A318 |

code_07A319:
  LDA $0300,x                               ; $07A319 |
  AND #$0F                                  ; $07A31C |
  BEQ code_07A323                           ; $07A31E |
  JMP code_07A3E7                           ; $07A320 |

code_07A323:
  LDA $0500,x                               ; $07A323 |
  BEQ code_07A339                           ; $07A326 |
  DEC $0500,x                               ; $07A328 |
  BNE code_07A330                           ; $07A32B |
  DEC $05A0,x                               ; $07A32D |
code_07A330:
  JSR code_07A35D                           ; $07A330 |
code_07A333:
  LDA #$00                                  ; $07A333 |
  STA $05E0,x                               ; $07A335 |
  RTS                                       ; $07A338 |

code_07A339:
  LDA $05A0,x                               ; $07A339 |
  BEQ code_07A36C                           ; $07A33C |
  LDA $05E0,x                               ; $07A33E |
  CMP #$08                                  ; $07A341 |
  BNE code_07A301                           ; $07A343 |
  DEC $0540,x                               ; $07A345 |
  BEQ code_07A355                           ; $07A348 |
code_07A34A:
  LDA #$88                                  ; $07A34A |
  STA $0440,x                               ; $07A34C |
  LDA #$06                                  ; $07A34F |
  STA $0460,x                               ; $07A351 |
  RTS                                       ; $07A354 |

code_07A355:
  LDA #$38                                  ; $07A355 |
  JSR reset_sprite_anim                     ; $07A357 |
  INC $0300,x                               ; $07A35A |
code_07A35D:
  LDA $04A0,x                               ; $07A35D |
  PHA                                       ; $07A360 |
  JSR face_player                           ; $07A361 |
  JSR code_1FF883                           ; $07A364 |
  PLA                                       ; $07A367 |
  STA $04A0,x                               ; $07A368 |
  RTS                                       ; $07A36B |

code_07A36C:
  LDA $0540,x                               ; $07A36C |
  BNE code_07A38A                           ; $07A36F |
  LDA #$37                                  ; $07A371 |
  JSR reset_sprite_anim                     ; $07A373 |
  JSR code_1FF883                           ; $07A376 |
  JSR code_07A34A                           ; $07A379 |
  LDA $E4                                   ; $07A37C |
  ADC $E6                                   ; $07A37E |
  STA $E7                                   ; $07A380 |
  AND #$03                                  ; $07A382 |
  CLC                                       ; $07A384 |
  ADC #$01                                  ; $07A385 |
  STA $0540,x                               ; $07A387 |
code_07A38A:
  LDY #$1E                                  ; $07A38A |
  JSR code_1FF67C                           ; $07A38C |
  BCS code_07A3B7                           ; $07A38F |
  JSR code_07A333                           ; $07A391 |
  LDA $0520,x                               ; $07A394 |
  AND #$03                                  ; $07A397 |
  TAY                                       ; $07A399 |
  LDA $A4E7,y                               ; $07A39A |
  STA $0400,x                               ; $07A39D |
  LDA $A4EB,y                               ; $07A3A0 |
  STA $0420,x                               ; $07A3A3 |
  LDA $04A0,x                               ; $07A3A6 |
  AND #$02                                  ; $07A3A9 |
  BEQ code_07A3B2                           ; $07A3AB |
  LDY #$21                                  ; $07A3AD |
  JMP code_1FF5C4                           ; $07A3AF |

code_07A3B2:
  LDY #$20                                  ; $07A3B2 |
  JMP code_1FF580                           ; $07A3B4 |

code_07A3B7:
  LDA $0520,x                               ; $07A3B7 |
  TAY                                       ; $07A3BA |
  LDA $A4DF,y                               ; $07A3BB |
  STA $0360,x                               ; $07A3BE |
  INC $05A0,x                               ; $07A3C1 |
  JSR code_07A333                           ; $07A3C4 |
  INC $0520,x                               ; $07A3C7 |
  LDA $0520,x                               ; $07A3CA |
  AND #$07                                  ; $07A3CD |
  STA $0520,x                               ; $07A3CF |
  AND #$03                                  ; $07A3D2 |
  BNE code_07A3E6                           ; $07A3D4 |
code_07A3D6:
  LDA $04A0,x                               ; $07A3D6 |
  EOR #$03                                  ; $07A3D9 |
  STA $04A0,x                               ; $07A3DB |
  LDA $0580,x                               ; $07A3DE |
  EOR #$40                                  ; $07A3E1 |
  STA $0580,x                               ; $07A3E3 |
code_07A3E6:
  RTS                                       ; $07A3E6 |

code_07A3E7:
  JSR code_07A35D                           ; $07A3E7 |
  LDA $05A0,x                               ; $07A3EA |
  ORA $05E0,x                               ; $07A3ED |
  BNE code_07A40D                           ; $07A3F0 |
  LDA #$39                                  ; $07A3F2 |
  CMP $05C0,x                               ; $07A3F4 |
  BEQ code_07A3FC                           ; $07A3F7 |
  JMP reset_sprite_anim                     ; $07A3F9 |

code_07A3FC:
  LDA #$37                                  ; $07A3FC |
  JSR reset_sprite_anim                     ; $07A3FE |
  INC $05A0,x                               ; $07A401 |
  LDA #$64                                  ; $07A404 |
  STA $0500,x                               ; $07A406 |
  DEC $0300,x                               ; $07A409 |
  RTS                                       ; $07A40C |

code_07A40D:
  LDA $05E0,x                               ; $07A40D |
  BNE code_07A3E6                           ; $07A410 |
  LDA #$39                                  ; $07A412 |
  CMP $05C0,x                               ; $07A414 |
  BEQ code_07A423                           ; $07A417 |
  LDA $05A0,x                               ; $07A419 |
  CMP #$03                                  ; $07A41C |
  BNE code_07A3E6                           ; $07A41E |
  JMP code_07A42D                           ; $07A420 |

code_07A423:
  LDA $05A0,x                               ; $07A423 |
  CMP #$0A                                  ; $07A426 |
  BNE code_07A3E6                           ; $07A428 |
  JMP code_07A485                           ; $07A42A |

code_07A42D:
  STX $00                                   ; $07A42D |
  LDA #$07                                  ; $07A42F |
  STA $01                                   ; $07A431 |
code_07A433:
  JSR find_enemy_freeslot_y                 ; $07A433 |
  BCS code_07A482                           ; $07A436 |
  LDX $01                                   ; $07A438 |
  LDA $A4F3,x                               ; $07A43A |
  STA $0400,y                               ; $07A43D |
  LDA $A4FB,x                               ; $07A440 |
  STA $0420,y                               ; $07A443 |
  LDA $A503,x                               ; $07A446 |
  STA $0440,y                               ; $07A449 |
  LDA $A50B,x                               ; $07A44C |
  STA $0460,y                               ; $07A44F |
  LDA $A513,x                               ; $07A452 |
  STA $04A0,y                               ; $07A455 |
  LDX $00                                   ; $07A458 |
  LDA #$3A                                  ; $07A45A |
  JSR code_1FF846                           ; $07A45C |
  LDA #$8B                                  ; $07A45F |
  STA $0480,y                               ; $07A461 |
  LDA #$43                                  ; $07A464 |
  STA $0320,y                               ; $07A466 |
  LDA $0360,x                               ; $07A469 |
  STA $0360,y                               ; $07A46C |
  LDA $0380,x                               ; $07A46F |
  STA $0380,y                               ; $07A472 |
  LDA $03C0,x                               ; $07A475 |
  SEC                                       ; $07A478 |
  SBC #$08                                  ; $07A479 |
  STA $03C0,y                               ; $07A47B |
  DEC $01                                   ; $07A47E |
  BPL code_07A433                           ; $07A480 |
code_07A482:
  LDX $00                                   ; $07A482 |
  RTS                                       ; $07A484 |

code_07A485:
  STX $0E                                   ; $07A485 |
  JSR find_enemy_freeslot_y                 ; $07A487 |
  BCS code_07A4DC                           ; $07A48A |
  LDA $03C0,x                               ; $07A48C |
  CLC                                       ; $07A48F |
  ADC #$05                                  ; $07A490 |
  STA $03C0,y                               ; $07A492 |
  LDA $0380,x                               ; $07A495 |
  STA $0380,y                               ; $07A498 |
  LDA $0360,x                               ; $07A49B |
  STA $0360,y                               ; $07A49E |
  LDA #$3C                                  ; $07A4A1 |
  JSR code_1FF846                           ; $07A4A3 |
  LDA #$8A                                  ; $07A4A6 |
  STA $0480,y                               ; $07A4A8 |
  LDA #$B8                                  ; $07A4AB |
  STA $0320,y                               ; $07A4AD |
  STY $0F                                   ; $07A4B0 |
  LDA #$00                                  ; $07A4B2 |
  STA $02                                   ; $07A4B4 |
  LDA #$02                                  ; $07A4B6 |
  STA $03                                   ; $07A4B8 |
  TYA                                       ; $07A4BA |
  TAX                                       ; $07A4BB |
  JSR code_1FFC63                           ; $07A4BC |
  LDY $0F                                   ; $07A4BF |
  LDA $0C                                   ; $07A4C1 |
  STA $04A0,y                               ; $07A4C3 |
  AND #$02                                  ; $07A4C6 |
  TAX                                       ; $07A4C8 |
  LDA $0360,y                               ; $07A4C9 |
  CLC                                       ; $07A4CC |
  ADC $A4EF,x                               ; $07A4CD |
  STA $0360,y                               ; $07A4D0 |
  LDA $0380,y                               ; $07A4D3 |
  ADC $A4F0,x                               ; $07A4D6 |
  STA $0380,y                               ; $07A4D9 |
code_07A4DC:
  LDX $0E                                   ; $07A4DC |
  RTS                                       ; $07A4DE |

  db $A8, $80, $58, $20, $58, $80, $A8, $E0 ; $07A4DF |
  db $6D, $05, $05, $6D, $01, $01, $01, $01 ; $07A4E7 |
  db $20, $00, $E0, $FF, $00, $6A, $00, $6A ; $07A4EF |
  db $00, $6A, $00, $6A, $00, $01, $02, $01 ; $07A4F7 |
  db $00, $01, $02, $01, $00, $96, $00, $6A ; $07A4FF |
  db $00, $6A, $00, $96, $FE, $FE, $00, $01 ; $07A507 |
  db $02, $01, $00, $FE, $02, $02, $02, $02 ; $07A50F |
  db $01, $01, $01, $01                     ; $07A517 |

code_07A51B:
  LDA $0300,x                               ; $07A51B |
  AND #$0F                                  ; $07A51E |
  BEQ code_07A525                           ; $07A520 |
  JMP code_07A5D8                           ; $07A522 |

code_07A525:
  LDY #$00                                  ; $07A525 |
  JSR code_1FF67C                           ; $07A527 |
  BCS code_07A535                           ; $07A52A |
code_07A52C:
  LDA #$23                                  ; $07A52C |
  JSR reset_sprite_anim                     ; $07A52E |
  INC $05A0,x                               ; $07A531 |
  RTS                                       ; $07A534 |

code_07A535:
  LDA #$23                                  ; $07A535 |
  CMP $05C0,x                               ; $07A537 |
  BNE code_07A561                           ; $07A53A |
  LDA $05A0,x                               ; $07A53C |
  CMP #$01                                  ; $07A53F |
  BNE code_07A54B                           ; $07A541 |
  LDA #$02                                  ; $07A543 |
  STA $05A0,x                               ; $07A545 |
  JMP code_07A612                           ; $07A548 |

code_07A54B:
  LDA $0540,x                               ; $07A54B |
  BEQ code_07A559                           ; $07A54E |
  DEC $0540,x                               ; $07A550 |
  LDA #$00                                  ; $07A553 |
  STA $05E0,x                               ; $07A555 |
  RTS                                       ; $07A558 |

code_07A559:
  LDA $05E0,x                               ; $07A559 |
  CMP #$04                                  ; $07A55C |
  BEQ code_07A561                           ; $07A55E |
  RTS                                       ; $07A560 |

code_07A561:
  JSR code_1FF883                           ; $07A561 |
  LDA #$25                                  ; $07A564 |
  CMP $05C0,x                               ; $07A566 |
  BEQ code_07A56E                           ; $07A569 |
  JSR reset_sprite_anim                     ; $07A56B |
code_07A56E:
  JSR code_07A745                           ; $07A56E |
  BCC code_07A577                           ; $07A571 |
  LDY #$00                                  ; $07A573 |
  BEQ code_07A5C2                           ; $07A575 |
code_07A577:
  LDA $0500,x                               ; $07A577 |
  TAY                                       ; $07A57A |
  LDA $04A0,x                               ; $07A57B |
  AND #$02                                  ; $07A57E |
  BEQ code_07A58B                           ; $07A580 |
  LDA $A6A4,y                               ; $07A582 |
  CMP $0360,x                               ; $07A585 |
  BCS code_07A594                           ; $07A588 |
  RTS                                       ; $07A58A |

code_07A58B:
  LDA $A6A4,y                               ; $07A58B |
  CMP $0360,x                               ; $07A58E |
  BCC code_07A594                           ; $07A591 |
  RTS                                       ; $07A593 |

code_07A594:
  INC $0500,x                               ; $07A594 |
  LDA $0500,x                               ; $07A597 |
  AND #$03                                  ; $07A59A |
  STA $0500,x                               ; $07A59C |
  AND #$01                                  ; $07A59F |
  BNE code_07A5A6                           ; $07A5A1 |
  JSR code_07A3D6                           ; $07A5A3 |
code_07A5A6:
  LDY #$0F                                  ; $07A5A6 |
code_07A5A8:
  LDA $0310,y                               ; $07A5A8 |
  BPL code_07A5B8                           ; $07A5AB |
  LDA $0330,y                               ; $07A5AD |
  CMP #$BA                                  ; $07A5B0 |
  BNE code_07A5B8                           ; $07A5B2 |
  LDY #$00                                  ; $07A5B4 |
  BEQ code_07A5C2                           ; $07A5B6 |
code_07A5B8:
  DEY                                       ; $07A5B8 |
  BNE code_07A5A8                           ; $07A5B9 |
  LDA $E4                                   ; $07A5BB |
  ADC $E6                                   ; $07A5BD |
  AND #$01                                  ; $07A5BF |
  TAY                                       ; $07A5C1 |
code_07A5C2:
  LDA $A6A8,y                               ; $07A5C2 |
  JSR reset_sprite_anim                     ; $07A5C5 |
  LDA $A6AA,y                               ; $07A5C8 |
  STA $0440,x                               ; $07A5CB |
  LDA $A6AC,y                               ; $07A5CE |
  STA $0460,x                               ; $07A5D1 |
  INC $0300,x                               ; $07A5D4 |
  RTS                                       ; $07A5D7 |

code_07A5D8:
  LDY #$00                                  ; $07A5D8 |
  JSR code_1FF67C                           ; $07A5DA |
  BCS code_07A5F8                           ; $07A5DD |
  LDA $05C0,x                               ; $07A5DF |
  CMP #$24                                  ; $07A5E2 |
  BEQ code_07A5E9                           ; $07A5E4 |
  JSR code_07A745                           ; $07A5E6 |
code_07A5E9:
  LDA $0460,x                               ; $07A5E9 |
  BPL code_07A612                           ; $07A5EC |
  LDA #$24                                  ; $07A5EE |
  CMP $05C0,x                               ; $07A5F0 |
  BEQ code_07A618                           ; $07A5F3 |
  JMP code_07A52C                           ; $07A5F5 |

code_07A5F8:
  LDA $05C0,x                               ; $07A5F8 |
  CMP #$24                                  ; $07A5FB |
  BNE code_07A604                           ; $07A5FD |
  LDA #$1A                                  ; $07A5FF |
  STA $0540,x                               ; $07A601 |
code_07A604:
  LDA #$00                                  ; $07A604 |
  STA $0520,x                               ; $07A606 |
  DEC $0300,x                               ; $07A609 |
  JSR code_07A52C                           ; $07A60C |
  INC $05A0,x                               ; $07A60F |
code_07A612:
  LDA #$00                                  ; $07A612 |
  STA $05E0,x                               ; $07A614 |
code_07A617:
  RTS                                       ; $07A617 |

code_07A618:
  LDA $0520,x                               ; $07A618 |
  BEQ code_07A633                           ; $07A61B |
  DEC $0520,x                               ; $07A61D |
  LDA $05A0,x                               ; $07A620 |
  CMP #$02                                  ; $07A623 |
  BNE code_07A612                           ; $07A625 |
  LDA $05E0,x                               ; $07A627 |
  CMP #$08                                  ; $07A62A |
  BNE code_07A617                           ; $07A62C |
  DEC $05A0,x                               ; $07A62E |
  BNE code_07A612                           ; $07A631 |
code_07A633:
  LDA #$02                                  ; $07A633 |
  STA $05A0,x                               ; $07A635 |
  JSR code_07A612                           ; $07A638 |
  JSR code_07A35D                           ; $07A63B |
  LDA #$14                                  ; $07A63E |
  STA $0520,x                               ; $07A640 |
  STX $00                                   ; $07A643 |
  JSR find_enemy_freeslot_y                 ; $07A645 |
  BCS code_07A6A1                           ; $07A648 |
  LDA #$52                                  ; $07A64A |
  JSR code_1FF846                           ; $07A64C |
  LDA #$CB                                  ; $07A64F |
  STA $0480,y                               ; $07A651 |
  LDA #$BA                                  ; $07A654 |
  STA $0320,y                               ; $07A656 |
  LDA #$44                                  ; $07A659 |
  STA $0440,y                               ; $07A65B |
  LDA #$03                                  ; $07A65E |
  STA $0460,y                               ; $07A660 |
  LDA $03C0,x                               ; $07A663 |
  SEC                                       ; $07A666 |
  SBC #$04                                  ; $07A667 |
  STA $03C0,y                               ; $07A669 |
  LDA $0380,x                               ; $07A66C |
  STA $0380,y                               ; $07A66F |
  LDA $0360,x                               ; $07A672 |
  STA $0360,y                               ; $07A675 |
  LDA $04A0,x                               ; $07A678 |
  PHA                                       ; $07A67B |
  JSR face_player                           ; $07A67C |
  LDA $04A0,x                               ; $07A67F |
  STA $04A0,y                               ; $07A682 |
  AND #$02                                  ; $07A685 |
  TAX                                       ; $07A687 |
  LDA $0360,y                               ; $07A688 |
  CLC                                       ; $07A68B |
  ADC $A6AE,x                               ; $07A68C |
  STA $0360,y                               ; $07A68F |
  LDA $0380,y                               ; $07A692 |
  ADC $A6AF,x                               ; $07A695 |
  STA $0380,y                               ; $07A698 |
  LDX $00                                   ; $07A69B |
  PLA                                       ; $07A69D |
  STA $04A0,x                               ; $07A69E |
code_07A6A1:
  LDX $00                                   ; $07A6A1 |
  RTS                                       ; $07A6A3 |

  db $80, $28, $80, $D8, $23, $24, $A8, $00 ; $07A6A4 |
  db $05, $08, $1E, $00, $E2, $FF           ; $07A6AC |

main_gemini_man:
  LDA $0300,x                               ; $07A6B2 |\
  AND #$0F                                  ; $07A6B5 | | if state == $02
  CMP #$02                                  ; $07A6B7 | | goto ???
  BNE code_07A6BE                           ; $07A6B9 | |
  JMP code_07A7F1                           ; $07A6BB |/
code_07A6BE:
  CMP #$01                                  ; $07A6BE |\ if state == $01
  BEQ code_07A6E1                           ; $07A6C0 |/ skip a little bit
  LDA #$3D                                  ; $07A6C2 |
  STA $0440,x                               ; $07A6C4 |
  LDA #$09                                  ; $07A6C7 |
  STA $0460,x                               ; $07A6C9 |
  INC $0300,x                               ; $07A6CC |
  LDA #$33                                  ; $07A6CF |
  JSR reset_sprite_anim                     ; $07A6D1 |
  LDA $0500,x                               ; $07A6D4 |
  BNE code_07A6E1                           ; $07A6D7 |
  JSR code_07A880                           ; $07A6D9 |
  LDA #$01                                  ; $07A6DC |
  STA $0500,x                               ; $07A6DE |
code_07A6E1:
  LDA $0500,x                               ; $07A6E1 |
  BMI code_07A715                           ; $07A6E4 |
  LDY $0520,x                               ; $07A6E6 |
  LDA $0300,y                               ; $07A6E9 |
  BPL code_07A715                           ; $07A6EC |
  JSR $8003                                 ; $07A6EE |
  BCS code_07A715                           ; $07A6F1 |
  LDY $0520,x                               ; $07A6F3 |
  LDA $04E0,x                               ; $07A6F6 |
  AND #$1F                                  ; $07A6F9 |
  STA $04E0,y                               ; $07A6FB |
  CMP #$0F                                  ; $07A6FE |
  BCS code_07A715                           ; $07A700 |
  LDA $0480,y                               ; $07A702 |
  ORA #$40                                  ; $07A705 |
  STA $0480,y                               ; $07A707 |
  LDA #$00                                  ; $07A70A |
  STA $0300,x                               ; $07A70C |
  LDA #$80                                  ; $07A70F |
  STA $0500,y                               ; $07A711 |
  RTS                                       ; $07A714 |

code_07A715:
  LDA $05C0,x                               ; $07A715 |
  CMP #$35                                  ; $07A718 |
  BEQ code_07A795                           ; $07A71A |
  CMP #$34                                  ; $07A71C |
  BNE code_07A723                           ; $07A71E |
  JMP code_07A7C7                           ; $07A720 |

code_07A723:
  LDA $0500,x                               ; $07A723 |
  BMI code_07A739                           ; $07A726 |
  LDA $0520,x                               ; $07A728 |
  TAY                                       ; $07A72B |
  LDA $05C0,y                               ; $07A72C |
  CMP #$34                                  ; $07A72F |
  BNE code_07A739                           ; $07A731 |
  LDA #$00                                  ; $07A733 |
  STA $05E0,x                               ; $07A735 |
code_07A738:
  RTS                                       ; $07A738 |

code_07A739:
  LDY #$00                                  ; $07A739 |
  JSR code_1FF67C                           ; $07A73B |
  BCS code_07A756                           ; $07A73E |
  LDA #$00                                  ; $07A740 |
  STA $05E0,x                               ; $07A742 |
code_07A745:
  LDA $04A0,x                               ; $07A745 |
  AND #$02                                  ; $07A748 |
  BEQ code_07A751                           ; $07A74A |
  LDY #$01                                  ; $07A74C |
  JMP code_1FF5C4                           ; $07A74E |

code_07A751:
  LDY #$00                                  ; $07A751 |
  JMP code_1FF580                           ; $07A753 |

code_07A756:
  LDA $05A0,x                               ; $07A756 |
  BEQ code_07A738                           ; $07A759 |
  LDA $05E0,x                               ; $07A75B |
  CMP #$04                                  ; $07A75E |
  BNE code_07A738                           ; $07A760 |
  LDA #$35                                  ; $07A762 |
  JSR reset_sprite_anim                     ; $07A764 |
  JSR code_07A3D6                           ; $07A767 |
  LDA #$28                                  ; $07A76A |
  STA $0360,x                               ; $07A76C |
  LDA $0500,x                               ; $07A76F |
  BPL code_07A795                           ; $07A772 |
code_07A774:
  LDA #$4C                                  ; $07A774 |
  STA $0400,x                               ; $07A776 |
  LDA #$01                                  ; $07A779 |
  STA $0420,x                               ; $07A77B |
  INC $0300,x                               ; $07A77E |
  JSR face_player                           ; $07A781 |
  JSR code_1FF883                           ; $07A784 |
code_07A787:
  LDA $E6                                   ; $07A787 |
  ADC $E7                                   ; $07A789 |
  AND #$01                                  ; $07A78B |
  TAY                                       ; $07A78D |
  LDA $A96C,y                               ; $07A78E |
  STA $0500,x                               ; $07A791 |
  RTS                                       ; $07A794 |

code_07A795:
  LDA $14                                   ; $07A795 |
  AND #$40                                  ; $07A797 |
  BEQ code_07A7A6                           ; $07A799 |
  JSR face_player                           ; $07A79B |
  JSR code_1FF883                           ; $07A79E |
  LDA #$34                                  ; $07A7A1 |
  JMP reset_sprite_anim                     ; $07A7A3 |

code_07A7A6:
  JSR code_07A745                           ; $07A7A6 |
  LDA #$D8                                  ; $07A7A9 |
  CMP $0360,x                               ; $07A7AB |
  BCS code_07A7C6                           ; $07A7AE |
  STA $0360,x                               ; $07A7B0 |
  LDA $0500,x                               ; $07A7B3 |
  BPL code_07A7BB                           ; $07A7B6 |
  JMP code_07A774                           ; $07A7B8 |

code_07A7BB:
  DEC $0300,x                               ; $07A7BB |
  JSR code_07A3D6                           ; $07A7BE |
  LDA #$33                                  ; $07A7C1 |
  JMP reset_sprite_anim                     ; $07A7C3 |

code_07A7C6:
  RTS                                       ; $07A7C6 |

code_07A7C7:
  LDA $05E0,x                               ; $07A7C7 |
  BNE code_07A7D6                           ; $07A7CA |
  LDA $05A0,x                               ; $07A7CC |
  CMP #$01                                  ; $07A7CF |
  BNE code_07A7D6                           ; $07A7D1 |
  JMP code_07A8D3                           ; $07A7D3 |

code_07A7D6:
  LDA $05E0,x                               ; $07A7D6 |
  CMP #$04                                  ; $07A7D9 |
  BNE code_07A7C6                           ; $07A7DB |
  LDA $05A0,x                               ; $07A7DD |
  CMP #$02                                  ; $07A7E0 |
  BNE code_07A7C6                           ; $07A7E2 |
  LDA #$01                                  ; $07A7E4 |
  STA $04A0,x                               ; $07A7E6 |
  JSR code_1FF883                           ; $07A7E9 |
  LDA #$35                                  ; $07A7EC |
  JMP reset_sprite_anim                     ; $07A7EE |

code_07A7F1:
  LDY #$00                                  ; $07A7F1 |
  JSR code_1FF67C                           ; $07A7F3 |
  BCS code_07A800                           ; $07A7F6 |
  LDA #$00                                  ; $07A7F8 |
  STA $05E0,x                               ; $07A7FA |
  JMP code_07A745                           ; $07A7FD |

code_07A800:
  LDA $05C0,x                               ; $07A800 |
  CMP #$34                                  ; $07A803 |
  BEQ code_07A854                           ; $07A805 |
  LDA $0500,x                               ; $07A807 |
  BNE code_07A81C                           ; $07A80A |
  LDA $0310                                 ; $07A80C |
  BMI code_07A81F                           ; $07A80F |
  JSR face_player                           ; $07A811 |
  JSR code_1FF883                           ; $07A814 |
  LDA #$34                                  ; $07A817 |
  JMP reset_sprite_anim                     ; $07A819 |

code_07A81C:
  DEC $0500,x                               ; $07A81C |
code_07A81F:
  LDA $05C0,x                               ; $07A81F |
  CMP #$35                                  ; $07A822 |
  BEQ code_07A837                           ; $07A824 |
  LDA $05A0,x                               ; $07A826 |
  BEQ code_07A87F                           ; $07A829 |
  LDA $05E0,x                               ; $07A82B |
  CMP #$04                                  ; $07A82E |
  BNE code_07A87F                           ; $07A830 |
  LDA #$35                                  ; $07A832 |
  JSR reset_sprite_anim                     ; $07A834 |
code_07A837:
  JSR code_07A745                           ; $07A837 |
  BCC code_07A83F                           ; $07A83A |
  JSR code_07A3D6                           ; $07A83C |
code_07A83F:
  LDA $14                                   ; $07A83F |
  AND #$40                                  ; $07A841 |
  BEQ code_07A87F                           ; $07A843 |
  LDA #$AB                                  ; $07A845 |
  STA $0440,x                               ; $07A847 |
  LDA #$05                                  ; $07A84A |
  STA $0460,x                               ; $07A84C |
  LDA #$33                                  ; $07A84F |
  JMP reset_sprite_anim                     ; $07A851 |

code_07A854:
  LDA $05E0,x                               ; $07A854 |
  BNE code_07A863                           ; $07A857 |
  LDA $05A0,x                               ; $07A859 |
  CMP #$01                                  ; $07A85C |
  BNE code_07A863                           ; $07A85E |
  JMP code_07A92A                           ; $07A860 |

code_07A863:
  LDA $05E0,x                               ; $07A863 |
  CMP #$04                                  ; $07A866 |
  BNE code_07A87F                           ; $07A868 |
  LDA $05A0,x                               ; $07A86A |
  CMP #$02                                  ; $07A86D |
  BNE code_07A87F                           ; $07A86F |
  JSR face_player                           ; $07A871 |
  JSR code_1FF883                           ; $07A874 |
  JSR code_07A787                           ; $07A877 |
  LDA #$35                                  ; $07A87A |
  JMP reset_sprite_anim                     ; $07A87C |

code_07A87F:
  RTS                                       ; $07A87F |

code_07A880:
  STX $00                                   ; $07A880 |
  JSR find_enemy_freeslot_y                 ; $07A882 |
  BCS code_07A8D0                           ; $07A885 |
  TYA                                       ; $07A887 |
  STA $0520,x                               ; $07A888 |
  TXA                                       ; $07A88B |
  STA $0520,y                               ; $07A88C |
  LDA #$00                                  ; $07A88F |
  STA $0500,y                               ; $07A891 |
  LDA #$33                                  ; $07A894 |
  JSR code_1FF846                           ; $07A896 |
  LDA #$01                                  ; $07A899 |
  STA $05A0,y                               ; $07A89B |
  LDA #$1C                                  ; $07A89E |
  STA $04E0,y                               ; $07A8A0 |
  LDA #$C0                                  ; $07A8A3 |
  STA $0300,y                               ; $07A8A5 |
  LDA #$8A                                  ; $07A8A8 |
  STA $0480,y                               ; $07A8AA |
  LDA $0360,x                               ; $07A8AD |
  STA $0360,y                               ; $07A8B0 |
  LDA $0380,x                               ; $07A8B3 |
  STA $0380,y                               ; $07A8B6 |
  LDA $03C0,x                               ; $07A8B9 |
  STA $03C0,y                               ; $07A8BC |
  LDA $03E0,x                               ; $07A8BF |
  STA $03E0,y                               ; $07A8C2 |
  LDA #$D7                                  ; $07A8C5 |
  STA $0320,y                               ; $07A8C7 |
  LDA $04A0,x                               ; $07A8CA |
  STA $04A0,y                               ; $07A8CD |
code_07A8D0:
  LDX $00                                   ; $07A8D0 |
  RTS                                       ; $07A8D2 |

code_07A8D3:
  STX $00                                   ; $07A8D3 |
  JSR find_enemy_freeslot_y                 ; $07A8D5 |
  BCS code_07A927                           ; $07A8D8 |
  LDA #$40                                  ; $07A8DA |
  STA $0320,y                               ; $07A8DC |
  LDA #$00                                  ; $07A8DF |
  STA $0400,y                               ; $07A8E1 |
  LDA #$04                                  ; $07A8E4 |
  STA $0420,y                               ; $07A8E6 |
  LDA #$50                                  ; $07A8E9 |
  JSR code_1FF846                           ; $07A8EB |
code_07A8EE:
  LDA #$8B                                  ; $07A8EE |
  STA $0480,y                               ; $07A8F0 |
  LDA $0360,x                               ; $07A8F3 |
  STA $0360,y                               ; $07A8F6 |
  LDA $0380,x                               ; $07A8F9 |
  STA $0380,y                               ; $07A8FC |
  LDA $03C0,x                               ; $07A8FF |
  STA $03C0,y                               ; $07A902 |
  LDA $03E0,x                               ; $07A905 |
  STA $03E0,y                               ; $07A908 |
  LDA $04A0,x                               ; $07A90B |
  STA $04A0,y                               ; $07A90E |
  AND #$02                                  ; $07A911 |
  TAX                                       ; $07A913 |
  LDA $0360,y                               ; $07A914 |
  CLC                                       ; $07A917 |
  ADC $A96E,x                               ; $07A918 |
  STA $0360,y                               ; $07A91B |
  LDA $0380,y                               ; $07A91E |
  ADC $A96F,x                               ; $07A921 |
  STA $0380,y                               ; $07A924 |
code_07A927:
  LDX $00                                   ; $07A927 |
  RTS                                       ; $07A929 |

code_07A92A:
  STX $00                                   ; $07A92A |
  LDY #$10                                  ; $07A92C |
code_07A92E:
  LDA $0300,y                               ; $07A92E |
  BMI code_07A969                           ; $07A931 |
  LDA #$B9                                  ; $07A933 |
  STA $0320,y                               ; $07A935 |
  LDA #$00                                  ; $07A938 |
  STA $0400,y                               ; $07A93A |
  STA $0440,y                               ; $07A93D |
  LDA #$03                                  ; $07A940 |
  STA $0420,y                               ; $07A942 |
  STA $0460,y                               ; $07A945 |
  LDA #$B4                                  ; $07A948 |
  STA $0500,y                               ; $07A94A |
  LDA #$96                                  ; $07A94D |
  STA $0520,y                               ; $07A94F |
  LDX $00                                   ; $07A952 |
  LDA #$4A                                  ; $07A954 |
  JSR code_1FF846                           ; $07A956 |
  JSR code_07A8EE                           ; $07A959 |
  LDA $0360,y                               ; $07A95C |
  AND #$FC                                  ; $07A95F |
  STA $0360,y                               ; $07A961 |
  INY                                       ; $07A964 |
  CPY #$13                                  ; $07A965 |
  BCC code_07A92E                           ; $07A967 |
code_07A969:
  LDX $00                                   ; $07A969 |
  RTS                                       ; $07A96B |

  db $B4, $FF, $0D, $00, $F3, $FF           ; $07A96C |

code_07A972:
  LDA $0300,x                               ; $07A972 |
  AND #$0F                                  ; $07A975 |
  BNE code_07A99C                           ; $07A977 |
  LDA $0500,x                               ; $07A979 |
  BNE code_07A98F                           ; $07A97C |
  LDA $0520,x                               ; $07A97E |
  TAY                                       ; $07A981 |
  LDA $0360,y                               ; $07A982 |
  CMP #$30                                  ; $07A985 |
  BCC code_07A98F                           ; $07A987 |
  LDA #$00                                  ; $07A989 |
  STA $05E0,x                               ; $07A98B |
  RTS                                       ; $07A98E |

code_07A98F:
  LDA #$2D                                  ; $07A98F |
  STA $0400,x                               ; $07A991 |
  LDA #$03                                  ; $07A994 |
  STA $0420,x                               ; $07A996 |
  STA $0500,x                               ; $07A999 |
code_07A99C:
  JMP main_gemini_man                       ; $07A99C |

  db $2E, $2A, $AA, $EA, $5F, $A0, $11, $2A ; $07A99F |
  db $88, $A0, $1F, $AA, $F7, $A2, $57, $A6 ; $07A9A7 |
  db $DA, $8A, $EB, $AA, $7B, $88, $D3, $2A ; $07A9AF |
  db $EF, $AC, $7C, $2A, $60, $AA, $3F, $2A ; $07A9B7 |
  db $ED, $A0, $76, $20, $E8, $28, $B7, $AA ; $07A9BF |
  db $9A, $AA, $F6, $AA, $36, $20, $F3, $A8 ; $07A9C7 |
  db $DB, $0C, $7F, $A2, $B7, $AA, $37, $EA ; $07A9CF |
  db $FF, $AA, $DB, $A8, $D7, $A8, $E6, $2A ; $07A9D7 |
  db $2B, $A8, $A6, $22, $B7, $2A, $F5, $A0 ; $07A9DF |
  db $FF, $AA, $F9, $28, $57, $20, $DB, $08 ; $07A9E7 |
  db $3F, $00, $FF, $AA, $DA, $AA, $6D, $AA ; $07A9EF |
  db $E8, $2A, $05, $A0, $FF, $AA, $F8, $AA ; $07A9F7 |
  db $F2, $00, $01, $02, $03, $04, $05, $06 ; $07A9FF |
  db $07, $08, $09, $0A, $0B, $0C, $0D, $0E ; $07AA07 |
  db $0F, $10, $11, $12, $13, $14, $15, $16 ; $07AA0F |
  db $BD, $AA, $F7, $AA, $F9, $20, $9A, $2A ; $07AA17 |
  db $DB, $28, $45, $A6, $FA, $A2, $8D, $1A ; $07AA1F |
  db $6F, $0A, $D7, $A0, $DE, $AA, $BF, $A8 ; $07AA27 |
  db $AB, $14, $0C, $0C, $EF, $02, $BC, $A8 ; $07AA2F |
  db $F2, $A2, $D7, $A8, $E9, $28, $5F, $08 ; $07AA37 |
  db $E1, $40, $40, $40, $61, $40, $66, $67 ; $07AA3F |
  db $20, $20, $00, $A0, $7F, $88, $EC, $A2 ; $07AA47 |
  db $8E, $8A, $BA, $A0, $DE, $A8, $A7, $28 ; $07AA4F |
  db $5C, $A2, $BE, $20, $7D, $AA, $FD, $8A ; $07AA57 |
  db $EB, $06, $00, $06, $00, $06, $00, $2D ; $07AA5F |
  db $00, $0E, $00, $08, $00, $30, $00, $00 ; $07AA67 |
  db $00, $29, $00, $00, $7E, $28, $EB, $2A ; $07AA6F |
  db $FA, $2A, $EC, $8A, $B7, $2A, $FE, $0A ; $07AA77 |
  db $B5, $5C, $5E, $0F, $27, $26, $06, $0F ; $07AA7F |
  db $26, $16, $06, $0F, $0C, $09, $01, $0F ; $07AA87 |
  db $30, $28, $07, $8A, $00, $00, $00, $2A ; $07AA8F |
  db $7E, $A0, $B3, $20, $FF, $A0, $F7, $AA ; $07AA97 |
  db $F7, $20, $FE, $88, $60, $88, $DB, $22 ; $07AA9F |
  db $A6, $0A, $F6, $2A, $EC, $A2, $FF, $82 ; $07AAA7 |
  db $3D, $A0, $8D, $AA, $2C, $AA, $DD, $02 ; $07AAAF |
  db $EF, $88, $FF, $88, $EE, $A2, $E3, $AA ; $07AAB7 |
  db $65, $2A, $8A, $2B, $94, $A2, $F3, $A8 ; $07AABF |
  db $7B, $AA, $75, $22, $C3, $88, $FE, $E8 ; $07AAC7 |
  db $D6, $A8, $F9, $AA, $6E, $A1, $F7, $A8 ; $07AACF |
  db $A4, $28, $DF, $02, $FF, $20, $F3, $A2 ; $07AAD7 |
  db $FD, $2A, $8E, $A8, $B7, $22, $97, $A8 ; $07AADF |
  db $7D, $0A, $EF, $AC, $A7, $2A, $7E, $A8 ; $07AAE7 |
  db $FE, $06, $07, $22, $9D, $22, $31, $A2 ; $07AAEF |
  db $FF, $0D, $15, $FF, $9C, $AA, $77, $88 ; $07AAF7 |
  db $F9, $01, $03, $03, $04, $05, $06, $07 ; $07AAFF |
  db $07, $07, $07, $08, $08, $08, $08, $09 ; $07AB07 |
  db $09, $09, $0A, $0A, $0A, $0B, $0B, $0B ; $07AB0F |
  db $0C, $0C, $0C, $0D, $0D, $0D, $0D, $0D ; $07AB17 |
  db $0E, $0E, $0F, $0F, $10, $10, $11, $11 ; $07AB1F |
  db $11, $12, $12, $12, $13, $14, $16, $FF ; $07AB27 |
  db $A0, $88, $FF, $88, $BE, $AA, $7A, $2A ; $07AB2F |
  db $F7, $A8, $D7, $A2, $FB, $20, $18, $28 ; $07AB37 |
  db $F0, $A8, $AF, $2A, $D5, $2A, $B9, $0A ; $07AB3F |
  db $FD, $82, $B7, $28, $2F, $28, $E7, $AB ; $07AB47 |
  db $B3, $AA, $67, $22, $EF, $8A, $A7, $AA ; $07AB4F |
  db $BA, $AA, $DF, $AA, $5D, $AA, $F7, $AA ; $07AB57 |
  db $E3, $AA, $E9, $A2, $6E, $08, $EE, $A8 ; $07AB5F |
  db $AC, $A0, $0F, $22, $CF, $82, $50, $EA ; $07AB67 |
  db $BE, $80, $CB, $28, $FB, $80, $47, $AA ; $07AB6F |
  db $F1, $2A, $76, $A0, $FF, $A8, $7F, $A8 ; $07AB77 |
  db $2F, $22, $ED, $A0, $25, $2A, $5A, $A2 ; $07AB7F |
  db $3F, $0A, $F7, $A0, $EE, $A8, $B1, $00 ; $07AB87 |
  db $FF, $8A, $ED, $62, $ED, $AA, $5F, $A8 ; $07AB8F |
  db $A7, $92, $F3, $A2, $FD, $AA, $6F, $A0 ; $07AB97 |
  db $F7, $2A, $EA, $A2, $E1, $88, $10, $28 ; $07AB9F |
  db $FA, $AA, $B7, $80, $75, $8A, $CF, $2A ; $07ABA7 |
  db $89, $80, $37, $8A, $A2, $88, $7B, $AA ; $07ABAF |
  db $E2, $0A, $D7, $A8, $E6, $A2, $A9, $8A ; $07ABB7 |
  db $5F, $1A, $2D, $88, $2E, $A8, $D9, $22 ; $07ABBF |
  db $32, $8A, $5F, $2A, $97, $88, $7E, $AB ; $07ABC7 |
  db $FE, $8A, $DD, $28, $77, $80, $4F, $AA ; $07ABCF |
  db $B0, $AA, $EF, $00, $3D, $2A, $EE, $BA ; $07ABD7 |
  db $FF, $2A, $D6, $08, $44, $00, $3D, $A8 ; $07ABDF |
  db $6E, $AA, $DD, $82, $06, $AA, $FB, $AA ; $07ABE7 |
  db $E7, $28, $FD, $A2, $F1, $A0, $9D, $28 ; $07ABEF |
  db $29, $AA, $38, $AA, $EF, $AA, $71, $A2 ; $07ABF7 |
  db $61, $80, $94, $F4, $A8, $30, $D0, $10 ; $07ABFF |
  db $90, $B0, $D0, $10, $28, $A8, $D0, $48 ; $07AC07 |
  db $68, $F0, $68, $88, $A8, $70, $C8, $F0 ; $07AC0F |
  db $10, $B0, $C8, $50, $70, $90, $B0, $D0 ; $07AC17 |
  db $78, $A8, $28, $E8, $B8, $E8, $48, $88 ; $07AC1F |
  db $E8, $38, $88, $F8, $E8, $88, $C0, $FF ; $07AC27 |
  db $10, $00, $14, $0C, $00, $40, $40, $00 ; $07AC2F |
  db $44, $8A, $04, $44, $30, $81, $53, $88 ; $07AC37 |
  db $40, $08, $44, $00, $10, $84, $01, $00 ; $07AC3F |
  db $00, $04, $04, $20, $00, $85, $11, $91 ; $07AC47 |
  db $10, $34, $00, $04, $04, $50, $00, $E0 ; $07AC4F |
  db $20, $52, $40, $80, $00, $CA, $41, $10 ; $07AC57 |
  db $00, $84, $40, $09, $42, $1A, $14, $00 ; $07AC5F |
  db $00, $11, $14, $85, $24, $01, $01, $22 ; $07AC67 |
  db $40, $91, $44, $01, $50, $24, $10, $AC ; $07AC6F |
  db $00, $0C, $02, $00, $44, $06, $13, $32 ; $07AC77 |
  db $40, $83, $00, $44, $44, $10, $00, $04 ; $07AC7F |
  db $00, $20, $40, $41, $00, $24, $01, $C5 ; $07AC87 |
  db $05, $04, $04, $20, $10, $94, $40, $02 ; $07AC8F |
  db $00, $09, $11, $45, $10, $28, $00, $99 ; $07AC97 |
  db $14, $29, $40, $00, $70, $C1, $04, $BC ; $07AC9F |
  db $04, $C1, $15, $20, $40, $06, $00, $21 ; $07ACA7 |
  db $41, $1B, $44, $32, $00, $41, $94, $80 ; $07ACAF |
  db $34, $12, $55, $20, $54, $60, $02, $02 ; $07ACB7 |
  db $41, $41, $04, $A0, $04, $C0, $05, $13 ; $07ACBF |
  db $00, $00, $00, $20, $10, $88, $40, $24 ; $07ACC7 |
  db $40, $94, $42, $08, $01, $01, $00, $80 ; $07ACCF |
  db $40, $84, $04, $00, $10, $02, $10, $83 ; $07ACD7 |
  db $00, $14, $64, $D0, $51, $4A, $15, $66 ; $07ACDF |
  db $55, $22, $51, $18, $05, $8A, $01, $51 ; $07ACE7 |
  db $44, $00, $10, $98, $44, $A6, $91, $8B ; $07ACEF |
  db $01, $89, $50, $CB, $40, $00, $10, $D0 ; $07ACF7 |
  db $4C, $84, $98, $B8, $84, $00, $78, $78 ; $07ACFF |
  db $B8, $98, $68, $68, $20, $74, $78, $20 ; $07AD07 |
  db $74, $58, $54, $20, $74, $78, $20, $74 ; $07AD0F |
  db $58, $78, $20, $5C, $5C, $5C, $5C, $B8 ; $07AD17 |
  db $B8, $98, $78, $58, $04, $04, $04, $04 ; $07AD1F |
  db $04, $04, $04, $98, $18, $18, $00, $FF ; $07AD27 |
  db $40, $82, $00, $0A, $40, $A0, $10, $01 ; $07AD2F |
  db $44, $21, $08, $41, $51, $86, $00, $40 ; $07AD37 |
  db $74, $52, $50, $0A, $00, $A0, $00, $88 ; $07AD3F |
  db $01, $00, $01, $02, $00, $72, $00, $00 ; $07AD47 |
  db $05, $21, $00, $10, $11, $00, $50, $2A ; $07AD4F |
  db $04, $01, $10, $C2, $00, $21, $01, $80 ; $07AD57 |
  db $41, $81, $41, $04, $00, $80, $04, $65 ; $07AD5F |
  db $10, $A6, $04, $AC, $01, $1C, $00, $33 ; $07AD67 |
  db $40, $F0, $05, $30, $44, $81, $02, $89 ; $07AD6F |
  db $01, $A4, $00, $DC, $04, $BB, $04, $24 ; $07AD77 |
  db $01, $88, $10, $01, $00, $40, $04, $00 ; $07AD7F |
  db $00, $00, $00, $40, $00, $C8, $00, $23 ; $07AD87 |
  db $01, $01, $10, $1B, $00, $60, $00, $80 ; $07AD8F |
  db $35, $29, $00, $C0, $00, $02, $04, $C0 ; $07AD97 |
  db $04, $18, $10, $51, $01, $04, $41, $F5 ; $07AD9F |
  db $00, $90, $54, $A0, $00, $02, $01, $9C ; $07ADA7 |
  db $00, $84, $00, $66, $10, $62, $44, $00 ; $07ADAF |
  db $10, $8C, $11, $09, $00, $41, $50, $88 ; $07ADB7 |
  db $05, $08, $00, $5A, $04, $0A, $00, $80 ; $07ADBF |
  db $10, $02, $00, $10, $00, $80, $00, $38 ; $07ADC7 |
  db $00, $21, $12, $14, $00, $68, $04, $21 ; $07ADCF |
  db $00, $32, $00, $E9, $01, $12, $11, $54 ; $07ADD7 |
  db $04, $1F, $00, $2E, $11, $4B, $00, $C0 ; $07ADDF |
  db $41, $2B, $00, $85, $11, $05, $1F, $28 ; $07ADE7 |
  db $00, $6D, $10, $B3, $10, $56, $14, $C2 ; $07ADEF |
  db $45, $8E, $40, $31, $14, $23, $01, $4E ; $07ADF7 |
  db $09, $02, $26, $26, $12, $3E, $36, $36 ; $07ADFF |
  db $36, $36, $36, $36, $3A, $37, $36, $3A ; $07AE07 |
  db $37, $36, $37, $3A, $37, $36, $3A, $37 ; $07AE0F |
  db $36, $36, $3A, $53, $53, $53, $53, $26 ; $07AE17 |
  db $26, $26, $26, $26, $38, $38, $38, $38 ; $07AE1F |
  db $38, $38, $38, $26, $08, $08, $4E, $FF ; $07AE27 |
  db $04, $08, $00, $91, $14, $31, $50, $2B ; $07AE2F |
  db $00, $2A, $41, $70, $10, $10, $00, $48 ; $07AE37 |
  db $11, $28, $40, $20, $40, $D3, $00, $18 ; $07AE3F |
  db $00, $00, $10, $00, $40, $21, $01, $44 ; $07AE47 |
  db $00, $00, $00, $62, $10, $10, $04, $21 ; $07AE4F |
  db $00, $30, $10, $A1, $02, $90, $00, $68 ; $07AE57 |
  db $50, $98, $00, $8F, $45, $0A, $14, $22 ; $07AE5F |
  db $40, $C6, $C0, $03, $51, $D8, $40, $E4 ; $07AE67 |
  db $70, $42, $10, $28, $04, $54, $10, $83 ; $07AE6F |
  db $00, $C2, $94, $84, $45, $BA, $80, $16 ; $07AE77 |
  db $C0, $20, $01, $40, $00, $80, $00, $02 ; $07AE7F |
  db $00, $64, $40, $18, $51, $2A, $00, $62 ; $07AE87 |
  db $11, $35, $00, $80, $04, $08, $04, $40 ; $07AE8F |
  db $04, $00, $41, $65, $10, $02, $00, $01 ; $07AE97 |
  db $D9, $84, $10, $00, $00, $59, $10, $22 ; $07AE9F |
  db $64, $82, $10, $C0, $00, $02, $01, $08 ; $07AEA7 |
  db $40, $C2, $00, $0A, $00, $0E, $45, $98 ; $07AEAF |
  db $10, $1C, $00, $10, $20, $35, $01, $CA ; $07AEB7 |
  db $10, $00, $00, $00, $40, $10, $00, $62 ; $07AEBF |
  db $00, $E0, $10, $20, $01, $8A, $05, $40 ; $07AEC7 |
  db $00, $42, $90, $01, $18, $00, $04, $29 ; $07AECF |
  db $05, $50, $01, $00, $00, $30, $50, $54 ; $07AED7 |
  db $48, $C5, $14, $26, $10, $ED, $45, $9A ; $07AEDF |
  db $00, $88, $85, $EA, $01, $98, $34, $52 ; $07AEE7 |
  db $15, $06, $14, $34, $45, $50, $14, $32 ; $07AEEF |
  db $45, $00, $44, $73, $40, $38, $44, $89 ; $07AEF7 |
  db $40, $00, $01, $02, $03, $01, $02, $03 ; $07AEFF |
  db $00, $04, $05, $05, $05, $05, $05, $05 ; $07AF07 |
  db $04, $06, $07, $07, $07, $07, $07, $07 ; $07AF0F |
  db $06, $08, $09, $09, $09, $09, $09, $09 ; $07AF17 |
  db $08, $0A, $09, $09, $09, $09, $09, $09 ; $07AF1F |
  db $0A, $00, $09, $09, $0B, $0B, $09, $09 ; $07AF27 |
  db $00, $04, $09, $09, $0C, $0C, $09, $09 ; $07AF2F |
  db $04, $06, $09, $09, $0D, $0D, $09, $09 ; $07AF37 |
  db $06, $08, $0E, $0E, $0D, $0D, $0E, $0E ; $07AF3F |
  db $08, $0A, $0E, $0E, $0F, $0F, $0E, $0E ; $07AF47 |
  db $0A, $00, $0E, $0E, $10, $10, $0E, $0E ; $07AF4F |
  db $00, $04, $0E, $0E, $0E, $0E, $0E, $0E ; $07AF57 |
  db $04, $06, $0E, $0E, $11, $12, $0E, $0E ; $07AF5F |
  db $06, $13, $14, $14, $15, $16, $14, $14 ; $07AF67 |
  db $13, $17, $18, $19, $0E, $0E, $18, $19 ; $07AF6F |
  db $17, $1A, $1B, $1C, $0E, $0E, $1B, $1C ; $07AF77 |
  db $1A, $04, $1D, $1E, $09, $09, $1D, $1E ; $07AF7F |
  db $04, $06, $1F, $20, $09, $09, $1F, $20 ; $07AF87 |
  db $06, $13, $01, $03, $09, $09, $01, $03 ; $07AF8F |
  db $13, $17, $21, $21, $09, $09, $18, $19 ; $07AF97 |
  db $17, $22, $23, $23, $0B, $0B, $1B, $1C ; $07AF9F |
  db $22, $24, $0E, $0E, $18, $19, $25, $26 ; $07AFA7 |
  db $24, $08, $0E, $0E, $1B, $1C, $1F, $20 ; $07AFAF |
  db $08, $0A, $0E, $0E, $27, $28, $27, $28 ; $07AFB7 |
  db $0A, $17, $09, $09, $1F, $20, $25, $26 ; $07AFBF |
  db $1A, $22, $09, $09, $01, $03, $01, $03 ; $07AFC7 |
  db $1A, $24, $09, $09, $29, $2A, $2B, $2C ; $07AFCF |
  db $2D, $08, $09, $09, $2E, $2F, $30, $31 ; $07AFD7 |
  db $32, $0A, $09, $09, $33, $34, $35, $36 ; $07AFDF |
  db $37, $00, $09, $09, $38, $0C, $39, $3A ; $07AFE7 |
  db $3B, $04, $3C, $3C, $3D, $3E, $18, $3F ; $07AFEF |
  db $19, $06, $40, $40, $41, $41, $42, $43 ; $07AFF7 |
  db $44, $45, $46, $47, $20, $25, $48, $49 ; $07AFFF |
  db $17, $25, $47, $46, $49, $45, $4A, $4B ; $07B007 |
  db $22, $01, $02, $02, $03, $01, $02, $03 ; $07B00F |
  db $24, $4C, $4D, $4E, $32, $4C, $4D, $32 ; $07B017 |
  db $08, $4F, $35, $50, $37, $4F, $35, $51 ; $07B01F |
  db $0A, $0C, $0C, $0C, $0C, $0C, $0C, $52 ; $07B027 |
  db $00, $24, $24, $24, $24, $24, $24, $3B ; $07B02F |
  db $04, $08, $08, $0D, $0A, $0A, $0A, $3B ; $07B037 |
  db $06, $24, $53, $0F, $54, $54, $54, $3B ; $07B03F |
  db $08, $08, $0A, $32, $32, $4D, $21, $3B ; $07B047 |
  db $0A, $0A, $54, $55, $34, $56, $3B, $3B ; $07B04F |
  db $00, $00, $21, $57, $58, $59, $3A, $3B ; $07B057 |
  db $04, $04, $3B, $5A, $5B, $5C, $5D, $3B ; $07B05F |
  db $06, $06, $3B, $5A, $5E, $5F, $5D, $3B ; $07B067 |
  db $13, $13, $60, $61, $18, $3F, $3F, $19 ; $07B06F |
  db $17, $17, $3B, $62, $42, $43, $43, $44 ; $07B077 |
  db $22, $00, $3B, $0A, $63, $64, $65, $66 ; $07B07F |
  db $67, $04, $3B, $54, $01, $02, $02, $03 ; $07B087 |
  db $0F, $06, $3B, $21, $21, $68, $69, $4D ; $07B08F |
  db $21, $13, $3B, $6A, $50, $6B, $34, $35 ; $07B097 |
  db $50, $17, $18, $3F, $6C, $6D, $6E, $3F ; $07B09F |
  db $19, $22, $1B, $6F, $6F, $70, $43, $43 ; $07B0A7 |
  db $44, $24, $25, $47, $46, $70, $47, $46 ; $07B0AF |
  db $20, $08, $01, $02, $71, $72, $73, $02 ; $07B0B7 |
  db $03, $67, $09, $09, $09, $09, $74, $34 ; $07B0BF |
  db $35, $0F, $09, $09, $09, $09, $2E, $31 ; $07B0C7 |
  db $39, $75, $09, $09, $09, $09, $76, $50 ; $07B0CF |
  db $77, $78, $09, $09, $09, $09, $79, $7A ; $07B0D7 |
  db $7B, $0C, $09, $09, $09, $09, $2E, $67 ; $07B0DF |
  db $7C, $08, $09, $09, $09, $09, $7D, $7E ; $07B0E7 |
  db $1D, $06, $3C, $3C, $3C, $3C, $7F, $80 ; $07B0EF |
  db $81, $13, $40, $40, $40, $40, $41, $41 ; $07B0F7 |
  db $1F, $82, $09, $09, $83, $84, $34, $35 ; $07B0FF |
  db $50, $82, $09, $09, $83, $30, $31, $39 ; $07B107 |
  db $3A, $82, $09, $09, $85, $35, $36, $77 ; $07B10F |
  db $4F, $86, $09, $09, $83, $39, $3A, $87 ; $07B117 |
  db $31, $88, $09, $09, $83, $89, $18, $19 ; $07B11F |
  db $3B, $1E, $09, $09, $18, $19, $1B, $1C ; $07B127 |
  db $0C, $49, $3C, $3C, $1B, $1C, $1F, $49 ; $07B12F |
  db $08, $20, $40, $40, $1F, $49, $81, $26 ; $07B137 |
  db $06, $6B, $34, $35, $50, $78, $09, $09 ; $07B13F |
  db $09, $30, $31, $39, $3A, $82, $09, $09 ; $07B147 |
  db $09, $35, $36, $77, $4F, $8A, $09, $09 ; $07B14F |
  db $09, $39, $3A, $87, $31, $8B, $09, $09 ; $07B157 |
  db $0C, $89, $5D, $87, $0C, $8B, $09, $0C ; $07B15F |
  db $08, $89, $4F, $0C, $08, $18, $19, $08 ; $07B167 |
  db $06, $18, $19, $08, $06, $1B, $1C, $06 ; $07B16F |
  db $13, $1B, $1C, $06, $13, $1F, $49, $13 ; $07B177 |
  db $17, $83, $84, $34, $35, $50, $6B, $34 ; $07B17F |
  db $35, $83, $30, $31, $39, $3A, $30, $31 ; $07B187 |
  db $39, $85, $35, $36, $77, $4F, $35, $8C ; $07B18F |
  db $77, $83, $39, $3A, $0C, $31, $39, $67 ; $07B197 |
  db $87, $83, $89, $0C, $08, $18, $19, $53 ; $07B19F |
  db $87, $0C, $89, $08, $06, $1B, $1C, $0A ; $07B1A7 |
  db $0C, $08, $8D, $06, $13, $1F, $20, $8E ; $07B1AF |
  db $8F, $0D, $6F, $13, $17, $25, $49, $7F ; $07B1B7 |
  db $7F, $50, $82, $09, $09, $09, $09, $83 ; $07B1BF |
  db $6B, $3A, $82, $09, $09, $09, $09, $83 ; $07B1C7 |
  db $30, $4F, $8A, $09, $09, $09, $09, $85 ; $07B1CF |
  db $35, $3B, $8B, $09, $09, $09, $09, $83 ; $07B1D7 |
  db $39, $31, $8B, $09, $18, $19, $09, $83 ; $07B1DF |
  db $0C, $3B, $8B, $0C, $1B, $1C, $18, $19 ; $07B1E7 |
  db $08, $60, $90, $08, $1F, $20, $1B, $1C ; $07B1EF |
  db $06, $6F, $6F, $06, $25, $49, $1F, $20 ; $07B1F7 |
  db $13, $34, $35, $50, $6B, $91, $92, $31 ; $07B1FF |
  db $13, $31, $39, $3A, $30, $31, $93, $3B ; $07B207 |
  db $17, $36, $77, $4F, $35, $36, $94, $3B ; $07B20F |
  db $22, $0C, $87, $31, $39, $3A, $95, $3B ; $07B217 |
  db $24, $08, $0C, $96, $89, $18, $19, $3B ; $07B21F |
  db $08, $06, $08, $18, $19, $1B, $1C, $3B ; $07B227 |
  db $0A, $13, $06, $1B, $1C, $25, $49, $3B ; $07B22F |
  db $00, $17, $13, $27, $97, $27, $97, $3B ; $07B237 |
  db $04, $00, $54, $01, $03, $01, $03, $3B ; $07B23F |
  db $24, $67, $32, $98, $99, $21, $9A, $3B ; $07B247 |
  db $08, $24, $9B, $9B, $39, $50, $9C, $3B ; $07B24F |
  db $0A, $08, $9B, $9D, $9E, $9E, $9E, $9E ; $07B257 |
  db $54, $0A, $55, $2C, $99, $21, $68, $9F ; $07B25F |
  db $99, $00, $3B, $3B, $39, $3A, $87, $31 ; $07B267 |
  db $39, $67, $A0, $A0, $A1, $18, $3F, $3F ; $07B26F |
  db $19, $24, $6F, $6F, $0D, $1B, $6F, $6F ; $07B277 |
  db $44, $18, $19, $24, $25, $A2, $49, $08 ; $07B27F |
  db $1F, $1B, $1C, $08, $1F, $A2, $26, $0A ; $07B287 |
  db $01, $1F, $26, $0A, $01, $02, $03, $54 ; $07B28F |
  db $4D, $01, $03, $54, $4D, $21, $A3, $9F ; $07B297 |
  db $35, $21, $68, $9F, $35, $50, $77, $3B ; $07B29F |
  db $39, $3A, $87, $31, $39, $38, $18, $3F ; $07B2A7 |
  db $19, $18, $3F, $3F, $19, $67, $1B, $6F ; $07B2AF |
  db $1C, $1B, $6F, $6F, $1C, $24, $01, $02 ; $07B2B7 |
  db $03, $A2, $26, $0A, $01, $02, $03, $54 ; $07B2BF |
  db $3B, $02, $03, $54, $4D, $21, $A3, $4C ; $07B2C7 |
  db $3B, $21, $A3, $9F, $35, $50, $77, $4F ; $07B2CF |
  db $A4, $50, $77, $31, $39, $38, $18, $19 ; $07B2D7 |
  db $38, $38, $18, $3F, $19, $67, $1B, $1C ; $07B2DF |
  db $67, $67, $1B, $6F, $1C, $24, $01, $03 ; $07B2E7 |
  db $24, $24, $01, $02, $03, $08, $18, $19 ; $07B2EF |
  db $08, $A5, $18, $3F, $19, $0A, $1B, $1C ; $07B2F7 |
  db $0A, $09, $3B, $A6, $3B, $A6, $09, $3B ; $07B2FF |
  db $A6, $09, $3B, $A6, $3B, $A6, $09, $3B ; $07B307 |
  db $A6, $09, $A7, $A6, $A7, $A6, $09, $3B ; $07B30F |
  db $A8, $09, $3B, $A6, $3B, $A6, $09, $3B ; $07B317 |
  db $A6, $09, $3B, $A6, $3B, $A6, $09, $3B ; $07B31F |
  db $A6, $09, $A9, $AA, $A9, $AA, $09, $A9 ; $07B327 |
  db $AA, $AB, $AC, $AD, $AE, $AF, $AB, $AC ; $07B32F |
  db $AD, $B0, $B1, $B0, $B1, $B0, $B0, $B1 ; $07B337 |
  db $B0, $3B, $A6, $09, $3B, $A6, $3B, $A6 ; $07B33F |
  db $09, $3B, $A6, $09, $3B, $A6, $3B, $A6 ; $07B347 |
  db $09, $3B, $A8, $09, $A7, $A6, $A7, $A6 ; $07B34F |
  db $09, $3B, $A6, $09, $3B, $A6, $3B, $A6 ; $07B357 |
  db $09, $3B, $A6, $09, $3B, $A6, $3B, $A6 ; $07B35F |
  db $09, $A9, $AA, $09, $A9, $AA, $A9, $AA ; $07B367 |
  db $09, $AE, $AF, $AB, $AC, $B2, $AE, $AF ; $07B36F |
  db $AB, $B1, $B0, $B0, $B1, $64, $B1, $B0 ; $07B377 |
  db $B0, $3B, $A6, $3B, $A6, $09, $5D, $84 ; $07B37F |
  db $34, $3B, $A6, $3B, $A6, $09, $5D, $30 ; $07B387 |
  db $31, $3B, $A8, $3B, $A8, $09, $4F, $35 ; $07B38F |
  db $36, $3B, $A6, $3B, $A6, $09, $3B, $39 ; $07B397 |
  db $3A, $3B, $A6, $3B, $A6, $09, $3B, $89 ; $07B39F |
  db $5D, $A9, $AA, $A9, $AA, $09, $3B, $89 ; $07B3A7 |
  db $38, $AC, $B2, $AE, $AF, $AB, $18, $19 ; $07B3AF |
  db $67, $B1, $B0, $B1, $B0, $B0, $1B, $1C ; $07B3B7 |
  db $24, $B3, $3B, $84, $34, $B3, $3B, $84 ; $07B3BF |
  db $34, $39, $3A, $30, $31, $39, $3A, $30 ; $07B3C7 |
  db $31, $77, $4F, $35, $36, $77, $4F, $35 ; $07B3CF |
  db $36, $87, $3B, $39, $3A, $87, $3B, $39 ; $07B3D7 |
  db $3A, $87, $3B, $89, $18, $3F, $19, $18 ; $07B3DF |
  db $3F, $18, $3F, $19, $1B, $6F, $1C, $1B ; $07B3E7 |
  db $6F, $1B, $6F, $1C, $01, $02, $03, $01 ; $07B3EF |
  db $02, $25, $B4, $26, $18, $3F, $19, $18 ; $07B3F7 |
  db $3F, $B3, $3B, $84, $34, $B3, $3B, $3B ; $07B3FF |
  db $54, $39, $3A, $30, $31, $39, $3A, $3B ; $07B407 |
  db $B5, $77, $4F, $35, $36, $77, $5D, $3B ; $07B40F |
  db $B6, $87, $3B, $39, $3A, $38, $18, $3F ; $07B417 |
  db $19, $19, $18, $3F, $19, $67, $1B, $6F ; $07B41F |
  db $1C, $1C, $1B, $6F, $1C, $24, $01, $02 ; $07B427 |
  db $03, $03, $01, $02, $03, $08, $18, $3F ; $07B42F |
  db $19, $19, $18, $3F, $19, $0A, $1B, $6F ; $07B437 |
  db $1C, $01, $02, $02, $03, $01, $02, $71 ; $07B43F |
  db $B7, $B8, $21, $21, $21, $21, $21, $21 ; $07B447 |
  db $B5, $B9, $A7, $3B, $3B, $3B, $A7, $3B ; $07B44F |
  db $B6, $18, $6C, $6D, $6E, $19, $18, $6C ; $07B457 |
  db $BA, $1B, $6F, $70, $6F, $1C, $1B, $6F ; $07B45F |
  db $BB, $01, $71, $72, $73, $03, $01, $71 ; $07B467 |
  db $BC, $18, $6C, $6D, $6E, $19, $18, $6C ; $07B46F |
  db $BD, $1B, $6F, $70, $6F, $1C, $1B, $6F ; $07B477 |
  db $BE, $BF, $73, $02, $03, $01, $02, $71 ; $07B47F |
  db $C0, $C1, $C2, $32, $C3, $C4, $C2, $21 ; $07B487 |
  db $C5, $C6, $C7, $C8, $C9, $96, $C7, $CA ; $07B48F |
  db $CB, $CC, $CD, $CE, $CF, $5D, $CD, $CE ; $07B497 |
  db $D0, $D1, $C9, $96, $87, $D2, $C9, $D3 ; $07B49F |
  db $D4, $D5, $89, $5D, $87, $D6, $89, $95 ; $07B4A7 |
  db $D7, $D8, $6E, $3F, $19, $18, $3F, $6C ; $07B4AF |
  db $BD, $D9, $6F, $6F, $1C, $1B, $6F, $6F ; $07B4B7 |
  db $BE, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4BF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4C7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4CF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4D7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4DF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4E7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4EF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4F7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B4FF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B507 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B50F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B517 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B51F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B527 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B52F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B537 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B53F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B547 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B54F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B557 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B55F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B567 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B56F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B577 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B57F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B587 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B58F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B597 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B59F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5A7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5AF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5B7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5BF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5C7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5CF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5D7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5DF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5E7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5EF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5F7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B5FF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B607 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B60F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B617 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B61F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B627 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B62F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B637 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B63F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B647 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B64F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B657 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B65F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B667 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B66F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B677 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B67F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B687 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B68F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B697 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B69F |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6A7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6AF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6B7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6BF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6C7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6CF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6D7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6DF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6E7 |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6EF |
  db $4A, $4A, $4A, $4A, $4A, $4A, $4A, $4A ; $07B6F7 |
  db $4A, $1D, $1E, $25, $26, $7C, $7D, $1B ; $07B6FF |
  db $05, $6E, $6E, $05, $05, $7E, $7F, $05 ; $07B707 |
  db $1C, $09, $0A, $8E, $8F, $34, $34, $61 ; $07B70F |
  db $61, $86, $87, $11, $12, $69, $69, $14 ; $07B717 |
  db $15, $11, $12, $8E, $8F, $16, $17, $17 ; $07B71F |
  db $16, $19, $1A, $25, $26, $16, $17, $24 ; $07B727 |
  db $23, $01, $02, $09, $0A, $11, $12, $11 ; $07B72F |
  db $12, $17, $16, $16, $17, $19, $1A, $2A ; $07B737 |
  db $2B, $36, $35, $16, $17, $17, $23, $16 ; $07B73F |
  db $70, $24, $16, $71, $17, $8E, $8F, $19 ; $07B747 |
  db $1A, $17, $16, $23, $24, $17, $35, $16 ; $07B74F |
  db $17, $36, $16, $16, $17, $25, $26, $1D ; $07B757 |
  db $1E, $0C, $04, $6C, $65, $04, $0D, $66 ; $07B75F |
  db $6F, $25, $26, $25, $26, $74, $07, $74 ; $07B767 |
  db $0F, $06, $77, $0E, $77, $74, $0F, $74 ; $07B76F |
  db $00, $0E, $77, $10, $77, $74, $00, $74 ; $07B777 |
  db $08, $00, $77, $00, $77, $34, $34, $33 ; $07B77F |
  db $33, $25, $26, $09, $0A, $61, $61, $15 ; $07B787 |
  db $14, $8E, $8F, $86, $87, $74, $00, $74 ; $07B78F |
  db $00, $10, $77, $00, $77, $74, $00, $7C ; $07B797 |
  db $7D, $10, $77, $7E, $7F, $38, $34, $2F ; $07B79F |
  db $33, $55, $34, $43, $33, $34, $57, $4C ; $07B7A7 |
  db $50, $34, $56, $47, $40, $25, $26, $2A ; $07B7AF |
  db $2B, $2F, $33, $2F, $33, $54, $52, $32 ; $07B7B7 |
  db $48, $43, $4F, $43, $4F, $33, $33, $32 ; $07B7BF |
  db $33, $34, $56, $33, $48, $2F, $33, $2F ; $07B7C7 |
  db $4C, $33, $48, $47, $40, $44, $45, $41 ; $07B7CF |
  db $42, $46, $46, $33, $33, $46, $53, $33 ; $07B7D7 |
  db $33, $01, $02, $1D, $1E, $49, $4A, $4E ; $07B7DF |
  db $4F, $4B, $52, $48, $48, $33, $33, $33 ; $07B7E7 |
  db $33, $04, $04, $3B, $3C, $80, $81, $8C ; $07B7EF |
  db $8D, $82, $83, $8C, $8D, $04, $04, $6D ; $07B7F7 |
  db $6D, $30, $31, $0E, $0F, $8A, $8B, $8A ; $07B7FF |
  db $8B, $74, $06, $74, $0E, $07, $06, $0F ; $07B807 |
  db $0E, $07, $77, $0F, $77, $74, $08, $74 ; $07B80F |
  db $10, $00, $08, $00, $00, $00, $08, $00 ; $07B817 |
  db $08, $10, $00, $00, $08, $08, $77, $10 ; $07B81F |
  db $77, $00, $00, $00, $00, $08, $77, $00 ; $07B827 |
  db $77, $56, $56, $48, $48, $55, $57, $43 ; $07B82F |
  db $4F, $34, $34, $32, $33, $48, $48, $58 ; $07B837 |
  db $40, $46, $46, $33, $32, $46, $53, $33 ; $07B83F |
  db $32, $4B, $51, $58, $47, $8E, $8F, $11 ; $07B847 |
  db $12, $1D, $1E, $2A, $2B, $33, $48, $33 ; $07B84F |
  db $58, $43, $4F, $41, $42, $33, $33, $33 ; $07B857 |
  db $59, $33, $33, $46, $46, $49, $4A, $4D ; $07B85F |
  db $4F, $33, $43, $33, $43, $59, $46, $43 ; $07B867 |
  db $33, $53, $4F, $33, $4F, $48, $48, $48 ; $07B86F |
  db $48, $43, $33, $43, $33, $33, $4F, $33 ; $07B877 |
  db $4F, $04, $04, $34, $34, $0B, $02, $1D ; $07B87F |
  db $1E, $09, $0A, $19, $1A, $74, $0E, $74 ; $07B887 |
  db $00, $0F, $0E, $00, $08, $0F, $0E, $00 ; $07B88F |
  db $00, $0F, $77, $10, $77, $09, $0A, $11 ; $07B897 |
  db $12, $56, $57, $48, $4F, $34, $56, $32 ; $07B89F |
  db $48, $33, $59, $33, $43, $53, $4F, $4C ; $07B8A7 |
  db $50, $04, $04, $6D, $66, $0D, $0C, $6F ; $07B8AF |
  db $6C, $04, $04, $65, $6D, $06, $07, $0E ; $07B8B7 |
  db $0F, $77, $74, $77, $74, $6E, $7E, $05 ; $07B8BF |
  db $05, $7F, $7C, $1C, $1B, $7D, $6E, $05 ; $07B8C7 |
  db $05, $2F, $48, $2F, $58, $56, $38, $48 ; $07B8CF |
  db $2F, $2F, $59, $2F, $43, $4D, $4F, $48 ; $07B8D7 |
  db $4F, $53, $2F, $33, $2F, $2F, $43, $2F ; $07B8DF |
  db $54, $33, $33, $01, $02, $48, $4F, $0C ; $07B8E7 |
  db $04, $6C, $65, $74, $07, $01, $02, $80 ; $07B8EF |
  db $81, $8E, $8F, $82, $83, $2D, $2E, $8A ; $07B8F7 |
  db $8B, $8A, $8B, $8C, $8D, $74, $08, $74 ; $07B8FF |
  db $00, $33, $2F, $33, $2F, $2F, $48, $2F ; $07B907 |
  db $48, $33, $4F, $4C, $50, $2F, $48, $2F ; $07B90F |
  db $5C, $33, $2F, $04, $0D, $48, $4F, $48 ; $07B917 |
  db $4F, $66, $6F, $06, $77, $4E, $4F, $4E ; $07B91F |
  db $4F, $33, $2F, $5A, $2F, $5B, $2F, $5B ; $07B927 |
  db $2F, $46, $46, $01, $02, $04, $04, $5E ; $07B92F |
  db $57, $1D, $1E, $80, $81, $11, $12, $82 ; $07B937 |
  db $83, $04, $04, $34, $38, $33, $33, $47 ; $07B93F |
  db $47, $4E, $33, $5F, $33, $4E, $33, $4E ; $07B947 |
  db $33, $4D, $33, $48, $33, $48, $33, $48 ; $07B94F |
  db $33, $33, $33, $4B, $52, $08, $77, $7E ; $07B957 |
  db $7F, $34, $56, $33, $5C, $56, $57, $41 ; $07B95F |
  db $42, $56, $34, $48, $33, $33, $48, $33 ; $07B967 |
  db $48, $53, $33, $33, $33, $0C, $04, $1B ; $07B96F |
  db $05, $04, $04, $05, $05, $56, $56, $58 ; $07B977 |
  db $40, $04, $04, $00, $00, $0B, $02, $09 ; $07B97F |
  db $0A, $08, $00, $10, $00, $5E, $57, $4E ; $07B987 |
  db $4F, $33, $33, $5A, $33, $11, $12, $19 ; $07B98F |
  db $1A, $33, $17, $33, $16, $32, $32, $33 ; $07B997 |
  db $33, $32, $17, $33, $16, $03, $03, $00 ; $07B99F |
  db $00, $03, $17, $00, $16, $23, $24, $30 ; $07B9A7 |
  db $31, $70, $71, $06, $07, $3D, $24, $06 ; $07B9AF |
  db $31, $3E, $70, $06, $07, $71, $24, $06 ; $07B9B7 |
  db $31, $0E, $0F, $08, $00, $0F, $0F, $00 ; $07B9BF |
  db $00, $3D, $24, $06, $30, $4E, $4F, $41 ; $07B9C7 |
  db $42, $10, $00, $00, $00, $34, $27, $33 ; $07B9CF |
  db $27, $33, $27, $33, $27, $7F, $1D, $1C ; $07B9D7 |
  db $2A, $72, $34, $7A, $33, $7A, $33, $7A ; $07B9DF |
  db $33, $0D, $01, $6F, $1D, $77, $09, $77 ; $07B9E7 |
  db $11, $7F, $8E, $1C, $86, $0D, $11, $6F ; $07B9EF |
  db $8E, $77, $19, $77, $25, $1E, $7C, $2B ; $07B9F7 |
  db $1B, $7F, $86, $1C, $86, $72, $56, $7A ; $07B9FF |
  db $48, $34, $57, $33, $4F, $55, $57, $44 ; $07BA07 |
  db $45, $34, $56, $46, $53, $34, $11, $33 ; $07BA0F |
  db $8E, $7A, $48, $7A, $48, $4C, $50, $43 ; $07BA17 |
  db $4F, $47, $40, $33, $33, $41, $42, $49 ; $07BA1F |
  db $4A, $47, $47, $33, $33, $47, $19, $33 ; $07BA27 |
  db $25, $02, $48, $1E, $48, $43, $4F, $44 ; $07BA2F |
  db $45, $32, $33, $46, $46, $4E, $4F, $4D ; $07BA37 |
  db $4F, $33, $1D, $46, $25, $0A, $40, $12 ; $07BA3F |
  db $33, $58, $40, $33, $33, $33, $33, $4B ; $07BA47 |
  db $51, $33, $09, $51, $11, $8F, $33, $87 ; $07BA4F |
  db $33, $32, $33, $33, $33, $33, $8E, $33 ; $07BA57 |
  db $86, $12, $0C, $8F, $6C, $1A, $74, $26 ; $07BA5F |
  db $74, $08, $00, $00, $00, $44, $45, $01 ; $07BA67 |
  db $02, $11, $12, $86, $87, $8E, $8F, $00 ; $07BA6F |
  db $00, $1B, $05, $00, $00, $05, $05, $00 ; $07BA77 |
  db $00, $1C, $1B, $00, $00, $05, $1C, $00 ; $07BA7F |
  db $00, $19, $1A, $00, $00, $0E, $0F, $00 ; $07BA87 |
  db $00, $8A, $8B, $00, $00, $74, $08, $00 ; $07BA8F |
  db $00, $00, $77, $00, $00, $10, $77, $00 ; $07BA97 |
  db $00, $74, $00, $00, $00, $77, $74, $00 ; $07BA9F |
  db $00, $10, $08, $00, $00, $11, $12, $00 ; $07BAA7 |
  db $00, $3D, $24, $30, $31, $3E, $70, $30 ; $07BAAF |
  db $07, $3D, $24, $31, $30, $3E, $70, $31 ; $07BAB7 |
  db $07, $77, $19, $77, $25, $00, $00, $00 ; $07BABF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BAC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BACF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BAD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BADF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BAE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BAEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BAF7 |
  db $00, $00, $8C, $8E, $6B, $05, $06, $08 ; $07BAFF |
  db $0A, $00, $A8, $AA, $23, $AC, $05, $28 ; $07BB07 |
  db $2A, $00, $34, $47, $8E, $0C, $0E, $2C ; $07BB0F |
  db $2E, $00, $A4, $A6, $AE, $06, $9C, $7C ; $07BB17 |
  db $00, $34, $47, $3A, $2C, $2E, $9C, $9E ; $07BB1F |
  db $4E, $B4, $B6, $9C, $9E, $00, $99, $9E ; $07BB27 |
  db $45, $4A, $4C, $6E, $6B, $00, $01, $03 ; $07BB2F |
  db $5E, $00, $36, $38, $01, $03, $00, $00 ; $07BB37 |
  db $5E, $6B, $30, $32, $6B, $6B, $5B, $55 ; $07BB3F |
  db $6B, $6B, $50, $52, $49, $6B, $55, $6B ; $07BB47 |
  db $5B, $5B, $5D, $5D, $55, $6B, $00, $00 ; $07BB4F |
  db $00, $6B, $6B, $6B, $5A, $6B, $69, $00 ; $07BB57 |
  db $6B, $6B, $79, $7A, $00, $00, $74, $76 ; $07BB5F |
  db $00, $6B, $89, $9A, $00, $72, $76, $00 ; $07BB67 |
  db $70, $C0, $05, $00, $74, $82, $00, $00 ; $07BB6F |
  db $26, $C2, $06, $6B, $00, $82, $00, $00 ; $07BB77 |
  db $80, $C4, $C6, $C8, $CA, $00, $00, $99 ; $07BB7F |
  db $47, $00, $00, $99, $9E, $99, $9E, $99 ; $07BB87 |
  db $DB, $70, $72, $74, $76, $78, $00, $00 ; $07BB8F |
  db $00, $70, $72, $74, $76, $78, $00, $00 ; $07BB97 |
  db $00, $98, $9A, $9C, $9C, $9E, $00, $00 ; $07BB9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBAF |
  db $00, $E8, $EA, $EC, $EC, $EE, $00, $00 ; $07BBB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BBF7 |
  db $00, $00, $8D, $8F, $6B, $05, $06, $09 ; $07BBFF |
  db $0B, $10, $A9, $AB, $8D, $05, $AD, $29 ; $07BC07 |
  db $2B, $10, $35, $48, $24, $0D, $0F, $2D ; $07BC0F |
  db $2F, $00, $A5, $A7, $06, $AF, $7B, $9F ; $07BC17 |
  db $00, $35, $48, $3B, $2D, $2F, $9D, $9F ; $07BC1F |
  db $4F, $B5, $B7, $9D, $9F, $00, $9D, $CB ; $07BC27 |
  db $46, $4B, $4D, $6F, $6B, $00, $02, $04 ; $07BC2F |
  db $5F, $00, $37, $39, $02, $04, $00, $00 ; $07BC37 |
  db $5F, $54, $31, $33, $5C, $56, $55, $55 ; $07BC3F |
  db $6B, $54, $51, $53, $59, $6B, $58, $5A ; $07BC47 |
  db $6B, $6B, $5D, $65, $66, $67, $00, $00 ; $07BC4F |
  db $00, $54, $64, $6B, $6B, $54, $6B, $00 ; $07BC57 |
  db $5A, $78, $79, $6B, $00, $00, $75, $77 ; $07BC5F |
  db $00, $98, $89, $6B, $00, $73, $76, $00 ; $07BC67 |
  db $71, $05, $C1, $00, $22, $27, $00, $00 ; $07BC6F |
  db $81, $06, $C3, $6B, $00, $83, $00, $00 ; $07BC77 |
  db $81, $C5, $C7, $C9, $CB, $00, $00, $35 ; $07BC7F |
  db $48, $00, $00, $9D, $CB, $9D, $CB, $DA ; $07BC87 |
  db $48, $71, $73, $75, $77, $79, $00, $00 ; $07BC8F |
  db $00, $71, $73, $75, $77, $79, $00, $00 ; $07BC97 |
  db $00, $99, $9B, $9D, $9D, $9F, $00, $00 ; $07BC9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCAF |
  db $00, $E9, $EB, $ED, $ED, $EF, $00, $00 ; $07BCB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BCF7 |
  db $00, $00, $9C, $9E, $44, $15, $16, $18 ; $07BCFF |
  db $1A, $20, $B8, $BA, $9C, $BC, $15, $00 ; $07BD07 |
  db $00, $00, $34, $47, $9E, $1C, $1E, $1E ; $07BD0F |
  db $1C, $00, $B4, $B6, $BE, $16, $9C, $9E ; $07BD17 |
  db $00, $A4, $A6, $3A, $3C, $3E, $9C, $9E ; $07BD1F |
  db $4E, $9C, $9E, $11, $13, $00, $99, $7C ; $07BD27 |
  db $45, $18, $1A, $7E, $6B, $6B, $1E, $1C ; $07BD2F |
  db $5E, $45, $36, $38, $3C, $3E, $00, $6D ; $07BD37 |
  db $5E, $55, $40, $42, $6B, $6B, $5B, $6B ; $07BD3F |
  db $55, $6B, $60, $62, $6B, $6B, $6B, $6B ; $07BD47 |
  db $5B, $5B, $6B, $6B, $6B, $6B, $6B, $6B ; $07BD4F |
  db $5B, $6B, $6B, $69, $5A, $6B, $5A, $6B ; $07BD57 |
  db $55, $6B, $89, $8A, $00, $00, $84, $00 ; $07BD5F |
  db $00, $6B, $89, $6B, $00, $82, $00, $85 ; $07BD67 |
  db $80, $D0, $15, $6B, $84, $82, $00, $00 ; $07BD6F |
  db $80, $D2, $16, $6B, $86, $92, $86, $85 ; $07BD77 |
  db $90, $D4, $D6, $D8, $9E, $00, $00, $B0 ; $07BD7F |
  db $B2, $00, $00, $99, $9E, $A0, $A2, $99 ; $07BD87 |
  db $47, $80, $82, $84, $86, $88, $00, $00 ; $07BD8F |
  db $00, $80, $82, $84, $86, $88, $00, $00 ; $07BD97 |
  db $00, $A8, $AA, $AC, $AC, $AE, $00, $00 ; $07BD9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDAF |
  db $00, $F8, $FA, $FC, $FC, $FE, $00, $00 ; $07BDB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BDF7 |
  db $00, $00, $9D, $9F, $44, $15, $16, $19 ; $07BDFF |
  db $1B, $00, $B9, $BB, $9D, $15, $BD, $21 ; $07BE07 |
  db $00, $20, $35, $48, $9F, $1D, $1F, $1F ; $07BE0F |
  db $1D, $00, $B5, $B7, $16, $BF, $9D, $9F ; $07BE17 |
  db $00, $A5, $A7, $3B, $3D, $3F, $9D, $9F ; $07BE1F |
  db $4F, $9D, $9F, $12, $14, $00, $7B, $CB ; $07BE27 |
  db $46, $19, $1B, $7F, $6B, $6B, $1F, $1D ; $07BE2F |
  db $5F, $46, $37, $39, $3D, $3F, $6C, $00 ; $07BE37 |
  db $5F, $57, $41, $43, $5C, $5A, $6B, $6B ; $07BE3F |
  db $55, $54, $61, $63, $54, $64, $54, $5A ; $07BE47 |
  db $6B, $55, $6B, $54, $6B, $6B, $5C, $54 ; $07BE4F |
  db $6B, $68, $5C, $6B, $6B, $6A, $6B, $5A ; $07BE57 |
  db $5A, $88, $89, $6B, $00, $00, $00, $00 ; $07BE5F |
  db $00, $6B, $89, $6B, $00, $83, $00, $85 ; $07BE67 |
  db $81, $15, $D1, $6B, $00, $83, $00, $00 ; $07BE6F |
  db $81, $16, $D3, $6B, $87, $93, $85, $87 ; $07BE77 |
  db $91, $D5, $D7, $D9, $CB, $00, $00, $B1 ; $07BE7F |
  db $B3, $00, $00, $9D, $CB, $A1, $A3, $35 ; $07BE87 |
  db $48, $81, $83, $85, $87, $89, $00, $00 ; $07BE8F |
  db $00, $81, $83, $85, $87, $89, $00, $00 ; $07BE97 |
  db $00, $A9, $AB, $AD, $AD, $AF, $00, $00 ; $07BE9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEAF |
  db $00, $F9, $FB, $FD, $FD, $FF, $00, $00 ; $07BEB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BECF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BED7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BEF7 |
  db $00, $00, $13, $13, $02, $13, $13, $01 ; $07BEFF |
  db $01, $01, $13, $13, $13, $13, $13, $01 ; $07BF07 |
  db $01, $01, $13, $13, $13, $01, $01, $01 ; $07BF0F |
  db $01, $00, $13, $13, $13, $13, $13, $13 ; $07BF17 |
  db $00, $13, $13, $02, $01, $01, $13, $13 ; $07BF1F |
  db $13, $13, $13, $13, $13, $00, $13, $13 ; $07BF27 |
  db $02, $01, $01, $02, $02, $02, $01, $01 ; $07BF2F |
  db $43, $02, $12, $12, $01, $01, $01, $01 ; $07BF37 |
  db $23, $02, $02, $02, $02, $02, $02, $02 ; $07BF3F |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $07BF47 |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $07BF4F |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $07BF57 |
  db $02, $02, $02, $02, $10, $10, $13, $13 ; $07BF5F |
  db $10, $02, $02, $02, $10, $13, $13, $13 ; $07BF67 |
  db $13, $13, $13, $12, $13, $13, $10, $10 ; $07BF6F |
  db $13, $13, $13, $12, $13, $13, $13, $13 ; $07BF77 |
  db $13, $13, $13, $13, $13, $00, $00, $13 ; $07BF7F |
  db $13, $00, $00, $13, $13, $13, $13, $13 ; $07BF87 |
  db $13, $00, $00, $00, $00, $00, $00, $00 ; $07BF8F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BF97 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BF9F |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFA7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFAF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFB7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFBF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFC7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFCF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFD7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFDF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFE7 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFEF |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $07BFF7 |
  db $00                                    ; $07BFFF |

