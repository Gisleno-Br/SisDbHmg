#include <hmg.ch>
#include <minigui.ch>

#define WM_SETFOCUS 7

//25-09

Static nIndexDialog  := 0

STATIC lTracking45 := .F.

STATIC nIndexDlg22 := 0
STATIC nIndexDlg23 := 0
STATIC nIndexDlg24 := 0

//STATIC lExit := .f. 






DEFINE WINDOW main
DECLARE WINDOW fSplit6


#define WM_DESTROY          0x0002
#define SC_CLOSE            61536




Static Function xRetImgs( nId )


	Local aMtr1 := {}	 

	If (nId == 6652)
		aMtr1 := {'OKVERDE1'  , 'OKVERDE2' , 3}
	End If 
 
Return aMtr1





//FUNCTION EventDlg( nHWnd, nMsg, nWParam, nLParam )
FUNCTION EventDlg()

	LOCAL nID
	LOCAL ButHnd
	LOCAL nRow, nCol
	LOCAL nind1
	LOCAL cMenuName := 'Win_Dialog'
	Local cForm
	Local cControl
	Local nIdBut := 0
	Local n1 

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	Local nLParam  := EventLPARAM()

	If !_IsWindowDefined ( cMenuName )
		Return
	End If
	

	If nMsg == WM_KEYDOWN

		If (nWParam == VK_O )			
			lExit := .t.				 
			Do Events 
		End If 

		If (nWParam == VK_S)
			lRetx := .T.			
			xFechaDlg()			
		End If 

		If (nWParam == VK_N)
			lRetx := .F.			
			xFechaDlg()
		End If


	End If 		


	If nHWnd == GetProperty(  cMenuName, "HANDLE" )

		If nMsg == WM_DRAWITEM
			If ( nWParam >=  6652 ) .AND.  ( nWParam <=  6669 )
				OBTN_Draw( nHWnd,  nwParam, nLParam , lFlagOk , xRetImgs( nWParam ) , .t. , 25 )
				//,  xRetImgs(  nWParam  ) , .f. , 20
			End If
		End If


		If nMsg == 273

			nID := LoWord( nWParam )

			If ((nId >= 50) .And. (nId <= 360))

				nIe1 := Ascan(aRotHnd , { |a|a[1] == nId } )

				If (nIe1 > 0)			
					PushButton( aRotHnd[nIe1][3]  , nId  )
					Eval( aRotHnd[nIe1][2]  )
				End If

			End If


			If nID == IDOK
				nID := GetDlgCtrlID( GetFocus() )
			End If 

			If nId == 6652				 
				 lExit := .t.				 
				 Do Events 
			End If 

			If nId == 6653
				lRetx := .T.			
				xFechaDlg()			
			End If 

			If nId == 6654			
				lRetx := .F.			
				xFechaDlg()
			End If

			IF nId == 6601

			End If


		End If 

	End If

Return 

FUNCTION InputEv2()

	//STATIC lTracking45 := .F.

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  nLParam := EventLPARAM()
	LOCAL cFormx := 'Win_Dialog'

	LOCAL nind1
	LOCAL nIdBut := 0
	LOCAL n1
	LOCAL ButHnd

	lTracking45 := .F.

	If !_isWindowDefined("Win_Dialog")
		Return 
	End If 
	
	If (Alltrim(cFormx) = "Win_Dialog")

		
		For n1 := 6652 TO 6659
			If ( OBTN_Handle( cFormx, n1 ) == nHWnd )
				If nIdBut == 0
					nIdBut := n1
				End If 
			End If
		Next
	End If


	IF ( nIdBut > 0 )

	
		If ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking45)

	
			CursorHand1( nHWnd  )
			lTracking45 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag


			OBTN_Color( cFormx, nIdBut, RetColor1( 2 ), .T. )
			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

			//msginfo('ok')

			lFlagOk := .t. 

		End If


		If ( nMsg == WM_MOUSELEAVE )
			
			lFlagOk := .f. 

			OBTN_Color( cFormx,  nIdBut, RetColor1( 1 ), .T. )
			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )


			lTracking45 := .F.

		End IF


	Else

	End If 

RETURN




FUNCTION InitProgress( aHandle, nTp1 )

	xIniProgress( nTp1 )


	HMG_ChangeWindowStyle( aHandle    , 0x00010200 , NIL, .F., .F.)
	HMG_ChangeWindowStyle( aHandle  ,WS_EX_TOOLWINDOW  , NIL, .t., .t.)


	If (BlockRun != Nil)
		Eval(BlockRun)
	End If


	_ReleaseWindow('fProgress')


	//msginfo('3')

