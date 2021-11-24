#require "rddsql"
#require "sddmy"


/*
if ( hb_parl (12) )
      style = LVS_SHAREIMAGELISTS | WS_CHILD | WS_TABSTOP | WS_VISIBLE | LVS_EX_TRACKSELECT | LVS_REPORT|LVS_NOSORTHEADER ; 
   else
      style = LVS_SHAREIMAGELISTS | WS_CHILD | WS_TABSTOP | WS_VISIBLE  | LVS_SINGLESEL| LVS_EX_TRACKSELECT | LVS_REPORT|LVS_NOSORTHEADER;
	  */
	  
   



#define WM_VSCROLL          0x0115
#define SB_LINEDOWN         1
#define WM_MOUSEMOVE        512

#define CSIDL_ADMINTOOLS            0x0030

//25/09

#include <hmg.ch>
//#include <dll.ch>
#include <minigui.ch>

#include <hbdyn.ch>

//#include "simpleio.ch"



//#include "hmg.ch"


#require "hbxpp"





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

#define WM_SIZE       5 



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
#define IDC_BTN_4   2004
#define IDC_BTN_5   2005
// #define IDC_BTN_YES 201
// #define IDC_BTN_NO  1102

#define FONTCOR {0,106,133}
#define BACK1 {229,237,242}

#define CORSEL     {216,228,236}

STATIC lTracking6  := .F. 
STATIC lTracking12 := .F.

//STATIC lTracking62 := .f. 



//DLLFUNCTION SetWindowLongA( nHwnd, nStyle, nPtr ) USING STDCALL FROM User32.dll

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



//STATIC aButtons := {}

REQUEST SDDMY, SQLMIX

ANNOUNCE RDDSYS

//STATIC nIndexEvent := 1

//descriï¿½ï¿½o

Define Window Main

REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850


DECLARE WINDOW Win_Msg


FUNCTION CadCli()





	LOCAL wCad := 'clientes'
	Local aOp1 := {'Consultas','Relatorios','Parametros' }

	Local cControl



	Local  aButOpcoes := {  { "&Incluir", {|| ( fx1( "novo")  )     }, .T., "Cadastra um Novo Cliente", 0 }, ;
		{ "&Modificar", {||  fx1("edit")   } , .T., "Modifica um Cliente Existente." , 0 }, ;
		{ "&Bloquear", {||  fx1( "bloquear" ) }, .T., "Bloqueia/Inativa um Cadastro Ativo.", 0 } ,;
		{ "&Filtrar", {|| ProcFiltro( 'clientes' )    }, .T., "Filtra Registros", 0 } ,;
		{  "&Consultas", {|| xSetOpcao()  }, .T., Hb_AnsiToOem("Consultas Diversas") , 0 } }



	//Local cform

	Local aOp2 



	LOCAL aTam    := GetCamposInf( wCad, 'TAM' )
	LOCAL aCabec  := GetCamposInf( wCad, 'CABEC' )
	LOCAL aCampos := GetCamposDic( wCad, 'S', .T. )

	HB_SetCodePage("UTF8")


	aOp2 := { {'2-Geral' , { || msginfo('ok') } } ,   ;
		{'2-Geral1' , { || msginfo('ok1')} },;
		{'2-Geral2' , { || msginfo('ok3')} } ,;
		{ '3-Parametro 1' , { || msginfo('ok4') } },;
		{  '3-opções' , { || msginfo('ok5') } } }




	Private nItMax := Int(nTamSubMenuConsulta / nItemSubHeight)
	Private nItx1  := nItMax

	Private nItemId := 0

	Private lArrastou := .f.

	Private lDrag     := .f.
	Private nObjDrag  := 0

	Private lDrawOk := .f.

	private cButVerde := ".&Filtrar."


	Private nRowIni2 := 10

	Private lInitCompleto := .f.

	Private cTituloJan := ''
	Private nQRegx     := 0

	Private aSubOp     := {}

	Private nLineImg  := 0

	Private nEveButton := 0

	Private nOpselx := 0

	Private WinJan := 0 

	private nClear := 0 

	Private nOpBak := 0


	Private nColOrder  := 0

	Private nDirAnt := 444


	Private lAumentou := .f.

	Private aMtrHeader := {}

	Private lInvalid := .f.

	Private nEven1 := 0
	Private nEven2 := 0

	Private lUpdMenu := .f.

	Private nIndx1 := 0
	Private nIndx2 := 0



	Private aFont2 := ARRAY FONT "Arial" SIZE 9 BOLD ITALIC
	Private aFont1 := ARRAY FONT "Arial" SIZE 9
	//BOLD ITALIC


	Private lHitBottom := .f.
	Private lHittop    := .t.


	Private nPosAnt  := -1


	Private nInd2 := 0

	Private lAscendente := .t.

	Private lDragMode := .f.

	Private lDrawHead := .f.
	Private nSec11    := 0


	Private nSaveScr := 0

	Private cSubMenuSel := ''

	Private nColIni := 0

	Private lOkCad := .f.

	Private nColSel := 0

	Private nIndexEve1 := 0


	Private cLblConsu := ''

	Private lSoltou := .f.

	Private nTotWidth := 0

	Private nObjSize := 0
	Private lmodeSize := .f.

	Private aLinhas := {}

	Private cBufHeader := ''

	Private cUltOpcaoSel := ''

	Private nIndexEvent := 0

	Private nIndexEvent2 := 0
	Private nIndexEvent3 := 0
	Private nIndexEvent4 := 0
	Private nIndexEvent5 := 0


	SET LANGUAGE TO PORTUGUESE
	SET CODEPAGE TO PORTUGUESE

	HB_SetCodePage( "PT850" )
	hb_langSelect( "PT" )

	// MSGINFO(HB_LANGSELECT() )

	_HMG_SYSDATA[ 348 ] := { 199, 250, 225 }
	_HMG_SYSDATA[ 349 ] := { 007, 071, 041 }
	_HMG_SYSDATA[ 350 ] := { 235, 237, 095 }
	_HMG_SYSDATA[ 351 ] := { 069, 015, 135 }

	//lSucess := Hmg_CallDll( "user32.dll", DLL_OSAPI, "SystemParametersInfoA",  4110  , 1, 0, 0 )

	//cData := Space( 260 )
   //? Hmg_CallDll( "shell32.dll", DLL_OSAPI, "SHGetFolderPathW", 0, CSIDL_ADMINTOOLS, 0, 0, @cData )
//     msginfo(cData)

	//DLLFUNCTION SetWindowLongA( nHwnd, nStyle, nPtr ) USING STDCALL FROM User32.dll

	cBuffer := Space(512)

	nCopyCharacters := HMG_CallDLL ("USER32.DLL", HB_DYN_CTYPE_INT, "GetWindowText", Main.HANDLE, @cBuffer, 512)


	ManutDb( aCabec, aCampos,  GetSql( "clientes", .F. ), "Clien", aTam, "Cadastro de Clientes" ,"Clientes" , aOp1  , aOp2 , aButOpcoes )



RETURN


Function EnchMtrConsul(cTab1)


	LOCAL cSql := "select * from consultas where (tabela = '"  + cTab1 +  "') And ((idfilial = 0) or (idfilial = "  + AllTrim( Str( nIdEmp ) )  + ")) And (Status = 'Ativo') order by id"
	Local oServer := GetConexao()
	Local oQuery  := oServer:Query( cSql )
	Local oRow

	aConsultas := {}


	For n1 := 1 TO oQuery:LastRec()

		oRow := oQuery:GetRow(n1)
		aadd(aConsultas ,  alltrim(GetCampo(oRow , 'descricao')) )

	Next

	oQuery:Destroy()
	oQuery := Nil

	oServer:Destroy()
	oServer := Nil

Return

FUNCTION ManutDb( aHeader, aCampos, cSql, cAlias, aTam1, cTitulo ,cTabelax , aOpx1 ,aOpx2 , aOpcoes )


//	Local cIndice1 := RetIndJan()

	Local cIndJan
	Local ni1 

	Private cTitle := ''


	PRIVATE aHeaderDb := aHeader
	PRIVATE aCamposDb := aCampos

	Private lOpcaoAberta := .f.

	Private cTabela := cTabelax

	Private nScrolTam := 0

	Private cTituloCon := ''

	Private nScr1 := 0

	Private aOpz1 := aOpx1
	Private aOpz2 := aOpx2

	Private lBloqx := .f.


	Private nQtElem := 0

	Private nHan2 := 0

	Private cTitFiltro := ''

	Private cConsuAtiva := ''
	Private cSqlConsulta := ''

	PRIVATE aDynBack := {}
	PRIVATE aForBack := {}

	PRIVATE cAli1     := cAlias


	Private nLinRow := 0

	Private nIdConsulta := 0

	Private cOpSel := ''
	PRIVATE aWidths := aTam1

	Private lScrOk := .f.

	Private  := 0

	FOR n1 := 1 TO Len( aHeaderDb )
		AAdd( aDynBack, bColor )
		AAdd( aForBack, fColor )
	NEXT


	PRIVATE nTxColorE  := Rgb( 79, 79, 79 )
	PRIVATE nFrColorE  := Rgb( 207, 207, 207 )

	Private nPosScr := 0

	PRIVATE nBkColorE1 := Rgb( 251, 251, 251 )
	PRIVATE nBkColorE2 := Rgb( 230, 230, 230 )

	PRIVATE nGradDirE  := 0
	PRIVATE nTxColorD  := 0x808080

	PRIVATE nFrColorD  := Rgb( 232,232,232 )
	//{ 9, 111, 137 }

	PRIVATE nBkColorD1 := 0XE0E0E0
	PRIVATE nBkColorD2 := 0XE0E0E0
	PRIVATE nGradDirD  := 0
	PRIVATE nTxColorF  := Rgb( 45, 55, 56 )
	PRIVATE nFrColorF  := nFrColorE

	Private nTxColorG := Rgb( 64 , 128 , 128 )
	Private nBkColorG1 := Rgb( 64 , 128 , 128 )
	//Private nFrColorG


	PRIVATE nBkColorF1 :=  0xFFFFFF
	PRIVATE nBkColorF2 :=  Rgb( 192, 192, 192 )

	Private aMrow := {}

	PRIVATE nGradDirF  := 0
	PRIVATE cFontName  := 'Arial'
	PRIVATE nFontSize  := 9

	PRIVATE aBtnFont  := { cFontName , 8 , .F., .F., .F., .F. }


	Private aLbly1 := {}



	Private aConsultas := {}

	Private fColorGrid
	Private bColorGrid


	PRIVATE aBtnColor := ;
		{ { nTxColorE, nFrColorE, nBkColorE1, nBkColorE2, nGradDirE }, { nTxColorD, nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, 		 					nGradDirF } }

	PRIVATE aBtnSel := ;
		{ { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, nGradDirF }, { nTxColorD, nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, 						nGradDirF } }

	PRIVATE aBtnG1 := ;
		{ { Rgb(255,255,255) , Rgb( 178 , 178 , 178 ) , Rgb( 58 , 174 , 203 ) , Rgb( 58 , 174 , 203 ), nGradDirE }, { Rgb( 178 , 178 , 178 ) , nFrColorD, Rgb( 178 , 178 , 178 ), nBkColorD2, nGradDirD }, { RGB(255,255,255) , nFrColorF, Rgb( 54 , 100 , 109 )  , Rgb( 54 , 100 , 109 )  , 		 					nGradDirF } }

	PRIVATE aBtnG2 := ;
		{ { Rgb(255,255,255) , {54,100,109} , Rgb( 44 , 169 , 139 ) , Rgb( 20 , 158 , 192 ), nGradDirE }, { {255,255,255}  , nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { RGB(255,255,255) , Rgb( 54 , 100 , 109 ) , Rgb( 54 , 100 , 109 ) ,  Rgb( 54 , 100 , 109 )  , 		 					nGradDirF } }



	//PRIVATE aButtons := Aclone( aOpcoes )

	aButtons := Aclone( aOpcoes )

	HB_SetCodePage( "PT850" )


	rddSetDefault( "SQLMIX" )
	RDDSETDEFAULT( "SQLMIX" )


	nConnection := RDDINFO( RDDI_CONNECT, { "MYSQL", cServer , cUserDb , cPassDb , "sisdb"} )


	IF nConnection = 0
		hb_alert("Unable connect to the server!"+Chr(13)+Chr(10)+Str(RDDINFO( RDDI_ERRORNO ))+Chr(13)+Chr(10)+RDDINFO( RDDI_ERROR ))
		Return nConnectionInfo := 1 // 0 in nLogin means Mediator is sucessfully logged
	ENDIF



	Private fScrName := 'fScrx' + cAlias

	Private cBrowName := 'fBrow' + cAlias

	Private cAuxName := 'fCad2'

	// Private cAuxMenu :=

	Private cFormPrin := 'F' + cAlias

	//cAuxName := 'FCad' + cAlias

	cAuxName := 'FTop1' + cAlias

	Private cFormJan := cAuxName


	cMenuName := 'fMenu' + cAlias

	If ascan(aOpx1, 'Consultas') > 0
		EnchMtrConsul( cTabelax )
	End If




	Private cFiltroDlg := 'fFiltro' + Left(cActiveJan,5)

	Load Window fClientes as &cFormPrin

	SetWindowCursor( GetFormHandle( cFormPrin )  , HOURGLASS  )



	SetProperty(cFormPrin , 'Frame_1' , 'Visible' , .f. )
	SetProperty(cFormPrin , 'Frame_2' , 'Visible' , .f. )



	SetProperty(cFormPrin , 'Image_baixo' , 'Visible' , .f. )
	SetProperty(cFormPrin , 'Image_cima' ,  'Visible'  , .f. )


  
	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHndCli"  ) )  ) = 0
		InstallEventHandler( "EventHndCli" )
	End If


	cActiveJan := cFormPrin

	cTitle := cTitulo

	SetProperty( cFormPrin , "Title" , cTitle)


	nI1 := Ascan(aCords , { |a| a[4] == cActiveJan})

	cIndJan := Right(aCords[nI1][1],4)			

	//ON KEY ESCAPE OF &cFormPrin ACTION xFechaJan( cIndJan )

	SetProperty( cFormPrin, "row", 60 )
	SetProperty( cFormPrin, "col", 0 )



	SetProperty( cFormPrin, "Height", nDeskTopHeight - 90 )
	SetProperty( cFormPrin, "Width", nDeskTopWidth )

	
	ShowScrollBar( GetFormHandle(cMenuName ), 0, .F. )
	ShowScrollBar( GetFormHandle( cMenuName), 1, .F. )




	Activate Window &cFormPrin



Return 


Function xFechaJan( cInd1 )



	If (!lOpcaoAberta) .And. (_IsControlDefined( 'Img' + cInd1 , 'fSplit2' ))

		xPosBrow()
		
/*
        If nIndexEve1 <= Len(_HMG_EventData )
			If nIndexEve1 > 0
				EventRemove(nIndexEve1)
			End If
		End If 

		If nEveButton <= Len(_HMG_EventData )
			If nEveButton > 0 
				EventRemove(nEveButton)
			End if 
		End If 
		*/		

		FechaJan('Img' + cInd1   , , )

					
	Else		
		
		xSetOpcao()


	End If


Return 



Function RemoveHandler( cProcName )

	Local nind := Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( cProcName  ) )  )
	Local nTam := Len(_HMG_SYSDATA [ 60 ])

	If (nInd > 0)
		Adel(_HMG_SYSDATA [ 60 ] , nInd)
		Asize( _HMG_SYSDATA [ 60 ] , nTam - 1 )
	End If
//		InstallEventHandler( "EventHndCli" )
//	End If	

Return (nInd > 0)


/*
Function xHandleEsc()


	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	Local cIndJan
	Local nI1
	Local cControl

	Local cForm



	Local MOD_VK := LoWord ( EventLPARAM() )

	GetControlNameByHandle(nHWnd, @cControl, @cForm)

	//If nHWnd = GetFormHandle(cFormPrin)

	If _isControlDefined('br_Grid' , cActiveJan)

		If nHWND = GetControlHandle('br_Grid' , cActiveJan)

			If nWParam = VK_ESCAPE

				nI1 := Ascan(aCords , { |a| a[4] == cActiveJan})

				cIndJan := Right(aCords[nI1][1],4)

				If (!lOpcaoAberta) .And. ;
						(_IsControlDefined( 'Img' + cIndJan , 'fSplit2' ))

					xPosBrow()
					FechaJan('Img' + cIndJan  , , )


					If nIndx1 > 0
						EventRemove(nIndx1)
					End If

					If nIndx2 > 0
						EventRemove(nIndx2)
					End If

				Else
					xSetOpcao()
				End If

			End If

		End If

	End If


Return

*/


Function xSetOpcao()

	Local n1
	Local nH := GetProperty( cFormPrin , 'br_grid' , 'Height' )
	Local cFormPrin := cActiveJan
	Local cAuxName  :=  'FTop1' + Right(cActiveJan,5)
	//Local cLabelx

	Local cCapt := Alltrim(OBTN_Caption(cAuxName   , aButtons[4][5] ))


	If (cCapt = 'Limpar Filtro')
		yAviso("Opção Indisponivel enquanto Houver Filtro Ativo." )
		Return
	End If


	If (!lOpcaoAberta)

		//lOpcaoAberta := .t.
		nLineImg := 0
		//InitTela(  .f.  ,  183 )

		OBTN_Caption(cAuxName   , aButtons[5][5]  , "Sair Consultas" )

		//SetProperty( cMenuName , 'Visible' , .t. )


		SetProperty( cFormPrin , 'br_grid' , 'Col' , 183 )
		SetProperty( cFormPrin , 'br_grid' , 'Row' , 53 )
		SetProperty( cFormPrin , 'br_grid' , 'Height' , nH + 5 )



		CrieMenuLabel(aOpz1)


		*//Critico
		RefreshAll(cFormPrin)

		

		lInvalid := .f.
		//SysWait(.1)
//		xZeraHead()

//		TimerRed()

		SetProperty(cFormPrin , 'Frame_1' , 'Visible' , .t. )
		SetProperty(cFormPrin , 'Frame_2' , 'Visible' , .t. )


		SetProperty(cFormPrin, 'Image_cima' , 'picture' , 'img\setac2d.Png' )


		lOpcaoAberta := .t.
		IntCli( .t. )

		
		lInvalid := .f. 	
		//xDrawIt()

		SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )




	Else

		For n1 := 1 To Len(aOpz1)

			cLabelx := Right(cFormPrin,3) + StrZero(n1,3)

			If _IsControlDefined( cLabelx, cFormPrin )
				_ReleaseControl( cLabelx, cFormPrin )
			End If

		Next

		SetProperty( cMenuName , 'Visible' , .f. )
		Setproperty( cFormPrin , 'Frame_1' , 'Visible' , .f.)


		SetProperty(cFormPrin, 'Image_cima'  , 'Visible' , .f.  )
		SetProperty(cFormPrin, 'Image_baixo' , 'Visible' , .f.  )


		lOpcaoAberta := .f.
		
		//msginfo('1')


		SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )

		InitTela(  .f.  ,  1 )

		OBTN_Caption(cAuxName   , aButtons[5][5]  ,hb_AnsiToOem("Consultas"))

		nLineImg := 0

		SetProperty(cFormPrin , 'Frame_1' , 'Visible' , .f. )
		SetProperty(cFormPrin , 'Frame_2' , 'Visible' , .f. )



	End If


Return

Function HideSplits()

	DoMethod("fSplit6","Hide")

	//DoMethod("fSplit2","Hide")

	DoMethod("fSplit3","Hide")
	DoMethod("fSplit4","Hide")
	DoMethod("fSplit5","Hide")
	DoMethod("fSplit10","Hide")

