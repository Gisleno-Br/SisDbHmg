#require "hbxpp"

//#include <hmg.ch>
#include <minigui.ch>
#include <hmg.ch>
#include <dll.ch>


#define WM_DESTROY          0x0002
#define SC_CLOSE            61536


#define FONTCOR2 {84,84,84}



#define FONTCOR {0,106,133}
#define BACK1 {229,237,242}
#define BACK5 {255,255,255}
#define CORSEL {215,228,236}
//{180,205,220}
//{216,228,236}

#define FONT1 {102,102,102}

#define XQUEBRA Chr(13)+Chr(10)

#define XMAXITEM 15

////xMenuOp	

Static aOpz11 := {}
Static nItemx2 := 1
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

Static nSec1 := 0

Static lTracking87 := .f. 
Static lTrck542 := .t.

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

Static lTrackScrol := .f. 

Static cMenuScroll := ''
Static cScrollSombra := ''


Static aSalva := {}


STATIC lTracking192 := .t.

Static lTrackingSub := .f. 

Static lEntrouSub := .f. 
Static nItemSub   := 0

Static hMgFont 

Static hBitSeta 
Static hBitSeta2

Static bBmp1
Static bBmp2

Static nColSub1 := 0
Static nRowSub1 := 0



Static bBmp3
Static bBmp4



Static bBmp5
Static bBmp6




Function xMenuOp( cName , cParent , aOp1 , nTop , nLeft  ,  lPopUp  ,  aMatriz , nItemSel  ,  lEnabled )

	Local lOk     := .f.
	Local nHeight := (Len(aOp1) * nItemSubHeight)
	//Local zBitMap1
	Local i
	Local nItemz1 := 0
	Local nCol2
	Local nRow2

	Local nH2 


	
	hBitSeta  :=  xBmpToTrans( 'SETATRANSP', aCorSub2 , 16,16 )
	hBitSeta2 :=  xBmpToTrans( 'SETATRANSP', aMenuBarCor , 16,16 )


	bBmp1 := xBmpToTrans( 'SETAB1', aMenuBarCor , 16,16 )
	bBmp2 := xBmpToTrans( 'SETAC1', aMenuBarCor , 16,16 )


	bBmp3 := xBmpToTrans( 'SETAB1', aCorSub2 , 16,16 )
	bBmp4 := xBmpToTrans( 'SETAC1', aCorSub2 , 16,16 )

	bBmp5 := xBmpToTrans( 'SETAB1D', aCorSub2 , 16,16 )
	bBmp6 := xBmpToTrans( 'SETAC1D', aCorSub2 , 16,16 )



	Default lPopUp := .f.
	Default lEnabled := .t.
	

	If Len(aSalva) == 0
		aSalva := Aclone(aOp1)
	End If 

	
	cSubMenuName := cName 
	cNSombra1 := cName + '_Sombra1'
	cNSombra2 := cName + '_Sombra2'
	cNSombra3 := cName + '_Sombra3'

	cSubMenuSombra := 'wSombra_' + Right(cSubMenuName,4)


	cMenuScroll   := 'wScroll_' + Right(cSubMenuName,4)
	cScrollSombra := 'wSombra_' + cMenuScroll

	aOpz11 := Aclone(aOp1)

	

	l_Popup := lPopUp
	
	nItemx2 := 0
	nItemZ1 := 0
	cOpy2 := ''
	nAcumulador := 0

	lEnabled2 := lEnabled

	hMgFont := HMG_CreateFont(  GetDc(  GetFormHandle('Main') )  , XFONT2, nSizeFont, .f., .f., .f., .f. )

	

	nCol2 := (nLeft+1)+nColTamMenu - 1

	
	
	If !_isWindowDefined(cNSombra1)

		nH1 := If( (Len(aOpz11) > XMAXITEM) .And. ( Right(cSubMenuName,1) = '1') , 325 , (Len(aOp1) * nItemSubHeight)  )				

		nH2 := nH1 
		If ( Right(cSubMenuName,1) = '2')
			nH2 := nH1 - 15
		End If 


		zBitMap0 := BT_BitmapCaptureClientArea(  cParent ,   nTop + 15  ,  nCol2 + 1 ,  4  , nH2  )

		DEFINE WINDOW &cNSombra1 AT nTop + 15 , nCol2+1 WIDTH 4 HEIGHT nH2 TITLE 'Sombra1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F. ;
			ON PAINT xSombraVert( ThisWindow.Name , 0  , 0 , zBitMap0  )
		END WINDOW

		If !_isWindowDefined(cNSombra2)

			nRowx := nTop + nH1 
			
			If  (Len(aOpz11) > XMAXITEM) .And. ( Right(cSubMenuName,1) = '1')
				 nRowx := nTop + 15 + nH1 
			End If 	 

			zBitMap5 := BT_BitmapCaptureClientArea ( cParent , nRowx  ,  nLeft+6   ,  nColTamMenu - 5  , 4  )


			DEFINE WINDOW &cNSombra2 AT nRowX , nLeft+6  WIDTH nColTamMenu - 5 HEIGHT 4 TITLE 'Sombra2' ;
				NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD  PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F. ;
				ON PAINT xSombraHor( ThisWindow.Name , 0  , 0 , zBitMap5  )
			END WINDOW


		End If

		If !_isWindowDefined(cNSombra3)

			zBitMap6 := BT_BitmapCaptureClientArea ( cParent , nRowx , nCol2+1  ,  4 , 4  )

			DEFINE WINDOW &cNSombra3 AT  nRowx , nCol2+1  WIDTH 4 HEIGHT 4 TITLE 'Sombra3' ;
				NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR RED VIRTUAL HEIGHT Nil VISIBLE .F.  ;
				ON PAINT xSombra3( ThisWindow.Name , zBitMap6 )
			END WINDOW
		End If

		

	End If


	BT_ClientAreaInvalidateAll(   cNSombra1 )
	_ShowWindow( cNSombra1 )


	BT_ClientAreaInvalidateAll(   cNSombra3 )
	_ShowWindow( cNSombra3 )	


