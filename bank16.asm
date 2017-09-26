bank $16
org $8000

  JMP code_16806C                           ; $168000 |

  JMP code_1680FE                           ; $168003 |

code_168006:
  LDA #$00                                  ; $168006 |
  STA $C2                                   ; $168008 |
  LDY #$08                                  ; $16800A |
code_16800C:
  ASL $C2                                   ; $16800C |
  ROL $C1                                   ; $16800E |
  BCC code_16801F                           ; $168010 |
  CLC                                       ; $168012 |
  LDA $C2                                   ; $168013 |
  ADC $C4                                   ; $168015 |
  STA $C2                                   ; $168017 |
  LDA $C1                                   ; $168019 |
  ADC #$00                                  ; $16801B |
  STA $C1                                   ; $16801D |
code_16801F:
  DEY                                       ; $16801F |
  BNE code_16800C                           ; $168020 |
  RTS                                       ; $168022 |

code_168023:
  ASL                                       ; $168023 |
  TAY                                       ; $168024 |
  INY                                       ; $168025 |
  PLA                                       ; $168026 |
  STA $C1                                   ; $168027 |
  PLA                                       ; $168029 |
  STA $C2                                   ; $16802A |
  LDA ($C1),y                               ; $16802C |
  PHA                                       ; $16802E |
  INY                                       ; $16802F |
  LDA ($C1),y                               ; $168030 |
  STA $C2                                   ; $168032 |
  PLA                                       ; $168034 |
  STA $C1                                   ; $168035 |
  JMP ($00C1)                               ; $168037 |

code_16803A:
  STY $C1                                   ; $16803A |
  LDY #$00                                  ; $16803C |
  CMP #$C0                                  ; $16803E |
  BCS code_168047                           ; $168040 |
  STA $C2                                   ; $168042 |
  LDA ($C1),y                               ; $168044 |
  RTS                                       ; $168046 |

code_168047:
  SEC                                       ; $168047 |
  SBC #$20                                  ; $168048 |
  STA $C2                                   ; $16804A |
  LDA #$07                                  ; $16804C |
  STA $8000                                 ; $16804E |
  LDA #$18                                  ; $168051 |
  STA $8001                                 ; $168053 |
  LDA ($C1),y                               ; $168056 |
  PHA                                       ; $168058 |
  LDA #$07                                  ; $168059 |
  STA $8000                                 ; $16805B |
  LDA #$17                                  ; $16805E |
  STA $8001                                 ; $168060 |
  LDA #$20                                  ; $168063 |
  CLC                                       ; $168065 |
  ADC $C2                                   ; $168066 |
  STA $C2                                   ; $168068 |
  PLA                                       ; $16806A |
  RTS                                       ; $16806B |

code_16806C:
  LDA $C0                                   ; $16806C |
  LSR                                       ; $16806E |
  BCS code_1680D7                           ; $16806F |
  LDA $D0                                   ; $168071 |
  ORA $D1                                   ; $168073 |
  BEQ code_16807A                           ; $168075 |
  JSR code_168252                           ; $168077 |
code_16807A:
  CLC                                       ; $16807A |
  LDA $CA                                   ; $16807B |
  ADC $C8                                   ; $16807D |
  STA $C8                                   ; $16807F |
  LDA $C9                                   ; $168081 |
  ADC #$00                                  ; $168083 |
  STA $C7                                   ; $168085 |
  LDA $CF                                   ; $168087 |
  PHA                                       ; $168089 |
  LDX #$03                                  ; $16808A |
code_16808C:
  LSR $CF                                   ; $16808C |
  BCC code_168099                           ; $16808E |
  LDA $CF                                   ; $168090 |
  ORA #$80                                  ; $168092 |
  STA $CF                                   ; $168094 |
  JSR code_1682DE                           ; $168096 |
code_168099:
  LDA $C0                                   ; $168099 |
  AND #$02                                  ; $16809B |
  BNE code_1680A6                           ; $16809D |
  TXA                                       ; $16809F |
  PHA                                       ; $1680A0 |
  JSR code_168393                           ; $1680A1 |
  PLA                                       ; $1680A4 |
  TAX                                       ; $1680A5 |
code_1680A6:
  DEX                                       ; $1680A6 |
  BPL code_16808C                           ; $1680A7 |
  PLA                                       ; $1680A9 |
  STA $CF                                   ; $1680AA |
  LSR $C0                                   ; $1680AC |
  ASL $C0                                   ; $1680AE |
  LDA $CC                                   ; $1680B0 |
  AND #$7F                                  ; $1680B2 |
  BEQ code_1680D7                           ; $1680B4 |
  LDY #$00                                  ; $1680B6 |
  STY $C1                                   ; $1680B8 |
  LDY #$04                                  ; $1680BA |
code_1680BC:
  ASL                                       ; $1680BC |
  ROL $C1                                   ; $1680BD |
  DEY                                       ; $1680BF |
  BNE code_1680BC                           ; $1680C0 |
  CLC                                       ; $1680C2 |
  ADC $C0                                   ; $1680C3 |
  STA $C0                                   ; $1680C5 |
  LDA $C1                                   ; $1680C7 |
  ADC $CD                                   ; $1680C9 |
  BCC code_1680D5                           ; $1680CB |
  LDA $CC                                   ; $1680CD |
  AND #$80                                  ; $1680CF |
  STA $CC                                   ; $1680D1 |
  LDA #$FF                                  ; $1680D3 |
code_1680D5:
  STA $CD                                   ; $1680D5 |
code_1680D7:
  RTS                                       ; $1680D7 |

code_1680D8:
  TXA                                       ; $1680D8 |
  AND #$03                                  ; $1680D9 |
  EOR #$03                                  ; $1680DB |
  ASL                                       ; $1680DD |
  ASL                                       ; $1680DE |
  TAY                                       ; $1680DF |
  LDA #$30                                  ; $1680E0 |
  CPY #$08                                  ; $1680E2 |
  BNE code_1680E8                           ; $1680E4 |
  LDA #$00                                  ; $1680E6 |
code_1680E8:
  STA $4000,y                               ; $1680E8 |
  RTS                                       ; $1680EB |

code_1680EC:
  PHA                                       ; $1680EC |
  TXA                                       ; $1680ED |
  AND #$03                                  ; $1680EE |
  EOR #$03                                  ; $1680F0 |
  ASL                                       ; $1680F2 |
  ASL                                       ; $1680F3 |
  STY $C4                                   ; $1680F4 |
  ORA $C4                                   ; $1680F6 |
  TAY                                       ; $1680F8 |
  PLA                                       ; $1680F9 |
  STA $4000,y                               ; $1680FA |
  RTS                                       ; $1680FD |

code_1680FE:
  INC $C0                                   ; $1680FE |
  JSR code_168106                           ; $168100 |
  DEC $C0                                   ; $168103 |
  RTS                                       ; $168105 |

code_168106:
  CMP #$F0                                  ; $168106 |
  BCC code_16810D                           ; $168108 |
  JMP code_1681AE                           ; $16810A |

code_16810D:
  CMP $8A40                                 ; $16810D |
  BCC code_168118                           ; $168110 |
  SEC                                       ; $168112 |
  SBC $8A40                                 ; $168113 |
  BCS code_16810D                           ; $168116 |
code_168118:
  ASL                                       ; $168118 |
  TAX                                       ; $168119 |
  LDY $8A44,x                               ; $16811A |
  TYA                                       ; $16811D |
  ORA $8A43,x                               ; $16811E |
  BEQ code_16816E                           ; $168121 |
  LDA $8A43,x                               ; $168123 |
  JSR code_16803A                           ; $168126 |
  TAY                                       ; $168129 |
  BEQ code_16816F                           ; $16812A |
  LDY #$00                                  ; $16812C |
  INX                                       ; $16812E |
  STA $C4                                   ; $16812F |
  AND #$7F                                  ; $168131 |
  CMP $CE                                   ; $168133 |
  BCC code_16816E                           ; $168135 |
  STA $CE                                   ; $168137 |
  BNE code_168145                           ; $168139 |
  LDA $D6                                   ; $16813B |
  BPL code_168145                           ; $16813D |
  LDA $C4                                   ; $16813F |
  BMI code_168145                           ; $168141 |
  STY $D7                                   ; $168143 |
code_168145:
  STY $D6                                   ; $168145 |
  ASL $C4                                   ; $168147 |
  ROR $D6                                   ; $168149 |
  BPL code_16814F                           ; $16814B |
  STX $D7                                   ; $16814D |
code_16814F:
  INC $C1                                   ; $16814F |
  LDA $C1                                   ; $168151 |
  STA $D0                                   ; $168153 |
  BNE code_168159                           ; $168155 |
  INC $C2                                   ; $168157 |
code_168159:
  LDA $C2                                   ; $168159 |
  STA $D1                                   ; $16815B |
  TYA                                       ; $16815D |
  STA $D2                                   ; $16815E |
  STA $D3                                   ; $168160 |
  STA $D4                                   ; $168162 |
  STA $D5                                   ; $168164 |
  LDY #$27                                  ; $168166 |
code_168168:
  STA $0700,y                               ; $168168 |
  DEY                                       ; $16816B |
  BPL code_168168                           ; $16816C |
code_16816E:
  RTS                                       ; $16816E |

code_16816F:
  LDX #$01                                  ; $16816F |
  STX $C9                                   ; $168171 |
  LDX #$99                                  ; $168173 |
  STX $CA                                   ; $168175 |
  STA $C8                                   ; $168177 |
  STA $CB                                   ; $168179 |
  STA $CC                                   ; $16817B |
  STA $CD                                   ; $16817D |
  LDX #$53                                  ; $16817F |
code_168181:
  STA $0728,x                               ; $168181 |
  DEX                                       ; $168184 |
  BPL code_168181                           ; $168185 |
  LDX #$03                                  ; $168187 |
code_168189:
  INC $C1                                   ; $168189 |
  BNE code_16818F                           ; $16818B |
  INC $C2                                   ; $16818D |
code_16818F:
  LDY $C1                                   ; $16818F |
  LDA $C2                                   ; $168191 |
  JSR code_16803A                           ; $168193 |
  STA $0754,x                               ; $168196 |
  INC $C1                                   ; $168199 |
  BNE code_16819F                           ; $16819B |
  INC $C2                                   ; $16819D |
code_16819F:
  LDY $C1                                   ; $16819F |
  LDA $C2                                   ; $1681A1 |
  JSR code_16803A                           ; $1681A3 |
  STA $0750,x                               ; $1681A6 |
  DEX                                       ; $1681A9 |
  BPL code_168189                           ; $1681AA |
  BMI code_1681F1                           ; $1681AC |
code_1681AE:
  STY $C3                                   ; $1681AE |
  AND #$07                                  ; $1681B0 |
  JSR code_168023                           ; $1681B2 |

  dw $81C5                                  ; $1681B5 |
  dw $81C8                                  ; $1681B7 |
  dw $81E4                                  ; $1681B9 |
  dw $821E                                  ; $1681BB |
  dw $8226                                  ; $1681BD |
  dw $822D                                  ; $1681BF |
  dw $8234                                  ; $1681C1 |
  dw $824A                                  ; $1681C3 |

  JSR code_1681E4                           ; $1681C5 |
code_1681C8:
  LDA #$00                                  ; $1681C8 |
  STA $CE                                   ; $1681CA |
  STA $D0                                   ; $1681CC |
  STA $D1                                   ; $1681CE |
  STA $D7                                   ; $1681D0 |
  STA $D8                                   ; $1681D2 |
code_1681D4:
  LDA $CF                                   ; $1681D4 |
  BEQ code_1681E3                           ; $1681D6 |
  EOR #$0F                                  ; $1681D8 |
  STA $CF                                   ; $1681DA |
  JSR code_1681F1                           ; $1681DC |
  LDA #$00                                  ; $1681DF |
  STA $CF                                   ; $1681E1 |
code_1681E3:
  RTS                                       ; $1681E3 |

code_1681E4:
  LDA #$00                                  ; $1681E4 |
  LDX #$03                                  ; $1681E6 |
code_1681E8:
  STA $0754,x                               ; $1681E8 |
  STA $0750,x                               ; $1681EB |
  DEX                                       ; $1681EE |
  BPL code_1681E8                           ; $1681EF |
code_1681F1:
  LDA $CF                                   ; $1681F1 |
  PHA                                       ; $1681F3 |
  LDX #$03                                  ; $1681F4 |
code_1681F6:
  LSR $CF                                   ; $1681F6 |
  BCS code_16820A                           ; $1681F8 |
  JSR code_1680D8                           ; $1681FA |
  LDA $0754,x                               ; $1681FD |
  ORA $0750,x                               ; $168200 |
  BEQ code_16820A                           ; $168203 |
  LDA #$FF                                  ; $168205 |
  STA $077C,x                               ; $168207 |
code_16820A:
  DEX                                       ; $16820A |
  BPL code_1681F6                           ; $16820B |
  PLA                                       ; $16820D |
  STA $CF                                   ; $16820E |
  LDA #$08                                  ; $168210 |
  STA $4001                                 ; $168212 |
  STA $4005                                 ; $168215 |
  LDA #$0F                                  ; $168218 |
  STA $4015                                 ; $16821A |
  RTS                                       ; $16821D |

  LDA $C0                                   ; $16821E |
  ORA #$02                                  ; $168220 |
  STA $C0                                   ; $168222 |
  BNE code_1681F1                           ; $168224 |
  LDA $C0                                   ; $168226 |
  AND #$FD                                  ; $168228 |
  STA $C0                                   ; $16822A |
  RTS                                       ; $16822C |

  ASL $C3                                   ; $16822D |
  BEQ code_168234                           ; $16822F |
  SEC                                       ; $168231 |
  ROR $C3                                   ; $168232 |
code_168234:
  LDA $C0                                   ; $168234 |
  AND #$0F                                  ; $168236 |
  STA $C0                                   ; $168238 |
  LDY $C3                                   ; $16823A |
  STY $CC                                   ; $16823C |
  BEQ code_168247                           ; $16823E |
  LDY #$FF                                  ; $168240 |
  CPY $CD                                   ; $168242 |
  BNE code_168249                           ; $168244 |
  INY                                       ; $168246 |
code_168247:
  STY $CD                                   ; $168247 |
code_168249:
  RTS                                       ; $168249 |

  LDA #$00                                  ; $16824A |
  SEC                                       ; $16824C |
  SBC $C3                                   ; $16824D |
  STA $D8                                   ; $16824F |
  RTS                                       ; $168251 |

code_168252:
  LDA $D3                                   ; $168252 |
  BEQ code_16825B                           ; $168254 |
  DEC $D3                                   ; $168256 |
  DEC $D5                                   ; $168258 |
  RTS                                       ; $16825A |

code_16825B:
  JSR code_168386                           ; $16825B |
  STA $C4                                   ; $16825E |
  ASL                                       ; $168260 |
  BCC code_168273                           ; $168261 |
  STY $CE                                   ; $168263 |
  LDA $D7                                   ; $168265 |
  LSR                                       ; $168267 |
  BCC code_168270                           ; $168268 |
  JSR code_168118                           ; $16826A |
  JMP code_16825B                           ; $16826D |