Return


Function xControls( lFilter , nQReg )


	Default lFilter := .t.

	SetProperty(  cActiveJan , 'Lbltitulo', 'Visible' , .t. )
	SetProperty(  cActiveJan , 'Lbltitulo', 'Enabled' , .t. )

	If !lFilter

		SetProperty(  cActiveJan , 'Label_1', 'Visible' , .t. )
		SetProperty(  cActiveJan , 'Label_1', 'Enabled' , .t. )


		DoMethod( cActiveJan , 'Label_1' , 'Show')
		DoMethod( cActiveJan , 'LblQtReg' , 'Show')

		SetProperty( cActiveJan , 'Image_1' , 'Visible' , .t.  )


		SetProperty( cActiveJan , 'LblUser1' , 'Visible' , .t.  )


		DoMethod( cActiveJan , 'Image_1' , 'Show')
		DoMethod( cActiveJan , 'LblUser1' , 'Show')


	End If

	DoMethod( cActiveJan , 'lbltitulo' , 'Show')
	DoMethod( cActiveJan , 'Image_2196' , 'Show')


	If (lFilter)

		If !_IsControlDefined(   'lblTitulo2' , cActiveJan)

			DEFINE LABEL Lbltitulo2
				PARENT &cActiveJan
				ROW    GetProperty(  cActiveJan , 'LblQtReg', 'Row')
				COL    75
				WIDTH  185
				HEIGHT 24
				VALUE "[Filtro Aplicado] " + Alltrim(Str(nQReg)) + " Registros. "
				FONTNAME "Arial"
				FONTSIZE 9
				TOOLTIP ""
				FONTBOLD .T.
				FONTITALIC .F.
				FONTUNDERLINE .F.
				FONTSTRIKEOUT .F.
				HELPID Nil
				VISIBLE .T.
				TRANSPARENT .T.
				ACTION Nil
				AUTOSIZE .F.
				BACKCOLOR Nil
				FONTCOLOR GetProperty(  cActiveJan , 'LblQtReg', 'BackColor')
			END LABEL

		End If

		DoMethod( cActiveJan , 'Lbltitulo2' , 'Show')


	End If

Return

Function ProcFiltro( cTab1 , lEfect )

	Local cFiltros := ''
	Local nHan1
	Local cTexto
	Local aL1
	Local aL2
	Local aL3
	Local aL4
	Local aL5
	Local aMx


	Local cCapt := Alltrim(OBTN_Caption(cAuxName   , aButtons[4][5] ))

	Default lEfect := .t.

	//msginfo(cLblSelected)

	If (lOpcaoAberta)
		yAviso(  Hb_AnsiToOem("Não Sera possivel Executar Filtros com a Tela de Opções Ativa.")  , .f.)
		Return
	End If



	If (cCapt = "Limpar Filtro" )
		aLinhas := OpenReg( ''  , ,   1 )
		OBTN_Caption(cAuxName   , aButtons[4][5]  , "Filtrar" )



		BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )
		//SysWait(.1)



		xControls(  .f. , 34)

		If _IsControlDefined(   'lblTitulo2' , cActiveJan)
			_ReleaseControl(  'lblTitulo2' , cActiveJan )
		End If

		Return

	End If

	//cActiveJan := 'fFiltro'


	aMx := yEfect(  cActiveJan , aMx  )
	cFiltros := LoadFitros(cTab1 )

	If _IsWindowDefined('fSplit2')

		cTexto := GetProperty('fSplit2' ,cLblSelected , 'Value')

		If !Empty(cFiltros)


			nHan1 := aButtons[4][5]


			hBitmap := 0
			hBitmap2 := 0
			hBitmap3 := 0
			hBitmap4 := 0
			hBitmap5 := 0

			hBitmap6 := 0

			Flag_AlphaBlend_Effect := .f.
			lAtivaBlack := .f.

			If _isWindowDefined( 'fSplit2' )

				ShowButTop( .t. )
				BT_ClientAreaInvalidateAll ('fSplit2')

				If _isWindowDefined( 'fTop1' + Right(cActiveJan,5) )
					DoMethod( 'fTop1' + Right(cActiveJan,5) , 'Show')
				End If

				BT_ClientAreaInvalidateAll (cActiveJan)

			End If

			lInvalid := .f.

			xControls( , 34)

			aLinhas := OpenReg(cFiltros  , ,   1 )

			SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )

			If _IsControlDefined(   'lblTitulo2' , cActiveJan)
				SetProperty(  cActiveJan , 'LblTitulo2' , 'Value' , "[Filtro Aplicado] " + Alltrim(Str(  Len(aLinhas)  )) + " Registros.")
			End If

			If _isControlDefined(    'br_grid', cActiveJan   )
				PostMessage(   GetControlHandle( 'br_grid', cActiveJan ) , WM_LBUTTONUP,0,0)
			End If

			OBTN_Caption(cAuxName   , nHan1  , "Limpar Filtro" )


		Else



			SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )
			EfectEnd(  cActiveJan ,  aMx)
      

		End If

	End If


REturn

Function ResButSel()

	Local cTexto
	Local lok := .f.

	If _isWindowDefined('fSplit2')
		If _isControlDefined( cLblSelected , 'fSplit2')
			cTexto := GetProperty('fSplit2' ,cLblSelected , 'Value')

			_ReleaseControl('Image_5' , 'fSplit2' )
			_ReleaseControl('Img' + Right(cLblSelected ,4) , 'fSplit2' )

			SetProperty('fSplit2','Image_1','Visible', .t.)

			PutImagem(nColSelx , cTexto , Right(cLblSelected ,4) )

			lOk := .t.

		End If
	End If


Return lOk

Function InitTela(  lIni1  , nColz1)

	Local i
	Default lIni1 := .f.
	Default nColz1 := 1


	DoMethod(cMenuName,"Hide")


	SetProperty( cAuxName , 'Width' , GetDeskTopWidth() )
	SetProperty( cAuxName , 'Height' , 52)


	aLinhas := OpenReg( , ,   nColz1 )


	If (!lIni1) .And. (nColz1 > 1)
		CrieMenuLabel(aOpz1)
	End If

					*//Critico

//RefreshAll(cFormPrin)

	nIndexEvent4 := 0

	//CREATE EVENT PROCNAME Check_Grid_Events() STOREINDEX nIndexEvent4


	SetProperty(cFormPrin , 'Frame_1' , 'Visible' , .f. )
	SetProperty(cFormPrin , 'Frame_2' , 'Visible' , .f. )


	
	//If ( Ascan(    _HMG_EventData , { |a| a[1] == 'EventButton()' } ) == 0)

	If (xIndexEvent('EventButton()' , 'C'  ) = 0)

		nEveButton := 4565

		CREATE EVENT PROCNAME EventButton() STOREINDEX nEveButton
		EventProcessAllHookMessage ( nEveButton, .t. )

		//EventProcessAllHookMessage( EventCreate( {|| EventButton() },    GetFormHandle( cMenuName  )   ), .T. )
	
	End If


	lInitCompleto := .t.
	IntCli()


	//xInvalidate()
	//EnableWindow( GetControlHandle( 'br_grid', cActiveJan )   , .f. )
	//SetWindowLongPtr (GetControlHandle( 'br_grid', cActiveJan ), nIndex, dwNewLong) 

	   
Return



Function xDrawIt()

	//BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )
  
	If _IsControlDefined('br_grid', cActiveJan) .And. (!lInvalid)
		BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )
		Syswait(.2)

		SetProperty(cActiveJan , "Timer_1" , "Enabled" , .f. )


		lInvalid := .t. 
		lDrawHead := .t.
	
	End If 	


Return 	




Function xInvalidate()

	Local n1 := 0

	If (_isControlDefined(      'br_grid', cActiveJan  )) 
		//.And. (!lInvalid)
		//VALIDATERECTX(     ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan ))    )
		//lInvalid := .t.		

		n1 := VALIDATERECTX(     GetControlHandle( 'br_grid', cActiveJan )    )

		//UpdateWindow(  GetControlHandle( 'br_grid', cActiveJan )   )

	End If

Return n1


 *// Handler de Eventos do grid

/*
Function Check_Grid_Events()

	Local nMsg := EventMsg()
	Local wParam := EventWPARAM()
	Local wParam2 := EventLPARAM()
	Local wHandle := EventHWnd()
	Local lScrollMove:=.F.

	Local cControlName
	Local cFormName

	Local nTotal := 0

	Local nRow := 0
	Local nCol := 0
	Local nHeight := 0
	Local nValue1
	Local aItems
	Local aCli
	Local nindice


	//Savelog( 'sa1.txt' , cActiveJan + '  ' + cFormPrin  + QUEBRA   )


	If !_isControlDefined('br_Grid', cActiveJan  )
//		Savelog( 'sa2.txt' , cActiveJan + '  ' + cFormPrin  + QUEBRA   )
		Return
	End If



	If (wHandle = GetControlHandle( 'br_Grid', cActiveJan ))

		//lTracking5 := .f.

		If nMsg == WM_KEYDOWN



		End If


		if nMsg == WM_LBUTTONDOWN

			//msginfo('ok')

			If _IsControlDefined('Br_Grid',cActiveJan)

				GetCursorPos (@nCol, @nRow)

				aR1 := GetPos_ScreenToClient( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , nRow, nCol )

				nTotal := 20 * (  Len(aLinhas) + 1)

				If (ar1[1] > nTotal )
					lInvalid := .f.
					xZeraHead()
				End If

			End If

		End If




		if nMsg == WM_KEYUP

		End If

		if nMsg == WM_LBUTTONUP

			If !lInvalid
				xZeraHead()
			End If

			If _IsControlDefined('Br_Grid',cActiveJan)

				GetCursorPos (@nCol, @nRow)


				nHeight := GetProperty(cActiveJan , 'br_grid' , 'Height')

				aR1 := GetPos_ScreenToClient( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , nRow, nCol )

				If aR1[1] >= 600
					BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )
					SysWait(.2)
				End If

			End If

		End If


		If (nMsg = WM_MOUSEMOVE)

		End If

		If (wParam2 =  WM_HSCROLL)
			msginfo('scrool')
			xZeraHead()
		End If




	End If

REturn

*/


Function xGetItMtr(nCol)

	//Aadd(aMtrHeader , {  nColL , aTams[n2]  , Alltrim(aCabec[n2])  } )

	Local nInd1 := Ascan( aMtrHeader ,  { | a|  (nCol >= a[COLUNA] ) .And. (nCol <= a[COLUNA]+a[TAMANHO])  }  )


Return (nInd1)

Function CheckBloq()

	Local nindice
	Local nValue1
	Local aItems

	Local aCli
	Local cXName :=  'FTop1' + Right(cActiveJan,5)

	//xZeraHead()

	If  ((nIndice := Ascan(aHeaderDb , 'Status') ) > 0 )

//	 	SysWait(.2)

		If _IsControlDefined(  'br_Grid' , cActiveJan )

			nValue1 := GetProperty(  cActiveJan , 'Br_grid' , 'Value' )
			aItems  := GetProperty(  cActiveJan , 'br_grid' , 'Items' )
			aCli    := GetProperty( cActiveJan , 'br_grid', 'Item' ,   nValue1[1]    )

			If Alltrim(aCli[nIndice])  != "Inativo"
				OBTN_Caption(cXName   , aButtons[3][5]  , hb_AnsiToOem("Bloquear") )
			Else
				OBTN_Caption(cXName   , aButtons[3][5]  , hb_AnsiToOem("Desbloquear") )
			End If

		End If 
		

	End If

Return


Function OpenReg( cFiltro1  , cFiltro2  , nColz)

	//PRIVATE aHeaderDb := aHeader
	//PRIVATE aCamposDb := aCampos



	Local cSqlx1 := ''
	Local n1 := 1
	Local aCampos
	//Local aCabec  := GetCamposDic( cTabela, 'S' , .f. , .t. )

	LOCAL aCabec

	Local aTams

	Local aTips
	LOCAL nQReg

	Local qReg1   := 200
	Local calias  := "TMP"
	local cTab1
	local aCabex:={}




	Local nIndx1 := 0

//	Local oServer
	Local oQuery

	LOCAL lBold      := .F.
	LOCAL lItalic    := .F.
	LOCAL lUnderline := .F.
	LOCAL lStrikeOut := .F.

	Local aDynfont   := {}

	Local nColy

	// Local aTams := {}

	Local am1 := {}


	Local cGridname := 'Br_grid'

	Local bGrid1 := {}
	Local bGrid2 := {}

	Local nW1

	Local aItens := {}

	Local oServer

	Local cLabelx := 'Lblx01'


	Default nColz := 183



	nColy := nColz

	aMtrHeader := {}

	Default cFiltro1 := ''
	Default cFiltro2 := ''


	SetWindowCursor( GetFormHandle(  cActiveJan ) , HOURGLASS )

	aCampos  := GetCamposDic( cTabela, 'S' , .t. , .t. )
	//Local aCabec  := GetCamposDic( cTabela, 'S' , .f. , .t. )

	aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )

	aTams   := GetCamposInf( cTabela, 'TAM' )

	aTips   := GetCamposInf( cTabela, 'TIPO' )
	nQReg   := GetReg( cTabela )


	cSqlx1 := 'Select '
	Refreshall(cActiveJan)

	csq2:=''

	If !Empty(cFiltro1)
		cSq2 := GetSql( cTabela  , .f. )  + ' Where ' + cFiltro1

	Else
		cSq2 := GetSql( cTabela  , .f. )
	End If

	If (Select(calias) > 0)
		dbSelectArea( cAlias )
		Use
	End If

	cSqlx2 := cSqlx1

	SaveLog("st121.txt" , cSq2 )



	aItens := {}


	nF1 := {|| ARRAY FONT "Arial"   SIZE 9 }
	nF1 := {|| ARRAY FONT "Arial"   SIZE 9 BOLD}

	SET CODEPAGE TO PORTUGUESE
	REQUEST HB_LANG_PT
	REQUEST HB_CODEPAGE_PT850

	HB_SETCODEPAGE("UTF8")

	//HB_SetCodePage("PT850")

	aDynFont := {}


	oServer := GetConexao()

	oQuery := oServer:Query(  cSq2 )

	If oServer:NetErr()
		MsGInfo( "Error executing Query " + QUEBRA + cSq2 + " : " + QUEBRA + oServer:Error() )
		Return .f.
	End If


	oQuery:LastRec()


	If (oQuery:Lastrec()  == 0 )
		yAviso( 'Este Cadastro Não Possui Registros' , .f. )
	End If


	//While !Eof()

	FOR i := 1 TO oQuery:LastRec()


		aM1 := {}
		aDynFont := {}

		oRow := oQuery:GetRow( i )

		For nx1 := 1 To Len(oRow[1])

			cValor := Hb_AnsiToOem( oRow:FieldGet(nx1)  )


			If Alltrim(aTips[nx1]) == 'C'
				cValor := hb_UTF8TOSTR( Alltrim(oRow:FieldGet(nx1)) )
			End If

			//msginfo( fieldName(nx1) )

			lNum := .f.

			If Alltrim(aTips[nx1]) == 'B'
				cValor := PadL(alltrim(Transform( oRow:FieldGet(nx1) , "@E 999,999,999.99" )),14)
				lNum := .t.
			End If

			If ( Alltrim(aTips[nx1]) == 'I')

				If (nX1 > 1)
					cValor := Padl(alltrim( Str( oRow:FieldGet(nx1) )),25)
					lNum := .t.
				Else
					cValor := Alltrim( Str( oRow:FieldGet(nx1) ) )
				End If

			End If


			If (lNum)
				Aadd(aDynFont , {|| ARRAY FONT "Courier"   SIZE 12 ITALIC UNDERLINE } )
			Else

				If (FieldName(nx1)  = 'Codigo') .or. (FieldName(nx1)  = 'Status')
					Aadd(aDynFont , {|| ARRAY FONT "Arial"  SIZE 8 BOLD } )
				Else
					Aadd(aDynFont , {|| ARRAY FONT "Arial"   SIZE 8 } )
				End If

			End If

			Aadd(aM1 , cValor )


		Next

		Aadd(aItens , aM1 )

		//Dbskip()

	Next


	oServer:Destroy()
	oServer := Nil


	oQuery:Destroy()
	oQuery := Nil

	n2 := 1

	bGrid1 := {}
	bGrid2 := {}

	aJustify := {}

	//aeval(atams , { |a| msginfo(str(a)) } )


	aCabex := {}
	cCabecy := ''
	nColl   := 5
	//10
	nSeqx   := 345
	cBufHeader := '    '
	nIndix1    := 0
	For n2 := 1 TO Len(aTips)

		If Alltrim(aTips[n2]) $ "NB"
			AAdd( aJustify, GRID_JTFY_RIGHT)
		Else
			AAdd( aJustify, GRID_JTFY_LEFT )
		End If

		//AAdd( aJustify, GRID_JTFY_RIGHT)

		cLabelx := "BtnHeader" + StrZero(n2,3)



		Aadd(aMtrHeader , {  nColL , aTams[n2]  , Alltrim( Hb_UTf8ToStr(aCabec[n2])    )  } )

		If aCabec[n2] = 'Status'
			nIndx1 := n2
		End If

		nColL += aTams[n2]

	Next

	//msginfo(Str( nindx1 ) )


	If _IsControlDefined(cGridname , cactiveJan )
		_ReleaseControl( cGridname , cactiveJan )
	End If

	If _IsControlDefined(cLabelx , cActiveJan )
		_ReleaseControl( cLabelx , cActiveJan )
	End If

	cLabelx := 'Lblb01x'

	If _IsControlDefined(cLabelx , cActiveJan )
		_ReleaseControl( cLabelx , cActiveJan )
	End If



	//DbGoTop()
	bGrid1 := {}
	bGrid2 := {}

	aZ1 := {}

	Private aZCol := {}

	//Private n2 := 1

	nI := 0


	bColorGrid := {|| Iif( Alltrim(aItens[This.CellRowIndex][nIndx1]) = 'Inativo' , {255,149,149} , ;
		Iif( This.CellRowIndex / 2 <> Int( This.CellRowIndex / 2 ), { 241,241,241 }, {255,255,255}  )   )  }

	fColorGrid := {|| Iif( Alltrim(aItens[This.CellRowIndex][nIndx1]) = 'Inativo' , {255,255,255} ,  { 78,78,78 } ) }
	//, ;
		//iif(  This.CellRowIndex = 1,  {255,255,255} ,  { 78,78,78 }  )   )  }

	If nIndx1 = 0
		bColorGrid := { || Iif( This.CellRowIndex / 2 <> Int( This.CellRowIndex / 2 ), { 241,241,241 }, {255,255,255}  )    }
		fColorGrid := {|| iif(  This.CellRowIndex = 1, {255,255,255}  , { 78,78,78 }     )}
	End If

	bFont1 := {}

	bFontGrid := {|| Iif( Alltrim(aItens[This.CellRowIndex][nIndx1]) = 'Inativo' ,  aFont2 , aFont1 ) }
	//ARRAY FONT "Arial" SIZE 9    ) }


	FOR n2 := 1 TO Len(aCabec)

		AAdd( bGrid1, bColorGrid  )
		AAdd( bGrid2, fColorGrid )
		Aadd( bFont1, bFontGrid )

		nI++

		b := Str(nI)
		a := " { || OrdeneCol(  "  + alltrim(b)  + " )  } "

		Aadd(aZcol ,  &a  )

	Next


	Do Events

	aM6 := {}
	aadd(aM6 , aCabec )


	_HMG_SYSDATA [ 348 ] := {255,255,255}
	_HMG_SYSDATA [ 349 ] := {28,157,189}
	_HMG_SYSDATA [ 350 ] := {255,255,255}
	_HMG_SYSDATA [ 351 ] := {28,157,189}

	//270
	//@ 101, 183 GRID &cGridName ;

	nW1 := GetDeskTopWidth() - 180

	If (nColy = 1)
		nW1 := GetDeskTopWidth()
	End If

	nGridHeight := GetDeskTopHeight() - 185

	//185




	//FONT 'Arial Narrow' SIZE 9;

	@ 55   , nColy  GRID &cGridName ;
	OF &cActiveJan ;
	WIDTH nW1 ;
	HEIGHT nGridHeight ;
	NOLINES ;
	HEADERS aCabec ;
	FONT XFONT1 SIZE 9 ;
	ITEMS aItens ;
	FONTCOLOR { 78, 78, 78 } ;
	JUSTIFY aJustify ;
	WIDTHS aTams ;
	BACKCOLOR {255,255,255} ;
	DYNAMICFORECOLOR bGrid2 ;
	DYNAMICBACKCOLOR bGrid1 ;
	COLUMNDRAGDROP  ;
	ON DBLCLICK ( Eval(  aButtons[2 ][2] )     ) ;
	ON CHANGE ( CheckBloq() )  ;
	CELLNAVIGATION


	SetProperty( cActiveJan , cGridName , "PaintDoubleBuffer" , .t.)



	SetProperty(cActiveJan , cGridName , "COLUMNDYNAMICFONT" ,  1,  { || aFont2 }  )



	nTotWidth := 0
	l1        := 0

	Aeval( aTams , { |a| (l1++ , nTotWidth += get_grid_colwidth('br_grid', cFormPrin , l1)    )   } )


	nW1 := GetDeskTopWidth() - 180
	nScrolTam := 0

	If nTotWidth > nW1
		nScrolTam := (ntotWidth - nW1)
	End If

	nTamBarra := (nw1 - nScrolTam - 40)

		//SetProperty(cFormPrin , cGridName , "Value" , {1,1} )

	SetProperty(cActiveJan , cGridName , "Value" , {  Len(aItens) ,2} )



	cTituloJan := GetProperty(cActiveJan , "Title" )
	nQRegx     := Len(aItens)


	If (nIndexEve1 = 0)
		nIndexEve1 := EventCreate( { || EventButton()  }  , ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) )
		EventProcessAllHookMessage( nIndexEve1 ,   .T.)
	End If 



	cTitFiltro := ''

		//DbGotop()

	If !Empty(cFiltro1)
		cTitFiltro := cFiltro1 + ' (' + cFiltro2 + ')'
	End If


	SetProperty( cActiveJan , 'Label_1' , 'Row' ,  nGridHeight+61  )
	SetProperty( cActiveJan , 'LblQtReg' , 'Row' , nGridHeight+61  )


	SetProperty( cActiveJan , 'Image_1' , 'Row' , nGridHeight+58  )
	SetProperty( cActiveJan , 'Image_2196' , 'Row' , nGridHeight+58  )



	SetProperty( cActiveJan , 'Lbltitulo' , 'Row' , nGridHeight+57  )


	SetProperty( cActiveJan , 'Lbltitulo' , 'Value' , Alltrim (cTitle)  )

	SetProperty( cActiveJan , 'LblUser1' , 'Row' , nGridHeight+61  )
	SetProperty( cActiveJan , 'LblUser1' , 'Value' , Alltrim (cUserName)  )

	SetProperty( cActiveJan , 'lblQtReg' , 'Value' , Alltrim( Transform(   Len(aItens) , '@E 999,999,999'   ))         )

	If !Empty(cFiltro1)
		SetProperty( cActiveJan , 'Lbltitulo' , 'Value' , Alltrim(cTabela) + " " + Alltrim(cFiltro1) )
	End If


	SetProperty(cActiveJan , cGridName , "Value" , {  1 ,2} )

	SetWindowCursor( GetFormHandle(  cActiveJan ) , IDC_ARROW )

	//xDrawIt()

	//sysWait(.1)




