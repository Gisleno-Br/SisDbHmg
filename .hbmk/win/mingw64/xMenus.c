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
HB_FUNC_EXTERN( XPAINTMENU );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC( XPAINTSCROOL );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC_EXTERN( EVENTCREATE );
HB_FUNC_EXTERN( HMG_CHANGEWINDOWSTYLE );
HB_FUNC_EXTERN( SHOWSCROLLBAR );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
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
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( BT_BITMAPRELEASE );
HB_FUNC_EXTERN( BT_DELETEDC );
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
{ "ACORSUB1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XPAINTMENU", {HB_FS_PUBLIC}, {HB_FUNCNAME( XPAINTMENU )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "XPAINTSCROOL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTSCROOL )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "EVENTCREATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTCREATE )}, NULL },
{ "_HMG_EVENTDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HMG_CHANGEWINDOWSTYLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CHANGEWINDOWSTYLE )}, NULL },
{ "SHOWSCROLLBAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SHOWSCROLLBAR )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
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
{ "XHIDEHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XHIDEHINT )}, NULL },
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
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "BT_BITMAPRELEASE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPRELEASE )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "XKEYSUBMEN", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XKEYSUBMEN )}, NULL },
{ "EVENTHWND", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTHWND )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "NTAMSUBMENUCONSULTA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "EVENTMSG", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTMSG )}, NULL },
{ "EVENTWPARAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTWPARAM )}, NULL },
{ "LTRACKING42", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00014)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,2,3,116,66,0,36,66,0,9,80,4,36,67,
		0,176,1,0,95,1,12,1,109,2,0,65,92,5,
		72,80,5,36,69,0,176,3,0,95,1,12,1,82,
		1,0,36,71,0,122,82,2,0,36,73,0,122,82,
		3,0,36,75,0,106,1,0,82,4,0,36,77,0,
		121,82,9,0,36,80,0,176,4,0,106,10,87,105,
		110,95,77,101,110,117,49,0,12,1,28,45,36,81,
		0,176,5,0,106,10,87,105,110,95,77,101,110,117,
		49,0,20,1,36,82,0,176,6,0,101,154,153,153,
		153,153,153,185,63,10,1,20,1,36,83,0,7,36,
		89,0,176,7,0,20,0,176,8,0,106,10,87,105,
		110,95,77,101,110,117,49,0,106,5,77,101,110,49,
		0,95,3,95,2,109,9,0,176,1,0,103,1,0,
		12,1,92,15,34,28,6,95,5,25,5,93,44,1,
		120,120,120,120,120,9,106,1,0,100,100,100,100,100,
		100,109,10,0,90,46,176,11,0,176,12,0,98,13,
		0,93,60,1,1,106,5,78,97,109,101,0,12,2,
		103,1,0,103,2,0,103,3,0,103,4,0,121,121,
		9,120,100,100,120,12,12,6,9,9,9,100,120,100,
		100,100,100,100,100,100,176,1,0,103,1,0,12,1,
		92,15,34,28,8,95,5,122,72,25,13,176,1,0,
		95,1,12,1,109,2,0,65,100,100,100,100,100,100,
		100,9,100,100,100,9,100,100,100,100,100,100,100,100,
		100,9,20,56,36,90,0,176,14,0,20,0,36,93,
		0,176,1,0,103,1,0,12,1,92,15,15,29,168,
		0,36,96,0,176,7,0,20,0,176,8,0,106,12,
		87,105,110,95,83,99,114,111,108,108,49,0,106,3,
		84,49,0,95,3,95,2,176,12,0,106,10,87,105,
		110,95,77,101,110,117,49,0,106,7,72,101,105,103,
		104,116,0,12,2,72,109,9,0,92,32,120,120,120,
		120,120,9,106,1,0,100,100,100,100,100,100,93,128,
		0,93,128,0,93,128,0,4,3,0,90,27,176,15,
		0,176,12,0,98,13,0,93,60,1,1,106,5,78,
		97,109,101,0,12,2,12,1,6,9,9,9,100,120,
		100,100,100,100,100,100,100,100,100,100,100,100,100,100,
		100,9,100,100,100,9,100,100,100,100,100,100,100,100,
		100,9,20,56,36,97,0,176,14,0,20,0,36,101,
		0,176,16,0,98,13,0,92,60,1,176,17,0,176,
		18,0,106,11,69,118,101,110,116,77,101,110,117,49,
		0,12,1,12,1,12,2,121,5,28,74,36,102,0,
		176,19,0,106,11,69,118,101,110,116,77,101,110,117,
		49,0,20,1,36,105,0,93,82,78,82,10,0,36,
		107,0,176,20,0,106,13,120,75,101,121,83,117,98,
		77,101,110,40,41,0,100,100,12,3,82,10,0,36,
		109,0,176,1,0,109,21,0,12,1,82,10,0,36,
		115,0,176,22,0,176,12,0,106,10,87,105,110,95,
		77,101,110,117,49,0,106,7,72,97,110,100,108,101,
		0,12,2,122,100,100,9,120,20,6,36,118,0,176,
		23,0,176,24,0,106,10,87,105,110,95,77,101,110,
		117,49,0,12,1,121,9,20,3,36,119,0,176,23,
		0,176,24,0,106,10,87,105,110,95,77,101,110,117,
		49,0,12,1,122,9,20,3,36,121,0,176,5,0,
		106,10,87,105,110,95,77,101,110,117,49,0,20,1,
		36,124,0,176,25,0,106,10,87,105,110,95,77,101,
		110,117,49,0,20,1,36,126,0,176,1,0,103,1,
		0,12,1,92,15,15,29,157,0,176,4,0,106,12,
		87,105,110,95,83,99,114,111,108,108,49,0,12,1,
		29,135,0,36,128,0,176,22,0,176,12,0,106,12,
		87,105,110,95,83,99,114,111,108,108,49,0,106,7,
		72,97,110,100,108,101,0,12,2,97,0,0,128,0,
		100,9,120,20,5,36,129,0,176,22,0,176,12,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		106,7,72,97,110,100,108,101,0,12,2,100,97,0,
		0,2,0,120,120,20,5,36,132,0,176,5,0,106,
		12,87,105,110,95,83,99,114,111,108,108,49,0,20,
		1,36,134,0,176,25,0,106,12,87,105,110,95,83,
		99,114,111,108,108,49,0,20,1,36,141,0,95,4,
		110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XFECHAMEN )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,116,66,0,36,147,0,121,80,1,36,149,
		0,176,27,0,106,5,77,101,110,49,0,12,1,80,
		2,36,150,0,176,27,0,106,3,84,49,0,12,1,
		80,3,36,153,0,95,2,121,15,29,250,0,36,157,
		0,176,28,0,95,2,93,18,1,97,96,240,0,0,
		121,20,4,36,159,0,176,29,0,20,0,36,160,0,
		176,29,0,20,0,36,162,0,176,28,0,95,2,93,
		18,1,92,2,121,20,4,36,164,0,176,29,0,20,
		0,36,167,0,95,3,121,15,28,61,36,169,0,176,
		28,0,95,3,93,18,1,97,96,240,0,0,121,20,
		4,36,171,0,176,29,0,20,0,36,172,0,176,29,
		0,20,0,36,174,0,176,28,0,95,3,93,18,1,
		92,2,121,20,4,36,176,0,176,29,0,20,0,36,
		185,0,176,30,0,106,11,69,118,101,110,116,77,101,
		110,117,49,0,12,1,31,42,36,186,0,176,31,0,
		106,30,69,114,114,111,32,97,111,32,114,101,109,111,
		118,101,114,32,72,97,110,100,108,101,32,69,118,101,
		110,116,46,0,20,1,36,189,0,176,32,0,103,10,
		0,12,1,31,46,36,190,0,176,31,0,106,34,69,
		114,114,111,32,97,111,32,114,101,109,111,118,101,114,
		32,72,97,110,100,108,101,32,69,118,101,110,116,32,
		50,50,32,46,0,20,1,36,200,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDELEVENT )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,36,206,0,176,16,0,109,21,0,89,26,
		0,1,0,1,0,1,0,95,1,176,33,0,98,21,
		0,122,1,12,1,1,95,255,8,6,12,2,80,2,
		36,207,0,9,80,3,36,208,0,176,1,0,109,21,
		0,12,1,80,4,36,210,0,95,1,176,1,0,109,
		21,0,12,1,34,28,36,36,212,0,176,34,0,109,
		21,0,95,1,20,2,36,213,0,176,35,0,109,21,
		0,95,4,122,49,20,2,36,214,0,120,80,3,36,
		219,0,95,3,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTMENU1 )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,66,0,36,224,0,106,1,0,80,5,
		36,225,0,121,80,6,36,226,0,121,80,7,36,228,
		0,121,80,9,36,229,0,106,1,0,80,10,36,230,
		0,121,80,11,36,231,0,120,80,12,36,235,0,176,
		4,0,106,10,87,105,110,95,77,101,110,117,49,0,
		12,1,31,6,36,236,0,7,36,240,0,176,4,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,29,236,1,95,1,176,12,0,106,12,87,105,
		110,95,83,99,114,111,108,108,49,0,106,7,72,65,
		78,68,76,69,0,12,2,8,29,202,1,36,243,0,
		95,2,93,0,2,8,29,169,0,36,245,0,176,37,
		0,96,6,0,96,7,0,20,2,36,247,0,176,38,
		0,176,24,0,106,12,87,105,110,95,83,99,114,111,
		108,108,49,0,12,1,95,7,95,6,12,3,80,8,
		36,249,0,120,80,12,36,251,0,95,8,122,1,92,
		16,35,28,8,36,252,0,9,80,12,36,0,1,95,
		12,28,47,36,2,1,103,8,0,31,17,36,3,1,
		176,39,0,95,1,109,40,0,20,2,25,67,36,5,
		1,176,39,0,95,1,106,8,78,65,79,80,79,68,
		69,0,20,2,25,45,36,10,1,103,7,0,31,17,
		36,11,1,176,39,0,95,1,109,40,0,20,2,25,
		22,36,13,1,176,39,0,95,1,106,8,78,65,79,
		80,79,68,69,0,20,2,36,22,1,95,2,93,1,
		2,8,29,12,1,36,24,1,176,37,0,96,6,0,
		96,7,0,20,2,36,26,1,176,38,0,176,24,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,95,7,95,6,12,3,80,8,36,28,1,120,
		80,12,36,30,1,95,8,122,1,92,16,35,28,8,
		36,31,1,9,80,12,36,35,1,103,11,0,121,8,
		28,10,36,36,1,92,15,82,11,0,36,39,1,95,
		12,28,76,36,40,1,176,41,0,122,176,12,0,106,
		10,87,105,110,95,77,101,110,117,49,0,106,7,72,
		65,78,68,76,69,0,12,2,104,9,0,104,11,0,
		176,1,0,103,1,0,12,1,104,8,0,104,7,0,
		122,106,10,87,105,110,95,77,101,110,117,49,0,93,
		44,1,9,20,11,25,75,36,42,1,176,41,0,92,
		2,176,12,0,106,10,87,105,110,95,77,101,110,117,
		49,0,106,7,72,65,78,68,76,69,0,12,2,104,
		9,0,104,11,0,176,1,0,103,1,0,12,1,104,
		8,0,104,7,0,122,106,10,87,105,110,95,77,101,
		110,117,49,0,93,44,1,9,20,11,36,45,1,176,
		25,0,106,12,87,105,110,95,83,99,114,111,108,108,
		49,0,20,1,36,54,1,95,1,176,12,0,106,10,
		87,105,110,95,77,101,110,117,49,0,106,7,72,65,
		78,68,76,69,0,12,2,8,29,97,3,36,56,1,
		95,2,93,163,2,8,28,52,103,14,0,28,47,36,
		58,1,121,82,2,0,36,59,1,121,82,3,0,36,
		60,1,176,25,0,95,1,20,1,36,61,1,176,39,
		0,95,1,93,0,127,20,2,36,62,1,176,42,0,
		20,0,36,68,1,95,2,93,1,2,8,28,122,36,
		72,1,103,2,0,176,1,0,103,1,0,12,1,34,
		28,105,36,74,1,103,1,0,103,2,0,1,92,3,
		1,31,50,36,75,1,176,39,0,95,1,93,0,127,
		20,2,36,76,1,176,43,0,106,20,79,112,231,227,
		111,32,73,110,100,105,115,112,111,110,105,118,101,108,
		46,0,9,20,2,36,77,1,7,36,80,1,103,1,
		0,103,2,0,1,92,4,1,100,69,28,25,36,81,
		1,48,44,0,103,1,0,103,2,0,1,92,4,1,
		112,0,73,36,82,1,7,36,93,1,95,2,93,0,
		2,8,29,149,2,36,98,1,103,2,0,121,15,28,
		49,95,3,92,90,69,28,42,36,99,1,103,2,0,
		176,45,0,106,10,87,105,110,95,77,101,110,117,49,
		0,121,176,1,0,103,1,0,12,1,121,12,4,5,
		28,6,36,100,1,7,36,105,1,95,3,92,90,69,
		28,35,36,106,1,176,45,0,106,10,87,105,110,95,
		77,101,110,117,49,0,121,176,1,0,103,1,0,12,
		1,121,12,4,82,2,0,36,110,1,176,12,0,106,
		10,87,105,110,95,77,101,110,117,49,0,106,11,86,
		115,99,114,111,108,108,66,97,114,0,106,6,86,97,
		108,117,101,0,12,3,66,80,11,36,113,1,103,2,
		0,176,1,0,103,1,0,12,1,34,28,42,36,114,
		1,103,1,0,103,2,0,1,92,3,1,31,27,36,
		115,1,176,39,0,95,1,93,0,127,20,2,36,116,
		1,176,42,0,20,0,36,117,1,7,36,122,1,95,
		3,92,90,69,28,15,36,123,1,176,39,0,95,1,
		109,40,0,20,2,36,127,1,103,3,0,121,15,28,
		29,36,128,1,176,46,0,106,10,87,105,110,95,77,
		101,110,117,49,0,104,3,0,104,2,0,121,20,4,
		36,132,1,103,2,0,121,15,28,13,36,133,1,103,
		2,0,82,3,0,25,6,36,135,1,7,36,139,1,
		103,2,0,176,1,0,103,1,0,12,1,15,28,14,
		36,140,1,176,42,0,20,0,36,141,1,7,36,145,
		1,103,2,0,121,15,28,44,36,146,1,176,47,0,
		106,10,87,105,110,95,77,101,110,117,49,0,95,11,
		103,2,0,122,49,109,2,0,65,72,121,109,9,0,
		109,2,0,122,49,120,20,6,36,151,1,176,48,0,
		176,17,0,103,1,0,103,2,0,1,92,2,1,12,
		1,12,1,32,228,0,95,3,92,90,69,29,220,0,
		36,153,1,176,17,0,103,1,0,103,2,0,1,92,
		2,1,12,1,80,10,36,155,1,121,80,11,36,158,
		1,176,37,0,96,6,0,96,11,0,20,2,36,160,
		1,176,4,0,106,8,87,105,110,95,77,115,103,0,
		12,1,31,61,36,161,1,176,49,0,95,11,176,12,
		0,106,10,87,105,110,95,77,101,110,117,49,0,106,
		6,87,105,100,116,104,0,12,2,92,15,49,176,17,
		0,95,10,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,88,36,163,1,176,50,0,95,
		10,95,11,92,15,72,176,12,0,106,10,87,105,110,
		95,77,101,110,117,49,0,106,4,67,111,108,0,12,
		2,176,12,0,106,10,87,105,110,95,77,101,110,117,
		49,0,106,6,87,105,100,116,104,0,12,2,72,92,
		3,72,92,5,72,20,3,36,164,1,176,27,0,106,
		6,120,72,105,110,116,0,20,1,36,168,1,176,51,
		0,95,10,20,1,25,10,36,172,1,176,42,0,20,
		0,36,176,1,95,3,92,90,69,28,17,36,177,1,
		176,52,0,95,1,12,1,82,14,0,25,9,36,179,
		1,9,82,14,0,36,189,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTSCROOL )
{
	static const HB_BYTE pcode[] =
	{
		13,4,1,116,66,0,36,201,1,176,53,0,95,1,
		92,4,96,5,0,12,3,80,4,36,204,1,103,7,
		0,31,23,36,205,1,176,54,0,106,7,83,69,84,
		65,66,50,0,12,1,80,2,25,22,36,208,1,176,
		54,0,106,8,83,69,84,65,66,50,68,0,12,1,
		80,2,36,213,1,103,8,0,31,23,36,214,1,176,
		54,0,106,7,83,69,84,65,67,50,0,12,1,80,
		3,25,22,36,216,1,176,54,0,106,8,83,69,84,
		65,67,50,68,0,12,1,80,3,36,221,1,176,55,
		0,95,4,121,121,109,9,0,92,15,92,3,95,2,
		20,7,36,222,1,176,55,0,95,4,92,16,121,109,
		9,0,92,16,92,3,95,3,20,7,36,225,1,176,
		56,0,95,2,20,1,36,226,1,176,56,0,95,3,
		20,1,36,229,1,176,57,0,95,5,20,1,36,231,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XKEYSUBMEN )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,66,0,36,235,1,176,59,0,12,0,
		80,4,36,237,1,121,80,5,36,238,1,121,80,6,
		36,239,1,121,80,7,36,244,1,176,60,0,109,61,
		0,109,2,0,18,12,1,80,10,36,247,1,95,1,
		100,8,28,9,176,62,0,12,0,25,4,95,1,80,
		1,36,248,1,95,2,100,8,28,9,176,63,0,12,
		0,25,4,95,2,80,2,36,250,1,95,3,100,8,
		28,16,106,10,87,105,110,95,77,101,110,117,49,0,
		25,4,95,3,80,3,36,253,1,95,2,80,9,36,
		254,1,95,1,80,8,36,1,2,95,8,93,0,1,
		8,29,1,2,36,4,2,95,9,92,27,8,28,10,
		36,5,2,176,26,0,20,0,36,10,2,95,9,92,
		13,5,28,39,36,12,2,9,83,64,0,36,13,2,
		176,28,0,176,12,0,95,3,106,7,72,65,78,68,
		76,69,0,12,2,93,1,2,92,90,121,20,4,36,
		20,2,95,9,92,40,8,29,228,0,36,23,2,103,
		2,0,176,1,0,103,1,0,12,1,35,29,188,0,
		36,25,2,104,2,0,170,36,26,2,9,82,14,0,
		36,29,2,103,2,0,95,10,15,29,130,0,36,31,
		2,103,13,0,121,8,28,20,36,32,2,176,60,0,
		109,61,0,109,2,0,18,12,1,82,13,0,36,37,
		2,176,41,0,92,2,176,12,0,95,3,106,7,72,
		97,110,100,108,101,0,12,2,104,12,0,104,13,0,
		176,1,0,103,1,0,12,1,104,8,0,104,7,0,
		122,106,10,87,105,110,95,77,101,110,117,49,0,176,
		12,0,95,3,106,7,72,101,105,103,104,116,0,12,
		2,20,10,36,40,2,176,25,0,106,12,87,105,110,
		95,83,99,114,111,108,108,49,0,20,1,25,56,36,
		43,2,176,28,0,176,12,0,95,3,106,7,72,65,
		78,68,76,69,0,12,2,93,0,2,92,90,121,20,
		4,25,24,36,50,2,176,31,0,106,12,72,105,116,
		32,66,111,116,116,111,109,33,0,20,1,36,59,2,
		95,9,92,38,8,29,201,0,36,62,2,103,2,0,
		122,15,29,172,0,36,64,2,104,2,0,169,36,65,
		2,9,82,14,0,36,68,2,103,2,0,95,10,16,
		28,114,36,71,2,176,41,0,122,176,12,0,95,3,
		106,7,72,97,110,100,108,101,0,12,2,104,12,0,
		104,13,0,176,1,0,103,1,0,12,1,104,8,0,
		104,7,0,122,95,3,176,12,0,95,3,106,7,72,
		101,105,103,104,116,0,12,2,20,10,36,74,2,176,
		4,0,106,12,87,105,110,95,83,99,114,111,108,108,
		49,0,12,1,28,76,36,75,2,176,25,0,106,12,
		87,105,110,95,83,99,114,111,108,108,49,0,20,1,
		25,52,36,80,2,176,28,0,176,12,0,95,3,106,
		7,72,65,78,68,76,69,0,12,2,93,0,2,92,
		90,121,20,4,25,20,36,88,2,176,31,0,106,8,
		72,105,116,32,84,111,112,0,20,1,36,115,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,66,0,14,0,116,66,0,4,0,0,82,1,0,
		121,82,2,0,122,82,3,0,106,1,0,82,4,0,
		122,82,5,0,93,44,1,82,6,0,9,82,7,0,
		120,82,8,0,121,82,9,0,121,82,10,0,121,82,
		11,0,121,82,12,0,121,82,13,0,9,82,14,0,
		7
	};

	hb_vmExecute( pcode, symbols );
}

