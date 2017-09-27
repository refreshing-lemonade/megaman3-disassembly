bank $12
org $A000

  JMP code_12A058                           ; $12A000 |

  JMP code_12A364                           ; $12A003 |

  JMP code_12A424                           ; $12A006 |

  JMP code_12A7BA                           ; $12A009 |

  JMP code_12AC97                           ; $12A00C |

  JMP code_12ABD6                           ; $12A00F |

  JMP code_12AD25                           ; $12A012 |

  JMP code_12ADE0                           ; $12A015 |

  JMP code_12AE95                           ; $12A018 |

  JMP code_12B03B                           ; $12A01B |

  JMP code_12B17B                           ; $12A01E |

  JMP code_12B1DE                           ; $12A021 |

  JMP code_12B210                           ; $12A024 |

  NOP                                       ; $12A027 |
  NOP                                       ; $12A028 |
  RTS                                       ; $12A029 |

  JMP code_12B245                           ; $12A02A |

  JMP code_12B27A                           ; $12A02D |

  JMP code_12B664                           ; $12A030 |

  JMP code_12B7D8                           ; $12A033 |

  JMP code_12BA2F                           ; $12A036 |

  JMP code_12BADB                           ; $12A039 |

  JMP code_12BC0A                           ; $12A03C |

  JMP code_12BC7D                           ; $12A03F |

  JMP code_12A057                           ; $12A042 |

  JMP code_12A057                           ; $12A045 |

  JMP code_12A057                           ; $12A048 |

  JMP code_12B290                           ; $12A04B |

  JMP code_12B38A                           ; $12A04E |

  JMP code_12B3A7                           ; $12A051 |

  JMP code_12B474                           ; $12A054 |

code_12A057:
  RTS                                       ; $12A057 |

code_12A058:
  LDA $0300,x                               ; $12A058 |
  AND #$0F                                  ; $12A05B |
  TAY                                       ; $12A05D |
  LDA $A35A,y                               ; $12A05E |
  STA $00                                   ; $12A061 |
  LDA $A35F,y                               ; $12A063 |
  STA $01                                   ; $12A066 |
  JMP ($0000)                               ; $12A068 |

  LDA #$09                                  ; $12A06B |
  CMP $30                                   ; $12A06D |
  BEQ code_12A082                           ; $12A06F |
  STA $30                                   ; $12A071 |
  LDA #$80                                  ; $12A073 |
  STA $B0                                   ; $12A075 |
  STA $5A                                   ; $12A077 |
  LDA #$8E                                  ; $12A079 |
  STA $B3                                   ; $12A07B |
  LDA #$0D                                  ; $12A07D |
  JSR code_1FF898                           ; $12A07F |
code_12A082:
  LDA $B0                                   ; $12A082 |
  CMP #$9C                                  ; $12A084 |
  BNE code_12A0A1                           ; $12A086 |
  INC $0300,x                               ; $12A088 |
  LDA #$02                                  ; $12A08B |
  STA $04A0,x                               ; $12A08D |
  LDA #$FF                                  ; $12A090 |
  STA $0500,x                               ; $12A092 |
  LDA #$01                                  ; $12A095 |
  STA $10                                   ; $12A097 |
code_12A099:
  LDA $0500,x                               ; $12A099 |
  BEQ code_12A0A2                           ; $12A09C |
  DEC $0500,x                               ; $12A09E |
code_12A0A1:
  RTS                                       ; $12A0A1 |

code_12A0A2:
  JSR code_1FFC53                           ; $12A0A2 |
  STX $00                                   ; $12A0A5 |
  LDA $0520,x                               ; $12A0A7 |
  STA $0500,y                               ; $12A0AA |
  TAX                                       ; $12A0AD |
  LDA $A59D,x                               ; $12A0AE |
  STA $03C0,y                               ; $12A0B1 |
  LDA $10                                   ; $12A0B4 |
  AND #$01                                  ; $12A0B6 |
  BNE code_12A0C6                           ; $12A0B8 |
  LDA $A5E5,x                               ; $12A0BA |
  STA $0360,y                               ; $12A0BD |
  LDA #$71                                  ; $12A0C0 |
  STA $01                                   ; $12A0C2 |
  BNE code_12A0CF                           ; $12A0C4 |
code_12A0C6:
  LDA #$04                                  ; $12A0C6 |
  STA $0360,y                               ; $12A0C8 |
  LDA #$7E                                  ; $12A0CB |
  STA $01                                   ; $12A0CD |
code_12A0CF:
  LDA #$80                                  ; $12A0CF |
  STA $0300,y                               ; $12A0D1 |
  STA $0480,y                               ; $12A0D4 |
  LDA #$90                                  ; $12A0D7 |
  STA $0580,y                               ; $12A0D9 |
  LDA $01                                   ; $12A0DC |
  STA $05C0,y                               ; $12A0DE |
  LDA $10                                   ; $12A0E1 |
  STA $04A0,y                               ; $12A0E3 |
  LDA #$00                                  ; $12A0E6 |
  STA $03E0,y                               ; $12A0E8 |
  STA $05E0,y                               ; $12A0EB |
  STA $05A0,y                               ; $12A0EE |
  STA $0400,y                               ; $12A0F1 |
  LDA #$04                                  ; $12A0F4 |
  STA $0420,y                               ; $12A0F6 |
  LDA $F9                                   ; $12A0F9 |
  STA $0380,y                               ; $12A0FB |
  LDA #$E1                                  ; $12A0FE |
  STA $0320,y                               ; $12A100 |
  LDA $10                                   ; $12A103 |
  AND #$01                                  ; $12A105 |
  BNE code_12A10E                           ; $12A107 |
  TXA                                       ; $12A109 |
  CLC                                       ; $12A10A |
  ADC #$18                                  ; $12A10B |
  TAX                                       ; $12A10D |
code_12A10E:
  LDA $A601,x                               ; $12A10E |
  LDX $00                                   ; $12A111 |
  STA $0500,x                               ; $12A113 |
  INC $0520,x                               ; $12A116 |
  LDA $0500,x                               ; $12A119 |
  BNE code_12A13D                           ; $12A11C |
  LDA $04A0,x                               ; $12A11E |
  EOR #$03                                  ; $12A121 |
  STA $04A0,x                               ; $12A123 |
  LDA #$82                                  ; $12A126 |
  STA $0300,x                               ; $12A128 |
  LDA #$78                                  ; $12A12B |
  STA $0500,x                               ; $12A12D |
  LDA #$03                                  ; $12A130 |
  STA $0520,x                               ; $12A132 |
  LDA #$00                                  ; $12A135 |
  STA $05E0,x                               ; $12A137 |
  STA $05A0,x                               ; $12A13A |
code_12A13D:
  RTS                                       ; $12A13D |

  LDA $0480,x                               ; $12A13E |
  PHA                                       ; $12A141 |
  LDA #$18                                  ; $12A142 |
  STA $0480,x                               ; $12A144 |
  LDA $03C0,x                               ; $12A147 |
  PHA                                       ; $12A14A |
  CLC                                       ; $12A14B |
  ADC #$20                                  ; $12A14C |
  STA $03C0,x                               ; $12A14E |
  LDA $0580,x                               ; $12A151 |
  PHA                                       ; $12A154 |
  AND #$FB                                  ; $12A155 |
  STA $0580,x                               ; $12A157 |
  JSR $8009                                 ; $12A15A |
  PLA                                       ; $12A15D |
  STA $0580,x                               ; $12A15E |
  PLA                                       ; $12A161 |
  STA $03C0,x                               ; $12A162 |
  PLA                                       ; $12A165 |
  STA $0480,x                               ; $12A166 |
  LDA $0300,x                               ; $12A169 |
  ORA #$40                                  ; $12A16C |
  STA $0300,x                               ; $12A16E |
  LDA $0500,x                               ; $12A171 |
  BNE code_12A1EA                           ; $12A174 |
  LDA $05A0,x                               ; $12A176 |
  CMP #$02                                  ; $12A179 |
  BNE code_12A1F5                           ; $12A17B |
  JSR code_1FFC53                           ; $12A17D |
  BCS code_12A1F5                           ; $12A180 |
  LDA #$58                                  ; $12A182 |
  JSR code_1FF846                           ; $12A184 |
  LDA $0360,x                               ; $12A187 |
  STA $0360,y                               ; $12A18A |
  LDA $0380,x                               ; $12A18D |
  STA $0380,y                               ; $12A190 |
  LDA $03C0,x                               ; $12A193 |
  STA $03C0,y                               ; $12A196 |
  LDA #$80                                  ; $12A199 |
  STA $0480,y                               ; $12A19B |
  LDA #$8F                                  ; $12A19E |
  STA $0320,y                               ; $12A1A0 |
  LDA #$00                                  ; $12A1A3 |
  STA $0400,y                               ; $12A1A5 |
  STA $02                                   ; $12A1A8 |
  LDA #$04                                  ; $12A1AA |
  STA $0420,y                               ; $12A1AC |
  STA $03                                   ; $12A1AF |
  STY $0F                                   ; $12A1B1 |
  STX $0E                                   ; $12A1B3 |
  LDX $0F                                   ; $12A1B5 |
  JSR code_1FFC63                           ; $12A1B7 |
  LDY $0F                                   ; $12A1BA |
  LDX $0E                                   ; $12A1BC |
  LDA $0C                                   ; $12A1BE |
  STA $04A0,y                               ; $12A1C0 |
  LDA #$15                                  ; $12A1C3 |
  STA $0500,x                               ; $12A1C5 |
  DEC $0520,x                               ; $12A1C8 |
  BNE code_12A1EA                           ; $12A1CB |
  LDA $04A0,x                               ; $12A1CD |
  AND #$02                                  ; $12A1D0 |
  TAY                                       ; $12A1D2 |
  LDA $A5FE,y                               ; $12A1D3 |
  STA $0300,x                               ; $12A1D6 |
  LDA #$1E                                  ; $12A1D9 |
  STA $0500,x                               ; $12A1DB |
  LDA #$00                                  ; $12A1DE |
  STA $0520,x                               ; $12A1E0 |
  STA $05E0,x                               ; $12A1E3 |
  STA $05A0,x                               ; $12A1E6 |
  RTS                                       ; $12A1E9 |

code_12A1EA:
  DEC $0500,x                               ; $12A1EA |
  LDA $05A0,x                               ; $12A1ED |
  BNE code_12A1F5                           ; $12A1F0 |
  STA $05E0,x                               ; $12A1F2 |
code_12A1F5:
  JSR $8003                                 ; $12A1F5 |
  LDA $04E0,x                               ; $12A1F8 |
  BNE code_12A20C                           ; $12A1FB |
  LDA #$0F                                  ; $12A1FD |
  LDY #$03                                  ; $12A1FF |
code_12A201:
  STA $0608,y                               ; $12A201 |
  STA $0628,y                               ; $12A204 |
  DEY                                       ; $12A207 |
  BPL code_12A201                           ; $12A208 |
  STY $18                                   ; $12A20A |
code_12A20C:
  RTS                                       ; $12A20C |

  LDA $0500,x                               ; $12A20D |
  BNE code_12A25C                           ; $12A210 |
  LDA $0580,x                               ; $12A212 |
  ORA #$04                                  ; $12A215 |
  STA $0580,x                               ; $12A217 |
  LDA #$38                                  ; $12A21A |
  STA $0360,x                               ; $12A21C |
  LDA $19                                   ; $12A21F |
  BEQ code_12A228                           ; $12A221 |
  INC $0500,x                               ; $12A223 |
  BNE code_12A25C                           ; $12A226 |
code_12A228:
  LDY $0520,x                               ; $12A228 |
  LDA $A6D9,y                               ; $12A22B |
  STA $0780                                 ; $12A22E |
  STA $0785                                 ; $12A231 |
  LDA $A6C1,y                               ; $12A234 |
  STA $0781                                 ; $12A237 |
  ORA #$20                                  ; $12A23A |
  STA $0786                                 ; $12A23C |
  LDA #$01                                  ; $12A23F |
  STA $0782                                 ; $12A241 |
  STA $0787                                 ; $12A244 |
  LDA #$00                                  ; $12A247 |
  STA $0783                                 ; $12A249 |
  STA $0784                                 ; $12A24C |
  STA $0788                                 ; $12A24F |
  STA $0789                                 ; $12A252 |
  LDA #$FF                                  ; $12A255 |
  STA $078A                                 ; $12A257 |
  STA $19                                   ; $12A25A |
code_12A25C:
  LDA $05A0,x                               ; $12A25C |
  BNE code_12A264                           ; $12A25F |
  STA $05E0,x                               ; $12A261 |
code_12A264:
  LDA #$02                                  ; $12A264 |
  STA $10                                   ; $12A266 |
  JMP code_12A099                           ; $12A268 |

  LDA $0500,x                               ; $12A26B |
  BEQ code_12A27C                           ; $12A26E |
  DEC $0500,x                               ; $12A270 |
  LDA $05A0,x                               ; $12A273 |
  BNE code_12A27B                           ; $12A276 |
  STA $05E0,x                               ; $12A278 |
code_12A27B:
  RTS                                       ; $12A27B |

code_12A27C:
  LDA $0580,x                               ; $12A27C |
  ORA #$04                                  ; $12A27F |
  STA $0580,x                               ; $12A281 |
  STX $00                                   ; $12A284 |
  LDY $0520,x                               ; $12A286 |
  LDA $A6F1,y                               ; $12A289 |
  STA $0780                                 ; $12A28C |
  STA $078D                                 ; $12A28F |
  LDA $A6F6,y                               ; $12A292 |
  STA $0781                                 ; $12A295 |
  ORA #$01                                  ; $12A298 |
  STA $078E                                 ; $12A29A |
  LDX #$09                                  ; $12A29D |
  STX $0782                                 ; $12A29F |
  STX $078F                                 ; $12A2A2 |
  LDA #$00                                  ; $12A2A5 |
code_12A2A7:
  STA $0783,x                               ; $12A2A7 |
  STA $0790,x                               ; $12A2AA |
  DEX                                       ; $12A2AD |
  BPL code_12A2A7                           ; $12A2AE |
  STX $079A                                 ; $12A2B0 |
  STX $1A                                   ; $12A2B3 |
  LDA #$98                                  ; $12A2B5 |
  STA $01                                   ; $12A2B7 |
  LDA $A6FB,y                               ; $12A2B9 |
  STA $02                                   ; $12A2BC |
  LDA #$00                                  ; $12A2BE |
  STA $03                                   ; $12A2C0 |
  STY $04                                   ; $12A2C2 |
code_12A2C4:
  JSR code_1FFC53                           ; $12A2C4 |
  BCS code_12A324                           ; $12A2C7 |
  LDA #$71                                  ; $12A2C9 |
  STA $05C0,y                               ; $12A2CB |
  LDA #$00                                  ; $12A2CE |
  STA $05E0,y                               ; $12A2D0 |
  STA $05A0,y                               ; $12A2D3 |
  STA $03E0,y                               ; $12A2D6 |
  STA $0440,y                               ; $12A2D9 |
  LDA #$04                                  ; $12A2DC |
  STA $0460,y                               ; $12A2DE |
  LDA #$80                                  ; $12A2E1 |
  STA $0300,y                               ; $12A2E3 |
  STA $0480,y                               ; $12A2E6 |
  LDA #$90                                  ; $12A2E9 |
  STA $0580,y                               ; $12A2EB |
  LDA #$E2                                  ; $12A2EE |
  STA $0320,y                               ; $12A2F0 |
  LDA $03                                   ; $12A2F3 |
  STA $0500,y                               ; $12A2F5 |
  LDA $F9                                   ; $12A2F8 |
  STA $0380,y                               ; $12A2FA |
  LDA $02                                   ; $12A2FD |
  STA $0360,y                               ; $12A2FF |
  LDA $01                                   ; $12A302 |
  STA $03C0,y                               ; $12A304 |
  SEC                                       ; $12A307 |
  SBC #$10                                  ; $12A308 |
  STA $01                                   ; $12A30A |
  CMP #$88                                  ; $12A30C |
  BNE code_12A31E                           ; $12A30E |
  LDX $04                                   ; $12A310 |
  LDA $A700,x                               ; $12A312 |
  STA $0540,y                               ; $12A315 |
  LDA $A705,x                               ; $12A318 |
  STA $0520,y                               ; $12A31B |
code_12A31E:
  INC $03                                   ; $12A31E |
  CMP #$48                                  ; $12A320 |
  BNE code_12A2C4                           ; $12A322 |
code_12A324:
  LDX $00                                   ; $12A324 |
  LDA #$14                                  ; $12A326 |
  STA $0500,x                               ; $12A328 |
  INC $0520,x                               ; $12A32B |
  LDA $0520,x                               ; $12A32E |
  CMP #$05                                  ; $12A331 |
  BNE code_12A359                           ; $12A333 |
  LDA $04A0,x                               ; $12A335 |
  EOR #$03                                  ; $12A338 |
  STA $04A0,x                               ; $12A33A |
  LDA #$82                                  ; $12A33D |
  STA $0300,x                               ; $12A33F |
  LDA #$C8                                  ; $12A342 |
  STA $0360,x                               ; $12A344 |
  LDA #$F0                                  ; $12A347 |
  STA $0500,x                               ; $12A349 |
  LDA #$03                                  ; $12A34C |
  STA $0520,x                               ; $12A34E |
  LDA #$00                                  ; $12A351 |
  STA $05E0,x                               ; $12A353 |
  STA $05A0,x                               ; $12A356 |
code_12A359:
  RTS                                       ; $12A359 |

  db $6B, $95, $3E, $0D, $6B, $A0, $A0, $A1 ; $12A35A |
  db $A2, $A2                               ; $12A362 |

code_12A364:
  LDA $05C0,x                               ; $12A364 |
  CMP #$71                                  ; $12A367 |
  BNE code_12A378                           ; $12A369 |
  LDA $05A0,x                               ; $12A36B |
  CMP #$02                                  ; $12A36E |
  BNE code_12A377                           ; $12A370 |
  LDA #$7E                                  ; $12A372 |
  JSR reset_sprite_anim                     ; $12A374 |
code_12A377:
  RTS                                       ; $12A377 |

code_12A378:
  LDA $04A0,x                               ; $12A378 |
  AND #$02                                  ; $12A37B |
  TAY                                       ; $12A37D |
  LDA $A5FD,y                               ; $12A37E |
  CLC                                       ; $12A381 |
  ADC $0500,x                               ; $12A382 |
  TAY                                       ; $12A385 |
  LDA $0300,x                               ; $12A386 |
  AND #$0F                                  ; $12A389 |
  BNE code_12A3AD                           ; $12A38B |
  LDA $04A0,x                               ; $12A38D |
  AND #$01                                  ; $12A390 |
  BEQ code_12A39A                           ; $12A392 |
  JSR code_1FF71D                           ; $12A394 |
  JMP code_12A39D                           ; $12A397 |

code_12A39A:
  JSR code_1FF73B                           ; $12A39A |
code_12A39D:
  LDA $A5B5,y                               ; $12A39D |
  CMP $0360,x                               ; $12A3A0 |
  BNE code_12A423                           ; $12A3A3 |
  INC $0300,x                               ; $12A3A5 |
  LDA #$7F                                  ; $12A3A8 |
  JSR reset_sprite_anim                     ; $12A3AA |
code_12A3AD:
  LDA $05A0,x                               ; $12A3AD |
  CMP #$03                                  ; $12A3B0 |
  BNE code_12A423                           ; $12A3B2 |
  LDA $19                                   ; $12A3B4 |
  BNE code_12A41E                           ; $12A3B6 |
  LDA #$00                                  ; $12A3B8 |
  STA $0300,x                               ; $12A3BA |
  LDA $A691,y                               ; $12A3BD |
  STA $0780                                 ; $12A3C0 |
  STA $0785                                 ; $12A3C3 |
  LDA $A661,y                               ; $12A3C6 |
  STA $0781                                 ; $12A3C9 |
  ORA #$20                                  ; $12A3CC |
  STA $0786                                 ; $12A3CE |
  LDA #$01                                  ; $12A3D1 |
  STA $0782                                 ; $12A3D3 |
  STA $0787                                 ; $12A3D6 |
  LDA $A631,y                               ; $12A3D9 |
  ASL                                       ; $12A3DC |
  ASL                                       ; $12A3DD |
  TAY                                       ; $12A3DE |
  LDA $A75A,y                               ; $12A3DF |
  STA $0783                                 ; $12A3E2 |
  LDA $A75B,y                               ; $12A3E5 |
  STA $0784                                 ; $12A3E8 |
  LDA $A75C,y                               ; $12A3EB |
  STA $0788                                 ; $12A3EE |
  LDA $A75D,y                               ; $12A3F1 |
  STA $0789                                 ; $12A3F4 |
  LDA #$FF                                  ; $12A3F7 |
  STA $078A                                 ; $12A3F9 |
  STA $19                                   ; $12A3FC |
  LDA $0500,x                               ; $12A3FE |
  CMP #$17                                  ; $12A401 |
  BNE code_12A41E                           ; $12A403 |
  LDA $059F                                 ; $12A405 |
  AND #$FB                                  ; $12A408 |
  STA $059F                                 ; $12A40A |
  LDA #$00                                  ; $12A40D |
  STA $051F                                 ; $12A40F |
  LDA $04BF                                 ; $12A412 |
  AND #$01                                  ; $12A415 |
  TAY                                       ; $12A417 |
  LDA $A59B,y                               ; $12A418 |
  STA $05DF                                 ; $12A41B |
