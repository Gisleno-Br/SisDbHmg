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
HB_FUNC_EXTERN( CALCETAPAS );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC( XPAINTBARRAH );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( SETLAYEREDWINDOWATTRIBUTES );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( INT );
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
HB_FUNC( XGOBARR );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC( XDCBARH );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC( XGOBARL );
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
HB_FUNC( XZERACONTADOR );
HB_FUNC( INCCONTADOR );
HB_FUNC( EVENTBARRA );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC_EXTERN( GETASYNCKEYSTATE );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC( XOFFBARRA );
HB_FUNC_EXTERN( XGETCOLWIDTH );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( XDCBARHEADER );
HB_FUNC_EXTERN( DECRLEFT );
HB_FUNC_EXTERN( SCROLLCOL );
HB_FUNC_EXTERN( HMG_CLEANLASTMOUSEMESSAGE );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
HB_FUNC( XCHECKOBJ );
HB_FUNC_EXTERN( EMPTY );
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
{ "CALCETAPAS", {HB_FS_PUBLIC}, {HB_FUNCNAME( CALCETAPAS )}, NULL },
{ "NCONST1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "XPAINTBARRAH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTBARRAH )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "COBJSELECTED", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SETLAYEREDWINDOWATTRIBUTES", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETLAYEREDWINDOWATTRIBUTES )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
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
{ "XGOBARR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGOBARR )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "XDCBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDCBARH )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "XGOBARL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGOBARL )}, NULL },
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
{ "XZERACONTADOR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XZERACONTADOR )}, NULL },
{ "INCCONTADOR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( INCCONTADOR )}, NULL },
{ "EVENTBARRA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTBARRA )}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "GETASYNCKEYSTATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETASYNCKEYSTATE )}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "XOFFBARRA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XOFFBARRA )}, NULL },
{ "XGETCOLWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGETCOLWIDTH )}, NULL },
{ "NW1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "N12", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XDCBARHEADER", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDCBARHEADER )}, NULL },
{ "DECRLEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( DECRLEFT )}, NULL },
{ "SCROLLCOL", {HB_FS_PUBLIC}, {HB_FUNCNAME( SCROLLCOL )}, NULL },
{ "HMG_CLEANLASTMOUSEMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CLEANLASTMOUSEMESSAGE )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "XCHECKOBJ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCHECKOBJ )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00025)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,0,10,116,73,0,36,54,0,106,7,87,105,110,
		95,66,104,0,176,2,0,109,3,0,92,4,12,2,
		72,176,4,0,108,1,20,1,81,1,0,36,55,0,
		106,13,87,105,110,95,83,111,109,98,114,97,66,104,
		0,176,2,0,109,3,0,92,4,12,2,72,176,4,
		0,108,5,20,1,81,5,0,36,56,0,109,5,0,
		82,2,0,36,57,0,95,4,82,3,0,36,58,0,
		109,1,0,82,1,0,36,59,0,95,6,82,16,0,
		36,60,0,95,5,82,13,0,36,62,0,95,10,82,
		15,0,36,64,0,176,6,0,12,0,82,24,0,36,
		68,0,95,7,82,18,0,36,69,0,95,5,103,24,
		0,109,7,0,65,49,82,17,0,36,70,0,95,9,
		82,21,0,36,82,0,176,8,0,20,0,176,9,0,
		109,1,0,106,14,120,83,99,114,111,120,82,111,108,
		101,111,108,49,0,176,2,0,95,2,92,4,12,2,
		72,176,10,0,95,2,106,4,67,111,108,0,12,2,
		95,3,176,10,0,95,2,106,6,87,105,100,116,104,
		0,12,2,92,22,72,92,20,9,9,120,120,120,9,
		106,1,0,100,100,100,100,100,100,121,121,121,4,3,
		0,90,33,176,11,0,176,10,0,98,12,0,93,60,
		1,1,106,5,78,97,109,101,0,12,2,103,4,0,
		103,5,0,12,3,6,9,9,9,100,120,100,100,100,
		100,100,100,100,100,100,100,100,100,100,100,100,9,100,
		100,100,9,100,100,100,100,100,100,100,100,95,1,120,
		9,20,57,36,83,0,176,13,0,20,0,36,96,0,
		176,8,0,20,0,176,9,0,109,5,0,106,20,120,
		83,99,114,111,120,82,111,108,101,111,108,49,83,111,
		109,98,114,97,0,176,2,0,95,2,92,4,12,2,
		72,176,10,0,95,2,106,4,67,111,108,0,12,2,
		95,3,176,10,0,95,2,106,6,87,105,100,116,104,
		0,12,2,92,22,72,92,40,9,9,120,120,120,9,
		106,1,0,100,100,100,100,100,90,16,106,7,66,97,
		114,114,97,72,0,165,83,14,0,6,97,242,242,242,
		0,100,9,9,9,100,120,100,100,100,100,100,100,100,
		100,100,100,100,100,100,100,100,9,100,100,100,9,100,
		100,100,100,100,100,100,100,95,1,120,9,20,57,36,
		97,0,176,13,0,20,0,36,101,0,176,15,0,176,
		16,0,109,1,0,12,1,121,103,15,0,31,7,93,
		167,0,25,3,121,92,2,20,4,36,107,0,103,24,
		0,121,15,28,36,36,108,0,176,17,0,176,10,0,
		95,2,106,6,87,105,100,116,104,0,12,2,103,17,
		0,49,103,24,0,18,12,1,82,23,0,36,111,0,
		103,15,0,28,13,36,112,0,103,17,0,121,15,82,
		15,0,36,117,0,176,15,0,176,16,0,109,1,0,
		12,1,121,103,15,0,31,7,93,167,0,25,3,121,
		92,2,20,4,36,118,0,176,18,0,98,12,0,92,
		60,1,176,19,0,176,20,0,106,11,69,118,101,110,
		116,66,97,114,114,97,0,12,1,12,1,12,2,121,
		5,28,28,103,15,0,28,23,36,119,0,176,21,0,
		106,11,69,118,101,110,116,66,97,114,114,97,0,20,
		1,36,121,0,176,22,0,176,10,0,109,1,0,106,
		7,72,65,78,68,76,69,0,12,2,97,0,0,128,
		0,100,120,20,4,36,124,0,109,1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSHOWHINT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,36,151,0,176,24,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,42,36,152,0,176,25,
		0,95,1,92,20,49,95,2,93,250,0,49,176,19,
		0,95,3,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,28,36,154,0,176,26,0,176,
		19,0,95,3,12,1,95,1,92,20,49,95,2,93,
		250,0,49,20,3,36,157,0,176,27,0,95,3,20,
		1,36,159,0,176,28,0,106,6,120,72,105,110,116,
		0,20,1,36,161,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGOBARR )
{
	static const HB_BYTE pcode[] =
	{
		116,73,0,36,180,0,176,10,0,103,1,0,106,6,
		87,105,100,116,104,0,12,2,103,17,0,49,92,5,
		49,82,14,0,36,181,0,176,10,0,103,1,0,106,
		6,87,105,100,116,104,0,12,2,103,17,0,49,92,
		5,49,82,5,0,36,184,0,176,30,0,103,1,0,
		20,1,36,185,0,176,31,0,20,0,36,187,0,176,
		32,0,20,0,36,188,0,176,32,0,20,0,36,191,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGOBARL )
{
	static const HB_BYTE pcode[] =
	{
		116,73,0,36,195,0,92,21,82,14,0,36,196,0,
		92,21,82,5,0,36,198,0,176,30,0,103,1,0,
		20,1,36,199,0,176,31,0,20,0,36,201,0,176,
		32,0,20,0,36,202,0,176,32,0,20,0,36,204,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDATEBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,73,0,36,218,0,104,14,0,95,1,
		135,36,219,0,104,5,0,95,1,135,36,222,0,176,
		30,0,103,1,0,20,1,36,223,0,176,31,0,20,
		0,36,226,0,176,32,0,20,0,36,227,0,176,32,
		0,20,0,36,230,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,73,0,36,239,0,176,35,0,95,1,
		12,1,80,5,36,240,0,176,36,0,95,1,12,1,
		80,6,36,241,0,103,17,0,92,20,49,80,7,36,
		244,0,176,37,0,106,9,69,83,81,85,69,82,68,
		65,0,12,1,80,8,36,245,0,176,37,0,106,8,
		68,73,82,69,73,84,65,0,12,1,80,9,36,247,
		0,176,38,0,95,1,92,4,96,4,0,12,3,80,
		10,36,249,0,95,3,100,8,28,5,121,25,4,95,
		3,80,3,36,251,0,9,82,20,0,36,254,0,95,
		2,121,15,28,64,36,0,1,95,2,92,2,5,28,
		25,36,1,1,176,37,0,106,9,68,73,82,69,73,
		84,65,49,0,12,1,80,9,25,24,36,3,1,176,
		37,0,106,10,69,83,81,85,69,82,68,65,49,0,
		12,1,80,8,36,6,1,120,82,20,0,36,10,1,
		103,15,0,31,45,36,11,1,176,37,0,106,10,69,
		83,81,85,69,82,68,65,68,0,12,1,80,8,36,
		12,1,176,37,0,106,9,68,73,82,69,73,84,65,
		68,0,12,1,80,9,36,17,1,176,39,0,95,10,
		121,121,95,5,95,6,93,230,0,93,230,0,93,230,
		0,4,3,0,93,230,0,93,230,0,93,230,0,4,
		3,0,20,7,36,20,1,176,40,0,95,10,121,121,
		92,18,92,18,92,3,95,8,20,7,36,21,1,176,
		40,0,95,10,121,95,5,92,20,49,92,18,92,18,
		92,3,95,9,20,7,36,23,1,176,41,0,103,14,
		0,95,5,49,12,1,92,10,34,73,36,37,1,103,
		12,0,31,57,103,15,0,28,52,36,38,1,176,42,
		0,95,10,92,4,103,14,0,95,7,92,10,92,5,
		92,5,93,178,0,93,178,0,93,178,0,4,3,0,
		93,178,0,93,178,0,93,178,0,4,3,0,121,20,
		10,25,113,36,41,1,103,15,0,28,105,36,43,1,
		103,12,0,28,50,36,44,1,176,42,0,95,10,92,
		4,95,3,95,7,92,10,92,5,92,5,92,12,93,
		134,0,93,166,0,4,3,0,93,166,0,93,166,0,
		93,166,0,4,3,0,121,20,10,25,49,36,46,1,
		176,42,0,95,10,92,4,103,14,0,95,7,92,10,
		92,5,92,5,92,12,93,134,0,93,166,0,4,3,
		0,93,166,0,93,166,0,93,166,0,4,3,0,121,
		20,10,36,53,1,176,43,0,95,8,20,1,36,54,
		1,176,43,0,95,9,20,1,36,55,1,176,44,0,
		95,4,20,1,36,58,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETBARNAME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,73,0,36,63,1,95,1,122,5,28,
		7,103,1,0,25,5,103,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XZERACONTADOR )
{
	static const HB_BYTE pcode[] =
	{
		116,73,0,36,67,1,121,82,25,0,36,68,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( INCCONTADOR )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,73,0,36,72,1,95,1,28,11,36,
		73,1,104,25,0,170,25,9,36,75,1,104,25,0,
		169,36,78,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,22,4,116,73,0,36,82,1,106,1,0,80,5,
		36,83,1,121,80,6,36,84,1,121,80,7,36,85,
		1,9,80,8,36,88,1,121,80,9,36,90,1,176,
		35,0,103,1,0,12,1,80,10,36,92,1,103,17,
		0,80,11,36,97,1,103,3,0,95,11,49,80,12,
		36,98,1,103,13,0,95,11,49,80,13,36,103,1,
		9,80,15,36,105,1,121,80,16,36,109,1,9,80,
		17,36,112,1,9,80,19,36,113,1,9,80,20,36,
		115,1,92,18,80,21,36,117,1,121,80,22,36,118,
		1,121,80,23,36,119,1,121,80,24,36,120,1,121,
		80,25,36,121,1,121,80,26,36,126,1,176,24,0,
		103,2,0,12,1,29,152,9,95,1,176,10,0,103,
		2,0,106,7,72,65,78,68,76,69,0,12,2,8,
		29,129,9,36,129,1,95,2,93,2,2,8,28,28,
		36,131,1,176,49,0,101,123,20,174,71,225,122,148,
		63,10,2,20,1,36,132,1,9,82,12,0,36,140,
		1,95,2,93,1,2,8,29,126,7,36,142,1,103,
		11,0,80,9,36,143,1,103,11,0,80,16,36,144,
		1,9,80,8,36,145,1,121,80,21,36,146,1,176,
		49,0,101,123,20,174,71,225,122,148,63,10,2,20,
		1,36,150,1,122,165,80,18,25,18,36,151,1,176,
		50,0,95,18,20,1,36,150,1,175,18,0,93,255,
		0,15,28,236,36,154,1,103,12,0,29,58,4,103,
		6,0,32,52,4,36,158,1,176,51,0,96,6,0,
		96,7,0,20,2,36,159,1,176,52,0,95,1,95,
		7,95,6,12,3,80,14,36,160,1,95,14,92,2,
		1,80,9,36,161,1,95,14,122,1,80,25,36,163,
		1,9,80,15,36,165,1,95,8,31,77,36,166,1,
		176,23,0,95,7,95,6,106,55,67,108,105,99,107,
		32,101,32,65,114,114,97,115,116,101,32,68,101,118,
		97,103,97,114,32,112,97,114,97,32,78,97,118,101,
		103,97,114,32,101,110,116,114,101,32,97,115,32,67,
		111,108,117,110,97,115,46,0,20,3,36,167,1,120,
		80,8,36,170,1,176,50,0,122,12,1,121,8,28,
		36,36,171,1,176,53,0,103,1,0,20,1,36,172,
		1,176,31,0,20,0,36,173,1,120,82,6,0,36,
		174,1,176,32,0,20,0,36,179,1,95,9,95,16,
		69,29,79,3,36,180,1,95,9,95,16,15,29,186,
		1,36,182,1,95,26,121,69,28,38,36,183,1,176,
		41,0,95,26,95,25,49,12,1,92,10,16,28,20,
		36,184,1,120,82,6,0,36,185,1,176,32,0,20,
		0,26,57,3,36,191,1,176,54,0,103,19,0,12,
		1,92,3,49,83,55,0,36,193,1,95,9,95,16,
		49,122,16,29,218,2,36,195,1,103,25,0,103,24,
		0,8,28,100,36,196,1,176,56,0,176,57,0,106,
		56,67,111,108,117,110,97,32,109,97,105,115,32,97,
		32,68,105,114,101,105,116,97,32,65,116,105,110,103,
		105,100,97,46,78,227,111,32,201,32,112,111,115,115,
		105,118,101,108,32,65,118,97,110,231,97,114,46,32,
		0,176,58,0,103,25,0,12,1,72,106,3,32,32,
		0,72,176,58,0,103,24,0,12,1,72,12,1,20,
		1,26,173,2,36,201,1,103,5,0,95,11,72,95,
		10,92,7,49,15,28,68,36,202,1,176,59,0,176,
		16,0,103,16,0,12,1,93,0,1,92,39,92,15,
		20,4,36,203,1,121,82,22,0,36,204,1,176,49,
		0,101,123,20,174,71,225,122,148,63,10,2,20,1,
		36,205,1,104,25,0,170,36,206,1,95,9,80,16,
		26,90,2,36,210,1,104,22,0,95,9,95,16,49,
		135,36,211,1,95,9,80,16,36,212,1,95,25,80,
		26,36,213,1,109,55,0,83,60,0,36,215,1,103,
		22,0,109,7,0,16,28,69,36,217,1,104,5,0,
		109,7,0,135,36,218,1,104,14,0,109,7,0,135,
		36,220,1,176,59,0,176,16,0,103,16,0,12,1,
		93,0,1,92,39,92,15,20,4,36,221,1,96,24,
		0,103,23,0,135,36,223,1,121,82,22,0,36,224,
		1,104,25,0,170,36,229,1,176,49,0,101,123,20,
		174,71,225,122,132,63,10,2,20,1,36,230,1,176,
		30,0,103,1,0,20,1,36,231,1,176,31,0,20,
		0,36,235,1,176,61,0,20,0,36,237,1,176,32,
		0,20,0,26,110,1,36,244,1,176,41,0,95,16,
		95,9,49,12,1,122,16,29,92,1,36,246,1,103,
		25,0,121,8,28,81,36,247,1,176,56,0,176,57,
		0,106,61,67,111,108,117,110,97,32,109,97,105,115,
		32,97,32,69,115,113,117,101,114,100,97,32,65,116,
		105,110,103,105,100,97,46,78,227,111,32,201,32,112,
		111,115,115,105,118,101,108,32,82,101,116,114,111,99,
		101,100,101,114,46,46,46,0,12,1,20,1,26,68,
		1,36,252,1,95,26,121,69,28,38,36,253,1,176,
		41,0,95,26,95,25,49,12,1,92,10,16,28,20,
		36,254,1,120,82,6,0,36,255,1,176,32,0,20,
		0,26,23,1,36,5,2,103,5,0,92,21,34,28,
		58,36,6,2,121,82,22,0,36,7,2,95,9,80,
		16,36,8,2,104,25,0,169,36,9,2,176,59,0,
		176,16,0,103,16,0,12,1,93,0,1,92,37,93,
		97,1,20,4,36,10,2,176,32,0,20,0,26,212,
		0,36,15,2,104,22,0,176,41,0,95,16,95,9,
		49,12,1,135,36,16,2,95,9,80,16,36,17,2,
		95,25,80,26,36,20,2,103,22,0,109,7,0,16,
		28,60,36,22,2,104,5,0,109,7,0,136,36,23,
		2,104,14,0,109,7,0,136,36,25,2,176,59,0,
		176,16,0,103,16,0,12,1,93,0,1,92,37,93,
		97,1,20,4,36,26,2,121,82,22,0,36,27,2,
		104,25,0,169,36,31,2,176,30,0,103,1,0,20,
		1,36,32,2,176,31,0,20,0,36,34,2,176,32,
		0,20,0,36,35,2,176,61,0,20,0,36,36,2,
		176,32,0,20,0,36,45,2,95,15,28,26,103,6,
		0,31,21,36,46,2,176,49,0,101,123,20,174,71,
		225,122,132,63,10,2,20,1,36,52,2,122,165,80,
		18,25,18,36,53,2,176,50,0,95,18,20,1,36,
		52,2,175,18,0,93,255,0,15,28,236,26,195,251,
		36,60,2,121,80,21,36,68,2,95,8,28,29,36,
		69,2,9,82,12,0,36,70,2,9,82,6,0,36,
		71,2,9,82,7,0,36,72,2,9,80,8,36,76,
		2,122,165,80,18,25,18,36,77,2,176,50,0,95,
		18,20,1,36,76,2,175,18,0,93,255,0,15,28,
		236,36,82,2,103,10,0,122,5,29,32,1,103,6,
		0,32,26,1,36,84,2,103,10,0,122,5,29,15,
		1,103,6,0,32,9,1,36,86,2,176,50,0,122,
		12,1,121,8,28,24,36,87,2,176,49,0,101,184,
		30,133,235,81,184,158,63,10,2,20,1,26,230,0,
		36,91,2,103,25,0,121,15,28,84,36,93,2,176,
		62,0,20,0,36,94,2,176,63,0,9,9,20,2,
		36,97,2,104,25,0,169,36,99,2,176,34,0,109,
		7,0,66,20,1,36,100,2,176,31,0,20,0,36,
		101,2,176,49,0,101,184,30,133,235,81,184,158,63,
		10,2,20,1,36,103,2,176,61,0,20,0,36,104,
		2,176,32,0,20,0,25,76,36,107,2,176,56,0,
		176,57,0,106,59,67,111,108,117,110,97,32,109,97,
		105,115,32,97,32,69,115,113,117,101,114,100,97,32,
		65,116,105,110,103,105,100,97,46,78,227,111,32,201,
		32,112,111,115,115,105,118,101,108,32,82,101,116,114,
		111,99,101,100,101,114,46,0,12,1,20,1,36,110,
		2,176,49,0,101,154,153,153,153,153,153,169,63,10,
		2,20,1,36,112,2,122,165,80,18,25,18,36,113,
		2,176,50,0,95,18,20,1,36,112,2,175,18,0,
		93,255,0,15,28,236,36,116,2,176,64,0,20,0,
		26,236,254,36,125,2,103,10,0,92,2,5,29,117,
		1,103,6,0,32,111,1,36,127,2,122,165,80,18,
		25,18,36,128,2,176,50,0,95,18,20,1,36,127,
		2,175,18,0,93,255,0,15,28,236,36,131,2,176,
		32,0,20,0,36,133,2,103,10,0,92,2,5,29,
		60,1,103,6,0,32,54,1,36,135,2,176,50,0,
		122,12,1,121,8,28,24,36,136,2,176,49,0,101,
		184,30,133,235,81,184,158,63,10,2,20,1,26,19,
		1,36,140,2,103,25,0,103,24,0,35,29,128,0,
		36,145,2,176,63,0,120,9,12,2,92,255,8,28,
		38,36,146,2,176,49,0,101,184,30,133,235,81,184,
		158,63,10,2,20,1,36,147,2,176,65,0,106,4,
		101,110,100,0,20,1,26,211,0,36,151,2,176,34,
		0,109,7,0,20,1,36,152,2,176,31,0,20,0,
		36,153,2,176,49,0,101,184,30,133,235,81,184,158,
		63,10,2,20,1,36,154,2,104,25,0,170,36,157,
		2,176,61,0,20,0,36,160,2,176,49,0,101,154,
		153,153,153,153,153,169,63,10,2,20,1,25,94,36,
		163,2,176,56,0,176,57,0,106,58,67,111,108,117,
		110,97,32,109,97,105,115,32,97,32,68,105,114,101,
		105,116,97,32,65,116,105,110,103,105,100,97,46,78,
		227,111,32,201,32,112,111,115,115,105,118,101,108,32,
		65,118,97,110,231,97,114,46,122,122,50,0,12,1,
		20,1,36,164,2,176,49,0,101,154,153,153,153,153,
		153,169,63,10,2,20,1,36,167,2,122,165,80,18,
		25,18,36,168,2,176,50,0,95,18,20,1,36,167,
		2,175,18,0,93,255,0,15,28,236,36,171,2,176,
		64,0,20,0,26,190,254,36,181,2,95,2,93,163,
		2,8,73,36,186,2,95,2,93,0,2,8,29,191,
		1,36,189,2,176,51,0,96,6,0,96,7,0,20,
		2,36,190,2,176,52,0,95,1,95,7,95,6,12,
		3,80,14,36,191,2,95,14,92,2,1,80,6,36,
		195,2,95,14,122,1,92,20,16,28,19,36,197,2,
		176,53,0,103,1,0,20,1,36,198,2,100,110,7,
		36,203,2,95,6,92,18,15,28,22,95,6,95,10,
		92,18,49,35,28,12,36,204,2,121,82,10,0,26,
		218,0,36,208,2,103,7,0,32,209,0,36,210,2,
		121,82,10,0,36,212,2,176,66,0,95,1,93,0,
		127,20,2,36,214,2,103,4,0,121,15,28,36,36,
		215,2,121,82,4,0,36,216,2,176,30,0,103,1,
		0,20,1,36,217,2,176,32,0,20,0,36,218,2,
		176,31,0,20,0,36,222,2,95,6,92,20,35,28,
		64,36,224,2,122,82,4,0,36,225,2,176,67,0,
		103,1,0,121,121,92,25,92,20,120,20,6,36,226,
		2,122,82,10,0,36,227,2,9,82,6,0,36,228,
		2,120,82,7,0,36,229,2,176,32,0,20,0,36,
		230,2,176,31,0,20,0,36,233,2,95,6,95,10,
		92,25,49,16,28,59,36,237,2,92,2,82,4,0,
		36,239,2,176,30,0,103,1,0,20,1,36,240,2,
		92,2,82,10,0,36,241,2,9,82,6,0,36,242,
		2,120,82,7,0,36,243,2,176,32,0,20,0,36,
		244,2,176,31,0,20,0,36,253,2,103,10,0,121,
		5,28,122,36,255,2,95,6,103,14,0,16,28,39,
		95,6,103,14,0,95,11,72,34,28,28,36,0,3,
		93,231,3,82,10,0,36,1,3,120,82,12,0,36,
		2,3,95,6,82,11,0,25,15,36,4,3,9,82,
		12,0,36,5,3,9,80,8,36,8,3,176,30,0,
		103,1,0,20,1,36,9,3,176,32,0,20,0,36,
		10,3,176,31,0,20,0,36,14,3,121,82,4,0,
		36,15,3,176,30,0,103,1,0,20,1,36,18,3,
		9,82,6,0,36,19,3,9,82,7,0,36,26,3,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCHECKOBJ )
{
	static const HB_BYTE pcode[] =
	{
		116,73,0,36,33,3,176,69,0,176,19,0,109,14,
		0,12,1,12,1,31,48,109,14,0,106,8,66,114,
		111,119,115,101,114,0,69,28,32,36,34,3,176,53,
		0,103,1,0,20,1,36,35,3,176,49,0,101,123,
		20,174,71,225,122,148,63,10,2,20,1,36,38,3,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOFFBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,73,0,36,43,3,9,82,12,0,36,
		44,3,176,66,0,176,16,0,95,1,12,1,93,0,
		127,20,2,36,46,3,176,30,0,95,1,20,1,36,
		47,3,176,32,0,20,0,36,48,3,176,31,0,20,
		0,36,50,3,121,82,4,0,36,51,3,176,30,0,
		95,1,20,1,36,53,3,176,31,0,20,0,36,55,
		3,9,82,6,0,36,56,3,9,82,7,0,36,58,
		3,176,32,0,20,0,36,60,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,73,0,36,77,3,176,35,0,103,1,
		0,12,1,80,1,36,78,3,176,36,0,103,1,0,
		12,1,80,2,36,83,3,122,80,7,36,84,3,121,
		80,8,36,85,3,92,45,80,9,36,89,3,176,35,
		0,103,2,0,12,1,80,10,36,90,3,176,36,0,
		103,2,0,12,1,80,11,36,92,3,176,38,0,103,
		1,0,92,3,96,4,0,12,3,80,3,36,93,3,
		176,38,0,103,2,0,92,3,96,6,0,12,3,80,
		5,36,96,3,103,15,0,31,32,36,97,3,176,70,
		0,95,5,121,121,95,10,95,11,93,245,0,121,95,
		3,121,121,95,1,95,2,20,12,25,27,36,99,3,
		176,71,0,95,5,121,121,95,10,95,11,121,95,3,
		121,121,95,1,95,2,20,11,36,104,3,176,44,0,
		95,4,20,1,36,105,3,176,44,0,95,6,20,1,
		36,107,3,176,30,0,103,2,0,20,1,36,109,3,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,73,0,25,0,116,73,0,106,1,0,82,1,0,
		106,1,0,82,2,0,121,82,3,0,121,82,4,0,
		92,18,82,5,0,9,82,6,0,9,82,7,0,120,
		82,8,0,92,18,82,9,0,121,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,92,18,82,14,
		0,120,82,15,0,106,1,0,82,16,0,121,82,17,
		0,121,82,18,0,122,82,19,0,9,82,20,0,106,
		1,0,82,21,0,121,82,22,0,121,82,23,0,121,
		82,24,0,121,82,25,0,7
	};

	hb_vmExecute( pcode, symbols );
}

