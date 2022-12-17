; load at $200

	DW 0,4	;0200 00 00 00 00 00 00 00 00
	DW 0,4	;0208 00 00 00 00 00 00 00 00
	DW 0,4	;0210 00 00 00 00 00 00 00 00
	DW 0,4	;0218 00 00 00 00 00 00 00 00
	DW 0,4	;0220 00 00 00 00 00 00 00 00
	DW 0,4	;0228 00 00 00 00 00 00 00 00
	DW 0,4	;0230 00 00 00 00 00 00 00 00
	DW 0,4	;0238 00 00 00 00 00 00 00 00
	DW 0,4	;0240 00 00 00 00 00 00 00 00
	DW 0,4	;0248 00 00 00 00 00 00 00 00
	DW 0,4	;0250 00 00 00 00 00 00 00 00
	DW 0,4	;0258 00 00 00 00 00 00 00 00
	DW 0,2	;0260 00 00 00 00
RSTop:  ; top of return stack

	DW L_026B	;0264 02 6B ; fixupword
	DB 0	;0266 00
	DB 0	;0267 00
	DB 0	;0268 00
	DB 0	;0269 00
	DB 0	;026A 00
	DB 0	;026B 00
	DB $84	;026C 84
	DB 0	;026D 00
	DB 0	;026E 00
	DB 0	;02F3 00
	DB 0	;02F4 00

FCB81: ; console FCB?  SYSIPT?
	DB 0	;02F5 00	status?
	DB $81	;02F6 81	device #?
	DB 0	;02F7 00
	DB 0	;02F8 00	func?
	DB 0	;02F9 00
	DB 0	;02FA 00
	DB 0	;02FB 00
	DB 0	;02FC 00
	DB 0	;02FD 00
	DB 0	;02FE 00
	DB 0	;02FF 00
	DB 0	;0300 00
	DB 1	;0301 01
	DB 2	;0302 02
	DB 0	;0303 00
	DB 0	;0304 00
	DB 0	;0305 00
	DB 0	;0306 00
	DB 0	;0307 00
	DB 0	;0308 00
	DB 0	;0309 00
	DB 0	;030A 00
	DB 0	;030B 00
	DB 0	;030C 00
	DB 0	;030D 00
	DB 0	;030E 00
	DB 0	;030F 00
	DB 0	;0310 00
	DB 0	;0311 00
	DB 0	;0312 00

FCB0: ; FCB?
	DB 0	;0313 00
	DB 0	;0314 00
	DB 0	;0315 00
	DB 0	;0316 00
	DW $190	;0317 01 90
	DW L_036D	;0319 03 6D ; fixupword
	DB 0	;031B 00
	DB 0	;031C 00
	DB 0	;031D 00
	DB 1	;031E 01
	DB 2	;031F 02
	DB 2	;0320 02
	DB 0	;0321 00
	DB 0	;0322 00
	DB 0	;0323 00
	DB 0	;0324 00
	DB 0	;0325 00
	DB 0	;0326 00
	DB 0	;0327 00
	DB 0	;0328 00
	DB 0	;0329 00
	DB 0	;032A 00
	DB 0	;032B 00
	DB 0	;032C 00
	DB 0	;032D 00
	DB 0	;032E 00
	DB 0	;032F 00
	DB 0	;0330 00

FCB1: ; FCB?
	DB 0	;0331 00	status
	DB 1	;0332 01	device #
	DB 0	;0333 00
	DB 0	;0334 00
	DW 400	;0335 01 90
	DW L_0500	;0337 05 00 ; fixupword
	DB 0	;0339 00
	DB 0	;033A 00
	DB 0	;033B 00
	DB 1	;033C 01
	DB 2	;033D 02
	DB 2	;033E 02
	DB 0	;033F 00
	DB 0	;0340 00
	DB 0	;0341 00
	DB 0	;0342 00
	DB 0	;0343 00
	DB 0	;0344 00
	DB 0	;0345 00
	DB 0	;0346 00
	DB 0	;0347 00
	DB 0	;0348 00
	DB 0	;0349 00
	DB 0	;034A 00
	DB 0	;034B 00
	DB 0	;034C 00
	DB 0	;034D 00
	DB 0	;034E 00

