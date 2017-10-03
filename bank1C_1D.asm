; sprite code banks
; these 2 banks hold all main routines &
; AI code for main routine indices $00~$9F

bank $1C
org $8000

process_sprites_j:
  JMP process_sprites                       ; $1C8000 |

code_1C8003:
  JMP code_1C8109                           ; $1C8003 |

  JMP code_1C82B8                           ; $1C8006 |

  JMP code_1C8097                           ; $1C8009 |

process_sprites:
  LDA #$55                                  ; $1C800C |
  STA $99                                   ; $1C800E |
  LDX #$01                                  ; $1C8010 |
  STX $EF                                   ; $1C8012 |
.loop_sprite:
  LDY #$01                                  ; $1C8014 |
  CPX $5B                                   ; $1C8016 |
  BEQ .code_1C8060                          ; $1C8018 |
  INY                                       ; $1C801A |
  CPX $5C                                   ; $1C801B |
  BEQ .code_1C8060                          ; $1C801D |
  LDA $0300,x                               ; $1C801F |\ if sprite inactive,
  BPL .next_sprite                          ; $1C8022 |/ skip & continue loop
  LDY #$1D                                  ; $1C8024 |\  select $A000~$BFFF bank
  LDA $0320,x                               ; $1C8026 | | bank $1D for main routine
  CMP #$E0                                  ; $1C8029 | | indices $00~$9F
  BCC .check_main_index                     ; $1C802B | |
  LDY #$12                                  ; $1C802D | | bank $12 for $E0~$FF
  BNE .select_bank                          ; $1C802F |/
.check_main_index:
  LSR                                       ; $1C8031 |\
  LSR                                       ; $1C8032 | | in between $9F and $E0,
  LSR                                       ; $1C8033 | | index >> 4 - $06
  LSR                                       ; $1C8034 | | meaning bank $04 for $A0~$AF,
  CMP #$0A                                  ; $1C8035 | | $05 for $B0~$BF,
  BCC .select_bank                          ; $1C8037 | | $06 for $C0~$CF,
  SEC                                       ; $1C8039 | | $07 for $D0~$DF
  SBC #$06                                  ; $1C803A | |
  TAY                                       ; $1C803C |/
.select_bank:
  CPY $F5                                   ; $1C803D |\
  BEQ .main_sprite                          ; $1C803F | | if not already selected,
  STY $F5                                   ; $1C8041 | |
  TXA                                       ; $1C8043 | | preserve X
  PHA                                       ; $1C8044 | | select new $A000~$BFFF bank
  JSR select_PRG_banks                      ; $1C8045 | | restore X
  PLA                                       ; $1C8048 | |
  TAX                                       ; $1C8049 |/
.main_sprite:
  LDY $0320,x                               ; $1C804A |\
  LDA sprite_main_ptr_lo,y                  ; $1C804D | |
  STA $00                                   ; $1C8050 | | load sprite main routine
  LDA sprite_main_ptr_hi,y                  ; $1C8052 | | pointer (low then high)
  STA $01                                   ; $1C8055 |/
  LDA #.sprite_return>>8                    ; $1C8057 |\
  PHA                                       ; $1C8059 | | return address
  LDA #.sprite_return-1                     ; $1C805A | | (skips some code below)
  PHA                                       ; $1C805C |/
  JMP ($0000)                               ; $1C805D | jump to sprite main
.code_1C8060:
  LDA #$00                                  ; $1C8060 |
  STA $005A,y                               ; $1C8062 |
  JSR check_sprite_weapon_collision         ; $1C8065 |
  BCS .code_1C8083                          ; $1C8068 |
  TXA                                       ; $1C806A |
  LDY $10                                   ; $1C806B |
  STA $005A,y                               ; $1C806D |
  LDA #$00                                  ; $1C8070 |
  STA $05E0,x                               ; $1C8072 |
  BEQ .code_1C8083                          ; $1C8075 |
.sprite_return:
  CPX #$10                                  ; $1C8077 |
  BCC .next_sprite                          ; $1C8079 |
  LDA $0320,x                               ; $1C807B |
  BEQ .next_sprite                          ; $1C807E |
  JSR code_1C8102                           ; $1C8080 |
.code_1C8083:
  LDA $0480,x                               ; $1C8083 |
  BPL .next_sprite                          ; $1C8086 |
  JSR code_1C8097                           ; $1C8088 |
.next_sprite:
  INC $EF                                   ; $1C808B |
  LDX $EF                                   ; $1C808D |
  CPX #$20                                  ; $1C808F |
  BEQ .ret                                  ; $1C8091 |
  JMP .loop_sprite                          ; $1C8093 |

.ret:
  RTS                                       ; $1C8096 |