RETURN

FUNCTION RetColor1( nInd1, nModel )

	LOCAL aColor := {}

	LOCAL nTxColorE  := Rgb( 79, 79, 79 )
	LOCAL nFrColorE  := Rgb( 207, 207, 207 )
	//Rgb( 207, 207, 207 )



	LOCAL nBkColorE1 := Rgb( 251, 251, 251 )
	LOCAL nBkColorE2 := Rgb( 230, 230, 230 )

	



	LOCAL nGradDirE  := 0
	LOCAL nTxColorD  := 0x808080

	LOCAL nFrColorD  := Rgb( 232, 232, 232 )

	// { 9, 111, 137 }
	

	LOCAL nBkColorD1 := 0XE0E0E0

	LOCAL nBkColorD2 := 0XE0E0E0

	LOCAL nGradDirD  := 0
	LOCAL nTxColorF  := Rgb( 45, 55, 56 )
	LOCAL nFrColorF  := nFrColorE
	
	//0x100003B
	//nFrColorE


	LOCAL nBkColorF1 :=  0xFFFFFF
	LOCAL nBkColorF2 :=  Rgb( 192, 192, 192 )

	//LOCAL nBkColorF1 :=  RED
	//LOCAL nBkColorF2 :=  WHITE



	LOCAL nGradDirF  := 0
	LOCAL cFontName  := 'Arial'
	LOCAL nFontSize  := 8

	LOCAL aBtnFont  := { "Arial", 8, .F., .F., .F., .F. }

	LOCAL aBtnColor := ;
		{ { nTxColorE, nFrColorE, nBkColorE1, nBkColorE2, nGradDirE }, { nTxColorD, nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2,         nGradDirF } }

	LOCAL aBtnSel := ;
	{ { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2, nGradDirF }, { nTxColorD, nFrColorD, nBkColorD1, nBkColorD2, nGradDirD }, { nTxColorF, nFrColorF, nBkColorF1, nBkColorF2,       nGradDirF } }



	DEFAULT nModel := 1

	IF ( nModel != 1 )

	END IF

RETURN Iif( nInd1 == 1, aBtnColor, aBtnSel )


Function XMsgAltere( cMsg1 )


	If (_isWindowDefined('fProgress1'))
		SetProperty(  'fProgress1' ,   'LblMsg01' , Alltrim(cMsg1) ) 

		//DoMethod('fProgress1' ,   'LblMsg01' , 'Refresh')

		Do Events
		
		
		//msginfo('ok ' + cMsg1 )

	End If 




Return 



FUNCTION xMsgRun( cMsg1  , bBlock , lSombra )

	Local nTop , nLeft 

	PRIVATE cJanxDialog := 'fDialogo'

	Private BlockRun := bBlock

	DEFAULT cMsg1 := ''
	//  DEFAULT nTipo := 1

	DEFAULT lSombra := .t. 

	PRIVATE cBmpx1 :=  "img\aviso1.bmp"

	PRIVATE cMensagem := cMsg1

	PRIVATE lRet := .F.

	DEFINE WINDOW fProgress1 AT 0,0 WIDTH 450  HEIGHT 147 TITLE 'fProgress1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE CHILD NOSYSMENU NOCAPTION BACKCOLOR WHITE  ;
		ON PAINT xProcDlg(  cMsg1   , .t.  )
	END WINDOW

	

    DEFINE LABEL LblMsg01
		PARENT fProgress1
        ROW    35
        COL    60
        WIDTH  520
        HEIGHT 24
        VALUE '               '
        FONTNAME XFONT1
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
        BACKCOLOR NIL
        FONTCOLOR {150,150,150}
    END LABEL





	Center Window fProgress1



	If (lSombra)
		nTop  := GetProperTy('fProgress1' , 'Row')
		nLeft := GetProperTy('fProgress1' , 'Col')

		
		DEFINE WINDOW WinSombra2 AT nTop + 12 , nLeft+15 WIDTH 440 HEIGHT 140 TITLE 'Sombra2' ;
				NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
				ON PAINT xSombra( ThisWindow.Name , nTop + 6 , nLeft+5  )
		END WINDOW	

	
		WinSombra2.Show()
		Bt_ClientAreaInvalidateAll('WinSombra2')


	End If 




	
	_ShowWindow("fProgress1")
	BT_ClientAreaInvalidateAll(   'fProgress1'  )


	Eval(bBlock)



