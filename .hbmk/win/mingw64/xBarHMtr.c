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
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC( XH_CALCBAR );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_STATIC( XPAINTBARRAH );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( SETLAYEREDWINDOWATTRIBUTES );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_EXTERN( XH_INITLIM );
HB_FUNC( YZERACONTER );
HB_FUNC_EXTERN( HMG_CHANGEWINDOWSTYLE );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC( XQBRWCOL );
HB_FUNC_EXTERN( XH_XCLCDIR );
HB_FUNC( XRETISFIM );
HB_FUNC( XRETISINI );
HB_FUNC( XH_RETPASY );
HB_FUNC_STATIC( XSHOWHINT );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( CRIEJANTIP );
HB_FUNC_EXTERN( XDISPHINT );
HB_FUNC_EXTERN( XDISPUPTAM );
HB_FUNC_EXTERN( BRINGTOP );
HB_FUNC_EXTERN( TRANSFORM );
HB_FUNC_EXTERN( INT );
HB_FUNC_EXTERN( RTRANS );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC( YDCBARH1 );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC( YRETQPASSO );
HB_FUNC( YBARRANGE );
HB_FUNC( YRETBARSIZE );
HB_FUNC( YGOBARR );
HB_FUNC( YGOBARL );
HB_FUNC( XRETBARH );
HB_FUNC( YUPDATBHA1 );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLHORIZONTAL );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( BT_DRAWFILLROUNDRECT );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC( YGETBARNOME );
HB_FUNC( YINCCONTER );
HB_FUNC( YRETCONTADOR );
HB_FUNC( XPOTBUT1 );
HB_FUNC_EXTERN( SENDMESSAGE );
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
HB_FUNC( XDOSCRLMOV );
HB_FUNC_EXTERN( XH_COLRESTO );
HB_FUNC_EXTERN( XH_RTLIMITE );
HB_FUNC_EXTERN( XH_CALCPULO );
HB_FUNC( XROLETELA );
HB_FUNC_EXTERN( XH_INCLIM );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( XGETCOLPOS );
HB_FUNC_EXTERN( XGETINFCW1 );
HB_FUNC_EXTERN( XGETSCROLPOS );
HB_FUNC( XDOSCROLHROZ );
HB_FUNC_EXTERN( XH_COLVOLTA );
HB_FUNC_EXTERN( HMG_CLEANLASTMOUSEMESSAGE );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC_EXTERN( XINITSCROLL );
HB_FUNC_EXTERN( YSCROLLCAM );
HB_FUNC_EXTERN( YDCBARH1EMTR );
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
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "XH_CALCBAR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XH_CALCBAR )}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "XPAINTBARRAH", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTBARRAH )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "COBJSELECTED", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SETLAYEREDWINDOWATTRIBUTES", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETLAYEREDWINDOWATTRIBUTES )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "XH_INITLIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_INITLIM )}, NULL },
{ "YZERACONTER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YZERACONTER )}, NULL },
{ "HMG_CHANGEWINDOWSTYLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CHANGEWINDOWSTYLE )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "XQBRWCOL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XQBRWCOL )}, NULL },
{ "XH_XCLCDIR", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_XCLCDIR )}, NULL },
{ "XRETISFIM", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETISFIM )}, NULL },
{ "XRETISINI", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETISINI )}, NULL },
{ "LSCROLLINI", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XH_RETPASY", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XH_RETPASY )}, NULL },
{ "XSHOWHINT", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSHOWHINT )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "CRIEJANTIP", {HB_FS_PUBLIC}, {HB_FUNCNAME( CRIEJANTIP )}, NULL },
{ "XDISPHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPHINT )}, NULL },
{ "XDISPUPTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDISPUPTAM )}, NULL },
{ "BRINGTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BRINGTOP )}, NULL },
{ "TRANSFORM", {HB_FS_PUBLIC}, {HB_FUNCNAME( TRANSFORM )}, NULL },
{ "NZ1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "RTRANS", {HB_FS_PUBLIC}, {HB_FUNCNAME( RTRANS )}, NULL },
{ "NP1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "YDCBARH1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YDCBARH1 )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "YRETQPASSO", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YRETQPASSO )}, NULL },
{ "YBARRANGE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YBARRANGE )}, NULL },
{ "YRETBARSIZE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YRETBARSIZE )}, NULL },
{ "YGOBARR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGOBARR )}, NULL },
{ "YGOBARL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGOBARL )}, NULL },
{ "XRETBARH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETBARH )}, NULL },
{ "YUPDATBHA1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YUPDATBHA1 )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_DRAWGRADIENTFILLHORIZONTAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLHORIZONTAL )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "BT_DRAWFILLROUNDRECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWFILLROUNDRECT )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "YGETBARNOME", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGETBARNOME )}, NULL },
{ "YINCCONTER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YINCCONTER )}, NULL },
{ "YRETCONTADOR", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YRETCONTADOR )}, NULL },
{ "XPOTBUT1", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPOTBUT1 )}, NULL },
{ "SENDMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( SENDMESSAGE )}, NULL },
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
{ "XDOSCRLMOV", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDOSCRLMOV )}, NULL },
{ "XH_COLRESTO", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_COLRESTO )}, NULL },
{ "XH_RTLIMITE", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_RTLIMITE )}, NULL },
{ "XH_CALCPULO", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_CALCPULO )}, NULL },
{ "XROLETELA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XROLETELA )}, NULL },
{ "XH_INCLIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_INCLIM )}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "XGETCOLPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGETCOLPOS )}, NULL },
{ "XGETINFCW1", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGETINFCW1 )}, NULL },
{ "XGETSCROLPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGETSCROLPOS )}, NULL },
{ "NCOLINIBRW", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XDOSCROLHROZ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDOSCROLHROZ )}, NULL },
{ "XH_COLVOLTA", {HB_FS_PUBLIC}, {HB_FUNCNAME( XH_COLVOLTA )}, NULL },
{ "I", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HMG_CLEANLASTMOUSEMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CLEANLASTMOUSEMESSAGE )}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "N1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XINITSCROLL", {HB_FS_PUBLIC}, {HB_FUNCNAME( XINITSCROLL )}, NULL },
{ "YSCROLLCAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( YSCROLLCAM )}, NULL },
{ "YDCBARH1EMTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( YDCBARH1EMTR )}, NULL },
{ "YCHECKOBJ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YCHECKOBJ )}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "YAPAGUEH", {HB_FS_PUBLIC}, {HB_FUNCNAME( YAPAGUEH )}, NULL },
{ "YRETACENDE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YRETACENDE )}, NULL },
{ "YENABLE1BH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YENABLE1BH )}, NULL },
{ "YGETSCRXY", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( YGETSCRXY )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00046)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,0,11,116,105,0,36,76,0,106,10,87,105,110,
		95,66,104,77,116,114,0,176,2,0,95,1,92,4,
		12,2,72,176,3,0,108,1,20,1,81,1,0,36,
		77,0,106,16,87,105,110,95,83,111,109,98,114,97,
		66,104,77,116,114,0,176,2,0,95,1,92,4,12,
		2,72,176,3,0,108,4,20,1,81,4,0,36,78,
		0,109,4,0,82,2,0,36,79,0,95,4,82,3,
		0,36,80,0,109,1,0,82,1,0,36,81,0,95,
		6,82,16,0,36,82,0,95,5,82,13,0,36,84,
		0,176,5,0,12,0,82,22,0,36,86,0,176,6,
		0,106,9,68,73,82,69,73,84,65,49,0,12,1,
		82,45,0,36,87,0,176,6,0,106,10,69,83,81,
		85,69,82,68,65,49,0,12,1,82,46,0,36,90,
		0,176,6,0,106,8,68,73,82,69,73,84,65,0,
		12,1,82,41,0,36,91,0,176,6,0,106,9,69,
		83,81,85,69,82,68,65,0,12,1,82,42,0,36,
		94,0,176,6,0,106,10,69,83,81,85,69,82,68,
		65,68,0,12,1,82,44,0,36,95,0,176,6,0,
		106,9,68,73,82,69,73,84,65,68,0,12,1,82,
		43,0,36,100,0,95,10,82,15,0,36,101,0,95,
		7,82,23,0,36,105,0,121,82,21,0,36,122,0,
		176,7,0,20,0,36,128,0,95,9,82,25,0,36,
		139,0,176,8,0,20,0,176,9,0,109,1,0,106,
		14,120,83,99,114,111,120,82,111,108,101,111,108,49,
		0,176,2,0,95,2,92,4,12,2,72,95,11,92,
		3,49,95,3,92,3,49,176,10,0,95,2,106,6,
		87,105,100,116,104,0,12,2,92,22,72,92,20,9,
		9,120,120,120,9,106,1,0,100,100,100,100,100,100,
		93,255,0,93,255,0,93,255,0,4,3,0,90,33,
		176,11,0,176,10,0,98,12,0,93,60,1,1,106,
		5,78,97,109,101,0,12,2,103,4,0,103,5,0,
		12,3,6,9,9,9,100,120,100,100,100,100,100,100,
		100,100,100,100,100,100,100,100,100,9,100,100,100,9,
		100,100,100,100,100,100,100,100,95,1,120,9,20,57,
		36,140,0,176,13,0,20,0,36,142,0,176,10,0,
		95,2,106,6,87,105,100,116,104,0,12,2,82,28,
		0,36,159,0,176,8,0,20,0,176,9,0,109,4,
		0,106,20,120,83,99,114,111,120,82,111,108,101,111,
		108,49,83,111,109,98,114,97,0,176,2,0,95,2,
		92,4,12,2,72,95,11,92,3,49,95,3,92,3,
		49,176,10,0,95,2,106,6,87,105,100,116,104,0,
		12,2,92,22,72,92,40,9,9,120,120,120,9,106,
		1,0,100,100,100,100,100,90,16,106,7,66,97,114,
		114,97,72,0,165,83,14,0,6,97,242,242,242,0,
		100,9,9,9,100,120,100,100,100,100,100,100,100,100,
		100,100,100,100,100,100,100,9,100,100,100,9,100,100,
		100,100,100,100,100,100,95,1,120,9,20,57,36,160,
		0,176,13,0,20,0,36,164,0,176,15,0,176,16,
		0,109,1,0,12,1,121,103,15,0,31,7,93,167,
		0,25,3,121,92,2,20,4,36,166,0,103,15,0,
		28,13,36,167,0,103,21,0,121,15,82,15,0,36,
		171,0,176,17,0,20,0,36,172,0,176,18,0,20,
		0,36,177,0,176,19,0,176,16,0,109,4,0,12,
		1,100,97,0,0,2,0,120,120,20,5,36,181,0,
		176,15,0,176,16,0,109,1,0,12,1,121,103,15,
		0,31,7,93,167,0,25,3,121,92,2,20,4,36,
		182,0,176,20,0,98,12,0,92,60,1,176,21,0,
		176,22,0,106,12,69,118,101,110,116,66,97,114,77,
		116,114,0,12,1,12,1,12,2,121,5,28,29,103,
		15,0,28,24,36,183,0,176,23,0,106,12,69,118,
		101,110,116,66,97,114,77,116,114,0,20,1,36,190,
		0,109,1,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XQBRWCOL )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,194,0,176,25,0,103,23,0,20,1,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETISFIM )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,198,0,103,19,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETISINI )
{
	static const HB_BYTE pcode[] =
	{
		36,201,0,109,28,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XH_RETPASY )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,206,0,103,35,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XSHOWHINT )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,36,212,0,176,31,0,106,8,87,105,110,
		95,77,115,103,0,12,1,31,42,36,213,0,176,32,
		0,95,1,92,20,49,95,2,93,250,0,49,176,21,
		0,95,3,12,1,100,101,0,0,0,0,0,0,224,
		63,10,1,20,5,25,28,36,215,0,176,33,0,176,
		21,0,95,3,12,1,95,1,92,20,49,95,2,93,
		250,0,49,20,3,36,218,0,176,34,0,95,3,20,
		1,36,220,0,176,35,0,106,6,120,72,105,110,116,
		0,20,1,36,222,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XH_CALCBAR )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,105,0,36,226,0,176,25,0,103,23,
		0,12,1,80,2,36,227,0,103,21,0,80,3,36,
		230,0,95,1,100,8,28,5,9,25,4,95,1,80,
		1,36,233,0,176,17,0,20,0,36,235,0,95,2,
		121,15,29,148,0,36,236,0,176,36,0,95,2,103,
		23,0,18,106,15,57,57,57,44,57,57,57,46,57,
		57,57,57,57,57,0,12,2,83,37,0,36,237,0,
		176,38,0,103,13,0,92,15,49,176,39,0,109,37,
		0,12,1,65,12,1,83,40,0,36,238,0,103,13,
		0,92,15,49,109,40,0,49,82,21,0,36,239,0,
		176,38,0,109,40,0,95,2,122,49,18,12,1,82,
		35,0,36,240,0,95,2,122,49,82,29,0,36,241,
		0,176,31,0,103,1,0,12,1,28,29,36,242,0,
		176,41,0,103,1,0,20,1,36,243,0,176,42,0,
		20,0,36,244,0,176,43,0,20,0,36,248,0,176,
		17,0,20,0,36,250,0,95,2,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YRETQPASSO )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,255,0,103,29,0,122,72,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YBARRANGE )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,2,1,103,29,0,122,72,103,21,0,
		65,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YRETBARSIZE )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,5,1,103,21,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGOBARR )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,11,1,176,10,0,103,1,0,106,6,
		87,105,100,116,104,0,12,2,103,21,0,49,92,5,
		49,82,14,0,36,12,1,176,10,0,103,1,0,106,
		6,87,105,100,116,104,0,12,2,103,21,0,49,92,
		5,49,82,5,0,36,15,1,176,41,0,103,1,0,
		20,1,36,16,1,176,42,0,20,0,36,18,1,176,
		43,0,20,0,36,19,1,176,43,0,20,0,36,22,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGOBARL )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,26,1,92,21,82,14,0,36,27,1,
		92,21,82,5,0,36,29,1,176,41,0,103,1,0,
		20,1,36,30,1,176,42,0,20,0,36,32,1,176,
		43,0,20,0,36,33,1,176,43,0,20,0,36,35,
		1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETBARH )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,43,1,103,14,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YUPDATBHA1 )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,105,0,36,48,1,104,14,0,95,1,
		135,36,49,1,104,5,0,95,1,135,36,54,1,176,
		43,0,20,0,36,55,1,176,41,0,103,1,0,20,
		1,36,57,1,176,43,0,20,0,36,58,1,176,42,
		0,20,0,36,62,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XPAINTBARRAH )
{
	static const HB_BYTE pcode[] =
	{
		13,5,3,116,105,0,36,71,1,176,51,0,95,1,
		12,1,80,5,36,72,1,176,52,0,95,1,12,1,
		80,6,36,73,1,103,21,0,80,7,36,80,1,176,
		53,0,95,1,92,4,96,4,0,12,3,80,8,36,
		82,1,95,3,100,8,28,5,121,25,4,95,3,80,
		3,36,86,1,9,82,24,0,36,89,1,95,2,121,
		15,28,29,176,21,0,109,14,0,12,1,106,7,66,
		97,114,114,97,72,0,5,28,9,36,90,1,120,82,
		24,0,36,100,1,176,54,0,95,8,121,121,95,5,
		95,6,93,230,0,93,230,0,93,230,0,4,3,0,
		93,230,0,93,230,0,93,230,0,4,3,0,20,7,
		36,103,1,103,15,0,31,51,36,104,1,176,55,0,
		95,8,121,121,92,18,92,18,92,3,103,44,0,20,
		7,36,105,1,176,55,0,95,8,121,95,5,92,22,
		49,92,18,92,18,92,3,103,43,0,20,7,26,185,
		0,36,108,1,95,2,121,15,29,129,0,176,21,0,
		109,14,0,12,1,106,7,66,97,114,114,97,72,0,
		5,28,108,36,110,1,95,2,92,2,5,28,50,36,
		111,1,176,55,0,95,8,121,121,92,18,92,18,92,
		3,103,42,0,20,7,36,112,1,176,55,0,95,8,
		121,95,5,92,22,49,92,18,92,18,92,3,103,45,
		0,20,7,25,96,36,114,1,176,55,0,95,8,121,
		121,92,18,92,18,92,3,103,46,0,20,7,36,115,
		1,176,55,0,95,8,121,95,5,92,22,49,92,18,
		92,18,92,3,103,41,0,20,7,25,48,36,119,1,
		176,55,0,95,8,121,121,92,18,92,18,92,3,103,
		42,0,20,7,36,120,1,176,55,0,95,8,121,95,
		5,92,22,49,92,18,92,18,92,3,103,41,0,20,
		7,36,129,1,103,12,0,31,62,103,15,0,28,57,
		103,33,0,31,52,36,130,1,176,56,0,95,8,92,
		4,103,14,0,95,7,92,10,92,5,92,5,93,178,
		0,93,178,0,93,178,0,4,3,0,93,178,0,93,
		178,0,93,178,0,4,3,0,121,20,10,25,119,36,
		133,1,103,15,0,28,111,36,134,1,103,12,0,31,
		7,103,33,0,28,51,36,135,1,176,56,0,95,8,
		92,4,103,14,0,95,7,92,10,92,5,92,5,92,
		12,93,134,0,93,166,0,4,3,0,93,166,0,93,
		166,0,93,166,0,4,3,0,121,20,10,25,49,36,
		137,1,176,56,0,95,8,92,4,103,14,0,95,7,
		92,10,92,5,92,5,92,12,93,134,0,93,166,0,
		4,3,0,93,166,0,93,166,0,93,166,0,4,3,
		0,121,20,10,36,143,1,176,57,0,95,4,20,1,
		36,145,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGETBARNOME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,105,0,36,150,1,95,1,122,5,28,
		7,103,1,0,25,5,103,2,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YZERACONTER )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,154,1,121,82,31,0,36,155,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YINCCONTER )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,105,0,36,159,1,95,2,100,8,28,
		5,122,25,4,95,2,80,2,36,161,1,95,1,28,
		13,36,162,1,104,31,0,95,2,135,25,11,36,164,
		1,104,31,0,95,2,136,36,167,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YRETCONTADOR )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,170,1,103,31,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPOTBUT1 )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,105,0,36,175,1,95,1,82,10,0,
		36,176,1,9,82,6,0,36,177,1,176,62,0,176,
		10,0,103,2,0,106,7,72,65,78,68,76,69,0,
		12,2,93,1,2,121,121,20,4,36,179,1,176,43,
		0,20,0,36,182,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBARMTR )
{
	static const HB_BYTE pcode[] =
	{
		13,21,4,116,105,0,36,186,1,106,1,0,80,5,
		36,187,1,121,80,6,36,188,1,121,80,7,36,189,
		1,9,80,8,36,192,1,121,80,9,36,194,1,176,
		51,0,103,1,0,12,1,80,10,36,196,1,103,21,
		0,80,11,36,197,1,103,3,0,95,11,49,80,12,
		36,198,1,103,13,0,95,11,49,80,13,36,202,1,
		9,80,15,36,204,1,121,80,16,36,208,1,9,80,
		17,36,211,1,9,80,19,36,212,1,9,80,20,36,
		214,1,92,18,80,21,36,216,1,121,80,22,36,217,
		1,121,80,23,36,219,1,121,80,24,36,220,1,121,
		80,25,36,223,1,95,1,176,10,0,103,16,0,106,
		7,72,65,78,68,76,69,0,12,2,8,28,13,36,
		225,1,95,2,93,0,2,8,31,2,36,235,1,176,
		31,0,103,2,0,12,1,29,151,4,95,1,176,10,
		0,103,2,0,106,7,72,65,78,68,76,69,0,12,
		2,8,29,128,4,36,239,1,95,2,93,2,2,8,
		28,87,36,241,1,103,10,0,121,8,28,77,36,242,
		1,121,82,11,0,36,244,1,176,43,0,20,0,36,
		246,1,176,42,0,20,0,36,247,1,120,82,6,0,
		36,248,1,9,82,12,0,36,249,1,9,82,33,0,
		36,250,1,176,64,0,9,103,11,0,20,2,36,252,
		1,176,65,0,101,236,81,184,30,133,235,177,63,10,
		2,20,1,36,5,2,95,2,93,1,2,8,29,18,
		2,36,7,2,103,11,0,80,9,36,8,2,103,11,
		0,80,16,36,9,2,9,80,8,36,10,2,121,80,
		21,36,14,2,176,66,0,96,6,0,96,7,0,20,
		2,36,15,2,176,67,0,95,1,95,7,95,6,12,
		3,80,14,36,16,2,95,14,92,2,1,80,6,36,
		19,2,103,10,0,121,5,29,169,0,36,20,2,95,
		6,103,14,0,16,29,157,0,95,6,103,14,0,95,
		11,72,34,29,145,0,36,22,2,95,8,31,85,36,
		23,2,176,30,0,95,7,95,6,106,55,67,108,105,
		99,107,32,101,32,65,114,114,97,115,116,101,32,68,
		101,118,97,103,97,114,32,112,97,114,97,32,78,97,
		118,101,103,97,114,32,101,110,116,114,101,32,97,115,
		32,67,111,108,117,110,97,115,46,0,20,3,36,24,
		2,176,43,0,20,0,36,25,2,120,80,8,36,27,
		2,176,43,0,20,0,36,28,2,93,231,3,82,10,
		0,36,29,2,120,82,12,0,36,30,2,95,6,82,
		11,0,36,31,2,176,64,0,120,103,11,0,20,2,
		36,32,2,176,43,0,20,0,36,38,2,122,165,80,
		18,25,18,36,39,2,176,68,0,95,18,20,1,36,
		38,2,175,18,0,93,255,0,15,28,236,36,42,2,
		103,10,0,122,5,28,96,103,6,0,31,91,36,44,
		2,103,10,0,122,5,28,81,103,6,0,31,76,36,
		46,2,176,68,0,122,12,1,121,8,28,23,36,47,
		2,176,65,0,101,184,30,133,235,81,184,158,63,10,
		2,20,1,25,42,36,51,2,176,69,0,9,100,120,
		20,3,36,52,2,176,43,0,20,0,36,54,2,176,
		65,0,101,154,153,153,153,153,153,169,63,10,2,20,
		1,25,169,36,61,2,103,10,0,92,2,5,29,138,
		0,103,6,0,32,132,0,36,63,2,122,165,80,18,
		25,18,36,64,2,176,68,0,95,18,20,1,36,63,
		2,175,18,0,93,255,0,15,28,236,36,67,2,176,
		43,0,20,0,36,69,2,103,10,0,92,2,5,28,
		81,103,6,0,31,76,36,72,2,176,68,0,122,12,
		1,121,8,28,23,36,73,2,176,65,0,101,184,30,
		133,235,81,184,158,63,10,2,20,1,25,42,36,78,
		2,176,69,0,120,100,120,20,3,36,79,2,176,43,
		0,20,0,36,81,2,176,65,0,101,154,153,153,153,
		153,153,169,63,10,2,20,1,25,168,36,93,2,95,
		2,93,0,2,8,29,249,1,36,94,2,176,66,0,
		96,6,0,96,7,0,20,2,36,95,2,176,67,0,
		95,1,95,7,95,6,12,3,80,14,36,96,2,95,
		14,92,2,1,80,6,36,97,2,9,82,6,0,36,
		99,2,106,7,66,97,114,114,97,72,0,83,14,0,
		36,101,2,95,6,92,18,15,28,80,95,6,95,10,
		92,20,49,35,28,70,36,103,2,103,37,0,32,37,
		1,36,105,2,103,12,0,31,25,36,106,2,176,43,
		0,20,0,36,107,2,9,82,33,0,36,108,2,176,
		43,0,20,0,36,111,2,176,70,0,103,1,0,20,
		1,36,112,2,9,82,7,0,36,113,2,120,82,37,
		0,26,234,0,36,120,2,103,7,0,32,225,0,36,
		122,2,9,82,37,0,36,124,2,121,82,10,0,36,
		125,2,176,71,0,95,1,93,0,127,20,2,36,127,
		2,103,4,0,121,15,28,36,36,128,2,121,82,4,
		0,36,129,2,176,41,0,103,1,0,20,1,36,130,
		2,176,43,0,20,0,36,131,2,176,42,0,20,0,
		36,134,2,95,6,92,21,35,28,57,36,135,2,122,
		82,4,0,36,136,2,176,41,0,103,1,0,20,1,
		36,137,2,122,82,10,0,36,138,2,9,82,6,0,
		36,139,2,120,82,7,0,36,140,2,176,43,0,20,
		0,36,141,2,176,42,0,20,0,36,144,2,95,6,
		95,10,92,18,49,16,28,75,36,145,2,176,72,0,
		20,0,36,146,2,176,43,0,20,0,36,147,2,92,
		2,82,4,0,36,148,2,176,41,0,103,1,0,20,
		1,36,149,2,92,2,82,10,0,36,150,2,9,82,
		6,0,36,151,2,120,82,7,0,36,152,2,176,43,
		0,20,0,36,153,2,176,42,0,20,0,36,162,2,
		103,10,0,121,5,28,113,36,164,2,9,82,33,0,
		36,166,2,95,6,103,14,0,16,28,34,95,6,103,
		14,0,95,11,72,34,28,23,36,167,2,95,14,122,
		1,92,20,34,28,24,36,168,2,120,82,33,0,25,
		15,36,171,2,9,82,12,0,36,172,2,9,80,8,
		36,174,2,121,82,4,0,36,175,2,176,41,0,103,
		1,0,20,1,36,177,2,176,43,0,20,0,36,178,
		2,176,42,0,20,0,36,179,2,9,82,6,0,36,
		180,2,9,82,7,0,36,187,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XINITSXY )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,190,2,92,19,82,14,0,36,191,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDOSCRLMOV )
{
	static const HB_BYTE pcode[] =
	{
		13,1,0,36,197,2,176,43,0,20,0,36,198,2,
		176,65,0,101,123,20,174,71,225,122,148,63,10,2,
		20,1,36,200,2,176,69,0,120,120,120,9,9,12,
		5,80,1,36,202,2,176,65,0,101,154,153,153,153,
		153,153,169,63,10,2,20,1,36,204,2,95,1,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDOSCROLV )
{
	static const HB_BYTE pcode[] =
	{
		13,5,5,116,105,0,36,210,2,176,75,0,176,76,
		0,12,0,12,1,80,6,36,212,2,176,10,0,103,
		16,0,106,6,87,105,100,116,104,0,12,2,92,21,
		49,80,7,36,215,2,121,80,8,36,216,2,121,80,
		9,36,217,2,4,0,0,80,10,36,219,2,95,3,
		100,8,28,5,9,25,4,95,3,80,3,36,220,2,
		95,2,100,8,28,5,120,25,4,95,2,80,2,36,
		221,2,95,4,100,8,28,5,120,25,4,95,4,80,
		4,36,222,2,95,5,100,8,28,5,120,25,4,95,
		5,80,5,36,227,2,95,1,29,72,1,36,228,2,
		95,3,31,103,36,230,2,176,75,0,176,76,0,12,
		0,12,1,80,6,36,231,2,176,77,0,103,31,0,
		122,72,95,6,12,2,80,10,36,233,2,176,78,0,
		120,176,29,0,12,0,95,2,95,10,122,1,95,10,
		92,2,1,20,5,36,234,2,104,17,0,95,10,122,
		1,135,36,236,2,176,43,0,20,0,36,237,2,95,
		10,122,1,82,39,0,36,238,2,176,79,0,95,10,
		122,1,20,1,26,9,3,36,244,2,103,19,0,28,
		70,36,245,2,95,5,28,56,36,246,2,176,80,0,
		176,81,0,106,39,78,227,111,32,104,225,32,77,97,
		105,115,32,84,101,108,97,32,112,97,114,97,32,82,
		111,108,97,114,32,97,32,68,105,114,101,105,116,97,
		46,0,12,1,20,1,36,248,2,92,255,110,7,36,
		251,2,176,82,0,120,12,1,80,9,36,252,2,176,
		83,0,95,9,92,5,12,2,80,6,36,253,2,9,
		82,20,0,36,0,3,176,84,0,12,0,121,8,28,
		12,36,1,3,96,6,0,109,85,0,135,36,18,3,
		176,43,0,20,0,36,19,3,176,65,0,101,123,20,
		174,71,225,122,148,63,10,2,20,1,36,21,3,176,
		86,0,120,95,6,95,4,95,2,20,4,36,22,3,
		176,84,0,12,0,176,76,0,12,0,72,176,5,0,
		12,0,16,82,19,0,36,24,3,176,65,0,101,123,
		20,174,71,225,122,148,63,10,2,20,1,26,48,2,
		36,28,3,95,3,32,247,0,36,30,3,103,31,0,
		121,8,28,83,36,31,3,176,80,0,176,81,0,106,
		59,67,111,108,117,110,97,32,109,97,105,115,32,97,
		32,69,115,113,117,101,114,100,97,32,65,116,105,110,
		103,105,100,97,46,78,227,111,32,201,32,112,111,115,
		115,105,118,101,108,32,82,101,116,114,111,99,101,100,
		101,114,46,0,12,1,20,1,36,32,3,92,255,110,
		7,36,35,3,176,87,0,103,17,0,12,1,80,8,
		36,37,3,104,17,0,95,8,136,36,39,3,176,43,
		0,20,0,36,40,3,176,65,0,101,123,20,174,71,
		225,122,164,63,10,2,20,1,36,41,3,176,78,0,
		9,176,29,0,12,0,66,95,2,95,8,122,20,5,
		36,43,3,176,79,0,95,8,20,1,36,45,3,103,
		31,0,121,8,28,17,36,46,3,121,82,17,0,36,
		47,3,176,73,0,20,0,36,50,3,122,165,83,88,
		0,25,24,36,51,3,176,68,0,109,88,0,20,1,
		36,50,3,109,88,0,23,21,83,88,0,93,255,0,
		15,28,230,36,54,3,176,89,0,20,0,26,52,1,
		36,58,3,103,20,0,28,73,36,59,3,95,5,28,
		59,36,60,3,176,80,0,176,81,0,106,42,78,227,
		111,32,104,97,32,109,97,105,115,32,69,83,112,97,
		231,111,32,112,97,114,97,32,82,111,108,97,114,32,
		97,32,69,115,113,117,101,114,100,97,46,0,12,1,
		20,1,36,62,3,92,255,110,7,36,66,3,176,82,
		0,9,12,1,80,9,36,67,3,176,84,0,12,0,
		176,83,0,95,9,92,2,12,2,49,92,5,72,80,
		6,36,69,3,4,0,0,80,10,36,70,3,176,90,
		0,95,10,95,6,20,2,36,71,3,176,90,0,95,
		10,122,20,2,36,73,3,176,43,0,20,0,36,74,
		3,176,65,0,101,184,30,133,235,81,184,158,63,10,
		2,20,1,36,76,3,176,86,0,9,95,6,95,4,
		95,2,20,4,36,77,3,9,82,19,0,36,78,3,
		176,43,0,20,0,36,80,3,176,84,0,12,0,121,
		8,28,16,36,81,3,176,91,0,106,4,111,107,50,
		0,20,1,36,86,3,95,9,122,8,82,20,0,36,
		88,3,103,20,0,28,62,36,89,3,176,84,0,12,
		0,83,92,0,36,93,3,109,92,0,121,69,73,36,
		97,3,176,86,0,9,109,92,0,95,4,95,2,20,
		4,36,99,3,176,43,0,20,0,36,101,3,176,73,
		0,20,0,36,102,3,176,93,0,20,0,36,116,3,
		95,6,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDOSCROLHROZ )
{
	static const HB_BYTE pcode[] =
	{
		13,0,4,36,121,3,176,43,0,20,0,36,122,3,
		176,94,0,95,1,9,95,2,95,3,20,4,36,126,
		3,95,4,28,47,36,127,3,176,84,0,12,0,121,
		69,28,35,36,128,3,176,50,0,95,1,31,10,176,
		29,0,12,0,66,25,7,176,29,0,12,0,20,1,
		36,129,3,176,42,0,20,0,36,134,3,176,95,0,
		20,0,36,135,3,176,43,0,20,0,36,138,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XROLETELA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,5,116,105,0,36,142,3,95,3,100,8,28,
		5,120,25,4,95,3,80,3,36,145,3,95,1,31,
		103,36,146,3,104,31,0,95,5,136,36,147,3,176,
		94,0,9,9,95,4,20,3,36,149,3,95,3,28,
		12,36,150,3,176,50,0,95,2,20,1,36,153,3,
		176,42,0,20,0,36,154,3,176,65,0,101,123,20,
		174,71,225,122,148,63,10,2,20,1,36,155,3,176,
		95,0,20,0,36,156,3,176,43,0,20,0,36,157,
		3,103,31,0,121,8,28,85,36,158,3,92,21,82,
		14,0,25,75,36,162,3,104,31,0,95,5,135,36,
		164,3,176,94,0,120,9,95,4,20,3,36,165,3,
		95,3,28,12,36,166,3,176,50,0,95,2,20,1,
		36,168,3,176,42,0,20,0,36,169,3,176,65,0,
		101,123,20,174,71,225,122,148,63,10,2,20,1,36,
		170,3,176,95,0,20,0,36,173,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YCHECKOBJ )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,183,3,176,97,0,176,21,0,109,14,
		0,12,1,12,1,31,88,109,14,0,106,8,66,114,
		111,119,115,101,114,0,69,28,72,36,186,3,176,31,
		0,103,1,0,12,1,28,59,36,187,3,103,12,0,
		31,13,36,188,3,176,70,0,103,1,0,20,1,36,
		190,3,176,65,0,101,123,20,174,71,225,122,148,63,
		10,2,20,1,36,192,3,176,98,0,103,25,0,20,
		1,36,193,3,176,43,0,20,0,36,202,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YRETACENDE )
{
	static const HB_BYTE pcode[] =
	{
		116,105,0,36,206,3,103,4,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YOFFBARRA )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,105,0,36,211,3,9,82,12,0,36,
		212,3,9,82,33,0,36,214,3,121,82,4,0,36,
		215,3,121,82,10,0,36,218,3,176,41,0,95,1,
		20,1,36,220,3,176,42,0,20,0,36,222,3,9,
		82,6,0,36,223,3,9,82,7,0,36,227,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YENABLE1BH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,105,0,36,232,3,95,1,82,15,0,
		36,234,3,95,1,31,13,36,235,3,176,70,0,103,
		1,0,20,1,36,238,3,176,43,0,20,0,36,240,
		3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YGETSCRXY )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,105,0,36,243,3,95,1,31,7,103,
		14,0,25,9,103,14,0,103,21,0,72,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( YDCBARH1 )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,105,0,36,247,3,176,51,0,103,1,
		0,12,1,80,1,36,248,3,176,52,0,103,1,0,
		12,1,80,2,36,253,3,122,80,7,36,254,3,121,
		80,8,36,255,3,92,45,80,9,36,3,4,176,51,
		0,103,2,0,12,1,80,10,36,4,4,176,52,0,
		103,2,0,12,1,80,11,36,6,4,176,53,0,103,
		1,0,92,3,96,4,0,12,3,80,3,36,7,4,
		176,53,0,103,2,0,92,3,96,6,0,12,3,80,
		5,36,10,4,103,15,0,31,32,36,11,4,176,102,
		0,95,5,121,121,95,10,95,11,93,245,0,121,95,
		3,121,121,95,1,95,2,20,12,25,27,36,13,4,
		176,103,0,95,5,121,121,95,10,95,11,121,95,3,
		121,121,95,1,95,2,20,11,36,18,4,176,57,0,
		95,4,20,1,36,19,4,176,57,0,95,6,20,1,
		36,21,4,176,41,0,103,2,0,20,1,36,23,4,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,105,0,46,0,116,105,0,106,1,0,82,1,0,
		106,1,0,82,2,0,121,82,3,0,121,82,4,0,
		92,18,82,5,0,9,82,6,0,9,82,7,0,120,
		82,8,0,92,18,82,9,0,121,82,10,0,121,82,
		11,0,9,82,12,0,121,82,13,0,92,19,82,14,
		0,120,82,15,0,106,1,0,82,16,0,121,82,17,
		0,121,82,18,0,9,82,19,0,9,82,20,0,121,
		82,21,0,121,82,22,0,121,82,23,0,9,82,24,
		0,106,1,0,82,25,0,121,82,26,0,121,82,27,
		0,121,82,28,0,121,82,29,0,121,82,30,0,121,
		82,31,0,122,82,32,0,9,82,33,0,9,82,34,
		0,121,82,35,0,4,0,0,82,36,0,9,82,37,
		0,121,82,38,0,121,82,39,0,121,82,40,0,7
	};

	hb_vmExecute( pcode, symbols );
}

