; loaded at $200

	DS 100		;0200 00	return stack
RetunStackTop: ; top of return stack

Sys000: ; FCB  text in/out file control block?
	DB 0		;0264 00	status???
	DB 0		;0265 00	device #
	DB 0		;0266 00
	DB 0		;0267 00
	DW 400		;0268 01 90
	DW L_0E49	;026A 0E 49 ; fixupword
	DB 0		;026C 00
	DB 0		;026D 00
	DB 0		;026E 00
	DB 1		;026F 01
	DB 2		;0270 02
	DB 2		;0271 02
	DB 0		;0272 00
	DB $84		;0273 84
	DW L_0C2D	;0274 0C 2D ; fixupword
	DB 0		;0276 00
	DB 0		;0277 00
	DB 0		;0278 00
	DB 0		;0279 00
	DB 0		;027A 00
	DB 0		;027B 00
	DB 0		;027C 00
	DB 0		;027D 00
	DB 0		;027E 00
	DB 0		;027F 00
	DB 0		;0280 00
	DB 0		;0281 00

Sys001: ; FCB  text out/in file?
	DB 0		;0282 00	status?
	DB 1		;0283 01	device #
	DB 0		;0284 00
	DB 0		;0285 00	function?
	DW 400		;0286 01 90
	DW L_0FDC	;0288 0F DC ; fixupword
	DB 0		;028A 00
	DB 0		;028B 00
	DB 0		;028C 00
	DB 1		;028D 01
	DB 2		;028E 02
	DB 2		;028F 02
	DB 0		;0290 00
	DB $84		;0291 84
	DW L_0C2D	;0292 0C 2D ; fixupword
	DB 0		;0294 00
	DB 0		;0295 00
	DB 0		;0296 00
	DB 0		;0297 00
	DB 0		;0298 00
	DB 0		;0299 00
	DB 0		;029A 00
	DB 0		;029B 00
	DB 0		;029C 00
	DB 0		;029D 00
	DB 0		;029E 00
	DB 0		;029F 00

Sys002: ; FCB   file control block?
	DB 0		;02A0 00	status?
	DB 2		;02A1 02	device #
	DB 0		;02A2 00
	DB 0		;02A3 00	function?
	DW 0		;02A4 00 00
	DW 0		;02A6 00 00
	DB 0		;02A8 00
	DB 0		;02A9 00
	DB 0		;02AA 00
	DB 0		;02AB 00
	DB 1		;02AC 01
	DB 2		;02AD 02
	DB 0		;02AE 00
	DB $84		;02AF 84
	DW L_0C2D	;02B0 0C 2D ; fixupword
	DB 0		;02B2 00
	DB 0		;02B3 00
	DB 0		;02B4 00
	DB 0		;02B5 00
	DB 0		;02B6 00
	DB 0		;02B7 00
	DB 0		;02B8 00
	DB 0		;02B9 00
	DB 0		;02BA 00
	DB 0		;02BB 00
	DB 0		;02BC 00
	DB 0		;02BD 00

Sys081: ; FCB  SYSIPT?  console??? file control block
	DB 0		;02BE 00	status?
	DB $81		;02BF 81	device #
	DB 0		;02C0 00
	DB 0		;02C1 00	function?
	DW 1		;02C2 00 01
	DW L_02C8	;02C4 02 C8 ; fixupword
	DB 0		;02C6 00
	DB 0		;02C7 00
	DB 0		;02C8 00
	DB 1		;02C9 01
	DB 0		;02CA 00


E_02CB: ; Main entry point
	LDA #RetunStackTop	;02CB 90 02 64 ; fixupword	init return stack
	XAS		;02CE 5F
	STA L_030a+1	;02CF B3 3A			modify key cmd routine
	LDA #L_0305	;02D1 90 03 05 ; fixupword
	STA L_11fd+1	;02D4 B1 11 FE ; fixupword
	JSR E_1196	;02D7 79 11 96 ; fixupword	type "TEXT - 6.01"
	DW L_0A29	;02DA 0A 29 ; fixupword
	LDAB #3		;02DC 80 03			open file?
	JSR E_02f8	;02DE 7B 18
	DW Sys001	;02E0 02 82 ; fixupword
	LDAB #3		;02E2 80 03			open file?
	JSR E_02f8	;02E4 7B 12
	DW Sys081	;02E6 02 BE ; fixupword
	LDAB #3		;02E8 80 03			open file?
	JSR E_02f8	;02EA 7B 0C
	DW Sys000	;02EC 02 64 ; fixupword
	SVC 5		;02EE 66 05			@TS  get date/time?
	DB $c		;02f0 0C			  format
	DW Sys000	;02F1 02 64 ; fixupword		  pointer?
	LDAB L_031a+1	;02F3 B3 26
	JMP L_0628	;02F5 71 06 28 ; fixupword


E_02F8: ; open an FCB?
	LDB (XW+)	;02F8 D5 41		get inline FCB ptr
	STAB 2(BW)	;02FA A5 28 02		set ???
	LDAB #9		;02FD 80 09		set function?
	STAB 3(BW)	;02FF A5 28 03
	SVC $18		;0302 66 18		open???
	RSR		;0304 09


	JSR L_124A	;0305 79 12 4A ; fixupword	cvt string to lowercase
	DW L_0C2D	;0308 0C 2D ; fixupword
L_030A: ; do a command key
	LDA #0		;030A 90 00 00	modified	empty return stack???
	XAS		;030D 5F
	JSR E_0337	;030E 7B 27			get an alpha key
	SLR BW,1	;0310 35 20			jump indexed
	LDA #KeyCmdTable ;0312 90 0B F9 ; fixupword
	AAB		;0315 58
	JMP @(BW)	;0316 75 24


E_0318:	SVC $0b		;0318 66 0B		@DT
L_031a:	STA #0		;031A B0 00 00
	RSR		;031D 09


E_031E: ; end this program
	JSR E_1196	;031E 79 11 96 ; fixupword	type "END TEXT"
	DW L_0A9A	;0321 0A 9A ; fixupword
	JSR E_11ab	;0323 79 11 AB ; fixupword
	SVC $0a		;0326 66 0A			exit with code 0
	DB 0		;0328 00


E_0329: ; get a boolean key, return in Valid flag
	JSR E_0337	;0329 7B 0C		get an alpha key
	LDBB #'N'+$80	;032B C0 CE
	SABB		;032D 49
	BZ @0336	;032E 14 06		valid is clear
	LDBB #'Y'+$80	;0330 C0 D9
	SABB		;0332 49
	BNZ E_0329	;0333 15 F4
	XAB		;0335 5D		set valid
@0336:	RSR		;0336 09


E_0337: ; Get an alpha key, return in AL, return value-'a' in BW
	JSR E_11ab	;0337 79 11 AB ; fixupword
	LDAB #'-'+$80	;033A 80 AD
	JSR E_11b2	;033C 79 11 B2 ; fixupword
	JSR E_11e6	;033F 79 11 E6 ; fixupword
	LDBB #$df	;0342 C0 DF			ASCII uppercase
	ANDB AL,BL	;0344 42 31
	LDBB #'Z'+$80	;0346 C0 DA		if >'Z' try again
	SABB		;0348 49
	BGZ E_0337	;0349 18 EC
	LDB #'A'+$80	;034B D0 00 C1		if <'A' try again
	SABB		;034E 49
	BM E_0337	;034F 16 E6
	RSR		;0351 09



E_0352:	LDA #L_0c2d	;0352 90 0C 2D ; fixupword	Y=string ptr
	XAY		;0355 5C
	LDB (YW+)	;0356 D5 61			B=string length
E_0358: ; compare strings?
	LDA (XW+)	;0358 95 41			Z= inline ptr
	XAZ		;035A 5E
	STX (-SW)	;035B 6D A2			save X
	LDA (ZW+)	;035D 95 81
	BZ @0394	;035F 14 33
	STA @0377+1	;0361 B3 15
	SUB AW,BW	;0363 51 20
	BM 0394		;0365 16 2D
	XAX		;0367 5B
@0368:	LDAB (YW)	;0368 8B
	LDBB (ZW)	;0369 CC
	SABB		;036A 49
	BNZ @038f	;036B 15 22
	XFR AW,YW	;036D 55 60
	STA @0384+1	;036F B3 14
	XFR AW,ZW	;0371 55 80
	STA @0388+1	;0373 B3 14
	STX @038c+1	;0375 6B 16
@0377:	LDX #0		;0377 60 00 00	modified
@037A:	DCX		;037A 3F
	BM @0398	;037B 16 1B
	LDAB (YW+)	;037D 85 61
	LDBB (ZW+)	;037F C5 81
	SABB		;0381 49
	BZ @037a	;0382 14 F6
@0384:	LDA #0		;0384 90 00 00	modified
	XAY		;0387 5C
@0388:	LDA #0		;0388 90 00 00	modified
	XAZ		;038B 5E
@038c:	LDX #0		;038C 60 00 00	modified
@038F:	INR YW,1	;038F 30 60
	DCX		;0391 3F
	BP @0368	;0392 17 D4
@0394:	LDX (SW+)	;0394 65 A1			restore X
	CLA		;0396 3A
	RSR		;0397 09

@0398:	LDA @0384+1	;0398 93 EB
	LDX (SW+)	;039A 65 A1			restore X
	RSR		;039C 09


E_039D:	LDA (SW)	;039D 9D
	XAZ		;039E 5E
	ADD AW,BW	;039F 50 20
	XAY		;03A1 5C
	LDA #L_0c2f	;03A2 90 0C 2F ; fixupword
	SUB AW,YW	;03A5 51 60
	LDB L_0c2d	;03A7 D1 0C 2D ; fixupword
	SUB AW,BW	;03AA 51 20
	BZ @03b7	;03AC 14 09
	DCA		;03AE 39
	MVF A,(Y),(Z)	;03AF 67 4A 68
	INA		;03b2 38
	ADD YW,AW	;03b3 50 06
	ADD ZW,AW	;03B5 50 08
@03B7:	LDA #L_0c2f	;03B7 90 0C 2F ; fixupword
	SUB AW,ZW	;03BA 51 80
	STA L_0c2d	;03BC B1 0C 2D ; fixupword
	RSR		;03BF 09