RETURN lRet


Function yRun(  cMsg1 , bBlock , lEfect , cFormName)

	cDiaName := 'fProgress'

	xMsgRun( cMsg1 , bBlock )

Return

FUNCTION xIniProgress( nTp )

	LOCAL cJanx
	LOCAL nFontSize := 8

	//:= cJanxDialog



	If (nTp == 1) .Or. ( nTp == 2 )

		cJanx := cJanxDialog

		If nTp == 1



			OBTN_Create( cJanxDialog, 6652,  Chr(31), 185, 245,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
			OBTN_Font( cJanxDialog, 6652,  { cFontName, nFontSize, .F., .F., .F., .F. } )

			EventProcessAllHookMessage( EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6652 )   ), .T. )

		Else


			OBTN_Create( cJanx, 6653, "Sim", 185, 375,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
			OBTN_Create( cJanx, 6654, hb_ANSIToOEM( "Não" ), 185, 435,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

			OBTN_Font( cJanx, 6653,  { cFontName, nFontSize, .F., .F., .F., .F. } )
			OBTN_Font( cJanx, 6654,  { cFontName, nFontSize, .F., .F., .F., .F. } )

			EventProcessAllHookMessage( EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6653 )   ), .T. )
			EventProcessAllHookMessage( EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6654 )   ), .T. )

		End If
	End If


	If (nTp = 5)

		cJanx    := 'fProgress'
		cDiaName := cJanx

		OBTN_Create( cJanx , 6670 , "Cancelar", 125, 265 ,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Font( cJanx   , 6670 ,  { cFontName, 8 , .F., .F., .F., .F. } )

		EventProcessAllHookMessage( EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6670 )   ), .T. )

	End If


RETURN


