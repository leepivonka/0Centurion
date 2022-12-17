; loaded at $200

	DS $190  ; lots of empty space
TORS: ; top of return stack

L_0390:	DB 00	;0390
	DB 00	;0391
	DB 03	;0392
	DB 00	;0393

	DB 01	;0394
	DB 90	;0395
	DW L_0D5c	;0396 ; fixupword

	DB 00	;0398
	DB 00	;0399
	DB 00	;039A
	DB 01	;039B
	DB 02	;039C
	DB 02	;039D
	DB 00	;039E
	DB 84	;039F
	DW L_0AAF	;03A0 ; fixupword

	DB 00	;03A2
	DB 00	;03A3
	DB 00	;03A4
	DB 00	;03A5
	DB 00	;03A6
	DB 00	;03A7
	DB 00	;03A8
	DB 00	;03A9
	DB 00	;03AA
	DB 00	;03AB
	DB 00	;03AC
	DB 00	;03AD
	DB 00	;03AE
	DB 01	;03AF
	DB 03	;03B0
	DB 00	;03B1
	DB 01	;03B2
	DB 90	;03B3
	DW L_0EEF	;03B4 ; fixupword

	DB 00	;03B6
	DB 00	;03B7
	DB 00	;03B8
	DB 01	;03B9
	DB 02	;03BA
	DB 02	;03BB
	DB 00	;03BC
	DB 84	;03BD
	DW L_0AAF	;03BE ; fixupword

	DB 00	;03C0
	DB 00	;03C1
	DB 00	;03C2
	DB 00	;03C3
	DB 00	;03C4
	DB 00	;03C5
	DB 00	;03C6
	DB 00	;03C7
	DB 00	;03C8
	DB 00	;03C9
	DB 00	;03CA
	DB 00	;03CB
	DB 00	;03CC
	DB 02	;03CD
	DB 01	;03CE
	DB 00	;03CF
	DB 01	;03D0
	DB 90	;03D1
	DW L_1215	;03D2 ; fixupword
	DB 00	;03D4
	DB 00	;03D5
	DB 00	;03D6
	DB 01	;03D7
	DB 02	;03D8
	DB 02	;03D9
	DB 00	;03DA
	DB 84	;03DB
	DW L_0AAF	;03DC ; fixupword

	DB 00	;03DE
	DB 00	;03DF
	DB 00	;03E0
	DB 00	;03E1
	DB 00	;03E2
	DB 00	;03E3
	DB 00	;03E4
	DB 00	;03E5
	DB 00	;03E6
	DB 00	;03E7
	DB 00	;03E8
	DB 00	;03E9

L_03ea:	DB 00	;03EA
	DB 03	;03EB
	DB 01	;03EC
	DB 00	;03ED
	DB 01	;03EE
	DB 90	;03EF
	DW L_1082	;03F0 ; fixupword

	DB 00	;03F2
	DB 00	;03F3
	DB 00	;03F4
	DB 01	;03F5
	DB 02	;03F6
	DB 02	;03F7
	DB 00	;03F8
	DB 84	;03F9
	DW L_0AAF	;03FA ; fixupword

	DB 00	;03FC
	DB 00	;03FD
	DB 00	;03FE
	DB 00	;03FF
	DB 00	;0400
	DB 00	;0401
	DB 00	;0402
	DB 00	;0403
	DB 00	;0404
	DB 00	;0405
	DB 00	;0406
	DB 00	;0407

L_0408:	DB 00	;0408
	DB 04	;0409
	DB 02	;040A
	DB 00	;040B
	DB 00	;040C
	DB 00	;040D
	DW 0	;040E 00 00

	DB 00	;0410
	DB 00	;0411
	DB 00	;0412
	DB 00	;0413
	DB 01	;0414
	DB 02	;0415
	DB 00	;0416
	DB 84	;0417
	DW L_0C44	;0418 ; fixupword
	DB 00	;041A
	DB 00	;041B
	DB 00	;041C
	DB 00	;041D
	DB 00	;041E
	DB 00	;041F
	DB 00	;0420
	DB 00	;0421
	DB 00	;0422
	DB 00	;0423
	DB 00	;0424
	DB 00	;0425


E_0426: ; Main entry point
	LDA #L_0390	;0426 90 03 90 ; fixupword	init return stack
	XAS		;0429 5F
	LDA #E_0464	;042A 90 04 64 ; fixupword
	STA L_2496+1	;042D B1 24 97 ; fixupword	init a defer
	JSR E_242f	;0430 79 24 2F ; fixupword	say hello
	DW L_093B	;0433 09 3B
	JSR E_0442	;0435 7b 0B
	DW L_0390	;0437 03 90 ; fixupword
	STA ???		;0439 B3 3A
	JSR E_0442	;043B 7B 05
	DW L_03ae	;043D 03 ae ; fixupword
	JMP L_0783	;043F 71 07 83 ; fixupword

E_0442: ; ???
	LDB (XW)	;0442 DA
	LDA 06(BW)	;0443 95 28 06
	BZ @0452	;0446 14 0A
	STB @044d	;0448 F3 03
	SVC $05		;044A 66 05
	DB $c		;044C 0C
@044d:	DW 0		;044D 00 00
	STA #0000	;044F B0 00 00
@0452:	STA (-SW)	;0452 B5 A2
	STB (-SW)	;0454 F5 A2
	LDB (XW+)	;0456 D5 41
	LDAB #09	;0458 80 09
	STAB 3(BW)	;045A A5 28 03
	SVC $18		;045D 66 18
	LDB (SW+)	;045F D5 A1
	LDA (SW+)	;0461 95 A1
	RSR		;0463 09

E_0464: ; key command loop?
	LDA #L_0390	;0464 90 03 90 ; fixupword	reinit return stack ptr
	XAS		;0467 5F
	JSR E_04ac	;0468 7B 42		get an alpha key?
	SLR BW,1	;046A 35 20		jmp table dispatch
	LDA #L_0a7b	;046C 90 0A 7B ; fixupword
	AAB		;046F 58
	JMP @(BW)	;0470 75 24

L_0472:	SVC $0b		;0472 66 0B
	STA #0		;0474 B0 00 00
	RSR		;0477 09


Key_Q: ; quit
	LDA L_0a03	;0478 91 0A 03 ; fixupword	any records written?
	BZ @048a	;047B 14 0D
	JSR E_242f	;047D 79 24 2F ; fixupword
	DW L_09D8	;0480 09 D8 ; fixupword		type "QUIT? (Y OR N)"
	JSR E_049E	;0482 79 04 9E ; fixupword	get boolean key
	BNZ @048A	;0485 15 03
	JMP E_0464 	;0487 71 04 64 ; fixupword	next key

@048A:	JSR E_242f	;048A 79 24 2F ; fixupword
	DW L_09AD	;048D 09 AD ; fixupword		type "END KOMPOZ"
	JSR E_2444	;048F 79 24 44 ; fixupword
	CLA		;0492 3A
	LDAB L_049d	;0493 83 08
	LDB L_1A83	;0495 D1 1A 83 ; fixupword
	AAB		;0498 58
	STBB L_049d	;0499 E3 02
	SVC $$0a	;049b 66 0A			exit the program with inline code
L_049d:	DB 0		;049d 00	variable


E_049E: ; get a boolean key???
	JSR E_04ac	;049E 7B 0C	get an alpha key
	LDBB #'N'+$80	;04A0 C0 CE
	SABB		;04A2 49
	BZ @04ab	;04A3 14 06
	LDBB #'Y'+$80	;04A5 C0 D9
	SABB		;04A7 49
	BNZ E_049E	;04A8 15 F4
	XAB		;04AA 5D
@04AB:	RSR		;04AB 09	return Value flag


E_04AC: ; get an uppercase alpha key???
@04ac:	JSR E_2444	;04AC 79 24 44 ; fixupword
	LDAB #ad	;04AF 80 AD
	JSR E_244b	;04B1 79 24 4B ; fixupword
	JSR E_247f	;04B4 79 24 7F ; fixupword
	LDBB #df	;04B7 C0 DF			convert ASCII to uppercase
	ANDB AL,BL	;04B9 42 31
	LDBB #'Z'+$80	;04BB C0 DA			must be A..Z
	SABB		;04BD 49
	BGZ @04ac	;04BE 18 EC
	LDB #'A'+$80	;04C0 D0 00 C1
	SABB		;04C3 49
	BM @04ac	;04C4 16 E6
	RSR		;04C6 09			return in key in A, index from 'A' in B

L_04C7:	LDA #L_0aaf	;04C7 90 0A AF ; fixupword
	XAY		;04CA 5C
	LDB (YW+)	;04CB D5 61
L_04CD:	LDA (XW+)	;04CD 95 41
	XAZ		;04CF 5E
	STX (-SW)	;04D0 6D A2
	LDA (ZW+)	;04D2 95 81
	BZ L_0511	;04D4 14 3B
	STA 04f1	;04D6 B3 19
	SUB AW,BW	;04D8 51 20
	BM L_0511	;04DA 16 35
	XAX		;04DC 5B
L_04DD:	LDAB (YW)	;04DD 8B
	LDBB (ZW)	;04DE CC
	OREB BL,AL	;04DF 44 13
	LDAB #df	;04E1 80 DF		mask ASCII case
	NABB		;04E3 4A
	BNZ L_050c	;04E4 15 26
	XFR AW,YW	;04E6 55 60
	STA L_0502	;04E8 B3 18
	XFR AW,ZW	;04EA 55 80
	STA L_0506	;04EC B3 18
	STX L_050a	;04EE 6B 1A
	LDX #0000	;04F0 60 00 00
L_04F3:	DCX		;04F3 3F
	BM L_0515	;04F4 16 1F
	LDAB (YW+)	;04F6 85 61
	LDBB (ZW+)	;04F8 C5 81
	OREB BL,AL	;04FA 44 13
	LDAB #df	;04FC 80 DF
	NABB		;04FE 4A
	BZ L_04f3	;04FF 14 F2
	LDA #0000	;0501 90 00 00
	XAY		;0504 5C
	LDA #0000	;0505 90 00 00
	XAZ		;0508 5E
	LDX #0000	;0509 60 00 00
L_050C:	INR YW,1	;050C 30 60
	DCX		;050E 3F
	BP L_04dd	;050F 17 CC
L_0511:	LDX (SW+)	;0511 65 A1
	CLA		;0513 3A
	RSR		;0514 09

L_0515:	LDA L_0502	;0515 93 EB
	LDX (SW+)	;0517 65 A1
	RSR		;0519 09

L_051A:	LDA (SW)	;051A 9D
	XAZ		;051B 5E
	ADD AW,BW	;051C 50 20
	XAY		;051E 5C
	LDB #L_0ab1	;051F D0 0A B1 ; fixupword
	SUB BW,YW	;0522 51 62
	LDA L_0aaf	;0524 91 0A AF ; fixupword
	SAB		;0527 59
	JSR E_0533	;0528 7B 09
	LDA #L_0ab1	;052A 90 0A B1 ; fixupword
	SUB AW,ZW	;052D 51 80
	STA L_0aaf	;052F B1 0A AF ; fixupword
	RSR		;0532 09

L_0533:	DCR BW,1	;0533 31 20
	BM @053d	;0535 16 06
	LDAB (YW+)	;0537 85 61
	STAB (ZW+)	;0539 A5 81
	JMP L_0533	;053B 73 F6

@053D:	RSR		;053D 09

L_053E:	LDB #L_0aaf	;053E D0 0A AF ; fixupword
	LDA (BW+)	;0541 95 21
	AAB		;0543 58
	XFR ZW,BW	;0544 55 28
	LDB L_0b36	;0546 D1 0B 36 ; fixupword
	ADD AW,BW	;0549 50 20
	STA L_0aaf	;054B B1 0A AF ; fixupword
	ADD BW,ZW	;054E 50 82
L_0550:	LDA (SW)	;0550 9D
	SUB AW,ZW	;0551 51 80
	BZ L_055b	;0553 14 06
	LDAB (-ZW)	;0555 85 82
	STAB (-BW)	;0557 A5 22
	JMP L_0550	;0559 73 F5

L_055B:	LDA #L_0b36	;055B 90 0B 36 ; fixupword
	LDB (AW+)	;055E D5 01
	XAY		;0560 5C
	JSR E_0533	;0561 7B D0
	RSR		;0563 09

E_0564: ; Key C
	CLA		;0564 3A
	JMP L_056c	;0565 73 05

E_0567: ; Key K
	JSR E_0472	;0567 79 04 72 ; fixupword
	LDAB #'K'+$80	;056A 80 CB
L_056C:	STAB L_0586	;056C A3 18
	CLA		;056E 3A
	STAB #00	;056F A0 00
	INA		;0571 38
	STAB #00	;0572 A0 00
	JSR E_2437	;0574 79 24 37 ; fixupword
	DW L_0c44	;0577 0C 44 ; fixupword
	JSR E_2408	;0579 79 24 08 ; fixupword
	DW L_0c44	;057C 0C 44 ; fixupword
	??? ???		;057e 83 f3
	BZ @0585	;0580 14 03
	JSR E_0850	;0582 79 08 50 ; fixupword
@0585:	LDAB #00	;0585 80 00
	BZ @0590	;0587 14 07
	JSR E_2437	;0589 79 24 37 ; fixupword
	DW L_0aaf	;058C 0A AF ; fixupword
	JMP L_05a2	;058E 73 12

@0590:	JSR E_0805	;0590 79 08 05 ; fixupword
	BNL L_059c	;0593 11 07
	JSR E_242f	;0595 79 24 2F ; fixupword
	DW L_0976	;0598 09 76 ; fixupword
	JMP  ??		;059A 73 1c

L_059C:	LDAB L_0570	;059C 83 D2
	BZ L_05a2	;059E 14 02
	JSR E_05f9	;05A0 7B 57
L_05A2:	JSR E_04c7	;05A2 79 04 C7 ; fixupword
	DW L_0c44	;05A5 0C 44 ; fixupword
	BZ ???		;05A7 14 D5
	??? ???		;05A9 83 C5
	BNZ ???		;05AA 15 0B
	LDAB L_0586	;05AD 83 D7
	BNZ L_05b8	;05AF 15 07
	JMP L_05e7	;05B1 73 34


BadParam: ; bad parameter, quit
	JSR E_242f	;05B3 79 24 2F ; fixupword
	DW L_0A54	;05B6 0A 54 ; fixupword		type "ILLEGAL PARAMETER"
	JMP E_0464	;05B8 71 04 64 ; fixupword


Key_F: ; Find
	JSR E_242F	;05Bb 79 24 2f ; fixupword
	DW L_09B9	;05BE 09 B9 ; fixupword		type "FIND? (Y OR N)"
	JSR E_049E	;05C0 79 04 9E; fixupword	get boolean key
	BZ @05d5	;05C3 14 10
	JSR E_0472	;05C5 79 04 72 ; fixupword
	JSR E_0850	;05C8 79 08 50 ; fixupword
	CLA		;05CB 3A
	??? L_0573	;05CC A1 05 73 ; fixupword
	??? ???		;05CF A3 9F
	??? ???		;05D1 A3 B3
	JMP ???		;05D3 73 9F

@05d5:	JMP E_0464	;05D5 71 04 64 ; fixupword


E_05D8: ; Key P
	JSR E_2437	;05D8 79 24 37 ; fixupword
	DW L_0c44	;05DB 0C 44 ; fixupword
	JSR E_2408	;05Dd  79 24 08 ; fixupword
	DW L_0c44	;05E0 0C 44 ; fixupword
	??? L_0c44	;05E2 91 0C 44 ; fixupword
	BNZ L_05ec	;05E5 15 05
L_05E7:	JSR E_05f9	;05E7 7B 10
	JMP E_0464	;05E9 71 04 64 ; fixupword

E_05EC:	CLA		;05EC 3A
	STAB L_0586	;05ED A3 97
	INA		;05EF 38
	STAB L_0573	;05F0 A1 05 73 ; fixupword
	STAB L_0570	;05F3 A1 05 70 ; fixupword
	JMP L_057e	;05F6 71 05 7E ; fixupword


L_05F9:	JSR E_242f	;05F9 79 24 2F ; fixupword
	DW L_0AAF 	;05FC 0A AF ; fixupword
	RSR		;05FE 09

L_05FF:	LDAB #00	;05FF 80 00
	BNZ @0605	;0601 15 02
	INAB		;0603 28
	RSR		;0604 09

@0605:	JSR E_05f9	;0605 7B F2
	JSR E_242f	;0607 79 24 2F ; fixupword
	DW L_0A22 	;060A 0A 22 ; fixupword
	JSR E_049E	;060c 79 04 9E ; fixupword	get boolean key
	RSR		;060F 09

E_0610: ; Key S
	JSR E_0472	;0610 79 04 72 ; fixupword
	JSR E_2437	;0613 79 24 37 ; fixupword
	DW L_0B36	;0616 0B 36 ; fixupword
	JSR E_2437	;0618 79 24 37 ; fixupword
	DW L_0BBD	;061B 0B BD ; fixupword
	JSR E_2408	;061D 79 24 08 ; fixupword
	DW L_0BBD	;0620 0B BD ; fixupword
	LDA L_0bbd	;0622 91 0B BD ; fixupword
	BZ BadParam	;0625 14 8C
	JSR E_2437	;0627 79 24 37 ; fixupword
	DW L_0C44	;062A 0C 44 ; fixupword
	JSR E_2408	;062c 79 24 08 ; fixupword
	DW L_0C44	;062F 0C 44 ; fixupword
	CLA		;0631 3A
	STA 0653	;0632 B3 1F
	JSR E_242f	;0634 79 24 2F ; fixupword
	DW L_0A1B	;0637 0A 1B ; fixupword
	JSR E_049E	;0639 79 04 9E ; fixupword	get boolean key
	STBB 0600	;063C E3 C2
	JSR E_0850	;063E 79 08 50 ; fixupword
	JSR E_0805	;0641 79 08 05 ; fixupword
	BL L_0689	;0644 10 43
	JSR E_04c7	;0646 79 04 C7 ; fixupword
	DW L_0BBD	;0649 0B BD ; fixupword
	STA (SW)	;064A 
	BZ L_0682	;064B 14 35
	XAX		;064D 5B
L_064E:	JSR E_05ff	;064E 7B AF
	BZ L_066b	;0650 14 19
	LDA #0000	;0652 90 00 00
	INA		;0655 38
	STA 0653	;0656 B3 FB
	LDB L_0bbd	;0658 D1 0B BD ; fixupword
	JSR E_051a	;065B 79 05 1A ; fixupword
	LDB L_0b36	;065E D1 0B 36 ; fixupword
	BZ L_066b	;0661 14 08
	JSR E_053e	;0663 79 05 3E ; fixupword
	LDA L_0b36	;0666 91 0B 36 ; fixupword
	JMP L_066e	;0669 73 03

L_066B:	LDA L_0bbd	;066B 91 0B BD ; fixupword
L_066E:	XAY		;066E 5C
	ADD YW,XW	;066F 50 46
	LDB #L_0ab1	;0671 D0 0A B1 ; fixupword
	SUB BW,YW	;0674 51 62
	LDA L_0aaf	;0676 91 0A AF ; fixupword
	SAB		;0679 59
	JSR E_04cd	;067A 79 04 CD ; fixupword
	DW L_0BBD	;067D 0B BD ; fixupword
	XAX		;067F 5B
	BNZ L_064e	;0680 15 CC
L_0682:	JSR E_04c7	;0682 79 04 C7 ; fixupword
	DW L_0c44	;0685 0C 44 ; fixupword
	BZ ???		;0687 14 B5
	??? #$a0a0	;0689 90 A0 A0
	STA L_0a16+0	;068C B1 0A 16 ; fixupword
	STA L_0a16+2	;068F B1 0A 18 ; fixupword
	LDA L_0653	;0692 93 BF
	SVC $2e		;0694 66 2E			insert number as ASCII
	DW L_0a16+4	;0696 0A 1A ; fixupword
	JSR E_242f	;0698 79 24 2F ; fixupword
	DW L_0a05	;069B 0A 05 ; fixupword
	JSR E_05f9	;069D 79 05 F9 ; fixupword
L_06A0:	JMP E_0464	;06A0 71 04 64 ; fixupword

E_06A3: ; Key D
	JSR E_0472	;06A3 79 04 72 ; fixupword
	JSR E_2437	;06A6 79 24 37 ; fixupword
	DW L_0B36	;06A9 0B 36 ; fixupword
	JSR E_2408	;06Ab 79 24 08 ; fixupword
	DW L_0B36	;06AE 0B 36 ; fixupword
	??? L_0B36	;06b0 91 0B 36 ; fixupword
	BNZ L_06BC	;06B3 15 07
	JSR E_2437	;06B5 79 24 37 ; fixupword
	DW L_0AAF	;06B8 0A AF ; fixupword
	JMP 06a0	;06BA 73 E4

L_06BC:	JSR 04c7	;06BC 79 04 C7 ; fixupword
	DW L_0B36	;06BF 0B 36 ; fixupword
	BZ ???		;06C1 14 3B
	XAX		;06C3 5B
	LDB L_0b36	;06C4 D1 0B 36 ; fixupword
	JSR E_051a	;06C7 79 05 1A ; fixupword
	JSR E_2437	;06CA 79 24 37 ; fixupword
	DW L_0B36	;06CD 0B 36 ; fixupword
	??? L_0B36	;06Cf 91 0B 36 ; fixupword
	BZ ???		;06D1 14 CC
	JSR E_053e	;06D4 79 05 3E ; fixupword
	JMP L_06a0	;06D7 73 C7

