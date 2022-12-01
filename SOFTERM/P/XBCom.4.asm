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
L_02c8: ; end of return stack

L_030e: ; file control block?  BASIC source file
	DB 00	;030E 00	status
	DB 00	;030F 00
	DB 01	;0310 01
	DB 09	;0311 09	function?
	DB 01	;0312 01
	DB 90	;0313 90
	DW L_04B1	;0314 04 B1  fixupword	buffer???
	DB 00	;0316 00
	DB 00	;0317 00
	DB 00	;0318 00
	DB 01	;0319 01
	DB 02	;031A 02
	DB 02	;031B 02
	DB 00	;031C 00
	DB 84	;031D 84
	DW L_07D7	;031E 07 D7  fixupword
	DB 00	;0320 00
	DB 00	;0321 00
	DB 00	;0322 00
	DB 00	;0323 00
	DB 00	;0324 00
	DB 00	;0325 00
	DB 00	;0326 00
	DB 00	;0327 00
	DB 00	;0328 00
	DB 00	;0329 00
	DB 00	;032A 00
	DB 84	;032B 84

L_032C: ; short file control block?  object output file
	DB 00	;032C 00	status
	DB 01	;032D 01
	DB 02	;032E 02
	DB 09	;032F 09	function?
	DB 01	;0330 01
	DB 90	;0331 90
	DW L_0644	;0332 06 44  fixupword	buffer???
	DB 00	;0334 00
	DB 00	;0335 00
	DW L_1EB8	;0336 1E B8  fixupword
	DB 02	;0338 02
	DB 04	;0339 04
	DB 00	;033A 00
	DB 84	;033B 84
	DB 00	;033C 00
	DB 00	;033D 00
	DB 00	;033E 00
	DB 00	;033F 00
	DB 00	;0340 00
	DB 00	;0341 00
	DB 00	;0342 00
	DB 00	;0343 00
	DB 00	;0344 00
	DB 00	;0345 00
	DB 00	;0346 00
	DB 00	;0347 00
	DB 00	;0348 00
	DB 84	;0349 84

L_034a: ; short file control block?
	DB 00	;034A 00	status
	DB 02	;034B 02
	DB 02	;034C 02
	DB 09	;034D 09	function?
	DB 01	;034E 01
	DB 90	;034F 90
	DW 0	;0350 00 00	block buffer?
	DB 00	;0352 00
	DB 00	;0353 00
	DB 00	;0354 00
	DB 00	;0355 00
	DB 01	;0356 01
	DB 02	;0357 02
	DB 00	;0358 00
	DB 84	;0359 84
L_035a:	DW 0	;035A 00 00
	DB 00	;035C 00
	DB 00	;035D 00
	DB 00	;035E 00
	DB 00	;035F 00
	DB 00	;0360 00
	DB 00	;0361 00
	DB 00	;0362 00
	DB 00	;0363 00
	DB 00	;0364 00
	DB 00	;0365 00
	DB 00	;0366 00
	DB 84	;0367 84

E_0368: ; finish up & exit
	JSR L_03b5	;0368 7B 4B
	DW L_0448+2	;036A 04 4A  fixupword
	JSR L_038c	;036C 7B 1E		do file operation
	DB $B		;036E 0B		  close?
	DW L_032C	;036F 03 2C  fixupword	  object file fcb?
	LDA #L_0448	;0371 90 04 48 fixupWord
	JSR L_03d0	;0374 7B 5A	; write a string (ptr in A)
	JSR L_038c	;0376 7B 14		do file operation
	DB $b		;0378 0B		  close?
	DW L_034A	;0379 03 4A  fixupword
	LDA L_044d	;037B 91 04 4D fixupWord	get current # errors
	BZ @0382	;037E 14 02			pick a return status
	LDAB #1		;0380 80 01
@0382:	STAB @038b	;0382 A3 07
	JSR L_1e48	;0384 79 1E 48 fixupWord
	DW L_04A5	;0387 04 A5  fixupword
	SVC $0a		;0389 66 0A			exit with return code
@038b:	DB 0		;038B 00


E_038C: ; do file operation
	LDAB (XW+)	;038C 85 41	get inline function?
	LDB (XW)	;038E DA	get inline fcb ptr
	STAB 3(BW)	;038F A5 28 03	store function
	SVC $18		;0392 66 18	file operation
	LDB (XW+)	;0394 D5 41	get inline fcb ptr
	LDAB (BW)	;0396 89	get status
	RSR		;0397 09	return

L_0398:	JSR L_038c	;0398 7B F2	do file operation
	DB 1		;039A 01
	DW L_030E	;039B 03 0E  fixupword	BASIC source fcb
	BZ L_03a6	;039D 14 07
	CVX 65,#?	;039F 47 40 0B 04 99 07 fixupWord
	SAR??	;03A5 D7
L_03A6:	JSR L_1e21	;03A6 79 1E 21 fixupWord
	DW L_07D7	;03A9 07 D7  fixupword
	JSR L_03c6	;03AB 7B 19
	DW L_07D7	;03AD 07 D7  fixupword
	LDA #L_07d9	;03AF 90 07 D9 fixupWord
	STA (XW+)	;03B2 B5 41
L_03B4:	RSR		;03B4 09


E_03B5: ;
	LDA (XW+)	;03B5 95 41		get inline info ptr
	STA L_032c+$10	;03B7 B1 03 3C fixupWord
	JSR L_038c	;03BA 7B D0		do file operation
	DB 2		;03BC 02
	DW L_032C	;03BD 03 2C  fixupword	  object output fcb
	BZ L_03b4	;03BF 14 F3		if ok, return

L_03C1:	SVC $09		;03C1 66 09		abort
	DB $34		;03c3 34 		  abort code


L_03C4:	JSR L_0408	;03C4 7B 42	start new page

E_03C6:	LDA L_044b	;03C6 91 04 4B fixupWord	decrement remaining lines on page
	DCA		;03C9 39
	STA L_044b	;03CA B3 7F
	BLE L_03c4	;03CC 19 F6
	LDA (XW+)	;03CE 95 41	get inline string ptr
E_03D0: ; write a string (ptr in A)
	STA @03d5	;03D0 B3 03
	JSR E_2028	;03D2 79 20 28 fixupWord	string: remove trailing spaces
@03d5:	DW 0		;03D5 00 00
	LDB @03d5	;03D7 D3 FC
E_03D9: ; write a string (ptr in B)
	STB L_035a	;03D9 F1 03 5A fixupWord	save string ptr
	LDA (BW)	;03DC 99			get length
	BLE @0402	;03DD 19 23
	STA (-SW)	;03DF B5 A2			save length
	STB (-SW)	;03E1 F5 A2			save ptr
	INA		;03E3 38			append a CR, saving old contents
	STA (BW+)	;03E4 B5 21
	AAB		;03E6 58
	LDAB (-BW)	;03E7 85 22
	STAB (-SW)	;03E9 A5 A2
	STB (-SW)	;03EB F5 A2
	LDAB #$8d	;03ED 80 8D
	STAB (BW)	;03EF A9
	JSR L_038c	;03F0 79 03 8C fixupWord	do file operation
	DB 2		;03F3 02			  write?
	DW L_034A	;03F4 03 4A  fixupword
	BNZ L_03c1	;03F6 15 C9			if error, abort
	LDB (SW+)	;03F8 D5 A1			restore the line buffer
	LDAB (SW+)	;03FA 85 A1
	STAB (BW)	;03FC A9
	LDB (SW+)	;03FD D5 A1
	LDA (SW+)	;03FF 95 A1
	STA (BW)	;0401 B9
@0402:	RSR		;0402 09


E_0403: ; write new line
	LDB #L_0442	;0403 D0 04 42 fixupWord	space string
	JMP L_03d9	;0406 73 D1


E_0408: ; start new listing page
	LDA #L_0445	;0408 90 04 45 fixupWord	write form feed
	JSR L_03d0	;040B 7B C3	; write a string (ptr in A)
	JSR L_0403	;040D 7B F4	write new line
	JSR L_0403	;040F 7B F2	write new line
	JSR L_0403	;0411 7B F0	write new line
	JSR L_0403	;0413 7B EE	write new line
	JSR L_0403	;0415 7B EC	write new line
	JSR L_0403	;0417 7B EA	write new line
	STX (-SW)	;0419 6D A2	save X
	LDA #L_a0a0	;041B 90 A0 A0
	STA L_0463	;041E B3 43
	STA L_0470	;0420 B3 4E
	LDA L_044f	;0422 93 2B	increment page #
	INA		;0424 38
	STA L_044f	;0425 B3 28
	JSR L_0453	;0427 7B 2A	insert word as text (inline ptr)
	DW L_0465	;0429 04 65  fixupword
	LDA L_044d	;042B 93 20	get # errors
	JSR E_0453	;042D 7B 24	insert word as text (inline ptr)
	DW L_0472	;042f 04 72 fixupWord
	LDA #L_045c	;0431 90 04 5C fixupWord
	JSR L_03d0	;0434 7B 9A	write a string (ptr in A)
	JSR L_0403	;0436 7B CB	write new line
	JSR L_0403	;0438 7B C9	write new line
	LDA #46		;043A 90 00 2E	init remaining lines on page
	STA L_044b	;043D B3 0C
	LDX (SW+)	;043F 65 A1	restore X
	RSR		;0441 09

L_0442: ; string
	DW 1		;0442 00 01	length
	DB A0 ; 	;0444 A0	space char

L_0445: ; string
	DW 1		;0445 00 01	length
	DB 8C		;0447 8C	form feed char

L_0448: ; string
	DW 1		;0448 00 01
	DB $84		;044A 84

L_044b:	DW 0	;044B 00 00	remaining lines on page?
L_044d:	DW 0	;044D 00 00	current # errors
L_044f:	DW 0	;044F 00 00	current page #
	DB 95	;0451 95
	DB 41 ;A	;0452 41


E_0453: ; insert word as text (inline ptr)
	LDB (XW+)	;0453 D5 41	get inline output ptr
	STB @0459	;0455 F3 02
	SVC $2e		;0457 66 2E	do the insert
@0459:	DW 0		;0459 00 00
	RSR		;045B 09	return


L_045c: ; string; page header line
	DW $3b		;045C 00 3B	length
	DB D0 ;P	;045E D0	chars
	DB C1 ;A	;045F C1
	DB C7 ;G	;0460 C7
	DB C5 ;E	;0461 C5
	DB A0 ; 	;0462 A0
	DB A0 ; 	;0463 A0
	DB A0 ; 	;0464 A0
	DB A0 ; 	;0465 A0
	DB A0 ; 	;0466 A0
	DB A0 ; 	;0467 A0
	DB A0 ; 	;0468 A0
	DB C5 ;E	;0469 C5
	DB D2 ;R	;046A D2
	DB D2 ;R	;046B D2
	DB CF ;O	;046C CF
	DB D2 ;R	;046D D2
	DB D3 ;S	;046E D3
	DB A0 ; 	;046F A0
	DB A0 ; 	;0470 A0
	DB A0 ; 	;0471 A0
	DB A0 ; 	;0472 A0
	DB A0 ; 	;0473 A0
	DB A0 ; 	;0474 A0
	DB A0 ; 	;0475 A0
	DB A0 ; 	;0476 A0
	DB C2 ;B	;0477 C2
	DB C1 ;A	;0478 C1
	DB D3 ;S	;0479 D3
	DB C9 ;I	;047A C9
	DB C3 ;C	;047B C3
	DB A0 ; 	;047C A0
	DB D8 ;X	;047D D8
	DB D8 ;X	;047E D8
	DB D8 ;X	;047F D8
	DB D8 ;X	;0480 D8
	DB A0 ; 	;0481 A0
	DB A0 ; 	;0482 A0
L_0483:	DB D8 ;X	;0483 D8
	DB D8 ;X	;0484 D8
	DB AF ;/	;0485 AF
	DB D8 ;X	;0486 D8
	DB D8 ;X	;0487 D8
	DB AF ;/	;0488 AF
	DB D8 ;X	;0489 D8
	DB D8 ;X	;048A D8
	DB A0 ; 	;048B A0
	DB A0 ; 	;048C A0
	DB A8 ;(	;048D A8

L_048E:	DB C6 ;F	;048E C6
	DB C6 ;F	;048F C6
	DB C6 ;F	;0490 C6
	DB C6 ;F	;0491 C6
	DB C6 ;F	;0492 C6
	DB C6 ;F	;0493 C6
	DB C6 ;F	;0494 C6
	DB C6 ;F	;0495 C6
	DB C6 ;F	;0496 C6
	DB C6 ;F	;0497 C6
	DB A9 ;)	;0498 A9

L_0499: ; string
	DW 9		;0499 00 09	length
	DB B3 ;3	;049B B3	chars
	DB B2 ;2	;049C B2
	DB B7 ;7	;049D B7
	DB B6 ;6	;049E B6
	DB B7 ;7	;049F B7
	DB A0 ; 	;04A0 A0
	DB C5 ;E	;04A1 C5
	DB CE ;N	;04A2 CE
	DB C4 ;D	;04A3 C4

	DB 00	;04A4 00

L_04a5: ; string
	DW 10		;04A5 00 0A	length
	DB C5 ;E	;04A7 C5	chars
	DB CE ;N	;04A8 CE
	DB C4 ;D	;04A9 C4
	DB A0 ; 	;04AA A0
	DB C2 ;B	;04AB C2
	DB C3 ;C	;04AC C3
	DB CF ;O	;04AD CF
	DB CD ;M	;04AE CD
	DB A0 ; 	;04AF A0
	DB 8D		;04B0 8D

E_04B1: ; Main entry
	XFR SW,SW,#L_02c8	;04B1 55 BA 02 C8 fixupWord	init return stack ptr
	JSR E_1e48	;04B5 79 1E 48 fixupWord	write startup msg
	DW L_0504	;04B8 05 04  fixupword

	SVC $5c		;04BA 66 5C	open object listing file???
	DB 0		;04bc 00 
	DB 1		;04bd 01 
	DB $15		;04be 15 
	DW L_0CEC+1	;04bf 0c ed FixupWord	save status as object listing switch

	SVC $5c		;04C1 66 5C
	DB 0		;04c3 00 
	DB 2		;04c4 02 
	DB $0e		;04c5 0e 
	DW L_0931	;04c6 09 31 FixupWord
	INC AW,1,L_0931	;04C8 30 10 09 31  fixupword

	SVC $5c		;04CC 66 5C
	DB 0		;04CE 00
	DB 2		;04CF 02
	DB $0C		;04D0 0C
	DW L_0937	;04D1 09 37  fixupword

	LDB #L_034a	;04D3 D0 03 4A fixupWord
	SVC $52		;04D6 66 52
	DB 0		;04d8 00 
	DB 0		;04d9 00 
	DB 0		;04da 00 
	DW L_0000	;04db 00 00

	XFR BW,BW	;04DD 55 22
	BZ @04f3	;04DF 14 12
	LDA L_0931	;04E1 91 09 31 fixupWord
	STA L_034a+6	;04E4 B1 03 50 fixupWord
	ADD AW,AW,#$193	;04E7 50 10 01 93
	STA L_0931	;04EB B1 09 31 fixupWord
	CLR AW,1	;04EE 32 01
	STA L_0354	;04F0 B1 03 54 fixupWord
@04F3:	XFR YW,YW,#$30e	;04F3 55 76 03 0E fixupWord
	LDA L_050b	;04F7 93 12
	STA L_047d	;04F9 B1 04 7D fixupWord
	LDA L_050d	;04FC 93 0F
	STA L_047f	;04FE B1 04 7F fixupWord
	JMP L_0644	;0501 71 06 44 fixupWord

L_0504: ; string
	DW 10		;0504 00 0A	length
	DB C2 ;B	;0506 C2	chars
	DB C3 ;C	;0507 C3
	DB CF ;O	;0508 CF
	DB CD ;M	;0509 CD
	DB A0 ; 	;050A A0
	DB B6 ;6	;050B B6
	DB AE ;.	;050C AE
	DB B0 ;0	;050D B0
	DB B3 ;3	;050E B3
	DB 8D		;050F 8D

E_0644:
	LDB #L_030e	;0644 D0 03 0E fixupWord	BASIC source fcb
	SVC $18		;0647 66 18
	LDB #L_034a	;0649 D0 03 4A fixupWord
	SVC $18		;064C 66 18
	SVC $0b		;064E 66 0B
	SVC $05		;0650 66 05		insert date?
	DB 4		;0652 04 
	DW L_0483	;0653 04 83 FixupWord
	LDB #L_030e	;0655 D0 03 0E fixupWord	BASIC source fcb
	SVC $52		;0658 66 52
	DB 1		;065a 01 
	DB $a		;065b 0a 
	DB $1e		;065c 1e 
	DW L_048E	;065d 04 8e FixupWord
	JMP L_07d7	;065F 71 07 D7 fixupWord

E_07D7:	LDB #L_032c	;07D7 D0 03 2C fixupWord
	SVC $18		;07DA 66 18
	JMP L_085e	;07DC 71 08 5E fixupWord

E_085E:	JMP L_0930	;085E 71 09 30 fixupWord

L_0861: ; string: object file last record
	DW $cb	;0861 00 CB	length
	DB 00	;0863 00	bytes
	DB 00	;0864 00
	DB 00	;0865 00
	DB 00	;0866 00
	DB 00	;0867 00
	DB 00	;0868 00
	DB 00	;0869 00
	DB 00	;086A 00
	DB 00	;086B 00
	DB 00	;086C 00
	DB 00	;086D 00
	DB 00	;086E 00
	DB 00	;086F 00
	DB 00	;0870 00
	DB 00	;0871 00
	DB 00	;0872 00
	DB 00	;0873 00
	DB 00	;0874 00
	DB 00	;0875 00
	DB 00	;0876 00
	DB 00	;0877 00
	DB 00	;0878 00
	DB 00	;0879 00
	DB 00	;087A 00
	DB 00	;087B 00
	DB 00	;087C 00
	DB 00	;087D 00
	DB 00	;087E 00
	DB 00	;087F 00
	DB 00	;0880 00
	DB 00	;0881 00
	DB 00	;0882 00
	DB 00	;0883 00
	DB 00	;0884 00
	DB 00	;0885 00
	DB 00	;0886 00
	DB 00	;0887 00
	DB 00	;0888 00
	DB 00	;0889 00
	DB 00	;088A 00
	DB 00	;088B 00
	DB 00	;088C 00
	DB 00	;088D 00
	DB 00	;088E 00
	DB 00	;088F 00
	DB 00	;0890 00
	DB 00	;0891 00
	DB 00	;0892 00
	DB 00	;0893 00
	DB 00	;0894 00
	DB 00	;0895 00
	DB 00	;0896 00
	DB 00	;0897 00
	DB 00	;0898 00
	DB 00	;0899 00
	DB 00	;089A 00
	DB 00	;089B 00
	DB 00	;089C 00
	DB 00	;089D 00
	DB 00	;089E 00
	DB 00	;089F 00
	DB 00	;08A0 00
	DB 00	;08A1 00
	DB 00	;08A2 00
	DB 00	;08A3 00
	DB 00	;08A4 00
	DB 00	;08A5 00
	DB 00	;08A6 00
	DB 00	;08A7 00
	DB 00	;08A8 00
	DB 00	;08A9 00
	DB 00	;08AA 00
	DB 00	;08AB 00
	DB 00	;08AC 00
	DB 00	;08AD 00
	DB 00	;08AE 00
	DB 00	;08AF 00
	DB 00	;08B0 00
	DB 00	;08B1 00
	DB 00	;08B2 00
	DB 00	;08B3 00
	DB 00	;08B4 00
	DB 00	;08B5 00
	DB 00	;08B6 00
	DB 00	;08B7 00
	DB 00	;08B8 00
	DB 00	;08B9 00
	DB 00	;08BA 00
	DB 00	;08BB 00
	DB 00	;08BC 00
	DB 00	;08BD 00
	DB 00	;08BE 00
	DB 00	;08BF 00
	DB 00	;08C0 00
	DB 00	;08C1 00
	DB 00	;08C2 00
	DB 00	;08C3 00
	DB 00	;08C4 00
	DB 00	;08C5 00
	DB 00	;08C6 00
	DB 00	;08C7 00
	DB 00	;08C8 00
	DB 00	;08C9 00
	DB 00	;08CA 00
	DB 00	;08CB 00
	DB 00	;08CC 00
	DB 00	;08CD 00
	DB 00	;08CE 00
	DB 00	;08CF 00
	DB 00	;08D0 00
	DB 00	;08D1 00
	DB 00	;08D2 00
	DB 00	;08D3 00
	DB 00	;08D4 00
	DB 00	;08D5 00
	DB 00	;08D6 00
	DB 00	;08D7 00
	DB 00	;08D8 00
	DB 00	;08D9 00
	DB 00	;08DA 00
	DB 00	;08DB 00
	DB 00	;08DC 00
	DB 00	;08DD 00
	DB 00	;08DE 00
	DB 00	;08DF 00
	DB 00	;08E0 00
	DB 00	;08E1 00
	DB 00	;08E2 00
	DB 00	;08E3 00
	DB 00	;08E4 00
	DB 00	;08E5 00
	DB 00	;08E6 00
	DB 00	;08E7 00
	DB 00	;08E8 00
	DB 00	;08E9 00
	DB 00	;08EA 00
	DB 00	;08EB 00
	DB 00	;08EC 00
	DB 00	;08ED 00
	DB 00	;08EE 00
	DB 00	;08EF 00
	DB 00	;08F0 00
	DB 55 ;U	;08F1 55
	DB BA ;:	;08F2 BA
	DB 80	;08F3 80
	DB 8C	;08F4 8C
	DB 66 ;f	;08F5 66
	DB 6A ;j	;08F6 6A
	DB 00	;08F7 00
	DB 00	;08F8 00
	DB 00	;08F9 00
	DB 00	;08FA 00
	DB 00	;08FB 00
	DB 00	;08FC 00
	DB 00	;08FD 00
	DB 00	;08FE 00
	DB 00	;08FF 00

L_0900:	DW $cb		;0900 00 CB	object file: current offset
	DB 00	;0902 00
	DB 00	;0903 00
	DB 00	;0904 00
	DB 00	;0905 00
	DB 00	;0906 00
	DB 00	;0907 00
	DB 00	;0908 00
	DB 00	;0909 00
	DB 00	;090A 00
	DB 00	;090B 00

	DB 00	;090C 00
	DB CB ;K	;090D CB
	DB 00	;090E 00
	DB 00	;090F 00
	DB 00	;0910 00
L_0911:	DW 132	;0911 00 84	LineLength
	DB 00	;0913 00
	DB 00	;0914 00
	DB 00	;0915 00
	DB 00	;0916 00
	DB 00	;0917 00
	DB 00	;0918 00
	DB 00	;0919 00
	DB 00	;091A 00
	DB 00	;091B 00
	DB 00	;091C 00
	DB 00	;091D 00
	DB 00	;091E 00
	DB 00	;091F 00
	DB 00	;0920 00
	DB 00	;0921 00
	DB 00	;0922 00
	DB 00	;0923 00
	DB 00	;0924 00
	DB 00	;0925 00
	DB 00	;0926 00
	DB 00	;0927 00
	DB 00	;0928 00
	DB 00	;0929 00
	DB 00	;092A 00
	DB 00	;092B 00
	DB 00	;092C 00
	DB 00	;092D 00
	DB 00	;092E 00
	DB 00	;092F 00

E_0930:	LDA #0		;0930 90 00 00	modified
	STA L_0991	;0933 B1 09 91 fixupWord
	LDA #0		;0936 90 00 00	modified
	STA E_0a1d+1	;0939 B1 0A 1E fixupWord
	JMP L_0fef	;093C 71 0F EF fixupWord

L_093F:	STX (-SW)	;093F 6D A2
	LDX L_0930+1	;0941 63 EE
E_0943:	LDA L_0991	;0943 93 4C
	SUB AW,XW	;0945 51 40
	BP L_0963	;0947 17 1A
	LDAB 4(XW)	;0949 85 48 04
	LDBB #2		;094C C0 02
	NABB		;094E 4A
	BZ L_0958	;094F 14 07
	LDBB #$01	;0951 C0 01
	ORIB BL,AL	;0953 43 13
	STBB 04(XW)	;0955 E5 48 04
L_0958:	LDA #5		;0958 90 00 05
	ADD XW,AW	;095B 50 04
	LDAB (XW+)	;095D 85 41
	ADD XW,AW	;095F 50 04
	JMP L_0943	;0961 73 E0