FCB2: ; FCB?
	DB 0	;034F 00	status
	DB 2	;0350 02	device #
	DB 0	;0351 00
	DB 0	;0352 00
	DW 400	;0353 01 90
	DW L_0693 ;0355 06 93 ; fixupword
	DB 0	;0357 00
	DB 0	;0358 00
	DB 0	;0359 00
	DB 1	;035A 01
	DB 2	;035B 02
	DB 2	;035C 02
	DB 0	;035D 00
	DB 0	;035E 00
	DB 0	;035F 00
	DB 0	;0360 00
	DB 0	;0361 00
	DB 0	;0362 00
	DB 0	;0363 00
	DB 0	;0364 00
	DB 0	;0365 00
	DB 0	;0366 00
	DB 0	;0367 00
	DB 0	;0368 00
	DB 0	;0369 00
	DB 0	;036A 00
	DB 0	;036B 00
	DB 0	;036C 00
	DB 0	;04FF 00
	DB 0	;0692 00
	DB 0	;0825 00
L_0826:

	DB 0	;08AA 00

	DB 0	;092F 00

	DB 0	;0936 00

	DB 0	;093D 00
	DB 0	;093E 00

L_093f: ; buffer?
	DB 2	;093F 02
	DB 0	;0940 00
	DB $84	;0941 84
	DB 0	;0942 00
	DB 1	;0943 01
	DB 0	;0944 00
	DB 1	;0945 01
	DB 2	;0946 02
	DB 0	;0947 00
	DB 6	;0948 06
	DB 0	;0949 00
	DB 2	;094A 02
	DB 0	;094B 00
	DB 2	;094C 02
	DB 2	;094D 02
	DB 0	;094E 00
	DB $82	;094F 82
	DB 0	;0950 00
	DB 2	;0951 02
	DB 0	;0952 00
	DB 7	;0953 07
	DB 2	;0954 02

	DB 0	;0955 00
	DB 9	;0956 09
	DB 0	;0957 00

Msg_0958: ; cstring
	DB 'A'+$80	;0958 C1
	DB 'S'+$80	;0959 D3
	DB 'P'+$80	;095A D0
	DB 'R'+$80	;095B D2
	DB 'P'+$80	;095C D0
	DB ' '+$80	;095D A0
	DB '-'+$80	;095E AD
	DB ' '+$80	;095F A0
	DB '6'+$80	;0960 B6
	DB '.'+$80	;0961 AE
	DB '0'+$80	;0962 B0
	DB '2'+$80	;0963 B2
	DB 0		;0964 00

Msg_0965: ; cstring
	DB 'E'+$80	;0965 C5
	DB 'N'+$80	;0966 CE
	DB 'D'+$80	;0967 C4
	DB ' '+$80	;0968 A0
	DB 'A'+$80	;0969 C1
	DB 'S'+$80	;096A D3
	DB 'P'+$80	;096B D0
	DB 'R'+$80	;096C D2
	DB 'P'+$80	;096D D0
	DB 0		;096E 00

Msg_096f:
	DB 'C'+$80	;096F C3
	DB 'O'+$80	;0970 CF
	DB 'P'+$80	;0971 D0
	DB 'Y'+$80	;0972 D9
	DB 0		;0973 00

	DB 'N'+$80	;0974 CE
	DB 'O'+$80	;0975 CF
	DB 0		;0976 00

	DB 'P'+$80	;0977 D0
	DB 'R'+$80	;0978 D2
	DB 'I'+$80	;0979 C9
	DB 'N'+$80	;097A CE
	DB 'T'+$80	;097B D4
	DB 0		;097C 00

	DB ' '+$80	;097D A0
	DB 'P'+$80	;097E D0
	DB 'R'+$80	;097F D2
	DB 'I'+$80	;0980 C9
	DB 'N'+$80	;0981 CE
	DB 'T'+$80	;0982 D4
	DB ' '+$80	;0983 A0
	DB 'O'+$80	;0984 CF
	DB 'F'+$80	;0985 C6
	DB 'F'+$80	;0986 C6
	DB ','+$80	;0987 AC
	DB 'N'+$80	;0988 CE
	DB 'O'+$80	;0989 CF
	DB 'C'+$80	;098A C3
	DB 'O'+$80	;098B CF
	DB 'M'+$80	;098C CD
	DB 0		;098D 00

