bank $02
org $A000

  JMP code_02A15B                           ; $02A000 |

  LDA $EA                                   ; $02A003 |
  PHA                                       ; $02A005 |
  LDA $EB                                   ; $02A006 |
  PHA                                       ; $02A008 |
  LDA $EC                                   ; $02A009 |
  PHA                                       ; $02A00B |
  LDA $ED                                   ; $02A00C |
  PHA                                       ; $02A00E |
  LDX #$03                                  ; $02A00F |
code_02A011:
  LDA $0620,x                               ; $02A011 |
  STA $0600,x                               ; $02A014 |
  DEX                                       ; $02A017 |
  BPL code_02A011                           ; $02A018 |
code_02A01A:
  JSR code_02A18E                           ; $02A01A |
code_02A01D:
  LDA $14                                   ; $02A01D |
  AND #$D0                                  ; $02A01F |
  BNE code_02A02C                           ; $02A021 |
code_02A023:
  JSR code_02A398                           ; $02A023 |
  JSR code_02A2EA                           ; $02A026 |
  JMP code_02A01D                           ; $02A029 |

code_02A02C:
  AND #$40                                  ; $02A02C |
  BNE code_02A038                           ; $02A02E |
  LDA $A1                                   ; $02A030 |
  BPL code_02A0A0                           ; $02A032 |
  CMP #$FF                                  ; $02A034 |
  BEQ code_02A05C                           ; $02A036 |
code_02A038:
  LDA $51                                   ; $02A038 |
  CMP #$E8                                  ; $02A03A |
  BEQ code_02A04B                           ; $02A03C |
  LDA $51                                   ; $02A03E |
  CLC                                       ; $02A040 |
  ADC #$04                                  ; $02A041 |
  STA $51                                   ; $02A043 |
  JSR code_02A2EA                           ; $02A045 |
  JMP code_02A038                           ; $02A048 |

code_02A04B:
  LDA $B4                                   ; $02A04B |
  EOR #$06                                  ; $02A04D |
  STA $B4                                   ; $02A04F |
  LDA #$00                                  ; $02A051 |
  STA $50                                   ; $02A053 |
  LDA #$80                                  ; $02A055 |
  STA $A1                                   ; $02A057 |
  JMP code_02A01A                           ; $02A059 |

code_02A05C:
  LDA $B4                                   ; $02A05C |
  BNE code_02A09D                           ; $02A05E |
  STA $95                                   ; $02A060 |
  LDA $AF                                   ; $02A062 |
  BEQ code_02A09D                           ; $02A064 |
  SEC                                       ; $02A066 |
  SBC #$01                                  ; $02A067 |
  STA $AF                                   ; $02A069 |
  AND #$0F                                  ; $02A06B |
  CMP #$0F                                  ; $02A06D |
  BNE code_02A078                           ; $02A06F |
  LDA $AF                                   ; $02A071 |
  SEC                                       ; $02A073 |
  SBC #$06                                  ; $02A074 |
  STA $AF                                   ; $02A076 |
code_02A078:
  LDA #$00                                  ; $02A078 |
  STA $A1                                   ; $02A07A |
  LDA $A2                                   ; $02A07C |
  CMP #$9C                                  ; $02A07E |
  BEQ code_02A09D                           ; $02A080 |
  LDA $95                                   ; $02A082 |
  AND #$03                                  ; $02A084 |
  BNE code_02A097                           ; $02A086 |
  INC $A2                                   ; $02A088 |
  LDA $A1                                   ; $02A08A |
  PHA                                       ; $02A08C |
  LDX #$00                                  ; $02A08D |
  STX $A1                                   ; $02A08F |
  JSR code_02A50D                           ; $02A091 |
  PLA                                       ; $02A094 |
  STA $A1                                   ; $02A095 |
code_02A097:
  JSR code_02A2EA                           ; $02A097 |
  JMP code_02A078                           ; $02A09A |

code_02A09D:
  JMP code_02A023                           ; $02A09D |

code_02A0A0:
  LDA $A1                                   ; $02A0A0 |
  CLC                                       ; $02A0A2 |
  ADC $B4                                   ; $02A0A3 |
  CMP $A0                                   ; $02A0A5 |
  BEQ code_02A0AD                           ; $02A0A7 |
  LDY #$00                                  ; $02A0A9 |
  STY $B5                                   ; $02A0AB |
code_02A0AD:
  STA $A0                                   ; $02A0AD |
  LDA $A0                                   ; $02A0AF |
  BNE code_02A0B7                           ; $02A0B1 |
  STA $B1                                   ; $02A0B3 |
  BEQ code_02A0E6                           ; $02A0B5 |
code_02A0B7:
  ORA #$80                                  ; $02A0B7 |
  STA $B1                                   ; $02A0B9 |
  LDA $B4                                   ; $02A0BB |
  BEQ code_02A0E6                           ; $02A0BD |
  LDA $A1                                   ; $02A0BF |
  AND #$01                                  ; $02A0C1 |
  BEQ code_02A0E6                           ; $02A0C3 |
  LDA $A1                                   ; $02A0C5 |
  LSR                                       ; $02A0C7 |
  CLC                                       ; $02A0C8 |
  ADC #$06                                  ; $02A0C9 |
  STA $A1                                   ; $02A0CB |
  LDA #$00                                  ; $02A0CD |
  STA $95                                   ; $02A0CF |
code_02A0D1:
  JSR code_02A2EA                           ; $02A0D1 |
  LDA $95                                   ; $02A0D4 |
  CMP #$0F                                  ; $02A0D6 |
  BNE code_02A0D1                           ; $02A0D8 |
  LDA #$1E                                  ; $02A0DA |
code_02A0DC:
  PHA                                       ; $02A0DC |
  JSR code_1FFF21                           ; $02A0DD |
  PLA                                       ; $02A0E0 |
  SEC                                       ; $02A0E1 |
  SBC #$01                                  ; $02A0E2 |
  BNE code_02A0DC                           ; $02A0E4 |
code_02A0E6:
  LDA $51                                   ; $02A0E6 |
  CMP #$E8                                  ; $02A0E8 |
  BEQ code_02A0FB                           ; $02A0EA |
  LDA $51                                   ; $02A0EC |
  CLC                                       ; $02A0EE |
  ADC #$04                                  ; $02A0EF |
  STA $51                                   ; $02A0F1 |
  JSR code_02A2EA                           ; $02A0F3 |
  DEC $95                                   ; $02A0F6 |
  JMP code_02A0E6                           ; $02A0F8 |

code_02A0FB:
  LDA $A1                                   ; $02A0FB |
  CMP #$06                                  ; $02A0FD |
  BCC code_02A108                           ; $02A0FF |
  SBC #$06                                  ; $02A101 |
  ASL                                       ; $02A103 |
  ORA #$01                                  ; $02A104 |
  STA $A1                                   ; $02A106 |
code_02A108:
  PLA                                       ; $02A108 |
  STA $ED                                   ; $02A109 |
  PLA                                       ; $02A10B |
  STA $EC                                   ; $02A10C |
  PLA                                       ; $02A10E |
  STA $EB                                   ; $02A10F |
  PLA                                       ; $02A111 |
  STA $EA                                   ; $02A112 |
  LDY $A0                                   ; $02A114 |
  LDA $A634,y                               ; $02A116 |
  STA $EB                                   ; $02A119 |
  LDA #$00                                  ; $02A11B |
  STA $50                                   ; $02A11D |
  LDY $F8                                   ; $02A11F |
  CPY #$01                                  ; $02A121 |
  BNE code_02A127                           ; $02A123 |
  STA $F8                                   ; $02A125 |
code_02A127:
  LDX #$0F                                  ; $02A127 |
code_02A129:
  LDA $0630,x                               ; $02A129 |
  STA $0610,x                               ; $02A12C |
  DEX                                       ; $02A12F |
  BNE code_02A129                           ; $02A130 |
  LDA $A0                                   ; $02A132 |
  ASL                                       ; $02A134 |
  ASL                                       ; $02A135 |
  TAY                                       ; $02A136 |
  LDX #$00                                  ; $02A137 |
code_02A139:
  LDA $A641,y                               ; $02A139 |
  STA $0611,x                               ; $02A13C |
  STA $0631,x                               ; $02A13F |
  INY                                       ; $02A142 |
  INX                                       ; $02A143 |
  CPX #$03                                  ; $02A144 |
  BNE code_02A139                           ; $02A146 |
  STX $18                                   ; $02A148 |
  LDA #$04                                  ; $02A14A |
  STA $30                                   ; $02A14C |
  LDX #$00                                  ; $02A14E |
  LDA #$13                                  ; $02A150 |
  JSR reset_sprite_anim                     ; $02A152 |
  INC $05A0                                 ; $02A155 |
  JMP code_1FFF3C                           ; $02A158 |

code_02A15B:
  LDA $EA                                   ; $02A15B |
  PHA                                       ; $02A15D |
  LDA $EB                                   ; $02A15E |
  PHA                                       ; $02A160 |
  LDA $EC                                   ; $02A161 |
  PHA                                       ; $02A163 |
  LDA $ED                                   ; $02A164 |
  PHA                                       ; $02A166 |
  JSR code_02A18E                           ; $02A167 |
  LDA #$00                                  ; $02A16A |
  STA $95                                   ; $02A16C |
code_02A16E:
  LDA $95                                   ; $02A16E |
  AND #$03                                  ; $02A170 |
  BNE code_02A185                           ; $02A172 |
  LDA $A1                                   ; $02A174 |
  CLC                                       ; $02A176 |
  ADC $B4                                   ; $02A177 |
  TAX                                       ; $02A179 |
  LDA $A2,x                                 ; $02A17A |
  CMP #$9C                                  ; $02A17C |
  BEQ code_02A18B                           ; $02A17E |
  INC $A2,x                                 ; $02A180 |
  JSR code_02A50D                           ; $02A182 |
code_02A185:
  JSR code_02A2EA                           ; $02A185 |
  JMP code_02A16E                           ; $02A188 |

code_02A18B:
  JMP code_02A0E6                           ; $02A18B |

code_02A18E:
  LDA #$1A                                  ; $02A18E |
  JSR code_1FF89A                           ; $02A190 |
  LDA $50                                   ; $02A193 |
  PHA                                       ; $02A195 |
  INC $50                                   ; $02A196 |
  LDA #$04                                  ; $02A198 |
  STA $97                                   ; $02A19A |
  JSR code_1EC5E9                           ; $02A19C |
  PLA                                       ; $02A19F |
  STA $50                                   ; $02A1A0 |
  LDA $F8                                   ; $02A1A2 |
  BNE code_02A1AA                           ; $02A1A4 |
  LDA #$01                                  ; $02A1A6 |
  STA $F8                                   ; $02A1A8 |
code_02A1AA:
  LDY $50                                   ; $02A1AA |
  CPY #$08                                  ; $02A1AC |
  BEQ code_02A217                           ; $02A1AE |
  LDX $A575,y                               ; $02A1B0 |
  LDY #$00                                  ; $02A1B3 |
code_02A1B5:
  LDA $52                                   ; $02A1B5 |
  AND #$0C                                  ; $02A1B7 |
  ORA $A57D,x                               ; $02A1B9 |
  STA $0780,y                               ; $02A1BC |
  BMI code_02A1F7                           ; $02A1BF |
  LDA $A57E,x                               ; $02A1C1 |
  STA $0781,y                               ; $02A1C4 |
  LDA $A57F,x                               ; $02A1C7 |
  STA $0782,y                               ; $02A1CA |
  STA $00                                   ; $02A1CD |
code_02A1CF:
  LDA #$00                                  ; $02A1CF |
  STA $01                                   ; $02A1D1 |
  LDA $A580,x                               ; $02A1D3 |
  BPL code_02A1E0                           ; $02A1D6 |
  AND #$7F                                  ; $02A1D8 |
  STA $01                                   ; $02A1DA |
  INX                                       ; $02A1DC |
  LDA $A580,x                               ; $02A1DD |
code_02A1E0:
  STA $0783,y                               ; $02A1E0 |
  INY                                       ; $02A1E3 |
  DEC $00                                   ; $02A1E4 |
  DEC $01                                   ; $02A1E6 |
  BPL code_02A1E0                           ; $02A1E8 |
  INX                                       ; $02A1EA |
  LDA $00                                   ; $02A1EB |
  BPL code_02A1CF                           ; $02A1ED |
  INX                                       ; $02A1EF |
  INX                                       ; $02A1F0 |
  INX                                       ; $02A1F1 |
  INY                                       ; $02A1F2 |
  INY                                       ; $02A1F3 |
  INY                                       ; $02A1F4 |
  BNE code_02A1B5                           ; $02A1F5 |