E_03C0:	LDB #L_0c2d	;03C0 D0 0C 2D ; fixupword
	LDA (BW+)	;03C3 95 21
	AAB		;03C5 58
	XFR ZW,BW	;03C6 55 28
	LDB L_0cb4	;03C8 D1 0C B4 ; fixupword
	ADD AW,BW	;03CB 50 20
	STA L_0c2d	;03CD B1 0C 2D ; fixupword
	ADD BW,ZW	;03D0 50 82
@03D2:	LDA (SW)	;03D2 9D
	SUB AW,ZW	;03D3 51 80
	BZ @03dd	;03D5 14 06
	LDAB (-ZW)	;03D7 85 82
	STAB (-BW)	;03D9 A5 22
	JMP @03d2	;03DB 73 F5

@03DD:	XFR YW,YW,(L_0cb6) ;03DD 55 76 0C B6 ; fixupword
	LDA L_0cb4	;03E1 91 0C B4 ; fixupword
	BZ @03ef	;03E4 14 09
	DCA		;03E6 39
	MVF A,(Y),(Z)	;03E7 67 4A 68
	INA		;03ea 38
	ADD YW,AW	;03eb 50 06
	ADD ZW,AW	;03ED 50 08
@03EF:	RSR		;03EF 09

E_03F0:	CLA		;03F0 3A
	JMP E_03f8	;03F1 73 05


E_03F3: ; key K
	JSR E_0318	;03F3 79 03 18 ; fixupword
	LDAB #$cb	;03F6 80 CB
E_03F8:	STAB L_0411+1	;03F8 A3 18
	CLA		;03FA 3A
L_03FB:	STAB #00	;03FB A0 00
	INA		;03FD 38
L_03fe:	STAB #00	;03FE A0 00
L_0400:	JSR E_119e	;0400 79 11 9E ; fixupword
	DW L_0DC2	;0403 0D C2 ; fixupword
	JSR E_124A	;0405 79 12 4A ; fixupword
	DW L_0DC2	;0408 0D C2 ; fixupword
L_040A:	LDAB L_03fe+1	;040A 83 F3
	BZ L_0411	;040C 14 03
	JSR E_06fb	;040E 79 06 FB ; fixupword
L_0411:	LDAB #00	;0411 80 00
	BZ @0421	;0413 14 0C
	JSR E_119e	;0415 79 11 9E ; fixupword
	DW L_0C2D	;0418 0C 2D ; fixupword
	JSR E_124a	;041A 79 12 4A ; fixupword
	DW L_0C2D	;041D 0C 2D ; fixupword
	JMP @0438	;041F 73 17

@0421:	JSR E_06af	;0421 79 06 AF ; fixupword
	BNL @042d	;0424 11 07
	JSR 1196	;0426 79 11 96 ; fixupword	type "EOF ON INPUT"
	DW L_0A63	;0429 0A 63 ; fixupword
	JMP L_044e	;042B 73 21

@042d:	JSR E_124A	;042D 79 12 4A ; fixupword
	DW L_0C2D	;0430 0C 2D ; fixupword
	LDAB L_03fb+1	;0432 83 C8
	BZ @0438	;0434 14 02
	JSR E_048e	;0436 7B 56
@0438:	JSR E_0352	;0438 79 03 52 ; fixupword
	DW L_0DC2	;043B 0D C2 ; fixupword
	DB $14 ???	;043D 14
	DB $CB ;K	;043E CB
	LDABL_ 03fb+1	;043F 83 BB
	BNZ L_044e	;0441 15 0B
	LDAB L_0411+1	;0443 83 CD
	BNZ L_044e	;0445 15 07
	JMP L_047c	;0447 73 33


BadParm: JSR E_1196	;0449 79 11 96 ; fixupword	type "ILLEGAL PARAMETER"
	DW L_0B2F	;044C 0B 2F ; fixupword
L_044E:	JMP L_030a	;044E 71 03 0A ; fixupword


E_0451:	JSR E_1196	;0451 79 11 96 ; fixupword	type "FIND? (Y OR N)"
	DW L_0AA5	;0454 0A A5 ; fixupword
	JSR L_0329	;0456 79 03 29 ; fixupword	get a boolean key
	BZ @046a	;0459 14 0F
	JSR E_0318	;045B 79 03 18 ; fixupword
	JSR E_06fb	;045E 79 06 FB ; fixupword
	CLA		;0461 3A
	STAB L_03fe+1	;0462 A3 9B
	STAB L_03fb+1	;0464 A3 96
	STAB L_0411+1	;0466 A3 AA
	JMP L_0400	;0468 73 96

@046A:	JMP L_030a	;046A 71 03 0A ; fixupword


E_046D:	JSR E_119e	;046D 79 11 9E ; fixupword
	DW L_0DC2	;0470 0D C2 ; fixupword
	JSR E_124A	;0472 79 12 4A ; fixupword
	DW L_0DC2	;0475 0D C2 ; fixupword
	LDA L_0DC2	;0477 91 0D C2 ; fixupword
	BNZ L_0481	;047A 15 05
L_047C:	JSR E_048e	;047C 7B 10
	JMP L_030a	;047E 71 03 0A ; fixupword

L_0481:	CLA		;0481 3A
	STAB L_0411+1	;0482 A3 8E
	INA		;0484 38
	STAB L_03fe+1	;0485 A1 03 FF ; fixupword
	STAB L_03fb+1	;0488 A1 03 FC ; fixupword
	JMP L_040a	;048B 71 04 0A ; fixupword

L_048E:	JSR E_1196	;048E 79 11 96 ; fixupword
	DW L_0C2D	;0491 0C 2D ; fixupword
	RSR		;0493 09

L_0494:	LDAB #0		;0494 80 00
	BNZ @049a	;0496 15 02
	INAB		;0498 28
	RSR		;0499 09

@049A:	JSR E_048e	;049A 7B F2
	JSR E_1196	;049C 79 11 96 ; fixupword	type "OK?"
	DW L_0AFD	;049F 0A FD ; fixupword
	JSR E_0329	;04A1 79 03 29 ; fixupword	get a boolean key
	RSR		;04A4 09


E_04A5:	JSR L_0318	;04A5 79 03 18 ; fixupword
	JSR E_119e	;04A8 79 11 9E ; fixupword
	DW L_0CB4	;04AB 0C B4 ; fixupword
	JSR E_124A	;04AD 79 12 4A ; fixupword
	DW L_0CB4	;04B0 0C B4 ; fixupword
	JSR E_119E	;04B2 79 11 9E ; fixupword
	DW L_0D3B	;04B5 0D 3B ; fixupword
	JSR E_124a	;04B7 79 12 4A ; fixupword
	DW L_0D3B	;04BA 0D 3B ; fixupword
	LDA 0d3b	;04BC 91 0D 3B ; fixupword
	BZ BadParm	;04BF 14 88
	JSR E_119e	;04C1 79 11 9E ; fixupword
	DW L_0DC2	;04C4 0D C2 ; fixupword
	JSR L_124A	;04C6 79 12 4A ; fixupword
	DW L_0DC2	;04C9 0D C2 ; fixupword
	CLA		;04CB 3A
	STA ???		;04CC B3 1F
	JSR E_1196	;04ce 79 11 96 ; fixupword	type "WAIT?"
	DW L_0AF6	;04D1 0A F6 ; fixupword
	JSR E_0329	;04D3 79 03 29 ; fixupword	get a boolean key
	STBB L_0495	;04D6 E3 BD
	JSR E_06fb	;04D8 79 06 FB ; fixupword
	JSR E_06af	;04DB 79 06 AF ; fixupword
	BL @0523	;04DE 10 43
	JSR E_0352	;04E0 79 03 52 ; fixupword
	DW L_0D3B	;04E3 0D 3B ; fixupword
	BZ @051c	;04E5 14 35
	XAX		;04E7 5B
@04E8:	JSR E_0494	;04E8 7B AA
	BZ @0505	;04EA 14 19
@04ec:	LDA #0000	;04EC 90 00 00
	INA		;04EF 38
	STA @04ec+1	;04F0 B3 FB
	LDB 0d3b	;04F2 D1 0D 3B ; fixupword
	JSR E_039d	;04F5 79 03 9D ; fixupword
	LDB 0cb4	;04F8 D1 0C B4 ; fixupword
	BZ @0505	;04FB 14 08
	JSR E_03c0	;04FD 79 03 C0 ; fixupword
	LDA 0cb4	;0500 91 0C B4 ; fixupword
	JMP @0508	;0503 73 03

@0505:	LDA L_0d3b	;0505 91 0D 3B ; fixupword
@0508:	XAY		;0508 5C
	ADD YW,XW	;0509 50 46
	LDB #L_0c2f	;050B D0 0C 2F ; fixupword
	SUB BW,YW	;050E 51 62
	LDA L_0c2d	;0510 91 0C 2D ; fixupword
	SAB		;0513 59
	JSR E_0358	;0514 79 03 58 ; fixupword
	DW L_0D3B	;0517 0D 3B ; fixupword
	XAX		;0519 5B
	BNZ @04e8	;051A 15 CC
@051C:	JSR E_0352	;051C 79 03 52 ; fixupword
	DW L_0DC2	;051F 0D C2 ; fixupword
	B?? ???		;0521 14 B5
@0523:	LDA #$a0a0	;0523 90 A0 A0
	STA L_0af1	;0526 B1 0A F1 ; fixupword
	STA L_0af3	;0529 B1 0A F3 ; fixupword
	LDA @04ec+1	;052C 93 BF
	SVC $2e		;052E 66 2E
	DW L_0AF5	;0530 0A F5 ; fixupword
	JSR E_1196	;0532 79 11 96 ; fixupword	type "SUBSTITUTIONS =     "
	DW L_0AE0	;0535 0A E0 ; fixupword
	JSR E_048E	;0537 79 04 8E ; fixupword
L_053A:	JMP L_030a	;053A 71 03 0A ; fixupword


