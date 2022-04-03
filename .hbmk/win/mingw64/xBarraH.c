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
HB_FUNC( XCALCBARH );
HB_FUNC( XGOBARR );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC( XDCBARH );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC( XGOBARL );
HB_FUNC( XRETBARH );
HB_FUNC( UPDATEBARH );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLHORIZONTAL );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( ABS );
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
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( XGETCOLWIDTH );
HB_FUNC_EXTERN( SCROLLCOL );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( HMG_CLEANLASTMOUSEMESSAGE );
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
{ "XCALCBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCALCBARH )}, NULL },
{ "XGOBARR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGOBARR )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "XDCBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDCBARH )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "XGOBARL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGOBARL )}, NULL },
{ "XRETBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETBARH )}, NULL },
{ "UPDATEBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( UPDATEBARH )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_DRAWGRADIENTFILLHORIZONTAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLHORIZONTAL )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
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
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "XGETCOLWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGETCOLWIDTH )}, NULL },
{ "NW1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SCROLLCOL", {HB_FS_PUBLIC}, {HB_FUNCNAME( SCROLLCOL )}, NULL },
{ "NHSCROOL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "HMG_CLEANLASTMOUSEMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CLEANLASTMOUSEMESSAGE )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "CURSORHAND1", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURSORHAND1 )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "XCHECKOBJ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCHECKOBJ )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "XLUZOFF", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XLUZOFF )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00020)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,0,8,116,68,0,36,42,0,106,7,87,105,110,
		95,66,104,0,176,2,0,109,3,0,92,4,12,2,
		72,176,4,0,108,1,20,1,81,1,0,36,43,0,
		106,13,87,105,110,95,83,111,109,98,114,97,66,104,
		0,176,2,0,109,3,0,92,4,12,2,72,176,4,
		0,108,5,20,1,81,5,0,36,44,0,109,5,0,
		82,2,0,36,45,0,95,4,82,3,0,36,46,0,
		109,1,0,82,1,0,36,47,0,95,6,82,16,0,
		36,48,0,95,5,82,13,0,36,53,0,95,7,82,
		18,0,36,56,0,95,8,82,17,0,36,70,0,176,
		6,0,20,0,176,7,0,109,1,0,106,14,120,83,
		99,114,111,120,82,111,108,101,111,108,49,0,176,2,
		0,95,2,92,4,12,2,72,176,8,0,95,2,106,
		4,67,111,108,0,12,2,95,3,176,8,0,95,2,
		106,6,87,105,100,116,104,0,12,2,92,22,72,92,
		20,9,9,120,120,120,9,106,1,0,100,100,100,100,
		100,100,93,255,0,93,255,0,93,255,0,4,3,0,
		90,33,176,9,0,176,8,0,98,10,0,93,60,1,
		1,106,5,78,97,109,101,0,12,2,103,4,0,103,
		5,0,12,3,6,9,9,9,100,120,100,100,100,100,
		100,100,100,100,100,100,100,100,100,100,100,9,100,100,
		100,9,100,100,100,100,100,100,100,100,95,1,120,20,
		56,36,71,0,176,11,0,20,0,36,82,0,176,6,
		0,20,0,176,7,0,109,5,0,106,20,120,83,99,
		114,111,120,82,111,108,101,111,108,49,83,111,109,98,
		114,97,0,176,2,0,95,2,92,4,12,2,72,176,
		8,0,95,2,106,4,67,111,108,0,12,2,95,3,
		176,8,0,95,2,106,6,87,105,100,116,104,0,12,
		2,92,22,72,92,40,9,9,120,120,120,9,106,1,
		0,100,100,100,100,100,90,16,106,7,66,97,114,114,
		97,72,0,165,83,12,0,6,97,242,242,242,0,100,
		9,9,9,100,120,100,100,100,100,100,100,100,100,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,95,1,120,20,56,36,83,0,176,
		11,0,20,0,36,88,0,103,17,0,121,15,82,15,
		0,36,92,0,176,13,0,176,14,0,109,1,0,12,
		1,121,103,15,0,31,7,93,167,0,25,3,121,92,
		2,20,4,36,93,0,176,15,0,98,10,0,92,60,
		1,176,16,0,176,17,0,106,11,69,118,101,110,116,
		66,97,114,114,97,0,12,1,12,1,12,2,121,5,
		28,28,103,15,0,28,23,36,94,0,176,18,0,106,
		11,69,118,101,110,116,66,97,114,114,97,0,20,1,
		36,96,0,176,19,0,176,8,0,109,1,0,106,7,
		72,65,78,68,76,69,0,12,2,97,0,0,128,0,
		100,120,20,4,36,99,0,109,1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSHOWHINT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,36,105,0,176,21,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,42,36,106,0,176,22,
		0,95,1,92,20,49,95,2,93,250,0,49,176,16,
		0,95,3,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,28,36,108,0,176,23,0,176,
		16,0,95,3,12,1,95,1,92,20,49,95,2,93,
		250,0,49,20,3,36,111,0,176,24,0,95,3,20,
		1,36,113,0,176,25,0,106,6,120,72,105,110,116,
		0,20,1,36,115,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCALCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,116,68,0,36,122,0,121,80,2,36,123,
		0,121,80,3,36,124,0,95,1,103,18,0,92,20,
		65,49,80,4,36,128,0,95,4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGOBARR )
{
	static const HB_BYTE pcode[] =
	{
		116,68,0,36,132,0,176,8,0,103,1,0,106,6,
		87,105,100,116,104,0,12,2,103,17,0,49,92,5,
		49,82,14,0,36,135,0,176,28,0,103,1,0,20,
		1,36,136,0,176,29,0,20,0,36,141,0,176,30,
		0,20,0,36,142,0,176,30,0,20,0,36,146,0,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGOBARL )
{
	static const HB_BYTE pcode[] =
	{
		116,68,0,36,150,0,92,21,82,14,0,36,152,0,
		176,28,0,103,1,0,20,1,36,153,0,176,29,0,
		20,0,36,155,0,176,30,0,20,0,36,156,0,176,
		30,0,20,0,36,158,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETBARH )
{
	static const HB_BYTE pcode[] =
	{
		116,68,0,36,164,0,103,14,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDATEBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,68,0,36,169,0,104,14,0,95,1,
		135,36,170,0,104,5,0,95,1,135,36,173,0,176,
		28,0,103,1,0,20,1,36,174,0,176,29,0,20,
		0,36,177,0,176,30,0,20,0,36,178,0,176,30,
		0,20,0,36,181,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,68,0,36,190,0,176,34,0,95,1,
		12,1,80,5,36,191,0,176,35,0,95,1,12,1,
		80,6,36,192,0,103,17,0,92,20,49,80,7,36,
		195,0,176,36,0,106,9,69,83,81,85,69,82,68,
		65,0,12,1,80,8,36,196,0,176,36,0,106,8,
		68,73,82,69,73,84,65,0,12,1,80,9,36,198,
		0,176,37,0,95,1,92,4,96,4,0,12,3,80,
		10,36,200,0,95,3,100,8,28,5,121,25,4,95,
		3,80,3,36,202,0,9,82,20,0,36,205,0,95,
		2,121,15,28,64,36,207,0,95,2,92,2,5,28,
		25,36,208,0,176,36,0,106,9,68,73,82,69,73,
		84,65,49,0,12,1,80,9,25,24,36,210,0,176,
		36,0,106,10,69,83,81,85,69,82,68,65,49,0,
		12,1,80,8,36,213,0,120,82,20,0,36,217,0,
		103,15,0,31,45,36,218,0,176,36,0,106,10,69,
		83,81,85,69,82,68,65,68,0,12,1,80,8,36,
		219,0,176,36,0,106,9,68,73,82,69,73,84,65,
		68,0,12,1,80,9,36,224,0,176,38,0,95,10,
		121,121,95,5,95,6,93,230,0,93,230,0,93,230,
		0,4,3,0,93,230,0,93,230,0,93,230,0,4,
		3,0,20,7,36,227,0,176,39,0,95,10,121,121,
		92,18,92,18,92,3,95,8,20,7,36,228,0,176,
		39,0,95,10,121,95,5,92,20,49,92,18,92,18,
		92,3,95,9,20,7,36,230,0,176,40,0,103,14,
		0,95,5,49,12,1,92,10,34,73,36,234,0,103,
		12,0,31,57,103,15,0,28,52,36,235,0,176,41,
		0,95,10,92,4,103,14,0,95,7,92,10,92,5,
		92,5,93,178,0,93,178,0,93,178,0,4,3,0,
		93,178,0,93,178,0,93,178,0,4,3,0,121,20,
		10,25,113,36,238,0,103,15,0,28,105,36,240,0,
		103,12,0,28,50,36,241,0,176,41,0,95,10,92,
		4,95,3,95,7,92,10,92,5,92,5,92,12,93,
		134,0,93,166,0,4,3,0,93,166,0,93,166,0,
		93,166,0,4,3,0,121,20,10,25,49,36,243,0,
		176,41,0,95,10,92,4,103,14,0,95,7,92,10,
		92,5,92,5,92,12,93,134,0,93,166,0,4,3,
		0,93,166,0,93,166,0,93,166,0,4,3,0,121,
		20,10,36,250,0,176,42,0,95,8,20,1,36,251,
		0,176,42,0,95,9,20,1,36,252,0,176,43,0,
		95,4,20,1,36,255,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETBARNAME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,68,0,36,4,1,95,1,122,5,28,
		7,103,1,0,25,5,103,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,19,4,116,68,0,36,11,1,106,1,0,80,5,
		36,12,1,121,80,6,36,13,1,121,80,7,36,14,
		1,9,80,8,36,17,1,121,80,9,36,19,1,176,
		34,0,103,1,0,12,1,80,10,36,21,1,103,17,
		0,80,11,36,27,1,103,3,0,95,11,49,80,12,
		36,29,1,103,13,0,95,11,49,80,13,36,37,1,
		9,80,15,36,39,1,121,80,16,36,41,1,9,80,
		17,36,44,1,9,80,19,36,45,1,9,80,20,36,
		47,1,92,18,80,21,36,49,1,121,80,22,36,50,
		1,121,80,23,36,59,1,176,21,0,103,2,0,12,
		1,29,216,6,95,1,176,8,0,103,2,0,106,7,
		72,65,78,68,76,69,0,12,2,8,29,193,6,36,
		62,1,95,2,93,2,2,8,28,28,36,64,1,176,
		46,0,101,123,20,174,71,225,122,148,63,10,2,20,
		1,36,65,1,9,82,12,0,36,73,1,95,2,93,
		1,2,8,29,147,4,36,75,1,103,11,0,80,9,
		36,77,1,103,11,0,80,16,36,79,1,9,80,8,
		36,81,1,121,80,21,36,83,1,176,46,0,101,123,
		20,174,71,225,122,148,63,10,2,20,1,36,87,1,
		122,165,80,18,25,18,36,88,1,176,47,0,95,18,
		20,1,36,87,1,175,18,0,93,255,0,15,28,236,
		36,91,1,103,12,0,29,98,2,103,6,0,32,92,
		2,36,95,1,176,48,0,96,6,0,96,7,0,20,
		2,36,96,1,176,49,0,95,1,95,7,95,6,12,
		3,80,14,36,97,1,95,14,92,2,1,80,9,36,
		99,1,9,80,15,36,104,1,95,8,31,77,36,105,
		1,176,20,0,95,7,95,6,106,55,67,108,105,99,
		107,32,101,32,65,114,114,97,115,116,101,32,68,101,
		118,97,103,97,114,32,112,97,114,97,32,78,97,118,
		101,103,97,114,32,101,110,116,114,101,32,97,115,32,
		67,111,108,117,110,97,115,46,0,20,3,36,106,1,
		120,80,8,36,110,1,176,47,0,122,12,1,121,8,
		28,36,36,111,1,176,50,0,103,1,0,20,1,36,
		112,1,176,29,0,20,0,36,113,1,120,82,6,0,
		36,114,1,176,30,0,20,0,36,121,1,95,9,95,
		16,69,29,58,255,36,122,1,95,9,95,16,15,29,
		250,0,36,125,1,103,5,0,95,11,72,95,10,92,
		20,49,16,28,76,36,126,1,176,51,0,176,52,0,
		106,55,67,111,108,117,110,97,32,109,97,105,115,32,
		97,32,68,105,114,101,105,116,97,32,65,116,105,110,
		103,105,100,97,46,78,227,111,32,201,32,112,111,115,
		115,105,118,101,108,32,65,118,97,110,231,97,114,46,
		0,12,1,20,1,36,127,1,7,36,131,1,176,53,
		0,103,19,0,12,1,83,54,0,36,136,1,95,9,
		95,16,49,109,54,0,16,29,251,0,36,148,1,104,
		5,0,109,54,0,92,20,49,135,36,149,1,104,14,
		0,109,54,0,135,36,151,1,104,19,0,170,36,158,
		1,120,80,15,36,159,1,176,55,0,120,9,20,2,
		36,160,1,95,9,80,16,36,164,1,103,5,0,95,
		11,72,95,10,92,20,49,16,28,29,36,165,1,176,
		27,0,20,0,36,169,1,176,46,0,101,184,30,133,
		235,81,184,158,63,10,2,20,1,36,176,1,176,46,
		0,101,123,20,174,71,225,122,148,63,10,2,20,1,
		36,177,1,176,29,0,20,0,26,124,0,36,192,1,
		176,40,0,95,16,95,9,49,12,1,92,10,16,28,
		105,36,193,1,103,14,0,92,21,15,28,88,36,194,
		1,95,16,95,9,49,80,22,36,195,1,95,22,83,
		56,0,36,196,1,104,14,0,109,56,0,136,36,197,
		1,104,5,0,109,56,0,136,36,200,1,176,29,0,
		20,0,36,201,1,176,46,0,101,10,215,163,112,61,
		10,183,63,10,2,20,1,36,202,1,9,80,19,36,
		203,1,120,80,15,36,204,1,95,9,80,16,25,8,
		36,206,1,120,80,19,36,214,1,95,15,29,183,253,
		103,6,0,32,177,253,36,215,1,176,46,0,101,123,
		20,174,71,225,122,132,63,10,2,20,1,26,155,253,
		36,227,1,95,8,28,29,36,228,1,9,82,12,0,
		36,230,1,9,82,6,0,36,231,1,9,82,7,0,
		36,232,1,9,80,8,36,237,1,122,165,80,18,25,
		18,36,238,1,176,47,0,95,18,20,1,36,237,1,
		175,18,0,93,255,0,15,28,236,36,243,1,103,10,
		0,122,5,29,224,0,103,6,0,32,218,0,36,245,
		1,103,14,0,92,18,15,28,110,36,247,1,176,57,
		0,176,14,0,103,16,0,12,1,93,0,1,92,37,
		121,20,4,36,249,1,176,58,0,20,0,36,252,1,
		176,30,0,20,0,36,253,1,176,47,0,122,12,1,
		121,8,28,37,36,254,1,120,82,6,0,36,255,1,
		121,82,10,0,36,0,2,176,46,0,101,184,30,133,
		235,81,184,158,63,10,2,20,1,25,120,36,4,2,
		176,46,0,101,123,20,174,71,225,122,132,63,10,2,
		20,1,26,123,255,36,7,2,176,30,0,20,0,36,
		8,2,176,28,0,103,1,0,20,1,36,9,2,176,
		46,0,101,123,20,174,71,225,122,164,63,10,2,20,
		1,36,10,2,120,82,6,0,36,11,2,176,51,0,
		176,52,0,106,33,67,111,108,117,110,97,32,109,97,
		105,115,32,97,32,69,115,113,117,101,114,100,97,32,
		65,116,105,110,103,105,100,97,46,0,12,1,20,1,
		26,27,255,36,20,2,103,10,0,92,2,5,29,168,
		0,103,6,0,32,162,0,36,23,2,122,165,80,18,
		25,18,36,24,2,176,47,0,95,18,20,1,36,23,
		2,175,18,0,93,255,0,15,28,236,36,28,2,176,
		30,0,20,0,36,34,2,103,10,0,92,2,5,28,
		111,103,6,0,31,106,36,36,2,176,47,0,122,12,
		1,121,8,28,23,36,37,2,176,46,0,101,184,30,
		133,235,81,184,158,63,10,2,20,1,25,72,36,41,
		2,176,55,0,120,20,1,36,44,2,176,46,0,101,
		154,153,153,153,153,153,169,63,10,2,20,1,36,45,
		2,122,165,80,18,25,18,36,46,2,176,47,0,95,
		18,20,1,36,45,2,175,18,0,93,255,0,15,28,
		236,36,50,2,176,58,0,20,0,26,139,255,36,75,
		2,95,2,93,163,2,8,73,36,80,2,95,2,93,
		0,2,8,29,234,1,36,83,2,176,48,0,96,6,
		0,96,7,0,20,2,36,84,2,176,49,0,95,1,
		95,7,95,6,12,3,80,14,36,85,2,95,14,92,
		2,1,80,6,36,89,2,95,14,122,1,92,20,16,
		28,19,36,91,2,176,50,0,103,1,0,20,1,36,
		92,2,100,110,7,36,97,2,95,6,92,18,15,28,
		22,95,6,95,10,92,18,49,35,28,12,36,98,2,
		121,82,10,0,26,4,1,36,103,2,103,7,0,32,
		251,0,36,105,2,121,82,10,0,36,107,2,176,59,
		0,95,1,93,0,127,20,2,36,109,2,103,4,0,
		121,15,28,36,36,110,2,121,82,4,0,36,111,2,
		176,28,0,103,1,0,20,1,36,112,2,176,30,0,
		20,0,36,113,2,176,29,0,20,0,36,117,2,95,
		6,92,18,35,28,74,36,118,2,176,60,0,95,1,
		20,1,36,119,2,122,82,4,0,36,120,2,176,61,
		0,103,1,0,121,121,92,25,92,20,120,20,6,36,
		121,2,122,82,10,0,36,122,2,9,82,6,0,36,
		123,2,120,82,7,0,36,124,2,176,30,0,20,0,
		36,125,2,176,29,0,20,0,36,128,2,95,6,95,
		10,92,18,49,16,28,91,36,129,2,176,60,0,95,
		1,20,1,36,130,2,92,2,82,4,0,36,131,2,
		176,61,0,103,1,0,121,95,10,92,25,49,92,25,
		92,20,120,20,6,36,132,2,92,2,82,10,0,36,
		133,2,9,82,6,0,36,137,2,120,82,7,0,36,
		138,2,176,46,0,101,123,20,174,71,225,122,148,63,
		10,2,20,1,36,139,2,176,29,0,20,0,36,149,
		2,103,10,0,121,5,29,123,0,36,151,2,95,6,
		103,14,0,16,28,39,95,6,103,14,0,95,11,72,
		34,28,28,36,152,2,93,231,3,82,10,0,36,153,
		2,120,82,12,0,36,154,2,95,6,82,11,0,25,
		15,36,156,2,9,82,12,0,36,157,2,9,80,8,
		36,160,2,176,28,0,103,1,0,20,1,36,161,2,
		176,30,0,20,0,36,162,2,176,29,0,20,0,36,
		166,2,121,82,4,0,36,167,2,176,28,0,103,1,
		0,20,1,36,170,2,9,82,6,0,36,171,2,9,
		82,7,0,36,178,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCHECKOBJ )
{
	static const HB_BYTE pcode[] =
	{
		116,68,0,36,184,2,176,63,0,176,16,0,109,12,
		0,12,1,12,1,31,48,109,12,0,106,8,66,114,
		111,119,115,101,114,0,69,28,32,36,186,2,176,50,
		0,103,1,0,20,1,36,187,2,176,46,0,101,123,
		20,174,71,225,122,148,63,10,2,20,1,36,191,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOFFBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,68,0,36,196,2,9,82,12,0,36,
		197,2,176,59,0,176,14,0,95,1,12,1,93,0,
		127,20,2,36,199,2,176,28,0,95,1,20,1,36,
		200,2,176,30,0,20,0,36,201,2,176,29,0,20,
		0,36,203,2,121,82,4,0,36,204,2,176,28,0,
		95,1,20,1,36,206,2,176,29,0,20,0,36,208,
		2,9,82,6,0,36,209,2,9,82,7,0,36,211,
		2,176,30,0,20,0,36,213,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XLUZOFF )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,68,0,36,217,2,121,82,4,0,36,
		218,2,9,82,12,0,36,219,2,176,28,0,95,1,
		20,1,36,223,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,68,0,36,229,2,176,34,0,103,1,
		0,12,1,80,1,36,230,2,176,35,0,103,1,0,
		12,1,80,2,36,235,2,122,80,7,36,236,2,121,
		80,8,36,237,2,92,45,80,9,36,241,2,176,34,
		0,103,2,0,12,1,80,10,36,242,2,176,35,0,
		103,2,0,12,1,80,11,36,244,2,176,37,0,103,
		1,0,92,3,96,4,0,12,3,80,3,36,245,2,
		176,37,0,103,2,0,92,3,96,6,0,12,3,80,
		5,36,248,2,103,15,0,31,32,36,249,2,176,65,
		0,95,5,121,121,95,10,95,11,93,185,0,121,95,
		3,121,121,95,1,95,2,20,12,25,27,36,251,2,
		176,66,0,95,5,121,121,95,10,95,11,121,95,3,
		121,121,95,1,95,2,20,11,36,4,3,176,43,0,
		95,4,20,1,36,5,3,176,43,0,95,6,20,1,
		36,7,3,176,28,0,103,2,0,20,1,36,9,3,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,68,0,20,0,116,68,0,106,1,0,82,1,0,
		106,1,0,82,2,0,121,82,3,0,121,82,4,0,
		92,18,82,5,0,9,82,6,0,9,82,7,0,120,
		82,8,0,92,18,82,9,0,121,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,92,18,82,14,
		0,120,82,15,0,106,1,0,82,16,0,121,82,17,
		0,121,82,18,0,122,82,19,0,9,82,20,0,7
	};

	hb_vmExecute( pcode, symbols );
}