L_0963:	LDX (SW+)	;0963 65 A1
	RSR		;0965 09


E_0966: ; get a name from text
	LDAB (ZW)	;0966 8C		get 1st letter
	JSR L_0b72	;0967 79 0B 72 fixupWord	is char in AL a letter?
	BP @096e	;096A 17 02
	CLAB		;096C 2A		return fail
	RSR		;096D 09

@096E: ; 1st char is letter
	XFR AW,ZW	;096E 55 80		store text starting position
	STA L_09cc+2	;0970 B3 5C
@0972:						skip over alphanumerics?
	INR ZW,1	;0972 30 80
	LDAB (ZW)	;0974 8C
	JSR L_0b7b	;0975 79 0B 7B fixupWord	is char in AL alphanumeric?
	BP @0972	;0978 17 F8
	LDA L_09cc+2	;097A 93 52		calc text length
	SUB AW,ZW	;097C 51 80
	STA L_09c8+1	;097E B3 49
	JSR L_0baa	;0980 79 0B AA fixupWord	skip spaces in text
	JSR E_0bbf	;0983 79 0B BF fixupWord	look for % or $ (variable types), return bitmask
	STA L_09c2+1	;0986 B3 3B		store type bitmask
	LDAB #1		;0988 80 01		return success
	RSR		;098A 09


E_098B:	LDA L_0931	;098B 91 09 31 fixupWord
	STA (-YW)	;098E B5 62
E_0990:	LDB #0		;0990 D0 00 00	modified
	SAB		;0993 59
	BP @09dc	;0994 17 46
	STA (YW)	;0996 BB
	LDB #5		;0997 D0 00 05
	AAB		;099A 58
	CLA		;099B 3A
	LDAB (BW+)	;099C 85 21
	STB L_09d0	;099E F3 30
	AAB		;09A0 58
	STB @09d7+1	;09A1 F3 35
	LDB L_09c8+1	;09A3 D3 24
	SAB		;09A5 59
	BNZ @09d7	;09A6 15 2F
	LDB (YW)	;09A8 DB
	LDAB 4(BW)	;09A9 85 28 04
	LDBB #1		;09AC C0 01
	NABB		;09AE 4A
	BNZ @09d7	;09AF 15 26
	LDBB #4		;09B1 C0 04
	NABB		;09B3 4A
	BNZ @09c8	;09B4 15 12
	LDA @(YW)	;09B6 95 64
	LDB #$4000	;09B8 D0 40 00
	NAB		;09BB 5A
	BNZ @09c8	;09BC 15 0A
	LDB #$b000	;09BE D0 B0 00
	NAB		;09C1 5A
L_09c2:	LDA #0		;09C2 90 00 00	modified	type bitmask
	SAB		;09C5 59
	BNZ @09d7	;09C6 15 0F
@09C8:	LDA #0		;09C8 90 00 00		A=length
	DCA		;09CB 39
@09cc:	CPF (A),0,0	;09CC 67 80 00 00 00 00
	BNZ @09d7	;09D2 15 03
	LDAB #1		;09D4 80 01
	RSR		;09D6 09

@09D7:	LDA #0		;09D7 90 00 00
	JMP L_0990	;09DA 73 B4

@09DC:	STX (-SW)	;09DC 6D A2
@09DE:	LDX L_0991	;09DE 63 B1
	XFR BW,XW	;09E0 55 42
	STB (YW)	;09E2 FB
	INR BW,6	;09E3 30 25
	ADD BW,BW,L_09c8+1 ;09E5 50 23 09 C9 fixupWord
	LDA E_0a1d+1	;09E9 93 33
	SAB		;09EB 59
	BL @09f2	;09EC 10 04
	JSR E_0a35	;09EE 7B 45
	JMP @09de	;09F0 73 EC

@09F2:	LDA L_09c2+1	;09F2 93 CF
	LDB #1		;09F4 D0 00 01
	JSR L_0bde	;09F7 79 0B DE fixupWord
	STA (XW+)	;09FA B5 41
	CLA		;09FC 3A
	DCA		;09FD 39
	STA (XW+)	;09FE B5 41
	INA		;0A00 38
	STAB (XW+)	;0A01 A5 41
	LDA @09c8+1	;0A03 93 C4
	STAB (XW+)	;0A05 A5 41
	LDA @09c8+1	;0A07 93 C0
	DCA		;0A09 39
	LDB L_09cc+2	;0A0A D3 C2
	MVF (A),(B),(X)	;0A0C 67 4A 24
	INA		;0A0F 38
	ADD XW,AW	;0A10 50 04
	STX L_0991	;0A12 69 09 91 fixupWord
	LDX (SW+)	;0A15 65 A1
	CLAB		;0A17 2A
	RSR		;0A18 09

L_0A19:	INC ?,1,L_0902	;0A19 30 10 09 02  fixupword
E_0A1D:	LDA #0		;0A1D 90 00 00
E_0A20:	LDB L_0991	;0A20 D1 09 91 fixupWord
	INR BW,4	;0A23 30 23
	SAB		;0A25 59
	BL @0a2c	;0A26 10 04
	JSR E_0a35	;0A28 7B 0B
	JMP L_0a1d	;0A2A 73 F1

@0A2C:	LDB (YW)	;0A2C DB
	STB (-AW)	;0A2D F5 02
	DCR AW,2	;0A2F 31 01
	STA (YW)	;0A31 BB
	STA E_0a1d+1	;0A32 B3 EA
	RSR		;0A34 09


E_0a35:	LDB E_0a1d+1	;0A35 D1 0A 1E fixupWord
	SUB AW,BW,L_0937 ;0A38 51 21 09 37 fixupWord
	STA @0a6f+1	;0A3C B1 0A 70 fixupWord
	CLR BW,0	;0A3F 32 20
L_0A41:	SVC $59		;0A41 66 59
	ADD BW,BW,#$800	;0A43 50 32 08 00
	S 2,#?,3,@0A6F	;0A47 46 12 1C 08 00 0A 6F fixupWord
	BGZ L_0a41	;0A4E 18 F1
	XFR AW,BW	;0A50 55 20
	LDB L_0937	;0A52 D1 09 37 fixupWord
	AAB		;0A55 58
	STB L_0937	;0A56 F1 09 37 fixupWord
	STK YH,2	;0A59 7E 61
	LDB E_0a1d+1	;0A5B D1 0A 1E fixupWord
	XFR YW,BW	;0A5E 55 26
	ADD YW,AW	;0A60 50 06
	SUB AW,YW,L_0937 ;0A62 51 61 09 37 fixupWord
	DCA		;0A66 39
	MVL		;0A67 F7
	STR Y,E_0a1d+1	;0A68 D6 67 0A 1E fixupWord
	POP YH,2	;0A6C 7F 61
	RSR		;0A6E 09

@0a6f:	DB 0,0,0	;0A6F 00 00 00

L_0A72:	LDAB (ZW)	;0A72 8C
	LDBB #"'"+$80	;0A73 C0 A7
	SABB		;0A75 49
	BZ @0a7f	;0A76 14 07
	LDBB #'"'+$80	;0A78 C0 A2
	SABB		;0A7A 49
	BZ @0a7f	;0A7B 14 02
	CLAB		;0A7D 2A
	RSR		;0A7E 09

@0A7F:	INR ZW,1	;0A7F 30 80
	XFR BW,ZW	;0A81 55 82
	STB (-SW)	;0A83 F5 A2
@0A85:	LDBB (ZW+)	;0A85 C5 81
	BZ @0a92	;0A87 14 09
	SABB		;0A89 49
	BNZ @0a85	;0A8A 15 F9
	LDA (SW)	;0A8C 9D
	SUB AW,ZW	;0A8D 51 80
	DCA		;0A8F 39
	JMP @0a9b	;0A90 73 09

@0A92:	DCR ZW,1	;0A92 31 80
	JSR L_0dc8	;0A94 79 0D C8 fixupWord
	DB 9		;0A97 09
	LDA (SW)	;0A98 9D
	SUB AW,ZW	;0A99 51 80
@0A9B:	STA (-YW)	;0A9B B5 62
	JSR L_0cac	;0A9D 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 3		;0AA0 03
	LDA (YW)	;0AA1 9B
	JSR L_0cc2	;0AA2 79 0C C2 fixupWord
	LDA (SW)	;0AA5 9D
	STX (SW)	;0AA6 6D A0
	XAX		;0AA8 5B
@0AA9:	LDA (YW)	;0AA9 9B
	BLE @0ab5	;0AAA 19 09
	DCA		;0AAC 39
	STA (YW)	;0AAD BB
	LDAB (XW+)	;0AAE 85 41
	JSR L_0ccc	;0AB0 79 0C CC fixupWord
	JMP @0aa9	;0AB3 73 F4

@0AB5:	LDX (SW+)	;0AB5 65 A1
	LDA (YW+)	;0AB7 95 61
	JSR L_0baa	;0AB9 79 0B AA fixupWord	skip spaces in text
	LDAB #1		;0ABC 80 01
	RSR		;0ABE 09


E_0ABF: ; get text number string
	XFR AW,ZW	;0ABF 55 80		save Z
	STA (-SW)	;0AC1 B5 A2
	LDAB (ZW)	;0AC3 8C		get text char
	JSR E_0b66	;0AC4 79 0B 66 fixupWord	is char in AL a number?
	BP @0ad2	;0AC7 17 09
	LDBB #'.'+$80	;0AC9 C0 AE		is it '.'?
	SABB		;0ACB 49
	BZ @0b03	;0ACC 14 35
	LDA (SW+)	;0ACE 95 A1		discard saved Z
	CLA		;0AD0 3A		set flags
	RSR		;0AD1 09		return

@0AD2:				; skip text numbers
	JSR L_0b24	;0AD2 7B 50	is text char a number? (consume if true)
	BP @0ad2	;0AD4 17 FC
	LDBB #'.'+$80	;0AD6 C0 AE	is it '.'?
	SABB		;0AD8 49
	BZ @0b03	;0AD9 14 28
	JSR E_0b81	;0ADB 79 0B 81 fixupWord	compare text with inline
	DB '%'+$80 	;0ADE A5
	DB 1		;0adf 01
	BNZ @0aea	;0AE0 15 08
	LDA (SW)	;0AE2 9D
	SUB AW,ZW	;0AE3 51 80
	LDBB #4		;0AE5 C0 04
	SABB		;0AE7 49
	BGZ @0b09	;0AE8 18 1F
@0AEA:	LDA (SW)	;0AEA 9D
	XFR BW,ZW	;0AEB 55 82
	STB (SW)	;0AED FD
	XAZ		;0AEE 5E
	JSR L_0b2f	;0AEF 7B 3E	is text char a number? (consume if true)
	JSR L_0cac	;0AF1 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 4		;0AF4 04
	LDA (YW+)	;0AF5 95 61
	JSR L_0cc2	;0AF7 79 0C C2 fixupWord
	LDA (SW+)	;0AFA 95 A1
	XAZ		;0AFC 5E
@0AFD:	JSR L_0baa	;0AFD 79 0B AA fixupWord	skip spaces in text
	LDAB #1		;0B00 80 01
	RSR		;0B02 09

@0B03:	INR ZW,1	;0B03 30 80	skip '.'
@0B05:				; skip text numbers
	JSR L_0b24	;0B05 7B 1D	is text char a number? (consume if true)
	BP @0b05	;0B07 17 FC
@0B09:	JSR L_0cac	;0B09 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 5		;0B0C 05
	LDA (SW)	;0B0D 9D
	STX (SW)	;0B0E 6D A0
	XAX		;0B10 5B
@0B11:	LDAB (XW+)	;0B11 85 41
	JSR L_0ccc	;0B13 79 0C CC fixupWord
	XFR AW,XW	;0B16 55 40
	SUB AW,ZW	;0B18 51 80
	BGZ @0b11	;0B1A 18 F5
	LDX (SW+)	;0B1C 65 A1
	CLAB		;0B1E 2A
	JSR L_0ccc	;0B1F 79 0C CC fixupWord
	JMP @0afd	;0B22 73 D9

E_0B24: ; is text char a number? (consume if true)
	LDAB (ZW+)	;0B24 85 81	get text char
	JSR E_0b66	;0B26 7B 3E	is char in AL a number?
	BP @0b2e	;0B28 17 04	return =
	DCR ZW,1	;0B2A 31 80	unget text char
	LDBB #$ff	;0B2C C0 FF	return not =
@0B2E:	RSR		;0B2E 09

E_0B2F:	JSR E_0b24	;0B2F 7B F3	is text char a number? (consume if true)
	BP @0b35	;0B31 17 02
	CLA		;0B33 3A
	RSR		;0B34 09

@0B35:	STX (-SW)	;0B35 6D A2
	CLA		;0B37 3A
	XAX		;0B38 5B
@0B39:	XFR AW,XW	;0B39 55 40
	SLA		;0B3B 3D
	BF @0b5c	;0B3C 12 1E
	SLA		;0B3E 3D
	BF @0b5c	;0B3F 12 1B
	ADD AW,XW	;0B41 50 40
	BF @0b5c	;0B43 12 17
	SLA		;0B45 3D
	BF @0b5c	;0B46 12 14
	CLRB BH,0	;0B48 22 20
	AAB		;0B4A 58
	BF @0b5c	;0B4B 12 0F
	XFR XW,BW	;0B4D 55 24
	JSR L_0b24	;0B4F 7B D3	is text char a number? (consume if true)
	BP @0b39	;0B51 17 E6
@0B53:	JSR L_0baa	;0B53 7B 55	skip spaces in text
	STX (-YW)	;0B55 6D 62
	LDX (SW+)	;0B57 65 A1
	LDAB #$01	;0B59 80 01
	RSR		;0B5B 09

@0B5C:	JSR L_0dc8	;0B5C 79 0D C8 fixupWord
	DB $A		;0B5F 0A
@0B60:	JSR L_0b24	;0B60 7B C2	is text char a number? (consume if true)
	BP @0b60	;0B62 17 FC
	JMP @0b53	;0B64 73 ED

E_0B66: ; is char in AL a number?
	LDBB #'9'+$80	;0B66 C0 B9
	SABB		;0B68 49
	BLE L_0b6e	;0B69 19 03
L_0B6B:	LDBB #$ff	;0B6B C0 FF
	RSR		;0B6D 09

L_0B6E:	LDBB #'0'+$80	;0B6E C0 B0
	SABB		;0B70 49
	RSR		;0B71 09

E_0B72: ; is char in AL a letter?
	LDBB #'Z'+$80	;0B72 C0 DA
	SABB		;0B74 49
	BGZ L_0b6b	;0B75 18 F4
	LDBB #'A'+$80	;0B77 C0 C1
	SABB		;0B79 49
L_0B7A:	RSR		;0B7A 09

L_0B7B: ; is char in AL alphanumeric?
	JSR L_0b72	;0B7B 7B F5	is char in AL a letter?
	BP L_0b7a	;0B7D 17 FB
	JMP E_0b66	;0B7F 73 E5	is char in AL a number?


E_0B81: ; compare text with inline
	XFR AW,ZW	;0B81 55 80	save Z
	STA (-SW)	;0B83 B5 A2
	CLAB		;0B85 2A
@0B86:	LDBB (XW+)	;0B86 C5 41	get an inline char
	BP @0b98	;0B88 17 0E	  end?
	LDAB (ZW+)	;0B8A 85 81	get text char
	SABB		;0B8C 49	= ?
	BZ @0b86	;0B8D 14 F7
@0B8F:	LDAB (XW+)	;0B8F 85 41	skip remaining inline chars
	BM @0b8f	;0B91 16 FC
@0B93:	LDA (SW+)	;0B93 95 A1
	XAZ		;0B95 5E
	CLA		;0B96 3A
	RSR		;0B97 09

@0B98:	JSR L_0b7b	;0B98 7B E1	is char in AL alphanumeric?
	BM @0ba1	;0B9A 16 05
	LDAB (ZW)	;0B9C 8C
	JSR L_0b7b	;0B9D 7B DC	is char in AL alphanumeric?
	BP @0b93	;0B9F 17 F2
@0BA1:	JSR L_0baa	;0BA1 7B 07	skip spaces in text
	LDA (SW+)	;0BA3 95 A1
	CLA		;0BA5 3A
	LDAB ff(XW)	;0BA6 85 48 FF
	RSR		;0BA9 09

L_0BAA: ; skip spaces in text
	LDAB #$a0	;0BAA 80 A0
@0BAC:	LDBB (ZW+)	;0BAC C5 81
	SABB		;0BAE 49
	BZ @0bac	;0BAF 14 FB
	DCR ZW,1	;0BB1 31 80
	RSR		;0BB3 09

L_0BB4:	JSR E_0b81	;0BB4 7B CB	compare text with inline
	DB ')'+$80	;0BB6 A9
	DB 1		;0BB7 01
L_0BB8:	BNZ L_0bbe	;0BB8 15 04
	JSR L_0dc8	;0BBA 79 0D C8 fixupWord
	DB 7		;0BBD 07
L_0BBE:	RSR	;0BBE 09


E_0BBF: ; look for % or $ (variable types), return bitmask
	JSR E_0b81	;0BBF 7B C0	compare text with inline
	DB '%'+$80	;0BC1 A5
	DB $10		;0bc2 10
	BNZ @0bc9	;0BC3 15 04
	JSR E_0b81	;0BC5 7B BA	compare text with inline
	DB '$'+$80	;0BC7 A4
	DB $20		;0bc8 20
@0BC9:	XFRB AH,AL	;0BC9 45 10
	CLAB		;0BCB 2A
	RSR		;0BCC 09

L_0BCD:	LDB #$1000	;0BCD D0 10 00
	NAB		;0BD0 5A
	BZ @0bd4	;0BD1 14 01
	RSR		;0BD3 09

@0BD4:	LDB #$2000	;0BD4 D0 20 00
	NAB		;0BD7 5A
	BNZ @0bdb	;0BD8 15 01
	RSR		;0BDA 09

@0BDB:	LDBB #$ff	;0BDB C0 FF
	RSR		;0BDD 09


L_0BDE:	STA (-SW)	;0BDE B5 A2
	XFR AW,AW	;0BE0 55 00
	BP L_0bef	;0BE2 17 0B
	LDA L_0913	;0BE4 91 09 13 fixupWord
	AAB		;0BE7 58
	STB L_0913	;0BE8 F1 09 13 fixupWord
	BL L_0c23	;0BEB 10 36
	JMP L_0c18	;0BED 73 29

L_0BEF:	STK BH,2	;0BEF 7E 21
	JSR L_0bcd	;0BF1 7B DA
	POP BH,2	;0BF3 7F 21
	BM L_0c04	;0BF5 16 0D
	BGZ L_0c0f	;0BF7 18 16
	LDA L_0904	;0BF9 91 09 04 fixupWord
	AAB		;0BFC 58
	STB L_0904	;0BFD F1 09 04 fixupWord
	BL L_0c23	;0C00 10 21
	JMP L_0c18	;0C02 73 14

L_0C04:	LDA L_0908	;0C04 91 09 08 fixupWord
	AAB		;0C07 58
	STB L_0908	;0C08 F1 09 08 fixupWord
	BL L_0c23	;0C0B 10 16
	JMP L_0c18	;0C0D 73 09

L_0C0F:	LDA L_0906	;0C0F 91 09 06 fixupWord
	AAB		;0C12 58
	STB L_0906	;0C13 F1 09 06 fixupWord
	BL L_0c23	;0C16 10 0B
E_0C18:	AND PW,BW,#$f000	;0C18 52 3E F0 00
	BNZ L_0c23	;0C1C 15 05
	LDB (SW+)	;0C1E D5 A1
	ORI AW,BW	;0C20 53 20
	RSR		;0C22 09

L_0C23:	JSR L_0de3	;0C23 79 0D E3 fixupWord
	DB $10		;0C26 10
	LDA #L_0C4E	;0c27 90 0C 4E  fixupword
	LDB #L_0c5e	;0C2A D0 0C 5E fixupWord
	SAB		;0C2D 59
	BM L_0c34	;0C2E 16 04
	JSR L_0de3	;0C30 79 0D E3 fixupWord
	DB $0d		;0C33 0D
L_0C34:	LDB L_0900	;0C34 D1 09 00 fixupWord
	STB (AW+)	;0C37 F5 01
	STA L_0c28	;0C39 B3 ED
	RSR		;0C3B 09

L_0C3C:	LDB L_0c28	;0C3C D3 EA
	LDA #L_0c4e	;0C3E 90 0C 4E fixupWord
	SUB AW,BW	;0C41 51 20
	BGZ L_0c49	;0C43 18 04
	JSR L_0de3	;0C45 79 0D E3 fixupWord
	DB $c		;0C48 0C
L_0C49:	LDA (-BW)	;0C49 95 22
	STB L_0c28	;0C4B F3 DB
	RSR		;0C4D 09

	DS $10

E_0C5E: ; look up keyword (inline table ptr)
	XFR AW,ZW	;0C5E 55 80	save Z
	STA L_0c76+1	;0C60 B3 15
	LDA (XW+)	;0C62 95 41	get inline table ptr
	STX (-SW)	;0C64 6D A2	save X
	XAX		;0C66 5B	X=table 1st char ptr
	LDAB (ZW+)	;0C67 85 81	get text char
@0C69:	LDBB (XW+)	;0C69 C5 41	get 1st char entry char
	BZ @0c76	;0C6B 14 09	  end of table?
	SABB		;0C6D 49	  = ?
	BZ @0c81	;0C6E 14 11
	BM @0c76	;0C70 16 04	  overshot?
	INR XW,2	;0C72 30 41	  skip to next entry
	JMP @0c69	;0C74 73 F3

@0C76:	LDA #0		;0C76 90 00 00	modified	restore Z
	XAZ		;0C79 5E
	CLAB		;0C7A 2A
@0C7B:	LDX (SW+)	;0C7B 65 A1	restore X
	CLRB AH,0	;0C7D 22 00	pad code to word
	XAB		;0C7F 5D	set flags
	RSR		;0C80 09	return

@0C81: ; found 1st char
	LDX (XW)	;0C81 65 40	X=word list
@0C83:	LDBB (XW+)	;0C83 C5 41	get next char of word
	BZ @0c76	;0C85 14 EF	  end of list?
	BGZ @0c99	;0C87 18 10	  a code?
	LDAB (ZW+)	;0C89 85 81	compare to text
	SABB		;0C8B 49
	BZ @0c83	;0C8C 14 F5	if =, do next char
	LDA @0c76+1	;0C8E 93 E7	restore Z (text ptr)
	XAZ		;0C90 5E
	LDAB (ZW+)	;0C91 85 81
@0C93:	LDBB (XW+)	;0C93 C5 41	skip remainder of list word
	BM @0c93	;0C95 16 FC
	JMP @0c83	;0C97 73 EA	do next list entry

@0C99: ; keyword matched & we're at the code
	JSR L_0b7b	;0C99 79 0B 7B fixupWord	is char in AL alphanumeric?
	BM @0ca4	;0C9C 16 06
	LDAB (ZW)	;0C9E 8C
	JSR L_0b7b	;0C9F 79 0B 7B fixupWord	is char in AL alphanumeric?
	BP @0c76	;0CA2 17 D2
@0CA4:	JSR L_0baa	;0CA4 79 0B AA fixupWord	skip spaces in text
	LDAB $ff(XW)	;0CA7 85 48 FF		get code
	JMP @0c7b	;0CAA 73 CF


E_0CAC: ; write inline byte | $80 to object file???
	LDAB L_0cec+1	;0CAC 83 3F	if object listing file active?
	SRAB		;0CAE 2C
	BNL @0cb9	;0CAF 11 08
	LDA L_0900	;0CB1 91 09 00 fixupWord	get offset?
	JSR L_0453	;0CB4 79 04 53 fixupWord	insert word as text (inline ptr)
	DW L_0E10+7	;0CB7 0E 17  fixupword
@0CB9:
	LDAB #$80	;0CB9 80 80
	LDBB (XW+)	;0CBB C5 41	get inline byte
	ORIB AL,BL	;0CBD 43 31
	JSR L_0ccc	;0CBF 7B 0B	write it
	RSR		;0CC1 09

L_0CC2: ; write AW to object file???
	STA (-SW)	;0CC2 B5 A2	save
	LDAB (SW)	;0CC4 8D	get hi byte
	JSR L_0ccc	;0CC5 7B 05	write it
	LDA (SW+)	;0CC7 95 A1	get lo byte
	JSR L_0ccc	;0CC9 7B 01	write it
	RSR		;0CCB 09	return