code_12A41E:
  LDA #$00                                  ; $12A41E |
  STA $05E0,x                               ; $12A420 |
code_12A423:
  RTS                                       ; $12A423 |

code_12A424:
  LDA $05C0,x                               ; $12A424 |
  CMP #$7E                                  ; $12A427 |
  BEQ code_12A43B                           ; $12A429 |
  CMP #$7F                                  ; $12A42B |
  BEQ code_12A43E                           ; $12A42D |
  LDA $05A0,x                               ; $12A42F |
  CMP #$02                                  ; $12A432 |
  BNE code_12A423                           ; $12A434 |
  LDA #$7E                                  ; $12A436 |
  JMP reset_sprite_anim                     ; $12A438 |

code_12A43B:
  JMP code_12A4BB                           ; $12A43B |

code_12A43E:
  LDA #$3C                                  ; $12A43E |
  STA $051F                                 ; $12A440 |
  LDA $05A0,x                               ; $12A443 |
  CMP #$03                                  ; $12A446 |
  BNE code_12A423                           ; $12A448 |
  LDA $19                                   ; $12A44A |
  BNE code_12A4B5                           ; $12A44C |
  LDY $0500,x                               ; $12A44E |
  LDA $A70F,y                               ; $12A451 |
  BMI code_12A4AF                           ; $12A454 |
  PHA                                       ; $12A456 |
  LDA $A728,y                               ; $12A457 |
  STA $0780                                 ; $12A45A |
  STA $0785                                 ; $12A45D |
  LDA $A741,y                               ; $12A460 |
  STA $0781                                 ; $12A463 |
  ORA #$20                                  ; $12A466 |
  STA $0786                                 ; $12A468 |
  LDA #$01                                  ; $12A46B |
  STA $0782                                 ; $12A46D |
  STA $0787                                 ; $12A470 |
  PLA                                       ; $12A473 |
  ASL                                       ; $12A474 |
  ASL                                       ; $12A475 |
  TAY                                       ; $12A476 |
  LDA $A75A,y                               ; $12A477 |
  STA $0783                                 ; $12A47A |
  LDA $A75B,y                               ; $12A47D |
  STA $0784                                 ; $12A480 |
  LDA $A75C,y                               ; $12A483 |
  STA $0788                                 ; $12A486 |
  LDA $A75D,y                               ; $12A489 |
  STA $0789                                 ; $12A48C |
  LDA #$FF                                  ; $12A48F |
  STA $078A                                 ; $12A491 |
  STA $19                                   ; $12A494 |
  LDA $0500,x                               ; $12A496 |
  CMP #$14                                  ; $12A499 |
  BNE code_12A4AF                           ; $12A49B |
  LDA $059F                                 ; $12A49D |
  AND #$FB                                  ; $12A4A0 |
  STA $059F                                 ; $12A4A2 |
  LDA #$00                                  ; $12A4A5 |
  STA $051F                                 ; $12A4A7 |
  LDA #$70                                  ; $12A4AA |
  STA $05DF                                 ; $12A4AC |
code_12A4AF:
  LDA #$00                                  ; $12A4AF |
  STA $0300,x                               ; $12A4B1 |
  RTS                                       ; $12A4B4 |

code_12A4B5:
  LDA #$00                                  ; $12A4B5 |
  STA $05E0,x                               ; $12A4B7 |
  RTS                                       ; $12A4BA |

code_12A4BB:
  LDA $0500,x                               ; $12A4BB |
  BEQ code_12A4D0                           ; $12A4BE |
  JSR code_1FF759                           ; $12A4C0 |
  LDA $03C0,x                               ; $12A4C3 |
  CMP #$98                                  ; $12A4C6 |
  BNE code_12A4CF                           ; $12A4C8 |
  LDA #$00                                  ; $12A4CA |
  STA $0300,x                               ; $12A4CC |
code_12A4CF:
  RTS                                       ; $12A4CF |

code_12A4D0:
  LDA $0520,x                               ; $12A4D0 |
  BEQ code_12A50E                           ; $12A4D3 |
  DEC $0520,x                               ; $12A4D5 |
  BNE code_12A4CF                           ; $12A4D8 |
  LDA #$02                                  ; $12A4DA |
  STA $0560,x                               ; $12A4DC |
code_12A4DF:
  DEC $0560,x                               ; $12A4DF |
  BMI code_12A4F9                           ; $12A4E2 |
  LDA #$A3                                  ; $12A4E4 |
  STA $0440,x                               ; $12A4E6 |
  LDA #$04                                  ; $12A4E9 |
  STA $0460,x                               ; $12A4EB |
  LDA #$BD                                  ; $12A4EE |
  STA $0400,x                               ; $12A4F0 |
  LDA #$01                                  ; $12A4F3 |
  STA $0420,x                               ; $12A4F5 |
  RTS                                       ; $12A4F8 |

code_12A4F9:
  LDA #$87                                  ; $12A4F9 |
  STA $0440,x                               ; $12A4FB |
  LDA #$06                                  ; $12A4FE |
  STA $0460,x                               ; $12A500 |
  LDA #$72                                  ; $12A503 |
  STA $0400,x                               ; $12A505 |
  LDA #$02                                  ; $12A508 |
  STA $0420,x                               ; $12A50A |
  RTS                                       ; $12A50D |

code_12A50E:
  LDA $0300,x                               ; $12A50E |
  AND #$0F                                  ; $12A511 |
  BNE code_12A551                           ; $12A513 |
  JSR code_1FF797                           ; $12A515 |
  LDA #$98                                  ; $12A518 |
  CMP $03C0,x                               ; $12A51A |
  BCS code_12A524                           ; $12A51D |
  STA $03C0,x                               ; $12A51F |
  BCC code_12A4DF                           ; $12A522 |
code_12A524:
  JSR code_1FF71D                           ; $12A524 |
  LDA $0540,x                               ; $12A527 |
  CMP $0360,x                               ; $12A52A |
  BCS code_12A4CF                           ; $12A52D |
  STA $0360,x                               ; $12A52F |
  SBC #$9F                                  ; $12A532 |
  LSR                                       ; $12A534 |
  LSR                                       ; $12A535 |
  LSR                                       ; $12A536 |
  LSR                                       ; $12A537 |
  TAY                                       ; $12A538 |
  LDA $A70A,y                               ; $12A539 |
  STA $0560,x                               ; $12A53C |
  LDA #$58                                  ; $12A53F |
  STA $03C0,x                               ; $12A541 |
  LDA #$00                                  ; $12A544 |
  STA $0440,x                               ; $12A546 |
  LDA #$04                                  ; $12A549 |
  STA $0460,x                               ; $12A54B |
  INC $0300,x                               ; $12A54E |
code_12A551:
  LDA $03C0,x                               ; $12A551 |
  AND #$0F                                  ; $12A554 |
  CMP #$08                                  ; $12A556 |
  BNE code_12A598                           ; $12A558 |
  JSR code_1FFC53                           ; $12A55A |
  BCS code_12A597                           ; $12A55D |
  LDA $0560,x                               ; $12A55F |
  STA $0500,y                               ; $12A562 |
  INC $0560,x                               ; $12A565 |
  LDA #$7F                                  ; $12A568 |
  JSR code_1FF846                           ; $12A56A |
  LDA $0360,x                               ; $12A56D |
  STA $0360,y                               ; $12A570 |
  LDA $0380,x                               ; $12A573 |
  STA $0380,y                               ; $12A576 |
  LDA $03C0,x                               ; $12A579 |
  STA $03C0,y                               ; $12A57C |
  LDA $0480,x                               ; $12A57F |
  STA $0480,y                               ; $12A582 |
  LDA $0320,x                               ; $12A585 |
  STA $0320,y                               ; $12A588 |
  LDA $03C0,x                               ; $12A58B |
  CMP #$98                                  ; $12A58E |
  BNE code_12A598                           ; $12A590 |
  LDA #$00                                  ; $12A592 |
  STA $0300,x                               ; $12A594 |
code_12A597:
  RTS                                       ; $12A597 |

code_12A598:
  JMP code_1FF759                           ; $12A598 |

  db $6F, $70, $98, $58, $88, $98, $68, $78 ; $12A59B |
  db $88, $58, $68, $88, $78, $68, $78, $98 ; $12A5A3 |
  db $58, $78, $68, $58, $98, $78, $88, $88 ; $12A5AB |
  db $68, $58, $E8, $E8, $E8, $D8, $E8, $E8 ; $12A5B3 |
  db $D8, $D8, $D8, $C8, $D8, $C8, $C8, $B8 ; $12A5BB |
  db $C8, $B8, $B8, $B8, $A8, $A8, $B8, $A8 ; $12A5C3 |
  db $A8, $A8, $18, $18, $18, $28, $18, $18 ; $12A5CB |
  db $28, $28, $28, $38, $28, $38, $38, $48 ; $12A5D3 |
  db $38, $48, $48, $48, $58, $58, $48, $58 ; $12A5DB |
  db $58, $58, $A8, $A8, $A8, $B8, $A8, $A8 ; $12A5E3 |
  db $B8, $B8, $B8, $C8, $B8, $C8, $C8, $D8 ; $12A5EB |
  db $C8, $D8, $D8, $D8, $E8, $E8, $D8, $E8 ; $12A5F3 |
  db $E8, $E8, $00, $83, $18, $84, $26, $2C ; $12A5FB |
  db $26, $28, $28, $2C, $28, $26, $28, $2C ; $12A603 |
  db $26, $2C, $26, $2C, $2C, $26, $26, $26 ; $12A60B |
  db $2C, $24, $26, $28, $26, $00, $26, $2C ; $12A613 |
  db $22, $2C, $28, $28, $28, $26, $24, $30 ; $12A61B |
  db $22, $2C, $22, $30, $28, $26, $26, $22 ; $12A623 |
  db $2C, $30, $26, $28, $26, $00, $17, $04 ; $12A62B |
  db $13, $16, $09, $0E, $12, $03, $08, $11 ; $12A633 |
  db $0D, $07, $0C, $15, $02, $0B, $06, $01 ; $12A63B |
  db $14, $0A, $10, $0F, $05, $00, $14, $00 ; $12A643 |
  db $0F, $15, $05, $0A, $10, $01, $06, $11 ; $12A64B |
  db $0B, $07, $0C, $16, $02, $0D, $08, $03 ; $12A653 |
  db $17, $0E, $12, $13, $09, $04, $5C, $5C ; $12A65B |
  db $1C, $5A, $9C, $DC, $1A, $5A, $9A, $18 ; $12A663 |
  db $DA, $98, $D8, $56, $58, $D6, $96, $56 ; $12A66B |
  db $54, $D4, $16, $14, $94, $54, $42, $42 ; $12A673 |
  db $02, $44, $82, $C2, $04, $44, $84, $06 ; $12A67B |
  db $C4, $86, $C6, $48, $46, $C8, $88, $48 ; $12A683 |
  db $4A, $CA, $08, $0A, $8A, $4A, $22, $21 ; $12A68B |
  db $22, $22, $21, $21, $22, $21, $21, $22 ; $12A693 |
  db $21, $21, $21, $22, $21, $21, $21, $21 ; $12A69B |
  db $22, $21, $22, $22, $21, $21, $22, $21 ; $12A6A3 |
  db $22, $22, $21, $21, $22, $21, $21, $22 ; $12A6AB |
  db $21, $21, $21, $22, $21, $21, $21, $21 ; $12A6B3 |
  db $22, $21, $22, $22, $21, $21, $54, $54 ; $12A6BB |
  db $14, $56, $94, $D4, $16, $56, $96, $18 ; $12A6C3 |
  db $D6, $98, $D8, $5A, $58, $DA, $9A, $5A ; $12A6CB |
  db $5C, $DC, $1A, $1C, $9C, $5C, $22, $21 ; $12A6D3 |
  db $22, $22, $21, $21, $22, $21, $21, $22 ; $12A6DB |
  db $21, $21, $21, $22, $21, $21, $21, $21 ; $12A6E3 |
  db $22, $21, $22, $22, $21, $21, $21, $21 ; $12A6EB |
  db $21, $21, $21, $4A, $48, $46, $44, $42 ; $12A6F3 |
  db $58, $48, $38, $28, $18, $E8, $D8, $C8 ; $12A6FB |
  db $B8, $A8, $10, $1A, $10, $24, $1A, $14 ; $12A703 |
  db $0F, $0A, $05, $00, $04, $09, $0E, $13 ; $12A70B |
  db $17, $03, $08, $0D, $12, $16, $02, $07 ; $12A713 |
  db $0C, $11, $FF, $01, $06, $0B, $10, $15 ; $12A71B |
  db $00, $05, $0A, $0F, $14, $21, $21, $21 ; $12A723 |
  db $22, $22, $21, $21, $21, $22, $22, $21 ; $12A72B |
  db $21, $21, $22, $22, $21, $21, $21, $22 ; $12A733 |
  db $22, $21, $21, $21, $22, $22, $5C, $9C ; $12A73B |
  db $DC, $1C, $5C, $5A, $9A, $DA, $1A, $5A ; $12A743 |
  db $58, $98, $D8, $18, $58, $56, $96, $D6 ; $12A74B |
  db $16, $56, $54, $94, $D4, $14, $54, $80 ; $12A753 |
  db $81, $80, $89, $82, $83, $8A, $8B, $84 ; $12A75B |
  db $85, $8C, $8D, $86, $87, $8E, $8F, $88 ; $12A763 |
  db $80, $90, $80, $91, $92, $9A, $9B, $93 ; $12A76B |
  db $94, $9C, $9D, $95, $96, $9E, $9F, $97 ; $12A773 |
  db $98, $A0, $A1, $99, $80, $A2, $A3, $A4 ; $12A77B |
  db $A5, $80, $AD, $A6, $A7, $AE, $AF, $A8 ; $12A783 |
  db $A8, $B0, $B1, $A9, $AA, $B2, $B3, $AB ; $12A78B |
  db $AC, $B4, $B5, $80, $80, $80, $BD, $B6 ; $12A793 |
  db $B7, $BE, $BF, $B8, $A8, $C0, $C1, $B9 ; $12A79B |
  db $BA, $C2, $C3, $BB, $BC, $C4, $80, $C5 ; $12A7A3 |
  db $C6, $CD, $CE, $C7, $C8, $CF, $D0, $C9 ; $12A7AB |
  db $CA, $D1, $D2, $CB, $CC, $D3, $D4      ; $12A7B3 |

code_12A7BA:
  LDA #$AB                                  ; $12A7BA |
  PHA                                       ; $12A7BC |
  LDA #$03                                  ; $12A7BD |
  PHA                                       ; $12A7BF |
  LDA $0300,x                               ; $12A7C0 |
  AND #$0F                                  ; $12A7C3 |
  TAY                                       ; $12A7C5 |
  LDA $AD35,y                               ; $12A7C6 |
  STA $00                                   ; $12A7C9 |
  LDA $AD37,y                               ; $12A7CB |
  STA $01                                   ; $12A7CE |
  JMP ($0000)                               ; $12A7D0 |

  LDA #$09                                  ; $12A7D3 |
  CMP $30                                   ; $12A7D5 |
  BEQ code_12A7FD                           ; $12A7D7 |
  STA $30                                   ; $12A7D9 |
  LDA #$80                                  ; $12A7DB |
  STA $B0                                   ; $12A7DD |
  STA $5A                                   ; $12A7DF |
  LDA #$8E                                  ; $12A7E1 |
  STA $B3                                   ; $12A7E3 |
  LDA #$0D                                  ; $12A7E5 |
  JSR code_1FF898                           ; $12A7E7 |
  LDA #$00                                  ; $12A7EA |
  STA $69                                   ; $12A7EC |
  STA $6B                                   ; $12A7EE |
  STA $6A                                   ; $12A7F0 |
  LDY #$08                                  ; $12A7F2 |
code_12A7F4:
  LDA $0377,y                               ; $12A7F4 |
  STA $0577,y                               ; $12A7F7 |
  DEY                                       ; $12A7FA |
  BPL code_12A7F4                           ; $12A7FB |
code_12A7FD:
  LDA $B0                                   ; $12A7FD |
  CMP #$9C                                  ; $12A7FF |
  BNE code_12A81C                           ; $12A801 |
  INC $0300,x                               ; $12A803 |
  LDA #$0D                                  ; $12A806 |
  STA $F8                                   ; $12A808 |
  LDA #$3A                                  ; $12A80A |
  STA $5E                                   ; $12A80C |
  LDA #$40                                  ; $12A80E |
  STA $0520,x                               ; $12A810 |
  LDA #$32                                  ; $12A813 |
  STA $0540,x                               ; $12A815 |
  LDA #$40                                  ; $12A818 |
  STA $6A                                   ; $12A81A |
code_12A81C:
  RTS                                       ; $12A81C |

  LDY $0500,x                               ; $12A81D |
  LDA $AD39,y                               ; $12A820 |
  STA $00                                   ; $12A823 |
  LDA $AD43,y                               ; $12A825 |
  STA $01                                   ; $12A828 |
  JMP ($0000)                               ; $12A82A |

  LDA $5E                                   ; $12A82D |
  CMP #$5A                                  ; $12A82F |
  BEQ code_12A861                           ; $12A831 |
  LDA $5E                                   ; $12A833 |
  CLC                                       ; $12A835 |
  ADC #$02                                  ; $12A836 |
  STA $5E                                   ; $12A838 |
  CMP #$5A                                  ; $12A83A |
  BNE code_12A843                           ; $12A83C |
  LDA #$1E                                  ; $12A83E |
  STA $0520,x                               ; $12A840 |
code_12A843:
  LDA $03DA                                 ; $12A843 |
  PHA                                       ; $12A846 |
  LDA $03DB                                 ; $12A847 |
  PHA                                       ; $12A84A |
  LDY #$08                                  ; $12A84B |
code_12A84D:
  LDA $03D7,y                               ; $12A84D |
  CLC                                       ; $12A850 |
  ADC #$02                                  ; $12A851 |
  STA $03D7,y                               ; $12A853 |
  DEY                                       ; $12A856 |
  BPL code_12A84D                           ; $12A857 |
  PLA                                       ; $12A859 |
  STA $03DB                                 ; $12A85A |
  PLA                                       ; $12A85D |
  STA $03DA                                 ; $12A85E |
code_12A861:
  DEC $0520,x                               ; $12A861 |
  BNE code_12A869                           ; $12A864 |
  INC $0500,x                               ; $12A866 |
code_12A869:
  JMP code_12AA0A                           ; $12A869 |

  LDA $03DA                                 ; $12A86C |
  PHA                                       ; $12A86F |
  LDA $03DB                                 ; $12A870 |
  PHA                                       ; $12A873 |
  LDY #$08                                  ; $12A874 |
code_12A876:
  LDA $03D7,y                               ; $12A876 |
  SEC                                       ; $12A879 |
  SBC #$02                                  ; $12A87A |
  STA $03D7,y                               ; $12A87C |
  DEY                                       ; $12A87F |
  BPL code_12A876                           ; $12A880 |
  PLA                                       ; $12A882 |
  STA $03DB                                 ; $12A883 |
  PLA                                       ; $12A886 |
  STA $03DA                                 ; $12A887 |
  LDA $5E                                   ; $12A88A |
  SEC                                       ; $12A88C |
  SBC #$02                                  ; $12A88D |
  STA $5E                                   ; $12A88F |
  CMP #$3A                                  ; $12A891 |
  BNE code_12A8A0                           ; $12A893 |
  LDA #$40                                  ; $12A895 |
  STA $0520,x                               ; $12A897 |
  LDA $053E                                 ; $12A89A |
  STA $0500,x                               ; $12A89D |