Return aItens


Function xZeraHead()

	Local cFormName := ''
	Local cFname    := ''


	If (lDrawHead)
		nSec11 := hb_MilliSeconds()
		lDrawHead := .f.
	End If

REturn


Function xGetJan()
	Local cFormName := ''

	GetFormNameByHandle ( GetActiveWindow(), @cFormName )

Return cFormName



Function xGetObj()
	Local cFormName := ''

	GetFormNameByHandle ( GetActive(), @cFormName )

Return cFormName





Function get_grid_colwidth(ControlName,ParentForm,nColumn)

	Local c := GetControlHandle (ControlName,ParentForm)

Return ListView_GetColumnWidth ( c , nColumn - 1 )




Function RedrawMenu( aopcoes  , nindice , nLinha1  )

	Local n1
	Local cLabelx
	Local nRow := NROWINI

	For n1 := 1 To Len(aOpcoes)

		cLabelx := Right(cFormPrin,3) + StrZero(n1,3)

		If _IsControlDefined( cLabelx, cFormPrin )

			SetProperty( cFormPrin , cLabelx , "row" , nRow )
			//DoMethod(cFormPrin , cLabelx , "Refresh" )

			If nIndice = n1
				nRow += nLinha1
			Else
				nRow += 20
			End If

		End If	

	Next


Return

// Sub Menu
Function CrieMenuLabel(aOpcoes , nInd1 , nHeight1 )

	Local n1 := 1
	Local cLabelx := ""
	Local cParent := cActiveJan
	Local nRow := NROWINI
	Local nHandle1



	Local nHanConsu := 0

	Local cMenuName := 'fMenu' + Right(cActiveJan,5)

	Default nInd1    := 0
	Default nHeight1 := 0

	//If !_isControlDefined( 'G4343' , cFormPrin)
	//OpenReg()
	//End If



	If !_IsWindowDefined(cMenuName)
		yAviso("Janela Não Localizada." , .f. )
		Return
	End If



	If Len(aMRow) == 0
		For n1 := 1 To Len(aOpcoes)
			aadd(aMrow , { aOpcoes[n1] , 0   } )
		Next
	End If

	For n1 := 1 To Len(aOpcoes)


		cLabelx := Right(cActiveJan,3) + StrZero(n1,3)

		If Empty(cLblConsu) .and. (aOpcoes[n1] == 'Consultas')
			cLblConsu := cLabelX
			//msginfo(cLblConsu)
		End If
		


		If !_IsControlDefined( cLabelx, cParent ) // cmenuname

			DEFINE LABEL &(cLabelx )
				PARENT    &cParent
				//PARENT    Main
				ROW       nRow
				COL       2
				WIDTH     180
				HEIGHT    20
				VALUE     Hb_AnsiToOem( alltrim(aOpcoes[n1]) )
				ALIGNMENT CENTER
				FONTNAME XFONT1
				FONTSIZE 9
				BACKCOLOR {7,101,125}
				FONTCOLOR {255,255,255}
				TRANSPARENT .f.
			END LABEL


			If aMrow[n1][2] == 0
				aMrow[n1][2] := nRow
			End If

		

			SetProperty(cParent, cLabelx  , "BACKCOLOR", {7,101,125})

			//nHandle1 := GetControlHandle( cLabelx, cParent )

  /*
			If (aOpcoes[n1] == 'Consultas') .and. (nHanConsu == 0)
				nHanConsu := GetControlHandle( cLabelx, cParent )
			End If
			*/


			//EventProcessAllHookMessage(EventCreate({ || LabelEventH4() }, nHandle1  ), .T.)

			//EventProcessAllHookMessage(EventCreate({ || EventButton() }, nHandle1  ), .T.)



			If nInd1 > 0
				If nInd1 = n1
					nRow += nHeight1
				Else
					nRow += 20
				End If
			Else
				nRow += 20
			End If

		Else

			
			*// Reposicionar posicao correta	
			If (n1 > Val( Right( cLblConsu , 3  ) ))
				SetProperty( cParent,cLabelx , 'Row' , nRow )
			End If 	

			If nInd1 > 0
				If nInd1 = n1
					nRow += nHeight1
				Else
					nRow += 20
				End If
			Else
				nRow += 20
			End If
			
			 

		End If

	Next



Return


Function xMudouTam()

	Local nSize
	Local nNewTam := 452220
	Local nindice := 0
	Local cCampo2
	Local lMudou := .f.
	Local aHandle := GetControlHandle( 'br_grid', cFormPrin )
	Local n2

	For n2 := 1 to Len(aMtrHeader)

		nSize := ListView_GetColumnWidth( aHandle , n2 - 1  )


		If (nSize != aMtrHeader[n2][TAMANHO])
			//msginfo('Mudou Tam')
			lMudou := .t.
			nSalva   := aMtrHeader[n2][TAMANHO]
			aMtrHeader[n2][TAMANHO] := nSize

			nindice := n2

			nNewTam := nSize
		End If

	Next

	If nNewTam <= 50

		If nindice > 0
			aMtrHeader[nindice][TAMANHO] := nSalva
		End If

		LISTVIEW_SETCOLUMNWIDTH ( aHandle , nindice , nSalva )
		yAviso("Tamanho incorreto para a Coluna." , .f. )

		nColSel := 0

		aLinhas := OpenReg( , ,   1 )
	DoMethod( cFormPrin , "br_grid" , "Show")
DoMethod( cFormPrin , "br_grid" , "Refresh")
SysWait(.1)

lMudou := .f.

End If


Return lMudou

Function xGetHeader()

	LOCAL aCabec  := GetCamposInf( GetTabelaX() , 'CABEC' )


Return aCabec

Function xGetInfoHead(cInfo)

	LOCAL aCabec  := GetCamposInf( GetTabelaX() , cInfo )


Return aCabec


Function xPosMtrHead()

	Local aM1 := {}
	Local n2
	Local cCampo
	Local aM2
	Local nSize
	Local cCampo2
	Local lMudou := .f.
	Local aHandle := GetControlHandle( 'br_grid', cFormPrin )


	For n1 := 1 To Len(aMtrHeader)

		cCampo := aMtrHeader[n1][TEXTO]

		n2 	   := GRID_GetColumnDisplayPos(  'br_grid',  cFormPrin , n1 )


		cCampo2 := aMtrHeader[n2][TEXTO]
		nSize   := aMtrHeader[n1][TAMANHO]

		cCampo2 := GRID_GetColumnControl ( 'br_grid',  cFormPrin , _GRID_COLUMNCAPTION_  , n1)
		nSize   := GRID_GetColumnControl ( 'br_grid',  cFormPrin , _GRID_COLUMNWIDTH_  , n1)

		//nSize := ListView_GetColumnWidth( aHandle , n1 - 1 )

		If (n2 != n1)
			//msginfo('mudou')
			lMudou := .t.
		End If


		Aadd( aM1 , {  0,    nSize  , cCampo2  , n2 } )


	Next

	aM2 := Asort(aM1 ,,, { |a,b| a[4] < b[4] })

	If lMudou
		aMtrHeader := Aclone(aM2)
	End If


REturn (lMudou)




Function xPosBrow()

	Local n1 := 0
	Local nSize
	Local aHandle   := GetControlHandle( 'br_grid', cActiveJan )
	Local aHeaders1 := GetProperty(cActiveJan  , "br_grid" ,  "Headers" , 1 )
	Local cTabx := GetTabelaX()
	Local aMtrHeader := xGetHeader()

	//msginfo(Str(  Len(aHeaders1) ))

	For n1 := 1 To Len(aMtrHeader)

		nSize := ListView_GetColumnWidth( aHandle , n1 - 1 )

		cCampo := GRID_GetColumnControl ( 'br_grid',  cActiveJan , 7, n1)

		n2 := GRID_GetColumnDisplayPos(  'br_grid',  cActiveJan , n1 )

		SetCampoOrdem(   cTabx  , Alltrim(cCampo) , n2    )

		SetCampoTam(	cTabx   , Alltrim(cCampo) , nSize )

	Next


Return


	******************************************************************************
FUNCTION GRID_GetColumnDisplayPos (cControlName, cParentForm, nColIndex)
	LOCAL nPos, ArrayOrder := {}
	IF Valtype (cParentForm) == "U"
		cParentForm := ThisWindow.Name
	ENDIF
	// LISTVIEW_GETCOLUMNORDERARRAY: Low-level function in C (see the end of this file)
	ArrayOrder := LISTVIEW_GETCOLUMNORDERARRAY (GetControlHandle ("br_grid", cActiveJan), GRID_ColumnCount ("Br_grid",  cActiveJan  ))
	nPos := ASCAN (ArrayOrder, nColIndex)

RETURN nPos


	******************************************************************************
FUNCTION GRID_ColumnCount (cControlName , cParentForm)
	LOCAL i
	IF Valtype (cParentForm) == "U"
		cParentForm := ThisWindow.Name
	ENDIF
	i:= GetControlIndex (cControlName , cParentForm)
RETURN (LEN(_HMG_SYSDATA [ 7 ] [i]))


	*******************************
FUNCTION GRID_GetColumnControl (cControlName , cParentForm, nControl, nColIndex)
	LOCAL Length, i, Data := NIL
	i := GetControlIndex(cControlName,cParentForm)
	IF (nControl = _GRID_ONHEADCLICK_) .OR. (nControl = _GRID_COLUMNCAPTION_) .OR. (nControl = _GRID_COLUMNJUSTIFY_)
		Length := LEN(_HMG_SYSDATA [ nControl ] [i])
		IF nColIndex > 0 .AND. nColIndex <= Length
			Data := _HMG_SYSDATA [ nControl ] [i] [nColIndex]
		ENDIF
	ELSE
		IF Valtype (_HMG_SYSDATA [ 40 ] [ i ] [ nControl ]) == "A"

			Length := LEN(_HMG_SYSDATA [ 40 ] [ i ] [ nControl ])
			IF nColIndex > 0 .AND. nColIndex <= Length
				Data := _HMG_SYSDATA [ 40 ] [ i ] [ nControl ] [nColIndex]
			ENDIF
		ENDIF
	ENDIF
RETURN Data




	// Handler do menu principal - Consultas

FUNCTION LabelEventH4(aLabel)

	STATIC lTracking6 := .F.
	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  cControl
	LOCAL  cForm
	Local cOpcao
	Local nLinha
	Local nLine1
	Local nPulo := 130
	Local cTp1
	Local hDC
	Local aM1 := {}
	Local aTams1 := {}
	Local nRow
	Local nCol
	Local aR1
	Local lSalto := .f.
	Local nSalvai

/*
	GetControlNameByHandle(nHWnd, @cControl, @cForm)

	If Empty(Alltrim(cActiveJan)) .Or. (cActiveJan = "Main")
		Return
	End If


	//savelog('lp221.txt',' ok ' + cControl + ' ' + Str(nMsg) + '  ' + str(nWParam) + QUEBRA )

	If nMsg == WM_LBUTTONDOWN
		//   msginfo('p333')
		lSoltou := .f.
	End If

	If (nMsg == WM_SYSCOMMAND )


	End If

	If (nMsg == WM_LBUTTONUP)
		lSoltou := .t.
	End If


	If (nMsg == WM_MOUSEMOVE) .And. (lSoltou) .and. (!lOpcaoAberta)

		lSoltou := .f.
		//TimerRed()



		If xPosMtrHead() .or. xMudouTam()
			//msginfo('ok')
			nColSel := 0
			//	BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) , Nil , .t. )
			xPosBrow()
			aLinhas := OpenReg( , ,   1 )

			nColSel := 0

			DoMethod( cFormPrin , "br_grid" , "Show")
			DoMethod( cFormPrin , "br_grid" , "Refresh")

			PostMessage( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) ,WM_MOUSELEAVE ,0,0)


			PostMessage( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) ,WM_MOUSELEAVE ,0,0)
			SendMessage( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) ,WM_MOUSELEAVE ,0,0)

			If !lInvalid
				xZeraHead()
			End If

		End If

	End If

	If (nMsg == WM_MOUSEMOVE) .And. (!lSoltou) .and. (!lOpcaoAberta)

		lSoltou := .f.
		//TimerRed()

		GetCursorPos (@nCol, @nRow)
		aR1 := GetPos_ScreenToClient( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) , nRow, nCol )

		nColSel := xGetItMtr(ar1[2])

		
	End If



	If (nMsg == WM_MOUSEMOVE) .And. (!lSoltou) 
	   //.And. (!lOpcaoAberta)

		lInvalid := .f.
		xZeraHead()

	End If



	If (nMsg = WM_LBUTTONDBLCLK) .And. (!lOpcaoAberta)

		OrdeneCol(  nColSel )

		If !lInvalid
			xZeraHead()
		End If
		//TimerRed()

	End If



	If (nMsg == WM_PAINT)
		If !lInvalid
			xDrawHead()
		End If
	End If



	//If (nMsg == WM_HSCROLLLEFT)
	//	msginfo('paint')
	//xDrawHead()
	//End If


	If (nMsg == WM_MOUSELEAVE) .And. ( Left(cControl,3) = 'ien') .And. (lOpcaoAberta)

		nColSel := 0



		If !(Empty(Alltrim(cControl)))

			If !Empty(cLblSelected )

				If (alltrim(cControl) != alltrim(cLblSelected))
					SetProperty(cForm, cControl, "BACKCOLOR", {7,101,125}  )
					SetProperty(cForm, cControl, "FONTBOLD", .f.)
				Else
					lTracking6 := .t.
				End If


			Else
				SetProperty(cForm, cControl, "BACKCOLOR", {7,101,125}  )
				SetProperty(cForm, cControl, "FONTBOLD", .f.)

			End If
			lTracking6 := .f.



		End If


	End If




	If Empty(Alltrim(cControl))
		Return
	End If

	

	If (nMsg == WM_MOUSEMOVE) .And. ( Left(cControl,3) = 'ien') .And. (lOpcaoAberta) .And. (!lTracking6)


		SetWindowCursor( GetControlHandle( cControl , cForm  ) , CURSORHAND)


		SetProperty(cForm, cControl, "BACKCOLOR", CORSEL)
		SetProperty(cForm, cControl, "BACKCOLOR", {4,66,81})
		SetProperty(cForm, cControl, "FONTBOLD", .T.)

		lTracking6 := TrackMouseEvent(nHWnd)
		lTracking5 := .f.

		//SysWait(.1)

		Return
		//lTracking6 := .f.

	End If


	If nMsg == WM_LBUTTONDOWN

		// Menu Consulta Ativado Aqui.

		cOpcao  := alltrim(GetProperty(	 cForm, cControl, "Value" ))
		cName  := alltrim(GetProperty(	 cForm, cControl, "Name" ))

		//  msginfo('lp2222222222')


		If (cOpcao == alltrim(cOpSel))
			cOpsel := ''

			nSalvai := nLineImg
			nLineImg := 0

			BT_ClientAreaInvalidateRect ( cFormPrin , nSalvai, 0,  nSalvai+35 , 178 , .t. )



			Refreshall( cFormPrin )

			DoMethod(cMenuName , "Hide")
			ShowButConsu(.f.)
			RedrawMenu( aOpz1  )		

			Return

	
		End If

		
		SetWindowCursor( GetFormHandle( cActiveJan ) , HOURGLASS)


		nLinha  := GetProperty(cForm, cControl, "Row" )
		nCnt:=0

		nix1 := ascan(aMrow , { |a| alltrim(a[1]) == alltrim(cOpcao) } )

		If nix1 > 0
			nLinha := aMRow[nix1][2]
		Else
			msginfo('nf')
		End If

		aSubOp := {}
		aSubRot := {}
		ShowButConsu(.f.)


		If (cOpcao <> 'Consultas')

			nInd := Ascan( aOpz1 , cOpcao )

			aeval(aOpz2 , { |a| Iif(Left(a[1] ,1) == alltrim(Str(nind)), aadd(aSubOp, a[1]  ) , ) } )
			aeval(aOpz2 , { |a| Iif(Left(a[1] ,1) == alltrim(Str(nind)), aadd(aSubRot, a[2]  ) , ) } )


		Else
			nInd := 1


			EnchMtrConsul(cTabela)

			aeval( aConsultas , { |a| aadd(aSubOp , a) } )
			ShowButConsu( .t. )
			setProperty( cFormPrin , "LblQtConsu","Value", alltrim(Str( Len(aConsultas) )) )

			// msginfo( aSubOp[  Len(aSubOp) - 1 ] + ' ' + Str(    Len(aSubOp)   )  )

		End If

		cOpsel := cOpcao
		nHeight := 289

		nLine1 := nLinha+80
		

		If Len(aSubOp) < nItMax
			nHeight := (Len(aSubOp) * 16)+1

			nPulo  := nHeight+22

			nLineImg := 0

		Else

			If Len(aSubOp) > nItMax

				nPulo  := nHeight+62
				nLinRow := 0
				nItx1   := nItMax
				nQtElem := Len(aSubOp)
				lSalto  := .t.


			Else

			End If

		End If





		LimpaLabels(.t.)
		LimpaLabels(.f.)


		_ShowWindow( cMenuName )


		CrieSubMenu(aSubOp)


		SetProperty(cMenuName , "Height" , nHeight  )


		SetProperty(cMenuName , "row" , nLine1)
		SetProperty(cMenuName , "col" , 5)

		If (lSalto)
			nLineImg := GetProperty( cMenuName , "Row") + GetProperty( cMenuName , "Height" ) + 5
		End If

		BT_ClientAreaInvalidateRect ( cFormPrin , 0, 0,  200, GetDesktopHeight() - 200 , .t. )



		If (nIndx1 = 0)
			RefreshCli()
		End If



		SetProperty( cMenuName , 'Visible' , .t. )
		Setproperty( cFormPrin , 'Frame_1' , 'Visible' , .t.)

		If nInd < Len(aOpz1)
			nQtElem := Len(aSubOp)
			CrieMenuLabel(aOpz1 , nind , nPulo   )
		Else
			CrieMenuLabel(aOpz1)
		End If


		SetWindowCursor( GetControlHandle( 'br_grid', cActiveJan ) , IDC_ARROW)


	End If
*/


