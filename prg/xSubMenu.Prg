#require "hbxpp"

//#include <hmg.ch>
#include <minigui.ch>
#include <hmg.ch>
#include <dll.ch>


#define WM_DESTROY          0x0002
#define SC_CLOSE            61536


#define XMAXITEM 15







Static aOpz22 := {}
Static nItemx22 := 1
Static nItemZ11 := 1
Static cOpy22 := ''




Static lTracking285 := .f.
Static zBitMap0
Static zBitMap5
Static zBitMap6

Static cSubName1 := ''
//Static aOpz22


Static lTracking785 := .t.
Static lTracking786 := .f.

Static lEnabled2 := .t.
Static lCheck1 := .f. 



Function xMenuSubOp( cName , cParent , aOp1 , nTop , nLeft  ,  lEnabled , lItem1 ) 

 	Local cSubMenuName := cName 
	Local cNSombra1 := cName + '_Sombra1'
	Local cNSombra2 := cName + '_Sombra2'
	Local cNSombra3 := cName + '_Sombra3'
    Local nH1 
	Local nCol2 


	Local nItemz1 := 0

	Local nHeight := (Len(aOp1) * nItemSubHeight)

	Local cSubMenuSombra := 'wSombra_' + Right(cSubMenuName,4)

	DEFAULT lItem1 := .f. 

	lEnabled2 := lEnabled

	nItemx22 := 1

	
	aOpz22 := Aclone(aOp1)
	nCol2 := (nLeft+1)+nColTamMenu - 1

	If _isWindowDefined(cSubMenuName)
		Return 
	End If 

	If !lItem1		
		DoEvents()
		xIniSubMenu()		
	End If 



	//BT_DELAY_EXECUTION_WITH_DOEVENTS(65)


    cSubName1 := cName 

    nH1 := If( (Len(aOpz22) > XMAXITEM) .And. ( Right(cSubMenuName,1) = '1') , 325 , (Len(aOp1) * nItemSubHeight)  )		


    DEFINE WINDOW &cSubMenuName AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz22) <=  XMAXITEM , nHeight ,  300    ) TITLE 'Men1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR aCorSub2 VIRTUAL HEIGHT Iif(  Len(aOpz22) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  )  ;
		ON PAINT xPaintPopup(ThisWindow.Name , aOpz22 , nItemx22 , nItemZ11 , cOpy22 , 0 , 0 ,  Len(aOpz22) > XMAXITEM     ,  .t. ,  ,  , .t. )
	END WINDOW



	
	//DoEvents()

	DEFINE WINDOW &cSubMenuSombra AT nTop, nLeft+1 WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz22) <=  XMAXITEM , nHeight ,  300    ) TITLE 'MenSombra1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Iif(  Len(aOpz22) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)+10  ) 		
	END WINDOW

    nH2 := nH1 
	If ( Right(cSubMenuName,1) = '2')
		nH2 := nH1 - 15
	End If 

	zBitMap0 := BT_BitmapCaptureClientArea(  cParent ,   nTop + 15  ,  nCol2 + 1 ,  4  , nH2  )

	DEFINE WINDOW &cNSombra1 AT nTop + 15 , nCol2+1 WIDTH 4 HEIGHT nH2 TITLE 'Sombra1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
		ON PAINT xSombraVert( ThisWindow.Name , 0  , 0 , zBitMap0  )
	END WINDOW





	nRowx := nTop + nH1 
			
	If  (Len(aOpz22) > XMAXITEM) .And. ( Right(cSubMenuName,1) = '1')
		 nRowx := nTop + 15 + nH1 
	End If 	 

	zBitMap5 := BT_BitmapCaptureClientArea ( cParent , nRowx  ,  nLeft+6   ,  nColTamMenu - 5  , 4  )


	DEFINE WINDOW &cNSombra2 AT nRowX , nLeft+6  WIDTH nColTamMenu - 5 HEIGHT 4 TITLE 'Sombra2' ;
				NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD  PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
				ON PAINT xSombraHor( ThisWindow.Name , 0  , 0 , zBitMap5  )
	END WINDOW




	zBitMap6 := BT_BitmapCaptureClientArea ( cParent , nRowx , nCol2+1  ,  4 , 4  )

	DEFINE WINDOW &cNSombra3 AT  nRowx , nCol2+1  WIDTH 4 HEIGHT 4 TITLE 'Sombra3' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR RED VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra3( ThisWindow.Name , zBitMap6 )
	END WINDOW

    

    
	HMG_ChangeWindowStyle(  GetProperty(  cSubMenuName , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

    
	HMG_ChangeWindowStyle(  GetProperty(  cSubMenuSombra , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )


	HMG_ChangeWindowStyle(  GetProperty(  cNSombra1 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra2 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	HMG_ChangeWindowStyle(  GetProperty(  cNSombra3 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )



	ShowScrollBar( GetFormHandle( cSubMenuSombra ), 0, .F. )
	ShowScrollBar( GetFormHandle( cSubMenuSombra ), 1, .F. )

    ShowScrollBar( GetFormHandle( cSubMenuName ), 0, .F. )
	ShowScrollBar( GetFormHandle( cSubMenuName ), 1, .F. )


   
	
	_ShowWindow( cSubMenuSombra)
	xAtu_MenSub( .f. )

	DoEvents()

	
	
	InstallEventHandler( "EventSubMen" )	

	//DoEvents()
	//msginfo( Str(nItemx22)  )



Return 


Function xSubupDown(  lDown  )

	If !_isWindowDefined('MenuY2')
	    Return 
	End If 

	If lDown 
		If nItemx22 < Len(aOpz22)
			nItemx22++
			xSelItemY( 90 ,  GetFormHandle('MenuY2'), 250 ) 
		End If 
	Else 
		If nItemx22 > 1
			nItemx22--	
			xSelItemY( 90 ,  GetFormHandle('MenuY2'), 250 ) 
		End If
	End If 


Return 


Function xIniSubMenu(   nInit  )

	DEFAULT nInit := 0

	nItemx22 := nInit
	nItemZ11 := nInit
	cOpy22 := ''

	lCheck1 := .f. 

Return 	

Function xCloseSubMenu()

	Local nI1 := 0

	Local cName := 'MenuY2'
	
	Local cNSombra1 := cName + '_Sombra1'
	Local cNSombra2 := cName + '_Sombra2'
	Local cNSombra3 := cName + '_Sombra3'
    
	

	Local cSubMenuSombra := 'wSombra_' + Right(cName,4)


	Local nHandle1  := GetFormHandle(cName)
	Local nHandle2  := GetFormHandle(cSubMenuSombra)
	Local nHandle3  := GetFormHandle(cNSombra1)
	Local nHandle4  := GetFormHandle(cNSombra2)
	Local nHandle5  := GetFormHandle(cNSombra3)

	//msginfo('xFecha')

	If (nHandle1 > 0)

		//msginfo('xFecha')
	
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


		If !RemoveHandler( "EventSubMen"  )
			Msginfo("Erro ao remover Handle Event EventSubMen.")
		End If


		BT_DELAY_EXECUTION_WITH_DOEVENTS(30)		
		DoEvents()		

		//EXEC
		
	End If

	//DoMethod('Main' , 'SetFocus')


Return




Function EventSubMen( nHWnd, nMsg, nWParam, nLParam )


	Local cSubMenuSombra2 := 'MenuY2'
	Local nPosy1
	Local nRow , nCol 


	If GetFormIndex(cSubMenuSombra2) == 0
		Return 
	End If 

	// Sub Menu 
	If ( _isWindowDefined( cSubMenuSombra2) ) .And.  (nHWnd == GetProperty(  cSubMenuSombra2 , "HANDLE" ))

		
		If (nMsg == WM_LBUTTONDOWN)

			If nWParam != 120
				If (nItemx22 <= Len(aOpz22))           
					xClickOpt( nItemx22 )
				End If
			Else 				
				xClickOpt( nLParam )
				Return
			End If

		End If

	
 		If ( nMsg == WM_MOUSEMOVE )  .And. ( lTracking785) .And. (nWParam != 90)			
			nPosy1 := xOpSelPos( cSubMenuSombra2 , 0 , Len(aOpz22) , 0 )

			

			lTracking785 := (nItemx22 == nPosy1)				

		End If 

		If ( nMsg == WM_MOUSEMOVE )  .And. ( !lTracking785) .And. (nWParam != 90)			
			//DoEvents()
			xOpSelPos( cSubMenuSombra2 , 0 , Len(aOpz22) , 0 )
			lTracking785 := .t.
			xSelItemY(nWParam , nHWnd) 
			lTracking21  := TrackMouseEvent(nHWnd)
			yDCMenu11_()
			//DoEvents()
			DoEvents()
			
		End If 


		If (nMsg == WM_MOUSELEAVE)			
			lCheck1:=.t.
			xCloseSubMenu()
			DoEvents()
		End If 


	End If 
	  


REturn 

Function xAtu_MenSub( lVerifica )

	Local nCol1

	Local nRow1 

	Local cName := cSubName1

    Local cSubMenuName := cSubName1
	Local cNSombra1 := cName + '_Sombra1'
	Local cNSombra2 := cName + '_Sombra2'
	Local cNSombra3 := cName + '_Sombra3'

	Local cSubMenuSombra := 'wSombra_' + Right(cSubMenuName,4)

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

	BT_ClientAreaInvalidateAll(   cNSombra1 )
	_ShowWindow( cNSombra1 )

	DoEvents()

	BT_ClientAreaInvalidateAll( cNSombra2 )
	_ShowWindow(cNSombra2 )

	DoEvents()

	
	If (GetFormIndex ( cNSombra3)  ==  0)
		Return
	End If


	BT_ClientAreaInvalidateAll(   cNSombra3  )
	_ShowWindow( cNSombra3 )
	

	DoEvents()


Return

Static Function yDCMenu11_()

	Local Width1  := BT_ClientAreaWidth  (cSubName1)
	Local Height1 := BT_ClientAreaHeight (cSubName1)
    Local cSubMenuSombra := 'wSombra_' + Right(cSubName1,4)


	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2 , BTstruct3
	

	Local nTypeText    := BT_TEXT_TRANSPARENT
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT

	DoEvents()

	If !_isWindowDefined( cSubMenuSombra)		
		Return 
	End If 



	//Local Width2  := GetProperty('Win_ScrolSombra' , 'Width' )
	//Local Height2 := GetProperty('Win_ScrolSombra' , 'Height' )

	hDC1 = BT_CreateDC (cSubName1 , BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cSubMenuSombra ,BT_HDC_ALLCLIENTAREA, @BTstruct2)


	If !lEnabled2
		BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width1, Height1, 156 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Else
		BT_DrawDCtoDC (hDC2, 0, 0, Width1, Height1, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	End If


	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)

	//BT_ClientAreaInvalidateAll (cSubMenuSombra)
	//DoEvents()

Return


Static Function xSelItemY(nWParam , nHWnd1 , nTecla ) 

	Local nRow1
	Local nCol       
	Local nItemy2
	Local nRow2,nCol2 
	Local nRowy , nColy 
	Local cY1 := 'MenuY1'
	Local cY2 := 'MenuY2'
	Local cTp1 := ''

	Local cSubMenuSombra := 'wSombra_' + Right(cY2,4)
	Local cSubMenuName   := cY2 

	If (nWParam != 90)

		nItemx22 := xOpSelPos( cSubMenuName, 0 , Len(aOpz22) , 0 )
	
		If (nItemx22 > 0) .And. (nItemx22 <= Len(aOpz22))
			If !aOpz22[nItemx22][3]	
				xHideHint()
				Return
			End If
		End If	

	Else 

		If (nTecla == 1) .or. (nTecla == 2)
			While (nItemx22 <= Len(aOpz22)) .And. (!aOpz22[nItemx22][3])
					If nTecla == 1
						nItemx22++
					Else 
						nItemx22--	
					End If 
			Enddo
		End If 	


	End If 


	DoEvents()

	//msginfo(Str(nItemx22))

	If !_isWindowDefined(cSubMenuName)
		Return 
	End If 

	If nItemZ11 > 0		
		BT_ClientAreaInvalidateAll( cSubMenuName )
		nItemZ11 := nItemx22
	End If

		

	If nItemx22 > 0
		nItemZ11 := nItemx22
	Else		
		Return
	End If

	If nItemx22 > 0
		BT_ClientAreaInvalidateRect( cSubMenuName ,  ( ( nItemx22 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
	End If	

	DoEvents()
	
  
	If (nItemx22 > 0) .And.  (nItemx22 <= Len(  aOpz22 )) .And. ( !Empty( Alltrim(  aOpz22[nItemx22][2]  )   )) .AND. (nWParam != 90)
		cTp1 :=	  Alltrim( 	 aOpz22[nItemx22][2]  )
		xShowHintM( cTp1    )
	Else
		xHideHint()
	End If		


	//yDCMenu11_()
	DoEvents()

	//msginfo(Str(nItemx22))


Return 


Static Function xClickOpt( nOpt1 )


	If !aOpz22[nOpt1][3]		
		yaviso("Opção Indisponivel." , .f. )
		Return
	End If

	
	If _IsWindowDefined('MenuY2')	
		xCloseSubMenu()
	End If 

	If (aOpz22[nOpt1][4] != Nil )
		xFechaMen()
		DoEvents()
		Eval( aOpz22[nOpt1][4]  ,  nOpt1  )
		Return
	End If


Return 