code_168270:
  JMP code_1681C8                           ; $168270 |

code_168273:
  LSR $C4                                   ; $168273 |
  BCC code_1682A6                           ; $168275 |
  JSR code_168386                           ; $168277 |
  ASL                                       ; $16827A |
  BEQ code_168289                           ; $16827B |
  ASL $D6                                   ; $16827D |
  PHP                                       ; $16827F |
  CMP $D6                                   ; $168280 |
  BEQ code_168296                           ; $168282 |
  PLP                                       ; $168284 |
  ROR $D6                                   ; $168285 |
  INC $D6                                   ; $168287 |
code_168289:
  JSR code_168386                           ; $168289 |
  TAX                                       ; $16828C |
  JSR code_168386                           ; $16828D |
  STA $D0                                   ; $168290 |
  STX $D1                                   ; $168292 |
  BNE code_16825B                           ; $168294 |
code_168296:
  TYA                                       ; $168296 |
  PLP                                       ; $168297 |
  ROR                                       ; $168298 |
  STA $D6                                   ; $168299 |
  CLC                                       ; $16829B |
  LDA #$02                                  ; $16829C |
  ADC $D0                                   ; $16829E |
  STA $D0                                   ; $1682A0 |
  BCC code_1682A6                           ; $1682A2 |
  INC $D1                                   ; $1682A4 |
code_1682A6:
  LSR $C4                                   ; $1682A6 |
  BCC code_1682AF                           ; $1682A8 |
  JSR code_168386                           ; $1682AA |
  STA $D4                                   ; $1682AD |
code_1682AF:
  LSR $C4                                   ; $1682AF |
  BCC code_1682B8                           ; $1682B1 |
  JSR code_168386                           ; $1682B3 |
  STA $D2                                   ; $1682B6 |
code_1682B8:
  JSR code_168386                           ; $1682B8 |
  STA $D3                                   ; $1682BB |
  STA $C1                                   ; $1682BD |
  LDA $D4                                   ; $1682BF |
  STA $C4                                   ; $1682C1 |
  JSR code_168006                           ; $1682C3 |
  LDY $C1                                   ; $1682C6 |
  INY                                       ; $1682C8 |
  STY $D5                                   ; $1682C9 |
  INC $C0                                   ; $1682CB |
  JSR code_168386                           ; $1682CD |
  PHA                                       ; $1682D0 |
  EOR $CF                                   ; $1682D1 |
  BEQ code_1682DA                           ; $1682D3 |
  STA $CF                                   ; $1682D5 |
  JSR code_1681D4                           ; $1682D7 |
code_1682DA:
  PLA                                       ; $1682DA |
  STA $CF                                   ; $1682DB |
  RTS                                       ; $1682DD |

code_1682DE:
  LDY $0700,x                               ; $1682DE |
  BEQ code_1682E6                           ; $1682E1 |
  JSR code_168684                           ; $1682E3 |
code_1682E6:
  LDA $C0                                   ; $1682E6 |
  LSR                                       ; $1682E8 |
  BCS code_16830A                           ; $1682E9 |
  JSR code_1686BA                           ; $1682EB |
  LDA $D3                                   ; $1682EE |
  BEQ code_1682FA                           ; $1682F0 |
  CPX #$01                                  ; $1682F2 |
  BEQ code_1682FB                           ; $1682F4 |
  LDA $D5                                   ; $1682F6 |
  BEQ code_168300                           ; $1682F8 |
code_1682FA:
  RTS                                       ; $1682FA |

code_1682FB:
  DEC $0710,x                               ; $1682FB |
  BNE code_1682FA                           ; $1682FE |
code_168300:
  LDA $0704,x                               ; $168300 |
  AND #$04                                  ; $168303 |
  BNE code_1682FA                           ; $168305 |
  JMP code_1685A3                           ; $168307 |

code_16830A:
  LDA #$00                                  ; $16830A |
  STA $C4                                   ; $16830C |
  JSR code_168386                           ; $16830E |
code_168311:
  LSR                                       ; $168311 |
  BCC code_168320                           ; $168312 |
  PHA                                       ; $168314 |
  JSR code_168386                           ; $168315 |
  STA $C3                                   ; $168318 |
  LDA $C4                                   ; $16831A |
  JSR code_168326                           ; $16831C |
  PLA                                       ; $16831F |
code_168320:
  BEQ code_168333                           ; $168320 |
  INC $C4                                   ; $168322 |
  BNE code_168311                           ; $168324 |
code_168326:
  JSR code_168023                           ; $168326 |

  dw $866F                                  ; $168329 |
  dw $86AD                                  ; $16832B |
  dw $865A                                  ; $16832D |
  dw $86A7                                  ; $16832F |
  dw $86A1                                  ; $168331 |

code_168333:
  JSR code_168386                           ; $168333 |
  TAY                                       ; $168336 |
  BNE code_168349                           ; $168337 |
  STA $0710,x                               ; $168339 |
  LDA $0704,x                               ; $16833C |
  AND #$F8                                  ; $16833F |
  ORA #$04                                  ; $168341 |
  STA $0704,x                               ; $168343 |
  JMP code_1680D8                           ; $168346 |

code_168349:
  LDA $0704,x                               ; $168349 |
  ORA #$20                                  ; $16834C |
  STA $0704,x                               ; $16834E |
  LDA $0718,x                               ; $168351 |
  ASL                                       ; $168354 |
  LDA #$54                                  ; $168355 |
  BCS code_16835B                           ; $168357 |
  LDA #$0A                                  ; $168359 |
code_16835B:
  STA $071C,x                               ; $16835B |
  TYA                                       ; $16835E |
  BPL code_16836B                           ; $16835F |
  CPX #$01                                  ; $168361 |
  BNE code_168368                           ; $168363 |
  JSR code_1685AE                           ; $168365 |
code_168368:
  JMP code_168644                           ; $168368 |

code_16836B:
  JSR code_1685AE                           ; $16836B |
  LDA #$FF                                  ; $16836E |
  STA $077C,x                               ; $168370 |
  DEY                                       ; $168373 |
  TXA                                       ; $168374 |
  BNE code_16837F                           ; $168375 |
  STA $C3                                   ; $168377 |
  TYA                                       ; $168379 |
  EOR #$0F                                  ; $16837A |
  JMP code_168636                           ; $16837C |

code_16837F:
  TYA                                       ; $16837F |
  CLC                                       ; $168380 |
  ADC $D2                                   ; $168381 |
  JMP code_1685DE                           ; $168383 |

code_168386:
  LDY $D0                                   ; $168386 |
  LDA $D1                                   ; $168388 |
  INC $D0                                   ; $16838A |
  BNE code_168390                           ; $16838C |
  INC $D1                                   ; $16838E |
code_168390:
  JMP code_16803A                           ; $168390 |

code_168393:
  TXA                                       ; $168393 |
  ORA #$28                                  ; $168394 |
  TAX                                       ; $168396 |
  LDA $0728,x                               ; $168397 |
  ORA $072C,x                               ; $16839A |
  BEQ code_1683CC                           ; $16839D |
  LDA $0738,x                               ; $16839F |
  BEQ code_1683CD                           ; $1683A2 |
  LDY $0700,x                               ; $1683A4 |
  BEQ code_1683AF                           ; $1683A7 |
  JSR code_168684                           ; $1683A9 |
  JSR code_1686BA                           ; $1683AC |
code_1683AF:
  LDA $0740,x                               ; $1683AF |
  SEC                                       ; $1683B2 |
  SBC $C7                                   ; $1683B3 |
  STA $0740,x                               ; $1683B5 |
  BEQ code_1683BC                           ; $1683B8 |
  BCS code_1683BF                           ; $1683BA |
code_1683BC:
  JSR code_1685A3                           ; $1683BC |
code_1683BF:
  LDA $0738,x                               ; $1683BF |
  SEC                                       ; $1683C2 |
  SBC $C7                                   ; $1683C3 |
  STA $0738,x                               ; $1683C5 |
  BEQ code_1683CD                           ; $1683C8 |
  BCC code_1683CD                           ; $1683CA |
code_1683CC:
  RTS                                       ; $1683CC |

code_1683CD:
  JSR code_168592                           ; $1683CD |
  CMP #$20                                  ; $1683D0 |
  BCS code_1683DA                           ; $1683D2 |
  JSR code_168497                           ; $1683D4 |
  JMP code_1683CD                           ; $1683D7 |

code_1683DA:
  PHA                                       ; $1683DA |
  ROL                                       ; $1683DB |
  ROL                                       ; $1683DC |
  ROL                                       ; $1683DD |
  ROL                                       ; $1683DE |
  AND #$07                                  ; $1683DF |
  TAY                                       ; $1683E1 |
  DEY                                       ; $1683E2 |
  LDA $0730,x                               ; $1683E3 |
  ASL                                       ; $1683E6 |
  ASL                                       ; $1683E7 |
  BPL code_1683EF                           ; $1683E8 |
  LDA $8915,y                               ; $1683EA |
  BNE code_168406                           ; $1683ED |
code_1683EF:
  ASL                                       ; $1683EF |
  ASL                                       ; $1683F0 |
  LDA $891C,y                               ; $1683F1 |
  BCC code_168406                           ; $1683F4 |
  STA $C3                                   ; $1683F6 |
  LDA $0730,x                               ; $1683F8 |
  AND #$EF                                  ; $1683FB |
  STA $0730,x                               ; $1683FD |
  LDA $C3                                   ; $168400 |
  LSR                                       ; $168402 |
  CLC                                       ; $168403 |
  ADC $C3                                   ; $168404 |
code_168406:
  CLC                                       ; $168406 |
  ADC $0738,x                               ; $168407 |
  STA $0738,x                               ; $16840A |
  TAY                                       ; $16840D |
  PLA                                       ; $16840E |
  AND #$1F                                  ; $16840F |
  BNE code_168419                           ; $168411 |
  JSR code_1685A3                           ; $168413 |
  JMP code_168491                           ; $168416 |

code_168419:
  PHA                                       ; $168419 |
  STY $C4                                   ; $16841A |
  LDA $073C,x                               ; $16841C |
  STA $C1                                   ; $16841F |
  JSR code_168006                           ; $168421 |
  LDA $C1                                   ; $168424 |
  BNE code_16842A                           ; $168426 |
  LDA #$01                                  ; $168428 |
code_16842A:
  STA $0740,x                               ; $16842A |
  PLA                                       ; $16842D |
  TAY                                       ; $16842E |
  DEY                                       ; $16842F |
  LDA $0730,x                               ; $168430 |
  BPL code_168440                           ; $168433 |
  LDA $0718,x                               ; $168435 |
  BNE code_168454                           ; $168438 |
  JSR code_168644                           ; $16843A |
  JMP code_16847E                           ; $16843D |

code_168440:
  JSR code_1685AE                           ; $168440 |
  LDA $CF                                   ; $168443 |
  BMI code_168454                           ; $168445 |
  STY $C3                                   ; $168447 |
  TXA                                       ; $168449 |
  AND #$03                                  ; $16844A |
  TAY                                       ; $16844C |
  LDA #$FF                                  ; $16844D |
  STA $077C,y                               ; $16844F |
  LDY $C3                                   ; $168452 |
code_168454:
  TXA                                       ; $168454 |
  AND #$03                                  ; $168455 |
  BNE code_168466                           ; $168457 |
  STA $C3                                   ; $168459 |
  TYA                                       ; $16845B |
  AND #$0F                                  ; $16845C |
  EOR #$0F                                  ; $16845E |
  JSR code_168636                           ; $168460 |
  JMP code_16847E                           ; $168463 |

code_168466:
  STY $C3                                   ; $168466 |
  LDA $0730,x                               ; $168468 |
  AND #$0F                                  ; $16846B |
  TAY                                       ; $16846D |
  LDA $8923,y                               ; $16846E |
  CLC                                       ; $168471 |
  ADC $C3                                   ; $168472 |
  CLC                                       ; $168474 |
  ADC $CB                                   ; $168475 |
  CLC                                       ; $168477 |
  ADC $0734,x                               ; $168478 |
  JSR code_1685DE                           ; $16847B |
code_16847E:
  LDA $0730,x                               ; $16847E |
  TAY                                       ; $168481 |
  AND #$40                                  ; $168482 |
  ASL                                       ; $168484 |
  STA $C4                                   ; $168485 |
  TYA                                       ; $168487 |
  AND #$7F                                  ; $168488 |
  ORA $C4                                   ; $16848A |
  STA $0730,x                               ; $16848C |
  BPL code_168496                           ; $16848F |
code_168491:
  LDA #$FF                                  ; $168491 |
  STA $0740,x                               ; $168493 |
code_168496:
  RTS                                       ; $168496 |

code_168497:
  CMP #$04                                  ; $168497 |
  BCC code_1684A4                           ; $168499 |
  STA $C4                                   ; $16849B |
  JSR code_168592                           ; $16849D |
  STA $C3                                   ; $1684A0 |
  LDA $C4                                   ; $1684A2 |
code_1684A4:
  JSR code_168023                           ; $1684A4 |

  dw $84D9                                  ; $1684A7 |
  dw $84DD                                  ; $1684A9 |
  dw $84E1                                  ; $1684AB |
  dw $84E8                                  ; $1684AD |
  dw $8575                                  ; $1684AF |
  dw $84F1                                  ; $1684B1 |
  dw $84FF                                  ; $1684B3 |
  dw $865A                                  ; $1684B5 |
  dw $866F                                  ; $1684B7 |
  dw $8505                                  ; $1684B9 |
  dw $8510                                  ; $1684BB |
  dw $8515                                  ; $1684BD |
  dw $86A1                                  ; $1684BF |
  dw $86A7                                  ; $1684C1 |
  dw $851B                                  ; $1684C3 |
  dw $851F                                  ; $1684C5 |
  dw $8523                                  ; $1684C7 |
  dw $8527                                  ; $1684C9 |
  dw $851B                                  ; $1684CB |
  dw $851F                                  ; $1684CD |
  dw $8523                                  ; $1684CF |
  dw $8527                                  ; $1684D1 |
  dw $855A                                  ; $1684D3 |
  dw $8580                                  ; $1684D5 |
  dw $86AD                                  ; $1684D7 |

  LDA #$20                                  ; $1684D9 |
  BNE code_1684EA                           ; $1684DB |
  LDA #$40                                  ; $1684DD |
  BNE code_1684EA                           ; $1684DF |
  LDA #$10                                  ; $1684E1 |
  ORA $0730,x                               ; $1684E3 |
  BNE code_1684ED                           ; $1684E6 |
  LDA #$08                                  ; $1684E8 |
code_1684EA:
  EOR $0730,x                               ; $1684EA |
