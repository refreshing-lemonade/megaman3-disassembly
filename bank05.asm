bank $05
org $A000

  JMP code_05A1DD                           ; $05A000 |

  JMP code_05A022                           ; $05A003 |

  JMP code_05A393                           ; $05A006 |

  JMP code_05A561                           ; $05A009 |

  JMP code_05A1B4                           ; $05A00C |

  JMP code_05A360                           ; $05A00F |

  JMP code_05A50E                           ; $05A012 |

  JMP code_05A68E                           ; $05A015 |

  JMP code_05A796                           ; $05A018 |

  JMP code_05A7BE                           ; $05A01B |

  JMP code_05A87D                           ; $05A01E |

  RTS                                       ; $05A021 |

code_05A022:
  LDA $0300,x                               ; $05A022 |
  AND #$0F                                  ; $05A025 |
  TAY                                       ; $05A027 |
  LDA $A035,y                               ; $05A028 |
  STA $00                                   ; $05A02B |
  LDA $A037,y                               ; $05A02D |
  STA $01                                   ; $05A030 |
  JMP ($0000)                               ; $05A032 |

  db $39, $AF, $A0, $A0                     ; $05A035 |

  JSR code_1FF869                           ; $05A039 |
  JSR code_1FF883                           ; $05A03C |
  JSR $8003                                 ; $05A03F |
  BCS code_05A06E                           ; $05A042 |
  LDA $04E0,x                               ; $05A044 |
  BEQ code_05A090                           ; $05A047 |
  INC $0300,x                               ; $05A049 |
  LDA #$07                                  ; $05A04C |
  JSR reset_sprite_anim                     ; $05A04E |
  LDA #$AA                                  ; $05A051 |
  STA $0480,x                               ; $05A053 |
  LDA $E5                                   ; $05A056 |
  ADC $E4                                   ; $05A058 |
  STA $E4                                   ; $05A05A |
  STA $00                                   ; $05A05C |
  LDA #$03                                  ; $05A05E |
  STA $01                                   ; $05A060 |
  JSR code_1FFCEB                           ; $05A062 |
  LDY $03                                   ; $05A065 |
  LDA $A1A6,y                               ; $05A067 |
  STA $0500,x                               ; $05A06A |
  RTS                                       ; $05A06D |

code_05A06E:
  LDA $05C0,x                               ; $05A06E |
  CMP #$02                                  ; $05A071 |
  BNE code_05A091                           ; $05A073 |
  LDA $05E0,x                               ; $05A075 |
  BNE code_05A0AE                           ; $05A078 |
  LDA $05A0,x                               ; $05A07A |
  CMP #$01                                  ; $05A07D |
  BNE code_05A084                           ; $05A07F |
  JSR code_05A12C                           ; $05A081 |
code_05A084:
  LDA $05A0,x                               ; $05A084 |
  CMP #$03                                  ; $05A087 |
  BNE code_05A0AE                           ; $05A089 |
  LDA #$01                                  ; $05A08B |
  JSR reset_sprite_anim                     ; $05A08D |
code_05A090:
  RTS                                       ; $05A090 |

code_05A091:
  LDA #$00                                  ; $05A091 |
  STA $05E0,x                               ; $05A093 |
  LDY #$1F                                  ; $05A096 |
code_05A098:
  LDA $0300,y                               ; $05A098 |
  BPL code_05A0A4                           ; $05A09B |
  LDA $05C0,y                               ; $05A09D |
  CMP #$0A                                  ; $05A0A0 |
  BEQ code_05A0AE                           ; $05A0A2 |
code_05A0A4:
  DEY                                       ; $05A0A4 |
  CPY #$0F                                  ; $05A0A5 |
  BNE code_05A098                           ; $05A0A7 |
  LDA #$02                                  ; $05A0A9 |
  JSR reset_sprite_anim                     ; $05A0AB |
code_05A0AE:
  RTS                                       ; $05A0AE |

  LDA $0500,x                               ; $05A0AF |
  BEQ code_05A0C8                           ; $05A0B2 |
  DEC $0500,x                               ; $05A0B4 |
  BNE code_05A12B                           ; $05A0B7 |
  LDA #$80                                  ; $05A0B9 |
  STA $0480,x                               ; $05A0BB |
  LDA #$08                                  ; $05A0BE |
  JSR reset_sprite_anim                     ; $05A0C0 |
  LDA #$01                                  ; $05A0C3 |
  STA $0540,x                               ; $05A0C5 |
code_05A0C8:
  LDA $05C0,x                               ; $05A0C8 |
  CMP #$09                                  ; $05A0CB |
  BEQ code_05A0FF                           ; $05A0CD |
  LDA $05E0,x                               ; $05A0CF |
  CMP #$06                                  ; $05A0D2 |
  BNE code_05A12B                           ; $05A0D4 |
  LDA $05A0,x                               ; $05A0D6 |
  CMP $0540,x                               ; $05A0D9 |
  BNE code_05A12B                           ; $05A0DC |
  LDA $0540,x                               ; $05A0DE |
  TAY                                       ; $05A0E1 |
  LDA $A1A9,y                               ; $05A0E2 |
  JSR reset_sprite_anim                     ; $05A0E5 |
  LDA $0540,x                               ; $05A0E8 |
  BNE code_05A0F6                           ; $05A0EB |
  DEC $0300,x                               ; $05A0ED |
  LDA #$CA                                  ; $05A0F0 |
  STA $0480,x                               ; $05A0F2 |
  RTS                                       ; $05A0F5 |

code_05A0F6:
  LDA $0360                                 ; $05A0F6 |
  STA $0520,x                               ; $05A0F9 |
  JSR code_1FF869                           ; $05A0FC |
code_05A0FF:
  LDA $04A0,x                               ; $05A0FF |
  AND #$02                                  ; $05A102 |
  BEQ code_05A113                           ; $05A104 |
  JSR code_1FF73B                           ; $05A106 |
  LDA $0360,x                               ; $05A109 |
  CMP $0520,x                               ; $05A10C |
  BCS code_05A12B                           ; $05A10F |
  BCC code_05A11E                           ; $05A111 |
code_05A113:
  JSR code_1FF71D                           ; $05A113 |
  LDA $0360,x                               ; $05A116 |
  CMP $0520,x                               ; $05A119 |
  BCC code_05A12B                           ; $05A11C |
code_05A11E:
  LDA #$08                                  ; $05A11E |
  JSR reset_sprite_anim                     ; $05A120 |
  INC $05A0,x                               ; $05A123 |
  LDA #$00                                  ; $05A126 |
  STA $0540,x                               ; $05A128 |
code_05A12B:
  RTS                                       ; $05A12B |

code_05A12C:
  JSR code_1FF8C2                           ; $05A12C |
  CLC                                       ; $05A12F |
  ADC #$40                                  ; $05A130 |
  STA $0C                                   ; $05A132 |
  STX $0E                                   ; $05A134 |
  LDA #$02                                  ; $05A136 |
  STA $0F                                   ; $05A138 |
code_05A13A:
  JSR code_1FFC53                           ; $05A13A |
  BCS code_05A1A3                           ; $05A13D |
  LDX $0F                                   ; $05A13F |
  LDA $A1AB,x                               ; $05A141 |
  STA $0440,y                               ; $05A144 |
  LDA $A1AE,x                               ; $05A147 |
  STA $0460,y                               ; $05A14A |
  LDA $A1B1,x                               ; $05A14D |
  STA $03                                   ; $05A150 |
  LDA #$00                                  ; $05A152 |
  STA $02                                   ; $05A154 |
  STA $00                                   ; $05A156 |
  LDA $0C                                   ; $05A158 |
  SEC                                       ; $05A15A |
  SBC #$20                                  ; $05A15B |
  BCS code_05A161                           ; $05A15D |
  LDA #$00                                  ; $05A15F |
code_05A161:
  STA $01                                   ; $05A161 |
  STA $0C                                   ; $05A163 |
  STY $0D                                   ; $05A165 |
  JSR code_1FFD11                           ; $05A167 |
  LDY $0D                                   ; $05A16A |
  LDA $04                                   ; $05A16C |
  STA $0400,y                               ; $05A16E |
  LDA $05                                   ; $05A171 |
  STA $0420,y                               ; $05A173 |
  LDX $0E                                   ; $05A176 |
  LDA #$0A                                  ; $05A178 |
  JSR code_1FF846                           ; $05A17A |
  LDA #$80                                  ; $05A17D |
  STA $0480,y                               ; $05A17F |
  LDA #$B4                                  ; $05A182 |
  STA $0320,y                               ; $05A184 |
  LDA $0360,x                               ; $05A187 |
  STA $0360,y                               ; $05A18A |
  LDA $0380,x                               ; $05A18D |
  STA $0380,y                               ; $05A190 |
  LDA $03C0,x                               ; $05A193 |
  STA $03C0,y                               ; $05A196 |
  LDA $04A0,x                               ; $05A199 |
  STA $04A0,y                               ; $05A19C |
  DEC $0F                                   ; $05A19F |
  BPL code_05A13A                           ; $05A1A1 |
code_05A1A3:
  LDX $0E                                   ; $05A1A3 |
  RTS                                       ; $05A1A5 |

  db $1E, $3C, $5A, $01, $09, $00, $88, $54 ; $05A1A6 |
  db $04, $06, $08, $1C, $2A, $34           ; $05A1AE |

code_05A1B4:
  LDY #$12                                  ; $05A1B4 |
  JSR code_1FF67C                           ; $05A1B6 |
  BCS code_05A1DC                           ; $05A1B9 |
  LDA $04A0,x                               ; $05A1BB |
  AND #$02                                  ; $05A1BE |
  BEQ code_05A1CA                           ; $05A1C0 |
  LDY #$1F                                  ; $05A1C2 |
  JSR code_1FF5C4                           ; $05A1C4 |
  JMP code_05A1CF                           ; $05A1C7 |

code_05A1CA:
  LDY #$1E                                  ; $05A1CA |
  JSR code_1FF580                           ; $05A1CC |
code_05A1CF:
  BCS code_05A1D7                           ; $05A1CF |
  LDA #$00                                  ; $05A1D1 |
  STA $05E0,x                               ; $05A1D3 |
  RTS                                       ; $05A1D6 |

code_05A1D7:
  LDA #$00                                  ; $05A1D7 |
  STA $0300,x                               ; $05A1D9 |
code_05A1DC:
  RTS                                       ; $05A1DC |

code_05A1DD:
  LDA $0300,x                               ; $05A1DD |
  AND #$0F                                  ; $05A1E0 |
  BNE code_05A1F8                           ; $05A1E2 |
  LDA #$01                                  ; $05A1E4 |
  CMP $05C0,x                               ; $05A1E6 |
  BEQ code_05A252                           ; $05A1E9 |
  LDY $05A0,x                               ; $05A1EB |
  CPY #$02                                  ; $05A1EE |
  BNE code_05A1DC                           ; $05A1F0 |
  JSR reset_sprite_anim                     ; $05A1F2 |
  JMP code_05A252                           ; $05A1F5 |

code_05A1F8:
  JSR code_05A252                           ; $05A1F8 |
  LDA $0560,x                               ; $05A1FB |
  AND #$F0                                  ; $05A1FE |
  BNE code_05A21B                           ; $05A200 |
  LDA $03C0,x                               ; $05A202 |
  CMP #$50                                  ; $05A205 |
  BCS code_05A23C                           ; $05A207 |
  LDA #$00                                  ; $05A209 |
  STA $0440,x                               ; $05A20B |
  LDA #$01                                  ; $05A20E |
  STA $0460,x                               ; $05A210 |
  LDA $0560,x                               ; $05A213 |
  ORA #$10                                  ; $05A216 |
  STA $0560,x                               ; $05A218 |
code_05A21B:
  LDY #$1E                                  ; $05A21B |
  JSR code_1FF606                           ; $05A21D |
  BCC code_05A1DC                           ; $05A220 |
  DEC $0300,x                               ; $05A222 |
  LDA #$00                                  ; $05A225 |
  STA $0540,x                               ; $05A227 |
  STA $0560,x                               ; $05A22A |
  LDA $05A0,x                               ; $05A22D |
  AND #$01                                  ; $05A230 |
  CLC                                       ; $05A232 |
  ADC #$01                                  ; $05A233 |
  JSR reset_sprite_anim                     ; $05A235 |
  INC $05A0,x                               ; $05A238 |
  RTS                                       ; $05A23B |

code_05A23C:
  LDY #$1F                                  ; $05A23C |
  JSR code_1FF642                           ; $05A23E |
  LDA $0560,x                               ; $05A241 |
  AND #$01                                  ; $05A244 |
  BNE code_05A24D                           ; $05A246 |
  LDY #$21                                  ; $05A248 |
  JMP code_1FF5CC                           ; $05A24A |

code_05A24D:
  LDY #$20                                  ; $05A24D |
  JMP code_1FF588                           ; $05A24F |

code_05A252:
  JSR code_1FF869                           ; $05A252 |
  JSR code_1FF883                           ; $05A255 |
  LDA $05A0,x                               ; $05A258 |
  BNE code_05A262                           ; $05A25B |
  LDA #$00                                  ; $05A25D |
  STA $05E0,x                               ; $05A25F |
code_05A262:
  LDA $0520,x                               ; $05A262 |
  BEQ code_05A26B                           ; $05A265 |
  DEC $0520,x                               ; $05A267 |
  RTS                                       ; $05A26A |

