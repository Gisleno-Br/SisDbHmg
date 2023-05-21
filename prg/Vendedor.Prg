#include "dll.ch"
#include <hmg.ch>
#include <dll.ch>
#include "inkey.ch"
#include <minigui.ch>



#include "hbthread.ch"
#include <hmg.ch>
#include <minigui.ch>
#define WM_SETFOCUS 7
#DEFINE CORHEAD1 {110,125,129}
#define SELCOR    {28,157,189}
#define WM_DESTROY          0x0002
#define SC_CLOSE            61536




Function DrawVertL( hDc1, nCol, nHeight1, lSingle, aCorBorda )

	DEFAULT aCorBorda := { 215, 215, 215 }

	DEFAULT lSingle := .f.

	BT_DrawLine ( hDc1, 0, nCol, nHeight1, nCol,   aCorBorda,   1 )

	If !lSingle
		BT_DrawLine ( hDc1, 0, nCol + 1, nHeight1,  nCol + 1,   aCorBorda, 1 )
	End If

Return


Function DrawVertH( hDc1, nRow, nWidth, lSingle, aCorBorda )

	DEFAULT aCorBorda := { 215, 215, 215 }
	DEFAULT lSingle := .f.

	PENCOLOR BLACK

	BT_DrawLine ( hDc1, nRow,  0,  nRow,  nWidth,   aCorBorda, 1 )

	If !lSingle
		BT_DrawLine ( hDc1, nRow + 1, 0,  nRow + 1,  nWidth + 1,  aCorBorda, 1 )
	End If

Return






Function xCloseHint()

	Local nHandle1
	Local nHandle2
	Local nHandle3

	If ( _isWindowDefined( 'Win_Msg' ) ) .And. ;
			( _isWindowDefined( 'WinSombra1' ) ) .And. ;
			( _isWindowDefined( 'WinSombra2' ) )

		nHandle1  := GetFormHandle( 'Win_Msg' )
		nHandle2  := GetFormHandle( 'WinSombra1' )
		nHandle3  := GetFormHandle( 'WinSombra2' )


		If nHandle1 > 0
			HideWindow( nHandle1  )
		End If
		If nHandle2 > 0
			HideWindow( nHandle2  )
		End If
		If nHandle3 > 0
			HideWindow( nHandle3  )
		End If
		DoEvents()
	End If

Return




Function xPaintHint( cJanela, cTexto )

	Local BTstruct2


	Local hDc2 := GetDc( GetFormHandle( cJanela )   )
	LOCAL Width  := BT_ClientAreaWidth  ( cJanela )
	LOCAL Height := BT_ClientAreaHeight ( cJanela )
	Local nTypeText    := BT_TEXT_TRANSPARENT  // + BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION


	BT_DrawGradientFillVertical ( hDC2,   1, 0, Width,    Height - 1,  { 255, 255, 202 }, WHITE  )
	DrawVertH( hDc2, 0, Width, .t. )
	DrawVertH( hDc2, Height - 1, Width, .t. )
	DrawVertL( hDc2, 0, Height, .t. )
	DrawVertL( hDc2, Width - 1, Height, .t. )
	ReleaseDC( GetFormHandle( cJanela ), hDc2  )

Return



Function SysWait( nWait )

	Local iTime := Seconds()
	Local ntim := 0
	DEFAULT nWait := .1

	Do While Seconds() - iTime < nWait
		ntim++
		DoEvents()
	EndDo

Return


Function xPaintSombra( cJanela, nTp )

	Local BTstruct2
	Local hDc2 := GetDc( GetFormHandle( cJanela )   )
	LOCAL Width  := BT_ClientAreaWidth  ( cJanela )
	LOCAL Height := BT_ClientAreaHeight ( cJanela )


	If nTp == 1
		BT_DrawGradientFillHorizontal( hDC2, 0, 0, Width + 2, 1, { 143, 143, 143 }, { 143, 143, 143, 143 }    )
		BT_DrawGradientFillHorizontal( hDC2, 1, 0, Width + 2, 1, { 172, 172, 172 }, { 172, 172, 172 }   )
		BT_DrawGradientFillHorizontal( hDC2, 2, 0, Width + 2, 1, { 241, 241, 241 }, { 241, 241, 241 }     )
	Else
		BT_DrawGradientFillVertical ( hDC2,   0, 0, 1,    Height + 2,  { 143, 143, 143 }, { 143, 143, 143 } )
		BT_DrawGradientFillVertical ( hDC2,   0, 1, 1,    Height + 2,  { 172, 172, 172 }, { 172, 172, 172 }  )
		BT_DrawGradientFillVertical ( hDC2,   0, 2, 1,    Height + 2, { 241, 241, 241 }, { 241, 241, 241 }  )
	End If

	ReleaseDC( GetFormHandle( cJanela ), hDc2  )

