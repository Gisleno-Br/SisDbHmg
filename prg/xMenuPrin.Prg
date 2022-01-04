#require "hbxpp"


#include <hmg.ch>
#include <dll.ch>



#define WM_DESTROY          0x0002
#define SC_CLOSE            61536


#define FONTCOR {0,106,133}

#define BACK1 {229,237,242}

#define BACK5 {255,255,255}


#define CORSEL {215,228,236}
//{180,205,220}
//{216,228,236}

#define FONT1 {102,102,102}

#define XMAXITEM 15


Static nIndexEventY := 0
Static aOpcoes  := {}
Static nMainSel := 0
Static nClearSel  := 0
Static cOpMainSel  := ''
Static nItemDrop1 := 0
Static nHeightDrop := 0
Static lSetasDown := .f.
Static l_Httb := .f.
Static l_Http := .t.

Static lModeTecla := .f. 

Static aOpx1 := {}
Static nItemx1 := 0

Static lSubOpen := .f.
Static nItemClr := 0
Static cOpSely := ''

Static nIdMenu1 := 0

//aOpcoes , nMainSel , nClearSel , cOpMainSel , nItemDrop1 , nHeightDrop , lSetasDown , .f. , l_Httb , l_Http

Static lTracking142 := .f.


Static nScrLin := 0

Static nLinhaAtual := 0

//Static nItemClr := 0

//	Private l_Httb := .f.
//Private l_Http := .t.

//Private cOpSely := ''



Function xMenuMain( nRow1 , nCol1 , aOpPrin , aSubOps )


	aOpcoes := Aclone( aOpPrin )

	aSubOps := {}


	DEFINE WINDOW Win_MenuPrincipal AT nRow1, nCol1 WIDTH nColTamMenu HEIGHT 520 TITLE 'MenPrincipal1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR WHITE VIRTUAL HEIGHT 521 ;
		ON PAINT xPaintMenu( ThisWindow.Name , aOpcoes , nMainSel , nClearSel , cOpMainSel , nItemDrop1 , nHeightDrop , lSetasDown , .f. , l_Httb , l_Http )
END WINDOW




DEFINE WINDOW JanMenuSub AT 200, 200 WIDTH nColTamMenu HEIGHT 500 TITLE 'Tsub' ;
	NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT Win_MenuPrincipal BACKCOLOR aCorSub1 VIRTUAL HEIGHT 15000 ;
	ON PAINT xPaintMenu( ThisWindow.Name , aOpx1 , nItemx1 , nItemClr , cOpSely , 0 , 0 , .f. , .t.  )
END WINDOW



HideWindow(   GetFormHandle('JanMenuSub')     )

///xPaintMenu( ThisWindow.Name , aOpx1 , nItemx1 , nItemClr , cOpSely , 0 , 0 , .f. , .t.  )


If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventPrin1"  ) )  ) = 0
	InstallEventHandler( "EventPrin1" )
	nIndexEventY := EventCreate (  { ||   xTeclasMenu( )   }  )
End If

HMG_ChangeWindowStyle( Win_MenuPrincipal.Handle    , WS_EX_DLGMODALFRAME,, NIL, .T., .T.)
HMG_ChangeWindowStyle( Win_MenuPrincipal.Handle    , NIL, WS_EX_STATICEDGE, .T., .T.)

HMG_ChangeWindowStyle( Win_MenuPrincipal.Handle  ,WS_EX_TOOLWINDOW  , NIL, .t., .t.)


//    nHandle1 := Win_Menu1.Handle



HMG_ChangeWindowStyle( JanMenuSub.Handle    , WS_EX_DLGMODALFRAME,, NIL, .T., .T.)
//HMG_ChangeWindowStyle( JanMenuSub.Handle    , NIL, WS_EX_STATICEDGE, .T., .T.)


ShowScrollBar( GetFormHandle( 'Win_MenuPrincipal' ), 0, .F. )
ShowScrollBar( GetFormHandle( 'Win_MenuPrincipal' ), 1, .F. )


_ShowWindow("Win_MenuPrincipal")


BT_ClientAreaInvalidateAll(   'Win_MenuPrincipal'  )