E_053D: ; Key D
	JSR E_0318	;053D 79 03 18 ; fixupword
	JSR E_119e	;0540 79 11 9E ; fixupword
	DW L_0CB4	;0543 0C B4 ; fixupword
	JSR L_124A	;0545 79 12 4A ; fixupword
	DW L_0CB4	;0548 0C B4 ; fixupword
	LDA L_0CB4	;054A 91 0C B4 ; fixupword
	BNZ @055B	;054D 15 0C
	JSR E_119e	;054F 79 11 9E ; fixupword
	DW L_0C2D	;0552 0C 2D ; fixupword
	JSR E_124a	;0554 79 12 4A ; fixupword
	DW L_0C2D	;0557 0C 2D ; fixupword
	JMP L_053a	;0559 73 DF

@055b:	JSR E_0352	;055B 79 03 52 ; fixupword
	DW L_0CB4	;055E 0C B4 ; fixupword
	BZ ???		;0560 14 40
	XAX		;0562 5B
	DB $D1 ;Q	;0563 D1
	DW L_0CB4	;0564 0C B4 ; fixupword
	JSR E_039D	;0566 79 03 9D ; fixupword
L_0569:	JSR E_119e	;0569 79 11 9E ; fixupword
	DW L_0CB4	;056C 0C B4 ; fixupword
	JSR E_124A	;056E 79 12 4A ; fixupword
	DW L_0CB4	;0571 0C B4 ; fixupword
	LDA L_0CB4	;0573 91 0C B4 ; fixupword
	BZ ???		;0576 14 C2
	JSR E_03c0	;0578 79 03 C0 ; fixupword
	JMP ???		;057b 73 BD


E_057D: ; Key I
	JSR E_0318	;057D 79 03 18 ; fixupword
	JSR E_119e	;0580 79 11 9E ; fixupword
	DW L_0CB4	;0583 0C B4 ; fixupword
	JSR E_124A	;0585 79 12 4A ; fixupword
	DW L_0CB4	;0588 0C B4 ; fixupword
	LDA L_0CB4	;058A 91 0C B4 ; fixupword
	BNZ ???		;058D 15 09
	LDX #L_0C2D	;058F 60 0C 2D ; fixupword
	LDA (XW+)	;0592 95 41
	ADD XW,AW	;0594 50 04
	JMP L_0569	;0596 73 D1

	JSR E_0352	;0598 79 03 52 ; fixupword
	DW L_0CB4	;059B 0C B4 ; fixupword
	BZ @05a2	;059D 14 03
	XAX		;059F 5B
	JMP ???		;05A0 73 C7

@05a2:	JSR E_1196	;05A2 79 11 96 ; fixupword	type "EQUALITY NOT FOUND"
	DW L_0B42	;05A5 0B 42 ; fixupword
	JMP ???		;05A7 73 34


E_05A9:	JSR E_06fb	;05A9 79 06 FB ; fixupword
	JSR E_06af	;05AC 79 06 AF ; fixupword
	BNL @05b8	;05AF 11 07
	JSR E_1196	;05B1 79 11 96 ; fixupword	type "EOF ON INPUT"
	DW L_0A63	;05B4 0A 63 ; fixupword
	JMP L_05dd	;05B6 73 25

@05b8:	JSR E_048E	;05B8 79 04 8E ; fixupword
	JMP L_05dd	;05BB 73 20


E_05BD:	JSR E_0318	;05BD 79 03 18 ; fixupword
	LDA L_0c2d	;05C0 91 0C 2D ; fixupword
	STA L_0cb4	;05C3 B1 0C B4 ; fixupword
	JSR E_06fb	;05C6 79 06 FB ; fixupword
	LDA L_0cb4	;05C9 91 0C B4 ; fixupword
	STA L_0c2d	;05CC B1 0C 2D ; fixupword
	JMP L_05dd	;05CF 73 0C


E_05D1:	JSR E_06fb	;05D1 79 06 FB ; fixupword
	JMP L_05dd	;05D4 73 07


E_05D6:	JSR E_0318	;05D6 79 03 18 ; fixupword
	CLA		;05D9 3A
	STA L_0c2d	;05DA B1 0C 2D ; fixupword
L_05DD:	JMP L_030a	;05DD 71 03 0A ; fixupword


E_05E0:	JSR E_1196	;05E0 79 11 96 ; fixupword	type "TOP? (Y OR N)"
	DW L_0AB5	;05E3 0A B5 ; fixupword
	JSR L_0329	;05E5 79 03 29 ; fixupword		get a boolean key
	BZ L_05f2	;05E8 14 08
	JSR E_0318	;05EA 79 03 18 ; fixupword
	JSR E_0691	;05ED 79 06 91 ; fixupword
	JMP L_05dd	;05F0 73 EB

L_05F2:	JMP L_030a	;05F2 71 03 0A ; fixupword

E_05F5:	JSR E_1196	;05F5 79 11 96 ; fixupword	type "END OF FILE? (Y OR N) "
	DW L_0AC4	;05F8 0A C4 ; fixupword
	JSR L_0329	;05FA 79 03 29 ; fixupword	get a boolean key
	BZ L_05f2	;05FD 14 F3
	JSR E_0318	;05FF 79 03 18 ; fixupword
	JSR E_0645	;0602 7B 41
	JMP L_05dd	;0604 73 D7

E_0606: ; exit?
	JSR E_06fb	;0606 79 06 FB ; fixupword
	JSR E_06af	;0609 79 06 AF ; fixupword
	BNL E_0606	;060C 11 F8
	JSR E_0691	;060E 79 06 91 ; fixupword
	JSR E_0645	;0611 7B 32
L_0613:	LDA #Sys000	;0613 90 02 64 ; fixupword
L_0616:	LDB #Sys001	;0616 D0 02 82 ; fixupword
	STB L_0613+1	;0619 F3 F9
	STA L_0616+1	;061B B3 FA
	LDAB L_0328	;061D 81 03 28 ; fixupword
	RRRB AL,1	;0620 26 10
	CL		;0622 08
	RLRB AL,1	;0623 27 10
	STAB L_0328	;0625 A1 03 28 ; fixupword
E_0628:	LDB L_0613+1	;0628 D3 EA
	LDAB 1(BW)	;062A 85 28 01
	LDBB #'0'+$80	;062D C0 B0
	AABB		;062F 48
	STBB L_0a7b	;0630 E1 0A 7B ; fixupword
	LDB L_0616+1	;0633 D3 E2
	LDAB 1(BW)	;0635 85 28 01
	LDBB #'0'+$80	;0638 C0 B0
L_063A:	AABB		;063A 48
	STBB L_0a87	;063B E1 0A 87 ; fixupword
	JSR E_1196	;063E 79 11 96 ; fixupword	type "IN=SYS00X, OUT=SYS00X"
	DW L_0A71	;0641 0A 71 ; fixupword
	JMP ??		;0643 73 98

E_0645:
	LDA $#$a0a0	;0645 90 A0 A0			blank record count
	STA L_0b2a	;0648 B1 0B 2A ; fixupword
	STA L_0b2c	;064B B1 0B 2C ; fixupword
	LDA L_0ade	;064E 91 0A DE ; fixupword	insert count as ASCII
	SVC $2e		;0651 66 2E
	DW L_0B2E	;0653 0B 2E ; fixupword
	JSR E_1196	;0655 79 11 96 ; fixupword	type "RECORDS WRITTEN =     "
	DW L_0B17	;0658 0B 17 ; fixupword
	LDB ??		;065A D3 BB
	LDAB (BW)	;065C 89
	BNZ @0682	;065D 15 23
	LDA #2		;065F 90 00 02
	STA L_0c2d	;0662 B1 0C 2D ; fixupword
	LDA #$848d	;0665 90 84 8D
	STA L_0c2f	;0668 B1 0C 2F ; fixupword
	JSR E_06e8	;066B 79 06 E8 ; fixupword
	SF		;066E 02
	LDB L_0616+1	;066F D3 A6
	JSR E_06e8	;0671 79 06 E8 ; fixupword
	DB $0B		;0674 0B
	LDA L_0616+1	;0675 91 06 17 ; fixupword
	STA L_0680	;0678 B3 06
	LDA L_031b	;067A 91 03 1B ; fixupword
	SVC $05		;067D 66 05			@TS
	DB $d		;067F 0D
	DW 0		;0680 00 00
@0682:	CLA		;0682 3A			zero records written count
	STA V_0ade	;0683 B1 0A DE ; fixupword
	LDB L_0616+1	;0686 D1 06 17 ; fixupword
E_0689:	JSR E_06e8	;0689 7B 5D
	DB 4		;068B 04
	CLA		;068C 3A
	STA L_0c2d	;068D B1 0C 2D ; fixupword
	RSR		;0690 09


E_0691:	LDA #$a0a0	;0691 90 A0 A0			blank out count text
	STA L_0b12	;0694 B1 0B 12 ; fixupword
	STA L_0b14	;0697 B1 0B 14 ; fixupword
	LDA L_0adc	;069A 91 0A DC ; fixupword	insert record read count as ASCII
	SVC $2e		;069D 66 2E
	DW L_0B16	;069F 0B 16 ; fixupword
	JSR E_1196	;06A1 79 11 96 ; fixupword	type "RECORDS READ =     "
	DW L_0B02	;06A4 0B 02 ; fixupword
	CLA		;06A6 3A			zero records read count
	STA V_0adc	;06A7 B1 0A DC ; fixupword
	LDB L_0613+1	;06AA D1 06 14 ; fixupword
	JMP E_0689	;06AD 73 DA


E_06AF:	LDB L_0613+1	;06AF D1 06 14 ; fixupword
	LDAB (BW)	;06B2 89
	BNZ @06db	;06B3 15 26
	JSR E_06e8	;06B5 7B 31
	DB 1		;06B7 01
	BNZ @06db	;06B8 15 21
	JSR E_122b	;06BA 79 12 2B ; fixupword
	DW L_0C2D	;06BD 0C 2D ; fixupword
	LDA L_0c2d	;06BF 91 0C 2D ; fixupword
	BNZ @06cd	;06C2 15 09
	INA		;06C4 38
	STA L_0c2d	;06C5 B1 0C 2D ; fixupword
	LDAB #$a0	;06C8 80 A0
	STAB L_0c2f	;06CA A1 0C 2F ; fixupword