Msg_098e:
	DB ' '+$80	;098E A0
	DB 'P'+$80	;098F D0
	DB 'R'+$80	;0990 D2
	DB 'I'+$80	;0991 C9
	DB 'N'+$80	;0992 CE
	DB 'T'+$80	;0993 D4
	DB ' '+$80	;0994 A0
	DB 'O'+$80	;0995 CF
	DB 'N'+$80	;0996 CE
	DB ','+$80	;0997 AC
	DB 'C'+$80	;0998 C3
	DB 'O'+$80	;0999 CF
	DB 'M'+$80	;099A CD
	DB 0		;099B 00

	DB '*'+$80	;099C AA
	DB '$'+$80	;099D A4
	DB 0		;099E 00

	DB 'N'+$80	;099F CE
	DB 'O'+$80	;09A0 CF
	DB 'T'+$80	;09A1 D4
	DB ' '+$80	;09A2 A0
	DB 'F'+$80	;09A3 C6
	DB 'O'+$80	;09A4 CF
	DB 'U'+$80	;09A5 D5
	DB 'N'+$80	;09A6 CE
	DB 'D'+$80	;09A7 C4
	DB 0		;09A8 00

	DB ' '+$80 	;09A9 A0
	DB ' '+$80	;09AA A0
	DB ' '+$80	;09AB A0
	DB ' '+$80	;09AC A0
	DB ' '+$80	;09AD A0
	DB ' '+$80	;09AE A0
	DB 0		;09AF 00
	DB 0		;09B4 00
	DB 0		;09B5 00
	DB 0		;09B6 00
	DB 1		;09B7 01
	DB 0		;09B8 00
	DB 0		;09B9 00
	DB 0		;09BA 00
	DB 0		;09BB 00

L_09bc:	DW L_0264	;09BC 02 64 ; fixupword

E_09BE: ; Main entry point
	XFR SW,SW,$264	;09BE 55 BA 02 64 ; fixupword
	XFR ZW,ZW,$bf3	;09C2 55 98 0B F3 ; fixupword
	SVC $5d		;09C6 66 5D			something commonly at startup
	DW 2		;09C8 00 02
	DB 25		;09cA 19
	DW L_09bc	;09Cb 09 bc ; fixupword
???	STA (ZW)	;09CC BC
	NOP		;09CD 01
	SVC $39		;09CE 66 39			open files or terminal?
	DB 2		;09D0 02
	DW FCB81	;09D1 02 F5 ; fixupword
	DB 0		;09D3 00
	NOP		;09D4 01
	SVC $35		;09D5 66 35
	DW FCB81	;09D7 02 F5 ; fixupword		console FCB?
	DW L_093F	;09D9 09 3F ; fixupword
	DW L_0958	;09DB 09 58 ; fixupword		name & version
	DW 0		;09DD 00 00
	NOP		;09DF 01
	SVC $39		;09E0 66 39			open files?
	DB 1		;09E2 01
	DW FCB0		;09E3 03 13 ; fixupword
	DB 1		;09E5 01
	DW FCB2		;09E6 03 4F ; fixupword
	DB 2		;09E8 02
	DW FCB1		;09E9 03 31 ; fixupword
	DB 0		;09EB 00
	NOP		;09EC 01
	SVC $29		;09ED 66 29			@MV
	DW L_08AB	;09EF 08 AB ; fixupword
	DW L_093E	;09F1 09 3E ; fixupword
	DW 0		;09F3 00 00