code_1684ED:
  STA $0730,x                               ; $1684ED |
  RTS                                       ; $1684F0 |

  LDA #$00                                  ; $1684F1 |
  STA $C8                                   ; $1684F3 |
  JSR code_168592                           ; $1684F5 |
  LDY $C3                                   ; $1684F8 |
  STA $CA                                   ; $1684FA |
  STY $C9                                   ; $1684FC |
  RTS                                       ; $1684FE |

  LDA $C3                                   ; $1684FF |
  STA $073C,x                               ; $168501 |
  RTS                                       ; $168504 |

  LDA $0730,x                               ; $168505 |
  AND #$F8                                  ; $168508 |
  ORA $C3                                   ; $16850A |
  STA $0730,x                               ; $16850C |
  RTS                                       ; $16850F |

  LDA $C3                                   ; $168510 |
  STA $CB                                   ; $168512 |
  RTS                                       ; $168514 |

  LDA $C3                                   ; $168515 |
  STA $0734,x                               ; $168517 |
  RTS                                       ; $16851A |

  LDA #$00                                  ; $16851B |
  BEQ code_168529                           ; $16851D |
  LDA #$04                                  ; $16851F |
  BNE code_168529                           ; $168521 |
  LDA #$08                                  ; $168523 |
  BNE code_168529                           ; $168525 |
  LDA #$0C                                  ; $168527 |
code_168529:
  STA $C2                                   ; $168529 |
  TXA                                       ; $16852B |
  CLC                                       ; $16852C |
  ADC $C2                                   ; $16852D |
  TAY                                       ; $16852F |
  LDA $C4                                   ; $168530 |
  CMP #$12                                  ; $168532 |
  BCS code_168547                           ; $168534 |
  LDA $0744,y                               ; $168536 |
  SEC                                       ; $168539 |
  SBC #$01                                  ; $16853A |
  BCS code_168540                           ; $16853C |
  LDA $C3                                   ; $16853E |
code_168540:
  STA $0744,y                               ; $168540 |
  BEQ code_168566                           ; $168543 |
  BNE code_168555                           ; $168545 |
code_168547:
  LDA $0744,y                               ; $168547 |
  SEC                                       ; $16854A |
  SBC #$01                                  ; $16854B |
  BNE code_168566                           ; $16854D |
  STA $0744,y                               ; $16854F |
  JSR code_168575                           ; $168552 |
code_168555:
  JSR code_168592                           ; $168555 |
  STA $C3                                   ; $168558 |
  JSR code_168592                           ; $16855A |
  STA $0728,x                               ; $16855D |
  LDA $C3                                   ; $168560 |
  STA $072C,x                               ; $168562 |
  RTS                                       ; $168565 |

code_168566:
  LDA #$02                                  ; $168566 |
  CLC                                       ; $168568 |
  ADC $0728,x                               ; $168569 |
  STA $0728,x                               ; $16856C |
  BCC code_168574                           ; $16856F |
  INC $072C,x                               ; $168571 |
code_168574:
  RTS                                       ; $168574 |

code_168575:
  LDA $0730,x                               ; $168575 |
  AND #$97                                  ; $168578 |
  ORA $C3                                   ; $16857A |
  STA $0730,x                               ; $16857C |
  RTS                                       ; $16857F |

  PLA                                       ; $168580 |
  PLA                                       ; $168581 |
  LDA #$00                                  ; $168582 |
  STA $0728,x                               ; $168584 |
  STA $072C,x                               ; $168587 |
  LDA $CF                                   ; $16858A |
  BMI code_168591                           ; $16858C |
  JMP code_1680D8                           ; $16858E |

code_168591:
  RTS                                       ; $168591 |

code_168592:
  LDY $0728,x                               ; $168592 |
  LDA $072C,x                               ; $168595 |
  INC $0728,x                               ; $168598 |
  BNE code_1685A0                           ; $16859B |
  INC $072C,x                               ; $16859D |
code_1685A0:
  JMP code_16803A                           ; $1685A0 |

code_1685A3:
  LDA $0704,x                               ; $1685A3 |
  AND #$F8                                  ; $1685A6 |
  ORA #$03                                  ; $1685A8 |
  STA $0704,x                               ; $1685AA |
  RTS                                       ; $1685AD |

code_1685AE:
  TYA                                       ; $1685AE |
  PHA                                       ; $1685AF |
  LDY #$00                                  ; $1685B0 |
  LDA $0704,x                               ; $1685B2 |
  AND #$F8                                  ; $1685B5 |
  STA $0704,x                               ; $1685B7 |
  CPX #$29                                  ; $1685BA |
  BEQ code_1685D0                           ; $1685BC |
  CPX #$01                                  ; $1685BE |
  BNE code_1685D7                           ; $1685C0 |
  LDA $D3                                   ; $1685C2 |
  STA $C1                                   ; $1685C4 |
  LDA $070C,x                               ; $1685C6 |
  STA $C4                                   ; $1685C9 |
  JSR code_168006                           ; $1685CB |
  LDY $C1                                   ; $1685CE |
code_1685D0:
  INY                                       ; $1685D0 |
  INC $0704,x                               ; $1685D1 |
  INC $0704,x                               ; $1685D4 |
code_1685D7:
  TYA                                       ; $1685D7 |
  STA $0710,x                               ; $1685D8 |
  PLA                                       ; $1685DB |
  TAY                                       ; $1685DC |
  RTS                                       ; $1685DD |

code_1685DE:
  CMP #$60                                  ; $1685DE |
  BCC code_1685E4                           ; $1685E0 |
  LDA #$5F                                  ; $1685E2 |
code_1685E4:
  STA $C3                                   ; $1685E4 |
  INC $C3                                   ; $1685E6 |
  CPX #$28                                  ; $1685E8 |
  BCC code_16862A                           ; $1685EA |
  LDA $071C,x                               ; $1685EC |
  BEQ code_16861D                           ; $1685EF |
  CMP $C3                                   ; $1685F1 |
  BNE code_1685FC                           ; $1685F3 |
  LDA $0730,x                               ; $1685F5 |
  BPL code_16861D                           ; $1685F8 |
  BMI code_168644                           ; $1685FA |
code_1685FC:
  LDA $0718,x                               ; $1685FC |
  BEQ code_16861D                           ; $1685FF |
  BCS code_168607                           ; $168601 |
  ORA #$80                                  ; $168603 |
  BNE code_168609                           ; $168605 |
code_168607:
  AND #$7F                                  ; $168607 |
code_168609:
  STA $0718,x                               ; $168609 |
  LDA $0704,x                               ; $16860C |
  ORA #$20                                  ; $16860F |
  STA $0704,x                               ; $168611 |
  LDA $C3                                   ; $168614 |
  LDY $071C,x                               ; $168616 |
  STY $C3                                   ; $168619 |
  BNE code_168627                           ; $16861B |
code_16861D:
  LDA $0704,x                               ; $16861D |
  AND #$DF                                  ; $168620 |
  STA $0704,x                               ; $168622 |
  LDA $C3                                   ; $168625 |
code_168627:
  STA $071C,x                               ; $168627 |
code_16862A:
  ASL $C3                                   ; $16862A |
  LDY $C3                                   ; $16862C |
  LDA $8959,y                               ; $16862E |
  STA $C3                                   ; $168631 |
  LDA $895A,y                               ; $168633 |
code_168636:
  STA $0724,x                               ; $168636 |
  LDA $C3                                   ; $168639 |
  STA $0720,x                               ; $16863B |
  LDY #$04                                  ; $16863E |
  LDA ($C5),y                               ; $168640 |
  BMI code_16864C                           ; $168642 |
code_168644:
  LDA $0704,x                               ; $168644 |
  AND #$08                                  ; $168647 |
  BNE code_16864C                           ; $168649 |
  RTS                                       ; $16864B |

code_16864C:
  LDA #$00                                  ; $16864C |
  STA $0708,x                               ; $16864E |
  LDA $0704,x                               ; $168651 |
  AND #$37                                  ; $168654 |
  STA $0704,x                               ; $168656 |
  RTS                                       ; $168659 |

  CPX #$01                                  ; $16865A |
  BNE code_168662                           ; $16865C |
  LDA $C3                                   ; $16865E |
  BNE code_16866B                           ; $168660 |
code_168662:
  LDA $070C,x                               ; $168662 |
  AND #$C0                                  ; $168665 |
  ORA $C3                                   ; $168667 |
  ORA #$30                                  ; $168669 |
code_16866B:
  STA $070C,x                               ; $16866B |
  RTS                                       ; $16866E |

  INC $C3                                   ; $16866F |
  LDA $C3                                   ; $168671 |
  CMP $0700,x                               ; $168673 |
  BEQ code_1686A0                           ; $168676 |
  STA $0700,x                               ; $168678 |
  TAY                                       ; $16867B |
  LDA $0704,x                               ; $16867C |
  ORA #$08                                  ; $16867F |
  STA $0704,x                               ; $168681 |
code_168684:
  DEY                                       ; $168684 |
  LDA #$00                                  ; $168685 |
  STA $C3                                   ; $168687 |
  TYA                                       ; $168689 |
  ASL                                       ; $16868A |
  ROL $C3                                   ; $16868B |
  ASL                                       ; $16868D |
  ROL $C3                                   ; $16868E |
  ASL                                       ; $168690 |
  ROL $C3                                   ; $168691 |
  CLC                                       ; $168693 |
  ADC $8A42                                 ; $168694 |
  STA $C5                                   ; $168697 |
  LDA $C3                                   ; $168699 |
  ADC $8A41                                 ; $16869B |
  STA $C6                                   ; $16869E |
code_1686A0:
  RTS                                       ; $1686A0 |

  LDA $C3                                   ; $1686A1 |
  STA $0714,x                               ; $1686A3 |
  RTS                                       ; $1686A6 |

  LDA $C3                                   ; $1686A7 |
  STA $0718,x                               ; $1686A9 |
  RTS                                       ; $1686AC |

  LDA $070C,x                               ; $1686AD |
  AND #$0F                                  ; $1686B0 |
  ORA $C3                                   ; $1686B2 |
  ORA #$30                                  ; $1686B4 |
  STA $070C,x                               ; $1686B6 |
  RTS                                       ; $1686B9 |

code_1686BA:
  LDA $0710,x                               ; $1686BA |
  STA $C4                                   ; $1686BD |
  LDA $0704,x                               ; $1686BF |
  AND #$07                                  ; $1686C2 |
  JSR code_168023                           ; $1686C4 |

  db $D1, $86, $E6, $86, $20, $87, $02, $87 ; $1686C7 |
  db $14, $89                               ; $1686CF |

  LDY #$00                                  ; $1686D1 |
  LDA ($C5),y                               ; $1686D3 |
  TAY                                       ; $1686D5 |
  LDA $C4                                   ; $1686D6 |
  CLC                                       ; $1686D8 |
  ADC $8933,y                               ; $1686D9 |
  BCS code_1686E2                           ; $1686DC |
  CMP #$F0                                  ; $1686DE |
  BCC code_16871D                           ; $1686E0 |
code_1686E2:
  LDA #$F0                                  ; $1686E2 |
  BNE code_16871A                           ; $1686E4 |
  LDY #$01                                  ; $1686E6 |
  LDA ($C5),y                               ; $1686E8 |
  BEQ code_1686FB                           ; $1686EA |
  TAY                                       ; $1686EC |
  LDA $C4                                   ; $1686ED |
  SEC                                       ; $1686EF |
  SBC $8933,y                               ; $1686F0 |
  BCC code_1686FB                           ; $1686F3 |
  LDY #$02                                  ; $1686F5 |
  CMP ($C5),y                               ; $1686F7 |
  BCS code_16871D                           ; $1686F9 |
code_1686FB:
  LDY #$02                                  ; $1686FB |
  LDA ($C5),y                               ; $1686FD |
  JMP code_16871A                           ; $1686FF |

  TXA                                       ; $168702 |
  AND #$03                                  ; $168703 |
  CMP #$01                                  ; $168705 |
  BEQ code_168718                           ; $168707 |
  LDY #$03                                  ; $168709 |
  LDA ($C5),y                               ; $16870B |
  BEQ code_168720                           ; $16870D |
  TAY                                       ; $16870F |
  LDA $C4                                   ; $168710 |
  SEC                                       ; $168712 |
  SBC $8933,y                               ; $168713 |
  BCS code_16871D                           ; $168716 |
code_168718:
  LDA #$00                                  ; $168718 |
code_16871A:
  INC $0704,x                               ; $16871A |
code_16871D:
  STA $0710,x                               ; $16871D |
code_168720:
  CPX #$28                                  ; $168720 |
  BCC code_168737                           ; $168722 |
  LDA $CF                                   ; $168724 |
  BPL code_16872B                           ; $168726 |
  JMP code_1688A0                           ; $168728 |

code_16872B:
  LDA $CD                                   ; $16872B |
  LDY $CC                                   ; $16872D |
  BMI code_168733                           ; $16872F |
  EOR #$FF                                  ; $168731 |
code_168733:
  CMP #$FF                                  ; $168733 |
  BNE code_168740                           ; $168735 |
code_168737:
  TXA                                       ; $168737 |
  AND #$03                                  ; $168738 |
  CMP #$01                                  ; $16873A |
  BNE code_168760                           ; $16873C |
  BEQ code_168752                           ; $16873E |
code_168740:
  CPX #$29                                  ; $168740 |
  BNE code_16875B                           ; $168742 |
  STA $C4                                   ; $168744 |
  LDA $0740,x                               ; $168746 |
  STA $C1                                   ; $168749 |
  JSR code_168006                           ; $16874B |
  LDA $C1                                   ; $16874E |
  BEQ code_1687AA                           ; $168750 |
code_168752:
  LDA $0710,x                               ; $168752 |
  BEQ code_1687AA                           ; $168755 |
  LDA #$FF                                  ; $168757 |
  BNE code_1687AA                           ; $168759 |
code_16875B:
  CMP $0710,x                               ; $16875B |
  BCC code_168763                           ; $16875E |
code_168760:
  LDA $0710,x                               ; $168760 |
code_168763:
  LSR                                       ; $168763 |
  LSR                                       ; $168764 |
  LSR                                       ; $168765 |
  LSR                                       ; $168766 |
  EOR #$0F                                  ; $168767 |
  STA $C3                                   ; $168769 |
  LDY #$06                                  ; $16876B |
  LDA ($C5),y                               ; $16876D |
  CMP #$05                                  ; $16876F |
  BCC code_168797                           ; $168771 |
  STA $C4                                   ; $168773 |
  LDY $0708,x                               ; $168775 |
  LDA $0704,x                               ; $168778 |
  ASL                                       ; $16877B |
  ASL                                       ; $16877C |
  TYA                                       ; $16877D |
  BCC code_168782                           ; $16877E |
  EOR #$FF                                  ; $168780 |
code_168782:
  BEQ code_168797                           ; $168782 |
  STA $C1                                   ; $168784 |
  JSR code_168006                           ; $168786 |
  LDA $C1                                   ; $168789 |
  LSR                                       ; $16878B |
  LSR                                       ; $16878C |
  CMP #$10                                  ; $16878D |
  BCS code_1687A5                           ; $16878F |
  CMP $C3                                   ; $168791 |
  BCC code_168797                           ; $168793 |
  STA $C3                                   ; $168795 |
code_168797:
  LDA #$10                                  ; $168797 |
  STA $C4                                   ; $168799 |
  LDA $070C,x                               ; $16879B |
  SEC                                       ; $16879E |
  SBC $C3                                   ; $16879F |
  BIT $C4                                   ; $1687A1 |
  BNE code_1687AA                           ; $1687A3 |