Return



Function xTipMenuMain( nTop, nLeft,   cMsg, ERROR, nSeconds, cParent )

	LOCAL nHeight := 20, nWidth := 304

	Local FontHandle
	Local BTstruct
	Local aRt, aRt2


	LOCAL hWnd, aBcolor, nWinRow := nTop, nWinCol := nLeft

	DEFAULT nSeconds := 2
	DEFAULT cParent := 'Main'


	If ValType( ERROR ) = "U"
		aBcolor := { 250, 243, 180 }
	Else
		aBcolor := { 250, 243, 180 }
	Endif


	aRt := GetPos_ScreenToClient( GetFormHandle(  cParent  ),  nTop, nLeft )

	aRt2 := GetPos_ScreenToClient( GetFormHandle(  cParent  ),  nTop + ( nHeight * 2 ), nLeft + 10 )


	If !_isWindowDefined( 'Win_Msg' )


  
	   DEFINE WINDOW Win_Msg AT aRt[1]  , aRt[2] WIDTH nWidth HEIGHT nHeight TITLE ''  ;
			VISIBLE .t. NOMAXIMIZE NOMINIMIZE CHILD PANEL PARENT &cParent  NOSIZE NOSYSMENU NOCAPTION BACKCOLOR YELLOW
         DEFINE LABEL Label_1
            ROW         2
            COL         1
            WIDTH       nWidth - 5
            HEIGHT      12
            VALUE       Alltrim( hb_UTF8ToStr(cMsg)  )
            FONTNAME    'Arial Rounded MT'
            FONTSIZE    8
            FONTBOLD    .F.
            BACKCOLOR   {255,255,202}
            TRANSPARENT .T.
            FONTCOLOR   BLACK
            CENTERALIGN .f.
         END LABEL
      END WINDOW

	Else

		SetProperty( 'Win_Msg', 'Row', aRt[ 1 ] )
		SetProperty( 'Win_Msg', 'Col', aRt[ 2 ] )
		DoEvents()
		xPaintHint( 'Win_Msg', '' )
		DoEvents()

	End If

	SetProperty( 'Win_Msg', 'Label_1', 'Value',  Alltrim( hb_UTF8ToStr(cMsg ) )  )
	DoEvents()
	FontHandle := SendMessage ( GetControlHandle( 'Label_1', 'Win_Msg' ), WM_GETFONT, 0, 0 )
	HMG_ChangeWindowStyle(  GetFormHandle( 'Win_Msg' ), Nil, WS_EX_STATICEDGE,  .t., .T. )
	If _isWindowDefined( 'Win_msg' )
		SetProperty(   'Win_msg', 'Width',  GetTextWidth(  GetDC('Win_Msg' ),  cMsg, FontHandle  )  + 8   )
	End If
   //Horizontal
	If !_isWindowDefined( 'WinSombra1' )


		DEFINE WINDOW WinSombra1 AT nTop + nHeight   , nLeft+6  WIDTH GetTextWidth(  GetDC('Win_Msg')  ,  cMsg , FontHandle  )  + 2  HEIGHT 3 TITLE ''  ;
			VISIBLE .t. NOMAXIMIZE NOMINIMIZE CHILD PANEL PARENT &cParent  NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil
	   END WINDOW


   Else

      SetProperty( 'WinSombra1', 'Width', GetTextWidth(  GetDC('Win_Msg' ),  cMsg, FontHandle  )  + 2   )
      SetProperty( 'WinSombra1', 'Row', nTop + nHeight ) // 3
      SetProperty( 'WinSombra1', 'Col', nLeft + 6 )

   End If


   //Vertical
   If !_isWindowDefined( 'WinSombra2' )

      DEFINE WINDOW WinSombra2 AT nTop + 2 ,  nLeft + 8 + GetTextWidth(  GetDC('Win_Msg')  ,  cMsg , FontHandle  )    WIDTH 3  HEIGHT nHeight  TITLE ''  ;
         VISIBLE .t. NOMAXIMIZE NOMINIMIZE CHILD PANEL PARENT &cParent  NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil
   END WINDOW


   Else

      SetProperty( 'WinSombra2', 'Height', nHeight   )
      SetProperty( 'WinSombra2', 'Row', nTop + 2 ) // 6
      SetProperty( 'WinSombra2', 'Col',  nLeft + 8 + GetTextWidth(  GetDC('Win_Msg' ),  cMsg, FontHandle  )     )

   End If


   HMG_ChangeWindowStyle(  GetFormHandle( 'WinSombra1' ), Nil, WS_EX_STATICEDGE,  .t., .T. )
   HMG_ChangeWindowStyle(  GetFormHandle( 'WinSombra2' ), Nil, WS_EX_STATICEDGE,  .t., .T. )


   If GetFormIndex( 'Win_Msg' ) <= 0
      Return
   End If

   _ShowWindow( 'Win_Msg' )
   DoEvents()

   xPaintHint( 'Win_Msg', '' )
   DoEvents()

   If GetFormIndex( 'WinSombra2' ) <= 0
      Return
   End If

   _ShowWindow( 'WinSombra2' )
   DoEvents()

   If GetFormIndex( 'WinSombra1' ) <= 0
       Return
   End If

   _ShowWindow( 'WinSombra1' )
   xPaintSombra(  'WinSombra1', 1 )
   xPaintSombra(  'WinSombra2', 2 )

   If _IsControlDefined( 'Label_1', 'Win_Msg' )
      SetProperty( 'Win_Msg', 'Label_1', 'Value',  Alltrim( hb_UTF8ToStr(cMsg ) )  )
      DoMethod( 'Win_Msg', 'Label_1', 'Refresh' )
   End If



