bank $1C
org $8000

  JMP code_1C800C                           ; $1C8000 |

code_1C8003:
  JMP code_1C8109                           ; $1C8003 |

  JMP code_1C82B8                           ; $1C8006 |

  JMP code_1C8097                           ; $1C8009 |

code_1C800C:
  LDA #$55                                  ; $1C800C |
  STA $99                                   ; $1C800E |
  LDX #$01                                  ; $1C8010 |
  STX $EF                                   ; $1C8012 |
code_1C8014:
  LDY #$01                                  ; $1C8014 |
  CPX $5B                                   ; $1C8016 |
  BEQ code_1C8060                           ; $1C8018 |
  INY                                       ; $1C801A |
  CPX $5C                                   ; $1C801B |
  BEQ code_1C8060                           ; $1C801D |
  LDA $0300,x                               ; $1C801F |
  BPL code_1C808B                           ; $1C8022 |
  LDY #$1D                                  ; $1C8024 |
  LDA $0320,x                               ; $1C8026 |
  CMP #$E0                                  ; $1C8029 |
  BCC code_1C8031                           ; $1C802B |
  LDY #$12                                  ; $1C802D |
  BNE code_1C803D                           ; $1C802F |
code_1C8031:
  LSR                                       ; $1C8031 |
  LSR                                       ; $1C8032 |
  LSR                                       ; $1C8033 |
  LSR                                       ; $1C8034 |
  CMP #$0A                                  ; $1C8035 |
  BCC code_1C803D                           ; $1C8037 |
  SEC                                       ; $1C8039 |
  SBC #$06                                  ; $1C803A |
  TAY                                       ; $1C803C |
code_1C803D:
  CPY $F5                                   ; $1C803D |
  BEQ code_1C804A                           ; $1C803F |
  STY $F5                                   ; $1C8041 |
  TXA                                       ; $1C8043 |
  PHA                                       ; $1C8044 |
  JSR code_1FFF6B                           ; $1C8045 |
  PLA                                       ; $1C8048 |
  TAX                                       ; $1C8049 |
code_1C804A:
  LDY $0320,x                               ; $1C804A |
  LDA $83C7,y                               ; $1C804D |
  STA $00                                   ; $1C8050 |
  LDA $84C7,y                               ; $1C8052 |
  STA $01                                   ; $1C8055 |
  LDA #$80                                  ; $1C8057 |
  PHA                                       ; $1C8059 |
  LDA #$76                                  ; $1C805A |
  PHA                                       ; $1C805C |
  JMP ($0000)                               ; $1C805D |

code_1C8060:
  LDA #$00                                  ; $1C8060 |
  STA $005A,y                               ; $1C8062 |
  JSR code_1FFB7B                           ; $1C8065 |
  BCS code_1C8083                           ; $1C8068 |
  TXA                                       ; $1C806A |
  LDY $10                                   ; $1C806B |
  STA $005A,y                               ; $1C806D |
  LDA #$00                                  ; $1C8070 |
  STA $05E0,x                               ; $1C8072 |
  BEQ code_1C8083                           ; $1C8075 |
  CPX #$10                                  ; $1C8077 |
  BCC code_1C808B                           ; $1C8079 |
  LDA $0320,x                               ; $1C807B |
  BEQ code_1C808B                           ; $1C807E |
  JSR code_1C8102                           ; $1C8080 |
code_1C8083:
  LDA $0480,x                               ; $1C8083 |
  BPL code_1C808B                           ; $1C8086 |
  JSR code_1C8097                           ; $1C8088 |
code_1C808B:
  INC $EF                                   ; $1C808B |
  LDX $EF                                   ; $1C808D |
  CPX #$20                                  ; $1C808F |
  BEQ code_1C8096                           ; $1C8091 |
  JMP code_1C8014                           ; $1C8093 |

code_1C8096:
  RTS                                       ; $1C8096 |

code_1C8097:
  LDA $05C0                                 ; $1C8097 |
  CMP #$A4                                  ; $1C809A |
  BEQ code_1C8096                           ; $1C809C |
  STX $0F                                   ; $1C809E |
  LDA $F5                                   ; $1C80A0 |
  PHA                                       ; $1C80A2 |
  LDA #$0A                                  ; $1C80A3 |
  STA $F5                                   ; $1C80A5 |
  JSR code_1FFF6B                           ; $1C80A7 |
  LDX $0F                                   ; $1C80AA |
  LDA $39                                   ; $1C80AC |
  BNE code_1C80F9                           ; $1C80AE |
  LDA $30                                   ; $1C80B0 |
  CMP #$06                                  ; $1C80B2 |
  BEQ code_1C80F9                           ; $1C80B4 |
  CMP #$0E                                  ; $1C80B6 |
  BEQ code_1C80F9                           ; $1C80B8 |
  CMP #$0C                                  ; $1C80BA |
  BEQ code_1C80F9                           ; $1C80BC |
  JSR code_1FFAE2                           ; $1C80BE |
  BCS code_1C80F9                           ; $1C80C1 |
  LDA #$06                                  ; $1C80C3 |
  STA $30                                   ; $1C80C5 |
  LDA #$16                                  ; $1C80C7 |
  JSR code_1FF89A                           ; $1C80C9 |
  LDA $A2                                   ; $1C80CC |
  AND #$1F                                  ; $1C80CE |
  BEQ code_1C80F9                           ; $1C80D0 |
  LDY $0320,x                               ; $1C80D2 |
  LDA $A2                                   ; $1C80D5 |
  AND #$1F                                  ; $1C80D7 |
  SEC                                       ; $1C80D9 |
  SBC $A000,y                               ; $1C80DA |
  PHP                                       ; $1C80DD |
  ORA #$80                                  ; $1C80DE |
  STA $A2                                   ; $1C80E0 |
  PLP                                       ; $1C80E2 |
  BEQ code_1C80E7                           ; $1C80E3 |
  BCS code_1C80F9                           ; $1C80E5 |
code_1C80E7:
  LDA #$80                                  ; $1C80E7 |
  STA $A2                                   ; $1C80E9 |
  LDA #$0E                                  ; $1C80EB |
  STA $30                                   ; $1C80ED |
  LDA #$F2                                  ; $1C80EF |
  JSR code_1FF89A                           ; $1C80F1 |
  LDA #$17                                  ; $1C80F4 |
  JSR code_1FF89A                           ; $1C80F6 |
code_1C80F9:
  PLA                                       ; $1C80F9 |
  STA $F5                                   ; $1C80FA |
  JSR code_1FFF6B                           ; $1C80FC |
  LDX $0F                                   ; $1C80FF |
  RTS                                       ; $1C8101 |

code_1C8102:
  LDA $0480,x                               ; $1C8102 |
  AND #$60                                  ; $1C8105 |
  BEQ code_1C8142                           ; $1C8107 |
code_1C8109:
  LDA $05C0                                 ; $1C8109 |
  CMP #$A3                                  ; $1C810C |
  BNE code_1C8113                           ; $1C810E |
  JMP code_1C825E                           ; $1C8110 |

code_1C8113:
  JSR code_1FFB7B                           ; $1C8113 |
  BCS code_1C8142                           ; $1C8116 |
  LDA $0480,x                               ; $1C8118 |
  AND #$20                                  ; $1C811B |
  BEQ code_1C8144                           ; $1C811D |
code_1C811F:
  LDA #$19                                  ; $1C811F |
  JSR code_1FF89A                           ; $1C8121 |
  LDY $10                                   ; $1C8124 |
  LDA $04A0,y                               ; $1C8126 |
  EOR #$03                                  ; $1C8129 |
  STA $04A0,y                               ; $1C812B |
  LDA #$00                                  ; $1C812E |
  STA $0440,y                               ; $1C8130 |
  LDA #$FC                                  ; $1C8133 |
  STA $0460,y                               ; $1C8135 |
  LDA #$00                                  ; $1C8138 |
  STA $0480,y                               ; $1C813A |
  LDA #$0F                                  ; $1C813D |
  STA $0320,y                               ; $1C813F |
code_1C8142:
  SEC                                       ; $1C8142 |
  RTS                                       ; $1C8143 |

code_1C8144:
  LDA #$18                                  ; $1C8144 |
  JSR code_1FF89A                           ; $1C8146 |
  LDA $F5                                   ; $1C8149 |
  PHA                                       ; $1C814B |
  STX $0F                                   ; $1C814C |
  LDA #$0A                                  ; $1C814E |
  STA $F5                                   ; $1C8150 |
  JSR code_1FFF6B                           ; $1C8152 |
  LDX $0F                                   ; $1C8155 |
  LDY $A0                                   ; $1C8157 |
  LDA $83AF,y                               ; $1C8159 |
  STA $00                                   ; $1C815C |
  LDA $83BB,y                               ; $1C815E |
  STA $01                                   ; $1C8161 |
  LDY $0320,x                               ; $1C8163 |
  LDA ($00),y                               ; $1C8166 |
  BNE code_1C8170                           ; $1C8168 |
  JSR code_1C811F                           ; $1C816A |
  JMP code_1C824D                           ; $1C816D |

code_1C8170:
  LDA $A0                                   ; $1C8170 |
  CMP #$08                                  ; $1C8172 |
  BNE code_1C81B6                           ; $1C8174 |
  LDA ($00),y                               ; $1C8176 |
  BEQ code_1C81B3                           ; $1C8178 |
  CMP #$58                                  ; $1C817A |
  BNE code_1C81B6                           ; $1C817C |
  TXA                                       ; $1C817E |
  LDY $10                                   ; $1C817F |
  STA $005A,y                               ; $1C8181 |
  LDA $0300,y                               ; $1C8184 |
  ORA #$01                                  ; $1C8187 |
  STA $0300,y                               ; $1C8189 |
  LDA #$9D                                  ; $1C818C |
  CMP $05C0,y                               ; $1C818E |
  BEQ code_1C81B3                           ; $1C8191 |
  STA $05C0,y                               ; $1C8193 |
  LDA #$00                                  ; $1C8196 |
  STA $05A0,y                               ; $1C8198 |
  STA $05E0,y                               ; $1C819B |
  STA $0500,y                               ; $1C819E |
  LDA $0360,x                               ; $1C81A1 |
  STA $0360,y                               ; $1C81A4 |
  LDA $0380,x                               ; $1C81A7 |
  STA $0380,y                               ; $1C81AA |
  LDA $03C0,x                               ; $1C81AD |
  STA $03C0,y                               ; $1C81B0 |
code_1C81B3:
  JMP code_1C824D                           ; $1C81B3 |

code_1C81B6:
  LDA $04E0,x                               ; $1C81B6 |
  AND #$E0                                  ; $1C81B9 |
  BEQ code_1C81C0                           ; $1C81BB |
  JMP code_1C822F                           ; $1C81BD |

code_1C81C0:
  LDY $0320,x                               ; $1C81C0 |
  LDA $04E0,x                               ; $1C81C3 |
  SEC                                       ; $1C81C6 |
  SBC ($00),y                               ; $1C81C7 |
  BCS code_1C81CD                           ; $1C81C9 |
  LDA #$00                                  ; $1C81CB |
code_1C81CD:
  STA $04E0,x                               ; $1C81CD |
  BNE code_1C8207                           ; $1C81D0 |
  LDA $0320,x                               ; $1C81D2 |
  CMP #$52                                  ; $1C81D5 |
  BEQ code_1C8207                           ; $1C81D7 |
  CMP #$53                                  ; $1C81D9 |
  BEQ code_1C8207                           ; $1C81DB |
  LDA $5A                                   ; $1C81DD |
  BPL code_1C81E5                           ; $1C81DF |
  LDA #$59                                  ; $1C81E1 |
  BNE code_1C81E7                           ; $1C81E3 |
code_1C81E5:
  LDA #$71                                  ; $1C81E5 |
code_1C81E7:
  JSR reset_sprite_anim                     ; $1C81E7 |
  LDA #$00                                  ; $1C81EA |
  STA $0480,x                               ; $1C81EC |
  LDA $0320,x                               ; $1C81EF |
  CMP #$30                                  ; $1C81F2 |
  BNE code_1C81FD                           ; $1C81F4 |
  LDA #$00                                  ; $1C81F6 |
  STA $0320,x                               ; $1C81F8 |
  BEQ code_1C8202                           ; $1C81FB |
code_1C81FD:
  LDA #$7A                                  ; $1C81FD |
  STA $0320,x                               ; $1C81FF |
code_1C8202:
  LDA #$90                                  ; $1C8202 |
  STA $0580,x                               ; $1C8204 |
code_1C8207:
  LDA $04E0,x                               ; $1C8207 |
  BEQ code_1C822F                           ; $1C820A |
  LDA $0300,x                               ; $1C820C |
  AND #$40                                  ; $1C820F |
  BNE code_1C821D                           ; $1C8211 |
  LDA $04E0,x                               ; $1C8213 |
  ORA #$20                                  ; $1C8216 |
  STA $04E0,x                               ; $1C8218 |
  BNE code_1C822F                           ; $1C821B |
code_1C821D:
  LDA $22                                   ; $1C821D |
  CMP #$0F                                  ; $1C821F |
  BEQ code_1C8227                           ; $1C8221 |
  CMP #$0C                                  ; $1C8223 |
  BCS code_1C822F                           ; $1C8225 |
code_1C8227:
  LDA $04E0,x                               ; $1C8227 |
  ORA #$E0                                  ; $1C822A |
  STA $04E0,x                               ; $1C822C |
code_1C822F:
  LDA $A0                                   ; $1C822F |
  CMP #$05                                  ; $1C8231 |
  BEQ code_1C824D                           ; $1C8233 |
  LDY $10                                   ; $1C8235 |
  LDA #$00                                  ; $1C8237 |
  STA $0300,y                               ; $1C8239 |
  LDA $A0                                   ; $1C823C |
  CMP #$01                                  ; $1C823E |
  BNE code_1C824D                           ; $1C8240 |
  LDA #$00                                  ; $1C8242 |
  STA $0301                                 ; $1C8244 |
  STA $0302                                 ; $1C8247 |
  STA $0303                                 ; $1C824A |
code_1C824D:
  PLA                                       ; $1C824D |
  STA $F5                                   ; $1C824E |
  JSR code_1FFF6B                           ; $1C8250 |
  LDX $0F                                   ; $1C8253 |
  CLC                                       ; $1C8255 |
  LDA $0300,x                               ; $1C8256 |
  AND #$40                                  ; $1C8259 |
  BNE code_1C82AA                           ; $1C825B |
code_1C825D:
  RTS                                       ; $1C825D |

code_1C825E:
  LDA $0480,x                               ; $1C825E |
  AND #$20                                  ; $1C8261 |
  BNE code_1C825D                           ; $1C8263 |
  JSR code_1FFAE2                           ; $1C8265 |
  BCS code_1C825D                           ; $1C8268 |
  STX $0F                                   ; $1C826A |
  LDA $F5                                   ; $1C826C |
  PHA                                       ; $1C826E |
  LDA #$0A                                  ; $1C826F |
  STA $F5                                   ; $1C8271 |
  JSR code_1FFF6B                           ; $1C8273 |
  LDX $0F                                   ; $1C8276 |
  LDY $0320,x                               ; $1C8278 |
  LDA $83AF                                 ; $1C827B |
  STA $00                                   ; $1C827E |
  LDA $83BB                                 ; $1C8280 |
  STA $01                                   ; $1C8283 |
  LDA $A7                                   ; $1C8285 |
  AND #$1F                                  ; $1C8287 |
  SEC                                       ; $1C8289 |
  SBC ($00),y                               ; $1C828A |
  BCS code_1C8290                           ; $1C828C |
  LDA #$00                                  ; $1C828E |
code_1C8290:
  ORA #$80                                  ; $1C8290 |
  STA $A7                                   ; $1C8292 |
  LDA #$0A                                  ; $1C8294 |
  STA $30                                   ; $1C8296 |
  LDA #$08                                  ; $1C8298 |
  STA $0500                                 ; $1C829A |
  LDA $83B4                                 ; $1C829D |
  STA $00                                   ; $1C82A0 |
  LDA $83C0                                 ; $1C82A2 |
  STA $01                                   ; $1C82A5 |
  JMP code_1C81B6                           ; $1C82A7 |

code_1C82AA:
  LDA $04E0,x                               ; $1C82AA |
  AND #$1F                                  ; $1C82AD |
  ORA #$80                                  ; $1C82AF |
  STA $B0                                   ; $1C82B1 |
  AND #$7F                                  ; $1C82B3 |
  BEQ code_1C82B8                           ; $1C82B5 |
  RTS                                       ; $1C82B7 |

code_1C82B8:
  LDA #$F2                                  ; $1C82B8 |
  JSR code_1FF898                           ; $1C82BA |
  LDA #$17                                  ; $1C82BD |
  JSR code_1FF89A                           ; $1C82BF |
  LDY #$1F                                  ; $1C82C2 |
code_1C82C4:
  LDA $5A                                   ; $1C82C4 |
  BMI code_1C82CC                           ; $1C82C6 |
  LDA #$7A                                  ; $1C82C8 |
  BNE code_1C82CE                           ; $1C82CA |
code_1C82CC:
  LDA #$5B                                  ; $1C82CC |
code_1C82CE:
  JSR code_1FF846                           ; $1C82CE |
  LDA #$80                                  ; $1C82D1 |
  STA $0300,y                               ; $1C82D3 |
  LDA #$90                                  ; $1C82D6 |
  STA $0580,y                               ; $1C82D8 |
  LDA #$00                                  ; $1C82DB |
  STA $0480,y                               ; $1C82DD |
  LDA #$10                                  ; $1C82E0 |
  STA $0320,y                               ; $1C82E2 |
  LDA $0360,x                               ; $1C82E5 |
  STA $0360,y                               ; $1C82E8 |
  LDA $0380,x                               ; $1C82EB |
  STA $0380,y                               ; $1C82EE |
  LDA $03C0,x                               ; $1C82F1 |
  STA $03C0,y                               ; $1C82F4 |
  LDA $D7E1,y                               ; $1C82F7 |
  STA $0400,y                               ; $1C82FA |
  LDA $D7F1,y                               ; $1C82FD |
  STA $0420,y                               ; $1C8300 |
  LDA $D801,y                               ; $1C8303 |
  STA $0440,y                               ; $1C8306 |
  LDA $D811,y                               ; $1C8309 |
  STA $0460,y                               ; $1C830C |
  DEY                                       ; $1C830F |
  CPY #$0F                                  ; $1C8310 |
  BNE code_1C82C4                           ; $1C8312 |
  LDA $22                                   ; $1C8314 |
  CMP #$03                                  ; $1C8316 |
  BNE code_1C831E                           ; $1C8318 |
  LDA #$00                                  ; $1C831A |
  STA $FA                                   ; $1C831C |
code_1C831E:
  LDA #$00                                  ; $1C831E |
  STA $0301                                 ; $1C8320 |
  STA $0302                                 ; $1C8323 |
  STA $0303                                 ; $1C8326 |
  STA $0520                                 ; $1C8329 |
  LDA $22                                   ; $1C832C |
  CMP #$0F                                  ; $1C832E |
  BEQ code_1C8360                           ; $1C8330 |
  LDA $30                                   ; $1C8332 |
  CMP #$0E                                  ; $1C8334 |
  BEQ code_1C83AD                           ; $1C8336 |
  LDA #$0C                                  ; $1C8338 |
  STA $30                                   ; $1C833A |
  LDA #$00                                  ; $1C833C |
  STA $32                                   ; $1C833E |
  STA $0500                                 ; $1C8340 |
  STA $0301                                 ; $1C8343 |
  STA $0302                                 ; $1C8346 |
  STA $0303                                 ; $1C8349 |
  LDA #$01                                  ; $1C834C |
  CMP $05C0                                 ; $1C834E |
  BEQ code_1C835E                           ; $1C8351 |
  STA $05C0                                 ; $1C8353 |
  LDA #$00                                  ; $1C8356 |
  STA $05A0                                 ; $1C8358 |
  STA $05E0                                 ; $1C835B |
code_1C835E:
  CLC                                       ; $1C835E |
  RTS                                       ; $1C835F |

code_1C8360:
  LDA $30                                   ; $1C8360 |
  CMP #$0F                                  ; $1C8362 |
  BNE code_1C836A                           ; $1C8364 |
  LDA #$00                                  ; $1C8366 |
  STA $30                                   ; $1C8368 |
code_1C836A:
  LDA #$80                                  ; $1C836A |
  STA $030F                                 ; $1C836C |
  LDA #$90                                  ; $1C836F |
  STA $058F                                 ; $1C8371 |
  LDA $0360,x                               ; $1C8374 |
  STA $036F                                 ; $1C8377 |
  LDA $0380,x                               ; $1C837A |
  STA $038F                                 ; $1C837D |
  LDA $03C0,x                               ; $1C8380 |
  STA $03CF                                 ; $1C8383 |
  LDA #$00                                  ; $1C8386 |
  STA $03EF                                 ; $1C8388 |
  STA $05EF                                 ; $1C838B |
  STA $05AF                                 ; $1C838E |
  STA $048F                                 ; $1C8391 |
  STA $04EF                                 ; $1C8394 |
  STA $044F                                 ; $1C8397 |
  STA $046F                                 ; $1C839A |
  STA $050F                                 ; $1C839D |
  LDA #$F9                                  ; $1C83A0 |
  STA $05CF                                 ; $1C83A2 |
  LDA #$64                                  ; $1C83A5 |
  STA $032F                                 ; $1C83A7 |
  JSR code_1FE11A                           ; $1C83AA |