code_1687A5:
  LDA $070C,x                               ; $1687A5 |
  AND #$F0                                  ; $1687A8 |
code_1687AA:
  LDY #$00                                  ; $1687AA |
  JSR code_1680EC                           ; $1687AC |
  TXA                                       ; $1687AF |
  AND #$03                                  ; $1687B0 |
  TAY                                       ; $1687B2 |
  LDA $077C,y                               ; $1687B3 |
  BMI code_16880C                           ; $1687B6 |
  LDY #$05                                  ; $1687B8 |
  LDA ($C5),y                               ; $1687BA |
  BEQ code_16880C                           ; $1687BC |
  STA $C4                                   ; $1687BE |
  LDY $0708,x                               ; $1687C0 |
  LDA $0704,x                               ; $1687C3 |
  ASL                                       ; $1687C6 |
  ASL                                       ; $1687C7 |
  TYA                                       ; $1687C8 |
  BCC code_1687CD                           ; $1687C9 |
  EOR #$FF                                  ; $1687CB |
code_1687CD:
  BEQ code_16880C                           ; $1687CD |
  STA $C1                                   ; $1687CF |
  JSR code_168006                           ; $1687D1 |
  LDA $C1                                   ; $1687D4 |
  LSR                                       ; $1687D6 |
  ROR $C2                                   ; $1687D7 |
  LSR                                       ; $1687D9 |
  ROR $C2                                   ; $1687DA |
  LSR                                       ; $1687DC |
  ROR $C2                                   ; $1687DD |
  LSR                                       ; $1687DF |
  ROR $C2                                   ; $1687E0 |
  TAY                                       ; $1687E2 |
  ORA $C2                                   ; $1687E3 |
  BEQ code_16880C                           ; $1687E5 |
  LDA $0704,x                               ; $1687E7 |
  BMI code_1687FA                           ; $1687EA |
  CLC                                       ; $1687EC |
  LDA $C2                                   ; $1687ED |
  ADC $0720,x                               ; $1687EF |
  STA $C2                                   ; $1687F2 |
  TYA                                       ; $1687F4 |
  ADC $0724,x                               ; $1687F5 |
  BNE code_168809                           ; $1687F8 |
code_1687FA:
  SEC                                       ; $1687FA |
  LDA $0720,x                               ; $1687FB |
  SBC $C2                                   ; $1687FE |
  STA $C2                                   ; $168800 |
  LDA $0724,x                               ; $168802 |
  STY $C1                                   ; $168805 |
  SBC $C1                                   ; $168807 |
code_168809:
  TAY                                       ; $168809 |
  BNE code_168814                           ; $16880A |
code_16880C:
  LDA $0720,x                               ; $16880C |
  STA $C2                                   ; $16880F |
  LDY $0724,x                               ; $168811 |
code_168814:
  CPX #$28                                  ; $168814 |
  BCS code_168835                           ; $168816 |
  LDA $D6                                   ; $168818 |
  BPL code_168835                           ; $16881A |
  LDA $D8                                   ; $16881C |
  BEQ code_168835                           ; $16881E |
  STA $C4                                   ; $168820 |
  STY $C1                                   ; $168822 |
  LDA $C2                                   ; $168824 |
  PHA                                       ; $168826 |
  JSR code_168006                           ; $168827 |
  PLA                                       ; $16882A |
  CLC                                       ; $16882B |
  ADC $C2                                   ; $16882C |
  STA $C2                                   ; $16882E |
  LDA #$00                                  ; $168830 |
  ADC $C1                                   ; $168832 |
  TAY                                       ; $168834 |
code_168835:
  TXA                                       ; $168835 |
  AND #$03                                  ; $168836 |
  BNE code_168849                           ; $168838 |
  TYA                                       ; $16883A |
  AND #$0F                                  ; $16883B |
  LDY #$07                                  ; $16883D |
  ORA ($C5),y                               ; $16883F |
  STA $C2                                   ; $168841 |
  LDA #$00                                  ; $168843 |
  STA $C1                                   ; $168845 |
  BEQ code_168884                           ; $168847 |
code_168849:
  TYA                                       ; $168849 |
  LDY #$08                                  ; $16884A |
code_16884C:
  DEY                                       ; $16884C |
  CMP $8953,y                               ; $16884D |
  BCC code_16884C                           ; $168850 |
  STA $C1                                   ; $168852 |
  TYA                                       ; $168854 |
  CLC                                       ; $168855 |
  ADC $C1                                   ; $168856 |
  TAY                                       ; $168858 |
  AND #$07                                  ; $168859 |
  CLC                                       ; $16885B |
  ADC #$07                                  ; $16885C |
  STA $C1                                   ; $16885E |
  TYA                                       ; $168860 |
  AND #$38                                  ; $168861 |
  EOR #$38                                  ; $168863 |
  BEQ code_168870                           ; $168865 |
code_168867:
  LSR $C1                                   ; $168867 |
  ROR $C2                                   ; $168869 |
  SEC                                       ; $16886B |
  SBC #$08                                  ; $16886C |
  BNE code_168867                           ; $16886E |
code_168870:
  LDY #$00                                  ; $168870 |
  LDA $0714,x                               ; $168872 |
  BEQ code_168884                           ; $168875 |
  BPL code_16887A                           ; $168877 |
  DEY                                       ; $168879 |
code_16887A:
  CLC                                       ; $16887A |
  ADC $C2                                   ; $16887B |
  STA $C2                                   ; $16887D |
  TYA                                       ; $16887F |
  ADC $C1                                   ; $168880 |
  STA $C1                                   ; $168882 |
code_168884:
  LDY #$02                                  ; $168884 |
  LDA $C2                                   ; $168886 |
  JSR code_1680EC                           ; $168888 |
  TXA                                       ; $16888B |
  AND #$03                                  ; $16888C |
  TAY                                       ; $16888E |
  LDA $C1                                   ; $16888F |
  CMP $077C,y                               ; $168891 |
  BEQ code_1688A0                           ; $168894 |
  STA $077C,y                               ; $168896 |
  ORA #$08                                  ; $168899 |
  LDY #$03                                  ; $16889B |
  JSR code_1680EC                           ; $16889D |
code_1688A0:
  LDA $0704,x                               ; $1688A0 |
  AND #$20                                  ; $1688A3 |
  BEQ code_1688FA                           ; $1688A5 |
  LDA $0718,x                               ; $1688A7 |
  BEQ code_1688F2                           ; $1688AA |
  LDY #$00                                  ; $1688AC |
  ASL                                       ; $1688AE |
  PHP                                       ; $1688AF |
  BCC code_1688B8                           ; $1688B0 |
  EOR #$FF                                  ; $1688B2 |
  CLC                                       ; $1688B4 |
  ADC #$01                                  ; $1688B5 |
  DEY                                       ; $1688B7 |
code_1688B8:
  CLC                                       ; $1688B8 |
  ADC $0720,x                               ; $1688B9 |
  STA $0720,x                               ; $1688BC |
  TYA                                       ; $1688BF |
  ADC $0724,x                               ; $1688C0 |
  STA $0724,x                               ; $1688C3 |
  LDA $071C,x                               ; $1688C6 |
  ASL                                       ; $1688C9 |
  TAY                                       ; $1688CA |
  SEC                                       ; $1688CB |
  LDA $0720,x                               ; $1688CC |
  SBC $8959,y                               ; $1688CF |
  LDA $0724,x                               ; $1688D2 |
  AND #$3F                                  ; $1688D5 |
  SBC $895A,y                               ; $1688D7 |
  LDA #$FF                                  ; $1688DA |
  ADC #$00                                  ; $1688DC |
  PLP                                       ; $1688DE |
  ADC #$00                                  ; $1688DF |
  BNE code_1688FA                           ; $1688E1 |
  TXA                                       ; $1688E3 |
  BEQ code_1688FA                           ; $1688E4 |
  LDA $8959,y                               ; $1688E6 |
  STA $0720,x                               ; $1688E9 |
  LDA $895A,y                               ; $1688EC |
  STA $0724,x                               ; $1688EF |
code_1688F2:
  LDA $0704,x                               ; $1688F2 |
  AND #$DF                                  ; $1688F5 |
  STA $0704,x                               ; $1688F7 |
code_1688FA:
  LDY #$04                                  ; $1688FA |
  LDA ($C5),y                               ; $1688FC |
  AND #$7F                                  ; $1688FE |
  BEQ code_168914                           ; $168900 |
  CLC                                       ; $168902 |
  ADC $0708,x                               ; $168903 |
  STA $0708,x                               ; $168906 |
  BCC code_168914                           ; $168909 |
  LDA $0704,x                               ; $16890B |
  CLC                                       ; $16890E |
  ADC #$40                                  ; $16890F |
  STA $0704,x                               ; $168911 |
