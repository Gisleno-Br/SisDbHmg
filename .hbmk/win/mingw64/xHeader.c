/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\xHeader.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XHEADER );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_EXTERN( RIGHT );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_STATIC( XPAINTHEADER );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( _DEFINELABEL );
HB_FUNC_EXTERN( EVENTCREATE );
HB_FUNC_EXTERN( GETCONTROLHANDLE );
HB_FUNC_EXTERN( EVENTPROCESSALLHOOKMESSAGE );
HB_FUNC_EXTERN( SETLAYEREDWINDOWATTRIBUTES );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC_STATIC( XMAPCOLS );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC( SETORDGRID );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC( XDCBARHEADER );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC( XGETHEADNAME );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_DRAWDCTODCALPHABLEND );
HB_FUNC_EXTERN( BT_DRAWDCTODC );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC( XLIMPMODE );
HB_FUNC_STATIC( XORDENE );
HB_FUNC_EXTERN( GETCAMPOSDIC );
HB_FUNC_EXTERN( GETCAMPOSINF );
HB_FUNC_EXTERN( XRETARRAY );
HB_FUNC_EXTERN( XRETTAMPG );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_STATIC( XATUDADOS );
HB_FUNC_EXTERN( XSHOWBRW );
HB_FUNC_EXTERN( XGOTOP );
HB_FUNC_EXTERN( XCURSORWAIT );
HB_FUNC( XFORMDT );
HB_FUNC_EXTERN( SUBSTR );
HB_FUNC_EXTERN( PADL );
HB_FUNC_EXTERN( CTOD );
HB_FUNC_EXTERN( TRANSFORM );
HB_FUNC_EXTERN( RTRANS );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( VAL );
HB_FUNC_EXTERN( QTACENTO );
HB_FUNC_EXTERN( PADR );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( ASORT );
HB_FUNC_EXTERN( SETARRAY );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( CALCETAPAS );
HB_FUNC_EXTERN( SETBARRATAM );
HB_FUNC( XGETCOLSEL );
HB_FUNC( XGETCOLQTD );
HB_FUNC( XGETCOLWIDTH );
HB_FUNC( XGETINFC );
HB_FUNC( XCOLMESQUERDA );
HB_FUNC( XCOLSVISIBLE );
HB_FUNC( XSELCOL );
HB_FUNC( EVENTHEADER );
HB_FUNC_EXTERN( EVENTHWND );
HB_FUNC_EXTERN( EVENTMSG );
HB_FUNC_EXTERN( EVENTWPARAM );
HB_FUNC_EXTERN( EVENTLPARAM );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC_EXTERN( GETASYNCKEYSTATE );
HB_FUNC( XRETUNIT );
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( INT );
HB_FUNC_EXTERN( GETACTIVEWINDOW );
HB_FUNC_EXTERN( SETCAMPOTAM );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( XLIMPBARV );
HB_FUNC_STATIC( XMOVEWIN );
HB_FUNC_EXTERN( MSGINFO );
HB_FUNC_STATIC( XSEARCHPOS );
HB_FUNC( XAPAGUEH );
HB_FUNC_STATIC( XSEARCHLIM );
HB_FUNC_EXTERN( XDOHINT );
HB_FUNC_EXTERN( XHIDEHINT );
HB_FUNC( XRETTOTAL );
HB_FUNC_EXTERN( HMG_CREATEFONT );
HB_FUNC_EXTERN( REPLICATE );
HB_FUNC_EXTERN( GETTEXTWIDTH );
HB_FUNC( UPDHEADER );
HB_FUNC_EXTERN( GETTEXTOTAM );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLVERTICAL );
HB_FUNC_EXTERN( BT_DRAWEDGE );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( PADC );
HB_FUNC_EXTERN( BT_DRAWTEXT );
HB_FUNC_EXTERN( HB_UTF8TOSTR );
HB_FUNC_EXTERN( BT_DRAWBITMAPTRANSPARENT );
HB_FUNC_EXTERN( BT_BITMAPRELEASE );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XHEADER )
{ "XHEADER", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XHEADER )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "RIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( RIGHT )}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "XPAINTHEADER", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTHEADER )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "_DEFINELABEL", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINELABEL )}, NULL },
{ "EVENTCREATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTCREATE )}, NULL },
{ "GETCONTROLHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCONTROLHANDLE )}, NULL },
{ "EVENTPROCESSALLHOOKMESSAGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTPROCESSALLHOOKMESSAGE )}, NULL },
{ "SETLAYEREDWINDOWATTRIBUTES", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETLAYEREDWINDOWATTRIBUTES )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "XMAPCOLS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XMAPCOLS )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "SETORDGRID", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( SETORDGRID )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "XDCBARHEADER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XDCBARHEADER )}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "XGETHEADNAME", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETHEADNAME )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_DRAWDCTODCALPHABLEND", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODCALPHABLEND )}, NULL },
{ "BT_DRAWDCTODC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWDCTODC )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "XLIMPMODE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XLIMPMODE )}, NULL },
{ "XORDENE", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XORDENE )}, NULL },
{ "GETCAMPOSDIC", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCAMPOSDIC )}, NULL },
{ "CTABELA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETCAMPOSINF", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCAMPOSINF )}, NULL },
{ "XRETARRAY", {HB_FS_PUBLIC}, {HB_FUNCNAME( XRETARRAY )}, NULL },
{ "XRETTAMPG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XRETTAMPG )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "XATUDADOS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XATUDADOS )}, NULL },
{ "XSHOWBRW", {HB_FS_PUBLIC}, {HB_FUNCNAME( XSHOWBRW )}, NULL },
{ "XGOTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGOTOP )}, NULL },
{ "XCURSORWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XCURSORWAIT )}, NULL },
{ "XFORMDT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XFORMDT )}, NULL },
{ "SUBSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SUBSTR )}, NULL },
{ "N1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "PADL", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADL )}, NULL },
{ "CTOD", {HB_FS_PUBLIC}, {HB_FUNCNAME( CTOD )}, NULL },
{ "LNUM", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "TRANSFORM", {HB_FS_PUBLIC}, {HB_FUNCNAME( TRANSFORM )}, NULL },
{ "RTRANS", {HB_FS_PUBLIC}, {HB_FUNCNAME( RTRANS )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "VAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( VAL )}, NULL },
{ "QTACENTO", {HB_FS_PUBLIC}, {HB_FUNCNAME( QTACENTO )}, NULL },
{ "PADR", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADR )}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "ASORT", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASORT )}, NULL },
{ "SETARRAY", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETARRAY )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "CALCETAPAS", {HB_FS_PUBLIC}, {HB_FUNCNAME( CALCETAPAS )}, NULL },
{ "NCONST1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "NTAMBAR1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SETBARRATAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETBARRATAM )}, NULL },
{ "XGETCOLSEL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETCOLSEL )}, NULL },
{ "XGETCOLQTD", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETCOLQTD )}, NULL },
{ "XGETCOLWIDTH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETCOLWIDTH )}, NULL },
{ "XGETINFC", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETINFC )}, NULL },
{ "XCOLMESQUERDA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCOLMESQUERDA )}, NULL },
{ "XCOLSVISIBLE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCOLSVISIBLE )}, NULL },
{ "XSELCOL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSELCOL )}, NULL },
{ "EVENTHEADER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTHEADER )}, NULL },
{ "EVENTHWND", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTHWND )}, NULL },
{ "EVENTMSG", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTMSG )}, NULL },
{ "EVENTWPARAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTWPARAM )}, NULL },
{ "EVENTLPARAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( EVENTLPARAM )}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "GETASYNCKEYSTATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETASYNCKEYSTATE )}, NULL },
{ "XRETUNIT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETUNIT )}, NULL },
{ "NUNIT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "GETACTIVEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETACTIVEWINDOW )}, NULL },
{ "SETCAMPOTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETCAMPOTAM )}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "XLIMPBARV", {HB_FS_PUBLIC}, {HB_FUNCNAME( XLIMPBARV )}, NULL },
{ "XMOVEWIN", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XMOVEWIN )}, NULL },
{ "MSGINFO", {HB_FS_PUBLIC}, {HB_FUNCNAME( MSGINFO )}, NULL },
{ "XSEARCHPOS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSEARCHPOS )}, NULL },
{ "XAPAGUEH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XAPAGUEH )}, NULL },
{ "XSEARCHLIM", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSEARCHLIM )}, NULL },
{ "XDOHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDOHINT )}, NULL },
{ "XHIDEHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XHIDEHINT )}, NULL },
{ "N3", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XRETTOTAL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETTOTAL )}, NULL },
{ "HDC", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HMG_CREATEFONT", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CREATEFONT )}, NULL },
{ "FONTBROWSER", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "FONTBROWSERSIZE", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HFONT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "REPLICATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( REPLICATE )}, NULL },
{ "CTEXTO", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETTEXTWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETTEXTWIDTH )}, NULL },
{ "N12", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "UPDHEADER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( UPDHEADER )}, NULL },
{ "GETTEXTOTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETTEXTOTAM )}, NULL },
{ "CACTIVEJAN", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_DRAWGRADIENTFILLVERTICAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLVERTICAL )}, NULL },
{ "BT_DRAWEDGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWEDGE )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "PADC", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADC )}, NULL },
{ "BT_DRAWTEXT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWTEXT )}, NULL },
{ "HB_UTF8TOSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_UTF8TOSTR )}, NULL },
{ "BT_DRAWBITMAPTRANSPARENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAPTRANSPARENT )}, NULL },
{ "NCOLX1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "NCOLX2", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_BITMAPRELEASE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPRELEASE )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00028)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_XHEADER, "Prg\\xHeader.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_XHEADER
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_XHEADER )
   #include "hbiniseg.h"
#endif

HB_FUNC( XHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,4,9,116,121,0,36,100,0,176,1,0,95,5,
		106,4,82,111,119,0,12,2,80,10,36,101,0,176,
		1,0,95,5,106,4,67,111,108,0,12,2,80,11,
		36,102,0,176,1,0,95,5,106,6,87,105,100,116,
		104,0,12,2,80,12,36,106,0,95,9,100,8,28,
		5,120,25,4,95,9,80,9,36,108,0,95,9,82,
		13,0,36,110,0,95,1,82,2,0,36,112,0,106,
		8,102,83,111,109,98,114,97,0,176,2,0,103,2,
		0,92,3,12,2,72,82,3,0,36,114,0,95,3,
		82,5,0,36,115,0,95,7,82,6,0,36,116,0,
		95,2,82,7,0,36,118,0,95,5,82,14,0,36,
		120,0,95,8,82,12,0,36,131,0,176,3,0,20,
		0,176,4,0,95,1,106,9,120,72,101,97,100,101,
		114,49,0,176,5,0,95,1,92,4,12,2,72,95,
		11,95,10,92,92,49,95,12,122,72,92,30,9,9,
		120,120,120,9,106,1,0,100,100,100,100,100,100,93,
		255,0,93,255,0,93,255,0,4,3,0,90,36,176,
		6,0,176,1,0,98,7,0,93,60,1,1,106,5,
		78,97,109,101,0,12,2,103,7,0,103,5,0,103,
		6,0,12,4,6,9,9,9,100,120,100,100,100,100,
		100,100,100,100,95,6,121,15,28,6,95,6,25,6,
		95,12,122,72,100,100,100,100,100,100,9,100,100,100,
		9,100,100,100,100,100,100,100,100,95,4,120,20,56,
		36,132,0,176,8,0,20,0,36,142,0,176,3,0,
		20,0,176,4,0,103,3,0,106,15,120,72,101,97,
		100,101,114,83,111,109,98,114,97,49,0,176,5,0,
		95,1,92,4,12,2,72,95,11,95,10,92,92,49,
		95,12,122,72,92,30,9,9,120,120,120,9,106,1,
		0,100,100,100,100,100,100,97,242,242,242,0,100,9,
		9,9,100,120,100,100,100,100,100,100,100,100,100,100,
		100,100,100,100,100,9,100,100,100,9,100,100,100,100,
		100,100,100,100,95,4,120,20,56,36,145,0,106,7,
		76,97,98,101,108,50,0,98,7,0,93,160,1,2,
		100,98,7,0,93,161,1,2,100,98,7,0,93,176,
		1,2,100,98,7,0,93,175,1,2,100,98,7,0,
		93,178,1,2,100,98,7,0,93,164,1,2,100,98,
		7,0,93,165,1,2,100,98,7,0,93,166,1,2,
		100,98,7,0,93,167,1,2,9,98,7,0,93,203,
		1,2,9,98,7,0,93,204,1,2,9,98,7,0,
		93,205,1,2,9,98,7,0,93,206,1,2,9,98,
		7,0,93,207,1,2,100,98,7,0,93,201,1,2,
		100,98,7,0,93,202,1,2,100,98,7,0,93,163,
		1,2,100,98,7,0,93,173,1,2,9,98,7,0,
		93,174,1,2,9,98,7,0,93,156,1,2,9,98,
		7,0,93,157,1,2,9,98,7,0,93,158,1,2,
		9,98,7,0,93,159,1,2,100,98,7,0,93,168,
		1,2,9,98,7,0,93,184,1,2,9,98,7,0,
		93,153,1,2,9,98,7,0,93,137,1,2,9,98,
		7,0,93,25,1,2,9,98,7,0,93,131,1,2,
		36,146,0,121,98,7,0,93,175,1,2,36,147,0,
		121,98,7,0,93,176,1,2,36,148,0,95,12,122,
		72,98,7,0,93,164,1,2,36,149,0,92,30,98,
		7,0,93,165,1,2,36,150,0,106,2,32,0,98,
		7,0,93,178,1,2,36,151,0,106,6,65,114,105,
		97,108,0,98,7,0,93,166,1,2,36,152,0,92,
		9,98,7,0,93,167,1,2,36,153,0,106,1,0,
		98,7,0,93,168,1,2,36,154,0,9,98,7,0,
		93,156,1,2,36,155,0,9,98,7,0,93,157,1,
		2,36,156,0,9,98,7,0,93,159,1,2,36,157,
		0,9,98,7,0,93,158,1,2,36,158,0,100,98,
		7,0,93,173,1,2,36,159,0,9,98,7,0,93,
		174,1,2,36,160,0,120,98,7,0,93,207,1,2,
		36,161,0,90,4,100,6,98,7,0,93,163,1,2,
		36,162,0,9,98,7,0,93,153,1,2,36,163,0,
		100,98,7,0,93,201,1,2,36,164,0,100,98,7,
		0,93,202,1,2,36,165,0,176,9,0,98,7,0,
		93,160,1,1,98,7,0,93,161,1,1,98,7,0,
		93,176,1,1,98,7,0,93,175,1,1,98,7,0,
		93,178,1,1,98,7,0,93,164,1,1,98,7,0,
		93,165,1,1,98,7,0,93,166,1,1,98,7,0,
		93,167,1,1,98,7,0,93,156,1,1,98,7,0,
		93,203,1,1,98,7,0,93,204,1,1,98,7,0,
		93,205,1,1,98,7,0,93,206,1,1,98,7,0,
		93,207,1,1,98,7,0,93,201,1,1,98,7,0,
		93,202,1,1,98,7,0,93,163,1,1,98,7,0,
		93,168,1,1,98,7,0,93,173,1,1,98,7,0,
		93,174,1,1,98,7,0,93,157,1,1,98,7,0,
		93,159,1,1,98,7,0,93,158,1,1,98,7,0,
		93,153,1,1,98,7,0,93,184,1,1,98,7,0,
		93,137,1,1,98,7,0,93,25,1,1,98,7,0,
		93,131,1,1,20,29,36,170,0,176,8,0,20,0,
		36,172,0,176,10,0,106,14,69,118,101,110,116,72,
		101,97,100,101,114,40,41,0,176,11,0,106,7,76,
		97,98,101,108,50,0,103,3,0,12,2,100,12,3,
		80,13,36,173,0,176,12,0,95,13,120,20,2,36,
		175,0,176,13,0,176,14,0,95,1,12,1,121,103,
		13,0,31,7,93,167,0,25,3,121,92,2,20,4,
		36,178,0,103,13,0,28,60,36,180,0,176,15,0,
		103,7,0,103,5,0,103,6,0,20,3,36,182,0,
		176,16,0,98,7,0,92,60,1,176,17,0,176,18,
		0,106,12,69,118,101,110,116,72,101,97,100,101,114,
		0,12,1,12,1,12,2,121,5,73,36,190,0,120,
		110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( SETORDGRID )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,121,0,36,196,0,95,1,82,20,0,
		36,197,0,95,2,82,21,0,36,199,0,176,20,0,
		103,2,0,20,1,36,201,0,176,21,0,20,0,36,
		202,0,176,22,0,20,0,36,204,0,176,23,0,101,
		123,20,174,71,225,122,148,63,10,2,20,1,36,207,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETHEADNAME )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,121,0,36,213,0,95,1,122,5,28,
		7,103,2,0,25,5,103,3,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XDCBARHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,11,0,116,121,0,36,217,0,176,25,0,103,2,
		0,12,1,80,1,36,218,0,176,26,0,103,2,0,
		12,1,80,2,36,223,0,122,80,7,36,224,0,121,
		80,8,36,225,0,92,45,80,9,36,229,0,176,25,
		0,103,3,0,12,1,80,10,36,230,0,176,26,0,
		103,3,0,12,1,80,11,36,232,0,176,27,0,103,
		2,0,92,3,96,4,0,12,3,80,3,36,233,0,
		176,27,0,103,3,0,92,3,96,6,0,12,3,80,
		5,36,236,0,103,13,0,31,31,36,237,0,176,28,
		0,95,5,121,121,95,10,95,11,92,5,121,95,3,
		121,121,95,1,95,2,20,12,25,27,36,239,0,176,
		29,0,95,5,121,121,95,10,95,11,121,95,3,121,
		121,95,1,95,2,20,11,36,248,0,176,30,0,95,
		4,20,1,36,249,0,176,30,0,95,6,20,1,36,
		251,0,176,20,0,103,3,0,20,1,36,253,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XLIMPMODE )
{
	static const HB_BYTE pcode[] =
	{
		116,121,0,36,3,1,9,82,11,0,36,4,1,9,
		82,23,0,36,5,1,121,82,8,0,36,6,1,121,
		82,9,0,36,8,1,9,82,15,0,36,10,1,9,
		82,10,0,36,12,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XORDENE )
{
	static const HB_BYTE pcode[] =
	{
		13,14,2,116,121,0,36,16,1,176,33,0,109,34,
		0,106,2,83,0,120,120,12,4,80,3,36,17,1,
		176,33,0,109,34,0,106,2,83,0,9,9,12,4,
		80,4,36,18,1,176,35,0,109,34,0,106,5,84,
		73,80,79,0,12,2,80,5,36,19,1,176,36,0,
		12,0,80,6,36,20,1,103,4,0,95,1,1,80,
		7,36,23,1,4,0,0,80,10,36,26,1,176,37,
		0,12,0,80,12,36,27,1,122,80,13,36,28,1,
		121,80,14,36,30,1,4,0,0,80,15,36,31,1,
		4,0,0,80,16,36,34,1,95,7,92,7,1,80,
		8,36,35,1,95,7,92,6,1,80,9,36,36,1,
		176,17,0,95,7,92,4,1,12,1,80,11,36,38,
		1,176,38,0,176,14,0,103,2,0,12,1,106,8,
		67,85,82,83,79,82,49,0,20,2,36,47,1,176,
		21,0,20,0,36,121,1,176,39,0,95,1,95,2,
		103,5,0,20,3,36,123,1,176,21,0,20,0,36,
		128,1,176,40,0,109,34,0,120,20,2,36,129,1,
		176,41,0,20,0,36,131,1,176,42,0,9,20,1,
		36,134,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XFORMDT )
{
	static const HB_BYTE pcode[] =
	{
		13,1,3,36,138,1,176,17,0,176,5,0,176,17,
		0,176,44,0,95,1,95,2,95,3,12,3,12,1,
		92,10,12,2,12,1,80,4,36,141,1,176,2,0,
		95,4,92,4,12,2,176,44,0,95,4,92,4,92,
		2,12,3,72,176,5,0,95,4,92,2,12,2,72,
		110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XATUDADOS )
{
	static const HB_BYTE pcode[] =
	{
		13,22,3,116,121,0,36,147,1,176,33,0,109,34,
		0,106,2,83,0,120,120,12,4,80,4,36,148,1,
		176,33,0,109,34,0,106,2,83,0,9,9,12,4,
		80,5,36,150,1,176,35,0,109,34,0,106,5,84,
		73,80,79,0,12,2,80,6,36,152,1,176,36,0,
		12,0,80,8,36,153,1,106,1,0,80,9,36,155,
		1,4,0,0,80,10,36,156,1,121,80,11,36,161,
		1,106,1,0,80,16,36,162,1,106,1,0,80,17,
		36,163,1,122,80,18,36,164,1,106,1,0,80,19,
		36,165,1,106,1,0,80,20,36,167,1,9,80,22,
		36,169,1,121,80,23,36,170,1,106,1,0,80,24,
		36,171,1,4,0,0,80,25,36,174,1,95,1,100,
		8,28,5,121,25,4,95,1,80,1,36,175,1,95,
		2,100,8,28,5,9,25,4,95,2,80,2,36,179,
		1,122,165,80,18,26,80,2,36,181,1,95,8,95,
		18,1,92,4,1,80,7,36,182,1,4,0,0,80,
		10,36,184,1,95,8,95,18,1,92,2,1,80,14,
		36,185,1,95,8,95,18,1,92,3,1,80,15,36,
		186,1,106,1,0,80,9,36,188,1,106,1,0,80,
		20,36,190,1,122,165,83,45,0,26,214,1,36,192,
		1,106,1,0,80,16,36,194,1,95,7,109,45,0,
		1,122,1,80,16,36,196,1,95,16,80,24,36,198,
		1,176,17,0,95,6,109,45,0,1,12,1,106,2,
		68,0,8,28,39,36,199,1,176,46,0,95,7,109,
		45,0,1,122,1,92,15,12,2,80,16,36,200,1,
		176,47,0,176,17,0,95,16,12,1,12,1,80,24,
		36,203,1,9,83,48,0,36,205,1,176,17,0,95,
		6,109,45,0,1,12,1,106,2,66,0,8,28,66,
		36,206,1,176,17,0,176,49,0,176,50,0,95,7,
		109,45,0,1,122,1,12,1,106,15,57,57,57,44,
		57,57,57,44,57,57,57,46,57,57,0,12,2,12,
		1,80,16,36,207,1,176,50,0,95,16,12,1,80,
		24,36,208,1,120,83,48,0,36,211,1,176,17,0,
		95,6,109,45,0,1,12,1,106,2,73,0,8,28,
		113,36,212,1,109,45,0,122,15,28,57,36,213,1,
		176,17,0,176,51,0,176,52,0,95,7,109,45,0,
		1,122,1,12,1,12,1,12,1,80,16,36,214,1,
		176,52,0,95,7,109,45,0,1,122,1,12,1,80,
		24,36,215,1,120,83,48,0,25,48,36,217,1,176,
		17,0,176,51,0,176,52,0,95,7,109,45,0,1,
		122,1,12,1,12,1,12,1,80,16,36,218,1,176,
		52,0,95,7,109,45,0,1,122,1,12,1,80,24,
		36,222,1,95,3,109,45,0,1,80,13,36,223,1,
		176,53,0,95,16,12,1,80,11,36,225,1,95,11,
		121,5,28,6,95,13,25,7,95,13,95,11,72,80,
		12,36,227,1,95,18,122,8,28,11,36,228,1,96,
		23,0,95,12,135,36,231,1,96,9,0,176,54,0,
		95,16,95,12,12,2,106,2,32,0,72,135,36,234,
		1,95,1,121,15,28,20,36,235,1,95,1,109,45,
		0,5,28,9,36,236,1,95,24,80,20,36,241,1,
		176,55,0,95,10,95,16,95,7,109,45,0,1,92,
		2,1,109,45,0,95,12,4,4,0,20,2,36,243,
		1,176,21,0,20,0,36,190,1,109,45,0,23,21,
		83,45,0,176,56,0,95,4,12,1,15,29,37,254,
		36,247,1,176,21,0,20,0,36,248,1,176,55,0,
		95,25,95,9,95,14,95,15,95,10,95,20,4,5,
		0,20,2,36,179,1,175,18,0,176,56,0,95,8,
		12,1,15,29,171,253,36,253,1,95,1,121,15,28,
		77,36,254,1,95,2,28,37,36,255,1,176,57,0,
		95,25,100,100,89,19,0,2,0,0,0,95,1,92,
		5,1,95,2,92,5,1,35,6,12,4,80,25,25,
		35,36,1,2,176,57,0,95,25,100,100,89,19,0,
		2,0,0,0,95,1,92,5,1,95,2,92,5,1,
		15,6,12,4,80,25,36,5,2,176,21,0,20,0,
		36,6,2,176,58,0,95,25,20,1,36,10,2,176,
		21,0,20,0,36,12,2,176,59,0,103,14,0,12,
		1,28,90,36,14,2,176,15,0,95,5,95,3,95,
		6,12,3,80,23,36,18,2,176,60,0,12,0,80,
		21,36,20,2,176,1,0,103,14,0,106,6,87,105,
		100,116,104,0,12,2,95,21,109,61,0,65,49,83,
		62,0,36,21,2,176,63,0,109,62,0,95,21,20,
		2,36,23,2,176,40,0,109,34,0,120,20,2,36,
		24,2,176,41,0,20,0,36,30,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETCOLSEL )
{
	static const HB_BYTE pcode[] =
	{
		116,121,0,36,34,2,103,22,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETCOLQTD )
{
	static const HB_BYTE pcode[] =
	{
		116,121,0,36,38,2,176,56,0,103,4,0,20,1,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETCOLWIDTH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,121,0,36,43,2,103,4,0,95,1,
		1,92,5,1,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETINFC )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,121,0,36,46,2,103,4,0,95,1,
		1,95,2,1,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCOLMESQUERDA )
{
	static const HB_BYTE pcode[] =
	{
		13,6,1,36,51,2,122,80,2,36,56,2,176,65,
		0,12,0,80,7,36,61,2,176,66,0,95,2,12,
		1,80,3,36,62,2,176,67,0,95,2,92,2,12,
		2,80,4,36,63,2,176,67,0,95,2,92,3,12,
		2,80,5,36,65,2,95,5,95,1,16,80,6,36,
		67,2,95,6,31,17,95,2,95,7,5,31,10,36,
		71,2,174,2,0,25,186,36,78,2,95,2,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCOLSVISIBLE )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,121,0,36,83,2,4,0,0,80,2,
		36,84,2,121,80,3,36,86,2,122,165,80,3,25,
		40,36,88,2,103,4,0,95,3,1,92,3,1,95,
		1,92,3,72,34,28,14,36,89,2,176,55,0,95,
		2,95,3,20,2,36,86,2,175,3,0,176,56,0,
		103,4,0,12,1,15,28,209,36,97,2,95,2,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSELCOL )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,121,0,36,101,2,95,1,82,22,0,
		36,102,2,176,20,0,103,2,0,20,1,36,104,2,
		176,21,0,20,0,36,105,2,176,22,0,20,0,36,
		107,2,176,23,0,101,123,20,174,71,225,122,148,63,
		10,2,20,1,36,113,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,16,0,116,121,0,36,120,2,9,80,2,36,123,
		2,4,0,0,80,5,36,126,2,176,1,0,103,2,
		0,106,7,72,101,105,103,104,116,0,12,2,80,7,
		36,127,2,121,80,8,36,130,2,176,72,0,12,0,
		80,10,36,131,2,176,73,0,12,0,80,11,36,132,
		2,176,74,0,12,0,80,12,36,133,2,176,75,0,
		12,0,80,13,36,135,2,121,80,14,36,140,2,121,
		80,15,36,141,2,121,80,16,36,144,2,176,59,0,
		103,2,0,12,1,31,6,36,145,2,7,36,156,2,
		95,10,176,1,0,103,3,0,106,7,72,65,78,68,
		76,69,0,12,2,8,73,36,161,2,95,10,176,11,
		0,106,7,76,97,98,101,108,50,0,103,3,0,12,
		2,8,29,221,6,36,165,2,95,11,93,3,2,8,
		28,82,36,167,2,103,8,0,82,22,0,36,169,2,
		103,21,0,68,82,21,0,36,170,2,103,22,0,82,
		20,0,36,173,2,176,20,0,103,2,0,20,1,36,
		174,2,176,23,0,101,123,20,174,71,225,122,132,63,
		10,2,20,1,36,175,2,176,22,0,20,0,36,177,
		2,176,32,0,103,20,0,103,21,0,20,2,36,182,
		2,95,11,93,1,2,8,29,191,2,36,184,2,176,
		21,0,20,0,36,186,2,103,8,0,82,22,0,36,
		188,2,176,20,0,103,2,0,20,1,36,189,2,176,
		23,0,101,123,20,174,71,225,122,148,63,10,2,20,
		1,36,190,2,176,22,0,20,0,36,192,2,176,76,
		0,96,15,0,96,1,0,20,2,36,193,2,176,77,
		0,95,10,95,1,95,15,12,3,80,4,36,194,2,
		95,4,92,2,1,80,3,36,196,2,95,3,82,25,
		0,36,198,2,103,11,0,29,79,2,36,200,2,122,
		165,80,9,25,18,36,201,2,176,78,0,95,9,20,
		1,36,200,2,175,9,0,93,255,0,15,28,236,36,
		204,2,120,82,15,0,36,206,2,103,8,0,80,16,
		36,207,2,176,79,0,12,0,83,80,0,36,208,2,
		9,80,2,36,213,2,176,78,0,122,12,1,121,8,
		32,28,1,36,217,2,120,82,15,0,36,219,2,176,
		76,0,96,15,0,96,1,0,20,2,36,220,2,176,
		77,0,95,10,95,1,95,15,12,3,80,4,36,221,
		2,95,4,92,2,1,80,8,36,223,2,95,16,82,
		16,0,36,226,2,176,81,0,95,8,95,3,49,12,
		1,109,80,0,16,29,187,0,36,228,2,95,8,95,
		3,15,28,56,36,229,2,103,4,0,95,16,1,92,
		5,148,176,81,0,95,8,95,3,49,12,1,135,36,
		230,2,103,5,0,95,16,148,176,82,0,176,81,0,
		95,8,95,3,49,12,1,109,80,0,18,12,1,135,
		25,54,36,232,2,103,4,0,95,16,1,92,5,148,
		176,81,0,95,8,95,3,49,12,1,136,36,233,2,
		103,5,0,95,16,148,176,82,0,176,81,0,95,8,
		95,3,49,12,1,109,80,0,18,12,1,136,36,236,
		2,176,15,0,103,7,0,103,5,0,103,6,0,20,
		3,36,238,2,176,20,0,103,2,0,20,1,36,239,
		2,176,22,0,20,0,36,241,2,176,23,0,101,154,
		153,153,153,153,153,169,63,10,2,20,1,36,243,2,
		120,80,2,36,244,2,95,8,80,3,36,248,2,176,
		23,0,101,123,20,174,71,225,122,148,63,10,2,20,
		1,26,220,254,36,252,2,95,2,29,211,0,36,255,
		2,176,38,0,176,83,0,12,0,106,8,67,85,82,
		83,79,82,49,0,20,2,36,1,3,176,21,0,20,
		0,36,3,3,176,15,0,103,7,0,103,5,0,103,
		6,0,20,3,36,5,3,176,84,0,109,34,0,176,
		17,0,103,7,0,95,16,1,12,1,103,5,0,95,
		16,1,12,3,31,58,36,6,3,176,85,0,176,86,
		0,106,41,78,227,111,32,70,111,105,32,80,111,115,
		115,105,118,101,108,32,65,116,117,97,108,105,122,97,
		114,32,111,32,68,105,99,105,111,110,97,114,105,111,
		46,0,12,1,20,1,36,11,3,176,20,0,103,2,
		0,20,1,36,13,3,176,22,0,20,0,36,14,3,
		176,21,0,20,0,36,16,3,176,39,0,92,3,120,
		103,5,0,20,3,36,18,3,176,38,0,176,83,0,
		12,0,106,10,73,68,67,95,65,82,82,79,87,0,
		20,2,36,20,3,176,21,0,20,0,36,25,3,9,
		82,11,0,36,26,3,9,82,15,0,36,47,3,95,
		11,93,2,2,8,28,30,36,49,3,9,82,11,0,
		36,50,3,9,82,23,0,36,51,3,9,82,15,0,
		36,53,3,121,82,25,0,36,59,3,95,11,93,0,
		2,8,29,135,3,36,64,3,176,87,0,20,0,36,
		65,3,176,23,0,101,123,20,174,71,225,122,132,63,
		10,2,20,1,36,67,3,122,165,80,9,25,18,36,
		68,3,176,78,0,95,9,20,1,36,67,3,175,9,
		0,93,255,0,15,28,236,36,71,3,106,1,0,82,
		18,0,36,72,3,106,1,0,82,19,0,36,75,3,
		176,76,0,96,15,0,96,1,0,20,2,36,76,3,
		176,77,0,95,10,95,1,95,15,12,3,80,4,36,
		77,3,95,4,92,2,1,80,3,36,80,3,103,25,
		0,121,15,29,239,0,36,82,3,95,3,103,25,0,
		49,92,2,15,29,224,0,36,83,3,120,82,23,0,
		36,85,3,95,3,82,25,0,36,87,3,103,23,0,
		29,184,0,36,89,3,122,165,80,9,25,18,36,90,
		3,176,78,0,95,9,20,1,36,89,3,175,9,0,
		93,255,0,15,28,236,36,93,3,176,78,0,122,12,
		1,121,8,28,37,36,94,3,9,82,23,0,36,95,
		3,121,82,25,0,36,96,3,121,82,26,0,36,97,
		3,121,82,27,0,36,98,3,121,82,28,0,36,101,
		3,176,76,0,96,15,0,96,1,0,20,2,36,102,
		3,176,77,0,95,10,95,1,95,15,12,3,80,4,
		36,103,3,95,4,92,2,1,80,14,36,105,3,95,
		14,103,25,0,69,29,119,255,36,108,3,95,14,103,
		25,0,15,28,11,36,109,3,104,28,0,170,25,9,
		36,111,3,104,28,0,169,36,114,3,176,88,0,103,
		22,0,122,20,2,36,116,3,95,14,82,25,0,26,
		69,255,36,128,3,176,89,0,106,6,111,107,50,51,
		51,0,20,1,36,137,3,176,21,0,20,0,36,139,
		3,176,78,0,122,12,1,121,8,31,6,36,140,3,
		7,36,143,3,176,38,0,95,10,93,0,127,20,2,
		36,144,3,176,90,0,95,3,12,1,80,5,36,146,
		3,176,56,0,95,5,12,1,121,5,28,54,36,147,
		3,9,82,11,0,36,148,3,9,82,23,0,36,149,
		3,9,82,15,0,36,150,3,176,91,0,103,2,0,
		20,1,36,151,3,176,22,0,20,0,36,152,3,176,
		21,0,20,0,36,153,3,7,36,159,3,176,92,0,
		95,3,12,1,165,80,8,121,15,28,107,36,160,3,
		176,93,0,100,106,23,82,101,100,105,109,101,110,115,
		105,111,110,97,32,97,32,67,111,108,117,110,97,32,
		0,176,17,0,103,4,0,95,8,1,122,1,12,1,
		72,106,3,32,32,0,72,176,51,0,103,8,0,12,
		1,72,20,2,36,161,3,176,38,0,95,10,106,11,
		67,85,82,83,79,82,83,73,90,69,0,20,2,36,
		162,3,176,21,0,20,0,36,163,3,120,82,11,0,
		36,164,3,7,36,167,3,176,59,0,106,8,87,105,
		110,95,77,115,103,0,12,1,28,10,36,168,3,176,
		94,0,20,0,36,171,3,9,82,11,0,36,172,3,
		176,38,0,95,10,93,0,127,20,2,36,176,3,103,
		9,0,95,5,122,1,92,2,1,69,28,116,103,9,
		0,121,15,28,109,103,9,0,176,56,0,103,4,0,
		12,1,34,28,95,36,178,3,121,82,8,0,36,179,
		3,103,4,0,103,9,0,1,92,2,1,80,6,36,
		180,3,103,4,0,103,9,0,1,92,5,1,83,95,
		0,36,183,3,176,20,0,103,2,0,20,1,36,184,
		3,95,5,122,1,92,2,1,82,9,0,36,185,3,
		9,82,10,0,36,186,3,176,21,0,20,0,36,187,
		3,176,22,0,20,0,36,188,3,176,21,0,20,0,
		36,194,3,176,56,0,95,5,12,1,121,15,28,109,
		36,196,3,103,10,0,31,101,36,197,3,95,5,122,
		1,92,2,1,82,8,0,36,198,3,95,5,122,1,
		92,2,1,82,9,0,36,199,3,103,4,0,103,8,
		0,1,92,2,1,80,6,36,200,3,103,4,0,103,
		8,0,1,92,5,1,83,95,0,36,201,3,176,20,
		0,103,2,0,20,1,36,202,3,176,21,0,20,0,
		36,203,3,176,22,0,20,0,36,205,3,176,21,0,
		20,0,36,207,3,120,82,10,0,36,218,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XMOVEWIN )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,121,0,36,224,3,95,1,82,26,0,
		36,225,3,95,2,82,27,0,36,229,3,176,20,0,
		103,2,0,20,1,36,231,3,176,21,0,20,0,36,
		232,3,176,22,0,20,0,36,233,3,176,21,0,20,
		0,36,235,3,176,21,0,20,0,36,239,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XAPAGUEH )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,116,121,0,36,248,3,176,1,0,95,1,
		106,7,72,101,105,103,104,116,0,12,2,80,4,36,
		251,3,103,8,0,121,15,28,91,36,253,3,9,82,
		10,0,36,2,4,103,4,0,103,8,0,1,92,2,
		1,80,2,36,3,4,103,4,0,103,8,0,1,92,
		5,1,80,3,36,4,4,121,82,8,0,36,5,4,
		176,56,0,103,4,0,12,1,122,49,82,9,0,36,
		6,4,176,20,0,95,1,20,1,36,7,4,176,23,
		0,101,123,20,174,71,225,122,148,63,10,2,20,1,
		36,13,4,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETTOTAL )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,121,0,36,19,4,121,80,2,36,20,
		4,121,80,3,36,22,4,122,165,80,2,25,34,36,
		24,4,95,2,95,1,34,28,18,36,25,4,96,3,
		0,103,4,0,95,2,1,92,5,1,135,36,22,4,
		175,2,0,176,56,0,103,4,0,12,1,15,28,215,
		36,32,4,95,3,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XMAPCOLS )
{
	static const HB_BYTE pcode[] =
	{
		13,9,3,116,121,0,36,36,4,121,80,4,36,37,
		4,122,80,5,36,38,4,92,17,80,6,36,43,4,
		121,80,11,36,44,4,122,80,12,36,47,4,176,27,
		0,103,2,0,92,4,96,9,0,12,3,83,97,0,
		36,48,4,176,98,0,109,97,0,109,99,0,109,100,
		0,9,9,9,9,12,7,83,101,0,36,50,4,4,
		0,0,82,4,0,36,52,4,122,165,83,45,0,26,
		191,0,36,54,4,95,2,109,45,0,1,80,7,36,
		56,4,176,53,0,176,17,0,95,1,109,45,0,1,
		12,1,12,1,80,10,36,57,4,95,10,121,5,28,
		6,95,7,25,7,95,7,95,10,72,80,8,36,60,
		4,176,102,0,106,2,65,0,95,7,122,72,12,2,
		83,103,0,36,61,4,176,104,0,109,97,0,109,103,
		0,109,101,0,12,3,83,105,0,36,62,4,109,105,
		0,80,8,36,64,4,176,55,0,103,4,0,95,1,
		109,45,0,1,95,6,95,6,95,8,72,122,72,95,
		3,109,45,0,1,95,8,95,2,109,45,0,1,95,
		12,4,7,0,20,2,36,65,4,96,6,0,95,8,
		135,36,67,4,96,12,0,95,2,109,45,0,1,122,
		72,135,36,69,4,96,11,0,95,8,135,36,52,4,
		109,45,0,23,21,83,45,0,176,56,0,95,1,12,
		1,15,29,60,255,36,73,4,95,11,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETUNIT )
{
	static const HB_BYTE pcode[] =
	{
		13,4,0,116,121,0,36,83,4,176,27,0,103,2,
		0,92,4,96,1,0,12,3,80,2,36,84,4,176,
		98,0,95,2,109,99,0,109,100,0,9,9,9,9,
		12,7,80,3,36,86,4,176,104,0,95,2,176,102,
		0,106,2,32,0,122,12,2,95,3,12,3,80,4,
		36,88,4,176,30,0,95,1,20,1,36,91,4,95,
		4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XSEARCHLIM )
{
	static const HB_BYTE pcode[] =
	{
		13,10,1,116,121,0,36,97,4,121,80,2,36,99,
		4,4,0,0,80,4,36,100,4,103,1,0,66,80,
		5,36,105,4,4,0,0,80,10,36,106,4,176,14,
		0,103,2,0,12,1,80,11,36,110,4,176,76,0,
		96,6,0,96,7,0,20,2,36,111,4,176,77,0,
		95,11,95,7,95,6,12,3,80,8,36,112,4,95,
		8,92,2,1,80,9,36,114,4,176,90,0,95,9,
		12,1,80,10,36,116,4,176,16,0,103,4,0,89,
		31,0,1,0,2,0,5,0,1,0,176,81,0,95,
		1,92,3,1,95,255,72,95,254,49,12,1,92,20,
		34,6,12,2,80,3,36,119,4,95,3,121,15,28,
		51,176,56,0,95,10,12,1,121,15,28,40,36,120,
		4,95,10,122,1,92,2,1,95,3,8,28,25,36,
		121,4,103,8,0,95,10,122,1,92,2,1,8,28,
		9,36,122,4,95,3,80,2,36,127,4,95,2,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XSEARCHPOS )
{
	static const HB_BYTE pcode[] =
	{
		13,4,1,116,121,0,36,132,4,121,80,2,36,134,
		4,4,0,0,80,4,36,136,4,103,1,0,66,80,
		5,36,139,4,176,16,0,103,4,0,89,38,0,1,
		0,2,0,5,0,1,0,95,1,92,2,1,95,255,
		72,95,254,34,21,28,14,73,95,1,92,3,1,95,
		255,72,95,254,16,6,12,2,80,3,36,142,4,95,
		3,121,15,28,32,36,143,4,95,3,80,2,36,144,
		4,176,55,0,95,4,103,4,0,95,3,1,122,1,
		95,2,4,2,0,20,2,36,148,4,95,4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,121,0,36,154,4,104,1,0,95,2,
		135,36,155,4,176,20,0,95,1,20,1,36,157,4,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XPAINTHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,21,4,116,121,0,36,163,4,176,25,0,95,1,
		12,1,80,5,36,164,4,176,26,0,95,1,12,1,
		80,6,36,166,4,106,1,0,80,8,36,167,4,106,
		1,0,80,9,36,168,4,122,80,10,36,170,4,121,
		80,12,36,171,4,176,107,0,106,2,65,0,109,108,
		0,12,2,80,13,36,173,4,122,80,15,36,174,4,
		121,80,16,36,175,4,121,80,17,36,176,4,121,80,
		18,36,179,4,103,1,0,66,80,21,36,180,4,92,
		17,80,22,36,181,4,176,109,0,106,9,79,75,77,
		65,82,75,50,50,0,12,1,80,23,36,184,4,176,
		109,0,106,6,83,69,84,84,65,0,12,1,80,24,
		36,185,4,176,109,0,106,6,83,69,84,65,66,0,
		12,1,80,25,36,187,4,176,27,0,95,1,92,4,
		96,7,0,12,3,83,97,0,36,188,4,176,110,0,
		109,97,0,121,121,95,5,95,6,92,117,92,124,93,
		131,0,4,3,0,93,137,0,93,143,0,93,150,0,
		4,3,0,20,7,36,193,4,103,1,0,121,15,28,
		11,36,194,4,96,22,0,95,21,135,36,197,4,176,
		111,0,109,97,0,121,121,95,5,95,6,92,8,92,
		5,20,7,36,200,4,176,112,0,109,97,0,92,6,
		121,95,22,72,92,16,49,92,15,92,15,122,95,23,
		20,7,36,201,4,176,98,0,109,97,0,109,99,0,
		109,100,0,9,9,9,9,12,7,80,14,36,203,4,
		121,80,11,36,206,4,122,165,80,10,26,74,1,36,
		208,4,103,4,0,95,10,1,92,5,1,80,12,36,
		209,4,176,53,0,176,17,0,103,4,0,95,10,1,
		122,1,12,1,12,1,80,18,36,210,4,95,18,121,
		5,28,6,95,12,25,7,95,12,95,18,72,80,19,
		36,211,4,95,18,121,5,28,9,95,3,95,10,1,
		25,10,95,3,95,10,1,95,18,72,80,20,36,214,
		4,96,9,0,176,113,0,176,17,0,103,4,0,95,
		10,1,122,1,12,1,95,20,122,72,12,2,135,36,
		218,4,103,8,0,121,15,28,119,103,8,0,95,10,
		5,28,111,36,219,4,103,8,0,176,56,0,103,7,
		0,12,1,69,28,48,36,220,4,176,110,0,109,97,
		0,122,95,22,95,19,122,72,95,6,93,163,0,93,
		168,0,93,173,0,4,3,0,93,163,0,93,168,0,
		93,173,0,4,3,0,20,7,25,48,36,222,4,176,
		110,0,109,97,0,122,95,22,95,19,93,250,0,72,
		95,6,93,163,0,93,168,0,93,173,0,4,3,0,
		93,163,0,93,168,0,93,173,0,4,3,0,20,7,
		36,230,4,176,111,0,109,97,0,122,95,22,95,22,
		92,2,72,95,6,92,8,92,5,20,7,36,231,4,
		176,111,0,109,97,0,122,95,22,122,72,95,22,92,
		3,72,95,6,92,8,92,5,20,7,36,234,4,103,
		20,0,95,10,8,28,12,36,235,4,95,22,92,4,
		72,80,11,36,238,4,96,22,0,95,12,135,36,206,
		4,175,10,0,176,56,0,103,4,0,12,1,15,29,
		176,254,36,244,4,176,114,0,109,97,0,92,10,92,
		17,95,21,72,176,115,0,95,9,12,1,109,99,0,
		109,100,0,93,255,0,93,255,0,93,255,0,4,3,
		0,93,230,0,93,230,0,93,230,0,4,3,0,95,
		15,95,16,95,17,20,11,36,250,4,103,22,0,121,
		15,29,136,1,36,252,4,92,17,80,22,36,254,4,
		103,1,0,121,15,28,11,36,255,4,96,22,0,95,
		21,135,36,2,5,103,4,0,103,22,0,1,92,5,
		1,80,12,36,3,5,96,22,0,103,4,0,103,22,
		0,1,92,2,1,92,13,49,135,36,4,5,103,4,
		0,103,22,0,1,122,1,80,9,36,9,5,176,53,
		0,176,17,0,103,4,0,103,22,0,1,122,1,12,
		1,12,1,80,18,36,10,5,95,18,121,5,28,6,
		95,12,25,7,95,12,95,18,72,80,19,36,11,5,
		95,18,121,5,28,10,95,3,103,22,0,1,25,11,
		95,3,103,22,0,1,95,18,72,80,20,36,13,5,
		176,113,0,176,17,0,103,4,0,103,22,0,1,122,
		1,12,1,95,20,122,72,12,2,80,9,36,16,5,
		103,22,0,176,56,0,103,7,0,12,1,69,28,49,
		36,17,5,176,110,0,109,97,0,122,95,22,95,19,
		92,5,49,95,6,93,163,0,93,168,0,93,173,0,
		4,3,0,93,128,0,93,128,0,93,128,0,4,3,
		0,20,7,25,48,36,19,5,176,110,0,109,97,0,
		122,95,22,95,19,93,94,1,72,95,6,93,163,0,
		93,168,0,93,173,0,4,3,0,93,128,0,93,128,
		0,93,128,0,4,3,0,20,7,36,22,5,103,20,
		0,103,22,0,8,28,36,36,23,5,176,116,0,109,
		97,0,92,6,95,22,92,2,72,92,16,92,16,122,
		103,21,0,28,6,95,24,25,4,95,25,20,7,36,
		30,5,176,114,0,109,97,0,92,10,95,22,176,115,
		0,95,9,12,1,109,99,0,109,100,0,93,255,0,
		93,255,0,93,255,0,4,3,0,93,230,0,93,230,
		0,93,230,0,4,3,0,92,3,95,16,95,17,20,
		11,36,36,5,103,23,0,28,97,36,39,5,103,4,
		0,103,26,0,1,92,2,1,103,28,0,72,83,117,
		0,36,40,5,103,4,0,103,26,0,1,92,5,1,
		83,118,0,36,43,5,176,111,0,109,97,0,122,109,
		117,0,109,117,0,109,118,0,72,95,6,92,8,92,
		5,20,7,36,44,5,176,111,0,109,97,0,122,95,
		22,122,72,109,117,0,109,118,0,72,122,72,95,6,
		92,8,92,5,20,7,36,50,5,176,30,0,95,7,
		20,1,36,51,5,176,119,0,95,23,20,1,36,53,
		5,176,119,0,95,24,20,1,36,54,5,176,119,0,
		95,25,20,1,36,58,5,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,121,0,28,0,116,121,0,121,82,1,0,106,1,
		0,82,2,0,106,1,0,82,3,0,4,0,0,82,
		4,0,4,0,0,82,5,0,4,0,0,82,6,0,
		4,0,0,82,7,0,121,82,8,0,121,82,9,0,
		9,82,10,0,9,82,11,0,106,1,0,82,12,0,
		120,82,13,0,106,1,0,82,14,0,9,82,15,0,
		121,82,16,0,121,82,17,0,106,1,0,82,18,0,
		106,1,0,82,19,0,121,82,20,0,9,82,21,0,
		122,82,22,0,9,82,23,0,92,5,82,24,0,121,
		82,25,0,121,82,26,0,121,82,27,0,121,82,28,
		0,7
	};

	hb_vmExecute( pcode, symbols );
}