Return

Function xPaintSub()

	Local aRGBcolor := BACK1

	Local nWidthBmp := 170

	Local nHandle1
	Local nHandle2
	Local hWnd
	Local BTstruct
	Local BTstruct2
	Local hDc
	Local nTYpe
	Local nLine := 00
	
	Local nHeightBmp := nItemSubHeight * Len(aSubOp)

	Local hBitmap2

	LOCAL Width  := BT_ClientAreaWidth  (cMenuName)
	LOCAL Height := BT_ClientAreaHeight (cMenuName)

	
	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''

	Local nRow := -(GetProperty( cMenuName , "VscrollBar" , "Value"))



	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)

	
	hDC2 = BT_CreateDC ( cMenuName , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )
	

		 
		//BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , 177 ,    nHeightBmp    , BACK1 ,BACK1  )	

		
	//End If 	


	//BT_HDC_INVALIDCLIENTAREA


	If (nOpselx = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , 187 ,    nHeightBmp    , BACK1 ,BACK1  )	
	End If 	

	If nClear > 0

		BT_DrawGradientFillVertical ( hDC2 ,   (nClear  * nItemSubHeight)    , 0  , 187 ,    nHeightBmp    ,  BACK1  ,BACK1  )			

		//nClear := 0

	End If 	


	For n1 := 1 To Len(aSubOp)

		cTexto := alltrim(  Right( aSubOp[n1]  , Len(  aSubOp[n1] ) - 2  ) )

		cTexto := aSubOp[n1]

		//cTexto := strzero(n1,3) + ' ' + aSubOp[n1] 

		If ((nOpselx > 0) .And. (nOpSelx = n1) ) .or. (   (nOpselx > 0) .And. ( Alltrim(cSubMenuSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT 
			// + BT_TEXT_BOLD

			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow - 2  , 00  , 187 ,    nItemSubHeight - 1     , BACK1 ,WHITE  )		
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR ,  {32,134,200}   , ; 
			Iif( Alltrim(cSubMenuSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ; 
			nAlingText, nOrientation )
		   

		Else 				
		
			nTypeText    := BT_TEXT_TRANSPARENT  
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR , BACK1 , nTypeText, nAlingText, nOrientation )

		End If 	

		

		nLine += (nItemSubHeight)

	Next 

	//BT_DrawBitmap ( hDC2, 0, 0, 170 , nHeightBmp , BT_COPY, hBitmap2 )

		
	//BT_BitmapSaveFile (hBitmap2 , "Hx102.bmp")

	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )


	//bt_Bit


REturn 	

Function xAbreOpMenu( cF1 , cContrl1 )

	
	Local cOpcao  := alltrim(GetProperty(	 cF1, cContrl1, "Value" ))
	Local cName  := alltrim(GetProperty(	 cF1, cContrl1, "Name" ))
	Local nix1   := 0
	Local nCnt:=0
	//Local cOpsel
	Local nHeight
	Local nLine1
	Local nLinha 
	Local lSalto := .f. 

	SetWindowCursor( GetFormHandle( cActiveJan ) , HOURGLASS)

	//SET AUTOSCROLL ON




	If (cOpcao == alltrim(cOpSel))


		If !Empty( Alltrim(cSubMenuSel)  )
			yAviso( Hb_AnsiToOem("Ainda Existe Consulta Selecionada , Favor Cancelar a Seleção.") , .f.)
			Return 
		End If 	


		cOpsel := ''

		nSalvai := nLineImg
		nLineImg := 0
		BT_ClientAreaInvalidateRect ( cFormPrin , nSalvai  , 0,  180 , 50 , .t. )

		
		DoMethod(cMenuName , "Hide")
		ShowButConsu(.f.)

		RedrawMenu( aOpz1  )		
		RefreshLbl()	
		
		cLblConsu := ''

		
		cSubMenuSel := ''

			
		SetProperty(  cFormPrin  ,   'Label_Sel1' ,   'Value' ,  ''    )		
		
		OBTN_Visible( cFormPrin , 5460 , .f.)				
		OBTN_Visible( cFormPrin , 5461 , .f.)				

		
		SetProperty(   cFormPrin , 'Label_Z1' , 'Visible' , .f. )



		
		SetWindowCursor( GetFormHandle(cActiveJan ) , IDC_ARROW)

		Return
	Else 	



		nSalvai := nLineImg
		nLineImg := 0

		
		//DoMethod(cMenuName , "Hide")


		If nSalvai > 0
			BT_ClientAreaInvalidateRect ( cFormPrin , nSalvai  , 0,  180 , 50 , .t. )
			//msginfo('ok')
		End If 	

		RedrawMenu( aOpz1  )		
		RefreshLbl()

	End If

//	msginfo('1')



	cLblConsu := cContrl1	
	nLinha  := GetProperty(cF1, cContrl1, "Row" )
	nCnt:=0

	nix1 := ascan(aMrow , { |a| alltrim(a[1]) == alltrim(cOpcao) } )

	If nix1 > 0
		nLinha := aMRow[nix1][2]
	Else
		msginfo('nf')
	End If

	aSubOp := {}
	aSubRot := {}

	ShowButConsu(.f.)



	If (cOpcao <> 'Consultas')

		nInd := Ascan( aOpz1 , cOpcao )

		aeval(aOpz2 , { |a| Iif(Left(a[1] ,1) == alltrim(Str(nind)), aadd(aSubOp, a[1]  ) , ) } )
		aeval(aOpz2 , { |a| Iif(Left(a[1] ,1) == alltrim(Str(nind)), aadd(aSubRot, a[2]  ) , ) } )

		OBTN_Visible( cFormPrin , 5457 , .f.)
		OBTN_Visible( cFormPrin , 5458 , .f.)
		OBTN_Visible( cFormPrin , 5459 , .f.)
		OBTN_Visible( cFormPrin , 5460 , .f.)

		OBTN_Visible( cFormPrin , 5461 , .f.)				

		SetProperty(   cFormPrin , 'Label_Z1' , 'Visible' , .f. )

		xButConsul( .f. , .f. )



	Else
		nInd := 1


		EnchMtrConsul(cTabela)

		aeval( aConsultas , { |a| aadd(aSubOp , a) } )
		
		setProperty( cFormPrin , "LblQtConsu","Value", alltrim(Str( Len(aConsultas) )) )

		SetProperty(   cFormPrin , 'Label_Z1' , 'Visible' , .t. )

		OBTN_Visible( cFormPrin , 5457 , .t.)
		OBTN_Visible( cFormPrin , 5458 , .t.)
		OBTN_Visible( cFormPrin , 5459 , .t.)
		OBTN_Visible( cFormPrin , 5460 , .t.)
		OBTN_Visible( cFormPrin , 5461 , .t.)

		xButConsul( .t. , .f. )



		lHitBottom := .f.
		lHitTop    := .t.

		
		
		HMG_ChangeWindowStyle( GetFormHandle(cMenuName) ,  WS_THICKFRAME , NIL, .T., .T. )

		
		//EnableScrollBar (GetFormHandle(cMenuName), 1, .f. )

		


		// msginfo( aSubOp[  Len(aSubOp) - 1 ] + ' ' + Str(    Len(aSubOp)   )  )

	End If
	//msginfo('1')

	cOpsel := cOpcao

	nHeight := nTamSubMenuConsulta

	nLine1 := nLinha+80

	cSubMenuSel := ''

	
	SetProperty(  cFormPrin  ,   'Label_Sel1' ,   'Value' ,  ''    )						

	

	If Len(aSubOp) < nItMax
		nHeight := (Len(aSubOp) *  nItemSubHeight )+1

		nPulo  := nHeight+22

		nLineImg := 0

	Else

		If Len(aSubOp) > nItMax

			nPulo  := nHeight+62
			nLinRow := 0
			nItx1   := nItMax
			nQtElem := Len(aSubOp)
			lSalto  := .t.
		Else

		End If

	End If




	LimpaLabels(.f.)

	//CrieSubMenu(aSubOp)

	BT_ClientAreaInvalidateAll(   cMenuName )



	//Syswait(.2)


	
	SetProperty(cMenuName , "row" , nLine1)
	SetProperty(cMenuName , "col" , 1)

	nHeight := 300	
	SetProperty(cMenuName , "Height" , nHeight  )
	

	_ShowWindow( cMenuName )

	//msginfo('1')



	If (lSalto)
		nLineImg := GetProperty( cMenuName , "Row") + GetProperty( cMenuName , "Height" ) + 5
	End If


	If nLineImg > 0	
		//BT_ClientAreaInvalidateRect ( cActiveJan , nLineImg  , 0,  180 , 50 , .t. )

		BT_ClientAreaInvalidateRect ( cActiveJan , nLineImg, 0,  nLineImg+20 , 178 , .t. )
		//nItx1 := nItemSubHeight
	End If 	

 

	
	Setproperty( cFormPrin , 'Frame_1' , 'Visible' , .t.)

	
	/////////////////////////////////////////////////////////////msginfo('1')

	//msginfo('ok')

	If nInd < Len(aOpz1)
		nQtElem := Len(aSubOp)
		CrieMenuLabel(aOpz1 , nind , nPulo   )
	Else
		CrieMenuLabel(aOpz1)
	End If
		

	//msginfo('ok')	



	//SetWindowCursor( GetControlHandle( 'br_grid', cActiveJan ) , IDC_ARROW)
	SetWindowCursor( GetFormHandle(cActiveJan ) , IDC_ARROW)


	lTracking6  := .F. 



	
/*
	OBTN_Visible( cFormPrin , 5457 , .t.)

	OBTN_Visible( cFormPrin , 5458 , .t.)
	OBTN_Visible( cFormPrin , 5459 , .t.)

	OBTN_Enable( cFormPrin , 5458 , .f.)
	OBTN_Enable( cFormPrin , 5459 , .f.)
	*/

	//msginfo('ok')


	xButConsul(  .t.  )




Return 	


Function xButConsul(  lVisible , lAll   )


	Default lAll := .f. 
	

	SetProperty( cFormPrin , "LblQtConsu","Visible", lVisible )
	SetProperty( cFormPrin , "Label1","Visible",  lVisible  )

	  
	If (lVisible)
	

		OBTN_Visible( cFormPrin , 5457 , .t.)

		OBTN_Visible( cFormPrin , 5458 , .t.)
		OBTN_Visible( cFormPrin , 5459 , .t.)

		OBTN_Enable( cFormPrin , 5458 , .f.)
		OBTN_Enable( cFormPrin , 5459 , .f.)

		OBTN_Enable( cFormPrin , 5460 , .f.)	
		OBTN_Visible( cFormPrin , 5461 , .f.)


		DoMethod( cFormPrin , 'Label_z1' , 'Show')
		DoMethod( cFormPrin , 'Label_Sel1' , 'Show')


	Else 

		
		OBTN_Visible( cFormPrin , 5457 , .f.)
		OBTN_Visible( cFormPrin , 5458 , .f.)
		OBTN_Visible( cFormPrin , 5459 , .f.)

		OBTN_Enable( cFormPrin , 5460 , .f.)	

		OBTN_Visible( cFormPrin , 5461 , .f.)


		DoMethod( cFormPrin , 'Label_z1' , 'Hide')
		DoMethod( cFormPrin , 'Label_Sel1' , 'Hide')
		
		

	End If 	


	If (lAll)

		OBTN_Enable( cFormPrin , 5458 , .t.)
		OBTN_Enable( cFormPrin , 5459 , .t.)
		OBTN_Enable( cFormPrin , 5457 , .t.)

		
		OBTN_Enable( cFormPrin , 5460 , .t.)	

		OBTN_Visible( cFormPrin , 5461 , .t.)	
		OBTN_Enable( cFormPrin , 5461 , .t.)	

		//msginfo('ok')			



		DoMethod( cFormPrin , 'Label_z1' , 'Show')
		DoMethod( cFormPrin , 'Label_Sel1' , 'Show')


	End If 



Return 	


Function xDrawHead()

	//Local nHWnd     := ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin ))
	Local aMtrHeader    := xGetHeader()
	Local nHWnd         := ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan ))
	Local aM1   		:= {}
	Local aTams1    	:= xGetInfoHead('TAM')
	Local n1

	For n1 := 1 To Len(aMtrHeader)
		//Aadd(aM1    , hb_OemToAnsi(aMtrHeader[n1]) )

		Aadd(aM1    , hb_Utf8ToStr(aMtrHeader[n1]) )
		Aadd(aTams1 , aTams1[n1] )
	Next


	ControlBackX( nHWnd , {255,121,12} , aM1 , Len(aMtrHeader)  , aTams1 ,  nColSel  , nColOrder , 'img\setaa.bmp' , 'img\setab.bmp' , lAscendente )



Return


Function UpScrool( nDir , nTamanho )

	Local nIncre := nItemSubHeight

	Local nRow1  := 0

	Local lOk := .f.

//	lHitBottom := .f.
//	lHitTop    := .f.

	lUpdMenu := .f.

	If (nDir == 1) .And. (!lHitBottom)



		If nItx1 = nTamanho
			Return
		End If

		nLinRow := nLinRow + nIncre
		nItx1++



		lHitTop := .f.


		lOk := .t.
		If nItx1 = nTamanho
			lHitBottom := .t.
			lHitTop    := .f.
			lUpdMenu := .t.
		End If



		*// Linha 1 
		If ( nLinRow =   (1 * nIncre )   )

			lHitTop    := .f.			
			lUpdMenu   := .t.

		End If 	




	Else

		If (!lHitTop) .And. (nDir == 2)

		
			If nItx1 > nItMax
				nLinRow := nLinRow - nIncre
				nItx1--
				lOk := .t.


				If nItx1 = nItMax


					lHitBottom := .f.
					lHitTop    := .t.


					lUpdMenu := .t.

				Else

							*// Linha 1 
					If ( nItx1  =   (  (nTamanho - 1)   )   )
						
						lHitBottom := .f.	
						lUpdMenu   := .t.

					End If 	


				End If


			Else


				lHitBottom := .f.
				lHitTop := .t.
				lUpdMenu := .t.
				lOk := .t.


			End If

		End If



	End If


	IF (nDirAnt != nDir)
		nDirAnt := nDir
		lUpdMenu := .t.
	End If

	//SysWait(.1)


	If nClear > 0 

	//	nClear := nOpBak 	
		nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))

		BT_ClientAreaInvalidateRect( cMenuName , ( (nClear - 1) * nItemSubHeight) + nRow1  , 0 , 187 ,  nItemSubHeight - 1 , .t. )
		
		nOpselx := 0
		nOpBak  := 0
		nClear  := 0


	End If 	



	hwnd :=  GetFormHandle(  cMenuName  ) 


	If (lOk)
		_HMG_PRINTER_SETVSCROLLVALUE(   hWnd  , nLinRow )	
	End If



Return



Function Fx1( cTexto )


	Local nValue1 := GetProperty(  cActiveJan , 'Br_grid' , 'Value' )
	Local aItems := GetProperty(  cActiveJan , 'br_grid' , 'Items' )
	Local aCli := GetProperty( cactiveJan , 'br_grid', 'Item' ,   nValue1[1]    )
	Local cAx1 := 'FTop1' + Right( cActiveJan,5)
	Local cTexto1 := OBTN_Caption(cAx1   , aButtons[3][5] )

	Local nReg1 := 0

	//msginfo(   str( nItemId ) )
	If (cTexto = 'bloquear')

		If (cTexto1 = 'Bloquear')


			lBloqx := .t.
			If xBloquear( aCli[1] , 'Inativo' )
				nReg1 := Len(OpenReg( ''  , ,   1 ))
			End If
		End If


		If (cTexto1 = 'Desbloquear')


			lBloqx := .t.
			If xBloquear( aCli[1] , 'Ativo' )
				nReg1 := Len(OpenReg( ''  , ,   1 ))
			End If

		End If

	End If



	If (cTexto = 'novo')

		xCadCli( .t. )


		If lOkCad
			//yAviso('Ok cliente')
			lOkCad := .f.
			yAviso('Cliente Cadastrado com Sucesso!')
			nReg1 := Len(OpenReg( ''  , ,   1 ))
		End If

	End If

	If (cTexto = 'edit')

		xCadCli( .f.  , aCli[1] )

		If lOkCad
			//yAviso('Ok cliente')
			lOkCad := .f.
			yAviso('Cliente Modificado com Sucesso!')
			nReg1 := Len(OpenReg( ''  , ,   1 ))
		End If

	End If


RETURN

