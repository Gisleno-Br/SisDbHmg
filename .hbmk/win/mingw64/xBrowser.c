/*
 * Harbour 3.2.0dev (r2002240732)
 * MinGW GNU C 8.1 (64-bit)
 * Generated C source from "Prg\xBrowser.Prg"
 */

#include "hbvmpub.h"
#include "hbinit.h"


HB_FUNC( XRODAIMP );
HB_FUNC_EXTERN( DOEVENTS );
HB_FUNC_EXTERN( HB_THREADDETACH );
HB_FUNC_EXTERN( HB_THREADQUITREQUEST );
HB_FUNC( XRETLARGURA );
HB_FUNC( DOMATRIZ );
HB_FUNC_EXTERN( HB_THREADSTART );
HB_FUNC( TESTBROW );
HB_FUNC( GETTEXTOTAM );
HB_FUNC_EXTERN( GETCAMPOSDIC );
HB_FUNC_EXTERN( GETCAMPOSINF );
HB_FUNC_EXTERN( GETREG );
HB_FUNC_EXTERN( EMPTY );
HB_FUNC_EXTERN( GETSQL );
HB_FUNC_EXTERN( SELECT );
HB_FUNC_EXTERN( DBSELECTAREA );
HB_FUNC_EXTERN( DBCLOSEAREA );
HB_FUNC_EXTERN( SAVELOG );
HB_FUNC_EXTERN( GETCONEXAO );
HB_FUNC_EXTERN( YAVISO );
HB_FUNC_EXTERN( ALLTRIM );
HB_FUNC_EXTERN( PADL );
HB_FUNC_EXTERN( TRANSFORM );
HB_FUNC_EXTERN( STR );
HB_FUNC_STATIC( QTACENTO );
HB_FUNC_EXTERN( AADD );
HB_FUNC_EXTERN( PADR );
HB_FUNC_EXTERN( LEN );
HB_FUNC_EXTERN( AEVAL );
HB_FUNC_EXTERN( ACLONE );
HB_FUNC( XBROWSER );
HB_FUNC_EXTERN( _DUMMY );
HB_FUNC_EXTERN( _DEFINEWINDOW );
HB_FUNC_EXTERN( LEFT );
HB_FUNC( XPAINTBROWSER );
HB_FUNC_EXTERN( GETPROPERTY );
HB_FUNC_EXTERN( _ENDWINDOW );
HB_FUNC_EXTERN( HB_ANSITOOEM );
HB_FUNC_EXTERN( _DEFINELABEL );
HB_FUNC_EXTERN( _SHOWWINDOW );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATEALL );
HB_FUNC_EXTERN( ASCAN );
HB_FUNC_EXTERN( HMG_UPPER );
HB_FUNC_EXTERN( INSTALLEVENTHANDLER );
HB_FUNC_EXTERN( _SETFONT );
HB_FUNC_EXTERN( GETCONTROLHANDLE );
HB_FUNC_EXTERN( GETTEXTWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAWIDTH );
HB_FUNC_EXTERN( BT_CLIENTAREAHEIGHT );
HB_FUNC_EXTERN( BT_BITMAPLOADFILE );
HB_FUNC_EXTERN( BT_BITMAPCREATENEW );
HB_FUNC_EXTERN( BT_CREATEDC );
HB_FUNC_EXTERN( BT_DRAWGRADIENTFILLVERTICAL );
HB_FUNC_EXTERN( HB_UTF8TOSTR );
HB_FUNC_EXTERN( BT_DRAWTEXT );
HB_FUNC_EXTERN( BT_DELETEDC );
HB_FUNC_EXTERN( SUBSTR );
HB_FUNC_EXTERN( AT );
HB_FUNC( EVENTBROWSER );
HB_FUNC_EXTERN( XOPSELPOS );
HB_FUNC_EXTERN( SETWINDOWCURSOR );
HB_FUNC_EXTERN( XLIMPSUB );
HB_FUNC_EXTERN( BT_CLIENTAREAINVALIDATERECT );
HB_FUNC_EXTERN( ERRORSYS );
HB_FUNC_INITSTATICS();