code_05A26B:
  LDA $0300,x                               ; $05A26B |
  AND #$0F                                  ; $05A26E |
  TAY                                       ; $05A270 |
  LDA $0540,x                               ; $05A271 |
  BEQ code_05A2B6                           ; $05A274 |
  DEC $0540,x                               ; $05A276 |
  BEQ code_05A28D                           ; $05A279 |
  LDA $A354,y                               ; $05A27B |
  STA $0520,x                               ; $05A27E |
  LDA #$00                                  ; $05A281 |
  STA $05E0,x                               ; $05A283 |
  LDA #$01                                  ; $05A286 |
  STA $05A0,x                               ; $05A288 |
  BNE code_05A2DD                           ; $05A28B |
code_05A28D:
  TYA                                       ; $05A28D |
  BNE code_05A2DC                           ; $05A28E |
  INC $0300,x                               ; $05A290 |
  LDA $03C0                                 ; $05A293 |
  PHA                                       ; $05A296 |
  LDA #$50                                  ; $05A297 |
  STA $03C0                                 ; $05A299 |
  LDA #$60                                  ; $05A29C |
  STA $02                                   ; $05A29E |
  LDA #$01                                  ; $05A2A0 |
  STA $03                                   ; $05A2A2 |
  JSR code_1FFC63                           ; $05A2A4 |
  LDA $04A0,x                               ; $05A2A7 |
  STA $0560,x                               ; $05A2AA |
  PLA                                       ; $05A2AD |
  STA $03C0                                 ; $05A2AE |
  LDA #$1C                                  ; $05A2B1 |
  JMP reset_sprite_anim                     ; $05A2B3 |

code_05A2B6:
  JSR code_1FF8B3                           ; $05A2B6 |
  CMP $A35A,y                               ; $05A2B9 |
  BCS code_05A2DC                           ; $05A2BC |
  TYA                                       ; $05A2BE |
  BEQ code_05A2C5                           ; $05A2BF |
  LDA #$05                                  ; $05A2C1 |
  BNE code_05A2D9                           ; $05A2C3 |
code_05A2C5:
  LDA $E6                                   ; $05A2C5 |
  ADC $E7                                   ; $05A2C7 |
  STA $E6                                   ; $05A2C9 |
  STA $00                                   ; $05A2CB |
  LDA #$03                                  ; $05A2CD |
  STA $01                                   ; $05A2CF |
  JSR code_1FFCEB                           ; $05A2D1 |
  LDA $03                                   ; $05A2D4 |
  CLC                                       ; $05A2D6 |
  ADC #$02                                  ; $05A2D7 |
code_05A2D9:
  STA $0540,x                               ; $05A2D9 |
code_05A2DC:
  RTS                                       ; $05A2DC |

code_05A2DD:
  JSR code_1FFC53                           ; $05A2DD |
  BCS code_05A2DC                           ; $05A2E0 |
  STX $00                                   ; $05A2E2 |
  LDA $0300,x                               ; $05A2E4 |
  AND #$0F                                  ; $05A2E7 |
  TAX                                       ; $05A2E9 |
  STX $01                                   ; $05A2EA |
  LDA $A34C,x                               ; $05A2EC |
  STA $0440,y                               ; $05A2EF |
  LDA $A34E,x                               ; $05A2F2 |
  STA $0460,y                               ; $05A2F5 |
  LDA $A350,x                               ; $05A2F8 |
  STA $0400,y                               ; $05A2FB |
  LDA $A352,x                               ; $05A2FE |
  STA $0420,y                               ; $05A301 |
  LDA $A356,x                               ; $05A304 |
  STA $0320,y                               ; $05A307 |
  LDA $A358,x                               ; $05A30A |
  LDX $00                                   ; $05A30D |
  JSR code_1FF846                           ; $05A30F |
  LDA #$80                                  ; $05A312 |
  STA $0480,y                               ; $05A314 |
  LDA $0360,x                               ; $05A317 |
  STA $0360,y                               ; $05A31A |
  LDA $0380,x                               ; $05A31D |
  STA $0380,y                               ; $05A320 |
  LDA $03C0,x                               ; $05A323 |
  STA $03C0,y                               ; $05A326 |
  LDA $04A0,x                               ; $05A329 |
  STA $04A0,y                               ; $05A32C |
  LDX $01                                   ; $05A32F |
  BEQ code_05A349                           ; $05A331 |
  AND #$02                                  ; $05A333 |
  TAX                                       ; $05A335 |
  LDA $0360,y                               ; $05A336 |
  CLC                                       ; $05A339 |
  ADC $A35C,x                               ; $05A33A |
  STA $0360,y                               ; $05A33D |
  LDA $0380,y                               ; $05A340 |
  ADC $A35D,x                               ; $05A343 |
  STA $0380,y                               ; $05A346 |
code_05A349:
  LDX $00                                   ; $05A349 |
  RTS                                       ; $05A34B |

  db $AB, $00, $05, $00, $A8, $00, $01, $04 ; $05A34C |
  db $1E, $14, $B5, $41, $11, $58, $05, $07 ; $05A354 |
  db $1A, $00, $E6, $FF                     ; $05A35C |

code_05A360:
  LDA $95                                   ; $05A360 |
  AND #$01                                  ; $05A362 |
  BNE code_05A392                           ; $05A364 |
  LDY #$08                                  ; $05A366 |
  JSR code_1FF67C                           ; $05A368 |
  BCC code_05A377                           ; $05A36B |
  LDA #$A8                                  ; $05A36D |
  STA $0440,x                               ; $05A36F |
  LDA #$05                                  ; $05A372 |
  STA $0460,x                               ; $05A374 |
code_05A377:
  LDA $04A0,x                               ; $05A377 |
  AND #$02                                  ; $05A37A |
  BEQ code_05A386                           ; $05A37C |
  LDY #$09                                  ; $05A37E |
  JSR code_1FF5C4                           ; $05A380 |
  JMP code_05A38B                           ; $05A383 |

code_05A386:
  LDY #$08                                  ; $05A386 |
  JSR code_1FF580                           ; $05A388 |
code_05A38B:
  BCC code_05A392                           ; $05A38B |
  LDA #$00                                  ; $05A38D |
  STA $0300,x                               ; $05A38F |
code_05A392:
  RTS                                       ; $05A392 |

code_05A393:
  LDA $0300,x                               ; $05A393 |
  AND #$0F                                  ; $05A396 |
  TAY                                       ; $05A398 |
  LDA $A4ED,y                               ; $05A399 |
  STA $00                                   ; $05A39C |
  LDA $A4F0,y                               ; $05A39E |
  STA $01                                   ; $05A3A1 |
  JMP ($0000)                               ; $05A3A3 |

  LDA $E4                                   ; $05A3A6 |
  ADC $E5                                   ; $05A3A8 |
  STA $E6                                   ; $05A3AA |
  AND #$03                                  ; $05A3AC |
  TAY                                       ; $05A3AE |
  LDA $A503,y                               ; $05A3AF |
  STA $0500,x                               ; $05A3B2 |
  LDA $A507,y                               ; $05A3B5 |
  STA $0540,x                               ; $05A3B8 |
  INC $0300,x                               ; $05A3BB |
  LDA $0460,x                               ; $05A3BE |
  STA $0F                                   ; $05A3C1 |
  LDY #$1E                                  ; $05A3C3 |
  JSR code_1FF67C                           ; $05A3C5 |
  BCC code_05A43D                           ; $05A3C8 |
  JSR code_1FF869                           ; $05A3CA |
  JSR code_1FF883                           ; $05A3CD |
  DEC $0500,x                               ; $05A3D0 |
  BPL code_05A3D8                           ; $05A3D3 |
  JMP code_05A422                           ; $05A3D5 |

code_05A3D8:
  LDA $E4                                   ; $05A3D8 |
  ADC $E6                                   ; $05A3DA |
  STA $E7                                   ; $05A3DC |
  AND #$03                                  ; $05A3DE |
  TAY                                       ; $05A3E0 |
  LDA $A4F7,y                               ; $05A3E1 |
  STA $0440,x                               ; $05A3E4 |
  LDA $A4FB,y                               ; $05A3E7 |
  STA $0460,x                               ; $05A3EA |
  LDA $A4FF,y                               ; $05A3ED |
  STA $03                                   ; $05A3F0 |
  LDA #$00                                  ; $05A3F2 |
  STA $00                                   ; $05A3F4 |
  STA $02                                   ; $05A3F6 |
  JSR code_1FF8C2                           ; $05A3F8 |
  STA $01                                   ; $05A3FB |
  CLC                                       ; $05A3FD |
  ADC $A4F3,y                               ; $05A3FE |
  STA $04                                   ; $05A401 |
  LDA $A4F3,y                               ; $05A403 |
  BPL code_05A40E                           ; $05A406 |
  BCC code_05A414                           ; $05A408 |
  LDA $04                                   ; $05A40A |
  STA $01                                   ; $05A40C |
code_05A40E:
  BCS code_05A414                           ; $05A40E |
  LDA $04                                   ; $05A410 |
  STA $01                                   ; $05A412 |
code_05A414:
  JSR code_1FFD11                           ; $05A414 |
  LDA $04                                   ; $05A417 |
  STA $0400,x                               ; $05A419 |
  LDA $05                                   ; $05A41C |
  STA $0420,x                               ; $05A41E |
  RTS                                       ; $05A421 |

code_05A422:
  INC $0300,x                               ; $05A422 |
  LDA #$00                                  ; $05A425 |
  STA $0400,x                               ; $05A427 |
  LDA #$02                                  ; $05A42A |
  STA $0420,x                               ; $05A42C |
  LDA #$3C                                  ; $05A42F |
  STA $0520,x                               ; $05A431 |
  LDA #$01                                  ; $05A434 |
  JSR reset_sprite_anim                     ; $05A436 |
  INC $05A0,x                               ; $05A439 |
code_05A43C:
  RTS                                       ; $05A43C |

code_05A43D:
  LDA $0500,x                               ; $05A43D |
  CMP $0540,x                               ; $05A440 |
  BNE code_05A451                           ; $05A443 |
  LDA $0F                                   ; $05A445 |
  BMI code_05A451                           ; $05A447 |
  LDA $0460,x                               ; $05A449 |
  BPL code_05A451                           ; $05A44C |
  JSR code_05A498                           ; $05A44E |
code_05A451:
  LDA $04A0,x                               ; $05A451 |
  AND #$02                                  ; $05A454 |
  BEQ code_05A45D                           ; $05A456 |
  LDY #$21                                  ; $05A458 |
  JMP code_1FF5C4                           ; $05A45A |

code_05A45D:
  LDY #$20                                  ; $05A45D |
  JMP code_1FF580                           ; $05A45F |

  LDA $0520,x                               ; $05A462 |
  BEQ code_05A485                           ; $05A465 |
  DEC $0520,x                               ; $05A467 |
  LDA $05C0,x                               ; $05A46A |
  CMP #$05                                  ; $05A46D |
  BEQ code_05A451                           ; $05A46F |
  LDA $05A0,x                               ; $05A471 |
  BNE code_05A43C                           ; $05A474 |
  LDA $05E0,x                               ; $05A476 |
  CMP #$03                                  ; $05A479 |
  BCC code_05A43C                           ; $05A47B |
  LDA #$05                                  ; $05A47D |
  JSR reset_sprite_anim                     ; $05A47F |
  JMP code_05A451                           ; $05A482 |

code_05A485:
  JSR code_1FF869                           ; $05A485 |
  JSR code_1FF883                           ; $05A488 |
  LDA $0300,x                               ; $05A48B |
  AND #$F0                                  ; $05A48E |
  STA $0300,x                               ; $05A490 |
  LDA #$03                                  ; $05A493 |
  JMP reset_sprite_anim                     ; $05A495 |

code_05A498:
  STX $0E                                   ; $05A498 |
  LDA #$02                                  ; $05A49A |
  STA $0F                                   ; $05A49C |
code_05A49E:
  JSR code_1FFC53                           ; $05A49E |
  BCS code_05A4EA                           ; $05A4A1 |
  LDX $0E                                   ; $05A4A3 |
  LDA $0360,x                               ; $05A4A5 |
  STA $0360,y                               ; $05A4A8 |
  LDA $0380,x                               ; $05A4AB |
  STA $0380,y                               ; $05A4AE |
  LDA $03C0,x                               ; $05A4B1 |
  STA $03C0,y                               ; $05A4B4 |
  LDA #$25                                  ; $05A4B7 |
  STA $0520,y                               ; $05A4B9 |
  LDA #$00                                  ; $05A4BC |
  STA $0500,y                               ; $05A4BE |
  LDA #$0F                                  ; $05A4C1 |
  JSR code_1FF846                           ; $05A4C3 |
  LDA #$80                                  ; $05A4C6 |
  STA $0480,y                               ; $05A4C8 |
  LDA #$B6                                  ; $05A4CB |
  STA $0320,y                               ; $05A4CD |
  LDX $0F                                   ; $05A4D0 |
  LDA $03C0                                 ; $05A4D2 |
  PHA                                       ; $05A4D5 |
  CLC                                       ; $05A4D6 |
  ADC $A50B,x                               ; $05A4D7 |
  STA $03C0                                 ; $05A4DA |
  TYA                                       ; $05A4DD |
  TAX                                       ; $05A4DE |
  JSR code_05A518                           ; $05A4DF |
  PLA                                       ; $05A4E2 |
  STA $03C0                                 ; $05A4E3 |
  DEC $0F                                   ; $05A4E6 |
  BPL code_05A49E                           ; $05A4E8 |