E_06D9: ; Key I
	JSR 0472	;06D9 79 04 72 ; fixupword
	JSR 2437	;06DC 79 24 37 ; fixupword
	DW L_0B36	;06DF 0B 36 ; fixupword
	JSR E_2408	;06E1 79 24 08 ; fixupword
	DW L_0B36	;06E4 0B 36 ; fixupword
	??? L_0B36	;06E6 91 0B 36 ; fixupword
	BNZ ???		;06E9 15 09

E_06EB:	LDX #0aaf	;06EB 60 0A AF ; fixupword
	LDA (XW+)	;06EE 95 41
	ADD XW,AW	;06F0 50 04
	JMP 06ca	;06F2 73 D6

E_06F4:	JSR E_04c7	;06F4 79 04 C7 ; fixupword
	DW L_0B36	;06F7 0B 36 ; fixupword
	BZ L_06FE	;06F9 14 03
	XAX		;06FB 5B
	JMP L_06ca	;06FC 73 CC

E_06FE:	JSR E_242f	;06FE 79 24 2F ; fixupword
	DW L_0A67	;0701 0A 67 ; fixupword
	JMP L_0739	;0703 73 34

E_0705: ; Key N
	JSR E_0850	;0705 79 08 50 ; fixupword
	JSR E_0805	;0708 79 08 05 ; fixupword
	BNL L_0714	;070B 11 07
	JSR E_242f	;070D 79 24 2F ; fixupword
	DW L_0976	;0710 09 76 ; fixupword

L_0712:	JMP L_0739	;0712 73 25

L_0714:	JSR E_05f9	;0714 79 05 F9 ; fixupword
	JMP L_0739	;0717 73 20

E_0719: ; Key W
	JSR E_0472	;0719 79 04 72 ; fixupword
	LDA L_0aaf	;071C 91 0A AF ; fixupword
	STA L_0b36	;071F B1 0B 36 ; fixupword
	JSR E_0850	;0722 79 08 50 ; fixupword
	LDA L_0b36	;0725 91 0B 36 ; fixupword
	STA L_0aaf	;0728 B1 0A AF ; fixupword
	JMP L_0739	;072B 73 0C

E_072D: ; Key R
	JSR E_0850	;072D 79 08 50 ; fixupword
	JMP L_0739	;0730 73 07

E_0732: ; Key Z
	JSR E_0472	;0732 79 04 72 ; fixupword
	CLA		;0735 3A
	STA L_0aaf	;0736 B1 0A AF ; fixupword
L_0739:	JMP E_0464	;0739 71 04 64 ; fixupword

E_073C: ; Key T
	JSR E_242f	;073C 79 24 2F ; fixupword
	DW L_09C9	;073F 09 C9 ; fixupword
	JSR E_049E	;0741 79 04 9E ; fixupword	get boolean key
	BZ?? ???	;0744 14 08
	JSR E_0472	;0746 79 04 72	; fixupword

	JSR E_07E7	;0749 79 07 E7 ; fixupword
	JMP ???		;074C 73 EB

	JMP E_0464 	;074E 71 04 64 ; fixupword

E_0751: ; Key E
	JSR E_242f	;0751 79 24 2F ; fixupword
	DW L_09E8	;0754 09 E8 ; fixupword
	JSR E_049E 	;0756 79 04 9E ; fixupword	get boolean key
	BZ?? ???	;0759 14 F3
	JSR E_0472	;075B 79 04 72 ; fixupword
	JSR ??? 	;075E 7B 40
	JMP ???		;0760 73 D7

E_0762: ; Key X
	JSR E_0850	;0762 79 08 50 ; fixupword
	JSR E_0805	;0765 79 08 05 ; fixupword
	BNL E_0762	;0768 11 F8
	JSR E_07e7	;076A 79 07 E7 ; fixupword
	JSR E_07a0	;076D 7B 31
L_076f:	LDA #L_0390	;076F 90 03 90 ; fixupword  modified
	LDB L_07d6	;0772 D3 62
	STB L_076f+1	;0774 F3 FA
	STA L_07d6	;0776 B3 5E
	LDAB L_049d	;0778 81 04 9D ; fixupword
	RRRB AL,1	;077B 26 10
	CL		;077D 08
	RLRB AL,1	;077E 27 10
	STAB L_049d	;0780 A1 04 9D ; fixupword

E_0783: ; Key U
	LDB L_076f+1	;0783 D3 EB
	LDAB 1(BW)	;0785 85 28 01
	LDBB #'0'+$80	;0788 C0 B0
	AABB		;078A 48
	STBB L_098e	;078B E1 09 8E ; fixupword
	LDB L_07d6	;078E D3 46
	LDAB 1(BW)	;0790 85 28 01
	LDBB #'0'+$80	;0793 C0 B0
	AABB		;0795 48
	STBB L_099a	;0796 E1 09 9A ; fixupword
	JSR E_242f	;0799 79 24 2F ; fixupword
	DW L_0984	;079C 09 84 ; fixupword		type "IN=SYS00X, OUT=SYS00X"
	JMP L_0739	;079E 73 99			next key


E_07A0:	LDA #a0a0	;07A0 90 A0 A0			blank out number space
	STA L_0a4f+0	;07A3 B1 0A 4F ; fixupword
	STA L_0a4f+2	;07A6 B1 0A 51 ; fixupword
	LDA L_0a03	;07A9 91 0A 03 ; fixupword
	SVC $2e		;07AC 66 2E			insert records written counter as ASCII
	DW L_0a4f+4	;07AE 0A 53 ; fixupword
	JSR E_242f	;07b0 79 24 2F ; fixupword	type "RECORDS WRITTEN =     "
	DW L_0a3c	;07B3 0A 3C ; fixupword
	LDB L_07d6	;07B5 D3 1F
	LDAB (BW)	;07B7 89
	BNZ L_07d8	;07B8 15 1E
	LDA #0002	;07BA 90 00 02
	STA L_0aaf	;07BD B1 0A AF ; fixupword
	LDA #848d	;07C0 90 84 8D
	STA L_0ab1	;07C3 B1 0A B1 ; fixupword
	JSR E_083d	;07C6 79 08 3D ; fixupword
	DB 2		;07C9 02
	LDB L_07d6	;07CA D3 0A
	JSR E_083d	;07CC 79 08 3D ; fixupword
	DB 11		;07CF 0B
	LDA L_0475	;07D0 91 04 75 ; fixupword
	SVC $05		;07D3 66 05
	DB $d		;07D5 0D
L_07d6:	DW L_03ae	;07D6 03 AE ; fixupword	modified
L_07D8:	CLA		;07D8 3A			zero records written counter
	STA L_0a03	;07D9 B1 0A 03 ; fixupword
	LDB L_07d6	;07DC D1 07 D6 ; fixupword
L_07DF:	JSR E_083d	;07DF 7B 5C
	DB 4		;07E1 04
	CLA		;07E2 3A
	STA L_0aaf	;07E3 B1 0A AF ; fixupword
	RSR		;07E6 09


L_07E7:	LDA #a0a0	;07E7 90 A0 A0			blank out number
	STA L_0a37+0	;07EA B1 0A 37 ; fixupword
	STA L_0a37+2	;07ED B1 0A 39 ; fixupword
	LDA L_0a01	;07F0 91 0A 01 ; fixupword
	SVC $2e		;07F3 66 2E			insert record read counter as ASCII
	DW L_0A3B	;07F5 0A 3B ; fixupword
	JSR E_242f	;07F7 79 24 2F ; fixupword
	DW L_0A27	;07FA 0A 27 ; fixupword		type "RECORDS READ =     "
	CLA		;07fc 3A			zero record read counter
	STA L_0a01	;07FD B1 0A 01 ; fixupword
	LDB L_0770	;0800 D1 07 70 ; fixupword
	JMP L_07df	;0803 73 DA

L_0805:	LDB 0770	;0805 D1 07 70 ; fixupword
	LDAB (BW)	;0808 89
	BNZ 082c	;0809 15 21
	JSR E_083d	;080B 7B 30
	DB 1		;080D 01
	BNZ 082c	;080E 15 1C
	JSR 24c4	;0810 79 24 C4 ; fixupword
	DB $A		;0813 0A ; fixupword
	STAB (PW)	;0814 AF
	LDA 0aaf	;0815 91 0A AF ; fixupword
	BNZ 0823	;0818 15 09
	INA		;081A 38
	STA 0aaf	;081B B1 0A AF ; fixupword
	LDAB #a0	;081E 80 A0
	STAB 0ab1	;0820 A1 0A B1 ; fixupword
L_0823:	LDA 0a01	;0823 91 0A 01 ; fixupword		increment record read counter
	INA		;0826 38
	STA 0a01	;0827 B1 0A 01 ; fixupword
	RL		;082A 07
	RSR		;082B 09

L_082C:	DCAB		;082C 29
	BNZ L_0831	;082D 15 02
L_082F:	SL		;082F 06
	RSR		;0830 09

L_0831:	LDAB #00	;0831 80 00
L_0833:	BZ L_082f	;0833 14 FA  ; modified
	JSR E_242f	;0835 79 24 2F ; fixupword
	DW L_094A	;0838 09 4A ; fixupword		type "ERR ON INPUT"
	JMP E_0464	;083A 71 04 64 ; fixupword

L_083D:	STB (-SW)	;083D F5 A2		save B
	LDAB (XW+)	;083F 85 41		get inline byte
	STAB 03(BW)	;0841 A5 28 03
	SVC $18		;0844 66 18
@0846:	SVC $07		;0846 66 07
	LDB (SW)	;0848 DD
	LDAB (BW)	;0849 89
	BM @0846	;084A 16 FA
	LDB (SW+)	;084C D5 A1		restore B
	XABB		;084E 4D
	RSR		;084F 09

L_0850:	LDB #L_0aaf	;0850 D0 0A AF ; fixupword
	LDA (BW)	;0853 99
	BLE @0870	;0854 19 1A
	INA		;0856 38
	STA (BW+)	;0857 B5 21
	AAB		;0859 58
	LDAB #8d	;085A 80 8D
	STAB (-BW)	;085C A5 22
	LDB L_07d6	;085E D1 07 D6 ; fixupword
	LDAB (BW)	;0861 89
	BNZ 0875	;0862 15 11
	JSR E_083d	;0864 7B D7
	DB 2		;0866 02
	BNZ 0875	;0867 15 0C
	LDA 0a03	;0869 91 0A 03 ; fixupword	increment records written counter
	INA		;086C 38
	STA 0a03	;086D B1 0A 03 ; fixupword
@0870:	CLA		;0870 3A
	STA 0aaf	;0871 B1 0A AF ; fixupword
	RSR		;0874 09

L_0875:	DCRB AL,2	;0875 21 11
	BZ @0880	;0877 14 07
	JSR E_242f	;0879 79 24 2F ; fixupword
	DW L_0958	;087C 09 58 ; fixupword		type "ERR ON OUTPUT"
	JMP L_0885	;087E 73 05			next key

@0880:	JSR E_242f	;0880 79 24 2F ; fixupword
	DW L_0967	;0883 09 67 ; fixupword		type "EOM ON OUTPUT"
L_0885:	JMP E_0464	;0885 71 04 64 ; fixupword	next key


Key_J: ; Key J
	JSR 0472	;0888 79 04 72 ; fixupword
	JSR 0850	;088B 7B C3
	JSR E_242f	;088D 79 24 2F ; fixupword
	DW L_099B	;0890 09 9B ; fixupword
	JSR E_2437	;0892 79 24 37 ; fixupword
	DB L_0BBD	;0895 0B BD ; fixupword
E_0897:	LDA #0bbf	;0897 90 0B BF ; fixupword
	XAY		;089A 5C
	CLR XW,0	;089B 32 40
L_089D:	LDAB (YW+)	;089D 85 61
	LDBB #b9	;089F C0 B9
	SABB		;08A1 49
	BGZ 08b6	;08A2 18 12
	LDB #00b0	;08A4 D0 00 B0
	SABB		;08A7 49
	BM L_08b6	;08A8 16 0C
	XFR AW,XW	;08AA 55 40
	SLR AW,2	;08AC 35 01
	ADD XW,AW	;08AE 50 04
	SLR XW,1	;08B0 35 40
	ADD XW,BW	;08B2 50 24
	JMP 089d	;08B4 73 E7

	XFR AW,XW	;08B6 55 40
	LDBB #02	;08B8 C0 02
	SABB		;08BA 49
	BM Key_J	;08BB 16 CB
	STAB 03cd	;08BD A1 03 CD ; fixupword
	JSR E_242F	;08C0 79 24 2F ; fixupword	type "SUBFILE"
	DW L_0932	;08C3 09 32 ; fixupword
	JSR E_2437	;08C5 79 24 37 ; fixupword
	DW L_0BBD	;08C8 0B BD ; fixupword
	JSR E_2408	;08CA 79 24 08 ; fixupword
	DW L_0BBD	;08CD 0B BD ; fixupword
	JSR E_0442	;08CF 79 04	42 ; fixupword
L_08d2:	DW L_03CC	;08D2 03 CC ; fixupword
	??? L_0BBD	;08D4 91 0B BD ; fixupword
	BZ?? ???	;08D7 14 37
	??? #6		;08D9 90 00 06
	??? L_0BBD 	;08DC D1 0B BD ; fixupword
	JSR E_249F	;08DF 79 24 9F ; fixupword
	DW L_0BC5	;08E2 0B C5 ; fixupword
	DW L_0BBF	;08E4 0B BF; fixupword
E_08E6:	LDB 08d2	;08E6 D3 EA
	JSR 083d	;08E8 79 08 3D ; fixupword
	NOP		;08EB 01
	BNZ 0925	;08EC 15 37
	LDAB 0ab1	;08EE 81 0A B1 ; fixupword
	LDBB #a8	;08F1 C0 A8
	SABB		;08F3 49
	BNZ 08e6	;08F4 15 F0
	JSR E_2408	;08F6 79 24 08 ; fixupword
	DW L_0AAF	;08F9 0A AF ; fixupword
	LDA #0ab2	;08FB 90 0A B2 ; fixupword
	XAZ		;08FE 5E
	LDA #0bc5	;08FF 90 0B C5 ; fixupword
	XAY		;0902 5C
	LDX #0003	;0903 60 00 03
L_0906:	LDA (ZW+)	;0906 95 81
	LDB (YW+)	;0908 D5 61
	SAB		;090A 59
	BNZ 08e6	;090B 15 D9
	DCX		;090D 3F
	BGZ 0906	;090E 18 F6
L_0910:	LDB 08d2	;0910 D3 C0
	JSR E_083D 	;0912 79 08 3D ; fixupword
	DB 01		;0915 01
E_0916:	BNZ 092a	;0916 15 12
	LDAB 0ab1	;0918 81 0A B1 ; fixupword
	LDBB #a8	;091B C0 A8
	SABB		;091D 49
	BZ 092a		;091E 14 0A
	JSR 0850	;0920 79 08 50 ; fixupword
	JMP 0910	;0923 73 EB

	JSR E_242F	;0925 79 24 2F ; fixupword
	DW L_0A67	;0928 0A 67; fixupword		type "EQUALITY NOT FOUND"
E_092A:	LDB L_08d2	;092A D3 A6
	JSR E_07DF	;092C 79 07 DF ; fixupword
	JMP E_0464	;092F 71 04 64 ; fixupword

L_0932:	DW 7		;0932 00 07
	DB D3 ;S	;0934
	DB D5 ;U	;0935
	DB C2 ;B	;0936
	DB C6 ;F	;0937
	DB C9 ;I	;0938
	DB CC ;L	;0939
	DB C5 ;E	;093A

L_093b	DW $D		;093B 00 0D
	DB CB ;K	;093D
	DB CF ;O	;093E
	DB CD ;M	;093F
	DB D0 ;P	;0940
	DB CF ;O	;0941
	DB DA ;Z	;0942
	DB A0 ; 	;0943
	DB AD ;-	;0944
	DB A0 ; 	;0945
	DB B6 ;6	;0946
	DB AE ;.	;0947
	DB B0 ;0	;0948
	DB B3 ;3	;0949

L_094a:	DW $c		;094A 00 0C
	DB C5 ;E	;094C
	DB D2 ;R	;094D
	DB D2 ;R	;094E
	DB A0 ; 	;094F
	DB CF ;O	;0950
	DB CE ;N	;0951
	DB A0 ; 	;0952
	DB C9 ;I	;0953
	DB CE ;N	;0954
	DB D0 ;P	;0955
	DB D5 ;U	;0956
	DB D4 ;T	;0957

L_0958	DW $d		;0958 00 0D
	DB C5 ;E	;095A
	DB D2 ;R	;095B
	DB D2 ;R	;095C
	DB A0 ; 	;095D
	DB CF ;O	;095E
	DB CE ;N	;095F
	DB A0 ; 	;0960
	DB CF ;O	;0961
	DB D5 ;U	;0962
	DB D4 ;T	;0963
	DB D0 ;P	;0964
	DB D5 ;U	;0965
	DB D4 ;T	;0966

L_0967:	DW $d		;0967 00 0D
	DB C5 ;E	;0969
	DB CF ;O	;096A
	DB CD ;M	;096B
	DB A0 ; 	;096C
	DB CF ;O	;096D
	DB CE ;N	;096E
	DB A0 ; 	;096F
	DB CF ;O	;0970
	DB D5 ;U	;0971
	DB D4 ;T	;0972
	DB D0 ;P	;0973
	DB D5 ;U	;0974
	DB D4 ;T	;0975

L_0976:	DW $c		;0976 00 0C
	DB C5 ;E	;0978
	DB CF ;O	;0979
	DB C6 ;F	;097A
	DB A0 ; 	;097B
	DB CF ;O	;097C
	DB CE ;N	;097D
	DB A0 ; 	;097E
	DB C9 ;I	;097F
	DB CE ;N	;0980
	DB D0 ;P	;0981
	DB D5 ;U	;0982
	DB D4 ;T	;0983

L_0984:	DW $15		;0984 00 15
	DB C9 ;I	;0986
	DB CE ;N	;0987
	DB BD ;=	;0988
	DB D3 ;S	;0989
	DB D9 ;Y	;098A
	DB D3 ;S	;098B
	DB B0 ;0	;098C
	DB B0 ;0	;098D
	DB D8 ;X	;098E
	DB AC ;,	;098F
	DB A0 ; 	;0990
	DB CF ;O	;0991
	DB D5 ;U	;0992
	DB D4 ;T	;0993
	DB BD ;=	;0994
	DB D3 ;S	;0995
	DB D9 ;Y	;0996
	DB D3 ;S	;0997
	DB B0 ;0	;0998
	DB B0 ;0	;0999
	DB D8 ;X	;099A

L_099b:	DW $d		;099B 00 0D
	DB A7 ;'	;099D
	DB D3 ;S	;099E
	DB D9 ;Y	;099F
	DB D3 ;S	;09A0
	DB A7 ;'	;09A1
	DB A0 ; 	;09A2
	DB CE ;N	;09A3
	DB D5 ;U	;09A4
	DB CD ;M	;09A5
	DB C2 ;B	;09A6
	DB C5 ;E	;09A7
	DB D2 ;R	;09A8
	DB BF ;?	;09A9

L_09aa:	DW 1		;09AA 00 01B
	DB AD ;-	;09AC

L_09ad:	DW $a		;09AD 00 0A
	DB C5 ;E	;09AF
	DB CE ;N	;09B0
	DB C4 ;D	;09B1
	DB A0 ; 	;09B2
	DB CB ;K	;09B3
	DB CF ;O	;09B4
	DB CD ;M	;09B5
	DB D0 ;P	;09B6
	DB CF ;O	;09B7
	DB DA ;Z	;09B8

L_09b9:	DW $e		;09B9 00 0E
	DB C6 ;F	;09BB
	DB C9 ;I	;09BC
	DB CE ;N	;09BD
	DB C4 ;D	;09BE
	DB BF ;?	;09BF
	DB A0 ; 	;09C0
	DB A8 ;(	;09C1
	DB D9 ;Y	;09C2
	DB A0 ; 	;09C3
	DB CF ;O	;09C4
	DB D2 ;R	;09C5
	DB A0 ; 	;09C6
	DB CE ;N	;09C7
	DB A9 ;)	;09C8

L_09c9:	DW $d		;09C9 00 0D
	DB D4 ;T	;09CB
	DB CF ;O	;09CC
	DB D0 ;P	;09CD
	DB BF ;?	;09CE
	DB A0 ; 	;09CF
	DB A8 ;(	;09D0
	DB D9 ;Y	;09D1
	DB A0 ; 	;09D2
	DB CF ;O	;09D3
	DB D2 ;R	;09D4
	DB A0 ; 	;09D5
	DB CE ;N	;09D6
	DB A9 ;)	;09D7

L_09d8:	DW $e		;09D8 00 0E
	DB D1 ;Q	;09DA
	DB D5 ;U	;09DB
	DB C9 ;I	;09DC
	DB D4 ;T	;09DD
	DB BF ;?	;09DE
	DB A0 ; 	;09DF
	DB A8 ;(	;09E0
	DB D9 ;Y	;09E1
	DB A0 ; 	;09E2
	DB CF ;O	;09E3
	DB D2 ;R	;09E4
	DB A0 ; 	;09E5
	DB CE ;N	;09E6
	DB A9 ;)	;09E7

