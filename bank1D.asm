bank $1D
org $A000
  ; cross bank instruction
  dw $04E0                                  ; $1DA000 |

  BNE code_1DA007                           ; $1DA002 |
  JMP code_1DA180                           ; $1DA004 |

code_1DA007:
  LDA $0300,x                               ; $1DA007 |
  AND #$0F                                  ; $1DA00A |
  BNE code_1DA032                           ; $1DA00C |
  STA $05E0,x                               ; $1DA00E |
  LDA $03C0,x                               ; $1DA011 |
  CMP #$90                                  ; $1DA014 |
  BCS code_1DA01B                           ; $1DA016 |
  JMP code_1FF797                           ; $1DA018 |

code_1DA01B:
  LDY #$00                                  ; $1DA01B |
  JSR code_1FF67C                           ; $1DA01D |
  BCC code_1DA05F                           ; $1DA020 |
  LDA $0320,x                               ; $1DA022 |
  SEC                                       ; $1DA025 |
  SBC #$52                                  ; $1DA026 |
  TAY                                       ; $1DA028 |
  LDA $A176,y                               ; $1DA029 |
  STA $0500,x                               ; $1DA02C |
  INC $0300,x                               ; $1DA02F |
code_1DA032:
  LDA $05C0,x                               ; $1DA032 |
  CMP #$99                                  ; $1DA035 |
  BNE code_1DA04A                           ; $1DA037 |
  LDA $05A0,x                               ; $1DA039 |
  CMP #$04                                  ; $1DA03C |
  BNE code_1DA05F                           ; $1DA03E |
  LDA $0500,x                               ; $1DA040 |
  TYA                                       ; $1DA043 |
  LDA $A178,y                               ; $1DA044 |
  JSR reset_sprite_anim                     ; $1DA047 |
code_1DA04A:
  LDA $0300,x                               ; $1DA04A |
  AND #$02                                  ; $1DA04D |
  BEQ code_1DA054                           ; $1DA04F |
  JMP code_1DA0D3                           ; $1DA051 |

code_1DA054:
  JSR code_1FF8C2                           ; $1DA054 |
  CMP #$60                                  ; $1DA057 |
  BCS code_1DA05F                           ; $1DA059 |
  INC $0300,x                               ; $1DA05B |
  RTS                                       ; $1DA05E |

code_1DA05F:
  LDY #$00                                  ; $1DA05F |
  JSR code_1FF67C                           ; $1DA061 |
  ROL $0F                                   ; $1DA064 |
  LDA $04A0,x                               ; $1DA066 |
  AND #$01                                  ; $1DA069 |
  BEQ code_1DA075                           ; $1DA06B |
  LDY #$00                                  ; $1DA06D |
  JSR code_1FF580                           ; $1DA06F |
  JMP code_1DA07A                           ; $1DA072 |

code_1DA075:
  LDY #$01                                  ; $1DA075 |
  JSR code_1FF5C4                           ; $1DA077 |
code_1DA07A:
  LDA $0F                                   ; $1DA07A |
  AND #$01                                  ; $1DA07C |
  BEQ code_1DA0D2                           ; $1DA07E |
  LDA $04A0,x                               ; $1DA080 |
  AND #$01                                  ; $1DA083 |
  BEQ code_1DA091                           ; $1DA085 |
  LDA $0360,x                               ; $1DA087 |
  CMP #$D6                                  ; $1DA08A |
  BCC code_1DA0A1                           ; $1DA08C |
  JMP code_1DA098                           ; $1DA08E |

code_1DA091:
  LDA $0360,x                               ; $1DA091 |
  CMP #$2A                                  ; $1DA094 |
  BCS code_1DA0A1                           ; $1DA096 |
code_1DA098:
  LDA $04A0,x                               ; $1DA098 |
  EOR #$03                                  ; $1DA09B |
  STA $04A0,x                               ; $1DA09D |
  RTS                                       ; $1DA0A0 |

code_1DA0A1:
  LDA $10                                   ; $1DA0A1 |
  AND #$10                                  ; $1DA0A3 |
  BEQ code_1DA0BC                           ; $1DA0A5 |
  LDA $0500,x                               ; $1DA0A7 |
  TYA                                       ; $1DA0AA |
  LDA $A17A,y                               ; $1DA0AB |
  JSR reset_sprite_anim                     ; $1DA0AE |
  LDA #$A8                                  ; $1DA0B1 |
  STA $0440,x                               ; $1DA0B3 |
  LDA #$05                                  ; $1DA0B6 |
  STA $0460,x                               ; $1DA0B8 |
  RTS                                       ; $1DA0BB |

code_1DA0BC:
  LDA $0500,x                               ; $1DA0BC |
  TAY                                       ; $1DA0BF |
  LDA $A17C,y                               ; $1DA0C0 |
  CMP $05C0,x                               ; $1DA0C3 |
  BEQ code_1DA0D2                           ; $1DA0C6 |
  LDA $0500,x                               ; $1DA0C8 |
  TAY                                       ; $1DA0CB |
  LDA $A17C,y                               ; $1DA0CC |
  JSR reset_sprite_anim                     ; $1DA0CF |
code_1DA0D2:
  RTS                                       ; $1DA0D2 |

code_1DA0D3:
  LDA $0540,x                               ; $1DA0D3 |
  BNE code_1DA13A                           ; $1DA0D6 |
  LDA $04A0,x                               ; $1DA0D8 |
  AND #$01                                  ; $1DA0DB |
  BEQ code_1DA0E7                           ; $1DA0DD |
  LDY #$00                                  ; $1DA0DF |
  JSR code_1FF580                           ; $1DA0E1 |
  JMP code_1DA0EC                           ; $1DA0E4 |

code_1DA0E7:
  LDY #$01                                  ; $1DA0E7 |
  JSR code_1FF5C4                           ; $1DA0E9 |
code_1DA0EC:
  LDA $04A0,x                               ; $1DA0EC |
  AND #$01                                  ; $1DA0EF |
  BEQ code_1DA0FD                           ; $1DA0F1 |
  LDA $0360,x                               ; $1DA0F3 |
  CMP #$D6                                  ; $1DA0F6 |
  BCC code_1DA10C                           ; $1DA0F8 |
  JMP code_1DA104                           ; $1DA0FA |

code_1DA0FD:
  LDA $0360,x                               ; $1DA0FD |
  CMP #$2A                                  ; $1DA100 |
  BCS code_1DA10C                           ; $1DA102 |
code_1DA104:
  LDA $04A0,x                               ; $1DA104 |
  EOR #$03                                  ; $1DA107 |
  STA $04A0,x                               ; $1DA109 |
code_1DA10C:
  LDY #$00                                  ; $1DA10C |
  JSR code_1FF67C                           ; $1DA10E |
  BCC code_1DA13E                           ; $1DA111 |
  LDA #$04                                  ; $1DA113 |
  STA $0540,x                               ; $1DA115 |
  LDA $0500,x                               ; $1DA118 |
  TAY                                       ; $1DA11B |
  LDA $A17C,y                               ; $1DA11C |
  JSR reset_sprite_anim                     ; $1DA11F |
  LDA #$A8                                  ; $1DA122 |
  STA $0440,x                               ; $1DA124 |
  LDA #$05                                  ; $1DA127 |
  STA $0460,x                               ; $1DA129 |
  JSR code_1FF8C2                           ; $1DA12C |
  CMP #$60                                  ; $1DA12F |
  BCC code_1DA139                           ; $1DA131 |
  DEC $0300,x                               ; $1DA133 |
  JSR reset_gravity                         ; $1DA136 |
code_1DA139:
  RTS                                       ; $1DA139 |

code_1DA13A:
  DEC $0540,x                               ; $1DA13A |
  RTS                                       ; $1DA13D |

code_1DA13E:
  LDA $0460,x                               ; $1DA13E |
  BPL code_1DA14D                           ; $1DA141 |
  LDA $0500,x                               ; $1DA143 |
  TAY                                       ; $1DA146 |
  LDA $A17A,y                               ; $1DA147 |
  JMP reset_sprite_anim                     ; $1DA14A |

code_1DA14D:
  LDA $0500,x                               ; $1DA14D |
  TYA                                       ; $1DA150 |
  LDA $A17E,y                               ; $1DA151 |
  CMP $05C0,x                               ; $1DA154 |
  BEQ code_1DA163                           ; $1DA157 |
  LDA $0500,x                               ; $1DA159 |
  TYA                                       ; $1DA15C |
  LDA $A17E,y                               ; $1DA15D |
  JSR reset_sprite_anim                     ; $1DA160 |
code_1DA163:
  LDA $05A0,x                               ; $1DA163 |
  CMP #$01                                  ; $1DA166 |
  BNE code_1DA139                           ; $1DA168 |
  JSR code_1DA293                           ; $1DA16A |
  LDA #$00                                  ; $1DA16D |
  STA $05E0,x                               ; $1DA16F |
  STA $05A0,x                               ; $1DA172 |
  RTS                                       ; $1DA175 |

  db $00, $01, $88, $8A, $86, $8F, $83, $8C ; $1DA176 |
  db $85, $8E                               ; $1DA17E |

code_1DA180:
  LDA #$99                                  ; $1DA180 |
  CMP $05C0,x                               ; $1DA182 |
  BEQ code_1DA1A2                           ; $1DA185 |
  LDA #$00                                  ; $1DA187 |
  STA $0480,x                               ; $1DA189 |
  TAY                                       ; $1DA18C |
  JSR code_1FF67C                           ; $1DA18D |
  BCC code_1DA1E1                           ; $1DA190 |
  LDA #$99                                  ; $1DA192 |
  JSR reset_sprite_anim                     ; $1DA194 |
  INC $05A0,x                               ; $1DA197 |
  LDA #$00                                  ; $1DA19A |
  STA $0440,x                               ; $1DA19C |
  STA $0460,x                               ; $1DA19F |
code_1DA1A2:
  LDA $05A0,x                               ; $1DA1A2 |
  BNE code_1DA1E1                           ; $1DA1A5 |
  STA $05E0,x                               ; $1DA1A7 |
  LDA $0440,x                               ; $1DA1AA |
  CLC                                       ; $1DA1AD |
  ADC $99                                   ; $1DA1AE |
  STA $0440,x                               ; $1DA1B0 |
  LDA $0460,x                               ; $1DA1B3 |
  ADC #$00                                  ; $1DA1B6 |
  STA $0460,x                               ; $1DA1B8 |
  CMP #$0C                                  ; $1DA1BB |
  BNE code_1DA1C4                           ; $1DA1BD |
  LDA #$00                                  ; $1DA1BF |
  STA $0440,x                               ; $1DA1C1 |
code_1DA1C4:
  JSR code_1FF779                           ; $1DA1C4 |
  LDA $03E0,x                               ; $1DA1C7 |
  BEQ code_1DA1E1                           ; $1DA1CA |
  LDA #$00                                  ; $1DA1CC |
  STA $0300,x                               ; $1DA1CE |
  LDA $0320,x                               ; $1DA1D1 |
  CMP #$53                                  ; $1DA1D4 |
  BNE code_1DA1DD                           ; $1DA1D6 |
  LDA #$13                                  ; $1DA1D8 |
  STA $30                                   ; $1DA1DA |
  RTS                                       ; $1DA1DC |

code_1DA1DD:
  LDA #$80                                  ; $1DA1DD |
  STA $68                                   ; $1DA1DF |
code_1DA1E1:
  RTS                                       ; $1DA1E1 |

  JSR code_1DA249                           ; $1DA1E2 |
  LDA $0560,x                               ; $1DA1E5 |
  BEQ code_1DA1E1                           ; $1DA1E8 |
  LDA #$0F                                  ; $1DA1EA |
  STA $30                                   ; $1DA1EC |
  LDA $0300,x                               ; $1DA1EE |
  AND #$0F                                  ; $1DA1F1 |
  BNE code_1DA216                           ; $1DA1F3 |
  JSR code_1FF797                           ; $1DA1F5 |
  LDA #$9C                                  ; $1DA1F8 |
  CMP $03C0,x                               ; $1DA1FA |
  BCS code_1DA243                           ; $1DA1FD |
  STA $03C0,x                               ; $1DA1FF |
  LDA $05A0,x                               ; $1DA202 |
  CMP #$04                                  ; $1DA205 |
  BNE code_1DA248                           ; $1DA207 |
  LDA #$88                                  ; $1DA209 |
  JSR reset_sprite_anim                     ; $1DA20B |
  INC $0300,x                               ; $1DA20E |
  LDA #$FF                                  ; $1DA211 |
  STA $0500,x                               ; $1DA213 |
code_1DA216:
  LDA $0500,x                               ; $1DA216 |
  BEQ code_1DA230                           ; $1DA219 |
  DEC $0500,x                               ; $1DA21B |
  BNE code_1DA243                           ; $1DA21E |
  LDA #$99                                  ; $1DA220 |
  STA $05C0,x                               ; $1DA222 |
  INC $05A0,x                               ; $1DA225 |
  LDA #$00                                  ; $1DA228 |
  STA $0440,x                               ; $1DA22A |
  STA $0460,x                               ; $1DA22D |
code_1DA230:
  JSR code_1DA1A2                           ; $1DA230 |
  LDA $68                                   ; $1DA233 |
  BEQ code_1DA248                           ; $1DA235 |
  LDA #$00                                  ; $1DA237 |
  STA $30                                   ; $1DA239 |
  LDY #$0F                                  ; $1DA23B |
code_1DA23D:
  STA $0310,y                               ; $1DA23D |
  DEY                                       ; $1DA240 |
  BPL code_1DA23D                           ; $1DA241 |
code_1DA243:
  LDA #$00                                  ; $1DA243 |
  STA $05E0,x                               ; $1DA245 |
code_1DA248:
  RTS                                       ; $1DA248 |

code_1DA249:
  LDA $0560,x                               ; $1DA249 |
  BNE code_1DA292                           ; $1DA24C |
  LDA $30                                   ; $1DA24E |
  BNE code_1DA25D                           ; $1DA250 |
  LDA $05C0                                 ; $1DA252 |
  CMP #$13                                  ; $1DA255 |
  BEQ code_1DA292                           ; $1DA257 |
  LDA #$0F                                  ; $1DA259 |
  STA $30                                   ; $1DA25B |
code_1DA25D:
  LDA #$11                                  ; $1DA25D |
  CMP $D9                                   ; $1DA25F |
  BEQ code_1DA26B                           ; $1DA261 |
  JSR code_1FF898                           ; $1DA263 |
  LDA #$B4                                  ; $1DA266 |
  STA $0500,x                               ; $1DA268 |
code_1DA26B:
  DEC $0500,x                               ; $1DA26B |
  BNE code_1DA292                           ; $1DA26E |
  LDA #$00                                  ; $1DA270 |
  STA $30                                   ; $1DA272 |
  INC $0560,x                               ; $1DA274 |
  LDA $0580,x                               ; $1DA277 |
  AND #$FB                                  ; $1DA27A |
  STA $0580,x                               ; $1DA27C |
  LDA $0320,x                               ; $1DA27F |
  CMP #$53                                  ; $1DA282 |
  BNE code_1DA28A                           ; $1DA284 |
  LDA #$0C                                  ; $1DA286 |
  BNE code_1DA28F                           ; $1DA288 |
code_1DA28A:
  LDA $22                                   ; $1DA28A |
  CLC                                       ; $1DA28C |
  ADC #$01                                  ; $1DA28D |
code_1DA28F:
  JSR code_1FF898                           ; $1DA28F |
code_1DA292:
  RTS                                       ; $1DA292 |

code_1DA293:
  JSR find_enemy_freeslot_y                 ; $1DA293 |
  BCS code_1DA2E7                           ; $1DA296 |
  STY $00                                   ; $1DA298 |
  LDA $04A0,x                               ; $1DA29A |
  STA $04A0,y                               ; $1DA29D |
  AND #$02                                  ; $1DA2A0 |
  TAY                                       ; $1DA2A2 |
  LDA $0360,x                               ; $1DA2A3 |
  CLC                                       ; $1DA2A6 |
  ADC $A2E8,y                               ; $1DA2A7 |
  PHA                                       ; $1DA2AA |
  LDA $0380,x                               ; $1DA2AB |
  ADC $A2E9,y                               ; $1DA2AE |
  LDY $00                                   ; $1DA2B1 |
  STA $0380,y                               ; $1DA2B3 |
  PLA                                       ; $1DA2B6 |
  STA $0360,y                               ; $1DA2B7 |
  LDA $03C0,x                               ; $1DA2BA |
  STA $03C0,y                               ; $1DA2BD |
  LDA #$00                                  ; $1DA2C0 |
  STA $04E0,y                               ; $1DA2C2 |
  STA $0400,y                               ; $1DA2C5 |
  LDA #$04                                  ; $1DA2C8 |
  STA $0420,y                               ; $1DA2CA |
  LDA $0320,x                               ; $1DA2CD |
  AND #$01                                  ; $1DA2D0 |
  BNE code_1DA2D8                           ; $1DA2D2 |
  LDA #$18                                  ; $1DA2D4 |
  BNE code_1DA2DA                           ; $1DA2D6 |
code_1DA2D8:
  LDA #$73                                  ; $1DA2D8 |
code_1DA2DA:
  JSR code_1FF846                           ; $1DA2DA |
  LDA #$8B                                  ; $1DA2DD |
  STA $0480,y                               ; $1DA2DF |
  LDA #$1B                                  ; $1DA2E2 |
  STA $0320,y                               ; $1DA2E4 |
code_1DA2E7:
  RTS                                       ; $1DA2E7 |

  db $0D, $00, $F3, $FF                     ; $1DA2E8 |

  LDA $0300,x                               ; $1DA2EC |
  AND #$0F                                  ; $1DA2EF |
  BNE code_1DA2FE                           ; $1DA2F1 |
  JSR code_1FF883                           ; $1DA2F3 |
  LDA #$3C                                  ; $1DA2F6 |
  STA $0560,x                               ; $1DA2F8 |
  INC $0300,x                               ; $1DA2FB |
code_1DA2FE:
  LDA $0300,x                               ; $1DA2FE |
  AND #$0F                                  ; $1DA301 |
  CMP #$02                                  ; $1DA303 |
  BEQ code_1DA321                           ; $1DA305 |
  CMP #$03                                  ; $1DA307 |
  BEQ code_1DA389                           ; $1DA309 |
  DEC $0560,x                               ; $1DA30B |
  BNE code_1DA318                           ; $1DA30E |
  LDA #$00                                  ; $1DA310 |
  STA $0560,x                               ; $1DA312 |
  INC $0300,x                               ; $1DA315 |
code_1DA318:
  LDA #$00                                  ; $1DA318 |
  STA $05E0,x                               ; $1DA31A |
  STA $05A0,x                               ; $1DA31D |
  RTS                                       ; $1DA320 |

code_1DA321:
  LDA $0500,x                               ; $1DA321 |
  BNE code_1DA36B                           ; $1DA324 |
  LDA $05A0,x                               ; $1DA326 |
  CMP #$01                                  ; $1DA329 |
  BNE code_1DA33D                           ; $1DA32B |
  LDA $05E0,x                               ; $1DA32D |
  CMP #$01                                  ; $1DA330 |
  BNE code_1DA33D                           ; $1DA332 |
  LDA #$04                                  ; $1DA334 |
  STA $01                                   ; $1DA336 |
  STX $00                                   ; $1DA338 |
  JSR code_1DA41A                           ; $1DA33A |
code_1DA33D:
  LDA $05A0,x                               ; $1DA33D |
  CMP #$03                                  ; $1DA340 |
  BNE code_1DA354                           ; $1DA342 |
  LDA $05E0,x                               ; $1DA344 |
  CMP #$01                                  ; $1DA347 |
  BNE code_1DA354                           ; $1DA349 |
  LDA #$04                                  ; $1DA34B |
  STA $01                                   ; $1DA34D |
  STX $00                                   ; $1DA34F |
  JSR code_1DA41A                           ; $1DA351 |
code_1DA354:
  LDA $05A0,x                               ; $1DA354 |
  CMP #$04                                  ; $1DA357 |
  BNE code_1DA36A                           ; $1DA359 |
  LDA $05E0,x                               ; $1DA35B |
  CMP #$02                                  ; $1DA35E |
  BNE code_1DA36A                           ; $1DA360 |
  INC $0500,x                               ; $1DA362 |
  LDA #$10                                  ; $1DA365 |
  STA $0520,x                               ; $1DA367 |
code_1DA36A:
  RTS                                       ; $1DA36A |

code_1DA36B:
  LDA #$00                                  ; $1DA36B |
  STA $05E0,x                               ; $1DA36D |
  STA $05A0,x                               ; $1DA370 |
  DEC $0520,x                               ; $1DA373 |
  BNE code_1DA388                           ; $1DA376 |
  INC $0300,x                               ; $1DA378 |
  LDA #$77                                  ; $1DA37B |
  JSR reset_sprite_anim                     ; $1DA37D |
  JSR face_player                           ; $1DA380 |
  LDA #$5A                                  ; $1DA383 |
  STA $0540,x                               ; $1DA385 |
code_1DA388:
  RTS                                       ; $1DA388 |

code_1DA389:
  LDA $05C0,x                               ; $1DA389 |
  CMP #$76                                  ; $1DA38C |
  BEQ code_1DA3FA                           ; $1DA38E |
  LDY #$0E                                  ; $1DA390 |
  JSR code_1FF67C                           ; $1DA392 |
  BCC code_1DA3BA                           ; $1DA395 |
  LDA #$AA                                  ; $1DA397 |
  STA $0480,x                               ; $1DA399 |
  LDA $04A0,x                               ; $1DA39C |
  AND #$01                                  ; $1DA39F |
  BEQ code_1DA3AB                           ; $1DA3A1 |
  LDY #$1C                                  ; $1DA3A3 |
  JSR code_1FF580                           ; $1DA3A5 |
  JMP code_1DA3B0                           ; $1DA3A8 |

code_1DA3AB:
  LDY #$1D                                  ; $1DA3AB |
  JSR code_1FF5C4                           ; $1DA3AD |
code_1DA3B0:
  BCC code_1DA3BA                           ; $1DA3B0 |
  LDA $04A0,x                               ; $1DA3B2 |
  EOR #$03                                  ; $1DA3B5 |
  STA $04A0,x                               ; $1DA3B7 |
code_1DA3BA:
  LDA $0560,x                               ; $1DA3BA |
  BNE code_1DA3D7                           ; $1DA3BD |
  DEC $0540,x                               ; $1DA3BF |
  BNE code_1DA3D6                           ; $1DA3C2 |
  LDA #$C6                                  ; $1DA3C4 |
  STA $0480,x                               ; $1DA3C6 |
  LDA #$76                                  ; $1DA3C9 |
  JSR reset_sprite_anim                     ; $1DA3CB |
  LDA #$FF                                  ; $1DA3CE |
  STA $0540,x                               ; $1DA3D0 |
  INC $0560,x                               ; $1DA3D3 |
code_1DA3D6:
  RTS                                       ; $1DA3D6 |

