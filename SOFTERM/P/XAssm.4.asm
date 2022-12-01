; XAssm.4.bin loaded at $200

	DW 0,0,0,0	;0200 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0208 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0210 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0218 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0220 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0228 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0230 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0238 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0240 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0248 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0250 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0258 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0260 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0268 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0270 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0278 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0280 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0288 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0290 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;0298 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;02A0 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;02A8 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;02B0 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;02B8 00 00 00 00 00 00 00 00
	DW 0,0,0,0	;02C0 00 00 00 00 00 00 00 00
L_02c8:	; top of return stack

	DW 0	;02C8 00 00

L_02ca: ; file control block?   program source?
	DB 00	;02CA 00	status
	DB 01	;02CB 01
	DB 01	;02CC 01
	DB 09	;02CD 09	device
	DB 01	;02CE 01
	DB 90	;02CF 90
	DW L_059B	;02D0 05 9B ; fixupword
	DB 00	;02D2 00
	DB 00	;02D3 00
	DB 00	;02D4 00
	DB 01	;02D5 01
	DB 02	;02D6 02
	DB 02	;02D7 02
	DB 00	;02D8 00
	DB 84	;02D9 84
	DW L_0514	;02DA 05 14 ; fixupword	record buffer?
	DB 00	;02DC 00
	DB 00	;02DD 00
	DB 00	;02DE 00
	DB 00	;02DF 00
	DB 00	;02E0 00
	DB 00	;02E1 00
	DB 00	;02E2 00
	DB 00	;02E3 00
	DB 00	;02E4 00
	DB 00	;02E5 00
	DB 00	;02E6 00
	DB 84	;02E7 84

L_02e8: ; file control block?
	DB 00	;02E8 00
	DB 02	;02E9 02
	DB 02	;02EA 02
	DB 09	;02EB 09
	DB 01	;02EC 01
	DB 90	;02ED 90
	DW L_072E	;02EE 07 2E ; fixupword
	DB 00	;02F0 00
	DB 00	;02F1 00
	DW L_236B	;02F2 23 6B ; fixupword
	DB 02	;02F4 02
	DB 04	;02F5 04
	DB 00	;02F6 00
	DB 84	;02F7 84
	DB 00	;02F8 00
	DB 00	;02F9 00
	DB 00	;02FA 00
	DB 00	;02FB 00
	DB 00	;02FC 00
	DB 00	;02FD 00
	DB 00	;02FE 00
	DB 00	;02FF 00
	DB 00	;0300 00
	DB 00	;0301 00
	DB 00	;0302 00
	DB 00	;0303 00
	DB 00	;0304 00
	DB 84	;0305 84

L_0306: ; file control block?
	DB 00	;0306 00
	DB 03	;0307 03
	DB 02	;0308 02
	DB 09	;0309 09
	DB 01	;030A 01
	DB 90	;030B 90
	DB 00	;030C 00
	DB 00	;030D 00
	DB 00	;030E 00
	DB 00	;030F 00
	DW 0	;0310 00 00
	DB 01	;0312 01
	DB 02	;0313 02
	DB 00	;0314 00
	DB 84	;0315 84
	DW 0	;0316 00 00	write string ptr
	DB 00	;0318 00
	DB 00	;0319 00
	DB 00	;031A 00
	DB 00	;031B 00
	DB 00	;031C 00
	DB 00	;031D 00
	DB 00	;031E 00
	DB 00	;031F 00
	DB 00	;0320 00
	DB 00	;0321 00
	DB 00	;0322 00
	DB 84	;0323 84

L_0324: ; file control block?
	DB 00	;0324 00
	DB 04	;0325 04
	DB 02	;0326 02
	DB 09	;0327 09
	DB 01	;0328 01
	DB 90	;0329 90
	DW 0	;032A 00 00
	DB 00	;032C 00
	DB 00	;032D 00
	DB 00	;032E 00
	DB 04	;032F 04
	DB 02	;0330 02
	DB 01	;0331 01
	DB 00	;0332 00
	DB 04	;0333 04
	DW L_08C1	;0334 08 C1 ; fixupword
	DB 00	;0336 00
	DB 00	;0337 00
	DB 00	;0338 00
	DB 00	;0339 00
	DB 00	;033A 00
	DB 00	;033B 00
	DB 00	;033C 00
	DB 00	;033D 00
	DB 00	;033E 00
	DB 00	;033F 00
	DB 00	;0340 00
	DB 04	;0341 04

E_0342: ; do file operation?
	LDAB (XW+)	;0342 85 41	get inline function code?
	LDB (XW)	;0344 DA	get inline file control block ptr?
	STAB 3(BW)	;0345 A5 28 03	set function code?
	SVC $18		;0348 66 18	file something???
	LDB (XW+)	;034A D5 41	get inline file control block ptr? again
	LDAB (BW)	;034C 89	AL=status?
	RSR		;034D 09

E_034E: ; read program source line?
	JSR E_0342	;034E 7B F2		do file operation?
	DB 1		;0350 01	 	  function?
	DW L_02CA	;0351 02 CA ; fixupword	  FCB?
	BNZ @035e	;0353 15 09		if error?
	JSR E_2344	;0355 79 23 44 ; fixupword  uppercase a string
	DW L_0514	;0358 05 14 ; fixupword
	LDA #L_0516	;035A 90 05 16 ; fixupword
	RSR		;035D 09

@035E:	JSR E_0342	;035E 7B E2		file operation?
	DB 4		;0360 04		  function?
	DW L_02CA	;0361 02 CA ; fixupword	  FCB?
	CLA		;0363 3A
L_0364:	RSR		;0364 09

L_0365:	LDA L_0324+6	;0365 93 C3
L_0367:	BNZ @036e	;0367 15 05
	LDB #$c0b0	;0369 D0 C0 B0
	JMP @0393	;036C 73 25

@036E:	LDA #$ffff	;036E 90 FF FF
	STA L_08c3	;0371 B1 08 C3 ; fixupword
	STA L_08c5	;0374 B1 08 C5 ; fixupword
	JSR E_03cd	;0377 7B 54
	LDAB #$84	;0379 80 84
	STAB L_08c3	;037B A1 08 C3 ; fixupword
	CLR AW,1	;037E 32 01
	JSR E_03cf	;0380 7B 4D
	JSR E_0342	;0382 7B BE		file operation?
	DB $b		;0384 0B		  function?
	DW L_0324	;0385 03 24 ; fixupword	  FCB?
	LDAB #1		;0387 80 01
	STAB L_0324+2	;0389 A3 9B
	JSR E_0342	;038B 7B B5		file operation?
	DB 9		;038D 09		  function?
	DW L_0324	;038E 03 24 ; fixupword	  FCB?
	LDB #$C0D1?	;0390 D0 C0 B1

@0393:	STB L_03b8+4	;0393 F3 27
	SVC $05		;0395 66 05
	DB 9		;0397 09
	DW L_03B8	;0398 03 B8 ; fixupword
??
	DW L_0A43	;039A 0A 43 ; fixupword
	DB $00		;039C 00
	DB $01		;039D 01
	DB $0B		;039E 0B
	DW E_042D	;039F 04 2D ; fixupword	; write a blank line
	DW E_03F6	;03A1 03 F6 ; fixupword		write string
	DW L_09C8	;03A3 09 C8 ; fixupword
	DW L_02CA	;03A5 02 CA ; fixupword
	DW L_02E8	;03A7 02 E8 ; fixupword
	DW L_0306	;03A9 03 06 ; fixupword
	DW L_046D	;03AB 04 6D ; fixupword	# errors
	DW L_03E0	;03AD 03 E0 ; fixupword
	DW L_0324	;03AF 03 24 ; fixupword
	DW L_08C3	;03B1 08 C3 ; fixupword
	DW L_03ED	;03B3 03 ED ; fixupword

	SVC $09		;03B5 66 09		abort
	DB $03		;03B7 03		  code

L_03b8:	DB $A0 ; 	;03B8 A0
	DB $A0 ; 	;03B9 A0
	DB $A0 ; 	;03BA A0
	DB $A0 ; 	;03BB A0
	DW $A0A0	;03BC A0 A0
	DB $00		;03BE 00

E_03BF:
	STA L_02e8+$10	;03BF B1 02 F8 ; fixupword
	JSR E_0342	;03C2 79 03 42 ; fixupword	file operation?
	DB 2		;03C5 02			  function?
	DW L_02E8	;03C6 02 E8 ; fixupword		  FCB?
	BZ L_0364	;03C8 14 9A			if no error
L_03CA:	SVC $09		;03CA 66 09			abort		
	DB $34		;03CC 34			  code

E_03CD:	CLR AW,5	;03CD 32 04
E_03CF:	LDB L_0324+6	;03CF D1 03 2A ; fixupword
	BZ @03df	;03D2 14 0B
	STA 08c1	;03D4 B1 08 C1 ; fixupword
	JSR E_0342	;03D7 79 03 42 ; fixupword	file operation?
	DB 2		;03DA 02			  function?
	DW L_0324	;03DB 03 24 ; fixupword		  FCB?
	BNZ ??		;03DD 15 EB
@03DF:	RSR		;03DF 09

E_03E0:	JSR E_0342	;03E0 79 03 42 ; fixupword	file operation?
	DB 1		;03E3 01			  function?
	DW L_0324	;03E4 03 24 ; fixupword		  FCB?
	BZ @03ec	;03E6 14 04			if no error
	JSR L_03ed	;03E8 7B 03
	LDAB #1		;03EA 80 01
@03ec:	RSR		;03EC 09

L_03ED:	JSR E_0342	;03ED 79 03 42 ; fixupword	file operation?
	DB 4		;03F0 04			  function?
	DW L_0324	;03F1 03 24 ; fixupword		  FCB?
	RSR		;03F3 09

L_03F4:	JSR E_042d	;03F4 7B 37		start a new page
E_03F6: ; write string
	LDA L_046b	;03F6 93 73		decrement lines remaining on page
	DCA		;03F8 39
	STA L_046b	;03F9 B3 70
	BLE L_03f4	;03FB 19 F7
	LDA (XW+)	;03FD 95 41		get inline string
E_03FF: ; write a line, trimming trailing spaces
	STA @0404	;03FF B3 03
	JSR E_2557	;0401 79 25 57 ; fixupword	 trim trailing spaces off a string
@0404:	DW 0		;0404 00 00
	LDB @0404	;0406 D3 FC
E_0408: ; write a line
	STB L_0306+$10	;0408 F1 03 16 ; fixupword
	LDA (BW)	;040B 99			if length > 0
	BLE @0427	;040C 19 19
	STA (-SW)	;040E B5 A2			  save A
	STB (-SW)	;0410 F5 A2			  save B
	INA		;0412 38			  increment length
	STA (BW+)	;0413 B5 21
	AAB		;0415 58			  goto end of chars
	LDAB #$8d	;0416 80 8D			  append CR
	STAB (-BW)	;0418 A5 22
	JSR E_0342	;041A 79 03 42 ; fixupword	  file operation? write line?
	DB 2		;041D 02			    function write?
	DW L_0306	;041E 03 06 ; fixupword		    FCB?
	BNZ L_03ca	;0420 15 A8			  error?
	LDB (SW+)	;0422 D5 A1			  restore B
	LDA (SW+)	;0424 95 A1			  restore A
	STA (BW)	;0426 B9			  restore string length
@0427:	RSR		;0427 09			return

E_0428: ; write a blank line
	LDB #L_0463	;0428 D0 04 63 ; fixupword
	JMP L_0408	;042B 73 DB

E_042D: ; start a new page
	LDA #L_0467	;042D 90 04 67 ; fixupword	string of form feed
	JSR E_03ff	;0430 7B CD		; write a line, trimming trailing spaces
	STX (-SW)	;0432 6D A2		save X
	LDX #6		;0434 60 00 06		for 6 times
@0437:	JSR E_0428	;0437 7B EF		  write a blank line
	DCX		;0439 3F
	BGZ @0437	;043A 18 FB
	LDA #$a0a0	;043C 90 A0 A0		blanks
	STA L_0482+7	;043F B3 48		blank out page #
	STA L_0482+$14	;0441 B3 53		blank out errors #
	LDA L_046f	;0443 93 2A		increment page #
	INA		;0445 38
	STA L_046f	;0446 B3 27
	JSR E_0473	;0448 7B 29		insert A as ASCII to ptr
	DW L_0482+2+7	;044A 04 8B ; fixupword	  ptr
	LDA L_046d	;044C 93 1F		insert # errors as ASCII to ptr
	JSR E_0473	;044E 7B 23
	DW L_0482+2+$14	;0450 04 98 ; fixupword
	LDA #L_0482	;0452 90 04 82 ; fixupword	page header line
	JSR E_03ff	;0455 7B A8		write a line, trimming trailing spaces
	JSR E_0428	;0457 7B CF		write a blank line
	JSR E_0428	;0459 7B CD		write a blank line
	LDA #52		;045B 90 00 34		init # lines remaining on page
	STA L_046b	;045E B3 0B
	LDX (SW+)	;0460 65 A1		restore X
	RSR		;0462 09		return

L_0463: ; string: space
	DW 1	;0463 00 01	length
	DB $A0 	;0465 A0	chars
	DB 0	;0466 00	unused?

L_0467: ; string: form feed
	DW 1	;0467 00 01	length
	DB $8C	;0469 8C	chars
	DB 0	;046A 00	unused?

L_046b:	DW 0	;046B 00 00	# lines remaining on page
L_046d:	DW 0	;046D 00 00	# errors
L_046f:	DW 0	;046F 00 00	page #

	DB $95	;0471 95
	DB $41	;0472 41

L_0473: ; insert A as ASCII to inline ptr
	LDB (XW+)	;0473 D5 41		B= inline ptr
	STB @0479	;0475 F3 02
	SVC $2e		;0477 66 2E		convert A to ASCII chars
@0479:	DW 0		;0479 00 00
	RSR		;047B 09

L_047C: ; B=A*B		multiply
	SVC $2b		;047C 66 2B		multiply
	RSR		;047E 09

; dead code?
	SVC $2c		;047F 66 2C		divide?
	RSR		;0481 09

L_0482: ; string: page header line
	DW 132		;0482 00 84	length
	DB $D0 ;P	;0484 D0	chars
	DB $C1 ;A	;0485 C1
	DB $C7 ;G	;0486 C7
	DB $C5 ;E	;0487 C5
	DB $A0 ; 	;0488 A0
	DB $A0 ; 	;0489 A0	page number field start
	DB $A0 ; 	;048A A0
	DB $A0 ; 	;048B A0
	DB $A0 ; 	;048C A0
	DB $A0 ; 	;048D A0
	DB $A0 ; 	;048E A0
	DB $C5 ;E	;048F C5
	DB $D2 ;R	;0490 D2
	DB $D2 ;R	;0491 D2
	DB $CF ;O	;0492 CF
	DB $D2 ;R	;0493 D2
	DB $D3 ;S	;0494 D3
	DB $A0 ; 	;0495 A0
	DB $A0 ; 	;0496 A0	# errors field start
	DB $A0 ; 	;0497 A0
	DB $A0 ; 	;0498 A0
	DB $A0 ; 	;0499 A0
	DB $A0 ; 	;049A A0
	DB $A0 ; 	;049B A0
	DB $A0 ; 	;049C A0	date?
	DB $A0 ; 	;049D A0
	DB $A0 ; 	;049E A0
	DB $A0 ; 	;049F A0
	DB $A0 ; 	;04A0 A0
	DB $A0 ; 	;04A1 A0
	DB $A0 ; 	;04A2 A0
	DB $A0 ; 	;04A3 A0
	DB $A0 ; 	;04A4 A0
	DB $A0 ; 	;04A5 A0
	DB $A0 ; 	;04A6 A0
	DB $A0 ; 	;04A7 A0
	DB $A0 ; 	;04A8 A0
	DB $A0 ; 	;04A9 A0
	DB $A0 ; 	;04AA A0
	DB $A0 ; 	;04AB A0
	DB $A0 ; 	;04AC A0
	DB $A0 ; 	;04AD A0
	DB $A0 ; 	;04AE A0
	DB $A0 ; 	;04AF A0
	DB $A0 ; 	;04B0 A0
L_04b1:	DB $A0 ; 	;04B1 A0
	DB $A0 ; 	;04B2 A0
	DB $A0 ; 	;04B3 A0
	DB $A0 ; 	;04B4 A0
	DB $A0 ; 	;04B5 A0
	DB $A0 ; 	;04B6 A0
	DB $A0 ; 	;04B7 A0
	DB $A0 ; 	;04B8 A0
	DB $A0 ; 	;04B9 A0
	DB $A0 ; 	;04BA A0
	DB $A0 ; 	;04BB A0
L_04bc:	DB $A0 ; 	;04BC A0
	DB $A0 ; 	;04BD A0
	DB $A0 ; 	;04BE A0
	DB $A0 ; 	;04BF A0
	DB $A0 ; 	;04C0 A0
	DB $A0 ; 	;04C1 A0
	DB $A0 ; 	;04C2 A0
	DB $A0 ; 	;04C3 A0
	DB $A0 ; 	;04C4 A0
	DB $A0 ; 	;04C5 A0
	DB $A0 ; 	;04C6 A0
	DB $A0 ; 	;04C7 A0
	DB $A0 ; 	;04C8 A0
	DB $A0 ; 	;04C9 A0
	DB $A0 ; 	;04CA A0
	DB $A0 ; 	;04CB A0
	DB $A0 ; 	;04CC A0
	DB $A0 ; 	;04CD A0
	DB $A0 ; 	;04CE A0
	DB $A0 ; 	;04CF A0
	DB $A0 ; 	;04D0 A0
	DB $A0 ; 	;04D1 A0
	DB $A0 ; 	;04D2 A0
	DB $A0 ; 	;04D3 A0
	DB $A0 ; 	;04D4 A0
	DB $A0 ; 	;04D5 A0
	DB $A0 ; 	;04D6 A0
	DB $A0 ; 	;04D7 A0
	DB $A0 ; 	;04D8 A0
	DB $A0 ; 	;04D9 A0
	DB $A0 ; 	;04DA A0
	DB $A0 ; 	;04DB A0
	DB $A0 ; 	;04DC A0
	DB $A0 ; 	;04DD A0
	DB $A0 ; 	;04DE A0
	DB $A0 ; 	;04DF A0
	DB $A0 ; 	;04E0 A0
	DB $A0 ; 	;04E1 A0
	DB $A0 ; 	;04E2 A0
	DB $A0 ; 	;04E3 A0
	DB $A0 ; 	;04E4 A0
	DB $A0 ; 	;04E5 A0
	DB $A0 ; 	;04E6 A0
	DB $A0 ; 	;04E7 A0
	DB $A0 ; 	;04E8 A0
	DB $A0 ; 	;04E9 A0
	DB $A0 ; 	;04EA A0
	DB $A0 ; 	;04EB A0
	DB $A0 ; 	;04EC A0
	DB $A0 ; 	;04ED A0
	DB $A0 ; 	;04EE A0
	DB $A0 ; 	;04EF A0
	DB $A0 ; 	;04F0 A0
	DB $A0 ; 	;04F1 A0
	DB $A0 ; 	;04F2 A0
	DB $A0 ; 	;04F3 A0
	DB $A0 ; 	;04F4 A0
	DB $A0 ; 	;04F5 A0
	DB $A0 ; 	;04F6 A0
	DB $A0 ; 	;04F7 A0
	DB $A0 ; 	;04F8 A0
	DB $A0 ; 	;04F9 A0
	DB $A0 ; 	;04FA A0
	DB $A0 ; 	;04FB A0
	DB $A0 ; 	;04FC A0
	DB $A0 ; 	;04FD A0
	DB $A0 ; 	;04FE A0
	DB $A0 ; 	;04FF A0
	DB $A0 ; 	;0500 A0
	DB $A0 ; 	;0501 A0
	DB $A0 ; 	;0502 A0
	DB $A0 ; 	;0503 A0
	DB $A0 ; 	;0504 A0
	DB $A0 ; 	;0505 A0
	DB $A0 ; 	;0506 A0
	DB $A0 ; 	;0507 A0
	DB $A0 ; 	;0508 A0
	DB $A0 ; 	;0509 A0
	DB $A0 ; 	;050A A0
	DB $A0 ; 	;050B A0
	DB $A0 ; 	;050C A0
	DB $A0 ; 	;050D A0
	DB $A0 ; 	;050E A0
	DB $A0 ; 	;050F A0
	DB $A0 ; 	;0510 A0
	DB $A0 ; 	;0511 A0
	DB $A0 ; 	;0512 A0
	DB 0		;0513 00

L_0514: ; string: source file record buffer?
	DS 2		;0514   length
	DS ??		;0516	chars




E_072E: ; Main entry point
	JMP L_2576	;072E 71 25 76 ; fixupword

	DW L_08C8	;0731 08 C8 ; fixupword

L_08c3:	DS 2		;08c3
L_08c5:	DS 2		;08c5

L_08C8:
	LDA (XW+)	;08C8 95 41
	STA L_08ed	;08CA B3 21
	LDB #60		;08CC D0 00 3C
	AAB		;08CF 58
	STB L_08eb	;08D0 F3 19
	LDB (XW+)	;08D2 D5 41
	STB L_08e9	;08D4 F3 13
	LDB (XW+)	;08D6 D5 41
	STB L_08ef	;08D8 F3 15
	STX (-SW)	;08DA 6D A2		save X
	LDX #60/2	;08DC 60 00 1E		zero 60 bytes
	CLR BW,0	;08DF 32 20
@08E1:	STB (AW+)	;08E1 F5 01
	DCX		;08E3 3F
	BNZ @08e1	;08E4 15 FB
	LDX (SW+)	;08E6 65 A1		restore X
	RSR		;08E8 09		return

L_08e9: DS 2	; 2nd parm
L_08eb:	DS 2	; end of buf
L_08ed: DS 2	; start of buf
L_08ef:	DS 2	; 3rd parm

E_08F1: ; alloc memory???
	LDA (XW+)	;08F1 95 41		get requested size
	LDB L_08eb	;08F3 D3 F6		return location
	STB (XW+)	;08F5 F5 41
	AAB		;08F7 58		bump buf ptr
	LDA L_08e9	;08F8 93 EF		overflowed?
	SUB AW,BW	;08FA 51 20
	BL @0901	;08FC 10 03
	STB L_08eb	;08FE F3 EB		save new end
	RSR		;0900 09

@0901:					; overflowed buffer, get more
	SVC $59		;0901 66 59		alloc another contig page???
	SVC $07		;0903 66 07		yield?
	LDB L_08e9	;0905 D3 E2		clear 2KBytes at end of buf
	CLR AW,8	;0907 32 08
@0909:	FIL $100,#0,(B)	;0909 47 9E FF 00 02  ssss=9 mm=3 nn=2 count=100 ??
	ADD BW,BW,#$100 ;090E 50 32 01 00
	DCA		;0912 39
	BGZ @0909	;0913 18 F4
	STB L_08e9	;0915 F3 D2		save new buf end
	DCR XW,4	;0917 31 43		try the command again
	JMP E_08f1	;0919 73 D6

E_091B: ; convert char in AL to index in BW
	LDBB #'>'+$80	;091B C0 BE
	SABB		;091D 49
	BM @0926	;091E 16 06
	LDAB #$1d	;0920 80 1D
	SUBB AL,BL	;0922 41 31
	BLE @0928	;0924 19 02
@0926:	LDBB #$1d	;0926 C0 1D
@0928:	CLRB BH,0	;0928 22 20
	SLR BW,1	;092A 35 20
	LDA L_08ed	;092C 93 BF
	AAB		;092E 58
	RSR		;092F 09

E_0930: ; alloc memory for ???
	LDAB @(XW)	;0930 85 44
	JSR E_091b	;0932 7B E7
	LDA 2(XW)	;0934 95 48 02
	STA @0966+1	;0937 B3 2E
	STX (-SW)	;0939 6D A2
	XFR XW,BW	;093B 55 24
	LDB L_08ef	;093D D3 B0
	INA		;093F 38
	INA		;0940 38
	INA		;0941 38
	AAB		;0942 58
	STB @0947	;0943 F3 02
	JSR E_08f1	;0945 7B AA		alloc memory?
@0947:	DW 0		;0947 00 00		requested size
@0949:	DW 0		;0949 00 00		ptr to new mem
	LDA @0949	;094B 93 FC
	BZ @097d	;094D 14 2E
	LDB (XW)	;094F DA
	STA (XW)	;0950 BA
	STB (AW+)	;0951 F5 01
	LDB 08ef	;0953 D3 9A
	INA		;0955 38
	AAB		;0956 58
	STB @0963+1	;0957 F3 0B
	LDA @0966+1	;0959 93 0C
	STA (-BW)	;095B B5 22
	LDX (SW)	;095D 65 A0
	LDB (XW+)	;095F D5 41
	STX (SW)	;0961 6D A0
@0963:	LDX #0		;0963 60 00 00 modified
@0966:	LDA #0		;0966 90 00 00 modified
	DCA		;0969 39
	MVF (A),(B),(X)	;096A 67 4A 24
	LDX (SW+)	;096D 65 A1
	LDa (@0963+1)	;096F 93 F3
	DCA		;0971 39
	DCA		;0972 39
	DCA		;0973 39
	LDB L_08ef	;0974 D1 08 EF ; fixupword
	SAB		;0977 59
	LDA (XW+)	;0978 95 41
	STB (XW+)	;097A F5 41
	RSR		;097C 09

@097D:	LDX (SW+)	;097D 65 A1
	LDB (XW+)	;097F D5 41
	LDB (XW+)	;0981 D5 41
	STA (XW+)	;0983 B5 41
	RSR		;0985 09

E_0986:	LDAB @(XW)	;0986 85 44
	JSR E_091b	;0988 7B 91
	LDA (XW+)	;098A 95 41
	STA @09b1	;098C B3 23
	LDA (XW+)	;098E 95 41
	STA @09af	;0990 B3 1D
	STX (-SW)	;0992 6D A2
	XFR XW,BW	;0994 55 24
@0996:	LDA (XW)	;0996 9A
	BZ @09c3	;0997 14 2A
	XAX		;0999 5B
	INA		;099A 38
	INA		;099B 38
	INA		;099C 38
@099d:	LDB L_08ef	;099D D1 08 EF ; fixupword
	AAB		;09A0 58
	STB @09b3	;09A1 F3 10
	CLA		;09A3 3A
	LDAB $ff(BW)	;09A4 85 28 FF
	LDB @09af	;09A7 D3 06
	SAB		;09A9 59
	BNZ @0996	;09AA 15 EA
	JSR E_2511	;09AC 79 25 11 ; fixupword