L_09e8:	DW $15		;09E8 00 15
	DB C5 ;E	;09EA
	DB CE ;N	;09EB
	DB C4 ;D	;09EC
	DB A0 ; 	;09ED
	DB CF ;O	;09EE
	DB C6 ;F	;09EF
	DB A0 ; 	;09F0
	DB C6 ;F	;09F1
	DB C9 ;I	;09F2
	DB CC ;L	;09F3
	DB C5 ;E	;09F4
	DB BF ;?	;09F5
	DB A0 ; 	;09F6
	DB A8 ;(	;09F7
	DB D9 ;Y	;09F8
	DB A0 ; 	;09F9
	DB CF ;O	;09FA
	DB D2 ;R	;09FB
	DB A0 ; 	;09FC
	DB CE ;N	;09FD
	DB A9 ;)	;09FE
	DB A0 ; 	;09FF
	DB A0 ; 	;0A00

L_0a01:	DW 0		;0A01 00 00	records read counter
L_0a03:	DW 0		;0A03 00 00	records written counter

	DW $14		;0A05 00 14
	DB D3 ;S	;0A07
	DB D5 ;U	;0A08
	DB C2 ;B	;0A09
	DB D3 ;S	;0A0A
	DB D4 ;T	;0A0B
	DB C9 ;I	;0A0C
	DB D4 ;T	;0A0D
	DB D5 ;U	;0A0E
	DB D4 ;T	;0A0F
	DB C9 ;I	;0A10
	DB CF ;O	;0A11
	DB CE ;N	;0A12
	DB D3 ;S	;0A13
	DB A0 ; 	;0A14
	DB BD ;=	;0A15
	DB A0 ; 	;0A16
	DB A0 ; 	;0A17
	DB A0 ; 	;0A18
	DB A0 ; 	;0A19
	DB A0 ; 	;0A1A

L_0a1b:	DW 5		;0A1B 00 05
	DB D7 ;W	;0A1D
	DB C1 ;A	;0A1E
	DB C9 ;I	;0A1F
	DB D4 ;T	;0A20
	DB BF ;?	;0A21

	DW 3		;0A22
	DB CF ;O	;0A24
	DB CB ;K	;0A25
	DB BF ;?	;0A26

L_0a27:	DW $13		;0A27 00 13
	DB D2 ;R	;0A29
	DB C5 ;E	;0A2A
	DB C3 ;C	;0A2B
	DB CF ;O	;0A2C
	DB D2 ;R	;0A2D
	DB C4 ;D	;0A2E
	DB D3 ;S	;0A2F
	DB A0 ; 	;0A30
	DB D2 ;R	;0A31
	DB C5 ;E	;0A32
	DB C1 ;A	;0A33
	DB C4 ;D	;0A34
	DB A0 ; 	;0A35
	DB BD ;=	;0A36
	DB A0 ; 	;0A37
L_0a38:	DB A0 ; 	;0A38	modified
	DB A0 ; 	;0A39	modified
	DB A0 ; 	;0A3A	modified
	DB A0 ; 	;0A3B	modified

L_0a3c:	DW $16		;0A3C 00 16
	DB D2 ;R	;0A3E
	DB C5 ;E	;0A3F
	DB C3 ;C	;0A40
	DB CF ;O	;0A41
	DB D2 ;R	;0A42
	DB C4 ;D	;0A43
	DB D3 ;S	;0A44
	DB A0 ; 	;0A45
	DB D7 ;W	;0A46
	DB D2 ;R	;0A47
	DB C9 ;I	;0A48
	DB D4 ;T	;0A49
	DB D4 ;T	;0A4A
	DB C5 ;E	;0A4B
	DB CE ;N	;0A4C
	DB A0 ; 	;0A4D
	DB BD ;=	;0A4E
L_0a4f:	DB A0 ; 	;0A4F	modified
	DB A0 ; 	;0A50	modified
	DB A0 ; 	;0A51	modified
	DB A0 ; 	;0A52	modified
	DB A0 ; 	;0A53	modified

L_0a54:	DW $11		;0A54 00 11
	DB C9 ;I	;0A56
	DB CC ;L	;0A57
	DB CC ;L	;0A58
	DB C5 ;E	;0A59
	DB C7 ;G	;0A5A
	DB C1 ;A	;0A5B
	DB CC ;L	;0A5C
	DB A0 ; 	;0A5D
	DB D0 ;P	;0A5E
	DB C1 ;A	;0A5F
	DB D2 ;R	;0A60
	DB C1 ;A	;0A61
	DB CD ;M	;0A62
	DB C5 ;E	;0A63
	DB D4 ;T	;0A64
	DB C5 ;E	;0A65
	DB D2 ;R	;0A66

L_0a67:	DW $12		;0A67 00 12
	DB C5 ;E	;0A69
	DB D1 ;Q	;0A6A
	DB D5 ;U	;0A6B
	DB C1 ;A	;0A6C
	DB CC ;L	;0A6D
	DB C9 ;I	;0A6E
	DB D4 ;T	;0A6F
	DB D9 ;Y	;0A70
	DB A0 ; 	;0A71
	DB CE ;N	;0A72
	DB CF ;O	;0A73
	DB D4 ;T	;0A74
	DB A0 ; 	;0A75
	DB C6 ;F	;0A76
	DB CF ;O	;0A77
	DB D5 ;U	;0A78
	DB CE ;N	;0A79
	DB C4 ;D	;0A7A

L_0a7b: ; key jump table
	DW BadParam	;0A7B ; 05 b3 fixupword	'A'
	DW BadParam	;0A7D ; 05 b3 fixupword	'B'
	DW L_0564	;0A7F ; 05 64 fixupword	'C'
	DW L_06A3	;0A81 ; 06 a3 fixupword	'D'
	DW L_0751	;0A83 ; 07 51 fixupword	'E'
	DW Key_F	;0A85 ; 05 bb fixupword	'F'
	DW BadParam	;0A87 ; 05 b3 fixupword	'G'
	DW BadParam	;0A89 ; 05 b3 fixupword	'H'
	DW L_06D9	;0A8B ; 06 d9 fixupword	'I'
	DW Key_J	;0A8D ; 08 88 fixupword	'J'
	DW L_0567	;0A8F ; 05 67 fixupword	'K'
	DW BadParam	;0A91 ; 05 b3 fixupword	'L'
	DW BadParam	;0A93 ; 05 b3 fixupword	'M'
	DW L_0705	;0A95 ; 07 05 fixupword	'N'
	DW Key_O	;0A97 ; 17 51 fixupword	'O'
	DW L_05D8	;0A99 ; 05 d8 fixupword	'P'
	.dytb Key_Q	;0A9B ; 04 78 fixupword	'Q'
	DW L_072D	;0A9D ; 07 2d fixupword	'R'
	DW L_0610	;0A9F ; 06 10 fixupword	'S'
	DW L_073C	;0AA1 ; 07 3c fixupword	'T'
	DW L_0783	;0AA3 ; 07 83 fixupword	'U'
	DW BadParam	;0AA5 ; 05 b3 fixupword	'V'
	DW L_0719	;0AA7 ; 07 19 fixupword	'W'
	DW L_0762	;0AA9 ; 07 62 fixupword	'X'
	DW BadParam	;0AAB ; 05 b3 fixupword	'Y'
	DW L_0732	;0AAD ; 07 32 fixupword	'Z'

L_0aaf:	DW 0		;0AAF

	DB 00	;0AB1
	DB 00	;0AB2
	DB 00	;0AB3
	DB 00	;0AB4
	DB 00	;0AB5
	DB 00	;0AB6
	DB 00	;0AB7
	DB 00	;0AB8
	DB 00	;0AB9
	DB 00	;0ABA
	DB 00	;0ABB
	DB 00	;0ABC
	DB 00	;0ABD
	DB 00	;0ABE
	DB 00	;0ABF
	DB 00	;0AC0
	DB 00	;0AC1
	DB 00	;0AC2
	DB 00	;0AC3
	DB 00	;0AC4
	DB 00	;0AC5
	DB 00	;0AC6
	DB 00	;0AC7
	DB 00	;0AC8
	DB 00	;0AC9
	DB 00	;0ACA
	DB 00	;0ACB
	DB 00	;0ACC
	DB 00	;0ACD
	DB 00	;0ACE
	DB 00	;0ACF
	DB 00	;0AD0
	DB 00	;0AD1
	DB 00	;0AD2
	DB 00	;0AD3
	DB 00	;0AD4
	DB 00	;0AD5
	DB 00	;0AD6
	DB 00	;0AD7
	DB 00	;0AD8
	DB 00	;0AD9
	DB 00	;0ADA
	DB 00	;0ADB
	DB 00	;0ADC
	DB 00	;0ADD
	DB 00	;0ADE
	DB 00	;0ADF
	DB 00	;0AE0
	DB 00	;0AE1
	DB 00	;0AE2
	DB 00	;0AE3
	DB 00	;0AE4
	DB 00	;0AE5
	DB 00	;0AE6
	DB 00	;0AE7
	DB 00	;0AE8
	DB 00	;0AE9
	DB 00	;0AEA
	DB 00	;0AEB
	DB 00	;0AEC
	DB 00	;0AED
	DB 00	;0AEE
	DB 00	;0AEF
	DB 00	;0AF0
	DB 00	;0AF1
	DB 00	;0AF2
	DB 00	;0AF3
	DB 00	;0AF4
	DB 00	;0AF5
	DB 00	;0AF6
	DB 00	;0AF7
	DB 00	;0AF8
	DB 00	;0AF9
	DB 00	;0AFA
	DB 00	;0AFB
	DB 00	;0AFC
	DB 00	;0AFD
	DB 00	;0AFE
	DB 00	;0AFF
	DB 00	;0B00
	DB 00	;0B01
	DB 00	;0B02
	DB 00	;0B03
	DB 00	;0B04
	DB 00	;0B05
	DB 00	;0B06
	DB 00	;0B07
	DB 00	;0B08
	DB 00	;0B09
	DB 00	;0B0A
	DB 00	;0B0B
	DB 00	;0B0C
	DB 00	;0B0D
	DB 00	;0B0E
	DB 00	;0B0F
	DB 00	;0B10
	DB 00	;0B11
	DB 00	;0B12
	DB 00	;0B13
	DB 00	;0B14
	DB 00	;0B15
	DB 00	;0B16
	DB 00	;0B17
	DB 00	;0B18
	DB 00	;0B19
	DB 00	;0B1A
	DB 00	;0B1B
	DB 00	;0B1C
	DB 00	;0B1D
	DB 00	;0B1E
	DB 00	;0B1F
	DB 00	;0B20
	DB 00	;0B21
	DB 00	;0B22
	DB 00	;0B23
	DB 00	;0B24
	DB 00	;0B25
	DB 00	;0B26
	DB 00	;0B27
	DB 00	;0B28
	DB 00	;0B29
	DB 00	;0B2A
	DB 00	;0B2B
	DB 00	;0B2C
	DB 00	;0B2D
	DB 00	;0B2E
	DB 00	;0B2F
	DB 00	;0B30
	DB 00	;0B31
	DB 00	;0B32
	DB 00	;0B33
	DB 00	;0B34
	DB 00	;0B35
	DB 00	;0B36
	DB 00	;0B37
	DB 00	;0B38
	DB 00	;0B39
	DB 00	;0B3A
	DB 00	;0B3B
	DB 00	;0B3C
	DB 00	;0B3D
	DB 00	;0B3E
	DB 00	;0B3F
	DB 00	;0B40
	DB 00	;0B41
	DB 00	;0B42
	DB 00	;0B43
	DB 00	;0B44
	DB 00	;0B45
	DB 00	;0B46
	DB 00	;0B47
	DB 00	;0B48
	DB 00	;0B49
	DB 00	;0B4A
	DB 00	;0B4B
	DB 00	;0B4C
	DB 00	;0B4D
	DB 00	;0B4E
	DB 00	;0B4F
	DB 00	;0B50
	DB 00	;0B51
	DB 00	;0B52
	DB 00	;0B53
	DB 00	;0B54
	DB 00	;0B55
	DB 00	;0B56
	DB 00	;0B57
	DB 00	;0B58
	DB 00	;0B59
	DB 00	;0B5A
	DB 00	;0B5B
	DB 00	;0B5C
	DB 00	;0B5D
	DB 00	;0B5E
	DB 00	;0B5F
	DB 00	;0B60
	DB 00	;0B61
	DB 00	;0B62
	DB 00	;0B63
	DB 00	;0B64
	DB 00	;0B65
	DB 00	;0B66
	DB 00	;0B67
	DB 00	;0B68
	DB 00	;0B69
	DB 00	;0B6A
	DB 00	;0B6B
	DB 00	;0B6C
	DB 00	;0B6D
	DB 00	;0B6E
	DB 00	;0B6F
	DB 00	;0B70
	DB 00	;0B71
	DB 00	;0B72
	DB 00	;0B73
	DB 00	;0B74
	DB 00	;0B75
	DB 00	;0B76
	DB 00	;0B77
	DB 00	;0B78
	DB 00	;0B79
	DB 00	;0B7A
	DB 00	;0B7B
	DB 00	;0B7C
	DB 00	;0B7D
	DB 00	;0B7E
	DB 00	;0B7F
	DB 00	;0B80
	DB 00	;0B81
	DB 00	;0B82
	DB 00	;0B83
	DB 00	;0B84
	DB 00	;0B85
	DB 00	;0B86
	DB 00	;0B87
	DB 00	;0B88
	DB 00	;0B89
	DB 00	;0B8A
	DB 00	;0B8B
	DB 00	;0B8C
	DB 00	;0B8D
	DB 00	;0B8E
	DB 00	;0B8F
	DB 00	;0B90
	DB 00	;0B91
	DB 00	;0B92
	DB 00	;0B93
	DB 00	;0B94
	DB 00	;0B95
	DB 00	;0B96
	DB 00	;0B97
	DB 00	;0B98
	DB 00	;0B99
	DB 00	;0B9A
	DB 00	;0B9B
	DB 00	;0B9C
	DB 00	;0B9D
	DB 00	;0B9E
	DB 00	;0B9F
	DB 00	;0BA0
	DB 00	;0BA1
	DB 00	;0BA2
	DB 00	;0BA3
	DB 00	;0BA4
	DB 00	;0BA5
	DB 00	;0BA6
	DB 00	;0BA7
	DB 00	;0BA8
	DB 00	;0BA9
	DB 00	;0BAA
	DB 00	;0BAB
	DB 00	;0BAC
	DB 00	;0BAD
	DB 00	;0BAE
	DB 00	;0BAF
	DB 00	;0BB0
	DB 00	;0BB1
	DB 00	;0BB2
	DB 00	;0BB3
	DB 00	;0BB4
	DB 00	;0BB5
	DB 00	;0BB6
	DB 00	;0BB7
	DB 00	;0BB8
	DB 00	;0BB9
	DB 00	;0BBA
	DB 00	;0BBB
	DB 00	;0BBC

L_0BBD:	DB 00	;0BBD
	DB 00	;0BBE
	DB 00	;0BBF
	DB 00	;0BC0
	DB 00	;0BC1
	DB 00	;0BC2
	DB 00	;0BC3
	DB 00	;0BC4
	DB 00	;0BC5
	DB 00	;0BC6
	DB 00	;0BC7
	DB 00	;0BC8
	DB 00	;0BC9
	DB 00	;0BCA
	DB 00	;0BCB
	DB 00	;0BCC
	DB 00	;0BCD
	DB 00	;0BCE
	DB 00	;0BCF
	DB 00	;0BD0
	DB 00	;0BD1
	DB 00	;0BD2
	DB 00	;0BD3
	DB 00	;0BD4
	DB 00	;0BD5
	DB 00	;0BD6
	DB 00	;0BD7
	DB 00	;0BD8
	DB 00	;0BD9
	DB 00	;0BDA
	DB 00	;0BDB
	DB 00	;0BDC
	DB 00	;0BDD
	DB 00	;0BDE
	DB 00	;0BDF
	DB 00	;0BE0
	DB 00	;0BE1
	DB 00	;0BE2
	DB 00	;0BE3
	DB 00	;0BE4
	DB 00	;0BE5
	DB 00	;0BE6
	DB 00	;0BE7
	DB 00	;0BE8
	DB 00	;0BE9
	DB 00	;0BEA
	DB 00	;0BEB
	DB 00	;0BEC
	DB 00	;0BED
	DB 00	;0BEE
	DB 00	;0BEF
	DB 00	;0BF0
	DB 00	;0BF1
	DB 00	;0BF2
	DB 00	;0BF3
	DB 00	;0BF4
	DB 00	;0BF5
	DB 00	;0BF6
	DB 00	;0BF7
	DB 00	;0BF8
	DB 00	;0BF9
	DB 00	;0BFA
	DB 00	;0BFB
	DB 00	;0BFC
	DB 00	;0BFD
	DB 00	;0BFE
	DB 00	;0BFF
	DB 00	;0C00
	DB 00	;0C01
	DB 00	;0C02
	DB 00	;0C03
	DB 00	;0C04
	DB 00	;0C05
	DB 00	;0C06
	DB 00	;0C07
	DB 00	;0C08
	DB 00	;0C09
	DB 00	;0C0A
	DB 00	;0C0B
	DB 00	;0C0C
	DB 00	;0C0D
	DB 00	;0C0E
	DB 00	;0C0F
	DB 00	;0C10
	DB 00	;0C11
	DB 00	;0C12
	DB 00	;0C13
	DB 00	;0C14
	DB 00	;0C15
	DB 00	;0C16
	DB 00	;0C17
	DB 00	;0C18
	DB 00	;0C19
	DB 00	;0C1A
	DB 00	;0C1B
	DB 00	;0C1C
	DB 00	;0C1D
	DB 00	;0C1E
	DB 00	;0C1F
	DB 00	;0C20
	DB 00	;0C21
	DB 00	;0C22
	DB 00	;0C23
	DB 00	;0C24
	DB 00	;0C25
	DB 00	;0C26
	DB 00	;0C27
	DB 00	;0C28
	DB 00	;0C29
	DB 00	;0C2A
	DB 00	;0C2B
	DB 00	;0C2C
	DB 00	;0C2D
	DB 00	;0C2E
	DB 00	;0C2F
	DB 00	;0C30
	DB 00	;0C31
	DB 00	;0C32
	DB 00	;0C33
	DB 00	;0C34
	DB 00	;0C35
	DB 00	;0C36
	DB 00	;0C37
	DB 00	;0C38
	DB 00	;0C39
	DB 00	;0C3A
	DB 00	;0C3B
	DB 00	;0C3C
	DB 00	;0C3D
	DB 00	;0C3E
	DB 00	;0C3F
	DB 00	;0C40
	DB 00	;0C41
	DB 00	;0C42
	DB 00	;0C43