L_09F5:	NOP		;09F5 01
	SVC $34		;09F6 66 34			@RF
	DW FCB0		;09F8 03 13 ; fixupword
	DW L_093F	;09FA 09 3F ; fixupword
	DW L_0826	;09FC 08 26 ; fixupword
	DW 0		;09FE 00 00
	NOP		;0A00 01
	SVC $26		;0A01 66 26			@CN
	DW L_0267	;0A03 02 67 ; fixupword
	DW L_0266	;0A05 02 66 ; fixupword
	DW L_0B91	;0A07 0B 91 ; fixupword
	DB 6		;0A09 06
	LDA #L_0826	;0A0A 90 08 26 ; fixupword
	STA L_0bc3+1	;0A0D B1 0B C4 ; fixupword
	LDAB (AW)	;0A10 88
	LDBB #$a0	;0A11 C0 A0
	SABB		;0A13 49
	BNZ @0a26	;0A14 15 10
	JSR E_0be2	;0A16 79 0B E2 ; fixupword
	JSR E_0bb4	;0A19 79 0B B4 ; fixupword
	NOP		;0A1C 01
	SVC $27		;0A1D 66 27			@CS
	DW L_0937	;0A1F 09 37 ; fixupword
	DW L_096F	;0A21 09 6F ; fixupword
	DW L_0A3E	;0A23 0A 3E ; fixupword
	DB 1		;0A25 01
@0A26:	NOP		;0A26 01
	SVC $35		;0A27 66 35			write formatted?
	DW FCB1		;0A29 03 31 ; fixupword		  ptr FCB
	DW L_093F	;0A2B 09 3F ; fixupword		  buf
	DW L_0826	;0A2D 08 26 ; fixupword		  format?
	DW 0		;0A2F 00 00
	NOP		;0A31 01
	SVC $26		;0A32 66 26			@CN
	DW L_0267	;0A34 02 67 ; fixupword
	DW 0		;0A36 00 00
	DW L_09F5	;0A38 09 F5 ; fixupword
	DB 1		;0A3A 01
	SVC $09		;0A3B 66 09			abort
	DB $34		;0A3D 34			   abort code

	JSR E_0BB4	;0A3E 79 0B B4 ; fixupword
	NOP		;0A41 01
	SVC $1e		;0A42 66 1E			@LD
	DW L_0266	;0A44 02 66 ; fixupword
	DB 1		;0A46 01
	SVC $1f		;0A47 66 1F			@ST
	DW L_09B0	;0A49 09 B0 ; fixupword

@0A4B:	LDAB #$a8	;0A4B 80 A8
	LDBB 08ab	;0A4D C1 08 AB ; fixupword
	SABB		;0A50 49
	BZ @0a8e	;0A51 14 3B
	NOP		;0A53 01
	SVC $34		;0A54 66 34			@RF
	DW FCB2		;0A56 03 4F ; fixupword		ptr FCB
	DW L_093F	;0A58 09 3F ; fixupword
	DW L_08AB	;0A5A 08 AB ; fixupword
	DW 0		;0A5C 00 00
	NOP		;0A5E 01
	SVC $26		;0A5F 66 26			@CN
	DW L_0267	;0A61 02 67 ; fixupword
	DW L_0266	;0A63 02 66 ; fixupword
	DW @0A4B	;0A65 0A 4B ; fixupword
	DB 1		;0A67 01
	NOP		;0A68 01
	SVC $29		;0A69 66 29			@MV
	DW L_08AB	;0A6B 08 AB ; fixupword
	DW L_093E	;0A6D 09 3E ; fixupword
	DW 0		;0A6F 00 00
	NOP		;0A71 01
	SVC $3a		;0A72 66 3A			@CT
	DB 4		;0A74 04
	DW FCB2		;0A75 03 4F ; fixupword
	NOP		;0A77 01
	SVC $26		;0A78 66 26			@CN
	DW L_09B0	;0A7A 09 B0 ; fixupword
	DW L_0266	;0A7C 02 66 ; fixupword
	DW L_0AB7	;0A7E 0A B7 ; fixupword
	DB 6		;0A80 06
	NOP		;0A81 01
	SVC $1e		;0A82 66 1E			@LD
	DW L_09B4	;0A84 09 B4 ; fixupword
	DB 1		;0A86 01
	SVC $1f		;0A87 66 1F			@ST
	DW L_09B0	;0A89 09 B0 ; fixupword
	JMP @0A4B	;0A8B 71 0A 4B ; fixupword