code_1DA3D7:
  DEC $0540,x                               ; $1DA3D7 |
  BNE code_1DA3D6                           ; $1DA3DA |
  LDA #$00                                  ; $1DA3DC |
  STA $0500,x                               ; $1DA3DE |
  STA $0520,x                               ; $1DA3E1 |
  STA $0540,x                               ; $1DA3E4 |
  STA $0560,x                               ; $1DA3E7 |
  LDA #$C6                                  ; $1DA3EA |
  STA $0480,x                               ; $1DA3EC |
  LDA #$76                                  ; $1DA3EF |
  JSR reset_sprite_anim                     ; $1DA3F1 |
  LDA #$82                                  ; $1DA3F4 |
  STA $0300,x                               ; $1DA3F6 |
  RTS                                       ; $1DA3F9 |

code_1DA3FA:
  LDA $05A0,x                               ; $1DA3FA |
  CMP #$01                                  ; $1DA3FD |
  BNE code_1DA419                           ; $1DA3FF |
  LDA $05E0,x                               ; $1DA401 |
  CMP #$02                                  ; $1DA404 |
  BNE code_1DA419                           ; $1DA406 |
  LDA #$04                                  ; $1DA408 |
  STA $01                                   ; $1DA40A |
  STX $00                                   ; $1DA40C |
  JSR code_1DA41A                           ; $1DA40E |
  LDA #$10                                  ; $1DA411 |
  STA $0520,x                               ; $1DA413 |
  DEC $0300,x                               ; $1DA416 |
code_1DA419:
  RTS                                       ; $1DA419 |

code_1DA41A:
  JSR find_enemy_freeslot_y                 ; $1DA41A |
  BCS code_1DA472                           ; $1DA41D |
  LDX $01                                   ; $1DA41F |
  LDA $A475,x                               ; $1DA421 |
  STA $0400,y                               ; $1DA424 |
  LDA $A47A,x                               ; $1DA427 |
  STA $0420,y                               ; $1DA42A |
  LDA $A47F,x                               ; $1DA42D |
  STA $0440,y                               ; $1DA430 |
  LDA $A484,x                               ; $1DA433 |
  STA $0460,y                               ; $1DA436 |
  LDA $A489,x                               ; $1DA439 |
  STA $04A0,y                               ; $1DA43C |
  LDA $A48E,x                               ; $1DA43F |
  JSR code_1FF846                           ; $1DA442 |
  LDA $A493,x                               ; $1DA445 |
  STA $0580,y                               ; $1DA448 |
  LDX $00                                   ; $1DA44B |
  LDA #$CB                                  ; $1DA44D |
  STA $0480,y                               ; $1DA44F |
  LDA #$36                                  ; $1DA452 |
  STA $0320,y                               ; $1DA454 |
  LDA $0360,x                               ; $1DA457 |
  STA $0360,y                               ; $1DA45A |
  LDA $0380,x                               ; $1DA45D |
  STA $0380,y                               ; $1DA460 |
  LDA $03C0,x                               ; $1DA463 |
  STA $03C0,y                               ; $1DA466 |
  LDA #$01                                  ; $1DA469 |
  STA $04E0,y                               ; $1DA46B |
  DEC $01                                   ; $1DA46E |
  BPL code_1DA41A                           ; $1DA470 |
code_1DA472:
  LDX $00                                   ; $1DA472 |
  RTS                                       ; $1DA474 |

  db $00, $1F, $00, $00, $1F, $00, $02, $03 ; $1DA475 |
  db $03, $02, $00, $E1, $00, $00, $E1, $FD ; $1DA47D |
  db $FD, $00, $00, $FD, $02, $02, $02, $01 ; $1DA485 |
  db $01, $40, $79, $78, $78, $79, $90, $90 ; $1DA48D |
  db $90, $D0, $D0                          ; $1DA495 |

  LDA $0300,x                               ; $1DA498 |
  AND #$0F                                  ; $1DA49B |
  BNE code_1DA4BA                           ; $1DA49D |
  LDA $04A0,x                               ; $1DA49F |
  AND #$01                                  ; $1DA4A2 |
  BEQ code_1DA4AC                           ; $1DA4A4 |
  JSR code_1FF71D                           ; $1DA4A6 |
  JMP code_1DA4AF                           ; $1DA4A9 |

code_1DA4AC:
  JSR code_1FF73B                           ; $1DA4AC |
code_1DA4AF:
  JSR code_1FF8C2                           ; $1DA4AF |
  CMP #$40                                  ; $1DA4B2 |
  BCS code_1DA4B9                           ; $1DA4B4 |
  INC $0300,x                               ; $1DA4B6 |
code_1DA4B9:
  RTS                                       ; $1DA4B9 |

code_1DA4BA:
  LDA $0300,x                               ; $1DA4BA |
  AND #$02                                  ; $1DA4BD |
  BEQ code_1DA4C4                           ; $1DA4BF |
  JMP code_1DA561                           ; $1DA4C1 |

code_1DA4C4:
  LDA $0500,x                               ; $1DA4C4 |
  BNE code_1DA51A                           ; $1DA4C7 |
  LDY $0520,x                               ; $1DA4C9 |
  LDA $A56E,y                               ; $1DA4CC |
  ASL                                       ; $1DA4CF |
  TAY                                       ; $1DA4D0 |
  LDA $A57C,y                               ; $1DA4D1 |
  STA $0440,x                               ; $1DA4D4 |
  LDA $A57D,y                               ; $1DA4D7 |
  STA $0460,x                               ; $1DA4DA |
  LDA $A59C,y                               ; $1DA4DD |
  STA $0400,x                               ; $1DA4E0 |
  LDA $A59D,y                               ; $1DA4E3 |
  STA $0420,x                               ; $1DA4E6 |
  LDA $0420,x                               ; $1DA4E9 |
  BPL code_1DA503                           ; $1DA4EC |
  LDA $0400,x                               ; $1DA4EE |
  EOR #$FF                                  ; $1DA4F1 |
  CLC                                       ; $1DA4F3 |
  ADC #$01                                  ; $1DA4F4 |
  STA $0400,x                               ; $1DA4F6 |
  LDA $0420,x                               ; $1DA4F9 |
  EOR #$FF                                  ; $1DA4FC |
  ADC #$00                                  ; $1DA4FE |
  STA $0420,x                               ; $1DA500 |
code_1DA503:
  INC $0520,x                               ; $1DA503 |
  LDA $0520,x                               ; $1DA506 |
  CMP #$06                                  ; $1DA509 |
  BNE code_1DA515                           ; $1DA50B |
  INC $0300,x                               ; $1DA50D |
  LDA #$1A                                  ; $1DA510 |
  STA $0560,x                               ; $1DA512 |
code_1DA515:
  LDA #$0D                                  ; $1DA515 |
  STA $0500,x                               ; $1DA517 |
code_1DA51A:
  DEC $0500,x                               ; $1DA51A |
  LDA $03A0,x                               ; $1DA51D |
  CLC                                       ; $1DA520 |
  ADC $0440,x                               ; $1DA521 |
  STA $03A0,x                               ; $1DA524 |
  LDA $03C0,x                               ; $1DA527 |
  ADC $0460,x                               ; $1DA52A |
  STA $03C0,x                               ; $1DA52D |
  LDA $04A0,x                               ; $1DA530 |
  AND #$02                                  ; $1DA533 |
  BNE code_1DA53E                           ; $1DA535 |
  JSR code_1FF71D                           ; $1DA537 |
  BCS code_1DA541                           ; $1DA53A |
  BCC code_1DA541                           ; $1DA53C |
code_1DA53E:
  JSR code_1FF73B                           ; $1DA53E |
code_1DA541:
  LDA $0560,x                               ; $1DA541 |
  BNE code_1DA55D                           ; $1DA544 |
  JSR code_1DA5BC                           ; $1DA546 |
  INC $0540,x                               ; $1DA549 |
  LDA $0540,x                               ; $1DA54C |
  CMP #$02                                  ; $1DA54F |
  BNE code_1DA557                           ; $1DA551 |
  LDA #$10                                  ; $1DA553 |
  BNE code_1DA559                           ; $1DA555 |
code_1DA557:
  LDA #$1A                                  ; $1DA557 |
code_1DA559:
  STA $0560,x                               ; $1DA559 |
  RTS                                       ; $1DA55C |

code_1DA55D:
  DEC $0560,x                               ; $1DA55D |
  RTS                                       ; $1DA560 |

code_1DA561:
  LDA #$00                                  ; $1DA561 |
  STA $0440,x                               ; $1DA563 |
  LDA #$03                                  ; $1DA566 |
  STA $0460,x                               ; $1DA568 |
  JMP code_1FF779                           ; $1DA56B |

  db $09, $0A, $0B, $0C, $0D, $0E, $0F, $01 ; $1DA56E |
  db $02, $03, $04, $05, $06, $07, $00, $FE ; $1DA576 |
  db $27, $FE, $96, $FE, $3D, $FF, $00, $00 ; $1DA57E |
  db $C3, $00, $6A, $01, $D9, $01, $00, $02 ; $1DA586 |
  db $D9, $01, $6A, $01, $C3, $00, $00, $00 ; $1DA58E |
  db $3D, $FF, $96, $FE, $27, $FE, $00, $00 ; $1DA596 |
  db $C3, $00, $6A, $01, $D9, $01, $00, $02 ; $1DA59E |
  db $D9, $01, $6A, $01, $C3, $00, $00, $00 ; $1DA5A6 |
  db $3D, $FF, $96, $FE, $27, $FE, $00, $FE ; $1DA5AE |
  db $27, $FE, $96, $FE, $3D, $FF           ; $1DA5B6 |

code_1DA5BC:
  JSR find_enemy_freeslot_y                 ; $1DA5BC |
  BCS code_1DA5FD                           ; $1DA5BF |
  STY $00                                   ; $1DA5C1 |
  LDA $04A0,x                               ; $1DA5C3 |
  AND #$02                                  ; $1DA5C6 |
  TAY                                       ; $1DA5C8 |
  LDA $0360,x                               ; $1DA5C9 |
  CLC                                       ; $1DA5CC |
  ADC $A731,y                               ; $1DA5CD |
  PHA                                       ; $1DA5D0 |
  LDA $0380,x                               ; $1DA5D1 |
  ADC $A732,y                               ; $1DA5D4 |
  LDY $00                                   ; $1DA5D7 |
  STA $0380,y                               ; $1DA5D9 |
  PLA                                       ; $1DA5DC |
  STA $0360,y                               ; $1DA5DD |
  LDA $03C0,x                               ; $1DA5E0 |
  CLC                                       ; $1DA5E3 |
  ADC #$10                                  ; $1DA5E4 |
  STA $03C0,y                               ; $1DA5E6 |
  LDA #$00                                  ; $1DA5E9 |
  STA $04E0,y                               ; $1DA5EB |
  LDA #$81                                  ; $1DA5EE |
  JSR code_1FF846                           ; $1DA5F0 |
  LDA #$26                                  ; $1DA5F3 |
  STA $0320,y                               ; $1DA5F5 |
  LDA #$93                                  ; $1DA5F8 |
  STA $0480,y                               ; $1DA5FA |
code_1DA5FD:
  RTS                                       ; $1DA5FD |

  LDA $0300,x                               ; $1DA5FE |
  AND #$0F                                  ; $1DA601 |
  BNE code_1DA60B                           ; $1DA603 |
  JSR reset_gravity                         ; $1DA605 |
  INC $0300,x                               ; $1DA608 |
code_1DA60B:
  LDA $0300,x                               ; $1DA60B |
  AND #$02                                  ; $1DA60E |
  BNE code_1DA627                           ; $1DA610 |
  LDY #$12                                  ; $1DA612 |
  JSR code_1FF67C                           ; $1DA614 |
  BCC code_1DA626                           ; $1DA617 |
  LDA #$71                                  ; $1DA619 |
  JSR reset_sprite_anim                     ; $1DA61B |
  LDA #$24                                  ; $1DA61E |
  JSR code_1FF89A                           ; $1DA620 |
  INC $0300,x                               ; $1DA623 |
code_1DA626:
  RTS                                       ; $1DA626 |

code_1DA627:
  LDA $05C0,x                               ; $1DA627 |
  CMP #$71                                  ; $1DA62A |
  BNE code_1DA626                           ; $1DA62C |
  LDA $05A0,x                               ; $1DA62E |
  CMP #$04                                  ; $1DA631 |
  BNE code_1DA626                           ; $1DA633 |
  LDA #$80                                  ; $1DA635 |
  JMP reset_sprite_anim                     ; $1DA637 |

  LDA $05C0,x                               ; $1DA63A |
  CMP #$71                                  ; $1DA63D |
  BNE code_1DA668                           ; $1DA63F |
  LDA $05A0,x                               ; $1DA641 |
  CMP #$04                                  ; $1DA644 |
  BNE code_1DA667                           ; $1DA646 |
  LDA #$92                                  ; $1DA648 |
  JSR reset_sprite_anim                     ; $1DA64A |
  LDA #$40                                  ; $1DA64D |
  STA $0400,x                               ; $1DA64F |
  STA $0440,x                               ; $1DA652 |
  LDA #$00                                  ; $1DA655 |
  STA $0420,x                               ; $1DA657 |
  STA $0460,x                               ; $1DA65A |
  LDA #$C0                                  ; $1DA65D |
  STA $0480,x                               ; $1DA65F |
  LDA #$01                                  ; $1DA662 |
  STA $04E0,x                               ; $1DA664 |
code_1DA667:
  RTS                                       ; $1DA667 |

code_1DA668:
  JMP code_1DABEA                           ; $1DA668 |

  LDA $0300,x                               ; $1DA66B |
  AND #$0F                                  ; $1DA66E |
  BNE code_1DA67D                           ; $1DA670 |
  STA $0460,x                               ; $1DA672 |
  LDA #$80                                  ; $1DA675 |
  STA $0440,x                               ; $1DA677 |
  INC $0300,x                               ; $1DA67A |
code_1DA67D:
  LDA $0300,x                               ; $1DA67D |
  AND #$02                                  ; $1DA680 |
  BNE code_1DA6BD                           ; $1DA682 |
  LDA $04A0,x                               ; $1DA684 |
  AND #$01                                  ; $1DA687 |
  BEQ code_1DA693                           ; $1DA689 |
  LDY #$14                                  ; $1DA68B |
  JSR code_1FF580                           ; $1DA68D |
  JMP code_1DA698                           ; $1DA690 |

code_1DA693:
  LDY #$15                                  ; $1DA693 |
  JSR code_1FF5C4                           ; $1DA695 |
code_1DA698:
  BCC code_1DA6A0                           ; $1DA698 |
  INC $0540,x                               ; $1DA69A |
code_1DA69D:
  JMP code_1FF759                           ; $1DA69D |

code_1DA6A0:
  LDA $0540,x                               ; $1DA6A0 |
  BNE code_1DA69D                           ; $1DA6A3 |
  LDA $0520,x                               ; $1DA6A5 |
  BNE code_1DA6BC                           ; $1DA6A8 |
  JSR code_1FF8C2                           ; $1DA6AA |
  CMP #$08                                  ; $1DA6AD |
  BCS code_1DA6BC                           ; $1DA6AF |
  INC $0300,x                               ; $1DA6B1 |
  INC $0520,x                               ; $1DA6B4 |
  LDA #$33                                  ; $1DA6B7 |
  JSR reset_sprite_anim                     ; $1DA6B9 |
code_1DA6BC:
  RTS                                       ; $1DA6BC |

code_1DA6BD:
  LDA $05C0,x                               ; $1DA6BD |
  CMP #$33                                  ; $1DA6C0 |
  BNE code_1DA6BC                           ; $1DA6C2 |
  LDA $05E0,x                               ; $1DA6C4 |
  ORA $05A0,x                               ; $1DA6C7 |
  BNE code_1DA6BC                           ; $1DA6CA |
  LDA #$32                                  ; $1DA6CC |
  JSR reset_sprite_anim                     ; $1DA6CE |
  LDA #$00                                  ; $1DA6D1 |
  STA $0400,x                               ; $1DA6D3 |
  LDA #$04                                  ; $1DA6D6 |
  STA $0420,x                               ; $1DA6D8 |
  DEC $0300,x                               ; $1DA6DB |
  JSR find_enemy_freeslot_y                 ; $1DA6DE |
  BCS code_1DA730                           ; $1DA6E1 |
  STY $00                                   ; $1DA6E3 |
  LDA $04A0,x                               ; $1DA6E5 |
  STA $04A0,y                               ; $1DA6E8 |
  AND #$02                                  ; $1DA6EB |
  TAY                                       ; $1DA6ED |
  LDA $0360,x                               ; $1DA6EE |
  CLC                                       ; $1DA6F1 |
  ADC $A731,y                               ; $1DA6F2 |
  PHA                                       ; $1DA6F5 |
  LDA $0380,x                               ; $1DA6F6 |
  ADC $A732,y                               ; $1DA6F9 |
  LDY $00                                   ; $1DA6FC |
  STA $0380,y                               ; $1DA6FE |
  PLA                                       ; $1DA701 |
  STA $0360,y                               ; $1DA702 |
  LDA $03C0,x                               ; $1DA705 |
  SEC                                       ; $1DA708 |
  SBC #$10                                  ; $1DA709 |
  STA $03C0,y                               ; $1DA70B |
  LDA #$00                                  ; $1DA70E |
  STA $04E0,y                               ; $1DA710 |
  LDA #$34                                  ; $1DA713 |
  JSR code_1FF846                           ; $1DA715 |
  LDA $0320,x                               ; $1DA718 |
  CMP #$28                                  ; $1DA71B |
  BEQ code_1DA726                           ; $1DA71D |
  LDA #$45                                  ; $1DA71F |
  STA $0320,y                               ; $1DA721 |
  BNE code_1DA72B                           ; $1DA724 |
code_1DA726:
  LDA #$29                                  ; $1DA726 |
  STA $0320,y                               ; $1DA728 |
code_1DA72B:
  LDA #$C0                                  ; $1DA72B |
  STA $0480,y                               ; $1DA72D |
code_1DA730:
  RTS                                       ; $1DA730 |

  db $00, $00, $00, $00                     ; $1DA731 |

  LDA $0300,x                               ; $1DA735 |
  AND #$0F                                  ; $1DA738 |
  BNE code_1DA74A                           ; $1DA73A |
  STA $0500,x                               ; $1DA73C |
  STA $0440,x                               ; $1DA73F |
  LDA #$02                                  ; $1DA742 |
  STA $0460,x                               ; $1DA744 |
  INC $0300,x                               ; $1DA747 |
code_1DA74A:
  LDA $0300,x                               ; $1DA74A |
  AND #$02                                  ; $1DA74D |
  BNE code_1DA76B                           ; $1DA74F |
  LDY #$17                                  ; $1DA751 |
  JSR code_1FF642                           ; $1DA753 |
  BCC code_1DA76B                           ; $1DA756 |
  INC $0300,x                               ; $1DA758 |
  LDA #$71                                  ; $1DA75B |
  JSR reset_sprite_anim                     ; $1DA75D |
  LDA #$00                                  ; $1DA760 |
  STA $0500,x                               ; $1DA762 |
  LDA #$56                                  ; $1DA765 |
  STA $0320,x                               ; $1DA767 |
  RTS                                       ; $1DA76A |

code_1DA76B:
  LDA $0500,x                               ; $1DA76B |
  BNE code_1DA7CA                           ; $1DA76E |
  LDA $0320,x                               ; $1DA770 |
  CMP #$29                                  ; $1DA773 |
  BEQ code_1DA780                           ; $1DA775 |
  LDA $03C0,x                               ; $1DA777 |
  CMP #$62                                  ; $1DA77A |
  BCS code_1DA7CA                           ; $1DA77C |
  BCC code_1DA787                           ; $1DA77E |
code_1DA780:
  LDA $03C0,x                               ; $1DA780 |
  CMP #$B4                                  ; $1DA783 |
  BCS code_1DA7CA                           ; $1DA785 |
code_1DA787:
  INC $0500,x                               ; $1DA787 |
  JSR find_enemy_freeslot_y                 ; $1DA78A |
  BCS code_1DA7CA                           ; $1DA78D |
  STY $00                                   ; $1DA78F |
  LDA $04A0,x                               ; $1DA791 |
  STA $04A0,y                               ; $1DA794 |
  AND #$02                                  ; $1DA797 |
  TAY                                       ; $1DA799 |
  LDA $0360,x                               ; $1DA79A |
  CLC                                       ; $1DA79D |
  ADC $A731,y                               ; $1DA79E |
  PHA                                       ; $1DA7A1 |
  LDA $0380,x                               ; $1DA7A2 |
  ADC $A732,y                               ; $1DA7A5 |
  LDY $00                                   ; $1DA7A8 |
  STA $0380,y                               ; $1DA7AA |
  PLA                                       ; $1DA7AD |
  STA $0360,y                               ; $1DA7AE |
  LDA $03C0,x                               ; $1DA7B1 |
  SEC                                       ; $1DA7B4 |
  SBC #$04                                  ; $1DA7B5 |
  STA $03C0,y                               ; $1DA7B7 |
  LDA #$00                                  ; $1DA7BA |
  STA $0320,y                               ; $1DA7BC |
  STA $0480,y                               ; $1DA7BF |
  STA $04E0,y                               ; $1DA7C2 |
  LDA #$68                                  ; $1DA7C5 |
  JSR code_1FF846                           ; $1DA7C7 |
code_1DA7CA:
  RTS                                       ; $1DA7CA |

  LDA $0300,x                               ; $1DA7CB |
  AND #$0F                                  ; $1DA7CE |
  BNE code_1DA7EB                           ; $1DA7D0 |
  LDY #$02                                  ; $1DA7D2 |
code_1DA7D4:
  LDA $A8BD,y                               ; $1DA7D4 |
  STA $060D,y                               ; $1DA7D7 |
  STA $062D,y                               ; $1DA7DA |
  DEY                                       ; $1DA7DD |
  BPL code_1DA7D4                           ; $1DA7DE |
  STY $18                                   ; $1DA7E0 |
  INC $0300,x                               ; $1DA7E2 |
  JSR code_1DA82E                           ; $1DA7E5 |
  STA $0500,x                               ; $1DA7E8 |
code_1DA7EB:
  LDA $03C0,x                               ; $1DA7EB |
  PHA                                       ; $1DA7EE |
  SEC                                       ; $1DA7EF |
  SBC #$10                                  ; $1DA7F0 |
  STA $03C0,x                               ; $1DA7F2 |
  LDA #$00                                  ; $1DA7F5 |
  STA $0480,x                               ; $1DA7F7 |
  LDA $05C0,x                               ; $1DA7FA |
  PHA                                       ; $1DA7FD |
  JSR $8003                                 ; $1DA7FE |
  PLA                                       ; $1DA801 |
  STA $05C0,x                               ; $1DA802 |
  PLA                                       ; $1DA805 |
  STA $03C0,x                               ; $1DA806 |
  LDA $04E0,x                               ; $1DA809 |
  BNE code_1DA81A                           ; $1DA80C |
  STA $0520,x                               ; $1DA80E |
  STA $0540,x                               ; $1DA811 |
  LDA #$63                                  ; $1DA814 |
  STA $0320,x                               ; $1DA816 |
  RTS                                       ; $1DA819 |