code_1C83AD:
  CLC                                       ; $1C83AD |
  RTS                                       ; $1C83AE |

  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C83AF |
  db $00, $00, $00, $00, $A1, $A4, $A2, $A5 ; $1C83B7 |
  db $A3, $A6, $A7, $A1, $A8, $A1, $A9, $A1 ; $1C83BF |
  db $C7, $C9, $FB, $58, $DE, $B4, $FD, $7C ; $1C83C7 |
  db $D3, $C8, $14, $49, $12, $C5, $83, $85 ; $1C83CF |
  db $0E, $09, $B3, $9B, $8A, $CB, $CB, $E2 ; $1C83D7 |
  db $E2, $60, $BB, $C9, $C8, $E0, $6B, $44 ; $1C83DF |
  db $56, $31, $96, $84, $19, $98, $FE, $3A ; $1C83E7 |
  db $6B, $35, $EC, $CB, $C3, $C9, $09, $28 ; $1C83EF |
  db $5B, $82, $D7, $FE, $C4, $52, $85, $BD ; $1C83F7 |
  db $3E, $60, $60, $B6, $C9, $14, $E5, $C8 ; $1C83FF |
  db $C9, $C9, $56, $85, $F7, $35, $3F, $7F ; $1C8407 |
  db $60, $CC, $40, $40, $0A, $C3, $E4, $55 ; $1C840F |
  db $34, $C9, $F7, $F7, $C8, $C8, $60, $C8 ; $1C8417 |
  db $53, $53, $53, $53, $53, $53, $53, $53 ; $1C841F |
  db $C8, $C9, $93, $3F, $FD, $F9, $FD, $F9 ; $1C8427 |
  db $FD, $FD, $D2, $C8, $2F, $65, $F8, $C8 ; $1C842F |
  db $31, $E2, $C8, $94, $AC, $B6, $C8, $C8 ; $1C8437 |
  db $5F, $5F, $51, $C8, $C8, $C8, $C8, $C8 ; $1C843F |
  db $A4, $1E, $96, $DD, $88, $47, $C2, $79 ; $1C8447 |
  db $98, $6C, $BE, $A7, $A8, $65, $95, $34 ; $1C844F |
  db $E8, $E8, $E8, $E8, $E8, $E8, $E8, $E8 ; $1C8457 |
  db $C8, $C8, $C8, $C8, $C8, $C8, $C8, $C8 ; $1C845F |
  db $00, $03, $06, $09, $0C, $0F, $12, $15 ; $1C8467 |
  db $18, $1B, $1E, $21, $24, $27, $2A, $2D ; $1C846F |
  db $00, $03, $06, $09, $0C, $0F, $12, $15 ; $1C8477 |
  db $18, $1B, $1E, $21, $24, $27, $2A, $2D ; $1C847F |
  db $00, $03, $06, $09, $0C, $0F, $12, $15 ; $1C8487 |
  db $18, $1B, $1E, $21, $24, $27, $2A, $2D ; $1C848F |
  db $00, $03, $06, $09, $0C, $0F, $12, $15 ; $1C8497 |
  db $18, $1B, $1E, $21, $24, $27, $2A, $2D ; $1C849F |
  db $00, $03, $06, $09, $0C, $0F, $12, $15 ; $1C84A7 |
  db $18, $1B, $1E, $21, $24, $27, $2A, $2D ; $1C84AF |
  db $30, $33, $36, $39, $3C, $3F, $42, $45 ; $1C84B7 |
  db $48, $4B, $4E, $51, $54, $57, $5A, $5D ; $1C84BF |
  db $85, $85, $8A, $8B, $8B, $9D, $8B, $B4 ; $1C84C7 |
  db $8C, $8D, $8E, $9F, $9F, $96, $97, $98 ; $1C84CF |
  db $94, $94, $98, $99, $8F, $8D, $8D, $90 ; $1C84D7 |
  db $90, $A9, $9A, $85, $85, $AA, $A6, $9B ; $1C84DF |
  db $9C, $9D, $90, $9D, $9C, $A4, $A5, $A6 ; $1C84E7 |
  db $A6, $A7, $A2, $A7, $AE, $85, $AD, $AE ; $1C84EF |
  db $AB, $AC, $AF, $B2, $B4, $B3, $98, $B1 ; $1C84F7 |
  db $B2, $A9, $A9, $92, $85, $8E, $B9, $85 ; $1C84FF |
  db $85, $85, $B1, $98, $B8, $A7, $A9, $B0 ; $1C8507 |
  db $A9, $B5, $B5, $B5, $AA, $99, $95, $BB ; $1C850F |
  db $BB, $85, $9F, $9F, $85, $85, $A9, $85 ; $1C8517 |
  db $B8, $B8, $B8, $B8, $B8, $B8, $B8, $B8 ; $1C851F |
  db $85, $B7, $95, $A8, $BD, $BD, $BD, $BD ; $1C8527 |
  db $BD, $BD, $BE, $85, $95, $91, $B8, $85 ; $1C852F |
  db $B9, $A1, $85, $91, $B9, $92, $85, $85 ; $1C8537 |
  db $94, $94, $BF, $85, $85, $85, $85, $85 ; $1C853F |
  db $86, $87, $87, $87, $88, $89, $89, $8A ; $1C8547 |
  db $8A, $BA, $BB, $BC, $BC, $BD, $BD, $BB ; $1C854F |
  db $B6, $B6, $B6, $B6, $B6, $B6, $B6, $B6 ; $1C8557 |
  db $85, $85, $85, $85, $85, $85, $85, $85 ; $1C855F |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C8567 |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C856F |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C8577 |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C857F |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C8587 |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C858F |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C8597 |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C859F |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C85A7 |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C85AF |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C85B7 |
  db $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0 ; $1C85BF |

  RTS                                       ; $1C85C7 |

  RTS                                       ; $1C85C8 |

  LDA $04A0,x                               ; $1C85C9 |
  AND #$01                                  ; $1C85CC |
  BEQ code_1C85D6                           ; $1C85CE |
  JSR code_1FF71D                           ; $1C85D0 |
  JMP code_1C85D9                           ; $1C85D3 |

code_1C85D6:
  JSR code_1FF73B                           ; $1C85D6 |
code_1C85D9:
  CPX #$10                                  ; $1C85D9 |
  BCS code_1C8627                           ; $1C85DB |
  LDY #$06                                  ; $1C85DD |
  JSR code_1FE8D6                           ; $1C85DF |
  LDA $41                                   ; $1C85E2 |
  CMP #$70                                  ; $1C85E4 |
  BNE code_1C8627                           ; $1C85E6 |
  LDA $0360,x                               ; $1C85E8 |
  SEC                                       ; $1C85EB |
  SBC $FC                                   ; $1C85EC |
  CMP #$10                                  ; $1C85EE |
  BCC code_1C8627                           ; $1C85F0 |
  CMP #$F0                                  ; $1C85F2 |
  BCS code_1C8627                           ; $1C85F4 |
  JSR code_1FEE57                           ; $1C85F6 |
  BCS code_1C8627                           ; $1C85F9 |
  JSR code_1FFC53                           ; $1C85FB |
  BCC code_1C8628                           ; $1C85FE |
code_1C8600:
  LDA #$71                                  ; $1C8600 |
  JSR reset_sprite_anim                     ; $1C8602 |
  LDA #$00                                  ; $1C8605 |
  STA $0320,x                               ; $1C8607 |
  LDA $0360,x                               ; $1C860A |
  AND #$F0                                  ; $1C860D |
  ORA #$08                                  ; $1C860F |
  STA $0360,x                               ; $1C8611 |
  LDA $0380,x                               ; $1C8614 |
  STA $0380,x                               ; $1C8617 |
  LDA $03C0,x                               ; $1C861A |
  AND #$F0                                  ; $1C861D |
  ORA #$08                                  ; $1C861F |
  STA $03C0,x                               ; $1C8621 |
  JMP code_1C867C                           ; $1C8624 |

code_1C8627:
  RTS                                       ; $1C8627 |

code_1C8628:
  STY $01                                   ; $1C8628 |
  LDA #$00                                  ; $1C862A |
  STA $00                                   ; $1C862C |
  LDY #$1F                                  ; $1C862E |
code_1C8630:
  LDA $0300,y                               ; $1C8630 |
  BPL code_1C863E                           ; $1C8633 |
  LDA $0320,y                               ; $1C8635 |
  CMP #$27                                  ; $1C8638 |
  BNE code_1C863E                           ; $1C863A |
  INC $00                                   ; $1C863C |
code_1C863E:
  DEY                                       ; $1C863E |
  CPY #$0F                                  ; $1C863F |
  BNE code_1C8630                           ; $1C8641 |
  LDY $01                                   ; $1C8643 |
  LDA $00                                   ; $1C8645 |
  CMP #$03                                  ; $1C8647 |
  BEQ code_1C8600                           ; $1C8649 |
  LDA #$71                                  ; $1C864B |
  JSR code_1FF846                           ; $1C864D |
  LDA #$27                                  ; $1C8650 |
  STA $0320,y                               ; $1C8652 |
  LDA $0360,x                               ; $1C8655 |
  AND #$F0                                  ; $1C8658 |
  ORA #$08                                  ; $1C865A |
  STA $0360,y                               ; $1C865C |
  LDA $0380,x                               ; $1C865F |
  STA $0380,y                               ; $1C8662 |
  LDA $03C0,x                               ; $1C8665 |
  AND #$F0                                  ; $1C8668 |
  ORA #$08                                  ; $1C866A |
  STA $03C0,y                               ; $1C866C |
  LDA #$00                                  ; $1C866F |
  STA $0480,y                               ; $1C8671 |
  STA $0300,x                               ; $1C8674 |
  LDA #$FF                                  ; $1C8677 |
  STA $04C0,x                               ; $1C8679 |
code_1C867C:
  STX $00                                   ; $1C867C |
  LDA $13                                   ; $1C867E |
  AND #$01                                  ; $1C8680 |
  ASL                                       ; $1C8682 |
  ASL                                       ; $1C8683 |
  ASL                                       ; $1C8684 |
  ASL                                       ; $1C8685 |
  ASL                                       ; $1C8686 |
  STA $01                                   ; $1C8687 |
  LDA $28                                   ; $1C8689 |
  PHA                                       ; $1C868B |
  LSR                                       ; $1C868C |
  ORA $01                                   ; $1C868D |
  TAY                                       ; $1C868F |
  PLA                                       ; $1C8690 |
  ASL                                       ; $1C8691 |
  ASL                                       ; $1C8692 |
  AND #$04                                  ; $1C8693 |
  ORA $03                                   ; $1C8695 |
  TAX                                       ; $1C8697 |
  LDA $0110,y                               ; $1C8698 |
  ORA $EB82,x                               ; $1C869B |
  STA $0110,y                               ; $1C869E |
  LDX $00                                   ; $1C86A1 |
  RTS                                       ; $1C86A3 |

  LDA $0300,x                               ; $1C86A4 |
  AND #$0F                                  ; $1C86A7 |
  BNE code_1C86BC                           ; $1C86A9 |
  JSR code_1FF797                           ; $1C86AB |
  LDA $03C0,x                               ; $1C86AE |
  CLC                                       ; $1C86B1 |
  ADC #$10                                  ; $1C86B2 |
  CMP $03C0                                 ; $1C86B4 |
  BCC code_1C8712                           ; $1C86B7 |
  INC $0300,x                               ; $1C86B9 |
code_1C86BC:
  LDY #$00                                  ; $1C86BC |
  JSR code_1FF67C                           ; $1C86BE |
  BCC code_1C8712                           ; $1C86C1 |
  LDA $05A0,x                               ; $1C86C3 |
  CMP #$04                                  ; $1C86C6 |
  BNE code_1C8717                           ; $1C86C8 |
  LDA #$81                                  ; $1C86CA |
  STA $0320,x                               ; $1C86CC |
  LDA #$80                                  ; $1C86CF |
  STA $0300,x                               ; $1C86D1 |
  LDA #$00                                  ; $1C86D4 |
  STA $0500,x                               ; $1C86D6 |
  LDY #$03                                  ; $1C86D9 |
  JSR code_1FE8D6                           ; $1C86DB |
  LDA $10                                   ; $1C86DE |
  AND #$10                                  ; $1C86E0 |
  BEQ code_1C86F0                           ; $1C86E2 |
code_1C86E4:
  INC $0300,x                               ; $1C86E4 |
  LDA #$00                                  ; $1C86E7 |
  STA $0440,x                               ; $1C86E9 |
  STA $0460,x                               ; $1C86EC |
  RTS                                       ; $1C86EF |

code_1C86F0:
  LDA $A0                                   ; $1C86F0 |
  CMP #$09                                  ; $1C86F2 |
  BNE code_1C86FC                           ; $1C86F4 |
  LDA $41                                   ; $1C86F6 |
  CMP #$80                                  ; $1C86F8 |
  BNE code_1C86E4                           ; $1C86FA |
code_1C86FC:
  LDA $0580,x                               ; $1C86FC |
  ORA #$01                                  ; $1C86FF |
  STA $0580,x                               ; $1C8701 |
  LDA $A0                                   ; $1C8704 |
  SEC                                       ; $1C8706 |
  SBC #$06                                  ; $1C8707 |
  LSR                                       ; $1C8709 |
  TAY                                       ; $1C870A |
  LDA $8718,y                               ; $1C870B |
  JSR reset_sprite_anim                     ; $1C870E |
  RTS                                       ; $1C8711 |

code_1C8712:
  LDA #$00                                  ; $1C8712 |
  STA $05E0,x                               ; $1C8714 |
code_1C8717:
  RTS                                       ; $1C8717 |

  db $D8, $D9, $D7, $81, $82, $83           ; $1C8718 |

  LDA $0300,x                               ; $1C871E |
  AND #$0F                                  ; $1C8721 |
  BNE code_1C876B                           ; $1C8723 |
  DEC $0500,x                               ; $1C8725 |
  BEQ code_1C874B                           ; $1C8728 |
  LDA $05C0,x                               ; $1C872A |
  CMP #$D8                                  ; $1C872D |
  BNE code_1C873B                           ; $1C872F |
  LDA #$00                                  ; $1C8731 |
  STA $05E0,x                               ; $1C8733 |
  LDA $05A0,x                               ; $1C8736 |
  BNE code_1C8795                           ; $1C8739 |
code_1C873B:
  LDA $0500,x                               ; $1C873B |
  CMP #$88                                  ; $1C873E |
  BCS code_1C8795                           ; $1C8740 |
  LDA $05E0,x                               ; $1C8742 |
  ORA #$80                                  ; $1C8745 |
  STA $05E0,x                               ; $1C8747 |
  RTS                                       ; $1C874A |

code_1C874B:
  INC $0300,x                               ; $1C874B |
  LDA #$00                                  ; $1C874E |
  STA $0440,x                               ; $1C8750 |
  STA $0460,x                               ; $1C8753 |
  STA $0480,x                               ; $1C8756 |
  LDA $0580,x                               ; $1C8759 |
  AND #$FC                                  ; $1C875C |
  STA $0580,x                               ; $1C875E |
  LDA #$13                                  ; $1C8761 |
  JSR reset_sprite_anim                     ; $1C8763 |
  LDA #$04                                  ; $1C8766 |
  STA $05A0,x                               ; $1C8768 |
code_1C876B:
  LDA $05A0,x                               ; $1C876B |
  CMP #$02                                  ; $1C876E |
  BNE code_1C8795                           ; $1C8770 |
  LDA #$00                                  ; $1C8772 |
  STA $05E0,x                               ; $1C8774 |
  LDA $0440,x                               ; $1C8777 |
  CLC                                       ; $1C877A |
  ADC $99                                   ; $1C877B |
  STA $0440,x                               ; $1C877D |
  LDA $0460,x                               ; $1C8780 |
  ADC #$00                                  ; $1C8783 |
  STA $0460,x                               ; $1C8785 |
  JSR code_1FF779                           ; $1C8788 |
  LDA $03E0,x                               ; $1C878B |
  BEQ code_1C8795                           ; $1C878E |
  LDA #$00                                  ; $1C8790 |
  STA $0300,x                               ; $1C8792 |
code_1C8795:
  RTS                                       ; $1C8795 |

  LDA $0360                                 ; $1C8796 |
  SEC                                       ; $1C8799 |
  SBC $0360,x                               ; $1C879A |
  PHA                                       ; $1C879D |
  LDA $0380                                 ; $1C879E |
  SBC $0380,x                               ; $1C87A1 |
  PLA                                       ; $1C87A4 |
  BCS code_1C87AC                           ; $1C87A5 |
  EOR #$FF                                  ; $1C87A7 |
  ADC #$01                                  ; $1C87A9 |
  CLC                                       ; $1C87AB |
code_1C87AC:
  PHP                                       ; $1C87AC |
  CMP #$03                                  ; $1C87AD |
  BCC code_1C87B3                           ; $1C87AF |
  LDA #$03                                  ; $1C87B1 |
code_1C87B3:
  PLP                                       ; $1C87B3 |
  STA $0420,x                               ; $1C87B4 |
  LDA #$00                                  ; $1C87B7 |
  STA $0400,x                               ; $1C87B9 |
  BCC code_1C87C6                           ; $1C87BC |
  LDY #$08                                  ; $1C87BE |
  JSR code_1FF580                           ; $1C87C0 |
  JMP code_1C87CB                           ; $1C87C3 |

code_1C87C6:
  LDY #$09                                  ; $1C87C6 |
  JSR code_1FF5C4                           ; $1C87C8 |
code_1C87CB:
  LDA $0580                                 ; $1C87CB |
  AND #$40                                  ; $1C87CE |
  STA $00                                   ; $1C87D0 |
  LDA $0581                                 ; $1C87D2 |
  AND #$BF                                  ; $1C87D5 |
  ORA $00                                   ; $1C87D7 |
  STA $0581                                 ; $1C87D9 |
  RTS                                       ; $1C87DC |

  LDA $04A0,x                               ; $1C87DD |
  AND #$03                                  ; $1C87E0 |
  BEQ code_1C884B                           ; $1C87E2 |
  LDA #$97                                  ; $1C87E4 |
  CMP $05C0,x                               ; $1C87E6 |
  BEQ code_1C87EE                           ; $1C87E9 |
  STA $05C0,x                               ; $1C87EB |
code_1C87EE:
  LDA $04A0,x                               ; $1C87EE |
  AND #$01                                  ; $1C87F1 |
  BEQ code_1C87FB                           ; $1C87F3 |
  JSR code_1FF71D                           ; $1C87F5 |
  JMP code_1C87FE                           ; $1C87F8 |

code_1C87FB:
  JSR code_1FF73B                           ; $1C87FB |
code_1C87FE:
  LDY #$1F                                  ; $1C87FE |
code_1C8800:
  LDA $0300,y                               ; $1C8800 |
  BPL code_1C8845                           ; $1C8803 |
  LDA $0480,y                               ; $1C8805 |
  AND #$40                                  ; $1C8808 |
  BEQ code_1C8845                           ; $1C880A |
  LDA $0360,x                               ; $1C880C |
  SEC                                       ; $1C880F |
  SBC $0360,y                               ; $1C8810 |
  PHA                                       ; $1C8813 |
  LDA $0380,x                               ; $1C8814 |
  SBC $0380,y                               ; $1C8817 |
  PLA                                       ; $1C881A |
  BCS code_1C8821                           ; $1C881B |
  EOR #$FF                                  ; $1C881D |
  ADC #$01                                  ; $1C881F |
code_1C8821:
  CMP #$08                                  ; $1C8821 |
  BCS code_1C8845                           ; $1C8823 |
  LDA $0400,x                               ; $1C8825 |
  STA $0440,x                               ; $1C8828 |
  LDA $0420,x                               ; $1C882B |
  STA $0460,x                               ; $1C882E |
  LDA #$08                                  ; $1C8831 |
  STA $04A0,x                               ; $1C8833 |
  LDA $03C0,x                               ; $1C8836 |
  SEC                                       ; $1C8839 |
  SBC $03C0,y                               ; $1C883A |
  BCS code_1C884A                           ; $1C883D |
  LDA #$04                                  ; $1C883F |
  STA $04A0,x                               ; $1C8841 |
  RTS                                       ; $1C8844 |

code_1C8845:
  DEY                                       ; $1C8845 |
  CPY #$0F                                  ; $1C8846 |
  BNE code_1C8800                           ; $1C8848 |
code_1C884A:
  RTS                                       ; $1C884A |

code_1C884B:
  LDA $0460,x                               ; $1C884B |
  CMP #$06                                  ; $1C884E |
  BEQ code_1C8863                           ; $1C8850 |
  LDA $0440,x                               ; $1C8852 |
  CLC                                       ; $1C8855 |
  ADC #$20                                  ; $1C8856 |
  STA $0440,x                               ; $1C8858 |
  LDA $0460,x                               ; $1C885B |
  ADC #$00                                  ; $1C885E |
  STA $0460,x                               ; $1C8860 |
code_1C8863:
  LDA $04A0,x                               ; $1C8863 |
  AND #$08                                  ; $1C8866 |
  BEQ code_1C8875                           ; $1C8868 |
  LDA #$9A                                  ; $1C886A |
  STA $05C0,x                               ; $1C886C |
  JSR code_1FF779                           ; $1C886F |
  JMP code_1C887D                           ; $1C8872 |

code_1C8875:
  JSR code_1FF759                           ; $1C8875 |
  LDA #$9B                                  ; $1C8878 |
  STA $05C0,x                               ; $1C887A |
code_1C887D:
  LDA $03E0,x                               ; $1C887D |
  BEQ code_1C8887                           ; $1C8880 |
  LDA #$00                                  ; $1C8882 |
  STA $0300,x                               ; $1C8884 |
code_1C8887:
  RTS                                       ; $1C8887 |

  LDA $0500,x                               ; $1C8888 |
  BEQ code_1C8899                           ; $1C888B |
  DEC $0500,x                               ; $1C888D |
  LDA $0500,x                               ; $1C8890 |
  CMP $8943,x                               ; $1C8893 |
  BCC code_1C8899                           ; $1C8896 |
  RTS                                       ; $1C8898 |

code_1C8899:
  LDA $04A0,x                               ; $1C8899 |
  AND #$01                                  ; $1C889C |
  BEQ code_1C88BB                           ; $1C889E |
  LDA $0500,x                               ; $1C88A0 |
  BEQ code_1C88AD                           ; $1C88A3 |
  LDY #$1E                                  ; $1C88A5 |
  JSR code_1FF580                           ; $1C88A7 |
  JMP code_1C88D6                           ; $1C88AA |