@09af:	DW 0		;09AF 00 00	length
@09b1:	DW 0		;09B1 00 00	addr1
@09b3:	DW 0		;09B3 00 00	addr2
	XFRB BL,BL	;09B5 45 33
	BNZ @0996	;09B7 15 DD
	LDA 09b3	;09B9 93 F8
	DCA		;09BB 39
	DCA		;09BC 39
	DCA		;09BD 39
	LDB (@099d+1)	;09BE D4 DE
	SAB		;09C0 59
	XFR AW,BW	;09C1 55 20
@09C3:	LDX (SW+)	;09C3 65 A1
	STA (XW+)	;09C5 B5 41
	RSR		;09C7 09

E_09C8: ; find a string in some table???  maybe symbol lookup???
	SVC $07		;09C8 66 07		yield
	LDB (XW+)	;09CA D5 41		get inline parm
	STB @09ea	;09CC F3 1C		  save as string1
	STB @0a07	;09CE F3 37		  "
	LDA (BW+)	;09D0 95 21		get string1 length
	LDAB (BW)	;09D2 89		get string1 1st char
	STAB (-SW)	;09D3 A5 A2		stack it

@09D5:	JSR E_091b	;09D5 79 09 1B ; fixupword
	STX (-SW)	;09D8 6D A2
	XFR XW,BW	;09DA 55 24
@09DC:	LDA (XW)	;09DC 9A
	BZ @0a33	;09DD 14 54
	STA (-SW)	;09DF B5 A2
	INA		;09E1 38
	LDB (099e)	;09E2 D4 BA	08ef
	AAB		;09E4 58
	STB @09ec	;09E5 F3 05
	JSR E_24db	;09E7 79 24 DB ; fixupword	compare 2 strings
@09ea:	DW 0		;09EA 00 00		string1
@09ec:	DW 0		;09EC 00 00		string2
	BM @09f4	;09EE 16 04
	LDX (SW+)	;09F0 65 A1
	JMP @09dc	;09F2 73 E8

@09F4:	LDA @09ec	;09F4 93 F6
	STA @0a17	;09F6 B3 1F
	LDX (SW+)	;09F8 65 A1
@09FA:	LDA (XW)	;09FA 9A
	BZ @0a25	;09FB 14 28
	STA (-SW)	;09FD B5 A2
	INA		;09FF 38
	LDB (099e)	;0A00 D4 9C	08ef
	AAB		;0A02 58
	STB @0a09	;0A03 F3 04
	JSR (09e8)	;0A05 7C E1	E_24db compare 2 strings
@0a07:	DW 0		;0A07 00 00	  string1
@0a09:	DW 0		;0A09 00 00	  string2
	BM @0a11	;0A0B 16 04
	LDX (SW+)	;0A0D 65 A1
	JMP @09fa	;0A0F 73 E9

@0A11:	LDA @0a09	;0A11 93 F6
	STA @0a19	;0A13 B3 04
	JSR (09e8)	;0A15 7C D1	E_24db compare 2 strings
@0a17:	DW 0		;0A17 00 00	  string1
@0a19:	DW 0		;0A19 00 00	  string2
	BM @0a21	;0A1B 16 04
	LDA 0a19	;0A1D 93 FA
	STA 0a17	;0A1F B3 F6
@0A21:	LDX (SW+)	;0A21 65 A1
	JMP @09fa	;0A23 73 D5

@0A25:	LDA @0a17	;0A25 93 F0
	LDB 08ef	;0A27 D1 08 EF ; fixupword
	DCA		;0A2A 39
	SAB		;0A2B 59
	LDX (SW+)	;0A2C 65 A1
	LDAB (SW+)	;0A2E 85 A1
	STB (XW+)	;0A30 F5 41
	RSR		;0A32 09

@0A33:	LDX (SW+)	;0A33 65 A1
	LDAB (SW)	;0A35 8D
	INAB		;0A36 28
	STAB (SW)	;0A37 AD
	LDBB #$da	;0A38 C0 DA
	SABB		;0A3A 49
	BLE @09d5	;0A3B 19 98
	LDAB (SW+)	;0A3D 85 A1
	CLA		;0A3F 3A
	STA (XW+)	;0A40 B5 41
	RSR		;0A42 09

L_0A43:	LDA #L_2343	;0A43 90 23 43 ; fixupword	init expression eval stack ptr
	XAY		;0A46 5C
	JSR E_08c8	;0A47 79 08 C8 ; fixupword
L_0a4a:	DW 0		;0A4A 00 00
L_0a4c:	DW 0		;0A4C 00 00
	DW 3		;0A4E 00 03
	JSR E_0a76	;0A50 7B 24
	JSR E_0ab1	;0A52 7B 5D
	LDA L_0a9e	;0A54 93 48			remember start location counter
	STA L_1cae	;0A56 B1 1C AE ; fixupword
	LDAB #1		;0A59 80 01
	STAB L_0a90	;0A5B A3 33
	JSR E_0a76	;0A5D 7B 17
	JSR E_0ab1	;0A5F 7B 50
	JSR E_1d09	;0A61 79 1D 09 ; fixupword
	DW L_1D92	;0A64 1D 92 ; fixupword
	JSR E_1d09	;0A66 79 1D 09 ; fixupword
	DW L_1D16	;0A69 1D 16 ; fixupword
	JSR E_1c0b	;0A6B 79 1C 0B ; fixupword
	JSR E_1c9d	;0A6E 79 1C 9D ; fixupword
	DW L_0A8C	;0A71 0A 8C ; fixupword
	JMP L_0365	;0A73 71 03 65 ; fixupword

E_0A76:	CLA		;0A76 3A
	STAB L_1d17	;0A77 A1 1D 17 ; fixupword
	STAB L_1d93	;0A7A A1 1D 93 ; fixupword
	STA L_0a9e	;0A7D B3 1F			init location counter
	STAB L_1c22	;0A7F A1 1C 22 ; fixupword
	STA L_0a8e	;0A82 B3 0A
	STA L_046d	;0A84 B1 04 6D ; fixupword	init # errors
	LDA #L_2343	;0A87 90 23 43 ; fixupword
	XAY		;0A8A 5C
	RSR		;0A8B 09


	DB 00	;0A8C 00
	DB 00	;0A8D 00
L_0aae:	DW 0	;0A8E 00 00
L_0a90:	DB 0	;0A90 00
L_0a91:	DB 0	;0A91 00
L_0a92:	DB 1	;0A92 01	PRInt on/off
L_0a93:	DB 1	;0A93 01	PRInt co/no   console?
L_0a99:	DB 0	;0A99 00
L_0a9a:	DB 0	;0A9A 00
L_0a9b:	DW 0	;0A9B 00 00
L_0a9d:	DB 0	;0A9D 00	operand size in bytes?
L_0a9e:	DW 0	;0A9E 00 00	location counter
L_0aa0:	DB 0	;0AA0 00
L_0aa1:	DW 0	;0AA1 00 00
L_0aa3:	DW 0	;0AA3 00 00
L_0aa5:	DW 0	;0AA5 00 00
L_0aa7	DW 0	;0AA7 00 00
L_0aa9:	DW 0	;0AA9 00 00
L_0aab:	DW 00	;0AAB 00 00
L_0aad:	DW 0	;0AAD 00 00
L_0aaf:	DW 0	;0AAF 00 00

E_0AB1:
	JSR E_034e	;0AB1 79 03 4E ; fixupword	 read program source line?
	XAZ		;0AB4 5E
	BNZ @0ab8	;0AB5 15 01
	RSR		;0AB7 09

@0AB8:	LDAB (ZW)	;0AB8 8C		get source char
	LDBB #0		;0AB9 C0 00		if null
	SABB		;0ABB 49
	BNZ @0ac2	;0ABC 15 04
	INR ZW,1	;0ABE 30 80		  skip the null (why?)
	JMP E_0ab1	;0AC0 73 EF		  go read another line

@0AC2:	LDA #L_2343	;0AC2 90 23 43 ; fixupword
	XAY		;0AC5 5C
	LDAB #4		;0AC6 80 04
	STAB L_0a9a	;0AC8 A3 D0
	CLA		;0ACA 3A
	STA L_0aa1	;0ACB B3 D4
	STA L_0aa5	;0ACD B3 D6
	STA L_0aa9	;0ACF B3 D8
	STA L_0aad	;0AD1 B3 DA
	STAB L_1a5f	;0AD3 A1 1A 5F ; fixupword
	STAB L_0a99	;0AD6 A3 C1
	STA L_0a9b	;0AD8 B3 C1
	STAB L_0a9d	;0ADA A3 C1
	STAB L_0aa0	;0ADC A3 C2
	JSR E_1e2a	;0ADE 79 1E 2A ; fixupword
	JSR E_0ae8	;0AE1 7B 05
	JSR E_1a60	;0AE3 79 1A 60 ; fixupword
	JMP L_0ab1	;0AE6 73 C9

L_0AE8:	LDAB (ZW)	;0AE8 8C
	LDBB #'*'+$80	;0AE9 C0 AA
	SABB		;0AEB 49
	BNZ @0b04	;0AEC 15 16
	XFR AW,ZW	;0AEE 55 80
	STA L_0aa1	;0AF0 B3 AF
	JSR @0b15	;0AF2 7B 21
	LDA L_0aaf	;0AF4 93 B9
	STA L_0aa3	;0AF6 B3 AB
	CLA		;0AF8 3A
	STA L_0aad	;0AF9 B3 B2
	STAB (-YW)	;0AFB A5 62
	STA (-YW)	;0AFD B5 62
	STA (-YW)	;0AFF B5 62
	STA (-YW)	;0B01 B5 62
	RSR		;0B03 09

@0B04:	JSR E_0b26	;0B04 7B 20
	JSR E_1a10	;0B06 79 1A 10 ; fixupword  skip spaces in (Z)
	LDAB (ZW+)	;0B09 85 81
	LDBB #0		;0B0B C0 00
	SABB		;0B0D 49
	BZ @0b14	;0B0E 14 04
	DCR ZW,1	;0B10 31 80
	JSR @0b15	;0B12 7B 01
@0B14:	RSR		;0B14 09

@0B15:	XFR AW,ZW	;0B15 55 80
	STA L_0aad	;0B17 B3 94
	LDAB #0		;0B19 80 00
@0B1B:	LDBB (ZW+)	;0B1B C5 81
	SABB		;0B1D 49
	BNZ @0b1b	;0B1E 15 FB
	XFR AW,ZW	;0B20 55 80
	DCA		;0B22 39
	STA L_0aaf	;0B23 B3 8A
	RSR		;0B25 09

L_0B26:	LDAB (ZW)	;0B26 8C
	JSR E_19e3	;0B27 79 19 E3 ; fixupword
	BM @0b32	;0B2A 16 06
	JSR @0b43	;0B2C 7B 15
	LDAB #1		;0B2E 80 01
	JMP @0b34	;0B30 73 02

@0B32:	LDAB #0		;0B32 80 00
@0B34:	STAB (-YW)	;0B34 A5 62
	LDA L_0a9e	;0B36 91 0A 9E ; fixupword	push location counter
	STA (-YW)	;0B39 B5 62
	JSR @0b7a	;0B3B 7B 3D		
	XFR AW,ZW	;0B3D 55 80
	STA L_0aab	;0B3F B1 0A AB ; fixupword
	RSR		;0B42 09

@0B43:	XFR AW,ZW	;0B43 55 80
	STA L_0aa1	;0B45 B1 0A A1 ; fixupword
	LDAB #1		;0B48 80 01
	STAB L_0a91	;0B4A A1 0A 91 ; fixupword
	JSR E_185f	;0B4D 79 18 5F ; fixupword
	CLA		;0B50 3A
	STAB L_0a91	;0B51 A1 0A 91 ; fixupword
	XFR AW,ZW	;0B54 55 80
	STA L_0aa3	;0B56 B1 0A A3 ; fixupword
	LDA (YW)	;0B59 9B
	LDB 2(AW)	;0B5A D5 08 02
	LDBB #2		;0B5D C0 02
	ANDB BL,BH	;0B5F 42 23
	BNZ @0b79	;0B61 15 16
	LDBB #1		;0B63 C0 01
	ANDB BL,BH	;0B65 42 23
	BZ @0b72	;0B67 14 09
	LDBB L_0a90	;0B69 C1 0A 90 ; fixupword
	BNZ @0b72	;0B6C 15 04
	JSR E_1a2e	;0B6E 79 1A 2E ; fixupword	M error
	RSR		;0B71 09

@0B72:	LDBB #1		;0B72 C0 01
	ORIB BL,BH	;0B74 43 23
	STBB 2(AW)	;0B76 E5 08 02
@0B79:	RSR		;0B79 09

@0B7A:	JSR E_1a10	;0B7A 79 1A 10 ; fixupword	 skip spaces in (Z)
	LDAB (ZW)	;0B7D 8C
	LDBB #0		;0B7E C0 00
	SABB		;0B80 49
	BNZ @0b89	;0B81 15 06
	CLA		;0B83 3A
	STA (-YW)	;0B84 B5 62
	STA (-YW)	;0B86 B5 62
	RSR		;0B88 09

@0B89:	XFR AW,ZW	;0B89 55 80
	STA L_0aa5	;0B8B B1 0A A5 ; fixupword
	JSR E_1e59	;0B8E 79 1E 59 ; fixupword	look up opcode
	LDAB (YW)	;0B91 8B			valid?
	INAB		;0B92 28
	BZ @0ba2	;0B93 14 0D
	DCAB		;0B95 29
	SRAB		;0B96 2C			pseudo-op?
	BL @0b9e	;0B97 10 05
	JSR E_0db0	;0B99 79 0D B0 ; fixupword	do opcode
	JMP @0bb2	;0B9C 73 14

@0B9E: ; do pseudo-op
	JSR E_0bc7	;0B9E 7B 27			call the pseudo-op routine
	JMP @0bb2	;0BA0 73 10

@0BA2:	JSR E_1a02	;0BA2 79 1A 02 ; fixupword
	XFR AW,ZW	;0BA5 55 80
	STA L_0aa7	;0BA7 B1 0A A7 ; fixupword
	CLA		;0BAA 3A
	STA (YW)	;0BAB BB
	STA (-YW)	;0BAC B5 62
	JSR E_1a34	;0BAE 79 1A 34 ; fixupword	O error
	RSR		;0BB1 09

@0BB2:	LDAB (ZW)	;0BB2 8C
	LDBB #','+$80	;0BB3 C0 AC
	SABB		;0BB5 49
	BZ @0bbc	;0BB6 14 04
	CLA		;0BB8 3A
	STA (-YW)	;0BB9 B5 62
	RSR		;0BBB 09

@0BBC:	INR ZW,1	;0BBC 30 80
	JSR E_15e5	;0BBE 79 15 E5 ; fixupword
	XFR AW,ZW	;0BC1 55 80
	STA L_0aab	;0BC3 B1 0A AB ; fixupword
	RSR		;0BC6 09

E_0BC7: ; do pseudo-op
	JSR 1a02	;0BC7 79 1A 02 ; fixupword
	XFR AW,ZW	;0BCA 55 80
	STA L_0aa7	;0BCC B1 0A A7 ; fixupword
	JSR E_1a10	;0BCF 79 1A 10 ; fixupword	 skip spaces in (Z)
	XFR AW,ZW	;0BD2 55 80
	STA L_0aa9	;0BD4 B1 0A A9 ; fixupword
	LDAB (YW+)	;0BD7 85 61			drop processor parm
	LDAB (YW+)	;0BD9 85 61			get opcode parm
	CLRB AH,0	;0BDB 22 00			jmp indexed
	SLA		;0BDD 3D
	LDB #@0be4	;0BDE D0 0B E4 ; fixupword
	AAB		;0BE1 58
	JMP @(BW)	;0BE2 75 24

@0be4: ; indexed by pseudo-op opcode
	DW L_0C00	;0BE4 0C 00 ; fixupword	0=EQU
	DW L_0C04	;0BE6 0C 04 ; fixupword 1=???
	DW L_0C2A	;0BE8 0C 2A ; fixupword 2=ORG
	DW L_0C47	;0BEA 0C 47 ; fixupword 3=DB
	DW L_0C53	;0BEC 0C 53 ; fixupword 4=DW
	DW L_0C5B	;0BEE 0C 5B ; fixupword 5=DC
	DW L_0C5F	;0BF0 0C 5F ; fixupword 6=DS
	DW L_0C77	;0BF2 0C 77 ; fixupword 7=BEG
	DW L_0CA2	;0BF4 0C A2 ; fixupword 8=END
	DW L_0CB0	;0BF6 0C B0 ; fixupword 9=ENT
	DW L_0CB4	;0BF8 0C B4 ; fixupword A=EXT
	DW L_0CBA	;0BFA 0C BA ; fixupword B=PRInt
	DW L_0CF7	;0BFC 0C F7 ; fixupword C=TITle
	DW L_0D1F	;0BFE 0D 1F ; fixupword D=EJEct


E_0C00: ; EQU
	LDA (YW+)	;0C00 95 61
	JMP L_0c18	;0C02 73 14

E_0C04: ; some? pseudo-op
	LDAB #2		;0C04 80 02
	LDB (YW+)	;0C06 D5 61
	LDBB (YW)	;0C08 CB
	BZ L_0c18	;0C09 14 0D
	LDB 01(YW)	;0C0B D5 68 01
	XFRB AH,AL	;0C0E 45 10
	LDAB 2(BW)	;0C10 85 28 02
	ORIB AL,AH	;0C13 43 01
	STAB 2(BW)	;0C15 A5 28 02
L_0C18:	JSR (L_0c62+1)	;0C18 7C 49	E_15e5
	JSR (L_0c65+1)	;0C1A 7C 4A	E_1b5e	insert operand into print line
	CLA		;0C1C 3A
	STA (-YW)	;0C1D B5 62
	JSR E_0c3e	;0C1F 7B 1D
L_0c21:	LDAB L_0a99	;0C21 81 0A 99 ; fixupword
	BNZ @0c29	;0C24 15 03
	STAB 0a9a	;0C26 A1 0A 9A ; fixupword
@0C29:	RSR		;0C29 09

L_0C2A: ; ORG
	LDA (YW+)	;0C2A 95 61
	JSR (L_0c62+1)	;0C2C 7C 35	E_15e5
	LDA (YW)	;0C2E 9B
	STA L_0a9e	;0C2F B1 0A 9E ; fixupword	set location counter
	LDAB (L_0c21+1)	;0C32 84 EE
	BNZ L_0c38	;0C34 15 02
	JSR (L_0c43+1)	;0C36 7C 0C
L_0C38:	JSR E_0c3e	;0C38 7B 04
L_0C3A:	CLA		;0C3A 3A
L_0C3B:	STA (-YW)	;0C3B B5 62
	RSR		;0C3D 09

E_0C3E:	LDA L_0a9b	;0C3E 91 0A 9B ; fixupword
	BZ L_0c46	;0C41 14 03
L_0c43:	JSR E_1a1a	;0C43 79 1A 1A ; fixupword	if ??? A error
L_0C46:	RSR		;0C46 09

E_0C47: ; DB
	LDAB #1		;0C47 80 01			set operand size to 1
	STAB L_0a9d	;0C49 A1 0A 9D ; fixupword
	JSR E_1534	;0C4C 79 15 34 ; fixupword
	CLA		;0C4F 3A
	INA		;0C50 38
	JMP L_0c3b	;0C51 73 E8

E_0C53: ; DW
	JSR E_1534	;0C53 79 15 34 ; fixupword
	LDA #2		;0C56 90 00 02
	JMP L_0c3b	;0C59 73 E0

E_0C5B: ; DC
	JSR E_0d6f	;0C5B 79 0D 6F ; fixupword
	RSR		;0C5E 09

E_0C5F: ; DS
	JSR E_1b6a	;0C5F 79 1B 6A ; fixupword	insert location counter into print line
L_0c62:	JSR E_15e5	;0C62 79 15 E5 ; fixupword
L_0c65:	JSR E_1b5e	;0C65 79 1B 5E ; fixupword	insert operand into print line
	LDA (YW+)	;0C68 95 61			bump location counter
	LDB L_0a9e	;0C6A D1 0A 9E ; fixupword
	AAB		;0C6D 58
	STB L_0a9e	;0C6E F1 0A 9E ; fixupword
	LDAB (L_0c21+1)	;0C71 84 AF	L_0a99
	BZ L_0c38	;0C73 14 C3
	JSR (L_0c43+1)	;0C75 7C CD	E_1a1a		if ??? A error
E_0C77: ; BEG
	LDA (YW+)	;0C77 95 61
	LDAB (YW)	;0C79 8B
	BZ @0c8e	;0C7A 14 12
	LDA 1(YW)	;0C7C 95 68 01
	LDB 2(AW)	;0C7F D5 08 02
	LDBB #8		;0C82 C0 08
	ORIB BL,BH	;0C84 43 23
	STBB 2(AW)	;0C86 E5 08 02
	JSR E_1ba4	;0C89 79 1B A4 ; fixupword
	DW L_1CB1	;0C8C 1C B1 ; fixupword
@0C8E:	JSR (L_0c62+1)	;0C8E 7C D3	E_15e5
	LDA (YW)	;0C90 9B
	STA L_0a9e	;0C91 B1 0A 9E ; fixupword	set location counter
	STA L_1cac	;0C94 B1 1C AC ; fixupword
	LDAB #5		;0C97 80 05
	JSR E_1cb9	;0C99 79 1C B9 ; fixupword
	CLA		;0C9C 3A
	STA L_1cae	;0C9D B1 1C AE ; fixupword
	JMP L_0c38	;0CA0 73 96

E_0CA2: ; END
	JSR E_1b6a	;0CA2 79 1B 6A ; fixupword	insert location counter into print line
	JSR (L_0c62+1)	;0CA5 7C BC	E_15e5
	JSR (L_0c65+1)	;0CA7 7C BD	E_1b5e	insert operand into print line
	LDA (YW+)	;0CA9 95 61
	STA L_0a8e	;0CAB B1 0A 8E ; fixupword
	JMP L_0c38	;0CAE 73 88

E_0CB0: ; ENT
	LDAB #8		;0CB0 80 08
	JMP L_0cb6	;0CB2 73 02

E_0CB4: ; EXT
	LDAB #$11	;0CB4 80 11
L_0CB6:	JSR E_0d2a	;0CB6 7B 72
	JMP L_0c3a	;0CB8 73 80

E_0CBA: ; PRInt
	LDA (ZW)	;0CBA 9C			get next chars
	LDB #$cfce	;0CBB D0 CF CE	"ON"  on
	SAB		;0CBE 59
	BNZ @0cc5	;0CBF 15 04
	LDBB #1		;0CC1 C0 01
	JMP @0ccb	;0CC3 73 06

@0CC5:	LDB #$cfc6	;0CC5 D0 CF C6	"OF" off
	SAB		;0CC8 59
	BNZ @0cd0	;0CC9 15 05
@0CCB:	STBB L_0a92	;0CCB E1 0A 92 ; fixupword
	JMP @0ce7	;0CCE 73 17

@0CD0:	LDB #$c3cf	;0CD0 D0 C3 CF	"CO"
	SAB		;0CD3 59
	BNZ @0cda	;0CD4 15 04
	LDBB #1		;0CD6 C0 01
	JMP @0ce4	;0CD8 73 0A

@0CDA:	LDB #$cecf	;0CDA D0 CE CF	"NO"
	SAB		;0CDD 59
	BZ @0ce4	;0CDE 14 04
	JSR E_1a48	;0CE0 79 1A 48 ; fixupword	syntax error
	RSR		;0CE3 09

@0CE4:	STBB L_0a93	;0CE4 E1 0A 93 ; fixupword
@0CE7:	JSR 1a02	;0CE7 79 1A 02 ; fixupword
	LDAB (ZW+)	;0CEA 85 81
	LDBB #'<'+$80	;0CEC C0 AC
	SABB		;0CEE 49
	BZ E_0cba	;0CEF 14 C9
	DCR ZW,1	;0CF1 31 80
	CLA		;0CF3 3A
	STA (-YW)	;0CF4 B5 62
	RSR		;0CF6 09

E_0CF7: ; TITle
	JSR L_0d6f	;0CF7 7B 76
	LDX (YW+)	;0CF9 65 61
	ADD YW,XW	;0CFB 50 46
	XFR AW,YW	;0CFD 55 60
	STA (-SW)	;0CFF B5 A2
	LDB #$57	;0D01 D0 00 57
	SUB BW,XW	;0D04 51 42
	BLE 0d0b	;0D06 19 03
	LDX #$57	;0D08 60 00 57
L_0D0B:	LDA #L_04bc	;0D0B 90 04 BC ; fixupword   ^ title in header line
@0D0E:	LDBB (-YW)	;0D0E C5 62			copy to header line
	STBB (AW+)	;0D10 E5 01
	DCX		;0D12 3F
	BGZ @0d0e	;0D13 18 F9
	LDB #L_0482+2	;0D15 D0 04 84 ; fixupword	update page header line length
	SAB		;0D18 59
	STB L_0482+0	;0D19 F1 04 82 ; fixupword
	LDA (SW+)	;0D1C 95 A1
	XAY		;0D1E 5C
L_0D1F: ; EJEct
	CLA		;0D1F 3A			set # lines remaining on paage to zero
	STA L_046b	;0D20 B1 04 6B ; fixupword
	STA (-YW)	;0D23 B5 62
	STA (-YW)	;0D25 B5 62
	LDX (SW+)	;0D27 65 A1
	RSR		;0D29 09

L_0D2A:	STAB (-SW)	;0D2A A5 A2
@0D2C:	LDAB (ZW)	;0D2C 8C
	JSR E_19e3	;0D2D 79 19 E3 ; fixupword
	BM L_0d6c	;0D30 16 3A
	JSR E_185f	;0D32 79 18 5F ; fixupword
	LDA (YW+)	;0D35 95 61
	LDB 2(AW)	;0D37 D5 08 02
	LDBB (SW)	;0D3A CD
	ORIB BL,BH	;0D3B 43 23
	STBB 2(AW)	;0D3D E5 08 02
	XFRB BH,BL	;0D40 45 32
	LDBB #1		;0D42 C0 01
	ANDB BL,BH	;0D44 42 23
	BNZ @0d4d	;0D46 15 05
	JSR E_1a4e	;0D48 79 1A 4E ; fixupword	U error
	JMP @0d63	;0D4B 73 16

