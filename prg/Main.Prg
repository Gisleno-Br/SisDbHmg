// VERSAO 25/09/2021



#include <hmg.ch>
#include <minigui.ch>


#require "hbxpp"


#include <hmg.ch>
#include <dll.ch>






#define QUEBRA Chr(13)+Chr(10)

#define SB_LINEUP           0    // ok
#define SB_LINEDOWN         1    // ok

#define _STM_SETIMAGE_ 0x0172
#define _IMAGE_BITMAP_ 0

#define SB_HORZ 0
#define SB_VERT 1
#define SB_LEFT 6
#define SB_TOP 6
//#define SB_LINEUP 0RGB(0xcc,0xe3,0xe1)RGB(0xcc,0xe3,0xe1)
#define SB_ENDSCROLL 8
#define WM_VSCROLL  0x0115
#define WM_HSCROLL 276

// #DEFINE SB_VERT 1
#define SB_BOTH 3




#define LABEL_NAME 1
#define LABEL_HWND 2

#define ARROWCURSOR          1  // The standard arrow cursor.
#define BUSYCURSOR           2  // An hourglass or watch cursor, usually shown during operations that allow the user to interact with the application while they are performed in the background.
#define POINTINGHANDCURSOR   3  // A pointing hand cursor that is typically used for clickable elements such as hyperlinks.
#define WAITCURSOR           4  // An hourglass or watch cursor, usually shown during operations that prevent the user from interacting with the application.

MEMVAR _HMG_SYSDATA


#define FONTCOR {0,106,133}

#define BACK1 {229,237,242}

#define BACK5 {255,255,255}


#define CORSEL {215,228,236}
//{180,205,220}
//{216,228,236}

#define FONT1 {102,102,102}




#define SM_CXFRAME	32
#define SM_CYFRAME	33





Static lSubOpen := .f.


//DECLARE WINDOW fSplit10

DECLARE WINDOW Win_MenuPrincipal




REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850

//SET AUTOSCROLL ON


/*
Prg\BrwMtr\xBarHMtr.Prg
Prg\BrwMtr\xBrowserMtr.Prg
Prg\BrwMtr\xHeaderMtr.Prg
*/