@0a8e:	NOP		;0A8E 01
	SVC $32		;0A8F 66 32			@DC
	DW L_08AB	;0A91 08 AB ; fixupword
	DW L_0943	;0A93 09 43 ; fixupword
	DW L_0930	;0A95 09 30 ; fixupword
	DW 0		;0A97 00 00
	NOP		;0A99 01
	SVC $27		;0A9A 66 27			@CS
	DW L_0937	;0A9C 09 37 ; fixupword
	DW L_0930	;0A9E 09 30 ; fixupword
	DW L_0AD1	;0AA0 0A D1 ; fixupword
	DB 1		;0AA2 01
	NOP		;0AA3 01
	SVC $27		;0AA4 66 27			@CS
	DW L_0937	;0AA6 09 37 ; fixupword
	DW L_0930	;0AA8 09 30 ; fixupword
	DW L_0A53	;0AAA 0A 53 ; fixupword
	DB 4		;0AAC 04
	NOP		;0AAD 01
	SVC $26		;0AAE 66 26			@CN
	DW L_09B0	;0AB0 09 B0 ; fixupword
	DW L_0266	;0AB2 02 66 ; fixupword
	DW L_0A68	;0AB4 0A 68 ; fixupword
	DB 1		;0AB6 01
	NOP		;0AB7 01
	SVC $1e		;0AB8 66 1E			@LD
	DW $64		;0ABA 00 64
	DB 1		;0ABc 01
	SVC $1f		;0ABD 66 1F			@ST
	DW L_09B8	;0ABF 09 B8 ; fixupword
	NOP		;0AC1 01
	SVC $35		;0AC2 66 35			@WF  write formatted
	DW FCB81	;0AC4 02 F5 ; fixupword		  ptr FCB 
	DW L_0951	;0AC6 09 51 ; fixupword		  ptr buf
	DW L_0937	;0AC8 09 37 ; fixupword		  ptr format literal
	DW L_099F	;0ACA 09 9F ; fixupword		  ?
	DW 0		;0ACC 00 00
	JMP @0a26	;0ACE 71 0A 26 ; fixupword

L_0ad1:	NOP		;0AD1 01
	SVC $35		;0AD2 66 35			@WF  write formatted
	DW FCB1		;0AD4 03 31 ; fixupword		ptr FCB
	DW L_094A	;0AD6 09 4A ; fixupword		ptr buf
	DW L_099C	;0AD8 09 9C ; fixupword		ptr format lit
	DW L_0826	;0ADA 08 26 ; fixupword		?
	DW 0		;0ADC 00 00
	NOP		;0ADE 01
	SVC $26		;0ADF 66 26			@CN
	DW L_0267	;0AE1 02 67 ; fixupword
	DW 0		;0AE3 00 00
	DW L_0A3B	;0AE5 0A 3B ; fixupword
	DB 6		;0AE7 06
	NOP		;0AE8 01
	SVC $1e		;0AE9 66 1E			@LD
	DW L_0266	;0AEB 02 66 ; fixupword
	DB 1		;0AED 01
	SVC $1f		;0AEE 66 1F			@ST
	DW L_09B0	;0AF0 09 B0 ; fixupword

	JSR E_0bb4	;0AF2 79 0B B4 ; fixupword
	NOP		;0AF5 01
	SVC $27		;0AF6 66 27			@CS
	DW L_0937	;0AF8 09 37 ; fixupword
	DW L_0974	;0AFA 09 74 ; fixupword
	DW L_0B2B	;0AFC 0B 2B ; fixupword
	DB 6		;0AFE 06
	JSR E_0bb4	;0AFF 79 0B B4 ; fixupword
	NOP		;0B02 01
	SVC $27		;0B03 66 27			@CS
	DW L_0937	;0B05 09 37 ; fixupword
	DW L_0977	;0B07 09 77 ; fixupword
	DW L_0B2B	;0B09 0B 2B ; fixupword
	DB 6		;0B0B 06
	NOP		;0B0C 01
	SVC $1e		;0B0D 66 1E			@LD
	DW L_09B4	;0B0F 09 B4 ; fixupword
	DB 1		;0B11 01
	SVC $1f		;0B12 66 1F			@ST
	DW L_09B0	;0B14 09 B0 ; fixupword
	NOP		;0B16 01
	SVC $35		;0B17 66 35			@WF  write formatted
	DW FCB1		;0B19 03 31 ; fixupword
	DW L_093F	;0B1B 09 3F ; fixupword
	DW L_097D	;0B1D 09 7D ; fixupword
	DW 0		;0B1F 00 00
	NOP		;0B21 01
	SVC $26		;0B22 66 26			@CN
	DW L_0267	;0B24 02 67 ; fixupword
	DW 0		;0B26 00 00
	DW L_0A3B	;0B28 0A 3B ; fixupword
	DB 6		;0B2A 06