@0D4D:	LDBB #8		;0D4D C0 08
	ANDB BL,BH	;0D4F 42 23
	BZ @0d63	;0D51 14 10
	JSR E_1ba4	;0D53 79 1B A4 ; fixupword
	DW L_1CB1	;0D56 1C B1 ; fixupword
	LDB 3(AW)	;0D58 D5 08 03
	STB L_1cac	;0D5B F1 1C AC ; fixupword
	LDAB #1		;0D5E 80 01
	JSR E_1cb9	;0D60 79 1C B9 ; fixupword
@0D63:	LDAB (ZW+)	;0D63 85 81
	LDBB #'<'+$80	;0D65 C0 AC
	SABB		;0D67 49
	BZ @0d2c	;0D68 14 C2
	DCR ZW,1	;0D6A 31 80
L_0D6C:	LDAB (SW+)	;0D6C 85 A1
	RSR		;0D6E 09

L_0D6F:	XFR AW,ZW	;0D6F 55 80
	STA (-SW)	;0D71 B5 A2
	LDAB (ZW+)	;0D73 85 81
	LDBB #'C'+$80	;0D75 C0 C3
	SABB		;0D77 49
	BNZ @0d7c	;0D78 15 02
	LDAB (ZW+)	;0D7A 85 81
@0D7C:	LDBB #'('+$80	;0D7C C0 A7
	SABB		;0D7E 49
	BZ @0d8b	;0D7F 14 0A
	LDA (SW+)	;0D81 95 A1
	XAZ		;0D83 5E
	CLA		;0D84 3A
	STA (-YW)	;0D85 B5 62
	JSR E_1a48	;0D87 79 1A 48 ; fixupword	syntax error
	RSR		;0D8A 09

@0D8B:	STX (SW)	;0D8B 6D A0
	CLA		;0D8D 3A
	XAX		;0D8E 5B
@0D8F:	LDAB (ZW+)	;0D8F 85 81
	LDBB #0		;0D91 C0 00
	SABB		;0D93 49
	BZ @0da6	;0D94 14 10
	LDBB #"'"+$80	;0D96 C0 A7
	SABB		;0D98 49
	BNZ @0da1	;0D99 15 06
	LDBB (ZW)	;0D9B CC
	SABB		;0D9C 49
	BNZ @0dab	;0D9D 15 0C
	INR ZW,1	;0D9F 30 80
@0DA1:	STAB (-YW)	;0DA1 A5 62
	INX		;0DA3 3E
	JMP @0d8f	;0DA4 73 E9

@0DA6:	DCR ZW,1	;0DA6 31 80
	JSR E_1a48	;0DA8 79 1A 48 ; fixupword	syntax error
@0DAB:	STX (-YW)	;0DAB 6D 62
	LDX (SW+)	;0DAD 65 A1
	RSR		;0DAF 09

L_0DB0: ; do opcode
	LDAB (YW)	;0DB0 8B			get flags & processor byte
	LDBB #2		;0DB1 C0 02			has byte variant?
	NABB		;0DB3 4A
	BZ @0dcf	;0DB4 14 19
	LDB (ZW)	;0DB6 DC			next opcode letter a 'B'?
	LDBB #'B'+$80	;0DB7 C0 C2
	SUBB BL,BH	;0DB9 41 23
	BNZ @0dcf	;0DBB 15 12
	INR ZW,1	;0DBD 30 80			  eat the 'B'
	LDBB #1		;0DBF C0 01
	STBB L_0a9d	;0DC1 E1 0A 9D ; fixupword
	LDB #$1000	;0DC4 D0 10 00			  flip opcode bit 4 to get the byte version
	LDBB 1(YW)	;0DC7 C5 68 01
	OREB BL,BH	;0DCA 44 23
	STBB 1(YW)	;0DCC E5 68 01
@0DCF:	XFR BW,ZW	;0DCF 55 82			save line char ptr
	STB L_0aa7	;0DD1 F1 0A A7 ; fixupword
	RL		;0DD4 07			get processor # from byte
	RRRB AL,1	;0DD5 26 10
	SRRB AL,3	;0DD7 24 12
	SLAB		;0DD9 2D			jsr indexed
	CLRB AH,0	;0DDA 22 00
	LDB #@0deb	;0DDC D0 0D EB ; fixupword
	AAB		;0DDF 58
	JSR @(BW)	;0DE0 7D 24
	LDA (YW)	;0DE2 9B			2 byte instruction?
	DCA		;0DE3 39
	DCA		;0DE4 39
	BNZ @0dea	;0DE5 15 03
	JSR E_2110	;0DE7 79 21 10 ; fixupword	substitute certain opcodes
@0DEA:	RSR		;0DEA 09

@0deb: ; opcode processor routines
	DW L_0E09	;0DEB 0E 09 ; fixupword	0x Inherent
	DW L_0E53	;0DED 0E 53 ; fixupword 1x RegValue
	DW L_0E8E	;0DEF 0E 8E ; fixupword	2x RegReg
	DW L_0F3F	;0DF1 0F 3F ; fixupword	3x Relative
	DW L_0F52	;0DF3 0F 52 ; fixupword	4x  Lit,Dir,Indir,Rel,RelInd,Index,(r)
	DW L_100D	;0DF5 10 0D ; fixupword	5x Dma,
	DW L_1082	;0DF7 10 82 ; fixupword	6x Cad,Dec,Inc,Iad,Rtr,Rtl,Shr,Shl
	DW L_10CD	;0DF9 10 CD ; fixupword	7x A,C,Ctb,Cfb,D,Drm,M,S,Zad,Zsu
	DW L_1139	;0DFB 11 39 ; fixupword	8x Anc,Fil,Flm,Mvf,Mvv,Orc,
	DW L_1223	;0DFD 12 23 ; fixupword	9x Cpe,Cpv,Cvx,Lsr,Stm,Ssm
	DW L_123E	;0DFF 12 3E ; fixupword ax Svc,Xrc
	DW L_1257	;0E01 12 57 ; fixupword	bx Pop,Stk,Scn
	DW L_1284	;0E03 12 84 ; fixupword cx Lst,Sst
	DW L_1292	;0E05 12 92 ; fixupword dx Lar,Sar
	DW L_12BF	;0E07 12 BF ; fixupword ex Lio,Sio

E_0E09: ; opcode processor 0x no operands
	JSR E_1446	;0E09 79 14 46 ; fixupword
	CLA		;0E0C 3A
	INA		;0E0D 38
	STA (-YW)	;0E0E B5 62
	XFR AW,ZW	;0E10 55 80			save Z
	STA (-SW)	;0E12 B5 A2
	JSR E_1a10	;0E14 79 1A 10 ; fixupword	 skip spaces in (Z)
	JSR E_145a	;0E17 79 14 5A ; fixupword
	BZ @0e20	;0E1A 14 04
	LDA (SW+)	;0E1C 95 A1			restore Z
	XAZ		;0E1E 5E
	RSR		;0E1F 09

@0E20:	XFR AW,ZW	;0E20 55 80
	DCA		;0E22 39
	STA L_0aa9	;0E23 B1 0A A9 ; fixupword
	STX (SW)	;0E26 6D A0
	LDAB #0		;0E28 80 00
	BZ @0e35	;0E2A 14 09
	LDX #L_2151	;0E2C 60 21 51 ; fixupword
	LDAB 2(YW)	;0E2F 85 68 02
@0E32:	LDBB (XW)	;0E32 CA
	BNZ @0e3a	;0E33 15 05
@0E35:	DCR ZW,1	;0E35 31 80
	LDX (SW+)	;0E37 65 A1
	RSR		;0E39 09

@0E3A:	SABB		;0E3A 49
	BZ @0e41	;0E3B 14 04
	INR XW,3	;0E3D 30 42
	JMP @0e32	;0E3F 73 F1

@0E41:	LDA fe(XW)	;0E41 95 48 FE
	LDX (SW+)	;0E44 65 A1
	XFRB BL,AH	;0E46 45 03
	STBB 2(YW+)	;0E48 E5 69 02
	STAB (YW)	;0E4B AB
	LDA #2		;0E4C 90 00 02
	STA (-YW)	;0E4F B5 62
	JMP L_0e6b	;0E51 73 18

E_0E53: ; opcode processor 1x= RegValue
	JSR E_1446	;0E53 79 14 46 ; fixupword
	JSR E_1469	;0E56 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1598	;0E59 79 15 98 ; fixupword
	LDAB (YW)	;0E5C 8B
	SLRB AL,4	;0E5D 25 13
	STAB (YW)	;0E5F AB
	LDA #2		;0E60 90 00 02
	STA (-YW)	;0E63 B5 62
L_0E65:	JSR E_145a	;0E65 79 14 5A ; fixupword
	BZ L_0e6b	;0E68 14 01
	RSR		;0E6A 09

L_0E6B:	JSR E_15e5	;0E6B 79 15 E5 ; fixupword
	LDA (YW+)	;0E6E 95 61
	LDB #0		;0E70 D0 00 00
	ADD AW,BW	;0E73 50 20
	BP @0e7b	;0E75 17 04
@0E77:	JSR E_1a1a	;0E77 79 1A 1A ; fixupword	if ??? A error
	CLA		;0E7A 3A
@0E7B:	LDB #$f		;0E7B D0 00 0F
	SAB		;0E7E 59
	BGZ @0e77	;0E7F 18 F6
	STX (-SW)	;0E81 6D A2
	LDX (YW)	;0E83 65 60
	ADD XW,YW	;0E85 50 64
	LDBB (XW)	;0E87 CA
	ORIB BL,AL	;0E88 43 13
	STBB (XW)	;0E8A EA
	LDX (SW+)	;0E8B 65 A1
	RSR		;0E8D 09

E_0E8E: ; opcode processor 2x= RegReg
	LDAB (YW+)	;0E8E 85 61
	LDAB #1		;0E90 80 01
	STAB L_0ef6	;0E92 A3 62
	LDAB (ZW+)	;0E94 85 81
	LDBB #$a0	;0E96 C0 A0
	SABB		;0E98 49
	BNZ @0eb9	;0E99 15 1E
	JSR E_1469	;0E9B 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1598	;0E9E 79 15 98 ; fixupword
	JSR E_145a	;0EA1 79 14 5A ; fixupword
	BZ @0ea9	;0EA4 14 03
	JSR E_1a48	;0EA6 79 1A 48 ; fixupword	syntax error
@0EA9:	JSR E_1598	;0EA9 79 15 98 ; fixupword
	LDBB (YW+)	;0EAC C5 61
	LDAB (YW)	;0EAE 8B
	SLRB AL,4	;0EAF 25 13
	AABB		;0EB1 48
	STBB (YW)	;0EB2 EB
	LDA #2		;0EB3 90 00 02
	STA (-YW)	;0EB6 B5 62
	RSR		;0EB8 09

@0EB9:	LDBB L_0a9d	;0EB9 C1 0A 9D ; fixupword
	BZ @0ec1	;0EBC 14 03
	JSR E_1a48	;0EBE 79 1A 48 ; fixupword	syntax error
@0EC1:	LDBB #'/'+$80	;0EC1 C0 AF
	SABB		;0EC3 49
	BZ @0ecf	;0EC4 14 09
	LDBB #'='+$80	;0EC6 C0 BD
	SABB		;0EC8 49
	BNZ L_0f03	;0EC9 15 38
	LDAB #$10	;0ECB 80 10
	STAB 0ef6	;0ECD A3 27
@0ECF:	JSR E_1469	;0ECF 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1534	;0ED2 79 15 34 ; fixupword
	LDA (YW+)	;0ED5 95 61
	STA (-SW)	;0ED7 B5 A2
	JSR E_145a	;0ED9 79 14 5A ; fixupword
	BZ @0ee1	;0EDC 14 03
	JSR E_1a48	;0EDE 79 1A 48 ; fixupword	syntax error
@0EE1:	JSR E_1598	;0EE1 79 15 98 ; fixupword
	JSR E_145a	;0EE4 79 14 5A ; fixupword
	BZ 0eec	;0EE7 14 03
	LDBB (YW)	;0EE9 CB
	JMP 0ef1	;0EEA 73 05

L_0EEC:	JSR E_1598	;0EEC 79 15 98 ; fixupword
	LDBB (YW+)	;0EEF C5 61
L_0EF1:	LDAB (YW)	;0EF1 8B
	SLRB AL,4	;0EF2 25 13
	AABB		;0EF4 48
	LDAB #00	;0EF5 80 00
	AABB		;0EF7 48
	STBB (YW)	;0EF8 EB
	LDA (SW+)	;0EF9 95 A1
	STA (-YW)	;0EFB B5 62
	LDA #4		;0EFD 90 00 04
	STA (-YW)	;0F00 B5 62
	RSR		;0F02 09

L_0F03:	LDBB #'-'+$80	;0F03 C0 AD
	SABB		;0F05 49
	BZ @0f1c	;0F06 14 14
	JSR E_1a48	;0F08 79 1A 48 ; fixupword	syntax error
	CLA		;0F0B 3A
	STAB (-YW)	;0F0C A5 62
	STA (-YW)	;0F0E B5 62
	INR AW,4	;0F10 30 03
	STA (-YW)	;0F12 B5 62
	DCR ZW,1	;0F14 31 80
	XFR AW,ZW	;0F16 55 80
	STA L_0aa7	;0F18 B1 0A A7 ; fixupword
	RSR		;0F1B 09

@0F1C:	LDAB #11	;0F1C 80 11
	STAB 0ef6	;0F1E A3 D6
	JSR E_1469	;0F20 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1598	;0F23 79 15 98 ; fixupword
	JSR 145a	;0F26 79 14 5A ; fixupword
	BZ @0f2e	;0F29 14 03
	JSR E_1a48	;0F2B 79 1A 48 ; fixupword	syntax error
@0F2E:	JSR E_1534	;0F2E 79 15 34 ; fixupword
	LDA (YW+)	;0F31 95 61
	STA (-SW)	;0F33 B5 A2
	JSR 145a	;0F35 79 14 5A ; fixupword
	BZ 0eec	;0F38 14 B2
	JSR E_1a48	;0F3A 79 1A 48 ; fixupword	syntax error
	JMP 0eec	;0F3D 73 AD

E_0F3F: ; opcode processor 3x= relative
	INR YW,1	;0F3F 30 60
	JSR E_1a10	;0F41 79 1A 10 ; fixupword	 skip spaces in (Z)
	XFR AW,ZW	;0F44 55 80
	STA 0aa9	;0F46 B1 0A A9 ; fixupword
	JSR 1550	;0F49 79 15 50 ; fixupword
	LDA #0002	;0F4C 90 00 02
	STA (-YW)	;0F4F B5 62
	RSR		;0F51 09

E_0F52: ; opcode processor 4x=  Lit,Dir,Indir,Rel,RelInd,Index,(r)
	STX (-SW)	;0F52 6D A2
	CLA		;0F54 3A
	STAB 0fb3	;0F55 A3 5C
	XAX		;0F57 5B
	LDAB (YW+)	;0F58 85 61
	SRRB AL,3	;0F5A 24 12
	BNL @0f6b	;0F5C 11 0D
	LDAB (ZW+)	;0F5E 85 81
	LDBB #'='+$80	;0F60 C0 BD
	SABB		;0F62 49
	BNZ @0f6d	;0F63 15 08
	LDBB #1		;0F65 C0 01
	STBB 0fb3	;0F67 E3 4A
	JMP @0f9a	;0F69 73 2F

@0F6B:	LDAB (ZW+)	;0F6B 85 81
@0F6D:	LDBB #0		;0F6D C0 00
	STBB 0a9d	;0F6F E1 0A 9D ; fixupword
	INX		;0F72 3E
	LDBB #'/'+$80	;0F73 C0 AF
	SABB		;0F75 49
	BZ @0f9a	;0F76 14 22
	INX		;0F78 3E
	LDBB #'#'+$80	;0F79 C0 A4
	SABB		;0F7B 49
	BZ @0f9a	;0F7C 14 1C
	INX		;0F7E 3E
	LDBB #a0	;0F7F C0 A0
	SABB		;0F81 49
	BZ @0fb4	;0F82 14 30
	INX		;0F84 3E
	LDBB #'*'+$80	;0F85 C0 AA
	SABB		;0F87 49
	BZ @0fb4	;0F88 14 2A
	INX		;0F8A 3E
	LDBB #'-'+$80	;0F8B C0 AD
	SABB		;0F8D 49
	BZ @0fc3	;0F8E 14 33
	LDBB #'+'+$80	;0F90 C0 AB
	SABB		;0F92 49
	BZ @0fc3	;0F93 14 2E
	JSR 1a34	;0F95 79 1A 34 ; fixupword	O error
	CLA		;0F98 3A
	XAX		;0F99 5B
@0F9A:	STX (-YW)	;0F9A 6D 62
	LDX (SW+)	;0F9C 65 A1
	JSR E_0fcd	;0F9E 7B 2D
	JSR E_1534	;0FA0 79 15 34 ; fixupword
	LDAB 0a9d	;0FA3 81 0A 9D ; fixupword
	BNZ @0fbd	;0FA6 15 15
	LDAB 0fb3	;0FA8 83 09
	BNZ @0fae	;0FAA 15 02
	JSR E_0fe1	;0FAC 7B 33
@0FAE:	LDA #0003	;0FAE 90 00 03
	JMP @0fc0	;0FB1 73 0D

	DB 00		;0FB3 00

@0FB4:	STX (-YW)	;0FB4 6D 62
	LDX (SW+)	;0FB6 65 A1
	JSR E_0fcd	;0FB8 7B 13
	JSR E_1550	;0FBA 79 15 50 ; fixupword
@0FBD:	LDA #2		;0FBD 90 00 02
@0FC0:	STA (-YW)	;0FC0 B5 62
	RSR		;0FC2 09

@0FC3:	STX (-YW)	;0FC3 6D 62
	LDX (SW+)	;0FC5 65 A1
	JSR E_0fcd	;0FC7 7B 04
	JSR E_14c5	;0FC9 79 14 C5 ; fixupword
	RSR		;0FCC 09

E_0FCD:	LDA (YW+)	;0FCD 95 61
	LDBB (YW)	;0FCF CB
	ORIB BL,AL	;0FD0 43 13
	STBB (YW)	;0FD2 EB
	XFR AW,ZW	;0FD3 55 80
	STA 0aa7	;0FD5 B1 0A A7 ; fixupword
	JSR E_1a10	;0FD8 79 1A 10 ; fixupword	 skip spaces in (Z)
	XFR AW,ZW	;0FDB 55 80
	STA L_0aa9	;0FDD B1 0A A9 ; fixupword
	RSR		;0FE0 09

E_0FE1:	LDBB (YW)	;0FE1 CB
	LDAB 1(YW)	;0FE2 85 68 01
	XFRB BH,AL	;0FE5 45 12
	LDA L_0a9e	;0FE7 91 0A 9E ; fixupword	get location counter
	INR AW,3	;0FEA 30 02			+3
	SUB AW,BW	;0FEC 51 20
	LDB #$7f	;0FEE D0 00 7F			check range
	SAB		;0FF1 59
	BGZ @100c	;0FF2 18 18
	LDB #ff80	;0FF4 D0 FF 80
	SAB		;0FF7 59
	BM @100c	;0FF8 16 12
	LDAB L_21d4	;0FFA 81 21 D4 ; fixupword	if no error yet
	LDBB #a0	;0FFD C0 A0
	SABB		;0FFF 49
	BNZ @100c	;1000 15 0A
	LDA L_0a9b	;1002 91 0A 9B ; fixupword
	BNZ @100c	;1005 15 05
	LDBB #'I'+$80	;1007 C0 C9			  I error?
	STBB L_21d4	;1009 E1 21 D4 ; fixupword
@100C:	RSR		;100C 09

E_100D: ; opcode processor 5x Dma
	STX (-SW)	;100D 6D A2			save X
	INR YW,1	;100F 30 60
	JSR E_1a10	;1011 79 1A 10 ; fixupword	skip spaces in (Z)
	XFR AW,ZW	;1014 55 80			save text position
	STA 0aa9	;1016 B1 0A A9 ; fixupword
	LDX #L_147d-3	;1019 60 14 7A ; fixupword	lookup sub-opcode
	LDA (ZW+)	;101C 95 81			  get 1st 2 chars from line text
@101E:	INR XW,3	;101E 30 42			  step to next entry
	LDB (XW+)	;1020 D5 41
	BZ @1030	;1022 14 0C			  end of list?
	SAB		;1024 59			  match?
	BNZ @101e	;1025 15 F7
	LDAB (ZW+)	;1027 85 81			  get 3rd char from line text
	LDBB (XW+)	;1029 C5 41			  match?
	SABB		;102B 49
	BZ @1037	;102C 14 09
	DCR ZW,1	;102E 31 80
@1030:	JSR E_1a48	;1030 79 1A 48 ; fixupword	no match, syntax error
	CLRB BL,0	;1033 22 30
	JMP L_1078	;1035 73 41

@1037:							found matching entry
	CLA		;1037 3A			get processor byte
	LDAB (XW+)	;1038 85 41
	LDB #L_1477	;103A D0 14 77 ; fixupword	jmp indexed to processor
	AAB		;103D 58
	CLA		;103E 3A
	JMP @(BW)	;103F 75 24

E_1041:	; DMA opcode processor 0
	JSR 145a	;1041 79 14 5A ; fixupword
	BZ @104c	;1044 14 06
	JSR E_1a48	;1046 79 1A 48 ; fixupword	syntax error
	CLA		;1049 3A
	JMP @1057	;104A 73 0B

@104C:	JSR E_15e5	;104C 79 15 E5 ; fixupword
	LDA (YW+)	;104F 95 61
	BP @1057	;1051 17 04
@1053:	JSR 1a1a	;1053 79 1A 1A ; fixupword	if ??? A error
	CLA		;1056 3A
@1057:	LDB #3		;1057 D0 00 03
	SAB		;105A 59
	BGZ @1053	;105B 18 F6
	SLR AW,4	;105D 35 03
	JMP L_1076	;105F 73 15

E_1061: ; DMA opcode processor 1
	JSR 145a	;1061 79 14 5A ; fixupword
	BZ @106c	;1064 14 06
	JSR E_1a48	;1066 79 1A 48 ; fixupword	syntax error
	CLA		;1069 3A
	JMP L_1076	;106A 73 0A

@106C:	JSR E_1a10	;106C 79 1A 10 ; fixupword	 skip spaces in (Z)
	JSR E_1598	;106F 79 15 98 ; fixupword
	LDAB (YW+)	;1072 85 61
	SLRB AL,4	;1074 25 13
L_1076: ; DMA opcode processor 2
	LDBB (XW)	;1076 CA
	AABB		;1077 48
L_1078:	STBB (-YW)	;1078 E5 62
	LDA #2		;107A 90 00 02
	STA (-YW)	;107D B5 62
	LDX (SW+)	;107F 65 A1
	RSR		;1081 09

E_1082: ; 6x opcode processor: Cad,Dec,Inc,Iad,Rtr,Rtl,Shr,Shl
	JSR E_1446	;1082 79 14 46 ; fixupword
	LDAB (ZW+)	;1085 85 81			get next text line char
	LDBB #'/'+$80	;1087 C0 AF			is it '/'?
	SABB		;1089 49
	BNZ @1098	;108A 15 0C
	LDAB #$10	;108C 80 10
	STAB (-YW)	;108E A5 62
	JSR E_1469	;1090 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1534	;1093 79 15 34 ; fixupword
	JMP @10c5	;1096 73 2D

@1098:	LDBB #'-'+$80	;1098 C0 AD			is it '-'?
	SABB		;109A 49
	BZ @10a7	;109B 14 0A
	JSR 1a34	;109D 79 1A 34 ; fixupword	O error
	DCR ZW,1	;10A0 31 80
	CLA		;10A2 3A
	INA		;10A3 38
	STA (-YW)	;10A4 B5 62
	RSR		;10A6 09

@10A7:	JSR E_1469	;10A7 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1598	;10AA 79 15 98 ; fixupword
	LDAB (YW)	;10AD 8B
	BNZ @10b4	;10AE 15 04
	JSR E_1a48	;10B0 79 1A 48 ; fixupword	syntax error
	CLAB		;10B3 2A
@10B4:	INAB		;10B4 28
	SLRB AL,4	;10B5 25 13
	STAB (YW)	;10B7 AB
	JSR 145a	;10B8 79 14 5A ; fixupword
	BZ @10c2	;10BB 14 05
	CLA		;10BD 3A
	STA (-YW)	;10BE B5 62
	JMP @10c5	;10C0 73 03

@10C2:	JSR E_1534	;10C2 79 15 34 ; fixupword
@10C5:	LDA #4		;10C5 90 00 04
	STA (-YW)	;10C8 B5 62
	JMP 0e65	;10CA 71 0E 65 ; fixupword

E_10CD: ; opcode processor 7x A,C,Ctb,Cfb,D,Drm,M,S,Zad,Zsu
	CLA		;10CD 3A
	DCA		;10CE 39
	LDBB (YW)	;10CF CB
	SRRB BL,4	;10D0 24 33
	BNL @10d5	;10D2 11 01
	DCA		;10D4 39
@10D5:	STA @10f2+1	;10D5 B3 1C
	LDAB #$46	;10D7 80 46		1st instruction byte
	LDBB 1(YW)	;10D9 C5 68 01
	STAB 1(YW)	;10DC A5 68 01
	CLAB		;10DF 2A
	STAB (YW)	;10E0 AB
	STX (-SW)	;10E1 6D A2
	XFR XW,YW	;10E3 55 64
	STBB (-YW)	;10E5 E5 62
	JSR E_1469	;10E7 79 14 69 ; fixupword	skip spaces in (Z)
	CLA		;10EA 3A
	DCA		;10EB 39
	XAB		;10EC 5D
	JSR E_1324	;10ED 79 13 24 ; fixupword
	STBB @10fd+1	;10F0 E3 0C
@10f2:	LDB #0		;10F2 D0 00 00
	AAB		;10F5 58
	BM @112a	;10F6 16 32
	STBB (XW)	;10F8 EA
	DCRB BL,15	;10F9 21 3E
	BGZ L_116d	;10FB 18 70