code_1C88AD:
  LDA $0580,x                               ; $1C88AD |
  ORA #$40                                  ; $1C88B0 |
  STA $0580,x                               ; $1C88B2 |
  JSR code_1FF71D                           ; $1C88B5 |
  JMP code_1C88FD                           ; $1C88B8 |

code_1C88BB:
  LDA $0500,x                               ; $1C88BB |
  BEQ code_1C88C8                           ; $1C88BE |
  LDY #$1F                                  ; $1C88C0 |
  JSR code_1FF5C4                           ; $1C88C2 |
  JMP code_1C88D6                           ; $1C88C5 |

code_1C88C8:
  LDA $0580,x                               ; $1C88C8 |
  AND #$BF                                  ; $1C88CB |
  STA $0580,x                               ; $1C88CD |
  JSR code_1FF73B                           ; $1C88D0 |
  JMP code_1C88FD                           ; $1C88D3 |

code_1C88D6:
  BCC code_1C88FD                           ; $1C88D6 |
  LDA #$00                                  ; $1C88D8 |
  STA $0440,x                               ; $1C88DA |
  STA $0400,x                               ; $1C88DD |
  LDA #$03                                  ; $1C88E0 |
  STA $0460,x                               ; $1C88E2 |
  STA $0420,x                               ; $1C88E5 |
  LDA $04A0,x                               ; $1C88E8 |
  EOR #$03                                  ; $1C88EB |
  STA $04A0,x                               ; $1C88ED |
  AND #$0C                                  ; $1C88F0 |
  BNE code_1C8943                           ; $1C88F2 |
  LDA $04A0,x                               ; $1C88F4 |
  ORA #$08                                  ; $1C88F7 |
  STA $04A0,x                               ; $1C88F9 |
  RTS                                       ; $1C88FC |

code_1C88FD:
  LDA $04A0,x                               ; $1C88FD |
  AND #$0C                                  ; $1C8900 |
  BEQ code_1C8943                           ; $1C8902 |
  AND #$04                                  ; $1C8904 |
  BEQ code_1C8922                           ; $1C8906 |
  LDA $0500,x                               ; $1C8908 |
  BEQ code_1C891A                           ; $1C890B |
  LDY #$12                                  ; $1C890D |
  JSR code_1FF606                           ; $1C890F |
  LDA #$A0                                  ; $1C8912 |
  STA $05C0,x                               ; $1C8914 |
  JMP code_1C8939                           ; $1C8917 |

code_1C891A:
  LDA #$A0                                  ; $1C891A |
  STA $05C0,x                               ; $1C891C |
  JMP code_1FF759                           ; $1C891F |

code_1C8922:
  LDA $0500,x                               ; $1C8922 |
  BNE code_1C892F                           ; $1C8925 |
  LDA #$A1                                  ; $1C8927 |
  STA $05C0,x                               ; $1C8929 |
  JMP code_1FF779                           ; $1C892C |

code_1C892F:
  LDY #$13                                  ; $1C892F |
  JSR code_1FF642                           ; $1C8931 |
  LDA #$A1                                  ; $1C8934 |
  STA $05C0,x                               ; $1C8936 |
code_1C8939:
  BCC code_1C8943                           ; $1C8939 |
  LDA $04A0,x                               ; $1C893B |
  EOR #$0C                                  ; $1C893E |
  STA $04A0,x                               ; $1C8940 |
code_1C8943:
  RTS                                       ; $1C8943 |

  db $B4, $B2, $B0                          ; $1C8944 |

  LDA $05C0,x                               ; $1C8947 |
  CMP #$71                                  ; $1C894A |
  BEQ code_1C8961                           ; $1C894C |
  CMP #$AC                                  ; $1C894E |
  BEQ code_1C8956                           ; $1C8950 |
  CMP #$AE                                  ; $1C8952 |
  BNE code_1C896D                           ; $1C8954 |
code_1C8956:
  LDA $05E0,x                               ; $1C8956 |
  BNE code_1C89C1                           ; $1C8959 |
  LDA #$71                                  ; $1C895B |
  STA $05C0,x                               ; $1C895D |
  RTS                                       ; $1C8960 |

code_1C8961:
  LDA $05A0,x                               ; $1C8961 |
  CMP #$04                                  ; $1C8964 |
  BNE code_1C89C1                           ; $1C8966 |
  LDA #$AF                                  ; $1C8968 |
  JSR reset_sprite_anim                     ; $1C896A |
code_1C896D:
  LDA $0420,x                               ; $1C896D |
  CMP #$03                                  ; $1C8970 |
  BEQ code_1C8985                           ; $1C8972 |
  LDA $0400,x                               ; $1C8974 |
  CLC                                       ; $1C8977 |
  ADC #$20                                  ; $1C8978 |
  STA $0400,x                               ; $1C897A |
  LDA $0420,x                               ; $1C897D |
  ADC #$00                                  ; $1C8980 |
  STA $0420,x                               ; $1C8982 |
code_1C8985:
  LDA $04A0,x                               ; $1C8985 |
  AND #$01                                  ; $1C8988 |
  BEQ code_1C8992                           ; $1C898A |
  JSR code_1FF71D                           ; $1C898C |
  JMP code_1C8995                           ; $1C898F |

code_1C8992:
  JSR code_1FF73B                           ; $1C8992 |
code_1C8995:
  LDA $95                                   ; $1C8995 |
  AND #$01                                  ; $1C8997 |
  BEQ code_1C89A1                           ; $1C8999 |
  INC $03C0,x                               ; $1C899B |
  JMP code_1C89A4                           ; $1C899E |

code_1C89A1:
  DEC $03C0,x                               ; $1C89A1 |
code_1C89A4:
  LDA $16                                   ; $1C89A4 |
  AND #$0C                                  ; $1C89A6 |
  BEQ code_1C89C1                           ; $1C89A8 |
  AND #$08                                  ; $1C89AA |
  BEQ code_1C89B4                           ; $1C89AC |
  JSR code_1FF779                           ; $1C89AE |
  JMP code_1C89B7                           ; $1C89B1 |

code_1C89B4:
  JSR code_1FF759                           ; $1C89B4 |
code_1C89B7:
  LDA $03E0,x                               ; $1C89B7 |
  BEQ code_1C89C1                           ; $1C89BA |
  LDA #$00                                  ; $1C89BC |
  STA $0300,x                               ; $1C89BE |
code_1C89C1:
  RTS                                       ; $1C89C1 |

  LDA $0300,x                               ; $1C89C2 |
  AND #$0F                                  ; $1C89C5 |
  BNE code_1C89F6                           ; $1C89C7 |
  LDY #$12                                  ; $1C89C9 |
  JSR code_1FF67C                           ; $1C89CB |
  BCS code_1C89DB                           ; $1C89CE |
  LDA $0500,x                               ; $1C89D0 |
  BEQ code_1C8A47                           ; $1C89D3 |
  DEC $0500,x                               ; $1C89D5 |
  JMP code_1C8A80                           ; $1C89D8 |

code_1C89DB:
  LDA #$00                                  ; $1C89DB |
  STA $0400,x                               ; $1C89DD |
  STA $0440,x                               ; $1C89E0 |
  LDA #$03                                  ; $1C89E3 |
  STA $0420,x                               ; $1C89E5 |
  STA $0460,x                               ; $1C89E8 |
  LDA $04A0,x                               ; $1C89EB |
  ORA #$04                                  ; $1C89EE |
  STA $04A0,x                               ; $1C89F0 |
  INC $0300,x                               ; $1C89F3 |
code_1C89F6:
  LDA $04A0,x                               ; $1C89F6 |
  AND #$08                                  ; $1C89F9 |
  BNE code_1C8A0A                           ; $1C89FB |
  LDY #$12                                  ; $1C89FD |
  JSR code_1FF606                           ; $1C89FF |
  LDA #$A6                                  ; $1C8A02 |
  STA $05C0,x                               ; $1C8A04 |
  JMP code_1C8A14                           ; $1C8A07 |

code_1C8A0A:
  LDY #$13                                  ; $1C8A0A |
  JSR code_1FF642                           ; $1C8A0C |
  LDA #$A7                                  ; $1C8A0F |
  STA $05C0,x                               ; $1C8A11 |
code_1C8A14:
  LDA $03E0,x                               ; $1C8A14 |
  BNE code_1C8A92                           ; $1C8A17 |
  BCS code_1C8A48                           ; $1C8A19 |
  LDA $04A0,x                               ; $1C8A1B |
  AND #$0C                                  ; $1C8A1E |
  TAY                                       ; $1C8A20 |
  LDA $04A0,x                               ; $1C8A21 |
  PHA                                       ; $1C8A24 |
  CPY #$08                                  ; $1C8A25 |
  BEQ code_1C8A2E                           ; $1C8A27 |
  EOR #$03                                  ; $1C8A29 |
  STA $04A0,x                               ; $1C8A2B |
code_1C8A2E:
  LDA $05C0,x                               ; $1C8A2E |
  PHA                                       ; $1C8A31 |
  JSR code_1C8A55                           ; $1C8A32 |
  PLA                                       ; $1C8A35 |
  STA $05C0,x                               ; $1C8A36 |
  PLA                                       ; $1C8A39 |
  STA $04A0,x                               ; $1C8A3A |
  BCS code_1C8A78                           ; $1C8A3D |
  LDA $04A0,x                               ; $1C8A3F |
  EOR #$0C                                  ; $1C8A42 |
  STA $04A0,x                               ; $1C8A44 |
code_1C8A47:
  RTS                                       ; $1C8A47 |

code_1C8A48:
  LDA $04A0,x                               ; $1C8A48 |
  AND #$08                                  ; $1C8A4B |
  BEQ code_1C8A55                           ; $1C8A4D |
  LDA #$00                                  ; $1C8A4F |
  STA $0300,x                               ; $1C8A51 |
  RTS                                       ; $1C8A54 |

code_1C8A55:
  LDA #$A5                                  ; $1C8A55 |
  STA $05C0,x                               ; $1C8A57 |
  LDA $04A0,x                               ; $1C8A5A |
  AND #$01                                  ; $1C8A5D |
  BEQ code_1C8A69                           ; $1C8A5F |
  LDY #$1E                                  ; $1C8A61 |
  JSR code_1FF580                           ; $1C8A63 |
  JMP code_1C8A6E                           ; $1C8A66 |

code_1C8A69:
  LDY #$1F                                  ; $1C8A69 |
  JSR code_1FF5C4                           ; $1C8A6B |
code_1C8A6E:
  BCC code_1C8A78                           ; $1C8A6E |
  LDA $04A0,x                               ; $1C8A70 |
  EOR #$0C                                  ; $1C8A73 |
  STA $04A0,x                               ; $1C8A75 |
code_1C8A78:
  RTS                                       ; $1C8A78 |

  LDA $0300,x                               ; $1C8A79 |
  AND #$0F                                  ; $1C8A7C |
  BNE code_1C8A8D                           ; $1C8A7E |
code_1C8A80:
  LDA $04A0,x                               ; $1C8A80 |
  AND #$01                                  ; $1C8A83 |
  BEQ code_1C8A8A                           ; $1C8A85 |
  JMP code_1FF71D                           ; $1C8A87 |

code_1C8A8A:
  JMP code_1FF73B                           ; $1C8A8A |

code_1C8A8D:
  DEC $0500,x                               ; $1C8A8D |
  BNE code_1C8A97                           ; $1C8A90 |
code_1C8A92:
  LDA #$00                                  ; $1C8A92 |
  STA $0300,x                               ; $1C8A94 |
code_1C8A97:
  RTS                                       ; $1C8A97 |

  LDA $04A0,x                               ; $1C8A98 |
  AND #$03                                  ; $1C8A9B |
  BEQ code_1C8AAC                           ; $1C8A9D |
  AND #$01                                  ; $1C8A9F |
  BEQ code_1C8AA9                           ; $1C8AA1 |
  JSR code_1FF71D                           ; $1C8AA3 |
  JMP code_1C8AAC                           ; $1C8AA6 |

code_1C8AA9:
  JSR code_1FF73B                           ; $1C8AA9 |
code_1C8AAC:
  LDA $04A0,x                               ; $1C8AAC |
  AND #$0C                                  ; $1C8AAF |
  BEQ code_1C8AC0                           ; $1C8AB1 |
  AND #$08                                  ; $1C8AB3 |
  BEQ code_1C8ABD                           ; $1C8AB5 |
  JSR code_1FF779                           ; $1C8AB7 |
  JMP code_1C8AC0                           ; $1C8ABA |

code_1C8ABD:
  JSR code_1FF759                           ; $1C8ABD |
code_1C8AC0:
  LDA $03E0,x                               ; $1C8AC0 |
  BNE code_1C8AD1                           ; $1C8AC3 |
  DEC $0500,x                               ; $1C8AC5 |
  BNE code_1C8AFA                           ; $1C8AC8 |
  LDA $0300,x                               ; $1C8ACA |
  AND #$0F                                  ; $1C8ACD |
  BEQ code_1C8AD7                           ; $1C8ACF |
code_1C8AD1:
  LDA #$00                                  ; $1C8AD1 |
  STA $0300,x                               ; $1C8AD3 |
  RTS                                       ; $1C8AD6 |

code_1C8AD7:
  INC $0300,x                               ; $1C8AD7 |
  LDA #$14                                  ; $1C8ADA |
  STA $0500,x                               ; $1C8ADC |
  LDA $04A0,x                               ; $1C8ADF |
  AND #$0C                                  ; $1C8AE2 |
  BEQ code_1C8AF2                           ; $1C8AE4 |
  LDA $04A0,x                               ; $1C8AE6 |
  EOR #$0C                                  ; $1C8AE9 |
  STA $04A0,x                               ; $1C8AEB |
  AND #$03                                  ; $1C8AEE |
  BEQ code_1C8AFA                           ; $1C8AF0 |
code_1C8AF2:
  LDA $04A0,x                               ; $1C8AF2 |
  EOR #$03                                  ; $1C8AF5 |
  STA $04A0,x                               ; $1C8AF7 |
code_1C8AFA:
  RTS                                       ; $1C8AFA |

  LDA $0300,x                               ; $1C8AFB |
  AND #$0F                                  ; $1C8AFE |
  BNE code_1C8B0A                           ; $1C8B00 |
  INC $0300,x                               ; $1C8B02 |
  LDA #$03                                  ; $1C8B05 |
  STA $0520,x                               ; $1C8B07 |
code_1C8B0A:
  LDA $04A0,x                               ; $1C8B0A |
  AND #$01                                  ; $1C8B0D |
  BEQ code_1C8B19                           ; $1C8B0F |
  LDY #$0A                                  ; $1C8B11 |
  JSR code_1FF580                           ; $1C8B13 |
  JMP code_1C8B1E                           ; $1C8B16 |

code_1C8B19:
  LDY #$0B                                  ; $1C8B19 |
  JSR code_1FF5C4                           ; $1C8B1B |
code_1C8B1E:
  LDY #$0A                                  ; $1C8B1E |
  JSR code_1FF67C                           ; $1C8B20 |
  BCC code_1C8B51                           ; $1C8B23 |
  LDA $0500,x                               ; $1C8B25 |
  TAY                                       ; $1C8B28 |
  LDA $8B52,y                               ; $1C8B29 |
  STA $0440,x                               ; $1C8B2C |
  LDA $8B55,y                               ; $1C8B2F |
  STA $0460,x                               ; $1C8B32 |
  DEC $0520,x                               ; $1C8B35 |
  BNE code_1C8B42                           ; $1C8B38 |
  JSR code_1FF869                           ; $1C8B3A |
  LDA #$03                                  ; $1C8B3D |
  STA $0520,x                               ; $1C8B3F |
code_1C8B42:
  INC $0500,x                               ; $1C8B42 |
  LDA $0500,x                               ; $1C8B45 |
  CMP #$03                                  ; $1C8B48 |
  BCC code_1C8B51                           ; $1C8B4A |
  LDA #$00                                  ; $1C8B4C |
  STA $0500,x                               ; $1C8B4E |
code_1C8B51:
  RTS                                       ; $1C8B51 |

  db $44, $44, $EA, $03, $03, $07           ; $1C8B52 |

  LDA $05C0,x                               ; $1C8B58 |
  CMP #$23                                  ; $1C8B5B |
  BEQ code_1C8B73                           ; $1C8B5D |
  LDA $04A0,x                               ; $1C8B5F |
  AND #$01                                  ; $1C8B62 |
  BEQ code_1C8B6E                           ; $1C8B64 |
  LDY #$08                                  ; $1C8B66 |
  JSR code_1FF580                           ; $1C8B68 |
  JMP code_1C8B73                           ; $1C8B6B |

code_1C8B6E:
  LDY #$09                                  ; $1C8B6E |
  JSR code_1FF5C4                           ; $1C8B70 |
code_1C8B73:
  BCC code_1C8B7D                           ; $1C8B73 |
  LDA $04A0,x                               ; $1C8B75 |
  EOR #$03                                  ; $1C8B78 |
  STA $04A0,x                               ; $1C8B7A |
code_1C8B7D:
  LDA $0300,x                               ; $1C8B7D |
  AND #$0F                                  ; $1C8B80 |
  BNE code_1C8B92                           ; $1C8B82 |
  JSR code_1FF8C2                           ; $1C8B84 |
  CMP #$04                                  ; $1C8B87 |
  BCS code_1C8BA8                           ; $1C8B89 |
  INC $0300,x                               ; $1C8B8B |
  LDA #$23                                  ; $1C8B8E |
  BNE code_1C8BA5                           ; $1C8B90 |
code_1C8B92:
  LDA $05C0,x                               ; $1C8B92 |
  CMP #$24                                  ; $1C8B95 |
  BEQ code_1C8BA8                           ; $1C8B97 |
  LDA $05A0,x                               ; $1C8B99 |
  CMP #$06                                  ; $1C8B9C |
  BNE code_1C8BA8                           ; $1C8B9E |
  JSR code_1C8BA9                           ; $1C8BA0 |
  LDA #$24                                  ; $1C8BA3 |
code_1C8BA5:
  JSR reset_sprite_anim                     ; $1C8BA5 |
code_1C8BA8:
  RTS                                       ; $1C8BA8 |

code_1C8BA9:
  JSR code_1FFC53                           ; $1C8BA9 |
  BCS code_1C8BDD                           ; $1C8BAC |
  LDA $04A0,x                               ; $1C8BAE |
  STA $04A0,y                               ; $1C8BB1 |
  LDA $0360,x                               ; $1C8BB4 |
  STA $0360,y                               ; $1C8BB7 |
  LDA $0380,x                               ; $1C8BBA |
  STA $0380,y                               ; $1C8BBD |
  LDA $03C0,x                               ; $1C8BC0 |
  CLC                                       ; $1C8BC3 |
  ADC #$11                                  ; $1C8BC4 |
  STA $03C0,y                               ; $1C8BC6 |
  LDA #$01                                  ; $1C8BC9 |
  STA $04E0,y                               ; $1C8BCB |
  LDA #$25                                  ; $1C8BCE |
  JSR code_1FF846                           ; $1C8BD0 |
  LDA #$04                                  ; $1C8BD3 |
  STA $0320,y                               ; $1C8BD5 |
  LDA #$C0                                  ; $1C8BD8 |
  STA $0480,y                               ; $1C8BDA |
code_1C8BDD:
  RTS                                       ; $1C8BDD |

  LDA $0300,x                               ; $1C8BDE |
  AND #$0F                                  ; $1C8BE1 |
  BNE code_1C8BEB                           ; $1C8BE3 |
  JSR code_1FF81B                           ; $1C8BE5 |
  INC $0300,x                               ; $1C8BE8 |
code_1C8BEB:
  LDY #$08                                  ; $1C8BEB |
  JSR code_1FF67C                           ; $1C8BED |
  BCC code_1C8BFC                           ; $1C8BF0 |
  LDA #$71                                  ; $1C8BF2 |
  JSR reset_sprite_anim                     ; $1C8BF4 |
  LDA #$00                                  ; $1C8BF7 |
  STA $0320,x                               ; $1C8BF9 |
code_1C8BFC:
  RTS                                       ; $1C8BFC |

  LDA $0300,x                               ; $1C8BFD |
  AND #$0F                                  ; $1C8C00 |
  BNE code_1C8C12                           ; $1C8C02 |
  STA $0520,x                               ; $1C8C04 |
  LDA #$1E                                  ; $1C8C07 |
  STA $0500,x                               ; $1C8C09 |
  JSR code_1FF883                           ; $1C8C0C |
  INC $0300,x                               ; $1C8C0F |
code_1C8C12:
  LDA $0500,x                               ; $1C8C12 |
  BNE code_1C8C2A                           ; $1C8C15 |
  LDA $05E0,x                               ; $1C8C17 |
  ORA $05A0,x                               ; $1C8C1A |
  BNE code_1C8C2D                           ; $1C8C1D |
  LDA #$27                                  ; $1C8C1F |
  CMP $05C0,x                               ; $1C8C21 |
  BEQ code_1C8C42                           ; $1C8C24 |
  STA $05C0,x                               ; $1C8C26 |
  RTS                                       ; $1C8C29 |

code_1C8C2A:
  DEC $0500,x                               ; $1C8C2A |
code_1C8C2D:
  LDA $04A0,x                               ; $1C8C2D |
  PHA                                       ; $1C8C30 |
  JSR code_1FF869                           ; $1C8C31 |
  PLA                                       ; $1C8C34 |
  CMP $04A0,x                               ; $1C8C35 |
  BEQ code_1C8C42                           ; $1C8C38 |
  LDA $0580,x                               ; $1C8C3A |
  EOR #$40                                  ; $1C8C3D |
  STA $0580,x                               ; $1C8C3F |
code_1C8C42:
  LDA $05C0,x                               ; $1C8C42 |
  CMP #$27                                  ; $1C8C45 |
  BNE code_1C8C7F                           ; $1C8C47 |
  LDA $0520,x                               ; $1C8C49 |
  BNE code_1C8C59                           ; $1C8C4C |
  LDA $0480,x                               ; $1C8C4E |
  EOR #$60                                  ; $1C8C51 |
  STA $0480,x                               ; $1C8C53 |
  INC $0520,x                               ; $1C8C56 |
