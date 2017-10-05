bank $0C
org $8000

  LDA #$00                                  ; $0CA000 |
  STA $EE                                   ; $0C8002 |
  LDX #$B4                                  ; $0C8004 |
  JSR code_1FFF1A                           ; $0C8006 |
  JSR code_1EC752                           ; $0C8009 |
  LDA #$04                                  ; $0C800C |
  STA $97                                   ; $0C800E |
  JSR code_1EC5E9                           ; $0C8010 |
  JSR code_1EC628                           ; $0C8013 |
  JSR code_1FFF21                           ; $0C8016 |
  LDA #$F0                                  ; $0C8019 |
  JSR submit_sound_ID_D9                    ; $0C801B |
  LDA #$00                                  ; $0C801E |
  STA $B1                                   ; $0C8020 |
  STA $B2                                   ; $0C8022 |
  STA $B3                                   ; $0C8024 |
  STA $70                                   ; $0C8026 |
  STA $FD                                   ; $0C8028 |
  STA $FC                                   ; $0C802A |
  STA $F8                                   ; $0C802C |
  JSR code_1EC531                           ; $0C802E |
  LDA #$20                                  ; $0C8031 |
  LDX #$00                                  ; $0C8033 |
  LDY #$00                                  ; $0C8035 |
  JSR code_1EC59D                           ; $0C8037 |
  JSR code_1EC53B                           ; $0C803A |
  LDY #$1F                                  ; $0C803D |
code_0C803F:
  LDA $863E,y                               ; $0C803F |
  STA $0620,y                               ; $0C8042 |
  DEY                                       ; $0C8045 |
  BPL code_0C803F                           ; $0C8046 |
  LDY #$05                                  ; $0C8048 |
code_0C804A:
  LDA $8626,y                               ; $0C804A |
  STA $00E8,y                               ; $0C804D |
  DEY                                       ; $0C8050 |
  BPL code_0C804A                           ; $0C8051 |
  LDA #$66                                  ; $0C8053 |
  STA $E8                                   ; $0C8055 |
  JSR update_CHR_banks                      ; $0C8057 |
  JSR code_1FFF21                           ; $0C805A |
  LDA #$0D                                  ; $0C805D |
  STA $F5                                   ; $0C805F |
  JSR select_PRG_banks                      ; $0C8061 |
  LDX #$12                                  ; $0C8064 |
  LDA #$00                                  ; $0C8066 |
  STA $10                                   ; $0C8068 |
  JSR code_0C85F3                           ; $0C806A |
  JSR code_1FFF21                           ; $0C806D |
  JSR code_1EC74C                           ; $0C8070 |
  LDX #$F0                                  ; $0C8073 |
  JSR code_1FFF1A                           ; $0C8075 |
  JSR code_1EC752                           ; $0C8078 |
  LDA #$16                                  ; $0C807B |
  STA $22                                   ; $0C807D |
  LDA #$02                                  ; $0C807F |
  JSR code_1FE8B4                           ; $0C8081 |
code_0C8084:
  LDA #$00                                  ; $0C8084 |
  STA $10                                   ; $0C8086 |
  JSR code_1FEF8C                           ; $0C8088 |
  JSR code_1FFF21                           ; $0C808B |
  LDA $70                                   ; $0C808E |
  BNE code_0C8084                           ; $0C8090 |
  LDA #$78                                  ; $0C8092 |
  STA $E8                                   ; $0C8094 |
  JSR update_CHR_banks                      ; $0C8096 |
  LDY #$01                                  ; $0C8099 |
code_0C809B:
  LDA #$80                                  ; $0C809B |
  STA $0300,y                               ; $0C809D |
  LDA #$90                                  ; $0C80A0 |
  STA $0580,y                               ; $0C80A2 |
  LDA $86D0,y                               ; $0C80A5 |
  STA $05C0,y                               ; $0C80A8 |
  LDA $86D2,y                               ; $0C80AB |
  STA $0360,y                               ; $0C80AE |
  LDA $86D4,y                               ; $0C80B1 |
  STA $03C0,y                               ; $0C80B4 |
  LDA #$00                                  ; $0C80B7 |
  STA $0380,y                               ; $0C80B9 |
  STA $05E0,y                               ; $0C80BC |
  STA $05A0,y                               ; $0C80BF |
  STA $03E0,y                               ; $0C80C2 |
  STA $0440,y                               ; $0C80C5 |
  STA $0460,y                               ; $0C80C8 |
  DEY                                       ; $0C80CB |
  BPL code_0C809B                           ; $0C80CC |
  LDY #$07                                  ; $0C80CE |
code_0C80D0:
  LDA $869E,y                               ; $0C80D0 |
  STA $0200,y                               ; $0C80D3 |
  DEY                                       ; $0C80D6 |
  BPL code_0C80D0                           ; $0C80D7 |
  LDA #$11                                  ; $0C80D9 |
  STA $F8                                   ; $0C80DB |
  LDA #$C0                                  ; $0C80DD |
  STA $5E                                   ; $0C80DF |
  JSR code_1FFF21                           ; $0C80E1 |
  JSR code_1EC74C                           ; $0C80E4 |
  LDA #$00                                  ; $0C80E7 |
  STA $0104                                 ; $0C80E9 |
  STA $0520                                 ; $0C80EC |
  STA $B8                                   ; $0C80EF |
  LDA #$0B                                  ; $0C80F1 |
  STA $0500                                 ; $0C80F3 |
code_0C80F6:
  LDA $0360                                 ; $0C80F6 |
  CMP #$D0                                  ; $0C80F9 |
  BNE code_0C813F                           ; $0C80FB |
  LDA #$13                                  ; $0C80FD |
  CMP $05C0                                 ; $0C80FF |
  BEQ code_0C810C                           ; $0C8102 |
  LDX #$00                                  ; $0C8104 |
  JSR reset_sprite_anim                     ; $0C8106 |
  INC $05A0                                 ; $0C8109 |
code_0C810C:
  LDA $05A0                                 ; $0C810C |
  BNE code_0C813C                           ; $0C810F |
  STA $05E0                                 ; $0C8111 |
  LDA $03A0                                 ; $0C8114 |
  SEC                                       ; $0C8117 |
  SBC $0440                                 ; $0C8118 |
  STA $03A0                                 ; $0C811B |
  LDA $03C0                                 ; $0C811E |
  SBC $0460                                 ; $0C8121 |
  STA $03C0                                 ; $0C8124 |
  BCS code_0C812C                           ; $0C8127 |
  JMP code_0C81E1                           ; $0C8129 |

code_0C812C:
  LDA $0440                                 ; $0C812C |
  ADC #$3F                                  ; $0C812F |
  STA $0440                                 ; $0C8131 |
  LDA $0460                                 ; $0C8134 |
  ADC #$00                                  ; $0C8137 |
  STA $0460                                 ; $0C8139 |
code_0C813C:
  JMP code_0C81AA                           ; $0C813C |

code_0C813F:
  LDA $0520                                 ; $0C813F |
  BNE code_0C817F                           ; $0C8142 |
  LDA #$0E                                  ; $0C8144 |
  CMP $0500                                 ; $0C8146 |
  BEQ code_0C8193                           ; $0C8149 |
  STA $F5                                   ; $0C814B |
  JSR select_PRG_banks                      ; $0C814D |
  LDA $95                                   ; $0C8150 |
  AND #$03                                  ; $0C8152 |
  BNE code_0C81AA                           ; $0C8154 |
  LDA $B8                                   ; $0C8156 |
  BNE code_0C816C                           ; $0C8158 |
  LDX $0500                                 ; $0C815A |
  CPX #$0C                                  ; $0C815D |
  BNE code_0C8166                           ; $0C815F |
  LDA #$12                                  ; $0C8161 |
  JSR submit_sound_ID_D9                    ; $0C8163 |
code_0C8166:
  JSR $A006                                 ; $0C8166 |
  JMP code_0C81AA                           ; $0C8169 |

code_0C816C:
  JSR $A003                                 ; $0C816C |
  LDA $B8                                   ; $0C816F |
  CMP #$FF                                  ; $0C8171 |
  BNE code_0C81AA                           ; $0C8173 |
  INC $0500                                 ; $0C8175 |
  LDA #$B4                                  ; $0C8178 |
  STA $0520                                 ; $0C817A |
  BNE code_0C81AA                           ; $0C817D |
code_0C817F:
  LDA #$00                                  ; $0C817F |
  STA $05E1                                 ; $0C8181 |
  DEC $0520                                 ; $0C8184 |
  BNE code_0C81AA                           ; $0C8187 |
  STA $B8                                   ; $0C8189 |
  STA $EE                                   ; $0C818B |
  JSR $A000                                 ; $0C818D |
  JMP code_0C81AA                           ; $0C8190 |

code_0C8193:
  INC $0360                                 ; $0C8193 |
  LDA #$04                                  ; $0C8196 |
  CMP $05C0                                 ; $0C8198 |
  BEQ code_0C81AA                           ; $0C819B |
  LDX #$00                                  ; $0C819D |
  JSR reset_sprite_anim                     ; $0C819F |
  LDA $0580                                 ; $0C81A2 |
  ORA #$40                                  ; $0C81A5 |
  STA $0580                                 ; $0C81A7 |
code_0C81AA:
  LDA $95                                   ; $0C81AA |
  AND #$03                                  ; $0C81AC |
  BNE code_0C81D7                           ; $0C81AE |
  LDA $0104                                 ; $0C81B0 |
  ASL                                       ; $0C81B3 |
  ADC $0104                                 ; $0C81B4 |
  TAY                                       ; $0C81B7 |
  LDX #$05                                  ; $0C81B8 |
code_0C81BA:
  LDA $86D6,y                               ; $0C81BA |
  STA $0600,x                               ; $0C81BD |
  INY                                       ; $0C81C0 |
  INX                                       ; $0C81C1 |
  CPX #$08                                  ; $0C81C2 |
  BNE code_0C81BA                           ; $0C81C4 |
  STX $18                                   ; $0C81C6 |
  INC $0104                                 ; $0C81C8 |
  LDA $0104                                 ; $0C81CB |
  CMP #$06                                  ; $0C81CE |
  BNE code_0C81D7                           ; $0C81D0 |
  LDA #$00                                  ; $0C81D2 |
  STA $0104                                 ; $0C81D4 |
code_0C81D7:
  LDA #$08                                  ; $0C81D7 |
  STA $97                                   ; $0C81D9 |
  JSR code_1FFD80                           ; $0C81DB |
  JMP code_0C80F6                           ; $0C81DE |

code_0C81E1:
  LDA #$00                                  ; $0C81E1 |
  STA $EE                                   ; $0C81E3 |
  JSR code_1EC752                           ; $0C81E5 |
  LDA #$04                                  ; $0C81E8 |
  STA $97                                   ; $0C81EA |
  JSR code_1EC5E9                           ; $0C81EC |
  JSR code_1EC628                           ; $0C81EF |
  JSR code_1FFF21                           ; $0C81F2 |
  LDA #$00                                  ; $0C81F5 |
  STA $A000                                 ; $0C81F7 |
  LDY #$0F                                  ; $0C81FA |
code_0C81FC:
  LDA $865E,y                               ; $0C81FC |
  STA $0620,y                               ; $0C81FF |
  DEY                                       ; $0C8202 |
  BPL code_0C81FC                           ; $0C8203 |
  LDA #$22                                  ; $0C8205 |
  STA $0630                                 ; $0C8207 |
  LDA #$14                                  ; $0C820A |
  STA $22                                   ; $0C820C |
  LDA #$00                                  ; $0C820E |
  JSR code_1FE8B4                           ; $0C8210 |
