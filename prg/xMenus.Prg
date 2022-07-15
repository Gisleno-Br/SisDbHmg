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

Static l_Httb := .f.
Static l_Httt := .t.

Static nAcumulador := 0

Static nIndexEventX := 0

Static nLinha1 := 0


Static l_Popup := .f.

Static nScrLin := 0

Static nLinhaAtual := 0

Static nSetaSel := 0

Static zBitMap1 



//Static nHandle1 := 0
//Static nHandle2 := 0



STATIC lTracking192 := .f.

Function xMenuOp( cParent , aOp1 , nTop , nLeft  , lPopUp  )

	Local lOk     := .f.
	Local nHeight := (Len(aOp1) * nItemSubHeight)+5
	//Local zBitMap1
	Local i 

	Default lPopUp := .f.

	l_Popup := lPopUp
	aOpz11 := Aclone(aOp1)
	nItemx2 := 1
	nItemZ1 := 1
	cOpy2 := ''
	nAcumulador := 0

	aCorSub2 := WHITE



    zBitMap1 := BT_BitmapCaptureDesktop ( nTop + 12 , nLeft + 15 ,  nColTamMenu - 7 , 340  )



	*//Janela Efeito Sombra.
	If  (Len(aOpz11) > XMAXITEM)
		
		DEFINE WINDOW WinSombra1 AT nTop + 12 , nLeft+17 WIDTH nColTamMenu - 7 HEIGHT 295+40 TITLE 'Sombra1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra( ThisWindow.Name , nTop + 12 , nLeft+17 , zBitMap1 )
		END WINDOW
	Else			

		zBitMap1 := BT_BitmapCaptureDesktop ( nTop + 12 , nLeft + 15 ,  nColTamMenu - 7 , (Len(aOp1) * nItemSubHeight) - 2   )

		DEFINE WINDOW WinSombra1 AT nTop + 12 , nLeft+15 WIDTH nColTamMenu - 7 HEIGHT (Len(aOp1) * nItemSubHeight) - 2 TITLE 'Sombra1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra( ThisWindow.Name , nTop + 6 , nLeft+9 , Nil  ) //zBitMap1
		END WINDOW

	End If


	BT_ClientAreaInvalidateAll(   'WinSombra1'  )

	
	DEFINE WINDOW Win_Menu1 AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300    ) TITLE 'Men1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR aCorSub2 VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  ) ;
		ON PAINT xPaintMenu( ThisWindow.Name , aOpz11 , nItemx2 , nItemZ1 , cOpy2 , 0 , 0 ,  Len(aOpz11) > XMAXITEM     ,  .t. ,  ,  , .t. )
	END WINDOW


	*// Janelas com as Setas Navegação para baixo e cima.

	

	If  (Len(aOpz11) > XMAXITEM)	
		DEFINE WINDOW Win_Scroll1 AT nTop+GetProperty('Win_Menu1' , 'Height')   , nLeft+1 WIDTH nColTamMenu  HEIGHT 40 TITLE 'TShadow1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE CHILD PANEL PARENT &cParent NOSYSMENU NOCAPTION BACKCOLOR GRAY ;
			ON PAINT xPaintScrool( ThisWindow.Name )
		END WINDOW
	End If

	HMG_ChangeWindowStyle(  GetProperty(  'Win_Menu1' , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  'Win_Scroll1' , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )




	If (GetFormIndex ( "Win_Menu1" )  ==  0)		
		Return 
	End If 	


	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventMenu1"  ) )  ) = 0

		InstallEventHandler( "EventMenu1" )
		nIndexEventX := 20050
		CREATE EVENT PROCNAME xKeySubMen() STOREINDEX nIndexEventX
		nIndexEventX := Len(_HMG_EventData)

	End If


	ShowScrollBar( GetFormHandle( 'Win_Menu1' ), 0, .F. )
	ShowScrollBar( GetFormHandle( 'Win_Menu1' ), 1, .F. )


	_ShowWindow("WinSombra1")

	


	If (GetFormIndex ( "Win_Menu1" )  ==  0)	
		Return 
	End If 	



	_ShowWindow("Win_Menu1")
	BT_ClientAreaInvalidateAll(   'Win_Menu1'  )

	
	BringToTop(GetFormHandle( 'Win_Menu1' ))	

	BringToTop(GetFormHandle( 'Win_Scroll1' ))	


	If  (Len(aOpz11) > XMAXITEM) .And. (_isWindowDefined(  'Win_Scroll1'   ))

		_ShowWindow( 'Win_Scroll1' )
		BT_ClientAreaInvalidateAll(   'Win_Scroll1'  )


	End If


Return lOk



Function xFechaSub1(cTitulo)

 	Local lOk := .f. 
	Local nHandle1  := DoFindWin(cTitulo)

	If (nHandle1 > 0)

		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )
		DoEvents()
		//DoEvents()

		SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )
		DoEvents()

	//	msginfo('Fechou')

		lOk := .t. 

    End If 		