code_1DA81A:
  LDA #$98                                  ; $1DA81A |
  STA $0480,x                               ; $1DA81C |
  DEC $0500,x                               ; $1DA81F |
  BNE code_1DA82D                           ; $1DA822 |
  JSR code_1DA8EC                           ; $1DA824 |
  JSR code_1DA82E                           ; $1DA827 |
  STA $0500,x                               ; $1DA82A |
code_1DA82D:
  RTS                                       ; $1DA82D |

code_1DA82E:
  LDA $E4                                   ; $1DA82E |
  ADC $E5                                   ; $1DA830 |
  STA $E5                                   ; $1DA832 |
  AND #$03                                  ; $1DA834 |
  TAY                                       ; $1DA836 |
  LDA $A83B,y                               ; $1DA837 |
  RTS                                       ; $1DA83A |

  db $3C, $1E, $78, $3C                     ; $1DA83B |

  LDA $0520,x                               ; $1DA83F |
  BNE code_1DA8B8                           ; $1DA842 |
  LDA #$0A                                  ; $1DA844 |
  STA $0520,x                               ; $1DA846 |
  JSR find_enemy_freeslot_y                 ; $1DA849 |
  BCS code_1DA8BB                           ; $1DA84C |
  LDA #$27                                  ; $1DA84E |
  JSR code_1FF89A                           ; $1DA850 |
  LDA #$71                                  ; $1DA853 |
  JSR code_1FF846                           ; $1DA855 |
  LDA #$19                                  ; $1DA858 |
  STA $0320,y                               ; $1DA85A |
  LDA #$00                                  ; $1DA85D |
  STA $0480,y                               ; $1DA85F |
  STA $0500,y                               ; $1DA862 |
  LDA $0380,x                               ; $1DA865 |
  STA $0380,y                               ; $1DA868 |
  STX $00                                   ; $1DA86B |
  LDA $03C0,x                               ; $1DA86D |
  STA $01                                   ; $1DA870 |
  LDA $0360,x                               ; $1DA872 |
  STA $02                                   ; $1DA875 |
  LDA $0540,x                               ; $1DA877 |
  PHA                                       ; $1DA87A |
  TAX                                       ; $1DA87B |
  LDA $01                                   ; $1DA87C |
  CLC                                       ; $1DA87E |
  ADC $A8DC,x                               ; $1DA87F |
  STA $03C0,y                               ; $1DA882 |
  LDA $02                                   ; $1DA885 |
  CLC                                       ; $1DA887 |
  ADC $A8E4,x                               ; $1DA888 |
  STA $0360,y                               ; $1DA88B |
  PLA                                       ; $1DA88E |
  ASL                                       ; $1DA88F |
  ASL                                       ; $1DA890 |
  TAX                                       ; $1DA891 |
  LDY #$00                                  ; $1DA892 |
code_1DA894:
  LDA $A8BC,x                               ; $1DA894 |
  STA $060C,y                               ; $1DA897 |
  STA $062C,y                               ; $1DA89A |
  INX                                       ; $1DA89D |
  INY                                       ; $1DA89E |
  CPY #$04                                  ; $1DA89F |
  BNE code_1DA894                           ; $1DA8A1 |
  LDA #$FF                                  ; $1DA8A3 |
  STA $18                                   ; $1DA8A5 |
  LDX $00                                   ; $1DA8A7 |
  INC $0540,x                               ; $1DA8A9 |
  LDA $0540,x                               ; $1DA8AC |
  AND #$03                                  ; $1DA8AF |
  BNE code_1DA8BB                           ; $1DA8B1 |
  LDA #$00                                  ; $1DA8B3 |
  STA $0300,x                               ; $1DA8B5 |
code_1DA8B8:
  DEC $0520,x                               ; $1DA8B8 |
code_1DA8BB:
  RTS                                       ; $1DA8BB |

  db $0F, $20, $10, $17, $0F, $10, $00, $17 ; $1DA8BC |
  db $0F, $00, $0F, $07, $0F, $0F, $0F, $0F ; $1DA8C4 |
  db $0F, $20, $37, $17, $0F, $10, $27, $07 ; $1DA8CC |
  db $0F, $0F, $17, $0F, $0F, $0F, $0F, $0F ; $1DA8D4 |
  db $F0, $10, $10, $D0, $F0, $10, $10, $D0 ; $1DA8DC |
  db $F0, $20, $E8, $10, $F0, $20, $E8, $10 ; $1DA8E4 |

code_1DA8EC:
  JSR find_enemy_freeslot_y                 ; $1DA8EC |
  BCS code_1DA93A                           ; $1DA8EF |
  STY $00                                   ; $1DA8F1 |
  LDA $04A0,x                               ; $1DA8F3 |
  STA $04A0,y                               ; $1DA8F6 |
  AND #$02                                  ; $1DA8F9 |
  TAY                                       ; $1DA8FB |
  LDA $0360,x                               ; $1DA8FC |
  CLC                                       ; $1DA8FF |
  ADC $A93B,y                               ; $1DA900 |
  PHA                                       ; $1DA903 |
  LDA $0380,x                               ; $1DA904 |
  ADC $A93C,y                               ; $1DA907 |
  LDY $00                                   ; $1DA90A |
  STA $0380,y                               ; $1DA90C |
  PLA                                       ; $1DA90F |
  STA $0360,y                               ; $1DA910 |
  LDA $03C0,x                               ; $1DA913 |
  CLC                                       ; $1DA916 |
  ADC #$1C                                  ; $1DA917 |
  STA $03C0,y                               ; $1DA919 |
  LDA #$80                                  ; $1DA91C |
  STA $0400,y                               ; $1DA91E |
  LDA #$02                                  ; $1DA921 |
  STA $0420,y                               ; $1DA923 |
  LDA #$93                                  ; $1DA926 |
  JSR code_1FF846                           ; $1DA928 |
  LDA #$46                                  ; $1DA92B |
  STA $0320,y                               ; $1DA92D |
  LDA #$C0                                  ; $1DA930 |
  STA $0480,y                               ; $1DA932 |
  LDA #$01                                  ; $1DA935 |
  STA $04E0,y                               ; $1DA937 |
code_1DA93A:
  RTS                                       ; $1DA93A |

  db $F8, $FF, $F8, $FF                     ; $1DA93B |

  LDA $04A0,x                               ; $1DA93F |
  AND #$01                                  ; $1DA942 |
  BEQ code_1DA94E                           ; $1DA944 |
  LDA #$08                                  ; $1DA946 |
  JSR code_1FF580                           ; $1DA948 |
  JMP code_1DA953                           ; $1DA94B |

code_1DA94E:
  LDY #$09                                  ; $1DA94E |
  JSR code_1FF5C4                           ; $1DA950 |
code_1DA953:
  BCC code_1DA95F                           ; $1DA953 |
  LDA #$71                                  ; $1DA955 |
  JSR reset_sprite_anim                     ; $1DA957 |
  LDA #$00                                  ; $1DA95A |
  STA $0320,x                               ; $1DA95C |
code_1DA95F:
  RTS                                       ; $1DA95F |

  LDA $05E0,x                               ; $1DA960 |
  CMP #$02                                  ; $1DA963 |
  BNE code_1DA95F                           ; $1DA965 |
  LDA $0500,x                               ; $1DA967 |
  CMP #$08                                  ; $1DA96A |
  BEQ code_1DA95F                           ; $1DA96C |
  STX $00                                   ; $1DA96E |
  LDY $0360,x                               ; $1DA970 |
  STY $02                                   ; $1DA973 |
  LDY $0380,x                               ; $1DA975 |
  STY $03                                   ; $1DA978 |
  LDY $03C0,x                               ; $1DA97A |
  STY $04                                   ; $1DA97D |
  LDY $05C0,x                               ; $1DA97F |
  STY $10                                   ; $1DA982 |
  LDA $0320,x                               ; $1DA984 |
  STA $11                                   ; $1DA987 |
  LDA $0500,x                               ; $1DA989 |
  TAX                                       ; $1DA98C |
code_1DA98D:
  JSR find_enemy_freeslot_y                 ; $1DA98D |
  BCS code_1DA9F7                           ; $1DA990 |
  LDA $10                                   ; $1DA992 |
  JSR code_1FF846                           ; $1DA994 |
  LDA $11                                   ; $1DA997 |
  CMP #$56                                  ; $1DA999 |
  BEQ code_1DA9B3                           ; $1DA99B |
  CMP #$48                                  ; $1DA99D |
  BEQ code_1DA9B3                           ; $1DA99F |
  CMP #$39                                  ; $1DA9A1 |
  BEQ code_1DA9BF                           ; $1DA9A3 |
  CMP #$48                                  ; $1DA9A5 |
  BEQ code_1DA9BF                           ; $1DA9A7 |
  LDA #$00                                  ; $1DA9A9 |
  STA $0480,y                               ; $1DA9AB |
  STA $0320,y                               ; $1DA9AE |
  BEQ code_1DA9C9                           ; $1DA9B1 |
code_1DA9B3:
  LDA #$80                                  ; $1DA9B3 |
  STA $0480,y                               ; $1DA9B5 |
  LDA #$54                                  ; $1DA9B8 |
  STA $0320,y                               ; $1DA9BA |
  BNE code_1DA9C9                           ; $1DA9BD |
code_1DA9BF:
  LDA #$80                                  ; $1DA9BF |
  STA $0480,y                               ; $1DA9C1 |
  LDA #$55                                  ; $1DA9C4 |
  STA $0320,y                               ; $1DA9C6 |
code_1DA9C9:
  LDA #$00                                  ; $1DA9C9 |
  STA $01                                   ; $1DA9CB |
  LDA $A9FA,x                               ; $1DA9CD |
  BPL code_1DA9D4                           ; $1DA9D0 |
  DEC $01                                   ; $1DA9D2 |
code_1DA9D4:
  CLC                                       ; $1DA9D4 |
  ADC $02                                   ; $1DA9D5 |
  STA $0360,y                               ; $1DA9D7 |
  LDA $03                                   ; $1DA9DA |
  ADC $01                                   ; $1DA9DC |
  STA $0380,y                               ; $1DA9DE |
  LDA $04                                   ; $1DA9E1 |
  CLC                                       ; $1DA9E3 |
  ADC $AA02,x                               ; $1DA9E4 |
  STA $03C0,y                               ; $1DA9E7 |
  LDX $00                                   ; $1DA9EA |
  INC $0500,x                               ; $1DA9EC |
  LDA $0500,x                               ; $1DA9EF |
  TAX                                       ; $1DA9F2 |
  AND #$01                                  ; $1DA9F3 |
  BNE code_1DA98D                           ; $1DA9F5 |
code_1DA9F7:
  LDX $00                                   ; $1DA9F7 |
  RTS                                       ; $1DA9F9 |

  db $0C, $F4, $F0, $10, $F4, $0C, $00, $00 ; $1DA9FA |
  db $F4, $0C, $00, $00, $F4, $0C, $F0, $10 ; $1DAA02 |

  LDA $0300,x                               ; $1DAA0A |
  AND #$0F                                  ; $1DAA0D |
  BNE code_1DAA2C                           ; $1DAA0F |
  LDA #$44                                  ; $1DAA11 |
  STA $0440,x                               ; $1DAA13 |
  LDA #$03                                  ; $1DAA16 |
  STA $0460,x                               ; $1DAA18 |
  LDA #$1E                                  ; $1DAA1B |
  STA $0500,x                               ; $1DAA1D |
  JSR code_1FF883                           ; $1DAA20 |
  JSR code_1DA82E                           ; $1DAA23 |
  STA $0520,x                               ; $1DAA26 |
  INC $0300,x                               ; $1DAA29 |
code_1DAA2C:
  DEC $0520,x                               ; $1DAA2C |
  BNE code_1DAA3A                           ; $1DAA2F |
  JSR code_1DAA9A                           ; $1DAA31 |
  JSR code_1DA82E                           ; $1DAA34 |
  STA $0520,x                               ; $1DAA37 |
code_1DAA3A:
  LDA $0300,x                               ; $1DAA3A |
  AND #$02                                  ; $1DAA3D |
  BNE code_1DAA72                           ; $1DAA3F |
  LDA $04A0,x                               ; $1DAA41 |
  AND #$01                                  ; $1DAA44 |
  BEQ code_1DAA50                           ; $1DAA46 |
  LDY #$0A                                  ; $1DAA48 |
  JSR code_1FF580                           ; $1DAA4A |
  JMP code_1DAA55                           ; $1DAA4D |

code_1DAA50:
  LDY #$0B                                  ; $1DAA50 |
  JSR code_1FF5C4                           ; $1DAA52 |
code_1DAA55:
  LDY #$20                                  ; $1DAA55 |
  JSR code_1FF67C                           ; $1DAA57 |
  BCC code_1DAA6D                           ; $1DAA5A |
  LDA #$44                                  ; $1DAA5C |
  STA $0440,x                               ; $1DAA5E |
  LDA #$03                                  ; $1DAA61 |
  STA $0460,x                               ; $1DAA63 |
  INC $0300,x                               ; $1DAA66 |
  LDA #$3D                                  ; $1DAA69 |
  BNE code_1DAA6F                           ; $1DAA6B |
code_1DAA6D:
  LDA #$3C                                  ; $1DAA6D |
code_1DAA6F:
  JMP reset_sprite_anim                     ; $1DAA6F |

code_1DAA72:
  LDA $05C0,x                               ; $1DAA72 |
  CMP #$3B                                  ; $1DAA75 |
  BEQ code_1DAA86                           ; $1DAA77 |
  LDA $05E0,x                               ; $1DAA79 |
  ORA $05A0,x                               ; $1DAA7C |
  BNE code_1DAA99                           ; $1DAA7F |
  LDA #$3B                                  ; $1DAA81 |
  JSR reset_sprite_anim                     ; $1DAA83 |
code_1DAA86:
  DEC $0500,x                               ; $1DAA86 |
  BNE code_1DAA99                           ; $1DAA89 |
  JSR face_player                           ; $1DAA8B |
  JSR code_1FF883                           ; $1DAA8E |
  DEC $0300,x                               ; $1DAA91 |
  LDA #$3C                                  ; $1DAA94 |
  STA $0500,x                               ; $1DAA96 |
code_1DAA99:
  RTS                                       ; $1DAA99 |

code_1DAA9A:
  JSR find_enemy_freeslot_y                 ; $1DAA9A |
  BCS code_1DAADB                           ; $1DAA9D |
  STY $00                                   ; $1DAA9F |
  LDA $04A0,x                               ; $1DAAA1 |
  STA $04A0,y                               ; $1DAAA4 |
  AND #$02                                  ; $1DAAA7 |
  TAY                                       ; $1DAAA9 |
  LDA $0360,x                               ; $1DAAAA |
  CLC                                       ; $1DAAAD |
  ADC $AADC,y                               ; $1DAAAE |
  PHA                                       ; $1DAAB1 |
  LDA $0380,x                               ; $1DAAB2 |
  ADC $AADD,y                               ; $1DAAB5 |
  LDY $00                                   ; $1DAAB8 |
  STA $0380,y                               ; $1DAABA |
  PLA                                       ; $1DAABD |
  STA $0360,y                               ; $1DAABE |
  LDA $03C0,x                               ; $1DAAC1 |
  STA $03C0,y                               ; $1DAAC4 |
  LDA #$01                                  ; $1DAAC7 |
  STA $04E0,y                               ; $1DAAC9 |
  LDA #$3E                                  ; $1DAACC |
  JSR code_1FF846                           ; $1DAACE |
  LDA #$1D                                  ; $1DAAD1 |
  STA $0320,y                               ; $1DAAD3 |
  LDA #$C0                                  ; $1DAAD6 |
  STA $0480,y                               ; $1DAAD8 |
code_1DAADB:
  RTS                                       ; $1DAADB |

  db $08, $00, $F8, $FF                     ; $1DAADC |

  LDA $0300,x                               ; $1DAAE0 |
  AND #$0F                                  ; $1DAAE3 |
  BNE code_1DAAF2                           ; $1DAAE5 |
  STA $0500,x                               ; $1DAAE7 |
  LDA #$1E                                  ; $1DAAEA |
  STA $0520,x                               ; $1DAAEC |
  INC $0300,x                               ; $1DAAEF |
code_1DAAF2:
  LDA $0300,x                               ; $1DAAF2 |
  AND #$02                                  ; $1DAAF5 |
  BNE code_1DAB3A                           ; $1DAAF7 |
  LDA $04A0,x                               ; $1DAAF9 |
  AND #$01                                  ; $1DAAFC |
  BEQ code_1DAB06                           ; $1DAAFE |
  JSR code_1FF71D                           ; $1DAB00 |
  JMP code_1DAB09                           ; $1DAB03 |

code_1DAB06:
  JSR code_1FF73B                           ; $1DAB06 |
code_1DAB09:
  LDY #$08                                  ; $1DAB09 |
  JSR code_1FF67C                           ; $1DAB0B |
  BCC code_1DAB39                           ; $1DAB0E |
  LDA $0500,x                               ; $1DAB10 |
  TAY                                       ; $1DAB13 |
  LDA $AB4F,y                               ; $1DAB14 |
  STA $0440,x                               ; $1DAB17 |
  LDA $AB52,y                               ; $1DAB1A |
  STA $0460,x                               ; $1DAB1D |
  LDA $AB55,y                               ; $1DAB20 |
  STA $0400,x                               ; $1DAB23 |
  LDA $AB58,y                               ; $1DAB26 |
  STA $0420,x                               ; $1DAB29 |
  INC $0500,x                               ; $1DAB2C |
  LDA $0500,x                               ; $1DAB2F |
  CMP #$03                                  ; $1DAB32 |
  BCC code_1DAB39                           ; $1DAB34 |
  INC $0300,x                               ; $1DAB36 |
code_1DAB39:
  RTS                                       ; $1DAB39 |

code_1DAB3A:
  DEC $0520,x                               ; $1DAB3A |
  BNE code_1DAB3A                           ; $1DAB3D |
  LDA #$71                                  ; $1DAB3F |
  JSR reset_sprite_anim                     ; $1DAB41 |
  LDA #$00                                  ; $1DAB44 |
  STA $0500,x                               ; $1DAB46 |
  LDA #$39                                  ; $1DAB49 |
  STA $0320,x                               ; $1DAB4B |
  RTS                                       ; $1DAB4E |

  db $9E, $44, $4F, $04, $03, $02, $00, $00 ; $1DAB4F |
  db $80, $01, $01, $00                     ; $1DAB57 |

  LDA $05C0,x                               ; $1DAB5B |
  CMP #$2F                                  ; $1DAB5E |
  BNE code_1DAB65                           ; $1DAB60 |
  JMP code_1DABEA                           ; $1DAB62 |

code_1DAB65:
  LDA $0300,x                               ; $1DAB65 |
  AND #$0F                                  ; $1DAB68 |
  BNE code_1DABC9                           ; $1DAB6A |
  JSR code_1DAC27                           ; $1DAB6C |
  BCS code_1DABE9                           ; $1DAB6F |
  LDA $0580,x                               ; $1DAB71 |
  AND #$FB                                  ; $1DAB74 |
  STA $0580,x                               ; $1DAB76 |
  INC $0300,x                               ; $1DAB79 |
  LDA #$66                                  ; $1DAB7C |
  STA $0440,x                               ; $1DAB7E |
  LDA #$00                                  ; $1DAB81 |
  STA $0460,x                               ; $1DAB83 |
  LDA #$2E                                  ; $1DAB86 |
  JSR code_1FF846                           ; $1DAB88 |
  LDA #$31                                  ; $1DAB8B |
  STA $0320,y                               ; $1DAB8D |
  LDA $03C0,x                               ; $1DAB90 |
  STA $03C0,y                               ; $1DAB93 |
  LDA $FC                                   ; $1DAB96 |
  CLC                                       ; $1DAB98 |
  ADC #$04                                  ; $1DAB99 |
  STA $0360,y                               ; $1DAB9B |
  LDA $F9                                   ; $1DAB9E |
  ADC #$00                                  ; $1DABA0 |
  STA $0380,y                               ; $1DABA2 |
  LDA #$00                                  ; $1DABA5 |
  STA $0400,y                               ; $1DABA7 |
  LDA #$04                                  ; $1DABAA |
  STA $0420,y                               ; $1DABAC |
  LDA $0360,x                               ; $1DABAF |
  SEC                                       ; $1DABB2 |
  SBC #$08                                  ; $1DABB3 |
  STA $0500,y                               ; $1DABB5 |
  LDA $0380,x                               ; $1DABB8 |
  SBC #$00                                  ; $1DABBB |
  STA $0540,y                               ; $1DABBD |
  TXA                                       ; $1DABC0 |
  STA $0520,y                               ; $1DABC1 |
  LDA #$00                                  ; $1DABC4 |
  STA $0480,y                               ; $1DABC6 |
code_1DABC9:
  LDA $0580,x                               ; $1DABC9 |
  AND #$FB                                  ; $1DABCC |
  STA $0580,x                               ; $1DABCE |
  LDA $0500,x                               ; $1DABD1 |
  BNE code_1DABE9                           ; $1DABD4 |
  LDA #$00                                  ; $1DABD6 |
  STA $05E0,x                               ; $1DABD8 |
  LDA $92                                   ; $1DABDB |
  AND #$04                                  ; $1DABDD |
  BEQ code_1DABE9                           ; $1DABDF |
  LDA $0580,x                               ; $1DABE1 |
  ORA #$04                                  ; $1DABE4 |
  STA $0580,x                               ; $1DABE6 |
code_1DABE9:
  RTS                                       ; $1DABE9 |

code_1DABEA:
  LDA $0360                                 ; $1DABEA |
  SEC                                       ; $1DABED |
  SBC $0360,x                               ; $1DABEE |
  PHA                                       ; $1DABF1 |
  LDA $0380                                 ; $1DABF2 |
  SBC $0380,x                               ; $1DABF5 |
  PLA                                       ; $1DABF8 |
  BEQ code_1DAC16                           ; $1DABF9 |
  BCC code_1DAC0B                           ; $1DABFB |
  JSR code_1FF71D                           ; $1DABFD |
  LDA $0580,x                               ; $1DAC00 |
  ORA #$40                                  ; $1DAC03 |
  STA $0580,x                               ; $1DAC05 |
  JMP code_1DAC16                           ; $1DAC08 |

code_1DAC0B:
  JSR code_1FF73B                           ; $1DAC0B |
  LDA $0580,x                               ; $1DAC0E |
  AND #$BF                                  ; $1DAC11 |
  STA $0580,x                               ; $1DAC13 |
code_1DAC16:
  LDA $03C0                                 ; $1DAC16 |
  SEC                                       ; $1DAC19 |
  SBC $03C0,x                               ; $1DAC1A |
  BEQ code_1DABE9                           ; $1DAC1D |
  BCS code_1DAC24                           ; $1DAC1F |
  JMP code_1FF779                           ; $1DAC21 |

