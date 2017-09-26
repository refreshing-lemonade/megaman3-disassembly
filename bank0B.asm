bank $0B
org $8000

  JMP $8006                                 ; $0BA000 |

  JMP code_0B8439                           ; $0B8003 |

  LDA #$00                                  ; $0B8006 |
  STA $EE                                   ; $0B8008 |
  JSR code_1EC752                           ; $0B800A |
  LDA #$04                                  ; $0B800D |
  STA $97                                   ; $0B800F |
  JSR code_1EC5E9                           ; $0B8011 |
  JSR code_1EC628                           ; $0B8014 |
  JSR code_1FFF21                           ; $0B8017 |
  LDA #$F0                                  ; $0B801A |
  JSR code_1FF898                           ; $0B801C |
  LDA #$00                                  ; $0B801F |
  STA $B1                                   ; $0B8021 |
  STA $B2                                   ; $0B8023 |
  STA $B3                                   ; $0B8025 |
  STA $70                                   ; $0B8027 |
  STA $FD                                   ; $0B8029 |
  STA $FC                                   ; $0B802B |
  STA $B8                                   ; $0B802D |
  LDA #$16                                  ; $0B802F |
  STA $22                                   ; $0B8031 |
  LDA #$02                                  ; $0B8033 |
  JSR code_1FE8B4                           ; $0B8035 |
code_0B8038:
  LDA #$00                                  ; $0B8038 |
  STA $10                                   ; $0B803A |
  JSR code_1FEF8C                           ; $0B803C |
  JSR code_1FFF21                           ; $0B803F |
  LDA $70                                   ; $0B8042 |
  BNE code_0B8038                           ; $0B8044 |
  LDY #$1F                                  ; $0B8046 |
code_0B8048:
  LDA $8655,y                               ; $0B8048 |
  STA $0620,y                               ; $0B804B |
  DEY                                       ; $0B804E |
  BPL code_0B8048                           ; $0B804F |
  LDY #$05                                  ; $0B8051 |
code_0B8053:
  LDA $86B5,y                               ; $0B8053 |
  STA $00E8,y                               ; $0B8056 |
  DEY                                       ; $0B8059 |
  BPL code_0B8053                           ; $0B805A |
  JSR code_1FFF3C                           ; $0B805C |
  LDY #$01                                  ; $0B805F |
code_0B8061:
  LDA #$80                                  ; $0B8061 |
  STA $0300,y                               ; $0B8063 |
  LDA #$90                                  ; $0B8066 |
  STA $0580,y                               ; $0B8068 |
  LDA $86E3,y                               ; $0B806B |
  STA $05C0,y                               ; $0B806E |
  LDA $86E5,y                               ; $0B8071 |
  STA $0360,y                               ; $0B8074 |
  LDA $86E7,y                               ; $0B8077 |
  STA $03C0,y                               ; $0B807A |
  LDA #$00                                  ; $0B807D |
  STA $0380,y                               ; $0B807F |
  STA $05E0,y                               ; $0B8082 |
  STA $05A0,y                               ; $0B8085 |
  STA $03E0,y                               ; $0B8088 |
  STA $0500                                 ; $0B808B |
  STA $0520                                 ; $0B808E |
  STA $0540                                 ; $0B8091 |
  STA $0560                                 ; $0B8094 |
  LDA #$C0                                  ; $0B8097 |
  STA $0440,y                               ; $0B8099 |
  LDA #$FF                                  ; $0B809C |
  STA $0460,y                               ; $0B809E |
  DEY                                       ; $0B80A1 |
  BPL code_0B8061                           ; $0B80A2 |
  LDY #$07                                  ; $0B80A4 |
code_0B80A6:
  LDA $86E9,y                               ; $0B80A6 |
  STA $0200,y                               ; $0B80A9 |
  DEY                                       ; $0B80AC |
  BPL code_0B80A6                           ; $0B80AD |
  LDA #$11                                  ; $0B80AF |
  STA $F8                                   ; $0B80B1 |
  LDA #$C0                                  ; $0B80B3 |
  STA $5E                                   ; $0B80B5 |
  JSR code_1FFF21                           ; $0B80B7 |
  JSR code_1EC74C                           ; $0B80BA |
  LDA #$08                                  ; $0B80BD |
  STA $0500                                 ; $0B80BF |
  LDA #$00                                  ; $0B80C2 |
  STA $0104                                 ; $0B80C4 |
  STA $95                                   ; $0B80C7 |
  STA $F9                                   ; $0B80C9 |
code_0B80CB:
  LDX #$00                                  ; $0B80CB |
  LDA $05C0                                 ; $0B80CD |
  CMP #$04                                  ; $0B80D0 |
  BEQ code_0B80F9                           ; $0B80D2 |
  CMP #$01                                  ; $0B80D4 |
  BEQ code_0B811A                           ; $0B80D6 |
  JSR code_1FF797                           ; $0B80D8 |
  LDA #$A4                                  ; $0B80DB |
  CMP $03C0                                 ; $0B80DD |
  BCS code_0B80F1                           ; $0B80E0 |
  STA $03C0                                 ; $0B80E2 |
  LDA #$04                                  ; $0B80E5 |
  CMP $05A0                                 ; $0B80E7 |
  BNE code_0B811A                           ; $0B80EA |
  LDA #$04                                  ; $0B80EC |
  JSR code_1FF835                           ; $0B80EE |
code_0B80F1:
  LDA #$00                                  ; $0B80F1 |
  STA $05E0                                 ; $0B80F3 |
  JMP code_0B811A                           ; $0B80F6 |

code_0B80F9:
  LDA $05C0                                 ; $0B80F9 |
  CMP #$01                                  ; $0B80FC |
  BEQ code_0B811A                           ; $0B80FE |
  LDA $0340                                 ; $0B8100 |
  SEC                                       ; $0B8103 |
  SBC #$80                                  ; $0B8104 |
  STA $0340                                 ; $0B8106 |
  LDA $0360                                 ; $0B8109 |
  SBC #$01                                  ; $0B810C |
  STA $0360                                 ; $0B810E |
  CMP #$98                                  ; $0B8111 |
  BCS code_0B811A                           ; $0B8113 |
  LDA #$01                                  ; $0B8115 |
  JSR code_1FF835                           ; $0B8117 |
code_0B811A:
  LDA $B8                                   ; $0B811A |
  BNE code_0B8121                           ; $0B811C |
  STA $05E1                                 ; $0B811E |
code_0B8121:
  LDA $95                                   ; $0B8121 |
  AND #$03                                  ; $0B8123 |
  BNE code_0B814E                           ; $0B8125 |
  LDA $0104                                 ; $0B8127 |
  ASL                                       ; $0B812A |
  ADC $0104                                 ; $0B812B |
  TAY                                       ; $0B812E |
  LDX #$05                                  ; $0B812F |
code_0B8131:
  LDA $86C7,y                               ; $0B8131 |
  STA $0600,x                               ; $0B8134 |
  INY                                       ; $0B8137 |
  INX                                       ; $0B8138 |
  CPX #$08                                  ; $0B8139 |
  BNE code_0B8131                           ; $0B813B |
  STX $18                                   ; $0B813D |
  INC $0104                                 ; $0B813F |
  LDA $0104                                 ; $0B8142 |
  CMP #$06                                  ; $0B8145 |
  BNE code_0B814E                           ; $0B8147 |
  LDA #$00                                  ; $0B8149 |
  STA $0104                                 ; $0B814B |
code_0B814E:
  LDA #$08                                  ; $0B814E |
  STA $97                                   ; $0B8150 |
  JSR code_1FFD80                           ; $0B8152 |
  LDA $05C0                                 ; $0B8155 |
  CMP #$01                                  ; $0B8158 |
  BNE code_0B81AD                           ; $0B815A |
  LDA $0520                                 ; $0B815C |
  BNE code_0B8190                           ; $0B815F |
  LDA $95                                   ; $0B8161 |
  AND #$03                                  ; $0B8163 |
  BNE code_0B81AD                           ; $0B8165 |
  LDA #$0E                                  ; $0B8167 |
  STA $F5                                   ; $0B8169 |
  JSR code_1FFF6B                           ; $0B816B |
  LDA $B8                                   ; $0B816E |
  BNE code_0B817B                           ; $0B8170 |
  LDX $0500                                 ; $0B8172 |
  JSR $A006                                 ; $0B8175 |
  JMP code_0B81AD                           ; $0B8178 |

code_0B817B:
  JSR $A003                                 ; $0B817B |
  LDA $B8                                   ; $0B817E |
  CMP #$FF                                  ; $0B8180 |
  BNE code_0B81AD                           ; $0B8182 |
  INC $0500                                 ; $0B8184 |
  LDA #$00                                  ; $0B8187 |
  STA $B8                                   ; $0B8189 |
  LDA #$B5                                  ; $0B818B |
  STA $0520                                 ; $0B818D |
code_0B8190:
  DEC $0520                                 ; $0B8190 |
  BNE code_0B81AD                           ; $0B8193 |
  LDA $0500                                 ; $0B8195 |
  CMP #$0A                                  ; $0B8198 |
  BEQ code_0B81B0                           ; $0B819A |
  LDA #$0E                                  ; $0B819C |
  STA $F5                                   ; $0B819E |
  JSR code_1FFF6B                           ; $0B81A0 |
  LDA #$00                                  ; $0B81A3 |
  STA $EE                                   ; $0B81A5 |
  JSR $A000                                 ; $0B81A7 |
  JSR code_1FFF21                           ; $0B81AA |
code_0B81AD:
  JMP code_0B80CB                           ; $0B81AD |

code_0B81B0:
  LDA #$00                                  ; $0B81B0 |
  STA $EE                                   ; $0B81B2 |
  JSR code_1EC752                           ; $0B81B4 |
  LDA #$04                                  ; $0B81B7 |
  STA $97                                   ; $0B81B9 |
  JSR code_1EC5E9                           ; $0B81BB |
  JSR code_1EC628                           ; $0B81BE |
  JSR code_1FFF21                           ; $0B81C1 |
  LDA #$00                                  ; $0B81C4 |
  STA $70                                   ; $0B81C6 |
  STA $F8                                   ; $0B81C8 |
  LDA #$13                                  ; $0B81CA |
  STA $F5                                   ; $0B81CC |
  JSR code_1FFF6B                           ; $0B81CE |
  LDA #$08                                  ; $0B81D1 |
  JSR code_1FE8B4                           ; $0B81D3 |
code_0B81D6:
  LDA #$00                                  ; $0B81D6 |
  STA $10                                   ; $0B81D8 |
  JSR code_1FEF8C                           ; $0B81DA |
  JSR code_1FFF21                           ; $0B81DD |
  LDA $70                                   ; $0B81E0 |
  BNE code_0B81D6                           ; $0B81E2 |
  LDY #$1F                                  ; $0B81E4 |
code_0B81E6:
  LDA $8675,y                               ; $0B81E6 |
  STA $0620,y                               ; $0B81E9 |
  DEY                                       ; $0B81EC |
  BPL code_0B81E6                           ; $0B81ED |
  LDY #$05                                  ; $0B81EF |
code_0B81F1:
  LDA $86BB,y                               ; $0B81F1 |
  STA $00E8,y                               ; $0B81F4 |
  DEY                                       ; $0B81F7 |
  BPL code_0B81F1                           ; $0B81F8 |
  JSR code_1FFF3C                           ; $0B81FA |
  LDA #$80                                  ; $0B81FD |
  STA $0300                                 ; $0B81FF |
  LDA #$90                                  ; $0B8202 |
  STA $0580                                 ; $0B8204 |
  LDA #$5F                                  ; $0B8207 |
  STA $05C0                                 ; $0B8209 |
  LDA #$80                                  ; $0B820C |
  STA $0360                                 ; $0B820E |
  LDA #$E8                                  ; $0B8211 |
  STA $03C0                                 ; $0B8213 |
  LDA #$00                                  ; $0B8216 |
  STA $0380                                 ; $0B8218 |
  STA $05E0                                 ; $0B821B |
  STA $05A0                                 ; $0B821E |
  STA $03E0                                 ; $0B8221 |
  STA $0104                                 ; $0B8224 |
  STA $0520                                 ; $0B8227 |
  STA $0400                                 ; $0B822A |
  LDA #$10                                  ; $0B822D |
  STA $0500                                 ; $0B822F |
  LDA #$04                                  ; $0B8232 |
  STA $0420                                 ; $0B8234 |
  JSR code_1FFF21                           ; $0B8237 |
  JSR code_1EC74C                           ; $0B823A |
code_0B823D:
  LDA $03E0                                 ; $0B823D |
  BNE code_0B8291                           ; $0B8240 |
  JSR code_0B8603                           ; $0B8242 |
  LDA $95                                   ; $0B8245 |
  AND #$0F                                  ; $0B8247 |
  BNE code_0B8269                           ; $0B8249 |
  LDA $0104                                 ; $0B824B |
  ASL                                       ; $0B824E |
  ADC $0104                                 ; $0B824F |
  TAY                                       ; $0B8252 |
  LDX #$05                                  ; $0B8253 |