@10fd:	LDAB #0		;10FD 80 00
	SLRB AL,2	;10FF 25 11
	LDBB $ff(XW)	;1101 C5 48 FF
	AABB		;1104 48
	STBB $ff(XW)	;1105 E5 48 FF
	JSR E_145a	;1108 79 14 5A ; fixupword
	BNZ L_116d	;110B 15 60
	LDAB $ff(XW)	;110D 85 48 FF
	LDB #$ffff	;1110 D0 FF FF
	JSR E_1324	;1113 79 13 24 ; fixupword
	STA (-SW)	;1116 B5 A2
	LDAB $ff(XW)	;1118 85 48 FF
	AABB		;111B 48
	STBB $ff(XW)	;111C E5 48 FF
	XFR AW,YW	;111F 55 60
	SUB AW,XW	;1121 51 40
	INR AW,2	;1123 30 01
	STA (-YW)	;1125 B5 62
	LDA (SW+)	;1127 95 A1
	DCA		;1129 39
@112A:	BM L_116d	;112A 16 41
	XAB		;112C 5D
	DCR AW,15	;112D 31 0E
	BGZ L_116d	;112F 18 3C
	LDAB (XW)	;1131 8A
	SLRB AL,4	;1132 25 13
	AABB		;1134 48
	STBB (XW)	;1135 EA
	LDX (SW+)	;1136 65 A1
	RSR		;1138 09

E_1139: ; opcode processor 8x Anc,Fil,Flm,Mvf,Mvv,Orc,
	STX (-SW)	;1139 6D A2
	LDAB (YW)	;113B 8B	get opcode parm
	LDBB #4		;113C C0 04	mask
	NABB		;113E 4A
	STBB L_1169+1	;113F E3 29
	LDAB #$47	;1141 80 47	1st instruction byte for inline length byte version
	LDBB 1(YW)	;1143 C5 68 01	move opcode function byte
	STAB 1(YW)	;1146 A5 68 01
	STBB (YW)	;1149 EB
	XFR XW,YW	;114A 55 64
	LDAB (ZW)	;114C 8C	length in A version?
	LDBB #'R'+$80	;114D C0 D2
	SABB		;114F 49
	BNZ L_119a	;1150 15 48
	LDAB #$67	;1152 80 67	1st instruction byte for length in A version
	STAB 1(XW)	;1154 A5 48 01
	INR ZW,1	;1157 30 80	skip 'R'
	JSR E_1469	;1159 79 14 69 ; fixupword	skip spaces in (Z)
L_115C:	CLA		;115C 3A
	XAB		;115D 5D
	DCAB		;115E 29
	JSR E_1324	;115F 79 13 24 ; fixupword
	DCRB BL,3	;1162 21 32
	BNZ L_1174	;1164 15 0E
	INA		;1166 38
	BZ L_116d	;1167 14 04
L_1169:	LDAB #0		;1169 80 00	modified
	BNZ L_1177	;116B 15 0A
L_116D:	JSR E_1a48	;116D 79 1A 48 ; fixupword	syntax error
	DCR ZW,1	;1170 31 80
	JMP L_118f	;1172 73 1B

L_1174:	INA		;1174 38
	BNZ L_116d	;1175 15 F6
L_1177:	INRB BL,3	;1177 20 32
L_1179:	SLRB BL,2	;1179 25 31
	LDAB (XW)	;117B 8A
	AABB		;117C 48
	STBB (XW)	;117D EA
	JSR L_145a	;117E 79 14 5A ; fixupword
	BNZ L_116d	;1181 15 EA
	LDAB (XW)	;1183 8A
	CLR BW,0	;1184 32 20
	JSR L_1324	;1186 79 13 24 ; fixupword
	INA		;1189 38
	BNZ L_116d	;118A 15 E1
	LDAB (XW)	;118C 8A
	AABB		;118D 48
	STBB (XW)	;118E EA
L_118F:	XFR AW,YW	;118F 55 60
	SUB AW,XW	;1191 51 40
	INR AW,2	;1193 30 01
	STA (-YW)	;1195 B5 62
	LDX (SW+)	;1197 65 A1
	RSR		;1199 09

L_119A:	JSR E_1469	;119A 79 14 69 ; fixupword	skip spaces in (Z)
	CLA		;119D 3A
	LDAB (YW)	;119E 8B
	RRR AW,1	;119F 36 00
	SRR AW,2	;11A1 34 01
	LDB #L_14b1	;11A3 D0 14 B1 ; fixupword
	AAB		;11A6 58
	JMP @(BW)	;11A7 75 24

E_11A9:	JMP L_115c	;11A9 73 B1

E_11AB:	JSR E_1465	;11AB 79 14 65 ; fixupword
L_11AE:	BNZ L_116d	;11AE 15 BD
	JSR E_15e5	;11B0 79 15 E5 ; fixupword
	LDA (YW+)	;11B3 95 61
	DCA		;11B5 39
L_11B6:	JSR E_121b	;11B6 79 12 1B ; fixupword
	BNZ L_11ae	;11B9 15 F3
	STAB (-YW)	;11BB A5 62
	LDAB #')'+$80	;11BD 80 A9
	JSR E_145c	;11BF 79 14 5C ; fixupword	consume char AL if present on (Z)
	BNZ L_11ae	;11C2 15 EA
	CLA		;11C4 3A
	XAB		;11C5 5D
	DCAB		;11C6 29
	LDBB (YW)	;11C7 CB
	INR BW,1	;11C8 30 20
	JSR E_1324	;11CA 79 13 24 ; fixupword
L_11CD:	JMP L_1179	;11CD 73 AA

E_11CF:	JSR E_1465	;11CF 79 14 65 ; fixupword
	BNZ L_11ae	;11D2 15 DA
	JSR E_15e5	;11D4 79 15 E5 ; fixupword
	LDA (YW+)	;11D7 95 61
	DCA		;11D9 39
	JSR E_121b	;11DA 7B 3F
	BNZ L_11ae	;11DC 15 D0
	STAB (-YW)	;11DE A5 62
	LDAB #')'+$80	;11E0 80 A9
	JSR E_145c	;11E2 79 14 5C ; fixupword	consume char AL if present on (Z)
	BNZ L_11ae	;11E5 15 C7
	CLAB		;11E7 2A
	DCAB		;11E8 29
	LDB #1		;11E9 D0 00 01
	JSR 1324	;11EC 79 13 24 ; fixupword
	JMP L_11cd	;11EF 73 DC

E_11F1:	JSR 1465	;11F1 79 14 65 ; fixupword
	BNZ 11ae	;11F4 15 B8
	JSR E_15e5	;11F6 79 15 E5 ; fixupword
	LDA (YW+)	;11F9 95 61
	JMP 11b6	;11FB 73 B9

E_11FD:	JSR 1465	;11FD 79 14 65 ; fixupword
@1200:	BNZ 11ae	;1200 15 AC
	JSR E_15e5	;1202 79 15 E5 ; fixupword
	LDA (YW+)	;1205 95 61
	DCA		;1207 39
	JSR E_121b	;1208 7B 11
	BNZ @1200	;120A 15 F4
	STAB (-YW)	;120C A5 62
	JSR 145a	;120E 79 14 5A ; fixupword
	BNZ @1200	;1211 15 ED
	JSR E_15e5	;1213 79 15 E5 ; fixupword
	LDA (YW+)	;1216 95 61
	JMP 11b6	;1218 71 11 B6 ; fixupword

E_121B:	XFRB AH,AH	;121B 45 00
	BZ @1222	;121D 14 03
	LDBB 0a90	;121F C1 0A 90 ; fixupword
@1222:	RSR		;1222 09

E_1223: ; opcode processor 9x Cpe,Cpv,Cvx,Lsr,Stm,Ssm
	STX (-SW)	;1223 6D A2
	LDAB #2e	;1225 80 2E
	LDBB 01(YW)	;1227 C5 68 01
	STAB 01(YW)	;122A A5 68 01
	STBB (YW)	;122D EB
	XFR XW,YW	;122E 55 64
	JSR E_1469	;1230 79 14 69 ; fixupword	skip spaces in (Z)
	CLAB		;1233 2A
	DCAB		;1234 29
	LDB #0001	;1235 D0 00 01
	JSR 1324	;1238 79 13 24 ; fixupword
	JMP 1179	;123B 71 11 79 ; fixupword

E_123E: ; opcode processor Ax Svc,Xrc
	LDAB (YW+)	;123E 85 61
	JSR E_1469	;1240 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_15e5	;1243 79 15 E5 ; fixupword
	LDA (YW+)	;1246 95 61
	STAB (-YW)	;1248 A5 62
	XFRB AH,AH	;124A 45 00
	BZ @1251	;124C 14 03
	JSR E_1a48	;124E 79 1A 48 ; fixupword	syntax error
@1251:	LDA #0002	;1251 90 00 02
	STA (-YW)	;1254 B5 62
	RSR		;1256 09

E_1257: ; opcode processor BX Pop,Stk,Scn
	LDAB (YW+)	;1257 85 61
	JSR E_1469	;1259 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1598	;125C 79 15 98 ; fixupword
	LDAB (YW)	;125F 8B
	SLRB AL,4	;1260 25 13
	STAB (YW)	;1262 AB
	JSR 145a	;1263 79 14 5A ; fixupword
	BZ@ 126d	;1266 14 05
@1268:	JSR E_1a48	;1268 79 1A 48 ; fixupword	syntax error
	JMP L_127e	;126B 73 11

@126D:	JSR E_15e5	;126D 79 15 E5 ; fixupword
	LDA (YW+)	;1270 95 61
	DCA		;1272 39
	BM @1268	;1273 16 F3
	LDB #000f	;1275 D0 00 0F
	SAB		;1278 59
	BGZ @1268	;1279 18 ED
	LDBB (YW)	;127B CB
	AABB		;127C 48
	STBB (YW)	;127D EB
L_127E:	LDA #2		;127E 90 00 02
	STA (-YW)	;1281 B5 62
	RSR		;1283 09

E_1284: ; opcode processor Cx Lst,Sst
	LDAB (YW+)	;1284 85 61
	JSR E_1469	;1286 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1534	;1289 79 15 34 ; fixupword
	LDA #3		;128C 90 00 03
	STA (-YW)	;128F B5 62
	RSR		;1291 09

E_1292: ; opcode processor Dx Lar,Sar
	LDAB (YW+)	;1292 85 61
	JSR E_1469	;1294 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_15e5	;1297 79 15 E5 ; fixupword
	LDA (YW)	;129A 9B
	BP 12a6	;129B 17 09
L_129D:	CLAB		;129D 2A
	INR YW,1	;129E 30 60
	STAB (YW)	;12A0 AB
	JSR E_1a48	;12A1 79 1A 48 ; fixupword	syntax error
	JMP L_127e	;12A4 73 D8

L_12A6:	LDB #000f	;12A6 D0 00 0F
	SAB		;12A9 59
	BGZ 129d	;12AA 18 F1
	JSR 145a	;12AC 79 14 5A ; fixupword
	BNZ 129d	;12AF 15 EC
	JSR E_1598	;12B1 79 15 98 ; fixupword
	LDBB (YW+)	;12B4 C5 61
	LDA (YW+)	;12B6 95 61
	SLRB AL,4	;12B8 25 13
	AABB		;12BA 48
	STBB (-YW)	;12BB E5 62
	JMP L_127e	;12BD 73 BF

E_12BF: ; opcode processor Ex Lio,Sio
	LDAB (YW)	;12BF 8B
	SRRB AL,2	;12C0 24 11
	LDBB #1		;12C2 C0 01
	NABB		;12C4 4A
	STBB (YW)	;12C5 EB
	LDAB (ZW)	;12C6 8C
	LDBB #'B'+$80	;12C7 C0 C2
	SABB		;12C9 49
	BNZ 12d3	;12CA 15 07
	INR ZW,1	;12CC 30 80
	LDAB #10	;12CE 80 10
	LDBB (YW)	;12D0 CB
	AABB		;12D1 48
	STBB (YW)	;12D2 EB
L_12D3:	JSR E_1469	;12D3 79 14 69 ; fixupword	skip spaces in (Z)
	JSR E_1598	;12D6 79 15 98 ; fixupword
	LDAB (YW+)	;12D9 85 61
	SRAB		;12DB 2C
	BL 12e8	;12DC 10 0A
	SLRB AL,5	;12DE 25 14
	LDBB (YW)	;12E0 CB
	AABB		;12E1 48
	STBB (YW)	;12E2 EB
	JSR 145a	;12E3 79 14 5A ; fixupword
	BZ 12f3	;12E6 14 0B
L_12E8:	DCR ZW,1	;12E8 31 80
	LDA #0002	;12EA 90 00 02
L_12ED:	STA (-YW)	;12ED B5 62
	JSR E_1a48	;12EF 79 1A 48 ; fixupword	syntax error
	RSR		;12F2 09

L_12F3:	JSR E_1598	;12F3 79 15 98 ; fixupword
	LDAB (YW+)	;12F6 85 61
	SRAB		;12F8 2C
	BL 12e8	;12F9 10 ED
	SLAB		;12FB 2D
	LDBB (YW)	;12FC CB
	AABB		;12FD 48
	STBB (YW)	;12FE EB
	JSR 145a	;12FF 79 14 5A ; fixupword
	BZ 1309	;1302 14 05
	CLAB		;1304 2A
	STAB (-YW)	;1305 A5 62
	JMP 131e	;1307 73 15

L_1309:	JSR E_15e5	;1309 79 15 E5 ; fixupword
	LDA (YW+)	;130C 95 61
	STAB (-YW)	;130E A5 62
	SLA		;1310 3D
	XFRB AH,AH	;1311 45 00
	BZ 131e	;1313 14 09
	INRB AH,1	;1315 20 00
	BZ 131e	;1317 14 05
	LDA #0003	;1319 90 00 03
	JMP 12ed	;131C 73 CF

L_131E:	LDA #3		;131E 90 00 03
	STA (-YW)	;1321 B5 62
	RSR		;1323 09

E_1324:
	STB L_142d	;1324 F1 14 2D ; fixupword
	STAB L_1401	;1327 A1 14 01 ; fixupword
	LDAB (ZW+)	;132A 85 81
	LDBB #'/'+$80	;132C C0 AF
	SABB		;132E 49
	BNZ 1364	;132F 15 33
	JSR E_1534	;1331 79 15 34 ; fixupword
	XFR BW,YW	;1334 55 62
	LDA (SW)	;1336 9D
	SAB		;1337 59
	JSR 1cc0	;1338 79 1C C0 ; fixupword
	CLA		;133B 3A
	STA 0a9b	;133C B1 0A 9B ; fixupword
	STAB L_0a99	;133F A1 0A 99 ; fixupword
L_1342:	STAB (-SW)	;1342 A5 A2
	JSR 1465	;1344 79 14 65 ; fixupword
	BZ @134d	;1347 14 04
	CLA		;1349 3A
	DCA		;134A 39
	JMP 1361	;134B 73 14

@134D:	JSR E_15e5	;134D 79 15 E5 ; fixupword
	LDAB #')'+$80	;1350 80 A9
	JSR E_145c	;1352 79 14 5C ; fixupword	consume char AL if present on (Z)
	BZ 135f	;1355 14 08
	LDAB (SW+)	;1357 85 A1
L_1359:	JSR E_1a48	;1359 79 1A 48 ; fixupword	syntax error
	CLA		;135C 3A
	XAB		;135D 5D
	RSR		;135E 09

L_135F:	LDA (YW+)	;135F 95 61
L_1361:	LDBB (SW+)	;1361 C5 A1
	RSR		;1363 09

L_1364:	LDBB #'-'+$80	;1364 C0 AD
	SABB		;1366 49
	BZ 136c	;1367 14 03
	JMP 1422	;1369 71 14 22 ; fixupword

L_136C:	JSR E_1598	;136C 79 15 98 ; fixupword
	LDAB (YW)	;136F 8B
	SRAB		;1370 2C
	BL 1359	;1371 10 E6
	SLRB AL,5	;1373 25 14
	STAB (YW)	;1375 AB
	LDAB (ZW)	;1376 8C
	LDBB #'*'+$80	;1377 C0 AA
	SABB		;1379 49
	STBB 13c5	;137A E3 49
	BZ 1385	;137C 14 07
	JSR 145a	;137E 79 14 5A ; fixupword
	BNZ 13c6	;1381 15 43
	JMP 139a	;1383 73 15

L_1385:	INR ZW,1	;1385 30 80
	JSR E_1598	;1387 79 15 98 ; fixupword
	LDAB (YW+)	;138A 85 61
	BZ 1359	;138C 14 CB
	SRAB		;138E 2C
	BL 1359	;138F 10 C8
	SLAB		;1391 2D
	LDBB (YW)	;1392 CB
	AABB		;1393 48
	STBB (YW)	;1394 EB
	JSR 145a	;1395 79 14 5A ; fixupword
	BNZ 13c8	;1398 15 2E
L_139A:	LDAB (ZW)	;139A 8C
	LDBB #'-'+$80	;139B C0 AD
	SABB		;139D 49
	BZ 13a5	;139E 14 05
	LDBB #'+"+$80	;13A0 C0 AB
	SABB		;13A2 49
	BNZ 13a8	;13A3 15 03
L_13A5:	LDAB 01(ZW)	;13A5 85 88 01
L_13A8:	LDBB #'0'+$80	;13A8 C0 B0
	SABB		;13AA 49
	BM 13b2	;13AB 16 05
	LDBB #'9'+$80	;13AD C0 B9
	SABB		;13AF 49
	BLE 13cd	;13B0 19 1B
L_13B2:	LDAB (ZW)	;13B2 8C
	LDB #'/'+$80	;13B3 C0 AF
	SABB		;13B5 49
	BZ 13c2	;13B6 14 0A
	LDBB #'-'+$80	;13B8 C0 AD
	SABB		;13BA 49
	BZ 13c2	;13BB 14 05
	LDBB #'='+$80	;13BD C0 BD
	SABB		;13BF 49
	BNZ 13cd	;13C0 15 0B
L_13C2:	DCR ZW,1	;13C2 31 80
	LDAB #00	;13C4 80 00
L_13C6:	BNZ 13fe	;13C6 15 36
L_13C8:	CLAB		;13C8 2A
	STAB (-YW)	;13C9 A5 62
	JMP 13d7	;13CB 73 0A

L_13CD:	CLA		;13CD 3A
	DCA		;13CE 39
	JSR E_15fc	;13CF 79 15 FC ; fixupword
	LDAB (YW+)	;13D2 85 61
	DCAB		;13D4 29
	BNZ 13dc	;13D5 15 05
L_13D7:	LDAB #01	;13D7 80 01
	JMP 1342	;13D9 71 13 42 ; fixupword

L_13DC:	DCAB		;13DC 29
	BZ @13e2	;13DD 14 03
	JMP 1359	;13DF 71 13 59 ; fixupword

@13E2:	LDAB 02(YW)	;13E2 85 68 02
	LDBB #10	;13E5 C0 10
	AABB		;13E7 48
	STBB 02(YW)	;13E8 E5 68 02
	XFR BW,YW	;13EB 55 62
	LDA (SW)	;13ED 9D
	SAB		;13EE 59
	JSR 1cc0	;13EF 79 1C C0 ; fixupword
	CLA		;13F2 3A
	STA 0a9b	;13F3 B1 0A 9B ; fixupword
	STAB L_0a99	;13F6 A1 0A 99 ; fixupword
	LDAB #01	;13F9 80 01
	JMP 1342	;13FB 71 13 42 ; fixupword

L_13FE:	CLA		;13FE 3A
	LDAB (YW)	;13FF 8B
	LDBB #00	;1400 C0 00
	INRB BL,1	;1402 20 30
	BZ @141c	;1404 14 16
	SRR AW,4	;1406 34 03
	STAB (-SW)	;1408 A5 A2
	LDAB 1401	;140A 83 F5
	LDBB #0c	;140C C0 0C
	NABB		;140E 4A
	LDAB #08	;140F 80 08
	SABB		;1411 49
	BNZ @141a	;1412 15 06
	INR YW,1	;1414 30 60
	LDAB (YW)	;1416 8B
	LDBB (SW)	;1417 CD
	AABB		;1418 48
	STBB (SW)	;1419 ED
@141A:	LDAB (SW+)	;141A 85 A1
@141C:	STAB (YW)	;141C AB
	LDAB #02	;141D 80 02
	JMP 1342	;141F 71 13 42 ; fixupword

L_1422:	LDBB #bd	;1422 C0 BD
	SABB		;1424 49
	BZ @142c	;1425 14 05
	DCR ZW,1	;1427 31 80
	JMP 1359	;1429 71 13 59 ; fixupword

@142C:	LDA #0000	;142C 90 00 00
	JSR E_15fc	;142F 79 15 FC ; fixupword
	XFR BW,YW	;1432 55 62
	LDA (SW)	;1434 9D
	DCA		;1435 39
	SAB		;1436 59
	JSR 1cc0	;1437 79 1C C0 ; fixupword
	CLA		;143A 3A
	STA 0a9b	;143B B1 0A 9B ; fixupword
	STAB L_0a99	;143E A1 0A 99 ; fixupword
	LDAB (YW+)	;1441 85 61
	LDBB #03	;1443 C0 03
	RSR		;1445 09

E_1446:	CLR BW,0	;1446 32 20
	LDAB (YW+)	;1448 85 61
	SRRB AL,3	;144A 24 12
	BL @1450	;144C 10 02
	DCR BW,1	;144E 31 20
@1450:	STB 0e71	;1450 F1 0E 71 ; fixupword	true if bit 2 set
	LDBB #01	;1453 C0 01
	NABB		;1455 4A
	STBB 0e29	;1456 E1 0E 29 ; fixupword	true if bit 3 set
	RSR		;1459 09

L_145A:	LDAB #','+$80	;145A 80 AC
L_145C: ; consume char AL if present on (Z)
	LDBB (ZW+)	;145C C5 81
	SABB		;145E 49
	BNZ @1462	;145F 15 01
	RSR		;1461 09

@1462:	DCR ZW,1	;1462 31 80
	RSR		;1464 09

L_1465:	LDAB #'('+$80	;1465 80 A8
	JMP E_145c	;1467 73 F3	consume char AL if present on (Z)

E_1469: ; skip spaces in (Z)
	XFR AW,ZW	;1469 55 80			remember starting place
	STA L_0aa7	;146B B1 0A A7 ; fixupword
	JSR E_1a10	;146E 79 1A 10 ; fixupword	skip spaces in (Z)
	XFR AW,ZW	;1471 55 80			remember ending place
	STA L_0aa9	;1473 B1 0A A9 ; fixupword
	RSR		;1476 09

L_1477: ; DMA sub-opcode processors
	DW L_1041	;1477 10 41 ; fixupword
	DW L_1061	;1479 10 61 ; fixupword
	DW L_1076	;147B 10 76 ; fixupword

L_147d: ; DMA sub-opcodes
	DB D3 ;S	;147D D3	DMA SAD reg	aka LDDMAA	Load DMA Address from word register
	DB C1 ;A	;147E C1
	DB C4 ;D	;147F C4
	DB 02		;1480 02	  processor #
	DB 00		;1481 00	  instruction 2nd byte

	DB D2 ;R	;1482 D2	DMA RAD reg	aka STDMAA	Store DMA Address to word register
	DB C1 ;A	;1483 C1
	DB C4 ;D	;1484 C4
	DB 02		;1485 02
	DB 01		;1486 01

	DB D3 ;S	;1487 D3	DMA SCT reg	aka LDDMAC	Load DMA Count from word register
	DB C3 ;C	;1488 C3
	DB D4 ;T	;1489 D4
	DB 02		;148A 02
	DB 02		;148B 02

	DB D2 ;R	;148C D2	DMA RCT reg	aka STDMAC	Store DMA Count to word register
	DB C3 ;C	;148D C3
	DB D4 ;T	;148E D4
	DB 02		;148F 02
	DB 03		;1490 03

	DB D3 ;S	;1491 D3	DMA SDV n	aka SETDMAM	Set DMA mode. Mode is constant in register nibble
	DB C4 ;D	;1492 C4
	DB D6 ;V	;1493 D6
	DB 00		;1494 00
	DB 04		;1495 04

	DB D2 ;R	;1496 D2	DMA RDV reg	aka SETDMAMR	Get DMA mode. Mode is read from register in register nibble.
	DB C4 ;D	;1497 C4
	DB D6 ;V	;1498 D6
	DB 02		;1499 02
	DB 05		;149A 05

	DB C5 ;E	;149B C5	DMA EAB  no operands	aka EDMA	Enable DMA
	DB C1 ;A	;149C C1
	DB C2 ;B	;149D C2
	DB 04		;149E 04
	DB 06		;149F 06

	DB C4 ;D	;14A0 C4	DMA DAB no operands	aka DDMA	Disable DMA
	DB C1 ;A	;14A1 C1
	DB C2 ;B	;14A2 C2
	DB 04		;14A3 04
	DB 07		;14A4 07

	DB D3 ;S	;14A5 D3	DMA SMN breg	aka LDISR	Load low three bits of Internal Status Register from register.
	DB CD ;M	;14A6 CD
	DB CE ;N	;14A7 CE
	DB 02		;14A8 02
	DB 08		;14A9 08

	DB D2 ;R	;14AA D2	DMA RMN breg	aka STISR	Store Internal Status Register to register.
	DB CD ;M	;14AB CD
	DB CE ;N	;14AC CE
	DB 02		;14AD 02
	DB 09		;14AE 09

	DB 0,0		;14AF 00 00	end of list

L_14b1:
	DW L_11A9	;14B1 11 A9 ; fixupword
	DW L_11F1	;14B3 11 F1 ; fixupword
	DW L_11FD	;14B5 11 FD ; fixupword
	DW L_11AB	;14B7 11 AB ; fixupword
	DW L_11AB	;14B9 11 AB ; fixupword
	DW L_11AB	;14BB 11 AB ; fixupword
	DW L_11AB	;14BD 11 AB ; fixupword
	DW L_11AB	;14BF 11 AB ; fixupword
	DW L_11AB	;14C1 11 AB ; fixupword
	DW L_11CF	;14C3 11 CF ; fixupword

E_14C5:	CLAB		;14C5 2A
	STAB (-YW)	;14C6 A5 62
	LDAB (ZW)	;14C8 8C
	LDBB #'*'+$80	;14C9 C0 AA
	SABB		;14CB 49
	BNZ @14d3	;14CC 15 05
	LDAB #4		;14CE 80 04
	STAB (YW)	;14D0 AB
	INR ZW,1	;14D1 30 80
@14D3:	JSR E_15bb	;14D3 79 15 BB ; fixupword	 look up register name in (Z), push to Y
	LDAB (YW+)	;14D6 85 61
	SLRB AL,4	;14D8 25 13
	JSR E_152f	;14DA 7B 53
	LDAB (ZW+)	;14DC 85 81
	LDBB #'+'+$80	;14DE C0 AB
	SABB		;14E0 49
	BNZ @14e7	;14E1 15 04
	LDAB #1		;14E3 80 01
	JMP @14ee	;14E5 73 07