code_1DAC24:
  JMP code_1FF759                           ; $1DAC24 |

code_1DAC27:
  JSR code_1FF8C2                           ; $1DAC27 |
  CMP #$44                                  ; $1DAC2A |
  BCS code_1DAC7E                           ; $1DAC2C |
  LDA $0360,x                               ; $1DAC2E |
  SEC                                       ; $1DAC31 |
  SBC $FC                                   ; $1DAC32 |
  STA $00                                   ; $1DAC34 |
  LDA $0380,x                               ; $1DAC36 |
  SBC $F9                                   ; $1DAC39 |
  BCC code_1DAC79                           ; $1DAC3B |
  LDA $00                                   ; $1DAC3D |
  CMP #$80                                  ; $1DAC3F |
  BCC code_1DAC79                           ; $1DAC41 |
  LDA #$00                                  ; $1DAC43 |
  STA $01                                   ; $1DAC45 |
  STX $00                                   ; $1DAC47 |
  LDY #$1F                                  ; $1DAC49 |
code_1DAC4B:
  CPY $00                                   ; $1DAC4B |
  BEQ code_1DAC62                           ; $1DAC4D |
  LDA $0300,y                               ; $1DAC4F |
  BPL code_1DAC62                           ; $1DAC52 |
  LDA $0580,y                               ; $1DAC54 |
  BPL code_1DAC62                           ; $1DAC57 |
  LDA $0320,y                               ; $1DAC59 |
  CMP #$30                                  ; $1DAC5C |
  BNE code_1DAC62                           ; $1DAC5E |
  INC $01                                   ; $1DAC60 |
code_1DAC62:
  DEY                                       ; $1DAC62 |
  CPY #$0F                                  ; $1DAC63 |
  BNE code_1DAC4B                           ; $1DAC65 |
  LDA $01                                   ; $1DAC67 |
  CMP #$03                                  ; $1DAC69 |
  BEQ code_1DAC79                           ; $1DAC6B |
  LDY $00                                   ; $1DAC6D |
code_1DAC6F:
  LDA $0300,y                               ; $1DAC6F |
  BPL code_1DAC80                           ; $1DAC72 |
  DEY                                       ; $1DAC74 |
  CPY #$0F                                  ; $1DAC75 |
  BNE code_1DAC6F                           ; $1DAC77 |
code_1DAC79:
  LDA #$00                                  ; $1DAC79 |
  STA $0300,x                               ; $1DAC7B |
code_1DAC7E:
  SEC                                       ; $1DAC7E |
  RTS                                       ; $1DAC7F |

code_1DAC80:
  CLC                                       ; $1DAC80 |
  RTS                                       ; $1DAC81 |

  LDA $0300,x                               ; $1DAC82 |
  AND #$0F                                  ; $1DAC85 |
  BNE code_1DACBE                           ; $1DAC87 |
  STA $0560,x                               ; $1DAC89 |
  JSR code_1FF71D                           ; $1DAC8C |
  LDA $0500,x                               ; $1DAC8F |
  SEC                                       ; $1DAC92 |
  SBC $0360,x                               ; $1DAC93 |
  LDA $0540,x                               ; $1DAC96 |
  SBC $0380,x                               ; $1DAC99 |
  BCS code_1DACB8                           ; $1DAC9C |
  LDA $0500,x                               ; $1DAC9E |
  STA $0360,x                               ; $1DACA1 |
  LDA $0540,x                               ; $1DACA4 |
  STA $0380,x                               ; $1DACA7 |
  INC $0300,x                               ; $1DACAA |
  LDY $0520,x                               ; $1DACAD |
  LDA #$08                                  ; $1DACB0 |
  STA $0500,y                               ; $1DACB2 |
  STA $0500,x                               ; $1DACB5 |
code_1DACB8:
  LDA #$00                                  ; $1DACB8 |
  STA $05E0,x                               ; $1DACBA |
  RTS                                       ; $1DACBD |

code_1DACBE:
  LDA $0560,x                               ; $1DACBE |
  BNE code_1DACCB                           ; $1DACC1 |
  LDA #$25                                  ; $1DACC3 |
  JSR code_1FF89A                           ; $1DACC5 |
  INC $0560,x                               ; $1DACC8 |
code_1DACCB:
  LDA #$01                                  ; $1DACCB |
  STA $95                                   ; $1DACCD |
  LDA $0500,x                               ; $1DACCF |
  BEQ code_1DACE0                           ; $1DACD2 |
  LDA $05E0,x                               ; $1DACD4 |
  BNE code_1DAD08                           ; $1DACD7 |
  DEC $0500,x                               ; $1DACD9 |
  INC $0360,x                               ; $1DACDC |
  RTS                                       ; $1DACDF |

code_1DACE0:
  LDA $05A0,x                               ; $1DACE0 |
  BNE code_1DAD08                           ; $1DACE3 |
  STA $05E0,x                               ; $1DACE5 |
  LDY $0520,x                               ; $1DACE8 |
  LDA $05A0,y                               ; $1DACEB |
  BNE code_1DAD08                           ; $1DACEE |
  STA $05E0,y                               ; $1DACF0 |
  STA $0500,y                               ; $1DACF3 |
  STA $0300,x                               ; $1DACF6 |
  LDA #$2F                                  ; $1DACF9 |
  STA $05C0,y                               ; $1DACFB |
  LDA #$C0                                  ; $1DACFE |
  STA $0480,y                               ; $1DAD00 |
  LDA #$01                                  ; $1DAD03 |
  STA $04E0,y                               ; $1DAD05 |
code_1DAD08:
  RTS                                       ; $1DAD08 |

; bee carrier dudes
main_have_su_bee:
  LDA $0300,x                               ; $1DAD09 |
  AND #$0F                                  ; $1DAD0C |
  BNE code_1DAD4B                           ; $1DAD0E |
  JSR code_1FF8C2                           ; $1DAD10 |
  CMP #$28                                  ; $1DAD13 |
  BCS code_1DAD4A                           ; $1DAD15 |
  INC $0300,x                               ; $1DAD17 |
  LDA #$1E                                  ; $1DAD1A |
  STA $0500,x                               ; $1DAD1C |
  LDA #$30                                  ; $1DAD1F |
  STA $0540,x                               ; $1DAD21 |
  LDA $0580,x                               ; $1DAD24 |
  EOR #$04                                  ; $1DAD27 |
  STA $0580,x                               ; $1DAD29 |
  LDA $04A0,x                               ; $1DAD2C |
  AND #$02                                  ; $1DAD2F |
  TAY                                       ; $1DAD31 |
  LDA $0360,x                               ; $1DAD32 |
  CLC                                       ; $1DAD35 |
  ADC $ADD5,y                               ; $1DAD36 |
  PHA                                       ; $1DAD39 |
  LDA $0380,x                               ; $1DAD3A |
  ADC $ADD6,y                               ; $1DAD3D |
  STA $0380,x                               ; $1DAD40 |
  PLA                                       ; $1DAD43 |
  STA $0360,x                               ; $1DAD44 |
  JSR face_player                           ; $1DAD47 |
code_1DAD4A:
  RTS                                       ; $1DAD4A |

code_1DAD4B:
  LDA $0300,x                               ; $1DAD4B |
  AND #$02                                  ; $1DAD4E |
  BNE code_1DAD9A                           ; $1DAD50 |
  JSR code_1FF883                           ; $1DAD52 |
  LDA $04A0,x                               ; $1DAD55 |
  AND #$01                                  ; $1DAD58 |
  BEQ code_1DAD62                           ; $1DAD5A |
  JSR code_1FF71D                           ; $1DAD5C |
  JMP code_1DAD65                           ; $1DAD5F |

code_1DAD62:
  JSR code_1FF73B                           ; $1DAD62 |
code_1DAD65:
  LDA $0520,x                               ; $1DAD65 |
  BNE code_1DAD99                           ; $1DAD68 |
  JSR code_1FF8C2                           ; $1DAD6A |
  CMP #$50                                  ; $1DAD6D |
  BCC code_1DAD99                           ; $1DAD6F |
  INC $0300,x                               ; $1DAD71 |
  INC $0520,x                               ; $1DAD74 |
  LDA #$80                                  ; $1DAD77 |
  STA $0440,x                               ; $1DAD79 |
  LDA #$00                                  ; $1DAD7C |
  STA $0460,x                               ; $1DAD7E |
  LDA $04A0,x                               ; $1DAD81 |
  AND #$01                                  ; $1DAD84 |
  BEQ code_1DAD91                           ; $1DAD86 |
  LDA $0580,x                               ; $1DAD88 |
  AND #$BF                                  ; $1DAD8B |
  STA $0580,x                               ; $1DAD8D |
  RTS                                       ; $1DAD90 |

code_1DAD91:
  LDA $0580,x                               ; $1DAD91 |
  ORA #$40                                  ; $1DAD94 |
  STA $0580,x                               ; $1DAD96 |
code_1DAD99:
  RTS                                       ; $1DAD99 |

code_1DAD9A:
  DEC $0540,x                               ; $1DAD9A |
  BNE code_1DADB2                           ; $1DAD9D |
  DEC $0300,x                               ; $1DAD9F |
  LDA $04A0,x                               ; $1DADA2 |
  EOR #$03                                  ; $1DADA5 |
  STA $04A0,x                               ; $1DADA7 |
  LDA #$3A                                  ; $1DADAA |
  JSR reset_sprite_anim                     ; $1DADAC |
  JMP code_1DADD9                           ; $1DADAF |

code_1DADB2:
  LDA $04A0,x                               ; $1DADB2 |
  AND #$01                                  ; $1DADB5 |
  BEQ code_1DADBF                           ; $1DADB7 |
  JSR code_1FF779                           ; $1DADB9 |
  JMP code_1DADC2                           ; $1DADBC |

code_1DADBF:
  JSR code_1FF759                           ; $1DADBF |
code_1DADC2:
  DEC $0500,x                               ; $1DADC2 |
  BNE code_1DAD99                           ; $1DADC5 |
  LDA #$3C                                  ; $1DADC7 |
  STA $0500,x                               ; $1DADC9 |
  LDA $04A0,x                               ; $1DADCC |
  EOR #$03                                  ; $1DADCF |
  STA $04A0,x                               ; $1DADD1 |
  RTS                                       ; $1DADD4 |

  db $50, $00, $B0, $FF                     ; $1DADD5 |

code_1DADD9:
  JSR find_enemy_freeslot_y                 ; $1DADD9 |
  BCS code_1DAE27                           ; $1DADDC |
  STY $01                                   ; $1DADDE |
  LDA $04A0,x                               ; $1DADE0 |
  STA $04A0,y                               ; $1DADE3 |
  AND #$02                                  ; $1DADE6 |
  TAY                                       ; $1DADE8 |
  LDA $0360,x                               ; $1DADE9 |
  CLC                                       ; $1DADEC |
  ADC $A731,y                               ; $1DADED |
  PHA                                       ; $1DADF0 |
  LDA $0380,x                               ; $1DADF1 |
  ADC $A732,y                               ; $1DADF4 |
  LDY $01                                   ; $1DADF7 |
  STA $0380,y                               ; $1DADF9 |
  PLA                                       ; $1DADFC |
  STA $0360,y                               ; $1DADFD |
  LDA $03C0,x                               ; $1DAE00 |
  CLC                                       ; $1DAE03 |
  ADC #$18                                  ; $1DAE04 |
  STA $03C0,y                               ; $1DAE06 |
  LDA #$35                                  ; $1DAE09 |
  JSR code_1FF846                           ; $1DAE0B |
  LDA #$2F                                  ; $1DAE0E |
  STA $0320,y                               ; $1DAE10 |
  LDA #$CF                                  ; $1DAE13 |
  STA $0480,y                               ; $1DAE15 |
  LDA #$01                                  ; $1DAE18 |
  STA $04E0,y                               ; $1DAE1A |
  LDA #$50                                  ; $1DAE1D |
  STA $0440,y                               ; $1DAE1F |
  LDA #$04                                  ; $1DAE22 |
  STA $0460,y                               ; $1DAE24 |
code_1DAE27:
  RTS                                       ; $1DAE27 |

  LDY #$08                                  ; $1DAE28 |
  JSR code_1FF606                           ; $1DAE2A |
  BCC code_1DAE27                           ; $1DAE2D |
  LDA #$71                                  ; $1DAE2F |
  JSR reset_sprite_anim                     ; $1DAE31 |
  LDA #$00                                  ; $1DAE34 |
  STA $0500,x                               ; $1DAE36 |
  LDA #$3A                                  ; $1DAE39 |
  STA $0320,x                               ; $1DAE3B |
  LDA #$00                                  ; $1DAE3E |
  STA $01                                   ; $1DAE40 |
code_1DAE42:
  JSR find_enemy_freeslot_y                 ; $1DAE42 |
  BCS code_1DAEB3                           ; $1DAE45 |
  STY $00                                   ; $1DAE47 |
  LDA $04A0,x                               ; $1DAE49 |
  STA $04A0,y                               ; $1DAE4C |
  LDA $01                                   ; $1DAE4F |
  ASL                                       ; $1DAE51 |
  TAY                                       ; $1DAE52 |
  LDA $0360,x                               ; $1DAE53 |
  CLC                                       ; $1DAE56 |
  ADC $AEB4,y                               ; $1DAE57 |
  PHA                                       ; $1DAE5A |
  LDA $0380,x                               ; $1DAE5B |
  ADC $AEB5,y                               ; $1DAE5E |
  LDY $00                                   ; $1DAE61 |
  STA $0380,y                               ; $1DAE63 |
  PLA                                       ; $1DAE66 |
  STA $0360,y                               ; $1DAE67 |
  LDY $01                                   ; $1DAE6A |
  LDA $03C0,x                               ; $1DAE6C |
  CLC                                       ; $1DAE6F |
  ADC $AEBE,y                               ; $1DAE70 |
  LDY $00                                   ; $1DAE73 |
  STA $03C0,y                               ; $1DAE75 |
  LDA #$41                                  ; $1DAE78 |
  JSR code_1FF846                           ; $1DAE7A |
  LDA #$00                                  ; $1DAE7D |
  STA $0400,y                               ; $1DAE7F |
  STA $0420,y                               ; $1DAE82 |
  LDA #$C0                                  ; $1DAE85 |
  STA $0480,y                               ; $1DAE87 |
  LDA #$01                                  ; $1DAE8A |
  STA $04E0,y                               ; $1DAE8C |
  LDA #$3B                                  ; $1DAE8F |
  STA $0320,y                               ; $1DAE91 |
  LDA #$08                                  ; $1DAE94 |
  STA $0500,y                               ; $1DAE96 |
  STA $0520,y                               ; $1DAE99 |
  LDA #$10                                  ; $1DAE9C |
  STA $0540,y                               ; $1DAE9E |
  LDA #$33                                  ; $1DAEA1 |
  STA $0440,y                               ; $1DAEA3 |
  LDA #$01                                  ; $1DAEA6 |
  STA $0460,y                               ; $1DAEA8 |
  INC $01                                   ; $1DAEAB |
  LDA $01                                   ; $1DAEAD |
  CMP #$05                                  ; $1DAEAF |
  BCC code_1DAE42                           ; $1DAEB1 |
code_1DAEB3:
  RTS                                       ; $1DAEB3 |

  db $E8, $FF, $E8, $FF, $01, $00, $18, $00 ; $1DAEB4 |
  db $18, $00, $E8, $18, $01, $E8, $18      ; $1DAEBC |

  LDA $0300,x                               ; $1DAEC3 |
  AND #$0F                                  ; $1DAEC6 |
  BNE code_1DAEDF                           ; $1DAEC8 |
  INC $0300,x                               ; $1DAECA |
  LDA #$3C                                  ; $1DAECD |
  STA $0440,x                               ; $1DAECF |
  LDA #$09                                  ; $1DAED2 |
  STA $0460,x                               ; $1DAED4 |
  LDA #$1E                                  ; $1DAED7 |
  STA $0500,x                               ; $1DAED9 |
  JSR code_1FF883                           ; $1DAEDC |
code_1DAEDF:
  LDA $0300,x                               ; $1DAEDF |
  AND #$0F                                  ; $1DAEE2 |
  CMP #$02                                  ; $1DAEE4 |
  BEQ code_1DAF3F                           ; $1DAEE6 |
  CMP #$03                                  ; $1DAEE8 |
  BNE code_1DAEEF                           ; $1DAEEA |
  JMP code_1DAFA5                           ; $1DAEEC |

code_1DAEEF:
  LDA $0500,x                               ; $1DAEEF |
  BNE code_1DAF16                           ; $1DAEF2 |
  LDA $05C0,x                               ; $1DAEF4 |
  CMP #$44                                  ; $1DAEF7 |
  BEQ code_1DAF1A                           ; $1DAEF9 |
  LDA $0520,x                               ; $1DAEFB |
  BNE code_1DAF1A                           ; $1DAEFE |
  LDA #$45                                  ; $1DAF00 |
  JSR reset_sprite_anim                     ; $1DAF02 |
  LDY #$15                                  ; $1DAF05 |
  JSR code_1FF67C                           ; $1DAF07 |
  LDA $10                                   ; $1DAF0A |
  AND #$10                                  ; $1DAF0C |
  BEQ code_1DAF19                           ; $1DAF0E |
  LDA #$44                                  ; $1DAF10 |
  JSR reset_sprite_anim                     ; $1DAF12 |
  RTS                                       ; $1DAF15 |

code_1DAF16:
  DEC $0500,x                               ; $1DAF16 |
code_1DAF19:
  RTS                                       ; $1DAF19 |

code_1DAF1A:
  LDA $05C0,x                               ; $1DAF1A |
  CMP #$45                                  ; $1DAF1D |
  BEQ code_1DAF30                           ; $1DAF1F |
  JSR code_1FF8C2                           ; $1DAF21 |
  CMP #$28                                  ; $1DAF24 |
  BCS code_1DAF19                           ; $1DAF26 |
  LDA #$45                                  ; $1DAF28 |
  JSR reset_sprite_anim                     ; $1DAF2A |
  INC $0520,x                               ; $1DAF2D |
code_1DAF30:
  LDY #$15                                  ; $1DAF30 |
  JSR code_1FF67C                           ; $1DAF32 |
  BCC code_1DAF19                           ; $1DAF35 |
  LDA #$43                                  ; $1DAF37 |
  JSR reset_sprite_anim                     ; $1DAF39 |
  INC $0300,x                               ; $1DAF3C |
code_1DAF3F:
  LDA $0540,x                               ; $1DAF3F |
  BNE code_1DAF5C                           ; $1DAF42 |
  LDA $04E0,x                               ; $1DAF44 |
  CMP #$04                                  ; $1DAF47 |
  BNE code_1DAF5C                           ; $1DAF49 |
  INC $0300,x                               ; $1DAF4B |
  LDA #$3C                                  ; $1DAF4E |
  STA $0440,x                               ; $1DAF50 |
  LDA #$09                                  ; $1DAF53 |
  STA $0460,x                               ; $1DAF55 |
  INC $0540,x                               ; $1DAF58 |
  RTS                                       ; $1DAF5B |

code_1DAF5C:
  LDA $04A0,x                               ; $1DAF5C |
  AND #$01                                  ; $1DAF5F |
  BEQ code_1DAF6B                           ; $1DAF61 |
  LDY #$16                                  ; $1DAF63 |
  JSR code_1FF580                           ; $1DAF65 |
  JMP code_1DAF70                           ; $1DAF68 |

code_1DAF6B:
  LDY #$17                                  ; $1DAF6B |
  JSR code_1FF5C4                           ; $1DAF6D |
code_1DAF70:
  LDA $05C0,x                               ; $1DAF70 |
  CMP #$43                                  ; $1DAF73 |
  BEQ code_1DAF9B                           ; $1DAF75 |
  LDY #$15                                  ; $1DAF77 |
  JSR code_1FF67C                           ; $1DAF79 |
  BCC code_1DAF9A                           ; $1DAF7C |
  LDA #$BB                                  ; $1DAF7E |
  STA $0440,x                               ; $1DAF80 |
  LDA #$06                                  ; $1DAF83 |
  STA $0460,x                               ; $1DAF85 |
  LDA #$43                                  ; $1DAF88 |
  JSR reset_sprite_anim                     ; $1DAF8A |
  LDA #$01                                  ; $1DAF8D |
  STA $05A0,x                               ; $1DAF8F |
  LDA #$00                                  ; $1DAF92 |
  STA $05E0,x                               ; $1DAF94 |
  JSR face_player                           ; $1DAF97 |
code_1DAF9A:
  RTS                                       ; $1DAF9A |

code_1DAF9B:
  LDA $05A0,x                               ; $1DAF9B |
  BNE code_1DAFA0                           ; $1DAF9E |
code_1DAFA0:
  LDA #$46                                  ; $1DAFA0 |
  JMP reset_sprite_anim                     ; $1DAFA2 |

code_1DAFA5:
  LDA $05C0,x                               ; $1DAFA5 |
  CMP #$44                                  ; $1DAFA8 |
  BEQ code_1DAFC6                           ; $1DAFAA |
  LDA #$45                                  ; $1DAFAC |
  JSR reset_sprite_anim                     ; $1DAFAE |
  LDY #$15                                  ; $1DAFB1 |
  JSR code_1FF67C                           ; $1DAFB3 |
  LDA $10                                   ; $1DAFB6 |
  AND #$10                                  ; $1DAFB8 |
  BEQ code_1DAF9A                           ; $1DAFBA |
  LDA #$44                                  ; $1DAFBC |
  JSR reset_sprite_anim                     ; $1DAFBE |
  LDA #$5A                                  ; $1DAFC1 |
  STA $0560,x                               ; $1DAFC3 |
code_1DAFC6:
  DEC $0560,x                               ; $1DAFC6 |
  BNE code_1DAFD6                           ; $1DAFC9 |
  DEC $0300,x                               ; $1DAFCB |
  JSR reset_gravity                         ; $1DAFCE |
  LDA #$45                                  ; $1DAFD1 |
  JSR reset_sprite_anim                     ; $1DAFD3 |
code_1DAFD6:
  RTS                                       ; $1DAFD6 |

main_snapper:
  LDA $0300,x                               ; $1DAFD7 |\  test state:
  AND #$0F                                  ; $1DAFDA | | any of these bits
  BNE .presnap                              ; $1DAFDC |/  means at least presnap
  STA $0440,x                               ; $1DAFDE |\
  LDA #$02                                  ; $1DAFE1 | | if not, $0200
  STA $0460,x                               ; $1DAFE3 |/  -> Y speed
  JSR code_1FF8B3                           ; $1DAFE6 |\
  CMP #$18                                  ; $1DAFE9 | |
  BCS .ret                                  ; $1DAFEB | | if player is within $18
  JSR code_1FF8C2                           ; $1DAFED | | pixel distance both X & Y
  CMP #$18                                  ; $1DAFF0 | | (if not return)
  BCS .ret                                  ; $1DAFF2 |/
  INC $0300,x                               ; $1DAFF4 | start snapping!
  LDA #$21                                  ; $1DAFF7 |\ $21 frames of delay timer
  STA $0500,x                               ; $1DAFF9 |/ for presnap
  LDA #$06                                  ; $1DAFFC |\ 6 frames to snap upward
  STA $0520,x                               ; $1DAFFE |/ snapping timer
  LDA $03C0,x                               ; $1DB001 |\ preserve original Y position
  STA $0540,x                               ; $1DB004 |/ pre-snap
  LDA #$10                                  ; $1DB007 |\ 16 frames downward snap
  STA $0560,x                               ; $1DB009 |/