code_02A1F7:
  JSR code_02A251                           ; $02A1F7 |
  LDA $F8                                   ; $02A1FA |
  CMP #$0B                                  ; $02A1FC |
  BNE code_02A213                           ; $02A1FE |
  LDA #$20                                  ; $02A200 |
  STA $0780                                 ; $02A202 |
  LDA $0781                                 ; $02A205 |
  SEC                                       ; $02A208 |
  SBC #$C0                                  ; $02A209 |
  STA $0781                                 ; $02A20B |
  LDA #$FF                                  ; $02A20E |
  STA $07A3                                 ; $02A210 |
code_02A213:
  INC $19                                   ; $02A213 |
  INC $50                                   ; $02A215 |
code_02A217:
  LDA #$74                                  ; $02A217 |
  CMP $EA                                   ; $02A219 |
  BEQ code_02A23D                           ; $02A21B |
  STA $EA                                   ; $02A21D |
  LDA #$0B                                  ; $02A21F |
  STA $EB                                   ; $02A221 |
  LDA #$12                                  ; $02A223 |
  STA $EC                                   ; $02A225 |
  LDA #$1C                                  ; $02A227 |
  STA $ED                                   ; $02A229 |
  LDX #$0F                                  ; $02A22B |
code_02A22D:
  LDA $A624,x                               ; $02A22D |
  STA $0610,x                               ; $02A230 |
  DEX                                       ; $02A233 |
  BNE code_02A22D                           ; $02A234 |
  LDA #$FF                                  ; $02A236 |
  STA $18                                   ; $02A238 |
  JSR code_1FFF3C                           ; $02A23A |
code_02A23D:
  JSR code_02A2EA                           ; $02A23D |
  LDA $51                                   ; $02A240 |
  CMP #$B0                                  ; $02A242 |
  BEQ code_02A250                           ; $02A244 |
  LDA $51                                   ; $02A246 |
  SEC                                       ; $02A248 |
  SBC #$04                                  ; $02A249 |
  STA $51                                   ; $02A24B |
  JMP code_02A1AA                           ; $02A24D |

code_02A250:
  RTS                                       ; $02A250 |

code_02A251:
  LDA $50                                   ; $02A251 |
  CMP #$06                                  ; $02A253 |
  BCS code_02A2A9                           ; $02A255 |
  AND #$01                                  ; $02A257 |
  BEQ code_02A2A9                           ; $02A259 |
  LDA $50                                   ; $02A25B |
  CLC                                       ; $02A25D |
  ADC $B4                                   ; $02A25E |
  AND #$FE                                  ; $02A260 |
  STA $00                                   ; $02A262 |
  LDX #$08                                  ; $02A264 |
code_02A266:
  LDA #$07                                  ; $02A266 |
  STA $01                                   ; $02A268 |
  LDY $00                                   ; $02A26A |
  LDA $00A2,y                               ; $02A26C |
  BPL code_02A29D                           ; $02A26F |
  AND #$7F                                  ; $02A271 |
  STA $02                                   ; $02A273 |
  LDA $A5D8,y                               ; $02A275 |
  STA $0780,x                               ; $02A278 |
  LDA $A5E4,y                               ; $02A27B |
  STA $0781,x                               ; $02A27E |
  INX                                       ; $02A281 |
  INX                                       ; $02A282 |
code_02A283:
  LDY #$04                                  ; $02A283 |
  LDA $02                                   ; $02A285 |
  SEC                                       ; $02A287 |
  SBC #$04                                  ; $02A288 |
  BCS code_02A290                           ; $02A28A |
  LDY $02                                   ; $02A28C |
  LDA #$00                                  ; $02A28E |
code_02A290:
  STA $02                                   ; $02A290 |
  LDA $A5F0,y                               ; $02A292 |
  STA $0780,x                               ; $02A295 |
  INX                                       ; $02A298 |
  DEC $01                                   ; $02A299 |
  BNE code_02A283                           ; $02A29B |
code_02A29D:
  LDA $00                                   ; $02A29D |
  AND #$01                                  ; $02A29F |
  BNE code_02A2A9                           ; $02A2A1 |
  LDX #$13                                  ; $02A2A3 |
  INC $00                                   ; $02A2A5 |
  BNE code_02A266                           ; $02A2A7 |
code_02A2A9:
  LDA $50                                   ; $02A2A9 |
  CMP #$02                                  ; $02A2AB |
  BNE code_02A2C3                           ; $02A2AD |
  LDA $B4                                   ; $02A2AF |
  BNE code_02A2DE                           ; $02A2B1 |
  LDA $AE                                   ; $02A2B3 |
  AND #$0F                                  ; $02A2B5 |
  STA $07A1                                 ; $02A2B7 |
  LDA $AE                                   ; $02A2BA |
  LSR                                       ; $02A2BC |
  LSR                                       ; $02A2BD |
  LSR                                       ; $02A2BE |
  LSR                                       ; $02A2BF |
  STA $07A0                                 ; $02A2C0 |
code_02A2C3:
  LDA $50                                   ; $02A2C3 |
  CMP #$05                                  ; $02A2C5 |
  BNE code_02A2E9                           ; $02A2C7 |
  LDA $B4                                   ; $02A2C9 |
  BNE code_02A2DE                           ; $02A2CB |
  LDA $AF                                   ; $02A2CD |
  AND #$0F                                  ; $02A2CF |
  STA $07A1                                 ; $02A2D1 |
  LDA $AF                                   ; $02A2D4 |
  LSR                                       ; $02A2D6 |
  LSR                                       ; $02A2D7 |
  LSR                                       ; $02A2D8 |
  LSR                                       ; $02A2D9 |
  STA $07A0                                 ; $02A2DA |
  RTS                                       ; $02A2DD |

code_02A2DE:
  LDA #$25                                  ; $02A2DE |
  STA $079F                                 ; $02A2E0 |
  STA $07A0                                 ; $02A2E3 |
  STA $07A1                                 ; $02A2E6 |
code_02A2E9:
  RTS                                       ; $02A2E9 |

code_02A2EA:
  LDA $F8                                   ; $02A2EA |
  CMP #$01                                  ; $02A2EC |
  BEQ code_02A2F6                           ; $02A2EE |
  LDA $5E                                   ; $02A2F0 |
  CMP $51                                   ; $02A2F2 |
  BCC code_02A2F8                           ; $02A2F4 |
code_02A2F6:
  LDA $51                                   ; $02A2F6 |
code_02A2F8:
  STA $7B                                   ; $02A2F8 |
  JSR code_1EC5E9                           ; $02A2FA |
  JSR code_02A30C                           ; $02A2FD |
  LDA #$00                                  ; $02A300 |
  STA $EE                                   ; $02A302 |
  JSR code_1FFF21                           ; $02A304 |
  INC $EE                                   ; $02A307 |
  INC $95                                   ; $02A309 |
  RTS                                       ; $02A30B |

code_02A30C:
  LDA $B4                                   ; $02A30C |
  BNE code_02A347                           ; $02A30E |
  LDX #$1C                                  ; $02A310 |
  LDA $A1                                   ; $02A312 |
  CMP #$FF                                  ; $02A314 |
  BNE code_02A320                           ; $02A316 |
  LDA $95                                   ; $02A318 |
  AND #$08                                  ; $02A31A |
  BEQ code_02A320                           ; $02A31C |
  LDX #$0C                                  ; $02A31E |
code_02A320:
  LDA $A670,x                               ; $02A320 |
  CLC                                       ; $02A323 |
  ADC $51                                   ; $02A324 |
  BCS code_02A341                           ; $02A326 |
  CMP #$F0                                  ; $02A328 |
  BCS code_02A341                           ; $02A32A |
  STA $0200,x                               ; $02A32C |
  LDA $A671,x                               ; $02A32F |
  STA $0201,x                               ; $02A332 |
  LDA $A672,x                               ; $02A335 |
  STA $0202,x                               ; $02A338 |
  LDA $A673,x                               ; $02A33B |
  STA $0203,x                               ; $02A33E |
code_02A341:
  DEX                                       ; $02A341 |
  DEX                                       ; $02A342 |
  DEX                                       ; $02A343 |
  DEX                                       ; $02A344 |
  BPL code_02A320                           ; $02A345 |
code_02A347:
  LDA $A1                                   ; $02A347 |
  BPL code_02A34C                           ; $02A349 |
code_02A34B:
  RTS                                       ; $02A34B |

code_02A34C:
  CLC                                       ; $02A34C |
  ADC $B4                                   ; $02A34D |
  BEQ code_02A34B                           ; $02A34F |
  ASL                                       ; $02A351 |
  TAX                                       ; $02A352 |
  LDA $95                                   ; $02A353 |
  AND #$08                                  ; $02A355 |
  BEQ code_02A35A                           ; $02A357 |
  INX                                       ; $02A359 |
code_02A35A:
  LDA $A690,x                               ; $02A35A |
  STA $00                                   ; $02A35D |
  LDA $A6AE,x                               ; $02A35F |
  STA $01                                   ; $02A362 |
  LDX #$20                                  ; $02A364 |
  LDY #$00                                  ; $02A366 |
code_02A368:
  LDA ($00),y                               ; $02A368 |
  BMI code_02A397                           ; $02A36A |
  CLC                                       ; $02A36C |
  ADC $51                                   ; $02A36D |
  BCS code_02A391                           ; $02A36F |
  CMP #$F0                                  ; $02A371 |
  BCS code_02A391                           ; $02A373 |
  STA $0200,x                               ; $02A375 |
  INY                                       ; $02A378 |
  LDA ($00),y                               ; $02A379 |
  STA $0201,x                               ; $02A37B |
  INY                                       ; $02A37E |
  LDA ($00),y                               ; $02A37F |
  STA $0202,x                               ; $02A381 |
  INY                                       ; $02A384 |
  LDA ($00),y                               ; $02A385 |
  STA $0203,x                               ; $02A387 |
  INY                                       ; $02A38A |
code_02A38B:
  INX                                       ; $02A38B |
  INX                                       ; $02A38C |
  INX                                       ; $02A38D |
  INX                                       ; $02A38E |
  BNE code_02A368                           ; $02A38F |
code_02A391:
  INY                                       ; $02A391 |
  INY                                       ; $02A392 |
  INY                                       ; $02A393 |
  INY                                       ; $02A394 |
  BNE code_02A38B                           ; $02A395 |
code_02A397:
  RTS                                       ; $02A397 |

code_02A398:
  LDA $A1                                   ; $02A398 |
  PHA                                       ; $02A39A |
  LDA $16                                   ; $02A39B |
  AND #$0F                                  ; $02A39D |
  BNE code_02A3A8                           ; $02A39F |
  LDA #$F0                                  ; $02A3A1 |
  STA $1F                                   ; $02A3A3 |
code_02A3A5:
  JMP code_02A477                           ; $02A3A5 |

code_02A3A8:
  LDA $1F                                   ; $02A3A8 |
  CLC                                       ; $02A3AA |
  ADC #$10                                  ; $02A3AB |
  STA $1F                                   ; $02A3AD |
  BNE code_02A3A5                           ; $02A3AF |
  LDA $16                                   ; $02A3B1 |
  AND #$01                                  ; $02A3B3 |
  BEQ code_02A3EC                           ; $02A3B5 |
code_02A3B7:
  LDA $A1                                   ; $02A3B7 |
  BPL code_02A3C5                           ; $02A3B9 |
  CMP #$FF                                  ; $02A3BB |
  BEQ code_02A3A5                           ; $02A3BD |
  LDA #$00                                  ; $02A3BF |
  STA $A1                                   ; $02A3C1 |
  BEQ code_02A3DE                           ; $02A3C3 |
code_02A3C5:
  LDA $B4                                   ; $02A3C5 |
  BEQ code_02A3CF                           ; $02A3C7 |
  LDA $A1                                   ; $02A3C9 |
  AND #$01                                  ; $02A3CB |
  BNE code_02A3A5                           ; $02A3CD |