code_12A8A0:
  JMP code_12AA0A                           ; $12A8A0 |

  LDA $0520,x                               ; $12A8A3 |
  AND #$01                                  ; $12A8A6 |
  BNE code_12A8B3                           ; $12A8A8 |
  DEC $057D                                 ; $12A8AA |
  DEC $0579                                 ; $12A8AD |
  DEC $057B                                 ; $12A8B0 |
code_12A8B3:
  DEC $03DB                                 ; $12A8B3 |
  LDA $0520,x                               ; $12A8B6 |
  CMP #$20                                  ; $12A8B9 |
  BNE code_12A8C3                           ; $12A8BB |
  INC $05BD                                 ; $12A8BD |
  INC $05B9                                 ; $12A8C0 |
code_12A8C3:
  JMP code_12A9B5                           ; $12A8C3 |

  LDA $0520,x                               ; $12A8C6 |
  AND #$01                                  ; $12A8C9 |
  BNE code_12A8EC                           ; $12A8CB |
  LDA $6A                                   ; $12A8CD |
  CLC                                       ; $12A8CF |
  ADC #$01                                  ; $12A8D0 |
  STA $6A                                   ; $12A8D2 |
  LDA $6B                                   ; $12A8D4 |
  ADC #$00                                  ; $12A8D6 |
  STA $6B                                   ; $12A8D8 |
  INC $057C                                 ; $12A8DA |
  INC $0578                                 ; $12A8DD |
  INC $057A                                 ; $12A8E0 |
  INC $057D                                 ; $12A8E3 |
  INC $0579                                 ; $12A8E6 |
  INC $057B                                 ; $12A8E9 |
code_12A8EC:
  INC $03DB                                 ; $12A8EC |
  LDA $0520,x                               ; $12A8EF |
  CMP #$20                                  ; $12A8F2 |
  BNE code_12A902                           ; $12A8F4 |
  DEC $05BD                                 ; $12A8F6 |
  DEC $05B9                                 ; $12A8F9 |
  INC $05BC                                 ; $12A8FC |
  INC $05B8                                 ; $12A8FF |
code_12A902:
  JMP code_12A9B5                           ; $12A902 |

  LDA $0520,x                               ; $12A905 |
  AND #$01                                  ; $12A908 |
  BNE code_12A915                           ; $12A90A |
  DEC $057C                                 ; $12A90C |
  DEC $0578                                 ; $12A90F |
  DEC $057A                                 ; $12A912 |
code_12A915:
  DEC $03DA                                 ; $12A915 |
  LDA $0520,x                               ; $12A918 |
  CMP #$20                                  ; $12A91B |
  BNE code_12A925                           ; $12A91D |
  DEC $05BC                                 ; $12A91F |
  DEC $05B8                                 ; $12A922 |
code_12A925:
  JMP code_12A9B5                           ; $12A925 |

  INC $03DA                                 ; $12A928 |
  JMP code_12A9B5                           ; $12A92B |

  LDA $0520,x                               ; $12A92E |
  AND #$01                                  ; $12A931 |
  BNE code_12A93E                           ; $12A933 |
  INC $057C                                 ; $12A935 |
  INC $0578                                 ; $12A938 |
  INC $057A                                 ; $12A93B |
code_12A93E:
  DEC $03DA                                 ; $12A93E |
  LDA $0520,x                               ; $12A941 |
  CMP #$20                                  ; $12A944 |
  BNE code_12A9B5                           ; $12A946 |
  INC $05BC                                 ; $12A948 |
  INC $05B8                                 ; $12A94B |
  JMP code_12A9B5                           ; $12A94E |

  LDA $0520,x                               ; $12A951 |
  AND #$01                                  ; $12A954 |
  BNE code_12A977                           ; $12A956 |
  LDA $6A                                   ; $12A958 |
  SEC                                       ; $12A95A |
  SBC #$01                                  ; $12A95B |
  STA $6A                                   ; $12A95D |
  LDA $6B                                   ; $12A95F |
  SBC #$00                                  ; $12A961 |
  STA $6B                                   ; $12A963 |
  DEC $057D                                 ; $12A965 |
  DEC $0579                                 ; $12A968 |
  DEC $057B                                 ; $12A96B |
  DEC $057C                                 ; $12A96E |
  DEC $0578                                 ; $12A971 |
  DEC $057A                                 ; $12A974 |
code_12A977:
  INC $03DA                                 ; $12A977 |
  LDA $0520,x                               ; $12A97A |
  CMP #$20                                  ; $12A97D |
  BNE code_12A9B5                           ; $12A97F |
  DEC $05BC                                 ; $12A981 |
  DEC $05B8                                 ; $12A984 |
  INC $05BD                                 ; $12A987 |
  INC $05B9                                 ; $12A98A |
  BNE code_12A9B5                           ; $12A98D |
  LDA $0520,x                               ; $12A98F |
  AND #$01                                  ; $12A992 |
  BNE code_12A99F                           ; $12A994 |
  INC $057D                                 ; $12A996 |
  INC $0579                                 ; $12A999 |
  INC $057B                                 ; $12A99C |
code_12A99F:
  DEC $03DB                                 ; $12A99F |
  LDA $0520,x                               ; $12A9A2 |
  CMP #$20                                  ; $12A9A5 |
  BNE code_12A9B5                           ; $12A9A7 |
  DEC $05BD                                 ; $12A9A9 |
  DEC $05B9                                 ; $12A9AC |
  JMP code_12A9B5                           ; $12A9AF |

  INC $03DB                                 ; $12A9B2 |
code_12A9B5:
  DEC $0520,x                               ; $12A9B5 |
  BNE code_12AA0A                           ; $12A9B8 |
  LDA #$40                                  ; $12A9BA |
  STA $0520,x                               ; $12A9BC |
  INC $0500,x                               ; $12A9BF |
  LDA $0500,x                               ; $12A9C2 |
  AND #$07                                  ; $12A9C5 |
  STA $0500,x                               ; $12A9C7 |
  BEQ code_12A9E6                           ; $12A9CA |
  CMP #$04                                  ; $12A9CC |
  BNE code_12AA0A                           ; $12A9CE |
  LDA $6A                                   ; $12A9D0 |
  SEC                                       ; $12A9D2 |
  SBC #$40                                  ; $12A9D3 |
  STA $00                                   ; $12A9D5 |
  LDA $6B                                   ; $12A9D7 |
  SBC #$01                                  ; $12A9D9 |
  ORA $00                                   ; $12A9DB |
  BEQ code_12A9FA                           ; $12A9DD |
  LDA #$00                                  ; $12A9DF |
  STA $0500,x                               ; $12A9E1 |
  BEQ code_12A9FA                           ; $12A9E4 |
code_12A9E6:
  LDA $6A                                   ; $12A9E6 |
  SEC                                       ; $12A9E8 |
  SBC #$C0                                  ; $12A9E9 |
  STA $00                                   ; $12A9EB |
  LDA $6B                                   ; $12A9ED |
  SBC #$00                                  ; $12A9EF |
  ORA $00                                   ; $12A9F1 |
  BEQ code_12A9FA                           ; $12A9F3 |
  LDA #$04                                  ; $12A9F5 |
  STA $0500,x                               ; $12A9F7 |
code_12A9FA:
  LDA $031E                                 ; $12A9FA |
  BMI code_12AA0A                           ; $12A9FD |
  LDA $0500,x                               ; $12A9FF |
  STA $053E                                 ; $12AA02 |
  LDA #$08                                  ; $12AA05 |
  STA $0500,x                               ; $12AA07 |
code_12AA0A:
  LDA $031E                                 ; $12AA0A |
  BPL code_12AA7F                           ; $12AA0D |
  LDA $059E                                 ; $12AA0F |
  AND #$04                                  ; $12AA12 |
  BNE code_12AA7E                           ; $12AA14 |
  LDA $0540,x                               ; $12AA16 |
  BNE code_12AA7B                           ; $12AA19 |
  JSR code_1FF8C2                           ; $12AA1B |
  CMP #$48                                  ; $12AA1E |
  BCC code_12AA7E                           ; $12AA20 |
  JSR code_1FFC53                           ; $12AA22 |
  BCS code_12AA7E                           ; $12AA25 |
  LDA #$B4                                  ; $12AA27 |
  STA $0540,x                               ; $12AA29 |
  LDA #$61                                  ; $12AA2C |
  JSR code_1FF846                           ; $12AA2E |
  LDA $0360,x                               ; $12AA31 |
  STA $0360,y                               ; $12AA34 |
  LDA $F9                                   ; $12AA37 |
  STA $0380,y                               ; $12AA39 |
  LDA #$A8                                  ; $12AA3C |
  STA $03C0,y                               ; $12AA3E |
  LDA #$90                                  ; $12AA41 |
  STA $0580,y                               ; $12AA43 |
  LDA #$E4                                  ; $12AA46 |
  STA $0320,y                               ; $12AA48 |
  LDA #$80                                  ; $12AA4B |
  STA $0480,y                               ; $12AA4D |
  LDA #$00                                  ; $12AA50 |
  STA $0500,y                               ; $12AA52 |
  STA $0400,y                               ; $12AA55 |
  STA $02                                   ; $12AA58 |
  LDA #$01                                  ; $12AA5A |
  STA $0420,y                               ; $12AA5C |
  STA $03                                   ; $12AA5F |
  STY $0F                                   ; $12AA61 |
  STX $0E                                   ; $12AA63 |
  LDX $0F                                   ; $12AA65 |
  JSR code_1FFC63                           ; $12AA67 |
  LDY $0F                                   ; $12AA6A |
  LDX $0E                                   ; $12AA6C |
  LDA $0C                                   ; $12AA6E |
  STA $04A0,y                               ; $12AA70 |
  LDA #$02                                  ; $12AA73 |
  STA $0520,y                               ; $12AA75 |
  STA $0540,y                               ; $12AA78 |
code_12AA7B:
  DEC $0540,x                               ; $12AA7B |
code_12AA7E:
  RTS                                       ; $12AA7E |

code_12AA7F:
  LDA $0540,x                               ; $12AA7F |
  BNE code_12AA7B                           ; $12AA82 |
  LDY #$16                                  ; $12AA84 |
code_12AA86:
  LDA $0300,y                               ; $12AA86 |
  BPL code_12AA91                           ; $12AA89 |
  DEY                                       ; $12AA8B |
  CPY #$0F                                  ; $12AA8C |
  BNE code_12AA86                           ; $12AA8E |
  RTS                                       ; $12AA90 |

code_12AA91:
  LDA #$58                                  ; $12AA91 |
  JSR code_1FF846                           ; $12AA93 |
  LDA #$00                                  ; $12AA96 |
  STA $0440,y                               ; $12AA98 |
  LDA #$04                                  ; $12AA9B |
  STA $0460,y                               ; $12AA9D |
  LDA #$E6                                  ; $12AAA0 |
  STA $0320,y                               ; $12AAA2 |
  LDA #$80                                  ; $12AAA5 |
  STA $0480,y                               ; $12AAA7 |
  LDA $03C0,x                               ; $12AAAA |
  CLC                                       ; $12AAAD |
  ADC #$0C                                  ; $12AAAE |
  STA $03C0,y                               ; $12AAB0 |
  LDA $F9                                   ; $12AAB3 |
  STA $0380,y                               ; $12AAB5 |
  STY $0F                                   ; $12AAB8 |
  LDY $051E                                 ; $12AABA |
  LDA $ADCE,y                               ; $12AABD |
  STA $0540,x                               ; $12AAC0 |
  LDA $ADD4,y                               ; $12AAC3 |
  CLC                                       ; $12AAC6 |
  ADC $0360,x                               ; $12AAC7 |
  LDY $0F                                   ; $12AACA |
  STA $0360,y                               ; $12AACC |
  LDX $0F                                   ; $12AACF |
  JSR code_1FF869                           ; $12AAD1 |
  JSR code_1FF8C2                           ; $12AAD4 |
  STA $01                                   ; $12AAD7 |
  LDA #$00                                  ; $12AAD9 |
  STA $00                                   ; $12AADB |
  STA $02                                   ; $12AADD |
  LDA #$24                                  ; $12AADF |
  STA $03                                   ; $12AAE1 |
  JSR code_1FFD11                           ; $12AAE3 |
  LDY $0F                                   ; $12AAE6 |
  LDA $04                                   ; $12AAE8 |
  STA $0400,x                               ; $12AAEA |
  LDA $05                                   ; $12AAED |
  STA $0420,x                               ; $12AAEF |
  LDX #$1F                                  ; $12AAF2 |
  INC $051E                                 ; $12AAF4 |
  LDA $051E                                 ; $12AAF7 |
  CMP #$06                                  ; $12AAFA |
  BNE code_12AB03                           ; $12AAFC |
  LDA #$00                                  ; $12AAFE |
  STA $051E                                 ; $12AB00 |
code_12AB03:
  RTS                                       ; $12AB03 |

  LDY #$08                                  ; $12AB04 |
code_12AB06:
  LDA $0597,y                               ; $12AB06 |
  ORA #$04                                  ; $12AB09 |
  STA $0597,y                               ; $12AB0B |
  LDA $0577,y                               ; $12AB0E |
  SEC                                       ; $12AB11 |
  SBC $6A                                   ; $12AB12 |
  STA $00                                   ; $12AB14 |
  LDA #$01                                  ; $12AB16 |
  SBC $6B                                   ; $12AB18 |
  BNE code_12AB29                           ; $12AB1A |
  LDA $00                                   ; $12AB1C |
  STA $0377,y                               ; $12AB1E |
  LDA $0597,y                               ; $12AB21 |
  AND #$FB                                  ; $12AB24 |
  STA $0597,y                               ; $12AB26 |
code_12AB29:
  DEY                                       ; $12AB29 |
  BPL code_12AB06                           ; $12AB2A |
  LDA $95                                   ; $12AB2C |
  AND #$01                                  ; $12AB2E |
  TAY                                       ; $12AB30 |
  LDA $059D                                 ; $12AB31 |
  AND #$04                                  ; $12AB34 |
  BNE code_12AB44                           ; $12AB36 |
  LDA $AD8A,y                               ; $12AB38 |
  STA $059D                                 ; $12AB3B |
  LDA $AD8C,y                               ; $12AB3E |
  STA $0599                                 ; $12AB41 |
code_12AB44:
  LDA $059C                                 ; $12AB44 |
  AND #$04                                  ; $12AB47 |
  BNE code_12AB5B                           ; $12AB49 |
  LDA $AD8A,y                               ; $12AB4B |
  ORA #$40                                  ; $12AB4E |
  STA $059C                                 ; $12AB50 |
  LDA $AD8C,y                               ; $12AB53 |
  ORA #$40                                  ; $12AB56 |
  STA $0598                                 ; $12AB58 |
code_12AB5B:
  LDA $031E                                 ; $12AB5B |
  BPL code_12AB68                           ; $12AB5E |
  LDA $059F                                 ; $12AB60 |
  ORA #$04                                  ; $12AB63 |
  STA $059F                                 ; $12AB65 |
code_12AB68:
  LDA #$00                                  ; $12AB68 |
  STA $05FD                                 ; $12AB6A |
  STA $05FC                                 ; $12AB6D |
  STA $05F9                                 ; $12AB70 |
  STA $05F8                                 ; $12AB73 |
  LDA $057F                                 ; $12AB76 |
  SEC                                       ; $12AB79 |
  SBC $6A                                   ; $12AB7A |
  LDA #$01                                  ; $12AB7C |
  SBC $6B                                   ; $12AB7E |
  BNE code_12ABA5                           ; $12AB80 |
  LDA $03DF                                 ; $12AB82 |
  PHA                                       ; $12AB85 |
  CLC                                       ; $12AB86 |
  ADC #$18                                  ; $12AB87 |
  STA $03DF                                 ; $12AB89 |
  LDA #$18                                  ; $12AB8C |
  STA $049F                                 ; $12AB8E |
  LDA $059F                                 ; $12AB91 |
  PHA                                       ; $12AB94 |
  AND #$F0                                  ; $12AB95 |
  STA $059F                                 ; $12AB97 |
  JSR $8009                                 ; $12AB9A |
  PLA                                       ; $12AB9D |
  STA $059F                                 ; $12AB9E |
  PLA                                       ; $12ABA1 |
  STA $03DF                                 ; $12ABA2 |
code_12ABA5:
  LDA $059F                                 ; $12ABA5 |
  AND #$04                                  ; $12ABA8 |
  BNE code_12ABD5                           ; $12ABAA |
  LDA #$02                                  ; $12ABAC |
  STA $049F                                 ; $12ABAE |
  JSR $8003                                 ; $12ABB1 |
  LDA $04E0,x                               ; $12ABB4 |
  BNE code_12ABD5                           ; $12ABB7 |
  LDA #$6D                                  ; $12ABB9 |
  STA $05D0                                 ; $12ABBB |
  LDA #$00                                  ; $12ABBE |
  STA $05B0                                 ; $12ABC0 |
  STA $05F0                                 ; $12ABC3 |
  LDY #$0B                                  ; $12ABC6 |
  LDA #$0F                                  ; $12ABC8 |
code_12ABCA:
  STA $0604,y                               ; $12ABCA |
  STA $0624,y                               ; $12ABCD |
  DEY                                       ; $12ABD0 |
  BPL code_12ABCA                           ; $12ABD1 |
  STY $18                                   ; $12ABD3 |
code_12ABD5:
  RTS                                       ; $12ABD5 |

code_12ABD6:
  LDA $B3                                   ; $12ABD6 |
  BPL code_12ABD5                           ; $12ABD8 |
  LDA $30                                   ; $12ABDA |
  CMP #$09                                  ; $12ABDC |
  BEQ code_12ABD5                           ; $12ABDE |
  LDA $04E0,x                               ; $12ABE0 |
  BEQ code_12AC19                           ; $12ABE3 |
  JSR $8003                                 ; $12ABE5 |
  LDA $04E0,x                               ; $12ABE8 |
  ORA #$80                                  ; $12ABEB |
  STA $B0                                   ; $12ABED |
  AND #$1F                                  ; $12ABEF |
  BNE code_12AC4E                           ; $12ABF1 |
  LDA #$E5                                  ; $12ABF3 |
  STA $0320,x                               ; $12ABF5 |
  LDA #$94                                  ; $12ABF8 |
  STA $0580,x                               ; $12ABFA |
  LDA #$00                                  ; $12ABFD |
  STA $0500,x                               ; $12ABFF |
  STA $05C0,x                               ; $12AC02 |
  LDY #$00                                  ; $12AC05 |
code_12AC07:
  LDA $AD4D,y                               ; $12AC07 |
  STA $0780,y                               ; $12AC0A |
  CMP #$FF                                  ; $12AC0D |
  BEQ code_12AC14                           ; $12AC0F |
  INY                                       ; $12AC11 |
  BNE code_12AC07                           ; $12AC12 |
code_12AC14:
  STA $19                                   ; $12AC14 |
  JMP code_12AC4F                           ; $12AC16 |

code_12AC19:
  LDA $0500,x                               ; $12AC19 |
  AND #$03                                  ; $12AC1C |
  BNE code_12AC4B                           ; $12AC1E |
  LDA #$1C                                  ; $12AC20 |
  JSR code_1FF89A                           ; $12AC22 |
  INC $B0                                   ; $12AC25 |
  LDA $B0                                   ; $12AC27 |
  CMP #$9C                                  ; $12AC29 |
  BNE code_12AC4B                           ; $12AC2B |
  LDA $059F                                 ; $12AC2D |
  AND #$FB                                  ; $12AC30 |
  STA $059F                                 ; $12AC32 |
  LDA #$00                                  ; $12AC35 |
  STA $031E                                 ; $12AC37 |
  STA $051E                                 ; $12AC3A |
  STA $053E                                 ; $12AC3D |
  STA $055E                                 ; $12AC40 |
  LDA $031F                                 ; $12AC43 |
  ORA #$40                                  ; $12AC46 |
  STA $031F                                 ; $12AC48 |
code_12AC4B:
  INC $0500,x                               ; $12AC4B |
code_12AC4E:
  RTS                                       ; $12AC4E |

code_12AC4F:
  LDA #$02                                  ; $12AC4F |
  STA $01                                   ; $12AC51 |
  LDA $0360,x                               ; $12AC53 |
  STA $02                                   ; $12AC56 |
  LDA $03C0,x                               ; $12AC58 |
  STA $03                                   ; $12AC5B |