L_0c44:	DB 00	;0C44
	DB 00	;0C45
	DB 00	;0C46
	DB 00	;0C47
	DB 00	;0C48
	DB 00	;0C49
	DB 00	;0C4A
	DB 00	;0C4B
	DB 00	;0C4C
	DB 00	;0C4D
	DB 00	;0C4E
	DB 00	;0C4F
	DB 00	;0C50
	DB 00	;0C51
	DB 00	;0C52
	DB 00	;0C53
	DB 00	;0C54
	DB 00	;0C55
	DB 00	;0C56
	DB 00	;0C57
	DB 00	;0C58
	DB 00	;0C59
	DB 00	;0C5A
	DB 00	;0C5B
	DB 00	;0C5C
	DB 00	;0C5D
	DB 00	;0C5E
	DB 00	;0C5F
	DB 00	;0C60
	DB 00	;0C61
	DB 00	;0C62
	DB 00	;0C63
	DB 00	;0C64
	DB 00	;0C65
	DB 00	;0C66
	DB 00	;0C67
	DB 00	;0C68
	DB 00	;0C69
	DB 00	;0C6A
	DB 00	;0C6B
	DB 00	;0C6C
	DB 00	;0C6D
	DB 00	;0C6E
	DB 00	;0C6F
	DB 00	;0C70
	DB 00	;0C71
	DB 00	;0C72
	DB 00	;0C73
	DB 00	;0C74
	DB 00	;0C75
	DB 00	;0C76
	DB 00	;0C77
	DB 00	;0C78
	DB 00	;0C79
	DB 00	;0C7A
	DB 00	;0C7B
	DB 00	;0C7C
	DB 00	;0C7D
	DB 00	;0C7E
	DB 00	;0C7F
	DB 00	;0C80
	DB 00	;0C81
	DB 00	;0C82
	DB 00	;0C83
	DB 00	;0C84
	DB 00	;0C85
	DB 00	;0C86
	DB 00	;0C87
	DB 00	;0C88
	DB 00	;0C89
	DB 00	;0C8A
	DB 00	;0C8B
	DB 00	;0C8C
	DB 00	;0C8D
	DB 00	;0C8E
	DB 00	;0C8F
	DB 00	;0C90
	DB 00	;0C91
	DB 00	;0C92
	DB 00	;0C93
	DB 00	;0C94
	DB 00	;0C95
	DB 00	;0C96
	DB 00	;0C97
	DB 00	;0C98
	DB 00	;0C99
	DB 00	;0C9A
	DB 00	;0C9B
	DB 00	;0C9C
	DB 00	;0C9D
	DB 00	;0C9E
	DB 00	;0C9F
	DB 00	;0CA0
	DB 00	;0CA1
	DB 00	;0CA2
	DB 00	;0CA3
	DB 00	;0CA4
	DB 00	;0CA5
	DB 00	;0CA6
	DB 00	;0CA7
	DB 00	;0CA8
	DB 00	;0CA9
	DB 00	;0CAA
	DB 00	;0CAB
	DB 00	;0CAC
	DB 00	;0CAD
	DB 00	;0CAE
	DB 00	;0CAF
	DB 00	;0CB0
	DB 00	;0CB1
	DB 00	;0CB2
	DB 00	;0CB3
	DB 00	;0CB4
	DB 00	;0CB5
	DB 00	;0CB6
	DB 00	;0CB7
	DB 00	;0CB8
	DB 00	;0CB9
	DB 00	;0CBA
	DB 00	;0CBB
	DB 00	;0CBC
	DB 00	;0CBD
	DB 00	;0CBE
	DB 00	;0CBF
	DB 00	;0CC0
	DB 00	;0CC1
	DB 00	;0CC2
	DB 00	;0CC3
	DB 00	;0CC4
	DB 00	;0CC5
	DB 00	;0CC6
	DB 00	;0CC7
	DB 00	;0CC8
	DB 00	;0CC9
	DB 00	;0CCA
	DB 00	;0CCB
	DB 00	;0CCC
	DB 00	;0CCD
	DB 00	;0CCE
	DB 00	;0CCF
	DB 00	;0CD0
	DB 00	;0CD1
	DB 00	;0CD2
	DB 00	;0CD3
	DB 00	;0CD4
	DB 00	;0CD5
	DB 00	;0CD6
	DB 00	;0CD7
	DB 00	;0CD8
	DB 00	;0CD9
	DB 00	;0CDA
	DB 00	;0CDB
	DB 00	;0CDC
	DB 00	;0CDD
	DB 00	;0CDE
	DB 00	;0CDF
	DB 00	;0CE0
	DB 00	;0CE1
	DB 00	;0CE2
	DB 00	;0CE3
	DB 00	;0CE4
	DB 00	;0CE5
	DB 00	;0CE6
	DB 00	;0CE7
	DB 00	;0CE8
	DB 00	;0CE9
	DB 00	;0CEA
	DB 00	;0CEB
	DB 00	;0CEC
	DB 00	;0CED
	DB 00	;0CEE
	DB 00	;0CEF
	DB 00	;0CF0
	DB 00	;0CF1
	DB 00	;0CF2
	DB 00	;0CF3
	DB 00	;0CF4
	DB 00	;0CF5
	DB 00	;0CF6
	DB 00	;0CF7
	DB 00	;0CF8
	DB 00	;0CF9
	DB 00	;0CFA
	DB 00	;0CFB
	DB 00	;0CFC
	DB 00	;0CFD
	DB 00	;0CFE
	DB 00	;0CFF
	DB 00	;0D00
	DB 00	;0D01
	DB 00	;0D02
	DB 00	;0D03
	DB 00	;0D04
	DB 00	;0D05
	DB 00	;0D06
	DB 00	;0D07
	DB 00	;0D08
	DB 00	;0D09
	DB 00	;0D0A
	DB 00	;0D0B
	DB 00	;0D0C
	DB 00	;0D0D
	DB 00	;0D0E
	DB 00	;0D0F
	DB 00	;0D10
	DB 00	;0D11
	DB 00	;0D12
	DB 00	;0D13
	DB 00	;0D14
	DB 00	;0D15
	DB 00	;0D16
	DB 00	;0D17
	DB 00	;0D18
	DB 00	;0D19
	DB 00	;0D1A
	DB 00	;0D1B
	DB 00	;0D1C
	DB 00	;0D1D
	DB 00	;0D1E
	DB 00	;0D1F
	DB 00	;0D20
	DB 00	;0D21
	DB 00	;0D22
	DB 00	;0D23
	DB 00	;0D24
	DB 00	;0D25
	DB 00	;0D26
	DB 00	;0D27
	DB 00	;0D28
	DB 00	;0D29
	DB 00	;0D2A
	DB 00	;0D2B
	DB 00	;0D2C
	DB 00	;0D2D
	DB 00	;0D2E
	DB 00	;0D2F
	DB 00	;0D30
	DB 00	;0D31
	DB 00	;0D32
	DB 00	;0D33
	DB 00	;0D34
	DB 00	;0D35
	DB 00	;0D36
	DB 00	;0D37
	DB 00	;0D38
	DB 00	;0D39
	DB 00	;0D3A
	DB 00	;0D3B
	DB 00	;0D3C
	DB 00	;0D3D
	DB 00	;0D3E
	DB 00	;0D3F
	DB 00	;0D40
	DB 00	;0D41
	DB 00	;0D42
	DB 00	;0D43
	DB 00	;0D44
	DB 00	;0D45
	DB 00	;0D46
	DB 00	;0D47
	DB 00	;0D48
	DB 00	;0D49
	DB 00	;0D4A
	DB 00	;0D4B
	DB 00	;0D4C
	DB 00	;0D4D
	DB 00	;0D4E
	DB 00	;0D4F
	DB 00	;0D50
	DB 00	;0D51
	DB 00	;0D52
	DB 00	;0D53
	DB 00	;0D54
	DB 00	;0D55
	DB 00	;0D56
	DB 00	;0D57
	DB 00	;0D58
	DB 00	;0D59
	DB 00	;0D5A
	DB 00	;0D5B

  lots of uninitialized space
L_1224:
  lots of uninitialized space

L_13a8: ; command table
	; 1st 3 letters, then routine addr
	DB 'S'+$80,'E'+$80,'C'+$80	;13A8 D3 C5 C3	SEC
	DW E_19aa	;13AB ; fixupword

	DB 'F'+$80,'L'+$80,'A'+$80	;13AD C6 CC C1	FLA
	DW E_19ea	;13B0 ; fixupword

	DB 'I'+$80,'N'+$80,'D'+$80	;13B2 C9 CE C4	INDent?
	DW E_19f4	;13B5 ; fixupword

	DB 'T'+$80,'A'+$80,'B'+$80	;13B7 D4 C1 C2	TAB
	DW Cmd_TAB	;13BA 1A 04 ; fixupword

	DB 'P'+$80,'A'+$80,'R'+$80	;13BC D0 C1 D2	PARagraph?
	DW E_1B06	;13BF ; fixupword

	DB 'M'+$80,'A'+$80,'R'+$80	;13C1 CD C1 D2	MARgin?
	DW L_1B50	;13C4 ; fixupword

	DB 'D'+$80,'A'+$80,'S'+$80	;13C6 C4 C1 D3	DAS
	DW E_1BAB	;13C9 ; fixupword

	DB 'S'+$80,'K'+$80,'I'+$80	;13CB D3 CB C9	SKIp?
	DW E_1BB1	;13CE ; fixupword

	DB 'S'+$80,'U'+$80,'B'+$80	;13D0 D3 D5 C2	SUB
	DW E_1B32	;13D3 ; fixupword

	DB 'E'+$80,'S'+$80,'B'+$80	;13D5 C5 D3 C2	ESB
	DW E_1B3D	;13D8 ; fixupword

	DB 'N'+$80,'E'+$80,'W'+$80	;13DA CE C5 D7	NEW
	DW Cmd_New	;13DD 1B 82 fixupword

	DB 'S'+$80,'P'+$80,'A'+$80	;13DF D3 D0 C1	SPAce?
	DW Cmd_Spa	;13E2 1B 95 ; fixupword

	DB 'P'+$80,'A'+$80,'G'+$80	;13E4 D0 C1 C7	PAGe?
	DW Cmd_Pag	;13E7 1B D3 ; fixupword

	DB 'L'+$80,'I'+$80,'N'+$80	;13E9 CC C9 CE	LINe?
	DW E_1BDC	;13EC ; fixupword

	DB 'B'+$80,'O'+$80,'T'+$80	;13EE C2 CF D4	BOT
	DW E_1BEB	;13F1 ; fixupword

	DB 'T'+$80,'O'+$80,'P'+$80	;13F3 D4 CF D0	TOP
	DW E_1BFA	;13F6 ; fixupword

	DB CE ;N	;13F8
	DB D5 ;U	;13F9
	DB CD ;M	;13FA
	DW E_1C09	;13FB ; fixupword

	DB C3 ;C	;13FD
	DB C5 ;E	;13FE
	DB CE ;N	;13FF
	DW E_1C30	;1400 ; fixupword

	DB C8 ;H	;1402
	DB C5 ;E	;1403
	DB C1 ;A	;1404
	DW E_1C54	;1405 ; fixupword

	DB C4 ;D	;1407
	DB CF ;O	;1408
	DB D5 ;U	;1409
	DW E_1C81	;140A ; fixupword

	DB D3 ;S	;140C
	DB C9 ;I	;140D
	DB CE ;N	;140E
	DW E_1C88	;140F ; fixupword

	DB D5 ;U	;1411
	DB D3 ;S	;1412
	DB C1 ;A	;1413
	DW E_1C8F	;1414 ; fixupword

	DB D5 ;U	;1416
	DB D3 ;S	;1417
	DB D7 ;W	;1418
	DW E_1AE4	;1419 ; fixupword

	DB C5 ;E	;141B
	DB D5 ;U	;141C
	DB D3 ;S	;141D
	DW E_1C8F	;141E ; fixupword

	DB CA ;J	;1420
	DB D5 ;U	;1421
	DB D3 ;S	;1422
	DW Cmd_Jus	;1423 1B 89 ; fixupword

	DB CE ;N	;1425
	DB CF ;O	;1426
	DB CA ;J	;1427
	DW Cmd_NoJ	;1428 1B 8F ; fixupword

	DB C5 ;E	;142A
	DB CF ;O	;142B
	DB C6 ;F	;142C
	DW E_1C91	;142D ; fixupword

	DB C6 ;F	;142F
	DB C9 ;I	;1430
	DB CC ;L	;1431
	DW E_1C90	;1432 ; fixupword

	DB C9 ;I	;1434
	DB CE ;N	;1435
	DB D3 ;S	;1436
	DW E_1CA0	;1437 ; fixupword

	DB D5 ;U	;1439
	DB CE ;N	;143A
	DB C4 ;D	;143B
	DW E_1A1E	;143C ; fixupword

	DB C5 ;E	;143E
	DB D5 ;U	;143F
	DB CE ;N	;1440
	DW Cmd_EUN	;1441 1A 85 ; fixupword

	DB D5 ;U	;1443  ; duplicate name?
	DB D3 ;S	;1444
	DB D7 ;W	;1445
	DW E_1AE4	;1446 ; fixupword

	DW 0	;1448 00 00   ; end of list


L_144a:	DW $11	;144A 00 11
	DB C3 ;C	;144C
	DB CF ;O	;144D
	DB CE ;N	;144E
	DB D4 ;T	;144F
	DB C9 ;I	;1450
	DB CE ;N	;1451
	DB D5 ;U	;1452
	DB CF ;O	;1453
	DB D5 ;U	;1454
	DB D3 ;S	;1455
	DB A0 ; 	;1456
	DB C6 ;F	;1457
	DB CF ;O	;1458
	DB D2 ;R	;1459
	DB CD ;M	;145A
	DB D3 ;S	;145B
	DB BF ;?	;145C

L_145d:	DW 8		;145D 00 08
	DB C9 ;I	;145F
	DB CE ;N	;1460
	DB D3 ;S	;1461
	DB C5 ;E	;1462
	DB D2 ;R	;1463
	DB D4 ;T	;1464
	DB D3 ;S	;1465
	DB BF ;?	;1466

L_1467:	DW $e	;1467 00 0E
	DB C5 ;E	;1469
	DB CE ;N	;146A
	DB D4 ;T	;146B
	DB C5 ;E	;146C
	DB D2 ;R	;146D
	DB A0 ; 	;146E
	DB A0 ; 	;146F
	DB C3 ;C	;1470
	DB CF ;O	;1471
	DB D0 ;P	;1472
	DB C9 ;I	;1473
	DB C5 ;E	;1474
	DB D3 ;S	;1475

L_1476:	DW $15	;1476 00 15
	DB C5 ;E	;1478
	DB CE ;N	;1479
	DB D4 ;T	;147A
	DB C5 ;E	;147B
	DB D2 ;R	;147C
	DB A0 ; 	;147D
	DB D3 ;S	;147E
	DB D4 ;T	;147F
	DB C1 ;A	;1480
	DB D2 ;R	;1481
	DB D4 ;T	;1482
	DB C9 ;I	;1483
	DB CE ;N	;1484
	DB C7 ;G	;1485
	DB A0 ; 	;1486
	DB D0 ;P	;1487
	DB C1 ;A	;1488
	DB C7 ;G	;1489
	DB C5 ;E	;148A
	DB A0 ; 	;148B

L_148c:	DW $10	;148C 00 10
	DB C3 ;C	;148E
	DB CF ;O	;148F
	DB CE ;N	;1490
	DB D3 ;S	;1491
	DB CF ;O	;1492
	DB CC ;L	;1493
	DB C5 ;E	;1494
	DB A0 ; 	;1495
	DB C4 ;D	;1496
	DB C9 ;I	;1497
	DB D3 ;S	;1498
	DB D0 ;P	;1499
	DB CC ;L	;149A
	DB C1 ;A	;149B
	DB D9 ;Y	;149C
	DB BF ;?	;149D

L_149e:	DW 5		;149E 00 05
	DB D7 ;W	;14A0
	DB C1 ;A	;14A1
	DB C9 ;I	;14A2
	DB D4 ;T	;14A3
	DB BF ;?	;14A4

L_14a5:	DW $13	;14A5 00 13
	DB A8 ;(	;14A7
	DB CD ;M	;14A8
	DB CF ;O	;14A9
	DB D2 ;R	;14AA
	DB C5 ;E	;14AB
	DB A0 ; 	;14AC
	DB C4 ;D	;14AD
	DB C1 ;A	;14AE
	DB D4 ;T	;14AF
	DB C1 ;A	;14B0
	DB A0 ; 	;14B1
	DB C6 ;F	;14B2
	DB CF ;O	;14B3
	DB CC ;L	;14B4
	DB CC ;L	;14B5
	DB CF ;O	;14B6
	DB D7 ;W	;14B7
	DB D3 ;S	;14B8
	DB A9 ;)	;14B9

L_14ba:	.dbty $14	;14BA 00 14
	DB C1 ;A	;14BC
	DB CC ;L	;14BD
	DB C9 ;I	;14BE
	DB C7 ;G	;14BF
	DB CE ;N	;14C0
	DB A0 ; 	;14C1
	DB C6 ;F	;14C2
	DB CF ;O	;14C3
	DB D2 ;R	;14C4
	DB CD ;M	;14C5
	DB D3 ;S	;14C6
	DB AC ;,	;14C7
	DB A0 ; 	;14C8
	DB D4 ;T	;14C9
	DB D9 ;Y	;14CA
	DB D0 ;P	;14CB
	DB C5 ;E	;14CC
	DB A0 ; 	;14CD
	DB C3 ;C	;14CE
	DB D2 ;R	;14CF

L_14d0:	DB 00 	;14D0
	DB 81	;14D1
	DB 03	;14D2
	DB A0 ; 	;14D3
	DB A0 ; 	;14D4
	DB A0 ; 	;14D5
	DB A0 ; 	;14D6
	DB A0 ; 	;14D7
	DB A0 ; 	;14D8
	DB 00	;14D9
	DB 00	;14DA
	DB 00	;14DB
	DB 00	;14DC
	DB 00	;14DD
	DB 00	;14DE
	DB 00	;14DF
	DB 00	;14E0
	DB 00	;14E1
	DB 00	;14E2
	DB 00	;14E3
	DB 00	;14E4
	DB 00	;14E5
	DB 00	;14E6
	DB 00	;1677
	DB 00	;1678
	DB 00	;1679
	DB 00	;167A
	DB 00	;167B
	DB 00	;167C
	DB 00	;167D
	DB 00	;167E
	DB 00	;167F
	DB 00	;1680
	DB 00	;1681
	DB 00	;1682
	DB 00	;1683
	DB 00	;1684
	DB 00	;1685
	DB 00	;1686
	DB 00	;1687
	DB 00	;1688
	DB 00	;1689
	DB 00	;168A
	DB 00	;168B
	DB 00	;168C
	DB 00	;168D
	DB 00	;168E
	DB 00	;168F
	DB 00	;1690
	DB 00	;1691
	DB 00	;1692
	DB 00	;1693
	DB 00	;1694
	DB 00	;1695
	DB 00	;1696
	DB 00	;1697
	DB 00	;1698
	DB 00	;1699
	DB 00	;169A
	DB 00	;169B
	DB 00	;169C
	DB 00	;169D
	DB 00	;169E
	DB 00	;169F
	DB 00	;16A0
	DB 00	;16A1
	DB 00	;16A2
	DB 00	;16A3
	DB 00	;16A4
	DB 00	;16A5
	DB 00	;16A6
	DB 00	;16A7
	DB 00	;16A8
	DB 00	;16A9
	DB 00	;16AA
	DB 00	;16AB
	DB 00	;16AC
	DB 00	;16AD
	DB 00	;16AE
	DB 00	;16AF
	DB 00	;16B0
	DB 00	;16B1
	DB 00	;16B2
	DB 00	;16B3
	DB 00	;16B4
	DB 00	;16B5
	DB 00	;16B6
	DB 00	;16B7
	DB 00	;16B8
	DB 00	;16B9
	DB 00	;16BA
	DB 00	;16BB
	DB 00	;16BC
	DB 00	;16BD
	DB 00	;16BE
	DB 00	;16BF
	DB 00	;16C0
	DB 00	;16C1
	DB 00	;16C2
	DB 00	;16C3
	DB 00	;16C4
	DB 00	;16C5
	DB 00	;16C6
	DB 00	;16C7
	DB 00	;16C8
	DB 00	;16C9
	DB 00	;16CA
	DB 00	;16CB
	DB 00	;16CC
	DB 00	;16CD
	DB 00	;16CE
	DB 00	;16CF
	DB 00	;16D0
	DB 00	;16D1
	DB 00	;16D2
	DB 00	;16D3
	DB 00	;16D4
	DB 00	;16D5
	DB 00	;16D6
	DB 00	;16D7
	DB 00	;16D8
	DB 00	;16D9
	DB 00	;16DA
	DB 00	;16DB
	DB 00	;16DC
	DB 00	;16DD
	DB 00	;16DE
	DB 00	;16DF
	DB 00	;16E0
	DB 00	;16E1
	DB 00	;16E2
	DB 00	;16E3
	DB 00	;16E4
	DB 00	;16E5
	DB 00	;16E6
	DB 00	;16E7
	DB 00	;16E8
	DB 00	;16E9
	DB 00	;16EA
	DB 00	;16EB
	DB 00	;16EC
	DB 00	;16ED
	DB 00	;16EE
	DB 00	;16EF
	DB 00	;16F0
	DB 00	;16F1
	DB 00	;16F2
	DB 00	;16F3
	DB 00	;16F4
	DB 00	;16F5
	DB 00	;16F6
	DB 00	;16F7
	DB 00	;16F8
	DB 00	;16F9
	DB 00	;16FA
	DB 00	;16FB
	DB 00	;16FC
	DB 00	;16FD
	DB 00	;16FE
	DB 00	;16FF
	DB 00	;1700
	DB 00	;1701
	DB 00	;1702
	DB 00	;1703
L_1704:	DB 00	;1704
	DB 00	;1705
	DB 00	;1706
	DB 00	;1707
	DB 00	;1708
L_1709;	DB 00	;1709
	DB 00	;170A
	DB 00	;170B
	DB 00	;170C
	DB 00	;170D
L_170E:	DW L_1710	;170E 17 10 ; fixupword
L_1710:	???

L_1738:	DW 00	;1738 00 00
L_173a:	DW 00	;173A 00 00
L_173c:	DW 00	;173C 00 00
L_173e:	DW 00	;173E 00 00
L_1740:	DW 00	;1740 00 00
L_1742:	DB 00		;1742 00
L_1743:	DB 00		;1743 00
L_1744:	DW 0		;1744 00 00
L_1746:	DW 00	;1746 00 00
L_1748:	DW 00	;1748 00 00
L_174a:	DB 00		;174A 00

L_174b:	DW L_03EA	;174B 03 ea ; fixupword
L_174D:	DW L_0AAF	;174D 0a af ; fixupword
L_174F:	DW L_1677	;174F 16 77 ; fixupword


Key_O: ; Key O	print output???
	LDA L_0a03	;1751 91 0A 03 ; fixupword	any records written?
	BZ @1759	;1754 14 03
	JMP E_0464	;1756 71 04 64 ; fixupword

@1759:	STAB L_0833	;1759 A1 08 33 ; fixupword
	STAB L_170a	;175C A3 AC
	STA L_0aaf	;175E B1 0A AF ; fixupword
	STA L_1677	;1761 B1 16 77 ; fixupword
	STA L_14e7	;1764 B1 14 E7 ; fixupword
	STA L_1744	;1767 B3 DB
	INA		;1769 38
	STA L_1738	;176A B3 CC
	LDAB #02	;176C 80 02
	STA L_2297	;176E B1 22 97 ; fixupword
	STA L_16fd	;1771 B3 8A
	LDAB #01	;1773 80 01
	STAB L_1709	;1775 A3 92
	STAB L_1704	;1777 A3 8B
	STAB L_174a	;1779 A3 CF
