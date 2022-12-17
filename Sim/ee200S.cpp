// ee200S.cpp : Defines the entry point for the console application.
// ee200 (Centurion like) machine simulator
// https://github.com/Nakazoto/CenturionComputer/wiki/Instructions

#include "stdafx.h"

#include <ctype.h>
#include <string.h>
// #include <alloc.h>
// #include <stdarg.h>
// #include <dos.h>
#include <conio.h>
// #include <mem.h>
#include <stdio.h>
#include <stdlib.h>
// #include <math.h>
#include <io.h>
#include <errno.h>
#include <fcntl.h>
#include <share.h>
#include <stdlib.h>
#include <malloc.h>
// #include <assert.h>
#include <windows.h>

#include <sys/types.h>
#include <sys/stat.h>

//#include <unistd.h>
typedef unsigned __int8 uint8_t;
typedef unsigned __int16 uint16_t;
typedef unsigned __int32 uint32_t;

#ifndef O_BINARY
#define O_BINARY 0
#endif


static unsigned __int32 swapr(unsigned __int32 const v1) {
	union { unsigned __int32 d;  unsigned __int8 b[4]; } v;  v.d=v1;
	return (unsigned __int32(v.b[0])<<24)|(unsigned __int32(v.b[1])<<16)|(unsigned __int32(v.b[2])<<8)|v.b[3];  }
static unsigned __int64 swapr(unsigned __int64 const v1) {
	union { unsigned __int64 q;  unsigned __int8 b[8]; } v;  v.q=v1;
	return (unsigned __int64(v.b[0])<<56)|(unsigned __int64(v.b[1])<<48)|(unsigned __int64(v.b[2])<<40)|(unsigned __int64(v.b[3])<<32)|
			(unsigned __int64(v.b[4])<<24)|(unsigned __int64(v.b[5])<<16)|(unsigned __int64(v.b[6])<<8)|v.b[7];  }

// VHD file format: https://technet.microsoft.com/en-us/library/bb676673.aspx
#pragma pack(1)
struct VHDFOOTER {
	char Cookie[8]; // uniquely identify the original creator
	unsigned __int32 Features; // bit field used to indicate specific feature support.
	unsigned __int32 FileFormatVersion; // 0x00010000
	unsigned __int64 DataOffset; // For fixed disks, this field should be set to 0xFFFFFFFF.
	unsigned __int32 TimeStamp; // number of seconds since January 1, 2000 12:00:00 AM in UTC/GMT.
	char CreatorApplication[4];
	unsigned __int32 CreatorVersion;
	char CreatorHostOS[4];
	unsigned __int64 OriginalSize; // in bytes
	unsigned __int64 CurrentSize; // in bytes
	struct { unsigned __int16 Cylinders; unsigned __int8 Heads, Sectors; } DiskGeometry;
	enum DiskType1 : unsigned __int32 { None=0, FixedHardDisk=2, DynamicHardDisk=3, DifferencingHardDisk=4 } DiskType;
	unsigned __int32 Checksum; // one’s complement of the sum of all the bytes in the footer without the checksum field.
	unsigned __int64 UniqueId[2]; // UUID
	enum SavedState1 : unsigned __int8 { NotSaved=0, Saved=1 } SavedState;
	unsigned __int8 Reserved[427]; // contains zeros

	bool CheckCheck(void) const {
		unsigned __int8 const *p=(unsigned __int8 const *)this;
		unsigned __int32 s=0; for(unsigned i=0; i<sizeof(this); i++) if(i<68 || i>=72) s+=p[i];
		unsigned __int32 cs=swapr(Checksum);
		return (s^cs)==0;  } // ???this is wrong
	} ; // VHDFOOTER
#pragma pack()

struct VHD { 
	int F; // file handle
	__int64 VDataSize;
	~VHD() { _close(F);  F=0; }
	VHD(char const *Fn) {
		VHDFOOTER Foot;  if(sizeof(Foot)!=512) __debugbreak();
		errno_t rc=_sopen_s(&F,Fn,_O_BINARY|_O_RDWR,_SH_DENYWR,_S_IREAD | _S_IWRITE);  if(rc) {
			perror(NULL);  printf("VHD: open failed with %d on %s \n",rc,Fn); exit(rc); }
		//	__int64 FLen=_filelengthi64(F);
		VDataSize=_lseeki64(F,__int64(0)-sizeof(Foot),SEEK_END);
		int r2=_read(F,&Foot,sizeof(Foot)); if(r2!=sizeof(Foot)) {
			perror(NULL); printf("VHD: footer read failed\n");
			exit(1); }
		if(swapr(Foot.FileFormatVersion)!=0x10000) {
			printf("VHD: bad FileFormatVersion of %x, assuming raw file \n",Foot.FileFormatVersion); }
		else {
			//if(!Foot.CheckCheck()) { printf("VHD: bad footer checksum \n"); exit(1); }
			if(swapr(Foot.CurrentSize)!=VDataSize) { printf("VHD: bad CurrentSize\n"); exit(1); }
			if(swapr(Foot.DiskType)!=Foot.FixedHardDisk) { printf("VHD: not fixed hard disk\n"); exit(1); }
			if(Foot.SavedState!=Foot.NotSaved) { printf("VHD: should not be saved state\n"); }
			}
		}
	errno_t Read(void *Buf, size_t Size, __int64 const Pos) {
		if(Pos>=VDataSize || (Pos+Size)>=VDataSize) { printf("VHD::Read: out of range \n");  return 6; }
		_lseeki64(F,Pos,SEEK_SET);
		return _read(F,Buf,Size);  }
	errno_t Write(void *Buf, size_t Size, __int64 const Pos) {
		if(Pos>=VDataSize || (Pos+Size)>=VDataSize) { printf("VHD::Write: out of range \n");  return 6; }
		_lseeki64(F,Pos,SEEK_SET);
		return _write(F,Buf,Size);  }
	} ;


struct PERF1 {
	static unsigned const Size=0x10000;
	struct E { unsigned Inst,Cycles; } A[Size];
	inline void Cnt(unsigned PC, unsigned Cycles) { if(PC<Size) { A[PC].Inst++; A[PC].Cycles+=Cycles; } }
	PERF1() { memset(&A,0,sizeof(A)); }
	void Rpt(char const *Fn) {
		FILE *F=0;  errno_t rc=fopen_s(&F,Fn,"wtS");
		for(unsigned i=0; i<Size; i++) {
			if(A[i].Inst>500) {
				fprintf(F,"%06X\t%u\t%u\n",i,A[i].Inst,A[i].Cycles); } }
		fclose(F);
		}
	void Rpt2(char const *Fn) {
		FILE *F=0;  errno_t rc=fopen_s(&F,Fn,"wtS");
		E Max, C2[Size/32];
		Max.Inst=0; Max.Cycles=0;
		for(unsigned i=0; i<Size; i+=32) {
			unsigned vi=0,vc=0;  for(unsigned j=0; j<32; j++) { vi+=A[i+j].Inst; vc+=A[i+j].Cycles; }
			C2[i/32].Inst=vi; C2[i/32].Cycles=vc;
			if(Max.Inst<vi) Max.Inst=vi;  if(Max.Cycles<vc) Max.Cycles=vc;  }
		for(unsigned i=0; i<Size/32; i++) {
			unsigned vi=C2[i].Inst, vc=C2[i].Cycles;
			if(vi>5000) {
				fprintf(F,"%06X\t%u\t%u\t",i*32,vi,vc);
				for(unsigned j=vc/(Max.Cycles/64); j; j--) fprintf(F,"*");  fprintf(F,"\n");
				} }
		fclose(F);
		}
	} ; // PERF1

static int Debug78237482=12;




struct CONSOLEIO {
	unsigned PollInst, PollCnt; // detect console polling & slow down
	//unsigned __int8 ConsoleWait; // waiting for LF to be output
	unsigned __int8 InKey;	bool InKeyAvailable;  // input key buffer
	void SetInKey(unsigned __int8 v) { InKey=v; InKeyAvailable=1; }
	enum OUTSTATE : unsigned __int8 { Idle=0, QuestionMark, Null, Abort } OutState;

	void Reset(void) { InKeyAvailable=0; OutState=Idle; }
	void OutHexNibble(uint8_t v) { v&=0xf; if(v>=10) v+=7; v+='0'; OutChr(v); }
	void OutHexByte(uint8_t v) { OutHexNibble(v>>4); OutHexNibble(v); }
	void OutHexWord(uint16_t v) { OutHexByte(uint8_t(v>>8)); OutHexByte(uint8_t(v)); }
	void OutChr(unsigned __int8 Chr) {
		_putch(Chr);  PollCnt=0; PollInst=0;
		switch(OutState) {
			case Idle: if(Chr=='?') OutState=QuestionMark;  break;
			case QuestionMark: OutState= (Chr==0)?Null:Idle;  break;
			case Null: OutState=(Chr==' ')?Abort:Idle;  break;
			}
		}
//	unsigned __int8 GetChr(void) { while(!InKeyAvailablePollCnt) { }  InKeyAvailable=0; return InKey; }
	unsigned __int8 GetChrNowait(void) { PollCnt=0; InKeyAvailable=0; return InKey; }
	unsigned __int8 Status(void) {
		++PollCnt;
		return (2) | (InKeyAvailable?1:0);
		}
	bool Polling(void) { return PollCnt>1000; }
	void Command(unsigned __int8 v) { }
	} ConsoleIo;

//*******************************************************
// memory

struct MEMREGION {
	unsigned __int32 Start, Len;
	MEMREGION *Next;
	static unsigned __int32 const IoBase=0x40000;
	inline bool IsIn(unsigned __int32 const Adr) { return (Adr-Start)<Len; }
	virtual void Write(unsigned __int32 Adr, unsigned __int8 v) { __debugbreak(); }
	virtual unsigned __int8 Read(unsigned __int32 Adr) { __debugbreak(); return 0; }
	} ;

struct CENTURIONBOOTROM : public MEMREGION {
	// fc00..fdff
	unsigned __int8 const *Rom;
	CENTURIONBOOTROM(unsigned AdrBase) {
		Start=IoBase+AdrBase; Len=0x200; Next=0;
		static const unsigned __int8 RomInit[512]={
							//		EntryPoint:
		0x1a, 0x02,			//fc00:        bs1 L_fc04 ; Check the Sense switch to see if we should jump straight to DIAG
		0x73, 0x03,			//fc02:        jump (PC+0x03) L_fc07

							//		L_fc04:
		0x71, 0x80, 0x01,	//fc04:        jump #0x8001 L_8001

							//		L_fc07:
		0x80, 0xc5,			//fc07:        ld AL, #0xc5
		0xa1, 0xf2, 0x00,	//fc09:        st AL, (0xf200) ; Configure the first port on the mux board to 9600 baud, 8N1
		0x80, 0x8c,			//fc0c:        ld AL, #0x8c
		0xa1, 0xf2, 0x01,	//fc0e:        st AL, (0xf201) ; Write control code FF aka Form Feed to serial
							//             ; Should cause a printer to move to the next page, and
                            //          ; cause a CRT terminal to clear the screen
		0x0e,				//fc11:        delay 4.5ms
		0x0e,				//fc12:        delay 4.5ms

							//		Prompt:
		0x90, 0x10, 0x00,	//fc13:        ld AX, #0x1000
		0x5f,				//fc16:        mov SP, AX ; Setup stack at 0x1000 (probally)
		0x7b, 0x79,			//fc17:        call (PC+0x79) WriteString
		0xc4, 0xbb, 0x00,	//fc19:			"D=\0"
		0x7b, 0x72,			//fc1c:        call (PC+0x72) ReadCharTramp
		0xc0, 0xc6,			//fc1e:        ld BL, #0xc6 ; B == 'F'
		0x49,				//fc20:        sub! BL, AL
		0xe5, 0xa2,			//fc21:        st BL, -(SP)
		0x14, 0x0a,			//fc23:        bz GetNextChar
		0xc0, 0xc3,			//fc25:        ld BL, #0xc3 ; B == 'C'
		0x49 ,				//fc27:        sub! BL, AL
		0x14, 0x05,			//fc28:        bz GetNextChar
		0xc0, 0xc8,			//fc2a:        ld BL, #0xc8 ; B == 'H'
		0x49,				//fc2c:        sub! BL, AL
		0x15, 0x50,			//fc2d:        bnz PrintError

							//		GetNextChar:
		0x7b, 0x72,			//fc2f:            call (PC+0x72) ReadChar
		0xc0, 0x50,			//fc31:            ld BL, #0x50
		0x40, 0x31,			//fc33:            add AL, BL
		0x16, 0x48,			//fc35:            blt PrintError ; Reject anything below ASCI 0x30 aka '0'
		0xc5, 0xa1,			//fc37:            ld BL, (SP)+
		0x16, 0x7f,			//fc39:            blt LoadFromCMDTramp
		0x18, 0x7f,			//fc3b:            bgt LoadFromHawkTramp
		0xc0, 0x03,			//fc3d:            ld BL, #0x03
		0x49,				//fc3f:               sub! BL, AL
		0x18, 0x3d,			//fc40:           bgt PrintError
		0xd0, 0x0f, 0x00,	//fc42:         ld BX, #0x0f00
		0xf5, 0xa2,			//fc45:            st BX, -(SP)
		0x32, 0x20,			//fc47:           clr BX
		0xf5, 0xa2,			//fc49:            st BX, -(SP)
		0xc0, 0x88,			//fc4b:            ld BL, #0x88
		0xe5, 0xa2,			//fc4d:           st BL, -(SP)
		0xd0, 0x83, 0x00,	//fc4f:         ld BX, #0x8300
		0xf5, 0xa2,			//fc52:            st BX, -(SP)
		0xd0, 0x81, 0x00,	//fc54:         ld BX, #0x8100
		0x06 ,				//fc57:              fsc

							//		LoadFromFFC:
		0x27, 0x30,			//fc58:            rlc BL
		0x29,				//fc5a:               dec! AL
		0x17, 0xfb,			//fc5b:            ble LoadFromFFC
		0xf5, 0xa2,			//fc5d:            st BX, -(SP)
		0x2f, 0x14,			//fc5f:            dma_set_mode 1
		0x2f, 0x06,			//fc61:            dma_enable
		0x2f, 0xa0,			//fc63:            dma_load_addr SP
		0x90, 0xff, 0xf6,	//fc65:         ld AX, #0xfff6
		0x2f, 0x02,			//fc68:            dma_load_count WX
		0x7b, 0x22,			//fc6a:            call (PC+0x22) FFC_CommandTramp
		0x43,				//fc6c:               (0x43)
		0x90, 0x01, 0x00,	//fc6d:         ld AX, #0x0100
		0x2f, 0x00,			//fc70:            dma_load_addr WX
		0x90, 0xf0, 0xff,	//fc72:         ld AX, #0xf0ff
		0x2f, 0x02,			//fc75:            dma_load_count WX
		0x7b, 0x15,			//fc77:            call (PC+0x15) FFC_CommandTramp
		0x45,				//fc79:               (0x45)
		0x15, 0x03,			//fc7a:            bnz PrintError
		0x71, 0x01, 0x03,	//fc7c:         jump #0x0103 IPL_Entry_point

							//		PrintError:
		0x7b,0x11,			//fc7f:            call (PC+0x11) WriteString
		0x8d,0x8a,0xc5,0xd2,//fc81:    "\r\nERROR\r\n\0"
		0xd2,0xcf,0xd2,0x8d,
		0x8a,0x00,
		0x07,				//fc8b:              fcc
		0x73,0x85,			//fc8c:            jump (PC-0x7b) Prompt

							//		FFC_CommandTramp:
		0x73,0x73,			//fc8e:            jump (PC+0x73) FFC_Command

							//		ReadCharTramp:
		0x73,0x11,			//fc90:            jump (PC+0x11) ReadChar

							//		WriteString:
		0x81,0xf2,0x00,		//fc92:         ld AL, (0xf200)
		0x2c,				//fc95:               srl! AL
		0x2c,				//fc96:               srl! AL
		0x11,0xf9,			//fc97:            bnc WriteString
		0x85,0x41,			//fc99:            ld AL, (RT)+
		0x15,0x01,			//fc9b:            bnz L_fc9e
		0x09,				//fc9d:              ret

							//		L_fc9e:
		0xa1,0xf2,0x01,		//fc9e:         st AL, (0xf201)
		0x73,0xef,			//fca1:            jump (PC-0x11) WriteString

							//		ReadChar:
		0x84,0xee,			//fca3:            ld AL, @(PC-0x12)
		0x2c,				//fca5:               srl! AL
		0x11,0xfb,			//fca6:            bnc ReadChar
		0x84,0xf5,			//fca8:            ld AL, @(PC-0xb)
		0xc0,0x80,			//fcaa:            ld BL, #0x80
		0x43,0x31,			//fcac:            or AL, BL ; char | 0x80 - Force bit 7 to be set
		0xc0,0xe0,			//fcae:            ld BL, #0xe0
		0x49,				//fcb0:               sub! BL, AL ; Check if char is lowercase (greater than 0x60)
		0x16,0x04,			//fcb1:            blt L_fcb7
		0xc0,0xdf,			//fcb3:            ld BL, #0xdf
		0x42,0x31,			//fcb5:            and AL, BL ; Clear bit 6, forcing it to be uppercase

							//		L_fcb7:
		0xa4,0xe6,			//fcb7:            st AL, @(PC-0x1a)
		0x09,				//fcb9:               ret

							//		LoadFromCMDTramp:
		0x73,0x62,			//fcba:            jump (PC+0x62) LoadFromCMD

							//		LoadFromHawkTramp:
		0x73,0x02,			//fcbc:            jump (PC+0x02) LoadFromHawk

							//		PrintErrorTramp:
		0x73,0xbf,			//fcbe:            jump (PC-0x41) PrintError

							//		LoadFromHawk:
		0xc0,0x07,			//fcc0:            ld BL, #0x07
		0x49,				//fcc2:               sub! BL, AL
		0x18,0xba,			//fcc3:            bgt PrintError
		0xa1,0xf1,0x40,		//fcc5:         st AL, (0xf140) ; HawkUnitSelect = A
		0x94,0x2d,			//fcc8:            ld AX, @(PC+0x2d)
		0xd0,0x00,0x10,		//fcca:         ld BX, #0x0010
		0x5a,				//fccd:               and! BX, AX
		0x14,0xaf,			//fcce:            bz PrintError
		0x3a,				//fcd0:              clr! AX
		0xb1,0xf1,0x41,		//fcd1:         st AX, (0xf141) ; HawkSectorAddressReg = (0, 0, 0)
		0x7b,0x3b,			//fcd4:            call (PC+0x3b) HawkCommand ; HawkCommand(3) - ReturnTrackZero
		0x03,				//fcd6:              (0x3)

							//		L_fcd7:
		0x94,0x1e,			//fcd7:            ld AX, @(PC+0x1e)
		0xd0,0x04,0x00,		//fcd9:        ld BX, #0x0400
		0x5a,				//fcdc:               and! BX, AX
		0x15,0xa0,			//fcdd:            bnz PrintError
		0xd0,0x00,0x20,		//fcdf:         ld BX, #0x0020
		0x5a,				//fce2:               and! BX, AX
		0x14,0xf2,			//fce3:            bz L_fcd7
		0x2f,0x04,			//fce5:            dma_set_mode 0
		0x2f,0x06,			//fce7:            dma_enable
		0x90,0x01,0x00,		//fce9:         ld AX, #0x0100 ; DMA transfer destination address
		0x2f,0x00,			//fcec:            dma_load_addr WX
		0x90,0xea,0x1f,		//fcee:         ld AX, #0xea1f ; DMA transfer size, 0xffff - (14 sectors at 400 bytes each)
		0x2f,0x02,			//fcf1:            dma_load_count WX
		0x7b,0x1c,			//fcf3:            call (PC+0x1c) HawkCommand ; HawkCommand(0) - Read
		0x00,				//fcf5:               (0x0)
		0x81,0xf1,0x44,		//fcf6:         ld AL, (0xf144) ; Check Command Status (0 == success?)
		0x15,0x84,			//fcf9:            bnz PrintError
		0x71,0x01,0x03,		//fcfb:         jump #0x0103 IPL_Entry_point ; Transfer control to the IPL that was loaded off disk
		0x7b,0x2f,			//fcfe:            call (PC+0x2f) L_fd2f

							//		AlternativeEntryPoint:
		0x71,0xfc,0x00,		//fd00:         jump #0xfc00 EntryPoint

							//		FFC_Command:
		0x85,0x41,			//fd03:            ld AL, (RT)+
		0xa1,0xf8,0x00,		//fd05:         st AL, (0xf800)

							//		L_fd08:
		0x81,0xf8,0x01,		//fd08:         ld AL, (0xf801)
		0x29,				//fd0b:               dec! AL
		0x15,0xfa,			//fd0c:            bnz L_fd08
		0x84,0xf6,			//fd0e:            ld AL, @(PC-0xa)
		0x09,				//fd10:               ret

							//		HawkCommand:
		0x85,0x41,			//fd11:            ld AL, (RT)+
		0xa1,0xf1,0x48,		//fd13:         st AL, (0xf148)

							//		WaitForHawkCommand:
		0x84,0xdf,			//fd16:            ld AL, @(PC-0x21) ; 0xf144
		0x2c,				//fd18:               srl! AL
		0x10,0xfb,			//fd19:            bc WaitForHawkCommand
		0x09,				//fd1b:               ret

							//		PrintErrorTramp2:
		0x73,0xa0,			//fd1c:            jump (PC-0x60) PrintErrorTramp

							//		LoadFromCMD:
		0xa5,0xa2,			//fd1e:            st AL, -(SP)
		0x90,0x1f,0x40,		//fd20:         ld AX, #0x1f40
		0x5e,				//fd23:               mov EX, AX
		0x90,0x81,0x00,		//fd24:         ld AX, #0x8100
		0xb5,0x81,			//fd27:            st AX, (EX)+
		0x80,0x84,			//fd29:            ld AL, #0x84
		0xa5,0x81,			//fd2b:            st AL, (EX)+
		0x85,0xa1,			//fd2d:            ld AL, (SP)+

							//		L_fd2f:
		0x14,0x04,			//fd2f:            bz L_fd35
		0xc0,0x0f,			//fd31:            ld BL, #0x0f
		0x40,0x31,			//fd33:            add AL, BL

							//		L_fd35:
		0xa5,0x81,			//fd35:            st AL, (EX)+
		0x80,0x83,			//fd37:            ld AL, #0x83
		0xa5,0x81,			//fd39:            st AL, (EX)+
		0x3a,				//fd3b:               clr! AX
		0xb5,0x81,			//fd3c:            st AX, (EX)+
		0x80,0x85,			//fd3e:            ld AL, #0x85
		0xa5,0x81,			//fd40:            st AL, (EX)+
		0x2a,				//fd42:               clr! AL

							//		L_fd43:
		0xa5,0x81,			//fd43:            st AL, (EX)+
		0xd0,0x01,0x90,		//fd45:         ld BX, #0x0190
		0xf5,0x81,			//fd48:            st BX, (EX)+
		0x28,				//fd4a:               inc! AL
		0xc0,0x0e,			//fd4b:            ld BL, #0x0e
		0x49,				//fd4d:               sub! BL, AL
		0x15,0xf3,			//fd4e:            bnz L_fd43
		0x80,0xff,			//fd50:            ld AL, #0xff
		0xa5,0x81,			//fd52:            st AL, (EX)+
		0x80,0x08,			//fd54:            ld AL, #0x08
		0x7b,0x4e,			//fd56:            call (PC+0x4e) CMDWait
		0x80,0x41,			//fd58:            ld AL, #0x41
		0xa1,0xf8,0x08,		//fd5a:         st AL, (0xf808)
		0x0e,				//fd5d:               delay 4.5ms
		0x2a,				//fd5e:               clr! AL
		0xa1,0xf8,0x08,		//fd5f:         st AL, (0xf808)
		0x0e,				//fd62:               delay 4.5ms
		0xa1,0xf8,0x08,		//fd63:         st AL, (0xf808)
		0x0e,				//fd66:               delay 4.5ms
		0x90,0x1f,0x40,		//fd67:         ld AX, #0x1f40
		0x2f,0x00,			//fd6a:            dma_load_addr WX
		0x51,0x80,			//fd6c:            sub AX, EX
		0x3b,				//fd6e:               not! AX
		0x2f,0x02,			//fd6f:            dma_load_count WX
		0x2f,0x34,			//fd71:            dma_set_mode 3
		0x2f,0x06,			//fd73:           dma_enable
		0x80,0x43,			//fd75:            ld AL, #0x43
		0xa1,0xf8,0x08,		//fd77:         st AL, (0xf808)
		0x0e,				//fd7a:               delay 4.5ms
		0x0e,				//fd7b:               delay 4.5ms
		0x7b,0x20,			//fd7c:            call (PC+0x20) CMDErrorCheck
		0x73,0x02,			//fd7e:            jump (PC+0x02) L_fd82

							//		PrintErrorTramp3:
		0x73,0x9a,			//fd80:            jump (PC-0x66) PrintErrorTramp2

							//		L_fd82:
		0x90,0x01,0x00,		//fd82:         ld AX, #0x0100
		0x2f,0x00,			//fd85:            dma_load_addr WX
		0x90,0xea,0x1f,		//fd87:         ld AX, #0xea1f
		0x2f,0x02,			//fd8a:            dma_load_count WX
		0x2f,0x34,			//fd8c:            dma_set_mode 3
		0x2f,0x06,			//fd8e:            dma_enable
		0x80,0x45,			//fd90:            ld AL, #0x45
		0xa1,0xf8,0x08,		//fd92:         st AL, (0xf808)
		0x80,0x08,			//fd95:            ld AL, #0x08
		0x7b,0x0d,			//fd97:            call (PC+0x0d) CMDWait
		0x7b,0x03,			//fd99:            call (PC+0x03) CMDErrorCheck
		0x71,0x01,0x03,		//fd9b:         jump #0x0103 IPL_Entry_point

							//		CMDErrorCheck:
							//    ; Returns if no error
		0x81,0xf8,0x08,		//fd9e:         ld AL, (0xf808)
		0x15,0x01,			//fda1:            bnz CMDError
		0x09,				//fda3:               ret

							//		CMDError:
		0x73,0xda,			//fda4:            jump (PC-0x26) PrintErrorTramp3

							//		CMDWait:
							//    ; Spins until command is done
		0xc1,0xf8,0x09,		//fda6:         ld BL, (0xf809)
		0x4a,				//fda9:               and! BL, AL
		0x15,0xfa,			//fdaa:            bnz CMDWait
		0x09,				//fdac:               ret
		0x8c,				//fdad:               ld AL, (EX)
		0x00,				//fdae:               HALT
		0x8b,				//fdaf:               ld AL, (DX)
		0x00,				//fdb0:               HALT
		0x95,0x41,			//fdb1:           ld AX, (RT)+
		0xb3,0x03,			//fdb3:            st AX, (PC+0x3)

							//		L_fdb5:
		0x79,0x4c,0x93,		//fdb5:         call #0x4c93 L_4c93
		0x47,0xbe,			//fdb8:            unk7 HL, SL
		0x6d,0xa2,			//fdba:            st RT, -(SP)
		0x32,0x40,			//fdbc:            clr RT

							//		L_fdbe:
		0x79,0x4c,0xe7,		//fdbe:         call #0x4ce7 L_4ce7
		0x4d,				//fdc1:               mov! BL, AL
		0x14,0x2a,			//fdc2:            bz L_fdee
		0xc0,0x8d,			//fdc4:            ld BL, #0x8d
		0x49,				//fdc6:               sub! BL, AL
		0x14,0x25,			//fdc7:            bz L_fdee
		0xc0,0xb0,			//fdc9:            ld BL, #0xb0
		0x49,				//fdcb:               sub! BL, AL
		0x16,0x25,			//fdcc:            blt L_fdf3
		0x80,0x09,			//fdce:            ld AL, #0x09
		0x41,0x31,			//fdd0:            sub AL, BL
		0x19,0x0e,			//fdd2:            ble L_fde2
		0x80,0x11,			//fdd4:            ld AL, #0x11
		0x41,0x31,			//fdd6:            sub AL, BL
		0x16,0x19,			//fdd8:            blt L_fdf3
		0xc0,0x05,			//fdda:            ld BL, #0x05
		0x49,				//fddc:               sub! BL, AL
		0x18,0x14,			//fddd:            bgt L_fdf3
		0xc0,0x0a,			//fddf:           ld BL, #0x0a
		0x48,				//fde1:               add! BL, AL

							//		L_fde2:
		0x80,0x04,			//fde2:            ld AL, #0x04

							//		L_fde4:
		0x07,				//fde4:               fcc
		0x37,0x40,			//fde5:            rlc RT
		0x29,				//fde7:               dec! AL
		0x18,0xfa,			//fde8:            bgt L_fde4
		0x40,0x35,			//fdea:            add RL, BL
		0x73,0xd0,			//fdec:            jump (PC-0x30) L_fdbe

							//		L_fdee:
		0x55,0x40,			//fdee:            mov AX, RT
		0x65,0xa1,			//fdf0:            ld RT, (SP)+
		0x09,				//fdf2:               ret

							//		L_fdf3:
		0x65,0xa1,			//fdf3:            ld RT, (SP)+
		0x73,0xbe,			//fdf5:            jump (PC-0x42) L_fdb5
		0xd5,0x41,			//fdf7:            ld BX, (RT)+
		0x7d,0x80,			//fdf9:            call (A + 0x80)
		0x0c,				//fdfb:               unknown
		0xd0,0x4b,0x65,		//fdfc:         ld BX, #0x4b65
		0xf5 //,0x00		//fdff:            st BX, (AX)
		} ;
		Rom=&RomInit[0];
		}

	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		fprintf(stderr,"CENTURIONBOOTROM::Write: to ROM addr %x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		return Rom[Addr&0x1ff]; }
	} ; // CENTURIONBOOTROM


class HAWK : MEMREGION { // disk controller for CDC 9427H Hawk