code_12AC5D:
  JSR code_1FFC53                           ; $12AC5D |
  BCS code_12AC96                           ; $12AC60 |
  LDA #$59                                  ; $12AC62 |
  JSR code_1FF846                           ; $12AC64 |
  LDA #$00                                  ; $12AC67 |
  STA $0500,y                               ; $12AC69 |
  STA $0480,y                               ; $12AC6C |
  LDA #$19                                  ; $12AC6F |
  STA $0320,y                               ; $12AC71 |
  LDA $0380,x                               ; $12AC74 |
  STA $0380,y                               ; $12AC77 |
  STX $0F                                   ; $12AC7A |
  LDX $01                                   ; $12AC7C |
  LDA $02                                   ; $12AC7E |
  CLC                                       ; $12AC80 |
  ADC $ADDA,x                               ; $12AC81 |
  STA $0360,y                               ; $12AC84 |
  LDA $03                                   ; $12AC87 |
  CLC                                       ; $12AC89 |
  ADC $ADDD,x                               ; $12AC8A |
  STA $03C0,y                               ; $12AC8D |
  LDX $0F                                   ; $12AC90 |
  DEC $01                                   ; $12AC92 |
  BPL code_12AC5D                           ; $12AC94 |
code_12AC96:
  RTS                                       ; $12AC96 |

code_12AC97:
  LDA $04A0,x                               ; $12AC97 |
  AND #$01                                  ; $12AC9A |
  BEQ code_12ACA4                           ; $12AC9C |
  JSR code_1FF71D                           ; $12AC9E |
  JMP code_12ACA7                           ; $12ACA1 |

code_12ACA4:
  JSR code_1FF73B                           ; $12ACA4 |
code_12ACA7:
  LDA $04A0,x                               ; $12ACA7 |
  AND #$08                                  ; $12ACAA |
  BEQ code_12ACB4                           ; $12ACAC |
  JSR code_1FF779                           ; $12ACAE |
  JMP code_12ACB7                           ; $12ACB1 |

code_12ACB4:
  JSR code_1FF759                           ; $12ACB4 |
code_12ACB7:
  LDY $0500,x                               ; $12ACB7 |
  LDA #$00                                  ; $12ACBA |
  STA $00                                   ; $12ACBC |
  STA $01                                   ; $12ACBE |
  LDA $AD9E,y                               ; $12ACC0 |
  BPL code_12ACC7                           ; $12ACC3 |
  DEC $00                                   ; $12ACC5 |
code_12ACC7:
  LDA $03A0,x                               ; $12ACC7 |
  CLC                                       ; $12ACCA |
  ADC $AD8E,y                               ; $12ACCB |
  STA $03A0,x                               ; $12ACCE |
  LDA $03C0,x                               ; $12ACD1 |
  ADC $AD9E,y                               ; $12ACD4 |
  STA $03C0,x                               ; $12ACD7 |
  LDA $03E0,x                               ; $12ACDA |
  ADC $00                                   ; $12ACDD |
  BEQ code_12ACE7                           ; $12ACDF |
  LDA #$00                                  ; $12ACE1 |
  STA $0300,x                               ; $12ACE3 |
  RTS                                       ; $12ACE6 |

code_12ACE7:
  LDA $ADBE,y                               ; $12ACE7 |
  BPL code_12ACEE                           ; $12ACEA |
  DEC $01                                   ; $12ACEC |
code_12ACEE:
  LDA $0340,x                               ; $12ACEE |
  CLC                                       ; $12ACF1 |
  ADC $ADAE,y                               ; $12ACF2 |
  STA $0340,x                               ; $12ACF5 |
  LDA $0360,x                               ; $12ACF8 |
  ADC $ADBE,y                               ; $12ACFB |
  STA $0360,x                               ; $12ACFE |
  LDA $0380,x                               ; $12AD01 |
  ADC $01                                   ; $12AD04 |
  STA $0380,x                               ; $12AD06 |
  DEC $0520,x                               ; $12AD09 |
  BNE code_12AD24                           ; $12AD0C |
  INC $0500,x                               ; $12AD0E |
  LDA $0500,x                               ; $12AD11 |
  AND #$0F                                  ; $12AD14 |
  STA $0500,x                               ; $12AD16 |
  BNE code_12AD1E                           ; $12AD19 |
  INC $0540,x                               ; $12AD1B |
code_12AD1E:
  LDA $0540,x                               ; $12AD1E |
  STA $0520,x                               ; $12AD21 |
code_12AD24:
  RTS                                       ; $12AD24 |

code_12AD25:
  JSR code_1FF797                           ; $12AD25 |
  LDA $04A0,x                               ; $12AD28 |
  AND #$01                                  ; $12AD2B |
  BEQ code_12AD32                           ; $12AD2D |
  JMP code_1FF71D                           ; $12AD2F |

code_12AD32:
  JMP code_1FF73B                           ; $12AD32 |

  db $D3, $1D, $A7, $A8, $A3, $C6, $05, $28 ; $12AD35 |
  db $2E, $51, $8F, $B2, $2D, $6C, $A8, $A8 ; $12AD3D |
  db $A9, $A9, $A9, $A9, $A9, $A9, $A8, $A8 ; $12AD45 |
  db $25, $0A, $0B, $80, $80, $80, $80, $E6 ; $12AD4D |
  db $E7, $E8, $E9, $80, $80, $80, $80, $25 ; $12AD55 |
  db $2A, $0B, $80, $80, $80, $EA, $EB, $80 ; $12AD5D |
  db $80, $80, $EC, $80, $80, $80, $25, $4A ; $12AD65 |
  db $0B, $80, $80, $80, $ED, $EE, $80, $80 ; $12AD6D |
  db $EF, $F0, $80, $80, $80, $25, $6A, $0B ; $12AD75 |
  db $80, $F1, $F2, $9A, $F3, $F4, $F5, $F6 ; $12AD7D |
  db $9F, $F7, $F8, $80, $FF, $90, $94, $94 ; $12AD85 |
  db $90, $00, $3B, $E1, $DB, $00, $25, $1F ; $12AD8D |
  db $C5, $00, $C5, $1F, $25, $00, $DB, $E1 ; $12AD95 |
  db $3B, $FD, $FD, $FD, $FE, $00, $01, $02 ; $12AD9D |
  db $02, $03, $02, $02, $01, $00, $FE, $FD ; $12ADA5 |
  db $FD, $00, $25, $1F, $C5, $00, $C5, $1F ; $12ADAD |
  db $25, $00, $DB, $E1, $3B, $00, $3B, $E1 ; $12ADB5 |
  db $DB, $00, $01, $02, $02, $03, $02, $02 ; $12ADBD |
  db $01, $00, $FE, $FD, $FD, $FD, $FD, $FD ; $12ADC5 |
  db $FE, $32, $3C, $32, $3C, $32, $5A, $E0 ; $12ADCD |
  db $20, $E0, $20, $E0, $20, $00, $F0, $10 ; $12ADD5 |
  db $C0, $D0, $D0                          ; $12ADDD |

code_12ADE0:
  LDA $0300,x                               ; $12ADE0 |
  AND #$0F                                  ; $12ADE3 |
  BNE code_12AE17                           ; $12ADE5 |
  STA $95                                   ; $12ADE7 |
  INC $0300,x                               ; $12ADE9 |
  LDA #$09                                  ; $12ADEC |
  STA $30                                   ; $12ADEE |
  LDA #$80                                  ; $12ADF0 |
  STA $B0                                   ; $12ADF2 |
  STA $5A                                   ; $12ADF4 |
  LDA #$8E                                  ; $12ADF6 |
  STA $B3                                   ; $12ADF8 |
  LDA #$0D                                  ; $12ADFA |
  JSR code_1FF898                           ; $12ADFC |
  LDA #$30                                  ; $12ADFF |
  STA $0500,x                               ; $12AE01 |
  LDA #$6C                                  ; $12AE04 |
  STA $E8                                   ; $12AE06 |
  LDA #$6E                                  ; $12AE08 |
  STA $E9                                   ; $12AE0A |
  JSR update_CHR_banks                      ; $12AE0C |
  LDA #$00                                  ; $12AE0F |
  STA $69                                   ; $12AE11 |
  STA $6A                                   ; $12AE13 |
  STA $6B                                   ; $12AE15 |
code_12AE17:
  LDA $0500,x                               ; $12AE17 |
  BMI code_12AE5F                           ; $12AE1A |
  LDA #$00                                  ; $12AE1C |
  LDA $95                                   ; $12AE1E |
  AND #$0F                                  ; $12AE20 |
  BNE code_12AE5B                           ; $12AE22 |
  LDY #$0B                                  ; $12AE24 |
code_12AE26:
  LDA $AE81,y                               ; $12AE26 |
  SEC                                       ; $12AE29 |
  SBC $0500,x                               ; $12AE2A |
  BCS code_12AE31                           ; $12AE2D |
  LDA #$0F                                  ; $12AE2F |
code_12AE31:
  STA $0604,y                               ; $12AE31 |
  STA $0624,y                               ; $12AE34 |
  DEY                                       ; $12AE37 |
  BPL code_12AE26                           ; $12AE38 |
  LDY #$07                                  ; $12AE3A |
code_12AE3C:
  LDA $AE8D,y                               ; $12AE3C |
  SEC                                       ; $12AE3F |
  SBC $0500,x                               ; $12AE40 |
  BCS code_12AE47                           ; $12AE43 |
  LDA #$0F                                  ; $12AE45 |
code_12AE47:
  STA $0618,y                               ; $12AE47 |
  STA $0638,y                               ; $12AE4A |
  DEY                                       ; $12AE4D |
  BPL code_12AE3C                           ; $12AE4E |
  STY $18                                   ; $12AE50 |
  LDA $0500,x                               ; $12AE52 |
  SEC                                       ; $12AE55 |
  SBC #$10                                  ; $12AE56 |
  STA $0500,x                               ; $12AE58 |
code_12AE5B:
  LDA #$80                                  ; $12AE5B |
  STA $B0                                   ; $12AE5D |
code_12AE5F:
  LDA $B0                                   ; $12AE5F |
  CMP #$9C                                  ; $12AE61 |
  BNE code_12AE7B                           ; $12AE63 |
  LDA #$00                                  ; $12AE65 |
  STA $30                                   ; $12AE67 |
  STA $0500,x                               ; $12AE69 |
  LDA #$C0                                  ; $12AE6C |
  STA $0300,x                               ; $12AE6E |
  LDA #$E8                                  ; $12AE71 |
  STA $0320,x                               ; $12AE73 |
  LDA #$1C                                  ; $12AE76 |
  STA $04E0,x                               ; $12AE78 |
code_12AE7B:
  LDA #$00                                  ; $12AE7B |
  STA $05E0,x                               ; $12AE7D |
  RTS                                       ; $12AE80 |

  db $0F, $30, $16, $04, $0F, $30, $11, $01 ; $12AE81 |
  db $0F, $30, $36, $26, $0F, $01, $30, $11 ; $12AE89 |
  db $0F, $0F, $30, $10                     ; $12AE91 |

code_12AE95:
  LDA $0500,x                               ; $12AE95 |
  BNE code_12AEAC                           ; $12AE98 |
  JSR code_1FF8C2                           ; $12AE9A |
  CMP #$50                                  ; $12AE9D |
  BCS code_12AEAF                           ; $12AE9F |
  JSR code_1FF869                           ; $12AEA1 |
  JSR code_12AFD2                           ; $12AEA4 |
  LDA #$1F                                  ; $12AEA7 |
  STA $0500,x                               ; $12AEA9 |
code_12AEAC:
  DEC $0500,x                               ; $12AEAC |
code_12AEAF:
  LDA $0540,x                               ; $12AEAF |
  BNE code_12AEBB                           ; $12AEB2 |
  JSR code_1FF8B3                           ; $12AEB4 |
  CMP #$30                                  ; $12AEB7 |
  BCS code_12AEE3                           ; $12AEB9 |
code_12AEBB:
  LDA $0520,x                               ; $12AEBB |
  BNE code_12AEE0                           ; $12AEBE |
  LDA #$02                                  ; $12AEC0 |
  STA $01                                   ; $12AEC2 |
  JSR code_12AF76                           ; $12AEC4 |
  LDA #$1F                                  ; $12AEC7 |
  STA $0520,x                               ; $12AEC9 |
  INC $0540,x                               ; $12AECC |
  LDA $0540,x                               ; $12AECF |
  CMP #$03                                  ; $12AED2 |
  BCC code_12AEE0                           ; $12AED4 |
  LDA #$79                                  ; $12AED6 |
  STA $0520,x                               ; $12AED8 |
  LDA #$00                                  ; $12AEDB |
  STA $0540,x                               ; $12AEDD |
code_12AEE0:
  DEC $0520,x                               ; $12AEE0 |
code_12AEE3:
  LDA $04E0,x                               ; $12AEE3 |
  CMP #$0F                                  ; $12AEE6 |
  BCC code_12AEEB                           ; $12AEE8 |
  RTS                                       ; $12AEEA |

code_12AEEB:
  LDY #$17                                  ; $12AEEB |
code_12AEED:
  CPY #$10                                  ; $12AEED |
  BCS code_12AEF5                           ; $12AEEF |
  LDA #$7A                                  ; $12AEF1 |
  BNE code_12AEF7                           ; $12AEF3 |
code_12AEF5:
  LDA #$5B                                  ; $12AEF5 |
code_12AEF7:
  JSR code_1FF846                           ; $12AEF7 |
  LDA #$90                                  ; $12AEFA |
  STA $0580,y                               ; $12AEFC |
  LDA #$00                                  ; $12AEFF |
  STA $0480,y                               ; $12AF01 |
  LDA #$10                                  ; $12AF04 |
  STA $0320,y                               ; $12AF06 |
  LDA $0360,x                               ; $12AF09 |
  STA $0360,y                               ; $12AF0C |
  LDA $0380,x                               ; $12AF0F |
  STA $0380,y                               ; $12AF12 |
  LDA $03C0,x                               ; $12AF15 |
  STA $03C0,y                               ; $12AF18 |
  LDA $D7E9,y                               ; $12AF1B |
  STA $0400,y                               ; $12AF1E |
  LDA $D7F9,y                               ; $12AF21 |
  STA $0420,y                               ; $12AF24 |
  LDA $D809,y                               ; $12AF27 |
  STA $0440,y                               ; $12AF2A |
  LDA $D819,y                               ; $12AF2D |
  STA $0460,y                               ; $12AF30 |
  DEY                                       ; $12AF33 |
  CPY #$07                                  ; $12AF34 |
  BNE code_12AEED                           ; $12AF36 |
  LDA #$10                                  ; $12AF38 |
  STA $30                                   ; $12AF3A |
  LDA #$C0                                  ; $12AF3C |
  STA $0300,x                               ; $12AF3E |
  LDA #$00                                  ; $12AF41 |
  STA $69                                   ; $12AF43 |
  STA $6A                                   ; $12AF45 |
  STA $0400,x                               ; $12AF47 |
  STA $0420,x                               ; $12AF4A |
  LDA #$B4                                  ; $12AF4D |
  STA $0500,x                               ; $12AF4F |
  LDA #$F0                                  ; $12AF52 |
  STA $0520,x                               ; $12AF54 |
  LDA #$02                                  ; $12AF57 |
  STA $0540,x                               ; $12AF59 |
  LDA #$E9                                  ; $12AF5C |
  STA $0320,x                               ; $12AF5E |
  LDA $0580,x                               ; $12AF61 |
  ORA #$04                                  ; $12AF64 |
  STA $0580,x                               ; $12AF66 |
  LDA $0480,x                               ; $12AF69 |
  AND #$BF                                  ; $12AF6C |
  STA $0480,x                               ; $12AF6E |
  LDA #$6B                                  ; $12AF71 |
  JMP reset_sprite_anim                     ; $12AF73 |

code_12AF76:
  JSR code_1FFC53                           ; $12AF76 |
  BCS code_12AFCD                           ; $12AF79 |
  STY $00                                   ; $12AF7B |
  LDA $04A0,x                               ; $12AF7D |
  STA $04A0,y                               ; $12AF80 |
  AND #$02                                  ; $12AF83 |
  TAY                                       ; $12AF85 |
  LDA $0360,x                               ; $12AF86 |
  CLC                                       ; $12AF89 |
  ADC $AFCE,y                               ; $12AF8A |
  PHA                                       ; $12AF8D |
  LDA $0380,x                               ; $12AF8E |
  ADC $AFCF,y                               ; $12AF91 |
  LDY $00                                   ; $12AF94 |
  STA $0380,y                               ; $12AF96 |
  PLA                                       ; $12AF99 |
  STA $0360,y                               ; $12AF9A |
  LDA $03C0,x                               ; $12AF9D |
  STA $03C0,y                               ; $12AFA0 |
  LDA #$80                                  ; $12AFA3 |
  STA $0400,y                               ; $12AFA5 |
  LDA #$01                                  ; $12AFA8 |
  STA $0420,y                               ; $12AFAA |
  LDA #$58                                  ; $12AFAD |
  JSR code_1FF846                           ; $12AFAF |
  LDA #$51                                  ; $12AFB2 |
  STA $0320,y                               ; $12AFB4 |
  LDA #$8B                                  ; $12AFB7 |
  STA $0480,y                               ; $12AFB9 |
  LDA #$00                                  ; $12AFBC |
  STA $04E0,y                               ; $12AFBE |
  LDA $04A0,x                               ; $12AFC1 |
  EOR #$03                                  ; $12AFC4 |
  STA $04A0,x                               ; $12AFC6 |
  DEC $01                                   ; $12AFC9 |
  BNE code_12AF76                           ; $12AFCB |
code_12AFCD:
  RTS                                       ; $12AFCD |

  db $0F, $00, $F1, $FF                     ; $12AFCE |

code_12AFD2:
  JSR code_1FFC53                           ; $12AFD2 |
  BCS code_12B02E                           ; $12AFD5 |
  LDA #$00                                  ; $12AFD7 |
  STA $0440,y                               ; $12AFD9 |
  LDA #$04                                  ; $12AFDC |
  STA $0460,y                               ; $12AFDE |
  LDA #$58                                  ; $12AFE1 |
  JSR code_1FF846                           ; $12AFE3 |
  LDA #$8B                                  ; $12AFE6 |
  STA $0480,y                               ; $12AFE8 |
  LDA #$0C                                  ; $12AFEB |
  STA $0320,y                               ; $12AFED |
  LDA $0360,x                               ; $12AFF0 |
  STA $0360,y                               ; $12AFF3 |
  LDA $0380,x                               ; $12AFF6 |
  STA $0380,y                               ; $12AFF9 |
  LDA $03C0,x                               ; $12AFFC |
  SEC                                       ; $12AFFF |
  SBC #$10                                  ; $12B000 |
  STA $03C0,y                               ; $12B002 |
  LDA $03E0,x                               ; $12B005 |
  STA $03E0,y                               ; $12B008 |
  LDA $04A0,x                               ; $12B00B |
  STA $04A0,y                               ; $12B00E |
  JSR code_1FF8C2                           ; $12B011 |
  STX $00                                   ; $12B014 |
  LDX #$03                                  ; $12B016 |
code_12B018:
  CMP $B02F,x                               ; $12B018 |
  BCC code_12B020                           ; $12B01B |
  DEX                                       ; $12B01D |
  BNE code_12B018                           ; $12B01E |
code_12B020:
  LDA $B033,x                               ; $12B020 |
  STA $0400,y                               ; $12B023 |
  LDA $B037,x                               ; $12B026 |
  STA $0420,y                               ; $12B029 |
  LDX $00                                   ; $12B02C |
code_12B02E:
  RTS                                       ; $12B02E |

  db $4C, $3D, $2E, $1F, $00, $80, $00, $80 ; $12B02F |
  db $02, $01, $01, $00                     ; $12B037 |

code_12B03B:
  LDA $0500,x                               ; $12B03B |
  BNE code_12B08E                           ; $12B03E |
  JSR code_1FFC53                           ; $12B040 |
  BCS code_12B091                           ; $12B043 |
  LDA #$77                                  ; $12B045 |
  JSR code_1FF846                           ; $12B047 |
  LDA $0360,x                               ; $12B04A |
  STA $0360,y                               ; $12B04D |
  LDA $0380,x                               ; $12B050 |
  STA $0380,y                               ; $12B053 |
  LDA $03C0,x                               ; $12B056 |
  CLC                                       ; $12B059 |
  ADC #$38                                  ; $12B05A |
  STA $03C0,y                               ; $12B05C |
  LDA #$80                                  ; $12B05F |
  STA $0480,y                               ; $12B061 |
  LDA #$50                                  ; $12B064 |
  STA $0320,y                               ; $12B066 |
  LDA #$00                                  ; $12B069 |
  STA $0400,y                               ; $12B06B |
  STA $02                                   ; $12B06E |
  LDA #$04                                  ; $12B070 |
  STA $0420,y                               ; $12B072 |
  STA $03                                   ; $12B075 |
  STY $0F                                   ; $12B077 |
  STX $0E                                   ; $12B079 |
  LDX $0F                                   ; $12B07B |
  JSR code_1FFC63                           ; $12B07D |
  LDY $0F                                   ; $12B080 |
  LDX $0E                                   ; $12B082 |
  LDA $0C                                   ; $12B084 |
  STA $04A0,y                               ; $12B086 |
  LDA #$B5                                  ; $12B089 |
  STA $0500,x                               ; $12B08B |