code_05A4EA:
  LDX $0E                                   ; $05A4EA |
  RTS                                       ; $05A4EC |

  db $A6, $BE, $62, $A3, $A3, $A4, $C0, $00 ; $05A4ED |
  db $40, $00, $88, $15, $3D, $15, $06, $08 ; $05A4F5 |
  db $09, $08, $27, $30, $37, $30, $03, $02 ; $05A4FD |
  db $02, $01, $01, $01, $00, $00, $E8, $00 ; $05A505 |
  db $18                                    ; $05A50D |

code_05A50E:
  LDA $0500,x                               ; $05A50E |
  BEQ code_05A529                           ; $05A511 |
  DEC $0500,x                               ; $05A513 |
  BNE code_05A553                           ; $05A516 |
code_05A518:
  LDA #$00                                  ; $05A518 |
  STA $02                                   ; $05A51A |
  LDA #$04                                  ; $05A51C |
  STA $03                                   ; $05A51E |
  JSR code_1FFC63                           ; $05A520 |
  LDA $0C                                   ; $05A523 |
  STA $04A0,x                               ; $05A525 |
  RTS                                       ; $05A528 |

code_05A529:
  LDA $0520,x                               ; $05A529 |
  BEQ code_05A539                           ; $05A52C |
  DEC $0520,x                               ; $05A52E |
  BNE code_05A539                           ; $05A531 |
  LDA #$1F                                  ; $05A533 |
  STA $0500,x                               ; $05A535 |
  RTS                                       ; $05A538 |

code_05A539:
  LDA $04A0,x                               ; $05A539 |
  AND #$08                                  ; $05A53C |
  BEQ code_05A546                           ; $05A53E |
  JSR code_1FF779                           ; $05A540 |
  JMP code_05A549                           ; $05A543 |

code_05A546:
  JSR code_1FF759                           ; $05A546 |
code_05A549:
  LDA $0580,x                               ; $05A549 |
  BMI code_05A554                           ; $05A54C |
  LDA #$00                                  ; $05A54E |
  STA $0300,x                               ; $05A550 |
code_05A553:
  RTS                                       ; $05A553 |

code_05A554:
  LDA $04A0,x                               ; $05A554 |
  AND #$02                                  ; $05A557 |
  BEQ code_05A55E                           ; $05A559 |
  JMP code_1FF73B                           ; $05A55B |

code_05A55E:
  JMP code_1FF71D                           ; $05A55E |

code_05A561:
  LDA $0300,x                               ; $05A561 |
  AND #$0F                                  ; $05A564 |
  BEQ code_05A56B                           ; $05A566 |
  JMP code_05A632                           ; $05A568 |

code_05A56B:
  LDA $05A0,x                               ; $05A56B |
  BEQ code_05A57C                           ; $05A56E |
  LDA $05E0,x                               ; $05A570 |
  CMP #$08                                  ; $05A573 |
  BCC code_05A553                           ; $05A575 |
  LDA #$00                                  ; $05A577 |
  STA $05A0,x                               ; $05A579 |
code_05A57C:
  STA $05E0,x                               ; $05A57C |
  LDA $0540,x                               ; $05A57F |
  BEQ code_05A593                           ; $05A582 |
  DEC $0540,x                               ; $05A584 |
  LDA $0540,x                               ; $05A587 |
  CMP #$1E                                  ; $05A58A |
  BNE code_05A553                           ; $05A58C |
  LDA #$00                                  ; $05A58E |
  STA $36                                   ; $05A590 |
  RTS                                       ; $05A592 |

code_05A593:
  LDA $0520,x                               ; $05A593 |
  BEQ code_05A5A6                           ; $05A596 |
  DEC $0520,x                               ; $05A598 |
  BNE code_05A5AB                           ; $05A59B |
  LDA #$03                                  ; $05A59D |
  JSR reset_sprite_anim                     ; $05A59F |
  INC $0300,x                               ; $05A5A2 |
  RTS                                       ; $05A5A5 |

code_05A5A6:
  LDA #$03                                  ; $05A5A6 |
  STA $0520,x                               ; $05A5A8 |
code_05A5AB:
  LDA $E4                                   ; $05A5AB |
  ADC $E6                                   ; $05A5AD |
  STA $E4                                   ; $05A5AF |
  STA $00                                   ; $05A5B1 |
  LDA #$05                                  ; $05A5B3 |
  STA $01                                   ; $05A5B5 |
  JSR code_1FFCEB                           ; $05A5B7 |
  LDA $03                                   ; $05A5BA |
  ASL                                       ; $05A5BC |
  STA $00                                   ; $05A5BD |
  ASL                                       ; $05A5BF |
  CLC                                       ; $05A5C0 |
  ADC $00                                   ; $05A5C1 |
  STA $00                                   ; $05A5C3 |
  LDA #$96                                  ; $05A5C5 |
  STA $0540,x                               ; $05A5C7 |
  INC $05A0,x                               ; $05A5CA |
  LDA #$05                                  ; $05A5CD |
  STA $01                                   ; $05A5CF |
  STX $02                                   ; $05A5D1 |
code_05A5D3:
  JSR code_1FFC53                           ; $05A5D3 |
  BCS code_05A62F                           ; $05A5D6 |
  LDX $03                                   ; $05A5D8 |
  LDA $A6FB,x                               ; $05A5DA |
  STA $0520,y                               ; $05A5DD |
  LDX $00                                   ; $05A5E0 |
  LDA $A700,x                               ; $05A5E2 |
  STA $0440,y                               ; $05A5E5 |
  LDA $A71E,x                               ; $05A5E8 |
  STA $0460,y                               ; $05A5EB |
  LDA $A73C,x                               ; $05A5EE |
  STA $0400,y                               ; $05A5F1 |
  LDA $A75A,x                               ; $05A5F4 |
  STA $0420,y                               ; $05A5F7 |
  LDA $A778,x                               ; $05A5FA |
  STA $0500,y                               ; $05A5FD |
  LDX $02                                   ; $05A600 |
  LDA $0360,x                               ; $05A602 |
  STA $0360,y                               ; $05A605 |
  LDA $0380,x                               ; $05A608 |
  STA $0380,y                               ; $05A60B |
  LDA $03C0,x                               ; $05A60E |
  STA $03C0,y                               ; $05A611 |
  LDA $04A0,x                               ; $05A614 |
  STA $04A0,y                               ; $05A617 |
  LDA #$10                                  ; $05A61A |
  JSR code_1FF846                           ; $05A61C |
  LDA #$A0                                  ; $05A61F |
  STA $0480,y                               ; $05A621 |
  LDA #$B7                                  ; $05A624 |
  STA $0320,y                               ; $05A626 |
  INC $00                                   ; $05A629 |
  DEC $01                                   ; $05A62B |
  BPL code_05A5D3                           ; $05A62D |
code_05A62F:
  LDX $02                                   ; $05A62F |
  RTS                                       ; $05A631 |

code_05A632:
  LDY #$1E                                  ; $05A632 |
  JSR code_1FF67C                           ; $05A634 |
  BCS code_05A63C                           ; $05A637 |
  JMP code_05A554                           ; $05A639 |

code_05A63C:
  LDA $0520,x                               ; $05A63C |
  CMP #$02                                  ; $05A63F |
  BEQ code_05A660                           ; $05A641 |
  TAY                                       ; $05A643 |
  LDA $A6F3,y                               ; $05A644 |
  STA $0440,x                               ; $05A647 |
  LDA $A6F5,y                               ; $05A64A |
  STA $0460,x                               ; $05A64D |
  LDA $A6F7,y                               ; $05A650 |
  STA $0400,x                               ; $05A653 |
  LDA $A6F9,y                               ; $05A656 |
  STA $0420,x                               ; $05A659 |
  INC $0520,x                               ; $05A65C |
  RTS                                       ; $05A65F |

code_05A660:
  DEC $0300,x                               ; $05A660 |
  LDA #$00                                  ; $05A663 |
  STA $0520,x                               ; $05A665 |
  LDA $0580,x                               ; $05A668 |
  EOR #$40                                  ; $05A66B |
  STA $0580,x                               ; $05A66D |
  LDA $04A0,x                               ; $05A670 |
  EOR #$03                                  ; $05A673 |
  STA $04A0,x                               ; $05A675 |
  AND #$02                                  ; $05A678 |
  BEQ code_05A680                           ; $05A67A |
  LDA #$C8                                  ; $05A67C |
  BNE code_05A682                           ; $05A67E |
code_05A680:
  LDA #$38                                  ; $05A680 |
code_05A682:
  STA $0360,x                               ; $05A682 |
  LDA #$01                                  ; $05A685 |
  JSR reset_sprite_anim                     ; $05A687 |
  INC $05A0,x                               ; $05A68A |
  RTS                                       ; $05A68D |

code_05A68E:
  LDA $0500,x                               ; $05A68E |
  BEQ code_05A6AF                           ; $05A691 |
  DEC $0500,x                               ; $05A693 |
  DEC $0520,x                               ; $05A696 |
  LDA $03A0,x                               ; $05A699 |
  SEC                                       ; $05A69C |
  SBC $0440,x                               ; $05A69D |
  STA $03A0,x                               ; $05A6A0 |
  LDA $03C0,x                               ; $05A6A3 |
  SBC $0460,x                               ; $05A6A6 |
  STA $03C0,x                               ; $05A6A9 |
  JMP code_05A554                           ; $05A6AC |

code_05A6AF:
  LDA $0520,x                               ; $05A6AF |
  BEQ code_05A6C2                           ; $05A6B2 |
  DEC $0520,x                               ; $05A6B4 |
  BEQ code_05A6BA                           ; $05A6B7 |
  RTS                                       ; $05A6B9 |

code_05A6BA:
  LDA #$00                                  ; $05A6BA |
  STA $0400,x                               ; $05A6BC |
  STA $0420,x                               ; $05A6BF |
code_05A6C2:
  LDA $0400,x                               ; $05A6C2 |
  CLC                                       ; $05A6C5 |
  ADC #$10                                  ; $05A6C6 |
  STA $0400,x                               ; $05A6C8 |
  LDA $0420,x                               ; $05A6CB |
  ADC #$00                                  ; $05A6CE |
  STA $0420,x                               ; $05A6D0 |
  CMP #$04                                  ; $05A6D3 |
  BCC code_05A6E1                           ; $05A6D5 |
  LDA #$04                                  ; $05A6D7 |
  STA $0420,x                               ; $05A6D9 |
  LDA #$00                                  ; $05A6DC |
  STA $0400,x                               ; $05A6DE |
code_05A6E1:
  LDA $04A0,x                               ; $05A6E1 |
  STA $36                                   ; $05A6E4 |
  LDA $0400,x                               ; $05A6E6 |
  STA $37                                   ; $05A6E9 |
  LDA $0420,x                               ; $05A6EB |
  STA $38                                   ; $05A6EE |
  JMP code_05A554                           ; $05A6F0 |

  db $A8, $A4, $05, $08, $6A, $DA, $01, $01 ; $05A6F3 |
  db $44, $4A, $42, $43, $43, $00, $F0, $50 ; $05A6FB |
  db $3C, $00, $00, $D3, $CD, $68, $0F, $1A ; $05A703 |
  db $00, $A7, $68, $00, $7F, $B1, $A7, $88 ; $05A70B |
  db $50, $D4, $D0, $D0, $B9, $98, $50, $3C ; $05A713 |
  db $1A, $7C, $35, $04, $03, $03, $02, $02 ; $05A71B |
  db $00, $03, $03, $02, $02, $01, $00, $03 ; $05A723 |
  db $02, $02, $01, $00, $FF, $03, $03, $02 ; $05A72B |
  db $01, $01, $FF, $03, $03, $02, $01, $00 ; $05A733 |
  db $00, $00, $B1, $3C, $50, $76, $00, $2B ; $05A73B |
  db $3C, $31, $6B, $DB, $00, $A0, $31, $76 ; $05A743 |
  db $B5, $F0, $FC, $E0, $3C, $D4, $90, $90 ; $05A74B |
  db $FD, $C0, $3C, $50, $DB, $F8, $FE, $00 ; $05A753 |
  db $00, $02, $03, $03, $04, $01, $01, $03 ; $05A75B |
  db $03, $03, $04, $01, $03, $03, $03, $03 ; $05A763 |
  db $03, $01, $02, $02, $03, $03, $03, $01 ; $05A76B |
  db $02, $03, $03, $03, $03, $0C, $16, $24 ; $05A773 |
  db $0E, $24, $18, $1B, $0E, $1E, $2A, $1D ; $05A77B |
  db $0C, $0D, $0A, $20, $15, $22, $18, $21 ; $05A783 |
  db $15, $05, $0D, $23, $1C, $1A, $0E, $1C ; $05A78B |
  db $1D, $10, $24                          ; $05A793 |

code_05A796:
  LDA $04A0,x                               ; $05A796 |
  AND #$08                                  ; $05A799 |
  BEQ code_05A7A3                           ; $05A79B |
  JSR code_1FF779                           ; $05A79D |
  JMP code_05A7A6                           ; $05A7A0 |

code_05A7A3:
  JSR code_1FF759                           ; $05A7A3 |
code_05A7A6:
  LDA $0580,x                               ; $05A7A6 |
  BMI code_05A7B1                           ; $05A7A9 |
  LDA #$00                                  ; $05A7AB |
  STA $0300,x                               ; $05A7AD |
  RTS                                       ; $05A7B0 |

code_05A7B1:
  LDA $04A0,x                               ; $05A7B1 |
  AND #$02                                  ; $05A7B4 |
  BEQ code_05A7BB                           ; $05A7B6 |
  JMP code_1FF73B                           ; $05A7B8 |

code_05A7BB:
  JMP code_1FF71D                           ; $05A7BB |