REturn lOk 


Function xCloseDlg( nHnd1 )

	DestroyWindow(  nHnd1 )
	SendMessage( nHnd1, WM_SYSCOMMAND, SC_CLOSE , 0 )	
	SendMessage( nHnd1, WM_SYSCOMMAND, WM_DESTROY , 0 )
	DoEvents()


Return 

Function xFechaMen()

	Local nI1 := 0

	Local nHandle1  := GetFormHandle("Win_Menu1")	
	Local nHandle2  := GetFormHandle("Win_Scroll1")	
	Local nHandle3  := GetFormHandle("WinSombra1")

	
	//DoEvents()

	
	If (nHandle1 > 0)

		BT_BitmapRelease(zBitMap1)
		xCloseDlg( nHandle1 )	


		If (nHandle2 > 0)
			xCloseDlg( nHandle2 )
		End If

		If (nHandle3 > 0)		
			xCloseDlg( nHandle3 )
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
	Local cFormName := ''



	If !_isWindowDefined( 'Win_Menu1')
		Return
	End If

		//If ( nMsg == WM_MOUSEMOVE )
			//.And. (!lTracking42)
			//GetFormNameByHandle (nHWnd, @cFormName)
		//	msginfo(cFormName)
		//End If 


	If ( _isWindowDefined( 'Win_Scroll1') ) .And.  (nHWnd == GetProperty(  'Win_Scroll1' , "HANDLE" ))


		If ( nMsg == WM_MOUSEMOVE )

			//nSetaSel := 0
			//Bt_ClientAreaInvalidateAll( 'Win_Scroll1' )

			yLimpSetas()
			DoEvents()


			//msginfo('ok2')


			GetCursorPos (@nCol, @nRow)

			aR1 := GetPos_ScreenToClient(   GetFormHandle(  'Win_Scroll1'  )  , nRow, nCol )
			lCima := .t.

			//Msginfo('2')			

			If (ar1[1]  < 16)				
				lCima := .f.
			End If


			If lCima
				nSetaSel := 2
				If !l_Httt
					SetWindowCursor( nHWnd , CURSORHAND  )
				Else
					SetWindowCursor( nHWnd , 'NAOPODE' )
				End If

			Else

				nSetaSel := 1
				If !l_Httb
					SetWindowCursor( nHWnd , CURSORHAND  )
				Else
					SetWindowCursor( nHWnd , 'NAOPODE' )
				End If
			End If

			Bt_ClientAreaInvalidateAll( 'Win_Scroll1' )
			DoEvents()


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

			//l_Httb

			If lCima
				ScrollMenu( 1 , GetProperty(  'Win_Menu1' , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @l_Httt , @l_Httb , 1 , 'Win_Menu1' , 300 , .f.  )
			Else
				ScrollMenu( 2 , GetProperty(  'Win_Menu1' , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @l_Httt , @l_Httb , 1 , 'Win_Menu1' , 300 , .f. )
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

				//msginfo('ok22')


			End If


		End If




		If ( nMsg == WM_MOUSEMOVE ) .And. ( _isWindowDefined('Win_Menu1') )
		
			If (nItemx2 > 0) .AND. (nWParam != 90)
				If (nItemx2 = xOpSelPos( 'Win_Menu1' , 0 , Len(aOpz11) , 0 )	)						
					Return
				End If
			End If



			If (nWParam != 90)
				nItemx2 := xOpSelPos( 'Win_Menu1', 0 , Len(aOpz11) , 0 )
			End If

			//DoEvents()	


			nRow1 := -(GetProperty( 'Win_Menu1' , "VscrollBar" , "Value"))

		
			If (nItemx2 > 0) .And. (nItemx2 <= Len(aOpz11))
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

			yLimpSetas()


			If nItemx2 > 0
				BT_ClientAreaInvalidateRect( 'Win_Menu1',  nRow1  +  ( ( nItemx2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
			End If


			If (nItemx2 > 0) .And.  (nItemx2 <= Len(  aOpz11 )) .And. ( !Empty( Alltrim(  aOpz11[nItemx2][2]  )   )) .AND. (nWParam != 90)

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

	Local bBmp1 := xBmpToTrans( 'SETAB1', aMenuBarCor , 16,16 )
	Local bBmp2 := xBmpToTrans( 'SETAC1', aMenuBarCor , 16,16 )


	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)



	Local bBmp3 := xBmpToTrans( 'SETAB1', aCorSub2 , 16,16 )
	Local bBmp4 := xBmpToTrans( 'SETAC1', aCorSub2 , 16,16 )


	Local bBmp5 := xBmpToTrans( 'SETAB1D', aCorSub2 , 16,16 )
	Local bBmp6 := xBmpToTrans( 'SETAC1D', aCorSub2 , 16,16 )


	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )
	

	If nSetaSel == 0
		BT_DrawGradientFillHorizontal  (hDC2,  0  , 0 ,  nColTamMenu , (nItemSubHeight * 2)   , aCorSub2 , aCorSub2)
		

		DraVertH( hDc2 , 1   , nColTamMenu )

		BT_DrawBitmap ( hDC2,  2  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   ,  Iif(!l_Httb , bBmp3 ,  bBmp5 ) )
		BT_DrawBitmap ( hDC2,  20  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , Iif(!l_Httt , bBmp4 ,  bBmp6 ) )
		
	Else

		DraVertH( hDc2 , 1   , nColTamMenu )

		If nSetaSel == 1


			If !l_Httb			
				BT_DrawGradientFillVertical ( hDC2 ,  0  , 0  ,    nColTamMenu      ,    ( nItemSubHeight)    , aMenuBarCor , aMenuBarCor  )
				BT_DrawBitmap ( hDC2,  2   , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , bBmp1 )
			Else 
				BT_DrawGradientFillHorizontal  (hDC2,  2  , 0 ,  nColTamMenu , (nItemSubHeight)   , aCorSub2 , aCorSub2)
				BT_DrawBitmap ( hDC2,  2   , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , bBmp5 )
			End If 

			If !l_Httt
				BT_DrawBitmap ( hDC2,  20  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   ,   bBmp4 )
			End If 

		End If


		If nSetaSel == 2

			If !l_Httt
				BT_DrawGradientFillVertical ( hDC2 ,  20 , 0  ,    nColTamMenu      ,    ( nItemSubHeight)    , aMenuBarCor , aMenuBarCor  )
				BT_DrawBitmap ( hDC2,  20   , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , bBmp2 )
			Else 
				BT_DrawGradientFillHorizontal  (hDC2,  20  , 0 ,  nColTamMenu , (nItemSubHeight)   , aCorSub2 , aCorSub2)
				BT_DrawBitmap ( hDC2,  20   , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , bBmp6 )
			End If 

			If !l_Httb
				BT_DrawBitmap ( hDC2,  2   , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , bBmp3 )
			End If 

		End If

		//DoEvents()

	End If


	//DoEvents()

	BT_BitmapRelease ( bBmp1 )
	BT_BitmapRelease ( bBmp2 )

	BT_BitmapRelease ( bBmp3 )
	BT_BitmapRelease ( bBmp4 )


	BT_BitmapRelease ( bBmp5 )
	BT_BitmapRelease ( bBmp6 )

	DraVertL( hDC2 , 0 , Height , .t.)
	DraVertL( hDC2 , Width - 1 , Height + 1 , .t.)

	DraVertH( hDc2 , 0   , Width , .t.  )

	DraVertH( hDc2 , Height - 1   , Width , .t.  )




	BT_DeleteDC (BTstruct2 )

Return



Static Function yLimpSetas()

	If _isWindowDefined('Win_Scroll1')
		nSetaSel := 0
		BT_ClientAreaInvalidateAll( 'Win_Scroll1' )
		//DoEvents()	
	End If 

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

					ScrollMenu( 2 , GetProperty( cJanela , 'Handle' ) , @nScrLin , @nLinhaAtual , Len(aOpz11) , @l_Httt , @l_Httb , 1 , ;
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

					ScrollMenu( 1 , GetProperty( cJanela , 'Handle' ) , @nScrLin , @nLinhaAtual , Len(aOpz11) , @l_Httt , @l_Httb , 1 , ;
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

	End If




Return



Function RemoveHandler( cProcName )

	Local nind := Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( cProcName  ) )  )
	Local nTam := Len(_HMG_SYSDATA [ 60 ])

	If (nInd > 0)
		Adel(_HMG_SYSDATA [ 60 ] , nInd)
		Asize( _HMG_SYSDATA [ 60 ] , nTam - 1 )
	End If

Return (nInd > 0)