	//  fd4x: 4th Hawk disk controller
	//  f94x: 3rd Hawk disk controller
	//  f54x: 2nd Hawk disk controller
	//  f14x: 1st Hawk disk controller

	/*	"The Hawk disk controller design (DSK/Auto & DSKII) was 6 years
	 *	 before the AMD2901 was available.  The (DSK/Auto & DSKII) is a
	 *	 simple MMIO with a TTL state machine which runs in sync with the
	 *	 Hawks Read / Write data stream to advance the state machine.
	 *
	 *	 A basic sector read from the Hawk (DSK/Auto & DSKII)  is....
	 *	 Drive select Reg.  0xF140,    Sector address Reg. 0xf141-0xf142
	 *	 Status Reg ( I think ) 0xF143   and Command Reg 0xF148 (00 = read,
	 *	 01 = write,  02 = seek,   03 = RTZ Return Track Zero.
	 *       The (DSK/Auto & DSKII)  Hawk sectors are 400 bytes (0x190) long
	 *	 and R / W can be 1 to 16 sector operations based on the total bytes
	 *	 the DMA was setup to move in /out of DRAM. "
	 *			-- Ken Romain
	 *
	 *	"For the longest time the OPSYS minimum disk file size was 16 sectors
	 *	 for 400 bytes ( being one logical disk track and also one physical
	 *	 track on the CDC 9427H Hawk drive). When we had large soft sector
	 *	 drives like the 9448 Phoenix we still kept the 400 byte logical
	 *	 sector length and padded the sector to 512 bytes."
	 *			-- Ken Romain
	 */
	static unsigned const BytesPerSector=400;

	struct UNIT { // disk attached to this controller
		int fd; // file containing contents

		uint8_t ready;
		// High when:
		//  - This disk cartridge is installed
		//  - Spindle motor speed is correct
		//  - heads loaded
		//  - DC voltages within margin
		//  - no fault condition exists
		//  - unit selected
		//  - terminator is present and has power

		uint8_t on_cyl;
		// Set when the heads have finished seeking to the desired address.
		// Also high when a seek error occurs

		uint8_t seek_error;  // Sker
		// Set when the unit was unable to complete a seek operation.
		// A RTZS command from the controller clears the seek error
		// condition and returns the heads to cylinder 00.
		// On Cylinder is also asserted during seek error.

		uint8_t fault;
		// Indicates that the unit has encounterd one or more fault conditions:
		//  - more than one head selected
		//  - read and write gates true at same time
		//  - read and erase gates true at same time
		//  - controller enabled only one of the write and erase gates
		//  - low voltage
		//  - selecting fixed heads on drive without fixed disk option
		//  - Emergency retract
		//
		// Stays high until a RTZS operation.

		// Unimplemented output signals from Hawk unit
		// Some of them probally go in status.
		//   Index (sector 0 pulse), Sector (one pulse per sector),
		//   Address Interlock (bad address), Address Acknowledge (address accepted),
		//   Wr State (Write Protect), Sector Address (upto 6 bits), Density.
		//
		// See Page 25 of HAWK_9427_BP11_OCT80.pdf for details

		} Units[8];

	UNIT *Unit;  uint8_t unit; // current unit

	uint8_t sech, secl; // current sector, track, cylinder

	uint8_t dma_busy;
	// This is probally only set when it's doing (or waiting to do)
	// a DMA operation. But the controller might also mix in the On Cylinder
	// line while seeking.

	uint8_t data_error;
	// This is just a stand in for error various read/write error conditions.
	// Probally mostly coming from the controllers state machine. Sector not
	// found, or CRC failed. Probally also includes the Fault line


	uint16_t get_status(void) {
		// Not sure where data errors and fault goes,
		// lets just put it in all these remaining bits we suspect are errors
		UNIT *U=Unit;
		uint8_t unk_error_bit = U->fault | data_error;

		return (0               << 0) // Potentially four bits of current sector?
		     | (0               << 1)
		     | (0               << 2)
		     | (0               << 3)
		     | (U->ready        << 4) // Probably the ready signal from drive
		     | (U->on_cyl       << 5) // Head is on the correct cylinder, line from drive
		     | (0               << 6)
		     | (0               << 7)
		     | (dma_busy        << 8) // Read/Write/Fmt command in progress
	// WIPL ignores bit 9 after read, Bootstrap requires it to be zero after read
		     | (0               << 9) // either write error, or not an error
		     | (unk_error_bit  << 10)
		     | (unk_error_bit  << 11)
		     | (unk_error_bit  << 12)
		     | (unk_error_bit  << 13)
	// Bootstrap loops forever unless either seek_error or on_track goes high
		     | (U->seek_error  << 14) // Seek error line from drive
		     | (unk_error_bit  << 15);
		}

	void position(void) {
		unsigned sec = secl & 0x0F;
		unsigned head = (secl>>4) & 1;
		unsigned cyl = (unsigned(sech) << 3) | (secl >> 5);
		off_t offset = cyl;
		offset *= 2;  offset += head;
		offset *= 16;  offset += sec;
		offset *= BytesPerSector;

		Unit->on_cyl = 0;
		int fd = Unit->fd;
		if (fd != -1) {
			if (_lseek(fd, offset, SEEK_SET) == -1) {
				fprintf(stderr, "hawk position failed (%d,%d,%d) = %lx.\n",
					cyl, head, sec, (long) offset);
				Unit->seek_error = 1;
			} else {
				// Successful seek
				Unit->on_cyl = 1;
			}
		} else {
			Unit->seek_error = 1;  }
		}

	uint8_t read_next(void) {
		int fd = Unit->fd;
		uint8_t c=0;

		if (fd == -1) {
			data_error = 1;	}
		else if (_read(fd, (void *)&c, 1) != 1) {
			fprintf(stderr, "hawk I/O error\n");
			data_error = 1;
			}
		return c;
		}

	void write_next(uint8_t c) {
		int fd = Unit->fd;

		if (fd == -1) {
			data_error = 1;
		} else if (_write(fd, (void *) &c, 1) != 1) {
			fprintf(stderr, "hawk I/O error\n");
			data_error = 1;
		}
	}

	void dma_done(void) {
		set_dma(0);
		dma_busy = 0;

		// The Hawk disk unit will fault if a read/write is done off cylinder
		Unit->fault |= !Unit->on_cyl;
		}

	void set_dma(int n) { __debugbreak(); } // ??? placeholder

	void cmd(uint8_t cmd, bool trace, uint16_t PC) {
		if (trace)
			fprintf(stderr, "%04X Hawk unit %02X command %02X\n", PC, unit, cmd);

		switch (cmd) {
			case 0: // Multi sector read  - 1 to 16 sectors
				dma_busy = 1;
				set_dma(1);
				break;
			case 1: // Multi sector write - ditto
				dma_busy = 1;
				set_dma(2);
				break;
			case 2: // Seek
				// Guess. Seeks probally don't set busy
				position();
				break;
			case 3:	// Return to Track Zero Sector (Recalibrate)
				// Slams the heads into the rubber stops, and then seeks to the first track

				// According to documentation, The Hawk drive unit will clear any seek
				// errors and faults on RTZS
				Unit->seek_error = 0;
				Unit->fault = 0;

				// Guess, but chances are the controller also clears it's data errors on RTZS
				data_error = 0;

				// Guess. Seeks probably don't set busy

				position();
				break;
			case 4:	 // Format sector - Ken thinks but not sure
			default:
				fprintf(stderr, "%04X: Unknown hawk command %02X\n", PC, cmd);
				dma_busy = 0;
				break;
			}
		}
public:
	unsigned __int16 PC;
	bool trace;

	HAWK(unsigned __int32 AdrBase) {
		Start=IoBase+AdrBase; Len=0x10; Next=0;
		PC=0; trace=0;
		unit=0;  Unit=&Units[unit];
		char name[32];
		for (int i = 0; i < _countof(Units); i++) {
			sprintf_s(name, "hawk%u%u.disk", unsigned(AdrBase>>10)&3, i);
			/* We don't worry here is this works or not */
			Units[i].fd = _open(name, O_RDWR|O_BINARY);
			}
		}

	void Write(unsigned __int32 addr, uint8_t val) {
		switch (addr&0xf) { // 1st controller at f14x
			case 0x0:
				unit = val&(_countof(Units)-1);  Unit=&Units[unit];
				// On a real drive it's more complex. But for us, if
				// we have an image file for the unit, it's ready.
				Unit->ready = Unit->fd != -1;
				if (trace)
					fprintf(stderr, "Selected hawk unit %i\n", val);
				break;
			case 0x1:
				sech = val;  break;
			case 0x2:
				secl = val;  break;
			/* This seems to be a word. The code checks F144 bit 2 for
			   an error situation, and after the read F144 non zero for error */
			case 0x4:
			case 0x5:
				/* Guess.. it's done early in boot */
				data_error = 0;
				break;
			case 0x8:
				cmd(val, trace, PC);
				break;
			default:
				fprintf(stderr, "HAWK::Write: Unknown write %04X with %02X at %X \n", addr, val, PC);
			}
		}

	//	F148	Command register write	00: Read; 01: Write; 02: Seek; 03: RTZ (Return Track Zero)
	//	F144	Hawk status register	Disk format = 16 (400 byte) sectors / track; 2 tracks / cyl.; 405 cyl. (810 tracks / platter = 5MB)
	//	F141 / F142	Sector address register	Cyl#, Head#, Sector#; MSB(CCCCCCCCCCCHSSSS)LSB
	//	F140	Unit select register	00: drive 0, platter 0; 01: drive 0, platter 1; etc.

	uint8_t Read(uint16_t addr) {
		uint8_t status;
		switch(addr&0xf) {
			case 0x4:
				status = get_status() >> 8;
				if (trace)
					fprintf(stderr, "%04X: hawk status read high | %02x__\n", PC, status);
				return status;
			case 0x5:
				status = get_status() & 0xff;
				if (trace)
					fprintf(stderr, "%04X: hawk status read low  | __%02x\n", PC, status);
				return status ;
			case 0x8:	// Bit 0 seems to be set while it is processing
				return dma_busy;
			default:
				fprintf(stderr, "%04X: Unknown hawk I/O read %04X\n", PC, addr);
				return 0xFF;
			}
		}

	} ; // HAWK

struct CENTURIONCMD : public MEMREGION { // CMD disk drive controller
	//	F808 / F809	CMD registers

	CENTURIONCMD(unsigned __int32 AdrBase) { Start=IoBase+AdrBase; Len=2; Next=0; }

	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		switch(Addr&1) {
		//	case 0x0:  CMD registers
		//	case 0x1:	CMD registers
			case 99: break; // dummy so the comp;iler doesn't complain
			}
		fprintf(stderr,"CENTURIONCMD::Write: to undefined addr %x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		switch(Addr&1) {
		//	case 0:  CMD registers
		//	case 1:	CMD registers
			case 99: break; // dummy so the compiler doesn't complain
			}
		fprintf(stderr,"CENTURIONCMD::Read: from undefined addr %x \n",Addr);
		return 0; }

	} ; // CENTURIONCMD

struct CENTURIONFINCHFLOPPY : public MEMREGION {
	//	F800 / F801	Finch / Floppy registers

	CENTURIONFINCHFLOPPY(unsigned __int32 AdrBase) { Start=IoBase+AdrBase; Len=2; Next=0; }

	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		switch(Addr) {
		//	case 0: Finch / floppy registers
		//	case 1: Finch / Floppy registers
			case 99: break; // dummy so the compiler doesn't complain
			}
		fprintf(stderr,"CENTURIONFINCHFLOPPY::Write: to undefined addr %x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		switch(Addr) {
		//	case 0: Finch / floppy registers
		//	case 1: Finch / Floppy registers
			case 99: break; // dummy so the compiler doesn't complain
			}
		fprintf(stderr,"CENTURIONFINCHFLOPPY::Read: from undefined addr %x \n",Addr);
		return 0; }

	} ; // CENTURIONFINCHFLOPPY

struct CENTURIONPRINT : public MEMREGION {
	//	F0E0 - F0EF	Printer related	

	CENTURIONPRINT(unsigned __int32 AdrBase) { Start=IoBase+AdrBase; Len=0x10; Next=0; }

	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		switch(Addr&0xf) {
		//	case 0x00:	4F0E0 - F0EF	Printer related	
			case 99: break; // dummy so the compiler doesn't complain
			}
		printf("CENTIONPRINT::Write: to undefined addr %x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		switch(Addr&0xf) {
		//	case 0x00: ???
			case 99: break; // dummy so the compiler doesn't complain
			}
		printf("CENTURIONPRINT:Read: to undefined addr %x \n",Addr);
		return 0; }
	} ; // CENTURIONPRINT

struct CENTURIONDIAGIO : public MEMREGION {
	unsigned __int8 DipSwitches;
	unsigned __int8 HexDisplayValue; // value on hex displays
	bool HexDisplayOn; // hex display on/off
	bool DP4, DP3, DP2, DP1; // decimal points

	CENTURIONDIAGIO() { Start=0xf100; Len=0x20; Next=0; }

	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		switch(Addr&0x1f) {
			case 0x10: HexDisplayValue=v; return;
			case 0x0E: DP4=1; return; // Decimal point 4 set/clear
			case 0x0F: DP4=0; return;
			case 0x0C: DP3=1; return; // Decimal point 3 set/clear
			case 0x0D: DP3=0; return;
			case 0x0A: DP2=1; return; // Decimal point 2 set/clear
			case 0x0b: DP2=0; return;
			case 0x08: DP1=1; return; // Decimal point 1 set/clear
			case 0x09: DP1=0; return;
			case 0x07: HexDisplayOn=0; return;
			case 0x06: HexDisplayOn=1; return;
			}
		printf("CENTURIONDIAGIO::Write: to undefined addr %x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		switch(Addr&0x1f) {
			case 0x10: return DipSwitches; break;
			}
		printf("CENTURIONDIAGIO::Read: to undefined addr %x \n",Addr);
		return 1; }
	} ; // CENTURIONDIAGIO

struct CENTURIONDIAGROM : public MEMREGION {
	unsigned __int8 SRAM[0x400]; // 1k of SRAM
	unsigned __int8 RomF1[0x800], RomF2[0x800], RomF3[0x800], RomF4[0x800]; // ROM sockets

	CENTURIONDIAGROM() { Start=0x8000; Len=0x5000; Next=0;
		// load the contents of RomF1 RomF2 RomF3 RomF4
		}
	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		switch(Addr&0xf800) {
			case 0xB800: SRAM[Addr&0x7ff]=v; // 1KB of SRAM
			}
		printf("CENTURIONDIAGROM::Write: to undefined addr $%x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		switch(Addr) {
		//	case 0xc800: // unpopulated ROM socket
		//	case 0xC000: // unpopulated ROM socket
			case 0xB800: return SRAM[Addr&0x3ff];
		//	case 0xb000: // unpopulated ROM socket
		//	case 0xa800: // unpopulated ROM socket
		//	case 0xA000: // unpopulated ROM socket
			case 0x9800: return RomF4[Addr&0x7ff];
			case 0x9000: return RomF3[Addr&0x7ff];
			case 0x8800: return RomF2[Addr&0x7ff];
			case 0x8000: return RomF1[Addr&0x7ff];
			}
		printf("CENTURIONDIAGROM::Read: to undefined addr %x \n",Addr);
		return 0; }

	} ; // CENTURIONDIAGROM




struct CENTURIONMUX : public MEMREGION { // 4 port UART

	//	F201	MUX Port 0 send/receive byte
	//	F200	MUX Port 0 status/control	System boots with CRT on port 0 and set to baud:9600, 8-bit, 1 stop/start, no parity, full duplex

	CENTURIONMUX(unsigned AdrBase) { Start=IoBase+AdrBase; Len=0x10; Next=0; }

	void Write(unsigned __int32 Addr, unsigned __int8 v) {
		switch(Addr&0xf) {
			case 0x01: ConsoleIo.OutChr(v&0x7f); return; // MUX Port 0 send/receive byte
			case 0x00: ConsoleIo.Command(v); return; // MUX Port 0 status/control
			}
		fprintf(stderr,"CENTURIONMUX::Write: to undefined addr %x \n",Addr);
		}
	unsigned __int8 Read(unsigned __int32 Addr) {
		switch(Addr&0xf) {
			case 0x01: return ConsoleIo.GetChrNowait(); break; // MUX Port 0 send/receive byte
			case 0x00: return ConsoleIo.Status(); break; // MUX Port 0 status/control
			}
		fprintf(stderr,"CENTURIONMUX::Write: to undefined addr %x \n",Addr);
		return 0; }

	} ; // CENTURIONMUX

struct MEM { // real memory map
	static const unsigned __int32 maxmem=0x3efff;
	unsigned __int8 *M;
	MEMREGION *IoRegionAnchor; // list of IoBase memory space regions
	MEMREGION *MemRegionAnchor; // list of RAM memory space regions

	MEM() { M=0; IoRegionAnchor=0; MemRegionAnchor=0; }
	void IoRegionAppend (MEMREGION *R) { R->Next=IoRegionAnchor ;  IoRegionAnchor =R; }
	void MemRegionAppend(MEMREGION *R) { R->Next=MemRegionAnchor;  MemRegionAnchor=R; }
	void Init(void) {
		M=(unsigned __int8 *)malloc(maxmem+1);  if(!M) { fprintf(stderr,"MEM: malloc failed\7 "); exit(1); }
			memset(M,0x00,maxmem+1);

		IoRegionAppend(new CENTURIONBOOTROM(0xfc00));
		IoRegionAppend(new CENTURIONMUX(0xf200));
		}

	unsigned __int8 __fastcall ReadU1(unsigned __int32 const Addr) {
		for(MEMREGION *R=MemRegionAnchor; R; R=R->Next) if(R->IsIn(Addr)) return R->Read(Addr);
		if(Addr<=maxmem+1) return M[Addr];  // memory
		for(MEMREGION *R=IoRegionAnchor; R; R=R->Next) if(R->IsIn(Addr)) return R->Read(Addr);
		fprintf(stderr,"MEM::ReadU1: read from undefined addr $%x \n",Addr);
		// CPU6 interrupts on this???
		return 0;
		}

	void __fastcall WriteU1(unsigned __int32 const Addr, unsigned __int8 const v) {
		for(MEMREGION *R=MemRegionAnchor; R; R=R->Next) if(R->IsIn(Addr)) { R->Write(Addr,v);  return; }
		if(Addr<maxmem+1) { M[Addr]=v;  return; }  // memory
		for(MEMREGION *R=IoRegionAnchor; R; R=R->Next) if(R->IsIn(Addr)) { R->Write(Addr,v);  return; }
		fprintf(stderr,"MEM::WriteU1: write to undefined addr $%x \n",Addr);
		// CPU6 interrupts on this???
		}

	} Mem;

//**********************************************************
// Execute instructions

struct CPU6 { // Centurion CPU6 (started with ee 200)

/* Contexts
; Each register and the flags appears to exist in 16 contexts and these contexts are mapped between 0x0000 and 0x00FF
; 16 bytes per context starting with context 0 and working upwards.
; The registers are stored in the memory in the order given above. Writing to the memory of another context updates the registers for that context.
; Writing to the memory for your own context appears to change the register value except for PC and the unknown extra register.
; Possibly PC is cached/reloaded on a context switch.

; The processor starts in context 0.
; Context 15 is used by what appears to be a syscall instruction, context 6 is used by the MUX interrupt test, context 1 is used programatically during MMU testing.

; Interrupts (or at least the one sample we have) are processed by a hardware triggered context switch, the execution of code in the new context,
; and then an 0x0A instruction.
*/
		union CONTEXTREG { // Context Register
		uint16_t u;
		struct {
			uint16_t PageTable:4; // Page Table Base for context
			uint16_t Link:1; // (Carry)
			uint16_t FaultL1; // (Overflow)
			uint16_t Minus:1; // (Sign)
			uint16_t Value:1; // (Zero)
			uint16_t Unused1:4; // Unknown, not used?
			uint16_t PrevIpl:4; // Previous IPL
			} ;
		} ;

	union CCR {
		unsigned __int16 u;
		struct { unsigned __int16 PageTableBase:4, Link:1, Fault:1, Minus:1, Value:1, Filler1:4, PrevLevel:4; } ;
		} ; // context register
	CCR CcrStore(void) { // assemble separate variables into CCR
		CCR V; V.PageTableBase=MapBase; V.Link=Link; V.Fault=Fault; V.Minus=Minus; V.Value=Value;
		V.Filler1=0xf;  V.PrevLevel=IPL; return V; } ;
	void CcrLoad(CCR const V) { // load separate variables from CCR
		MapBase=V.PageTableBase; Link=V.Link; Fault=V.Fault; Minus=V.Minus; Value=V.Value;
		IPL=V.PrevLevel; } ;

	bool Fault;  // overflow.
		// Reset by the clear instructions and by the reset fault instruction.
		// The set fault instruction sets the indicator.
		// For increment, decrement, and arithmetic operations, it is set if the sign of the result
		// (destination register) changes.  For left shift and rotate instructions, the setting of
		// fault is the exclusive OR function of the link and minus flags after the shift occurs.
	
	bool Link; // carry, !borrow
		// Reset by the clear instructions and by the reset link instruction.
		// It is set by the set link instruction and complemented by the complement link instr.
		// During shift or rotate instructions, the link indicator is set if a one
		// is shifted into the link, otherwise it is reset.
		// For add operations, the indicator is first reset and then set if the carry
		// out of the most-significant bit is a one.
		// For subtract instructions, it is first reset and then set if there is no carry out.