Return hWnd


Function DoFindWin( cTitle )

	LOCAL nWin := HMG_CallDLL( "User32.dll", DLL_OSAPI, "FindWindow", 0, cTitle )
/*
   If !EMPTY(nWin)
      HMG_CallDLL( "User32.dll", DLL_OSAPI, "SetForegroundWindow", nWin )
      HMG_CallDLL( "User32.dll", DLL_OSAPI, "BringWindowToTop", nWin )
      HMG_CallDLL( "User32.dll", DLL_OSAPI, "ShowWindow", nWin, 1 )
      HMG_CallDLL( "User32.dll", DLL_OSAPI, "UpdateWindow", nWin )
   End If
   */

RETURN nWin




Static Function xOpSelPosy( cJan, nHeit2, nItMax, nItDopred, nHeightCalc, nScroolPos  )

	Local nCol := 0
	Local nRow := 0
	Local ar1
	Local NewPos
	Local nRow1 := -( GetProperty( cJan, "VscrollBar", "Value" ) )
	Local nIa1, nIa2

	Local nItem := 0

	DEFAULT nHeit2 := 0
	DEFAULT nItDopred := 0

	DEFAULT nHeightCalc := nItemSubHeight

	DEFAULT nScroolPos := GetScrollPos( GetFormHandle(  cJan  ), 1 )

	GetCursorPos ( @nCol, @nRow )


	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJan  ), nRow, nCol )




	NewPos := nScroolPos


	If NewPos > 0
		nItem := ( Int( (NewPos +Ar1[ 1 ] )     / nHeightCalc ) + 1 )
	Else
		nItem := ( Int(  Ar1[ 1 ]  / nHeightCalc ) + 1 )
	End If



	If ( nHeit2 > 0 ) .and. ( nHeit2 < ar1[ 1 ] ) .And. ( nHeit2 >= nHeightCalc ) .And. ( ar1[ 1 ] > ( nItMax * nHeightCalc )   )
		nItem := ( Int( NewPos + (Ar1[ 1 ] - nHeit2 ) / nHeightCalc ) + 1 )
	End If

	If ( Ar1[ 1 ] - nHeit2 ) == 1
		nItem := nItDopred + 1
	End If

Return Abs( nItem )