code_0B8255:
  LDA $86D9,y                               ; $0B8255 |
  STA $0600,x                               ; $0B8258 |
  INY                                       ; $0B825B |
  INX                                       ; $0B825C |
  CPX #$08                                  ; $0B825D |
  BNE code_0B8255                           ; $0B825F |
  LDA $0104                                 ; $0B8261 |
  EOR #$01                                  ; $0B8264 |
  STA $0104                                 ; $0B8266 |
code_0B8269:
  LDA $95                                   ; $0B8269 |
  AND #$07                                  ; $0B826B |
  BNE code_0B827E                           ; $0B826D |
  LDA $0105                                 ; $0B826F |
  INC $0105                                 ; $0B8272 |
  AND #$03                                  ; $0B8275 |
  TAY                                       ; $0B8277 |
  LDA $86DF,y                               ; $0B8278 |
  STA $060D                                 ; $0B827B |
code_0B827E:
  LDA $95                                   ; $0B827E |
  AND #$0F                                  ; $0B8280 |
  BNE code_0B8289                           ; $0B8282 |
  LDA #$28                                  ; $0B8284 |
  JSR code_1FF89A                           ; $0B8286 |
code_0B8289:
  INC $18                                   ; $0B8289 |
  JSR code_1FFD6E                           ; $0B828B |
  JMP code_0B823D                           ; $0B828E |

code_0B8291:
  LDA #$00                                  ; $0B8291 |
  STA $EE                                   ; $0B8293 |
  JSR code_1EC752                           ; $0B8295 |
  LDA #$00                                  ; $0B8298 |
  STA $03E0                                 ; $0B829A |
  STA $0380                                 ; $0B829D |
  STA $0520                                 ; $0B82A0 |
  STA $0540                                 ; $0B82A3 |
  STA $0560                                 ; $0B82A6 |
  STA $0440                                 ; $0B82A9 |
  STA $0460                                 ; $0B82AC |
  STA $0400                                 ; $0B82AF |
  LDA #$04                                  ; $0B82B2 |
  STA $0420                                 ; $0B82B4 |
  LDA #$10                                  ; $0B82B7 |
  STA $0500                                 ; $0B82B9 |
  LDA #$E8                                  ; $0B82BC |
  STA $03C0                                 ; $0B82BE |
  LDA #$80                                  ; $0B82C1 |
  STA $0360                                 ; $0B82C3 |
  LDA #$80                                  ; $0B82C6 |
  STA $0300                                 ; $0B82C8 |
  LDA #$98                                  ; $0B82CB |
  STA $0580                                 ; $0B82CD |
  LDY #$0F                                  ; $0B82D0 |
code_0B82D2:
  LDA #$0F                                  ; $0B82D2 |
  STA $0620,y                               ; $0B82D4 |
  LDA $0630,y                               ; $0B82D7 |
  STA $0610,y                               ; $0B82DA |
  DEY                                       ; $0B82DD |
  BPL code_0B82D2                           ; $0B82DE |
  STY $18                                   ; $0B82E0 |
code_0B82E2:
  LDA $0380                                 ; $0B82E2 |
  BEQ code_0B82EA                           ; $0B82E5 |
  JMP code_0B8439                           ; $0B82E7 |

code_0B82EA:
  LDA $0300                                 ; $0B82EA |
  AND #$0F                                  ; $0B82ED |
  BEQ code_0B82F4                           ; $0B82EF |
  JMP code_0B83A8                           ; $0B82F1 |

code_0B82F4:
  LDA $03C0                                 ; $0B82F4 |
  CMP #$60                                  ; $0B82F7 |
  BEQ code_0B8301                           ; $0B82F9 |
  DEC $03C0                                 ; $0B82FB |
  JMP code_0B83E7                           ; $0B82FE |

code_0B8301:
  LDA #$5E                                  ; $0B8301 |
  CMP $05C0                                 ; $0B8303 |
  BCS code_0B8344                           ; $0B8306 |
  LDA #$5D                                  ; $0B8308 |
  LDX #$00                                  ; $0B830A |
  JSR code_1FF835                           ; $0B830C |
  LDA $0300                                 ; $0B830F |
  STA $0301                                 ; $0B8312 |
  LDA $0580                                 ; $0B8315 |
  STA $0581                                 ; $0B8318 |
  LDA $0380                                 ; $0B831B |
  STA $0381                                 ; $0B831E |
  LDA $03E0                                 ; $0B8321 |
  STA $03E1                                 ; $0B8324 |
  LDA $0360                                 ; $0B8327 |
  STA $0361                                 ; $0B832A |
  LDA $03C0                                 ; $0B832D |
  STA $03C1                                 ; $0B8330 |
  LDX #$01                                  ; $0B8333 |
  LDA #$5C                                  ; $0B8335 |
  JSR code_1FF835                           ; $0B8337 |
  LDA #$5C                                  ; $0B833A |
  STA $0501                                 ; $0B833C |
  LDA #$B4                                  ; $0B833F |
  STA $0521                                 ; $0B8341 |
code_0B8344:
  LDA $0501                                 ; $0B8344 |
  CMP #$21                                  ; $0B8347 |
  BCS code_0B8352                           ; $0B8349 |
  CMP #$11                                  ; $0B834B |
  BCC code_0B835C                           ; $0B834D |
  DEC $03C1                                 ; $0B834F |
code_0B8352:
  LDA #$00                                  ; $0B8352 |
  STA $95                                   ; $0B8354 |
  DEC $0501                                 ; $0B8356 |
  JMP code_0B83EA                           ; $0B8359 |

code_0B835C:
  LDA $0521                                 ; $0B835C |
  BEQ code_0B8375                           ; $0B835F |
  DEC $0521                                 ; $0B8361 |
  LDA $0521                                 ; $0B8364 |
  CMP #$78                                  ; $0B8367 |
  BNE code_0B8372                           ; $0B8369 |
  LDX #$00                                  ; $0B836B |
  LDA #$5E                                  ; $0B836D |
  JSR code_1FF835                           ; $0B836F |
code_0B8372:
  JMP code_0B83EA                           ; $0B8372 |

code_0B8375:
  LDA #$00                                  ; $0B8375 |
  STA $95                                   ; $0B8377 |
  INC $03C1                                 ; $0B8379 |
  DEC $0501                                 ; $0B837C |
  BNE code_0B83EA                           ; $0B837F |
  LDX #$00                                  ; $0B8381 |
  STX $0301                                 ; $0B8383 |
  LDA #$5F                                  ; $0B8386 |
  JSR code_1FF835                           ; $0B8388 |
  INC $0300                                 ; $0B838B |
  LDA #$F0                                  ; $0B838E |
  STA $0521                                 ; $0B8390 |
  LDA #$10                                  ; $0B8393 |
  STA $0500                                 ; $0B8395 |
  LDA #$00                                  ; $0B8398 |
  STA $0400                                 ; $0B839A |
  STA $0520                                 ; $0B839D |
  LDA #$04                                  ; $0B83A0 |
  STA $0420                                 ; $0B83A2 |
  JMP code_0B83EA                           ; $0B83A5 |

code_0B83A8:
  LDA $0521                                 ; $0B83A8 |
  BEQ code_0B83CC                           ; $0B83AB |
  DEC $0521                                 ; $0B83AD |
  LDA $0440                                 ; $0B83B0 |
  CLC                                       ; $0B83B3 |
  ADC #$10                                  ; $0B83B4 |
  STA $0440                                 ; $0B83B6 |
  LDA $0460                                 ; $0B83B9 |
  ADC #$00                                  ; $0B83BC |
  STA $0460                                 ; $0B83BE |
  CMP #$04                                  ; $0B83C1 |
  BNE code_0B83EA                           ; $0B83C3 |
  LDA #$00                                  ; $0B83C5 |
  STA $0440                                 ; $0B83C7 |
  BEQ code_0B83EA                           ; $0B83CA |
code_0B83CC:
  LDA $0520                                 ; $0B83CC |
  CMP #$01                                  ; $0B83CF |
  BNE code_0B83E7                           ; $0B83D1 |
  LDA $0360                                 ; $0B83D3 |
  SEC                                       ; $0B83D6 |
  SBC #$04                                  ; $0B83D7 |
  STA $0360                                 ; $0B83D9 |
  LDA $0380                                 ; $0B83DC |
  SBC #$00                                  ; $0B83DF |
  STA $0380                                 ; $0B83E1 |
  JMP code_0B83EA                           ; $0B83E4 |

code_0B83E7:
  JSR code_0B861B                           ; $0B83E7 |
code_0B83EA:
  LDA $0540                                 ; $0B83EA |
  CLC                                       ; $0B83ED |
  ADC $0460                                 ; $0B83EE |
  STA $0540                                 ; $0B83F1 |
  LDX #$00                                  ; $0B83F4 |
code_0B83F6:
  LDA $8735,x                               ; $0B83F6 |
  STA $0200,x                               ; $0B83F9 |
  LDA $8736,x                               ; $0B83FC |
  STA $0201,x                               ; $0B83FF |
  LDA $8737,x                               ; $0B8402 |
  STA $0202,x                               ; $0B8405 |
  LDA $8738,x                               ; $0B8408 |
  CLC                                       ; $0B840B |
  ADC $0540                                 ; $0B840C |
  STA $0203,x                               ; $0B840F |
  INX                                       ; $0B8412 |
  INX                                       ; $0B8413 |
  INX                                       ; $0B8414 |
  INX                                       ; $0B8415 |
  CPX #$28                                  ; $0B8416 |
  BNE code_0B83F6                           ; $0B8418 |
  LDA $95                                   ; $0B841A |
  AND #$01                                  ; $0B841C |
  BEQ code_0B8422                           ; $0B841E |
  LDX #$04                                  ; $0B8420 |
code_0B8422:
  STX $97                                   ; $0B8422 |
  LDA $0560                                 ; $0B8424 |
  AND #$0F                                  ; $0B8427 |
  BNE code_0B8430                           ; $0B8429 |
  LDA #$28                                  ; $0B842B |
  JSR code_1FF89A                           ; $0B842D |
code_0B8430:
  JSR code_1FFD80                           ; $0B8430 |
  INC $0560                                 ; $0B8433 |
  JMP code_0B82E2                           ; $0B8436 |

code_0B8439:
  LDA #$00                                  ; $0B8439 |
  STA $EE                                   ; $0B843B |
  JSR code_1EC752                           ; $0B843D |
  LDA #$36                                  ; $0B8440 |
  JSR code_1FF898                           ; $0B8442 |
  LDA #$04                                  ; $0B8445 |
  STA $97                                   ; $0B8447 |
  JSR code_1EC5E9                           ; $0B8449 |
  JSR code_1EC628                           ; $0B844C |
  JSR code_1FFF21                           ; $0B844F |
  LDA #$16                                  ; $0B8452 |
  STA $22                                   ; $0B8454 |
  LDA #$00                                  ; $0B8456 |
  STA $70                                   ; $0B8458 |
  LDA #$0E                                  ; $0B845A |
  STA $F5                                   ; $0B845C |
  JSR code_1FFF6B                           ; $0B845E |
  LDA #$00                                  ; $0B8461 |
  JSR code_1FE8B4                           ; $0B8463 |
code_0B8466:
  LDA #$00                                  ; $0B8466 |
  STA $10                                   ; $0B8468 |
  JSR code_1FEF8C                           ; $0B846A |
  JSR code_1FFF21                           ; $0B846D |
  LDA $70                                   ; $0B8470 |
  BNE code_0B8466                           ; $0B8472 |
  LDY #$1F                                  ; $0B8474 |
code_0B8476:
  LDA $8695,y                               ; $0B8476 |
  STA $0620,y                               ; $0B8479 |
  DEY                                       ; $0B847C |
  BPL code_0B8476                           ; $0B847D |
  LDY #$05                                  ; $0B847F |
code_0B8481:
  LDA $86C1,y                               ; $0B8481 |
  STA $00E8,y                               ; $0B8484 |
  DEY                                       ; $0B8487 |
  BPL code_0B8481                           ; $0B8488 |
  JSR code_1FFF3C                           ; $0B848A |
  LDY #$27                                  ; $0B848D |
code_0B848F:
  LDA $86F1,y                               ; $0B848F |
  STA $0200,y                               ; $0B8492 |
  DEY                                       ; $0B8495 |
  BPL code_0B848F                           ; $0B8496 |
  JSR code_1EC628                           ; $0B8498 |
  JSR code_1FFF21                           ; $0B849B |
  JSR code_1EC74C                           ; $0B849E |
  LDY #$13                                  ; $0B84A1 |