	bool Minus;  // <zero
	bool Value;  // !zero

	bool InterruptEnabled;

	bool Sense1, Sense2, Sense3, Sense4; // sense switches

	unsigned __int8 op;	// current opcode work area

	unsigned __int16 S; // stack ptr
	void PushW(uint16_t V) { S-=2; Mwu2(S,V); }
	void PushB(uint8_t  V) { S-=1; Mwu1(S,V); }
	uint16_t PopW(void) { uint16_t V=Mru2(S); S+=2; return V; }
	uint8_t  PopB(void) { uint8_t  V=Mru1(S); S+=1; return V; }

	unsigned __int16 PC;

	bool AbortOnOverflow;
	bool ParityChecking;
	bool ParityEven;
	// bool ClockInterruptEnabled; stored in Level 1 AH bit 0

	unsigned __int16 DmaAdr, DmaCount;
	unsigned __int8 DmaMode;
	unsigned __int8 DmaSr; // lo 3 bits are status
	bool DmaEnable;

	static const unsigned __int8 AW=0, AH=0, AL=1; // A	Primary Accumulator	Primary register, commonly used in implicit operations
	static const unsigned __int8 BW=2, BH=2, BL=3; // B	Secondary Accumulator	Primary register, commonly used in implicit operations
	static const unsigned __int8 XW=4;			// X	Primary Index		Can only do word operations (Not true for CPU6?)
	static const unsigned __int8 YW=6, YH=6, YL=7; // Y	Index or Working	Index registers or working storage registers
	static const unsigned __int8 ZW=8, ZH=8, ZL=9; // Z	Index or Working	Index registers or working storage registers
	static const unsigned __int8 SW=10, SH=10, SL=11; // S	Stack pointer		Global among all interrupt levels
	static const unsigned __int8 CW=12;			//  C	Context			Contains the status condition indicators (fault, link, minus, and value) and preceding interrupt level
	static const unsigned __int8 PW=14;			// P	Program Counter Base	Contains initial program counter value to be used when starting up or returning from interrupt
	unsigned __int16 LVx16; // current context level (*16)
	unsigned __int8 Reg[256]; // registers & levels
	void __fastcall RegW(unsigned __int8 const RX, unsigned __int16 const V) {
		if(RX==SW) { S=V; return; }
		Reg[RX+LVx16]=unsigned __int8(V>>8); Reg[RX+LVx16|1]=unsigned __int8(V); }
	unsigned __int16 __fastcall RegW(unsigned __int8 const RX) const {
		if(RX==SW) return S;
		return (unsigned __int16(Reg[RX+LVx16])<<8)+Reg[RX+LVx16|1]; }
	void __fastcall RegB(unsigned __int8 const RX, unsigned __int8 const V) { Reg[RX+LVx16]=V; }
	unsigned __int8 __fastcall RegB(unsigned __int8 const RX) const { return Reg[RX+LVx16]; }

	unsigned __int8 IPL; // interrupt priority

	union {
		unsigned __int8 u;
		struct { unsigned __int8 InvalidInstruction:1, WriteBreak:1, WeirdPc:1, Halt:1, CcdpEnd:1; } ;
		} Stop;
	unsigned __int16 bkpt; // breakpoint location
	unsigned __int16 bkpt1; // "step over" address
	unsigned __int16 BreakWriteAddr;
	unsigned __int32 InstCount; // instruction counter
	unsigned __int32 Cycles; // cycle counter

	PERF1 *Perf; // performance counter array
	unsigned __int32 exhist[64]; // executution history

	FILE *blockf; // block file
	VHD *Files[8];


//CCDP_combuf = $01C0	; points to the command buffer. When a user program is invoked,
//			; the command used to invoke that program will be found in the command buffer.
//			; This will include arguments sent to the program, but they will need to be manually
//			; parsed first.
//	;Do not modify values from 0x100 - 0x1FF, they may be used in future versions oF CCDP by the kernel.

//;For filesystem operations, refer to SerialDir.txt in the SerialDir directory for return code meanings.

	char CCDP_Filename[120];
	void CCDP_GetFilename(uint16_t const Adr) {
		for(uint16_t i=0; ; i++) { uint8_t c=Mru1(Adr+i);
			if(c==0 || i>=_countof(CCDP_Filename)-1) { CCDP_Filename[i]=0; break; }
			CCDP_Filename[i]=c; }
		}
	int CCDP_FileHandle;

	CPU6() { ConsoleIo.Reset(); Perf=0;  memset(exhist,0,sizeof(exhist)); blockf=0; memset(Files,0,sizeof(Files));
	    bkpt=0; bkpt1=0; BreakWriteAddr=0xffff; InstCount=0; Cycles=0;
		Sense1=0; Sense2=0; Sense3=0; Sense4=0;
		Reset();
		CCDP_FileHandle=-1;
		}

	unsigned __int8 Map[32][8]; // mmu memory: 8 pages of 32 entries
		// b7     = I/O A15
		// b6..b0 = Memory A17..A11
/* page zero is for syscalls, the SVC instruction always sets the page table base to zero (but doesn't change interrupt level)
On interrupt level, the current page table is stored to old level's c register, and the page table for the new level's
page table base is pulled from it's c regsiter
And DMA also has a page table that operates on (lower 3 bits of ISR)
Maps 0 to 3 are privileged
*/
	unsigned __int8 MapBase; // current map section in use
	unsigned __int32 __fastcall MapXlate(unsigned __int16 Adr) const {
		return (unsigned __int32(Map[Adr>>11][MapBase])<<11)+(Adr&0x7ff); }

	inline bool UserMode(void) { // https://github.com/sjsoftware/centurion-cpu6/wiki/Privileged-Instructions
		return MapBase>=4; }

	void __fastcall Mwu1(unsigned __int32 adr, unsigned __int8 data) {
		if(adr==BreakWriteAddr) Stop.WriteBreak=1;
		unsigned __int32 GAdr=MapXlate(adr);
		if(GAdr<0x100) Reg[GAdr]=data;
		Mem.WriteU1(GAdr,data); }
	unsigned __int8 __fastcall Mru1(unsigned __int16 const Addr) const {
		unsigned __int32 GAdr=MapXlate(Addr);
		if(GAdr<0x100) return Reg[GAdr];
		return Mem.ReadU1(GAdr); }

	unsigned __int16 Mru2(unsigned __int32 const adr) const {
		return Mem.ReadU1(adr+1) + (unsigned __int16(Mem.ReadU1((adr+0)))<<8); }
	void Mwu2(unsigned __int32 adr, unsigned __int16 data) {
		Mem.WriteU1(adr+1,unsigned __int8(data));  Mem.WriteU1(adr+0,unsigned __int8(data>>8)); }
private:	
	unsigned __int8  Fetch1U() { return Mru1(PC++); }
	signed   __int8  Fetch1S() { return signed __int8(Mru1(PC++)); }
	unsigned __int16 Fetch2U() { unsigned __int16 v=Mru2(PC);  PC+=2;  return v; }

	// addressing modes
	unsigned __int16 ALit(unsigned const Size) { // literal
		unsigned __int16 V=PC; PC+=Size; return V; }
	unsigned __int16 ADir(void) { // direct
		return Fetch2U(); }
	unsigned __int16 AIndir(void) { // indirect
		unsigned __int16 A=Fetch2U();  return Mru2(A); }
	unsigned __int16 ARel(void) { // relative
		signed __int8 Rel=Fetch1S();  return PC+Rel; }
	unsigned __int16 ARelInd(void) { // relative indirect
		unsigned __int16 A=ARel();  return Mru2(A); }
	unsigned __int16 AIndex(unsigned const Size) { // indexed
		unsigned __int8 RM=Fetch1U(); // rrrr mmmm
		unsigned __int8 R=RM>>4;  if(R&1) Stop.InvalidInstruction=1;
		unsigned __int16 A=RegW(R);
		switch(RM&0x3) {
			case 0: break; // (r)	Index
			case 1: RegW(R,A+Size); break; // (r+)
			case 2: A-=Size; RegW(R,A); break; // (-r)
			default: Stop.InvalidInstruction=1;  // undefined
			}
		if(RM&8) A+=Fetch1S(); // add displacement (signed or unsigned???)
		if(RM&4) A=Mru2(A);  // indirect
		return A;
		//  0: // (r)	Index
		//  1: // (r+)	Index; Index returned, incremented by ^
		//  2: // (-r)	Decrement and Index
		//  4: // @(r)	Index indirect
		//  5: // @(r+)	Index indirect; Index returned, incremented by ^
		//  6 ; @(-r)	Decrement and index indirect
		//  8 ; n(r)	Index with displacement
		//  9 ; n(r+)	Index with displacement; Index returned, incremented by ^
		// $A ; n(-r)	Decrement and index with displacement
		// $C ; @n(r)	Index with displacement indirect
		// $D ; @n(r+)	Index with displacement indirect, Index returned, incremented by ^
		// $E ; @n(-r)	Decrement and index with displacement indirect
		}

	/*
; Addressing Modes
; Instructions can be either 1-byte, 2-byte or 3-byte depending on the type of instruction.
; The second or third byte (if present) are related to addressing, or directing the instruction as to which location in memory to act upon.
; Addressing can be either implicit or explicit.
; Implicit means that no addressing is specified, and that specific instruction operates on only one specific location.
; Explicit means the programmer must state which location they will perform the operation on.

; In the chart below, the addressing mode and what is expected at each nibble of each operation is shown.

; HB = High Byte; MB = Mid Byte; LB = Low Byte

; HN = High Nibble; LN = Low Nibble

; HB_HN      	HB_LN      	MB_HN  	MB_LN  	LB_HN  	LB_LN  	Note
; 0	Op (0-F)					Control Operations
; 1	Op (0-F)	Displace	Displace			Branch Operations
; 2	Op (0-7)	Source Reg.				Single Register Explicit Byte Operation
; 2	Op (8-F)					Single Register Implicit Byte Operation
; 3	Op (0-7)	Source Reg.				Single Register Explicit Word Operation
; 3	Op (8-F)					Single Register Implicit Word Operation
; 4	Op (0-7)	Source Reg.	Dest. Reg.			Double Register Explicit Byte Operation
; 4	Op (8-F)					Double Register Implicit Byte Operation
; 5	Op (0-7)	Source Reg.	Dest. Reg.			Double Register Explicit Word Operation
; 5	Op (8-F)					Double Register Implicit Word Operation
; Op (6-F)	0	Literal	Literal			Literal Memory Address Byte Operation
; Op (6-F)	0	Literal	Literal	Literal	Literal	Literal Memory Address Word Operation
; Op (6-F)	1	Direct	Direct	Direct	Direct	Direct Memory Address Operation
; Op (6-F)	2	Indirect	Indirect	Indirect	Indirect	Indirect Memory Address Operation
; Op (6-F)	3	Displace	Displace			Relative to Current Location Memory Address Operation
; Op (6-F)	4	Displace	Displace			Indirect Relative to Current Location Memory Address Operation
; Op (6-F)	5	Register	Modifier	Displace	Displace	Indexed Addressing (Modifier Table Below)
; Op (6-F)	8-F					Implicit Indexing (8 - F => A - P Reg.)

*/

	// operations

	void Abort(uint8_t Code) { // abort an instruction  https://github.com/sjsoftware/centurion-cpu6/wiki/Abort-Trap
		Stop.InvalidInstruction=1; // not implemented yet??
		printf("Instruction aborted at $%x Code=%u \n",PC,Code);
		}

	void FlagWMV(unsigned __int16 const v) { Value=(v==0); Minus=(v>=0x8000); }
	void FlagBMV(unsigned __int8  const v) { Value=(v==0); Minus=(v>=  0x80); }

	unsigned __int16 RVAddr;
	unsigned __int16 RVWR(unsigned __int8 const RV) {
		if(RV&0x10) { RVAddr=Fetch2U();
			if((RV&0xe0)!=0) RVAddr+=RegW((RV>>4)&0xe0); return Mru2(RVAddr); }
		else return RegW(RV>>4); }
	void RVWW(unsigned __int8 const RV, unsigned __int16 const V) {
		if(RV&0x10) Mwu2(RVAddr,V); else RegW(RV>>4,V); }
	unsigned __int8  RVBR(unsigned __int8 const RV) { return RegB(RV>>4); }
	void RVBW(unsigned __int8 const RV, unsigned __int8  const V) { RegB(RV>>4,V); }

	void Inc (unsigned __int8 RV) { unsigned __int16 P=RVWR(RV), V=P+(1+(RV&0xf)); Fault=(P<0x8000) && (V>=0x8000); FlagWMV(V); RVWW(RV,V); }
	void IncB(unsigned __int8 RV) { unsigned __int8  P=RVBR(RV), V=P+(1+(RV&0xf)); Fault=(P<0x80  ) && (V>=0x80  ); FlagBMV(V); RVBW(RV,V); }
	void Dec (unsigned __int8 RV) { unsigned __int16 P=RVWR(RV), V=P-(1+(RV&0xf)); Fault=(P>=0x8000) &&(V<0x8000); FlagWMV(V); RVWW(RV,V); }
	void DecB(unsigned __int8 RV) { unsigned __int8  P=RVBR(RV), V=P-(1+(RV&0xf)); Fault=(P>=0x80  ) &&(V<0x80  ); FlagBMV(V); RVBW(RV,V); }
	void Clr (unsigned __int8 RV) { unsigned __int16 P=RVWR(RV), V=RV&0xf;  Fault=0; Link=0; Minus=0; Value=(V==0); RVWW(RV,V); }
	void ClrB(unsigned __int8 RV) { unsigned __int8  P=RVBR(RV), V=RV&0xf;  Fault=0; Link=0; Minus=0; Value=(V==0); RVBW(RV,V); }
	void Ivr (unsigned __int8 RV) { unsigned __int16 P=RVWR(RV), V=(~P)+(RV&0xf); FlagWMV(V); RVWW(RV,V); }
	void IvrB(unsigned __int8 RV) { unsigned __int8  P=RVBR(RV), V=(~P)+(RV&0xf); FlagBMV(V); RVBW(RV,V); }
	void Srr (unsigned __int8 RV) {   signed __int16 V=RVWR(RV);  // shift register right (sign extend)
		V>>=(RV&0xf); Link=V&1; V>>=1;  FlagWMV(V); RVWW(RV,V); }
	void SrrB(unsigned __int8 RV) {   signed __int8  V=RVBR(RV);  // shift register byte right (sign extend)
		V>>=(RV&0xf); Link=V&1; V>>=1;  FlagBMV(V); RVBW(RV,V); }
	void Slr (unsigned __int8 RV) { unsigned __int16 V=RVWR(RV);  // shift register left (0 shifted in)
		V<<=(RV&0xf); Link=V>=0x8000; Fault=bool(((V>>15)^(V>>14))&1); V<<=1; FlagWMV(V); RVWW(RV,V); }
	void SlrB(unsigned __int8 RV) { unsigned __int8  V=RVBR(RV);  // shift register byte left (0 shifted in)
		V<<=(RV&0xf); Link=V>=  0x80; Fault=bool(((V>> 7)^(V>> 6))&1); V<<=1; FlagBMV(V); RVBW(RV,V); }
	void Rrr (unsigned __int8 RV) { unsigned __int16 V=RVWR(RV);  // rotate register right (thru link flag)
		for(unsigned __int8 i=1+(RV&0xf); i; i--) { bool L2=V&1; V>>=1; if(Link) V|=0x8000; Link=L2; }
		FlagWMV(V); RVWW(RV,V); }
	void RrrB(unsigned __int8 RV) { unsigned __int8  V=RVBR(RV);  // rotate register byte right (thru link flag)
		for(unsigned __int8 i=1+(RV&0xf); i; i--) { bool L2=V&1; V>>=1; if(Link) V|=0x80  ; Link=L2; }
		FlagBMV(V); RVBW(RV,V); }
	void Rlr (unsigned __int8 RV) { unsigned __int16 V=RVWR(RV);  // rotate register left (thru link flag)
		for(unsigned __int8 i=1+(RV&0xf); i; i--) { bool L2=V>=0x8000; V<<=1; if(Link) V|=1; Fault=bool(V>>15)^L2; Link=L2; }
		FlagWMV(V); RVWW(RV,V); }
	void RlrB(unsigned __int8 RV) { unsigned __int8  V=RVBR(RV);
		for(unsigned __int8 i=1+(RV&0xf); i; i--) { bool L2=V>=0x80  ; V<<=1; if(Link) V|=1; Fault=bool(V>> 7)^L2; Link=L2; }
		FlagBMV(V); RVBW(RV,V); }

	unsigned __int8 RRDestReg; // from RRRead
	unsigned __int16 RRSrcValue;  // from RRRead
	unsigned __int16 RRRead(unsigned __int8 const RR) {
		RRDestReg=RR&0xe;  unsigned __int8 SrcR=(RR>>4)&0xe;
		switch(RR&0x11) {
			case 0x10: // dest_reg <- src_reg op immediate
				RRSrcValue=RegW(SrcR); return Fetch2U();
			case 0x01: // dest_reg <- src_reg op (direct)
				RRSrcValue=RegW(SrcR); return Mru2(Fetch2U());
			case 0x11: // dest_reg <- (src_reg + disp16) op dest_reg
				RRSrcValue=Mru2(RegW(SrcR)+Fetch2U()); return RegW(RRDestReg);
			default: // dest_reg <- src_reg op dest_reg
				RRSrcValue=RegW(SrcR); return RegW(RRDestReg);
			}
		}
	void Add(unsigned __int8 const M) { // Add word Src to Dest
		unsigned __int32 D=RRRead(M), R=D+RRSrcValue; RegW(RRDestReg,unsigned __int16(R));
		Link=bool(R&0x10000); Fault=bool((D^RRSrcValue)&0x8000)?0:bool((D^R)&0x8000); FlagWMV(unsigned __int16(R)); }
	void AddB(unsigned __int8 const M) { // Add byte Src to Dest
		unsigned __int8 DR=M&0xf, SR=M>>4;  unsigned __int32 V=RegB(DR), W=RegB(SR), S=V+W; RegB(DR,unsigned __int8(S)); 
		Link=bool(S&  0x100); Fault=bool((V^W)&0x80)?0:bool((V^S)&0x80); FlagBMV(unsigned __int8(S)); }
	void Sub(unsigned __int8 const M) { // Subtract word Src to Dest
		unsigned __int32 D=RRRead(M), R=RRSrcValue-D; RegW(RRDestReg,unsigned __int16(R));
		Link=!bool(R&0x10000); Fault=bool((RRSrcValue^D)&0x8000)?bool((RRSrcValue^R)&0x8000):0; FlagWMV(unsigned __int16(R)); }
	void SubB(unsigned __int8 const M) { // Subtract byte Src to Dest
		unsigned __int8 DR=M&0xf, SR=M>>4;  unsigned __int32 V=RegB(SR), W=RegB(DR), S=V-W; RegB(DR,unsigned __int8(S)); 
		Link=!bool(S&0x100); 
		Fault=bool(((V^W)&(V^S))&0x80);
		FlagBMV(unsigned __int8(S)); }
	void And(unsigned __int8 const M) { // AND word Src to Dest
		unsigned __int16 R=RRRead(M); R&=RRSrcValue; RegW(RRDestReg,R); FlagWMV(R); }
	void AndB(unsigned __int8 const M) { // AND byte Src to Dest
		unsigned __int8 DR=M&0xf, SR=M>>4;  unsigned __int8 V=RegB(DR); V&=RegB(SR); RegB(DR,V); FlagBMV(V); }
	void Ori(unsigned __int8 const M) { // OR word Src to Dest
		unsigned __int16 R=RRRead(M); R|=RRSrcValue; RegW(RRDestReg,R); FlagWMV(R); }
	void OriB(unsigned __int8 const M) { // OR byte Src to Dest
		unsigned __int8 DR=M&0xf, SR=M>>4;  unsigned __int8 V=RegB(DR); V|=RegB(SR); RegB(DR,V); FlagBMV(V); }
	void Ore(unsigned __int8 const M) { // XOR word Src to Dest
		unsigned __int16 R=RRRead(M); R^=RRSrcValue; RegW(RRDestReg,R); FlagWMV(R); }
	void OreB(unsigned __int8 const M) { // XOR byte Src to Dest
		unsigned __int8 DR=M&0xf, SR=M>>4;  unsigned __int8 V=RegB(DR); V^=RegB(SR); RegB(DR,V); FlagBMV(V); }

	void LdB(unsigned __int8 RegX, unsigned __int16 const Adr) { // load byte register
		unsigned __int8 V=Mru1(Adr); RegB(RegX,V); FlagBMV(V); }
	void Ld(unsigned __int8 RegX, unsigned __int16 const Adr) { // Load word register
		unsigned __int16 V=Mru2(Adr); RegW(RegX,V); FlagWMV(V); }
	void StB(unsigned __int8 RegX, unsigned __int16 const Adr) { // Store byte register
		unsigned __int8 V=RegB(RegX); Mwu1(Adr,V); FlagBMV(V); }
	void St(unsigned __int8 RegX, unsigned __int16 const Adr) { // Store word register
		unsigned __int16 V=RegW(RegX); Mwu2(Adr,V); FlagWMV(V); }
	void Jmp(unsigned __int16 const Adr) { PC=Adr; }
	void Jsr(unsigned __int16 const Adr) { PushW(RegW(XW)); RegW(XW,PC); PC=Adr; }
	void Branch(bool Flag) { signed __int8 Rel=Fetch1S();  if(Flag) PC+=Rel;  }

	struct SSMN {
		unsigned __int8 ssss, mm, nn; // ssss=function, mm=1st addr mode, nn=2nd addr mode
		unsigned __int8 RR; // registers (if required)
		unsigned __int16 M, N; // 1st & 2nd operand results
		} ;
	void GetSSMN1(SSMN &C) { // get ssssmmnn
		uint8_t B2=Fetch1U();  C.ssss=B2>>4; C.mm=(B2>>2)&3; C.nn=B2&3;
		C.RR= (C.mm==2 || C.nn==2) ? Fetch1U() : 0;
		C.M=0;  C.N=0;
		}
	void GetSSMN2(SSMN &C, uint8_t const Size1, uint8_t const Size2) { // get operand pointers
		switch(C.mm) {
			case 0: { uint16_t A=Fetch2U(); C.M=(Size1==1)?Mru1(A):Mru2(A); } break;
			case 1: Stop.InvalidInstruction=1; break; //???
			case 2: C.M=RegB(C.RR>>4); break;
			case 3: C.M=Fetch1U(); break;
			}
		switch(C.nn) {
			case 0: C.N=Mru2(Fetch2U()); break;
			case 1: Stop.InvalidInstruction=1; break; //???
			case 2: C.N=RegW(C.RR&0xf); break;
			case 3: C.N=Fetch2U(); break;
			}
		}

	void MemBlock(bool const LengthInA) {
		// eg: 47 40 FF 01 00 02 00
		SSMN C; GetSSMN1(C);
		unsigned __int16 Len=(LengthInA?RegW(AW):Fetch1U())+1;
		GetSSMN2(C,2,2);
		switch(C.ssss) {
			case 0: { uint16_t BaseAddr=C.M, RecordAddr=C.N; // CVX Implements most of the Centurion binary record format in Microcode.
				Stop.InvalidInstruction=1; } break;
			case 1: { uint16_t Src=C.M, Dest=C.N;  // CPV  strcmp
				uint8_t a=0, b=0;  do { a=Mru1(Src++); b=Mru1(Dest++); if(a!=b || a==0) break; } while(--Len);
				Value=(a==b); Minus=(a-b)>>7; Link=(a>b); Fault=0; } break;
			case 2: { // MVV Copies from Source to Dest until matching byte is found
					// (can be used as strcpy). Sets Fault if no match found.
					// Sets Y to match in Src. Sets Z to match in Dest
				uint16_t MaxCount=Len; uint8_t MatchByte=RegB(AL); uint16_t Src=C.M, Dest=C.N; 
				uint8_t a=0;  do { a=Mru1(Src++); Mwu1(Dest++,a); } while(MaxCount-- && a!=MatchByte);
				Value=(a==MatchByte);  RegW(YW,Src-1); RegW(ZW,Dest-1); } break;
			case 3: { // SCN	https://github.com/sjsoftware/centurion-cpu6/wiki/SCN
				// Operand 1 is length byte Operand 2 is memory address (table) Operand 3 is memory address (string)
				uint8_t const MaskL=RegB(BL), MaskH=RegB(BH); // On entry B holds two bytes - low byte is used with string, high byte is used with table.
				Fault=0;
				while(1) {
					uint8_t v=Mru1(C.N)&MaskL;  // BL is ANDed with first byte of string. (e.g., mask out high bit on string)
					uint8_t f=Mru1(C.M+v)&MaskH; // BH is ANDed with the byte at the destination address plus the result.
					if(f) {  // If the AND of BH and destination is non-zero
						RegB(BL,f); // set BL to the result of the destination AND
						RegB(AL,Len); // AL to the remaining length.
						RegW(XW,C.M+v); RegW(YW,C.N); // X and Y are set to the table entry address and address in string
						break; }
					C.N++; if(--Len) {  // If there's no bytes left
						Fault=1; // set fault.
						break; }
					}
				} break;
			case 4: { uint16_t Src = C.M; uint16_t Dest = C.N; // MVF copy block of memory from first argument to second argument
				do { Mwu1(Dest++,Mru1(Src++)); } while(--Len);  }  break;
			case 5: { // ANC  bitwise and.  guessing on flags
				uint16_t Src = C.M, Dest = C.N;
				do { Mwu1(Dest,Mru1(Dest)&Mru1(Src)); Dest++, Src++; } while(--Len); } break;
			case 6: { // ORC  bitwise or.  guessing on flags
				uint16_t Src=C.M, Dest=C.N;
				do { Mwu1(Dest,Mru1(Dest)|Mru1(Src)); Dest++, Src++; } while(--Len); } break;
			case 7: { // XRC  bitwise xor.  guessing on flags
				uint16_t Src=C.M, Dest=C.N;
				do { Mwu1(Dest,Mru1(Dest)^Mru1(Src)); Dest++, Src++; } while(--Len); } break;
			case 8: { // CPF compare two blocks of memory
				uint16_t Src=C.M, Dest=C.N;
				do { Mwu1(Dest,Mru1(Dest)^Mru1(Src)); Dest++, Src++; } while(--Len);
				uint16_t r=0;  do { r=uint16_t(Mru1(Src++))-uint16_t(Mru1(Dest++)); if(r!=0) break; } while(--Len);
				Value=(r==0); Minus=r>>7; Link=r>>8; Fault=0; } break;
			case 9: { // FIL copies first arg repeated to second arg
				uint8_t Pattern=Mru1(C.M); uint16_t Dest=C.N;
				do { Mwu1(Dest++,Pattern); } while(--Len);  } break;
			default: Stop.InvalidInstruction=1;
			}
		}