code_1C8097:
  LDA $05C0                                 ; $1C8097 |
  CMP #$A4                                  ; $1C809A |
  BEQ process_sprites.ret                   ; $1C809C |
  STX $0F                                   ; $1C809E |
  LDA $F5                                   ; $1C80A0 |
  PHA                                       ; $1C80A2 |
  LDA #$0A                                  ; $1C80A3 |
  STA $F5                                   ; $1C80A5 |
  JSR select_PRG_banks                      ; $1C80A7 |
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
  JSR select_PRG_banks                      ; $1C80FC |
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
  JSR check_sprite_weapon_collision         ; $1C8113 |
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
  JSR select_PRG_banks                      ; $1C8152 |
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
  JSR select_PRG_banks                      ; $1C8250 |
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
  JSR select_PRG_banks                      ; $1C8273 |
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

; low bytes of sprite main routine pointers
sprite_main_ptr_lo:
  db main_ret_A                             ; $1C83C7 |
  db $C9                                    ; $1C83C8 |
  db main_dada                              ; $1C83C9 |
  db main_potton                            ; $1C83CA |
  db $DE                                    ; $1C83CB |
  db main_new_shotman                       ; $1C83CC |
  db main_hammer_joe                        ; $1C83CD |
  db main_peterchy                          ; $1C83CE |
  db main_bubukan                           ; $1C83CF |
  db $C8                                    ; $1C83D0 |
  db main_bomb_flier_penpen                 ; $1C83D1 |
  db $49                                    ; $1C83D2 |
  db $12                                    ; $1C83D3 |
  db main_yambow                            ; $1C83D4 |
  db main_met                               ; $1C83D5 |
  db $85                                    ; $1C83D6 |
  db $0E                                    ; $1C83D7 |
  db $09                                    ; $1C83D8 |
  db main_cannon                            ; $1C83D9 |
  db $9B                                    ; $1C83DA |
  db main_cloud_platform                    ; $1C83DB |
  db main_jamacy                            ; $1C83DC |
  db main_jamacy                            ; $1C83DD |
  db main_unknown_0C                        ; $1C83DE |
  db $E2                                    ; $1C83DF |
  db $60                                    ; $1C83E0 |
  db main_mag_fly                           ; $1C83E1 |
  db $C9                                    ; $1C83E2 |
  db $C8                                    ; $1C83E3 |
  db $E0                                    ; $1C83E4 |
  db main_gyoraibo                          ; $1C83E5 |
  db main_junk_golem                        ; $1C83E6 |
  db main_pickelman_bull                    ; $1C83E7 |
  db main_bikky                             ; $1C83E8 |
  db main_unknown_14                        ; $1C83E9 |
  db main_magnet_force                      ; $1C83EA |
  db $19                                    ; $1C83EB |
  db main_nitron                            ; $1C83EC |
  db $FE                                    ; $1C83ED |
  db $3A                                    ; $1C83EE |
  db main_gyoraibo                          ; $1C83EF |
  db $35                                    ; $1C83F0 |
  db main_hari_harry                        ; $1C83F1 |
  db main_penpen_maker                      ; $1C83F2 |
  db main_returning_monking                 ; $1C83F3 |
  db main_unknown_1B                        ; $1C83F4 |
  db main_have_su_bee                       ; $1C83F5 |
  db main_beehive                           ; $1C83F6 |
  db main_bolton_and_nutton                 ; $1C83F7 |
  db $82                                    ; $1C83F8 |
  db main_wanaan                            ; $1C83F9 |
  db main_needle_press                      ; $1C83FA |
  db main_walking_bomb                      ; $1C83FB |
  db main_elecn                             ; $1C83FC |
  db $85                                    ; $1C83FD |
  db main_mechakkero                        ; $1C83FE |
  db main_top_man_platform                  ; $1C83FF |
  db $60                                    ; $1C8400 |
  db $60                                    ; $1C8401 |
  db main_chibee                            ; $1C8402 |
  db $C9                                    ; $1C8403 |
  db main_bomb_flier_penpen                 ; $1C8404 |
  db main_spark_falling_platform            ; $1C8405 |
  db main_ret_B                             ; $1C8406 |
  db $C9                                    ; $1C8407 |
  db $C9                                    ; $1C8408 |
  db $56                                    ; $1C8409 |
  db main_pole                              ; $1C840A |
  db $F7                                    ; $1C840B |
  db $35                                    ; $1C840C |
  db $3F                                    ; $1C840D |
  db main_komasaburo                        ; $1C840E |
  db $60                                    ; $1C840F |
  db main_parasyu                           ; $1C8410 |
  db main_hologran                          ; $1C8411 |
  db main_hologran                          ; $1C8412 |
  db main_bomber_pepe                       ; $1C8413 |
  db main_metall_dx                         ; $1C8414 |
  db main_petit_snakey                      ; $1C8415 |
  db init_tama                              ; $1C8416 |
  db $34                                    ; $1C8417 |
  db $C9                                    ; $1C8418 |
  db main_proto_man                         ; $1C8419 |
  db $F7                                    ; $1C841A |
  db $C8                                    ; $1C841B |
  db $C8                                    ; $1C841C |
  db $60                                    ; $1C841D |
  db $C8                                    ; $1C841E |
  db main_robot_master_intro                ; $1C841F |
  db main_robot_master_intro                ; $1C8420 |
  db main_robot_master_intro                ; $1C8421 |
  db main_robot_master_intro                ; $1C8422 |
  db main_robot_master_intro                ; $1C8423 |
  db main_robot_master_intro                ; $1C8424 |
  db main_robot_master_intro                ; $1C8425 |
  db main_robot_master_intro                ; $1C8426 |
  db $C8                                    ; $1C8427 |
  db $C9                                    ; $1C8428 |
  db $93                                    ; $1C8429 |
  db $3F                                    ; $1C842A |
  db main_item_pickup.large                 ; $1C842B |
  db main_item_pickup                       ; $1C842C |
  db main_item_pickup.large                 ; $1C842D |
  db main_item_pickup                       ; $1C842E |
  db main_item_pickup.large                 ; $1C842F |
  db main_item_pickup.large                 ; $1C8430 |
  db main_surprise_box                      ; $1C8431 |
  db $C8                                    ; $1C8432 |
  db main_junk_block                        ; $1C8433 |
  db $65                                    ; $1C8434 |
  db main_spinning_wheel                    ; $1C8435 |
  db $C8                                    ; $1C8436 |
  db main_trap_platform                     ; $1C8437 |
  db main_proto_man_gemini_cutscene         ; $1C8438 |
  db main_ret_B                             ; $1C8439 |
  db main_giant_springer                    ; $1C843A |
  db main_breakable_wall                    ; $1C843B |
  db $B6                                    ; $1C843C |
  db $C8                                    ; $1C843D |
  db $C8                                    ; $1C843E |
  db main_electric_gabyoall                 ; $1C843F |
  db main_electric_gabyoall                 ; $1C8440 |
  db $51                                    ; $1C8441 |
  db $C8                                    ; $1C8442 |
  db $C8                                    ; $1C8443 |
  db $C8                                    ; $1C8444 |
  db $C8                                    ; $1C8445 |
  db $C8                                    ; $1C8446 |
  db $A4                                    ; $1C8447 |
  db $1E                                    ; $1C8448 |
  db $96                                    ; $1C8449 |
  db $DD                                    ; $1C844A |
  db $88                                    ; $1C844B |
  db $47                                    ; $1C844C |
  db $C2                                    ; $1C844D |
  db $79                                    ; $1C844E |
  db $98                                    ; $1C844F |
  db main_big_snakey                        ; $1C8450 |
  db main_tama_A                            ; $1C8451 |
  db $A7                                    ; $1C8452 |
  db main_tama_B                            ; $1C8453 |
  db $65                                    ; $1C8454 |
  db $95                                    ; $1C8455 |
  db $34                                    ; $1C8456 |
  db main_doc_robot                         ; $1C8457 |
  db main_doc_robot                         ; $1C8458 |
  db main_doc_robot                         ; $1C8459 |
  db main_doc_robot                         ; $1C845A |
  db main_doc_robot                         ; $1C845B |
  db main_doc_robot                         ; $1C845C |
  db main_doc_robot                         ; $1C845D |
  db main_doc_robot                         ; $1C845E |
  db $C8                                    ; $1C845F |
  db $C8                                    ; $1C8460 |
  db $C8                                    ; $1C8461 |
  db $C8                                    ; $1C8462 |
  db $C8                                    ; $1C8463 |
  db $C8                                    ; $1C8464 |
  db $C8                                    ; $1C8465 |
  db $C8                                    ; $1C8466 |
  db $00                                    ; $1C8467 |
  db $03                                    ; $1C8468 |
  db $06                                    ; $1C8469 |
  db $09                                    ; $1C846A |
  db $0C                                    ; $1C846B |
  db $0F                                    ; $1C846C |
  db $12                                    ; $1C846D |
  db $15                                    ; $1C846E |
  db $18                                    ; $1C846F |
  db $1B                                    ; $1C8470 |
  db $1E                                    ; $1C8471 |
  db $21                                    ; $1C8472 |
  db $24                                    ; $1C8473 |
  db $27                                    ; $1C8474 |
  db $2A                                    ; $1C8475 |
  db $2D                                    ; $1C8476 |
  db $00                                    ; $1C8477 |
  db $03                                    ; $1C8478 |
  db $06                                    ; $1C8479 |
  db $09                                    ; $1C847A |
  db $0C                                    ; $1C847B |
  db $0F                                    ; $1C847C |
  db $12                                    ; $1C847D |
  db $15                                    ; $1C847E |
  db $18                                    ; $1C847F |
  db $1B                                    ; $1C8480 |
  db $1E                                    ; $1C8481 |
  db $21                                    ; $1C8482 |
  db $24                                    ; $1C8483 |
  db $27                                    ; $1C8484 |
  db $2A                                    ; $1C8485 |
  db $2D                                    ; $1C8486 |
  db main_needle_man_j                      ; $1C8487 |
  db main_magnet_man_j                      ; $1C8488 |
  db main_top_man_j                         ; $1C8489 |
  db main_shadow_man_j                      ; $1C848A |
  db $0C                                    ; $1C848B |
  db $0F                                    ; $1C848C |
  db $12                                    ; $1C848D |
  db $15                                    ; $1C848E |
  db $18                                    ; $1C848F |
  db $1B                                    ; $1C8490 |
  db $1E                                    ; $1C8491 |
  db $21                                    ; $1C8492 |
  db $24                                    ; $1C8493 |
  db $27                                    ; $1C8494 |
  db $2A                                    ; $1C8495 |
  db $2D                                    ; $1C8496 |
  db main_hard_man_j                        ; $1C8497 |
  db $03                                    ; $1C8498 |
  db main_spark_man_j                       ; $1C8499 |
  db $09                                    ; $1C849A |
  db main_snake_man_j                       ; $1C849B |
  db $0F                                    ; $1C849C |
  db main_gemini_man_j                      ; $1C849D |
  db $15                                    ; $1C849E |
  db $18                                    ; $1C849F |
  db $1B                                    ; $1C84A0 |
  db $1E                                    ; $1C84A1 |
  db $21                                    ; $1C84A2 |
  db $24                                    ; $1C84A3 |
  db $27                                    ; $1C84A4 |
  db $2A                                    ; $1C84A5 |
  db $2D                                    ; $1C84A6 |
  db main_yellow_devil                      ; $1C84A7 |
  db $03                                    ; $1C84A8 |
  db $06                                    ; $1C84A9 |
  db main_wily_machine_A                    ; $1C84AA |
  db $0C                                    ; $1C84AB |
  db main_wily_machine_B                    ; $1C84AC |
  db $12                                    ; $1C84AD |
  db main_gamma_B                           ; $1C84AE |
  db $18                                    ; $1C84AF |
  db $1B                                    ; $1C84B0 |
  db main_gamma_F                           ; $1C84B1 |
  db main_teleporter                        ; $1C84B2 |
  db $24                                    ; $1C84B3 |
  db main_wily_machine_C                    ; $1C84B4 |
  db $2A                                    ; $1C84B5 |
  db $2D                                    ; $1C84B6 |
  db main_kamegoro_maker                    ; $1C84B7 |
  db $33                                    ; $1C84B8 |
  db $36                                    ; $1C84B9 |
  db main_kamegoro_current                  ; $1C84BA |
  db $3C                                    ; $1C84BB |
  db main_holograph                         ; $1C84BC |
  db $42                                    ; $1C84BD |
  db $45                                    ; $1C84BE |
  db $48                                    ; $1C84BF |
  db $4B                                    ; $1C84C0 |
  db $4E                                    ; $1C84C1 |
  db $51                                    ; $1C84C2 |
  db main_giant_met                         ; $1C84C3 |
  db $57                                    ; $1C84C4 |
  db $5A                                    ; $1C84C5 |
  db $5D                                    ; $1C84C6 |