FUNCTION Main


	Public cForm := ''
	PUBLIC aBackColor := { 57, 108, 164 }


	Public nVirtualMenu := Nil




	Public aRotHnd := {}
	Public lAtivaBlack := .f.

	

	Public nColTamMenu := 205

	//Public nIt5 := 0


	Public nSizeFont := 9



	Public nConst1 := 60
	Public nConst2 := 0

	Public FONTBROWSER := 'Lucida Sans Typewriter'
	//'Lucida Sans Typewriter'

	Public FONTBROWSERSIZE := 9

	SET TOOLTIPCUSTOMDRAW ON
	SET TOOLTIPSTYLE BALLOON
	SET TOOLTIPBACKCOLOR { 250, 250, 210}

	SET NAVIGATION EXTENDED


	Public nHSCrool := 10
	Public cJanx

	Private lExit := .f.

	Private cSalvaJan := ''

	Public CURSORHAND := "img\Hand_Cursor.cur"

	

	Private aCords := {}

	Private aButx1 := {}

	Private  lTracking42 := .f.
	Private  lTracking142 := .f.

	Private aBmpSv1 := Nil

	Public nGradDirF  := 0
	Public cFontName  := 'Arial'
	Public nFontSize  := 8



	Public nTxColorE  := Rgb( 79, 79, 79 )
	Public nFrColorE  := Rgb( 207, 207, 207 )

	Public cBrowDbActive := ''
	Public cActiveMdi    := ''

	Public nPosScr := 0

	Public nBkColorE1 := Rgb( 251, 251, 251 )
	Public nBkColorE2 := Rgb( 230, 230, 230 )

	Public nGradDirE  := 0
	Public nTxColorD  := 0x808080

	Public nFrColorD  := Rgb( 232,232,232 )
	//{ 9, 111, 137 }

	Public nBkColorD1 := 0XE0E0E0
	Public nBkColorD2 := 0XE0E0E0
	Public nGradDirD  := 0
	Public nTxColorF  := Rgb( 45, 55, 56 )
	Public nFrColorF  := nFrColorE

	Public nTxColorG := Rgb( 64 , 128 , 128 )
	Public nBkColorG1 := Rgb( 64 , 128 , 128 )
	//Private nFrColorG


	Public nBkColorF1 :=  0xFFFFFF
	Public nBkColorF2 :=  Rgb( 192, 192, 192 )

	Public lDebug := .f. 



	Private cObjSelected := ''


	SET SCROLLSTEP TO 10

	PUBLIC cBackColor := { 166, 210, 210 }

	public lTracking6 := .f.


	PUBLIC bColor := {|| iif( ( LastRec() > 0 ) .AND. ( RecNo() / 2 == Int(RecNo() / 2 ) ), { 238,238,238 }, { 255,255,255 } ) }

	PUBLIC fColor := {|| iif( ( LastRec() > 0 ) .AND. ( AllTrim(Status ) == 'Ativo' ), { 78,78,78 },  { 255, 0, 0 } )  }

	Public HOURGLASS := 'IMG\HourGlass.Cur'

	Private lFlagOk := .f.


	Public bColorGrid := {|| iif( ( LastRec() > 0 ) .AND. ( RecNo() / 2 == Int(RecNo() / 2 ) ), { 235,243,242 }, {211,231,230} ) }

	
	Public aBtnG1 := ;
		{ { Rgb(255,255,255) , Rgb( 178 , 178 , 178 ) , Rgb( 58 , 174 , 203 ) , Rgb( 58 , 174 , 203 ), nGradDirE }, { Rgb( 178 , 178 , 178 ) , nFrColorD, Rgb( 178 , 178 , 178 ), nBkColorD2, nGradDirD }, { RGB(255,255,255) , nFrColorF, Rgb( 54 , 100 , 109 )  , Rgb( 54 , 100 , 109 )  , 		 					nGradDirF } }
	
	Public aBtnG2 := ;
		{ { Rgb(255,255,255) , {54,100,109} , Rgb( 44 , 169 , 139 ) , Rgb( 20 , 158 , 192 ), nGradDirE }, { {255,255,255}  , nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { RGB(255,255,255) , Rgb( 54 , 100 , 109 ) , Rgb( 54 , 100 , 109 ) ,  Rgb( 54 , 100 , 109 )  , 		 					nGradDirF } }


	
	Public aBtnSel := ;
		{ { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, nGradDirF }, { nTxColorD, nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, 						nGradDirF } }
	
		

	Public lVScrool := .f.

	Public lTelaToda := .f.


	Public lBold      := .t.
	Public lItalic    := .F.
	Public lUnderline := .F.
	Public lStrikeOut := .F.

	
	
/*
	Private aOpx1 := {}

	Private nItemx1 := 0

	Private nScrLin := 0

	Private nLinhaAtual := 0

	Private nItemClr := 0

	Private l_Httb := .f.
	Private l_Http := .t.


	Private cOpSely := ''

	*/



	PRIVATE lOnToolTipCustomDraw := .T.

	Private cUltOpcaoSel := ''





	SET TOOLTIPSTYLE BALLOON

	SET TOOLTIPFORECOLOR BLUE

	SET TOOLTIPCUSTOMDRAW TO lOnToolTipCustomDraw   // F



	Public Corg1 := {255,255,125}
	Public Corg2 := {4,57,70}

	PUBLIC cDiaName := 'fDialogo'

	Public XBACK1 := {232,246,239}

	Public XFONT1  := 'Arial Unicode MS'
	Public XFONT2  := 'Trebuchet MS'
	//'Arial Narrow'
	//'Arial Rounded MT Bold'


	Public BACKVERDE1 := {233,246,237}

	Private nSec1 := 0
	PRIVATE nDEsk1 := 975


	Private nacumz := 0
	Private aMtrPos := {}

	PRIVATE aButtons := {}

	Private nindexHndcli := 0

	Private lTracking12 := .F.

	Private cOpBak := ''

	Private lTracking62 := .F.

	//Private nItemDrop1   := 0
	//Private nHeightDrop  := 0
//	Private lSetasDown   := .f.




	REQUEST HB_LANG_PT
	REQUEST HB_CODEPAGE_PT850

	Private cFormJan := ''


	Public nItemSubHeight := 20
	Public nColIniBrw := 17

	Private nTamSubMenuConsulta := 300


	Private nMaxItem1 := 0




	PUBLIC cRazaoEmp     := ''
	PUBLIC cFantadisEmp  := ''
	PUBLIC cEnderecoEmp  := ''

	PUBLIC cUfEmp        := "AL"

	Public lDrawMain := .f.

	Private aBlocks := {}

	Private nLinSc := 0
	PUBLIC  cServer := ''
	PUBLIC  cBanco  := ''
	PUBLIC cUserDb  := ''
	PUBLIC cPassDb  := ''

	Public cUserName := 'Admin'

	Private nColSelx := 0


	PUBLIC cBairroEmp    := ''
	PUBLIC cCidadeEmp    := ''

	

	PUBLIC qTotReg       := 150

	PUBLIC nVirtual1     := 540

  *// VARIAVEIS CONTROLE SUBMENU PRINCIPAL

	Private nItemHeight := 16  // Height do item do menu
	Private nAlturaJan := 198  // Height do SubMenu Principal

	Private nItemMax := Int(nAlturaJan / nItemHeight)

	Private lEventx  := .f.


	Private nItemSel := 0

	PUBLIC nIdEmp        := 1

	PUBLIC cSqlLog       := "Logs\Sqlx1_Log_" + DToS( Date() ) + ".Log"


	SET LANGUAGE TO PORTUGUESE
	SET CODEPAGE TO PORTUGUESE

	SET AUTOSCROLL ON

	//PUBLIC cUfEmp        := ''
	PUBLIC cResponEmp    := ''
	PUBLIC cCnpjEmp      := ''

	PUBLIC cTelEmp        := ''
	PUBLIC cDtExp         := ''
	PUBLIC cCepEmp        := ''


	Public Flag_AlphaBlend_Effect := .f.






	PUBLIC aEmpresa       := {}

	PUBLIC dDataBase      := Date()

	Public nLevelMenu     := 1

	Public cActiveJan  := 'Main'
	Public aJanelas    := {}

	Private cOpAberto := ""

	Private nContItens := 0

	Private TxColorE  := Rgb( 255, 255, 255 )
	Private FrColorE  := Rgb( 9, 111, 137 )

	Private lTracking2 := .F.

	Public cLblSelected := ''


	//{ 9, 111, 137 }

	Private BkColorE1 := Rgb( 9, 111, 137 )
	Private BkColorE2 := Rgb( 9, 111, 137 )

	Private lApaga := .f.

	Private lOut := .t.

	Private hBitmapDes := 0

	Private hBit2      := 0
	Private hBitMain   := 0




	Private hBit10      := 0
	Private hBit11      := 0
	Private hBit12      := 0

	Private hBit13      := 0

	Private hBit20      := 0

	Private GradDirE  := 0
	Private TxColorD  := 0x808080

	Private FrColorD  := Rgb( 232,232,232 )
	//{ 9, 111, 137 }

	Private BkColorD1 := 0XE0E0E0
	Private BkColorD2 := 0XE0E0E0
	Private GradDirD  := 0
	Private TxColorF  := Rgb( 45, 55, 56 )
	Private FrColorF  := FrColorE

	Private nSubMenuItem := 0

	Private hBitmap := 0
	Private hBitmap2 := 0
	Private hBitmap3 := 0
	Private hBitmap4 := 0
	Private hBitmap5 := 0




	

	Private hBitmap25 := 0

	Private hBitmap6 := 0

	Private BkColorF1 :=  0xFFFFFF
	Private BkColorF2 :=  Rgb( 192, 192, 192 )

	Private GradDirF  := 0
	//Private cFontName  := 'Arial'
	Private FontSize  := 8

	//Private nColScrool := 0


	

	Private lScrool := .t.

	Private aBtnFont  := { cFontName , 8, .F., .F., .F., .F. }

	Public aBtnCorSl := ;
		{ { TxColorE, FrColorE, BkColorE1, BkColorE2, GradDirE }, { TxColorD, FrColorD, BkColorD1, BkColorD2, GradDirD }, { TxColorF, FrColorF, BkColorF1, BkColorF2,GradDirF } }

	Public aBtnSl := ;
		{ { TxColorF, FrColorF, BkColorF1, BkColorF2, GradDirF }, { TxColorD, FrColorD, BkColorD1, BkColorD2, GradDirD }, { TxColorF, FrColorF, BkColorF1, BkColorF2,	GradDirF } }

	

	Public aBtnColor := ;
		{ { nTxColorE, nFrColorE, nBkColorE1, nBkColorE2, nGradDirE }, { nTxColorD, nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, 		 					nGradDirF } }
	

	Public nDesktopHeight := GetDesktopHeight()

	Public nDesktopWidth := GetDesktopWidth()

	Public lMainJan := .t.


	// Cor de Fundo Menus
	Public  aCorSub2   := {234,249,255}

	Public  aCorSub1   := {229,237,242}

	Public aMenuBarCor := {216,228,236}


	Public  aFonteSub1 := { 79 , 84 , 94}

	Public CorDisabled := {192,192,192}

	Public CorDisabled2 := {230,230,230}




	Public nXSizeFrame := GetSystemMetrics( SM_CXFRAME )
	Public nYSizeFrame := GetSystemMetrics( SM_CYFRAME )


	Public nMaximizedWindowCol    := 0 - nXSizeFrame
	Public nMaximizedWindowRow    := 0 - nYSizeFrame
	Public nMaximizedWindowWidth  := GetDesktopRealWidth()  + nXSizeFrame * 2
	Public nMaximizedWindowHeight := GetDesktopRealHeight() + nYSizeFrame * 2




	SET DATE BRIT
	SET(_SET_DATEFORMAT,"DD/MM/YYYY")

	SET NAVIGATION EXTENDED



	Set AutoScroll On
	Aadd(aJanelas , { 'Main' , 'Main'  , 0}  )






	//Load Window fSplitSubMenu


	Private aRotinas := {}

	//Private nMainSel  := 0
	Private nClearSel := 0

	Private cOpMainSel  := ''





	//HB_SetCodePage( "UTF8")

	Private aOpcoes := {{"1-Cadastro",  "Acesso a Cadastros Gerais e Principais." , .t.  }, ;
		{"2-Movimentos"				,   "Acesso a Movimentação de Estoque"   , .t.  },;
		{"3-Relatórios"				,   "Relatorios do Sistema"  ,   .f. }  ,;
		{"4-Parametros"				,  	"Parametros e Configurações Gerais" , .t.  } }


	//cOpMainSel  := aOpcoes[1][1]






	Private nOpSel := 0

	Private aItens := { {"1-Clientes","Cadastro de Clientes" , .t.  , {  ||xCliente()  }  , .f. } , ;
		{ "1-Fornecedores","Cadastro de Fornecedores" , .t.  ,  { || xFechaMen() } , .t.  , { |a,b,c,d| xTesMenu( 'MenCli1' ,a,b,c,d)   }    } , ;
		{ "1-Vendedores", "Cadastro de Vendedores" , .f.  , Nil , .f.  } , ;
		{"1-Colaboradores","Colab1 ......." , .f. } ,   {"1-Grupo Produtos","" , .f. , Nil  } , ;
		{"1-Locais Estoque","Estoque 1......" , .t.  , Nil } , {"1-Funções","" , .f. , Nil } , ;
		{"1-Categoria Produto", "" , .t. , { |a|  MsgInfo( ' zz ' +   Str(a)  ) } , .f. } , {"1-Unidades","" , .t. , Nil } , {"1-Tipo Produtos","",.f. , Nil  } ,;
		{"1-Tipo Produto1s","" , .t. , Nil  },{"1-Tipo Produto2s","", .t. , Nil } ,{"1-Tipo Produt3os","" , .t. , Nil },{"1-Tipo Produt222os","", .f. , Nil  },{"1-Tipo 444Produtos","", .f. , Nil  }, ;
		{ "1-Rotatividade","Rot" , .t. , Nil } , {"1-TES","TES1" , .t. , Nil  } , ;
		{"2-Pedidos","Vendas" , .t.  , Nil } , {"2-Orçamento","Orçamento" , .t. , Nil }  , {"3-Listagem Clientes","Lista" , .f. , Nil  } ,    {"4-Configurações","" , .f. , Nil  } }


	

	Load Window Main


	//Main.Maximize()



	Private nRowIni := 10

	//HB_SETCODEPAGE("UTF8")

	n := 1






	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHndMain"  ) )  ) = 0
		InstallEventHandler( "EventHndMain" )
	End If


	nEveLabel := 0









	Private aButTop := {}





	//xMenuMain( 'Main' ,  70 , 1  , aOpcoes , aItens )
	xTesMenu(  'MenuY1', 50 , 450 , {} , 0 )




	_ShowWindow('Main')


	Main.Activate








RETURN

Function MainFocus()

     //msginfo('ok23')

	// DoEvents()
     If _IsWindowDefined('Win_MenuPrincipal')
	 	//msginfo('ok2')
	//	yDCMenu1()
	//	SysWait(.3)
	 Else 
	//    xMenuMain( 'Main' ,  70 , 0  , aOpcoes , aItens )	
	 End If 

REturn 


Function xCliente()



	If ( FindWindowEx( ,, , "Clientes"  ) > 0 )
		yAviso( 'Este Cadastro ja esta Ativo.' ,, .f. )
		//RefreshAll('fSplitSubMenu')
	Else

		If Len(aButTop) > 0
		//	ReleaseTeto()
		End If


		cActiveJan := "FClien"

		aAdd( aButTop ,  { 0 ,  "Clientes" , .t.  }     )
		//nCol1 := ButtonsTop( .t. )

		cControl := ''
		cForm    := ''
		CadCli()


	End If


Return



Function ProcWindowMsg()

       // msginfo('ok2')
      IF EventMSG() == WM_LBUTTONDBLCLK  
    //     msginfo('Dblckkkk') 
      
      ENDIF


	  IF EventMSG() == 24 
         msginfo('Dblckkkk') 
      
      ENDIF


Return 



Function EventHndMain( nHWnd, nMsg, nWParam, nLParam )

	Local cOpcao := ''
	Local nCol   := 0
	Local nRow   := 0
	Local aR1
	Local nInd2  := 0
	Local cTp1   := ''
//	Local nCol := 0
	Local nRow1 := 0

	Local nRow2 :=0
	Local nCol2 := 0






	//Local nLhn := GetProperty( 'fSplitSubMenu' , 'Height')

	*// Eventos Sub menu.
	*// Barra Superior 



	If nHWnd == GetProperty(  'Main' , "HANDLE" )

		If (nMsg == 71)

			If cActiveJan = 'Main'
				If _IsWindowDefined('Win_MenuPrincipal')
					xRefreshMain()
				End If 
			End If 


			//msginfo('lp22222')
			//WM_WINDOWPOSCHANGED
			If (_IsWindowDefined( cActiveJan)) .And. (cActiveJan != "Main")
				xShowBrw(  cTabela  )
				//msginfo('lp22')
			End If
		End If



		If (nMsg == 5)
		  //  msginfo('l22')

		End If 





	End If

	





Return


Function xRefresh()


	If _isControlDefined('br_Grid' , cActiveJan)

		_ShowWindow( cActiveJan)
		SysWait(.2)

		BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )

	End If

	msginfo('max')


	//SysWait(.1)