	enum EXECSPECIAL : uint8_t { NORMAL=0, CCDP_TTY_GETC, CCDP_TTY_GETS } ExecSpecial;
	uint16_t CCDP_Ix;
	uint16_t CCDP_Len;
	uint16_t CCDP_Adr;

	void CCDP_Init1(uint16_t Adr, uint16_t Code) {
		Mwu2(Adr,Code); Mwu1(Adr+2,0x09); }
public:
	void CCDP_Init(void) {
		PC=0x200;
		CCDP_Init1(0x100,0x2f0e); // 0x100: CCDP_SYS_DONE: Returns to the CCDP command prompt
		CCDP_Init1(0x103,0x2f1e); // 0x103: CCDP_TTY_PUTC: Puts a character on the terminal
		CCDP_Init1(0x106,0x2f2e); // 0x106: CCDP_TTY_PUTB: Puts a byte in hex on the terminal
		CCDP_Init1(0x109,0x2f3e); // 0x109: CCDP_TTY_PUTW: Puts a word in hex on the terminal
		CCDP_Init1(0x10c,0x2f4e); // 0x10c: CCDP_TTY_PUTS: Puts a string on the terminal (zero terminated)
		CCDP_Init1(0x10f,0x2f5e); // 0x10f: CCDP_TTY_GETC: Gets a character from the terminal
		CCDP_Init1(0x112,0x2f6e); // 0x112: CCDP_TTY_GETS: Gets a line of characters from the terminal
		CCDP_Init1(0x12d,0x2f7e); // 0x12d: CCDP_TTY_NEXT: Returns if there is a character to read or not
		CCDP_Init1(0x115,0x2f8e); // 0x115: CCDP_FS_OPEN: Opens up a file for use, any currently opened file is closed
		CCDP_Init1(0x118,0x2f9e); // 0x118: CCDP_FS_CLOSE: Closes the currently open file
		CCDP_Init1(0x11b,0x2fae); // 0x11b: CCDP_FS_MAKE: Makes a new file, but does not open it
		CCDP_Init1(0x11e,0x2fbe); // 0x11e: CCDP_FS_DELETE: Deletes an existing file
		CCDP_Init1(0x121,0x2fce); // 0x121: CCDP_FS_LIST: Lists a filename and size from the directory
		CCDP_Init1(0x124,0x2fde); // 0x124: CCDP_FS_READ: Reads a block from a file
		CCDP_Init1(0x127,0x2fee); // 0x127: CCDP_FS_WRITE: Writes a block to a file
		CCDP_Init1(0x12a,0x2ffe); // 0x12a: CCDP_GEN_HTOI: Converts a hex number in ASCII into a value
		}
	void Reset(void) {
		Fault=0; Link=0; Value=0; Minus=0;
		InterruptEnabled=0;  LVx16=0;  RegW(SW,0x180);  PC=0xfc00;
		DmaEnable=0;
		AbortOnOverflow=0;
		ParityChecking=0;  ParityEven=0;
		Reg[0x10]&=~1; // ClockInterruptEnabled=0;
		MapBase=0;
		for(unsigned i=0; i<32; i++) {
			unsigned __int8 V= i<30 ? i:i|0x80;
			Map[i][0]=V; Map[i][1]=V; Map[i][2]=V; Map[i][3]=V;
			Map[i][4]=V; Map[i][5]=V; Map[i][6]=V; Map[i][7]=V;
			}
		}

