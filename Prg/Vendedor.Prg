#require "rddsql"
#require "sddmy"

#include <hmg.ch>

//#include "hmg.ch"




*** CONSTANTS (nControl) ***
#Define _GRID_COLUMNCAPTION_    7
#Define _GRID_COLUMNWIDTH_      31
#Define _GRID_COLUMNJUSTIFY_    37
#Define _GRID_COLUMNCONTROLS_   2
#Define _GRID_DYNAMICBACKCOLOR_ 3
#Define _GRID_DYNAMICFORECOLOR_ 4
#Define _GRID_COLUMNVALID_      5
#Define _GRID_COLUMNWHEN_       6
#Define _GRID_ONHEADCLICK_      17


#include "dbinfo.ch"
#include "error.ch"

#DEFINE COLUNA  1
#DEFINE TAMANHO 2
#DEFINE TEXTO   3



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

//ANNOUNCE RDDSYS

STATIC nIndexEvent := 1

//STATIC aButtons := {}


Define Window Main

//REQUEST HB_LANG_PT
//REQUEST HB_CODEPAGE_PT850


FUNCTION MntVend()

	LOCAL wCad := 'vendedores'
	Local aOp1 := {'Consultas','Relatorios','Parametros' }

	Local cControl

	Local  aButOpcoes := {  { "&Incluir", {|| ( fx2( "I")  )     }, .T., "Cadastra um Novo Vendedor", 0 }, ;
		{ "&Modificar", {||  fx2("edit")   } , .T., "Modifica um Vendedor Existente." , 0 }, ;
		{ "&Bloquear", {||  fx1( "bloquear" ) }, .T., "Bloqueia/Inativa um Vendedor Ativo.", 0 } ,;
		{ "&Filtrar", {|| ProcFiltro( 'vendedores' )    }, .T., "Filtra Registros", 0 } ,;
		{ Hb_AnsiToOem("Opções") , {|| xSetOpcao()  }, .T., Hb_AnsiToOem("Opções Diversas") , 0 } }



	Local aOp2 := { {'2-Geral' , { || msginfo('ok') } } ,   ;
		{'2-Geral1' , { || msginfo('ok1')} },;
		{'2-Geral2' , { || msginfo('ok3')} } ,;
		{'3-Geral4' , { || msginfo('ok4') } },;
		{'3-Geral' , { || msginfo('ok5') } } }


	LOCAL aTam    := GetCamposInf( wCad, 'TAM' )
	LOCAL aCabec  := GetCamposInf( wCad, 'CABEC' )
	LOCAL aCampos := GetCamposDic( wCad, 'S', .T. )



	Private nItMax := 18
	Private nItx1  := nItMax

	Private nItemId := 0

	Private lArrastou := .f.

	Private lDrag     := .f.
	Private nObjDrag  := 0

	Private lDrawOk := .f.

	private cButVerde := ".&Filtrar."

	//Private nTotWidth := 0

	Private nRowIni2 := 10

	Private cTituloJan := ''
	Private nQRegx     := 0

	Private nColOrder  := 0


	Private lAumentou := .f.

	Private aMtrHeader := {}

	Private nEven1 := 0
	Private nEven2 := 0


	Private aFont2 := ARRAY FONT "Arial" SIZE 9 BOLD ITALIC
	Private aFont1 := ARRAY FONT "Arial" SIZE 9
	//BOLD ITALIC


	PRIVATE nGradDirF  := 0
	PRIVATE cFontName  := 'Arial'
	PRIVATE nFontSize  := 9

	PRIVATE aBtnFont  := { cFontName , 8 , .F., .F., .F., .F. }


	Private nPosAnt  := -1


	Private nInd2 := 0

	Private lAscendente := .t.

	Private lDragMode := .f.

	Private lDrawHead := .f.
	Private nSec11    := 0


	Private nSaveScr := 0

	Private nColIni := 0

	Private lOkCad := .f.

	Private nColSel := 0

	Private nIndexEve1 := 0


	Private cLblConsu := ''

	Private lSoltou := .f.

	Private nTotWidth := 0

	Private nObjSize := 0
	Private lmodeSize := .f.

	Private cBufHeader := ''

	Private aButx1 := {}


    /*
	SET LANGUAGE TO PORTUGUESE
	SET CODEPAGE TO PORTUGUESE

	HB_SetCodePage( "PT850" )
	hb_langSelect( "PT" )
    */

    SET CODEPAGE TO PORTUGUESE
	REQUEST HB_LANG_PT
	REQUEST HB_CODEPAGE_PT850

   
    HB_SetCodePage("PT850")

    

	//MSGINFO(HB_LANGSELECT() )


	_HMG_SYSDATA[ 348 ] := { 199, 250, 225 }
	_HMG_SYSDATA[ 349 ] := { 007, 071, 041 }
	_HMG_SYSDATA[ 350 ] := { 235, 237, 095 }
	_HMG_SYSDATA[ 351 ] := { 069, 015, 135 }

	//Private aButtons := Aclone(aButOpcoes)

	ManutDb( aCabec, aCampos,  GetSql( "Vendedores", .F. ), "Vende" , aTam , "Cadastro de Vendedores" ,"Vendedores" , aOp1  , aOp2 , aButOpcoes )


Return 


Static Function Fx2()

Return 