@06CD:	JSR E_124a	;06CD 79 12 4A ; fixupword
	DW L_0C2D	;06D0 0C 2D ; fixupword
	LDA V_0adc	;06D2 91 0A DC ; fixupword	increment records read count
	INA		;06D5 38
	STA V_0adc	;06D6 B1 0A DC ; fixupword
	RL		;06D9 07
	RSR		;06DA 09

@06DB:	DCAB		;06DB 29
	BNZ @06e0	;06DC 15 02
	SL		;06DE 06
	RSR		;06DF 09

@06E0:	JSR E_1196	;06E0 79 11 96 ; fixupword	type "ERR ON INPUT"
	DW L_0A37	;06E3 0A 37 ; fixupword
	JMP L_030A	;06E5 71 03 0A ; fixupword


E_06E8:	STB (-SW)	;06E8 F5 A2
	LDAB (XW+)	;06EA 85 41
	STAB 3(BW)	;06EC A5 28 03
	SVC $18		;06EF 66 18
@06F1:	SVC $07		;06F1 66 07
	LDB (SW)	;06F3 DD
	LDAB (BW)	;06F4 89
	BM @06f1	;06F5 16 FA
	LDB (SW+)	;06F7 D5 A1
	XABB		;06F9 4D
	RSR		;06FA 09


L_06FB:	LDB #L_0c2d	;06FB D0 0C 2D ; fixupword
	LDA (BW)	;06FE 99
	BLE @071b	;06FF 19 1A
	INA		;0701 38
	STA (BW+)	;0702 B5 21
	AAB		;0704 58
	LDAB #8d	;0705 80 8D
	STAB (-BW)	;0707 A5 22
	LDB L_0616+1	;0709 D1 06 17 ; fixupword
	LDAB (BW)	;070C 89
	BNZ @0720	;070D 15 11
	JSR E_06e8	;070F 7B D7
	DB 2		;0711 02
	BNZ @0720	;0712 15 0C
	LDA V_0ade	;0714 91 0A DE ; fixupword	increment records written count
	INA		;0717 38
	STA V_0ade	;0718 B1 0A DE ; fixupword
@071B:	CLA		;071B 3A
	STA L_0c2d	;071C B1 0C 2D ; fixupword
	RSR		;071F 09

@0720:	DCRB AL,2	;0720 21 11
	BZ @072b	;0722 14 07
	JSR E_1196	;0724 79 11 96 ; fixupword	type "ERR ON OUTPUT"
	DW L_0A45	;0727 0A 45 ; fixupword
	JMP @0730	;0729 73 05

@072B:	JSR E_1196	;072B 79 11 96 ; fixupword	type "EOM ON OUTPUT"
	DW L_0A54	;072E 0A 54 ; fixupword
@0730:	JMP L_030A	;0730 71 03 0A ; fixupword


E_0733: ; Key J
	JSR E_0318	;0733 79 03 18 ; fixupword
	JSR E_06fb	;0736 7B C3
	JSR E_1196	;0738 79 11 96 ; fixupword	type "'SYS' NUMBER?"
	DW L_0A88	;073B 0A 88 ; fixupword
	JSR E_119e	;073D 79 11 9E ; fixupword
	DW L_0D3B	;0740 0D 3B ; fixupword
	LDA #L_0d3d	;0742 90 0D 3D ; fixupword
	XAY		;0745 5C
	CLR XW,0	;0746 32 40
@0748:	LDAB (YW+)	;0748 85 61
	LDBB #$b9	;074A C0 B9
	SABB		;074C 49
	BGZ @0761	;074D 18 12
	LDB #00b0	;074F D0 00 B0
	SABB		;0752 49
	BM @0761	;0753 16 0C
	XFR AW,XW	;0755 55 40
	SLR AW,2	;0757 35 01
	ADD XW,AW	;0759 50 04
	SLR XW,1	;075B 35 40
	ADD XW,BW	;075D 50 24
	JMP @0748	;075F 73 E7

@0761:	XFR AW,XW	;0761 55 40
	LDBB #02	;0763 C0 02
	SABB		;0765 49
	BM E_0733	;0766 16 CB
	STAB L_02a1	;0768 A1 02 A1 ; fixupword
	JSR E_1196	;076B 79 11 96 ; fixupword	type "SUBFILE"
	DW Msg_0A20	;076E 0A 20 ; fixupword
	JSR L_119E	;0770 79 11 9E ; fixupword
	DW L_0D3B	;0773 0D 3B ; fixupword
	JSR E_116f	;0775 79 11 6F ; fixupword	change string to uppercase
	DW L_0D3B	;0778 0D 3B ; fixupword
	LDAB #1		;077A 80 01
	JSR E_02f8	;077C 79 02 F8 ; fixupword
	DW Sys002	;077F 02 A0 ; fixupword
	LDA L_0D3B	;0781 91 0D 3B ; fixupword
	BZ @07bd	;0784 14 37
	LDA #6		;0786 90 00 06
	LDB L_0d3b	;0789 D1 0D 3B ; fixupword
	JSR E_1206	;078C 79 12 06 ; fixupword
	DW L_0D43	;078F 0D 43 ; fixupword
	DW L_0D3D	;0791 0D 3D ; fixupword
@0793:	LDB L_077f	;0793 D3 EA
	JSR E_06e8	;0795 79 06 E8 ; fixupword
	DB 1		;0798 01
	BNZ @07d2	;0799 15 37
	LDAB L_0c2f	;079B 81 0C 2F ; fixupword
	LDBB #$a8	;079E C0 A8
	SABB		;07A0 49
	BNZ @0793	;07A1 15 F0
	JSR E_116f	;07A3 79 11 6F ; fixupword	change string to uppercase
	DW L_0C2D	;07A6 0C 2D ; fixupword
	LDA #L_0c30	;07A8 90 0C 30 ; fixupword
	XAZ		;07AB 5E
	LDA #L_0d43	;07AC 90 0D 43 ; fixupword
	XAY		;07AF 5C
	LDX #0003	;07B0 60 00 03
@07B3:	LDA (ZW+)	;07B3 95 81
	LDB (YW+)	;07B5 D5 61
	SAB		;07B7 59
	BNZ @0793	;07B8 15 D9
	DCX		;07BA 3F
	BGZ @07b3	;07BB 18 F6
@07BD:	LDB L_077f	;07BD D3 C0
	JSR E_06e8	;07BF 79 06 E8 ; fixupword
	DB 1		;07C2 01
	BNZ @07d2	;07C3 15 0D
	LDAB L_0c2f	;07C5 81 0C 2F ; fixupword
	LDBB #$a8	;07C8 C0 A8
	SABB		;07CA 49
	BZ @07d2	;07CB 14 05
	JSR E_06fb	;07CD 79 06 FB ; fixupword
	JMP @07bd	;07D0 73 EB

@07D2:	LDB L_077f	;07D2 D3 AB
	JSR E_0689	;07D4 79 06 89 ; fixupword
	JMP L_030a	;07D7 71 03 0A ; fixupword


E_07DA: ; Key H
	JSR E_0318	;07DA 79 03 18 ; fixupword
	LDAB #$c8	;07DD 80 C8
	STAB L_08b1	;07DF A1 08 B1 ; fixupword
	CLA		;07E2 3A
	STAB #0		;07E3 A0 00
	INA		;07E5 38
	STAB #0		;07E6 A0 00
	JSR E_119e	;07E8 79 11 9E ; fixupword
	DW L_0DC2	;07EB 0D C2 ; fixupword
	JSR E_124A	;07ED 79 12 4A ; fixupword
	DW L_0DC2	;07F0 0D C2 ; fixupword
	JSR E_1196	;07F2 79 11 96 ; fixupword	type "TAB="
	DW Msg_0B67	;07F5 0B 67 ; fixupword
	JSR E_119e	;07F7 79 11 9E ; fixupword
	DW L_0D3B	;07FA 0D 3B ; fixupword
	JSR E_124a	;07FC 79 12 4A ; fixupword
	DW L_0D3B	;07FF 0D 3B ; fixupword
	FIL $86,#0,L_0B6E	;0801 47 9C 85 00 0B 6E ; fixupword
	LDA L_0d3b	;0807 91 0D 3B ; fixupword
	BNZ @080f	;080A 15 03
	JMP L_0864	;080C 71 08 64 ; fixupword

@080F:	XFR ZW,ZW,#L_b6e	;080F 55 98 0B 6E ; fixupword
	STR ZW,ZW,L_0840	;0813 D6 89 08 40 ; fixupword
	LDB #L_0D3D	;0817 D0 0D 3D ; fixupword
L_081A:	MVV 4,#$AC,(BW)	;081A 47 2A 03 AC 22
	B?? @0827	;081F 12 06
	JSR E_083e	;0821 79 08 3E ; fixupword
	JMP L_081a	;0824 71 08 1A ; fixupword

@0827:	MVV 4,#0,(BW) 	;0827 47 2A 03 00 22
	B?? @0836	;082C 12 08
	JSR L_083E	;082E 79 08 3E ; fixupword
	CLA		;0831 3A
	STA (Z)		;0832 BC
	JMP L_0889	;0833 71 08 89 ; fixupword

@0836:	JSR L_1196	;0836 79 11 96 ; fixupword	type "ILLEGAL PARAMETER"
	DW L_0B2F	;0839 0B 2F ; fixupword
	JMP L_030A	;083B 71 03 0A ; fixupword

L_083E:	XFR ZW,ZW,#0	;083E 55 98 00 00
	STB (-SW)	;0842 F5 A2
	SUB BW,YW	;0844 51 62
	XFR AW,BW	;0846 55 20
	LDB (SW+)	;0848 D5 A1
	CTB 9,2,#$28,L_120f	;084A 46 81 8A 28 12 0F
	INA		;0850 38
	AAB		;0851 58
	LDA (ZW+)	;0852 95 81
	STR? ZW,ZW,L_0840	;0854 D6 89 08 40 ; fixupword
	AND AW,#$FF80?	;0858 52 10 FF 80
	B?? @085F	;085C 15 01
	RSR		;085E 09

@085F:	LDX (SW+)	;085F 65 A1
	JMP L_0836	;0861 71 08 36 ; fixupword