	void Execute(unsigned int NumInst) { // Execute instructions
		switch(ExecSpecial) {
			case CCDP_TTY_GETC: {
				if((ConsoleIo.Status()&1)==0) return;
				uint8_t c=ConsoleIo.GetChrNowait();  RegB(AL,c);  RegB(BL,0x55);  //ConsoleIo.OutChr(c);
				ExecSpecial=NORMAL;  return;  } break;
			case CCDP_TTY_GETS: {
				if((ConsoleIo.Status()&1)==0) return;
				uint8_t c=ConsoleIo.GetChrNowait();  ConsoleIo.OutChr(c);
				if     (c==0x0d) { Mwu1(CCDP_Adr+CCDP_Ix,0); ExecSpecial=NORMAL; }
				else if(c==0x08) { if(CCDP_Ix>0) CCDP_Ix--; }
				else if(CCDP_Ix<CCDP_Len-1) { Mwu1(CCDP_Adr+(CCDP_Ix++),c); }
				return; } break;
			}
		// https://github.com/sjsoftware/centurion-cpu6/wiki/Centurion-CPU6-Instruction-Reference
		do { // for each instruction
			unsigned __int32 const PC0=PC;  unsigned const Cycles0=Cycles;
			InstCount++;  exhist[InstCount&(_countof(exhist)-1)]=PC;
			if(PC<0x100) {
				Stop.WeirdPc=1;  return; }
			switch(op=Fetch1U()) {
				case 0x00: // HLT  https://github.com/sjsoftware/centurion-cpu6/wiki/HLT
					if(LVx16!=15*16) Abort(1); Stop.Halt=1; break;
				case 0x01: break; // NOP ; No Operatio
				case 0x02: Fault=1;  break; // SF ; Set Fault flag
				case 0x03: Fault=0;  break; // RF ; Reset Fault flag
				case 0x04: if(UserMode()) Abort(0); InterruptEnabled=1;  break; // EI ; Enable the Interrupt System (allow interrupts)
				case 0x05: if(UserMode()) Abort(0); InterruptEnabled=0;  break; // DI ; Disable the Interrupt System (disable interrupts)
				case 0x06: Link=1;  break; // SL ; Set the Link (carry) Flag
				case 0x07: Link=0;  break; // RL ; Reset the Link (carry) Flag
				case 0x08: Link=!Link;  break; // CL ; Complement Link flag
				case 0x09: { PC=RegW(XW); unsigned __int16 S=RegW(SW); RegW(XW,Mru2(S)); S+=2; RegW(SW,S); } break; // RSR ; Return from subroutine
				case 0x0a: { // RI ; Return from interrupt  https://github.com/sjsoftware/centurion-cpu6/wiki/RI
					if(UserMode()) Abort(0);
					Stop.InvalidInstruction=1; printf("RI incomplete\n");
			//		RegW(PW,PC);
			//		LVx16=CC.LV<<4;  CC.u=RegW(CW); PC=RegW(PW);
					} break;
			//	case 0x0b: LVx16=CC.LV<<4;  CC.u=RegW(CW); PC=RegW(PW); // RIM ; Return from Interrupt Modified  not on CPU6
			//	case 0x0c: // SYN 
				case 0x0d: RegW(XW,PC); break; // PCX ; Transfer PC to X - X=address of next instruction
				case 0x0e: if(UserMode()) Abort(0); break; // DLY ; Delay 4.55 ms - for TTY bit timing
				case 0x0f: { // RSV aka RSYS ; Return from SVC using stack.  https://github.com/sjsoftware/centurion-cpu6/wiki/RSV
					if(UserMode()) Abort(0);
					RegW(PW,PC);
					S++;	// Skip arg
					PC = RegW(XW);  RegW(XW,PopW());
					LVx16=0x10* (PopB()&0xf);	// Loads new IL
					uint8_t byte = PopB(); 	// SVC might have saved the flags, but RSV doesn't restore them
					MapBase = byte & 0x07;
					} break;

				case 0x10: Branch( Link           ); break; // BL  rel ; Branch if Link Set
				case 0x11: Branch(!Link           ); break; // BNL rel ; Branch if Link Clear
				case 0x12: Branch( Fault          ); break; // BF  rel ; Branch if Fault Set
				case 0x13: Branch(!Fault          ); break; // BNF rel ; Branch if Fault Clear
				case 0x14: Branch( Value          ); break; // BZ  rel ; Branch if Zero
				case 0x15: Branch(!Value          ); break; // BNZ rel ; Branch if not Zero
				case 0x16: Branch( Minus          ); break; // BM  rel ; Branch if Minus
				case 0x17: Branch(!Minus          ); break; // BP  rel ; Branch on Positive
				case 0x18: Branch(!Value && !Minus); break; // BGZ rel ; Branch if Greater Than 0
				case 0x19: Branch( Value ||  Minus); break; // BLE rel ; Branch if Less Than or Equal to 0
				case 0x1a: Branch(Sense1          ); break; // BS1 rel ; Branch if Sense Switch 1 Set
				case 0x1b: Branch(Sense2          ); break; // BS2 rel ; Branch if Sense Switch 2 Set
				case 0x1c: Branch(Sense3          ); break; // BS3 rel ; Branch if Sense Switch 3 Set
				case 0x1d: Branch(Sense4          ); break; // BS4 rel ; Branch if Sense Switch 4 Set
			//	case 0x1e: Branch(???             ); break; // BI  rel ; Branch on ??
				case 0x1f: Branch(Reg[0x10]&1     ); break; // BCK rel ; branch if clock interrupt enabled (see B6/C6)

				case 0x20: IncB(Fetch1U()); break; // INRB BReg,n	increment register byte
				case 0x21: DecB(Fetch1U()); break; // DCRB BReg,n	decrement register upper byte or lower byte
				case 0x22: ClrB(Fetch1U()); break; // CLRB BReg,n	clear register upper byte or lower byte
				case 0x23: IvrB(Fetch1U()); break; // IVRB BReg,n	invert register byte
				case 0x24: SrrB(Fetch1U()); break; // SRRB BReg,n	shift register byte right (sign extend)
				case 0x25: SlrB(Fetch1U()); break; // SLRB BReg,n	shift register byte left (0 shifted in)
				case 0x26: RrrB(Fetch1U()); break; // RRRB BReg,n	rotate register byte right (thru link flag)
				case 0x27: RlrB(Fetch1U()); break; // RLRB BReg,n
				case 0x28: IncB(AL<<4    ); break; // INAB		Increment AL register
				case 0x29: DecB(AL<<4    ); break; // DCAB		Decrement AL register
				case 0x2a: ClrB(AL<<4    ); break; // CLAB		Clear AL register
				case 0x2b: IvrB(AL<<4    ); break; // IVAB		Invert AL register
				case 0x2c: SrrB(AL<<4    ); break; // SRAB		Shift AL register right (sign extend)
				case 0x2d: SlrB(AL<<4    ); break; // SLAB		Shift AL register left (0 shifted in)

				case 0x30: Inc(Fetch1U()); break; // INR WReg,n	increment register word
				case 0x31: Dec(Fetch1U()); break; // DCR WReg,n	decrement register word
				case 0x32: Clr(Fetch1U()); break; // CLR WReg,n	clear register word
				case 0x33: Ivr(Fetch1U()); break; // IVR WReg,n	invert register word
				case 0x34: Srr(Fetch1U()); break; // SRR WReg,n	shift register right (sign extend)
				case 0x35: Slr(Fetch1U()); break; // SLR WReg,n	shift register left (0 shifted in)
				case 0x36: Rrr(Fetch1U()); break; // RRR WReg,n	rotate register right (thru link flag)
				case 0x37: Rlr(Fetch1U()); break; // RLR WReg,n	rotate register left (thru link flag)
				case 0x38: Inc(AW<<4    ); break; // INA	Increment AW register
				case 0x39: Dec(AW<<4    ); break; // DCA	Decrement AW register
				case 0x3a: Clr(AW<<4    ); break; // CLA	Clear AW register
				case 0x3b: Ivr(AW<<4    ); break; // IVA	Invert AW register
				case 0x3c: Srr(AW<<4    ); break; // SRA	Shift AW register right (sign extend)
				case 0x3d: Slr(AW<<4    ); break; // SLA	Shift AW register left (0 shifted in)
				case 0x3e: Inc(XW<<4    ); break; // INX	Increment XW register
				case 0x3f: Dec(XW<<4    ); break; // DCX	Decrement XW register

				case 0x2e: { // Memory mapping
					if(UserMode()) Abort(0);
					SSMN C; GetSSMN1(C); GetSSMN2(C,1,1);
					unsigned __int8 M=Mru1(C.M), Count=(M>>3), Base=(M&7);
					switch (C.ssss) {
						case 0: { // WPF; write count page table entries with page table base from Operand 2 address
							// Low 3 bits: page table base. High 5 bits: count	Address
							// eg: 2E 0C F9 03 00  write $20 entrys from $300 to base 1
							for (unsigned i = 0; i <= Count; i++) Map[i][Base] = Mru1(C.N++);
							} break;
						case 1: { // RPF; read count page table entries with page table base to Operand 2 address. Set top bit from MSR
							// Low 3 bits: page table base. High 5 bits: count	Address
							// eg: 2E 1C F8 03 00  read $20 entrys from base 0 to $300
							for (unsigned i = 0; i <= Count; i++) Mwu1(C.N++, Map[i][Base]);
							} break;
						case 2: { // WPF1  Write Page File 1 entry from Operand 2 address
							//  Low 3 bits: page table base. High 5 bits: Page table index	Address
							  Map[Count][Base] = Mru1(C.N);
							} break;
						case 3: { // RPF1  Read Page File 1 entry to Operand 2 address. Set top bit from MSR
							//  Low 3 bits: page table base. High 5 bits: Page table index	Address
							Mwu1(C.N, Map[Count][Base]);
							} break;
						case 4: { // WPF32  Write Page File 32 entries from Operand 2 address
							//   Low 3 bits: page table base. High 5 bits: Page table index 	Address
							for (unsigned i = 0; i <= 32; i++) Map[(i + Count) & 0x1f][Base] = Mru1(C.N++);
							} break;
						case 5: { // RPF32  Read Page File 32 entries to Operand 2 address. Set top bit from MSR
							//  Low 3 bits: page table base. High 5 bits: Page table index	Address
							for (unsigned i = 0; i <= 32; i++) Mwu1(C.N++, Map[(i + Count) & 0x1f][Base]);
							} break;
						default: Stop.InvalidInstruction=1;
						}
					} break;
				case 0x2f: { // DMA (& simulator extensions)
					if(UserMode()) Abort(0);
					unsigned __int8 B2=Fetch1U(); switch(B2) {
					case 0x00: case 0x20: case 0x40: case 0x60: case 0x80: case 0xa0: case 0xc0: case 0xe0:
						DmaAdr=RegW(B2>>4); break; // DMA SAD wreg;  LDDMAA WX
					case 0x01: case 0x21: case 0x41: case 0x61: case 0x81: case 0xa1: case 0xc1: case 0xe1:
						RegW(B2>>4,DmaAdr); break; // DMA RAD wreg; STDMAA WX
					case 0x02: case 0x22: case 0x42: case 0x62: case 0x82: case 0xa2: case 0xc2: case 0xe2:
						DmaCount=RegW(B2>>4); break; // DMA SCT wreg; LDDMAC WX
					case 0x03: case 0x23: case 0x43: case 0x63: case 0x83: case 0xa3: case 0xc3: case 0xe3:
						RegW(B2>>4,DmaCount); break; // DMA RCT wreg; STDMAC WX
					case 0x04: case 0x14: case 0x34:
						DmaMode=B2>>4; break; // SETDMAM n
					case 0x05: case 0x15: case 0x25: case 0x35: case 0x45: case 0x55: case 0x65: case 0x75:
					case 0x85: case 0x95: case 0xa5: case 0xb5: case 0xc5: case 0xd5: case 0xe5: case 0xf5:
						DmaMode=RegB((B2>>4)|1); break; // DMA RDV breg; SETDMAMR BX
					case 0x06: DmaEnable=1; break; // DMA EAB; EDMA
					case 0x07: DmaEnable=0; break; // DMA DAB; DDMA
					case 0x08: case 0x18: case 0x28: case 0x38: case 0x48: case 0x58: case 0x68: case 0x78:
					case 0x88: case 0x98: case 0xa8: case 0xb8: case 0xc8: case 0xd8: case 0xe8: case 0xf8:
						DmaSr=7&RegB((B2>>4)|1); break; // DMA SMN breg; LDISR
					case 0x09: case 0x19: case 0x29: case 0x39: case 0x49: case 0x59: case 0x69: case 0x79:
					case 0x89: case 0x99: case 0xa9: case 0xb9: case 0xc9: case 0xd9: case 0xe9: case 0xf9:
						RegB((B2>>4)|1,DmaSr); break; // DMA RMN breg; STISR

					// simulator CCDP extension instructions
					//	These are used for CPU6 code to call simulator CCDP functions.
					case 0x0e: { // 0x100: CCDP_SYS_DONE: Returns to the CCDP command prompt
						Stop.CcdpEnd=1; } break;
					case 0x1e: { // 0x103: CCDP_TTY_PUTC: Puts a character on the terminal
						uint8_t c=RegB(BL); ConsoleIo.OutChr(c);  RegB(AL,0x55); RegB(BL,0x55); } break;
					case 0x2e: { // 0x106: CCDP_TTY_PUTB: Puts a byte in hex on the terminal
						uint8_t c=RegB(BL); ConsoleIo.OutHexByte(c);  RegW(AW,0x5555); RegB(BL,0x55); } break;
					case 0x3e: { // 0x109: CCDP_TTY_PUTW: Puts a word in hex on the terminal
						uint16_t w=RegW(BW); ConsoleIo.OutHexWord(w);  RegW(AW,0x5555); RegW(BW,0x5555); } break;
					case 0x4e: { // 0x10c: CCDP_TTY_PUTS: Puts a string on the terminal (zero terminated)
						uint16_t adr=RegW(BW); while(1) { uint8_t c=Mru1(adr++); if(!c) break; ConsoleIo.OutChr(c); }
						RegB(AL,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0x5e: { // 0x10f: CCDP_TTY_GETC: Gets a character from the terminal
						ExecSpecial=CCDP_TTY_GETC;  } break;
					case 0x6e: { // 0x112: CCDP_TTY_GETS: Gets a line of characters from the terminal
						CCDP_Ix=0;  CCDP_Len=unsigned(RegB(AL))+1;  CCDP_Adr=RegW(BW);
						RegW(AW,0x5555); RegW(BW,0x5555); RegW(YW,0x5555); 
						ExecSpecial=CCDP_TTY_GETS;
						} break;
					case 0x7e: { // 0x12d: CCDP_TTY_NEXT: Returns if there is a character to read or not
						RegB(AL,ConsoleIo.Status()&1); } break;
					case 0x8e: { // 0x115: CCDP_FS_OPEN: Opens up a file for use, any currently opened file is closed
						uint16_t Adr=RegW(BW);  CCDP_GetFilename(Adr);
						if(CCDP_FileHandle!=-1) { _close(CCDP_FileHandle); CCDP_FileHandle=-1; }
						errno_t err = _sopen_s( &CCDP_FileHandle, CCDP_Filename, _O_RDWR|_O_BINARY, _SH_DENYNO, _S_IREAD | _S_IWRITE );
						RegB(AL,err); RegB(AH,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0x9e: { // 0x118: CCDP_FS_CLOSE: Closes the currently open file
						int err=_close(CCDP_FileHandle); CCDP_FileHandle=-1;
						RegB(AL,uint8_t(err)); RegB(AH,0x55); RegW(BW,0x5555); } break;
					case 0xae: { // 0x11b: CCDP_FS_MAKE: Makes a new file, but does not open it
						uint16_t Adr=RegW(BW);  CCDP_GetFilename(Adr);
						int Fh=0;
						errno_t err = _sopen_s( &Fh, CCDP_Filename, _O_CREAT| _O_RDWR|_O_BINARY, _SH_DENYNO, _S_IREAD | _S_IWRITE );
						_close(Fh);
						RegB(AL,err); RegB(AH,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0xbe: { // 0x11e: CCDP_FS_DELETE: Deletes an existing file
						uint16_t Adr=RegW(BW); CCDP_GetFilename(Adr); 
						int err=remove(CCDP_Filename);
						RegB(AL,uint8_t(err)); RegB(AH,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0xce: { // 0x121: CCDP_FS_LIST: Lists a filename and size from the directory
						uint16_t Entry=RegW(AW); uint16_t Adr=RegW(BW);
						Stop.InvalidInstruction=1; // ???;
					//	RegB(AL,????);
						RegB(AH,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0xde: { // 0x124: CCDP_FS_READ: Reads a block from a file
						uint16_t BlockNum=RegW(AW); uint16_t Adr=RegW(BW);
						uint8_t Buf[256];  for(uint16_t i=0; i<256; i++) Buf[i]=Mru1(Adr+i);
						long rc1=_lseek(CCDP_FileHandle,BlockNum*256,SEEK_SET);
						int rc2=_read(CCDP_FileHandle,Buf,256);
						for(unsigned i=0; i<256; i++) Mwu1(Adr+i,Buf[i]);
						RegB(AL,rc2!=256); RegB(AH,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0xee: { // 0x127: CCDP_FS_WRITE: Writes a block to a file
						uint16_t BlockNum=RegW(AW); uint16_t Adr=RegW(BW);
						long rc1=_lseek(CCDP_FileHandle,BlockNum*256,SEEK_SET);
						uint8_t Buf[256];
						int rc2=_write(CCDP_FileHandle,Buf,256);
						for(uint16_t i=0; i<256; i++) Mwu1(Adr+i,Buf[i]);
						RegB(AL,rc2!=256); RegB(AH,0x55); RegW(BW,0x5555); RegW(YW,0x5555); } break;
					case 0xfe: { // 0x12a: CCDP_GEN_HTOI: Converts a hex number in ASCII into a value
						struct {
							static uint8_t Cvt(uint8_t V) {
								if(V>='0' && V<='9') return V-'0';
								V&=0xdf; if(V>='A' && V<='F') return V-'A'+10;
								return 0; } } X;
						uint8_t V1=RegB(BH), V2=RegB(BL);
						RegB(AL,(X.Cvt(V1)<<4)+X.Cvt(V2)); } break;
					case 0xef: // get instruction counter (simulator only)
						RegW(0,unsigned __int16(InstCount>>16)); RegW(2,unsigned __int16(InstCount)); break;
					default: Stop.InvalidInstruction=1;
					} } break;

				case 0x40: AddB(Fetch1U()); break; // ADDB DestReg,SrcReg ; Add byte Src to Dest
				case 0x41: SubB(Fetch1U()); break; // SUBB DestReg,SrcReg ; Subtract byte Src to Dest
				case 0x42: AndB(Fetch1U()); break; // ANDB DestReg,SrcReg ; AND byte Src to Dest
				case 0x43: OriB(Fetch1U()); break; // ORIB DestReg,SrcReg ; OR byte Src to Dest
				case 0x44: OreB(Fetch1U()); break; // OREB DestReg,SrcReg ; XOR byte Src to Dest
				case 0x45: { // XFRB DestReg,SrcReg ; Copy byte of Src register into byte of Dest register
					unsigned __int8 RR=Fetch1U(), V=RegB(RR>>4); RegB(RR&0xf,V); FlagBMV(V); } break;

				case 0x48: AddB(0x13); break; // AABB		; BL+=AL
				case 0x49: SubB(0x13); break; // SABB		; BL=AL-BL
				case 0x4a: AndB(0x13); break; // NABB		; BL&=AL
			//	case 0x4b: { unsigned __int8  V=RegB(AL); RegB(XL,V); FlagBMV(V); } break; // XAXB	; XL=AL
				case 0x4c: { unsigned __int8  V=RegB(AL); RegB(YL,V); FlagBMV(V); } break; // XAYB	; YL=AL
				case 0x4d: { unsigned __int8  V=RegB(AL); RegB(BL,V); FlagBMV(V); } break; // XABB	; BL=AL
				case 0x4e: { unsigned __int8  V=RegB(AL); RegB(ZL,V); FlagBMV(V); } break; // XAZB	; ZL=AL
				case 0x4f: { unsigned __int8  V=RegB(AL); RegB(SL,V); FlagBMV(V); } break; // XASL	; SL=AL

				case 0x50: Add (Fetch1U()); break; // ADD  DestReg,SrcReg ; Add word Src to Dest
				case 0x51: Sub (Fetch1U()); break; // SUB  DestReg,SrcReg ; Subtract word Src to Dest
				case 0x52: And (Fetch1U()); break; // AND  DestReg,SrcReg ; AND word Src to Dest
				case 0x53: Ori (Fetch1U()); break; // ORI  DestReg,SrcReg ; OR word Src to Dest
				case 0x54: Ore (Fetch1U()); break; // ORE  DestReg,SrcReg ; XOR word Src to Dest
				case 0x55: {  // XFR DestReg,SrcReg ; Copy Src register into Dest register
					unsigned __int8 RR=Fetch1U(); unsigned __int16 V=RegW(RR>>4); RegW(RR&0xf,V); FlagWMV(V);
					if(RR&0x11) Stop.InvalidInstruction=1; // is this extended addressing???
					} break;

				case 0x58: Add (0x02); break; // AAB		; BW+=AW
				case 0x59: Sub (0x02); break; // SAB		; BW=AW-BW
				case 0x5a: And (0x02); break; // NAB		; BW&=AW
				case 0x5b: { unsigned __int16 V=RegW(AW); RegW(XW,V); FlagWMV(V); } break; // XAX	; XW=AW
				case 0x5c: { unsigned __int16 V=RegW(AW); RegW(YW,V); FlagWMV(V); } break; // XAY	; YW=AW
				case 0x5d: { unsigned __int16 V=RegW(AW); RegW(BW,V); FlagWMV(V); } break; // XAB	; BW=AW
				case 0x5e: { unsigned __int16 V=RegW(AW); RegW(ZW,V); FlagWMV(V); } break; // XAZ	; ZW=AW
				case 0x5f: { unsigned __int16 V=RegW(AW); RegW(SW,V); FlagWMV(V); } break; // XAS	; SW=AW

				case 0xD6: { // STR : A 16 bit move/store that uses the inverse of 5x Extended Addressing.
					uint8_t RR=Fetch1U(); // Takes a operand byte with register nibbles.
					switch(RR&0x11) { // The lower bit of each register nibble selects an addressing mode
						case 0x00: RegW(RR>>4,RegW(RR&0xe)); break; // General register mode - Left <- Right
						case 0x01: Mwu2(Fetch2U(),RegW(RR&0xe)); break; // store Right to 16bit (direct) address
						case 0x10: Mwu2(PC,RegW(RR&0xe)); PC+=2; break; // store Right to 16bit literal at PC
						case 0x11: Mwu2(Fetch2U()+RegW((RR>>4)&0xe),RegW(RR&0xe)); break; // store Right to (Left + 16bit offset)
						default: Stop.InvalidInstruction=1;
						}
					} break;

				case 0x46: { // big number operations  https://github.com/sjsoftware/centurion-cpu6/wiki/Big-Number
					uint8_t LLKK=Fetch1U(), MSize=(LLKK>>4)+1, NSize=(LLKK&0xf)+1;  // operand sizes (1..16 bytes)
					SSMN C;  GetSSMN1(C);  // we don't know lengths yet...
					switch(C.ssss) {
						case 0: { // A	aka ADDBIG	Adds two big numbers. Dest = Src + Dest
							GetSSMN2(C,MSize,NSize);
							// my guess, not based on the real machine
							uint16_t SA=C.M, DA=C.N;  int Sx=MSize, Dx=NSize;
							uint16_t v=0, vlast=0, Z=0, SExt=(Mru1(SA)&0x80)?0xff:0;
							while(--Dx>=0) {
								v+=(--Sx>=0)?Mru1(SA+Sx):SExt; v+=Mru1(DA+Dx); Z|=uint8_t(v); Mwu1(DA+Dx,uint8_t(v)); vlast=v; v>>=8; }
							Value=Z!=0; Minus=bool(vlast&0x80); Link=bool(v&1);  Fault=bool(((vlast>>8)^(vlast>>7))&1);
							} break;
						case 1: { // S	aka SUBBIG  Dest = Src - Dest
							GetSSMN2(C,MSize,NSize);
							// my guess, not based on the real machine
							uint16_t SA=C.M, DA=C.N;  int Sx=MSize, Dx=NSize;
							uint16_t v=0, vlast=0, Z=0, SExt=(Mru1(SA)&0x80)?0xff:0;
							while(--Dx>=0) {
								v+=(--Sx>=0)?Mru1(SA+Sx):SExt; v-=Mru1(DA+Dx); Z|=uint8_t(v); Mwu1(DA+Dx,uint8_t(v)); vlast=v; v>>=8; }
							Value=Z!=0; Minus=bool(vlast&0x80); Link=bool(v&1);  Fault=bool(((vlast>>8)^(vlast>>7))&1);
							} break;
						case 2: { // C	aka CMPBIG
							GetSSMN2(C,MSize,NSize);
							// my guess, not based on the real machine
							uint16_t SA=C.M, DA=C.N;  int Sx=MSize, Dx=NSize;
							uint16_t v=0, vlast=0, Z=0, SExt=(Mru1(SA)&0x80)?0xff:0;
							while(--Dx>=0) {
								v+=(--Sx>=0)?Mru1(SA+Sx):SExt; v-=Mru1(DA+Dx); Z|=uint8_t(v); vlast=v; v>>=8; }
							Value=Z!=0; Minus=bool(vlast&0x80); Link=bool(v&1);
							Fault=bool(((vlast>>8)^(vlast>>7))&1);
							} break;
						case 3: { //  ZAD	zero & add, aka move
							GetSSMN2(C,MSize,NSize);
							// my guess, not based on the real machine
							uint16_t SA=C.M, DA=C.N;  int Sx=MSize, Dx=NSize;
							uint16_t Z=0, v=0, vlast=0, SExt=(Mru1(SA)&0x80)?0xff:0;
							while(--Dx>=0) {
								v=(--Sx>=0)?Mru1(SA+Sx):SExt; Z|=uint8_t(v); Mwu1(DA+Dx,uint8_t(v)); vlast=v; v>>=8; }
							Value=bool(Z!=0); Minus=bool(vlast&0x80); Link=bool(v&1);  Fault=bool(((vlast>>8)^(vlast>>7))&1);
							} break;
						case 4: { // ZSU	zero & subtract?, aka move negated
							GetSSMN2(C,MSize,NSize);
							// my guess, not based on the real machine
							uint16_t SA=C.M, DA=C.N;  int Sx=MSize, Dx=NSize;
							uint16_t v=0, vlast=0, Z=0, SExt=(Mru1(SA)&0x80)?0xff:0;
							while(--Dx>=0) {
								v-=(--Sx>=0)?Mru1(SA+Sx):SExt; Z|=uint8_t(v); Mwu1(DA+Dx,uint8_t(v)); vlast=v; v>>=8; }
							Value=Z!=0; Minus=bool(vlast&0x80); Link=bool(v&1);  Fault=bool(((vlast>>8)^(vlast>>7))&1);
							} break;
						case 5: { // M	aka MULBIG	Multiplies two big numbers.
							GetSSMN2(C,MSize,NSize);
							Stop.InvalidInstruction=1;
							} break;
						case 6: { //  D		divide
							GetSSMN2(C,MSize,NSize);
							Stop.InvalidInstruction=1;
							} break;
						case 7: { // DRM	divide returning remainder
							GetSSMN2(C,MSize,NSize);
							Stop.InvalidInstruction=1;
							} break;
				/*		case 8: { // CTB	ASCII to bignum
							// eg: 	BigFromAscii 9,1,L_075b,@04d4	;04C4 46 80 80 07 5B 04 D4  ; 075b is 8 bytes, 04d4 is 2 bytes
							unsigned src_width = RegB(AL);
							GetSSMN2(C,src_width,NSize);
					//		uint16_t src_addr = get_twobit(mode, 0, src_width);
					//		uint16_t dst_addr = get_twobit(mode, 1, b_size);

							__int128 V=0;  bool neg=0;
							if(src_width!=0) {  // look for sign char
								uint8_t c=Mru1(src_addr);
								if(c=='-') { neg=1; src_addr++; src_width--; }
								else if(c=='+') src_addr++; src_width--; }

								while(src_width!=0) {  // do digits
									c=Mru1(src_addr++)-'0'; src_width--;
									if(c>=10) { Fault=1;  break; }
									V*=10;  V+=(c-'0');
									}
								if(neg) V=-V;
								}
							Value=(V==0);  Minus=neg;  Fault=0;  Link=0;
							for (int i=b_size-1; i>=0; i--) { Mwu1(dst_addr + i, uint8_t(V)));  V>>=8;  }
							} break;
						case 9: { // CFB	bignum to Ascii  
							unsigned __int8 dest_width=RegB(AL);
							GetSSMN2(C,dest_width,NSize);
						//	uint16_t dst_addr = get_twobit(mode, 0, dest_width);
						//	uint16_t src_addr = get_twobit(mode, 1, b_size);

							// Doesn't handle cases where buffer hasn't been memset to 0xc0
							unsigned dest_width = RegB(AL);
							unsigned base = a_size + 1;



							// Convert to little endian
							unsigned long long num = 0;
							for (int i=0; i < b_size; i++) {
								num = num << 8 | mmu_mem_read8(src_addr+i); }

							char buffer[32];

							if (base == 10) {
								snprintf(buffer, sizeof(buffer), "%llu", num);
							} else if (base == 16) {
								snprintf(buffer, sizeof(buffer), "%llX", num);
							} else {
								fprintf(stderr, "baseconv, unsupported base %i\n", base);  exit(1);  }

							// I'm kind of guessing here, but it seems to do this?
							unsigned actual_width = strlen(buffer);
							if (actual_width > dest_width) {
								alu_out = ALU_F;  return 0;  }
							alu_out = 0;

							for (int i=0; i<actual_width; i++) {
								mmu_mem_write8(dst_addr+i, buffer[i] | 0x80); }

							RegW(A, dst_addr + actual_width); 	// apparently A needs to be updated to point after string

							} break; // 9
						*/
						default: Abort(0); Stop.InvalidInstruction=1;
						}
					} break; // 0x46:

				case 0x47: MemBlock(0); break; // string ops with immediate length
				case 0x67: MemBlock(1); break; // string ops with AL (maybe AW) length

				case 0x56: AbortOnOverflow=true; break; // EAO
				case 0x57: AbortOnOverflow=false; break; // DAO
				case 0x76: if(UserMode()) Abort(0);  ParityChecking=true;  break; // EPE
				case 0x86: if(UserMode()) Abort(0);  ParityChecking=false;  break; // DPE
				case 0x96: if(UserMode()) Abort(0);  ParityEven=false;  break; // SOP
				case 0xa6: if(UserMode()) Abort(0);  ParityEven=true;   break; // SEP
				case 0xB6: if(UserMode()) Abort(0);  Reg[0x10]|= 1;  break; // ECK enable clock interrupt?
				case 0xC6: if(UserMode()) Abort(0);  Reg[0x10]&=~1;  break; // DCK disable clock interrupt?

				case 0x80: LdB(AL,ALit  (1)); break; // LDABL Lit ; Load literal address into AL register
				case 0x90: Ld (AW,ALit  (2)); break; // LDAL  Lit ; Load literal address into full word of AW register
				case 0x81: LdB(AL,ADir   ()); break; // LDABD Direct ; Load direct address into AL register
				case 0x91: Ld (AW,ADir   ()); break; // LDAD  Direct ; Load direct address into full word of AW register
				case 0x82: LdB(AL,AIndir ()); break; // LDABI Indirect ; Load indirect address into AL register
				case 0x92: Ld (AW,AIndir ()); break; // LDAI  Indirect ; Load indirect address into full word of AW register
				case 0x83: LdB(AL,ARel   ()); break; // LDABR Rel ; Load direct Program Counter offset by N address into AL register
				case 0x93: Ld (AW,ARel   ()); break; // LDAR  Rel ; Load direct Program Counter offset by N address into full word of AW register
				case 0x84: LdB(AL,ARelInd()); break; // LDABRI Rel ; Load indirect Program Counter offset by N address into byte of AL register
				case 0x94: Ld (AW,ARelInd()); break; // LDARI  Rel ; Load indirect Program Counter offset by N address into full word of AW register
				case 0x85: LdB(AL,AIndex(1)); break; // LDABX WReg,Mod,Offset ; Load indexed register into byte of AL register
				case 0x95: Ld (AW,AIndex(2)); break; // LDAX  WReg,Mod,Offset ; Load indexed register into full word of AW register
			//	case ox86: ??
			//	case 0x87: ??
			//	case 0x97: ??
				case 0x88: case 0x89: case 0x8a: case 0x8b: case 0x8c: case 0x8d: case 0x8e: case 0x8f:
					LdB(AL,RegW((op&7)<<1)); break; // LDABA WReg ; Load byte from memory address stored in WReg into AL register
				case 0x98: case 0x99: case 0x9a: case 0x9b: case 0x9c: case 0x9d: case 0x9e: case 0x9f:
					Ld (AW,RegW((op&7)<<1)); break; // LDAA WReg ; Load byte from memory address stored in WReg into AL register

				case 0xa0: StB(AL,ALit  (1)); break; // STABL Lit ; Store byte of AL register into literal address (Not possible?)
				case 0xb0: St (AW,ALit  (2)); break; // STAL  Lit ; Store word of AW register into literal address (Not possible?)
				case 0xa1: StB(AL,ADir   ()); break; // STABD Direct ; Store byte of AL register into direct address
				case 0xb1: St (AW,ADir   ()); break; // STAD  Direct ; Store word of AW register into direct address
				case 0xa2: StB(AL,AIndir ()); break; // STABI Indirect ; Store byte of AL register into indirect address
				case 0xb2: St (AW,AIndir ()); break; // STAI  Indirect ; Store word of AW register into indirect address
				case 0xa3: StB(AL,ARel   ()); break; // STABR Rel ; Store byte of AL register into direct Program Counter offset by N address
				case 0xb3: St (AW,ARel   ()); break; // STAR  Rel ; Store word of AW register into direct Program Counter offset by N address
				case 0xa4: StB(AL,ARelInd()); break; // STABRI Rel ; Store byte of AL register into indirect Program Counter offset by N address
				case 0xb4: St (AW,ARelInd()); break; // STARI  Rel ; Store word of AW register into indirect Program Counter offset by N address
				case 0xa5: StB(AL,AIndex(1)); break; // STABX WReg,Mod,Offset ; Store byte of AL register into indexed register
				case 0xb5: St (AW,AIndex(2)); break; // STAX  WReg,Mod,Offset ; Store word of AW register into indexed register
			//	case 0xa7: ??
			//	case 0xb7: ??
				case 0xa8: case 0xa9: case 0xaa: case 0xab: case 0xac: case 0xad: case 0xae: case 0xaf:
					StB(AL,RegW((op&7)<<1)); break; // STABA WReg ; Store AL register to memory address stored in WReg
				case 0xb8: case 0xb9: case 0xba: case 0xbb: case 0xbc: case 0xbd: case 0xbe: case 0xbf:
					St (AW,RegW((op&7)<<1)); break; // STAA WReg ; Store AW register to memory address stored in WReg

				case 0xc0: LdB(BL,ALit  (1)); break; // LDBBL Lit ; Load literal address into BL register
				case 0xd0: Ld (BW,ALit  (2)); break; // LDBL  Lit ; Load literal address into BW register
				case 0xc1: LdB(BL,ADir   ()); break; // LDBBD Direct ; Load direct address into BL register
				case 0xd1: Ld (BW,ADir   ()); break; // LDBD  Direct ; Load direct address into BW register
				case 0xc2: LdB(BL,AIndir ()); break; // LDBBI Indirect ; Load indirect address into BL register
				case 0xd2: Ld (BW,AIndir ()); break; // LDBI  Indirect ; Load indirect address into BW register
				case 0xc3: LdB(BL,ARel   ()); break; // LDBBR Rel ; Load direct Program Counter offset by N address into BL register
				case 0xd3: Ld (BW,ARel   ()); break; // LDBR  Rel ; Load direct Program Counter offset by N address into BW register
				case 0xc4: LdB(BL,ARelInd()); break; // LDBBRI Rel ; Load indirect Program Counter offset by N address into BL register
				case 0xd4: Ld (BW,ARelInd()); break; // LDBRI  Rel ; Load indirect Program Counter offset by N address into BW register
				case 0xc5: LdB(BL,AIndex(1)); break; // LDBBX WReg,Mod,Offset ; Load indexed register into BL register
				case 0xd5: Ld (BW,AIndex(2)); break; // LDBX  WReg,Mod,Offset ; Load indexed register into BW register
			//	case 0xC7: ??

				case 0xD7: if(UserMode()) Abort(0);   Stop.InvalidInstruction=1; break; // SAR - not implemented yet??
				case 0xE6: if(UserMode()) Abort(0);  Stop.InvalidInstruction=1; break; // LAR - not implemented yet??

				case 0xc8: case 0xc9: case 0xca: case 0xcb: case 0xcc: case 0xcd: case 0xce: case 0xcf:
					LdB(BL,RegW((op&7)<<1)); break; // LDBBA WReg ; Load byte from memory address stored in WReg into BL register
				case 0xd8: case 0xd9: case 0xda: case 0xdb: case 0xdc: case 0xdd: case 0xde: case 0xdf:
					Ld (BW,RegW((op&7)<<1)); break; // LDBA WReg ; Load word from memory address stored in WReg into BW register

				case 0xe0: StB(BL,ALit  (1)); break; // STBBL Lit ; Store byte of BL register into literal address (Not possible?)
				case 0xf0: St (BW,ALit  (2)); break; // STBL  Lit ; Store BW into literal address (Not possible?)
				case 0xe1: StB(BL,ADir   ()); break; // STBBD Direct ; Store BL into direct address
				case 0xf1: St (BW,ADir   ()); break; // STBD  Direct ; Store BW into direct address
				case 0xe2: StB(BL,AIndir ()); break; // STBBI Indirect ; Store BL into indirect address
				case 0xf2: St (BW,AIndir ()); break; // STBI  Indirect ; Store BW into indirect address
				case 0xe3: StB(BL,ARel   ()); break; // STBBR Rel ; Store BL into direct Program Counter offset by N address
				case 0xf3: St (BW,ARel   ()); break; // STBR  Rel ; Store BW into direct Program Counter offset by N address
				case 0xe4: StB(BL,ARelInd()); break; // STBBRI Rel ; Store BL into indirect Program Counter offset by N address
				case 0xf4: St (BW,ARelInd()); break; // STBRI  Rel ; Store BW into indirect Program Counter offset by N address
				case 0xe5: StB(BL,AIndex(1)); break; // STBBX WReg,Mod,Offset ; Store BL into indexed register
				case 0xf5: St (BW,AIndex(2)); break; // STBX  WReg,Mod,Offset ; Store BW into indexed register

				case 0xe8: case 0xe9: case 0xea: case 0xeb: case 0xec: case 0xed: case 0xee: case 0xef:
					StB(BL,RegW((op&7)<<1)); break; // STBBA WReg ; Store byte from BL register to memory address stored in WReg
				case 0xf8: case 0xf9: case 0xfa: case 0xfb: case 0xfc: case 0xfd: case 0xfe: case 0xff:
					St (BW,RegW((op&7)<<1)); break; // STBA WReg ; Store BW to memory address stored in WReg

				case 0x60: Ld(XW,ALit  (2)); break; // LDXL Lit ; Load immediate into XW
				case 0x61: Ld(XW,ADir   ()); break; // LDXD Direct ;	Load direct address into XW
				case 0x62: Ld(XW,AIndir ()); break; // LDXI Indirect ; Load indirect address into XW
				case 0x63: Ld(XW,ARel   ()); break; // LDXR Rel ; Load direct Program Counter offset by N address into XW
				case 0x64: Ld(XW,ARelInd()); break; // LDXRI Rel ; Load indirect Program Counter offset by N address into XW
				case 0x65: Ld(XW,AIndex(2)); break; // LDXX WReg,Mod,Offset ; Load indexed mode register into XW

				case 0x68: St(XW,ALit  (2)); break; // STXL Lit ; Store XW into literal address
				case 0x69: St(XW,ADir   ()); break; // STXD Direct ; Store XW into direct address
				case 0x6a: St(XW,AIndir ()); break; // STXI Indirect ; Store XW into indirect address
				case 0x6b: St(XW,ARel   ()); break; // STXR Rel ; Store XW into direct Program Counter offset by N address
				case 0x6c: St(XW,ARelInd()); break; // STXRI Rel ; Store XW into indirect Program Counter offset by N address
				case 0x6d: St(XW,AIndex(2)); break; // STXX WReg,Mod,Offset ; Store XW into indexed register
			//	case 0x6E: AInh("LST??"); break;
			//	case 0x6F: AInh("SST??"); break;

			//	case 0x70: ??
				case 0x71: Jmp(ADir   ()); break; // JMPD Direct ; Jump to direct address
				case 0x72: Jmp(AIndir ()); break; // JMPI Indirect ; Jump to indirect address
				case 0x73: Jmp(ARel   ()); break; // JMPR Rel ; Jump to direct Program Counter offset by N address
				case 0x74: Jmp(ARelInd()); break; // JMPRI Rel ; Jump to indirect Program Counter offset by N address
				case 0x75: Jmp(AIndex(2)); break; // JMPX WReg,Mod,Offset ;Jump to indexed mode register

				case 0x79: Jsr(ADir()   ); break; // JSRD Direct ; Jump to subroutine at direct address
				case 0x7a: Jsr(AIndir() ); break; // JSRI Indirect ; Jump to subroutine at indirect address
				case 0x7b: Jsr(ARel()   ); break; // JSRR Rel ; Jump to subroutine at Program Counter offset by N address
				case 0x7c: Jsr(ARelInd()); break; // JSRRI Rel ; Jump to subroutine at indirect Program Counter offset by N address
				case 0x7d: Jsr(AIndex(2)); break; // JSRX WReg,Mod,Offset ; Jump to subroutine at indexed mode register

				case 0x66: { // SVC aka JSYS - System call
					uint8_t arg = Fetch1U();
					PushW(CcrStore().u);   PushW(RegW(XW));
					RegW(XW,PC);
					PushB(arg);
					MapBase = 0;                  // Switch to mmu bank 0
					PC = 0x100;                   // jump to 0x100
					} break;


				case 0x77: { // MUL 16x16=32 unsigned multiply
					unsigned __int32 D=RRRead(Fetch1U());
					uint32_t R = D * uint32_t(RRSrcValue);
					RegW(RRDestReg,unsigned __int16(R>>16));  RegW(RRDestReg+2,unsigned __int16(R));
					Fault=0; Value=R!=0;  Minus=0; Link=0;
					} break;

				case 0x78: { // DIV 32/16=16,16 unsigned divide
					unsigned __int32 D=RRRead(Fetch1U());
					uint32_t R = D / uint32_t(RRSrcValue);
					unsigned expected_sign = (D ^ RRSrcValue) & 0x8000;
					unsigned sign = R & 0x8000;
					RegW(RRDestReg,unsigned __int16(R));
					Fault= (sign != expected_sign || R > 0xffff);
					Link=0; FlagWMV(unsigned __int16(R));
					} break;

				case 0x7e: { unsigned __int8 B=Fetch1U(), Count=(B&0xf)+1, R=(B>>4)+Count; // push byte registers
					do { Mwu1(--S,RegB((--R)&0xf)); } while(--Count); } break;
				case 0x7f: { unsigned __int8 B=Fetch1U(), Count=(B&0xf)+1, R=B>>4; // pop byte registers
					do { RegB((R++)&0xf,Mru1(S++)); } while(--Count); } break;

			//	case 0xE7: ??
				case 0xF6: if(UserMode()) Abort(0); Stop.InvalidInstruction=1; break; // LIO or SIO - not implemented yet??
				case 0xF7: { // MVL 16bit memcpy
					uint16_t len=RegW(AW), sa=RegW(BW), da=RegW(YW);
					do { Mwu1(da++,Mru1(sa++)); } while(len--);
					} break;

				default: Abort(0); Stop.InvalidInstruction=1; // unknown opcode
				}
			if(Perf) Perf->Cnt(PC0,Cycles-Cycles0);
			} while(ExecSpecial==0 && --NumInst && !Stop.u && PC!=bkpt && (PC<=bkpt1 || PC>bkpt1+12 ));
		}





	void DisplayState(void) { // trace???????????????????????????????????????????????????????
		//	union CCR {
		printf("Fault=%u Link=%u Minus=%u Value=%u \n",Fault,Link,Minus,Value);
		printf("InterruptEnabled=%u  Sense1=%u Sense2=%u Sense3=%u Sense4=%u \n",InterruptEnabled,Sense1,Sense2,Sense3,Sense4);
		printf("AbortOnOverflow=%u ParityChecking=%u ParityEven=%u ClockInterruptEnabled=%u \n",AbortOnOverflow,ParityChecking,ParityEven,Reg[0x10]&1);
		printf("Op=$%02x  PC=$%04x S=$%04x \n",op,PC,S);
		printf("DMA: Adr=$%04x Count=$%04x Mode=$%02x Sr=$%02x Enable=%u \n",DmaAdr,DmaCount,DmaMode,DmaSr,DmaEnable);
		printf("LVx16=%u \n",LVx16);
		for(unsigned y=0; y<256; y+=16) {
			printf("Level %2u:");
			for(unsigned x=0; x<16; x+=2) {
				printf(" $%02x%02x",Reg[y+x+0],Reg[y+x+1]); }
			printf("\n"); }
		printf("IPL=%u \n",IPL);
		printf("Stop: $%x InvalidInstruction=%u WriteBreak=%u WeirdPc=%u Halt=%u CcdpEnd=%u \n",
			Stop.u,Stop.InvalidInstruction,Stop.WriteBreak,Stop.WeirdPc,Stop.Halt,Stop.CcdpEnd);
		printf(" bkpt=$%x bkpt1=$%x BreakWriteAddr=$%x \n",bkpt,bkpt1,BreakWriteAddr);
		printf("InstCount=%u Cycles=%u \n",InstCount,Cycles);
		// *Perf;
		// printf("ExHist: unsigned __int32 exhist[64]; // executution history
		//FILE *blockf; // block file
		//VHD *Files[8];

		for(unsigned y=0; y<8; y++) {
			printf("Map %02u:",y);
			for(unsigned x=0; x<32; x+=4)
				printf(" %02x%02x%02x%02x",Map[y*32+x+0],Map[y*32+x+0],Map[y*32+x+0],Map[y*32+x+0]);
			printf("\n");  }
		printf("MapBase=$%x \n",MapBase);
		printf("RRDestReg=$%x RRSrcValue=$%x \n",RRDestReg,RRSrcValue);

		printf("ExecSpecial=%u \n",ExecSpecial);
		printf("CCDP_Ix=$%x CCDP_Len=$%x CCDP_Adr=$%x \n",CCDP_Ix,CCDP_Len,CCDP_Adr);
		printf("CCDP: FileHandle=%u Filename=\"%s\" \n",CCDP_FileHandle,CCDP_Filename[120]);
		}

	} ; // CPU


/*********************************************************/
struct CPU6DISASSEMBLER { // instruction disassembler
	unsigned __int32 PC, PC0, Next1, Next2, Ref;
	unsigned __int8 opcode;
	struct PARMS { uint8_t Width;  // instruction inline data (0=none, 1=byte, 2=word
		char const *Comment; } Inline[16];
	char const *Comment;
	char String[64];
	static const unsigned MaxMem=0xffff;

	struct MEMINFO { // info about each byte of memory
		unsigned __int8 IsUsed:1, IsOpcode:1, IsFlowbreak:1, IsLabel:1, IsEntrypoint:1,
		IsFixupWord:1, IsLoaded:1;
		} *MemInfo;
	void MemInfoInit(void) {
		MemInfo=new MEMINFO[MaxMem+1];  memset(MemInfo,0,sizeof(*MemInfo)*(MaxMem+1));  }

	uint8_t  Fetch1() { return Mem.ReadU1(PC++); }
	uint16_t Fetch2() { unsigned __int16 v=Fetch1(); v<<=8; v|=Fetch1(); return v; }
	uint8_t  MRead1(uint16_t Offset) { return Mem.ReadU1(PC+Offset); }
	uint16_t MRead2(uint16_t Offset) { return (uint16_t(Mem.ReadU1(PC+Offset))<<8)+Mem.ReadU1(PC+Offset+1); }

	CPU6DISASSEMBLER() { MemInfo=NULL; }
	~CPU6DISASSEMBLER() {
		if(MemInfo) { delete[] MemInfo;  MemInfo=0; }
		}
private:

/*	void ADB(void) {
		sprintf_s(String,sizeof(String),"DB $%02X",Fetch1()); }
	void ADW(void) {
		sprintf_s(String,sizeof(String),"DW $%04X",Fetch2()); }
*/
	static char const * RegNameW(unsigned __int8 RX) {
		switch(RX) {
			case 0: return "AW";  case 2: return "BW";  case 4: return "XW";  case 6: return "YW";
			case 8: return "ZW";  case 0xa: return "SW";  case 0xc: return "CW";  case 0xe: return "PW";  }
		return "?"; }
	static char const * RegNameB(unsigned __int8 RX) {
		switch(RX) {
			case 0x0: return "AH";  case 0x1: return "AL";  case 0x2: return "BH";  case 0x3: return "BL";
			case 0x4: return "XH";  case 0x5: return "XL";  case 0x6: return "YH";  case 0x7: return "YL";
			case 0x8: return "ZH";  case 0x9: return "ZL";  case 0xa: return "SH";  case 0xb: return "SL";
			case 0xc: return "CH";  case 0xd: return "CL";  case 0xe: return "PH";  case 0xf: return "PL"; }
		return "?"; }
	void AInh(char const *lbl) { sprintf_s(String,sizeof(String),"%s",lbl); }
	void ARegA(char const *lbl) { sprintf_s(String,sizeof(String),"%s (%s)",lbl,RegNameW((opcode&7)<<1)); }
	void AMRegW(char const *lbl1, char const *lbl2, int KOffset) { unsigned __int8 RV=Fetch1();
	char const *lbl=(RV&0x10)?lbl2:lbl1;
		sprintf_s(String,sizeof(String),"%s %s,%u",lbl,RegNameW(RV>>4),(RV&0xf)+KOffset);  }
	void AMRegB(char const *lbl, int KOffset) { unsigned __int8 RV=Fetch1();
		sprintf_s(String,sizeof(String),"%s %s,%u",lbl,RegNameB(RV>>4),(RV&0xf)+KOffset); }
	void AMReg2W(char const *Op) { unsigned __int8 M=Fetch1(), DR=M&0xe, SR=(M>>4)&0xe;
		switch(M&0x11) {
			case 0x01: // dest <- src op literal
				sprintf_s(String,sizeof(String),"%s %s,%s,$%x",Op,RegNameW(DR),RegNameW(SR),Fetch2()); break;
			case 0x10: // dest <- src op (direct)
				sprintf_s(String,sizeof(String),"%s %s,%s,#$%x",Op,RegNameW(DR),RegNameW(SR),Fetch2()); break;
			case 0x11: // dest <- src(index) op dest
				sprintf_s(String,sizeof(String),"%s %s,%s??index",Op,RegNameW(DR),RegNameW(SR)); break;
			default: // register to register
				sprintf_s(String,sizeof(String),"%s %s,%s",Op,RegNameW(DR),RegNameW(SR));
			} }
	void AMReg2B(char *lbl) { unsigned __int8 RR=Fetch1();
		sprintf_s(String,sizeof(String),"%s %s,%s",lbl,RegNameB(RR&0xf),RegNameB(RR>>4)); }

	void ALitB(char *lbl) { sprintf_s(String,sizeof(String),"%s #$%02x",lbl,Fetch1()); }
	void ALitW(char *lbl) {
		MEMINFO F; memset(&F,0,sizeof(F));  if(MemInfo) F=MemInfo[PC];
		char const *Fmt=(F.IsFixupWord)?("%s,#L_%04X"):"%s #$%x";
		sprintf_s(String,Fmt,lbl,Fetch2());
		}
	void ADir(char *lbl) { Ref=Fetch2();
		char const *Fmt=(MemInfo && MemInfo[Ref].IsEntrypoint) ? "%s E_%04X" : "%s L_%04X";
		sprintf_s(String,sizeof(String),Fmt,lbl,Ref); }
	void AIndir(char *lbl) { Ref=Fetch2();
		char const *Fmt=(MemInfo && MemInfo[Ref].IsEntrypoint) ? "%s (E_%04X)" : "%s (L_%04X)";
		sprintf_s(String,sizeof(String),Fmt,lbl,Ref); }
	void ARel(char *lbl) { signed __int8 R=signed __int8(Fetch1());  Ref=PC+R;
		char const *Fmt=(MemInfo && MemInfo[Ref].IsEntrypoint) ? "%s E_%04X" : "%s L_%04X";
		sprintf_s(String,sizeof(String),Fmt,lbl,Ref); }
	void ARelInd(char *lbl) { signed __int8 R=signed __int8(Fetch1());  Ref=PC+R;
		sprintf_s(String,sizeof(String),"%s (L_%04x)",lbl,Ref); }
	void AIndex(char *lbl,unsigned __int8 Size) {
		unsigned __int8 M=Fetch1();
		char *S1=(M&4)?"@":"";
		char S2[10]; S2[0]=0; if(M&8) sprintf_s(S2,sizeof(S2),"$%02x",Fetch1());
		char S3[10]; switch(M&3) {
			case 0: sprintf_s(S3,"(%s)",RegNameW(M>>4)); break;	// (r)	Index
			case 1: sprintf_s(S3,"(%s+)",RegNameW(M>>4)); break; // (r+)	Index; Index returned, incremented by ^
			case 2: sprintf_s(S3,"(-%s)",RegNameW(M>>4)); break; // (-r)	Decrement and Index
			default: sprintf_s(S3,"(%s??)",RegNameW(M>>4)); break; // undefined
			}
		sprintf_s(String,sizeof(String),"%s %s%s%s",lbl,S1,S2,S3);  }

	struct EXT { // take apart CPU6 extended addressing bits
		uint8_t Mode;
		uint8_t Regs;  uint8_t RegsSet;
		uint8_t RegsGet(CPU6DISASSEMBLER &D) {
			if(!RegsSet) { Regs=D.Fetch1(); RegsSet=2; }
			RegsSet-=1;  uint8_t r=Regs>>4; Regs<<=4; return r; }
		struct OP {
			uint16_t Adr;
			char Str[32];
			void Eval(CPU6DISASSEMBLER &D, EXT &E, uint8_t Mode, unsigned __int8 Size) {
				switch(Mode&3) {
					case 0: Adr=D.Fetch2(); // EA <- (PC)	Direct
						sprintf_s(Str,",L_%04X",Adr);
						break;
					case 1: {  // EA <- P + imm8 + r1 + r2 (if r2 is not AW) r1/r2 are
						// 16 bit registers indicated in byte following instruction high and low nibble respectively. imm8 follows r1/r2
						uint8_t R=E.RegsGet(D);  uint8_t Off=D.Fetch1();
						sprintf_s(Str,",$%02x(%s)?",Off,D.RegNameW(R&0xe));
						} break;
					case 2: { Adr=0; // EA <- R, R in high or low nibble of byte at PC determined by microcode	Register
						uint8_t R=E.RegsGet(D);
						sprintf_s(Str,",(%S)",D.RegNameW(R&0xe));
						} break;
					case 3: { // EA <- PC	Literal (illegal when address must be specified). Size provided in microcode.
						Adr=D.PC; D.PC+=Size;
						sprintf_s(Str,",#?");
						} break;
					default: strcpy(Str,",???");
					}
				}
			} Op1, Op2;
		EXT(CPU6DISASSEMBLER &D) {
			Mode=D.Fetch1();
			Regs=0; RegsSet=0;
			}
		void Eval1(CPU6DISASSEMBLER &D, uint16_t Size) { Op1.Eval(D,*this,Mode>>2,Size); }
		void Eval2(CPU6DISASSEMBLER &D, uint16_t Size) { Op2.Eval(D,*this,Mode   ,Size); }
		} ;

	void MemBlock(bool LengthInA) { // do memory block instructions
		if(PC==0x39f+1)
			printf("I'm here!\n");
		uint16_t Len=(LengthInA)?0:uint16_t(Fetch1())+1;
		EXT Ext(*this); // ssssmmnn followed by the operands. m and n are the CPU6 addressing modes, where addresses only are permitted.
		switch(Ext.Mode>>4) {
			case  0: sprintf_s(String,sizeof(String),"CVX"); Ext.Eval2(*this,2); Ext.Eval1(*this,2); break;  // binload?
			case  1: sprintf_s(String,sizeof(String),"CPV"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // compare, variable length?
			case  2: sprintf_s(String,sizeof(String),"MVV"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // move variable length?
			case  3: sprintf_s(String,sizeof(String),"SCN"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // scan?
			case  4: sprintf_s(String,sizeof(String),"MVF"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // copy block of memory from first argument to second argument
			case  5: sprintf_s(String,sizeof(String),"ANC"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // bitwise and?
			case  6: sprintf_s(String,sizeof(String),"ORC"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // bitwise or?
			case  7: sprintf_s(String,sizeof(String),"XRC"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // bitwise xor?
			case  8: sprintf_s(String,sizeof(String),"CPF"); Ext.Eval2(*this,1  ); Ext.Eval1(*this,Len); break;  // compare two blocks of memory, fixed length?
			case  9: sprintf_s(String,sizeof(String),"FIL"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len); break;  // fill memory
			default: sprintf_s(String,sizeof(String),"???"); Ext.Eval2(*this,Len); Ext.Eval1(*this,Len);
			}
		char S[32];
		if(LengthInA) strcat_s(String," (A)"); else { sprintf_s(S," %d",Len); strcat(String,S); }
		strcat_s(String,Ext.Op1.Str);  strcat_s(String,Ext.Op2.Str);
		}

public:
	void disasm(void) {
		Next1=1;  Next2=0;  Ref=0;  PC0=PC;
		Comment=0;
		for(unsigned i=0; i<_countof(Inline); i++) { Inline[i].Width=0; Inline[i].Comment=0; }
		opcode=Fetch1();
		switch(opcode) {
			case 0x00: AInh("HLT"); break; // HLT ; Wait for Interrupt (Halt)
			case 0x01: AInh("NOP"); break; // NOP ; No Operation
			case 0x02: AInh("SF");  break; // SF ; Set Fault flag
			case 0x03: AInh("RF");  break; // RF ; Reset Fault flag
			case 0x04: AInh("EI");  break; // EI ; Enable the Interrupt System (allow interrupts)
			case 0x05: AInh("DI");  break; // DI ; Disable the Interrupt System (disable interrupts)
			case 0x06: AInh("SL");  break; // SL ; Set the Link (carry) Flag
			case 0x07: AInh("RL");  break; // RL ; Reset the Link (carry) Flag
			case 0x08: AInh("CL");  break; // CL ; Complement Link flag
			case 0x09: AInh("RSR");  Next1=0; break; // RSR ; Return from subroutine
			case 0x0a: AInh("RI"); break;  // Return from interrupt
		//	case 0x0b: AInh("RIM"); break; // Return from Interrupt Modified
			case 0x0c: AInh("SYN"); break; // ???
			case 0x0d: AInh("PCX"); break;  // Transfer PC to X - X=address of next instruction
			case 0x0e: AInh("DLY"); break; //  Delay 4.55 ms - for TTY bit timing
			case 0x0f: AInh("RSV"); break; // Return from SVC or similar (pops a byte, then the new value of X, then a byte, then the new ipl)
			case 0x10: ARel("BL" ); Next2=Ref; break; // BL adr  ; Branch if Link (Carry) Set
			case 0x11: ARel("BNL"); Next2=Ref; break; // BNL adr ; Branch if Link (Carry) not Set
			case 0x12: ARel("BF" ); Next2=Ref; break; // BF adr  ; Branch if Fault (Overflow) Set
			case 0x13: ARel("BNF"); Next2=Ref; break; // BNF adr ; Branch if Fault (Overflow) not Set
			case 0x14: ARel("BZ" ); Next2=Ref; break; // BZ adr  ; Branch if V (Z) flag set
			case 0x15: ARel("BNZ"); Next2=Ref; break; // BNZ adr ; Branch if V (Z) flag clear
			case 0x16: ARel("BM" ); Next2=Ref; break; // BM adr  ; Branch if Minus flag set
			case 0x17: ARel("BP" ); Next2=Ref; break; // BP adr  ; Branch on Positive (Minus flag clear)
			case 0x18: ARel("BGZ"); Next2=Ref; break; // BGZ adr ; Branch if Greater Than 0 (!V && !Minus)
			case 0x19: ARel("BLE"); Next2=Ref; break; // BLE adr ; Branch if Less Than or Equal to 0 (V | Minus)
			case 0x1a: ARel("BS1"); Next2=Ref; break; // BS1 adr ; Branch if Sense Switch 1 Set
			case 0x1b: ARel("BS2"); Next2=Ref; break; // BS2 adr ; Branch if Sense Switch 2 Set
			case 0x1c: ARel("BS3"); Next2=Ref; break; // BS3 adr ; Branch if Sense Switch 3 Set
			case 0x1d: ARel("BS4"); Next2=Ref; break; // BS4 adr ; Branch if Sense Switch 4 Set
			case 0x1e: ARel("BI" ); Next2=Ref; break; // BI  Rel ; Branch on ??? (Changed for CPU6?)
			case 0x1f: ARel("BCK"); Next2=Ref; break; // BCK Rel ; Branch on clock interrupt enabled?

			case 0x20: AMRegB("INRB",1); break; // INRB BReg	; increment register upper byte or lower byte
			case 0x21: AMRegB("DCRB",1); break; // DCRB BReg	; decrement register upper byte or lower byte
			case 0x22: AMRegB("CLRB",0); break; // CLRB BReg	; clear register upper byte or lower byte
			case 0x23: AMRegB("IVRB",0); break; // IVRB BReg	; invert register byte
			case 0x24: AMRegB("SRRB",1); break; // SRRB BReg	; shift register byte right (sign extend)
			case 0x25: AMRegB("SLRB",1); break; // SLRB BReg	; shift register byte left (0 shifted in)
			case 0x26: AMRegB("RRRB",1); break; // RRRB BReg	; rotate register byte right (thru link flag)
			case 0x27: AMRegB("RLRB",1); break; // RLRB BReg
			case 0x28: AInh("INAB"); break; // INAB		; Increment AL register
			case 0x29: AInh("DCAB"); break; // DCAB		; Decrement AL register
			case 0x2a: AInh("CLAB"); break; // CLAB		; Clear AL register
			case 0x2b: AInh("IVAB"); break; // IVAB		; Invert AL register
			case 0x2c: AInh("SRAB"); break; // SRAB		; Shift AL register right (sign extend)
			case 0x2d: AInh("SLAB"); break; // SLAB		; Shift AL register left (0 shifted in)
			case 0x2e: { // Memory mapping
				EXT Ext(*this); Ext.Eval1(*this,1); Ext.Eval2(*this,1);
				switch(Ext.Mode>>4) {
					case 0: sprintf_s(String,sizeof(String),"WPF"); break; // Low 3 bits: page table base. High 5 bits: count	Address	Write Page File - write count page table entries with page table base from Operand 2 address
					case 1: sprintf_s(String,sizeof(String),"RPF"); break; // Low 3 bits: page table base. High 5 bits: count	Address	Read Page File - read count page table entries with page table base to Operand 2 address. Set top bit from MSR
					case 2: sprintf_s(String,sizeof(String),"WPF1"); break; // Low 3 bits: page table base. High 5 bits: Page table index	Address	Write Page File 1 entry from Operand 2 address
					case 3: sprintf_s(String,sizeof(String),"RPF1"); break; // Low 3 bits: page table base. High 5 bits: Page table index	Address	Read Page File 1 entry to Operand 2 address. Set top bit from MSR
					case 4: sprintf_s(String,sizeof(String),"WPF32"); break; // Low 3 bits: page table base. High 5 bits: Page table index	Address	Write Page File 32 entries from Operand 2 address
					case 5: sprintf_s(String,sizeof(String),"RPF32"); break; // Low 3 bits: page table base. High 5 bits: Page table index	Address	Read Page File 32 entries to Operand 2 address. Set top bit from MSR
				//	case 6:	System call?		Possibly just illegal
				//	case 7:	System call?		Possibly just illegal
					default: sprintf_s(String,sizeof(String),"$2e%02x???",Ext.Mode);
					}
				} break;
			case 0x2f: { // built-in DMA
				unsigned __int8 M=Fetch1();  char const *Reg=RegNameW(M>>4);
				switch(M&0xf) {
					case 0: sprintf_s(String,sizeof(String),"DMA SAD %s",Reg); break; // Load DMA Address from word register
					case 1: sprintf_s(String,sizeof(String),"DMA RAD %s",Reg); break; // Store DMA Address to word register
					case 2: sprintf_s(String,sizeof(String),"DMA SCT %s",Reg); break; // Load DMA Count from word register
					case 3: sprintf_s(String,sizeof(String),"DMA RCT %s",Reg); break; // Store DMA Count to word register
					case 4: sprintf_s(String,sizeof(String),"DMA SDV %u",M>>4); break; // Set DMA mode. Mode is constant in register nibble
					case 5: sprintf_s(String,sizeof(String),"DMA RDV %s",Reg); break; // Set DMA mode. Mode is read from register in register nibble. Will always use the low byte even if a high byte register is provided
					case 6: sprintf_s(String,sizeof(String),"DMA EAB %s",Reg); break; // Enable DMA
					case 7: sprintf_s(String,sizeof(String),"DMA DAB %s",Reg); break; // Disable DMA
					case 8: sprintf_s(String,sizeof(String),"DMA SMN %s",Reg); break; // Load low three bits of Internal Status Register from register. Will always use the low byte even if a high byte register is provided
					case 9: sprintf_s(String,sizeof(String),"STISR %s",Reg); break; // Store Internal Status Register to register. This instruction is buggy and will only store some of the bits depending on the register provided (the status register is masked on the inverse of the register number). Best results will be with AH. Will always use the low byte even if a high byte register is provided
					default: sprintf_s(String,sizeof(String),"$2f %02x ??? ",M);
					}
				} break;
			case 0x30: AMRegW("INR","INC",1); break; // INR WReg,n	; increment register word
													// INC WReg,n
			case 0x31: AMRegW("DCR","DEC",1); break; // DCR WReg,n	; decrement register word
													// DEC WReg,n
			case 0x32: AMRegW("CLR","CAD",0); break; // CLR WReg,n	; clear register word
													// CAD WReg,n
			case 0x33: AMRegW("IVR","IAD",0); break; // IVR WReg,n	; invert register word
													// IAD WReg,n
			case 0x34: AMRegW("SRR","SHR",1); break; // SRR WReg,n	; shift register right (sign extend)
													// SHR WReg,n
			case 0x35: AMRegW("SLR","SHL",1); break; // SLR WReg,n	; shift register left (0 shifted in)
													// SHL WReg,n
			case 0x36: AMRegW("RRR","RTR",1); break; // RRR WReg,n	; rotate register right (thru link flag)
													// RTR WReg,n
			case 0x37: AMRegW("RLR","RTL",1); break; // RLR WReg,n	; rotate register left (thru link flag)
													// RTL WReg,n
			case 0x38: AInh("INA"); break; // INA		; Increment AW register
			case 0x39: AInh("DCA"); break; // DCA		; Decrement AW register
			case 0x3a: AInh("CLA"); break; // CLA		; Clear AW register
			case 0x3b: AInh("IVA"); break; // IVA		; Invert AW register
			case 0x3c: AInh("SRA"); break; // SRA		; Shift AW register right (sign extend)
			case 0x3d: AInh("SLA"); break; // SLA		; Shift AW register left (0 shifted in)
			case 0x3e: AInh("INX"); break; // INX		; Increment XW register
			case 0x3f: AInh("DCX"); break; // DCX		; Decrement XW register

			case 0x40: AMReg2B("ADDB"); break; // DestReg,SrcReg ; Add byte Src to Dest
			case 0x41: AMReg2B("SUBB"); break; // DestReg,SrcReg ; Subtract byte Src to Dest
			case 0x42: AMReg2B("ANDB"); break; // DestReg,SrcReg ; AND byte Src to Dest
			case 0x43: AMReg2B("ORIB"); break; // DestReg,SrcReg ; OR byte Src to Dest
			case 0x44: AMReg2B("OREB"); break; // DestReg,SrcReg ; XOR byte Src to Dest
			case 0x45: AMReg2B("XFRB"); break; // DestReg,SrcReg ; Copy byte of Src register into byte of Dest register
			case 0x46: { // big number operations.
				uint8_t LK=Fetch1(), L=(LK>>4)+1, K=(LK&0xf)+1; // llllkkkk where l is the size of operand 1, k is the size of operand 2
				EXT Ext(*this); Ext.Eval1(*this,L); Ext.Eval2(*this,K);
				switch(Ext.Mode>>4) {
					case  0: sprintf_s(String,"A"); break; // Adds two big numbers. Dest = Src + Dest
					case  1: sprintf_s(String,"S"); break; // Subtracts two big numbers. Dest = Src - Dest
					case  2: sprintf_s(String,"C"); break; // compare
					case  3: sprintf_s(String,"ZAD"); break; // zero & add, aka move
					case  4: sprintf_s(String,"ZSU"); break; // zero & subtract, aka move negated
					case  5: sprintf_s(String,"M"); break; // multiply
					case  6: sprintf_s(String,"D"); break; // divide
					case  7: sprintf_s(String,"DRM"); break; // divide remainder
					case  8: sprintf_s(String,"CTB"); break; // cvt to binary
					case  9: sprintf_s(String,"CFB"); break; // cvt from binary
					default: sprintf_s(String,"???");
					}
				char S[32];
				sprintf_s(S," %d",L); strcat_s(String,S); strcat_s(String,Ext.Op1.Str);
				sprintf_s(S,",%d",K); strcat_s(String,S); strcat_s(String,Ext.Op2.Str);
				} break;
			case 0x47: MemBlock(0);  break;
			case 0x48: AInh("AABB"); break; // BL+=AL
			case 0x49: AInh("SABB"); break; // BL=AL-BL
			case 0x4a: AInh("NABB"); break; // BL&=AL
			case 0x4b: AInh("XAXB"); break; // XL=AL 
			case 0x4c: AInh("XAYB"); break; // YL=AL
			case 0x4d: AInh("XABB"); break; // BL=AL
			case 0x4e: AInh("XAZB"); break; // ZL=AL
			case 0x4f: AInh("XASB"); break; // SL=AL
			case 0x50: AMReg2W("ADD"); break; // DestReg,SrcReg ; Add word Src to Dest
			case 0x51: AMReg2W("SUB"); break; // DestReg,SrcReg ; Subtract word Src to Dest
			case 0x52: AMReg2W("AND"); break; // DestReg,SrcReg ; AND word Src to Dest
			case 0x53: AMReg2W("ORI"); break; // DestReg,SrcReg ; OR word Src to Dest
			case 0x54: AMReg2W("ORE"); break; // DestReg,SrcReg ; XOR word Src to Dest
			case 0x55: AMReg2W("XFR"); break; // DestReg,SrcReg ; Copy Src register into Dest register
			case 0x56: AInh("EAO"); break; // ???
			case 0x57: AInh("DAO"); break; // ???
			case 0x58: AInh("AAB"); break; // BW+=AW
			case 0x59: AInh("SAB"); break; // BW=AW-BW
			case 0x5a: AInh("NAB"); break; // BW&=AW
			case 0x5b: AInh("XAX"); break; // XW=AW
			case 0x5c: AInh("XAY"); break; // YW=AW
			case 0x5d: AInh("XAB"); break; // BW=AW
			case 0x5e: AInh("XAZ"); break; // ZW=AW
			case 0x5f: AInh("XAS"); break; // SW=AW

			case 0x60: ALitW  ("LDX"); break; // LDXL Lit ; Load immediate into XW
			case 0x61: ADir   ("LDX"); break; // LDXD Direct ;	Load direct address into XW
			case 0x62: AIndir ("LDX"); break; // LDXI Indirect ; Load indirect address into XW
			case 0x63: ARel   ("LDX"); break; // LDXR Rel ; Load direct Program Counter offset by N address into XW
			case 0x64: ARelInd("LDX"); break; // LDXRI Rel ; Load indirect Program Counter offset by N address into XW
			case 0x65: AIndex ("LDX",2); break; // LDXX WReg,Mod,Offset ; Load indexed mode register into XW
			case 0x66: { uint8_t Index=Fetch1();
				sprintf_s(String,sizeof(String),"SVC $%02x",Index);
				switch(Index) { // do inline parameter patterns
				//	case 0x00: no operands
					case 0x05: Comment="@TS"; Inline[0].Width=1; Inline[0].Comment="format?"; Inline[1].Width=2; Inline[1].Comment="ptr"; break;
					case 0x07: Comment="yield?"; break; // no operands
					case 0x08:  Comment="flush?"; Inline[0].Width=2; Inline[0].Comment="ptr"; break;
					case 0x09: Comment="abort"; Inline[0].Width=1; Inline[0].Comment="code"; break;
					case 0x0a: Comment="@EN  end task"; Inline[0].Width=1; Inline[0].Comment="code"; break;
					case 0x0b: Comment="@DT"; break;
					case 0x10: Comment="DoFileOp?"; break;
					case 0x18: Comment="file something???"; break;
				//	case 0x19: no operands
					case 0x1b: Comment="@GB"; break;
					case 0x1c: Comment="@GC getclock?"; Inline[0].Width=2; Inline[0].Comment="ptr"; break;
					case 0x1e: Comment="@LD"; Inline[0].Width=2; Inline[0].Comment="ptr"; Inline[1].Width=1; break;
					case 0x1f: Comment="@ST"; Inline[0].Width=2; Inline[0].Comment="ptr"; break;
					case 0x20: Comment="@AD"; break;
					case 0x22: Comment="@SU"; break;
					case 0x24: Comment="@MU"; break;
					case 0x25: Comment="@DV"; break;
					case 0x26: Comment="@CN"; Inline[0].Width=2; Inline[0].Comment="ptr"; Inline[1].Width=2; Inline[1].Comment="ptr";
						Inline[2].Width=2; Inline[2].Comment="ptr"; Inline[3].Width=1;  break;
					case 0x27: Comment="@CS"; Inline[0].Width=2; Inline[0].Comment="ptr"; Inline[1].Width=2; Inline[1].Comment="ptr";
						Inline[2].Width=2; Inline[2].Comment="ptr"; Inline[3].Width=1; break;
					case 0x28: Comment="@CG"; break;
					case 0x29: Comment="@MV move string?"; Inline[0].Width=2; Inline[0].Comment="ptr"; Inline[1].Width=2; Inline[1].Comment="ptr";
						Inline[2].Width=2; break;
					case 0x2a: Comment="@CP"; break;
					case 0x2b: Comment="unsigned? multiply B=A*B"; break;
					case 0x2c: Comment="unsigned? divide?"; break;
					case 0x2e: Inline[0].Width=2; break;
					case 0x2f: Comment="@CB"; break;
					case 0x30: Comment="@CC"; break;
					case 0x31: Comment="@WN"; break;
					case 0x32: Comment="@DC"; Inline[0].Width=2; Inline[0].Comment="ptr"; Inline[1].Width=2; Inline[1].Comment="ptr";
						Inline[2].Width=2; Inline[2].Comment="ptr"; Inline[3].Width=2; break;
					case 0x33: Comment="@NC"; break;
					case 0x34: Comment="@RF";
						Inline[0].Width=2; Inline[0].Comment="FCB ptr";  Inline[1].Width=2; Inline[1].Comment="ptr";
						Inline[2].Width=2; Inline[2].Comment="ptr";  Inline[3].Width=2; break;
					case 0x35: { Comment="@WF  write formatted?";
						Inline[0].Width=2; Inline[0].Comment="FCB ptr";
						Inline[1].Width=2; Inline[1].Comment="buf ptr { byte, 132chars, byte0 }";
						for(unsigned i=2; i<_countof(Inline); i++) { Inline[i].Width=2; Inline[i].Comment="ptr source?";  if(MRead2(i*2)==0) break; }
						} break;
					case 0x36: Comment="@RT"; break;
					case 0x37: Comment="@RB"; break;
					case 0x38: Comment="@WB"; Inline[0].Width=2; Inline[1].Width=2; break;
					case 0x39: { Comment="@OP	open file?";
						for(unsigned i=0; i<_countof(Inline); i++) {
							Inline[i*2].Width=1;  if(MRead1(i*3)==0) { Inline[i*2].Comment="end of list"; break; }
							Inline[i*2+1].Width=2; Inline[i*2+1].Comment="ptr FCB";
							}  } break;
					case 0x3a: Comment="@CT"; Inline[0].Width=1; Inline[1].Width=2; Inline[1].Comment="ptr"; break;
					case 0x3b: Comment="@LD48"; break;
					case 0x3c: Comment="@ST48"; break;
					case 0x3d: Comment="@Ad48"; break;
					case 0x3e: Comment="@RS"; break;
					case 0x3f: Comment="@SU48"; break;
					case 0x41: Comment="@MU48"; break;
					case 0x42: Comment="@DV48"; break;
					case 0x43: Comment="@CN48"; break;
					case 0x44: Comment="@CG48"; break;
					case 0x45: Comment="@LD64"; break;
					case 0x46: Comment="@ST64"; break;
					case 0x47: Comment="@Ad64"; break;
					case 0x48: Comment="@SU64"; break;
					case 0x49: Comment="@MU64"; break;
					case 0x4a: Comment="@DV64"; break;
					case 0x52: Inline[0].Width=1; Inline[1].Width=1; Inline[2].Width=1; Inline[3].Width=2; Inline[3].Comment="ptr"; break;
					case 0x56: Inline[0].Width=1; Inline[1].Width=1; Inline[2].Width=1; Inline[3].Width=1; Inline[4].Width=2; Inline[4].Comment="ptr"; break;
					case 0x59: Comment="alloc another contig page???"; break;
					case 0x5c: Comment="device???"; Inline[0].Width=1; Inline[1].Width=1; Inline[1].Comment="device#";
						Inline[2].Width=1; Inline[3].Width=2; Inline[3].Comment="ptr status?"; break;
					case 0x5d: Comment="startup something?";
						Inline[0].Width=2; Inline[1].Width=1; Inline[2].Width=1; Inline[2].Comment="ptr to ptr to byte";  break;
				//	case 0x68:
					}
				} break;
			case 0x67: MemBlock(1); break;
			case 0x68: ALitW  ("STX"); break; // STXL Lit ; Store XW into literal address
			case 0x69: ADir   ("STX"); break; // STXD Direct ; Store XW into direct address
			case 0x6a: AIndir ("STX"); break; // STXI Indirect ; Store XW into indirect address
			case 0x6b: ARel   ("STX"); break; // STXR Rel ; Store XW into direct Program Counter offset by N address
			case 0x6c: ARelInd("STX"); break; // STXRI Rel ; Store XW into indirect Program Counter offset by N address
			case 0x6d: AIndex ("STX",2); break; // STXX WReg,Mod,Offset ; Store XW into indexed register
			case 0x6E: AInh("LST??"); break;
			case 0x6F: AInh("SST??"); break;

		//	case 0x70: ??
			case 0x71: ADir   ("JMP"); Next1=0; Next2=Ref; break; // JMPD Direct ; Jump to direct address
			case 0x72: AIndir ("JMP"); Next1=0; Next2=Ref; break; // JMPI Indirect ; Jump to indirect address
			case 0x73: ARel   ("JMP"); Next1=0; Next2=Ref; break; // JMPR Rel ; Jump to direct Program Counter offset by N address
			case 0x74: ARelInd("JMP"); Next1=0; Next2=Ref; break; // JMPRI Rel ; Jump to indirect Program Counter offset by N address
			case 0x75: AIndex ("JMP",1); Next1=0; Next2=Ref; break; // JMPX WReg,Mod,Offset ;Jump to indexed mode register
			case 0x76: AInh("EPE"); break; // ???
			case 0x77: AMReg2W("ADD"); break; // MUL

		//	case 0x78: ??
			case 0x79: if(MemInfo) {
				uint16_t A=MRead2(0);
				MemInfo[A].IsEntrypoint=1; }
			           ADir   ("JSR"); Next2=Ref;  break; // JSRD Direct ; Jump to subroutine at direct address
			case 0x7a: AIndir ("JSR"); Next2=Ref; break; // JSRI Indirect ; Jump to subroutine at indirect address
			case 0x7b:  if(MemInfo) MemInfo[signed __int8(MRead1(0))+PC+1].IsEntrypoint=1;
			           ARel   ("JSR"); Next2=Ref; break;  // JSRR Rel ; Jump to subroutine at Program Counter offset by N address
			case 0x7c: ARelInd("JSR"); Next2=Ref; break; // JSRRI Rel ; Jump to subroutine at indirect Program Counter offset by N address
			case 0x7d: AIndex ("JSR",1); Next2=Ref; break; // JSRX WReg,Mod,Offset ; Jump to subroutine at indexed mode register
			case 0x7e: { unsigned __int8 B=Fetch1();  // aka PUSH
				sprintf_s(String,sizeof(String),"STK %s,%u",RegNameB(B>>4),(B&0xf)+1); } break;
			case 0x7f: { unsigned __int8 B=Fetch1();
				sprintf_s(String,sizeof(String),"POP %s,%u",RegNameB(B>>4),(B&0xf)+1); } break;

			case 0x80: ALitB  ("LDAB"); break; // LDABL Lit ; Load literal address into AL register
			case 0x81: ADir   ("LDAB"); break; // LDABD Direct ; Load direct address into AL register
			case 0x82: AIndir ("LDAB"); break; // LDABI Indirect ; Load indirect address into AL register
			case 0x83: ARel   ("LDAB"); break; // LDABR Rel ; Load direct Program Counter offset by N address into AL register
			case 0x84: ARelInd("LDAB"); break; // LDABRI Rel ; Load indirect Program Counter offset by N address into byte of AL register
			case 0x85: AIndex ("LDAB",1); break; // LDABX WReg,Mod,Offset ; Load indexed register into byte of AL register
			case 0x86: AInh("DPE"); break; // ??
		//	case 0x87: ??
			case 0x88: case 0x89: case 0x8a: case 0x8b: case 0x8c: case 0x8d: case 0x8e: case 0x8f:
				ARegA("LDAB"); break; // LDABA WReg ; Load byte from memory address stored in WReg into AL register

			case 0x90: ALitW  ("LDA"); break; // LDAL Lit ; Load literal address into full word of AW register
			case 0x91: ADir   ("LDA"); break; // LDAD Direct ; Load direct address into full word of AW register
			case 0x92: AIndir ("LDA"); break; // LDAI Indirect ; Load indirect address into full word of AW register
			case 0x93: ARel   ("LDA"); break; // LDAR Rel ; Load direct Program Counter offset by N address into full word of AW register
			case 0x94: ARelInd("LDA"); break; // LDARI Rel ; Load indirect Program Counter offset by N address into full word of AW register
			case 0x95: AIndex ("LDA",2); break; // LDAX WReg,Mod,Offset ; Load indexed register into full word of AW register
			case 0x96: AInh("SOP"); break;
		//	case 0x97: ??
			case 0x98: case 0x99: case 0x9a: case 0x9b: case 0x9c: case 0x9d: case 0x9e: case 0x9f:
				ARegA("LDA"); break; // LDAA WReg ; Load byte from memory address stored in WReg into AL register

			case 0xa0: ALitB  ("STAB"); break; // STABL Lit ; Store byte of AL register into literal address (Not possible?)
			case 0xa1: ADir   ("STAB"); break; // STABD Direct ; Store byte of AL register into direct address
			case 0xa2: AIndir ("STAB"); break; // STABI Indirect ; Store byte of AL register into indirect address
			case 0xa3: ARel   ("STAB"); break; // STABR Rel ; Store byte of AL register into direct Program Counter offset by N address
			case 0xa4: ARelInd("STAB"); break; // STABRI Rel ; Store byte of AL register into indirect Program Counter offset by N address
			case 0xa5: AIndex ("STAB",1); break; // STABX WReg,Mod,Offset ; Store byte of AL register into indexed register
			case 0xa6: AInh("SEP"); break;
		//	case 0xa7: ??
			case 0xa8: case 0xa9: case 0xaa: case 0xab: case 0xac: case 0xad: case 0xae: case 0xaf:
				ARegA("STAB"); break; // STABA WReg ; Store AL register to memory address stored in WReg

			case 0xb0: ALitW  ("STA"); break; // STAL Lit ; Store word of AW register into literal address (Not possible?)
			case 0xb1: ADir   ("STA"); break; // STAD Direct ; Store word of AW register into direct address
			case 0xb2: AIndir ("STA"); break; // STAI Indirect ; Store word of AW register into indirect address
			case 0xb3: ARel   ("STA"); break; // STAR Rel ; Store word of AW register into direct Program Counter offset by N address
			case 0xb4: ARelInd("STA"); break; // STARI Rel ; Store word of AW register into indirect Program Counter offset by N address
			case 0xb5: AIndex ("STA",2); break; // STAX WReg,Mod,Offset ; Store word of AW register into indexed register
			case 0xB6: AInh("ECK"); break; // enable clock interrupt?
		//	case 0xb7: ??
			case 0xb8: case 0xb9: case 0xba: case 0xbb: case 0xbc: case 0xbd: case 0xbe: case 0xbf:
				ARegA("STA"); break; // STAA WReg ; Store AW register to memory address stored in WReg

			case 0xc0: ALitB  ("LDBB"); break; // LDBBL Lit ; Load literal address into BL register
			case 0xc1: ADir   ("LDBB"); break; // LDBBD Direct ; Load direct address into BL register
			case 0xc2: AIndir ("LDBB"); break; // LDBBI Indirect ; Load indirect address into BL register
			case 0xc3: ARel   ("LDBB"); break; // LDBBR Rel ; Load direct Program Counter offset by N address into BL register
			case 0xc4: ARelInd("LDBB"); break; // LDBBRI Rel ; Load indirect Program Counter offset by N address into BL register
			case 0xc5: AIndex ("LDBB",1); break; // LDBBX WReg,Mod,Offset ; Load indexed register into BL register
			case 0xC6: AInh("DCK"); break;  // disable clock interrupt?
		//	case 0xC7: ??
			case 0xc8: case 0xc9: case 0xca: case 0xcb: case 0xcc: case 0xcd: case 0xce: case 0xcf:
				ARegA("LDBB"); break; // LDBBA WReg ; Load byte from memory address stored in WReg into BL register

			case 0xd0: ALitW  ("LDB"); break; // LDBL Lit ; Load literal address into BW register
			case 0xd1: ADir   ("LDB"); break; // LDBD Direct ; Load direct address into BW register
			case 0xd2: AIndir ("LDB"); break; // LDBI Indirect ; Load indirect address into BW register
			case 0xd3: ARel   ("LDB"); break; // LDBR Rel ; Load direct Program Counter offset by N address into BW register
			case 0xd4: ARelInd("LDB"); break; // LDBRI Rel ; Load indirect Program Counter offset by N address into BW register
			case 0xd5: AIndex ("LDB",2); break; // LDBX WReg,Mod,Offset ; Load indexed register into BW register
			case 0xD6: AInh("STR??"); break;
			case 0xD7: AInh("SAR??"); break;
			case 0xd8: case 0xd9: case 0xda: case 0xdb: case 0xdc: case 0xdd: case 0xde: case 0xdf:
				ARegA("LDB"); break; // LDBA WReg ; Load word from memory address stored i0xn WReg into BW register

			case 0xe0: ALitB  ("STBB"); break; // STBBL Lit ; Store byte of BL register into literal address (Not possible?)
			case 0xe1: ADir   ("STBB"); break; // STBBD Direct ; Store BL into direct address
			case 0xe2: AIndir ("STBB"); break; // STBBI Indirect ; Store BL into indirect address
			case 0xe3: ARel   ("STBB"); break; // STBBR Rel ; Store BL into direct Program Counter offset by N address
			case 0xe4: ARelInd("STBB"); break; // STBBRI Rel ; Store BL into indirect Program Counter offset by N address
			case 0xe5: AIndex ("STBB",1); break; // STBBX WReg,Mod,Offset ; Store BL into indexed register
			case 0xE6: AInh("LAR??"); break;
		//	case 0xE7: ??
			case 0xe8: case 0xe9: case 0xea: case 0xeb: case 0xec: case 0xed: case 0xee: case 0xef:
				ARegA("STBB"); break; // STBBA WReg ; Store byte from BL register to memory address stored in WReg

			case 0xf0: ALitW  ("STB"); break; // STBL Lit ; Store BW into literal address (Not possible?)
			case 0xf1: ADir   ("STB"); break; // STBD Direct ; Store BW into direct address
			case 0xf2: AIndir ("STB"); break; // STBI Indirect ; Store BW into indirect address
			case 0xf3: ARel   ("STB"); break; // STBR Rel ; Store BW into direct Program Counter offset by N address
			case 0xf4: ARelInd("STB"); break; // STBRI Rel ; Store BW into indirect Program Counter offset by N address
			case 0xf5: AIndex ("STB",2); break; // STBX WReg,Mod,Offset ; Store BW into indexed register
			case 0xF6: { // LIO & SIO : opsys ALWAYS uses this instruction for accessing MMIO.
				// It might do something special on the bus, or with page-tables
				//
				// If index register is odd, does a store, otherwise does a load
				// If destination register is odd, does an 8 bit operation, otherwise 16bit
				uint8_t regs = Fetch1(), reg1=regs >> 4, reg2=regs&0xf;
				signed __int8 offset = Fetch1();
				
				switch (regs & 0x11) {
					case 0x00: { // 16 bit load
						sprintf_s(String, sizeof(String), "LD %s,%x(%s)",RegNameW(reg1),offset,RegNameW(reg2)); } break;
					case 0x01: { // 16 bit store
						sprintf_s(String, sizeof(String), "ST %s,%x(%s)", RegNameW(reg1), offset, RegNameW(reg2)); } break;
					case 0x10: { // 8 bit load
						sprintf_s(String, sizeof(String), "LDB %s,%x(%s)", RegNameB(reg1), offset, RegNameW(reg2)); } break;
					case 0x11: { // 8 bit store
						sprintf_s(String, sizeof(String), "STB %s,%x(%s)", RegNameB(reg1), offset, RegNameW(reg2)); } break;
					}
				} break;

			case 0xF7: AInh("MVL"); break; // memcpy
			case 0xf8: case 0xf9: case 0xfa: case 0xfb: case 0xfc: case 0xfd: case 0xfe: case 0xff:
				ARegA("STB"); break; // STBA WReg ; Store BW to memory address stored in WReg

			default: sprintf_s(String,sizeof(String),".byte $%02X",opcode);
			}
		if(Next1==1) Next1=PC;
		}
	} ; // DISASMCPU6

//*********************************************************
struct CBIN { // Centurion binary loader
	// From https://github.com/EtchedPixels/Centurion/blob/main/cbin.c
	// https://raw.githubusercontent.com/EtchedPixels/Centurion/main/cbin.h

	// Centurion binary format
	//
	// Appears to be used for both executable and binary data files.
	// Supports relocation

	//#include <assert.h>
	//#include <stdint.h>
	//#include <stdlib.h>
	//#include <stdio.h>
	//#include <string.h>

	static unsigned const SECTOR_SIZE=400;

	enum RECORDTYPE : uint8_t {
	    DATA   = 0x00,
	    FIXUPS = 0x01,

	    // These aren't a full header, they are just a single byte type
	    END_SECTOR = 0x80, // Skips ahead to the next 400 byte sector
	    END_FILE = 0x84, // Finishes loading
		};

    const char* name;
    FILE *fp;
    bool errored;
    bool finished;
    int idx;
    int sector;
    uint8_t checksum_sum;
    uint8_t buffer[SECTOR_SIZE];

	struct cbin_record {
		RECORDTYPE type;
		uint8_t len; // Might be limited to 0x78
		uint16_t addr;
		uint8_t data[SECTOR_SIZE];
		} record;

	// Returns true if the load completed without error
	bool IsFinished(void) { return !errored && finished; }

	// Returns true if an error was encountered while reading
	bool IsErrored(void) { return errored; }

	// Set an error, print internal state
	// Print common error message and mark cbin as errored
	void cbin_error(void) {
	    size_t file_offset = sector * SECTOR_SIZE + sector;
	    fprintf(stderr, " at sector %i + %x (file offset: 0x%04zx)\n",
			sector, idx, file_offset);
	    fprintf(stderr, "\n%s: centurion binary format load failed\n",name);

		errored = 1;
		}

private:
	uint8_t read8(void) {
	    if (idx+1 > SECTOR_SIZE) {
	        fprintf(stderr, "sector overrun");  cbin_error();  return 0; }
	    uint8_t byte = buffer[idx++];
		checksum_sum += byte;
	    return byte; }

	uint16_t read16(void) { return (read8() << 8) | read8(); }
public:

	// Skips to next sector
	void next_sector(void) {
	    if (fp == NULL)
	        return;

		sector++;
		idx = 0;
		size_t read_len = fread(buffer, 1, SECTOR_SIZE, fp);
		if (read_len != SECTOR_SIZE) {
			if (read_len == 0) {
				perror("fread");  fprintf(stderr, "read error");  }
			else {
	            fprintf(stderr, "sector too small, only got %zu bytes", read_len); }
	        cbin_error();
			}
		}

	CBIN(const char *name1) { 	// Opens a cbin file
	    memset(this, 0, sizeof(*this));  	    // init state object

		fp=0;  errno_t rc=fopen_s(&fp, name1, "rb");  if(rc) {	    // Open file
			perror("fopen");  printf("%s\n",name1);  cbin_error();  }

	    // Setup initial state
		name = name1;
		sector = -1; // nextsector will increment
	    next_sector();
		}

	// Cleans up internal state and frees the cbin struct
	~CBIN() {
		if (fp) {
			fclose(fp);  }
		}

	// Returns next record
	// Returns a NULL pointer if no more records exist
	cbin_record* next_record(void) {
		if (errored)
			return NULL;

		while(1) {
	        checksum_sum = 0;

	        record.type = RECORDTYPE(read8());

			if (record.type == END_FILE) {
				finished = 1;  return NULL;  }

			if (record.type == END_SECTOR) {
				next_sector();  continue; }

	        uint8_t len = read8();
	        record.len = len;
			record.addr = read16();

			if((idx + len + 1) > SECTOR_SIZE) {
				fprintf(stderr, "record too big, %i bytes", len);
				cbin_error();
				return NULL;  }

	        // copy data;
	        for (int i = 0; i < len; i++) {
	            // reading calculates checksum
	            record.data[i] = read8();  }

	        uint8_t checksum = -checksum_sum; // Negated
	        uint8_t expected = read8();

	        if (expected != checksum) {
	            fprintf(stderr, "checksum error. Got %02x, Expected %02x",
	                checksum, expected);
	            cbin_error();  }

	        if (errored)
				return NULL;

			return &record;
			}
		}
	} ; // CBIN

struct CBIN_LOAD { 
	// From https://github.com/EtchedPixels/Centurion/blob/main/cbin_load.h
	// From https://github.com/EtchedPixels/Centurion/blob/main/cbin_load.c

private:
	CPU6 *Cpu; // for memory access

	uint16_t read_word(CBIN::cbin_record* record, size_t offset) {
	    uint16_t word = record->data[offset] << 8;
		word |= record->data[offset+1];
		return word;  }

	// Type CBIN_DATA
	void load_data(uint16_t *load_offset, CBIN::cbin_record* record) {
	    if (record->addr == 0x004c && record->len > 0x1b) {
	        // This appears to be a convention for the old table loader.
	        // Seems it can't do multiple sectors, or fixups. So intended for
	        // tape loading start with a single sector replacement loader,
	        // loaded to 0x4c, and jump to it;
	        // This new second stage loader completes the load.
	        //
	        // But newer loaders ignore it and just steal the load offset

	        *load_offset = read_word(record, 0x1b);
			return;
			}

	    // Load len bytes of data to addr
	    for (int i = 0; i < record->len; i++) {
			uint16_t adr=record->addr + i + *load_offset;
			MFlags[adr].Load=1;
			Cpu->Mwu1(adr, record->data[i]);  }
		}

	// Type CBIN_FIXUPS
	void apply_fixups(uint16_t load_offset, CBIN::cbin_record* record) {
	    uint16_t offset = load_offset + record->addr;
	    uint16_t fixup_addr;
	    uint16_t fixup_val;

	    for (size_t i = 0; i < record->len; i += 2) {
	        fixup_addr = read_word(record, i);

	        fixup_val = Cpu->Mru2(fixup_addr + load_offset);
	        fixup_val += offset;
			Cpu->Mwu2(fixup_addr + load_offset, fixup_val);
			MFlags[fixup_addr+load_offset].FixupWord=1;
		    }
		}

public:
    uint16_t entry_addr;
	struct ME { unsigned __int8 Load:1, FixupWord:1; } *MFlags;

	~CBIN_LOAD() { free(MFlags); MFlags=0; }

	// Loads a Centurion binary file directly into memory
	CBIN_LOAD(const char *name, uint16_t load_offset, CPU6 *Cpu1) {
		Cpu=Cpu1;
		entry_addr = 0;
		CBIN::cbin_record* record = NULL;
		MFlags=(ME *)calloc(1,0x10000);

	    CBIN cbin(name);

	    while ((record = cbin.next_record())) {
	        switch (record->type) {
				case CBIN::DATA:
		            if (record->len == 0) {
		                // a zero length data record is the entry address
		                entry_addr = record->addr + load_offset;
		            } else {
		                load_data(&load_offset, record); // Might modify load_offset
		            }
		            break;
				case CBIN::FIXUPS:
		            // Apply fixups
		            if (record->len % 2 == 1){
		                fprintf(stderr, "FIXUPS record must have even length");
		                cbin.cbin_error();
			            }
		            apply_fixups(load_offset, record);
		            break;
		        default:
		            fprintf(stderr, "unknown type %02x\n", record->type);
					cbin.cbin_error();
		        }
		    }
	    // Finished loading
	    if (entry_addr && cbin.IsFinished()) {
	        printf("Centurion Binary %s loaded; entry at %04hx\n\n", name, entry_addr);
		    return; }

	    if (!cbin.IsErrored() && entry_addr == 0) {
	        fprintf(stderr, "Couldn't find entry point\n");  }

	    printf("Centurion Binary loading of %s failed\n", name);
	    exit(1);
		}

	} ; // CBIN_LOAD

//*********************************************************
static void dump(unsigned __int32 l, unsigned __int32 h) {
  for (unsigned __int32 i=l; i<h; i+=0x10) {
    printf("%06X:",i);
	unsigned __int8 D[16];
    for (unsigned j=0; j<16; j++) { D[j]=Mem.ReadU1(j+i);  printf(" %02X",D[j]);  if((j&7)==7) printf(" "); }
	printf(" ");
	for(unsigned j=0; j<16; j++) { char C=D[j]&0x7f; if(C<32) C='.'; printf("%c",C); } 
    printf("\n");
    }
  }

static void trace(CPU6 const &C) {
	CPU6DISASSEMBLER D; D.PC=C.PC;  D.disasm();

	char f_n=C.Minus ? 'M' : 'm';
	char f_v=C.Value ? 'V' : 'v';
	char f_f=C.Fault ? 'F' : 'f';
	char f_l=C.Link  ? 'L' : 'l';
	char f_i=C.InterruptEnabled ? 'I' : 'i';

	printf("A=%04X B=%04X X=%04X Y=%04X Z=%04X S=%04X C=%04x %c%c%c%c%c %02X%02X%02X%02X %04X %s\n",
		C.RegW(CPU6::AW),C.RegW(CPU6::BW),C.RegW(CPU6::XW),C.RegW(CPU6::YW),C.RegW(CPU6::ZW),C.RegW(CPU6::SW),
		C.RegW(CPU6::CW),f_n,f_v,f_f,f_l,f_i,
		C.Mru1(C.PC),C.Mru1(C.PC+1),C.Mru1(C.PC+2),C.Mru1(C.PC+3),C.PC,D.String);
	}


/*******************************************************/
static void dohex(unsigned int p, char s[32]) {
	sprintf_s(s,sizeof(*s),"%02X %02X %02X  %02X  %02X %02X %02X",
			Mem.ReadU1(p-3),Mem.ReadU1(p-2),Mem.ReadU1(p-1),Mem.ReadU1(p),Mem.ReadU1(p+1),Mem.ReadU1(p+2),Mem.ReadU1(p+3));
	}

/*******************************************************/
static void DumpToFile(char const *Fname, unsigned int l, unsigned int h) {

	FILE *disfile=NULL; if (fopen_s(&disfile,Fname,"wt")) {
		perror("DumpToFile: open error on "); printf("%s\n",Fname);  return; }

	for (unsigned int i=l; i<=h; i++)
		fprintf(disfile,"~%04X,%02X\n",i,Mem.ReadU1(i));

	fclose(disfile);
	}

/*******************************************************/
static void DisasmToFile(char const *AdrFname, char const *OutFname, CBIN_LOAD const *Cbl) {
	CPU6DISASSEMBLER D;  D.MemInfoInit();
	if(Cbl) {
		for(unsigned i=0; i<0x10000; i++) { D.MemInfo[i].IsFixupWord=Cbl->MFlags[i].FixupWord; D.MemInfo[i].IsLoaded=Cbl->MFlags[i].Load; } }
	else { for(unsigned i=0; i<0x10000; i++) D.MemInfo[i].IsLoaded=1; }

	unsigned __int32 entrys[2000];  int entry_ix=0;
	FILE *AdrFile=NULL; if (fopen_s(&AdrFile,AdrFname,"rt")) {
		perror("disasm: open error on ");  printf("%s\n",AdrFname);  return; }
	while(!feof(AdrFile)) {
		unsigned b;  fscanf_s(AdrFile,"%x\n",&b);
		entrys[entry_ix++]=b;   D.MemInfo[b].IsEntrypoint=1;
		}
	fclose(AdrFile);

	FILE *disfile=NULL; if (fopen_s(&disfile,OutFname,"wt")) {
		perror("disasmf: open error on ");  printf("%s\n",OutFname);  return; }

	while(entry_ix>0) { // trace all instructions
		unsigned __int32 b=entrys[--entry_ix];
		if(!D.MemInfo[b].IsLoaded) continue;
		if(!D.MemInfo[b].IsOpcode) {
			D.MemInfo[b].IsOpcode=1;
			D.PC=b;  D.disasm();
			if(D.opcode>=0x71 && D.opcode<=0x75) D.MemInfo[D.Next2].IsEntrypoint=1;
			for(CPU6DISASSEMBLER::PARMS const *I=&D.Inline[0]; I->Width; I++) {
				switch(I->Width) {
					case 1: D.PC+=1; break;
					case 2: { uint16_t V=D.MRead2(0);  D.MemInfo[V].IsLabel=1;  D.PC+=2; } break;
					default: __debugbreak();
					}
				if(D.Next1) D.Next1=D.PC;
				}
			for(unsigned i=b; i<D.PC; i++)  D.MemInfo[i].IsUsed=1;
			printf("%3d %04X ",entry_ix,b);
			if(D.Ref!=0) D.MemInfo[D.Next2].IsLabel=1;
			if(D.Next2!=0) entrys[entry_ix++]=D.Next2;
			if(D.Next1!=0) entrys[entry_ix++]=D.Next1; else D.MemInfo[b].IsFlowbreak=1;
			}
		}

	for(D.PC=0x0000; D.PC<0xffff; ) { // generate listing
		if(!D.MemInfo[D.PC].IsLoaded) { D.PC++; continue; }
		unsigned __int32 b=D.PC;
		if      (D.MemInfo[b].IsEntrypoint) { fprintf(disfile,"E_%04X:",b); }
		else if (D.MemInfo[b].IsLabel     ) { fprintf(disfile,"L_%04X:",b); }
		if(D.MemInfo[b].IsFixupWord) {
			D.PC+=2;
			unsigned __int16 v=Mem.ReadU1(b); v<<=8; v|=Mem.ReadU1(b+1);
			fprintf(disfile,"\tDW L_%04X\t;%04X %02X %02X  fixupword\n",v,b,v>>8,v&0xff);
			}
		else if(D.MemInfo[b].IsOpcode) {
			D.disasm();
			fprintf(disfile,"\t%s\t;%04X",D.String,b);
			bool Fixup=0;
			for(unsigned i=b; i<D.PC; i++) {
				if(D.MemInfo[i].IsFixupWord) fprintf(disfile," ");
				fprintf(disfile," %02X",Mem.ReadU1(i));  Fixup|=D.MemInfo[i].IsFixupWord; }
			if(Fixup) fprintf(disfile," fixupWord");
			fprintf(disfile,"  %s\n",D.Comment);
			for(CPU6DISASSEMBLER::PARMS const *I=&D.Inline[0]; I->Width; I++) {
				uint16_t b=D.PC;  bool Fixup=0;
				switch(I->Width) {
					case 1: { Fixup|=bool(D.MemInfo[D.PC].IsFixupWord);
						uint8_t V=D.Fetch1(); fprintf(disfile,"\tDB $%02x\t;%04x %02x  %s",V,b,V,I->Comment); } break;
					case 2: { Fixup|=bool(D.MemInfo[D.PC].IsFixupWord|D.MemInfo[D.PC+1].IsFixupWord);
						uint16_t V=D.Fetch2(); fprintf(disfile,"\tDW L_%04X\t;%04x %02x %02x  %s",V,b,V>>8,V&0xff,I->Comment); } break;
					default: __debugbreak();
					}
				if(Fixup) fprintf(disfile," FixupWord");
				fprintf(disfile,"\n");
				}
			}
		else {
			D.PC+=1;
			unsigned __int8 c=Mem.ReadU1(b);  char S1[8]; if((c&0x7f)>=0x20) { S1[0]=' '; S1[1]=';'; S1[2]=c&0x7f; S1[3]=0; } else S1[0]=0;
			fprintf(disfile,"\tDB %02X%s\t;%04X %02X",c,S1,b,c);
			if(D.MemInfo[b].IsFixupWord) fprintf(disfile," Fixupword");
			fprintf(disfile,"\n");
			}
		if(D.MemInfo[b].IsFlowbreak) fprintf(disfile,"\n");
		}

	fclose(disfile);
	}

//*****************************************************

static void Save(char const * const fname, unsigned const Fmt) {
	FILE *F=NULL; if (fopen_s(&F,fname,"wt")) { printf("Save: open error ");  perror(fname);  return; }
	unsigned const llen=0x20;
	for(unsigned a=0; a<0x1000000; a+=llen) {
		for(unsigned i=0; i<llen; i++) if(Mem.M[a+i]!=0x42) {
			char s[72];
			switch(Fmt) {
				case 0: if(a<0x10000) { // Intel hex
					unsigned sumchk=llen+(a>>8)+a;
					for(unsigned i=0; i<llen; i+=1) {  unsigned int d=Mem.ReadU1(a+i);
						sumchk+=d;  sprintf_s(&s[2*i],4,"%02X",d);  }
					fprintf(F,":%02X%04X00%s%02X\n",llen,a,&s,(0-sumchk)&0xff);
					} break;
				case 1: if(a<0x10000) { // S19
					unsigned sumchk=3+llen+(a>>8)+a;
					for(unsigned i=0; i<llen; i+=1) { unsigned d=Mem.ReadU1(a+i);
						sumchk+=d;  sprintf_s(&s[2*i],4,"%02X",d);  }
					fprintf(F,"S1%02X%04X%s%02X\n",3+llen,a,&s,(~sumchk)&0xff);  } break;
				case 2: { // S28
					unsigned sumchk=4+llen+(a>>16)+(a>>8)+a;
					for(unsigned i=0; i<llen; i+=1) { unsigned d=Mem.ReadU1(a+i);
						sumchk+=d;  sprintf_s(&s[2*i],4,"%02X",d);  }
					fprintf(F,"S2%02X%06X%s%02X\n",4+llen,a,&s,(~sumchk)&0xff); } break;
				default: __debugbreak(); }
			break; }
		}
	switch(Fmt) {
		case 0: fprintf(F,":00000001FF\n");  break;
		case 1:	fprintf(F,"S9030000FC"); break;
		case 2: fprintf(F,"S804000000FB");  break;
		default: __debugbreak(); }
	fclose(F);
	}


static char const * FnGetExtension(char const * const Fn) {
	char const *p=Fn;
	while(*p) p++; // move to end
	char const *pe=p;
	while(p>Fn) if(*--p=='.') return p+1;
	return pe;
	}

static void CcdpSave(char const *FileName, unsigned __int32 AdrLo, unsigned __int32 AdrHi) {
	int Len=AdrHi-AdrLo+1;  if(Len<=0) {
		printf("CcdpSave: Length (%ud) < 0 \n"); return; }
	if(AdrLo!=0x200) {
		printf("CcdpSave: start adr !=$200 \n"); }
	int FF=0; // file handle
	errno_t rc=_sopen_s(&FF,FileName,_O_CREAT|_O_BINARY|_O_WRONLY,_SH_DENYWR,_S_IREAD | _S_IWRITE);  if(rc) {
		perror(NULL);  printf("CcdpSave: open failed with %d on %s \n",rc,FileName); return; }
	int r2=_write(FF,Mem.M+AdrLo,Len); if(r2!=Len) {
		perror(NULL); printf("CcdpSave: write incomplete\n"); }
	printf("%d bytes saved at 0x%x \n",Len,AdrLo);
	_close(FF);
	}

static void LoaderBin(char const *FName, unsigned __int32 Offset) {
	int FF=0; // file handle
	errno_t rc=_sopen_s(&FF,FName,_O_BINARY|_O_RDONLY,_SH_DENYWR,_S_IREAD | _S_IWRITE);  if(rc) {
		perror(NULL);  printf("LoaderBin: open failed with %d on %s \n",rc,FName); return; }
	//	__int64 FLen=_filelengthi64(F);
	//	VDataSize=_lseeki64(F,__int64(0)-sizeof(Foot),SEEK_END);
	int r2=_read(FF,Mem.M+Offset,Mem.maxmem+1-Offset); //if(r2!=sizeof(Foot)) {
	//perror(NULL); printf("VHD: footer read failed\n"); }
	printf("%d bytes loaded at 0x%x \n",r2,Offset);
	_close(FF);
	}

struct LOADER { // Intel hex or Motorola hex or ca65_listing or ophis.bin loader
	unsigned __int32 Lo, Hi;  // min & max load addr
	void Init(void) { Lo=0xffffffff; Hi=0; }
	void Write(unsigned __int32 Adr, unsigned __int8 Data) {
		Mem.M[Adr]=Data;  if(Lo>Adr) Lo=Adr;  if(Hi<Adr) Hi=Adr; }
	void Load(char const *fname) {
		char const *FnExt=FnGetExtension(fname);
		if(!_stricmp(FnExt,"bin")) { // like ophis.bin
			LoaderBin(fname,0x8000);  }
		else { // a text file
			FILE *F=NULL;  if(fopen_s(&F,fname,"rtS")) { printf("loader: open error ");  perror(fname);  return; }
			while(F && !feof(F)) {
				char s[200];  s[0]=0; fgets(s,sizeof(s),F);
				if(!memcmp(s,"ca65 V",6)) { // ca65 listing?
					while(!feof(F)) { fgets(s,sizeof(s),F);
						if(s[0]=='0' && s[6]==' ') { // address is OK
							unsigned a=0; sscanf_s(&s[0],"%6x",&a);
							for(char *h=&s[11]; h<=&s[20]; h+=3) {
								if((*h&0xdf)=='X') a++;
								else if((*h>='0'&&*h<='9')||(*h>='A'&&*h<='F')||(*h>='a'&&*h<='f')) {
									unsigned int v=0x42; sscanf_s(h,"%2x",&v);  Write(a++,v);  } } } } break; }
				switch(s[0]) {
					case 0: break;
					case ':': {
						unsigned l,a; sscanf_s(&s[1],"%2x%4x",&l,&a);
						for(unsigned i=9; i<l*2+8; i+=2) {
							unsigned d; sscanf_s(&s[i],"%2x",&d);  Write(a++,d); }
						} break;
					case 'S': { switch(s[1]) {
							case '1': { unsigned l,a; sscanf_s(&s[2],"%2x%4x",&l,&a);
								for(unsigned i=0; i<l-2; i++) {
									unsigned d; sscanf_s(&s[8+2*i],"%2x",&d);  Write(a++,d);  } } break;
							case '9': break;
							case '2': { unsigned l,a; sscanf_s(&s[2],"%2x%6x",&l,&a);
								for(unsigned i=0; i<(l-3); i++) {
									unsigned d; sscanf_s(&s[10+2*i],"%2x",&d);  Write(a++,d);  } } break;
							case '8': break;
							case '3': { unsigned l,a; sscanf_s(&s[2],"%2x%8x",&l,&a);
								for(unsigned i=0; i<(l-4); i++) {
									unsigned d; sscanf_s(&s[12+2*i],"%2x",&d);  Write(a++,d);  } } break;
							case '7': break;
							case '5': break;
							default:  printf("loader: what's line %s",&s); }
						} break;
					default: printf("loader: what's line: %s\n",&s);
					}
				}
			fclose(F);
			}
		}
	} ;

//*****************************************************
struct PARSE {
	char *Ptr;
	char *Line;
	PARSE(char *S) { Ptr=Line=S;
		for(char *P=Line; *P; P++) if(*P==0x0a) { *P=0; break; }  // kill newline
		}
	bool AtEol(void) { return *Ptr==0; }
	void SkipWhite(void) {  while(1) { char c=*Ptr;  if(c>' ' || c==0) break;  Ptr++; } }
	char GetC(void) { char v=*Ptr;  if(v) Ptr++;  return v; }
	unsigned __int32 GetU(void) {
		unsigned __int32 v=0;  unsigned Cnt=0;
		while(1) { char const c=*Ptr;
			if(c>='0' && c<='9') v=(v*10)+(c-'0');
			else { if(Cnt==0) printf(" no digits found ");  return v; }
			Ptr++;  Cnt++;
			}
		}
	unsigned __int32 GetHex(void) {
		unsigned __int32 v=0;  unsigned Cnt=0;
		while(1) { char const c=*Ptr;
			if(c>='0' && c<='9') v=(v<<4)+(c-'0');
			else if(c>='A' && c<='F') v=(v<<4)+(c-'A'+10);
			else if(c>='a' && c<='f') v=(v<<4)+(c-'a'+10);
			else { if(Cnt==0) printf(" no digits found ");  return v; }
			Ptr++; Cnt++; }
		}
	} ;

int main( int argc, char *argv[] ) {
//	unsigned __int32 h,l;

	puts("CPU6S " __DATE__ " " __TIME__);

	Mem.Init();
	ConsoleIo.Reset();

	// printf("argc=%d\narg[1]='%s'\narg[2]='%s'\narg[3]='%s'\n",argc,argv[1],argv[2],argv[3]);
	LOADER Loader;  Loader.Init();
	Loader.Load(argc>1 ? argv[1] : "FSub.lst");

	CPU6 C;
	C.CCDP_Init();
	for(int i=0; i<8; i++) {  C.Files[i]=NULL;
		if(i+2<argc) { // printf("  device %d is %s \n",i,argv[i+2]);
			C.Files[i]=new VHD(argv[i+2]);  } }

	CBIN_LOAD *CBin_Load=0;
	trace(C);

	FILE *txtfile=NULL;
	for(bool quit=0; !quit; ) { // gets()
		putchar('.');  char line[80]; line[0]=0;  char *r0=fgets(line,sizeof(line),stdin); // scanf_s("%s",line,sizeof(line));
		// printf("\ncommand line was '%s'\n",line);
		PARSE P(r0);  P.SkipWhite();  char const cmd=P.GetC(); P.SkipWhite();
		switch(toupper(cmd)) {

			case '$': { // load Centurion CBIN file
				if(CBin_Load) delete(CBin_Load); CBin_Load=new CBIN_LOAD(P.Ptr,0x200,&C);
				printf("Entry=0x%x \n",CBin_Load->entry_addr); } break;
			case 'L': // load hex or CA65 listing file
				Loader.Load(P.Ptr);  break;
			case 'V': { // load binary file
				unsigned Base=P.GetHex();  P.SkipWhite();  char const *Fn=P.Ptr;
				printf("V: Offset=0x%x Fn=\"%s\" \n",Base,Fn);
				LoaderBin(Fn,Base); } break;

			case '!': // CCDP execute file save
				CcdpSave(P.Ptr,Loader.Lo,Loader.Hi); break;
			case 'S': // Intel hex file save
				Save(P.Ptr,0);  break;
			case '1': // S19 hex file save
				Save(P.Ptr,1);  break;
			case '2': // S28 hex file save
				Save(P.Ptr,2);  break;

			case 'D': { // memory dump
				unsigned l=P.GetHex();
				P.GetC(); // eat the comma
				unsigned h=P.GetHex();
				dump(l,h);  } break;
			case 'E': { // display execution history
				for(unsigned i=_countof(C.exhist); i;) printf(" %06X",C.exhist[(C.InstCount-(--i))&(_countof(C.exhist)-1)]);
				printf("\n");
				} break;
			case 'T': { // execute & trace instructions
				unsigned n=P.GetU();
				C.Stop.u=0;
				for(; n!=0; n--) { C.Execute(1); trace(C);  if(C.Stop.u || _kbhit()) break; }
				} break;
			case 'U': { // execute n instructions without display
				unsigned n=P.GetU();
				C.Stop.u=0;  C.Execute(n);
				puts("");  trace(C);
				} break;
			case 'O': { // execute over a subroutine call
				// ??? needs work
				C.Stop.u=0;
				C.bkpt1=C.PC+3;
				C.Execute(10000000);
				C.bkpt1=0;
				puts("");  trace(C);
				} break;
			case 'M': { // load PC
				C.PC=P.GetHex();  } break;
			case 'G': { // Go: execute many instructions
				C.Stop.u=0;  int ch=-2;
				while(true) {
					C.Execute(500);
					if(ConsoleIo.Polling()) Sleep(5);
					if(C.PC==C.bkpt) { puts(" breakpoint "); break; }
					if(C.Stop.u) { printf(" stopped 0x%x ",C.Stop.u); break; }
					if(_kbhit()) {
						int i=_getch();
						if(i==0x02) break;
						ConsoleIo.SetInKey(i);
						}
					if(txtfile!=NULL && !ConsoleIo.InKeyAvailable) {
						ch=(ConsoleIo.OutState==CONSOLEIO::Abort)?EOF:fgetc(txtfile);
						switch(ch) {
							case 0x0d: break;
							case 0x0a: ConsoleIo.SetInKey(0x0d); break;
							case EOF: fclose(txtfile); txtfile=NULL;  puts(" eof ");  ConsoleIo.Reset();  break;
							default: ConsoleIo.SetInKey(ch);
							}
						}
					}
				puts("");  trace(C);
				} break;
			case '@': { // play a text file into the console
				if(fopen_s(&txtfile,P.Ptr,"rt")) {
					printf("main: open error: %s",P.Ptr); perror(NULL); }
				ConsoleIo.Reset();
				} break;
			case 'R': { // display CPU registers
				trace(C);  } break;
			case 'P': { // display CPU state
				trace(C);  C.DisplayState();  } break;
			case 'B': { // set execution breakpoint
				C.bkpt=P.GetHex(); } break;
			case 'A': { // set write breakpoint
				C.BreakWriteAddr=P.GetHex();  } break;
			case 'C': { // insert a char into console input
				ConsoleIo.SetInKey(P.GetC());  } break;
			case 'H': { // insert a char (in hex) into console input
				ConsoleIo.SetInKey(P.GetHex());  } break;
			case 'Q': { // quit this program
				quit=1;  } break;
			case 'W': { // write to real memory
				unsigned Adr=P.GetHex();
				while(true) {
					printf("%06x ",Adr);  int d=0x100;  scanf_s("%x",&d);  if(d==0x100) break;
					Mem.WriteU1(Adr,d); Adr++;
					printf("\n");
					}
				} break;
			case 'X': { // start performance data collection
				if(C.Perf) delete C.Perf;  C.Perf=new PERF1;  } break;
			case 'Y': { // write performance data summary
				if(C.Perf) { C.Perf->Rpt("perf.txt");  C.Perf->Rpt2("perf2.txt"); }  } break;
			case 'Z': { // reset CPU
				C.Reset();  } break;
			case 'F': { // ANSI console terminal test
				printf("FFFF"); for(int i=0; i<10; i++) { printf("%d\0x1b[%d;%dH %d ",i,i,i,i); }
				  for(int i=5; i<10; i++) { _putch(0x1b); _putch('['); _putch(i+'0'); _putch(';'); _putch(i+'0');
					  _putch('H'); _putch(i+'A'); }
				} break;
			case '#': { // run disassembly
				DisasmToFile("CPU6S.ADR","disasmf.asm",CBin_Load);  } break;
			case '%': { // dump memory to file
				unsigned l=P.GetHex();  P.SkipWhite();  unsigned h=P.GetHex(); P.SkipWhite();
				DumpToFile(P.Ptr,l,h);
				} break;
			//case 'I': { // simulate interrupt
			//	xirq(0xfffe,C.CC.I,1);  } break;
			//case 'N': { // simulate interrupt
			//	xirq(0xfffa,1     ,1);  } break;
		//	case '(': // extension
		//		switch(toupper(P.GetC())) {
		//			case 'V': // Centurion disk load

			default : printf("I don't know command '%c'\n"
				"$fn  : Load Centurion CBIN file\n"
				"Lfn  : Load hex or CA65 listing file\n"
				"V hex_offset fn : Load binary file at offset\n"
				"\n"
				"!fn  : binary executable file save for CCDP\n"
				"Sfn  : Save Intel hex file\n"
				"1fn  : Save S19 hex file\n"
				"2fn  : Save S28 hex file\n"
				"\n"
				"Dl,h : Dump memory l to h (in hex)\n"
				"E    : show Execution history\n"
				"Tn   : Trace n instructions\n"
				"Un   : execute n instructions\n"
				"O    : Step Over (JSR) instruction\n"
				"Mx   : load PC\n"
				"G    : Go full speed (^B to stop)\n"
				"@fn  : Play a text file into console\n"
				"R    : CPU Register display\n"
				"P    : CPU state display\n"
				"Bx   : Breakpoint move to addr x (in hex)\n"
				"Ax   : Break on write to addr x (in hex)\n"
				"Cc   : Character input to console\n"
				"Hx   : Character (in hex) input to console\n"
				"Q    : Quit simulator\n"
				"Wx   : Write memory at x (in hex)\n"
				"X    : Initialize program performance collection\n"
				"Y    : Write performance data summary to perf.txt & perf2.txt\n"
				"Z    : CPU reset\n"
				"#    : Disassemble to file DISASMF.ASM\n"
				"F    : ANSI console terminal test\n"
				"#    : run disassembly (load entry points from CPU6S.ADR, write to disasmf.asm\n"
				"%xlo,xhi,fn : dump memory data from xlo to xhi to file\n"
			//	"I    : do IRQ\n"
			//	"N    : do NMI\n"
			//	(V    : Centurion disk load\n"
				,cmd);
			}
		}

	if(CBin_Load) { delete(CBin_Load); CBin_Load=0; }
	for(int i=0; i<8; i++)
		if(C.Files[i]) delete C.Files[i];

	return(0);
	}

//int _tmain(int argc, _TCHAR* argv[]) {
//	return 0; }