@177B:	STAB L_1700	;177B A1 17 00 ; fixupword
	LDAB #00	;177E 80 00
	STAB L_1742	;1780 A3 C0
	STAB L_1743	;1782 A3 BF
	STAB L_1703	;1784 A1 17 03 ; fixupword
	STAB L_1708	;1787 A1 17 08 ; fixupword
	LDAB #01	;178A 80 01
	STAB L_170d	;178C A1 17 0D ; fixupword
	LDA #$c		;178F 90 00 0C
	STA L_14db	;1792 B1 14 DB ; fixupword
	STA L_14e1	;1795 B1 14 E1 ; fixupword
	LDA #$48	;1798 90 00 48
	STA L_14dd	;179B B1 14 DD ; fixupword
	LDA #6		;179E 90 00 06
	STA L_173a	;17A1 B3 97
	LDA #9		;17A3 90 00 09
	STA L_173c	;17A6 B3 94
	LDA #$42	;17A8 90 00 42
	STA L_173e	;17AB B3 91
	LDA #L_1710	;17AD 90 17 10 ; fixupword
	STA L_170e	;17B0 B1 17 0E ; fixupword
	LDB #L_0408	;17B3 D0 04 08 ; fixupword
	SVC $5c	;17B6 66 5C
	NOP	;17B8 01
	NOP	;17B9 01
	NOP	;17BA 01
	BP @177b	;17BB 17 BE ; fixupword
	LDAB #00	;17BD 80 00
	DCRB AL,4	;17BF 21 13
	BNZ @17d9	;17C1 15 16
	LDA #0001	;17C3 90 00 01
	STA L_0412	;17C6 B1 04 12 ; fixupword
	INA		;17C9 38
	STAB L_0414	;17CA A1 04 14 ; fixupword
	LDA #L_1215	;17CD 90 12 15 ; fixupword
	STA L_040e	;17D0 B1 04 0E ; fixupword
	LDA #0190	;17D3 90 01 90
	STA L_040c	;17D6 B1 04 0C ; fixupword
@17D9:	JSR E_0442	;17D9 79 04 42 ; fixupword
	DW L_0408	;17DC 04 08 ; fixupword
	JSR E_242f	;17DE 79 24 2F ; fixupword
	DW L_144A	;17E1 14 4A ; fixupword		type "CONTINUOUS FORMS?"
	JSR E_049e	;17E3 79 04 9E ; fixupword	get boolean key
	STBB L_1707	;17E6 E1 17 07 ; fixupword
	JSR E_242f	;17E9 79 24 2F ; fixupword
	DW L_145D	;17EC 14 5D ; fixupword		type "INSERTS?"
	JSR E_049e	;17EE 79 04 9E ; fixupword	get boolean key
	STBB L_16ff	;17F1 E1 16 FF ; fixupword
	BZ @17f9	;17F4 14 03
	JSR E_2314	;17F6 79 23 14 ; fixupword
@17F9:	JSR E_242f	;17F9 79 24 2F ; fixupword
	DW L_1467	;17FC 14 67 ; fixupword		type "ENTER  COPIES"
	JSR E_1855	;17FE 7B 55
	STA L_1748	;1800 B1 17 48 ; fixupword
	JSR E_242f	;1803 79 24 2F ; fixupword
	DW L_1476	;1806 14 76 ; fixupword		type "ENTER STARTING PAGE "
	JSR E_1855	;1808 7B 4B
	DCA		;180A 39
	STA L_1746	;180B B1 17 46 ; fixupword
	JSR E_242f	;180E 79 24 2F ; fixupword
	DW L_148C	;1811 14 8C ; fixupword		type "CONSOLE DISPLAY?"
	JSR E_049e	;1813 79 04 9E ; fixupword	get boolean key
	STBB L_2354	;1816 E1 23 54 ; fixupword
	BZ @1837	;1819 14 1C
	JSR E_242f	;181B 79 24 2F ; fixupword
	DW L_149E	;181E 14 9E ; fixupword		type "WAIT?"
	JSR E_049e	;1820 79 04 9E ; fixupword	get boolean key
	STBB L_2358	;1823 E1 23 58 ; fixupword
	LDB #L_14d0	;1826 D0 14 D0 ; fixupword
	SVC $5c	;1829 66 5C
	NOP??		;182B 01
	NOP		;182C 01
	BGZ L_1852	;182D 18 23 ; fixupword
	XAY		;182F 5C
	LDAB L_235c	;1830 81 23 5C ; fixupword
	DCAB		;1833 29
	STAB 236b	;1834 A1 23 6B ; fixupword
@1837:	JSR E_242f	;1837 79 24 2F ; fixupword
	DW L_14BA	;183A 14 BA ; fixupword		type "ALIGN FORMS, TYPE CR"
	JSR E_2437	;183C 79 24 37 ; fixupword
	DW L_0C44	;183F 0C 44 ; fixupword
	??? ???		;1841 80 8C
	STAB L_2490	;1843 A1 24 90 ; fixupword
	LDA #0001	;1846 90 00 01
	STA L_1740	;1849 B1 17 40 ; fixupword
	LDAB #ae	;184C 80 AE
	STAB L_1880	;184E A3 30
	JSR E_1f90	;1850 79 1F 90 ; fixupword
	JMP L_1862	;1853 73 0D


E_1855:	JSR E_2437	;1855 79 24 37 ; fixupword
	.dbyte L_0B36	;1858 0B 36 ; fixupword
	JSR E_1E81	;185a 79 1E 81 ; fixupword
	DW 0		;185D 00 00
	LDA L_185d	;185F 93 FC
	RSR		;1861 09


L_1862:	LDAB L_1703	;1862 81 17 03 ; fixupword
	BNZ @186c	;1865 15 05
	JSR E_221a	;1867 79 22 1A ; fixupword
	JMP @1871	;186A 73 05

@186C:	LDAB #00	;186C 80 00
	STAB L_1703	;186E A1 17 03 ; fixupword
@1871:	LDA L_0b36	;1871 91 0B 36 ; fixupword
	BZ @18c0	;1874 14 4A
	LDB #0004	;1876 D0 00 04
	SAB		;1879 59
	BM @18bc	;187A 16 40
	LDAB L_0b38	;187C 81 0B 38 ; fixupword
	LDBB #ae	;187F C0 AE
	SABB		;1881 49
	BNZ @18bc	;1882 15 38
	LDA #L_13a8	;1884 90 13 A8 ; fixupword
	XAY		;1887 5C
@1888:	LDA L_0b39	;1888 91 0B 39 ; fixupword
	LDB #dfdf	;188B D0 DF DF
	AND AW,BW	;188E 52 20
@1890:	LDB (YW+)	;1890 D5 61
	BZ @18bc	;1892 14 28
	SAB		;1894 59
	BZ @189e	;1895 14 07
	LDB #0003	;1897 D0 00 03
	ADD YW,BW	;189A 50 26
	JMP @1890	;189C 73 F2

@189E:	LDAB 0b3b	;189E 81 0B 3B ; fixupword
	LDBB #df	;18A1 C0 DF
	ANDB AL,BL	;18A3 42 31
	LDBB (YW+)	;18A5 C5 61
	SABB		;18A7 49
	BZ @18b0	;18A8 14 06
	INR YW,1	;18AA 30 60
	INR YW,1	;18AC 30 60
	JMP @1888	;18AE 73 D8

@18B0:	STAB (-SW)	;18B0 A5 A2
	CLAB		;18B2 2A
	STAB 1a03	;18B3 A1 1A 03 ; fixupword
	LDAB (SW+)	;18B6 85 A1
	JSR @(YW)	;18B8 7D 64
	JMP 1862	;18BA 73 A6

@18BC:	JSR E_18e5	;18BC 7B 27
	JMP 1862	;18BE 73 A2

@18C0:	JSR E_1e67	;18C0 79 1E 67 ; fixupword
	JSR E_1d25	;18C3 79 1D 25 ; fixupword
	LDAB L_1700	;18C6 81 17 00 ; fixupword
	BNZ @18ce	;18C9 15 03
	JSR E_1ca8	;18CB 79 1C A8 ; fixupword
@18CE:	LDAB 16ff	;18CE 81 16 FF ; fixupword
	BZ @18d6	;18D1 14 03
	JSR E_239c	;18D3 79 23 9C ; fixupword
@18D6:	JSR E_23ca	;18D6 79 23 CA ; fixupword
	CLA		;18D9 3A
	STA L_0aaf	;18DA B1 0A AF ; fixupword
	LDAB #8a	;18DD 80 8A
	STAB L_2490	;18DF A1 24 90 ; fixupword
	JMP E_0464	;18E2 71 04 64 ; fixupword


E_18E5:	JSR PushYZ	;18E5 79 22 ED ; fixupword
	LDAB 174a	;18E8 81 17 4A ; fixupword
	BZ @18f4	;18EB 14 07
	CLAB		;18ED 2A
	STAB L_174a	;18EE A1 17 4A ; fixupword
	JSR E_1cf2	;18F1 79 1C F2 ; fixupword
@18F4:	LDA L_170a	;18F4 91 17 0A ; fixupword
	BZ @18fc	;18F7 14 03
	JSR E_1ae4	;18F9 79 1A E4 ; fixupword
@18FC:	JSR E_1f04	;18FC 79 1F 04 ; fixupword
	DW L_0B36	;18FF 0B 36 ; fixupword
	DW L_0B38	;1901 0B 38 ; fixupword
	LDA L_14dd	;1903 91 14 DD ; fixupword
	LDB L_14d9	;1906 D1 14 D9 ; fixupword
	SAB		;1909 59
	BM @190f	;190A 16 03
	JMP L_22fa	;190C 71 22 FA ; fixupword

@190F:	JSR E_1edc	;190F 79 1E DC ; fixupword
	LDA L_14dd	;1912 91 14 DD ; fixupword
	LDB L_14d9	;1915 D1 14 D9 ; fixupword
	SAB		;1918 59
	BM @1924	;1919 16 09
@191B:	JSR E_1feb	;191B 79 1F EB ; fixupword
	JSR E_1f90	;191E 79 1F 90 ; fixupword
	JMP L_22fa	;1921 71 22 FA ; fixupword

@1924:	LDA L_156d	;1924 91 15 6D ; fixupword
	STA #0000	;1927 B0 00 00
	XAZ		;192A 5E
@192B:	LDAB (-ZW)	;192B 85 82
	LDB L_1701	;192D D1 17 01 ; fixupword
	SUB BW,ZW	;1930 51 82
	BP @1936	;1932 17 02
	JMP @191b	;1934 73 E5

@1936:	XABB		;1936 4D
	BM @1968	;1937 16 2F
	LDBB #04	;1939 C0 04
	SABB		;193B 49
	BZ @1953	;193C 14 15
	LDBB #02	;193E C0 02
	SABB		;1940 49
	BNZ @1984	;1941 15 41
	LDA fe(ZW)	;1943 95 88 FE
	LDB #0270	;1946 D0 02 70
	SAB		;1949 59
	BNZ @197b	;194A 15 2F
	LDAB #a0	;194C 80 A0
	STAB ff(ZW)	;194E A5 88 FF
	JMP @197b	;1951 73 28

@1953:	LDA L_14dd	;1953 91 14 DD ; fixupword
	LDB L_14d9	;1956 D1 14 D9 ; fixupword
	SAB		;1959 59
	BLE @192b	;195A 19 CF
	LDAB #ad	;195C 80 AD
	STAB (ZW)	;195E AC
	LDA L_14d9	;195F 91 14 D9 ; fixupword
	INA		;1962 38
	STA L_14d9	;1963 B1 14 D9 ; fixupword
	JMP @1984	;1966 73 1C

@1968:	LDBB #a0	;1968 C0 A0
	SABB		;196A 49
	BZ @1984	;196B 14 17
	LDBB #ad	;196D C0 AD
	SABB		;196F 49
	BZ @197b	;1970 14 09
@1972:	LDA L_14d9	;1972 91 14 D9 ; fixupword
	DCA		;1975 39
	STA L_14d9	;1976 B1 14 D9 ; fixupword
	JMP @192b	;1979 73 B0

@197B:	LDA L_14dd	;197B 91 14 DD ; fixupword
	LDB L_14d9	;197E D1 14 D9 ; fixupword
	SAB		;1981 59
	BM @1972	;1982 16 EE
@1984:	INR ZW,1	;1984 30 80
	XFR BW,ZW	;1986 55 82
	STB L_156d	;1988 F1 15 6D ; fixupword
	LDA L_1928	;198B 93 9B
	SAB		;198D 59
	BLE @19a4	;198E 19 14
	STB L_0b36	;1990 F1 0B 36 ; fixupword
	XFR XW,BW	;1993 55 24
	LDA #L_0b38	;1995 90 0B 38 ; fixupword
@1998:	LDBB (ZW+)	;1998 C5 81
	STBB (AW+)	;199A E5 01
	DCX		;199C 3F
	BNZ @1998	;199D 15 F9
	LDAB #01	;199F 80 01
	STAB L_1703	;19A1 A1 17 03 ; fixupword
@19A4:	JSR E_1edc	;19A4 79 1E DC ; fixupword
	JMP @191b	;19A7 71 19 1B ; fixupword


E_19AA: ; "SEC" command
	JSR E_2153	;19AA 79 21 53 ; fixupword
	LDA L_0c44	;19AD 91 0C 44 ; fixupword
	DCA		;19B0 39
	STA L_0c44	;19B1 B1 0C 44 ; fixupword
	CLA		;19B4 3A
	STA L_0d52	;19B5 B1 0D 52 ; fixupword
	LDB #L_0c44	;19B8 D0 0C 44 ; fixupword
	LDA (BW+)	;19BB 95 21
	XAY		;19BD 5C
	BZ @19e9	;19BE 14 29
	LDA #a0a0	;19C0 90 A0 A0
@19C3:	LDAB (BW+)	;19C3 85 21
	SUBB AL,AH	;19C5 41 01
	BNZ @19cf	;19C7 15 06
	DCR YW,1	;19C9 31 60
	BNZ @19c3	;19CB 15 F6
	JMP @19e9	;19CD 73 1A

@19CF:	DCR BW,1	;19CF 31 20
	STB L_19e7	;19D1 F3 14
	XFR AW,YW	;19D3 55 60
	LDB #0008	;19D5 D0 00 08
	SAB		;19D8 59
	BLE @19de	;19D9 19 03
	LDA #0008	;19DB 90 00 08
@19DE:	XAB		;19DE 5D
	STA L_0d52	;19DF B1 0D 52 ; fixupword
	JSR E_249f	;19E2 79 24 9F ; fixupword
	DW L_0D54	;19E5 0D 54 ; fixupword
	DW 0		;19E7 00 00
@19E9:	RSR		;19E9 09


E_19EA: ; "FLA" command
	JSR E_221a	;19EA 79 22 1A ; fixupword
	LDAB L_0b38	;19ED 81 0B 38 ; fixupword
	STAB L_1880	;19F0 A1 18 80 ; fixupword
	RSR		;19F3 09


E_19F4: ; "IND" command
	JSR Cmd_TAB	;19F4 7B 0E
	BL L_1a02	;19F6 10 0A
	LDAB #01	;19F8 80 01
	STAB L_1a03	;19FA A3 07
	LDA L_14d9	;19FC 91 14 D9 ; fixupword
	STA L_14e1	;19FF B1 14 E1 ; fixupword
L_1A02:	RSR		;1A02 09

L_1A03:	DB 00		;1A03 00


Cmd_TAB: ; "TAB" command
	JSR E_1e70	;1A04 79 1E 70 ; fixupword
	BL @1a1d	;1A07 10 14
	CLR BW,0	;1A09 32 20
	LDBB L_1a81	;1A0B C1 1A 81 ; fixupword
	AAB		;1A0E 58
	STB L_1a14	;1A0F F3 03
	JSR E_1e39	;1A11 79 1E 39 ; fixupword
	DW 0		;1A14 00 00
	LDA L_156d	;1A16 91 15 6D ; fixupword
	STA L_14df	;1A19 B1 14 DF ; fixupword
	RL		;1A1C 07
@1A1D:	RSR		;1A1D 09


E_1A1E: ; "UND" command
	LDA L_14dd	;1A1E 91 14 DD ; fixupword
	INR AW,4	;1A21 30 03
	STA L_14dd	;1A23 B1 14 DD ; fixupword
	LDA #0064	;1A26 90 00 64
	STA L_1a83	;1A29 B1 1A 83 ; fixupword
	LDAB L_1a81	;1A2C 81 1A 81 ; fixupword
	INRB AL,4	;1A2F 20 13
	STAB L_1a81	;1A31 A1 1A 81 ; fixupword
	LDAB #01	;1A34 80 01
	STAB L_1a80	;1A36 A3 48
	LDB L_156d	;1A38 D1 15 6D ; fixupword
	DCR BW,1	;1A3B 31 20
	LDAB #70	;1A3D 80 70
	XAYB		;1A3F 4C
	LDAB #02	;1A40 80 02
	XFRB YH,AL	;1A42 45 16
	LDAB (BW)	;1A44 89
	SUBB YL,AL	;1A45 41 17
	BNZ @1a4f	;1A47 15 06
	CLRB AL,1	;1A49 22 11
	STAB L_1a82	;1A4B A3 35
	JMP @1a55	;1A4D 73 06

@1A4F:	SUBB YH,AL	;1A4F 41 16
	BNZ @1a55	;1A51 15 02
	INR BW,1	;1A53 30 20
@1A55:	LDAB L_1a82	;1A55 83 2B
	BZ @1a67	;1A57 14 0E
	CLAB		;1A59 2A
	STAB L_1a82	;1A5A A3 26
	LDAB #70	;1A5C 80 70
	STAB (BW+)	;1A5E A5 21
	LDA L_14d9	;1A60 91 14 D9 ; fixupword
	INA		;1A63 38
	STA L_14d9	;1A64 B1 14 D9 ; fixupword
@1A67:	LDAB #02	;1A67 80 02
	STAB (BW+)	;1A69 A5 21
	LDA #9bb0	;1A6B 90 9B B0
	STA (BW+)	;1A6E B5 21
	LDAB #e0	;1A70 80 E0
	STAB (BW+)	;1A72 A5 21
	STB L_156d	;1A74 F1 15 6D ; fixupword
	LDA L_14d9	;1A77 91 14 D9 ; fixupword
	INR AW,4	;1A7A 30 03
	STA L_14d9	;1A7C B1 14 D9 ; fixupword
	RSR		;1A7F 09

L_1A80:	DB 00		;1A80 00
L_1A81:	DB 00		;1A81 00
L_1A82:	DB 00		;1A82 00
L_1A83:	DW 0000	;1A83 00 00

Cmd_EUN: ; "EUN" command
	CLAB		;1A85 2A
	STAB L_170a	;1A86 A1 17 0A ; fixupword
	LDA L_14dd	;1A89 91 14 DD ; fixupword
	INR AW,4	;1A8C 30 03
	STA L_14dd	;1A8E B1 14 DD ; fixupword
	LDAB L_1a81	;1A91 81 1A 81 ; fixupword
	INRB AL,4	;1A94 20 13
	STAB L_1a81	;1A96 A1 1A 81 ; fixupword
	CLAB		;1A99 2A
	STAB L_1a80	;1A9A A3 E4
E_1A9C:	LDB L_156d	;1A9C D1 15 6D ; fixupword
@1A9F:	DCR BW,1	;1A9F 31 20
	LDAB #70	;1AA1 80 70
	XAYB		;1AA3 4C
	LDAB #a0	;1AA4 80 A0
	XFRB YH,AL	;1AA6 45 16
	LDAB (BW)	;1AA8 89
	SUBB YL,AL	;1AA9 41 17
	BNZ @1ab3	;1AAB 15 06
	CLRB AL,1	;1AAD 22 11
	STAB L_1a82	;1AAF A3 D1
	JMP @1a9f	;1AB1 73 EC

@1AB3:	SUBB YH,AL	;1AB3 41 16
	BZ @1a9f	;1AB5 14 E8
	INR BW,1	;1AB7 30 20
	LDA #9bb0	;1AB9 90 9B B0
	STA (BW+)	;1ABC B5 21
	LDAB #c0	;1ABE 80 C0
	STAB (BW+)	;1AC0 A5 21
	LDAB #02	;1AC2 80 02
	STAB (BW+)	;1AC4 A5 21
	LDAB 1a82	;1AC6 83 BA
	BZ @1ad8	;1AC8 14 0E
	CLAB		;1ACA 2A
	STAB L_1a82	;1ACB A3 B5
	LDAB #70	;1ACD 80 70
	STAB (BW+)	;1ACF A5 21
	LDA L_14d9	;1AD1 91 14 D9 ; fixupword
	INA		;1AD4 38
	STA L_14d9	;1AD5 B1 14 D9 ; fixupword
@1AD8:	STB L_156d	;1AD8 F1 15 6D ; fixupword
	LDA L_14d9	;1ADB 91 14 D9 ; fixupword
	INR AW,4	;1ADE 30 03
	STA L_14d9	;1AE0 B1 14 D9 ; fixupword
	RSR		;1AE3 09