L_0B2B:	NOP		;0B2B 01
	SVC $34		;0B2C 66 34			@RF
	DW FCB2		;0B2E 03 4F ; fixupword		  ptr FCB
	DW L_093F	;0B30 09 3F ; fixupword
	DW L_08AB	;0B32 08 AB ; fixupword
	DW 0		;0B34 00 00
	NOP		;0B36 01
	SVC $26		;0B37 66 26			@CN
	DW L_0267	;0B39 02 67 ; fixupword
	DW L_0266	;0B3B 02 66 ; fixupword
	DW L_0B71	;0B3D 0B 71 ; fixupword
	DB 1		;0B3F 01
	NOP		;0B40 01
	SVC $29		;0B41 66 29			@MV
	DW L_08AB	;0B43 08 AB ; fixupword
	DW L_093E	;0B45 09 3E ; fixupword
	DW 0		;0B47 00 00
	NOP		;0B49 01
:	SVC $3a		;0B4A 66 3A			@CT
	DB 4		;0B4C 04
	DW FCB2		;0B4D 03 4F ; fixupword
L_0B4F:	NOP		;0B4F 01
	SVC $26		;0B50 66 26			@CN
	DW L_09B0	;0B52 09 B0 ; fixupword
	DW L_0266	;0B54 02 66 ; fixupword
	DW L_09F5	;0B56 09 F5 ; fixupword
	DB 1		;0B58 01
	NOP		;0B59 01
	SVC $35		;0B5A 66 35			@WF  write formatted
	DW FCB1		;0B5C 03 31 ; fixupword		  ptr FCB
	DW L_093F	;0B5E 09 3F ; fixupword		  ptr buff
	DW Msg_098E	;0B60 09 8E ; fixupword		  ptr format literal
	DW 0		;0B62 00 00
	NOP		;0B64 01
	SVC $26		;0B65 66 26			@CN
	DW L_0267	;0B67 02 67 ; fixupword
	DW 0		;0B69 00 00
	DW L_0A3B	;0B6B 0A 3B ; fixupword
	DB 6		;0B6D 06
	JMP L_09f5	;0B6E 71 09 F5 ; fixupword

E_0B71:	LDAB 08ab	;0B71 81 08 AB ; fixupword
	LDBB #a8	;0B74 C0 A8
	SABB		;0B76 49
	BZ L_0b4f	;0B77 14 D6
	NOP		;0B79 01
	SVC $35		;0B7A 66 35			@WF  write formatted
	DW FCB1		;0B7C 03 31 ; fixupword		  ptr FCB
	DW L_093F	;0B7E 09 3F ; fixupword		  ptr buff
	DW L_08AB	;0B80 08 AB ; fixupword		  ptr format literal
	DW 0		;0B82 00 00
	NOP		;0B84 01
	SVC $26		;0B85 66 26			@CN
	DW L_0267	;0B87 02 67 ; fixupword
	DW 0		;0B89 00 00
	DW L_0A3B	;0B8B 0A 3B ; fixupword
	DB 6		;0B8D 06
	JMP L_0b2b	;0B8E 71 0B 2B ; fixupword

