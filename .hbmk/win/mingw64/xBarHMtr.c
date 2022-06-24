/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\BrwMtr\xBarHMtr.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XBARHMTR );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_EXTERN( __MVPRIVATE );
HB_FUNC_EXTERN( XCALCTAM );
HB_FUNC_EXTERN( XH_LQTOT );
HB_FUNC_EXTERN( XH_INITLIM );
HB_FUNC_EXTERN( XH_XCLCDIR );
HB_FUNC_EXTERN( INT );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( XH_RTLIMITE );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_STATIC( XPAINTBARRAH );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( SETLAYEREDWINDOWATTRIBUTES );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC( YZERACONTER );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC_EXTERN( HMG_CHANGEWINDOWSTYLE );
HB_FUNC( YSETBARTAM );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC( YDCBARH1 );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC( XH_RETPASY );
HB_FUNC_STATIC( XSHOWHINT );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( CRIEJANTIP );
HB_FUNC_EXTERN( XDISPHINT );
HB_FUNC_EXTERN( XDISPUPTAM );
HB_FUNC_EXTERN( BRINGTOP );
HB_FUNC_STATIC( XCALCBARH );
HB_FUNC( YGOBARR );
HB_FUNC( YGOBARL );
HB_FUNC( XRETBARH );
HB_FUNC( YUPDATBHA1 );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_BITMAPRELEASE );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLHORIZONTAL );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( BT_DRAWFILLROUNDRECT );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC( YGETBARNOME );
HB_FUNC( YINCCONTER );
HB_FUNC( YRETCONTADOR );
HB_FUNC( EVENTBARMTR );
HB_FUNC_EXTERN( SETBRWDRGM );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC_EXTERN( GETASYNCKEYSTATE );
HB_FUNC( XDOSCROLV );
HB_FUNC( YOFFBARRA );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( YLIMPBARV );
HB_FUNC( XINITSXY );
HB_FUNC_EXTERN( XH_COLRESTO );
HB_FUNC_EXTERN( XH_CALCPULO );
HB_FUNC( XROLETELA );
HB_FUNC_EXTERN( XH_INCLIM );
HB_FUNC_EXTERN( XGETINFCW1 );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( YSCROLLCAM );
HB_FUNC_EXTERN( YDCBARH1EMTR );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( XH_COLVOLTA );
HB_FUNC_EXTERN( HMG_CLEANLASTMOUSEMESSAGE );
HB_FUNC( YCHECKOBJ );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( YAPAGUEH );
HB_FUNC( YRETACENDE );
HB_FUNC( YENABLE1BH );
HB_FUNC( YGETSCRXY );
HB_FUNC_EXTERN( BT_DRAWDCTODCALPHABLEND );
HB_FUNC_EXTERN( BT_DRAWDCTODC );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XBARHMTR )
{ "XBARHMTR", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XBARHMTR )}, NULL },
{ "CJANNAME", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "__MVPRIVATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( __MVPRIVATE )}, NULL },
{ "CJANSOMBRA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XCALCTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XCALCTAM )}, NULL },
{ "XH_LQTOT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_LQTOT )}, NULL },
{ "XH_INITLIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_INITLIM )}, NULL },
{ "XH_XCLCDIR", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_XCLCDIR )}, NULL },
{ "NQBROWCOL", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "NP1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "XH_RTLIMITE", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_RTLIMITE )}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "XPAINTBARRAH", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTBARRAH )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "COBJSELECTED", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SETLAYEREDWINDOWATTRIBUTES", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETLAYEREDWINDOWATTRIBUTES )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "YZERACONTER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YZERACONTER )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "HMG_CHANGEWINDOWSTYLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CHANGEWINDOWSTYLE )}, NULL },
{ "YSETBARTAM", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YSETBARTAM )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "YDCBARH1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YDCBARH1 )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "XH_RETPASY", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XH_RETPASY )}, NULL },
{ "XSHOWHINT", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSHOWHINT )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "CRIEJANTIP", {HB_FS_PUBLIC}, {HB_FUNCNAME( CRIEJANTIP )}, NULL },
{ "XDISPHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPHINT )}, NULL },
{ "XDISPUPTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPUPTAM )}, NULL },
{ "BRINGTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BRINGTOP )}, NULL },
{ "XCALCBARH", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCALCBARH )}, NULL },
{ "YGOBARR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGOBARR )}, NULL },
{ "YGOBARL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGOBARL )}, NULL },
{ "XRETBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETBARH )}, NULL },
{ "YUPDATBHA1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YUPDATBHA1 )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_BITMAPRELEASE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPRELEASE )}, NULL },
{ "BT_DRAWGRADIENTFILLHORIZONTAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLHORIZONTAL )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
{ "BT_DRAWFILLROUNDRECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWFILLROUNDRECT )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "YGETBARNOME", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGETBARNOME )}, NULL },
{ "YINCCONTER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YINCCONTER )}, NULL },
{ "YRETCONTADOR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YRETCONTADOR )}, NULL },
{ "EVENTBARMTR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTBARMTR )}, NULL },
{ "SETBRWDRGM", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETBRWDRGM )}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "GETASYNCKEYSTATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETASYNCKEYSTATE )}, NULL },
{ "XDOSCROLV", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDOSCROLV )}, NULL },
{ "YOFFBARRA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YOFFBARRA )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "YLIMPBARV", {HB_FS_PUBLIC}, {HB_FUNCNAME( YLIMPBARV )}, NULL },
{ "XINITSXY", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XINITSXY )}, NULL },
{ "XH_COLRESTO", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_COLRESTO )}, NULL },
{ "XH_CALCPULO", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_CALCPULO )}, NULL },
{ "XROLETELA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XROLETELA )}, NULL },
{ "XH_INCLIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_INCLIM )}, NULL },
{ "XGETINFCW1", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGETINFCW1 )}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "YSCROLLCAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( YSCROLLCAM )}, NULL },
{ "YDCBARH1EMTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( YDCBARH1EMTR )}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "XH_COLVOLTA", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_COLVOLTA )}, NULL },
{ "I", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HMG_CLEANLASTMOUSEMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CLEANLASTMOUSEMESSAGE )}, NULL },
{ "YCHECKOBJ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YCHECKOBJ )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "YAPAGUEH", {HB_FS_PUBLIC}, {HB_FUNCNAME( YAPAGUEH )}, NULL },
{ "YRETACENDE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YRETACENDE )}, NULL },
{ "YENABLE1BH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YENABLE1BH )}, NULL },
{ "YGETSCRXY", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGETSCRXY )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00037)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_XBARHMTR, "Prg\\BrwMtr\\xBarHMtr.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_XBARHMTR
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_XBARHMTR )
   #include "hbiniseg.h"
#endif

HB_FUNC( XBARHMTR )
{
	static const HB_BYTE pcode[] =
	{
		13,0,11,116,92,0,36,60,0,106,10,87,105,110,
		95,66,104,77,116,114,0,176,2,0,95,1,92,4,
		12,2,72,176,3,0,108,1,20,1,81,1,0,36,
		61,0,106,16,87,105,110,95,83,111,109,98,114,97,
		66,104,77,116,114,0,176,2,0,95,1,92,4,12,
		2,72,176,3,0,108,4,20,1,81,4,0,36,62,
		0,109,4,0,82,2,0,36,63,0,95,4,82,3,
		0,36,64,0,109,1,0,82,1,0,36,65,0,95,
		6,82,16,0,36,66,0,95,5,82,13,0,36,68,
		0,176,5,0,12,0,82,20,0,36,80,0,95,10,
		82,15,0,36,81,0,95,7,82,21,0,36,82,0,
		176,6,0,122,12,1,82,27,0,36,83,0,176,6,
		0,92,2,12,1,82,28,0,36,86,0,176,7,0,
		20,0,36,90,0,176,8,0,95,7,12,1,83,9,
		0,36,92,0,109,9,0,121,15,28,110,36,93,0,
		176,10,0,95,5,92,40,49,109,9,0,103,21,0,
		18,65,12,1,83,11,0,36,94,0,95,5,92,40,
		49,109,11,0,49,82,19,0,36,96,0,176,10,0,
		95,5,92,40,49,109,9,0,18,12,1,82,33,0,
		36,97,0,176,12,0,176,13,0,103,33,0,12,1,
		106,5,32,32,32,32,0,72,176,13,0,103,19,0,
		12,1,72,106,4,32,32,32,0,72,176,13,0,109,
		9,0,12,1,72,20,1,36,104,0,176,7,0,20,
		0,36,128,0,176,14,0,12,0,82,18,0,36,131,
		0,95,9,82,23,0,36,142,0,176,15,0,20,0,
		176,16,0,109,1,0,106,14,120,83,99,114,111,120,
		82,111,108,101,111,108,49,0,176,2,0,95,2,92,
		4,12,2,72,95,11,95,3,176,17,0,95,2,106,
		6,87,105,100,116,104,0,12,2,92,22,72,92,20,
		9,9,120,120,120,9,106,1,0,100,100,100,100,100,
		100,121,121,121,4,3,0,90,33,176,18,0,176,17,
		0,98,19,0,93,60,1,1,106,5,78,97,109,101,
		0,12,2,103,4,0,103,5,0,12,3,6,9,9,
		9,100,120,100,100,100,100,100,100,100,100,100,100,100,
		100,100,100,100,9,100,100,100,9,100,100,100,100,100,
		100,100,100,95,1,120,20,56,36,143,0,176,20,0,
		20,0,36,145,0,176,17,0,95,2,106,6,87,105,
		100,116,104,0,12,2,82,26,0,36,160,0,176,15,
		0,20,0,176,16,0,109,4,0,106,20,120,83,99,
		114,111,120,82,111,108,101,111,108,49,83,111,109,98,
		114,97,0,176,2,0,95,2,92,4,12,2,72,95,
		11,95,3,176,17,0,95,2,106,6,87,105,100,116,
		104,0,12,2,92,22,72,92,40,9,9,120,120,120,
		9,106,1,0,100,100,100,100,100,90,16,106,7,66,
		97,114,114,97,72,0,165,83,21,0,6,97,242,242,
		242,0,100,9,9,9,100,120,100,100,100,100,100,100,
		100,100,100,100,100,100,100,100,100,9,100,100,100,9,
		100,100,100,100,100,100,100,100,95,1,120,20,56,36,
		161,0,176,20,0,20,0,36,165,0,176,22,0,176,
		23,0,109,1,0,12,1,121,103,15,0,31,7,93,
		167,0,25,3,121,92,2,20,4,36,168,0,103,27,
		0,121,15,28,36,36,169,0,176,10,0,176,17,0,
		95,2,106,6,87,105,100,116,104,0,12,2,103,19,
		0,49,103,27,0,18,12,1,82,25,0,36,172,0,
		103,15,0,28,13,36,173,0,103,19,0,121,15,82,
		15,0,36,177,0,176,7,0,20,0,36,178,0,176,
		24,0,20,0,36,182,0,176,22,0,176,23,0,109,
		1,0,12,1,121,103,15,0,31,7,93,167,0,25,
		3,121,92,2,20,4,36,183,0,176,25,0,98,19,
		0,92,60,1,176,26,0,176,27,0,106,12,69,118,
		101,110,116,66,97,114,77,116,114,0,12,1,12,1,
		12,2,121,5,28,29,103,15,0,28,24,36,184,0,
		176,28,0,106,12,69,118,101,110,116,66,97,114,77,
		116,114,0,20,1,36,186,0,176,29,0,176,17,0,
		109,1,0,106,7,72,65,78,68,76,69,0,12,2,
		97,0,0,128,0,100,120,20,4,36,189,0,109,1,
		0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YSETBARTAM )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,92,0,36,195,0,95,1,82,19,0,
		36,198,0,95,2,82,27,0,36,201,0,176,10,0,
		176,17,0,103,16,0,106,6,87,105,100,116,104,0,
		12,2,103,19,0,49,103,27,0,18,12,1,82,25,
		0,36,203,0,176,31,0,103,1,0,20,1,36,204,
		0,176,32,0,20,0,36,206,0,176,33,0,20,0,
		36,208,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XH_RETPASY )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,212,0,103,33,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XSHOWHINT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,36,218,0,176,36,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,42,36,219,0,176,37,
		0,95,1,92,20,49,95,2,93,250,0,49,176,26,
		0,95,3,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,28,36,221,0,176,38,0,176,
		26,0,95,3,12,1,95,1,92,20,49,95,2,93,
		250,0,49,20,3,36,224,0,176,39,0,95,3,20,
		1,36,226,0,176,40,0,106,6,120,72,105,110,116,
		0,20,1,36,228,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XCALCBARH )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,116,92,0,36,235,0,121,80,2,36,236,
		0,121,80,3,36,237,0,95,1,103,21,0,92,20,
		65,49,80,4,36,241,0,95,4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGOBARR )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,245,0,176,17,0,103,1,0,106,6,
		87,105,100,116,104,0,12,2,103,19,0,49,92,5,
		49,82,14,0,36,246,0,176,17,0,103,1,0,106,
		6,87,105,100,116,104,0,12,2,103,19,0,49,92,
		5,49,82,5,0,36,249,0,176,31,0,103,1,0,
		20,1,36,250,0,176,32,0,20,0,36,252,0,176,
		33,0,20,0,36,253,0,176,33,0,20,0,36,0,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGOBARL )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,4,1,92,21,82,14,0,36,5,1,
		92,21,82,5,0,36,7,1,176,31,0,103,1,0,
		20,1,36,8,1,176,32,0,20,0,36,10,1,176,
		33,0,20,0,36,11,1,176,33,0,20,0,36,13,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETBARH )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,21,1,103,14,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YUPDATBHA1 )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,92,0,36,26,1,104,14,0,95,1,
		135,36,27,1,104,5,0,95,1,135,36,30,1,176,
		33,0,20,0,36,31,1,176,31,0,103,1,0,20,
		1,36,33,1,176,33,0,20,0,36,34,1,176,32,
		0,20,0,36,37,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XPAINTBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,92,0,36,46,1,176,46,0,95,1,
		12,1,80,5,36,47,1,176,47,0,95,1,12,1,
		80,6,36,48,1,103,19,0,92,20,49,80,7,36,
		51,1,176,48,0,106,9,69,83,81,85,69,82,68,
		65,0,12,1,80,8,36,52,1,176,48,0,106,8,
		68,73,82,69,73,84,65,0,12,1,80,9,36,54,
		1,176,49,0,95,1,92,4,96,4,0,12,3,80,
		10,36,56,1,95,3,100,8,28,5,121,25,4,95,
		3,80,3,36,60,1,9,82,22,0,36,63,1,95,
		2,121,15,28,84,176,26,0,109,21,0,12,1,106,
		7,66,97,114,114,97,72,0,5,28,64,36,65,1,
		95,2,92,2,5,28,25,36,66,1,176,48,0,106,
		9,68,73,82,69,73,84,65,49,0,12,1,80,9,
		25,24,36,68,1,176,48,0,106,10,69,83,81,85,
		69,82,68,65,49,0,12,1,80,8,36,72,1,120,
		82,22,0,36,78,1,103,15,0,31,65,36,81,1,
		176,50,0,95,8,20,1,36,82,1,176,50,0,95,
		9,20,1,36,84,1,176,48,0,106,10,69,83,81,
		85,69,82,68,65,68,0,12,1,80,8,36,85,1,
		176,48,0,106,9,68,73,82,69,73,84,65,68,0,
		12,1,80,9,36,91,1,176,51,0,95,10,121,121,
		95,5,95,6,93,230,0,93,230,0,93,230,0,4,
		3,0,93,230,0,93,230,0,93,230,0,4,3,0,
		20,7,36,94,1,176,52,0,95,10,121,121,92,18,
		92,18,92,3,95,8,20,7,36,95,1,176,52,0,
		95,10,121,95,5,92,20,49,92,18,92,18,92,3,
		95,9,20,7,36,97,1,176,53,0,103,14,0,95,
		5,49,12,1,92,10,34,73,36,103,1,103,12,0,
		31,62,103,15,0,28,57,103,31,0,31,52,36,104,
		1,176,54,0,95,10,92,4,103,14,0,95,7,92,
		10,92,5,92,5,93,178,0,93,178,0,93,178,0,
		4,3,0,93,178,0,93,178,0,93,178,0,4,3,
		0,121,20,10,25,119,36,107,1,103,15,0,28,111,
		36,108,1,103,12,0,31,7,103,31,0,28,51,36,
		109,1,176,54,0,95,10,92,4,103,14,0,95,7,
		92,10,92,5,92,5,92,12,93,134,0,93,166,0,
		4,3,0,93,166,0,93,166,0,93,166,0,4,3,
		0,121,20,10,25,49,36,111,1,176,54,0,95,10,
		92,4,103,14,0,95,7,92,10,92,5,92,5,92,
		12,93,134,0,93,166,0,4,3,0,93,166,0,93,
		166,0,93,166,0,4,3,0,121,20,10,36,117,1,
		176,50,0,95,8,20,1,36,118,1,176,50,0,95,
		9,20,1,36,120,1,176,55,0,95,4,20,1,36,
		123,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGETBARNOME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,92,0,36,128,1,95,1,122,5,28,
		7,103,1,0,25,5,103,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YZERACONTER )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,132,1,121,82,29,0,36,133,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YINCCONTER )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,92,0,36,137,1,95,2,100,8,28,
		5,122,25,4,95,2,80,2,36,139,1,95,1,28,
		13,36,140,1,104,29,0,95,2,135,25,11,36,142,
		1,104,29,0,95,2,136,36,145,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YRETCONTADOR )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,148,1,103,29,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBARMTR )
{
	static const HB_BYTE pcode[] =
	{
		13,21,4,116,92,0,36,152,1,106,1,0,80,5,
		36,153,1,121,80,6,36,154,1,121,80,7,36,155,
		1,9,80,8,36,158,1,121,80,9,36,160,1,176,
		46,0,103,1,0,12,1,80,10,36,162,1,103,19,
		0,80,11,36,163,1,103,3,0,95,11,49,80,12,
		36,164,1,103,13,0,95,11,49,80,13,36,168,1,
		9,80,15,36,170,1,121,80,16,36,174,1,9,80,
		17,36,177,1,9,80,19,36,178,1,9,80,20,36,
		180,1,92,18,80,21,36,182,1,121,80,22,36,183,
		1,121,80,23,36,185,1,121,80,24,36,186,1,121,
		80,25,36,189,1,95,1,176,17,0,103,16,0,106,
		7,72,65,78,68,76,69,0,12,2,8,28,13,36,
		191,1,95,2,93,0,2,8,31,2,36,201,1,176,
		36,0,103,2,0,12,1,29,71,4,95,1,176,17,
		0,103,2,0,106,7,72,65,78,68,76,69,0,12,
		2,8,29,48,4,36,205,1,95,2,93,2,2,8,
		28,60,36,207,1,103,10,0,121,8,28,50,36,208,
		1,121,82,11,0,36,210,1,176,32,0,20,0,36,
		211,1,120,82,6,0,36,212,1,9,82,12,0,36,
		213,1,9,82,31,0,36,214,1,176,60,0,9,103,
		11,0,20,2,36,222,1,95,2,93,1,2,8,29,
		221,1,36,224,1,103,11,0,80,9,36,225,1,103,
		11,0,80,16,36,226,1,9,80,8,36,227,1,121,
		80,21,36,228,1,176,61,0,101,123,20,174,71,225,
		122,148,63,10,2,20,1,36,230,1,176,62,0,96,
		6,0,96,7,0,20,2,36,231,1,176,63,0,95,
		1,95,7,95,6,12,3,80,14,36,232,1,95,14,
		92,2,1,80,6,36,234,1,103,10,0,121,5,29,
		153,0,36,235,1,95,6,103,14,0,16,29,141,0,
		95,6,103,14,0,95,11,72,34,29,129,0,36,237,
		1,95,8,31,77,36,238,1,176,35,0,95,7,95,
		6,106,55,67,108,105,99,107,32,101,32,65,114,114,
		97,115,116,101,32,68,101,118,97,103,97,114,32,112,
		97,114,97,32,78,97,118,101,103,97,114,32,101,110,
		116,114,101,32,97,115,32,67,111,108,117,110,97,115,
		46,0,20,3,36,239,1,120,80,8,36,241,1,176,
		33,0,20,0,36,242,1,93,231,3,82,10,0,36,
		243,1,120,82,12,0,36,244,1,95,6,82,11,0,
		36,245,1,176,60,0,120,103,11,0,20,2,36,249,
		1,122,165,80,18,25,18,36,250,1,176,64,0,95,
		18,20,1,36,249,1,175,18,0,93,255,0,15,28,
		236,36,253,1,103,10,0,122,5,28,69,103,6,0,
		31,64,36,255,1,103,10,0,122,5,28,54,103,6,
		0,31,49,36,1,2,176,64,0,122,12,1,121,8,
		28,23,36,2,2,176,61,0,101,184,30,133,235,81,
		184,158,63,10,2,20,1,25,15,36,10,2,176,65,
		0,9,100,120,20,3,25,196,36,45,2,103,10,0,
		92,2,5,28,109,103,6,0,31,104,36,47,2,122,
		165,80,18,25,18,36,48,2,176,64,0,95,18,20,
		1,36,47,2,175,18,0,93,255,0,15,28,236,36,
		51,2,176,33,0,20,0,36,53,2,103,10,0,92,
		2,5,28,54,103,6,0,31,49,36,56,2,176,64,
		0,122,12,1,121,8,28,23,36,57,2,176,61,0,
		101,184,30,133,235,81,184,158,63,10,2,20,1,25,
		15,36,62,2,176,65,0,120,100,120,20,3,25,195,
		36,97,2,95,2,93,0,2,8,29,249,1,36,98,
		2,176,62,0,96,6,0,96,7,0,20,2,36,99,
		2,176,63,0,95,1,95,7,95,6,12,3,80,14,
		36,100,2,95,14,92,2,1,80,6,36,101,2,9,
		82,6,0,36,103,2,106,7,66,97,114,114,97,72,
		0,83,21,0,36,105,2,95,6,92,18,15,28,80,
		95,6,95,10,92,20,49,35,28,70,36,106,2,103,
		35,0,32,37,1,36,108,2,103,12,0,31,25,36,
		109,2,176,33,0,20,0,36,110,2,9,82,31,0,
		36,111,2,176,33,0,20,0,36,114,2,176,66,0,
		103,1,0,20,1,36,115,2,9,82,7,0,36,116,
		2,120,82,35,0,26,234,0,36,122,2,103,7,0,
		32,225,0,36,124,2,9,82,35,0,36,126,2,121,
		82,10,0,36,127,2,176,67,0,95,1,93,0,127,
		20,2,36,129,2,103,4,0,121,15,28,36,36,130,
		2,121,82,4,0,36,131,2,176,31,0,103,1,0,
		20,1,36,132,2,176,33,0,20,0,36,133,2,176,
		32,0,20,0,36,136,2,95,6,92,21,35,28,57,
		36,137,2,122,82,4,0,36,138,2,176,31,0,103,
		1,0,20,1,36,139,2,122,82,10,0,36,140,2,
		9,82,6,0,36,141,2,120,82,7,0,36,142,2,
		176,33,0,20,0,36,143,2,176,32,0,20,0,36,
		146,2,95,6,95,10,92,18,49,16,28,75,36,147,
		2,176,68,0,20,0,36,148,2,176,33,0,20,0,
		36,149,2,92,2,82,4,0,36,150,2,176,31,0,
		103,1,0,20,1,36,151,2,92,2,82,10,0,36,
		152,2,9,82,6,0,36,153,2,120,82,7,0,36,
		154,2,176,33,0,20,0,36,155,2,176,32,0,20,
		0,36,164,2,103,10,0,121,5,28,113,36,166,2,
		9,82,31,0,36,168,2,95,6,103,14,0,16,28,
		34,95,6,103,14,0,95,11,72,34,28,23,36,169,
		2,95,14,122,1,92,20,34,28,24,36,170,2,120,
		82,31,0,25,15,36,173,2,9,82,12,0,36,174,
		2,9,80,8,36,176,2,121,82,4,0,36,177,2,
		176,31,0,103,1,0,20,1,36,179,2,176,33,0,
		20,0,36,180,2,176,32,0,20,0,36,181,2,9,
		82,6,0,36,182,2,9,82,7,0,36,191,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XINITSXY )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,194,2,92,19,82,14,0,36,195,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDOSCROLV )
{
	static const HB_BYTE pcode[] =
	{
		13,3,3,116,92,0,36,201,2,176,70,0,176,14,
		0,12,0,12,1,80,4,36,202,2,176,71,0,103,
		29,0,122,72,95,4,12,2,80,5,36,206,2,121,
		80,6,36,211,2,95,3,100,8,28,5,9,25,4,
		95,3,80,3,36,213,2,95,2,100,8,28,5,120,
		25,4,95,2,80,2,36,215,2,176,61,0,101,154,
		153,153,153,153,153,169,63,10,2,20,1,36,218,2,
		95,1,29,10,1,36,221,2,95,3,31,103,36,222,
		2,176,70,0,176,14,0,12,0,12,1,80,4,36,
		223,2,176,71,0,103,29,0,122,72,95,4,12,2,
		80,5,36,225,2,176,72,0,120,176,34,0,12,0,
		95,2,95,5,122,1,95,5,92,2,1,20,5,36,
		229,2,104,17,0,95,5,122,1,135,36,231,2,176,
		33,0,20,0,36,232,2,95,5,122,1,82,37,0,
		36,233,2,176,73,0,95,5,122,1,20,1,26,179,
		1,36,237,2,104,29,0,170,36,238,2,176,74,0,
		103,29,0,92,5,12,2,80,4,36,243,2,103,29,
		0,122,8,28,9,36,244,2,126,4,17,0,36,247,
		2,4,0,0,80,5,36,248,2,176,75,0,95,5,
		95,4,20,2,36,249,2,176,75,0,95,5,122,20,
		2,36,251,2,176,33,0,20,0,36,253,2,176,61,
		0,101,184,30,133,235,81,184,158,63,10,2,20,1,
		36,255,2,176,76,0,120,9,95,4,20,3,36,0,
		3,176,32,0,20,0,36,1,3,176,61,0,101,123,
		20,174,71,225,122,148,63,10,2,20,1,36,2,3,
		176,77,0,20,0,36,4,3,176,33,0,20,0,26,
		24,1,36,16,3,103,29,0,121,8,28,80,36,17,
		3,176,78,0,176,79,0,106,59,67,111,108,117,110,
		97,32,109,97,105,115,32,97,32,69,115,113,117,101,
		114,100,97,32,65,116,105,110,103,105,100,97,46,78,
		227,111,32,201,32,112,111,115,115,105,118,101,108,32,
		82,101,116,114,111,99,101,100,101,114,46,0,12,1,
		20,1,36,18,3,7,36,21,3,176,80,0,103,17,
		0,12,1,80,6,36,24,3,103,37,0,121,15,28,
		31,36,25,3,103,37,0,80,6,36,26,3,121,82,
		37,0,36,27,3,176,12,0,106,4,108,108,50,0,
		20,1,36,29,3,104,17,0,95,6,136,36,31,3,
		176,33,0,20,0,36,32,3,176,61,0,101,123,20,
		174,71,225,122,164,63,10,2,20,1,36,33,3,176,
		72,0,9,176,34,0,12,0,66,95,2,95,6,122,
		20,5,36,35,3,176,73,0,95,6,20,1,36,38,
		3,103,29,0,121,8,28,17,36,39,3,121,82,17,
		0,36,40,3,176,69,0,20,0,36,43,3,122,165,
		83,81,0,25,24,36,44,3,176,64,0,109,81,0,
		20,1,36,43,3,109,81,0,23,21,83,81,0,93,
		255,0,15,28,230,36,47,3,176,82,0,20,0,36,
		52,3,120,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XROLETELA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,5,116,92,0,36,58,3,95,3,100,8,28,
		5,120,25,4,95,3,80,3,36,61,3,95,1,31,
		103,36,62,3,104,29,0,95,5,136,36,63,3,176,
		76,0,9,9,95,4,20,3,36,65,3,95,3,28,
		12,36,66,3,176,45,0,95,2,20,1,36,69,3,
		176,32,0,20,0,36,70,3,176,61,0,101,123,20,
		174,71,225,122,148,63,10,2,20,1,36,71,3,176,
		77,0,20,0,36,72,3,176,33,0,20,0,36,73,
		3,103,29,0,121,8,28,85,36,74,3,92,21,82,
		14,0,25,75,36,78,3,104,29,0,95,5,135,36,
		80,3,176,76,0,120,9,95,4,20,3,36,81,3,
		95,3,28,12,36,82,3,176,45,0,95,2,20,1,
		36,84,3,176,32,0,20,0,36,85,3,176,61,0,
		101,123,20,174,71,225,122,148,63,10,2,20,1,36,
		86,3,176,77,0,20,0,36,89,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YCHECKOBJ )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,97,3,176,84,0,176,26,0,109,21,
		0,12,1,12,1,31,69,109,21,0,106,8,66,114,
		111,119,115,101,114,0,69,28,53,36,100,3,176,36,
		0,103,1,0,12,1,28,40,36,101,3,103,12,0,
		31,13,36,102,3,176,66,0,103,1,0,20,1,36,
		106,3,176,85,0,103,23,0,20,1,36,107,3,176,
		33,0,20,0,36,116,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YRETACENDE )
{
	static const HB_BYTE pcode[] =
	{
		116,92,0,36,120,3,103,4,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YOFFBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,92,0,36,125,3,9,82,12,0,36,
		126,3,9,82,31,0,36,128,3,121,82,4,0,36,
		129,3,121,82,10,0,36,132,3,176,31,0,95,1,
		20,1,36,134,3,176,32,0,20,0,36,136,3,9,
		82,6,0,36,137,3,9,82,7,0,36,141,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YENABLE1BH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,92,0,36,146,3,95,1,82,15,0,
		36,148,3,95,1,31,13,36,149,3,176,66,0,103,
		1,0,20,1,36,152,3,176,33,0,20,0,36,154,
		3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGETSCRXY )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,92,0,36,157,3,95,1,31,7,103,
		14,0,25,9,103,14,0,103,19,0,72,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YDCBARH1 )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,92,0,36,161,3,176,46,0,103,1,
		0,12,1,80,1,36,162,3,176,47,0,103,1,0,
		12,1,80,2,36,167,3,122,80,7,36,168,3,121,
		80,8,36,169,3,92,45,80,9,36,173,3,176,46,
		0,103,2,0,12,1,80,10,36,174,3,176,47,0,
		103,2,0,12,1,80,11,36,176,3,176,49,0,103,
		1,0,92,3,96,4,0,12,3,80,3,36,177,3,
		176,49,0,103,2,0,92,3,96,6,0,12,3,80,
		5,36,180,3,103,15,0,31,32,36,181,3,176,89,
		0,95,5,121,121,95,10,95,11,93,245,0,121,95,
		3,121,121,95,1,95,2,20,12,25,27,36,183,3,
		176,90,0,95,5,121,121,95,10,95,11,121,95,3,
		121,121,95,1,95,2,20,11,36,188,3,176,55,0,
		95,4,20,1,36,189,3,176,55,0,95,6,20,1,
		36,191,3,176,31,0,103,2,0,20,1,36,193,3,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,92,0,37,0,116,92,0,106,1,0,82,1,0,
		106,1,0,82,2,0,121,82,3,0,121,82,4,0,
		92,18,82,5,0,9,82,6,0,9,82,7,0,120,
		82,8,0,92,18,82,9,0,121,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,92,19,82,14,
		0,120,82,15,0,106,1,0,82,16,0,121,82,17,
		0,121,82,18,0,121,82,19,0,121,82,20,0,121,
		82,21,0,9,82,22,0,106,1,0,82,23,0,121,
		82,24,0,121,82,25,0,121,82,26,0,121,82,27,
		0,121,82,28,0,121,82,29,0,122,82,30,0,9,
		82,31,0,9,82,32,0,121,82,33,0,4,0,0,
		82,34,0,9,82,35,0,121,82,36,0,121,82,37,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

