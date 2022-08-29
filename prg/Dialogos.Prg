#include <hmg.ch>
#include <minigui.ch>

#define WM_SETFOCUS 7

#DEFINE CORHEAD1 {110,125,129}

//25-09

Static nIndexDialog  := 0

STATIC lTracking45 := .F.

STATIC nIndexDlg22 := 0
STATIC nIndexDlg23 := 0
STATIC nIndexDlg24 := 0

//STATIC lExit := .f. 


Static zBitMap0
Static zBitMap5
Static zBitMap6


DEFINE WINDOW main
DECLARE WINDOW fSplit6


#define WM_DESTROY          0x0002
#define SC_CLOSE            61536




Static Function xRetImgs( nId )


	Local aMtr1 := {}	 

	If (nId == 6652)
		aMtr1 := {'OKVERDE1'  , 'OKVERDE2' , 3}
	End If 

	If (nId == 6653)
		aMtr1 := {'OKVERDE1'  , 'OKVERDE2' , 3}
	End If 

	
	If (nId == 6654)
		aMtr1 := {'NOBUT1'  , 'NOBUT2' , 1}
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
		//msginfo('l1')

		If (nWParam == VK_O ) .OR. (nWParam == 13)			
			//msginfo('12--')
			xFechaDlg()	
			lExit := .t.				 
			DoEvents()
			Return 
		End If 


		If (nWParam == VK_S)
			lRetx := .T.			
			lExit := .t.				 
			DoEvents()
			xFechaDlg()			
			Return 
		End If 

		If (nWParam == VK_N)
			lRetx := .F.			
			lExit := .t.				 
			DoEvents()
			xFechaDlg()
			Return 
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
				
				 //msginfo('lp22')		 
				  xFechaDlg()	
				  DoEvents() 
				  lExit := .t.		
			End If 


			If nId == 6653
				lExit := .t.				 
				lRetx := .T.			
				DoEvents()
				xFechaDlg()			
			End If 

			If nId == 6654			
				lExit := .t.				 
				lRetx := .F.			
				DoEvents()
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
			OBTN_Create( cJanx, 6654, hb_ANSIToOEM( "Não" ), 185, 435,  62,  24 ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

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


Function xProcDlg(  cJanela , cText , lMsgRun   , nTipoX  )

	LOCAL Width     := BT_ClientAreaWidth  ( cJanela ) 

	LOCAL Height    := BT_ClientAreaHeight  ( cJanela ) 

	Local aRGBcolor := { 9, 111, 137 }

	Local nTypeText    := BT_TEXT_TRANSPARENT + BT_TEXT_BOLD
	//+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

	Local hBitSeta := BT_BitmapLoadFile( 'OKVERDE3' )

	Local hImg1 := BT_BitmapLoadFile( 'OKVERDE3' )
	//Local hImg2 := BT_BitmapLoadFile( 'EXCLA2' )
	//BT_BitmapLoadFile( 'INTERRO1' )
	//xBmpToTrans( 'INTERRO1' ,  WHITE)

	//LOCAL hDC2
	Local BTstruct2	

	Local ctitulo := Iif(nTipox == 1 , 'Informação' , Iif( nTipoX == 2 , 'Aviso' , 'Pergunta' ) )
	
	

	Local hDC2 := BT_CreateDC ( cJanela, BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	Default lMsgRun := .f. 


	If lMsgRun
		BT_DrawGradientFillVertical ( hDC2 ,  0 ,  0 , Width,  Height ,   { 255,255,255}, {  233,233,233 } )
	End If 


	//BT_DrawGradientFillVertical ( hDC2 ,  0,  0,  Width, 20 , aRGBcolor , BLACK )

	//BT_DrawGradientFillVertical ( hDC2 ,  0 ,  0 , Width+2,  102  ,  {110,125,129} ,  {110,125,129} )






	If !lMsgRun

		If nTipoX == 3 
			hImg1 := BT_BitmapLoadFile( 'INTERRO2' )
			cTitulo := 'Pergunta'
		End If 

		If nTipoX == 2 
			//excla2
			hImg1 := BT_BitmapLoadFile( 'EXCLA2' )
			cTitulo := 'Aviso'
		End If 


		BT_DrawText (hDC2 , 65 , 10 , Hb_AnsiToOEm(alltrim(cText)) , 'Arial', 9 , BLACK ,  {251,244,187} ,  BT_TEXT_TRANSPARENT , nAlingText, nOrientation)		


		BT_DrawGradientFillVertical ( hDC2 ,  0,  0,  Width, 35 , WHITE , {251,244,187}  )
		BT_DrawGradientFillVertical ( hDC2 ,  150 ,  0,  wIDTH , Height ,  WHITE ,  {225,225,225} )

		//BT_DrawBitmap (hDC2, 7      , 355   , 24, 24 , BT_SCALE , hImg1)

		BT_DrawBitmapTransparent (hDC2  , 2 ,  5 , 24  , 24 , BT_STRETCH,  hImg1 , WHITE )
		BT_DrawText (hDC2 , 7 , 355 , Hb_AnsiToOEm(Alltrim(cTitulo)) , XFONT1, 11 , BLACK ,  {251,244,187} ,  nTypeText , nAlingText, nOrientation)



		DraVertH( hDc2 , 149,   Width      , .t.  )


//		Bt_BitmapSaveFile( hImg1 , 'sdf.Bmp' )

		DoEvents()


	Else 

		BT_DrawBitmapTransparent ( hDC2,   50   ,  15   , 25 , 25 , BT_COPY   ,  hBitSeta , WHITE )
		BT_DrawText (hDC2 , 55 , 55 , alltrim(cText) , XFONT1 , 9  , BLACK ,  WHITE , BT_TEXT_TRANSPARENT , nAlingText, nOrientation)
		
	End If 	





	BT_DeleteDC ( BTstruct2 )
	BT_BitmapRelease (hBitSeta)


REturn 

Function yAviso( cMsg )

 // xDialog(cMsg1)

Return 

Function xDialog( cMsg1 , nTipoz  )
	

	//ON PAINT xProcDlg()

	Local nTop  
	Local nLeft

	Local zBitMap , zBitMap2
	

	Local cNSombra1 := 'WinS1'
	Local cNSombra2 := 'WinS2'
	Local cNSombra3 := 'WinS3'

	Local cParent := ''

	Local lRet := .f. 

	Default nTipoz := 1

	Private lRetx := .F.
	Private lInstall := .f. 



	GetFormNameByHandle ( GetActiveWindow(), @cParent )

	

	lExit := .f. 


	If _IsWindowDefined('Win_Dialog')
		Return .t. 
	End If 
	
	DEFINE WINDOW Win_Dialog ;
		AT 0,0  ;				
		WIDTH 740 HEIGHT 240 ;
		CHILD TITLE 'xDialog1'  ;		
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE ;
		ON PAINT xProcDlg( ThisWindow.Name ,  cMsg1 , , nTipoz )  				
	END WINDOW	

	/*

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

*/


	CENTER WINDOW Win_Dialog 	


	nTop  := GetProperTy('Win_Dialog' , 'Row') 
	nLeft := GetProperTy('Win_Dialog' , 'Col')

	
	nCol2 := nLeft + GetProperty('Win_Dialog' , 'Width') 
	nRowX := nTop + 240

	

	zBitMap0 := BT_BitmapCaptureClientArea(  cParent ,   nTop + 3  ,  nCol2+2 ,  6  , 220  )


	DEFINE WINDOW &cNSombra1 AT nTop + 10 , nCol2 WIDTH 4 HEIGHT 229 TITLE 'Sombra11' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD  BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F. ;
		ON PAINT xSombraVert( ThisWindow.Name , 0  , 0 , zBitMap0  )
	END WINDOW
		
	//nRowX	 := nTop + 
	zBitMap5 := BT_BitmapCaptureClientArea ( cParent , nRowx  ,  nLeft+15   ,  734  , 6  )

	
	DEFINE WINDOW &cNSombra2 AT nRowX, nLeft+15  WIDTH 725 HEIGHT 4 TITLE 'Sombra12' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD  BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F. ;
		ON PAINT xSombraHor( ThisWindow.Name , 0  , 0 , zBitMap5  )
	END WINDOW

	zBitMap6 := BT_BitmapCaptureClientArea ( cParent , nRowx , nCol2+2  ,  4 , 4  )

	DEFINE WINDOW &cNSombra3 AT  nRowx - 1  , nCol2  WIDTH 4 HEIGHT 4 TITLE 'Sombra13' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F.  ;
		ON PAINT xSombra3( ThisWindow.Name , zBitMap6 )
	END WINDOW

	HMG_ChangeWindowStyle(  GetProperty(  cNSombra1 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra2 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra3 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	

	BT_ClientAreaInvalidateAll(   cNSombra1 )
	_ShowWindow( cNSombra1 )

	
	BT_ClientAreaInvalidateAll(   cNSombra2 )
	_ShowWindow( cNSombra2 )	

	DoEvents()
	
	BT_ClientAreaInvalidateAll(   cNSombra3 )
	_ShowWindow( cNSombra3 )	

	DoEvents()


    xProcinit(nTipoz)	
	HMG_ChangeWindowStyle( Win_Dialog.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
	

	
	_ShowWindow('Win_Dialog')
    xWaitDlg()	

	
	//xFechaDlg()

	//msginfo('pl2  --')




Return (lRetx)



Function xIndiDlg()

		//msginfo('ok')

	//SysWait(.2)	

	PostMessage( OBTN_Handle( 'Win_Dialog', 6652   ) , WM_MOUSEMOVE , 0,0)
	

	PostMessage( OBTN_Handle( 'Win_Dialog', 6652   ) , WM_MOUSELEAVE , 0,0)

	//SysWait(.2)

Return 



Function xProcinit( nTipoY )

	nIndexDlg22 := Len(_HMG_EventData) + 1	
	CREATE EVENT PROCNAME EventDlg() HWND Win_Dialog.Handle STOREINDEX nIndexDlg22 	


	If (nTipoY != 3)

		OBTN_Create( 'Win_Dialog', 6652,  '&Ok'   , 185, 330 ,  75 ,  30,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont ) 
		OBTN_Font( 'Win_Dialog', 6652,  { cFontName, nFontSize, .F., .F., .F., .F. } )

		nIndexDlg22 := Len(_HMG_EventData) + 1	
		
		CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6652 )  STOREINDEX nIndexDlg22 
		EventProcessAllHookMessage(nIndexDlg22 , .t.)		
		lInstall := .t. 
		
	Else 

		OBTN_Create( 'Win_Dialog', 6653, "&Sim", 185, 505,  80,  30 ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Create( 'Win_Dialog', 6654, hb_ANSIToOEM( "&Não" ), 185, 590 ,  80 ,  30,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

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

	DEFAULT nHandle1 := 0
	//D
	//Do Events


	While nI <= Len(_HMG_EventData)

		If (Valtype( _HMG_EventData[nI][2] ) == 'N') .And. (Valtype( _HMG_EventData[nI][1] ) == 'C')	
			If nHandle1 > 0 
				If  ((_HMG_EventData[nI][1] ==  cEvent ) .And. (_HMG_EventData[nI][2] ==  nHandle1 ))			
					nIndex1 := ni
				End If 	
			Else 
				If  (_HMG_EventData[nI][1] ==  cEvent ) 
					nIndex1 := ni			
				End If 	
			End If 

		End If 	

		ni++
		DoEvents()

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

	Local nHandle3 := DoFindWin('Sombra11')
	Local nHandle4 := DoFindWin('Sombra12')
	Local nHandle5 := DoFindWin('Sombra13')
		
	
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
	

	If nHandle3 > 0		

		
		DO EVENTS
		SendMessage( nHandle3, WM_SYSCOMMAND, SC_CLOSE , 0 )
		DO EVENTS
		DO EVENTS
		SendMessage( nHandle3, WM_SYSCOMMAND, WM_DESTROY , 0 )
		DO EVENTS



	End If 
	

	If nHandle4 > 0		

	
	//	DO EVENTS
		SendMessage( nHandle4, WM_SYSCOMMAND, SC_CLOSE , 0 )
		DoEvents()
	//	DO EVENTS
		SendMessage( nHandle4, WM_SYSCOMMAND, WM_DESTROY , 0 )
		//DO EVENTS

	End If 


	
	If nHandle5 > 0		

	
	//	DO EVENTS
		SendMessage( nHandle5, WM_SYSCOMMAND, SC_CLOSE , 0 )
		DoEvents()
	//	DO EVENTS
		SendMessage( nHandle5, WM_SYSCOMMAND, WM_DESTROY , 0 )
		//DO EVENTS

	End If 


	DoEvents()

	//msginfo('lp11')





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


Function CheckRet( cVar )

	Local lOk := .t.


	If ValType( cVar  ) == 'L'
		lOk := cVar 				
	 End If   

Return (lOk)	 


Function xSombra()
Return 


Function xSombra3( cJanela  , zBmp1 )

	LOCAL Width  := BT_ClientAreaWidth(cJanela)
	LOCAL Height := BT_ClientAreaHeight(cJanela)

	Local BTstruct , BTstruct3
	Local hDC := BT_CreateDC ( cJanela  , BT_HDC_INVALIDCLIENTAREA , @BTstruct)

	Local hB1 := BT_BitmapCreateNew ( Width , Height ,  {135,135,135}  )

	//Local hB1 := BT_BitmapCreateNew ( 4 , 4 ,  RED	  )


	hDC3 := BT_CreateDC ( hB1 , BT_HDC_BITMAP, @BTstruct3 )


	BT_DrawGradientFillHorizontal( hDC , 0,0 , Width , Height , {212,212,212} , {212,212,212}    )

	BT_DrawSetPixel (hDC , 0, 0 , { 143,143,143,143})

	For n1 := 0 to 3

		BT_DrawSetPixel (hDC, 3 , n1 , {241,241,241})
		BT_DrawSetPixel (hDC, n1 , 3 ,  {241,241,241})
		DoEvents()

	Next 


	BT_DrawSetPixel (hDC, 1, 0 , {172,172,172}   )
	BT_DrawSetPixel (hDC, 1, 1 , {172,172,172}   )
	BT_DrawSetPixel (hDC , 0, 1 , {172,172,172}   )


	//DoEvents()

	BT_DrawBitmapAlphaBlend (hDC ,  0 , 0  , 4 ,  4  , 25 , BT_COPY  , zBmp1)
	DoEvents()


	
	
	//Bt_BitmapSaveFile(  zBmp1 , 'Menu11so2mbra.bmp'  )




	

	BT_DeleteDC ( BTstruct )
	BT_DeleteDC ( BTstruct3 )

	BT_BitmapRelease ( hB1 )



Return 
  
Function xSombraHor(  cJanela , nRow1  , nCol1 , zBitmap1   )

	LOCAL Width  := BT_ClientAreaWidth(cJanela)
	LOCAL Height := BT_ClientAreaHeight(cJanela)

	Local BTstruct , BTstruct3

	//Local zBitMap
	Local zBitMap2
	Local zBmp1 

	Local zBmp2

	Local hDC := BT_CreateDC ( cJanela  , BT_HDC_INVALIDCLIENTAREA , @BTstruct)

	Local hB1 := BT_BitmapCreateNew ( Width , Height ,  {135,135,135}  )

	hDC3 := BT_CreateDC ( hB1 , BT_HDC_BITMAP, @BTstruct3 )


	BT_DrawGradientFillHorizontal( hDC3, 0,0 , Width ,1 , {143,143,143} , { 143,143,143,143}    )
	BT_DrawGradientFillHorizontal( hDC3, 1,0 , Width ,1 , {172,172,172} ,  {172,172,172}        )
	BT_DrawGradientFillHorizontal( hDC3, 2,0 , Width ,1 , {212,212,212} , {212,212,212}    )
	BT_DrawGradientFillHorizontal( hDC3, 3,0 , Width ,1 , {241,241,241} , {241,241,241}    )
	BT_DrawGradientFillHorizontal( hDC3, 4,0 , Width ,1 ,  WHITE , WHITE    )

	
	BT_DrawBitmapAlphaBlend (hDC3 ,  0 , 0  , Width ,  5  , 45 , BT_COPY  , zBitmap1)
	DoEvents()


	BT_DrawDCtoDC (hDC, 0, 0, Width ,   5, BT_SCALE, hDC3, 0, 0, Width , 5)
	DoEvents()

	BT_BitmapRelease ( hB1 )
	BT_DeleteDC ( BTstruct )
	BT_DeleteDC ( BTstruct3 )


Return 


Function xSombraVert(  cJanela , nRow1  , nCol1 , zBitmap1   )


	LOCAL Width  := BT_ClientAreaWidth(cJanela)
	LOCAL Height := BT_ClientAreaHeight(cJanela)

    Local lVeritcal := .t.

	Local BTstruct , BTstruct3

	//Local zBitMap
	Local zBitMap2
	Local zBmp1 

	Local zBmp2


	Local hDC := BT_CreateDC ( cJanela  , BT_HDC_INVALIDCLIENTAREA , @BTstruct)
	Local hB1 := BT_BitmapCreateNew ( Width , Height ,  {135,135,135}  )
	hDC3 := BT_CreateDC ( hB1 , BT_HDC_BITMAP, @BTstruct3 )


	If lVeritcal

		BT_DrawGradientFillVertical( hDC3, 0,0 , 1 ,Height , {143,143,143} , { 143,143,143,143}    )
		BT_DrawGradientFillVertical( hDC3, 0,1 , 1 ,Height , {172,172,172} ,  {172,172,172}        )
		BT_DrawGradientFillVertical( hDC3, 0,2 , 1 ,Height , {212,212,212} , {212,212,212}    )
		BT_DrawGradientFillVertical( hDC3, 0,3 , 1 ,Height , {241,241,241} , {241,241,241}    )
		BT_DrawGradientFillVertical( hDC3, 0,4 , 2 ,Height ,  WHITE , WHITE    )

		
		BT_DrawBitmapAlphaBlend (hDC3 ,  0 , 0  , 5,  Height  , 45 , BT_COPY  , zBitmap1)
		DoEvents()


		BT_DrawDCtoDC (hDC, 0, 0, 5 , Height, BT_SCALE, hDC3, 0, 0, 4, Height)
		DoEvents()

	Else 




	End If 

	BT_BitmapRelease ( hB1 )
	BT_DeleteDC ( BTstruct )
	BT_DeleteDC ( BTstruct3 )

Return



Function xSombraZ( cParent , nTop , nLeft  , nWidth , nHeight   )

/*
  nTop  := GetProperTy('Win_Dialog' , 'Row') 
	nLeft := GetProperTy('Win_Dialog' , 'Col')

	
	nCol2 := nLeft + GetProperty('Win_Dialog' , 'Width') 
	nRowX := nTop + 240
	*/	


	Local zBitMap0 := BT_BitmapCaptureClientArea(  cParent ,   nTop + 3  ,  nCol2+2 ,  6  , 220  )
	Local cNSombra1 := 'Sw__1'
	Local cNSombra2 := 'Sw__2'
	Local cNSombra3 := 'Sw__3'
	Local zBitMap5
	Local zBitMap6



	DEFINE WINDOW &cNSombra1 AT nTop + 10 , nCol2 WIDTH 4 HEIGHT nHeight TITLE 'Sombra11' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F. ;
		ON PAINT xSombraVert( ThisWindow.Name , 0  , 0 , zBitMap0  )
	END WINDOW
		
	//nRowX	 := nTop + 
	zBitMap5 := BT_BitmapCaptureClientArea ( cParent , nRowx  ,  nLeft+15   ,  734  , 6  )

	
	DEFINE WINDOW &cNSombra2 AT nRowX, nLeft+15  WIDTH nWidth HEIGHT 4 TITLE 'Sombra12' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent  BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F. ;
		ON PAINT xSombraHor( ThisWindow.Name , 0  , 0 , zBitMap5  )
	END WINDOW

	zBitMap6 := BT_BitmapCaptureClientArea ( cParent , nRowx , nCol2+2  ,  4 , 4  )

	DEFINE WINDOW &cNSombra3 AT  nRowx - 1  , nCol2  WIDTH 4 HEIGHT 4 TITLE 'Sombra13' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent BACKCOLOR BLACK VIRTUAL HEIGHT Nil VISIBLE .F.  ;
		ON PAINT xSombra3( ThisWindow.Name , zBitMap6 )
	END WINDOW

	HMG_ChangeWindowStyle(  GetProperty(  cNSombra1 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra2 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetProperty(  cNSombra3 , 'HANDLE' ), Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
	

	BT_ClientAreaInvalidateAll(   cNSombra1 )
	_ShowWindow( cNSombra1 )

	
	BT_ClientAreaInvalidateAll(   cNSombra2 )
	_ShowWindow( cNSombra2 )	

	DoEvents()
	
	BT_ClientAreaInvalidateAll(   cNSombra3 )
	_ShowWindow( cNSombra3 )	

	DoEvents()

REturn 