.ret:
  RTS                                       ; $1DB00C |

.presnap:
  LDA $0580,x                               ; $1DB00D |\  this sprite flag
  AND #$04                                  ; $1DB010 | | indicates past presnap
  BEQ .snapping                             ; $1DB012 |/
  DEC $0500,x                               ; $1DB014 |\ presnap timer
  BNE .ret                                  ; $1DB017 |/ not expired yet? return
  LDA $0580,x                               ; $1DB019 |\  on expiration,
  EOR #$04                                  ; $1DB01C | | turn $04 sprite flag on
  STA $0580,x                               ; $1DB01E |/
  LDA #$A3                                  ; $1DB021 |\ and set shape to ???
  STA $0480,x                               ; $1DB023 |/

.snapping:
  LDA $0300,x                               ; $1DB026 |\  this bitflag on
  AND #$02                                  ; $1DB029 | | means past snapping
  BNE .postsnap                             ; $1DB02B |/
  LDA #$00                                  ; $1DB02D |\
  STA $05E0,x                               ; $1DB02F | | show open mouth frame
  STA $05A0,x                               ; $1DB032 |/
  DEC $03C0,x                               ; $1DB035 |\
  DEC $03C0,x                               ; $1DB038 | | move up 3 pixels
  DEC $03C0,x                               ; $1DB03B |/
  DEC $0520,x                               ; $1DB03E |\ upward snap timer
  BNE .ret                                  ; $1DB041 |/ not expired yet? return
  INC $0300,x                               ; $1DB043 |\
  LDA #$22                                  ; $1DB046 | | on expiration,
  JSR code_1FF89A                           ; $1DB048 |/  $02 -> state
  RTS                                       ; $1DB04B |

.postsnap:
  LDA #$01                                  ; $1DB04C |\
  STA $05A0,x                               ; $1DB04E | | show closed mouth frame
  LDA #$00                                  ; $1DB051 | |
  STA $05E0,x                               ; $1DB053 |/
  JSR code_1FF759                           ; $1DB056 |
  DEC $0560,x                               ; $1DB059 |\ downward snap timer
  BNE .ret                                  ; $1DB05C |/ not expired yet? return
  LDA #$00                                  ; $1DB05E |\  on expiration,
  STA $05E0,x                               ; $1DB060 | | reset animation frame
  STA $05A0,x                               ; $1DB063 |/
  LDA $0540,x                               ; $1DB066 |\ restore original presnap
  STA $03C0,x                               ; $1DB069 |/ Y position
  LDA $0580,x                               ; $1DB06C |\
  ORA #$94                                  ; $1DB06F | | sprite flags ???
  STA $0580,x                               ; $1DB071 |/
  LDA #$80                                  ; $1DB074 |\ sprite state ???
  STA $0300,x                               ; $1DB076 |/
  LDA #$83                                  ; $1DB079 |\ reset shape
  STA $0480,x                               ; $1DB07B |/
  RTS                                       ; $1DB07E |

  LDA $0300,x                               ; $1DB07F |
  AND #$0F                                  ; $1DB082 |
  BNE code_1DB096                           ; $1DB084 |
  JSR code_1FF883                           ; $1DB086 |
  INC $0300,x                               ; $1DB089 |
  LDA #$36                                  ; $1DB08C |
  STA $0500,x                               ; $1DB08E |
  LDA #$10                                  ; $1DB091 |
  STA $0520,x                               ; $1DB093 |
code_1DB096:
  LDA $0300,x                               ; $1DB096 |
  AND #$02                                  ; $1DB099 |
  BNE code_1DB0CB                           ; $1DB09B |
  LDA $05C0,x                               ; $1DB09D |
  CMP #$D6                                  ; $1DB0A0 |
  BEQ code_1DB0B5                           ; $1DB0A2 |
  LDA $0540,x                               ; $1DB0A4 |
  CMP #$03                                  ; $1DB0A7 |
  BCS code_1DB0ED                           ; $1DB0A9 |
  DEC $0500,x                               ; $1DB0AB |
  BNE code_1DB0E0                           ; $1DB0AE |
  LDA #$D6                                  ; $1DB0B0 |
  JSR reset_sprite_anim                     ; $1DB0B2 |
code_1DB0B5:
  LDA #$00                                  ; $1DB0B5 |
  STA $05A0,x                               ; $1DB0B7 |
  STA $05E0,x                               ; $1DB0BA |
  JSR code_1DB11C                           ; $1DB0BD |
  INC $0540,x                               ; $1DB0C0 |
  LDA #$36                                  ; $1DB0C3 |
  STA $0500,x                               ; $1DB0C5 |
  INC $0300,x                               ; $1DB0C8 |
code_1DB0CB:
  LDA #$00                                  ; $1DB0CB |
  STA $05A0,x                               ; $1DB0CD |
  STA $05E0,x                               ; $1DB0D0 |
  DEC $0520,x                               ; $1DB0D3 |
  BNE code_1DB0EC                           ; $1DB0D6 |
  LDA #$10                                  ; $1DB0D8 |
  STA $0520,x                               ; $1DB0DA |
  DEC $0300,x                               ; $1DB0DD |
code_1DB0E0:
  LDA $05C0,x                               ; $1DB0E0 |
  CMP #$C6                                  ; $1DB0E3 |
  BEQ code_1DB0EC                           ; $1DB0E5 |
  LDA #$C6                                  ; $1DB0E7 |
  JSR reset_sprite_anim                     ; $1DB0E9 |
code_1DB0EC:
  RTS                                       ; $1DB0EC |

code_1DB0ED:
  LDA #$00                                  ; $1DB0ED |
  STA $00                                   ; $1DB0EF |
  LDA #$E2                                  ; $1DB0F1 |
  STA $01                                   ; $1DB0F3 |
  LDY #$1F                                  ; $1DB0F5 |
code_1DB0F7:
  LDA $0300,y                               ; $1DB0F7 |
  BMI code_1DB110                           ; $1DB0FA |
code_1DB0FC:
  DEY                                       ; $1DB0FC |
  CPY #$0F                                  ; $1DB0FD |
  BNE code_1DB0F7                           ; $1DB0FF |
  LDA $00                                   ; $1DB101 |
  CMP #$03                                  ; $1DB103 |
  BEQ code_1DB10A                           ; $1DB105 |
  DEC $0540,x                               ; $1DB107 |
code_1DB10A:
  LDA #$38                                  ; $1DB10A |
  STA $0500,x                               ; $1DB10C |
  RTS                                       ; $1DB10F |

code_1DB110:
  LDA $01                                   ; $1DB110 |
  CMP $05C0,y                               ; $1DB112 |
  BNE code_1DB0FC                           ; $1DB115 |
  INC $00                                   ; $1DB117 |
  JMP code_1DB0FC                           ; $1DB119 |

code_1DB11C:
  JSR find_enemy_freeslot_y                 ; $1DB11C |
  BCS code_1DB155                           ; $1DB11F |
  LDA $04A0,x                               ; $1DB121 |
  STA $04A0,y                               ; $1DB124 |
  LDA $0360,x                               ; $1DB127 |
  STA $0360,y                               ; $1DB12A |
  LDA $0380,x                               ; $1DB12D |
  STA $0380,y                               ; $1DB130 |
  LDA $03C0,x                               ; $1DB133 |
  CLC                                       ; $1DB136 |
  ADC #$04                                  ; $1DB137 |
  STA $03C0,y                               ; $1DB139 |
  LDA #$E2                                  ; $1DB13C |
  JSR code_1FF846                           ; $1DB13E |
  LDA #$98                                  ; $1DB141 |
  STA $0580,y                               ; $1DB143 |
  LDA #$C0                                  ; $1DB146 |
  STA $0480,y                               ; $1DB148 |
  LDA #$42                                  ; $1DB14B |
  STA $0320,y                               ; $1DB14D |
  LDA #$01                                  ; $1DB150 |
  STA $04E0,y                               ; $1DB152 |
code_1DB155:
  RTS                                       ; $1DB155 |

  LDA $0300,x                               ; $1DB156 |
  AND #$0F                                  ; $1DB159 |
  BNE code_1DB173                           ; $1DB15B |
  STA $0520,x                               ; $1DB15D |
  STA $0400,x                               ; $1DB160 |
  LDA #$02                                  ; $1DB163 |
  STA $0420,x                               ; $1DB165 |
  INC $0300,x                               ; $1DB168 |
  LDA #$F0                                  ; $1DB16B |
  STA $0500,x                               ; $1DB16D |
  JSR reset_gravity                         ; $1DB170 |
code_1DB173:
  LDY #$08                                  ; $1DB173 |
  JSR code_1FF67C                           ; $1DB175 |
  BCC code_1DB198                           ; $1DB178 |
  LDA $04A0,x                               ; $1DB17A |
  AND #$01                                  ; $1DB17D |
  BEQ code_1DB189                           ; $1DB17F |
  LDY #$08                                  ; $1DB181 |
  JSR code_1FF580                           ; $1DB183 |
  JMP code_1DB18E                           ; $1DB186 |

code_1DB189:
  LDY #$09                                  ; $1DB189 |
  JSR code_1FF5C4                           ; $1DB18B |
code_1DB18E:
  BCC code_1DB198                           ; $1DB18E |
  LDA $04A0,x                               ; $1DB190 |
  EOR #$03                                  ; $1DB193 |
  STA $04A0,x                               ; $1DB195 |
code_1DB198:
  DEC $0500,x                               ; $1DB198 |
  BNE code_1DB1A8                           ; $1DB19B |
  LDA #$71                                  ; $1DB19D |
  JSR reset_sprite_anim                     ; $1DB19F |
  LDA #$00                                  ; $1DB1A2 |
  STA $0320,x                               ; $1DB1A4 |
code_1DB1A7:
  RTS                                       ; $1DB1A7 |

code_1DB1A8:
  LDA $0520,x                               ; $1DB1A8 |
  BNE code_1DB1A7                           ; $1DB1AB |
  LDA $0500,x                               ; $1DB1AD |
  CMP #$B4                                  ; $1DB1B0 |
  BNE code_1DB1A7                           ; $1DB1B2 |
  LDA #$F0                                  ; $1DB1B4 |
  STA $0500,x                               ; $1DB1B6 |
  INC $0520,x                               ; $1DB1B9 |
  RTS                                       ; $1DB1BC |

  LDA $0300,x                               ; $1DB1BD |
  AND #$0F                                  ; $1DB1C0 |
  BNE code_1DB1F8                           ; $1DB1C2 |
  LDA $04A0,x                               ; $1DB1C4 |
  AND #$01                                  ; $1DB1C7 |
  BEQ code_1DB1D3                           ; $1DB1C9 |
  LDY #$18                                  ; $1DB1CB |
  JSR code_1FF580                           ; $1DB1CD |
  JMP code_1DB1D8                           ; $1DB1D0 |

code_1DB1D3:
  LDY #$19                                  ; $1DB1D3 |
  JSR code_1FF5C4                           ; $1DB1D5 |
code_1DB1D8:
  LDY #$18                                  ; $1DB1D8 |
  JSR code_1FF67C                           ; $1DB1DA |
  BCC code_1DB1EE                           ; $1DB1DD |
  JSR code_1DB224                           ; $1DB1DF |
  INC $0300,x                               ; $1DB1E2 |
  LDA #$CB                                  ; $1DB1E5 |
  STA $0480,x                               ; $1DB1E7 |
  LDA #$2B                                  ; $1DB1EA |
  BNE code_1DB1F5                           ; $1DB1EC |
code_1DB1EE:
  LDA #$C3                                  ; $1DB1EE |
  STA $0480,x                               ; $1DB1F0 |
  LDA #$2A                                  ; $1DB1F3 |
code_1DB1F5:
  JMP reset_sprite_anim                     ; $1DB1F5 |

code_1DB1F8:
  LDA $05C0,x                               ; $1DB1F8 |
  CMP #$2B                                  ; $1DB1FB |
  BNE code_1DB20A                           ; $1DB1FD |
  LDA $05A0,x                               ; $1DB1FF |
  CMP #$02                                  ; $1DB202 |
  BNE code_1DB21F                           ; $1DB204 |
  LDA #$29                                  ; $1DB206 |
  BNE code_1DB20C                           ; $1DB208 |
code_1DB20A:
  LDA #$29                                  ; $1DB20A |
code_1DB20C:
  JSR reset_sprite_anim                     ; $1DB20C |
  LDA $0500,x                               ; $1DB20F |
  BNE code_1DB220                           ; $1DB212 |
  LDA #$3C                                  ; $1DB214 |
  STA $0500,x                               ; $1DB216 |
  DEC $0300,x                               ; $1DB219 |
  JSR face_player                           ; $1DB21C |
code_1DB21F:
  RTS                                       ; $1DB21F |

code_1DB220:
  DEC $0500,x                               ; $1DB220 |
  RTS                                       ; $1DB223 |

code_1DB224:
  LDA $E4                                   ; $1DB224 |
  ADC $E5                                   ; $1DB226 |
  STA $E5                                   ; $1DB228 |
  AND #$01                                  ; $1DB22A |
  TAY                                       ; $1DB22C |
  LDA $B23A,y                               ; $1DB22D |
  STA $0440,x                               ; $1DB230 |
  LDA $B23C,y                               ; $1DB233 |
  STA $0460,x                               ; $1DB236 |
  RTS                                       ; $1DB239 |

  db $52, $A8, $04, $05                     ; $1DB23A |

  LDA $0300,x                               ; $1DB23E |
  AND #$0F                                  ; $1DB241 |
  BNE code_1DB265                           ; $1DB243 |
  STA $0440,x                               ; $1DB245 |
  LDA #$01                                  ; $1DB248 |
  STA $0460,x                               ; $1DB24A |
  INC $0300,x                               ; $1DB24D |
  LDA $03C0,x                               ; $1DB250 |
  CMP #$88                                  ; $1DB253 |
  BCS code_1DB25A                           ; $1DB255 |
  INC $0520,x                               ; $1DB257 |
code_1DB25A:
  LDA #$10                                  ; $1DB25A |
  STA $0500,x                               ; $1DB25C |
  LDA #$01                                  ; $1DB25F |
  STA $04A0,x                               ; $1DB261 |
  RTS                                       ; $1DB264 |

code_1DB265:
  JSR code_1FF8C2                           ; $1DB265 |
  CMP #$16                                  ; $1DB268 |
  BCS code_1DB29C                           ; $1DB26A |
  JSR code_1FF8B3                           ; $1DB26C |
  CMP #$15                                  ; $1DB26F |
  BCS code_1DB29C                           ; $1DB271 |
  LDA $04A0,x                               ; $1DB273 |
  AND #$02                                  ; $1DB276 |
  BNE code_1DB27E                           ; $1DB278 |
  LDA #$01                                  ; $1DB27A |
  BNE code_1DB280                           ; $1DB27C |
code_1DB27E:
  LDA #$02                                  ; $1DB27E |
code_1DB280:
  STA $36                                   ; $1DB280 |
  LDA #$00                                  ; $1DB282 |
  STA $37                                   ; $1DB284 |
  LDA #$01                                  ; $1DB286 |
  STA $38                                   ; $1DB288 |
  DEC $0500,x                               ; $1DB28A |
  BNE code_1DB29C                           ; $1DB28D |
  LDA #$10                                  ; $1DB28F |
  STA $0500,x                               ; $1DB291 |
  LDA $04A0,x                               ; $1DB294 |
  EOR #$03                                  ; $1DB297 |
  STA $04A0,x                               ; $1DB299 |
code_1DB29C:
  LDA $0520,x                               ; $1DB29C |
  BNE code_1DB2AF                           ; $1DB29F |
  JSR code_1FF779                           ; $1DB2A1 |
  LDA $03E0,x                               ; $1DB2A4 |
  BEQ code_1DB2AE                           ; $1DB2A7 |
  LDA #$00                                  ; $1DB2A9 |
  STA $03E0,x                               ; $1DB2AB |
code_1DB2AE:
  RTS                                       ; $1DB2AE |

code_1DB2AF:
  LDA $03C0,x                               ; $1DB2AF |
  PHA                                       ; $1DB2B2 |
  DEC $03C0,x                               ; $1DB2B3 |
  JSR code_1FFAE2                           ; $1DB2B6 |
  PLA                                       ; $1DB2B9 |
  STA $03C0,x                               ; $1DB2BA |
  BCS code_1DB2F0                           ; $1DB2BD |
  LDA $03C0                                 ; $1DB2BF |
  SEC                                       ; $1DB2C2 |
  SBC $03C0,x                               ; $1DB2C3 |
  BCS code_1DB2DC                           ; $1DB2C6 |
  LDA $03C0                                 ; $1DB2C8 |
  ADC #$02                                  ; $1DB2CB |
  STA $03C0                                 ; $1DB2CD |
  CMP #$F0                                  ; $1DB2D0 |
  BCC code_1DB2DC                           ; $1DB2D2 |
  ADC #$0F                                  ; $1DB2D4 |
  STA $03C0                                 ; $1DB2D6 |
  INC $03E0                                 ; $1DB2D9 |
code_1DB2DC:
  STX $0F                                   ; $1DB2DC |
  LDX #$00                                  ; $1DB2DE |
  LDY #$00                                  ; $1DB2E0 |
  JSR code_1FE8D6                           ; $1DB2E2 |
  LDA $10                                   ; $1DB2E5 |
  AND #$10                                  ; $1DB2E7 |
  BEQ code_1DB2EE                           ; $1DB2E9 |
  JSR code_1FEE13                           ; $1DB2EB |
code_1DB2EE:
  LDX $0F                                   ; $1DB2EE |
code_1DB2F0:
  JSR code_1FF759                           ; $1DB2F0 |
  LDA $03E0,x                               ; $1DB2F3 |
  BEQ code_1DB2AE                           ; $1DB2F6 |
  LDA #$00                                  ; $1DB2F8 |
  STA $03E0,x                               ; $1DB2FA |
  RTS                                       ; $1DB2FD |

  LDA $0500,x                               ; $1DB2FE |
  BEQ code_1DB308                           ; $1DB301 |
  DEC $0500,x                               ; $1DB303 |
  BNE code_1DB346                           ; $1DB306 |
code_1DB308:
  LDA $0580,x                               ; $1DB308 |
  AND #$04                                  ; $1DB30B |
  BEQ code_1DB31F                           ; $1DB30D |
  JSR code_1FF8C2                           ; $1DB30F |
  CMP #$61                                  ; $1DB312 |
  BCS code_1DB346                           ; $1DB314 |
  LDA $0580,x                               ; $1DB316 |
  AND #$FB                                  ; $1DB319 |
  STA $0580,x                               ; $1DB31B |
  RTS                                       ; $1DB31E |

code_1DB31F:
  LDA $05E0,x                               ; $1DB31F |
  BNE code_1DB34B                           ; $1DB322 |
  LDA $05A0,x                               ; $1DB324 |
  BNE code_1DB338                           ; $1DB327 |
  LDA #$80                                  ; $1DB329 |
  STA $0480,x                               ; $1DB32B |
  LDA $0580,x                               ; $1DB32E |
  ORA #$04                                  ; $1DB331 |
  STA $0580,x                               ; $1DB333 |
  BNE code_1DB341                           ; $1DB336 |
code_1DB338:
  CMP #$02                                  ; $1DB338 |
  BNE code_1DB34C                           ; $1DB33A |
  LDA #$AE                                  ; $1DB33C |
  STA $0480,x                               ; $1DB33E |
code_1DB341:
  LDA #$1E                                  ; $1DB341 |
  STA $0500,x                               ; $1DB343 |
code_1DB346:
  LDA #$00                                  ; $1DB346 |
  STA $05E0,x                               ; $1DB348 |
code_1DB34B:
  RTS                                       ; $1DB34B |

code_1DB34C:
  LDA #$A4                                  ; $1DB34C |
  STA $0480,x                               ; $1DB34E |
  RTS                                       ; $1DB351 |

  LDA $0300,x                               ; $1DB352 |
  AND #$0F                                  ; $1DB355 |
  BNE code_1DB389                           ; $1DB357 |
  LDA $0580,x                               ; $1DB359 |
  AND #$04                                  ; $1DB35C |
  BEQ code_1DB372                           ; $1DB35E |
  JSR code_1FF8C2                           ; $1DB360 |
  CMP #$61                                  ; $1DB363 |
  BCS code_1DB34B                           ; $1DB365 |
  LDA $0580,x                               ; $1DB367 |
  AND #$FB                                  ; $1DB36A |
  STA $0580,x                               ; $1DB36C |
  JMP code_1FF883                           ; $1DB36F |

code_1DB372:
  JSR code_1FF797                           ; $1DB372 |
  LDA $03C0,x                               ; $1DB375 |
  CMP #$78                                  ; $1DB378 |
  BCC code_1DB34B                           ; $1DB37A |
  LDA #$11                                  ; $1DB37C |
  STA $0500,x                               ; $1DB37E |
  LDA #$03                                  ; $1DB381 |
  STA $0520,x                               ; $1DB383 |
  INC $0300,x                               ; $1DB386 |
code_1DB389:
  LDA $05C0,x                               ; $1DB389 |
  CMP #$56                                  ; $1DB38C |
  BNE code_1DB39A                           ; $1DB38E |
  LDA $05E0,x                               ; $1DB390 |
  BNE code_1DB34B                           ; $1DB393 |
  LDA #$55                                  ; $1DB395 |
  JSR reset_sprite_anim                     ; $1DB397 |
code_1DB39A:
  DEC $0500,x                               ; $1DB39A |
  LDA $0500,x                               ; $1DB39D |
  BNE code_1DB3AA                           ; $1DB3A0 |
  LDA #$11                                  ; $1DB3A2 |
  STA $0500,x                               ; $1DB3A4 |
  INC $0520,x                               ; $1DB3A7 |
code_1DB3AA:
  LDA $0520,x                               ; $1DB3AA |
  AND #$03                                  ; $1DB3AD |
  STA $0520,x                               ; $1DB3AF |
  TAY                                       ; $1DB3B2 |
  LDA $03A0,x                               ; $1DB3B3 |
  CLC                                       ; $1DB3B6 |
  ADC $B44C,y                               ; $1DB3B7 |
  STA $03A0,x                               ; $1DB3BA |
  LDA $03C0,x                               ; $1DB3BD |
  ADC $B450,y                               ; $1DB3C0 |
  STA $03C0,x                               ; $1DB3C3 |
  LDA $04A0,x                               ; $1DB3C6 |
  AND #$02                                  ; $1DB3C9 |
  BEQ code_1DB3DA                           ; $1DB3CB |
  LDA $0540,x                               ; $1DB3CD |
  BNE code_1DB3D7                           ; $1DB3D0 |
  JSR code_1FF8C2                           ; $1DB3D2 |
  BCS code_1DB3E7                           ; $1DB3D5 |