REturn










Function PushButton( cjanela  , nIdBut , bBlock )


	PostMessage(   OBTN_Handle(cJanela ,  nIdBut )   , WM_MOUSELEAVE,0,0)

	EnableButton(cJanela  , nIdBut   , .f.)
	EnableButton(cJanela  , nIdBut  , .t.)

	//SysWait(.1)

	If (bBlock != Nil )
		Eval(bBlock)
	End If

Return







FUNCTION EnableButton(cForm, nID, lShow)
//  msginfo('enable button')
	IF OBTN_Handle(cForm, nID) == 0
		MsgBox("Button does not exist!")
	ELSE
		OBTN_Enable(cForm, nID, lShow)
	ENDIF

RETURN NIL







Function CaptTelas(  cExtra )


Return



Function xIndexEvent(nHandle1 , cTipo  )


	Local lRet1 := .f.
	Local n1 := 1
	Local aM1 := Aclone(  _HMG_EventData )
	Local nInd := 0

	Default cTipo := "N"


	For n1 := 1 to Len(aM1 )

		If cTipo == 'N'

			If (ValType(  aM1[n1] ) == 'A')

				If (ValType(  aM1[n1][2] ) == 'N')

					If (aM1[n1][2] = nHandle1)
						lRet1 := .t.
						nInd := aM1[n1][9]
					End If

				End If


			End If

		Else

			If (ValType(  aM1[n1] ) == 'A')

				If (ValType(  aM1[n1][1] ) == 'C')


					If (aM1[n1][1] = nHandle1)
						lRet1 := .t.
						nInd := aM1[n1][9]
					End If

				End If


			End If


		End If


	Next


