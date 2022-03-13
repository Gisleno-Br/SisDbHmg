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
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( SENDMESSAGE );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( XSHOWBRW );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( CURSORHAND1 );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
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
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "XSHOWBRW", {HB_FS_PUBLIC}, {HB_FUNCNAME( XSHOWBRW )}, NULL },
{ "NHSCROOL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "CURSORHAND1", {HB_FS_PUBLIC}, {HB_FUNCNAME( CURSORHAND1 )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "XLUZOFF", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XLUZOFF )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00015)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,0,6,116,62,0,36,35,0,106,7,87,105,110,
		95,66,104,0,176,2,0,109,3,0,92,4,12,2,
		72,176,4,0,108,1,20,1,81,1,0,36,36,0,
		106,13,87,105,110,95,83,111,109,98,114,97,66,104,
		0,176,2,0,109,3,0,92,4,12,2,72,176,4,
		0,108,5,20,1,81,5,0,36,37,0,109,5,0,
		82,2,0,36,38,0,95,4,82,3,0,36,39,0,
		109,1,0,82,1,0,36,40,0,95,6,82,15,0,
		36,41,0,95,5,82,12,0,36,51,0,176,6,0,
		20,0,176,7,0,109,1,0,106,14,120,83,99,114,
		111,120,82,111,108,101,111,108,49,0,176,2,0,95,
		2,92,4,12,2,72,176,8,0,95,2,106,4,67,
		111,108,0,12,2,95,3,176,8,0,95,2,106,6,
		87,105,100,116,104,0,12,2,92,22,72,92,20,9,
		9,120,120,120,9,106,1,0,100,100,100,100,100,100,
		93,255,0,93,255,0,93,255,0,4,3,0,90,30,
		176,9,0,176,8,0,98,10,0,93,60,1,1,106,
		5,78,97,109,101,0,12,2,103,4,0,12,2,6,
		9,9,9,100,120,100,100,100,100,100,100,100,100,100,
		100,100,100,100,100,100,9,100,100,100,9,100,100,100,
		100,100,100,100,100,95,1,120,20,56,36,52,0,176,
		11,0,20,0,36,62,0,176,6,0,20,0,176,7,
		0,109,5,0,106,20,120,83,99,114,111,120,82,111,
		108,101,111,108,49,83,111,109,98,114,97,0,176,2,
		0,95,2,92,4,12,2,72,176,8,0,95,2,106,
		4,67,111,108,0,12,2,95,3,176,8,0,95,2,
		106,6,87,105,100,116,104,0,12,2,92,22,72,92,
		20,9,9,120,120,120,9,106,1,0,100,100,100,100,
		100,100,121,121,121,4,3,0,100,9,9,9,100,120,
		100,100,100,100,100,100,100,100,100,100,100,100,100,100,
		100,9,100,100,100,9,100,100,100,100,100,100,100,100,
		95,1,120,20,56,36,63,0,176,11,0,20,0,36,
		67,0,176,12,0,12,0,121,15,82,14,0,36,71,
		0,176,13,0,176,14,0,109,1,0,12,1,121,103,
		14,0,31,7,93,167,0,25,3,121,92,2,20,4,
		36,72,0,176,15,0,98,10,0,92,60,1,176,16,
		0,176,17,0,106,11,69,118,101,110,116,66,97,114,
		114,97,0,12,1,12,1,12,2,121,5,28,28,103,
		14,0,28,23,36,73,0,176,18,0,106,11,69,118,
		101,110,116,66,97,114,114,97,0,20,1,36,75,0,
		176,19,0,176,8,0,109,1,0,106,7,72,65,78,
		68,76,69,0,12,2,97,0,0,128,0,100,120,20,
		4,36,78,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSHOWHINT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,36,84,0,176,21,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,42,36,85,0,176,22,
		0,95,1,92,20,49,95,2,93,250,0,49,176,16,
		0,95,3,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,28,36,87,0,176,23,0,176,
		16,0,95,3,12,1,95,1,92,20,49,95,2,93,
		250,0,49,20,3,36,90,0,176,24,0,95,3,20,
		1,36,92,0,176,25,0,106,6,120,72,105,110,116,
		0,20,1,36,94,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCALCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,5,0,116,62,0,36,100,0,121,80,1,36,101,
		0,121,80,2,36,102,0,176,8,0,103,1,0,106,
		6,87,105,100,116,104,0,12,2,92,58,49,80,3,
		36,104,0,103,12,0,103,3,0,18,92,100,65,80,
		4,36,105,0,176,26,0,103,3,0,92,10,18,12,
		1,80,5,36,109,0,103,3,0,103,12,0,34,31,
		9,95,4,92,95,16,28,16,36,110,0,121,80,1,
		36,111,0,121,80,5,25,21,36,113,0,176,26,0,
		95,4,92,100,18,103,12,0,65,12,1,80,1,36,
		120,0,95,1,95,5,49,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDATEBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,36,129,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,7,2,116,62,0,36,137,0,176,28,0,95,1,
		12,1,80,4,36,138,0,176,29,0,95,1,12,1,
		80,5,36,139,0,176,12,0,12,0,80,6,36,141,
		0,176,30,0,106,9,69,83,81,85,69,82,68,65,
		0,12,1,80,7,36,142,0,176,30,0,106,8,68,
		73,82,69,73,84,65,0,12,1,80,8,36,144,0,
		176,31,0,95,1,92,4,96,3,0,12,3,80,9,
		36,147,0,95,2,121,15,28,57,36,149,0,95,2,
		92,2,5,28,25,36,150,0,176,30,0,106,9,68,
		73,82,69,73,84,65,49,0,12,1,80,8,25,24,
		36,152,0,176,30,0,106,10,69,83,81,85,69,82,
		68,65,49,0,12,1,80,7,36,157,0,103,14,0,
		31,45,36,158,0,176,30,0,106,10,69,83,81,85,
		69,82,68,65,68,0,12,1,80,7,36,159,0,176,
		30,0,106,9,68,73,82,69,73,84,65,68,0,12,
		1,80,8,36,164,0,176,32,0,95,9,121,121,95,
		4,95,5,93,230,0,93,230,0,93,230,0,4,3,
		0,93,230,0,93,230,0,93,230,0,4,3,0,20,
		7,36,167,0,176,33,0,95,9,121,121,92,18,92,
		18,92,3,95,7,20,7,36,168,0,176,33,0,95,
		9,121,95,4,92,20,49,92,18,92,18,92,3,95,
		8,20,7,36,170,0,103,11,0,31,60,103,14,0,
		28,55,36,171,0,176,34,0,95,9,92,4,103,13,
		0,95,6,92,6,49,92,10,92,5,92,5,93,178,
		0,93,178,0,93,178,0,4,3,0,93,178,0,93,
		178,0,93,178,0,4,3,0,121,20,10,25,60,36,
		174,0,103,14,0,28,52,36,175,0,176,34,0,95,
		9,92,4,103,13,0,95,6,92,6,49,92,10,92,
		5,92,5,92,12,93,134,0,93,166,0,4,3,0,
		93,166,0,93,166,0,93,166,0,4,3,0,121,20,
		10,36,180,0,176,35,0,95,7,20,1,36,181,0,
		176,35,0,95,8,20,1,36,182,0,176,36,0,95,
		3,20,1,36,184,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETBARNAME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,62,0,36,189,0,95,1,122,5,28,
		7,103,1,0,25,5,103,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,18,4,116,62,0,36,196,0,106,1,0,80,5,
		36,197,0,121,80,6,36,198,0,121,80,7,36,199,
		0,9,80,8,36,202,0,121,80,9,36,204,0,176,
		28,0,103,1,0,12,1,80,10,36,206,0,176,12,
		0,12,0,92,6,49,80,11,36,210,0,103,3,0,
		103,12,0,49,92,25,49,80,12,36,211,0,103,12,
		0,95,11,49,80,13,36,219,0,9,80,15,36,221,
		0,121,80,16,36,223,0,9,80,17,36,226,0,9,
		80,19,36,227,0,9,80,20,36,229,0,92,18,80,
		21,36,231,0,121,80,22,36,238,0,176,21,0,103,
		2,0,12,1,29,82,7,95,1,176,8,0,103,2,
		0,106,7,72,65,78,68,76,69,0,12,2,8,29,
		59,7,36,241,0,95,2,93,2,2,8,28,28,36,
		243,0,176,39,0,101,123,20,174,71,225,122,148,63,
		10,2,20,1,36,244,0,9,82,11,0,36,250,0,
		95,2,93,1,2,8,29,43,5,36,252,0,103,10,
		0,80,9,36,253,0,9,80,8,36,255,0,121,80,
		21,36,1,1,122,165,80,18,25,18,36,2,1,176,
		40,0,95,18,20,1,36,1,1,175,18,0,93,255,
		0,15,28,236,36,5,1,103,11,0,29,181,2,103,
		5,0,32,175,2,36,9,1,176,41,0,96,6,0,
		96,7,0,20,2,36,10,1,176,42,0,95,1,95,
		7,95,6,12,3,80,14,36,11,1,95,14,92,2,
		1,80,9,36,17,1,9,80,15,36,23,1,95,8,
		31,69,36,24,1,176,20,0,95,7,95,6,106,47,
		67,108,105,99,107,32,101,32,65,114,114,97,115,116,
		101,32,112,97,114,97,32,78,97,118,101,103,97,114,
		32,101,110,116,114,101,32,97,115,32,67,111,108,117,
		110,97,115,46,0,20,3,36,25,1,120,80,8,36,
		29,1,176,40,0,122,12,1,121,8,28,36,36,30,
		1,176,43,0,103,1,0,20,1,36,31,1,176,44,
		0,20,0,36,32,1,120,82,5,0,36,33,1,176,
		45,0,20,0,36,37,1,95,9,103,10,0,69,29,
		65,255,36,38,1,95,9,103,10,0,15,29,88,1,
		36,39,1,176,46,0,95,9,103,10,0,49,12,1,
		122,16,29,158,1,36,40,1,95,21,95,11,72,95,
		13,35,29,193,0,36,42,1,95,16,121,15,28,38,
		36,43,1,104,13,0,95,9,95,16,49,135,36,44,
		1,96,21,0,95,9,95,16,49,135,36,46,1,95,
		9,95,16,49,80,22,25,54,36,50,1,104,13,0,
		176,46,0,95,9,103,10,0,49,12,1,135,36,51,
		1,96,21,0,176,46,0,95,9,103,10,0,49,12,
		1,135,36,53,1,176,46,0,95,9,103,10,0,49,
		12,1,80,22,36,59,1,95,9,80,16,36,60,1,
		176,47,0,176,14,0,103,15,0,12,1,93,0,1,
		92,39,95,22,20,4,36,67,1,176,39,0,101,123,
		20,174,71,225,122,132,63,10,2,20,1,36,69,1,
		176,45,0,20,0,36,70,1,176,44,0,20,0,36,
		72,1,176,39,0,101,184,30,133,235,81,184,158,63,
		10,2,20,1,36,73,1,120,80,15,26,210,0,36,
		81,1,176,48,0,176,49,0,95,21,95,11,72,12,
		1,106,3,32,32,0,72,176,49,0,95,13,12,1,
		72,20,1,36,83,1,120,80,20,36,84,1,120,82,
		5,0,36,85,1,176,50,0,176,51,0,106,55,67,
		111,108,117,110,97,32,109,97,105,115,32,97,32,68,
		105,114,101,105,116,97,32,65,116,105,110,103,105,100,
		97,46,78,227,111,32,101,32,112,111,115,115,105,118,
		101,108,32,65,118,97,110,231,97,114,46,0,12,1,
		20,1,26,155,0,36,92,1,176,46,0,103,10,0,
		95,9,49,12,1,92,30,16,28,72,36,93,1,103,
		13,0,92,18,15,28,55,36,94,1,104,13,0,92,
		30,136,36,95,1,176,47,0,176,14,0,103,15,0,
		12,1,93,0,1,92,37,121,20,4,36,97,1,176,
		44,0,20,0,36,99,1,9,80,19,36,100,1,120,
		80,15,25,8,36,103,1,120,80,19,36,111,1,95,
		15,29,127,253,103,5,0,32,121,253,36,112,1,176,
		45,0,20,0,36,119,1,176,52,0,103,1,0,20,
		1,36,120,1,176,39,0,101,123,20,174,71,225,122,
		132,63,10,2,20,1,36,121,1,95,9,82,10,0,
		26,72,253,36,132,1,95,8,28,37,36,133,1,9,
		82,11,0,36,134,1,176,53,0,20,0,36,135,1,
		9,82,5,0,36,136,1,9,82,6,0,36,137,1,
		9,80,8,36,141,1,103,9,0,122,5,29,247,0,
		103,5,0,32,241,0,36,143,1,103,13,0,92,18,
		15,29,133,0,36,144,1,104,13,0,109,54,0,136,
		36,145,1,176,47,0,176,14,0,103,15,0,12,1,
		93,0,1,92,37,121,20,4,36,146,1,176,52,0,
		103,1,0,20,1,36,147,1,176,45,0,20,0,36,
		148,1,176,40,0,122,12,1,121,8,28,38,36,149,
		1,120,82,5,0,36,150,1,121,82,9,0,36,151,
		1,176,39,0,101,184,30,133,235,81,184,158,63,10,
		2,20,1,26,129,0,36,154,1,176,44,0,20,0,
		36,155,1,176,39,0,101,123,20,174,71,225,122,132,
		63,10,2,20,1,26,100,255,36,158,1,176,45,0,
		20,0,36,159,1,176,52,0,103,1,0,20,1,36,
		160,1,176,39,0,101,123,20,174,71,225,122,164,63,
		10,2,20,1,36,161,1,120,82,5,0,36,162,1,
		176,50,0,176,51,0,106,33,67,111,108,117,110,97,
		32,109,97,105,115,32,97,32,69,115,113,117,101,114,
		100,97,32,65,116,105,110,103,105,100,97,46,0,12,
		1,20,1,26,4,255,36,168,1,103,9,0,92,2,
		5,29,8,1,103,5,0,32,2,1,36,170,1,103,
		13,0,95,13,122,72,34,28,124,36,171,1,104,13,
		0,109,54,0,135,36,172,1,176,52,0,103,1,0,
		20,1,36,173,1,176,47,0,176,14,0,103,15,0,
		12,1,93,0,1,92,39,121,20,4,36,174,1,176,
		40,0,122,12,1,121,8,28,38,36,175,1,120,82,
		5,0,36,176,1,121,82,9,0,36,177,1,176,39,
		0,101,184,30,133,235,81,184,158,63,10,2,20,1,
		26,153,0,36,180,1,176,39,0,101,123,20,174,71,
		225,122,132,63,10,2,20,1,36,181,1,176,44,0,
		20,0,26,106,255,36,184,1,104,13,0,109,54,0,
		136,36,185,1,176,45,0,20,0,36,186,1,176,52,
		0,103,1,0,20,1,36,187,1,176,39,0,101,123,
		20,174,71,225,122,164,63,10,2,20,1,36,188,1,
		120,82,5,0,36,189,1,176,50,0,176,51,0,106,
		32,67,111,108,117,110,97,32,109,97,105,115,32,97,
		32,68,105,114,101,105,116,97,32,65,116,105,110,103,
		105,100,97,46,0,12,1,106,3,32,32,0,72,176,
		49,0,103,13,0,12,1,72,20,1,26,242,254,36,
		197,1,95,2,93,163,2,8,73,36,202,1,95,2,
		93,0,2,8,29,204,1,36,205,1,176,41,0,96,
		6,0,96,7,0,20,2,36,206,1,176,42,0,95,
		1,95,7,95,6,12,3,80,14,36,207,1,95,14,
		92,2,1,80,6,36,209,1,95,6,92,18,15,28,
		22,95,6,95,10,92,18,49,35,28,12,36,210,1,
		121,82,9,0,26,4,1,36,215,1,103,6,0,32,
		251,0,36,217,1,121,82,9,0,36,219,1,176,55,
		0,95,1,93,0,127,20,2,36,221,1,103,4,0,
		121,15,28,36,36,222,1,121,82,4,0,36,223,1,
		176,52,0,103,1,0,20,1,36,224,1,176,45,0,
		20,0,36,225,1,176,44,0,20,0,36,229,1,95,
		6,92,18,35,28,74,36,230,1,176,56,0,95,1,
		20,1,36,231,1,122,82,4,0,36,232,1,176,57,
		0,103,1,0,121,121,92,25,92,20,120,20,6,36,
		233,1,122,82,9,0,36,234,1,9,82,5,0,36,
		235,1,120,82,6,0,36,236,1,176,45,0,20,0,
		36,237,1,176,44,0,20,0,36,240,1,95,6,95,
		10,92,18,49,16,28,91,36,241,1,176,56,0,95,
		1,20,1,36,242,1,92,2,82,4,0,36,243,1,
		176,57,0,103,1,0,121,95,10,92,25,49,92,25,
		92,20,120,20,6,36,244,1,92,2,82,9,0,36,
		245,1,9,82,5,0,36,247,1,120,82,6,0,36,
		248,1,176,39,0,101,123,20,174,71,225,122,148,63,
		10,2,20,1,36,249,1,176,44,0,20,0,36,0,
		2,103,9,0,121,5,28,122,36,2,2,95,6,103,
		13,0,16,28,39,95,6,103,13,0,95,11,72,34,
		28,28,36,3,2,93,231,3,82,9,0,36,4,2,
		120,82,11,0,36,5,2,95,6,82,10,0,25,15,
		36,7,2,9,82,11,0,36,8,2,9,80,8,36,
		11,2,176,52,0,103,1,0,20,1,36,12,2,176,
		45,0,20,0,36,13,2,176,44,0,20,0,36,17,
		2,121,82,4,0,36,18,2,176,52,0,103,1,0,
		20,1,36,21,2,9,82,5,0,36,22,2,9,82,
		6,0,36,29,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XOFFBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,62,0,36,34,2,9,82,11,0,36,
		35,2,121,82,4,0,36,36,2,176,55,0,176,14,
		0,95,1,12,1,93,0,127,20,2,36,37,2,176,
		52,0,95,1,20,1,36,40,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XLUZOFF )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,62,0,36,44,2,121,82,4,0,36,
		45,2,9,82,11,0,36,46,2,176,52,0,95,1,
		20,1,36,51,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,62,0,36,57,2,176,28,0,103,1,
		0,12,1,80,1,36,58,2,176,29,0,103,1,0,
		12,1,80,2,36,63,2,122,80,7,36,64,2,121,
		80,8,36,65,2,92,45,80,9,36,69,2,176,28,
		0,103,2,0,12,1,80,10,36,70,2,176,29,0,
		103,2,0,12,1,80,11,36,72,2,176,31,0,103,
		1,0,92,3,96,4,0,12,3,80,3,36,73,2,
		176,31,0,103,2,0,92,3,96,6,0,12,3,80,
		5,36,76,2,103,14,0,31,32,36,77,2,176,59,
		0,95,5,121,121,95,10,95,11,93,185,0,121,95,
		3,121,121,95,1,95,2,20,12,25,27,36,79,2,
		176,60,0,95,5,121,121,95,10,95,11,121,95,3,
		121,121,95,1,95,2,20,11,36,88,2,176,36,0,
		95,4,20,1,36,89,2,176,36,0,95,6,20,1,
		36,91,2,176,52,0,103,2,0,20,1,36,93,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,62,0,15,0,116,62,0,106,1,0,82,1,0,
		106,1,0,82,2,0,121,82,3,0,121,82,4,0,
		9,82,5,0,9,82,6,0,120,82,7,0,92,18,
		82,8,0,121,82,9,0,121,82,10,0,9,82,11,
		0,121,82,12,0,92,18,82,13,0,120,82,14,0,
		106,1,0,82,15,0,7
	};

	hb_vmExecute( pcode, symbols );
}