@14E7:	LDBB #'-'+$80	;14E7 C0 AD
	SABB		;14E9 49
	BNZ @14f2	;14EA 15 06
	LDAB #2		;14EC 80 02
@14EE:	JSR E_152f	;14EE 7B 3F
	LDAB (ZW+)	;14F0 85 81
@14F2:	LDBB #','+$80	;14F2 C0 AC
	SABB		;14F4 49
	BZ @14ff	;14F5 14 08
	DCR ZW,1	;14F7 31 80
@14F9:	LDA #2		;14F9 90 00 02
	STA (-YW)	;14FC B5 62
	RSR		;14FE 09

@14FF:	JSR E_15e5	;14FF 79 15 E5 ; fixupword
	LDA (YW+)	;1502 95 61
	LDBB (1554)	;1504 C4 4E	L_0a99
	BNZ @1523	;1506 15 1B
	LDB (1559)	;1508 D4 4F	0a9b
	BNZ @1523	;150A 15 17
	XAB		;150C 5D
	BZ @14f9	;150D 14 EA
	STA (-SW)	;150F B5 A2
	LDAB #08	;1511 80 08
	JSR E_152f	;1513 7B 1A
	LDA (SW+)	;1515 95 A1
	LDB #ff80	;1517 D0 FF 80
	AAB		;151A 58
	BNL @1527	;151B 11 0A
	LDB #0080	;151D D0 00 80
	AAB		;1520 58
	BL @1527	;1521 10 04
@1523:	JSR 1a1a	;1523 79 1A 1A ; fixupword	if ??? A error
	CLA		;1526 3A
@1527:	STAB (-YW)	;1527 A5 62
	LDA #3		;1529 90 00 03
	STA (-YW)	;152C B5 62
	RSR		;152E 09

E_152F:	LDBB (YW)	;152F CB
	ORIB BL,AL	;1530 43 13
	STBB (YW)	;1532 EB
	RSR		;1533 09

E_1534:	LDBB L_0a9d	;1534 C1 0A 9D ; fixupword
	BNZ @1541	;1537 15 08
	CLR AW,2	;1539 32 02
	JSR E_15fc	;153B 79 15 FC ; fixupword
	INR YW,1	;153E 30 60
	RSR		;1540 09

@1541:	CLA		;1541 3A
	JSR E_15fc	;1542 79 15 FC ; fixupword
	LDAB (YW+)	;1545 85 61
	DCAB		;1547 29
	BZ @154f	;1548 14 05
	JSR 1a1a	;154A 79 1A 1A ; fixupword	if ??? A error
	INR YW,1	;154D 30 60
@154F:	RSR		;154F 09

L_1550:	JSR E_15e5	;1550 79 15 E5 ; fixupword
	LDAB L_0a99	;1553 81 0A 99 ; fixupword
	BZ @155d	;1556 14 05
	LDA L_0a9b	;1558 91 0A 9B ; fixupword
	BZ @1569	;155B 14 0C
@155D:	JSR 1a1a	;155D 79 1A 1A ; fixupword	if ??? A error
	LDA (YW+)	;1560 95 61
	CLA		;1562 3A
	STAB (1554)	;1563 A4 EF	L_0a99
	STA (1559)	;1565 B4 F2	0a9b
	JMP @1595	;1567 73 2C

@1569:	STAB L_0a99	;1569 A1 0A 99 ; fixupword
	LDAB (YW)	;156C 8B
	JSR E_1b84	;156D 79 1B 84 ; fixupword	 cvt hex byte in AL to 2 chars in BW
	STB L_21cf	;1570 F1 21 CF ; fixupword
	LDAB 1(YW)	;1573 85 68 01
	JSR E_1b84	;1576 79 1B 84 ; fixupword	 cvt hex byte in AL to 2 chars in BW
	STB L_21d1	;1579 F1 21 D1 ; fixupword
	LDA L_0a9e	;157C 91 0A 9E ; fixupword	get location counter
	INA		;157F 38			+2
	INA		;1580 38
	LDB (YW+)	;1581 D5 61			get operand value
	SUB AW,BW	;1583 51 20			calc offset
	LDB #$ff80	;1585 D0 FF 80			check range
	AAB		;1588 58
	BNL @1595	;1589 11 0A
	LDB #$80	;158B D0 00 80
	AAB		;158E 58
	BL @1595	;158F 10 04
	JSR E_1a3a	;1591 79 1A 3A ; fixupword	if ??? R error
	CLAB		;1594 2A			fake it with zero
@1595:	STAB (-YW)	;1595 A5 62			store relative
	RSR		;1597 09

E_1598:	; look up byte register name in (Z), push to Y
	JSR E_15bb	;1598 7B 21	look up register name in (Z), push to Y
	LDAB (ZW+)	;159A 85 81	get text char
	LDBB #'U'+$80	;159C C0 D5	if 'U'
	SABB		;159E 49
	BZ @15ba	;159F 14 19	  return
	LDBB #'L'+$80	;15A1 C0 CC	if 'L'
	SABB		;15A3 49
	BZ @15af	;15A4 14 09	  goto
	DCR ZW,1	;15A6 31 80	unget the char
	LDAB L_0a9d	;15A8 81 0A 9D ; fixupword
	BZ @15ba	;15AB 14 0D
	JMP @15b7	;15AD 73 08

@15AF:	LDAB L_0a9d	;15AF 81 0A 9D ; fixupword
	BNZ @15b7	;15B2 15 03
	JSR E_1a48	;15B4 79 1A 48 ; fixupword	syntax error
@15B7:	LDAB (YW)	;15B7 8B
	INAB		;15B8 28
	STAB (YW)	;15B9 AB
@15BA:	RSR		;15BA 09

E_15BB:	; look up word register name in (Z), push to Y
	LDBB (ZW+)	;15BB C5 81
	XFRB BH,BL	;15BD 45 32
	LDA #@15dc	;15BF 90 15 DC ; fixupword
@15C2:	LDBB (AW+)	;15C2 C5 01
	BNZ @15cf	;15C4 15 09
	JSR E_1a48	;15C6 79 1A 48 ; fixupword	syntax error
	DCR ZW,1	;15C9 31 80
	CLR BW,0	;15CB 32 20
	JMP @15d9	;15CD 73 0A

@15CF:	SUBB BL,BH	;15CF 41 23
	BNZ @15c2	;15D1 15 EF
	LDB #@15dc+1	;15D3 D0 15 DD ; fixupword
	SAB		;15D6 59
	SLR BW,1	;15D7 35 20
@15D9:	STBB (-YW)	;15D9 E5 62
	RSR		;15DB 09

@15dc:
	DB 'A'+$80	;15DC C1
	DB 'B'+$80	;15DD C2
	DB 'X'+$80	;15DE D8
	DB 'Y'+$80	;15DF D9
	DB 'Z'+$80	;15E0 DA
	DB 'S'+$80	;15E1 D3
	DB 'C'+$80	;15E2 C3
	DB 'P'+$80	;15E3 D0
	DB 0		;15E4 00

E_15E5:	JSR E_16ba	;15E5 79 16 BA ; fixupword
	CVX? $10,2,	;15E8 46 F1 39 60 60 0E 13 09
	CVX?	;15F0 47 4A 0D 66 14 03
	JSR E_1a48	;15F6 79 1A 48 ; fixupword	syntax error
	INR YW,14	;15F9 30 6D
	RSR		;15FB 09

E_15FC:
	STK XH,2	;15FC 7E 41
	XFRB BL,AH	;15FE 45 03
	SRRB BL,2	;1600 24 31
	STBB @1676+1	;1602 E3 73
	INA		;1604 38
	BZ @1608	;1605 14 01
	DCA		;1607 39
@1608:	XAX		;1608 5B
	BZ @1657	;1609 14 4C
	LDB #16		;160B D0 00 10
	SAB		;160E 59
	BLE @1617	;160F 19 06
	JSR E_196c	;1611 79 19 6C ; fixupword	get string literal, AL=max length 
	POP XH,2	;1614 7F 41
	RSR		;1616 09

@1617:	DCAB		;1617 29
	LDBB #$f0	;1618 C0 F0
	AABB		;161A 48
	STBB @1623+1	;161B E3 07
	JSR E_16ba	;161D 79 16 BA ; fixupword
	LDB #L_21ac	;1620 D0 21 AC ; fixupword
@1623:	ZAD 16,2,(Y),(B) ;1623 46 F1 3A 62 len=10,2 ssss=3 mm=2 nn=2
	B?? @163f	;1627 13 16
	SUB? AW,XW,($10) ;1629 51 50 00 10
	DCA		;162D 39
	BM @163f	;162E 16 0F
	MVF (A),(Y),(Y)	;1630 67 4A 66
	B?? @163f	;1633 14 0A
	CPF (A),L_171c,(Y) ;1635 67 82 17 1C 06 ; fixupword ssss=8 mm=0 nn=2
	BZ @163f	;163A 14 03
	JSR E_1a48	;163C 79 1A 48 ; fixupword	syntax error
@163F:	INR YW,16	;163F 30 6F
	STX (-SW)	;1641 6D A2
	XFR AW,YW	;1643 55 60
	DCA		;1645 39
	BNZ @16ac	;1646 15 64
	LDAB L_0a99	;1648 81 0A 99 ; fixupword
	BNZ @1652	;164B 15 05
	LDAB 0a9b	;164D 81 0A 9B ; fixupword
	BZ @16ac	;1650 14 5A
@1652:	JSR E_1a48	;1652 79 1A 48 ; fixupword	syntax error
	JMP @16ac	;1655 73 55

@1657:	JSR E_16ba	;1657 79 16 BA ; fixupword
	MEMCPY 16,(Y),L_21ac ;165A 47 48 0F 60 ; ssss=4 mm=2 nn=0 length=10
			;165E 21 AC ; fixupword
	INR YW,16	;1660 30 6F
	LDB #L_21ac	;1662 D0 21 AC ; fixupword
	LDX #16		;1665 60 00 10
	LDAB (BW)	;1668 89
	BP @1682	;1669 17 17
@166B:	LDAB (BW+)	;166B 85 21
	INAB		;166D 28
	BNZ @1674	;166E 15 04
	DCX		;1670 3F
	BGZ @166b	;1671 18 F8
	INX		;1673 3E
@1674:	DCR BW,1	;1674 31 20
@1676:	LDAB #0		;1676 80 00
	BZ @1696	;1678 14 1C
	LDAB (BW)	;167A 89
	BM @1696	;167B 16 19
	INX		;167D 3E
	DCR BW,1	;167E 31 20
	JMP @1696	;1680 73 14

@1682:	LDAB (BW+)	;1682 85 21
	BNZ @168a	;1684 15 04
	DCX		;1686 3F
	BGZ @1682	;1687 18 F9
	INX		;1689 3E
@168A:	DCR BW,1	;168A 31 20
	LDAB 1677	;168C 83 E9
	BZ @1696	;168E 14 06
	LDAB (BW)	;1690 89
	BP @1696	;1691 17 03
	INX		;1693 3E
	DCR BW,1	;1694 31 20
@1696:	STX (-SW)	;1696 6D A2
	XFR AW,XW	;1698 55 40
	DCA		;169A 39
	BNZ @16ac	;169B 15 0F
	LDABL_0a99	;169D 81 0A 99 ; fixupword
	BNZ @16a7	;16A0 15 05
	LDAB 0a9b	;16A2 81 0A 9B ; fixupword
	BZ @16ac	;16A5 14 05
@16A7:	INX		;16A7 3E
	DCR BW,1	;16A8 31 20
	STX (SW)	;16AA 6D A0
@16AC:	LDAB (BW+)	;16AC 85 21
	STAB (-YW)	;16AE A5 62
	DCX		;16B0 3F
	BGZ @16ac	;16B1 18 F9
	LDA (SW+)	;16B3 95 A1
	STAB (-YW)	;16B5 A5 62
	POP XH,2	;16B7 7F 41
	RSR		;16B9 09


E_16BA:	JSR E_16e9	;16BA 7B 2D
@16BC:	LDA (ZW)	;16BC 9C
	LDB #aecf	;16BD D0 AE CF
	SAB		;16C0 59
	BNZ @16cf	;16C1 15 0C
	JSR @16e1	;16C3 7B 1C
	MEM???		;16C5 47 69 0F  sss=6 mm=2 nn=1 length=10
	LDX? #6010	;16C8 60 60 10
	INR YW,16	;16CB 30 6F
	JMP @16bc	;16CD 73 ED

@16CF:	LDB #aed8	;16CF D0 AE D8
	SAB		;16D2 59
	BNZ @16e8	;16D3 15 13
	JSR @16e1	;16D5 7B 0A
	MEM???		;16D7 47 79 0F  ssss=7 mm=2 nn=1 length=10
	LDX? #6010	;16DA 60 60 10
	INR YW,16	;16DD 30 6F
	JMP @16bc	;16DF 73 DB

@16E1:	INR ZW,1	;16E1 30 80
	JSR 1a02	;16E3 79 1A 02 ; fixupword
	JSR E_16e9	;16E6 7B 01
@16E8:	RSR		;16E8 09

E_16E9:	JSR E_1704	;16E9 7B 19
@16EB:	LDA (ZW)	;16EB 9C
	LDB #'.A'+$8080	;16EC D0 AE C1
	SAB		;16EF 59
	BNZ @1703	;16F0 15 11
	INR ZW,1	;16F2 30 80
	JSR 1a02	;16F4 79 1A 02 ; fixupword
	JSR E_1704	;16F7 7B 0B
	CVX 90,#?,#?	;16F9 47 59 0F 60 60 10
	INR YW,16	;16FF 30 6F
	JMP @16eb	;1701 73 E8

@1703:	RSR		;1703 09

E_1704:	LDA (ZW)	;1704 9C
	LDB #'.N'+$8080	;1705 D0 AE CE
	SAB		;1708 59
	BNZ @1719	;1709 15 0E
	INR ZW,1	;170B 30 80
	JSR 1a02	;170D 79 1A 02 ; fixupword
	JSR E_172c	;1710 7B 1A
	CVX 115,#?,#?	;1712 47 72 0F  17  fixupWord
	???		;1716 1C 06
	RSR		;1718 09

@1719:	JSR E_172c	;1719 7B 11
	RSR		;171B 09

	DB $FF		;171C FF
	DB $FF		;171D FF
	DB $ff		;171E FF
	DB $ff		;171F FF
	DB $ff		;1720 FF
	DB $ff		;1721 FF
	DB $ff		;1722 FF
	DB $ff		;1723 FF
	DB $ff		;1724 FF
	DB $ff		;1725 FF
	DB $ff		;1726 FF
	DB $ff		;1727 FF
	DB $ff		;1728 FF
	DB $ff		;1729 FF
	DB $ff		;172A FF
	DB $ff		;172B FF

E_172C:	LDAB (ZW+)	;172C 85 81	get next source char
	LDBB #'-'+$80	;172E C0 AD
	SABB		;1730 49
	BNZ @173b	;1731 15 08
	JSR E_176b	;1733 7B 36	get value
	ZSU 16,16,(YW),(YW)	;1735 46 FF 4A 66	negate it
	JMP @1744	;1739 73 09

@173B:	LDBB #'+'+$80	;173B C0 AB
	SABB		;173D 49
	BZ @1742	;173E 14 02
	DCR ZW,1	;1740 31 80	unget source char
@1742:	JSR E_176b	;1742 7B 27	get value
@1744:	LDAB (ZW+)	;1744 85 81
	LDBB #'-'+$80	;1746 C0 AD
	SABB		;1748 49
	BNZ @1757	;1749 15 0C
	JSR E_176b	;174B 7B 1E
	S 16,16,160(YW),(YW)	;174D 46 FF 19 60 60 10
	INR YW,16	;1753 30 6F
	JMP E_1744	;1755 73 ED

@1757:	LDBB #'+'+$80	;1757 C0 AB
	SABB		;1759 49
	BNZ @1768	;175A 15 0C
	JSR E_176b	;175C 7B 0D
	A 16,16,$10(YW),(YW)	;175E 46 FF 09 60 60 10
	INR YW,16	;1764 30 6F
	JMP E_1744	;1766 73 DC

@1768:	DCR ZW,1	;1768 31 80	unget source char
	RSR		;176A 09


E_176B: ; get a value
	JSR E_17b7	;176B 7B 4A
L_176D:	LDAB (ZW+)	;176D 85 81	get next source char
	LDBB #'*'+$80	;176F C0 AA	if *
	SABB		;1771 49
	BNZ @1780	;1772 15 0C
	JSR E_17b7	;1774 7B 41
	M 16,16,$10(YW),(YW)	;1776 46 FF 59 60 60 10
	INR YW,16	;177C 30 6F
	JMP E_176D	;177E 73 ED

@1780:	LDBB #'/'+$80	;1780 C0 AF
	SABB		;1782 49
	BNZ @1791	;1783 15 0C
	JSR E_17b7	;1785 7B 30
	D 16,16,$10(YW),(YW)	;1787 46 FF 69 60 60 10
	INR YW,16	;178D 30 6F
	JMP E_176D	;178F 73 DC

@1791:	LDBB #'.'+$80	;1791 C0 AE
	SABB		;1793 49
	BNZ @17b4	;1794 15 1E
	LDAB (ZW)	;1796 8C
	LDBB #'M'+$80	;1797 C0 CD
	SABB		;1799 49
	BNZ @17b4	;179A 15 18
	JSR E_1a02	;179C 79 1A 02 ; fixupword
	JSR E_17b7	;179F 7B 16
	LDA #L_21ac	;17A1 90 21 AC ; fixupword
	DRM 16,16,$10(YW),(YW)	;17A4 46 FF 79 60 60 10
	INR YW,16	;17AA 30 6F
	CVX?? 67,#?,#?	;17AC 47 42 0F  21 AC 06  fixupWord
	JMP E_176d	;17B2 73 B9

@17B4:	DCR ZW,1	;17B4 31 80	unget the source char
	RSR		;17B6 09	return


E_17B7:	LDAB (ZW+)	;17B7 85 81	get next source char
	LDBB #'('+$80	;17B9 C0 A8
	SABB		;17BB 49
	BNZ @17c6	;17BC 15 08
	JSR E_16ba	;17BE 79 16 BA ; fixupword
	JSR 19f6	;17C1 79 19 F6 ; fixupword	compare inline char to source char, consume if match
	DB ')'+$80	;17C4 A9
	RSR		;17C5 09

@17C6:	DCR YW,16	;17C6 31 6F
	MEMSET 10,??	;17C8 47 9E 0F 00  ssss=9 mm=3 nn=2 length=10
	SL?		;17CC 06
	JSR 19d7	;17CD 79 19 D7 ; fixupword
	BM @17d8	;17D0 16 06
	DCR ZW,1	;17D2 31 80
	JSR 190e	;17D4 79 19 0E ; fixupword
	RSR		;17D7 09

@17D8:	LDBB #"'"+$80	;17D8 C0 A7
	XFRB BH,BL	;17DA 45 32
	SABB		;17DC 49
	BZ @1802	;17DD 14 23
	LDBB (ZW)	;17DF CC
	SUBB BL,BH	;17E0 41 23
	BNZ @180a	;17E2 15 26
	INR ZW,1	;17E4 30 80
	LDBB #d8	;17E6 C0 D8
	SABB		;17E8 49
	BNZ @17f0	;17E9 15 05
	JSR 18ea	;17EB 79 18 EA ; fixupword
	JMP @1805	;17EE 73 15

@17F0:	LDBB #c2	;17F0 C0 C2
	SABB		;17F2 49
	BNZ @17fa	;17F3 15 05
	JSR 18cc	;17F5 79 18 CC ; fixupword
	JMP @1805	;17F8 73 0B

@17FA:	LDBB #c3	;17FA C0 C3
	SABB		;17FC 49
	BZ @1802	;17FD 14 03
	JSR E_1a48	;17FF 79 1A 48 ; fixupword	syntax error
@1802:	JSR 1928	;1802 79 19 28 ; fixupword
@1805:	JSR 19f6	;1805 79 19 F6 ; fixupword	compare inline char to source char, consume if match
	DB "'"+$80	;1808 A7
	RSR		;1809 09

@180A:	DCR ZW,1	;180A 31 80
	JSR 180f	;180C 7B 01
	RSR		;180E 09

L_180F:	LDAB (ZW+)	;180F 85 81
	LDBB #'*'+$80	;1811 C0 AA
	SABB		;1813 49
	BNZ @181e	;1814 15 08
	LDA L_0a9e	;1816 91 0A 9E ; fixupword	get location counter
	STA 14(YW)	;1819 B5 68 0E
	JMP @1857	;181C 73 39

@181E:	DCR ZW,1	;181E 31 80
	JSR 19e3	;1820 79 19 E3 ; fixupword
	BP @1829	;1823 17 04
	JSR E_1a48	;1825 79 1A 48 ; fixupword	syntax error
	RSR		;1828 09

@1829:	JSR E_185f	;1829 7B 34
	LDB (YW+)	;182B D5 61
	LDA 03(BW)	;182D 95 28 03
	STA 0e(YW)	;1830 B5 68 0E
	LDA 02(BW)	;1833 95 28 02
	LDAB #20	;1836 80 20
	ORIB AL,AH	;1838 43 01
	STAB 02(BW)	;183A A5 28 02
	LDAB #01	;183D 80 01
	ANDB AL,AH	;183F 42 01
	BNZ @1847	;1841 15 04
	JSR E_1a4e	;1843 79 1A 4E ; fixupword	U error
	RSR		;1846 09

@1847:	LDAB #10	;1847 80 10
	ANDB AL,AH	;1849 42 01
	BZ @1850	;184B 14 03
	STB 0a9b	;184D F1 0A 9B ; fixupword
@1850:	LDAB #04	;1850 80 04
	ANDB AL,AH	;1852 42 01
	BNZ @1857	;1854 15 01
	RSR		;1856 09

@1857:	LDABL_0a99	;1857 81 0A 99 ; fixupword
	IVAB		;185A 2B
	STABL_0a99	;185B A1 0A 99 ; fixupword
	RSR		;185E 09

E_185F:	XFR AW,ZW	;185F 55 80
	STA L_18c5	;1861 B3 62
@1863:	LDAB (ZW+)	;1863 85 81
	JSR E_19ef	;1865 79 19 EF ; fixupword
	BP @1863	;1868 17 F9
	DCR ZW,1	;186A 31 80
	LDA L_18c5	;186C 93 57
	SUB AW,ZW	;186E 51 80
	STA L_18c7	;1870 B3 55
	JSR E_18c1	;1872 7B 4D
	DW L_0986	;1874 09 86 ; fixupword
	LDA L_18c9	;1876 93 51
	BNZ @1890	;1878 15 16
	JSR E_18c1	;187A 7B 45
	DW L_0930	;187C 09 30 ; fixupword
	LDA L_18c9	;187E 93 49
	BNZ @1888	;1880 15 06
	JSR E_1a28	;1882 79 1A 28 ; fixupword	F error
	LDA #L_0a94	;1885 90 0A 94 ; fixupword
@1888:	CLR BW,0	;1888 32 20
	STB 3(AW)	;188A F5 08 03
	STBB 2(AW)	;188D E5 08 02
@1890:	STA (-YW)	;1890 B5 62
	LDAB L_0a91	;1892 81 0A 91 ; fixupword
	BNZ @189c	;1895 15 05
	LDAB L0a90	;1897 81 0A 90 ; fixupword
	BNZ @189d	;189A 15 01
@189C:	RSR		;189C 09

@189D:	STA @18bb	;189D B3 1C
	STB @18bd	;189F F3 1C
	XFR AW,YW	;18A1 55 60
	STA @18bf	;18A3 B3 1A
	LDA L_0a9e	;18A5 91 0A 9E ; fixupword	get location counter
	LDB #L_08c3	;18A8 D0 08 C3 ; fixupword
	STA (BW+)	;18AB B5 21
	LDA L_18c9	;18AD 93 1A
	STA (BW)	;18AF B9
	JSR E_03cd	;18B0 79 03 CD ; fixupword
	LDA @18bf	;18B3 93 0A
	XAY		;18B5 5C
	LDA @18bb	;18B6 93 03
	LDB @18bd	;18B8 D3 03
	RSR		;18BA 09

@18bb:	DS 2
@18bd:	DS 2
@18bf:	DS 2

L_18C1:	LDA (XW+)	;18C1 95 41
	JSR (AW)	;18C3 7D 00
L_18c5:	DW 0		;18C5 00 00
L_18c7:	DW 0		;18C7 00 00
L_18c9:	DW 0		;18C9 00 00
	RSR		;18CB 09

L_18CC:	STK ZH,2	;18CC 7E 81
@18CE:	LDAB (ZW+)	;18CE 85 81
	LDBB #'0'+$80	;18D0 C0 B0
	SABB		;18D2 49
	BZ @18ce	;18D3 14 F9
	DCRB BL,1	;18D5 21 30
	BZ @18ce	;18D7 14 F5
	DCR ZW,1	;18D9 31 80
	LDA (SW)	;18DB 9D
	SUB AW,ZW	;18DC 51 80
	LDB (SW+)	;18DE D5 A1
	???BIG 1,10,?	;18E0 46 0F 8A 26 13 len=1,10 ssss=8 mm=2 nn=2
	RF?		;18E5 03
	JSR E_1a48	;18E6 79 1A 48 ; fixupword	syntax error
	RSR		;18E9 09

L_18EA:	STK ZH,2	;18EA 7E 81
@18EC:	LDAB (ZW+)	;18EC 85 81
	JSR E_19d7	;18EE 79 19 D7 ; fixupword
	BP @18ec	;18F1 17 F9
	LDBB #'F'+$80	;18F3 C0 C6
	SABB		;18F5 49
	BGZ @18fd	;18F6 18 05
	LDBB #'A'+$80	;18F8 C0 C1
	SABB		;18FA 49
	BP @18ec	;18FB 17 EF
@18FD:	DCR ZW,1	;18FD 31 80
	LDA (SW)	;18FF 9D
	SUB AW,ZW	;1900 51 80
	LDB (SW+)	;1902 D5 A1
	???BIG 0f,10,?	;1904 46 EF 8A 26 13 len=1,10 ssss=8 mm=2 nn=2
	RF?		;1909 03
	JSR E_1a48	;190A 79 1A 48 ; fixupword	syntax error
	RSR		;190D 09

