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
HB_FUNC_EXTERN( EVENTCREATE );
HB_FUNC( XTECLASMENU );
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
HB_FUNC_EXTERN( EVENTREMOVE );
HB_FUNC_EXTERN( AEVAL );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_EXTERN( SETPROPERTY );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( DOMETHOD );
HB_FUNC_EXTERN( _HMG_PRINTER_SETVSCROLLVALUE );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC_EXTERN( GETSCROLLPOS );
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( EVENTHWND );
HB_FUNC_EXTERN( EVENTMSG );
HB_FUNC_EXTERN( EVENTWPARAM );
HB_FUNC( XHINTSETAD );
HB_FUNC_EXTERN( EXITAPP );
HB_FUNC_EXTERN( RELEASEALLWINDOWS );
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
{ "EVENTCREATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTCREATE )}, NULL },
{ "XTECLASMENU", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XTECLASMENU )}, NULL },
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
{ "EVENTREMOVE", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTREMOVE )}, NULL },
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
{ "EVENTHWND", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTHWND )}, NULL },
{ "EVENTMSG", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTMSG )}, NULL },
{ "EVENTWPARAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTWPARAM )}, NULL },
{ "NDIFF", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XHINTSETAD", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XHINTSETAD )}, NULL },
{ "EXITAPP", {HB_FS_PUBLIC}, {HB_FUNCNAME( EXITAPP )}, NULL },
{ "RELEASEALLWINDOWS", {HB_FS_PUBLIC}, {HB_FUNCNAME( RELEASEALLWINDOWS )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00022)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,0,4,116,85,0,36,68,0,176,1,0,95,3,
		12,1,82,2,0,36,70,0,4,0,0,80,4,36,
		75,0,176,2,0,20,0,176,3,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,106,14,77,101,110,80,114,105,110,99,105,112,
		97,108,49,0,95,2,95,1,109,4,0,93,8,2,
		120,120,120,120,120,9,106,1,0,100,100,100,100,100,
		100,93,255,0,93,255,0,93,255,0,4,3,0,90,
		55,176,5,0,176,6,0,98,7,0,93,60,1,1,
		106,5,78,97,109,101,0,12,2,103,2,0,103,3,
		0,103,4,0,103,5,0,103,6,0,103,7,0,103,
		8,0,9,103,9,0,103,10,0,12,11,6,9,9,
		9,100,120,100,100,100,100,100,100,100,93,9,2,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,100,9,20,56,36,76,0,176,8,
		0,20,0,36,82,0,176,2,0,20,0,176,3,0,
		106,11,74,97,110,77,101,110,117,83,117,98,0,106,
		5,84,115,117,98,0,93,200,0,93,200,0,109,4,
		0,93,244,1,120,120,120,120,120,9,106,1,0,100,
		100,100,100,100,100,109,9,0,90,43,176,5,0,176,
		6,0,98,7,0,93,60,1,1,106,5,78,97,109,
		101,0,12,2,103,12,0,103,13,0,103,15,0,103,
		16,0,121,121,9,120,12,9,6,9,9,9,100,120,
		100,100,100,100,100,100,100,93,152,58,100,100,100,100,
		100,100,100,9,100,100,100,9,100,100,100,100,100,100,
		100,100,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,120,20,56,36,83,0,
		176,8,0,20,0,36,87,0,176,10,0,176,11,0,
		106,11,74,97,110,77,101,110,117,83,117,98,0,12,
		1,20,1,36,92,0,176,12,0,98,7,0,92,60,
		1,176,13,0,176,14,0,106,11,69,118,101,110,116,
		80,114,105,110,49,0,12,1,12,1,12,2,121,5,
		28,42,36,93,0,176,15,0,106,11,69,118,101,110,
		116,80,114,105,110,49,0,20,1,36,94,0,176,16,
		0,90,8,176,17,0,12,0,6,12,1,82,1,0,
		36,97,0,176,18,0,176,6,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,106,7,72,97,110,100,108,101,0,12,2,122,100,
		100,120,120,20,6,36,98,0,176,18,0,176,6,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,106,7,72,97,110,100,108,101,
		0,12,2,100,97,0,0,2,0,120,120,20,5,36,
		100,0,176,18,0,176,6,0,106,18,87,105,110,95,
		77,101,110,117,80,114,105,110,99,105,112,97,108,0,
		106,7,72,97,110,100,108,101,0,12,2,93,128,0,
		100,120,120,20,5,36,107,0,176,18,0,176,6,0,
		106,11,74,97,110,77,101,110,117,83,117,98,0,106,
		7,72,97,110,100,108,101,0,12,2,122,100,100,120,
		120,20,6,36,111,0,176,19,0,176,11,0,106,18,
		87,105,110,95,77,101,110,117,80,114,105,110,99,105,
		112,97,108,0,12,1,121,9,20,3,36,112,0,176,
		19,0,176,11,0,106,18,87,105,110,95,77,101,110,
		117,80,114,105,110,99,105,112,97,108,0,12,1,122,
		9,20,3,36,115,0,176,20,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,20,1,36,118,0,176,21,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,20,1,36,122,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTPRIN1 )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,85,0,36,129,0,106,1,0,80,5,
		36,130,0,121,80,6,36,131,0,121,80,7,36,133,
		0,121,80,8,36,134,0,106,1,0,80,9,36,136,
		0,121,80,10,36,138,0,121,80,11,36,139,0,121,
		80,12,36,146,0,95,1,176,6,0,106,11,74,97,
		110,77,101,110,117,83,117,98,0,106,7,72,65,78,
		68,76,69,0,12,2,8,29,234,3,103,6,0,121,
		15,29,226,3,36,149,0,95,2,93,163,2,8,28,
		44,103,18,0,28,39,36,151,0,121,82,13,0,36,
		152,0,121,82,15,0,36,153,0,176,21,0,95,1,
		20,1,36,154,0,176,23,0,95,1,93,0,127,20,
		2,36,160,0,95,2,93,1,2,8,29,119,0,36,
		163,0,103,13,0,176,24,0,103,12,0,12,1,34,
		28,101,36,165,0,103,12,0,103,13,0,1,92,3,
		1,31,50,36,166,0,176,23,0,95,1,93,0,127,
		20,2,36,167,0,176,25,0,106,20,79,112,231,227,
		111,32,73,110,100,105,115,112,111,110,105,118,101,108,
		46,0,9,20,2,36,168,0,7,36,171,0,103,12,
		0,103,13,0,1,92,4,1,100,69,28,21,36,172,
		0,48,26,0,103,12,0,103,13,0,1,92,4,1,
		112,0,73,36,181,0,95,2,93,0,2,8,29,33,
		3,36,184,0,103,13,0,121,15,28,50,95,3,92,
		90,69,28,43,36,185,0,103,13,0,176,27,0,106,
		11,74,97,110,77,101,110,117,83,117,98,0,121,176,
		24,0,103,12,0,12,1,121,12,4,5,28,6,36,
		186,0,7,36,191,0,95,3,92,90,69,28,36,36,
		192,0,176,27,0,106,11,74,97,110,77,101,110,117,
		83,117,98,0,121,176,24,0,103,12,0,12,1,121,
		12,4,82,13,0,36,198,0,176,6,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,106,11,86,115,
		99,114,111,108,108,66,97,114,0,106,6,86,97,108,
		117,101,0,12,3,66,80,10,36,201,0,103,13,0,
		176,24,0,103,12,0,12,1,34,28,34,36,202,0,
		103,12,0,103,13,0,1,92,3,1,31,19,36,204,
		0,176,23,0,95,1,93,0,127,20,2,36,205,0,
		7,36,211,0,176,23,0,95,1,109,28,0,20,2,
		36,214,0,103,15,0,121,15,28,53,36,215,0,176,
		29,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,104,15,0,104,13,0,121,20,4,36,217,0,103,
		14,0,28,17,36,218,0,176,30,0,20,0,36,219,
		0,9,82,14,0,36,226,0,103,13,0,121,15,28,
		13,36,227,0,103,13,0,82,15,0,25,6,36,229,
		0,7,36,233,0,103,13,0,121,15,29,211,0,36,
		235,0,176,31,0,106,11,74,97,110,77,101,110,117,
		83,117,98,0,95,10,103,13,0,122,49,109,32,0,
		65,72,121,109,4,0,109,32,0,122,49,120,20,6,
		36,241,0,103,13,0,176,24,0,103,12,0,12,1,
		34,29,150,0,176,24,0,103,12,0,103,13,0,1,
		12,1,92,5,16,29,132,0,36,243,0,103,12,0,
		103,13,0,1,92,5,1,28,116,36,245,0,121,80,
		11,36,246,0,121,80,12,36,247,0,95,3,92,90,
		69,28,74,36,249,0,176,33,0,96,12,0,96,11,
		0,20,2,36,252,0,48,26,0,103,12,0,103,13,
		0,1,92,6,1,95,11,109,32,0,49,92,15,72,
		176,6,0,106,11,74,97,110,77,101,110,117,83,117,
		98,0,106,4,67,111,108,0,12,2,109,4,0,72,
		122,72,112,2,73,36,3,1,103,13,0,82,17,0,
		36,4,1,120,82,14,0,36,7,1,7,36,16,1,
		95,3,92,90,69,29,253,0,36,17,1,103,13,0,
		176,24,0,103,12,0,12,1,34,29,227,0,176,34,
		0,176,13,0,103,12,0,103,13,0,1,92,2,1,
		12,1,12,1,32,204,0,36,19,1,176,13,0,103,
		12,0,103,13,0,1,92,2,1,12,1,80,9,36,
		21,1,121,80,10,36,24,1,176,33,0,96,6,0,
		96,10,0,20,2,36,26,1,176,35,0,106,8,87,
		105,110,95,77,115,103,0,12,1,31,62,36,27,1,
		176,36,0,95,10,176,6,0,106,11,74,97,110,77,
		101,110,117,83,117,98,0,106,6,87,105,100,116,104,
		0,12,2,92,15,49,176,13,0,95,9,12,1,100,
		101,0,0,0,0,0,0,224,63,10,1,20,5,25,
		71,36,29,1,176,37,0,95,9,95,10,92,15,72,
		176,6,0,106,11,74,97,110,77,101,110,117,83,117,
		98,0,106,4,67,111,108,0,12,2,176,6,0,106,
		11,74,97,110,77,101,110,117,83,117,98,0,106,6,
		87,105,100,116,104,0,12,2,72,92,10,72,20,3,
		36,32,1,176,38,0,95,9,20,1,25,10,36,36,
		1,176,39,0,20,0,36,42,1,95,3,92,90,69,
		28,15,36,43,1,176,40,0,95,1,12,1,82,18,
		0,36,59,1,95,1,176,6,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,106,7,72,97,110,100,108,101,0,12,2,8,29,
		27,10,36,61,1,95,2,93,163,2,8,29,46,1,
		109,41,0,29,40,1,36,63,1,176,34,0,176,13,
		0,103,5,0,12,1,12,1,28,53,36,65,1,103,
		4,0,121,15,29,192,0,36,66,1,121,82,3,0,
		36,67,1,121,82,4,0,36,68,1,176,21,0,95,
		1,20,1,36,69,1,176,23,0,95,1,93,0,127,
		20,2,26,152,0,36,74,1,103,4,0,121,15,28,
		69,103,4,0,103,3,0,69,28,60,36,75,1,121,
		82,3,0,36,76,1,176,29,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,104,4,0,104,3,0,103,3,0,103,6,0,16,
		28,7,109,42,0,25,3,121,122,49,20,4,36,80,
		1,176,35,0,106,8,87,105,110,95,77,115,103,0,
		12,1,28,50,36,81,1,176,43,0,176,11,0,106,
		8,87,105,110,95,77,115,103,0,12,1,12,1,28,
		25,36,82,1,176,10,0,176,11,0,106,8,87,105,
		110,95,77,115,103,0,12,1,20,1,36,86,1,7,
		36,92,1,9,83,41,0,36,95,1,176,35,0,106,
		8,87,105,110,95,77,115,103,0,12,1,28,50,36,
		96,1,176,43,0,176,11,0,106,8,87,105,110,95,
		77,115,103,0,12,1,12,1,28,25,36,97,1,176,
		10,0,176,11,0,106,8,87,105,110,95,77,115,103,
		0,12,1,20,1,36,106,1,95,2,93,1,2,8,
		29,132,3,36,108,1,176,6,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,106,11,86,115,99,114,111,108,108,66,97,114,0,
		106,6,86,97,108,117,101,0,12,3,66,80,10,36,
		112,1,103,8,0,29,18,1,95,3,92,90,69,29,
		10,1,36,114,1,103,20,0,121,8,28,20,36,115,
		1,176,44,0,109,45,0,109,32,0,18,12,1,82,
		20,0,36,120,1,103,3,0,93,232,3,5,28,108,
		36,125,1,176,46,0,92,2,176,6,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,106,7,72,97,
		110,100,108,101,0,12,2,104,19,0,104,20,0,109,
		47,0,104,10,0,104,9,0,103,6,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,176,6,0,106,11,74,97,110,77,101,110,
		117,83,117,98,0,106,7,72,101,105,103,104,116,0,
		12,2,20,10,36,126,1,7,36,131,1,103,3,0,
		93,208,7,5,28,107,36,134,1,176,46,0,122,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,7,72,97,110,100,108,101,0,12,2,104,19,
		0,104,20,0,109,47,0,104,10,0,104,9,0,103,
		6,0,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,176,6,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,106,7,72,101,
		105,103,104,116,0,12,2,20,10,36,135,1,7,36,
		142,1,103,6,0,121,15,28,26,36,143,1,176,48,
		0,106,11,74,97,110,77,101,110,117,83,117,98,0,
		95,1,9,20,3,36,148,1,103,5,0,83,49,0,
		36,150,1,176,34,0,176,13,0,103,5,0,12,1,
		12,1,31,111,36,152,1,176,12,0,103,2,0,89,
		38,0,1,0,0,0,176,50,0,95,1,122,1,176,
		24,0,95,1,122,1,12,1,92,2,49,12,2,176,
		13,0,103,5,0,12,1,8,6,12,2,80,8,36,
		154,1,95,8,121,15,28,51,36,155,1,176,31,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,95,10,95,8,122,49,109,32,
		0,65,72,121,109,4,0,109,32,0,122,49,120,20,
		6,36,161,1,103,4,0,121,15,28,39,36,162,1,
		176,29,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,104,4,0,104,3,
		0,103,7,0,20,4,36,165,1,103,3,0,121,8,
		31,16,103,3,0,176,24,0,103,2,0,12,1,15,
		28,6,36,166,1,7,36,169,1,176,13,0,176,50,
		0,103,2,0,103,3,0,1,122,1,176,24,0,103,
		2,0,103,3,0,1,122,1,12,1,92,2,49,12,
		2,12,1,80,5,36,170,1,95,5,82,5,0,36,
		173,1,103,5,0,109,49,0,8,28,23,36,175,1,
		9,82,8,0,36,176,1,176,48,0,95,1,20,1,
		36,178,1,7,36,182,1,103,3,0,121,15,28,56,
		36,183,1,176,31,0,106,18,87,105,110,95,77,101,
		110,117,80,114,105,110,99,105,112,97,108,0,103,7,
		0,95,10,72,103,3,0,122,49,109,32,0,65,72,
		121,109,4,0,109,32,0,122,49,120,20,6,36,187,
		1,103,3,0,121,15,28,11,36,188,1,103,3,0,
		82,4,0,36,193,1,103,2,0,103,3,0,1,92,
		3,1,31,42,36,194,1,176,25,0,176,51,0,106,
		20,79,112,231,227,111,32,73,110,100,105,115,112,111,
		110,105,118,101,108,46,0,12,1,9,20,2,36,195,
		1,7,36,199,1,103,14,0,28,38,36,200,1,176,
		30,0,20,0,36,202,1,176,21,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,20,1,36,205,1,103,3,0,109,32,0,65,
		80,10,36,206,1,176,52,0,106,11,74,97,110,77,
		101,110,117,83,117,98,0,176,13,0,176,53,0,103,
		3,0,12,1,12,1,106,2,45,0,72,95,5,72,
		95,10,20,3,36,216,1,95,2,93,0,2,8,31,
		10,95,3,92,90,5,29,68,5,36,218,1,103,3,
		0,83,54,0,36,222,1,103,3,0,121,15,28,54,
		36,223,1,103,3,0,176,27,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,103,7,0,176,24,0,103,2,0,12,1,103,6,
		0,12,4,8,28,6,36,224,1,7,36,229,1,95,
		3,92,90,69,28,47,36,230,1,176,27,0,106,18,
		87,105,110,95,77,101,110,117,80,114,105,110,99,105,
		112,97,108,0,103,7,0,176,24,0,103,2,0,12,
		1,103,6,0,12,4,82,3,0,36,233,1,103,14,
		0,28,36,36,234,1,103,17,0,103,3,0,69,28,
		24,36,235,1,176,30,0,20,0,36,236,1,121,82,
		17,0,36,237,1,9,82,14,0,36,243,1,103,3,
		0,93,232,3,5,31,12,103,3,0,93,208,7,5,
		29,140,0,36,245,1,109,54,0,121,15,28,61,36,
		246,1,176,29,0,106,18,87,105,110,95,77,101,110,
		117,80,114,105,110,99,105,112,97,108,0,109,54,0,
		109,54,0,109,54,0,103,6,0,15,28,17,103,8,
		0,28,7,103,7,0,25,8,103,7,0,25,3,121,
		20,4,36,251,1,103,3,0,93,232,3,5,28,24,
		103,9,0,28,19,36,252,1,176,23,0,95,1,93,
		0,127,20,2,36,253,1,7,36,1,2,103,3,0,
		93,208,7,5,28,24,103,10,0,28,19,36,2,2,
		176,23,0,95,1,93,0,127,20,2,36,3,2,7,
		36,10,2,103,3,0,103,4,0,5,28,15,103,3,
		0,93,232,3,69,28,6,36,11,2,7,36,14,2,
		176,23,0,95,1,109,28,0,20,2,36,16,2,103,
		3,0,176,24,0,103,2,0,12,1,15,29,190,0,
		103,3,0,93,232,3,35,29,180,0,36,19,2,176,
		34,0,176,13,0,103,5,0,12,1,12,1,28,82,
		36,21,2,103,4,0,121,15,28,119,36,22,2,121,
		82,4,0,36,23,2,121,82,3,0,36,24,2,121,
		82,6,0,36,25,2,176,21,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,20,1,36,26,2,176,55,0,101,154,153,153,153,
		153,153,185,63,10,1,20,1,25,49,36,31,2,103,
		4,0,121,15,28,39,36,32,2,176,29,0,106,18,
		87,105,110,95,77,101,110,117,80,114,105,110,99,105,
		112,97,108,0,104,4,0,104,3,0,103,7,0,20,
		4,36,37,2,121,82,4,0,36,39,2,176,23,0,
		95,1,93,0,127,20,2,36,40,2,176,39,0,20,
		0,36,42,2,7,36,47,2,103,3,0,93,232,3,
		16,28,6,36,48,2,7,36,52,2,103,4,0,83,
		56,0,36,58,2,103,4,0,121,15,28,61,36,59,
		2,176,29,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,104,4,0,104,
		3,0,103,4,0,103,6,0,15,28,17,103,8,0,
		28,7,103,7,0,25,8,103,7,0,25,3,121,20,
		4,36,63,2,103,3,0,121,15,28,13,36,64,2,
		103,3,0,82,4,0,25,6,36,66,2,7,36,70,
		2,176,13,0,176,50,0,103,2,0,103,3,0,1,
		122,1,176,24,0,103,2,0,103,3,0,1,122,1,
		12,1,92,2,49,12,2,12,1,80,5,36,74,2,
		103,4,0,121,15,28,60,103,4,0,176,24,0,103,
		2,0,12,1,34,28,46,36,75,2,176,13,0,176,
		50,0,103,2,0,103,4,0,1,122,1,176,24,0,
		103,2,0,103,4,0,1,122,1,12,1,92,2,49,
		12,2,12,1,83,57,0,25,19,36,78,2,176,40,
		0,95,1,12,1,83,41,0,36,79,2,7,36,88,
		2,176,23,0,95,1,109,28,0,20,2,36,90,2,
		176,6,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,106,11,86,115,99,
		114,111,108,108,66,97,114,0,106,6,86,97,108,117,
		101,0,12,3,66,80,10,36,93,2,176,13,0,95,
		5,12,1,83,57,0,36,98,2,103,3,0,121,15,
		29,173,0,36,100,2,103,2,0,103,3,0,1,92,
		3,1,31,27,36,101,2,176,23,0,95,1,93,0,
		127,20,2,36,102,2,176,39,0,20,0,36,103,2,
		7,36,106,2,103,3,0,103,6,0,16,28,70,36,
		107,2,176,31,0,106,18,87,105,110,95,77,101,110,
		117,80,114,105,110,99,105,112,97,108,0,103,8,0,
		28,9,103,7,0,121,72,25,5,103,7,0,95,10,
		72,103,3,0,122,49,109,32,0,65,72,121,109,4,
		0,109,32,0,122,49,120,20,6,25,52,36,109,2,
		176,31,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,95,10,103,3,0,
		122,49,109,32,0,65,72,121,109,4,0,109,32,0,
		122,49,120,20,6,36,119,2,95,3,92,90,69,29,
		7,1,36,121,2,176,34,0,176,13,0,103,2,0,
		103,3,0,1,92,2,1,12,1,12,1,31,64,36,
		122,2,176,13,0,103,2,0,103,3,0,1,92,2,
		1,12,1,106,3,32,32,0,72,176,13,0,176,53,
		0,109,56,0,12,1,12,1,72,106,5,32,32,32,
		32,0,72,176,13,0,176,53,0,103,3,0,12,1,
		12,1,72,80,9,36,127,2,176,34,0,176,13,0,
		95,9,12,1,12,1,32,137,0,36,129,2,121,80,
		10,36,131,2,176,33,0,96,6,0,96,10,0,20,
		2,36,133,2,176,35,0,106,8,87,105,110,95,77,
		115,103,0,12,1,31,69,36,134,2,176,36,0,95,
		10,176,6,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,106,6,87,105,
		100,116,104,0,12,2,92,15,49,176,13,0,95,9,
		12,1,100,101,0,0,0,0,0,0,224,63,10,1,
		20,5,25,17,36,136,2,176,37,0,95,9,95,10,
		92,15,72,20,2,36,139,2,176,38,0,95,9,20,
		1,25,10,36,143,2,176,39,0,20,0,36,147,2,
		176,40,0,95,1,12,1,83,41,0,36,163,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCLOSEMPRIN )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,116,85,0,36,168,2,121,80,1,36,170,
		2,176,59,0,106,14,77,101,110,80,114,105,110,99,
		105,112,97,108,49,0,12,1,80,2,36,171,2,176,
		59,0,106,5,84,115,117,98,0,12,1,80,3,36,
		174,2,95,2,121,15,29,242,0,36,178,2,176,60,
		0,95,2,93,18,1,97,96,240,0,0,121,20,4,
		36,180,2,176,61,0,20,0,36,181,2,176,61,0,
		20,0,36,183,2,176,60,0,95,2,93,18,1,92,
		2,121,20,4,36,186,2,95,3,121,15,28,61,36,
		188,2,176,60,0,95,3,93,18,1,97,96,240,0,
		0,121,20,4,36,190,2,176,61,0,20,0,36,191,
		2,176,61,0,20,0,36,193,2,176,60,0,95,3,
		93,18,1,92,2,121,20,4,36,195,2,176,61,0,
		20,0,36,201,2,176,62,0,106,11,69,118,101,110,
		116,77,101,110,117,49,0,12,1,31,42,36,202,2,
		176,63,0,106,30,69,114,114,111,32,97,111,32,114,
		101,109,111,118,101,114,32,72,97,110,100,108,101,32,
		69,118,101,110,116,46,0,20,1,36,206,2,176,64,
		0,103,1,0,12,1,31,46,36,207,2,176,63,0,
		106,34,69,114,114,111,32,97,111,32,114,101,109,111,
		118,101,114,32,72,97,110,100,108,101,32,69,118,101,
		110,116,32,50,50,32,46,0,20,1,36,217,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDROPDOWN )
{
	static const HB_BYTE pcode[] =
	{
		13,4,3,116,85,0,36,223,2,176,12,0,103,2,
		0,89,27,0,1,0,1,0,2,0,176,13,0,95,
		1,122,1,12,1,176,13,0,95,255,12,1,8,6,
		12,2,80,4,36,229,2,95,3,80,6,36,233,2,
		176,44,0,109,45,0,109,32,0,18,12,1,80,7,
		36,236,2,95,4,83,65,0,36,240,2,95,4,121,
		34,28,34,36,241,2,176,63,0,106,18,70,97,108,
		104,97,32,101,109,32,83,121,115,116,101,109,32,48,
		0,20,1,36,242,2,7,36,245,2,121,83,47,0,
		36,246,2,176,66,0,109,67,0,89,46,0,1,0,
		1,0,4,0,176,68,0,95,1,122,1,122,12,2,
		176,13,0,176,53,0,95,255,12,1,12,1,8,28,
		12,109,47,0,21,23,83,47,0,25,3,100,6,20,
		2,36,248,2,95,4,82,6,0,36,250,2,4,0,
		0,82,12,0,36,253,2,9,82,8,0,36,0,3,
		109,47,0,95,7,16,28,49,36,1,3,176,69,0,
		95,1,106,7,72,101,105,103,104,116,0,109,45,0,
		20,3,36,3,3,109,45,0,109,32,0,92,2,65,
		72,82,7,0,36,4,3,120,82,8,0,25,37,36,
		6,3,109,32,0,109,47,0,65,82,7,0,36,7,
		3,176,69,0,95,1,106,7,72,101,105,103,104,116,
		0,103,7,0,20,3,36,13,3,176,69,0,95,1,
		106,4,67,111,108,0,122,20,3,36,17,3,176,19,
		0,176,11,0,95,1,12,1,121,9,20,3,36,19,
		3,176,19,0,176,11,0,95,1,12,1,122,9,20,
		3,36,21,3,4,0,0,82,12,0,36,24,3,95,
		4,109,32,0,65,80,5,36,25,3,176,69,0,95,
		1,106,4,82,111,119,0,95,5,20,3,36,29,3,
		176,69,0,95,1,106,8,86,105,115,105,98,108,101,
		0,120,20,3,36,33,3,176,66,0,109,67,0,89,
		48,0,1,0,1,0,4,0,176,68,0,95,1,122,
		1,122,12,2,176,13,0,176,53,0,95,255,12,1,
		12,1,8,28,14,176,70,0,103,12,0,95,1,12,
		2,25,3,100,6,20,2,36,34,3,176,13,0,95,
		2,12,1,83,71,0,36,37,3,176,21,0,95,1,
		20,1,36,39,3,176,72,0,95,1,106,5,83,104,
		111,119,0,20,2,36,42,3,176,21,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,20,1,36,44,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRESTMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,116,85,0,36,50,3,95,3,100,8,28,
		5,120,25,4,95,3,80,3,36,53,3,95,3,28,
		39,36,54,3,106,1,0,82,5,0,36,55,3,121,
		82,3,0,36,56,3,121,82,4,0,36,57,3,121,
		82,7,0,36,58,3,121,82,6,0,36,63,3,176,
		35,0,95,1,12,1,28,19,36,64,3,176,72,0,
		95,1,106,5,72,105,100,101,0,20,2,36,69,3,
		176,73,0,95,2,121,20,2,36,71,3,176,21,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,20,1,36,73,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOPSELPOS )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,85,0,36,78,3,121,80,5,36,79,
		3,121,80,6,36,82,3,176,6,0,95,1,106,11,
		86,115,99,114,111,108,108,66,97,114,0,106,6,86,
		97,108,117,101,0,12,3,66,80,9,36,85,3,121,
		80,12,36,89,3,95,2,100,8,28,5,121,25,4,
		95,2,80,2,36,90,3,95,4,100,8,28,5,121,
		25,4,95,4,80,4,36,92,3,176,33,0,96,5,
		0,96,6,0,20,2,36,94,3,176,74,0,176,11,
		0,95,1,12,1,95,6,95,5,12,3,80,7,36,
		97,3,176,75,0,176,11,0,95,1,12,1,122,12,
		2,80,8,36,99,3,95,8,121,15,28,27,36,100,
		3,176,44,0,95,8,95,7,122,1,72,109,32,0,
		18,12,1,122,72,80,12,25,22,36,103,3,176,44,
		0,95,7,122,1,109,32,0,18,12,1,122,72,80,
		12,36,108,3,95,2,121,15,28,58,95,2,95,7,
		122,1,35,28,49,95,2,109,32,0,16,28,41,95,
		7,122,1,95,3,109,32,0,65,15,28,28,36,109,
		3,176,44,0,95,8,95,7,122,1,95,2,49,109,
		32,0,18,72,12,1,122,72,80,12,36,112,3,95,
		7,122,1,95,2,49,122,8,28,11,36,113,3,95,
		4,122,72,80,12,36,118,3,103,8,0,28,86,36,
		120,3,95,4,109,32,0,65,109,45,0,72,80,10,
		36,121,3,95,10,109,32,0,92,2,65,72,80,11,
		36,123,3,95,7,122,1,95,10,16,28,45,95,7,
		122,1,95,11,34,28,36,36,126,3,95,7,122,1,
		95,10,109,32,0,72,35,28,12,36,127,3,93,232,
		3,80,12,25,10,36,129,3,93,208,7,80,12,36,
		136,3,176,76,0,95,12,20,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( SCROLLMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,3,11,36,143,3,120,80,12,36,144,3,95,10,
		80,13,36,147,3,176,44,0,109,45,0,109,32,0,
		18,12,1,80,14,36,149,3,95,11,100,8,28,5,
		120,25,4,95,11,80,11,36,151,3,95,1,92,2,
		8,29,171,0,36,154,3,95,7,31,116,36,156,3,
		96,3,0,109,32,0,135,36,157,3,174,4,0,36,
		159,3,9,80,6,36,162,3,95,11,28,31,36,164,
		3,176,31,0,95,9,95,8,109,32,0,65,95,13,
		72,92,16,72,121,109,4,0,92,16,120,20,6,36,
		169,3,95,4,95,5,5,29,1,1,36,170,3,120,
		80,7,36,172,3,95,11,29,243,0,36,174,3,176,
		31,0,95,9,95,8,109,32,0,65,95,13,72,122,
		49,121,109,4,0,92,16,120,20,6,26,212,0,36,
		180,3,176,25,0,176,51,0,106,22,79,112,231,227,
		111,32,78,227,111,32,68,105,115,112,111,110,105,118,
		101,108,46,0,12,1,9,20,2,36,181,3,9,80,
		12,26,165,0,36,193,3,95,6,31,113,36,195,3,
		96,3,0,109,32,0,136,36,196,3,173,4,0,36,
		198,3,9,80,7,36,200,3,95,11,28,30,36,202,
		3,176,31,0,95,9,95,8,109,32,0,65,95,13,
		72,122,49,121,109,4,0,92,16,120,20,6,36,206,
		3,95,4,95,14,8,28,90,36,207,3,120,80,6,
		36,209,3,95,11,28,77,36,211,3,176,31,0,95,
		9,95,8,109,32,0,65,95,13,72,92,16,72,121,
		109,4,0,92,16,120,20,6,25,46,36,217,3,176,
		25,0,176,51,0,106,22,79,112,231,227,111,32,78,
		227,111,32,68,105,115,112,111,110,105,118,101,108,46,
		0,12,1,9,20,2,36,218,3,9,80,12,36,226,
		3,95,12,28,14,36,227,3,176,73,0,95,2,95,
		3,20,2,36,231,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XTECLASMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,9,0,116,85,0,36,235,3,176,77,0,12,0,
		80,1,36,236,3,176,78,0,12,0,80,2,36,237,
		3,176,79,0,12,0,80,3,36,238,3,121,80,4,
		36,239,3,121,80,5,36,240,3,121,80,6,36,244,
		3,106,1,0,80,8,36,248,3,176,44,0,109,45,
		0,109,32,0,18,12,1,80,9,36,251,3,95,2,
		93,0,1,8,29,10,8,36,253,3,95,3,92,37,
		8,28,31,36,255,3,103,17,0,93,231,3,5,28,
		19,36,0,4,103,13,0,82,17,0,36,1,4,176,
		30,0,20,0,36,6,4,95,3,92,39,8,29,230,
		0,36,8,4,103,17,0,93,231,3,5,28,40,36,
		10,4,176,25,0,176,51,0,106,18,83,117,98,77,
		101,110,117,32,74,225,32,65,116,105,118,111,46,0,
		12,1,9,20,2,36,11,4,7,36,15,4,103,17,
		0,103,13,0,69,28,68,36,16,4,176,25,0,176,
		51,0,106,48,69,115,116,101,32,73,116,101,109,32,
		100,111,32,77,101,110,117,32,110,227,111,32,80,111,
		115,115,117,105,32,83,117,98,77,101,110,117,32,65,
		115,115,111,99,105,97,100,111,46,0,12,1,9,20,
		2,25,101,36,19,4,176,6,0,106,11,74,97,110,
		77,101,110,117,83,117,98,0,106,4,82,111,119,0,
		12,2,103,13,0,122,49,109,32,0,65,72,80,7,
		36,22,4,48,26,0,103,12,0,103,13,0,1,92,
		6,1,95,7,176,6,0,106,11,74,97,110,77,101,
		110,117,83,117,98,0,106,4,67,111,108,0,12,2,
		109,4,0,72,122,72,112,2,73,36,24,4,93,231,
		3,82,17,0,36,34,4,103,8,0,29,157,3,36,
		37,4,95,3,92,27,8,28,19,36,38,4,103,13,
		0,82,17,0,36,40,4,176,30,0,20,0,36,44,
		4,95,3,92,38,8,29,192,1,36,47,4,103,17,
		0,121,15,28,10,36,48,4,176,39,0,20,0,36,
		51,4,103,17,0,93,231,3,5,28,6,36,53,4,
		7,36,60,4,103,13,0,122,15,29,124,1,36,62,
		4,103,13,0,83,80,0,36,64,4,104,13,0,169,
		36,66,4,103,13,0,122,15,28,23,103,12,0,103,
		13,0,1,92,3,1,31,11,36,67,4,104,13,0,
		169,25,227,36,70,4,9,82,18,0,36,73,4,103,
		13,0,95,9,15,29,138,0,36,75,4,103,20,0,
		121,8,28,20,36,76,4,176,44,0,109,45,0,109,
		32,0,18,12,1,82,20,0,36,80,4,176,46,0,
		122,176,6,0,106,11,74,97,110,77,101,110,117,83,
		117,98,0,106,7,72,97,110,100,108,101,0,12,2,
		104,19,0,104,20,0,176,24,0,103,12,0,12,1,
		104,22,0,104,21,0,122,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,7,72,101,105,103,104,116,0,12,2,20,10,
		26,169,0,36,84,4,109,80,0,95,9,15,28,116,
		36,86,4,104,19,0,109,32,0,136,36,89,4,176,
		46,0,122,176,6,0,106,11,74,97,110,77,101,110,
		117,83,117,98,0,106,7,72,97,110,100,108,101,0,
		12,2,104,19,0,104,20,0,176,24,0,103,12,0,
		12,1,104,22,0,104,21,0,122,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,176,6,0,106,11,74,97,110,77,101,110,117,83,
		117,98,0,106,7,72,101,105,103,104,116,0,12,2,
		20,10,36,93,4,176,60,0,176,6,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,106,7,72,65,
		78,68,76,69,0,12,2,93,0,2,92,90,121,20,
		4,36,98,4,176,81,0,20,0,25,21,36,102,4,
		176,25,0,106,8,72,105,116,32,84,111,112,0,9,
		20,2,36,105,4,7,36,113,4,95,3,92,40,8,
		29,171,1,36,116,4,103,17,0,121,15,28,10,36,
		117,4,176,39,0,20,0,36,120,4,103,17,0,93,
		231,3,5,28,6,36,121,4,7,36,126,4,103,13,
		0,176,24,0,103,12,0,12,1,35,29,97,1,36,
		128,4,104,13,0,170,36,130,4,103,13,0,176,24,
		0,103,12,0,12,1,34,28,23,103,12,0,103,13,
		0,1,92,3,1,31,11,36,131,4,104,13,0,170,
		25,220,36,134,4,176,24,0,103,12,0,12,1,103,
		13,0,49,83,80,0,36,136,4,109,80,0,121,8,
		28,12,36,137,4,104,19,0,109,32,0,135,36,140,
		4,103,13,0,176,24,0,103,12,0,12,1,15,28,
		47,36,141,4,176,25,0,176,51,0,106,25,78,227,
		111,32,104,225,32,73,116,101,110,115,32,97,32,78,
		97,118,101,103,97,114,46,32,0,12,1,9,20,2,
		36,142,4,7,36,145,4,9,82,18,0,36,148,4,
		103,13,0,95,9,15,29,138,0,36,150,4,103,20,
		0,121,8,28,20,36,151,4,176,44,0,109,45,0,
		109,32,0,18,12,1,82,20,0,36,156,4,176,46,
		0,92,2,176,6,0,106,11,74,97,110,77,101,110,
		117,83,117,98,0,106,7,72,97,110,100,108,101,0,
		12,2,104,19,0,104,20,0,176,24,0,103,12,0,
		12,1,104,22,0,104,21,0,122,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,176,6,0,106,11,74,97,110,77,101,110,117,83,
		117,98,0,106,7,72,101,105,103,104,116,0,12,2,
		20,10,25,43,36,160,4,176,60,0,176,6,0,106,
		11,74,97,110,77,101,110,117,83,117,98,0,106,7,
		72,65,78,68,76,69,0,12,2,93,0,2,92,90,
		121,20,4,36,164,4,176,81,0,20,0,25,24,36,
		188,4,176,63,0,106,12,72,105,116,32,66,111,116,
		116,111,109,33,0,20,1,36,193,4,7,36,198,4,
		95,3,92,27,8,28,103,36,201,4,103,11,0,31,
		32,36,202,4,176,82,0,12,0,28,22,36,203,4,
		176,83,0,20,0,36,204,4,176,83,0,20,0,36,
		205,4,7,36,209,4,9,82,11,0,36,211,4,121,
		82,3,0,36,212,4,121,82,4,0,36,213,4,121,
		82,13,0,36,214,4,121,82,17,0,36,215,4,176,
		21,0,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,20,1,36,221,4,95,
		3,92,13,5,28,117,36,224,4,103,11,0,31,40,
		36,225,4,176,25,0,106,23,77,111,100,111,32,84,
		101,99,108,97,32,110,227,111,32,65,116,105,118,97,
		100,111,0,9,20,2,36,226,4,7,36,229,4,122,
		82,13,0,36,230,4,122,82,15,0,36,232,4,9,
		83,41,0,36,233,4,176,60,0,176,6,0,106,18,
		87,105,110,95,77,101,110,117,80,114,105,110,99,105,
		112,97,108,0,106,7,72,65,78,68,76,69,0,12,
		2,93,1,2,92,90,121,20,4,36,239,4,95,3,
		92,40,8,29,23,1,36,243,4,103,11,0,31,40,
		36,244,4,176,25,0,106,23,77,111,100,111,32,84,
		101,99,108,97,32,110,227,111,32,65,116,105,118,97,
		100,111,0,9,20,2,36,245,4,7,36,249,4,103,
		3,0,176,24,0,103,2,0,12,1,35,29,193,0,
		36,251,4,104,3,0,170,36,253,4,121,82,17,0,
		36,0,5,103,3,0,176,24,0,103,2,0,12,1,
		34,28,23,103,2,0,103,3,0,1,92,3,1,31,
		11,36,1,5,104,3,0,170,25,220,36,4,5,103,
		3,0,176,24,0,103,2,0,12,1,15,28,47,36,
		5,5,176,25,0,176,51,0,106,25,78,227,111,32,
		104,225,32,73,116,101,110,115,32,97,32,78,97,118,
		101,103,97,114,46,32,0,12,1,9,20,2,36,6,
		5,7,36,10,5,9,83,41,0,36,11,5,176,60,
		0,176,6,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,106,7,72,65,
		78,68,76,69,0,12,2,93,0,2,92,90,121,20,
		4,36,13,5,176,55,0,101,154,153,153,153,153,153,
		185,63,10,1,20,1,25,24,36,17,5,176,63,0,
		106,12,72,105,116,32,66,111,116,116,111,109,33,0,
		20,1,36,25,5,95,3,92,38,8,29,148,0,36,
		27,5,103,11,0,31,40,36,28,5,176,25,0,106,
		23,77,111,100,111,32,84,101,99,108,97,32,110,227,
		111,32,65,116,105,118,97,100,111,0,9,20,2,36,
		29,5,7,36,33,5,103,3,0,122,15,28,73,36,
		35,5,104,3,0,169,36,36,5,9,83,41,0,36,
		37,5,176,60,0,176,6,0,106,18,87,105,110,95,
		77,101,110,117,80,114,105,110,99,105,112,97,108,0,
		106,7,72,65,78,68,76,69,0,12,2,93,0,2,
		92,90,121,20,4,36,44,5,121,82,17,0,25,20,
		36,48,5,176,63,0,106,8,72,105,116,32,84,111,
		112,0,20,1,36,57,5,95,3,92,9,8,29,160,
		0,36,59,5,103,11,0,68,82,11,0,36,62,5,
		103,11,0,28,92,36,63,5,122,82,3,0,36,64,
		5,9,83,41,0,36,65,5,121,82,17,0,36,67,
		5,176,60,0,176,6,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,106,
		7,72,65,78,68,76,69,0,12,2,93,0,2,92,
		90,121,20,4,36,68,5,176,55,0,101,154,153,153,
		153,153,153,185,63,10,1,20,1,25,51,36,73,5,
		121,82,3,0,36,74,5,121,82,4,0,36,75,5,
		121,82,17,0,36,76,5,176,21,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,20,1,36,95,5,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XHINTSETAD )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,116,85,0,36,101,5,106,1,0,80,1,
		36,102,5,121,80,2,36,103,5,9,80,3,36,105,
		5,103,17,0,103,13,0,8,29,251,0,36,107,5,
		106,37,83,101,116,97,32,112,97,114,97,32,97,32,
		68,105,114,101,105,116,97,32,65,98,114,101,32,77,
		97,105,115,32,79,112,231,245,101,115,0,80,1,36,
		108,5,176,6,0,106,11,74,97,110,77,101,110,117,
		83,117,98,0,106,4,82,111,119,0,12,2,103,13,
		0,122,49,109,32,0,65,72,92,18,49,80,2,36,
		112,5,176,35,0,106,8,87,105,110,95,77,115,103,
		0,12,1,31,62,36,113,5,176,36,0,95,2,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,6,87,105,100,116,104,0,12,2,92,25,49,
		176,13,0,95,1,12,1,100,101,0,0,0,0,0,
		0,224,63,10,1,20,5,25,68,36,115,5,176,37,
		0,95,1,95,2,176,6,0,106,11,74,97,110,77,
		101,110,117,83,117,98,0,106,4,67,111,108,0,12,
		2,176,6,0,106,11,74,97,110,77,101,110,117,83,
		117,98,0,106,6,87,105,100,116,104,0,12,2,72,
		92,10,72,20,3,36,117,5,176,38,0,95,1,20,
		1,36,118,5,120,80,3,36,122,5,95,3,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,85,0,22,0,116,85,0,121,82,1,0,4,0,
		0,82,2,0,121,82,3,0,121,82,4,0,106,1,
		0,82,5,0,121,82,6,0,121,82,7,0,9,82,
		8,0,9,82,9,0,120,82,10,0,9,82,11,0,
		4,0,0,82,12,0,121,82,13,0,9,82,14,0,
		121,82,15,0,106,1,0,82,16,0,121,82,17,0,
		9,82,18,0,121,82,19,0,121,82,20,0,9,82,
		21,0,120,82,22,0,7
	};

	hb_vmExecute( pcode, symbols );
}