FUNCTION IntCli(  lSoConsulta )

	// setProperty("fClientes","Label_1","BackColor", {23,23,33} )
	// SysRefresh()



	LOCAL lBold      := .F.
	LOCAL lItalic    := .F.
	LOCAL lUnderline := .F.
	LOCAL lStrikeOut := .F.
	//Local cForm      := cFormJan
	Local nLargura := 0

	Local cFormPrin := cActiveJan

	Local cForm      :=  'FTop1' + Right(cActiveJan,5)

	LOCAL nB1 := IDC_BTN_1
	LOCAL nCol := 05


	Local nLinBut := nDeskTopHeight - 220

	Default lSoConsulta := .f.



	//SetWindowCursor (  GetControlHandle('br_grid' , cActiveJan)    , IDC_WAIT )


	SetProperty( cForm , "Width", nDeskTopWidth - 11)

	SetProperty( cMenuName , "Height", 354 )

	cFontName := 'Arial'

	


	If !lSoConsulta

		For nx1 := 1 TO Len( aButtons )

			//OBTN_Create( cForm, nB1, aButtons[ nx1 ][ 1 ],  01, nCol,  54,  32,  .T., .T., .T.,  8, aBtnColor, aBtnFont )

			//aBtnG1

			If OBTN_Handle( cForm, nB1 )  == 0 

				HB_SETCODEPAGE("UTF8")

				nLargura:= Iif(  nx1  != Len( aButtons ) , 80,110)

				If !(Alltrim(aButtons[ nx1 ][ 1 ]) $ cButVerde)
					OBTN_Create( cForm, nB1, hb_OemToansi(aButtons[ nx1 ][ 1 ])  ,  19 , nCol,  nLargura,  24,  .T., .T., .T.,  8 , aBtnColor, aBtnFont )
				Else
					OBTN_Create( cForm, nB1, hb_Utf8ToStr(aButtons[ nx1 ][ 1 ])   ,  19, nCol,  nLargura,  24,  .T., .T., .T.,  8 ,  aBtnG1  , aBtnFont )
				End If

				//lBold := .t.
				nFontSize := 8
				OBTN_Font( cForm, nB1,  { cFontName, nFontSize, .t. , lItalic, lUnderline, lStrikeOut } )


				aButtons[ nx1 ][ 5 ] := nB1			

				
				nCol += 88
				nB1++


				HB_SetCodePage("UTF8")	


				If (nX1 == 1)
					
					
					OBTN_Create( cFormPrin , 5457, "&Incluir" ,  nLinBut ,4,  56,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
					OBTN_Font( cFormPrin , 5457,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

					OBTN_Create( cFormPrin , 5458, "&Editar" ,  nLinBut,62,  56,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
					OBTN_Font( cFormPrin , 5458,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

					OBTN_Create( cFormPrin , 5459, "&Excluir" ,  nLinBut, 120 ,  56,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
					OBTN_Font( cFormPrin , 5459,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )


					OBTN_Create( cFormPrin , 5460, "&Rodar Consulta" ,  nLinBut - 185  , 35  ,  80,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
					OBTN_Font( cFormPrin , 5460,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

					
					OBTN_Create( cFormPrin , 5461, hb_UTF8TOSTR("&Cancelar Selecao") ,  nLinBut - 315  , 35  ,  125 ,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
					OBTN_Font( cFormPrin , 5461,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

					


					If !_IsControlDefined( 'Label_Z1' , cFormPrin)

						DEFINE LABEL Label_z1
							PARENT &cFormPrin
							ROW    nLinBut - 265
							COL    5
							WIDTH  350
							HEIGHT 24
							VALUE "Consuta Selecionada : "
							FONTNAME XFONT1
							FONTSIZE 9
							TOOLTIP ""
							FONTBOLD .T.
							FONTITALIC .F.
							FONTUNDERLINE .F.
							FONTSTRIKEOUT .F.
							HELPID Nil
							VISIBLE .F.
							TRANSPARENT .F.
							ACTION Nil
							AUTOSIZE .F.
							BACKCOLOR BACKVERDE1
							FONTCOLOR {78,78,78}
							VISIBLE .F.
						END LABEL

						DEFINE LABEL Label_Sel1 
							PARENT &cFormPrin
							ROW    nLinBut - 228 
							COL    5
							WIDTH  350
							HEIGHT 24
							VALUE "                      "
							FONTNAME XFONT1
							FONTSIZE 9
							TOOLTIP ""
							FONTBOLD .F.
							FONTITALIC .F.
							FONTUNDERLINE .F.
							FONTSTRIKEOUT .F.
							HELPID Nil
							VISIBLE .f.
							TRANSPARENT .T.
							ACTION Nil
							AUTOSIZE .F.
							BACKCOLOR NIL
							FONTCOLOR {0,0,0}
						END LABEL

					Else 


					End If 
					

					
					OBTN_Visible( cFormPrin , 5457 , .f.)

					OBTN_Visible( cFormPrin , 5458 , .f.)
					OBTN_Visible( cFormPrin , 5459 , .f.)				

					OBTN_Visible( cFormPrin , 5460 , .f.)				
					OBTN_Visible( cFormPrin , 5461 , .f.)									


					//sginfo('ok')



					//Syswait(.1)

					

				End If 



			End If 

		Next 

	End If


	*// Handle Eventos Instalado.

	//nEveButton := 0




	Aadd(aRotinas , { cFormPrin , aButtons , cTabela   })
	aBlocks := Aclone(aButtons)


	If (lOpcaoAberta)

		//msginfo('lp')
		SetProperty( cFormPrin , "LblQtConsu","Visible", .t. )
		SetProperty( cFormPrin , "Label1","Visible", .t.  )


		SetProperty( cFormPrin , "LblQtConsu","Row", nLinBut+30 )
		SetProperty( cFormPrin , "Label1","Row", nLinBut+30 )

		/*

		OBTN_Create( cFormPrin , 5457, "&Incluir" ,  nLinBut ,4,  56,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
		OBTN_Font( cFormPrin , 5457,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

		OBTN_Create( cFormPrin , 5458, "&Editar" ,  nLinBut,62,  56,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
		OBTN_Font( cFormPrin , 5458,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

		OBTN_Create( cFormPrin , 5459, "&Excluir" ,  nLinBut, 120 ,  56,  24 ,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
		OBTN_Font( cFormPrin , 5459,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

		*/

		//EventProcessAllHookMessage( EventCreate( {|| EventButton() },    OBTN_Handle( cFormPrin , 5457 )   ), .T. )
		//EventProcessAllHookMessage( EventCreate( {|| EventButton() },    OBTN_Handle( cFormPrin , 5458 )   ), .T. )
		//EventProcessAllHookMessage( EventCreate( {|| EventButton() },    OBTN_Handle( cFormPrin , 5459 )   ), .T. )


		//msginfo('pl1')



		OBTN_Visible( cFormPrin , 5457 , .t.)

		OBTN_Visible( cFormPrin , 5458 , .t.)
		OBTN_Visible( cFormPrin , 5459 , .t.)

		OBTN_Enable( cFormPrin , 5458 , .f.)
		OBTN_Enable( cFormPrin , 5459 , .f.)


	Else

		IF OBTN_Handle(cFormPrin , 5457) > 0

//			ReleaseButton(cFormPrin , 5457)
//			ReleaseButton(cFormPrin , 5458)
//			ReleaseButton(cFormPrin , 5459)

			/*
			OBTN_Visible( cFormPrin , 5457 , .f.)
			OBTN_Visible( cFormPrin , 5458 , .f.)
			OBTN_Visible( cFormPrin , 5459 , .f.)




			SetProperty( cFormPrin , "LblQtConsu","Visible", .f. )
			SetProperty( cFormPrin , "Label1","Visible", .f.  )
			*/

			xButConsul(.f. )

		End If


	End If


	


Return

Function GetTabelaX()

	Local cTabela := ''
	Local nIndice := Ascan(aRotinas , { |a| a[1] == cActiveJan})

	If nIndice > 0
		cTabela := aRotinas[nIndice][3]
	End If

Return cTabela

Function EnableButConsu(  lEnabled  )
	OBTN_Enable( cFormPrin , 5458 , lEnabled )
	OBTN_Enable( cFormPrin , 5459 , lEnabled )
REturn

Function ShowButConsu(lVisible)

	OBTN_Visible( cFormPrin , 5457 , lVisible)
	OBTN_Visible( cFormPrin , 5458 , lVisible)
	OBTN_Visible( cFormPrin , 5459 , lVisible)


	SetProperty( cFormPrin , "LblQtConsu","Visible", lVisible )
	SetProperty( cFormPrin , "Label1","Visible", lVisible )


	If lVisible
		OBTN_Enable( cFormPrin , 5458 , .f. )
		OBTN_Enable( cFormPrin , 5459 , .f.)
	End If

Return




FUNCTION EventButton()

	STATIC lTracking35 := .F.
	

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  nLParam := EventLPARAM()

	LOCAL lBold      := .F.
	LOCAL lItalic    := .F.
	LOCAL lUnderline := .F.
	LOCAL lStrikeOut := .F.

	Local nRow := 0
	Local nCol := 0
	Local nHeight := 0
	Local nValue1
	Local aItems
	Local aCli
	Local nindice
	Local nHnx1 := 0 
	Local nid 

	Local cControl := ''
	Local cForm    := ''



	LOCAL nind1
	LOCAL nIdBut := 0

	LOCAL n1
//	Local cFormx := cFormJan	

	Local cFormx := 'FTop1' + Right(cActiveJan,5)

	LOCAL ButHnd

	
	GetControlNameByHandle(nHWnd, @cControl, @cForm)


	If (Empty( Alltrim(cActiveJan))) .Or. ( Alltrim(cActiveJan) = "Main")
		Return
	End If

	If !lInitCompleto
		lInitCompleto := .t.
		Return
	End If



	If !_IsWindowDefined(cFormx)
		Return 
	End If 

	


	//msginfo(cFormx)

	nInd1 := AScan( aButtons, {| a| a[ 5 ] == nWParam } )



	For n1 := 1 TO Len( aButtons )


		IF ( OBTN_Handle( cFormX   , aButtons[ n1 ][ 5 ] ) == nHWnd )
			nIdBut := aButtons[ n1 ][ 5 ]
		END IF


		IF ( OBTN_Handle( cFormPrin  , 5457 ) == nHWnd )
			nIdBut := 5457
			cFormx := cFormPrin
		End If


		IF ( OBTN_Handle( cFormPrin , 5458 ) == nHWnd )
			nIdBut := 5458
			cFormx := cFormPrin
		End If

		IF ( OBTN_Handle( cFormPrin  , 5459 ) == nHWnd )
			nIdBut := 5459
			cFormx := cFormPrin
		End If

		

		IF ( OBTN_Handle( cFormPrin  , 5460 ) == nHWnd )
			nIdBut := 5460
			cFormx := cFormPrin
		End If

		

		IF ( OBTN_Handle( cFormPrin  , 5461 ) == nHWnd )
			nIdBut := 5461
			cFormx := cFormPrin
		End If



	Next 


	*// Eventos Botoes	
	If ( nIdBut > 0  )


		If ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking35)

			lTracking35 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag


			If (Alltrim(OBTN_Caption(cFormx, nIdBut )) $ cButVerde )
				OBTN_Color( cFormx, nIdBut, aBtnG2 , .T. )
			Else
				OBTN_Color( cFormx, nIdBut, aBtnSel, .T. )
			End If

			OBTN_Enable( cFormx, nIdBut, .T. )


			SetWindowCursor(  OBTN_Handle( cFormX , nIdBut )  , CURSORHAND   )


			nindx := Ascan( aButtons , { |a| a[1] == OBTN_Caption(cFormx , nIDBut) } )

			If (nindx > 0) .And. (nIdBut != 5457) .And. (nIdBut != 5458) .And. (nIdBut != 5459) .And. (nIdBut != 5460) .And. (nIdBut != 5461)
				If !Empty(Alltrim(aBlocks[nindx][4]))
					SetToolTip ( nHWnd  , aBlocks[nindx][4] ,  GetFormToolTipHandle (cFormx)  )
				End If

			Else

				If (nIdBut = 5457)
					SetToolTip ( nHWnd  ,  "Permitir Cadastrar uma nova Consulta." ,  GetFormToolTipHandle (cFormx)  )
				End If

				If (nIdBut = 5458)
					SetToolTip ( nHWnd  ,  "Modifica a Consulta Selecionada." ,  GetFormToolTipHandle (cFormx)  )
				End If

				If (nIdBut = 5459)
					SetToolTip ( nHWnd  ,  "Excluir a Consulta Selecionada." ,  GetFormToolTipHandle (cFormx)  )
				End If

				If (nIdBut = 5460)
					SetToolTip ( nHWnd  ,  "Executa a Consulta Selecionada." ,  GetFormToolTipHandle (cFormx)  )
				End If

				If (nIdBut = 5461)
					SetToolTip ( nHWnd  ,  "Cancela a Seleção da Consulta." ,  GetFormToolTipHandle (cFormx)  )
				End If


			End If

			//sysWait(.1)
		

		End If


		If ( nMsg == WM_MOUSELEAVE )

			If (Alltrim(OBTN_Caption(cFormx , nIdBut )) $ cButVerde)
				OBTN_Color( cFormx,  nIdBut, aBtnG1 , .T. )		
			Else
				OBTN_Color( cFormx,  nIdBut, aBtnColor, .T. )
			End If

			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

			lTracking35 := .F.

		End If



	Else


		*// Eventos Handle Header LstView
		If  (nHWnd = ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan ) )  )

		
			If nMsg == WM_LBUTTONDOWN				
				lSoltou := .f.
			End If

	
			If (nMsg == WM_LBUTTONUP)
				lSoltou := .t.
			End If



			If (nMsg == WM_MOUSEMOVE) .And. (lSoltou) .and. (!lOpcaoAberta)

				lSoltou := .f.
				//TimerRed()

				
				//xLimpSubMenu()
				lInvalid := .f.
				SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )



				If xPosMtrHead() .or. xMudouTam()
					//msginfo('ok')
					nColSel := 0
					//	BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) , Nil , .t. )
					xPosBrow()
					aLinhas := OpenReg( , ,   1 )

					nColSel := 0

					DoMethod( cFormPrin , "br_grid" , "Show")
					DoMethod( cFormPrin , "br_grid" , "Refresh")

					PostMessage( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) ,WM_MOUSELEAVE ,0,0)


					PostMessage( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) ,WM_MOUSELEAVE ,0,0)
					SendMessage( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) ,WM_MOUSELEAVE ,0,0)
				

				End If

				//lInvalid := .f.

				If !lInvalid
					xZeraHead()
				End If

			End If 					

			If (nMsg == WM_MOUSEMOVE) .And. (!lSoltou) .and. (!lOpcaoAberta)

				lSoltou := .f.

				
				//xLimpSubMenu()

				SysWait(.1)
				//TimerRed()

				lInvalid := .f.
				SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )



				GetCursorPos (@nCol, @nRow)
				
				aR1 := GetPos_ScreenToClient( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) , nRow, nCol )

				nColSel := xGetItMtr(ar1[2])

					
			End If

			


			If ( nMsg == WM_MOUSELEAVE )			
				nColSel := 0
			End If 

		

			If (nMsg == WM_MOUSEMOVE) .And. (!lSoltou) //.And. (!lOpcaoAberta)

				lInvalid := .f.
		

				SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )
		
			End If



			If (nMsg = WM_LBUTTONDBLCLK) .And. (!lOpcaoAberta)

				OrdeneCol(  nColSel )

				If !lInvalid
				//	xZeraHead()
				End If
				//TimerRed()

				lInvalid := .f.
				SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )



			End If	


			If (nMsg == WM_PAINT)

				If !lInvalid
					xDrawHead()						
				End If

			End If
	

		End If 



		*// Eventos Sub menu Consulta.

		/*

		If (_IsWindowDefined(cForm)) .And. (GetProperty(cForm , "HANDLE") == GetFormHandle( cMenuName ))
			//msginfo('ok')

			If  (nMsg == WM_MOUSEMOVE)

				//msginfo('opk')



				SetWindowCursor( GetControlHandle( cControl , cForm  ),  CURSORHAND )


				If !lTracking12


					SetProperty(cForm, cControl, "BACKCOLOR", CORSEL)
					SetProperty(cForm, cControl, "FONTBOLD", .T.)

					lTracking12 := TrackMouseEvent(nHWnd) //TME_LEAVE is default flag

					cTp1 := RetSql( "select observacao from consultas where descricao = " + QuotedStr( GetProperty(cForm, cControl, "VALUE" )  )  +  " and tabela = " + QuotedStr(cTabela) )

					If !Empty(cTp1)
						_SetToolTip(cControl,cForm,hb_AnsiToOem(cTp1 ) )
					End If

					//sysWait(.1)


				End If			


			End If 


			If nMsg == WM_MOUSELEAVE	

				If (cSubMenuSel != cControl)
				
					SetWindowCursor( GetControlHandle( cControl , cForm  ),  IDC_ARROW )

					SetProperty(cForm, cControl, "BACKCOLOR", BACK1)
					SetProperty(cForm, cControl, "FONTBOLD", .F.)


					lTracking12 := .F.

				End If 	

			End If 
			

			If nMsg == WM_LBUTTONDOWN

				cOpcao := GetProperty(cForm, cControl, "VALUE")
				

				nIndf := ascan(aOpz2 , {|a|  Right(a[1],Len(a[1]) - 2)   == alltrim(cOpcao) } )


				If alltrim(cOpSel) == 'Consultas'

					If _IsControlDefined( 'Label_Sel1' , cFormPrin )

						If (cSubMenuSel != cControl)

						
							lTracking12 := .F. 		

							If !Empty(Alltrim( cSubMenuSel))
                              
								SetProperty(cForm, cSubMenuSel, "BACKCOLOR", BACK1)
								SetProperty(cForm, cSubMenuSel, "FONTBOLD", .F.)


							End If 


							cSubMenuSel := cControl 

							SetProperty(  cFormPrin  ,   'Label_Sel1' ,   'Value' ,  Alltrim(cOpcao)    )						

							
							lTracking12 := .F. 					
							xButConsul( .t. , .t. )

							

						Else 					
					

							xCancelSel()


						End If 

					End If 


					/*	
					EnableButConsu(  .f.  )

					nIdConsulta := GetId(  'consultas' , Alltrim(cOpcao) )

					cTituloCon := Alltrim(cOpcao)

					nHnx1 := GetControlHandle(cLblConsu,cFormPrin)


					If (nIdConsulta > 0)

						If xInitMov(  nIdConsulta, , cTabela, .f. ,  cFormPrin )

						Else					

							Syswait(.1)

			
							PostMessage(  nHnx1 , WM_LBUTTONDOWN ,0,0 )
				
							Syswait(.1)	

							lTracking12 := .F. 
							
							_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  cMenuName  )  , (nQtElem - nItMax) * nItemSubHeight  )


						End If

						EnableButConsu(  .t.  )

					End If
		

				Else
					If nIndf > 0
						Eval(  aOpz2[nindf][2] )
					End If
				End If



				//Refreshall( cMenuName )


				If _isControlDefined('G4343' , cFormPrin)
					DoMethod( cFormPrin , 'G4343', 'Refresh')
				End If
				
			End If 


		End If 

		*/


		*//Eventos Form Principal.	
		If  (_IsWindowDefined(cForm)) .And.  (GetProperty(cForm , "HANDLE") == GetProperty(  cActiveJan  , "HANDLE" )) 	


			if left(cControl,3) = 'ien'
				   //msginfo('ok2')		
			   i := 1
			end if 	

			If nMsg == 5 // WM_SIZE

				msginfo('ok2333')	
				If nWParam == 2

				End If 	

				//SIZE_MAXIMIZED   2 


			End If 	



		
			If (nMsg == WM_LBUTTONDOWN ) .And. (Right(cActiveJan,3) = Left(cControl,3)) 
				xAbreOpMenu( cForm,cControl)	
				//PlaceJan()
			End If 	
            
			If (nMsg == WM_MOUSELEAVE) .And. ( Left(cControl,3) = Right(cActiveJan,3)) .And. (lOpcaoAberta)

				nColSel := 0				
		
				If !(Empty(Alltrim(cControl)))
		
					If !Empty(cLblSelected )
		
						If (alltrim(cControl) != alltrim(cLblSelected))
							SetProperty(cForm, cControl, "BACKCOLOR", {7,101,125}  )
							SetProperty(cForm, cControl, "FONTBOLD", .f.)
						Else
							lTracking6 := .t.
						End If
		
		
					Else
						SetProperty(cForm, cControl, "BACKCOLOR", {7,101,125}  )
						SetProperty(cForm, cControl, "FONTBOLD", .f.)
		
					End If
					lTracking6 := .f.
		
		
		
				End If

				
				SetWindowCursor( GetControlHandle( 'br_grid', cActiveJan ) , IDC_ARROW)
		
		
			End If
				
		
			
			If (nMsg == 512) .And. (Right(cActiveJan,3) = Left(cControl,3)) .And. (lOpcaoAberta) .And. (!lTracking6)
		
						
				SetWindowCursor( GetControlHandle( cControl , cForm  ) , CURSORHAND)
		
		
				SetProperty(cForm, cControl, "BACKCOLOR", CORSEL)
				SetProperty(cForm, cControl, "BACKCOLOR", {4,66,81})
				SetProperty(cForm, cControl, "FONTBOLD", .T.)
		
				lTracking6 := TrackMouseEvent(nHWnd)
				//lTracking5 := .f.
		
				//SysWait(.1)
		
				Return
				//lTracking6 := .f.
		
			End If




		End If 

		*// Eventos Objetos F1Top.
         If (nHWnd == GetProperty(  cFormx  , "HANDLE" ))


		 	If (nMsg == WM_DRAWITEM)

				nInd1 := AScan( aButtons, {| a| a[ 5 ] == nWParam } )

				If nInd1 > 0
					OBTN_Draw( nHWnd,  aButtons[ nind1 ][ 5 ], nLParam )
				End If 

			End If 	

		
			If nMsg == 273 // WM_COMMAND


				nID := LoWord( nWParam )

				If nID == IDOK
					nID := GetDlgCtrlID( GetFocus() )
				End If 
			
							
				nIdBt1 := AScan( aBlocks , {| a| a[ 5 ] == nId } )

				If ( nIdBt1 > 0 )
					PushButton( cFormx  , nId )
					aBlock := aBlocks[ nIdBt1 ][ 2 ]
					Eval( aBlock )
					lTracking35 := .f.
				End If			


			End If 


			
		End If 	



	End If


		*// Eventos Grid 
	If (nHWnd = GetControlHandle( 'br_Grid', cActiveJan ))
		

		If nMsg == WM_LBUTTONDOWN

			If _IsControlDefined('Br_Grid',cActiveJan)

				GetCursorPos (@nCol, @nRow)

				//SysWait(.1)

				aR1 := GetPos_ScreenToClient( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , nRow, nCol )

				//SysWait(.1)

				nTotal := 20 * (  Len(aLinhas) + 1)


				If (ar1[1] > nTotal )
					lInvalid := .f.
					//xZeraHead()
				End If

			End If


		End If

		If nMsg == WM_MOUSEMOVE			
			//xLimpSubMenu()
			//Syswait(.2)

		End If 




		If nWParam = VK_ESCAPE

			nI1 := Ascan(aCords , { |a| a[4] == cActiveJan})

			cIndJan := Right(aCords[nI1][1],4)			

			xFechaJan(cIndJan)

		

		End If




		If (nMsg == WM_LBUTTONUP)

			If !lInvalid
			//	xZeraHead()
			End If

			If _IsControlDefined('Br_Grid',cActiveJan)

				GetCursorPos (@nCol, @nRow)


				nHeight := GetProperty(cActiveJan , 'br_grid' , 'Height')

				aR1 := GetPos_ScreenToClient( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , nRow, nCol )

				If aR1[1] >= 600
					//BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )
					//SysWait(.1)

					//Syswait(.1)
					lInvalid := .f.
					SetProperty(cActiveJan , "Timer_1" , "Enabled" , .t. )
					

					//PostMessage(   listView_GetHeader(GetControlHandle( 'br_grid', cActiveJan ))  , WM_MOUSEMOVE,0,0)


	
				End If

			End If

		End If

	End If


