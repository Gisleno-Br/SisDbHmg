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


DECLARE WINDOW fSplit10



REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850

//SET AUTOSCROLL ON



FUNCTION Main

	Public cForm := ''

	PUBLIC aBackColor := { 57, 108, 164 }

	Public nVirtualMenu := Nil

	Public aRotHnd := {}

	Public lAtivaBlack := .f.

	Public nColTamMenu := 189

	SET TOOLTIPCUSTOMDRAW ON
	SET TOOLTIPSTYLE BALLOON
	SET TOOLTIPBACKCOLOR { 250, 250, 210}

	SET NAVIGATION EXTENDED



	Public cJanx

	Public CURSORHAND := "img\Hand_Cursor.cur"

	Private aCords := {}

	Private aButx1 := {}

	Private  lTracking42 := .f.
	Private  lTracking142 := .f.

	SET SCROLLSTEP TO 10

	PUBLIC cBackColor := { 166, 210, 210 }

	public lTracking6 := .f.


	PUBLIC bColor := {|| iif( ( LastRec() > 0 ) .AND. ( RecNo() / 2 == Int(RecNo() / 2 ) ), { 238,238,238 }, { 255,255,255 } ) }

	PUBLIC fColor := {|| iif( ( LastRec() > 0 ) .AND. ( AllTrim(Status ) == 'Ativo' ), { 78,78,78 },  { 255, 0, 0 } )  }

	Public HOURGLASS := 'IMG\HourGlass.Cur'


	Public bColorGrid := {|| iif( ( LastRec() > 0 ) .AND. ( RecNo() / 2 == Int(RecNo() / 2 ) ), { 235,243,242 }, {211,231,230} ) }

	Public lVScrool := .f.

	Public lTelaToda := .f.


	Private aOpx1 := {}

	Private nItemx1 := 0

	Private nScrLin := 0

	Private nLinhaAtual := 0

	Private nItemClr := 0

	Private l_Httb := .f.
	Private l_Http := .t.


	Private cOpSely := ''


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

	Private nTamSubMenuConsulta := 300



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
	Private cFontName  := 'Arial'
	Private FontSize  := 8

	Private nColScrool := 0


	Private lScrool := .t.

	Private aBtnFont  := { "Arial", 8, .F., .F., .F., .F. }

	Public aBtnCorSl := ;
		{ { TxColorE, FrColorE, BkColorE1, BkColorE2, GradDirE }, { TxColorD, FrColorD, BkColorD1, BkColorD2, GradDirD }, { TxColorF, FrColorF, BkColorF1, BkColorF2,GradDirF } }

	Public aBtnSl := ;
		{ { TxColorF, FrColorF, BkColorF1, BkColorF2, GradDirF }, { TxColorD, FrColorD, BkColorD1, BkColorD2, GradDirD }, { TxColorF, FrColorF, BkColorF1, BkColorF2,	GradDirF } }

	Public nDesktopHeight := GetDesktopHeight()

	Public nDesktopWidth := GetDesktopWidth()

	Public lMainJan := .t.


	Public  aCorSub1 := {145,200,200 }

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





	Load Window Main


	Main.Maximize()


	//Load Window fSplitSubMenu

	

	Private aRotinas := {}

	Private nMainSel  := 0
	Private nClearSel := 0

	Private cOpMainSel  := ''




	//HB_SetCodePage( "UTF8")

	Private aOpcoes := {{"1-Cadastro",  "Acesso a Cadastros Gerais e Principais." , .t.  }, ;
		{"2-Movimentos"				,   "Acesso a Movimentação de Estoque"   , .t.  },;
		{"3-Relatórios"				,   "Relatorios do Sistema"  ,   .t. }  ,;
		{"4-Parametros"				,  	"Parametros e Configurações Gerais" , .t.  } }

	//cOpMainSel  := aOpcoes[1][1]



	Private nOpSel := 0

	Private aItens := { {"1-Clientes","Cadastro de Clientes" , .t.  , {  || xTesMenu()  }  , .f. } , ;
	 				{ "1-Fornecedores","Cadastro de Fornecedores" , .t.  , {||xFechaMen() }  , .t.  , { |a,b| xTesMenu(a,b)   }    } , ;
	{ "1-Vendedores", "Cadastro de Vendedores" , .f.  , Nil , .f.  } , ; 
	 {"1-Colaboradores","" , .f. } ,   {"1-Grupo Produtos","" , .f. , Nil  } , ;
		{"1-Locais Estoque","" , .t.  , Nil } , {"1-Funções","" , .f. , Nil } , ;
		{"1-Categoria Produto","" , .t. , Nil } , {"1-Unidades","" , .f. , Nil } , {"1-Tipo Produtos","",.t. , Nil  } ,;
		{"1-Tipo Produto1s","" , .t. , Nil  },{"1-Tipo Produto2s","", .f. , Nil } ,{"1-Tipo Produt3os","" , .f. , Nil },{"1-Tipo Produt222os","", .t. , Nil  },{"1-Tipo 444Produtos","", .t. , Nil  }, ;
		{ "1-Rotatividade","Rot" , .t. , Nil } , {"1-TES","TES1" , .f. , Nil  } , ;
		{"2-Pedidos","Vendas" , .f.  , Nil } , {"2-Orçamento","Orçamento" , .f. , Nil }  , {"3-Listagem Clientes","Lista" , .t. , Nil  } ,    {"4-Configurações","" , .t. , Nil  } }




	Private nRowIni := 10

	//HB_SETCODEPAGE("UTF8")

	n := 1













	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHndMain"  ) )  ) = 0
	//	InstallEventHandler( "EventHndMain" )
	End If


	nEveLabel := 0

	HMG_ChangeWindowStyle( fSplit6.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )



	


	HMG_ChangeWindowStyle( fSplit3.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )

	HMG_ChangeWindowStyle( fSplit4.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )

	HMG_ChangeWindowStyle(fSplit2.Handle    , 0x00010200 , NIL, .F., .F.)
	HMG_ChangeWindowStyle( fSplit2.Handle  ,WS_EX_TOOLWINDOW  , NIL, .t., .t.)



	//HMG_ChangeWindowStyle(fSplitsubMenu.Handle    , 0x00010200 , NIL, .F., .F.)