code_0C8213:
  LDA #$04                                  ; $0C8213 |
  STA $10                                   ; $0C8215 |
  JSR code_1FEF8C                           ; $0C8217 |
  JSR code_1FFF21                           ; $0C821A |
  LDA $70                                   ; $0C821D |
  BNE code_0C8213                           ; $0C821F |
  LDA #$01                                  ; $0C8221 |
  JSR code_1FE8B4                           ; $0C8223 |
code_0C8226:
  LDA #$00                                  ; $0C8226 |
  STA $10                                   ; $0C8228 |
  JSR code_1FEF8C                           ; $0C822A |
  JSR code_1FFF21                           ; $0C822D |
  LDA $70                                   ; $0C8230 |
  BNE code_0C8226                           ; $0C8232 |
  LDY #$05                                  ; $0C8234 |
code_0C8236:
  LDA $862C,y                               ; $0C8236 |
  STA $00E8,y                               ; $0C8239 |
  DEY                                       ; $0C823C |
  BPL code_0C8236                           ; $0C823D |
  JSR update_CHR_banks                      ; $0C823F |
  LDA #$34                                  ; $0C8242 |
  STA $03C0                                 ; $0C8244 |
  LDA #$F8                                  ; $0C8247 |
  STA $0360                                 ; $0C8249 |
  LDA #$80                                  ; $0C824C |
  STA $0580                                 ; $0C824E |
  LDX #$00                                  ; $0C8251 |
  LDA #$04                                  ; $0C8253 |
  JSR reset_sprite_anim                     ; $0C8255 |
  LDA #$05                                  ; $0C8258 |
  STA $FD                                   ; $0C825A |
  LDA #$01                                  ; $0C825C |
  STA $29                                   ; $0C825E |
  STA $6B                                   ; $0C8260 |
  LDA #$1F                                  ; $0C8262 |
  STA $28                                   ; $0C8264 |
  LDA #$0D                                  ; $0C8266 |
  STA $F5                                   ; $0C8268 |
  JSR select_PRG_banks                      ; $0C826A |
  LDA #$04                                  ; $0C826D |
  STA $10                                   ; $0C826F |
  LDX #$00                                  ; $0C8271 |
  JSR code_0C85F3                           ; $0C8273 |
  JSR code_1FFF21                           ; $0C8276 |
  LDX #$01                                  ; $0C8279 |
  JSR code_0C85F3                           ; $0C827B |
  JSR code_1FFF21                           ; $0C827E |
  LDX #$10                                  ; $0C8281 |
  JSR code_0C85F3                           ; $0C8283 |
  JSR code_1FFF21                           ; $0C8286 |
  LDX #$11                                  ; $0C8289 |
  JSR code_0C85F3                           ; $0C828B |
  JSR code_1FFF21                           ; $0C828E |
  LDX #$06                                  ; $0C8291 |
  JSR code_0C85F3                           ; $0C8293 |
  LDA #$0F                                  ; $0C8296 |
  STA $F8                                   ; $0C8298 |
  LDA #$40                                  ; $0C829A |
  STA $5E                                   ; $0C829C |
  LDA #$00                                  ; $0C829E |
  STA $69                                   ; $0C82A0 |
  STA $6A                                   ; $0C82A2 |
  STA $0500                                 ; $0C82A4 |
  STA $0520                                 ; $0C82A7 |
  STA $0540                                 ; $0C82AA |
  STA $0560                                 ; $0C82AD |
  JSR code_1FFF21                           ; $0C82B0 |
  JSR code_1EC74C                           ; $0C82B3 |
code_0C82B6:
  LDA $0360                                 ; $0C82B6 |
  CMP #$80                                  ; $0C82B9 |
  BEQ code_0C82C9                           ; $0C82BB |
  LDA $95                                   ; $0C82BD |
  AND #$01                                  ; $0C82BF |
  BNE code_0C82C6                           ; $0C82C1 |
  DEC $0360                                 ; $0C82C3 |
code_0C82C6:
  JMP code_0C8354                           ; $0C82C6 |

code_0C82C9:
  LDA $FC                                   ; $0C82C9 |
  ORA $FD                                   ; $0C82CB |
  BNE code_0C82D9                           ; $0C82CD |
  LDX #$00                                  ; $0C82CF |
  LDA #$64                                  ; $0C82D1 |
  JSR reset_sprite_anim                     ; $0C82D3 |
  JMP code_0C836D                           ; $0C82D6 |

code_0C82D9:
  DEC $69                                   ; $0C82D9 |
  LDA $95                                   ; $0C82DB |
  AND #$01                                  ; $0C82DD |
  BNE code_0C82F9                           ; $0C82DF |
  LDA $FC                                   ; $0C82E1 |
  SEC                                       ; $0C82E3 |
  SBC #$01                                  ; $0C82E4 |
  STA $FC                                   ; $0C82E6 |
  PHA                                       ; $0C82E8 |
  LDA $FD                                   ; $0C82E9 |
  SBC #$00                                  ; $0C82EB |
  STA $FD                                   ; $0C82ED |
  PLA                                       ; $0C82EF |
  AND #$03                                  ; $0C82F0 |
  CMP #$03                                  ; $0C82F2 |
  BNE code_0C82F9                           ; $0C82F4 |
  JSR code_0C85BD                           ; $0C82F6 |
code_0C82F9:
  LDA $0500                                 ; $0C82F9 |
  BNE code_0C8335                           ; $0C82FC |
  LDA $6A                                   ; $0C82FE |
  SEC                                       ; $0C8300 |
  SBC #$04                                  ; $0C8301 |
  STA $6A                                   ; $0C8303 |
  LDA $6B                                   ; $0C8305 |
  SBC #$00                                  ; $0C8307 |
  AND #$01                                  ; $0C8309 |
  STA $6B                                   ; $0C830B |
  BEQ code_0C8354                           ; $0C830D |
  LDA $6A                                   ; $0C830F |
  BNE code_0C833B                           ; $0C8311 |
  LDA #$A1                                  ; $0C8313 |
  STA $0500                                 ; $0C8315 |
  LDA #$0D                                  ; $0C8318 |
  STA $F5                                   ; $0C831A |
  JSR select_PRG_banks                      ; $0C831C |
  JSR $A000                                 ; $0C831F |
  LDA #$00                                  ; $0C8322 |
  STA $0520                                 ; $0C8324 |
  LDA #$04                                  ; $0C8327 |
  STA $10                                   ; $0C8329 |
  LDA $0540                                 ; $0C832B |
  CLC                                       ; $0C832E |
  ADC #$06                                  ; $0C832F |
  TAX                                       ; $0C8331 |
  JSR code_0C85F3                           ; $0C8332 |
code_0C8335:
  DEC $0500                                 ; $0C8335 |
  JMP code_0C8354                           ; $0C8338 |

code_0C833B:
  LDA $19                                   ; $0C833B |
  BNE code_0C8354                           ; $0C833D |
  LDA $0520                                 ; $0C833F |
  CMP #$04                                  ; $0C8342 |
  BEQ code_0C8354                           ; $0C8344 |
  INC $0520                                 ; $0C8346 |
  CLC                                       ; $0C8349 |
  ADC #$02                                  ; $0C834A |
  TAX                                       ; $0C834C |
  LDA #$04                                  ; $0C834D |
  STA $10                                   ; $0C834F |
  JSR code_0C85F3                           ; $0C8351 |
code_0C8354:
  LDA $0500                                 ; $0C8354 |
  BNE code_0C8362                           ; $0C8357 |
  LDA #$04                                  ; $0C8359 |
  STA $97                                   ; $0C835B |
  STA $0560                                 ; $0C835D |
  BNE code_0C8367                           ; $0C8360 |
code_0C8362:
  LDA $0560                                 ; $0C8362 |
  STA $97                                   ; $0C8365 |
code_0C8367:
  JSR code_1FFD80                           ; $0C8367 |
  JMP code_0C82B6                           ; $0C836A |

code_0C836D:
  LDA $0560                                 ; $0C836D |
  STA $97                                   ; $0C8370 |
  JSR code_1FFD80                           ; $0C8372 |
  LDA $05A0                                 ; $0C8375 |
  BEQ code_0C836D                           ; $0C8378 |
  LDA #$00                                  ; $0C837A |
  STA $05E0                                 ; $0C837C |
  LDX #$78                                  ; $0C837F |
  JSR code_1FFF1A                           ; $0C8381 |
  LDA #$10                                  ; $0C8384 |
  STA $F8                                   ; $0C8386 |
  LDA #$88                                  ; $0C8388 |
  STA $5E                                   ; $0C838A |
code_0C838C:
  INC $5E                                   ; $0C838C |
  LDA $5E                                   ; $0C838E |
  CMP #$E8                                  ; $0C8390 |
  BEQ code_0C839F                           ; $0C8392 |
  JSR code_1FFD6E                           ; $0C8394 |
  LDA #$00                                  ; $0C8397 |
  STA $05E0                                 ; $0C8399 |
  JMP code_0C838C                           ; $0C839C |

code_0C839F:
  LDA #$01                                  ; $0C839F |
  STA $A000                                 ; $0C83A1 |
  LDA #$00                                  ; $0C83A4 |
  STA $EE                                   ; $0C83A6 |
  STA $F8                                   ; $0C83A8 |
  LDA #$06                                  ; $0C83AA |
  JSR code_1FE8B4                           ; $0C83AC |
code_0C83AF:
  LDA #$08                                  ; $0C83AF |
  STA $10                                   ; $0C83B1 |
  JSR code_1FEF8C                           ; $0C83B3 |
  JSR code_1FFF21                           ; $0C83B6 |
  LDA $70                                   ; $0C83B9 |
  BNE code_0C83AF                           ; $0C83BB |
  LDA #$02                                  ; $0C83BD |
  STA $FD                                   ; $0C83BF |
  LDA #$EF                                  ; $0C83C1 |
  STA $FA                                   ; $0C83C3 |
code_0C83C5:
  INC $03C0                                 ; $0C83C5 |
  DEC $FA                                   ; $0C83C8 |
  LDA $FA                                   ; $0C83CA |
  CMP #$70                                  ; $0C83CC |
  BEQ code_0C83DB                           ; $0C83CE |
  LDA #$00                                  ; $0C83D0 |
  STA $05E0                                 ; $0C83D2 |
  JSR code_1FFD6E                           ; $0C83D5 |
  JMP code_0C83C5                           ; $0C83D8 |

code_0C83DB:
  LDA #$65                                  ; $0C83DB |
  STA $05C0                                 ; $0C83DD |
  LDA #$00                                  ; $0C83E0 |
  STA $05E0                                 ; $0C83E2 |
  STA $05A0                                 ; $0C83E5 |
  LDY #$01                                  ; $0C83E8 |
code_0C83EA:
  LDA #$80                                  ; $0C83EA |
  STA $0301,y                               ; $0C83EC |
  STA $0581,y                               ; $0C83EF |
  LDA $86A6,y                               ; $0C83F2 |
  STA $05C1,y                               ; $0C83F5 |
  LDA #$00                                  ; $0C83F8 |
  STA $05E1,y                               ; $0C83FA |
  STA $05A1,y                               ; $0C83FD |
  STA $03E1,y                               ; $0C8400 |
  STA $0381,y                               ; $0C8403 |
  STA $0501,y                               ; $0C8406 |
  STA $0521,y                               ; $0C8409 |
  LDA $86A8,y                               ; $0C840C |
  STA $03C1,y                               ; $0C840F |
  LDA $86AA,y                               ; $0C8412 |
  STA $0361,y                               ; $0C8415 |
  DEY                                       ; $0C8418 |
  BPL code_0C83EA                           ; $0C8419 |
  LDA #$08                                  ; $0C841B |
  STA $0522                                 ; $0C841D |
  LDY #$07                                  ; $0C8420 |