code_0B84A3:
  LDA $8719,y                               ; $0B84A3 |
  STA $0228,y                               ; $0B84A6 |
  DEY                                       ; $0B84A9 |
  BPL code_0B84A3                           ; $0B84AA |
  LDA #$80                                  ; $0B84AC |
  STA $0300                                 ; $0B84AE |
  STA $0580                                 ; $0B84B1 |
  LDA #$00                                  ; $0B84B4 |
  STA $05E0                                 ; $0B84B6 |
  STA $05A0                                 ; $0B84B9 |
  STA $0380                                 ; $0B84BC |
  STA $03E0                                 ; $0B84BF |
  LDA #$60                                  ; $0B84C2 |
  STA $0360                                 ; $0B84C4 |
  LDA #$24                                  ; $0B84C7 |
  STA $03C0                                 ; $0B84C9 |
  LDA #$7B                                  ; $0B84CC |
  STA $05C0                                 ; $0B84CE |
  LDA #$00                                  ; $0B84D1 |
  STA $95                                   ; $0B84D3 |
  LDA #$20                                  ; $0B84D5 |
  STA $10                                   ; $0B84D7 |
code_0B84D9:
  LDA $95                                   ; $0B84D9 |
  AND #$07                                  ; $0B84DB |
  BNE code_0B84EC                           ; $0B84DD |
  LDA $10                                   ; $0B84DF |
  STA $0610                                 ; $0B84E1 |
  INC $18                                   ; $0B84E4 |
  LDA $10                                   ; $0B84E6 |
  EOR #$2F                                  ; $0B84E8 |
  STA $10                                   ; $0B84EA |
code_0B84EC:
  JSR code_1FFF21                           ; $0B84EC |
  INC $95                                   ; $0B84EF |
  LDA $95                                   ; $0B84F1 |
  CMP #$30                                  ; $0B84F3 |
  BCC code_0B84D9                           ; $0B84F5 |
  JSR code_0B854B                           ; $0B84F7 |
  LDA #$00                                  ; $0B84FA |
  STA $EE                                   ; $0B84FC |
  LDA #$3C                                  ; $0B84FE |
code_0B8500:
  PHA                                       ; $0B8500 |
  JSR code_0B8525                           ; $0B8501 |
  PLA                                       ; $0B8504 |
  SEC                                       ; $0B8505 |
  SBC #$01                                  ; $0B8506 |
  BNE code_0B8500                           ; $0B8508 |
  JSR code_0B8591                           ; $0B850A |
  LDA #$3C                                  ; $0B850D |
code_0B850F:
  PHA                                       ; $0B850F |
  JSR code_0B8525                           ; $0B8510 |
  PLA                                       ; $0B8513 |
  SEC                                       ; $0B8514 |
  SBC #$01                                  ; $0B8515 |
  BNE code_0B850F                           ; $0B8517 |
  LDA $75                                   ; $0B8519 |
  CLC                                       ; $0B851B |
  ADC #$0C                                  ; $0B851C |
  STA $22                                   ; $0B851E |
  STA $F5                                   ; $0B8520 |
  JMP code_1FFF6B                           ; $0B8522 |

code_0B8525:
  TXA                                       ; $0B8525 |
  PHA                                       ; $0B8526 |
  TYA                                       ; $0B8527 |
  PHA                                       ; $0B8528 |
  LDA #$C8                                  ; $0B8529 |
  STA $97                                   ; $0B852B |
  LDY $75                                   ; $0B852D |
  CPY #$04                                  ; $0B852F |
  BCS code_0B8543                           ; $0B8531 |
  LDX $875E,y                               ; $0B8533 |
  LDA $95                                   ; $0B8536 |
  LSR                                       ; $0B8538 |
  LSR                                       ; $0B8539 |
  LSR                                       ; $0B853A |
  AND #$01                                  ; $0B853B |
  CLC                                       ; $0B853D |
  ADC #$02                                  ; $0B853E |
  STA $0202,x                               ; $0B8540 |
code_0B8543:
  JSR code_1FFD80                           ; $0B8543 |
  PLA                                       ; $0B8546 |
  TAY                                       ; $0B8547 |
  PLA                                       ; $0B8548 |
  TAX                                       ; $0B8549 |
  RTS                                       ; $0B854A |

code_0B854B:
  LDA #$40                                  ; $0B854B |
  STA $10                                   ; $0B854D |
  LDA #$00                                  ; $0B854F |
  STA $0500                                 ; $0B8551 |
code_0B8554:
  LDY $0500                                 ; $0B8554 |
  CPY $75                                   ; $0B8557 |
  BEQ code_0B8590                           ; $0B8559 |
  LDX $8762,y                               ; $0B855B |
  LDA $8768,y                               ; $0B855E |
  STA $00                                   ; $0B8561 |
  LDY $10                                   ; $0B8563 |
code_0B8565:
  LDA $8774,x                               ; $0B8565 |
  STA $0200,y                               ; $0B8568 |
  LDA $8775,x                               ; $0B856B |
  STA $0201,y                               ; $0B856E |
  LDA $8776,x                               ; $0B8571 |
  STA $0202,y                               ; $0B8574 |
  LDA $8777,x                               ; $0B8577 |
  STA $0203,y                               ; $0B857A |
  INX                                       ; $0B857D |
  INX                                       ; $0B857E |
  INX                                       ; $0B857F |
  INX                                       ; $0B8580 |
  INY                                       ; $0B8581 |
  INY                                       ; $0B8582 |
  INY                                       ; $0B8583 |
  INY                                       ; $0B8584 |
  STY $10                                   ; $0B8585 |
  DEC $00                                   ; $0B8587 |
  BPL code_0B8565                           ; $0B8589 |
  INC $0500                                 ; $0B858B |
  BNE code_0B8554                           ; $0B858E |
code_0B8590:
  RTS                                       ; $0B8590 |

code_0B8591:
  LDY $0500                                 ; $0B8591 |
  LDX $8762,y                               ; $0B8594 |
  LDA $8768,y                               ; $0B8597 |
  STA $0F                                   ; $0B859A |
  LDA $876E,y                               ; $0B859C |
  TAY                                       ; $0B859F |
code_0B85A0:
  LDA $8774,x                               ; $0B85A0 |
  STA $0240,y                               ; $0B85A3 |
  LDA $8775,x                               ; $0B85A6 |
  STA $0241,y                               ; $0B85A9 |
  LDA $8776,x                               ; $0B85AC |
  STA $0242,y                               ; $0B85AF |
  LDA $8777,x                               ; $0B85B2 |
  STA $0243,y                               ; $0B85B5 |
  INX                                       ; $0B85B8 |
  INX                                       ; $0B85B9 |
  INX                                       ; $0B85BA |
  INX                                       ; $0B85BB |
  INY                                       ; $0B85BC |
  INY                                       ; $0B85BD |
  INY                                       ; $0B85BE |
  INY                                       ; $0B85BF |
  STY $10                                   ; $0B85C0 |
  LDA #$1C                                  ; $0B85C2 |
  JSR code_1FF89A                           ; $0B85C4 |
  JSR code_0B8525                           ; $0B85C7 |
  JSR code_0B8525                           ; $0B85CA |
  JSR code_0B8525                           ; $0B85CD |
  JSR code_0B8525                           ; $0B85D0 |
  DEC $0F                                   ; $0B85D3 |
  BPL code_0B85A0                           ; $0B85D5 |
  LDA $75                                   ; $0B85D7 |
  CMP #$05                                  ; $0B85D9 |
  BNE code_0B8602                           ; $0B85DB |
  LDA #$80                                  ; $0B85DD |
  STA $0301                                 ; $0B85DF |
  STA $0581                                 ; $0B85E2 |
  LDA #$00                                  ; $0B85E5 |
  STA $0381                                 ; $0B85E7 |
  STA $03E1                                 ; $0B85EA |
  STA $05E1                                 ; $0B85ED |
  STA $05A1                                 ; $0B85F0 |
  LDA #$7B                                  ; $0B85F3 |
  STA $05C1                                 ; $0B85F5 |
  LDA #$60                                  ; $0B85F8 |
  STA $0361                                 ; $0B85FA |
  LDA #$4C                                  ; $0B85FD |
  STA $03C1                                 ; $0B85FF |
code_0B8602:
  RTS                                       ; $0B8602 |

code_0B8603:
  LDA $03C0                                 ; $0B8603 |
  SEC                                       ; $0B8606 |
  SBC #$01                                  ; $0B8607 |
  STA $03C0                                 ; $0B8609 |
  LDA $03E0                                 ; $0B860C |
  SBC #$00                                  ; $0B860F |
  STA $03E0                                 ; $0B8611 |
  LDA $03C0                                 ; $0B8614 |
  CMP #$60                                  ; $0B8617 |
  BCS code_0B8654                           ; $0B8619 |
code_0B861B:
  LDA $0340                                 ; $0B861B |
  CLC                                       ; $0B861E |
  ADC $0400                                 ; $0B861F |
  STA $0340                                 ; $0B8622 |
  LDA $0360                                 ; $0B8625 |
  ADC $0420                                 ; $0B8628 |
  STA $0360                                 ; $0B862B |
  LDA $0520                                 ; $0B862E |
  AND #$03                                  ; $0B8631 |
  TAY                                       ; $0B8633 |
  LDA $0400                                 ; $0B8634 |
  CLC                                       ; $0B8637 |
  ADC $872D,y                               ; $0B8638 |
  STA $0400                                 ; $0B863B |
  LDA $0420                                 ; $0B863E |
  ADC $8731,y                               ; $0B8641 |
  STA $0420                                 ; $0B8644 |
  DEC $0500                                 ; $0B8647 |
  BNE code_0B8654                           ; $0B864A |
  INC $0520                                 ; $0B864C |
  LDA #$10                                  ; $0B864F |
  STA $0500                                 ; $0B8651 |