L_0864:	LDB #L_0b6e	;0864 D0 0B 6E ; fixupword	init tab stops?
	LDA #8		;0867 90 00 08
	STA (BW+)	;086A B5 21
	LDA #12		;086C 90 00 0C
	STA (BW+)	;086F B5 21
	LDA #16		;0871 90 00 10
	STA (BW+)	;0874 B5 21
	LDA #20		;0876 90 00 14
	STA (BW+)	;0879 B5 21
	LDA #32		;087B 90 00 20
	STA (BW+)	;087E B5 21
	LDA #40		;0880 90 00 28
	STA (BW+)	;0883 B5 21
	LDA #72		;0885 90 00 48
	STA (BW)	;0888 B9
	JSR E_1196	;0889 79 11 96 ; fixupword	type "TAB CHARACTER=/"
	DW L_0B56	;088C 0B 56 ; fixupword
	JSR E_11e6	;088E 79 11 E6 ; fixupword
	STA (-SW)	;0891 B5 A2
	JSR E_11ab	;0893 79 11 AB ; fixupword
	LDA (SW+)	;0896 95 A1
	STAB TabChar	;0898 A1 0B 6D ; fixupword
	LDAB TabChar	;089B 81 0B 6D ; fixupword
	BZ @08a3	;089E 14 03
	JMP L_08a8	;08A0 71 08 A8 ; fixupword

@08A3:	LDAB #$be	;08A3 80 BE
	STAB TabChar	;08A5 A1 0B 6D ; fixupword
L_08A8:	LDAB L_07e7	;08A8 81 07 E7 ; fixupword
	BZ @08b0	;08AB 14 03
	JSR E_06fb	;08AD 79 06 FB ; fixupword
@08B0:	LDAB #0		;08B0 80 00
	BNZ @08b7	;08B2 15 03
	JMP @09ae	;08B4 71 09 AE ; fixupword

@08B7:	LDA #1		;08B7 90 00 01
	STA L_11bb	;08BA B1 11 BB ; fixupword
	LDAB #$af	;08BD 80 AF
	JSR E_11b2	;08BF 79 11 B2 ; fixupword
	LDA #L_0c2f	;08C2 90 0C 2F ; fixupword
	XAZ		;08C5 5E
	LDA #$83	;08C6 90 00 83
	XAX		;08C9 5B
	CLR AW,1	;08CA 32 01
	XAY		;08CC 5C
L_08CD:	LDAB L_02c0	;08CD 81 02 C0 ; fixupword
	LDBB #8		;08D0 C0 08
	ORIB BL,AL	;08D2 43 13
	STBB L_02c0	;08D4 E1 02 C0 ; fixupword
	LDBB #1		;08D7 C0 01
	STBB L_02c1	;08D9 E1 02 C1 ; fixupword
	LDB #Sys081	;08DC D0 02 BE ; fixupword
	SVC $10		;08DF 66 10
	SVC $08		;08E1 66 08
	DW Sys081	;08E3 02 BE ; fixupword
	LDAB L_02c0	;08E5 81 02 C0 ; fixupword
	LDBB #8		;08E8 C0 08
	NABB		;08EA 4A
	STBB L_02c0	;08EB E1 02 C0 ; fixupword
	INR YW,1	;08EE 30 60
	DCX		;08F0 3F
	BNZ @08f9	;08F1 15 06
	JSR E_11ab	;08F3 79 11 AB ; fixupword
	JMP @099f	;08F6 71 09 9F ; fixupword

@08F9:	LDAB L_02ca	;08F9 81 02 CA ; fixupword
	LDBB TabChar	;08FC C1 0B 6D ; fixupword
	SABB		;08FF 49
	BZ @093d	;0900 14 3B
	LDBB #2		;0902 C0 02
	SABB		;0904 49
	BNZ @0923	;0905 15 1C
	XFR AW,YW	;0907 55 60
	DCR AW,2	;0909 31 01
	BNZ @0917	;090B 15 0A
	DCR YW,1	;090D 31 60
	INX		;090F 3E
	LDAB #$af	;0910 80 AF
	JSR E_11b2	;0912 79 11 B2 ; fixupword
	JMP @0920	;0915 73 09

@0917:	DCR YW,2	;0917 31 61
	INR XW,2	;0919 30 41
	JSR E_09f9	;091B 79 09 F9 ; fixupword
	LDAB (-ZW)	;091E 85 82
@0920:	JMP L_08cd	;0920 71 08 CD ; fixupword

@0923:	LDBB #$8d	;0923 C0 8D
	SABB		;0925 49
	BZ @099f	;0926 14 77
	LDBB #$8a	;0928 C0 8A
	SABB		;092A 49
	BNZ @0935	;092B 15 08
	LDAB #1		;092D 80 01
	STAB L_0bf8	;092F A1 0B F8 ; fixupword
	JMP @099f	;0932 71 09 9F ; fixupword

@0935:	LDAB L_02ca	;0935 81 02 CA ; fixupword
	STAB (ZW+)	;0938 A5 81
	JMP L_08cd	;093A 71 08 CD ; fixupword

@093D:	XFR AW,XW	;093D 55 40
	STA L_0bf4	;093F B1 0B F4 ; fixupword
	LDA #L_0b6e	;0942 90 0B 6E ; fixupword
	XAX		;0945 5B
	INC L_0BF4,1	;0946 30 10 0B F4 ; fixupword
	DCR YW,1	;094A 31 60
	XFR AW,YW	;094C 55 60
@094E:	LDB (XW+)	;094E D5 41
	STB L_0bf6	;0950 F1 0B F6 ; fixupword
	LDB L_0bf6	;0953 D1 0B F6 ; fixupword
	BZ @095e	;0956 14 06
	SAB		;0958 59
	BM @095e	;0959 16 03
	JMP @094e	;095B 71 09 4E ; fixupword

@095E:	JSR E_0a0c	;095E 79 0A 0C ; fixupword
	JSR E_09f9	;0961 79 09 F9 ; fixupword
	LDB L_0bf6	;0964 D1 0B F6 ; fixupword
	BNZ @096e	;0967 15 05
	STB (-SW)	;0969 F5 A2
	JMP @0996	;096B 71 09 96 ; fixupword

@096E:	XFR AW,YW	;096E 55 60
	STB (-SW)	;0970 F5 A2
	SAB		;0972 59
	BZ @0996	;0973 14 21
	LDB (SW+)	;0975 D5 A1
	LDAB #a0	;0977 80 A0
	STAB (ZW+)	;0979 A5 81
	STAB L_02ca	;097B A1 02 CA ; fixupword
	STB (-SW)	;097E F5 A2
	LDB #Sys081	;0980 D0 02 BE ; fixupword
	SVC $10		;0983 66 10
	SVC $08		;0985 66 08
	DW Sys081	;0987 02 BE ; fixupword
	LDB (SW+)	;0989 D5 A1
	INR YW,1	;098B 30 60
	DEC L_0BF4,1	;098D 31 10 0B F4 ; fixupword
	BZ @099f	;0991 14 0C
	JMP @096e	;0993 71 09 6E ; fixupword

@0996:	LDB (SW+)	;0996 D5 A1
	LDA 0bf4	;0998 91 0B F4 ; fixupword
	XAX		;099B 5B
	JMP 08cd	;099C 71 08 CD ; fixupword

@099F:	XFR AW,YW	;099F 55 60
	DCR AW,2	;09A1 31 01
	STA L_0c2d	;09A3 B1 0C 2D ; fixupword
	JSR E_124a	;09A6 79 12 4A ; fixupword
	DW L_0C2D	;09A9 0C 2D ; fixupword
	JMP @09c8	;09AB 71 09 C8 ; fixupword

@09AE:	JSR E_06af	;09AE 79 06 AF ; fixupword
	BNL @09bb	;09B1 11 08
	JSR E_1196	;09B3 79 11 96 ; fixupword	type "EOF ON INPUT"
	DW L_0A63	;09B6 0A 63 ; fixupword
	JMP L_044E	;09B8 71 04 4E ; fixupword

@09BB:	JSR E_124a	;09BB 79 12 4A ; fixupword
	DW L_0C2D	;09BE 0C 2D ; fixupword
	LDAB L_07e5	;09C0 81 07 E5 ; fixupword
	BZ @09c8	;09C3 14 03
	JSR E_048e	;09C5 79 04 8E ; fixupword
@09C8:	JSR E_0352	;09C8 79 03 52 ; fixupword
	DW L_0DC2	;09CB 0D C2 ; fixupword
	BNZ @09d4	;09CD 15 05
	LDAB L_0bf8	;09CF 81 0B F8 ; fixupword
	BZ @09de	;09D2 14 0A
@09d4:	JSR E_06fb	;09D4 79 06 FB ; fixupword
	CLAB		;09D7 2A
	STAB L_0bf8	;09D8 A1 0B F8 ; fixupword
	JMP L_030a	;09DB 71 03 0A ; fixupword

@09DE:	LDAB #$8a	;09DE 80 8A
	JSR E_11b2	;09E0 79 11 B2 ; fixupword
	JMP L_08a8	;09E3 71 08 A8 ; fixupword


E_09E6:	LDAB L_07e5	;09E6 81 07 E5 ; fixupword
	BZ @09ee	;09E9 14 03
	JMP L_044e	;09EB 71 04 4E ; fixupword

@09EE:	LDAB L_08b1	;09EE 81 08 B1 ; fixupword
	BZ @09f6	;09F1 14 03
	JMP L_044e	;09F3 71 04 4E ; fixupword

@09F6:	JMP L_047c	;09F6 71 04 7C ; fixupword


E_09F9:	LDAB #$a0	;09F9 80 A0
	STAB L_02ca	;09FB A1 02 CA ; fixupword
	LDBB #02	;09FE C0 02
	STBB L_02c1	;0A00 E1 02 C1 ; fixupword
	LDB #Sys081	;0A03 D0 02 BE ; fixupword
	SVC $10		;0A06 66 10
	SVC $08		;0A08 66 08
	DW Sys081	;0A0A 02 BE ; fixupword
