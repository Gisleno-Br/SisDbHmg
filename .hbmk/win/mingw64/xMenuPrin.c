/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\xMenuPrin.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XMENUMAIN );
HB_FUNC_EXTERN( ACLONE );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( XPAINTMENU );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( HIDEWINDOW );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC_EXTERN( HMG_CHANGEWINDOWSTYLE );
HB_FUNC_EXTERN( SHOWSCROLLBAR );
HB_FUNC_EXTERN( _SHOWWINDOW );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC( EVENTPRIN1 );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( YAVISO );
HB_FUNC( XOPSELPOS );
HB_FUNC_EXTERN( XLIMPSUB );
HB_FUNC_EXTERN( XFECHAMEN );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( CRIEJANTIP );
HB_FUNC_EXTERN( XDISPHINT );
HB_FUNC_EXTERN( XDISPUPTAM );
HB_FUNC_EXTERN( XHIDEHINT );
HB_FUNC_EXTERN( TRACKMOUSEEVENT );
HB_FUNC_EXTERN( ISWINDOWVISIBLE );
HB_FUNC_EXTERN( INT );
HB_FUNC( SCROLLMENU );
HB_FUNC( XRESTMENU );
HB_FUNC_EXTERN( RIGHT );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC( XDROPDOWN );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC( XCLOSEMPRIN );
HB_FUNC_EXTERN( DOFINDWIN );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC_EXTERN( REMOVEHANDLER );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC_EXTERN( AEVAL );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_EXTERN( SETPROPERTY );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( DOMETHOD );
HB_FUNC_EXTERN( _HMG_PRINTER_SETVSCROLLVALUE );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC_EXTERN( GETSCROLLPOS );
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XMENUPRIN )
{ "XMENUMAIN", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XMENUMAIN )}, NULL },
{ "ACLONE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ACLONE )}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "NCOLTAMMENU", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XPAINTMENU", {HB_FS_PUBLIC}, {HB_FUNCNAME( XPAINTMENU )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "ACORSUB1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HIDEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( HIDEWINDOW )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "HMG_CHANGEWINDOWSTYLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CHANGEWINDOWSTYLE )}, NULL },
{ "SHOWSCROLLBAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SHOWSCROLLBAR )}, NULL },
{ "_SHOWWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _SHOWWINDOW )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "EVENTPRIN1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTPRIN1 )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "YAVISO", {HB_FS_PUBLIC}, {HB_FUNCNAME( YAVISO )}, NULL },
{ "EVAL", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "XOPSELPOS", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XOPSELPOS )}, NULL },
{ "CURSORHAND", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XLIMPSUB", {HB_FS_PUBLIC}, {HB_FUNCNAME( XLIMPSUB )}, NULL },
{ "XFECHAMEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( XFECHAMEN )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "NITEMSUBHEIGHT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "CRIEJANTIP", {HB_FS_PUBLIC}, {HB_FUNCNAME( CRIEJANTIP )}, NULL },
{ "XDISPHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPHINT )}, NULL },
{ "XDISPUPTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPUPTAM )}, NULL },
{ "XHIDEHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XHIDEHINT )}, NULL },
{ "TRACKMOUSEEVENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( TRACKMOUSEEVENT )}, NULL },
{ "LTRACKING42", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HEIGHTDROP", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ISWINDOWVISIBLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ISWINDOWVISIBLE )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "NTAMSUBMENUCONSULTA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SCROLLMENU", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( SCROLLMENU )}, NULL },
{ "NCONTITENS", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XRESTMENU", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRESTMENU )}, NULL },
{ "COPBAK", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "RIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( RIGHT )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "XDROPDOWN", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDROPDOWN )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "YP1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "NSEL1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CULTOPCAOSEL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XCLOSEMPRIN", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCLOSEMPRIN )}, NULL },
{ "DOFINDWIN", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOFINDWIN )}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "REMOVEHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( REMOVEHANDLER )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "NOPSEL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "AEVAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( AEVAL )}, NULL },
{ "AITENS", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "SETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETPROPERTY )}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "COPABERTO", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "DOMETHOD", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOMETHOD )}, NULL },
{ "_HMG_PRINTER_SETVSCROLLVALUE", {HB_FS_PUBLIC}, {HB_FUNCNAME( _HMG_PRINTER_SETVSCROLLVALUE )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "GETSCROLLPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETSCROLLPOS )}, NULL },
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00017)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_XMENUPRIN, "Prg\\xMenuPrin.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_XMENUPRIN
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_XMENUPRIN )
   #include "hbiniseg.h"
#endif

HB_FUNC( XMENUMAIN )
{
	static const HB_BYTE pcode[] =
	{
		13,0,4,116,75,0,36,67,0,176,1,0,95,3,
		12,1,82,1,0,36,69,0,4,0,0,80,4,36,
		74,0,176,2,0,20,0,176,3,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,106,14,77,101,110,80,114,105,110,99,105,112,
		97,108,49,0,95,2,95,1,109,4,0,93,8,2,
		120,120,120,120,120,9,106,1,0,100,100,100,100,100,
		100,93,255,0,93,255,0,93,255,0,4,3,0,90,
		55,176,5,0,176,6,0,98,7,0,93,60,1,1,
		106,5,78,97,109,101,0,12,2,103,1,0,103,2,
		0,103,3,0,103,4,0,103,5,0,103,6,0,103,
		7,0,9,103,8,0,103,9,0,12,11,6,9,9,
		9,100,120,100,100,100,100,100,100,100,93,9,2,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,100,9,20,56,36,75,0,176,8,
		0,20,0,36,82,0,176,2,0,20,0,176,3,0,
		106,11,74,97,110,77,101,110,117,83,117,98,0,106,
		5,84,115,117,98,0,93,200,0,93,200,0,109,4,
		0,93,244,1,120,120,120,120,120,9,106,1,0,100,
		100,100,100,100,100,109,9,0,90,43,176,5,0,176,
		6,0,98,7,0,93,60,1,1,106,5,78,97,109,
		101,0,12,2,103,10,0,103,11,0,103,13,0,103,
		14,0,121,121,9,120,12,9,6,9,9,9,100,120,
		100,100,100,100,100,100,100,93,152,58,100,100,100,100,
		100,100,100,9,100,100,100,9,100,100,100,100,100,100,
		100,100,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,120,20,56,36,83,0,
		176,8,0,20,0,36,90,0,176,10,0,176,11,0,
		106,11,74,97,110,77,101,110,117,83,117,98,0,12,
		1,20,1,36,95,0,176,12,0,98,7,0,92,60,
		1,176,13,0,176,14,0,106,11,69,118,101,110,116,
		80,114,105,110,49,0,12,1,12,1,12,2,121,5,
		28,23,36,96,0,176,15,0,106,11,69,118,101,110,
		116,80,114,105,110,49,0,20,1,36,99,0,176,16,
		0,176,6,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,106,7,72,97,
		110,100,108,101,0,12,2,122,100,100,120,120,20,6,
		36,100,0,176,16,0,176,6,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,106,7,72,97,110,100,108,101,0,12,2,100,97,
		0,0,2,0,120,120,20,5,36,102,0,176,16,0,
		176,6,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,106,7,72,97,110,
		100,108,101,0,12,2,93,128,0,100,120,120,20,5,
		36,109,0,176,16,0,176,6,0,106,11,74,97,110,
		77,101,110,117,83,117,98,0,106,7,72,97,110,100,
		108,101,0,12,2,122,100,100,120,120,20,6,36,113,
		0,176,17,0,176,11,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,12,
		1,121,9,20,3,36,114,0,176,17,0,176,11,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,12,1,122,9,20,3,36,117,
		0,176,18,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,20,1,36,120,
		0,176,19,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,20,1,36,124,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTPRIN1 )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,75,0,36,131,0,106,1,0,80,5,
		36,132,0,121,80,6,36,133,0,121,80,7,36,135,
		0,121,80,8,36,136,0,106,1,0,80,9,36,138,
		0,121,80,10,36,140,0,121,80,11,36,141,0,121,
		80,12,36,148,0,95,1,176,6,0,106,11,74,97,
		110,77,101,110,117,83,117,98,0,106,7,72,65,78,
		68,76,69,0,12,2,8,29,154,3,103,5,0,121,
		15,29,146,3,36,151,0,95,2,93,163,2,8,28,
		44,103,15,0,28,39,36,153,0,121,82,11,0,36,
		154,0,121,82,13,0,36,155,0,176,19,0,95,1,
		20,1,36,156,0,176,21,0,95,1,93,0,127,20,
		2,36,162,0,95,2,93,1,2,8,29,119,0,36,
		165,0,103,11,0,176,22,0,103,10,0,12,1,34,
		28,101,36,167,0,103,10,0,103,11,0,1,92,3,
		1,31,50,36,168,0,176,21,0,95,1,93,0,127,
		20,2,36,169,0,176,23,0,106,20,79,112,231,227,
		111,32,73,110,100,105,115,112,111,110,105,118,101,108,
		46,0,9,20,2,36,170,0,7,36,173,0,103,10,
		0,103,11,0,1,92,4,1,100,69,28,21,36,174,
		0,48,24,0,103,10,0,103,11,0,1,92,4,1,
		112,0,73,36,184,0,95,2,93,0,2,8,29,209,
		2,36,189,0,103,11,0,121,15,28,43,36,190,0,
		103,11,0,176,25,0,106,11,74,97,110,77,101,110,
		117,83,117,98,0,121,176,22,0,103,10,0,12,1,
		121,12,4,5,28,6,36,191,0,7,36,195,0,176,
		25,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,121,176,22,0,103,10,0,12,1,121,12,4,82,
		11,0,36,196,0,176,6,0,106,11,74,97,110,77,
		101,110,117,83,117,98,0,106,11,86,115,99,114,111,
		108,108,66,97,114,0,106,6,86,97,108,117,101,0,
		12,3,66,80,10,36,200,0,103,11,0,176,22,0,
		103,10,0,12,1,34,28,34,36,201,0,103,10,0,
		103,11,0,1,92,3,1,31,19,36,202,0,176,21,
		0,95,1,93,0,127,20,2,36,203,0,7,36,209,
		0,176,21,0,95,1,109,26,0,20,2,36,212,0,
		103,13,0,121,15,28,53,36,213,0,176,27,0,106,
		11,74,97,110,77,101,110,117,83,117,98,0,104,13,
		0,104,11,0,121,20,4,36,215,0,103,12,0,28,
		17,36,216,0,176,28,0,20,0,36,217,0,9,82,
		12,0,36,224,0,103,11,0,121,15,28,13,36,225,
		0,103,11,0,82,13,0,25,6,36,227,0,7,36,
		231,0,103,11,0,121,15,29,184,0,36,233,0,176,
		29,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,95,10,103,11,0,122,49,109,30,0,65,72,121,
		109,4,0,109,30,0,122,49,120,20,6,36,237,0,
		103,11,0,176,22,0,103,10,0,12,1,34,28,123,
		176,22,0,103,10,0,103,11,0,1,12,1,92,5,
		16,28,106,36,239,0,103,10,0,103,11,0,1,92,
		5,1,28,91,36,241,0,121,80,11,36,242,0,121,
		80,12,36,244,0,176,31,0,96,12,0,96,11,0,
		20,2,36,247,0,48,24,0,103,10,0,103,11,0,
		1,92,6,1,95,11,176,6,0,106,11,74,97,110,
		77,101,110,117,83,117,98,0,106,4,67,111,108,0,
		12,2,109,4,0,72,92,10,72,112,2,73,36,250,
		0,120,82,12,0,36,251,0,7,36,6,1,176,32,
		0,176,13,0,103,10,0,103,11,0,1,92,2,1,
		12,1,12,1,32,204,0,36,8,1,176,13,0,103,
		10,0,103,11,0,1,92,2,1,12,1,80,9,36,
		10,1,121,80,10,36,13,1,176,31,0,96,6,0,
		96,10,0,20,2,36,15,1,176,33,0,106,8,87,
		105,110,95,77,115,103,0,12,1,31,62,36,16,1,
		176,34,0,95,10,176,6,0,106,11,74,97,110,77,
		101,110,117,83,117,98,0,106,6,87,105,100,116,104,
		0,12,2,92,15,49,176,13,0,95,9,12,1,100,
		101,0,0,0,0,0,0,224,63,10,1,20,5,25,
		71,36,18,1,176,35,0,95,9,95,10,92,15,72,
		176,6,0,106,11,74,97,110,77,101,110,117,83,117,
		98,0,106,4,67,111,108,0,12,2,176,6,0,106,
		11,74,97,110,77,101,110,117,83,117,98,0,106,6,
		87,105,100,116,104,0,12,2,72,92,10,72,20,3,
		36,21,1,176,36,0,95,9,20,1,25,10,36,25,
		1,176,37,0,20,0,36,30,1,176,38,0,95,1,
		12,1,82,15,0,36,45,1,95,1,176,6,0,106,
		18,87,105,110,95,77,101,110,117,80,114,105,110,99,
		105,112,97,108,0,106,7,72,97,110,100,108,101,0,
		12,2,8,29,133,9,36,48,1,95,2,93,163,2,
		8,29,46,1,109,39,0,29,40,1,36,52,1,176,
		32,0,176,13,0,103,4,0,12,1,12,1,28,53,
		36,54,1,103,3,0,121,15,29,192,0,36,55,1,
		121,82,2,0,36,56,1,121,82,3,0,36,57,1,
		176,19,0,95,1,20,1,36,58,1,176,21,0,95,
		1,93,0,127,20,2,26,152,0,36,64,1,103,3,
		0,121,15,28,69,103,3,0,103,2,0,69,28,60,
		36,65,1,121,82,2,0,36,66,1,176,27,0,106,
		18,87,105,110,95,77,101,110,117,80,114,105,110,99,
		105,112,97,108,0,104,3,0,104,2,0,103,2,0,
		103,5,0,16,28,7,109,40,0,25,3,121,122,49,
		20,4,36,70,1,176,33,0,106,8,87,105,110,95,
		77,115,103,0,12,1,28,50,36,71,1,176,41,0,
		176,11,0,106,8,87,105,110,95,77,115,103,0,12,
		1,12,1,28,25,36,72,1,176,10,0,176,11,0,
		106,8,87,105,110,95,77,115,103,0,12,1,20,1,
		36,78,1,7,36,84,1,9,83,39,0,36,87,1,
		176,33,0,106,8,87,105,110,95,77,115,103,0,12,
		1,28,50,36,88,1,176,41,0,176,11,0,106,8,
		87,105,110,95,77,115,103,0,12,1,12,1,28,25,
		36,89,1,176,10,0,176,11,0,106,8,87,105,110,
		95,77,115,103,0,12,1,20,1,36,98,1,95,2,
		93,1,2,8,29,124,3,36,100,1,176,6,0,106,
		18,87,105,110,95,77,101,110,117,80,114,105,110,99,
		105,112,97,108,0,106,11,86,115,99,114,111,108,108,
		66,97,114,0,106,6,86,97,108,117,101,0,12,3,
		66,80,10,36,104,1,103,7,0,29,10,1,36,106,
		1,103,17,0,121,8,28,20,36,107,1,176,42,0,
		109,43,0,109,30,0,18,12,1,82,17,0,36,112,
		1,103,2,0,93,232,3,5,28,108,36,117,1,176,
		44,0,92,2,176,6,0,106,11,74,97,110,77,101,
		110,117,83,117,98,0,106,7,72,97,110,100,108,101,
		0,12,2,104,16,0,104,17,0,109,45,0,104,9,
		0,104,8,0,103,5,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,7,72,101,105,103,104,116,0,12,2,20,10,
		36,118,1,7,36,123,1,103,2,0,93,208,7,5,
		28,107,36,126,1,176,44,0,122,176,6,0,106,11,
		74,97,110,77,101,110,117,83,117,98,0,106,7,72,
		97,110,100,108,101,0,12,2,104,16,0,104,17,0,
		109,45,0,104,9,0,104,8,0,103,5,0,106,18,
		87,105,110,95,77,101,110,117,80,114,105,110,99,105,
		112,97,108,0,176,6,0,106,11,74,97,110,77,101,
		110,117,83,117,98,0,106,7,72,101,105,103,104,116,
		0,12,2,20,10,36,127,1,7,36,134,1,103,5,
		0,121,15,28,26,36,135,1,176,46,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,95,1,9,20,
		3,36,140,1,103,4,0,83,47,0,36,142,1,176,
		32,0,176,13,0,103,4,0,12,1,12,1,31,111,
		36,144,1,176,12,0,103,1,0,89,38,0,1,0,
		0,0,176,48,0,95,1,122,1,176,22,0,95,1,
		122,1,12,1,92,2,49,12,2,176,13,0,103,4,
		0,12,1,8,6,12,2,80,8,36,146,1,95,8,
		121,15,28,51,36,147,1,176,29,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,95,10,95,8,122,49,109,30,0,65,72,121,
		109,4,0,109,30,0,122,49,120,20,6,36,153,1,
		103,3,0,121,15,28,39,36,154,1,176,27,0,106,
		18,87,105,110,95,77,101,110,117,80,114,105,110,99,
		105,112,97,108,0,104,3,0,104,2,0,103,6,0,
		20,4,36,157,1,103,2,0,121,8,31,16,103,2,
		0,176,22,0,103,1,0,12,1,15,28,6,36,158,
		1,7,36,161,1,176,13,0,176,48,0,103,1,0,
		103,2,0,1,122,1,176,22,0,103,1,0,103,2,
		0,1,122,1,12,1,92,2,49,12,2,12,1,80,
		5,36,162,1,95,5,82,4,0,36,165,1,103,4,
		0,109,47,0,8,28,23,36,167,1,9,82,7,0,
		36,168,1,176,46,0,95,1,20,1,36,170,1,7,
		36,174,1,103,2,0,121,15,28,56,36,175,1,176,
		29,0,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,103,6,0,95,10,72,
		103,2,0,122,49,109,30,0,65,72,121,109,4,0,
		109,30,0,122,49,120,20,6,36,179,1,103,2,0,
		121,15,28,11,36,180,1,103,2,0,82,3,0,36,
		185,1,103,1,0,103,2,0,1,92,3,1,31,42,
		36,186,1,176,23,0,176,49,0,106,20,79,112,231,
		227,111,32,73,110,100,105,115,112,111,110,105,118,101,
		108,46,0,12,1,9,20,2,36,187,1,7,36,191,
		1,103,12,0,28,38,36,192,1,176,28,0,20,0,
		36,194,1,176,19,0,106,18,87,105,110,95,77,101,
		110,117,80,114,105,110,99,105,112,97,108,0,20,1,
		36,197,1,103,2,0,109,30,0,65,80,10,36,198,
		1,176,50,0,106,11,74,97,110,77,101,110,117,83,
		117,98,0,176,13,0,176,51,0,103,2,0,12,1,
		12,1,106,2,45,0,72,95,5,72,95,10,20,3,
		36,208,1,95,2,93,0,2,8,29,189,4,36,210,
		1,121,83,52,0,36,215,1,103,2,0,121,15,28,
		54,36,216,1,103,2,0,176,25,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,103,6,0,176,22,0,103,1,0,12,1,103,
		5,0,12,4,8,28,6,36,217,1,7,36,228,1,
		176,25,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,103,6,0,176,22,
		0,103,1,0,12,1,103,5,0,12,4,82,2,0,
		36,231,1,103,2,0,93,232,3,5,31,11,103,2,
		0,93,208,7,5,28,70,36,233,1,103,2,0,93,
		232,3,5,28,24,103,8,0,28,19,36,234,1,176,
		21,0,95,1,93,0,127,20,2,36,235,1,7,36,
		238,1,103,2,0,93,208,7,5,28,24,103,9,0,
		28,19,36,239,1,176,21,0,95,1,93,0,127,20,
		2,36,240,1,7,36,248,1,103,2,0,103,3,0,
		5,28,15,103,2,0,93,232,3,69,28,6,36,249,
		1,7,36,254,1,176,21,0,95,1,109,26,0,20,
		2,36,0,2,103,2,0,176,22,0,103,1,0,12,
		1,15,29,190,0,103,2,0,93,232,3,35,29,180,
		0,36,3,2,176,32,0,176,13,0,103,4,0,12,
		1,12,1,28,82,36,5,2,103,3,0,121,15,28,
		119,36,6,2,121,82,3,0,36,7,2,121,82,2,
		0,36,8,2,121,82,5,0,36,9,2,176,19,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,20,1,36,10,2,176,53,0,
		101,154,153,153,153,153,153,185,63,10,1,20,1,25,
		49,36,19,2,103,3,0,121,15,28,39,36,20,2,
		176,27,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,104,3,0,104,2,
		0,103,6,0,20,4,36,26,2,121,82,3,0,36,
		28,2,176,21,0,95,1,93,0,127,20,2,36,29,
		2,176,37,0,20,0,36,31,2,7,36,36,2,103,
		2,0,93,232,3,16,28,6,36,37,2,7,36,42,
		2,103,3,0,83,54,0,36,50,2,103,3,0,121,
		15,28,61,36,53,2,176,27,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,104,3,0,104,2,0,103,3,0,103,5,0,15,
		28,17,103,7,0,28,7,103,6,0,25,8,103,6,
		0,25,3,121,20,4,36,59,2,103,2,0,121,15,
		28,13,36,60,2,103,2,0,82,3,0,25,6,36,
		62,2,7,36,66,2,176,13,0,176,48,0,103,1,
		0,103,2,0,1,122,1,176,22,0,103,1,0,103,
		2,0,1,122,1,12,1,92,2,49,12,2,12,1,
		80,5,36,70,2,103,3,0,121,15,28,60,103,3,
		0,176,22,0,103,1,0,12,1,34,28,46,36,71,
		2,176,13,0,176,48,0,103,1,0,103,3,0,1,
		122,1,176,22,0,103,1,0,103,3,0,1,122,1,
		12,1,92,2,49,12,2,12,1,83,55,0,25,19,
		36,74,2,176,38,0,95,1,12,1,83,39,0,36,
		75,2,7,36,84,2,176,21,0,95,1,109,26,0,
		20,2,36,86,2,176,6,0,106,18,87,105,110,95,
		77,101,110,117,80,114,105,110,99,105,112,97,108,0,
		106,11,86,115,99,114,111,108,108,66,97,114,0,106,
		6,86,97,108,117,101,0,12,3,66,80,10,36,89,
		2,176,13,0,95,5,12,1,83,55,0,36,93,2,
		103,2,0,121,15,29,173,0,36,95,2,103,1,0,
		103,2,0,1,92,3,1,31,27,36,96,2,176,21,
		0,95,1,93,0,127,20,2,36,97,2,176,37,0,
		20,0,36,98,2,7,36,101,2,103,2,0,103,5,
		0,16,28,70,36,102,2,176,29,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,103,7,0,28,9,103,6,0,121,72,25,5,
		103,6,0,95,10,72,103,2,0,122,49,109,30,0,
		65,72,121,109,4,0,109,30,0,122,49,120,20,6,
		25,52,36,104,2,176,29,0,106,18,87,105,110,95,
		77,101,110,117,80,114,105,110,99,105,112,97,108,0,
		95,10,103,2,0,122,49,109,30,0,65,72,121,109,
		4,0,109,30,0,122,49,120,20,6,36,112,2,176,
		32,0,176,13,0,103,1,0,103,2,0,1,92,2,
		1,12,1,12,1,31,64,36,113,2,176,13,0,103,
		1,0,103,2,0,1,92,2,1,12,1,106,3,32,
		32,0,72,176,13,0,176,51,0,109,54,0,12,1,
		12,1,72,106,5,32,32,32,32,0,72,176,13,0,
		176,51,0,103,2,0,12,1,12,1,72,80,9,36,
		118,2,176,32,0,176,13,0,95,9,12,1,12,1,
		32,137,0,36,120,2,121,80,10,36,122,2,176,31,
		0,96,6,0,96,10,0,20,2,36,124,2,176,33,
		0,106,8,87,105,110,95,77,115,103,0,12,1,31,
		69,36,125,2,176,34,0,95,10,176,6,0,106,18,
		87,105,110,95,77,101,110,117,80,114,105,110,99,105,
		112,97,108,0,106,6,87,105,100,116,104,0,12,2,
		92,15,49,176,13,0,95,9,12,1,100,101,0,0,
		0,0,0,0,224,63,10,1,20,5,25,17,36,127,
		2,176,35,0,95,9,95,10,92,15,72,20,2,36,
		130,2,176,36,0,95,9,20,1,25,10,36,134,2,
		176,37,0,20,0,36,137,2,176,38,0,95,1,12,
		1,83,39,0,36,148,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCLOSEMPRIN )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,36,153,2,121,80,1,36,155,2,176,57,
		0,106,14,77,101,110,80,114,105,110,99,105,112,97,
		108,49,0,12,1,80,2,36,156,2,176,57,0,106,
		5,84,115,117,98,0,12,1,80,3,36,159,2,95,
		2,121,15,29,185,0,36,163,2,176,58,0,95,2,
		93,18,1,97,96,240,0,0,121,20,4,36,165,2,
		176,59,0,20,0,36,166,2,176,59,0,20,0,36,
		168,2,176,58,0,95,2,93,18,1,92,2,121,20,
		4,36,174,2,95,3,121,15,28,61,36,176,2,176,
		58,0,95,3,93,18,1,97,96,240,0,0,121,20,
		4,36,178,2,176,59,0,20,0,36,179,2,176,59,
		0,20,0,36,181,2,176,58,0,95,3,93,18,1,
		92,2,121,20,4,36,183,2,176,59,0,20,0,36,
		189,2,176,60,0,106,11,69,118,101,110,116,77,101,
		110,117,49,0,12,1,31,42,36,190,2,176,61,0,
		106,30,69,114,114,111,32,97,111,32,114,101,109,111,
		118,101,114,32,72,97,110,100,108,101,32,69,118,101,
		110,116,46,0,20,1,36,200,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDROPDOWN )
{
	static const HB_BYTE pcode[] =
	{
		13,4,3,116,75,0,36,206,2,176,12,0,103,1,
		0,89,27,0,1,0,1,0,2,0,176,13,0,95,
		1,122,1,12,1,176,13,0,95,255,12,1,8,6,
		12,2,80,4,36,212,2,95,3,80,6,36,216,2,
		176,42,0,109,43,0,109,30,0,18,12,1,80,7,
		36,219,2,95,4,83,62,0,36,223,2,95,4,121,
		34,28,34,36,224,2,176,61,0,106,18,70,97,108,
		104,97,32,101,109,32,83,121,115,116,101,109,32,48,
		0,20,1,36,225,2,7,36,228,2,121,83,45,0,
		36,229,2,176,63,0,109,64,0,89,46,0,1,0,
		1,0,4,0,176,65,0,95,1,122,1,122,12,2,
		176,13,0,176,51,0,95,255,12,1,12,1,8,28,
		12,109,45,0,21,23,83,45,0,25,3,100,6,20,
		2,36,231,2,95,4,82,5,0,36,233,2,4,0,
		0,82,10,0,36,236,2,9,82,7,0,36,239,2,
		109,45,0,95,7,16,28,49,36,240,2,176,66,0,
		95,1,106,7,72,101,105,103,104,116,0,109,43,0,
		20,3,36,242,2,109,43,0,109,30,0,92,2,65,
		72,82,6,0,36,243,2,120,82,7,0,25,37,36,
		245,2,109,30,0,109,45,0,65,82,6,0,36,246,
		2,176,66,0,95,1,106,7,72,101,105,103,104,116,
		0,103,6,0,20,3,36,252,2,176,66,0,95,1,
		106,4,67,111,108,0,122,20,3,36,0,3,176,17,
		0,176,11,0,95,1,12,1,121,9,20,3,36,2,
		3,176,17,0,176,11,0,95,1,12,1,122,9,20,
		3,36,4,3,4,0,0,82,10,0,36,7,3,95,
		4,109,30,0,65,80,5,36,8,3,176,66,0,95,
		1,106,4,82,111,119,0,95,5,20,3,36,12,3,
		176,66,0,95,1,106,8,86,105,115,105,98,108,101,
		0,120,20,3,36,16,3,176,63,0,109,64,0,89,
		48,0,1,0,1,0,4,0,176,65,0,95,1,122,
		1,122,12,2,176,13,0,176,51,0,95,255,12,1,
		12,1,8,28,14,176,67,0,103,10,0,95,1,12,
		2,25,3,100,6,20,2,36,17,3,176,13,0,95,
		2,12,1,83,68,0,36,20,3,176,19,0,95,1,
		20,1,36,22,3,176,69,0,95,1,106,5,83,104,
		111,119,0,20,2,36,25,3,176,19,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,20,1,36,27,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRESTMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,116,75,0,36,33,3,95,3,100,8,28,
		5,120,25,4,95,3,80,3,36,36,3,95,3,28,
		39,36,37,3,106,1,0,82,4,0,36,38,3,121,
		82,2,0,36,39,3,121,82,3,0,36,40,3,121,
		82,6,0,36,41,3,121,82,5,0,36,46,3,176,
		33,0,95,1,12,1,28,19,36,47,3,176,69,0,
		95,1,106,5,72,105,100,101,0,20,2,36,52,3,
		176,70,0,95,2,121,20,2,36,54,3,176,19,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,20,1,36,56,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOPSELPOS )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,75,0,36,61,3,121,80,5,36,62,
		3,121,80,6,36,65,3,176,6,0,95,1,106,11,
		86,115,99,114,111,108,108,66,97,114,0,106,6,86,
		97,108,117,101,0,12,3,66,80,9,36,68,3,121,
		80,12,36,72,3,95,2,100,8,28,5,121,25,4,
		95,2,80,2,36,73,3,95,4,100,8,28,5,121,
		25,4,95,4,80,4,36,75,3,176,31,0,96,5,
		0,96,6,0,20,2,36,77,3,176,71,0,176,11,
		0,95,1,12,1,95,6,95,5,12,3,80,7,36,
		80,3,176,72,0,176,11,0,95,1,12,1,122,12,
		2,80,8,36,82,3,95,8,121,15,28,27,36,83,
		3,176,42,0,95,8,95,7,122,1,72,109,30,0,
		18,12,1,122,72,80,12,25,22,36,86,3,176,42,
		0,95,7,122,1,109,30,0,18,12,1,122,72,80,
		12,36,91,3,95,2,121,15,28,58,95,2,95,7,
		122,1,35,28,49,95,2,109,30,0,16,28,41,95,
		7,122,1,95,3,109,30,0,65,15,28,28,36,92,
		3,176,42,0,95,8,95,7,122,1,95,2,49,109,
		30,0,18,72,12,1,122,72,80,12,36,95,3,95,
		7,122,1,95,2,49,122,8,28,11,36,96,3,95,
		4,122,72,80,12,36,101,3,103,7,0,28,86,36,
		103,3,95,4,109,30,0,65,109,43,0,72,80,10,
		36,104,3,95,10,109,30,0,92,2,65,72,80,11,
		36,106,3,95,7,122,1,95,10,16,28,45,95,7,
		122,1,95,11,34,28,36,36,109,3,95,7,122,1,
		95,10,109,30,0,72,35,28,12,36,110,3,93,232,
		3,80,12,25,10,36,112,3,93,208,7,80,12,36,
		119,3,176,73,0,95,12,20,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( SCROLLMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,3,11,36,126,3,120,80,12,36,127,3,95,10,
		80,13,36,130,3,176,42,0,109,43,0,109,30,0,
		18,12,1,80,14,36,132,3,95,11,100,8,28,5,
		120,25,4,95,11,80,11,36,137,3,95,1,92,2,
		8,29,171,0,36,140,3,95,7,31,116,36,143,3,
		96,3,0,109,30,0,135,36,144,3,174,4,0,36,
		146,3,9,80,6,36,151,3,95,11,28,31,36,153,
		3,176,29,0,95,9,95,8,109,30,0,65,95,13,
		72,92,16,72,121,109,4,0,92,16,120,20,6,36,
		157,3,95,4,95,5,5,29,1,1,36,158,3,120,
		80,7,36,160,3,95,11,29,243,0,36,162,3,176,
		29,0,95,9,95,8,109,30,0,65,95,13,72,122,
		49,121,109,4,0,92,16,120,20,6,26,212,0,36,
		168,3,176,23,0,176,49,0,106,22,79,112,231,227,
		111,32,78,227,111,32,68,105,115,112,111,110,105,118,
		101,108,46,0,12,1,9,20,2,36,169,3,9,80,
		12,26,165,0,36,181,3,95,6,31,113,36,183,3,
		96,3,0,109,30,0,136,36,184,3,173,4,0,36,
		186,3,9,80,7,36,188,3,95,11,28,30,36,190,
		3,176,29,0,95,9,95,8,109,30,0,65,95,13,
		72,122,49,121,109,4,0,92,16,120,20,6,36,194,
		3,95,4,95,14,8,28,90,36,195,3,120,80,6,
		36,197,3,95,11,28,77,36,199,3,176,29,0,95,
		9,95,8,109,30,0,65,95,13,72,92,16,72,121,
		109,4,0,92,16,120,20,6,25,46,36,205,3,176,
		23,0,176,49,0,106,22,79,112,231,227,111,32,78,
		227,111,32,68,105,115,112,111,110,105,118,101,108,46,
		0,12,1,9,20,2,36,206,3,9,80,12,36,213,
		3,95,12,28,14,36,214,3,176,70,0,95,2,95,
		3,20,2,36,220,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,75,0,17,0,116,75,0,4,0,0,82,1,0,
		121,82,2,0,121,82,3,0,106,1,0,82,4,0,
		121,82,5,0,121,82,6,0,9,82,7,0,9,82,
		8,0,120,82,9,0,4,0,0,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,106,1,0,82,
		14,0,9,82,15,0,121,82,16,0,121,82,17,0,
		7
	};

	hb_vmExecute( pcode, symbols );
}