HB_INIT_SYMBOLS_BEGIN( hb_vm_SymbolInit_XBROWSER )
{ "XRODAIMP", {HB_FS_PUBLIC | HB_FS_FIRST | HB_FS_LOCAL}, {HB_FUNCNAME( XRODAIMP )}, NULL },
{ "DOEVENTS", {HB_FS_PUBLIC}, {HB_FUNCNAME( DOEVENTS )}, NULL },
{ "HB_THREADDETACH", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_THREADDETACH )}, NULL },
{ "HB_THREADQUITREQUEST", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_THREADQUITREQUEST )}, NULL },
{ "XRETLARGURA", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XRETLARGURA )}, NULL },
{ "DOMATRIZ", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( DOMATRIZ )}, NULL },
{ "HB_THREADSTART", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_THREADSTART )}, NULL },
{ "TESTBROW", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( TESTBROW )}, NULL },
{ "GETTEXTOTAM", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( GETTEXTOTAM )}, NULL },
{ "AMTRHEADER", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETCAMPOSDIC", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCAMPOSDIC )}, NULL },
{ "GETCAMPOSINF", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCAMPOSINF )}, NULL },
{ "GETREG", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETREG )}, NULL },
{ "CSQ2", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CFILTRO1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "EMPTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( EMPTY )}, NULL },
{ "GETSQL", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETSQL )}, NULL },
{ "SELECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( SELECT )}, NULL },
{ "DBSELECTAREA", {HB_FS_PUBLIC}, {HB_FUNCNAME( DBSELECTAREA )}, NULL },
{ "DBCLOSEAREA", {HB_FS_PUBLIC}, {HB_FUNCNAME( DBCLOSEAREA )}, NULL },
{ "CSQLX2", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "SAVELOG", {HB_FS_PUBLIC}, {HB_FUNCNAME( SAVELOG )}, NULL },
{ "NF1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "GETCONEXAO", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCONEXAO )}, NULL },
{ "QUERY", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "NETERR", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "YAVISO", {HB_FS_PUBLIC}, {HB_FUNCNAME( YAVISO )}, NULL },
{ "QUEBRA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ERROR", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "LASTREC", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "GETROW", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "OROW", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "CVALOR", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "ALLTRIM", {HB_FS_PUBLIC}, {HB_FUNCNAME( ALLTRIM )}, NULL },
{ "FIELDGET", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "LNUM", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "PADL", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADL )}, NULL },
{ "TRANSFORM", {HB_FS_PUBLIC}, {HB_FUNCNAME( TRANSFORM )}, NULL },
{ "STR", {HB_FS_PUBLIC}, {HB_FUNCNAME( STR )}, NULL },
{ "QTACENTO", {HB_FS_STATIC | HB_FS_LOCAL}, {HB_FUNCNAME( QTACENTO )}, NULL },
{ "NQACENTO", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "AADD", {HB_FS_PUBLIC}, {HB_FUNCNAME( AADD )}, NULL },
{ "PADR", {HB_FS_PUBLIC}, {HB_FUNCNAME( PADR )}, NULL },
{ "LEN", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEN )}, NULL },
{ "C1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "AEVAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( AEVAL )}, NULL },
{ "DESTROY", {HB_FS_PUBLIC | HB_FS_MESSAGE}, {NULL}, NULL },
{ "ACLONE", {HB_FS_PUBLIC}, {HB_FUNCNAME( ACLONE )}, NULL },
{ "XBROWSER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XBROWSER )}, NULL },
{ "NITEMSUBHEIGHT", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_DUMMY", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DUMMY )}, NULL },
{ "_DEFINEWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINEWINDOW )}, NULL },
{ "LEFT", {HB_FS_PUBLIC}, {HB_FUNCNAME( LEFT )}, NULL },
{ "XPAINTBROWSER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( XPAINTBROWSER )}, NULL },
{ "GETPROPERTY", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETPROPERTY )}, NULL },
{ "_HMG_SYSDATA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_ENDWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _ENDWINDOW )}, NULL },
{ "HB_ANSITOOEM", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_ANSITOOEM )}, NULL },
{ "XFONT1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "_DEFINELABEL", {HB_FS_PUBLIC}, {HB_FUNCNAME( _DEFINELABEL )}, NULL },
{ "_SHOWWINDOW", {HB_FS_PUBLIC}, {HB_FUNCNAME( _SHOWWINDOW )}, NULL },
{ "BT_CLIENTAREAINVALIDATEALL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATEALL )}, NULL },
{ "ASCAN", {HB_FS_PUBLIC}, {HB_FUNCNAME( ASCAN )}, NULL },
{ "HMG_UPPER", {HB_FS_PUBLIC}, {HB_FUNCNAME( HMG_UPPER )}, NULL },
{ "INSTALLEVENTHANDLER", {HB_FS_PUBLIC}, {HB_FUNCNAME( INSTALLEVENTHANDLER )}, NULL },
{ "_SETFONT", {HB_FS_PUBLIC}, {HB_FUNCNAME( _SETFONT )}, NULL },
{ "GETCONTROLHANDLE", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETCONTROLHANDLE )}, NULL },
{ "GETTEXTWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( GETTEXTWIDTH )}, NULL },
{ "BT_CLIENTAREAWIDTH", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAWIDTH )}, NULL },
{ "BT_CLIENTAREAHEIGHT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAHEIGHT )}, NULL },
{ "BT_BITMAPLOADFILE", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPLOADFILE )}, NULL },
{ "NTAMSUBMENUCONSULTA", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "BT_BITMAPCREATENEW", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_BITMAPCREATENEW )}, NULL },
{ "BT_CREATEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CREATEDC )}, NULL },
{ "BT_DRAWGRADIENTFILLVERTICAL", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWGRADIENTFILLVERTICAL )}, NULL },
{ "N1", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "HB_UTF8TOSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( HB_UTF8TOSTR )}, NULL },
{ "BT_DRAWTEXT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DRAWTEXT )}, NULL },
{ "BT_DELETEDC", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_DELETEDC )}, NULL },
{ "SUBSTR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SUBSTR )}, NULL },
{ "AT", {HB_FS_PUBLIC}, {HB_FUNCNAME( AT )}, NULL },
{ "EVENTBROWSER", {HB_FS_PUBLIC | HB_FS_LOCAL}, {HB_FUNCNAME( EVENTBROWSER )}, NULL },
{ "XOPSELPOS", {HB_FS_PUBLIC}, {HB_FUNCNAME( XOPSELPOS )}, NULL },
{ "SETWINDOWCURSOR", {HB_FS_PUBLIC}, {HB_FUNCNAME( SETWINDOWCURSOR )}, NULL },
{ "CURSORHAND", {HB_FS_PUBLIC | HB_FS_MEMVAR}, {NULL}, NULL },
{ "XLIMPSUB", {HB_FS_PUBLIC}, {HB_FUNCNAME( XLIMPSUB )}, NULL },
{ "BT_CLIENTAREAINVALIDATERECT", {HB_FS_PUBLIC}, {HB_FUNCNAME( BT_CLIENTAREAINVALIDATERECT )}, NULL },
{ "ERRORSYS", {HB_FS_PUBLIC}, {HB_FUNCNAME( ERRORSYS )}, NULL },
{ "(_INITSTATICS00015)", {HB_FS_INITEXIT | HB_FS_LOCAL}, {hb_INITSTATICS}, NULL }
HB_INIT_SYMBOLS_EX_END( hb_vm_SymbolInit_XBROWSER, "Prg\\xBrowser.Prg", 0x0, 0x0003 )

#if defined( HB_PRAGMA_STARTUP )
   #pragma startup hb_vm_SymbolInit_XBROWSER
#elif defined( HB_DATASEG_STARTUP )
   #define HB_DATASEG_BODY    HB_DATASEG_FUNC( hb_vm_SymbolInit_XBROWSER )
   #include "hbiniseg.h"
#endif

HB_FUNC( XRODAIMP )
{
	static const HB_BYTE pcode[] =
	{
		116,88,0,36,69,0,103,5,0,31,12,36,70,0,
		176,1,0,20,0,25,240,36,75,0,176,2,0,103,
		6,0,20,1,36,76,0,176,3,0,103,6,0,20,
		1,36,80,0,103,7,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XRETLARGURA )
{
	static const HB_BYTE pcode[] =
	{
		116,88,0,36,84,0,103,8,0,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( DOMATRIZ )
{
	static const HB_BYTE pcode[] =
	{
		13,0,2,116,88,0,36,90,0,176,6,0,122,108,
		7,95,1,95,2,12,4,82,6,0,36,92,0,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( TESTBROW )
{
	static const HB_BYTE pcode[] =
	{
		13,31,2,116,88,0,36,99,0,106,1,0,80,3,
		36,100,0,122,80,4,36,107,0,121,80,7,36,114,
		0,93,200,0,80,11,36,115,0,106,4,84,77,80,
		0,80,12,36,117,0,4,0,0,80,13,36,118,0,
		95,2,80,14,36,121,0,121,80,15,36,126,0,9,
		80,17,36,127,0,9,80,18,36,128,0,9,80,19,
		36,129,0,9,80,20,36,131,0,4,0,0,80,21,
		36,135,0,9,80,22,36,139,0,4,0,0,80,23,
		36,142,0,106,8,66,114,95,103,114,105,100,0,80,
		24,36,144,0,4,0,0,80,25,36,145,0,4,0,
		0,80,26,36,149,0,4,0,0,80,27,36,153,0,
		121,80,29,36,155,0,176,8,0,106,1,0,95,1,
		12,2,122,49,80,30,36,157,0,106,7,76,98,108,
		120,48,49,0,80,31,36,165,0,4,0,0,83,9,
		0,36,174,0,176,10,0,95,14,106,2,83,0,120,
		120,12,4,80,5,36,177,0,176,10,0,95,14,106,
		2,83,0,9,9,12,4,80,6,36,179,0,176,11,
		0,95,14,106,4,84,65,77,0,12,2,80,8,36,
		181,0,176,11,0,95,14,106,5,84,73,80,79,0,
		12,2,80,9,36,184,0,176,12,0,95,14,12,1,
		80,10,36,187,0,106,1,0,83,13,0,36,189,0,
		106,1,0,83,14,0,36,191,0,176,15,0,109,14,
		0,12,1,31,33,36,192,0,176,16,0,95,14,9,
		12,2,106,8,32,87,104,101,114,101,32,0,72,109,
		14,0,72,83,13,0,25,16,36,195,0,176,16,0,
		95,14,9,12,2,83,13,0,36,198,0,109,13,0,
		106,33,32,111,114,100,101,114,32,98,121,32,99,111,
		100,105,103,111,32,100,101,115,99,32,108,105,109,105,
		116,32,49,48,48,48,0,72,83,13,0,36,204,0,
		176,17,0,95,12,12,1,121,15,28,20,36,205,0,
		176,18,0,95,12,20,1,36,206,0,176,19,0,20,
		0,36,210,0,95,3,83,20,0,36,212,0,176,21,
		0,106,10,115,116,49,50,49,46,116,120,116,0,109,
		13,0,106,2,13,0,72,106,2,10,0,72,20,2,
		36,216,0,4,0,0,80,27,36,219,0,90,20,106,
		6,65,114,105,97,108,0,92,9,9,9,9,9,4,
		6,0,6,83,22,0,36,220,0,90,20,106,6,65,
		114,105,97,108,0,92,9,120,9,9,9,4,6,0,
		6,83,22,0,36,231,0,4,0,0,80,21,36,238,
		0,176,23,0,12,0,80,28,36,240,0,48,24,0,
		95,28,109,13,0,112,1,80,16,36,242,0,48,25,
		0,95,28,112,0,28,69,36,243,0,176,26,0,106,
		23,69,114,114,111,114,32,101,120,101,99,117,116,105,
		110,103,32,81,117,101,114,121,32,0,109,27,0,72,
		109,13,0,72,106,4,32,58,32,0,72,109,27,0,
		72,48,28,0,95,28,112,0,72,9,20,2,36,244,
		0,9,110,7,36,248,0,48,29,0,95,16,112,0,
		73,36,251,0,48,29,0,95,16,112,0,121,8,28,
		48,36,252,0,176,26,0,106,35,69,115,116,101,32,
		67,97,100,97,115,116,114,111,32,78,227,111,32,80,
		111,115,115,117,105,32,82,101,103,105,115,116,114,111,
		115,0,9,20,2,36,1,1,122,165,80,32,26,63,
		2,36,3,1,4,0,0,80,23,36,4,1,4,0,
		0,80,21,36,6,1,48,30,0,95,16,95,32,112,
		1,83,31,0,36,8,1,120,80,22,36,10,1,122,
		165,80,33,26,87,1,36,14,1,106,1,0,83,32,
		0,36,17,1,176,33,0,95,9,95,33,1,12,1,
		106,2,67,0,8,28,18,36,18,1,48,34,0,109,
		31,0,95,33,112,1,83,32,0,36,27,1,9,83,
		35,0,36,29,1,176,33,0,95,9,95,33,1,12,
		1,106,2,66,0,8,28,62,36,30,1,176,36,0,
		176,33,0,176,37,0,48,34,0,109,31,0,95,33,
		112,1,106,18,64,69,32,57,57,57,44,57,57,57,
		44,57,57,57,46,57,57,0,12,2,12,1,92,14,
		12,2,83,32,0,36,31,1,120,83,35,0,36,34,
		1,176,33,0,95,9,95,33,1,12,1,106,2,73,
		0,8,28,79,36,36,1,95,33,122,15,28,44,36,
		37,1,176,36,0,176,33,0,176,38,0,48,34,0,
		109,31,0,95,33,112,1,12,1,12,1,92,25,12,
		2,83,32,0,36,38,1,120,83,35,0,25,28,36,
		40,1,176,33,0,176,38,0,48,34,0,109,31,0,
		95,33,112,1,12,1,12,1,83,32,0,36,48,1,
		176,33,0,109,32,0,12,1,106,8,73,110,97,116,
		105,118,111,0,5,28,8,36,49,1,9,80,22,36,
		57,1,176,39,0,109,32,0,12,1,83,40,0,36,
		59,1,109,40,0,121,5,28,9,95,8,95,33,1,
		25,11,95,8,95,33,1,109,40,0,72,80,7,36,
		62,1,176,41,0,95,23,176,42,0,109,32,0,95,
		7,12,2,95,7,4,2,0,20,2,36,64,1,176,
		1,0,20,0,36,10,1,175,33,0,176,43,0,98,
		31,0,122,1,12,1,15,29,161,254,36,71,1,106,
		1,0,83,44,0,36,73,1,176,45,0,95,23,89,
		25,0,1,0,0,0,109,44,0,95,1,122,1,106,
		2,32,0,72,72,21,83,44,0,6,20,2,36,75,
		1,95,29,121,8,28,39,36,77,1,176,45,0,95,
		23,89,19,0,1,0,1,0,29,0,96,255,255,95,
		1,92,2,1,139,6,20,2,36,79,1,95,29,82,
		8,0,36,87,1,106,13,65,110,100,97,109,101,110,
		116,111,32,58,32,0,176,33,0,176,38,0,95,32,
		12,1,12,1,72,106,2,47,0,72,176,33,0,176,
		38,0,48,29,0,95,16,112,0,12,1,12,1,72,
		82,9,0,36,91,1,176,41,0,95,27,109,44,0,
		95,22,4,2,0,20,2,36,1,1,175,32,0,48,
		29,0,95,16,112,0,15,29,188,253,36,99,1,48,
		46,0,95,28,112,0,73,36,100,1,100,80,28,36,
		105,1,48,46,0,95,16,112,0,73,36,106,1,100,
		80,16,36,109,1,176,47,0,95,27,12,1,82,7,
		0,36,114,1,120,82,5,0,36,117,1,95,27,110,
		7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XBROWSER )
{
	static const HB_BYTE pcode[] =
	{
		13,0,3,116,88,0,36,124,1,176,47,0,95,1,
		12,1,82,12,0,36,125,1,109,49,0,92,5,49,
		82,11,0,36,142,1,176,50,0,20,0,176,51,0,
		106,12,87,105,110,95,66,114,111,119,115,101,114,0,
		106,9,120,66,114,111,119,115,101,114,0,176,52,0,
		95,2,92,4,12,2,72,92,15,93,145,0,93,114,
		6,103,10,0,103,11,0,65,9,9,120,120,120,9,
		106,1,0,100,100,100,100,100,100,93,255,0,93,255,
		0,93,255,0,4,3,0,90,42,176,53,0,176,54,
		0,98,55,0,93,60,1,1,106,5,78,97,109,101,
		0,12,2,103,12,0,103,2,0,103,13,0,103,3,
		0,103,4,0,12,6,6,9,9,9,100,120,100,100,
		100,100,100,100,100,176,43,0,103,12,0,12,1,103,
		11,0,65,95,3,93,232,3,72,100,100,100,100,100,
		100,9,100,100,100,9,100,100,100,100,100,100,100,100,
		100,9,20,56,36,143,1,176,56,0,20,0,36,148,
		1,106,8,76,97,98,101,108,120,49,0,98,55,0,
		93,160,1,2,100,98,55,0,93,161,1,2,100,98,
		55,0,93,176,1,2,100,98,55,0,93,175,1,2,
		100,98,55,0,93,178,1,2,100,98,55,0,93,164,
		1,2,100,98,55,0,93,165,1,2,100,98,55,0,
		93,166,1,2,100,98,55,0,93,167,1,2,9,98,
		55,0,93,203,1,2,9,98,55,0,93,204,1,2,
		9,98,55,0,93,205,1,2,9,98,55,0,93,206,
		1,2,9,98,55,0,93,207,1,2,100,98,55,0,
		93,201,1,2,100,98,55,0,93,202,1,2,100,98,
		55,0,93,163,1,2,100,98,55,0,93,173,1,2,
		9,98,55,0,93,174,1,2,9,98,55,0,93,156,
		1,2,9,98,55,0,93,157,1,2,9,98,55,0,
		93,158,1,2,9,98,55,0,93,159,1,2,100,98,
		55,0,93,168,1,2,9,98,55,0,93,184,1,2,
		9,98,55,0,93,153,1,2,9,98,55,0,93,137,
		1,2,9,98,55,0,93,25,1,2,9,98,55,0,
		93,131,1,2,36,149,1,106,12,87,105,110,95,66,
		114,111,119,115,101,114,0,98,55,0,93,161,1,2,
		36,150,1,92,95,98,55,0,93,175,1,2,36,151,
		1,92,20,98,55,0,93,176,1,2,36,152,1,92,
		120,98,55,0,93,164,1,2,36,153,1,92,24,98,
		55,0,93,165,1,2,36,154,1,176,57,0,106,17,
		65,118,105,115,111,32,73,110,102,111,114,109,97,231,
		227,111,0,12,1,98,55,0,93,178,1,2,36,155,
		1,109,58,0,98,55,0,93,166,1,2,36,156,1,
		92,9,98,55,0,93,167,1,2,36,157,1,106,1,
		0,98,55,0,93,168,1,2,36,158,1,120,98,55,
		0,93,156,1,2,36,159,1,9,98,55,0,93,157,
		1,2,36,160,1,9,98,55,0,93,159,1,2,36,
		161,1,9,98,55,0,93,158,1,2,36,162,1,100,
		98,55,0,93,173,1,2,36,163,1,9,98,55,0,
		93,174,1,2,36,164,1,120,98,55,0,93,207,1,
		2,36,165,1,90,4,100,6,98,55,0,93,163,1,
		2,36,166,1,9,98,55,0,93,153,1,2,36,167,
		1,100,98,55,0,93,201,1,2,36,168,1,93,150,
		0,93,150,0,93,150,0,4,3,0,98,55,0,93,
		202,1,2,36,169,1,176,59,0,98,55,0,93,160,
		1,1,98,55,0,93,161,1,1,98,55,0,93,176,
		1,1,98,55,0,93,175,1,1,98,55,0,93,178,
		1,1,98,55,0,93,164,1,1,98,55,0,93,165,
		1,1,98,55,0,93,166,1,1,98,55,0,93,167,
		1,1,98,55,0,93,156,1,1,98,55,0,93,203,
		1,1,98,55,0,93,204,1,1,98,55,0,93,205,
		1,1,98,55,0,93,206,1,1,98,55,0,93,207,
		1,1,98,55,0,93,201,1,1,98,55,0,93,202,
		1,1,98,55,0,93,163,1,1,98,55,0,93,168,
		1,1,98,55,0,93,173,1,1,98,55,0,93,174,
		1,1,98,55,0,93,157,1,1,98,55,0,93,159,
		1,1,98,55,0,93,158,1,1,98,55,0,93,153,
		1,1,98,55,0,93,184,1,1,98,55,0,93,137,
		1,1,98,55,0,93,25,1,1,98,55,0,93,131,
		1,1,20,29,36,173,1,176,60,0,106,12,87,105,
		110,95,66,114,111,119,115,101,114,0,20,1,36,176,
		1,176,61,0,106,12,87,105,110,95,66,114,111,119,
		115,101,114,0,20,1,36,179,1,176,62,0,98,55,
		0,92,60,1,176,33,0,176,63,0,106,13,69,118,
		101,110,116,66,114,111,119,115,101,114,0,12,1,12,
		1,12,2,121,5,28,25,36,180,1,176,64,0,106,
		13,69,118,101,110,116,66,114,111,119,115,101,114,0,
		20,1,36,194,1,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( GETTEXTOTAM )
{
	static const HB_BYTE pcode[] =
	{
		13,1,2,36,203,1,176,65,0,176,66,0,106,8,
		76,98,108,77,115,103,49,0,95,2,12,2,106,23,
		76,117,99,105,100,97,32,83,97,110,115,32,84,121,
		112,101,119,114,105,116,101,114,0,92,9,9,9,9,
		9,12,7,80,3,36,205,1,176,67,0,121,106,2,
		76,0,95,3,12,3,122,72,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( XPAINTBROWSER )
{
	static const HB_BYTE pcode[] =
	{
		13,23,6,116,88,0,36,210,1,106,6,66,65,67,
		75,49,0,80,7,36,212,1,93,170,0,80,8,36,
		224,1,121,80,13,36,230,1,103,11,0,176,43,0,
		95,2,12,1,65,80,14,36,235,1,176,68,0,95,
		1,12,1,80,16,36,236,1,176,69,0,95,1,12,
		1,80,17,36,239,1,122,80,18,36,240,1,121,80,
		19,36,241,1,121,80,20,36,242,1,106,1,0,80,
		21,36,244,1,176,70,0,106,7,79,75,77,65,82,
		75,0,12,1,80,22,36,246,1,106,23,76,117,99,
		105,100,97,32,83,97,110,115,32,84,121,112,101,119,
		114,105,116,101,114,0,80,23,36,249,1,176,70,0,
		106,11,83,69,84,65,84,82,65,78,83,80,0,12,
		1,80,24,36,251,1,176,54,0,95,1,106,11,86,
		115,99,114,111,108,108,66,97,114,0,106,6,86,97,
		108,117,101,0,12,3,66,80,25,36,254,1,109,71,
		0,80,26,36,0,2,121,80,27,36,2,2,120,80,
		28,36,23,2,176,72,0,95,8,95,14,121,121,121,
		4,3,0,12,3,80,15,36,25,2,176,73,0,95,
		15,92,5,96,9,0,12,3,80,11,36,28,2,176,
		73,0,95,1,92,4,96,10,0,12,3,80,12,36,
		31,2,95,3,121,5,28,42,36,33,2,176,74,0,
		95,12,121,121,95,16,95,17,93,255,0,93,255,0,
		93,255,0,4,3,0,93,255,0,93,255,0,93,255,
		0,4,3,0,20,7,36,37,2,95,4,121,15,28,
		47,36,38,2,176,74,0,95,12,95,4,103,11,0,
		65,121,95,16,95,14,93,255,0,93,255,0,93,255,
		0,4,3,0,93,255,0,93,255,0,93,255,0,4,
		3,0,20,7,36,47,2,122,165,83,75,0,26,219,
		0,36,53,2,176,76,0,95,2,109,75,0,1,122,
		1,12,1,80,21,36,57,2,95,3,121,15,28,107,
		95,3,109,75,0,5,28,99,36,60,2,122,80,18,
		36,63,2,176,74,0,95,12,95,13,95,25,72,121,
		95,16,103,11,0,121,121,121,4,3,0,93,128,0,
		93,128,0,93,128,0,4,3,0,20,7,36,66,2,
		176,77,0,95,12,95,13,95,25,72,92,15,95,21,
		95,23,92,9,121,92,106,93,133,0,4,3,0,93,
		132,0,93,134,0,93,200,0,4,3,0,92,3,95,
		19,95,20,20,11,25,65,36,74,2,122,80,18,36,
		76,2,121,92,106,93,133,0,4,3,0,80,29,36,
		94,2,176,77,0,95,12,95,13,95,25,72,92,15,
		95,21,95,23,92,9,95,29,93,255,0,93,255,0,
		93,255,0,4,3,0,95,18,95,19,95,20,20,11,
		36,104,2,96,13,0,103,11,0,135,36,47,2,109,
		75,0,23,21,83,75,0,176,43,0,95,2,12,1,
		15,29,32,255,36,111,2,176,78,0,95,9,20,1,
		36,112,2,176,78,0,95,10,20,1,36,116,2,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_STATIC( QTACENTO )
{
	static const HB_BYTE pcode[] =
	{
		13,15,1,36,121,2,106,1,0,80,2,36,122,2,
		121,80,3,36,123,2,121,80,4,36,124,2,106,11,
		97,101,105,111,117,65,69,73,79,85,0,80,5,36,
		125,2,106,11,225,233,237,243,250,193,201,205,211,218,
		0,80,6,36,126,2,106,11,226,234,238,244,251,194,
		202,206,212,219,0,80,7,36,127,2,106,11,228,235,
		239,246,252,196,203,207,214,220,0,80,8,36,128,2,
		106,11,224,232,236,242,249,192,200,204,210,217,0,80,
		9,36,129,2,106,5,227,245,195,213,0,80,10,36,
		130,2,106,3,231,199,0,80,11,36,131,2,106,5,
		38,108,116,59,0,47,80,12,36,132,2,106,5,38,
		103,116,59,0,47,80,13,36,133,2,9,80,14,36,
		134,2,121,80,15,36,135,2,4,0,0,80,16,36,
		137,2,122,165,80,3,26,4,1,36,138,2,176,79,
		0,95,1,95,3,122,12,3,80,2,36,139,2,95,
		2,95,6,95,7,72,95,8,72,95,11,72,95,10,
		72,95,9,72,24,29,213,0,36,140,2,176,80,0,
		95,2,95,6,12,2,80,4,36,141,2,95,4,121,
		15,28,14,36,142,2,120,80,14,36,143,2,174,15,
		0,36,145,2,176,80,0,95,2,95,7,12,2,80,
		4,36,146,2,95,4,121,15,28,14,36,147,2,120,
		80,14,36,148,2,174,15,0,36,150,2,176,80,0,
		95,2,95,8,12,2,80,4,36,151,2,95,4,121,
		15,28,14,36,152,2,120,80,14,36,153,2,174,15,
		0,36,155,2,176,80,0,95,2,95,9,12,2,80,
		4,36,156,2,95,4,121,15,28,14,36,157,2,120,
		80,14,36,158,2,174,15,0,36,160,2,176,80,0,
		95,2,95,10,12,2,80,4,36,161,2,95,4,121,
		15,28,14,36,162,2,120,80,14,36,163,2,174,15,
		0,36,165,2,176,80,0,95,2,95,11,12,2,80,
		4,36,166,2,95,4,121,15,28,14,36,167,2,120,
		80,14,36,168,2,174,15,0,36,137,2,175,3,0,
		176,43,0,95,1,12,1,15,29,247,254,36,173,2,
		95,12,95,1,24,28,14,36,174,2,120,80,14,36,
		175,2,174,15,0,36,177,2,95,13,95,1,24,28,
		14,36,178,2,120,80,14,36,179,2,174,15,0,36,
		184,2,95,15,110,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC( EVENTBROWSER )
{
	static const HB_BYTE pcode[] =
	{
		13,9,4,116,88,0,36,190,2,106,1,0,80,5,
		36,191,2,121,80,6,36,192,2,121,80,7,36,194,
		2,121,80,8,36,195,2,106,1,0,80,9,36,197,
		2,121,80,10,36,199,2,121,80,11,36,200,2,121,
		80,12,36,201,2,121,80,13,36,209,2,95,1,176,
		54,0,106,12,87,105,110,95,66,114,111,119,115,101,
		114,0,106,7,72,65,78,68,76,69,0,12,2,8,
		29,196,2,36,212,2,95,2,93,163,2,8,28,38,
		36,213,2,121,82,13,0,36,214,2,121,82,2,0,
		36,216,2,176,61,0,106,12,87,105,110,95,66,114,
		111,119,115,101,114,0,20,1,36,223,2,95,2,93,
		0,2,8,29,135,1,36,226,2,103,15,0,121,15,
		28,6,36,227,2,7,36,231,2,103,2,0,121,15,
		28,47,95,3,92,90,69,28,40,36,232,2,103,2,
		0,176,82,0,106,12,87,105,110,95,66,114,111,119,
		115,101,114,0,121,121,121,103,11,0,12,5,5,28,
		6,36,233,2,7,36,238,2,95,3,92,90,69,28,
		33,36,239,2,176,82,0,106,12,87,105,110,95,66,
		114,111,119,115,101,114,0,121,121,121,103,11,0,12,
		5,82,2,0,36,245,2,176,54,0,106,12,87,105,
		110,95,66,114,111,119,115,101,114,0,106,11,86,115,
		99,114,111,108,108,66,97,114,0,106,6,86,97,108,
		117,101,0,12,3,66,80,10,36,249,2,103,2,0,
		176,43,0,103,12,0,12,1,34,28,34,36,250,2,
		103,12,0,103,2,0,1,92,2,1,31,19,36,251,
		2,176,83,0,95,1,93,0,127,20,2,36,252,2,
		7,36,0,3,176,83,0,95,1,109,84,0,20,2,
		36,2,3,103,13,0,121,15,28,61,36,3,3,176,
		85,0,106,12,87,105,110,95,66,114,111,119,115,101,
		114,0,104,13,0,104,2,0,121,103,11,0,176,54,
		0,106,12,87,105,110,95,66,114,111,119,115,101,114,
		0,106,6,87,105,100,116,104,0,12,2,20,6,36,
		7,3,103,2,0,121,15,28,13,36,8,3,103,2,
		0,82,13,0,25,6,36,10,3,7,36,14,3,103,
		2,0,121,15,28,68,36,16,3,176,86,0,106,12,
		87,105,110,95,66,114,111,119,115,101,114,0,95,10,
		103,2,0,122,49,103,11,0,65,72,121,176,54,0,
		106,12,87,105,110,95,66,114,111,119,115,101,114,0,
		106,6,87,105,100,116,104,0,12,2,103,11,0,120,
		20,6,36,25,3,95,2,93,1,2,8,29,249,0,
		36,27,3,176,82,0,106,12,87,105,110,95,66,114,
		111,119,115,101,114,0,121,121,121,103,11,0,12,5,
		80,13,36,30,3,176,54,0,106,12,87,105,110,95,
		66,114,111,119,115,101,114,0,106,11,86,115,99,114,
		111,108,108,66,97,114,0,106,6,86,97,108,117,101,
		0,12,3,66,80,10,36,32,3,103,2,0,82,13,
		0,36,34,3,103,13,0,121,15,28,61,36,35,3,
		176,85,0,106,12,87,105,110,95,66,114,111,119,115,
		101,114,0,104,13,0,104,2,0,121,103,11,0,176,
		54,0,106,12,87,105,110,95,66,114,111,119,115,101,
		114,0,106,6,87,105,100,116,104,0,12,2,20,6,
		36,39,3,95,13,82,2,0,36,41,3,103,2,0,
		121,15,28,68,36,42,3,176,86,0,106,12,87,105,
		110,95,66,114,111,119,115,101,114,0,95,10,103,2,
		0,122,49,103,11,0,65,72,121,176,54,0,106,12,
		87,105,110,95,66,114,111,119,115,101,114,0,106,6,
		87,105,100,116,104,0,12,2,103,11,0,120,20,6,
		36,46,3,95,13,82,15,0,36,56,3,7
	};

	hb_vmExecute( pcode, symbols );
}

HB_FUNC_INITSTATICS()
{
	static const HB_BYTE pcode[] =
	{
		117,88,0,15,0,116,88,0,121,82,1,0,121,82,
		2,0,9,82,3,0,120,82,4,0,9,82,5,0,
		100,82,6,0,4,0,0,82,7,0,121,82,8,0,
		106,1,0,82,9,0,92,35,82,10,0,121,82,11,
		0,4,0,0,82,12,0,121,82,13,0,106,1,0,
		82,14,0,121,82,15,0,7
	};

	hb_vmExecute( pcode, symbols );
}