code_02A3CF:
  INC $A1                                   ; $02A3CF |
  LDA $A1                                   ; $02A3D1 |
  AND #$01                                  ; $02A3D3 |
  BNE code_02A3DE                           ; $02A3D5 |
  LDA #$FF                                  ; $02A3D7 |
  STA $A1                                   ; $02A3D9 |
  JMP code_02A477                           ; $02A3DB |

code_02A3DE:
  LDA $A1                                   ; $02A3DE |
  CLC                                       ; $02A3E0 |
  ADC $B4                                   ; $02A3E1 |
  TAY                                       ; $02A3E3 |
  LDA $00A2,y                               ; $02A3E4 |
  BPL code_02A3B7                           ; $02A3E7 |
  JMP code_02A477                           ; $02A3E9 |

code_02A3EC:
  LDA $16                                   ; $02A3EC |
  AND #$02                                  ; $02A3EE |
  BEQ code_02A41D                           ; $02A3F0 |
code_02A3F2:
  LDA $A1                                   ; $02A3F2 |
  BPL code_02A400                           ; $02A3F4 |
  CMP #$80                                  ; $02A3F6 |
  BEQ code_02A3A5                           ; $02A3F8 |
  LDA #$01                                  ; $02A3FA |
  STA $A1                                   ; $02A3FC |
  BNE code_02A40F                           ; $02A3FE |
code_02A400:
  DEC $A1                                   ; $02A400 |
  LDA $A1                                   ; $02A402 |
  AND #$01                                  ; $02A404 |
  BEQ code_02A40F                           ; $02A406 |
  LDA #$80                                  ; $02A408 |
  STA $A1                                   ; $02A40A |
  JMP code_02A3A5                           ; $02A40C |

code_02A40F:
  LDA $A1                                   ; $02A40F |
  CLC                                       ; $02A411 |
  ADC $B4                                   ; $02A412 |
  TAY                                       ; $02A414 |
  LDA $00A2,y                               ; $02A415 |
  BPL code_02A3F2                           ; $02A418 |
  JMP code_02A477                           ; $02A41A |

code_02A41D:
  LDA $A1                                   ; $02A41D |
  BMI code_02A477                           ; $02A41F |
  LDA $16                                   ; $02A421 |
  AND #$08                                  ; $02A423 |
  BEQ code_02A44C                           ; $02A425 |
code_02A427:
  LDA $A1                                   ; $02A427 |
  BNE code_02A431                           ; $02A429 |
  LDA #$05                                  ; $02A42B |
  STA $A1                                   ; $02A42D |
  BNE code_02A46C                           ; $02A42F |
code_02A431:
  CMP #$01                                  ; $02A431 |
  BNE code_02A43B                           ; $02A433 |
  LDA #$04                                  ; $02A435 |
  STA $A1                                   ; $02A437 |
  BNE code_02A43F                           ; $02A439 |
code_02A43B:
  DEC $A1                                   ; $02A43B |
  DEC $A1                                   ; $02A43D |
code_02A43F:
  LDA $A1                                   ; $02A43F |
  CLC                                       ; $02A441 |
  ADC $B4                                   ; $02A442 |
  TAY                                       ; $02A444 |
  LDA $00A2,y                               ; $02A445 |
  BPL code_02A427                           ; $02A448 |
  BMI code_02A477                           ; $02A44A |
code_02A44C:
  LDA $16                                   ; $02A44C |
  AND #$04                                  ; $02A44E |
  BEQ code_02A477                           ; $02A450 |
code_02A452:
  LDA $A1                                   ; $02A452 |
  CMP #$04                                  ; $02A454 |
  BNE code_02A45E                           ; $02A456 |
  LDA #$01                                  ; $02A458 |
  STA $A1                                   ; $02A45A |
  BNE code_02A46C                           ; $02A45C |
code_02A45E:
  CMP #$05                                  ; $02A45E |
  BNE code_02A468                           ; $02A460 |
  LDA #$00                                  ; $02A462 |
  STA $A1                                   ; $02A464 |
  BEQ code_02A46C                           ; $02A466 |
code_02A468:
  INC $A1                                   ; $02A468 |
  INC $A1                                   ; $02A46A |
code_02A46C:
  LDA $A1                                   ; $02A46C |
  CLC                                       ; $02A46E |
  ADC $B4                                   ; $02A46F |
  TAY                                       ; $02A471 |
  LDA $00A2,y                               ; $02A472 |
  BPL code_02A452                           ; $02A475 |
code_02A477:
  PLA                                       ; $02A477 |
  CMP $A1                                   ; $02A478 |
  BEQ code_02A481                           ; $02A47A |
  LDA #$1B                                  ; $02A47C |
  JSR code_1FF89A                           ; $02A47E |
code_02A481:
  LDX #$00                                  ; $02A481 |
code_02A483:
  LDA $52                                   ; $02A483 |
  AND #$2C                                  ; $02A485 |
  ORA $A5F5,x                               ; $02A487 |
  STA $0780,x                               ; $02A48A |
  CMP #$FF                                  ; $02A48D |
  BEQ code_02A4A0                           ; $02A48F |
  INX                                       ; $02A491 |
  LDY #$04                                  ; $02A492 |
code_02A494:
  LDA $A5F5,x                               ; $02A494 |
  STA $0780,x                               ; $02A497 |
  INX                                       ; $02A49A |
  DEY                                       ; $02A49B |
  BNE code_02A494                           ; $02A49C |
  BEQ code_02A483                           ; $02A49E |
code_02A4A0:
  LDA #$05                                  ; $02A4A0 |
  STA $00                                   ; $02A4A2 |
  LDX $B4                                   ; $02A4A4 |
  LDY #$03                                  ; $02A4A6 |
code_02A4A8:
  LDA $A2,x                                 ; $02A4A8 |
  BPL code_02A4B8                           ; $02A4AA |
  LDA $A5D8,x                               ; $02A4AC |
  STA $0780,y                               ; $02A4AF |
  LDA $A5E4,x                               ; $02A4B2 |
  STA $0781,y                               ; $02A4B5 |
code_02A4B8:
  INX                                       ; $02A4B8 |
  TYA                                       ; $02A4B9 |
  CLC                                       ; $02A4BA |
  ADC #$05                                  ; $02A4BB |
  TAY                                       ; $02A4BD |
  DEC $00                                   ; $02A4BE |
  BPL code_02A4A8                           ; $02A4C0 |
  LDA $95                                   ; $02A4C2 |
  AND #$08                                  ; $02A4C4 |
  BEQ code_02A4EB                           ; $02A4C6 |
  LDX $A1                                   ; $02A4C8 |
  BPL code_02A4E0                           ; $02A4CA |
  CPX #$FF                                  ; $02A4CC |
  BEQ code_02A4EB                           ; $02A4CE |
  LDA #$25                                  ; $02A4D0 |
  STA $07A1                                 ; $02A4D2 |
  STA $07A2                                 ; $02A4D5 |
  STA $07A6                                 ; $02A4D8 |
  STA $07A7                                 ; $02A4DB |
  BNE code_02A4EB                           ; $02A4DE |
code_02A4E0:
  LDY $A61E,x                               ; $02A4E0 |
  LDA #$25                                  ; $02A4E3 |
  STA $0780,y                               ; $02A4E5 |
  STA $0781,y                               ; $02A4E8 |
code_02A4EB:
  LDA $F8                                   ; $02A4EB |
  CMP #$0B                                  ; $02A4ED |
  BNE code_02A50A                           ; $02A4EF |
  LDY #$00                                  ; $02A4F1 |
code_02A4F3:
  LDA #$20                                  ; $02A4F3 |
  STA $0780,y                               ; $02A4F5 |
  LDA $0781,y                               ; $02A4F8 |
  SEC                                       ; $02A4FB |
  SBC #$C0                                  ; $02A4FC |
  STA $0781,y                               ; $02A4FE |
  INY                                       ; $02A501 |
  INY                                       ; $02A502 |
  INY                                       ; $02A503 |
  INY                                       ; $02A504 |
  INY                                       ; $02A505 |
  CPY #$28                                  ; $02A506 |
  BNE code_02A4F3                           ; $02A508 |
code_02A50A:
  INC $19                                   ; $02A50A |
  RTS                                       ; $02A50C |

code_02A50D:
  LDA #$1C                                  ; $02A50D |
  JSR code_1FF89A                           ; $02A50F |
  LDA $A1                                   ; $02A512 |
  ASL                                       ; $02A514 |
  TAY                                       ; $02A515 |
  LDA $52                                   ; $02A516 |
  AND #$0C                                  ; $02A518 |
  ORA $A569,y                               ; $02A51A |
  STA $0780                                 ; $02A51D |
  LDA $A56A,y                               ; $02A520 |
  STA $0781                                 ; $02A523 |
  LDA #$06                                  ; $02A526 |
  STA $0782                                 ; $02A528 |
  LDA $A2,x                                 ; $02A52B |
  AND #$1F                                  ; $02A52D |
  STA $00                                   ; $02A52F |
  LDY #$00                                  ; $02A531 |
code_02A533:
  LDX #$04                                  ; $02A533 |
  LDA $00                                   ; $02A535 |
  SEC                                       ; $02A537 |
  SBC #$04                                  ; $02A538 |
  BCS code_02A540                           ; $02A53A |
  LDX $00                                   ; $02A53C |
  LDA #$00                                  ; $02A53E |
code_02A540:
  STA $00                                   ; $02A540 |
  LDA $A5F0,x                               ; $02A542 |
  STA $0783,y                               ; $02A545 |
  INY                                       ; $02A548 |
  CPY #$07                                  ; $02A549 |
  BNE code_02A533                           ; $02A54B |
  LDA $F8                                   ; $02A54D |
  CMP #$0B                                  ; $02A54F |
  BNE code_02A561                           ; $02A551 |
  LDA #$20                                  ; $02A553 |
  STA $0780                                 ; $02A555 |
  LDA $0781                                 ; $02A558 |
  SEC                                       ; $02A55B |
  SBC #$C0                                  ; $02A55C |
  STA $0781                                 ; $02A55E |
