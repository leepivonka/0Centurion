; load at $200

	DS 100	;0200   return stack space
RSTop:

E_0264: ; Main entry point
	XFR SW,SW,#RSTop ;0264 55 BA 02 64 ; fixupword
	JSR E_0484	;0268 79 04 84 ; fixupword	prepare file
L_026B:	LDB #L_0703	;026B D0 07 03 ; fixupword
	SVC $5c		;026E 66 5C
	DB 1,1,1	;0270 01 01 01
	DW L_0742	;0273 07 42 ; fixupword
	LDB #L_06e5	;0275 D0 06 E5 ; fixupword
	SVC $52		;0278 66 52
	DB 1		;027a 01
	DB 2		;027b 02
	DB 2		;027c 02
	DW L_0748	;027D 07 48 ; fixupword
	LDB #L_06e5	;027F D0 06 E5 ; fixupword
	SVC $52		;0282 66 52			get_filename?  into text line
	DB 1,$15,$09	;0284 01 15 09
	DW L_0666	;0287 06 66 ; fixupword
	MVF $15,L_0666,L_0607	;0289 47 40 14 06 66 06 07 ; fixupword	copy filename
	SVC $1c		;0290 66 1C			GetClock?  insert time into text line
	DW L_0642	;0292 06 42 ; fixupword
	LDAB #' '+$80	;0294 80 A0			insert space after clock
	STAB L_064A	;0296 A1 06 4A ; fixupword
	SVC $0b		;0299 66 0B
	SVC $05		;029B 66 05			insert date into text?
	DB 4		;029D 04
	DW L_0636	;029E 06 36 ; fixupword
	LDB #L_0703	;02A0 D0 07 03 ; fixupword
	LDAB #9		;02A3 80 09
	STAB 3(BW)	;02A5 A5 28 03
	SVC $18		;02A8 66 18
	LDAB #2		;02AA 80 02
	STAB L_0706	;02AC A1 07 06 ; fixupword
	LDAB L_0742	;02AF 81 07 42 ; fixupword
	DCRB AL,2	;02B2 21 11
	BZ @02b9	;02B4 14 03
	JMP L_03c1	;02B6 71 03 C1 ; fixupword

@02B9:	JSR E_052b	;02B9 79 05 2B ; fixupword
CurSector:	DB 0,0,0	;02BC 00 00 00				3byte current sector #
	JSR E_0366	;02BF 79 03 66 ; fixupword		print sector
@02c2:	JSR E_04da	;02C2 79 04 DA ; fixupword		type "ENTER F, Q, N, P, OR RELATIVE SECTOR NUMBER /"
	DW Msg_058D	;02C5 05 8D ; fixupword
	JSR E_04f2	;02C7 79 04 F2 ; fixupword		get a string to L_0759
	JSR E_0a11	;02CA 79 0A 11 ; fixupword		uppercase a string
	DW L_0759	;02CD 07 59 ; fixupword
	LDAB L_0759+2	;02CF 81 07 5B ; fixupword		get 1st char
	LDBB #'F'+$80	;02D2 C0 C6
	SABB		;02D4 49
	BZ CmdF		;02D5 14 48
	LDBB #'Q'+$80	;02D7 C0 D1
	SABB		;02D9 49
	BZ CmdQ		;02DA 14 4F
	LDBB #'N'+$80	;02DC C0 CE
	SABB		;02DE 49
	BZ CmdN		;02DF 14 6D
	LDBB #'P'+$80	;02E1 C0 D0
	SABB		;02E3 49
	BZ CmdP		;02E4 14 70
	LDA L_0759	;02E6 91 07 59 ; fixupword	get string length
	BZ @02f4	;02E9 14 09
	CTB 9,3,L_0759+2,CurSector	;02EB 46 82 80 07 5B 02 BC   asc to bignum
	BNF @0305	;02f2 13 11			   if ctb OK, goto
@02f4:	JSR E_04DA	;02f4 79 04 DA ; fixupword		type " \r"
	DW Msg_087A	;02F7 08 7A ; fixupword
	JSR E_04DA	;02F9 79 04 DA ; fixupword		type "\bINVALID ENTRY\r"
	DW Msg_05BC	;02FC 05 BC ; fixupword
	JSR E_04da	;02FE 79 04 DA ; fixupword		type " \r"
	DW Msg_087A	;0301 08 7A ; fixupword
	JMP @02c2	;0303 73 BD				try again

L_0305:	C 3,3,CurSector,L_0747	;0305 46 22 20 02 BC 07 47	BigCmp
	BP ???		;030c 17 AB
L_030e:	JSR E_04DA	;030e 79 04 DA ; fixupword		type " \r"
	DW MSg_087A	;0311 08 7A ; fixupword
	JSR E_04DA	;0313 79 04 DA ; fixupword		type "\bINVALID SECTOR NUMBER\r"
	DW Msg_05CD	;0316 05 CD ; fixupword
	JSR E_04da	;0318 79 04 DA ; fixupword		type " \r"
	DW Msg_087A	;031B 08 7A ; fixupword
	JMP @02c2	;031D 73 A3				try again

CmdF:	; goto First sector
	ZAD 1,3,#0,CurSector ;031F 46 02 3C 00 02 BC	zero position?
	JSR E_0484	;0325 79 04 84			prepare file
	JMP L_026b	;0328 71 02 6b ; fixupword

CmdQ: ; Quit?
	LDAB L_0742	;032b 81 07 42 ; fixupword
	DCRB AL,4	;032E 21 13
	BNZ @0337	;0330 15 05
	JSR E_0512	;0332 79 05 12 ; fixupword	print a string
	DW L_0755	;0335 07 55 ; fixupword		   \0x04  return
@0337:	LDA L_0740	;0337 91 07 40 ; fixupword
	BNZ L_0346	;033A 15 0A
	LDAB #$0a	;033C 80 0A
	STAB L_0706	;033E A1 07 06 ; fixupword
L_0341:	LDB #L_0703	;0341 D0 07 03 ; fixupword
	SVC $18		;0344 66 18
L_0346:	JSR E_04da	;0346 79 04 DA ; fixupword		type "END OF PROGRAM\r"
	DW Msg_05E6	;0349 05 E6 ; fixupword
	SVC $0a		;034B 66 0A				exit with code $ff
	DB $ff		;034D FF

CmdN: ; Next sector
	A 1,3,#1,CurSector ;034E 46 02 0C 01 02 BC		current sector += 1
	JMP L_0305	;0354 73 AF

CmdP: ; Previous sector
	S 1,3,#1,CurSector ;0356 46 02 1C 01 02 BC ; fixupword  current sector -= 1
	BP L_0305	;035C 17 A7			if <0
	ZAD 1,3,#0,CurSector ;035E 46 02 3C 00 02 BC	; fixupword	current sector=0
	JMP L_030e	;0364 73 A8