L_1AE4: ; "USW" command
	LDAB L_170a	;1AE4 81 17 0A ; fixupword
	BNZ @1af2	;1AE7 15 09
	CLRB AL,1	;1AE9 22 11
	STAB L_170a	;1AEB A1 17 0A ; fixupword
	JSR E_1a1e	;1AEE 79 1A 1E ; fixupword
	RSR		;1AF1 09

@1AF2:	JSR Cmd_EUN	;1AF2 79 1A 85 ; fixupword
	LDA L_14d9	;1AF5 91 14 D9 ; fixupword
	DCR AW,3	;1AF8 31 02
	STA L_14d9	;1AFA B1 14 D9 ; fixupword
	CLRB AL,1	;1AFD 22 11
	STAB L_170a	;1AFF A1 17 0A ; fixupword
	JSR E_1a1e	;1B02 79 1A 1E ; fixupword
	RSR		;1B05 09


E_1b06: ; "PAR" command
	JSR E_1e67	;1B06 79 1E 67 ; fixupword
	LDA L_14db	;1B09 91 14 DB ; fixupword
	STA L_14e1	;1B0C B1 14 E1 ; fixupword
	JSR E_1f90	;1B0F 79 1F 90 ; fixupword
	LDAB #01	;1B12 80 01
	STAB L_170d	;1B14 A1 17 0D ; fixupword
	LDA L_1738	;1B17 91 17 38 ; fixupword
	JSR E_2057	;1B1A 79 20 57 ; fixupword
	BL L_1b26	;1B1D 10 07
	JSR E_1d25	;1B1F 79 1D 25 ; fixupword
	JSR E_1cf2	;1B22 79 1C F2 ; fixupword
	RSR		;1B25 09

L_1B26:	LDA L_1740	;1B26 91 17 40 ; fixupword
	LDB L_1738	;1B29 D1 17 38 ; fixupword
	ADD AW,BW	;1B2C 50 20
	JSR E_1df9	;1B2E 79 1D F9 ; fixupword
	RSR		;1B31 09


E_1B32: ; "SUB" command
	LDAB #01	;1B32 80 01
	STAB L_1d74	;1B34 A1 1D 74 ; fixupword
	JSR E_21e1	;1B37 79 21 E1 ; fixupword
	JSR E_1b50	;1B3A 7B 14
	RSR		;1B3C 09


E_1B3D: ; "ESB" command
	CLAB		;1B3D 2A
	STAB L_1d74	;1B3E A1 1D 74 ; fixupword
	JSR E_1e67	;1B41 79 1E 67 ; fixupword
	JSR E_21c9	;1B44 79 21 C9 ; fixupword
	LDA L_14db	;1B47 91 14 DB ; fixupword
	STA L_14e1	;1B4A B1 14 E1 ; fixupword
	JSR E_1f90	;1B4D 79 1F 90 ; fixupword
E_1B50: ; "MAR" command
	JSR E_1e67	;1B50 79 1E 67 ; fixupword
	JSR E_1e70	;1B53 79 1E 70 ; fixupword
	BL @1b7e	;1B56 10 26
	XAB		;1B58 5D
	BLE @1b64	;1B59 19 09
	LDB #0085	;1B5B D0 00 85
	SAB		;1B5E 59
	BP @1b64	;1B5F 17 03
	STA L_14db	;1B61 B1 14 DB ; fixupword
@1B64:	JSR E_1e70	;1B64 79 1E 70 ; fixupword
	BL @1b78		;1B67 10 0F
	LDB #0086	;1B69 D0 00 86
	SAB		;1B6C 59
	BP @1b78	;1B6D 17 09
	LDB L_14db	;1B6F D1 14 DB ; fixupword
	SAB		;1B72 59
	BLE @1b78	;1B73 19 03
	STA L_14dd	;1B75 B1 14 DD ; fixupword
@1B78:	LDA L_14db	;1B78 91 14 DB ; fixupword
	STA L_14e1	;1B7B B1 14 E1 ; fixupword
@1B7E:	JSR E_1f90	;1B7E 79 1F 90 ; fixupword
	RSR		;1B81 09


Cmd_New: ; "NEW" command
	JSR E_1e67	;1B82 79 1E 67 ; fixupword
	JSR E_1f90	;1B85 79 1F 90 ; fixupword
	RSR		;1B88 09

Cmd_Jus: ; "JUStify command
	LDAB #01	;1B89 80 01
	STAB L_1704	;1B8B A1 17 04 ; fixupword
	RSR		;1B8E 09

Cmd_NoJ: ; "NOJustify command
	LDAB #00	;1B8F 80 00
	STAB L_1704	;1B91 A1 17 04 ; fixupword
	RSR		;1B94 09

Cmd_Spa: ; "SPA" command
	JSR E_1e70	;1B95 79 1E 70 ; fixupword
	BL @1baa	;1B98 10 10
	XAB		;1B9A 5D
	BLE @1baa	;1B9B 19 0D
	LDA L_14d9	;1B9D 91 14 D9 ; fixupword
	AAB		;1BA0 58
	DCR BW,1	;1BA1 31 20
	STB L_1ba8	;1BA3 F3 03
	JSR E_1e39	;1BA5 79 1E 39 ; fixupword
	DW 0		;1BA8 00 00
@1BAA:	RSR		;1BAA 09


E_1BAB: ; "DAS" command
	LDAB #00	;1BAB 80 00
	STAB L_1709	;1BAD A1 17 09 ; fixupword
	RSR		;1BB0 09

E_1BB1: ; "SKI" command
	JSR Cmd_New	;1BB1 7B CF
	JSR E_1e70	;1BB3 79 1E 70 ; fixupword
	BL @1bd2	;1BB6 10 1A
	XAB		;1BB8 5D
	BLE @1bd2	;1BB9 19 17
	STA (-SW)	;1BBB B5 A2
	JSR E_2057	;1BBD 79 20 57 ; fixupword
	BL @1bc8	;1BC0 10 06
	JSR 1d25	;1BC2 79 1D 25 ; fixupword
	JSR 1cf2	;1BC5 79 1C F2 ; fixupword
@1BC8:	LDA (SW+)	;1BC8 95 A1
	LDB 1740	;1BCA D1 17 40 ; fixupword
	ADD AW,BW	;1BCD 50 20
	JSR 1df9	;1BCF 79 1D F9 ; fixupword
@1BD2:	RSR		;1BD2 09

Cmd_Pag: ; "PAG" command
	JSR Cmd_New	;1BD3 7B AD
	JSR 1d25	;1BD5 79 1D 25 ; fixupword
	JSR 1cf2	;1BD8 79 1C F2 ; fixupword
	RSR		;1BDB 09

E_1BDC: ; "LIN" command
	JSR 1e70	;1BDC 79 1E 70 ; fixupword
	BL 1bea		;1BDF 10 09
	LDB #0008	;1BE1 D0 00 08
	SAB		;1BE4 59
	BM 1bea		;1BE5 16 03
	STA 173e	;1BE7 B1 17 3E ; fixupword
L_1BEA:	RSR		;1BEA 09

E_1BEB: ; "BOT" command
	JSR 1e70	;1BEB 79 1E 70 ; fixupword
	BL 1bf9		;1BEE 10 09
	LDB #0003	;1BF0 D0 00 03
	SAB		;1BF3 59
	BM 1bf9		;1BF4 16 03
	STA 173c	;1BF6 B1 17 3C ; fixupword
L_1BF9:	RSR		;1BF9 09


E_1BFA: ; "TOP" command
	JSR E_1e70	;1BFA 79 1E 70 ; fixupword
	BL @1c08	;1BFD 10 09
	LDB #4		;1BFF D0 00 04
	SAB		;1C02 59
	BM @1c08	;1C03 16 03
	STA L_173a	;1C05 B1 17 3A ; fixupword
@1C08:	RSR		;1C08 09


E_1C09: ; "NUM" command
	JSR E_1e70	;1C09 79 1E 70 ; fixupword
	BL @1c2f	;1C0C 10 21
	XAB		;1C0E 5D
	BM @1c26	;1C0F 16 15
	BGZ @1c1d	;1C11 18 0A
	CLA		;1C13 3A
	STA L_1744	;1C14 B1 17 44 ; fixupword
	LDAB #01	;1C17 80 01
	LDBB #00	;1C19 C0 00
	JMP @1c29	;1C1B 73 0C

@1C1D:	DCA		;1C1D 39
	STA 1744	;1C1E B1 17 44 ; fixupword
	LDAB #01	;1C21 80 01
	XAB		;1C23 5D
	JMP @1c29	;1C24 73 03

@1C26:	LDAB #00	;1C26 80 00
	XABB		;1C28 4D
@1C29:	STAB L_1742	;1C29 A1 17 42 ; fixupword
	STBB L_1743	;1C2C E1 17 43 ; fixupword
@1C2F:	RSR		;1C2F 09


E_1C30: ; "CEN" command
	LDAB L_174a	;1C30 81 17 4A ; fixupword
	BZ @1c3c	;1C33 14 07
	CLAB		;1C35 2A
	STAB L_174a	;1C36 A1 17 4A ; fixupword
	JSR E_1cf2	;1C39 79 1C F2 ; fixupword
@1C3C:	JSR Cmd_New	;1C3C 79 1B 82 ; fixupword
	JSR E_2153	;1C3F 79 21 53 ; fixupword
	STA @1c47	;1C42 B3 03
	JSR E_1e39	;1C44 79 1E 39 ; fixupword
@1c47:	DW 0		;1C47 00 00
	JSR E_1f04	;1C49 79 1F 04 ; fixupword
	DW L_0c44	;1C4C 0C 44 ; fixupword
	DW L_0c44+2	;1C4e 0C 46 ; fixupword
	JSR E_1B82	;1C50 79 1B 82
	RSR		;1c53 09


E_1c54: ; "HEA" command
	JSR PushYZ	;1c54 79 22 ed ; fixupword
	JSR E_2153	;1C57 79 21 53 ; fixupword
	DCA		;1C5A 39
	STA L_14e7	;1C5B B1 14 E7 ; fixupword
	JSR E_1e26	;1C5E 79 1E 26 ; fixupword
	DW L_14E7	;1C61 14 E7 ; fixupword
	LDA L_0c44	;1C63 91 0C 44 ; fixupword
	XAX		;1C66 5B
	LDB L_14e7	;1C67 D1 14 E7 ; fixupword
	ADD AW,BW	;1C6A 50 20
	STA L_14e7	;1C6C B1 14 E7 ; fixupword
	LDA #L_14e9	;1C6F 90 14 E9 ; fixupword
	AAB		;1C72 58
	LDA #L_0c46	;1C73 90 0C 46 ; fixupword
	XAY		;1C76 5C
@1C77:	LDAB (YW+)	;1C77 85 61
	STAB (BW+)	;1C79 A5 21
	DCX		;1C7B 3F
	BGZ @1c77	;1C7C 18 F9
	JMP 22fa	;1C7E 71 22 FA ; fixupword


E_1C81: ; "DOU" command
	LDA #0002	;1C81 90 00 02
	STA L_1738	;1C84 B1 17 38 ; fixupword
	RSR		;1C87 09


E_1C88: ; "SIN" command
	LDA #0001	;1C88 90 00 01
	STA L_1738	;1C8B B1 17 38 ; fixupword
	RSR		;1C8E 09


E_1C8F: ; "USA" command
	; "EUS" command
	RSR		;1C8F 09


E_1C90: ; "FIL" command
	RSR		;1C90 09


E_1C91: ; "EOF" command
	JSR E_22d1	;1C91 79 22 D1 ; fixupword
	BNL @1c9f	;1C94 11 09
	CLA		;1C96 3A
	STA L_0b36	;1C97 B1 0B 36 ; fixupword
	LDAB #01	;1C9A 80 01
	STAB L_1703	;1C9C A1 17 03 ; fixupword
@1C9F:	RSR		;1C9F 09


E_1CA0: ; "INS" command
	LDAB L_16ff	;1CA0 81 16 FF ; fixupword
	BZ @1ca7	;1CA3 14 02
	JSR E_1ca8	;1CA5 7B 01
@1CA7:	RSR		;1CA7 09


E_1CA8: ; Exchange lots of stuff???
	JSR PushYZ	;1CA8 79 22 ED ; fixupword
	LDBB L_1700	;1CAB C1 17 00 ; fixupword
	LDAB #01	;1CAE 80 01
	STAB L_1700	;1CB0 A1 17 00 ; fixupword
	SABB		;1CB3 49
	BNZ @1cb9	;1CB4 15 03
	STBB L_1700	;1CB6 E1 17 00 ; fixupword
@1CB9:	LDA L_0770	;1CB9 91 07 70 ; fixupword
	LDB L_174b	;1CBC D1 17 4B ; fixupword
	STA L_174b	;1CBF B1 17 4B ; fixupword
	STB L_0770	;1CC2 F1 07 70 ; fixupword
	LDA L_2297	;1CC5 91 22 97 ; fixupword
	LDB L_16fd	;1CC8 D1 16 FD ; fixupword
	STA L_16fd	;1CCB B1 16 FD ; fixupword
	STB L_2297	;1CCE F1 22 97 ; fixupword
	LDB L_174b	;1CD1 D1 17 4B ; fixupword
	LDA L_174d	;1CD4 91 17 4D ; fixupword
	LDB L_174f	;1CD7 D1 17 4F ; fixupword
	XAY		;1CDA 5C
	XFR ZW,BW	;1CDB 55 28
	STA L_174f	;1CDD B1 17 4F ; fixupword
	STB L_174d	;1CE0 F1 17 4D ; fixupword
	LDX #0086	;1CE3 60 00 86
@1CE6:	LDAB (YW)	;1CE6 8B
	LDBB (ZW)	;1CE7 CC
	STAB (ZW+)	;1CE8 A5 81
	STBB (YW+)	;1CEA E5 61
	DCX		;1CEC 3F
	BGZ @1ce6	;1CED 18 F7
	JMP L_22fa	;1CEF 71 22 FA ; fixupword

L_1CF2:	LDA 1744	;1CF2 91 17 44 ; fixupword
	LDB 1746	;1CF5 D1 17 46 ; fixupword
	SAB		;1CF8 59
	BP 1cff		;1CF9 17 04
	LDAB #00	;1CFB 80 00
L_1CFD:	JMP 1d01	;1CFD 73 02

L_1CFF:	LDAB #01	;1CFF 80 01
L_1D01:	STAB 2398	;1D01 A1 23 98 ; fixupword
	LDA 173a	;1D04 91 17 3A ; fixupword
	DCA		;1D07 39
	DCA		;1D08 39
	JSR 1df9	;1D09 79 1D F9 ; fixupword
	LDA 14e7	;1D0C 91 14 E7 ; fixupword
	BZ 1d1d		;1D0F 14 0C
	JSR E_231e	;1D11 79 23 1E ; fixupword
	DW L_14E7	;1D14 14 E7 ; fixupword
	LDA 1740	;1D16 91 17 40 ; fixupword
	INA		;1D19 38
	STA 1740	;1D1A B1 17 40 ; fixupword
L_1D1D:	LDA 173a	;1D1D 91 17 3A ; fixupword
	INA		;1D20 38
	JSR 1df9	;1D21 79 1D F9 ; fixupword
	RSR		;1D24 09

L_1D25:	LDAB L_174a	;1D25 81 17 4A ; fixupword
	BZ @1d2f	;1D28 14 05
	CLAB		;1D2A 2A
	STAB L_174a	;1D2B A1 17 4A ; fixupword
	RSR		;1D2E 09

@1D2F:	JSR PushYZ	;1D2F 79 22 ED ; fixupword
	LDAB L_1742	;1D32 81 17 42 ; fixupword
	LDBB #01	;1D35 C0 01
	SABB		;1D37 49
	BZ @1d3d	;1D38 14 03
	JMP L_1dc8	;1D3A 71 1D C8 ; fixupword

@1D3D:	LDX L_1744	;1D3D 61 17 44 ; fixupword
	INX		;1D40 3E
	STX L_1744	;1D41 69 17 44 ; fixupword
	XFR AW,XW	;1D44 55 40
	DCA		;1D46 39
	BNZ @1d4e	;1D47 15 05
	LDAB L_1743	;1D49 81 17 43 ; fixupword
	BZ L_1dc8	;1D4C 14 7A
@1D4E:	STX (-SW)	;1D4E 6D A2
	LDA L_173e	;1D50 91 17 3E ; fixupword
	LDB L_173c	;1D53 D1 17 3C ; fixupword
	SAB		;1D56 59
	XFR AW,BW	;1D57 55 20
	INA		;1D59 38
	INA		;1D5A 38
	INA		;1D5B 38
	JSR E_1df9	;1D5C 79 1D F9 ; fixupword
	LDAB L_1d74	;1D5F 81 1D 74 ; fixupword
	DCAB		;1D62 29
	BNZ L_1d75	;1D63 15 10
	LDA L_14e3	;1D65 91 14 E3 ; fixupword
	LDB L_14e5	;1D68 D1 14 E5 ; fixupword
	SAB		;1D6B 59
	SRR BW,1	;1D6C 34 20
	LDA L_14e5	;1D6E 91 14 E5 ; fixupword
	AAB		;1D71 58
	JMP L_1d82	;1D72 73 0E

L_1d74	DB 0		;1D74 00	variable

L_1D75:	LDA L_14dd	;1D75 91 14 DD ; fixupword
	LDB L_14db	;1D78 D1 14 DB ; fixupword
	SAB		;1D7B 59
	SRR BW,1	;1D7C 34 20
	LDA L_14db	;1D7E 91 14 DB ; fixupword
	AAB		;1D81 58
L_1D82:	XFR AW,BW	;1D82 55 20
	LDB L_0d52	;1D84 D1 0D 52 ; fixupword
	SRR BW,1	;1D87 34 20
	AAB		;1D89 58
	STB L_0c44	;1D8A F1 0C 44 ; fixupword
	LDA #L_0c44	;1D8D 90 0C 44 ; fixupword
	AAB		;1D90 58
	STB L_1d9c	;1D91 F3 09
	JSR E_1e26	;1D93 79 1E 26 ; fixupword
	DW L_0c44	;1D96 0C 44 ; fixupword
	OREB??? XL,ZL	;1D98 95
	STAB 662e	;1D99 A1 66 2E
@1D9C:	.dbyte 0	;1D9C 00 00
	LDA @1d9c	;1D9E 93 FC
	LDB #a0a0	;1DA0 D0 A0 A0
@1DA3:	LDBB (-AW)	;1DA3 C5 02
	SUBB BL,BH	;1DA5 41 23
	BNZ @1da3	;1DA7 15 FA
	LDB L_0d52	;1DA9 D1 0D 52 ; fixupword
	SAB		;1DAC 59
	INR BW,1	;1DAD 30 20
	STB L_1db8	;1DAF F3 07
	LDA L_0d52	;1DB1 91 0D 52 ; fixupword
	XAB		;1DB4 5D
	JSR E_249f	;1DB5 79 24 9F ; fixupword
	DW 0		;1DB8 00 00
	DW L_0D54	;1DBA 0D 54 ; fixupword
	JSR E_231E 	;1DBc 79 23 1E ; fixupword
	DW L_0C44	;1DBF 0C 44 ; fixupword
	??? L_1740	;1DC1 91 17 40 ; fixupword
	INA		;1DC4 38
	STA L_1740	;1DC5 B1 17 40 ; fixupword
L_1DC8:	LDA L_173e	;1DC8 91 17 3E ; fixupword
	INA		;1DCB 38
	INA		;1DCC 38
	JSR E_1df9	;1DCD 7B 2A
	LDA #0002	;1DCF 90 00 02
	STA L_1740	;1DD2 B1 17 40 ; fixupword
	LDAB L_1707	;1DD5 81 17 07 ; fixupword
	BZ @1de1	;1DD8 14 07
	LDAB L_2398	;1DDA 81 23 98 ; fixupword
	BNZ @1df6	;1DDD 15 17
	JMP @1df0	;1DDF 73 0F

@1DE1:	LDA #6		;1DE1 90 00 06
	JSR E_1df9	;1DE4 7B 13
	LDAB L_2398	;1DE6 81 23 98 ; fixupword
	BZ @1df0	;1DE9 14 05
	JSR E_2437	;1DEB 79 24 37 ; fixupword
	DW L_0c44	;1DEE 0C 44 ; fixupword
@1df0:	?? #1		;1df0 90 00 01
	STA 1740	;1DF3 B1 17 40 ; fixupword
@1DF6:	JMP L_22fa	;1DF6 71 22 FA ; fixupword

E_1DF9:	LDB L_1740	;1DF9 D1 17 40 ; fixupword
	SAB		;1DFC 59
	BGZ @1e00	;1DFD 18 01
	RSR		;1DFF 09

@1E00:	JSR PushYZ	;1E00 79 22 ED ; fixupword
	LDA 1740	;1E03 91 17 40 ; fixupword
	ADD AW,BW	;1E06 50 20
	STA 1740	;1E08 B1 17 40 ; fixupword
	STX (-SW)	;1E0B 6D A2
	XFR XW,BW	;1E0D 55 24
