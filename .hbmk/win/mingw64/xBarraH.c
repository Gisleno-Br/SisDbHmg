/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\xBarraH.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XBARRAH );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_EXTERN( __MVPRIVATE );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC( XPAINTBARRAH );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC( XCALCBARH );
HB_FUNC_EXTERN( SETLAYEREDWINDOWATTRIBUTES );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC_EXTERN( HMG_CHANGEWINDOWSTYLE );
HB_FUNC( XSHOWHINT );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( CRIEJANTIP );
HB_FUNC_EXTERN( XDISPHINT );
HB_FUNC_EXTERN( XDISPUPTAM );
HB_FUNC_EXTERN( BRINGTOP );
HB_FUNC_EXTERN( INT );
HB_FUNC( UPDATEBARH );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLHORIZONTAL );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( BT_DRAWFILLROUNDRECT );
HB_FUNC_EXTERN( BT_BITMAPRELEASE );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC( XGETBARNAME );
HB_FUNC( EVENTBARRA );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC_EXTERN( GETASYNCKEYSTATE );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC( XOFFBARRA );
HB_FUNC( XDCBARH );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( CURSORHAND1 );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
HB_FUNC( XCHECKOBJ );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC( XLUZOFF );
HB_FUNC_EXTERN( BT_DRAWDCTODCALPHABLEND );
HB_FUNC_EXTERN( BT_DRAWDCTODC );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XBARRAH )
{ "XBARRAH", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XBARRAH )}, NULL },
{ "CJANNAME", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "CACTIVEJAN", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "__MVPRIVATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( __MVPRIVATE )}, NULL },
{ "CJANSOMBRA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "XPAINTBARRAH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTBARRAH )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "COBJSELECTED", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XCALCBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCALCBARH )}, NULL },
{ "SETLAYEREDWINDOWATTRIBUTES", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETLAYEREDWINDOWATTRIBUTES )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "HMG_CHANGEWINDOWSTYLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CHANGEWINDOWSTYLE )}, NULL },
{ "XSHOWHINT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSHOWHINT )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "CRIEJANTIP", {HB_FS_PUBLIC}, {HB_FUNCNAME( CRIEJANTIP )}, NULL },
{ "XDISPHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPHINT )}, NULL },
{ "XDISPUPTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPUPTAM )}, NULL },
{ "BRINGTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BRINGTOP )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "UPDATEBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( UPDATEBARH )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_DRAWGRADIENTFILLHORIZONTAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLHORIZONTAL )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "BT_DRAWFILLROUNDRECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWFILLROUNDRECT )}, NULL },
{ "BT_BITMAPRELEASE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPRELEASE )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "XGETBARNAME", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETBARNAME )}, NULL },
{ "EVENTBARRA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTBARRA )}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "GETASYNCKEYSTATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETASYNCKEYSTATE )}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "XOFFBARRA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XOFFBARRA )}, NULL },
{ "XDCBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDCBARH )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "NHSCROOL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "CURSORHAND1", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURSORHAND1 )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "XCHECKOBJ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCHECKOBJ )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "XLUZOFF", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XLUZOFF )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00017)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_XBARRAH, "Prg\\xBarraH.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_XBARRAH
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_XBARRAH )
   #include "hbiniseg.h"
#endif

HB_FUNC( XBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,6,116,63,0,36,38,0,106,7,87,105,110,
		95,66,104,0,176,2,0,109,3,0,92,4,12,2,
		72,176,4,0,108,1,20,1,81,1,0,36,39,0,
		106,13,87,105,110,95,83,111,109,98,114,97,66,104,
		0,176,2,0,109,3,0,92,4,12,2,72,176,4,
		0,108,5,20,1,81,5,0,36,40,0,109,5,0,
		82,2,0,36,41,0,95,4,82,3,0,36,42,0,
		109,1,0,82,1,0,36,43,0,95,6,82,16,0,
		36,44,0,95,5,82,13,0,36,54,0,176,6,0,
		20,0,176,7,0,109,1,0,106,14,120,83,99,114,
		111,120,82,111,108,101,111,108,49,0,176,2,0,95,
		2,92,4,12,2,72,176,8,0,95,2,106,4,67,
		111,108,0,12,2,95,3,176,8,0,95,2,106,6,
		87,105,100,116,104,0,12,2,92,22,72,92,20,9,
		9,120,120,120,9,106,1,0,100,100,100,100,100,100,
		93,255,0,93,255,0,93,255,0,4,3,0,90,33,
		176,9,0,176,8,0,98,10,0,93,60,1,1,106,
		5,78,97,109,101,0,12,2,103,4,0,103,5,0,
		12,3,6,9,9,9,100,120,100,100,100,100,100,100,
		100,100,100,100,100,100,100,100,100,9,100,100,100,9,
		100,100,100,100,100,100,100,100,95,1,120,20,56,36,
		55,0,176,11,0,20,0,36,66,0,176,6,0,20,
		0,176,7,0,109,5,0,106,20,120,83,99,114,111,
		120,82,111,108,101,111,108,49,83,111,109,98,114,97,
		0,176,2,0,95,2,92,4,12,2,72,176,8,0,
		95,2,106,4,67,111,108,0,12,2,95,3,176,8,
		0,95,2,106,6,87,105,100,116,104,0,12,2,92,
		22,72,92,40,9,9,120,120,120,9,106,1,0,100,
		100,100,100,100,90,16,106,7,66,97,114,114,97,72,
		0,165,83,12,0,6,97,242,242,242,0,100,9,9,
		9,100,120,100,100,100,100,100,100,100,100,100,100,100,
		100,100,100,100,9,100,100,100,9,100,100,100,100,100,
		100,100,100,95,1,120,20,56,36,67,0,176,11,0,
		20,0,36,71,0,176,13,0,12,0,121,15,82,15,
		0,36,76,0,176,14,0,176,15,0,109,1,0,12,
		1,121,103,15,0,31,7,93,167,0,25,3,121,92,
		2,20,4,36,77,0,176,16,0,98,10,0,92,60,
		1,176,17,0,176,18,0,106,11,69,118,101,110,116,
		66,97,114,114,97,0,12,1,12,1,12,2,121,5,
		28,28,103,15,0,28,23,36,78,0,176,19,0,106,
		11,69,118,101,110,116,66,97,114,114,97,0,20,1,
		36,80,0,176,20,0,176,8,0,109,1,0,106,7,
		72,65,78,68,76,69,0,12,2,97,0,0,128,0,
		100,120,20,4,36,83,0,109,1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSHOWHINT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,36,89,0,176,22,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,42,36,90,0,176,23,
		0,95,1,92,20,49,95,2,93,250,0,49,176,17,
		0,95,3,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,28,36,92,0,176,24,0,176,
		17,0,95,3,12,1,95,1,92,20,49,95,2,93,
		250,0,49,20,3,36,95,0,176,25,0,95,3,20,
		1,36,97,0,176,26,0,106,6,120,72,105,110,116,
		0,20,1,36,99,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCALCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,5,0,116,63,0,36,106,0,121,80,1,36,107,
		0,121,80,2,36,108,0,176,8,0,103,1,0,106,
		6,87,105,100,116,104,0,12,2,92,58,49,80,3,
		36,110,0,103,13,0,103,3,0,18,92,100,65,80,
		4,36,111,0,176,27,0,103,3,0,92,10,18,12,
		1,80,5,36,115,0,103,3,0,103,13,0,34,31,
		9,95,4,92,95,16,28,20,36,116,0,121,80,1,
		36,117,0,121,80,5,36,118,0,121,110,7,36,120,
		0,176,27,0,92,100,95,4,49,92,100,18,103,13,
		0,65,12,1,80,1,36,123,0,103,13,0,103,3,
		0,103,13,0,49,49,80,1,36,126,0,95,1,92,
		50,49,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDATEBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,36,136,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,63,0,36,144,0,176,29,0,95,1,
		12,1,80,5,36,145,0,176,30,0,95,1,12,1,
		80,6,36,146,0,176,13,0,12,0,80,7,36,148,
		0,176,31,0,106,9,69,83,81,85,69,82,68,65,
		0,12,1,80,8,36,149,0,176,31,0,106,8,68,
		73,82,69,73,84,65,0,12,1,80,9,36,151,0,
		176,32,0,95,1,92,4,96,4,0,12,3,80,10,
		36,153,0,95,3,100,8,28,5,121,25,4,95,3,
		80,3,36,155,0,9,82,17,0,36,158,0,95,2,
		121,15,28,64,36,160,0,95,2,92,2,5,28,25,
		36,161,0,176,31,0,106,9,68,73,82,69,73,84,
		65,49,0,12,1,80,9,25,24,36,163,0,176,31,
		0,106,10,69,83,81,85,69,82,68,65,49,0,12,
		1,80,8,36,166,0,120,82,17,0,36,170,0,103,
		15,0,31,45,36,171,0,176,31,0,106,10,69,83,
		81,85,69,82,68,65,68,0,12,1,80,8,36,172,
		0,176,31,0,106,9,68,73,82,69,73,84,65,68,
		0,12,1,80,9,36,177,0,176,33,0,95,10,121,
		121,95,5,95,6,93,230,0,93,230,0,93,230,0,
		4,3,0,93,230,0,93,230,0,93,230,0,4,3,
		0,20,7,36,180,0,176,34,0,95,10,121,121,92,
		18,92,18,92,3,95,8,20,7,36,181,0,176,34,
		0,95,10,121,95,5,92,20,49,92,18,92,18,92,
		3,95,9,20,7,36,183,0,103,12,0,31,57,103,
		15,0,28,52,36,184,0,176,35,0,95,10,92,4,
		103,14,0,95,7,92,10,92,5,92,5,93,178,0,
		93,178,0,93,178,0,4,3,0,93,178,0,93,178,
		0,93,178,0,4,3,0,121,20,10,25,117,36,188,
		0,103,15,0,28,109,36,190,0,103,12,0,28,52,
		36,191,0,176,35,0,95,10,92,4,95,3,95,7,
		121,49,92,10,92,5,92,5,92,12,93,134,0,93,
		166,0,4,3,0,93,166,0,93,166,0,93,166,0,
		4,3,0,121,20,10,25,51,36,193,0,176,35,0,
		95,10,92,4,103,14,0,95,7,121,49,92,10,92,
		5,92,5,92,12,93,134,0,93,166,0,4,3,0,
		93,166,0,93,166,0,93,166,0,4,3,0,121,20,
		10,36,200,0,176,36,0,95,8,20,1,36,201,0,
		176,36,0,95,9,20,1,36,202,0,176,37,0,95,
		4,20,1,36,204,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETBARNAME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,63,0,36,209,0,95,1,122,5,28,
		7,103,1,0,25,5,103,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,19,4,116,63,0,36,216,0,106,1,0,80,5,
		36,217,0,121,80,6,36,218,0,121,80,7,36,219,
		0,9,80,8,36,222,0,121,80,9,36,224,0,176,
		29,0,103,1,0,12,1,80,10,36,226,0,176,13,
		0,12,0,80,11,36,231,0,103,3,0,95,11,49,
		80,12,36,233,0,103,13,0,95,11,49,80,13,36,
		241,0,9,80,15,36,243,0,121,80,16,36,245,0,
		9,80,17,36,248,0,9,80,19,36,249,0,9,80,
		20,36,251,0,92,18,80,21,36,253,0,121,80,22,
		36,254,0,121,80,23,36,5,1,176,22,0,103,2,
		0,12,1,29,236,6,95,1,176,8,0,103,2,0,
		106,7,72,65,78,68,76,69,0,12,2,8,29,213,
		6,36,8,1,95,2,93,2,2,8,28,28,36,10,
		1,176,40,0,101,123,20,174,71,225,122,148,63,10,
		2,20,1,36,11,1,9,82,12,0,36,17,1,95,
		2,93,1,2,8,29,168,4,36,19,1,103,11,0,
		80,9,36,21,1,103,11,0,80,16,36,23,1,9,
		80,8,36,25,1,121,80,21,36,27,1,122,165,80,
		18,25,18,36,28,1,176,41,0,95,18,20,1,36,
		27,1,175,18,0,93,255,0,15,28,236,36,31,1,
		103,12,0,29,20,2,103,6,0,32,14,2,36,35,
		1,176,42,0,96,6,0,96,7,0,20,2,36,36,
		1,176,43,0,95,1,95,7,95,6,12,3,80,14,
		36,37,1,95,14,92,2,1,80,9,36,39,1,9,
		80,15,36,43,1,95,8,31,77,36,44,1,176,21,
		0,95,7,95,6,106,55,67,108,105,99,107,32,101,
		32,65,114,114,97,115,116,101,32,68,101,118,97,103,
		97,114,32,112,97,114,97,32,78,97,118,101,103,97,
		114,32,101,110,116,114,101,32,97,115,32,67,111,108,
		117,110,97,115,46,0,20,3,36,45,1,120,80,8,
		36,50,1,176,41,0,122,12,1,121,8,28,36,36,
		51,1,176,44,0,103,1,0,20,1,36,52,1,176,
		45,0,20,0,36,53,1,120,82,6,0,36,54,1,
		176,46,0,20,0,36,58,1,95,9,95,16,69,29,
		58,255,36,59,1,95,9,95,16,15,29,194,0,36,
		60,1,95,9,95,16,49,92,10,16,29,23,1,36,
		62,1,103,14,0,103,3,0,103,13,0,49,49,92,
		40,15,31,80,36,63,1,95,9,95,16,49,80,22,
		36,64,1,104,5,0,109,47,0,135,36,65,1,104,
		14,0,109,47,0,135,36,66,1,176,48,0,176,15,
		0,103,16,0,12,1,93,0,1,92,39,109,47,0,
		20,4,36,67,1,176,45,0,20,0,36,69,1,95,
		9,80,16,36,70,1,120,80,15,26,182,0,36,72,
		1,120,82,6,0,36,73,1,176,49,0,176,50,0,
		106,55,67,111,108,117,110,97,32,109,97,105,115,32,
		97,32,68,105,114,101,105,116,97,32,65,116,105,110,
		103,105,100,97,46,78,227,111,32,101,32,112,111,115,
		115,105,118,101,108,32,65,118,97,110,231,97,114,46,
		0,12,1,20,1,26,138,0,36,82,1,176,51,0,
		95,16,95,9,49,12,1,92,10,16,28,83,36,83,
		1,103,14,0,92,18,15,28,66,36,84,1,104,14,
		0,109,47,0,136,36,85,1,104,5,0,109,47,0,
		136,36,86,1,176,48,0,176,15,0,103,16,0,12,
		1,93,0,1,92,37,121,20,4,36,88,1,176,45,
		0,20,0,36,90,1,9,80,19,36,91,1,120,80,
		15,25,8,36,94,1,120,80,19,36,103,1,95,15,
		29,5,254,103,6,0,32,255,253,36,104,1,176,40,
		0,101,123,20,174,71,225,122,132,63,10,2,20,1,
		26,233,253,36,116,1,95,8,28,29,36,117,1,9,
		82,12,0,36,119,1,9,82,6,0,36,120,1,9,
		82,7,0,36,121,1,9,80,8,36,125,1,103,10,
		0,122,5,29,247,0,103,6,0,32,241,0,36,127,
		1,103,14,0,92,18,15,29,133,0,36,128,1,104,
		14,0,109,47,0,136,36,129,1,176,48,0,176,15,
		0,103,16,0,12,1,93,0,1,92,37,121,20,4,
		36,130,1,176,52,0,103,1,0,20,1,36,131,1,
		176,46,0,20,0,36,132,1,176,41,0,122,12,1,
		121,8,28,38,36,133,1,120,82,6,0,36,134,1,
		121,82,10,0,36,135,1,176,40,0,101,184,30,133,
		235,81,184,158,63,10,2,20,1,26,129,0,36,138,
		1,176,45,0,20,0,36,139,1,176,40,0,101,123,
		20,174,71,225,122,132,63,10,2,20,1,26,100,255,
		36,142,1,176,46,0,20,0,36,143,1,176,52,0,
		103,1,0,20,1,36,144,1,176,40,0,101,123,20,
		174,71,225,122,164,63,10,2,20,1,36,145,1,120,
		82,6,0,36,146,1,176,49,0,176,50,0,106,33,
		67,111,108,117,110,97,32,109,97,105,115,32,97,32,
		69,115,113,117,101,114,100,97,32,65,116,105,110,103,
		105,100,97,46,0,12,1,20,1,26,4,255,36,154,
		1,103,10,0,92,2,5,29,38,1,103,6,0,32,
		32,1,36,158,1,103,14,0,103,3,0,103,13,0,
		49,49,92,40,15,31,124,36,159,1,104,14,0,109,
		47,0,135,36,160,1,176,52,0,103,1,0,20,1,
		36,161,1,176,48,0,176,15,0,103,16,0,12,1,
		93,0,1,92,39,121,20,4,36,162,1,176,41,0,
		122,12,1,121,8,28,38,36,163,1,120,82,6,0,
		36,164,1,121,82,10,0,36,165,1,176,40,0,101,
		184,30,133,235,81,184,158,63,10,2,20,1,26,177,
		0,36,168,1,176,40,0,101,123,20,174,71,225,122,
		132,63,10,2,20,1,36,169,1,176,45,0,20,0,
		26,100,255,36,173,1,176,49,0,176,50,0,106,32,
		67,111,108,117,110,97,32,109,97,105,115,32,97,32,
		68,105,114,101,105,116,97,32,65,116,105,110,103,105,
		100,97,46,0,12,1,106,4,32,32,32,0,72,176,
		53,0,103,13,0,103,14,0,72,12,1,72,106,4,
		32,32,32,0,72,176,53,0,103,3,0,92,18,72,
		12,1,72,20,1,36,174,1,104,14,0,109,47,0,
		136,36,175,1,176,46,0,20,0,36,176,1,176,52,
		0,103,1,0,20,1,36,177,1,176,40,0,101,123,
		20,174,71,225,122,164,63,10,2,20,1,36,178,1,
		120,82,6,0,26,212,254,36,187,1,95,2,93,163,
		2,8,73,36,192,1,95,2,93,0,2,8,29,233,
		1,36,194,1,176,42,0,96,6,0,96,7,0,20,
		2,36,195,1,176,43,0,95,1,95,7,95,6,12,
		3,80,14,36,196,1,95,14,92,2,1,80,6,36,
		198,1,95,14,122,1,92,20,16,28,19,36,214,1,
		176,44,0,103,1,0,20,1,36,216,1,100,110,7,
		36,219,1,95,6,92,18,15,28,22,95,6,95,10,
		92,18,49,35,28,12,36,220,1,121,82,10,0,26,
		4,1,36,225,1,103,7,0,32,251,0,36,227,1,
		121,82,10,0,36,229,1,176,54,0,95,1,93,0,
		127,20,2,36,231,1,103,4,0,121,15,28,36,36,
		232,1,121,82,4,0,36,233,1,176,52,0,103,1,
		0,20,1,36,234,1,176,46,0,20,0,36,235,1,
		176,45,0,20,0,36,239,1,95,6,92,18,35,28,
		74,36,240,1,176,55,0,95,1,20,1,36,241,1,
		122,82,4,0,36,242,1,176,56,0,103,1,0,121,
		121,92,25,92,20,120,20,6,36,243,1,122,82,10,
		0,36,244,1,9,82,6,0,36,245,1,120,82,7,
		0,36,246,1,176,46,0,20,0,36,247,1,176,45,
		0,20,0,36,250,1,95,6,95,10,92,18,49,16,
		28,91,36,251,1,176,55,0,95,1,20,1,36,252,
		1,92,2,82,4,0,36,253,1,176,56,0,103,1,
		0,121,95,10,92,25,49,92,25,92,20,120,20,6,
		36,254,1,92,2,82,10,0,36,255,1,9,82,6,
		0,36,1,2,120,82,7,0,36,2,2,176,40,0,
		101,123,20,174,71,225,122,148,63,10,2,20,1,36,
		3,2,176,45,0,20,0,36,10,2,103,10,0,121,
		5,28,122,36,12,2,95,6,103,14,0,16,28,39,
		95,6,103,14,0,95,11,72,34,28,28,36,13,2,
		93,231,3,82,10,0,36,14,2,120,82,12,0,36,
		15,2,95,6,82,11,0,25,15,36,17,2,9,82,
		12,0,36,18,2,9,80,8,36,21,2,176,52,0,
		103,1,0,20,1,36,22,2,176,46,0,20,0,36,
		23,2,176,45,0,20,0,36,27,2,121,82,4,0,
		36,28,2,176,52,0,103,1,0,20,1,36,31,2,
		9,82,6,0,36,32,2,9,82,7,0,36,39,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCHECKOBJ )
{
	static const HB_BYTE pcode[] =
	{
		116,63,0,36,45,2,176,58,0,176,17,0,109,12,
		0,12,1,12,1,31,48,109,12,0,106,8,66,114,
		111,119,115,101,114,0,69,28,32,36,47,2,176,44,
		0,103,1,0,20,1,36,48,2,176,40,0,101,123,
		20,174,71,225,122,148,63,10,2,20,1,36,52,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOFFBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,63,0,36,57,2,9,82,12,0,36,
		58,2,176,54,0,176,15,0,95,1,12,1,93,0,
		127,20,2,36,60,2,176,52,0,95,1,20,1,36,
		61,2,176,46,0,20,0,36,62,2,176,45,0,20,
		0,36,64,2,121,82,4,0,36,65,2,176,52,0,
		95,1,20,1,36,67,2,176,45,0,20,0,36,69,
		2,9,82,6,0,36,70,2,9,82,7,0,36,72,
		2,176,46,0,20,0,36,74,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XLUZOFF )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,63,0,36,78,2,121,82,4,0,36,
		79,2,9,82,12,0,36,80,2,176,52,0,95,1,
		20,1,36,84,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,63,0,36,90,2,176,29,0,103,1,
		0,12,1,80,1,36,91,2,176,30,0,103,1,0,
		12,1,80,2,36,96,2,122,80,7,36,97,2,121,
		80,8,36,98,2,92,45,80,9,36,102,2,176,29,
		0,103,2,0,12,1,80,10,36,103,2,176,30,0,
		103,2,0,12,1,80,11,36,105,2,176,32,0,103,
		1,0,92,3,96,4,0,12,3,80,3,36,106,2,
		176,32,0,103,2,0,92,3,96,6,0,12,3,80,
		5,36,109,2,103,15,0,31,32,36,110,2,176,60,
		0,95,5,121,121,95,10,95,11,93,185,0,121,95,
		3,121,121,95,1,95,2,20,12,25,27,36,112,2,
		176,61,0,95,5,121,121,95,10,95,11,121,95,3,
		121,121,95,1,95,2,20,11,36,121,2,176,37,0,
		95,4,20,1,36,122,2,176,37,0,95,6,20,1,
		36,124,2,176,52,0,103,2,0,20,1,36,126,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,63,0,17,0,116,63,0,106,1,0,82,1,0,
		106,1,0,82,2,0,121,82,3,0,121,82,4,0,
		92,18,82,5,0,9,82,6,0,9,82,7,0,120,
		82,8,0,92,18,82,9,0,121,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,92,18,82,14,
		0,120,82,15,0,106,1,0,82,16,0,9,82,17,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