E_0366: ; print sector
	STK XH,6	;0366 7E 45			save X,Y,Z
	MVF 5,L_0750,L_062d	;0368 47 40 04 07 50 06 2D ; fixupword	copy ASCII sector #
	LDBB #'0'+$80	;036F C0 B0			base of '0'
	CLR AW,6	;0371 32 05			6 chars
	CTB 9,3,L_062d,CurSector ;0373 46 82 90 06 2D 02 BC ; fixupword cvt_to_bin to current sector #
	JSR E_0512	;037c 79 05 12 ; fixupword	print a string
	DW L_0877	;037d 08 77					formfeed
	JSR 0512	;037F 79 05 12 ; fixupword	print a string
	DW L_05F7	;0382 05 F7 ; fixupword		  "DUMP OF FILE:                        SECTOR NUMBER:  \r"
	JSR 0512	;0384 79 05 12 ; fixupword	print a string
	DW Msg_087A	;0387 08 7A ; fixupword			" \r"
	LDX #L_087e+2	;0389 60 08 80 ; fixupword	start of file sector buffer
	LDA #20-1	;038C 90 00 13			init print line counter
	STA L_074A	;038f B1 07 4A ; fixupword
@0392:	XFR YW,YW,#L_07ab+2 ;0392 55 76 07 AD ; fixupword  start of print line hex field
	XFR ZW,ZW,#L_07e9 ;0396 55 98 07 E9 ; fixupword	start of print line char field
	LDA #20-1	;039A 90 00 13			init byte counter
	STA L_074c	;039D B1 07 4C ; fixupword
@03A0:	LDAB (XW+)	;03A0 85 41		get next file sector byte
	JSR E_053e	;03A2 79 05 3E ; fixupword	cvt AL to 2 hex chars & space at (YW+)
	JSR E_0555	;03A5 79 05 55 ; fixupword	append printable char in AL to (z+)
	DCR L_074C,1	;03A8 31 10 07 4C ; fixupword	next byte
	BP @03a0	;03AC 17 F2
	JSR E_0512	;03AE 79 05 12 ; fixupword	print a string
	DW L_07AB	;03B1 07 AB ; fixupword		   the print line
	DCR L_074A,1	;03B3 31 10 07 4A ; fixupword	next line
	BP @0392	;03B7 17 D9
	JSR E_0512	;03B9 79 05 12 ; fixupword	print a string
	DW Msg_087A	;03BC 08 7A ; fixupword		" \r"
	POP XH,6	;03BE 7F 45			restore X,Y,Z
	RSR		;03C0 09

L_03C1:	JSR E_052b	;03C1 79 05 2B ; fixupword
L_03c4:	DB 0,0,0	;03C4 00 00 00
	JSR E_0405	;03C7 79 04 05 ; fixupword
	A 1,3,#1,L_03c4	;03CA 46 02 0C 01 03 C4	; fixupword BigAdd
	C 3,3,L_03c4,L_0747	;03d0 46 22 20 03 C4 07 47 ; fixupword BigCmp
	BP L_03c1	;03D7 17 E8
	STA L_0742	;03D9 81 07 42 ; fixupword
	DCRB AL,4	;03DC 21 13
	BNZ @03e5	;03DE 15 05
	JSR 0512	;03E0 79 05 12 ; fixupword	print a string
	DW L_0755	;03E3 07 55 ; fixupword		    \0x04 return
@03e5:	LDAB #$a	;03E5 80 0A
	STAB L_0703+3	;03E7 A1 07 06 ; fixupword
	LDB #L_0703	;03EA D0 07 03 ; fixupword
	SVC $18		;03ED 66 18
	JSR E_0484	;03EF 79 04 84 ; fixupword
	ZAD 1,3,#0,L_03c4	;03F2 46 02 3C 00 03 C4 ; fixupword
	LDB #L_0703	;03f8 D0 07 03 ; fixupword
	LDAB #9		;03fb 80 09
	STAB 3(BW)	;03FD A5 28 03
	SVC $18		;0400 66 18
	JMP L_026b	;0402 71 02 6B ; fixupword

L_0405:	PUSH XH,6	;0405 7E 45			save X,Y,Z
	DCR L_074E,1	;0407 31 10 07 4E ; fixupword
	BNZ @042b	;040B 15 1E
	JSR E_0512	;040D 79 05 12 ; fixupword	print a string
	DW L_0877	;0410 08 77 ; fixupword			formfeed
	LDX #5		;0412 60 00 05			5 times
@0415:	JSR E_0512	;0415 79 05 12 ; fixupword	  print a string
	DW L_087A	;0418 08 7A ; fixupword		  " \r"
	DCX		;041A 3F			 next
	BNZ @0415	;041B 15 F8
	JSR 0512	;041D 79 05 12 ; fixupword	print a string
	DW L_0634	;0420 06 34 ; fixupword	" AT           HEX DUMP OF FILE:"
	JSR L_0512	;0422 79 05 12 ; fixupword	print a string
	DW L_087A	;0425 08 7A ; fixupword		" /r"
	CLR L_074E,3	;0427 32 12 07 4E ; fixupword
@042B:	MVF 5,L_0750,L_06b3	;042B 47 40 04 07 50 06 B3 ; fixupword
	LDBB #'0'+$80	;0432  C0 B0			cvt base?
	CLR AW,6	;0434  32 05			6 chars
	CFB 9,3,L_06b3,L_03c4	;0436 46 82 90 06 B3 03 C4 ; fixupword	insert num into msg
	JSR E_0512	;043d 79 05 12 ; fixupword	print a string
	DW L_067d	;0440 06 7D
	JSR E_0512	;0442 79 05 12 ; fixupword	print a string
	DW Msg_087a	;0445 08 7A ; fixupword		   formfeed
	LDX #L_087e+2	;0447 60 08 80 ; fixupword	sector buffer ptr
	LDA #20-1	;044A 90 00 13			for 20 lines
	STA L_074a	;044d B1 07 4A ; fixupword
@0450:	XFR YW,YW,#L_07ff	;0450 55 76 07 FF ; fixupword	print line hex ptr
	XFR ZW,ZW,#L_0850	;0454 55 98 08 50 ; fixupword	print line char ptr
	LDA #20-1	;0458 90 00 13			for 20 chars
	STA L_074c	;045B B1 07 4C ; fixupword
