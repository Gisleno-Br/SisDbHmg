#include <hmg.ch>
#include <minigui.ch>

#define WM_SETFOCUS 7

//25-09

Static nIndexDialog  := 0

STATIC lTracking45 := .F.

STATIC nIndexDlg22 := 0
STATIC nIndexDlg23 := 0
STATIC nIndexDlg24 := 0



DEFINE WINDOW main
DECLARE WINDOW fSplit6


#define WM_DESTROY          0x0002
#define SC_CLOSE            61536



DECLARE WINDOW fDialogo

Function yAviso2( cMensagem , lEfect  )


	Local aMx := {}
	Local n   := 0

	
	
	Default lEfect := .t.


	If lEfect	
		aMx := yEfect(  cActiveJan  )	
	End If 	

	MsgAviso( cMensagem , 1)	

	n := 0

	SysWait(.2)

	While isWindowVisible( fDiaLogo.Handle )
		  n++	
		  Do Events 
	Enddo 

	
	If lEfect	
		EfectEnd(cActiveJan , aMx )
    End If		


Return 	


FUNCTION yAviso( cMsgx1 , lEfect )

	//PRIVATE nTipo := 1

	PRIVATE cBmpx1 :=  "img\aviso1.bmp"
	PRIVATE cMensagem := "Aviso"

	PRIVATE cJanxDialog := 'fDialogo'

	
	PRIVATE cMsg1 := cMsgx1
	

	//Private nIndexDlg22 := 0


	PRIVATE lRet := .F.

	Private cDiaName := 'fDialogo'

	
	Private n20 := 0
	Private n21 := 0


  
	yAviso2( cMsgx1 , lEfect  )

Return 	



FUNCTION ConfirmAviso( cMsgx1,  cJanPadrao ,  lEfect )

return 
/*

	
	Local aMx := {}
	Local n   := 0
	//PRIVATE lRetx := .F.

//	PRIVATE nTipo := 2

	PRIVATE cBmpx1 := "img\pergunta1.bmp" 
	PRIVATE cMensagem := "Confirme Para Prosseguir" 

	PRIVATE cJanxDialog := 'fDialogo'


	PRIVATE cMsg1 := cMsgx1

	PRIVATE lRet := .F.



	//Private nIndexDlg22 := 0



	
	Default lEfect := .t.	

	If lEfect	
		aMx := yEfect(  cActiveJan  )	
	End If 	



	MsgAviso( cMsgx1, 2 )

	n := 0




//	msginfo('Passou')



//	If lEfect
//		EfectEnd(cActiveJan , aMx )		
//	End If



RETURN lRetx

*/



FUNCTION MsgAviso( cMsg1, nTipo )


	Local cSaveJan := cActiveJan
	LOCAL nFontSize := 8
	lOCAL cJanxDialog := 'fDialogo'



	REQUEST HB_LANG_PT
	REQUEST HB_CODEPAGE_PT850