//	DoEvents()

	DEFINE WINDOW &cSubMenuName AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300    ) TITLE 'Men1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR aCorSub2 VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  )  VISIBLE .F.;
		ON PAINT xPaintPopup(ThisWindow.Name , aOpz11 , nItemx2 , nItemZ1 , cOpy2 , 0 , 0 ,  Len(aOpz11) > XMAXITEM     ,  .t. ,  ,  , .t. )
	END WINDOW

	nColSub1 := nLeft+nColTamMenu+2
	nRowSub1 := nTop

	
//	DoEvents()

	DEFINE WINDOW &cSubMenuSombra AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300    ) TITLE 'MenSombra1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  ) VISIBLE .F. 		
	END WINDOW

		

	If  (Len(aOpz11) > XMAXITEM) .And. ( Right(cSubMenuName,1) = '1')
		DEFINE WINDOW &cMenuScroll AT nTop+GetProperty( cSubMenuName , 'Height')   , nLeft+1 WIDTH nColTamMenu  HEIGHT 40 TITLE 'TShadow1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE CHILD PANEL PARENT &cParent NOSYSMENU NOCAPTION BACKCOLOR GRAY VISIBLE .F.;
			ON PAINT xPaintScrool( ThisWindow.Name  )
		END WINDOW


		DEFINE WINDOW &cScrollSombra AT nTop+GetProperty( cSubMenuName , 'Height')   , nLeft+1 WIDTH nColTamMenu  HEIGHT 40 TITLE 'TShadow2' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE  CHILD PANEL PARENT &cParent NOSYSMENU NOCAPTION BACKCOLOR WHITE VISIBLE .F.
		END WINDOW

		
		SET WINDOW &cMenuScroll TRANSPARENT TO Iif(!lEnabled2 , 167 , 0)


	End If


	SET WINDOW &cSubMenuName TRANSPARENT   TO Iif(!lEnabled2 , 167 , 0)

	

	//DoEvents()

	HMG_ChangeWindowStyle(  GetProperty(  cSubMenuName , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	If _IsWindowDefined(cMenuScroll)
		HMG_ChangeWindowStyle(  GetProperty(  cMenuScroll  , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
		HMG_ChangeWindowStyle(  GetProperty(  cScrollSombra , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

		
		ShowScrollBar( GetFormHandle( cScrollSombra), 0, .F. )
		ShowScrollBar( GetFormHandle( cScrollSombra ), 1, .F. )

	End If 


	

	HMG_ChangeWindowStyle(  GetProperty(  cSubMenuSombra , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )


	HMG_ChangeWindowStyle(  GetProperty(  cNSombra1 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra2 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	HMG_ChangeWindowStyle(  GetProperty(  cNSombra3 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )



	ShowScrollBar( GetFormHandle( cSubMenuSombra ), 0, .F. )
	ShowScrollBar( GetFormHandle( cSubMenuSombra ), 1, .F. )



	//If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( Hmg_ ( "EventMenu1"  ) )  ) = 0) .And. ;
	  //  ( Right(cSubMenuName,2) == 'Y1')

		InstallEventHandler( "EventMenu1" )
		//nIndexEventX := 20050	

		nIndexEventX := xFindEvent(  'xKeySubMen()' )
			

		//msginfo('k111 ' + Str( nIndexEventx))

		If nIndexEventX == 0 
			CREATE EVENT PROCNAME xKeySubMen()
			nIndexEventX := Len(_HMG_EventData)
		Else 
			EventStop(  nIndexEventX , .f. )
		End If 

	//End If

	ShowScrollBar( GetFormHandle( cSubMenuName ), 0, .F. )
	ShowScrollBar( GetFormHandle( cSubMenuName ), 1, .F. )
	

	If  (Len(aOpz11) > XMAXITEM) .And. (_isWindowDefined( cMenuScroll   ))
		_ShowWindow( cScrollSombra )
		_ShowWindow( cMenuScroll )
		DoEvents()
		BT_ClientAreaInvalidateAll(  cMenuScroll  )

		yDCScrool1()
		DoEvents()

	End If


	DoEvents()		
	

	



Return lOk

Function xCheckJan(  cJanela )

	Local nCol1 , nRow1 
	Local nHWnd2 


	If !_IsWindowDefined(cJanela)
		REturn .f. 
	End If 

	GetCursorPos (@nCol1, @nRow1)
	DoEvents()
	nHWnd2 := WindowFromPoint (nCol1, nRow1)

Return (GetFormHandle(cJanela) == nHWnd2)



Static Function xAtuMenuy()

	//msginfo( cSubMenuName )
	If _isWindowDefined(cSubMenuName)
		//DoEvents()
		yDCMenu11_()
		//DoEvents()
	Else 
	//	msginfo('l21')
	End If 


Return 


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
	BT_ClientAreaInvalidateAll(   cSubMenuName  )
	

	yDCMenu11_()


	If _IsWindowDefined(cMenuScroll)
		DoEvents()
		BT_ClientAreaInvalidateAll(   cMenuScroll  )

		yDCScrool1()
		DoEvents()
	End If 


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

	BT_ClientAreaInvalidateAll (cSubMenuSombra)
	//DoEvents()

Return




Function yDCScrool1()

	Local Width1  := BT_ClientAreaWidth  (cMenuScroll)
	Local Height1 := BT_ClientAreaHeight (cMenuScroll)

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2 , BTstruct3
	
	//, BTstruct3

	Local nTypeText    := BT_TEXT_TRANSPARENT
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT



	Local Width2  := GetProperty( cScrollSombra , 'Width' )
	Local Height2 := GetProperty( cScrollSombra , 'Height' )

	hDC1 = BT_CreateDC (cMenuScroll, BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cScrollSombra, BT_HDC_ALLCLIENTAREA, @BTstruct2)

	
	/*
	hBitMap2 := BT_BitmapCreateNew (Width1  , Height1 , WHITE )
	hDC3 := BT_CreateDC (hBitMap2 , BT_HDC_BITMAP, @BTstruct3 )
	BT_DrawDCtoDC (hDC3, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Bt_BitmapSaveFile(  hBitMap2 , 'Menu1133sombra.bmp'  )
	*/

	

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

Function xSetMenu1( cLetra , lMsg1 )

	Local cName := 'MenuY'+cLetra

	DEFAULT lMsg1 := .t. 

	cSubMenuName := cName 
	cNSombra1 := cName + '_Sombra1'
	cNSombra2 := cName + '_Sombra2'
	cNSombra3 := cName + '_Sombra3'

	cSubMenuSombra := 'wSombra_' + Right(cSubMenuName,4)
	cMenuScroll   := 'wScroll_' + Right(cSubMenuName,4)
	cScrollSombra := 'wSombra_' + cMenuScroll

	aOpz11 := Aclone(aSalva)

	nItemSub := 0
	lEntrouSub := .f. 

	If lMsg1 
		DoEvents()	
		SendMessage(   GetFormHandle( cSubMenuSombra )  , WM_MOUSELEAVE , 0,0 )
		DoEvents()
	End If 

Return 


Function xFechaSub2()

	Local nHandle1
	Local nHandle2

	Local nHandle5  := GetFormHandle(cNSombra1)
	Local nHandle6  := GetFormHandle(cNSombra2)
	Local nHandle7  := GetFormHandle(cNSombra3)



   If _isWindowDefined('MenuY2')

	    nHandle1 := GetFormHandle(cSubMenuName)
		nHandle2 := GetFormHandle(cSubMenuSombra)

		If (nHandle1 > 0)
			xCloseDlg( nHandle1 )
		End If

		If (nHandle2 > 0)
			xCloseDlg( nHandle2 )
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

		DoEvents()

		//xSetMenu1('1')

		DoEvents()



   End If 


Return 


Function xFechaMen()

	Local nI1 := 0

	Local nHandle1  := GetFormHandle(cSubMenuName)
	Local nHandle2  := Iif(_isWindowDefined(cMenuScroll),GetFormHandle(cMenuScroll),0)

	Local nHandle3  := Iif(_isWindowDefined(cSubMenuSombra),GetFormHandle(cSubMenuSombra),0)	
	Local nHandle4  := Iif(_isWindowDefined(cScrollSombra) ,GetFormHandle(cScrollSombra),0)

	Local nHandle5  := GetFormHandle(cNSombra1)
	Local nHandle6  := GetFormHandle(cNSombra2)
	Local nHandle7  := GetFormHandle(cNSombra3)

	//msginfo('xFecha')


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

		If !RemoveHandler( "EventMenu1"  )
			//Msginfo("Erro ao remover Handle Event.")
		End If

		EventSTOP ( nIndexEventX , .T.) 

		
		DoEvents()

		xHideHint()		
		DoEvents()

		
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

	DoEvents()
	DoEvents()


Return lOk




Function xAtuSetas()

	//DoEvents()
	BT_ClientAreaInvalidateAll(   cScrollSombra )
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
	Local nSt2 

	Local cY1 := 'MenuY1'
	Local cY2 := 'MenuY2'

	Local cSubMenuSombra1 := 'wSombra_nuY1'	
	Local cSubMenuSombra2 := 'wSombra_nuY2'
	

	
	

	If (!Empty( Alltrim(cSubMenuName))) .And. (!_isWindowDefined(cSubMenuName))	
		Return
	End If	 	

	If ( _isWindowDefined( cScrollSombra) ) .And.  (nHWnd == GetProperty(  cScrollSombra , "HANDLE" ))

		If ( nMsg == WM_MOUSELEAVE )
		

			nSetaSel := 0
			DoEvents()
			BT_ClientAreaInvalidateAll( cMenuScroll)
			DoEvents()
			yDCScrool1()

			lTrck542 := .t.

		End If           
		

		If ( nMsg == WM_MOUSEMOVE )  .And. (lTrck542)

		//	msginfo('ok22')

			GetCursorPos (@nCol, @nRow)		
			aR1 := GetPos_ScreenToClient(   GetFormHandle(  cScrollSombra  )  , nRow, nCol )			
			nSt2 := 2

			If (ar1[1]  <= 16)			
				nSt2 := 1
			Else 
			  
			End If 

			lTrck542 := (nSetaSel = nSt2)

			lTracking := TrackMouseEvent(nHWnd)


		End If 
		

		If ( nMsg == WM_MOUSEMOVE )  .And. (!lTrck542)		    

		

			lTrck542 := .t. 
			yActivScrol( nHWnd , nSt2 )				
			lTracking := TrackMouseEvent(nHWnd)

		End If


		If (nMsg == WM_LBUTTONDOWN)

			GetCursorPos (@nCol, @nRow)
			aR1 := GetPos_ScreenToClient(   GetFormHandle(  cMenuScroll  )  , nRow, nCol )
						
			lCima := .t.
			nSetaSel := 2

			If (ar1[1]  < 16)
				nSetaSel := 1
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
		
			xAtu_Men1()

			DoEvents()
			xAtuSetas()
			xAtuSetas()
			DoEvents()

		End If

	End If



	If (( _isWindowDefined( cSubMenuSombra) ) .And. (nHWnd == GetProperty(  cSubMenuSombra , "HANDLE" ))) 			
	

		If ( nMsg == WM_MOUSELEAVE ) 
			
			//.And. (lTracking21) 	     

			If _IsWindowDefined(cMenuScroll)
				nSetaSel := 0		
				BT_ClientAreaInvalidateAll( cMenuScroll)
				DoEvents()
				yDCScrool1()		
			End If 

			If !_isWindowDefined('MenuY2')
				nItemx2 := 0
				nItemZ1 := 0
				cOpy2 := ''			
				BT_ClientAreaInvalidateAll( cY1  )						
				xHideHint()			
				yDCMenu11_()
				lTrackScrol := .f. 
				DoEvents()
				xAtu_Men1()
				DoEvents()
			End If 


			//msginfo('ok22 ' + Str(  nItemx2  ))

		End If



		If (nMsg == VK_LEFT)

			If lPopUp

				//msginfo('popuip')
			End If

		End If


		If (nMsg == WM_LBUTTONDOWN)

			If nWParam != 120
				If (nItemx2 <= Len(aOpz11))           
					xClickOpt( nItemx2 )
				End If
			Else 				
				xClickOpt( nLParam )
				Return
			End If

		End If



		
		If ( nMsg == WM_MOUSEMOVE ) .and. (lTracking192) .And. (nWParam != 90)						//	lTrackingSub := .f. 

			nPos1 := xOpSelPos( cSubMenuName , 0 , Len(aOpz11) , 0 )									
		  	lTracking192 := (nItemx2 == nPos1	)					

			//DoEvents()

		End If 




		If ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking192)						
			lTracking192 := .t.	
			
			If nWParam == 0
				lTracking21 := TrackMouseEvent(nHWnd)
			End If 

			//DoEvents()

			If !xSelItemY(nWParam , nHWnd , nLParam		)												                 			       
				If nItemSub> 0
					If (nItemx2 != nItemSub)					
						DoEvents()					
						xCloseSubMenu()
						DoEvents()
						nItemSub:=0
					End If 
				End If 				
			End If 			
			

		End If 

	End If


Return


Function xShowPop()

  	xAtu_Men1( .f. )
	DoEvents()	
	yDCScrool1()		


Return 

Static Function xSelItemY(nWParam , nHWnd1 , nTecla ) 

	Local nRow1
	Local nCol       
	Local nItemy2
	Local nRow2,nCol2 
	Local nRowy , nColy 
	Local cY1 := 'MenuY1'
	Local cY2 := 'MenuY2'
	Local nItemY1
	Local cTp1 := ''
	//Local nItemY2

	DEFAULT nTecla := 1 


	If (nWParam != 90)
		nItemx2 := xOpSelPosy( cSubMenuName, 0 , Len(aOpz11) , 0 )
		// xOpSelPosy( cSubMenuName, 0 , Len(aOpz11) , 0 )

		//msginfo(Str( nItemx2    ))
		
	
		If (nItemx2 > 0) .And. (nItemx2 <= Len(aOpz11))
			If !aOpz11[nItemx2][3]	
				xHideHint()
				Return .f. 
			End If
		End If
	Else 

		 If (nTecla == 1) .or. (nTecla == 2)
			While (nItemx2 <= Len(aOpz11)) .And. (!aOpz11[nItemx2][3])
					If nTecla == 1
						nItemx2++
					Else 
						nItemx2--	
					End If 
			Enddo
		End If 


		If (nTecla == 40)
			nItemY2 := nItemx2 
			If Len(aOpz11[nItemy2]) >= 6 				
				nRowy := 2+GetProperty( 'MenuY1'  , 'Row') + Abs(  (nItemSubHeight *  (nItemy2 - 1)) - ( nItemSubHeight)  )
				nColy := GetProperty( 'MenuY1'  , 'Col') + nColTamMenu + 8 
			//	msginfo(Str(nColy))
				Eval( aOpz11[nItemy2][6]  ,  nRowy  , ;
					nColy  , aOpz11 , nItemy2   )	
				Return .t. 
			Else 
				PlayBeep()
			End If 

			Return .f. 


		End If 

	End If 

	
	nRow1 := -(GetProperty( cSubMenuName , "VscrollBar" , "Value"))

	If nItemZ1 > 0
		xLimpSub( cSubMenuName  , @nItemZ1 ,  @nItemx2 , 0 )
	End If

	If nItemx2 > 0
		nItemZ1 := nItemx2
	Else		
		Return .f. 
	End If

	
	//DoEvents()
	

	If nItemx2 > Len(aOpz11)
		xHideHint()		
		Return .f. 
	End If



	If nItemx2 > 0
		BT_ClientAreaInvalidateRect( cSubMenuName ,  nRow1  +  ( ( nItemx2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
	End If

	DoEvents()			


	If nSetaSel > 0
		xAtuSetas()
		nSetaSel := 0
		DoEvents()
		BT_ClientAreaInvalidateAll( cMenuScroll)
		DoEvents()
		yDCScrool1()
	End If 


	lTrackScrol := .f. 
	xAtuMenuy()

	DoEvents()
	

	nItemy2 := nItemx2

	//msginfo(Str(nItemy2))
	//xOpSelPosy( cSubMenuName, 0 , Len(aOpz11) , 0 )

	If (nWParam != 90 ) .And. (  nItemy2 <= Len(aOpz11) ) .And. (nItemy2 > 0)

		GetCursorPos( @nCol2 , @nRow2)					
		lSubOpen := .t.

		If !((Len(aOpz11[nItemy2]) > 5) .And. (   aOpz11[nItemy2][5]   ))						
			xHideHint()			
		Else 

			cJan1 := ''

			If _isWindowDefined('JanMenuSub')
				nRowy := (nRow2 - nItemSubHeight) 
				nColy := Abs(GetProperty( 'JanMenuSub'  , 'Col')) + nColTamMenu + 5 
				cJan1 := 'JanMenuSub'
			End If 

			nRowy := 0
			nColy := 0

			If _isWindowDefined('MenuY1')
				nRowy := 2+GetProperty( 'MenuY1'  , 'Row') + Abs(  (nItemSubHeight *  (nItemy2 - 1)) - ( nItemSubHeight)  ) 
				nRowY := nRowSub1 + Abs(  (nItemSubHeight *  (nItemy2))  ) - ( nItemSubHeight)  
				nColy := nColSub1			
				cJan1 := 'MenuY1'
			End If 

			lTracking192 := .f.

			DoEvents()

			If (nRowy > 0 ) .And. (nItemSub == 0)
				lEntrouSub := .f.
				nItemY2 := xOpSelPos( cJan1 , 0 , Len(aOpz11) , 0 )
				
				xHideHint()					
				BT_DELAY_EXECUTION_WITH_DOEVENTS(70)		

				nItemY1 := xOpSelPos( cJan1 , 0 , Len(aOpz11) , 0 )

				If (nItemY2 != nItemY1) 
					DoEvents()			
					hb_releaseCPU()				
					Return .f. 
				End If

				DoEvents()	
				nItemSub   := nItemy2
				
				If (nItemy2 <= Len(aOpz11)) .And. (   Len(aOpz11[nItemy2]) >= 6   )
					Eval( aOpz11[nItemy2][6]  ,  nRowy  , ;
							nColy  , aOpz11 , nItemy2   )		
					Return .t. 			
				End If 
		
				
			End If 

		End If 
		

	End If 

	
	If (nItemx2 > 0) .And.  (nItemx2 <= Len(  aOpz11 )) .And. ( !Empty( Alltrim(  aOpz11[nItemx2][2]  )   )) .AND. (nWParam != 90)
		cTp1 :=	  Alltrim( 	 aOpz11[nItemx2][2]  )
		xShowHintM( cTp1    )
	Else
		
		DoEvents()
		xHideHint()
	End If		

	
	DoEvents()				
	

Return .f. 

Function xShowHintM( cMensagem    , cFormName )

	Local nRow1
	Local nCol := 0

	DEFAULT cFormName := ''
		
 	nRow1 := 0
	GetCursorPos (@nCol, @nRow1)
	//DoEvents()


	If Empty(Alltrim(cFormName))
		GetFormNameByHandle( WindowFromPoint(  nCol , nRow1 ) , @cFormName  )
	End If 

	If Empty(Alltrim(cFormName))
		Return 
	End If 

	//DoEvents()

    If !_isWindowDefined("Win_Msg")
		CrieJanTip( nRow1  , GetProperty(cFormName, 'Width') - 15 ,   Alltrim(cMensagem)      ,, 0.5 )
	Else
		xDispHint( cMensagem , nRow1 - 1   , GetProperty( cFormName, 'Col') + GetProperty( cFormName, 'Width') + 40 )
		DoFindWin('xHint')
	End If

	xDispUpTam(cMensagem )	


REturn 

Static Function xClickOpt( nOpt1 )


	If !aOpz11[nOpt1][3]		
		yaviso("Opção Indisponivel." , .f. )
		Return
	End If

	xFechaMen()


	If (aOpz11[nOpt1][4] != Nil )
		Eval( aOpz11[nOpt1][4]  ,  nOpt1  )
		Return
	End If


Return 

Function xPaintScrool( cForm )

	Local hBit10
	Local hBit11
	Local hDc2

	Local BTstruct2



	

	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)




	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	If nSetaSel == 0
		BT_DrawGradientFillHorizontal  (hDC2,  0  , 0 ,  nColTamMenu , (nItemSubHeight * 2)   , aCorSub2 , aCorSub2)

		BT_DrawBitmap ( hDC2,  2  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   ,  Iif(!l_Httb , bBmp3 ,  bBmp5 ) )
		BT_DrawBitmap ( hDC2,  20  , Int(nColTamMenu/2) - 15    , 16 , 16 , BT_COPY   , Iif(!l_Httt , bBmp4 ,  bBmp6 ) )

		//msginfo('gtt')


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

		//DoEvents()

	End If


	//DoEvents()

	
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
		//	DoEvents()
			BT_ClientAreaInvalidateAll( cMenuScroll)
			//DoEvents()
			yDCScrool1()		
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
	Local cForm1 := ''

	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)


	DEFAULT nMsg1    := EventMSG()
	DEFAULT nWParam1 := EventWPARAM()

	DEFAULT cJanela := cSubMenuName


	nWParam := nwParam1
	nMsg    := nMsg1


	//GetFormNameByHandle( nHWnd , @cForm1 )
	//GetCompo

	
	
	If nMsg == WM_CHAR

		//msginfo('Char ' + ch )

		nIndice1 :=  Ascan(  aOpz11 , { |a| xRetira(a[1]) == Upper(cH) }    )

		If nIndice1 > 0				
			//xClickOpt( nIndice1 )			
			SendMessage( GetProperty(   cSubMenuSombra , "HANDLE" ) , WM_LBUTTONDOWN ,  120 ,nIndice1 )
			
		End If 

		Return 

	End If 




	If nMsg == WM_KEYDOWN


		If nWParam == 27
			If _IsWindowDefined('MenuY2')
				xCloseSubMenu()
			Else
				xFechaMen()
			End If 

			Return
		End If 


		If nWParam = VK_RETURN
			lTracking42 := .f.
			If !_IsWindowDefined('MenuY2')
				SendMessage( GetProperty(   cSubMenuSombra , "HANDLE" ) , WM_LBUTTONDOWN ,  90 ,50 )
			Else 
				SendMessage( GetProperty(   'MenuY2' , "HANDLE" ) , WM_LBUTTONDOWN ,  90 ,50 )
			End If 	

		End If


		If nWParam == VK_RIGHT		   
		   If xSelItemY( 90 , Nil , 40		)												                 			       		   

		   End If 		
		   DoEvents()
		End If 

		If nWParam == VK_LEFT 
			If _IsWindowDefined('MenuY2')
				xCloseSubMenu()
			End If 
		   DoEvents()
		End If 


		IF nWParam == VK_DOWN

			xHideHint()

			If !_IsWindowDefined('MenuY2')
			
				If nItemx2 < Len(aOpz11)
					nItemx2++
					lTracking192 := .f.
					If (nItemx2 > nMaxItem)

						If (nLinhaAtual == 0)
							nLinhaAtual := Int(nTamSubMenuConsulta / nItemSubHeight)
						End If

						//msginfo('ok2')

						ScrollMenu( 2 , GetProperty( cSubMenuName , 'Handle' ) , @nScrLin , @nLinhaAtual , Len(aOpz11) , @l_Httt , @l_Httb , 1 , ;
							cSubMenuName , GetProperty( cSubMenuName , 'Height' )  )

						BT_ClientAreaInvalidateAll(   cSubMenuName  )
						DoEvents()	
						yDCMenu11_()
						DoEvents()				
						
						If _IsWindowDefined(    cMenuScroll )
							DoEvents()
							BT_ClientAreaInvalidateAll( cMenuScroll)
							DoEvents()
							yDCScrool1()						
							DoEvents()
						End If					

					Else
						SendMessage( GetProperty(   cSubMenuSombra , "HANDLE" ) , WM_MOUSEMOVE ,    90 , 1 )
					End If				

					xAtuSetas()					
					
					DoEvents()

				Else
					//MsgInfo('Hit Bottom!')
				End If

			Else 

				*//SubMenu
				xSubupDown(.t.)
				DoEvents()


			End If 	


		End If





		IF (nWParam == VK_UP)

			xHideHint()

			If !_IsWindowDefined('MenuY2')

				If nItemx2 > 1
					nItemx2--
					lTracking192 := .f.
					If nItemX2 >= nMaxItem

						ScrollMenu( 1 , GetProperty(  cSubMenuName , "HANDLE" )  , @nScrLin , @nLinhaAtual , Len(aOpz11) , @l_Httt , @l_Httb , 1 , ;
							cSubMenuName , GetProperty(cSubMenuName , 'Height' )  )

						BT_ClientAreaInvalidateAll(   cSubMenuName  )
						DoEvents()	
						yDCMenu11_()

						DoEvents()				

						If _IsWindowDefined(    cMenuScroll )
							DoEvents()
							BT_ClientAreaInvalidateAll( cMenuScroll)
							DoEvents()
							yDCScrool1()						
							DoEvents()
						End If

					Else
						SendMessage( GetProperty(   cSubMenuSombra , "HANDLE" ) , WM_MOUSEMOVE ,    90 ,2 )
					End If				


				Else
					
				End If

			Else 

				xSubupDown(.f.)
				DoEvents()

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
Return cSubMenuSombra



Function xPaintPopup( cForm , aMtrOp , nOpselx1 , nClear1 , cTextSel  , nItemDropedDown , nHeightDroped , lSetas , lSubMenu1 , lHitB , lHitT  , lPopup )


	Local aRGBcolor := BACK1
	Local nWidthBmp := 170
	Local nHandle1
	Local nHandle2
	Local hWnd
	Local BTstruct
	Local BTstruct2
	Local hDc
	Local hDc2
	Local lSeta1 := .f.
	Local nTYpe
	Local nLine := 00
	Local hBit10
	Local hBit11
	Local nHeightBmp := nItemSubHeight * Len(aMtrOp)
  	Local hBitmap2





	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)


	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''


	Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))
	Local nLineSeta := nTamSubMenuConsulta
	Local nLinDrop := 0
	Local lEnabled := .t.
	Local cCor

	


	//Bt_BitmapSaveFile(  bBmp2 , 'SetaC12__222.Bmp'  )



	DEFAULT nItemDropedDown := 0
	DEFAULT nHeightDroped   := 0
	DEFAULT lSetas          := .f.

	DEFAULT lSubMenu1       := .f.

	DEFAULT lHitB := .f.
	DEFAULT lHitT := .f.

	DEFAULT lPopup := .f.

	//SaveLog( 'T2221.txt' ,   cForm + XQUEBRA)	

	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )

	If !lSubMenu1
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , aCorSub1 , aCorSub1  )
	Else
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , aCorSub2 , aCorSub2  )
	End If

	If nClear1 > 0

		If !lSubMenu1
			BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemSubHeight)    , 0  , nColTamMenu ,    nHeightBmp    ,  aCorSub1  , aCorSub1  )
		Else

			BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemSubHeight)    , 0  , nColTamMenu ,    nHeightBmp    ,  aCorSub2  , aCorSub2  )
			//msginfo('ok2')
		End If

	End If



	For n1 := 1 To Len(aMtrOp)

		cTexto := alltrim(  Right( aMtrOp[n1][1]  , Len(  aMtrOp[n1][1] ) - 2  ) )

		IF lPopup
			cTexto := Alltrim( aMtrOp[n1][1]  )
		End If 

		lSeta1 := .f. 

		If Len(aMtrOp[n1]) >= 5
			lSeta1   := (aMtrOp[n1][5]) .And. (aMtrOp[n1][3])
		End If

		lEnabled := aMtrOp[n1][3]
		lSeta1   := .f.

		cCor := FONTCOR

		IF lPopup
			cCor := FONTCOR2
		End If 

		If Len(aMtrOp[n1]) >= 5
			lSeta1   := aMtrOp[n1][5]
		End If

		If ((nOpselx1 > 0) .And. (nOpSelx1 = n1) .And. aMtrOp[n1][3] ) .or. (   (lEnabled ) .And. (nOpselx1 > 0) .And. ( Alltrim(cTextSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT
  			nTypeText    := BT_TEXT_BOLD			

			If !aMtrOp[n1][3]				
				cCor := CorDisabled2
			End If
			

			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , nColTamMenu ,    nItemSubHeight      , aMenuBarCor  , aMenuBarCor  )
			
			If (At('%' , cTexto) > 0)
				DrawSubl(   hDC2 , nLine + nRow  , 32 , Alltrim(Hb_AnsiToOem( cTexto )) , cCor )
			Else 
				BT_DrawText ( hDC2 , nLine + nRow  , Iif(!lSubMenu1 , 25 ,32)  ,  Hb_AnsiToOem( cTexto ), XFONT2, nSizeFont  ,  cCor ,  aCorSub2   , ;
					Iif(!lPopUp , BT_TEXT_TRANSPARENT+BT_TEXT_BOLD  , BT_TEXT_TRANSPARENT )  , nAlingText, nOrientation)
			End If 
			
			If lSeta1
				BT_DrawBitmapTransparent ( hDC2,  nLine  + nRow + 2  , Width - 20    , 16 , 16 , BT_COPY   ,  hBitSeta2 , {7,101,125} )
			End If
			

		Else

			nTypeText    := BT_TEXT_TRANSPARENT
			

			IF lPopup
				cCor := FONTCOR2
			End If 


			If !aMtrOp[n1][3]			
				cCor := CorDisabled2		
			End If

			//	nTypeText    := BT_TEXT_BOLD
			
			
			If (At('%' , cTexto) > 0)
				DrawSubl(   hDC2 , nLine + nRow  , 32 , Alltrim(Hb_AnsiToOem( cTexto )) , cCor )
			Else 
				BT_DrawText ( hDC2 , nLine + nRow  , 32 ,  Hb_AnsiToOem( cTexto ), XFONT2, nSizeFont,  cCor , aCorSub2 , nTypeText, nAlingText, nOrientation )
			End If 						

			If lSeta1
				BT_DrawBitmapTransparent ( hDC2,  nLine  + nRow + 2   , Width - 20    , 16 , 16 , BT_COPY   ,  hBitSeta , {7,101,125} )
			End If

			

		End If

		nLine += (nItemSubHeight)

		If (nItemDropedDown > 0) .and. (!lPopup)
			If (nItemDropedDown == n1)
				nLinDrop := nLine
				nLine += Iif( !lSetas , nHeightDroped  , (nTamSubMenuConsulta + ( 2 * nItemSubHeight))   )
			End If
		Else


		End If

	Next
	

	//BT_BitmapRelease ( hBitSeta )
	//BT_BitmapRelease ( hBitSeta2 )


	If (lSubMenu1) .or. (lPopup)
		DraVertL( hDC2 , 0 , Height , .t.)
		DraVertL( hDC2 , Width - 1  , Height + 1 , .t.)
		DraVertH( hDc2 , 0   , nColTamMenu , .t.  )
	Else 
		If ((!lSubMenu1) .And. (!lPopup))
			DraVertL( hDC2 , Width - 1  , Height + 1 , .t.)
			DraVertH( hDc2 , Height - 1 ,   Width  , .t.  )
		End If 	

	End If 

	//DoEvents()
	
	//msginfo('2')
	BT_DeleteDC (BTstruct2 )

REturn

Function DrawSubl(  hDC5 , nLinha  , Coluna , cText15 , nCor   )

  Local n1 := At('%' , cText15 )

  Local c1 := Left(cText15 , n1 - 1)
  Local c2 := Substr(cText15,n1,1)
  Local nCol1 := Coluna 

  Local nTypeText    := BT_TEXT_TRANSPARENT
  Local cCor := FONTCOR2
  Local lok := .f. 

  	
  Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
  Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	

  Local cLetr 

//	DoEvents() 


  For n2 := 1 To Len(cText15)

		cLetr := Substr( cText15 , n2 , 1)		

		If (cLetr != '%')	
		
			n12 := GetTextWidth( hDC5 , cLetr , hMgFont )
			nTypeText    := BT_TEXT_TRANSPARENT

			If lOk 
				nTypeText    := BT_TEXT_TRANSPARENT+BT_TEXT_UNDERLINE
				lOk := .f. 
			End If 

			BT_DrawText ( hDC5 , nLinha  , nCol1 ,  Hb_AnsiToOem( cLetr)  ,  XFONT2  , nSizeFont  ,  nCor , aCorSub2 , nTypeText, nAlingText, nOrientation )
			nCol1 += n12 

		Else 
		   lOk := .t.	

		End If

  Next 

  //DoEvents()




Return 




Static Function xOpSelPosy( cJan , nHeit2 , nItMax , nItDopred  , nHeightCalc , nScroolPos  )

	Local nCol := 0
	Local nRow := 0
	Local ar1
	Local NewPos
	Local nRow1 := -(GetProperty( cJan , "VscrollBar" , "Value"))
	Local nIa1 , nIa2

	Local nItem := 0


	DEFAULT nHeit2 := 0
	DEFAULT nItDopred := 0

	DEFAULT nHeightCalc := nItemSubHeight

	DEFAULT nScroolPos := GetScrollPos( GetFormHandle(  cJan  ), 1 )

	GetCursorPos (@nCol, @nRow)


	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJan  )  , nRow, nCol )



	//NewPos := GetScrollPos( GetFormHandle(  cJan  ), 1 )

	NewPos := nScroolPos


	If NewPos > 0
		nItem := (Int( (NewPos+Ar1[1])     / nHeightCalc)+1)
	Else
		//nItem := (Int(Ar1[1] / nItemSubHeight)+1)
		nItem := (Int(  Ar1[1]  / nHeightCalc)+1)
	End If



	If (nHeit2 > 0) .and. (nHeit2 < ar1[1] ) .And. (nHeit2 >= nHeightCalc) .And. (ar1[1] > (nItMax * nHeightCalc)   )
		nItem := (Int( NewPos + (Ar1[1] - nHeit2) / nHeightCalc)+1)
	End If

	If (Ar1[1] - nHeit2) == 1
		nItem := nItDopred+1
	End If

	

