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

#define XQUEBRA Chr(13)+Chr(10)

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

Static lEnabled2 := .t.

Static lTracking285 := .f.
Static zBitMap0
Static zBitMap5
Static zBitMap6


Static cSubMenuName := ''
Static cNSombra1 := ''
Static cNSombra2 := ''
Static cNSombra3 := ''

Static cSubMenuSombra := ''

Static cMenuScroll := ''
Static cScrollSombra := ''


STATIC lTracking192 := .f.

Function xMenuOp( cName , cParent , aOp1 , nTop , nLeft  ,  lPopUp  ,  aMatriz , nItemSel  ,  lEnabled )

	Local lOk     := .f.
	Local nHeight := (Len(aOp1) * nItemSubHeight)+5
	//Local zBitMap1
	Local i
	Local nItemz1 := 0
	Local nCol2
	Local nRow2

	Default lPopUp := .f.
	Default lEnabled := .t.

	cSubMenuName := cName 
	cNSombra1 := cName + '_Sombra1'
	cNSombra2 := cName + '_Sombra2'
	cNSombra3 := cName + '_Sombra3'

	cSubMenuSombra := 'wSombra_' + Left(cSubMenuName,5)


	cMenuScroll   := 'wScroll_' + Left(cSubMenuName,5)
	cScrollSombra := 'wSombra_' + cMenuScroll


	l_Popup := lPopUp
	aOpz11 := Aclone(aOp1)
	nItemx2 := 1
	nItemZ1 := 1
	cOpy2 := ''
	nAcumulador := 0

	lEnabled2 := lEnabled

	

	aCorSub2 := WHITE


	If nItemSel > 0


		BT_DELAY_EXECUTION_WITH_DOEVENTS(50)
		//hb_releaseCPU()

		nItemz1 := xOpSelPos( 'JanMenuSub', 0 , Len(aMatriz) , 0 )


		If (nItemZ1 != nItemSel) .or. ( _IsWindowDefined('Win_Menu1'))
			DoEvents()
			hb_releaseCPU()			
			Return
		End If

		DoEvents()

	End If

	nCol2 := (nLeft+1)+nColTamMenu - 1
	//DoEvents()

	//msginfo('Entrou')



	*//Janela Efeito Sombra.
	If !_isWindowDefined(cNSombra1)

		nH1 := If(Len(aOpz11) > XMAXITEM , 325 , (Len(aOp1) * nItemSubHeight)  )

		zBitMap0 := BT_BitmapCaptureClientArea(  cParent ,   nTop + 15  ,  nCol2 + 1 ,  4  , nH1  )
		zBitMap5 := BT_BitmapCaptureClientArea ( cParent , (nTop + 15) + (nH1)    ,  nLeft+6   ,  nColTamMenu - 5  , 4  )

		zBitMap6 := BT_BitmapCaptureClientArea ( cParent , nTop + 15 + nH1  , nCol2+1  ,  4 , 4  )


		DEFINE WINDOW &cNSombra1 AT nTop + 15 , nCol2+1 WIDTH 4 HEIGHT nH1 TITLE 'Sombra1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombraVert( ThisWindow.Name , 0  , 0 , zBitMap0  )
		END WINDOW

		If !_isWindowDefined(cNSombra2)
			DEFINE WINDOW &cNSombra2 AT nTop + 15 + nH1 , nLeft+6  WIDTH nColTamMenu - 5 HEIGHT 4 TITLE 'Sombra2' ;
				NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
				ON PAINT xSombraHor( ThisWindow.Name , 0  , 0 , zBitMap5  )
			END WINDOW
		End If

		If !_isWindowDefined(cNSombra3)
			DEFINE WINDOW &cNSombra3 AT  nTop + 15 + nH1  , nCol2+1  WIDTH 4 HEIGHT 4 TITLE 'Sombra3' ;
				NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR RED VIRTUAL HEIGHT Nil ;
				ON PAINT xSombra3( ThisWindow.Name , zBitMap6 )
			END WINDOW
		End If

	End If


	BT_ClientAreaInvalidateAll(   cNSombra1 )
	_ShowWindow( cNSombra1 )

	DEFINE WINDOW &cSubMenuName AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300    ) TITLE 'Men1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR aCorSub2 VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  ) ;
		ON PAINT xPaintMenu( ThisWindow.Name , aOpz11 , nItemx2 , nItemZ1 , cOpy2 , 0 , 0 ,  Len(aOpz11) > XMAXITEM     ,  .t. ,  ,  , .t. )
	END WINDOW



	DEFINE WINDOW &cSubMenuSombra AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300    ) TITLE 'MenSombra1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  )
	END WINDOW


		*// Janelas com as Setas Navegação para baixo e cima.


	If  (Len(aOpz11) > XMAXITEM)
		DEFINE WINDOW &cMenuScroll AT nTop+GetProperty( cSubMenuName , 'Height')   , nLeft+1 WIDTH nColTamMenu  HEIGHT 40 TITLE 'TShadow1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE CHILD PANEL PARENT &cParent NOSYSMENU NOCAPTION BACKCOLOR GRAY ;
			ON PAINT xPaintScrool( ThisWindow.Name )
		END WINDOW


		DEFINE WINDOW &cScrollSombra AT nTop+GetProperty( cSubMenuName , 'Height')   , nLeft+1 WIDTH nColTamMenu  HEIGHT 40 TITLE 'TShadow2' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE CHILD PANEL PARENT &cParent NOSYSMENU NOCAPTION BACKCOLOR BLACK
		END WINDOW


		SET WINDOW &cSubMenuName TRANSPARENT   TO Iif(!lEnabled2 , 167 , 0)
		SET WINDOW &cMenuScroll TRANSPARENT TO Iif(!lEnabled2 , 167 , 0)


	End If

	//DoEvents()

	HMG_ChangeWindowStyle(  GetProperty(  cSubMenuName , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cMenuScroll  , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	HMG_ChangeWindowStyle(  GetProperty(  cScrollSombra , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	HMG_ChangeWindowStyle(  GetProperty(  cSubMenuSombra , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )


	HMG_ChangeWindowStyle(  GetProperty(  cNSombra1 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra2 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	HMG_ChangeWindowStyle(  GetProperty(  cNSombra3 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )


	ShowScrollBar( GetFormHandle( cScrollSombra), 0, .F. )
	ShowScrollBar( GetFormHandle( cScrollSombra ), 1, .F. )

	ShowScrollBar( GetFormHandle( cSubMenuSombra ), 0, .F. )
	ShowScrollBar( GetFormHandle( cSubMenuSombra ), 1, .F. )

	//DoEvents()




	If (GetFormIndex ( cSubMenuName )  ==  0)
		Return
	End If


	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventMenu1"  ) )  ) = 0

		InstallEventHandler( "EventMenu1" )
		nIndexEventX := 20050
		CREATE EVENT PROCNAME xKeySubMen()  STOREINDEX nIndexEventX
		nIndexEventX := Len(_HMG_EventData)

		//HWND GetFormHandle( 'Win_MenuSombra' )

	End If



	ShowScrollBar( GetFormHandle( cSubMenuName ), 0, .F. )
	ShowScrollBar( GetFormHandle( cSubMenuName ), 1, .F. )



	If (GetFormIndex ( cMenuScroll )  ==  0)
	    Return
	End If


	_ShowWindow( cMenuScroll )




	If (GetFormIndex ( cSubMenuName )  ==  0)
		Return
	End If



	// msginfo('ko2')



	BringToTop(GetFormHandle( cSubMenuName ))
	BringToTop(GetFormHandle( cMenuScroll))
	BringToTop(GetFormHandle( cScrollSombra))
	BringToTop(GetFormHandle(  cSubMenuSombra ))


	If  (Len(aOpz11) > XMAXITEM) .And. (_isWindowDefined( cMenuScroll   ))


		_ShowWindow( cScrollSombra )
		_ShowWindow( cMenuScroll )


		//DoEvents()
	//	BT_ClientAreaInvalidateAll(  cMenuScroll  )

		//yDCScrool1()
		////DoEvents()


	End If


	

	If (GetFormIndex ( cNSombra2 )  ==  0)
		Return
	End If

	BT_ClientAreaInvalidateAll(   cNSombra2  )
	_ShowWindow( cNSombra2 )

	//DoEvents()



	BT_ClientAreaInvalidateAll(   cNSombra3  )
	_ShowWindow( cNSombra3 )

	//DoEvents()



	_ShowWindow( cSubMenuSombra)

	//DoEvents()
	xAtu_Men1( .f. )


	//DoEvents()

	


Return lOk

Function xCheckJan(  cJanela )

	Local nCol1 , nRow1 
	Local nHWnd2 

    GetCursorPos (@nCol1, @nRow1)
	DoEvents()
	nHWnd2 := WindowFromPoint (nCol1, nRow1)

Return (GetFormHandle(cJanela) == nHWnd2)

Function xAtu_Men1( lVerifica )

	Local nCol1

	Local nRow1 

	DEFAULT lVerifica := .t. 


	If (GetFormIndex ( cSubMenuName )  ==  0)
		Return
	End If

	_ShowWindow(cSubMenuName)

	If (GetFormIndex ( cSubMenuSombra)  ==  0)
		Return
	End If

	DoEvents()

	_ShowWindow( cSubMenuSombra )

	DoEvents()

	BT_ClientAreaInvalidateAll(   cSubMenuName  )
	DoEvents()

	If lVerifica
		If (!xCheckJan(  cSubMenuSombra )	) .And. ( !xCheckJan(  cScrollSombra )	  )    
			Return 
		End If 


		If !_IsWindowDefined( cScrollSombra )
			REturn 
		End If 
	End If 


	yDCMenu11_()


	DoEvents()
	BT_ClientAreaInvalidateAll(   cMenuScroll  )

	yDCScrool1()
	DoEvents()


	BT_ClientAreaInvalidateAll(   cNSombra1 )
	_ShowWindow( cNSombra1 )

	DoEvents()

	BT_ClientAreaInvalidateAll( cNSombra2 )
	_ShowWindow(cNSombra2 )

	DoEvents()


	BT_ClientAreaInvalidateAll(   cNSombra3  )
	_ShowWindow( cNSombra3 )

	DoEvents()


Return

Function yDCMenu11_()

	Local Width1  := BT_ClientAreaWidth  ( cSubMenuName)
	Local Height1 := BT_ClientAreaHeight (cSubMenuName)

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2 , BTstruct3

	Local nTypeText    := BT_TEXT_TRANSPARENT
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT



	//Local Width2  := GetProperty('Win_ScrolSombra' , 'Width' )
	//Local Height2 := GetProperty('Win_ScrolSombra' , 'Height' )

	hDC1 = BT_CreateDC (cSubMenuName , BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cSubMenuSombra ,BT_HDC_ALLCLIENTAREA, @BTstruct2)




	If !lEnabled2
		BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width1, Height1, 156 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Else
		BT_DrawDCtoDC (hDC2, 0, 0, Width1, Height1, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	End If


 /*
	hBitMap2 := BT_BitmapCreateNew (Width1  , Height1 , WHITE )
	hDC3 := BT_CreateDC (hBitMap2 , BT_HDC_BITMAP, @BTstruct3 )
	BT_DrawDCtoDC (hDC3, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Bt_BitmapSaveFile(  hBitMap2 , 'Menu11sombra.bmp'  )
	*/




	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)

	//BT_ClientAreaInvalidateAll ('Win_ScrolSombra')

	//DoEvents()

Return




Function yDCScrool1()

	Local Width1  := BT_ClientAreaWidth  (cMenuScroll)
	Local Height1 := BT_ClientAreaHeight (cMenuScroll)

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2 , BTstruct3

	Local nTypeText    := BT_TEXT_TRANSPARENT
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT



	Local Width2  := GetProperty( cScrollSombra , 'Width' )
	Local Height2 := GetProperty( cScrollSombra , 'Height' )

	hDC1 = BT_CreateDC (cMenuScroll, BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cScrollSombra, BT_HDC_ALLCLIENTAREA, @BTstruct2)




	If !lEnabled2
		BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width1, Height1, 156 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Else
		BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	End If

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)


Return




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

	Local nHandle1  := GetFormHandle(cSubMenuName)
	Local nHandle2  := GetFormHandle(cMenuScroll)

	Local nHandle3  := GetFormHandle(cSubMenuSombra)
	//Local nHandle5  := GetFormHandle("Win_Scroll1")
	Local nHandle4  := GetFormHandle(cScrollSombra)

	Local nHandle5  := GetFormHandle(cNSombra1)
	Local nHandle6  := GetFormHandle(cNSombra2)
	Local nHandle7  := GetFormHandle(cNSombra3)

	BT_BitmapRelease(zBitMap0)
	BT_BitmapRelease(zBitMap5)
	BT_BitmapRelease(zBitMap6)


	If (nHandle1 > 0)

		BT_BitmapRelease(zBitMap1)
		xCloseDlg( nHandle1 )


		If (nHandle2 > 0)
			xCloseDlg( nHandle2 )
		End If

		If (nHandle3 > 0)
			xCloseDlg( nHandle3 )
		End If

		If (nHandle4 > 0)
			xCloseDlg( nHandle4 )
		End If

		If (nHandle5 > 0)
			xCloseDlg( nHandle5 )
		End If

		If (nHandle6 > 0)
			xCloseDlg( nHandle6 )
		End If

		If (nHandle7 > 0)
			xCloseDlg( nHandle7 )
		End If


		//If (nHandle8 > 0)
		//	xCloseDlg( nHandle8 )
		//End If

		If !RemoveHandler( "EventMenu1"  )
			Msginfo("Erro ao remover Handle Event.")
		End If

		If !xDelEvent(nIndexEventX)
			msginfo("Erro ao remover Handle Event 22 .")
		End If

		DoEvents()

		BT_DELAY_EXECUTION_WITH_DOEVENTS(45)



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




Function xAtuSetas()

	//DoEvents()
	BT_ClientAreaInvalidateAll(   'Win_Scroll1'  )
	yDCScrool1()
	DoEvents()


Return




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


	If !_isWindowDefined(cSubMenuName)
		Return
	End If


	If nHWnd != GetFormHandle(cSubMenuSombra)
		Return
	End If 

	  

	If ( _isWindowDefined( cScrollSombra) ) .And.  (nHWnd == GetProperty(  cScrollSombra , "HANDLE" ))


		If ( nMsg == WM_MOUSEMOVE )

			GetCursorPos (@nCol, @nRow)
			aR1 := GetPos_ScreenToClient(   GetFormHandle(  cScrollSombra  )  , nRow, nCol )


			If (nSetaSel == 2) .And. (ar1[1]  >= 16)
				Return
			End If

			If (nSetaSel == 1) .And. (ar1[1]  < 16)
				Return
			End If
			yLimpSetas()
			lCima := .t.

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


			DoEvents()
			xAtuSetas()


			yDCScrool1()
			DoEvents()


		End If


		If (nMsg == WM_LBUTTONDOWN)

			GetCursorPos (@nCol, @nRow)
			aR1 := GetPos_ScreenToClient(   GetFormHandle(  cMenuScroll  )  , nRow, nCol )

			lCima := .t.

			If (ar1[1]  < 16)
				lCima := .f.
			End If


			If (nLinha1 == 0)
				nLinha1 := XMAXITEM
			End If


			If lCima
				ScrollMenu( 1 , GetProperty(  cSubMenuName , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @l_Httt , @l_Httb , 1 , cSubMenuName , 300 , .f. , .t.   )
			Else
				ScrollMenu( 2 , GetProperty(  cSubMenuName , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @l_Httt , @l_Httb , 1 , cSubMenuName , 300 , .f. , .t. )
			End if


			//msginfo(Str(nSetaSel))

			xAtu_Men1()


			DoEvents()
			xAtuSetas()
			xAtuSetas()
			DoEvents()



		End If
	End If



	//Win_MenuSombra
	//If (nHWnd == GetProperty(  'Win_Menu1' , "HANDLE" ))

	If ( _isWindowDefined( cSubMenuSombra) ) .And. (nHWnd == GetProperty(  cSubMenuSombra , "HANDLE" ))

	

		If ( nMsg == WM_MOUSELEAVE )  .and. (   lTracking192  )

			nItemx2 := 0
			nItemZ1 := 0
			BT_ClientAreaInvalidateAll( nHWnd  )
			SetWindowCursor( nHWnd , IDC_ARROW )
			xHideHint()


			xAtu_Men1()

		End If



		If (nMsg == VK_LEFT)

			If lPopUp

				//msginfo('popuip')
			End If

		End If


		If (nMsg == WM_LBUTTONDOWN)

			If (nItemx2 <= Len(aOpz11))           
				xClickOpt( nItemx2 )
			End If

		End If




		If ( nMsg == WM_MOUSEMOVE ) .And. ( _isWindowDefined(cSubMenuName) )

			If (nItemx2 > 0) .AND. (nWParam != 90)
				If (nItemx2 = xOpSelPos( cSubMenuName , 0 , Len(aOpz11) , 0 )	)
					Return
				End If
			End If

			//BT_DELAY_EXECUTION_WITH_DOEVENTS(50)



			If (nWParam != 90)
				nItemx2 := xOpSelPos( cSubMenuName, 0 , Len(aOpz11) , 0 )
			End If

			nRow1 := -(GetProperty( cSubMenuName , "VscrollBar" , "Value"))

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
				xLimpSub( cSubMenuName  , @nItemZ1 ,  @nItemx2 , 0 )
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
				BT_ClientAreaInvalidateRect( cSubMenuName ,  nRow1  +  ( ( nItemx2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
			End If


			If (nItemx2 > 0) .And.  (nItemx2 <= Len(  aOpz11 )) .And. ( !Empty( Alltrim(  aOpz11[nItemx2][2]  )   )) .AND. (nWParam != 90)

				cTp1 :=	  Alltrim( 	 aOpz11[nItemx2][2]  )
				nRow1 := 0
				GetCursorPos (@nCol, @nRow1)

				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow1  , GetProperty(cSubMenuName, 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow1 + 15   , GetProperty( cSubMenuName, 'Col') + GetProperty( cSubMenuName, 'Width') + 3 + 5 )
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

			DoEvents()			
			xAtu_Men1()
			


		End If


	End If


Return


Static Function xClickOpt( nOpt1 )


 	If !aOpz11[nOpt1][3]		
		yaviso("Opção Indisponivel." , .f. )
		Return
	End If

				//msginfo('ok22')

	DoEvents()
	

	If (aOpz11[nOpt1][4] != Nil )
		Eval( aOpz11[nOpt1][4]  ,  nOpt1  )
		Return
	End If


    DoEvents()
	xFechaMen()



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

		BT_DrawBitmap ( hDC2,  2  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   ,  Iif(!l_Httb , bBmp3 ,  bBmp5 ) )
		BT_DrawBitmap ( hDC2,  20  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , Iif(!l_Httt , bBmp4 ,  bBmp6 ) )

	Else		

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

		DoEvents()

	End If


	DoEvents()

	BT_BitmapRelease ( bBmp1 )
	BT_BitmapRelease ( bBmp2 )

	BT_BitmapRelease ( bBmp3 )
	BT_BitmapRelease ( bBmp4 )


	BT_BitmapRelease ( bBmp5 )
	BT_BitmapRelease ( bBmp6 )

	DraVertH( hDc2 , 0   , Width )
	DraVertL( hDC2 , 0 , Height , .t. )
	DraVertL( hDc2 , Width  - 1  , Height  )
	DraVertH( hDc2 , Height  - 1  , Width   )



	BT_DeleteDC (BTstruct2 )

Return



Static Function yLimpSetas()

	If nSetaSel > 0

		If _isWindowDefined( cMenuScroll )
			nSetaSel := 0
			xAtuSetas()
			yDCScrool1()
			DoEvents()

		End If
	End If

Return




Function xRetira( cString )

 Local n1 := At('%' , cString )

Return If( n1 > 0 , Upper(Substr(cString , n1+ 1, 1)) , '')


Function xKeySubMen( nMsg1 , nwParam1 , cJanela  )

	LOCAL  nHWnd   := EventHWND()
	//EventWPARAM()
	Local nContItens := 0
	Local nQt        := 0
	Local nRow       := 0
	Local nindice
	Local nMsg
	Local nWParam
	Local nIndice1 := 0


	Local ch := HMG_GetLastCharacter(@nHWnd)

	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)


	DEFAULT nMsg1    := EventMSG()
	DEFAULT nWParam1 := EventWPARAM()

	DEFAULT cJanela := cSubMenuName


	nWParam := nwParam1
	nMsg    := nMsg1


	If nMsg == WM_CHAR
	 //  msginfo('Char ' + ch )

	    nIndice1 :=  Ascan(  aOpz11 , { |a| xRetira(a[1]) == Upper(cH) }    )

		If nIndice1 > 0
			//msginfo(Str(nIndice1))
			BT_DELAY_EXECUTION_WITH_DOEVENTS(250)
			xClickOpt( nIndice1 )
			DoEvents()
			Return 
		End If 

	End If 


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


					//BT_ClientAreaInvalidateAll( 'Win_Scroll1' )

				Else
					SendMessage( GetProperty(   cJanela , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,0 )
				End If

				xAtuSetas()
				DoEvents()



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
						//BT_ClientAreaInvalidateAll( 'Win_Scroll1' )
						xAtuSetas()
						DoEvents()
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


Function xRetSubName()
Return cSubMenuName