Function xProcDlg(  cJanela , cText , lMsgRun    )

	LOCAL Width     := BT_ClientAreaWidth  ( cJanela ) 

	LOCAL Height    := BT_ClientAreaHeight  ( cJanela ) 

	Local aRGBcolor := { 9, 111, 137 }

	Local nTypeText    := BT_TEXT_TRANSPARENT
	//+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

	Local hBitSeta := BT_BitmapLoadFile( 'OKVERDE3' )

	//LOCAL hDC2
	Local BTstruct2	
	
	

	Local hDC2 := BT_CreateDC ( cJanela, BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	Default lMsgRun := .f. 


	If lMsgRun
		BT_DrawGradientFillVertical ( hDC2 ,  0 ,  0 , Width,  Height ,   { 255,255,255}, {  233,233,233 } )
	End If 


	BT_DrawGradientFillVertical ( hDC2 ,  0,  0,  Width, 20 , aRGBcolor , BLACK )

	BT_DrawGradientFillVertical ( hDC2 ,  220 ,  0 , Width ,  25 ,   { 238,238,238}, {  244,244,244 } )

	If !lMsgRun
		//BT_DrawText (hDC2 , 120 , 15 , alltrim(cText) , "arial", 9, BLACK ,  WHITE , , nAlingText, nOrientation)
	Else 

		BT_DrawBitmapTransparent ( hDC2,   50   ,  15   , 25 , 25 , BT_COPY   ,  hBitSeta , WHITE )
		BT_DrawText (hDC2 , 55 , 55 , alltrim(cText) , XFONT1 , 9  , BLACK ,  WHITE , BT_TEXT_TRANSPARENT , nAlingText, nOrientation)
		
	End If 	





	BT_DeleteDC ( BTstruct2 )


REturn 

Function yAviso( cMsg )

  xDialog(cMsg1)

Return 

Function xDialog( cMsg1 , lAsk1  )
	

	//ON PAINT xProcDlg()

	Local nTop  
	Local nLeft

	Local zBitMap , zBitMap2

	Local lRet := .f. 

	Default lAsk1 := .f. 

	Private lRetx := .F.

	Private lInstall := .f. 

	lExit := .f. 


	If _IsWindowDefined('Win_Dialog')
		Return .t. 
	End If 
	
	DEFINE WINDOW Win_Dialog ;
		AT 0,0  ;				
		WIDTH 747 HEIGHT 247 ;
		CHILD TITLE 'xDialog1'  ;		
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE ;
		ON PAINT xProcDlg( ThisWindow.Name ,  cMsg1 )  				
	END WINDOW	
	

	

    DEFINE LABEL Labez1
		PARENT Win_Dialog
        ROW    92
        COL    20
        WIDTH  700
        HEIGHT 100
        VALUE cMsg1
        FONTNAME XFONT1
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
        BACKCOLOR NIL
        FONTCOLOR {150,150,150}
    END LABEL




    DEFINE IMAGE Image_1
		PARENT Win_Dialog
        ROW    27
        COL    35
        WIDTH  48
        HEIGHT 48
        PICTURE Iif( !lAsk1 , "EXCLA1" , "INTERRO1" )
        HELPID Nil
        VISIBLE .T.
        STRETCH .T.
        ACTION Nil
    END IMAGE



    DEFINE LABEL Label_1
		PARENT Win_Dialog
        ROW    75
        COL    20
        WIDTH  650
        HEIGHT 45
        VALUE Hb_AnsiToOem("Aviso Informação")
        FONTNAME XFONT1
        FONTSIZE 8
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
        BACKCOLOR NIL
        FONTCOLOR {150,150,150}
    END LABEL


	CENTER WINDOW Win_Dialog 	


	nTop  := GetProperTy('Win_Dialog' , 'Row') 
	nLeft := GetProperTy('Win_Dialog' , 'Col')



	//zBitMap := BT_BitmapCaptureDesktop ( nTop + 12 , nLeft + GetProperTy('Win_Dialog' , 'Width')  + 2 , 5 , GetProperTy('Win_Dialog' , 'Height') - 7  )

	//zBitMap2 := BT_BitmapCaptureDesktop ( nTop + GetProperTy('Win_Dialog' , 'Height') + 1 , ;
	 //nLeft+5 , GetProperTy('Win_Dialog' , 'Width')   , 6 )


	//Bt_BitMapSaveFile(  zBitMap , 'y0133.bmp')
//	Bt_BitMapSaveFile(  zBitMap2 , 'y0134.bmp')

	zBitMap := BT_BitmapCaptureDesktop ( nTop + 12 , nLeft + 12 , GetProperty('Win_Dialog' , 'Width') - 7 , GetProperTy('Win_Dialog' , 'Height') - 7  )
	



	DEFINE WINDOW WinSombra2 AT nTop + 12 , nLeft+12 WIDTH GetProperty('Win_Dialog' , 'Width') - 9 HEIGHT 240 TITLE 'Sombra2' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra( ThisWindow.Name , nTop  , nLeft  , zBitMap ) 			
	END WINDOW


    xProcinit(lAsk1)	
	HMG_ChangeWindowStyle( Win_Dialog.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
	//HMG_ChangeWindowStyle( Win_Dialog.Handle, WS_EX_STATICEDGE, NIL, .T., .T. )

	

	//DisableWindow(cActiveJan)



	WinSombra2.Show()
	Bt_ClientAreaInvalidateAll('WinSombra2')
	
	_ShowWindow('Win_Dialog')

    xWaitDlg()	

	//msginfo('pl2')
	xFechaDlg()




Return (lRetx)


Function xIndiDlg()

		//msginfo('ok')

	//SysWait(.2)	

	PostMessage( OBTN_Handle( 'Win_Dialog', 6652   ) , WM_MOUSEMOVE , 0,0)
	

	PostMessage( OBTN_Handle( 'Win_Dialog', 6652   ) , WM_MOUSELEAVE , 0,0)

	//SysWait(.2)

Return 



Function xProcinit( lPergunta )

	nIndexDlg22 := Len(_HMG_EventData) + 1	
	CREATE EVENT PROCNAME EventDlg() HWND Win_Dialog.Handle STOREINDEX nIndexDlg22 
		

	If (!lPergunta)

		OBTN_Create( 'Win_Dialog', 6652,  '&Ok'   , 185, 360 ,  75 ,  30,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont ) 
		
		//, 'OKVERDE1'  , 3 , 'OKVERDE2')

		OBTN_Font( 'Win_Dialog', 6652,  { cFontName, nFontSize, .F., .F., .F., .F. } )




		nIndexDlg22 := Len(_HMG_EventData) + 1	
		
		CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6652 )  STOREINDEX nIndexDlg22 
		EventProcessAllHookMessage(nIndexDlg22 , .t.)


		//SysWait(0.09)

		//msginfo('lp2')
		
		lInstall := .t. 


		//EventProcessAllHookMessage(EventCreate("InputEv2", OBTN_Handle( 'Win_Dialog', 6652 )), .T.)



		
	Else 

		OBTN_Create( 'Win_Dialog', 6653, "&Sim", 185, 292,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Create( 'Win_Dialog', 6654, hb_ANSIToOEM( "&Não" ), 185, 355 ,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

		OBTN_Font( 'Win_Dialog', 6653,  { cFontName, nFontSize, .F., .F., .F., .F. } )
		OBTN_Font( 'Win_Dialog', 6654,  { cFontName, nFontSize, .F., .F., .F., .F. } )

		nIndexDlg22 := Len(_HMG_EventData) + 1			
	    CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6653 )  STOREINDEX nIndexDlg22 

		EventProcessAllHookMessage(nIndexDlg22 , .t.)


		nIndexDlg22 := Len(_HMG_EventData) + 1			
		CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6654 )  STOREINDEX nIndexDlg22 
		EventProcessAllHookMessage(nIndexDlg22 , .t.)



	End If 		


	
	nIndexDialog := Len(_HMG_EventData)	
	//BT_ClientAreaInvalidateAll('Win_Dialog')


Return 


Function xFindEvent(  cEvent , nHandle1 )
    Local nindex1:=0
	Local ni := 1

	
	Do Events
	Do Events


	While nI <= Len(_HMG_EventData)

		If (Valtype( _HMG_EventData[nI][2] ) == 'N') .And. (Valtype( _HMG_EventData[nI][1] ) == 'C')
	
			If  ((_HMG_EventData[nI][1] ==  cEvent ) .And. (_HMG_EventData[nI][2] ==  nHandle1 ))			
				nIndex1 := ni
			End If 	

		End If 	

		ni++

	Enddo	


Return (nIndex1)


Function xCloseMsg()

  
	Local nHandle2  := DoFindWin("fProgress1")
	Local nHandle1  := DoFindWin("Sombra2")

	DO EVENTS

	
	If nHandle2 > 0
		
		SendMessage( nHandle2, WM_SYSCOMMAND, SC_CLOSE , 0 )
		DO EVENTS
		SendMessage( nHandle2, WM_SYSCOMMAND, WM_DESTROY , 0 )	
		DO EVENTS

		//msginfo('2')


	End If 

	DO EVENTS
		

	If nHandle1 > 0
		
		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )
		DO EVENTS
		SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )	
		DO EVENTS

		//msginfo('3')

	End If 