@045E:	LDAB (XW+)	;045E 85 41			get next byte
	JSR E_053e	;0460 79 05 3E ; fixupword	cvt AL to 2 hex chars & space at (YW+)
	JSR E_0555	;0463 79 05 55 ; fixupword	append printable char in AL to (z+)
	DCR L_074C,1	;0466 31 10 07 4C ; fixupword	next char
	BP @045e	;046A 17 F2
	JSR E_0512	;046C 79 05 12 ; fixupword	print a string
	DW L_07FD	;046F 07 FD ; fixupword		   print line
	DCR L_074A,1	;0471 31 10 07 4A ; fixupword	next line
	BP @0450	;0475 17 D9
	JSR E_0512	;0477 79 05 12 ; fixupword	print a string
	DW L_087A	;047A 08 7A ; fixupword		" \r"
	JSR E_0512	;047C 79 05 12 ; fixupword	print a string
	DW L_087A	;047F 08 7A ; fixupword		" \r"
	POP XH,6	;0481 7F 45			restore X,Y,Z
	RSR		;0483 09

E_0484: ; prepare file?
	JSR E_04da	;0484 79 04 DA ; fixupword		type "\f"
	DW L_06E2	;0487 06 E2 ; fixupword
	JSR E_04DA	;0489 79 04 DA ; fixupword		type "ZHEXLST 10/19/82 DISK FILE DUMP\r"
	DW Msg_056B	;048C 05 6B ; fixupword
	JSR E_04DA	;048E 79 04 DA ; fixupword		type " \r"
	DW Msg_087A	;0491 08 7A ; fixupword
	JSR E_04DA	;0493 79 04 DA ; fixupword		type "ENTER FILE NAME /"
	DW Msg_06BA	;0496 06 BA ; fixupword
	JSR E_04f2	;0498 79 04 F2 ; fixupword		get a string to L_0759
	LDA L_0759	;049B 91 07 59 ; fixupword		get string length
	BNZ @04a3	;049E 15 03
	JMP CmdQ	;04A0 71 03 2B ; fixupword

@04A3:	JSR E_0a11	;04A3 79 0A 11 ; fixupword		uppercase a string
	DW L_0759	;04A6 07 59 ; fixupword
	LDA L_0759	;04A8 91 07 59 ; fixupword		get string length
	MVF 8,L_075b,L_072B	;04AB 67 40 07 5B 07 2B ; fixupword  copy filename to fcb?
@04b1:	JSR E_04da	;04B1 79 04 DA ; fixupword		type "ENTER DISK NUMBER /"
	DW L_06CD	;04B4 06 CD ; fixupword
	JSR E_04f2	;04B6 79 04 F2 ; fixupword		get a string to L_0759
	LDA L_0759	;04B9 91 07 59 ; fixupword
	BNZ @04c1	;04BC 15 03
	JMP CmdQ	;04BE 71 03 2B ; fixupword

@04C1:	LDA L_0759	;04C1 91 07 59 ; fixupword		get string length
	CTB 9,1,L_0759+2,@04d4	;04C4 46 80 80 07 5B 04 D4  ; fixupword  asc to bignum
	BF @04b1	;04cb 12 E4
	SVC $05		;04cd 66 05		open file?
	DB $E		;04CF 0E		flags?
	DW L_072B	;04D0 07 2B ; fixupword  filename ptr
	DW L_06E5	;04D2 06 E5 ; fixupword	fcb ptr?
@04d4:	DW 2		;04D4 00 02  modified	disk number
	XAB		;04D6 5D		if error, try again
	BNZ E_0484	;04D7 15 AB
	RSR		;04D9 09


E_04DA: ; type string using inline ptr
	CLR AW,2	;04DA 32 02			set function?
	STAB L_0721+3	;04DC A1 07 24 ; fixupword
	LDA (XW+)	;04DF 95 41			get inline string ptr
	STA L_0721+6	;04E1 B1 07 27 ; fixupword
	LDA (AW)	;04E4 98			get string length
	STA L_0721+4	;04E5 B1 07 25 ; fixupword
	LDB #L_0721	;04E8 D0 07 21 ; fixupword	???
	SVC $10		;04EB 66 10
	SVC $08		;04ED 66 08			???
	DW L_0721	;04EF 07 21 ; fixupword
	RSR		;04F1 09


E_04F2: ; get a string to L_0759
	CLR AW,1	;04F2 32 01			???
	STAB L_0721+3	;04F4 A1 07 24 ; fixupword
	LDA #80		;04F7 90 00 50			set buf length?
	STA L_0721+4	;04FA B1 07 25 ; fixupword
	LDA #L_0759	;04FD 90 07 59 ; fixupword	set buf addr
	STA L_0721+6	;0500 B1 07 27 ; fixupword
	LDB #L_0721	;0503 D0 07 21 ; fixupword	???
	SVC $10		;0506 66 10			file something?
@0508:	LDAB L_0721+0	;0508 81 07 21 ; fixupword	get status
	BP @0511	;050B 17 04
	SVC $07		;050D 66 07
	JMP @0508	;050F 73 F7

@0511:	RSR		;0511 09


E_0512: ; print a string?
	LDA (XW+)	;0512 95 41			A= inline string ptr
	STA L_0713	;0514 B1 07 13 ; fixupword
	LDA (AW)	;0517 98			A= length
	STA L_0711	;0518 B1 07 11 ; fixupword
	LDB #L_0703	;051B D0 07 03 ; fixupword	print it?
	SVC $18		;051E 66 18
	LDAB L_0703+0	;0520 81 07 03 ; fixupword	check for error?
	BNZ L_0526	;0523 15 01
	RSR		;0525 09

L_0526: ; handle error (code in AL)
	LDBB #$32	;0526 C0 32
	AABB		;0528 48
	SVC $6b		;0529 66 6B
E_052B:
	MVF 3,(XW),L_0744 ;052B 47 48 02 40 07 44 ; fixupword copy 3 bytes from inline
	INR XW,3	;0531 30 42
	LDB #L_06E5	;0533 D0 06 E5 ; fixupword
	SVC $18		;0536 66 18			
	LDAB L_06E5	;0538 81 06 E5 ; fixupword	if error
	BNZ L_0526	;053B 15 E9			    goto
	RSR		;053D 09

E_053E: ; cvt AL to 2 hex chars & space at (YW+)
	STAB (-SW)	;053E A5 A2	save AL
	LDA #$c0c0	;0540 90 C0 C0	'@@'
	STA (YW)	;0543 BB
	CLR AW,2	;0544 32 02	write 2 chars?
	LDBB #'0'+$80	;0546 C0 B0	'0' base?
	CFB 15,1,(YW),(SW) ;0548 46 E0 9A 6A  cvt 1byte binary at (SW) to hex at (YW)
	INR YW,2	;054C 30 61	bump up 2 chars
	LDAB #a0	;054E 80 A0	insert space
	STAB (YW+)	;0550 A5 61
	LDAB (SW+)	;0552 85 A1	restore AL
	RSR		;0554 09


E_0555: ; append AL as printable char to (z+)
	CLRB AH,0	;0555 22 00	zero hi byte of char
	LDB #$a0	;0557 D0 00 A0	< space ?
	SAB		;055A 59
	BM @0564	;055B 16 07
	INAB		;055D 28	= delete ?
	BZ @0564	;055E 14 04
	DCAB		;0560 29
	STAB (ZW+)	;0561 A5 81	append the char to memory
	RSR		;0563 09