L_0CCC:	; write AL to object file???
	STAB @0cf3+1	;0CCC A3 26	save byte
	LDAB L_0d31	;0CCE 83 61	count record size?
	INAB		;0CD0 28
	LDBB #$78	;0CD1 C0 78	too long?
	SABB		;0CD3 49
	BLE @0cda	;0CD4 19 04
	JSR L_0d1e	;0CD6 7B 46	  write record???
	LDAB #1		;0CD8 80 01	  new next byte index
@0CDA:	STAB L_0d31	;0CDA A3 55
	CLRB AH,0	;0CDC 22 00	store the byte
	LDB #L_0d34-1	;0CDE D0 0D 33 fixupWord
	AAB		;0CE1 58
	LDAB @0cf3+1	;0CE2 83 10
	STAB (BW)	;0CE4 A9
	LDA L_0900	;0CE5 91 09 00 fixupWord	increment object size???
	INA		;0CE8 38
	STA L_0900	;0CE9 B1 09 00 fixupWord
L_0cec:	LDAB #0		;0CEC 80 00	modified	object listing file active?
	SRAB		;0CEE 2C
	BL @0cf2	;0CEF 10 01
	RSR		;0CF1 09

@0CF2:	CLA		;0CF2 3A
@0cf3:	LDAB #0		;0CF3 80 00	modified	saved byte
	SRRB AL,4	;0CF5 24 13	insert hi nibble
	JSR @0d0c	;0CF7 7B 13
	STBB L_0e10+9	;0CF9 E1 0E 19 fixupWord
	LDAB @0cf3+1	;0CFC 83 F6	insert lo nibble
	JSR @0d0c	;0CFE 7B 0C
	STBB L_0e10+$a	;0D00 E1 0E 1A fixupWord
	JSR L_03c6	;0D03 79 03 C6 fixupWord
	DW L_0E10	;0D06 0E 10  fixupword
	JSR E_0E03	;0D08 79 0E 03  fixupword	init listing line string
	RSR		;0D0B 09

@0D0C: ; convert AL to hex char in BL
	LDBB #$0f	;0D0C C0 0F
	NABB		;0D0E 4A
	LDAB #9		;0D0F 80 09
	SUBB AL,BL	;0D11 41 31
	BLE @0d19	;0D13 19 04
	LDBB #'A'+$80-1	;0D15 C0 C0
	JMP @0d1b	;0D17 73 02

@0D19:	LDAB #'0'+$80	;0D19 80 B0
@0D1B:	ORIB BL,AL	;0D1B 43 13
	RSR		;0D1D 09


L_0D1E: ; flush object file buffer
	LDAB L_0d31	;0D1E 83 11		if record length <>0
	BZ @0d27	;0D20 14 05
	JSR L_03b5	;0D22 79 03 B5 fixupWord	write object record
	DW L_0D30	;0D25 0D 30  fixupword
@0D27:
	LDA L_0900	;0D27 91 09 00 fixupWord  init record offset
	STA L_0d32	;0D2A B3 06
	CLAB		;0D2C 2A		init record length
	STAB L_0d31	;0D2D A3 02
	RSR		;0D2F 09		return

L_0d30: ; object record info
	DB 00	;0D30 00
L_0d31:	DB 0	;0D31 00	; object record current size?
L_0d32:	DW $cb	;0D32 00 CB	; object record starting offset
L_0d34:	DS $78+2		; object record buffer?

L_0DAE:	STB (-SW)	;0DAE F5 A2
	STA (-SW)	;0DB0 B5 A2
	JSR L_0d1e	;0DB2 79 0D 1E fixupWord
	LDAB #2		;0DB5 80 02
	STAB L_0d31	;0DB7 A1 0D 31 fixupWord
	LDA (SW+)	;0DBA 95 A1
	STA L_0d32	;0DBC B1 0D 32 fixupWord
	LDA (SW+)	;0DBF 95 A1
	STA L_0d34	;0DC1 B1 0D 34 fixupWord
	JSR L_0d1e	;0DC4 79 0D 1E fixupWord
	RSR		;0DC7 09


E_0DC8:
	CLA		;0DC8 3A		get padded inline byte
	LDAB (XW+)	;0DC9 85 41
	JSR L_0453	;0DCB 79 04 53 fixupWord	insert word as text (inline ptr)
	DW L_0E10+9	;0DCE 0E 19  fixupword
	LDA #$aaaa	;0DD0 90 AA AA		insert asterisks
	STA L_0e10+5	;0DD3 B3 40
	JSR L_03c6	;0DD5 79 03 C6 fixupWord
	DW L_0E10	;0DD8 0E 10  fixupword
	JSR ???		;0DDA 7B 27
@0ddc:	LDA L_044D	;0DDc 91 04 4D  fixupword	increment # errors
	INA		;0DDF 38
	STA (@0ddc+1)	;0DE0 B4 FB	L_044d
	RSR		;0DE2 09


E_0DE3:
	LDAB (XW+)	;0DE3 85 41		get inline byte
	STAB @0de9	;0DE5 A3 02
	JSR L_0dc8	;0DE7 7B DF
@0de9:	DB 0		;0DE9 00	modified
	JSR L_03c6	;0DEA 79 03 C6 fixupWord
	DW @0DF4	;0DED 0D F4  fixupword
	JSR E_0e21	;0DEF 7B 30	skip text to next statement
	JMP L_1013	;0df1 71 10 13  fixupword

@0df4: ; string
	DW 13		;0DF4 00 0D	length
	DB ' '+$80 	;0DF6 A0	chars
	DB ' '+$80 	;0df7 A0
	DB ' '+$80 	;0DF8 A0
	DB '*'+$80	;0df9 AA
	DB '*'+$80	;0DFA AA
	DB 'R'+$80	;0DFB D2
	DB 'E'+$80	;0dfc C5
	DB 'J'+$80	;0dfd CA
	DB 'E'+$80	;0DFE C5
	DB 'C'+$80	;0dff C3
	DB 'T'+$80	;0E00 D4
	DB 'E'+$80	;0e01 C5
	DB 'D'+$80	;0E02 C4


E_0e03: ; init listing line string
	LDB L_0dd8	;0e03 D3 D3	L_0e10	point at listing record string
	LDA #$f		;0E05 90 00 0F		length=15
	STA (BW+)	;0E08 B5 21
	CVX 159???,#' '+$80,(BW)	;0E0A 47 9E 0E A0 02
	RSR		;0e0f 09

L_0e10:	; string; object listing line buffer
	DW 15		;0E10 00 0F
	DB $a0		;0E12 A0
	DB $a0		;0e13 A0
	DB $a0		;0E14 A0
	DB $a0		;0e15 A0
	DB $a0		;0E16 A0
	DB $a0		;0e17 A0
	DB $a0		;0E18 A0
	DB $a0		;0e19 A0
	DB $a0		;0E1A A0
	DB $a0		;0e1b A0
	DB $a0		;0E1C A0
	DB $a0		;0e1d A0
	DB $a0		;0E1E A0
	DB $A0		;0e1f A0
	DB $A0		;0E20 A0


L_0e21: ; skip text to next statement
	LDAB (ZW+)	;0e21 85 81	get char
	BNZ @0e28	;0E23 15 03	stop at end of line
	DCR ZW,1	;0E25 31 80
	RSR		;0E27 09

@0E28:	LDBB #':'+$80	;0E28 C0 BA	is it ':'
	SABB		;0E2A 49
	BNZ L_0e21	;0E2B 15 F4	no, do more
	RSR		;0E2D 09


E_0E2E: ; End
	JSR L_0cac	;0E2E 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 4		;0E31 04
	CLA		;0E32 3A
	IVA		;0E33 3B
	JSR L_0cc2	;0E34 79 0C C2 fixupWord
	JSR L_0cac	;0E37 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $1d		;0E3A 1D
	JSR L_03B5	;0eaB 79 03 B5  fixupword	write object record
	DW L_0861	;0E3E 08 61  fixupword
	CLA		;0E40 3A
	STA #0		;0E41 B0 00 00
	STA #0		;0E44 B0 00 00
	LDAB L_090e	;0E47 81 09 0E fixupWord
	XAX		;0E4A 5B
	LDA #L_0f2f	;0E4B 90 0F 2F fixupWord
	XAZ		;0E4E 5E
E_0E4F:	DCX		;0E4F 3F
	BM L_0e8b	;0E50 16 39
	CLR BW,0	;0E52 32 20
	LDA #L_0400	;0E54 90 04 00
	LDAB 05(ZW)	;0E57 85 88 05
	BM L_0e66	;0E5A 16 0A
	ANDB AH,AL	;0E5C 42 10
	BNZ L_0e66	;0E5E 15 06
	SRAB		;0E60 2C
	BNL L_0e66	;0E61 11 03
	LDB #L_0193	;0E63 D0 01 93
L_0E66:	LDAB 05(ZW)	;0E66 85 88 05
	SRRB AL,2	;0E69 24 11
	BNL L_0e72	;0E6B 11 05
	LDA #L_0036	;0E6D 90 00 36
	JMP L_0e75	;0E70 73 03

L_0E72:	LDA #L_0022	;0E72 90 00 22
E_0E75:	AAB		;0E75 58
	LDA L_0e42	;0E76 93 CA
	AAB		;0E78 58
	STB L_0e42	;0E79 F3 C7
	JSR L_0e81	;0E7B 7B 04
	JSR L_0e81	;0E7D 7B 02
	JMP L_0e4f	;0E7F 73 CE

L_0E81:	LDA (ZW+)	;0E81 95 81
	JSR L_0cc2	;0E83 79 0C C2 fixupWord
	LDA (ZW+)	;0E86 95 81
	JSR (L_0e84)	;0E88 7C FA
	RSR		;0E8A 09

L_0E8B:	LDA #L_0faf	;0E8B 90 0F AF fixupWord
	XAZ		;0E8E 5E
	LDX L_0913	;0E8F 61 09 13 fixupWord
E_0E92:	DCX		;0E92 3F
	BM L_0ea6	;0E93 16 11
	LDA (ZW)	;0E95 9C
	BP L_0ea2	;0E96 17 0A
	LDA 02(ZW)	;0E98 95 88 02
	INR AW,3	;0E9B 30 02
	LDB L_0e45	;0E9D D3 A6
	AAB		;0E9F 58
	STB L_0e45	;0EA0 F3 A3
L_0EA2:	JSR L_0e81	;0EA2 7B DD
	JMP L_0e92	;0EA4 73 EC

L_0EA6:	LDA L_0937	;0EA6 91 09 37 fixupWord
	XAZ		;0EA9 5E
L_0EAA:	LDA (-ZW)	;0EAA 95 82
	JSR (L_0e84)	;0EAC 7C D6
	LDA (-ZW)	;0EAE 95 82
	JSR (L_0e84)	;0EB0 7C D2
	LDA E_0a1d+1	;0EB2 91 0A 1E fixupWord
L_0EB5:	SUB AW,ZW	;0EB5 51 80
	BNZ L_0eaa	;0EB7 15 F1
	JSR L_0d1e	;0EB9 79 0D 1E fixupWord
	CLA		;0EBC 3A
	STAB L_0d31	;0EBD A1 0D 31 fixupWord
	LDA #L_008c	;0EC0 90 00 8C
	STA L_0d32	;0EC3 B1 0D 32 fixupWord
	JSR L_03b5	;0EC6 79 03 B5 fixupWord
	DW L_0D30	;0EC9 0D 30  fixupword
	SVC $05		;0ECB 66
	DB $c		;0ECD 0C
	DW L_030E	;0ECE 03 0E  fixupword		BASIC source fcb
	SVC $05		;0ED0 66 05
	DB $0d		;0ed2 0d 
	DW L_032C	;0ed3 03 2c FixupWord
	LDA L_044d	;0ED5 91 04 4D fixupWord	get # errors
	JSR L_0453	;0ED8 79 04 53 fixupWord	insert word as text (inline ptr)
	DW L_0F17	;0EDB 0F 17  fixupword
	LDA L_0904	;0EDD 91 09 04  fixupword

E_0EE0:	SLA		;0EE0 3D
	XAB		;0EE1 5D
	SLA		;0EE2 3D
	AAB		;0EE3 58
	LDA L_0906	;0EE4 91 09 06 fixupWord
	SLA		;0EE7 3D
	AAB		;0EE8 58
	LDA L_0908	;0EE9 91 09 08 fixupWord
	SLR AW,2	;0EEC 35 01
	AAB		;0EEE 58
	LDA L_0e42	;0EEF 91 0E 42 fixupWord
	AAB		;0EF2 58
	LDA L_0e45	;0EF3 91 0E 45 fixupWord
	AAB		;0EF6 58
	LDA L_0900	;0EF7 91 09 00 fixupWord
	ADD AW,BW	;0EFA 50 20
	JSR (L_0ed9)	;0EFC 7C DB
	DW L_0F25	;0EFE 0F 25  fixupword
	JSR L_0403	;0F00 791 04 03  fixupword	write new line
	JSR L_03c6	;0F03 79 03 C6 fixupWord
	DW L_0F10	;0F06 0F 10  fixupword
	JSR L_1E48	;0F08 79 1E 48  fixupword	write inline string ptr to console
	DW L_0F10	;0F0B 0F 10  fixupword
	JMP L_0368	;0F0D 71 03 68  fixupword	 finish up & exit

L_0f10: ; string
	DW $1d		;0F10 00 1D	length
	DB $a0		;0F12 A0	chars
	DB $A0		;0f13 A0
	DB $a0		;0F14 A0
	DB $a0		;0f15 A0
	DB $a0		;0F16 A0
	DB $a0		;0f17 A0
	DB $a0		;0F18 A0
	DB C5 ; E	;0f19 C5
	DB D2 ; R	;0F1A D2
	DB D2 ; R	;0f1b D2
	DB CF ; O	;0f1c CF
	DB D2 ; R	;0F1D D2
	DB D3 ; S	;0f1e D3
	DB Ac ; ,	;0f1f AC
	DB $a0		;0F20 A0
	DB $a0		;0f21 A0
	DB $a0		;0F22 A0
	DB $a0		;0f23 A0
	DB $a0		;0F24 A0
	DB $a0		;0f25 A0
	DB BD ; =	;0F26 BD
	DB D0 ; P	;0F27 D0
	DB C7 ; G	;0f28 C7
	DB CD ; M	;0f29 CD
	DB Ad ; ?	;0F2A AD
	DB D3 ; S	;0F2B D3
	DB c9 ; I	;0f2c C9
	DB DA ; Z	;0F2D DA
	DB C5 ; E	;0F2E C5

L_0f2f:	DB FF		;0f2f FF
	DB FF		;0f30 FF
	DB $FF	;0F31 FF
	DB $FF	;0F32 FF
	DB $FF	;0F33 FF
	DB $FF	;0F34 FF
	DB $FF	;0F35 FF
	DB $FF	;0F36 FF
	DB $FF	;0F37 FF
	DB $FF	;0F38 FF
	DB $FF	;0F39 FF
	DB $FF	;0F3A FF
	DB $FF	;0F3B FF
	DB $FF	;0F3C FF
	DB $FF	;0F3D FF
	DB $FF	;0F3E FF
	DB $FF	;0F3F FF
	DB $FF	;0F40 FF
	DB $FF	;0F41 FF
	DB $FF	;0F42 FF
	DB $FF	;0F43 FF
	DB $FF	;0F44 FF
	DB $FF	;0F45 FF
	DB $FF	;0F46 FF
	DB $FF	;0F47 FF
	DB $FF	;0F48 FF
	DB $FF	;0F49 FF
	DB $FF	;0F4A FF
	DB $FF	;0F4B FF
	DB $FF	;0F4C FF
	DB $FF	;0F4D FF
	DB $FF	;0F4E FF
	DB $FF	;0F4F FF
	DB $FF	;0F50 FF
	DB $FF	;0F51 FF
	DB $FF	;0F52 FF
	DB $FF	;0F53 FF
	DB $FF	;0F54 FF
	DB $FF	;0F55 FF
	DB $FF	;0F56 FF
	DB $FF	;0F57 FF
	DB $FF	;0F58 FF
	DB $FF	;0F59 FF
	DB $FF	;0F5A FF
	DB $FF	;0F5B FF
	DB $FF	;0F5C FF
	DB $FF	;0F5D FF
	DB $FF	;0F5E FF
	DB $FF	;0F5F FF
	DB $FF	;0F60 FF
	DB $FF	;0F61 FF
	DB $FF	;0F62 FF
	DB $FF	;0F63 FF
	DB $FF	;0F64 FF
	DB $FF	;0F65 FF
	DB $FF	;0F66 FF
	DB $FF	;0F67 FF
	DB $FF	;0F68 FF
	DB $FF	;0F69 FF
	DB $FF	;0F6A FF
	DB $FF	;0F6B FF
	DB $FF	;0F6C FF
	DB $FF	;0F6D FF
	DB $FF	;0F6E FF
	DB $FF	;0F6F FF
	DB $FF	;0F70 FF
	DB $FF	;0F71 FF
	DB $FF	;0F72 FF
	DB $FF	;0F73 FF
	DB $FF	;0F74 FF
	DB $FF	;0F75 FF
	DB $FF	;0F76 FF
	DB $FF	;0F77 FF
	DB $FF	;0F78 FF
	DB $FF	;0F79 FF
	DB $FF	;0F7A FF
	DB $FF	;0F7B FF
	DB $FF	;0F7C FF
	DB $FF	;0F7D FF
	DB $FF	;0F7E FF
	DB $FF	;0F7F FF
	DB $FF	;0F80 FF
	DB $FF	;0F81 FF
	DB $FF	;0F82 FF
	DB $FF	;0F83 FF
	DB $FF	;0F84 FF
	DB $FF	;0F85 FF
	DB $FF	;0F86 FF
	DB $FF	;0F87 FF
	DB $FF	;0F88 FF
	DB $FF	;0F89 FF
	DB $FF	;0F8A FF
	DB $FF	;0F8B FF
	DB $FF	;0F8C FF
	DB $FF	;0F8D FF
	DB $FF	;0F8E FF
	DB $FF	;0F8F FF
	DB $FF	;0F90 FF
	DB $FF	;0F91 FF
	DB $FF	;0F92 FF
	DB $FF	;0F93 FF
	DB $FF	;0F94 FF
	DB $FF	;0F95 FF
	DB $FF	;0F96 FF
	DB $FF	;0F97 FF
	DB $FF	;0F98 FF
	DB $FF	;0F99 FF
	DB $FF	;0F9A FF
	DB $FF	;0F9B FF
	DB $FF	;0F9C FF
	DB $FF	;0F9D FF
	DB $FF	;0F9E FF
	DB $FF	;0F9F FF
	DB $FF	;0FA0 FF
	DB $FF	;0FA1 FF
	DB $FF	;0FA2 FF
	DB $FF	;0FA3 FF
	DB $FF	;0FA4 FF
	DB $FF	;0FA5 FF
	DB $FF	;0FA6 FF
	DB $FF	;0FA7 FF
	DB $FF	;0FA8 FF
	DB $FF	;0FA9 FF
	DB $FF	;0FAA FF
	DB $FF	;0FAB FF
	DB $FF	;0FAC FF
	DB $FF	;0FAD FF
	DB $FF	;0FAE FF
	DB $FF	;0FAF FF
	DB $FF	;0FB0 FF
	DB $FF	;0FB1 FF
	DB $FF	;0FB2 FF
	DB $FF	;0FB3 FF
	DB $FF	;0FB4 FF
	DB $FF	;0FB5 FF
	DB $FF	;0FB6 FF
	DB $FF	;0FB7 FF
	DB $FF	;0FB8 FF
	DB $FF	;0FB9 FF
	DB $FF	;0FBA FF
	DB $FF	;0FBB FF
	DB $FF	;0FBC FF
	DB $FF	;0FBD FF
	DB $FF	;0FBE FF
	DB $FF	;0FBF FF
	DB $FF	;0FC0 FF
	DB $FF	;0FC1 FF
	DB $FF	;0FC2 FF
	DB $FF	;0FC3 FF
	DB $FF	;0FC4 FF
	DB $FF	;0FC5 FF
	DB $FF	;0FC6 FF
	DB $FF	;0FC7 FF
	DB $FF	;0FC8 FF
	DB $FF	;0FC9 FF
	DB $FF	;0FCA FF
	DB $FF	;0FCB FF
	DB $FF	;0FCC FF
	DB $FF	;0FCD FF
	DB $FF	;0FCE FF
	DB $FF	;0FCF FF
	DB $FF	;0FD0 FF
	DB $FF	;0FD1 FF
	DB $FF	;0FD2 FF
	DB $FF	;0FD3 FF
	DB $FF	;0FD4 FF
	DB $FF	;0FD5 FF
	DB $FF	;0FD6 FF
	DB $FF		;0FD7 FF
	DB $FF		;0FD8 FF
	DB $FF		;0FD9 FF
	DB $FF		;0FDA FF
	DB $FF		;0FDB FF
	DB $FF		;0FDC FF
	DB $FF		;0FDD FF
	DB $FF		;0FDE FF
	DB $FF		;0FDF FF
	DB $FF		;0FE0 FF
	DB $FF		;0FE1 FF
	DB $FF		;0FE2 FF
	DB $FF		;0FE3 FF
	DB $FF		;0FE4 FF
	DB $FF		;0FE5 FF
	DB $FF		;0FE6 FF
	DB $FF		;0FE7 FF
	DB $FF		;0FE8 FF
	DB $FF		;0FE9 FF
	DB $FF		;0FEA FF
	DB $FF		;0FEB FF
	DB $FF		;0FEC FF
	DB $FF		;0FED FF
	DB $ff		;0FEE FF


E_0FEF:	LDA #@0ff5	;0FEF 90 0F F5 fixupWord
	XAZ		;0FF2 5E
	JMP E_100f	;0FF3 73 1A

@0ff5:	DB B0 ;0	;0FF5 B0
	DB A0 ; 	;0FF6 A0
	DB C6 ;F	;0FF7 C6
	DB C9 ;I	;0FF8 C9
	DB CC ;L	;0FF9 CC
	DB C5 ;E	;0FFA C5
	DB A0 ; 	;0FFB A0
	DB D3 ;S	;0FFC D3
	DB D9 ;Y	;0FFD D9
	DB D3 ;S	;0FFE D3
	DB C9 ;I	;0FFF C9
	DB D0 ;P	;1000 D0
	DB D4 ;T	;1001 D4
	DB AC ;,	;1002 AC
	DB D3 ;S	;1003 D3
	DB C5 ;E	;1004 C5
	DB D1 ;Q	;1005 D1
	DB 0		;1006 00

E_1007: ; Rem
	JSR L_0398	;1007 79 03 98 fixupWord
@100a:	DW 0		;100A 00 00
	LDA @100a	;100C 93 FC
	XAZ		;100E 5E

E_100F:	CLRB AL,1	;100F 22 11
	STAB L_1024	;1011 A3 11
E_1013:	XFR SW,SW,#L_02c8 ;1013 55 BA 02 C8 fixupWord
	XFR YW,YW,#L_030e ;1017 55 76 03 0E fixupWord		BASIC source fcb
	JSR L_0baa	;101B 79 0B AA fixupWord	skip spaces in text
	JSR L_0b2f	;101E 79 0B 2F fixupWord	is text char a number? (consume if true)
	BNZ @L_1029	;1021 15 06
	LDAB #0		;1023 80 00	modified
	BNZ @1032	;1025 15 0B
	JMP @1041	;1027 73 18

@1029:	LDA (YW)	;1029 9B
@102a:	LDB #$ffff	;102A D0 FF FF
	STA @102a+1	;102D B3 FC
	SAB		;102F 59
	BGZ @1038	;1030 18 06
@1032:	JSR L_0dc8	;1032 79 0D C8 fixupWord
	DB 1		;1035 01
	JMP @1041	;1036 73 09

@1038:	JSR L_0a19	;1038 79 0A 19 fixupWord
	LDB (YW+)	;103B D5 61
	LDA L_0900	;103D 91 09 00 fixupWord
	STA (BW)	;1040 B9
@1041:	LDAB (ZW)	;1041 8C
	BZ L_1007	;1042 14 C3
	LDBB #$a1	;1044 C0 A1
	SABB		;1046 49
	BZ L_1007	;1047 14 BE
	LDBB #$aa	;1049 C0 AA
	SABB		;104B 49
	BNZ @1056	;104C 15 08
	CLAB		;104E 2A
	STAB L_1024	;104F A3 D3
	JSR E_0e21	;1051 79 0E 21 fixupWord	skip text to next statement
	JMP E_1013	;1054 73 BD