code_1C8C59:
  LDA $05A0,x                               ; $1C8C59 |
  CMP #$0A                                  ; $1C8C5C |
  BNE code_1C8C69                           ; $1C8C5E |
  LDA $05E0,x                               ; $1C8C60 |
  BNE code_1C8C69                           ; $1C8C63 |
  JSR code_1C8C80                           ; $1C8C65 |
  RTS                                       ; $1C8C68 |

code_1C8C69:
  LDA $05E0,x                               ; $1C8C69 |
  ORA $05A0,x                               ; $1C8C6C |
  BNE code_1C8C7F                           ; $1C8C6F |
  DEC $05C0,x                               ; $1C8C71 |
  DEC $0300,x                               ; $1C8C74 |
  LDA $0480,x                               ; $1C8C77 |
  EOR #$60                                  ; $1C8C7A |
  STA $0480,x                               ; $1C8C7C |
code_1C8C7F:
  RTS                                       ; $1C8C7F |

code_1C8C80:
  JSR code_1FFC53                           ; $1C8C80 |
  BCS code_1C8CCE                           ; $1C8C83 |
  STY $00                                   ; $1C8C85 |
  LDA $04A0,x                               ; $1C8C87 |
  STA $04A0,y                               ; $1C8C8A |
  AND #$02                                  ; $1C8C8D |
  TAY                                       ; $1C8C8F |
  LDA $0360,x                               ; $1C8C90 |
  CLC                                       ; $1C8C93 |
  ADC $8CCF,y                               ; $1C8C94 |
  PHA                                       ; $1C8C97 |
  LDA $0380,x                               ; $1C8C98 |
  ADC $8CD0,y                               ; $1C8C9B |
  LDY $00                                   ; $1C8C9E |
  STA $0380,y                               ; $1C8CA0 |
  PLA                                       ; $1C8CA3 |
  STA $0360,y                               ; $1C8CA4 |
  LDA $03C0,x                               ; $1C8CA7 |
  SEC                                       ; $1C8CAA |
  SBC #$06                                  ; $1C8CAB |
  STA $03C0,y                               ; $1C8CAD |
  LDA #$33                                  ; $1C8CB0 |
  STA $0400,y                               ; $1C8CB2 |
  LDA #$03                                  ; $1C8CB5 |
  STA $0420,y                               ; $1C8CB7 |
  LDA #$28                                  ; $1C8CBA |
  JSR code_1FF846                           ; $1C8CBC |
  LDA #$2D                                  ; $1C8CBF |
  STA $0320,y                               ; $1C8CC1 |
  LDA #$C0                                  ; $1C8CC4 |
  STA $0480,y                               ; $1C8CC6 |
  LDA #$01                                  ; $1C8CC9 |
  STA $04E0,y                               ; $1C8CCB |
code_1C8CCE:
  RTS                                       ; $1C8CCE |

  db $13, $00, $ED, $FF                     ; $1C8CCF |

  LDY #$00                                  ; $1C8CD3 |
  JSR code_1FF67C                           ; $1C8CD5 |
  ROL $0F                                   ; $1C8CD8 |
  LDA $05C0,x                               ; $1C8CDA |
  CMP #$6A                                  ; $1C8CDD |
  BEQ code_1C8D03                           ; $1C8CDF |
  LDA $0520,x                               ; $1C8CE1 |
  BEQ code_1C8CEF                           ; $1C8CE4 |
  LDA $0500,x                               ; $1C8CE6 |
  BEQ code_1C8CEF                           ; $1C8CE9 |
  DEC $0500,x                               ; $1C8CEB |
  RTS                                       ; $1C8CEE |

code_1C8CEF:
  LDA $04A0,x                               ; $1C8CEF |
  AND #$01                                  ; $1C8CF2 |
  BEQ code_1C8CFE                           ; $1C8CF4 |
  LDY #$00                                  ; $1C8CF6 |
  JSR code_1FF580                           ; $1C8CF8 |
  JMP code_1C8D03                           ; $1C8CFB |

code_1C8CFE:
  LDY #$01                                  ; $1C8CFE |
  JSR code_1FF5C4                           ; $1C8D00 |
code_1C8D03:
  BCC code_1C8D0D                           ; $1C8D03 |
  LDA $04A0,x                               ; $1C8D05 |
  EOR #$03                                  ; $1C8D08 |
  STA $04A0,x                               ; $1C8D0A |
code_1C8D0D:
  LDA $0300,x                               ; $1C8D0D |
  AND #$0F                                  ; $1C8D10 |
  BNE code_1C8D23                           ; $1C8D12 |
  JSR code_1FF8C2                           ; $1C8D14 |
  CMP #$40                                  ; $1C8D17 |
  BCS code_1C8D23                           ; $1C8D19 |
  INC $0300,x                               ; $1C8D1B |
  LDA #$6A                                  ; $1C8D1E |
  JSR reset_sprite_anim                     ; $1C8D20 |
code_1C8D23:
  LDA $05C0,x                               ; $1C8D23 |
  CMP #$6A                                  ; $1C8D26 |
  BNE code_1C8D9C                           ; $1C8D28 |
  LDA $05A0,x                               ; $1C8D2A |
  CMP #$02                                  ; $1C8D2D |
  BNE code_1C8D9C                           ; $1C8D2F |
  LDA #$6B                                  ; $1C8D31 |
  JSR reset_sprite_anim                     ; $1C8D33 |
  LDA $0480,x                               ; $1C8D36 |
  EOR #$60                                  ; $1C8D39 |
  STA $0480,x                               ; $1C8D3B |
  LDA $03C0,x                               ; $1C8D3E |
  SEC                                       ; $1C8D41 |
  SBC #$10                                  ; $1C8D42 |
  STA $03C0,x                               ; $1C8D44 |
  LDA #$4D                                  ; $1C8D47 |
  STA $0440,x                               ; $1C8D49 |
  LDA #$07                                  ; $1C8D4C |
  STA $0460,x                               ; $1C8D4E |
  JSR code_1FFC53                           ; $1C8D51 |
  BCS code_1C8D9C                           ; $1C8D54 |
  STY $00                                   ; $1C8D56 |
  LDA $04A0,x                               ; $1C8D58 |
  AND #$02                                  ; $1C8D5B |
  TAY                                       ; $1C8D5D |
  LDA $0360,x                               ; $1C8D5E |
  CLC                                       ; $1C8D61 |
  ADC $8DC4,y                               ; $1C8D62 |
  PHA                                       ; $1C8D65 |
  LDA $0380,x                               ; $1C8D66 |
  ADC $8DC5,y                               ; $1C8D69 |
  LDY $00                                   ; $1C8D6C |
  STA $0380,y                               ; $1C8D6E |
  PLA                                       ; $1C8D71 |
  STA $0360,y                               ; $1C8D72 |
  LDA $03C0,x                               ; $1C8D75 |
  STA $03C0,y                               ; $1C8D78 |
  LDA #$01                                  ; $1C8D7B |
  STA $04E0,y                               ; $1C8D7D |
  LDA #$6C                                  ; $1C8D80 |
  JSR code_1FF846                           ; $1C8D82 |
  LDA #$C2                                  ; $1C8D85 |
  STA $0480,y                               ; $1C8D87 |
  LDA #$44                                  ; $1C8D8A |
  STA $0440,y                               ; $1C8D8C |
  LDA #$03                                  ; $1C8D8F |
  STA $0460,y                               ; $1C8D91 |
  LDA #$09                                  ; $1C8D94 |
  STA $0320,y                               ; $1C8D96 |
  JMP code_1C8DC3                           ; $1C8D99 |

code_1C8D9C:
  LDA $05C0,x                               ; $1C8D9C |
  CMP #$6B                                  ; $1C8D9F |
  BNE code_1C8DC3                           ; $1C8DA1 |
  LDA $0F                                   ; $1C8DA3 |
  AND #$01                                  ; $1C8DA5 |
  BEQ code_1C8DC3                           ; $1C8DA7 |
  LDA #$6D                                  ; $1C8DA9 |
  JSR reset_sprite_anim                     ; $1C8DAB |
  JSR code_1FF869                           ; $1C8DAE |
  LDA #$00                                  ; $1C8DB1 |
  STA $0400,x                               ; $1C8DB3 |
  LDA #$02                                  ; $1C8DB6 |
  STA $0420,x                               ; $1C8DB8 |
  LDA #$10                                  ; $1C8DBB |
  STA $0500,x                               ; $1C8DBD |
  INC $0520,x                               ; $1C8DC0 |
code_1C8DC3:
  RTS                                       ; $1C8DC3 |

  JSR code_1FE000                           ; $1C8DC4 |

  db $FF                                    ; $1C8DC7 |

  JMP code_1FF797                           ; $1C8DC8 |

  LDA $0300,x                               ; $1C8DCB |
  AND #$0F                                  ; $1C8DCE |
  BNE code_1C8DED                           ; $1C8DD0 |
  STA $0460,x                               ; $1C8DD2 |
  LDA #$C0                                  ; $1C8DD5 |
  STA $0440,x                               ; $1C8DD7 |
  LDA $0320,x                               ; $1C8DDA |
  SEC                                       ; $1C8DDD |
  SBC #$15                                  ; $1C8DDE |
  TAY                                       ; $1C8DE0 |
  LDA $8E12,y                               ; $1C8DE1 |
  STA $0500,x                               ; $1C8DE4 |
  STA $0520,x                               ; $1C8DE7 |
  INC $0300,x                               ; $1C8DEA |
code_1C8DED:
  LDA $04A0,x                               ; $1C8DED |
  AND #$01                                  ; $1C8DF0 |
  BEQ code_1C8DFA                           ; $1C8DF2 |
  JSR code_1FF779                           ; $1C8DF4 |
  JMP code_1C8DFD                           ; $1C8DF7 |

code_1C8DFA:
  JSR code_1FF759                           ; $1C8DFA |
code_1C8DFD:
  DEC $0500,x                               ; $1C8DFD |
  BNE code_1C8E11                           ; $1C8E00 |
  LDA $04A0,x                               ; $1C8E02 |
  EOR #$03                                  ; $1C8E05 |
  STA $04A0,x                               ; $1C8E07 |
  LDA $0520,x                               ; $1C8E0A |
  ASL                                       ; $1C8E0D |
  STA $0500,x                               ; $1C8E0E |
code_1C8E11:
  RTS                                       ; $1C8E11 |

  db $60, $70                               ; $1C8E12 |

  LDA $0300,x                               ; $1C8E14 |
  AND #$0F                                  ; $1C8E17 |
  BNE code_1C8E29                           ; $1C8E19 |
  INC $0300,x                               ; $1C8E1B |
  LDA #$00                                  ; $1C8E1E |
  STA $0500,x                               ; $1C8E20 |
  STA $0520,x                               ; $1C8E23 |
  JSR code_1FF883                           ; $1C8E26 |
code_1C8E29:
  LDA $0300,x                               ; $1C8E29 |
  AND #$02                                  ; $1C8E2C |
  BEQ code_1C8E33                           ; $1C8E2E |
  JMP code_1C8ED3                           ; $1C8E30 |

code_1C8E33:
  LDA $0500,x                               ; $1C8E33 |
  BNE code_1C8E86                           ; $1C8E36 |
  LDY $0520,x                               ; $1C8E38 |
  LDA $8F3C,y                               ; $1C8E3B |
  ASL                                       ; $1C8E3E |
  TAY                                       ; $1C8E3F |
  LDA $8F4A,y                               ; $1C8E40 |
  STA $0440,x                               ; $1C8E43 |
  LDA $8F4B,y                               ; $1C8E46 |
  STA $0460,x                               ; $1C8E49 |
  LDA $8F6A,y                               ; $1C8E4C |
  STA $0400,x                               ; $1C8E4F |
  LDA $8F6B,y                               ; $1C8E52 |
  STA $0420,x                               ; $1C8E55 |
  LDA $0420,x                               ; $1C8E58 |
  BPL code_1C8E72                           ; $1C8E5B |
  LDA $0400,x                               ; $1C8E5D |
  EOR #$FF                                  ; $1C8E60 |
  CLC                                       ; $1C8E62 |
  ADC #$01                                  ; $1C8E63 |
  STA $0400,x                               ; $1C8E65 |
  LDA $0420,x                               ; $1C8E68 |
  EOR #$FF                                  ; $1C8E6B |
  ADC #$00                                  ; $1C8E6D |
  STA $0420,x                               ; $1C8E6F |
code_1C8E72:
  INC $0520,x                               ; $1C8E72 |
  LDA $0520,x                               ; $1C8E75 |
  CMP #$0E                                  ; $1C8E78 |
  BNE code_1C8E81                           ; $1C8E7A |
  LDA #$00                                  ; $1C8E7C |
  STA $0520,x                               ; $1C8E7E |
code_1C8E81:
  LDA #$05                                  ; $1C8E81 |
  STA $0500,x                               ; $1C8E83 |
code_1C8E86:
  DEC $0500,x                               ; $1C8E86 |
  LDA $03A0,x                               ; $1C8E89 |
  CLC                                       ; $1C8E8C |
  ADC $0440,x                               ; $1C8E8D |
  STA $03A0,x                               ; $1C8E90 |
  LDA $03C0,x                               ; $1C8E93 |
  ADC $0460,x                               ; $1C8E96 |
  STA $03C0,x                               ; $1C8E99 |
  LDA $04A0,x                               ; $1C8E9C |
  AND #$02                                  ; $1C8E9F |
  BNE code_1C8EAA                           ; $1C8EA1 |
  JSR code_1FF71D                           ; $1C8EA3 |
  BCS code_1C8EAD                           ; $1C8EA6 |
  BCC code_1C8EAD                           ; $1C8EA8 |
code_1C8EAA:
  JSR code_1FF73B                           ; $1C8EAA |
code_1C8EAD:
  LDA $0320,x                               ; $1C8EAD |
  CMP #$0A                                  ; $1C8EB0 |
  BNE code_1C8F04                           ; $1C8EB2 |
  JSR code_1FFB7B                           ; $1C8EB4 |
  BCS code_1C8ED2                           ; $1C8EB7 |
  LDY $10                                   ; $1C8EB9 |
  LDA #$00                                  ; $1C8EBB |
  STA $0300,y                               ; $1C8EBD |
  INC $0300,x                               ; $1C8EC0 |
  LDA #$80                                  ; $1C8EC3 |
  STA $0400,x                               ; $1C8EC5 |
  LDA #$02                                  ; $1C8EC8 |
  STA $0420,x                               ; $1C8ECA |
  LDA #$48                                  ; $1C8ECD |
  JSR reset_sprite_anim                     ; $1C8ECF |
code_1C8ED2:
  RTS                                       ; $1C8ED2 |

code_1C8ED3:
  LDA $0320,x                               ; $1C8ED3 |
  CMP #$0A                                  ; $1C8ED6 |
  BNE code_1C8F1F                           ; $1C8ED8 |
  LDA $05C0,x                               ; $1C8EDA |
  CMP #$49                                  ; $1C8EDD |
  BEQ code_1C8EF7                           ; $1C8EDF |
  LDA $05E0,x                               ; $1C8EE1 |
  ORA $05A0,x                               ; $1C8EE4 |
  BNE code_1C8EF6                           ; $1C8EE7 |
  LDA #$49                                  ; $1C8EE9 |
  JSR reset_sprite_anim                     ; $1C8EEB |
  LDA $0480,x                               ; $1C8EEE |
  ORA #$C3                                  ; $1C8EF1 |
  STA $0480,x                               ; $1C8EF3 |
code_1C8EF6:
  RTS                                       ; $1C8EF6 |

code_1C8EF7:
  LDA $04A0,x                               ; $1C8EF7 |
  AND #$01                                  ; $1C8EFA |
  BEQ code_1C8F01                           ; $1C8EFC |
  JMP code_1FF71D                           ; $1C8EFE |

code_1C8F01:
  JMP code_1FF73B                           ; $1C8F01 |

code_1C8F04:
  JSR code_1FF8C2                           ; $1C8F04 |
  CMP #$30                                  ; $1C8F07 |
  BCS code_1C8EF6                           ; $1C8F09 |
  LDA #$00                                  ; $1C8F0B |
  STA $02                                   ; $1C8F0D |
  LDA #$02                                  ; $1C8F0F |
  STA $03                                   ; $1C8F11 |
  JSR code_1FFC63                           ; $1C8F13 |
  LDA $0C                                   ; $1C8F16 |
  STA $04A0,x                               ; $1C8F18 |
  INC $0300,x                               ; $1C8F1B |
  RTS                                       ; $1C8F1E |

code_1C8F1F:
  LDA $04A0,x                               ; $1C8F1F |
  AND #$01                                  ; $1C8F22 |
  BEQ code_1C8F2C                           ; $1C8F24 |
  JSR code_1FF71D                           ; $1C8F26 |
  JMP code_1C8F2F                           ; $1C8F29 |

code_1C8F2C:
  JSR code_1FF73B                           ; $1C8F2C |
code_1C8F2F:
  LDA $04A0,x                               ; $1C8F2F |
  AND #$08                                  ; $1C8F32 |
  BEQ code_1C8F39                           ; $1C8F34 |
  JMP code_1FF779                           ; $1C8F36 |

code_1C8F39:
  JMP code_1FF759                           ; $1C8F39 |

  db $09, $0A, $0B, $0C, $0D, $0E, $0F, $01 ; $1C8F3C |
  db $02, $03, $04, $05, $06, $07, $CD, $FE ; $1C8F44 |
  db $E5, $FE, $27, $FF, $8B, $FF, $00, $00 ; $1C8F4C |
  db $75, $00, $D9, $00, $1B, $01, $33, $01 ; $1C8F54 |
  db $1B, $01, $D9, $00, $75, $00, $00, $00 ; $1C8F5C |
  db $8B, $FF, $27, $FF, $E5, $FE, $00, $00 ; $1C8F64 |
  db $75, $00, $D9, $00, $1B, $01, $33, $01 ; $1C8F6C |
  db $1B, $01, $D9, $00, $75, $00, $00, $00 ; $1C8F74 |
  db $8B, $FF, $27, $FF, $E5, $FE, $CD, $FE ; $1C8F7C |
  db $E5, $FE, $27, $FF, $8B, $FF           ; $1C8F84 |

  LDA $0300,x                               ; $1C8F8A |
  AND #$0F                                  ; $1C8F8D |
  BNE code_1C8FCF                           ; $1C8F8F |
  JSR code_1FFAF6                           ; $1C8F91 |
  BCC code_1C8F97                           ; $1C8F94 |
  RTS                                       ; $1C8F96 |

code_1C8F97:
  INC $0300,x                               ; $1C8F97 |
  LDA #$CC                                  ; $1C8F9A |
  STA $0440,x                               ; $1C8F9C |
  LDA #$00                                  ; $1C8F9F |
  STA $0460,x                               ; $1C8FA1 |
  LDA #$02                                  ; $1C8FA4 |
  STA $04A0,x                               ; $1C8FA6 |
  LDA #$10                                  ; $1C8FA9 |
  STA $0500,x                               ; $1C8FAB |
  LDA #$B4                                  ; $1C8FAE |
  STA $0540,x                               ; $1C8FB0 |
  LDA #$E8                                  ; $1C8FB3 |
  STA $03C0,x                               ; $1C8FB5 |
  LDA $0360,x                               ; $1C8FB8 |
  AND #$F0                                  ; $1C8FBB |
  ORA #$08                                  ; $1C8FBD |
  STA $0560,x                               ; $1C8FBF |
  LDA #$00                                  ; $1C8FC2 |
  STA $0340,x                               ; $1C8FC4 |
  LDA $0580,x                               ; $1C8FC7 |
  AND #$FB                                  ; $1C8FCA |
  STA $0580,x                               ; $1C8FCC |
code_1C8FCF:
  JSR code_1FF779                           ; $1C8FCF |
  LDA $0580,x                               ; $1C8FD2 |
  AND #$20                                  ; $1C8FD5 |
  BEQ code_1C8FEC                           ; $1C8FD7 |
  LDY #$06                                  ; $1C8FD9 |
  JSR code_1FE8D6                           ; $1C8FDB |
  LDA $10                                   ; $1C8FDE |
  AND #$10                                  ; $1C8FE0 |
  BNE code_1C9018                           ; $1C8FE2 |
  LDA $0580,x                               ; $1C8FE4 |
  AND #$DF                                  ; $1C8FE7 |
  STA $0580,x                               ; $1C8FE9 |
code_1C8FEC:
  LDA $04A0,x                               ; $1C8FEC |
  AND #$01                                  ; $1C8FEF |
  BEQ code_1C8FF9                           ; $1C8FF1 |
  JSR code_1FF71D                           ; $1C8FF3 |
  JMP code_1C8FFC                           ; $1C8FF6 |

code_1C8FF9:
  JSR code_1FF73B                           ; $1C8FF9 |
code_1C8FFC:
  DEC $0500,x                               ; $1C8FFC |
  BNE code_1C9018                           ; $1C8FFF |
  INC $0520,x                               ; $1C9001 |
  LDA $0520,x                               ; $1C9004 |
  AND #$03                                  ; $1C9007 |
  STA $0520,x                               ; $1C9009 |
  TAY                                       ; $1C900C |
  LDA $9030,y                               ; $1C900D |
  STA $04A0,x                               ; $1C9010 |
  LDA #$0E                                  ; $1C9013 |
  STA $0500,x                               ; $1C9015 |
code_1C9018:
  LDA $0540,x                               ; $1C9018 |
  BEQ code_1C9025                           ; $1C901B |
  DEC $0540,x                               ; $1C901D |
  BNE code_1C902F                           ; $1C9020 |
  JSR code_1C9034                           ; $1C9022 |
code_1C9025:
  LDA $03E0,x                               ; $1C9025 |
  BEQ code_1C902F                           ; $1C9028 |
  LDA #$00                                  ; $1C902A |
  STA $0300,x                               ; $1C902C |
code_1C902F:
  RTS                                       ; $1C902F |

  db $02, $01, $01, $02                     ; $1C9030 |

