/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\OwnButton.prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( OBTN_CREATE );
HB_FUNC_EXTERN( _OWNBUTTONCREATE );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( VALTYPE );
HB_FUNC( OBTN_SHAPE );
HB_FUNC( OBTN_COLOR );
HB_FUNC( OBTN_FONT );
HB_FUNC( OBTN_RELEASE );
HB_FUNC_EXTERN( GETDLGITEM );
HB_FUNC_EXTERN( GETFOCUS );
HB_FUNC_EXTERN( SETFOCUS );
HB_FUNC_EXTERN( GETNEXTDLGTABITEM );
HB_FUNC_EXTERN( DESTROYWINDOW );
HB_FUNC( OBTN_HANDLE );
HB_FUNC( OBTN_POS );
HB_FUNC_EXTERN( GETWINDOWRECT );
HB_FUNC_EXTERN( SCREENTOCLIENT );
HB_FUNC_EXTERN( PCOUNT );
HB_FUNC_EXTERN( MOVEWINDOW );
HB_FUNC( OBTN_VISIBLE );
HB_FUNC_EXTERN( SHOWWINDOW );
HB_FUNC_EXTERN( HIDEWINDOW );
HB_FUNC_EXTERN( ISWINDOWVISIBLE );
HB_FUNC( OBTN_ENABLE );
HB_FUNC_EXTERN( ENABLEWINDOW );
HB_FUNC_EXTERN( DISABLEWINDOW );
HB_FUNC_EXTERN( ISWINDOWENABLED );
HB_FUNC( OBTN_FOCUS );
HB_FUNC( OBTN_CAPTION );
HB_FUNC_EXTERN( SETWINDOWTEXT );
HB_FUNC_EXTERN( GETWINDOWTEXT );
HB_FUNC_EXTERN( HB_HHASKEY );
HB_FUNC_EXTERN( REDRAWWINDOW );
HB_FUNC( OBTN_DRAW );
HB_FUNC_EXTERN( GETFORMNAMEBYINDEX );
HB_FUNC_EXTERN( GETFORMINDEXBYHANDLE );
HB_FUNC_EXTERN( _OWNBUTTONDRAW );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_EXTERN( __DBGENTRY );
HB_FUNC_INITSTATICS();
HB_FUNC_INITLINES();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_OWNBUTTON )
{ "OBTN_CREATE", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_CREATE )}, NULL },
{ "_OWNBUTTONCREATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( _OWNBUTTONCREATE )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "VALTYPE", {HB_FS_PUBLIC}, {HB_FUNCNAME( VALTYPE )}, NULL },
{ "OBTN_SHAPE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_SHAPE )}, NULL },
{ "OBTN_COLOR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_COLOR )}, NULL },
{ "OBTN_FONT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_FONT )}, NULL },
{ "OBTN_RELEASE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_RELEASE )}, NULL },
{ "GETDLGITEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETDLGITEM )}, NULL },
{ "GETFOCUS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFOCUS )}, NULL },
{ "SETFOCUS", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETFOCUS )}, NULL },
{ "GETNEXTDLGTABITEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETNEXTDLGTABITEM )}, NULL },
{ "DESTROYWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( DESTROYWINDOW )}, NULL },
{ "OBTN_HANDLE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_HANDLE )}, NULL },
{ "OBTN_POS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_POS )}, NULL },
{ "GETWINDOWRECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETWINDOWRECT )}, NULL },
{ "SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SCREENTOCLIENT )}, NULL },
{ "PCOUNT", {HB_FS_PUBLIC}, {HB_FUNCNAME( PCOUNT )}, NULL },
{ "MOVEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( MOVEWINDOW )}, NULL },
{ "OBTN_VISIBLE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_VISIBLE )}, NULL },
{ "SHOWWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( SHOWWINDOW )}, NULL },
{ "HIDEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( HIDEWINDOW )}, NULL },
{ "ISWINDOWVISIBLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ISWINDOWVISIBLE )}, NULL },
{ "OBTN_ENABLE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_ENABLE )}, NULL },
{ "ENABLEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( ENABLEWINDOW )}, NULL },
{ "DISABLEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( DISABLEWINDOW )}, NULL },
{ "ISWINDOWENABLED", {HB_FS_PUBLIC}, {HB_FUNCNAME( ISWINDOWENABLED )}, NULL },
{ "OBTN_FOCUS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_FOCUS )}, NULL },
{ "OBTN_CAPTION", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_CAPTION )}, NULL },
{ "SETWINDOWTEXT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWTEXT )}, NULL },
{ "GETWINDOWTEXT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETWINDOWTEXT )}, NULL },
{ "HB_HHASKEY", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_HHASKEY )}, NULL },
{ "REDRAWWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( REDRAWWINDOW )}, NULL },
{ "OBTN_DRAW", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( OBTN_DRAW )}, NULL },
{ "GETFORMNAMEBYINDEX", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMNAMEBYINDEX )}, NULL },
{ "GETFORMINDEXBYHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMINDEXBYHANDLE )}, NULL },
{ "_OWNBUTTONDRAW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _OWNBUTTONDRAW )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "__DBGENTRY", {HB_FS_PUBLIC}, {HB_FUNCNAME( __DBGENTRY )}, NULL },
{ "(_INITSTATICS00003)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL },
{ "(_INITLINES)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITLINES}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_OWNBUTTON, "Prg\\OwnButton.prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_OWNBUTTON
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_OWNBUTTON )
   #include "hbiniseg.h"
#endif

HB_FUNC( OBTN_CREATE )
{
	static const HB_BYTE pcode[] =
	{
		13,22,13,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,67,
		82,69,65,84,69,0,37,1,0,67,70,79,82,77,
		0,37,2,0,78,73,68,0,37,3,0,67,67,65,
		80,84,73,79,78,0,37,4,0,78,82,79,87,0,
		37,5,0,78,67,79,76,0,37,6,0,78,87,73,
		68,84,72,0,37,7,0,78,72,69,73,71,72,84,
		0,37,8,0,76,69,78,65,66,76,69,68,0,37,
		9,0,76,86,73,83,73,66,76,69,0,37,10,0,
		76,84,65,66,83,84,79,80,0,37,11,0,78,83,
		72,65,80,69,0,37,12,0,65,67,79,76,79,82,
		0,37,13,0,65,70,79,78,84,0,36,77,0,37,
		14,0,78,72,66,85,84,84,79,78,0,176,1,0,
		176,2,0,95,1,12,1,95,2,95,3,95,4,95,
		5,95,6,95,7,95,8,95,9,95,10,12,10,80,
		14,36,79,0,37,15,0,78,84,88,67,79,76,79,
		82,69,0,121,80,15,36,80,0,37,16,0,78,70,
		82,67,79,76,79,82,69,0,121,80,16,36,81,0,
		37,17,0,78,66,75,67,79,76,79,82,69,49,0,
		97,255,255,255,0,80,17,36,82,0,37,18,0,78,
		66,75,67,79,76,79,82,69,50,0,97,255,255,255,
		0,80,18,36,83,0,37,19,0,78,71,82,65,68,
		68,73,82,69,0,121,80,19,36,84,0,37,20,0,
		78,84,88,67,79,76,79,82,68,0,97,128,128,128,
		0,80,20,36,85,0,37,21,0,78,70,82,67,79,
		76,79,82,68,0,97,128,128,128,0,80,21,36,86,
		0,37,22,0,78,66,75,67,79,76,79,82,68,49,
		0,97,224,224,224,0,80,22,36,87,0,37,23,0,
		78,66,75,67,79,76,79,82,68,50,0,97,224,224,
		224,0,80,23,36,88,0,37,24,0,78,71,82,65,
		68,68,73,82,68,0,121,80,24,36,89,0,37,25,
		0,78,84,88,67,79,76,79,82,70,0,121,80,25,
		36,90,0,37,26,0,78,70,82,67,79,76,79,82,
		70,0,121,80,26,36,91,0,37,27,0,78,66,75,
		67,79,76,79,82,70,49,0,97,255,255,255,0,80,
		27,36,92,0,37,28,0,78,66,75,67,79,76,79,
		82,70,50,0,97,255,255,255,0,80,28,36,93,0,
		37,29,0,78,71,82,65,68,68,73,82,70,0,121,
		80,29,36,95,0,37,30,0,67,70,79,78,84,78,
		65,77,69,0,98,3,0,93,86,1,1,80,30,36,
		96,0,37,31,0,78,70,79,78,84,83,73,90,69,
		0,98,3,0,93,87,1,1,80,31,36,97,0,37,
		32,0,76,66,79,76,68,0,9,80,32,36,98,0,
		37,33,0,76,73,84,65,76,73,67,0,9,80,33,
		36,99,0,37,34,0,76,85,78,68,69,82,76,73,
		78,69,0,9,80,34,36,100,0,37,35,0,76,83,
		84,82,73,75,69,79,85,84,0,9,80,35,36,102,
		0,95,14,121,69,29,147,3,36,103,0,176,4,0,
		95,12,12,1,106,2,65,0,8,29,77,2,36,104,
		0,176,4,0,95,12,122,1,12,1,106,2,65,0,
		8,29,171,0,36,105,0,176,4,0,95,12,122,1,
		122,1,12,1,106,2,78,0,8,28,13,36,106,0,
		95,12,122,1,122,1,80,15,36,108,0,176,4,0,
		95,12,122,1,92,2,1,12,1,106,2,78,0,8,
		28,14,36,109,0,95,12,122,1,92,2,1,80,16,
		36,111,0,176,4,0,95,12,122,1,92,3,1,12,
		1,106,2,78,0,8,28,14,36,112,0,95,12,122,
		1,92,3,1,80,17,36,114,0,176,4,0,95,12,
		122,1,92,4,1,12,1,106,2,78,0,8,28,14,
		36,115,0,95,12,122,1,92,4,1,80,18,36,117,
		0,176,4,0,95,12,122,1,92,5,1,12,1,106,
		2,78,0,8,28,14,36,118,0,95,12,122,1,92,
		5,1,80,19,36,122,0,176,4,0,95,12,92,2,
		1,12,1,106,2,65,0,8,29,181,0,36,123,0,
		176,4,0,95,12,92,2,1,122,1,12,1,106,2,
		78,0,8,28,14,36,124,0,95,12,92,2,1,122,
		1,80,20,36,126,0,176,4,0,95,12,92,2,1,
		92,2,1,12,1,106,2,78,0,8,28,15,36,127,
		0,95,12,92,2,1,92,2,1,80,21,36,129,0,
		176,4,0,95,12,92,2,1,92,3,1,12,1,106,
		2,78,0,8,28,15,36,130,0,95,12,92,2,1,
		92,3,1,80,22,36,132,0,176,4,0,95,12,92,
		2,1,92,4,1,12,1,106,2,78,0,8,28,15,
		36,133,0,95,12,92,2,1,92,4,1,80,23,36,
		135,0,176,4,0,95,12,92,2,1,92,5,1,12,
		1,106,2,78,0,8,28,15,36,136,0,95,12,92,
		2,1,92,5,1,80,24,36,140,0,176,4,0,95,
		12,92,3,1,12,1,106,2,65,0,8,29,181,0,
		36,141,0,176,4,0,95,12,92,3,1,122,1,12,
		1,106,2,78,0,8,28,14,36,142,0,95,12,92,
		3,1,122,1,80,25,36,144,0,176,4,0,95,12,
		92,3,1,92,2,1,12,1,106,2,78,0,8,28,
		15,36,145,0,95,12,92,3,1,92,2,1,80,26,
		36,147,0,176,4,0,95,12,92,3,1,92,3,1,
		12,1,106,2,78,0,8,28,15,36,148,0,95,12,
		92,3,1,92,3,1,80,27,36,150,0,176,4,0,
		95,12,92,3,1,92,4,1,12,1,106,2,78,0,
		8,28,15,36,151,0,95,12,92,3,1,92,4,1,
		80,28,36,153,0,176,4,0,95,12,92,3,1,92,
		5,1,12,1,106,2,78,0,8,28,15,36,154,0,
		95,12,92,3,1,92,5,1,80,29,36,159,0,176,
		4,0,95,13,12,1,106,2,65,0,8,29,181,0,
		36,160,0,176,4,0,95,13,122,1,12,1,106,2,
		67,0,8,28,11,36,161,0,95,13,122,1,80,30,
		36,163,0,176,4,0,95,13,92,2,1,12,1,106,
		2,78,0,8,28,12,36,164,0,95,13,92,2,1,
		80,31,36,166,0,176,4,0,95,13,92,3,1,12,
		1,106,2,76,0,8,28,12,36,167,0,95,13,92,
		3,1,80,32,36,169,0,176,4,0,95,13,92,4,
		1,12,1,106,2,76,0,8,28,12,36,170,0,95,
		13,92,4,1,80,33,36,172,0,176,4,0,95,13,
		92,5,1,12,1,106,2,76,0,8,28,12,36,173,
		0,95,13,92,5,1,80,34,36,175,0,176,4,0,
		95,13,92,6,1,12,1,106,2,76,0,8,28,12,
		36,176,0,95,13,92,6,1,80,35,36,180,0,176,
		5,0,95,1,95,2,176,4,0,95,11,12,1,106,
		2,78,0,8,28,6,95,11,25,3,121,20,3,36,
		181,0,176,6,0,95,1,95,2,95,15,95,16,95,
		17,95,18,95,19,4,5,0,95,20,95,21,95,22,
		95,23,95,24,4,5,0,95,25,95,26,95,27,95,
		28,95,29,4,5,0,4,3,0,20,3,36,182,0,
		176,7,0,95,1,95,2,95,30,95,31,95,32,95,
		33,95,34,95,35,4,6,0,20,3,36,185,0,95,
		14,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_RELEASE )
{
	static const HB_BYTE pcode[] =
	{
		13,2,2,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,82,
		69,76,69,65,83,69,0,37,1,0,67,70,79,82,
		77,0,37,2,0,78,73,68,0,36,189,0,37,3,
		0,78,72,80,65,82,69,78,84,0,176,2,0,95,
		1,12,1,80,3,36,190,0,37,4,0,78,72,66,
		85,84,84,79,78,0,176,9,0,95,3,95,2,12,
		2,80,4,36,192,0,176,10,0,12,0,95,4,8,
		28,20,36,193,0,176,11,0,176,12,0,95,3,95,
		4,9,12,3,20,1,36,196,0,176,13,0,176,9,
		0,95,3,95,2,12,2,20,1,36,198,0,100,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_HANDLE )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,72,
		65,78,68,76,69,0,37,1,0,67,70,79,82,77,
		0,37,2,0,78,73,68,0,36,203,0,176,9,0,
		176,2,0,95,1,12,1,95,2,20,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_POS )
{
	static const HB_BYTE pcode[] =
	{
		13,3,6,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,80,
		79,83,0,37,1,0,67,70,79,82,77,0,37,2,
		0,78,73,68,0,37,3,0,78,82,79,87,0,37,
		4,0,78,67,79,76,0,37,5,0,78,87,73,68,
		84,72,0,37,6,0,78,72,69,73,71,72,84,0,
		36,207,0,37,7,0,78,72,80,65,82,69,78,84,
		0,176,2,0,95,1,12,1,80,7,36,208,0,37,
		8,0,78,72,66,85,84,84,79,78,0,176,9,0,
		95,7,95,2,12,2,80,8,36,209,0,37,9,0,
		65,80,79,83,0,121,121,121,121,4,4,0,80,9,
		36,211,0,176,16,0,95,8,95,9,20,2,36,212,
		0,95,9,92,3,1,95,9,122,1,49,95,9,92,
		3,2,36,213,0,95,9,92,4,1,95,9,92,2,
		1,49,95,9,92,4,2,36,214,0,176,17,0,95,
		7,95,9,122,148,95,9,92,2,148,20,3,36,216,
		0,176,18,0,12,0,92,3,35,28,29,36,217,0,
		95,9,92,2,1,95,9,122,1,95,9,92,3,1,
		95,9,92,4,1,4,4,0,110,7,36,220,0,176,
		4,0,95,3,12,1,106,2,78,0,69,28,12,36,
		221,0,95,9,92,2,1,80,3,36,224,0,176,4,
		0,95,4,12,1,106,2,78,0,69,28,11,36,225,
		0,95,9,122,1,80,4,36,228,0,176,4,0,95,
		5,12,1,106,2,78,0,69,28,12,36,229,0,95,
		9,92,3,1,80,5,36,232,0,176,4,0,95,6,
		12,1,106,2,78,0,69,28,12,36,233,0,95,9,
		92,4,1,80,6,36,236,0,176,19,0,95,8,95,
		4,95,3,95,5,95,6,120,20,6,36,239,0,176,
		15,0,95,1,95,2,20,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_VISIBLE )
{
	static const HB_BYTE pcode[] =
	{
		13,1,3,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,86,
		73,83,73,66,76,69,0,37,1,0,67,70,79,82,
		77,0,37,2,0,78,73,68,0,37,3,0,76,86,
		73,83,73,66,76,69,0,36,243,0,37,4,0,78,
		72,66,85,84,84,79,78,0,176,9,0,176,2,0,
		95,1,12,1,95,2,12,2,80,4,36,245,0,176,
		4,0,95,3,12,1,106,2,76,0,8,28,67,36,
		246,0,95,3,28,14,36,247,0,176,21,0,95,4,
		20,1,25,48,36,250,0,176,10,0,12,0,95,4,
		8,28,25,36,251,0,176,11,0,176,12,0,176,2,
		0,95,1,12,1,95,4,9,12,3,20,1,36,254,
		0,176,22,0,95,4,20,1,36,6,1,176,23,0,
		95,4,20,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_ENABLE )
{
	static const HB_BYTE pcode[] =
	{
		13,1,3,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,69,
		78,65,66,76,69,0,37,1,0,67,70,79,82,77,
		0,37,2,0,78,73,68,0,37,3,0,76,69,78,
		65,66,76,69,0,36,10,1,37,4,0,78,72,66,
		85,84,84,79,78,0,176,9,0,176,2,0,95,1,
		12,1,95,2,12,2,80,4,36,13,1,176,4,0,
		95,3,12,1,106,2,76,0,8,28,67,36,14,1,
		95,3,28,14,36,15,1,176,25,0,95,4,20,1,
		25,48,36,17,1,176,10,0,12,0,95,4,8,28,
		25,36,18,1,176,11,0,176,12,0,176,2,0,95,
		1,12,1,95,4,9,12,3,20,1,36,21,1,176,
		26,0,95,4,20,1,36,25,1,176,27,0,95,4,
		20,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_FOCUS )
{
	static const HB_BYTE pcode[] =
	{
		13,1,3,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,70,
		79,67,85,83,0,37,1,0,67,70,79,82,77,0,
		37,2,0,78,73,68,0,37,3,0,76,70,79,67,
		85,83,0,36,29,1,37,4,0,78,72,66,85,84,
		84,79,78,0,176,9,0,176,2,0,95,1,12,1,
		95,2,12,2,80,4,36,31,1,176,4,0,95,3,
		12,1,106,2,76,0,8,28,25,95,3,28,21,176,
		27,0,95,4,12,1,28,12,36,32,1,176,11,0,
		95,4,20,1,36,35,1,176,10,0,12,0,95,4,
		8,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_CAPTION )
{
	static const HB_BYTE pcode[] =
	{
		13,1,3,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,67,
		65,80,84,73,79,78,0,37,1,0,67,70,79,82,
		77,0,37,2,0,78,73,68,0,37,3,0,67,67,
		65,80,84,73,79,78,0,36,39,1,37,4,0,78,
		72,66,85,84,84,79,78,0,176,9,0,176,2,0,
		95,1,12,1,95,2,12,2,80,4,36,41,1,176,
		4,0,95,3,12,1,106,2,67,0,8,28,14,36,
		42,1,176,30,0,95,4,95,3,20,2,36,45,1,
		176,31,0,95,4,20,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_FONT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,4,116,40,0,51,80,114,103,92,79,119,110,
		66,117,116,116,111,110,46,112,114,103,58,79,66,84,
		78,95,70,79,78,84,0,37,1,0,67,70,79,82,
		77,0,37,2,0,78,73,68,0,37,3,0,65,70,
		79,78,84,0,37,4,0,76,82,69,68,82,65,87,
		0,36,49,1,118,0,1,0,72,70,79,78,84,0,
		36,51,1,176,4,0,95,3,12,1,106,2,65,0,
		8,29,102,1,36,52,1,176,32,0,103,1,0,95,
		1,12,2,29,27,1,36,53,1,176,32,0,103,1,
		0,95,1,1,95,2,12,2,29,245,0,36,54,1,
		176,4,0,95,3,122,1,12,1,106,2,67,0,8,
		28,20,36,55,1,95,3,122,1,103,1,0,95,1,
		1,95,2,1,122,2,36,57,1,176,4,0,95,3,
		92,2,1,12,1,106,2,78,0,8,28,22,36,58,
		1,95,3,92,2,1,103,1,0,95,1,1,95,2,
		1,92,2,2,36,60,1,176,4,0,95,3,92,3,
		1,12,1,106,2,76,0,8,28,22,36,61,1,95,
		3,92,3,1,103,1,0,95,1,1,95,2,1,92,
		3,2,36,63,1,176,4,0,95,3,92,4,1,12,
		1,106,2,76,0,8,28,22,36,64,1,95,3,92,
		4,1,103,1,0,95,1,1,95,2,1,92,4,2,
		36,66,1,176,4,0,95,3,92,5,1,12,1,106,
		2,76,0,8,28,22,36,67,1,95,3,92,5,1,
		103,1,0,95,1,1,95,2,1,92,5,2,36,69,
		1,176,4,0,95,3,92,6,1,12,1,106,2,76,
		0,8,28,62,36,70,1,95,3,92,6,1,103,1,
		0,95,1,1,95,2,1,92,6,2,36,71,1,25,
		37,36,73,1,95,3,103,1,0,95,1,1,95,2,
		2,36,74,1,25,18,36,76,1,95,2,95,3,177,
		1,0,103,1,0,95,1,2,36,79,1,176,4,0,
		95,4,12,1,106,2,76,0,8,28,28,95,4,28,
		24,36,80,1,176,33,0,176,9,0,176,2,0,95,
		1,12,1,95,2,12,2,20,1,36,84,1,176,32,
		0,103,1,0,95,1,12,2,28,28,176,32,0,103,
		1,0,95,1,1,95,2,12,2,28,13,103,1,0,
		95,1,1,95,2,1,25,3,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_SHAPE )
{
	static const HB_BYTE pcode[] =
	{
		13,0,4,116,40,0,51,80,114,103,92,79,119,110,
		66,117,116,116,111,110,46,112,114,103,58,79,66,84,
		78,95,83,72,65,80,69,0,37,1,0,67,70,79,
		82,77,0,37,2,0,78,73,68,0,37,3,0,78,
		83,72,65,80,69,0,37,4,0,76,82,69,68,82,
		65,87,0,36,88,1,118,0,2,0,72,83,72,65,
		80,69,0,36,90,1,176,4,0,95,3,12,1,106,
		2,78,0,8,28,97,36,91,1,176,32,0,103,2,
		0,95,1,12,2,28,18,36,92,1,95,3,103,2,
		0,95,1,1,95,2,2,25,18,36,94,1,95,2,
		95,3,177,1,0,103,2,0,95,1,2,36,97,1,
		176,4,0,95,4,12,1,106,2,76,0,8,28,77,
		95,4,28,73,36,98,1,176,33,0,176,9,0,176,
		2,0,95,1,12,1,95,2,12,2,20,1,36,99,
		1,25,46,36,101,1,176,32,0,103,2,0,95,1,
		12,2,28,31,176,32,0,103,2,0,95,1,1,95,
		2,12,2,28,16,36,102,1,103,2,0,95,1,1,
		95,2,1,80,3,36,106,1,95,3,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_COLOR )
{
	static const HB_BYTE pcode[] =
	{
		13,0,4,116,40,0,51,80,114,103,92,79,119,110,
		66,117,116,116,111,110,46,112,114,103,58,79,66,84,
		78,95,67,79,76,79,82,0,37,1,0,67,70,79,
		82,77,0,37,2,0,78,73,68,0,37,3,0,65,
		67,79,76,79,82,0,37,4,0,76,82,69,68,82,
		65,87,0,36,110,1,118,0,3,0,72,67,79,76,
		79,82,0,36,112,1,176,4,0,95,3,12,1,106,
		2,65,0,8,29,126,3,36,113,1,176,32,0,103,
		3,0,95,1,12,2,29,51,3,36,114,1,176,32,
		0,103,3,0,95,1,1,95,2,12,2,29,13,3,
		36,115,1,176,4,0,95,3,122,1,12,1,106,2,
		65,0,8,29,230,0,36,116,1,176,4,0,95,3,
		122,1,122,1,12,1,106,2,78,0,8,28,24,36,
		117,1,95,3,122,1,122,1,103,3,0,95,1,1,
		95,2,1,122,1,122,2,36,119,1,176,4,0,95,
		3,122,1,92,2,1,12,1,106,2,78,0,8,28,
		26,36,120,1,95,3,122,1,92,2,1,103,3,0,
		95,1,1,95,2,1,122,1,92,2,2,36,122,1,
		176,4,0,95,3,122,1,92,3,1,12,1,106,2,
		78,0,8,28,26,36,123,1,95,3,122,1,92,3,
		1,103,3,0,95,1,1,95,2,1,122,1,92,3,
		2,36,125,1,176,4,0,95,3,122,1,92,4,1,
		12,1,106,2,78,0,8,28,26,36,126,1,95,3,
		122,1,92,4,1,103,3,0,95,1,1,95,2,1,
		122,1,92,4,2,36,128,1,176,4,0,95,3,122,
		1,92,5,1,12,1,106,2,78,0,8,28,26,36,
		129,1,95,3,122,1,92,5,1,103,3,0,95,1,
		1,95,2,1,122,1,92,5,2,36,133,1,176,4,
		0,95,3,92,2,1,12,1,106,2,65,0,8,29,
		245,0,36,134,1,176,4,0,95,3,92,2,1,122,
		1,12,1,106,2,78,0,8,28,26,36,135,1,95,
		3,92,2,1,122,1,103,3,0,95,1,1,95,2,
		1,92,2,1,122,2,36,137,1,176,4,0,95,3,
		92,2,1,92,2,1,12,1,106,2,78,0,8,28,
		28,36,138,1,95,3,92,2,1,92,2,1,103,3,
		0,95,1,1,95,2,1,92,2,1,92,2,2,36,
		140,1,176,4,0,95,3,92,2,1,92,3,1,12,
		1,106,2,78,0,8,28,28,36,141,1,95,3,92,
		2,1,92,3,1,103,3,0,95,1,1,95,2,1,
		92,2,1,92,3,2,36,143,1,176,4,0,95,3,
		92,2,1,92,4,1,12,1,106,2,78,0,8,28,
		28,36,144,1,95,3,92,2,1,92,4,1,103,3,
		0,95,1,1,95,2,1,92,2,1,92,4,2,36,
		146,1,176,4,0,95,3,92,2,1,92,5,1,12,
		1,106,2,78,0,8,28,28,36,147,1,95,3,92,
		2,1,92,5,1,103,3,0,95,1,1,95,2,1,
		92,2,1,92,5,2,36,151,1,176,4,0,95,3,
		92,3,1,12,1,106,2,65,0,8,29,29,1,36,
		152,1,176,4,0,95,3,92,3,1,122,1,12,1,
		106,2,78,0,8,28,26,36,153,1,95,3,92,3,
		1,122,1,103,3,0,95,1,1,95,2,1,92,3,
		1,122,2,36,155,1,176,4,0,95,3,92,3,1,
		92,2,1,12,1,106,2,78,0,8,28,28,36,156,
		1,95,3,92,3,1,92,2,1,103,3,0,95,1,
		1,95,2,1,92,3,1,92,2,2,36,158,1,176,
		4,0,95,3,92,3,1,92,3,1,12,1,106,2,
		78,0,8,28,28,36,159,1,95,3,92,3,1,92,
		3,1,103,3,0,95,1,1,95,2,1,92,3,1,
		92,3,2,36,161,1,176,4,0,95,3,92,3,1,
		92,4,1,12,1,106,2,78,0,8,28,28,36,162,
		1,95,3,92,3,1,92,4,1,103,3,0,95,1,
		1,95,2,1,92,3,1,92,4,2,36,164,1,176,
		4,0,95,3,92,3,1,92,5,1,12,1,106,2,
		78,0,8,28,68,36,165,1,95,3,92,3,1,92,
		5,1,103,3,0,95,1,1,95,2,1,92,3,1,
		92,5,2,36,167,1,25,37,36,169,1,95,3,103,
		3,0,95,1,1,95,2,2,36,170,1,25,18,36,
		172,1,95,2,95,3,177,1,0,103,3,0,95,1,
		2,36,175,1,176,4,0,95,4,12,1,106,2,76,
		0,8,28,28,95,4,28,24,36,176,1,176,33,0,
		176,9,0,176,2,0,95,1,12,1,95,2,12,2,
		20,1,36,180,1,176,32,0,103,3,0,95,1,12,
		2,28,28,176,32,0,103,3,0,95,1,1,95,2,
		12,2,28,13,103,3,0,95,1,1,95,2,1,25,
		3,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( OBTN_DRAW )
{
	static const HB_BYTE pcode[] =
	{
		13,4,3,51,80,114,103,92,79,119,110,66,117,116,
		116,111,110,46,112,114,103,58,79,66,84,78,95,68,
		82,65,87,0,37,1,0,78,72,80,65,82,69,78,
		84,0,37,2,0,78,73,68,0,37,3,0,78,68,
		82,65,87,73,84,69,77,83,84,82,85,67,84,0,
		36,184,1,37,4,0,67,70,79,82,77,0,176,35,
		0,176,36,0,95,1,12,1,12,1,80,4,36,185,
		1,37,5,0,78,83,72,65,80,69,0,176,5,0,
		95,4,95,2,12,2,80,5,36,186,1,37,6,0,
		65,67,79,76,79,82,0,176,6,0,95,4,95,2,
		12,2,80,6,36,187,1,37,7,0,65,70,79,78,
		84,0,176,7,0,95,4,95,2,12,2,80,7,36,
		190,1,176,37,0,95,3,95,5,95,6,122,1,95,
		6,92,2,1,95,6,92,3,1,95,7,20,6,36,
		192,1,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,40,0,3,0,116,40,0,51,80,114,103,92,79,
		119,110,66,117,116,116,111,110,46,112,114,103,58,40,
		95,73,78,73,84,83,84,65,84,73,67,83,41,0,
		177,0,0,82,1,0,177,0,0,82,2,0,177,0,
		0,82,3,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITLINES()
{
	static const HB_BYTE pcode[] =
	{
		51,80,114,103,92,79,119,110,66,117,116,116,111,110,
		46,112,114,103,58,40,95,73,78,73,84,76,73,78,
		69,83,41,0,106,18,80,114,103,92,79,119,110,66,
		117,116,116,111,110,46,112,114,103,0,92,72,106,48,
		160,255,191,223,183,109,220,182,113,219,134,219,182,113,
		98,83,136,123,51,51,147,232,76,64,228,38,162,137,
		38,250,182,237,150,17,93,110,68,191,109,227,182,141,
		219,182,150,17,79,1,4,3,0,4,1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

#line 452 "Prg\\OwnButton.prg"

#include "SET_COMPILE_HMG_UNICODE.ch"
#include "HMG_UNICODE.h"
#include <windows.h>
#include <commctrl.h>
#include <math.h>
#include "hbapi.h"

static HBRUSH CreateGradientBrush();


       //                 1         2    3          4       5       6         7          8           9           10
       //_OwnButtonCreate(nHParent, nID, cCaption, [nRow], [nCol], [nWidth], [nHeight], [lEnabled], [lVisible], [lTabStop])
HB_FUNC( _OWNBUTTONCREATE )
{
  DWORD  dwStyle = BS_OWNERDRAW | WS_CHILD;
  HWND hButton;

  if (! hb_parldef(8, 1))
    dwStyle |= WS_DISABLED;
  if (hb_parldef(9, 1))
    dwStyle |= WS_VISIBLE;
  if (hb_parldef(10, 1))
    dwStyle |= WS_CLIPSIBLINGS;

  hButton = CreateWindowEx(0,
                           (LPCTSTR) WC_BUTTON,
                           (LPCTSTR) HMG_parc(3),
                           dwStyle,
                           hb_parnidef(5, 0),
                           hb_parnidef(4, 0),
                           hb_parnidef(6, 0),
                           hb_parnidef(7, 0),
                           (HWND) HMG_parnl(1),
                           (HMENU) HMG_parnl(2),
                           GetModuleHandle(NULL),
                           NULL);
                           
  //SetClassLong( (HWND) hButton  , GCL_HCURSOR, ( LONG ) LoadCursor( 0 , IDC_HAND ) );
  
  SetClassLongPtr( (HWND) hButton  , GCLP_HCURSOR, ( LONG ) LoadCursor( 0 , IDC_HAND ) );  

  //SetClassLong( ( HWND ) hButton , -12 , ( LONG ) LoadCursor( NULL, IDC_HAND ) );                           
                           
  HMG_retnl((LONG_PTR) hButton);

}


       //               1                2       3        4        5        6
       //_OwnButtonDraw(nDRAWITEMSTRUCT, nShape, aColor1, aColor2, aColor3, aFont)
HB_FUNC( _OWNBUTTONDRAW )
{
  DRAWITEMSTRUCT *pDIS = (DRAWITEMSTRUCT *) HMG_parnl(1);

  INT nShape = (INT) hb_parni(2);

  TCHAR *FontName  = (TCHAR *) HMG_parvc(6, 1);
  INT   nFontSize  = (INT)     hb_parvni(6, 2);
  INT   nBold      = hb_parvl(6, 3) ? FW_BOLD : FW_NORMAL;
  INT   nItalic    = hb_parvl(6, 4) ? 1 : 0;
  INT   nUnderline = hb_parvl(6, 5) ? 1 : 0;
  INT   nStrikeOut = hb_parvl(6, 6) ? 1 : 0;

  COLORREF TextColor;
  COLORREF FrameColor;
  COLORREF FrameColor2 = 0xFFFFFFFF;
  COLORREF BackColor1;
  COLORREF BackColor2;
  INT      nGradDir;
  HBRUSH   hBrush;
  HBRUSH   hBrush2;
  HBRUSH   hBrushOld;
  HPEN     hPen;
  HPEN     hPenOld;
  HFONT    hFont;
  HFONT    hFontOld;
  RECT     rcText;
  INT      nTextH;

  INT nTextLen = GetWindowTextLength(pDIS->hwndItem) + 1;
  TCHAR *Text  = (TCHAR *) hb_xgrab(nTextLen * sizeof(TCHAR));
  GetWindowText(pDIS->hwndItem, Text, nTextLen);

  if (pDIS->itemState & ODS_DISABLED)
  {
    TextColor  = (COLORREF) hb_parvni(4, 1);
    FrameColor = (COLORREF) hb_parvni(4, 2);
    BackColor1 = (COLORREF) hb_parvni(4, 3);
    BackColor2 = (COLORREF) hb_parvni(4, 4);
    nGradDir   = (INT)      hb_parvni(4, 5);
  }
  else if (pDIS->itemState & ODS_FOCUS)
  {
    TextColor   = (COLORREF) hb_parvni(5, 1);
    FrameColor  = (COLORREF) hb_parvni(5, 2); // Pablo
    FrameColor2 = (COLORREF) hb_parvni(5, 2);
    BackColor1  = (COLORREF) hb_parvni(5, 3);
    BackColor2  = (COLORREF) hb_parvni(5, 4);
    nGradDir    = (INT)      hb_parvni(5, 5);
  }
  else
  {
    TextColor  = (COLORREF) hb_parvni(3, 1);
    FrameColor = (COLORREF) hb_parvni(3, 2);
    BackColor1 = (COLORREF) hb_parvni(3, 3);
    BackColor2 = (COLORREF) hb_parvni(3, 4);
    nGradDir   = (INT)      hb_parvni(3, 5);
  }

  hBrush = CreateGradientBrush(pDIS->hDC, (pDIS->rcItem.right  - pDIS->rcItem.left), (pDIS->rcItem.bottom - pDIS->rcItem.top), nShape, nGradDir, BackColor1, BackColor2);
  hPen   = CreatePen(PS_INSIDEFRAME, 1, FrameColor);
  hFont  = CreateFont(-MulDiv(nFontSize, GetDeviceCaps(pDIS->hDC, LOGPIXELSY), 72), 0, 0, 0, nBold, nItalic, nUnderline, nStrikeOut, DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, FontName);

  hBrushOld = SelectObject(pDIS->hDC, hBrush);
  hPenOld   = SelectObject(pDIS->hDC, hPen);
  hFontOld  = SelectObject(pDIS->hDC, hFont);

  if (nShape >= 0)
  {
    if (FrameColor2 <= 0xFFFFFF)
    {
      hBrush2 = CreateSolidBrush(FrameColor2);
      SelectObject(pDIS->hDC, hBrush2);

      RoundRect(pDIS->hDC, pDIS->rcItem.left, pDIS->rcItem.top, pDIS->rcItem.right, pDIS->rcItem.bottom, nShape, nShape);

      SelectObject(pDIS->hDC, hBrush);
      DeleteObject(hBrush2);

      RoundRect(pDIS->hDC, pDIS->rcItem.left + 2, pDIS->rcItem.top + 2, pDIS->rcItem.right - 2, pDIS->rcItem.bottom - 2, nShape - 2, nShape - 2);
    }
    else
      RoundRect(pDIS->hDC, pDIS->rcItem.left, pDIS->rcItem.top, pDIS->rcItem.right, pDIS->rcItem.bottom, nShape, nShape);
  }
  else
  {
    if (FrameColor2 <= 0xFFFFFF)
    {
      hBrush2 = CreateSolidBrush(FrameColor2);
      SelectObject(pDIS->hDC, hBrush2);

      Ellipse(pDIS->hDC, pDIS->rcItem.left, pDIS->rcItem.top, pDIS->rcItem.right, pDIS->rcItem.bottom);

      SelectObject(pDIS->hDC, hBrush);
      DeleteObject(hBrush2);

      Ellipse(pDIS->hDC, pDIS->rcItem.left + 2, pDIS->rcItem.top + 2, pDIS->rcItem.right - 2, pDIS->rcItem.bottom - 2);
    }
    else
      Ellipse(pDIS->hDC, pDIS->rcItem.left, pDIS->rcItem.top, pDIS->rcItem.right, pDIS->rcItem.bottom);
  }

  rcText.left   = pDIS->rcItem.left;
  rcText.top    = pDIS->rcItem.top ;
  rcText.right  = pDIS->rcItem.right;
  rcText.bottom = pDIS->rcItem.bottom;

  SetTextColor(pDIS->hDC, TextColor);
  SetBkMode(pDIS->hDC, TRANSPARENT);

  nTextH = DrawText(pDIS->hDC, Text, -1, &rcText, DT_CALCRECT | DT_NOCLIP);

  rcText.left  = pDIS->rcItem.left  + 3;
  rcText.right = pDIS->rcItem.right - 3;

  if (nTextH < (pDIS->rcItem.bottom - pDIS->rcItem.top - 2 * 3))
  {
    rcText.top    = (pDIS->rcItem.bottom - pDIS->rcItem.top - nTextH) / 2;
    rcText.bottom = rcText.top + nTextH;
  }
  else
  {
    rcText.top    = pDIS->rcItem.top    + 3;
    rcText.bottom = pDIS->rcItem.bottom - 3;
  }

  DrawText(pDIS->hDC, Text, -1, &rcText, DT_CENTER);

  SelectObject(pDIS->hDC, hBrushOld);
  SelectObject(pDIS->hDC, hPenOld);
  SelectObject(pDIS->hDC, hFontOld);

  DeleteObject(hBrush);
  DeleteObject(hPen);
  DeleteObject(hFont);
  hb_xfree(Text);
}


static HBRUSH CreateGradientBrush(HDC hDC, INT nWidth, INT nHeight, INT nShape, INT nDirection, COLORREF Color1, COLORREF Color2)
{
  INT     R1, G1, B1, R2, G2, B2;
  HDC     hDCComp;
  HBITMAP hBitmap;
  HBRUSH  hBrush, hBrushOld, hBrushPat;
  HPEN    hPen, hPenOld;
  RECT    rcF;
  INT     nCount;
  INT     i;

  R1 = GetRValue(Color1);
  G1 = GetGValue(Color1);
  B1 = GetBValue(Color1);
  R2 = GetRValue(Color2);
  G2 = GetGValue(Color2);
  B2 = GetBValue(Color2);

  hDCComp = CreateCompatibleDC(hDC);
  hBitmap = CreateCompatibleBitmap(hDC, nWidth, nHeight);
  SelectObject(hDCComp, hBitmap);

  if (nDirection == 0)
  {
    rcF.left   = 0;
    rcF.right  = nWidth;
    rcF.bottom = nHeight;

    for (i = 0; i < nHeight; i++)
    { 
      rcF.top = i;
      hBrush  = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nHeight), G1 + (i * (G2 - G1) / nHeight), B1 + (i * (B2 - B1) / nHeight)));
      FillRect(hDCComp, &rcF, hBrush);
      DeleteObject(hBrush);
    }
  }
  else if (nDirection == 1)
  {
    rcF.top    = 0;
    rcF.right  = nWidth;
    rcF.bottom = nHeight;

    for (i = 0; i < nWidth; i++)
    { 
      rcF.left = i;
      hBrush   = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nWidth), G1 + (i * (G2 - G1) / nWidth), B1 + (i * (B2 - B1) / nWidth)));
      FillRect(hDCComp, &rcF, hBrush);
      DeleteObject(hBrush);
    }
  }
  else
  {
    rcF.left   = 0;
    rcF.top    = 0;
    rcF.right  = nWidth;
    rcF.bottom = nHeight;
    nCount     = ceil(((nWidth > nHeight) ? nHeight : nWidth) / 2);

    if (nShape >= 0)
    {
      for (i = 0; i < nCount; i++)
      { 
        hBrush = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nCount), G1 + (i * (G2 - G1) / nCount), B1 + (i * (B2 - B1) / nCount)));
        FillRect(hDCComp, &rcF, hBrush);
        DeleteObject(hBrush);

        ++rcF.left;
        ++rcF.top;
        --rcF.right;
        --rcF.bottom;
      }
    }
    else
    {
      for (i = 0; i < nCount; i++)
      { 
        hBrush = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nCount), G1 + (i * (G2 - G1) / nCount), B1 + (i * (B2 - B1) / nCount)));
        hPen   = CreatePen(PS_NULL, 0, 0);

        hBrushOld = SelectObject(hDCComp, hBrush);
        hPenOld   = SelectObject(hDCComp, hPen);

        Ellipse(hDCComp, rcF.left, rcF.top, rcF.right, rcF.bottom);

        SelectObject(hDCComp, hBrushOld);
        SelectObject(hDCComp, hPenOld);

        DeleteObject(hBrush);
        DeleteObject(hPen);

        ++rcF.left;
        ++rcF.top;
        --rcF.right;
        --rcF.bottom;
      }
    }
  }

  hBrushPat = CreatePatternBrush(hBitmap);

  DeleteDC(hDCComp);
  DeleteObject(hBitmap);

  return hBrushPat;
}