Return nInd






FUNCTION SaidaFocus(aLb)

	LOCAL n

	For n := 1 TO Len(aLb)
		PostMessage(aLb[n][LABEL_HWND], WM_MOUSELEAVE, 0, 0)
	Next

RETURN NIL



	// Criar e exibe itens do menu (pop pup)
/*
Function OpMenu(aOpcoes , cJan , nLinha , cTitx , nIndx )

	Local n1
	Local cLbl:=''
	Local nRow := 0
	Local lBlTitx1 := 'Lbl'+Left(cTitx,3)+StrZero(nLinha,4)

	//SetProperty(cJan,"BACKCOLOR",BACK5)
	DoMethod(cJan,"Refresh")
	HMG_ChangeWindowStyle( fSplitSubMenu.Handle, WS_EX_CLIENTEDGE , NIL, .T., .T. )


	HB_SETCODEPAGE("UTF8")
	HB_SETCODEPAGE("PT850")


	For n1 := 1 to Len(aOpcoes)

		cLbl := "Mnx_" + Alltrim(Str( nIndx)) + "_" +  StrZero(n1  ,4)

		If !_IsControlDefined(cLbl , cJan)

			DEFINE LABEL &(cLbl)
			PARENT    &(cJan)
			//PARENT    fSplitSubMenu
			ROW       nRow
			COL       3
			WIDTH     fsplit6.Width - 5
			HEIGHT    nItemHeight
			FONTNAME  XFONT1
			FONTSIZE  10
			//VALUE     '         '  + Padr(Alltrim(aOpcoes[n1]),70) + '                  '
			VALUE     '         '  + Padr(Alltrim(Hb_AnsiToOem(aOpcoes[n1])),70) + '                  '
			ALIGNMENT Left
			TRANSPARENT .f.
			FONTCOLOR FONTCOR
			BACKCOLOR {229,237,242}
		END LABEL


		nRow+=nItemHeight

		nHnd1 := GetProperty(cJan , cLbl  , "HANDLE")


		//EventProcessAllHookMessage(EventCreate({ || LabelEventHandler(aOpcoes) }, nHnd1  ), .T.)



		



	Else
		SetProperty( cJan ,cLbl  ,"Visible",.t.)
		DoMethod(cJan , cLbl ,"Show" )
	End If

Next





Refreshall('fSplitSubMenu')



//Refreshall('fSplit6')



Return nRow
*/