RETURN





Function xCancelSel()


	Local nRow1 	

	If Empty(Alltrim( cSubMenuSel ))
		yAviso(  Hb_AnsiToOem("Não Existe Consulta Selecionada.") , .f. )
		return 
	End If 	

	
	nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))


	//nClear := nOpBak

	nOpselx := 0
	nOpBak := 0

	nClear := 0	
	

	//BT_ClientAreaInvalidateRect( cMenuName , ( (nClear - 1) * nItemSubHeight) + nRow1  , 0 , 187 ,  nItemSubHeight - 1 , .t. )

	BT_ClientAreaInvalidateAll(cMenuName)

	


	SetProperty(  cFormPrin  ,   'Label_Sel1' ,   'Value' ,  ' '    )	

	//Syswait(.1)

	lTracking12 := .F. 					
	xButConsul( .t. , .f. )

	cSubMenuSel := ''

	


Return 

Function xExecConsu(   cOpcao1  )

	Local nIdConsulta := GetId(  'consultas' , Alltrim(cOpcao1) )

	Local cTituloCon := Alltrim(cOpcao1)

	Local lRet       := .t. 

	Local nHnx1 := GetFormHandle( cMenuName )


	If (nIdConsulta > 0)

		If xInitMov(  nIdConsulta, , cTabela , .f. ,  cFormPrin )

		Else					

				
			xCancelSel()		
			lTracking12 := .F. 
						
			
			lRet := .f. 

			nOpselx := 0
			nOpBak := 0

			nClear := 0	
	
	
			BT_ClientAreaInvalidateAll(cMenuName)

			_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  cMenuName  )  , 0  )

			//xButConsul(   .t. , .f. )


		End If

	End If 


Return lRet 


Function xManutSub1( lNovo )

	Local nCont1 := Len(aSubOp)+1
	Local cLabelx := ''
	Local nRow 
	Local nIncre  := nItemSubHeight

	Default lNovo := .t. 


	SetWindowCursor( GetFormHandle(cActiveJan ) , HOURGLASS)


	If lNovo 

		xAbreOpMenu( cActiveJan , cLblConsu )

	Else 
		
		cLabelx := 'MenuCons' + StrZero(nItemz1 ,3)

		If _IsControlDefined( cLabelx, cMenuName )	
			SetProperty(  cMenuName , cLabel , "Value" , cNovoItem )	
		End If 	
		

    End If 	


	SetWindowCursor( GetFormHandle(cActiveJan ) , IDC_ARROW)



Return 	


Function EventHndCli( nHWnd, nMsg, nWParam, nLParam )

//FUNCTION EventHndCli()

	LOCAL nID
	LOCAL ButHnd

	LOCAL nRow, nCol

	Local cForm2

	Local cControl2

	Local copBak := ''
	Local nHnx1

	LOCAL nind1

	Local nRow1 := 0

	Local cOpcao 

	Local cForm
	Local nIdBut := 0


	Local cFormx := cFormJan

	Local cFormPrin := cActiveJan

	//Local cForm    := ''
	Local cControl := ''

	STATIC lTracking30 := .F.

	

	cForm := 'FTop1' + Right(cActiveJan,5)

	IF !_IsWindowDefined ( cForm )
		Return
	END IF

	IF !_IsWindowDefined ( cActiveJan )
		Return
	END IF


	If nSec11 = 0
		nSec11 := hb_MilliSeconds()
	End If

	If !lDrawHead

		TimerRed()


		If (hb_MilliSeconds() - nSec11) >= 20
			lDrawHead := .t.
		End If

	End If

	

	
	If (GetProperty(  cActiveJan   , "HANDLE" ) = GetProperty(cForm, "HANDLE"))

	End If 	


	IF nHWnd == GetProperty(  cActiveJan   , "HANDLE" )

		// msginfo('ok')
		// Return
		IF nMsg == WM_DRAWITEM
			IF (nWParam >=  5457) .and. ( nWParam <=  5461  )
				OBTN_Draw( nHWnd,  nWParam , nLParam )
			END IF
		END IF



		IF (nMsg == 273)

			
			nID := LoWord( nWParam )

			IF nID == IDOK
				nID := GetDlgCtrlID( GetFocus() )
			ENDIF

		

			If (nId == 5458)
				PushButton( cFormPrin  , nid )
				
				//GetControlNameByHandle(nHWnd, @cControl2, @cForm2)

				nHxn1 := GetControlHandle(cLblConsu,cFormPrin)

				cTab := GetProperty( cFormPrin  , cLblconsu , "Value" )

								
				nIdConsulta := GetId(  'consultas' , Alltrim(   cSubMenuSel   ) )

				If EditConsulta( cTabela , nIdConsulta)

					yAviso("Consulta Modificada com sucesso!" , .f.)

					xRefSubMenu()	
					xCancelSel()

					


				End If

				Return

			End If

	
			If nId == 5457
				PushButton( cFormPrin  , nid )
				zTabela(cTabela ,  GetFormHandle(cMenuName)   )
			End If 
					

			If nId = 5460

				PushButton( cFormPrin  , nId )

				If xExecConsu(  Alltrim( cSubMenuSel )  )

				End If 

			End If 

			
			If nId = 5461
				PushButton( cFormPrin  , nid )
				xCancelSel()				
			End If 



			
			IF nId == 5459
				
				PushButton( cFormPrin  , nId )

				
				nIdConsulta := GetId(  'consultas' , Alltrim(cSubMenuSel)  )


				If (nIdConsulta > 0) .And.  (Confirmaviso( Hb_AnsiToOem("Confirma Exclusão dessa Consulta ? ")  , cActiveJan , .f. ))

				
					ExcluiConsulta(nIdConsulta)
				

					nHxn1 := GetFormHandle(cMenuName)


					If (nHxn1 > 0)

										
						yAviso("Consulta Excluida com sucesso!" , .f. )

						
						SetWindowCursor( GetFormHandle(cActiveJan ) , HOURGLASS)	

						cOpBak := cOpsel 
						cOpSel := ''

					    //xManutSub1()
					
			
			
						_HMG_PRINTER_SETVSCROLLVALUE( nHxn1  , 0 )


						//Syswait(.2)

						
						SetWindowCursor( GetFormHandle(cActiveJan ) , IDC_ARROW)	

						nOpselx := 0
						nClear  := 0
						nOpBak  := 0

						BT_ClientAreaInvalidateAll( cMenuName )

						xCancelSel()						


					End If


				End If

				lTracking12 := .f.	

			END IF


		END IF


	END IF
	
	If nHWnd == GetProperty(  cMenuName , "HANDLE" )

		If ( nMsg == WM_MOUSELEAVE ) .And. (lTracking62)

			//nOpBak1 := nOpBak
			nOpselx := 0			


			
			BT_ClientAreaInvalidateAll( nHWnd  )
			
			//cSubMenuSel := ''


			If (nOpBak > 0) .And. (nOpBak != nOpselx)
				nOpselx := nOpBak

				BT_ClientAreaInvalidateRect( cMenuName , nRow1  +  ( (nOpselx - 1) * nItemSubHeight)  , 0 , 187 ,  nItemSubHeight - 1  , .t. )	
			End If 	


			If WinJan > 0
				SendMessage( WinJan, WM_SYSCOMMAND, SC_CLOSE, 0 )
				WinJan := 0 
			End If 	

			

			SetWindowCursor( nHWnd , IDC_ARROW )  			
			lTracking62 := .f. 


			//CloseJanTip(   nHwnd  )

			If _isWindowDefined("Win_Msg")
				If IsWindowVisible(  GetFormHandle("Win_Msg") )	   		
					//CloseJanTip(   GetFormHandle("Win_Msg")  ) 
					HideWindow( GetFormHandle("Win_Msg"))
					Syswait(.1)
				End If   
			End If 	

			//Syswait(.1)


		End If 
		


		If ( nMsg == WM_MOUSEMOVE ) 


			If (nOpselx > Len(aSubOp)) 
				return 	
			End If 	
			
		

			If nOpSelx > 0 
				nClear := nOpSelx		
			End If 	

			
			If nClear > 0 
				xLimpSubMenu()				
			End If 				

			//nClear := nOpSelx
			

			nOpselx := xOpSel1(  nHWnd )			

			IF (nOpselx = 0) .or. (nOpselx > Len(aSubOp)) 
				Return 
			End If 	


			cOpcao := aSubOp[nOpSelx]

			
		    If (cUltOpcaoSel = cOpcao)
				Return 
			End If 	

			If (nClear > 0) .And. (nClear <= Len(aSubOp))
				cUltOpcaoSel := aSubOp[nClear]
			Else
				Return 	
			End If 			

			
			
			SetWindowCursor( nHWnd , CURSORHAND)  

			nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))


			cTp1 := RetSql( "select observacao from consultas where descricao = " + QuotedStr( Alltrim(cOpcao) )  +  " and tabela = " + QuotedStr(cTabela) )


			cUltOpcaoSel :=  Alltrim(cOpcao) 

		
			If nOpselx > 0				
				BT_ClientAreaInvalidateRect( cMenuName , nRow1  +  ( (nOpselx - 1) * nItemSubHeight)  , 0 , 187 ,  nItemSubHeight - 1  , .t. )				
			End If 	


			
			If !Empty(Alltrim(cTp1))

				GetCursorPos (@nCol, @nRow)

				If !_isWindowDefined("Win_Msg")
					//WinJan := Notifier( nRow , 110 ,   alltrim(cTp1) ,, 0.5 )

					CrieJanTip( nRow - 35 , 30  ,   Alltrim(cTp1) ,, 0.5 )					
										
					
				Else 					
				//	HideWindow( GetFormHandle("Win_Msg"))

					SetTamJan( Alltrim(cTp1)  )	
					SetProperty( 'Win_Msg' , 'Row' , nRow - 35 )
					SetProperty( 'Win_Msg' , 'Label_1' , 'Value' , Alltrim(cTp1) )  
				    	
				End If 	

				If !IsWindowVisible(  GetFormHandle("Win_Msg") )
					SetTamJan( Alltrim(cTp1)  )					
				   _ShowWindow("Win_Msg")
				End If   

			
			Else 		
			     	
				HideWindow( GetFormHandle("Win_Msg"))				

			End If 


			SysWait(.1)
			lTracking62 := TrackMouseEvent(nHWnd)		

		

		End If 	

		If ( nMsg == WM_LBUTTONDOWN )

			//msginfo( Str(nOpselx) + ' '  + Str(nOpBak) ) 
		
			//nClear  := nOpselx
			nOpselx := xOpSel1(  nHWnd )		

			

			If (_IsControlDefined( 'Label_Sel1' , cFormPrin )) 
				 //.And. (nOpselx <= Len(aSubOp))

				If (cSubMenuSel != aSubOp[nOpselx] )

						
					lTracking12 := .F. 		

					If !Empty(Alltrim( cSubMenuSel))

						If nOpBak > 0 
							nClear := nOpBak 
						End If 	

						
						nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))

					
						BT_ClientAreaInvalidateRect( cMenuName , ( (nClear - 1) * nItemSubHeight) + nRow1  , 0 , 187 ,  nItemSubHeight - 1 , .t. )


					End If 



					cSubMenuSel := aSubOp[nOpselx] 

					SetProperty(  cFormPrin  ,   'Label_Sel1' ,   'Value' ,  Alltrim(cSubMenuSel)    )						
					nOpBak := nOpselx

					//cSubMenuSel := 

							
						
					lTracking62 := TrackMouseEvent(nHWnd)		
			
					xButConsul( .t. , .t. )

							

				Else 					
					

					xCancelSel()
					xLimpSubMenu()



				End If 

			End If 




		End If 	


    End If 		



	If nHWnd == GetProperty(  cForm, "HANDLE" )

		IF nMsg == WM_DRAWITEM

			nInd1 := AScan( aButtons, {| a| a[ 5 ] == nWParam } )
			IF nInd1 > 0
				OBTN_Draw( nHWnd,  aButtons[ nind1 ][ 5 ], nLParam )
			ENDIF



		ELSEIF ( nMsg == WM_LBUTTONDOWN )



		ELSEIF nMsg == 273 // WM_COMMAND

		ELSEIF nMsg == 16 // WM_CLOSE
			
			RETURN 1
		ENDIF

	ELSEIF IsWindowDefined( cForm ) .AND. ( nHWnd == GetProperty( cForm, "HANDLE" ) )
		IF nMsg == 43 // WM_DRAWITEM
			// IF ( nWParam == IDC_BTN_YES ) .OR. ( nWParam == IDC_BTN_NO )
			// OBTN_Draw( nHWnd, nWParam, nLParam )
			// ENDIF

		ELSEIF nMsg == 273 // WM_COMMAND
			nID := LoWord( nWParam )

			IF nID == IDOK
				nID := GetDlgCtrlID( GetFocus() )
			ENDIF

			msginfo('4343')


		End If 

	End If 

	//EventButton()

RETURN NIL

Function xLimpSubMenu()

	Local nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))

	If nOpselx > 0

		nClear := nOpselx	

		//nClear := nOpBak

		//SysWait(.1)
		BT_ClientAreaInvalidateRect( cMenuName , nRow1 + ( (nOpselx - 1) * nItemSubHeight)  , 0 , 187 ,  nItemSubHeight - 1 , .t. )

		//SysWait(.1)
		
	End If 	

Return 



Function xOpSel1( nHWnd1 )

	Local nCol := 0
	Local nRow := 0			
	Local ar1 
	Local NewPos 
	Local nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))

	GetCursorPos (@nCol, @nRow)

	aR1 := GetPos_ScreenToClient(   nHWnd1  , nRow, nCol )
	
	NewPos := GetScrollPos( GetFormHandle(  cMenuName  ), 1 ) 

	If NewPos > 0 
		nItem := (Int( (NewPos+Ar1[1])     / nItemSubHeight)+1)
	Else
		nItem := (Int(Ar1[1] / nItemSubHeight)+1)		
	End If 		



Return nItem 	


Function xRefSubMenu()

	
	Local nHnx1 := GetControlHandle(cLblConsu,cFormPrin)
	Local nincre := nItemSubHeight

	xManutSub1( .t.)

//	Syswait(.1)
	
	


	PostMessage(  nHnx1 , WM_LBUTTONDOWN ,0,0 )

	//Syswait(.1)


	//_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  cMenuName  )  , (nQtElem - nItMax) * nIncre  )



Return 

Function zTabela(cTabela1 , nZHandle)

	Local nHnx1 := GetFormHandle(cMenuName)

	Local nincre := nItemSubHeight

	
	Local nRow1 := -(GetProperty( cMenuName , "VscrollBar" , "Value"))

	Local cDesc1 := ''

	Local nItemQt := 0


	If (NovaConsulta(cTabela1))

		
		SetWindowCursor( GetFormHandle( cActivejan ) , HOURGLASS )
		xRefSubMenu()	


		nOpselx := 0
		nClear  := 0
		nOpBak  := 0
		BT_ClientAreaInvalidateAll( cMenuName )


		nItemQt := (nTamSubMenuConsulta / nItemSubHeight)

		If Len(aSubOp) > nItemQt 
	    	nSalto := ( Len(aSubOp) - nItemQt ) * nIncre 
		Else 
			nSalto :=  Len(aSubOp)  * nIncre 
		End If 	



		_HMG_PRINTER_SETVSCROLLVALUE(   nHnx1  , nSalto   )	
		
		

		lTracking62 := .f.
		lUpdMenu := .f.		

		
		SetWindowCursor( GetFormHandle( cActivejan ) , IDC_ARROW )


	End If

Return


Function GetUltConsu()

	  Local cSql := ''


Return 	



	PROC RDDSYS();  RETURN