code_1DB3D7:
  JMP code_1FF73B                           ; $1DB3D7 |

code_1DB3DA:
  LDA $0540,x                               ; $1DB3DA |
  BNE code_1DB3E4                           ; $1DB3DD |
  JSR code_1FF8C2                           ; $1DB3DF |
  BCC code_1DB3E7                           ; $1DB3E2 |
code_1DB3E4:
  JMP code_1FF71D                           ; $1DB3E4 |

code_1DB3E7:
  LDA #$26                                  ; $1DB3E7 |
  JSR code_1FF89A                           ; $1DB3E9 |
  LDA #$56                                  ; $1DB3EC |
  JSR reset_sprite_anim                     ; $1DB3EE |
  STX $00                                   ; $1DB3F1 |
  LDA #$07                                  ; $1DB3F3 |
  STA $01                                   ; $1DB3F5 |
code_1DB3F7:
  JSR find_enemy_freeslot_y                 ; $1DB3F7 |
  BCS code_1DB446                           ; $1DB3FA |
  LDX $01                                   ; $1DB3FC |
  LDA $B454,x                               ; $1DB3FE |
  STA $0400,y                               ; $1DB401 |
  LDA $B45C,x                               ; $1DB404 |
  STA $0420,y                               ; $1DB407 |
  LDA $B464,x                               ; $1DB40A |
  STA $0440,y                               ; $1DB40D |
  LDA $B46C,x                               ; $1DB410 |
  STA $0460,y                               ; $1DB413 |
  LDA $B474,x                               ; $1DB416 |
  STA $04A0,y                               ; $1DB419 |
  LDX $00                                   ; $1DB41C |
  LDA #$57                                  ; $1DB41E |
  JSR code_1FF846                           ; $1DB420 |
  LDA #$80                                  ; $1DB423 |
  STA $0480,y                               ; $1DB425 |
  LDA #$0F                                  ; $1DB428 |
  STA $0320,y                               ; $1DB42A |
  LDA $0360,x                               ; $1DB42D |
  STA $0360,y                               ; $1DB430 |
  LDA $0380,x                               ; $1DB433 |
  STA $0380,y                               ; $1DB436 |
  LDA $03C0,x                               ; $1DB439 |
  SEC                                       ; $1DB43C |
  SBC #$0C                                  ; $1DB43D |
  STA $03C0,y                               ; $1DB43F |
  DEC $01                                   ; $1DB442 |
  BPL code_1DB3F7                           ; $1DB444 |
code_1DB446:
  LDX $00                                   ; $1DB446 |
  INC $0540,x                               ; $1DB448 |
  RTS                                       ; $1DB44B |

  db $80, $80, $80, $80, $FF, $00, $00, $FF ; $1DB44C |
  db $00, $6A, $00, $6A, $00, $6A, $00, $6A ; $1DB454 |
  db $00, $01, $02, $01, $00, $01, $02, $01 ; $1DB45C |
  db $00, $96, $00, $6A, $00, $6A, $00, $96 ; $1DB464 |
  db $FE, $FE, $00, $01, $02, $01, $00, $FE ; $1DB46C |
  db $02, $02, $02, $02, $01, $01, $01, $01 ; $1DB474 |

  LDY #$08                                  ; $1DB47C |
  JSR code_1FF67C                           ; $1DB47E |
  LDA $04A0,x                               ; $1DB481 |
  AND #$01                                  ; $1DB484 |
  BEQ code_1DB490                           ; $1DB486 |
  LDY #$1A                                  ; $1DB488 |
  JSR code_1FF580                           ; $1DB48A |
  JMP code_1DB495                           ; $1DB48D |

code_1DB490:
  LDY #$1B                                  ; $1DB490 |
  JSR code_1FF5C4                           ; $1DB492 |
code_1DB495:
  BCC code_1DB49F                           ; $1DB495 |
  LDA $04A0,x                               ; $1DB497 |
  EOR #$03                                  ; $1DB49A |
  STA $04A0,x                               ; $1DB49C |
code_1DB49F:
  LDA $0300,x                               ; $1DB49F |
  AND #$0F                                  ; $1DB4A2 |
  BNE code_1DB4B1                           ; $1DB4A4 |
  JSR code_1FF8C2                           ; $1DB4A6 |
  CMP #$10                                  ; $1DB4A9 |
  BCS code_1DB4B0                           ; $1DB4AB |
  INC $0300,x                               ; $1DB4AD |
code_1DB4B0:
  RTS                                       ; $1DB4B0 |

code_1DB4B1:
  JSR code_1FF8C2                           ; $1DB4B1 |
  CMP #$30                                  ; $1DB4B4 |
  BCC code_1DB4B0                           ; $1DB4B6 |
  LDA $04A0,x                               ; $1DB4B8 |
  EOR #$03                                  ; $1DB4BB |
  STA $04A0,x                               ; $1DB4BD |
  DEC $0300,x                               ; $1DB4C0 |
  RTS                                       ; $1DB4C3 |

  LDY #$1A                                  ; $1DB4C4 |
  JSR code_1FF67C                           ; $1DB4C6 |
  ROL $0F                                   ; $1DB4C9 |
  JSR code_1FFB7B                           ; $1DB4CB |
  BCS code_1DB4EC                           ; $1DB4CE |
  LDA #$18                                  ; $1DB4D0 |
  JSR code_1FF89A                           ; $1DB4D2 |
  LDY $10                                   ; $1DB4D5 |
  LDA #$00                                  ; $1DB4D7 |
  STA $0300,y                               ; $1DB4D9 |
  LDA #$71                                  ; $1DB4DC |
  JSR reset_sprite_anim                     ; $1DB4DE |
  LDA #$00                                  ; $1DB4E1 |
  STA $0500,x                               ; $1DB4E3 |
  LDA #$39                                  ; $1DB4E6 |
  STA $0320,x                               ; $1DB4E8 |
  RTS                                       ; $1DB4EB |

code_1DB4EC:
  LDA $04A0,x                               ; $1DB4EC |
  AND #$01                                  ; $1DB4EF |
  BEQ code_1DB4FB                           ; $1DB4F1 |
  LDY #$1C                                  ; $1DB4F3 |
  JSR code_1FF580                           ; $1DB4F5 |
  JMP code_1DB500                           ; $1DB4F8 |

code_1DB4FB:
  LDY #$1D                                  ; $1DB4FB |
  JSR code_1FF5C4                           ; $1DB4FD |
code_1DB500:
  LDA $0F                                   ; $1DB500 |
  AND #$01                                  ; $1DB502 |
  BEQ code_1DB53F                           ; $1DB504 |
  LDA $10                                   ; $1DB506 |
  AND #$10                                  ; $1DB508 |
  BEQ code_1DB52E                           ; $1DB50A |
  LDA #$52                                  ; $1DB50C |
  JSR reset_sprite_anim                     ; $1DB50E |
  INC $0500,x                               ; $1DB511 |
  LDA $0500,x                               ; $1DB514 |
  CMP #$04                                  ; $1DB517 |
  BEQ code_1DB526                           ; $1DB519 |
  LDA #$29                                  ; $1DB51B |
  STA $0440,x                               ; $1DB51D |
  LDA #$05                                  ; $1DB520 |
  STA $0460,x                               ; $1DB522 |
  RTS                                       ; $1DB525 |

code_1DB526:
  LDA $04A0,x                               ; $1DB526 |
  EOR #$03                                  ; $1DB529 |
  STA $04A0,x                               ; $1DB52B |
code_1DB52E:
  LDA $05C0,x                               ; $1DB52E |
  CMP #$51                                  ; $1DB531 |
  BEQ code_1DB53A                           ; $1DB533 |
  LDA #$51                                  ; $1DB535 |
  JSR reset_sprite_anim                     ; $1DB537 |
code_1DB53A:
  LDA #$00                                  ; $1DB53A |
  STA $0500,x                               ; $1DB53C |
code_1DB53F:
  RTS                                       ; $1DB53F |

  LDA $0580,x                               ; $1DB540 |
  BMI code_1DB55B                           ; $1DB543 |
  LDA #$00                                  ; $1DB545 |
  STA $0300,x                               ; $1DB547 |
code_1DB54A:
  STA $95                                   ; $1DB54A |
  STA $72                                   ; $1DB54C |
  LDA #$30                                  ; $1DB54E |
  STA $1D                                   ; $1DB550 |
  LDA #$F0                                  ; $1DB552 |
  STA $1E                                   ; $1DB554 |
  LDA #$FF                                  ; $1DB556 |
  STA $1C                                   ; $1DB558 |
  RTS                                       ; $1DB55A |

code_1DB55B:
  ORA #$08                                  ; $1DB55B |
  STA $0580,x                               ; $1DB55D |
  JSR $8003                                 ; $1DB560 |
  LDA $04E0,x                               ; $1DB563 |
  BEQ code_1DB54A                           ; $1DB566 |
  LDA $05A0,x                               ; $1DB568 |
  BNE code_1DB579                           ; $1DB56B |
  LDA $05E0,x                               ; $1DB56D |
  CMP #$01                                  ; $1DB570 |
  BNE code_1DB579                           ; $1DB572 |
  LDA #$00                                  ; $1DB574 |
  STA $05E0,x                               ; $1DB576 |
code_1DB579:
  LDA $0500,x                               ; $1DB579 |
  BNE code_1DB5C6                           ; $1DB57C |
  LDA $04A0,x                               ; $1DB57E |
  AND #$01                                  ; $1DB581 |
  BEQ code_1DB58B                           ; $1DB583 |
  JSR code_1FF71D                           ; $1DB585 |
  JMP code_1DB58E                           ; $1DB588 |

code_1DB58B:
  JSR code_1FF73B                           ; $1DB58B |
code_1DB58E:
  LDA $0300,x                               ; $1DB58E |
  AND #$0F                                  ; $1DB591 |
  BNE code_1DB5CB                           ; $1DB593 |
  JSR code_1FF8C2                           ; $1DB595 |
  CMP #$61                                  ; $1DB598 |
  BCS code_1DB5CB                           ; $1DB59A |
  INC $0300,x                               ; $1DB59C |
  INC $05A0,x                               ; $1DB59F |
  LDA #$3C                                  ; $1DB5A2 |
  STA $0500,x                               ; $1DB5A4 |
  LDA $0320,x                               ; $1DB5A7 |
  AND #$01                                  ; $1DB5AA |
  BEQ code_1DB5B8                           ; $1DB5AC |
  LDA #$40                                  ; $1DB5AE |
  STA $0400,x                               ; $1DB5B0 |
  LDA #$00                                  ; $1DB5B3 |
  STA $0420,x                               ; $1DB5B5 |
code_1DB5B8:
  LDA #$FF                                  ; $1DB5B8 |
  STA $1C                                   ; $1DB5BA |
  LDA #$10                                  ; $1DB5BC |
  STA $1D                                   ; $1DB5BE |
  STA $1E                                   ; $1DB5C0 |
  LDA #$00                                  ; $1DB5C2 |
  STA $95                                   ; $1DB5C4 |
code_1DB5C6:
  DEC $0500,x                               ; $1DB5C6 |
  BNE code_1DB5CB                           ; $1DB5C9 |
code_1DB5CB:
  RTS                                       ; $1DB5CB |

  LDA $0300,x                               ; $1DB5CC |
  AND #$0F                                  ; $1DB5CF |
  BNE code_1DB5FD                           ; $1DB5D1 |
  STA $0440,x                               ; $1DB5D3 |
  LDA #$03                                  ; $1DB5D6 |
  STA $0460,x                               ; $1DB5D8 |
  JSR code_1FF8C2                           ; $1DB5DB |
  CMP #$64                                  ; $1DB5DE |
  BCS code_1DB5FC                           ; $1DB5E0 |
  LDA $E4                                   ; $1DB5E2 |
  ADC $E5                                   ; $1DB5E4 |
  STA $E5                                   ; $1DB5E6 |
  AND #$03                                  ; $1DB5E8 |
  TAY                                       ; $1DB5EA |
  LDA $B6E4,y                               ; $1DB5EB |
  STA $0540,x                               ; $1DB5EE |
  INC $0300,x                               ; $1DB5F1 |
  LDA $0580,x                               ; $1DB5F4 |
  EOR #$04                                  ; $1DB5F7 |
  STA $0580,x                               ; $1DB5F9 |
code_1DB5FC:
  RTS                                       ; $1DB5FC |

code_1DB5FD:
  LDA $0560,x                               ; $1DB5FD |
  BNE code_1DB61B                           ; $1DB600 |
  LDA $0540,x                               ; $1DB602 |
  BEQ code_1DB60D                           ; $1DB605 |
  DEC $0540,x                               ; $1DB607 |
  JMP code_1FF759                           ; $1DB60A |

code_1DB60D:
  LDA #$4D                                  ; $1DB60D |
  JSR reset_sprite_anim                     ; $1DB60F |
  INC $0560,x                               ; $1DB612 |
  LDA #$10                                  ; $1DB615 |
  STA $0540,x                               ; $1DB617 |
  RTS                                       ; $1DB61A |

code_1DB61B:
  LDA $05A0,x                               ; $1DB61B |
  CMP #$02                                  ; $1DB61E |
  BCC code_1DB62C                           ; $1DB620 |
  LDA #$03                                  ; $1DB622 |
  STA $05A0,x                               ; $1DB624 |
  LDA #$00                                  ; $1DB627 |
  STA $05E0,x                               ; $1DB629 |
code_1DB62C:
  LDA $0300,x                               ; $1DB62C |
  AND #$02                                  ; $1DB62F |
  BEQ code_1DB636                           ; $1DB631 |
  JMP code_1DB6BC                           ; $1DB633 |

code_1DB636:
  LDA $0500,x                               ; $1DB636 |
  BNE code_1DB694                           ; $1DB639 |
  LDY $0520,x                               ; $1DB63B |
  LDA $B6D6,y                               ; $1DB63E |
  ASL                                       ; $1DB641 |
  TAY                                       ; $1DB642 |
  LDA $8F4A,y                               ; $1DB643 |
  STA $0440,x                               ; $1DB646 |
  LDA $8F4B,y                               ; $1DB649 |
  STA $0460,x                               ; $1DB64C |
  LDA $8F6A,y                               ; $1DB64F |
  STA $0400,x                               ; $1DB652 |
  LDA $8F6B,y                               ; $1DB655 |
  STA $0420,x                               ; $1DB658 |
  LDA $0420,x                               ; $1DB65B |
  BPL code_1DB675                           ; $1DB65E |
  LDA $0400,x                               ; $1DB660 |
  EOR #$FF                                  ; $1DB663 |
  CLC                                       ; $1DB665 |
  ADC #$01                                  ; $1DB666 |
  STA $0400,x                               ; $1DB668 |
  LDA $0420,x                               ; $1DB66B |
  EOR #$FF                                  ; $1DB66E |
  ADC #$00                                  ; $1DB670 |
  STA $0420,x                               ; $1DB672 |
code_1DB675:
  INC $0520,x                               ; $1DB675 |
  LDA $0520,x                               ; $1DB678 |
  CMP #$07                                  ; $1DB67B |
  BNE code_1DB68F                           ; $1DB67D |
  LDA $04A0,x                               ; $1DB67F |
  EOR #$03                                  ; $1DB682 |
  STA $04A0,x                               ; $1DB684 |
  INC $0300,x                               ; $1DB687 |
  LDA #$00                                  ; $1DB68A |
  STA $0520,x                               ; $1DB68C |
code_1DB68F:
  LDA #$05                                  ; $1DB68F |
  STA $0500,x                               ; $1DB691 |
code_1DB694:
  DEC $0500,x                               ; $1DB694 |
  LDA $03A0,x                               ; $1DB697 |
  CLC                                       ; $1DB69A |
  ADC $0440,x                               ; $1DB69B |
  STA $03A0,x                               ; $1DB69E |
  LDA $03C0,x                               ; $1DB6A1 |
  ADC $0460,x                               ; $1DB6A4 |
  STA $03C0,x                               ; $1DB6A7 |
  LDA $04A0,x                               ; $1DB6AA |
  AND #$02                                  ; $1DB6AD |
  BNE code_1DB6B8                           ; $1DB6AF |
  JSR code_1FF71D                           ; $1DB6B1 |
  BCS code_1DB6BB                           ; $1DB6B4 |
  BCC code_1DB6BB                           ; $1DB6B6 |
code_1DB6B8:
  JSR code_1FF73B                           ; $1DB6B8 |
code_1DB6BB:
  RTS                                       ; $1DB6BB |

code_1DB6BC:
  DEC $0540,x                               ; $1DB6BC |
  BNE code_1DB6C9                           ; $1DB6BF |
  DEC $0300,x                               ; $1DB6C1 |
  LDA #$10                                  ; $1DB6C4 |
  STA $0540,x                               ; $1DB6C6 |
code_1DB6C9:
  LDA #$80                                  ; $1DB6C9 |
  STA $0440,x                               ; $1DB6CB |
  LDA #$00                                  ; $1DB6CE |
  STA $0460,x                               ; $1DB6D0 |
  JMP code_1FF759                           ; $1DB6D3 |

  db $09, $0A, $0B, $0C, $0D, $0E, $0F, $09 ; $1DB6D6 |
  db $0A, $0B, $0C, $0D, $0E, $0F, $22, $2A ; $1DB6DE |
  db $26, $2E                               ; $1DB6E6 |

  LDA #$00                                  ; $1DB6E8 |
  STA $05E0,x                               ; $1DB6EA |
  LDA $0300,x                               ; $1DB6ED |
  AND #$0F                                  ; $1DB6F0 |
  BEQ code_1DB752                           ; $1DB6F2 |
  LDA $B0                                   ; $1DB6F4 |
  CMP #$9C                                  ; $1DB6F6 |
  BNE code_1DB751                           ; $1DB6F8 |
  LDA $0300,x                               ; $1DB6FA |
  ORA #$40                                  ; $1DB6FD |
  STA $0300,x                               ; $1DB6FF |
  STX $00                                   ; $1DB702 |
  LDA $0320,x                               ; $1DB704 |
  AND #$07                                  ; $1DB707 |
  TAY                                       ; $1DB709 |
  LDA $B7FB,y                               ; $1DB70A |
  STA $0320,x                               ; $1DB70D |
  LDA #$CA                                  ; $1DB710 |
  STA $0480,x                               ; $1DB712 |
  LDA #$1C                                  ; $1DB715 |
  STA $04E0,x                               ; $1DB717 |
  LDA $B843,y                               ; $1DB71A |
  STA $0400,x                               ; $1DB71D |
  LDA $B84B,y                               ; $1DB720 |
  STA $0420,x                               ; $1DB723 |
  JSR reset_gravity                         ; $1DB726 |
  LDA $B81B,y                               ; $1DB729 |
  STA $ED                                   ; $1DB72C |
  JSR update_CHR_banks                      ; $1DB72E |
  LDA #$C0                                  ; $1DB731 |
  STA $0300,x                               ; $1DB733 |
  TYA                                       ; $1DB736 |
  ASL                                       ; $1DB737 |
  ASL                                       ; $1DB738 |
  TAY                                       ; $1DB739 |
  LDX #$00                                  ; $1DB73A |
code_1DB73C:
  LDA $B823,y                               ; $1DB73C |
  STA $061C,x                               ; $1DB73F |
  STA $063C,x                               ; $1DB742 |
  INY                                       ; $1DB745 |
  INX                                       ; $1DB746 |
  CPX #$04                                  ; $1DB747 |
  BNE code_1DB73C                           ; $1DB749 |
  LDA #$FF                                  ; $1DB74B |
  STA $18                                   ; $1DB74D |
  LDX $00                                   ; $1DB74F |
code_1DB751:
  RTS                                       ; $1DB751 |

code_1DB752:
  JSR code_1DB7DF                           ; $1DB752 |
  INC $0300,x                               ; $1DB755 |
  JSR find_enemy_freeslot_y                 ; $1DB758 |
  LDA #$61                                  ; $1DB75B |
  STA $0320,y                               ; $1DB75D |
  LDA $03C0,x                               ; $1DB760 |
  STA $0520,y                               ; $1DB763 |
  LDA $0360,x                               ; $1DB766 |
  STA $0360,y                               ; $1DB769 |
  LDA $0380,x                               ; $1DB76C |
  STA $0380,y                               ; $1DB76F |
  LDA #$10                                  ; $1DB772 |
  STA $03C0,y                               ; $1DB774 |
  LDA #$80                                  ; $1DB777 |
  STA $0440,y                               ; $1DB779 |
  STA $0480,y                               ; $1DB77C |
  LDA #$00                                  ; $1DB77F |
  STA $0460,y                               ; $1DB781 |
  STX $00                                   ; $1DB784 |
  LDA $0320,x                               ; $1DB786 |
  AND #$07                                  ; $1DB789 |
  TAX                                       ; $1DB78B |
  LDA $B7F3,x                               ; $1DB78C |
  LDX $00                                   ; $1DB78F |
  JSR code_1FF846                           ; $1DB791 |
  LDA $0320,x                               ; $1DB794 |
  AND #$07                                  ; $1DB797 |
  TAY                                       ; $1DB799 |
  LDA $B803,y                               ; $1DB79A |
  STA $ED                                   ; $1DB79D |
  TYA                                       ; $1DB79F |
  ASL                                       ; $1DB7A0 |
  TAY                                       ; $1DB7A1 |
  LDA #$0F                                  ; $1DB7A2 |
  STA $061C                                 ; $1DB7A4 |
  STA $061D                                 ; $1DB7A7 |
  STA $063C                                 ; $1DB7AA |
  STA $063D                                 ; $1DB7AD |
  LDA $B80B,y                               ; $1DB7B0 |
  STA $061E                                 ; $1DB7B3 |
  STA $063E                                 ; $1DB7B6 |
  LDA $B80C,y                               ; $1DB7B9 |
  STA $061F                                 ; $1DB7BC |
  STA $063F                                 ; $1DB7BF |
  LDA #$FF                                  ; $1DB7C2 |
  STA $18                                   ; $1DB7C4 |
  JMP update_CHR_banks                      ; $1DB7C6 |

  JSR code_1FF759                           ; $1DB7C9 |
  LDA $03C0,x                               ; $1DB7CC |
  CMP $0520,x                               ; $1DB7CF |
  BEQ code_1DB7D9                           ; $1DB7D2 |
  LDA #$80                                  ; $1DB7D4 |
  STA $B0                                   ; $1DB7D6 |
  RTS                                       ; $1DB7D8 |

code_1DB7D9:
  LDA #$00                                  ; $1DB7D9 |
  STA $0300,x                               ; $1DB7DB |
  RTS                                       ; $1DB7DE |

