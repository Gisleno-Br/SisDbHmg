#require "hbxpp"

//#include <hmg.ch>
#include <minigui.ch>


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

*//xMenuOp	

Static aOpz11 := {}
Static nItemx2 := 0
Static nItemZ1 := 1
Static cOpy2 := ''
Static nItDrop1 := 1
Static nHtDrop := 300

Static lHttb := .f.
Static lHttp := .t.

Static nAcumulador := 0

Static nIndexEventX := 0

Static nLinha1 := 0


Static l_Popup := .f.

Static nScrLin := 0

Static nLinhaAtual := 0



//Static nHandle1 := 0
//Static nHandle2 := 0



STATIC lTracking192 := .f.

Function xMenuOp( cParent , aOp1 , nTop , nLeft  , lPopUp  )

	Local lOk     := .f.
	Local nHeight := (Len(aOp1) * nItemSubHeight)+5

	Default lPopUp := .f.

	l_Popup := lPopUp

	aOpz11 := Aclone(aOp1)


	nItemx2 := 1

	nItemZ1 := 1

	cOpy2 := ''

	nAcumulador := 0


	If _isWindowDefined( 'Win_Menu1')
		_ShowWindow("Win_Menu1")
		SysWait(.1)
		Return
	End If



	*//Janela Efeito Sombra.
	If  (Len(aOpz11) > XMAXITEM)
		DEFINE WINDOW WinSombra1 AT nTop + 12 , nLeft+15 WIDTH nColTamMenu - 7 HEIGHT 330 TITLE 'Sombra1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra( ThisWindow.Name , nTop + 15 , nLeft+17  )
		END WINDOW
	Else
		//+3

		DEFINE WINDOW WinSombra1 AT nTop + 12 , nLeft+15 WIDTH nColTamMenu - 7 HEIGHT (Len(aOp1) * nItemSubHeight) - 2 TITLE 'Sombra1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra( ThisWindow.Name , nTop + 6 , nLeft+9  )
		END WINDOW


		//ON PAINT xSombra( ThisWindow.Name , nTop + 6 , nLeft+9  )



	End If



	BT_ClientAreaInvalidateAll(   'WinSombra1'  )




	DEFINE WINDOW Win_Menu1 AT nTop, nLeft+3 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300 + 4    ) TITLE 'Men1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR aCorSub1 VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  ) ;
		ON PAINT xPaintMenu( ThisWindow.Name , aOpz11 , nItemx2 , nItemZ1 , cOpy2 , 0 , 0 ,  .f. ,  .t. ,  ,  , .t. )
	END WINDOW



	*// Janelas com as Setas Navegação para baixo e cima.

	If  (Len(aOpz11) > XMAXITEM)
		DEFINE WINDOW Win_Scroll1 AT nTop+GetProperty('Win_Menu1' , 'Height')   , nLeft+3 WIDTH nColTamMenu  HEIGHT 32 TITLE 'T1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE CHILD PANEL PARENT &cParent NOSYSMENU NOCAPTION BACKCOLOR GRAY ;
			ON PAINT xPaintScrool( ThisWindow.Name )
		END WINDOW
	End If



	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventMenu1"  ) )  ) = 0
		InstallEventHandler( "EventMenu1" )
		//nIndexEventX := EventCreate (  { ||   xKeySubMen()   }    )

		nIndexEventX := 20050

		CREATE EVENT PROCNAME xKeySubMen() STOREINDEX nIndexEventX

		nIndexEventX := Len(_HMG_EventData)

	End If


	ShowScrollBar( GetFormHandle( 'Win_Menu1' ), 0, .F. )
	ShowScrollBar( GetFormHandle( 'Win_Menu1' ), 1, .F. )


	_ShowWindow("WinSombra1")

	//sysWait(.1)


	_ShowWindow("Win_Menu1")
	BT_ClientAreaInvalidateAll(   'Win_Menu1'  )

	If  (Len(aOpz11) > XMAXITEM) .And. (_isWindowDefined(  'Win_Scroll1'   ))

		_ShowWindow( 'Win_Scroll1' )
		BT_ClientAreaInvalidateAll(   'Win_Scroll1'  )


	End If



Return lOk




Function xFechaMen()

	Local nI1 := 0

	Local nHandle1  := DoFindWin("Men1")
	Local nHandle2  := DoFindWin("T1")
	Local nHandle3  := DoFindWin("Sombra1")


	If (nHandle1 > 0)


		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )

		DoEvents()
		DoEvents()

		SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )

		DoEvents()


		If (nHandle2 > 0)

			SendMessage( nHandle2, WM_SYSCOMMAND, SC_CLOSE , 0 )

			DoEvents()
			DoEvents()

			SendMessage( nHandle2, WM_SYSCOMMAND, WM_DESTROY , 0 )

			DoEvents()

		End If


		If (nHandle3 > 0)

			SendMessage( nHandle3, WM_SYSCOMMAND, SC_CLOSE , 0 )
			DoEvents()
			DoEvents()

			SendMessage( nHandle3, WM_SYSCOMMAND, WM_DESTROY , 0 )
			DoEvents()

		End If


		If !RemoveHandler( "EventMenu1"  )
			Msginfo("Erro ao remover Handle Event.")
		End If

		If !xDelEvent(nIndexEventX)
			msginfo("Erro ao remover Handle Event 22 .")
		End If



	End If