@1E0F:	LDA #0001	;1E0F 90 00 01
	STA 1e22	;1E12 B1 1E 22 ; fixupword
	JSR E_231e	;1E15 79 23 1E ; fixupword
	DW L_1e22	;1E18 1E 22 ; fixupword
	DCX		;1E1A 3F
	BGZ @1e0f	;1E1B 18 F2
	LDX (SW+)	;1E1D 65 A1
	JMP 22fa	;1E1F 71 22 FA ; fixupword

	DB 00	;1E22
	DB 01	;1E23
	DB A0 ; 	;1E24
	DB A0 ; 	;1E25

E_1E26:	LDA (XW+)	;1E26 95 41
	JSR PushYZ	;1E28 79 22 ED ; fixupword
	LDB (AW+)	;1E2B D5 01
	XAX		;1E2D 5B
	LDAB #a0	;1E2E 80 A0
@1E30:	STAB (XW+)	;1E30 A5 41
	DCR BW,1	;1E32 31 20
	BNZ @1e30	;1E34 15 FA
	JMP L_22fa	;1E36 71 22 FA ; fixupword

	LDA (XW+)	;1E39 95 41
	LDB L_14d9	;1E3B D1 14 D9 ; fixupword
	SAB		;1E3E 59
	BGZ @1e42	;1E3F 18 01
	RSR		;1E41 09

@1E42:	JSR PushYZ	;1E42 79 22 ED ; fixupword
	XFR XW,BW	;1E45 55 24
	LDB L_14dd	;1E47 D1 14 DD ; fixupword
	SAB		;1E4A 59
	BP @1e64	;1E4B 17 17
	LDA L_156d	;1E4D 91 15 6D ; fixupword
	XAY		;1E50 5C
	LDA L_14d9	;1E51 91 14 D9 ; fixupword
	LDBB #a0	;1E54 C0 A0
@1E56:	STBB (YW+)	;1E56 E5 61
	INA		;1E58 38
	DCX		;1E59 3F
	BNZ @1e56	;1E5A 15 FA
	STA L_14d9	;1E5C B1 14 D9 ; fixupword
	XFR AW,YW	;1E5F 55 60
	STA L_156d	;1E61 B1 15 6D ; fixupword
@1E64:	JMP 22fa	;1E64 71 22 FA ; fixupword

E_1E67:	LDAB L_1708	;1E67 81 17 08 ; fixupword
	BZ @1e6f	;1E6A 14 03
	JSR E_1ff7	;1E6C 79 1F F7 ; fixupword
@1E6F:	RSR		;1E6F 09


E_1E70:	JSR E_221a	;1E70 79 22 1A ; fixupword
	JSR E_1e81	;1E73 7B 0C
@1e75:	DW 0		;1E75 00 00
	LDA @1e75	;1E77 93 FC
	BNL @1e80	;1E79 11 05
	LDBB #01	;1E7B C0 01
	STBB L_1703	;1E7D E1 17 03 ; fixupword
@1E80:	RSR		;1E80 09


L_1E81:	CLA		;1E81 3A
	STA (XW)	;1E82 BA
	XFR AW,YW	;1E83 55 60
	STA (-SW)	;1E85 B5 A2
	XFR AW,ZW	;1E87 55 80
	STA (-SW)	;1E89 B5 A2
	LDA #L_0b38	;1E8B 90 0B 38 ; fixupword
	XAY		;1E8E 5C
	LDA L_0b36	;1E8F 91 0B 36 ; fixupword
	XAZ		;1E92 5E
	BLE L_1ed9	;1E93 19 44
	CLA		;1E95 3A
L_1e96:	STAB #00	;1E96 A0 00
L_1E98:	DCR ZW,1	;1E98 31 80
	BP L_1eae	;1E9A 17 12
	LDAB L_1e96+1	;1E9C 83 F9
	BZ @1ea4	;1E9E 14 04
	LDA (XW)	;1EA0 9A
	IVA		;1EA1 3B
	INA		;1EA2 38
	STA (XW)	;1EA3 BA
@1EA4:	RL		;1EA4 07
L_1EA5:	LDA (SW+)	;1EA5 95 A1
	XAZ		;1EA7 5E
	LDA (SW+)	;1EA8 95 A1
	XAY		;1EAA 5C
	INX		;1EAB 3E
	INX		;1EAC 3E
	RSR		;1EAD 09

L_1EAE:	LDAB (YW+)	;1EAE 85 61
	LDBB #ad	;1EB0 C0 AD
	SABB		;1EB2 49
	BZ @1eba	;1EB3 14 05
	LDBB #04	;1EB5 C0 04
	SABB		;1EB7 49
	BNZ L_1ebe	;1EB8 15 04
@1EBA:	STAB L_1e96+1	;1EBA A3 DB
	JMP L_1e98	;1EBC 73 DA

L_1EBE:	LDBB #b0	;1EBE C0 B0
	SABB		;1EC0 49
	BM L_1ed9	;1EC1 16 16
	LDAB #09	;1EC3 80 09
	SUBB AL,BL	;1EC5 41 31
	BGZ L_1ed9	;1EC7 18 10
	STBB (-SW)	;1EC9 E5 A2
	LDA (XW)	;1ECB 9A
	SLA		;1ECC 3D
	SLA		;1ECD 3D
	LDB (XW)	;1ECE DA
	AAB		;1ECF 58
	SLR BW,1	;1ED0 35 20
	CLA		;1ED2 3A
	LDAB (SW+)	;1ED3 85 A1
	AAB		;1ED5 58
	STB (XW)	;1ED6 FA
	JMP L_1e98	;1ED7 73 BF

L_1ED9:	SL		;1ED9 06
	JMP L_1ea5	;1EDA 73 C9


E_1EDC:	STX (-SW)	;1EDC 6D A2
	LDX 156d	;1EDE 61 15 6D ; fixupword
@1EE1:	LDAB (-XW)	;1EE1 85 42
	LDB L_1701	;1EE3 D1 17 01 ; fixupword
	SUB BW,XW	;1EE6 51 42
	BLE @1efd	;1EE8 19 13
	LDBB #a0	;1EEA C0 A0
	SABB		;1EEC 49
	BZ @1ef4	;1EED 14 05
	LDBB #70	;1EEF C0 70
	SABB		;1EF1 49
	BNZ @1efd	;1EF2 15 09
@1EF4:	LDA L_14d9	;1EF4 91 14 D9 ; fixupword
	DCA		;1EF7 39
	STA L_14d9	;1EF8 B1 14 D9 ; fixupword
	JMP @1ee1	;1EFB 73 E4

@1EFD:	INX		;1EFD 3E
	STX L_156d	;1EFE 69 15 6D ; fixupword
	LDX (SW+)	;1F01 65 A1
	RSR		;1F03 09


E_1F04:	LDAB #01	;1F04 80 01
	STAB 1708	;1F06 A1 17 08 ; fixupword
	LDA @(XW+)	;1F09 95 45
	LDB (XW+)	;1F0B D5 41
	JSR PushYZ	;1F0D 79 22 ED ; fixupword
	XAX		;1F10 5B
	BNZ @1f16	;1F11 15 03
	JMP L_22fa	;1F13 71 22 FA ; fixupword

@1F16:	XFR YW,BW	;1F16 55 26
	LDA L_156d	;1F18 91 15 6D ; fixupword
	XAZ		;1F1B 5E
	LDAB ff(ZW)	;1F1C 85 88 FF
	LDBB #e0	;1F1F C0 E0
	SABB		;1F21 49
	BNZ @1f40	;1F22 15 1C
	LDAB 02(YW)	;1F24 85 68 02
	LDBB #e0	;1F27 C0 E0
	SABB		;1F29 49
	BNZ @1f40	;1F2A 15 14
	INR YW,3	;1F2C 30 62
	DCR XW,3	;1F2E 31 42
	LDA L_14dd	;1F30 91 14 DD ; fixupword
	DCR AW,3	;1F33 31 02
	STA L_14dd	;1F35 B1 14 DD ; fixupword
	LDAB L_1a81	;1F38 81 1A 81 ; fixupword
	DCRB AL,3	;1F3B 21 12
	STAB L_1a81	;1F3D A1 1A 81 ; fixupword
@1F40:	LDAB (YW+)	;1F40 85 61
	STAB (ZW+)	;1F42 A5 81
	LDBB #04	;1F44 C0 04
	SABB		;1F46 49
	BZ @1f51	;1F47 14 08
	LDB L_14d9	;1F49 D1 14 D9 ; fixupword
	INR BW,1	;1F4C 30 20
	STB L_14d9	;1F4E F1 14 D9 ; fixupword
@1F51:	DCX		;1F51 3F
	BGZ @1f40	;1F52 18 EC
	LDBB #a2	;1F54 C0 A2
	SABB		;1F56 49
	BNZ @1f5d	;1F57 15 04
	DCR YW,1	;1F59 31 60
	LDAB (-YW)	;1F5B 85 62
@1F5D:	JSR E_2205	;1F5D 79 22 05 ; fixupword
	DB AE		;1F60 AE		chars to match
	DB BA		;1F61 BA
	DB BF		;1F62 BF
	DB A1		;1F63 A1
	DB 0		;1f64 00
	B?? @1f7D	;1f65 11 16
	??? L_1705	;1F67 91 17 05 ; fixupword
	BZ @1f72	;1F6A 14 06
	LDB #0002	;1F6C D0 00 02
	SAB		;1F6F 59
	BM @1f7d	;1F70 16 0B
@1F72:	LDAB #a0	;1F72 80 A0
	STAB (ZW+)	;1F74 A5 81
	LDA L_14d9	;1F76 91 14 D9 ; fixupword
	INA		;1F79 38
	STA L_14d9	;1F7A B1 14 D9 ; fixupword
@1F7D:	LDAB #70	;1F7D 80 70
	STAB (ZW+)	;1F7F A5 81
	LDA L_14d9	;1F81 91 14 D9 ; fixupword
	INA		;1F84 38
	STA L_14d9	;1F85 B1 14 D9 ; fixupword
	XFR AW,ZW	;1F88 55 80
	STA L_156d	;1F8A B1 15 6D ; fixupword
	JMP L_22fa	;1F8D 71 22 FA ; fixupword


E_1F90:	JSR PushYZ	;1F90 79 22 ED ; fixupword
	AABB???		;1F93 47 9C FE A0 15 6F ; fixupword
	LDA #L_156f	;1F99 90 15 6F ; fixupword
	XAY		;1F9C 5C
	LDA L_14e1	;1F9D 91 14 E1 ; fixupword
	LDBB L_1a03	;1FA0 C1 1A 03 ; fixupword
	BZ @1fb0	;1FA3 14 0B
	CLR BW,0	;1FA5 32 20
	LDBB L_1a81	;1FA7 C1 1A 81 ; fixupword
	SAB		;1FAA 59
	XFR AW,BW	;1FAB 55 20
	STA L_14e1	;1FAD B1 14 E1 ; fixupword
@1FB0:	STA L_14d9	;1FB0 B1 14 D9 ; fixupword
	LDBB #a0	;1FB3 C0 A0
@1FB5:	DCA		;1FB5 39
	BLE @1fbc	;1FB6 19 04
	STBB (YW+)	;1FB8 E5 61
	JMP @1fb5	;1FBA 73 F9

@1FBC:	XFR AW,YW	;1FBC 55 60
	STA L_156d	;1FBE B1 15 6D ; fixupword
	STA L_1701	;1FC1 B1 17 01 ; fixupword
	STA L_14df	;1FC4 B1 14 DF ; fixupword
	LDAB L_1a81	;1FC7 81 1A 81 ; fixupword
	BNZ @1fcf	;1FCA 15 03
	JMP L_22fa	;1FCC 71 22 FA ; fixupword

@1FCF:	LDAB 1a81	;1FCF 81 1A 81 ; fixupword
	LDB L_14dd	;1FD2 D1 14 DD ; fixupword
@1FD5:	DCR BW,1	;1FD5 31 20
	DCAB		;1FD7 29
	BNZ @1fd5	;1FD8 15 FB
	STAB L_1a81	;1FDA A1 1A 81 ; fixupword
	STB L_14dd	;1FDD F1 14 DD ; fixupword
	LDAB L_1a80	;1FE0 81 1A 80 ; fixupword
	BZ @1fe8	;1FE3 14 03
	JSR E_1a1e	;1FE5 79 1A 1E ; fixupword
@1FE8:	JMP L_22fa	;1FE8 71 22 FA ; fixupword


E_1FEB:	LDAB 1704	;1FEB 81 17 04 ; fixupword
	BZ @1ff3	;1FEE 14 03
	JSR E_20bc	;1FF0 79 20 BC ; fixupword
@1FF3:	JSR E_1ff7	;1FF3 79 1F F7 ; fixupword
	RSR		;1FF6 09


E_1FF7:	JSR PushYZ	;1FF7 79 22 ED ; fixupword
	STB (-SW)	;1FFA F5 A2
	LDAB L_1a80	;1FFC 81 1A 80 ; fixupword
	BZ @2015	;1FFF 14 14
	LDA L_156d	;2001 91 15 6D ; fixupword
	LDB (AW)	;2004 D8
	LDA #9bb0	;2005 90 9B B0
	SAB		;2008 59
	BZ @2012	;2009 14 07
	LDA L_156d	;200B 91 15 6D ; fixupword
	INA		;200E 38
	STA L_156d	;200F B1 15 6D ; fixupword
@2012:	JSR E_1a9c	;2012 79 1A 9C ; fixupword
@2015:	LDB (SW+)	;2015 D5 A1
	CLA		;2017 3A
	INA		;2018 38
	JSR E_2057	;2019 7B 3C
	BL @2023	;201B 10 06
	JSR E_1d25	;201D 79 1D 25 ; fixupword
	JSR E_1cf2	;2020 79 1C F2 ; fixupword
@2023:	LDA #L_0bbd	;2023 90 0B BD ; fixupword
	STA L_202d	;2026 B3 05
	JSR E_2070	;2028 7B 46
	JSR E_231e	;202A 79 23 1E ; fixupword
	DW 0		;202D 00 00
	LDAB #00	;202F 80 00
	STAB L_1708	;2031 A1 17 08 ; fixupword
	LDA L_1740	;2034 91 17 40 ; fixupword
	INA		;2037 38
	STA L_1740	;2038 B1 17 40 ; fixupword
	LDA L_1738	;203B 91 17 38 ; fixupword
	DCA		;203E 39
	BLE @2054	;203F 19 13
	JSR E_2057	;2041 7B 14
	BL @204d	;2043 10 08
	JSR E_1d25	;2045 79 1D 25 ; fixupword
	JSR E_1cf2	;2048 79 1C F2 ; fixupword
	JMP @2054	;204B 73 07

@204D:	LDA L_1740	;204D 91 17 40 ; fixupword
	INA		;2050 38
	JSR E_1df9	;2051 79 1D F9 ; fixupword
@2054:	JMP L_22fa	;2054 71 22 FA ; fixupword


E_2057:	STX (-SW)	;2057 6D A2
	XAX		;2059 5B
	LDA L_173e	;205A 91 17 3E ; fixupword
	LDB L_173c	;205D D1 17 3C ; fixupword
	SAB		;2060 59
	LDA L_1740	;2061 91 17 40 ; fixupword
	ADD AW,XW	;2064 50 40
	LDX (SW+)	;2066 65 A1
	DCA		;2068 39
	SAB		;2069 59
	BLE @206e	;206A 19 02
	RL		;206C 07
	RSR		;206D 09

@206E:	SL		;206E 06
	RSR		;206F 09


E_2070:	JSR PushYZ	;2070 79 22 ED ; fixupword
	LDA #$0084	;2073 90 00 84
	STA L_0c44	;2076 B1 0C 44 ; fixupword
	JSR E_1e26	;2079 79 1E 26 ; fixupword
	DW L_0C44	;207C 0C 44 ; fixupword
	CLA		;207e 3A
	STA L_170b	;207F B1 17 0B ; fixupword
	STA L_0c44	;2082 B1 0C 44 ; fixupword
	LDA L_202d	;2085 93 A6
	INA		;2087 38
	INA		;2088 38
	XAZ		;2089 5E
	LDA L_156d	;208A 91 15 6D ; fixupword
	LDX #L_156f	;208D 60 15 6F ; fixupword
	XFR YW,XW	;2090 55 46
	SUB XW,AW	;2092 51 04
@2094:	LDAB (YW+)	;2094 85 61
	DCX		;2096 3F
	BM @20af	;2097 16 16
	XABB		;2099 4D
	BP @20a0	;209A 17 04
	STAB (ZW+)	;209C A5 81
	JMP @2094	;209E 73 F4

@20A0:	LDBB #70	;20A0 C0 70
	SABB		;20A2 49
	BM @20ad	;20A3 16 08
	LDAB #a0	;20A5 80 A0
@20A7:	STAB (ZW+)	;20A7 A5 81
	DCRB BL,1	;20A9 21 30
	BP @20a7	;20AB 17 FA
@20AD:	JMP @2094	;20AD 73 E5

@20AF:	LDA L_202d	;20AF 91 20 2D ; fixupword
	XAX		;20B2 5B
	INX		;20B3 3E
	INX		;20B4 3E
	SUB XW,ZW	;20B5 51 84
	STX (AW)	;20B7 6D 00
	JMP L_22fa	;20B9 71 22 FA ; fixupword


E_20BC:	JSR PushYZ	;20BC 79 22 ED ; fixupword
	LDA L_14dd	;20BF 91 14 DD ; fixupword
	LDX L_14d9	;20C2 61 14 D9 ; fixupword
	SUB XW,AW	;20C5 51 04
	BLE @2126	;20C7 19 5D
	LDA L_14df	;20C9 91 14 DF ; fixupword
	LDB L_156d	;20CC D1 15 6D ; fixupword
	SAB		;20CF 59
	BM @20dc	;20D0 16 0A
	BZ @2126	;20D2 14 52
	LDB L_156d	;20D4 D1 15 6D ; fixupword
	XFR YW,BW	;20D7 55 26
	XAZ		;20D9 5E
	JMP @20e4	;20DA 73 08

@20DC:	LDA L_14df	;20DC 91 14 DF ; fixupword
	XAY		;20DF 5C
	LDA L_156d	;20E0 91 15 6D ; fixupword
	XAZ		;20E3 5E
@20E4:	LDAB #00	;20E4 80 00
	STAB L_211f	;20E6 A3 37
	XFR AW,YW	;20E8 55 60
	STA (-SW)	;20EA B5 A2
	XFR AW,ZW	;20EC 55 80
	STA (-SW)	;20EE B5 A2
	LDAB L_170d	;20F0 81 17 0D ; fixupword
	LDBB #01	;20F3 C0 01
	SABB		;20F5 49
	BZ @2129	;20F6 14 31
	LDAB #01	;20F8 80 01
	STAB L_170d	;20FA A1 17 0D ; fixupword
	LDAB #70	;20FD 80 70
@20FF:	LDBB (YW+)	;20FF C5 61
	SABB		;2101 49
	BNZ @2111	;2102 15 0D
	XABB		;2104 4D
	INRB BL,1	;2105 20 30
	STBB FF(YW)	;2107 E5 68 FF
	LDBB #01	;210A C0 01
	STBB @211e+1	;210C E3 11
	DCX		;210E 3F
	BZ @2122	;210F 14 11
@2111:	LDB (SW)	;2111 DD
	SUB BW,YW	;2112 51 62
	BNZ @20ff	;2114 15 E9
	INAB		;2116 28
	BM @2122	;2117 16 09
	LDB 02(SW)	;2119 D5 A8 02
	XFR YW,BW	;211C 55 26
@211e:	LDBB #00	;211E C0 00
	BNZ @20ff	;2120 15 DD
@2122:	LDA (SW+)	;2122 95 A1
	LDA (SW+)	;2124 95 A1
@2126:	JMP L_22fa	;2126 71 22 FA ; fixupword

@2129:	LDAB #00	;2129 80 00
	STAB L_170d	;212B A1 17 0D ; fixupword
	LDAB #70	;212E 80 70
@2130:	LDBB (-ZW)	;2130 C5 82
	SABB		;2132 49
	BNZ @2140	;2133 15 0B
	XABB		;2135 4D
	INRB BL,1	;2136 20 30
	STBB (ZW)	;2138 EC
	LDBB #01	;2139 C0 01
	STBB @211e+1	;213B E3 E2
	DCX		;213D 3F
	BZ @2122	;213E 14 E2
@2140:	LDB 02(SW)	;2140 D5 A8 02
	SUB BW,ZW	;2143 51 82
	BNZ @2130	;2145 15 E9
	INAB		;2147 28
	BM @2122	;2148 16 D8
	LDB (SW)	;214A DD
	XFR ZW,BW	;214B 55 28
	LDBB L_211f	;214D C3 D0
	BZ @2122	;214F 14 D1
	JMP @2130	;2151 73 DD


E_2153:	JSR PushYZ	;2153 79 22 ED ; fixupword
	LDA #0084	;2156 90 00 84
	STA L_0c44	;2159 B1 0C 44 ; fixupword
	JSR E_1e26	;215C 79 1E 26 ; fixupword
	DW L_0c44	;215F 0C 44 ; fixupword
	JSR E_221A	;2161 79 22 1A ; fixupword
	LDA L_1705	;2164 91 17 05 ; fixupword
	STA L_0c44	;2167 B1 0C 44 ; fixupword
	LDAB L_0b38	;216A 81 0B 38 ; fixupword
	XAZB		;216D 4E