code_05A7BE:
  LDA $0500,x                               ; $05A7BE |
  BEQ code_05A7CF                           ; $05A7C1 |
  DEC $0500,x                               ; $05A7C3 |
  LDA $0500,x                               ; $05A7C6 |
  CMP $A86A,x                               ; $05A7C9 |
  BCC code_05A7CF                           ; $05A7CC |
  RTS                                       ; $05A7CE |

code_05A7CF:
  LDA $04A0,x                               ; $05A7CF |
  AND #$01                                  ; $05A7D2 |
  BEQ code_05A7F1                           ; $05A7D4 |
  LDA $0500,x                               ; $05A7D6 |
  BEQ code_05A7E3                           ; $05A7D9 |
  LDY #$1E                                  ; $05A7DB |
  JSR code_1FF580                           ; $05A7DD |
  JMP code_05A80C                           ; $05A7E0 |

code_05A7E3:
  LDA $0580,x                               ; $05A7E3 |
  ORA #$40                                  ; $05A7E6 |
  STA $0580,x                               ; $05A7E8 |
  JSR code_1FF71D                           ; $05A7EB |
  JMP code_05A833                           ; $05A7EE |

code_05A7F1:
  LDA $0500,x                               ; $05A7F1 |
  BEQ code_05A7FE                           ; $05A7F4 |
  LDY #$1F                                  ; $05A7F6 |
  JSR code_1FF5C4                           ; $05A7F8 |
  JMP code_05A80C                           ; $05A7FB |

code_05A7FE:
  LDA $0580,x                               ; $05A7FE |
  AND #$BF                                  ; $05A801 |
  STA $0580,x                               ; $05A803 |
  JSR code_1FF73B                           ; $05A806 |
  JMP code_05A833                           ; $05A809 |

code_05A80C:
  BCC code_05A833                           ; $05A80C |
  LDA #$00                                  ; $05A80E |
  STA $0440,x                               ; $05A810 |
  STA $0400,x                               ; $05A813 |
  LDA #$03                                  ; $05A816 |
  STA $0460,x                               ; $05A818 |
  STA $0420,x                               ; $05A81B |
  LDA $04A0,x                               ; $05A81E |
  EOR #$03                                  ; $05A821 |
  STA $04A0,x                               ; $05A823 |
  AND #$0C                                  ; $05A826 |
  BNE code_05A879                           ; $05A828 |
  LDA $04A0,x                               ; $05A82A |
  ORA #$08                                  ; $05A82D |
  STA $04A0,x                               ; $05A82F |
  RTS                                       ; $05A832 |

code_05A833:
  LDA $04A0,x                               ; $05A833 |
  AND #$0C                                  ; $05A836 |
  BEQ code_05A879                           ; $05A838 |
  AND #$04                                  ; $05A83A |
  BEQ code_05A858                           ; $05A83C |
  LDA $0500,x                               ; $05A83E |
  BNE code_05A84B                           ; $05A841 |
  LDA #$4B                                  ; $05A843 |
  STA $05C0,x                               ; $05A845 |
  JMP code_1FF759                           ; $05A848 |

code_05A84B:
  LDY #$12                                  ; $05A84B |
  JSR code_1FF606                           ; $05A84D |
  LDA #$4B                                  ; $05A850 |
  STA $05C0,x                               ; $05A852 |
  JMP code_05A86F                           ; $05A855 |

code_05A858:
  LDA $0500,x                               ; $05A858 |
  BNE code_05A865                           ; $05A85B |
  LDA #$4C                                  ; $05A85D |
  STA $05C0,x                               ; $05A85F |
  JMP code_1FF779                           ; $05A862 |

code_05A865:
  LDY #$13                                  ; $05A865 |
  JSR code_1FF642                           ; $05A867 |
  LDA #$4C                                  ; $05A86A |
  STA $05C0,x                               ; $05A86C |
code_05A86F:
  BCC code_05A879                           ; $05A86F |
  LDA $04A0,x                               ; $05A871 |
  EOR #$0C                                  ; $05A874 |
  STA $04A0,x                               ; $05A876 |
code_05A879:
  RTS                                       ; $05A879 |

  db $B4, $B2, $B0                          ; $05A87A |

code_05A87D:
  LDA $0300,x                               ; $05A87D |
  AND #$0F                                  ; $05A880 |
  BNE code_05A8A9                           ; $05A882 |
  LDY #$12                                  ; $05A884 |
  JSR code_1FF67C                           ; $05A886 |
  BCC code_05A8F5                           ; $05A889 |
  LDA #$00                                  ; $05A88B |
  STA $0400,x                               ; $05A88D |
  STA $0440,x                               ; $05A890 |
  LDA #$02                                  ; $05A893 |
  STA $0420,x                               ; $05A895 |
  STA $0460,x                               ; $05A898 |
  JSR code_1FF869                           ; $05A89B |
  LDA $04A0,x                               ; $05A89E |
  ORA #$04                                  ; $05A8A1 |
  STA $04A0,x                               ; $05A8A3 |
  INC $0300,x                               ; $05A8A6 |
code_05A8A9:
  LDA $04A0,x                               ; $05A8A9 |
  AND #$08                                  ; $05A8AC |
  BNE code_05A8BD                           ; $05A8AE |
  LDY #$12                                  ; $05A8B0 |
  JSR code_1FF606                           ; $05A8B2 |
  LDA #$53                                  ; $05A8B5 |
  STA $05C0,x                               ; $05A8B7 |
  JMP code_05A8C7                           ; $05A8BA |

code_05A8BD:
  LDY #$13                                  ; $05A8BD |
  JSR code_1FF642                           ; $05A8BF |
  LDA #$54                                  ; $05A8C2 |
  STA $05C0,x                               ; $05A8C4 |
code_05A8C7:
  BCS code_05A8F6                           ; $05A8C7 |
  LDA $04A0,x                               ; $05A8C9 |
  AND #$0C                                  ; $05A8CC |
  TAY                                       ; $05A8CE |
  LDA $04A0,x                               ; $05A8CF |
  PHA                                       ; $05A8D2 |
  CPY #$08                                  ; $05A8D3 |
  BEQ code_05A8DC                           ; $05A8D5 |
  EOR #$03                                  ; $05A8D7 |
  STA $04A0,x                               ; $05A8D9 |
code_05A8DC:
  LDA $05C0,x                               ; $05A8DC |
  PHA                                       ; $05A8DF |
  JSR code_05A908                           ; $05A8E0 |
  PLA                                       ; $05A8E3 |
  STA $05C0,x                               ; $05A8E4 |
  PLA                                       ; $05A8E7 |
  STA $04A0,x                               ; $05A8E8 |
  BCS code_05A92B                           ; $05A8EB |
  LDA $04A0,x                               ; $05A8ED |
  EOR #$0C                                  ; $05A8F0 |
  STA $04A0,x                               ; $05A8F2 |
code_05A8F5:
  RTS                                       ; $05A8F5 |

code_05A8F6:
  LDA $04A0,x                               ; $05A8F6 |
  AND #$08                                  ; $05A8F9 |
  BEQ code_05A908                           ; $05A8FB |
  LDA #$59                                  ; $05A8FD |
  JSR reset_sprite_anim                     ; $05A8FF |
  LDA #$00                                  ; $05A902 |
  STA $0320,x                               ; $05A904 |
  RTS                                       ; $05A907 |

code_05A908:
  LDA #$52                                  ; $05A908 |
  STA $05C0,x                               ; $05A90A |
  LDA $04A0,x                               ; $05A90D |
  AND #$01                                  ; $05A910 |
  BEQ code_05A91C                           ; $05A912 |
  LDY #$1E                                  ; $05A914 |
  JSR code_1FF580                           ; $05A916 |
  JMP code_05A921                           ; $05A919 |

code_05A91C:
  LDY #$1F                                  ; $05A91C |
  JSR code_1FF5C4                           ; $05A91E |
code_05A921:
  BCC code_05A92B                           ; $05A921 |
  LDA $04A0,x                               ; $05A923 |
  EOR #$0C                                  ; $05A926 |
  STA $04A0,x                               ; $05A928 |