@1056:	LDAB #0		;1056 80 00
	BZ @105d	;1058 14 03
	JMP L_1d26	;105A 71 1D 26 fixupWord

@105D:	JSR L_0c5e	;105D 79 0C 5E fixupWord	look up keyword (inline table ptr)
	DW L_19F2	;1060 19 F2  fixupword	command keyword table
	SLRB AL,2	;1062 25 11
	STK AH,2	;1064 7E 01
	BL @1070	;1066 10 08
	LDAB L_1024	;1068 83 BA
	BZ @1070	;106A 14 04
	JSR L_0cac	;106C 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $41		;106F 41
@1070:	???		;1070 2A
	STAB ??L_1024	;1071 A3 B1
	POP AH,2	;1073 7F 01
	SRA		;1075 3C
	LDB #L_10af	;1076 D0 10 AF fixupWord
	AAB		;1079 58
	LDA (BW)	;107A 99
	BNZ L_1081	;107B 15 04
L_107d:	JSR L_0de3	;107D 79 0D E3 fixupWord
	DB 4		;1080 04
L_1081:	JMP (AW)	;1081 75 00

E_1083: ; start next command
	CLAB		;1083 2A
L_1084:	STAB #0		;1084 A0 00
L_1086:	LDAB #0		;1086 80 00
	BZ @1098	;1088 14 0E
	STAB L_1084+1	;108A A3 F9
	CLAB		;108C 2A
	STAB L_1086+1	;108D A3 F8
	LDA L_1353	;108F 91 13 53 fixupWord
	LDB L_0900	;1092 D1 09 00 fixupWord
	JSR L_0dae	;1095 79 0D AE fixupWord
@1098:	LDAB (ZW+)	;1098 85 81
	BNZ @109f	;109A 15 03
@109C:	JMP L_1007	;109C 71 10 07 fixupWord

@109F:	LDBB #$a1	;109F C0 A1
	SABB		;10A1 49
	BZ @109c	;10A2 14 F8
	LDBB #$ba	;10A4 C0 BA
	SABB		;10A6 49
	BNZ @10ac	;10A7 15 03
	JMP L_1013	;10A9 71 10 13 fixupWord

@10AC:	JSR (L_107d+1)	;10AC 7C D0	L_0de3
	DB $e		;10AE 0E

L_10af: ; command table (matches codes in 19f2)
	DW 0		;10AF 00 00		00
	DW L_147E	;10B1 14 7E  fixupword	01 Data
	DW L_1637	;10B3 16 37  fixupword	02 Open
	DW L_11E5	;10B5 11 E5  fixupword	43 Def
	DW L_1298	;10B7 12 98  fixupword	44 Dim
	DW L_0E2E	;10B9 0E 2E  fixupword	45 End
	DW L_139D	;10BB 13 9D  fixupword	06 For
	DW L_1338	;10BD 13 38  fixupword	07 Gosub
	DW L_1340	;10BF 13 40  fixupword	08 Goto
	DW L_1349	;10C1 13 49  fixupword	09 If
	DW L_1526	;10C3 15 26  fixupword	0a Input
	DW L_14FF	;10C5 14 FF  fixupword	0b Let
	DW L_1455	;10C7 14 55  fixupword	0c ??
	DW L_15C0	;10C9 15 C0  fixupword	0d Print
	DW L_1518	;10CB 15 18  fixupword	0e Read
	DW L_1007	;10CD 10 07  fixupword	4f Rem
	DW L_14C9	;10CF 14 C9  fixupword	50 Return
	DW L_14DE	;10D1 14 DE  fixupword	51 Stop
	DW L_15C0	;10D3 15 C0  fixupword	12 Write
	DW L_1657	;10D5 16 57  fixupword	13 Close
	DW L_14C3	;10D7 14 C3  fixupword	14 Restore
	DW L_12E8	;10D9 12 E8  fixupword	15 On
	DW L_11AE	;10DB 11 AE  fixupword	56 FnEnd
	DW L_1133	;10DD 11 33  fixupword	57 Format
	DW L_1129	;10DF 11 29  fixupword	18 Call
	DW L_1B48	;10E1 1B 48  fixupword	59 File
	DW L_1CC6	;10E3 1C C6  fixupword	5a Record
	DW L_18CA	;10E5 18 CA  fixupword	1b Cursor
	DW L_1890	;10E7 18 90  fixupword	1c Hold
	DW L_1895	;10E9 18 95  fixupword	1d Free
	DW L_15BA	;10EB 15 BA  fixupword	1e Output
	DW L_15B4	;10ED 15 B4  fixupword	1f Rewrite
	DW L_1876	;10EF 18 76  fixupword	20 NextLote
	DW L_187A	;10F1 18 7A  fixupword	21 Point
	DW L_18BB	;10F3 18 BB  fixupword	22 GetKey
	DW L_18C0	;10F5 18 C0  fixupword	23 NewKey
	DW L_1256	;10F7 12 56  fixupword	64 Declare
	DW L_1271	;10F9 12 71  fixupword	65 Local
	DW L_189A	;10FB 18 9A  fixupword	26 NextKey
	DW L_110D	;10FD 11 0D  fixupword	27 LineLength
	DW L_111F	;10FF 11 1F  fixupword	68 Chain
	DW L_1118	;1101 11 18  fixupword	29 Randomize
	DW L_136F	;1103 13 6F  fixupword	2a Else
	DW L_18C5	;1105 18 C5  fixupword	2b DltKey
	DW L_1669	;1107 16 69  fixupword	2c Move
	DW L_18EF	;1109 18 EF  fixupword	2d PJP
	DW L_18FF	;110B 18 FF  fixupword	2e Pupsi

E_110D: ; LineLength
	JSR L_0b2f	;110D 79 0B 2F fixupWord	is text char a number? (consume if true)
	LDA (YW+)	;1110 95 61
	STA L_0911	;1112 B1 09 11 fixupWord
	JMP L_1083	;1115 71 10 83 fixupWord

E_1118: ; Randomize
	JSR L_0cac	;1118 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $3b		;111B 3B
	JMP L_1083	;111C 71 10 83 fixupWord

E_111F: ; Chain
	JSR L_1679	;111F 79 16 79 fixupWord
	JSR L_0cac	;1122 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $3a		;1125 3A
	JMP L_1083	;1126 71 10 83 fixupWord

E_1129: ; Call
	JSR L_1679	;1129 79 16 79 fixupWord
	JSR L_0cac	;112C 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $2c		;112F 2C
	JMP L_1083	;1130 71 10 83 fixupWord

E_1133: ; Format
	JSR (L_112d)	;1133 7C F8	E_0cac	 write inline byte | $80 to object file???
	DB 2		;1135 02
	LDA L_0900	;1136 91 09 00 fixupWord
	STA (-SW)	;1139 B5 A2
	JSR L_0cc2	;113B 79 0C C2 fixupWord
L_113E:	STX (-SW)	;113E 6D A2
	LDX #L_11a2	;1140 60 11 A2 fixupWord
	LDAB (ZW+)	;1143 85 81
L_1145:	INX		;1145 3E
	LDBB (XW+)	;1146 C5 41
	BNZ L_1150	;1148 15 06
	DCR ZW,1	;114A 31 80
	JSR L_0de3	;114C 79 0D E3 fixupWord
	DB $14		;114F 14
	???		;1150 49
	BNZ L_1145	;1151 15 F2
	JSR L_0baa	;1153 79 0B AA fixupWord	skip spaces in text
	LDAB (XW)	;1156 8A
	JSR L_0ccc	;1157 79 0C CC fixupWord
	LDAB (XW)	;115A 8A
	LDX (SW+)	;115B 65 A1
	DCAB		;115D 29
	BZ L_1188	;115E 14 28
	LDBB #$04	;1160 C0 04
	SABB		;1162 49
	BNZ L_117a	;1163 15 15
E_1165:	JSR E_0b81	;1165 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;1168 AC
	DB 1		;1169 01
	BNZ L_113e	;116A 15 D2
L_116C:	CLAB		;116C 2A
L_116D:	JSR (L_1158)	;116D 7C E9
	LDA (SW+)	;116F 95 A1
	LDB L_0900	;1171 D1 09 00 fixupWord
L_1174:	JSR L_0dae	;1174 79 0D AE fixupWord
	JMP L_1083	;1177 71 10 83 fixupWord

L_117A:	JSR L_117e	;117A 7B 02
	JMP L_1165	;117C 73 E7

L_117E:	JSR L_0b2f	;117E 79 0B 2F fixupWord	is text char a number? (consume if true)
	BZ L_1185	;1181 14 02
	LDA (YW+)	;1183 95 61
L_1185:	JSR (L_1158)	;1185 7C D1
	RSR	;1187 09

L_1188:	JSR (L_1166)	;1188 7C DC
	STAB (SW)	;118A AD
	NOP	;118B 01
	STAB (-SW)	;118C A5 A2
	JSR L_117e	;118E 7B EE
	JSR (L_1166)	;1190 7C D4
	STAB (CW)	;1192 AE
	NOP	;1193 01
	JSR L_117e	;1194 7B E8
	JSR (L_1166)	;1196 7C CE
	STAB (SW)	;1198 AD
	SF	;1199 02
L_119A:	BZ L_119d	;119A 14 01
	STAB (SW)	;119C AD
L_119D:	LDAB (SW+)	;119D 85 A1
	JSR (L_1158)	;119F 7C B7
	JMP L_1165	;11A1 73 C2

	DB CE ; N	;11A3 CE
	DB 1		;11A4 01
	DB C3 ; C	;11A5 C3
	DB 2		;11a5 02
	DB D8 ; X	;11A7 D8
	DB 3		;11A8 03
	DB D4 ; T	;11A9 D4
	DB 4		;11aa 04
	DB AF ; /	;11AB AF
	DB 5		;11AC 05
	DB 0		;11AD 00	end of list

E_11AE: ; FnEnd
	LDA L_11e9	;11AE 93 39
	BZ L_11ed	;11B0 14 3B
	LDA (L_11f4)	;11B2 94 40
	JSR L_0cc2	;11B4 79 0C C2 fixupWord
@11b7:	JSR L_0cac	;11B7 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $16		;11BA 16
	JSR (@11b7+1)	;11bb 7C FB	E_0cac	 write inline byte | $80 to object file???
	DB $1c		;11BD 1C
	LDA ???		;11BE 93 29
	INR AW,2	;11C0 30 01
	XAB		;11C2 5D
	LDA L_11f4	;11C3 93 2F
	STB 2(AW)	;11C5 F5 08 02
L_11C8:	LDA L_11e9	;11C8 93 1F
	LDB L_0900	;11CA D1 09 00 fixupWord
	JSR L_0dae	;11CD 79 0D AE fixupWord
	LDA (L_11f4)	;11D0 94 22
	LDB #$4000	;11D2 D0 40 00
	AAB		;11D5 58
	LDA #$7000	;11D6 90 70 00
	NAB		;11D9 5A
	STB (L_11f4)	;11DA F4 18
	JSR L_093f	;11DC 79 09 3F fixupWord
	CLA		;11DF 3A
	STA L_11e9	;11E0 B3 07
	JMP L_1083	;11E2 71 10 83 fixupWord

E_11E5: ; Def
	JSR (L_11b8)	;11E5 7C D1
	SF	;11E7 02
	LDA #L_0000	;11E8 90 00 00
	BZ L_11f6	;11EB 14 09
L_11ED:	CLA	;11ED 3A
	STA L_11e9	;11EE B3 F9
	JSR L_0de3	;11F0 79 0D E3 fixupWord
	DB $16		;11F3 16
	???		;11f4 00
L_11F6:	STX (-SW)	;11F6 6D A2
	XAX	;11F8 5B
	LDB L_0900	;11F9 D1 09 00 fixupWord
	STB L_11e9	;11FC F3 EB
	JSR (L_11b5)	;11FE 7C B5
	JSR L_1225	;1200 7B 23
	LDA (YW+)	;1202 95 61
	STA L_11f4	;1204 B3 EE
	LDB 4(AW)	;1206 D5 08 04
	LDBB #4		;1209 C0 04
	ORIB BL,BH	;120B 43 23
	STBB 4(AW)	;120D E5 08 04
L_1210:	JSR E_0b81	;1210 79 0B 81 fixupWord	compare text with inline
	DB '('+$80	;1213 A8
	DB 1		;1214 01
	BZ L_122a	;1215 14 13
L_1217:	JSR L_1225	;1217 7B 0C
	INX		;1219 3E
	JSR (L_1210+1)	;121A 7C F5	E_0b81	compare text with inline
	DB ','+$80	;121C AC
	DB 1		;121D 01
	BNZ L_1217	;121E 15 F7
	JSR L_0bb4	;1220 79 0B B4 fixupWord
	JMP L_122a	;1223 73 05

L_1225:	JSR L_128b	;1225 7B 64
	BNZ L_11ed	;1227 15 C4
	RSR		;1229 09

E_122A:	XFR AW,XW	;122A 55 40
	JSR L_0cc2	;122C 79 0C C2 fixupWord
E_122F:	DCX	;122F 3F
	BM L_1245	;1230 16 13
	LDA @(YW)	;1232 95 64
	JSR (L_122d)	;1234 7C F7
	LDB (YW)	;1236 DB
	LDBB 04(BW)	;1237 C5 28 04
	LDAB #$02	;123A 80 02
	ORIB BL,AL	;123C 43 13
	LDA (YW+)	;123E 95 61
	STBB 04(AW)	;1240 E5 08 04
	JMP L_122f	;1243 73 EA

L_1245:	LDX (SW+)	;1245 65 A1
	JSR (L_1210+1)	;1247 7C C8	E_0b81	compare text with inline
	DB '='+$80	;1249 BD
	DB 1		;124A 01
	BNZ L_1250	;124B 15 03
	JMP L_1083	;124D 71 10 83 fixupWord

L_1250:	JSR L_1679	;1250 79 16 79 fixupWord
	JMP L_11bb	;1253 71 11 BB fixupWord

E_1256: ; Declare
	STX (-SW)	;1256 6D A2
L_1258:	JSR L_128b	;1258 7B 31
	LDX (YW+)	;125A 65 61
	LDAB 04(XW)	;125C 85 48 04
	LDBB #$04	;125F C0 04
	ORIB BL,AL	;1261 43 13
	STBB 04(XW)	;1263 E5 48 04
	JSR (L_1210+1)	;1266 7C A9	E_0b81	compare text with inline
	DB ','+$80	;1268 AC
	DB 1		;1269 01
	BNZ L_1258	;126A 15 EC
E_126C:	LDX (SW+)	;126C 65 A1
	JMP L_1083	;126E 71 10 83 fixupWord

E_1271: ; Local
	STX (-SW)	;1271 6D A2
L_1273:	JSR L_128b	;1273 7B 16
	BNZ L_129c	;1275 15 25
	LDX (YW+)	;1277 65 61
	LDAB 04(XW)	;1279 85 48 04
	LDBB #$06	;127C C0 06
	ORIB BL,AL	;127E 43 13
	STBB 04(XW)	;1280 E5 48 04
	JSR (L_1210+1)	;1283 7C 8C	E_0b81	compare text with inline
	DB ','+$80	;1285 AC
	DB 1		;1286 01
	BNZ L_1273	;1287 15 EA
	JMP L_126c	;1289 73 E1


E_128B: ; get label name text???
	JSR E_0966	;128B 79 09 66 fixupWord	get a name from text
	BNZ L_1294	;128E 15 04			  if found, goto
L_1290:	JSR L_0de3	;1290 79 0D E3 fixupWord
	DB $14		;1293 14
L_1294:	JSR E_098B	;1294 79 09 8B  fixupword
	RSR		;1297 09


E_1298: ; Dim command
	JSR L_128b	;1298 7B F1
	BZ L_129f	;129A 14 03
L_129C:	JSR (L_1291)	;129C 7C F3
	CL	;129E 08
L_129F:	JSR E_0b81	;129F 79 0B 81 fixupWord	compare text with inline
	DB '('+$80	;12A2 A8
	DB 1		;12A3 01
	BZ L_1290	;12A4 14 EA
	JSR L_0b2f	;12A6 79 0B 2F fixupWord	is text char a number? (consume if true)
	BZ L_1290	;12A9 14 E5
	LDA (YW+)	;12AB 95 61
	BLE L_1290	;12AD 19 E1
	STA (-SW)	;12AF B5 A2
	LDB (YW)	;12B1 DB
	CLA	;12B2 3A
	STA 02(BW)	;12B3 B5 28 02
	JSR (L_12a0)	;12B6 7C E8
	STAB (ZW)	;12B8 AC
	NOP	;12B9 01
	BZ L_12d0	;12BA 14 14
	JSR L_0b2f	;12BC 79 0B 2F fixupWord	is text char a number? (consume if true)
	BZ L_1290	;12BF 14 CF
	LDA (YW+)	;12C1 95 61
	BLE L_1290	;12C3 19 CB
	LDB (YW)	;12C5 DB
	STA 02(BW)	;12C6 B5 28 02
	LDB (SW)	;12C9 DD
	ADD AW,BW	;12CA 77 20
L_12CC:	STB (SW)	;12CC FD
	XAB	;12CD 5D
	BNZ L_1290	;12CE 15 C0
L_12D0:	LDB (YW+)	;12D0 D5 61
	LDA (BW)	;12D2 99
	LDB (SW+)	;12D3 D5 A1
	DCR BW,1	;12D5 31 20
	JSR L_0bde	;12D7 79 0B DE fixupWord
	JSR L_0bb4	;12DA 79 0B B4 fixupWord
	JSR (L_12a0)	;12DD 7C C1
	STAB (ZW)	;12DF AC
	NOP	;12E0 01
L_12E1:	BZ L_12e5	;12E1 14 02
	JMP L_1298	;12E3 73 B3

L_12E5:	JMP L_1083	;12E5 71 10 83 fixupWord

E_12E8: ; On
	JSR L_1679	;12E8 79 16 79 fixupWord
	JSR (L_12a0)	;12EB 7C B3
	DB 'G'+$80	;12ED C7
	DB 'O'+$80	;12EE CF
	DB 'S'+$80	;12EF D3
	DB 'U'+$80	;12f0 D5
	DB 'B'+$80	;12F1 C2
	DB 1		;12f2 01
	BZ @12fb	;12f3 14 06
	JSR L_0cac	;12F5 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $3c		;12F8 3C
	JMP L_1308	;12F9 73 0D

@12FB:	JSR (L_12a0)	;12FB 7C A3
	DB 'G'+$80	;12FD C7
	DB 'O'+$80	;12FE CF
	DB 'T'+$80	;12FF D4
	DB 'O'+$80	;1300 CF
	DB 1		;1301 01
	BZ L_1290	;1302 14 8C
	JSR L_0cac	;1304 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 7		;1307 07

L_1308:	STX (-SW)	;1308 6D A2
	CLA		;130A 3A
	XAX		;130B 5B
	LDB L_0900	;130C D1 09 00 fixupWord
	STB (-SW)	;130F F5 A2
	JSR L_0cc2	;1311 79 0C C2 fixupWord
@1314:	JSR L_1329	;1314 7B 13
	INX		;1316 3E
	JSR (L_12a0)	;1317 7C 87
	STAB? (ZW)	;1319 AC
	NOP?		;131A 01
	BNZ @1314	;131B 15 F7
	LDA (SW+)	;131D 95 A1
	XFR BW,XW	;131F 55 42
	JSR L_0dae	;1321 79 0D AE fixupWord
	LDX (SW+)	;1324 65 A1
	JMP L_1083	;1326 71 10 83 fixupWord

L_1329:	JSR L_0b2f	;1329 79 0B 2F fixupWord	is text char a number? (consume if true)
	BNZ @1332	;132C 15 04
	JSR L_0de3	;132E 79 0D E3 fixupWord
	DB $0B		;1331 0B
@1332:	LDA (YW+)	;1332 95 61
L_1334:	JSR L_0cc2	;1334 79 0C C2 fixupWord
	RSR		;1337 09


E_1338: ; Gosub command
	JSR L_1679	;1338 79 16 79 fixupWord
	JSR (L_1305)	;133B 7C C8	L_0cac	 write inline byte | $80 to object file???
	DB $1b		;133D 1B
	JMP L_1346	;133e 73 06	L_1083


E_1340: ; Goto command
	JSR L_1679	;1340 79 16 79 fixupWord
	JSR (L_1305)	;1343 7C C0	L_0cac	 write inline byte | $80 to object file???
	DB $1A		;1345 1A
L_1346:	JMP L_1083	;1346 71 10 83  fixupword


E_1349: ; If
	JSR L_1679	;1349 79 16 79 fixupWord
	JSR (L_1305)	;134C 7C B7	L_0cac	 write inline byte | $80 to object file???
	DB $19		;134E 19
	LDA L_0900	;134f 91 09 00  fixupword
	STA #0		;1352 B0 00 00
	JSR (L_1334+1)	;1355 7C DE	skip text to next statement
	LDAB #1		;1357 80 01
	STAB L_1086+1	;1359 A1 10 87 fixupWord
@135C:	LDAB (ZW)	;135C 8C
	JSR E_0b66	;135D 79 0B 66 fixupWord	is char in AL a number?
	BP L_1340	;1360 17 DE	Goto command
	JSR E_0b81	;1362 79 0B 81 fixupWord	compare text with inline
	DB 'T'+$80	;1365 D4
	DB 'H'+$80	;1366 C8
	DB 'E'+$80	;1367 C5
	DB 'N'+$80	;1368 CE
	DB 1		;1369 01
	BNZ @135c	;136A 15 F0
	JMP L_1013	;136C 71 10 13 fixupWord

E_136F: ; Else
	LDAB L_1084+1	;136F 81 10 85 fixupWord
	BGZ @1378	;1372 18 04
	JSR L_0de3	;1374 79 0D E3 fixupWord
	DB $1e		;1377 1E
@1378:	LDB L_0900	;1378 D1 09 00  fixupword
	LDA #3		;137B 90 00 03
	AAB		;137E 58
	LDA L_1353	;137F 93 D2
	JSR L_0dae	;1381 79 0D AE fixupWord
	JSR L_0cac	;1384 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 2		;1387 02
	LDA L_0900	;1388 91 09 00 fixupWord
	STA L_1353	;138B B3 C6
	JSR (L_1334+1)	;138D 7C A6	skip text to next statement
	LDAB #$ff	;138F 80 FF
	STAB L_1086+1	;1391 A1 10 87 fixupWord
	LDAB (ZW)	;1394 8C
	JSR E_0b66	;1395 79 0B 66 fixupWord	is char in AL a number?
	BP L_1340	;1398 17 A6	Goto command
	JMP L_1013	;139A 71 10 13 fixupWord


E_139D: ; For command
	JSR L_128b	;139D 79 12 8B fixupWord
	LDA @(YW)	;13A0 95 64
	STA (YW)	;13A2 BB
	JSR (L_1334+1)	;13A3 7C 90	skip text to next statement
	JSR E_0b81	;13A5 79 0B 81 fixupWord	compare text with inline
	DB '='+$80	;13A8 BD
	DB 1		;13A9 01
	BNZ L_13b0	;13AA 15 04
@13AC:	JSR L_0de3	;13AC 79 0D E3 fixupWord
	DB $14		;13AF 14
	JSR L_1679	;13b0 79 16 79  fixupword
	JSR L_0cac	;13B3 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $17		;13B6 17
	LDA #$1000	;13b7 90 10 00
	LDB #2		;13BA D0 00 02
	JSR L_0bde	;13BD 79 0B DE fixupWord
	STA (-SW)	;13C0 B5 A2
	JSR L_0cc2	;13C2 79 0C C2 fixupWord
	JSR E_0b81	;13C5 79 0B 81 fixupWord	compare text with inline
	DB 'T'+$80	;13C8 D4
	DB 'O'+$80	;13c9 CF
	DB 1		;13CA 01
	BZ @13ac	;13CB 14 DF
	JSR L_1679	;13CD 79 16 79 fixupWord
	JSR (L_13b4)	;13D0 7C E2
	BP L_1371	;13D2 17 9D
	INA		;13D4 38
	JSR (L_13c3)	;13D5 7C EC	L_0cc2
	JSR (L_13c6)	;13D7 7C ED	E_0b81	compare text with inline
	DB 'S'+$80	;13D9 D3
	DB 'T'+$80	;13da D4
	DB 'E'+$80	;13DB C5
	DB 'P'+$80	;13dc D0
	DB 1		;13DD 01
	BNZ @13ea	;13DE 15 0A
	JSR (L_13b4)	;13E0 7C D2	L_0cac	 write inline byte | $80 to object file???
	DB 4		;13E2 04
	CLA		;13E3 3A
	INA		;13E4 38
	JSR L_0cc2	;13E5 79 0C C2 fixupWord
	JMP @13ed	;13E8 73 03

