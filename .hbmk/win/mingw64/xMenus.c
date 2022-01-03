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
HB_FUNC_EXTERN( HMG_CHANGEWINDOWSTYLE );
HB_FUNC_EXTERN( SHOWSCROLLBAR );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( _SHOWWINDOW );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC( XFECHAMEN );
HB_FUNC_EXTERN( DOFINDWIN );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC_EXTERN( REMOVEHANDLER );
HB_FUNC_EXTERN( MSGINFO );
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
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XMENUS )
{ "XMENUOP", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XMENUOP )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "NITEMSUBHEIGHT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ACLONE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ACLONE )}, NULL },
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
{ "HMG_CHANGEWINDOWSTYLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CHANGEWINDOWSTYLE )}, NULL },
{ "SHOWSCROLLBAR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SHOWSCROLLBAR )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "_SHOWWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _SHOWWINDOW )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "XFECHAMEN", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XFECHAMEN )}, NULL },
{ "DOFINDWIN", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOFINDWIN )}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "REMOVEHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( REMOVEHANDLER )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
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
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00011)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,2,3,116,52,0,36,56,0,9,80,4,36,57,
		0,176,1,0,95,1,12,1,109,2,0,65,92,5,
		72,80,5,36,59,0,176,3,0,95,1,12,1,82,
		1,0,36,61,0,121,82,2,0,36,63,0,121,82,
		3,0,36,65,0,106,1,0,82,4,0,36,67,0,
		121,82,9,0,36,73,0,176,4,0,20,0,176,5,
		0,106,10,87,105,110,95,77,101,110,117,49,0,106,
		5,77,101,110,49,0,95,3,95,2,109,6,0,176,
		1,0,103,1,0,12,1,92,15,34,28,6,95,5,
		25,5,93,44,1,120,120,120,120,120,9,106,1,0,
		100,100,100,100,100,100,109,7,0,90,46,176,8,0,
		176,9,0,98,10,0,93,60,1,1,106,5,78,97,
		109,101,0,12,2,103,1,0,103,2,0,103,3,0,
		103,4,0,121,121,9,120,100,100,120,12,12,6,9,
		9,9,100,120,100,100,100,100,100,100,100,176,1,0,
		103,1,0,12,1,92,15,34,28,8,95,5,122,72,
		25,13,176,1,0,95,1,12,1,109,2,0,65,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,100,9,20,56,36,74,0,176,11,
		0,20,0,36,77,0,176,1,0,103,1,0,12,1,
		92,15,15,29,168,0,36,80,0,176,4,0,20,0,
		176,5,0,106,12,87,105,110,95,83,99,114,111,108,
		108,49,0,106,3,84,49,0,95,3,95,2,176,9,
		0,106,10,87,105,110,95,77,101,110,117,49,0,106,
		7,72,101,105,103,104,116,0,12,2,72,109,6,0,
		92,32,120,120,120,120,120,9,106,1,0,100,100,100,
		100,100,100,93,128,0,93,128,0,93,128,0,4,3,
		0,90,27,176,12,0,176,9,0,98,10,0,93,60,
		1,1,106,5,78,97,109,101,0,12,2,12,1,6,
		9,9,9,100,120,100,100,100,100,100,100,100,100,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,100,9,20,56,36,81,0,176,11,
		0,20,0,36,85,0,176,13,0,98,10,0,92,60,
		1,176,14,0,176,15,0,106,11,69,118,101,110,116,
		77,101,110,117,49,0,12,1,12,1,12,2,121,5,
		28,23,36,86,0,176,16,0,106,11,69,118,101,110,
		116,77,101,110,117,49,0,20,1,36,89,0,176,17,
		0,176,9,0,106,10,87,105,110,95,77,101,110,117,
		49,0,106,7,72,97,110,100,108,101,0,12,2,122,
		100,100,9,120,20,6,36,93,0,176,18,0,176,19,
		0,106,10,87,105,110,95,77,101,110,117,49,0,12,
		1,121,9,20,3,36,94,0,176,18,0,176,19,0,
		106,10,87,105,110,95,77,101,110,117,49,0,12,1,
		122,9,20,3,36,101,0,176,20,0,106,10,87,105,
		110,95,77,101,110,117,49,0,20,1,36,104,0,176,
		21,0,106,10,87,105,110,95,77,101,110,117,49,0,
		20,1,36,106,0,176,1,0,103,1,0,12,1,92,
		15,15,29,157,0,176,22,0,106,12,87,105,110,95,
		83,99,114,111,108,108,49,0,12,1,29,135,0,36,
		108,0,176,17,0,176,9,0,106,12,87,105,110,95,
		83,99,114,111,108,108,49,0,106,7,72,97,110,100,
		108,101,0,12,2,97,0,0,128,0,100,9,120,20,
		5,36,109,0,176,17,0,176,9,0,106,12,87,105,
		110,95,83,99,114,111,108,108,49,0,106,7,72,97,
		110,100,108,101,0,12,2,100,97,0,0,2,0,120,
		120,20,5,36,112,0,176,20,0,106,12,87,105,110,
		95,83,99,114,111,108,108,49,0,20,1,36,114,0,
		176,21,0,106,12,87,105,110,95,83,99,114,111,108,
		108,49,0,20,1,36,123,0,95,4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XFECHAMEN )
{
	static const HB_BYTE pcode[] =
	{
		13,3,0,36,129,0,121,80,1,36,131,0,176,24,
		0,106,5,77,101,110,49,0,12,1,80,2,36,132,
		0,176,24,0,106,3,84,49,0,12,1,80,3,36,
		135,0,95,2,121,15,29,193,0,36,139,0,176,25,
		0,95,2,93,18,1,97,96,240,0,0,121,20,4,
		36,141,0,176,26,0,20,0,36,142,0,176,26,0,
		20,0,36,144,0,176,25,0,95,2,93,18,1,92,
		2,121,20,4,36,146,0,176,26,0,20,0,36,149,
		0,95,3,121,15,28,61,36,151,0,176,25,0,95,
		3,93,18,1,97,96,240,0,0,121,20,4,36,153,
		0,176,26,0,20,0,36,154,0,176,26,0,20,0,
		36,156,0,176,25,0,95,3,93,18,1,92,2,121,
		20,4,36,158,0,176,26,0,20,0,36,164,0,176,
		27,0,106,11,69,118,101,110,116,77,101,110,117,49,
		0,12,1,31,42,36,165,0,176,28,0,106,30,69,
		114,114,111,32,97,111,32,114,101,109,111,118,101,114,
		32,72,97,110,100,108,101,32,69,118,101,110,116,46,
		0,20,1,36,177,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTMENU1 )
{
	static const HB_BYTE pcode[] =
	{
		13,8,4,116,52,0,36,183,0,106,1,0,80,5,
		36,184,0,121,80,6,36,185,0,121,80,7,36,187,
		0,121,80,9,36,188,0,106,1,0,80,10,36,189,
		0,121,80,11,36,190,0,120,80,12,36,194,0,176,
		22,0,106,10,87,105,110,95,77,101,110,117,49,0,
		12,1,31,6,36,195,0,7,36,199,0,176,22,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,29,236,1,95,1,176,9,0,106,12,87,105,
		110,95,83,99,114,111,108,108,49,0,106,7,72,65,
		78,68,76,69,0,12,2,8,29,202,1,36,202,0,
		95,2,93,0,2,8,29,169,0,36,204,0,176,30,
		0,96,6,0,96,7,0,20,2,36,206,0,176,31,
		0,176,19,0,106,12,87,105,110,95,83,99,114,111,
		108,108,49,0,12,1,95,7,95,6,12,3,80,8,
		36,208,0,120,80,12,36,210,0,95,8,122,1,92,
		16,35,28,8,36,211,0,9,80,12,36,215,0,95,
		12,28,47,36,217,0,103,8,0,31,17,36,218,0,
		176,32,0,95,1,109,33,0,20,2,25,67,36,220,
		0,176,32,0,95,1,106,8,78,65,79,80,79,68,
		69,0,20,2,25,45,36,225,0,103,7,0,31,17,
		36,226,0,176,32,0,95,1,109,33,0,20,2,25,
		22,36,228,0,176,32,0,95,1,106,8,78,65,79,
		80,79,68,69,0,20,2,36,237,0,95,2,93,1,
		2,8,29,12,1,36,239,0,176,30,0,96,6,0,
		96,7,0,20,2,36,241,0,176,31,0,176,19,0,
		106,12,87,105,110,95,83,99,114,111,108,108,49,0,
		12,1,95,7,95,6,12,3,80,8,36,243,0,120,
		80,12,36,245,0,95,8,122,1,92,16,35,28,8,
		36,246,0,9,80,12,36,250,0,103,10,0,121,8,
		28,10,36,251,0,92,15,82,10,0,36,254,0,95,
		12,28,76,36,255,0,176,34,0,122,176,9,0,106,
		10,87,105,110,95,77,101,110,117,49,0,106,7,72,
		65,78,68,76,69,0,12,2,104,9,0,104,10,0,
		176,1,0,103,1,0,12,1,104,8,0,104,7,0,
		122,106,10,87,105,110,95,77,101,110,117,49,0,93,
		44,1,9,20,11,25,75,36,1,1,176,34,0,92,
		2,176,9,0,106,10,87,105,110,95,77,101,110,117,
		49,0,106,7,72,65,78,68,76,69,0,12,2,104,
		9,0,104,10,0,176,1,0,103,1,0,12,1,104,
		8,0,104,7,0,122,106,10,87,105,110,95,77,101,
		110,117,49,0,93,44,1,9,20,11,36,4,1,176,
		21,0,106,12,87,105,110,95,83,99,114,111,108,108,
		49,0,20,1,36,13,1,95,1,176,9,0,106,10,
		87,105,110,95,77,101,110,117,49,0,106,7,72,65,
		78,68,76,69,0,12,2,8,29,43,3,36,15,1,
		95,2,93,163,2,8,28,52,103,11,0,28,47,36,
		17,1,121,82,2,0,36,18,1,121,82,3,0,36,
		19,1,176,21,0,95,1,20,1,36,20,1,176,32,
		0,95,1,93,0,127,20,2,36,21,1,176,35,0,
		20,0,36,27,1,95,2,93,1,2,8,28,122,36,
		31,1,103,2,0,176,1,0,103,1,0,12,1,34,
		28,105,36,33,1,103,1,0,103,2,0,1,92,3,
		1,31,50,36,34,1,176,32,0,95,1,93,0,127,
		20,2,36,35,1,176,36,0,106,20,79,112,231,227,
		111,32,73,110,100,105,115,112,111,110,105,118,101,108,
		46,0,9,20,2,36,36,1,7,36,39,1,103,1,
		0,103,2,0,1,92,4,1,100,69,28,25,36,40,
		1,48,37,0,103,1,0,103,2,0,1,92,4,1,
		112,0,73,36,42,1,7,36,53,1,95,2,93,0,
		2,8,29,95,2,36,57,1,103,2,0,121,15,28,
		42,36,58,1,103,2,0,176,38,0,106,10,87,105,
		110,95,77,101,110,117,49,0,121,176,1,0,103,1,
		0,12,1,121,12,4,5,28,6,36,59,1,7,36,
		63,1,176,38,0,106,10,87,105,110,95,77,101,110,
		117,49,0,121,176,1,0,103,1,0,12,1,121,12,
		4,82,2,0,36,64,1,176,9,0,106,10,87,105,
		110,95,77,101,110,117,49,0,106,11,86,115,99,114,
		111,108,108,66,97,114,0,106,6,86,97,108,117,101,
		0,12,3,66,80,11,36,68,1,103,2,0,176,1,
		0,103,1,0,12,1,34,28,42,36,69,1,103,1,
		0,103,2,0,1,92,3,1,31,27,36,70,1,176,
		32,0,95,1,93,0,127,20,2,36,71,1,176,35,
		0,20,0,36,72,1,7,36,77,1,176,32,0,95,
		1,109,33,0,20,2,36,81,1,103,3,0,121,15,
		28,29,36,82,1,176,39,0,106,10,87,105,110,95,
		77,101,110,117,49,0,104,3,0,104,2,0,121,20,
		4,36,86,1,103,2,0,121,15,28,13,36,87,1,
		103,2,0,82,3,0,25,6,36,89,1,7,36,93,
		1,103,2,0,176,1,0,103,1,0,12,1,15,28,
		14,36,94,1,176,35,0,20,0,36,95,1,7,36,
		99,1,103,2,0,121,15,28,44,36,100,1,176,40,
		0,106,10,87,105,110,95,77,101,110,117,49,0,95,
		11,103,2,0,122,49,109,2,0,65,72,121,109,6,
		0,109,2,0,122,49,120,20,6,36,105,1,176,41,
		0,176,14,0,103,1,0,103,2,0,1,92,2,1,
		12,1,12,1,32,220,0,36,107,1,176,14,0,103,
		1,0,103,2,0,1,92,2,1,12,1,80,10,36,
		109,1,121,80,11,36,112,1,176,30,0,96,6,0,
		96,11,0,20,2,36,114,1,176,22,0,106,8,87,
		105,110,95,77,115,103,0,12,1,31,61,36,115,1,
		176,42,0,95,11,176,9,0,106,10,87,105,110,95,
		77,101,110,117,49,0,106,6,87,105,100,116,104,0,
		12,2,92,15,49,176,14,0,95,10,12,1,100,101,
		0,0,0,0,0,0,224,63,10,1,20,5,25,88,
		36,117,1,176,43,0,95,10,95,11,92,15,72,176,
		9,0,106,10,87,105,110,95,77,101,110,117,49,0,
		106,4,67,111,108,0,12,2,176,9,0,106,10,87,
		105,110,95,77,101,110,117,49,0,106,6,87,105,100,
		116,104,0,12,2,72,92,3,72,92,5,72,20,3,
		36,118,1,176,24,0,106,6,120,72,105,110,116,0,
		20,1,36,122,1,176,44,0,95,10,20,1,25,10,
		36,126,1,176,35,0,20,0,36,131,1,176,45,0,
		95,1,12,1,82,11,0,36,140,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTSCROOL )
{
	static const HB_BYTE pcode[] =
	{
		13,4,1,116,52,0,36,152,1,176,46,0,95,1,
		92,4,96,5,0,12,3,80,4,36,155,1,103,7,
		0,31,23,36,156,1,176,47,0,106,7,83,69,84,
		65,66,50,0,12,1,80,2,25,22,36,159,1,176,
		47,0,106,8,83,69,84,65,66,50,68,0,12,1,
		80,2,36,164,1,103,8,0,31,23,36,165,1,176,
		47,0,106,7,83,69,84,65,67,50,0,12,1,80,
		3,25,22,36,167,1,176,47,0,106,8,83,69,84,
		65,67,50,68,0,12,1,80,3,36,172,1,176,48,
		0,95,4,121,121,109,6,0,92,15,92,3,95,2,
		20,7,36,173,1,176,48,0,95,4,92,16,121,109,
		6,0,92,16,92,3,95,3,20,7,36,176,1,176,
		49,0,95,2,20,1,36,177,1,176,49,0,95,3,
		20,1,36,180,1,176,50,0,95,5,20,1,36,184,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,52,0,11,0,116,52,0,4,0,0,82,1,0,
		121,82,2,0,121,82,3,0,106,1,0,82,4,0,
		122,82,5,0,93,44,1,82,6,0,9,82,7,0,
		120,82,8,0,121,82,9,0,121,82,10,0,9,82,
		11,0,7
	};

	hb_vmExecute( pcode, symbols );
}