code_12B08E:
  DEC $0500,x                               ; $12B08E |
code_12B091:
  LDA $0520,x                               ; $12B091 |
  BNE code_12B108                           ; $12B094 |
  LDA $0540,x                               ; $12B096 |
  AND #$01                                  ; $12B099 |
  BNE code_12B0E1                           ; $12B09B |
  LDA $69                                   ; $12B09D |
  CLC                                       ; $12B09F |
  ADC $0400,x                               ; $12B0A0 |
  STA $69                                   ; $12B0A3 |
  LDA $6A                                   ; $12B0A5 |
  ADC $0420,x                               ; $12B0A7 |
  STA $6A                                   ; $12B0AA |
  CMP #$A0                                  ; $12B0AC |
  BCS code_12B0CC                           ; $12B0AE |
  LDA $0400,x                               ; $12B0B0 |
  CLC                                       ; $12B0B3 |
  ADC #$10                                  ; $12B0B4 |
  STA $0400,x                               ; $12B0B6 |
  LDA $0420,x                               ; $12B0B9 |
  ADC #$00                                  ; $12B0BC |
  STA $0420,x                               ; $12B0BE |
  CMP #$03                                  ; $12B0C1 |
  BNE code_12B10B                           ; $12B0C3 |
  LDA #$00                                  ; $12B0C5 |
  STA $0400,x                               ; $12B0C7 |
  BEQ code_12B10B                           ; $12B0CA |
code_12B0CC:
  LDA #$A0                                  ; $12B0CC |
  STA $6A                                   ; $12B0CE |
  LDA #$80                                  ; $12B0D0 |
  STA $0400,x                               ; $12B0D2 |
  LDA #$01                                  ; $12B0D5 |
  STA $0420,x                               ; $12B0D7 |
  LDA #$01                                  ; $12B0DA |
  STA $0540,x                               ; $12B0DC |
  BNE code_12B10B                           ; $12B0DF |
code_12B0E1:
  LDA $69                                   ; $12B0E1 |
  SEC                                       ; $12B0E3 |
  SBC $0400,x                               ; $12B0E4 |
  STA $69                                   ; $12B0E7 |
  LDA $6A                                   ; $12B0E9 |
  SBC $0420,x                               ; $12B0EB |
  STA $6A                                   ; $12B0EE |
  BCS code_12B10B                           ; $12B0F0 |
  LDA #$00                                  ; $12B0F2 |
  STA $69                                   ; $12B0F4 |
  STA $6A                                   ; $12B0F6 |
  STA $0400,x                               ; $12B0F8 |
  STA $0420,x                               ; $12B0FB |
  LDA #$F1                                  ; $12B0FE |
  STA $0520,x                               ; $12B100 |
  LDA #$02                                  ; $12B103 |
  STA $0540,x                               ; $12B105 |
code_12B108:
  DEC $0520,x                               ; $12B108 |
code_12B10B:
  JSR $8003                                 ; $12B10B |
  LDA $04E0,x                               ; $12B10E |
  BNE code_12B166                           ; $12B111 |
  STA $6A                                   ; $12B113 |
  STA $6B                                   ; $12B115 |
  LDY #$0B                                  ; $12B117 |
  LDA #$0F                                  ; $12B119 |
code_12B11B:
  STA $0604,y                               ; $12B11B |
  STA $0624,y                               ; $12B11E |
  DEY                                       ; $12B121 |
  BPL code_12B11B                           ; $12B122 |
  STY $18                                   ; $12B124 |
  LDY #$00                                  ; $12B126 |
code_12B128:
  LDA $B167,y                               ; $12B128 |
  STA $0780,y                               ; $12B12B |
  CMP #$FF                                  ; $12B12E |
  BEQ code_12B135                           ; $12B130 |
  INY                                       ; $12B132 |
  BNE code_12B128                           ; $12B133 |
code_12B135:
  STA $19                                   ; $12B135 |
  LDA #$80                                  ; $12B137 |
  STA $0310                                 ; $12B139 |
  LDA #$90                                  ; $12B13C |
  STA $0590                                 ; $12B13E |
  LDA #$6D                                  ; $12B141 |
  STA $05D0                                 ; $12B143 |
  LDA #$00                                  ; $12B146 |
  STA $05F0                                 ; $12B148 |
  STA $05B0                                 ; $12B14B |
  STA $0490                                 ; $12B14E |
  LDA #$EF                                  ; $12B151 |
  STA $0330                                 ; $12B153 |
  LDA #$A3                                  ; $12B156 |
  STA $0450                                 ; $12B158 |
  LDA #$04                                  ; $12B15B |
  STA $0470                                 ; $12B15D |
  LDA #$00                                  ; $12B160 |
  STA $6A                                   ; $12B162 |
  STA $6B                                   ; $12B164 |
code_12B166:
  RTS                                       ; $12B166 |

  db $23, $C0, $0F, $55, $55, $55, $55, $55 ; $12B167 |
  db $55, $55, $55, $55, $55, $55, $55, $55 ; $12B16F |
  db $55, $55, $55, $FF                     ; $12B177 |

code_12B17B:
  LDA $0580,x                               ; $12B17B |
  AND #$04                                  ; $12B17E |
  BNE code_12B1BF                           ; $12B180 |
  LDA $30                                   ; $12B182 |
  CMP #$06                                  ; $12B184 |
  BEQ code_12B1BF                           ; $12B186 |
  CMP #$0E                                  ; $12B188 |
  BEQ code_12B1BF                           ; $12B18A |
  LDA $03C0                                 ; $12B18C |
  PHA                                       ; $12B18F |
  INC $03C0                                 ; $12B190 |
  JSR code_1FFAE2                           ; $12B193 |
  BCS code_12B1A7                           ; $12B196 |
  LDA $041F                                 ; $12B198 |
  STA $37                                   ; $12B19B |
  LDA $043F                                 ; $12B19D |
  STA $38                                   ; $12B1A0 |
  LDA $055F                                 ; $12B1A2 |
  STA $36                                   ; $12B1A5 |
code_12B1A7:
  PLA                                       ; $12B1A7 |
  STA $03C0                                 ; $12B1A8 |
  LDA $04C0,x                               ; $12B1AB |
  CMP #$0D                                  ; $12B1AE |
  BEQ code_12B1BF                           ; $12B1B0 |
  LDA $39                                   ; $12B1B2 |
  BNE code_12B1BF                           ; $12B1B4 |
  JSR code_1FFAE2                           ; $12B1B6 |
  BCS code_12B1BF                           ; $12B1B9 |
  LDA #$0E                                  ; $12B1BB |
  STA $30                                   ; $12B1BD |
code_12B1BF:
  LDA $0580,x                               ; $12B1BF |
  ORA #$04                                  ; $12B1C2 |
  STA $0580,x                               ; $12B1C4 |
  LDA $B1C3,x                               ; $12B1C7 |
  SEC                                       ; $12B1CA |
  SBC $6A                                   ; $12B1CB |
  BCS code_12B1DA                           ; $12B1CD |
  STA $0360,x                               ; $12B1CF |
  LDA $0580,x                               ; $12B1D2 |
  AND #$FB                                  ; $12B1D5 |
  STA $0580,x                               ; $12B1D7 |
code_12B1DA:
  RTS                                       ; $12B1DA |

  db $80, $40, $10                          ; $12B1DB |

code_12B1DE:
  JSR code_1FFAE2                           ; $12B1DE |
  BCS code_12B20F                           ; $12B1E1 |
  JSR code_1FF8C2                           ; $12B1E3 |
  CMP #$02                                  ; $12B1E6 |
  BCS code_12B20F                           ; $12B1E8 |
  LDA $0360,x                               ; $12B1EA |
  STA $0360                                 ; $12B1ED |
  LDA $04C0,x                               ; $12B1F0 |
  SBC #$0E                                  ; $12B1F3 |
  CMP #$01                                  ; $12B1F5 |
  BEQ code_12B20F                           ; $12B1F7 |
  STA $6C                                   ; $12B1F9 |
  LDA #$11                                  ; $12B1FB |
  STA $30                                   ; $12B1FD |
  LDA #$13                                  ; $12B1FF |
  STA $05C0                                 ; $12B201 |
  LDA #$00                                  ; $12B204 |
  STA $05E0                                 ; $12B206 |
  STA $05A0                                 ; $12B209 |
  STA $0300,x                               ; $12B20C |
code_12B20F:
  RTS                                       ; $12B20F |

code_12B210:
  LDA $03C0,x                               ; $12B210 |
  CMP #$68                                  ; $12B213 |
  BEQ code_12B21F                           ; $12B215 |
  INC $0360,x                               ; $12B217 |
  LDA #$01                                  ; $12B21A |
  JMP code_12B224                           ; $12B21C |

code_12B21F:
  DEC $0360,x                               ; $12B21F |
  LDA #$02                                  ; $12B222 |
code_12B224:
  STA $04A0,x                               ; $12B224 |
  LDA $03C0,x                               ; $12B227 |
  PHA                                       ; $12B22A |
  DEC $03C0,x                               ; $12B22B |
  JSR code_1FFAE2                           ; $12B22E |
  PLA                                       ; $12B231 |
  STA $03C0,x                               ; $12B232 |
  BCS code_12B244                           ; $12B235 |
  LDA $04A0,x                               ; $12B237 |
  STA $36                                   ; $12B23A |
  LDA #$00                                  ; $12B23C |
  STA $37                                   ; $12B23E |
  LDA #$01                                  ; $12B240 |
  STA $38                                   ; $12B242 |
code_12B244:
  RTS                                       ; $12B244 |

code_12B245:
  LDA $03C0,x                               ; $12B245 |
  CMP #$A8                                  ; $12B248 |
  BEQ code_12B265                           ; $12B24A |
  CLC                                       ; $12B24C |
  ADC #$04                                  ; $12B24D |
  STA $03C0,x                               ; $12B24F |
  CMP #$A8                                  ; $12B252 |
  BNE code_12B279                           ; $12B254 |
  LDA #$6C                                  ; $12B256 |
  CMP $05C0,x                               ; $12B258 |
  BEQ code_12B265                           ; $12B25B |
  JSR reset_sprite_anim                     ; $12B25D |
  LDA #$10                                  ; $12B260 |
  STA $0500,x                               ; $12B262 |
code_12B265:
  LDA $05C0,x                               ; $12B265 |
  CMP #$6E                                  ; $12B268 |
  BNE code_12B279                           ; $12B26A |
  LDA $0500,x                               ; $12B26C |
  BEQ code_12B279                           ; $12B26F |
  DEC $0500,x                               ; $12B271 |
  LDA #$00                                  ; $12B274 |
  STA $05E0,x                               ; $12B276 |
code_12B279:
  RTS                                       ; $12B279 |

code_12B27A:
  LDY #$08                                  ; $12B27A |
  JSR code_1FF67C                           ; $12B27C |
  BCS code_12B285                           ; $12B27F |
  INC $0360,x                               ; $12B281 |
  RTS                                       ; $12B284 |

code_12B285:
  LDA #$6C                                  ; $12B285 |
  CMP $05C0,x                               ; $12B287 |
  BEQ code_12B28F                           ; $12B28A |
  JSR reset_sprite_anim                     ; $12B28C |
code_12B28F:
  RTS                                       ; $12B28F |

code_12B290:
  JSR code_1FF797                           ; $12B290 |
  LDA #$B0                                  ; $12B293 |
  CMP $03C0,x                               ; $12B295 |
  BCS code_12B28F                           ; $12B298 |
  STA $03C0,x                               ; $12B29A |
  LDA $0500,x                               ; $12B29D |
  CMP #$02                                  ; $12B2A0 |
  BEQ code_12B301                           ; $12B2A2 |
  BCS code_12B307                           ; $12B2A4 |
  LDA #$00                                  ; $12B2A6 |
  STA $0300,x                               ; $12B2A8 |
code_12B2AB:
  LDA #$03                                  ; $12B2AB |
  STA $00                                   ; $12B2AD |
code_12B2AF:
  JSR code_1FFC53                           ; $12B2AF |
  BCS code_12B28F                           ; $12B2B2 |
  LDA #$78                                  ; $12B2B4 |
  JSR code_1FF846                           ; $12B2B6 |
  LDA #$FA                                  ; $12B2B9 |
  STA $0320,y                               ; $12B2BB |
  LDA #$00                                  ; $12B2BE |
  STA $0480,y                               ; $12B2C0 |
  LDA $0380,x                               ; $12B2C3 |
  STA $0380,y                               ; $12B2C6 |
  STA $0400,y                               ; $12B2C9 |
  LDA #$44                                  ; $12B2CC |
  STA $0440,y                               ; $12B2CE |
  LDA #$03                                  ; $12B2D1 |
  STA $0460,y                               ; $12B2D3 |
  STX $01                                   ; $12B2D6 |
  LDA $0360,x                               ; $12B2D8 |
  STA $02                                   ; $12B2DB |
  LDX $00                                   ; $12B2DD |
  LDA $B37A,x                               ; $12B2DF |
  STA $03C0,y                               ; $12B2E2 |
  LDA $02                                   ; $12B2E5 |
  CLC                                       ; $12B2E7 |
  ADC $B37E,x                               ; $12B2E8 |
  STA $0360,y                               ; $12B2EB |
  LDA $B382,x                               ; $12B2EE |
  STA $04A0,y                               ; $12B2F1 |
  LDA $B386,x                               ; $12B2F4 |
  STA $0420,y                               ; $12B2F7 |
  LDX $01                                   ; $12B2FA |
  DEC $00                                   ; $12B2FC |
  BPL code_12B2AF                           ; $12B2FE |
  RTS                                       ; $12B300 |

code_12B301:
  LDA #$00                                  ; $12B301 |
  STA $0310                                 ; $12B303 |
  RTS                                       ; $12B306 |

code_12B307:
  LDA $0580                                 ; $12B307 |
  ORA #$04                                  ; $12B30A |
  STA $0580                                 ; $12B30C |
  LDA $0520,x                               ; $12B30F |
  CMP #$3C                                  ; $12B312 |
  BNE code_12B32B                           ; $12B314 |
  LDA #$79                                  ; $12B316 |
  JSR reset_sprite_anim                     ; $12B318 |
  STX $0560                                 ; $12B31B |
  LDA #$00                                  ; $12B31E |
  STA $0320,x                               ; $12B320 |
  LDA #$B4                                  ; $12B323 |
  STA $03C0,x                               ; $12B325 |
  JMP code_12B2AB                           ; $12B328 |

code_12B32B:
  INC $0520,x                               ; $12B32B |
  BNE code_12B379                           ; $12B32E |
  JSR code_1FFC53                           ; $12B330 |
  BCS code_12B379                           ; $12B333 |
  LDA #$7D                                  ; $12B335 |
  JSR code_1FF846                           ; $12B337 |
  LDA #$00                                  ; $12B33A |
  STA $03C0,y                               ; $12B33C |
  LDA $0360,x                               ; $12B33F |
  STA $0360,y                               ; $12B342 |
  LDA $0380,x                               ; $12B345 |
  STA $0380,y                               ; $12B348 |
  STA $0500,y                               ; $12B34B |
  LDA #$00                                  ; $12B34E |
  STA $0480,y                               ; $12B350 |
  STA $0440,y                               ; $12B353 |
  STA $0460,y                               ; $12B356 |
  STA $0400,y                               ; $12B359 |
  STA $0420,y                               ; $12B35C |
  LDA #$FB                                  ; $12B35F |
  STA $0320,y                               ; $12B361 |
  LDA #$01                                  ; $12B364 |
  STA $04A0,y                               ; $12B366 |
  LDY #$07                                  ; $12B369 |
code_12B36B:
  LDA $B46C,y                               ; $12B36B |
  STA $0610,y                               ; $12B36E |
  STA $0630,y                               ; $12B371 |
  DEY                                       ; $12B374 |
  BPL code_12B36B                           ; $12B375 |
  STY $18                                   ; $12B377 |
code_12B379:
  RTS                                       ; $12B379 |

  db $A8, $A8, $B8, $B8, $F8, $08, $F8, $08 ; $12B37A |
  db $02, $01, $02, $01, $02, $02, $01, $01 ; $12B382 |

code_12B38A:
  JSR code_1FF797                           ; $12B38A |
  LDA $03C0,x                               ; $12B38D |
  CMP #$B8                                  ; $12B390 |
  BCC code_12B39A                           ; $12B392 |
  LDA #$00                                  ; $12B394 |
  STA $0300,x                               ; $12B396 |
  RTS                                       ; $12B399 |

code_12B39A:
  LDA $04A0,x                               ; $12B39A |
  AND #$01                                  ; $12B39D |
  BEQ code_12B3A4                           ; $12B39F |
  JMP code_1FF71D                           ; $12B3A1 |

code_12B3A4:
  JMP code_1FF73B                           ; $12B3A4 |

code_12B3A7:
  JSR code_1FF797                           ; $12B3A7 |
  LDA $04A0,x                               ; $12B3AA |
  AND #$02                                  ; $12B3AD |
  BEQ code_12B3DA                           ; $12B3AF |
  LDA #$B4                                  ; $12B3B1 |
  CMP $03C0,x                               ; $12B3B3 |
  BCS code_12B41D                           ; $12B3B6 |
  LDA #$00                                  ; $12B3B8 |
  STA $0300,x                               ; $12B3BA |
  LDA #$81                                  ; $12B3BD |
  STA $0300                                 ; $12B3BF |
  LDA #$00                                  ; $12B3C2 |
  LDY $0560                                 ; $12B3C4 |
  STA $0300,y                               ; $12B3C7 |
  STA $0500                                 ; $12B3CA |
  LDA #$0D                                  ; $12B3CD |
  STA $30                                   ; $12B3CF |
  LDA $0580                                 ; $12B3D1 |
  AND #$FB                                  ; $12B3D4 |
  STA $0580                                 ; $12B3D6 |
  RTS                                       ; $12B3D9 |

code_12B3DA:
  LDA #$94                                  ; $12B3DA |
  CMP $03C0,x                               ; $12B3DC |
  BCS code_12B418                           ; $12B3DF |
  STA $03C0,x                               ; $12B3E1 |
  LDA $05C0,x                               ; $12B3E4 |
  CMP #$7A                                  ; $12B3E7 |
  BEQ code_12B42A                           ; $12B3E9 |
  CMP #$7B                                  ; $12B3EB |
  BNE code_12B3F8                           ; $12B3ED |
  LDA #$7A                                  ; $12B3EF |
  JSR reset_sprite_anim                     ; $12B3F1 |
  LDA #$00                                  ; $12B3F4 |
  STA $B8                                   ; $12B3F6 |
code_12B3F8:
  LDA $05A0,x                               ; $12B3F8 |
  CMP #$04                                  ; $12B3FB |
  BNE code_12B46B                           ; $12B3FD |
  LDA #$7B                                  ; $12B3FF |
  JSR reset_sprite_anim                     ; $12B401 |
  LDA #$A3                                  ; $12B404 |
  STA $0440,x                               ; $12B406 |
  LDA #$04                                  ; $12B409 |
  STA $0460,x                               ; $12B40B |
  LDA #$9B                                  ; $12B40E |
  STA $0400,x                               ; $12B410 |
  LDA #$02                                  ; $12B413 |
  STA $0420,x                               ; $12B415 |
code_12B418:
  LDA #$00                                  ; $12B418 |
  STA $05E0,x                               ; $12B41A |
code_12B41D:
  LDA $04A0,x                               ; $12B41D |
  AND #$01                                  ; $12B420 |
  BEQ code_12B427                           ; $12B422 |
  JMP code_1FF71D                           ; $12B424 |

code_12B427:
  JMP code_1FF73B                           ; $12B427 |