code_0B8654:
  RTS                                       ; $0B8654 |

  db $0F, $20, $2C, $1C, $0F, $1C, $27, $16 ; $0B8655 |
  db $0F, $3B, $2B, $1B, $0F, $32, $22, $12 ; $0B865D |
  db $0F, $0F, $2C, $11, $0F, $0F, $30, $37 ; $0B8665 |
  db $0F, $35, $25, $15, $0F, $0F, $30, $11 ; $0B866D |
  db $0F, $20, $1B, $0B, $0F, $1C, $11, $01 ; $0B8675 |
  db $0F, $28, $18, $08, $0F, $04, $13, $03 ; $0B867D |
  db $0F, $0F, $2C, $11, $0F, $0F, $30, $37 ; $0B8685 |
  db $0F, $0F, $2C, $11, $0F, $0F, $30, $27 ; $0B868D |
  db $0F, $20, $27, $17, $0F, $3B, $2A, $1A ; $0B8695 |
  db $0F, $3C, $2C, $1C, $0F, $33, $23, $17 ; $0B869D |
  db $0F, $2A, $27, $17, $0F, $3C, $2C, $1C ; $0B86A5 |
  db $0F, $0F, $30, $37, $0F, $0F, $30, $27 ; $0B86AD |
  db $78, $7A, $00, $01, $1B, $3B, $50, $52 ; $0B86B5 |
  db $39, $25, $36, $17, $70, $72, $09, $39 ; $0B86BD |
  db $36, $35, $1C, $27, $16, $0F, $1C, $1A ; $0B86C5 |
  db $16, $0F, $0F, $0F, $1A, $16, $17, $0F ; $0B86CD |
  db $0F, $1A, $16, $0F, $1C, $11, $01, $11 ; $0B86D5 |
  db $1C, $01, $04, $14, $0F, $0F, $13, $60 ; $0B86DD |
  db $D8, $58, $00, $A4, $68, $BE, $02, $18 ; $0B86E5 |
  db $68, $BF, $02, $20, $40, $9D, $01, $70 ; $0B86ED |
  db $B8, $9B, $00, $C0, $88, $97, $00, $78 ; $0B86F5 |
  db $88, $98, $00, $80, $90, $99, $00, $78 ; $0B86FD |
  db $90, $9A, $00, $80, $48, $9C, $01, $80 ; $0B8705 |
  db $68, $9C, $01, $78, $68, $9C, $01, $80 ; $0B870D |
  db $68, $9C, $01, $88, $C8, $0F, $03, $D8 ; $0B8715 |
  db $A0, $0F, $03, $C8, $78, $0F, $03, $C8 ; $0B871D |
  db $58, $0F, $03, $B0, $30, $0F, $03, $88 ; $0B8725 |
  db $C0, $C0, $40, $40, $FF, $FF, $00, $00 ; $0B872D |
  db $78, $F1, $00, $10, $18, $F1, $00, $20 ; $0B8735 |
  db $D0, $F1, $00, $30, $38, $F1, $00, $48 ; $0B873D |
  db $A0, $F1, $00, $68, $18, $F1, $00, $98 ; $0B8745 |
  db $60, $F1, $00, $B8, $B8, $F1, $00, $D0 ; $0B874D |
  db $28, $F1, $00, $E0, $88, $F1, $00, $E8 ; $0B8755 |
  db $28, $2C, $30, $34, $38, $00, $18, $28 ; $0B875D |
  db $40, $64, $7C, $05, $03, $05, $08, $05 ; $0B8765 |
  db $03, $00, $18, $28, $40, $64, $7C, $C0 ; $0B876D |
  db $7F, $03, $D8, $B8, $7F, $03, $D8, $B0 ; $0B8775 |
  db $7F, $03, $D8, $A8, $7F, $03, $D8, $A0 ; $0B877D |
  db $7D, $03, $D8, $A0, $7E, $03, $D0, $98 ; $0B8785 |
  db $7F, $03, $C8, $90, $7F, $03, $C8, $88 ; $0B878D |
  db $7F, $03, $C8, $80, $7F, $03, $C8, $70 ; $0B8795 |
  db $7F, $03, $C8, $68, $7F, $03, $C8, $60 ; $0B879D |
  db $7F, $03, $C8, $58, $7D, $03, $C8, $58 ; $0B87A5 |
  db $7E, $03, $C0, $58, $7E, $03, $B8, $50 ; $0B87AD |
  db $7F, $03, $B0, $48, $7F, $03, $B0, $40 ; $0B87B5 |
  db $7F, $03, $B0, $38, $7F, $03, $B0, $30 ; $0B87BD |
  db $7D, $03, $B0, $30, $7E, $03, $A8, $30 ; $0B87C5 |
  db $7E, $03, $A0, $30, $7E, $03, $98, $30 ; $0B87CD |
  db $7E, $03, $90, $28, $7F, $03, $88, $20 ; $0B87D5 |
  db $7D, $03, $88, $20, $7E, $03, $80, $20 ; $0B87DD |
  db $7E, $03, $78, $20, $7E, $03, $70, $20 ; $0B87E5 |
  db $7E, $03, $68, $2C, $7F, $03, $5C, $34 ; $0B87ED |
  db $7F, $03, $5C, $3C, $7F, $03, $5C, $44 ; $0B87F5 |
  db $7F, $03, $5C, $80, $24, $00, $60, $08 ; $0B87FD |
  db $46, $00, $20, $02, $14, $00, $00, $88 ; $0B8805 |
  db $00, $00, $A1, $00, $01, $00, $28, $00 ; $0B880D |
  db $08, $00, $A0, $00, $22, $08, $00, $02 ; $0B8815 |
  db $80, $00, $00, $00, $00, $00, $08, $00 ; $0B881D |
  db $01, $00, $00, $00, $08, $00, $00, $00 ; $0B8825 |
  db $00, $00, $00, $00, $00, $00, $04, $20 ; $0B882D |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $0B8835 |
  db $00, $00, $01, $00, $80, $00, $08, $00 ; $0B883D |
  db $04, $00, $01, $00, $00, $00, $08, $00 ; $0B8845 |
  db $40, $00, $01, $00, $00, $28, $40, $00 ; $0B884D |
  db $00, $20, $00, $00, $00, $00, $21, $00 ; $0B8855 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0B885D |
  db $00, $00, $00, $00, $80, $00, $00, $00 ; $0B8865 |
  db $80, $00, $02, $00, $00, $00, $00, $00 ; $0B886D |
  db $00, $00, $00, $02, $00, $00, $40, $00 ; $0B8875 |
  db $00, $00, $00, $00, $00, $00, $00, $08 ; $0B887D |
  db $40, $00, $02, $00, $00, $00, $00, $00 ; $0B8885 |
  db $40, $02, $00, $00, $00, $08, $00, $00 ; $0B888D |
  db $00, $00, $10, $00, $01, $00, $00, $02 ; $0B8895 |
  db $00, $00, $00, $00, $00, $00, $08, $00 ; $0B889D |
  db $00, $00, $00, $20, $44, $00, $00, $00 ; $0B88A5 |
  db $08, $00, $00, $00, $00, $00, $00, $00 ; $0B88AD |
  db $00, $00, $00, $00, $40, $00, $00, $00 ; $0B88B5 |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $0B88BD |
  db $00, $00, $00, $20, $00, $00, $00, $00 ; $0B88C5 |
  db $00, $00, $00, $00, $40, $08, $00, $00 ; $0B88CD |
  db $08, $00, $00, $00, $00, $00, $00, $00 ; $0B88D5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0B88DD |
  db $08, $20, $00, $08, $00, $00, $00, $00 ; $0B88E5 |
  db $00, $00, $00, $02, $01, $00, $00, $08 ; $0B88ED |
  db $00, $00, $00, $00, $00, $80, $00, $00 ; $0B88F5 |
  db $00, $80, $00, $00, $10, $00, $40, $20 ; $0B88FD |
  db $20, $00, $00, $00, $00, $00, $20, $08 ; $0B8905 |
  db $00, $00, $00, $20, $04, $00, $02, $00 ; $0B890D |
  db $00, $80, $00, $00, $08, $00, $04, $00 ; $0B8915 |
  db $00, $02, $8C, $00, $00, $00, $00, $10 ; $0B891D |
  db $08, $00, $10, $00, $00, $00, $00, $00 ; $0B8925 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0B892D |
  db $00, $00, $82, $00, $00, $00, $00, $00 ; $0B8935 |
  db $00, $00, $01, $02, $00, $00, $00, $00 ; $0B893D |
  db $00, $00, $00, $80, $00, $20, $00, $00 ; $0B8945 |
  db $00, $00, $00, $00, $00, $02, $00, $00 ; $0B894D |
  db $00, $00, $00, $08, $10, $00, $00, $00 ; $0B8955 |
  db $00, $00, $04, $20, $00, $00, $00, $00 ; $0B895D |
  db $00, $00, $00, $08, $00, $00, $00, $00 ; $0B8965 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0B896D |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0B8975 |
  db $00, $00, $00, $A8, $00, $00, $00, $00 ; $0B897D |
  db $00, $02, $20, $00, $00, $00, $00, $00 ; $0B8985 |
  db $41, $80, $21, $00, $08, $00, $00, $00 ; $0B898D |
  db $00, $80, $00, $08, $00, $00, $10, $00 ; $0B8995 |
  db $00, $00, $00, $00, $00, $00, $01, $02 ; $0B899D |
  db $00, $00, $00, $00, $00, $00, $04, $00 ; $0B89A5 |
  db $00, $00, $00, $00, $00, $00, $40, $00 ; $0B89AD |
  db $04, $00, $00, $00, $00, $00, $40, $00 ; $0B89B5 |
  db $00, $00, $00, $00, $00, $00, $08, $08 ; $0B89BD |
  db $08, $00, $00, $00, $00, $00, $00, $00 ; $0B89C5 |
  db $05, $00, $02, $00, $00, $00, $08, $00 ; $0B89CD |
  db $00, $00, $11, $00, $00, $00, $00, $00 ; $0B89D5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0B89DD |
  db $00, $00, $00, $00, $00, $00, $02, $00 ; $0B89E5 |
  db $00, $00, $00, $00, $00, $00, $04, $00 ; $0B89ED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0B89F5 |
  db $00, $48, $00, $00, $01, $02, $03, $04 ; $0B89FD |
  db $05, $06, $07, $08, $09, $0A, $0B, $0C ; $0BAA05 |
  db $0D, $0E, $0F, $10, $11, $12, $13, $14 ; $0BAA0D |
  db $15, $16, $17, $18, $19, $08, $00, $00 ; $0BAA15 |
  db $00, $02, $08, $00, $00, $20, $21, $00 ; $0BAA1D |
  db $00, $00, $00, $02, $00, $00, $00, $00 ; $0BAA25 |
  db $00, $00, $00, $0D, $5A, $5A, $5A, $00 ; $0BAA2D |
  db $00, $00, $00, $17, $5A, $5A, $00, $00 ; $0BAA35 |
  db $00, $00, $00, $40, $40, $40, $61, $40 ; $0BAA3D |
  db $66, $60, $20, $20, $22, $23, $20, $20 ; $0BAA45 |
  db $20, $00, $00, $00, $00, $00, $00, $20 ; $0BAA4D |
  db $00, $00, $00, $00, $00, $00, $20, $02 ; $0BAA55 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAA5D |
  db $00, $08, $00, $0B, $00, $08, $00, $08 ; $0BAA65 |
  db $00, $00, $00, $0F, $00, $17, $00, $30 ; $0BAA6D |
  db $00, $13, $00, $00, $00, $0F, $00, $FF ; $0BAA75 |
  db $00, $00, $00, $5C, $5E, $0F, $36, $06 ; $0BAA7D |
  db $01, $0F, $26, $16, $06, $0F, $0C, $09 ; $0BAA85 |
  db $01, $0F, $30, $28, $07, $8A, $00, $00 ; $0BAA8D |
  db $00, $00, $00, $08, $00, $00, $00, $00 ; $0BAA95 |
  db $00, $00, $00, $00, $10, $00, $02, $00 ; $0BAA9D |
  db $40, $00, $04, $00, $01, $00, $00, $00 ; $0BAAA5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAAAD |
  db $00, $00, $04, $00, $00, $00, $00, $00 ; $0BAAB5 |
  db $00, $02, $01, $00, $00, $00, $08, $00 ; $0BAABD |
  db $24, $02, $00, $00, $00, $00, $00, $00 ; $0BAAC5 |
  db $00, $00, $10, $00, $00, $00, $04, $00 ; $0BAACD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAAD5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAADD |
  db $00, $00, $00, $08, $00, $00, $08, $00 ; $0BAAE5 |
  db $80, $00, $00, $09, $0C, $00, $02, $02 ; $0BAAED |
  db $00, $00, $00, $10, $18, $FF, $02, $00 ; $0BAAF5 |
  db $00, $00, $00, $03, $04, $04, $05, $06 ; $0BAAFD |
  db $07, $07, $07, $08, $08, $08, $08, $08 ; $0BAB05 |
  db $08, $09, $09, $09, $0A, $0A, $0A, $0A ; $0BAB0D |
  db $0A, $0B, $0B, $0B, $0B, $0B, $0B, $0C ; $0BAB15 |
  db $0C, $0D, $0D, $0F, $10, $11, $11, $12 ; $0BAB1D |
  db $13, $13, $14, $14, $14, $14, $15, $15 ; $0BAB25 |
  db $15, $15, $15, $16, $16, $16, $16, $17 ; $0BAB2D |
  db $19, $FF, $00, $00, $00, $00, $00, $00 ; $0BAB35 |
  db $00, $00, $80, $00, $04, $00, $01, $00 ; $0BAB3D |
  db $00, $00, $00, $00, $00, $00, $10, $00 ; $0BAB45 |
  db $10, $00, $00, $00, $40, $00, $00, $08 ; $0BAB4D |
  db $00, $00, $00, $20, $08, $00, $00, $00 ; $0BAB55 |
  db $02, $00, $30, $20, $00, $00, $00, $00 ; $0BAB5D |
  db $00, $00, $00, $00, $40, $00, $20, $00 ; $0BAB65 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAB6D |
  db $08, $00, $00, $00, $01, $00, $00, $00 ; $0BAB75 |
  db $00, $00, $00, $20, $00, $00, $00, $88 ; $0BAB7D |
  db $00, $00, $00, $00, $40, $00, $00, $00 ; $0BAB85 |
  db $12, $80, $80, $00, $00, $00, $00, $20 ; $0BAB8D |
  db $80, $02, $00, $00, $02, $00, $00, $00 ; $0BAB95 |
  db $00, $80, $00, $00, $00, $08, $00, $00 ; $0BAB9D |
  db $08, $00, $00, $00, $00, $00, $80, $00 ; $0BABA5 |
  db $00, $20, $01, $00, $00, $00, $00, $00 ; $0BABAD |
  db $00, $00, $40, $00, $00, $00, $00, $00 ; $0BABB5 |
  db $02, $02, $00, $21, $35, $00, $00, $00 ; $0BABBD |
  db $04, $00, $00, $00, $00, $00, $00, $00 ; $0BABC5 |
  db $00, $00, $00, $00, $20, $00, $00, $00 ; $0BABCD |
  db $02, $00, $00, $00, $00, $00, $40, $00 ; $0BABD5 |
  db $00, $00, $00, $00, $00, $00, $80, $00 ; $0BABDD |
  db $00, $00, $00, $00, $04, $00, $00, $00 ; $0BABE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BABED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BABF5 |
  db $00, $00, $00, $90, $20, $80, $58, $E8 ; $0BABFD |
  db $B0, $D0, $F0, $30, $70, $78, $98, $C8 ; $0BAC05 |
  db $D0, $88, $88, $E8, $30, $70, $88, $B0 ; $0BAC0D |
  db $F0, $30, $30, $70, $70, $88, $B0, $74 ; $0BAC15 |
  db $CC, $68, $D8, $C0, $98, $18, $F4, $74 ; $0BAC1D |
  db $58, $D8, $14, $38, $A8, $B4, $18, $68 ; $0BAC25 |
  db $8C, $B8, $E4, $88, $98, $A8, $B8, $A8 ; $0BAC2D |
  db $C0, $FF, $00, $00, $01, $00, $01, $00 ; $0BAC35 |
  db $00, $00, $04, $00, $01, $00, $00, $20 ; $0BAC3D |
  db $00, $00, $00, $00, $00, $20, $00, $00 ; $0BAC45 |
  db $00, $00, $00, $00, $04, $00, $00, $40 ; $0BAC4D |
  db $04, $00, $00, $00, $00, $20, $10, $00 ; $0BAC55 |
  db $00, $00, $00, $00, $00, $00, $00, $04 ; $0BAC5D |
  db $00, $00, $00, $A0, $10, $40, $00, $00 ; $0BAC65 |
  db $40, $41, $00, $00, $00, $40, $00, $02 ; $0BAC6D |
  db $00, $40, $00, $20, $00, $08, $40, $04 ; $0BAC75 |
  db $80, $08, $00, $00, $00, $01, $00, $00 ; $0BAC7D |
  db $41, $00, $10, $02, $00, $00, $00, $00 ; $0BAC85 |
  db $00, $00, $00, $00, $00, $20, $00, $00 ; $0BAC8D |
  db $00, $80, $00, $00, $41, $00, $01, $00 ; $0BAC95 |
  db $00, $00, $01, $00, $00, $41, $00, $00 ; $0BAC9D |
  db $01, $00, $40, $00, $10, $40, $04, $31 ; $0BACA5 |
  db $01, $00, $00, $0A, $00, $00, $00, $00 ; $0BACAD |
  db $01, $00, $00, $00, $00, $00, $00, $00 ; $0BACB5 |
  db $10, $0A, $40, $14, $00, $01, $01, $10 ; $0BACBD |
  db $01, $00, $00, $00, $40, $00, $00, $00 ; $0BACC5 |
  db $00, $10, $05, $00, $00, $10, $00, $01 ; $0BACCD |
  db $00, $0C, $00, $00, $01, $01, $00, $00 ; $0BACD5 |
  db $00, $00, $00, $44, $00, $10, $00, $01 ; $0BACDD |
  db $00, $00, $01, $00, $01, $00, $00, $94 ; $0BACE5 |
  db $00, $00, $00, $00, $00, $00, $00, $02 ; $0BACED |
  db $00, $00, $01, $00, $00, $20, $40, $80 ; $0BACF5 |
  db $00, $00, $00, $98, $B8, $38, $A8, $B8 ; $0BACFD |
  db $98, $68, $38, $98, $88, $20, $58, $B4 ; $0BAD05 |
  db $48, $18, $34, $34, $78, $78, $10, $88 ; $0BAD0D |
  db $B8, $68, $98, $58, $88, $10, $68, $94 ; $0BAD15 |
  db $74, $58, $B8, $B0, $B8, $B0, $90, $70 ; $0BAD1D |
  db $04, $04, $B8, $04, $04, $B8, $04, $04 ; $0BAD25 |
  db $B8, $04, $B8, $BC, $BC, $BC, $BC, $60 ; $0BAD2D |
  db $B0, $FF, $50, $00, $00, $20, $01, $00 ; $0BAD35 |
  db $00, $00, $00, $21, $00, $20, $40, $04 ; $0BAD3D |
  db $00, $00, $00, $12, $00, $00, $00, $00 ; $0BAD45 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAD4D |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAD55 |
  db $00, $00, $00, $02, $44, $11, $10, $00 ; $0BAD5D |
  db $00, $00, $00, $00, $00, $10, $00, $00 ; $0BAD65 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAD6D |
  db $00, $00, $00, $01, $44, $08, $01, $0C ; $0BAD75 |
  db $00, $08, $40, $20, $44, $20, $00, $00 ; $0BAD7D |
  db $00, $00, $10, $00, $40, $10, $00, $00 ; $0BAD85 |
  db $00, $00, $00, $04, $00, $00, $00, $00 ; $0BAD8D |
  db $00, $00, $00, $10, $00, $08, $00, $00 ; $0BAD95 |
  db $00, $08, $00, $04, $00, $00, $10, $20 ; $0BAD9D |
  db $00, $88, $00, $00, $01, $00, $00, $00 ; $0BADA5 |
  db $00, $00, $04, $20, $00, $00, $00, $00 ; $0BADAD |
  db $00, $00, $00, $02, $00, $00, $00, $30 ; $0BADB5 |
  db $00, $40, $00, $80, $04, $14, $00, $00 ; $0BADBD |
  db $00, $00, $00, $08, $00, $08, $00, $00 ; $0BADC5 |
  db $45, $00, $00, $00, $00, $00, $00, $00 ; $0BADCD |
  db $00, $00, $05, $08, $00, $00, $10, $01 ; $0BADD5 |
  db $00, $00, $00, $00, $00, $81, $01, $00 ; $0BADDD |
  db $00, $02, $00, $00, $00, $40, $00, $40 ; $0BADE5 |
  db $00, $00, $00, $01, $00, $02, $00, $20 ; $0BADED |
  db $04, $00, $00, $00, $00, $00, $00, $08 ; $0BADF5 |
  db $05, $12, $00, $36, $36, $36, $13, $36 ; $0BADFD |
  db $36, $36, $36, $5A, $5A, $3A, $5A, $37 ; $0BAE05 |
  db $5A, $3A, $37, $37, $5A, $5A, $3A, $5A ; $0BAE0D |
  db $5A, $5A, $5A, $5A, $5A, $3A, $5A, $37 ; $0BAE15 |
  db $37, $36, $36, $6B, $50, $03, $03, $03 ; $0BAE1D |
  db $38, $38, $26, $38, $38, $26, $38, $38 ; $0BAE25 |
  db $26, $38, $26, $53, $53, $53, $53, $5C ; $0BAE2D |
  db $6F, $FF, $00, $00, $00, $00, $00, $A0 ; $0BAE35 |
  db $04, $08, $14, $10, $00, $00, $10, $00 ; $0BAE3D |
  db $00, $00, $00, $00, $00, $02, $00, $81 ; $0BAE45 |
  db $00, $02, $00, $04, $00, $14, $00, $00 ; $0BAE4D |
  db $00, $08, $00, $00, $00, $01, $00, $00 ; $0BAE55 |
  db $00, $00, $00, $00, $00, $02, $41, $00 ; $0BAE5D |
  db $10, $00, $01, $00, $00, $00, $04, $08 ; $0BAE65 |
  db $00, $00, $00, $80, $00, $20, $10, $08 ; $0BAE6D |
  db $00, $00, $00, $00, $10, $22, $00, $48 ; $0BAE75 |
  db $00, $A1, $50, $00, $00, $00, $00, $00 ; $0BAE7D |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAE85 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BAE8D |
  db $00, $00, $00, $00, $00, $00, $00, $80 ; $0BAE95 |
  db $00, $08, $40, $40, $01, $80, $00, $20 ; $0BAE9D |
  db $04, $20, $00, $00, $41, $00, $10, $00 ; $0BAEA5 |
  db $00, $00, $00, $00, $00, $10, $00, $00 ; $0BAEAD |
  db $00, $00, $00, $01, $00, $20, $00, $00 ; $0BAEB5 |
  db $00, $00, $00, $01, $00, $10, $04, $80 ; $0BAEBD |
  db $00, $80, $00, $00, $00, $20, $40, $60 ; $0BAEC5 |
  db $00, $00, $00, $00, $01, $00, $00, $00 ; $0BAECD |
  db $10, $00, $00, $00, $00, $13, $10, $00 ; $0BAED5 |
  db $00, $00, $00, $00, $00, $20, $00, $20 ; $0BAEDD |
  db $00, $00, $00, $01, $00, $00, $40, $08 ; $0BAEE5 |
  db $00, $28, $00, $00, $40, $04, $00, $00 ; $0BAEED |
  db $00, $02, $04, $00, $00, $80, $40, $08 ; $0BAEF5 |
  db $00, $20, $00, $00, $01, $02, $03, $01 ; $0BAEFD |
  db $02, $03, $00, $04, $05, $05, $05, $05 ; $0BAF05 |
  db $05, $05, $04, $06, $07, $07, $07, $07 ; $0BAF0D |
  db $07, $07, $06, $08, $09, $09, $09, $09 ; $0BAF15 |
  db $09, $09, $08, $0A, $09, $09, $09, $09 ; $0BAF1D |
  db $09, $09, $0A, $00, $09, $09, $09, $09 ; $0BAF25 |
  db $09, $09, $00, $04, $09, $0B, $0C, $0C ; $0BAF2D |
  db $0D, $09, $04, $06, $09, $0E, $0F, $0F ; $0BAF35 |
  db $10, $09, $06, $08, $09, $0E, $0F, $0F ; $0BAF3D |
  db $10, $09, $08, $0A, $09, $09, $11, $11 ; $0BAF45 |
  db $09, $09, $0A, $00, $09, $09, $12, $12 ; $0BAF4D |
  db $09, $09, $00, $04, $09, $09, $09, $09 ; $0BAF55 |
  db $09, $09, $04, $06, $09, $09, $09, $09 ; $0BAF5D |
  db $09, $09, $06, $13, $09, $09, $09, $09 ; $0BAF65 |
  db $09, $09, $13, $14, $15, $16, $0D, $0B ; $0BAF6D |
  db $15, $16, $14, $17, $18, $19, $10, $0E ; $0BAF75 |
  db $18, $19, $17, $04, $1A, $1B, $10, $0E ; $0BAF7D |
  db $1A, $1B, $04, $06, $1C, $1D, $10, $0E ; $0BAF85 |
  db $1C, $1D, $06, $13, $01, $03, $10, $0E ; $0BAF8D |
  db $01, $03, $13, $14, $12, $12, $09, $0E ; $0BAF95 |
  db $15, $16, $14, $1E, $09, $09, $09, $09 ; $0BAF9D |
  db $18, $19, $1E, $1F, $09, $0B, $15, $16 ; $0BAFA5 |
  db $20, $21, $1F, $08, $09, $0E, $18, $19 ; $0BAFAD |
  db $1C, $1D, $08, $0A, $09, $0E, $20, $21 ; $0BAFB5 |
  db $20, $21, $0A, $14, $09, $0E, $01, $03 ; $0BAFBD |
  db $01, $03, $1F, $1E, $09, $22, $23, $12 ; $0BAFC5 |
  db $23, $12, $08, $1F, $09, $24, $25, $09 ; $0BAFCD |
  db $26, $09, $0A, $08, $09, $27, $28, $29 ; $0BAFD5 |
  db $26, $09, $2A, $0A, $09, $27, $26, $2B ; $0BAFDD |
  db $25, $09, $12, $00, $09, $27, $2C, $0C ; $0BAFE5 |
  db $2D, $29, $09, $04, $2E, $0C, $2F, $30 ; $0BAFED |
  db $31, $0C, $15, $06, $32, $1F, $33, $33 ; $0BAFF5 |
  db $32, $1F, $18, $34, $35, $02, $36, $37 ; $0BAFFD |
  db $1F, $2A, $14, $38, $12, $12, $12, $39 ; $0BB005 |
  db $08, $12, $1E, $3A, $3B, $3C, $3D, $3E ; $0BB00D |
  db $0A, $09, $1F, $3F, $40, $41, $42, $43 ; $0BB015 |
  db $2A, $09, $08, $44, $45, $46, $47, $48 ; $0BB01D |
  db $12, $09, $0A, $09, $49, $4A, $4B, $09 ; $0BB025 |
  db $09, $09, $00, $4C, $4D, $3C, $4D, $3C ; $0BB02D |
  db $4E, $4F, $04, $41, $50, $41, $50, $41 ; $0BB035 |
  db $51, $52, $06, $36, $53, $4A, $53, $4A ; $0BB03D |
  db $54, $55, $08, $2C, $12, $56, $56, $57 ; $0BB045 |
  db $12, $58, $0A, $1E, $09, $59, $5A, $5B ; $0BB04D |
  db $09, $09, $00, $1F, $09, $5C, $5D, $5E ; $0BB055 |
  db $5F, $09, $04, $08, $09, $60, $61, $62 ; $0BB05D |
  db $63, $09, $06, $0A, $09, $60, $27, $64 ; $0BB065 |
  db $63, $09, $13, $00, $09, $2C, $15, $65 ; $0BB06D |
  db $65, $16, $14, $66, $09, $66, $18, $41 ; $0BB075 |
  db $41, $19, $66, $67, $09, $67, $68, $69 ; $0BB07D |
  db $6A, $6B, $67, $14, $09, $2A, $01, $02 ; $0BB085 |
  db $02, $03, $2A, $1E, $09, $56, $56, $57 ; $0BB08D |
  db $6C, $6D, $56, $1F, $09, $22, $22, $6E ; $0BB095 |
  db $09, $28, $6F, $08, $09, $59, $5A, $70 ; $0BB09D |
  db $71, $72, $09, $0A, $09, $09, $09, $28 ; $0BB0A5 |
  db $29, $73, $09, $00, $15, $65, $4C, $4D ; $0BB0AD |
  db $74, $65, $16, $04, $18, $41, $41, $50 ; $0BB0B5 |
  db $41, $41, $19, $67, $75, $76, $76, $76 ; $0BB0BD |
  db $77, $2B, $70, $2A, $75, $76, $76, $76 ; $0BB0C5 |
  db $77, $78, $28, $12, $75, $76, $76, $76 ; $0BB0CD |
  db $77, $09, $0C, $09, $75, $76, $76, $76 ; $0BB0D5 |
  db $77, $79, $1F, $09, $75, $76, $76, $76 ; $0BB0DD |
  db $77, $66, $08, $09, $75, $76, $76, $76 ; $0BB0E5 |
  db $7A, $7B, $0A, $2C, $15, $65, $65, $16 ; $0BB0ED |
  db $7C, $7D, $00, $66, $18, $41, $41, $19 ; $0BB0F5 |
  db $33, $33, $04, $09, $75, $76, $77, $7E ; $0BB0FD |
  db $5A, $70, $71, $09, $75, $76, $77, $6E ; $0BB105 |
  db $78, $28, $29, $09, $75, $76, $77, $70 ; $0BB10D |
  db $71, $72, $2B, $09, $75, $76, $77, $28 ; $0BB115 |
  db $29, $73, $78, $09, $75, $76, $77, $26 ; $0BB11D |
  db $7F, $73, $09, $09, $75, $76, $77, $26 ; $0BB125 |
  db $7F, $73, $09, $31, $15, $65, $65, $65 ; $0BB12D |
  db $65, $16, $31, $32, $18, $41, $41, $41 ; $0BB135 |
  db $41, $19, $32, $80, $5A, $70, $71, $81 ; $0BB13D |
  db $7E, $5A, $70, $6E, $78, $28, $29, $09 ; $0BB145 |
  db $6E, $78, $28, $15, $65, $65, $16, $15 ; $0BB14D |
  db $65, $65, $16, $18, $41, $41, $19, $18 ; $0BB155 |
  db $41, $41, $19, $1C, $32, $46, $21, $1C ; $0BB15D |
  db $32, $46, $21, $01, $02, $02, $03, $01 ; $0BB165 |
  db $02, $02, $03, $15, $65, $65, $16, $15 ; $0BB16D |
  db $65, $65, $16, $18, $41, $41, $19, $18 ; $0BB175 |
  db $41, $41, $19, $71, $80, $5A, $70, $71 ; $0BB17D |
  db $80, $5A, $70, $29, $6E, $78, $28, $29 ; $0BB185 |
  db $6E, $78, $28, $2B, $70, $71, $72, $2B ; $0BB18D |
  db $70, $71, $72, $78, $2D, $29, $73, $78 ; $0BB195 |
  db $2D, $29, $73, $09, $09, $2B, $82, $09 ; $0BB19D |
  db $09, $2B, $82, $09, $09, $09, $2D, $09 ; $0BB1A5 |
  db $09, $09, $2D, $31, $31, $31, $31, $31 ; $0BB1AD |
  db $31, $31, $31, $32, $32, $32, $32, $32 ; $0BB1B5 |
  db $32, $32, $32, $6F, $75, $76, $76, $76 ; $0BB1BD |
  db $76, $77, $24, $09, $75, $76, $76, $76 ; $0BB1C5 |
  db $76, $77, $27, $09, $75, $76, $76, $76 ; $0BB1CD |
  db $76, $77, $27, $09, $75, $76, $76, $76 ; $0BB1D5 |
  db $76, $15, $16, $09, $75, $76, $76, $76 ; $0BB1DD |
  db $76, $18, $19, $09, $75, $76, $76, $76 ; $0BB1E5 |
  db $76, $1C, $21, $31, $83, $76, $76, $76 ; $0BB1ED |
  db $76, $01, $03, $32, $32, $76, $76, $76 ; $0BB1F5 |
  db $76, $15, $16, $70, $81, $6E, $09, $84 ; $0BB1FD |
  db $09, $09, $13, $28, $29, $6E, $78, $84 ; $0BB205 |
  db $09, $09, $14, $26, $2B, $70, $71, $85 ; $0BB20D |
  db $09, $78, $1E, $26, $78, $28, $29, $86 ; $0BB215 |
  db $09, $09, $1F, $0C, $09, $0C, $7F, $86 ; $0BB21D |
  db $09, $87, $08, $08, $88, $08, $0C, $86 ; $0BB225 |
  db $0C, $89, $0A, $06, $09, $06, $06, $0C ; $0BB22D |
  db $08, $89, $00, $13, $09, $13, $8A, $8A ; $0BB235 |
  db $8B, $89, $04, $0A, $8C, $11, $2A, $2A ; $0BB23D |
  db $11, $8D, $1F, $00, $12, $8E, $8F, $12 ; $0BB245 |
  db $12, $58, $08, $66, $09, $27, $28, $90 ; $0BB24D |
  db $91, $09, $0A, $1F, $09, $92, $93, $93 ; $0BB255 |
  db $93, $93, $2A, $08, $09, $8E, $8F, $12 ; $0BB25D |
  db $12, $12, $94, $0A, $09, $27, $28, $90 ; $0BB265 |
  db $91, $09, $95, $00, $96, $96, $97, $15 ; $0BB26D |
  db $65, $65, $16, $66, $41, $41, $0F, $18 ; $0BB275 |
  db $41, $41, $98, $15, $65, $16, $1F, $15 ; $0BB27D |
  db $65, $4C, $99, $18, $41, $19, $08, $18 ; $0BB285 |
  db $41, $41, $9A, $1C, $46, $21, $0A, $1C ; $0BB28D |
  db $32, $46, $9B, $01, $02, $03, $2A, $01 ; $0BB295 |
  db $02, $36, $54, $9C, $9D, $6C, $8F, $9E ; $0BB29D |
  db $12, $9D, $94, $9F, $73, $78, $28, $29 ; $0BB2A5 |
  db $09, $73, $95, $15, $65, $16, $2C, $15 ; $0BB2AD |
  db $65, $4C, $4E, $18, $41, $19, $66, $18 ; $0BB2B5 |
  db $41, $41, $A0, $A1, $35, $02, $03, $01 ; $0BB2BD |
  db $02, $03, $1F, $A2, $12, $12, $12, $12 ; $0BB2C5 |
  db $12, $12, $08, $A3, $09, $09, $09, $09 ; $0BB2CD |
  db $09, $09, $0A, $55, $A4, $09, $A4, $09 ; $0BB2D5 |
  db $A4, $09, $2A, $A5, $09, $09, $09, $09 ; $0BB2DD |
  db $09, $09, $A6, $9F, $09, $09, $09, $09 ; $0BB2E5 |
  db $09, $09, $95, $A7, $74, $65, $16, $15 ; $0BB2ED |
  db $65, $16, $2C, $A8, $41, $41, $19, $18 ; $0BB2F5 |
  db $41, $19, $66, $15, $65, $65, $16, $15 ; $0BB2FD |
  db $65, $65, $16, $18, $41, $41, $19, $18 ; $0BB305 |
  db $41, $41, $19, $1C, $A9, $32, $AA, $1C ; $0BB30D |
  db $A9, $46, $21, $01, $02, $02, $03, $01 ; $0BB315 |
  db $02, $02, $03, $9C, $9D, $6C, $8F, $12 ; $0BB31D |
  db $9D, $6C, $8F, $9F, $73, $78, $28, $29 ; $0BB325 |
  db $73, $78, $28, $15, $65, $65, $16, $15 ; $0BB32D |
  db $65, $65, $16, $18, $41, $41, $19, $18 ; $0BB335 |
  db $41, $41, $19, $15, $65, $16, $15, $65 ; $0BB33D |
  db $16, $1F, $1C, $18, $41, $19, $18, $41 ; $0BB345 |
  db $19, $08, $1C, $1C, $32, $21, $1C, $32 ; $0BB34D |
  db $21, $0A, $01, $01, $02, $03, $01, $02 ; $0BB355 |
  db $03, $2A, $8F, $12, $9D, $6C, $8F, $12 ; $0BB35D |
  db $9D, $12, $28, $29, $73, $78, $28, $2C ; $0BB365 |
  db $15, $65, $16, $15, $65, $65, $16, $66 ; $0BB36D |
  db $18, $41, $19, $18, $41, $41, $19, $1F ; $0BB375 |
  db $1C, $46, $21, $A9, $21, $08, $1C, $46 ; $0BB37D |
  db $21, $0A, $2A, $46, $21, $0A, $01, $02 ; $0BB385 |
  db $03, $2A, $AB, $02, $03, $2A, $8F, $12 ; $0BB38D |
  db $9D, $12, $75, $12, $9D, $12, $28, $15 ; $0BB395 |
  db $16, $09, $75, $2C, $15, $65, $16, $18 ; $0BB39D |
  db $19, $09, $75, $66, $18, $41, $19, $01 ; $0BB3A5 |
  db $03, $09, $75, $1F, $01, $02, $03, $15 ; $0BB3AD |
  db $16, $15, $16, $67, $15, $65, $16, $18 ; $0BB3B5 |
  db $19, $18, $19, $AC, $AC, $AD, $AE, $AF ; $0BB3BD |
  db $AD, $B0, $AC, $B1, $B1, $B2, $32, $B3 ; $0BB3C5 |
  db $B2, $B4, $B5, $B6, $B6, $B6, $B7, $B8 ; $0BB3CD |
  db $B9, $77, $75, $BA, $BB, $BC, $BD, $BE ; $0BB3D5 |
  db $BF, $77, $75, $BD, $BE, $C0, $B6, $76 ; $0BB3DD |
  db $B6, $77, $75, $32, $76, $C1, $C2, $76 ; $0BB3E5 |
  db $C2, $77, $75, $15, $16, $C3, $2C, $C4 ; $0BB3ED |
  db $C5, $C6, $C7, $18, $19, $69, $66, $69 ; $0BB3F5 |
  db $C8, $1D, $69, $C9, $AD, $AD, $B0, $AF ; $0BB3FD |
  db $AC, $CA, $AC, $CB, $B2, $B2, $CC, $B3 ; $0BB405 |
  db $CD, $AE, $B1, $B7, $B8, $CE, $32, $32 ; $0BB40D |
  db $77, $AB, $B7, $BD, $BE, $C0, $B6, $B6 ; $0BB415 |
  db $77, $75, $BD, $B6, $76, $CF, $BB, $D0 ; $0BB41D |
  db $77, $75, $B6, $C2, $76, $BD, $BE, $BF ; $0BB425 |
  db $77, $75, $C2, $2C, $C4, $C5, $C6, $C3 ; $0BB42D |
  db $2C, $C7, $2C, $66, $69, $C8, $1D, $D1 ; $0BB435 |
  db $66, $69, $66, $AE, $AE, $CA, $CA, $AE ; $0BB43D |
  db $AE, $AE, $AE, $32, $32, $AE, $AE, $32 ; $0BB445 |
  db $32, $32, $32, $B8, $B9, $D2, $AB, $B7 ; $0BB44D |
  db $B8, $CE, $32, $BE, $BF, $77, $75, $BD ; $0BB455 |
  db $BE, $C0, $B6, $76, $B6, $77, $75, $B6 ; $0BB45D |
  db $76, $CF, $BB, $76, $C2, $77, $75, $C2 ; $0BB465 |
  db $76, $BD, $BE, $C4, $C5, $C6, $C7, $2C ; $0BB46D |
  db $C4, $C5, $74, $D3, $C8, $1D, $69, $66 ; $0BB475 |
  db $69, $D4, $41, $AE, $AE, $AE, $AE, $AE ; $0BB47D |
  db $AE, $AE, $AE, $D2, $12, $12, $12, $12 ; $0BB485 |
  db $12, $12, $12, $77, $A4, $09, $A4, $09 ; $0BB48D |
  db $A4, $09, $A4, $77, $09, $09, $09, $09 ; $0BB495 |
  db $09, $09, $09, $77, $09, $09, $09, $09 ; $0BB49D |
  db $09, $09, $09, $77, $09, $09, $09, $09 ; $0BB4A5 |
  db $09, $09, $09, $65, $4C, $4D, $74, $65 ; $0BB4AD |
  db $16, $15, $65, $41, $41, $50, $41, $41 ; $0BB4B5 |
  db $19, $18, $41, $09, $09, $09, $09, $09 ; $0BB4BD |
  db $09, $09, $1F, $09, $09, $09, $09, $09 ; $0BB4C5 |
  db $09, $09, $08, $09, $A4, $09, $A4, $09 ; $0BB4CD |
  db $A4, $09, $0A, $09, $09, $09, $09, $D5 ; $0BB4D5 |
  db $D6, $09, $2A, $09, $09, $09, $09, $D7 ; $0BB4DD |
  db $D8, $09, $A6, $09, $09, $D9, $88, $1A ; $0BB4E5 |
  db $1B, $09, $95, $65, $16, $66, $09, $01 ; $0BB4ED |
  db $03, $15, $65, $41, $19, $1F, $09, $15 ; $0BB4F5 |
  db $16, $18, $41, $01, $35, $02, $03, $01 ; $0BB4FD |
  db $02, $36, $DA, $15, $65, $65, $16, $15 ; $0BB505 |
  db $65, $4C, $DB, $18, $41, $41, $19, $18 ; $0BB50D |
  db $41, $41, $9B, $01, $02, $02, $03, $01 ; $0BB515 |
  db $02, $36, $54, $9C, $12, $12, $12, $12 ; $0BB51D |
  db $12, $12, $94, $9F, $09, $09, $09, $09 ; $0BB525 |
  db $09, $09, $95, $4C, $4D, $74, $4C, $4D ; $0BB52D |
  db $74, $4C, $4E, $41, $50, $41, $41, $50 ; $0BB535 |
  db $41, $41, $A0, $A1, $35, $02, $03, $01 ; $0BB53D |
  db $02, $36, $DA, $A2, $DC, $DD, $56, $DE ; $0BB545 |
  db $DF, $DD, $E0, $A3, $7F, $E1, $E2, $E3 ; $0BB54D |
  db $E4, $E1, $E5, $55, $7F, $E6, $5D, $E7 ; $0BB555 |
  db $7F, $E6, $E8, $A5, $E9, $E3, $E4, $73 ; $0BB55D |
  db $E9, $E3, $EA, $9F, $78, $26, $7F, $73 ; $0BB565 |
  db $78, $26, $EB, $A7, $74, $65, $16, $15 ; $0BB56D |
  db $65, $4C, $DB, $A8, $41, $41, $19, $18 ; $0BB575 |
  db $41, $41, $9B, $32, $32, $32, $32, $32 ; $0BB57D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB585 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB58D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB595 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB59D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5A5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5AD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5B5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5BD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5C5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5CD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5D5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5DD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5E5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5ED |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5F5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB5FD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB605 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB60D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB615 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB61D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB625 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB62D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB635 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB63D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB645 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB64D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB655 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB65D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB665 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB66D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB675 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB67D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB685 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB68D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB695 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB69D |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6A5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6AD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6B5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6BD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6C5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6CD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6D5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6DD |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6E5 |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6ED |
  db $32, $32, $32, $32, $32, $32, $32, $32 ; $0BB6F5 |
  db $32, $32, $32, $1D, $1E, $25, $26, $7C ; $0BB6FD |
  db $7D, $18, $05, $6E, $6E, $05, $05, $7E ; $0BB705 |
  db $7F, $05, $1F, $09, $0A, $8E, $8F, $34 ; $0BB70D |
  db $34, $61, $61, $86, $87, $11, $12, $69 ; $0BB715 |
  db $69, $63, $63, $11, $12, $8E, $8F, $33 ; $0BB71D |
  db $33, $33, $33, $19, $1A, $25, $26, $33 ; $0BB725 |
  db $33, $33, $96, $01, $02, $09, $0A, $33 ; $0BB72D |
  db $33, $97, $33, $33, $96, $33, $96, $11 ; $0BB735 |
  db $12, $11, $12, $97, $33, $97, $33, $19 ; $0BB73D |
  db $1A, $2A, $2B, $34, $34, $33, $33, $8E ; $0BB745 |
  db $8F, $19, $1A, $25, $26, $1D, $1E, $0C ; $0BB74D |
  db $04, $6C, $65, $04, $0D, $66, $6F, $25 ; $0BB755 |
  db $26, $25, $26, $74, $07, $74, $0F, $06 ; $0BB75D |
  db $77, $0E, $77, $74, $0F, $74, $00, $0E ; $0BB765 |
  db $77, $10, $77, $74, $00, $74, $08, $00 ; $0BB76D |
  db $77, $00, $77, $25, $26, $09, $0A, $8E ; $0BB775 |
  db $8F, $86, $87, $74, $00, $74, $00, $10 ; $0BB77D |
  db $77, $00, $77, $33, $48, $33, $48, $5E ; $0BB785 |
  db $57, $4E, $4F, $33, $48, $4C, $40, $4E ; $0BB78D |
  db $4F, $41, $42, $4E, $4F, $4E, $4F, $43 ; $0BB795 |
  db $33, $43, $33, $49, $4A, $4E, $4F, $4B ; $0BB79D |
  db $52, $48, $48, $1D, $1E, $2A, $2B, $48 ; $0BB7A5 |
  db $48, $58, $40, $01, $02, $1D, $1E, $49 ; $0BB7AD |
  db $4A, $33, $33, $39, $39, $04, $04, $80 ; $0BB7B5 |
  db $81, $8C, $8D, $82, $83, $8C, $8D, $03 ; $0BB7BD |
  db $03, $00, $00, $00, $00, $00, $00, $8A ; $0BB7C5 |
  db $8B, $8A, $8B, $37, $7C, $37, $18, $7D ; $0BB7CD |
  db $6E, $05, $05, $6E, $7E, $05, $05, $7F ; $0BB7D5 |
  db $37, $1F, $37, $37, $34, $37, $33, $34 ; $0BB7DD |
  db $37, $33, $37, $3F, $92, $97, $9A, $04 ; $0BB7E5 |
  db $0C, $96, $6C, $04, $04, $65, $66, $0D ; $0BB7ED |
  db $04, $6F, $97, $92, $3F, $9A, $96, $97 ; $0BB7F5 |
  db $9A, $97, $9A, $96, $74, $96, $74, $06 ; $0BB7FD |
  db $07, $0E, $0F, $77, $97, $77, $97, $9A ; $0BB805 |
  db $96, $9A, $96, $33, $9A, $33, $9A, $33 ; $0BB80D |
  db $74, $33, $74, $08, $00, $10, $00, $77 ; $0BB815 |
  db $33, $77, $33, $9A, $33, $9A, $33, $33 ; $0BB81D |
  db $7C, $33, $18, $7D, $7E, $05, $05, $7F ; $0BB825 |
  db $33, $1F, $33, $04, $04, $6D, $66, $0D ; $0BB82D |
  db $0C, $6F, $6C, $0D, $01, $6F, $1D, $02 ; $0BB835 |
  db $92, $1E, $9A, $77, $74, $77, $74, $77 ; $0BB83D |
  db $25, $77, $25, $26, $9A, $26, $9A, $7F ; $0BB845 |
  db $7C, $1F, $18, $7F, $1D, $1F, $2A, $1E ; $0BB84D |
  db $33, $2B, $33, $34, $56, $33, $48, $55 ; $0BB855 |
  db $57, $43, $4F, $34, $33, $33, $33, $33 ; $0BB85D |
  db $48, $33, $58, $33, $48, $47, $40, $43 ; $0BB865 |
  db $4F, $41, $42, $33, $33, $33, $59, $33 ; $0BB86D |
  db $33, $46, $46, $49, $4A, $4D, $4F, $5D ; $0BB875 |
  db $33, $5B, $33, $33, $43, $33, $43, $59 ; $0BB87D |
  db $46, $43, $33, $53, $4F, $33, $4F, $5B ; $0BB885 |
  db $33, $5B, $33, $33, $4F, $33, $4F, $04 ; $0BB88D |
  db $04, $6D, $6D, $09, $0A, $11, $12, $11 ; $0BB895 |
  db $12, $19, $1A, $74, $0E, $74, $00, $0E ; $0BB89D |
  db $0F, $08, $00, $0F, $0E, $00, $00, $0F ; $0BB8A5 |
  db $77, $10, $77, $56, $56, $58, $40, $5E ; $0BB8AD |
  db $57, $41, $42, $43, $4F, $43, $4F, $46 ; $0BB8B5 |
  db $53, $33, $33, $44, $45, $41, $42, $46 ; $0BB8BD |
  db $46, $33, $33, $4D, $4F, $48, $4F, $48 ; $0BB8C5 |
  db $4F, $48, $4F, $04, $04, $65, $6D, $33 ; $0BB8CD |
  db $2F, $33, $2F, $16, $17, $17, $16, $2F ; $0BB8D5 |
  db $33, $2F, $33, $33, $33, $32, $33, $33 ; $0BB8DD |
  db $33, $01, $02, $01, $02, $80, $81, $8E ; $0BB8E5 |
  db $8F, $82, $83, $2D, $2E, $8A, $8B, $8A ; $0BB8ED |
  db $8B, $8C, $8D, $33, $4F, $4C, $50, $48 ; $0BB8F5 |
  db $48, $48, $48, $53, $4F, $4C, $50, $53 ; $0BB8FD |
  db $33, $33, $33, $48, $4F, $41, $42, $03 ; $0BB905 |
  db $22, $00, $00, $4E, $33, $4E, $33, $4D ; $0BB90D |
  db $33, $48, $33, $48, $33, $48, $33, $70 ; $0BB915 |
  db $92, $37, $9A, $04, $04, $34, $34, $37 ; $0BB91D |
  db $9A, $37, $9A, $19, $1A, $1D, $1E, $86 ; $0BB925 |
  db $87, $19, $1A, $33, $33, $05, $05, $37 ; $0BB92D |
  db $33, $3F, $33, $34, $56, $4C, $40, $56 ; $0BB935 |
  db $57, $41, $42, $4B, $51, $48, $33, $51 ; $0BB93D |
  db $52, $33, $48, $0C, $04, $18, $05, $04 ; $0BB945 |
  db $04, $05, $05, $34, $27, $33, $27, $33 ; $0BB94D |
  db $27, $33, $27, $04, $04, $00, $00, $0B ; $0BB955 |
  db $02, $09, $0A, $07, $77, $0F, $77, $0D ; $0BB95D |
  db $8E, $6F, $86, $77, $11, $77, $8E, $77 ; $0BB965 |
  db $19, $77, $25, $93, $34, $9B, $33, $56 ; $0BB96D |
  db $57, $48, $4F, $34, $34, $33, $32, $9B ; $0BB975 |
  db $33, $9B, $33, $77, $09, $77, $11, $8F ; $0BB97D |
  db $7C, $87, $18, $12, $34, $8F, $33, $1A ; $0BB985 |
  db $33, $26, $33, $32, $32, $33, $33, $93 ; $0BB98D |
  db $33, $9B, $33, $93, $27, $33, $27, $02 ; $0BB995 |
  db $0C, $1E, $6C, $0A, $74, $12, $74, $00 ; $0BB99D |
  db $00, $08, $00, $08, $77, $10, $77, $34 ; $0BB9A5 |
  db $38, $33, $2F, $A2, $A2, $AA, $AA, $A2 ; $0BB9AD |
  db $AA, $AA, $A3, $AA, $AA, $A3, $A3, $AA ; $0BB9B5 |
  db $A2, $A2, $AA, $AA, $A2, $A3, $AA, $A3 ; $0BB9BD |
  db $A3, $00, $00, $A3, $00, $00, $00, $AA ; $0BB9C5 |
  db $A3, $A3, $00, $38, $A3, $2F, $34, $A3 ; $0BB9CD |
  db $A3, $34, $38, $00, $00, $A4, $A4, $00 ; $0BB9D5 |
  db $00, $A4, $A5, $00, $00, $B4, $B5, $00 ; $0BB9DD |
  db $00, $A6, $A4, $AC, $AC, $A4, $A5, $AC ; $0BB9E5 |
  db $AC, $B4, $B5, $AC, $AC, $A6, $A7, $AC ; $0BB9ED |
  db $AD, $00, $00, $14, $15, $17, $16, $AE ; $0BB9F5 |
  db $AC, $00, $00, $AE, $AF, $00, $B7, $00 ; $0BB9FD |
  db $BF, $00, $00, $AC, $AC, $00, $00, $3E ; $0BBA05 |
  db $00, $06, $07, $23, $24, $30, $31, $3E ; $0BBA0D |
  db $0C, $06, $6C, $04, $0D, $73, $6F, $33 ; $0BBA15 |
  db $2F, $06, $07, $0E, $74, $08, $74, $A2 ; $0BBA1D |
  db $AA, $AA, $A2, $AA, $AA, $A2, $A2, $A3 ; $0BBA25 |
  db $AA, $00, $A3, $00, $A3, $00, $00, $A3 ; $0BBA2D |
  db $A3, $38, $34, $00, $00, $A6, $A7, $00 ; $0BBA35 |
  db $BF, $A4, $A5, $AC, $AC, $A6, $A4, $0F ; $0BBA3D |
  db $0E, $00, $08, $38, $34, $2F, $33, $0F ; $0BBA45 |
  db $0F, $00, $00, $0E, $74, $00, $74, $33 ; $0BBA4D |
  db $33, $0C, $04, $33, $33, $04, $0D, $6C ; $0BBA55 |
  db $65, $74, $07, $66, $6F, $06, $77, $01 ; $0BBA5D |
  db $13, $1D, $1E, $7F, $8E, $1F, $86, $0D ; $0BBA65 |
  db $11, $6F, $8E, $56, $56, $48, $48, $34 ; $0BBA6D |
  db $57, $33, $4F, $55, $57, $44, $45, $34 ; $0BBA75 |
  db $56, $46, $53, $34, $11, $33, $8E, $4C ; $0BBA7D |
  db $50, $43, $4F, $47, $40, $33, $33, $41 ; $0BBA85 |
  db $42, $49, $4A, $33, $33, $4B, $52, $47 ; $0BBA8D |
  db $19, $33, $25, $43, $4F, $44, $45, $4E ; $0BBA95 |
  db $4F, $4D, $4F, $33, $1D, $46, $25, $58 ; $0BBA9D |
  db $40, $33, $33, $33, $09, $4B, $11, $48 ; $0BBAA5 |
  db $8E, $48, $86, $00, $00, $AC, $AD, $00 ; $0BBAAD |
  db $00, $AE, $AF, $B4, $B5, $B4, $B5, $B6 ; $0BBAB5 |
  db $B7, $B6, $B7, $BA, $BA, $B8, $B8, $BA ; $0BBABD |
  db $BD, $B1, $B5, $BE, $BF, $B6, $B7, $BA ; $0BBAC5 |
  db $BA, $9C, $9D, $BA, $BD, $9F, $B5, $BB ; $0BBACD |
  db $BD, $B1, $B5, $BB, $BD, $9F, $B5, $B9 ; $0BBAD5 |
  db $B9, $06, $07, $B9, $0C, $06, $6C, $00 ; $0BBADD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBAE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBAED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBAF5 |
  db $00, $00, $00, $00, $8C, $8E, $6B, $05 ; $0BBAFD |
  db $06, $08, $0A, $00, $A8, $AA, $23, $AC ; $0BBB05 |
  db $05, $28, $2A, $00, $34, $47, $8E, $0C ; $0BBB0D |
  db $0E, $2C, $2E, $AE, $A4, $A6, $A0, $A2 ; $0BBB15 |
  db $9C, $7C, $06, $C0, $05, $45, $2C, $2E ; $0BBB1D |
  db $9C, $9E, $4E, $C2, $06, $9C, $9E, $00 ; $0BBB25 |
  db $99, $9E, $45, $4A, $4C, $6E, $6B, $00 ; $0BBB2D |
  db $01, $03, $E0, $00, $EE, $00, $01, $03 ; $0BBB35 |
  db $00, $00, $E0, $6B, $30, $32, $6B, $6B ; $0BBB3D |
  db $5B, $55, $6B, $6B, $50, $52, $49, $6B ; $0BBB45 |
  db $55, $6B, $5B, $5B, $5D, $5D, $55, $6B ; $0BBB4D |
  db $00, $00, $00, $6B, $6B, $6B, $5A, $6B ; $0BBB55 |
  db $69, $00, $6B, $6B, $79, $7A, $8B, $00 ; $0BBB5D |
  db $74, $76, $00, $6B, $89, $9A, $00, $72 ; $0BBB65 |
  db $76, $00, $70, $E2, $00, $00, $74, $82 ; $0BBB6D |
  db $00, $00, $26, $00, $00, $00, $00, $82 ; $0BBB75 |
  db $00, $00, $80, $C4, $C6, $C8, $CA, $00 ; $0BBB7D |
  db $00, $99, $47, $00, $00, $99, $9E, $99 ; $0BBB85 |
  db $9E, $99, $DB, $00, $00, $5E, $00, $00 ; $0BBB8D |
  db $00, $CC, $CE, $00, $00, $5E, $6B, $00 ; $0BBB95 |
  db $00, $00, $00, $00, $00, $36, $EC, $00 ; $0BBB9D |
  db $00, $00, $00, $00, $00, $36, $00, $F4 ; $0BBBA5 |
  db $F4, $F5, $F8, $00, $00, $00, $00, $00 ; $0BBBAD |
  db $00, $00, $EA, $00, $00, $00, $00, $00 ; $0BBBB5 |
  db $00, $00, $F6, $00, $00, $00, $00, $00 ; $0BBBBD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBC5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBCD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBD5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBDD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBBF5 |
  db $00, $00, $00, $00, $8D, $8F, $6B, $05 ; $0BBBFD |
  db $06, $09, $0B, $10, $A9, $AB, $8D, $05 ; $0BBC05 |
  db $AD, $29, $2B, $10, $35, $48, $24, $0D ; $0BBC0D |
  db $0F, $2D, $2F, $06, $A5, $A7, $A1, $A3 ; $0BBC15 |
  db $7B, $9F, $AF, $05, $C1, $46, $2D, $2F ; $0BBC1D |
  db $9D, $9F, $4F, $06, $C3, $9D, $9F, $00 ; $0BBC25 |
  db $9D, $CB, $46, $4B, $4D, $6F, $6B, $00 ; $0BBC2D |
  db $02, $04, $E1, $00, $EF, $00, $02, $04 ; $0BBC35 |
  db $00, $00, $E1, $54, $31, $33, $5C, $56 ; $0BBC3D |
  db $55, $55, $6B, $54, $51, $53, $59, $6B ; $0BBC45 |
  db $58, $5A, $6B, $6B, $5D, $65, $66, $67 ; $0BBC4D |
  db $00, $00, $00, $54, $64, $6B, $6B, $54 ; $0BBC55 |
  db $6B, $00, $5A, $78, $79, $6B, $8B, $00 ; $0BBC5D |
  db $75, $77, $00, $98, $89, $6B, $00, $73 ; $0BBC65 |
  db $76, $00, $71, $E3, $00, $00, $22, $27 ; $0BBC6D |
  db $00, $00, $81, $00, $00, $00, $00, $83 ; $0BBC75 |
  db $00, $00, $81, $C5, $C7, $C9, $CB, $00 ; $0BBC7D |
  db $00, $35, $48, $00, $00, $9D, $CB, $9D ; $0BBC85 |
  db $CB, $DA, $48, $00, $00, $5F, $00, $00 ; $0BBC8D |
  db $00, $CD, $CF, $00, $00, $5F, $6B, $00 ; $0BBC95 |
  db $00, $00, $00, $00, $00, $37, $ED, $00 ; $0BBC9D |
  db $00, $00, $00, $00, $00, $37, $00, $F4 ; $0BBCA5 |
  db $F5, $F4, $F9, $00, $00, $00, $00, $00 ; $0BBCAD |
  db $00, $00, $EB, $00, $00, $00, $00, $00 ; $0BBCB5 |
  db $00, $00, $F7, $00, $00, $00, $00, $00 ; $0BBCBD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCC5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCCD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCD5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCDD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBCF5 |
  db $00, $00, $00, $00, $9C, $9E, $44, $15 ; $0BBCFD |
  db $16, $18, $1A, $20, $B8, $BA, $9C, $BC ; $0BBD05 |
  db $15, $00, $00, $00, $34, $47, $9E, $1C ; $0BBD0D |
  db $1E, $1E, $1C, $BE, $B4, $B6, $B0, $B2 ; $0BBD15 |
  db $9C, $9E, $16, $D0, $15, $44, $3C, $3E ; $0BBD1D |
  db $9C, $9E, $4E, $D2, $16, $11, $13, $00 ; $0BBD25 |
  db $99, $7C, $45, $18, $1A, $7E, $6B, $6B ; $0BBD2D |
  db $1E, $1C, $E0, $45, $FE, $00, $3C, $3E ; $0BBD35 |
  db $00, $6D, $F0, $55, $40, $42, $6B, $6B ; $0BBD3D |
  db $5B, $6B, $55, $6B, $60, $62, $6B, $6B ; $0BBD45 |
  db $6B, $6B, $5B, $5B, $6B, $6B, $6B, $6B ; $0BBD4D |
  db $6B, $6B, $5B, $6B, $6B, $69, $5A, $6B ; $0BBD55 |
  db $5A, $6B, $55, $6B, $89, $8A, $6B, $00 ; $0BBD5D |
  db $84, $00, $00, $6B, $89, $6B, $00, $82 ; $0BBD65 |
  db $00, $85, $80, $E0, $00, $00, $84, $82 ; $0BBD6D |
  db $00, $00, $80, $00, $00, $00, $86, $92 ; $0BBD75 |
  db $86, $85, $90, $D4, $D6, $D8, $9E, $00 ; $0BBD7D |
  db $00, $B0, $B2, $00, $00, $99, $9E, $A0 ; $0BBD85 |
  db $A2, $99, $47, $00, $00, $5E, $6B, $00 ; $0BBD8D |
  db $00, $DC, $DE, $00, $00, $5E, $6B, $00 ; $0BBD95 |
  db $00, $00, $00, $00, $00, $36, $FC, $E4 ; $0BBD9D |
  db $E4, $E5, $E8, $00, $00, $38, $00, $00 ; $0BBDA5 |
  db $00, $00, $EA, $00, $00, $00, $00, $F2 ; $0BBDAD |
  db $F3, $00, $E6, $00, $00, $00, $00, $00 ; $0BBDB5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDBD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDC5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDCD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDD5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDDD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBDF5 |
  db $00, $00, $00, $00, $9D, $9F, $44, $15 ; $0BBDFD |
  db $16, $19, $1B, $00, $B9, $BB, $9D, $15 ; $0BBE05 |
  db $BD, $21, $00, $20, $35, $48, $9F, $1D ; $0BBE0D |
  db $1F, $1F, $1D, $16, $B5, $B7, $B1, $B3 ; $0BBE15 |
  db $9D, $9F, $BF, $15, $D1, $44, $3D, $3F ; $0BBE1D |
  db $9D, $9F, $4F, $16, $D3, $12, $14, $00 ; $0BBE25 |
  db $7B, $CB, $46, $19, $1B, $7F, $6B, $6B ; $0BBE2D |
  db $1F, $1D, $E1, $46, $FF, $00, $3D, $3F ; $0BBE35 |
  db $6C, $00, $F1, $57, $41, $43, $5C, $5A ; $0BBE3D |
  db $6B, $6B, $55, $54, $61, $63, $54, $64 ; $0BBE45 |
  db $54, $5A, $6B, $55, $6B, $54, $6B, $6B ; $0BBE4D |
  db $5C, $54, $6B, $68, $5C, $6B, $6B, $6A ; $0BBE55 |
  db $6B, $5A, $5A, $88, $89, $6B, $6B, $00 ; $0BBE5D |
  db $00, $00, $00, $6B, $89, $6B, $00, $83 ; $0BBE65 |
  db $00, $85, $81, $E1, $00, $00, $00, $83 ; $0BBE6D |
  db $00, $00, $81, $00, $00, $00, $87, $93 ; $0BBE75 |
  db $85, $87, $91, $D5, $D7, $D9, $CB, $00 ; $0BBE7D |
  db $00, $B1, $B3, $00, $00, $9D, $CB, $A1 ; $0BBE85 |
  db $A3, $35, $48, $00, $00, $5F, $6B, $00 ; $0BBE8D |
  db $00, $DD, $DF, $00, $00, $5F, $6B, $00 ; $0BBE95 |
  db $00, $00, $00, $00, $00, $37, $FD, $E4 ; $0BBE9D |
  db $E5, $E4, $E9, $00, $00, $39, $00, $00 ; $0BBEA5 |
  db $00, $00, $EB, $00, $00, $00, $00, $F3 ; $0BBEAD |
  db $3B, $00, $E7, $00, $00, $00, $00, $00 ; $0BBEB5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBEBD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBEC5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBECD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBED5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBEDD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBEE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBEED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBEF5 |
  db $00, $00, $00, $00, $13, $13, $02, $13 ; $0BBEFD |
  db $13, $01, $01, $01, $13, $13, $13, $13 ; $0BBF05 |
  db $13, $01, $01, $01, $13, $13, $13, $01 ; $0BBF0D |
  db $01, $01, $01, $13, $13, $13, $13, $13 ; $0BBF15 |
  db $13, $13, $13, $13, $13, $02, $01, $01 ; $0BBF1D |
  db $13, $13, $13, $13, $13, $13, $13, $00 ; $0BBF25 |
  db $13, $13, $02, $01, $01, $02, $02, $02 ; $0BBF2D |
  db $01, $01, $13, $02, $50, $00, $01, $01 ; $0BBF35 |
  db $01, $01, $13, $02, $02, $02, $02, $02 ; $0BBF3D |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $0BBF45 |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $0BBF4D |
  db $02, $02, $02, $02, $02, $02, $02, $02 ; $0BBF55 |
  db $02, $02, $02, $02, $02, $02, $12, $10 ; $0BBF5D |
  db $13, $13, $10, $02, $02, $02, $10, $13 ; $0BBF65 |
  db $13, $13, $13, $13, $10, $10, $13, $13 ; $0BBF6D |
  db $10, $10, $13, $00, $00, $00, $13, $13 ; $0BBF75 |
  db $13, $13, $13, $13, $13, $13, $13, $00 ; $0BBF7D |
  db $00, $13, $13, $00, $00, $13, $13, $13 ; $0BBF85 |
  db $13, $13, $13, $00, $00, $43, $12, $00 ; $0BBF8D |
  db $00, $50, $50, $00, $00, $23, $12, $00 ; $0BBF95 |
  db $00, $00, $00, $00, $00, $13, $53, $02 ; $0BBF9D |
  db $02, $02, $02, $00, $00, $13, $00, $02 ; $0BBFA5 |
  db $02, $02, $02, $00, $00, $00, $00, $02 ; $0BBFAD |
  db $02, $00, $02, $00, $00, $00, $00, $00 ; $0BBFB5 |
  db $00, $00, $02, $00, $00, $00, $00, $00 ; $0BBFBD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFC5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFCD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFD5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFDD |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFE5 |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFED |
  db $00, $00, $00, $00, $00, $00, $00, $00 ; $0BBFF5 |
  db $00, $00, $00                          ; $0BBFFD |