//DoMethod('Main' , 'SetFocus')


Return



Function xDelEvent(   nIndex )

	Local nInd := Ascan(  _HMG_EventData , { |a|  a[HMG_LEN(_HMG_EventData[1]) ] == nIndex    })
	Local lOk  := .f.
	Local nTam := Len( _HMG_EventData   )

	If nIndex <= Len(   _HMG_EventData )
		Adel(   _HMG_EventData , nIndex  )
		Asize(  _HMG_EventData , nTam - 1  )
		lOk := .t.
	End If


Return lOk




Function EventMenu1( nHWnd, nMsg, nWParam, nLParam )

	Local cOpcao := ''
	Local nCol   := 0
	Local nRow   := 0
	Local aR1
	Local nInd2  := 0
	Local cTp1   := ''
	Local nRow1 := 0
	Local lCima := .t.



	If !_isWindowDefined( 'Win_Menu1')
		Return
	End If


	If ( _isWindowDefined( 'Win_Scroll1') ) .And.  (nHWnd == GetProperty(  'Win_Scroll1' , "HANDLE" ))


		If ( nMsg == WM_MOUSEMOVE )

			GetCursorPos (@nCol, @nRow)

			aR1 := GetPos_ScreenToClient(   GetFormHandle(  'Win_Scroll1'  )  , nRow, nCol )

			lCima := .t.

			If (ar1[1]  < 16)
				lCima := .f.
			End If


			If lCima

				If !lHttp
					SetWindowCursor( nHWnd , CURSORHAND  )
				Else
					SetWindowCursor( nHWnd , 'NAOPODE' )
				End If

			Else

				If !lHttb
					SetWindowCursor( nHWnd , CURSORHAND  )
				Else
					SetWindowCursor( nHWnd , 'NAOPODE' )
				End If

			End If


		End If


		If (nMsg == WM_LBUTTONDOWN)

			GetCursorPos (@nCol, @nRow)

			aR1 := GetPos_ScreenToClient(   GetFormHandle(  'Win_Scroll1'  )  , nRow, nCol )

			lCima := .t.

			If (ar1[1]  < 16)
				lCima := .f.
			End If



			If (nLinha1 == 0)
				nLinha1 := XMAXITEM
			End If



			If lCima
				ScrollMenu( 1 , GetProperty(  'Win_Menu1' , "HANDLE" ) , @nAcumulado , @nLinha1 ,   Len(aOpz11)  , @lHttp , @lHttb , 1 , 'Win_Menu1' , 300 , .f.  )
			Else
				ScrollMenu( 2 , GetProperty(  'Win_Menu1' , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @lHttp , @lHttb , 1 , 'Win_Menu1' , 300 , .f. )
			End if

			Bt_ClientAreaInvalidateAll( 'Win_Scroll1' )


		End If
	End If




	If (nHWnd == GetProperty(  'Win_Menu1' , "HANDLE" ))

		If ( nMsg == WM_MOUSELEAVE )  .and. (   lTracking192  )

			nItemx2 := 0
			nItemZ1 := 0
			BT_ClientAreaInvalidateAll( nHWnd  )
			SetWindowCursor( nHWnd , IDC_ARROW )
			xHideHint()


		End If



		If (nMsg == VK_LEFT)

			If lPopUp

				//msginfo('popuip')
			End If

		End If


		If (nMsg == WM_LBUTTONDOWN)



			If (nItemx2 <= Len(aOpz11))

				If !aOpz11[nItemx2][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					yaviso("Opção Indisponivel." , .f. )
					Return
				End If

				If (aOpz11[nItemx2][4] != Nil )
					Eval( aOpz11[nItemx2][4]   )
					Return
				End If


			End If


		End If



		If ( nMsg == WM_MOUSEMOVE )
			//.And. (!lTracking42)



			If (nItemx2 > 0) .AND. (nWParam != 90)
				If (nItemx2 = xOpSelPos( 'Win_Menu1' , 0 , Len(aOpz11) , 0 )	)
					Return
				End If
			End If


			If (nWParam != 90)
				nItemx2 := xOpSelPos( 'Win_Menu1', 0 , Len(aOpz11) , 0 )
			End If


			nRow1 := -(GetProperty( 'Win_Menu1' , "VscrollBar" , "Value"))


			If (nItemx2 <= Len(aOpz11))
				If !aOpz11[nItemx2][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					xHideHint()
					Return
				End If
			End If


			If (nWParam != 90)
				SetWindowCursor( nHWnd , CURSORHAND  )
			End If


			If nItemZ1 > 0
				xLimpSub( 'Win_Menu1', @nItemZ1 ,  @nItemx2 , 0 )
			End If


			If nItemx2 > 0
				nItemZ1 := nItemx2
			Else
				Return
			End If


			If nItemx2 > Len(aOpz11)
				xHideHint()
				Return
			End If


			If nItemx2 > 0
				BT_ClientAreaInvalidateRect( 'Win_Menu1',  nRow1  +  ( ( nItemx2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
			End If



			If !Empty(    Alltrim(  aOpz11[nItemx2][2]  )   ) .AND. (nWParam != 90)

				cTp1 :=	  Alltrim( 	 aOpz11[nItemx2][2]  )

				nRow1 := 0


				GetCursorPos (@nCol, @nRow1)

				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow1  , GetProperty('Win_Menu1', 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow1 + 15   , GetProperty('Win_Menu1', 'Col') + GetProperty('Win_Menu1', 'Width') + 3 + 5 )
					DoFindWin('xHint')
				End If


				xDispUpTam(cTp1 )


			Else
				xHideHint()
			End If


			If (nWParam != 90)
				lTracking192 := TrackMouseEvent(nHWnd)
			Else
				lTracking192 := .f.
			End If


		End If


	End If


Return

Function xPaintScrool( cForm )

	Local hBit10
	Local hBit11

	Local hDc2

	Local BTstruct2


	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	
	BT_DrawGradientFillHorizontal  (hDC2,  0  , 0 ,  nColTamMenu , 32   , {89,89,89} , {89,89,89})


	If !lHttb
		hBit10 := BT_BitmapLoadFile ( 'SETAB2' )
		//SETAB2
	Else
		hBit10 := BT_BitmapLoadFile ('SETAB2D')
	End If



	If !lHttp
		hBit11 := BT_BitmapLoadFile ( 'SETAC2' )
	Else
		hBit11 := BT_BitmapLoadFile ( 'SETAC2D'  )
		//SETAC2D
	End If


	BT_DrawBitmap (hDC2,  0  ,  0   , nColTamMenu , 15 , 3 , hBit10)
	BT_DrawBitmap (hDC2, 16 ,   0   , nColTamMenu  , 16 , 3 , hBit11)


	BT_BitmapRelease ( hBit10 )
	BT_BitmapRelease ( hBit11 )


	BT_DeleteDC (BTstruct2 )

Return

Function xKeySubMen( nMsg1 , nwParam1 , cJanela  )

	LOCAL  nHWnd   := EventHWND()
	//EventWPARAM()
	Local nContItens := 0
	Local nQt        := 0
	Local nRow       := 0
	Local nindice
	Local nMsg
	Local nWParam

	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)


	DEFAULT nMsg1    := EventMSG()
	DEFAULT nWParam1 := EventWPARAM()

	DEFAULT cJanela := 'Win_Menu1'


	nWParam := nwParam1
	nMsg    := nMsg1


	If nMsg == WM_KEYDOWN



		If nWParam = VK_RETURN

			lTracking42 := .f.
			SendMessage( GetProperty(   cJanela , "HANDLE" ) , WM_LBUTTONDOWN ,  90 ,0 )


		End If



		IF nWParam == VK_DOWN

			xHideHint()
			If nItemx2 < Len(aOpz11)

				nItemx2++
				lTracking192 := .f.


				If (nItemx2 > nMaxItem)

					If (nLinhaAtual == 0)
						nLinhaAtual := Int(nTamSubMenuConsulta / nItemSubHeight)
					End If


					ScrollMenu( 2 , GetProperty( cJanela , 'Handle' ) , @nScrLin , @nLinhaAtual , Len(aOpz11) , @lHttp , @lHttb , 1 , ;
						'Win_Menu1' , GetProperty( cJanela , 'Height' )  )


					BT_ClientAreaInvalidateAll( 'Win_Scroll1' )

				Else
					SendMessage( GetProperty(   cJanela , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )

				End If



			Else
				//MsgInfo('Hit Bottom!')
			End If


		End If





		IF (nWParam == VK_UP)
			xHideHint()

			If nItemx2 > 1

				nItemx2--
				lTracking192 := .f.


				If nItemX2 >= nMaxItem

					ScrollMenu( 1 , GetProperty( cJanela , 'Handle' ) , @nScrLin , @nLinhaAtual , Len(aOpz11) , @lHttp , @lHttb , 1 , ;
						cJanela , GetProperty(cJanela , 'Height' )  )


					If _IsWindowDefined('Win_Scroll1')
						BT_ClientAreaInvalidateAll( 'Win_Scroll1' )
					End If

				Else

					SendMessage( GetProperty(   cJanela , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )

				End If

				//SysWait(.1)


			Else
			//	MsgInfo('Hit Top')
			End If



		End If

		/*

		IF nWParam == VK_TAB

			nMainSel := 1
			lTracking42 := .f.
			SendMessage( GetProperty(   'Win_Menu1' , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )
			SysWait(.1)


		End If
		*/



	End If




Return