E_0A0C:	LDBB #2		;0A0C C0 02
	STBB L_02c1	;0A0E E1 02 C1 ; fixupword
	LDAB #$88	;0A11 80 88
	STAB L_02ca	;0A13 A1 02 CA ; fixupword
	LDB #Sys081	;0A16 D0 02 BE ; fixupword
	SVC $10		;0A19 66 10
	SVC $08		;0A1B 66 08
	DW Sys081	;0A1D 02 BE ; fixupword
	RSR		;0A1F 09

Msg_0a20: ; string constant
	DW 7		;0A20 00 07	length
	DB D3 ;S	;0A22 D3
	DB D5 ;U	;0A23 D5
	DB C2 ;B	;0A24 C2
	DB C6 ;F	;0A25 C6
	DB C9 ;I	;0A26 C9
	DB CC ;L	;0A27 CC
	DB C5 ;E	;0A28 C5

L_0a29: ; string constant
	DW 12		;0A29 00 0C	length
	DB D4 ;T	;0A2B D4
	DB C5 ;E	;0A2C C5
	DB D8 ;X	;0A2D D8
	DB D4 ;T	;0A2E D4
	DB A0 ; 	;0A2F A0
	DB AD ;-	;0A30 AD
	DB A0 ; 	;0A31 A0
	DB B6 ;6	;0A32 B6
	DB AE ;.	;0A33 AE
	DB B0 ;0	;0A34 B0
	DB B1 ;1	;0A35 B1
	DB 8D		;0A36 8D

L_0a37: ; string constant
	DW 12		;0A37 00 0C	length
	DB C5 ;E	;0A39 C5
	DB D2 ;R	;0A3A D2
	DB D2 ;R	;0A3B D2
	DB A0 ; 	;0A3C A0
	DB CF ;O	;0A3D CF
	DB CE ;N	;0A3E CE
	DB A0 ; 	;0A3F A0
	DB C9 ;I	;0A40 C9
	DB CE ;N	;0A41 CE
	DB D0 ;P	;0A42 D0
	DB D5 ;U	;0A43 D5
	DB D4 ;T	;0A44 D4

L_0a45: ; string constant
	DW 13		;0A45 00 0D	length
	DB C5 ;E	;0A47 C5
	DB D2 ;R	;0A48 D2
	DB D2 ;R	;0A49 D2
	DB A0 ; 	;0A4A A0
	DB CF ;O	;0A4B CF
	DB CE ;N	;0A4C CE
	DB A0 ; 	;0A4D A0
	DB CF ;O	;0A4E CF
	DB D5 ;U	;0A4F D5
	DB D4 ;T	;0A50 D4
	DB D0 ;P	;0A51 D0
	DB D5 ;U	;0A52 D5
	DB D4 ;T	;0A53 D4

L_0a54: ; string constant
	DW 13		;0A54 00 0D	length
	DB C5 ;E	;0A56 C5
	DB CF ;O	;0A57 CF
	DB CD ;M	;0A58 CD
	DB A0 ; 	;0A59 A0
	DB CF ;O	;0A5A CF
	DB CE ;N	;0A5B CE
	DB A0 ; 	;0A5C A0
	DB CF ;O	;0A5D CF
	DB D5 ;U	;0A5E D5
	DB D4 ;T	;0A5F D4
	DB D0 ;P	;0A60 D0
	DB D5 ;U	;0A61 D5
	DB D4 ;T	;0A62 D4

L_0a63: ; string constant
	DW 12		;0A63 00 0C	length
	DB C5 ;E	;0A65 C5
	DB CF ;O	;0A66 CF
	DB C6 ;F	;0A67 C6
	DB A0 ; 	;0A68 A0
	DB CF ;O	;0A69 CF
	DB CE ;N	;0A6A CE
	DB A0 ; 	;0A6B A0
	DB C9 ;I	;0A6C C9
	DB CE ;N	;0A6D CE
	DB D0 ;P	;0A6E D0
	DB D5 ;U	;0A6F D5
	DB D4 ;T	;0A70 D4

L_0a71: ; string
	DW $15		;0A71 00 15	length
	DB C9 ;I	;0A73 C9
	DB CE ;N	;0A74 CE
	DB BD ;=	;0A75 BD
	DB D3 ;S	;0A76 D3
	DB D9 ;Y	;0A77 D9
	DB D3 ;S	;0A78 D3
	DB B0 ;0	;0A79 B0
	DB B0 ;0	;0A7A B0
L_0a7b:	DB D8 ;X	;0A7B D8	modified
	DB AC ;,	;0A7C AC
	DB A0 ; 	;0A7D A0
	DB CF ;O	;0A7E CF
	DB D5 ;U	;0A7F D5
	DB D4 ;T	;0A80 D4
	DB BD ;=	;0A81 BD
	DB D3 ;S	;0A82 D3
	DB D9 ;Y	;0A83 D9
	DB D3 ;S	;0A84 D3
	DB B0 ;0	;0A85 B0
	DB B0 ;0	;0A86 B0
L_0a87:	DB D8 ;X	;0A87 D8	modified

L_0a88: ; string constant
	DW 13		;0A88 00 0D	length
	DB A7 ;'	;0A8A A7
	DB D3 ;S	;0A8B D3
	DB D9 ;Y	;0A8C D9
	DB D3 ;S	;0A8D D3
	DB A7 ;'	;0A8E A7
	DB A0 ; 	;0A8F A0
	DB CE ;N	;0A90 CE
	DB D5 ;U	;0A91 D5
	DB CD ;M	;0A92 CD
	DB C2 ;B	;0A93 C2
	DB C5 ;E	;0A94 C5
	DB D2 ;R	;0A95 D2
	DB BF ;?	;0A96 BF

L_0a97:	DW 1		;0A97 00 01	unused string
	DB AD ;-	;0A99 AD

L_0a9a: ; string constant
	DW 9		;0A9A 00 09	length
	DB C5 ;E	;0A9C C5
	DB CE ;N	;0A9D CE
	DB C4 ;D	;0A9E C4
	DB A0 ; 	;0A9F A0
	DB D4 ;T	;0AA0 D4
	DB C5 ;E	;0AA1 C5
	DB D8 ;X	;0AA2 D8
	DB D4 ;T	;0AA3 D4
	DB 8D		;0AA4 8D

L_0aa5: ; string constant
	DW $e		;0AA5 00 0E	length
	DB C6 ;F	;0AA7 C6
	DB C9 ;I	;0AA8 C9
	DB CE ;N	;0AA9 CE
	DB C4 ;D	;0AAA C4
	DB BF ;?	;0AAB BF
	DB A0 ; 	;0AAC A0
	DB A8 ;(	;0AAD A8
	DB D9 ;Y	;0AAE D9
	DB A0 ; 	;0AAF A0
	DB CF ;O	;0AB0 CF
	DB D2 ;R	;0AB1 D2
	DB A0 ; 	;0AB2 A0
	DB CE ;N	;0AB3 CE
	DB A9 ;)	;0AB4 A9

L_0ab5: ; string constant
	DW $D		;0AB5 00 0D	length
	DB D4 ;T	;0AB7 D4
	DB CF ;O	;0AB8 CF
	DB D0 ;P	;0AB9 D0
	DB BF ;?	;0ABA BF
	DB A0 ; 	;0ABB A0
	DB A8 ;(	;0ABC A8
	DB D9 ;Y	;0ABD D9
	DB A0 ; 	;0ABE A0
	DB CF ;O	;0ABF CF
	DB D2 ;R	;0AC0 D2
	DB A0 ; 	;0AC1 A0
	DB CE ;N	;0AC2 CE
	DB A9 ;)	;0AC3 A9

L_0ac4: ; string constant
	DW $16		;0AC4 00 16	length
	DB C5 ;E	;0AC6 C5
	DB CE ;N	;0AC7 CE
	DB C4 ;D	;0AC8 C4
	DB A0 ; 	;0AC9 A0
	DB CF ;O	;0ACA CF
	DB C6 ;F	;0ACB C6
	DB A0 ; 	;0ACC A0
	DB C6 ;F	;0ACD C6
	DB C9 ;I	;0ACE C9
	DB CC ;L	;0ACF CC
	DB C5 ;E	;0AD0 C5
	DB BF ;?	;0AD1 BF
	DB A0 ; 	;0AD2 A0
	DB A8 ;(	;0AD3 A8
	DB D9 ;Y	;0AD4 D9
	DB A0 ; 	;0AD5 A0
	DB CF ;O	;0AD6 CF
	DB D2 ;R	;0AD7 D2
	DB A0 ; 	;0AD8 A0
	DB CE ;N	;0AD9 CE
	DB A9 ;)	;0ADA A9
	DB A0 ; 	;0ADB A0

V_0adc	DW 00	;0ADC 00 00	records read count
V_0ade:	DW 00	;0ADE 00 00	records written count

L_0ae0: ; string
	DW $14		;0AE0 00 14	length
	DB D3 ;S	;0AE2 D3
	DB D5 ;U	;0AE3 D5
	DB C2 ;B	;0AE4 C2
	DB D3 ;S	;0AE5 D3
	DB D4 ;T	;0AE6 D4
	DB C9 ;I	;0AE7 C9
	DB D4 ;T	;0AE8 D4
	DB D5 ;U	;0AE9 D5
	DB D4 ;T	;0AEA D4
	DB C9 ;I	;0AEB C9
	DB CF ;O	;0AEC CF
	DB CE ;N	;0AED CE
	DB D3 ;S	;0AEE D3
	DB A0 ; 	;0AEF A0
	DB BD ;=	;0AF0 BD
	DB A0 ; 	;0AF1 A0
	DB A0 ; 	;0AF2 A0	modified
	DB A0 ; 	;0AF3 A0	modified
	DB A0 ; 	;0AF4 A0	modified
	DB A0 ; 	;0AF5 A0	modified

L_0af6: ; string constant
	DW 5		;0AF6 00 05	length
	DB D7 ;W	;0AF8 D7
	DB C1 ;A	;0AF9 C1
	DB C9 ;I	;0AFA C9
	DB D4 ;T	;0AFB D4
	DB BF ;?	;0AFC BF

L_0afd: ; string constant
	DW 3		;0AFD 00 03	length
	DB CF ;O	;0AFF CF
	DB CB ;K	;0B00 CB
	DB BF ;?	;0B01 BF