@13EA:	JSR L_1679	;13EA 79 16 79 fixupWord
@13ED:	JSR (L_13b4)	;13ED 7C C5	L_0cac	 write inline byte | $80 to object file???
	DB $17		;13EF 17
	LDA (YW)	;13f0 9B
	JSR (L_13e6)	;13F1 7C F3	L_0cc2
	LDA (YW)	;13F3 9B
	JSR L_1439	;13F4 7B 43
	JSR (L_13b4)	;13F6 7C BC	L_0cac	 write inline byte | $80 to object file???
	DB 2		;13F8 02
	LDA #$b		;13F9 90 00 0B
	LDB L_0900	;13FC D1 09 00 fixupWord
	ADD AW,BW	;13FF 50 20
	JSR (L_13e6)	;1401 7C E3
	JSR L_0c27	;1403 79 0C 27 fixupWord
	LDA (YW)	;1406 9B
	JSR (L_13e6)	;1407 7C DD
	LDA (YW+)	;1409 95 61
	JSR L_1439	;140B 7B 2C
	LDA (SW)	;140D 9D
	INA		;140E 38
	JSR L_1439	;140F 7B 28
	JSR (L_13b4)	;1411 7C A1	L_0cac	 write inline byte | $80 to object file???
	DB $d		;1413 0D
	LDA (SW)	;1414 9D
	JSR L_1439	;1415 7B 22
	LDA (SW+)	;1417 95 A1
	INA		;1419 38
	JSR L_1439	;141A 7B 1D
	JSR (L_13b4)	;141C 7C 96	L_0cac	 write inline byte | $80 to object file???
	DB $15		;141E 15
	JSR L_0C27	;141F 79 0C 27  fixupword
	JSR (???)	;1422 7C A2
	DB D7 ;W	;1424 D7
	DB C8 ;H	;1425 C8
	DB C9 ;I	;1426 C9
	DB CC ;L	;1427 CC
	DB C5 ;E	;1428 C5
	DB 1		;1429 01
	BNZ L_1440	;142A 15 14
	JSR L_0c27	;142C 79 0C 27 fixupWord
	CLA		;142F 3A
	JSR (L_13e6)	;1430 7C B4
	JSR L_0cac	;1432 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $17		;1435 17
	JMP L_1083	;1436 71 10 83  fixupword

E_1439:	JSR L_0cc2	;1439 79 0C C2 fixupWord
	JSR (L_1433)	;143C 7C F5	L_0cac	 write inline byte | $80 to object file???
	DB $16		;143E 16
	RSR		;143f 09

L_1440:	CLA		;1440 3A
	JSR (L_143a)	;1441 7C F7
	JSR (L_1433)	;1443 7C EE
	DB $d		;1445 0D
	JSR L_1679	;1446 79 16 79 fixupWord
	JSR (L_1433)	;1449 7C E8
	DB $19		;144B 19
	JSR L_0C27	;144C 79 0C 27  fixupword
	DB $3A		;144F 3A
	JSR (L_143a)	;1450 7C E8
	JMP L_1083	;1452 71 10 83 fixupWord

E_1455: ; ??
	JSR E_0966	;1455 79 09 66 fixupWord	get a name from text
	JSR L_0cac	;1458 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $18		;145B 18
	JSR L_0C3C	;145c 79 0C 3C  fixupword
	STA (-SW)	;145F B5 A2
	JSR L_0c3c	;1461 79 0C 3C fixupWord
	STA (-SW)	;1464 B5 A2
	JSR L_0c3c	;1466 79 0C 3C fixupWord
	JSR (L_143a)	;1469 7C CF
	LDA (SW+)	;146B 95 A1
	LDB L_0900	;146D D1 09 00 fixupWord
	JSR L_0dae	;1470 79 0D AE fixupWord
	LDA (SW+)	;1473 95 A1
	LDB L_0900	;1475 D1 09 00 fixupWord
	JSR L_0dae	;1478 79 0D AE fixupWord
	JMP L_1083	;147B 71 10 83 fixupWord

E_147E: ; Data
	JSR (L_1459)	;147E 7C D9	E_0cac	 write inline byte | $80 to object file???
	DB 2		;1480 02
	STX (-SW)	;1481 6D A2
	XFR XW,ZW	;1483 55 84
	CLA		;1485 3A
@1486:	INA		;1486 38
	LDBB (XW+)	;1487 C5 41
	BNZ @1486	;1489 15 FB
	XAX		;148B 5B
	INR AW,2	;148C 30 01
	INR AW,2	;148E 30 01
	LDB L_0900	;1490 D1 09 00 fixupWord
	ADD AW,BW	;1493 50 20
	JSR (L_143a)	;1495 7C A3
	LDB L_0900	;1497 D1 09 00 fixupWord
	LDA L_090a	;149A 91 09 0A fixupWord
	BNZ @14a4	;149D 15 05
	STB L_090a	;149F F1 09 0A fixupWord
	JMP @14aa	;14A2 73 06

@14A4:	LDA #0		;14A4 90 00 00
	JSR L_0dae	;14A7 79 0D AE fixupWord
@14AA:	LDAB (ZW+)	;14AA 85 81
	JSR L_0ccc	;14AC 79 0C CC fixupWord
	DCX		;14AF 3F
	BGZ @14aa	;14B0 18 F8
	LDA L_0900	;14B2 91 09 00 fixupWord
	STA L_14a5	;14B5 B1 14 A5 fixupWord
	CLA		;14B8 3A
	JSR L_0cc2	;14B9 79 0C C2 fixupWord
	LDX (SW+)	;14BC 65 A1
	DCR ZW,1	;14BE 31 80
	JMP L_1083	;14C0 71 10 83 fixupWord

E_14C3: ; Restore
	JSR (L_1459)	;14C3 7C 94	E_0cac	 write inline byte | $80 to object file???
	DB 6		;14C5 06
L_14C6:	JMP L_1083	;14C6 71 10 83 fixupWord

E_14C9: ; Return
	LDA L_11e9	;14C9 91 11 E9 fixupWord
	BZ L_14d8	;14CC 14 0A
	LDA (L_11f4)	;14CE 92 11 F4 fixupWord
	JSR L_0cc2	;14D1 79 0C C2 fixupWord
@14d4:	JSR L_0cac	;14D4 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $16		;14D7 16
	JSR (@14d4+1)	;14d8 7C FB	E_0cac	 write inline byte | $80 to object file???
	DB $1c		;14DA 1C
	JMP L_1083	;14db 71 10 83  fixupword

E_14DE: ; Stop
	LDAB (ZW)	;14DE 8C
	BZ @14eb	;14DF 14 0A
	LDB #$baa1	;14E1 D0 BA A1
	SABB		;14E4 49
	BZ @14eb	;14E5 14 04
	SUBB BH,AL	;14E7 41 12
	BNZ L_14f6	;14E9 15 0B
@14EB:	JSR L_0cac	;14EB 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 4		;14EE 04
	CLA		;14EF 3A
	IVA		;14F0 3B
	JSR L_0cc2	;14F1 79 0C C2 fixupWord
	JMP L_14f9	;14F4 73 03

L_14F6:	JSR L_1679	;14F6 79 16 79 fixupWord
E_14F9:	JSR (L_14ec)	;14F9 7C F1	E_0cac	 write inline byte | $80 to object file???
	DB $1d		;14FB 1D
	JMP L_1083	;14fc 71 10 83  fixupword

E_14FF: ; Let
	JSR L_1780	;14FF 79 17 80 fixupWord
	BNZ L_1508	;1502 15 04
L_1504:	JSR L_0de3	;1504 79 0D E3 fixupWord	modified?
	DB 2		;1507 02
L_1508:	JSR E_0b81	;1508 79 0B 81 fixupWord	compare text with inline
	DB '='+$80		;150B BD
	DB 1		;150C 01
	BZ L_1504	;150D 14 F5
	JSR L_1679	;150F 79 16 79 fixupWord
	JSR (L_14ec)	;1512 7C D8	E_0cac	 write inline byte | $80 to object file???
	DB $17		;1514 17
	JMP L_1083	;1515 71 10 83  fixupword

E_1518: ; Read
	JSR L_1545	;1518 7B 2B
	BZ L_152a	;151A 14 0E
	LDAB (ZW)	;151C 8C
	LDBB #$a3	;151D C0 A3
	SABB		;151F 49
	BZ L_152d	;1520 14 0B
	LDAB #$29	;1522 80 29
	JMP L_1533	;1524 73 0D

E_1526: ; Input
	JSR L_1545	;1526 7B 1D
	BNZ L_152d	;1528 15 03
L_152A:	JMP L_1083	;152A 71 10 83 fixupWord

L_152D:	JSR L_184c	;152D 79 18 4C fixupWord
	DB $1e		;1530 1E
	LDAB #$1f	;1531 80 1F
	STAB @153c	;1534 A3 07
@1535:	JSR L_1780	;1535 79 17 80 fixupWord
	BZ L_156d	;1538 14 33
	JSR (L_14ec)	;153A 7C B0	E_0cac	 write inline byte | $80 to object file???
@153c:	DB 0		;153C 00
	JSR (L_1509)	;153D 7C CA	E_0b81	compare text with inline
	DB ','+$80	;153F AC
	DB 1		;1540 01
	BNZ @1535	;1541 15 F2
	JMP L_152a	;1543 73 E5

L_1545:	LDAB (ZW)	;1545 8C
	LDB #L_a2a7	;1546 D0 A2 A7
	SABB	;1549 49
	BZ L_1550	;154A 14 04
	SUBB BH,AL	;154C 41 12
	BNZ L_155c	;154E 15 0C
L_1550:	JSR (L_152e)	;1550 7C DC
	DCRB YL,10	;1552 21 79
	DW L_1679	;1554 16 79  fixupword
	JSR (L_14ec)	;1556 7C 94
	SRRB YL,13	;1558 24 7C
	LDA L_267c	;155A 91 26 7C
	STAB (YW)	;155D AB
	LDBB? (ZW)	;155E CC
	LDBB (BW)	;155F C9
	LDBB (CW)	;1560 CE
	LDBB (AW+)	;1561 C5 01
	BZ L_1576	;1563 14 11
	JSR (L_152e)	;1565 7C C7
	BI L_15e2	;1567 1E 79
	DW L_1780	;1569 17 80  fixupword
	BNZ L_1570	;156B 15 03
L_156D:	JSR (L_1505)	;156D 7C 96
	DB $14		;156F 14
	JSR L_0CAC	;1570 79 0C AC  fixupword	 write inline byte | $80 to object file???
	DB $20		;1573 20
	???		;1574 2A
	RSR		;1575 09

L_1576:	JSR (L_1509)	;1576 7C 91	E_0b81	compare text with inline
	DB 'R'+$80	;1578 D2
	DB 'E'+$80	;1579 C5
	DB 'C'+$80	;157a C3
	DB 'O'+$80	;157B CF
	DB 'R'+$80	;157C D2
	DB 'D'+$80	;157d C4
	DB 1		;157e 01
	BNZ @1584	;157F 15 03
	LDAB #1		;1581 80 01
	RSR		;1583 09

@1584:	LDAB #$2d	;1584 80 2D
	JSR L_158a	;1586 7B 02
	CLAB		;1588 2A
	RSR		;1589 09

L_158A:	STAB L_158e	;158A A3 02
	JSR (L_152e)	;158C 7C A0	 L_184c
	DB 0		;158E 00
	JSR E_0b81	;158F 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;1592 AC
	DB 1		;1593 01
L_1594:	JSR E_0966	;1594 79 09 66 fixupWord	get a name from text
	BZ L_156d	;1597 14 D4
	LDA L_09c2+1	;1599 91 09 C3 fixupWord
	LDB #L_8000	;159C D0 80 00
	ORI BW,AW	;159F 53 02
	STB (L_159a)	;15A1 F4 F7
	JSR E_098b	;15A3 79 09 8B fixupWord
	BNZ L_15ac	;15A6 15 04
	JSR L_0de3	;15A8 79 0D E3 fixupWord
	DB $1a		;15AB 1A
	???		;15ac DB
	LDA 02(BW)	;15AD 95 28 02
	JSR L_0cc2	;15B0 79 0C C2 fixupWord
	RSR	;15B3 09

E_15B4: ; ReWrite
	LDAB #$33	;15B4 80 33
	LDBB #$34	;15B6 C0 34
	JMP L_15c4	;15B8 73 0A

E_15BA: ; Output
	LDAB #$26	;15BA 80 26
	LDBB #$2e	;15BC C0 2E
	JMP L_15c4	;15BE 73 04

E_15C0: ; Print Write
	LDAB #$25	;15C0 80 25
	LDBB #$2e	;15C2 C0 2E
E_15C4:	STAB L_161d	;15C4 A3 57
	STBB L_15df	;15C6 E3 17
	JSR E_0b81	;15C8 79 0B 81 fixupWord	compare text with inline
	DB 'U'+$80	;15CB D5
	DB 'S'+$80	;15cc D3
	DB 'I'+$80	;15CD C9
	DB 'N'+$80	;15CE CE
	DB 'G'+$80	;15CF C7
	DB 1		;15D0 01
	BNZ L_1621	;15D1 15 4E
	JSR (L_15c9)	;15D3 7C F4
	LDB (L_c5c3)	;15D5 D2 C5 C3
	LDBB (PW)	;15D8 CF
	LDB (L_c401)	;15D9 D2 C4 01
	BZ L_15e4	;15DC 14 06
	LDAB #$00	;15DE 80 00
	JSR L_158a	;15E0 7B A8
L_15E2:	JMP L_161e	;15E2 73 3A

L_15E4:	CLAB	;15E4 2A
	STAB L_160a	;15E5 A3 23
	JSR L_184c	;15E7 79 18 4C fixupWord
L_15EA:	DCRB ZH,13	;15EA 21 8C
	BZ L_1616	;15EC 14 28
	LDB #L_a1ba	;15EE D0 A1 BA
	SABB	;15F1 49
	BZ L_1616	;15F2 14 22
	SUBB BH,AL	;15F4 41 12
	BZ L_1616	;15F6 14 1E
L_15f8:	JSR E_0b81	;15F8 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;15FB AC
	DB $22		;15FC 22
	BNZ L_1605	;15fd 15 06
	JSR (L_15f8+1)	;15FF 7C F8	E_0b81	compare text with inline
	DB ';'+$80	;1601 BB
	DB $23		;1602 23
	BZ ???		;1603 14 08
L_1605:	STAB L_160a	;1605 A3 03
	JSR L_0cac	;1607 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 0		;160A 00
	JMP L_15eb	;160B 73 DE

L_160D:	STAB L_160a	;160D A3 FB
	JSR L_1679	;160F 7B 68
	JSR (L_1608)	;1611 7C F5
	SRRB YL,4	;1613 24 73
	LDB (ZW]	;1615 D5 83
	STB (L_1504??)	;1617 F2 15 04
E_161A:	JSR L_0cac	;161A 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $25		;161D 25
	JMP L_1083	;161e 71 10 83  fixupword

L_1621:	JSR (L_161a+1)	;1621 7C F8	L_0cac	 write inline byte | $80 to object file???
	DB $2a		;1623 2A
	JSR L_1329	;1624 79 13 29 fixupWord
	JSR (L_15e8)	;1627 7C BF
	DCRB YL,12	;1629 21 7B
	XABB		;162B 4D
	JSR (L_161a+!)	;162C 7C ED	L_0cac	 write inline byte | $80 to object file???
	DB $2b		;162E 2B
	JSR (L_15f8+1)	;162F 7C C8	E_0b81	compare text with inline
	DB ','+$80	;1631 AC
	DB 1		;1632 01
	BNZ L_162a	;1633 15 F5
	JMP L_161a	;1635 73 E3

E_1637: ; Open
	JSR (L_161a+1)	;1637 7C E2	E_0cac	 write inline byte | $80 to object file???
	DB 4		;1639 04
	JSR L_0c5e	;163A 79 0C 5E fixupWord	look up keyword (inline table ptr)
	DW L_1A73	;163D 1A 73  fixupword	file access keywords
	BNZ @1642	;163F 15 01
	INAB		;1641 28
@1642:	JSR L_0cc2	;1642 79 0C C2 fixupWord
	JSR (L_15f8+1)	;1645 7C B2	E_0b81	compare text with inline
	DB '#'+$80	;1647 A3
	DB 1		;1648 01
	JSR L_1679	;1649 7B 2E
	JSR (L_161a+1)	;164B 7C CE	L_0cac	 write inline byte | $80 to object file???
	DB $27		;164D 27
	JSR ???		;164e 7C A9
	DB AC ;		;1650 AC
	DB 1		;1651 01
	BNZ L_1637	;1652 15 E3
	JMP L_1083	;1654 71 10 83 fixupWord

E_1657: ; Close
	JSR (L_15f8+1)	;1657 7C A0	E_0b81	compare text with inline
	DB '#'+$80	;1659 A3
	DB 1		;165a 01
	JSR L_1679	;165B 7B 1C
	JSR (L_161a+1)	;165D 7C BC	L_0cac	 write inline byte | $80 to object file???
	DB $28		;165F 28
	JSR (L_15f8+1)	;1660 7C 97	E_0b81	compare text with inline
	DB ','+$80	;1662 AC
	DB 1		;1663 01
	BNZ L_1657	;1664 15 F1
	JMP L_1083	;1666 71 10 83 fixupWord

E_1669: ; Move
	JSR (L_161a+1)	;1669 7C B0	L_0cac	 write inline byte | $80 to object file???
	DB $40		;166B 40
	JSR L_1594	;166C 79 15 94  fixupword
	JSR (L_15f8+1)	;166F 7C 88	E_0b81	compare text with inline
	DB 'T'+$80	;1671 D4
	DB 'O'+$80	;1672 CF
	DB 1		;1673 01
	JSR L_1594	;1674 79 15 94 fixupWord
	JMP L_161e	;1677 73 A5


E_1679:	JSR L_169b	;1679 7B 20
@187b:	JSR E_0b81	;167B 79 0B 81 fixupWord	compare text with inline
	DB 'O'+$80	;167E CF
	DB 'R'+$80	;167F D2
	DB 1		;1680 01
	BZ @168a	;1681 14 07
	JSR L_169b	;1683 7B 16
	JSR (L_161a+1)	;1685 7C 94	L_0cac	 write inline byte | $80 to object file???
	DB $13		;1687 13
	JMP @187b	;1688 73 F1

@168a:	JSR E_0B81	;168A 79 0B 81 fixupWord	compare text with inline
	DB 'X'+$80	;168D D8
	DB 'O'+$80	;168E CF
	DB 'R'+$80	;168F D2
	DB 1		;1690 01
	BZ L_169a	;1691 14 07
	JSR L_169b	;1693 7B 06
	JSR (L_161a+1)	;1695 7C 84	L_0cac	 write inline byte | $80 to object file???
	DB $12		;1697 12
	JMP @167b	;1698 73 E1

L_169a:	RSR		;169a 09


E_169b:
	JSR L_16b3	;169b 7B 16
L_169d:	JSR (L_168a+1)	;169d 7C EC	E_0B81	compare text with inline
	DB '&'+$80	;169F A6
	DB 1		;16A0 01
	BNZ @16ab	;16A1 15 08
	JSR (L_168a+1)	;16A3 7C E6	E_0B81	compare text with inline
	DB 'A'+$80	;16A5 C1
	DB 'N'+$80	;16a6 CE
	DB 'D'+$80	;16ac C4
	DB 1		;16A8 01
	BZ L_169a	;16A9 14 EF
@16AB:	JSR L_16b3	;16AB 7B 06
L_16ad:	JSR L_0cac	;16AD 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $11		;16B0 11
	JMP L_169d	;16b1 73 EA

L_16B3:	JSR (L_168a+1)	;16B3 7C D6	E_0B81	compare text with inline
	DB CE ;N	;16B5 CE
	DB CF ;O	;16B6 CF
	DB D4 ;T	;16B7 D4
	DB 1		;16b8 01
	BNZ @16be	;16B9 15 03	  if found goto
				;	not found
	JSR @16c4	;16BB 7B 07	get the condition
	RSR		;16BD 09

@16BE: ; 'NOT' found
	JSR @16c4	;16BE 7B 04	get the condition
	JSR (L_16ad+1)	;16C0 7C EC	E_0cac	 write inline byte | $80 to object file???
	DB $10		;16C2 10	  logical not???
	RSR		;16c3 09


@16C4:	JSR L_16da	;16C4 7B 14
	JSR L_0c5e	;16C6 79 0C 5E fixupWord	look up keyword (inline table ptr)
	DW L_1A48	;16C9 1A 48  fixupword	comparison keyword table
	BZ L_169a	;16CB 14 CD	if not found, return
	STAB (-SW)	;16CD A5 A2	save code
	JSR L_16da	;16CF 7B 09
	JSR (L_16ad+!)	;16D1 7C DB	E_0cac	 write inline byte | $80 to object file???
	DB $f		;16D3 0F
	LDAB (SW+)	;16D4 85 A1
	JSR L_0ccc	;16D6 79 0C CC fixupWord
	RSR		;16D9 09

L_16DA:	JSR L_16ea	;16DA 7B 0E
@16DC:	JSR (L_168a+1)	;16DC 7C AD	E_0B81	compare text with inline
	DB AF ;/	;16DE AF
	DB AF ;/	;16DF AF
	DB 1		;16E0 01
	BZ L_169a	;16E1 14 B7	if not found, return
	JSR L_16ea	;16E3 7B 05
	JSR (L_16ad+1)	;16E5 7C C7	E_0cac	 write inline byte | $80 to object file???
	DB $e		;16E7 0E
	JMP @16dc	;16E8 73 F2

L_16EA:	JSR (L_168a+1)	;16EA 7C 9F	E_0B81	compare text with inline
	DB '-'+$80	;16EC AD
	DB 1		;16ED 01
	BZ @16f7	;16EE 14 07
	JSR L_1719	;16F0 7B 27
	JSR (L_16ad+1)	;16F2 7C BA	L_0cac	write inline byte | $80 to object file???
	DB $0B		;16F4 0B
	JMP L_16fd	;16F5 73 06

@16F7:	JSR (L_168a+1)	;16F7 7C 92	E_0B81	compare text with inline
	DB '+'+$80	;16F9 AB
	DB 1		;16FA 01
	JSR L_1719	;16FB 7B 1C
E_16FD:	JSR (L_168a+1)	;16FD 7C 8C	E_0B81	compare text with inline
	DB AD ;		;16FF AD
	DB 1		;1700 01
	BZ L_170a	;1701 14 07
	JSR L_1719	;1703 7B 14
	JSR (L_16ad+1)	;1705 7C A7	L_0cac	write inline byte | $80 to object file???
	DB $c		;1707 0C
	JMP L_16fd	;1708 73 F3

L_170A:	JSR E_0b81	;170A 79 0B 81 fixupWord	compare text with inline
	DB '+'+$80	;170D AB
	DB 1		;170E 01
	BZ L_1718	;170F 14 07
	JSR L_1719	;1711 7B 06
L_1713:	JSR (L_16ad+1)	;1713 7C 99	E_0cac	 write inline byte | $80 to object file???
	DB $d		;1715 0D
	JMP L_16fd	;1716 73 E5

L_1718:	RSR		;1718 09

L_1719:	JSR L_1745	;1719 7B 2A
E_171B:	LDA (ZW)	;171B 9C
	LDB #$aaaa	;171C D0 AA AA
	SAB		;171F 59
	BZ L_1718	;1720 14 F6
L_1722:	JSR E_0b81	;1722 79 0B 81 fixupWord	compare text with inline
	DB '*'+$80	;1725 AA
	DB 1		;1726 01
	BZ @1730	;1727 14 07
	JSR L_1745	;1729 7B 1A
	JSR (L_16ad+1)	;172B 7C 81	E_0cac	 write inline byte | $80 to object file???
	DB $a		;172D 0A
	JMP L_171b	;172E 73 EB

@1730:	LDA (ZW)	;1730 9C	text = '//'?
	LDB #$afaf	;1731 D0 AF AF
	SAB		;1734 59
	BZ L_1718	;1735 14 E1
	JSR (L_1722+1)	;1737 7C EA	E_0b81	compare text with inline
	DB '/'+$80	;1739 AF
	DB 1		;173A 01
	BZ L_1718	;173B 14 DB
	JSR L_1745	;173D 7B 06