code_0C8422:
  LDA $86B0,y                               ; $0C8422 |
  STA $0618,y                               ; $0C8425 |
  STA $0638,y                               ; $0C8428 |
  DEY                                       ; $0C842B |
  BPL code_0C8422                           ; $0C842C |
  STY $18                                   ; $0C842E |
code_0C8430:
  LDA $95                                   ; $0C8430 |
  AND #$01                                  ; $0C8432 |
  BNE code_0C8460                           ; $0C8434 |
  DEC $0362                                 ; $0C8436 |
  LDA $0362                                 ; $0C8439 |
  CMP #$B8                                  ; $0C843C |
  BEQ code_0C8466                           ; $0C843E |
  LDA $0502                                 ; $0C8440 |
  AND #$03                                  ; $0C8443 |
  TAY                                       ; $0C8445 |
  LDA $86AC,y                               ; $0C8446 |
  BNE code_0C8450                           ; $0C8449 |
  DEC $03C2                                 ; $0C844B |
  BNE code_0C8453                           ; $0C844E |
code_0C8450:
  INC $03C2                                 ; $0C8450 |
code_0C8453:
  DEC $0522                                 ; $0C8453 |
  BNE code_0C8460                           ; $0C8456 |
  LDA #$08                                  ; $0C8458 |
  STA $0522                                 ; $0C845A |
  INC $0502                                 ; $0C845D |
code_0C8460:
  JSR code_1FFD6E                           ; $0C8460 |
  JMP code_0C8430                           ; $0C8463 |

code_0C8466:
  LDX #$F0                                  ; $0C8466 |
  JSR code_1FFF1A                           ; $0C8468 |
  LDA #$00                                  ; $0C846B |
  STA $EE                                   ; $0C846D |
  JSR code_1EC752                           ; $0C846F |
  LDA #$04                                  ; $0C8472 |
  STA $97                                   ; $0C8474 |
  JSR code_1EC5E9                           ; $0C8476 |
  JSR code_1EC628                           ; $0C8479 |
  JSR code_1FFF21                           ; $0C847C |
  LDA #$00                                  ; $0C847F |
  STA $A000                                 ; $0C8481 |
  STA $0300                                 ; $0C8484 |
  LDA #$0F                                  ; $0C8487 |
  JSR submit_sound_ID_D9                    ; $0C8489 |
  LDA #$13                                  ; $0C848C |
  STA $F5                                   ; $0C848E |
  STA $22                                   ; $0C8490 |
  JSR select_PRG_banks                      ; $0C8492 |
  LDA #$03                                  ; $0C8495 |
  JSR code_1FE8B4                           ; $0C8497 |
  LDA #$00                                  ; $0C849A |
  STA $70                                   ; $0C849C |
code_0C849E:
  LDA #$00                                  ; $0C849E |
  STA $10                                   ; $0C84A0 |
  JSR code_1FEF8C                           ; $0C84A2 |
  JSR code_1FFF21                           ; $0C84A5 |
  LDA $70                                   ; $0C84A8 |
  BNE code_0C849E                           ; $0C84AA |
  JSR code_1EC531                           ; $0C84AC |
  LDA #$24                                  ; $0C84AF |
  LDX #$24                                  ; $0C84B1 |
  LDY #$00                                  ; $0C84B3 |
  JSR code_1EC59D                           ; $0C84B5 |
  JSR code_1EC53B                           ; $0C84B8 |
  JSR code_1FFF21                           ; $0C84BB |
  LDY #$05                                  ; $0C84BE |
code_0C84C0:
  LDA $8632,y                               ; $0C84C0 |
  STA $00E8,y                               ; $0C84C3 |
  DEY                                       ; $0C84C6 |
  BPL code_0C84C0                           ; $0C84C7 |
  JSR update_CHR_banks                      ; $0C84C9 |
  LDY #$0F                                  ; $0C84CC |
code_0C84CE:
  LDA $866E,y                               ; $0C84CE |
  STA $0620,y                               ; $0C84D1 |
  DEY                                       ; $0C84D4 |
  BPL code_0C84CE                           ; $0C84D5 |
  LDA #$0F                                  ; $0C84D7 |
  STA $0630                                 ; $0C84D9 |
  LDA #$00                                  ; $0C84DC |
  STA $FC                                   ; $0C84DE |
  STA $FD                                   ; $0C84E0 |
  STA $FA                                   ; $0C84E2 |
  STA $10                                   ; $0C84E4 |
  LDX #$13                                  ; $0C84E6 |
  JSR code_0C85F3                           ; $0C84E8 |
  JSR code_1FFF21                           ; $0C84EB |
  JSR code_1EC74C                           ; $0C84EE |
  LDX #$B4                                  ; $0C84F1 |
  JSR code_1FFF1A                           ; $0C84F3 |
  LDA #$00                                  ; $0C84F6 |
  STA $0500                                 ; $0C84F8 |
  LDA #$80                                  ; $0C84FB |
  STA $0310                                 ; $0C84FD |
  STA $0590                                 ; $0C8500 |
  STA $5A                                   ; $0C8503 |
  LDA #$70                                  ; $0C8505 |
  STA $03D0                                 ; $0C8507 |
  LDA #$58                                  ; $0C850A |
  STA $0370                                 ; $0C850C |
code_0C850F:
  LDA #$00                                  ; $0C850F |
  STA $10                                   ; $0C8511 |
  STA $0310                                 ; $0C8513 |
  LDX #$14                                  ; $0C8516 |
  JSR code_0C85F3                           ; $0C8518 |
  JSR code_1FFF21                           ; $0C851B |
  LDA #$01                                  ; $0C851E |
  STA $F5                                   ; $0C8520 |
  JSR select_PRG_banks                      ; $0C8522 |
  LDX $0500                                 ; $0C8525 |
  LDA $86B8,x                               ; $0C8528 |
  STA $05D0                                 ; $0C852B |
  LDA #$00                                  ; $0C852E |
  STA $05F0                                 ; $0C8530 |
  STA $05B0                                 ; $0C8533 |
  LDA $86C0,x                               ; $0C8536 |
  JSR $A000                                 ; $0C8539 |
  JSR update_CHR_banks                      ; $0C853C |
  LDA #$80                                  ; $0C853F |
  STA $0310                                 ; $0C8541 |
code_0C8544:
  JSR code_1FFD6E                           ; $0C8544 |
  LDX $0500                                 ; $0C8547 |
  LDA $86C8,x                               ; $0C854A |
  CMP $05B0                                 ; $0C854D |
  BNE code_0C8544                           ; $0C8550 |
  LDA #$00                                  ; $0C8552 |
  STA $EE                                   ; $0C8554 |
  LDA #$0E                                  ; $0C8556 |
  STA $F5                                   ; $0C8558 |
  JSR select_PRG_banks                      ; $0C855A |
  LDX $0500                                 ; $0C855D |
  JSR $A006                                 ; $0C8560 |
  JSR code_1FFF21                           ; $0C8563 |
code_0C8566:
  JSR $A003                                 ; $0C8566 |
  LDA $B8                                   ; $0C8569 |
  CMP #$FF                                  ; $0C856B |
  BEQ code_0C8577                           ; $0C856D |
  LDX #$04                                  ; $0C856F |
  JSR code_1FFF1A                           ; $0C8571 |
  JMP code_0C8566                           ; $0C8574 |

code_0C8577:
  LDX #$B4                                  ; $0C8577 |
  JSR code_1FFF1A                           ; $0C8579 |
  INC $0500                                 ; $0C857C |
  LDA $0500                                 ; $0C857F |
  CMP #$08                                  ; $0C8582 |
  BEQ code_0C8589                           ; $0C8584 |
  JMP code_0C850F                           ; $0C8586 |

code_0C8589:
  LDY #$1F                                  ; $0C8589 |
code_0C858B:
  LDA $867E,y                               ; $0C858B |
  STA $0600,y                               ; $0C858E |
  DEY                                       ; $0C8591 |
  BPL code_0C858B                           ; $0C8592 |
  STY $18                                   ; $0C8594 |
  LDY #$05                                  ; $0C8596 |
code_0C8598:
  LDA $8638,y                               ; $0C8598 |
  STA $00E8,y                               ; $0C859B |
  DEY                                       ; $0C859E |
  BPL code_0C8598                           ; $0C859F |
  JSR update_CHR_banks                      ; $0C85A1 |
  LDA #$04                                  ; $0C85A4 |
  STA $97                                   ; $0C85A6 |
  JSR code_1EC5E9                           ; $0C85A8 |
  LDA #$00                                  ; $0C85AB |
  STA $B8                                   ; $0C85AD |
  LDA #$01                                  ; $0C85AF |
  STA $FD                                   ; $0C85B1 |
  LDA #$0F                                  ; $0C85B3 |
  STA $F5                                   ; $0C85B5 |
  JSR select_PRG_banks                      ; $0C85B7 |
  JMP $A000                                 ; $0C85BA |

code_0C85BD:
  LDA $28                                   ; $0C85BD |
  PHA                                       ; $0C85BF |
  LSR                                       ; $0C85C0 |
  LSR                                       ; $0C85C1 |
  LSR                                       ; $0C85C2 |
  AND #$07                                  ; $0C85C3 |
  STA $00                                   ; $0C85C5 |
  LDA $28                                   ; $0C85C7 |
  ASL                                       ; $0C85C9 |
  ASL                                       ; $0C85CA |
  ASL                                       ; $0C85CB |
  AND #$38                                  ; $0C85CC |
  ORA $00                                   ; $0C85CE |
  STA $28                                   ; $0C85D0 |
  CMP #$10                                  ; $0C85D2 |
  BCS code_0C85E5                           ; $0C85D4 |
  LDA $29                                   ; $0C85D6 |
  EOR #$01                                  ; $0C85D8 |
  ASL                                       ; $0C85DA |
  ASL                                       ; $0C85DB |
  AND #$04                                  ; $0C85DC |
  STA $10                                   ; $0C85DE |
  LDY $29                                   ; $0C85E0 |
  JSR code_1FEEAB                           ; $0C85E2 |
code_0C85E5:
  PLA                                       ; $0C85E5 |
  STA $28                                   ; $0C85E6 |
  DEC $28                                   ; $0C85E8 |
  BPL code_0C85F2                           ; $0C85EA |
  LDA #$3F                                  ; $0C85EC |
  STA $28                                   ; $0C85EE |
  INC $29                                   ; $0C85F0 |
code_0C85F2:
  RTS                                       ; $0C85F2 |

code_0C85F3:
  LDA $8903,x                               ; $0C85F3 |
  STA $02                                   ; $0C85F6 |
  LDA $8918,x                               ; $0C85F8 |
  STA $03                                   ; $0C85FB |
  LDY #$00                                  ; $0C85FD |
code_0C85FF:
  LDA ($02),y                               ; $0C85FF |
  ORA $10                                   ; $0C8601 |
  STA $0780,y                               ; $0C8603 |
  BMI code_0C8623                           ; $0C8606 |
  INY                                       ; $0C8608 |
  LDA ($02),y                               ; $0C8609 |
  STA $0780,y                               ; $0C860B |
  INY                                       ; $0C860E |
  LDA ($02),y                               ; $0C860F |
  STA $0780,y                               ; $0C8611 |
  STA $00                                   ; $0C8614 |
  INY                                       ; $0C8616 |
code_0C8617:
  LDA ($02),y                               ; $0C8617 |
  STA $0780,y                               ; $0C8619 |
  INY                                       ; $0C861C |
  DEC $00                                   ; $0C861D |
  BPL code_0C8617                           ; $0C861F |
  BMI code_0C85FF                           ; $0C8621 |