//	msginfo('232')

	If !IsWindowDefined('fDialogo')
		Load Window fDialogo
	End If 	


	//nIndexDlg   := EventCreate (  { ||   EventDlg( )} , fDiaLogo.Handle   )

	//EventProcessAllHookMessage(nIndexDlg22   := EventCreate (  { ||   EventDlg( )} , fDialogo.Handle  ) , .t.)


	Center Window fDialogo

	//HB_SETCODEPAGE("UTF8")

	HB_SETCODEPAGE("PT850")

	InstallEventHandler( "EventDlg" )


	
	SetProperty( "fDialogo", "lblMsg", "Value",   cMsg1     )



	SetProperty( "fDialogo", "Label_1", "Value",   Hb_AnsiToOem("Aviso\Informação")     )

	If nTipo == 2
		SetProperty( "fDialogo", "Label_1", "Value",   "Confirme"     )
	End If 


	//cActiveJan := 'fDialogo'

	If nTipo == 2
		SetProperty( "fDialogo", "Image_1","Picture" , "img\Interrogacao.png" )
		SetProperty( "fDialogo", "Label_1","Value" , "Pergunta" )
	End If


	


	If nTipo == 1


		OBTN_Create( cJanxDialog, 6652, "&Ok", 205, 245,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Font( cJanxDialog, 6652,  { cFontName , nFontSize, .F., .F., .F., .F. } )

		EventProcessAllHookMessage( n20 := EventCreate( {|| InputEv2(cJanxDialog ) },    OBTN_Handle( cJanxDialog, 6652 )   ), .T. )


		OBTN_Focus( cJanxDialog, 6652, .t. )

	Else

		HB_SetCodePage( "UTF8")

		OBTN_Create( cJanxDialog, 6653, "&Sim", 205, 375,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Create( cJanxDialog, 6654,  "&Nao" , 205 , 438,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

		OBTN_Font( cJanxDialog, 6653,  { cFontName, nFontSize, .F., .F., .F., .F. } )
		OBTN_Font( cJanxDialog, 6654,  { cFontName, nFontSize, .F., .F., .F., .F. } )

		EventProcessAllHookMessage( n20 := EventCreate( {|| InputEv2(cJanxDialog ) },    OBTN_Handle( cJanxDialog, 6653 )   ), .T. )
		EventProcessAllHookMessage( n21 := EventCreate( {|| InputEv2(cJanxDialog ) },    OBTN_Handle( cJanxDialog, 6654 )   ), .T. )


		OBTN_Focus( cJanxDialog, 6653, .t. )


	End If 

//	SysWait(.2)


	fDialogo.Show()
	
 
	If nTipo == 1
		PushButton(   'fDialogo'  , 6652 )
	Else 
		PushButton(   'fDialogo'  , 6653 )
		PushButton(   'fDialogo'  , 6654 )
	End If 	

	
	HMG_ChangeWindowStyle( fDialogo.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
	HMG_ChangeWindowStyle( fDialogo.Handle, WS_EX_STATICEDGE, NIL, .T., .T. )

	//RefreshAll('fDialogo')

	fDialogo.SetFocus()


/*
	If nTipo > 1
		sysWait(.2)
		PostMessage( OBTN_Handle( cJanxDialog, 6653 ) ,0,0,WM_MOUSEMOVE )		
	End If 	

	*/



RETURN lRet


Function RlesaBt()

	Local n1

	For n1 := 6652 to 6554
		Obtn_Release('fDialogo',n1)
	Next


Return


FUNCTION xIniDialog( nTp )

	LOCAL cJanx := 'fDialogo'
	LOCAL nFontSize := 8


	IF nTp == 1



		OBTN_Create( cJanxDialog, 6652, "&Ok", 205, 245,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Font( cJanxDialog, 6652,  { cFontName, nFontSize, .F., .F., .F., .F. } )

		EventProcessAllHookMessage( n20 := EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6652 )   ), .T. )

	ELSE

		HB_SetCodePage( "UTF8")

		OBTN_Create( cJanx, 6653, "&Sim", 205, 375,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Create( cJanx, 6654,  "&Nao" , 205 , 438,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

		OBTN_Font( cJanx, 6653,  { cFontName, nFontSize, .F., .F., .F., .F. } )
		OBTN_Font( cJanx, 6654,  { cFontName, nFontSize, .F., .F., .F., .F. } )

		EventProcessAllHookMessage( n20 := EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6653 )   ), .T. )
		EventProcessAllHookMessage( n21 := EventCreate( {|| InputEv2(cJanx ) },    OBTN_Handle( cJanx, 6654 )   ), .T. )

	END IF



RETURN




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


		IF ( nMsg == WM_MOUSEMOVE ) .And. ;
		   (nHWnd == GetProperty(  cMenuName, "HANDLE" ))

			/*

			lTracking45 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag

			OBTN_Color( cFormx, nIdBut, RetColor1( 2 ), .T. )

			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )
			*/

//			msginfo('ok2')


		END IF








	If nHWnd == GetProperty(  cMenuName, "HANDLE" )

		If nMsg == WM_DRAWITEM




			If ( nWParam >=  6652 ) .AND.  ( nWParam <=  6669 )


				nCol1:=0
				nRow1 := 0

				GetCursorPos (@nCol1, @nRow1)

				hWnd1 := WindowFromPoint (nCol1, nRow1)

				cFormName := ''
//				GetFormNameByHandle (hWnd1, @cFormName )
//				msginfo(cFormName)

				cControl := ''	
				cForm    := ''

				GetControlNameByHandle(hWnd1, @cControl, @cForm)


				OBTN_Draw( nHWnd,  nwParam, nLParam , .t.)
			End If

			If ( nWParam >=  50 ) .AND.  ( nWParam <=  360 )
				OBTN_Draw( nHWnd,  nwParam, nLParam )
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
				 xFechaDlg()
			End If 



			If nId == 6653

				lRetx := .T.			
				
				//PushButton( cMenuName , nId  )
				xFechaDlg()			

			End If 

			If nId == 6654

				//PushButton( cMenuName , nId  )
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

	//DEFAULT cFormx := 'fDialogo'

	// LOCAL n1
	If (Alltrim(cFormx) = "Win_Dialog")
		For n1 := 6652 TO 6659
			If ( OBTN_Handle( cFormx, n1 ) == nHWnd )
				If nIdBut == 0
					nIdBut := n1
				End If 
			End If
		Next
	End If


   /*
	If (alltrim(cJan1) != "Win_Dialog")

		FOR n1 := 1 TO 100
			IF ( OBTN_Handle( cJan1, n1 ) == nHWnd )
				IF nIdBut == 0
					cFormx := cJan1
					//msginfo( Str(n1) )
					nIdBut := n1
				END IF
			END IF
		NEXT
	End If
	*/



 /*

	If (Alltrim(cJan1) = "fProgress")
		cFormx := cJan1
		IF ( OBTN_Handle( 'fProgress' , 6670 ) == nHWnd )
			nIdBut := 6670
		End If
	End If

	*/



	IF ( nIdBut > 0 )

		If ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking45)

			lTracking45 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag


			
			


		//	OBTN_Focus( cFormx, nIdBut, .T. )

			OBTN_Color( cFormx, nIdBut, RetColor1( 2 ), .T. )

			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )


		End If



		If ( nMsg == WM_MOUSELEAVE )

			
		//	OBTN_Focus( cFormx, nIdBut, .f. )

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

//	LOCAL nTxColorE  := WHITE 
	//LOCAL nFrColorE  := RED


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



FUNCTION xMsgRun( cMsg1  , bBlock )

	PRIVATE cJanxDialog := 'fDialogo'

	Private BlockRun := bBlock

	DEFAULT cMsg1 := ''
	//  DEFAULT nTipo := 1

	PRIVATE cBmpx1 :=  "img\aviso1.bmp"

	PRIVATE cMensagem := cMsg1

	PRIVATE lRet := .F.


	Load Window fProgress


	HMG_ChangeWindowStyle( fProgress.Handle    , WS_BORDER, NIL, .F., .T.)
	HMG_ChangeWindowStyle( fProgress.Handle    , NIL, WS_EX_STATICEDGE, .T., .T.)

	SetProperty('fProgress','LblMsg','Value', cMsg1  )


	Center Window fProgress


	Activate Window fProgress

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


Function xProcDlg(  cText   )

	LOCAL Width     := BT_ClientAreaWidth  ( ThisWindow.Name ) 
	Local aRGBcolor := { 9, 111, 137 }

	Local nTypeText    := BT_TEXT_TRANSPARENT
	//+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

	//LOCAL hDC2
	Local BTstruct2	
	
	Local hDC2 := BT_CreateDC ( ThisWindow.Name, BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )

	
	BT_DrawGradientFillVertical ( hDC2 ,  0,  0,  Width, 20 , aRGBcolor , BLACK )


	BT_DrawGradientFillVertical ( hDC2 ,  195 ,  0 , 571 ,  55 ,   { 238,238,238}, {  244,244,244 } )

	
	BT_DrawText (hDC2 , 120 , 15 , alltrim(cText) , "arial", 9, BLACK ,  BLACK, nTypeText, nAlingText, nOrientation)


	BT_DeleteDC ( BTstruct2 )



REturn 

Function xDialog( cMsg1 , lAsk1  )
	

	//ON PAINT xProcDlg()

	Local nTop  
	Local nLeft

	Local lRet := .f. 

	Default lAsk1 := .f. 

	Private lRetx := .F.

  /*
	DEFINE WINDOW Win_Dialog AT 0, 0 WIDTH 450 HEIGHT 247 TITLE 'xDialog1' 
		 NOMAXIMIZE NOMINIMIZE NOSIZE  NOSYSMENU NOCAPTION CHILD BACKCOLOR WHITE ;
		ON PAINT xProcDlg(  cMsg1 )
	END WINDOW

*/









	
	DEFINE WINDOW Win_Dialog ;
		AT 0,0 ;
		WIDTH 450 HEIGHT 247 ;
		TITLE 'xDialog1'  ;		
		MODAL NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE ;
		ON PAINT xProcDlg(  cMsg1 )
	END WINDOW	


	

	//sginfo( Str( GetProperty('Win_Dialog' , 'Row') )    )

	


    DEFINE IMAGE Image_1
		PARENT Win_Dialog
        ROW    37
        COL    20
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
        ROW    95
        COL    20
        WIDTH  120
        HEIGHT 24
        VALUE Hb_AnsiToOem("Aviso Informação")
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




	CENTER WINDOW Win_Dialog 	

	nTop  := GetProperTy('Win_Dialog' , 'Row')
	nLeft := GetProperTy('Win_Dialog' , 'Col')


	
	

	DEFINE WINDOW WinSombra2 AT nTop + 12 , nLeft+15 WIDTH 440 HEIGHT 240 TITLE 'Sombra2' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
			ON PAINT xSombra( ThisWindow.Name , nTop + 6 , nLeft+5  )
	END WINDOW
	

	
	HMG_ChangeWindowStyle( Win_Dialog.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
	HMG_ChangeWindowStyle( Win_Dialog.Handle, WS_EX_STATICEDGE, NIL, .T., .T. )


	xProcinit( lAsk1 )

	WinSombra2.Show()

	Bt_ClientAreaInvalidateAll('WinSombra2')
	
	ACTIVATE WINDOW Win_Dialog

	






Return (lRetx)


Function xProcinit( lPergunta )

	nIndexDlg22 := Len(_HMG_EventData) + 1	
	CREATE EVENT PROCNAME EventDlg() HWND Win_Dialog.Handle STOREINDEX nIndexDlg22 
	

	If (!lPergunta)

		OBTN_Create( 'Win_Dialog', 6652,  '&Ok'   , 160, 166 ,  75 ,  30,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont , 'OKVERDE1'  , 3 , 'OKVERDE2')

		OBTN_Font( 'Win_Dialog', 6652,  { cFontName, nFontSize, .F., .F., .F., .F. } )




		nIndexDlg22 := Len(_HMG_EventData) + 1	
		
		CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6652 )  STOREINDEX nIndexDlg22 
		EventProcessAllHookMessage(nIndexDlg22 , .t.)


	Else 

		OBTN_Create( 'Win_Dialog', 6653, "&Sim", 162, 292,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
		OBTN_Create( 'Win_Dialog', 6654, hb_ANSIToOEM( "&Não" ), 162, 355 ,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

		OBTN_Font( 'Win_Dialog', 6653,  { cFontName, nFontSize, .F., .F., .F., .F. } )
		OBTN_Font( 'Win_Dialog', 6654,  { cFontName, nFontSize, .F., .F., .F., .F. } )

		nIndexDlg22 := Len(_HMG_EventData) + 1	
		//EventProcessAllHookMessage(nIndexDlg22   := EventCreate (  { ||   InputEv2( )} , OBTN_Handle( 'Win_Dialog', 6653 ) ) , .t.)
	    CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6653 )  STOREINDEX nIndexDlg22 

		EventProcessAllHookMessage(nIndexDlg22 , .t.)


		nIndexDlg22 := Len(_HMG_EventData) + 1	
		//EventProcessAllHookMessage(nIndexDlg22   := EventCreate (  { ||   InputEv2( )} , OBTN_Handle( 'Win_Dialog', 6654 ) ) , .t.)
		CREATE EVENT PROCNAME InputEv2() HWND OBTN_Handle( 'Win_Dialog', 6654 )  STOREINDEX nIndexDlg22 
		EventProcessAllHookMessage(nIndexDlg22 , .t.)



	End If 		


	
	nIndexDialog := Len(_HMG_EventData)	
	BT_ClientAreaInvalidateAll('Win_Dialog')



Return 


Function xFindEvent(  cEvent , nHandle1 )
  Local nIndex1 := Ascan( _HMG_EventData  , { |a|  Iif( ( ValType(a[2]) == "N") .And. (a[2] > 0) , ;
   ((a[1] ==  cEvent ) .And. (a[2] ==  nHandle1 )) , Nil )   })

Return (nIndex1)

Function xFechaDlg()

	
	Local nHandle1  := DoFindWin("xDialog1")

	Local nHandle2  := DoFindWin("Sombra2")


	Local nIndex1 := xFindEvent(  'EventDlg()' ,  Win_Dialog.Handle) 
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

		
		//AnimateWindow(nHandle1, (1*21500), (AW_BLEND + AW_HIDE))

		nSeconds := 1
		/*
   		AnimateWindow(nHandle1, (nSeconds*300), AW_VER_NEGATIVE)
   		hb_IdleSleep(nSeconds)
   		AnimateWindow(nHandle1, (nSeconds*1500), (AW_BLEND + AW_HIDE))
		   */



		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )

	//	Do Events
	//	Do Events


		SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )

	//	Do Events

		//SysWait(.2)

	//	Win_Dialog.Release()

	End If 
	


	

	If nHandle2 > 0

//		msginfo('ok')
		
		SendMessage( nHandle2, WM_SYSCOMMAND, SC_CLOSE , 0 )

	//	SysWait(.1)
		SendMessage( nHandle2, WM_SYSCOMMAND, WM_DESTROY , 0 )


	//	SysWait(.1)

		//msginfo('ok')


	End If 




Return 