code_1C9034:
  JSR code_1FFC53                           ; $1C9034 |
  BCS code_1C9095                           ; $1C9037 |
  LDA #$70                                  ; $1C9039 |
  JSR code_1FF846                           ; $1C903B |
  LDA #$14                                  ; $1C903E |
  STA $0320,y                               ; $1C9040 |
  LDA #$81                                  ; $1C9043 |
  STA $0300,y                               ; $1C9045 |
  LDA $0580,y                               ; $1C9048 |
  ORA #$21                                  ; $1C904B |
  STA $0580,y                               ; $1C904D |
  LDA #$0F                                  ; $1C9050 |
  STA $0480,y                               ; $1C9052 |
  LDA $0560,x                               ; $1C9055 |
  STA $0360,y                               ; $1C9058 |
  STA $0560,y                               ; $1C905B |
  LDA $0380,x                               ; $1C905E |
  STA $0380,y                               ; $1C9061 |
  LDA #$00                                  ; $1C9064 |
  STA $0520,y                               ; $1C9066 |
  STA $03E0,y                               ; $1C9069 |
  STA $0460,y                               ; $1C906C |
  STA $0420,y                               ; $1C906F |
  LDA #$CC                                  ; $1C9072 |
  STA $0440,y                               ; $1C9074 |
  LDA #$80                                  ; $1C9077 |
  STA $0400,y                               ; $1C9079 |
  LDA #$E8                                  ; $1C907C |
  STA $03C0,y                               ; $1C907E |
  LDA #$02                                  ; $1C9081 |
  STA $04A0,y                               ; $1C9083 |
  LDA #$10                                  ; $1C9086 |
  STA $0500,y                               ; $1C9088 |
  LDA #$B4                                  ; $1C908B |
  STA $0540,y                               ; $1C908D |
  LDA #$E8                                  ; $1C9090 |
  STA $03C0,y                               ; $1C9092 |
code_1C9095:
  RTS                                       ; $1C9095 |

  LDA $0500,x                               ; $1C9096 |
  BNE code_1C90DE                           ; $1C9099 |
  JSR code_1FFC53                           ; $1C909B |
  BCS code_1C90D6                           ; $1C909E |
  LDA $04A0,x                               ; $1C90A0 |
  STA $04A0,y                               ; $1C90A3 |
  LDA $0360,x                               ; $1C90A6 |
  STA $0360,y                               ; $1C90A9 |
  LDA $0380,x                               ; $1C90AC |
  STA $0380,y                               ; $1C90AF |
  LDA $03C0,x                               ; $1C90B2 |
  STA $03C0,y                               ; $1C90B5 |
  LDA #$01                                  ; $1C90B8 |
  STA $04E0,y                               ; $1C90BA |
  LDA #$18                                  ; $1C90BD |
  STA $0320,y                               ; $1C90BF |
  LDA #$4E                                  ; $1C90C2 |
  JSR code_1FF846                           ; $1C90C4 |
  LDA #$C0                                  ; $1C90C7 |
  STA $0480,y                               ; $1C90C9 |
  LDA #$80                                  ; $1C90CC |
  STA $0400,y                               ; $1C90CE |
  LDA #$01                                  ; $1C90D1 |
  STA $0420,y                               ; $1C90D3 |
code_1C90D6:
  LDA #$F0                                  ; $1C90D6 |
  STA $0500,x                               ; $1C90D8 |
  JMP code_1FF869                           ; $1C90DB |

code_1C90DE:
  DEC $0500,x                               ; $1C90DE |
  RTS                                       ; $1C90E1 |

  LDA $0300,x                               ; $1C90E2 |
  AND #$0F                                  ; $1C90E5 |
  BNE code_1C90EF                           ; $1C90E7 |
  JSR code_1FF81B                           ; $1C90E9 |
  INC $0300,x                               ; $1C90EC |
code_1C90EF:
  LDA $05C0,x                               ; $1C90EF |
  CMP #$4E                                  ; $1C90F2 |
  BNE code_1C912C                           ; $1C90F4 |
  LDY #$08                                  ; $1C90F6 |
  JSR code_1FF67C                           ; $1C90F8 |
  ROR $00                                   ; $1C90FB |
  LDA $41                                   ; $1C90FD |
  CMP #$40                                  ; $1C90FF |
  BEQ code_1C9107                           ; $1C9101 |
  LDA $00                                   ; $1C9103 |
  BPL code_1C9164                           ; $1C9105 |
code_1C9107:
  LDA $04A0,x                               ; $1C9107 |
  AND #$01                                  ; $1C910A |
  BEQ code_1C9116                           ; $1C910C |
  LDA $43                                   ; $1C910E |
  CMP #$40                                  ; $1C9110 |
  BNE code_1C9142                           ; $1C9112 |
  BEQ code_1C911C                           ; $1C9114 |
code_1C9116:
  LDA $42                                   ; $1C9116 |
  CMP #$40                                  ; $1C9118 |
  BNE code_1C9142                           ; $1C911A |
code_1C911C:
  LDA #$4F                                  ; $1C911C |
  JSR reset_sprite_anim                     ; $1C911E |
  LDA #$80                                  ; $1C9121 |
  STA $0440,x                               ; $1C9123 |
  LDA #$01                                  ; $1C9126 |
  STA $0460,x                               ; $1C9128 |
  RTS                                       ; $1C912B |

code_1C912C:
  LDY #$0C                                  ; $1C912C |
  JSR code_1FF606                           ; $1C912E |
  BCC code_1C9141                           ; $1C9131 |
  DEC $0300,x                               ; $1C9133 |
  JSR code_1FF869                           ; $1C9136 |
  JSR code_1FF81B                           ; $1C9139 |
  LDA #$4E                                  ; $1C913C |
  JSR reset_sprite_anim                     ; $1C913E |
code_1C9141:
  RTS                                       ; $1C9141 |

code_1C9142:
  LDA $04A0,x                               ; $1C9142 |
  AND #$01                                  ; $1C9145 |
  BEQ code_1C9151                           ; $1C9147 |
  LDY #$08                                  ; $1C9149 |
  JSR code_1FF580                           ; $1C914B |
  JMP code_1C9156                           ; $1C914E |

code_1C9151:
  LDY #$09                                  ; $1C9151 |
  JSR code_1FF5C4                           ; $1C9153 |
code_1C9156:
  LDA $10                                   ; $1C9156 |
  AND #$10                                  ; $1C9158 |
  BEQ code_1C9164                           ; $1C915A |
  LDA $04A0,x                               ; $1C915C |
  EOR #$03                                  ; $1C915F |
  STA $04A0,x                               ; $1C9161 |
code_1C9164:
  RTS                                       ; $1C9164 |

  LDY #$00                                  ; $1C9165 |
  JSR code_1FF67C                           ; $1C9167 |
  BCC code_1C9186                           ; $1C916A |
  LDA $0300,x                               ; $1C916C |
  AND #$0F                                  ; $1C916F |
  BNE code_1C9187                           ; $1C9171 |
  INC $0300,x                               ; $1C9173 |
  LDA #$44                                  ; $1C9176 |
  STA $0440,x                               ; $1C9178 |
  LDA #$03                                  ; $1C917B |
  STA $0460,x                               ; $1C917D |
  JSR code_1FF869                           ; $1C9180 |
  JSR code_1FF883                           ; $1C9183 |
code_1C9186:
  RTS                                       ; $1C9186 |

code_1C9187:
  LDA $04A0,x                               ; $1C9187 |
  AND #$01                                  ; $1C918A |
  BEQ code_1C9191                           ; $1C918C |
  JMP code_1FF71D                           ; $1C918E |

code_1C9191:
  JMP code_1FF73B                           ; $1C9191 |

  LDY #$1E                                  ; $1C9194 |
  JSR code_1FF67C                           ; $1C9196 |
  LDA $05C0,x                               ; $1C9199 |
  CMP #$BC                                  ; $1C919C |
  BNE code_1C9209                           ; $1C919E |
  LDA $05E0,x                               ; $1C91A0 |
  ORA $05A0,x                               ; $1C91A3 |
  BNE code_1C9208                           ; $1C91A6 |
  JSR code_1C9286                           ; $1C91A8 |
  LDA $0540,x                               ; $1C91AB |
  BNE code_1C9209                           ; $1C91AE |
  DEC $05C0,x                               ; $1C91B0 |
  JSR code_1FFC53                           ; $1C91B3 |
  BCS code_1C9203                           ; $1C91B6 |
  LDA $0360,x                               ; $1C91B8 |
  STA $0360,y                               ; $1C91BB |
  LDA $0380,x                               ; $1C91BE |
  STA $0380,y                               ; $1C91C1 |
  LDA $03C0,x                               ; $1C91C4 |
  SBC #$17                                  ; $1C91C7 |
  STA $03C0,y                               ; $1C91C9 |
  LDA #$BD                                  ; $1C91CC |
  JSR code_1FF846                           ; $1C91CE |
  LDA #$75                                  ; $1C91D1 |
  STA $0320,y                               ; $1C91D3 |
  LDA #$C0                                  ; $1C91D6 |
  STA $0480,y                               ; $1C91D8 |
  LDA #$01                                  ; $1C91DB |
  STA $04E0,y                               ; $1C91DD |
  LDA #$80                                  ; $1C91E0 |
  STA $04C0,y                               ; $1C91E2 |
  LDA #$00                                  ; $1C91E5 |
  STA $04A0,y                               ; $1C91E7 |
  STA $0400,y                               ; $1C91EA |
  STA $0420,y                               ; $1C91ED |
  STA $0440,y                               ; $1C91F0 |
  STA $0540,y                               ; $1C91F3 |
  LDA #$FE                                  ; $1C91F6 |
  STA $0460,y                               ; $1C91F8 |
  LDA #$08                                  ; $1C91FB |
  STA $0500,y                               ; $1C91FD |
  STA $0520,y                               ; $1C9200 |
code_1C9203:
  LDA #$00                                  ; $1C9203 |
  STA $0500,x                               ; $1C9205 |
code_1C9208:
  RTS                                       ; $1C9208 |

code_1C9209:
  LDA $0300,x                               ; $1C9209 |
  AND #$0F                                  ; $1C920C |
  BNE code_1C9256                           ; $1C920E |
  LDA $04A0,x                               ; $1C9210 |
  AND #$01                                  ; $1C9213 |
  BEQ code_1C921F                           ; $1C9215 |
  LDY #$20                                  ; $1C9217 |
  JSR code_1FF580                           ; $1C9219 |
  JMP code_1C9224                           ; $1C921C |

code_1C921F:
  LDY #$21                                  ; $1C921F |
  JSR code_1FF5C4                           ; $1C9221 |
code_1C9224:
  BCC code_1C922E                           ; $1C9224 |
  LDA $04A0,x                               ; $1C9226 |
  EOR #$03                                  ; $1C9229 |
  STA $04A0,x                               ; $1C922B |
code_1C922E:
  JSR code_1FF8C2                           ; $1C922E |
  CMP #$30                                  ; $1C9231 |
  BCS code_1C9242                           ; $1C9233 |
  LDA #$3C                                  ; $1C9235 |
  STA $0520,x                               ; $1C9237 |
  INC $0300,x                               ; $1C923A |
  LDA #$C2                                  ; $1C923D |
  JMP reset_sprite_anim                     ; $1C923F |

code_1C9242:
  LDA #$CA                                  ; $1C9242 |
  STA $0480,x                               ; $1C9244 |
  INC $0500,x                               ; $1C9247 |
  LDA $0500,x                               ; $1C924A |
  CMP #$1E                                  ; $1C924D |
  BNE code_1C9285                           ; $1C924F |
  LDA #$BC                                  ; $1C9251 |
  JMP reset_sprite_anim                     ; $1C9253 |

code_1C9256:
  JSR code_1FF8B3                           ; $1C9256 |
  BCS code_1C925F                           ; $1C9259 |
  LDA #$DB                                  ; $1C925B |
  BNE code_1C9261                           ; $1C925D |
code_1C925F:
  LDA #$CA                                  ; $1C925F |
code_1C9261:
  STA $0480,x                               ; $1C9261 |
  LDA $0520,x                               ; $1C9264 |
  BEQ code_1C926E                           ; $1C9267 |
  DEC $0520,x                               ; $1C9269 |
  BNE code_1C9285                           ; $1C926C |
code_1C926E:
  JSR code_1FF8C2                           ; $1C926E |
  CMP #$30                                  ; $1C9271 |
  BCC code_1C9285                           ; $1C9273 |
  DEC $0300,x                               ; $1C9275 |
  LDA #$BB                                  ; $1C9278 |
  JSR reset_sprite_anim                     ; $1C927A |
  JSR code_1FF869                           ; $1C927D |
  LDA #$00                                  ; $1C9280 |
  STA $0500,x                               ; $1C9282 |
code_1C9285:
  RTS                                       ; $1C9285 |

code_1C9286:
  LDA #$00                                  ; $1C9286 |
  STA $00                                   ; $1C9288 |
  LDA #$80                                  ; $1C928A |
  STA $01                                   ; $1C928C |
  LDY #$1F                                  ; $1C928E |
code_1C9290:
  LDA $0300,y                               ; $1C9290 |
  BMI code_1C92AA                           ; $1C9293 |
code_1C9295:
  DEY                                       ; $1C9295 |
  CPY #$0F                                  ; $1C9296 |
  BNE code_1C9290                           ; $1C9298 |
  LDA $00                                   ; $1C929A |
  BNE code_1C92A4                           ; $1C929C |
  LDA #$00                                  ; $1C929E |
  STA $0540,x                               ; $1C92A0 |
  RTS                                       ; $1C92A3 |

code_1C92A4:
  LDA #$FF                                  ; $1C92A4 |
  STA $0540,x                               ; $1C92A6 |
  RTS                                       ; $1C92A9 |

code_1C92AA:
  LDA $01                                   ; $1C92AA |
  CMP $04C0,y                               ; $1C92AC |
  BNE code_1C9295                           ; $1C92AF |
  INC $00                                   ; $1C92B1 |
  JMP code_1C9295                           ; $1C92B3 |

  LDA $0500,x                               ; $1C92B6 |
  BNE code_1C92F5                           ; $1C92B9 |
  JSR code_1FF954                           ; $1C92BB |
  LDA $04A0,x                               ; $1C92BE |
  CLC                                       ; $1C92C1 |
  ADC $0540,x                               ; $1C92C2 |
  TAY                                       ; $1C92C5 |
  LDA $9349,y                               ; $1C92C6 |
  STA $0440,x                               ; $1C92C9 |
  LDA $9369,y                               ; $1C92CC |
  STA $0460,x                               ; $1C92CF |
  LDA $9389,y                               ; $1C92D2 |
  STA $0400,x                               ; $1C92D5 |
  LDA $93A9,y                               ; $1C92D8 |
  STA $0420,x                               ; $1C92DB |
  LDA $93C9,y                               ; $1C92DE |
  STA $05C0,x                               ; $1C92E1 |
  LDA $0580,x                               ; $1C92E4 |
  AND #$BF                                  ; $1C92E7 |
  ORA $93E9,y                               ; $1C92E9 |
  STA $0580,x                               ; $1C92EC |
  LDA $0520,x                               ; $1C92EF |
  STA $0500,x                               ; $1C92F2 |
code_1C92F5:
  DEC $0500,x                               ; $1C92F5 |
  LDA #$00                                  ; $1C92F8 |
  STA $00                                   ; $1C92FA |
  LDA $0420,x                               ; $1C92FC |
  BPL code_1C9303                           ; $1C92FF |
  DEC $00                                   ; $1C9301 |
code_1C9303:
  LDA $0340,x                               ; $1C9303 |
  CLC                                       ; $1C9306 |
  ADC $0400,x                               ; $1C9307 |
  STA $0340,x                               ; $1C930A |
  LDA $0360,x                               ; $1C930D |
  ADC $0420,x                               ; $1C9310 |
  STA $0360,x                               ; $1C9313 |
  LDA $0380,x                               ; $1C9316 |
  ADC $00                                   ; $1C9319 |
  STA $0380,x                               ; $1C931B |
  LDA #$00                                  ; $1C931E |
  STA $00                                   ; $1C9320 |
  LDA $0460,x                               ; $1C9322 |
  BPL code_1C9329                           ; $1C9325 |
  DEC $00                                   ; $1C9327 |
code_1C9329:
  LDA $03A0,x                               ; $1C9329 |
  CLC                                       ; $1C932C |
  ADC $0440,x                               ; $1C932D |
  STA $03A0,x                               ; $1C9330 |
  LDA $03C0,x                               ; $1C9333 |
  ADC $0460,x                               ; $1C9336 |
  STA $03C0,x                               ; $1C9339 |
  LDA $03E0,x                               ; $1C933C |
  ADC $00                                   ; $1C933F |
  BEQ code_1C9348                           ; $1C9341 |
  LDA #$00                                  ; $1C9343 |
  STA $0300,x                               ; $1C9345 |
code_1C9348:
  RTS                                       ; $1C9348 |

  db $00, $27, $4B, $3D, $00, $C3, $B5, $D9 ; $1C9349 |
  db $00, $D0, $B5, $C3, $00, $3D, $4B, $27 ; $1C9351 |
  db $CD, $E5, $27, $8B, $00, $75, $D9, $1B ; $1C9359 |
  db $33, $1B, $D9, $75, $00, $8B, $27, $E5 ; $1C9361 |
  db $FE, $FE, $FF, $FF, $00, $00, $00, $01 ; $1C9369 |
  db $02, $01, $00, $00, $00, $FF, $FF, $FE ; $1C9371 |
  db $FE, $FE, $FF, $FF, $00, $00, $00, $01 ; $1C9379 |
  db $01, $01, $00, $00, $00, $FF, $FF, $FE ; $1C9381 |
  db $00, $C3, $B5, $D9, $00, $D9, $B5, $C3 ; $1C9389 |
  db $00, $3D, $4B, $27, $00, $27, $4B, $3D ; $1C9391 |
  db $00, $75, $D9, $1B, $33, $1B, $D9, $75 ; $1C9399 |
  db $00, $8B, $27, $E5, $CD, $E5, $27, $8B ; $1C93A1 |
  db $00, $00, $00, $01, $02, $01, $00, $00 ; $1C93A9 |
  db $00, $FF, $FF, $FE, $FE, $FE, $FF, $FF ; $1C93B1 |
  db $00, $00, $00, $01, $01, $01, $00, $00 ; $1C93B9 |
  db $00, $FF, $FF, $FE, $FE, $FE, $FF, $FF ; $1C93C1 |
  db $BD, $BD, $BE, $BE, $BF, $BF, $C0, $C0 ; $1C93C9 |
  db $C1, $C1, $C0, $C0, $BF, $BF, $BE, $BE ; $1C93D1 |
  db $41, $41, $41, $41, $41, $41, $41, $41 ; $1C93D9 |
  db $41, $41, $41, $41, $41, $41, $41, $41 ; $1C93E1 |
  db $00, $00, $40, $40, $40, $40, $40, $40 ; $1C93E9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C93F1 |
  db $00, $00, $40, $40, $40, $40, $40, $40 ; $1C93F9 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $1C9401 |

  JSR code_1FFAE2                           ; $1C9409 |
  BCC code_1C9459                           ; $1C940C |
  LDA #$00                                  ; $1C940E |
  STA $00                                   ; $1C9410 |
  LDA $0420,x                               ; $1C9412 |
  BPL code_1C9419                           ; $1C9415 |
  DEC $00                                   ; $1C9417 |
code_1C9419:
  LDA $0340,x                               ; $1C9419 |
  CLC                                       ; $1C941C |
  ADC $0400,x                               ; $1C941D |
  STA $0340,x                               ; $1C9420 |
  LDA $0360,x                               ; $1C9423 |
  ADC $0420,x                               ; $1C9426 |
  STA $0360,x                               ; $1C9429 |
  LDA $0380,x                               ; $1C942C |
  ADC $00                                   ; $1C942F |
  STA $0380,x                               ; $1C9431 |
  LDA #$00                                  ; $1C9434 |
  STA $00                                   ; $1C9436 |
  LDA $0460,x                               ; $1C9438 |
  BPL code_1C943F                           ; $1C943B |
  DEC $00                                   ; $1C943D |
code_1C943F:
  LDA $03A0,x                               ; $1C943F |
  CLC                                       ; $1C9442 |
  ADC $0440,x                               ; $1C9443 |
  STA $03A0,x                               ; $1C9446 |
  LDA $03C0,x                               ; $1C9449 |
  ADC $0460,x                               ; $1C944C |
  STA $03C0,x                               ; $1C944F |
  LDA $03E0,x                               ; $1C9452 |
  ADC $00                                   ; $1C9455 |
  BEQ code_1C945E                           ; $1C9457 |
code_1C9459:
  LDA #$00                                  ; $1C9459 |
  STA $0300,x                               ; $1C945B |
code_1C945E:
  RTS                                       ; $1C945E |

  LDA $0300,x                               ; $1C945F |
  AND #$0F                                  ; $1C9462 |
  BNE code_1C946E                           ; $1C9464 |
  INC $0300,x                               ; $1C9466 |
  LDA #$3C                                  ; $1C9469 |
  STA $0500,x                               ; $1C946B |
code_1C946E:
  LDA $0480,x                               ; $1C946E |
  AND #$E0                                  ; $1C9471 |
  STA $0480,x                               ; $1C9473 |
  LDY $0320,x                               ; $1C9476 |
  LDA $03C0,x                               ; $1C9479 |
  PHA                                       ; $1C947C |
  CLC                                       ; $1C947D |
  ADC $94AF,y                               ; $1C947E |
  STA $03C0,x                               ; $1C9481 |
  JSR code_1C8097                           ; $1C9484 |
  LDA $04A0,x                               ; $1C9487 |
  AND #$01                                  ; $1C948A |
  BEQ code_1C9496                           ; $1C948C |
  LDY #$08                                  ; $1C948E |
  JSR code_1FF580                           ; $1C9490 |
  JMP code_1C949B                           ; $1C9493 |

code_1C9496:
  LDY #$09                                  ; $1C9496 |
  JSR code_1FF5C4                           ; $1C9498 |
