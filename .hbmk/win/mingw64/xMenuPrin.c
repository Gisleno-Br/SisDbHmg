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
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_EXTERN( __DBGENTRY );
HB_FUNC_INITSTATICS();
HB_FUNC_INITLINES();


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
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "__DBGENTRY", {HB_FS_PUBLIC}, {HB_FUNCNAME( __DBGENTRY )}, NULL },
{ "(_INITSTATICS00020)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL },
{ "(_INITLINES)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITLINES}, NULL }
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
		13,0,4,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,88,77,69,
		78,85,77,65,73,78,0,37,1,0,78,82,79,87,
		49,0,37,2,0,78,67,79,76,49,0,37,3,0,
		65,79,80,80,82,73,78,0,37,4,0,65,83,85,
		66,79,80,83,0,36,72,0,176,1,0,95,3,12,
		1,82,2,0,36,74,0,4,0,0,80,4,36,79,
		0,176,2,0,20,0,176,3,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,106,14,77,101,110,80,114,105,110,99,105,112,97,
		108,49,0,95,2,95,1,109,4,0,93,8,2,120,
		120,120,120,120,9,106,1,0,100,100,100,100,100,100,
		93,255,0,93,255,0,93,255,0,4,3,0,90,84,
		51,80,114,103,92,120,77,101,110,117,80,114,105,110,
		46,80,114,103,58,88,77,69,78,85,77,65,73,78,
		0,176,5,0,176,6,0,98,7,0,93,60,1,1,
		106,5,78,97,109,101,0,12,2,103,2,0,103,3,
		0,103,4,0,103,5,0,103,6,0,103,7,0,103,
		8,0,9,103,9,0,103,10,0,12,11,6,9,9,
		9,100,120,100,100,100,100,100,100,100,93,9,2,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,100,9,20,56,36,80,0,176,8,
		0,20,0,36,87,0,176,2,0,20,0,176,3,0,
		106,11,74,97,110,77,101,110,117,83,117,98,0,106,
		5,84,115,117,98,0,93,200,0,93,200,0,109,4,
		0,93,244,1,120,120,120,120,120,9,106,1,0,100,
		100,100,100,100,100,109,9,0,90,72,51,80,114,103,
		92,120,77,101,110,117,80,114,105,110,46,80,114,103,
		58,88,77,69,78,85,77,65,73,78,0,176,5,0,
		176,6,0,98,7,0,93,60,1,1,106,5,78,97,
		109,101,0,12,2,103,12,0,103,13,0,103,15,0,
		103,16,0,121,121,9,120,12,9,6,9,9,9,100,
		120,100,100,100,100,100,100,100,93,152,58,100,100,100,
		100,100,100,100,9,100,100,100,9,100,100,100,100,100,
		100,100,100,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,120,20,56,36,88,
		0,176,8,0,20,0,36,92,0,176,10,0,176,11,
		0,106,11,74,97,110,77,101,110,117,83,117,98,0,
		12,1,20,1,36,97,0,176,12,0,98,7,0,92,
		60,1,176,13,0,176,14,0,106,11,69,118,101,110,
		116,80,114,105,110,49,0,12,1,12,1,12,2,121,
		5,28,71,36,98,0,176,15,0,106,11,69,118,101,
		110,116,80,114,105,110,49,0,20,1,36,99,0,176,
		16,0,90,37,51,80,114,103,92,120,77,101,110,117,
		80,114,105,110,46,80,114,103,58,88,77,69,78,85,
		77,65,73,78,0,176,17,0,12,0,6,12,1,82,
		1,0,36,102,0,176,18,0,176,6,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,106,7,72,97,110,100,108,101,0,12,2,
		122,100,100,120,120,20,6,36,103,0,176,18,0,176,
		6,0,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,106,7,72,97,110,100,
		108,101,0,12,2,100,97,0,0,2,0,120,120,20,
		5,36,105,0,176,18,0,176,6,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,106,7,72,97,110,100,108,101,0,12,2,93,
		128,0,100,120,120,20,5,36,112,0,176,18,0,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,7,72,97,110,100,108,101,0,12,2,122,100,
		100,120,120,20,6,36,116,0,176,19,0,176,11,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,12,1,121,9,20,3,36,117,
		0,176,19,0,176,11,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,12,
		1,122,9,20,3,36,120,0,176,20,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,20,1,36,123,0,176,21,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,20,1,36,127,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTPRIN1 )
{
	static const HB_BYTE pcode[] =
	{
		13,9,4,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,69,86,69,
		78,84,80,82,73,78,49,0,37,1,0,78,72,87,
		78,68,0,37,2,0,78,77,83,71,0,37,3,0,
		78,87,80,65,82,65,77,0,37,4,0,78,76,80,
		65,82,65,77,0,36,134,0,37,5,0,67,79,80,
		67,65,79,0,106,1,0,80,5,36,135,0,37,6,
		0,78,67,79,76,0,121,80,6,36,136,0,37,7,
		0,78,82,79,87,0,121,80,7,36,137,0,37,8,
		0,65,82,49,0,36,138,0,37,9,0,78,73,78,
		68,50,0,121,80,9,36,139,0,37,10,0,67,84,
		80,49,0,106,1,0,80,10,36,141,0,37,11,0,
		78,82,79,87,49,0,121,80,11,36,143,0,37,12,
		0,78,82,79,87,50,0,121,80,12,36,144,0,37,
		13,0,78,67,79,76,50,0,121,80,13,36,151,0,
		95,1,176,6,0,106,11,74,97,110,77,101,110,117,
		83,117,98,0,106,7,72,65,78,68,76,69,0,12,
		2,8,29,185,3,103,6,0,121,15,29,177,3,36,
		154,0,95,2,93,163,2,8,28,44,103,18,0,28,
		39,36,156,0,121,82,13,0,36,157,0,121,82,15,
		0,36,158,0,176,21,0,95,1,20,1,36,159,0,
		176,23,0,95,1,93,0,127,20,2,36,165,0,95,
		2,93,1,2,8,29,119,0,36,168,0,103,13,0,
		176,24,0,103,12,0,12,1,34,28,101,36,170,0,
		103,12,0,103,13,0,1,92,3,1,31,50,36,171,
		0,176,23,0,95,1,93,0,127,20,2,36,172,0,
		176,25,0,106,20,79,112,231,227,111,32,73,110,100,
		105,115,112,111,110,105,118,101,108,46,0,9,20,2,
		36,173,0,7,36,176,0,103,12,0,103,13,0,1,
		92,4,1,100,69,28,21,36,177,0,48,26,0,103,
		12,0,103,13,0,1,92,4,1,112,0,73,36,186,
		0,95,2,93,0,2,8,29,240,2,36,192,0,103,
		13,0,121,15,28,43,36,193,0,103,13,0,176,27,
		0,106,11,74,97,110,77,101,110,117,83,117,98,0,
		121,176,24,0,103,12,0,12,1,121,12,4,5,28,
		6,36,194,0,7,36,198,0,176,27,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,121,176,24,0,
		103,12,0,12,1,121,12,4,82,13,0,36,199,0,
		176,6,0,106,11,74,97,110,77,101,110,117,83,117,
		98,0,106,11,86,115,99,114,111,108,108,66,97,114,
		0,106,6,86,97,108,117,101,0,12,3,66,80,11,
		36,203,0,103,13,0,176,24,0,103,12,0,12,1,
		34,28,34,36,204,0,103,12,0,103,13,0,1,92,
		3,1,31,19,36,205,0,176,23,0,95,1,93,0,
		127,20,2,36,206,0,7,36,211,0,176,23,0,95,
		1,109,28,0,20,2,36,214,0,103,15,0,121,15,
		28,53,36,215,0,176,29,0,106,11,74,97,110,77,
		101,110,117,83,117,98,0,104,15,0,104,13,0,121,
		20,4,36,217,0,103,14,0,28,17,36,218,0,176,
		30,0,20,0,36,219,0,9,82,14,0,36,226,0,
		103,13,0,121,15,28,13,36,227,0,103,13,0,82,
		15,0,25,6,36,229,0,7,36,233,0,103,13,0,
		121,15,29,200,0,36,235,0,176,31,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,95,11,103,13,
		0,122,49,109,32,0,65,72,121,109,4,0,109,32,
		0,122,49,120,20,6,36,239,0,103,13,0,176,24,
		0,103,12,0,12,1,34,29,139,0,176,24,0,103,
		12,0,103,13,0,1,12,1,92,5,16,28,121,36,
		241,0,103,12,0,103,13,0,1,92,5,1,28,106,
		36,243,0,121,80,12,36,244,0,121,80,13,36,247,
		0,176,33,0,96,13,0,96,12,0,20,2,36,250,
		0,48,26,0,103,12,0,103,13,0,1,92,6,1,
		95,12,109,32,0,49,92,15,72,176,6,0,106,11,
		74,97,110,77,101,110,117,83,117,98,0,106,4,67,
		111,108,0,12,2,109,4,0,72,122,72,112,2,73,
		36,252,0,103,13,0,82,17,0,36,254,0,120,82,
		14,0,36,1,1,7,36,10,1,103,13,0,176,24,
		0,103,12,0,12,1,34,29,227,0,176,34,0,176,
		13,0,103,12,0,103,13,0,1,92,2,1,12,1,
		12,1,32,204,0,36,12,1,176,13,0,103,12,0,
		103,13,0,1,92,2,1,12,1,80,10,36,14,1,
		121,80,11,36,17,1,176,33,0,96,6,0,96,11,
		0,20,2,36,19,1,176,35,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,62,36,20,1,176,36,
		0,95,11,176,6,0,106,11,74,97,110,77,101,110,
		117,83,117,98,0,106,6,87,105,100,116,104,0,12,
		2,92,15,49,176,13,0,95,10,12,1,100,101,0,
		0,0,0,0,0,224,63,10,1,20,5,25,71,36,
		22,1,176,37,0,95,10,95,11,92,15,72,176,6,
		0,106,11,74,97,110,77,101,110,117,83,117,98,0,
		106,4,67,111,108,0,12,2,176,6,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,106,6,87,105,
		100,116,104,0,12,2,72,92,10,72,20,3,36,25,
		1,176,38,0,95,10,20,1,25,10,36,29,1,176,
		39,0,20,0,36,34,1,176,40,0,95,1,12,1,
		82,18,0,36,48,1,95,1,176,6,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,106,7,72,97,110,100,108,101,0,12,2,
		8,29,69,10,36,51,1,95,2,93,163,2,8,29,
		49,1,109,41,0,29,43,1,36,55,1,176,34,0,
		176,13,0,103,5,0,12,1,12,1,28,56,36,57,
		1,103,4,0,121,15,29,195,0,36,58,1,121,82,
		3,0,36,59,1,121,82,4,0,36,60,1,176,21,
		0,95,1,20,1,36,61,1,176,23,0,95,1,93,
		0,127,20,2,36,62,1,26,152,0,36,66,1,103,
		4,0,121,15,28,69,103,4,0,103,3,0,69,28,
		60,36,67,1,121,82,3,0,36,68,1,176,29,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,104,4,0,104,3,0,103,3,
		0,103,6,0,16,28,7,109,42,0,25,3,121,122,
		49,20,4,36,72,1,176,35,0,106,8,87,105,110,
		95,77,115,103,0,12,1,28,50,36,73,1,176,43,
		0,176,11,0,106,8,87,105,110,95,77,115,103,0,
		12,1,12,1,28,25,36,74,1,176,10,0,176,11,
		0,106,8,87,105,110,95,77,115,103,0,12,1,20,
		1,36,78,1,7,36,84,1,9,83,41,0,36,87,
		1,176,35,0,106,8,87,105,110,95,77,115,103,0,
		12,1,28,50,36,88,1,176,43,0,176,11,0,106,
		8,87,105,110,95,77,115,103,0,12,1,12,1,28,
		25,36,89,1,176,10,0,176,11,0,106,8,87,105,
		110,95,77,115,103,0,12,1,20,1,36,98,1,95,
		2,93,1,2,8,29,168,3,36,100,1,176,6,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,106,11,86,115,99,114,111,108,
		108,66,97,114,0,106,6,86,97,108,117,101,0,12,
		3,66,80,11,36,104,1,103,8,0,29,18,1,95,
		3,92,90,69,29,10,1,36,106,1,103,20,0,121,
		8,28,20,36,107,1,176,44,0,109,45,0,109,32,
		0,18,12,1,82,20,0,36,112,1,103,3,0,93,
		232,3,5,28,108,36,117,1,176,46,0,92,2,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,7,72,97,110,100,108,101,0,12,2,104,19,
		0,104,20,0,109,47,0,104,10,0,104,9,0,103,
		6,0,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,176,6,0,106,11,74,
		97,110,77,101,110,117,83,117,98,0,106,7,72,101,
		105,103,104,116,0,12,2,20,10,36,118,1,7,36,
		123,1,103,3,0,93,208,7,5,28,107,36,126,1,
		176,46,0,122,176,6,0,106,11,74,97,110,77,101,
		110,117,83,117,98,0,106,7,72,97,110,100,108,101,
		0,12,2,104,19,0,104,20,0,109,47,0,104,10,
		0,104,9,0,103,6,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,176,
		6,0,106,11,74,97,110,77,101,110,117,83,117,98,
		0,106,7,72,101,105,103,104,116,0,12,2,20,10,
		36,127,1,7,36,134,1,103,6,0,121,15,28,26,
		36,135,1,176,48,0,106,11,74,97,110,77,101,110,
		117,83,117,98,0,95,1,9,20,3,36,140,1,103,
		5,0,83,49,0,36,142,1,176,34,0,176,13,0,
		103,5,0,12,1,12,1,32,147,0,36,144,1,176,
		12,0,103,2,0,89,73,0,1,0,0,0,51,80,
		114,103,92,120,77,101,110,117,80,114,105,110,46,80,
		114,103,58,69,86,69,78,84,80,82,73,78,49,0,
		37,1,0,65,0,176,50,0,95,1,122,1,176,24,
		0,95,1,122,1,12,1,92,2,49,12,2,176,13,
		0,103,5,0,12,1,8,6,12,2,80,9,36,146,
		1,95,9,121,15,28,51,36,147,1,176,31,0,106,
		18,87,105,110,95,77,101,110,117,80,114,105,110,99,
		105,112,97,108,0,95,11,95,9,122,49,109,32,0,
		65,72,121,109,4,0,109,32,0,122,49,120,20,6,
		36,153,1,103,4,0,121,15,28,39,36,154,1,176,
		29,0,106,18,87,105,110,95,77,101,110,117,80,114,
		105,110,99,105,112,97,108,0,104,4,0,104,3,0,
		103,7,0,20,4,36,157,1,103,3,0,121,8,31,
		16,103,3,0,176,24,0,103,2,0,12,1,15,28,
		6,36,158,1,7,36,161,1,176,13,0,176,50,0,
		103,2,0,103,3,0,1,122,1,176,24,0,103,2,
		0,103,3,0,1,122,1,12,1,92,2,49,12,2,
		12,1,80,5,36,162,1,95,5,82,5,0,36,165,
		1,103,5,0,109,49,0,8,28,23,36,167,1,9,
		82,8,0,36,168,1,176,48,0,95,1,20,1,36,
		170,1,7,36,174,1,103,3,0,121,15,28,56,36,
		175,1,176,31,0,106,18,87,105,110,95,77,101,110,
		117,80,114,105,110,99,105,112,97,108,0,103,7,0,
		95,11,72,103,3,0,122,49,109,32,0,65,72,121,
		109,4,0,109,32,0,122,49,120,20,6,36,179,1,
		103,3,0,121,15,28,11,36,180,1,103,3,0,82,
		4,0,36,185,1,103,2,0,103,3,0,1,92,3,
		1,31,42,36,186,1,176,25,0,176,51,0,106,20,
		79,112,231,227,111,32,73,110,100,105,115,112,111,110,
		105,118,101,108,46,0,12,1,9,20,2,36,187,1,
		7,36,191,1,103,14,0,28,38,36,192,1,176,30,
		0,20,0,36,194,1,176,21,0,106,18,87,105,110,
		95,77,101,110,117,80,114,105,110,99,105,112,97,108,
		0,20,1,36,197,1,103,3,0,109,32,0,65,80,
		11,36,198,1,176,52,0,106,11,74,97,110,77,101,
		110,117,83,117,98,0,176,13,0,176,53,0,103,3,
		0,12,1,12,1,106,2,45,0,72,95,5,72,95,
		11,20,3,36,208,1,95,2,93,0,2,8,31,10,
		95,3,92,90,5,29,71,5,36,210,1,103,3,0,
		83,54,0,36,214,1,103,3,0,121,15,28,54,36,
		215,1,103,3,0,176,27,0,106,18,87,105,110,95,
		77,101,110,117,80,114,105,110,99,105,112,97,108,0,
		103,7,0,176,24,0,103,2,0,12,1,103,6,0,
		12,4,8,28,6,36,216,1,7,36,221,1,95,3,
		92,90,69,28,47,36,222,1,176,27,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,103,7,0,176,24,0,103,2,0,12,1,
		103,6,0,12,4,82,3,0,36,225,1,103,14,0,
		28,36,36,226,1,103,17,0,103,3,0,69,28,24,
		36,227,1,176,30,0,20,0,36,228,1,121,82,17,
		0,36,229,1,9,82,14,0,36,235,1,103,3,0,
		93,232,3,5,31,12,103,3,0,93,208,7,5,29,
		140,0,36,237,1,109,54,0,121,15,28,61,36,238,
		1,176,29,0,106,18,87,105,110,95,77,101,110,117,
		80,114,105,110,99,105,112,97,108,0,109,54,0,109,
		54,0,109,54,0,103,6,0,15,28,17,103,8,0,
		28,7,103,7,0,25,8,103,7,0,25,3,121,20,
		4,36,243,1,103,3,0,93,232,3,5,28,24,103,
		9,0,28,19,36,244,1,176,23,0,95,1,93,0,
		127,20,2,36,245,1,7,36,249,1,103,3,0,93,
		208,7,5,28,24,103,10,0,28,19,36,250,1,176,
		23,0,95,1,93,0,127,20,2,36,251,1,7,36,
		5,2,103,3,0,103,4,0,5,28,15,103,3,0,
		93,232,3,69,28,6,36,6,2,7,36,11,2,176,
		23,0,95,1,109,28,0,20,2,36,13,2,103,3,
		0,176,24,0,103,2,0,12,1,15,29,193,0,103,
		3,0,93,232,3,35,29,183,0,36,16,2,176,34,
		0,176,13,0,103,5,0,12,1,12,1,28,85,36,
		18,2,103,4,0,121,15,28,122,36,19,2,121,82,
		4,0,36,20,2,121,82,3,0,36,21,2,121,82,
		6,0,36,22,2,176,21,0,106,18,87,105,110,95,
		77,101,110,117,80,114,105,110,99,105,112,97,108,0,
		20,1,36,23,2,176,55,0,101,154,153,153,153,153,
		153,185,63,10,1,20,1,36,24,2,25,49,36,28,
		2,103,4,0,121,15,28,39,36,29,2,176,29,0,
		106,18,87,105,110,95,77,101,110,117,80,114,105,110,
		99,105,112,97,108,0,104,4,0,104,3,0,103,7,
		0,20,4,36,34,2,121,82,4,0,36,36,2,176,
		23,0,95,1,93,0,127,20,2,36,37,2,176,39,
		0,20,0,36,39,2,7,36,44,2,103,3,0,93,
		232,3,16,28,6,36,45,2,7,36,49,2,103,4,
		0,83,56,0,36,55,2,103,4,0,121,15,28,61,
		36,56,2,176,29,0,106,18,87,105,110,95,77,101,
		110,117,80,114,105,110,99,105,112,97,108,0,104,4,
		0,104,3,0,103,4,0,103,6,0,15,28,17,103,
		8,0,28,7,103,7,0,25,8,103,7,0,25,3,
		121,20,4,36,60,2,103,3,0,121,15,28,13,36,
		61,2,103,3,0,82,4,0,25,6,36,63,2,7,
		36,67,2,176,13,0,176,50,0,103,2,0,103,3,
		0,1,122,1,176,24,0,103,2,0,103,3,0,1,
		122,1,12,1,92,2,49,12,2,12,1,80,5,36,
		71,2,103,4,0,121,15,28,60,103,4,0,176,24,
		0,103,2,0,12,1,34,28,46,36,72,2,176,13,
		0,176,50,0,103,2,0,103,4,0,1,122,1,176,
		24,0,103,2,0,103,4,0,1,122,1,12,1,92,
		2,49,12,2,12,1,83,57,0,25,19,36,75,2,
		176,40,0,95,1,12,1,83,41,0,36,76,2,7,
		36,85,2,176,23,0,95,1,109,28,0,20,2,36,
		87,2,176,6,0,106,18,87,105,110,95,77,101,110,
		117,80,114,105,110,99,105,112,97,108,0,106,11,86,
		115,99,114,111,108,108,66,97,114,0,106,6,86,97,
		108,117,101,0,12,3,66,80,11,36,90,2,176,13,
		0,95,5,12,1,83,57,0,36,95,2,103,3,0,
		121,15,29,173,0,36,97,2,103,2,0,103,3,0,
		1,92,3,1,31,27,36,98,2,176,23,0,95,1,
		93,0,127,20,2,36,99,2,176,39,0,20,0,36,
		100,2,7,36,103,2,103,3,0,103,6,0,16,28,
		70,36,104,2,176,31,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,103,
		8,0,28,9,103,7,0,121,72,25,5,103,7,0,
		95,11,72,103,3,0,122,49,109,32,0,65,72,121,
		109,4,0,109,32,0,122,49,120,20,6,25,52,36,
		106,2,176,31,0,106,18,87,105,110,95,77,101,110,
		117,80,114,105,110,99,105,112,97,108,0,95,11,103,
		3,0,122,49,109,32,0,65,72,121,109,4,0,109,
		32,0,122,49,120,20,6,36,116,2,95,3,92,90,
		69,29,7,1,36,118,2,176,34,0,176,13,0,103,
		2,0,103,3,0,1,92,2,1,12,1,12,1,31,
		64,36,119,2,176,13,0,103,2,0,103,3,0,1,
		92,2,1,12,1,106,3,32,32,0,72,176,13,0,
		176,53,0,109,56,0,12,1,12,1,72,106,5,32,
		32,32,32,0,72,176,13,0,176,53,0,103,3,0,
		12,1,12,1,72,80,10,36,124,2,176,34,0,176,
		13,0,95,10,12,1,12,1,32,137,0,36,126,2,
		121,80,11,36,128,2,176,33,0,96,6,0,96,11,
		0,20,2,36,130,2,176,35,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,69,36,131,2,176,36,
		0,95,11,176,6,0,106,18,87,105,110,95,77,101,
		110,117,80,114,105,110,99,105,112,97,108,0,106,6,
		87,105,100,116,104,0,12,2,92,15,49,176,13,0,
		95,10,12,1,100,101,0,0,0,0,0,0,224,63,
		10,1,20,5,25,17,36,133,2,176,37,0,95,10,
		95,11,92,15,72,20,2,36,136,2,176,38,0,95,
		10,20,1,25,10,36,140,2,176,39,0,20,0,36,
		144,2,176,40,0,95,1,12,1,83,41,0,36,160,
		2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCLOSEMPRIN )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,88,67,76,
		79,83,69,77,80,82,73,78,0,36,165,2,37,1,
		0,78,73,49,0,121,80,1,36,167,2,37,2,0,
		78,72,65,78,68,76,69,49,0,176,59,0,106,14,
		77,101,110,80,114,105,110,99,105,112,97,108,49,0,
		12,1,80,2,36,168,2,37,3,0,78,72,65,78,
		68,76,69,50,0,176,59,0,106,5,84,115,117,98,
		0,12,1,80,3,36,171,2,95,2,121,15,29,242,
		0,36,175,2,176,60,0,95,2,93,18,1,97,96,
		240,0,0,121,20,4,36,177,2,176,61,0,20,0,
		36,178,2,176,61,0,20,0,36,180,2,176,60,0,
		95,2,93,18,1,92,2,121,20,4,36,183,2,95,
		3,121,15,28,61,36,185,2,176,60,0,95,3,93,
		18,1,97,96,240,0,0,121,20,4,36,187,2,176,
		61,0,20,0,36,188,2,176,61,0,20,0,36,190,
		2,176,60,0,95,3,93,18,1,92,2,121,20,4,
		36,192,2,176,61,0,20,0,36,198,2,176,62,0,
		106,11,69,118,101,110,116,77,101,110,117,49,0,12,
		1,31,42,36,199,2,176,63,0,106,30,69,114,114,
		111,32,97,111,32,114,101,109,111,118,101,114,32,72,
		97,110,100,108,101,32,69,118,101,110,116,46,0,20,
		1,36,203,2,176,64,0,103,1,0,12,1,31,46,
		36,204,2,176,63,0,106,34,69,114,114,111,32,97,
		111,32,114,101,109,111,118,101,114,32,72,97,110,100,
		108,101,32,69,118,101,110,116,32,50,50,32,46,0,
		20,1,36,214,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDROPDOWN )
{
	static const HB_BYTE pcode[] =
	{
		13,6,3,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,88,68,82,
		79,80,68,79,87,78,0,37,1,0,67,74,65,78,
		69,76,65,83,85,66,0,37,2,0,67,77,69,78,
		85,68,69,83,67,0,37,3,0,78,84,79,80,88,
		49,0,36,220,2,37,4,0,78,73,78,68,73,67,
		69,0,176,12,0,103,2,0,89,74,0,1,0,1,
		0,2,0,51,80,114,103,92,120,77,101,110,117,80,
		114,105,110,46,80,114,103,58,88,68,82,79,80,68,
		79,87,78,0,37,255,255,67,77,69,78,85,68,69,
		83,67,0,37,1,0,65,0,176,13,0,95,1,122,
		1,12,1,176,13,0,95,255,12,1,8,6,12,2,
		80,4,36,222,2,37,5,0,78,76,73,78,82,79,
		87,0,36,223,2,37,6,0,78,76,73,78,69,88,
		49,0,36,224,2,37,7,0,78,73,78,67,82,69,
		77,69,78,84,79,0,36,226,2,37,8,0,78,84,
		79,80,0,95,3,80,8,36,230,2,37,9,0,78,
		73,84,69,77,77,65,88,0,176,44,0,109,45,0,
		109,32,0,18,12,1,80,9,36,233,2,95,4,83,
		65,0,36,237,2,95,4,121,34,28,34,36,238,2,
		176,63,0,106,18,70,97,108,104,97,32,101,109,32,
		83,121,115,116,101,109,32,48,0,20,1,36,239,2,
		7,36,242,2,121,83,47,0,36,243,2,176,66,0,
		109,67,0,89,91,0,1,0,1,0,4,0,51,80,
		114,103,92,120,77,101,110,117,80,114,105,110,46,80,
		114,103,58,88,68,82,79,80,68,79,87,78,0,37,
		255,255,78,73,78,68,73,67,69,0,37,1,0,65,
		0,176,68,0,95,1,122,1,122,12,2,176,13,0,
		176,53,0,95,255,12,1,12,1,8,28,12,109,47,
		0,21,23,83,47,0,25,3,100,6,20,2,36,245,
		2,95,4,82,6,0,36,247,2,4,0,0,82,12,
		0,36,250,2,9,82,8,0,36,253,2,109,47,0,
		95,9,16,28,49,36,254,2,176,69,0,95,1,106,
		7,72,101,105,103,104,116,0,109,45,0,20,3,36,
		0,3,109,45,0,109,32,0,92,2,65,72,82,7,
		0,36,1,3,120,82,8,0,25,37,36,3,3,109,
		32,0,109,47,0,65,82,7,0,36,4,3,176,69,
		0,95,1,106,7,72,101,105,103,104,116,0,103,7,
		0,20,3,36,10,3,176,69,0,95,1,106,4,67,
		111,108,0,122,20,3,36,14,3,176,19,0,176,11,
		0,95,1,12,1,121,9,20,3,36,16,3,176,19,
		0,176,11,0,95,1,12,1,122,9,20,3,36,18,
		3,4,0,0,82,12,0,36,21,3,95,4,109,32,
		0,65,80,5,36,22,3,176,69,0,95,1,106,4,
		82,111,119,0,95,5,20,3,36,26,3,176,69,0,
		95,1,106,8,86,105,115,105,98,108,101,0,120,20,
		3,36,30,3,176,66,0,109,67,0,89,93,0,1,
		0,1,0,4,0,51,80,114,103,92,120,77,101,110,
		117,80,114,105,110,46,80,114,103,58,88,68,82,79,
		80,68,79,87,78,0,37,255,255,78,73,78,68,73,
		67,69,0,37,1,0,65,0,176,68,0,95,1,122,
		1,122,12,2,176,13,0,176,53,0,95,255,12,1,
		12,1,8,28,14,176,70,0,103,12,0,95,1,12,
		2,25,3,100,6,20,2,36,31,3,176,13,0,95,
		2,12,1,83,71,0,36,34,3,176,21,0,95,1,
		20,1,36,36,3,176,72,0,95,1,106,5,83,104,
		111,119,0,20,2,36,39,3,176,21,0,106,18,87,
		105,110,95,77,101,110,117,80,114,105,110,99,105,112,
		97,108,0,20,1,36,41,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRESTMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,88,82,69,
		83,84,77,69,78,85,0,37,1,0,67,74,83,65,
		78,83,85,66,49,0,37,2,0,78,72,65,78,68,
		76,69,0,37,3,0,76,90,69,82,65,86,65,82,
		83,0,36,47,3,95,3,100,8,28,5,120,25,4,
		95,3,80,3,36,50,3,95,3,28,39,36,51,3,
		106,1,0,82,5,0,36,52,3,121,82,3,0,36,
		53,3,121,82,4,0,36,54,3,121,82,7,0,36,
		55,3,121,82,6,0,36,60,3,176,35,0,95,1,
		12,1,28,19,36,61,3,176,72,0,95,1,106,5,
		72,105,100,101,0,20,2,36,66,3,176,73,0,95,
		2,121,20,2,36,68,3,176,21,0,106,18,87,105,
		110,95,77,101,110,117,80,114,105,110,99,105,112,97,
		108,0,20,1,36,70,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOPSELPOS )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,88,79,80,
		83,69,76,80,79,83,0,37,1,0,67,74,65,78,
		0,37,2,0,78,72,69,73,84,50,0,37,3,0,
		78,73,84,77,65,88,0,37,4,0,78,73,84,68,
		79,80,82,69,68,0,36,75,3,37,5,0,78,67,
		79,76,0,121,80,5,36,76,3,37,6,0,78,82,
		79,87,0,121,80,6,36,77,3,37,7,0,65,82,
		49,0,36,78,3,37,8,0,78,69,87,80,79,83,
		0,36,79,3,37,9,0,78,82,79,87,49,0,176,
		6,0,95,1,106,11,86,115,99,114,111,108,108,66,
		97,114,0,106,6,86,97,108,117,101,0,12,3,66,
		80,9,36,80,3,37,10,0,78,73,65,49,0,37,
		11,0,78,73,65,50,0,36,82,3,37,12,0,78,
		73,84,69,77,0,121,80,12,36,86,3,95,2,100,
		8,28,5,121,25,4,95,2,80,2,36,87,3,95,
		4,100,8,28,5,121,25,4,95,4,80,4,36,89,
		3,176,33,0,96,5,0,96,6,0,20,2,36,91,
		3,176,74,0,176,11,0,95,1,12,1,95,6,95,
		5,12,3,80,7,36,94,3,176,75,0,176,11,0,
		95,1,12,1,122,12,2,80,8,36,96,3,95,8,
		121,15,28,27,36,97,3,176,44,0,95,8,95,7,
		122,1,72,109,32,0,18,12,1,122,72,80,12,25,
		22,36,100,3,176,44,0,95,7,122,1,109,32,0,
		18,12,1,122,72,80,12,36,105,3,95,2,121,15,
		28,58,95,2,95,7,122,1,35,28,49,95,2,109,
		32,0,16,28,41,95,7,122,1,95,3,109,32,0,
		65,15,28,28,36,106,3,176,44,0,95,8,95,7,
		122,1,95,2,49,109,32,0,18,72,12,1,122,72,
		80,12,36,109,3,95,7,122,1,95,2,49,122,8,
		28,11,36,110,3,95,4,122,72,80,12,36,115,3,
		103,8,0,28,86,36,117,3,95,4,109,32,0,65,
		109,45,0,72,80,10,36,118,3,95,10,109,32,0,
		92,2,65,72,80,11,36,120,3,95,7,122,1,95,
		10,16,28,45,95,7,122,1,95,11,34,28,36,36,
		123,3,95,7,122,1,95,10,109,32,0,72,35,28,
		12,36,124,3,93,232,3,80,12,25,10,36,126,3,
		93,208,7,80,12,36,133,3,176,76,0,95,12,20,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( SCROLLMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,3,11,51,80,114,103,92,120,77,101,110,117,80,
		114,105,110,46,80,114,103,58,83,67,82,79,76,76,
		77,69,78,85,0,37,1,0,78,68,73,82,69,67,
		65,79,0,37,2,0,72,87,78,68,49,0,37,3,
		0,78,83,67,82,49,0,37,4,0,78,80,79,78,
		84,69,73,82,79,0,37,5,0,78,84,79,84,65,
		76,0,37,6,0,76,72,84,80,0,37,7,0,76,
		72,84,66,0,37,8,0,78,68,82,79,80,0,37,
		9,0,67,74,65,78,69,76,65,0,37,10,0,78,
		72,69,73,71,72,84,49,0,37,11,0,76,73,78,
		86,65,76,73,68,65,84,69,0,36,140,3,37,12,
		0,76,79,75,0,120,80,12,36,141,3,37,13,0,
		78,76,73,78,69,83,69,84,65,0,95,10,80,13,
		36,144,3,37,14,0,78,73,84,69,78,83,0,176,
		44,0,109,45,0,109,32,0,18,12,1,80,14,36,
		146,3,95,11,100,8,28,5,120,25,4,95,11,80,
		11,36,151,3,95,1,92,2,8,29,177,0,36,154,
		3,95,7,31,119,36,157,3,96,3,0,109,32,0,
		135,36,158,3,174,4,0,36,160,3,9,80,6,36,
		165,3,95,11,28,31,36,167,3,176,31,0,95,9,
		95,8,109,32,0,65,95,13,72,92,16,72,121,109,
		4,0,92,16,120,20,6,36,171,3,95,4,95,5,
		5,29,10,1,36,172,3,120,80,7,36,174,3,95,
		11,29,252,0,36,176,3,176,31,0,95,9,95,8,
		109,32,0,65,95,13,72,122,49,121,109,4,0,92,
		16,120,20,6,36,179,3,26,218,0,36,182,3,176,
		25,0,176,51,0,106,22,79,112,231,227,111,32,78,
		227,111,32,68,105,115,112,111,110,105,118,101,108,46,
		0,12,1,9,20,2,36,183,3,9,80,12,36,184,
		3,26,168,0,36,195,3,95,6,31,116,36,197,3,
		96,3,0,109,32,0,136,36,198,3,173,4,0,36,
		200,3,9,80,7,36,202,3,95,11,28,30,36,204,
		3,176,31,0,95,9,95,8,109,32,0,65,95,13,
		72,122,49,121,109,4,0,92,16,120,20,6,36,208,
		3,95,4,95,14,8,28,93,36,209,3,120,80,6,
		36,211,3,95,11,28,80,36,213,3,176,31,0,95,
		9,95,8,109,32,0,65,95,13,72,92,16,72,121,
		109,4,0,92,16,120,20,6,36,216,3,25,46,36,
		219,3,176,25,0,176,51,0,106,22,79,112,231,227,
		111,32,78,227,111,32,68,105,115,112,111,110,105,118,
		101,108,46,0,12,1,9,20,2,36,220,3,9,80,
		12,36,227,3,95,12,28,14,36,228,3,176,73,0,
		95,2,95,3,20,2,36,232,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XTECLASMENU )
{
	static const HB_BYTE pcode[] =
	{
		13,7,0,116,82,0,51,80,114,103,92,120,77,101,
		110,117,80,114,105,110,46,80,114,103,58,88,84,69,
		67,76,65,83,77,69,78,85,0,36,236,3,37,1,
		0,78,72,87,78,68,0,176,77,0,12,0,80,1,
		36,237,3,37,2,0,78,77,83,71,0,176,78,0,
		12,0,80,2,36,238,3,37,3,0,78,87,80,65,
		82,65,77,0,176,79,0,12,0,80,3,36,239,3,
		37,4,0,78,67,79,78,84,73,84,69,78,83,0,
		121,80,4,36,240,3,37,5,0,78,81,84,0,121,
		80,5,36,241,3,37,6,0,78,82,79,87,0,121,
		80,6,36,242,3,37,7,0,78,73,78,68,73,67,
		69,0,36,251,3,95,2,93,0,1,8,29,188,2,
		36,254,3,103,14,0,28,20,36,255,3,176,63,0,
		106,4,111,107,50,0,20,1,36,1,4,7,36,6,
		4,95,3,92,27,8,28,51,36,8,4,9,82,11,
		0,36,11,4,121,82,3,0,36,12,4,121,82,4,
		0,36,13,4,176,21,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,20,
		1,36,19,4,95,3,92,13,5,28,103,36,22,4,
		103,11,0,31,40,36,23,4,176,25,0,106,23,77,
		111,100,111,32,84,101,99,108,97,32,110,227,111,32,
		65,116,105,118,97,100,111,0,9,20,2,36,24,4,
		7,36,27,4,9,83,41,0,36,28,4,176,60,0,
		176,6,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,106,7,72,65,78,
		68,76,69,0,12,2,93,1,2,92,90,121,20,4,
		36,36,4,95,3,92,40,8,29,171,0,36,40,4,
		103,11,0,31,40,36,41,4,176,25,0,106,23,77,
		111,100,111,32,84,101,99,108,97,32,110,227,111,32,
		65,116,105,118,97,100,111,0,9,20,2,36,42,4,
		7,36,46,4,103,3,0,176,24,0,103,2,0,12,
		1,35,28,85,36,48,4,104,3,0,170,36,49,4,
		9,83,41,0,36,50,4,176,60,0,176,6,0,106,
		18,87,105,110,95,77,101,110,117,80,114,105,110,99,
		105,112,97,108,0,106,7,72,65,78,68,76,69,0,
		12,2,93,0,2,92,90,121,20,4,36,52,4,176,
		55,0,101,154,153,153,153,153,153,185,63,10,1,20,
		1,25,24,36,56,4,176,63,0,106,12,72,105,116,
		32,66,111,116,116,111,109,33,0,20,1,36,64,4,
		95,3,92,38,8,29,160,0,36,66,4,103,11,0,
		31,40,36,67,4,176,25,0,106,23,77,111,100,111,
		32,84,101,99,108,97,32,110,227,111,32,65,116,105,
		118,97,100,111,0,9,20,2,36,68,4,7,36,72,
		4,103,3,0,122,15,28,85,36,74,4,104,3,0,
		169,36,75,4,9,83,41,0,36,76,4,176,60,0,
		176,6,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,106,7,72,65,78,
		68,76,69,0,12,2,93,0,2,92,90,121,20,4,
		36,78,4,176,55,0,101,154,153,153,153,153,153,185,
		63,10,1,20,1,25,20,36,82,4,176,63,0,106,
		8,72,105,116,32,84,111,112,0,20,1,36,91,4,
		95,3,92,9,8,29,146,0,36,93,4,103,11,0,
		68,82,11,0,36,96,4,103,11,0,28,85,36,97,
		4,122,82,3,0,36,98,4,9,83,41,0,36,99,
		4,176,60,0,176,6,0,106,18,87,105,110,95,77,
		101,110,117,80,114,105,110,99,105,112,97,108,0,106,
		7,72,65,78,68,76,69,0,12,2,93,0,2,92,
		90,121,20,4,36,100,4,176,55,0,101,154,153,153,
		153,153,153,185,63,10,1,20,1,25,44,36,105,4,
		121,82,3,0,36,106,4,121,82,4,0,36,107,4,
		176,21,0,106,18,87,105,110,95,77,101,110,117,80,
		114,105,110,99,105,112,97,108,0,20,1,36,126,4,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,82,0,20,0,116,82,0,51,80,114,103,92,120,
		77,101,110,117,80,114,105,110,46,80,114,103,58,40,
		95,73,78,73,84,83,84,65,84,73,67,83,41,0,
		121,82,1,0,118,1,1,0,78,73,78,68,69,88,
		69,86,69,78,84,89,0,4,0,0,82,2,0,118,
		1,2,0,65,79,80,67,79,69,83,0,121,82,3,
		0,118,1,3,0,78,77,65,73,78,83,69,76,0,
		121,82,4,0,118,1,4,0,78,67,76,69,65,82,
		83,69,76,0,106,1,0,82,5,0,118,1,5,0,
		67,79,80,77,65,73,78,83,69,76,0,121,82,6,
		0,118,1,6,0,78,73,84,69,77,68,82,79,80,
		49,0,121,82,7,0,118,1,7,0,78,72,69,73,
		71,72,84,68,82,79,80,0,9,82,8,0,118,1,
		8,0,76,83,69,84,65,83,68,79,87,78,0,9,
		82,9,0,118,1,9,0,76,95,72,84,84,66,0,
		120,82,10,0,118,1,10,0,76,95,72,84,84,80,
		0,9,82,11,0,118,1,11,0,76,77,79,68,69,
		84,69,67,76,65,0,4,0,0,82,12,0,118,1,
		12,0,65,79,80,88,49,0,121,82,13,0,118,1,
		13,0,78,73,84,69,77,88,49,0,9,82,14,0,
		118,1,14,0,76,83,85,66,79,80,69,78,0,121,
		82,15,0,118,1,15,0,78,73,84,69,77,67,76,
		82,0,106,1,0,82,16,0,118,1,16,0,67,79,
		80,83,69,76,89,0,121,82,17,0,118,1,17,0,
		78,73,68,77,69,78,85,49,0,9,82,18,0,118,
		1,18,0,76,84,82,65,67,75,73,78,71,49,52,
		50,0,121,82,19,0,118,1,19,0,78,83,67,82,
		76,73,78,0,121,82,20,0,118,1,20,0,78,76,
		73,78,72,65,65,84,85,65,76,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITLINES()
{
	static const HB_BYTE pcode[] =
	{
		51,80,114,103,92,120,77,101,110,117,80,114,105,110,
		46,80,114,103,58,40,95,73,78,73,84,76,73,78,
		69,83,41,0,106,18,80,114,103,92,120,77,101,110,
		117,80,114,105,110,46,80,114,103,0,92,72,106,136,
		133,129,17,206,2,49,137,192,175,129,244,32,61,3,
		4,199,120,200,14,44,138,154,84,2,84,90,34,4,
		0,137,126,28,71,144,3,20,13,97,200,192,80,13,
		102,166,197,24,142,101,0,197,97,62,104,56,14,96,
		40,253,49,180,48,130,177,136,25,160,132,158,5,208,
		80,45,17,1,0,161,137,150,90,193,24,64,208,69,
		226,172,100,27,68,101,196,148,130,252,48,84,248,197,
		74,19,102,104,89,32,48,133,100,161,88,201,1,104,
		21,43,25,24,241,7,200,66,57,200,25,16,71,23,
		1,29,93,4,40,31,14,0,64,0,4,3,0,4,
		1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

