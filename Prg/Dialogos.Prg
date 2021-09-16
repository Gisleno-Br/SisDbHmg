#include <hmg.ch>
#include <minigui.ch>

#define WM_SETFOCUS 7


STATIC lTracking45 := .F.



DEFINE WINDOW main
DECLARE WINDOW fSplit6















DECLARE WINDOW fDialogo
//DECLARE WINDOW fCadCli

// REQUEST HB_LANG_PT
// REQUEST HB_CODEPAGE_PT850

FUNCTION yAviso( cMsgx1 , lEfect  ,  cJanExtra  )

	LOCAL cControl := ''
	LOCAL cForm    := ''
	LOCAL cFormName := ''
	Local cSalvaD := cDiaName
	Local cSave1    := cDiaName
	Local aL1
	Local al2
	Local aL3
	Local aL4
	Local aL5
	Local l1 := .f.



	Default lEfect := .t.
	//Default lCadJan := .t.
	Default cJanExtra := ''

	Private n20 := 0
	Private n21 := 0


	cDiaName := 'fDialogo'
	//cActiveJan := cDiaName


	//GetFormNameByHandle ( GetActiveWindow(), @cFormName )

	//GetFormNameByHandle (  cActiveJan, @cFormName )

	cFormName := cActiveJan

	lAtivaBlack := (Alltrim(cFormName) != "Main" )

	BT_BitmapRelease (hBit10)
	BT_BitmapRelease (hBit11)
	BT_BitmapRelease (hBit12)
	BT_BitmapRelease (hBit20)

	xCaptJan(cActiveJan)


	Flag_AlphaBlend_Effect := .T.

	If lEfect
		Grayness_effect_start(  cActiveJan )
		ShowButTop( .f. )
	End If



	If _isWindowDefined('fSplit5')
		If isWindowVisible(  GetFormHandle( 'fSplit5')    )
		DoMethod( 'fSplit5'  , 'Hide')
	End If
End If

//msginfo('ok2')

msgAviso( cMsgx1 )

Grayness_effect_End(  cActiveJan )
lAtivaBlack := .f.

If !ResButSel()
	ShowButTop( .t. )
End If

cDiaName := cSalvaD

If !Empty(cJanExtra)
Domethod( cJanExtra , 'SetFocus')
End If




RETURN


FUNCTION ConfirmAviso( cMsgx1,  cJanPadrao ,  lEfect )

	LOCAL cControl := ''
	LOCAL cForm    := ''
	LOCAL cFormName := ''
	LOCAL lOk := .F.
	Local cSalvad := cDiaName
	Local al1 := {}


	PRIVATE lRetx := .F.
	Private n20 := 0
	Private n21 := 0

	cDiaName := 'fDialogo'

	Default cJanPadrao := 'Main'

	DEfault lEfect := .t.

	cFormName := cJanPadrao


	BT_BitmapRelease (hBit10)
	BT_BitmapRelease (hBit11)
	BT_BitmapRelease (hBit12)

	//msginfo('l32')



	If lEfect

		lAtivaBlack := (Alltrim(cFormName) != "Main" )

		xCaptJan(cFormName)
		Flag_AlphaBlend_Effect := .T.

		Grayness_effect_start(  cFormName )
		ShowButTop( .f. )
	DoMethod( 'fSplit5'  , 'Hide')

End If



msgAviso( cMsgx1, 2 )

If lEfect

	Grayness_effect_End(  cFormName )
	lAtivaBlack := .f.

	Flag_AlphaBlend_Effect := .f.


	If !ResButSel()
		ShowButTop( .t. )
	End If

End If

cDiaName := cSalvaD

RETURN lRetx


FUNCTION MsgAviso( cMsg1, nTipo )


	Local cSaveJan := cActiveJan

	PRIVATE cJanxDialog := 'fDialogo'

	cActiveJan := 'fDialog'

	DEFAULT cMsg1 := ''
	DEFAULT nTipo := 1

	Private nIndexDlg22 := 0

	PRIVATE cBmpx1 := iif( nTipo == 1, "img\aviso1.bmp", "img\pergunta1.bmp" )

	PRIVATE cMensagem := iif( nTipo == 1, "Aviso", "Confirme Para Prosseguir" )

	PRIVATE lRet := .F.


	REQUEST HB_LANG_PT
	REQUEST HB_CODEPAGE_PT850



//	msginfo('232')
	Load Window fDialogo


	//nIndexDlg   := EventCreate (  { ||   EventDlg( )} , fDiaLogo.Handle   )

	EventProcessAllHookMessage(nIndexDlg22   := EventCreate (  { ||   EventDlg( )} , fDialogo.Handle  ) , .t.)

	Center Window fDialogo

	HB_SETCODEPAGE("UTF8")
	HB_SETCODEPAGE("PT850")

	SetProperty( "fDialogo", "lblMsg", "Value",  HB_AnsiToOem(    AllTrim( cMsg1 )  )     )

	cActiveJan := 'fDialogo'

	If nTipo == 2
		SetProperty( "fDialogo", "Image_1","Picture" , "img\Interrogacao.png" )
		SetProperty( "fDialogo", "Label_1","Value" , "Pergunta" )
	End If



	Activate Window fDialogo

	cActiveJan := cSaveJan

	If nIndexDlg22 > 0
		EventRemove(nIndexDlg22)
		//msginfo('removioo')
	End If


	If n20 > 0
		EventRemove(n20)
	End If

	If n21 > 0
		EventRemove(n21)
	End If




