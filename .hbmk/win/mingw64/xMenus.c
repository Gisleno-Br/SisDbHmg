/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\xMenus.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XMENUOP );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( ACLONE );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( _SHOWWINDOW );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC( XSOMBRA );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( XPAINTMENU );
HB_FUNC( XPAINTSCROOL );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC_EXTERN( EVENTCREATE );
HB_FUNC_EXTERN( SHOWSCROLLBAR );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_BITMAPCAPTUREDESKTOP );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLHORIZONTAL );
HB_FUNC_EXTERN( BT_DRAWBITMAPALPHABLEND );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC( XFECHAMEN );
HB_FUNC_EXTERN( DOFINDWIN );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC_EXTERN( REMOVEHANDLER );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC( XDELEVENT );
HB_FUNC_EXTERN( HMG_LEN );
HB_FUNC_EXTERN( ADEL );
HB_FUNC_EXTERN( ASIZE );
HB_FUNC( EVENTMENU1 );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( SCROLLMENU );
HB_FUNC_EXTERN( XHIDEHINT );
HB_FUNC_EXTERN( YAVISO );
HB_FUNC_EXTERN( XOPSELPOS );
HB_FUNC_EXTERN( XLIMPSUB );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( CRIEJANTIP );
HB_FUNC_EXTERN( XDISPHINT );
HB_FUNC_EXTERN( XDISPUPTAM );
HB_FUNC_EXTERN( TRACKMOUSEEVENT );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_BITMAPRELEASE );
HB_FUNC( XKEYSUBMEN );
HB_FUNC_EXTERN( EVENTHWND );
HB_FUNC_EXTERN( INT );
HB_FUNC_EXTERN( EVENTMSG );
HB_FUNC_EXTERN( EVENTWPARAM );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XMENUS )
{ "XMENUOP", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XMENUOP )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "NITEMSUBHEIGHT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ACLONE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ACLONE )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "_SHOWWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _SHOWWINDOW )}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "NCOLTAMMENU", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XSOMBRA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSOMBRA )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "ACORSUB1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XPAINTMENU", {HB_FS_PUBLIC}, {HB_FUNCNAME( XPAINTMENU )}, NULL },
{ "XPAINTSCROOL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTSCROOL )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "EVENTCREATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTCREATE )}, NULL },
{ "_HMG_EVENTDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SHOWSCROLLBAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SHOWSCROLLBAR )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_BITMAPCAPTUREDESKTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPCAPTUREDESKTOP )}, NULL },
{ "BT_DRAWGRADIENTFILLHORIZONTAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLHORIZONTAL )}, NULL },
{ "BT_DRAWBITMAPALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAPALPHABLEND )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "XFECHAMEN", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XFECHAMEN )}, NULL },
{ "DOFINDWIN", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOFINDWIN )}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "REMOVEHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( REMOVEHANDLER )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "XDELEVENT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDELEVENT )}, NULL },
{ "HMG_LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_LEN )}, NULL },
{ "ADEL", {HB_FS_PUBLIC}, {HB_FUNCNAME( ADEL )}, NULL },
{ "ASIZE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASIZE )}, NULL },
{ "EVENTMENU1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTMENU1 )}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "CURSORHAND", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SCROLLMENU", {HB_FS_PUBLIC}, {HB_FUNCNAME( SCROLLMENU )}, NULL },
{ "NACUMULADO", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XHIDEHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XHIDEHINT )}, NULL },
{ "LPOPUP", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "YAVISO", {HB_FS_PUBLIC}, {HB_FUNCNAME( YAVISO )}, NULL },
{ "EVAL", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "XOPSELPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( XOPSELPOS )}, NULL },
{ "XLIMPSUB", {HB_FS_PUBLIC}, {HB_FUNCNAME( XLIMPSUB )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "CRIEJANTIP", {HB_FS_PUBLIC}, {HB_FUNCNAME( CRIEJANTIP )}, NULL },
{ "XDISPHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPHINT )}, NULL },
{ "XDISPUPTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPUPTAM )}, NULL },
{ "TRACKMOUSEEVENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( TRACKMOUSEEVENT )}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_BITMAPRELEASE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPRELEASE )}, NULL },
{ "XKEYSUBMEN", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XKEYSUBMEN )}, NULL },
{ "EVENTHWND", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTHWND )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "NTAMSUBMENUCONSULTA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "EVENTMSG", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTMSG )}, NULL },
{ "EVENTWPARAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTWPARAM )}, NULL },
{ "LTRACKING42", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00015)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_XMENUS, "Prg\\xMenus.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_XMENUS
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_XMENUS )
   #include "hbiniseg.h"
#endif

HB_FUNC( XMENUOP )
{
	static const HB_BYTE pcode[] =
	{
		13,2,4,116,73,0,36,70,0,9,80,5,36,71,
		0,176,1,0,95,1,12,1,109,2,0,65,92,5,
		72,80,6,36,73,0,95,4,100,8,28,5,9,25,
		4,95,4,80,4,36,75,0,95,4,82,12,0,36,
		77,0,176,3,0,95,1,12,1,82,1,0,36,80,
		0,122,82,2,0,36,82,0,122,82,3,0,36,84,
		0,106,1,0,82,4,0,36,86,0,121,82,9,0,
		36,89,0,176,4,0,106,10,87,105,110,95,77,101,
		110,117,49,0,12,1,28,45,36,90,0,176,5,0,
		106,10,87,105,110,95,77,101,110,117,49,0,20,1,
		36,91,0,176,6,0,101,154,153,153,153,153,153,185,
		63,10,1,20,1,36,92,0,7,36,105,0,176,1,
		0,103,1,0,12,1,92,15,15,29,171,0,36,108,
		0,176,7,0,20,0,176,8,0,106,11,87,105,110,
		83,111,109,98,114,97,49,0,106,8,83,111,109,98,
		114,97,49,0,95,3,92,5,72,95,2,92,5,72,
		109,9,0,92,3,72,93,78,1,120,120,120,120,120,
		9,106,1,0,100,100,100,100,100,100,121,121,121,4,
		3,0,89,46,0,0,0,2,0,2,0,3,0,176,
		10,0,176,11,0,98,12,0,93,60,1,1,106,5,
		78,97,109,101,0,12,2,95,255,92,5,72,95,254,
		92,5,72,12,3,6,9,9,9,100,120,100,100,100,
		100,100,100,100,100,100,100,100,100,100,100,100,9,100,
		100,100,9,100,100,100,100,100,100,100,100,100,9,20,
		56,36,109,0,176,13,0,20,0,26,179,0,36,121,
		0,176,7,0,20,0,176,8,0,106,11,87,105,110,
		83,111,109,98,114,97,49,0,106,8,83,111,109,98,
		114,97,49,0,95,3,92,15,72,95,2,92,12,72,
		109,9,0,92,7,49,176,1,0,95,1,12,1,109,
		2,0,65,92,2,49,120,120,120,120,120,9,106,1,
		0,100,100,100,100,100,100,121,121,121,4,3,0,89,
		46,0,0,0,2,0,2,0,3,0,176,10,0,176,
		11,0,98,12,0,93,60,1,1,106,5,78,97,109,
		101,0,12,2,95,255,92,6,72,95,254,92,5,72,
		12,3,6,9,9,9,100,120,100,100,100,100,100,100,
		100,100,100,100,100,100,100,100,100,9,100,100,100,9,
		100,100,100,100,100,100,100,100,100,9,20,56,36,122,
		0,176,13,0,20,0,36,130,0,176,14,0,106,11,
		87,105,110,83,111,109,98,114,97,49,0,20,1,36,
		137,0,176,7,0,20,0,176,8,0,106,10,87,105,
		110,95,77,101,110,117,49,0,106,5,77,101,110,49,
		0,95,3,92,3,72,95,2,109,9,0,176,1,0,
		103,1,0,12,1,92,15,34,28,6,95,6,25,5,
		93,48,1,120,120,120,120,120,9,106,1,0,100,100,
		100,100,100,100,109,15,0,90,46,176,16,0,176,11,
		0,98,12,0,93,60,1,1,106,5,78,97,109,101,
		0,12,2,103,1,0,103,2,0,103,3,0,103,4,
		0,121,121,9,120,100,100,120,12,12,6,9,9,9,
		100,120,100,100,100,100,100,100,100,176,1,0,103,1,
		0,12,1,92,15,34,28,8,95,6,122,72,25,16,
		176,1,0,95,1,12,1,109,2,0,65,92,10,72,
		100,100,100,100,100,100,100,9,100,100,100,9,100,100,
		100,100,100,100,100,100,100,9,20,56,36,138,0,176,
		13,0,20,0,36,143,0,176,1,0,103,1,0,12,
		1,92,15,15,29,175,0,36,146,0,176,7,0,20,
		0,176,8,0,106,12,87,105,110,95,83,99,114,111,
		108,108,49,0,106,3,84,49,0,95,3,92,3,72,
		95,2,176,11,0,106,10,87,105,110,95,77,101,110,
		117,49,0,106,7,72,101,105,103,104,116,0,12,2,
		72,122,72,109,9,0,122,49,92,32,120,120,120,120,
		120,9,106,1,0,100,100,100,100,100,100,93,128,0,
		93,128,0,93,128,0,4,3,0,90,27,176,17,0,
		176,11,0,98,12,0,93,60,1,1,106,5,78,97,
		109,101,0,12,2,12,1,6,9,9,9,100,120,100,
		100,100,100,100,100,100,100,100,100,100,100,100,100,100,
		9,100,100,100,9,100,100,100,100,100,100,100,100,100,
		9,20,56,36,147,0,176,13,0,20,0,36,152,0,
		176,18,0,98,12,0,92,60,1,176,19,0,176,20,
		0,106,11,69,118,101,110,116,77,101,110,117,49,0,
		12,1,12,1,12,2,121,5,28,74,36,153,0,176,
		21,0,106,11,69,118,101,110,116,77,101,110,117,49,
		0,20,1,36,156,0,93,82,78,82,10,0,36,158,
		0,176,22,0,106,13,120,75,101,121,83,117,98,77,
		101,110,40,41,0,100,100,12,3,82,10,0,36,160,
		0,176,1,0,109,23,0,12,1,82,10,0,36,174,
		0,176,24,0,176,25,0,106,10,87,105,110,95,77,
		101,110,117,49,0,12,1,121,9,20,3,36,175,0,
		176,24,0,176,25,0,106,10,87,105,110,95,77,101,
		110,117,49,0,12,1,122,9,20,3,36,178,0,176,
		5,0,106,11,87,105,110,83,111,109,98,114,97,49,
		0,20,1,36,183,0,176,5,0,106,10,87,105,110,
		95,77,101,110,117,49,0,20,1,36,189,0,176,14,
		0,106,10,87,105,110,95,77,101,110,117,49,0,20,
		1,36,191,0,176,1,0,103,1,0,12,1,92,15,
		15,28,67,176,4,0,106,12,87,105,110,95,83,99,
		114,111,108,108,49,0,12,1,28,46,36,195,0,176,
		5,0,106,12,87,105,110,95,83,99,114,111,108,108,
		49,0,20,1,36,197,0,176,14,0,106,12,87,105,
		110,95,83,99,114,111,108,108,49,0,20,1,36,204,
		0,95,5,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSOMBRA )
{
	static const HB_BYTE pcode[] =
	{
		13,6,3,36,210,0,176,26,0,95,1,12,1,80,
		4,36,211,0,176,27,0,95,1,12,1,80,5,36,
		219,0,176,28,0,95,1,92,4,96,6,0,12,3,
		80,9,36,224,0,176,29,0,95,2,95,3,95,4,
		95,5,12,4,80,7,36,227,0,176,29,0,95,2,
		95,4,72,122,72,95,3,95,5,72,122,72,92,5,
		92,5,12,4,80,8,36,231,0,176,30,0,95,9,
		121,121,95,4,92,6,49,95,5,92,5,49,92,89,
		92,89,92,89,4,3,0,92,89,92,89,92,89,4,
		3,0,20,7,36,232,0,176,30,0,95,9,121,95,
		4,92,5,49,122,95,5,92,5,49,92,89,92,89,
		92,89,4,3,0,92,89,92,89,92,89,4,3,0,
		20,7,36,234,0,176,30,0,95,9,121,95,4,92,
		4,49,122,95,5,92,5,49,93,143,0,93,143,0,
		93,143,0,4,3,0,93,143,0,93,143,0,93,143,
		0,4,3,0,20,7,36,235,0,176,30,0,95,9,
		121,95,4,92,3,49,122,95,5,92,5,49,93,172,
		0,93,172,0,93,172,0,4,3,0,93,172,0,93,
		172,0,93,172,0,4,3,0,20,7,36,236,0,176,
		30,0,95,9,121,95,4,92,2,49,122,95,5,92,
		5,49,93,212,0,93,212,0,93,212,0,4,3,0,
		93,212,0,93,212,0,93,212,0,4,3,0,20,7,
		36,237,0,176,30,0,95,9,121,95,4,122,49,122,
		95,5,92,5,49,93,241,0,93,241,0,93,241,0,
		4,3,0,93,241,0,93,241,0,93,241,0,4,3,
		0,20,7,36,238,0,176,30,0,95,9,121,95,4,
		121,49,122,95,5,92,5,49,93,252,0,93,252,0,
		93,252,0,4,3,0,93,252,0,93,252,0,93,252,
		0,4,3,0,20,7,36,245,0,176,30,0,95,9,
		95,5,92,6,49,121,95,4,92,5,49,122,92,89,
		92,89,92,89,4,3,0,92,89,92,89,92,89,4,
		3,0,20,7,36,248,0,176,30,0,95,9,95,5,
		92,5,49,121,95,4,92,5,49,122,92,89,92,89,
		92,89,4,3,0,92,89,92,89,92,89,4,3,0,
		20,7,36,251,0,176,30,0,95,9,95,5,92,4,
		49,121,95,4,92,5,49,122,93,143,0,93,143,0,
		93,143,0,4,3,0,93,143,0,93,143,0,93,143,
		0,4,3,0,20,7,36,252,0,176,30,0,95,9,
		95,5,92,3,49,121,95,4,92,5,49,122,93,172,
		0,93,172,0,93,172,0,4,3,0,93,172,0,93,
		172,0,93,172,0,4,3,0,20,7,36,253,0,176,
		30,0,95,9,95,5,92,2,49,121,95,4,92,5,
		49,122,93,212,0,93,212,0,93,212,0,4,3,0,
		93,212,0,93,212,0,93,212,0,4,3,0,20,7,
		36,254,0,176,30,0,95,9,95,5,122,49,121,95,
		4,92,5,49,122,93,241,0,93,241,0,93,241,0,
		4,3,0,93,241,0,93,241,0,93,241,0,4,3,
		0,20,7,36,255,0,176,30,0,95,9,95,5,121,
		95,4,92,5,49,122,93,252,0,93,252,0,93,252,
		0,4,3,0,93,252,0,93,252,0,93,252,0,4,
		3,0,20,7,36,1,1,176,31,0,95,9,121,121,
		95,4,95,5,92,5,92,3,95,7,20,8,36,6,
		1,176,32,0,95,9,95,5,92,5,49,95,4,92,
		5,49,92,5,92,5,92,3,95,8,20,7,36,9,
		1,176,33,0,95,6,20,1,36,13,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XFECHAMEN )
{
	static const HB_BYTE pcode[] =
	{
		13,4,0,116,73,0,36,18,1,121,80,1,36,20,
		1,176,35,0,106,5,77,101,110,49,0,12,1,80,
		2,36,21,1,176,35,0,106,3,84,49,0,12,1,
		80,3,36,22,1,176,35,0,106,8,83,111,109,98,
		114,97,49,0,12,1,80,4,36,25,1,95,2,121,
		15,29,62,1,36,29,1,176,36,0,95,2,93,18,
		1,97,96,240,0,0,121,20,4,36,31,1,176,37,
		0,20,0,36,32,1,176,37,0,20,0,36,34,1,
		176,36,0,95,2,93,18,1,92,2,121,20,4,36,
		36,1,176,37,0,20,0,36,39,1,95,3,121,15,
		28,61,36,41,1,176,36,0,95,3,93,18,1,97,
		96,240,0,0,121,20,4,36,43,1,176,37,0,20,
		0,36,44,1,176,37,0,20,0,36,46,1,176,36,
		0,95,3,93,18,1,92,2,121,20,4,36,48,1,
		176,37,0,20,0,36,54,1,95,4,121,15,28,61,
		36,56,1,176,36,0,95,4,93,18,1,97,96,240,
		0,0,121,20,4,36,58,1,176,37,0,20,0,36,
		59,1,176,37,0,20,0,36,61,1,176,36,0,95,
		4,93,18,1,92,2,121,20,4,36,63,1,176,37,
		0,20,0,36,72,1,176,38,0,106,11,69,118,101,
		110,116,77,101,110,117,49,0,12,1,31,42,36,73,
		1,176,39,0,106,30,69,114,114,111,32,97,111,32,
		114,101,109,111,118,101,114,32,72,97,110,100,108,101,
		32,69,118,101,110,116,46,0,20,1,36,76,1,176,
		40,0,103,10,0,12,1,31,46,36,77,1,176,39,
		0,106,34,69,114,114,111,32,97,111,32,114,101,109,
		111,118,101,114,32,72,97,110,100,108,101,32,69,118,
		101,110,116,32,50,50,32,46,0,20,1,36,87,1,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDELEVENT )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,36,93,1,176,18,0,109,23,0,89,26,
		0,1,0,1,0,1,0,95,1,176,41,0,98,23,
		0,122,1,12,1,1,95,255,8,6,12,2,80,2,
		36,94,1,9,80,3,36,95,1,176,1,0,109,23,
		0,12,1,80,4,36,97,1,95,1,176,1,0,109,
		23,0,12,1,34,28,36,36,98,1,176,42,0,109,
		23,0,95,1,20,2,36,99,1,176,43,0,109,23,
		0,95,4,122,49,20,2,36,100,1,120,80,3,36,
		104,1,95,3,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTMENU1 )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,73,0,36,111,1,106,1,0,80,5,
		36,112,1,121,80,6,36,113,1,121,80,7,36,115,
		1,121,80,9,36,116,1,106,1,0,80,10,36,117,
		1,121,80,11,36,118,1,120,80,12,36,122,1,176,
		4,0,106,10,87,105,110,95,77,101,110,117,49,0,
		12,1,31,6,36,123,1,7,36,127,1,176,4,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,29,236,1,95,1,176,11,0,106,12,87,105,
		110,95,83,99,114,111,108,108,49,0,106,7,72,65,
		78,68,76,69,0,12,2,8,29,202,1,36,130,1,
		95,2,93,0,2,8,29,169,0,36,132,1,176,45,
		0,96,6,0,96,7,0,20,2,36,134,1,176,46,
		0,176,25,0,106,12,87,105,110,95,83,99,114,111,
		108,108,49,0,12,1,95,7,95,6,12,3,80,8,
		36,136,1,120,80,12,36,138,1,95,8,122,1,92,
		16,35,28,8,36,139,1,9,80,12,36,143,1,95,
		12,28,47,36,145,1,103,8,0,31,17,36,146,1,
		176,47,0,95,1,109,48,0,20,2,25,67,36,148,
		1,176,47,0,95,1,106,8,78,65,79,80,79,68,
		69,0,20,2,25,45,36,153,1,103,7,0,31,17,
		36,154,1,176,47,0,95,1,109,48,0,20,2,25,
		22,36,156,1,176,47,0,95,1,106,8,78,65,79,
		80,79,68,69,0,20,2,36,165,1,95,2,93,1,
		2,8,29,12,1,36,167,1,176,45,0,96,6,0,
		96,7,0,20,2,36,169,1,176,46,0,176,25,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,95,7,95,6,12,3,80,8,36,171,1,120,
		80,12,36,173,1,95,8,122,1,92,16,35,28,8,
		36,174,1,9,80,12,36,179,1,103,11,0,121,8,
		28,10,36,180,1,92,15,82,11,0,36,185,1,95,
		12,28,76,36,186,1,176,49,0,122,176,11,0,106,
		10,87,105,110,95,77,101,110,117,49,0,106,7,72,
		65,78,68,76,69,0,12,2,99,50,0,104,11,0,
		176,1,0,103,1,0,12,1,104,8,0,104,7,0,
		122,106,10,87,105,110,95,77,101,110,117,49,0,93,
		44,1,9,20,11,25,75,36,188,1,176,49,0,92,
		2,176,11,0,106,10,87,105,110,95,77,101,110,117,
		49,0,106,7,72,65,78,68,76,69,0,12,2,104,
		9,0,104,11,0,176,1,0,103,1,0,12,1,104,
		8,0,104,7,0,122,106,10,87,105,110,95,77,101,
		110,117,49,0,93,44,1,9,20,11,36,191,1,176,
		14,0,106,12,87,105,110,95,83,99,114,111,108,108,
		49,0,20,1,36,200,1,95,1,176,11,0,106,10,
		87,105,110,95,77,101,110,117,49,0,106,7,72,65,
		78,68,76,69,0,12,2,8,29,114,3,36,202,1,
		95,2,93,163,2,8,28,52,103,15,0,28,47,36,
		204,1,121,82,2,0,36,205,1,121,82,3,0,36,
		206,1,176,14,0,95,1,20,1,36,207,1,176,47,
		0,95,1,93,0,127,20,2,36,208,1,176,51,0,
		20,0,36,215,1,95,2,92,37,8,28,9,36,217,
		1,109,52,0,73,36,225,1,95,2,93,1,2,8,
		28,122,36,229,1,103,2,0,176,1,0,103,1,0,
		12,1,34,28,105,36,231,1,103,1,0,103,2,0,
		1,92,3,1,31,50,36,232,1,176,47,0,95,1,
		93,0,127,20,2,36,233,1,176,53,0,106,20,79,
		112,231,227,111,32,73,110,100,105,115,112,111,110,105,
		118,101,108,46,0,9,20,2,36,234,1,7,36,237,
		1,103,1,0,103,2,0,1,92,4,1,100,69,28,
		25,36,238,1,48,54,0,103,1,0,103,2,0,1,
		92,4,1,112,0,73,36,239,1,7,36,250,1,95,
		2,93,0,2,8,29,149,2,36,255,1,103,2,0,
		121,15,28,49,95,3,92,90,69,28,42,36,0,2,
		103,2,0,176,55,0,106,10,87,105,110,95,77,101,
		110,117,49,0,121,176,1,0,103,1,0,12,1,121,
		12,4,5,28,6,36,1,2,7,36,6,2,95,3,
		92,90,69,28,35,36,7,2,176,55,0,106,10,87,
		105,110,95,77,101,110,117,49,0,121,176,1,0,103,
		1,0,12,1,121,12,4,82,2,0,36,11,2,176,
		11,0,106,10,87,105,110,95,77,101,110,117,49,0,
		106,11,86,115,99,114,111,108,108,66,97,114,0,106,
		6,86,97,108,117,101,0,12,3,66,80,11,36,14,
		2,103,2,0,176,1,0,103,1,0,12,1,34,28,
		42,36,15,2,103,1,0,103,2,0,1,92,3,1,
		31,27,36,16,2,176,47,0,95,1,93,0,127,20,
		2,36,17,2,176,51,0,20,0,36,18,2,7,36,
		23,2,95,3,92,90,69,28,15,36,24,2,176,47,
		0,95,1,109,48,0,20,2,36,28,2,103,3,0,
		121,15,28,29,36,29,2,176,56,0,106,10,87,105,
		110,95,77,101,110,117,49,0,104,3,0,104,2,0,
		121,20,4,36,33,2,103,2,0,121,15,28,13,36,
		34,2,103,2,0,82,3,0,25,6,36,36,2,7,
		36,40,2,103,2,0,176,1,0,103,1,0,12,1,
		15,28,14,36,41,2,176,51,0,20,0,36,42,2,
		7,36,46,2,103,2,0,121,15,28,44,36,47,2,
		176,57,0,106,10,87,105,110,95,77,101,110,117,49,
		0,95,11,103,2,0,122,49,109,2,0,65,72,121,
		109,9,0,109,2,0,122,49,120,20,6,36,52,2,
		176,58,0,176,19,0,103,1,0,103,2,0,1,92,
		2,1,12,1,12,1,32,228,0,95,3,92,90,69,
		29,220,0,36,54,2,176,19,0,103,1,0,103,2,
		0,1,92,2,1,12,1,80,10,36,56,2,121,80,
		11,36,59,2,176,45,0,96,6,0,96,11,0,20,
		2,36,61,2,176,4,0,106,8,87,105,110,95,77,
		115,103,0,12,1,31,61,36,62,2,176,59,0,95,
		11,176,11,0,106,10,87,105,110,95,77,101,110,117,
		49,0,106,6,87,105,100,116,104,0,12,2,92,15,
		49,176,19,0,95,10,12,1,100,101,0,0,0,0,
		0,0,224,63,10,1,20,5,25,88,36,64,2,176,
		60,0,95,10,95,11,92,15,72,176,11,0,106,10,
		87,105,110,95,77,101,110,117,49,0,106,4,67,111,
		108,0,12,2,176,11,0,106,10,87,105,110,95,77,
		101,110,117,49,0,106,6,87,105,100,116,104,0,12,
		2,72,92,3,72,92,5,72,20,3,36,65,2,176,
		35,0,106,6,120,72,105,110,116,0,20,1,36,69,
		2,176,61,0,95,10,20,1,25,10,36,73,2,176,
		51,0,20,0,36,77,2,95,3,92,90,69,28,17,
		36,78,2,176,62,0,95,1,12,1,82,15,0,25,
		9,36,80,2,9,82,15,0,36,90,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTSCROOL )
{
	static const HB_BYTE pcode[] =
	{
		13,4,1,116,73,0,36,102,2,176,28,0,95,1,
		92,4,96,5,0,12,3,80,4,36,105,2,103,7,
		0,31,23,36,106,2,176,63,0,106,7,83,69,84,
		65,66,50,0,12,1,80,2,25,22,36,109,2,176,
		63,0,106,8,83,69,84,65,66,50,68,0,12,1,
		80,2,36,114,2,103,8,0,31,23,36,115,2,176,
		63,0,106,7,83,69,84,65,67,50,0,12,1,80,
		3,25,22,36,117,2,176,63,0,106,8,83,69,84,
		65,67,50,68,0,12,1,80,3,36,122,2,176,32,
		0,95,4,121,121,109,9,0,92,15,92,3,95,2,
		20,7,36,123,2,176,32,0,95,4,92,16,121,109,
		9,0,92,16,92,3,95,3,20,7,36,126,2,176,
		64,0,95,2,20,1,36,127,2,176,64,0,95,3,
		20,1,36,130,2,176,33,0,95,5,20,1,36,132,
		2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XKEYSUBMEN )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,73,0,36,136,2,176,66,0,12,0,
		80,4,36,138,2,121,80,5,36,139,2,121,80,6,
		36,140,2,121,80,7,36,145,2,176,67,0,109,68,
		0,109,2,0,18,12,1,80,10,36,148,2,95,1,
		100,8,28,9,176,69,0,12,0,25,4,95,1,80,
		1,36,149,2,95,2,100,8,28,9,176,70,0,12,
		0,25,4,95,2,80,2,36,151,2,95,3,100,8,
		28,16,106,10,87,105,110,95,77,101,110,117,49,0,
		25,4,95,3,80,3,36,154,2,95,2,80,9,36,
		155,2,95,1,80,8,36,158,2,95,8,93,0,1,
		8,29,255,1,36,162,2,95,9,92,13,5,28,39,
		36,164,2,9,83,71,0,36,165,2,176,36,0,176,
		11,0,95,3,106,7,72,65,78,68,76,69,0,12,
		2,93,1,2,92,90,121,20,4,36,172,2,95,9,
		92,40,8,29,236,0,36,174,2,176,51,0,20,0,
		36,175,2,103,2,0,176,1,0,103,1,0,12,1,
		35,29,188,0,36,177,2,104,2,0,170,36,178,2,
		9,82,15,0,36,181,2,103,2,0,95,10,15,29,
		130,0,36,183,2,103,14,0,121,8,28,20,36,184,
		2,176,67,0,109,68,0,109,2,0,18,12,1,82,
		14,0,36,189,2,176,49,0,92,2,176,11,0,95,
		3,106,7,72,97,110,100,108,101,0,12,2,104,13,
		0,104,14,0,176,1,0,103,1,0,12,1,104,8,
		0,104,7,0,122,106,10,87,105,110,95,77,101,110,
		117,49,0,176,11,0,95,3,106,7,72,101,105,103,
		104,116,0,12,2,20,10,36,192,2,176,14,0,106,
		12,87,105,110,95,83,99,114,111,108,108,49,0,20,
		1,25,56,36,195,2,176,36,0,176,11,0,95,3,
		106,7,72,65,78,68,76,69,0,12,2,93,0,2,
		92,90,121,20,4,25,24,36,202,2,176,39,0,106,
		12,72,105,116,32,66,111,116,116,111,109,33,0,20,
		1,36,212,2,95,9,92,38,8,29,209,0,36,213,
		2,176,51,0,20,0,36,215,2,103,2,0,122,15,
		29,172,0,36,217,2,104,2,0,169,36,218,2,9,
		82,15,0,36,221,2,103,2,0,95,10,16,28,114,
		36,224,2,176,49,0,122,176,11,0,95,3,106,7,
		72,97,110,100,108,101,0,12,2,104,13,0,104,14,
		0,176,1,0,103,1,0,12,1,104,8,0,104,7,
		0,122,95,3,176,11,0,95,3,106,7,72,101,105,
		103,104,116,0,12,2,20,10,36,227,2,176,4,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,28,76,36,228,2,176,14,0,106,12,87,105,
		110,95,83,99,114,111,108,108,49,0,20,1,25,52,
		36,233,2,176,36,0,176,11,0,95,3,106,7,72,
		65,78,68,76,69,0,12,2,93,0,2,92,90,121,
		20,4,25,20,36,241,2,176,39,0,106,8,72,105,
		116,32,84,111,112,0,20,1,36,12,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,73,0,15,0,116,73,0,4,0,0,82,1,0,
		121,82,2,0,122,82,3,0,106,1,0,82,4,0,
		122,82,5,0,93,44,1,82,6,0,9,82,7,0,
		120,82,8,0,121,82,9,0,121,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,121,82,14,0,
		9,82,15,0,7
	};

	hb_vmExecute( pcode, symbols );
}