@0564: ; not printable
	LDAB #$a0	;0564 80 A0	space
	LDAB #$df	;0566 80 DF	'_'
	STAB (ZW+)	;0568 A5 81	append to memory
	RSR		;056A 09


Msg_056b: ; string
	DW $20		;056B 00 20	length
	DB $DA ;Z	;056D DA	chars
	DB $C8 ;H	;056E C8
	DB $C5 ;E	;056F C5
	DB $D8 ;X	;0570 D8
	DB $CC ;L	;0571 CC
	DB $D3 ;S	;0572 D3
	DB $D4 ;T	;0573 D4
	DB $A0 ; 	;0574 A0
	DB $B1 ;1	;0575 B1
	DB $B0 ;0	;0576 B0
	DB $AF ;/	;0577 AF
	DB $B1 ;1	;0578 B1
	DB $B9 ;9	;0579 B9
	DB $AF ;/	;057A AF
	DB $B8 ;8	;057B B8
	DB $B2 ;2	;057C B2
	DB $A0 ; 	;057D A0
	DB $C4 ;D	;057E C4
	DB $C9 ;I	;057F C9
	DB $D3 ;S	;0580 D3
	DB $CB ;K	;0581 CB
	DB $A0 ; 	;0582 A0
	DB $C6 ;F	;0583 C6
	DB $C9 ;I	;0584 C9
	DB $CC ;L	;0585 CC
	DB $C5 ;E	;0586 C5
	DB $A0 ; 	;0587 A0
	DB $C4 ;D	;0588 C4
	DB $D5 ;U	;0589 D5
	DB $CD ;M	;058A CD
	DB $D0 ;P	;058B D0
	DB $8D		;058C 8D

Msg_058d: ; string
	DW $2d		;058D 00 2D	length
	DB $C5 ;E	;058F C5	chars
	DB $CE ;N	;0590 CE
	DB $D4 ;T	;0591 D4
	DB $C5 ;E	;0592 C5
	DB $D2 ;R	;0593 D2
	DB $A0 ; 	;0594 A0
	DB $C6 ;F	;0595 C6
	DB $AC ;,	;0596 AC
	DB $A0 ; 	;0597 A0
	DB $D1 ;Q	;0598 D1
	DB $AC ;,	;0599 AC
	DB $A0 ; 	;059A A0
	DB $CE ;N	;059B CE
	DB $AC ;,	;059C AC
	DB $A0 ; 	;059D A0
	DB $D0 ;P	;059E D0
	DB $AC ;,	;059F AC
	DB $A0 ; 	;05A0 A0
	DB $CF ;O	;05A1 CF
	DB $D2 ;R	;05A2 D2
	DB $A0 ; 	;05A3 A0
	DB $D2 ;R	;05A4 D2
	DB $C5 ;E	;05A5 C5
	DB $CC ;L	;05A6 CC
	DB $C1 ;A	;05A7 C1
	DB $D4 ;T	;05A8 D4
	DB $C9 ;I	;05A9 C9
	DB $D6 ;V	;05AA D6
	DB $C5 ;E	;05AB C5
	DB $A0 ; 	;05AC A0
	DB $D3 ;S	;05AD D3
	DB $C5 ;E	;05AE C5
	DB $C3 ;C	;05AF C3
	DB $D4 ;T	;05B0 D4
	DB $CF ;O	;05B1 CF
	DB $D2 ;R	;05B2 D2
	DB $A0 ; 	;05B3 A0
	DB $CE ;N	;05B4 CE
	DB $D5 ;U	;05B5 D5
	DB $CD ;M	;05B6 CD
	DB $C2 ;B	;05B7 C2
	DB $C5 ;E	;05B8 C5
	DB $D2 ;R	;05B9 D2
	DB $A0 ; 	;05BA A0
	DB $AF ;/	;05BB AF

Msg_05bc: ; string
	DW $f		;05BC 00 0F	length
	DB $87		;05BE 87	bell
	DB $C9 ;I	;05BF C9
	DB $CE ;N	;05C0 CE
	DB $D6 ;V	;05C1 D6
	DB $C1 ;A	;05C2 C1
	DB $CC ;L	;05C3 CC
	DB $C9 ;I	;05C4 C9
	DB $C4 ;D	;05C5 C4
	DB $A0 ; 	;05C6 A0
	DB $C5 ;E	;05C7 C5
	DB $CE ;N	;05C8 CE
	DB $D4 ;T	;05C9 D4
	DB $D2 ;R	;05CA D2
	DB $D9 ;Y	;05CB D9
	DB $8D		;05CC 8D	return

Msg_05cd: ; string
	DW $17		;05CD 00 17	length
	DB $87		;05CF 87	chars
	DB $C9 ;I	;05D0 C9
	DB $CE ;N	;05D1 CE
	DB $D6 ;V	;05D2 D6
	DB $C1 ;A	;05D3 C1
	DB $CC ;L	;05D4 CC
	DB $C9 ;I	;05D5 C9
	DB $C4 ;D	;05D6 C4
	DB $A0 ; 	;05D7 A0
	DB $D3 ;S	;05D8 D3
	DB $C5 ;E	;05D9 C5
	DB $C3 ;C	;05DA C3
	DB $D4 ;T	;05DB D4
	DB $CF ;O	;05DC CF
	DB $D2 ;R	;05DD D2
	DB $A0 ; 	;05DE A0
	DB $CE ;N	;05DF CE
	DB $D5 ;U	;05E0 D5
	DB $CD ;M	;05E1 CD
	DB $C2 ;B	;05E2 C2
	DB $C5 ;E	;05E3 C5
	DB $D2 ;R	;05E4 D2
	DB $8D		;05E5 8D

Msg_05e6: ; string
	DW $f		;05E6 00 0F	length
	DB $C5 ;E	;05E8 C5	chars
	DB $CE ;N	;05E9 CE
	DB $C4 ;D	;05EA C4
	DB $A0 ; 	;05EB A0
	DB $CF ;O	;05EC CF
	DB $C6 ;F	;05ED C6
	DB $A0 ; 	;05EE A0
	DB $D0 ;P	;05EF D0
	DB $D2 ;R	;05F0 D2
	DB $CF ;O	;05F1 CF
	DB $C7 ;G	;05F2 C7
	DB $D2 ;R	;05F3 D2
	DB $C1 ;A	;05F4 C1
	DB $CD ;M	;05F5 CD
	DB $8D		;05F6 8D