code_1DB7DF:
  LDA #$09                                  ; $1DB7DF |
  STA $30                                   ; $1DB7E1 |
  LDA #$80                                  ; $1DB7E3 |
  STA $B0                                   ; $1DB7E5 |
  STA $5A                                   ; $1DB7E7 |
  LDA #$8E                                  ; $1DB7E9 |
  STA $B3                                   ; $1DB7EB |
  LDA #$0C                                  ; $1DB7ED |
  JSR code_1FF898                           ; $1DB7EF |
  RTS                                       ; $1DB7F2 |

  db $16, $1A, $14, $18, $15, $13, $19, $17 ; $1DB7F3 |
  db $A0, $B0, $B2, $A1, $A2, $B3, $A3, $B1 ; $1DB7FB |
  db $23, $10, $23, $23, $23, $23, $10, $23 ; $1DB803 |
  db $30, $11, $30, $19, $27, $15, $37, $17 ; $1DB80B |
  db $30, $26, $27, $11, $27, $15, $27, $15 ; $1DB813 |
  db $21, $22, $21, $22, $21, $22, $21, $22 ; $1DB81B |
  db $0F, $30, $15, $27, $0F, $0F, $30, $19 ; $1DB823 |
  db $0F, $0F, $27, $15, $0F, $0F, $30, $19 ; $1DB82B |
  db $0F, $0F, $30, $26, $0F, $0F, $2C, $11 ; $1DB833 |
  db $0F, $0F, $27, $15, $0F, $0F, $27, $15 ; $1DB83B |
  db $00, $00, $00, $B3, $4C, $00, $80, $00 ; $1DB843 |
  db $01, $00, $00, $01, $01, $00, $02, $04 ; $1DB84B |

  LDA $0300,x                               ; $1DB853 |
  AND #$0F                                  ; $1DB856 |
  BNE code_1DB860                           ; $1DB858 |
  INC $0300,x                               ; $1DB85A |
  JSR code_1DB7DF                           ; $1DB85D |
code_1DB860:
  LDA $03C0,x                               ; $1DB860 |
  CMP #$80                                  ; $1DB863 |
  BCS code_1DB86D                           ; $1DB865 |
  JSR code_1FF797                           ; $1DB867 |
  JMP code_1DB8BD                           ; $1DB86A |

code_1DB86D:
  LDA $0320,x                               ; $1DB86D |
  AND #$07                                  ; $1DB870 |
  TAY                                       ; $1DB872 |
  LDA $B8EF,y                               ; $1DB873 |
  TAY                                       ; $1DB876 |
  JSR code_1FF67C                           ; $1DB877 |
  BCC code_1DB8BD                           ; $1DB87A |
  LDA $0320,x                               ; $1DB87C |
  AND #$07                                  ; $1DB87F |
  TAY                                       ; $1DB881 |
  LDA $B8E7,y                               ; $1DB882 |
  CMP $05A0,x                               ; $1DB885 |
  BNE code_1DB8C2                           ; $1DB888 |
  LDA #$00                                  ; $1DB88A |
  STA $05E0,x                               ; $1DB88C |
  LDA $B0                                   ; $1DB88F |
  CMP #$9C                                  ; $1DB891 |
  BNE code_1DB8C6                           ; $1DB893 |
  LDA #$C0                                  ; $1DB895 |
  STA $0300,x                               ; $1DB897 |
  LDA #$1C                                  ; $1DB89A |
  STA $04E0,x                               ; $1DB89C |
  LDA $0320,x                               ; $1DB89F |
  AND #$07                                  ; $1DB8A2 |
  TAY                                       ; $1DB8A4 |
  LDA $B8C7,y                               ; $1DB8A5 |
  STA $0320,x                               ; $1DB8A8 |
  LDA $B8CF,y                               ; $1DB8AB |
  STA $0400,x                               ; $1DB8AE |
  LDA $B8D7,y                               ; $1DB8B1 |
  STA $0420,x                               ; $1DB8B4 |
  LDA $B8DF,y                               ; $1DB8B7 |
  JMP reset_sprite_anim                     ; $1DB8BA |

code_1DB8BD:
  LDA #$00                                  ; $1DB8BD |
  STA $05E0,x                               ; $1DB8BF |
code_1DB8C2:
  LDA #$80                                  ; $1DB8C2 |
  STA $B0                                   ; $1DB8C4 |
code_1DB8C6:
  RTS                                       ; $1DB8C6 |

  db $C0, $C1, $D6, $D0, $C2, $D4, $D2, $C3 ; $1DB8C7 |
  db $B3, $00, $2D, $00, $00, $4C, $6D, $00 ; $1DB8CF |
  db $01, $00, $03, $01, $04, $01, $01, $04 ; $1DB8D7 |
  db $29, $1F, $33, $2C, $49, $22, $36, $3F ; $1DB8DF |
  db $04, $03, $05, $06, $02, $02, $08, $03 ; $1DB8E7 |
  db $1E, $1E, $00, $26, $1E, $00, $1E, $1E ; $1DB8EF |
  db $60                                    ; $1DB8F7 |

  LDA $03C0,x                               ; $1DB8F8 |
  PHA                                       ; $1DB8FB |
  DEC $03C0,x                               ; $1DB8FC |
  JSR code_1FFAE2                           ; $1DB8FF |
  PLA                                       ; $1DB902 |
  STA $03C0,x                               ; $1DB903 |
  BCS code_1DB92A                           ; $1DB906 |
  LDA $05C0,x                               ; $1DB908 |
  AND #$01                                  ; $1DB90B |
  TAY                                       ; $1DB90D |
  LDA $0340                                 ; $1DB90E |
  CLC                                       ; $1DB911 |
  ADC $B92B,y                               ; $1DB912 |
  STA $0340                                 ; $1DB915 |
  LDA $0360                                 ; $1DB918 |
  ADC $B92D,y                               ; $1DB91B |
  STA $0360                                 ; $1DB91E |
  LDA $0380                                 ; $1DB921 |
  ADC $B92F,y                               ; $1DB924 |
  STA $0380                                 ; $1DB927 |
code_1DB92A:
  RTS                                       ; $1DB92A |

  db $80, $80, $00, $FF, $00, $FF           ; $1DB92B |

  LDA $0300,x                               ; $1DB931 |
  AND #$0F                                  ; $1DB934 |
  BNE code_1DB964                           ; $1DB936 |
  STA $05A0,x                               ; $1DB938 |
  STA $05E0,x                               ; $1DB93B |
  STA $0520,x                               ; $1DB93E |
  JSR code_1FF8B3                           ; $1DB941 |
  CMP #$15                                  ; $1DB944 |
  BCS code_1DB963                           ; $1DB946 |
  LDA $30                                   ; $1DB948 |
  BNE code_1DB963                           ; $1DB94A |
  LDA $03C0,x                               ; $1DB94C |
  CMP $03C0                                 ; $1DB94F |
  BCC code_1DB963                           ; $1DB952 |
  JSR code_1FF8C2                           ; $1DB954 |
  CMP #$18                                  ; $1DB957 |
  BCS code_1DB963                           ; $1DB959 |
  LDA #$0C                                  ; $1DB95B |
  STA $0500,x                               ; $1DB95D |
  INC $0300,x                               ; $1DB960 |
code_1DB963:
  RTS                                       ; $1DB963 |

code_1DB964:
  LDA $0520,x                               ; $1DB964 |
  BNE code_1DB979                           ; $1DB967 |
  DEC $0500,x                               ; $1DB969 |
  BNE code_1DB963                           ; $1DB96C |
  INC $0520,x                               ; $1DB96E |
  LDA $0580,x                               ; $1DB971 |
  AND #$90                                  ; $1DB974 |
  STA $0580,x                               ; $1DB976 |
code_1DB979:
  LDA $0300,x                               ; $1DB979 |
  AND #$02                                  ; $1DB97C |
  BNE code_1DB98F                           ; $1DB97E |
  LDA $05A0,x                               ; $1DB980 |
  CMP #$04                                  ; $1DB983 |
  BNE code_1DB963                           ; $1DB985 |
  INC $0300,x                               ; $1DB987 |
  LDA #$14                                  ; $1DB98A |
  STA $0500,x                               ; $1DB98C |
code_1DB98F:
  LDA #$04                                  ; $1DB98F |
  STA $05A0,x                               ; $1DB991 |
  LDA #$00                                  ; $1DB994 |
  STA $05E0,x                               ; $1DB996 |
  DEC $0500,x                               ; $1DB999 |
  BNE code_1DB963                           ; $1DB99C |
  LDA $0580,x                               ; $1DB99E |
  EOR #$01                                  ; $1DB9A1 |
  STA $0580,x                               ; $1DB9A3 |
  LDA #$80                                  ; $1DB9A6 |
  STA $0300,x                               ; $1DB9A8 |
  RTS                                       ; $1DB9AB |

  LDY #$01                                  ; $1DB9AC |
code_1DB9AE:
  LDA $0300,y                               ; $1DB9AE |
  BPL code_1DB9DF                           ; $1DB9B1 |
  LDA $05C0,y                               ; $1DB9B3 |
  CMP #$AC                                  ; $1DB9B6 |
  BEQ code_1DB9BE                           ; $1DB9B8 |
  CMP #$AF                                  ; $1DB9BA |
  BNE code_1DB9DF                           ; $1DB9BC |
code_1DB9BE:
  JSR code_1FFB7B                           ; $1DB9BE |
  BCS code_1DB9DF                           ; $1DB9C1 |
  LDA #$18                                  ; $1DB9C3 |
  JSR code_1FF89A                           ; $1DB9C5 |
  LDY $10                                   ; $1DB9C8 |
  LDA #$00                                  ; $1DB9CA |
  STA $0300,y                               ; $1DB9CC |
  LDA #$71                                  ; $1DB9CF |
  JSR reset_sprite_anim                     ; $1DB9D1 |
  LDA #$00                                  ; $1DB9D4 |
  STA $0500,x                               ; $1DB9D6 |
  LDA #$19                                  ; $1DB9D9 |
  STA $0320,x                               ; $1DB9DB |
  RTS                                       ; $1DB9DE |

code_1DB9DF:
  INY                                       ; $1DB9DF |
  CPY #$03                                  ; $1DB9E0 |
  BCC code_1DB9AE                           ; $1DB9E2 |
  RTS                                       ; $1DB9E4 |

  LDA $0300,x                               ; $1DB9E5 |
  AND #$0F                                  ; $1DB9E8 |
  BNE code_1DBA0B                           ; $1DB9EA |
  STA $0440,x                               ; $1DB9EC |
  LDA #$01                                  ; $1DB9EF |
  STA $0460,x                               ; $1DB9F1 |
  LDA $03C0,x                               ; $1DB9F4 |
  STA $0560,x                               ; $1DB9F7 |
  JSR code_1FF8B3                           ; $1DB9FA |
  CMP #$15                                  ; $1DB9FD |
  BCS code_1DBA41                           ; $1DB9FF |
  JSR code_1FF8C2                           ; $1DBA01 |
  CMP #$0A                                  ; $1DBA04 |
  BCS code_1DBA41                           ; $1DBA06 |
  INC $0300,x                               ; $1DBA08 |
code_1DBA0B:
  LDA $0500,x                               ; $1DBA0B |
  BNE code_1DBA42                           ; $1DBA0E |
  JSR code_1FF779                           ; $1DBA10 |
  LDA $0440,x                               ; $1DBA13 |
  CLC                                       ; $1DBA16 |
  ADC #$10                                  ; $1DBA17 |
  STA $0440,x                               ; $1DBA19 |
  LDA $0460,x                               ; $1DBA1C |
  ADC #$00                                  ; $1DBA1F |
  STA $0460,x                               ; $1DBA21 |
  CMP #$03                                  ; $1DBA24 |
  BNE code_1DBA2D                           ; $1DBA26 |
  LDA #$00                                  ; $1DBA28 |
  STA $0440,x                               ; $1DBA2A |
code_1DBA2D:
  LDA $03C0,x                               ; $1DBA2D |
  CMP #$3A                                  ; $1DBA30 |
  BCS code_1DBA41                           ; $1DBA32 |
  INC $0500,x                               ; $1DBA34 |
  LDA #$00                                  ; $1DBA37 |
  STA $0440,x                               ; $1DBA39 |
  LDA #$01                                  ; $1DBA3C |
  STA $0460,x                               ; $1DBA3E |
code_1DBA41:
  RTS                                       ; $1DBA41 |

code_1DBA42:
  LDA $0300,x                               ; $1DBA42 |
  AND #$02                                  ; $1DBA45 |
  BNE code_1DBA57                           ; $1DBA47 |
  JSR code_1DB2AF                           ; $1DBA49 |
  LDA $03C0,x                               ; $1DBA4C |
  CMP $0560,x                               ; $1DBA4F |
  BCC code_1DBA41                           ; $1DBA52 |
  INC $0300,x                               ; $1DBA54 |
code_1DBA57:
  JSR code_1FF8B3                           ; $1DBA57 |
  CMP #$16                                  ; $1DBA5A |
  BCS code_1DBA41                           ; $1DBA5C |
  JSR code_1FF8C2                           ; $1DBA5E |
  CMP #$09                                  ; $1DBA61 |
  BCS code_1DBA41                           ; $1DBA63 |
  DEC $0300,x                               ; $1DBA65 |
  DEC $0500,x                               ; $1DBA68 |
  RTS                                       ; $1DBA6B |

  LDA $0300,x                               ; $1DBA6C |
  AND #$0F                                  ; $1DBA6F |
  BNE code_1DBA8C                           ; $1DBA71 |
  INC $0300,x                               ; $1DBA73 |
  LDA $E4                                   ; $1DBA76 |
  ADC $E6                                   ; $1DBA78 |
  STA $E4                                   ; $1DBA7A |
  AND #$03                                  ; $1DBA7C |
  TAY                                       ; $1DBA7E |
  LDA $BB51,y                               ; $1DBA7F |
  STA $0520,x                               ; $1DBA82 |
  LDA #$78                                  ; $1DBA85 |
  STA $0500,x                               ; $1DBA87 |
  BNE code_1DBB01                           ; $1DBA8A |
code_1DBA8C:
  LDA $0500,x                               ; $1DBA8C |
  BNE code_1DBAFE                           ; $1DBA8F |
  LDA $05A0,x                               ; $1DBA91 |
  ORA #$01                                  ; $1DBA94 |
  STA $05A0,x                               ; $1DBA96 |
  LDA $0540,x                               ; $1DBA99 |
  BNE code_1DBAF8                           ; $1DBA9C |
  JSR find_enemy_freeslot_y                 ; $1DBA9E |
  LDA #$BA                                  ; $1DBAA1 |
  JSR code_1FF846                           ; $1DBAA3 |
  LDA $0360,x                               ; $1DBAA6 |
  STA $0360,y                               ; $1DBAA9 |
  LDA $0380,x                               ; $1DBAAC |
  STA $0380,y                               ; $1DBAAF |
  LDA $03C0,x                               ; $1DBAB2 |
  STA $03C0,y                               ; $1DBAB5 |
  LDA #$80                                  ; $1DBAB8 |
  STA $0480,y                               ; $1DBABA |
  LDA #$8F                                  ; $1DBABD |
  STA $0320,y                               ; $1DBABF |
  LDA #$00                                  ; $1DBAC2 |
  STA $0400,y                               ; $1DBAC4 |
  STA $02                                   ; $1DBAC7 |
  LDA #$04                                  ; $1DBAC9 |
  STA $0420,y                               ; $1DBACB |
  STA $03                                   ; $1DBACE |
  STY $0F                                   ; $1DBAD0 |
  STX $0E                                   ; $1DBAD2 |
  LDX $0F                                   ; $1DBAD4 |
  JSR code_1FFC63                           ; $1DBAD6 |
  LDY $0F                                   ; $1DBAD9 |
  LDX $0E                                   ; $1DBADB |
  LDA $0C                                   ; $1DBADD |
  STA $04A0,y                               ; $1DBADF |
  DEC $0520,x                               ; $1DBAE2 |
  BEQ code_1DBAEE                           ; $1DBAE5 |
  LDA #$12                                  ; $1DBAE7 |
  STA $0540,x                               ; $1DBAE9 |
  BNE code_1DBB01                           ; $1DBAEC |
code_1DBAEE:
  LDA #$00                                  ; $1DBAEE |
  STA $05A0,x                               ; $1DBAF0 |
  DEC $0300,x                               ; $1DBAF3 |
  BNE code_1DBB01                           ; $1DBAF6 |
code_1DBAF8:
  DEC $0540,x                               ; $1DBAF8 |
  JMP code_1DBB01                           ; $1DBAFB |

code_1DBAFE:
  DEC $0500,x                               ; $1DBAFE |
code_1DBB01:
  LDA $05C0,x                               ; $1DBB01 |
  PHA                                       ; $1DBB04 |
  JSR $8003                                 ; $1DBB05 |
  PLA                                       ; $1DBB08 |
  STA $05C0,x                               ; $1DBB09 |
  LDA $04E0,x                               ; $1DBB0C |
  BNE code_1DBB2E                           ; $1DBB0F |
  STA $0300,x                               ; $1DBB11 |
  LDY #$0F                                  ; $1DBB14 |
code_1DBB16:
  LDA $0310,y                               ; $1DBB16 |
  BPL code_1DBB27                           ; $1DBB19 |
  LDA $03D0,y                               ; $1DBB1B |
  CMP #$80                                  ; $1DBB1E |
  BCS code_1DBB27                           ; $1DBB20 |
  LDA #$00                                  ; $1DBB22 |
  STA $0310,y                               ; $1DBB24 |
code_1DBB27:
  DEY                                       ; $1DBB27 |
  BPL code_1DBB16                           ; $1DBB28 |
  LDA #$80                                  ; $1DBB2A |
  STA $55                                   ; $1DBB2C |
code_1DBB2E:
  LDA #$00                                  ; $1DBB2E |
  STA $05E0,x                               ; $1DBB30 |
  RTS                                       ; $1DBB33 |

  LDA $04A0,x                               ; $1DBB34 |
  AND #$01                                  ; $1DBB37 |
  BEQ code_1DBB41                           ; $1DBB39 |
  JSR code_1FF71D                           ; $1DBB3B |
  JMP code_1DBB44                           ; $1DBB3E |

code_1DBB41:
  JSR code_1FF73B                           ; $1DBB41 |
code_1DBB44:
  LDA $04A0,x                               ; $1DBB44 |
  AND #$08                                  ; $1DBB47 |
  BEQ code_1DBB4E                           ; $1DBB49 |
  JMP code_1FF779                           ; $1DBB4B |

code_1DBB4E:
  JMP code_1FF759                           ; $1DBB4E |

  db $03, $03, $04, $02                     ; $1DBB51 |

  LDA $05C0,x                               ; $1DBB55 |
  BEQ code_1DBBBB                           ; $1DBB58 |
  JSR code_1FF797                           ; $1DBB5A |
  LDY #$00                                  ; $1DBB5D |
  STY $54                                   ; $1DBB5F |
  LDA $0380,x                               ; $1DBB61 |
  CMP #$0B                                  ; $1DBB64 |
  BEQ code_1DBB69                           ; $1DBB66 |
  INY                                       ; $1DBB68 |
code_1DBB69:
  LDA $BBBC,y                               ; $1DBB69 |
  CMP $03C0,x                               ; $1DBB6C |
  BCS code_1DBBB6                           ; $1DBB6F |
  STA $03C0,x                               ; $1DBB71 |
  LDA $05E0,x                               ; $1DBB74 |
  CMP #$02                                  ; $1DBB77 |
  BNE code_1DBBBB                           ; $1DBB79 |
  LDA $05A0,x                               ; $1DBB7B |
  CMP #$02                                  ; $1DBB7E |
  BNE code_1DBBBB                           ; $1DBB80 |
  LDA #$20                                  ; $1DBB82 |
  STA $060D                                 ; $1DBB84 |
  STA $062D                                 ; $1DBB87 |
  LDA #$37                                  ; $1DBB8A |
  STA $060E                                 ; $1DBB8C |
  STA $062E                                 ; $1DBB8F |
  LDA #$17                                  ; $1DBB92 |
  STA $060F                                 ; $1DBB94 |
  STA $062F                                 ; $1DBB97 |
  STA $18                                   ; $1DBB9A |
  LDA #$00                                  ; $1DBB9C |
  STA $05C0,x                               ; $1DBB9E |
  LDY #$1F                                  ; $1DBBA1 |
code_1DBBA3:
  LDA $0300,y                               ; $1DBBA3 |
  BPL code_1DBBB0                           ; $1DBBA6 |
  LDA $0580,y                               ; $1DBBA8 |
  AND #$FB                                  ; $1DBBAB |
  STA $0580,y                               ; $1DBBAD |
code_1DBBB0:
  DEY                                       ; $1DBBB0 |
  CPY #$0F                                  ; $1DBBB1 |
  BNE code_1DBBA3                           ; $1DBBB3 |
  RTS                                       ; $1DBBB5 |

code_1DBBB6:
  LDA #$00                                  ; $1DBBB6 |
  STA $05E0,x                               ; $1DBBB8 |
code_1DBBBB:
  RTS                                       ; $1DBBBB |

  db $48, $78                               ; $1DBBBC |

  LDA $0580,x                               ; $1DBBBE |
  AND #$04                                  ; $1DBBC1 |
  BNE code_1DBBBB                           ; $1DBBC3 |
  LDA $05C0,x                               ; $1DBBC5 |
  PHA                                       ; $1DBBC8 |
  JSR $8003                                 ; $1DBBC9 |
  PLA                                       ; $1DBBCC |
  STA $05C0,x                               ; $1DBBCD |
  LDA $04E0,x                               ; $1DBBD0 |
  BNE code_1DBBF5                           ; $1DBBD3 |
  STA $0520,x                               ; $1DBBD5 |
  STA $0480,x                               ; $1DBBD8 |
  LDA #$04                                  ; $1DBBDB |
  STA $0540,x                               ; $1DBBDD |
  LDA #$63                                  ; $1DBBE0 |
  STA $0320,x                               ; $1DBBE2 |
  LDY #$0F                                  ; $1DBBE5 |
  LDA #$00                                  ; $1DBBE7 |
code_1DBBE9:
  STA $0310,y                               ; $1DBBE9 |
  DEY                                       ; $1DBBEC |
  BPL code_1DBBE9                           ; $1DBBED |
  LDA #$80                                  ; $1DBBEF |
  STA $0300,x                               ; $1DBBF1 |
  RTS                                       ; $1DBBF4 |

code_1DBBF5:
  LDA $0300,x                               ; $1DBBF5 |
  AND #$0F                                  ; $1DBBF8 |
  BNE code_1DBC1E                           ; $1DBBFA |
  STA $05E0,x                               ; $1DBBFC |
  LDY #$1F                                  ; $1DBBFF |
code_1DBC01:
  LDA $0300,y                               ; $1DBC01 |
  BPL code_1DBC11                           ; $1DBC04 |
  LDA $05C0,y                               ; $1DBC06 |
  CMP #$CF                                  ; $1DBC09 |
  BEQ code_1DBC1D                           ; $1DBC0B |
  CMP #$D0                                  ; $1DBC0D |
  BEQ code_1DBC1D                           ; $1DBC0F |