Function RefreshLbl()		

	Local nx1 := 1
	Local cLabelx1 := ''

	
	For nx1 := 1 TO 200

		
		cLabelx1 := Right(cFormPrin,3) + StrZero(nx1,3)

		
		If _IsControlDefined(  cLabelx1, cFormPrin)
			//DoMethod( cFormPrin , cLabelx1  , "Release" )

			PostMessage( GetControlHandle( cLabelx1, cFormPrin  )  , WM_MOUSEMOVE ,0,0 )
			//SysWait(.1)

			PostMessage( GetControlHandle( cLabelx1, cFormPrin  )  , WM_MOUSELEAVE ,0,0 )
		//	SysWait(.1)

		End If
		

	Next





REturn 	



Function LimpaLabels( lDest )

	Local nx1 := 1
	Local cLabelx1

	Default lDest := .f.

	For nx1 := 1 TO 200

		///If !lDEst
			If _IsControlDefined('MenuCons' + StrZero(nx1,3) , cMenuName )
				DoMethod( cMenuName , 'MenuCons' + StrZero(nx1,3)  , "Release" )				
			End If

		//End If

		/*

		cLabelx1 := Right(cFormPrin,3) + StrZero(nx1,3)

		If lDest
			If _IsControlDefined(  cLabelx1, cFormPrin)
				DoMethod( cFormPrin , cLabelx1  , "Hide" )
			End If
		End If

		*/

	Next




Return

// Cria Sub menu na opï¿½ï¿½o Consultas.

Function CrieSubMenu(aSub1)

	Local n1
	Local nRow := 0
	Local nCont1 := 0
	Local cLabelx
	Local nHandle1

	Local cControl := ''
	Local cForm := ''

	// msginfo('ok')

	For n1 := 1 To Len(aSub1)


		nCont1++
		cLabelx := 'MenuCons' + StrZero(nCont1,3)

		If !_IsControlDefined( cLabelx, cMenuName )

			nQtElem++
			DEFINE LABEL &(cLabelx )
			PARENT    &cMenuName
			//PARENT    Main
			ROW       nRow
			COL       5
			WIDTH     170
			HEIGHT    nItemSubHeight
			VALUE     alltrim(  Right( aSub1[n1]  , Len(  aSub1[n1] ) - 2  ) )
			ALIGNMENT LEFT
			FONTCOLOR FONTCOR
			BACKCOLOR BACK1
			TRANSPARENT .f.
		END LABEL



		nHandle1 := GetControlHandle( cLabelx, cMenuName )

		//SetProperty( cMenuName , cLabelx , 'Enabled' , .f. )


		//EventProcessAllHookMessage(EventCreate({ || LabelEventH2() }, nHandle1  ), .T.)

		nRow += nItemSubHeight

	End If

Next


Return (nRow)



Function RefreshCli()

	//EventProcessAllHookMessage( nIndx1 := EventCreate({ || LabelEventH3() }, GetControlHandle( "Image_cima" , cFormPrin )) , .T.)
	//EventProcessAllHookMessage( nIndx2 := EventCreate({ || LabelEventH3() }, GetControlHandle( "Image_baixo" , cFormPrin ))  , .T.)

	//InstallEventHandler( 'LabelEventH3' )


Return


 




Function OrdeneCol( nIndice )

	Local nCol := nIndice
	Local nCount1 := GetProperty( cFormPrin , 'br_grid', 'ItemCount'  )
	Local n21

	//Msginfo( Str(nCol) )

	Local aM1 := {}

	nColOrder := nIndice

	If lOpcaoAberta
		yAviso( Hb_AnsiToOem("Opção Não Disponivel no Momento.") , .f. )
		Return
	End If


	For n21 := 1 to nCount1
		Aadd(aM1 , GetProperty( cFormPrin , 'br_grid', 'Item' , n21 )		)
	Next

	If !lAscendente
		aM2 := Asort(aM1 ,,,   { |a,b| a[nCol] <= b[nCol] } )
		lAscendente := .t.
	Else
		aM2 := Asort(aM1 ,,,   { |a,b| a[nCol] >= b[nCol] } )
		lAscendente := .f.
	End If

	DoMethod(cFormPrin , 'br_grid' , 'DeleteAllItems' )


	For n21 := 1 to Len(aM2)

		aZ1 := {}
		For n1 := 1 To Len(  aMtrHeader )
			Aadd(aZ1 , aM2[n21][n1])
		Next
		DoMethod(cFormPrin , 'br_grid' , 'AddItem' ,  az1  )

	Next


Return

Function xGetScrol( lMouseMove )


	Local nCol1 := 0
	Local nRow1 := 0
	Local aM1   := {}

	Local hWnd

	Local ar1

	Default lMouseMove := .f.


	If (nLineImg == 0)
		Return
	End If

	GetCursorPos (@nCol1, @nRow1)


	ar1 := GetPos_ScreenToClient( GetFormHandle(cActiveJan ) , nRow1, nCol1 )



	If (nLineImg > 0)

		Aadd(aM1 , {  nLineImg , nLineImg + 18 , 2, 179  }        )
		Aadd(aM1 , {  nLineImg + 19 , nLineImg + 40, 2, 179  }    )


		*// Cima
		If Ascan(aM1 , { |a|   (ar1[1] >= a[1]) .And. (ar1[1] <= a[2]) .And. (ar1[2] >= 2) .And. ( ar1[2] <= 181)  }  )  = 1

			If !lMouseMove
				UpScrool( 1 , nQtElem)
			Else
				SetWindowCursor( GetFormHandle(cFormPrin) , CURSORHAND)
			End If

		End If

		*// Baixo 
		If Ascan(aM1 , { |a|   (ar1[1] >= a[1]) .And. (ar1[1] <= a[2]) .And. (ar1[2] >= 2) .And. (ar1[2] <= 181)  }  ) = 2

			If !lMouseMove
				UpScrool( 2 , nQtElem)
			Else
				SetWindowCursor( GetFormHandle(cFormPrin) , CURSORHAND)
			End If

		End If

		*//Atualiza display do sub Menu	
		If (lUpdMenu)
			BT_ClientAreaInvalidateRect ( cFormPrin , nLineImg, 0,  178 , 35 , .t. )

			lUpdMenu := .f.
		End If

	End If


Return



Function PlaceJan(  cLbl , cJanela  )

	//Local cTexto := GetProperty('fSplit2',cLabel,'Value')
	Local nCol   := GetProperty('fSplit2',cLbl ,'Col')
	Local cTexto := GetProperty('fSplit2' ,cLbl , 'Value')
	Local cLblAnt := cLblSelected


	Local nCol1 := 0
	Local nRow1 := 0
	Local hWnd
	Local cControlName
	Local cFormName
	Local zCord

	Local nIndice := 0

	Default cJanela := ''


	//SysWait(.1)

	//msginfo(cTexto)


	GetCursorPos (@nCol1, @nRow1)

	hWnd := WindowFromPoint (nCol1, nRow1)


	//Msginfo(str(nCol1) + '  ' + cTexto )

	If !Empty( alltrim(cLblSelected ))

		If _IsControlDefined(cLblSelected , 'fSplit2' )
			SetProperty('fSplit2',cLblSelected ,'Visible', .t. )
			SetProperty('fSplit2', 'Img_' + Right(cLblSelected,4) , 'Visible' , .t. )

			If _IsControlDefined('Img' + Right(cLblSelected,4) , 'fSplit2' )
				SetProperty('fSplit2', 'Img' + Right(cLblSelected,4) , 'Visible' , .f. )
			End If
		End If

	End If

	cLblSelected := cLbl
	SetProperty('fSplit2',cLbl,'Visible',.f.)
	SetProperty('fSplit2', 'Img_' + Right(cLbl,4) , 'Visible' , .f. )

	//Aadd( aCords  , { cLabelx , nCol ,nCol+110} )

	nColSelx := nCol

	nIndice := Ascan(aCords , {|a| a[1] == cLblSelected})

	IF nindice > 0
		//nCol := aCords[nIndice][2]
	End If



	PutImagem(nCol , cTexto , Right(cLbl,4) )

	If !Empty(cJanela)
		//cActiveJan  := cJanela
		If _isControlDefined('br_Grid' , cJanela )
			BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cJanela  )) , Nil , .t. )
		End If

	End If

	//msginfo('ok')

Return



Function ShowJan( cJan)

	Local nindice := 0
	Local lMuda1 := ( Alltrim(cActivejan) != "Main")

	If _IsWindowDefined( 'F' + Left(alltrim(cJan),5) )

		*// Esconde janela atual.
		If (_IsWindowDefined(cActiveJan )) .And. (lMuda1)
		DoMethod(   cActiveJan   , 'Hide' )
	End If


DoMethod(   'F' + Left(Alltrim(cJan),5) , 'Show' )
DoMethod(   'F' + Left(Alltrim(cJan),5) , 'SetFocus' )

cactivejan := 'F' + Left(Alltrim(cJan),5)

BT_ClientAreaInvalidateAll (cActivejan)
SysWait(.1)

If _isControlDefined( 'br_grid' , cactivejan    )
	BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActivejan )) , Nil , .t. )
End If

nIndice := Ascan(aRotinas , { |a| a[1] == cActiveJan})

If nIndice > 0
	aBlocks  := Aclone(  aRotinas[nIndice][2]   )
End If


End If

Return


Function PutImagem(nColx , cTexto , cSeq1 )

	Local aRGBcolor := { 7, 101, 125 }
	Local nWidthBmp := 110

	Local nHandle1
	Local nHandle2
	Local hWnd
	Local BTstruct
	Local hDc
	Local nTYpe
	Local cImgName := 'Img' + cSeq1

	//msginfo( cImgName + ' -> ' + cSeq1)

	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , 40 , aRGBcolor)

	hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)

	BT_DrawGradientFillVertical ( hDC,   0 , 0  , nWidthBmp ,  40 , { 9, 125 , 155 } ,{3,48,58} )


	nTypeText    := BT_TEXT_TRANSPARENT
	//+ BT_TEXT_BOLD
	nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	nOrientation := BT_TEXT_NORMAL_ORIENTATION
	BT_DrawText (hDC, 8, 4 , alltrim(cTexto) , "arial", 9, WHITE, WHITE, nTypeText, nAlingText, nOrientation)

	BT_DeleteDC (BTstruct)


	If !_isControlDefined('Image_5' , 'fSplit2' )


		@ 1,nColx - 1 IMAGE Image_5 OF fSplit2 PICTURE NIL WIDTH nWidthBmp HEIGHT 40 STRETCH ACTION ShowJan( cTexto )

		If !_isControlDefined( cImgName , 'fSplit2' )
			@ 1,nColx+nWidthBmp - 1 IMAGE &cImgName OF fSplit2 PICTURE "Img\Closex.bmp" WIDTH 20 HEIGHT 40 STRETCH ACTION FechaJan( This.Name , .t. )

			

			EventProcessAllHookMessage(EventCreate({ || LabelEventHandler() },  GetControlHandle( cImgName ,  'fSplit2')   ), .T.)
			EventProcessAllHookMessage(EventCreate({ || LabelEventHandler() },  GetControlHandle( 'Image_5'  ,  'fSplit2')   ), .T.)
			EventProcessAllHookMessage(EventCreate({ || LabelEventHandler() },  GetControlHandle( 'Image_1'  ,  'fSplit2')   ), .T.)
			

		End If


		SetProperty('fSplit2','Image_5','Visible', .t.)
		SetProperty('fSplit2',cImgName,'Visible', .t.)

		//SysWait(.2)



		//msginfo('cr')


	Else

		If !_isControlDefined(cImgName , 'fSplit2' )


			@ 1,nColx+nWidthBmp - 1 IMAGE &cImgName OF fSplit2 PICTURE "Img\Closex.bmp" WIDTH 20 HEIGHT 40 STRETCH ACTION FechaJan( This.Name , .t. )


			SetProperty('fSplit2','Image_5','Visible', .t.)
			SetProperty('fSplit2',cImgName,'Visible', .t.)

			EventProcessAllHookMessage(EventCreate({ || LabelEventHandler() },  GetControlHandle( cImgName  ,  'fSplit2')   ), .T.)
			SetHandCursor( GetControlHandle( cImgName , 'fSplit2' ) , "Finger.cur" )

		End If


		SetProperty('fSplit2','Image_5','Visible', .t.)
		SetProperty('fSplit2',cImgName,'Visible', .t.)

		SetProperty('fSplit2','Image_5','Col',nColx )
		SetProperty('fSplit2',cImgName,'Col',nColx+nWidthBmp )

		//msginfo(Str(nColx))


		//SysWait(.2)



	End If

	//SysWait(.1)

	BT_HMGSetImage ("fSplit2", "Image_5",   hBitMap2, .t.)



	//bt_BitMapSaveFile( hBitMap2 , "e1.Bmp" )


	// BT_DeleteDC ( hDc )


Return


fUNCTION DrawTransp(cJan , zBitMap , cTitulo , nQreg , cTitConsu , cTitFltr )

	Local hDc
	LOCAL Width  := BT_ClientAreaWidth  (cJan)
	LOCAL Height := BT_ClientAreaHeight (cJan)

	Local hBit10
	Local hBit11

	Local nRow := 0
	Local nCol := 0

	Local nRx1 := 0

	LOCAL BTstruct

	Local cGrid := 'Br_Grid'

	LOCAL cFormName := ''

	Local nTypeText    := BT_TEXT_TRANSPARENT
	//+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

	Default nQreg := 0

	Default cTitulo := ''
	Default CtitConsu := ''

	Default cTitFltr := ''

	GetFormNameByHandle ( GetActiveWindow(), @cFormName )

	hDC    = BT_CreateDC ( cJan  , BT_HDC_INVALIDCLIENTAREA, @BTstruct)

	If lDrawMain
		//hb_memowrit('cli221ok.txt', 'Transp : ' + cJan + ' ' + Str(Width) + ' ' + Str(Height) + ' rrow : ' + Str(nRow) )
		nRow := 0
	End if


	If Flag_AlphaBlend_Effect


		BT_DrawGradientFillVertical (hDC,  nRow  ,  nCol  ,  Width,  Height , BLACK , BLACK)              //


		If !lTelaToda
			BT_DrawBitmapAlphaBlend (hDC, 0 ,  nCol  , nil, nil, 120 , BT_COPY  , zBitmap)
		Else
			BT_DrawBitmapAlphaBlend (hDC, GetProperty("fSplit2","Height" ) ,  nCol  , nil, nil, 120 , BT_COPY  , zBitmap)
		End If



		BT_DeleteDC (BTstruct )


	Else


		If (_isControlDefined( cGrid , cJan)) .And. (cJan = cactivejan)

			nZ2   := GetDeskTopHeight() - (GetProperty(cJan , cGrid ,'Row') + GetProperty(cJan , cGrid,'Height') )

			nRx1 := GetProperty(cJan , cGrid ,'Row') + GetProperty(cJan , cGrid,'Height')
			nC1  := GetProperty(cJan , cGrid,'Col')


			BT_DrawGradientFillHorizontal (hDC,  nRx1  ,  0  ,  GetProperty(cJan , cGrid,'Width'),   50   , {255,255,255} , {117,124,131} )              //

			If (nLineImg > 0)

				If !lHitBottom
					hBit10 := BT_BitmapLoadFile ( 'img\setab2.png')
				Else
					hBit10 := BT_BitmapLoadFile ( 'img\setab2d.png')
				End If


				If !lHitTop
					hBit11 := BT_BitmapLoadFile ( 'img\setac2.png')
				Else
					hBit11 := BT_BitmapLoadFile ( 'img\setac2d.png')
				End If

					// BT_COPY 
				BT_DrawBitmap (hDC, nLineImg      , 2   , 177, 17 , BT_STRETCH, hBit10)
				BT_DrawBitmap (hDC, nLineImg + 18 , 2   , 177, 17 , BT_STRETCH, hBit11)


			End If



		End If

	End If

	BT_DeleteDC (BTstruct)

REturn




Function TimerRed()


	If _isControlDefined(   'br_Grid'  , cFormPrin )



		BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cFormPrin )) , Nil , .t. )
		

		//Syswait(.1)


		//lInvalid := .f.

		//PostMessage(   listView_GetHeader(GetControlHandle( 'br_grid', cActiveJan ))  , WM_MOUSEMOVE,0,0)

		


	Else

	End If