L_173f:	JSR L_0cac	;173F 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 9		;1742 09
	JMP ???		;1743 73 D6

L_1745:	JSR L_175b	;1745 7B 14
E_1747:	JSR (L_1722+!)	;1747 7C DA	E_0b81	compare text with inline
	DB '*'+$80	;1749 AA
	DB '*'+$80	;174A AA
	DB 1		;174B 01
	BNZ @1754	;174C 15 06
	JSR (L_1722+1)	;174E 7C D3	E_0b81	compare text with inline
	DB '^'+$80	;1750 DE
	DB 1		;1751 01
	BZ L_1718	;1752 14 C4
@1754:	JSR L_175b	;1754 7B 05
	JSR (L_173f+1)	;1756 7C E8	L_0cac	write inline byte | $80 to object file???
	DB 8		;1758 08
	JMP L_1747	;1759 73 EC

L_175B:	JSR (L_1722+1)	;175B 7C C6	E_0b81	compare text with inline
	DB '('+$80	;175D A8
	DB 1		;175E 01
	BZ L_1768	;175F 14 07
	JSR L_1679	;1761 79 16 79 fixupWord
	JSR L_0bb4	;1764 79 0B B4 fixupWord
	RSR		;1767 09

L_1768:	JSR E_0abf	;1768 79 0A BF fixupWord	get text number string
	BZ @176e	;176B 14 01
	RSR		;176D 09

@176E:	JSR L_0a72	;176E 79 0A 72 fixupWord
	BZ @1774	;1771 14 01
	RSR		;1773 09

@1774:	JSR L_1780	;1774 7B 0A
	BZ @177c	;1776 14 04
	JSR (L_173f+1)	;1778 7C C6	L_0cac	write inline byte | $80 to object file???
	DB $16		;177A 16
	RSR		;177b 09

@177C:	JSR L_0de3	;177C 79 0D E3 fixupWord
	DB 5		;177F 05
L_1780:	JSR L_0c5e	;1780 79 0C 5E fixupWord	look up keyword (inline table ptr)
	DW L_1AFC	;1783 1A FC  fixupword
	BZ L_17af	;1785 14 28
	LDB #$4000	;1787 D0 40 00
	XABB		;178A 4D
	STB (-YW)	;178B F5 62
	LDB #L_1b26	;178D D0 1B 26 fixupWord
	AAB		;1790 58
	LDAB (BW)	;1791 89
	STAB (-SW)	;1792 A5 A2
	JSR E_0bbf	;1794 79 0B BF fixupWord	look for % or $ (variable types), return bitmask
	LDB (YW)	;1797 DB
	ORI BW,AW	;1798 53 02
	STB (YW)	;179A FB
	JSR L_182a	;179B 79 18 2A fixupWord
	LDBB (SW+)	;179E C5 A1
	SABB		;17A0 49
	BZ L_17a7	;17A1 14 04
	JSR L_0dc8	;17A3 79 0D C8 fixupWord
	DB $f		;17A6 0F
E_17A7:	LDA (YW+)	;17A7 95 61
	JSR L_0cc2	;17A9 79 0C C2 fixupWord
E_17AC:	LDAB #1		;17AC 80 01
	RSR		;17AE 09

L_17AF:	JSR E_0966	;17AF 79 09 66 fixupWord	get a name from text
	BNZ @17b5	;17B2 15 01
	RSR		;17B4 09

@17B5:	JSR E_098b	;17B5 79 09 8B fixupWord
	LDA @(YW)	;17B8 95 64
	LDB #$4000	;17BA D0 40 00
	NAB		;17BD 5A
	BZ L_17d1	;17BE 14 11
	JSR L_182a	;17C0 7B 68
	JSR L_0cac	;17C2 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 4		;17C5 04
	LDB (YW)	;17C6 DB
	LDA 2(BW)	;17C7 95 28 02
	JSR (L_17aa)	;17CA 7C DE
	LDA @(YW)	;17CC 95 64
	STA (YW)	;17CE BB
	JMP L_17a7	;17CF 73 D6

L_17D1:	JSR (L_17aa)	;17D1 7C D7
	LDA (YW)	;17D3 9B
	LDB 2(AW)	;17D4 D5 08 02
	BP L_17dd	;17D7 17 04
E_17D9:	LDA (YW+)	;17D9 95 61
	JMP L_17ac	;17DB 73 CF

L_17DD:	JSR E_0b81	;17DD 79 0B 81 fixupWord	compare text with inline
	DB '('+$80	;17E0 A8
	DB 1		;17E1 01
	BNZ L_17e9	;17E2 15 05
L_17E4:	JSR (L_17a4)	;17E4 7C BE
	DB 6		;17E6 06
	JMP L_17d9	;17E7 73 F0

L_17E9:	JSR L_1679	;17E9 79 16 79 fixupWord
	LDA (YW+)	;17EC 95 61
	LDB 2(AW)	;17EE D5 08 02
	BZ L_1822	;17F1 14 2F
	STB (-SW)	;17F3 F5 A2
	JSR (L_17c3)	;17F5 7C CC
	DB 4		;17F7 04
	LDA #1		;17F8 90 00 01
	JSR (L_17aa)	;17FB 7C AD
	LDA #$500d	;17FD 90 50 0D
	JSR (L_17aa)	;1800 7C A8
	JSR (L_17c3)	;1802 7C BF
	DB $16		;1804 16
	JSR L_0CAC	;1805 79 0C AC  fixupword	 write inline byte | $80 to object file???
	DB 4		;1808 04
	LDA (SW+)	;1809 95 A1
	JSR (L_17aa)	;180B 7C 9D
	JSR (L_1806)	;180D 7C F7
	DB $a		;180F 0A
	JSR (L_1806)	;1810 7C F4
	DB $14		;1812 14
	JSR (???)	;1813 7C C9
	DB A9 ;		;1815 A9
	DB 1		;1816 01
	BNZ L_17e4	;1817 15 CB
	JSR (L_17de)	;1819 7C C3
	DB AC ;		;181B AC
	DB 1		;181C 01
	BZ L_17e4	;181D 14 C5
	JSR L_1679	;181F 79 16 79 fixupWord
L_1822:	JSR (L_1806)	;1822 7C E2
	DB $14		;1824 14
	JSR L_0BB4	;1825 79 0B B4  fixupword
	JMP ???		;1828 73 82

	CLA		;182a 3A
	STA ???		;182b B5 A2
	JSR (???)	;182d 7C AF
	DB A8 ;		;182F A8
	DB 1		;1830 01
	BZ L_1842	;1831 14 0F
L_1833:	LDA (SW)	;1833 9D
	INA		;1834 38
	STA (SW)	;1835 BD
	JSR L_1679	;1836 79 16 79 fixupWord
	JSR (L_17de)	;1839 7C A3
	DB AC ;		;183B AC
	DB 1		;183C 01
	BNZ L_1833	;183D 15 F4
	JSR L_0bb4	;183F 79 0B B4 fixupWord
L_1842:	JSR (L_1806)	;1842 7C C2
	DB 4		;1844 04
	LDA (SW)	;1845 9D
	JSR L_0cc2	;1846 79 0C C2 fixupWord
	LDA (SW+)	;1849 95 A1
	RSR		;184B 09

L_184C:	JSR (L_17de)	;184C 7C 90
	STAB L_1851	;184E A3 01
	BNZ L_185a	;1850 15 08
	JSR (L_1806)	;1852 7C B2
	DB 4		;1854 04
	CLA		;1855 3A
	JSR (L_1847)	;1856 7C EF
	JMP L_185d	;1858 73 03

L_185A:	JSR L_1679	;185A 79 16 79 fixupWord
E_185D:	LDAB (XW+)	;185D 85 41
	BM @1866	;185F 16 05
	STAB @1865	;1861 A3 02
	JSR (L_1806)	;1863 7C A1
@1865:	DB 0		;1865 00
@1866:	RSR		;1866 09

L_1867:	JSR E_0b81	;1867 79 0B 81 fixupWord	compare text with inline
	DB '#'+$80	;186A A3
	DB 1		;186b 01
	JSR L_1679	;186C 79 16 79 fixupWord
	JSR E_0b81	;186F 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;1872 AC
	DB 1		;1873 01
	JMP L_185d	;1874 73 E7

E_1876: ; NextLote
	LDAB #$35	;1876 80 35
	JMP L_187c	;1878 73 02

E_187A: ; Point
	LDAB #$36	;187A 80 36
E_187C:	STAB L_188d	;187C A3 0F
	JSR L_1867	;187E 7B E7
	STB (PW)	;1880 FF
	JSR L_1780	;1881 79 17 80 fixupWord
	BNZ L_188a	;1884 15 04
L_1886:	JSR L_0de3	;1886 79 0D E3 fixupWord
	DB $14		;1889 14
	JSR L_0CAC	;188a 79 0C AC  fixupword	 write inline byte | $80 to object file???
	DB 0		;188D 00
	JMP L_18ec	;188E 73 5C

E_1890: ; Hold
	JSR L_1867	;1890 7B D5
	DB $2f		;1892 2F
	JMP ???		;1893 73 57

E_1895: ; Free
	JSR L_1867	;1895 7B D0
	DB $30		;1897 30
	JMP ???		;1898 73 52

E_189a: ; NextKey
	JSR E_0B81	;189a 79 0B 81  fixupword	compare text with inline
	DB '#'$+80	;189D A3
	DB 1		;189e 01
L_189F:	BZ L_1886	;189F 14 E5
	JSR L_1679	;18A1 79 16 79 fixupWord
	JSR (L_188b)	;18A4 7C E5
	DB $39		;18A6 39
	JSR E_0b81	;18A7 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;18AA AC
	DB 1		;18AB 01
	BNZ L_18b3	;18AC 15 05
	JSR (L_188b)	;18AE 7C DB
	DB $3d		;18B0 3D
	JMP L_18b6	;18B1 73 03

L_18B3:	JSR L_1780	;18B3 79 17 80 fixupWord
E_18B6:	JSR (L_188b)	;18B6 7C D3
	DB $3e		;18B8 3E
	JMP L_18ec	;18B9 73 31

E_18BB: ; GetKey
	JSR L_1867	;18BB 7B AA
	DB $37		;18BD 37
	JMP ???		;18BE 73 2C

E_18C0: ; NewKey
	JSR L_1867	;18C0 7B A5
	DB $38		;18C2 38
	JMP L_18ec	;18C3 73 27

E_18C5: ; DltKey
	JSR L_1867	;18C5 7B A0
	DB $3f		;18C7 3F
	JMP L_18ec	;18C8 73 22

E_18CA: ; Cursor
	JSR L_184c	;18CA 79 18 4C fixupWord
	DB $ff		;18CD FF
	JSR E_0b81	;18CE 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;18D1 AC
	DB 1		;18D2 01
	BNZ L_1886	;18D3 15 B1
	JSR L_1679	;18D5 79 16 79 fixupWord
	JSR (L_18cf)	;18D8 7C F5
	DB AC ;		;18DA AC
	DB 1		;18DB 01
	BNZ @18e8	;18DC 15 0A
	CLA		;18DE 3A
	JSR L_0cc2	;18DF 79 0C C2 fixupWord
	JSR L_0cac	;18E2 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB $42		;18E5 42
	JMP ???		;18e6 73 04

@18E8:	JSR L_185a	;18E8 79 18 5A fixupWord
	DB $42		;18EB 42
	JMP L_1083		;18EC 71 10 83  fixupword

E_18EF: ; PJP
	JSR L_1679	;18EF 79 16 79 fixupWord
	JSR E_0b81	;18F2 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;18F5 AC
	DB 1		;18F6 01
	BZ L_1886	;18F7 14 8D
	JSR L_185a	;18F9 79 18 5A fixupWord
	DB $43		;18FC 43
	JMP ???		;18fd 73 ED

E_18FF: ; Pupsci
	JSR L_185a	;18FF 79 18 5A fixupWord
	DB $44		;1902 44
	JMP ???		;1903 73 E7

;--- keywords ---

L_1905: ; start of C
	DB C1 ; A	;1905 C1	Call
	DB CC ; L	;1906 CC
	DB CC ; L	;1907 CC
	DB $18		;1908 18

	DB C8 ;H	;1909 C8	Chain
	DB C1 ;A	;190A C1
	DB C9 ;I	;190B C9
	DB CE ;N	;190C CE
	DB $68		;190D 68

	DB CC ;L	;190E CC	Close
	DB CF ;O	;190F CF
	DB D3 ;S	;1910 D3
	DB C5 ;E	;1911 C5
	DB $13		;1912 13

	DB D5 ;U	;1913 D5	Cursor
	DB D2 ;R	;1914 D2
	DB D3 ;S	;1915 D3
	DB CF ;O	;1916 CF
	DB D2 ;R	;1917 D2
	DB $1B		;1918 1B

	DB 0		;1919 00	end of list

L_191a: ; start of D
	DB C1 ;A	;191A C1	Data
	DB D4 ;T	;191B D4
	DB C1 ;A	;191C C1
	DB $41		;191D 41

	DB C5 ;E	;191E C5	Declare
	DB C3 ;C	;191F C3
	DB CC ;L	;1920 CC
	DB C1 ;A	;1921 C1
	DB D2 ;R	;1922 D2
	DB C5 ;E	;1923 C5
	DB $64		;1924 64

	DB C5 ;E	;1925 C5	Def
	DB C6 ;F	;1926 C6
	DB $43		;1927 43

	DB C9 ;I	;1928 C9	Dim
	DB CD ;M	;1929 CD
	DB $44		;192A 44

	DB CC ;L	;192B CC	DltKey
	DB D4 ;T	;192C D4
	DB CB ;K	;192D CB
	DB C5 ;E	;192E C5
	DB D9 ;Y	;192F D9
	DB $2B		;1930 2B

	DB 0		;1931 00	end of list

L_1932: ; start of E
	DB CE ;N	;1932 CE	End
	DB C4 ;D	;1933 C4
	DB $45		;1934 45

	DB CC ;L	;1935 CC	Else
	DB D3 ;S	;1936 D3
	DB C5 ;E	;1937 C5
	DB $2A		;1938 2A

	DB 0		;1939 00	end of list

L_193a: ; start of F
	DB C9 ;I	;193A C9	File
	DB CC ;L	;193B CC
	DB C5 ;E	;193C C5
	DB $59		;193D 59

	DB CE ;N	;193E CE	FnEnd
	DB C5 ;E	;193F C5
	DB CE ;N	;1940 CE
	DB C4 ;D	;1941 C4
	DB $56		;1942 56

	DB CF ;O	;1943 CF	Format
	DB D2 ;R	;1944 D2
	DB CD ;M	;1945 CD
	DB C1 ;A	;1946 C1
	DB D4 ;T	;1947 D4
	DB $57		;1948 57

	DB CF ;O	;1949 CF	For
	DB D2 ;R	;194A D2
	DB $06		;194B 06

	DB D2 ;R	;194C D2	Free
	DB C5 ;E	;194D C5
	DB C5 ;E	;194E C5
	DB $1D		;194F 1D

	DB 0		;1950 00	end of list

L_1951: ; start of G
	DB C5 ;E	;1951 C5	GetKey
	DB D4 ;T	;1952 D4
	DB CB ;K	;1953 CB
	DB C5 ;E	;1954 C5
	DB D9 ;Y	;1955 D9
	DB $22		;1956 22

	DB CF ;O	;1957 CF	Gosub
	DB D3 ;S	;1958 D3
	DB D5 ;U	;1959 D5
	DB C2 ;B	;195A C2
	DB $07		;195B 07

	DB CF ;O	;195C CF	Goto
	DB D4 ;T	;195D D4
	DB CF ;O	;195E CF
	DB $08		;195F 08

	DB 0		;1960 00	end of list

L_1961: ; start of H
	DB CF ;O	;1961 CF	Hold
	DB CC ;L	;1962 CC
	DB C4 ;D	;1963 C4
	DB $1C		;1964 1C

	DB 0		;1965 00	end of list

L_1966: ; start of I
	DB C6 ;F	;1966 C6	If
	DB $09		;1967 09

	DB CE ;N	;1968 CE	Input
	DB D0 ;P	;1969 D0
	DB D5 ;U	;196A D5
	DB D4 ;T	;196B D4
	DB $$0A		;196C 0A

	DB 0		;196D 00	end of list

L_196e: ; start of L
	DB C5 ;E	;196E C5	Let
	DB D4 ;T	;196F D4
	DB $0B		;1970 0B

	DB C9 ;I	;1971 C9	LineLength
	DB CE ;N	;1972 CE
	DB C5 ;E	;1973 C5
	DB CC ;L	;1974 CC
	DB C5 ;E	;1975 C5
	DB CE ;N	;1976 CE
	DB C7 ;G	;1977 C7
	DB D4 ;T	;1978 D4
	DB C8 ;H	;1979 C8
	DB $27		;197A 27

	DB CF ;O	;197B CF	Local
	DB C3 ;C	;197C C3
	DB C1 ;A	;197D C1
	DB CC ;L	;197E CC
	DB $65		;197F 65

	DB 0		;1980 00	end of list

L_1981: ; start of M
	DB CF ;O	;1981 CF	Move
	DB D6 ;V	;1982 D6
	DB C5 ;E	;1983 C5
	DB $2C		;1984 2C

	DB 0		;1985 00	end of list

L_1986: ; start of N
	DB C5 ;E	;1986 C5	NewKey
	DB D7 ;W	;1987 D7
	DB CB ;K	;1988 CB
	DB C5 ;E	;1989 C5
	DB D9 ;Y	;198A D9
	DB $23		;198B 23

	DB C5 ;E	;198C C5	NextKey
	DB D8 ;X	;198D D8
	DB D4 ;T	;198E D4
	DB CB ;K	;198F CB
	DB C5 ;E	;1990 C5
	DB D9 ;Y	;1991 D9
	DB $26		;1992 26

	DB C5 ;E	;1993 C5	NextLote
	DB D8 ;X	;1994 D8
	DB D4 ;T	;1995 D4
	DB 4C ;L	;1996 4C
	DB CF ;O	;1997 CF
	DB D4 ;T	;1998 D4
	DB C5 ;E	;1999 C5
	DB $20	 	;199A 20

	DB 0		;199B 00	end of list

L_199c: ; start of O
	DB CE ;N	;199C CE	On
	DB $15		;199D 15

	DB D0 ;P	;199E D0	Open
	DB C5 ;E	;199F C5
	DB CE ;N	;19A0 CE
	DB $02		;19A1 02

	DB D5 ;U	;19A2 D5	Output
	DB D4 ;T	;19A3 D4
	DB D0 ;P	;19A4 D0
	DB D5 ;U	;19A5 D5
	DB D4 ;T	;19A6 D4
	DB $1E		;19A7 1E

	DB 0		;19A8 00	end of list

L_19a9: ; start of P
	DB CF ;O	;19A9 CF	Point
	DB C9 ;I	;19AA C9
	DB CE ;N	;19AB CE
	DB D4 ;T	;19AC D4
	DB $21		;19AD 21

	DB D2 ;R	;19AE D2	Print
	DB C9 ;I	;19AF C9
	DB CE ;N	;19B0 CE
	DB D4 ;T	;19B1 D4
	DB $0D		;19B2 0D

	DB CA ;J	;19B3 CA	PJP
	DB D0 ;P	;19B4 D0
	DB $2D		;19B5 2D

	DB D5 ;U	;19B6 D5	Pupsi
	DB D0 ;P	;19B7 D0
	DB D3 ;S	;19B8 D3
	DB C9 ;I	;19B9 C9
	DB $2E		;19BA 2E

	DB 0		;19BB 00	end of list

L_19bc: ; start of R
	DB C1 ;A	;19BC C1	Randomize
	DB CE ;N	;19BD CE
	DB C4 ;D	;19BE C4
	DB CF ;O	;19BF CF
	DB CD ;M	;19C0 CD
	DB C9 ;I	;19C1 C9
	DB DA ;Z	;19C2 DA
	DB C5 ;E	;19C3 C5
	DB $29		;19C4 29

	DB C5 ;E	;19C5 C5	Read
	DB C1 ;A	;19C6 C1
	DB C4 ;D	;19C7 C4
	DB $0E		;19C8 0E

	DB C5 ;E	;19C9 C5	Record
	DB C3 ;C	;19CA C3
	DB CF ;O	;19CB CF
	DB D2 ;R	;19CC D2
	DB C4 ;D	;19CD C4
	DB $5A		;19CE 5A

	DB C5 ;E	;19CF C5	Rem
	DB CD ;M	;19D0 CD
	DB $4F		;19D1 4F

	DB C5 ;E	;19D2 C5	Restore
	DB D3 ;S	;19D3 D3
	DB D4 ;T	;19D4 D4
	DB CF ;O	;19D5 CF
	DB D2 ;R	;19D6 D2
	DB C5 ;E	;19D7 C5
	DB $14		;19D8 14

	DB C5 ;E	;19D9 C5	Return
	DB D4 ;T	;19DA D4
	DB D5 ;U	;19DB D5
	DB D2 ;R	;19DC D2
	DB CE ;N	;19DD CE
	DB $50		;19DE 50

	DB C5 ;E	;19DF C5	Rewrite
	DB D7 ;W	;19E0 D7
	DB D2 ;R	;19E1 D2
	DB C9 ;I	;19E2 C9
	DB D4 ;T	;19E3 D4
	DB C5 ;E	;19E4 C5
	DB $1F		;19E5 1F

	DB 0		;19E6 00	end of list

L_19e7: ; start of S
	DB D4 ;T	;19E7 D4	Stop
	DB CF ;O	;19E8 CF
	DB D0 ;P	;19E9 D0
	DB $51		;19EA 51

	DB 0		;19EB 00	end of list

L_19ec: ; start of W
	DB D2 ;R	;19EC D2	Write
	DB C9 ;I	;19ED C9
	DB D4 ;T	;19EE D4
	DB C5 ;E	;19EF C5
	DB $12		;19F0 12

	DB 0		;19F1 00	end of list

L_19f2: ; 1st letter of keyword
	DB C3 ;C	;19F2 C3		starts with C
	DW L_1905	;19F3 19 05  fixupword
	DB C4 ;D	;19F5 C4		starts with D
	DW L_191A	;19F6 19 1A  fixupword
	DB C5 ;E	;19F8 C5		starts with E
	DW L_1932	;19F9 19 32  fixupword
	DB C6 ;F	;19FB C6		starts with F
	DW L_193A	;19FC 19 3A  fixupword
	DB C7 ;G	;19FE C7		starts with G
	DW L_1951	;19FF 19 51  fixupword
	DB C8 ;H	;1A01 C8		starts with H
	DW L_1961	;1A02 19 61  fixupword
	DB C9 ;I	;1A04 C9		starts with I
	DW L_1966	;1A05 19 66  fixupword
	DB CC ;L	;1A07 CC		starts with L
	DW L_196E	;1A08 19 6E  fixupword
	DB CD ;M	;1A0A CD		starts with M
	DW L_1981	;1A0B 19 81  fixupword
	DB CE ;N	;1A0D CE		starts with N
	DW L_1986	;1A0E 19 86  fixupword
	DB CF ;O	;1A10 CF		starts with O
	DW L_199C	;1A11 19 9C  fixupword
	DB D0 ;P	;1A13 D0		starts with P
	DW L_19A9	;1A14 19 A9  fixupword
	DB D2 ;R	;1A16 D2		starts with R
	DW L_19BC	;1A17 19 BC  fixupword
	DB D3 ;S	;1A19 D3		starts with S
	DW L_19E7	;1A1A 19 E7  fixupword
	DB D7 ;W	;1A1C D7		starts with W
	DW L_19EC	;1A1D 19 EC  fixupword
	DB 0		;1A1F 00		end of list

L_1a20: ; start of <
	DB BD ;=	;1A20 BD	<=
	DB $03		;1A21 03
	DB BE ;>	;1A22 BE	<>
	DB $06		;1A23 06
	DB $02		;1A24 02	<
	DB 0		;1A25 00	end of list

L_1a26: ; start of =
	DB $01		;1A26 01	=
	DB 0		;1A27 00	end of list

L_1a28: ; start of >
	DB BD ;=	;1A28 BD	>=
	DB $05		;1A29 05
	DB $04		;1A2A 04	>
	DB 0		;1A2B 00	end of list