Return 

Function xFechaDlg()


	
	Local nHandle1  := DoFindWin("xDialog1")

	Local nHandle2  := DoFindWin("Sombra2")




	Local nIndex1 := xFindEvent(  'EventDlg()' ,  GetFormHandle('Win_Dialog') ) 
	Local nIndex2 := xFindEvent(  'InputEv2()' ,  OBTN_Handle( 'Win_Dialog', 6653 )   ) 
	Local nIndex3 := xFindEvent(  'InputEv2()' ,  OBTN_Handle( 'Win_Dialog', 6654 )   ) 

	Local nIndex4 := xFindEvent(  'InputEv2()' ,  OBTN_Handle( 'Win_Dialog', 6652 )   ) 
	
	
	If (nIndex1 > 0)
		xDelEvent(   nIndex1 )
	End If 	

	If nIndex2 > 0
	   xDelEvent(   nIndex2 )
	End If 	 

	If nIndex3 > 0
		xDelEvent(   nIndex3 )
	End If 	

	
	If nIndex4 > 0
		xDelEvent(   nIndex4 )
	End If 




	If nHandle1 > 0

		
	
		nSeconds := 1


		DO EVENTS
		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )


		DO EVENTS
		DO EVENTS

	


		SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )
		DO EVENTS	

	End If 
	

	

	If nHandle2 > 0		
		
		DO EVENTS
		SendMessage( nHandle2, WM_SYSCOMMAND, SC_CLOSE , 0 )

		DO EVENTS
		DO EVENTS


		SendMessage( nHandle2, WM_SYSCOMMAND, WM_DESTROY , 0 )
		DO EVENTS

	End If 




Return 



Function xWaitDlg()

	Local i
	Local ar1
	Local nRow1,nCol1
	Local nHWnd := GetFormHandle('Win_Dialog')
	Local nHWnd1


	For i := 1 To 255
		GetAsyncKeyState(i)
	Next i

	//xIndiDlg()
   
    Do Events
	Do Events

	//aMx := yEfect(  cActiveJan , .t.  )


	Do While .Not. lExit

		Do Events
		
		For i := 1 To 255				
			If (GetAsyncKeyState(VK_RETURN) != 0) 
				lExit := .T.				
				Exit			
			EndIf
		Next i		

		BringTop('xDialog1')		
		SysWait(0.01)
		//_ShowWindow('Win_Dialog')

	Enddo

	//msginfo('Exit')