L_190E:	STK ZH,2	;190E 7E 81
@1910:	LDAB (ZW+)	;1910 85 81
	JSR 19d7	;1912 79 19 D7 ; fixupword
	BP @1910	;1915 17 F9
	DCR ZW,1	;1917 31 80
	LDA (SW)	;1919 9D
	SUB AW,ZW	;191A 51 80
	LDB (SW+)	;191C D5 A1
	??BIG 9,10,?	;191E 46 8F 8A 26  len=9,10 ssss=8 mm=2 nn=2
	B?? @1927	;1922 13 03
	JSR E_1a48	;1924 79 1A 48 ; fixupword	syntax error
@1927:	RSR		;1927 09

E_1928:	STK XH,2	;1928 7E 41
	LDX #L_21ac	;192A 60 21 AC ; fixupword
	MEMSET 10,??	;192D 47 9E 0F 00  ssss=9 mm=3 nn=2 length=10
	EI?		;1931 04
	LDAB #ff	;1932 80 FF
	STAB L_21bc	;1934 A1 21 BC ; fixupword
@1937:	LDAB (ZW+)	;1937 85 81
	LDBB #"'"+$80	;1939 C0 A7
	SABB		;193B 49
	BNZ @1944	;193C 15 06
	LDBB (ZW)	;193E CC
	SABB		;193F 49
	BNZ @1955	;1940 15 13
	INR ZW,1	;1942 30 80
@1944:	LDBB #00	;1944 C0 00
	SABB		;1946 49
	BZ @1955	;1947 14 0C
	LDBB (XW)	;1949 CA
	BZ @1951	;194A 14 05
	JSR E_1a48	;194C 79 1A 48 ; fixupword	syntax error
	JMP @1955	;194F 73 04

@1951:	STAB (XW+)	;1951 A5 41
	JMP @1937	;1953 73 E2

@1955:	DCR ZW,1	;1955 31 80
	LDA #21ac	;1957 90 21 AC ; fixupword
	SUB AW,XW	;195A 51 40
	DCA		;195C 39
	XAB		;195D 5D
	DCR BW,16	;195E 31 2F
	IVR BW,0	;1960 33 20
	ADD BW,YW	;1962 50 62
	MVF (A),L_21AC,(B) ;1964 67 42 21 AC 02 ; fixupword ssss=4 mm=0 nn=2
	POP XH,79	;1969 7F 41
	RSR		;196B 09


E_196C: ; get string literal, AL=max length 
	STAB (-SW)	;196C A5 A2	save AL (max parm length)
	STK YH,2	;196E 7E 61	save Y (parm stack ptr)
	LDAB (ZW+)	;1970 85 81	get next source char
	LDBB #"'"+$80	;1972 C0 A7
	SABB		;1974 49
	BZ @198a	;1975 14 13
	XFRB AH,AL	;1977 45 10
	LDAB (ZW+)	;1979 85 81	get next source char
	LDB #"C'"+$8080	;197B D0 C3 A7
	SAB		;197E 59
	BZ @198a	;197F 14 09
	JSR E_1a48	;1981 79 1A 48 ; fixupword	syntax error
	INR SW,3	;1984 30 A2	drop saved Y & AL
	CLAB		;1986 2A	push 0
	STAB (-YW)	;1987 A5 62
	RSR		;1989 09

@198A: ; a string literal
	LDAB (ZW+)	;198A 85 81	get next source char
	LDBB #"'"+$80	;198C C0 A7	  ' ?
	SABB		;198E 49
	BNZ @1997	;198F 15 06
	LDBB (ZW)	;1991 CC	get next source char
	SABB		;1992 49	  2nd ' ?
	BNZ @19a0	;1993 15 0B
	INR ZW,1	;1995 30 80	skip 2nd '
@1997:	LDBB #0		;1997 C0 00	is it null?
	SABB		;1999 49
	BZ @19a0	;199A 14 04
	STAB (-YW)	;199C A5 62	save char
	JMP @198a	;199E 73 EA	back for more

@19A0: ; end of string literal
	LDA (SW+)	;19A0 95 A1 	pop saved Y (parm stack ptr) 
	XFR BW,YW	;19A2 55 62	B= string length
	SAB		;19A4 59
	CLA		;19A5 3A
	LDAB (SW)	;19A6 8D	compare with max parm length
	SUB AW,BW	;19A7 51 20
	BZ @19d2	;19A9 14 27
	BM @19b4	;19AB 16 07
	ADD YW,AW	;19AD 50 06
	JSR E_1a48	;19AF 79 1A 48 ; fixupword	syntax error
	JMP @19d2	;19B2 73 1E

@19B4: ; pad parm to max length
	STK XH,2	;19B4 7E 41
	XFR XW,YW	;19B6 55 64
	ADD XW,AW	;19B8 50 04
	STK XH,2	;19BA 7E 41
	IVAB		;19BC 2B
	XFRB AH,BL	;19BD 45 30
@19BF:	LDBB (YW+)	;19BF C5 61
	STBB (XW+)	;19C1 E5 41
	DCRB AH,1	;19C3 21 00
	BGZ @19bf	;19C5 18 F8
	CLRB BL,0	;19C7 22 30
@19C9:	STBB (XW+)	;19C9 E5 41
	DCAB		;19CB 29
	BP @19c9	;19CC 17 FB
	POP YH,1	;19CE 7F 61
	POP XH,1	;19D0 7F 41

@19D2: ; return
	LDAB (SW+)	;19D2 85 A1	set parm length to max length
	STAB (-YW)	;19D4 A5 62
	RSR		;19D6 09	return


L_19D7:	LDBB #'9'+$80	;19D7 C0 B9
	SABB		;19D9 49
	BLE @19df	;19DA 19 03
	LDBB #$ff	;19DC C0 FF
	RSR		;19DE 09

@19DF:	LDBB #'0'+$80	;19DF C0 B0
	SABB		;19E1 49
	RSR		;19E2 09

L_19E3: ; convert letter to index starting at '>'
	LDBB #'Z'+$80	;19E3 C0 DA
	SABB		;19E5 49
	BLE @19eb	;19E6 19 03
	LDBB #$ff	;19E8 C0 FF
	RSR		;19EA 09

@19EB:	LDBB #'>'+$80	;19EB C0 BE
	SABB		;19ED 49
	RSR		;19EE 09


L_19EF:	JSR E_19e3	;19EF 7B F2		convert letter to index starting at '>'
	BP @19f5	;19F1 17 02
	JSR E_19d7	;19F3 7B E2
@19F5:	RSR		;19F5 09


E_19F6: ; compare inline char to source char, consume if match
	LDAB (ZW+)	;19F6 85 81
	LDBB (XW+)	;19F8 C5 41
	SABB		;19FA 49
	BZ @1a01	;19FB 14 04
	DCR ZW,1	;19FD 31 80
	JSR E_1a48	;19FF 7B 47	syntax error
@1A01:	RSR		;1A01 09

E_1A02:
	LDAB (ZW+)	;1A02 85 81	get char
	LDBB #'.'+$80	;1A04 C0 AE
	SABB		;1A06 49
	BZ @1a0f	;1A07 14 06
	JSR E_19e3	;1A09 7B D8
	BP E_1a02	;1A0B 17 F5
	DCR ZW,1	;1A0D 31 80
@1A0F:	RSR		;1A0F 09

E_1A10: ; skip spaces in (Z)
	LDAB #$a0	;1A10 80 A0
@1A12:	LDBB (ZW+)	;1A12 C5 81
	SABB		;1A14 49
	BZ @1a12	;1A15 14 FB
	DCR ZW,1	;1A17 31 80
	RSR		;1A19 09

E_1A1A: ; A error
	LDAB L_21d4	;1A1A 81 21 D4 ; fixupword	if not previous error
	LDBB #$a0	;1A1D C0 A0
	SABB		;1A1F 49
	BNZ L_1a5e	;1A20 15 3C
	LDBB #1		;1A22 C0 01		   A error encountered
	LDAB #'A'+$80	;1A24 80 C1
	JMP L_1a52	;1A26 73 2A

E_1A28: ; F error encountered
	LDBB #2		;1A28 C0 02
	LDAB #'F'+$80	;1A2A 80 C6
	JMP L_1a52	;1A2C 73 24

E_1A2E: ; M error encountered
	LDBB #2		;1A2E C0 02
	LDAB #'M'+$80	;1A30 80 CD
	JMP L_1a52	;1A32 73 1E

E_1A34: ; O error encountered
	LDBB #2		;1A34 C0 02
	LDAB #'O'+$80	;1A36 80 CF
	JMP L_1a52	;1A38 73 18

E_1A3A: ; Relative out-of-range error
	LDAB L_21d4	;1A3A 81 21 D4 ; fixupword  if no previous error
	LDBB #$a0	;1A3D C0 A0
	SABB		;1A3F 49
	BNZ L_1a5e	;1A40 15 1C
	LDBB #1		;1A42 C0 01	  Relative out-of-range error
	LDAB #'R'+$80	;1A44 80 D2
	JMP L_1a52	;1A46 73 0A

E_1A48: ; syntax error encountered
	LDBB #1		;1A48 C0 01
	LDAB #'S'+$80	;1A4A 80 D3
	JMP L_1a52	;1A4C 73 04

E_1A4E: ; U error encountered
	LDBB #1		;1A4E C0 01
	LDAB #'U'+$80	;1A50 80 D5
E_1A52: ; error encountered, AL=letter, BL=??
	STAB L_21d4	;1A52 A1 21 D4 ; fixupword	save error letter in print line
	STBB L_1a5f	;1A55 E3 08
	LDA L_046d	;1A57 91 04 6D ; fixupword	increment # errors
	INA		;1A5A 38
	STA L_046d	;1A5B B1 04 6D ; fixupword
L_1A5E:	RSR		;1A5E 09

L_1a5f:	DB 0		;1A5F 00

E_1A60:	JSR E_1b18	;1A60 79 1B 18 ; fixupword
	LDAB L_1a5f	;1A63 83 FA
	DCAB		;1A65 29
	BGZ @1a80	;1A66 18 18
	LDAB L_0a90	;1A68 81 0A 90 ; fixupword
	BNZ @1a80	;1A6B 15 13
	LDB 2(YW)	;1A6D D5 68 02
	BZ @1a7f	;1A70 14 0D
	LDA (YW)	;1A72 9B
	BLE @1a78	;1A73 19 03
	JSR E_047c	;1A75 79 04 7C ; fixupword
@1A78:	LDA L_0a9e	;1A78 91 0A 9E ; fixupword	bump location counter
	AAB		;1A7B 58
	STB L_0a9e	;1A7C F1 0A 9E ; fixupword
@1A7F:	RSR		;1A7F 09

@1A80:	JSR E_1a92	;1A80 7B 10
	JSR E_1bc1	;1A82 79 1B C1 ; fixupword
	LDA 2(YW)	;1A85 95 68 02
	DCA		;1A88 39
	BLE @1a7f	;1A89 19 F4
	LDB #$fffe	;1A8B D0 FF FE
	JSR E_1cc0	;1A8E 79 1C C0 ; fixupword
	RSR		;1A91 09

E_1A92:	XFR AW,ZW	;1A92 55 80
	STA (-SW)	;1A94 B5 A2
	XFR AW,YW	;1A96 55 60
	STA (-SW)	;1A98 B5 A2
	STX (-SW)	;1A9A 6D A2
	LDAB L_0aa0	;1A9C 81 0A A0 ; fixupword
	BNZ @1aa4	;1A9F 15 03
	JSR E_1b6a	;1AA1 79 1B 6A ; fixupword	insert location counter into print line
@1AA4:	LDA (YW+)	;1AA4 95 61
	BLE @1aaa	;1AA6 19 02
	JSR @1ac9	;1AA8 7B 1F
@1AAA:	LDX (YW+)	;1AAA 65 61
	ADD YW,XW	;1AAC 50 46
@1aae:	LDB #7		;1AAE D0 00 07
	SUB BW,XW	;1AB1 51 42
	BLE @1ab9	;1AB3 19 04
	JSR @1ac9	;1AB5 7B 12
	LDX @1aae+1	;1AB7 63 F6
@1AB9:	LDA #L_21c4	;1AB9 90 21 C4 ; fixupword
	XAZ		;1ABC 5E
@1ABD:	DCX		;1ABD 3F
	BM @1acf	;1ABE 16 0F
	LDAB (-YW)	;1AC0 85 62
	JSR 1b84	;1AC2 79 1B 84 ; fixupword	 cvt hex byte in AL to 2 chars in BW
	STB (ZW+)	;1AC5 F5 81
	JMP @1abd	;1AC7 73 F4

@1AC9:	LDAB #ab	;1AC9 80 AB
	STAB 21d2	;1ACB A1 21 D2 ; fixupword
	RSR		;1ACE 09

@1ACF:	LDA #L_1b0e	;1ACF 90 1B 0E ; fixupword
	XAY		;1AD2 5C
	LDA #L_0ab1	;1AD3 90 0A B1 ; fixupword
	XAZ		;1AD6 5E
@1AD7:	LDB (YW+)	;1AD7 D5 61
	BZ @1b02	;1AD9 14 27
	STB @1af8	;1ADB F3 1B
	LDA #L_2244	;1ADD 90 22 44 ; fixupword
	SAB		;1AE0 59
	STB (-SW)	;1AE1 F5 A2
	LDB (-ZW)	;1AE3 D5 82
	LDA (-ZW)	;1AE5 95 82
	BZ @1afe	;1AE7 14 15
	STA @1afa	;1AE9 B3 0F
	SUB AW,BW	;1AEB 51 20
	LDB (SW)	;1AED DD
	SAB		;1AEE 59
	BGZ @1af2	;1AEF 18 01
	STA (SW)	;1AF1 BD
@1AF2:	LDA (SW+)	;1AF2 95 A1
	XAB		;1AF4 5D
	JSR E_2532	;1AF5 79 25 32 ; fixupword	insert chars
@1af8:	DW 0		;1AF8 00 00	dest ptr
@1afa:	DW 0		;1AFA 00 00	src ptr
	JMP @1ad7	;1AFC 73 D9

@1AFE:	LDA (SW+)	;1AFE 95 A1
	JMP @1ad7	;1B00 73 D5

@1B02:	JSR E_1e0e	;1B02 79 1E 0E ; fixupword
	LDX (SW+)	;1B05 65 A1	restore X
	LDA (SW+)	;1B07 95 A1	restore Y
	XAY		;1B09 5C
	LDA (SW+)	;1B0A 95 A1	restore Z
	XAZ		;1B0C 5E
	RSR		;1B0D 09	return

L_1b0e:
	DW L_2202	;1B0E 22 02 ; fixupword
	DW L_21E6	;1B10 21 E6 ; fixupword
	DW L_21DF	;1B12 21 DF ; fixupword
	DW L_21D6	;1B14 21 D6 ; fixupword
	DW 0		;1B16 00 00

E_1B18:	XFR AW,YW	;1B18 55 60
	STA (-SW)	;1B1A B5 A2
	LDA (YW+)	;1B1C 95 61
	LDA (YW+)	;1B1E 95 61
	ADD YW,AW	;1B20 50 06
	LDA (YW+)	;1B22 95 61
	LDBB (YW+)	;1B24 C5 61
	BZ @1b5a	;1B26 14 32
	STX (-SW)	;1B28 6D A2
	XAX		;1B2A 5B
	LDA (YW+)	;1B2B 95 61
	LDB 2(AW)	;1B2D D5 08 02
	LDBB #$10	;1B30 C0 10
	ANDB BL,BH	;1B32 42 23
	BNZ @1b45	;1B34 15 0F
	LDBB #2		;1B36 C0 02
	ANDB BL,BH	;1B38 42 23
	BNZ @1b4a	;1B3A 15 0E
	LDB 3(AW)	;1B3C D5 08 03
	BZ @1b4a	;1B3F 14 09
	SUB BW,XW	;1B41 51 42
	BZ @1b4a	;1B43 14 05
@1B45:	JSR E_1a2e	;1B45 79 1A 2E ; fixupword	M error
	JMP @1b58	;1B48 73 0E

@1B4A:	STX 3(AW)	;1B4A 6D 08 03
	LDB 2(AW)	;1B4D D5 08 02
	LDBB L_0a9a	;1B50 C1 0A 9A ; fixupword
	ORIB BL,BH	;1B53 43 23
	STBB 2(AW)	;1B55 E5 08 02
@1B58:	LDX (SW+)	;1B58 65 A1
@1B5A:	LDA (SW+)	;1B5A 95 A1
	XAY		;1B5C 5C
	RSR		;1B5D 09

L_1B5E: ; insert operand into print line
	LDA (YW)	;1B5E 9B
	LDB #L_21cf	;1B5F D0 21 CF ; fixupword
	JSR E_1b73	;1B62 7B 0F	cvt hex word in AW to 4 chars at (BW)
	LDAB #1		;1B64 80 01
	STAB L_0aa0	;1B66 A1 0A A0 ; fixupword
	RSR		;1B69 09

E_1B6A: ; insert location counter into print line
	LDA L_0a9e	;1B6A 91 0A 9E ; fixupword	get location counter
	LDB #L_21bf	;1B6D D0 21 BF ; fixupword	in print line
	JSR E_1b73	;1B70 7B 01			cvt hex word in AW to 4 chars at (BW)
	RSR		;1B72 09			return

E_1B73: ;  cvt hex word in AW to 4 chars at (BW)
	STX (-SW)	;1B73 6D A2	save X
	XFR XW,BW	;1B75 55 24	X=B
	JSR E_1b84	;1B77 7B 0B	cvt hex byte in AL to 2 chars in BW
	STB 2(XW)	;1B79 F5 48 02	store lo 2 chars
	XFRB AL,AH	;1B7C 45 01	do hi byte
	JSR E_1b84	;1B7E 7B 04	cvt hex byte in AL to 2 chars in BW
	STB (XW)	;1B80 FA	store hi 2 chars
	LDX (SW+)	;1B81 65 A1	restore X
	RSR		;1B83 09	return

E_1B84: ; cvt hex byte in AL to 2 chars in BW
	STAB (-SW)	;1B84 A5 A2	save value
	SRRB AL,4	;1B86 24 13	shift hi nibble to lo
	JSR @1b8e	;1B88 7B 04	do hi nibble
	XFRB BH,BL	;1B8A 45 32	save char
	LDAB (SW+)	;1B8C 85 A1	restore value
@1B8E:	LDBB #$f	;1B8E C0 0F	isolate lo nibble
	NABB		;1B90 4A
	STAB (-SW)	;1B91 A5 A2	save value
	LDAB #9		;1B93 80 09	is it >9?
	SUBB AL,BL	;1B95 41 31
	BLE @1b9d	;1B97 19 04
	LDBB #$c0	;1B99 C0 C0	cvt a..f to char
	JMP @1b9f	;1B9B 73 02

@1B9D:	LDAB #$b0	;1B9D 80 B0	cvt 0..9 to char
@1B9F:	ORIB BL,AL	;1B9F 43 13	BL=char
	LDAB (SW+)	;1BA1 85 A1	restore value
	RSR		;1BA3 09	return

L_1BA4:	STA (-SW)	;1BA4 B5 A2
	LDB #0005	;1BA6 D0 00 05
	AAB		;1BA9 58
	CLA		;1BAA 3A
	LDAB (BW+)	;1BAB 85 21
	STB 1bbc	;1BAD F3 0D
	XAB		;1BAF 5D
	LDA (XW+)	;1BB0 95 41
	STA 1bba	;1BB2 B3 06
	LDA #0006	;1BB4 90 00 06
	JSR E_2532	;1BB7 79 25 32 ; fixupword	
	DW 0		;1BBA 00 00
	DW 0		;1BBC 00 00
	LDA (SW+)	;1BBE 95 A1
	RSR		;1BC0 09

E_1BC1:	STX (-SW)	;1BC1 6D A2	save X
	XFR XW,YW	;1BC3 55 64	save Y
	STX (-SW)	;1BC5 6D A2
	LDX (YW+)	;1BC7 65 61
@1BC9:	JSR @1bd0	;1BC9 7B 05
	DCX		;1BCB 3F
	BGZ @1bc9	;1BCC 18 FB
	JMP @1c05	;1BCE 73 35

@1BD0:	STX (-SW)	;1BD0 6D A2
	XFR XW,YW	;1BD2 55 64
	STX (-SW)	;1BD4 6D A2
	LDX (YW+)	;1BD6 65 61
	ADD YW,XW	;1BD8 50 46
@1BDA:	DCX		;1BDA 3F
	BM @1c05	;1BDB 16 28
	CLA		;1BDD 3A
	LDAB L_1c22	;1BDE 83 42
	LDB #$78	;1BE0 D0 00 78
	SAB		;1BE3 59
	BM @1be8	;1BE4 16 02
@1BE6:	JSR E_1c0b	;1BE6 7B 23
@1BE8:	LDA L_0a9e	;1BE8 91 0A 9E ; fixupword	get location counter
	LDB L_PushF2F3	;1BEB D3 32
	SAB		;1BED 59
	BNZ @1be6	;1BEE 15 F6
	INA		;1BF0 38
	STA L_0a9e	;1BF1 B1 0A 9E ; fixupword	set location counter
	STA L_PushF2F3	;1BF4 B3 29
	CLA		;1BF6 3A
	LDAB L_1c22	;1BF7 83 29
	INA		;1BF9 38
	STAB L_1c22	;1BFA A3 26
	LDB #1c24	;1BFC D0 1C 24 ; fixupword
	AAB		;1BFF 58
	LDAB (-YW)	;1C00 85 62
	STAB (BW)	;1C02 A9
	JMP @1bda	;1C03 73 D5

@1C05:	LDA (SW+)	;1C05 95 A1	restore Y
	XAY		;1C07 5C
	LDX (SW+)	;1C08 65 A1	restore X
	RSR		;1C0A 09	return

E_1C0B:	LDAB L_1c22	;1C0B 83 15
	BZ @1c14	;1C0D 14 05
	JSR E_1c9d	;1C0F 79 1C 9D ; fixupword
	DW L_1C21	;1C12 1C 21 ; fixupword
@1C14:	LDA L_0a9e	;1C14 91 0A 9E ; fixupword	get location counter
	STA L_PushF2F3	;1C17 B3 06
	STA L_1c23	;1C19 B3 08
	CLAB		;1C1B 2A
	STAB L_1c22	;1C1C A3 04
	RSR		;1C1E 09

L_PushF2F3:	D@ 0	;1C1F 00 00
	DB 00	;1C21 00
L_1c22:	DB 0	;1C22 00
L_1c23:	DW 0	;1C23 00 00

E_1C9D:
	LDA (XW+)	;1C9D 95 41
	LDBB L_0a90	;1C9F C1 0A 90 ; fixupword
	BZ @1ca7	;1CA2 14 03
	JSR E_03bf	;1CA4 79 03 BF ; fixupword
@1CA7:	RSR		;1CA7 09

L_1ca8:
	DB 2	;1CA8 02
	DB $D	;1CA9 0D
	DB 0	;1CAA 00
	DB 0	;1CAB 00
L_1cac:	DW 0	;1CAC 00 00
L_1cae:	DW 0	;1CAE 00 00	location counter at start of ???
L_1cb0:	DB 0	;1CB0 00

L_1CB9:	STAB 1cb0	;1CB9 A3 F5
	JSR E_1c9d	;1CBB 7B E0
	DW L_1CA8	;1CBD 1C A8 ; fixupword
	RSR		;1CBF 09

L_1CC0:	STB L_1cef+1	;1CC0 F3 2E
	LDA 0a9b	;1CC2 91 0A 9B ; fixupword
	BNZ 1cf7	;1CC5 15 30
	LDABL_0a99	;1CC7 81 0A 99 ; fixupword
	BZ 1cf6		;1CCA 14 2A
	CLA		;1CCC 3A
	LDAB L_1d17	;1CCD 83 48
	LDB #0076	;1CCF D0 00 76
	SAB		;1CD2 59
	BLE 1ce1	;1CD3 19 0C
	JSR E_1d09	;1CD5 7B 32
	DW L_1D92	;1CD7 1D 92 ; fixupword
	MVF $7c,L_1d16,L_1d92	;1CD9 47 40 7B 1D 16 1D 92 ; fixupword ssss=4 mm=0 nn=0 length=7c
	CLA		;1CE0 3A
	STX (-SW)	;1CE1 6D A2
	LDX #L_1d1a	;1cE3 60 1D 1A ; fixupword
	?? 		;1CE5 50 04
	INR AW,2	;1CE8 30 01
	STAB L_1d17	;1CEA A3 2B
	LDA L_0a9e	;1CEC 91 0A 9E ; fixupword	get location counter
L_1CEF:	LDB #0		;1CEF D0 00 00 modified
	AAB		;1CF2 58
	STB (XW)	;1CF3 FA
	LDX (SW+)	;1CF4 65 A1
L_1CF6:	RSR		;1CF6 09

L_1CF7:	JSR 1ba4	;1CF7 79 1B A4 ; fixupword
	DW L_1CB1	;1CFA 1C B1 ; fixupword
	LDA L_0a9e	;1CFC 91 0A 9E ; fixupword	get location counter
	LDB L_1cef+1	;1CFF D3 EF
	AAB		;1D01 58
	STB L_1cac	;1D02 F3 A8
	LDAB #02	;1D04 80 02
	JSR 1cb9	;1D06 7B B1
	RSR		;1D08 09

E_1D09:
	LDA (XW+)	;1D09 95 41
	STA @1d13	;1D0B B3 06
	INA		;1D0D 38
	LDBB (AW)	;1D0E C8
	BZ @1d15	;1D0F 14 04
	JSR E_1c9d	;1D11 7B 8A
@1d13:	DW 0		;1D13 00 00
@1D15:	RSR		;1D15 09

L_1D16: ; $7c byte buf
	DB 1	;1D16 01
L_1D17:	DB 0	;1D17 00
	DB 0	;1D18 00
	DB 0	;1D19 00
L_1D1A:
	DS $78

L_1d92: ; $7c byte buf
	DB 1	;1D92 01
L_1d93:	DB 0	;1D93 00
	DB 0	;1D94 00
	DB 0	;1D95 00
	DS $78

L_1E0E: ; write a listing line?
	LDAB L_1a5f	;1E0E 81 1A 5F ; fixupword	maybe write to terminal?
	BNZ L_1e38	;1E11 15 25
	LDAB L_0a92	;1E13 81 0A 92 ; fixupword	if "print on" always write
	BNZ E_1e25	;1E16 15 0D
	LDAB L_0a93	;1E18 81 0A 93 ; fixupword	if "print noconsole" skip write
	BZ L_1e37	;1E1B 14 1A
	LDAB L_21d6	;1E1D 81 21 D6 ; fixupword	if L_21bd+?? ??? skip write
	LDBB #$aa	;1E20 C0 AA
	SABB		;1E22 49
	BNZ L_1e37	;1E23 15 12