code_12B42A:
  INC $0500,x                               ; $12B42A |
  LDA $0500,x                               ; $12B42D |
  CMP #$3C                                  ; $12B430 |
  BNE code_12B46B                           ; $12B432 |
  LDA $B8                                   ; $12B434 |
  BNE code_12B44A                           ; $12B436 |
  DEC $0500,x                               ; $12B438 |
  LDA #$11                                  ; $12B43B |
  STA $F8                                   ; $12B43D |
  LDA #$D0                                  ; $12B43F |
  STA $5E                                   ; $12B441 |
  LDA #$0A                                  ; $12B443 |
  STA $B8                                   ; $12B445 |
  JMP code_1FFD8C                           ; $12B447 |

code_12B44A:
  JSR code_1FFDA6                           ; $12B44A |
  LDA $B8                                   ; $12B44D |
  CMP #$FF                                  ; $12B44F |
  BEQ code_12B457                           ; $12B451 |
  DEC $0500,x                               ; $12B453 |
  RTS                                       ; $12B456 |

code_12B457:
  LDA #$A3                                  ; $12B457 |
  STA $0440,x                               ; $12B459 |
  LDA #$04                                  ; $12B45C |
  STA $0460,x                               ; $12B45E |
  LDA #$7B                                  ; $12B461 |
  JSR reset_sprite_anim                     ; $12B463 |
  LDA #$02                                  ; $12B466 |
  STA $04A0,x                               ; $12B468 |
code_12B46B:
  RTS                                       ; $12B46B |

  db $0F, $0F, $2C, $11, $0F, $0F, $30, $37 ; $12B46C |

code_12B474:
  LDA $0480,x                               ; $12B474 |
  PHA                                       ; $12B477 |
  LDA #$00                                  ; $12B478 |
  STA $0480,x                               ; $12B47A |
  JSR $8003                                 ; $12B47D |
  PLA                                       ; $12B480 |
  STA $0480,x                               ; $12B481 |
  BCS code_12B4E5                           ; $12B484 |
  LDA $04E0,x                               ; $12B486 |
  BNE code_12B4E5                           ; $12B489 |
  STA $F8                                   ; $12B48B |
  STA $0480,x                               ; $12B48D |
  LDA #$02                                  ; $12B490 |
  STA $01                                   ; $12B492 |
  LDA $0360,x                               ; $12B494 |
  STA $02                                   ; $12B497 |
  LDA $03C0,x                               ; $12B499 |
  STA $03                                   ; $12B49C |
code_12B49E:
  JSR code_1FFC53                           ; $12B49E |
  BCS code_12B4E4                           ; $12B4A1 |
  LDA #$71                                  ; $12B4A3 |
  JSR code_1FF846                           ; $12B4A5 |
  LDA #$00                                  ; $12B4A8 |
  STA $0500,y                               ; $12B4AA |
  STA $0480,y                               ; $12B4AD |
  LDA #$19                                  ; $12B4B0 |
  STA $0320,y                               ; $12B4B2 |
  LDA $0380,x                               ; $12B4B5 |
  STA $0380,y                               ; $12B4B8 |
  STX $0F                                   ; $12B4BB |
  LDX $01                                   ; $12B4BD |
  LDA $02                                   ; $12B4BF |
  CLC                                       ; $12B4C1 |
  ADC $B64E,x                               ; $12B4C2 |
  STA $0360,y                               ; $12B4C5 |
  LDA $03                                   ; $12B4C8 |
  CLC                                       ; $12B4CA |
  ADC $B651,x                               ; $12B4CB |
  STA $03C0,y                               ; $12B4CE |
  LDX $0F                                   ; $12B4D1 |
  DEC $01                                   ; $12B4D3 |
  BPL code_12B49E                           ; $12B4D5 |
  LDY #$0F                                  ; $12B4D7 |
code_12B4D9:
  LDA $B654,y                               ; $12B4D9 |
  STA $0600,y                               ; $12B4DC |
  DEY                                       ; $12B4DF |
  BPL code_12B4D9                           ; $12B4E0 |
  STY $18                                   ; $12B4E2 |
code_12B4E4:
  RTS                                       ; $12B4E4 |

code_12B4E5:
  LDA $F8                                   ; $12B4E5 |
  CMP #$03                                  ; $12B4E7 |
  BCC code_12B4E4                           ; $12B4E9 |
  LDA $0520,x                               ; $12B4EB |
  BEQ code_12B50A                           ; $12B4EE |
  DEC $0520,x                               ; $12B4F0 |
  BNE code_12B507                           ; $12B4F3 |
  LDA $0540,x                               ; $12B4F5 |
  BEQ code_12B507                           ; $12B4F8 |
  DEC $0540,x                               ; $12B4FA |
  BEQ code_12B507                           ; $12B4FD |
  LDA #$1E                                  ; $12B4FF |
  STA $0520,x                               ; $12B501 |
  JMP code_12B5FB                           ; $12B504 |

code_12B507:
  JMP code_12B595                           ; $12B507 |

code_12B50A:
  LDA $0300,x                               ; $12B50A |
  AND #$0F                                  ; $12B50D |
  BNE code_12B526                           ; $12B50F |
  INC $0300,x                               ; $12B511 |
  STA $0460,x                               ; $12B514 |
  LDA #$80                                  ; $12B517 |
  STA $0440,x                               ; $12B519 |
  LDA #$88                                  ; $12B51C |
  STA $04A0,x                               ; $12B51E |
  LDA #$F0                                  ; $12B521 |
  STA $0500,x                               ; $12B523 |
code_12B526:
  LDA $0500,x                               ; $12B526 |
  BNE code_12B548                           ; $12B529 |
  LDA $04A0,x                               ; $12B52B |
  EOR #$0C                                  ; $12B52E |
  AND #$0C                                  ; $12B530 |
  STA $04A0,x                               ; $12B532 |
  LDA $E4                                   ; $12B535 |
  ADC $E5                                   ; $12B537 |
  STA $E5                                   ; $12B539 |
  AND #$03                                  ; $12B53B |
  TAY                                       ; $12B53D |
  LDA $B63E,y                               ; $12B53E |
  STA $0500,x                               ; $12B541 |
  LDA #$00                                  ; $12B544 |
  STA $FC                                   ; $12B546 |
code_12B548:
  LDA $04A0,x                               ; $12B548 |
  AND #$04                                  ; $12B54B |
  BNE code_12B55E                           ; $12B54D |
  JSR code_1FF779                           ; $12B54F |
  LDA #$48                                  ; $12B552 |
  CMP $03C0,x                               ; $12B554 |
  BCC code_12B573                           ; $12B557 |
  STA $03C0,x                               ; $12B559 |
  BCS code_12B56B                           ; $12B55C |
code_12B55E:
  JSR code_1FF759                           ; $12B55E |
  LDA #$80                                  ; $12B561 |
  CMP $03C0,x                               ; $12B563 |
  BCS code_12B573                           ; $12B566 |
  STA $03C0,x                               ; $12B568 |
code_12B56B:
  LDA $04A0,x                               ; $12B56B |
  EOR #$0C                                  ; $12B56E |
  STA $04A0,x                               ; $12B570 |
code_12B573:
  DEC $0500,x                               ; $12B573 |
  BNE code_12B595                           ; $12B576 |
  LDA #$1E                                  ; $12B578 |
  STA $0520,x                               ; $12B57A |
  LDA $E4                                   ; $12B57D |
  ADC $E6                                   ; $12B57F |
  STA $E4                                   ; $12B581 |
  AND #$01                                  ; $12B583 |
  BEQ code_12B58D                           ; $12B585 |
  JSR code_12B5A1                           ; $12B587 |
  JMP code_12B595                           ; $12B58A |

code_12B58D:
  LDA #$03                                  ; $12B58D |
  STA $0540,x                               ; $12B58F |
  JSR code_12B5FB                           ; $12B592 |
code_12B595:
  LDA $03C0,x                               ; $12B595 |
  SEC                                       ; $12B598 |
  SBC #$D0                                  ; $12B599 |
  CLC                                       ; $12B59B |
  ADC #$AF                                  ; $12B59C |
  STA $5E                                   ; $12B59E |
  RTS                                       ; $12B5A0 |

code_12B5A1:
  LDA #$02                                  ; $12B5A1 |
  STA $01                                   ; $12B5A3 |
code_12B5A5:
  JSR code_1FFC53                           ; $12B5A5 |
  BCS code_12B5FA                           ; $12B5A8 |
  LDA #$6F                                  ; $12B5AA |
  JSR code_1FF846                           ; $12B5AC |
  LDA #$80                                  ; $12B5AF |
  STA $0480,y                               ; $12B5B1 |
  LDA #$00                                  ; $12B5B4 |
  STA $04E0,y                               ; $12B5B6 |
  LDA #$0F                                  ; $12B5B9 |
  STA $0320,y                               ; $12B5BB |
  LDA $0360,x                               ; $12B5BE |
  STA $0360,y                               ; $12B5C1 |
  LDA $0380,x                               ; $12B5C4 |
  STA $0380,y                               ; $12B5C7 |
  LDA $03C0,x                               ; $12B5CA |
  CLC                                       ; $12B5CD |
  ADC #$30                                  ; $12B5CE |
  STA $03C0,y                               ; $12B5D0 |
  LDA #$02                                  ; $12B5D3 |
  STA $04A0,y                               ; $12B5D5 |
  STX $00                                   ; $12B5D8 |
  LDX $01                                   ; $12B5DA |
  LDA $B642,x                               ; $12B5DC |
  STA $0400,y                               ; $12B5DF |
  LDA $B645,x                               ; $12B5E2 |
  STA $0420,y                               ; $12B5E5 |
  LDA $B648,x                               ; $12B5E8 |
  STA $0440,y                               ; $12B5EB |
  LDA $B64B,x                               ; $12B5EE |
  STA $0460,y                               ; $12B5F1 |
  LDX $00                                   ; $12B5F4 |
  DEC $01                                   ; $12B5F6 |
  BPL code_12B5A5                           ; $12B5F8 |
code_12B5FA:
  RTS                                       ; $12B5FA |

code_12B5FB:
  JSR code_1FFC53                           ; $12B5FB |
  BCS code_12B5FA                           ; $12B5FE |
  LDA #$1D                                  ; $12B600 |
  JSR code_1FF846                           ; $12B602 |
  LDA #$C0                                  ; $12B605 |
  STA $0480,y                               ; $12B607 |
  LDA #$6D                                  ; $12B60A |
  STA $0320,y                               ; $12B60C |
  LDA $0360,x                               ; $12B60F |
  STA $0360,y                               ; $12B612 |
  LDA $0380,x                               ; $12B615 |
  STA $0380,y                               ; $12B618 |
  LDA $03C0,x                               ; $12B61B |
  CLC                                       ; $12B61E |
  ADC #$30                                  ; $12B61F |
  STA $03C0,y                               ; $12B621 |
  LDA #$AB                                  ; $12B624 |
  STA $0440,y                               ; $12B626 |
  LDA #$FF                                  ; $12B629 |
  STA $0460,y                               ; $12B62B |
  LDA #$00                                  ; $12B62E |
  STA $0400,y                               ; $12B630 |
  LDA #$02                                  ; $12B633 |
  STA $0420,y                               ; $12B635 |
  LDA #$01                                  ; $12B638 |
  STA $04E0,y                               ; $12B63A |
  RTS                                       ; $12B63D |

  db $1E, $3C, $3C, $5A, $B5, $00, $B5, $00 ; $12B63E |
  db $01, $00, $4B, $00, $B5, $FF, $00, $00 ; $12B646 |
  db $00, $F0, $10, $00, $10, $10, $0F, $20 ; $12B64E |
  db $27, $17, $0F, $03, $12, $0F, $0F, $2B ; $12B656 |
  db $1B, $0B, $0F, $22, $12, $02           ; $12B65E |

code_12B664:
  LDA $0300,x                               ; $12B664 |
  AND #$0F                                  ; $12B667 |
  BNE code_12B68E                           ; $12B669 |
  LDA #$09                                  ; $12B66B |
  CMP $30                                   ; $12B66D |
  BEQ code_12B682                           ; $12B66F |
  STA $30                                   ; $12B671 |
  LDA #$80                                  ; $12B673 |
  STA $B0                                   ; $12B675 |
  STA $5A                                   ; $12B677 |
  LDA #$8E                                  ; $12B679 |
  STA $B3                                   ; $12B67B |
  LDA #$0D                                  ; $12B67D |
  JSR code_1FF898                           ; $12B67F |
code_12B682:
  LDA $B0                                   ; $12B682 |
  CMP #$9C                                  ; $12B684 |
  BNE code_12B6EC                           ; $12B686 |
  JSR code_12B732                           ; $12B688 |
  INC $0300,x                               ; $12B68B |
code_12B68E:
  LDA $0300,x                               ; $12B68E |
  AND #$02                                  ; $12B691 |
  BNE code_12B6EC                           ; $12B693 |
  LDA $05C0,x                               ; $12B695 |
  CMP #$4F                                  ; $12B698 |
  BEQ code_12B6B2                           ; $12B69A |
  LDA $0520,x                               ; $12B69C |
  BNE code_12B6ED                           ; $12B69F |
  LDA $0540,x                               ; $12B6A1 |
  CMP #$05                                  ; $12B6A4 |
  BCS code_12B6E9                           ; $12B6A6 |
  LDA $0500,x                               ; $12B6A8 |
  BNE code_12B6C7                           ; $12B6AB |
  LDA #$4F                                  ; $12B6AD |
  JSR reset_sprite_anim                     ; $12B6AF |
code_12B6B2:
  LDA $05A0,x                               ; $12B6B2 |
  CMP #$02                                  ; $12B6B5 |
  BNE code_12B6EC                           ; $12B6B7 |
  JSR code_12B756                           ; $12B6B9 |
  INC $0540,x                               ; $12B6BC |
  LDA #$31                                  ; $12B6BF |
  JSR reset_sprite_anim                     ; $12B6C1 |
  INC $0520,x                               ; $12B6C4 |
code_12B6C7:
  LDA $04A0,x                               ; $12B6C7 |
  AND #$01                                  ; $12B6CA |
  BEQ code_12B6D6                           ; $12B6CC |
  LDY #$20                                  ; $12B6CE |
  JSR code_1FF580                           ; $12B6D0 |
  JMP code_12B6DB                           ; $12B6D3 |

code_12B6D6:
  LDY #$21                                  ; $12B6D6 |
  JSR code_1FF5C4                           ; $12B6D8 |
code_12B6DB:
  BCC code_12B6E5                           ; $12B6DB |
  LDA $04A0,x                               ; $12B6DD |
  EOR #$03                                  ; $12B6E0 |
  STA $04A0,x                               ; $12B6E2 |
code_12B6E5:
  DEC $0500,x                               ; $12B6E5 |
  RTS                                       ; $12B6E8 |

code_12B6E9:
  INC $0300,x                               ; $12B6E9 |
code_12B6EC:
  RTS                                       ; $12B6EC |

code_12B6ED:
  LDA #$00                                  ; $12B6ED |
  STA $00                                   ; $12B6EF |
  LDA #$80                                  ; $12B6F1 |
  STA $01                                   ; $12B6F3 |
  LDY #$1F                                  ; $12B6F5 |
code_12B6F7:
  LDA $0300,y                               ; $12B6F7 |
  BMI code_12B726                           ; $12B6FA |
code_12B6FC:
  DEY                                       ; $12B6FC |
  CPY #$0F                                  ; $12B6FD |
  BNE code_12B6F7                           ; $12B6FF |
  LDA $00                                   ; $12B701 |
  BNE code_12B71D                           ; $12B703 |
  LDA #$00                                  ; $12B705 |
  STA $0520,x                               ; $12B707 |
  LDA $0540,x                               ; $12B70A |
  TAY                                       ; $12B70D |
  LDA $B0                                   ; $12B70E |
  SEC                                       ; $12B710 |
  SBC $B750,y                               ; $12B711 |
  STA $B0                                   ; $12B714 |
  AND #$1F                                  ; $12B716 |
  BNE code_12B71D                           ; $12B718 |
  JMP $8006                                 ; $12B71A |

code_12B71D:
  LDA #$31                                  ; $12B71D |
  JSR reset_sprite_anim                     ; $12B71F |
  JSR code_12B732                           ; $12B722 |
  RTS                                       ; $12B725 |

code_12B726:
  LDA $01                                   ; $12B726 |
  CMP $04C0,y                               ; $12B728 |
  BNE code_12B6FC                           ; $12B72B |
  INC $00                                   ; $12B72D |
  JMP code_12B6FC                           ; $12B72F |

code_12B732:
  LDA $E4                                   ; $12B732 |
  ADC $E5                                   ; $12B734 |
  STA $E5                                   ; $12B736 |
  AND #$03                                  ; $12B738 |
  TAY                                       ; $12B73A |
  LDA $B748,y                               ; $12B73B |
  STA $0500,x                               ; $12B73E |
  LDA $B74C,y                               ; $12B741 |
  STA $04A0,x                               ; $12B744 |
  RTS                                       ; $12B747 |

  db $40, $A0, $70, $D0, $01, $02, $01, $02 ; $12B748 |
  db $01, $02, $03, $05, $08, $0A           ; $12B750 |

code_12B756:
  JSR code_1FFC53                           ; $12B756 |
  BCS code_12B7C5                           ; $12B759 |
  STY $00                                   ; $12B75B |
  LDA $0360,x                               ; $12B75D |
  STA $0360,y                               ; $12B760 |
  LDA $0380,x                               ; $12B763 |
  STA $0380,y                               ; $12B766 |
  LDA $03C0,x                               ; $12B769 |
  CLC                                       ; $12B76C |
  ADC #$18                                  ; $12B76D |
  STA $03C0,y                               ; $12B76F |
  LDA #$C2                                  ; $12B772 |
  STA $0480,y                               ; $12B774 |
  LDA #$F1                                  ; $12B777 |
  STA $0320,y                               ; $12B779 |
  LDA #$03                                  ; $12B77C |
  STA $04E0,y                               ; $12B77E |
  LDA #$80                                  ; $12B781 |
  STA $04C0,y                               ; $12B783 |
  LDA $0540,x                               ; $12B786 |
  STA $0540,y                               ; $12B789 |
  STA $02                                   ; $12B78C |
  TAY                                       ; $12B78E |
  LDA $B7C6,y                               ; $12B78F |
  LDY $00                                   ; $12B792 |
  STA $04A0,y                               ; $12B794 |
  LDY $02                                   ; $12B797 |
  LDA $B7CC,y                               ; $12B799 |
  LDY $00                                   ; $12B79C |
  STA $0400,y                               ; $12B79E |
  STA $0440,y                               ; $12B7A1 |
  LDY $02                                   ; $12B7A4 |
  LDA $B7D2,y                               ; $12B7A6 |
  LDY $00                                   ; $12B7A9 |
  STA $0420,y                               ; $12B7AB |
  STA $0460,y                               ; $12B7AE |
  LDA #$5E                                  ; $12B7B1 |
  JSR code_1FF846                           ; $12B7B3 |
  LDA $04A0,y                               ; $12B7B6 |
  AND #$01                                  ; $12B7B9 |
  BNE code_12B7C5                           ; $12B7BB |
  LDA $0580,y                               ; $12B7BD |
  AND #$BF                                  ; $12B7C0 |
  STA $0580,y                               ; $12B7C2 |
code_12B7C5:
  RTS                                       ; $12B7C5 |

  db $06, $05, $05, $06, $05, $06, $80, $00 ; $12B7C6 |
  db $80, $00, $00, $00, $00, $01, $01, $02 ; $12B7CE |
  db $03, $04                               ; $12B7D6 |

code_12B7D8:
  LDA $0300,x                               ; $12B7D8 |
  AND #$0F                                  ; $12B7DB |
  BNE code_12B7EA                           ; $12B7DD |
  STA $0520,x                               ; $12B7DF |
  LDA #$78                                  ; $12B7E2 |
  STA $0500,x                               ; $12B7E4 |
  INC $0300,x                               ; $12B7E7 |
code_12B7EA:
  LDA $0300,x                               ; $12B7EA |
  AND #$02                                  ; $12B7ED |
  BEQ code_12B7F4                           ; $12B7EF |
  JMP code_12B8A3                           ; $12B7F1 |

code_12B7F4:
  JSR code_12B94A                           ; $12B7F4 |
  LDA $0500,x                               ; $12B7F7 |
  BNE code_12B815                           ; $12B7FA |
  LDA $03C0,x                               ; $12B7FC |
  CMP #$68                                  ; $12B7FF |
  BCS code_12B80A                           ; $12B801 |
  LDA #$78                                  ; $12B803 |
  STA $0500,x                               ; $12B805 |
  BNE code_12B819                           ; $12B808 |