Return .t. 


Function xSombra(  cJanela , nRow1  , nCol1 , zBitmap1  )


	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)

	Local BTstruct

	//Local zBitMap
	Local zBitMap2
	Local zBmp1 

	Local zBmp2


	Local hDC := BT_CreateDC ( cJanela  , BT_HDC_INVALIDCLIENTAREA , @BTstruct)



	//zBitMap := BT_BitmapCaptureDesktop ( nRow1 , nCol1 , Width + 15 , Height + 25 )

	zBitMap2 := BT_BitmapLoadFile('SOMBRA5')



//	zBmp1 := BT_BitmapLoadFile('y0133.Bmp')
//	zBmp2 := BT_BitmapLoadFile('y0134.Bmp')


/*

	BT_DrawGradientFillHorizontal  (hDC,  0  , 0 ,  Width  - 6,        Height - 5   , {89,89,89} , {89,89,89})
	BT_DrawGradientFillHorizontal  (hDC,  0  ,      Width - 5  ,  1 ,  Height - 5 , {89,89,89} , {89,89,89} )

	BT_DrawGradientFillHorizontal  (hDC,  0  ,  Width - 4  ,  1 	,  Height - 5 , {143,143,143} , {143,143,143}   )
	BT_DrawGradientFillHorizontal  (hDC,  0  ,  Width - 3  ,  1 	,  Height - 5 , {172,172,172} , {172,172,172}  )
	BT_DrawGradientFillHorizontal  (hDC,  0  ,  Width  - 2 ,  1 	,  Height - 5  , {212,212,212} , {212,212,212} )


	BT_DrawGradientFillHorizontal  (hDC,  0  ,  Width  - 1 ,  1 	,  Height - 5  , {241,241,241} , {241,241,241}  )
	BT_DrawGradientFillHorizontal  (hDC,  0  ,  Width  - 0 ,  1 	,  Height - 5  ,{252,252,252}  , {252,252,252}  )





	BT_DrawGradientFillHorizontal  (hDC,  Height - 6  ,  0   , Width - 5 ,  1  , {89,89,89} , {89,89,89}  )


	BT_DrawGradientFillHorizontal  (hDC,  Height - 5  ,  0  ,  Width - 5  ,  1  , {89,89,89} , {89,89,89}   )


	BT_DrawGradientFillHorizontal  (hDC,  Height - 4  ,  0  ,  Width - 5 ,  1  ,{143,143,143} , {143,143,143}  )
	BT_DrawGradientFillHorizontal  (hDC,  Height - 3  ,  0  ,  Width - 5 ,  1  ,{172,172,172} , {172,172,172})
	BT_DrawGradientFillHorizontal  (hDC,  Height - 2  ,  0  ,  Width - 5 ,  1  ,{212,212,212} , {212,212,212} )
	BT_DrawGradientFillHorizontal  (hDC,  Height - 1   ,  0  , Width - 5  ,  1  ,{241,241,241} , {241,241,241})


	BT_DrawGradientFillHorizontal  (hDC,  Height      ,  0  ,  Width - 5 ,  1  ,{252,252,252}  , {252,252,252})
	*/




	//BT_DrawBitmapAlphaBlend (hDC, GetProperty("fSplit2","Height" ) ,  nCol  , nil, nil, 120 , BT_COPY  , zBitmap)
	//BT_DrawBitmap (hDC, Height - 5  , Width - 5 , 5, 105, BT_COPY, zBitmap2 )


	//BT_DrawBitmap (hDC, 0 , 0 , Width, Height, BT_COPY, zBitmap1 )


	//BT_DrawGradientFillHorizontal  (hDC,  Height - 2  ,  0  ,  Width - 5 ,  1  ,{212,212,212} , {212,212,212} )
	BT_DrawBitmapAlphaBlend (hDC, 0 , 0 , Width   , Height  , 55  , BT_COPY, zBitmap1 )

	//BT_DrawBitmapAlphaBlend (hDC, 0 , 0 , Width - 1  , Height - 1  , 85  , BT_COPY, zBitmap1 )

	//BT_DrawBitmapAlphaBlend (hDC, 0 , 0 , Width - 2  , Height - 2  , 45  , BT_COPY, zBitmap1 )





	BT_DeleteDC ( BTstruct )



Return