L_0B02: ; string
	DW $13		;0B02 00 13	length
	DB D2 ;R	;0B04 D2
	DB C5 ;E	;0B05 C5
	DB C3 ;C	;0B06 C3
	DB CF ;O	;0B07 CF
	DB D2 ;R	;0B08 D2
	DB C4 ;D	;0B09 C4
	DB D3 ;S	;0B0A D3
	DB A0 ; 	;0B0B A0
	DB D2 ;R	;0B0C D2
	DB C5 ;E	;0B0D C5
	DB C1 ;A	;0B0E C1
	DB C4 ;D	;0B0F C4
	DB A0 ; 	;0B10 A0
	DB BD ;=	;0B11 BD
	DB A0 ; 	;0B12 A0
	DB A0 ; 	;0B13 A0	modified
	DB A0 ; 	;0B14 A0	modified
	DB A0 ; 	;0B15 A0	modified
	DB A0 ; 	;0B16 A0	modified

L_0b17: ; string
	DW $16		;0B17 00 16	length
	DB D2 ;R	;0B19 D2
	DB C5 ;E	;0B1A C5
	DB C3 ;C	;0B1B C3
	DB CF ;O	;0B1C CF
	DB D2 ;R	;0B1D D2
	DB C4 ;D	;0B1E C4
	DB D3 ;S	;0B1F D3
	DB A0 ; 	;0B20 A0
	DB D7 ;W	;0B21 D7
	DB D2 ;R	;0B22 D2
	DB C9 ;I	;0B23 C9
	DB D4 ;T	;0B24 D4
	DB D4 ;T	;0B25 D4
	DB C5 ;E	;0B26 C5
	DB CE ;N	;0B27 CE
	DB A0 ; 	;0B28 A0
	DB BD ;=	;0B29 BD
	DB A0 ; 	;0B2A A0
	DB A0 ; 	;0B2B A0	modified
	DB A0 ; 	;0B2C A0	modified
	DB A0 ; 	;0B2D A0	modified
	DB A0 ; 	;0B2E A0	modified

L_0b2f: ; string constant
	DW 17		;0B2F 00 11	length
	DB C9 ;I	;0B31 C9
	DB CC ;L	;0B32 CC
	DB CC ;L	;0B33 CC
	DB C5 ;E	;0B34 C5
	DB C7 ;G	;0B35 C7
	DB C1 ;A	;0B36 C1
	DB CC ;L	;0B37 CC
	DB A0 ; 	;0B38 A0
	DB D0 ;P	;0B39 D0
	DB C1 ;A	;0B3A C1
	DB D2 ;R	;0B3B D2
	DB C1 ;A	;0B3C C1
	DB CD ;M	;0B3D CD
	DB C5 ;E	;0B3E C5
	DB D4 ;T	;0B3F D4
	DB C5 ;E	;0B40 C5
	DB D2 ;R	;0B41 D2

L_0b42: ; string constant
	DW 18		;0B42 00 12	length
	DB C5 ;E	;0B44 C5
	DB D1 ;Q	;0B45 D1
	DB D5 ;U	;0B46 D5
	DB C1 ;A	;0B47 C1
	DB CC ;L	;0B48 CC
	DB C9 ;I	;0B49 C9
	DB D4 ;T	;0B4A D4
	DB D9 ;Y	;0B4B D9
	DB A0 ; 	;0B4C A0
	DB CE ;N	;0B4D CE
	DB CF ;O	;0B4E CF
	DB D4 ;T	;0B4F D4
	DB A0 ; 	;0B50 A0
	DB C6 ;F	;0B51 C6
	DB CF ;O	;0B52 CF
	DB D5 ;U	;0B53 D5
	DB CE ;N	;0B54 CE
	DB C4 ;D	;0B55 C4

L_0b56: ; string constant
	DW 15		;0B56 00 0F	length
	DB D4 ;T	;0B58 D4
	DB C1 ;A	;0B59 C1
	DB C2 ;B	;0B5A C2
	DB A0 ; 	;0B5B A0
	DB C3 ;C	;0B5C C3
	DB C8 ;H	;0B5D C8
	DB C1 ;A	;0B5E C1
	DB D2 ;R	;0B5F D2
	DB C1 ;A	;0B60 C1
	DB C3 ;C	;0B61 C3
	DB D4 ;T	;0B62 D4
	DB C5 ;E	;0B63 C5
	DB D2 ;R	;0B64 D2
	DB BD ;=	;0B65 BD
	DB AF ;/	;0B66 AF

Msg_0b67: ; string constant
	DW 4		;0B67 00 04	length
	DB D4 ;T	;0B69 D4
	DB C1 ;A	;0B6A C1
	DB C2 ;B	;0B6B C2
	DB BD ;=	;0B6C BD

TabChar: DB 00		;0B6D 00	current tab char

L_0b6e: ; tab stops?
	DW 00	;0B6E 00 00
	DW 00	;0B70 00 00
	DW 00	;0B72 00 00
	DW 00	;0B74 00 00
	DW 00	;0B76 00 00
	DW 00	;0B78 00 00
	DW 00	;0B7A 00 00
	DW 00	;0B7C 00 00
	DW 00	;0B7E 00 00
	DW 00	;0B80 00 00
	DW 00	;0B82 00 00
	DB 00	;0B84 00
	DB 00	;0B85 00
	DB 00	;0B86 00
	DB 00	;0B87 00
	DB 00	;0B88 00
	DB 00	;0B89 00
	DB 00	;0B8A 00
	DB 00	;0B8B 00
	DB 00	;0B8C 00
	DB 00	;0B8D 00
	DB 00	;0B8E 00
	DB 00	;0B8F 00
	DB 00	;0B90 00
	DB 00	;0B91 00
	DB 00	;0B92 00
	DB 00	;0B93 00
	DB 00	;0B94 00
	DB 00	;0B95 00
	DB 00	;0B96 00
	DB 00	;0B97 00
	DB 00	;0B98 00
	DB 00	;0B99 00
	DB 00	;0B9A 00
	DB 00	;0B9B 00
	DB 00	;0B9C 00
	DB 00	;0B9D 00
	DB 00	;0B9E 00
	DB 00	;0B9F 00
	DB 00	;0BA0 00
	DB 00	;0BA1 00
	DB 00	;0BA2 00
	DB 00	;0BA3 00
	DB 00	;0BA4 00
	DB 00	;0BA5 00
	DB 00	;0BA6 00
	DB 00	;0BA7 00
	DB 00	;0BA8 00
	DB 00	;0BA9 00
	DB 00	;0BAA 00
	DB 00	;0BAB 00
	DB 00	;0BAC 00
	DB 00	;0BAD 00
	DB 00	;0BAE 00
	DB 00	;0BAF 00
	DB 00	;0BB0 00
	DB 00	;0BB1 00
	DB 00	;0BB2 00
	DB 00	;0BB3 00
	DB 00	;0BB4 00
	DB 00	;0BB5 00
	DB 00	;0BB6 00
	DB 00	;0BB7 00
	DB 00	;0BB8 00
	DB 00	;0BB9 00
	DB 00	;0BBA 00
	DB 00	;0BBB 00
	DB 00	;0BBC 00
	DB 00	;0BBD 00
	DB 00	;0BBE 00
	DB 00	;0BBF 00
	DB 00	;0BC0 00
	DB 00	;0BC1 00
	DB 00	;0BC2 00
	DB 00	;0BC3 00
	DB 00	;0BC4 00
	DB 00	;0BC5 00
	DB 00	;0BC6 00
	DB 00	;0BC7 00
	DB 00	;0BC8 00
	DB 00	;0BC9 00
	DB 00	;0BCA 00
	DB 00	;0BCB 00
	DB 00	;0BCC 00
	DB 00	;0BCD 00
	DB 00	;0BCE 00
	DB 00	;0BCF 00
	DB 00	;0BD0 00
	DB 00	;0BD1 00
	DB 00	;0BD2 00
	DB 00	;0BD3 00
	DB 00	;0BD4 00
	DB 00	;0BD5 00
	DB 00	;0BD6 00
	DB 00	;0BD7 00
	DB 00	;0BD8 00
	DB 00	;0BD9 00
	DB 00	;0BDA 00
	DB 00	;0BDB 00
	DB 00	;0BDC 00
	DB 00	;0BDD 00
	DB 00	;0BDE 00
	DB 00	;0BDF 00
	DB 00	;0BE0 00
	DB 00	;0BE1 00
	DB 00	;0BE2 00
	DB 00	;0BE3 00
	DB 00	;0BE4 00
	DB 00	;0BE5 00
	DB 00	;0BE6 00
	DB 00	;0BE7 00
	DB 00	;0BE8 00
	DB 00	;0BE9 00
	DB 00	;0BEA 00
	DB 00	;0BEB 00
	DB 00	;0BEC 00
	DB 00	;0BED 00
	DB 00	;0BEE 00
	DB 00	;0BEF 00
	DB 00	;0BF0 00
	DB 00	;0BF1 00
	DB 00	;0BF2 00
	DB 00	;0BF3 00
	DB 00	;0BF4 00
	DB 00	;0BF5 00
	DB 00	;0BF6 00
	DB 00	;0BF7 00
	DB 00	;0BF8 00

KeyCmdTable: ; key command table
	DW BadParm	;0BF9 04 49 ; fixupword	'A' unused
	DW BadParm	;0BFB 04 49 ; fixupword	'B' unused
	DW L_03F0	;0BFD 03 F0 ; fixupword	'C' ?
	DW L_053D	;0BFF 05 3D ; fixupword	'D' ?
	DW L_05F5	;0C01 05 F5 ; fixupword	'E' end of file?
	DW L_0451	;0C03 04 51 ; fixupword	'F' find
	DW BadParm	;0C05 04 49 ; fixupword	'G' unused
	DW L_07DA	;0C07 07 DA ; fixupword	'H' ?
	DW L_057D	;0C09 05 7D ; fixupword	'I' ?
	DW L_0733	;0C0B 07 33 ; fixupword	'J' ?
	DW L_03F3	;0C0D 03 F3 ; fixupword	'K' ?
	DW BadParm	;0C0F 04 49 ; fixupword	'L' unused
	DW BadParm	;0C11 04 49 ; fixupword	'M' unused
	DW L_05A9	;0C13 05 A9 ; fixupword	'N'?
	DW BadParm	;0C15 04 49 ; fixupword	'O' unused
	DW L_046D	;0C17 04 6D ; fixupword	'P'?
	DW L_031E	;0C19 03 1E ; fixupword	'Q' quit
	DW L_05D1	;0C1B 05 D1 ; fixupword	'R' ?
	DW L_04A5	;0C1D 04 A5 ; fixupword	'S' substitute?
	DW L_05E0	;0C1F 05 E0 ; fixupword	'T' go back to top?
	DW L_0628	;0C21 06 28 ; fixupword	'U' display current file assignments?
	DW BadParm	;0C23 04 49 ; fixupword	'V' unused
	DW L_05BD	;0C25 05 BD ; fixupword	'W' ?
	DW L_0606	;0C27 06 06 ; fixupword	'X' exit (swap in & out files?)
	DW BadParm	;0C29 04 49 ; fixupword	'Y' unused
	DW L_05D6	;0C2B 05 D6 ; fixupword	'Z' ?