L_0B91:	JSR @L_0BF9	;0B91 7A 0B F9 ; fixupword
	DW FCB1		;0B94 03 31 ; fixupword
	SVC $05		;0B96 66 05			@TS  get date/time
	DB $C		;0B98 0C			  format?
	DW FCB0		;0B99 03 13 ; fixupword		  ptr buf
	SVC $05		;0B9B 66 05			@TS  get date/time
	DB $d		;0B9D 0D			  format?
	DW FCB1		;0B9E 03 31 ; fixupword		  ptr buf
	NOP		;0BA0 01
	SVC $35		;0BA1 66 35			@WF  write formatted
	DW FCB81	;0BA3 02 F5 ; fixupword		  ptr FCB
	DW L_093F	;0BA5 09 3F ; fixupword		  ptr buf
	DW L_0965	;0BA7 09 65 ; fixupword		  ptr format lit
	DW 0		;0BA9 00 00
	LDAB 09bb	;0BAB 81 09 BB ; fixupword
	STAB @0bb3	;0BAE A3 03
	NOP		;0BB0 01
	SVC $0a		;0BB1 66 0A			@EN  end task
@0bb3:	DB $ff		;0BB3 FF			  return code

E_0BB4:
	NOP		;0BB4 01
	SVC $29		;0BB5 66 29			@MV
	DW L_0937	;0BB7 09 37 ; fixupword
	DW L_09A9	;0BB9 09 A9 ; fixupword
	DW 0		;0BBB 00 00
	STX (-SW)	;0BBD 6D A2			save X
	LDA #L_0937	;0BBF 90 09 37 ; fixupword
	XAY		;0BC2 5C
L_0bc3:	LDX #0		;0BC3 60 00 00
	LDA #$0600	;0BC6 90 06 00
@0BC9:	LDAB (XW+)	;0BC9 85 41
	BP @0bda	;0BCB 17 0D
	LDBB #$a0	;0BCD C0 A0
	SABB		;0BCF 49
	BZ @0bdb	;0BD0 14 09
	STAB (YW+)	;0BD2 A5 61
	DCRB AH,1	;0BD4 21 00
	BGZ @0bc9	;0BD6 18 F1
	JMP @0bdb	;0BD8 73 01

@0BDA:	DCX		;0BDA 3F
@0BDB:	STX L_0bc3+1	;0BDB 6B E7
	LDX (SW+)	;0BDD 65 A1
	JSR E_0be2	;0BDF 7B 01
	RSR		;0BE1 09

E_0BE2:
	STX (-SW)	;0BE2 6D A2
	LDX L_0bc3+1	;0BE4 63 DE
@0BE6:	LDAB (XW+)	;0BE6 85 41
	LDBB #a0	;0BE8 C0 A0
	SABB		;0BEA 49
	BZ @0be6	;0BEB 14 F9
	DCX		;0BED 3F
	STX L_0bc3+1	;0BEE 6B D4
	LDX (SW+)	;0BF0 65 A1
	RSR		;0BF2 09

E_0BF3:
	SVC $56		;0BF3 66 56
	DB $8c		;0BF5 8C
	DB 0		;0BF6 00
	DB $8b		;0BF7 8B
	DB 0		;0BF8 00
	DW @0BFB	;0BF9 0B FB ; fixupword
@0BFB:	LDA (XW+)	;0BFB 95 41
	STA @0c0a	;0BFD B3 0B
	STA @0c11	;0BFF B3 10
	LDB 0a(AW)	;0C01 D5 08 0A
	DCR BW,8	;0C04 31 27
	BZ @0c0e	;0C06 14 06
	SVC $38		;0C08 66 38		@WB
@0c0a:	DW 0		;0C0A 00 00
	DW @0C14	;0C0C 0C 14 ; fixupword
@0C0E:	SVC $3a		;0C0E 66 3A		@CT
	DB B		;0C10 0B
@0c11:	DW 0		;0C11 00 00
	RSR		;0C13 09

@0c14:	DW 2		;0C14 00 02
	DW 2		;0C16 00 02
	DB $84		;0C18 84	ctl-d
	DB $8D		;0C19 8D	return