code_168914:
  RTS                                       ; $168914 |

  db $02, $04, $08, $10, $20, $40, $80, $03 ; $168915 |
  db $06, $0C, $18, $30, $60, $C0, $00, $0C ; $16891D |
  db $18, $24, $30, $3C, $48, $54, $18, $24 ; $168925 |
  db $30, $3C, $48, $54, $60, $6C, $00, $01 ; $16892D |
  db $02, $03, $04, $05, $06, $07, $08, $09 ; $168935 |
  db $0A, $0B, $0C, $0E, $0F, $10, $12, $13 ; $16893D |
  db $14, $16, $18, $1B, $1E, $23, $28, $30 ; $168945 |
  db $3C, $50, $7E, $7F, $FE, $FF, $00, $07 ; $16894D |
  db $0E, $15, $1C, $23, $2A, $31, $5C, $37 ; $168955 |
  db $9C, $36, $E7, $35, $3C, $35, $9B, $34 ; $16895D |
  db $02, $34, $72, $33, $EA, $32, $6A, $32 ; $168965 |
  db $F1, $31, $80, $31, $14, $31, $5C, $30 ; $16896D |
  db $9C, $2F, $E7, $2E, $3C, $2E, $9B, $2D ; $168975 |
  db $02, $2D, $72, $2C, $EA, $2B, $6A, $2B ; $16897D |
  db $F1, $2A, $80, $2A, $14, $2A, $5C, $29 ; $168985 |
  db $9C, $28, $E7, $27, $3C, $27, $9B, $26 ; $16898D |
  db $02, $26, $72, $25, $EA, $24, $6A, $24 ; $168995 |
  db $F1, $23, $80, $23, $14, $23, $5C, $22 ; $16899D |
  db $9C, $21, $E7, $20, $3C, $20, $9B, $1F ; $1689A5 |
  db $02, $1F, $72, $1E, $EA, $1D, $6A, $1D ; $1689AD |
  db $F1, $1C, $80, $1C, $14, $1C, $5C, $1B ; $1689B5 |
  db $9C, $1A, $E7, $19, $3C, $19, $9B, $18 ; $1689BD |
  db $02, $18, $72, $17, $EA, $16, $6A, $16 ; $1689C5 |
  db $F1, $15, $80, $15, $14, $15, $5C, $14 ; $1689CD |
  db $9C, $13, $E7, $12, $3C, $12, $9B, $11 ; $1689D5 |
  db $02, $11, $72, $10, $EA, $0F, $6A, $0F ; $1689DD |
  db $F1, $0E, $80, $0E, $14, $0E, $5C, $0D ; $1689E5 |
  db $9C, $0C, $E7, $0B, $3C, $0B, $9B, $0A ; $1689ED |
  db $02, $0A, $72, $09, $EA, $08, $6A, $08 ; $1689F5 |
  db $F1, $07, $80, $07, $14, $07, $5C, $06 ; $1689FD |
  db $9C, $05, $E7, $04, $3C, $04, $9B, $03 ; $168A05 |
  db $02, $03, $72, $02, $EA, $01, $6A, $01 ; $168A0D |
  db $F1, $00, $80, $00, $14, $00, $00, $00 ; $168A15 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $168A1D |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $168A25 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $168A2D |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $168A35 |
  db $00, $00, $00, $39, $8A, $B5, $8C, $9D ; $168A3D |
  db $90, $DF, $95, $9A, $9A, $06, $9C, $D7 ; $168A45 |
  db $A0, $BE, $A4, $14, $A7, $C1, $AA, $C2 ; $168A4D |
  db $AD, $E5, $B1, $23, $B2, $CB, $B4, $16 ; $168A55 |
  db $B5, $F6, $B8, $2B, $B9, $1E, $BE, $97 ; $168A5D |
  db $BF, $CF, $C0, $1D, $C5, $33, $C5, $4E ; $168A65 |
  db $C5, $B4, $C5, $C0, $C5, $DE, $C6, $22 ; $168A6D |
  db $C6, $2D, $C6, $3D, $C6, $5A, $C6, $6C ; $168A75 |
  db $C6, $82, $C6, $A9, $C6, $C6, $C6, $D8 ; $168A7D |
  db $C6, $F7, $C7, $0F, $C7, $33, $C7, $49 ; $168A85 |
  db $C7, $57, $C7, $68, $C7, $76, $C7, $88 ; $168A8D |
  db $C7, $A1, $C7, $ED, $C8, $03, $C8, $14 ; $168A95 |
  db $C8, $25, $C8, $3C, $C8, $4C, $C8, $65 ; $168A9D |
  db $C8, $87, $C8, $9A, $C8, $A6, $C9, $B3 ; $168AA5 |
  db $C9, $CA, $CB, $67, $CD, $1E, $CD, $BF ; $168AAD |
  db $1F, $01, $F0, $18, $80, $00, $00, $00 ; $168AB5 |
  db $1F, $01, $F0, $18, $E4, $06, $00, $00 ; $168ABD |
  db $1E, $00, $F0, $10, $80, $00, $00, $80 ; $168AC5 |
  db $1F, $13, $90, $01, $D6, $07, $00, $00 ; $168ACD |
  db $1F, $11, $50, $01, $E2, $00, $47, $00 ; $168AD5 |
  db $1F, $14, $F0, $04, $EE, $04, $00, $00 ; $168ADD |
  db $1F, $19, $A0, $08, $00, $00, $00, $00 ; $168AE5 |
  db $1F, $00, $B0, $09, $E3, $02, $00, $00 ; $168AED |
  db $1F, $0D, $30, $01, $E3, $06, $00, $00 ; $168AF5 |
  db $1F, $1B, $A0, $05, $CB, $02, $3C, $00 ; $168AFD |
  db $1F, $03, $50, $12, $00, $00, $00, $00 ; $168B05 |
  db $1F, $0A, $A0, $0E, $00, $00, $00, $80 ; $168B0D |
  db $1F, $19, $50, $10, $9E, $20, $26, $00 ; $168B15 |
  db $1D, $09, $90, $03, $CB, $01, $37, $00 ; $168B1D |
  db $1F, $1F, $E0, $1B, $9E, $58, $7C, $00 ; $168B25 |
  db $1F, $1B, $E0, $10, $B8, $00, $1E, $00 ; $168B2D |
  db $15, $14, $F0, $04, $00, $00, $00, $00 ; $168B35 |
  db $1A, $14, $F0, $04, $00, $00, $00, $00 ; $168B3D |
  db $1F, $17, $A0, $04, $80, $00, $00, $00 ; $168B45 |
  db $19, $01, $D0, $02, $00, $00, $00, $00 ; $168B4D |
  db $1F, $1D, $B0, $0C, $E4, $05, $00, $00 ; $168B55 |
  db $1A, $18, $90, $07, $00, $00, $00, $00 ; $168B5D |
  db $1F, $02, $C0, $13, $80, $00, $00, $00 ; $168B65 |
  db $1F, $02, $C0, $15, $5D, $06, $06, $00 ; $168B6D |
  db $1F, $1E, $D0, $0A, $FF, $02, $3C, $00 ; $168B75 |
  db $1E, $18, $90, $01, $C6, $19, $32, $00 ; $168B7D |
  db $1F, $17, $80, $06, $E4, $02, $28, $00 ; $168B85 |
  db $1F, $17, $70, $01, $5A, $03, $00, $00 ; $168B8D |
  db $1F, $1C, $B0, $06, $00, $00, $00, $00 ; $168B95 |
  db $1F, $1D, $B0, $0C, $00, $00, $00, $80 ; $168B9D |
  db $1F, $1A, $A0, $05, $FF, $01, $33, $00 ; $168BA5 |
  db $1E, $1A, $A0, $05, $E4, $04, $00, $00 ; $168BAD |
  db $1F, $19, $A0, $02, $00, $00, $00, $00 ; $168BB5 |
  db $1F, $04, $80, $02, $80, $00, $00, $00 ; $168BBD |
  db $1F, $1E, $A0, $01, $C6, $00, $32, $00 ; $168BC5 |
  db $1F, $1F, $90, $09, $FF, $00, $2D, $00 ; $168BCD |
  db $1F, $1C, $80, $01, $00, $00, $00, $00 ; $168BD5 |
  db $1F, $1E, $A0, $02, $EF, $00, $46, $00 ; $168BDD |
  db $17, $02, $E0, $0F, $80, $00, $00, $00 ; $168BE5 |
  db $1F, $1B, $A0, $01, $B0, $07, $62, $00 ; $168BED |
  db $1F, $1F, $F0, $1F, $00, $00, $00, $00 ; $168BF5 |
  db $1F, $1F, $F0, $1F, $FF, $02, $00, $00 ; $168BFD |
  db $1F, $1F, $F0, $1F, $92, $7F, $00, $00 ; $168C05 |
  db $1F, $1F, $F0, $1F, $E3, $7F, $00, $00 ; $168C0D |
  db $1F, $1F, $F0, $1F, $FF, $4C, $00, $00 ; $168C15 |
  db $1F, $1F, $F0, $1F, $99, $7F, $00, $00 ; $168C1D |
  db $1D, $1F, $F0, $1F, $80, $00, $00, $00 ; $168C25 |
  db $1F, $1F, $F0, $1F, $B7, $27, $00, $00 ; $168C2D |
  db $1F, $1F, $F0, $04, $80, $00, $00, $00 ; $168C35 |
  db $1F, $1F, $F0, $1F, $A6, $7F, $00, $80 ; $168C3D |
  db $1F, $1F, $F0, $1F, $80, $00, $00, $80 ; $168C45 |
  db $1F, $1C, $E0, $1F, $DA, $7F, $00, $00 ; $168C4D |
  db $1F, $1F, $F0, $1F, $FF, $0A, $00, $00 ; $168C55 |
  db $1C, $13, $10, $1F, $FF, $7F, $00, $00 ; $168C5D |
  db $1F, $01, $00, $0F, $E3, $7F, $00, $00 ; $168C65 |
  db $1F, $1F, $F0, $08, $00, $00, $00, $00 ; $168C6D |
  db $1F, $15, $A0, $14, $00, $00, $00, $00 ; $168C75 |
  db $1F, $1F, $F0, $1F, $FF, $7F, $00, $00 ; $168C7D |
  db $1F, $1F, $F0, $1F, $A5, $7F, $00, $00 ; $168C85 |
  db $1F, $1F, $F0, $1F, $D0, $16, $00, $00 ; $168C8D |
  db $1F, $1A, $A0, $07, $CF, $36, $00, $80 ; $168C95 |
  db $00, $8C, $A6, $8E, $28, $8F, $27, $90 ; $168C9D |
  db $8F, $0A, $01, $05, $01, $11, $06, $C8 ; $168CA5 |
  db $07, $0D, $18, $40, $08, $20, $09, $01 ; $168CAD |
  db $03, $8D, $80, $60, $66, $69, $6B, $2B ; $168CB5 |
  db $8D, $80, $02, $60, $20, $90, $06, $BE ; $168CBD |
  db $8F, $80, $60, $6D, $6B, $8E, $80, $02 ; $168CC5 |
  db $80, $6D, $6B, $2B, $02, $4D, $69, $66 ; $168CCD |
  db $60, $64, $66, $60, $69, $60, $66, $60 ; $168CD5 |
  db $69, $60, $6B, $60, $2B, $02, $4C, $6B ; $168CDD |
  db $69, $66, $89, $80, $37, $02, $58, $77 ; $168CE5 |
  db $75, $72, $75, $08, $00, $75, $02, $97 ; $168CED |
  db $08, $20, $60, $66, $68, $69, $6B, $6D ; $168CF5 |
  db $70, $72, $60, $6D, $60, $70, $60, $72 ; $168CFD |
  db $60, $36, $02, $01, $57, $01, $57, $40 ; $168D05 |
  db $60, $75, $60, $72, $70, $60, $31, $02 ; $168D0D |
  db $52, $60, $71, $8D, $80, $71, $72, $60 ; $168D15 |
  db $09, $02, $2C, $02, $4D, $69, $66, $61 ; $168D1D |
  db $03, $72, $74, $75, $01, $57, $01, $77 ; $168D25 |
  db $06, $64, $01, $59, $01, $79, $01, $5C ; $168D2D |
  db $01, $5C, $01, $5E, $01, $7E, $01, $03 ; $168D35 |
  db $49, $01, $69, $01, $4B, $01, $4B, $06 ; $168D3D |
  db $78, $00, $4B, $01, $4D, $01, $6D, $8B ; $168D45 |
  db $89, $86, $89, $88, $81, $85, $88, $8B ; $168D4D |
  db $8D, $91, $04, $08, $18, $40, $08, $16 ; $168D55 |
  db $09, $01, $05, $02, $16, $6D, $6D, $6B ; $168D5D |
  db $6D, $60, $6B, $60, $6D, $60, $6B, $60 ; $168D65 |
  db $6D, $6D, $60, $6B, $60, $0E, $01, $8D ; $168D6D |
  db $57, $69, $66, $68, $69, $6B, $68, $69 ; $168D75 |
  db $6B, $6D, $69, $6B, $6D, $70, $6E, $6D ; $168D7D |
  db $6B, $04, $08, $74, $72, $6D, $0E, $03 ; $168D85 |
  db $8D, $86, $74, $72, $71, $6D, $04, $00 ; $168D8D |
  db $04, $00, $18, $40, $08, $1C, $09, $02 ; $168D95 |
  db $05, $02, $2E, $92, $97, $99, $92, $9C ; $168D9D |
  db $92, $9B, $92, $97, $9C, $92, $9B, $92 ; $168DA5 |
  db $99, $12, $00, $8D, $B8, $92, $97, $0E ; $168DAD |
  db $01, $8D, $95, $9C, $01, $03, $88, $01 ; $168DB5 |
  db $A8, $86, $84, $80, $81, $84, $01, $88 ; $168DBD |
  db $01, $A8, $86, $84, $80, $83, $80, $01 ; $168DC5 |
  db $84, $01, $84, $83, $81, $80, $81, $80 ; $168DCD |
  db $03, $97, $80, $97, $99, $80, $01, $D9 ; $168DD5 |
  db $01, $99, $04, $00, $99, $9C, $9E, $99 ; $168DDD |
  db $03, $8B, $81, $89, $81, $88, $81, $86 ; $168DE5 |
  db $81, $84, $12, $08, $8E, $10, $86, $80 ; $168DED |
  db $01, $88, $01, $88, $84, $81, $03, $97 ; $168DF5 |
  db $99, $9C, $80, $03, $88, $84, $81, $03 ; $168DFD |
  db $97, $99, $80, $99, $80, $01, $99, $0E ; $168E05 |
  db $01, $8D, $DF, $01, $86, $01, $A6, $88 ; $168E0D |
  db $88, $86, $88, $80, $88, $86, $88, $8D ; $168E15 |
  db $8D, $8B, $8D, $80, $8B, $8D, $80, $16 ; $168E1D |
  db $8D, $93, $17, $06, $C8, $07, $0A, $18 ; $168E25 |
  db $40, $08, $20, $09, $01, $03, $89, $80 ; $168E2D |
  db $60, $66, $6D, $66, $29, $02, $01, $48 ; $168E35 |
  db $01, $68, $80, $00, $89, $86, $84, $00 ; $168E3D |
  db $A3, $63, $64, $66, $A9, $60, $A8, $03 ; $168E45 |
  db $92, $99, $95, $97, $92, $99, $95, $97 ; $168E4D |
  db $02, $CE, $08, $00, $03, $6E, $02, $8E ; $168E55 |
  db $07, $08, $08, $13, $C6, $C9, $CD, $A4 ; $168E5D |
  db $A5, $C6, $C9, $ED, $04, $00, $18, $80 ; $168E65 |
  db $08, $16, $09, $01, $04, $00, $7E, $7E ; $168E6D |
  db $7E, $7E, $60, $7E, $60, $7E, $60, $7E ; $168E75 |
  db $60, $7E, $7E, $60, $7E, $60, $0E, $01 ; $168E7D |
  db $8E, $71, $7E, $7A, $7C, $7E, $03, $68 ; $168E85 |
  db $64, $66, $68, $69, $66, $68, $69, $6D ; $168E8D |
  db $6B, $69, $68, $07, $0C, $08, $11, $A1 ; $168E95 |
  db $A5, $A8, $AD, $04, $00, $02, $60, $04 ; $168E9D |
  db $00, $18, $40, $08, $1C, $07, $0A, $09 ; $168EA5 |
  db $02, $05, $02, $2E, $92, $97, $99, $92 ; $168EAD |
  db $9C, $92, $9B, $92, $97, $9C, $92, $9B ; $168EB5 |
  db $92, $99, $12, $00, $8E, $C9, $92, $97 ; $168EBD |
  db $0E, $01, $8E, $A4, $9C, $40, $18, $80 ; $168EC5 |
  db $07, $0E, $08, $09, $09, $01, $04, $00 ; $168ECD |
  db $9C, $95, $99, $95, $0E, $03, $8E, $D3 ; $168ED5 |
  db $9E, $99, $9C, $99, $9E, $99, $9C, $99 ; $168EDD |
  db $9E, $99, $03, $88, $81, $86, $81, $84 ; $168EE5 |
  db $81, $07, $0A, $08, $13, $01, $CD, $08 ; $168EED |
  db $05, $01, $CD, $08, $13, $01, $CB, $08 ; $168EF5 |
  db $05, $01, $CB, $08, $13, $01, $D0, $08 ; $168EFD |
  db $05, $01, $D0, $08, $13, $CF, $CB, $01 ; $168F05 |
  db $C8, $08, $05, $01, $C8, $08, $13, $01 ; $168F0D |
  db $C6, $08, $05, $01, $C6, $08, $13, $01 ; $168F15 |
  db $C1, $08, $05, $C1, $01, $E1, $16, $8E ; $168F1D |
  db $A0, $17, $06, $FF, $08, $02, $09, $02 ; $168F25 |
  db $D2, $02, $B0, $70, $72, $01, $AB, $01 ; $168F2D |
  db $6B, $6D, $60, $CE, $71, $D2, $D0, $02 ; $168F35 |
  db $CE, $6E, $02, $90, $D2, $02, $B0, $70 ; $168F3D |
  db $72, $02, $AB, $60, $6C, $CD, $02, $B2 ; $168F45 |
  db $72, $71, $02, $B0, $70, $6F, $CE, $D9 ; $168F4D |
  db $09, $03, $06, $C8, $62, $62, $62, $62 ; $168F55 |
  db $60, $62, $60, $62, $60, $62, $60, $62 ; $168F5D |
  db $62, $60, $62, $60, $64, $64, $64, $64 ; $168F65 |
  db $60, $64, $60, $64, $60, $64, $60, $64 ; $168F6D |
  db $64, $60, $64, $60, $A6, $A8, $A9, $AB ; $168F75 |
  db $06, $E6, $08, $0E, $94, $60, $94, $60 ; $168F7D |
  db $94, $60, $94, $60, $76, $76, $96, $04 ; $168F85 |
  db $00, $04, $00, $06, $C8, $08, $02, $66 ; $168F8D |
  db $60, $66, $66, $06, $F0, $08, $0E, $92 ; $168F95 |
  db $06, $C8, $08, $02, $66, $66, $0E, $07 ; $168F9D |
  db $8F, $8E, $04, $00, $69, $60, $69, $69 ; $168FA5 |
  db $06, $F0, $08, $0E, $92, $08, $02, $06 ; $168FAD |
  db $C8, $69, $69, $0E, $01, $8F, $A7, $04 ; $168FB5 |
  db $00, $6B, $60, $6B, $6B, $08, $0E, $06 ; $168FBD |
  db $F0, $92, $08, $02, $06, $C8, $6B, $6B ; $168FC5 |
  db $0E, $01, $8F, $BC, $04, $00, $61, $60 ; $168FCD |
  db $61, $61, $08, $0E, $06, $F0, $92, $08 ; $168FD5 |
  db $02, $06, $C8, $61, $61, $0E, $02, $8F ; $168FDD |
  db $D1, $08, $0E, $06, $E6, $76, $76, $91 ; $168FE5 |
  db $76, $76, $91, $04, $00, $08, $02, $06 ; $168FED |
  db $C8, $69, $60, $69, $69, $08, $0E, $06 ; $168FF5 |
  db $F0, $92, $08, $02, $06, $C8, $69, $69 ; $168FFD |
  db $0E, $01, $8F, $F0, $04, $00, $6B, $60 ; $169005 |
  db $6B, $6B, $08, $0E, $06, $F0, $92, $08 ; $16900D |
  db $02, $06, $C8, $6B, $6B, $0E, $01, $90 ; $169015 |
  db $09, $04, $00, $6D, $60, $6D, $6D, $08 ; $16901D |
  db $0E, $06, $F0, $92, $08, $02, $06, $C8 ; $169025 |
  db $6D, $6D, $0E, $02, $90, $1E, $6B, $60 ; $16902D |
  db $6B, $6B, $08, $0E, $06, $F0, $92, $08 ; $169035 |
  db $02, $06, $C8, $6B, $6B, $04, $00, $69 ; $16903D |
  db $60, $69, $69, $08, $0E, $06, $F0, $92 ; $169045 |
  db $08, $02, $06, $F0, $69, $69, $0E, $01 ; $16904D |
  db $90, $42, $04, $00, $6B, $60, $6B, $6B ; $169055 |
  db $08, $0E, $06, $F0, $92, $08, $02, $06 ; $16905D |
  db $C8, $6B, $6B, $0E, $01, $90, $57, $04 ; $169065 |
  db $00, $61, $60, $61, $61, $08, $0E, $06 ; $16906D |
  db $F0, $92, $08, $02, $06, $C8, $61, $61 ; $169075 |
  db $0E, $02, $90, $6C, $08, $0E, $06, $F0 ; $16907D |
  db $60, $96, $60, $96, $76, $76, $16, $8F ; $169085 |
  db $8C, $17, $06, $C8, $08, $0C, $07, $0C ; $16908D |
  db $04, $00, $E0, $0E, $07, $90, $95, $04 ; $169095 |
  db $00, $68, $68, $68, $68, $60, $68, $60 ; $16909D |
  db $68, $60, $68, $60, $68, $68, $60, $68 ; $1690A5 |
  db $60, $0E, $01, $90, $9C, $AB, $AB, $AB ; $1690AD |
  db $AB, $04, $00, $6C, $68, $65, $0E, $03 ; $1690B5 |
  db $90, $B6, $6C, $68, $65, $68, $04, $00 ; $1690BD |
  db $04, $00, $63, $60, $6F, $6F, $68, $60 ; $1690C5 |
  db $6F, $6F, $0E, $1E, $90, $C5, $63, $68 ; $1690CD |
  db $6C, $6A, $68, $6C, $6A, $68, $16, $90 ; $1690D5 |
  db $C3, $17, $00, $90, $E8, $92, $31, $93 ; $1690DD |
  db $91, $94, $B1, $0A, $03, $05, $01, $EB ; $1690E5 |
  db $06, $96, $07, $0B, $18, $C0, $08, $1C ; $1690ED |
  db $04, $00, $60, $74, $97, $99, $97, $99 ; $1690F5 |
  db $77, $99, $80, $74, $60, $74, $97, $99 ; $1690FD |
  db $97, $99, $77, $99, $7A, $79, $77, $0E ; $169105 |
  db $04, $90, $F5, $07, $09, $18, $80, $09 ; $16910D |
  db $02, $60, $74, $76, $77, $79, $77, $76 ; $169115 |
  db $77, $7B, $79, $7B, $7E, $03, $68, $6B ; $16911D |
  db $6D, $08, $11, $06, $FF, $01, $6F, $01 ; $169125 |
  db $EF, $04, $00, $18, $40, $04, $00, $07 ; $16912D |
  db $0C, $09, $01, $08, $1C, $06, $64, $60 ; $169135 |
  db $02, $03, $88, $86, $83, $02, $86, $88 ; $16913D |
  db $02, $80, $60, $02, $88, $86, $88, $8B ; $169145 |
  db $8A, $88, $86, $01, $C3, $12, $48, $91 ; $16914D |
  db $89, $08, $05, $C3, $02, $01, $A3, $08 ; $169155 |
  db $1C, $03, $8F, $90, $92, $94, $96, $02 ; $16915D |
  db $B9, $9B, $01, $D7, $08, $05, $02, $01 ; $169165 |
  db $B7, $08, $1C, $97, $99, $97, $96, $97 ; $16916D |
  db $01, $DB, $08, $05, $01, $DB, $08, $1C ; $169175 |
  db $01, $DE, $08, $05, $01, $DE, $18, $80 ; $16917D |
  db $0E, $01, $91, $32, $08, $1C, $01, $83 ; $169185 |
  db $63, $64, $86, $81, $06, $96, $C3, $03 ; $16918D |
  db $B7, $B9, $01, $DB, $01, $9B, $B9, $97 ; $169195 |
  db $D9, $B7, $B9, $DB, $DF, $03, $CA, $01 ; $16919D |
  db $AD, $01, $8D, $08, $1C, $09, $01, $18 ; $1691A5 |
  db $C0, $07, $0A, $01, $84, $04, $00, $9C ; $1691AD |
  db $9B, $9C, $03, $88, $02, $8B, $02, $8F ; $1691B5 |
  db $84, $80, $83, $84, $88, $8B, $AF, $12 ; $1691BD |
  db $08, $91, $D9, $8D, $80, $8A, $02, $01 ; $1691C5 |
  db $C6, $02, $C6, $01, $66, $60, $01, $84 ; $1691CD |
  db $0E, $01, $91, $B2, $92, $80, $8D, $02 ; $1691D5 |
  db $01, $CF, $06, $F0, $01, $EF, $18, $40 ; $1691DD |
  db $07, $08, $60, $02, $8F, $8D, $8B, $8D ; $1691E5 |
  db $8B, $02, $8A, $68, $09, $02, $08, $16 ; $1691ED |
  db $60, $02, $88, $86, $83, $86, $83, $02 ; $1691F5 |
  db $81, $01, $63, $01, $E3, $60, $02, $88 ; $1691FD |
  db $86, $88, $8B, $8A, $88, $66, $01, $68 ; $169205 |
  db $08, $00, $01, $E8, $60, $02, $8B, $8A ; $16920D |
  db $88, $8A, $88, $A6, $E3, $09, $00, $06 ; $169215 |
  db $96, $63, $02, $80, $63, $02, $80, $63 ; $16921D |
  db $02, $80, $09, $01, $63, $60, $66, $60 ; $169225 |
  db $16, $91, $2E, $17, $06, $FF, $07, $0B ; $16922D |
  db $08, $00, $09, $02, $E0, $E0, $E0, $E0 ; $169235 |
  db $04, $00, $09, $03, $18, $80, $08, $1C ; $16923D |
  db $74, $60, $6F, $60, $72, $60, $73, $74 ; $169245 |
  db $60, $74, $6F, $60, $72, $60, $73, $60 ; $16924D |
  db $0E, $05, $92, $3D, $0C, $00, $07, $09 ; $169255 |
  db $60, $74, $72, $6F, $72, $6F, $6D, $6B ; $16925D |
  db $6D, $6B, $68, $66, $68, $63, $66, $01 ; $169265 |
  db $6F, $01, $CF, $00, $6F, $72, $74, $77 ; $16926D |
  db $7B, $7E, $03, $68, $6B, $6F, $72, $74 ; $169275 |
  db $77, $04, $08, $04, $08, $04, $08, $07 ; $16927D |
  db $0A, $09, $01, $18, $80, $08, $04, $04 ; $169285 |
  db $08, $74, $60, $6B, $60, $6F, $60, $6B ; $16928D |
  db $74, $60, $74, $6B, $60, $6F, $60, $6B ; $169295 |
  db $60, $0E, $01, $92, $8C, $04, $08, $6F ; $16929D |
  db $60, $68, $60, $6B, $60, $68, $6F, $60 ; $1692A5 |
  db $6F, $68, $60, $6B, $60, $68, $60, $0E ; $1692AD |
  db $01, $92, $A2, $6F, $60, $6B, $60, $6D ; $1692B5 |
  db $60, $6B, $6F, $60, $6F, $6B, $60, $6D ; $1692BD |
  db $60, $6B, $60, $6F, $60, $68, $60, $6B ; $1692C5 |
  db $60, $68, $6F, $60, $6F, $68, $60, $6B ; $1692CD |
  db $60, $68, $60, $73, $60, $6F, $60, $70 ; $1692D5 |
  db $60, $6F, $73, $60, $73, $6F, $60, $70 ; $1692DD |
  db $60, $6F, $60, $14, $08, $93, $05, $07 ; $1692E5 |
  db $0B, $08, $00, $AF, $AF, $AF, $00, $52 ; $1692ED |
  db $51, $4F, $4D, $4C, $4A, $48, $46, $45 ; $1692F5 |
  db $43, $41, $03, $58, $10, $01, $92, $82 ; $1692FD |
  db $07, $0A, $08, $16, $A3, $A3, $A3, $86 ; $169305 |
  db $18, $C0, $06, $FF, $08, $1C, $09, $01 ; $16930D |
  db $0C, $02, $01, $84, $01, $84, $83, $84 ; $169315 |
  db $88, $02, $8B, $02, $8F, $84, $80, $83 ; $16931D |
  db $84, $88, $8B, $AF, $8D, $80, $8A, $02 ; $169325 |
  db $01, $C6, $02, $C6, $01, $66, $60, $01 ; $16932D |
  db $84, $01, $84, $83, $84, $88, $02, $8B ; $169335 |
  db $02, $8F, $84, $80, $83, $84, $88, $8B ; $16933D |
  db $AF, $92, $80, $8D, $02, $01, $CF, $06 ; $169345 |
  db $C8, $01, $EF, $06, $F0, $08, $16, $09 ; $16934D |
  db $01, $04, $00, $07, $08, $60, $02, $03 ; $169355 |
  db $8F, $8D, $8B, $8D, $8B, $02, $8A, $12 ; $16935D |
  db $08, $93, $74, $0C, $00, $01, $68, $01 ; $169365 |
  db $C8, $A8, $A7, $0E, $02, $93, $56, $68 ; $16936D |
  db $60, $02, $88, $86, $83, $86, $83, $A1 ; $169375 |
  db $08, $00, $E3, $60, $02, $8F, $60, $02 ; $16937D |
  db $8F, $60, $02, $8F, $6F, $60, $72, $60 ; $169385 |
  db $16, $92, $7E, $17, $04, $00, $06, $96 ; $16938D |
  db $08, $02, $09, $02, $04, $00, $60, $74 ; $169395 |
  db $97, $99, $97, $99, $77, $99, $80, $74 ; $16939D |
  db $60, $74, $97, $99, $97, $99, $77, $99 ; $1693A5 |
  db $7A, $79, $77, $0E, $01, $93, $99, $04 ; $1693AD |
  db $48, $08, $02, $09, $02, $06, $FF, $CA ; $1693B5 |
  db $08, $1B, $AA, $01, $8A, $08, $02, $88 ; $1693BD |
  db $01, $CB, $08, $1B, $01, $CB, $0E, $02 ; $1693C5 |
  db $93, $B4, $06, $96, $09, $02, $08, $02 ; $1693CD |
  db $60, $68, $66, $63, $66, $63, $61, $03 ; $1693D5 |
  db $77, $79, $77, $74, $72, $74, $72, $70 ; $1693DD |
  db $01, $74, $01, $D4, $94, $74, $03, $68 ; $1693E5 |
  db $03, $74, $6F, $72, $73, $04, $00, $04 ; $1693ED |
  db $00, $04, $00, $94, $8F, $92, $73, $94 ; $1693F5 |
  db $74, $8F, $92, $93, $0E, $02, $93, $F6 ; $1693FD |
  db $8F, $8F, $94, $6F, $8F, $75, $90, $92 ; $169405 |
  db $94, $90, $8B, $8D, $6F, $90, $70, $8B ; $16940D |
  db $8D, $8F, $95, $90, $91, $73, $95, $75 ; $169415 |
  db $90, $91, $93, $8F, $92, $94, $97, $99 ; $16941D |
  db $9B, $9E, $9F, $13, $00, $94, $36, $AF ; $169425 |
  db $AF, $AF, $02, $92, $74, $0F, $01, $93 ; $16942D |
  db $F4, $AF, $AF, $AF, $02, $92, $01, $70 ; $169435 |
  db $02, $01, $90, $70, $90, $8D, $8F, $9B ; $16943D |
  db $90, $01, $90, $01, $70, $70, $90, $90 ; $169445 |
  db $8D, $8F, $9B, $90, $8F, $02, $80, $6F ; $16944D |
  db $8F, $8D, $8F, $9B, $8F, $01, $95, $01 ; $169455 |
  db $75, $75, $95, $94, $94, $92, $92, $91 ; $16945D |
  db $90, $02, $80, $70, $90, $8D, $8F, $9B ; $169465 |
  db $90, $01, $90, $01, $70, $70, $90, $90 ; $16946D |
  db $8D, $8F, $9B, $90, $8F, $80, $8F, $92 ; $169475 |
  db $8F, $93, $8F, $96, $8F, $BB, $BB, $BB ; $16947D |
  db $BB, $04, $00, $60, $74, $94, $92, $73 ; $169485 |
  db $02, $94, $02, $AF, $90, $9C, $90, $9C ; $16948D |
  db $92, $9E, $8F, $9B, $0E, $01, $94, $86 ; $169495 |
  db $B4, $B4, $B3, $B3, $B2, $B2, $B0, $B0 ; $16949D |
  db $EF, $60, $BB, $BB, $02, $9B, $9B, $9B ; $1694A5 |
  db $16, $93, $F2, $17, $06, $C8, $07, $0A ; $1694AD |
  db $08, $0C, $04, $00, $A3, $0E, $06, $94 ; $1694B5 |
  db $B7, $63, $68, $68, $68, $A3, $A3, $A3 ; $1694BD |
  db $A3, $63, $08, $03, $02, $89, $08, $0C ; $1694C5 |
  db $87, $87, $85, $65, $65, $63, $68, $68 ; $1694CD |
  db $68, $04, $00, $04, $00, $A3, $0E, $06 ; $1694D5 |
  db $94, $D8, $63, $68, $68, $68, $0F, $02 ; $1694DD |
  db $94, $D6, $63, $04, $00, $07, $0C, $66 ; $1694E5 |
  db $0E, $0A, $94, $E8, $68, $68, $68, $6A ; $1694ED |
  db $A6, $63, $60, $63, $63, $6A, $60, $60 ; $1694F5 |
  db $60, $63, $6C, $6C, $6C, $04, $00, $04 ; $1694FD |
  db $00, $63, $60, $6F, $6F, $63, $6C, $60 ; $169505 |
  db $6F, $63, $6F, $6D, $60, $63, $6F, $6F ; $16950D |
  db $6F, $0E, $06, $95, $04, $63, $60, $6C ; $169515 |
  db $6C, $63, $60, $6C, $6C, $66, $66, $60 ; $16951D |
  db $66, $63, $6C, $6C, $60, $04, $00, $66 ; $169525 |
  db $60, $6C, $6C, $63, $6C, $60, $6C, $66 ; $16952D |
  db $6C, $6D, $60, $63, $6C, $6C, $60, $0E ; $169535 |
  db $05, $95, $2A, $66, $60, $6C, $6C, $63 ; $16953D |
  db $60, $60, $60, $66, $6C, $6D, $60, $63 ; $169545 |
  db $6C, $6C, $6C, $66, $60, $6C, $6C, $63 ; $16954D |
  db $6C, $60, $6C, $66, $6C, $6D, $60, $63 ; $169555 |
  db $60, $60, $63, $04, $00, $66, $60, $63 ; $16955D |
  db $6C, $63, $6C, $6D, $66, $6C, $60, $65 ; $169565 |
  db $6C, $63, $60, $6C, $63, $0E, $0D, $95 ; $16956D |
  db $60, $66, $60, $6C, $6C, $63, $6C, $60 ; $169575 |
  db $66, $63, $6C, $6D, $60, $63, $6D, $60 ; $16957D |
  db $63, $63, $6D, $60, $60, $63, $6D, $60 ; $169585 |
  db $60, $63, $6D, $60, $60, $63, $60, $6A ; $16958D |
  db $60, $16, $95, $02, $17, $00, $95, $A3 ; $169595 |
  db $96, $EB, $98, $47, $99, $93, $0A, $04 ; $16959D |
  db $18, $40, $05, $01, $EB, $08, $1D, $07 ; $1695A5 |
  db $0A, $06, $E6, $03, $96, $80, $96, $80 ; $1695AD |
  db $09, $01, $8D, $80, $8D, $8F, $04, $00 ; $1695B5 |
  db $18, $C0, $80, $79, $78, $79, $7B, $80 ; $1695BD |
  db $79, $78, $79, $7B, $A0, $0E, $01, $95 ; $1695C5 |
  db $BB, $02, $9F, $02, $03, $88, $01, $8A ; $1695CD |
  db $CA, $01, $8A, $6F, $80, $6F, $80, $6F ; $1695D5 |
  db $80, $6F, $80, $6F, $60, $04, $00, $07 ; $1695DD |
  db $08, $06, $FF, $09, $02, $08, $16, $B3 ; $1695E5 |
  db $02, $9A, $01, $BB, $08, $17, $02, $01 ; $1695ED |
  db $9B, $08, $16, $73, $60, $97, $76, $60 ; $1695F5 |
  db $76, $74, $60, $01, $B4, $08, $17, $94 ; $1695FD |
  db $02, $01, $94, $08, $16, $BD, $02, $9B ; $169605 |
  db $01, $BA, $08, $17, $02, $01, $9A, $08 ; $16960D |
  db $16, $76, $74, $73, $60, $73, $60, $73 ; $169615 |
  db $74, $60, $01, $B6, $08, $17, $96, $02 ; $16961D |
  db $01, $96, $06, $E6, $08, $16, $01, $97 ; $169625 |
  db $08, $17, $01, $B7, $08, $16, $77, $79 ; $16962D |
  db $02, $9B, $02, $99, $97, $02, $96, $02 ; $169635 |
  db $93, $01, $AF, $08, $17, $AF, $01, $8F ; $16963D |
  db $08, $16, $02, $94, $02, $96, $B8, $9B ; $169645 |
  db $9A, $98, $02, $9A, $02, $9B, $01, $BD ; $16964D |
  db $08, $17, $BD, $01, $9D, $07, $0A, $06 ; $169655 |
  db $96, $08, $0B, $80, $9B, $9B, $9B, $06 ; $16965D |
  db $E6, $02, $9B, $02, $9A, $96, $80, $06 ; $169665 |
  db $96, $99, $99, $99, $06, $E6, $02, $99 ; $16966D |
  db $02, $98, $94, $80, $7D, $60, $9D, $9B ; $169675 |
  db $02, $9F, $02, $98, $01, $9B, $01, $9B ; $16967D |
  db $03, $6A, $60, $68, $60, $67, $60, $02 ; $169685 |
  db $85, $02, $83, $83, $80, $68, $60, $88 ; $16968D |
  db $87, $02, $85, $02, $83, $83, $80, $67 ; $169695 |
  db $60, $87, $88, $02, $88, $02, $03, $98 ; $16969D |
  db $98, $80, $03, $6A, $60, $8A, $88, $02 ; $1696A5 |
  db $87, $02, $85, $83, $85, $83, $85, $02 ; $1696AD |
  db $A7, $85, $83, $04, $08, $06, $C8, $6A ; $1696B5 |
  db $60, $66, $60, $63, $66, $60, $68, $60 ; $1696BD |
  db $6A, $60, $02, $88, $12, $08, $96, $D3 ; $1696C5 |
  db $66, $68, $0E, $01, $96, $B8, $09, $01 ; $1696CD |
  db $6A, $6D, $6F, $60, $6D, $60, $6A, $6D ; $1696D5 |
  db $60, $6F, $60, $6F, $6F, $60, $6F, $60 ; $1696DD |
  db $6F, $60, $16, $95, $E2, $17, $18, $40 ; $1696E5 |
  db $08, $1D, $06, $E6, $07, $0A, $03, $94 ; $1696ED |
  db $80, $94, $80, $94, $80, $94, $96, $04 ; $1696F5 |
  db $00, $09, $01, $08, $1D, $80, $03, $68 ; $1696FD |
  db $67, $68, $6A, $80, $68, $67, $68, $6A ; $169705 |
  db $A0, $0E, $01, $96, $FC, $08, $1C, $80 ; $16970D |
  db $6F, $60, $74, $60, $6F, $60, $02, $8D ; $169715 |
  db $6F, $80, $6F, $60, $72, $60, $6F, $60 ; $16971D |
  db $6D, $6F, $60, $02, $01, $8F, $08, $17 ; $169725 |
  db $02, $01, $AF, $04, $00, $04, $00, $07 ; $16972D |
  db $0C, $09, $00, $06, $E6, $18, $00, $08 ; $169735 |
  db $0F, $80, $03, $6F, $60, $6F, $6A, $80 ; $16973D |
  db $6F, $60, $6F, $6A, $A0, $12, $08, $97 ; $169745 |
  db $68, $80, $6F, $60, $6F, $68, $80, $6F ; $16974D |
  db $60, $6F, $68, $A0, $80, $6F, $60, $6F ; $169755 |
  db $71, $80, $6F, $60, $6F, $71, $A0, $0E ; $16975D |
  db $01, $97, $32, $09, $00, $07, $08, $18 ; $169765 |
  db $80, $08, $13, $CF, $D1, $D3, $D4, $18 ; $16976D |
  db $40, $07, $0C, $08, $1C, $80, $73, $74 ; $169775 |
  db $76, $8F, $60, $73, $74, $76, $8F, $02 ; $16977D |
  db $80, $80, $71, $73, $74, $76, $60, $76 ; $169785 |
  db $60, $76, $60, $74, $93, $91, $07, $0B ; $16978D |
  db $09, $01, $08, $09, $18, $C0, $04, $00 ; $169795 |
  db $04, $00, $7B, $7B, $03, $6A, $6A, $6F ; $16979D |
  db $6F, $76, $76, $0E, $01, $97, $9D, $13 ; $1697A5 |
  db $08, $97, $E6, $04, $00, $74, $74, $7B ; $1697AD |
  db $7B, $03, $68, $68, $6F, $6F, $0E, $01 ; $1697B5 |
  db $97, $B0, $04, $00, $78, $78, $7D, $7D ; $1697BD |
  db $03, $6C, $6C, $71, $71, $0E, $01, $97 ; $1697C5 |
  db $BF, $03, $74, $74, $7B, $7B, $03, $68 ; $1697CD |
  db $68, $6F, $6F, $03, $76, $76, $7B, $7B ; $1697D5 |
  db $03, $6A, $6A, $6F, $6F, $0F, $01, $97 ; $1697DD |
  db $9B, $04, $00, $74, $74, $7B, $7B, $03 ; $1697E5 |
  db $68, $68, $6F, $6F, $0E, $01, $97, $E6 ; $1697ED |
  db $04, $00, $76, $76, $7B, $7B, $03, $6A ; $1697F5 |
  db $6A, $6F, $6F, $0E, $01, $97, $F5, $04 ; $1697FD |
  db $00, $78, $78, $7D, $7D, $03, $6C, $6C ; $169805 |
  db $71, $71, $0E, $01, $98, $04, $09, $00 ; $16980D |
  db $06, $64, $18, $C0, $08, $0B, $04, $08 ; $169815 |
  db $6F, $6F, $6D, $60, $6F, $60, $6D, $6F ; $16981D |
  db $60, $72, $60, $71, $60, $6F, $60, $6D ; $169825 |
  db $0E, $01, $98, $1B, $6F, $6F, $6D, $60 ; $16982D |
  db $6F, $6D, $60, $6F, $60, $09, $01, $66 ; $169835 |
  db $66, $60, $66, $60, $66, $60, $16, $97 ; $16983D |
  db $30, $17, $08, $02, $07, $0C, $06, $C8 ; $169845 |
  db $09, $02, $8F, $80, $8F, $80, $92, $80 ; $16984D |
  db $92, $94, $80, $09, $03, $83, $87, $83 ; $169855 |
  db $88, $87, $85, $83, $80, $83, $8A, $83 ; $16985D |
  db $88, $81, $82, $83, $80, $83, $87, $83 ; $169865 |
  db $88, $87, $85, $83, $80, $83, $8A, $83 ; $16986D |
  db $87, $81, $82, $83, $04, $00, $09, $03 ; $169875 |
  db $63, $60, $63, $63, $63, $60, $63, $63 ; $16987D |
  db $63, $60, $63, $63, $63, $60, $63, $63 ; $169885 |
  db $68, $60, $68, $68, $68, $60, $68, $68 ; $16988D |
  db $68, $60, $68, $68, $68, $60, $68, $68 ; $169895 |
  db $6A, $60, $6A, $6A, $6A, $60, $6A, $6A ; $16989D |
  db $6A, $60, $6A, $6A, $6A, $60, $6A, $6A ; $1698A5 |
  db $63, $60, $63, $63, $63, $60, $63, $63 ; $1698AD |
  db $63, $60, $63, $63, $63, $60, $63, $63 ; $1698B5 |
  db $68, $60, $68, $68, $68, $60, $68, $68 ; $1698BD |
  db $68, $60, $68, $68, $68, $60, $68, $68 ; $1698C5 |
  db $67, $60, $67, $67, $67, $60, $67, $67 ; $1698CD |
  db $67, $60, $67, $67, $67, $60, $67, $67 ; $1698D5 |
  db $65, $60, $65, $65, $65, $60, $65, $65 ; $1698DD |
  db $65, $60, $65, $65, $65, $60, $65, $65 ; $1698E5 |
  db $6A, $60, $6A, $6A, $6A, $60, $6A, $6A ; $1698ED |
  db $6A, $60, $6A, $6A, $6A, $60, $6A, $6A ; $1698F5 |
  db $83, $60, $83, $60, $01, $63, $01, $63 ; $1698FD |
  db $83, $82, $09, $02, $8A, $8E, $94, $60 ; $169905 |
  db $94, $60, $01, $74, $01, $74, $94, $93 ; $16990D |
  db $8F, $93, $8C, $60, $8C, $60, $01, $6C ; $169915 |
  db $01, $6C, $8C, $8F, $91, $8C, $94, $60 ; $16991D |
  db $94, $60, $01, $74, $01, $74, $96, $94 ; $169925 |
  db $93, $91, $8F, $60, $8F, $60, $01, $6F ; $16992D |
  db $01, $6F, $8F, $8E, $8A, $8E, $94, $60 ; $169935 |
  db $94, $60, $01, $74, $01, $74, $94, $93 ; $16993D |
  db $8F, $93, $8A, $60, $8A, $60, $01, $6A ; $169945 |
  db $01, $6A, $8A, $91, $94, $96, $8C, $60 ; $16994D |
  db $8C, $60, $01, $6C, $01, $6C, $8F, $91 ; $169955 |
  db $8F, $8C, $72, $60, $72, $60, $72, $72 ; $16995D |
  db $60, $72, $60, $72, $60, $72, $72, $60 ; $169965 |
  db $72, $60, $74, $60, $74, $60, $74, $74 ; $16996D |
  db $60, $74, $60, $74, $60, $74, $74, $60 ; $169975 |
  db $74, $60, $6F, $60, $6F, $60, $6F, $6F ; $16997D |
  db $60, $6F, $60, $6F, $6F, $60, $6F, $60 ; $169985 |
  db $6F, $60, $16, $98, $79, $17, $08, $0C ; $16998D |
  db $07, $0A, $06, $96, $A9, $A9, $A9, $88 ; $169995 |
  db $88, $04, $00, $06, $C8, $63, $60, $6C ; $16999D |
  db $6C, $68, $6C, $60, $6C, $63, $60, $6C ; $1699A5 |
  db $6C, $68, $6C, $6C, $60, $0E, $03, $99 ; $1699AD |
  db $9E, $04, $00, $04, $00, $06, $C8, $63 ; $1699B5 |
  db $60, $6C, $6C, $68, $6C, $60, $6C, $63 ; $1699BD |
  db $60, $6C, $6C, $68, $6C, $6C, $60, $0E ; $1699C5 |
  db $07, $99, $B8, $04, $00, $06, $F0, $63 ; $1699CD |
  db $6F, $6D, $6F, $68, $6F, $6D, $6F, $0E ; $1699D5 |
  db $0F, $99, $D0, $04, $00, $63, $6F, $63 ; $1699DD |
  db $6F, $68, $63, $60, $63, $12, $00, $99 ; $1699E5 |
  db $FA, $63, $68, $6F, $6F, $68, $6F, $6D ; $1699ED |
  db $6F, $0E, $02, $99, $E0, $60, $68, $68 ; $1699F5 |
  db $60, $68, $60, $68, $60, $16, $99, $B6 ; $1699FD |
  db $17, $00, $9A, $0F, $9A, $EA, $9B, $DA ; $169A05 |
  db $9C, $5B, $0A, $05, $05, $03, $00, $07 ; $169A0D |
  db $0A, $04, $08, $04, $08, $06, $AA, $08 ; $169A15 |
  db $0B, $18, $80, $09, $01, $A8, $8B, $AF ; $169A1D |
  db $AF, $88, $A7, $8A, $B0, $B0, $87, $0E ; $169A25 |
  db $01, $9A, $18, $04, $00, $07, $0C, $18 ; $169A2D |
  db $40, $08, $1A, $0D, $00, $80, $03, $88 ; $169A35 |
  db $8B, $8D, $80, $8D, $80, $8D, $80, $6F ; $169A3D |
  db $6D, $8B, $80, $AD, $8B, $6D, $60, $12 ; $169A45 |
  db $08, $9A, $63, $80, $02, $AB, $4C, $AD ; $169A4D |
  db $8D, $02, $01, $6B, $0D, $0C, $02, $CB ; $169A55 |
  db $01, $A8, $0E, $03, $9A, $30, $80, $02 ; $169A5D |
  db $AB, $4F, $B0, $90, $02, $01, $6F, $01 ; $169A65 |
  db $EF, $04, $08, $07, $06, $18, $C0, $08 ; $169A6D |
  db $11, $06, $FF, $E8, $EB, $01, $ED, $08 ; $169A75 |
  db $01, $02, $01, $CD, $08, $11, $8B, $8D ; $169A7D |
  db $EB, $E8, $01, $E3, $08, $01, $01, $E3 ; $169A85 |
  db $0E, $01, $9A, $6E, $18, $80, $08, $11 ; $169A8D |
  db $ED, $01, $F0, $F0, $08, $05, $02, $01 ; $169A95 |
  db $D0, $90, $92, $08, $11, $01, $F4, $08 ; $169A9D |
  db $05, $01, $D4, $08, $11, $D7, $F6, $F2 ; $169AA5 |
  db $01, $F4, $08, $01, $F4, $01, $F4, $02 ; $169AAD |
  db $C0, $07, $0A, $08, $0B, $06, $DC, $18 ; $169AB5 |
  db $C0, $92, $90, $8F, $80, $88, $8D, $80 ; $169ABD |
  db $8D, $80, $88, $8B, $6D, $6B, $88, $8D ; $169AC5 |
  db $80, $8D, $80, $88, $09, $02, $18, $40 ; $169ACD |
  db $88, $80, $8B, $8D, $80, $8D, $80, $88 ; $169AD5 |
  db $8B, $6D, $6B, $88, $8D, $80, $8D, $80 ; $169ADD |
  db $88, $16, $9A, $16, $17, $04, $48, $06 ; $169AE5 |
  db $DC, $07, $09, $18, $80, $08, $07, $09 ; $169AED |
  db $01, $04, $48, $EF, $0D, $14, $01, $EE ; $169AF5 |
  db $0E, $01, $9A, $F6, $04, $00, $07, $0C ; $169AFD |
  db $08, $1A, $0D, $00, $80, $9B, $03, $88 ; $169B05 |
  db $88, $80, $88, $80, $88, $80, $68, $67 ; $169B0D |
  db $86, $80, $A8, $86, $88, $12, $08, $9B ; $169B15 |
  db $2F, $80, $02, $A6, $A8, $88, $01, $86 ; $169B1D |
  db $0D, $0C, $02, $C6, $01, $A3, $0E, $03 ; $169B25 |
  db $9B, $01, $0D, $00, $80, $02, $A6, $A8 ; $169B2D |
  db $88, $01, $87, $01, $E7, $04, $40, $07 ; $169B35 |
  db $08, $18, $40, $08, $07, $06, $FF, $FB ; $169B3D |
  db $08, $05, $01, $FB, $08, $11, $01, $03 ; $169B45 |
  db $E9, $08, $01, $01, $E9, $08, $00, $18 ; $169B4D |
  db $C0, $06, $DC, $80, $83, $84, $87, $88 ; $169B55 |
  db $8A, $80, $01, $8B, $01, $AB, $00, $8A ; $169B5D |
  db $8B, $8A, $00, $A8, $87, $01, $88, $E8 ; $169B65 |
  db $08, $01, $01, $E8, $0E, $01, $9B, $3A ; $169B6D |
  db $08, $11, $06, $FF, $E8, $ED, $01, $EE ; $169B75 |
  db $08, $05, $01, $EE, $08, $12, $06, $DC ; $169B7D |
  db $09, $00, $07, $0C, $80, $8F, $90, $92 ; $169B85 |
  db $B4, $92, $01, $90, $02, $01, $D0, $01 ; $169B8D |
  db $8F, $90, $01, $EF, $CB, $C8, $A0, $AD ; $169B95 |
  db $AF, $B0, $92, $94, $80, $95, $80, $97 ; $169B9D |
  db $80, $09, $01, $01, $8D, $01, $8D, $8B ; $169BA5 |
  db $AD, $8B, $AD, $8B, $08, $17, $02, $CD ; $169BAD |
  db $08, $12, $8B, $89, $07, $08, $06, $FF ; $169BB5 |
  db $01, $E8, $01, $E8, $08, $00, $03, $94 ; $169BBD |
  db $80, $97, $99, $80, $99, $80, $94, $97 ; $169BC5 |
  db $79, $77, $74, $60, $99, $80, $99, $80 ; $169BCD |
  db $94, $16, $9A, $EA, $17, $06, $64, $07 ; $169BD5 |
  db $0E, $08, $02, $09, $02, $04, $00, $04 ; $169BDD |
  db $00, $A8, $8B, $AF, $AF, $88, $A7, $8A ; $169BE5 |
  db $B0, $B0, $87, $0E, $08, $9B, $E4, $80 ; $169BED |
  db $02, $A7, $A9, $89, $01, $8A, $06, $FF ; $169BF5 |
  db $01, $EA, $04, $00, $06, $64, $A8, $8B ; $169BFD |
  db $AF, $AF, $88, $A7, $8A, $B0, $B0, $87 ; $169C05 |
  db $0E, $07, $9B, $FF, $AD, $90, $B4, $B4 ; $169C0D |
  db $8D, $AC, $8F, $B4, $B4, $8C, $04, $00 ; $169C15 |
  db $A9, $8D, $B2, $B2, $89, $0E, $01, $9C ; $169C1D |
  db $1B, $04, $00, $AD, $90, $B4, $B4, $8D ; $169C25 |
  db $0E, $01, $9C, $26, $04, $00, $AB, $90 ; $169C2D |
  db $B4, $B4, $8B, $0E, $01, $9C, $31, $04 ; $169C35 |
  db $00, $A9, $8D, $B0, $B0, $89, $0E, $03 ; $169C3D |
  db $9C, $3C, $04, $00, $A8, $8B, $AF, $AF ; $169C45 |
  db $88, $A7, $8A, $B0, $B0, $87, $0E, $01 ; $169C4D |
  db $9C, $47, $16, $9B, $E2, $17, $07, $0B ; $169C55 |
  db $08, $0C, $04, $00, $04, $00, $04, $00 ; $169C5D |
  db $06, $C8, $83, $8F, $88, $83, $8F, $83 ; $169C65 |
  db $06, $FF, $8C, $06, $C8, $83, $8F, $83 ; $169C6D |
  db $06, $FF, $8C, $06, $C8, $83, $83, $83 ; $169C75 |
  db $88, $8F, $0E, $08, $9C, $63, $80, $88 ; $169C7D |
  db $81, $88, $88, $81, $88, $88, $80, $68 ; $169C85 |
  db $68, $68, $60, $68, $60, $88, $88, $88 ; $169C8D |
  db $88, $04, $08, $8D, $03, $8F, $88, $83 ; $169C95 |
  db $8F, $83, $06, $FF, $8C, $06, $C8, $83 ; $169C9D |
  db $8F, $83, $06, $FF, $8C, $06, $C8, $83 ; $169CA5 |
  db $83, $83, $88, $8F, $0E, $0D, $9C, $96 ; $169CAD |
  db $04, $00, $88, $83, $8F, $88, $80, $8F ; $169CB5 |
  db $88, $83, $0E, $01, $9C, $B5, $83, $83 ; $169CBD |
  db $88, $83, $83, $88, $8D, $83, $83, $83 ; $169CC5 |
  db $88, $83, $88, $88, $88, $88, $16, $9C ; $169CCD |
  db $5F, $17, $00, $9C, $E0, $9D, $F3, $9F ; $169CD5 |
  db $57, $A0, $4E, $0A, $02, $04, $08, $05 ; $169CDD |
  db $01, $EB, $06, $78, $07, $0A, $18, $40 ; $169CE5 |
  db $08, $07, $09, $01, $04, $08, $04, $08 ; $169CED |
  db $88, $88, $6B, $88, $8D, $8F, $06, $FF ; $169CF5 |
  db $02, $8D, $06, $78, $6B, $6A, $0E, $01 ; $169CFD |
  db $9C, $F3, $13, $08, $9D, $22, $88, $8B ; $169D05 |
  db $6A, $86, $88, $8B, $6A, $8A, $86, $84 ; $169D0D |
  db $86, $68, $8F, $02, $01, $AA, $02, $01 ; $169D15 |
  db $8A, $0F, $01, $9C, $F1, $88, $8B, $6A ; $169D1D |
  db $8D, $8B, $8B, $6F, $8D, $90, $8F, $92 ; $169D25 |
  db $77, $96, $02, $01, $B4, $02, $01, $94 ; $169D2D |
  db $04, $08, $07, $0B, $18, $C0, $08, $12 ; $169D35 |
  db $88, $86, $68, $86, $88, $02, $80, $68 ; $169D3D |
  db $6A, $6B, $6F, $AD, $02, $8A, $02, $86 ; $169D45 |
  db $80, $A0, $8D, $8D, $6B, $8A, $8D, $02 ; $169D4D |
  db $80, $6F, $6D, $6B, $6A, $88, $88, $68 ; $169D55 |
  db $86, $02, $88, $80, $A0, $0E, $01, $9D ; $169D5D |
  db $35, $04, $08, $8A, $8B, $8A, $88, $02 ; $169D65 |
  db $8A, $01, $A6, $01, $66, $0E, $01, $9D ; $169D6D |
  db $66, $18, $80, $06, $C8, $02, $86, $02 ; $169D75 |
  db $84, $86, $02, $88, $02, $86, $88, $02 ; $169D7D |
  db $8A, $02, $88, $8A, $02, $8B, $02, $8A ; $169D85 |
  db $8B, $04, $08, $08, $06, $18, $C0, $6D ; $169D8D |
  db $60, $6D, $60, $70, $74, $60, $02, $92 ; $169D95 |
  db $90, $8F, $8D, $70, $60, $6F, $60, $6D ; $169D9D |
  db $6B, $60, $02, $01, $AD, $02, $01, $8D ; $169DA5 |
  db $12, $08, $9D, $CD, $6D, $60, $6D, $60 ; $169DAD |
  db $70, $72, $60, $02, $94, $92, $94, $95 ; $169DB5 |
  db $77, $60, $75, $60, $74, $92, $02, $01 ; $169DBD |
  db $B0, $02, $01, $90, $0E, $01, $9D, $8E ; $169DC5 |
  db $09, $02, $6D, $60, $6B, $60, $69, $68 ; $169DCD |
  db $60, $02, $86, $88, $8B, $8D, $70, $60 ; $169DD5 |
  db $6F, $60, $6D, $8B, $8D, $07, $0C, $08 ; $169DDD |
  db $00, $09, $00, $6D, $6D, $60, $6D, $60 ; $169DE5 |
  db $6D, $6D, $16, $9C, $E2, $17, $04, $08 ; $169DED |
  db $06, $78, $07, $09, $18, $C0, $08, $07 ; $169DF5 |
  db $09, $01, $04, $08, $04, $08, $8B, $8B ; $169DFD |
  db $64, $84, $86, $86, $01, $A6, $01, $66 ; $169E05 |
  db $0E, $01, $9E, $01, $13, $08, $9E, $31 ; $169E0D |
  db $0C, $FD, $88, $8B, $6A, $86, $88, $8B ; $169E15 |
  db $6A, $8A, $86, $0C, $00, $03, $94, $96 ; $169E1D |
  db $77, $97, $02, $01, $B9, $02, $01, $99 ; $169E25 |
  db $0F, $01, $9D, $FF, $0C, $FD, $88, $8B ; $169E2D |
  db $6A, $8D, $8B, $8B, $6F, $8D, $90, $0C ; $169E35 |
  db $FE, $6F, $72, $74, $77, $09, $01, $6D ; $169E3D |
  db $6F, $72, $02, $01, $B4, $02, $01, $94 ; $169E45 |
  db $04, $00, $04, $00, $07, $0B, $0C, $00 ; $169E4D |
  db $06, $C8, $0C, $00, $18, $00, $08, $0F ; $169E55 |
  db $80, $74, $80, $74, $80, $74, $72, $60 ; $169E5D |
  db $74, $A0, $0E, $01, $9E, $4F, $80, $72 ; $169E65 |
  db $80, $72, $80, $72, $6F, $60, $72, $A0 ; $169E6D |
  db $80, $74, $80, $74, $80, $74, $72, $60 ; $169E75 |
  db $74, $A0, $0F, $01, $9E, $4D, $07, $07 ; $169E7D |
  db $18, $80, $08, $13, $09, $01, $CD, $D2 ; $169E85 |
  db $D6, $01, $B9, $00, $01, $59, $08, $00 ; $169E8D |
  db $18, $00, $07, $0C, $03, $54, $52, $51 ; $169E95 |
  db $4F, $4D, $4C, $4A, $48, $46, $45, $43 ; $169E9D |
  db $09, $02, $18, $C0, $07, $0A, $06, $C8 ; $169EA5 |
  db $08, $06, $04, $00, $76, $79, $7C, $03 ; $169EAD |
  db $68, $66, $64, $0E, $03, $9E, $AF, $03 ; $169EB5 |
  db $76, $79, $7C, $7E, $03, $6A, $6D, $70 ; $169EBD |
  db $74, $04, $08, $09, $01, $08, $06, $0C ; $169EC5 |
  db $FE, $18, $C0, $6D, $60, $6D, $60, $70 ; $169ECD |
  db $74, $60, $02, $92, $90, $8F, $8D, $70 ; $169ED5 |
  db $60, $6F, $60, $6D, $6B, $60, $12, $08 ; $169EDD |
  db $9F, $21, $8D, $0C, $00, $18, $00, $06 ; $169EE5 |
  db $C8, $08, $00, $02, $94, $72, $60, $6D ; $169EED |
  db $60, $08, $0B, $18, $C0, $0C, $FE, $6D ; $169EF5 |
  db $60, $6D, $60, $70, $72, $60, $02, $94 ; $169EFD |
  db $92, $94, $95, $77, $60, $75, $60, $74 ; $169F05 |
  db $72, $60, $90, $0C, $00, $18, $00, $08 ; $169F0D |
  db $00, $74, $72, $70, $72, $74, $6B, $6D ; $169F15 |
  db $0E, $01, $9E, $C6, $0C, $00, $6D, $18 ; $169F1D |
  db $00, $08, $00, $6D, $6D, $6B, $6D, $70 ; $169F25 |
  db $6F, $6D, $6B, $09, $02, $06, $64, $08 ; $169F2D |
  db $0F, $03, $97, $97, $77, $94, $97, $97 ; $169F35 |
  db $74, $97, $94, $97, $97, $77, $94, $99 ; $169F3D |
  db $09, $01, $08, $00, $07, $0C, $03, $77 ; $169F45 |
  db $77, $60, $77, $60, $77, $77, $16, $9D ; $169F4D |
  db $F3, $17, $04, $00, $06, $C8, $07, $0C ; $169F55 |
  db $08, $02, $09, $03, $04, $00, $04, $00 ; $169F5D |
  db $68, $02, $80, $66, $80, $65, $60, $02 ; $169F65 |
  db $85, $64, $60, $63, $60, $0E, $01, $9F ; $169F6D |
  db $63, $13, $00, $9F, $98, $68, $02, $80 ; $169F75 |
  db $66, $80, $65, $60, $02, $85, $64, $60 ; $169F7D |
  db $64, $60, $61, $60, $61, $60, $64, $64 ; $169F85 |
  db $60, $02, $01, $A6, $02, $01, $86, $0F ; $169F8D |
  db $01, $9F, $61, $68, $02, $80, $66, $80 ; $169F95 |
  db $65, $60, $02, $85, $64, $60, $64, $60 ; $169F9D |
  db $63, $60, $63, $60, $63, $63, $60, $02 ; $169FA5 |
  db $01, $A8, $02, $01, $88, $04, $00, $68 ; $169FAD |
  db $68, $A0, $68, $68, $02, $A0, $68, $67 ; $169FB5 |
  db $66, $66, $A0, $66, $66, $02, $A0, $66 ; $169FBD |
  db $65, $63, $63, $A0, $63, $63, $60, $6D ; $169FC5 |
  db $63, $60, $6D, $63, $6D, $6F, $64, $64 ; $169FCD |
  db $A0, $64, $64, $60, $6D, $64, $60, $6D ; $169FD5 |
  db $64, $6D, $70, $0E, $01, $9F, $B2, $04 ; $169FDD |
  db $08, $08, $0E, $09, $01, $6A, $60, $6A ; $169FE5 |
  db $60, $71, $6F, $6D, $6A, $60, $6A, $60 ; $169FED |
  db $6A, $71, $6F, $6D, $6C, $0E, $01, $9F ; $169FF5 |
  db $E4, $04, $00                          ; $169FFD |