Msg_05f7: ; modified string
	DW $3B		;05F7 00 3B	length
	DB $C4 ;D	;05F9 C4
	DB $D5 ;U	;05FA D5
	DB $CD ;M	;05FB CD
	DB $D0 ;P	;05FC D0
	DB $A0 ; 	;05FD A0
	DB $CF ;O	;05FE CF
	DB $C6 ;F	;05FF C6
	DB $A0 ; 	;0600 A0
	DB $C6 ;F	;0601 C6
	DB $C9 ;I	;0602 C9
	DB $CC ;L	;0603 CC
	DB $C5 ;E	;0604 C5
	DB $BA ;:	;0605 BA
	DB $A0 ; 	;0606 A0
L_0607:	DB $A0 ; 	;0607 A0	filename inserted here
	DB $A0 ; 	;0608 A0
	DB $A0 ; 	;0609 A0
	DB $A0 ; 	;060A A0
	DB $A0 ; 	;060B A0
	DB $A0 ; 	;060C A0
	DB $A0 ; 	;060D A0
	DB $A0 ; 	;060E A0
	DB $A0 ; 	;060F A0
	DB $A0 ; 	;0610 A0
	DB $A0 ; 	;0611 A0
	DB $A0 ; 	;0612 A0
	DB $A0 ; 	;0613 A0
	DB $A0 ; 	;0614 A0
	DB $A0 ; 	;0615 A0
	DB $A0 ; 	;0616 A0
	DB $A0 ; 	;0617 A0
	DB $A0 ; 	;0618 A0
	DB $A0 ; 	;0619 A0
	DB $A0 ; 	;061A A0
	DB $A0 ; 	;061B A0
	DB $A0 ; 	;061C A0
	DB $A0 ; 	;061D A0
	DB $D3 ;S	;061E D3
	DB $C5 ;E	;061F C5
	DB $C3 ;C	;0620 C3
	DB $D4 ;T	;0621 D4
	DB $CF ;O	;0622 CF
	DB $D2 ;R	;0623 D2
	DB $A0 ; 	;0624 A0
	DB $CE ;N	;0625 CE
	DB $D5 ;U	;0626 D5
	DB $CD ;M	;0627 CD
	DB $C2 ;B	;0628 C2
	DB $C5 ;E	;0629 C5
	DB $D2 ;R	;062A D2
	DB $BA ;:	;062B BA
	DB $A0 ; 	;062C A0
	DB $A0 ; 	;0632 A0
	DB $8D		;0633 8D

Msg_0634: ; string modified
	DW $47		;0634 00 47	length
L_0636:	DS 9		;0636		date inserted here?
	DB $A0 ; 	;063E A0
	DB $C1 ;A	;063F C1
	DB $D4 ;T	;0640 D4
	DB $A0 ; 	;0641 A0
L_0642: DS 8		;0642		time inserted here?
L_064a:	DB $A0 ; 	;064A A0
	DB $A0 ; 	;064B A0
	DB $A0 ; 	;064C A0
	DB $A0 ; 	;064D A0
	DB $A0 ; 	;064E A0
	DB $A0 ; 	;064F A0
	DB $A0 ; 	;0650 A0
	DB $A0 ; 	;0651 A0
	DB $A0 ; 	;0652 A0
	DB $A0 ; 	;0653 A0
	DB $C8 ;H	;0654 C8
	DB $C5 ;E	;0655 C5
	DB $D8 ;X	;0656 D8
	DB $A0 ; 	;0657 A0
	DB $C4 ;D	;0658 C4
	DB $D5 ;U	;0659 D5
	DB $CD ;M	;065A CD
	DB $D0 ;P	;065B D0
	DB $A0 ; 	;065C A0
	DB $CF ;O	;065D CF
	DB $C6 ;F	;065E C6
	DB $A0 ; 	;065F A0
	DB $C6 ;F	;0660 C6
	DB $C9 ;I	;0661 C9
	DB $CC ;L	;0662 CC
	DB $C5 ;E	;0663 C5
	DB $BA ;:	;0664 BA
	DB $A0 ; 	;0665 A0
L_0666:	DB $A0 ; 	;0666 A0	filename inserted here?
	DB $A0 ; 	;0667 A0
	DB $A0 ; 	;0668 A0
	DB $A0 ; 	;0669 A0
	DB $A0 ; 	;066A A0
	DB $A0 ; 	;066B A0
	DB $A0 ; 	;066C A0
	DB $A0 ; 	;066D A0
	DB $A0 ; 	;066E A0
	DB $A0 ; 	;066F A0
	DB $A0 ; 	;0670 A0
	DB $A0 ; 	;0671 A0
	DB $A0 ; 	;0672 A0
	DB $A0 ; 	;0673 A0
	DB $A0 ; 	;0674 A0
	DB $A0 ; 	;0675 A0
	DB $A0 ; 	;0676 A0
	DB $A0 ; 	;0677 A0
	DB $A0 ; 	;0678 A0
	DB $A0 ; 	;0679 A0
	DB $A0 ; 	;067A A0
	DB $A0 ; 	;067B A0
	DB $8D		;067C 8D

Msg_067d: ; string  unused?
	DW $38		;067D 00 3B	length
	DB $A0 ; 	;067F A0	chars
	DB $A0 ; 	;0680 A0
	DB $A0 ; 	;0681 A0
	DB $A0 ; 	;0682 A0
	DB $A0 ; 	;0683 A0
	DB $A0 ; 	;0684 A0
	DB $A0 ; 	;0685 A0
	DB $A0 ; 	;0686 A0
	DB $A0 ; 	;0687 A0
	DB $A0 ; 	;0688 A0
	DB $A0 ; 	;0689 A0
	DB $A0 ; 	;068A A0
	DB $A0 ; 	;068B A0
	DB $A0 ; 	;068C A0
	DB $A0 ; 	;068D A0
	DB $A0 ; 	;068E A0
	DB $A0 ; 	;068F A0
	DB $A0 ; 	;0690 A0
	DB $A0 ; 	;0691 A0
	DB $A0 ; 	;0692 A0
	DB $A0 ; 	;0693 A0
	DB $A0 ; 	;0694 A0
	DB $A0 ; 	;0695 A0
	DB $A0 ; 	;0696 A0
	DB $A0 ; 	;0697 A0
	DB $A0 ; 	;0698 A0
	DB $A0 ; 	;0699 A0
	DB $A0 ; 	;069A A0
	DB $A0 ; 	;069B A0
	DB $A0 ; 	;069C A0
	DB $A0 ; 	;069D A0
	DB $A0 ; 	;069E A0
	DB $A0 ; 	;069F A0
	DB $A0 ; 	;06A0 A0
	DB $A0 ; 	;06A1 A0
	DB $A0 ; 	;06A2 A0
	DB $A0 ; 	;06A3 A0
	DB $D3 ;S	;06A4 D3
	DB $C5 ;E	;06A5 C5
	DB $C3 ;C	;06A6 C3
	DB $D4 ;T	;06A7 D4
	DB $CF ;O	;06A8 CF
	DB $D2 ;R	;06A9 D2
	DB $A0 ; 	;06AA A0
	DB $CE ;N	;06AB CE
	DB $D5 ;U	;06AC D5
	DB $CD ;M	;06AD CD
	DB $C2 ;B	;06AE C2
	DB $C5 ;E	;06AF C5
	DB $D2 ;R	;06B0 D2
	DB $BA ;:	;06B1 BA
	DB $A0 ; 	;06B2 A0