//	HMG_ChangeWindowStyle(fSplitSubMenu.Handle  ,WS_EX_TOOLWINDOW  , NIL, .t., .t.)

   

	DEFINE LABEL fLabel1Dt
		PARENT    fSplit3
		ROW       18
		COL       51
		WIDTH     140
		HEIGHT    16
		VALUE     Alltrim(Dtoc(dDataBase))
		ALIGNMENT LEft
		FONTCOLOR {102,102,102}
		BACKCOLOR {255,255,255}
		FONTBOLD .f.
	END LABEL

	DEFINE LABEL fLabelUser
		PARENT    fSplit4
		ROW       03
		COL       10
		WIDTH     140
		HEIGHT    16
		VALUE     Alltrim(cUserName)
		ALIGNMENT Left
		FONTCOLOR {102,102,102}
		BACKCOLOR {255,255,255}
		//TRANSPARENT .T.
		ACTION xMenuPrin()
		FONTBOLD .f.
	END LABEL



	DEFINE LABEL fUserDb
		PARENT    fSplit4
		ROW       32
		COL       10
		WIDTH     140
		HEIGHT    16
		VALUE     Alltrim(cUserDb)
		ALIGNMENT Left
		FONTCOLOR {102,102,102}
		BACKCOLOR {255,255,255}
		ACTION msginfo('ok')
	END LABEL


	DEFINE LABEL fServerDb
		PARENT    fSplit4
		ROW       51
		COL       10
		WIDTH     140
		HEIGHT    16
		VALUE     ""
		ALIGNMENT Left
		FONTCOLOR FONTCOR
		BACKCOLOR BACK1
		TRANSPARENT .T.
		ACTION msginfo('ok')
		//FONTBOLD .t.
	END LABEL


 
	Private aButTop := {}

	Public nIndexEventY := EventCreate (  { ||   xMainHandle( )   }  )





	//BT_ClientAreaInvalidateAll('fSplit6')

//SysWait(.1)



	//_HMG_PRINTER_SETVSCROLLVALUE(   GetFormHandle('fSplit6')  , 0 )

	xMenuMain( 70 , 1  , aOpcoes , aItens )


	
	Main.Activate