code_1C949B:
  LDA $0580,x                               ; $1C949B |
  AND #$BF                                  ; $1C949E |
  STA $0580,x                               ; $1C94A0 |
  BCC code_1C94AF                           ; $1C94A3 |
  LDA $04A0,x                               ; $1C94A5 |
  EOR #$03                                  ; $1C94A8 |
  STA $04A0,x                               ; $1C94AA |
  BNE code_1C94D4                           ; $1C94AD |
code_1C94AF:
  LDY $0320,x                               ; $1C94AF |
  LDA $03C0,x                               ; $1C94B2 |
  CLC                                       ; $1C94B5 |
  ADC $94B1,y                               ; $1C94B6 |
  STA $03C0,x                               ; $1C94B9 |
  JSR code_1C8097                           ; $1C94BC |
  LDY #$08                                  ; $1C94BF |
  JSR code_1FF67C                           ; $1C94C1 |
  LDY $04A0,x                               ; $1C94C4 |
  LDA $0041,y                               ; $1C94C7 |
  BNE code_1C94D4                           ; $1C94CA |
  LDA $04A0,x                               ; $1C94CC |
  EOR #$03                                  ; $1C94CF |
  STA $04A0,x                               ; $1C94D1 |
code_1C94D4:
  LDA $0500,x                               ; $1C94D4 |
  BNE code_1C94F9                           ; $1C94D7 |
  LDA $05A0,x                               ; $1C94D9 |
  ORA $05E0,x                               ; $1C94DC |
  BNE code_1C9509                           ; $1C94DF |
  LDY $0320,x                               ; $1C94E1 |
  LDA $05C0,x                               ; $1C94E4 |
  CMP $94B3,y                               ; $1C94E7 |
  BNE code_1C94FE                           ; $1C94EA |
  SEC                                       ; $1C94EC |
  SBC #$02                                  ; $1C94ED |
  STA $05C0,x                               ; $1C94EF |
  LDA #$3C                                  ; $1C94F2 |
  STA $0500,x                               ; $1C94F4 |
  BNE code_1C9501                           ; $1C94F7 |
code_1C94F9:
  DEC $0500,x                               ; $1C94F9 |
  BNE code_1C9509                           ; $1C94FC |
code_1C94FE:
  INC $05C0,x                               ; $1C94FE |
code_1C9501:
  LDA #$00                                  ; $1C9501 |
  STA $05E0,x                               ; $1C9503 |
  STA $05A0,x                               ; $1C9506 |
code_1C9509:
  PLA                                       ; $1C9509 |
  STA $03C0,x                               ; $1C950A |
  LDY $0320,x                               ; $1C950D |
  LDA $05C0,x                               ; $1C9510 |
  CMP $94B3,y                               ; $1C9513 |
  BNE code_1C9526                           ; $1C9516 |
  LDA $0480,x                               ; $1C9518 |
  AND #$E0                                  ; $1C951B |
  ORA $94B5,y                               ; $1C951D |
  STA $0480,x                               ; $1C9520 |
  JSR code_1C8097                           ; $1C9523 |
code_1C9526:
  RTS                                       ; $1C9526 |

  db $D8, $C8, $50, $70, $C5, $E1, $16, $14 ; $1C9527 |

  LDA $0300,x                               ; $1C952F |
  AND #$0F                                  ; $1C9532 |
  BNE code_1C9540                           ; $1C9534 |
  JSR code_1FF8C2                           ; $1C9536 |
  CMP #$3C                                  ; $1C9539 |
  BCS code_1C9592                           ; $1C953B |
  INC $0300,x                               ; $1C953D |
code_1C9540:
  LDA $0520,x                               ; $1C9540 |
  BNE code_1C958F                           ; $1C9543 |
  LDA #$70                                  ; $1C9545 |
  STA $0500,x                               ; $1C9547 |
  JSR code_1C95B9                           ; $1C954A |
  BCS code_1C9592                           ; $1C954D |
  JSR code_1FFC53                           ; $1C954F |
  BCS code_1C9592                           ; $1C9552 |
  LDA #$94                                  ; $1C9554 |
  JSR code_1FF846                           ; $1C9556 |
  LDA $0360,x                               ; $1C9559 |
  STA $0360,y                               ; $1C955C |
  LDA $0380,x                               ; $1C955F |
  STA $0380,y                               ; $1C9562 |
  LDA $03C0,x                               ; $1C9565 |
  STA $03C0,y                               ; $1C9568 |
  LDA #$62                                  ; $1C956B |
  STA $0320,y                               ; $1C956D |
  LDA $0480,x                               ; $1C9570 |
  STA $0480,y                               ; $1C9573 |
  LDA #$B2                                  ; $1C9576 |
  STA $0580,y                               ; $1C9578 |
  LDA #$5B                                  ; $1C957B |
  STA $0520,x                               ; $1C957D |
  LDA #$AB                                  ; $1C9580 |
  STA $0440,y                               ; $1C9582 |
  LDA #$FF                                  ; $1C9585 |
  STA $0460,y                               ; $1C9587 |
  LDA #$08                                  ; $1C958A |
  STA $04E0,y                               ; $1C958C |
code_1C958F:
  DEC $0520,x                               ; $1C958F |
code_1C9592:
  RTS                                       ; $1C9592 |

  LDY #$1E                                  ; $1C9593 |
  JSR code_1FF67C                           ; $1C9595 |
  BCS code_1C95B0                           ; $1C9598 |
  LDA $03C0,x                               ; $1C959A |
  CMP #$70                                  ; $1C959D |
  BCC code_1C95B0                           ; $1C959F |
  LDA #$90                                  ; $1C95A1 |
  STA $0500,x                               ; $1C95A3 |
  JSR code_1C95B9                           ; $1C95A6 |
  BCC code_1C95B0                           ; $1C95A9 |
  LDA #$70                                  ; $1C95AB |
  STA $03C0,x                               ; $1C95AD |
code_1C95B0:
  LDA $0580,x                               ; $1C95B0 |
  ORA #$20                                  ; $1C95B3 |
  STA $0580,x                               ; $1C95B5 |
  RTS                                       ; $1C95B8 |

code_1C95B9:
  STX $00                                   ; $1C95B9 |
  LDY #$1F                                  ; $1C95BB |
code_1C95BD:
  CPY $00                                   ; $1C95BD |
  BEQ code_1C95DD                           ; $1C95BF |
  LDA $0300,y                               ; $1C95C1 |
  BPL code_1C95DD                           ; $1C95C4 |
  LDA $0580,y                               ; $1C95C6 |
  AND #$04                                  ; $1C95C9 |
  BNE code_1C95DD                           ; $1C95CB |
  LDA $0360,x                               ; $1C95CD |
  CMP $0360,y                               ; $1C95D0 |
  BNE code_1C95DD                           ; $1C95D3 |
  LDA $03C0,y                               ; $1C95D5 |
  CMP $0500,x                               ; $1C95D8 |
  BEQ code_1C95E3                           ; $1C95DB |
code_1C95DD:
  DEY                                       ; $1C95DD |
  CPY #$0F                                  ; $1C95DE |
  BNE code_1C95BD                           ; $1C95E0 |
  CLC                                       ; $1C95E2 |
code_1C95E3:
  RTS                                       ; $1C95E3 |

  LDA $0300,x                               ; $1C95E4 |
  AND #$0F                                  ; $1C95E7 |
  BNE code_1C95F9                           ; $1C95E9 |
  JSR code_1FF883                           ; $1C95EB |
  JSR code_1FF869                           ; $1C95EE |
  INC $0300,x                               ; $1C95F1 |
  LDA #$24                                  ; $1C95F4 |
  STA $0500,x                               ; $1C95F6 |
code_1C95F9:
  LDA $0520,x                               ; $1C95F9 |
  BNE code_1C9643                           ; $1C95FC |
  LDA $0500,x                               ; $1C95FE |
  BNE code_1C963F                           ; $1C9601 |
  LDA $04A0,x                               ; $1C9603 |
  AND #$02                                  ; $1C9606 |
  BNE code_1C9617                           ; $1C9608 |
  JSR code_1FF8D9                           ; $1C960A |
  SEC                                       ; $1C960D |
  SBC #$01                                  ; $1C960E |
  CMP #$07                                  ; $1C9610 |
  BCS code_1C9639                           ; $1C9612 |
  JMP code_1C9621                           ; $1C9614 |

code_1C9617:
  JSR code_1FF8D9                           ; $1C9617 |
  SEC                                       ; $1C961A |
  SBC #$09                                  ; $1C961B |
  CMP #$07                                  ; $1C961D |
  BCS code_1C9639                           ; $1C961F |
code_1C9621:
  LDA $05C0,x                               ; $1C9621 |
  CMP #$D1                                  ; $1C9624 |
  BNE code_1C962C                           ; $1C9626 |
  LDA #$D2                                  ; $1C9628 |
  BNE code_1C962E                           ; $1C962A |
code_1C962C:
  LDA #$D5                                  ; $1C962C |
code_1C962E:
  JSR reset_sprite_anim                     ; $1C962E |
  JSR code_1C9659                           ; $1C9631 |
  LDA #$10                                  ; $1C9634 |
  STA $0520,x                               ; $1C9636 |
code_1C9639:
  LDA #$78                                  ; $1C9639 |
  STA $0500,x                               ; $1C963B |
  RTS                                       ; $1C963E |

code_1C963F:
  DEC $0500,x                               ; $1C963F |
  RTS                                       ; $1C9642 |

code_1C9643:
  DEC $0520,x                               ; $1C9643 |
  BNE code_1C9658                           ; $1C9646 |
  LDA $05C0,x                               ; $1C9648 |
  CMP #$D2                                  ; $1C964B |
  BNE code_1C9653                           ; $1C964D |
  LDA #$D1                                  ; $1C964F |
  BNE code_1C9655                           ; $1C9651 |
code_1C9653:
  LDA #$D4                                  ; $1C9653 |
code_1C9655:
  JSR reset_sprite_anim                     ; $1C9655 |
code_1C9658:
  RTS                                       ; $1C9658 |

code_1C9659:
  JSR code_1FFC53                           ; $1C9659 |
  BCS code_1C96C0                           ; $1C965C |
  STY $00                                   ; $1C965E |
  LDA $04A0,x                               ; $1C9660 |
  STA $04A0,y                               ; $1C9663 |
  AND #$02                                  ; $1C9666 |
  TAY                                       ; $1C9668 |
  LDA $0360,x                               ; $1C9669 |
  CLC                                       ; $1C966C |
  ADC $96C1,y                               ; $1C966D |
  PHA                                       ; $1C9670 |
  LDA $0380,x                               ; $1C9671 |
  ADC $96C2,y                               ; $1C9674 |
  LDY $00                                   ; $1C9677 |
  STA $0380,y                               ; $1C9679 |
  PLA                                       ; $1C967C |
  STA $0360,y                               ; $1C967D |
  LDA #$00                                  ; $1C9680 |
  STA $04E0,y                               ; $1C9682 |
  LDA $03C0,x                               ; $1C9685 |
  STA $03C0,y                               ; $1C9688 |
  LDA $03E0,x                               ; $1C968B |
  STA $03E0,y                               ; $1C968E |
  LDA #$66                                  ; $1C9691 |
  STA $0400,y                               ; $1C9693 |
  STA $02                                   ; $1C9696 |
  LDA #$03                                  ; $1C9698 |
  STA $0420,y                               ; $1C969A |
  STA $03                                   ; $1C969D |
  STY $0F                                   ; $1C969F |
  STX $0E                                   ; $1C96A1 |
  LDX $0F                                   ; $1C96A3 |
  JSR code_1FFC63                           ; $1C96A5 |
  LDY $0F                                   ; $1C96A8 |
  LDX $0E                                   ; $1C96AA |
  LDA $0C                                   ; $1C96AC |
  STA $04A0,y                               ; $1C96AE |
  LDA #$73                                  ; $1C96B1 |
  JSR code_1FF846                           ; $1C96B3 |
  LDA #$8F                                  ; $1C96B6 |
  STA $0320,y                               ; $1C96B8 |
  LDA #$8B                                  ; $1C96BB |
  STA $0480,y                               ; $1C96BD |
code_1C96C0:
  RTS                                       ; $1C96C0 |

  db $04, $00, $FC, $FF                     ; $1C96C1 |

  LDA $0300,x                               ; $1C96C5 |
  AND #$0F                                  ; $1C96C8 |
  BNE code_1C96E5                           ; $1C96CA |
  JSR code_1FF8C2                           ; $1C96CC |
  CMP #$51                                  ; $1C96CF |
  BCS code_1C9716                           ; $1C96D1 |
  JSR code_1FF869                           ; $1C96D3 |
  JSR code_1FF883                           ; $1C96D6 |
  LDA $0580,x                               ; $1C96D9 |
  AND #$FB                                  ; $1C96DC |
  STA $0580,x                               ; $1C96DE |
  INC $0300,x                               ; $1C96E1 |
  RTS                                       ; $1C96E4 |

code_1C96E5:
  LDA $0500,x                               ; $1C96E5 |
  BEQ code_1C9717                           ; $1C96E8 |
  DEC $0500,x                               ; $1C96EA |
  LDA $0300,x                               ; $1C96ED |
  AND #$01                                  ; $1C96F0 |
  BNE code_1C9716                           ; $1C96F2 |
  LDA $0460,x                               ; $1C96F4 |
  BMI code_1C96FD                           ; $1C96F7 |
  CMP #$02                                  ; $1C96F9 |
  BCS code_1C9716                           ; $1C96FB |
code_1C96FD:
  LDA $0440,x                               ; $1C96FD |
  CLC                                       ; $1C9700 |
  ADC #$10                                  ; $1C9701 |
  STA $0440,x                               ; $1C9703 |
  LDA $0460,x                               ; $1C9706 |
  ADC #$00                                  ; $1C9709 |
  STA $0460,x                               ; $1C970B |
  BPL code_1C9713                           ; $1C970E |
  JMP code_1FF7A8                           ; $1C9710 |

code_1C9713:
  JMP code_1FF7C8                           ; $1C9713 |

code_1C9716:
  RTS                                       ; $1C9716 |

code_1C9717:
  LDA $0300,x                               ; $1C9717 |
  AND #$0F                                  ; $1C971A |
  CMP #$04                                  ; $1C971C |
  BEQ code_1C9776                           ; $1C971E |
  CMP #$03                                  ; $1C9720 |
  BEQ code_1C9767                           ; $1C9722 |
  CMP #$02                                  ; $1C9724 |
  BEQ code_1C9745                           ; $1C9726 |
  JSR code_1FF8B3                           ; $1C9728 |
  BCC code_1C9734                           ; $1C972B |
  CMP #$4D                                  ; $1C972D |
  BCC code_1C9734                           ; $1C972F |
  JMP code_1FF797                           ; $1C9731 |

code_1C9734:
  LDA #$14                                  ; $1C9734 |
  STA $0500,x                               ; $1C9736 |
  INC $0300,x                               ; $1C9739 |
  JSR code_1FF81B                           ; $1C973C |
  JSR code_1FF869                           ; $1C973F |
  JMP code_1FF883                           ; $1C9742 |

code_1C9745:
  LDA $04A0,x                               ; $1C9745 |
  AND #$02                                  ; $1C9748 |
  BEQ code_1C9758                           ; $1C974A |
  JSR code_1FF8C2                           ; $1C974C |
  BCC code_1C9755                           ; $1C974F |
  CMP #$29                                  ; $1C9751 |
  BCS code_1C9764                           ; $1C9753 |
code_1C9755:
  JMP code_1FF73B                           ; $1C9755 |

code_1C9758:
  JSR code_1FF8C2                           ; $1C9758 |
  BCS code_1C9761                           ; $1C975B |
  CMP #$29                                  ; $1C975D |
  BCS code_1C9764                           ; $1C975F |
code_1C9761:
  JMP code_1FF71D                           ; $1C9761 |

code_1C9764:
  JMP code_1C9734                           ; $1C9764 |

code_1C9767:
  JSR code_1FF8B3                           ; $1C9767 |
  BCC code_1C9734                           ; $1C976A |
  CMP #$09                                  ; $1C976C |
  BCC code_1C9773                           ; $1C976E |
  JMP code_1FF797                           ; $1C9770 |

code_1C9773:
  JMP code_1C9734                           ; $1C9773 |

code_1C9776:
  LDA $04A0,x                               ; $1C9776 |
  AND #$02                                  ; $1C9779 |
  BEQ code_1C9780                           ; $1C977B |
  JMP code_1FF73B                           ; $1C977D |

code_1C9780:
  JMP code_1FF71D                           ; $1C9780 |

  LDA $0500,x                               ; $1C9783 |
  BEQ code_1C978D                           ; $1C9786 |
  DEC $0500,x                               ; $1C9788 |
  BNE code_1C97B3                           ; $1C978B |
code_1C978D:
  LDA $0300,x                               ; $1C978D |
  AND #$0F                                  ; $1C9790 |
  BNE code_1C97D1                           ; $1C9792 |
  JSR code_1FF869                           ; $1C9794 |
  JSR code_1FF883                           ; $1C9797 |
  LDA $05A0,x                               ; $1C979A |
  BNE code_1C97B9                           ; $1C979D |
  LDA $05E0,x                               ; $1C979F |
  CMP #$01                                  ; $1C97A2 |
  BNE code_1C97B9                           ; $1C97A4 |
  JSR code_1FF8C2                           ; $1C97A6 |
  CMP #$41                                  ; $1C97A9 |
  BCS code_1C97B3                           ; $1C97AB |
  LDA #$C3                                  ; $1C97AD |
  STA $0480,x                               ; $1C97AF |
  RTS                                       ; $1C97B2 |

code_1C97B3:
  LDA #$00                                  ; $1C97B3 |
  STA $05E0,x                               ; $1C97B5 |
  RTS                                       ; $1C97B8 |

code_1C97B9:
  LDA $05A0,x                               ; $1C97B9 |
  CMP #$02                                  ; $1C97BC |
  BNE code_1C97D0                           ; $1C97BE |
  JSR code_1C981D                           ; $1C97C0 |
  INC $0300,x                               ; $1C97C3 |
  LDA #$13                                  ; $1C97C6 |
  STA $0520,x                               ; $1C97C8 |
  LDA #$3C                                  ; $1C97CB |
  STA $0500,x                               ; $1C97CD |
code_1C97D0:
  RTS                                       ; $1C97D0 |

code_1C97D1:
  LDA #$1D                                  ; $1C97D1 |
  CMP $05C0,x                               ; $1C97D3 |
  BEQ code_1C97DB                           ; $1C97D6 |
  JSR reset_sprite_anim                     ; $1C97D8 |
code_1C97DB:
  LDY #$00                                  ; $1C97DB |
  JSR code_1FF67C                           ; $1C97DD |
  BCC code_1C97D0                           ; $1C97E0 |
  LDA $0520,x                               ; $1C97E2 |
  BEQ code_1C97FB                           ; $1C97E5 |
  DEC $0520,x                               ; $1C97E7 |
  LDA $04A0,x                               ; $1C97EA |
  AND #$01                                  ; $1C97ED |
  BEQ code_1C97F6                           ; $1C97EF |
  LDY #$00                                  ; $1C97F1 |
  JMP code_1FF580                           ; $1C97F3 |

code_1C97F6:
  LDY #$01                                  ; $1C97F6 |
  JMP code_1FF5C4                           ; $1C97F8 |

code_1C97FB:
  LDA #$1C                                  ; $1C97FB |
  JSR reset_sprite_anim                     ; $1C97FD |
  LDA $0300,x                               ; $1C9800 |
  AND #$F0                                  ; $1C9803 |
  STA $0300,x                               ; $1C9805 |
  LDA #$A3                                  ; $1C9808 |
  STA $0480,x                               ; $1C980A |
  LDA $E5                                   ; $1C980D |
  ADC $E6                                   ; $1C980F |
  STA $E6                                   ; $1C9811 |
  AND #$03                                  ; $1C9813 |
  TAY                                       ; $1C9815 |
  LDA $9881,y                               ; $1C9816 |
  STA $0500,x                               ; $1C9819 |
  RTS                                       ; $1C981C |

code_1C981D:
  STX $00                                   ; $1C981D |
  LDA #$02                                  ; $1C981F |
  STA $01                                   ; $1C9821 |
code_1C9823:
  JSR code_1FFC53                           ; $1C9823 |
  BCS code_1C9872                           ; $1C9826 |
  LDX $01                                   ; $1C9828 |
  LDA $9875,x                               ; $1C982A |
  STA $0400,y                               ; $1C982D |
  LDA $9878,x                               ; $1C9830 |
  STA $0420,y                               ; $1C9833 |
  LDA $987B,x                               ; $1C9836 |
  STA $0440,y                               ; $1C9839 |
  LDA $987E,x                               ; $1C983C |
  STA $0460,y                               ; $1C983F |
  LDA #$73                                  ; $1C9842 |
  JSR code_1FF846                           ; $1C9844 |
  LDA #$8B                                  ; $1C9847 |
  STA $0480,y                               ; $1C9849 |
  LDX $00                                   ; $1C984C |
  LDA #$0F                                  ; $1C984E |
  STA $0320,y                               ; $1C9850 |
  LDA $0360,x                               ; $1C9853 |
  STA $0360,y                               ; $1C9856 |
  LDA $0380,x                               ; $1C9859 |
  STA $0380,y                               ; $1C985C |
  LDA $03C0,x                               ; $1C985F |
  CLC                                       ; $1C9862 |
  ADC #$04                                  ; $1C9863 |
  STA $03C0,y                               ; $1C9865 |
  LDA $04A0,x                               ; $1C9868 |
  STA $04A0,y                               ; $1C986B |
  DEC $01                                   ; $1C986E |
  BPL code_1C9823                           ; $1C9870 |
code_1C9872:
  LDX $00                                   ; $1C9872 |
  RTS                                       ; $1C9874 |

  db $FB, $33, $FB, $00, $01, $00, $50, $00 ; $1C9875 |
  db $B0, $FF, $00, $00, $1E, $3C, $96, $3C ; $1C987D |

  LDA #$00                                  ; $1C9885 |
  STA $00                                   ; $1C9887 |
  LDA $0460,x                               ; $1C9889 |
  BPL code_1C9890                           ; $1C988C |
  DEC $00                                   ; $1C988E |