Return




Function EventPrin1( nHWnd, nMsg, nWParam, nLParam )

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



    *// Menu Principal


	If (nHWnd == GetProperty(  'JanMenuSub' , "HANDLE" )) .And. (nItemDrop1 > 0)


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
					yAviso("Opção Indisponivel." , .f. )
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
				If (nItemx1 = xOpSelPos( 'JanMenuSub' , 0 , Len(aOpx1) , 0 )	)
					Return
				End If
			End If

			nItemx1 := xOpSelPos( 'JanMenuSub', 0 , Len(aOpx1) , 0 )
			nRow1 := -(GetProperty( 'JanMenuSub' , "VscrollBar" , "Value"))



			If (nItemx1 <= Len(aOpX1))
				If !aOpx1[nItemx1][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					Return
				End If
			End If


			SetWindowCursor( nHWnd , CURSORHAND)


			If nItemClr > 0
				xLimpSub( 'JanMenuSub' ,  @nItemClr ,  @nItemx1 , 0 )

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

				BT_ClientAreaInvalidateRect( 'JanMenuSub' ,  nRow1  +  ( ( nItemx1 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )


				*// Sub Menu
				If (nItemx1 <= Len(aOpx1)) .And. (Len(aOpx1[nItemx1]) >= 5)

					If aOpx1[nItemx1][5]

						nRow2 := 0
						nCol2 := 0


						GetCursorPos( @nCol2 , @nRow2)

						Eval( aOpx1[nItemx1][6]  ,  (nRow2 - nItemSubHeight) + 15    , ;
							GetProperty( 'JanMenuSub'  , 'Col') + nColTamMenu + 1  )

						nIdMenu1 := nItemx1

						lSubOpen := .t.


						Return

					End If

				End If

			End If


			If (nItemx1 <= Len(aOpx1)) .And.  !Empty(    Alltrim(  aOpx1[nItemx1][2]  )   )

				cTp1 :=	  Alltrim( 	 aOpx1[nItemx1][2]  )

				nRow1 := 0


				GetCursorPos (@nCol, @nRow1)

				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow1  , GetProperty(  'JanMenuSub', 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow1+15 , GetProperty( 'JanMenuSub', 'Col') + GetProperty( 'JanMenuSub', 'Width') + 10   )
				End If

				xDispUpTam(cTp1 )

			Else

				xHideHint()
			End If



			lTracking142 := TrackMouseEvent(nHWnd)


			//msginfo('ok  ')


		End If




	End If


	If (   nHwnd == GetProperty(  'Win_MenuPrincipal' , 'Handle'))


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
					xLimpSub(  'Win_MenuPrincipal'  , @nClearSel ,  @nMainSel , Iif( nMainSel  >= nItemDrop1 , HeightDrop ,0) - 1  )

				End If

				If _isWindowDefined("Win_Msg")
					If IsWindowVisible(  GetFormHandle("Win_Msg") )
						HideWindow( GetFormHandle("Win_Msg"))
					End If
				End If

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

			nRow1 := -(GetProperty(  'Win_MenuPrincipal'  , "VscrollBar" , "Value"))



			If (lSetasDown) .AND. (nWParam != 90)

				If (nLinhaAtual == 0)
					nLinhaAtual := Int(nTamSubMenuConsulta / nItemSubHeight)
				End If



				If (nMainSel = 1000)

					//xPaintMenu( ThisWindow.Name , aOpx1 , nItemx1 , nItemClr , cOpSely , 0 , 0 , .f. , .t.  )

					ScrollMenu( 2 , GetProperty('JanMenuSub' , 'Handle' ) , @nScrLin , @nLinhaAtual , nContItens , @l_Http , @l_Httb , nItemDrop1 , ;
						'Win_MenuPrincipal' , GetProperty('JanMenuSub' , 'Height' )  )
					Return

				End If


				If (nMainSel = 2000)

					ScrollMenu( 1 , GetProperty('JanMenuSub' , 'Handle' ), @nScrLin , @nLinhaAtual , nContItens , @l_Http , @l_Httb , nItemDrop1 , ;
						'Win_MenuPrincipal' , GetProperty('JanMenuSub' , 'Height' )  )
					Return

				End If

			End If


			If nItemDrop1 > 0
				xRestMenu( 'JanMenuSub'  , nHWnd , .f. )
			End If



			cOpBak := cOpMainSel

			If !Empty( Alltrim(cOpMainSel)   )

				nInd2 := Ascan(  aOpcoes  , {  |a| Right( a[1]  , Len(a[1]) - 2 ) == Alltrim(cOpMainSel)   }  )

				If (nInd2 > 0)
					BT_ClientAreaInvalidateRect(  'Win_MenuPrincipal'  , nRow1  +  ( ( nInd2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
				End If


			End If

			If nClearSel > 0
				xLimpSub(  'Win_MenuPrincipal'  , @nClearSel ,  @nMainSel ,  nHeightDrop )
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
					BT_ClientAreaInvalidateRect(  'Win_MenuPrincipal'  ,nHeightDrop +  nRow1  +  ( ( nMainSel - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
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
				BT_ClientAreaInvalidateAll( 'Win_MenuPrincipal' )
			End If

			nRow1 := (nMainSel * nItemSubHeight)
			xDropDown( 'JanMenuSub' ,    Alltrim(Str( nMainsel)) + "-" + cOpcao   , nRow1  )


			//SysWait(.1)


		End If



		If ( nMsg == WM_MOUSEMOVE ) .or. (nWParam = 90)

			yP1 := nMainSel



			If nMainSel > 0
				If (nMainSel == xOpSelPos( 'Win_MenuPrincipal' , nHeightDrop , Len(aOpcoes) , nItemDrop1 ))
					Return
				End If
			End if


			If (nWParam != 90)
				nMainSel := xOpSelPos(  'Win_MenuPrincipal' , nHeightDrop , Len(aOpcoes) , nItemDrop1 )
			End If

			If (lSubOpen)
				If (nIdMenu1 != nMainSel)
					xFechaMen()
					nIdMenu1 := 0
					lSubOpen := .f.
				End If
			End If



			If (nMainSel = 1000) .or. (nMainSel = 2000)

				If yP1 > 0
					xLimpSub(  'Win_MenuPrincipal'  , yP1 ,  yP1 , Iif( yP1 > nItemDrop1   , Iif(lSetasDown ,nHeightDrop   , nHeightDrop  )    , 0    ) )
				End If



				If (nMainSel = 1000) .And. (l_Httb)
					SetWindowCursor( nHWnd , IDC_ARROW )
					Return
				End If


				If (nMainSel = 2000) .And. (l_Http)
					SetWindowCursor( nHWnd , IDC_ARROW )
					Return
				End If



				//nClearSel := 0

			End If


			If (nMainSel = nClearSel) .and. (nMaInSel != 1000)
				Return
			End If



			SetWindowCursor( nHWnd , CURSORHAND)

			If (nMainSel > Len(aOpcoes)) .And.  (nMaInSel < 1000)


				If Empty( Alltrim(cOpMainSel)   )

					If nClearSel > 0
						nClearSel := 0
						nMainSel := 0
						nItemDrop1 := 0
						BT_ClientAreaInvalidateAll( 'Win_MenuPrincipal'  )
						SysWait(.1)
					End If

				Else

					If (nClearSel > 0)
						xLimpSub(  'Win_MenuPrincipal'  , @nClearSel ,  @nMainSel , nHeightDrop  )
					End If

				End If

				nClearSel := 0

				SetWindowCursor( nHWnd , IDC_ARROW )
				xHideHint()

				Return

			End If


			If  (nMaInSel >= 1000)
				Return
			End If


			nsel1 := nClearSel


			//If (nClearSel > 0) .And. (nMainSel > 0)


			If ( nClearSel > 0)
				xLimpSub(  'Win_MenuPrincipal'  , @nClearSel ,  @nMainSel , Iif( nClearSel > nItemDrop1   , Iif(lSetasDown ,nHeightDrop   , nHeightDrop  )    , 0    ) )
			End If


			If nMainSel > 0
				nClearSel := nMainSel
			Else
				Return
			End If


			cOpcao := alltrim(  Right( aOpcoes[nMainSel][1]  , Len( aOpcoes[nMainSel][1] ) - 2  ) )



			If (nClearSel > 0) .And. (nClearSel <= Len(aOpcoes))
				cUltOpcaoSel := Alltrim(  Right( aOpcoes[nClearSel][1]  , Len( aOpcoes[nClearSel][1] ) - 2  ) )
			Else

				lTracking42 := TrackMouseEvent(nHWnd)
				Return

			End If


			//msginfo('ok')



			SetWindowCursor( nHWnd , CURSORHAND)

			nRow1 := -(GetProperty(  'Win_MenuPrincipal'  , "VscrollBar" , "Value"))


			cUltOpcaoSel :=  Alltrim(cOpcao)




			If nMainSel > 0

				If !aOpcoes[nMainSel][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					xHideHint()
					Return
				End If

				If ( nMainSel  >= nItemDrop1 )
					BT_ClientAreaInvalidateRect(  'Win_MenuPrincipal'  , Iif(lSetasDown ,nHeightDrop + 0 , nHeightDrop) + nRow1  +  ( ( nMainSel - 1) * nItemSubHeight) , 0 , nColTamMenu ,  nItemSubHeight - 1    , .t. )
				Else
					BT_ClientAreaInvalidateRect(  'Win_MenuPrincipal'  ,nRow1  +  ( ( nMainSel - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight  - 1  , .t. )
				End If

			End If




			*// Mode teclas , Não exibe Hint.

			If (nWParam != 90)

				If !Empty(    Alltrim(  aOpcoes[nMainSel][2]  )   )
					cTp1 := Alltrim(  aOpcoes[nMainSel][2]  )  + '  ' + Alltrim(Str(nsel1)) + '    ' +  Alltrim(Str( nMainSel  ))
				End If



				If (!Empty(Alltrim(cTp1)))

					nRow1 := 0

					GetCursorPos (@nCol, @nRow1)

					If !_isWindowDefined("Win_Msg")
						CrieJanTip( nRow1  , GetProperty('Win_MenuPrincipal', 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
					Else
						xDispHint( cTp1 , nRow1+15 )
					End If

					xDispUpTam(cTp1   )


				Else
					xHideHint()
				End If


				lTracking42 := TrackMouseEvent(nHWnd)

			End If




			//lTracking42 := .f.


		End If

	End If



Return


Function xCloseMPrin()

	Local nI1 := 0

	Local nHandle1  := DoFindWin("MenPrincipal1")
	Local nHandle2  := DoFindWin("Tsub")


	If (nHandle1 > 0)



		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )

		Do Events
		Do Events

		SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )


		If (nHandle2 > 0)

			SendMessage( nHandle2, WM_SYSCOMMAND, SC_CLOSE , 0 )

			Do Events
			Do Events

			SendMessage( nHandle2, WM_SYSCOMMAND, WM_DESTROY , 0 )

			Do Events


		End If


		If !RemoveHandler( "EventMenu1"  )
			msginfo("Erro ao remover Handle Event.")
		End If

		
		If !EventRemove(nIndexEventY)
			msginfo("Erro ao remover Handle Event 22 .")
		End If 



	End If

//msginfo('ok2')


Return


Function xDropDown(  cJanelaSub  , cMenuDesc  , nTopx1 )


	Local nIndice := Ascan(aOpcoes , { |a|  Alltrim(a[1]) == Alltrim(cMenuDesc) } )

	Local nLinRow
	Local nLinex1
	Local nIncremento

	Local nTop   := nTopx1



	Local nItemMax := Int(nTamSubMenuConsulta / nItemSubHeight)


	nOpSel := nIndice



	If nIndice <= 0
		msginfo('Falha em System 0')
		Return
	End If

	nContItens := 0
	Aeval(aItens , { | a | Iif( Left(a[1],1) == Alltrim(Str(nindice)) , nContItens++ , Nil ) } )

	nItemDrop1 := nIndice

	aOpx1 := {}


	lSetasDown := .f.


	If nContItens >= nItemMax
		SetProperty(cJanelaSub, 'Height',  nTamSubMenuConsulta    )
		//nHeightDrop := nTamSubMenuConsulta
		nHeightDrop := nTamSubMenuConsulta +  (nItemSubHeight * 2)
		lSetasDown := .t.
	Else
		nHeightDrop := (nItemSubHeight * nContItens)
		SetProperty(cJanelaSub, 'Height',  nHeightDrop    )
	End If




	SetProperty( cJanelaSub  , 'Col', 1)



	ShowScrollBar( GetFormHandle( cJanelaSub), 0, .F. )

	ShowScrollBar( GetFormHandle(  cJanelaSub ), 1, .F. )

	aOpx1 := {}


	nLinRow := ((nIndice )  * nItemSubHeight)
	SetProperty(cJanelaSub , 'Row',  nLinRow   )



	SetProperty( cJanelaSub, 'Visible',   .t.  )



	Aeval(aItens , { | a | Iif( Left(a[1],1) == Alltrim(Str(nindice)) , Aadd(aOpx1, a ) , Nil ) } )
	cOpAberto := Alltrim(cMenuDesc)


	BT_ClientAreaInvalidateAll(cJanelaSub)

	DoMethod(cJanelaSub ,'Show' )


	BT_ClientAreaInvalidateAll('Win_MenuPrincipal' )

Return



Function xRestMenu(  cJsanSub1  , nHandle , lZeraVars  )

	Default lZeraVars := .t.


	If (lZeraVars)
		cOpMainSel := ''
		nMainSel := 0
		nClearSel := 0
		nHeightDrop := 0
		nItemDrop1  := 0
	End If

	//SysWait(.1)

	If (_isWindowDefined( cJsanSub1))
		DoMethod( cJsanSub1 ,'Hide')
	End If



	_HMG_PRINTER_SETVSCROLLVALUE(   nHandle  , 0 )

	BT_ClientAreaInvalidateAll(  'Win_MenuPrincipal')

REturn


Function xOpSelPos( cJan , nHeit2 , nItMax , nItDopred   )

	Local nCol := 0
	Local nRow := 0
	Local ar1
	Local NewPos
	Local nRow1 := -(GetProperty( cJan , "VscrollBar" , "Value"))
	Local nIa1 , nIa2

	Local nItem := 0



	DEFAULT nHeit2 := 0
	DEFAULT nItDopred := 0

	GetCursorPos (@nCol, @nRow)

	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJan  )  , nRow, nCol )


	NewPos := GetScrollPos( GetFormHandle(  cJan  ), 1 )

	If NewPos > 0
		nItem := (Int( (NewPos+Ar1[1])     / nItemSubHeight)+1)
	Else
		//nItem := (Int(Ar1[1] / nItemSubHeight)+1)
		nItem := (Int(  Ar1[1]  / nItemSubHeight)+1)
	End If



	If (nHeit2 > 0) .and. (nHeit2 < ar1[1] ) .And. (nHeit2 >= nItemSubHeight) .And. (ar1[1] > (nItMax * nItemSubHeight)   )
		nItem := (Int( NewPos + (Ar1[1] - nHeit2) / nItemSubHeight)+1)
	End If

	If (Ar1[1] - nHeit2) == 1
		nItem := nItDopred+1
	End If



	If (lSetasDown)

		nIa1 := (nItDopred * nItemSubHeight) + nTamSubMenuConsulta
		nIa2 := nIa1 + (nItemSubHeight * 2)

		If (Ar1[1] >= nIa1) .And. (  Ar1[1] <= nIa2 )


			If Ar1[1] <  (nIa1 + nItemSubHeight )
				nItem := 1000
			Else
				nItem := 2000
			End If

		End If

	End If

Return Abs(nItem)




Function ScrollMenu( nDirecao , hWnd1 , nScr1 , nPonteiro , nTotal , lHtp , lHtb , nDrop , cJanela , nHeight1 , lInvalidate  )

	Local lOk := .t.
	Local nLineSeta := nHeight1
	//GetProperty('fSplitSubMenu' , 'Height' )

	Local nItens := Int(nTamSubMenuConsulta / nItemSubHeight)

	Default lInvalidate := .t.




	If nDirecao == 2
		// Baixo

		If !lHtb


			nScr1 += nItemSubHeight
			nPonteiro++

			lHtp := .f.




			If lInvalidate
				BT_ClientAreaInvalidateRect( cJanela  , ( (nDrop * nItemSubHeight) + nLineSeta +  16)   , 0 , ;
					nColTamMenu , 16 , .t.  )
			End If


			If (nPonteiro = nTotal)
				lHtb := .t.

				If lInvalidate
					BT_ClientAreaInvalidateRect( cJanela  , (nDrop * nitemSubHeight) + nLineSeta - 1   , 0 , ;
						nColTamMenu , 16 , .t.  )
				End If

			End If

		Else
			yAviso( Hb_AnsitoOem("Opção Não Disponivel.") , .f. )
			lOk := .f.
		End If




	Else

		// Cima



		If !lHtp

			nScr1 -= nItemSubHeight
			nPonteiro--

			lHtb := .f.

			If lInvalidate
				BT_ClientAreaInvalidateRect(cJanela  , (nDrop * nitemSubHeight) + nLineSeta - 1   , 0 , ;
					nColTamMenu , 16 , .t.  )
			End If


			If (nPonteiro == nItens)
				lHtp := .t.

				If lInvalidate
					BT_ClientAreaInvalidateRect( cJanela  , ( (nDrop * nItemSubHeight) + nLineSeta +  16)   , 0 , ;
						nColTamMenu , 16 , .t.  )
				End If

			End If

		Else
			yAviso( Hb_AnsitoOem("Opção Não Disponivel.") , .f. )
			lOk := .f.
		End If

	End If



	If (lOk)
		_HMG_PRINTER_SETVSCROLLVALUE(   hWnd1  , nScr1 )		
	End If


Return

Function xTeclasMenu()

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	Local nContItens := 0
	Local nQt        := 0
	Local nRow       := 0
	Local nindice

	
	//If (nHWnd != GetProperty(   'Win_MenuPrincipal' , "HANDLE" ) )
	//	Return  
	//End If 



	If nMsg == WM_KEYDOWN

		
		If (lSubOpen)
			msginfo('ok2')
			//xKeySubMen( nMsg , nWParam )	
			Return 
		End If 



		If (nWParam == VK_ESCAPE)

			lModeTecla := .f. 			


			nMainSel := 0
			nClearSel := 0
			BT_ClientAreaInvalidateAll(   'Win_MenuPrincipal'  )

		End If 



		If nWParam = VK_RETURN

			
			If !lModeTecla
				yaviso("Modo Tecla não Ativado" , .f. )
				Return 
			End If 

			lTracking42 := .f.
			SendMessage( GetProperty(   'Win_MenuPrincipal' , "HANDLE" ) , WM_LBUTTONDOWN ,  90 ,0 )



		End If



		IF nWParam == VK_DOWN
			// msginfo('down')


			If !lModeTecla
				yaviso("Modo Tecla não Ativado" , .f. )
				Return 
			End If 


			If nMainSel < Len(aOpcoes)

				nMainSel++
				lTracking42 := .f.
				SendMessage( GetProperty(   'Win_MenuPrincipal' , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )

				SysWait(.1)


			Else
				MsgInfo('Hit Bottom!')
			End If


		End If



		IF (nWParam == VK_UP)

			If !lModeTecla
				yaviso("Modo Tecla não Ativado" , .f. )
				Return 
			End If 
			

			If nMainSel > 1

				nMainSel--
				lTracking42 := .f.
				SendMessage( GetProperty(   'Win_MenuPrincipal' , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )

				SysWait(.1)


			Else
				MsgInfo('Hit Top')
			End If



		End If



		IF nWParam == VK_TAB

			lModeTecla := !lModeTecla


			If (lModeTecla)
				nMainSel := 1
				lTracking42 := .f.
				SendMessage( GetProperty(   'Win_MenuPrincipal' , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )
				SysWait(.1)

				//msginfo('ok333k')
			Else 

				nMainSel := 0
				nClearSel := 0
				BT_ClientAreaInvalidateAll(   'Win_MenuPrincipal'  )


				//msginfo('okk')


			End If 	



		End If



	End If




Return