// Realiza a acomodaï¿½ï¿½o dos itens do menu abaixo do aberto atualmente.

/*

Function RestMenu(nOp1 , nLinha , nTam , nOpSel )

	Local n1 := 0
	Local nLin := 10
	Local nHandle
	Local cControl
	Local cForm
	Local lPula := .f.

	Default nTam := 0

	//aOpcoes[n][LABEL_HWND] := GetProperty("fSplit6", aOpcoes[n][LABEL_NAME] , "HANDLE")

	For n1 := nOp1 to Len(aOpcoes)

		nHandle := aOpcoes[n1][LABEL_HWND]

		GetControlNameByHandle(nHandle, @cControl, @cForm)

		SetProperty(cForm, cControl, "BACKCOLOR", {255,255,255} )
		SetProperty(cForm, cControl, "FONTBOLD", .F.)

		If !lPula

			If nOpSel > 0
				If n1 <= nOpsel
					Nlin := aMtrPos[n1]
				Else
					nLin += nItemHeight
				End If
			Else

				If n1 > 1
					nLin += nItemHeight
				End If

			End If

		Else
			nLin += (nTam+nitemHeight)+2
			lPula := .f.
		End If

		//msginfo(cForm)

		SetProperty(cForm,cControl,'Row' , nLin)
		DoMethod( cForm , cControl ,'Refresh' )


		If nOpSel > 0
			If N1 == nOpSel


				SetProperty(cForm, cControl, "BACKCOLOR", {229,237,242}  )
				SetProperty(cForm, cControl, "FONTBOLD", .T.)

				SetProperty(cForm,'Image1' , 'Visible' , .t.)
				SetProperty(cForm,'Image1' , 'Col' , 1)
				SetProperty(cForm,'Image1' , 'Row' , nLin)


				lPula := .t.

			End If

		End If

	Next

Return
*/






/////////////

/*
FUNCTION LabelEventHandler(aLabel)
	STATIC lTracking27 := .F.
	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  cControl
	Local nIndAnt
	LOCAL  cForm
	Local cName
	Local lok := .f.
	Local cop2 := ''

	GetControlNameByHandle(nHWnd, @cControl, @cForm)

	//msginfo(cControl)

	If Empty(Alltrim(cControl))
		Return
	End If


	SWITCH nMsg

CASE WM_KEYDOWN


CASE WM_KEYUP



CASE WM_LBUTTONDOWN

	//msginfo('down')

	If (cForm = 'fSplit2')
		//msginfo('ok')
		return
	End If


	If (alltrim(cControl) = 'Img_seta1')
		ScrTest(1 , nContItens  )
		Return Nil
	End If


	If (alltrim(cControl) = 'img_seta2')
		ScrTest(2 , nContItens )
		Return Nil
	End If



	nacumz := GetProperty('fSplit2','Width')
	cOpcao := GetProperty(cForm, cControl, "VALUE")

	nHanSelected := nHWnd

	nRow := 09

	If ("Voltar" $ cOpcao)
		HideAll("fSplit6" )
		ShowMain()
		nLevelMenu     := 1
		//MenuPrin(.t.)
		SaidaFocus(aOpcoes)

		HideAll("fSplit3"  , .t. )
		HideAll("fSplit4"  , .t. )

	End If

	If (Alltrim(cOpcao) $ "Cadastros.Movimentos.Relatorios.Parametros")

		SetWindowControlsVisible( 'fSplitSubMenu' , .f. )

		nTop   := GetProperty(cForm, cControl, "Row")
		cDesc := GetProperty(cForm, cControl, "Value")

		If (Alltrim(cDesc) == Alltrim(cOpAberto))

			nHanAnterior := nHWnd

			cOpAberto := ''
			SetProperty(cForm,'Image1' , 'Visible' , .f.)
			SetProperty('fSplit6','Image4' , 'Visible' , .f.)

			RestMenu(1 , 0  , GetProperty('fSplitSubMenu' , 'Height') , 0 )
			DoMethod('fSplitSubMenu' ,'Hide' )
			OffSeta()

			//msginfo('')
			xHighMenu(  'fSplit6' , cControl    , GetProperty( 'fSplit6' ,  cControl , 'Row')    )


		Else

			nTop1   := GetProperty(cForm, cControl, "Row")
			xDropDown(  cOpcao  , nTop1  )



		End If

	End If


	nindice := Ascan(aItens , { |a| Right( a[1] , Len(a[1]) - 2 ) =  Alltrim(cOpcao)  })

	If (nIndice > 0)

		OpenOpcao( Right(aItens[ nIndice ][1] , Len(aItens[ nIndice ][1])  - 2) , aItens[ nIndice ][2]  , nHWnd )
		Return

	End If

	lTracking27 := TrackMouseEvent(nHWnd)

	If Alltrim(cOpcao) == 'Clientes'


	End If

CASE WM_MOUSEMOVE

	//CursorHand()

	SetWindowCursor( GetControlHandle( cControl , cForm  ),  CURSORHAND )


	If (cForm = 'fSplit2')
		//msginfo('ok')
		return
	End If



	IF ! lTracking27

		If Left(Upper(cControl),4) == 'IMG_'
			//msginfo('ok')

			If cControl == 'Img_seta1'
				If alltrim(Upper(GetProperty(cForm , cControl , 'picture' ))) = Upper("img\setab2.png")
					SetProperty(cForm , cControl , 'picture' , 'img\Setab22.Png' )
				End If
			End If

			If cControl == 'img_seta2'
				If Upper(alltrim(GetProperty(cForm , cControl , 'picture' ))) = Upper("img\setac2.png")
					SetProperty(cForm , cControl , 'picture' , 'img\Setac22.Png' )
				End If
			End If

			lTracking27 := TrackMouseEvent(nHWnd) //TME_LEAVE is default flag

			Return

		Else


			If Alltrim(Left(cControl,3)) = 'Mnx'


				xHighSubMenu(  cForm , cControl )

			Else

				nlinha1 := GetProperty(cForm, cControl , "Row")

				cOpcao2 := GetProperty(cForm, cControl, "CAPTION" )

				If Empty(Alltrim(cOpAberto))
					xHighMenu(  cForm , cControl    , nLinha1   )
				Else
					If Alltrim(cOpcao2) != Alltrim(cOpAberto)
						xHighMenu(  cForm , cControl    , nLinha1   )
					End If
				End If

			End If

			lTracking27 := TrackMouseEvent(nHWnd) //TME_LEAVE is default flag

		Endif

	End If



Return

	EXIT

CASE WM_MOUSELEAVE

	//msginfo('leva')

	If cControl == 'Img_seta1'
		If alltrim(Upper(GetProperty(cForm , cControl , 'picture' ))) = Upper("img\setab22.png")
			SetProperty(cForm , cControl , 'picture' , 'img\Setab2.Png' )
		End If
		lTracking27  := .f.
		Return Nil
	End If

	If cControl == 'img_seta2'
		If alltrim(Upper(GetProperty(cForm , cControl , 'picture' ))) = Upper("img\setac22.png")
			SetProperty(cForm , cControl , 'picture' , 'img\Setac2.Png' )
		End If
		lTracking27  := .f.
		Return Nil
	End If

	If Alltrim(cControl) = 'LblTitMenu'

		SetProperty(cForm, cControl, "TRANSPARENT", .T.)
		SetProperty(cForm, cControl, "FONTBOLD", .t.)

	Else

		cOpcao2 := GetProperty(cForm, cControl, "CAPTION" )


		If !Empty(cOpAberto)
			//MSGINFO('l')
			If Alltrim(cOpcao2) != Alltrim(cOpAberto)

				cName := GetProperty(cForm, cControl , "NAME")

				SetProperty(cForm, cControl, "BACKCOLOR", {255,255,255} )
				SetProperty(cForm, cControl, "FONTBOLD", .F.)

				If cForm == 'fSplit6'
					SetProperty(cForm,"Image4","Visible",.f.)
				End If

			End If

		Else

			xOffMenu(cForm , cControl)
			//Do Events


		End If

	End If

	lTracking27  := .f.


	EXIT

	ENDSWITCH



RETURN NIL

 */