; high bytes of sprite main routine pointers
sprite_main_ptr_hi:
  db main_ret_A>>8                          ; $1C84C7 |
  db $85                                    ; $1C84C8 |
  db main_dada>>8                           ; $1C84C9 |
  db main_potton>>8                         ; $1C84CA |
  db $8B                                    ; $1C84CB |
  db main_new_shotman>>8                    ; $1C84CC |
  db main_hammer_joe>>8                     ; $1C84CD |
  db main_peterchy>>8                       ; $1C84CE |
  db main_bubukan>>8                        ; $1C84CF |
  db $8D                                    ; $1C84D0 |
  db main_bomb_flier_penpen>>8              ; $1C84D1 |
  db $9F                                    ; $1C84D2 |
  db $9F                                    ; $1C84D3 |
  db main_yambow>>8                         ; $1C84D4 |
  db main_met>>8                            ; $1C84D5 |
  db $98                                    ; $1C84D6 |
  db $94                                    ; $1C84D7 |
  db $94                                    ; $1C84D8 |
  db main_cannon>>8                         ; $1C84D9 |
  db $99                                    ; $1C84DA |
  db main_cloud_platform>>8                 ; $1C84DB |
  db main_jamacy>>8                         ; $1C84DC |
  db main_jamacy>>8                         ; $1C84DD |
  db main_unknown_0C>>8                     ; $1C84DE |
  db $90                                    ; $1C84DF |
  db $A9                                    ; $1C84E0 |
  db main_mag_fly>>8                        ; $1C84E1 |
  db $85                                    ; $1C84E2 |
  db $85                                    ; $1C84E3 |
  db $AA                                    ; $1C84E4 |
  db main_gyoraibo>>8                       ; $1C84E5 |
  db main_junk_golem>>8                     ; $1C84E6 |
  db main_pickelman_bull>>8                 ; $1C84E7 |
  db main_bikky>>8                          ; $1C84E8 |
  db main_unknown_14>>8                     ; $1C84E9 |
  db main_magnet_force>>8                   ; $1C84EA |
  db $9C                                    ; $1C84EB |
  db main_nitron>>8                         ; $1C84EC |
  db $A5                                    ; $1C84ED |
  db $A6                                    ; $1C84EE |
  db main_gyoraibo>>8                       ; $1C84EF |
  db $A7                                    ; $1C84F0 |
  db main_hari_harry>>8                     ; $1C84F1 |
  db main_penpen_maker>>8                   ; $1C84F2 |
  db main_returning_monking>>8              ; $1C84F3 |
  db main_unknown_1B>>8                     ; $1C84F4 |
  db main_have_su_bee>>8                    ; $1C84F5 |
  db main_beehive>>8                        ; $1C84F6 |
  db main_bolton_and_nutton>>8              ; $1C84F7 |
  db $AC                                    ; $1C84F8 |
  db main_wanaan>>8                         ; $1C84F9 |
  db main_needle_press>>8                   ; $1C84FA |
  db main_walking_bomb>>8                   ; $1C84FB |
  db main_elecn>>8                          ; $1C84FC |
  db $98                                    ; $1C84FD |
  db main_mechakkero>>8                     ; $1C84FE |
  db main_top_man_platform>>8               ; $1C84FF |
  db $A9                                    ; $1C8500 |
  db $A9                                    ; $1C8501 |
  db main_chibee>>8                         ; $1C8502 |
  db $85                                    ; $1C8503 |
  db main_bomb_flier_penpen>>8              ; $1C8504 |
  db main_spark_falling_platform>>8         ; $1C8505 |
  db main_ret_B>>8                          ; $1C8506 |
  db $85                                    ; $1C8507 |
  db $85                                    ; $1C8508 |
  db $B1                                    ; $1C8509 |
  db main_pole>>8                           ; $1C850A |
  db $B8                                    ; $1C850B |
  db $A7                                    ; $1C850C |
  db $A9                                    ; $1C850D |
  db main_komasaburo>>8                     ; $1C850E |
  db $A9                                    ; $1C850F |
  db main_parasyu>>8                        ; $1C8510 |
  db main_hologran>>8                       ; $1C8511 |
  db main_hologran>>8                       ; $1C8512 |
  db main_bomber_pepe>>8                    ; $1C8513 |
  db main_metall_dx>>8                      ; $1C8514 |
  db main_petit_snakey>>8                   ; $1C8515 |
  db init_tama>>8                           ; $1C8516 |
  db $BB                                    ; $1C8517 |
  db $85                                    ; $1C8518 |
  db main_proto_man>>8                      ; $1C8519 |
  db $9F                                    ; $1C851A |
  db $85                                    ; $1C851B |
  db $85                                    ; $1C851C |
  db $A9                                    ; $1C851D |
  db $85                                    ; $1C851E |
  db main_robot_master_intro>>8             ; $1C851F |
  db main_robot_master_intro>>8             ; $1C8520 |
  db main_robot_master_intro>>8             ; $1C8521 |
  db main_robot_master_intro>>8             ; $1C8522 |
  db main_robot_master_intro>>8             ; $1C8523 |
  db main_robot_master_intro>>8             ; $1C8524 |
  db main_robot_master_intro>>8             ; $1C8525 |
  db main_robot_master_intro>>8             ; $1C8526 |
  db $85                                    ; $1C8527 |
  db $B7                                    ; $1C8528 |
  db $95                                    ; $1C8529 |
  db $A8                                    ; $1C852A |
  db main_item_pickup.large>>8              ; $1C852B |
  db main_item_pickup>>8                    ; $1C852C |
  db main_item_pickup.large>>8              ; $1C852D |
  db main_item_pickup>>8                    ; $1C852E |
  db main_item_pickup.large>>8              ; $1C852F |
  db main_item_pickup.large>>8              ; $1C8530 |
  db main_surprise_box>>8                   ; $1C8531 |
  db $85                                    ; $1C8532 |
  db main_junk_block>>8                     ; $1C8533 |
  db $91                                    ; $1C8534 |
  db main_spinning_wheel>>8                 ; $1C8535 |
  db $85                                    ; $1C8536 |
  db main_trap_platform>>8                  ; $1C8537 |
  db main_proto_man_gemini_cutscene>>8      ; $1C8538 |
  db main_ret_B>>8                          ; $1C8539 |
  db main_giant_springer>>8                 ; $1C853A |
  db main_breakable_wall>>8                 ; $1C853B |
  db $92                                    ; $1C853C |
  db $85                                    ; $1C853D |
  db $85                                    ; $1C853E |
  db main_electric_gabyoall>>8              ; $1C853F |
  db main_electric_gabyoall>>8              ; $1C8540 |
  db $BF                                    ; $1C8541 |
  db $85                                    ; $1C8542 |
  db $85                                    ; $1C8543 |
  db $85                                    ; $1C8544 |
  db $85                                    ; $1C8545 |
  db $85                                    ; $1C8546 |
  db $86                                    ; $1C8547 |
  db $87                                    ; $1C8548 |
  db $87                                    ; $1C8549 |
  db $87                                    ; $1C854A |
  db $88                                    ; $1C854B |
  db $89                                    ; $1C854C |
  db $89                                    ; $1C854D |
  db $8A                                    ; $1C854E |
  db $8A                                    ; $1C854F |
  db main_big_snakey>>8                     ; $1C8550 |
  db main_tama_A>>8                         ; $1C8551 |
  db $BC                                    ; $1C8552 |
  db main_tama_B>>8                         ; $1C8553 |
  db $BD                                    ; $1C8554 |
  db $BD                                    ; $1C8555 |
  db $BB                                    ; $1C8556 |
  db main_doc_robot>>8                      ; $1C8557 |
  db main_doc_robot>>8                      ; $1C8558 |
  db main_doc_robot>>8                      ; $1C8559 |
  db main_doc_robot>>8                      ; $1C855A |
  db main_doc_robot>>8                      ; $1C855B |
  db main_doc_robot>>8                      ; $1C855C |
  db main_doc_robot>>8                      ; $1C855D |
  db main_doc_robot>>8                      ; $1C855E |
  db $85                                    ; $1C855F |
  db $85                                    ; $1C8560 |
  db $85                                    ; $1C8561 |
  db $85                                    ; $1C8562 |
  db $85                                    ; $1C8563 |
  db $85                                    ; $1C8564 |
  db $85                                    ; $1C8565 |
  db $85                                    ; $1C8566 |
  db $A0                                    ; $1C8567 |
  db $A0                                    ; $1C8568 |
  db $A0                                    ; $1C8569 |
  db $A0                                    ; $1C856A |
  db $A0                                    ; $1C856B |
  db $A0                                    ; $1C856C |
  db $A0                                    ; $1C856D |
  db $A0                                    ; $1C856E |
  db $A0                                    ; $1C856F |
  db $A0                                    ; $1C8570 |
  db $A0                                    ; $1C8571 |
  db $A0                                    ; $1C8572 |
  db $A0                                    ; $1C8573 |
  db $A0                                    ; $1C8574 |
  db $A0                                    ; $1C8575 |
  db $A0                                    ; $1C8576 |
  db $A0                                    ; $1C8577 |
  db $A0                                    ; $1C8578 |
  db $A0                                    ; $1C8579 |
  db $A0                                    ; $1C857A |
  db $A0                                    ; $1C857B |
  db $A0                                    ; $1C857C |
  db $A0                                    ; $1C857D |
  db $A0                                    ; $1C857E |
  db $A0                                    ; $1C857F |
  db $A0                                    ; $1C8580 |
  db $A0                                    ; $1C8581 |
  db $A0                                    ; $1C8582 |
  db $A0                                    ; $1C8583 |
  db $A0                                    ; $1C8584 |
  db $A0                                    ; $1C8585 |
  db $A0                                    ; $1C8586 |
  db main_needle_man_j>>8                   ; $1C8587 |
  db main_magnet_man_j>>8                   ; $1C8588 |
  db main_top_man_j>>8                      ; $1C8589 |
  db main_shadow_man_j>>8                   ; $1C858A |
  db $A0                                    ; $1C858B |
  db $A0                                    ; $1C858C |
  db $A0                                    ; $1C858D |
  db $A0                                    ; $1C858E |
  db $A0                                    ; $1C858F |
  db $A0                                    ; $1C8590 |
  db $A0                                    ; $1C8591 |
  db $A0                                    ; $1C8592 |
  db $A0                                    ; $1C8593 |
  db $A0                                    ; $1C8594 |
  db $A0                                    ; $1C8595 |
  db $A0                                    ; $1C8596 |
  db main_hard_man_j>>8                     ; $1C8597 |
  db $A0                                    ; $1C8598 |
  db main_spark_man_j>>8                    ; $1C8599 |
  db $A0                                    ; $1C859A |
  db main_snake_man_j>>8                    ; $1C859B |
  db $A0                                    ; $1C859C |
  db main_gemini_man_j>>8                   ; $1C859D |
  db $A0                                    ; $1C859E |
  db $A0                                    ; $1C859F |
  db $A0                                    ; $1C85A0 |
  db $A0                                    ; $1C85A1 |
  db $A0                                    ; $1C85A2 |
  db $A0                                    ; $1C85A3 |
  db $A0                                    ; $1C85A4 |
  db $A0                                    ; $1C85A5 |
  db $A0                                    ; $1C85A6 |
  db main_yellow_devil>>8                   ; $1C85A7 |
  db $A0                                    ; $1C85A8 |
  db $A0                                    ; $1C85A9 |
  db main_wily_machine_A>>8                 ; $1C85AA |
  db $A0                                    ; $1C85AB |
  db main_wily_machine_B>>8                 ; $1C85AC |
  db $A0                                    ; $1C85AD |
  db main_gamma_B>>8                        ; $1C85AE |
  db $A0                                    ; $1C85AF |
  db $A0                                    ; $1C85B0 |
  db main_gamma_F>>8                        ; $1C85B1 |
  db main_teleporter>>8                     ; $1C85B2 |
  db $A0                                    ; $1C85B3 |
  db main_wily_machine_C>>8                 ; $1C85B4 |
  db $A0                                    ; $1C85B5 |
  db $A0                                    ; $1C85B6 |
  db main_kamegoro_maker>>8                 ; $1C85B7 |
  db $A0                                    ; $1C85B8 |
  db $A0                                    ; $1C85B9 |
  db main_kamegoro_current>>8               ; $1C85BA |
  db $A0                                    ; $1C85BB |
  db main_holograph>>8                      ; $1C85BC |
  db $A0                                    ; $1C85BD |
  db $A0                                    ; $1C85BE |
  db $A0                                    ; $1C85BF |
  db $A0                                    ; $1C85C0 |
  db $A0                                    ; $1C85C1 |
  db $A0                                    ; $1C85C2 |
  db main_giant_met>>8                      ; $1C85C3 |
  db $A0                                    ; $1C85C4 |
  db $A0                                    ; $1C85C5 |
  db $A0                                    ; $1C85C6 |