code_0C8623:
  STA $19                                   ; $0C8623 |
  RTS                                       ; $0C8625 |

  db $78, $7A, $00, $01, $1B, $3B, $78, $7A ; $0C8626 |
  db $00, $79, $3E, $3F, $7C, $7E, $00, $79 ; $0C862E |
  db $3E, $3F, $7C, $7E, $00, $03, $15, $17 ; $0C8636 |
  db $0F, $20, $2C, $1C, $0F, $1C, $27, $16 ; $0C863E |
  db $0F, $3B, $2B, $1B, $0F, $32, $22, $12 ; $0C8646 |
  db $0F, $0F, $2C, $11, $0F, $0F, $30, $37 ; $0C864E |
  db $0F, $35, $25, $15, $0F, $0F, $30, $11 ; $0C8656 |
  db $0F, $0F, $1C, $21, $0F, $20, $21, $1C ; $0C865E |
  db $0F, $2A, $1A, $0A, $0F, $0F, $08, $0A ; $0C8666 |
  db $0F, $20, $21, $11, $0F, $27, $17, $06 ; $0C866E |
  db $0F, $27, $17, $21, $0F, $20, $10, $21 ; $0C8676 |
  db $0F, $20, $0F, $0F, $0F, $20, $0F, $0F ; $0C867E |
  db $0F, $20, $0F, $0F, $0F, $20, $0F, $0F ; $0C8686 |
  db $0F, $0F, $30, $15, $0F, $0F, $30, $37 ; $0C868E |
  db $0F, $0F, $30, $19, $0F, $0F, $30, $16 ; $0C8696 |
  db $68, $BE, $02, $18, $68, $BF, $02, $20 ; $0C869E |
  db $66, $63, $38, $10, $30, $F8, $00, $FF ; $0C86A6 |
  db $FF, $00, $0F, $2C, $2C, $2C, $0F, $3C ; $0C86AE |
  db $2C, $1C, $26, $1F, $32, $2B, $45, $22 ; $0C86B6 |
  db $36, $3F, $25, $23, $27, $24, $2A, $26 ; $0C86BE |
  db $28, $29, $04, $03, $05, $06, $02, $02 ; $0C86C6 |
  db $08, $03, $01, $60, $98, $58, $A4, $A4 ; $0C86CE |
  db $1C, $27, $16, $0F, $1C, $1A, $16, $0F ; $0C86D6 |
  db $0F, $0F, $1A, $16, $17, $0F, $0F, $1A ; $0C86DE |
  db $16, $0F, $26, $46, $13, $6C, $6D, $EE ; $0C86E6 |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $EE ; $0C86EE |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $6E ; $0C86F6 |
  db $6F, $26, $66, $13, $7C, $EE, $EE, $EE ; $0C86FE |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $EE ; $0C8706 |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $7F ; $0C870E |
  db $26, $86, $13, $EE, $EE, $00, $00, $00 ; $0C8716 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C871E |
  db $00, $00, $00, $00, $00, $EE, $EE, $FF ; $0C8726 |
  db $26, $A5, $14, $7D, $7E, $EE, $00, $00 ; $0C872E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8736 |
  db $00, $00, $00, $00, $00, $00, $EE, $EE ; $0C873E |
  db $26, $C6, $13, $EE, $EE, $00, $00, $00 ; $0C8746 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C874E |
  db $00, $00, $00, $00, $00, $EE, $EE, $26 ; $0C8756 |
  db $E6, $13, $EE, $EE, $00, $00, $00, $00 ; $0C875E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8766 |
  db $00, $00, $00, $00, $EE, $EE, $FF, $27 ; $0C876E |
  db $05, $14, $7D, $7E, $EE, $00, $00, $00 ; $0C8776 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C877E |
  db $00, $00, $00, $00, $00, $EE, $EE, $FF ; $0C8786 |
  db $27, $26, $13, $EE, $EE, $EE, $EE, $EE ; $0C878E |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $EE ; $0C8796 |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $27 ; $0C879E |
  db $46, $13, $EC, $EE, $EE, $EE, $EE, $EE ; $0C87A6 |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $EE ; $0C87AE |
  db $EE, $EE, $EE, $EE, $EE, $EF, $27, $66 ; $0C87B6 |
  db $13, $FC, $FD, $EE, $EE, $EE, $EE, $EE ; $0C87BE |
  db $EE, $EE, $EE, $EE, $EE, $EE, $EE, $EE ; $0C87C6 |
  db $EE, $EE, $EE, $FE, $FF, $FF, $26, $46 ; $0C87CE |
  db $13, $00, $00, $00, $00, $00, $00, $00 ; $0C87D6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C87DE |
  db $00, $00, $00, $00, $00, $26, $66, $13 ; $0C87E6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C87EE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C87F6 |
  db $00, $00, $00, $00, $26, $86, $13, $00 ; $0C87FE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8806 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C880E |
  db $00, $00, $00, $FF, $26, $A5, $14, $7D ; $0C8816 |
  db $ED, $00, $7B, $7B, $7B, $7B, $00, $00 ; $0C881E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8826 |
  db $00, $00, $00, $00, $26, $C6, $13, $00 ; $0C882E |
  db $00, $7B, $7B, $7B, $7B, $00, $79, $79 ; $0C8836 |
  db $79, $79, $79, $79, $79, $79, $79, $79 ; $0C883E |
  db $79, $79, $00, $26, $E6, $13, $00, $00 ; $0C8846 |
  db $7B, $7B, $7B, $7B, $00, $00, $00, $00 ; $0C884E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8856 |
  db $00, $00, $FF, $27, $05, $14, $7D, $ED ; $0C885E |
  db $00, $7B, $7B, $7B, $7B, $00, $79, $79 ; $0C8866 |
  db $79, $79, $79, $79, $79, $79, $79, $79 ; $0C886E |
  db $79, $79, $00, $27, $26, $13, $00, $00 ; $0C8876 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C887E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8886 |
  db $00, $00, $27, $46, $13, $00, $00, $00 ; $0C888E |
  db $00, $00, $00, $00, $79, $79, $79, $79 ; $0C8896 |
  db $79, $79, $79, $79, $79, $79, $79, $79 ; $0C889E |
  db $00, $FF, $27, $66, $13, $00, $00, $00 ; $0C88A6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C88AE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C88B6 |
  db $00, $FF, $21, $EE, $04, $1C, $1D, $0A ; $0C88BE |
  db $0F, $0F, $FF, $21, $8C, $07, $25, $25 ; $0C88C6 |
  db $25, $25, $25, $25, $25, $25, $21, $AC ; $0C88CE |
  db $0C, $25, $25, $25, $25, $25, $25, $25 ; $0C88D6 |
  db $25, $25, $25, $25, $25, $25, $21, $EC ; $0C88DE |
  db $0B, $25, $25, $25, $25, $25, $25, $25 ; $0C88E6 |
  db $25, $25, $25, $25, $25, $22, $0C, $0B ; $0C88EE |
  db $25, $25, $25, $25, $25, $25, $25, $25 ; $0C88F6 |
  db $25, $25, $25, $25, $FF, $E8, $8E, $D4 ; $0C88FE |
  db $1A, $61, $A8, $B4, $E5, $16, $43, $73 ; $0C8906 |
  db $AA, $DF, $0C, $32, $67, $2E, $75, $A8 ; $0C890E |
  db $C0, $C9, $86, $87, $87, $88, $88, $88 ; $0C8916 |
  db $A3, $A3, $A4, $A4, $A4, $A4, $A4, $A5 ; $0C891E |
  db $A5, $A5, $87, $87, $A3, $88, $88, $8A ; $0C8926 |
  db $00, $00, $00, $10, $80, $41, $00, $00 ; $0C892E |
  db $00, $02, $00, $00, $00, $00, $00, $00 ; $0C8936 |
  db $00, $00, $2A, $D7, $28, $68, $22, $03 ; $0C893E |
  db $22, $87, $86, $80, $02, $20, $00, $10 ; $0C8946 |
  db $08, $00, $00, $00, $00, $10, $00, $00 ; $0C894E |
  db $00, $00, $00, $00, $00, $80, $20, $00 ; $0C8956 |
  db $00, $00, $88, $8D, $80, $A6, $82, $E9 ; $0C895E |
  db $22, $7E, $A2, $57, $AA, $C5, $02, $2D ; $0C8966 |
  db $A8, $7E, $02, $AC, $AA, $36, $00, $04 ; $0C896E |
  db $21, $02, $00, $42, $00, $80, $00, $00 ; $0C8976 |
  db $00, $00, $AB, $1A, $0A, $F0, $A0, $0B ; $0C897E |
  db $20, $A5, $00, $00, $02, $00, $20, $00 ; $0C8986 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C898E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0C8996 |
  db $00, $00, $22, $2A, $A2, $43, $2A, $C5 ; $0C899E |
  db $C8, $30, $2A, $60, $82, $82, $2A, $2C ; $0C89A6 |
  db $8A, $19, $8A, $06, $02, $08, $00, $02 ; $0C89AE |
  db $00, $00, $02, $00, $00, $00, $00, $00 ; $0C89B6 |
  db $00, $00, $02, $A7, $08, $82, $A8, $DA ; $0C89BE |
  db $A0, $29, $08, $18, $80, $02, $0A, $81 ; $0C89C6 |
  db $00, $00, $00, $00, $00, $00, $00, $10 ; $0C89CE |
  db $00, $00, $00, $00, $00, $40, $00, $00 ; $0C89D6 |
  db $00, $00, $02, $76, $22, $EF, $32, $B7 ; $0C89DE |
  db $02, $76, $8C, $BA, $A8, $FC, $8A, $D8 ; $0C89E6 |
  db $A8, $5F, $00, $2A, $AA, $06, $01, $DB ; $0C89EE |
  db $A2, $46, $09, $A0, $00, $00, $00, $45 ; $0C89F6 |
  db $00, $02, $00, $01, $02, $03, $04, $05 ; $0C89FE |
  db $06, $07, $08, $09, $0A, $0B, $0C, $0D ; $0CAA06 |
  db $0E, $0F, $10, $FF, $00, $00, $00, $00 ; $0CAA0E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAA16 |
  db $02, $00, $84, $F2, $2A, $D0, $02, $C8 ; $0CAA1E |
  db $20, $FE, $0A, $D9, $02, $13, $20, $95 ; $0CAA26 |
  db $0A, $29, $0E, $6C, $00, $00, $00, $00 ; $0CAA2E |
  db $00, $00, $00, $00, $00, $00, $00, $20 ; $0CAA36 |
  db $00, $02, $23, $63, $80, $80, $A2, $80 ; $0CAA3E |
  db $A0, $20, $40, $FF, $00, $40, $02, $0D ; $0CAA46 |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $0CAA4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAA56 |
  db $00, $00, $31, $00, $03, $00, $19, $00 ; $0CAA5E |
  db $19, $00, $17, $00, $09, $00, $00, $00 ; $0CAA66 |
  db $00, $00, $07, $00, $FF, $9C, $A2, $62 ; $0CAA6E |
  db $02, $04, $00, $18, $08, $00, $20, $00 ; $0CAA76 |
  db $00, $00, $60, $62, $0F, $20, $10, $00 ; $0CAA7E |
  db $0F, $2C, $0C, $11, $0F, $27, $17, $08 ; $0CAA86 |
  db $0F, $10, $00, $09, $00, $00, $00, $00 ; $0CAA8E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAA96 |
  db $00, $00, $80, $99, $AA, $50, $A2, $71 ; $0CAA9E |
  db $00, $57, $22, $FD, $8A, $6E, $0A, $0E ; $0CAAA6 |
  db $0A, $10, $02, $04, $00, $C0, $00, $10 ; $0CAAAE |
  db $00, $48, $00, $40, $00, $00, $00, $00 ; $0CAAB6 |
  db $08, $04, $0A, $F4, $00, $E6, $28, $46 ; $0CAABE |
  db $28, $7A, $00, $8C, $0A, $61, $80, $1C ; $0CAAC6 |
  db $08, $02, $00, $00, $00, $00, $00, $20 ; $0CAACE |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $0CAAD6 |
  db $00, $00, $A0, $56, $0A, $D6, $80, $54 ; $0CAADE |
  db $A2, $65, $AB, $DD, $8A, $A7, $BA, $E5 ; $0CAAE6 |
  db $2A, $BB, $02, $06, $AA, $49, $08, $F7 ; $0CAAEE |
  db $80, $05, $08, $0E, $FF, $00, $20, $00 ; $0CAAF6 |
  db $02, $04, $00, $01, $02, $03, $05, $06 ; $0CAAFE |
  db $06, $06, $06, $06, $06, $07, $07, $07 ; $0CAB06 |
  db $08, $08, $08, $09, $09, $09, $09, $09 ; $0CAB0E |
  db $09, $09, $0A, $0B, $0B, $0C, $0D, $0D ; $0CAB16 |
  db $0E, $0E, $10, $10, $FF, $85, $0A, $DC ; $0CAB1E |
  db $00, $C2, $22, $44, $02, $F6, $28, $06 ; $0CAB26 |
  db $00, $20, $08, $00, $00, $81, $00, $00 ; $0CAB2E |
  db $00, $01, $0A, $00, $00, $00, $00, $00 ; $0CAB36 |
  db $00, $00, $08, $CB, $8A, $79, $00, $20 ; $0CAB3E |
  db $00, $61, $00, $06, $8A, $82, $00, $85 ; $0CAB46 |
  db $00, $01, $00, $03, $08, $00, $00, $00 ; $0CAB4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAB56 |
  db $00, $00, $0A, $0A, $A2, $FB, $00, $B4 ; $0CAB5E |
  db $A8, $E3, $02, $BD, $AA, $6F, $8A, $FE ; $0CAB66 |
  db $28, $0E, $2C, $6B, $8A, $E3, $12, $E4 ; $0CAB6E |
  db $0A, $44, $00, $00, $00, $10, $00, $00 ; $0CAB76 |
  db $00, $00, $82, $F4, $0A, $B7, $00, $0A ; $0CAB7E |
  db $08, $08, $0A, $2C, $82, $00, $00, $00 ; $0CAB86 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAB8E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAB96 |
  db $00, $00, $20, $F0, $20, $A9, $A2, $B7 ; $0CAB9E |
  db $02, $7C, $A0, $E7, $02, $9A, $08, $81 ; $0CABA6 |
  db $0A, $E8, $08, $C6, $00, $DD, $80, $20 ; $0CABAE |
  db $00, $00, $00, $00, $02, $22, $00, $00 ; $0CABB6 |
  db $00, $00, $0E, $1E, $AA, $D9, $80, $48 ; $0CABBE |
  db $8A, $A1, $02, $3F, $82, $A5, $A8, $04 ; $0CABC6 |
  db $00, $96, $08, $08, $02, $04, $00, $00 ; $0CABCE |
  db $80, $00, $00, $00, $00, $00, $00, $00 ; $0CABD6 |
  db $00, $00, $2A, $40, $A0, $A4, $BE, $8F ; $0CABDE |
  db $88, $E3, $A0, $81, $AA, $E5, $A8, $6A ; $0CABE6 |
  db $A8, $4D, $84, $26, $82, $E6, $22, $4C ; $0CABEE |
  db $28, $CA, $A2, $09, $00, $04, $00, $00 ; $0CABF6 |
  db $00, $08, $28, $50, $70, $D8, $E8, $20 ; $0CABFE |
  db $48, $68, $C8, $D8, $F8, $28, $38, $78 ; $0CAC06 |
  db $70, $98, $B8, $68, $70, $78, $88, $88 ; $0CAC0E |
  db $88, $D8, $F0, $90, $F0, $B0, $58, $68 ; $0CAC16 |
  db $C8, $D8, $50, $80, $FF, $10, $22, $41 ; $0CAC1E |
  db $10, $00, $00, $00, $00, $00, $20, $10 ; $0CAC26 |
  db $00, $00, $10, $00, $00, $10, $10, $00 ; $0CAC2E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAC36 |
  db $00, $00, $80, $00, $00, $04, $00, $00 ; $0CAC3E |
  db $12, $00, $02, $00, $00, $00, $80, $00 ; $0CAC46 |
  db $20, $40, $00, $00, $00, $00, $00, $40 ; $0CAC4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAC56 |
  db $00, $10, $10, $45, $00, $10, $60, $04 ; $0CAC5E |
  db $00, $04, $4C, $04, $0F, $01, $09, $00 ; $0CAC66 |
  db $01, $00, $00, $05, $04, $10, $00, $00 ; $0CAC6E |
  db $80, $00, $00, $00, $80, $00, $00, $00 ; $0CAC76 |
  db $00, $00, $11, $00, $2C, $00, $00, $00 ; $0CAC7E |
  db $00, $00, $00, $10, $80, $00, $00, $00 ; $0CAC86 |
  db $00, $10, $00, $00, $00, $01, $00, $00 ; $0CAC8E |
  db $20, $00, $00, $00, $00, $00, $00, $00 ; $0CAC96 |
  db $00, $00, $50, $01, $B9, $01, $00, $10 ; $0CAC9E |
  db $21, $00, $09, $00, $2C, $10, $08, $00 ; $0CACA6 |
  db $00, $00, $20, $40, $C0, $40, $00, $04 ; $0CACAE |
  db $41, $00, $04, $00, $00, $00, $00, $00 ; $0CACB6 |
  db $00, $00, $0E, $00, $00, $14, $02, $40 ; $0CACBE |
  db $40, $40, $01, $04, $24, $01, $00, $00 ; $0CACC6 |
  db $40, $40, $00, $00, $80, $00, $00, $00 ; $0CACCE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CACD6 |
  db $00, $00, $01, $10, $04, $14, $44, $11 ; $0CACDE |
  db $40, $05, $18, $00, $A0, $00, $34, $00 ; $0CACE6 |
  db $08, $10, $03, $00, $06, $11, $46, $00 ; $0CACEE |
  db $04, $01, $04, $00, $00, $00, $00, $01 ; $0CACF6 |
  db $80, $40, $A8, $50, $50, $B8, $58, $98 ; $0CACFE |
  db $68, $58, $58, $68, $78, $58, $88, $68 ; $0CAD06 |
  db $98, $90, $90, $78, $38, $78, $30, $70 ; $0CAD0E |
  db $B0, $B8, $70, $B0, $90, $50, $48, $48 ; $0CAD16 |
  db $58, $58, $2C, $E8, $FF, $00, $88, $10 ; $0CAD1E |
  db $00, $40, $40, $44, $01, $00, $20, $01 ; $0CAD26 |
  db $02, $04, $00, $00, $01, $00, $80, $00 ; $0CAD2E |
  db $04, $00, $00, $00, $00, $00, $02, $00 ; $0CAD36 |
  db $00, $00, $00, $10, $02, $00, $00, $00 ; $0CAD3E |
  db $00, $00, $00, $01, $00, $04, $00, $00 ; $0CAD46 |
  db $00, $00, $00, $04, $00, $00, $00, $00 ; $0CAD4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAD56 |
  db $00, $00, $00, $41, $08, $00, $21, $51 ; $0CAD5E |
  db $00, $00, $12, $01, $00, $00, $22, $01 ; $0CAD66 |
  db $15, $00, $28, $00, $10, $00, $00, $00 ; $0CAD6E |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $0CAD76 |
  db $04, $00, $12, $01, $00, $00, $00, $00 ; $0CAD7E |
  db $00, $00, $00, $10, $02, $10, $00, $01 ; $0CAD86 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAD8E |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $0CAD96 |
  db $00, $00, $26, $00, $A0, $00, $44, $01 ; $0CAD9E |
  db $04, $40, $48, $11, $04, $40, $30, $00 ; $0CADA6 |
  db $01, $00, $10, $00, $15, $00, $00, $00 ; $0CADAE |
  db $40, $00, $00, $00, $00, $00, $00, $00 ; $0CADB6 |
  db $08, $10, $60, $10, $08, $00, $30, $00 ; $0CADBE |
  db $02, $00, $00, $00, $D0, $00, $20, $01 ; $0CADC6 |
  db $00, $00, $00, $40, $00, $00, $00, $00 ; $0CADCE |
  db $08, $00, $20, $00, $10, $00, $00, $00 ; $0CADD6 |
  db $00, $00, $01, $00, $42, $04, $15, $00 ; $0CADDE |
  db $11, $10, $0C, $10, $02, $01, $42, $40 ; $0CADE6 |
  db $00, $00, $09, $10, $C4, $04, $44, $00 ; $0CADEE |
  db $70, $00, $00, $04, $00, $00, $00, $00 ; $0CADF6 |
  db $00, $40, $55, $62, $62, $54, $2C, $52 ; $0CADFE |
  db $2C, $2C, $2C, $2C, $2C, $2C, $2C, $2C ; $0CAE06 |
  db $55, $5D, $5D, $50, $54, $52, $5D, $5D ; $0CAE0E |
  db $5D, $50, $03, $03, $03, $03, $50, $50 ; $0CAE16 |
  db $52, $52, $5E, $5F, $FF, $00, $48, $41 ; $0CAE1E |
  db $00, $00, $40, $00, $42, $00, $00, $01 ; $0CAE26 |
  db $04, $05, $00, $00, $00, $00, $02, $00 ; $0CAE2E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAE36 |
  db $00, $00, $1A, $00, $48, $01, $04, $00 ; $0CAE3E |
  db $40, $04, $01, $10, $04, $00, $40, $00 ; $0CAE46 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAE4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAE56 |
  db $00, $00, $00, $01, $09, $00, $02, $00 ; $0CAE5E |
  db $49, $40, $00, $05, $88, $14, $89, $05 ; $0CAE66 |
  db $60, $10, $02, $00, $A1, $14, $00, $04 ; $0CAE6E |
  db $00, $00, $00, $01, $00, $00, $00, $00 ; $0CAE76 |
  db $00, $00, $01, $00, $04, $00, $04, $00 ; $0CAE7E |
  db $80, $04, $40, $00, $08, $00, $00, $04 ; $0CAE86 |
  db $00, $00, $00, $00, $10, $00, $00, $00 ; $0CAE8E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAE96 |
  db $00, $00, $00, $05, $42, $00, $01, $01 ; $0CAE9E |
  db $92, $00, $2C, $10, $10, $00, $84, $10 ; $0CAEA6 |
  db $00, $00, $00, $40, $08, $50, $00, $00 ; $0CAEAE |
  db $00, $00, $00, $00, $00, $00, $10, $00 ; $0CAEB6 |
  db $20, $00, $00, $04, $58, $00, $00, $00 ; $0CAEBE |
  db $08, $11, $40, $10, $48, $00, $00, $00 ; $0CAEC6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CAECE |
  db $00, $04, $00, $00, $00, $00, $00, $00 ; $0CAED6 |
  db $00, $00, $24, $00, $10, $11, $08, $04 ; $0CAEDE |
  db $C0, $10, $15, $00, $10, $04, $87, $55 ; $0CAEE6 |
  db $44, $01, $00, $45, $A1, $01, $50, $01 ; $0CAEEE |
  db $25, $00, $80, $50, $00, $41, $40, $14 ; $0CAEF6 |
  db $00, $00, $00, $00, $01, $02, $03, $04 ; $0CAEFE |
  db $00, $00, $00, $05, $06, $07, $07, $08 ; $0CAF06 |
  db $09, $00, $0A, $0B, $07, $07, $07, $07 ; $0CAF0E |
  db $07, $0C, $07, $07, $0D, $0E, $07, $07 ; $0CAF16 |
  db $07, $07, $0F, $10, $11, $12, $0F, $10 ; $0CAF1E |
  db $0F, $10, $13, $14, $11, $15, $16, $15 ; $0CAF26 |
  db $13, $14, $17, $17, $17, $17, $17, $17 ; $0CAF2E |
  db $17, $17, $18, $18, $18, $18, $18, $18 ; $0CAF36 |
  db $18, $18, $00, $00, $00, $05, $19, $00 ; $0CAF3E |
  db $00, $00, $1A, $1B, $1C, $0B, $07, $1D ; $0CAF46 |
  db $1E, $02, $07, $07, $07, $07, $07, $07 ; $0CAF4E |
  db $07, $07, $07, $07, $0D, $0E, $07, $07 ; $0CAF56 |
  db $07, $07, $0F, $1F, $20, $21, $22, $10 ; $0CAF5E |
  db $0F, $10, $0D, $23, $24, $25, $0D, $15 ; $0CAF66 |
  db $13, $14, $17, $17, $17, $17, $17, $17 ; $0CAF6E |
  db $17, $17, $18, $18, $18, $18, $18, $18 ; $0CAF76 |
  db $18, $18, $26, $00, $01, $27, $28, $07 ; $0CAF7E |
  db $29, $00, $07, $2A, $06, $07, $07, $07 ; $0CAF86 |
  db $07, $2A, $07, $07, $07, $07, $07, $07 ; $0CAF8E |
  db $07, $07, $07, $07, $07, $0D, $0E, $07 ; $0CAF96 |
  db $07, $07, $0F, $10, $1F, $20, $21, $2B ; $0CAF9E |
  db $0F, $10, $16, $0D, $23, $24, $25, $0D ; $0CAFA6 |
  db $16, $15, $17, $17, $17, $17, $17, $17 ; $0CAFAE |
  db $17, $17, $18, $18, $18, $18, $18, $18 ; $0CAFB6 |
  db $18, $18, $00, $00, $00, $00, $00, $00 ; $0CAFBE |
  db $00, $2C, $2D, $04, $01, $2E, $02, $2A ; $0CAFC6 |
  db $04, $2C, $07, $08, $0B, $07, $07, $07 ; $0CAFCE |
  db $03, $2C, $07, $07, $07, $07, $07, $07 ; $0CAFD6 |
  db $07, $2C, $0F, $10, $0F, $2F, $07, $07 ; $0CAFDE |
  db $07, $2C, $16, $0D, $16, $30, $07, $07 ; $0CAFE6 |
  db $07, $2C, $31, $32, $32, $21, $33, $34 ; $0CAFEE |
  db $35, $36, $2C, $37, $37, $25, $38, $39 ; $0CAFF6 |
  db $3A, $3B, $3C, $3C, $3C, $3D, $39, $39 ; $0CAFFE |
  db $3E, $3F, $3C, $3C, $3C, $3D, $39, $39 ; $0CB006 |
  db $39, $39, $40, $40, $40, $41, $42, $42 ; $0CB00E |
  db $42, $42, $40, $40, $40, $41, $43, $43 ; $0CB016 |
  db $43, $43, $44, $44, $44, $45, $43, $43 ; $0CB01E |
  db $43, $43, $40, $40, $40, $40, $40, $41 ; $0CB026 |
  db $46, $46, $40, $40, $40, $40, $40, $40 ; $0CB02E |
  db $40, $40, $40, $40, $40, $40, $40, $40 ; $0CB036 |
  db $40, $40, $3F, $47, $3F, $3F, $48, $3F ; $0CB03E |
  db $47, $3F, $39, $49, $4A, $4A, $4B, $39 ; $0CB046 |
  db $49, $4A, $42, $4C, $42, $42, $4D, $4E ; $0CB04E |
  db $4F, $42, $43, $50, $43, $43, $51, $43 ; $0CB056 |
  db $50, $43, $43, $50, $52, $52, $51, $53 ; $0CB05E |
  db $50, $52, $54, $54, $46, $46, $55, $40 ; $0CB066 |
  db $41, $46, $56, $40, $40, $40, $40, $40 ; $0CB06E |
  db $40, $40, $57, $40, $40, $40, $40, $40 ; $0CB076 |
  db $40, $40, $3F, $48, $3F, $3F, $3F, $3F ; $0CB07E |
  db $3F, $47, $4A, $4B, $39, $39, $39, $39 ; $0CB086 |
  db $39, $49, $42, $4D, $4E, $4E, $4E, $4E ; $0CB08E |
  db $4E, $4F, $43, $51, $43, $43, $43, $43 ; $0CB096 |
  db $43, $50, $52, $51, $58, $59, $5A, $58 ; $0CB09E |
  db $59, $50, $54, $54, $46, $46, $46, $46 ; $0CB0A6 |
  db $46, $55, $56, $40, $40, $40, $40, $40 ; $0CB0AE |
  db $40, $40, $57, $40, $40, $40, $40, $40 ; $0CB0B6 |
  db $40, $40, $3F, $3F, $48, $3F, $3F, $3F ; $0CB0BE |
  db $38, $5B, $4A, $4A, $4B, $39, $5C, $5D ; $0CB0C6 |
  db $5D, $3C, $42, $42, $4D, $4E, $55, $40 ; $0CB0CE |
  db $40, $40, $43, $43, $51, $43, $55, $40 ; $0CB0D6 |
  db $40, $40, $52, $52, $54, $43, $5E, $44 ; $0CB0DE |
  db $44, $44, $40, $40, $56, $40, $40, $40 ; $0CB0E6 |
  db $40, $40, $40, $40, $57, $40, $40, $40 ; $0CB0EE |
  db $40, $40, $40, $40, $57, $40, $40, $40 ; $0CB0F6 |
  db $40, $40, $3D, $5F, $3C, $3C, $3C, $3C ; $0CB0FE |
  db $3C, $3C, $3D, $5F, $3D, $60, $61, $60 ; $0CB106 |
  db $60, $5B, $3D, $62, $3F, $63, $64, $65 ; $0CB10E |
  db $39, $5B, $3D, $66, $67, $3F, $68, $3D ; $0CB116 |
  db $69, $5B, $3D, $4A, $3F, $4A, $6A, $60 ; $0CB11E |
  db $6B, $5B, $3D, $39, $3C, $3C, $3C, $3D ; $0CB126 |
  db $38, $5B, $3C, $3C, $3C, $3C, $3C, $3D ; $0CB12E |
  db $38, $5B, $3C, $3C, $3C, $3C, $3C, $3D ; $0CB136 |
  db $38, $5B, $3D, $66, $5B, $3C, $3C, $3C ; $0CB13E |
  db $3C, $3C, $3D, $66, $67, $6C, $6C, $6D ; $0CB146 |
  db $6E, $6F, $3D, $66, $5B, $3C, $3D, $70 ; $0CB14E |
  db $4A, $5B, $3D, $66, $3F, $6C, $6C, $49 ; $0CB156 |
  db $39, $5B, $3D, $66, $5B, $3C, $3D, $70 ; $0CB15E |
  db $4A, $5B, $3D, $66, $6C, $6C, $6C, $49 ; $0CB166 |
  db $71, $6F, $3D, $5F, $3C, $3C, $3C, $3C ; $0CB16E |
  db $3C, $3C, $3D, $5F, $3C, $3C, $3C, $3C ; $0CB176 |
  db $3C, $3C, $3C, $3C, $72, $73, $72, $73 ; $0CB17E |
  db $3C, $3C, $3D, $6C, $74, $6C, $75, $6C ; $0CB186 |
  db $6C, $76, $3D, $39, $77, $39, $78, $39 ; $0CB18E |
  db $39, $79, $3D, $39, $6C, $39, $77, $39 ; $0CB196 |
  db $39, $4B, $3D, $7A, $39, $39, $6C, $7B ; $0CB19E |
  db $3C, $3C, $3D, $66, $7C, $7C, $7C, $7D ; $0CB1A6 |
  db $5B, $3C, $3D, $66, $5B, $3C, $3C, $3C ; $0CB1AE |
  db $3C, $3C, $3D, $66, $5B, $3C, $3C, $3C ; $0CB1B6 |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB1BE |
  db $3C, $3C, $6C, $6D, $6C, $6C, $76, $6C ; $0CB1C6 |
  db $6D, $6C, $34, $7E, $39, $39, $79, $34 ; $0CB1CE |
  db $7E, $39, $39, $49, $7F, $7F, $4B, $39 ; $0CB1D6 |
  db $49, $7F, $3D, $70, $39, $39, $80, $4A ; $0CB1DE |
  db $70, $39, $3D, $49, $71, $71, $4B, $5B ; $0CB1E6 |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB1EE |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB1F6 |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB1FE |
  db $81, $5B, $6C, $76, $6C, $6D, $6C, $6C ; $0CB206 |
  db $82, $5B, $39, $79, $34, $7E, $39, $39 ; $0CB20E |
  db $39, $5B, $7F, $4B, $39, $49, $7F, $5B ; $0CB216 |
  db $3C, $3C, $39, $80, $4A, $70, $39, $5B ; $0CB21E |
  db $3C, $3C, $3D, $83, $84, $64, $39, $6F ; $0CB226 |
  db $85, $85, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB22E |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB236 |
  db $3C, $3C, $3D, $66, $5B, $3C, $3C, $3C ; $0CB23E |
  db $3C, $3C, $3D, $39, $86, $87, $6D, $88 ; $0CB246 |
  db $89, $6F, $3D, $39, $8A, $77, $49, $39 ; $0CB24E |
  db $39, $5B, $3D, $4A, $60, $60, $70, $4A ; $0CB256 |
  db $4A, $5B, $8B, $39, $39, $39, $49, $39 ; $0CB25E |
  db $39, $5B, $3D, $7C, $7C, $7C, $8C, $7C ; $0CB266 |
  db $69, $5B, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB26E |
  db $81, $5B, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB276 |
  db $81, $5B, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB27E |
  db $3C, $3C, $8B, $6C, $6D, $6C, $6C, $6C ; $0CB286 |
  db $76, $5B, $3D, $39, $49, $4A, $4A, $4A ; $0CB28E |
  db $4B, $5B, $3D, $4A, $70, $39, $39, $39 ; $0CB296 |
  db $5B, $3C, $3D, $39, $49, $8D, $8D, $8D ; $0CB29E |
  db $76, $8E, $3D, $39, $49, $39, $39, $39 ; $0CB2A6 |
  db $4B, $8F, $3D, $7A, $5B, $3C, $3C, $3C ; $0CB2AE |
  db $3C, $3C, $3D, $66, $5B, $3C, $3C, $3C ; $0CB2B6 |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB2BE |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB2C6 |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB2CE |
  db $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C ; $0CB2D6 |
  db $3C, $3C, $90, $6C, $6C, $88, $89, $6F ; $0CB2DE |
  db $85, $85, $91, $39, $39, $39, $39, $5B ; $0CB2E6 |
  db $3C, $3C, $3C, $3C, $3D, $39, $39, $5B ; $0CB2EE |
  db $3C, $3C, $3C, $3C, $3D, $39, $39, $5B ; $0CB2F6 |
  db $3C, $3C, $3D, $3F, $47, $39, $39, $48 ; $0CB2FE |
  db $3F, $5B, $3D, $34, $92, $34, $34, $93 ; $0CB306 |
  db $34, $5B, $94, $42, $4C, $42, $42, $95 ; $0CB30E |
  db $42, $96, $94, $52, $97, $43, $43, $98 ; $0CB316 |
  db $52, $96, $94, $43, $50, $99, $99, $51 ; $0CB31E |
  db $43, $96, $94, $58, $9A, $43, $43, $9B ; $0CB326 |
  db $59, $96, $41, $9C, $9C, $9C, $9C, $9C ; $0CB32E |
  db $9C, $55, $41, $9D, $9D, $9D, $9D, $9D ; $0CB336 |
  db $9D, $55, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB33E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB346 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB34E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB356 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB35E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB366 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB36E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB376 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB37E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB386 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB38E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB396 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB39E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3A6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3AE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3B6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3BE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3C6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3CE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3D6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3DE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3E6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3EE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3F6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB3FE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB406 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB40E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB416 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB41E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB426 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB42E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB436 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB43E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB446 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB44E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB456 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB45E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB466 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB46E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB476 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB47E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB486 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB48E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB496 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB49E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4A6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4AE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4B6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4BE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4C6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4CE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4D6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4DE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4E6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4EE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4F6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB4FE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB506 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB50E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB516 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB51E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB526 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB52E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB536 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB53E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB546 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB54E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB556 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB55E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB566 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB56E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB576 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB57E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB586 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB58E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB596 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB59E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5A6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5AE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5B6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5BE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5C6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5CE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5D6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5DE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5E6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5EE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5F6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB5FE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB606 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB60E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB616 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB61E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB626 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB62E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB636 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB63E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB646 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB64E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB656 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB65E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB666 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB66E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB676 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB67E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB686 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB68E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB696 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB69E |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6A6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6AE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6B6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6BE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6C6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6CE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6D6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6DE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6E6 |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6EE |
  db $9E, $9E, $9E, $9E, $9E, $9E, $9E, $9E ; $0CB6F6 |
  db $9E, $9E, $4D, $4D, $4D, $4D, $4D, $4D ; $0CB6FE |
  db $4D, $5D, $4D, $55, $5C, $03, $03, $52 ; $0CB706 |
  db $03, $03, $4D, $4D, $52, $4D, $4D, $4D ; $0CB70E |
  db $4D, $55, $55, $03, $03, $03, $03, $03 ; $0CB716 |
  db $03, $03, $03, $5B, $03, $03, $5A, $4D ; $0CB71E |
  db $03, $52, $55, $5B, $03, $03, $5C, $03 ; $0CB726 |
  db $03, $03, $5B, $5C, $03, $03, $70, $73 ; $0CB72E |
  db $78, $7B, $74, $03, $7C, $03, $03, $03 ; $0CB736 |
  db $64, $64, $03, $03, $65, $64, $78, $7B ; $0CB73E |
  db $78, $7B, $7C, $03, $65, $64, $6C, $6C ; $0CB746 |
  db $70, $71, $6D, $6C, $72, $73, $6D, $6C ; $0CB74E |
  db $6D, $6C, $6C, $6C, $6C, $6C, $62, $63 ; $0CB756 |
  db $68, $69, $60, $61, $68, $69, $4D, $4D ; $0CB75E |
  db $5B, $5A, $4D, $5D, $55, $03, $5C, $5B ; $0CB766 |
  db $03, $03, $5A, $5D, $03, $03, $52, $4D ; $0CB76E |
  db $03, $5B, $4D, $4D, $5A, $5D, $70, $71 ; $0CB776 |
  db $78, $6B, $75, $75, $76, $77, $72, $73 ; $0CB77E |
  db $7A, $7B, $74, $03, $64, $64, $78, $6B ; $0CB786 |
  db $78, $79, $7E, $7F, $7D, $6A, $7A, $7B ; $0CB78E |
  db $7A, $7B, $4D, $4D, $55, $52, $4D, $4D ; $0CB796 |
  db $5A, $55, $5D, $5C, $03, $03, $52, $4D ; $0CB79E |
  db $03, $52, $5B, $5A, $03, $03, $74, $03 ; $0CB7A6 |
  db $65, $64, $78, $79, $78, $79, $5D, $5A ; $0CB7AE |
  db $03, $03, $4D, $4D, $5C, $5B, $03, $03 ; $0CB7B6 |
  db $65, $03, $6D, $03, $6D, $03, $70, $71 ; $0CB7BE |
  db $78, $79, $75, $75, $7D, $7D, $49, $07 ; $0CB7C6 |
  db $14, $0F, $49, $49, $14, $14, $49, $70 ; $0CB7CE |
  db $14, $78, $71, $75, $79, $7D, $7D, $7D ; $0CB7D6 |
  db $7D, $7D, $14, $0F, $14, $0F, $14, $14 ; $0CB7DE |
  db $14, $14, $14, $78, $14, $78, $79, $7D ; $0CB7E6 |
  db $79, $7D, $10, $11, $11, $10, $10, $11 ; $0CB7EE |
  db $11, $12, $14, $12, $14, $13, $10, $11 ; $0CB7F6 |
  db $13, $13, $18, $19, $19, $18, $18, $19 ; $0CB7FE |
  db $19, $1A, $1D, $1D, $1C, $1C, $1C, $1C ; $0CB806 |
  db $1C, $1C, $37, $37, $3F, $3F, $37, $27 ; $0CB80E |
  db $3F, $2F, $1C, $1C, $06, $06, $10, $11 ; $0CB816 |
  db $13, $40, $10, $11, $40, $13, $14, $48 ; $0CB81E |
  db $14, $48, $14, $14, $49, $49, $48, $14 ; $0CB826 |
  db $48, $14, $1D, $4C, $1C, $4A, $4C, $1D ; $0CB82E |
  db $4A, $43, $1D, $1D, $43, $43, $1D, $4C ; $0CB836 |
  db $43, $4A, $1C, $4A, $1C, $4A, $4A, $1C ; $0CB83E |
  db $4A, $1C, $4B, $4B, $1C, $1C, $18, $19 ; $0CB846 |
  db $1A, $1A, $32, $33, $3A, $3B, $18, $19 ; $0CB84E |
  db $1A, $18, $3C, $1A, $3D, $18, $3D, $1A ; $0CB856 |
  db $3D, $18, $1C, $30, $1C, $38, $31, $1C ; $0CB85E |
  db $39, $1C, $18, $19, $1B, $1B, $10, $11 ; $0CB866 |
  db $12, $10, $14, $14, $12, $10, $14, $14 ; $0CB86E |
  db $11, $10, $36, $37, $3E, $3F, $0F, $12 ; $0CB876 |
  db $0F, $10, $13, $13, $49, $49, $13, $40 ; $0CB87E |
  db $49, $48, $0F, $12, $0F, $13, $14, $20 ; $0CB886 |
  db $14, $28, $21, $48, $29, $48, $22, $23 ; $0CB88E |
  db $2A, $2B, $0F, $14, $0F, $14, $10, $11 ; $0CB896 |
  db $12, $12, $10, $11, $13, $10, $14, $07 ; $0CB89E |
  db $14, $0F, $14, $40, $49, $48, $14, $0F ; $0CB8A6 |
  db $49, $0F, $13, $13, $14, $14, $13, $40 ; $0CB8AE |
  db $14, $48, $50, $51, $58, $59, $56, $57 ; $0CB8B6 |
  db $5E, $5F, $14, $48, $49, $48, $20, $21 ; $0CB8BE |
  db $28, $29, $10, $22, $11, $2A, $23, $11 ; $0CB8C6 |
  db $2B, $10, $13, $2C, $14, $2E, $13, $2C ; $0CB8CE |
  db $14, $2D, $40, $13, $48, $14, $14, $13 ; $0CB8D6 |
  db $10, $11, $14, $2D, $14, $2E, $48, $49 ; $0CB8DE |
  db $48, $14, $07, $14, $0F, $14, $14, $14 ; $0CB8E6 |
  db $14, $10, $14, $14, $05, $05, $14, $13 ; $0CB8EE |
  db $05, $05, $49, $48, $14, $48, $41, $41 ; $0CB8F6 |
  db $14, $14, $48, $14, $48, $49, $12, $0F ; $0CB8FE |
  db $11, $0F, $13, $0F, $14, $0F, $48, $20 ; $0CB906 |
  db $48, $28, $21, $20, $29, $28, $57, $57 ; $0CB90E |
  db $5F, $5F, $12, $13, $12, $14, $13, $12 ; $0CB916 |
  db $14, $12, $13, $50, $14, $58, $51, $13 ; $0CB91E |
  db $59, $14, $13, $14, $10, $11, $57, $47 ; $0CB926 |
  db $5F, $4F, $14, $48, $05, $05, $14, $14 ; $0CB92E |
  db $41, $41, $13, $0E, $14, $0E, $14, $0E ; $0CB936 |
  db $14, $0E, $0B, $13, $0C, $14, $0C, $14 ; $0CB93E |
  db $0C, $14, $49, $44, $14, $48, $44, $49 ; $0CB946 |
  db $48, $14, $67, $6F, $67, $6F, $4C, $1D ; $0CB94E |
  db $4A, $1C, $66, $67, $66, $67, $4B, $4A ; $0CB956 |
  db $1C, $4A, $4A, $4B, $4A, $1C, $1C, $1C ; $0CB95E |
  db $43, $43, $31, $4A, $39, $4A, $4A, $30 ; $0CB966 |
  db $4A, $38, $46, $46, $4E, $4E, $4E, $4E ; $0CB96E |
  db $4E, $4E, $00, $00, $00, $00, $51, $40 ; $0CB976 |
  db $59, $48, $40, $50, $48, $58, $13, $13 ; $0CB97E |
  db $41, $41, $62, $73, $68, $7B, $60, $7B ; $0CB986 |
  db $68, $7B, $00, $00, $00, $00, $00, $00 ; $0CB98E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB996 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB99E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9A6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9AE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9B6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9BE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9C6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9CE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9D6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9DE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9E6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9EE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9F6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CB9FE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA06 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA0E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA16 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA1E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA26 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA2E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA36 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA3E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA46 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA4E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA56 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA5E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA66 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA6E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA76 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA7E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA86 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA8E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA96 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBA9E |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAA6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAAE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAB6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBABE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAC6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBACE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAD6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBADE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAE6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAEE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBAF6 |
  db $00, $00, $00, $00, $10, $11, $00, $0C ; $0CBAFE |
  db $0C, $0E, $10, $00, $00, $00, $24, $4D ; $0CBB06 |
  db $1E, $0E, $86, $A6, $86, $00, $24, $00 ; $0CBB0E |
  db $00, $A4, $86, $A6, $86, $00, $24, $14 ; $0CBB16 |
  db $00, $00, $2C, $2E, $40, $42, $00, $00 ; $0CBB1E |
  db $00, $6D, $4C, $3E, $60, $62, $64, $74 ; $0CBB26 |
  db $74, $6F, $2C, $2E, $40, $42, $00, $00 ; $0CBB2E |
  db $6C, $6D, $4C, $3E, $60, $62, $64, $74 ; $0CBB36 |
  db $6E, $6F, $00, $24, $00, $24, $0A, $00 ; $0CBB3E |
  db $76, $6D, $1A, $0A, $1A, $0A, $2A, $01 ; $0CBB46 |
  db $78, $6F, $00, $00, $20, $11, $32, $01 ; $0CBB4E |
  db $6C, $6D, $4C, $3E, $01, $21, $32, $01 ; $0CBB56 |
  db $6E, $6F, $06, $08, $02, $04, $12, $12 ; $0CBB5E |
  db $44, $6B, $26, $28, $67, $58, $30, $30 ; $0CBB66 |
  db $00, $6A, $46, $48, $4A, $48, $11, $4A ; $0CBB6E |
  db $CC, $CE, $56, $58, $10, $58, $5A, $10 ; $0CBB76 |
  db $EC, $EE, $98, $9A, $C8, $CA, $88, $8A ; $0CBB7E |
  db $E2, $95, $B8, $BA, $E8, $EA, $F8, $94 ; $0CBB86 |
  db $C2, $C3, $E5, $E1, $E0, $E2, $C3, $C0 ; $0CBB8E |
  db $F0, $C0, $C1, $C0, $D4, $C0, $F0, $C2 ; $0CBB96 |
  db $E2, $C2, $C2, $95, $E2, $D4, $E0, $00 ; $0CBB9E |
  db $00, $00, $00, $A4, $C6, $E6, $00, $00 ; $0CBBA6 |
  db $00, $00, $CC, $CE, $00, $00, $00, $00 ; $0CBBAE |
  db $00, $00, $EC, $EE, $00, $00, $00, $00 ; $0CBBB6 |
  db $00, $00, $8E, $8E, $00, $00, $00, $00 ; $0CBBBE |
  db $00, $00, $81, $90, $90, $00, $00, $00 ; $0CBBC6 |
  db $00, $00, $80, $00, $00, $00, $00, $00 ; $0CBBCE |
  db $00, $00, $80, $AA, $00, $00, $00, $00 ; $0CBBD6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBBDE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBBE6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBBEE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBBF6 |
  db $00, $00, $00, $00, $10, $11, $00, $0D ; $0CBBFE |
  db $0D, $0F, $10, $00, $00, $00, $25, $4D ; $0CBC06 |
  db $1F, $0F, $87, $A7, $A7, $00, $25, $00 ; $0CBC0E |
  db $00, $A5, $87, $A7, $A7, $00, $25, $15 ; $0CBC16 |
  db $00, $00, $2D, $2F, $41, $43, $00, $00 ; $0CBC1E |
  db $00, $6C, $3D, $4F, $61, $63, $65, $75 ; $0CBC26 |
  db $75, $6E, $2D, $2F, $41, $43, $00, $00 ; $0CBC2E |
  db $6D, $6D, $3D, $4F, $61, $63, $65, $75 ; $0CBC36 |
  db $6F, $6F, $00, $25, $00, $25, $0A, $00 ; $0CBC3E |
  db $77, $6C, $1B, $0A, $1B, $0A, $2B, $01 ; $0CBC46 |
  db $79, $6E, $00, $00, $01, $31, $11, $23 ; $0CBC4E |
  db $6D, $6D, $3D, $4F, $01, $31, $22, $01 ; $0CBC56 |
  db $6F, $6F, $07, $09, $03, $05, $12, $13 ; $0CBC5E |
  db $6A, $6B, $27, $29, $67, $66, $30, $33 ; $0CBC66 |
  db $00, $45, $47, $4A, $47, $49, $11, $4A ; $0CBC6E |
  db $CD, $CF, $57, $10, $57, $59, $11, $10 ; $0CBC76 |
  db $ED, $EF, $99, $9B, $C9, $CB, $89, $8B ; $0CBC7E |
  db $95, $E1, $B9, $BB, $E9, $EB, $84, $FB ; $0CBC86 |
  db $C3, $C1, $E5, $E2, $E1, $E3, $C0, $C3 ; $0CBC8E |
  db $C0, $F3, $C2, $C0, $C0, $D5, $C1, $F3 ; $0CBC96 |
  db $E1, $C1, $D5, $E1, $95, $C1, $E3, $00 ; $0CBC9E |
  db $00, $00, $00, $A5, $C7, $E7, $00, $00 ; $0CBCA6 |
  db $00, $00, $CD, $CF, $00, $00, $00, $00 ; $0CBCAE |
  db $00, $00, $ED, $EF, $00, $00, $00, $00 ; $0CBCB6 |
  db $00, $00, $8E, $8F, $00, $00, $00, $00 ; $0CBCBE |
  db $00, $00, $90, $90, $82, $00, $00, $00 ; $0CBCC6 |
  db $00, $00, $00, $8B, $80, $00, $00, $00 ; $0CBCCE |
  db $00, $00, $A9, $AB, $80, $00, $00, $00 ; $0CBCD6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBCDE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBCE6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBCEE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBCF6 |
  db $00, $00, $00, $00, $10, $11, $00, $1C ; $0CBCFE |
  db $1C, $0E, $10, $00, $00, $34, $34, $4E ; $0CBD06 |
  db $1E, $0E, $96, $B6, $96, $34, $34, $00 ; $0CBD0E |
  db $B4, $B4, $96, $B6, $96, $34, $34, $34 ; $0CBD16 |
  db $00, $00, $3C, $3E, $50, $52, $00, $00 ; $0CBD1E |
  db $00, $7D, $5C, $5E, $70, $72, $74, $74 ; $0CBD26 |
  db $3A, $7F, $3C, $3E, $50, $52, $00, $00 ; $0CBD2E |
  db $7C, $7D, $5C, $5E, $70, $72, $74, $74 ; $0CBD36 |
  db $7E, $7F, $1A, $0A, $1A, $0A, $1A, $00 ; $0CBD3E |
  db $68, $7D, $1A, $34, $1A, $34, $1A, $01 ; $0CBD46 |
  db $78, $7F, $3C, $3E, $11, $11, $11, $32 ; $0CBD4E |
  db $7C, $7D, $5C, $5E, $21, $11, $11, $32 ; $0CBD56 |
  db $7E, $7F, $16, $18, $16, $18, $30, $30 ; $0CBD5E |
  db $54, $7B, $36, $38, $10, $58, $30, $30 ; $0CBD66 |
  db $00, $7A, $56, $58, $10, $58, $5A, $10 ; $0CBD6E |
  db $DC, $DE, $56, $58, $10, $58, $5A, $10 ; $0CBD76 |
  db $FC, $FE, $A8, $AA, $D8, $DA, $A8, $AA ; $0CBD7E |
  db $F2, $E4, $C8, $CA, $F8, $FA, $F8, $94 ; $0CBD86 |
  db $D2, $85, $F5, $F1, $F0, $F2, $C4, $C0 ; $0CBD8E |
  db $F0, $C0, $D1, $C0, $E4, $C0, $D0, $D2 ; $0CBD96 |
  db $F2, $D2, $D2, $D2, $D2, $D2, $D0, $00 ; $0CBD9E |
  db $00, $00, $B4, $B4, $D6, $F6, $00, $00 ; $0CBDA6 |
  db $00, $00, $DC, $DE, $00, $00, $00, $00 ; $0CBDAE |
  db $00, $00, $FC, $FE, $00, $00, $00, $00 ; $0CBDB6 |
  db $00, $00, $9E, $9E, $00, $00, $00, $00 ; $0CBDBE |
  db $00, $00, $80, $90, $90, $00, $00, $00 ; $0CBDC6 |
  db $00, $00, $80, $9A, $00, $00, $00, $00 ; $0CBDCE |
  db $00, $00, $91, $90, $90, $00, $00, $00 ; $0CBDD6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBDDE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBDE6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBDEE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBDF6 |
  db $00, $00, $00, $00, $10, $11, $00, $1D ; $0CBDFE |
  db $1D, $0F, $10, $00, $00, $35, $35, $4E ; $0CBE06 |
  db $1F, $0F, $97, $B7, $B7, $35, $35, $00 ; $0CBE0E |
  db $B5, $B5, $97, $B7, $B7, $35, $35, $35 ; $0CBE16 |
  db $00, $00, $3D, $3F, $51, $53, $00, $00 ; $0CBE1E |
  db $00, $7C, $5D, $5F, $71, $73, $75, $75 ; $0CBE26 |
  db $3B, $7E, $3D, $3F, $51, $53, $00, $00 ; $0CBE2E |
  db $7D, $7D, $5D, $5F, $71, $73, $75, $75 ; $0CBE36 |
  db $7F, $7F, $1B, $0A, $1B, $0A, $1B, $00 ; $0CBE3E |
  db $69, $7C, $1B, $35, $1B, $35, $1B, $01 ; $0CBE46 |
  db $79, $7E, $3D, $3F, $31, $11, $11, $11 ; $0CBE4E |
  db $7D, $7D, $5D, $5F, $31, $11, $11, $22 ; $0CBE56 |
  db $7F, $7F, $17, $19, $17, $19, $30, $33 ; $0CBE5E |
  db $7A, $7B, $37, $39, $10, $66, $30, $33 ; $0CBE66 |
  db $00, $55, $57, $10, $57, $59, $11, $10 ; $0CBE6E |
  db $DD, $DF, $57, $10, $57, $59, $11, $10 ; $0CBE76 |
  db $FD, $FF, $A9, $AB, $D9, $DB, $A9, $AB ; $0CBE7E |
  db $E4, $F1, $C9, $CB, $F9, $FB, $84, $FB ; $0CBE86 |
  db $85, $D1, $F5, $F2, $F1, $F3, $C0, $C5 ; $0CBE8E |
  db $C0, $F3, $D2, $C0, $C0, $E4, $D1, $D3 ; $0CBE96 |
  db $F1, $D1, $D1, $D1, $D1, $D1, $D3, $00 ; $0CBE9E |
  db $00, $00, $B5, $B5, $D7, $F7, $00, $00 ; $0CBEA6 |
  db $00, $00, $DD, $DF, $00, $00, $00, $00 ; $0CBEAE |
  db $00, $00, $FD, $FF, $00, $00, $00, $00 ; $0CBEB6 |
  db $00, $00, $9E, $9F, $00, $00, $00, $00 ; $0CBEBE |
  db $00, $00, $90, $90, $80, $00, $00, $00 ; $0CBEC6 |
  db $00, $00, $99, $9B, $80, $00, $00, $00 ; $0CBECE |
  db $00, $00, $90, $90, $92, $00, $00, $00 ; $0CBED6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBEDE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBEE6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBEEE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBEF6 |
  db $00, $00, $00, $00, $02, $01, $00, $53 ; $0CBEFE |
  db $51, $43, $03, $00, $00, $13, $13, $10 ; $0CBF06 |
  db $10, $23, $13, $13, $13, $03, $03, $00 ; $0CBF0E |
  db $13, $13, $11, $11, $11, $81, $81, $81 ; $0CBF16 |
  db $00, $00, $03, $03, $13, $13, $10, $10 ; $0CBF1E |
  db $03, $11, $03, $03, $13, $13, $13, $13 ; $0CBF26 |
  db $13, $11, $81, $81, $11, $11, $10, $10 ; $0CBF2E |
  db $11, $11, $81, $81, $11, $11, $11, $11 ; $0CBF36 |
  db $11, $11, $03, $03, $81, $81, $03, $00 ; $0CBF3E |
  db $11, $13, $03, $03, $81, $81, $81, $01 ; $0CBF46 |
  db $11, $13, $03, $03, $01, $01, $01, $01 ; $0CBF4E |
  db $13, $13, $03, $03, $01, $01, $01, $01 ; $0CBF56 |
  db $13, $13, $12, $12, $12, $12, $01, $01 ; $0CBF5E |
  db $11, $11, $12, $12, $10, $10, $01, $01 ; $0CBF66 |
  db $00, $11, $10, $10, $10, $10, $01, $10 ; $0CBF6E |
  db $10, $10, $10, $10, $10, $10, $01, $10 ; $0CBF76 |
  db $10, $10, $12, $12, $60, $60, $12, $12 ; $0CBF7E |
  db $10, $10, $60, $60, $12, $12, $12, $12 ; $0CBF86 |
  db $10, $10, $13, $10, $10, $10, $10, $10 ; $0CBF8E |
  db $10, $10, $10, $10, $10, $10, $10, $10 ; $0CBF96 |
  db $10, $10, $10, $10, $10, $10, $10, $00 ; $0CBF9E |
  db $00, $00, $03, $03, $03, $03, $00, $00 ; $0CBFA6 |
  db $00, $00, $03, $03, $00, $00, $00, $00 ; $0CBFAE |
  db $00, $00, $03, $03, $00, $00, $00, $00 ; $0CBFB6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFBE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFC6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFCE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFD6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFDE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFE6 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFEE |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0CBFF6 |
  db $00, $00                               ; $0CBFFE |