Function xHighSubMenu(  cForm , cControl )

	SetProperty(cForm, cControl, "BACKCOLOR", {216,228,236} )
	SetProperty(cForm, cControl, "FONTBOLD", .f.)

Return

Function xOffMenu(cForm1 , cControl1)

	SetProperty(cForm1, cControl1, "BACKCOLOR", {255,255,255})
	SetProperty(cForm1, cControl1, "FONTBOLD", .F.)

	//Image1
	If cForm1 == 'fSplit6'
		SetProperty(cForm1,"Image4","Visible",.f.)
		SetProperty(cForm1,"Image1","Visible",.f.)
	End If

Return


Function xHighMenu(  cForm1 , cControl1    , nLinx   )

	SetProperty(cForm1, cControl1, "BACKCOLOR", {216,228,236})
	SetProperty(cForm1, cControl1, "FONTBOLD", .T.)


	SetProperty(cForm1,"Image4","Visible",.t.)
	SetProperty(cForm1,"Image4","Row",  nLinx )
	SetProperty(cForm1,"Image4","Col", 1)

Return


Function PutSeta( nLin1  , nLin2 )

	Local lVisible := .t.

	SetProperty("fSplit6","img_seta1","Visible",lVisible)
	SetProperty("fSplit6","img_seta2","Visible",lVisible)

	SetProperty("fSplit6","img_seta1","Row",nLin1)
	SetProperty("fSplit6","img_seta2","Row",nLin2)

Return

Function OffSeta()

	Local lVisible := .f.

	SetProperty("fSplit6","img_seta1","Visible",lVisible)
	SetProperty("fSplit6","img_seta2","Visible",lVisible)

Return



Function ShowButTop( lShow )

	

REturn


Function D1Black(cJan,zBitMap)

	Local hDc

	Local nRow := 0
	Local nCol := 0


	LOCAL Width  := BT_ClientAreaWidth  (cJan)
	LOCAL Height := BT_ClientAreaHeight (cJan)

	LOCAL BTstruct

	If lAtivaBlack	



		hDC    = BT_CreateDC ( cJan  , BT_HDC_INVALIDCLIENTAREA, @BTstruct)
		BT_DrawGradientFillVertical (hDC,  nRow  ,  nCol  ,  Width,  Height , BLACK , BLACK)

		BT_DrawBitmapAlphaBlend (hDC, nRow ,  nCol  , nil, nil, 120 , BT_COPY  , zBitmap)
		BT_DeleteDC ( BTstruct )



		If ( Alltrim(cJan) = 'fSplit6')
			msginfo('l2')
		End If

	Else

		If (cJan != 'fSplit6')
			Proc_ON_PAINT(cJan)
		Else
			//msginfo(cJan)

		End If

	End If





Return