Return Abs(nItem)


Static Function yActivScrol( nHWnd1  , nNovSeta )

			Local nRow,nCol 
			Local ar1
			Local nSt2 
/*
 			GetCursorPos (@nCol, @nRow)		
			aR1 := GetPos_ScreenToClient(   GetFormHandle(  cScrollSombra  )  , nRow, nCol )			
			nSt2 := 2

			If (ar1[1]  <= 16)
				//msginfo('ss')
				nSt2 := 1
			Else 
			    //msginfo('s2')	
				//Altd()
			End If 

			DoEvents()
			


			If (nSt2 = nSetaSel)
			//	msginfo('ok2 ' + Str(nSt2) + '   ' + Str(nSetaSel))
			  	lTrackScrol := .T. 
			Else 
			    nSetaSel := nSt2	
				lTrackScrol := .F. 
			//	msginfo('ok4 ' + Str(nSt2) + '   ' + Str(nSetaSel))
			End If         

			*/


			 //Str(nSt2) + '   ' + Str(nSetaSel))

				yLimpSetas()


				//msginfo('l2')
				nSetaSel := 0
				DoEvents()
				BT_ClientAreaInvalidateAll( cMenuScroll)
				DoEvents()
				yDCScrool1()

				//SysWait(0.04)

				nSetaSel := nNovSeta	

				SetWindowCursor( nHWnd1 , CURSORHAND  )				
				DoEvents()
				BT_ClientAreaInvalidateAll( cMenuScroll)
				DoEvents()
				yDCScrool1()

			//	BT_DELAY_EXECUTION_WITH_DOEVENTS(1500)

		//	End If



Return 



