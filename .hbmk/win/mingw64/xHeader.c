/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\xHeader.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XHEADER );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( LEFT );
HB_FUNC_STATIC( XPAINTHEADER );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_STATIC( XMAPCOLS );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC( XLIMPMODE );
HB_FUNC_STATIC( XATUDADOS );
HB_FUNC_EXTERN( GETCAMPOSDIC );
HB_FUNC_EXTERN( GETCAMPOSINF );
HB_FUNC_EXTERN( XRETARRAY );
HB_FUNC_EXTERN( XCURSORWAIT );
HB_FUNC_EXTERN( PADL );
HB_FUNC_EXTERN( TRANSFORM );
HB_FUNC_EXTERN( RTRANS );
HB_FUNC_EXTERN( STR );
HB_FUNC_EXTERN( VAL );
HB_FUNC_EXTERN( QTACENTO );
HB_FUNC_EXTERN( PADR );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( ASORT );
HB_FUNC_EXTERN( SETARRAY );
HB_FUNC_EXTERN( _ISWINDOWDEFINED );
HB_FUNC_EXTERN( XSHOWBRW );
HB_FUNC_EXTERN( XGOTOP );
HB_FUNC( XGETCOLSEL );
HB_FUNC( XGETCOLQTD );
HB_FUNC( XGETCOLWIDTH );
HB_FUNC( XGETINFC );
HB_FUNC( XCOLMESQUERDA );
HB_FUNC( XCOLSVISIBLE );
HB_FUNC( XSELCOL );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( SYSWAIT );
HB_FUNC( EVENTHEADER );
HB_FUNC_EXTERN( GETASYNCKEYSTATE );
HB_FUNC_EXTERN( GETCURSORPOS );
HB_FUNC_EXTERN( GETPOS_SCREENTOCLIENT );
HB_FUNC( XRETUNIT );
HB_FUNC_EXTERN( ABS );
HB_FUNC_EXTERN( INT );
HB_FUNC_EXTERN( SETCAMPOTAM );
HB_FUNC_EXTERN( XDIALOG );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_STATIC( XSEARCHPOS );
HB_FUNC( XAPAGUEH );
HB_FUNC_STATIC( XSEARCHLIM );
HB_FUNC_EXTERN( XDOHINT );
HB_FUNC_EXTERN( HB_UTF8TOSTR );
HB_FUNC_EXTERN( XHIDEHINT );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
HB_FUNC( XRETTOTAL );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( HMG_CREATEFONT );
HB_FUNC_EXTERN( REPLICATE );
HB_FUNC_EXTERN( GETTEXTWIDTH );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC_EXTERN( GETFORMHANDLE );
HB_FUNC( UPDHEADER );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( GETTEXTOTAM );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLVERTICAL );
HB_FUNC_EXTERN( BT_DRAWEDGE );
HB_FUNC_EXTERN( BT_DRAWBITMAP );
HB_FUNC_EXTERN( PADC );
HB_FUNC_EXTERN( BT_DRAWTEXT );
HB_FUNC_EXTERN( BT_BITMAPRELEASE );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XHEADER )
{ "XHEADER", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XHEADER )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "XPAINTHEADER", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTHEADER )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "XMAPCOLS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XMAPCOLS )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "XLIMPMODE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XLIMPMODE )}, NULL },
{ "XATUDADOS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XATUDADOS )}, NULL },
{ "GETCAMPOSDIC", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCAMPOSDIC )}, NULL },
{ "CTABELA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETCAMPOSINF", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCAMPOSINF )}, NULL },
{ "XRETARRAY", {HB_FS_PUBLIC}, {HB_FUNCNAME( XRETARRAY )}, NULL },
{ "XCURSORWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XCURSORWAIT )}, NULL },
{ "N1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "PADL", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADL )}, NULL },
{ "LNUM", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "TRANSFORM", {HB_FS_PUBLIC}, {HB_FUNCNAME( TRANSFORM )}, NULL },
{ "RTRANS", {HB_FS_PUBLIC}, {HB_FUNCNAME( RTRANS )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "VAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( VAL )}, NULL },
{ "QTACENTO", {HB_FS_PUBLIC}, {HB_FUNCNAME( QTACENTO )}, NULL },
{ "PADR", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADR )}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "ASORT", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASORT )}, NULL },
{ "SETARRAY", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETARRAY )}, NULL },
{ "_ISWINDOWDEFINED", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ISWINDOWDEFINED )}, NULL },
{ "XSHOWBRW", {HB_FS_PUBLIC}, {HB_FUNCNAME( XSHOWBRW )}, NULL },
{ "XGOTOP", {HB_FS_PUBLIC}, {HB_FUNCNAME( XGOTOP )}, NULL },
{ "XGETCOLSEL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETCOLSEL )}, NULL },
{ "XGETCOLQTD", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETCOLQTD )}, NULL },
{ "XGETCOLWIDTH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETCOLWIDTH )}, NULL },
{ "XGETINFC", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XGETINFC )}, NULL },
{ "XCOLMESQUERDA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCOLMESQUERDA )}, NULL },
{ "XCOLSVISIBLE", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XCOLSVISIBLE )}, NULL },
{ "XSELCOL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSELCOL )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "SYSWAIT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SYSWAIT )}, NULL },
{ "EVENTHEADER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTHEADER )}, NULL },
{ "GETASYNCKEYSTATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETASYNCKEYSTATE )}, NULL },
{ "GETCURSORPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCURSORPOS )}, NULL },
{ "GETPOS_SCREENTOCLIENT", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPOS_SCREENTOCLIENT )}, NULL },
{ "XRETUNIT", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETUNIT )}, NULL },
{ "NUNIT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ABS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ABS )}, NULL },
{ "INT", {HB_FS_PUBLIC}, {HB_FUNCNAME( INT )}, NULL },
{ "SETCAMPOTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETCAMPOTAM )}, NULL },
{ "XDIALOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDIALOG )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "XSEARCHPOS", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSEARCHPOS )}, NULL },
{ "XAPAGUEH", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XAPAGUEH )}, NULL },
{ "XSEARCHLIM", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( XSEARCHLIM )}, NULL },
{ "XDOHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XDOHINT )}, NULL },
{ "HB_UTF8TOSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_UTF8TOSTR )}, NULL },
{ "XHIDEHINT", {HB_FS_PUBLIC}, {HB_FUNCNAME( XHIDEHINT )}, NULL },
{ "N3", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "CURSORHAND", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XRETTOTAL", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETTOTAL )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "HDC", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HMG_CREATEFONT", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_CREATEFONT )}, NULL },
{ "FONTBROWSER", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "FONTBROWSERSIZE", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HFONT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "REPLICATE", {HB_FS_PUBLIC}, {HB_FUNCNAME( REPLICATE )}, NULL },
{ "CTEXTO", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETTEXTWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETTEXTWIDTH )}, NULL },
{ "N12", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "GETFORMHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETFORMHANDLE )}, NULL },
{ "UPDHEADER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( UPDHEADER )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "GETTEXTOTAM", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETTEXTOTAM )}, NULL },
{ "CACTIVEJAN", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "BT_DRAWGRADIENTFILLVERTICAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLVERTICAL )}, NULL },
{ "BT_DRAWEDGE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWEDGE )}, NULL },
{ "BT_DRAWBITMAP", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWBITMAP )}, NULL },
{ "PADC", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADC )}, NULL },
{ "BT_DRAWTEXT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWTEXT )}, NULL },
{ "BT_BITMAPRELEASE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPRELEASE )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00017)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
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
		13,3,8,116,93,0,36,82,0,176,1,0,95,5,
		106,4,82,111,119,0,12,2,80,9,36,83,0,176,
		1,0,95,5,106,4,67,111,108,0,12,2,80,10,
		36,84,0,176,1,0,95,5,106,6,87,105,100,116,
		104,0,12,2,80,11,36,86,0,95,1,82,2,0,
		36,88,0,95,3,82,4,0,36,89,0,95,7,82,
		5,0,36,90,0,95,2,82,6,0,36,92,0,95,
		5,82,13,0,36,94,0,95,8,82,12,0,36,104,
		0,176,2,0,20,0,176,3,0,95,1,106,9,120,
		72,101,97,100,101,114,49,0,176,4,0,95,1,92,
		4,12,2,72,95,10,95,9,92,92,49,95,11,122,
		72,92,30,9,9,120,120,120,9,106,1,0,100,100,
		100,100,100,100,93,255,0,93,255,0,93,255,0,4,
		3,0,90,36,176,5,0,176,1,0,98,6,0,93,
		60,1,1,106,5,78,97,109,101,0,12,2,103,6,
		0,103,4,0,103,5,0,12,4,6,9,9,9,100,
		120,100,100,100,100,100,100,100,100,95,6,121,15,28,
		6,95,6,25,6,95,11,122,72,100,100,100,100,100,
		100,9,100,100,100,9,100,100,100,100,100,100,100,100,
		95,4,120,20,56,36,105,0,176,7,0,20,0,36,
		107,0,176,8,0,103,6,0,103,4,0,103,5,0,
		20,3,36,109,0,176,9,0,98,6,0,92,60,1,
		176,10,0,176,11,0,106,12,69,118,101,110,116,72,
		101,97,100,101,114,0,12,1,12,1,12,2,121,5,
		28,24,36,110,0,176,12,0,106,12,69,118,101,110,
		116,72,101,97,100,101,114,0,20,1,36,114,0,120,
		110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XLIMPMODE )
{
	static const HB_BYTE pcode[] =
	{
		116,93,0,36,119,0,9,82,10,0,36,120,0,9,
		82,11,0,36,121,0,121,82,7,0,36,122,0,121,
		82,8,0,36,124,0,9,82,14,0,36,126,0,9,
		82,9,0,36,128,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XATUDADOS )
{
	static const HB_BYTE pcode[] =
	{
		13,19,2,116,93,0,36,134,0,176,15,0,109,16,
		0,106,2,83,0,120,120,12,4,80,3,36,135,0,
		176,15,0,109,16,0,106,2,83,0,9,9,12,4,
		80,4,36,136,0,176,17,0,109,16,0,106,4,84,
		65,77,0,12,2,80,5,36,137,0,176,17,0,109,
		16,0,106,5,84,73,80,79,0,12,2,80,6,36,
		139,0,176,18,0,12,0,80,8,36,140,0,106,1,
		0,80,9,36,141,0,4,0,0,80,10,36,142,0,
		4,0,0,80,11,36,143,0,121,80,12,36,148,0,
		106,1,0,80,17,36,149,0,106,1,0,80,18,36,
		151,0,106,1,0,80,20,36,152,0,106,1,0,80,
		21,36,155,0,95,1,100,8,28,5,121,25,4,95,
		1,80,1,36,156,0,95,2,100,8,28,5,9,25,
		4,95,2,80,2,36,158,0,176,19,0,120,20,1,
		36,161,0,122,165,80,19,26,249,1,36,163,0,95,
		8,95,19,1,92,4,1,80,7,36,165,0,4,0,
		0,80,11,36,167,0,95,8,95,19,1,92,2,1,
		80,15,36,168,0,95,8,95,19,1,92,3,1,80,
		16,36,169,0,106,1,0,80,9,36,171,0,106,1,
		0,80,21,36,173,0,122,165,83,20,0,26,127,1,
		36,175,0,106,1,0,80,17,36,179,0,95,7,109,
		20,0,1,122,1,80,17,36,181,0,176,10,0,95,
		6,109,20,0,1,12,1,106,2,68,0,8,28,22,
		36,182,0,176,21,0,95,7,109,20,0,1,122,1,
		92,10,12,2,80,17,36,185,0,9,83,22,0,36,
		187,0,176,10,0,95,6,109,20,0,1,12,1,106,
		2,66,0,8,28,57,36,188,0,176,10,0,176,23,
		0,176,24,0,95,7,109,20,0,1,122,1,12,1,
		106,18,64,69,32,57,57,57,44,57,57,57,44,57,
		57,57,46,57,57,0,12,2,12,1,80,17,36,189,
		0,120,83,22,0,36,192,0,176,10,0,95,6,109,
		20,0,1,12,1,106,2,73,0,8,28,77,36,193,
		0,109,20,0,122,15,28,39,36,194,0,176,10,0,
		176,25,0,176,26,0,95,7,109,20,0,1,122,1,
		12,1,12,1,12,1,80,17,36,195,0,120,83,22,
		0,25,30,36,197,0,176,10,0,176,25,0,176,26,
		0,95,7,109,20,0,1,122,1,12,1,12,1,12,
		1,80,17,36,201,0,95,5,109,20,0,1,80,14,
		36,202,0,176,27,0,95,17,12,1,80,12,36,204,
		0,95,12,121,5,28,6,95,14,25,7,95,14,95,
		12,72,80,13,36,205,0,96,9,0,176,28,0,95,
		17,95,13,12,2,106,2,32,0,72,135,36,208,0,
		95,1,121,15,28,20,36,209,0,95,1,109,20,0,
		5,28,9,36,210,0,95,17,80,21,36,214,0,176,
		29,0,95,11,95,17,95,7,109,20,0,1,92,2,
		1,109,20,0,95,13,4,4,0,20,2,36,216,0,
		176,30,0,20,0,36,173,0,109,20,0,23,21,83,
		20,0,176,31,0,95,3,12,1,15,29,124,254,36,
		220,0,176,30,0,20,0,36,221,0,176,29,0,95,
		10,95,9,95,15,95,16,95,11,95,21,4,5,0,
		20,2,36,161,0,175,19,0,176,31,0,95,8,12,
		1,15,29,2,254,36,226,0,95,1,121,15,28,77,
		36,227,0,95,2,28,37,36,228,0,176,32,0,95,
		10,100,100,89,19,0,2,0,0,0,95,1,92,5,
		1,95,2,92,5,1,35,6,12,4,80,10,25,35,
		36,230,0,176,32,0,95,10,100,100,89,19,0,2,
		0,0,0,95,1,92,5,1,95,2,92,5,1,15,
		6,12,4,80,10,36,237,0,176,30,0,20,0,36,
		238,0,176,33,0,95,10,20,1,36,240,0,176,30,
		0,20,0,36,242,0,176,34,0,103,13,0,12,1,
		28,22,36,243,0,176,35,0,109,16,0,120,20,2,
		36,244,0,176,36,0,20,0,36,247,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETCOLSEL )
{
	static const HB_BYTE pcode[] =
	{
		116,93,0,36,251,0,103,17,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETCOLQTD )
{
	static const HB_BYTE pcode[] =
	{
		116,93,0,36,255,0,176,31,0,103,3,0,20,1,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETCOLWIDTH )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,93,0,36,4,1,103,3,0,95,1,
		1,92,5,1,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XGETINFC )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,93,0,36,7,1,103,3,0,95,1,
		1,95,2,1,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCOLMESQUERDA )
{
	static const HB_BYTE pcode[] =
	{
		13,6,1,36,12,1,122,80,2,36,17,1,176,38,
		0,12,0,80,7,36,22,1,176,39,0,95,2,12,
		1,80,3,36,23,1,176,40,0,95,2,92,2,12,
		2,80,4,36,24,1,176,40,0,95,2,92,3,12,
		2,80,5,36,26,1,95,5,95,1,16,80,6,36,
		28,1,95,6,31,17,95,2,95,7,5,31,10,36,
		33,1,174,2,0,25,186,36,40,1,95,2,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XCOLSVISIBLE )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,93,0,36,45,1,4,0,0,80,2,
		36,46,1,121,80,3,36,48,1,122,165,80,3,25,
		40,36,50,1,103,3,0,95,3,1,92,3,1,95,
		1,92,3,72,34,28,14,36,51,1,176,29,0,95,
		2,95,3,20,2,36,48,1,175,3,0,176,31,0,
		103,3,0,12,1,15,28,209,36,59,1,95,2,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XSELCOL )
{
	static const HB_BYTE pcode[] =
	{
		13,0,1,116,93,0,36,63,1,95,1,82,17,0,
		36,64,1,176,44,0,103,2,0,20,1,36,65,1,
		176,45,0,101,123,20,174,71,225,122,148,63,10,2,
		20,1,36,68,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,11,4,116,93,0,36,74,1,9,80,6,36,77,
		1,4,0,0,80,9,36,80,1,176,1,0,103,2,
		0,106,7,72,101,105,103,104,116,0,12,2,80,11,
		36,81,1,121,80,12,36,87,1,121,80,14,36,88,
		1,121,80,15,36,91,1,176,34,0,103,2,0,12,
		1,31,6,36,92,1,7,36,97,1,95,1,176,1,
		0,103,2,0,106,7,72,65,78,68,76,69,0,12,
		2,8,29,30,5,36,130,1,95,2,93,1,2,8,
		29,133,2,36,134,1,103,7,0,82,17,0,36,135,
		1,176,44,0,103,2,0,20,1,36,136,1,176,45,
		0,101,123,20,174,71,225,122,148,63,10,2,20,1,
		36,138,1,103,10,0,29,85,2,36,140,1,122,165,
		80,13,25,18,36,141,1,176,47,0,95,13,20,1,
		36,140,1,175,13,0,93,255,0,15,28,236,36,144,
		1,120,82,14,0,36,146,1,176,48,0,96,14,0,
		96,5,0,20,2,36,147,1,176,49,0,95,1,95,
		5,95,14,12,3,80,8,36,148,1,95,8,92,2,
		1,80,7,36,150,1,103,7,0,80,15,36,151,1,
		176,50,0,12,0,83,51,0,36,152,1,9,80,6,
		36,157,1,176,47,0,122,12,1,121,8,32,39,1,
		36,161,1,120,82,14,0,36,163,1,176,48,0,96,
		14,0,96,5,0,20,2,36,164,1,176,49,0,95,
		1,95,5,95,14,12,3,80,8,36,165,1,95,8,
		92,2,1,80,12,36,167,1,95,15,82,15,0,36,
		170,1,176,52,0,95,12,95,7,49,12,1,109,51,
		0,16,29,198,0,36,172,1,95,12,95,7,15,28,
		56,36,173,1,103,3,0,95,15,1,92,5,148,176,
		52,0,95,12,95,7,49,12,1,135,36,174,1,103,
		4,0,95,15,148,176,53,0,176,52,0,95,12,95,
		7,49,12,1,109,51,0,18,12,1,135,25,54,36,
		176,1,103,3,0,95,15,1,92,5,148,176,52,0,
		95,12,95,7,49,12,1,136,36,177,1,103,4,0,
		95,15,148,176,53,0,176,52,0,95,12,95,7,49,
		12,1,109,51,0,18,12,1,136,36,180,1,176,8,
		0,103,6,0,103,4,0,103,5,0,20,3,36,181,
		1,176,45,0,101,123,20,174,71,225,122,132,63,10,
		2,20,1,36,183,1,176,44,0,103,2,0,20,1,
		36,184,1,176,45,0,101,123,20,174,71,225,122,132,
		63,10,2,20,1,36,186,1,120,80,6,36,187,1,
		95,12,80,7,36,192,1,176,45,0,101,123,20,174,
		71,225,122,148,63,10,2,20,1,26,209,254,36,196,
		1,95,6,29,166,0,36,197,1,176,8,0,103,6,
		0,103,4,0,103,5,0,20,3,36,199,1,176,54,
		0,109,16,0,176,10,0,103,6,0,95,15,1,12,
		1,103,4,0,95,15,1,12,3,31,58,36,200,1,
		176,55,0,176,56,0,106,41,78,227,111,32,70,111,
		105,32,80,111,115,115,105,118,101,108,32,65,116,117,
		97,108,105,122,97,114,32,111,32,68,105,99,105,111,
		110,97,114,105,111,46,0,12,1,20,1,36,203,1,
		176,45,0,101,123,20,174,71,225,122,148,63,10,2,
		20,1,36,205,1,176,44,0,103,2,0,20,1,36,
		206,1,176,45,0,101,123,20,174,71,225,122,148,63,
		10,2,20,1,36,208,1,176,14,0,92,3,120,20,
		2,36,212,1,9,82,10,0,36,213,1,9,82,14,
		0,36,221,1,95,2,93,2,2,8,28,23,36,223,
		1,9,82,10,0,36,224,1,9,82,11,0,36,225,
		1,9,82,14,0,36,229,1,95,2,93,0,2,8,
		29,100,2,36,233,1,122,165,80,13,25,18,36,234,
		1,176,47,0,95,13,20,1,36,233,1,175,13,0,
		93,255,0,15,28,236,36,238,1,176,48,0,96,14,
		0,96,5,0,20,2,36,239,1,176,49,0,95,1,
		95,5,95,14,12,3,80,8,36,240,1,95,8,92,
		2,1,80,7,36,245,1,176,30,0,20,0,36,247,
		1,176,47,0,122,12,1,121,8,31,6,36,248,1,
		7,36,251,1,176,57,0,95,1,93,0,127,20,2,
		36,252,1,176,58,0,95,7,12,1,80,9,36,254,
		1,176,31,0,95,9,12,1,121,5,28,38,36,255,
		1,9,82,10,0,36,0,2,9,82,11,0,36,1,
		2,9,82,14,0,36,2,2,176,59,0,103,2,0,
		20,1,36,3,2,7,36,7,2,176,60,0,95,7,
		12,1,165,80,12,121,15,28,112,36,8,2,176,61,
		0,100,106,23,82,101,100,105,109,101,110,115,105,111,
		110,97,32,97,32,67,111,108,117,110,97,32,0,176,
		62,0,176,10,0,103,3,0,95,12,1,122,1,12,
		1,12,1,72,106,3,32,32,0,72,176,25,0,103,
		7,0,12,1,72,20,2,36,9,2,176,57,0,95,
		1,106,11,67,85,82,83,79,82,83,73,90,69,0,
		20,2,36,10,2,176,30,0,20,0,36,11,2,120,
		82,10,0,36,12,2,7,36,15,2,176,34,0,106,
		8,87,105,110,95,77,115,103,0,12,1,28,10,36,
		16,2,176,63,0,20,0,36,19,2,9,82,10,0,
		36,20,2,176,57,0,95,1,93,0,127,20,2,36,
		24,2,103,8,0,95,9,122,1,92,2,1,69,28,
		120,103,8,0,121,15,28,113,103,8,0,176,31,0,
		103,3,0,12,1,34,28,99,36,26,2,121,82,7,
		0,36,27,2,103,3,0,103,8,0,1,92,2,1,
		80,10,36,28,2,103,3,0,103,8,0,1,92,5,
		1,83,64,0,36,29,2,176,65,0,103,2,0,122,
		95,10,109,64,0,95,11,120,20,6,36,30,2,95,
		9,122,1,92,2,1,82,8,0,36,31,2,9,82,
		9,0,36,32,2,176,45,0,101,184,30,133,235,81,
		184,158,63,10,2,20,1,36,37,2,176,31,0,95,
		9,12,1,121,15,28,117,36,39,2,103,9,0,31,
		109,36,40,2,95,9,122,1,92,2,1,82,7,0,
		36,41,2,95,9,122,1,92,2,1,82,8,0,36,
		42,2,103,3,0,103,7,0,1,92,2,1,80,10,
		36,43,2,103,3,0,103,7,0,1,92,5,1,83,
		64,0,36,44,2,176,44,0,103,2,0,20,1,36,
		45,2,176,57,0,95,1,109,66,0,20,2,36,46,
		2,176,45,0,101,123,20,174,71,225,122,180,63,10,
		2,20,1,36,47,2,120,82,9,0,36,58,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XAPAGUEH )
{
	static const HB_BYTE pcode[] =
	{
		13,3,1,116,93,0,36,65,2,176,1,0,95,1,
		106,7,72,101,105,103,104,116,0,12,2,80,4,36,
		68,2,103,7,0,121,15,28,91,36,70,2,9,82,
		9,0,36,72,2,103,3,0,103,7,0,1,92,2,
		1,80,2,36,73,2,103,3,0,103,7,0,1,92,
		5,1,80,3,36,74,2,121,82,7,0,36,75,2,
		176,31,0,103,3,0,12,1,122,49,82,8,0,36,
		76,2,176,44,0,95,1,20,1,36,77,2,176,45,
		0,101,123,20,174,71,225,122,148,63,10,2,20,1,
		36,83,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETTOTAL )
{
	static const HB_BYTE pcode[] =
	{
		13,2,1,116,93,0,36,106,2,121,80,2,36,107,
		2,121,80,3,36,109,2,122,165,80,2,25,34,36,
		111,2,95,2,95,1,34,28,18,36,112,2,96,3,
		0,103,3,0,95,2,1,92,5,1,135,36,109,2,
		175,2,0,176,31,0,103,3,0,12,1,15,28,215,
		36,119,2,95,3,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XMAPCOLS )
{
	static const HB_BYTE pcode[] =
	{
		13,7,3,116,93,0,36,123,2,121,80,4,36,124,
		2,122,80,5,36,125,2,92,17,80,6,36,131,2,
		176,68,0,103,2,0,92,4,96,9,0,12,3,83,
		69,0,36,132,2,176,70,0,109,69,0,109,71,0,
		109,72,0,9,9,9,9,12,7,83,73,0,36,134,
		2,4,0,0,82,3,0,36,136,2,122,165,83,20,
		0,26,159,0,36,138,2,95,2,109,20,0,1,80,
		7,36,140,2,176,27,0,176,10,0,95,1,109,20,
		0,1,12,1,12,1,80,10,36,141,2,95,10,121,
		5,28,6,95,7,25,7,95,7,95,10,72,80,8,
		36,144,2,176,74,0,106,2,65,0,95,7,122,72,
		12,2,83,75,0,36,145,2,176,76,0,109,69,0,
		109,75,0,109,73,0,12,3,83,77,0,36,146,2,
		109,77,0,80,8,36,148,2,176,29,0,103,3,0,
		95,1,109,20,0,1,95,6,95,6,95,8,72,122,
		72,95,3,109,20,0,1,95,8,4,5,0,20,2,
		36,149,2,96,6,0,95,8,135,36,136,2,109,20,
		0,23,21,83,20,0,176,31,0,95,1,12,1,15,
		29,92,255,36,153,2,100,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETUNIT )
{
	static const HB_BYTE pcode[] =
	{
		13,4,0,116,93,0,36,163,2,176,68,0,103,2,
		0,92,4,96,1,0,12,3,80,2,36,164,2,176,
		70,0,95,2,109,71,0,109,72,0,9,9,9,9,
		12,7,80,3,36,166,2,176,76,0,95,2,176,74,
		0,106,2,32,0,122,12,2,95,3,12,3,80,4,
		36,168,2,176,78,0,95,1,20,1,36,171,2,95,
		4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XSEARCHLIM )
{
	static const HB_BYTE pcode[] =
	{
		13,10,1,116,93,0,36,177,2,121,80,2,36,179,
		2,4,0,0,80,4,36,180,2,103,1,0,66,80,
		5,36,185,2,4,0,0,80,10,36,186,2,176,79,
		0,103,2,0,12,1,80,11,36,190,2,176,48,0,
		96,6,0,96,7,0,20,2,36,191,2,176,49,0,
		95,11,95,7,95,6,12,3,80,8,36,192,2,95,
		8,92,2,1,80,9,36,194,2,176,58,0,95,9,
		12,1,80,10,36,196,2,176,9,0,103,3,0,89,
		31,0,1,0,2,0,5,0,1,0,176,52,0,95,
		1,92,3,1,95,255,72,95,254,49,12,1,92,20,
		34,6,12,2,80,3,36,199,2,95,3,121,15,28,
		51,176,31,0,95,10,12,1,121,15,28,40,36,200,
		2,95,10,122,1,92,2,1,95,3,8,28,25,36,
		201,2,103,7,0,95,10,122,1,92,2,1,8,28,
		9,36,202,2,95,3,80,2,36,207,2,95,2,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XSEARCHPOS )
{
	static const HB_BYTE pcode[] =
	{
		13,4,1,116,93,0,36,212,2,121,80,2,36,214,
		2,4,0,0,80,4,36,216,2,103,1,0,66,80,
		5,36,219,2,176,9,0,103,3,0,89,38,0,1,
		0,2,0,5,0,1,0,95,1,92,2,1,95,255,
		72,95,254,34,21,28,14,73,95,1,92,3,1,95,
		255,72,95,254,16,6,12,2,80,3,36,222,2,95,
		3,121,15,28,32,36,223,2,95,3,80,2,36,224,
		2,176,29,0,95,4,103,3,0,95,3,1,122,1,
		95,2,4,2,0,20,2,36,228,2,95,4,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( UPDHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,93,0,36,234,2,104,1,0,95,2,
		135,36,235,2,176,44,0,95,1,20,1,36,237,2,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( XPAINTHEADER )
{
	static const HB_BYTE pcode[] =
	{
		13,18,4,116,93,0,36,243,2,176,81,0,95,1,
		12,1,80,5,36,244,2,176,82,0,95,1,12,1,
		80,6,36,246,2,106,1,0,80,8,36,247,2,106,
		1,0,80,9,36,248,2,122,80,10,36,249,2,121,
		80,11,36,250,2,176,83,0,106,2,65,0,109,84,
		0,12,2,80,12,36,252,2,122,80,14,36,253,2,
		121,80,15,36,254,2,121,80,16,36,255,2,121,80,
		17,36,2,3,103,1,0,66,80,20,36,3,3,92,
		17,80,21,36,4,3,176,85,0,106,9,79,75,77,
		65,82,75,50,50,0,12,1,80,22,36,6,3,176,
		68,0,95,1,92,4,96,7,0,12,3,83,69,0,
		36,7,3,176,86,0,109,69,0,121,121,95,5,95,
		6,92,117,92,124,93,131,0,4,3,0,93,137,0,
		93,143,0,93,150,0,4,3,0,20,7,36,12,3,
		103,1,0,121,15,28,11,36,13,3,96,21,0,95,
		20,135,36,16,3,176,87,0,109,69,0,121,121,95,
		5,95,6,92,8,92,5,20,7,36,19,3,176,88,
		0,109,69,0,92,6,121,95,21,72,92,16,49,92,
		15,92,15,122,95,22,20,7,36,20,3,176,70,0,
		109,69,0,109,71,0,109,72,0,9,9,9,9,12,
		7,80,13,36,23,3,122,165,80,10,26,53,1,36,
		25,3,103,3,0,95,10,1,92,5,1,80,11,36,
		26,3,176,27,0,176,10,0,103,3,0,95,10,1,
		122,1,12,1,12,1,80,17,36,27,3,95,17,121,
		5,28,6,95,11,25,7,95,11,95,17,72,80,18,
		36,28,3,95,17,121,5,28,9,95,3,95,10,1,
		25,10,95,3,95,10,1,95,17,72,80,19,36,31,
		3,96,9,0,176,89,0,176,10,0,103,3,0,95,
		10,1,122,1,12,1,95,19,122,72,12,2,135,36,
		35,3,103,7,0,121,15,28,119,103,7,0,95,10,
		5,28,111,36,36,3,103,7,0,176,31,0,103,6,
		0,12,1,69,28,48,36,37,3,176,86,0,109,69,
		0,122,95,21,95,18,122,72,95,6,93,163,0,93,
		168,0,93,173,0,4,3,0,93,163,0,93,168,0,
		93,173,0,4,3,0,20,7,25,48,36,39,3,176,
		86,0,109,69,0,122,95,21,95,18,93,250,0,72,
		95,6,93,163,0,93,168,0,93,173,0,4,3,0,
		93,163,0,93,168,0,93,173,0,4,3,0,20,7,
		36,47,3,176,87,0,109,69,0,122,95,21,95,21,
		92,2,72,95,6,92,8,92,5,20,7,36,48,3,
		176,87,0,109,69,0,122,95,21,122,72,95,21,92,
		3,72,95,6,92,8,92,5,20,7,36,49,3,96,
		21,0,95,11,135,36,23,3,175,10,0,176,31,0,
		103,3,0,12,1,15,29,197,254,36,54,3,176,90,
		0,109,69,0,92,10,92,17,95,20,72,176,62,0,
		95,9,12,1,109,71,0,109,72,0,93,255,0,93,
		255,0,93,255,0,4,3,0,93,230,0,93,230,0,
		93,230,0,4,3,0,95,14,95,15,95,16,20,11,
		36,58,3,103,17,0,121,15,29,90,1,36,60,3,
		92,17,80,21,36,62,3,103,1,0,121,15,28,11,
		36,63,3,96,21,0,95,20,135,36,66,3,103,3,
		0,103,17,0,1,92,5,1,80,11,36,67,3,96,
		21,0,103,3,0,103,17,0,1,92,2,1,92,13,
		49,135,36,68,3,103,3,0,103,17,0,1,122,1,
		80,9,36,75,3,176,27,0,176,10,0,103,3,0,
		103,17,0,1,122,1,12,1,12,1,80,17,36,76,
		3,95,17,121,5,28,6,95,11,25,7,95,11,95,
		17,72,80,18,36,77,3,95,17,121,5,28,10,95,
		3,103,17,0,1,25,11,95,3,103,17,0,1,95,
		17,72,80,19,36,79,3,176,89,0,176,10,0,103,
		3,0,103,17,0,1,122,1,12,1,95,19,122,72,
		12,2,80,9,36,82,3,103,17,0,176,31,0,103,
		6,0,12,1,69,28,49,36,83,3,176,86,0,109,
		69,0,122,95,21,95,18,92,5,49,95,6,93,163,
		0,93,168,0,93,173,0,4,3,0,93,128,0,93,
		128,0,93,128,0,4,3,0,20,7,25,48,36,85,
		3,176,86,0,109,69,0,122,95,21,95,18,93,94,
		1,72,95,6,93,163,0,93,168,0,93,173,0,4,
		3,0,93,128,0,93,128,0,93,128,0,4,3,0,
		20,7,36,91,3,176,90,0,109,69,0,92,10,95,
		21,176,62,0,95,9,12,1,109,71,0,109,72,0,
		93,255,0,93,255,0,93,255,0,4,3,0,93,230,
		0,93,230,0,93,230,0,4,3,0,92,3,95,15,
		95,16,20,11,36,98,3,176,78,0,95,7,20,1,
		36,99,3,176,91,0,95,22,20,1,36,103,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,93,0,17,0,116,93,0,121,82,1,0,106,1,
		0,82,2,0,4,0,0,82,3,0,4,0,0,82,
		4,0,4,0,0,82,5,0,4,0,0,82,6,0,
		121,82,7,0,121,82,8,0,9,82,9,0,9,82,
		10,0,9,82,11,0,106,1,0,82,12,0,106,1,
		0,82,13,0,9,82,14,0,121,82,15,0,121,82,
		16,0,122,82,17,0,7
	};

	hb_vmExecute( pcode, symbols );
}