RETURN lRet

Function RlesaBt()

	Local n1

	For n1 := 6652 to 6554
		Obtn_Release('fDialogo',n1)
	Next


Return


FUNCTION xIniDialog( nTp )

	LOCAL cJanx := cJanxDialog
	LOCAL nFontSize := 8

	//PushButton( 'fFiltro' , 6602 )

	//msginfo('here')

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

	//msginfo('here')

	//InstallEventHandler( "EventDl1" )

	//SysWait(.3)

RETURN



//FUNCTION EventDlg( nHWnd, nMsg, nWParam, nLParam )
FUNCTION EventDlg()

	LOCAL nID
	LOCAL ButHnd
	LOCAL nRow, nCol
	LOCAL nind1
	LOCAL cMenuName := cDiaName
	Local cForm
	Local cControl

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	Local nLParam  := EventLPARAM()


	IF !_IsWindowDefined ( cMenuName )
		Return
	END IF

	IF nHWnd == GetProperty(  cMenuName, "HANDLE" )

		IF nMsg == WM_DRAWITEM

			IF ( nWParam >=  6652 ) .AND.  ( nWParam <=  6669 )
				OBTN_Draw( nHWnd,  nwParam, nLParam )
			END IF

			IF ( nWParam >=  50 ) .AND.  ( nWParam <=  360 )
				OBTN_Draw( nHWnd,  nwParam, nLParam )
			END IF


		END IF

		IF nMsg == 273

			nID := LoWord( nWParam )

			If ((nId >= 50) .And. (nId <= 360))

				nIe1 := Ascan(aRotHnd , { |a|a[1] == nId } )

				If (nIe1 > 0)

					//msginfo('k33')
					//PushButton( aRotHnd[nIe1][3]  , nId )
					//	SysWait(.2)

					//OBTN_Visible( cMenuName, nId , .T. )
					//msginfo('k33')

					//		SysWait(.2)

					PushButton( aRotHnd[nIe1][3]  , nId  )

//
					//BT_ClientAreaInvalidateAll ( cMenuName )

					//m
					//	SysWait(.3)

					//	OBTN_Visible( cMenuName, nId , .T. )
					//	SysWait(.2)

					Eval( aRotHnd[nIe1][2]  )


					//BT_ClientAreaInvalidateAll ( 'fCadCli' )
					//	SysWait(.2)

					//_showwindow('fCadCli')

					//PostMessage(  GetFormHandle('fCadCli') , WM_PAINT ,0,0)


					//SysWait(.1)

					//msginfo('k33 444')

					//OBTN_Focus( cMenuName, nId , .f. )

					//SysWait(.3)

					//sginfo('k33 44  777 4')




				End If

			End If



			IF nID == IDOK
				nID := GetDlgCtrlID( GetFocus() )
			ENDIF

			IF nId == 6652

				_ReleaseWindow("fDialogo")
				// Do Events
			END IF

			IF nId == 6653

				lRetx := .T.
				_ReleaseWindow("fDialogo")

				//DoMethod("fdialogo","Hide")

			END IF

			IF nId == 6654
				lRetx := .F.
				_ReleaseWindow("fDialogo")
				//DoMethod("fdialogo","Hide")
			END IF

			IF nId == 6601

			END IF


		END IF

	END IF

RETURN

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





FUNCTION InitDlg( aHandle, nTp1 )

	xIniDialog( nTp1 )

	//msginfo('2')

	HMG_ChangeWindowStyle( aHandle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
	HMG_ChangeWindowStyle( aHandle, WS_EX_STATICEDGE, NIL, .T., .T. )

	//msginfo('3')

RETURN


FUNCTION InitProgress( aHandle, nTp1 )

	xIniProgress( nTp1 )

	//msginfo('2')

	//HMG_ChangeWindowStyle( aHandle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
	//HMG_ChangeWindowStyle( aHandle, WS_EX_STATICEDGE, NIL, .T., .T. )
	//msginfo('3')


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

RETURN iif( nInd1 == 1, aBtnColor, aBtnSel )



FUNCTION xMsgRun( cMsg1  , bBlock )

	PRIVATE cJanxDialog := 'fDialogo'

	Private BlockRun := bBlock

	DEFAULT cMsg1 := ''
	//  DEFAULT nTipo := 1

	PRIVATE cBmpx1 :=  "img\aviso1.bmp"

	PRIVATE cMensagem := cMsg1

	PRIVATE lRet := .F.


	Load Window fProgress


	//HMG_ChangeWindowStyle( fProgress.Handle    , 0x00010200 , NIL, .F., .F.)
	//HMG_ChangeWindowStyle( fProgress.Handle  ,WS_EX_TOOLWINDOW  , NIL, .t., .t.)


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
			OBTN_Create( cJanx, 6654, hb_ANSIToOEM( "N�o" ), 185, 435,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

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


	//msginfo('here')

	//InstallEventHandler( "EventDl1" )

RETURN