main_ret_A:
  RTS                                       ; $1C85C7 |

main_ret_B:
  RTS                                       ; $1C85C8 |

main_unknown_1B:
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
  JSR find_enemy_freeslot_y                 ; $1C85FB |
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

main_dada:
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
  JSR face_player                           ; $1C8B3A |
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

main_potton:
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
  JSR find_enemy_freeslot_y                 ; $1C8BA9 |
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
  JSR reset_gravity                         ; $1C8BE5 |
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

main_hammer_joe:
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
  JSR face_player                           ; $1C8C31 |
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
  JSR find_enemy_freeslot_y                 ; $1C8C80 |
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

main_bubukan:
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
  JSR find_enemy_freeslot_y                 ; $1C8D51 |
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
  JSR face_player                           ; $1C8DAE |
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

main_jamacy:
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

; handles both
main_bomb_flier_penpen:
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
  JSR check_sprite_weapon_collision         ; $1C8EB4 |
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

main_cloud_platform:
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
  JSR find_enemy_freeslot_y                 ; $1C9034 |
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

main_unknown_14:
  LDA $0500,x                               ; $1C9096 |
  BNE code_1C90DE                           ; $1C9099 |
  JSR find_enemy_freeslot_y                 ; $1C909B |
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
  JMP face_player                           ; $1C90DB |