L_0c2d: ; string buffer
	DW 0			;0C2D 00 00	length
	DB 0,0,0,0,0,0,0,0	;0C2F 00 00 00 00 00 00 00 00	chars
	DB 0,0,0,0,0,0,0,0	;0C37 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C3F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C47 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C4F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C57 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C5F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C67 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C6F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C77 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C7F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C87 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C8F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C97 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0C9F 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CA7 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0		;0CAF 00 00 00 00 00

L_0cb4: ; string buffer?
	DW 0			;0CB4 00 00	length
	DB 0,0,0,0,0,0,0,0	;0CB6 00 00 00 00 00 00 00 00	DB 85(0) chars
	DB 0,0,0,0,0,0,0,0	;0CBE 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CC6 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CCE 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CD6 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CDE 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CE6 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CEE 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CF6 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0CFE 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D06 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D0E 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D16 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D1E 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D26 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D2E 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0		;0D36 00 00 00 00 00

L_0D3b: ; string
	DW 00			;0D3B 00 00	length
	DB 0,0,0,0,0,0,0,0	;0D3D 00 00 00 00 00 00 00 00	chars
	DB 0,0,0,0,0,0,0,0	;0D45 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D4D 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D55 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D5D 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D65 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D6D 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D75 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D7D 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D85 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D8D 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D95 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0D9D 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DA5 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DAD 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DB5 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0		;0DBD 00 00 00 00 00

L_0dc2: ; string buffer
	DW 0			;0DC2 00 00	length
	DB 0,0,0,0,0,0,0,0	;0DC4 00 00 00 00 00 00 00 00	chars
	DB 0,0,0,0,0,0,0,0	;0DCC 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DD4 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DDC 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DE4 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DEC 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DF4 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0DFC 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E04 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E0C 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E14 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E1C 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E24 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E2C 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E34 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0,0,0,0	;0E3C 00 00 00 00 00 00 00 00
	DB 0,0,0,0,0		;0E44 00 00 00 00 00

E_116F: ; change string to uppercase
	LDA (XW+)	;116F 95 41	get string pionter
	STX (-SW)	;1171 6D A2	save X
	XFR XW,YW	;1173 55 64	save Y
	STX (-SW)	;1175 6D A2
	LDX (AW+)	;1177 65 01	X=string length
	XAY		;1179 5C	Y=char ptr
@117A:	DCX		;117A 3F	decrement length
	BM @1190	;117B 16 13	  done?
	LDAB (YW)	;117D 8B	get char
	LDBB #'z'+$80	;117E C0 FA
	SABB		;1180 49
	BGZ @118c	;1181 18 09
	LDBB #'a'+$80	;1183 C0 E1
	SABB		;1185 49
	BM @118c	;1186 16 04
	LDAB #'A'+$80	;1188 80 C1	convert to uppercase
	ADDB AL,BL	;118A 40 31
@118C:	STAB (YW+)	;118C A5 61	store char
	JMP @117a	;118E 73 EA	next

@1190:	LDA (SW+)	;1190 95 A1	restore Y
	XAY		;1192 5C
	LDX (SW+)	;1193 65 A1	restore X
	RSR		;1195 09	return


E_1196:	JSR E_11ab	;1196 7B 13
	LDA (XW+)	;1198 95 41
	JSR E_11bf	;119A 7B 23
	DB 2		;119C 02
	RSR		;119D 09


E_119E: ; string something???
	LDAB #$af	;119E 80 AF
	BP @11a4	;11A0 17 02
	JSR E_11b2	;11A2 7B 0E
@11A4:	LDA (XW+)	;11A4 95 41		get inline string ptr
	JSR E_11bf	;11A6 7B 17
	DB 1		;11A8 01
	JMP L_11f4	;11A9 73 49

E_11AB:	LDAB #$8d	;11AB 80 8D
	LDBB L_11da	;11AD C3 2B
	SABB		;11AF 49
	BZ L_11ba	;11B0 14 08
E_11B2:	STAB L_11bd	;11B2 A3 09
	LDA #L_11bb	;11B4 90 11 BB ; fixupword
	JSR E_11bf	;11B7 7B 06
	DB 2		;11B9 02
L_11BA:	RSR		;11BA 09

L_11bb:	DW 1		;11BB 00 01
L_11bd:	DB 0		;11BD 00
	DB 0		;11BE 00


E_11BF:
	STA L_11e2	;11BF B3 21		save length?
	LDAB (XW+)	;11C1 85 41		get inline function?
	STAB L_11df	;11C3 A3 1A
@11C5:	LDB #L_11dc	;11C5 D0 11 DC ; fixupword  point at FCB
	SVC $10		;11C8 66 10		I/O?
@11CA:	SVC $07		;11CA 66 07		Yield
	LDAB L_11dc	;11CC 83 0E		complete yet?
	BM @11ca	;11CE 16 FA
	LDB @11c5+1	;11D0 D3 F4		point at FCB
	SVC $5c		;11D2 66 5C		???
	DB 1		;11D4 01
	DB 1		;11D5 01
	DW ???		;11D6 12 11 ; fixupword
	LDB (XW)	;11D8 DA
	LDAB #0		;11D9 80 00
	RSR		;11DB 09

L_11dc: ; short file control block?
	DB 0	;11DC 00	status
	DB $81	;11DD 81
	DB 0	;11DE 00
L_11df:	DB 0	;11DF 00	function
L_11e0:	DW 132	;11E0 00 84
L_11e2	DW 0	;11E2 00 00
	DB 0	;11E4 00
	DB 0	;11E5 00

E_11E6:
	LDA #L_11bb	;11E6 90 11 BB ; fixupword
	LDB (AW)	;11E9 D8
	STB L_11e0	;11EA F3 F4
	JSR E_11bf	;11EC 7B D1
	DB 1		;11EE 01
	LDA #132	;11EF 90 00 84
	STA L_11e0	;11F2 B3 EC
L_11F4:	LDAB L_11da	;11F4 83 E4
	LDBB #$8a	;11F6 C0 8A
	BZ L_1203	;11F8 14 09
	SABB		;11FA 49
	BNZ L_1203	;11FB 15 06
L_11fd:	LDA #0		;11FD 90 00 00 modified
	BZ L_1203	;1200 14 01
	XAX		;1202 5B
L_1203:	LDAB L_11bd	;1203 83 B8
	RSR		;1205 09


E_1206: ; movc5 B,(inline1),#' ',A,(inline2) ?
	STK YH,2	;1206 7E 61		save Y
	XFR YW,0(XW)?	;1208 55 57 00 00	get 1st inline ptr
	INR XW,2	;120C 30 41
	DCA		;120E 39		>0 ?
	BP @1215	;120F 17 04
	INR XW,2	;1211 30 41		skip 2nd inline ptr
	JMP @1228	;1213 73 13		exit

@1215:	FIL A,#$a0,(Y)	;1215 67 9E A0 06	blank chars
	INA		;1219 38
	SAB		;121A 59
	BLE @1220	;121B 19 03
	SAB		;121D 59
	XFR AW,BW	;121E 55 20
@1220:	LDB (XW+)	;1220 D5 41		get 2nd inline ptr
	DCA		;1222 39
	BM @1228	;1223 16 03
	MVF? A,(B),(Y)	;1225 67 4A 26
@1228:	POP #YH,2	;1228 7F 61		restore Y
	RSR		;122a 09		return


E_122b:	LDA (XW+)	;122b 95 41
	STX (??)	;122D 6D A2
	??		;122F B5 A2
	LDX (AW+)	;1231 65 01
	BLE @1243	;1233 19 0E
	ADD AW,XW	;1235 50 40
	LDB #$a0a0	;1237 D0 A0 A0
@123A:	LDBB (-AW)	;123A C5 02
	SUBB BL,BH	;123C 41 23
	BNZ @1243	;123E 15 03
	DCX		;1240 3F
	BGZ @123a	;1241 18 F7
@1243:	LDA (SW+)	;1243 95 A1
	STX (AW)	;1245 6D 00
	LDX (SW+)	;1247 65 A1
	RSR		;1249 09


E_124A: ; convert string to lowercase??
	LDA (XW+)	;124A 95 41	get inline string ptr
	STX (-SW)	;124C 6D A2	save X
	XFR XW,YW	;124E 55 64	save Y
	STX (-SW)	;1250 6D A2
	LDX (AW+)	;1252 65 01	X = string length
	XAY		;1254 5C	Y = string chars pointer
@1255:	DCX		;1255 3F
	BM @126b	;1256 16 13
	LDAB (YW)	;1258 8B
	LDBB #'A'+$80	;1259 C0 C1
	SABB		;125B 49
	BM @1267	;125C 16 09
	LDBB #'Z'+$80	;125E C0 DA
	SABB		;1260 49
	BGZ @1267	;1261 18 04
	LDBB #$20	;1263 C0 20	cvt to ASCII lowercase
	ORIB AL,BL	;1265 43 31
@1267:	STAB (YW+)	;1267 A5 61
	JMP @1255	;1269 73 EA

@126B:	LDA (SW+)	;126B 95 A1	restore Y
	XAY		;126D 5C
	LDX (SW+)	;126E 65 A1	restore X
	RSR		;1270 09	return