L_1a2c: ; start of E
	DB D1 ;Q	;1A2C D1	EQ
	DB $01		;1A2D 01
	DB 0		;1A2E 00	end of list

L_1a2f: ; start of G
	DB C5 ;E	;1A2F C5	GE
	DB $05		;1A30 05
	DB D4 ;T	;1A31 D4	GT
	DB $04		;1A32 04
	DB 0		;1A33 00	end of list

L_1a34: ; start of L
	DB C5 ;E	;1A34 C5	LE
	DB $03		;1A35 03
	DB D4 ;T	;1A36 D4	LT
	DB $02		;1A37 02
	DB 0		;1A38 00	end of list

L_1a39: ; start of N
	DB C5 ;E	;1A39 C5	NE
	DB $06		;1A3A 06
	DB 0		;1A3B 00	end of list

L_1a3c: ; start of <
	DB BD ;=	;1A3C BD	<=
	DB $03		;1A3D 03
	DB BE ;>	;1A3E BE	<>
	DB $06		;1A3F 06
	DB $02		;1A40 02	<
	DB 0		;1A41 00	end of list

L_1a42: ; start of >
	DB BD ;=	;1A42 BD	>=
	DB $05		;1A43 05
	DB BC ;<	;1A44 BC	><
	DB $06		;1A45 06
	DB $04		;1A46 04	>
	DB 0		;1A47 00	end of list

L_1a48: ; comparison keywords 1st letter
	DB BC ;<	;1A48 BC		starts with <
	DW L_1A20	;1A49 1A 20  fixupword
	DB BD ;=	;1A4B BD		starts with =
	DW L_1A26	;1A4C 1A 26  fixupword
	DB BE ;>	;1A4E BE		starts with >
	DW L_1A28	;1A4F 1A 28  fixupword
	DB C5 ;E	;1A51 C5		starts with E
	DW L_1A2C	;1A52 1A 2C  fixupword
	DB C7 ;G	;1A54 C7		starts with G
	DW L_1A2F	;1A55 1A 2F  fixupword
	DB CC ;L	;1A57 CC		starts with L
	DW L_1A34	;1A58 1A 34  fixupword
	DB CE ;N	;1A5A CE		starts with N
	DW L_1A39	;1A5B 1A 39  fixupword
	DB BC ;<	;1A5D BC		starts with < - a duplicate???
	DW L_1A3C	;1A5E 1A 3C  fixupword
	DB BE ;>	;1A60 BE		starts with > - a duplicate???
	DW L_1A42	;1A61 1A 42  fixupword
	DB 0		;1A63 00	


L_1a64: ; start of I
	DB CE ;N	;1A64 CE	Input
	DB D0 ;P	;1A65 D0
	DB D5 ;U	;1A66 D5
	DB D4 ;T	;1A67 D4
	DB $01		;1A68 01

	DB CF ;O	;1A69 CF	IO
	DB $03		;1A6A 03

	DB 0		;1A6B 00	end of list

L_1a6c: ; start of O
	DB D5 ;U	;1A6C D5	Output
	DB D4 ;T	;1A6D D4
	DB D0 ;P	;1A6E D0
	DB D5 ;U	;1A6F D5
	DB D4 ;T	;1A70 D4
	DB $02		;1A71 02

	DB 0		;1A72 00	end of list

L_1a73: ; file access keywords 1st letter
	DB C9 ;I	;1A73 C9		starts with I
	DW L_1A64	;1A74 1A 64  fixupword
	DB CF ;O	;1A76 CF		starts with O
	DW L_1A6C	;1A77 1A 6C  fixupword
	DB 0		;1A79 00		end of list


L_1a7a: ; start of A
	DB C2 ;B	;1A7A C2	Abs
	DB D3 ;S	;1A7B D3
	DB $0C		;1A7C 0C

	DB C4 ;D	;1A7D C4	Addr
	DB C4 ;D	;1A7E C4
	DB D2 ;R	;1A7F D2
	DB $16		;1A80 16

	DB D3 ;S	;1A81 D3	Ascii
	DB C3 ;C	;1A82 C3
	DB C9 ;I	;1A83 C9
	DB C9 ;I	;1A84 C9
	DB $06		;1A85 06

	DB 0		;1A86 00	end of list

L_1a87: ; start of C
	DB C8 ;H	;1A87 C8	Chr
	DB D2 ;R	;1A88 D2
	DB $05		;1A89 05

	DB 0		;1A8A 00	end of list

L_1a8b: ; start of D
	DB C1 ;A	;1A8B C1	Date
	DB D4 ;T	;1A8C D4
	DB C5 ;E	;1A8D C5
	DB $0F		;1A8E 0F

	DB 0		;1A8F 00	end of list

L_1a90: ; start of E
	DB CE ;N	;1A90 CE	End
	DB C4 ;D	;1A91 C4
	DB $0A		;1A92 0A

	DB D2 ;R	;1A93 D2	Err
	DB D2 ;R	;1A94 D2
	DB $0E		;1A95 0E

	DB D8 ;X	;1A96 D8	Exp
	DB D0 ;P	;1A97 D0
	DB $21		;1A98 21

	DB 0		;1A99 00	end of list

L_1a9a: ; start of F
	DB C1 ;A	;1A9A C1	False
	DB CC ;L	;1A9B CC
	DB D3 ;S	;1A9C D3
	DB C5 ;E	;1A9D C5
	DB $1A		;1A9E 1A

	DB C9 ;I	;1A9F C9	FileId
	DB CC ;L	;1AA0 CC
	DB C5 ;E	;1AA1 C5
	DB C9 ;I	;1AA2 C9
	DB C4 ;D	;1AA3 C4
	DB $1F		;1AA4 1F

	DB 0		;1AA5 00	end of list

L_1aa6: ; start of I
	DB CE ;N	;1AA6 CE	Int
	DB D4 ;T	;1AA7 D4
	DB $0D		;1AA8 0D

	DB 0		;1AA9 00	end of list

L_1aaa: ; start of J
	DB D0 ;P	;1AAA D0	Jp
	DB $1F		;1AAB 1F

	DB 0		;1AAC 00	end of list

L_1aad: ; start of K
	DB C5 ;E	;1AAD C5	KeyX
	DB D9 ;Y	;1AAE D9
	DB D8 ;X	;1AAF D8
	DB $1C		;1AB0 1C

	DB 0		;1AB1 00	end of list

L_1ab2: ; start of L
	DB C3 ;C	;1AB2 C3	Lc
	DB $03		;1AB3 03

	DB C5 ;E	;1AB4 C5	Len
	DB CE ;N	;1AB5 CE
	DB $07		;1AB6 07

	DB CF ;O	;1AB7 CF	Log
	DB C7 ;G	;1AB8 C7
	DB $20	 	;1AB9 20

	DB 0		;1ABA 00	end of list

L_1abb: ; start of P
	DB C5 ;E	;1ABB C5	Peek
	DB C5 ;E	;1ABC C5
	DB CB ;K	;1ABD CB
	DB $14		;1ABE 14

	DB CF ;O	;1ABF CF	Poke
	DB CB ;K	;1AC0 CB
	DB C5 ;E	;1AC1 C5
	DB $15		;1AC2 15

	DB 0		;1AC3 00	end of list

L_1ac4: ; start of R
	DB C5 ;E	;1AC4 C5	RecLen
	DB C3 ;C	;1AC5 C3
	DB CC ;L	;1AC6 CC
	DB C5 ;E	;1AC7 C5
	DB CE ;N	;1AC8 CE
	DB $1B		;1AC9 1B

	DB C5 ;E	;1ACA C5	Rep
	DB D0 ;P	;1ACB D0
	DB $04		;1ACC 04

	DB CE ;N	;1ACD CE	Rnd
	DB C4 ;D	;1ACE C4
	DB $17		;1ACF 17

	DB 0		;1AD0 00	end of list

L_1ad1: start of S 
	DB C7 ;G	;1AD1 C7	Sgn
	DB CE ;N	;1AD2 CE
	DB $0B		;1AD3 0B

	DB C8 ;H	;1AD4 C8	Shl
	DB CC ;L	;1AD5 CC
	DB $12		;1AD6 12

	DB C8 ;H	;1AD7 C8	Shr
	DB D2 ;R	;1AD8 D2
	DB $13		;1AD9 13

	DB D3 ;S	;1ADA D3	SStr
	DB D4 ;T	;1ADB D4
	DB D2 ;R	;1ADC D2
	DB $01		;1ADD 01

	DB D3 ;S	;1ADE D3	SSw
	DB D7 ;W	;1ADF D7
	DB $08		;1AE0 08

	DB D4 ;T	;1AE1 D4	Status
	DB C1 ;A	;1AE2 C1
	DB D4 ;T	;1AE3 D4
	DB D5 ;U	;1AE4 D5
	DB D3 ;S	;1AE5 D3
	DB $10		;1AE6 10

	DB 0		;1AE7 00	end of list

L_1ae8: ; start of T
	DB C1 ;A	;1AE8 C1	Tab
	DB C2 ;B	;1AE9 C2
	DB $09		;1AEA 09

	DB D2 ;R	;1AEB D2	Trace
	DB C1 ;A	;1AEC C1
	DB C3 ;C	;1AED C3
	DB C5 ;E	;1AEE C5
	DB $11		;1AEF 11

	DB D2 ;R	;1AF0 D2	True
	DB D5 ;U	;1AF1 D5
	DB C5 ;E	;1AF2 C5
	DB $19		;1AF3 19

	DB 0		;1AF4 00

L_1af5: ; start of U
	DB C3 ;C	;1AF5 C3	UC
	DB $02		;1AF6 02

	DB D0 ;P	;1AF7 D0	UPSI
	DB D3 ;S	;1AF8 D3
	DB C9 ;I	;1AF9 C9
	DB $18		;1AFA 18

	DB 0		;1AFB 00	end of list

L_1afc: ; function keywords 1st letter
	DB C1 ;A	;1AFC C1		starts with A
	DW L_1A7A	;1AFD 1A 7A  fixupword
	DB C3 ;C	;1AFF C3		starts with C
	DW L_1A87	;1B00 1A 87  fixupword
	DB C4 ;D	;1B02 C4		starts with D
	DW L_1A8B	;1B03 1A 8B  fixupword
	DB C5 ;E	;1B05 C5		starts with E
	DW L_1A90	;1B06 1A 90  fixupword
	DB C6 ;F	;1B08 C6		starts with F
	DW L_1A9A	;1B09 1A 9A  fixupword
	DB C9 ;I	;1B0B C9		starts with I
	DW L_1AA6	;1B0C 1A A6  fixupword
	DB CA ;J	;1B0E CA		starts with J
	DW L_1AAA	;1B0F 1A AA  fixupword
	DB CB ;K	;1B11 CB		starts with K
	DW L_1AAD	;1B12 1A AD  fixupword
	DB CC ;L	;1B14 CC		starts with L
	DW L_1AB2	;1B15 1A B2  fixupword
	DB D0 ;P	;1B17 D0		starts with P
	DW L_1ABB	;1B18 1A BB  fixupword
	DB D2 ;R	;1B1A D2		starts with R
	DW L_1AC4	;1B1B 1A C4  fixupword
	DB D3 ;S	;1B1D D3		starts with S
	DW L_1AD1	;1B1E 1A D1  fixupword
	DB D4 ;T	;1B20 D4		starts with T
	DW L_1AE8	;1B21 1A E8  fixupword
	DB D5 ;U	;1B23 D5		starts with U
	DW L_1AF5	;1B24 1A F5  fixupword
	DB 0		;1B26 00		end of list


	DB 03	;1B27 03
	DB 01	;1B28 01
	DB 01	;1B29 01
	DB 02	;1B2A 02
	DB 01	;1B2B 01
	DB 01	;1B2C 01
	DB 01	;1B2D 01
	DB 01	;1B2E 01
	DB 01	;1B2F 01
	DB 01	;1B30 01
	DB 01	;1B31 01
	DB 01	;1B32 01
	DB 01	;1B33 01
	DB 01	;1B34 01
	DB 00	;1B35 00
	DB 00	;1B36 00
	DB 01	;1B37 01
	DB 02	;1B38 02
	DB 02	;1B39 02
	DB 02	;1B3A 02
	DB 03	;1B3B 03
	DB 01	;1B3C 01
	DB 01	;1B3D 01
	DB 00	;1B3E 00
	DB 00	;1B3F 00
	DB 00	;1B40 00
	DB 00	;1B41 00
	DB 01	;1B42 01
	DB 00	;1B43 00
	DB 00	;1B44 00
	DB 01	;1B45 01
	DB 01	;1B46 01
	DB 01	;1B47 01

E_1B48: ; File
	CLA		;1B48 3A
	LDAB L_090e	;1B49 81 09 0E fixupWord
	LDBB #$0f	;1B4C C0 0F
	SABB		;1B4E 49
	BLE @1b55	;1B4F 19 04
	JSR L_0de3	;1B51 79 0D E3 fixupWord
	DB $58		;1B54 58
@1B55:	XABB		;1B55 4D
	INRB BL,1	;1B56 20 30
	STBB (L_1b4a)	;1B58 E4 F0
	SLR AW,3	;1B5A 35 02
	STX (-SW)	;1B5C 6D A2
	LDX #L_0f2f	;1B5E 60 0F 2F fixupWord
	ADD XW,AW	;1B61 50 04
	LDA (ZW)	;1B63 9C
	LDB #$d3d9	;1B64 D0 D3 D9
	SAB		;1B67 59
	BNZ L_1b75	;1B68 15 0B
	LDA (ZW+)	;1B6A 95 81
	LDAB (ZW+)	;1B6C 85 81
	LDBB #$d3	;1B6E C0 D3
	SABB		;1B70 49
	BZ L_1b78	;1B71 14 05
	DCR ZW,1	;1B73 31 80
E_1B75:	JSR (L_1b52)	;1B75 7C DB
	DB $19		;1B77 19
L_1B78:	JSR E_0B81	;1b78 79 0B 81  fixupword	compare text with inline
	DB 'R'+$80	;1B7B D2
	DB 'D'+$80	;1b7c C4
	DB 'R'+$80	;1b7d D2
	DB 1		;1B7E 01
	BNZ L_1b99	;1B7F 15 18
	JSR (L_1b78+1)	;1B81 7C F6
	LDBB (BW)	;1B83 C9
	LDB #L_d402	;1B84 D0 D4 02
	BNZ L_1b99	;1B87 15 10
	JSR (L_1b78+1)	;1B89 7C EE
	LDBB (ZW)	;1B8B CC
	LDBB (PW)	;1B8C CF
	.byte $C7	;1B8D C7
	RF?		;1B8E 03
	BNZ L_1b99	;1B8F 15 08
	JSR (L_1b78+1)	;1B91 7C E6
	LDBB (ZW)	;1B93 CC
	LDB L_1b6a	;1B94 D3 D4
	EI?		;1B96 04
	BZ L_1ba0	;1B97 14 07
L_1B99:	DCAB		;1B99 29
	LDBB #$80	;1B9A C0 80
	ORIB AL,BL	;1B9C 43 31
	JMP L_1ba7	;1B9E 73 07

L_1BA0:	JSR L_0b2f	;1BA0 79 0B 2F fixupWord	is text char a number? (consume if true)
	BZ L_1b75	;1BA3 14 D0
	LDA (YW+)	;1BA5 95 61
E_1BA7:	STAB 04(XW)	;1BA7 A5 48 04
	JMP L_1bdc	;1BAA 73 30

L_1BAC:	JSR (L_1b78+1)	;1BAC 7C CB
	LDB L_1b75	;1BAE D3 C5
	LDB L_0115	;1BB0 D1 01 15
	BGZ L_1c31	;1BB3 18 7C
	LDBB L_1b89	;1BB5 C3 D2
	LDBB (CW)	;1BB7 CE
	LDBB (L_1bbc)	;1BB8 C4 02
	BNZ L_1bcc	;1BBA 15 10
	JSR (L_1b78+1)	;1BBC 7C BB
	LDBB (BW)	;1BBE C9
	LDBB (CW)	;1BBF CE
	LDBB (L_1bc5)	;1BC0 C4 03
	BNZ L_1bcc	;1BC2 15 08
	JSR (L_1b78+1)	;1BC4 7C B3
	LDB L_1b98	;1BC6 D3 D0
	LDBB (CW)	;1BC8 CE
	DI	;1BC9 05
	BZ L_1bd0	;1BCA 14 04
L_1BCC:	DCAB		;1BCC 29
	SLAB		;1BCD 2D
	JMP L_1bf9	;1BCE 73 29

L_1BD0:	JSR L_0c5e	;1BD0 79 0C 5E fixupWord	look up keyword (inline table ptr)
	DW L_1C8E	;1BD3 1C 8E  fixupword
	SLA		;1BD5 3D
	LDB #L_1ca1	;1BD6 D0 1C A1 fixupWord
	AAB		;1BD9 58
	JMP @(BW)	;1BDA 75 24

E_1BDC:	JSR (L_1b78+1)	;1BDC 7C 9B
	STAB (ZW)	;1BDE AC
	NOP		;1BDF 01
	BNZ L_1bac	;1BE0 15 CA
	LDX (SW+)	;1BE2 65 A1
	JMP L_1083	;1BE4 71 10 83 fixupWord

E_1BE7:	JSR (L_1b78+1)	;1BE7 7C 90	E_0B81	compare text with inline
	DB 'N'+$80	;1BE9 CE
	DB 'O'+$80	;1BEA CF
	DB 1		;1BEB 01
	BNZ L_1bdc	;1BEC 15 EE
	JSR (L_1b78+1)	;1BEE 7C 89	E_0B81	compare text with inline
	DB 'Y'+$80	;1BF0 D9
	DB 'E'+$80	;1BF1 C5
	DB 'S'+$80	;1BF2 D3
	DB 1		;1bf3 01
	BNZ L_1bf9	;1BF4 15 03
E_1BF6:	JMP L_1b75	;1BF6 71 1B 75 fixupWord

E_1BF9:	LDBB 5(XW)	;1BF9 C5 48 05
	BP @1c00	;1BFC 17 02
	CLRB BL,0	;1BFE 22 30
@1C00:	ORIB BL,AL	;1C00 43 13
	STBB 5(XW)	;1C02 E5 48 05
	JMP L_1bdc	;1C05 73 D5

	JSR L_0B2F	;1C07 79 0B 2F  fixupword	is text char a number? (consume if true)
	BZ ???		;1C0A 14 EA
	LDA ??		;1C0C 95 61
	STAB 6(XW)	;1C0E A5 48 06
	JMP ???		;1C11 73 C9

	JSR E_0B81	;1C13 79 0B 81  fixupword	compare text with inline
	DB 'A'+$80	;1C16 C1
	DB 3		;1C17 03
	BNZ @1c3a	;1C18 15 20
	JSR (L_1c14)	;1C1A 7C F8
	LDBB (L_0215)	;1C1C C2 02 15
	BS1 L_1c9d	;1C1F 1A 7C
	STB (L_c304)	;1C21 F2 C3 04
	BNZ @1c3a	;1C24 15 14
	JSR (L_1c14)	;1C26 7C EC
	LDBB (BW)	;1C28 C9
	RL		;1C29 07
	BNZ @1c3a	;1C2A 15 0E
	JSR (L_1c14)	;1C2C 7C E6
	LDBB @(AW+)	;1C2E C5 05
	BNZ @1c3a	;1C30 15 08
	JSR (L_1c14)	;1C32 7C E0
	LDBB (ZW)	;1C34 CC
	SL		;1C35 06
	BNZ @1c3a	;1C36 15 02
@1C38:	JMP L_1bf6	;1C38 73 BC

@1C3A:	DCAB		;1C3A 29
	STAB 7(XW)	;1C3B A5 48 07
	JMP L_1bdc	;1C3E 73 9C

	JSR E_0966	;1C40 79 09 66  fixupword	get a name from text
	BZ @1c38	;1C43 14 F3
	JSR E_098B	;1C45 79 09 8B  fixupword
	DB $95		;1C48 95
	DB $64		;1C49 64
	LDB #$4000	;1C4A D0 40 00
	NAB		;1C4D 5A
	BNZ @1c38	;1C4E 15 E8
	STA 2(XW)	;1C50 B5 48 02
	LDA (YW+)	;1C53 95 61
	JMP L_1bdc	;1C55 73 85

	JSR L_0B2F	;1C57 79 0B 2F  fixupword	is text char a number? (consume if true)
	BZ ???		;1C5A 14 DC
	LDA (YW+)	;1C5C 95 61
	STA (XW)	;1C5E BA
	JMP L_1bdc	;1C5F 71 1B DC fixupWord

L_1c62: ; start of B
	DB D5 ;U	;1C62 D5	Buffer=
	DB C6 ;F	;1C63 C6
	DB C6 ;F	;1C64 C6
	DB C5 ;E	;1C65 C5
	DB D2 ;R	;1C66 D2
	DB BD ;=	;1C67 BD
	DB $01		;1C68 01

	DB 0		;1C69 00	end of list

L_1c6a: ; start of C
	DB CC ;L	;1C6A CC	Class=
	DB C1 ;A	;1C6B C1
	DB D3 ;S	;1C6C D3
	DB D3 ;S	;1C6D D3
	DB BD ;=	;1C6E BD
	DB $02		;1C6F 02

	DB 0		;1C70 00	end of list

L_1c71: ; start of F
	DB C9 ;I	;1C71 C9	FilTyp=
	DB CC ;L	;1C72 CC
	DB D4 ;T	;1C73 D4
	DB D9 ;Y	;1C74 D9
	DB D0 ;P	;1C75 D0
	DB BD ;=	;1C76 BD
	DB $03		;1C77 03

	DB 0		;1C78 00	end of list

L_1c79: ; start of K
	DB C5 ;E	;1C79 C5	Key=
	DB D9 ;Y	;1C7A D9
	DB BD ;=	;1C7B BD
	DB $04		;1C7C 04

	DB 0		;1C7D 00	end of list

L_1c7e: ; start of R
	DB C5 ;E	;1C7E C5	RecSiz=
	DB C3 ;C	;1C7F C3
	DB D3 ;S	;1C80 D3
	DB C9 ;I	;1C81 C9
	DB DA ;Z	;1C82 DA
	DB BD ;=	;1C83 BD
	DB $05		;1C84 05

	DB 0		;1C85 00	end of list

L_1c86: ; start of A
	DB C3 ;C	;1C86 C3	Access=
	DB C3 ;C	;1C87 C3
	DB C5 ;E	;1C88 C5
	DB D3 ;S	;1C89 D3
	DB D3 ;S	;1C8A D3
	DB BD ;=	;1C8B BD
	DB $06		;1C8C 06

	DB 0		;1C8D 00 end of list

L_1c8e: ; file option? keywords
	DB C1 ; A	;1C8E C1		starts with A
	DW L_1c86	;1c8f 1C 86 fixupWord
	DB C2 ; B	;1C91 C2		starts with B
	DW L_1c62	;1c92 1C 62 fixupWord
	DB C3 ; C	;1C94 C3		starts with C
	DW L_1c6a	;1c95 1C 6A fixupWord
	DB C6 ; F	;1C97 C6		starts with F
	DW L_1c71	;1c98 1C 71 fixupWord
	DB CB ;K	;1C9a CB		starts with K
	DW L_1c79	;1c9b 1C 79 fixupWord
	DB D2 ; R	;1C9D D2		starts with R
	DW L_1c7e	;1c9a 1C 7E fixupWord
	DB 0		;1CA0 00		end of list

L_1ca1: ; jump table for 1c8e
	DW L_1B75	;1CA1 1B 75  fixupword	not found?
	DW L_1BE7	;1CA3 1B E7  fixupword	Buffer= ?
	DW L_1C07	;1CA5 1C 07  fixupword	Class= ?
	DW L_1C13	;1CA7 1C 13  fixupword	FilTyp= ?
	DW L_1C40	;1CA9 1C 40  fixupword	Key= ?
	DW L_1C57	;1CAB 1C 57  fixupword	RecSiz= ?
	DW L_1BAC	;1CAD 1B AC  fixupword	Access= ?

L_1CAF:	JSR E_0966	;1CAF 79 09 66 fixupWord	get a name from text
	BNZ L_1cb8	;1CB2 15 04
L_1cb4:	JSR L_0de3	;1CB4 79 0D E3 fixupWord
	DB $14		;1CB7 14
	LDA L_09C2+1	;1cb8 91 09 C3  fixupword
	LDB #L_8000	;1CBB D0 80 00
	ORI BW,AW	;1CBE 53 02
	STB (L_1cb9)	;1CC0 F4 F7
	JSR E_098b	;1CC2 79 09 8B fixupWord
	RSR		;1CC5 09