code_1C90DE:
  DEC $0500,x                               ; $1C90DE |
  RTS                                       ; $1C90E1 |

; also 0D, not sure what these are
main_unknown_0C:
  LDA $0300,x                               ; $1C90E2 |
  AND #$0F                                  ; $1C90E5 |
  BNE code_1C90EF                           ; $1C90E7 |
  JSR reset_gravity                         ; $1C90E9 |
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
  JSR face_player                           ; $1C9136 |
  JSR reset_gravity                         ; $1C9139 |
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
  JSR face_player                           ; $1C9180 |
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

main_giant_springer:
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
  JSR find_enemy_freeslot_y                 ; $1C91B3 |
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
  JSR face_player                           ; $1C927D |
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

main_chibee:
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

main_electric_gabyoall:
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

main_junk_block:
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
  JSR find_enemy_freeslot_y                 ; $1C954F |
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

main_petit_snakey:
  LDA $0300,x                               ; $1C95E4 |
  AND #$0F                                  ; $1C95E7 |
  BNE code_1C95F9                           ; $1C95E9 |
  JSR code_1FF883                           ; $1C95EB |
  JSR face_player                           ; $1C95EE |
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
  JSR find_enemy_freeslot_y                 ; $1C9659 |
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

main_yambow:
  LDA $0300,x                               ; $1C96C5 |
  AND #$0F                                  ; $1C96C8 |
  BNE code_1C96E5                           ; $1C96CA |
  JSR code_1FF8C2                           ; $1C96CC |
  CMP #$51                                  ; $1C96CF |
  BCS code_1C9716                           ; $1C96D1 |
  JSR face_player                           ; $1C96D3 |
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
  JSR reset_gravity                         ; $1C973C |
  JSR face_player                           ; $1C973F |
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