RETURN


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


	Local nLhn := GetProperty( 'fSplitSubMenu' , 'Height')

	*// Eventos Sub menu.
	*// Barra Superior 
	If nHWnd == GetProperty(  'fSplit2' , "HANDLE" )



		If ( nMsg == WM_MOUSEMOVE )

			GetCursorPos (@nCol, @nRow1)

			If nCol <= 30
				SetWindowCursor( nHWnd , CURSORHAND)
			Else
				SetWindowCursor( nHWnd , IDC_ARROW)
			End If

		End If


		If (nMsg == WM_LBUTTONDOWN)


			GetCursorPos (@nCol, @nRow1)

			If nCol <= 30
				//	msginfo(Str(   nCol ))
			End If

		End If



	End If


	*// Janela Superior Direita

	If nHWnd == GetProperty(  'fSplit10' , "HANDLE" )


		If (nMsg == WM_LBUTTONDOWN)
			//msginfo('ok')
		End If

		If ( nMsg == WM_MOUSEMOVE )

			SetWindowCursor( nHWnd , CURSORHAND)

		End If


	End If


	*// Submenu Menu Principal.

	If nHWnd == GetProperty(  'fSplitSubMenu' , "HANDLE" )


		If ( nMsg == WM_MOUSELEAVE )  .and. (   lTracking142  )

			nItemx1 := 0
			nItemClr := 0
			BT_ClientAreaInvalidateAll( nHWnd  )
			SetWindowCursor( nHWnd , IDC_ARROW )


		End If


		If (nMsg == WM_LBUTTONDOWN)


			If (nItemx1 <= Len(aOpX1))

				If !aOpx1[nItemx1][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					yaviso("Opção Indisponivel." , .f. )
					Return
				End If

				If (aOpx1[nItemx1][4] != Nil )
					Eval( aOpx1[nItemx1][4]   )
				End If


			End If


		End If



		If ( nMsg == WM_MOUSEMOVE )
			//.And. (!lTracking42)


			If (nItemx1 > 0)
				If (nItemx1 = xOpSelPos( 'fSplitSubMenu' , 0 , Len(aOpx1) , 0 )	)
					Return
				End If
			End If

			nItemx1 := xOpSelPos( 'fSplitSubMenu' , 0 , Len(aOpx1) , 0 )
			nRow1 := -(GetProperty( 'fSplitSubMenu' , "VscrollBar" , "Value"))



			If (nItemx1 <= Len(aOpX1))
				If !aOpx1[nItemx1][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					Return
				End If
			End If



			SetWindowCursor( nHWnd , CURSORHAND)


			If nItemClr > 0
				xLimpSub( 'fSplitSubMenu' , @nItemClr ,  @nItemx1 , 0 )

				If lSubOpen
					xFechaMen()
					lSubOpen := .f.
				End If 	

			End If



			If nItemx1 > 0
				nItemClr := nItemx1
			Else
				Return
			End If


			If nItemx1 > 0
				BT_ClientAreaInvalidateRect( 'fSplitSubMenu' ,  nRow1  +  ( ( nItemx1 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )


				*// Sub Menu
			    If Len(aOpx1[nItemx1]) >= 5

					If aOpx1[nItemx1][5] 

						nRow2 := 0
						nCol2 := 0

						GetCursorPos( @nCol2 , @nRow2)

						Eval( aOpx1[nItemx1][6]  ,  nRow2   , ;
						GetProperty('fSplitSubMenu'  , 'Col') + nColTamMenu + 10  )


						 lSubOpen := .t. 


						Return 

					End If 



				End If 

			End If


			If !Empty(    Alltrim(  aOpx1[nItemx1][2]  )   )

				cTp1 :=	  Alltrim( 	 aOpx1[nItemx1][2]  )

				nRow1 := 0


				GetCursorPos (@nCol, @nRow1)

				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow1  , GetProperty('fSplitSubMenu', 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow1+15 , GetProperty('fSplitSubMenu', 'Col') + GetProperty('fSplitSubMenu', 'Width') + 10   )
				End If

				xDispUpTam(cTp1 )

			Else

				xHideHint()
			End If



			lTracking142 := TrackMouseEvent(nHWnd)


			//msginfo('ok  ')


		End If




	End If




	*// Menu Principal
	If nHWnd == GetProperty(  'fSplit6' , "HANDLE" )


		If ( nMsg == WM_MOUSELEAVE )  .and. (   lTracking42  )


			If Empty( Alltrim(cOpMainSel)   )

				If nClearSel > 0
					nMainSel := 0
					nClearSel := 0
					BT_ClientAreaInvalidateAll( nHWnd  )
					SetWindowCursor( nHWnd , IDC_ARROW )
				End If

			Else

				If (nClearSel > 0) .And. (nClearSel != nMainSel)
					nMainSel := 0
					xLimpSub( 'fSplit6' , @nClearSel ,  @nMainSel , Iif( nMainSel  >= nItemDrop1 , HeightDrop ,0) - 1  )

				End If

				xHideHint()

				Return


			End If


			lTracking42 := .f.


			If _isWindowDefined("Win_Msg")
				If IsWindowVisible(  GetFormHandle("Win_Msg") )
					HideWindow( GetFormHandle("Win_Msg"))
				End If
			End If



		End If


		If (nMsg == WM_LBUTTONDOWN)

			nRow1 := -(GetProperty( 'fSplit6' , "VscrollBar" , "Value"))



			If (lSetasDown)

				If (nLinhaAtual == 0)
					nLinhaAtual := Int(nTamSubMenuConsulta / nItemSubHeight)
				End If

				If (nMainSel = -1)

					ScrollMenu( 2 , GetProperty(  'fSplitSubMenu' , "HANDLE" ) , @nScrLin , @nLinhaAtual , nContItens , @l_Http , @l_Httb , nItemDrop1 , ;
					'fSplit6' , GetProperty('fSplitSubMenu' , 'Height' )  )
					Return

				End If


				If (nMainSel = -2)

					ScrollMenu( 1 , GetProperty(  'fSplitSubMenu' , "HANDLE" ) , @nScrLin , @nLinhaAtual , nContItens , @l_Http , @l_Httb , nItemDrop1 , ;
					'fSplit6' , GetProperty('fSplitSubMenu' , 'Height' )  )
					Return

				End If

			End If

			If nItemDrop1 > 0
				xRestMenu( nHWnd , .f. )
			End If


			cOpBak := cOpMainSel

			If !Empty( Alltrim(cOpMainSel)   )

				nInd2 := Ascan(  aOpcoes  , {  |a| Right( a[1]  , Len(a[1]) - 2 ) == Alltrim(cOpMainSel)   }  )

				If (nInd2 > 0)
					BT_ClientAreaInvalidateRect( 'fSplit6' , nRow1  +  ( ( nInd2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
				End If


			End If

			If nClearSel > 0
				xLimpSub( 'fSplit6' , @nClearSel ,  @nMainSel ,  nHeightDrop )
			End If

			If (nMainSel == 0 ) .Or. (  nMainSel > Len(aOpcoes)      )
				Return
			End If

			cOpcao 		:= alltrim(  Right( aOpcoes[nMainSel][1]  , Len( aOpcoes[nMainSel][1] ) - 2  ) )
			cOpMainSel  := cOpcao


			If cOpMainSel == cOpBak

				lSetasDown := .f.
				xRestMenu( nHWnd )

				Return

			Else

				If nMainSel > 0
					BT_ClientAreaInvalidateRect( 'fSplit6' ,nHeightDrop +  nRow1  +  ( ( nMainSel - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
				End If


				If nMainSel > 0
					nClearSel := nMainSel
				End If

			End If

			If !aOpcoes[nMainSel][3]
				yAviso(  Hb_AnsiToOem("Opção Indisponivel.") , .f. )
				Return
			End If

		

			If lSubOpen
				xFechaMen()	 
				//msginfo('ok22')
				BT_ClientAreaInvalidateAll('fSplit6')
			End If 



			nRow1 := (nMainSel * nItemSubHeight)
			xDropDown(   Alltrim(Str( nMainsel)) + "-" + cOpcao   , nRow1  )


			//SysWait(.1)


		End If



		If ( nMsg == WM_MOUSEMOVE )

			yP1 := 0

			If nMainSel > 0
				If (nMainSel == xOpSelPos( 'fSplit6' , nHeightDrop , Len(aOpcoes) , nItemDrop1 ))
					Return
				End If
			End if

			
			//msginfo(Str(nWParam ))
			


			nMainSel := xOpSelPos( 'fSplit6' , nHeightDrop , Len(aOpcoes) , nItemDrop1 )


			If (nMainSel = -1) .or. (nMainSel = -2)

				If (nMainSel = -1) .And. (l_Httb)
					SetWindowCursor( nHWnd , IDC_ARROW )
					Return
				End If

				If (nMainSel = -2) .And. (l_Http)
					SetWindowCursor( nHWnd , IDC_ARROW )
					Return
				End If

			End If



			If nMainSel = nClearSel
				Return
			End If


			SetWindowCursor( nHWnd , CURSORHAND)

			If (nMainSel > Len(aOpcoes))


				If Empty( Alltrim(cOpMainSel)   )

					If nClearSel > 0
						nClearSel := 0
						nMainSel := 0
						BT_ClientAreaInvalidateAll( nHWnd  )
						nItemDrop1 := 0
					End If

				Else


					If (nClearSel > 0)
						xLimpSub( 'fSplit6' , @nClearSel ,  @nMainSel , nHeightDrop  )
					End If

				End If

				nClearSel := 0

				SetWindowCursor( nHWnd , IDC_ARROW )
				xHideHint()

				Return

			End If




			//PostMessage(nHWnd ,WM_PAINT , 0,0 )


			nsel1 := nClearSel



			If nClearSel > 0
				xLimpSub( 'fSplit6' , @nClearSel ,  @nMainSel , Iif( nClearSel > nItemDrop1   , Iif(lSetasDown ,nHeightDrop   , nHeightDrop  )    , 0    ) )
			End If



			If nMainSel > 0
				nClearSel := nMainSel
			Else
				Return
			End If


			cOpcao := alltrim(  Right( aOpcoes[nMainSel][1]  , Len( aOpcoes[nMainSel][1] ) - 2  ) )

			/*
		    If (cUltOpcaoSel = cOpcao)
				Return 
			End If 	
			*/



			If (nClearSel > 0) .And. (nClearSel <= Len(aOpcoes))
				//cUltOpcaoSel := aOpcoes[nClearSel][1]

				cUltOpcaoSel := Alltrim(  Right( aOpcoes[nClearSel][1]  , Len( aOpcoes[nClearSel][1] ) - 2  ) )
			Else

				lTracking42 := TrackMouseEvent(nHWnd)
				Return

			End If


			//msginfo('ok')



			SetWindowCursor( nHWnd , CURSORHAND)

			nRow1 := -(GetProperty( 'fSplit6' , "VscrollBar" , "Value"))


			cUltOpcaoSel :=  Alltrim(cOpcao)



			If nMainSel > 0

				If !aOpcoes[nMainSel][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					xHideHint()
					Return
				End If



				If ( nMainSel  >= nItemDrop1 )
					BT_ClientAreaInvalidateRect( 'fSplit6' , Iif(lSetasDown ,nHeightDrop + 0 , nHeightDrop) + nRow1  +  ( ( nMainSel - 1) * nItemSubHeight) , 0 , nColTamMenu ,  nItemSubHeight - 1    , .t. )
				Else
					BT_ClientAreaInvalidateRect( 'fSplit6' ,nRow1  +  ( ( nMainSel - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight  - 1  , .t. )
				End If

			End If




			If !Empty(    Alltrim(  aOpcoes[nMainSel][2]  )   )
				cTp1 := Alltrim(  aOpcoes[nMainSel][2]  )  + '  ' + Alltrim(Str(nsel1)) + '    ' +  Alltrim(Str( nMainSel  ))
			End If



			If (!Empty(Alltrim(cTp1)))

				nRow1 := 0

				GetCursorPos (@nCol, @nRow1)

				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow1  , GetProperty('fSplit6', 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow1+15 )
				End If

				xDispUpTam(cTp1   )


			Else
				xHideHint()
			End If

			lTracking42 := TrackMouseEvent(nHWnd)

			//lTracking42 := .f.


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



Function xMenuPrin()

	Local nHnd  := Nil

	Local n1    := 1


	EscondeJan()


	cActiveJan  := "Main"

	If _isControlDefined('Image_5' , 'fSplit2')
		SetProperty('fSplit2','Image_5','Visible', .f.)
		If _isControlDefined('Img' + Right(cLblSelected,4) , 'fSplit2' )
			SetProperty('fSplit2','Img' + Right(cLblSelected,4)   ,'Visible', .f.)
		End If
	End If


	cLblSelected := ''

	For n1 := 1 to Len(aButTop)
		aButTop[n1][3] := .f.
	Next

	ButtonsTop( .f. )


	If nHanSelected > 0
	//	EventProcessAllHookMessage(EventCreate({ || LabelEventHandler(aOpcoes) }, nHanSelected  ), .T.)
		PostMessage( nHanSelected   , WM_MOUSELEAVE , 0, 0)
	End If


	nHanSelected := 0

	Refreshall('fSplitSubMenu')
	SysWait(.1)

	//msginfo('ok')



Return


Function xMainHandle( xMainJan )

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	Local nContItens := 0
	Local nQt        := 0
	Local nRow       := 0
	Local nindice

	
	If nMsg == WM_KEYDOWN

		If nWParam = VK_RETURN

			//msginfo('ok enter')

		End If 


		IF nWParam == VK_TAB
			//msginfo('1')


			SendMessage( GetProperty(  'fSplit6' , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )
			SysWait(.1)

			//msginfo('1')

		End If 

	End If 		




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




Function EscondeJan()

	Local i := 1
	Local nTam := Len(aJanelas)
	Local lDel := .f.

	Aeval( aButTop , { |a| HideJan(a[2]) } )

Return

Function HideJan( cJanela )

	If _isWindowDefined(  'F' + Left(cJanela,5) )
		DoMethod(  'F' + Left(cJanela,5)    , "Hide" )
	Else

	End If

	RefreshAll('fSplitSubMenu')

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

	hBit10 := BT_BitmapCaptureWindow ('fSplit5' , 0 , 0 , fSplit5.Width , fSplit5.Height)
	hBit11 := BT_BitmapCaptureWindow ('fSplit2' , 0 , 0 , fSplit2.Width , fSplit2.Height)
	hBit12 := BT_BitmapCaptureWindow ('fSplit10' , 0 , 0 , fSplit10.Width , fSplit10.Height)

	Default cExtra := ''

	BT_BitmapSaveFile (hBit10  , "hBit10.bmp")
	BT_BitmapSaveFile (hBit11  , "hBit11.bmp")
	BT_BitmapSaveFile (hBit12  , "hBit12.bmp")

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




Function ButtonsTop( lCria )

	Local cMenuName := 'fSplit2'
	Local nCol := 34
	Local nHBut1
	Local nColx := 0
	Local nRow := 1
	Local nHandle1
	Local cLabelx
	Local cLabel3
	Local nacum := 33
	Local cUltl := ''
	Local nPulo := 130
	Local cSelected := ''
	Local cValor    := ''
	Local n1


	Default lCria := .t.


	If lCria
		aCords := {}
	End If


	For n1 := 1 To Len(aButTop)

		cLabelx := "LblUp" + StrZero(n1,4)

		If lCria

			cUltl   := cLabelx

			If !_IsControlDefined( cLabelx, cMenuName )

				DEFINE LABEL &(cLabelx)
				PARENT    fSplit2
				ROW       10
				COL       nCol
				WIDTH     110
				HEIGHT    40
				VALUE     " " + Hb_AnsiToOem( alltrim(  aButTop[n1][2] )   )
				ALIGNMENT LEFT
				FONTNAME "Arial"
				FONTSIZE 9
				BACKCOLOR {7,101,125}
				FONTCOLOR {255,255,255}
				TRANSPARENT .f.
				VISIBLE .T.
				ACTION ( PlaceJan( This.Name , 'F' + Left(Alltrim(This.Value),5) ) , ShowJan( alltrim(This.Value) ) 	)
			END LABEL


			SetProperty( 'fSplit2' , cLabelx , 'BACKCOLOR' , {9,111,137} )

		//	EventProcessAllHookMessage(EventCreate({ || LabelEventHandler() },  GetControlHandle( cLabelx  ,  'fSplit2')   ), .T.)


			Aadd( aCords  , { cLabelx , nCol ,nCol+110  , "F" + Left(  Alltrim(  aButTop[n1][2] ) , 5)  }  )

			If aButTop[n1][3]
				cSelected := cLabelx
				cValor    := 'F' + Left(Hb_AnsiToOem( alltrim(  aButTop[n1][2] )   ),5)
			End If

			cImagex := "Img_" + StrZero(n1,4)


			@ 1,nCol+110 IMAGE &(cImagex) OF fSplit2  PICTURE "img\Fechax.Bmp" WIDTH 20 HEIGHT 40 STRETCH ACTION FechaJan(  This.Name )

			//EventProcessAllHookMessage(EventCreate({ || LabelEventHandler() },  GetControlHandle( cImagex  ,  'fSplit2')   ), .T.)

			nHandle1 := GetControlHandle( cLabelx , 'fSplit2'  )

			SetHandCursor( nHandle1, CURSORHAND )
			SetHandCursor( GetControlHandle( cImagex , 'fSplit2' ) , CURSORHAND )

			nAcum += nPulo

		End If


		nColx := nCol

	Else

		//SysWait(.3)

		If _IsControlDefined( cLabelx, cMenuName )
			SetProperty('fSplit2', cLabelx , 'Visible'    , .t. )
			SetProperty('fSplit2', "Img_" + StrZero(n1,4) , 'Visible' , .t. )
		End If

	End If

	nCol += nPulo+2

Next


If !Empty(cSelected)
	PlaceJan(  cSelected , cValor )
End If

lVScrool := .f.


If (nacum >= GetProperty('fSplit2','Width'))
	lVScrool := .t.
	lVertScrol( .t. )
End If


Return nColx

Function FechaJan(  cJanela  , lExclBut , nI1 , nI2)

	Local cId := Right(cJanela,4)
	Local cJan  := GetProperty('fSplit2' , 'LblUp' + cid , 'Value' )
	Local nCol1 := GetProperty('fSplit2' , 'LblUp' + cid , 'Col' )
	//Local nCol2 := GetProperty('fSplit2' , 'Img_' + cid , 'Col' )
	Local n1
	Local n2
	Local nTam := Len(aButTop)
	Local cImg1
	Local lRealoca := .f.
	Local nindx := 0

	Default lExclBut := .f.

	Default nI1 := 0
	Default nI2 := 0


	n1 := ascan(aButTop , {|a| alltrim(a[2]) == alltrim(cJan) })

	If n1 > 0

		*// Exclue janela mais a Direita.
		If !((cId =  StrZero( Len(aButTop) , 4)   ) .And. (Len(aButTop) >= 2)  )
			lRealoca := .t.
		End If


		adel( aButTop , n1)
		aSize( aButTop , nTam - 1 )



		_ReleaseControl( 'LblUp' + cid  , 'fSplit2' )
		_ReleaseControl( 'Img_' + cid  , 'fSplit2' )
		_ReleaseControl( 'Img' + cid  , 'fSplit2' )
		//sysWait(.2)



		//DelImgBut()

		If Len(aButTop) = 0
			clblSelected := ''
		Else

			If Len(aButTop) > 1

				If Val(cId) != Len(aButTop)
					xRealocButs( Val(cId) , nCol1  ,  )
				End If

				//clblSelected := "LblUp" + StrZero( Len(aButTop) ,4)

				If !Empty(Alltrim(cLblSelected))
					// _ReleaseControl( cLblSelected , 'fSplit2' )
					_ReleaseControl('Image_5' , 'fSplit2' )

					cImg1 := 'Img' + Right(cLblSelected,4)

					_ReleaseControl( cImg1 , 'fSplit2' )

					n2 := Val( Right(Alltrim(cLblSelected) , 4)  )

					If _IsControlDefined('LblUp' + StrZero(n2,4) , 'fSplit2')
						SetProperty('fSplit2' ,  'LblUp' + StrZero(n2,4) , 'Visible' ,  .t.   )
						SetProperty('fSplit2' ,"Img_"    + StrZero(n2,4) , 'Visible',   .t.   )
					End If

					cLblSelected := ''

				End If

			Else

				If (lRealoca)
					xRealocButs( Val(cId) , nCol1  ,  )
				End If

			End If


		End If

	End If



	If _IsWindowDefined( 'F' + Left(alltrim(cJan),5) )
		Refreshall('fSplitSubMenu')
		DoMethod(   'F' + Left(alltrim(cJan),5) , 'Release' )
		//SysWait(.2)
	Else

	End If


	//SysWait(.3)


	cActiveJan := 'Main'

	//xHMenuPrin()

	//SysWait(.3)

	nindx := xIndexEvent( nHanSelected  )

	If  (nIndx == 0)
		//EventProcessAllHookMessage(EventCreate({ || LabelEventHandler(aOpcoes) }, nHanSelected  ), .T.)
	Else
	//	EventStop( nIndx , .f. )
	End If


	nHanSelected := 0

	If nindexHndcli > 0
		//EventRemove(nindexHndcli)
	End If


	//Refreshall('fSplitSubMenu')


	//xHMenuPrin()
	xMenuPrin()


	PostMessage(  nHanSelected , WM_MOUSEMOVE , 0 ,0)
	SysWait(.1)
	PostMessage(  nHanSelected , WM_MOUSELEAVE , 0 ,0)

	SysWait(.2)

Return


Function xRealocButs( nId , nColx )
	Local n1 := 1
	Local nColz := nColx
	Local nColAnt := 0
	Local nColini := 34
	Local laJuste := .f.

	IF (cLblSelected != ( 'LblUp' + StrZero(nId , 4)  ) )
		laJuste := .t.
	End If

	laJuste := .f.

	For n1 := 1 to 300


		If _isControlDefined('LblUp' + StrZero(n1,4) , 'fSplit2' )


			SetProperty('fSplit2' ,  'LblUp' + StrZero(n1,4) , 'Col' ,  nColIni       )
			SetProperty('fSplit2' ,"Img_"    + StrZero(n1,4) , 'Col',   nColini+110   )

			nColIni += 130

		Else


		End If

	Next

Return

Function ReleaseTeto()

	Local n1
	Local cLabelx
	Local cImagex := ''

	For n1 := 1 To Len(aButTop)

		cLabelx := "LblUp" + StrZero(n1,4)

		//msginfo(cLabelx)


		If _IsControlDefined( cLabelx, 'fSplit2' )
			_ReleaseControl( cLabelx , 'fSplit2')
		End If

		cImagex := "Img_" + StrZero(n1,4)

		If _IsControlDefined( cImagex , 'fSplit2' )
			_ReleaseControl( cImagex , 'fSplit2')
		End If

		aButTop[n1][3] := .f.

	Next

Return


Function lVertScrol( lVisible )

	Local nLeft := GetProperty('Main','Width' )

	SetProperty('fSplit10', 'imgEsquerda','Visible', lVisible )
	SetProperty('fSplit10', 'imgDireita','Visible', lVisible )

	If lVisible
		SetProperty("fSplit10","Image_1",  "Visible" , .f.)
	Else
		SetProperty("fSplit10","Image_1",  "Visible" , .t.)
	End If



Return


Function ScrolVert(nDirecao)

	Local ncumt := (32 +    (130 * Len(aButTop) ))

	//msginfo('tingido')

	If nDirecao == 1
		//msginfo(Str( nacumz ) + ' ' + Str(ncumt) )

		If nacumz > ncumt
			//msginfo('tingido')
		Else
			nColScrool +=  130
			nacumz     +=  130
		End If

	Else

		If nacumz > GetProperty('fSplit2','Width')
			nColScrool -= 130
			nacumz     -=  130
		Else
			nacumz := GetProperty('fSplit2','Width')
			// msginfo('tingido')
		End If


		//msginfo(Str( nacumz ) + ' ' + Str(ncumt) )
	End If

	//SysWait(.4)
	_HMG_PRINTER_SETHSCROLLVALUE( GetFormHandle(  'fSplit2'  )  , nColScrool)

	//RefreshAll('fSplit2')

	_ShowWindow( 'fSplit2')
	SysWait(.3)


	msginfo('l')

Return


function TestBut()

	aButTop := {}

	aAdd( aButTop ,  { 0 ,  "F1rne33edore1" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Forne2cedore2" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Fornece44443" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Forne333dore4" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Forn3cedores5" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Fornecedddore6" , .t.  }     )


	aAdd( aButTop ,  { 0 ,  "Fornecedddore7" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Fornecedddore8" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Fornecedddore9" , .t.  }     )

	aAdd( aButTop ,  { 0 ,  "Fornecedddor10" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Fornecedddor11" , .t.  }     )
	aAdd( aButTop ,  { 0 ,  "Fornecedddor12" , .t.  }     )



	nacumz := GetProperty('fSplit2','Width')

	ButtonsTop( .t.)
	// lVertScrol( .t. )
	//RefreshAll('fSplit2')

	// msginfo('ok')


Return


FUNCTION SaidaFocus(aLb)

	LOCAL n

	For n := 1 TO Len(aLb)
		PostMessage(aLb[n][LABEL_HWND], WM_MOUSELEAVE, 0, 0)
	Next

RETURN NIL

Function HideMenuPrin( lVisible1 )

	Local n1

	For n1 := 1 To Len(aOpcoes)
		If _IsControlDefined( aOpcoes[n1][1]   ,"fSplit6")
			SetProperty("fSplit6", aOpcoes[n1][1]  ,"Visible", lVisible1  )
		End If
	Next


Return


Function HideAll(cForm1 , lVisible)

	Local n := 1
	Local cLabel := ""

	Default lVisible := .f.

	If nLevelMenu   == 1
		HideMenuPrin(lVisible)
	End If


	fSplit4.fUserDb.Visible := lVisible
	fSplit4.fLabelUser.Visible := lVisible
	fSplit4.fServerDb.Visible := lVisible

	fSplit3.fLabel1Dt.Visible := lVisible

	fSplit3.Label_1.Visible := lVisible

	//fSplit4.fUserDb.Visible := .f.


	For n := 1 to 4
		For z := 1 to 99
			cLabel := "MenuX" + StrZero(n,2)+StrZero(z,2)
			If _IsControlDefined(cLabel,cForm1)
				SetProperty(cForm1,cLabel,"Visible", lVisible)
			End If
		Next
	Next

Return

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





Function OpenOpcao( cCadastro , cTitulo , nHandle1 )

	If cCadastro = 'Fornecedores'

		If ( FindWindowEx( ,, , cTitulo  ) > 0 )
			yAviso( 'Este Cadastro ja esta Ativo.'  )
			RefreshAll('fSplitSubMenu')
		Else



			If Len(aButTop) > 0
				ReleaseTeto()
			End If

			cActiveJan  := "FForne"

			aAdd( aButTop ,  { 0 ,  "Fornecedores" , .t.  }     )
			nCol1 := ButtonsTop( .t. )

			cControl := ''
			cForm    := ''

			MntFornec()


		End If

	End If

	If cCadastro = 'Vendedores'


		If ( FindWindowEx( ,, , cTitulo  ) > 0 )
			yAviso( 'Este Cadastro ja esta Ativo.'  )
			//yAviso( 'Este Cadastro ja esta Ativo.' )
			RefreshAll('fSplitSubMenu')
		Else

			If Len(aButTop) > 0
				ReleaseTeto()
			End If

			cActiveJan := "FVende"

			aAdd( aButTop ,  { 0 ,  "Vendedores" , .t.  }     )
			nCol1 := ButtonsTop( .t. )

			cControl := ''
			cForm    := ''
			MntVend()


		End If

	End If



	If cCadastro = 'Clientes'

		If ( FindWindowEx( ,, , cTitulo  ) > 0 )
			yAviso( 'Este Cadastro ja esta Ativo.' ,, .f. )
			RefreshAll('fSplitSubMenu')
		Else

			If Len(aButTop) > 0
				ReleaseTeto()
			End If

			cActiveJan := "FClien"

			aAdd( aButTop ,  { 0 ,  "Clientes" , .t.  }     )
			nCol1 := ButtonsTop( .t. )

			cControl := ''
			cForm    := ''
			CadCli()


		End If

	End If


REturn

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

	Local n1
	Local cLabelx
	Local cImgx
	Local cImgName


	For n1 := 1 To Len(aButTop)

		cLabelx := "LblUp" + StrZero(n1,4)

		cImgx := "Img_" + StrZero(n1,4)

		If _IsControlDefined(cLabelx , 'fSplit2')
			SetProperty('fSplit2',cLabelx,'Visible', lShow )

		End If

		If _isControlDefined(cImgx , 'fSplit2')
			SetProperty('fSplit2',cImgx,'Visible', lShow )
		End If

	Next

	SetProperty('fSplit2','Image_1','Visible', lShow)
	SetProperty('fSplit10','Image_1','Visible', lShow)


	If (lVScrool)
		SetProperty('fSplit10','ImgEsquerda','Visible', lShow)
		SetProperty('fSplit10','ImgDireita','Visible', lShow)
		//SetProperty('fSplit10','Image_1','Visible', lShow)
	End If

	If !Empty(cLblSelected)

		cImgName := 'Img' + Right(cLblSelected,4)
		If _IsControlDefined('Image_5','fSplit2')
			SetProperty('fSplit2','Image_5','Visible', lShow)
			SetProperty('fSplit2',cImgName,'Visible',  lShow)
		End If

	End If


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

	Else

		Proc_ON_PAINT(cJan)

	End If




Return

Function xTesMenu( nRow , nCol )

  Local aZop1 := {}
  


  Aadd(aZop1 , { "1-Impressão" , "Imp.Doc" , .t. , { || msginfo('k2' )   }    }    )
  Aadd(aZop1 , { "2-Visualizar Imp." , "Vis Imp.Doc" , .t. , { || ( msginfo('k32' ) , xFechaMen() )    }   , .t.    }   )
  Aadd(aZop1 , { "3-Novo Arquivo   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
  Aadd(aZop1 , { "4-Novo Arquivo2   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
  Aadd(aZop1 , { "  Novo Arquivo3   " , "Novo Arquivo..." , .f. , { || msginfo('k22' )     }    }  )
  Aadd(aZop1 , { "  Novo Arquivo4   " , "Novo Arquivo..." , .t. , { || msginfo('k22' )     }    }  )
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


  xMenuOp(aZop1 , nRow , nCol ) 


Return 


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

	Local cText := hb_memoRead(cArqLog)

	hb_memowrit(cArqLog , cText +' '+ cTexto )

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


	HB_FUNC ( SETVSCROLLVALUE )
	{

	SendMessage ( (HWND) HMG_parnl (1), WM_VSCROLL ,  SB_LINEDOWN , 15 ) ;

	}



	HB_FUNC ( ENABLESCROLLBAR )
	{
	HWND hWnd    = (HWND) HMG_parnl (1);
		UINT nBar    = (UINT) hb_parnl  (2);
		UINT nAction = (UINT) hb_parl   (3) ? ESB_ENABLE_BOTH : ESB_DISABLE_BOTH;

	EnableScrollBar (hWnd, nBar, nAction);
		}




	#pragma ENDDUMP