code_12B80A:
  JSR code_12B9EC                           ; $12B80A |
  JSR code_12B989                           ; $12B80D |
  LDA #$FF                                  ; $12B810 |
  STA $0500,x                               ; $12B812 |
code_12B815:
  CMP #$FF                                  ; $12B815 |
  BEQ code_12B81C                           ; $12B817 |
code_12B819:
  DEC $0500,x                               ; $12B819 |
code_12B81C:
  LDA $04A0,x                               ; $12B81C |
  AND #$01                                  ; $12B81F |
  BEQ code_12B82B                           ; $12B821 |
  LDY #$0C                                  ; $12B823 |
  JSR code_1FF580                           ; $12B825 |
  JMP code_12B830                           ; $12B828 |

code_12B82B:
  LDY #$0D                                  ; $12B82B |
  JSR code_1FF5C4                           ; $12B82D |
code_12B830:
  BCC code_12B847                           ; $12B830 |
  LDA $04A0,x                               ; $12B832 |
  EOR #$03                                  ; $12B835 |
  STA $04A0,x                               ; $12B837 |
  AND #$0C                                  ; $12B83A |
  BNE code_12B8A2                           ; $12B83C |
  LDA $04A0,x                               ; $12B83E |
  ORA #$08                                  ; $12B841 |
  STA $04A0,x                               ; $12B843 |
  RTS                                       ; $12B846 |

code_12B847:
  LDA $04A0,x                               ; $12B847 |
  AND #$0C                                  ; $12B84A |
  BEQ code_12B8A2                           ; $12B84C |
  AND #$04                                  ; $12B84E |
  BEQ code_12B86A                           ; $12B850 |
  LDA $0500,x                               ; $12B852 |
  CMP #$FF                                  ; $12B855 |
  BEQ code_12B85D                           ; $12B857 |
  LDA #$5E                                  ; $12B859 |
  BNE code_12B85F                           ; $12B85B |
code_12B85D:
  LDA #$62                                  ; $12B85D |
code_12B85F:
  STA $05C0,x                               ; $12B85F |
  LDY #$0E                                  ; $12B862 |
  JSR code_1FF606                           ; $12B864 |
  JMP code_12B898                           ; $12B867 |

code_12B86A:
  LDA $04A0,x                               ; $12B86A |
  AND #$01                                  ; $12B86D |
  BEQ code_12B87B                           ; $12B86F |
  LDA $0580,x                               ; $12B871 |
  AND #$BF                                  ; $12B874 |
  STA $0580,x                               ; $12B876 |
  BNE code_12B883                           ; $12B879 |
code_12B87B:
  LDA $0580,x                               ; $12B87B |
  ORA #$40                                  ; $12B87E |
  STA $0580,x                               ; $12B880 |
code_12B883:
  LDA $0500,x                               ; $12B883 |
  CMP #$FF                                  ; $12B886 |
  BEQ code_12B88E                           ; $12B888 |
  LDA #$60                                  ; $12B88A |
  BNE code_12B890                           ; $12B88C |
code_12B88E:
  LDA #$64                                  ; $12B88E |
code_12B890:
  STA $05C0,x                               ; $12B890 |
  LDY #$0F                                  ; $12B893 |
  JSR code_1FF642                           ; $12B895 |
code_12B898:
  BCC code_12B8A2                           ; $12B898 |
  LDA $04A0,x                               ; $12B89A |
  EOR #$0C                                  ; $12B89D |
  STA $04A0,x                               ; $12B89F |
code_12B8A2:
  RTS                                       ; $12B8A2 |

code_12B8A3:
  LDA $0560,x                               ; $12B8A3 |
  BNE code_12B8C7                           ; $12B8A6 |
  LDA $0540,x                               ; $12B8A8 |
  TAY                                       ; $12B8AB |
  LDA $B932,y                               ; $12B8AC |
  STA $0440,x                               ; $12B8AF |
  LDA $B938,y                               ; $12B8B2 |
  STA $0460,x                               ; $12B8B5 |
  LDA $B93E,y                               ; $12B8B8 |
  STA $0400,x                               ; $12B8BB |
  LDA $B944,y                               ; $12B8BE |
  STA $0420,x                               ; $12B8C1 |
  INC $0560,x                               ; $12B8C4 |
code_12B8C7:
  LDY #$0F                                  ; $12B8C7 |
  JSR code_1FF67C                           ; $12B8C9 |
  LDA $10                                   ; $12B8CC |
  AND #$10                                  ; $12B8CE |
  BEQ code_12B8D5                           ; $12B8D0 |
  JMP code_12B8FB                           ; $12B8D2 |

code_12B8D5:
  LDA $04A0,x                               ; $12B8D5 |
  AND #$01                                  ; $12B8D8 |
  BEQ code_12B8EC                           ; $12B8DA |
  LDY #$0C                                  ; $12B8DC |
  JSR code_1FF580                           ; $12B8DE |
  LDA $0580,x                               ; $12B8E1 |
  AND #$BF                                  ; $12B8E4 |
  STA $0580,x                               ; $12B8E6 |
  JMP code_12B8F9                           ; $12B8E9 |

code_12B8EC:
  LDY #$0D                                  ; $12B8EC |
  JSR code_1FF5C4                           ; $12B8EE |
  LDA $0580,x                               ; $12B8F1 |
  ORA #$40                                  ; $12B8F4 |
  STA $0580,x                               ; $12B8F6 |
code_12B8F9:
  BCC code_12B925                           ; $12B8F9 |
code_12B8FB:
  DEC $0300,x                               ; $12B8FB |
  LDA #$00                                  ; $12B8FE |
  STA $0520,x                               ; $12B900 |
  STA $0560,x                               ; $12B903 |
  LDA $04A0,x                               ; $12B906 |
  EOR #$0C                                  ; $12B909 |
  STA $04A0,x                               ; $12B90B |
  LDA $0540,x                               ; $12B90E |
  TAY                                       ; $12B911 |
  LDA $B7CC,y                               ; $12B912 |
  STA $0440,x                               ; $12B915 |
  STA $0400,x                               ; $12B918 |
  LDA $B7D2,y                               ; $12B91B |
  STA $0460,x                               ; $12B91E |
  STA $0420,x                               ; $12B921 |
  RTS                                       ; $12B924 |

code_12B925:
  LDA $0460,x                               ; $12B925 |
  BPL code_12B931                           ; $12B928 |
  LDA $03C0,x                               ; $12B92A |
  CMP #$20                                  ; $12B92D |
  BCS code_12B8FB                           ; $12B92F |
code_12B931:
  RTS                                       ; $12B931 |

  db $A2, $4F, $B4, $44, $00, $9E, $01, $02 ; $12B932 |
  db $02, $03, $04, $04, $00, $80, $00, $80 ; $12B93A |
  db $00, $80, $01, $01, $02, $02, $03, $03 ; $12B942 |

code_12B94A:
  LDA $0520,x                               ; $12B94A |
  BNE code_12B973                           ; $12B94D |
  LDA $03C0,x                               ; $12B94F |
  CMP #$45                                  ; $12B952 |
  BCC code_12B972                           ; $12B954 |
  JSR code_12B9B5                           ; $12B956 |
  LDA $0540,x                               ; $12B959 |
  TAY                                       ; $12B95C |
  LDA $B7CC,y                               ; $12B95D |
  STA $0440,x                               ; $12B960 |
  STA $0400,x                               ; $12B963 |
  LDA $B7D2,y                               ; $12B966 |
  STA $0460,x                               ; $12B969 |
  STA $0420,x                               ; $12B96C |
  INC $0520,x                               ; $12B96F |
code_12B972:
  RTS                                       ; $12B972 |

code_12B973:
  LDA $03C0,x                               ; $12B973 |
  CMP #$45                                  ; $12B976 |
  BCS code_12B972                           ; $12B978 |
  JSR code_12B9B5                           ; $12B97A |
  LDA #$00                                  ; $12B97D |
  STA $0520,x                               ; $12B97F |
  STA $0560,x                               ; $12B982 |
  INC $0300,x                               ; $12B985 |
  RTS                                       ; $12B988 |

code_12B989:
  LDA $04A0,x                               ; $12B989 |
  AND #$0C                                  ; $12B98C |
  BEQ code_12B996                           ; $12B98E |
  LDA #$62                                  ; $12B990 |
  STA $05C0,x                               ; $12B992 |
  RTS                                       ; $12B995 |

code_12B996:
  LDA $04A0,x                               ; $12B996 |
  AND #$01                                  ; $12B999 |
  BEQ code_12B9A7                           ; $12B99B |
  LDA $0580,x                               ; $12B99D |
  AND #$BF                                  ; $12B9A0 |
  STA $0580,x                               ; $12B9A2 |
  BNE code_12B9AF                           ; $12B9A5 |
code_12B9A7:
  LDA $0580,x                               ; $12B9A7 |
  ORA #$40                                  ; $12B9AA |
  STA $0580,x                               ; $12B9AC |
code_12B9AF:
  LDA #$64                                  ; $12B9AF |
  STA $05C0,x                               ; $12B9B1 |
  RTS                                       ; $12B9B4 |

code_12B9B5:
  JSR code_1FFC53                           ; $12B9B5 |
  BCS code_12B9E7                           ; $12B9B8 |
  STY $00                                   ; $12B9BA |
  LDA $0360,x                               ; $12B9BC |
  STA $0360,y                               ; $12B9BF |
  LDA $0380,x                               ; $12B9C2 |
  STA $0380,y                               ; $12B9C5 |
  LDA $03C0,x                               ; $12B9C8 |
  STA $03C0,y                               ; $12B9CB |
  LDA $03C0,x                               ; $12B9CE |
  SEC                                       ; $12B9D1 |
  SBC #$0C                                  ; $12B9D2 |
  STA $03C0,y                               ; $12B9D4 |
  LDA #$00                                  ; $12B9D7 |
  STA $0320,y                               ; $12B9D9 |
  STA $0480,y                               ; $12B9DC |
  STA $04E0,y                               ; $12B9DF |
  LDA #$67                                  ; $12B9E2 |
  JSR code_1FF846                           ; $12B9E4 |
code_12B9E7:
  RTS                                       ; $12B9E7 |

  db $00, $00, $00, $00                     ; $12B9E8 |

code_12B9EC:
  JSR code_1FFC53                           ; $12B9EC |
  BCS code_12BA2E                           ; $12B9EF |
  STY $00                                   ; $12B9F1 |
  LDA $04A0,x                               ; $12B9F3 |
  STA $04A0,y                               ; $12B9F6 |
  LDA $0360,x                               ; $12B9F9 |
  STA $0360,y                               ; $12B9FC |
  LDA $0380,x                               ; $12B9FF |
  STA $0380,y                               ; $12BA02 |
  LDA $03C0,x                               ; $12BA05 |
  STA $03C0,y                               ; $12BA08 |
  LDA #$F2                                  ; $12BA0B |
  STA $0320,y                               ; $12BA0D |
  LDA #$CA                                  ; $12BA10 |
  STA $0480,y                               ; $12BA12 |
  LDA #$01                                  ; $12BA15 |
  STA $04E0,y                               ; $12BA17 |
  LDA #$66                                  ; $12BA1A |
  JSR code_1FF846                           ; $12BA1C |
  LDA $04A0,y                               ; $12BA1F |
  AND #$01                                  ; $12BA22 |
  BNE code_12BA2E                           ; $12BA24 |
  LDA $0580,y                               ; $12BA26 |
  AND #$BF                                  ; $12BA29 |
  STA $0580,y                               ; $12BA2B |
code_12BA2E:
  RTS                                       ; $12BA2E |

code_12BA2F:
  LDA $0300,x                               ; $12BA2F |
  AND #$0F                                  ; $12BA32 |
  BNE code_12BA4E                           ; $12BA34 |
  STA $0460,x                               ; $12BA36 |
  STA $0540,x                               ; $12BA39 |
  LDA #$80                                  ; $12BA3C |
  STA $0440,x                               ; $12BA3E |
  LDA #$32                                  ; $12BA41 |
  STA $0500,x                               ; $12BA43 |
  LDA #$F0                                  ; $12BA46 |
  STA $0520,x                               ; $12BA48 |
  INC $0300,x                               ; $12BA4B |
code_12BA4E:
  JSR code_1FFB7B                           ; $12BA4E |
  BCS code_12BA62                           ; $12BA51 |
  LDA #$18                                  ; $12BA53 |
  JSR code_1FF89A                           ; $12BA55 |
  LDY $10                                   ; $12BA58 |
  LDA #$00                                  ; $12BA5A |
  STA $0300,y                               ; $12BA5C |
  JMP code_12BAA6                           ; $12BA5F |

code_12BA62:
  LDA $0300,x                               ; $12BA62 |
  AND #$02                                  ; $12BA65 |
  BNE code_12BA7A                           ; $12BA67 |
  JSR code_1FF779                           ; $12BA69 |
  DEC $0500,x                               ; $12BA6C |
  BNE code_12BA79                           ; $12BA6F |
  LDA #$02                                  ; $12BA71 |
  STA $0500,x                               ; $12BA73 |
  INC $0300,x                               ; $12BA76 |
code_12BA79:
  RTS                                       ; $12BA79 |

code_12BA7A:
  LDA $04A0,x                               ; $12BA7A |
  AND #$01                                  ; $12BA7D |
  BNE code_12BA87                           ; $12BA7F |
  JSR code_1FF779                           ; $12BA81 |
  JMP code_12BA8A                           ; $12BA84 |

code_12BA87:
  JSR code_1FF759                           ; $12BA87 |
code_12BA8A:
  DEC $0500,x                               ; $12BA8A |
  BNE code_12BA9C                           ; $12BA8D |
  LDA $04A0,x                               ; $12BA8F |
  EOR #$03                                  ; $12BA92 |
  STA $04A0,x                               ; $12BA94 |
  LDA #$04                                  ; $12BA97 |
  STA $0500,x                               ; $12BA99 |
code_12BA9C:
  DEC $0520,x                               ; $12BA9C |
  BNE code_12BAB6                           ; $12BA9F |
  LDA #$90                                  ; $12BAA1 |
  STA $0580,x                               ; $12BAA3 |
code_12BAA6:
  LDA #$59                                  ; $12BAA6 |
  JSR reset_sprite_anim                     ; $12BAA8 |
  LDA #$00                                  ; $12BAAB |
  STA $0500,x                               ; $12BAAD |
  LDA #$19                                  ; $12BAB0 |
  STA $0320,x                               ; $12BAB2 |
  RTS                                       ; $12BAB5 |

code_12BAB6:
  LDA $0540,x                               ; $12BAB6 |
  BNE code_12BACB                           ; $12BAB9 |
  LDA $0520,x                               ; $12BABB |
  CMP #$02                                  ; $12BABE |
  BCS code_12BACA                           ; $12BAC0 |
  LDA #$F2                                  ; $12BAC2 |
  STA $0520,x                               ; $12BAC4 |
  INC $0540,x                               ; $12BAC7 |
code_12BACA:
  RTS                                       ; $12BACA |

code_12BACB:
  LDA $0520,x                               ; $12BACB |
  CMP #$78                                  ; $12BACE |
  BCS code_12BACA                           ; $12BAD0 |
  LDA $0580,x                               ; $12BAD2 |
  EOR #$04                                  ; $12BAD5 |
  STA $0580,x                               ; $12BAD7 |
  RTS                                       ; $12BADA |

code_12BADB:
  LDA $0300,x                               ; $12BADB |
  AND #$0F                                  ; $12BADE |
  BNE code_12BAED                           ; $12BAE0 |
  JSR code_12BB25                           ; $12BAE2 |
  LDA #$3C                                  ; $12BAE5 |
  STA $0560,x                               ; $12BAE7 |
  INC $0300,x                               ; $12BAEA |
code_12BAED:
  LDA $0300,x                               ; $12BAED |
  AND #$02                                  ; $12BAF0 |
  BNE code_12BAFC                           ; $12BAF2 |
  DEC $0560,x                               ; $12BAF4 |
  BNE code_12BB24                           ; $12BAF7 |
  INC $0300,x                               ; $12BAF9 |
code_12BAFC:
  DEC $0500,x                               ; $12BAFC |
  BNE code_12BB10                           ; $12BAFF |
  JSR code_12BB91                           ; $12BB01 |
  JSR code_12BB25                           ; $12BB04 |
  LDA #$94                                  ; $12BB07 |
  STA $0580,x                               ; $12BB09 |
  DEC $0520,x                               ; $12BB0C |
  RTS                                       ; $12BB0F |

code_12BB10:
  LDA $0520,x                               ; $12BB10 |
  BNE code_12BB24                           ; $12BB13 |
  LDA $0500,x                               ; $12BB15 |
  CMP #$3C                                  ; $12BB18 |
  BCS code_12BB24                           ; $12BB1A |
  LDA #$90                                  ; $12BB1C |
  STA $0580,x                               ; $12BB1E |
  INC $0520,x                               ; $12BB21 |
code_12BB24:
  RTS                                       ; $12BB24 |

code_12BB25:
  LDA #$78                                  ; $12BB25 |
  STA $0500,x                               ; $12BB27 |
  LDA $E4                                   ; $12BB2A |
  ADC $E5                                   ; $12BB2C |
  STA $E5                                   ; $12BB2E |
  AND #$03                                  ; $12BB30 |
  CMP #$02                                  ; $12BB32 |
  BCS code_12BB53                           ; $12BB34 |
  TAY                                       ; $12BB36 |
  LDA $BB6D,y                               ; $12BB37 |
  STA $0360,x                               ; $12BB3A |
  LDA $BB6F,y                               ; $12BB3D |
  STA $04A0,x                               ; $12BB40 |
  LDA $E4                                   ; $12BB43 |
  ADC $E5                                   ; $12BB45 |
  STA $E4                                   ; $12BB47 |
  AND #$0F                                  ; $12BB49 |
  TAY                                       ; $12BB4B |
  LDA $BB71,y                               ; $12BB4C |
  STA $03C0,x                               ; $12BB4F |
  RTS                                       ; $12BB52 |

code_12BB53:
  LDA #$CC                                  ; $12BB53 |
  STA $03C0,x                               ; $12BB55 |
  LDA $E4                                   ; $12BB58 |
  ADC $E5                                   ; $12BB5A |
  STA $E5                                   ; $12BB5C |
  AND #$0F                                  ; $12BB5E |
  TAY                                       ; $12BB60 |
  LDA $BB81,y                               ; $12BB61 |
  STA $0360,x                               ; $12BB64 |
  LDA #$08                                  ; $12BB67 |
  STA $04A0,x                               ; $12BB69 |
  RTS                                       ; $12BB6C |

  db $14, $EC, $01, $02, $48, $58, $68, $78 ; $12BB6D |
  db $88, $98, $A8, $B8, $88, $B8, $A8, $98 ; $12BB75 |
  db $88, $78, $68, $58, $28, $38, $48, $58 ; $12BB7D |
  db $68, $78, $88, $98, $A8, $B8, $C8, $D8 ; $12BB85 |
  db $B8, $A8, $98, $88                     ; $12BB8D |

code_12BB91:
  JSR code_1FFC53                           ; $12BB91 |
  BCS code_12BC07                           ; $12BB94 |
  STY $00                                   ; $12BB96 |
  LDA $0380,x                               ; $12BB98 |
  STA $0380,y                               ; $12BB9B |
  LDA #$00                                  ; $12BB9E |
  STA $04E0,y                               ; $12BBA0 |
  STA $0400,y                               ; $12BBA3 |
  STA $0440,y                               ; $12BBA6 |
  LDA #$20                                  ; $12BBA9 |
  STA $0480,y                               ; $12BBAB |
  LDA $04A0,x                               ; $12BBAE |
  AND #$08                                  ; $12BBB1 |
  BNE code_12BBD8                           ; $12BBB3 |
  LDA #$5D                                  ; $12BBB5 |
  JSR code_1FF846                           ; $12BBB7 |
  LDA $04A0,x                               ; $12BBBA |
  STA $04A0,y                               ; $12BBBD |
  AND #$01                                  ; $12BBC0 |
  TAY                                       ; $12BBC2 |
  LDA $0360,x                               ; $12BBC3 |
  CLC                                       ; $12BBC6 |
  ADC $BC08,y                               ; $12BBC7 |
  LDY $00                                   ; $12BBCA |
  STA $0360,y                               ; $12BBCC |
  LDA $03C0,x                               ; $12BBCF |
  STA $03C0,y                               ; $12BBD2 |
  JMP code_12BBF2                           ; $12BBD5 |