L_06b3:	DS 5		;06B3
	DB $A0 ; 	;06B8 A0
	DB $8D		;06B9 8D

Msg_06ba: ; string
	DW $11		;06BA 00 11	length
	DB $C5 ;E	;06BC C5	chars
	DB $CE ;N	;06BD CE
	DB $D4 ;T	;06BE D4
	DB $C5 ;E	;06BF C5
	DB $D2 ;R	;06C0 D2
	DB $A0 ; 	;06C1 A0
	DB $C6 ;F	;06C2 C6
	DB $C9 ;I	;06C3 C9
	DB $CC ;L	;06C4 CC
	DB $C5 ;E	;06C5 C5
	DB $A0 ; 	;06C6 A0
	DB $CE ;N	;06C7 CE
	DB $C1 ;A	;06C8 C1
	DB $CD ;M	;06C9 CD
	DB $C5 ;E	;06CA C5
	DB $A0 ; 	;06CB A0
	DB $AF ;/	;06CC AF

Msg_06cd: ; string
	DW $13		;06CD 00 13	length
	DB $C5 ;E	;06CF C5	chars
	DB $CE ;N	;06D0 CE
	DB $D4 ;T	;06D1 D4
	DB $C5 ;E	;06D2 C5
	DB $D2 ;R	;06D3 D2
	DB $A0 ; 	;06D4 A0
	DB $C4 ;D	;06D5 C4
	DB $C9 ;I	;06D6 C9
	DB $D3 ;S	;06D7 D3
	DB $CB ;K	;06D8 CB
	DB $A0 ; 	;06D9 A0
	DB $CE ;N	;06DA CE
	DB $D5 ;U	;06DB D5
	DB $CD ;M	;06DC CD
	DB $C2 ;B	;06DD C2
	DB $C5 ;E	;06DE C5
	DB $D2 ;R	;06DF D2
	DB $A0 ; 	;06E0 A0
	DB $AF ;/	;06E1 AF

Msg_06e2: ; string
	DW 1		;06E2 00 01	length
	DB $C+$80	;06E4 8C	chars	formfeed

L_06e5: ; data file control block?
	DB 0		;06E5 00	status?
	DB 0		;06E6 00
	DB $21 ;!	;06E7 21
	DB 1		;06E8 01	function?
	DB 1		;06E9 01
	DB $90		;06EA 90
	DW L_087E	;06EB 08 7E ; fixupword
	DB 0		;06ED 00
	DB 0		;06EE 00
	DB 0		;06EF 00
	DB 5		;06F0 05
	DB 2		;06F1 02
	DB $FF		;06F2 FF
	DB 0		;06F3 00
	DB 0		;06F4 00
	DB 0		;06F5 00
	DB 0		;06F6 00
	DB 0		;06F7 00
	DB 0		;06F8 00
	DB 0		;06F9 00
	DB 0		;06FA 00
	DB 0		;06FB 00
	DB 0		;06FC 00
	DB 0		;06FD 00
	DB 0		;06FE 00
	DW L_0743	;06FF 07 43 ; fixupword	buffer ptr
	DB 0		;0701 00
	DB 0		;0702 00

L_0703: ; file control block?
	DW $83		;0703 00 83
	DB $22		;0705 22
	DB 2		;0706 02
	DB 0		;0707 00
	DB 0		;0708 00
	DB 0		;0709 00
	DB 0		;070A 00
	DB 0		;070B 00
	DB 0		;070C 00
	DB 0		;070D 00
	DB 0		;070E 00
	DB 1		;070F 01
	DB 2		;0710 02
	DB 0		;0711 00
	DB $78 ;x	;0712 78
	DW L_07FD	;0713 07 FD ; fixupword
	DB 0		;0715 00
	DB 0		;0716 00
	DB 0		;0717 00
	DB 0		;0718 00
	DB 0		;0719 00
	DB 0		;071A 00
	DB 0		;071B 00
	DB 0		;071C 00
	DB 0		;071D 00
	DB 0		;071E 00
	DB 0		;071F 00
	DB 0		;0720 00

L_0721: ; file control block?
	DW $82		;0721 00 82
	DB $23		;0723 23
	DB 0		;0724 00
	DW 0		;0725 00 00	buf length?
	DW 0		;0727 00 00	buf ptr?
	DB 0		;0729 00
	DB 0		;072A 00
	DB 0		;072B 00	start of filename?
	DB 0		;072C 00
	DB 0		;072D 00
	DB 0		;072E 00
	DB 0		;072F 00
	DB 0		;0730 00
	DB 0		;0731 00
	DB 0		;0732 00
	DB 0		;0733 00
	DB 0		;0734 00
	DB 0		;0735 00
	DB 0		;0736 00
	DB 0		;0737 00
	DB 0		;0738 00
	DB 0		;0739 00
	DB 0		;073A 00
	DB 0		;073B 00
	DB 0		;073C 00
	DB 0		;073D 00
	DB 0		;073E 00
	DB 0		;073F 00
	DB 0		;0740 00

L_0742:	DB 00	;0741 00

L_0743:	DB 00	;0743 00
	DB 00	;0744 00
	DB 00	;0745 00
	DB 00	;0746 00

L_0747:	DB 0,0,0	;0747 00 00 00	3byte max sector #?

	DB 0		;074E 00
	DB 1		;074F 01
	DB $C0 ;@	;0750 C0
	DB $C0 ;@	;0751 C0
	DB $C0 ;@	;0752 C0
	DB $C0 ;@	;0753 C0
	DB $C0 ;@	;0754 C0


L_0755: ; string
	DW 2		;0755 00 02	length
	DB $84	;0757 84	?
	DB $8D	;0758 8D	CR