code_1C9890:
  LDA $03A0,x                               ; $1C9890 |
  CLC                                       ; $1C9893 |
  ADC $0440,x                               ; $1C9894 |
  STA $03A0,x                               ; $1C9897 |
  LDA $03C0,x                               ; $1C989A |
  ADC $0460,x                               ; $1C989D |
  STA $03C0,x                               ; $1C98A0 |
  LDA $03E0,x                               ; $1C98A3 |
  ADC $00                                   ; $1C98A6 |
  BNE code_1C98AD                           ; $1C98A8 |
  JMP code_1C9776                           ; $1C98AA |

code_1C98AD:
  LDA #$00                                  ; $1C98AD |
  STA $0300,x                               ; $1C98AF |
  RTS                                       ; $1C98B2 |

  LDA $0500,x                               ; $1C98B3 |
  BEQ code_1C98BD                           ; $1C98B6 |
  DEC $0500,x                               ; $1C98B8 |
  BNE code_1C98D0                           ; $1C98BB |
code_1C98BD:
  LDA $05A0,x                               ; $1C98BD |
  BNE code_1C98DB                           ; $1C98C0 |
  LDA $05E0,x                               ; $1C98C2 |
  CMP #$01                                  ; $1C98C5 |
  BNE code_1C98DB                           ; $1C98C7 |
  JSR code_1FF8C2                           ; $1C98C9 |
  CMP #$51                                  ; $1C98CC |
  BCC code_1C98D6                           ; $1C98CE |
code_1C98D0:
  LDA #$00                                  ; $1C98D0 |
  STA $05E0,x                               ; $1C98D2 |
  RTS                                       ; $1C98D5 |

code_1C98D6:
  LDA #$C9                                  ; $1C98D6 |
  STA $0480,x                               ; $1C98D8 |
code_1C98DB:
  JSR code_1FF869                           ; $1C98DB |
  JSR code_1FF883                           ; $1C98DE |
  LDA $05A0,x                               ; $1C98E1 |
  ORA $05E0,x                               ; $1C98E4 |
  BNE code_1C98FE                           ; $1C98E7 |
  LDA $E4                                   ; $1C98E9 |
  ADC $E7                                   ; $1C98EB |
  STA $E7                                   ; $1C98ED |
  AND #$01                                  ; $1C98EF |
  TAY                                       ; $1C98F1 |
  LDA $9995,y                               ; $1C98F2 |
  STA $0500,x                               ; $1C98F5 |
  LDA #$A9                                  ; $1C98F8 |
  STA $0480,x                               ; $1C98FA |
code_1C98FD:
  RTS                                       ; $1C98FD |

code_1C98FE:
  LDA $05E0,x                               ; $1C98FE |
  BNE code_1C98FD                           ; $1C9901 |
  LDA $05A0,x                               ; $1C9903 |
  CMP #$09                                  ; $1C9906 |
  BEQ code_1C990F                           ; $1C9908 |
  CMP #$12                                  ; $1C990A |
  BEQ code_1C990F                           ; $1C990C |
  RTS                                       ; $1C990E |

code_1C990F:
  JSR code_1FFC53                           ; $1C990F |
  BCS code_1C98FD                           ; $1C9912 |
  LDA #$00                                  ; $1C9914 |
  STA $0440,y                               ; $1C9916 |
  LDA #$04                                  ; $1C9919 |
  STA $0460,y                               ; $1C991B |
  LDA #$6F                                  ; $1C991E |
  JSR code_1FF846                           ; $1C9920 |
  LDA #$1E                                  ; $1C9923 |
  JSR code_1FF89A                           ; $1C9925 |
  LDA #$C0                                  ; $1C9928 |
  STA $0480,y                               ; $1C992A |
  LDA #$13                                  ; $1C992D |
  STA $0320,y                               ; $1C992F |
  LDA $0360,x                               ; $1C9932 |
  STA $0360,y                               ; $1C9935 |
  LDA $0380,x                               ; $1C9938 |
  STA $0380,y                               ; $1C993B |
  LDA $03C0,x                               ; $1C993E |
  SEC                                       ; $1C9941 |
  SBC #$0C                                  ; $1C9942 |
  STA $03C0,y                               ; $1C9944 |
  LDA $03E0,x                               ; $1C9947 |
  STA $03E0,y                               ; $1C994A |
  LDA $04A0,x                               ; $1C994D |
  STA $04A0,y                               ; $1C9950 |
  PHA                                       ; $1C9953 |
  JSR code_1FF8C2                           ; $1C9954 |
  STX $00                                   ; $1C9957 |
  LDX #$03                                  ; $1C9959 |
code_1C995B:
  CMP $9989,x                               ; $1C995B |
  BCC code_1C9963                           ; $1C995E |
  DEX                                       ; $1C9960 |
  BNE code_1C995B                           ; $1C9961 |
code_1C9963:
  LDA $998D,x                               ; $1C9963 |
  STA $0400,y                               ; $1C9966 |
  LDA $9991,x                               ; $1C9969 |
  STA $0420,y                               ; $1C996C |
  PLA                                       ; $1C996F |
  AND #$02                                  ; $1C9970 |
  TAX                                       ; $1C9972 |
  LDA $0360,y                               ; $1C9973 |
  CLC                                       ; $1C9976 |
  ADC $9997,x                               ; $1C9977 |
  STA $0360,y                               ; $1C997A |
  LDA $0380,y                               ; $1C997D |
  ADC $9998,x                               ; $1C9980 |
  STA $0380,y                               ; $1C9983 |
  LDX $00                                   ; $1C9986 |
  RTS                                       ; $1C9988 |

  db $4C, $3D, $2E, $1F, $00, $80, $00, $80 ; $1C9989 |
  db $02, $01, $01, $00, $3C, $78, $0C, $00 ; $1C9991 |
  db $F4, $FF                               ; $1C9999 |

  LDY #$08                                  ; $1C999B |
  JSR code_1FF67C                           ; $1C999D |
  BCS code_1C99B9                           ; $1C99A0 |
  LDA $04A0,x                               ; $1C99A2 |
  AND #$02                                  ; $1C99A5 |
  BEQ code_1C99B1                           ; $1C99A7 |
  LDY #$07                                  ; $1C99A9 |
  JSR code_1FF5C4                           ; $1C99AB |
  JMP code_1C99B6                           ; $1C99AE |

code_1C99B1:
  LDY #$08                                  ; $1C99B1 |
  JSR code_1FF580                           ; $1C99B3 |
code_1C99B6:
  BCS code_1C99B9                           ; $1C99B6 |
  RTS                                       ; $1C99B8 |

code_1C99B9:
  LDA #$00                                  ; $1C99B9 |
  STA $0320,x                               ; $1C99BB |
  LDA #$71                                  ; $1C99BE |
  JMP reset_sprite_anim                     ; $1C99C0 |

  LDA $0300,x                               ; $1C99C3 |
  AND #$0F                                  ; $1C99C6 |
  CMP #$01                                  ; $1C99C8 |
  BEQ code_1C9A1E                           ; $1C99CA |
  CMP #$02                                  ; $1C99CC |
  BEQ code_1C9A32                           ; $1C99CE |
  CMP #$03                                  ; $1C99D0 |
  BNE code_1C99D7                           ; $1C99D2 |
  JMP code_1C9776                           ; $1C99D4 |

code_1C99D7:
  JSR code_1FF869                           ; $1C99D7 |
  JSR code_1FF883                           ; $1C99DA |
  LDA $05C0,x                               ; $1C99DD |
  CMP #$1F                                  ; $1C99E0 |
  BEQ code_1C9A0E                           ; $1C99E2 |
  LDA $05A0,x                               ; $1C99E4 |
  BNE code_1C99FB                           ; $1C99E7 |
  JSR code_1FF8C2                           ; $1C99E9 |
  CMP #$61                                  ; $1C99EC |
  BCS code_1C9A18                           ; $1C99EE |
  LDA #$C3                                  ; $1C99F0 |
  STA $0480,x                               ; $1C99F2 |
  INC $05A0,x                               ; $1C99F5 |
  LDA $05A0,x                               ; $1C99F8 |
code_1C99FB:
  CMP #$05                                  ; $1C99FB |
  BNE code_1C9A1D                           ; $1C99FD |
  LDA #$00                                  ; $1C99FF |
  STA $0440,x                               ; $1C9A01 |
  LDA #$02                                  ; $1C9A04 |
  STA $0460,x                               ; $1C9A06 |
  LDA #$1F                                  ; $1C9A09 |
  JMP reset_sprite_anim                     ; $1C9A0B |

code_1C9A0E:
  JSR code_1FF8B3                           ; $1C9A0E |
  CMP #$49                                  ; $1C9A11 |
  BCS code_1C9A4B                           ; $1C9A13 |
  JMP code_1FF779                           ; $1C9A15 |

code_1C9A18:
  LDA #$00                                  ; $1C9A18 |
  STA $05E0,x                               ; $1C9A1A |
code_1C9A1D:
  RTS                                       ; $1C9A1D |

code_1C9A1E:
  JSR code_1FF8C2                           ; $1C9A1E |
  LDA $04A0,x                               ; $1C9A21 |
  AND #$02                                  ; $1C9A24 |
  BEQ code_1C9A2D                           ; $1C9A26 |
  BCS code_1C9A4F                           ; $1C9A28 |
  JMP code_1C9776                           ; $1C9A2A |

code_1C9A2D:
  BCC code_1C9A4F                           ; $1C9A2D |
  JMP code_1C9776                           ; $1C9A2F |

code_1C9A32:
  JSR code_1FF869                           ; $1C9A32 |
  JSR code_1FF883                           ; $1C9A35 |
  LDA $0500,x                               ; $1C9A38 |
  BEQ code_1C9A41                           ; $1C9A3B |
  DEC $0500,x                               ; $1C9A3D |
  RTS                                       ; $1C9A40 |

code_1C9A41:
  JSR code_1FF8B3                           ; $1C9A41 |
  CMP #$04                                  ; $1C9A44 |
  BCC code_1C9A4B                           ; $1C9A46 |
  JMP code_1FF759                           ; $1C9A48 |

code_1C9A4B:
  INC $0300,x                               ; $1C9A4B |
  RTS                                       ; $1C9A4E |

code_1C9A4F:
  STX $00                                   ; $1C9A4F |
  LDA #$02                                  ; $1C9A51 |
  STA $01                                   ; $1C9A53 |
code_1C9A55:
  JSR code_1FFC53                           ; $1C9A55 |
  BCS code_1C9AA1                           ; $1C9A58 |
  LDX $01                                   ; $1C9A5A |
  LDA $9AAC,x                               ; $1C9A5C |
  STA $0400,y                               ; $1C9A5F |
  LDA $9AAF,x                               ; $1C9A62 |
  STA $0420,y                               ; $1C9A65 |
  LDA $9AB2,x                               ; $1C9A68 |
  STA $0440,y                               ; $1C9A6B |
  LDA $9AB5,x                               ; $1C9A6E |
  STA $0460,y                               ; $1C9A71 |
  LDA $9AB8,x                               ; $1C9A74 |
  STA $04A0,y                               ; $1C9A77 |
  LDA #$73                                  ; $1C9A7A |
  JSR code_1FF846                           ; $1C9A7C |
  LDA #$8B                                  ; $1C9A7F |
  STA $0480,y                               ; $1C9A81 |
  LDX $00                                   ; $1C9A84 |
  LDA #$0F                                  ; $1C9A86 |
  STA $0320,y                               ; $1C9A88 |
  LDA $0360,x                               ; $1C9A8B |
  STA $0360,y                               ; $1C9A8E |
  LDA $0380,x                               ; $1C9A91 |
  STA $0380,y                               ; $1C9A94 |
  LDA $03C0,x                               ; $1C9A97 |
  STA $03C0,y                               ; $1C9A9A |
  DEC $01                                   ; $1C9A9D |
  BPL code_1C9A55                           ; $1C9A9F |
code_1C9AA1:
  LDX $00                                   ; $1C9AA1 |
  INC $0300,x                               ; $1C9AA3 |
  LDA #$3C                                  ; $1C9AA6 |
  STA $0500,x                               ; $1C9AA8 |
  RTS                                       ; $1C9AAB |

  db $DB, $00, $DB, $00, $00, $00, $DB, $33 ; $1C9AAC |
  db $DB, $00, $01, $00, $02, $01, $01      ; $1C9AB4 |

  LDA $04A0,x                               ; $1C9ABB |
  AND #$01                                  ; $1C9ABE |
  BEQ code_1C9AC8                           ; $1C9AC0 |
  JSR code_1FF71D                           ; $1C9AC2 |
  JMP code_1C9ACB                           ; $1C9AC5 |

code_1C9AC8:
  JSR code_1FF73B                           ; $1C9AC8 |
code_1C9ACB:
  JSR code_1FF8B3                           ; $1C9ACB |
  BCC code_1C9B2B                           ; $1C9ACE |
  JSR code_1FF8C2                           ; $1C9AD0 |
  CMP #$10                                  ; $1C9AD3 |
  BCS code_1C9B2B                           ; $1C9AD5 |
  LDA $30                                   ; $1C9AD7 |
  CMP #$02                                  ; $1C9AD9 |
  BCS code_1C9B08                           ; $1C9ADB |
  LDA #$05                                  ; $1C9ADD |
  STA $30                                   ; $1C9ADF |
  STX $34                                   ; $1C9AE1 |
  LDA #$07                                  ; $1C9AE3 |
  STA $05C0                                 ; $1C9AE5 |
  LDA #$00                                  ; $1C9AE8 |
  STA $05E0                                 ; $1C9AEA |
  STA $05A0                                 ; $1C9AED |
  STA $32                                   ; $1C9AF0 |
  LDA $03C0                                 ; $1C9AF2 |
  STA $0500,x                               ; $1C9AF5 |
  LDA $0460                                 ; $1C9AF8 |
  BPL code_1C9B43                           ; $1C9AFB |
  LDA #$55                                  ; $1C9AFD |
  STA $0440                                 ; $1C9AFF |
  LDA #$00                                  ; $1C9B02 |
  STA $0460                                 ; $1C9B04 |
  RTS                                       ; $1C9B07 |

code_1C9B08:
  LDA $30                                   ; $1C9B08 |
  CMP #$05                                  ; $1C9B0A |
  BNE code_1C9B43                           ; $1C9B0C |
  CPX $34                                   ; $1C9B0E |
  BNE code_1C9B43                           ; $1C9B10 |
  LDA $0500,x                               ; $1C9B12 |
  SEC                                       ; $1C9B15 |
  SBC $03C0                                 ; $1C9B16 |
  CMP #$20                                  ; $1C9B19 |
  BCC code_1C9B43                           ; $1C9B1B |
  LDA #$00                                  ; $1C9B1D |
  STA $0440                                 ; $1C9B1F |
  STA $0460                                 ; $1C9B22 |
  LDA $04A0,x                               ; $1C9B25 |
  STA $35                                   ; $1C9B28 |
  RTS                                       ; $1C9B2A |

code_1C9B2B:
  LDA $30                                   ; $1C9B2B |
  CMP #$05                                  ; $1C9B2D |
  BNE code_1C9B43                           ; $1C9B2F |
  CPX $34                                   ; $1C9B31 |
  BNE code_1C9B43                           ; $1C9B33 |
  LDA #$AB                                  ; $1C9B35 |
  STA $0440                                 ; $1C9B37 |
  LDA #$FF                                  ; $1C9B3A |
  STA $0460                                 ; $1C9B3C |
  LDA #$00                                  ; $1C9B3F |
  STA $30                                   ; $1C9B41 |
code_1C9B43:
  RTS                                       ; $1C9B43 |

  LDA $0300,x                               ; $1C9B44 |
  AND #$0F                                  ; $1C9B47 |
  BNE code_1C9B58                           ; $1C9B49 |
  JSR code_1FF8C2                           ; $1C9B4B |
  CMP #$76                                  ; $1C9B4E |
  BCS code_1C9B43                           ; $1C9B50 |
  INC $0300,x                               ; $1C9B52 |
  JSR code_1FF883                           ; $1C9B55 |
code_1C9B58:
  LDA $0580,x                               ; $1C9B58 |
  AND #$04                                  ; $1C9B5B |
  BEQ code_1C9B67                           ; $1C9B5D |
  LDA $0580,x                               ; $1C9B5F |
  EOR #$04                                  ; $1C9B62 |
  STA $0580,x                               ; $1C9B64 |
code_1C9B67:
  LDA $0300,x                               ; $1C9B67 |
  AND #$02                                  ; $1C9B6A |
  BNE code_1C9B78                           ; $1C9B6C |
  LDY #$24                                  ; $1C9B6E |
  JSR code_1FF67C                           ; $1C9B70 |
  BCC code_1C9BE1                           ; $1C9B73 |
  INC $0300,x                               ; $1C9B75 |
code_1C9B78:
  LDA $04A0,x                               ; $1C9B78 |
  PHA                                       ; $1C9B7B |
  JSR code_1FF869                           ; $1C9B7C |
  PLA                                       ; $1C9B7F |
  CMP $04A0,x                               ; $1C9B80 |
  BEQ code_1C9B8D                           ; $1C9B83 |
  LDA $0580,x                               ; $1C9B85 |
  EOR #$40                                  ; $1C9B88 |
  STA $0580,x                               ; $1C9B8A |
code_1C9B8D:
  LDA $0520,x                               ; $1C9B8D |
  BNE code_1C9BA6                           ; $1C9B90 |
  JSR code_1C9BE2                           ; $1C9B92 |
  STY $00                                   ; $1C9B95 |
  LDA $00                                   ; $1C9B97 |
  STA $0500,x                               ; $1C9B99 |
  LDA #$78                                  ; $1C9B9C |
  STA $0520,x                               ; $1C9B9E |
  LDA #$00                                  ; $1C9BA1 |
  STA $0540,x                               ; $1C9BA3 |
code_1C9BA6:
  LDA $0540,x                               ; $1C9BA6 |
  BNE code_1C9BD1                           ; $1C9BA9 |
  LDA $0500,x                               ; $1C9BAB |
  TAY                                       ; $1C9BAE |
  LDA $03C0,y                               ; $1C9BAF |
  SEC                                       ; $1C9BB2 |
  SBC $03C0,x                               ; $1C9BB3 |
  BCS code_1C9BBD                           ; $1C9BB6 |
  EOR #$FF                                  ; $1C9BB8 |
  ADC #$01                                  ; $1C9BBA |
  CLC                                       ; $1C9BBC |
code_1C9BBD:
  CMP #$30                                  ; $1C9BBD |
  BCS code_1C9BE1                           ; $1C9BBF |
  LDA $05C0,x                               ; $1C9BC1 |
  CMP #$39                                  ; $1C9BC4 |
  BEQ code_1C9BD1                           ; $1C9BC6 |
  LDA #$39                                  ; $1C9BC8 |
  JSR reset_sprite_anim                     ; $1C9BCA |
  INC $0540,x                               ; $1C9BCD |
  RTS                                       ; $1C9BD0 |

code_1C9BD1:
  DEC $0520,x                               ; $1C9BD1 |
  LDA $05E0,x                               ; $1C9BD4 |
  ORA $05A0,x                               ; $1C9BD7 |
  BNE code_1C9BE1                           ; $1C9BDA |
  LDA #$38                                  ; $1C9BDC |
  JSR reset_sprite_anim                     ; $1C9BDE |
code_1C9BE1:
  RTS                                       ; $1C9BE1 |

code_1C9BE2:
  JSR code_1FFC53                           ; $1C9BE2 |
  BCS code_1C9C18                           ; $1C9BE5 |
  LDA $04A0,x                               ; $1C9BE7 |
  STA $04A0,y                               ; $1C9BEA |
  LDA $0360,x                               ; $1C9BED |
  STA $0360,y                               ; $1C9BF0 |
  LDA $0380,x                               ; $1C9BF3 |
  STA $0380,y                               ; $1C9BF6 |
  LDA #$04                                  ; $1C9BF9 |
  STA $03C0,y                               ; $1C9BFB |
  LDA $03C0,x                               ; $1C9BFE |
  STA $0500,y                               ; $1C9C01 |
  LDA #$94                                  ; $1C9C04 |
  JSR code_1FF846                           ; $1C9C06 |
  LDA #$CA                                  ; $1C9C09 |
  STA $0480,y                               ; $1C9C0B |
  LDA #$24                                  ; $1C9C0E |
  STA $0320,y                               ; $1C9C10 |
  LDA #$08                                  ; $1C9C13 |
  STA $04E0,y                               ; $1C9C15 |
code_1C9C18:
  RTS                                       ; $1C9C18 |

  LDA $0300,x                               ; $1C9C19 |
  AND #$0F                                  ; $1C9C1C |
  BNE code_1C9C2B                           ; $1C9C1E |
  STA $0440,x                               ; $1C9C20 |
  LDA #$04                                  ; $1C9C23 |
  STA $0460,x                               ; $1C9C25 |
  INC $0300,x                               ; $1C9C28 |
code_1C9C2B:
  JSR code_1FF759                           ; $1C9C2B |
  LDA $03C0,x                               ; $1C9C2E |
  SEC                                       ; $1C9C31 |
  SBC $0500,x                               ; $1C9C32 |
  BCS code_1C9C3C                           ; $1C9C35 |
  EOR #$FF                                  ; $1C9C37 |
  ADC #$01                                  ; $1C9C39 |
  CLC                                       ; $1C9C3B |
code_1C9C3C:
  CMP #$20                                  ; $1C9C3C |
  BCS code_1C9C55                           ; $1C9C3E |
  LDA #$80                                  ; $1C9C40 |
  STA $02                                   ; $1C9C42 |
  LDA #$04                                  ; $1C9C44 |
  STA $03                                   ; $1C9C46 |
  JSR code_1FFC63                           ; $1C9C48 |
  LDA $0C                                   ; $1C9C4B |
  STA $04A0,x                               ; $1C9C4D |
  LDA #$0B                                  ; $1C9C50 |
  STA $0320,x                               ; $1C9C52 |