L_216E:	JSR E_221a	;216E 79 22 1A ; fixupword
	LDA L_0b36	;2171 91 0B 36 ; fixupword
	BZ L_21ae	;2174 14 38
	XAX		;2176 5B
	LDAB L_0b38	;2177 81 0B 38 ; fixupword
	SUBB AL,ZL	;217A 41 91
	BZ L_21ae	;217C 14 30
	LDA L_0c44	;217E 91 0C 44 ; fixupword
	LDB #L_0c46	;2181 D0 0C 46 ; fixupword
	AAB		;2184 58
	XFR YW,BW	;2185 55 26
	ADD AW,XW	;2187 50 40
	LDB L_1705	;2189 D1 17 05 ; fixupword
	AAB		;218C 58
	LDA #0085	;218D 90 00 85
	SUB AW,BW	;2190 51 20
	BP L_216e	;2192 17 DA
	STB L_0c44	;2194 F1 0C 44 ; fixupword
	LDB #L_0b38	;2197 D0 0B 38 ; fixupword
L_219A:	LDAB (BW+)	;219A 85 21
	STB (-SW)	;219C F5 A2
	LDBB #04	;219E C0 04
	SABB		;21A0 49
	BNZ L_21a5	;21A1 15 02
	LDAB #ad	;21A3 80 AD
L_21A5:	LDB (SW+)	;21A5 D5 A1
	STAB (YW+)	;21A7 A5 61
	DCX		;21A9 3F
	BGZ L_219a	;21AA 18 EE
	JMP L_216e	;21AC 73 C0

L_21AE:	LDA L_14dd	;21AE 91 14 DD ; fixupword
	LDB L_14db	;21B1 D1 14 DB ; fixupword
	SAB		;21B4 59
	LDA L_0c44	;21B5 91 0C 44 ; fixupword
	SUB AW,BW	;21B8 51 20
	BP @21c0	;21BA 17 04
	STB L_0c44	;21BC F1 0C 44 ; fixupword
	CLA		;21BF 3A
@21C0:	SRA		;21C0 3C
	LDB L_14db	;21C1 D1 14 DB ; fixupword
	ADD AW,BW	;21C4 50 20
	JMP L_22fa	;21C6 71 22 FA ; fixupword

L_21C9:	LDA L_170e	;21C9 91 17 0E ; fixupword
	LDB #L_1710	;21CC D0 17 10 ; fixupword
	SAB		;21CF 59
	BGZ @21d3	;21D0 18 01
	RSR		;21D2 09

@21D3:	LDB (-AW)	;21D3 D5 02
	STB 14dd	;21D5 F1 14 DD ; fixupword
	LDB (-AW)	;21D8 D5 02
	STB L_14db	;21DA F1 14 DB ; fixupword
	STA L_170e	;21DD B1 17 0E ; fixupword
	RSR		;21E0 09

E_21E1:	LDA L_14dd	;21E1 91 14 DD ; fixupword
	STA L_14e3	;21E4 B1 14 E3 ; fixupword
	LDA L_14db	;21E7 91 14 DB ; fixupword
	STA L_14e5	;21EA B1 14 E5 ; fixupword
	LDA L_170e	;21ED 91 17 0E ; fixupword
	LDB #L_1737	;21F0 D0 17 37 ; fixupword
	SAB		;21F3 59
	BLE @21f7	;21F4 19 01
	RSR		;21F6 09

@21F7:	LDB L_14db	;21F7 D1 14 DB ; fixupword
	STB (AW+)	;21FA F5 01
	LDB 14dd	;21FC D1 14 DD ; fixupword
	STB (AW+)	;21FF F5 01
	STA L_170e	;2201 B1 17 0E ; fixupword
	RSR		;2204 09


L_2205:	LDBB #01	;2205 C0 01
	STBB (-SW)	;2207 E5 A2
@2209:	LDBB (XW+)	;2209 C5 41
	BZ @2213	;220B 14 06
	SABB		;220D 49
	BNZ @2209	;220E 15 F9
	STBB (SW)	;2210 ED
	JMP @2209	;2211 73 F6

@2213:	LDBB (SW+)	;2213 C5 A1
	IVRB BL,0	;2215 23 30
	SRRB BL,1	;2217 24 30
	RSR		;2219 09


E_221A:	JSR PushYZ	;221A 79 22 ED ; fixupword
@221D:	CLA		;221D 3A
	STA L_0b36	;221E B1 0B 36 ; fixupword
	STA L_1705	;2221 B1 17 05 ; fixupword
	STAB L_223d	;2224 A3 17
	INAB		;2226 28
	STAB L_2257	;2227 A3 2E
	LDA #L_0b38	;2229 90 0B 38 ; fixupword
	STA L_2270+1	;222C B3 43
@222e:	JSR E_2296	;222E 7B 66
	LDBB #a0	;2230 C0 A0
	SABB		;2232 49
	BNZ @2239	;2233 15 04
	STAB @223c+1	;2235 A3 06
	JMP @222e	;2237 73 F5

@2239:	XABB		;2239 4D
	BNZ L_2244	;223A 15 08
@223c:	LDBB #00	;223C C0 00
	BNZ @221d	;223E 15 DD
	JMP L_2244	;2240 73 02

L_2242:	JSR 2296	;2242 7B 52
L_2244:	XABB		;2244 4D
	BNZ 2251	;2245 15 0A
	LDBB 2257	;2247 C3 0E
	BNZ L_228f	;2249 15 44
	INRB BL,1	;224B 20 30
	STBB 2257	;224D E3 08
	JMP 2242	;224F 73 F1

L_2251:	LDBB #ad	;2251 C0 AD
	SABB		;2253 49
	BNZ 2261	;2254 15 0B
	STBB #00	;2256 E0 00
	LDBB 1709	;2258 C1 17 09 ; fixupword
	BZ L_2261	;225B 14 04
	LDAB #04	;225D 80 04
	JMP 2263	;225F 73 02

L_2261:	STBB L_2257	;2261 E3 F4
L_2263:	LDBB #a0	;2263 C0 A0
	SABB		;2265 49
	BZ @2279	;2266 14 11
	LDB L_0b36	;2268 D1 0B 36 ; fixupword
	INR BW,1	;226B 30 20
	STB L_0b36	;226D F1 0B 36 ; fixupword
@2270:	LDB #0000	;2270 D0 00 00
	STAB (BW+)	;2273 A5 21
	STB @2270+1	;2275 F3 FA
	JMP L_2242	;2277 73 C9

@2279:	LDA L_1705	;2279 91 17 05 ; fixupword
	INA		;227C 38
	STA L_1705	;227D B1 17 05 ; fixupword
	JSR E_2296	;2280 7B 14
	XABB		;2282 4D
	BZL_ 228f	;2283 14 0A
	LDBB #a0	;2285 C0 A0
	SABB		;2287 49
	BZ @2279	;2288 14 EF
	LDA 2297	;228A 93 0B
	DCA		;228C 39
	STA 2297	;228D B3 08
L_228F:	LDAB #01	;228F 80 01
	STAB 1709	;2291 A1 17 09 ; fixupword
	JMP 22fa	;2294 73 64

L_2296:	LDA #0000	;2296 90 00 00
@2299:	INA		;2299 38
	STA L_2297	;229A B3 FB
	LDB L_0aaf	;229C D1 0A AF ; fixupword
	SAB		;229F 59
	BLE @22ad	;22A0 19 0B
	DCR BW,1	;22A2 31 20
	BZ @22ab	;22A4 14 05
	JSR E_22b3	;22A6 7B 0B
	CLA		;22A8 3A
	JMP @2299	;22A9 73 EE

@22AB:	CLA		;22AB 3A
	RSR		;22AC 09

@22AD:	LDB #L_0ab0	;22AD D0 0A B0 ; fixupword
	AAB		;22B0 58
	LDAB (BW)	;22B1 89
	RSR		;22B2 09

L_22B3:	JSR 0805	;22B3 79 08 05 ; fixupword
	BNL @22d0	;22B6 11 18
	JSR 22d1	;22B8 7B 17
	BNL 22b3	;22BA 11 F7
	STX (-SW)	;22BC 6D A2
	LDX #L_0ab1	;22BE 60 0A B1 ; fixupword
	LDA #000a	;22C1 90 00 0A
	LDBB #00	;22C4 C0 00
	STA L_0aaf	;22C6 B1 0A AF ; fixupword
@22C9:	STBB (XW+)	;22C9 E5 41
	DCAB		;22CB 29
	BP @22c9	;22CC 17 FB
	LDX (SW+)	;22CE 65 A1
@22D0:	RSR		;22D0 09

L_22D1:	JSR PushYZ	;22D1 7B 1A
	LDAB L_1700	;22D3 81 17 00 ; fixupword
	BNZ @22dc	;22D6 15 04
	CLA		;22D8 3A
	STA L_1748	;22D9 B1 17 48 ; fixupword
@22DC:	JSR E_2305	;22DC 7B 27
	LDA L_1748	;22DE 91 17 48 ; fixupword
	DCA		;22E1 39
	STA L_1748	;22E2 B1 17 48 ; fixupword
	BLE @22EA	;22E5 19 03
	RL		;22E7 07
	JMP @22eb	;22E8 73 01

@22EA:	SL		;22EA 06
@22EB:	JMP L_22fa	;22EB 73 0D


PushYZ: ; push Y & Z
	STX #0000	;22ED 68 00 00		save X
	XFR XW,YW	;22F0 55 64		push Y
	STX (-SW)	;22F2 6D A2
	XFR XW,ZW	;22F4 55 84		push Z
	STX (-SW)	;22F6 6D A2
	JMP (PushYZ+1)	;22F8 74 F4		return to X


L_22FA:	LDX (SW+)	;22FA 65 A1
	XFR ZW,XW	;22FC 55 48
	LDX (SW+)	;22FE 65 A1
	XFR YW,XW	;2300 55 46
	LDX (SW+)	;2302 65 A1
	RSR		;2304 09

L_2305:	JSR E_23b2	;2305 79 23 B2 ; fixupword
	STB L_230d	;2308 F3 03
	JSR E_0442	;230A 79 04 42 ; fixupword
	.dbyte 0	;230D 00 00
	CLA		;230F 3A		zero record read counter
	STA L_0a01	;2310 B1 0A 01 ; fixupword
	RSR		;2313 09

L_2314:	JSR E_0442	;2314 79 04 42 ; fixupword
	DW L_03ea	;2317 03 EA ; fixupword
	CLA		;2319 3A
	STA L_0aaf	;231A B1 0A AF ; fixupword
	RSR		;231D 09

E_231E:	STA L_23ac	;231E B1 23 AC ; fixupword
	STB L_23ae	;2321 F1 23 AE ; fixupword
	LDA (XW+)	;2324 95 41
	STA L_2371	;2326 B3 49
	STA L_0418	;2328 B1 04 18 ; fixupword
	INA		;232B 38
	INA		;232C 38
	STX L_23b0	;232D 69 23 B0 ; fixupword
	LDBB L_2398	;2330 C3 66
	BZ L_238f	;2332 14 5B
	LDB (L_2371)	;2334 D2 23 71 ; fixupword
	INR BW,1	;2337 30 20
	STB (L_2371)	;2339 F2 23 71 ; fixupword
	AAB		;233C 58
	LDAB #8d	;233D 80 8D
	STAB (-BW)	;233F A5 22
	LDAB L_2354	;2341 83 11
	BZ L_2353	;2343 14 0E
	LDA L_2371	;2345 93 2A
	AABB???		;2347 47 48 83 00
	ELO	;234B 0C ; fixupword
	LDBB (YW)	;234C CB
	LDA #0ccb	;234D 90 0C CB ; fixupword
	STA 0418	;2350 B1 04 18 ; fixupword
L_2353:	LDAB #00	;2353 80 00
	BZ @2373	;2355 14 1C
	LDAB #00	;2357 80 00
	BZ @236e	;2359 14 13
@235b:	LDAB #00	;235B 80 00	modified
	DCAB		;235D 29
	STAB 235c	;235E A3 FC
	BGZ @236e	;2360 18 0C
	JSR E_242f	;2362 79 24 2F ; fixupword
	DW L_14A5	;2365 14 A5 ; fixupword		type "(MORE DATA FOLLOWS)"
	JSR 247f	;2367 79 24 7F ; fixupword
	LDAB #00	;236A 80 00
	STAB @235b+1	;236C A3 EE
@236E:	JSR E_242f	;236E 79 24 2F ; fixupword
	DW 0		;2371 00 00
@2373:	LDB #L_0408	;2373 D0 04 08 ; fixupword
	LDAB (BW)	;2376 89
	BNZ @2399	;2377 15 20
	JSR E_083d	;2379 79 08 3D ; fixupword
	DB 2		;237C 02
	LDA #L_0c44	;237D 90 0C 44 ; fixupword
	STA L_0418	;2380 B1 04 18 ; fixupword
	LDA (L_2371)	;2383 92 23 71 ; fixupword
	DCA		;2386 39
	STA (L_2371)	;2387 B2 23 71 ; fixupword
	LDAB 0408	;238A 81 04 08 ; fixupword
	BNZ @2399	;238D 15 0A
L_238F:	LDA L_23ac	;238F 91 23 AC ; fixupword
	LDB L_23ae	;2392 D1 23 AE ; fixupword
	LDX L_23b0	;2395 63 19
	RSR		;2397 09

	DB 01		;2398 01
@2399:	JMP 0875	;2399 71 08 75 ; fixupword

E_239C:	STA L_23ac	;239C B3 0E
	STB L_23ae	;239E F3 0E
	LDB #L_03ea	;23A0 D0 03 EA ; fixupword
	JSR E_083d	;23A3 79 08 3D ; fixupword
	DB 4		;23A6 04
	LDA L_23ac	;23A7 93 03
	LDB L_23ae	;23A9 D3 03
	RSR		;23AB 09

L_23ac:	DW 00	;23AC 00 00
L_23ae:	DW 00	;23AE 00 00
L_23b0:	DW 00	;23B0 00 00

E_23B2:	STA L_23ac	;23B2 B3 F8
	LDB #L_0390	;23B4 D0 03 90 ; fixupword
	LDAB L_049d	;23B7 81 04 9D ; fixupword
	BZ @23bf	;23BA 14 03
	LDB #L_03ae	;23BC D0 03 AE ; fixupword
@23BF:	STB L_23ae	;23BF F3 ED
	JSR E_083d	;23C1 79 08 3D ; fixupword
	DB 4		;23C4 04
	LDA L_23ac	;23C5 93 E5
	LDB L_23ae	;23C7 D3 E5
	RSR		;23C9 09

L_23CA:	LDB #L_0408	;23CA D0 04 08 ; fixupword
	SVC $52	;23CD 66 52
	DW 0		;23CF 00 00
	DW 0		;23D1 00 00
	HLT???		;23D3 00
	XFR BW,BW	;23D4 55 22
	BZ @2400	;23D6 14 28
	LDB #L_0408	;23D8 D0 04 08 ; fixupword
	LDA #848d	;23DB 90 84 8D
	STA L_0c46	;23DE B1 0C 46 ; fixupword
	LDA #L_0c44	;23E1 90 0C 44 ; fixupword
	STA L_0418	;23E4 B1 04 18 ; fixupword
	LDA #0002	;23E7 90 00 02
	STA L_0c44	;23EA B1 0C 44 ; fixupword
	JSR E_083d	;23ED 79 08 3D ; fixupword
	DB 2		;23F0 02
	LDB #L_0408	;23F1 D0 04 08 ; fixupword
	JSR E_083d	;23F4 79 08 3D ; fixupword
	DB 11		;23F7 0B
	LDA L_0475	;23F8 91 04 75 ; fixupword
	SVC $05	;23FB 66 05
	DB $0D		;23FD 0D
	.dbyte $0408	;23FE 04 08 ; fixupword

@2400:	LDB #L_0408	;2400 D0 04 08 ; fixupword
	JSR E_083d	;2403 79 08 3D ; fixupword
	DB 10		;2406 0A
	RSR		;2407 09

E_2408:	LDA (XW+)	;2408 95 41
	STX (-SW)	;240A 6D A2
	XFR XW,YW	;240C 55 64
	STX (-SW)	;240E 6D A2
	LDX (AW+)	;2410 65 01
	XAY		;2412 5C
@2413:	DCX		;2413 3F
	BM @2429	;2414 16 13
	LDAB (YW)	;2416 8B
	LDBB #fa	;2417 C0 FA
	SABB		;2419 49
	BGZ @2425	;241A 18 09
	LDBB #e1	;241C C0 E1
	SABB		;241E 49
	BM @2425	;241F 16 04
	LDAB #c1	;2421 80 C1
	ADDB AL,BL	;2423 40 31
@2425:	STAB (YW+)	;2425 A5 61
	JMP @2413	;2427 73 EA

@2429:	LDA (SW+)	;2429 95 A1
	XAY		;242B 5C
	LDX (SW+)	;242C 65 A1
	RSR		;242E 09

E_242F: ; type string, inline ptr to word(count) & chars
	JSR E_2444	;242F 7B 13
	LDA (XW+)	;2431 95 41	get string pointer
	JSR E_2458	;2433 7B 23
	DB 2		;2435 02
	RSR		;2436 09

L_2437:	LDAB #af	;2437 80 AF
	BP @243d	;2439 17 02
	JSR E_244b	;243B 7B 0E
@243D:	LDA (XW+)	;243D 95 41
	JSR E_2458	;243F 7B 17
	DB 1		;2441 01
	JMP L_248d	;2442 73 49

E_2444:	LDAB #8d	;2444 80 8D
	LDBB L_2473	;2446 C3 2B
	SABB		;2448 49
	BZ L_2453	;2449 14 08
E_244B:	STAB L_2456	;244B A3 09
	LDA #L_2454	;244D 90 24 54 ; fixupword
	JSR E_2458	;2450 7B 06
	DB 2		;2452 02
L_2453:	RSR		;2453 09

L_2454:	DW 0001	;2454 00 01
L_2456:	DW 0000	;2456 00 00

E_2458: ; type string with word(count) & chars, pointed to by A
	STA L_247b	;2458 B3 21		save pointer
	LDAB (XW+)	;245A 85 41		get inline ???
	STAB L_2478	;245C A3 1A
@245e:	LDB #L_2475	;245E D0 24 75 ; fixupword
	SVC $10	;2461 66 10
@2463:	SVC $07	;2463 66 07
	LDAB L_2475	;2465 83 0E
	BM @2463	;2467 16 FA
	LDB @245e+1	;2469 D3 F4
	SVC $5c	;246B 66 5C
	DB $01		;246D 01
	DB $01		;246E 01
	DW L_1224	;246F 12 24 ; fixupword
	JMP 23f3	;2471 73 80

L_2473:	DB 00	;2473
	DB 09	;2474

L_2475:	DB 00	;2475
	DB 81	;2476
	DB 00	;2477
L_2478:	DB 00	;2478
L_2479:	DW 0084	;2479
L_247b:	DW 0000	;247B
	DB 00	;247D
	DB 00	;247E

L_247F:	LDA #L_2454	;247F 90 24 54 ; fixupword
	LDB (AW)	;2482 D8
	STB L_2479	;2483 F3 F4
	JSR L_2458	;2485 7B D1
	DB 1		;2487 01
	LDA #0084	;2488 90 00 84
	STA L_2479	;248B B3 EC
L_248D:	LDAB 2473	;248D 83 E4
	LDBB #8a	;248F C0 8A
	BZ 249c		;2491 14 09
	SABB		;2493 49
	BNZ 249c	;2494 15 06
L_2496:	LDA #0000	;2496 90 00 00	modified
	BZ 249c		;2499 14 01
	XAX		;249B 5B
L_249C:	LDAB 2456	;249C 83 B8
	RSR		;249E 09

L_249F:	PUSH YH,2	;249F 7E 61
	XFR YW,XW??index	;24A1 55 57 00 00
	INR XW,2	;24A5 30 41
	DCA		;24A7 39
	BP L_24ae	;24A8 17 04
	INR XW,2	;24AA 30 41
	JMP L_24c1	;24AC 73 13

L_24AE:	FILA #$a0,(Y)	;24AE 67 9E A0 06
	INA		;24B2 38
	SAB		;24B3 59
	BLE @24b9	;24B4 19 03
	SAB		;24B6 59
	XFR AW,BW	;24B7 55 20
@24B9:	LDB (XW+)	;24B9 D5 41
	DCA		;24BB 39
	BM 24c1		;24BC 16 03
	MVFA (B),(Y)	;24BE 67 4A 26
L_24c1:	POP YH,2	;24c1 7F 61
	RSR		;24C3 09

	LDA (XW+)	;24C4 95 41
	STX (-SW)	;24C6 6D A2
	STA (-SW)	;24C8 B5 A2
	LDX (AW+)	;24CA 65 01
	BLE @24dc	;24CC 19 0E
	ADD AW,XW	;24CE 50 40
	LDB #$a0a0	;24D0 D0 A0 A0
@24D3:	LDBB (-AW)	;24D3 C5 02
	SUBB BL,BH	;24D5 41 23
	BNZ @24dc	;24D7 15 03
	DCX		;24D9 3F
	BGZ @24d3	;24DA 18 F7
@24DC:	LDA (SW+)	;24DC 95 A1
	STX (AW)	;24DE 6D 00
	LDX (SW+)	;24E0 65 A1
	RSR		;24E2 09