code_1DBC11:
  DEY                                       ; $1DBC11 |
  CPY #$0F                                  ; $1DBC12 |
  BNE code_1DBC01                           ; $1DBC14 |
  LDA $54                                   ; $1DBC16 |
  BNE code_1DBC1D                           ; $1DBC18 |
  INC $0300,x                               ; $1DBC1A |
code_1DBC1D:
  RTS                                       ; $1DBC1D |

code_1DBC1E:
  LDA $05E0,x                               ; $1DBC1E |
  ORA $05A0,x                               ; $1DBC21 |
  BNE code_1DBC44                           ; $1DBC24 |
  INC $0520,x                               ; $1DBC26 |
  LDA $0520,x                               ; $1DBC29 |
  CMP #$02                                  ; $1DBC2C |
  BNE code_1DBC3E                           ; $1DBC2E |
  DEC $0300,x                               ; $1DBC30 |
  LDA #$00                                  ; $1DBC33 |
  STA $0500,x                               ; $1DBC35 |
  STA $0520,x                               ; $1DBC38 |
  INC $54                                   ; $1DBC3B |
  RTS                                       ; $1DBC3D |

code_1DBC3E:
  LDA #$3C                                  ; $1DBC3E |
  STA $0500,x                               ; $1DBC40 |
  RTS                                       ; $1DBC43 |

code_1DBC44:
  LDA $0500,x                               ; $1DBC44 |
  BEQ code_1DBC52                           ; $1DBC47 |
  DEC $0500,x                               ; $1DBC49 |
  LDA #$00                                  ; $1DBC4C |
  STA $05E0,x                               ; $1DBC4E |
  RTS                                       ; $1DBC51 |

code_1DBC52:
  LDA $05E0,x                               ; $1DBC52 |
  BNE code_1DBCA6                           ; $1DBC55 |
  LDA $05A0,x                               ; $1DBC57 |
  CMP #$02                                  ; $1DBC5A |
  BNE code_1DBCA6                           ; $1DBC5C |
  JSR find_enemy_freeslot_y                 ; $1DBC5E |
  BCS code_1DBCA6                           ; $1DBC61 |
  LDA #$CF                                  ; $1DBC63 |
  JSR code_1FF846                           ; $1DBC65 |
  LDA $0360,x                               ; $1DBC68 |
  STA $0360,y                               ; $1DBC6B |
  LDA $0380,x                               ; $1DBC6E |
  STA $0380,y                               ; $1DBC71 |
  LDA $03C0,x                               ; $1DBC74 |
  STA $03C0,y                               ; $1DBC77 |
  LDA #$C0                                  ; $1DBC7A |
  STA $0480,y                               ; $1DBC7C |
  LDA #$08                                  ; $1DBC7F |
  STA $04E0,y                               ; $1DBC81 |
  LDA #$8D                                  ; $1DBC84 |
  STA $0320,y                               ; $1DBC86 |
  LDA #$00                                  ; $1DBC89 |
  STA $0400,y                               ; $1DBC8B |
  LDA #$01                                  ; $1DBC8E |
  STA $0420,y                               ; $1DBC90 |
  LDA #$00                                  ; $1DBC93 |
  STA $0440,y                               ; $1DBC95 |
  LDA #$04                                  ; $1DBC98 |
  STA $0460,y                               ; $1DBC9A |
  JSR face_player                           ; $1DBC9D |
  LDA $04A0,x                               ; $1DBCA0 |
  STA $04A0,y                               ; $1DBCA3 |
code_1DBCA6:
  RTS                                       ; $1DBCA6 |

code_1DBCA7:
  RTS                                       ; $1DBCA7 |

  LDA $0580,x                               ; $1DBCA8 |
  AND #$04                                  ; $1DBCAB |
  BNE code_1DBCA7                           ; $1DBCAD |
  LDA $0300,x                               ; $1DBCAF |
  AND #$0F                                  ; $1DBCB2 |
  BNE code_1DBCD8                           ; $1DBCB4 |
  STA $05E0,x                               ; $1DBCB6 |
  LDY #$1F                                  ; $1DBCB9 |
code_1DBCBB:
  LDA $0300,y                               ; $1DBCBB |
  BPL code_1DBCCB                           ; $1DBCBE |
  LDA $05C0,y                               ; $1DBCC0 |
  CMP #$CF                                  ; $1DBCC3 |
  BEQ code_1DBCD7                           ; $1DBCC5 |
  CMP #$D0                                  ; $1DBCC7 |
  BEQ code_1DBCD7                           ; $1DBCC9 |
code_1DBCCB:
  DEY                                       ; $1DBCCB |
  CPY #$0F                                  ; $1DBCCC |
  BNE code_1DBCBB                           ; $1DBCCE |
  LDA $54                                   ; $1DBCD0 |
  BEQ code_1DBCD7                           ; $1DBCD2 |
  INC $0300,x                               ; $1DBCD4 |
code_1DBCD7:
  RTS                                       ; $1DBCD7 |

code_1DBCD8:
  LDA $05E0,x                               ; $1DBCD8 |
  ORA $05A0,x                               ; $1DBCDB |
  BNE code_1DBCE3                           ; $1DBCDE |
  DEC $0300,x                               ; $1DBCE0 |
code_1DBCE3:
  LDA $05A0,x                               ; $1DBCE3 |
  CMP #$02                                  ; $1DBCE6 |
  BNE code_1DBCD7                           ; $1DBCE8 |
  LDA $05E0,x                               ; $1DBCEA |
  BNE code_1DBCD7                           ; $1DBCED |
  LDA #$02                                  ; $1DBCEF |
  STA $10                                   ; $1DBCF1 |
  JSR face_player                           ; $1DBCF3 |
code_1DBCF6:
  JSR find_enemy_freeslot_y                 ; $1DBCF6 |
  BCS code_1DBD58                           ; $1DBCF9 |
  LDA #$D0                                  ; $1DBCFB |
  JSR code_1FF846                           ; $1DBCFD |
  LDA #$01                                  ; $1DBD00 |
  STA $05A0,y                               ; $1DBD02 |
  STA $04E0,y                               ; $1DBD05 |
  LDA #$CB                                  ; $1DBD08 |
  STA $0480,y                               ; $1DBD0A |
  LDA #$8E                                  ; $1DBD0D |
  STA $0320,y                               ; $1DBD0F |
  LDA $0360,x                               ; $1DBD12 |
  STA $0360,y                               ; $1DBD15 |
  LDA $0380,x                               ; $1DBD18 |
  STA $0380,y                               ; $1DBD1B |
  LDA $03C0,x                               ; $1DBD1E |
  STA $03C0,y                               ; $1DBD21 |
  LDA $04A0,x                               ; $1DBD24 |
  STA $04A0,y                               ; $1DBD27 |
  STX $00                                   ; $1DBD2A |
  LDX $10                                   ; $1DBD2C |
  LDA $BD59,x                               ; $1DBD2E |
  STA $0440,y                               ; $1DBD31 |
  LDA $BD5C,x                               ; $1DBD34 |
  STA $0460,y                               ; $1DBD37 |
  LDA $BD5F,x                               ; $1DBD3A |
  STA $0400,y                               ; $1DBD3D |
  LDA $BD62,x                               ; $1DBD40 |
  STA $0420,y                               ; $1DBD43 |
  LDA #$1E                                  ; $1DBD46 |
  STA $0500,y                               ; $1DBD48 |
  STA $0520,y                               ; $1DBD4B |
  LDX $00                                   ; $1DBD4E |
  DEC $10                                   ; $1DBD50 |
  BPL code_1DBCF6                           ; $1DBD52 |
  LDA #$00                                  ; $1DBD54 |
  STA $54                                   ; $1DBD56 |
code_1DBD58:
  RTS                                       ; $1DBD58 |

  db $44, $00, $2A, $03, $04, $05, $39, $55 ; $1DBD59 |
  db $8C, $01, $01, $01                     ; $1DBD61 |

  LDY #$08                                  ; $1DBD65 |
  JSR code_1FF67C                           ; $1DBD67 |
  BCC code_1DBD76                           ; $1DBD6A |
  LDA #$44                                  ; $1DBD6C |
  STA $0440,x                               ; $1DBD6E |
  LDA #$03                                  ; $1DBD71 |
  STA $0460,x                               ; $1DBD73 |
code_1DBD76:
  LDA $04A0,x                               ; $1DBD76 |
  AND #$01                                  ; $1DBD79 |
  BEQ code_1DBD85                           ; $1DBD7B |
  LDY #$08                                  ; $1DBD7D |
  JSR code_1FF580                           ; $1DBD7F |
  JMP code_1DBD8A                           ; $1DBD82 |

code_1DBD85:
  LDY #$09                                  ; $1DBD85 |
  JSR code_1FF5C4                           ; $1DBD87 |
code_1DBD8A:
  BCC code_1DBD94                           ; $1DBD8A |
  LDA $04A0,x                               ; $1DBD8C |
  EOR #$03                                  ; $1DBD8F |
  STA $04A0,x                               ; $1DBD91 |
code_1DBD94:
  RTS                                       ; $1DBD94 |

  LDA $0500,x                               ; $1DBD95 |
  BEQ code_1DBDAD                           ; $1DBD98 |
  DEC $0500,x                               ; $1DBD9A |
  JSR code_1FF797                           ; $1DBD9D |
  LDA $04A0,x                               ; $1DBDA0 |
  AND #$01                                  ; $1DBDA3 |
  BEQ code_1DBDAA                           ; $1DBDA5 |
  JMP code_1FF71D                           ; $1DBDA7 |

code_1DBDAA:
  JMP code_1FF73B                           ; $1DBDAA |

code_1DBDAD:
  LDY #$12                                  ; $1DBDAD |
  JSR code_1FF67C                           ; $1DBDAF |
  LDA #$01                                  ; $1DBDB2 |
  STA $05A0,x                               ; $1DBDB4 |
  BCC code_1DBDDF                           ; $1DBDB7 |
  LDA #$00                                  ; $1DBDB9 |
  STA $05A0,x                               ; $1DBDBB |
  DEC $0520,x                               ; $1DBDBE |
  BNE code_1DBDF3                           ; $1DBDC1 |
  LDA #$3C                                  ; $1DBDC3 |
  STA $0520,x                               ; $1DBDC5 |
  LDA #$A8                                  ; $1DBDC8 |
  STA $0440,x                               ; $1DBDCA |
  LDA #$05                                  ; $1DBDCD |
  STA $0460,x                               ; $1DBDCF |
  LDA #$F1                                  ; $1DBDD2 |
  STA $0400,x                               ; $1DBDD4 |
  LDA #$00                                  ; $1DBDD7 |
  STA $0420,x                               ; $1DBDD9 |
  JSR face_player                           ; $1DBDDC |
code_1DBDDF:
  LDA $04A0,x                               ; $1DBDDF |
  AND #$01                                  ; $1DBDE2 |
  BEQ code_1DBDEE                           ; $1DBDE4 |
  LDY #$1E                                  ; $1DBDE6 |
  JSR code_1FF580                           ; $1DBDE8 |
  JMP code_1DBDF3                           ; $1DBDEB |

code_1DBDEE:
  LDY #$1F                                  ; $1DBDEE |
  JSR code_1FF5C4                           ; $1DBDF0 |
code_1DBDF3:
  LDA #$00                                  ; $1DBDF3 |
  STA $05E0,x                               ; $1DBDF5 |
  RTS                                       ; $1DBDF8 |

  LDY #$2C                                  ; $1DBDF9 |
  BNE code_1DBDFF                           ; $1DBDFB |
  LDY #$2D                                  ; $1DBDFD |
code_1DBDFF:
  JSR code_1FF67C                           ; $1DBDFF |
  JSR code_1FFAE2                           ; $1DBE02 |
  BCS code_1DBE3A                           ; $1DBE05 |
  LDA $0500,x                               ; $1DBE07 |
  BNE code_1DBE25                           ; $1DBE0A |
  LDA $04C0,x                               ; $1DBE0C |
  PHA                                       ; $1DBE0F |
  AND #$07                                  ; $1DBE10 |
  TAY                                       ; $1DBE12 |
  LDA $DEC2,y                               ; $1DBE13 |
  STA $00                                   ; $1DBE16 |
  PLA                                       ; $1DBE18 |
  LSR                                       ; $1DBE19 |
  LSR                                       ; $1DBE1A |
  LSR                                       ; $1DBE1B |
  TAY                                       ; $1DBE1C |
  LDA $0150,y                               ; $1DBE1D |
  ORA $00                                   ; $1DBE20 |
  STA $0150,y                               ; $1DBE22 |
code_1DBE25:
  LDA #$00                                  ; $1DBE25 |
  STA $0300,x                               ; $1DBE27 |
  LDY $0320,x                               ; $1DBE2A |
  LDA $BDE6,y                               ; $1DBE2D |
  STA $00                                   ; $1DBE30 |
  LDA $BDEC,y                               ; $1DBE32 |
  STA $01                                   ; $1DBE35 |
  JMP ($0000)                               ; $1DBE37 |

code_1DBE3A:
  LDA $0500,x                               ; $1DBE3A |
  BEQ code_1DBE49                           ; $1DBE3D |
  DEC $0500,x                               ; $1DBE3F |
  BNE code_1DBE49                           ; $1DBE42 |
  LDA #$00                                  ; $1DBE44 |
  STA $0300,x                               ; $1DBE46 |
code_1DBE49:
  RTS                                       ; $1DBE49 |

  db $56, $5C, $62, $66, $9D, $AB, $BE, $BE ; $1DBE4A |
  db $BE, $BE, $BE, $BE                     ; $1DBE52 |

  LDA #$0A                                  ; $1DBE56 |
  LDY #$00                                  ; $1DBE58 |
  BEQ code_1DBE6C                           ; $1DBE5A |
  LDA #$02                                  ; $1DBE5C |
  LDY #$00                                  ; $1DBE5E |
  BEQ code_1DBE6C                           ; $1DBE60 |
  LDA #$0A                                  ; $1DBE62 |
  BNE code_1DBE68                           ; $1DBE64 |
  LDA #$02                                  ; $1DBE66 |
code_1DBE68:
  LDY $A0                                   ; $1DBE68 |
  BEQ code_1DBE98                           ; $1DBE6A |
code_1DBE6C:
  INC $58                                   ; $1DBE6C |
  STA $0F                                   ; $1DBE6E |
  STY $0E                                   ; $1DBE70 |
code_1DBE72:
  LDY $0E                                   ; $1DBE72 |
  LDA $00A2,y                               ; $1DBE74 |
  CMP #$9C                                  ; $1DBE77 |
  BEQ code_1DBE98                           ; $1DBE79 |
  LDA $00A2,y                               ; $1DBE7B |
  CLC                                       ; $1DBE7E |
  ADC #$01                                  ; $1DBE7F |
  STA $00A2,y                               ; $1DBE81 |
  LDA #$1C                                  ; $1DBE84 |
  JSR code_1FF89A                           ; $1DBE86 |
  DEC $0F                                   ; $1DBE89 |
  BEQ code_1DBE98                           ; $1DBE8B |
code_1DBE8D:
  JSR code_1FFD6E                           ; $1DBE8D |
  LDA $95                                   ; $1DBE90 |
  AND #$03                                  ; $1DBE92 |
  BNE code_1DBE8D                           ; $1DBE94 |
  BEQ code_1DBE72                           ; $1DBE96 |
code_1DBE98:
  LDA #$00                                  ; $1DBE98 |
  STA $58                                   ; $1DBE9A |
  RTS                                       ; $1DBE9C |

  LDA #$14                                  ; $1DBE9D |
  JSR code_1FF89A                           ; $1DBE9F |
  LDA $AF                                   ; $1DBEA2 |
  CMP #$09                                  ; $1DBEA4 |
  BEQ code_1DBEAA                           ; $1DBEA6 |
  INC $AF                                   ; $1DBEA8 |
code_1DBEAA:
  RTS                                       ; $1DBEAA |

  LDA #$14                                  ; $1DBEAB |
  JSR code_1FF89A                           ; $1DBEAD |
  LDA $AE                                   ; $1DBEB0 |
  CMP #$99                                  ; $1DBEB2 |
  BEQ code_1DBED1                           ; $1DBEB4 |
  INC $AE                                   ; $1DBEB6 |
  LDA $AE                                   ; $1DBEB8 |
  AND #$0F                                  ; $1DBEBA |
  CMP #$0A                                  ; $1DBEBC |
  BNE code_1DBED1                           ; $1DBEBE |
  LDA $AE                                   ; $1DBEC0 |
  AND #$F0                                  ; $1DBEC2 |
  CLC                                       ; $1DBEC4 |
  ADC #$10                                  ; $1DBEC5 |
  STA $AE                                   ; $1DBEC7 |
  CMP #$A0                                  ; $1DBEC9 |
  BNE code_1DBED1                           ; $1DBECB |
  LDA #$99                                  ; $1DBECD |
  STA $AE                                   ; $1DBECF |
code_1DBED1:
  RTS                                       ; $1DBED1 |

  LDA $05C0,x                               ; $1DBED2 |
  CMP #$71                                  ; $1DBED5 |
  BEQ code_1DBF03                           ; $1DBED7 |
  JSR code_1FFB7B                           ; $1DBED9 |
  BCS code_1DBED1                           ; $1DBEDC |
  LDA $04C0,x                               ; $1DBEDE |
  PHA                                       ; $1DBEE1 |
  AND #$07                                  ; $1DBEE2 |
  TAY                                       ; $1DBEE4 |
  LDA $DEC2,y                               ; $1DBEE5 |
  STA $00                                   ; $1DBEE8 |
  PLA                                       ; $1DBEEA |
  LSR                                       ; $1DBEEB |
  LSR                                       ; $1DBEEC |
  LSR                                       ; $1DBEED |
  TAY                                       ; $1DBEEE |
  LDA $0150,y                               ; $1DBEEF |
  ORA $00                                   ; $1DBEF2 |
  STA $0150,y                               ; $1DBEF4 |
  LDY $10                                   ; $1DBEF7 |
  LDA #$00                                  ; $1DBEF9 |
  STA $0300,y                               ; $1DBEFB |
  LDA #$71                                  ; $1DBEFE |
  JMP reset_sprite_anim                     ; $1DBF00 |

code_1DBF03:
  LDA $05A0,x                               ; $1DBF03 |
  CMP #$04                                  ; $1DBF06 |
  BNE code_1DBF3E                           ; $1DBF08 |
  LDA $E5                                   ; $1DBF0A |
  ADC $E6                                   ; $1DBF0C |
  STA $E5                                   ; $1DBF0E |
  STA $00                                   ; $1DBF10 |
  LDA #$64                                  ; $1DBF12 |
  STA $01                                   ; $1DBF14 |
  JSR code_1FFCEB                           ; $1DBF16 |
  LDY #$05                                  ; $1DBF19 |
  LDA $03                                   ; $1DBF1B |
code_1DBF1D:
  CMP $BF3F,y                               ; $1DBF1D |
  BCC code_1DBF25                           ; $1DBF20 |
  DEY                                       ; $1DBF22 |
  BNE code_1DBF1D                           ; $1DBF23 |
code_1DBF25:
  LDA $BF45,y                               ; $1DBF25 |
  JSR reset_sprite_anim                     ; $1DBF28 |
  LDA $BF4B,y                               ; $1DBF2B |
  STA $0320,x                               ; $1DBF2E |
  LDA $0580,x                               ; $1DBF31 |
  AND #$FC                                  ; $1DBF34 |
  STA $0580,x                               ; $1DBF36 |
  LDA #$F0                                  ; $1DBF39 |
  STA $0500,x                               ; $1DBF3B |
code_1DBF3E:
  RTS                                       ; $1DBF3E |

  db $63, $41, $23, $19, $0F, $05, $FB, $F9 ; $1DBF3F |
  db $FA, $FC, $FE, $FD, $66, $64, $65, $67 ; $1DBF47 |
  db $69, $68                               ; $1DBF4F |

  LDA $05A0,x                               ; $1DBF51 |
  CMP #$04                                  ; $1DBF54 |
  BNE code_1DBF96                           ; $1DBF56 |
  LDA $5A                                   ; $1DBF58 |
  BMI code_1DBF77                           ; $1DBF5A |
  LDA $E6                                   ; $1DBF5C |
  ADC $E7                                   ; $1DBF5E |
  STA $E7                                   ; $1DBF60 |
  STA $00                                   ; $1DBF62 |
  LDA #$64                                  ; $1DBF64 |
  STA $01                                   ; $1DBF66 |
  JSR code_1FFCEB                           ; $1DBF68 |
  LDY #$04                                  ; $1DBF6B |
  LDA $03                                   ; $1DBF6D |
code_1DBF6F:
  CMP $BF97,y                               ; $1DBF6F |
  BCC code_1DBF7D                           ; $1DBF72 |
  DEY                                       ; $1DBF74 |
  BPL code_1DBF6F                           ; $1DBF75 |
code_1DBF77:
  LDA #$00                                  ; $1DBF77 |
  STA $0300,x                               ; $1DBF79 |
  RTS                                       ; $1DBF7C |

code_1DBF7D:
  LDA $BF9C,y                               ; $1DBF7D |
  JSR reset_sprite_anim                     ; $1DBF80 |
  LDA $BFA1,y                               ; $1DBF83 |
  STA $0320,x                               ; $1DBF86 |
  LDA #$F0                                  ; $1DBF89 |
  STA $0500,x                               ; $1DBF8B |
  LDA #$00                                  ; $1DBF8E |
  STA $0440,x                               ; $1DBF90 |
  STA $0460,x                               ; $1DBF93 |
code_1DBF96:
  RTS                                       ; $1DBF96 |

  db $1D, $1B, $0C, $0A, $01, $FB, $FC, $F9 ; $1DBF97 |
  db $FA, $FE, $66, $67, $64, $65, $69, $ED ; $1DBF9F |
  db $40, $40, $01, $C6, $15, $ED, $00, $A6 ; $1DBFA7 |
  db $41, $97, $11, $59, $54, $93, $44, $CD ; $1DBFAF |
  db $84, $66, $04, $08, $41, $75, $51, $9B ; $1DBFB7 |
  db $15, $0B, $01, $88, $40, $C0, $01, $18 ; $1DBFBF |
  db $00, $57, $80, $88, $40, $02, $00, $02 ; $1DBFC7 |
  db $10, $0E, $01, $C7, $10, $30, $00, $EF ; $1DBFCF |
  db $00, $0F, $50, $AB, $15, $C0, $05, $07 ; $1DBFD7 |
  db $55, $6F, $10, $97, $44, $08, $40, $2B ; $1DBFDF |
  db $01, $23, $00, $92, $71, $ED, $15, $67 ; $1DBFE7 |
  db $54, $7A, $54, $A1, $00, $AD, $01, $3A ; $1DBFEF |
  db $00, $DE, $04, $82, $51, $90, $00, $16 ; $1DBFF7 |
  db $05                                    ; $1DBFFF |