E_1E25: ; write L_21bd & blank buf
	JSR E_03f6	;1E25 79 03 F6 ; fixupword	write string
	DW L_21BD	;1E28 21 BD ; fixupword
E_1E2A: ; blank L_21bd
	LDA #132	;1E2A 90 00 84
	LDB #L_21bd	;1E2D D0 21 BD ; fixupword
	STA (BW+)	;1E30 B5 21			init length
	DCA		;1E32 39			fill with spaces
	FIL (A),#$a0,(B) ;1E33 67 9E A0 02	ssss=9 mm=3 nn=2
L_1E37:	RSR		;1E37 09

L_1E38:	MVF 1,#80,L_21bd+1 ;1E38 47 4C 00 50 21 BE ; fixupword   set length to 80
	LDB #L_1e4f	;1E3E D0 1E 4F ; fixupword
	SVC $10		;1E41 66 10				do file op
	SVC $08		;1E43 66 08				flush
	DW L_1E4F	;1E45 1E 4F ; fixupword
	MVF 1,#132,L_21bd+1 ;1E47 47 4C 00 84 21 BE ; fixupword set length to 132
	JMP E_1e25	;1E4D 73 D6	write L_21BD & blank out

L_1e4f: ; short file control block?
	DB 00	;1E4F 00
	DB 82	;1E50 82
	DB 00	;1E51 00
	DB 02	;1E52 02
	DB 00	;1E53 00
	DB 80	;1E54 50
	DW L_21BD	;1E55 21 BD ; fixupword
	DB 00	;1E57 00
	DB 00	;1E58 00

E_1E59: ; look up opcode
	STX (-SW)	;1E59 6D A2
	LDAB (ZW+)	;1E5B 85 81			get 1st char
	JSR 19e3	;1E5D 79 19 E3 ; fixupword	convert to index starting at '>'
	BM @1e93	;1E60 16 31			  bad?
	CLRB BH,0	;1E62 22 20			*2
	SLR BW,1	;1E64 35 20
	LDA #@1e9b	;1E66 90 1E 9B ; fixupword	get list ptr
	AAB		;1E69 58
	LDA (BW)	;1E6A 99
	BZ @1e93	;1E6B 14 26			  no ptr?
	XAX		;1E6D 5B			X=list ptr
	LDAB (ZW+)	;1E6E 85 81			get next 2 chars
	XFRB AH,AL	;1E70 45 10
	LDAB (ZW+)	;1E72 85 81
	JSR 19ef	;1E74 79 19 EF ; fixupword
	BP @1e7d	;1E77 17 04
	DCR ZW,1	;1E79 31 80
	LDAB #a0	;1E7B 80 A0
@1E7D:	LDBB (XW)	;1E7D CA			end of list?
	BZ @1e93	;1E7E 14 13
	LDB (XW+)	;1E80 D5 41			2 chars match?
	SAB		;1E82 59
	BZ @1e89	;1E83 14 04
	INX		;1E85 3E			next list entry
	INX		;1E86 3E
	JMP @1e7d	;1E87 73 F4

@1E89: ; table match found
	LDAB (XW+)	;1E89 85 41		push 2 bytes of parms on Y
	STAB (-YW)	;1E8B A5 62
	LDAB (XW+)	;1E8D 85 41
	STAB (-YW)	;1E8F A5 62
	JMP @1e98	;1E91 73 05

@1E93: ; no match
	LDA #ffff	;1E93 90 FF FF	
	STA (-YW)	;1E96 B5 62
@1E98:	LDX (SW+)	;1E98 65 A1		restore X
	RSR		;1E9A 09

@1e9b: ; 1st opcode table
	; indexed by 1st char, points to 2nd level lists
	DW 0		;1E9B 00 00		>
	DW 0		;1E9D 00 00		?
	DW 0		;1E9F 00 00		@
	DW @1ED5	;1EA1 1E D5 ; fixupword	A
	DW @1EEA	;1EA3 1E EA ; fixupword	B
	DW @1F2F	;1EA5 1F 2F ; fixupword	C
	DW @1F58	;1EA7 1F 58 ; fixupword	D
	DW @1F9D	;1EA9 1F 9D ; fixupword	E
	DW @1FC2	;1EAB 1F C2 ; fixupword	F
	DW 0		;1EAD 00 00		G
	DW @1FCB	;1EAF 1F CB ; fixupword	H
	DW @1FD0	;1EB1 1F D0 ; fixupword	I
	DW @1FED	;1EB3 1F ED ; fixupword	J
	DW 0		;1EB5 00 00		K
	DW @1FF6	;1EB7 1F F6 ; fixupword	L
	DW @2017	;1EB9 20 17 ; fixupword	M
	DW @202C	;1EBB 20 2C ; fixupword	N
	DW @2035	;1EBD 20 35 ; fixupword	O
	DW @2046	;1EBF 20 46 ; fixupword	P
	DW 0		;1EC1 00 00		Q
	DW @2053	;1EC3 20 53 ; fixupword	R
	DW @2078	;1EC5 20 78 ; fixupword	S
	DW @20E5	;1EC7 20 E5 ; fixupword	T
	DW 0		;1EC9 00 00		U
	DW 0		;1ECB 00 00		V
	DW 0		;1ECD 00 00		W
	DW @20EA	;1ECF 20 EA ; fixupword	X
	DW 0		;1ED1 00 00		Y
	DW @2107	;1ED3 21 07 ; fixupword Z

; 1st opcode lists by 1st letter 
; struct OPENTRY { \\ list entry layout
;	char Op2, Op3;  // 2nd & 3rd chars of opcode
;	byte OpcodeBase	// 1st or 2nd byte; variant & registers added in processors
;	byte IsPseudoOp    :1, // use pseudo-op processors
;	     HasByteVariant:1,
;		??         :1,
;		??         :1, 
;	    ProcessorNumber:4 ; // processor routine # to use
;	} ;

@1ed5: ; starts with 'A'
	DB ' '+$80,' '+$80,$00,$74 	;1ED5 A0 A0 00 74	A    Op7,??  add_big
	DB 'N'+$80,'C'+$80,$50,$84	;1ED9 CE C3 50 84	ANC  Op8,??
	DB 'A'+$80,'B'+$80,$58,$02	;1EDD C1 C2 58 02	AAB  Inherent,Byte
	DB 'N'+$80,'D'+$80,$52,$22	;1EE1 CE C4 52 22	AND  Inherent,Byte
	DB 'D'+$80,'D'+$80,$50,$22	;1EE5 C4 C4 50 22	ADD  Inherent,Byte
	DB 0				;1EE9 00	end of list

@1eea: ; starts with 'B'
	DB 'Z'+$80,' '+$80,$14,$30	;1EEA DA A0 14 30	BZ  Relative
	DB 'N'+$80,'Z'+$80,$15,$30	;1EEE CE DA 15 30	BNZ Relative
	DB 'L'+$80,' '+$80,$10,$30	;1EF2 CC A0 10 30	BL  Relative
	DB 'N'+$80,'L'+$80,$11,$30	;1EF6 CE CC 11 30	BNL Relative
	DB 'M'+$80,' '+$80,$16,$30	;1EFA CD A0 16 30	BM  Relative
	DB 'P'+$80,' '+$80,$17,$30	;1EFE D0 A0 17 30	BP  Relative
	DB 'G'+$80,'Z'+$80,$18,$30	;1F02 C7 DA 18 30	BGZ Relative
	DB 'L'+$80,'E'+$80,$19,$30	;1F06 CC C5 19 30	BLE Relative
	DB 'S'+$80,'1'+$80,$1A,$30	;1F0A D3 B1 1A 30	BS1 Relative
	DB 'S'+$80,'2'+$80,$1B,$30	;1F0E D3 B2 1B 30	BS2 Relative
	DB 'S'+$80,'3'+$80,$1C,$30	;1F12 D3 B3 1C 30	BS3 Relative
	DB 'S'+$80,'4'+$80,$1D,$30	;1F16 D3 B4 1D 30	BS4 Relative
	DB 'F'+$80,' '+$80,$12,$30	;1F1A C6 A0 12 30	BF  Relative
	DB 'N'+$80,'F'+$80,$13,$30	;1F1E CE C6 13 30	BNF Relative
	DB 'I'+$80,' '+$80,$1E,$30	;1F22 C9 A0 1E 30	BI  Relative	branch on interrupt enabled?
	DB 'C'+$80,'K'+$80,$1F,$30	;1F26 C3 CB 1F 30	BCK Relative	branch on clock interrupt enabled?
	DB 'E'+$80,'G'+$80,$07,$01	;1F2A C5 C7 07 01	BEG PseudoOp
	DB 0				;1F2E 00	end of list

@1f2f: ; starts with 'C'
	DB ' '+$80,' '+$80,$20,$74 	;1F2F A0 A0 20 74	C   Op7	 compare_big
	DB 'T'+$80,'B'+$80,$80,$7C	;1F33 D4 C2 80 7C	CTB Op7  big cvt_to_binary?
	DB 'F'+$80,'B'+$80,$90,$7C	;1F37 C6 C2 90 7C	CFB Op7  cvt_from_binary?
	DB 'P'+$80,'F'+$80,$80,$84	;1F3B D0 C6 80 84	CPF Op8
	DB 'P'+$80,'V'+$80,$10,$80	;1F3F D0 D6 10 80	CPV Op8
	DB 'V'+$80,'X'+$80,$00,$80	;1F43 D6 D8 00 80	CVX Op8
	DB 'L'+$80,'A'+$80,$3A,$0E	;1F47 CC C1 3A 0E	CLA Inherent,Byte,??,??
	DB 'L'+$80,'R'+$80,$32,$1E	;1F4B CC D2 32 1E	CLR RegValue,Byte,??,??
	DB 'L'+$80,' '+$80,$08,$00	;1F4F CC A0 08 00	CL  Inherent
	DB 'A'$+80,'D'+$80,$32,$6C	;1F53 C1 C4 32 6C	CAD Op6	clear addr?
	DB 0				;1F57 00	end of list

@1f58: ; starts with 'D'
	DB ' '+$80,' '+$80,$60,$74	;1F58 A0 A0 60 74	D   Op7  divide_big?
	DB 'R'+$80,'M'+$80,$70,$74	;1F5C D2 CD 70 74	DRM  op7  divide_remainder_big?
	DB 'I'+$80,'V'+$80,$78,$20	;1F60 C9 D6 78 20	DIV RegReg  divide?
	DB 'C'+$80,'X'+$80,$3F,$08	;1F64 C3 D8 3F 08	DCX  Inherent,??
	DB 'C'+$80,'A'+$80,$39,$0A	;1F68 C3 C1 39 0A	DCA  Inherent,byte,??
	DB 'C'+$80,'R'+$80,$31,$1A	;1F6C C3 D2 31 1A	DCR RegValue,Byte,??
	DB 'E'+$80,'C'+$80,$31,$68	;1F70 C5 C3 31 68	DEC Op6   decrement_memory?
	DB 'W'+$80,' '+$80,$04,$01	;1F74 D7 A0 04 01	DW  PseudoOp
	DB 'B'+$80,' '+$80,$03,$01	;1F78 C2 A0 03 01	DB  PseudoOp
	DB 'C'+$80,' '+$80,$05,$01	;1F7C C3 A0 05 01	DC PseudoOp
	DB 'S'+$80,' '+$80,$06,$01	;1F80 D3 A0 06 01	DS  PseudoOp
	DB 'L'+$80,'Y'+$80,$0E,$00	;1F84 CC D9 0E 00	DLY Inherent
	DB 'I'+$80,' '+$80,$05,$00	;1F88 C9 A0 05 00	DI  Inherent
	DB 'M'+$80,'A'+$80,$2F,$50	;1F8C CD C1 2F 50	DMA Op5
	DB 'C'+$80,'K'+$80,$C6,$00	;1F90 C3 CB C6 00	DCK Inherent
	DB 'A'+$80,'O'+$80,$57,$00	;1F94 C1 CF 57 00	DAO Inherent
	DB 'P'+$80,'E'+$80,$86,$00	;1F98 D0 C5 86 00	DPE Inherent
	DB 0				;1F9C 00	end of list

@1f9d: ; starts with 'E'
	DB 'Q'+$80,'U'+$80,$00,$01	;1F9D D1 D5 00 01	EQU PseudoOp	EQUate?
	DB 'X'+$80,'T'+$80,$0A,$01	;1FA1 D8 D4 0A 01	EXT PseudoOp	external ref?
	DB 'N'+$80,'T'+$80,$09,$01	;1FA5 CE D4 09 01	ENT PseudoOp	entry?
	DB 'I'+$80,' '+$80,$04,$00	;1FA9 C9 A0 04 00	EI  Inherent
	DB 'N'+$80,'D'+$80,$08,$01	;1FAD CE C4 08 01	END PseudoOp	end of file?
	DB 'J'+$80,'E'+$80,$0D,$01	;1FB1 CA C5 0D 01	EJE PseudoOp	EJEct?
	DB 'C'+$80,'K'+$80,$B6,$00	;1FB5 C3 CB B6 00	ECK Inherent	enable clock interrupt?
	DB 'A'+$80,'O'+$80,$56,$00	;1FB9 C1 CF 56 00	EAO Inherent
	DB 'P'+$80,'E'+$80,$76,$00	;1FBD D0 C5 76 00	EPE Inherent
	DB 0				;1FC1 00	end of list

@1fc2: ; starts with 'F'
	DB 'I'+$80,'L'+$80,$90,$84	;1FC2 C9 CC 90 84	FIL Op8
	DB 'L'+$80,'M'+$80,$40,$90	;1FC6 CC CD 40 90	FLM Op9
	DB 0				;1FCA 00	end of list

@1fcb: ; starts with 'H'
	DB 'L'+$80,'T'+$80,$00,$00	;1FCB CC D4 00 00	HLT Inherent
	DB 0				;1FCF 00	end of list

@1fd0: ; starts with 'I'
	DB 'N'+$80,'X'+$80,$3E,$08	;1FD0 CE D8 3E 08	INX Inherent,??
	DB 'N'+$80,'A'+$80,$38,$0A	;1FD4 CE C1 38 0A	INA Inherent,Byte,??
	DB 'V'+$80,'A'+$80,$3B,$0E	;1FD8 D6 C1 3B 0E	IVA Inherent,Byte,??,??
	DB 'N'+$80,'R'+$80,$30,$1A	;1FDC CE D2 30 1A	INR RegValue,Byte,??
	DB 'V'+$80,'R'+$80,$33,$1E	;1FE0 D6 D2 33 1E	IVR RegValue,Byte,??,??,??
	DB 'N'+$80,'C'+$80,$30,$68	;1FE4 CE C3 30 68	INC Op6  increment_memory?
	DB 'A'+$80,'D'+$80,$33,$6C	;1FE8 C1 C4 33 6C	IAD Op6  invert_memory?
	DB 0				;1FEC 00	end of list

@1fed: ; starts with 'J'
	DB 'M'+$80,'M'+$80,$70,$40	;1FED CD D0 70 40	JMP Op4
	DB 'S'+$80,'R'+$80,$78,$40	;1FF1 D3 D2 78 40	JSR Op4
	DB 0				;1FF5 00	end of list

@1ff6: ; starts with 'L'
	DB 'I'+$80,'O'+$80,$F6,$E0	;1FF6 C9 CF F6 E0	LIO OpE
	DB 'S'+$80,'T'+$80,$6E,$C0	;1FFA D3 D4 6E C0	LST OpC
	DB 'A'+$80,'R'+$80,$E6,$D0	;1FFE C1 D2 E6 D0	LAR OpD
	DB 'D'+$80,'M'+$80,$00,$90	;2002 C4 CD 00 90	LDM Op9
	DB 'S'+$80,'M'+$80,$20,$90	;2006 D3 CD 20 90	LSM Op9
	DB 'D'+$80,'A'+$80,$90,$46	;200A C4 C1 90 46	LDA Op4,Byte,??
	DB 'D'+$80,'B'+$80,$D0,$46	;200E C4 C2 D0 46	LDB Op4,Byte,??
	DB 'D'+$80,'X'+$80,$60,$44	;2012 C4 D8 60 44	LDX Op4,??
	DB 0				;2016 00	end of list

@2017: ; starts with 'M'
	DB ' '+$80,' '+$80,$50,$74	;2017 A0 A0 50 74	M   Op7,??	multiply_big
	DB 'V'+$80,'F'+$80,$40,$84	;201B D6 C6 40 84	MVF Op8,??
	DB 'V'+$80,'V'+$80,$20,$80	;201F D6 D6 20 80	MVV Op8
	DB 'V'+$80,'L'+$80,$F7,$00	;2023 D6 CC F7 00	MVL Inherent
	DB 'U'+$80,'L'+$80,$77,$20	;2027 D5 CC 77 20	MUL Op2  16bit multiply?
	DB 0				;202B 00	end of list

@202c: ; starts with 'N'
	DB 'A'+$80,'B'+$80,$5A,$02	;202C C1 C2 5A 02	NAB Inherent,Byte
	DB 'O'+$80,'P'+$80,$01,$00	;2030 CF D0 01 00	NOP Inherent
	DB 0				;2034 00	end of list

@2035: ; starts with 'O'
	DB 'R'+$80,'C'+$80,$60,$84	;2035 D2 C3 60 84	ORC Op8  big_or?
	DB 'R'+$80,'I'+$80,$53,$22	;2039 D2 C9 53 22	ORI RegReg,Byte
	DB 'R'+$80,'E'+$80,$54,$22	;203D D2 C5 54 22	ORE RegReg,Byte
	DB 'R'+$80,'G'+$80,$02,$01	;2041 D2 C7 02 01	ORG PseudoOp
	DB 0				;2045 00	end of list

@2046: ; starts with 'P'
	DB 'O'+$80,'P'+$80,$7F,$B0 	;2046 CF D0 7F B0	POP OpB
	DB 'R'+$80,'I'+$80,$0B,$01	;204A D2 C9 0B 01	PRI PseudoOp	PRInt?
	DB 'C'+$80,'X'+$80,$0D,$00	;204E C3 D8 0D 00	PCX Inherent
	DB 0		 		;2052 00	end of list

@2053: ; starts with 'R'
	DB 'S'+$80,'R'+$80,$09,$00	;2053 D3 D2 09 00	RSR Inherent
	DB 'S'+$80,'V'+$80,$0F,$00	;2057 D3 D6 0F 00	RSV Inherent
	DB 'L'+$80,' '+$80,$07,$00	;205B CC A0 07 00	RL  Inherent
	DB 'I'+$80,' '+$80,$0A,$00	;205F C9 A0 0A 00	RI  Inherent
	DB 'R'+$80,'R'+$80,$36,$1A	;2063 D2 D2 36 1A	RRR RegValue,Byte,??
	DB 'L'+$80,'R'+$80,$37,$1A	;2067 CC D2 37 1A	RLR RegValue,Byte,??
	DB 'T'+$80,'R'+$80,$36,$68 	;206B D4 D2 36 68	RTR Op6  rot_right_memory?
	DB 'T'+$80,'L'+$80,$37,$68 	;206F D4 CC 37 68	RTL Op6  rot_left_memory?
	DB 'F'+$80,' '+$80,$03,$00	;2073 C6 A0 03 00	RF  Inherent
	DB 0				;2077 00	end of list

@2078: ; starts with 'S'
	DB 'I'+$80,'O'+$80,$F6,$E4 	;2078 C9 CF F6 E4	SIO OpE
	DB ' '+$80,' '+$80,$10,$74 	;207C A0 A0 10 74	S  Op7  big_subtract?
	DB 'V'+$80,'C'+$80,$66,$A0 	;2080 D6 C3 66 A0	SVC OpA  supervisor_call
	DB 'T'+$80,'K'+$80,$7E,$B0 	;2084 D4 CB 7E B0	STK OpB  push
	DB 'S'+$80,'T'+$80,$6F,$C0 	;2088 D3 D4 6F C0	SST OpC
	DB 'A'+$80,'R'+$80,$D7,$D0 	;208C C1 D2 D7 D0	SAR OpD
	DB 'T'+$80,'M'+$80,$10,$90	;2090 D4 CD 10 90	STM Op9
	DB 'S'+$80,'M'+$80,$30,$90	;2094 D3 CD 30 90	SSM Op9
	DB 'T'+$80,'R'+$80,$D6,$20  	;2098 D4 D2 D6 20	STR RegReg
	DB 'T'+$80,'A'+$80,$B0,$46 	;209C D4 C1 B0 46	STA Op4,Byte,??
	DB 'T'+$80,'B'+$80,$F0,$46 	;20A0 D4 C2 F0 46	STB Op4,Byte,??
	DB 'A'+$80,'B'+$80,$59,$02	;20A4 C1 C2 59 02	SAB Inherent,Byte
	DB 'T'+$80,'X'+$80,$68,$44 	;20A8 D4 D8 68 44	STX Op4,??
	DB 'U'+$80,'B'+$80,$51,$22 	;20AC D5 C2 51 22	SUB RegReg,Byte
	DB 'L'+$80,'A'+$80,$3D,$0A	;20B0 CC C1 3D 0A	SLA Inherent,Byte,??
	DB 'R'+$80,'A'+$80,$3C,$0A	;20B4 D2 C1 3C 0A	SRA Inherent,Byte,??
	DB 'R'+$80,'R'+$80,$34,$1A	;20B8 D2 D2 34 1A	SRR RegValue,Byte,??
	DB 'L'+$80,'R'+$80,$35,$1A	;20BC CC D2 35 1A	SLR RegValue,Byte,??
	DB 'H'+$80,'R'+$80,$34,$68 	;20C0 C8 D2 34 68	SHR Op6  shift_right_memory?
	DB 'H'+$80,'L'+$80,$35,$68 	;20C4 C8 CC 35 68	SHL Op6  shift_left_memory?
	DB 'L'+$80,' '+$80,$06,$00	;20C8 CC A0 06 00	SL  Inherent
	DB 'F'+$80,' '+$80,$02,$00	;20CC C6 A0 02 00	SF  Inherent
	DB 'E'+$80,'P'+$80,$A6,$00	;20D0 C5 D0 A6 00	SEP  Inherent	set_even_parity?
	DB 'O'+$80,'P'+$80,$96,$00	;20D4 CF D0 96 00	SOP  Inherent	set_odd_parity?
	DB 'Y'+$80,'N'+$80,$0C,$00	;20D8 D9 CE 0C 00	SYN  Inherent
	DB 'C'+$80,'N'+$80,$30,$80	;20DC C3 CE 30 80	SCN Op8
	DB 'E'+$80,'T'+$80,$01,$01	;20E0 C5 D4 01 01	SET PseudoOp
	DB 0				;20E4 00	end of list

@20e5: ; starts with 'T'
	DB 'I'+$80,'T'+$80,$0C,$01	;20E5 C9 D4 0C 01	TIT PseudoOp	title?
	DB 0				;20E9 00	end of list

@20ea: ; starts with 'X'
	DB 'R'+$80,'C'+$80,$70,$84	;20EA D2 C3 70 84	XRC Op8  big_xor?
	DB 'A'+$80,'X'+$80,$5B,$02	;20EE C1 D8 5B 02	XAX Inherent,Byte
	DB 'A'+$80,'Y'+$80,$5C,$02	;20F2 C1 D9 5C 02	XAY Inherent,Byte
	DB 'A'+$80,'Z'+$80,$5E,$02	;20F6 C1 DA 5E 02	XAZ Inherent,Byte
	DB 'A'+$80,'B'+$80,$5D,$02	;20FA C1 C2 5D 02	XAB Inherent,Byte
	DB 'A'+$80,'S'+$80,$5F,$02	;20FE C1 D3 5F 02	XAS Inherent,Byte
	DB 'F'+$80,'R'+$80,$55,$22 	;2102 C6 D2 55 22	XFR RegReg,Byte
	DB 0				;2106 00	end of list

@2107: ; starts with 'Z'
	DB 'A'+$80,'D'+$80,$30,$74	;2107 C1 C4 30 74	ZAD Op7  big_move?
	DB 'S'+$80,'U'+$80,$40,$74	;210B D3 D5 40 74	ZSU Op7  big_move_negate?
	DB 0				;210F 00	end of list


L_2110: ; optimize: substitute certain opcodes with 1byte equivalents
	LDAB 3(YW)	;2110 85 68 03
	XFRB AH,AL	;2113 45 10
	LDAB 2(YW)	;2115 85 68 02
	STX (-SW)	;2118 6D A2
	LDX #@214f-1	;211A 60 21 4E ; fixupword
	LDB #$858f	;211D D0 85 8F
	ANDB BL,AH	;2120 42 03
	SUBB BL,BH	;2122 41 23
	BNZ @213a	;2124 15 14
	LDBB #0f	;2126 C0 0F
	NABB		;2128 4A
	BNZ @214c	;2129 15 21
	RL		;212B 07
	RRRB AL,1	;212C 26 10
	SRRB AL,4	;212E 24 13
	LDBB #8		;2130 C0 08
	AABB		;2132 48
	LDAB #$f0	;2133 80 F0
	ANDB AL,AH	;2135 42 01
	AABB		;2137 48
	JMP @2143	;2138 73 09

@213A:	INX		;213A 3E
	LDB (XW+)	;213B D5 41
	BZ @214c	;213D 14 0D
	SAB		;213F 59
	BNZ @213a	;2140 15 F8
	LDBB (XW)	;2142 CA
@2143:	LDA (YW+)	;2143 95 61
	LDAB (YW+)	;2145 85 61
	STBB (YW)	;2147 EB
	CLA		;2148 3A
	INA		;2149 38
	STA (-YW)	;214A B5 62
@214C:	LDX (SW+)	;214C 65 A1
	RSR		;214E 09