Function xTesMenu(  cNName , nRow , nCol , aMatriz , nItemSel )

	Local aZop1 := {}
	Local cName1 := cNName
	 //'M_' + StrZero( Int( hb_Random( Val( StrTran( Time(), ":" ) ) ) ), 4 ) + 'Z1'

	 

	 

	Aadd(aZop1 , { "Pesquisar" , "Imp.Doc" , .t. , { | | TestBrow()  }    }    )
	Aadd(aZop1 , { "Excluir." , "Vis Imp.Doc" , .t. , { || ( msginfo('k32' ) , xFechaMen() )    }   , .f.    }   )
	Aadd(aZop1 , { "Novo Cod.Barra" , "Novo Arquivo..." , .t. , { | a | msginfo('k22 ' + Str(a) )     }    }  )
	Aadd(aZop1 , { "Novo %Arquivo2   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "Tracker %Contabil" , "Novo Arquivo..." , .f. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "Legenda" , "Novo Arquivo..." , .t. , { || ( msginfo('ok2') ,  xFechaMen() )    }    }  )
	Aadd(aZop1 , { "  Novo Arquivo5   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo6   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo6   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo6   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo6   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo12   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo13   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo14   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo15   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo16   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo17   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
	Aadd(aZop1 , { "  Novo Arquivo18   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )

	//msginfo(Str(    Len(aMatriz)  ) + '   ' + Str(nItemSel)   )

	//msginfo(cName1)



	xMenuOp( cName1 , 'Main' , aZop1 , nRow , nCol , .t. , aMatriz , nItemSel  )


Return




Function ExitApp()

	Local lOk := .f.

	// yEfect(  'Main' , .t.   )

	lOk := xDialog(  'Confirma Saida do Aplicativo?'   )

	If lok
		//MsgInfo('ok')
	End If


	//  EfectEnd( 'Main' , {} )


REturn lOk



Function Box(CurSRow, CurSCol, LastSWidth, LastSHeight , NOSm , cJanela1 , cImgTab )

	LOCAL Sclavel01 :=   ALLTRIM("ImgxY") + ALLTRIM(NoSm)

	DEFAULT cImgTab := "Tab.Jpg"

	DEFINE IMAGE &Sclavel01
	ROW    CurSRow
	COL    CurSCol
	WIDTH  LastSWidth
	HEIGHT LastSHeight
	PICTURE cImgTab
	HELPID Nil
	VISIBLE .T.
	STRETCH .T.
	ACTION Nil
END IMAGE

SetProperty(cJanela1,Sclavel01,"Enabled",.F.)

RETURN 







Function SaveLog(cArqLog,cTexto)

	Local cText := cTexto

	If File(cArqLog)
		cText := hb_memoRead(cArqLog)+' '+cTexto + QUEBRA
	End If 


	hb_memowrit(cArqLog ,cUserName + ' ' + Dtoc(date()) + ' ' + Time() + '   ' +  cText + QUEBRA )

Return



	#pragma BEGINDUMP


	#include "SET_COMPILE_HMG_UNICODE.ch"
	#include "HMG_UNICODE.h"

	#include <windows.h>
	#include "hbapi.h"

// https://msdn.microsoft.com/en-us/library/windows/desktop/ms646265(v=vs.85).aspx
// TrackMouseEvent(nHWnd, [nFlags], [nHoverTime]) --> lSuccess
	HB_FUNC( TRACKMOUSEEVENT )
	{
	TRACKMOUSEEVENT tmi;

	tmi.cbSize      = sizeof(TRACKMOUSEEVENT);
		tmi.dwFlags     = hb_parnidef(2, TME_LEAVE);
		tmi.hwndTrack   = (HWND) HMG_parnl(1);
		tmi.dwHoverTime = hb_parnidef(3, HOVER_DEFAULT);

	hb_retl(TrackMouseEvent(&tmi));
		}


	HB_FUNC( SETARROWCURSOR )
	{
	SetClassLong( ( HWND ) hb_parnl( 1 ), GCLP_HCURSOR, ( LONG ) LoadCursor( NULL, IDC_ARROW ) );
		}

	HB_FUNC( SETHANDCURSOR )
	{
	SetClassLong( ( HWND ) hb_parnl( 1 ), GCLP_HCURSOR, ( LONG ) LoadCursor( NULL, IDC_HAND ) );
		}

	HB_FUNC( SETWAITCURSOR )
	{
	SetClassLong( ( HWND ) hb_parnl( 1 ), GCLP_HCURSOR, ( LONG ) LoadCursor( NULL, IDC_WAIT ) );
		}

	HB_FUNC( SETSIZECURSOR )
	{
// SetClassLong( ( HWND ) hb_parnl( 1 ), GCLP_HCURSOR, ( LONG ) LoadCursor( NULL, IDC_SIZEWE ) );
	}

	HB_FUNC( SETDRAGCURSOR )
	{
//  SetClassLong( ( HWND ) hb_parnl( 1 ), GCLP_HCURSOR, ( LONG ) LoadCursor( NULL, IDC_SIZEALL ) );
	//SendtoBack();
		}


/*
	HB_FUNC ( SETVSCROLLVALUE )
	{

	SendMessage ( (HWND) HMG_parnl (1), WM_VSCROLL ,  SB_LINEDOWN , 15 ) ;

	}

*/



	HB_FUNC ( ENABLESCROLLBAR )
	{
	HWND hWnd    = (HWND) HMG_parnl (1);
		UINT nBar    = (UINT) hb_parnl  (2);
		UINT nAction = (UINT) hb_parl   (3) ? ESB_ENABLE_BOTH : ESB_DISABLE_BOTH;

	EnableScrollBar (hWnd, nBar, nAction);
		}


	HB_FUNC ( GETVSCROLLVALUE )

	{

	HWND hwnd;
		SCROLLINFO si;

	hwnd = (HWND) HMG_parnl (1);
		GetScrollInfo (hwnd, SB_VERT, &si);


	hb_retni( si.nPos  );

	}



	HB_FUNC ( GETHSCROLLVALUE )

	{

	HWND hwnd;
		SCROLLINFO si;

	hwnd = (HWND) HMG_parnl (1);
		GetScrollInfo (hwnd, SB_HORZ, &si);


	hb_retni( si.nPos  );

	}




	HB_FUNC ( SETVSCROLLVALUE )
	{

//	SendMessage ( (HWND) HMG_parnl (1), WM_VSCROLL , (WPARAM) MAKEWPARAM (SB_THUMBPOSITION , hb_parni(2) ) , 0 ) ;


	HWND hwnd;
		HDC hdc;
		PAINTSTRUCT ps;
		TEXTMETRIC tm;
		SCROLLINFO si;

	int nBt1 ;

	static int yPos;        // current vertical scrolling position

	int yChar;       // vertical scrolling unit

	int yTipo =  hb_parni(3);;

	hwnd = (HWND) HMG_parnl (1);
		yChar = hb_parni(2);

	RECT rect3;

	RECT rect4;

	GetClientRect(hwnd, &rect3);

	rect3.right  += 1335;
		rect3.bottom += 1335;


	// VERT
	if (yTipo == 1)
		{

		// Get all the vertial scroll bar information.
		si.cbSize = sizeof (si);
			si.nTrackPos = yChar;
			si.fMask  = SIF_ALL;
			//si.fMask  = SIF_TRACKPOS;



		SetScrollInfo (hwnd, SB_VERT, &si, TRUE);
			GetScrollInfo (hwnd, SB_VERT, &si);


		yPos = si.nPos;
			si.nPos -= 1;
			ScrollWindow(hwnd, 0, yChar * (yPos - si.nPos)   , NULL , NULL );

		}
	else

		{

		si.cbSize = sizeof (si);
			si.nTrackPos = yChar;
			si.fMask  = SIF_ALL;
			//si.fMask  = SIF_TRACKPOS;
			SetScrollInfo (hwnd, SB_HORZ, &si, TRUE);
			GetScrollInfo (hwnd, SB_HORZ, &si);

		yPos = si.nPos;
			si.nPos -= 1;


		ScrollWindow(hwnd, yChar  ,  0   , NULL , NULL );

		si.nTrackPos = yChar;
			SetScrollInfo (hwnd, SB_HORZ, &si, TRUE);



		}

		// * (yPos - si.nPos)


		UpdateWindow(hwnd);


		}


		#define BMP_ERASE        0     // Borra la imagen de fondo de la ventana
		#define BMP_COPY_NORMAL  1     // Pega la imagen al fondo con el tamaño original de la misma
		#define BMP_COPY_SCALE   2     // Ajusta proporcionalmente la imagen para que se vea completa en la ventana
		#define BMP_COPY_STRETCH 3     // Aju


		HB_FUNC (BMP_LOAD_FILE)
		{
		HBITMAP hBitmap;
			char *cFileName;

		cFileName = (char *) hb_parcx (1);

		hBitmap = (HBITMAP)LoadImage(NULL, cFileName, IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE | LR_CREATEDIBSECTION);

		if (hBitmap == NULL)
			hBitmap = (HBITMAP)LoadImage(GetModuleHandle(NULL), cFileName, IMAGE_BITMAP, 0, 0, LR_CREATEDIBSECTION);

			hb_retnl( (LONG) hBitmap );
				}

//*************************************************************************************************
// BMP_RELEASE_HANDLE (hBitmap)
//*************************************************************************************************
			HB_FUNC (BMP_RELEASE_HANDLE)
			{
			hb_retni ((int) DeleteObject ((HBITMAP) hb_parnl (1)));
				}










			HB_FUNC (BMP_PAINT)
			{
			HWND hWnd;
				HBITMAP hBitmap;
				HDC memDC, hDC;
				RECT rect;
				BITMAP bm;
				int nMode;


			hWnd     = (HWND)  hb_parnl (1);
				hBitmap  = (HBITMAP) hb_parnl  (2);
				nMode    = hb_parni (3);



			GetClientRect(hWnd, &rect);

			hDC = GetDC (hWnd);   // obtine un hDC para toda el area del cliente (se puede pintar en cualquier lugar del area del cliente)
			PAINTSTRUCT ps;
				hDC = BeginPaint (hWnd, &ps);  // obtiene un hDC solo para el area invalida (area que debe ser repintada) en un mensaje WM_PAINT

			if (nMode == BMP_ERASE)
				FillRect(hDC,&rect,(HBRUSH) GetSysColorBrush(COLOR_BTNFACE));
				else
				{
				FillRect(hDC,&rect,(HBRUSH) GetSysColorBrush(COLOR_BTNFACE)); // borra la imagen anterior antens de asignar otra

				memDC = CreateCompatibleDC(hDC);

				SelectObject(memDC, hBitmap);

				rect.top    = hb_parnl (4);
					rect.left   = hb_parnl (5);

				if (nMode == BMP_COPY_NORMAL)
					{
					rect.bottom = hb_parnl (6);
						rect.right  = hb_parnl (7);
						BitBlt(hDC, rect.left, rect.top, rect.right, rect.bottom, memDC, 0, 0, SRCCOPY);
						}


					GetObject(hBitmap, sizeof(BITMAP), (LPSTR)&bm);

					if (nMode == BMP_COPY_SCALE)
						{  if ((int) bm.bmWidth * rect.bottom / bm.bmHeight <= rect.right)
						rect.right= (int) bm.bmWidth * rect.bottom / bm.bmHeight;
						else
						rect.bottom = (int) bm.bmHeight * rect.right / bm.bmWidth;

						StretchBlt(hDC, rect.left, rect.top, rect.right, rect.bottom, memDC, 0, 0, bm.bmWidth, bm.bmHeight, SRCCOPY);
							}

						if (nMode == BMP_COPY_STRETCH)
							StretchBlt(hDC, rect.left, rect.top, rect.right, rect.bottom, memDC, 0, 0, bm.bmWidth, bm.bmHeight, SRCCOPY);

							DeleteDC(memDC);
								}


							//EndPaint (hWnd, hDC); //Elimina el hDC y Valida el area pintada
							ReleaseDC(hWnd, hDC);   //Elimina el hDC pero NO Valida el area pintada
							//Al no validar el area pintada permite que los procesos de pintura siguientes encadenados puedan usar hDC = BeginPaint (hWnd, &ps);

							}



							#pragma ENDDUMP