L_0759: ; string	work buffer
	DS 2		;0759		length
	DB $A0 ; 	;075B A0	chars
	DB $A0 ; 	;075C A0
	DB $A0 ; 	;075D A0
	DB $A0 ; 	;075E A0
	DB $A0 ; 	;075F A0
	DB $A0 ; 	;0760 A0
	DB $A0 ; 	;0761 A0
	DB $A0 ; 	;0762 A0
	DB $A0 ; 	;0763 A0
	DB $A0 ; 	;0764 A0
	DB $A0 ; 	;0765 A0
	DB $A0 ; 	;0766 A0
	DB $A0 ; 	;0767 A0
	DB $A0 ; 	;0768 A0
	DB $A0 ; 	;0769 A0
	DB $A0 ; 	;076A A0
	DB $A0 ; 	;076B A0
	DB $A0 ; 	;076C A0
	DB $A0 ; 	;076D A0
	DB $A0 ; 	;076E A0
	DB $A0 ; 	;076F A0
	DB $A0 ; 	;0770 A0
	DB $A0 ; 	;0771 A0
	DB $A0 ; 	;0772 A0
	DB $A0 ; 	;0773 A0
	DB $A0 ; 	;0774 A0
	DB $A0 ; 	;0775 A0
	DB $A0 ; 	;0776 A0
	DB $A0 ; 	;0777 A0
	DB $A0 ; 	;0778 A0
	DB $A0 ; 	;0779 A0
	DB $A0 ; 	;077A A0
	DB $A0 ; 	;077B A0
	DB $A0 ; 	;077C A0
	DB $A0 ; 	;077D A0
	DB $A0 ; 	;077E A0
	DB $A0 ; 	;077F A0
	DB $A0 ; 	;0780 A0
	DB $A0 ; 	;0781 A0
	DB $A0 ; 	;0782 A0
	DB $A0 ; 	;0783 A0
	DB $A0 ; 	;0784 A0
	DB $A0 ; 	;0785 A0
	DB $A0 ; 	;0786 A0
	DB $A0 ; 	;0787 A0
	DB $A0 ; 	;0788 A0
	DB $A0 ; 	;0789 A0
	DB $A0 ; 	;078A A0
	DB $A0 ; 	;078B A0
	DB $A0 ; 	;078C A0
	DB $A0 ; 	;078D A0
	DB $A0 ; 	;078E A0
	DB $A0 ; 	;078F A0
	DB $A0 ; 	;0790 A0
	DB $A0 ; 	;0791 A0
	DB $A0 ; 	;0792 A0
	DB $A0 ; 	;0793 A0
	DB $A0 ; 	;0794 A0
	DB $A0 ; 	;0795 A0
	DB $A0 ; 	;0796 A0
	DB $A0 ; 	;0797 A0
	DB $A0 ; 	;0798 A0
	DB $A0 ; 	;0799 A0
	DB $A0 ; 	;079A A0
	DB $A0 ; 	;079B A0
	DB $A0 ; 	;079C A0
	DB $A0 ; 	;079D A0
	DB $A0 ; 	;079E A0
	DB $A0 ; 	;079F A0
	DB $A0 ; 	;07A0 A0
	DB $A0 ; 	;07A1 A0
	DB $A0 ; 	;07A2 A0
	DB $A0 ; 	;07A3 A0
	DB $A0 ; 	;07A4 A0
	DB $A0 ; 	;07A5 A0
	DB $A0 ; 	;07A6 A0
	DB $A0 ; 	;07A7 A0
	DB $A0 ; 	;07A8 A0
	DB $A0 ; 	;07A9 A0
	DB $A0 ; 	;07AA A0

L_07ab: ; string
	DW 80		;07AB 00 50	length
	DB $A0 ; 	;07AD A0
	DB $A0 ; 	;07AE A0
	DB $A0 ; 	;07AF A0
	DB $A0 ; 	;07B0 A0
	DB $A0 ; 	;07B1 A0
	DB $A0 ; 	;07B2 A0
	DB $A0 ; 	;07B3 A0
	DB $A0 ; 	;07B4 A0
	DB $A0 ; 	;07B5 A0
	DB $A0 ; 	;07B6 A0
	DB $A0 ; 	;07B7 A0
	DB $A0 ; 	;07B8 A0
	DB $A0 ; 	;07B9 A0
	DB $A0 ; 	;07BA A0
	DB $A0 ; 	;07BB A0
	DB $A0 ; 	;07BC A0
	DB $A0 ; 	;07BD A0
	DB $A0 ; 	;07BE A0
	DB $A0 ; 	;07BF A0
	DB $A0 ; 	;07C0 A0
	DB $A0 ; 	;07C1 A0
	DB $A0 ; 	;07C2 A0
	DB $A0 ; 	;07C3 A0
	DB $A0 ; 	;07C4 A0
	DB $A0 ; 	;07C5 A0
	DB $A0 ; 	;07C6 A0
	DB $A0 ; 	;07C7 A0
	DB $A0 ; 	;07C8 A0
	DB $A0 ; 	;07C9 A0
	DB $A0 ; 	;07CA A0
	DB $A0 ; 	;07CB A0
	DB $A0 ; 	;07CC A0
	DB $A0 ; 	;07CD A0
	DB $A0 ; 	;07CE A0
	DB $A0 ; 	;07CF A0
	DB $A0 ; 	;07D0 A0
	DB $A0 ; 	;07D1 A0
	DB $A0 ; 	;07D2 A0
	DB $A0 ; 	;07D3 A0
	DB $A0 ; 	;07D4 A0
	DB $A0 ; 	;07D5 A0
	DB $A0 ; 	;07D6 A0
	DB $A0 ; 	;07D7 A0
	DB $A0 ; 	;07D8 A0
	DB $A0 ; 	;07D9 A0
	DB $A0 ; 	;07DA A0
	DB $A0 ; 	;07DB A0
	DB $A0 ; 	;07DC A0
	DB $A0 ; 	;07DD A0
	DB $A0 ; 	;07DE A0
	DB $A0 ; 	;07DF A0
	DB $A0 ; 	;07E0 A0
	DB $A0 ; 	;07E1 A0
	DB $A0 ; 	;07E2 A0
	DB $A0 ; 	;07E3 A0
	DB $A0 ; 	;07E4 A0
	DB $A0 ; 	;07E5 A0
	DB $A0 ; 	;07E6 A0
	DB $A0 ; 	;07E7 A0
	DB $A0 ; 	;07E8 A0
L_07e9:	DB $A0 ; 	;07E9 A0	start of 
	DB $A0 ; 	;07EA A0
	DB $A0 ; 	;07EB A0
	DB $A0 ; 	;07EC A0
	DB $A0 ; 	;07ED A0
	DB $A0 ; 	;07EE A0
	DB $A0 ; 	;07EF A0
	DB $A0 ; 	;07F0 A0
	DB $A0 ; 	;07F1 A0
	DB $A0 ; 	;07F2 A0
	DB $A0 ; 	;07F3 A0
	DB $A0 ; 	;07F4 A0
	DB $A0 ; 	;07F5 A0
	DB $A0 ; 	;07F6 A0
	DB $A0 ; 	;07F7 A0
	DB $A0 ; 	;07F8 A0
	DB $A0 ; 	;07F9 A0
	DB $A0 ; 	;07FA A0
	DB $A0 ; 	;07FB A0
	DB $A0 ; 	;07FC A0