@214f: ; 1st 2 bytes are original instruction, 3rd byte is replacement instruction
	DB $30,$00,$38	;214F 30 00 38	INR A --> INA??
	DB $20,$10,$28	;2152 20 10 28	INRB AL --> INAB ??
	DB $31,$00,$39	;2155 31 00 39	DCR A --> DCA ??
	DB $21,$10,$29	;2158 21 10 29	DCRB AL --> DCAB ??
	DB $32,$00,$3A	;215B 32 00 3A	CLR A --> CLA ?? 
	DB $22,$10,$2A	;215E 22 10 2A	CLRB AL --> CLAB ??
	DB $33,$00,$3B	;2161 33 00 3B	IVR A --> IVA ??
	DB $23,$10,$2B	;2164 23 10 2B	IVRB AL --> IVAB ??
	DB $34,$00,$3C	;2167 34 00 3C	SRR A --> SRA ??
	DB $24,$10,$2C	;216A 24 10 2C	SRRB AL --> SRAB ??
	DB $35,$00,$3D	;216D 35 00 3D	SLR A --> SLA ??
	DB $25,$10,$2D	;2170 25 10 2D	SLRB AL --> SLAB ??
	DB $30,$40,$3E	;2173 30 40 3E	INR X --> INX ??
	DB $31,$40,$3F	;2176 31 40 3F	DCR X --> DCX ??
	DB $50,$02,$58	;2179 50 02 58	ADD B,A --> AAB ??
	DB $40,$13,$48	;217C 40 13 48	ADDB BL,AL --> AABB ??
	DB $51,$02,$59	;217F 51 02 59	SUB B,A --> SAB ??
	DB $41,$13,$49	;2182 41 13 49	SUBB BL,AL --> SABB ??
	DB $52,$02,$5A	;2185 52 02 5A	AND B,A --> NAB ??
	DB $42,$13,$4A	;2188 42 13 4A	ANDB BL,AL --> NABB ??
	DB $55,$04,$5B	;218B 55 04 5B	XFR X,A --> XAX ??
	DB $45,$15,$4B	;218E 45 15 4B	XFRB XL,AL --> XAXB ??
	DB $55,$06,$5C	;2191 55 06 5C	XFR Y,A --> XAY ??
	DB $45,$17,$4C	;2194 45 17 4C	XFRB YL,AL --> XAYB ??
	DB $55,$02,$5D	;2197 55 02 5D	XFR B,A --> XAB ??
	DB $45,$13,$4D	;219A 45 13 4D	XFRB BL,AL --> XABB ??
	DB $55,$08,$5E	;219D 55 08 5E	XFR Z,A --> XAZ ??
	DB $45,$19,$4E	;21A0 45 19 4E	XFRB ZL,AL --> XAZB ??
	DB $55,$0A,$5F	;21A3 55 0A 5F	XFR S,A --> XAS ??
	DB $45,$1B,$4F	;21A6 45 1B 4F	XFRB SL,AL --> XASB ??
	DB 0,0,0	;21A9 00 00 00	end of list

L_21ac:	DS 16	; parameter accumulator

L_21bd: ?? print line string
	DS 2		; length
	DS ???		; chars
L_21d4: ???  error column in print string
L_21e6: ???
L_2202:	???

L_2244: ??

L_2343: ; top of expression evaluation stack

E_2344: ; uppercase a string
	LDA (XW+)	;2344 95 41	get inline parm (string ptr)
	STX (-SW)	;2346 6D A2	save X
	XFR XW,YW	;2348 55 64	save Y
	STX (-SW)	;234A 6D A2
	LDX (AW+)	;234C 65 01	get string length
	XAY		;234E 5C	Y = 1st char of string
@234F:	DCX		;234F 3F	more chars to do?
	BM @2365	;2350 16 13
	LDAB (YW)	;2352 8B	get char
	LDBB #$fa	;2353 C0 FA	is it lowercase?
	SABB		;2355 49
	BGZ @2361	;2356 18 09
	LDBB #$e1	;2358 C0 E1
	SABB		;235A 49
	BM @2361	;235B 16 04
	LDAB #$c1	;235D 80 C1	  cvt to uppercase
	ADDB AL,BL	;235F 40 31
@2361:	STAB (YW+)	;2361 A5 61	store char back
	JMP @234f	;2363 73 EA	next

@2365:	LDA (SW+)	;2365 95 A1	restore Y
	XAY		;2367 5C
	LDX (SW+)	;2368 65 A1	restore X
	RSR		;236A 09	return

	DB 0B	;236B 0B

	DW L_2400	;236C 24 00 ; fixupword
	DW L_2452	;236E 24 52 ; fixupword
	DW 0		;2370 00 00
	DW L_2382	;2372 23 82 ; fixupword
	DW 0		;2374 00 00
	DW 0		;2376 00 00
	DW 0		;2378 00 00
	DW 0		;237A 00 00
	DW 0		;237C 00 00
	DW 0		;237E 00 00
	DW L_24D5	;2380 24 D5 ; fixupword

E_2382:	STX (-SW)	;2382 6D A2
	JSR E_23b1	;2384 7B 2B
	DB 2		;2386 02
	BZ @23af	;2387 14 26
	CLA		;2389 3A
	STA $12(ZW)	;238A B5 88 12
	STA $16(ZW)	;238D B5 88 16
	STB $14(ZW)	;2390 F5 88 14
	STB $18(ZW)	;2393 F5 88 18
	JSR E_23b1	;2396 7B 19
	DB 5		;2398 05
	LDBB #$0f	;2399 C0 0F
	ANDB BL,BH	;239B 42 23
	LDAB $d(ZW)	;239D 85 88 0D
	BM @23a8	;23A0 16 06
	SABB		;23A2 49
	BZ @23a8	;23A3 14 03
	SVC $09		;23A5 66 09			abort
	DB $12		;23A7 12			   abort code
@23a8:	LDA 6(ZW)	;23a8 95 88 06
	BZ @23af	;23AB 14 02
	JSR E_23c8	;23AD 7B 19
@23af:	JMP L_2426	;23AF 73 75

E_23B1:
	LDAB (XW+)	;23B1 85 41		get inline parm
	STAB @23bb	;23B3 A3 06
	XFR BW,ZW	;23B5 55 82
	SVC $52		;23B7 66 52
	DB 1		;23B9 01
	DB 2		;23BA 02
@23bb:	DB 0		;23BB 00
	DW @23C2+1	;23BC 23 C3 ; fixupword	^ status
	XFR BW,BW	;23BE 55 22
	BZ @23c7	;23C0 14 05
@23c2:	LDB #0		;23C2 D0 00 00
	XFR AW,AW	;23C5 55 00
@23C7:	RSR		;23C7 09

E_23C8:	JSR E_23b1	;23C8 7B E7
	DB 2		;23CA 02
	LDA $16(ZW)	;23CB 95 88 16
	SUB AW,BW	;23CE 51 20
	BL @23d6	;23D0 10 04
	LDAB #1		;23D2 80 01
	JMP @23ea	;23D4 73 14

@23D6:	LDA $16(ZW)	;23D6 95 88 16
	STA $12(ZW)	;23D9 B5 88 12
	STA 8(ZW)	;23DC B5 88 08
	JSR E_23f4	;23DF 7B 13
	DB 1		;23E1 01			file #1?
	LDB $12(ZW)	;23E2 D5 88 12
	INR BW,1	;23E5 30 20
	STB $16(ZW)	;23E7 F5 88 16
@23EA:	STAB (ZW)	;23EA AC
	RSR		;23EB 09

E_23EC: ; wait for ???
	LDAB (ZW)	;23EC 8C
	BP @23f3	;23ED 17 04
	SVC $07		;23EF 66 07				yield
	JMP E_23ec	;23F1 73 F9

@23F3:	RSR		;23F3 09

E_23F4: ; do file operation?
	XFR BW,ZW	;23F4 55 82		B=FCB ptr?
	LDAB (XW+)	;23F6 85 41		get inline file function?
	STAB 3(ZW)	;23F8 A5 88 03		  set into FCB?
	SVC $00		;23FB 66 00
	JSR E_23ec	;23FD 7B ED		wait for completion?
	RSR		;23FF 09

E_2400:	STX (-SW)	;2400 6D A2
L_2402:	LDA 6(ZW)	;2402 95 88 06
E_2405:	INR AW,2	;2405 30 01
	LDB $18(ZW)	;2407 D5 88 18
	STB $14(ZW)	;240A F5 88 14
	ADD AW,BW	;240D 50 20
	XAY		;240F 5C
	LDA (YW)	;2410 9B
	LDBB #$84	;2411 C0 84
	LDAB #1		;2413 80 01
	SUBB BL,AH	;2415 41 03
	BZ 2425	;2417 14 0C
	DCRB AH,1	;2419 21 00
	BNF 242a	;241B 13 0D
	JSR 23c8	;241D 7B A9
	CLA		;241F 3A
	STA 18(ZW)	;2420 B5 88 18
	JMP 2402	;2423 73 DD

L_2425:	STAB (ZW)	;2425 AC
L_2426:	LDB (SW+)	;2426 D5 A1
	SVC $68		;2428 66 68
L_242A:	LDA (YW)	;242A 9B
	CLRB AH,0	;242B 22 00
	LDB #0005	;242D D0 00 05
	ADD AW,BW	;2430 50 20
	LDB 18(ZW)	;2432 D5 88 18
	AAB		;2435 58
	STB 18(ZW)	;2436 F5 88 18
	LDB 10(ZW)	;2439 D5 88 10
	XAX		;243C 5B
	CLA		;243D 3A
@243E:	DCX		;243E 3F
	BLE @2449	;243F 19 08
	LDAB (YW+)	;2441 85 61
	STAB (BW+)	;2443 A5 21
	ADDB AH,AL	;2445 40 10
	JMP @243e	;2447 73 F5

@2449:	LDAB (YW)	;2449 8B
	ADDB AL,AH	;244A 40 01
	BZ 2425	;244C 14 D7
	LDAB #04	;244E 80 04
	JMP 2425	;2450 73 D3

E_2452:	STX (-SW)	;2452 6D A2
@2454:	LDA $06(ZW)	;2454 95 88 06
	INR AW,2	;2457 30 01
	XAY		;2459 5C
	LDA $18(ZW)	;245A 95 88 18
	STA $14(ZW)	;245D B5 88 14
	ADD YW,AW	;2460 50 06
	LDX $10(ZW)	;2462 65 88 10
	LDB (XW)	;2465 DA
	LDBB #$84	;2466 C0 84
	SUBB BH,BL	;2468 41 32
	BNZ @246f	;246A 15 03
	STBB (YW)	;246C EB
	JMP @24a0	;246D 73 31

@246F:	LDB (XW)	;246F DA
	CLRB BH,0	;2470 22 20
	AAB		;2472 58
	LDA #5		;2473 90 00 05
	AAB		;2476 58
	STB 18(ZW)	;2477 F5 88 18
	LDA #$018a	;247A 90 01 8A
	SAB		;247D 59
	BP @2486	;247E 17 06
	JSR E_24b2	;2480 7B 30
	BZ @2454	;2482 14 D0
	JMP 2425	;2484 73 9F

@2486:	LDA (XW+)	;2486 95 41
	XAB		;2488 5D
	CLRB AH,0	;2489 22 00
	STB (YW+)	;248B F5 61
	ADDB BH,BL	;248D 40 32
	INA		;248F 38
@2490:	LDBB (XW+)	;2490 C5 41
	STBB (YW+)	;2492 E5 61
	ADDB BH,BL	;2494 40 32
	DCA		;2496 39
	BP @2490	;2497 17 F7
	LDBB #$80	;2499 C0 80
	IVRB BH,0	;249B 23 20
	INRB BH,1	;249D 20 20
	STB (YW)	;249F FB
@24A0:	CLAB		;24A0 2A
	JMP L_2425	;24A1 73 82

E_24A3:	CLA		;24A3 3A
	STA $18(ZW)	;24A4 B5 88 18
	LDA $12(ZW)	;24A7 95 88 12
	STA $08(ZW)	;24AA B5 88 08
	JSR E_23f4	;24AD 79 23 F4 ; fixupword
	DB 2		;24B0 02			file #2?
	RSR		;24B1 09

E_24B2:	JSR E_24a3	;24B2 7B EF
	BNZ @24d1	;24B4 15 1B
	JSR E_23b1	;24B6 79 23 B1 ; fixupword
	DB 2		;24B9 02
	LDA $16(ZW)	;24BA 95 88 16
	STA $12(ZW)	;24BD B5 88 12
	INA		;24C0 38
	STA $16(ZW)	;24C1 B5 88 16
	DCA		;24C4 39
	SUB AW,BW	;24C5 51 20
	BL @24d0	;24C7 10 07
	XFR BW,ZW	;24C9 55 82
	SVC $19		;24CB 66 19
	XAB		;24CD 5D
	BNZ @24d2	;24CE 15 02
@24D0:	CLA		;24D0 3A
@24D1:	RSR		;24D1 09

@24D2:	LDAB #02	;24D2 80 02
	RSR		;24D4 09

	DB 6D ;m	;24D5 6D
	DB A2 ;"	;24D6 A2
	DB 7B ;{	;24D7 7B
	DB CA ;J	;24D8 CA
	DB 73 ;s	;24D9 73
	DB C6 ;F	;24DA C6

E_24DB: ; compare 2 strings, 2 inline params
	LDB (XW+)	;24DB D5 41	get 1st string ptr
	LDA (BW+)	;24DD 95 21	get 1st string length
	STB @24ff	;24DF F3 1E	save 1st string 1st char ptr
	XFRB AH,AL	;24E1 45 10
	LDB (XW+)	;24E3 D5 41	get 2nd string ptr
	LDAB (BW+)	;24E5 85 21	get 2nd string length hi
	LDAB (BW+)	;24E7 85 21	get 2nd string length lo
	STB @2501	;24E9 F3 16	save 2nd string 1st char ptr
	XAB		;24EB 5D	choose shorter length to compare
	STA (-SW)	;24EC B5 A2
	SUBB AL,AH	;24EE 41 01
	BM @24f4	;24F0 16 02
	XFRB AH,BL	;24F2 45 30
@24F4:	XFRB AL,AH	;24F4 45 01
	CLRB AH,0	;24F6 22 00
	STA @24fd	;24F8 B3 03
	JSR E_2511	;24FA 79 25 11 ; fixupword  memcmp
@24fd:	DW 0		;24FD 00 00	length
@24ff:	DW 0		;24FF 00 00	addr1
@2501:	DW 0		;2501 00 00	addr2
	XFRB BL,BL	;2503 45 33
	BNZ @250c	;2505 15 05
	LDB (SW+)	;2507 D5 A1
	SUBB BL,BH	;2509 41 23
	RSR		;250B 09

@250C:	LDA (SW+)	;250C 95 A1
	XFRB BL,BL	;250E 45 33
	RSR		;2510 09

E_2511: ; memcmp: compare byte arrays, inline params
	STK YH,2	;2511 7E 61
	LDA (XW+)	;2513 95 41	A=1st word (length?)
	LDB (XW+)	;2515 D5 41	Y=2nd word (addr1?)
	XFR YW,BW	;2517 55 26
	LDB (XW+)	;2519 D5 41	B=3rd word (addr2?)
	DCA		;251B 39	length is =1
	CPF A,(Y),(B)	;251C 67 8A 62	ssss=8 mm=2 nn=2 m=rY n=rB
	BZ @2528	;251F 14 07
	BP @252d	;2521 17 0A
	POP YH,2	;2523 7F 61
	LDBB #1		;2525 C0 01	return positive
	RSR		;2527 09

@2528:	POP YH,2	;2528 7F 61
	CLRB BL,0	;252A 22 30	return zero
	RSR		;252C 09

@252D:	POP YH,2	;252D 7F 61
	LDBB #$ff	;252F C0 FF	return negative
	RSR		;2531 09

E_2532: ; insert chars; A=dest length, B=src length,  inline1=dest ptr, inline2=src ptr
	STK YH,2	;2532 7E 61		save Y
	XFR YW,0(XW)?	;2534 55 57 00 00	get inline ptr
	INR XW,2	;2538 30 41
	DCA		;253A 39
	BP @2541	;253B 17 04
	INR XW,2	;253D 30 41
	JMP @2554	;253F 73 13

@2541:	FIL (A),$a0,(Y)	;2541 67 9E A0 06	fill with spaces
	INA		;2545 38
	SAB		;2546 59
	BLE @254c	;2547 19 03
	SAB		;2549 59
	XFR AW,BW	;254A 55 20
@254C:	LDB (XW+)	;254C D5 41
	DCA		;254E 39
	BM @2554	;254F 16 03
	MVF (A),(B),(Y)	;2551 67 4A 26	ssss=4 mm=2 nn=2
@2554:	POP YH,2	;2554 7F 61
	RSR		;2556 09

E_2557: ; trim trailing spaces off a string
	LDA (XW+)	;2557 95 41	get inline string ptr
	STX (-SW)	;2559 6D A2	save X
	STA (-SW)	;255B B5 A2	save parm
	LDX (AW+)	;255D 65 01	get length
	BLE @256f	;255F 19 0E
	ADD AW,XW	;2561 50 40
	LDB #$a0a0	;2563 D0 A0 A0	BH=space
@2566:	LDBB (-AW)	;2566 C5 02	get prev char
	SUBB BL,BH	;2568 41 23	= space ?
	BNZ @256f	;256A 15 03
	DCX		;256C 3F	decrement length
	BGZ @2566	;256D 18 F7
@256F:	LDA (SW+)	;256F 95 A1	get string ptr again
	STX (AW)	;2571 6D 00	save modified length
	LDX (SW+)	;2573 65 A1	restore X
	RSR		;2575 09	return

L_2576:	JMP L_289c	;2576 71 28 9C ; fixupword

L_289C: ; main entry jmp to jmp to here
	XFR SW,SW,#L_02c8 ;289C 55 BA 02 C8 ; fixupword  init return stack ptr
	SVC $5c		;28A0 66 5C		file??? device 2?  console?
	DB 0		;28A2 00
	DB 2		;28A3 02		   device
	DB $c		;28A4 0C
	DW L_0a4c	;28a5 0A 4C ; fixupword	   ^ status
	JSR E_293f	;28A7 79 29 3F ; fixupword	write "ASSM - 6.05" to console
	DW L_29BF	;28AA 29 BF ; fixupword
	SVC $5c		;28AC 66 5C		file??? device 1?
	DB 0		;28AE 00
	DB 1		;28AF 01		   device
	DB $12		;28B0 12
	DW @28d5+1	;28b1 28 D6 ; fixupword	   ^ status
	SVC $5c		;28B3 66 5C		file ??? device 1???
	DB 0		;28B5 00
	DB 1		;28B6 01		   device
	DB $15		;28B7 15
@28b8:	DW @28b8	;28b8 28 B8 ; fixupword	   ^ status
	LDAB @28b8	;28BA 83 FC		get status???
	SRAB		;28BC 2C
	BL @28c4	;28BD 10 05
	LDBB #$80	;28BF C0 80
	STBB L_29b5+1	;28C1 E1 29 B6 ; fixupword
@28C4:	SRAB		;28C4 2C
	BNL @28f7	;28C5 11 30
	LDA #L_29d7	;28C7 90 29 D7 ; fixupword	string "ENTER TITLE"
	STA L_29bf+6	;28CA B1 29 C5 ; fixupword
	JSR E_293f	;28CD 7B 70		write string to console
	DW L_29BF	;28CF 29 BF ; fixupword
	JSR E_293f	;28D1 7B 6C		get string from console???
	DW L_29B5	;28D3 29 B5 ; fixupword
@28d5:	LDAB #0		;28D5 80 00		modified with svc $5c status
	LDBB #$20	;28D7 C0 20
	NABB		;28D9 4A
	BNZ @28e1	;28DA 15 05
	LDA #L_04b1	;28DC 90 04 B1 ; fixupword	modify page header title ptr
	STA @28f3	;28DF B3 12
@28E1:			;		update page header line length
	LDA #L_0484	;28E1 90 04 84 ; fixupword
	LDB @28f3	;28E4 D3 0D
	SUB AW,BW	;28E6 51 20
	LDB L_29e5+0	;28E8 D1 29 E5 ; fixupword	src length
	ADD AW,BW	;28EB 50 20
	STA L_0482	;28ED B1 04 82 ; fixupword
	JSR E_2532	;28F0 79 25 32 ; fixupword	insert chars
@28f3:	DW L_04BC	;28F3 04 BC ; fixupword		  dest ptr
	DW L_29E5+2	;28F5 29 E7 ; fixupword		  src ptr
@28F7:	LDA #L_049c	;28F7 90 04 9C ; fixupword	middle of page header line
	LDB L_29cb	;28FA D1 29 CB ; fixupword	insert "ASSM"
	STB (AW+)	;28FD F5 01
	LDB L_29cd	;28FF D1 29 CD ; fixupword
	STB (AW+)	;2902 F5 01
	LDBB #$a0	;2904 C0 A0			insert space
	STBB (AW+)	;2906 E5 01
	LDB L_29d2	;2908 D1 29 D2 ; fixupword	insert "6.05"
	STB (AW+)	;290B F5 01
	LDB L_29d4	;290D D1 29 D4 ; fixupword
	STB (AW+)	;2910 F5 01
	INR AW,2	;2912 30 01			skip 2
	STA @291b	;2914 B3 05			save ptr
	SVC $0b		;2916 66 0B			get ???
	SVC $05		;2918 66 05			insert???
	DB 4		;291A 04
@291b:	DW 0		;291B 00 00
	LDA @291b	;291D 93 FC			get pointer back
	LDB #8		;291F D0 00 08			skip 8
	ADD AW,BW	;2922 50 20
	LDB #$a0a0	;2924 D0 A0 A0			insert spaces
	STB (AW+)	;2927 F5 01
	STA @2934	;2929 B3 09			save ptr
	LDAB @28d5+1	;292B 83 A9			get svc %5c status
	LDBB #$20	;292D C0 20
	NABB		;292F 4A
	BZ L_294b		;2930 14 19
	SVC $1c		;2932 66 1C			getclock?
@2934:	DW 0		;2934 00 00
	LDA @2934	;2936 93 FC			get ptr back
	LDBB #$a0	;2938 C0 A0			insert space
	STBB 8(AW)	;293A E5 08 08
	JMP L_2951	;293D 73 12

E_293F:	LDB (XW)	;293F DA		get inline fcb ptr
	SVC $10		;2940 66 10		DoFileOp
@2942:	SVC $07		;2942 66 07		Yield
	LDB (XW)	;2944 DA		get inline fcb ptr again
	LDAB (BW)	;2945 89		get file status
	BM @2942	;2946 16 FA
	LDB (XW+)	;2948 D5 41		skip inline fcb ptr
	RSR		;294A 09

L_294B:	LDA #L_04b1	;294B 90 04 B1 ; fixupword	ptr into page header line
	STA L_0d0c	;294E B1 0D 0C ; fixupword
L_2951:	LDA #L_2576	;2951 90 25 76 ; fixupword	get filename???
	XAY		;2954 5C
	LDB #L_0306	;2955 D0 03 06 ; fixupword
	SVC $52		;2958 66 52
	DB 1		;295A 01
	DB 0		;295B 00
	DB 0		;295C 00
	DW 0		;295D 00 00
	XFR BW,BW	;295F 55 22
	BZ @2975	;2961 14 12
	LDA #L_2576	;2963 90 25 76 ; fixupword
	STA L_030c	;2966 B1 03 0C ; fixupword
	ADD YW,YW,#$193 ;2969 50 76 01 93
	LDA #1		;296D 90 00 01
	STA L_0310	;2970 B1 03 10 ; fixupword
	JMP @297a	;2973 73 05

@2975:	LDA #L_2576	;2975 90 25 76 ; fixupword
	STA @2988+1	;2978 B3 0F
@297A:	LDB #L_0324	;297A D0 03 24 ; fixupword
	SVC $5c		;297D 66 5C			file??? device 1?
	DB 1		;297F 01
	DB 1		;2980 01
	DB 1		;2981 01
@2982:	DW @2982	;2982 29 82 ; fixupword		   status ptr?
	LDBB @2982	;2984 C3 FC
	BZ @2997	;2986 14 0F
@2988:	LDA #L_2709	;2988 90 27 09 ; fixupword
	STA L_0324+6	;298B B1 03 2A ; fixupword
	ADD YW,YW,#$193	;298E 50 76 01 93
	LDB #L_0324	;2992 D0 03 24 ; fixupword
	SVC $18		;2995 66 18
@2997:	LDB #L_02ca	;2997 D0 02 CA ; fixupword
	SVC $18		;299A 66 18
	SVC $05		;299C 66 05
	DB $c		;299E 0C
	DW L_02CA	;299F 02 CA ; fixupword
	STA L_1cb7	;29A1 B1 1C B7 ; fixupword
	LDB #L_02e8	;29A4 D0 02 E8 ; fixupword
	SVC $18		;29A7 66 18
	LDB #L_0306	;29A9 D0 03 06 ; fixupword
	SVC $18		;29AC 66 18
	STR?? YW,L_0A4A	;29AE D6 67 0A 4A ; fixupword
	JMP L_0a43	;29B2 71 0A 43 ; fixupword

L_29b5: ; short file control block?
	DB 0		;29B5 00	status
	DB $81		;29B6 81	option flags?
	DB 0		;29B7 00
	DB 1		;29B8 01	device
	DB 0		;29B9 00	function?
	DB $57		;29BA 57
	DW L_29E5	;29BB 29 E5 ; fixupword  I/O buffer ptr?
	DB 0		;29BD 00
	DB 0		;29BE 00

L_29bf: ; short file control block? for console?
	DB 0		;29BF 00	statuc
	DB $82		;29C0 82
	DB 0		;29C1 00
	DB 2		;29C2 02	device
	DB 0		;29C3 00	function?
	DB 80		;29C4 50
	DW L_29C9	;29C5 29 C9 ; fixupword	  ^ string to write
	DB 0		;29C7 00
	DB 0		;29C8 00

L_29c9: ; string: version
	DW 12		;29C9 00 0C
	DB C1 ;A	;29CB C1
	DB D3 ;S	;29CC D3
	DB D3 ;S	;29CD D3
	DB CD ;M	;29CE CD
	DB A0 ; 	;29CF A0
	DB AD ;-	;29D0 AD
	DB A0 ; 	;29D1 A0
	DB B6 ;6	;29D2 B6
	DB AE ;.	;29D3 AE
	DB B0 ;0	;29D4 B0
	DB B5 ;5	;29D5 B5
	DB 8D		;29D6 8D

L_29D7: ; string: prompt
	DW 12		;29D7 00 0C
	DB C5 ;E	;29D9 C5
	DB CE ;N	;29DA CE
	DB D4 ;T	;29DB D4
	DB C5 ;E	;29DC C5
	DB D2 ;R	;29DD D2
	DB A0 ; 	;29DE A0
	DB D4 ;T	;29DF D4
	DB C9 ;I	;29E0 C9
	DB D4 ;T	;29E1 D4
	DB CC ;L	;29E2 CC
	DB C5 ;E	;29E3 C5
	DB 8D		;29E4 8D

L_29e5: ; title string buffer
	DW 0		;29E5 00 00	length
	DS ???				chars