main_met:
  LDA $0500,x                               ; $1C9783 |
  BEQ code_1C978D                           ; $1C9786 |
  DEC $0500,x                               ; $1C9788 |
  BNE code_1C97B3                           ; $1C978B |
code_1C978D:
  LDA $0300,x                               ; $1C978D |
  AND #$0F                                  ; $1C9790 |
  BNE code_1C97D1                           ; $1C9792 |
  JSR face_player                           ; $1C9794 |
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
  JSR find_enemy_freeslot_y                 ; $1C9823 |
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

main_pole:
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

main_cannon:
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
  JSR face_player                           ; $1C98DB |
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
  JSR find_enemy_freeslot_y                 ; $1C990F |
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

main_metall_dx:
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
  JSR face_player                           ; $1C99D7 |
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
  JSR face_player                           ; $1C9A32 |
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
  JSR find_enemy_freeslot_y                 ; $1C9A55 |
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

main_mag_fly:
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

main_junk_golem:
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
  JSR face_player                           ; $1C9B7C |
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
  JSR find_enemy_freeslot_y                 ; $1C9BE2 |
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

main_unknown_24:
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

main_pickelman_bull:
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

main_bikky:
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
  JSR face_player                           ; $1C9D75 |
  LDA #$C5                                  ; $1C9D78 |
  STA $0480,x                               ; $1C9D7A |
  RTS                                       ; $1C9D7D |