REturn



	#pragma BEGINDUMP

	#include "SET_COMPILE_HMG_UNICODE.ch"
	#include "HMG_UNICODE.h"
	#include <windows.h>
	#include <winuser.h>
	#include "hbapi.h"
	#include "hbdefs.h"
	#include <commctrl.h>
	#include <tchar.h>
	#include <wingdi.h>
	#include <math.h>
	#include "hbvm.h"
	#include <shlobj.h>


	static HBRUSH CreateGradientBrush();
		static void GoToPoint();



	HB_FUNC( SETSYSCOLORSEX )
	{

	int aElements[1];
		DWORD aColors[1];

	aElements[ 0 ] = hb_parnl( 1 );
		aColors[ 0 ]   = hb_parnl( 2 );
		hb_retl (SetSysColors( 1, aElements, aColors ));

	}


	HB_FUNC(CONTROLBACKX)
	{
	HWND hWnd;
		HDC  hDC;
		RECT rect;
		RECT rect2;
		RECT rect3;
		HBRUSH hbrush;
		HBRUSH hbrush2;
		HBRUSH hBrushG;
		HPEN hPen;
		HPEN hPenOld;
		HFONT hFont;
		HBITMAP hBitMap2;
		HBITMAP hBitMap3;
		HBITMAP hBitMapx;
		BOOL lAsc;


	HPEN  hGrayPen = CreatePen( PS_SOLID, 1, RGB(23,32,24) );
		HPEN  hWhitePen = CreatePen( PS_SOLID, 1, GetSysColor(COLOR_BTNHIGHLIGHT) );


	TCHAR *FileUp 	= (TCHAR *) HMG_parc  (8);
		TCHAR *FileDown = (TCHAR *) HMG_parc  (9);

	lAsc = hb_parl (10);

	int  Transparent = 0;
		int nColOrder = (INT) HMG_parnl(7);


	PAINTSTRUCT ps;

	//TCHAR itemtext [1024];
		UINT uFormat = 0 ;

	INT nFontSize = 10;

	LV_COLUMN LVC;


	INT  nCol    = 1;

	hWnd   = (HWND) HMG_parnl (1);
		GetClientRect(hWnd, &rect);

	INT Count1   = Header_GetItemCount(  hWnd );
		//Hb_parnl

	INT Tam1;
		INT nColSel;

	INT nTop;

	Tam1 	= (INT) HMG_parnl(4);
		nColSel = (INT) HMG_parnl(6);

	INT i;

	hBitMap2 = HMG_LoadPicture ( FileUp, -1, -1, NULL, 0, Transparent, -1, 0, -1 );
		hBitMap3 = HMG_LoadPicture ( FileDown, -1, -1, NULL, 0, Transparent, -1, 0, -1 );

	INT Col1 = 3;
		INT Col2 = 0;


	hbrush = CreateSolidBrush( (COLORREF) RGB(hb_parvni(2, 1),
	hb_parvni(2, 2),
	hb_parvni(2, 3)) );

	hbrush2 = CreateSolidBrush( (COLORREF) RGB(139,139,139) );



	hDC = BeginPaint (hWnd, &ps);
		hBrushG = CreateGradientBrush(hDC, rect.right - rect.left + 1 ,   rect.bottom - rect.top - 1    , 2, 1,  (COLORREF) RGB(117,124,131) , (COLORREF) RGB(117,124,131)  );



	//hBrushG = CreateGradientBrush(hDC, rect.right - rect.left + 1 ,   rect.bottom - rect.top - 1    , 2, 1,  (COLORREF) RGB(255,255,255) , (COLORREF) RGB(255,255,255)  );

	FillRect(hDC,&rect,(HBRUSH) hBrushG );

	//SetTextColor(hDC,  RGB(0,0,0));

	SetTextColor(hDC,  RGB(255,255,255));


	SetBkMode(hDC, TRANSPARENT);


	TCHAR *cText = (TCHAR *) HMG_parvc(3, 1);

	SelectObject(hDC , CreateFont(14  , 0, 0, 0, FW_THIN , 0, 0, 0, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, VARIABLE_PITCH, "Arial Unicode MS"));

	//char Buffer[1024];

	int  code = (int)  LVIR_LABEL;


	//RECT rect;

	//SetRect(&rect2, 0 , 0 , (INT) hb_parvni(5, 1) ,  GetDeviceCaps( hDC , VERTRES)    );

	for ( i=1; i <= Tam1; i++ )

	{

	SelectObject(hDC , CreateFont(14  , 0, 0, 0, 0 , 0, 0, 0, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, VARIABLE_PITCH, "Arial Unicode MS"));

	//SetRect(&rect2, Col1+5 , 5 , hb_parvni(5, i) ,  GetDeviceCaps( hDC , VERTRES)  );

	SetRect(&rect2, Col1+3 , 4 , hb_parvni(5, i) ,  GetDeviceCaps( hDC , VERTRES)  );


	SetRect(&rect3, Col1 , 0 , Col1 + hb_parvni(5, i) ,   GetDeviceCaps( hDC , VERTRES) - 10 );

	if (i <= Tam1)
		{

		WindowBoxX(  hDC , &rect3 );
			}

		if (nColSel > 0)
			{
			if (nColSel == i)
				{
				SelectObject(hDC , CreateFont(14  , 0, 0, 0, FW_BOLD , 0, 0, 0, DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, VARIABLE_PITCH, "Arial Unicode MS"));
					FillRect(hDC,&rect3,(HBRUSH) hbrush2 );
					// Mouse por Cima - Cursor
				}

				}



				DrawText( hDC ,  HMG_parvc(3, i) , -1 ,  &rect2 , DT_NOCLIP  );

				Col1 += (INT) hb_parvni(5, i) ;

				if (nColOrder == i)
					{
					nTop = rect2.top;

					hBitMapx = hBitMap3;

					if (lAsc)
						{
						hBitMapx = hBitMap2;
							}


						DrawBitmapX( hDC, hBitMapx, nTop,   Col1-25 , 16 , 16 , 0 );

						}

						}



						ReleaseDC(hWnd, hDC);

						DeleteObject(hbrush);
							DeleteObject(hbrush2);
							DeleteObject(hBrushG);


						DeleteObject(hBitMap2);
							DeleteObject(hBitMap3);
							DeleteObject(hBitMapx);


						}



						void DrawBitmapX( HDC hDC, HBITMAP hBitmap, WORD wRow, WORD wCol, WORD wWidth, WORD wHeight, DWORD dwRaster )
						{
						HDC      hDCmem = CreateCompatibleDC( hDC );
							BITMAP   bitmap;
							dwRaster = SRCCOPY;

						SelectObject( hDCmem, hBitmap );
							GetObject( hBitmap, sizeof(BITMAP), (LPVOID) & bitmap );
							if( wWidth && (wWidth != bitmap.bmWidth || wHeight != bitmap.bmHeight) )
							{
							StretchBlt( hDC, wCol, wRow, wWidth, wHeight, hDCmem, 0, 0, bitmap.bmWidth, bitmap.bmHeight, dwRaster );
								}
						else
							{
							BitBlt( hDC, wCol, wRow, bitmap.bmWidth, bitmap.bmHeight, hDCmem, 0, 0, dwRaster );
								}

							DeleteDC( hDCmem );
								}



							void WindowBoxX( HDC hDC, RECT * pRect )
							{
							//HPEN hWhite = CreatePen( PS_SOLID, 2, GetSysColor( COLOR_BTNHIGHLIGHT ) );
								HPEN hWhitePen = CreatePen( PS_SOLID, 2 ,  (COLORREF) RGB(0,0,0) );
								HPEN hGrayPen = CreatePen( PS_SOLID, 2, GetSysColor( COLOR_BTNSHADOW ) );

							WndDrawBox( hDC, pRect, hGrayPen , hWhitePen );

							//WndBoxDraw( hDC,  pRect , hWhitePen, hGrayPen, 2 , 1 );

							DeleteObject( hGrayPen );
								DeleteObject( hWhitePen );
								}


							static void GoToPoint( HDC hDC, int ix, int iy )
							{
							POINT pt;

							MoveToEx( hDC, ix, iy, &pt );
								}


							void WndBoxDraw( HDC hDC, RECT *rct, HPEN hPUpLeft, HPEN hPBotRit, int nLineStyle, BOOL bHeader )
							{
							HPEN  hOldPen = SelectObject( hDC, hPUpLeft );
								HPEN  hBlack = CreatePen( PS_SOLID, 1, 0 );

							switch( nLineStyle )
							{
						case 0:
							break;

						case 1:
							SelectObject( hDC, hPBotRit );
								GoToPoint( hDC, rct->left, rct->bottom - (bHeader ? 1 : 0) );
								LineTo( hDC, rct->right - 1, rct->bottom - (bHeader ? 1 : 0) );
								LineTo( hDC, rct->right - 1, rct->top - 1 );
								if( bHeader )
								{
								LineTo( hDC, rct->left - 1, rct->top - 1 );
									}
								break;

							case 2:
								SelectObject( hDC, hPBotRit );
									GoToPoint( hDC, rct->right - 1, rct->bottom );
									LineTo( hDC, rct->right - 1, rct->top - 1 );
									break;

							case 3:
								SelectObject( hDC, hPBotRit );
									GoToPoint( hDC, rct->left, rct->bottom );
									LineTo( hDC, rct->right, rct->bottom );
									break;

							case 4:
								SelectObject( hDC, hPUpLeft );
									GoToPoint( hDC, rct->left, rct->bottom );
									LineTo( hDC, rct->left, rct->top );
									LineTo( hDC, rct->right, rct->top );
									SelectObject( hDC, hPBotRit );
									GoToPoint( hDC, rct->left, rct->bottom - (bHeader ? 1 : 0) );
									LineTo( hDC, rct->right - 1, rct->bottom - (bHeader ? 1 : 0) );
									LineTo( hDC, rct->right - 1, rct->top - 1 );
									break;

							case 5:
								rct->top += 1;
									rct->left += 1;
									rct->bottom -= 1;
									rct->right -= 1;
									DrawFocusRect( hDC, rct );
									break;
									}

								SelectObject( hDC, hOldPen );
									DeleteObject( hBlack );
									}



								void MaskRegion( HDC hdc, RECT *rct, COLORREF cTransparentColor, COLORREF cBackgroundColor )
								{
								HDC      hdcTemp, hdcObject, hdcBack, hdcMem;
									POINT    ptSize;
									COLORREF cColor;
									HBITMAP  bmAndObject, bmAndBack, bmBackOld, bmObjectOld, bmAndTemp, bmTempOld, bmAndMem, bmMemOld;
									HBRUSH   hBrush, hBrOld;

								ptSize.x = rct->right - rct->left + 1;
									ptSize.y = rct->bottom - rct->top + 1;

								hBrush = CreateSolidBrush( cBackgroundColor );

								hdcTemp = CreateCompatibleDC( hdc );
									hdcObject = CreateCompatibleDC( hdc );
									hdcBack = CreateCompatibleDC( hdc );
									hdcMem = CreateCompatibleDC( hdc );

								bmAndTemp = CreateCompatibleBitmap( hdc, ptSize.x, ptSize.y );
									bmAndMem = CreateCompatibleBitmap( hdc, ptSize.x, ptSize.y );
									bmAndObject = CreateBitmap( ptSize.x, ptSize.y, 1, 1, NULL );
									bmAndBack = CreateBitmap( ptSize.x, ptSize.y, 1, 1, NULL );

								bmTempOld = SelectObject( hdcTemp, bmAndTemp );
									bmMemOld = SelectObject( hdcMem, bmAndMem );
									bmBackOld = SelectObject( hdcBack, bmAndBack );
									bmObjectOld = SelectObject( hdcObject, bmAndObject );

								hBrOld = SelectObject( hdcMem, hBrush );

								BitBlt( hdcTemp, 0, 0, ptSize.x, ptSize.y, hdc, rct->left, rct->top, SRCCOPY );

								SetMapMode( hdcTemp, GetMapMode(hdc) );

								cColor = SetBkColor( hdcTemp, cTransparentColor );

								BitBlt( hdcObject, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0, SRCCOPY );

								SetBkColor( hdcTemp, cColor );

								BitBlt( hdcBack, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, NOTSRCCOPY );
									PatBlt( hdcMem, 0, 0, ptSize.x, ptSize.y, PATCOPY );
									BitBlt( hdcMem, 0, 0, ptSize.x, ptSize.y, hdcObject, 0, 0, SRCAND );
									BitBlt( hdcTemp, 0, 0, ptSize.x, ptSize.y, hdcBack, 0, 0, SRCAND );
									BitBlt( hdcMem, 0, 0, ptSize.x, ptSize.y, hdcTemp, 0, 0, SRCPAINT );
									BitBlt( hdc, rct->left, rct->top, ptSize.x, ptSize.y, hdcMem, 0, 0, SRCCOPY );

								DeleteObject( SelectObject(hdcMem, hBrOld) );
									DeleteObject( SelectObject(hdcTemp, bmTempOld) );
									DeleteObject( SelectObject(hdcMem, bmMemOld) );
									DeleteObject( SelectObject(hdcBack, bmBackOld) );
									DeleteObject( SelectObject(hdcObject, bmObjectOld) );
									DeleteDC( hdcMem );
									DeleteDC( hdcBack );
									DeleteDC( hdcObject );
									DeleteDC( hdcTemp );
									}


								void DrawMasked( HDC hDC, HBITMAP hbm, WORD wRow, WORD wCol )
								{
								HDC      hDcBmp = CreateCompatibleDC( hDC );
									HDC      hDcMask;
									HBITMAP  hBmpMask, hOldBmp2, hOldBmp1 = SelectObject( hDcBmp, hbm );
									BITMAP   bm;
									COLORREF rgbBack;

								if( GetPixel(hDcBmp, 0, 0) != GetSysColor(15) )
									{
									GetObject( hbm, sizeof(BITMAP), (LPSTR) & bm );
										hDcMask = CreateCompatibleDC( hDC );
										hBmpMask = CreateCompatibleBitmap( hDcMask, bm.bmWidth, bm.bmHeight );
										hOldBmp2 = SelectObject( hDcMask, hBmpMask );
										rgbBack = SetBkColor( hDcBmp, GetPixel(hDcBmp, 0, 0) );
										BitBlt( hDcMask, wRow, wCol, bm.bmWidth, bm.bmHeight, hDcBmp, 0, 0, SRCCOPY );
										SetBkColor( hDcBmp, rgbBack );

									BitBlt( hDC, wRow, wCol, bm.bmWidth, bm.bmHeight, hDcBmp, 0, 0, SRCINVERT );
										BitBlt( hDC, wRow, wCol, bm.bmWidth, bm.bmHeight, hDcMask, 0, 0, SRCAND );
										BitBlt( hDC, wRow, wCol, bm.bmWidth, bm.bmHeight, hDcBmp, 0, 0, SRCINVERT );

									//

									BitBlt( hDcBmp, 0, 0, bm.bmWidth, bm.bmHeight, hDC, wRow, wCol, SRCCOPY );

									//

									SelectObject( hDcMask, hOldBmp2 );
										DeleteObject( hBmpMask );
										DeleteDC( hDcMask );
										}

									SelectObject( hDcBmp, hOldBmp1 );
										DeleteDC( hDcBmp );
										}



									static HBRUSH CreateGradientBrush(HDC hDC, INT nWidth, INT nHeight, INT nShape, INT nDirection, COLORREF Color1, COLORREF Color2)
									{
									INT     R1, G1, B1, R2, G2, B2;
										HDC     hDCComp;
										HBITMAP hBitmap;
										HBRUSH  hBrush, hBrushOld, hBrushPat;
										HPEN    hPen, hPenOld;
										RECT    rcF;
										INT     nCount;
										INT     i;

									R1 = GetRValue(Color1);
										G1 = GetGValue(Color1);
										B1 = GetBValue(Color1);
										R2 = GetRValue(Color2);
										G2 = GetGValue(Color2);
										B2 = GetBValue(Color2);

									hDCComp = CreateCompatibleDC(hDC);
										hBitmap = CreateCompatibleBitmap(hDC, nWidth, nHeight);
										SelectObject(hDCComp, hBitmap);

									if (nDirection == 0)
										{
										rcF.left   = 0;
											rcF.right  = nWidth;
											rcF.bottom = nHeight;

										for (i = 0; i < nHeight; i++)
										{
										rcF.top = i;
											hBrush  = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nHeight), G1 + (i * (G2 - G1) / nHeight), B1 + (i * (B2 - B1) / nHeight)));
											FillRect(hDCComp, &rcF, hBrush);
											DeleteObject(hBrush);
											}
										}
									else if (nDirection == 1)
										{
										rcF.top    = 0;
											rcF.right  = nWidth;
											rcF.bottom = nHeight;

										for (i = 0; i < nWidth; i++)
										{
										rcF.left = i;
											hBrush   = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nWidth), G1 + (i * (G2 - G1) / nWidth), B1 + (i * (B2 - B1) / nWidth)));
											FillRect(hDCComp, &rcF, hBrush);
											DeleteObject(hBrush);
											}
										}
									else
										{
										rcF.left   = 0;
											rcF.top    = 0;
											rcF.right  = nWidth;
											rcF.bottom = nHeight;
											nCount     = ceil(((nWidth > nHeight) ? nHeight : nWidth) / 2);

										if (nShape >= 0)
											{
											for (i = 0; i < nCount; i++)
											{
											hBrush = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nCount), G1 + (i * (G2 - G1) / nCount), B1 + (i * (B2 - B1) / nCount)));
												FillRect(hDCComp, &rcF, hBrush);
												DeleteObject(hBrush);

											++rcF.left;
												++rcF.top;
												--rcF.right;
												--rcF.bottom;
												}
											}
										else
											{
											for (i = 0; i < nCount; i++)
											{
											hBrush = CreateSolidBrush(RGB(R1 + (i * (R2 - R1) / nCount), G1 + (i * (G2 - G1) / nCount), B1 + (i * (B2 - B1) / nCount)));
												hPen   = CreatePen(PS_NULL, 0, 0);

											hBrushOld = SelectObject(hDCComp, hBrush);
												hPenOld   = SelectObject(hDCComp, hPen);

											Ellipse(hDCComp, rcF.left, rcF.top, rcF.right, rcF.bottom);

											SelectObject(hDCComp, hBrushOld);
												SelectObject(hDCComp, hPenOld);

											DeleteObject(hBrush);
												DeleteObject(hPen);

											++rcF.left;
												++rcF.top;
												--rcF.right;
												--rcF.bottom;
												}
											}
											}

											hBrushPat = CreatePatternBrush(hBitmap);

											DeleteDC(hDCComp);
												DeleteObject(hBitmap);

											//ValidateRect

											return hBrushPat;
												}


											HB_FUNC( CURSORHAND )
											{
											hb_retnl( (LONG) SetCursor(LoadCursor(0, IDC_HAND)) );
												}

											HB_FUNC( CURSORNORMAL )
											{
											hb_retnl( (LONG) SetCursor(LoadCursor(0, IDC_ARROW)) );
												}




											HB_FUNC( CURSORESPERA )
											{
											hb_retnl( (LONG) SetCursor(LoadCursor(0, IDC_WAIT)) );
												}



											HB_FUNC( VALIDATERECTX )
											{
											hb_retnl(ValidateRect(  (HWND) HMG_parnl (1)  , NULL ));

											}

											/*

											HB_FUNC(XDRAWVIEW)
											{

											HBRUSH hbrush2;
												HWND hHWnd;
												RECT     rcText;
												HDC  hDC;

											DRAWITEMSTRUCT *pDIS = (DRAWITEMSTRUCT *) hb_parnl(4);

											INT nTextLen = GetWindowTextLength(pDIS->hwndItem) + 1;
												TCHAR *Text  = (TCHAR *) hb_xgrab(nTextLen * sizeof(TCHAR));
												GetWindowText(pDIS->hwndItem, Text, nTextLen);



											SetTextColor(pDIS->hDC, RGB(165,178,129));
												SetBkColor(pDIS->hDC,   RGB(239,249,121));

											SetBkMode( pDIS->hDC, TRANSPARENT);

											rcText.left   = pDIS->rcItem.left;
												rcText.top    = pDIS->rcItem.top ;
												rcText.right  = pDIS->rcItem.right;
												rcText.bottom = pDIS->rcItem.bottom;



											hbrush2 = CreateSolidBrush( (COLORREF) RGB(139,139,139) );

											FillRect(pDIS->hDC,&rcText,(HBRUSH) hbrush2 );


											//hb_xfree(Text);


											}

											*/

											HB_FUNC (BT_SCR_VALIDATERECT)
											{
											RECT rect;
												PHB_ITEM pArrayRect;

											if ( ! HB_ISARRAY (2) )
												hb_retl (ValidateRect( (HWND) HMG_parnl (1), NULL )); // Invalidate all client area
											else
												{
												pArrayRect = hb_param (2, HB_IT_ARRAY);

												if (hb_arrayLen (pArrayRect) == 4)
													{
													rect.left   = hb_arrayGetNL (pArrayRect, 1);
														rect.top    = hb_arrayGetNL (pArrayRect, 2);
														rect.right  = hb_arrayGetNL (pArrayRect, 3);
														rect.bottom = hb_arrayGetNL (pArrayRect, 4);
														hb_retl (ValidateRect( (HWND) HMG_parnl (1), &rect )); // Invalidate specific rectangle of client area
													}
												else
													hb_retl (FALSE);
														}
													}








													#pragma ENDDUMP









	/*
	void WindowBoxIn( HDC hDC, RECT * pRect )
	{
	HPEN hWhite = CreatePen( PS_SOLID, 1, GetSysColor( COLOR_BTNHIGHLIGHT ) );
	HPEN hGray = CreatePen( PS_SOLID , 1, GetSysColor( COLOR_BTNSHADOW ) );

	WndDrawBox( hDC, pRect, hGray, hWhite );

	DeleteObject( hGray );
	DeleteObject( hWhite );
	}
	*/


//	void WindowRd( HDC hDC, RECT * pRect )
//{
//HPEN hGray  = CreatePen( PS_SOLID, 1, GetSysColor( COLOR_GRADIENTACTIVECAPTION ) );
//HPEN hWhite = CreatePen( PS_SOLID, 1, GetSysColor( COLOR_GRADIENTACTIVECAPTION) );

//COLORREF BackColor1 = 0xFFFFFFFF;
//COLORREF BackColor2 = 0xFFFFFFFF;

//HPEN hWhite = CreatePen( PS_SOLID, 1, GetSysColor( COLOR_BTNHIGHLIGHT ) );
//HPEN hGray = CreatePen( PS_SOLID, 1, GetSysColor( COLOR_BTNSHADOW ) );


//RECT rt1 = pRect;

//HBRUSH hBrush;

//hBrush = CreateGradientB(hDC, pRect->right  - pRect->left, pRect->bottom - pRect->top  , 0 , 0 , BackColor1 , BackColor2);

//SetBkMode( hDC , TRANSPARENT );
//	WndDrawBox( hDC, pRect, hWhite, hGray );



//DeleteObject( hGray );
//DeleteObject( hWhite );
//}






//#pragma ENDDUMP