code_05A92B:
  RTS                                       ; $05A92B |

  db $AA, $6F, $0A, $6F, $80, $DD, $AA, $B0 ; $05A92C |
  db $A2, $5F, $0A, $DC, $A8, $D3, $2A, $EF ; $05A934 |
  db $AA, $7F, $AA, $E6, $A8, $BF, $2A, $BC ; $05A93C |
  db $8A, $DF, $2A, $4F, $22, $95, $00, $77 ; $05A944 |
  db $A2, $1D, $AB, $70, $AA, $63, $8A, $ED ; $05A94C |
  db $82, $CF, $A2, $4F, $2A, $ED, $AA, $EA ; $05A954 |
  db $A8, $CE, $EA, $F7, $28, $26, $A3, $BC ; $05A95C |
  db $2A, $5B, $82, $57, $AA, $7F, $AA, $57 ; $05A964 |
  db $8A, $8F, $28, $26, $AB, $D0, $A6, $FF ; $05A96C |
  db $A2, $FF, $02, $D8, $AA, $FA, $A0, $73 ; $05A974 |
  db $AA, $D2, $AA, $FE, $A8, $B5, $0A, $19 ; $05A97C |
  db $AA, $4F, $A8, $79, $82, $52, $A8, $9E ; $05A984 |
  db $AA, $EF, $A8, $C1, $8A, $EA, $A0, $7F ; $05A98C |
  db $A2, $FA, $88, $FF, $22, $FE, $A8, $FB ; $05A994 |
  db $AA, $FE, $C8, $DF, $28, $D5, $20, $FC ; $05A99C |
  db $0A, $82, $A2, $E4, $AA, $FF, $80, $B2 ; $05A9A4 |
  db $AA, $CF, $E8, $82, $82, $9F, $AA, $91 ; $05A9AC |
  db $28, $5C, $8A, $BB, $8A, $FE, $28, $D9 ; $05A9B4 |
  db $AA, $DD, $A0, $7B, $80, $66, $A2, $68 ; $05A9BC |
  db $82, $ED, $28, $8E, $A8, $0C, $22, $4F ; $05A9C4 |
  db $22, $EF, $A8, $52, $20, $FC, $A2, $47 ; $05A9CC |
  db $A8, $63, $A0, $19, $8A, $D7, $A8, $D1 ; $05A9D4 |
  db $2A, $A8, $AA, $7A, $8A, $F5, $2A, $CC ; $05A9DC |
  db $02, $6E, $2A, $CF, $8A, $F6, $A0, $78 ; $05A9E4 |
  db $AA, $DF, $88, $EF, $88, $FB, $82, $AE ; $05A9EC |
  db $A8, $AF, $A0, $DF, $AA, $F4, $AA, $FF ; $05A9F4 |
  db $AA, $56, $AA, $FF, $00, $01, $02, $03 ; $05A9FC |
  db $04, $1A, $06, $07, $08, $09, $0A, $0B ; $05AA04 |
  db $0C, $0D, $1A, $0F, $10, $11, $12, $13 ; $05AA0C |
  db $14, $15, $16, $17, $18, $19, $A8, $F9 ; $05AA14 |
  db $88, $FF, $AA, $FE, $20, $CF, $2A, $33 ; $05AA1C |
  db $AA, $5D, $42, $2E, $20, $62, $02, $77 ; $05AA24 |
  db $A6, $F3, $0A, $05, $17, $1E, $1E, $26 ; $05AA2C |
  db $A2, $2F, $20, $EA, $AA, $3A, $22, $D1 ; $05AA34 |
  db $AA, $DE, $28, $F7, $23, $80, $A0, $21 ; $05AA3C |
  db $62, $80, $80, $80, $A0, $22, $80, $A4 ; $05AA44 |
  db $20, $20, $00, $C4, $88, $71, $0A, $5D ; $05AA4C |
  db $A2, $F1, $AA, $D5, $20, $7F, $28, $7B ; $05AA54 |
  db $A8, $C7, $80, $CF, $15, $00, $15, $00 ; $05AA5C |
  db $2C, $00, $15, $00, $01, $00, $17, $00 ; $05AA64 |
  db $17, $00, $17, $00, $2C, $00, $0C, $00 ; $05AA6C |
  db $06, $00, $06, $00, $06, $00, $26, $00 ; $05AA74 |
  db $00, $6F, $2A, $37, $40, $42, $0F, $39 ; $05AA7C |
  db $19, $09, $0F, $37, $10, $00, $0F, $19 ; $05AA84 |
  db $09, $21, $0F, $20, $31, $21, $80, $00 ; $05AA8C |
  db $00, $00, $88, $DE, $02, $B3, $08, $FD ; $05AA94 |
  db $08, $BA, $22, $5F, $28, $5F, $02, $4C ; $05AA9C |
  db $22, $9D, $20, $2F, $2A, $FD, $AA, $D5 ; $05AAA4 |
  db $AA, $48, $80, $3C, $AA, $A2, $A2, $C3 ; $05AAAC |
  db $AA, $EF, $AA, $4B, $6A, $F0, $A0, $6E ; $05AAB4 |
  db $82, $E3, $8A, $A9, $2A, $DF, $A2, $6D ; $05AABC |
  db $0A, $89, $08, $4C, $28, $16, $2A, $44 ; $05AAC4 |
  db $AA, $FB, $8A, $6F, $00, $F7, $0A, $9F ; $05AACC |
  db $22, $4A, $AA, $33, $2A, $C3, $AA, $78 ; $05AAD4 |
  db $88, $5F, $AA, $1A, $84, $9A, $A2, $5E ; $05AADC |
  db $82, $59, $20, $F9, $A0, $DD, $22, $4E ; $05AAE4 |
  db $A8, $D3, $2A, $77, $09, $0C, $A2, $FE ; $05AAEC |
  db $AA, $7F, $80, $BF, $0F, $18, $FF, $D9 ; $05AAF4 |
  db $8A, $F8, $AA, $57, $01, $01, $01, $02 ; $05AAFC |
  db $02, $02, $03, $04, $04, $04, $05, $05 ; $05AB04 |
  db $05, $05, $05, $05, $05, $05, $05, $05 ; $05AB0C |
  db $05, $06, $06, $06, $07, $07, $07, $07 ; $05AB14 |
  db $07, $09, $09, $09, $0A, $0A, $0A, $0B ; $05AB1C |
  db $0C, $0D, $0D, $0E, $0E, $0E, $0E, $0E ; $05AB24 |
  db $0E, $0E, $0E, $0E, $0E, $0E, $0F, $10 ; $05AB2C |
  db $11, $11, $11, $12, $14, $14, $14, $15 ; $05AB34 |
  db $15, $15, $15, $15, $15, $16, $16, $16 ; $05AB3C |
  db $16, $17, $17, $17, $17, $17, $19, $FF ; $05AB44 |
  db $AA, $FA, $A2, $D1, $8A, $42, $A2, $F3 ; $05AB4C |
  db $82, $C3, $A0, $B3, $AA, $FF, $CA, $E7 ; $05AB54 |
  db $20, $D7, $A8, $BF, $A8, $3C, $22, $4E ; $05AB5C |
  db $08, $F2, $08, $AD, $2A, $43, $A8, $7D ; $05AB64 |
  db $A2, $FF, $82, $EF, $A0, $DF, $02, $7F ; $05AB6C |
  db $AA, $09, $A0, $DD, $8E, $76, $A2, $32 ; $05AB74 |
  db $2A, $33, $8A, $FE, $20, $1E, $82, $47 ; $05AB7C |
  db $80, $87, $8A, $F6, $2A, $4C, $A6, $77 ; $05AB84 |
  db $A0, $F5, $0A, $4B, $AA, $F5, $2A, $7B ; $05AB8C |
  db $8A, $7E, $A8, $C3, $A2, $FE, $82, $7B ; $05AB94 |
  db $A0, $57, $E8, $FF, $08, $47, $82, $67 ; $05AB9C |
  db $2A, $25, $88, $8A, $C8, $C7, $8E, $AC ; $05ABA4 |
  db $8A, $61, $24, $87, $80, $B6, $2A, $BA ; $05ABAC |
  db $2A, $F9, $22, $CF, $AA, $11, $A2, $E8 ; $05ABB4 |
  db $82, $94, $8A, $5D, $32, $4A, $EA, $97 ; $05ABBC |
  db $2A, $4F, $88, $B3, $AA, $BF, $8D, $B7 ; $05ABC4 |
  db $AA, $61, $8A, $EF, $AA, $FA, $2A, $3C ; $05ABCC |
  db $E2, $EB, $2A, $5E, $C8, $E5, $AA, $73 ; $05ABD4 |
  db $0A, $1F, $AA, $CE, $AA, $6E, $22, $36 ; $05ABDC |
  db $A8, $EE, $29, $4E, $AA, $7D, $A2, $5F ; $05ABE4 |
  db $A8, $B5, $A2, $F8, $AA, $7A, $A8, $FD ; $05ABEC |
  db $A8, $F9, $AA, $F6, $82, $7D, $AA, $79 ; $05ABF4 |
  db $A8, $1F, $AA, $FF, $28, $48, $E8, $18 ; $05ABFC |
  db $A8, $F8, $B8, $58, $78, $98, $68, $78 ; $05AC04 |
  db $88, $98, $A8, $B8, $C8, $D8, $E4, $D0 ; $05AC0C |
  db $D8, $A8, $C8, $E8, $48, $78, $88, $A8 ; $05AC14 |
  db $D8, $90, $B0, $E0, $30, $50, $A0, $A8 ; $05AC1C |
  db $6C, $98, $B8, $68, $78, $88, $98, $A8 ; $05AC24 |
  db $B8, $C8, $D8, $E4, $D0, $D8, $E8, $38 ; $05AC2C |
  db $28, $48, $D8, $78, $18, $78, $D8, $38 ; $05AC34 |
  db $58, $98, $B8, $D8, $F8, $18, $58, $88 ; $05AC3C |
  db $B8, $38, $58, $78, $98, $C8, $D0, $FF ; $05AC44 |
  db $80, $00, $00, $00, $00, $04, $80, $00 ; $05AC4C |
  db $95, $14, $60, $10, $4B, $10, $94, $40 ; $05AC54 |
  db $10, $01, $10, $40, $0A, $11, $1D, $01 ; $05AC5C |
  db $98, $51, $CA, $40, $A9, $01, $06, $00 ; $05AC64 |
  db $18, $55, $A0, $11, $08, $44, $30, $10 ; $05AC6C |
  db $06, $44, $30, $30, $11, $00, $2C, $04 ; $05AC74 |
  db $40, $45, $A1, $00, $40, $00, $54, $04 ; $05AC7C |
  db $00, $00, $00, $00, $20, $08, $00, $00 ; $05AC84 |
  db $00, $C1, $82, $10, $0B, $00, $01, $04 ; $05AC8C |
  db $00, $44, $00, $40, $81, $00, $00, $15 ; $05AC94 |
  db $20, $00, $45, $41, $CA, $00, $58, $11 ; $05AC9C |
  db $16, $00, $00, $01, $A2, $41, $C0, $10 ; $05ACA4 |
  db $94, $40, $92, $54, $00, $00, $04, $91 ; $05ACAC |
  db $A1, $40, $66, $41, $0C, $01, $98, $00 ; $05ACB4 |
  db $04, $11, $1D, $10, $08, $00, $60, $00 ; $05ACBC |
  db $28, $00, $19, $11, $0C, $00, $01, $40 ; $05ACC4 |
  db $8E, $15, $05, $00, $04, $10, $40, $14 ; $05ACCC |
  db $24, $00, $01, $40, $4C, $50, $88, $04 ; $05ACD4 |
  db $46, $14, $23, $80, $EE, $04, $C0, $00 ; $05ACDC |
  db $3C, $51, $44, $10, $CE, $15, $83, $50 ; $05ACE4 |
  db $69, $50, $B8, $44, $40, $40, $41, $54 ; $05ACEC |
  db $65, $44, $82, $40, $00, $11, $81, $81 ; $05ACF4 |
  db $38, $80, $AC, $44, $70, $54, $B0, $94 ; $05ACFC |
  db $74, $50, $B0, $54, $74, $94, $90, $98 ; $05AD04 |
  db $90, $88, $90, $98, $90, $88, $50, $27 ; $05AD0C |
  db $3F, $28, $68, $88, $38, $98, $38, $B4 ; $05AD14 |
  db $88, $38, $B4, $48, $68, $B4, $48, $80 ; $05AD1C |
  db $60, $B8, $B8, $90, $98, $90, $88, $90 ; $05AD24 |
  db $98, $90, $88, $50, $27, $3F, $74, $74 ; $05AD2C |
  db $28, $B4, $B4, $50, $B8, $98, $58, $B8 ; $05AD34 |
  db $48, $38, $98, $68, $78, $28, $48, $68 ; $05AD3C |
  db $B8, $A8, $48, $68, $68, $88, $00, $FF ; $05AD44 |
  db $94, $00, $26, $00, $00, $28, $30, $00 ; $05AD4C |
  db $9A, $00, $03, $00, $A0, $00, $39, $00 ; $05AD54 |
  db $01, $00, $0E, $00, $68, $10, $25, $04 ; $05AD5C |
  db $22, $44, $01, $01, $32, $15, $49, $14 ; $05AD64 |
  db $02, $50, $62, $02, $80, $00, $C8, $52 ; $05AD6C |
  db $C9, $21, $11, $00, $0D, $00, $86, $44 ; $05AD74 |
  db $95, $00, $91, $30, $12, $90, $00, $00 ; $05AD7C |
  db $09, $10, $45, $00, $82, $01, $00, $04 ; $05AD84 |
  db $1A, $01, $00, $04, $08, $40, $08, $40 ; $05AD8C |
  db $A0, $40, $20, $00, $02, $00, $02, $00 ; $05AD94 |
  db $15, $15, $7E, $40, $62, $04, $08, $01 ; $05AD9C |
  db $E4, $00, $10, $01, $0A, $10, $09, $50 ; $05ADA4 |
  db $87, $14, $0A, $00, $80, $10, $88, $00 ; $05ADAC |
  db $02, $01, $AE, $40, $A0, $00, $6C, $40 ; $05ADB4 |
  db $00, $15, $56, $10, $01, $00, $84, $00 ; $05ADBC |
  db $4D, $00, $02, $50, $08, $05, $0C, $10 ; $05ADC4 |
  db $00, $00, $A2, $00, $04, $00, $C1, $50 ; $05ADCC |
  db $04, $01, $89, $01, $50, $0C, $B0, $00 ; $05ADD4 |
  db $02, $10, $00, $4A, $00, $00, $E1, $00 ; $05ADDC |
  db $8C, $00, $19, $00, $B3, $55, $60, $45 ; $05ADE4 |
  db $0C, $41, $C0, $50, $6A, $40, $81, $00 ; $05ADEC |
  db $17, $04, $2D, $50, $0E, $40, $B0, $08 ; $05ADF4 |
  db $43, $01, $88, $41, $00, $60, $00, $60 ; $05ADFC |
  db $60, $00, $00, $60, $60, $60, $66, $66 ; $05AE04 |
  db $66, $66, $66, $66, $66, $66, $67, $70 ; $05AE0C |
  db $71, $01, $61, $61, $50, $01, $50, $60 ; $05AE14 |
  db $01, $01, $04, $01, $01, $04, $01, $03 ; $05AE1C |
  db $03, $56, $56, $66, $66, $66, $66, $66 ; $05AE24 |
  db $66, $66, $66, $67, $70, $71, $04, $04 ; $05AE2C |
  db $50, $04, $04, $05, $0B, $0B, $0B, $0B ; $05AE34 |
  db $06, $0B, $06, $06, $0B, $06, $06, $06 ; $05AE3C |
  db $0B, $06, $06, $06, $06, $06, $4C, $FF ; $05AE44 |
  db $66, $20, $06, $11, $12, $11, $52, $01 ; $05AE4C |
  db $D3, $00, $F0, $00, $08, $41, $00, $00 ; $05AE54 |
  db $C2, $00, $08, $00, $44, $40, $10, $40 ; $05AE5C |
  db $A1, $01, $20, $11, $C8, $10, $48, $C0 ; $05AE64 |
  db $18, $01, $20, $01, $0A, $05, $72, $10 ; $05AE6C |
  db $CC, $41, $40, $14, $91, $08, $6C, $04 ; $05AE74 |
  db $8C, $43, $23, $41, $00, $00, $40, $00 ; $05AE7C |
  db $43, $40, $1B, $40, $00, $04, $40, $44 ; $05AE84 |
  db $14, $04, $0C, $04, $00, $11, $C5, $01 ; $05AE8C |
  db $32, $40, $10, $01, $20, $40, $04, $10 ; $05AE94 |
  db $09, $40, $82, $01, $22, $00, $18, $01 ; $05AE9C |
  db $02, $00, $D9, $41, $D1, $94, $42, $C1 ; $05AEA4 |
  db $88, $44, $04, $40, $44, $50, $8C, $52 ; $05AEAC |
  db $00, $10, $D8, $40, $03, $01, $20, $50 ; $05AEB4 |
  db $20, $44, $13, $90, $A9, $50, $0D, $35 ; $05AEBC |
  db $01, $00, $58, $50, $00, $44, $00, $04 ; $05AEC4 |
  db $04, $04, $04, $40, $40, $02, $10, $01 ; $05AECC |
  db $02, $10, $20, $51, $40, $00, $46, $90 ; $05AED4 |
  db $49, $00, $68, $10, $00, $40, $42, $15 ; $05AEDC |
  db $18, $15, $32, $04, $09, $00, $80, $10 ; $05AEE4 |
  db $49, $15, $24, $44, $A2, $55, $E8, $05 ; $05AEEC |
  db $40, $40, $95, $11, $84, $51, $D3, $05 ; $05AEF4 |
  db $CA, $40, $D2, $10, $00, $00, $00, $00 ; $05AEFC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF04 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF0C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF14 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF1C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF24 |
  db $00, $00, $00, $00, $01, $02, $02, $02 ; $05AF2C |
  db $02, $02, $02, $02, $03, $00, $00, $00 ; $05AF34 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF3C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF44 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF4C |
  db $00, $00, $00, $00, $00, $00, $04, $05 ; $05AF54 |
  db $00, $00, $00, $00, $00, $01, $06, $03 ; $05AF5C |
  db $00, $00, $00, $00, $07, $03, $08, $03 ; $05AF64 |
  db $00, $00, $00, $00, $09, $0A, $00, $0B ; $05AF6C |
  db $02, $02, $05, $01, $0C, $00, $00, $00 ; $05AF74 |
  db $00, $00, $03, $03, $00, $00, $00, $00 ; $05AF7C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF84 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF8C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AF94 |
  db $00, $00, $07, $0D, $00, $00, $00, $00 ; $05AF9C |
  db $00, $04, $0E, $0F, $10, $00, $00, $00 ; $05AFA4 |
  db $01, $11, $12, $13, $14, $02, $02, $02 ; $05AFAC |
  db $0A, $00, $00, $15, $15, $0D, $00, $00 ; $05AFB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05AFBC |
  db $00, $00, $16, $03, $00, $00, $00, $00 ; $05AFC4 |
  db $00, $00, $16, $03, $00, $00, $00, $00 ; $05AFCC |
  db $00, $00, $16, $03, $00, $00, $17, $18 ; $05AFD4 |
  db $00, $00, $16, $03, $00, $00, $19, $1A ; $05AFDC |
  db $18, $00, $00, $03, $02, $02, $0A, $1B ; $05AFE4 |
  db $1C, $00, $00, $03, $1D, $1D, $1D, $1D ; $05AFEC |
  db $03, $1D, $1D, $1E, $00, $00, $00, $00 ; $05AFF4 |
  db $03, $00, $00, $03, $03, $1F, $0B, $02 ; $05AFFC |
  db $02, $02, $02, $05, $03, $0C, $00, $00 ; $05B004 |
  db $00, $00, $00, $03, $1E, $20, $00, $00 ; $05B00C |
  db $00, $00, $00, $03, $03, $21, $22, $00 ; $05B014 |
  db $00, $00, $00, $03, $03, $23, $21, $22 ; $05B01C |
  db $00, $00, $00, $03, $24, $25, $23, $21 ; $05B024 |
  db $22, $00, $00, $03, $0A, $26, $26, $27 ; $05B02C |
  db $28, $1D, $29, $03, $26, $26, $26, $26 ; $05B034 |
  db $26, $26, $2A, $03, $03, $00, $00, $00 ; $05B03C |
  db $00, $00, $2B, $2C, $03, $00, $00, $00 ; $05B044 |
  db $00, $2D, $2E, $2F, $03, $00, $00, $00 ; $05B04C |
  db $00, $00, $30, $31, $03, $00, $00, $00 ; $05B054 |
  db $00, $00, $00, $32, $1E, $29, $01, $02 ; $05B05C |
  db $02, $02, $02, $0A, $03, $1F, $03, $00 ; $05B064 |
  db $17, $33, $33, $33, $03, $1F, $03, $00 ; $05B06C |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B074 |
  db $1B, $36, $36, $36, $00, $00, $00, $00 ; $05B07C |
  db $00, $00, $37, $38, $00, $00, $00, $00 ; $05B084 |
  db $00, $00, $39, $3A, $00, $00, $00, $00 ; $05B08C |
  db $00, $00, $3B, $3C, $00, $00, $01, $05 ; $05B094 |
  db $00, $00, $00, $0C, $01, $02, $0A, $03 ; $05B09C |
  db $00, $00, $00, $00, $3D, $3E, $3F, $03 ; $05B0A4 |
  db $00, $00, $00, $00, $40, $41, $42, $03 ; $05B0AC |
  db $43, $01, $02, $02, $36, $44, $45, $03 ; $05B0B4 |
  db $46, $03, $00, $07, $00, $00, $00, $00 ; $05B0BC |
  db $00, $00, $03, $00, $00, $00, $00, $00 ; $05B0C4 |
  db $00, $00, $03, $00, $26, $47, $48, $26 ; $05B0CC |
  db $49, $00, $0B, $05, $00, $00, $16, $00 ; $05B0D4 |
  db $00, $00, $00, $03, $00, $00, $4A, $00 ; $05B0DC |
  db $00, $00, $00, $03, $00, $00, $00, $00 ; $05B0E4 |
  db $00, $00, $00, $03, $05, $3E, $4B, $3E ; $05B0EC |
  db $25, $4C, $4D, $03, $1E, $4E, $4F, $50 ; $05B0F4 |
  db $1D, $0D, $16, $03, $24, $27, $23, $51 ; $05B0FC |
  db $25, $38, $00, $03, $03, $00, $00, $00 ; $05B104 |
  db $00, $00, $00, $03, $03, $00, $00, $01 ; $05B10C |
  db $02, $02, $02, $0A, $03, $00, $01, $03 ; $05B114 |
  db $02, $05, $00, $01, $03, $00, $0B, $0A ; $05B11C |
  db $00, $0B, $02, $0A, $03, $00, $00, $00 ; $05B124 |
  db $00, $00, $00, $00, $0B, $02, $02, $02 ; $05B12C |
  db $05, $52, $53, $54, $00, $00, $07, $1D ; $05B134 |
  db $03, $55, $15, $1D, $19, $36, $36, $36 ; $05B13C |
  db $36, $56, $1B, $36, $03, $00, $00, $00 ; $05B144 |
  db $00, $00, $00, $00, $03, $00, $00, $00 ; $05B14C |
  db $00, $00, $00, $00, $0A, $00, $00, $00 ; $05B154 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05B15C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05B164 |
  db $00, $00, $00, $00, $1D, $57, $58, $59 ; $05B16C |
  db $02, $02, $02, $02, $0D, $00, $03, $10 ; $05B174 |
  db $00, $00, $00, $00, $36, $36, $36, $36 ; $05B17C |
  db $56, $5A, $03, $00, $00, $00, $00, $00 ; $05B184 |
  db $00, $5A, $03, $00, $00, $00, $00, $00 ; $05B18C |
  db $00, $5A, $0B, $05, $00, $00, $00, $00 ; $05B194 |
  db $00, $5B, $25, $24, $00, $00, $00, $00 ; $05B19C |
  db $00, $00, $00, $03, $00, $00, $00, $00 ; $05B1A4 |
  db $00, $00, $00, $03, $02, $02, $02, $02 ; $05B1AC |
  db $05, $01, $02, $0A, $00, $00, $00, $00 ; $05B1B4 |
  db $03, $03, $00, $00, $5C, $3D, $1D, $5D ; $05B1BC |
  db $5E, $1D, $5F, $03, $60, $61, $25, $62 ; $05B1C4 |
  db $25, $25, $63, $03, $03, $00, $00, $00 ; $05B1CC |
  db $00, $00, $16, $03, $03, $00, $00, $00 ; $05B1D4 |
  db $00, $00, $00, $03, $03, $00, $25, $25 ; $05B1DC |
  db $25, $4B, $00, $03, $03, $00, $00, $00 ; $05B1E4 |
  db $00, $10, $00, $03, $0B, $02, $02, $02 ; $05B1EC |
  db $05, $64, $01, $0A, $02, $02, $02, $02 ; $05B1F4 |
  db $0A, $5A, $03, $00, $24, $63, $0B, $02 ; $05B1FC |
  db $02, $0A, $5B, $3F, $03, $16, $00, $00 ; $05B204 |
  db $00, $00, $65, $0C, $03, $00, $00, $00 ; $05B20C |
  db $00, $00, $00, $51, $03, $00, $00, $25 ; $05B214 |
  db $25, $00, $00, $01, $0A, $00, $00, $00 ; $05B21C |
  db $00, $00, $00, $03, $02, $05, $00, $00 ; $05B224 |
  db $00, $00, $66, $03, $26, $1E, $67, $1D ; $05B22C |
  db $68, $26, $2A, $03, $00, $03, $15, $1D ; $05B234 |
  db $08, $00, $1F, $03, $03, $1F, $0B, $05 ; $05B23C |
  db $00, $00, $00, $00, $03, $1F, $01, $03 ; $05B244 |
  db $02, $02, $02, $05, $03, $1F, $03, $03 ; $05B24C |
  db $00, $00, $00, $03, $0A, $1F, $03, $03 ; $05B254 |
  db $00, $00, $00, $03, $00, $1F, $03, $03 ; $05B25C |
  db $00, $00, $00, $03, $05, $1F, $03, $03 ; $05B264 |
  db $00, $00, $00, $0B, $03, $1F, $03, $0B ; $05B26C |
  db $02, $05, $69, $1D, $03, $1F, $03, $00 ; $05B274 |
  db $00, $03, $5A, $00, $03, $00, $00, $00 ; $05B27C |
  db $00, $00, $2B, $2C, $03, $00, $00, $00 ; $05B284 |
  db $00, $2D, $2E, $2F, $03, $00, $00, $00 ; $05B28C |
  db $00, $00, $30, $31, $03, $00, $00, $00 ; $05B294 |
  db $00, $00, $00, $32, $1E, $29, $01, $02 ; $05B29C |
  db $02, $02, $02, $0A, $03, $1F, $03, $00 ; $05B2A4 |
  db $17, $33, $33, $33, $03, $1F, $03, $00 ; $05B2AC |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B2B4 |
  db $1B, $36, $36, $36, $00, $00, $00, $00 ; $05B2BC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05B2C4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05B2CC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05B2D4 |
  db $00, $00, $00, $00, $01, $02, $02, $02 ; $05B2DC |
  db $02, $02, $02, $02, $03, $33, $18, $00 ; $05B2E4 |
  db $00, $01, $02, $05, $6A, $35, $1C, $18 ; $05B2EC |
  db $01, $0A, $00, $03, $6B, $36, $03, $1C ; $05B2F4 |
  db $03, $00, $00, $03, $00, $00, $6C, $6D ; $05B2FC |
  db $6D, $6D, $6D, $6D, $00, $00, $6C, $6E ; $05B304 |
  db $6F, $70, $6D, $6E, $00, $00, $6C, $71 ; $05B30C |
  db $72, $72, $73, $71, $00, $00, $74, $75 ; $05B314 |
  db $75, $75, $75, $75, $02, $02, $05, $00 ; $05B31C |
  db $00, $00, $00, $00, $00, $17, $3D, $00 ; $05B324 |
  db $00, $00, $00, $00, $00, $19, $76, $43 ; $05B32C |
  db $43, $01, $02, $02, $00, $03, $46, $46 ; $05B334 |
  db $46, $03, $46, $46, $6D, $77, $78, $79 ; $05B33C |
  db $7A, $7B, $7C, $6D, $7D, $7E, $7F, $79 ; $05B344 |
  db $7A, $7B, $7C, $80, $7B, $81, $72, $79 ; $05B34C |
  db $82, $7B, $83, $84, $7B, $85, $75, $79 ; $05B354 |
  db $86, $7B, $87, $72, $7B, $88, $00, $79 ; $05B35C |
  db $89, $7B, $8A, $72, $7B, $88, $00, $79 ; $05B364 |
  db $89, $7B, $8A, $72, $02, $02, $02, $02 ; $05B36C |
  db $02, $02, $05, $72, $79, $8B, $46, $79 ; $05B374 |
  db $8B, $79, $03, $72, $6D, $8C, $84, $7B ; $05B37C |
  db $81, $72, $72, $72, $8D, $72, $72, $7B ; $05B384 |
  db $81, $72, $72, $72, $72, $72, $72, $7B ; $05B38C |
  db $81, $72, $72, $72, $72, $72, $72, $7B ; $05B394 |
  db $81, $72, $72, $72, $72, $72, $72, $7B ; $05B39C |
  db $81, $8E, $8F, $90, $72, $72, $72, $7B ; $05B3A4 |
  db $91, $7B, $92, $6D, $93, $93, $94, $95 ; $05B3AC |
  db $96, $7B, $7C, $6D, $6D, $6D, $6D, $79 ; $05B3B4 |
  db $7A, $7B, $7C, $6D, $6D, $6D, $6D, $6D ; $05B3BC |
  db $6D, $6D, $6D, $6D, $6D, $6D, $6D, $6D ; $05B3C4 |
  db $6D, $6D, $6D, $6D, $6D, $6D, $6D, $6D ; $05B3CC |
  db $6D, $6D, $6D, $6D, $6D, $6D, $6D, $6D ; $05B3D4 |
  db $6D, $6D, $6D, $97, $6D, $6D, $6D, $8E ; $05B3DC |
  db $98, $6D, $99, $80, $6D, $6D, $6D, $7B ; $05B3E4 |
  db $7C, $70, $9A, $71, $6D, $6D, $6D, $7B ; $05B3EC |
  db $9B, $72, $72, $72, $6D, $6D, $8D, $7B ; $05B3F4 |
  db $81, $72, $72, $72, $6D, $6D, $80, $9C ; $05B3FC |
  db $84, $72, $72, $72, $6D, $6E, $71, $72 ; $05B404 |
  db $72, $72, $72, $72, $8C, $84, $72, $72 ; $05B40C |
  db $72, $72, $72, $72, $72, $72, $72, $72 ; $05B414 |
  db $72, $72, $9D, $9E, $9F, $72, $72, $72 ; $05B41C |
  db $72, $72, $A0, $A1, $72, $72, $72, $9D ; $05B424 |
  db $9E, $72, $A0, $A1, $9D, $9E, $72, $A0 ; $05B42C |
  db $A1, $72, $A0, $A1, $A0, $A1, $72, $A0 ; $05B434 |
  db $A1, $72, $A0, $A1, $72, $72, $72, $72 ; $05B43C |
  db $72, $72, $72, $A2, $72, $72, $72, $72 ; $05B444 |
  db $72, $72, $72, $72, $72, $72, $72, $72 ; $05B44C |
  db $9D, $9E, $72, $72, $72, $72, $72, $72 ; $05B454 |
  db $A0, $A1, $72, $72, $72, $72, $72, $72 ; $05B45C |
  db $A0, $A1, $72, $9D, $72, $72, $72, $72 ; $05B464 |
  db $A0, $A1, $72, $A0, $72, $9D, $9E, $72 ; $05B46C |
  db $A0, $A1, $72, $A0, $72, $A0, $A1, $72 ; $05B474 |
  db $A0, $A1, $72, $A0, $78, $6D, $6D, $6D ; $05B47C |
  db $6D, $6D, $6D, $6D, $7F, $A3, $A4, $6D ; $05B484 |
  db $6D, $80, $8D, $A5, $72, $A6, $A7, $A8 ; $05B48C |
  db $A9, $84, $72, $72, $72, $72, $72, $72 ; $05B494 |
  db $72, $72, $72, $72, $9E, $72, $72, $72 ; $05B49C |
  db $72, $72, $72, $AA, $A1, $72, $72, $A6 ; $05B4A4 |
  db $72, $72, $72, $AB, $A1, $72, $72, $72 ; $05B4AC |
  db $AC, $9D, $AD, $6D, $A1, $72, $72, $AB ; $05B4B4 |
  db $AE, $A0, $AF, $6D, $6D, $6E, $B0, $72 ; $05B4BC |
  db $72, $72, $72, $03, $A8, $84, $72, $72 ; $05B4C4 |
  db $72, $72, $72, $03, $72, $72, $72, $72 ; $05B4CC |
  db $72, $72, $72, $03, $72, $72, $AB, $B1 ; $05B4D4 |
  db $72, $72, $72, $0B, $72, $B2, $B3, $6D ; $05B4DC |
  db $B4, $B5, $72, $B6, $B7, $6D, $6D, $6D ; $05B4E4 |
  db $6D, $B8, $B5, $B6, $6D, $6D, $6D, $6D ; $05B4EC |
  db $6D, $6D, $B9, $01, $6D, $6D, $6D, $6D ; $05B4F4 |
  db $6D, $6D, $6D, $03, $BA, $BB, $33, $18 ; $05B4FC |
  db $00, $03, $10, $BC, $1B, $BD, $BE, $1C ; $05B504 |
  db $5E, $1E, $BF, $C0, $00, $00, $00, $0B ; $05B50C |
  db $02, $0A, $00, $C0, $02, $02, $02, $02 ; $05B514 |
  db $02, $02, $02, $C1, $C2, $00, $00, $00 ; $05B51C |
  db $00, $00, $00, $C3, $C2, $00, $00, $00 ; $05B524 |
  db $00, $00, $00, $C3, $02, $02, $02, $02 ; $05B52C |
  db $02, $02, $02, $02, $00, $00, $00, $00 ; $05B534 |
  db $00, $00, $00, $00, $C4, $0A, $0B, $02 ; $05B53C |
  db $02, $02, $02, $0E, $C5, $00, $00, $00 ; $05B544 |
  db $00, $00, $00, $C0, $C5, $00, $00, $00 ; $05B54C |
  db $00, $00, $00, $C0, $C6, $00, $00, $00 ; $05B554 |
  db $00, $00, $00, $C0, $C2, $00, $00, $00 ; $05B55C |
  db $00, $00, $00, $C0, $C2, $00, $00, $C7 ; $05B564 |
  db $C8, $00, $00, $C9, $02, $0E, $CA, $CB ; $05B56C |
  db $CC, $CD, $CE, $CE, $00, $C0, $CF, $D0 ; $05B574 |
  db $D1, $D2, $36, $36, $03, $00, $00, $00 ; $05B57C |
  db $00, $00, $2B, $2C, $03, $00, $00, $00 ; $05B584 |
  db $00, $2D, $2E, $2F, $03, $00, $00, $00 ; $05B58C |
  db $00, $00, $30, $D3, $03, $00, $00, $00 ; $05B594 |
  db $D4, $00, $D4, $D5, $1E, $29, $01, $D6 ; $05B59C |
  db $D7, $D6, $D7, $0A, $03, $1F, $03, $D8 ; $05B5A4 |
  db $17, $D9, $33, $33, $03, $1F, $03, $00 ; $05B5AC |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B5B4 |
  db $1B, $36, $36, $36, $03, $00, $00, $00 ; $05B5BC |
  db $00, $00, $2B, $2C, $03, $00, $00, $00 ; $05B5C4 |
  db $00, $2D, $2E, $2F, $03, $00, $00, $00 ; $05B5CC |
  db $00, $00, $30, $D3, $03, $00, $00, $DA ; $05B5D4 |
  db $00, $DA, $00, $D5, $1E, $29, $01, $DB ; $05B5DC |
  db $DC, $DB, $DC, $0A, $03, $1F, $03, $00 ; $05B5E4 |
  db $DD, $33, $DE, $33, $03, $1F, $03, $00 ; $05B5EC |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B5F4 |
  db $1B, $36, $36, $36, $03, $00, $00, $00 ; $05B5FC |
  db $00, $00, $2B, $2C, $03, $00, $00, $00 ; $05B604 |
  db $00, $2D, $2E, $2F, $03, $00, $00, $00 ; $05B60C |
  db $00, $00, $30, $D3, $03, $00, $00, $D4 ; $05B614 |
  db $00, $D4, $00, $D5, $1E, $29, $01, $D7 ; $05B61C |
  db $D6, $D7, $D6, $0A, $03, $1F, $03, $00 ; $05B624 |
  db $DF, $33, $D9, $33, $03, $1F, $03, $00 ; $05B62C |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B634 |
  db $1B, $36, $36, $36, $03, $00, $00, $00 ; $05B63C |
  db $00, $00, $2B, $2C, $03, $00, $00, $00 ; $05B644 |
  db $00, $2D, $2E, $2F, $03, $00, $00, $00 ; $05B64C |
  db $00, $00, $30, $D3, $03, $00, $00, $00 ; $05B654 |
  db $DA, $00, $DA, $D5, $1E, $29, $01, $DC ; $05B65C |
  db $DB, $DC, $DB, $0A, $03, $1F, $03, $E0 ; $05B664 |
  db $17, $DE, $33, $33, $03, $1F, $03, $00 ; $05B66C |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B674 |
  db $1B, $36, $36, $36, $03, $00, $00, $00 ; $05B67C |
  db $00, $00, $00, $00, $03, $00, $00, $00 ; $05B684 |
  db $00, $00, $00, $00, $03, $00, $00, $00 ; $05B68C |
  db $00, $00, $00, $00, $03, $00, $00, $00 ; $05B694 |
  db $00, $00, $00, $00, $1E, $29, $01, $02 ; $05B69C |
  db $02, $02, $02, $0A, $03, $1F, $03, $00 ; $05B6A4 |
  db $17, $33, $33, $33, $03, $1F, $03, $00 ; $05B6AC |
  db $34, $35, $35, $35, $03, $1F, $03, $00 ; $05B6B4 |
  db $1B, $36, $36, $36, $46, $46, $46, $46 ; $05B6BC |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6C4 |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6CC |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6D4 |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6DC |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6E4 |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6EC |
  db $46, $46, $46, $46, $46, $46, $46, $46 ; $05B6F4 |
  db $46, $46, $46, $46, $58, $58, $58, $58 ; $05B6FC |
  db $20, $21, $28, $29, $32, $32, $3A, $3A ; $05B704 |
  db $30, $31, $30, $31, $3C, $21, $3C, $29 ; $05B70C |
  db $22, $23, $2A, $2B, $3C, $27, $3C, $2F ; $05B714 |
  db $34, $3D, $3C, $58, $37, $58, $58, $58 ; $05B71C |
  db $3C, $32, $3C, $3A, $26, $27, $2E, $2F ; $05B724 |
  db $24, $25, $2C, $2D, $3C, $58, $3C, $58 ; $05B72C |
  db $3D, $35, $58, $3C, $32, $22, $3A, $2A ; $05B734 |
  db $23, $3C, $2B, $3C, $58, $3C, $58, $3C ; $05B73C |
  db $36, $3D, $2E, $2F, $37, $24, $58, $2C ; $05B744 |
  db $25, $3C, $2D, $3C, $32, $3C, $3A, $3C ; $05B74C |
  db $58, $36, $58, $58, $58, $13, $58, $13 ; $05B754 |
  db $58, $58, $20, $21, $58, $58, $22, $23 ; $05B75C |
  db $28, $29, $30, $31, $2A, $2B, $24, $25 ; $05B764 |
  db $2C, $2D, $58, $58, $2A, $2B, $30, $31 ; $05B76C |
  db $3D, $3D, $58, $58, $3D, $3D, $30, $31 ; $05B774 |
  db $3C, $13, $3C, $13, $3C, $35, $3C, $3C ; $05B77C |
  db $3C, $36, $3C, $58, $35, $3C, $3C, $3C ; $05B784 |
  db $3C, $58, $37, $58, $30, $31, $3D, $3D ; $05B78C |
  db $58, $58, $3D, $3D, $3D, $3D, $3D, $3D ; $05B794 |
  db $37, $58, $3D, $3D, $3C, $36, $37, $58 ; $05B79C |
  db $35, $12, $3C, $13, $37, $13, $35, $13 ; $05B7A4 |
  db $58, $58, $41, $42, $58, $58, $43, $58 ; $05B7AC |
  db $58, $48, $58, $50, $49, $4A, $51, $52 ; $05B7B4 |
  db $4B, $4C, $53, $54, $58, $5A, $58, $58 ; $05B7BC |
  db $5B, $5C, $73, $74, $73, $74, $73, $74 ; $05B7C4 |
  db $58, $58, $32, $32, $28, $29, $24, $25 ; $05B7CC |
  db $3A, $3A, $32, $32, $3A, $3A, $58, $58 ; $05B7D4 |
  db $3C, $58, $3C, $34, $58, $3C, $3D, $37 ; $05B7DC |
  db $3C, $3C, $3C, $3C, $34, $35, $3C, $3C ; $05B7E4 |
  db $36, $3C, $34, $37, $3D, $3C, $3C, $36 ; $05B7EC |
  db $30, $31, $26, $27, $58, $58, $34, $3D ; $05B7F4 |
  db $58, $58, $35, $58, $2E, $2F, $32, $32 ; $05B7FC |
  db $3C, $58, $3C, $22, $36, $35, $23, $3C ; $05B804 |
  db $58, $58, $10, $11, $3C, $2A, $3C, $30 ; $05B80C |
  db $2B, $3C, $31, $3C, $00, $00, $00, $00 ; $05B814 |
  db $35, $34, $36, $3D, $3D, $12, $3D, $13 ; $05B81C |
  db $3D, $35, $3D, $37, $58, $13, $58, $58 ; $05B824 |
  db $58, $58, $3D, $35, $36, $35, $3D, $37 ; $05B82C |
  db $58, $12, $58, $13, $3C, $3D, $3C, $58 ; $05B834 |
  db $35, $36, $3C, $58, $3D, $3D, $3C, $58 ; $05B83C |
  db $3C, $58, $36, $3D, $34, $3D, $3C, $34 ; $05B844 |
  db $3D, $35, $3D, $3D, $34, $3D, $37, $58 ; $05B84C |
  db $3C, $37, $3C, $58, $2E, $2F, $58, $58 ; $05B854 |
  db $3D, $35, $58, $36, $20, $21, $3D, $3D ; $05B85C |
  db $32, $32, $3D, $35, $13, $3C, $13, $3C ; $05B864 |
  db $13, $3C, $13, $36, $3D, $3D, $20, $21 ; $05B86C |
  db $3D, $35, $34, $3C, $58, $34, $3D, $37 ; $05B874 |
  db $37, $13, $3C, $13, $28, $29, $3D, $3D ; $05B87C |
  db $2E, $2F, $3D, $3D, $3C, $3C, $37, $36 ; $05B884 |
  db $3C, $13, $37, $13, $12, $3C, $13, $3C ; $05B88C |
  db $13, $58, $13, $58, $34, $12, $3C, $13 ; $05B894 |
  db $35, $34, $37, $3C, $3D, $3D, $34, $3D ; $05B89C |
  db $12, $34, $13, $3C, $30, $31, $32, $32 ; $05B8A4 |
  db $3A, $3A, $30, $31, $58, $59, $58, $59 ; $05B8AC |
  db $60, $60, $60, $60, $60, $60, $60, $75 ; $05B8B4 |
  db $60, $60, $79, $7A, $60, $60, $7B, $7A ; $05B8BC |
  db $75, $01, $01, $01, $01, $01, $01, $01 ; $05B8C4 |
  db $79, $7A, $01, $01, $58, $44, $58, $58 ; $05B8CC |
  db $4D, $4D, $58, $58, $2E, $2F, $11, $10 ; $05B8D4 |
  db $60, $60, $75, $79, $60, $60, $7A, $60 ; $05B8DC |
  db $15, $02, $15, $02, $1F, $60, $1F, $60 ; $05B8E4 |
  db $15, $16, $15, $16, $17, $60, $17, $60 ; $05B8EC |
  db $7B, $7C, $0D, $0E, $01, $01, $0F, $01 ; $05B8F4 |
  db $01, $70, $01, $01, $60, $60, $60, $7B ; $05B8FC |
  db $17, $01, $17, $01, $1F, $7A, $1F, $01 ; $05B904 |
  db $17, $7B, $17, $01, $7C, $01, $01, $01 ; $05B90C |
  db $17, $4D, $17, $58, $1F, $4D, $1F, $58 ; $05B914 |
  db $17, $45, $17, $59, $17, $58, $17, $58 ; $05B91C |
  db $1F, $58, $1F, $58, $17, $59, $17, $59 ; $05B924 |
  db $1F, $00, $1F, $00, $60, $7B, $75, $01 ; $05B92C |
  db $60, $75, $7C, $01, $0D, $0E, $15, $16 ; $05B934 |
  db $0F, $01, $17, $01, $01, $01, $61, $64 ; $05B93C |
  db $17, $01, $17, $64, $17, $62, $17, $60 ; $05B944 |
  db $01, $01, $64, $61, $01, $61, $62, $60 ; $05B94C |
  db $15, $0B, $15, $02, $0C, $60, $1F, $60 ; $05B954 |
  db $7B, $7C, $63, $64, $0F, $60, $17, $60 ; $05B95C |
  db $60, $60, $08, $60, $60, $60, $7B, $7C ; $05B964 |
  db $17, $75, $17, $01, $60, $7B, $7C, $01 ; $05B96C |
  db $18, $19, $1B, $1C, $1A, $01, $1D, $01 ; $05B974 |
  db $6D, $01, $7C, $01, $1B, $1C, $1B, $1C ; $05B97C |
  db $1D, $01, $1D, $01, $70, $60, $01, $79 ; $05B984 |
  db $60, $60, $79, $7C, $60, $60, $70, $60 ; $05B98C |
  db $70, $7B, $01, $01, $01, $08, $01, $01 ; $05B994 |
  db $01, $79, $01, $01, $7A, $7B, $01, $01 ; $05B99C |
  db $7C, $79, $01, $01, $01, $01, $01, $08 ; $05B9A4 |
  db $01, $61, $68, $60, $01, $01, $01, $61 ; $05B9AC |
  db $1A, $62, $1D, $60, $62, $60, $60, $60 ; $05B9B4 |
  db $1D, $60, $1D, $60, $7B, $7C, $01, $01 ; $05B9BC |
  db $64, $01, $60, $6D, $01, $68, $08, $60 ; $05B9C4 |
  db $60, $60, $60, $08, $63, $64, $08, $60 ; $05B9CC |
  db $01, $01, $6D, $01, $5D, $07, $5D, $07 ; $05B9D4 |
  db $64, $68, $60, $60, $60, $6D, $60, $60 ; $05B9DC |
  db $08, $08, $60, $60, $30, $31, $24, $25 ; $05B9E4 |
  db $36, $35, $32, $3C, $58, $20, $58, $28 ; $05B9EC |
  db $3A, $3C, $58, $36, $3A, $3A, $3D, $3D ; $05B9F4 |
  db $3D, $37, $58, $58, $58, $30, $58, $30 ; $05B9FC |
  db $32, $26, $3A, $2E, $05, $58, $05, $58 ; $05BA04 |
  db $58, $07, $58, $07, $21, $32, $29, $3A ; $05BA0C |
  db $31, $58, $31, $58, $27, $58, $2F, $58 ; $05BA14 |
  db $58, $34, $58, $3C, $35, $58, $3C, $58 ; $05BA1C |
  db $58, $24, $58, $2C, $23, $58, $2B, $20 ; $05BA24 |
  db $58, $3C, $21, $3C, $3C, $58, $32, $32 ; $05BA2C |
  db $58, $34, $32, $3C, $3D, $3D, $32, $32 ; $05BA34 |
  db $31, $28, $31, $30, $29, $3C, $31, $3C ; $05BA3C |
  db $3A, $3A, $3C, $58, $3A, $3C, $58, $3C ; $05BA44 |
  db $5B, $5C, $76, $77, $58, $58, $58, $38 ; $05BA4C |
  db $76, $77, $76, $77, $7E, $38, $7F, $39 ; $05BA54 |
  db $7E, $39, $7F, $3B, $58, $3B, $58, $58 ; $05BA5C |
  db $58, $3B, $32, $32, $58, $58, $38, $58 ; $05BA64 |
  db $39, $7E, $3B, $7F, $38, $7E, $39, $7F ; $05BA6C |
  db $3B, $58, $20, $21, $3B, $58, $32, $32 ; $05BA74 |
  db $58, $3B, $20, $21, $3B, $58, $58, $58 ; $05BA7C |
  db $55, $4D, $5D, $58, $5D, $58, $5D, $58 ; $05BA84 |
  db $2E, $2F, $58, $59, $60, $60, $3F, $60 ; $05BA8C |
  db $01, $3F, $01, $01, $01, $01, $01, $3F ; $05BA94 |
  db $01, $68, $3F, $60, $60, $60, $60, $3F ; $05BA9C |
  db $63, $64, $3F, $60, $3F, $6D, $60, $60 ; $05BAA4 |
  db $23, $58, $2B, $3D, $58, $20, $35, $28 ; $05BAAC |
  db $25, $32, $2D, $3A, $3C, $30, $3C, $30 ; $05BAB4 |
  db $5B, $5C, $30, $31, $3C, $58, $32, $22 ; $05BABC |
  db $58, $58, $23, $58, $3A, $2A, $3C, $30 ; $05BAC4 |
  db $2B, $58, $31, $58, $00, $00, $00, $00 ; $05BACC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BAD4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BADC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BAE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BAEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BAF4 |
  db $00, $00, $00, $00, $00, $11, $10, $11 ; $05BAFC |
  db $12, $3F, $00, $02, $C4, $12, $12, $28 ; $05BB04 |
  db $19, $0A, $0C, $0E, $3F, $3F, $3C, $3C ; $05BB0C |
  db $3A, $2A, $2C, $2E, $8D, $8E, $8E, $04 ; $05BB14 |
  db $06, $08, $3A, $3E, $40, $42, $AE, $46 ; $05BB1C |
  db $C0, $4A, $4C, $C2, $60, $62, $64, $66 ; $05BB24 |
  db $68, $6A, $CE, $6E, $C0, $C2, $AE, $12 ; $05BB2C |
  db $20, $22, $24, $26, $3F, $BE, $CE, $DE ; $05BB34 |
  db $C6, $CA, $12, $CE, $12, $3F, $3F, $3F ; $05BB3C |
  db $3F, $14, $E8, $EA, $3F, $91, $93, $95 ; $05BB44 |
  db $97, $14, $EC, $00, $3F, $B1, $B3, $B5 ; $05BB4C |
  db $B7, $07, $E0, $E2, $3F, $3F, $3F, $99 ; $05BB54 |
  db $9B, $07, $E4, $E6, $01, $11, $54, $38 ; $05BB5C |
  db $11, $12, $C8, $12, $11, $00, $00, $00 ; $05BB64 |
  db $00, $38, $00, $00, $70, $00, $00, $C0 ; $05BB6C |
  db $C2, $01, $C0, $C2, $00, $71, $01, $01 ; $05BB74 |
  db $77, $00, $AE, $CE, $4F, $AE, $CE, $4F ; $05BB7C |
  db $BE, $DE, $00, $00, $00, $00, $00, $00 ; $05BB84 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BB8C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BB94 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BB9C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBA4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBAC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBBC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBC4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBCC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBD4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BBF4 |
  db $00, $00, $00, $00, $00, $11, $10, $11 ; $05BBFC |
  db $12, $4F, $00, $03, $C5, $12, $12, $29 ; $05BC04 |
  db $2F, $0B, $0D, $0F, $4F, $4F, $3D, $3D ; $05BC0C |
  db $3B, $10, $2D, $2F, $8E, $8E, $8F, $05 ; $05BC14 |
  db $06, $09, $3B, $2F, $41, $AF, $45, $47 ; $05BC1C |
  db $C1, $4B, $4D, $C3, $61, $63, $65, $67 ; $05BC24 |
  db $69, $CF, $6D, $6F, $C1, $C3, $AF, $12 ; $05BC2C |
  db $21, $23, $25, $27, $4F, $BF, $CF, $DF ; $05BC34 |
  db $C7, $CA, $12, $CF, $12, $4F, $4F, $4F ; $05BC3C |
  db $07, $07, $E9, $EB, $4F, $92, $94, $96 ; $05BC44 |
  db $4F, $13, $00, $EF, $B0, $B2, $B4, $B6 ; $05BC4C |
  db $B8, $13, $E1, $E3, $4F, $07, $98, $9A ; $05BC54 |
  db $9C, $4F, $E5, $E7, $01, $11, $44, $48 ; $05BC5C |
  db $11, $12, $C9, $C9, $44, $00, $00, $00 ; $05BC64 |
  db $00, $11, $00, $00, $01, $00, $00, $C1 ; $05BC6C |
  db $C3, $77, $C1, $C3, $00, $70, $01, $01 ; $05BC74 |
  db $76, $00, $AF, $CF, $3F, $AF, $CF, $3F ; $05BC7C |
  db $BF, $DF, $00, $00, $00, $00, $00, $00 ; $05BC84 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BC8C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BC94 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BC9C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCA4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCAC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCBC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCC4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCCC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCD4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BCF4 |
  db $00, $00, $00, $00, $00, $11, $10, $11 ; $05BCFC |
  db $12, $4F, $3C, $02, $D4, $12, $12, $10 ; $05BD04 |
  db $3E, $1A, $1C, $1E, $4F, $00, $3C, $3C ; $05BD0C |
  db $3A, $2A, $2C, $2E, $9D, $9E, $9E, $04 ; $05BD14 |
  db $16, $18, $3A, $3E, $50, $52, $BE, $56 ; $05BD1C |
  db $58, $5A, $5C, $5E, $D0, $72, $74, $D2 ; $05BD24 |
  db $78, $7A, $DE, $7E, $D0, $D2, $BE, $12 ; $05BD2C |
  db $30, $32, $34, $36, $AE, $CE, $DE, $4F ; $05BD34 |
  db $C6, $DA, $12, $DE, $12, $81, $83, $85 ; $05BD3C |
  db $4F, $4F, $F8, $00, $4F, $A1, $A3, $A5 ; $05BD44 |
  db $A7, $4F, $FC, $FE, $4F, $4F, $4F, $89 ; $05BD4C |
  db $8B, $17, $F0, $F2, $4F, $4F, $4F, $A9 ; $05BD54 |
  db $AB, $17, $F4, $F6, $01, $54, $01, $01 ; $05BD5C |
  db $49, $12, $D8, $D8, $53, $00, $00, $00 ; $05BD64 |
  db $00, $01, $00, $00, $11, $00, $00, $D0 ; $05BD6C |
  db $D2, $39, $D0, $D2, $00, $11, $71, $39 ; $05BD74 |
  db $11, $00, $BE, $DE, $3F, $BE, $DE, $AE ; $05BD7C |
  db $CE, $3F, $00, $00, $00, $00, $00, $00 ; $05BD84 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BD8C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BD94 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BD9C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDA4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDAC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDBC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDC4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDCC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDD4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BDF4 |
  db $00, $00, $00, $00, $00, $11, $10, $11 ; $05BDFC |
  db $12, $3F, $3D, $03, $D5, $12, $12, $10 ; $05BE04 |
  db $2F, $1B, $1D, $1F, $87, $87, $3D, $3D ; $05BE0C |
  db $3B, $10, $2D, $2F, $9E, $9E, $9F, $15 ; $05BE14 |
  db $16, $09, $3B, $2F, $51, $BF, $55, $57 ; $05BE1C |
  db $59, $5B, $5D, $5F, $D1, $73, $75, $D3 ; $05BE24 |
  db $79, $DF, $7D, $7F, $D1, $D3, $BF, $12 ; $05BE2C |
  db $31, $33, $35, $37, $AF, $CF, $DF, $3F ; $05BE34 |
  db $C7, $DA, $12, $DF, $12, $82, $84, $86 ; $05BE3C |
  db $3F, $17, $F9, $FB, $A0, $A2, $A4, $A6 ; $05BE44 |
  db $3F, $3F, $FD, $FF, $3F, $3F, $00, $8A ; $05BE4C |
  db $8C, $3F, $F1, $F3, $3F, $17, $3F, $AA ; $05BE54 |
  db $AC, $3F, $F5, $F7, $01, $53, $01, $01 ; $05BE5C |
  db $48, $12, $D9, $D9, $01, $00, $00, $00 ; $05BE64 |
  db $00, $49, $00, $00, $43, $00, $00, $D1 ; $05BE6C |
  db $D3, $11, $D1, $D3, $00, $11, $43, $76 ; $05BE74 |
  db $11, $00, $BF, $DF, $4F, $BF, $DF, $AF ; $05BE7C |
  db $CF, $4F, $00, $00, $00, $00, $00, $00 ; $05BE84 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BE8C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BE94 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BE9C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEA4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEAC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEBC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEC4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BECC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BED4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BEF4 |
  db $00, $00, $00, $00, $00, $03, $01, $00 ; $05BEFC |
  db $00, $10, $00, $10, $10, $00, $00, $01 ; $05BF04 |
  db $01, $11, $41, $11, $00, $00, $43, $23 ; $05BF0C |
  db $43, $01, $21, $01, $11, $11, $11, $11 ; $05BF14 |
  db $11, $11, $23, $01, $10, $10, $10, $10 ; $05BF1C |
  db $10, $10, $10, $10, $10, $10, $10, $10 ; $05BF24 |
  db $10, $10, $10, $10, $10, $10, $10, $10 ; $05BF2C |
  db $10, $10, $10, $10, $00, $00, $10, $00 ; $05BF34 |
  db $10, $10, $60, $10, $00, $00, $00, $00 ; $05BF3C |
  db $00, $00, $13, $13, $00, $00, $00, $00 ; $05BF44 |
  db $00, $00, $13, $13, $00, $00, $00, $00 ; $05BF4C |
  db $00, $00, $11, $11, $00, $00, $00, $00 ; $05BF54 |
  db $00, $00, $11, $11, $03, $03, $03, $03 ; $05BF5C |
  db $03, $00, $13, $10, $03, $00, $00, $00 ; $05BF64 |
  db $00, $03, $00, $00, $03, $00, $00, $00 ; $05BF6C |
  db $00, $03, $00, $00, $00, $03, $03, $03 ; $05BF74 |
  db $03, $00, $00, $00, $00, $00, $00, $00 ; $05BF7C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BF84 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BF8C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BF94 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BF9C |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFA4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFAC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFB4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFBC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFC4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFCC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFD4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFDC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFE4 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFEC |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $05BFF4 |
  db $00, $00, $00, $00                     ; $05BFFC |