code_02A561:
  LDA #$FF                                  ; $02A561 |
  STA $078A                                 ; $02A563 |
  STA $19                                   ; $02A566 |
  RTS                                       ; $02A568 |

  db $22, $E7, $22, $F2, $23, $27, $23, $32 ; $02A569 |
  db $23, $67, $23, $72, $00, $0D, $15, $25 ; $02A571 |
  db $2D, $38, $46, $53, $22, $C0, $1F, $30 ; $02A579 |
  db $9D, $31, $32, $23, $E8, $07, $87, $00 ; $02A581 |
  db $FF, $22, $E0, $1F, $33, $9D, $25, $34 ; $02A589 |
  db $FF, $23, $00, $1F, $33, $9A, $25, $2B ; $02A591 |
  db $00, $00, $34, $23, $F0, $07, $87, $00 ; $02A599 |
  db $FF, $23, $20, $1F, $33, $9D, $25, $34 ; $02A5A1 |
  db $FF, $23, $40, $1F, $33, $25, $38, $39 ; $02A5A9 |
  db $9A, $25, $34, $FF, $23, $60, $1F, $33 ; $02A5B1 |
  db $25, $3A, $3B, $97, $25, $2B, $00, $00 ; $02A5B9 |
  db $34, $FF, $23, $80, $1F, $33, $9D, $25 ; $02A5C1 |
  db $34, $23, $F8, $07, $87, $00, $FF, $23 ; $02A5C9 |
  db $A0, $1F, $35, $9D, $36, $37, $FF, $19 ; $02A5D1 |
  db $10, $17, $11, $16, $1D, $1C, $1B, $1C ; $02A5D9 |
  db $1B, $1C, $1B, $25, $0E, $0E, $0A, $0A ; $02A5E1 |
  db $18, $17, $0C, $19, $16, $11, $13, $24 ; $02A5E9 |
  db $2F, $2E, $2D, $2C, $22, $E5, $01, $25 ; $02A5F1 |
  db $25, $22, $F0, $01, $25, $25, $23, $25 ; $02A5F9 |
  db $01, $25, $25, $23, $30, $01, $25, $25 ; $02A601 |
  db $23, $65, $01, $25, $25, $23, $70, $01 ; $02A609 |
  db $25, $25, $23, $42, $01, $38, $39, $23 ; $02A611 |
  db $62, $01, $3A, $3B, $FF, $03, $08, $0D ; $02A619 |
  db $12, $17, $1C, $0F, $0F, $30, $15, $0F ; $02A621 |
  db $0F, $30, $37, $0F, $0F, $3C, $11, $0F ; $02A629 |
  db $0F, $30, $19, $01, $02, $07, $03, $01 ; $02A631 |
  db $07, $01, $04, $06, $02, $06, $03, $0F ; $02A639 |
  db $0F, $2C, $11, $0F, $0F, $30, $21, $0F ; $02A641 |
  db $0F, $30, $17, $0F, $0F, $10, $01, $0F ; $02A649 |
  db $0F, $10, $16, $0F, $0F, $36, $00, $0F ; $02A651 |
  db $0F, $30, $19, $0F, $0F, $30, $15, $0F ; $02A659 |
  db $0F, $30, $26, $0F, $0F, $30, $15, $0F ; $02A661 |
  db $0F, $34, $14, $0F, $0F, $30, $15, $08 ; $02A669 |
  db $F3, $02, $D0, $08, $F3, $42, $D8, $10 ; $02A671 |
  db $F4, $01, $D0, $10, $F4, $41, $D8, $20 ; $02A679 |
  db $F1, $02, $D0, $20, $F2, $02, $D8, $28 ; $02A681 |
  db $F1, $82, $D0, $28, $F2, $82, $D8, $CC ; $02A689 |
  db $CC, $CC, $CC, $DD, $DD, $EE, $EE, $FF ; $02A691 |
  db $FF, $10, $10, $21, $21, $56, $83, $5F ; $02A699 |
  db $5F, $56, $83, $BA, $BA, $56, $83, $56 ; $02A6A1 |
  db $32, $2D, $CB, $2D, $70, $A6, $A6, $A6 ; $02A6A9 |
  db $A6, $A6, $A6, $A6, $A6, $A6, $A6, $A7 ; $02A6B1 |
  db $A7, $A7, $A7, $A8, $A8, $A7, $A7, $A8 ; $02A6B9 |
  db $A8, $A7, $A7, $A8, $A8, $A8, $A7, $A8 ; $02A6C1 |
  db $A7, $A8, $A7, $08, $4F, $03, $10, $08 ; $02A6C9 |
  db $5F, $C3, $18, $10, $5F, $03, $10, $10 ; $02A6D1 |
  db $4F, $C3, $18, $FF, $08, $F8, $01, $10 ; $02A6D9 |
  db $08, $F9, $01, $18, $10, $FA, $01, $10 ; $02A6E1 |
  db $10, $FB, $01, $18, $FF, $08, $B8, $00 ; $02A6E9 |
  db $10, $08, $B9, $00, $18, $10, $BA, $00 ; $02A6F1 |
  db $10, $10, $BB, $00, $18, $FF, $08, $5E ; $02A6F9 |
  db $00, $10, $08, $6F, $00, $18, $10, $5E ; $02A701 |
  db $80, $10, $10, $6F, $80, $18, $FF, $08 ; $02A709 |
  db $BD, $00, $10, $08, $BD, $40, $18, $10 ; $02A711 |
  db $BE, $00, $10, $10, $BF, $00, $18, $FF ; $02A719 |
  db $08, $FC, $03, $10, $08, $FD, $03, $18 ; $02A721 |
  db $10, $FE, $03, $10, $10, $FF, $03, $18 ; $02A729 |
  db $FF, $0A, $DA, $41, $1C, $09, $DB, $41 ; $02A731 |
  db $14, $04, $D6, $40, $19, $04, $E0, $40 ; $02A739 |
  db $11, $04, $E1, $40, $09, $0C, $DC, $40 ; $02A741 |
  db $19, $0C, $E5, $40, $11, $0C, $E6, $40 ; $02A749 |
  db $09, $14, $E2, $40, $19, $14, $E3, $40 ; $02A751 |
  db $11, $14, $E4, $40, $09, $FF, $08, $BC ; $02A759 |
  db $01, $10, $08, $BC, $41, $18, $10, $BC ; $02A761 |
  db $81, $10, $10, $BC, $C1, $18, $FF, $13 ; $02A769 |
  db $D5, $41, $1D, $0C, $CC, $40, $20, $0C ; $02A771 |
  db $CD, $40, $18, $0C, $CE, $40, $10, $0C ; $02A779 |
  db $CF, $40, $08, $14, $D0, $40, $20, $14 ; $02A781 |
  db $D1, $40, $18, $14, $D2, $40, $10, $14 ; $02A789 |
  db $D3, $41, $08, $FF, $0F, $D5, $41, $1D ; $02A791 |
  db $08, $CC, $40, $20, $08, $CD, $40, $18 ; $02A799 |
  db $08, $CE, $40, $10, $08, $CF, $40, $08 ; $02A7A1 |
  db $10, $D0, $40, $20, $10, $D1, $40, $18 ; $02A7A9 |
  db $10, $D2, $40, $10, $10, $D4, $41, $08 ; $02A7B1 |
  db $FF, $08, $B7, $81, $10, $08, $B7, $C1 ; $02A7B9 |
  db $18, $10, $B7, $01, $10, $10, $B7, $41 ; $02A7C1 |
  db $18, $FF, $14, $F5, $41, $1D, $04, $CB ; $02A7C9 |
  db $40, $08, $0C, $C0, $40, $20, $0C, $C1 ; $02A7D1 |
  db $40, $18, $0C, $C2, $40, $10, $0C, $C3 ; $02A7D9 |
  db $40, $08, $0C, $C8, $41, $00, $14, $C4 ; $02A7E1 |
  db $40, $20, $14, $C5, $40, $18, $14, $C6 ; $02A7E9 |
  db $40, $10, $14, $C7, $40, $08, $14, $C9 ; $02A7F1 |
  db $41, $00, $1C, $CA, $41, $00, $FF, $10 ; $02A7F9 |
  db $F5, $41, $1D, $00, $CB, $40, $08, $08 ; $02A801 |
  db $C0, $40, $20, $08, $C1, $40, $18, $08 ; $02A809 |
  db $C2, $40, $10, $08, $C3, $40, $08, $10 ; $02A811 |
  db $C4, $40, $20, $10, $C5, $40, $18, $10 ; $02A819 |
  db $C6, $40, $10, $10, $F6, $40, $08, $10 ; $02A821 |
  db $F7, $41, $00, $FF, $0E, $E7, $41, $1C ; $02A829 |
  db $0E, $E8, $41, $14, $04, $E9, $40, $19 ; $02A831 |
  db $04, $EA, $40, $11, $0C, $EB, $40, $19 ; $02A839 |
  db $0C, $EC, $40, $11, $0C, $ED, $40, $09 ; $02A841 |
  db $14, $EE, $40, $19, $14, $EF, $40, $11 ; $02A849 |
  db $14, $F0, $40, $09, $FF, $0A, $DA, $41 ; $02A851 |
  db $1C, $09, $DB, $41, $14, $04, $D6, $40 ; $02A859 |
  db $19, $04, $D7, $40, $11, $04, $D8, $40 ; $02A861 |
  db $09, $0C, $DC, $40, $19, $0C, $DD, $40 ; $02A869 |
  db $11, $0C, $DE, $40, $09, $14, $E2, $40 ; $02A871 |
  db $19, $14, $E3, $40, $11, $14, $E4, $40 ; $02A879 |
  db $09, $FF, $0A, $DA, $41, $1C, $09, $DB ; $02A881 |
  db $41, $14, $04, $D6, $40, $19, $04, $D7 ; $02A889 |
  db $40, $11, $04, $D9, $40, $09, $0C, $DC ; $02A891 |
  db $40, $19, $0C, $DD, $40, $11, $0C, $DF ; $02A899 |
  db $40, $09, $14, $E2, $40, $19, $14, $E3 ; $02A8A1 |
  db $40, $11, $14, $E4, $40, $09, $FF, $08 ; $02A8A9 |
  db $00, $00, $0D, $00, $0B, $80, $44, $00 ; $02A8B1 |
  db $00, $20, $9E, $00, $00, $80, $20, $00 ; $02A8B9 |
  db $60, $08, $02, $80, $00, $00, $00, $22 ; $02A8C1 |
  db $10, $00, $00, $00, $42, $20, $80, $02 ; $02A8C9 |
  db $02, $80, $00, $20, $02, $00, $3A, $08 ; $02A8D1 |
  db $00, $00, $10, $A0, $04, $88, $C0, $00 ; $02A8D9 |
  db $02, $00, $11, $28, $B0, $0A, $0A, $08 ; $02A8E1 |
  db $40, $02, $08, $20, $01, $08, $60, $0A ; $02A8E9 |
  db $00, $00, $48, $00, $01, $00, $80, $02 ; $02A8F1 |
  db $30, $00, $00, $02, $AC, $80, $11, $00 ; $02A8F9 |
  db $00, $82, $00, $20, $9C, $08, $00, $20 ; $02A901 |
  db $00, $80, $32, $00, $20, $02, $01, $00 ; $02A909 |
  db $02, $80, $80, $00, $22, $80, $44, $00 ; $02A911 |
  db $21, $00, $29, $20, $08, $00, $00, $00 ; $02A919 |
  db $01, $08, $00, $00, $20, $80, $10, $28 ; $02A921 |
  db $00, $02, $98, $02, $08, $00, $02, $80 ; $02A929 |
  db $2C, $20, $50, $22, $06, $20, $10, $08 ; $02A931 |
  db $14, $28, $04, $00, $01, $02, $00, $00 ; $02A939 |
  db $A0, $00, $00, $80, $01, $00, $00, $00 ; $02A941 |
  db $00, $00, $20, $00, $1C, $00, $04, $00 ; $02A949 |
  db $10, $00, $04, $02, $02, $02, $00, $00 ; $02A951 |
  db $20, $20, $00, $00, $11, $22, $04, $00 ; $02A959 |
  db $08, $20, $08, $00, $29, $80, $61, $00 ; $02A961 |
  db $00, $00, $48, $00, $21, $08, $40, $08 ; $02A969 |
  db $40, $18, $32, $82, $00, $20, $01, $20 ; $02A971 |
  db $20, $00, $31, $08, $05, $A0, $18, $00 ; $02A979 |
  db $04, $02, $00, $00, $40, $22, $41, $20 ; $02A981 |
  db $20, $00, $04, $00, $60, $A8, $08, $80 ; $02A989 |
  db $00, $A2, $80, $20, $80, $00, $00, $2A ; $02A991 |
  db $20, $00, $00, $80, $04, $22, $14, $00 ; $02A999 |
  db $20, $00, $05, $88, $00, $20, $22, $0A ; $02A9A1 |
  db $00, $02, $11, $82, $11, $00, $02, $00 ; $02A9A9 |
  db $00, $20, $00, $20, $62, $00, $00, $02 ; $02A9B1 |
  db $00, $00, $88, $00, $40, $08, $00, $22 ; $02A9B9 |
  db $04, $00, $01, $02, $B0, $00, $0D, $80 ; $02A9C1 |
  db $B0, $28, $81, $20, $48, $80, $80, $00 ; $02A9C9 |
  db $41, $00, $80, $02, $2D, $02, $A0, $02 ; $02A9D1 |
  db $10, $08, $22, $20, $01, $28, $00, $20 ; $02A9D9 |
  db $04, $00, $0C, $22, $F0, $30, $10, $08 ; $02A9E1 |
  db $04, $00, $49, $00, $80, $08, $00, $00 ; $02A9E9 |
  db $2A, $0A, $56, $80, $09, $20, $5C, $00 ; $02A9F1 |
  db $A8, $C2, $59, $02, $60, $00, $15, $18 ; $02A9F9 |
  db $19, $1A, $1B, $00, $01, $02, $03, $04 ; $02AA01 |
  db $1D, $05, $06, $07, $08, $17, $09, $0A ; $02AA09 |
  db $0B, $0C, $1C, $0D, $0E, $0F, $10, $11 ; $02AA11 |
  db $12, $13, $14, $15, $16, $80, $04, $00 ; $02AA19 |
  db $00, $80, $2C, $20, $10, $02, $00, $00 ; $02AA21 |
  db $04, $02, $00, $02, $00, $20, $21, $1B ; $02AA29 |
  db $12, $12, $25, $20, $00, $20, $83, $08 ; $02AA31 |
  db $08, $00, $90, $90, $02, $20, $30, $28 ; $02AA39 |
  db $20, $62, $80, $A4, $40, $65, $80, $A0 ; $02AA41 |
  db $20, $20, $00, $20, $A0, $08, $10, $0A ; $02AA49 |
  db $14, $00, $01, $08, $00, $2A, $80, $00 ; $02AA51 |
  db $02, $00, $09, $80, $40, $00, $02, $04 ; $02AA59 |
  db $00, $16, $00, $03, $01, $03, $01, $33 ; $02AA61 |
  db $01, $09, $01, $33, $01, $02, $01, $0B ; $02AA69 |
  db $01, $00, $02, $27, $02, $00, $40, $20 ; $02AA71 |
  db $01, $22, $10, $00, $20, $02, $02, $4C ; $02AA79 |
  db $4E, $0F, $20, $10, $00, $0F, $10, $00 ; $02AA81 |
  db $07, $0F, $36, $27, $07, $0F, $31, $21 ; $02AA89 |
  db $11, $82, $83, $00, $00, $0F, $31, $11 ; $02AA91 |
  db $00, $0F, $31, $15, $17, $0F, $22, $12 ; $02AA99 |
  db $12, $0F, $20, $10, $17, $84, $85, $86 ; $02AAA1 |
  db $00, $0F, $31, $11, $00, $0F, $31, $15 ; $02AAA9 |
  db $17, $0F, $22, $12, $12, $0F, $2C, $0B ; $02AAB1 |
  db $09, $84, $85, $86, $00, $0F, $31, $11 ; $02AAB9 |
  db $00, $0F, $31, $15, $17, $0F, $22, $12 ; $02AAC1 |
  db $12, $0F, $31, $21, $11, $84, $85, $86 ; $02AAC9 |
  db $00, $80, $0B, $00, $20, $08, $09, $08 ; $02AAD1 |
  db $00, $00, $01, $20, $40, $20, $28, $00 ; $02AAD9 |
  db $10, $00, $24, $80, $48, $02, $40, $08 ; $02AAE1 |
  db $08, $80, $40, $20, $12, $08, $01, $06 ; $02AAE9 |
  db $09, $00, $23, $A0, $11, $8A, $00, $14 ; $02AAF1 |
  db $1C, $FF, $69, $A0, $66, $20, $23, $01 ; $02AAF9 |
  db $02, $02, $02, $03, $03, $03, $04, $04 ; $02AB01 |
  db $04, $05, $05, $06, $06, $06, $07, $07 ; $02AB09 |
  db $07, $08, $08, $08, $09, $09, $0A, $0A ; $02AB11 |
  db $0B, $0E, $0F, $10, $10, $10, $12, $12 ; $02AB19 |
  db $12, $13, $15, $15, $16, $16, $16, $16 ; $02AB21 |
  db $17, $17, $17, $17, $17, $18, $18, $18 ; $02AB29 |
  db $18, $18, $19, $19, $19, $19, $19, $19 ; $02AB31 |
  db $1A, $1A, $1B, $1D, $FF, $00, $48, $00 ; $02AB39 |
  db $00, $80, $20, $02, $00, $00, $2A, $28 ; $02AB41 |
  db $2A, $00, $02, $00, $00, $00, $82, $00 ; $02AB49 |
  db $02, $80, $86, $02, $14, $00, $00, $00 ; $02AB51 |
  db $40, $80, $06, $02, $22, $8A, $60, $00 ; $02AB59 |
  db $04, $22, $10, $20, $C0, $08, $84, $00 ; $02AB61 |
  db $21, $04, $00, $02, $00, $88, $C5, $00 ; $02AB69 |
  db $02, $A2, $11, $00, $01, $08, $64, $00 ; $02AB71 |
  db $10, $00, $90, $00, $20, $02, $10, $00 ; $02AB79 |
  db $0A, $00, $01, $00, $0E, $20, $70, $00 ; $02AB81 |
  db $02, $00, $10, $00, $02, $20, $40, $08 ; $02AB89 |
  db $15, $02, $50, $00, $30, $00, $80, $20 ; $02AB91 |
  db $1C, $A0, $00, $08, $00, $82, $00, $00 ; $02AB99 |
  db $08, $80, $0C, $00, $04, $00, $80, $20 ; $02ABA1 |
  db $00, $00, $00, $08, $00, $02, $08, $08 ; $02ABA9 |
  db $0A, $00, $00, $08, $4A, $80, $00, $00 ; $02ABB1 |
  db $00, $80, $51, $00, $04, $00, $60, $23 ; $02ABB9 |
  db $3C, $00, $00, $0A, $40, $A2, $10, $20 ; $02ABC1 |
  db $00, $00, $80, $00, $80, $00, $E5, $08 ; $02ABC9 |
  db $13, $20, $12, $20, $51, $00, $41, $28 ; $02ABD1 |
  db $00, $08, $10, $82, $00, $02, $11, $00 ; $02ABD9 |
  db $00, $0A, $41, $02, $C0, $80, $16, $00 ; $02ABE1 |
  db $80, $20, $02, $00, $20, $82, $17, $00 ; $02ABE9 |
  db $0E, $00, $34, $20, $40, $02, $44, $82 ; $02ABF1 |
  db $B2, $08, $E0, $08, $20, $00, $30, $58 ; $02ABF9 |
  db $18, $34, $B8, $28, $78, $88, $28, $48 ; $02AC01 |
  db $A8, $48, $A8, $68, $88, $98, $18, $68 ; $02AC09 |
  db $C8, $38, $58, $88, $80, $80, $48, $B8 ; $02AC11 |
  db $90, $30, $E8, $68, $C0, $D8, $18, $20 ; $02AC19 |
  db $D8, $40, $F0, $F8, $98, $A8, $F0, $F8 ; $02AC21 |
  db $08, $78, $88, $C8, $F8, $68, $88, $C8 ; $02AC29 |
  db $D8, $F8, $48, $78, $A8, $C8, $E7, $E8 ; $02AC31 |
  db $2C, $4C, $A8, $D8, $FF, $01, $00, $08 ; $02AC39 |
  db $00, $00, $00, $00, $00, $41, $00, $03 ; $02AC41 |
  db $01, $00, $00, $20, $00, $00, $00, $00 ; $02AC49 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AC51 |
  db $10, $00, $00, $04, $10, $00, $00, $08 ; $02AC59 |
  db $00, $18, $00, $40, $00, $08, $10, $20 ; $02AC61 |
  db $40, $1A, $00, $00, $00, $0C, $00, $44 ; $02AC69 |
  db $00, $20, $00, $20, $00, $00, $41, $08 ; $02AC71 |
  db $00, $00, $00, $00, $00, $00, $00, $20 ; $02AC79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AC81 |
  db $00, $00, $00, $00, $41, $00, $04, $00 ; $02AC89 |
  db $00, $00, $01, $00, $00, $00, $00, $00 ; $02AC91 |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $02AC99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02ACA1 |
  db $01, $40, $00, $00, $00, $00, $00, $00 ; $02ACA9 |
  db $00, $40, $40, $30, $00, $00, $10, $01 ; $02ACB1 |
  db $00, $80, $00, $00, $00, $48, $00, $00 ; $02ACB9 |
  db $00, $00, $04, $00, $00, $02, $00, $08 ; $02ACC1 |
  db $00, $00, $00, $00, $04, $00, $00, $00 ; $02ACC9 |
  db $00, $00, $10, $10, $00, $20, $00, $00 ; $02ACD1 |
  db $00, $28, $00, $00, $00, $00, $00, $00 ; $02ACD9 |
  db $00, $10, $00, $44, $00, $80, $00, $84 ; $02ACE1 |
  db $00, $00, $10, $08, $00, $00, $00, $00 ; $02ACE9 |
  db $10, $49, $04, $02, $40, $14, $00, $00 ; $02ACF1 |
  db $11, $40, $00, $00, $00, $01, $00, $38 ; $02ACF9 |
  db $58, $B4, $48, $58, $A4, $38, $68, $A8 ; $02AD01 |
  db $94, $98, $68, $88, $A8, $B4, $58, $78 ; $02AD09 |
  db $98, $68, $48, $94, $00, $B0, $38, $58 ; $02AD11 |
  db $47, $48, $18, $18, $9C, $18, $18, $9C ; $02AD19 |
  db $18, $48, $D8, $C8, $C8, $18, $D8, $C8 ; $02AD21 |
  db $88, $C8, $18, $18, $C8, $C8, $18, $C8 ; $02AD29 |
  db $88, $18, $18, $C8, $C8, $18, $C8, $38 ; $02AD31 |
  db $58, $78, $A8, $00, $FF, $00, $00, $04 ; $02AD39 |
  db $04, $00, $10, $00, $00, $00, $00, $80 ; $02AD41 |
  db $00, $0C, $10, $00, $00, $00, $00, $80 ; $02AD49 |
  db $00, $50, $00, $00, $00, $04, $00, $00 ; $02AD51 |
  db $04, $80, $00, $00, $00, $00, $00, $00 ; $02AD59 |
  db $00, $44, $40, $00, $00, $80, $00, $00 ; $02AD61 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AD69 |
  db $01, $01, $00, $00, $44, $03, $04, $40 ; $02AD71 |
  db $00, $00, $00, $02, $00, $00, $41, $00 ; $02AD79 |
  db $00, $00, $00, $10, $00, $00, $00, $00 ; $02AD81 |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $02AD89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AD91 |
  db $00, $00, $10, $00, $00, $00, $00, $00 ; $02AD99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02ADA1 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $02ADA9 |
  db $01, $00, $00, $00, $04, $00, $00, $00 ; $02ADB1 |
  db $00, $00, $04, $00, $10, $4C, $00, $04 ; $02ADB9 |
  db $00, $40, $00, $00, $40, $01, $00, $00 ; $02ADC1 |
  db $00, $00, $00, $80, $00, $00, $00, $00 ; $02ADC9 |
  db $00, $00, $40, $00, $00, $00, $00, $00 ; $02ADD1 |
  db $00, $00, $00, $00, $00, $10, $00, $08 ; $02ADD9 |
  db $10, $10, $00, $20, $00, $00, $00, $04 ; $02ADE1 |
  db $00, $80, $00, $40, $00, $00, $00, $00 ; $02ADE9 |
  db $01, $00, $00, $00, $10, $00, $00, $50 ; $02ADF1 |
  db $00, $80, $00, $00, $00, $00, $00, $18 ; $02ADF9 |
  db $18, $3B, $18, $18, $3B, $18, $18, $18 ; $02AE01 |
  db $3B, $18, $18, $18, $18, $3B, $18, $18 ; $02AE09 |
  db $18, $18, $18, $3B, $78, $74, $55, $50 ; $02AE11 |
  db $56, $52, $08, $08, $1C, $08, $08, $1C ; $02AE19 |
  db $08, $50, $55, $1A, $1A, $08, $54, $1A ; $02AE21 |
  db $52, $1A, $08, $08, $1A, $1A, $08, $1A ; $02AE29 |
  db $52, $08, $08, $1A, $1A, $08, $1A, $54 ; $02AE31 |
  db $26, $26, $13, $49, $FF, $08, $00, $00 ; $02AE39 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AE41 |
  db $00, $00, $00, $00, $04, $00, $00, $00 ; $02AE49 |
  db $00, $00, $00, $00, $00, $00, $00, $88 ; $02AE51 |
  db $10, $20, $00, $08, $04, $04, $00, $00 ; $02AE59 |
  db $00, $00, $00, $20, $00, $40, $00, $20 ; $02AE61 |
  db $00, $90, $00, $00, $40, $00, $00, $00 ; $02AE69 |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $02AE71 |
  db $01, $00, $00, $08, $01, $18, $00, $00 ; $02AE79 |
  db $00, $00, $00, $80, $00, $20, $10, $00 ; $02AE81 |
  db $00, $00, $00, $80, $00, $00, $10, $00 ; $02AE89 |
  db $00, $00, $00, $00, $00, $03, $00, $00 ; $02AE91 |
  db $00, $00, $40, $00, $40, $00, $00, $00 ; $02AE99 |
  db $00, $00, $00, $08, $00, $20, $00, $00 ; $02AEA1 |
  db $00, $00, $00, $00, $00, $00, $00, $40 ; $02AEA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AEB1 |
  db $40, $00, $00, $00, $00, $00, $00, $00 ; $02AEB9 |
  db $01, $10, $00, $00, $00, $00, $00, $00 ; $02AEC1 |
  db $00, $00, $00, $00, $00, $04, $00, $00 ; $02AEC9 |
  db $01, $00, $00, $A0, $00, $00, $00, $80 ; $02AED1 |
  db $00, $00, $00, $00, $00, $01, $00, $01 ; $02AED9 |
  db $00, $10, $01, $00, $00, $20, $00, $00 ; $02AEE1 |
  db $10, $00, $00, $00, $00, $10, $00, $28 ; $02AEE9 |
  db $00, $09, $00, $00, $00, $01, $41, $20 ; $02AEF1 |
  db $04, $15, $00, $00, $10, $83, $00, $00 ; $02AEF9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF01 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF09 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF11 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF19 |
  db $00, $00, $00, $00, $00, $00, $00, $01 ; $02AF21 |
  db $01, $00, $00, $00, $02, $00, $03, $04 ; $02AF29 |
  db $05, $02, $06, $07, $08, $09, $0A, $0B ; $02AF31 |
  db $0C, $0C, $0D, $0B, $0D, $0E, $0F, $00 ; $02AF39 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF41 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF49 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF51 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF59 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF61 |
  db $00, $01, $01, $03, $00, $10, $00, $00 ; $02AF69 |
  db $02, $11, $12, $13, $02, $0C, $00, $00 ; $02AF71 |
  db $0C, $0D, $0B, $0B, $14, $15, $00, $00 ; $02AF79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AF99 |
  db $00, $00, $00, $00, $00, $00, $00, $10 ; $02AFA1 |
  db $03, $00, $00, $00, $00, $01, $10, $0C ; $02AFA9 |
  db $16, $09, $02, $01, $00, $17, $18, $0C ; $02AFB1 |
  db $19, $0E, $15, $0A, $00, $0C, $1A, $00 ; $02AFB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AFC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AFC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AFD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AFD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02AFE1 |
  db $03, $03, $00, $00, $01, $07, $00, $00 ; $02AFE9 |
  db $17, $13, $02, $01, $17, $0B, $00, $00 ; $02AFF1 |
  db $0C, $0B, $14, $0F, $0C, $0B, $00, $00 ; $02AFF9 |
  db $00, $00, $00, $00, $00, $00, $1B, $00 ; $02B001 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B009 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B011 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B019 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B021 |
  db $00, $1C, $01, $01, $00, $00, $00, $10 ; $02B029 |
  db $1D, $1E, $04, $11, $07, $10, $02, $0C ; $02B031 |
  db $0D, $0B, $0B, $0D, $0B, $14, $15, $1F ; $02B039 |
  db $20, $21, $22, $22, $23, $1F, $20, $24 ; $02B041 |
  db $25, $22, $22, $22, $26, $24, $25, $1F ; $02B049 |
  db $20, $21, $27, $22, $22, $28, $20, $24 ; $02B051 |
  db $25, $26, $00, $27, $26, $24, $25, $1F ; $02B059 |
  db $29, $00, $00, $2A, $22, $2B, $2C, $24 ; $02B061 |
  db $25, $26, $00, $2D, $22, $22, $22, $1F ; $02B069 |
  db $20, $2E, $1F, $20, $2E, $1F, $20, $24 ; $02B071 |
  db $25, $26, $24, $25, $26, $24, $25, $2E ; $02B079 |
  db $1F, $20, $2E, $1F, $20, $2E, $1F, $26 ; $02B081 |
  db $24, $25, $26, $22, $2F, $00, $30, $2E ; $02B089 |
  db $31, $22, $32, $33, $34, $30, $35, $26 ; $02B091 |
  db $24, $36, $37, $38, $38, $39, $38, $22 ; $02B099 |
  db $22, $3A, $3B, $38, $38, $38, $3C, $22 ; $02B0A1 |
  db $22, $2B, $37, $24, $25, $26, $24, $2E ; $02B0A9 |
  db $1F, $20, $2E, $1F, $20, $2E, $1F, $26 ; $02B0B1 |
  db $24, $25, $26, $24, $25, $26, $24, $20 ; $02B0B9 |
  db $2E, $1F, $20, $2E, $1F, $3D, $23, $25 ; $02B0C1 |
  db $26, $24, $25, $26, $00, $3E, $26, $3F ; $02B0C9 |
  db $2E, $1F, $29, $40, $00, $3E, $23, $38 ; $02B0D1 |
  db $38, $24, $38, $41, $00, $2C, $26, $00 ; $02B0D9 |
  db $38, $38, $38, $00, $42, $22, $23, $25 ; $02B0E1 |
  db $26, $24, $25, $26, $24, $25, $26, $20 ; $02B0E9 |
  db $2E, $1F, $20, $2E, $1F, $20, $2E, $25 ; $02B0F1 |
  db $26, $24, $25, $26, $24, $25, $26, $29 ; $02B0F9 |
  db $43, $1F, $20, $2E, $1F, $20, $2E, $25 ; $02B101 |
  db $44, $39, $22, $2B, $2F, $22, $26, $29 ; $02B109 |
  db $45, $39, $46, $22, $2B, $2D, $23, $25 ; $02B111 |
  db $44, $47, $2A, $22, $22, $22, $26, $29 ; $02B119 |
  db $38, $47, $00, $22, $22, $48, $23, $25 ; $02B121 |
  db $38, $38, $47, $46, $49, $00, $26, $20 ; $02B129 |
  db $2E, $1F, $20, $2E, $1F, $4A, $23, $4B ; $02B131 |
  db $4C, $4D, $4B, $4C, $4D, $4E, $4C, $1F ; $02B139 |
  db $29, $2F, $22, $36, $00, $00, $2D, $49 ; $02B141 |
  db $25, $00, $27, $22, $2B, $2C, $22, $00 ; $02B149 |
  db $4F, $00, $2A, $22, $22, $22, $22, $24 ; $02B151 |
  db $25, $00, $2D, $22, $22, $22, $22, $1F ; $02B159 |
  db $29, $2D, $22, $49, $22, $22, $36, $24 ; $02B161 |
  db $25, $22, $49, $46, $22, $22, $00, $1F ; $02B169 |
  db $20, $2E, $1F, $20, $2E, $1F, $20, $24 ; $02B171 |
  db $25, $26, $24, $25, $26, $24, $25, $22 ; $02B179 |
  db $22, $49, $00, $00, $00, $27, $22, $22 ; $02B181 |
  db $48, $00, $00, $00, $00, $00, $2A, $36 ; $02B189 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B191 |
  db $00, $00, $00, $00, $50, $51, $00, $00 ; $02B199 |
  db $00, $00, $00, $00, $52, $53, $00, $00 ; $02B1A1 |
  db $00, $00, $00, $00, $54, $55, $00, $2E ; $02B1A9 |
  db $1F, $20, $2E, $1F, $20, $2E, $1F, $26 ; $02B1B1 |
  db $24, $25, $26, $24, $25, $26, $24, $22 ; $02B1B9 |
  db $23, $1F, $29, $22, $22, $22, $48, $27 ; $02B1C1 |
  db $56, $24, $22, $22, $49, $00, $00, $2A ; $02B1C9 |
  db $57, $22, $22, $36, $00, $00, $00, $00 ; $02B1D1 |
  db $26, $58, $22, $00, $00, $00, $00, $59 ; $02B1D9 |
  db $23, $31, $48, $00, $00, $00, $00, $25 ; $02B1E1 |
  db $26, $24, $00, $00, $00, $00, $00, $20 ; $02B1E9 |
  db $2E, $1F, $20, $2E, $1F, $20, $2E, $25 ; $02B1F1 |
  db $26, $24, $25, $26, $24, $25, $26, $00 ; $02B1F9 |
  db $2F, $22, $3A, $2D, $22, $22, $3F, $00 ; $02B201 |
  db $00, $46, $22, $22, $49, $27, $25, $00 ; $02B209 |
  db $00, $00, $2A, $22, $2B, $3A, $3F, $50 ; $02B211 |
  db $51, $00, $00, $27, $22, $22, $25, $52 ; $02B219 |
  db $53, $00, $00, $2C, $22, $48, $3F, $54 ; $02B221 |
  db $55, $00, $2C, $2D, $26, $00, $25, $1F ; $02B229 |
  db $20, $2E, $1F, $20, $21, $00, $3F, $4D ; $02B231 |
  db $4B, $4C, $4D, $4B, $4C, $00, $4C, $21 ; $02B239 |
  db $00, $23, $1F, $20, $2E, $5A, $49, $26 ; $02B241 |
  db $00, $2F, $22, $22, $22, $49, $00, $21 ; $02B249 |
  db $00, $00, $00, $2F, $00, $00, $00, $26 ; $02B251 |
  db $2B, $00, $00, $00, $00, $00, $00, $21 ; $02B259 |
  db $22, $36, $00, $00, $00, $00, $00, $26 ; $02B261 |
  db $24, $25, $26, $5B, $5B, $5B, $5B, $2E ; $02B269 |
  db $1F, $20, $21, $5C, $5D, $5E, $5C, $26 ; $02B271 |
  db $24, $25, $26, $24, $25, $26, $24, $00 ; $02B279 |
  db $00, $27, $22, $2B, $2C, $22, $49, $00 ; $02B281 |
  db $00, $2A, $22, $22, $49, $48, $00, $00 ; $02B289 |
  db $00, $00, $2A, $48, $00, $00, $00, $00 ; $02B291 |
  db $00, $00, $00, $00, $00, $5F, $00, $00 ; $02B299 |
  db $60, $4F, $00, $61, $00, $00, $00, $5B ; $02B2A1 |
  db $5B, $5B, $5B, $5B, $5B, $5B, $5B, $62 ; $02B2A9 |
  db $62, $62, $62, $62, $62, $62, $62, $62 ; $02B2B1 |
  db $62, $62, $62, $62, $62, $62, $25, $22 ; $02B2B9 |
  db $22, $22, $22, $22, $49, $49, $2F, $00 ; $02B2C1 |
  db $27, $22, $27, $49, $48, $00, $00, $63 ; $02B2C9 |
  db $00, $48, $00, $00, $00, $00, $00, $00 ; $02B2D1 |
  db $00, $59, $00, $64, $00, $65, $00, $66 ; $02B2D9 |
  db $00, $00, $00, $00, $00, $00, $00, $5B ; $02B2E1 |
  db $5B, $5B, $5B, $5B, $5B, $5B, $5B, $62 ; $02B2E9 |
  db $62, $62, $62, $62, $62, $62, $62, $62 ; $02B2F1 |
  db $62, $62, $62, $62, $62, $62, $26, $22 ; $02B2F9 |
  db $22, $67, $1F, $20, $2E, $1F, $20, $00 ; $02B301 |
  db $2F, $68, $25, $22, $49, $49, $00, $69 ; $02B309 |
  db $00, $5F, $00, $2A, $00, $00, $00, $00 ; $02B311 |
  db $00, $00, $00, $00, $6A, $00, $6B, $5F ; $02B319 |
  db $00, $65, $00, $6C, $00, $00, $00, $5B ; $02B321 |
  db $5B, $5B, $5B, $5B, $5B, $5B, $5B, $62 ; $02B329 |
  db $62, $62, $62, $62, $62, $62, $62, $62 ; $02B331 |
  db $62, $62, $62, $62, $62, $62, $62, $2E ; $02B339 |
  db $1F, $20, $2E, $1F, $20, $2E, $1F, $00 ; $02B341 |
  db $00, $2F, $22, $22, $25, $22, $22, $00 ; $02B349 |
  db $00, $00, $00, $27, $22, $22, $22, $00 ; $02B351 |
  db $4F, $6C, $00, $00, $2F, $48, $48, $00 ; $02B359 |
  db $00, $00, $6D, $00, $66, $63, $00, $5B ; $02B361 |
  db $5B, $5B, $5B, $5B, $5B, $5B, $5B, $62 ; $02B369 |
  db $62, $62, $62, $62, $62, $62, $62, $62 ; $02B371 |
  db $62, $62, $62, $62, $62, $62, $62, $20 ; $02B379 |
  db $2E, $1F, $20, $2E, $31, $6E, $2E, $22 ; $02B381 |
  db $22, $22, $49, $00, $00, $6F, $00, $22 ; $02B389 |
  db $27, $48, $00, $00, $00, $00, $6C, $00 ; $02B391 |
  db $00, $00, $00, $00, $00, $70, $00, $71 ; $02B399 |
  db $65, $00, $63, $00, $71, $00, $00, $5B ; $02B3A1 |
  db $5B, $5B, $5B, $5B, $5B, $5B, $5B, $62 ; $02B3A9 |
  db $62, $62, $62, $62, $62, $62, $62, $62 ; $02B3B1 |
  db $62, $62, $62, $62, $62, $62, $62, $29 ; $02B3B9 |
  db $43, $1F, $20, $2E, $1F, $20, $2E, $25 ; $02B3C1 |
  db $00, $27, $22, $25, $24, $25, $26, $29 ; $02B3C9 |
  db $00, $00, $27, $22, $28, $20, $2E, $25 ; $02B3D1 |
  db $26, $42, $22, $22, $22, $25, $26, $20 ; $02B3D9 |
  db $2E, $31, $22, $49, $2F, $22, $23, $25 ; $02B3E1 |
  db $26, $24, $25, $00, $00, $00, $26, $20 ; $02B3E9 |
  db $2E, $1F, $20, $2E, $31, $72, $2E, $4B ; $02B3F1 |
  db $4C, $4D, $4B, $4C, $4D, $73, $4C, $20 ; $02B3F9 |
  db $2E, $1F, $20, $2E, $1F, $20, $2E, $25 ; $02B401 |
  db $22, $2B, $3A, $27, $3A, $25, $26, $29 ; $02B409 |
  db $00, $27, $22, $22, $22, $3F, $2E, $25 ; $02B411 |
  db $74, $24, $22, $22, $49, $25, $26, $29 ; $02B419 |
  db $43, $31, $27, $22, $2B, $00, $75, $25 ; $02B421 |
  db $76, $24, $00, $27, $22, $2B, $75, $29 ; $02B429 |
  db $43, $1F, $20, $2E, $1F, $20, $2E, $4B ; $02B431 |
  db $76, $4D, $4B, $4C, $4D, $4B, $4C, $1F ; $02B439 |
  db $20, $2E, $1F, $20, $2E, $1F, $20, $24 ; $02B441 |
  db $25, $26, $24, $25, $26, $24, $25, $1F ; $02B449 |
  db $20, $2E, $1F, $20, $2E, $1F, $20, $24 ; $02B451 |
  db $25, $26, $24, $25, $26, $24, $25, $77 ; $02B459 |
  db $2D, $22, $27, $22, $36, $78, $75, $79 ; $02B461 |
  db $22, $48, $2A, $22, $22, $48, $75, $1F ; $02B469 |
  db $20, $2E, $1F, $20, $2E, $1F, $20, $24 ; $02B471 |
  db $25, $26, $24, $25, $26, $24, $25, $2E ; $02B479 |
  db $1F, $20, $2E, $1F, $20, $2E, $1F, $7A ; $02B481 |
  db $7B, $7B, $7B, $7B, $7B, $7B, $7C, $7D ; $02B489 |
  db $7E, $7E, $7E, $7E, $7E, $7E, $7F, $80 ; $02B491 |
  db $7E, $7E, $7E, $7E, $7E, $7E, $81, $82 ; $02B499 |
  db $7E, $7E, $7E, $7E, $7E, $7E, $7F, $83 ; $02B4A1 |
  db $7E, $7E, $7E, $7E, $7E, $7E, $81, $2E ; $02B4A9 |
  db $1F, $20, $2E, $1F, $20, $2E, $1F, $26 ; $02B4B1 |
  db $24, $25, $26, $24, $25, $26, $24, $20 ; $02B4B9 |
  db $2E, $1F, $20, $2E, $1F, $20, $2E, $25 ; $02B4C1 |
  db $2A, $22, $2B, $37, $38, $47, $00, $29 ; $02B4C9 |
  db $6B, $22, $49, $30, $38, $38, $40, $25 ; $02B4D1 |
  db $22, $22, $00, $35, $38, $25, $26, $29 ; $02B4D9 |
  db $2A, $22, $36, $84, $28, $20, $2E, $25 ; $02B4E1 |
  db $00, $46, $22, $26, $24, $25, $26, $29 ; $02B4E9 |
  db $85, $1F, $20, $2E, $1F, $20, $2E, $4B ; $02B4F1 |
  db $76, $4D, $4B, $4C, $4D, $4B, $4C, $00 ; $02B4F9 |
  db $86, $00, $00, $87, $86, $00, $00, $00 ; $02B501 |
  db $88, $00, $89, $8A, $00, $87, $00, $8A ; $02B509 |
  db $00, $8B, $00, $00, $00, $00, $00, $00 ; $02B511 |
  db $00, $88, $8A, $00, $89, $86, $00, $8C ; $02B519 |
  db $00, $00, $00, $8D, $00, $00, $00, $10 ; $02B521 |
  db $01, $10, $01, $10, $10, $03, $00, $0C ; $02B529 |
  db $0F, $14, $04, $0C, $15, $05, $02, $0C ; $02B531 |
  db $8E, $19, $0B, $0C, $0B, $0C, $0C, $8F ; $02B539 |
  db $00, $00, $00, $00, $00, $8F, $00, $00 ; $02B541 |
  db $90, $89, $91, $92, $93, $00, $00, $8A ; $02B549 |
  db $00, $00, $94, $95, $96, $86, $8A, $00 ; $02B551 |
  db $8B, $97, $98, $99, $9A, $00, $00, $89 ; $02B559 |
  db $00, $8A, $00, $00, $8A, $89, $00, $00 ; $02B561 |
  db $00, $1C, $01, $01, $00, $03, $00, $01 ; $02B569 |
  db $10, $0C, $0F, $05, $01, $9B, $02, $14 ; $02B571 |
  db $15, $0C, $9C, $0C, $0A, $0B, $0C, $00 ; $02B579 |
  db $00, $00, $00, $88, $00, $00, $00, $8B ; $02B581 |
  db $86, $8B, $00, $00, $8A, $88, $00, $8A ; $02B589 |
  db $00, $00, $86, $90, $00, $00, $89, $00 ; $02B591 |
  db $88, $86, $00, $00, $88, $9D, $00, $00 ; $02B599 |
  db $00, $00, $8A, $00, $00, $00, $00, $00 ; $02B5A1 |
  db $00, $1C, $03, $03, $00, $00, $03, $06 ; $02B5A9 |
  db $9E, $0C, $16, $9B, $10, $02, $9F, $0D ; $02B5B1 |
  db $0B, $0C, $0D, $0B, $0C, $0C, $0E, $00 ; $02B5B9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B5C1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B5C9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B5D1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B5D9 |
  db $00, $00, $00, $00, $00, $00, $00, $10 ; $02B5E1 |
  db $01, $10, $03, $00, $1C, $03, $02, $15 ; $02B5E9 |
  db $14, $15, $9F, $00, $0C, $11, $1E, $0B ; $02B5F1 |
  db $0D, $0B, $0E, $00, $0C, $0D, $0B, $1F ; $02B5F9 |
  db $20, $2E, $1F, $20, $21, $00, $3F, $24 ; $02B601 |
  db $49, $27, $22, $27, $49, $00, $25, $31 ; $02B609 |
  db $A0, $A1, $2B, $00, $00, $00, $3F, $24 ; $02B611 |
  db $27, $22, $22, $48, $00, $24, $25, $31 ; $02B619 |
  db $2A, $49, $00, $00, $23, $1F, $20, $24 ; $02B621 |
  db $00, $00, $00, $25, $26, $24, $25, $31 ; $02B629 |
  db $00, $23, $1F, $20, $2E, $1F, $20, $4D ; $02B631 |
  db $00, $4C, $4D, $4B, $4C, $4D, $4C, $00 ; $02B639 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B641 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B649 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B651 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B659 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B661 |
  db $00, $00, $A2, $A3, $00, $00, $00, $01 ; $02B669 |
  db $09, $02, $A4, $A5, $06, $07, $02, $0A ; $02B671 |
  db $0E, $0C, $A4, $A5, $0D, $0B, $0C, $00 ; $02B679 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B681 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B689 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B691 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B699 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6A1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6A9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6B1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6B9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6C1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6C9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6D1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6D9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6E1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6E9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6F1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B6F9 |
  db $00, $00, $00, $70, $71, $78, $79, $70 ; $02B701 |
  db $72, $78, $7A, $00, $00, $70, $71, $71 ; $02B709 |
  db $79, $79, $7B, $78, $7B, $78, $7A, $70 ; $02B711 |
  db $71, $78, $70, $70, $72, $71, $7A, $78 ; $02B719 |
  db $7A, $78, $70, $70, $71, $71, $79, $78 ; $02B721 |
  db $79, $78, $79, $79, $7A, $79, $7A, $78 ; $02B729 |
  db $7A, $78, $7A, $78, $78, $78, $78, $79 ; $02B731 |
  db $79, $79, $79, $71, $79, $79, $79, $70 ; $02B739 |
  db $71, $78, $7B, $78, $7B, $78, $70, $78 ; $02B741 |
  db $79, $71, $7B, $71, $7B, $79, $7A, $78 ; $02B749 |
  db $70, $78, $78, $71, $7A, $79, $7A, $78 ; $02B751 |
  db $79, $78, $70, $78, $79, $78, $7B, $72 ; $02B759 |
  db $7A, $7A, $7A, $71, $78, $79, $78, $7A ; $02B761 |
  db $7A, $7A, $7A, $60, $60, $00, $00, $00 ; $02B769 |
  db $00, $70, $72, $70, $72, $78, $70, $78 ; $02B771 |
  db $7A, $71, $7A, $11, $12, $19, $1A, $13 ; $02B779 |
  db $14, $1B, $1C, $15, $16, $1D, $16, $20 ; $02B781 |
  db $21, $28, $29, $1F, $10, $1F, $18, $14 ; $02B789 |
  db $15, $1C, $1D, $10, $11, $18, $19, $12 ; $02B791 |
  db $13, $1A, $1B, $20, $21, $00, $29, $16 ; $02B799 |
  db $12, $16, $1A, $13, $1F, $1B, $1F, $00 ; $02B7A1 |
  db $21, $00, $00, $20, $00, $28, $29, $00 ; $02B7A9 |
  db $00, $00, $29, $00, $21, $28, $29, $15 ; $02B7B1 |
  db $10, $1D, $18, $20, $21, $00, $00, $00 ; $02B7B9 |
  db $00, $00, $09, $11, $17, $19, $17, $1F ; $02B7C1 |
  db $16, $1F, $16, $00, $00, $16, $17, $09 ; $02B7C9 |
  db $00, $09, $00, $00, $09, $09, $09, $20 ; $02B7D1 |
  db $00, $28, $00, $00, $09, $00, $00, $09 ; $02B7D9 |
  db $09, $09, $09, $09, $09, $09, $00, $00 ; $02B7E1 |
  db $00, $28, $00, $09, $09, $00, $09, $09 ; $02B7E9 |
  db $09, $16, $17, $13, $07, $1B, $07, $00 ; $02B7F1 |
  db $07, $00, $07, $17, $14, $17, $1C, $00 ; $02B7F9 |
  db $00, $09, $00, $09, $00, $00, $00, $00 ; $02B801 |
  db $00, $28, $29, $07, $10, $07, $18, $07 ; $02B809 |
  db $09, $07, $09, $07, $09, $07, $00, $00 ; $02B811 |
  db $21, $00, $29, $09, $00, $09, $09, $20 ; $02B819 |
  db $00, $00, $00, $20, $21, $28, $00, $13 ; $02B821 |
  db $0F, $1B, $07, $16, $16, $16, $16, $17 ; $02B829 |
  db $17, $17, $17, $1F, $1F, $1F, $1F, $16 ; $02B831 |
  db $07, $16, $07, $17, $1F, $00, $00, $00 ; $02B839 |
  db $00, $00, $3A, $00, $00, $3B, $00, $24 ; $02B841 |
  db $25, $2C, $2D, $26, $27, $2E, $2F, $34 ; $02B849 |
  db $35, $3C, $3D, $36, $37, $3E, $3F, $20 ; $02B851 |
  db $17, $28, $17, $20, $16, $00, $29, $20 ; $02B859 |
  db $21, $1F, $1F, $00, $00, $17, $1F, $11 ; $02B861 |
  db $21, $19, $29, $00, $00, $22, $23, $2A ; $02B869 |
  db $2B, $16, $17, $2A, $2B, $17, $1F, $2A ; $02B871 |
  db $2B, $1F, $16, $00, $00, $17, $00, $1F ; $02B879 |
  db $16, $00, $00, $00, $16, $00, $00, $2A ; $02B881 |
  db $2B, $2A, $2B, $00, $00, $00, $16, $16 ; $02B889 |
  db $17, $00, $00, $00, $1F, $00, $00, $1F ; $02B891 |
  db $00, $00, $00, $20, $10, $28, $18, $20 ; $02B899 |
  db $1F, $28, $1F, $00, $00, $16, $00, $00 ; $02B8A1 |
  db $00, $00, $17, $00, $00, $1F, $16, $16 ; $02B8A9 |
  db $00, $00, $00, $00, $17, $00, $00, $07 ; $02B8B1 |
  db $14, $07, $1C, $07, $00, $00, $00, $00 ; $02B8B9 |
  db $00, $00, $1F, $17, $00, $00, $00, $0F ; $02B8C1 |
  db $14, $07, $1C, $07, $16, $07, $16, $0F ; $02B8C9 |
  db $17, $07, $17, $00, $06, $00, $06, $07 ; $02B8D1 |
  db $17, $07, $17, $05, $00, $05, $00, $00 ; $02B8D9 |
  db $21, $28, $00, $05, $21, $05, $29, $17 ; $02B8E1 |
  db $31, $17, $30, $31, $31, $30, $30, $31 ; $02B8E9 |
  db $1F, $30, $1F, $15, $30, $1D, $30, $30 ; $02B8F1 |
  db $30, $30, $30, $30, $12, $30, $1A, $17 ; $02B8F9 |
  db $30, $17, $30, $30, $1F, $30, $1F, $04 ; $02B901 |
  db $30, $03, $30, $03, $30, $03, $30, $09 ; $02B909 |
  db $09, $00, $00, $0F, $10, $07, $18, $00 ; $02B911 |
  db $00, $00, $43, $00, $00, $00, $41, $00 ; $02B919 |
  db $00, $42, $00, $00, $42, $00, $00, $43 ; $02B921 |
  db $00, $00, $00, $41, $00, $00, $00, $00 ; $02B929 |
  db $43, $00, $00, $00, $41, $00, $00, $79 ; $02B931 |
  db $70, $79, $78, $00, $00, $00, $42, $43 ; $02B939 |
  db $00, $00, $43, $00, $00, $00, $4A, $00 ; $02B941 |
  db $44, $4B, $4C, $45, $46, $4D, $4E, $51 ; $02B949 |
  db $52, $59, $5A, $53, $54, $5B, $5C, $55 ; $02B951 |
  db $56, $5D, $00, $00, $00, $00, $68, $61 ; $02B959 |
  db $62, $69, $6A, $63, $64, $6B, $00, $65 ; $02B961 |
  db $00, $00, $00, $78, $7B, $71, $7A, $79 ; $02B969 |
  db $7B, $79, $7A, $41, $00, $00, $43, $70 ; $02B971 |
  db $71, $71, $7B, $78, $79, $71, $79, $00 ; $02B979 |
  db $00, $28, $16, $20, $21, $17, $29, $00 ; $02B981 |
  db $00, $74, $75, $00, $00, $76, $77, $7C ; $02B989 |
  db $7D, $7C, $7D, $7E, $7F, $7E, $7F, $20 ; $02B991 |
  db $06, $00, $06, $16, $17, $28, $29, $1F ; $02B999 |
  db $00, $1F, $00, $11, $00, $19, $00, $00 ; $02B9A1 |
  db $14, $00, $1C, $00, $00, $10, $11, $00 ; $02B9A9 |
  db $00, $12, $13, $00, $00, $14, $15, $18 ; $02B9B1 |
  db $19, $17, $14, $1A, $1B, $15, $10, $1C ; $02B9B9 |
  db $1D, $11, $17, $17, $1C, $10, $11, $1D ; $02B9C1 |
  db $18, $12, $13, $19, $17, $14, $15, $00 ; $02B9C9 |
  db $00, $09, $09, $00, $16, $00, $16, $00 ; $02B9D1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B9D9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B9E1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B9E9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B9F1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02B9F9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA01 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA09 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA11 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA19 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA21 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA29 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA31 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA39 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA41 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA49 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA51 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA59 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA61 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA69 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA71 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BA99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BAF9 |
  db $00, $00, $13, $02, $00, $14, $04, $22 ; $02BB01 |
  db $24, $01, $01, $01, $01, $01, $04, $08 ; $02BB09 |
  db $0A, $08, $0A, $0C, $0E, $06, $06, $28 ; $02BB11 |
  db $2A, $28, $2A, $2C, $2E, $00, $26, $4C ; $02BB19 |
  db $4E, $40, $42, $00, $8A, $8C, $00, $6C ; $02BB21 |
  db $6E, $60, $62, $00, $AA, $AC, $AE, $13 ; $02BB29 |
  db $02, $00, $00, $C8, $CA, $CC, $CE, $00 ; $02BB31 |
  db $00, $00, $8F, $E8, $EA, $EC, $EE, $44 ; $02BB39 |
  db $77, $76, $00, $00, $68, $6A, $4B, $44 ; $02BB41 |
  db $67, $00, $82, $84, $00, $74, $01, $00 ; $02BB49 |
  db $00, $A0, $A2, $94, $A6, $EB, $01, $00 ; $02BB51 |
  db $00, $C0, $C1, $B5, $C6, $01, $01, $00 ; $02BB59 |
  db $B0, $E0, $E2, $E4, $E6, $01, $00, $00 ; $02BB61 |
  db $D2, $D5, $E1, $01, $01, $01, $00, $48 ; $02BB69 |
  db $4A, $4A, $01, $E0, $E2, $E4, $E6, $58 ; $02BB71 |
  db $5A, $5A, $5A, $F8, $FA, $FC, $FE, $00 ; $02BB79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BB81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BB89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BB91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BB99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BBF9 |
  db $00, $00, $12, $03, $00, $15, $05, $23 ; $02BC01 |
  db $25, $01, $65, $01, $01, $01, $05, $09 ; $02BC09 |
  db $0B, $09, $0B, $0D, $0F, $07, $07, $29 ; $02BC11 |
  db $2B, $29, $2B, $2D, $2F, $00, $27, $4D ; $02BC19 |
  db $4F, $41, $43, $89, $8B, $8D, $00, $6D ; $02BC21 |
  db $6F, $61, $63, $A9, $AB, $AD, $00, $12 ; $02BC29 |
  db $03, $00, $00, $C9, $CB, $CD, $CF, $00 ; $02BC31 |
  db $00, $88, $00, $E9, $00, $ED, $EF, $44 ; $02BC39 |
  db $00, $00, $00, $00, $69, $6B, $00, $66 ; $02BC41 |
  db $44, $81, $83, $85, $00, $75, $00, $01 ; $02BC49 |
  db $80, $A1, $A3, $95, $A7, $00, $00, $01 ; $02BC51 |
  db $87, $C1, $B4, $C5, $C7, $01, $00, $00 ; $02BC59 |
  db $B1, $D0, $E3, $E5, $00, $00, $00, $C4 ; $02BC61 |
  db $D3, $D6, $00, $01, $01, $00, $00, $49 ; $02BC69 |
  db $4B, $4B, $01, $E1, $E3, $E5, $E7, $59 ; $02BC71 |
  db $5B, $57, $47, $F9, $FB, $FD, $FF, $00 ; $02BC79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BC81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BC89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BC91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BC99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BCF9 |
  db $00, $00, $12, $03, $00, $14, $04, $32 ; $02BD01 |
  db $34, $01, $01, $01, $01, $01, $04, $18 ; $02BD09 |
  db $1A, $18, $1A, $1C, $1E, $16, $16, $38 ; $02BD11 |
  db $3A, $38, $3A, $3C, $3E, $00, $36, $5C ; $02BD19 |
  db $5E, $70, $72, $00, $9A, $9C, $9E, $7C ; $02BD21 |
  db $7E, $70, $72, $B8, $BA, $BC, $BE, $12 ; $02BD29 |
  db $03, $00, $00, $D8, $DA, $DC, $DE, $00 ; $02BD31 |
  db $00, $00, $9F, $F8, $FA, $FC, $FE, $44 ; $02BD39 |
  db $00, $00, $00, $00, $78, $7A, $5B, $54 ; $02BD41 |
  db $01, $90, $92, $94, $96, $AF, $01, $00 ; $02BD49 |
  db $00, $A0, $B2, $B4, $B6, $00, $01, $00 ; $02BD51 |
  db $00, $D0, $D1, $D4, $E5, $01, $00, $00 ; $02BD59 |
  db $C2, $00, $F2, $F4, $00, $01, $00, $00 ; $02BD61 |
  db $F0, $F7, $00, $01, $00, $00, $00, $58 ; $02BD69 |
  db $5A, $5A, $00, $F0, $F2, $F4, $F6, $58 ; $02BD71 |
  db $5A, $5A, $5A, $F8, $FA, $FC, $FE, $00 ; $02BD79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BD81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BD89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BD91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BD99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BDF9 |
  db $00, $00, $13, $02, $00, $15, $05, $33 ; $02BE01 |
  db $35, $01, $01, $01, $01, $01, $05, $19 ; $02BE09 |
  db $1B, $19, $1B, $1D, $1F, $17, $17, $39 ; $02BE11 |
  db $3B, $39, $3B, $3D, $3F, $00, $37, $5D ; $02BE19 |
  db $5F, $71, $73, $99, $9B, $9D, $00, $7D ; $02BE21 |
  db $7F, $71, $73, $B9, $BB, $BD, $BF, $13 ; $02BE29 |
  db $02, $00, $00, $D9, $DB, $DD, $DF, $00 ; $02BE31 |
  db $00, $98, $00, $F9, $FB, $FD, $FF, $44 ; $02BE39 |
  db $76, $00, $77, $A8, $79, $7B, $00, $01 ; $02BE41 |
  db $01, $91, $93, $95, $97, $00, $00, $01 ; $02BE49 |
  db $86, $A1, $B3, $B5, $B7, $00, $00, $01 ; $02BE51 |
  db $A5, $D1, $B5, $E4, $D7, $00, $00, $00 ; $02BE59 |
  db $C3, $F1, $F3, $F5, $00, $00, $00, $E7 ; $02BE61 |
  db $F6, $A4, $00, $01, $00, $00, $00, $59 ; $02BE69 |
  db $5B, $47, $00, $F1, $F3, $F5, $F7, $59 ; $02BE71 |
  db $5B, $57, $57, $F9, $FB, $FD, $FF, $00 ; $02BE79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BE81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BE89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BE91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BE99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BED1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BED9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEF1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BEF9 |
  db $00, $00, $13, $13, $10, $10, $23, $53 ; $02BF01 |
  db $73, $10, $10, $00, $00, $00, $43, $10 ; $02BF09 |
  db $10, $11, $11, $11, $11, $10, $11, $10 ; $02BF11 |
  db $10, $11, $11, $11, $11, $00, $11, $62 ; $02BF19 |
  db $62, $82, $82, $03, $03, $03, $03, $62 ; $02BF21 |
  db $62, $82, $82, $03, $03, $03, $03, $03 ; $02BF29 |
  db $03, $00, $00, $03, $03, $03, $03, $00 ; $02BF31 |
  db $00, $03, $03, $03, $03, $03, $03, $00 ; $02BF39 |
  db $00, $00, $00, $01, $01, $01, $01, $00 ; $02BF41 |
  db $00, $02, $02, $02, $01, $01, $00, $00 ; $02BF49 |
  db $02, $02, $02, $02, $01, $00, $00, $00 ; $02BF51 |
  db $01, $02, $02, $01, $01, $00, $00, $10 ; $02BF59 |
  db $01, $01, $01, $01, $01, $00, $00, $01 ; $02BF61 |
  db $01, $01, $01, $00, $00, $00, $00, $13 ; $02BF69 |
  db $13, $13, $00, $00, $00, $00, $00, $13 ; $02BF71 |
  db $13, $13, $13, $00, $00, $00, $00, $00 ; $02BF79 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BF81 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BF89 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BF91 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BF99 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFA1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFA9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFB1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFB9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFC1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFC9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFD1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFD9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFE1 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFE9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $02BFF1 |
  db $00, $00, $00, $00, $00, $00, $00      ; $02BFF9 |

