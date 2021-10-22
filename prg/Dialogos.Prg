#include <hmg.ch>
#include <minigui.ch>

#define WM_SETFOCUS 7

//25-09

STATIC lTracking45 := .F.



DEFINE WINDOW main
DECLARE WINDOW fSplit6



DECLARE WINDOW fDialogo
//DECLARE WINDOW fCadCli

// REQUEST HB_LANG_PT
// REQUEST HB_CODEPAGE_PT850


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
	

	Private nIndexDlg22 := 0


	PRIVATE lRet := .F.

	Private cDiaName := 'fDialogo'

	
	Private n20 := 0
	Private n21 := 0


  
	yAviso2( cMsgx1 , lEfect  )

Return 	



FUNCTION ConfirmAviso( cMsgx1,  cJanPadrao ,  lEfect )

	
	Local aMx := {}
	Local n   := 0
	PRIVATE lRetx := .F.

//	PRIVATE nTipo := 2

	PRIVATE cBmpx1 := "img\pergunta1.bmp" 
	PRIVATE cMensagem := "Confirme Para Prosseguir" 

	PRIVATE cJanxDialog := 'fDialogo'


	PRIVATE cMsg1 := cMsgx1

	PRIVATE lRet := .F.



	Private nIndexDlg22 := 0



	
	Default lEfect := .t.	

	If lEfect	
		aMx := yEfect(  cActiveJan  )	
	End If 	



	MsgAviso( cMsgx1, 2 )

	n := 0

	

	While isWindowVisible( fDiaLogo.Handle )
		  n++	
		  Do Events 
		  //fDialogo.SetFocus()
	Enddo 


//	msginfo('Passou')



	If lEfect
		EfectEnd(cActiveJan , aMx )		
	End If


	//cDiaName := cSalvaD

RETURN lRetx



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

	EventProcessAllHookMessage(nIndexDlg22   := EventCreate (  { ||   EventDlg( )} , fDialogo.Handle  ) , .t.)


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

Function xFechaDlg()

					
		DestroyWindow(   OBTN_Handle('fDialogo' , 6652)    )
		DestroyWindow(   OBTN_Handle('fDialogo' , 6653)    )
		DestroyWindow(   OBTN_Handle('fDialogo' , 6654)    )
		
   	   fDialogo.Hide()

	   RemoveHandler( "EventDlg" )



Return 

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
	LOCAL cMenuName := 'fDialogo'
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


	If nHWnd == GetProperty(  cMenuName, "HANDLE" )

		If nMsg == WM_DRAWITEM

			If ( nWParam >=  6652 ) .AND.  ( nWParam <=  6669 )
				OBTN_Draw( nHWnd,  nwParam, nLParam )
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

FUNCTION InputEv2( cJan1 )

	//STATIC lTracking45 := .F.



	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  nLParam := EventLPARAM()

	LOCAL cFormx := 'fDialogo'


	LOCAL nind1
	LOCAL nIdBut := 0

	LOCAL n1
	LOCAL ButHnd

	lTracking45 := .F.

	//DEFAULT cFormx := 'fDialogo'

	// LOCAL n1
	If (Alltrim(cJan1) = "fDialogo")
		FOR n1 := 6652 TO 6659
			IF ( OBTN_Handle( cFormx, n1 ) == nHWnd )
				IF nIdBut == 0
					nIdBut := n1
				END IF
			END IF
		NEXT
	End If


	If (alltrim(cJan1) != "fDialogo")

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



	If (Alltrim(cJan1) = "fProgress")
		cFormx := cJan1
		IF ( OBTN_Handle( 'fProgress' , 6670 ) == nHWnd )
			nIdBut := 6670
		End If
	End If



	IF ( nIdBut > 0 )

		IF ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking45)

			lTracking45 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag

			OBTN_Color( cFormx, nIdBut, RetColor1( 2 ), .T. )

			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

		END IF


		IF ( nMsg == WM_MOUSELEAVE )

			OBTN_Color( cFormx,  nIdBut, RetColor1( 1 ), .T. )
			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

			lTracking45 := .F.

		END IF
	ELSE

	END IF

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


			OBTN_Create( cJanxDialog, 6652, "Ok", 185, 245,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
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


Function xProcDlg()

	LOCAL Width     := BT_ClientAreaWidth  ( ThisWindow.Name ) 
	Local aRGBcolor := { 9, 111, 137 }

	//LOCAL hDC2
	Local BTstruct2	
	
	Local hDC2 := BT_CreateDC ( ThisWindow.Name, BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )

	
	BT_DrawGradientFillVertical ( hDC2 ,  0,  0,  Width, 20 , aRGBcolor , BLACK )


	BT_DrawGradientFillVertical ( hDC2 ,  195 ,  0 , 571 ,  55 ,   { 238,238,238}, {  244,244,244 } )



	BT_DeleteDC ( BTstruct2 )


REturn 



