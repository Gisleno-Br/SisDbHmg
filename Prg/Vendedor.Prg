#require "rddsql"
#require "sddmy"

#include <hmg.ch>

// #include "hmg.ch"




* ** CONSTANTS ( nControl ) ** *
#define _GRID_COLUMNCAPTION_    7
#define _GRID_COLUMNWIDTH_      31
#define _GRID_COLUMNJUSTIFY_    37
#define _GRID_COLUMNCONTROLS_   2
#define _GRID_DYNAMICBACKCOLOR_ 3
#define _GRID_DYNAMICFORECOLOR_ 4
#define _GRID_COLUMNVALID_      5
#define _GRID_COLUMNWHEN_       6
#define _GRID_ONHEADCLICK_      17




#include "dbinfo.ch"
#include "error.ch"

#define COLUNA  1
#define TAMANHO 2
#define TEXTO   3



#define QUEBRA Chr(13)+Chr(10)
#define WM_HSCROLL          276

#define WS_BORDER           0x00800000
#define WM_SETREDRAW        0x0b
#define WM_SETFOCUS 7
#define NROWINI 53
#include "dbinfo.ch"
#include "error.ch"

#define WM_CLOSE            0x0010

#include "hmg.ch"

#define IDC_BTN_1   2001
#define IDC_BTN_2   2002
#define IDC_BTN_3   2003
#define IDC_BTN_4   2104
#define IDC_BTN_5   2005
// #define IDC_BTN_YES 201
// #define IDC_BTN_NO  1102

#define FONTCOR {0,106,133}
#define BACK1 {229,237,242}

#define CORSEL     {216,228,236}

/*
#define DBI_QUERY             1001
#define RDDI_CONNECT          1001
#define RDDI_DISCONNECT       1002
#define RDDI_EXECUTE          1003
#define RDDI_ERROR            1004
#define RDDI_ERRORNO          1005
#define RDDI_NEWID            1006
#define RDDI_AFFECTEDROWS     1007
#define RDDI_QUERY            1008
*/




REQUEST SDDMY, SQLMIX

// ANNOUNCE RDDSYS

STATIC nIndexEvent := 1

// STATIC aButtons := {}


Define Window Main

// REQUEST HB_LANG_PT
// REQUEST HB_CODEPAGE_PT850


FUNCTION MntVend()

   LOCAL wCad := 'vendedores'
   LOCAL aOp1 := { 'Consultas', 'Relatorios', 'Parametros' }

   LOCAL cControl

   LOCAL  aButOpcoes := {  { "&Incluir", {|| ( fx2( "I")  )     }, .T., "Cadastra um Novo Vendedor", 0 }, ;
      { "&Modificar", {||  fx2( "edit" )   }, .T., "Modifica um Vendedor Existente.", 0 }, ;
      { "&Bloquear", {||  fx1( "bloquear" ) }, .T., "Bloqueia/Inativa um Vendedor Ativo.", 0 }, ;
      { "&Filtrar", {|| ProcFiltro( 'vendedores' )    }, .T., "Filtra Registros", 0 }, ;
      { hb_ANSIToOEM( "Opções" ), {|| xSetOpcao()  }, .T., hb_ANSIToOEM( "Opções Diversas" ), 0 } }



   LOCAL aOp2 := { { '2-Geral', {|| msginfo( 'ok') } },   ;
      { '2-Geral1', {|| msginfo( 'ok1' ) } }, ;
      { '2-Geral2', {|| msginfo( 'ok3' ) } }, ;
      { '3-Geral4', {|| msginfo( 'ok4' ) } }, ;
      { '3-Geral', {|| msginfo( 'ok5' ) } } }


   LOCAL aTam    := GetCamposInf( wCad, 'TAM' )
   LOCAL aCabec  := GetCamposInf( wCad, 'CABEC' )
   LOCAL aCampos := GetCamposDic( wCad, 'S', .T. )



   PRIVATE nItMax := 18
   PRIVATE nItx1  := nItMax

   PRIVATE nItemId := 0

   PRIVATE lArrastou := .F.

   PRIVATE lDrag     := .F.
   PRIVATE nObjDrag  := 0

   PRIVATE lDrawOk := .F.

   PRIVATE cButVerde := ".&Filtrar."



   PRIVATE nRowIni2 := 10

   PRIVATE cTituloJan := ''
   PRIVATE nQRegx     := 0

   PRIVATE nColOrder  := 0


   PRIVATE lAumentou := .F.

   PRIVATE aMtrHeader := {}

   PRIVATE nEven1 := 0
   PRIVATE nEven2 := 0


   PRIVATE aFont2 := ARRAY FONT "Arial" SIZE 9 BOLD ITALIC
   PRIVATE aFont1 := ARRAY FONT "Arial" SIZE 9




   PRIVATE nGradDirF  := 0
   PRIVATE cFontName  := 'Arial'
   PRIVATE nFontSize  := 9

   PRIVATE aBtnFont  := { cFontName, 8, .F., .F., .F., .F. }


   PRIVATE nPosAnt  := -1


   PRIVATE nInd2 := 0

   PRIVATE lAscendente := .T.

   PRIVATE lDragMode := .F.

   PRIVATE lDrawHead := .F.
   PRIVATE nSec11    := 0



   PRIVATE nSaveScr := 0

   PRIVATE nColIni := 0

   PRIVATE lOkCad := .F.

   PRIVATE nColSel := 0

   PRIVATE nIndexEve1 := 0

   PRIVATE cLblConsu := ''

   PRIVATE lSoltou := .F.

   PRIVATE nTotWidth := 0

   PRIVATE nObjSize := 0
   PRIVATE lmodeSize := .F.

   PRIVATE cBufHeader := ''

   PRIVATE aButx1 := {}

   // SET CODEPAGE TO PORTUGUESE
// REQUEST HB_LANG_PT
// REQUEST HB_CODEPAGE_PT850

// HB_SetCodePage( "PT850" )


   _HMG_SYSDATA[ 348 ] := { 199, 250, 225 }
   _HMG_SYSDATA[ 349 ] := { 007, 071, 041 }
   _HMG_SYSDATA[ 350 ] := { 235, 237, 095 }
   _HMG_SYSDATA[ 351 ] := { 069, 015, 135 }

   ManutDb( aCabec, aCampos,  GetSql( "Vendedores", .F. ), "Vende", aTam, "Cadastro de Vendedores", "Vendedores", aOp1, aOp2, aButOpcoes )

RETURN


STATIC FUNCTION Fx2()

RETURN