E_1CC6: ; Record
	JSR L_1caf	;1CC6 7B E7
	BZ L_1ccd	;1CC8 14 03
	JSR (L_1cb5)	;1CCA 7C E9	L_0de3
	DB 8		;1CCC 08
L_1CCD:	JSR L_0cac	;1CCD 79 0C AC fixupWord	 write inline byte | $80 to object file???
	DB 2		;1CD0 02
	CLA		;1CD1 3A
	JSR L_0cc2	;1CD2 79 0C C2 fixupWord
	LDB (YW)	;1CD5 DB
	LDA L_0900	;1CD6 91 09 00 fixupWord
	STA 2(BW)	;1CD9 B5 28 02
	DCR AW,2	;1CDC 31 01
	STA L_1d39	;1CDE B3 59
	LDA (BW)	;1CE0 99
	LDBB #$10	;1CE1 C0 10
	SABB		;1CE3 49
	BM L_1ce9	;1CE4 16 03
	JSR (L_1cb5)	;1CE6 7C CD	L_0de3
	DB $15		;1CE8 15
	???		;1ce9 22 00
L_1CEB:	STA (-SW)	;1CEB B5 A2
	JSR (L_1cd3)	;1CED 7C E4
	LDA (SW+)	;1CEF 95 A1
	SLR AW,2	;1CF1 35 01
	LDB #L_0faf	;1CF3 D0 0F AF fixupWord
	AAB		;1CF6 58
	STB L_1d1b	;1CF7 F3 22
	CLA		;1CF9 3A
	STA 2(BW)	;1CFA B5 28 02
L_1cfd:	JSR E_0b81	;1CFD 79 0B 81 fixupWord	compare text with inline
	DB 'S'+$80	;1D00 D3
	DB 'A'+$80	;1d01 C1
	DB 'M'+$80	;1D02 CD
	DB 'E'+$80	;1D03 C5
	DB 1		;1d04 01
	BZ @1d1e	;1D05 14 17
	JSR (L_1cfd+1)	;1D07 7C F5	 E_0b81	compare text with inline
	DB 'A'+$80	;1D09 C1
	DB 'R'+$80	;1d0a D2
	DB 'E'+$80	;1d0b C5
	DB 'A'+$80	;1D0C C1
	DB 1		;1d0d 01
	JSR ???		;1d0e 7B 9F
	BNZ @1d15	;1D10 15 03
	JSR (L_1cb5)	;1D12 7C A1	L_0de3
	DB $18		;1D14 1B
@1d15:	LDB (YW+)	;1d15 D5 61
	LDB (BW)	;1D17 D9
	CLRB BH,0	;1d18 22 20
	LDA #0		;1d1a 90 00 00
	STB (AW)	;1D1D F8
@1D1E:	LDAB #1		;1D1E 80 01
L_1d20:	STAB L_1057	;1D20 A1 10 57 fixupWord
L_1D23:	JMP L_1083	;1D23 71 10 83 fixupWord

E_1D26:	JSR (L_1cfd+1)	;1D26 7C D6	 E_0b81	compare text with inline
	DB 'E'+$80	;1D28 C5
	DB 'N'+$80	;1d29 CE
	DB 'D'+$80	;1d2a C4
	Db 'R'+$80	;1D2B D2
	DB 'E'+$80	;1d2c C5
	DB 'C'+$80	;1d2d C3
	DB 1		;1D2E 01
	BZ L_1d58	;1D2F 14 27
	CLAB		;1D31 2A
	STAB (L_1d20+1)	;1D32 A4 ED	L_1057
	DCAB		;1D34 29
	JSR L_0ccc	;1D35 79 0C CC fixupWord
	LDA #0		;1D38 90 00 00
	LDB L_0900	;1D3B D1 09 00 fixupWord
	JSR L_0dae	;1D3E 79 0D AE fixupWord
	LDA (L_1d1b)	;1D41 94 D8
	BM L_1d23	;1D43 16 DE
	SLR AW,2	;1D45 35 01
	LDB #L_0fb1	;1D47 D0 0F B1 fixupWord
	AAB		;1D4A 58
	LDA (BW)	;1D4B 99
	LDB L_1d1b	;1D4C D3 CD
	LDB 02(BW)	;1D4E D5 28 02
L_1D51:	SAB		;1D51 59
	BP L_1d23	;1D52 17 CF
	JSR L_0de3	;1D54 79 0D E3 fixupWord
L_1d57:	DB $18		;1D57 18
	JSR E_0B81	;1d58 79 0B 81  fixupword	compare text with inline
	DB '@'+$80	;1D5B C0
	DB 1		;1d5c 01
	STAB (-SW)	;1D5D A5 A2
	BZ L_1d69	;1D5F 14 08
	JSR E_0b81	;1D61 79 0B 81 fixupWord	compare text with inline
	DB '?'+$80	;1D64 BF
	DB 2		;1D65 02
	BZ L_1d69	;1D66 14 01
	STAB (SW)	;1D68 AD
L_1D69:	JSR E_0966	;1D69 79 09 66 fixupWord	get a name from text
	BNZ L_1d72	;1D6C 15 04
	JSR L_0de3	;1D6E 79 0D E3 fixupWord
	DB $14	?	;1D71 14
	JSR E_098B	;1d72 79 09 8B  fixupword
	LDA @(YW)	;1D75 95 64
	LDB #$4000	;1D77 D0 40 00
	NAB		;1D7A 5A
	BZ L_1d80	;1D7B 14 03
L_1D7D:	JSR (L_1d71)	;1D7D 7C F2
	BP L_1d51	;1D7F 17 D0
	INRB AH,1	;1D81 20 00
	NAB		;1D83 5A
	BZ L_1dae	;1D84 14 28
	JSR L_1dd5	;1D86 7B 4D
	JSR L_0b2f	;1D88 79 0B 2F fixupWord	is text char a number? (consume if true)
	BZ L_1d7d	;1D8B 14 F0
	LDA (YW+)	;1D8D 95 61
	LDBB (SW)	;1D8F CD
	BZ L_1d93	;1D90 14 01
	INA		;1D92 38
L_1D93:	XAB		;1D93 5D
	BLE L_1d7d	;1D94 19 E7
	STA (-SW)	;1D96 B5 A2
	JSR L_1e12	;1D98 7B 78
	LDA (SW+)	;1D9A 95 A1
	JSR L_0cc2	;1D9C 79 0C C2 fixupWord
	LDAB (SW+)	;1D9F 85 A1
	JSR L_0ccc	;1DA1 79 0C CC fixupWord
E_1DA4:	JSR E_0b81	;1DA4 79 0B 81 fixupWord	compare text with inline
	DB ','+$80	;1DA7 AC
	DB 1		;1DA8 01
	BNZ L_1d58	;1DA9 15 AD
	JMP L_1083	;1DAB 71 10 83 fixupWord

L_1DAE:	LDB #$1000	;1DAE D0 10 00
	NAB		;1DB1 5A
	BNZ @1dca	;1DB2 15 16
	JSR L_1dd5	;1DB4 7B 1F
	LDAB (SW)	;1DB6 8D
	JSR L_0ccc	;1DB7 79 0C CC fixupWord
	LDA #6		;1DBA 90 00 06
@1DBD:	LDBB (SW+)	;1DBD C5 A1
	DCRB BL,1	;1DBF 21 30
	BNZ @1dc6	;1DC1 15 03
	LDA #4		;1DC3 90 00 04
@1DC6:	JSR L_1e12	;1DC6 7B 4A
	JMP L_1da4	;1DC8 73 DA

@1DCA:	JSR L_1dd5	;1DCA 7B 09
	LDAB (SW)	;1DCC 8D
	JSR L_0ccc	;1DCD 79 0C CC fixupWord
	LDA #2		;1DD0 90 00 02
	JMP @1dbd	;1DD3 73 E8

E_1DD5:	LDA (YW)	;1DD5 9B
	LDB 2(AW)	;1DD6 D5 08 02
	LDA (AW)	;1DD9 98
	STA (YW)	;1DDA BB
	STB (-SW)	;1DDB F5 A2
	BM L_1e0b	;1DDD 16 2C
	JSR (L_1da4+1)	;1DDF 7C C4	E_0b81	compare text with inline
	DB '+"+$80	;1DE1 A8
	DB 1		;1DE2 01
	BNZ L_1de8	;1DE3 15 03
L_1DE5:	JSR (L_1d71?)	;1DE5 7C 8A
	SL?		;1DE7 06
L_1DE8:	JSR (L_1d89)	;1DE8 7C 9F
L_1DEA:	BZ L_1d7d	;1DEA 14 91
L_1DEC:	LDA (SW)	;1DEC 9D
	BZ L_1e03	;1DED 14 14
	ADD AW,0(YW)??	;1DEF 77 71 00 00
	STB (YW)	;1DF3 FB
	JSR (L_1da4+1)	;1DF4 7C AF	E_0b81	compare text with inline
	DB ','+$80	;1DF6 AC
	DB 1		;1DF7 01
	BZ L_1de5	;1DF8 14 EB
	JSR (L_1d89)	;1DFA 7C 8D
	BZ L_1dea	;1DFC 14 EC
	LDA (YW+)	;1DFE 95 61
	LDB (YW)	;1E00 DB
	AAB		;1E01 58
	STB (YW)	;1E02 FB
L_1E03:	LDA (YW+)	;1E03 95 61
	LDB (YW)	;1E05 DB
	AAB		;1E06 58
	STB (YW)	;1E07 FB
	JSR L_0bb4	;1E08 79 0B B4 fixupWord
L_1E0B:	LDA (SW+)	;1E0B 95 A1
	LDA (YW+)	;1E0D 95 61
	JSR (L_1d9d)	;1E0F 7C 8C
	RSR		;1E11 09

L_1E12:	STX (-SW)	;1E12 6D A2
	LDX L_1d1b	;1E14 61 1D 1B fixupWord
	LDB 2(XW)	;1E17 D5 48 02
	AAB		;1E1A 58
	STB 2(XW)	;1E1B F5 48 02
	LDX (SW+)	;1E1E 65 A1
	RSR		;1E20 09

L_1E21:	LDA (XW+)	;1E21 95 41
	STX (-SW)	;1E23 6D A2
	XFR XW,YW	;1E25 55 64
	STX (-SW)	;1E27 6D A2
	LDX (AW+)	;1E29 65 01
	XAY		;1E2B 5C
@1E2C:	DCX		;1E2C 3F
	BM @1e42	;1E2D 16 13
	LDAB (YW)	;1E2F 8B
	LDBB #$fa	;1E30 C0 FA
	SABB		;1E32 49
	BGZ @1e3e	;1E33 18 09
	LDBB #$e1	;1E35 C0 E1
	SABB		;1E37 49
	BM @1e3e	;1E38 16 04
	LDAB #$c1	;1E3A 80 C1
	ADDB AL,BL	;1E3C 40 31
@1E3E:	STAB (YW+)	;1E3E A5 61
	JMP @1e2c	;1E40 73 EA

@1E42:	LDA (SW+)	;1E42 95 A1
	XAY		;1E44 5C
	LDX (SW+)	;1E45 65 A1
	RSR		;1E47 09

E_1E48: ; write inline string ptr to console
	JSR L_1e5d	;1E48 7B 13
	LDA (XW+)	;1E4A 95 41
	JSR L_1e71	;1E4C 7B 23
	DB 2		;1E4E 02
	RSR		;1E4F 09

E_1E50:	LDAB #$af	;1E50 80 AF
	BP @1e56	;1E52 17 02
	JSR L_1e64	;1E54 7B 0E
@1E56:	LDA (XW+)	;1E56 95 41
	JSR L_1e71	;1E58 7B 17
	DB 1		;1E5A 01
	JMP L_1ea6	;1E5B 73 49

E_1E5D:	LDAB #$8d	;1E5D 80 8D
	LDBB L_1e8b+1	;1E5F C3 2B
	SABB		;1E61 49
	BZ L_1e6c	;1E62 14 08
E_1E64:	STAB L_1e6f	;1E64 A3 09
	LDA #L_1e6d	;1E66 90 1E 6D fixupWord
	JSR L_1e71	;1E69 7B 06
	DB 2		;1E6B 02
L_1E6C:	RSR		;1E6C 09

L_1e6d: ; string
	DW 1		;1E6D 00 01
L_1e6f:	DB 0		;1E6F 00
	DB 0		;1E70 00

L_1E71:	STA L_1e94	;1E71 B3 21
	LDAB (XW+)	;1E73 85 41
	STAB L_1e8e+3	;1E75 A3 1A
@1e77:	LDB #L_1e8e	;1E77 D0 1E 8E fixupWord
	SVC $10		;1E7A 66 10
@1E7C:	SVC $07		;1E7C 66 07
	LDAB L_1e8e	;1E7E 83 0E
	BM @1e7c	;1E80 16 FA
	LDB @1e77+1	;1E82 D3 F4	L_1e8e
	SVC $5c		;1E84 66 5C
	DB 1		;1e86 01 
	DB 1		;1e87 01 
	DB $12		;1e88 12 
	DW L_1E8b+1	;1e89 1e 8c FixupWord
L_1e8b:	LDAB #0		;1E8B 80 00	modified
	RSR		;1E8D 09

L_1b8e: ; short file control block?
	DB 00	;1E8E 00	status
	DB 81	;1E8F 81
	DB 00	;1E90 00
	DB 0	;1E91 00	function?
L_1e92:	DW 132	;1E92 00 84
L_1e94:	DW 0	;1E94 00 00
	DB 00	;1E96 00
	DB 00	;1E97 00

E_1E98:	LDA #L_1e6d	;1E98 90 1E 6D fixupWord
	LDB (AW)	;1E9B D8
	STB L_1e92	;1E9C F3 F4
	JSR L_1e71	;1E9E 7B D1
	DB 1		;1EA0 01
	LDA #132	;1EA1 90 00 84
	STA L_1e92	;1EA4 B3 EC
E_1EA6:	LDAB L_1e8b+1	;1EA6 83 E4
	LDBB #$8a	;1EA8 C0 8A
	BZ @1eb5	;1EAA 14 09
	SABB		;1EAC 49
	BNZ @1eb5	;1EAD 15 06
	LDA #0		;1EAF 90 00 00
	BZ @1eb5	;1EB2 14 01
	XAX		;1EB4 5B
@1EB5:	LDAB L_1e6f	;1EB5 83 B8
	RSR		;1EB7 09

L_1eb8:
	DB 11		;1EB8 0B
	DW L_1F4D	;1EB9 1F 4D  fixupword
	DW L_1F9F	;1EBB 1F 9F  fixupword
	DW 0		;1EBD 00 00
	DW L_1ECF	;1EBF 1E CF  fixupword
	DW 0		;1EC1 00 00
	DW 0		;1EC3 00 00
	DW 0		;1EC5 00 00
	DW 0		;1EC7 00 00
	DW 0		;1EC9 00 00
	DW 0		;1ECB 00 00
	DW L_2022	;1ECD 20 22  fixupword

E_1ECF:	STX (-SW)	;1ECF 6D A2
	JSR L_1efe	;1ED1 7B 2B
	DB 2		;1ED3 02
	BZ @1efc	;1ED4 14 26
	CLA		;1ED6 3A
	STA $12(ZW)	;1ED7 B5 88 12
	STA $16(ZW)	;1EDA B5 88 16
	STB $14(ZW)	;1EDD F5 88 14
	STB $18(ZW)	;1EE0 F5 88 18
	JSR L_1efe	;1EE3 7B 19
	DB 5		;1EE5 05
	LDBB #$0f	;1EE6 C0 0F
	ANDB BL,BH	;1EE8 42 23
	LDAB $d(ZW)	;1EEA 85 88 0D
	BM @1ef5	;1EED 16 06
	SABB		;1EEF 49
	BZ @1ef5	;1EF0 14 03
	SVC $09		;1EF2 66 09		abort
	DB $12		;1ef4 12 		  code
@1EF5:	LDA 6(ZW)	;1EF5 95 88 06
	BZ @1efc	;1EF8 14 02
	JSR L_1f15	;1EFA 7B 19
@1EFC:	JMP L_1f73	;1EFC 73 75

E_1EFE:	LDAB (XW+)	;1EFE 85 41
	STAB @1f08	;1F00 A3 06
	XFR BW,ZW	;1F02 55 82
	SVC $52		;1F04 66 52
	DB 1		;1f06 01 
	DB 2		;1f07 02 
@1f08:	DB 0		;1f08 00 
	DW @1F0f+1	;1f09 1f 10 FixupWord
	XFR BW,BW	;1F0B 55 22
	BZ @1f14	;1F0D 14 05
@1f0f	LDB #0		;1F0F D0 00 00	modified
	XFR AW,AW	;1F12 55 00
@1F14:	RSR		;1F14 09

L_1F15:	JSR L_1efe	;1F15 7B E7
	DB 2		;1F17 02
	LDA $16(ZW)	;1F18 95 88 16
	SUB AW,BW	;1F1B 51 20
	BL @1f23	;1F1D 10 04
	LDAB #1		;1F1F 80 01
	JMP @1f37	;1F21 73 14

@1F23:	LDA $16(ZW)	;1F23 95 88 16
	STA $12(ZW)	;1F26 B5 88 12
	STA 8(ZW)	;1F29 B5 88 08
	JSR L_1f41	;1F2C 7B 13
	DB 1		;1F2E 01
	LDB $12(ZW)	;1F2F D5 88 12
	INR BW,1	;1F32 30 20
	STB $16(ZW)	;1F34 F5 88 16
@1F37:	STAB (ZW)	;1F37 AC
	RSR		;1F38 09

E_1F39:	LDAB (ZW)	;1F39 8C
	BP @1f40	;1F3A 17 04
	SVC $07		;1F3C 66 07
	JMP E_1f39	;1F3E 73 F9

@1F40:	RSR		;1F40 09

L_1F41:	XFR BW,ZW	;1F41 55 82
	LDAB (XW+)	;1F43 85 41
	STAB 3(ZW)	;1F45 A5 88 03
	SVC $00		;1F48 66 00
	JSR L_1f39	;1F4A 7B ED
	RSR		;1F4C 09

E_1F4D:	STX (-SW)	;1F4D 6D A2
@1F4F:	LDA 06(ZW)	;1F4F 95 88 06
	INR AW,2	;1F52 30 01
	LDB $18(ZW)	;1F54 D5 88 18
	STB $14(ZW)	;1F57 F5 88 14
	ADD AW,BW	;1F5A 50 20
	XAY		;1F5C 5C
	LDA (YW)	;1F5D 9B
	LDBB #$84	;1F5E C0 84
	LDAB #1		;1F60 80 01
	SUBB BL,AH	;1F62 41 03
	BZ L_1f72	;1F64 14 0C
	DCRB AH,1	;1F66 21 00
	BNF L_1f77	;1F68 13 0D
	JSR L_1f15	;1F6A 7B A9
	CLA		;1F6C 3A
	STA $18(ZW)	;1F6D B5 88 18
	JMP @1f4f	;1F70 73 DD

E_1F72:	STAB (ZW)	;1F72 AC
E_1F73:	LDB (SW+)	;1F73 D5 A1
	SVC $68		;1F75 66 68
L_1F77:	LDA (YW)	;1F77 9B
	CLRB AH,0	;1F78 22 00
	LDB #L_0005	;1F7A D0 00 05
	ADD AW,BW	;1F7D 50 20
	LDB $18(ZW)	;1F7F D5 88 18
	AAB		;1F82 58
	STB $18(ZW)	;1F83 F5 88 18
	LDB $10(ZW)	;1F86 D5 88 10
	XAX		;1F89 5B
	CLA		;1F8A 3A
@1F8B:	DCX		;1F8B 3F
	BLE @1f96	;1F8C 19 08
	LDAB (YW+)	;1F8E 85 61
	STAB (BW+)	;1F90 A5 21
	ADDB AH,AL	;1F92 40 10
	JMP @1f8b	;1F94 73 F5

@1F96:	LDAB (YW)	;1F96 8B
	ADDB AL,AH	;1F97 40 01
	BZ L_1f72	;1F99 14 D7
	LDAB #$04	;1F9B 80 04
	JMP L_1f72	;1F9D 73 D3

E_1F9F:	STX (-SW)	;1F9F 6D A2
@1FA1:	LDA 6(ZW)	;1FA1 95 88 06
	INR AW,2	;1FA4 30 01
	XAY		;1FA6 5C
	LDA $18(ZW)	;1FA7 95 88 18
	STA $14(ZW)	;1FAA B5 88 14
	ADD YW,AW	;1FAD 50 06
	LDX $10(ZW)	;1FAF 65 88 10
	LDB (XW)	;1FB2 DA
	LDBB #$84	;1FB3 C0 84
	SUBB BH,BL	;1FB5 41 32
	BNZ @1fbc	;1FB7 15 03
	STBB (YW)	;1FB9 EB
	JMP @1fed	;1FBA 73 31

@1FBC:	LDB (XW)	;1FBC DA
	CLRB BH,0	;1FBD 22 20
	AAB		;1FBF 58
	LDA #5		;1FC0 90 00 05
	AAB		;1FC3 58
	STB $18(ZW)	;1FC4 F5 88 18
	LDA #L_018a	;1FC7 90 01 8A
	SAB		;1FCA 59
	BP @1fd3	;1FCB 17 06
	JSR L_1fff	;1FCD 7B 30
	BZ @1fa1	;1FCF 14 D0
	JMP L_1f72	;1FD1 73 9F

@1FD3:	LDA (XW+)	;1FD3 95 41
	XAB		;1FD5 5D
	CLRB AH,0	;1FD6 22 00
	STB (YW+)	;1FD8 F5 61
	ADDB BH,BL	;1FDA 40 32
	INA		;1FDC 38
@1FDD:	LDBB (XW+)	;1FDD C5 41
	STBB (YW+)	;1FDF E5 61
	ADDB BH,BL	;1FE1 40 32
	DCA		;1FE3 39
	BP @1fdd	;1FE4 17 F7
	LDBB #$80	;1FE6 C0 80
	IVRB BH,0	;1FE8 23 20
	INRB BH,1	;1FEA 20 20
	STB (YW)	;1FEC FB
@1FED:	CLAB		;1FED 2A
	JMP L_1f72	;1FEE 73 82

E_1FF0:	CLA		;1FF0 3A
	STA $18(ZW)	;1FF1 B5 88 18
	LDA $12(ZW)	;1FF4 95 88 12
	STA 8(ZW)	;1FF7 B5 88 08
	JSR L_1f41	;1FFA 79 1F 41 fixupWord
	DB 2		;1FFD 02
	RSR		;1FFE 09

L_1FFF:	JSR E_1ff0	;1FFF 7B EF
	BNZ @201e	;2001 15 1B
	JSR L_1efe	;2003 79 1E FE fixupWord
	DB 2		;2006 02
	LDA $16(ZW)	;2007 95 88 16
	STA $12(ZW)	;200A B5 88 12
	INA		;200D 38
	STA $16(ZW)	;200E B5 88 16
	DCA		;2011 39
	SUB AW,BW	;2012 51 20
	BL @201d	;2014 10 07
	XFR BW,ZW	;2016 55 82
	SVC $19		;2018 66 19
	XAB		;201A 5D
	BNZ @201f	;201B 15 02
@201D:	CLA		;201D 3A
@201E:	RSR		;201E 09

@201F:	LDAB #2		;201F 80 02
	RSR		;2021 09

L_2022:	STX ??		;2022 6D A2
	JSR ???		;2024 7B CA
	JMP ???		;2026 73 C6

E_2028: ; remove trailing spaces from a string
	LDA (XW+)	;2028 95 41	get string ptr
	STX (-SW)	;202A 6D A2	save X
	STA (-SW)	;202C B5 A2	save A
	LDX (AW+)	;202E 65 01	get string length
	BLE @2040	;2030 19 0E	zero length?
	ADD AW,XW	;2032 50 40	goto end of string
	LDB #$a0a0	;2034 D0 A0 A0	AH=blank
@2037:	LDBB (-AW)	;2037 C5 02	get previous char
	SUBB BL,BH	;2039 41 23	blank?
	BNZ @2040	;203B 15 03
	DCX		;203D 3F	decrement length
	BGZ @2037	;203E 18 F7
@2040:	LDA (SW+)	;2040 95 A1	restore string ptr
	STX (AW)	;2042 6D 00	store new length
	LDX (SW+)	;2044 65 A1	restore X
	RSR		;2046 09	return