code_12BBD8:
  LDA $04A0,x                               ; $12BBD8 |
  STA $04A0,y                               ; $12BBDB |
  LDA #$5C                                  ; $12BBDE |
  JSR code_1FF846                           ; $12BBE0 |
  LDA $0360,x                               ; $12BBE3 |
  STA $0360,y                               ; $12BBE6 |
  LDA $03C0,x                               ; $12BBE9 |
  SEC                                       ; $12BBEC |
  SBC #$18                                  ; $12BBED |
  STA $03C0,y                               ; $12BBEF |
code_12BBF2:
  LDA #$F4                                  ; $12BBF2 |
  STA $0320,y                               ; $12BBF4 |
  LDA $0580,y                               ; $12BBF7 |
  ORA #$02                                  ; $12BBFA |
  STA $0580,y                               ; $12BBFC |
  LDA #$02                                  ; $12BBFF |
  STA $0420,y                               ; $12BC01 |
  STA $0460,y                               ; $12BC04 |
code_12BC07:
  RTS                                       ; $12BC07 |

  db $E8, $18                               ; $12BC08 |

code_12BC0A:
  LDA $04A0,x                               ; $12BC0A |
  AND #$08                                  ; $12BC0D |
  BEQ code_12BC20                           ; $12BC0F |
  LDY #$09                                  ; $12BC11 |
  JSR code_1FF642                           ; $12BC13 |
  LDA $03C0,x                               ; $12BC16 |
  CMP #$48                                  ; $12BC19 |
  BCS code_12BC48                           ; $12BC1B |
  JMP code_12BC36                           ; $12BC1D |

code_12BC20:
  LDA $04A0,x                               ; $12BC20 |
  AND #$01                                  ; $12BC23 |
  BEQ code_12BC2F                           ; $12BC25 |
  LDY #$08                                  ; $12BC27 |
  JSR code_1FF580                           ; $12BC29 |
  JMP code_12BC34                           ; $12BC2C |

code_12BC2F:
  LDY #$09                                  ; $12BC2F |
  JSR code_1FF5C4                           ; $12BC31 |
code_12BC34:
  BCC code_12BC48                           ; $12BC34 |
code_12BC36:
  LDA $04A0,x                               ; $12BC36 |
  AND #$08                                  ; $12BC39 |
  BEQ code_12BC3D                           ; $12BC3B |
code_12BC3D:
  LDA #$00                                  ; $12BC3D |
  STA $0300,x                               ; $12BC3F |
  LDA #$FF                                  ; $12BC42 |
  STA $04C0,x                               ; $12BC44 |
  RTS                                       ; $12BC47 |

code_12BC48:
  JSR code_1FF8C2                           ; $12BC48 |
  CMP #$18                                  ; $12BC4B |
  BCS code_12BC75                           ; $12BC4D |
  JSR code_1FF8B3                           ; $12BC4F |
  CMP #$14                                  ; $12BC52 |
  BCS code_12BC75                           ; $12BC54 |
  LDA $04A0,x                               ; $12BC56 |
  AND #$08                                  ; $12BC59 |
  BEQ code_12BC5E                           ; $12BC5B |
  RTS                                       ; $12BC5D |

code_12BC5E:
  LDA $04A0,x                               ; $12BC5E |
  AND #$02                                  ; $12BC61 |
  BNE code_12BC69                           ; $12BC63 |
  LDA #$01                                  ; $12BC65 |
  BNE code_12BC6B                           ; $12BC67 |
code_12BC69:
  LDA #$02                                  ; $12BC69 |
code_12BC6B:
  STA $36                                   ; $12BC6B |
  LDA #$00                                  ; $12BC6D |
  STA $37                                   ; $12BC6F |
  LDA #$02                                  ; $12BC71 |
  STA $38                                   ; $12BC73 |
code_12BC75:
  LDA $04A0,x                               ; $12BC75 |
  AND #$08                                  ; $12BC78 |
  BEQ code_12BC7C                           ; $12BC7A |
code_12BC7C:
  RTS                                       ; $12BC7C |

code_12BC7D:
  LDA $0300,x                               ; $12BC7D |
  AND #$0F                                  ; $12BC80 |
  BNE code_12BCC2                           ; $12BC82 |
  LDA #$09                                  ; $12BC84 |
  CMP $30                                   ; $12BC86 |
  BEQ code_12BC99                           ; $12BC88 |
  STA $30                                   ; $12BC8A |
  LDA #$80                                  ; $12BC8C |
  STA $B0                                   ; $12BC8E |
  LDA #$8E                                  ; $12BC90 |
  STA $B3                                   ; $12BC92 |
  LDA #$0D                                  ; $12BC94 |
  JSR code_1FF898                           ; $12BC96 |
code_12BC99:
  LDA $B0                                   ; $12BC99 |
  CMP #$9C                                  ; $12BC9B |
  BNE code_12BCFA                           ; $12BC9D |
  LDA $0300,x                               ; $12BC9F |
  ORA #$40                                  ; $12BCA2 |
  STA $0300,x                               ; $12BCA4 |
  LDA #$00                                  ; $12BCA7 |
  STA $01                                   ; $12BCA9 |
  STA $02                                   ; $12BCAB |
  JSR code_12BDE2                           ; $12BCAD |
  LDA #$3C                                  ; $12BCB0 |
  STA $0500,x                               ; $12BCB2 |
  LDA #$36                                  ; $12BCB5 |
  STA $0520,x                               ; $12BCB7 |
  LDA #$01                                  ; $12BCBA |
  STA $04A0,x                               ; $12BCBC |
  INC $0300,x                               ; $12BCBF |
code_12BCC2:
  LDA $0300,x                               ; $12BCC2 |
  AND #$0F                                  ; $12BCC5 |
  CMP #$02                                  ; $12BCC7 |
  BEQ code_12BCFB                           ; $12BCC9 |
  CMP #$03                                  ; $12BCCB |
  BNE code_12BCD2                           ; $12BCCD |
  JMP code_12BD82                           ; $12BCCF |

code_12BCD2:
  LDA $0580,x                               ; $12BCD2 |
  AND #$04                                  ; $12BCD5 |
  BEQ code_12BCE6                           ; $12BCD7 |
  DEC $0500,x                               ; $12BCD9 |
  BNE code_12BCFA                           ; $12BCDC |
  LDA $0580,x                               ; $12BCDE |
  EOR #$04                                  ; $12BCE1 |
  STA $0580,x                               ; $12BCE3 |
code_12BCE6:
  LDA $05A0,x                               ; $12BCE6 |
  CMP #$04                                  ; $12BCE9 |
  BNE code_12BCFA                           ; $12BCEB |
  LDA #$04                                  ; $12BCED |
  JSR reset_sprite_anim                     ; $12BCEF |
  LDA #$3C                                  ; $12BCF2 |
  STA $0500,x                               ; $12BCF4 |
  INC $0300,x                               ; $12BCF7 |
code_12BCFA:
  RTS                                       ; $12BCFA |

code_12BCFB:
  LDA $04A0,x                               ; $12BCFB |
  AND #$01                                  ; $12BCFE |
  BEQ code_12BD10                           ; $12BD00 |
  LDA $0580,x                               ; $12BD02 |
  ORA #$40                                  ; $12BD05 |
  STA $0580,x                               ; $12BD07 |
  JSR code_1FF71D                           ; $12BD0A |
  JMP code_12BD1B                           ; $12BD0D |

code_12BD10:
  LDA $0580,x                               ; $12BD10 |
  AND #$BF                                  ; $12BD13 |
  STA $0580,x                               ; $12BD15 |
  JSR code_1FF73B                           ; $12BD18 |
code_12BD1B:
  DEC $0520,x                               ; $12BD1B |
  BNE code_12BD30                           ; $12BD1E |
  LDA $04A0,x                               ; $12BD20 |
  EOR #$03                                  ; $12BD23 |
  STA $04A0,x                               ; $12BD25 |
  LDA #$6C                                  ; $12BD28 |
  STA $0520,x                               ; $12BD2A |
  INC $0540,x                               ; $12BD2D |
code_12BD30:
  LDA $0540,x                               ; $12BD30 |
  CMP #$02                                  ; $12BD33 |
  BCC code_12BD50                           ; $12BD35 |
  LDA $0520,x                               ; $12BD37 |
  CMP #$36                                  ; $12BD3A |
  BCS code_12BD50                           ; $12BD3C |
  INC $0300,x                               ; $12BD3E |
  LDA #$1E                                  ; $12BD41 |
  STA $0560,x                               ; $12BD43 |
  LDA #$A1                                  ; $12BD46 |
  STA $0480,x                               ; $12BD48 |
  LDA #$01                                  ; $12BD4B |
  JMP reset_sprite_anim                     ; $12BD4D |

code_12BD50:
  DEC $0500,x                               ; $12BD50 |
  BNE code_12BD6C                           ; $12BD53 |
  LDA #$05                                  ; $12BD55 |
  JSR reset_sprite_anim                     ; $12BD57 |
  JSR code_12BEB8                           ; $12BD5A |
  LDA $E4                                   ; $12BD5D |
  ADC $E5                                   ; $12BD5F |
  STA $E4                                   ; $12BD61 |
  AND #$03                                  ; $12BD63 |
  TAY                                       ; $12BD65 |
  LDA $BDDE,y                               ; $12BD66 |
  STA $0500,x                               ; $12BD69 |
code_12BD6C:
  LDA $05C0,x                               ; $12BD6C |
  CMP #$04                                  ; $12BD6F |
  BEQ code_12BD81                           ; $12BD71 |
  LDA $05A0,x                               ; $12BD73 |
  BEQ code_12BD81                           ; $12BD76 |
  CMP #$03                                  ; $12BD78 |
  BNE code_12BD81                           ; $12BD7A |
  LDA #$04                                  ; $12BD7C |
  JSR reset_sprite_anim                     ; $12BD7E |
code_12BD81:
  RTS                                       ; $12BD81 |

code_12BD82:
  LDA $05C0,x                               ; $12BD82 |
  CMP #$13                                  ; $12BD85 |
  BEQ code_12BD99                           ; $12BD87 |
  DEC $0560,x                               ; $12BD89 |
  BNE code_12BD98                           ; $12BD8C |
  LDA #$13                                  ; $12BD8E |
  JSR reset_sprite_anim                     ; $12BD90 |
  LDA #$3C                                  ; $12BD93 |
  STA $0560,x                               ; $12BD95 |
code_12BD98:
  RTS                                       ; $12BD98 |

code_12BD99:
  LDA $0580,x                               ; $12BD99 |
  AND #$04                                  ; $12BD9C |
  BNE code_12BDB2                           ; $12BD9E |
  LDA $05A0,x                               ; $12BDA0 |
  CMP #$04                                  ; $12BDA3 |
  BNE code_12BD98                           ; $12BDA5 |
  JSR code_12BE6C                           ; $12BDA7 |
  LDA $0580,x                               ; $12BDAA |
  EOR #$04                                  ; $12BDAD |
  STA $0580,x                               ; $12BDAF |
code_12BDB2:
  DEC $0560,x                               ; $12BDB2 |
  BNE code_12BD98                           ; $12BDB5 |
  LDA #$06                                  ; $12BDB7 |
  STA $0500,x                               ; $12BDB9 |
  LDA #$36                                  ; $12BDBC |
  STA $0520,x                               ; $12BDBE |
  LDA #$00                                  ; $12BDC1 |
  STA $0540,x                               ; $12BDC3 |
  STA $0560,x                               ; $12BDC6 |
  LDA #$13                                  ; $12BDC9 |
  JSR reset_sprite_anim                     ; $12BDCB |
  LDA #$94                                  ; $12BDCE |
  STA $0580,x                               ; $12BDD0 |
  LDA #$80                                  ; $12BDD3 |
  STA $0360,x                               ; $12BDD5 |
  LDA #$C1                                  ; $12BDD8 |
  STA $0300,x                               ; $12BDDA |
  RTS                                       ; $12BDDD |

  db $1E, $3C, $1E, $3C                     ; $12BDDE |

code_12BDE2:
  JSR code_1FFC53                           ; $12BDE2 |
  BCS code_12BE4B                           ; $12BDE5 |
  STY $00                                   ; $12BDE7 |
  LDA $0380,x                               ; $12BDE9 |
  STA $0380,y                               ; $12BDEC |
  LDY $01                                   ; $12BDEF |
  LDA $BE5C,y                               ; $12BDF1 |
  LDY $00                                   ; $12BDF4 |
  STA $04A0,y                               ; $12BDF6 |
  LDA #$80                                  ; $12BDF9 |
  STA $0360,y                               ; $12BDFB |
  LDY $01                                   ; $12BDFE |
  LDA $BE4C,y                               ; $12BE00 |
  LDY $00                                   ; $12BE03 |
  STA $03C0,y                               ; $12BE05 |
  LDA #$01                                  ; $12BE08 |
  STA $0420,y                               ; $12BE0A |
  LDA #$13                                  ; $12BE0D |
  JSR code_1FF846                           ; $12BE0F |
  LDA #$00                                  ; $12BE12 |
  STA $0540,y                               ; $12BE14 |
  STA $0560,y                               ; $12BE17 |
  STA $0400,y                               ; $12BE1A |
  LDA #$F5                                  ; $12BE1D |
  STA $0320,y                               ; $12BE1F |
  STA $04E0,y                               ; $12BE22 |
  STA $04C0,y                               ; $12BE25 |
  LDA #$81                                  ; $12BE28 |
  STA $0300,y                               ; $12BE2A |
  LDA #$3C                                  ; $12BE2D |
  STA $0500,y                               ; $12BE2F |
  LDA #$36                                  ; $12BE32 |
  STA $0520,y                               ; $12BE34 |
  LDA #$94                                  ; $12BE37 |
  STA $0580,y                               ; $12BE39 |
  LDA #$81                                  ; $12BE3C |
  STA $0480,y                               ; $12BE3E |
  INC $01                                   ; $12BE41 |
  INC $02                                   ; $12BE43 |
  LDA $02                                   ; $12BE45 |
  CMP #$02                                  ; $12BE47 |
  BCC code_12BDE2                           ; $12BE49 |
code_12BE4B:
  RTS                                       ; $12BE4B |

  db $74, $C4, $24, $74, $C4, $24, $C4, $24 ; $12BE4C |
  db $C4, $74, $24, $74, $24, $C4, $24, $C4 ; $12BE54 |
  db $02, $01, $01, $02, $01, $01, $01, $01 ; $12BE5C |
  db $01, $02, $01, $02, $01, $01, $01, $01 ; $12BE64 |

code_12BE6C:
  LDA $04C0,x                               ; $12BE6C |
  CMP #$2C                                  ; $12BE6F |
  BNE code_12BE9A                           ; $12BE71 |
  LDA $E4                                   ; $12BE73 |
  ADC $E5                                   ; $12BE75 |
  STA $E4                                   ; $12BE77 |
  AND #$07                                  ; $12BE79 |
  TAY                                       ; $12BE7B |
  LDA $BEA0,y                               ; $12BE7C |
  STA $03C0,x                               ; $12BE7F |
  LDA $BEA8,y                               ; $12BE82 |
  STA $04A0,x                               ; $12BE85 |
  LDA #$C1                                  ; $12BE88 |
  STA $0480,x                               ; $12BE8A |
  LDA $BEB0,y                               ; $12BE8D |
  STA $01                                   ; $12BE90 |
  LDA #$00                                  ; $12BE92 |
  STA $02                                   ; $12BE94 |
  JSR code_12BDE2                           ; $12BE96 |
  RTS                                       ; $12BE99 |

code_12BE9A:
  LDA #$00                                  ; $12BE9A |
  STA $0300,x                               ; $12BE9C |
  RTS                                       ; $12BE9F |

  db $24, $C4, $74, $74, $24, $C4, $74, $74 ; $12BEA0 |
  db $01, $01, $02, $02, $01, $01, $02, $02 ; $12BEA8 |
  db $00, $02, $04, $06, $08, $0A, $0C, $0E ; $12BEB0 |

code_12BEB8:
  JSR code_1FFC53                           ; $12BEB8 |
  BCS code_12BF14                           ; $12BEBB |
  STY $00                                   ; $12BEBD |
  LDA $04A0,x                               ; $12BEBF |
  STA $04A0,y                               ; $12BEC2 |
  AND #$01                                  ; $12BEC5 |
  TAY                                       ; $12BEC7 |
  LDA $0360,x                               ; $12BEC8 |
  CLC                                       ; $12BECB |
  ADC $BF15,y                               ; $12BECC |
  LDY $00                                   ; $12BECF |
  STA $0360,y                               ; $12BED1 |
  LDA $0380,x                               ; $12BED4 |
  STA $0380,y                               ; $12BED7 |
  LDA $03C0,x                               ; $12BEDA |
  STA $03C0,y                               ; $12BEDD |
  LDA #$00                                  ; $12BEE0 |
  STA $04E0,y                               ; $12BEE2 |
  LDA #$19                                  ; $12BEE5 |
  STA $0400,y                               ; $12BEE7 |
  STA $02                                   ; $12BEEA |
  LDA #$04                                  ; $12BEEC |
  STA $0420,y                               ; $12BEEE |
  STA $03                                   ; $12BEF1 |
  STY $0F                                   ; $12BEF3 |
  STX $0E                                   ; $12BEF5 |
  LDX $0F                                   ; $12BEF7 |
  JSR code_1FFC63                           ; $12BEF9 |
  LDY $0F                                   ; $12BEFC |
  LDX $0E                                   ; $12BEFE |
  LDA $0C                                   ; $12BF00 |
  STA $04A0,y                               ; $12BF02 |
  LDA #$73                                  ; $12BF05 |
  JSR code_1FF846                           ; $12BF07 |
  LDA #$8F                                  ; $12BF0A |
  STA $0320,y                               ; $12BF0C |
  LDA #$8B                                  ; $12BF0F |
  STA $0480,y                               ; $12BF11 |
code_12BF14:
  RTS                                       ; $12BF14 |

  db $EE, $12, $00, $00, $00, $20, $00, $00 ; $12BF15 |
  db $10, $08, $10, $43, $04, $40, $00, $00 ; $12BF1D |
  db $00, $84, $00, $82, $00, $40, $50, $00 ; $12BF25 |
  db $10, $00, $00, $20, $00, $02, $00, $01 ; $12BF2D |
  db $00, $80, $40, $02, $40, $00, $00, $04 ; $12BF35 |
  db $00, $01, $00, $00, $00, $04, $00, $01 ; $12BF3D |
  db $00, $40, $04, $80, $00, $80, $00, $02 ; $12BF45 |
  db $00, $02, $00, $90, $00, $00, $00, $40 ; $12BF4D |
  db $00, $11, $00, $02, $00, $88, $00, $90 ; $12BF55 |
  db $00, $00, $00, $01, $40, $02, $00, $80 ; $12BF5D |
  db $00, $13, $10, $40, $00, $04, $00, $26 ; $12BF65 |
  db $00, $0C, $00, $01, $00, $14, $00, $02 ; $12BF6D |
  db $01, $48, $04, $4D, $44, $30, $00, $90 ; $12BF75 |
  db $00, $00, $40, $00, $00, $00, $00, $00 ; $12BF7D |
  db $00, $01, $00, $00, $00, $81, $00, $40 ; $12BF85 |
  db $00, $00, $00, $00, $00, $00, $00, $08 ; $12BF8D |
  db $00, $00, $04, $00, $00, $10, $00, $00 ; $12BF95 |
  db $00, $01, $00, $03, $01, $02, $00, $21 ; $12BF9D |
  db $00, $20, $40, $04, $00, $A0, $00, $01 ; $12BFA5 |
  db $05, $14, $00, $00, $40, $02, $11, $30 ; $12BFAD |
  db $00, $00, $10, $00, $00, $00, $00, $04 ; $12BFB5 |
  db $01, $01, $00, $08, $04, $00, $40, $01 ; $12BFBD |
  db $00, $42, $00, $10, $00, $84, $00, $40 ; $12BFC5 |
  db $00, $00, $10, $00, $00, $40, $04, $81 ; $12BFCD |
  db $00, $00, $00, $00, $10, $00, $01, $00 ; $12BFD5 |
  db $00, $00, $10, $08, $00, $80, $01, $00 ; $12BFDD |
  db $00, $00, $40, $40, $10, $80, $54, $10 ; $12BFE5 |
  db $00, $01, $04, $00, $00, $18, $00, $20 ; $12BFED |
  db $00, $08, $00, $00, $00, $88, $00, $00 ; $12BFF5 |
  db $04, $00, $00                          ; $12BFFD |