code_1C9D7E:
  LDA #$A5                                  ; $1C9D7E |
  STA $0480,x                               ; $1C9D80 |
  RTS                                       ; $1C9D83 |

main_magnet_force:
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

main_new_shotman:
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
  JSR face_player                           ; $1C9DDB |
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
  JSR find_enemy_freeslot_y                 ; $1C9E46 |
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
  JSR find_enemy_freeslot_y                 ; $1C9EA9 |
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
  JSR find_enemy_freeslot_y                 ; $1C9F78 |
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

main_proto_man:
  JSR $A249                                 ; $1C9FF7 |
  LDA $0560,x                               ; $1C9FFA |
  BEQ code_1C9FE2                           ; $1C9FFD |
  LDA $04E0,x                               ; $1C9FFF |

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

main_proto_man_gemini_cutscene:
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

main_hari_harry:
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

main_nitron:
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

main_unknown_27:
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

main_gyoraibo:
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

main_penpen_maker:
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

main_bomber_pepe:
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

main_bolton_and_nutton:
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

main_beehive:
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
  ADC bee_spawn_x_offset,y                  ; $1DAE57 |
  PHA                                       ; $1DAE5A |
  LDA $0380,x                               ; $1DAE5B |
  ADC bee_spawn_x_offset+1,y                ; $1DAE5E |
  LDY $00                                   ; $1DAE61 |
  STA $0380,y                               ; $1DAE63 |
  PLA                                       ; $1DAE66 |
  STA $0360,y                               ; $1DAE67 |
  LDY $01                                   ; $1DAE6A |
  LDA $03C0,x                               ; $1DAE6C |
  CLC                                       ; $1DAE6F |
  ADC bee_spawn_y_offset,y                  ; $1DAE70 |
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