code_1C9C55:
  RTS                                       ; $1C9C55 |

  LDA $0300,x                               ; $1C9C56 |
  AND #$0F                                  ; $1C9C59 |
  BNE code_1C9C73                           ; $1C9C5B |
  STA $0440,x                               ; $1C9C5D |
  LDA #$04                                  ; $1C9C60 |
  STA $0460,x                               ; $1C9C62 |
  JSR code_1C9D20                           ; $1C9C65 |
  STA $0500,x                               ; $1C9C68 |
  LDA #$1E                                  ; $1C9C6B |
  STA $0520,x                               ; $1C9C6D |
  INC $0300,x                               ; $1C9C70 |
code_1C9C73:
  LDA $03C0,x                               ; $1C9C73 |
  PHA                                       ; $1C9C76 |
  LDA $03C0,x                               ; $1C9C77 |
  SEC                                       ; $1C9C7A |
  SBC #$17                                  ; $1C9C7B |
  STA $03C0,x                               ; $1C9C7D |
  LDA #$C3                                  ; $1C9C80 |
  STA $0480,x                               ; $1C9C82 |
  JSR code_1C8003                           ; $1C9C85 |
  PLA                                       ; $1C9C88 |
  STA $03C0,x                               ; $1C9C89 |
  LDA $04E0,x                               ; $1C9C8C |
  BEQ code_1C9CA5                           ; $1C9C8F |
  LDA #$AC                                  ; $1C9C91 |
  STA $0480,x                               ; $1C9C93 |
  LDA $0300,x                               ; $1C9C96 |
  AND #$02                                  ; $1C9C99 |
  BNE code_1C9CD6                           ; $1C9C9B |
  DEC $0500,x                               ; $1C9C9D |
  BNE code_1C9CA6                           ; $1C9CA0 |
  INC $0300,x                               ; $1C9CA2 |
code_1C9CA5:
  RTS                                       ; $1C9CA5 |

code_1C9CA6:
  LDY #$2A                                  ; $1C9CA6 |
  JSR code_1FF606                           ; $1C9CA8 |
  LDA $04A0,x                               ; $1C9CAB |
  AND #$01                                  ; $1C9CAE |
  BEQ code_1C9CC0                           ; $1C9CB0 |
  LDA $42                                   ; $1C9CB2 |
  AND #$10                                  ; $1C9CB4 |
  BEQ code_1C9CCD                           ; $1C9CB6 |
  LDY #$10                                  ; $1C9CB8 |
  JSR code_1FF580                           ; $1C9CBA |
  JMP code_1C9CCB                           ; $1C9CBD |

code_1C9CC0:
  LDA $44                                   ; $1C9CC0 |
  AND #$10                                  ; $1C9CC2 |
  BEQ code_1C9CCD                           ; $1C9CC4 |
  LDY #$11                                  ; $1C9CC6 |
  JSR code_1FF5C4                           ; $1C9CC8 |
code_1C9CCB:
  BCC code_1C9CD5                           ; $1C9CCB |
code_1C9CCD:
  LDA $04A0,x                               ; $1C9CCD |
  EOR #$03                                  ; $1C9CD0 |
  STA $04A0,x                               ; $1C9CD2 |
code_1C9CD5:
  RTS                                       ; $1C9CD5 |

code_1C9CD6:
  DEC $0520,x                               ; $1C9CD6 |
  BNE code_1C9CF0                           ; $1C9CD9 |
  STA $0540,x                               ; $1C9CDB |
  STA $0560,x                               ; $1C9CDE |
  LDA #$1E                                  ; $1C9CE1 |
  STA $0520,x                               ; $1C9CE3 |
  JSR code_1C9D20                           ; $1C9CE6 |
  STA $0500,x                               ; $1C9CE9 |
  DEC $0300,x                               ; $1C9CEC |
  RTS                                       ; $1C9CEF |

code_1C9CF0:
  LDA $0540,x                               ; $1C9CF0 |
  BNE code_1C9D18                           ; $1C9CF3 |
  LDA $0560,x                               ; $1C9CF5 |
  AND #$01                                  ; $1C9CF8 |
  ASL                                       ; $1C9CFA |
  TAY                                       ; $1C9CFB |
  LDA $0360,x                               ; $1C9CFC |
  CLC                                       ; $1C9CFF |
  ADC $9D1C,y                               ; $1C9D00 |
  STA $0360,x                               ; $1C9D03 |
  LDA $0380,x                               ; $1C9D06 |
  ADC $9D1D,y                               ; $1C9D09 |
  STA $0380,x                               ; $1C9D0C |
  LDA #$02                                  ; $1C9D0F |
  STA $0540,x                               ; $1C9D11 |
  INC $0560,x                               ; $1C9D14 |
  RTS                                       ; $1C9D17 |

code_1C9D18:
  DEC $0540,x                               ; $1C9D18 |
  RTS                                       ; $1C9D1B |

  db $01, $00, $FF, $FF                     ; $1C9D1C |

code_1C9D20:
  LDA $E4                                   ; $1C9D20 |
  ADC $E5                                   ; $1C9D22 |
  STA $E4                                   ; $1C9D24 |
  AND #$03                                  ; $1C9D26 |
  TAY                                       ; $1C9D28 |
  LDA $9D2D,y                               ; $1C9D29 |
  RTS                                       ; $1C9D2C |

  db $10, $20, $30, $10                     ; $1C9D2D |

  JSR code_1FF883                           ; $1C9D31 |
  LDY #$10                                  ; $1C9D34 |
  JSR code_1FF67C                           ; $1C9D36 |
  BCS code_1C9D51                           ; $1C9D39 |
  LDA #$00                                  ; $1C9D3B |
  STA $05E0,x                               ; $1C9D3D |
  LDA $04A0,x                               ; $1C9D40 |
  AND #$01                                  ; $1C9D43 |
  BEQ code_1C9D4C                           ; $1C9D45 |
  LDY #$0E                                  ; $1C9D47 |
  JMP code_1FF580                           ; $1C9D49 |

code_1C9D4C:
  LDY #$0F                                  ; $1C9D4C |
  JMP code_1FF5C4                           ; $1C9D4E |

code_1C9D51:
  LDA $05A0,x                               ; $1C9D51 |
  CMP #$08                                  ; $1C9D54 |
  BNE code_1C9D7E                           ; $1C9D56 |
  LDA $05E0,x                               ; $1C9D58 |
  BEQ code_1C9D6B                           ; $1C9D5B |
  LDA #$00                                  ; $1C9D5D |
  STA $05A0,x                               ; $1C9D5F |
  STA $05E0,x                               ; $1C9D62 |
  LDA #$20                                  ; $1C9D65 |
  JSR code_1FF89A                           ; $1C9D67 |
  RTS                                       ; $1C9D6A |

code_1C9D6B:
  LDA #$A8                                  ; $1C9D6B |
  STA $0440,x                               ; $1C9D6D |
  LDA #$05                                  ; $1C9D70 |
  STA $0460,x                               ; $1C9D72 |
  JSR code_1FF869                           ; $1C9D75 |
  LDA #$C5                                  ; $1C9D78 |
  STA $0480,x                               ; $1C9D7A |
  RTS                                       ; $1C9D7D |

code_1C9D7E:
  LDA #$A5                                  ; $1C9D7E |
  STA $0480,x                               ; $1C9D80 |
  RTS                                       ; $1C9D83 |

  JSR code_1FF8B3                           ; $1C9D84 |
  CMP #$1C                                  ; $1C9D87 |
  BCS code_1C9DB3                           ; $1C9D89 |
  JSR code_1FF8C2                           ; $1C9D8B |
  ROR $00                                   ; $1C9D8E |
  CMP #$68                                  ; $1C9D90 |
  BCS code_1C9DB3                           ; $1C9D92 |
  LDA $0580,x                               ; $1C9D94 |
  AND #$40                                  ; $1C9D97 |
  BNE code_1C9DA3                           ; $1C9D99 |
  LDA $00                                   ; $1C9D9B |
  BMI code_1C9DB3                           ; $1C9D9D |
  LDA #$01                                  ; $1C9D9F |
  BNE code_1C9DA9                           ; $1C9DA1 |
code_1C9DA3:
  LDA $00                                   ; $1C9DA3 |
  BPL code_1C9DB3                           ; $1C9DA5 |
  LDA #$02                                  ; $1C9DA7 |
code_1C9DA9:
  STA $36                                   ; $1C9DA9 |
  LDA #$00                                  ; $1C9DAB |
  STA $37                                   ; $1C9DAD |
  LDA #$01                                  ; $1C9DAF |
  STA $38                                   ; $1C9DB1 |
code_1C9DB3:
  RTS                                       ; $1C9DB3 |

  LDA $0300,x                               ; $1C9DB4 |
  AND #$0F                                  ; $1C9DB7 |
  BNE code_1C9DC3                           ; $1C9DB9 |
  LDA #$1E                                  ; $1C9DBB |
  STA $0500,x                               ; $1C9DBD |
  INC $0300,x                               ; $1C9DC0 |
code_1C9DC3:
  LDA $0300,x                               ; $1C9DC3 |
  AND #$02                                  ; $1C9DC6 |
  BNE code_1C9E04                           ; $1C9DC8 |
  JSR code_1FF8C2                           ; $1C9DCA |
  CMP #$50                                  ; $1C9DCD |
  BCS code_1C9E0C                           ; $1C9DCF |
  LDA $0540,x                               ; $1C9DD1 |
  BNE code_1C9DE7                           ; $1C9DD4 |
  LDA #$5A                                  ; $1C9DD6 |
  JSR reset_sprite_anim                     ; $1C9DD8 |
  JSR code_1FF869                           ; $1C9DDB |
  JSR code_1C9EA9                           ; $1C9DDE |
  LDA #$1E                                  ; $1C9DE1 |
  STA $0540,x                               ; $1C9DE3 |
  RTS                                       ; $1C9DE6 |

code_1C9DE7:
  DEC $0540,x                               ; $1C9DE7 |
  BNE code_1C9E0C                           ; $1C9DEA |
  INC $0560,x                               ; $1C9DEC |
  LDA $0560,x                               ; $1C9DEF |
  CMP #$02                                  ; $1C9DF2 |
  BCC code_1C9E0C                           ; $1C9DF4 |
  LDA #$00                                  ; $1C9DF6 |
  STA $0560,x                               ; $1C9DF8 |
  LDA #$78                                  ; $1C9DFB |
  STA $0540,x                               ; $1C9DFD |
  INC $0300,x                               ; $1C9E00 |
  RTS                                       ; $1C9E03 |

code_1C9E04:
  DEC $0540,x                               ; $1C9E04 |
  BNE code_1C9E0C                           ; $1C9E07 |
  DEC $0300,x                               ; $1C9E09 |
code_1C9E0C:
  DEC $0500,x                               ; $1C9E0C |
  BNE code_1C9E31                           ; $1C9E0F |
  LDA #$00                                  ; $1C9E11 |
  STA $01                                   ; $1C9E13 |
  JSR code_1C9E46                           ; $1C9E15 |
  LDA #$1E                                  ; $1C9E18 |
  STA $0500,x                               ; $1C9E1A |
  INC $0520,x                               ; $1C9E1D |
  LDA $0520,x                               ; $1C9E20 |
  CMP #$03                                  ; $1C9E23 |
  BCC code_1C9E31                           ; $1C9E25 |
  LDA #$5A                                  ; $1C9E27 |
  STA $0500,x                               ; $1C9E29 |
  LDA #$00                                  ; $1C9E2C |
  STA $0520,x                               ; $1C9E2E |
code_1C9E31:
  LDA $05C0,x                               ; $1C9E31 |
  CMP #$5A                                  ; $1C9E34 |
  BNE code_1C9E45                           ; $1C9E36 |
  LDA $05E0,x                               ; $1C9E38 |
  ORA $05A0,x                               ; $1C9E3B |
  BNE code_1C9E45                           ; $1C9E3E |
  LDA #$59                                  ; $1C9E40 |
  JSR reset_sprite_anim                     ; $1C9E42 |
code_1C9E45:
  RTS                                       ; $1C9E45 |

code_1C9E46:
  JSR code_1FFC53                           ; $1C9E46 |
  BCS code_1C9EA4                           ; $1C9E49 |
  STY $00                                   ; $1C9E4B |
  LDA $04A0,x                               ; $1C9E4D |
  STA $04A0,y                               ; $1C9E50 |
  AND #$02                                  ; $1C9E53 |
  TAY                                       ; $1C9E55 |
  LDA $0360,x                               ; $1C9E56 |
  CLC                                       ; $1C9E59 |
  ADC $9EA5,y                               ; $1C9E5A |
  PHA                                       ; $1C9E5D |
  LDA $0380,x                               ; $1C9E5E |
  ADC $9EA6,y                               ; $1C9E61 |
  LDY $00                                   ; $1C9E64 |
  STA $0380,y                               ; $1C9E66 |
  PLA                                       ; $1C9E69 |
  STA $0360,y                               ; $1C9E6A |
  LDA $03C0,x                               ; $1C9E6D |
  SEC                                       ; $1C9E70 |
  SBC #$04                                  ; $1C9E71 |
  STA $03C0,y                               ; $1C9E73 |
  LDA #$80                                  ; $1C9E76 |
  STA $0400,y                               ; $1C9E78 |
  LDA #$01                                  ; $1C9E7B |
  STA $0420,y                               ; $1C9E7D |
  LDA #$73                                  ; $1C9E80 |
  JSR code_1FF846                           ; $1C9E82 |
  LDA #$1B                                  ; $1C9E85 |
  STA $0320,y                               ; $1C9E87 |
  LDA #$8B                                  ; $1C9E8A |
  STA $0480,y                               ; $1C9E8C |
  LDA #$00                                  ; $1C9E8F |
  STA $04E0,y                               ; $1C9E91 |
  LDA $04A0,x                               ; $1C9E94 |
  EOR #$03                                  ; $1C9E97 |
  STA $04A0,x                               ; $1C9E99 |
  INC $01                                   ; $1C9E9C |
  LDA $01                                   ; $1C9E9E |
  CMP #$02                                  ; $1C9EA0 |
  BCC code_1C9E46                           ; $1C9EA2 |
code_1C9EA4:
  RTS                                       ; $1C9EA4 |

  db $0F, $00, $F1, $FF                     ; $1C9EA5 |

code_1C9EA9:
  JSR code_1FFC53                           ; $1C9EA9 |
  BCS code_1C9EA4                           ; $1C9EAC |
  LDA #$00                                  ; $1C9EAE |
  STA $0440,y                               ; $1C9EB0 |
  LDA #$04                                  ; $1C9EB3 |
  STA $0460,y                               ; $1C9EB5 |
  LDA #$73                                  ; $1C9EB8 |
  JSR code_1FF846                           ; $1C9EBA |
  LDA #$8B                                  ; $1C9EBD |
  STA $0480,y                               ; $1C9EBF |
  LDA #$0C                                  ; $1C9EC2 |
  STA $0320,y                               ; $1C9EC4 |
  LDA $0360,x                               ; $1C9EC7 |
  STA $0360,y                               ; $1C9ECA |
  LDA $0380,x                               ; $1C9ECD |
  STA $0380,y                               ; $1C9ED0 |
  LDA $03C0,x                               ; $1C9ED3 |
  SEC                                       ; $1C9ED6 |
  SBC #$10                                  ; $1C9ED7 |
  STA $03C0,y                               ; $1C9ED9 |
  LDA $03E0,x                               ; $1C9EDC |
  STA $03E0,y                               ; $1C9EDF |
  LDA $04A0,x                               ; $1C9EE2 |
  STA $04A0,y                               ; $1C9EE5 |
  JSR code_1FF8C2                           ; $1C9EE8 |
  STX $00                                   ; $1C9EEB |
  LDX #$03                                  ; $1C9EED |
code_1C9EEF:
  CMP $9F06,x                               ; $1C9EEF |
  BCC code_1C9EF7                           ; $1C9EF2 |
  DEX                                       ; $1C9EF4 |
  BNE code_1C9EEF                           ; $1C9EF5 |
code_1C9EF7:
  LDA $9F0A,x                               ; $1C9EF7 |
  STA $0400,y                               ; $1C9EFA |
  LDA $9F0E,x                               ; $1C9EFD |
  STA $0420,y                               ; $1C9F00 |
  LDX $00                                   ; $1C9F03 |
  RTS                                       ; $1C9F05 |

  db $4C, $3D, $2E, $1F, $00, $80, $00, $80 ; $1C9F06 |
  db $02, $01, $01, $00                     ; $1C9F0E |

  LDY #$12                                  ; $1C9F12 |
  JSR code_1FF67C                           ; $1C9F14 |
  BCS code_1C9F30                           ; $1C9F17 |
  LDA $04A0,x                               ; $1C9F19 |
  AND #$01                                  ; $1C9F1C |
  BEQ code_1C9F28                           ; $1C9F1E |
  LDY #$1E                                  ; $1C9F20 |
  JSR code_1FF580                           ; $1C9F22 |
  JMP code_1C9F2D                           ; $1C9F25 |

code_1C9F28:
  LDY #$1F                                  ; $1C9F28 |
  JSR code_1FF5C4                           ; $1C9F2A |
code_1C9F2D:
  BCS code_1C9F30                           ; $1C9F2D |
  RTS                                       ; $1C9F2F |

code_1C9F30:
  LDA $0320,x                               ; $1C9F30 |
  CMP #$0C                                  ; $1C9F33 |
  BNE code_1C9F6C                           ; $1C9F35 |
  LDA #$00                                  ; $1C9F37 |
  STA $0320,x                               ; $1C9F39 |
  LDA $B3                                   ; $1C9F3C |
  BPL code_1C9F44                           ; $1C9F3E |
  LDA #$59                                  ; $1C9F40 |
  BNE code_1C9F46                           ; $1C9F42 |
code_1C9F44:
  LDA #$71                                  ; $1C9F44 |
code_1C9F46:
  JMP reset_sprite_anim                     ; $1C9F46 |

  LDA $04A0,x                               ; $1C9F49 |
  AND #$01                                  ; $1C9F4C |
  BEQ code_1C9F58                           ; $1C9F4E |
  LDY #$0C                                  ; $1C9F50 |
  JSR code_1FF580                           ; $1C9F52 |
  JMP code_1C9F5D                           ; $1C9F55 |

code_1C9F58:
  LDY #$0D                                  ; $1C9F58 |
  JSR code_1FF5C4                           ; $1C9F5A |
code_1C9F5D:
  BCS code_1C9F6C                           ; $1C9F5D |
  LDA $04A0,x                               ; $1C9F5F |
  AND #$08                                  ; $1C9F62 |
  BEQ code_1C9F69                           ; $1C9F64 |
  JMP code_1FF779                           ; $1C9F66 |

code_1C9F69:
  JMP code_1FF759                           ; $1C9F69 |

code_1C9F6C:
  LDA #$00                                  ; $1C9F6C |
  STA $0300,x                               ; $1C9F6E |
  STA $01                                   ; $1C9F71 |
  LDA #$FF                                  ; $1C9F73 |
  STA $04C0,x                               ; $1C9F75 |
code_1C9F78:
  JSR code_1FFC53                           ; $1C9F78 |
  BCS code_1C9FE2                           ; $1C9F7B |
  STY $00                                   ; $1C9F7D |
  LDA $04A0,x                               ; $1C9F7F |
  AND #$02                                  ; $1C9F82 |
  TAY                                       ; $1C9F84 |
  LDA $0360,x                               ; $1C9F85 |
  CLC                                       ; $1C9F88 |
  ADC $A731,y                               ; $1C9F89 |
  PHA                                       ; $1C9F8C |
  LDA $0380,x                               ; $1C9F8D |
  ADC $A732,y                               ; $1C9F90 |
  LDY $00                                   ; $1C9F93 |
  STA $0380,y                               ; $1C9F95 |
  PLA                                       ; $1C9F98 |
  STA $0360,y                               ; $1C9F99 |
  LDA $03C0,x                               ; $1C9F9C |
  STA $03C0,y                               ; $1C9F9F |
  LDA #$5B                                  ; $1C9FA2 |
  JSR code_1FF846                           ; $1C9FA4 |
  LDA #$0C                                  ; $1C9FA7 |
  STA $0320,y                               ; $1C9FA9 |
  LDA #$8B                                  ; $1C9FAC |
  STA $0480,y                               ; $1C9FAE |
  LDA #$00                                  ; $1C9FB1 |
  STA $04E0,y                               ; $1C9FB3 |
  STX $02                                   ; $1C9FB6 |
  LDX $01                                   ; $1C9FB8 |
  LDA $9FE3,x                               ; $1C9FBA |
  STA $04A0,y                               ; $1C9FBD |
  LDA $9FE7,x                               ; $1C9FC0 |
  STA $0440,y                               ; $1C9FC3 |
  LDA $9FEB,x                               ; $1C9FC6 |
  STA $0460,y                               ; $1C9FC9 |
  LDA $9FEF,x                               ; $1C9FCC |
  STA $0400,y                               ; $1C9FCF |
  LDA $9FF3,x                               ; $1C9FD2 |
  STA $0420,y                               ; $1C9FD5 |
  LDX $02                                   ; $1C9FD8 |
  INC $01                                   ; $1C9FDA |
  LDA $01                                   ; $1C9FDC |
  CMP #$04                                  ; $1C9FDE |
  BCC code_1C9F78                           ; $1C9FE0 |
code_1C9FE2:
  RTS                                       ; $1C9FE2 |

  db $01, $01, $02, $02, $9E, $44, $9E, $44 ; $1C9FE3 |
  db $04, $03, $04, $03, $CC, $80, $CC, $80 ; $1C9FEB |
  db $00, $00, $00, $00                     ; $1C9FF3 |

  JSR $A249                                 ; $1C9FF7 |
  LDA $0560,x                               ; $1C9FFA |
  BEQ code_1C9FE2                           ; $1C9FFD |
  LDA $04E0,x                               ; $1C9FFF |