L_07fd: ; string
	DW $78		;07FD 00 78	length
	DB $A0 ; 	;07FF A0
	DB $A0 ; 	;0800 A0
	DB $A0 ; 	;0801 A0
	DB $A0 ; 	;0802 A0
	DB $A0 ; 	;0803 A0
	DB $A0 ; 	;0804 A0
	DB $A0 ; 	;0805 A0
	DB $A0 ; 	;0806 A0
	DB $A0 ; 	;0807 A0
	DB $A0 ; 	;0808 A0
	DB $A0 ; 	;0809 A0
	DB $A0 ; 	;080A A0
	DB $A0 ; 	;080B A0
	DB $A0 ; 	;080C A0
	DB $A0 ; 	;080D A0
	DB $A0 ; 	;080E A0
	DB $A0 ; 	;080F A0
	DB $A0 ; 	;0810 A0
	DB $A0 ; 	;0811 A0
	DB $A0 ; 	;0812 A0
	DB $A0 ; 	;0813 A0
	DB $A0 ; 	;0814 A0
	DB $A0 ; 	;0815 A0
	DB $A0 ; 	;0816 A0
	DB $A0 ; 	;0817 A0
	DB $A0 ; 	;0818 A0
	DB $A0 ; 	;0819 A0
	DB $A0 ; 	;081A A0
	DB $A0 ; 	;081B A0
	DB $A0 ; 	;081C A0
	DB $A0 ; 	;081D A0
	DB $A0 ; 	;081E A0
	DB $A0 ; 	;081F A0
	DB $A0 ; 	;0820 A0
	DB $A0 ; 	;0821 A0
	DB $A0 ; 	;0822 A0
	DB $A0 ; 	;0823 A0
	DB $A0 ; 	;0824 A0
	DB $A0 ; 	;0825 A0
	DB $A0 ; 	;0826 A0
	DB $A0 ; 	;0827 A0
	DB $A0 ; 	;0828 A0
	DB $A0 ; 	;0829 A0
	DB $A0 ; 	;082A A0
	DB $A0 ; 	;082B A0
	DB $A0 ; 	;082C A0
	DB $A0 ; 	;082D A0
	DB $A0 ; 	;082E A0
	DB $A0 ; 	;082F A0
	DB $A0 ; 	;0830 A0
	DB $A0 ; 	;0831 A0
	DB $A0 ; 	;0832 A0
	DB $A0 ; 	;0833 A0
	DB $A0 ; 	;0834 A0
	DB $A0 ; 	;0835 A0
	DB $A0 ; 	;0836 A0
	DB $A0 ; 	;0837 A0
	DB $A0 ; 	;0838 A0
	DB $A0 ; 	;0839 A0
	DB $A0 ; 	;083A A0
	DB $A0 ; 	;083B A0
	DB $A0 ; 	;083C A0
	DB $A0 ; 	;083D A0
	DB $A0 ; 	;083E A0
	DB $A0 ; 	;083F A0
	DB $A0 ; 	;0840 A0
	DB $A0 ; 	;0841 A0
	DB $A0 ; 	;0842 A0
	DB $A0 ; 	;0843 A0
	DB $A0 ; 	;0844 A0
	DB $A0 ; 	;0845 A0
	DB $A0 ; 	;0846 A0
	DB $A0 ; 	;0847 A0
	DB $A0 ; 	;0848 A0
	DB $A0 ; 	;0849 A0
	DB $A0 ; 	;084A A0
	DB $A0 ; 	;084B A0
	DB $A0 ; 	;084C A0
	DB $A0 ; 	;084D A0
	DB $A0 ; 	;084E A0
	DB $A8 ;(	;084F A8
	DB $A0 ; 	;0850 A0
	DB $A0 ; 	;0851 A0
	DB $A0 ; 	;0852 A0
	DB $A0 ; 	;0853 A0
	DB $A0 ; 	;0854 A0
	DB $A0 ; 	;0855 A0
	DB $A0 ; 	;0856 A0
	DB $A0 ; 	;0857 A0
	DB $A0 ; 	;0858 A0
	DB $A0 ; 	;0859 A0
	DB $A0 ; 	;085A A0
	DB $A0 ; 	;085B A0
	DB $A0 ; 	;085C A0
	DB $A0 ; 	;085D A0
	DB $A0 ; 	;085E A0
	DB $A0 ; 	;085F A0
	DB $A0 ; 	;0860 A0
	DB $A0 ; 	;0861 A0
	DB $A0 ; 	;0862 A0
	DB $A0 ; 	;0863 A0
	DB $A9 ;)	;0864 A9
	DB $A0 ; 	;0865 A0
	DB $A0 ; 	;0866 A0
	DB $A0 ; 	;0867 A0
	DB $A0 ; 	;0868 A0
	DB $A0 ; 	;0869 A0
	DB $A0 ; 	;086A A0
	DB $A0 ; 	;086B A0
	DB $A0 ; 	;086C A0
	DB $A0 ; 	;086D A0
	DB $A0 ; 	;086E A0
	DB $A0 ; 	;086F A0
	DB $A0 ; 	;0870 A0
	DB $A0 ; 	;0871 A0
	DB $A0 ; 	;0872 A0
	DB $A0 ; 	;0873 A0
	DB $A0 ; 	;0874 A0
	DB $A0 ; 	;0875 A0
	DB $8D		;0876 8D

L_0877: ; string
	DW 1		;0877 00 01	length
	DB $8C		;0879 8C	formfeed

Msg_087a: ; string
	DW 2		;087A 00 02	length
	DB $A0		;087C A0	space
	DB $8D		;087D 8D	return

L_087e:	DW $191		;087E 01 91	length?
	DS $190		;0880		file record buffer
	DB 0		;0A10 00

E_0A11: ; uppercase a string, inline ptr
	LDA (XW+)	;0A11 95 41		A= inline string ptr
	STX (-SW)	;0A13 6D A2		save X
	XFR XW,YW	;0A15 55 64		save Y
	STX (-SW)	;0A17 6D A2
	LDX (AW+)	;0A19 65 01		Y= string length
	XAY		;0A1B 5C
@0A1C:	DCX		;0A1C 3F		decrement count
	BM @0a32	;0A1D 16 13
	LDAB (YW)	;0A1F 8B		get char
	LDBB #'z'+$80	;0A20 C0 FA
	SABB		;0A22 49
	BGZ @0a2e	;0A23 18 09
	LDBB #'a'+$80	;0A25 C0 E1
	SABB		;0A27 49
	BM @0a2e	;0A28 16 04
	LDAB #'A'+$80	;0A2A 80 C1
	ADDB AL,BL	;0A2C 40 31
@0A2E:	STAB (YW+)	;0A2E A5 61
	JMP @0a1c	;0A30 73 EA

@0A32:	LDA (SW+)	;0A32 95 A1		restore Y
	XAY		;0A34 5C
	LDX (SW+)	;0A35 65 A1		restore X
	RSR		;0A37 09		return