; spawn offsets indexed by bee #
; screen and pixel (not sub)
bee_spawn_x_offset:
  dw $FFE8, $FFE8, $0001, $0018, $0018      ; $1DAEB4 |

; pixel
bee_spawn_y_offset:
  db $E8, $18, $01, $E8, $18                ; $1DAEBE |

main_returning_monking:
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

main_wanaan:
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

main_komasaburo:
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

main_mechakkero:
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

main_top_man_platform:
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

main_needle_press:
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

main_elecn:
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

main_peterchy:
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

main_walking_bomb:
  LDY #$1A                                  ; $1DB4C4 |
  JSR code_1FF67C                           ; $1DB4C6 |
  ROL $0F                                   ; $1DB4C9 |
  JSR check_sprite_weapon_collision         ; $1DB4CB |
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

main_hologran:
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

main_parasyu:
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

; entry point for all 8
main_doc_robot:
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

; same intro for all 8
main_robot_master_intro:
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
  LDA $0320,x                               ; $1DB89F |\
  AND #$07                                  ; $1DB8A2 | | fetch robot master's
  TAY                                       ; $1DB8A4 | | main routine index
  LDA robot_master_main_indices,y           ; $1DB8A5 | | morph this sprite into it
  STA $0320,x                               ; $1DB8A8 |/
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

robot_master_main_indices:
  db $C0, $C1, $D6, $D0, $C2, $D4, $D2, $C3 ; $1DB8C7 |

  db $B3, $00, $2D, $00, $00, $4C, $6D, $00 ; $1DB8CF |
  db $01, $00, $03, $01, $04, $01, $01, $04 ; $1DB8D7 |
  db $29, $1F, $33, $2C, $49, $22, $36, $3F ; $1DB8DF |
  db $04, $03, $05, $06, $02, $02, $08, $03 ; $1DB8E7 |
  db $1E, $1E, $00, $26, $1E, $00, $1E, $1E ; $1DB8EF |
  db $60                                    ; $1DB8F7 |

main_spinning_wheel:
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

main_trap_platform:
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

main_breakable_wall:
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
  JSR check_sprite_weapon_collision         ; $1DB9BE |
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

main_spark_falling_platform:
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

main_big_snakey:
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

init_tama:
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

main_tama_A:
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

main_tama_B:
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

main_item_pickup:
  LDY #$2C                                  ; $1DBDF9 |
  BNE code_1DBDFF                           ; $1DBDFB |

.large:
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

main_surprise_box:
  LDA $05C0,x                               ; $1DBED2 |
  CMP #$71                                  ; $1DBED5 |
  BEQ code_1DBF03                           ; $1DBED7 |
  JSR check_sprite_weapon_collision         ; $1DBED9 |
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
