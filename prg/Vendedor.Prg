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



Function xSombra3( cJanela, zBmp1 )

	LOCAL Width  := BT_ClientAreaWidth( cJanela )
	LOCAL Height := BT_ClientAreaHeight( cJanela )

	Local BTstruct, BTstruct3
	Local hDC := BT_CreateDC ( cJanela, BT_HDC_INVALIDCLIENTAREA, @BTstruct )

	Local hB1 := BT_BitmapCreateNew ( Width, Height,  { 135, 135, 135 }  )
	hDC3 := BT_CreateDC ( hB1, BT_HDC_BITMAP, @BTstruct3 )


	BT_DrawGradientFillHorizontal( hDC, 0, 0, Width, Height, { 212, 212, 212 }, { 212, 212, 212 }    )

	BT_DrawSetPixel ( hDC, 0, 0, { 143, 143, 143, 143 } )

	For n1 := 0 to 3

		BT_DrawSetPixel ( hDC, 3, n1, { 241, 241, 241 } )
		BT_DrawSetPixel ( hDC, n1, 3,  { 241, 241, 241 } )
		//DoEvents()

	Next


	BT_DrawSetPixel ( hDC, 1, 0, { 172, 172, 172 }   )
	BT_DrawSetPixel ( hDC, 1, 1, { 172, 172, 172 }   )
	BT_DrawSetPixel ( hDC, 0, 1, { 172, 172, 172 }   )


// DoEvents()

	BT_DrawBitmapAlphaBlend ( hDC,  0, 0, 4,  4, 25, BT_COPY, zBmp1 )
	//DoEvents()

	BT_DeleteDC ( BTstruct )
	BT_DeleteDC ( BTstruct3 )

	BT_BitmapRelease ( hB1 )

Return

Function xSombraHor(  cJanela, nRow1, nCol1, zBitmap1   )

	LOCAL Width  := BT_ClientAreaWidth( cJanela )
	LOCAL Height := BT_ClientAreaHeight( cJanela )

	Local BTstruct, BTstruct3


	Local zBitMap2
	Local zBmp1

	Local zBmp2

	Local hDC := BT_CreateDC ( cJanela, BT_HDC_INVALIDCLIENTAREA, @BTstruct )

	Local hB1 := BT_BitmapCreateNew ( Width, Height,  { 135, 135, 135 }  )

	hDC3 := BT_CreateDC ( hB1, BT_HDC_BITMAP, @BTstruct3 )


	BT_DrawGradientFillHorizontal( hDC3, 0, 0, Width, 1, { 143, 143, 143 }, { 143, 143, 143, 143 }    )
	BT_DrawGradientFillHorizontal( hDC3, 1, 0, Width, 1, { 172, 172, 172 },  { 172, 172, 172 }        )
	BT_DrawGradientFillHorizontal( hDC3, 2, 0, Width, 1, { 212, 212, 212 }, { 212, 212, 212 }    )
	BT_DrawGradientFillHorizontal( hDC3, 3, 0, Width, 1, { 241, 241, 241 }, { 241, 241, 241 }    )
	BT_DrawGradientFillHorizontal( hDC3, 4, 0, Width, 1,  WHITE, WHITE    )


	BT_DrawBitmapAlphaBlend ( hDC3,  0, 0, Width,  5, 45, BT_COPY, zBitmap1 )
	DoEvents()


	BT_DrawDCtoDC ( hDC, 0, 0, Width,   5, BT_SCALE, hDC3, 0, 0, Width, 5 )
	DoEvents()

	BT_BitmapRelease ( hB1 )
	BT_DeleteDC ( BTstruct )
	BT_DeleteDC ( BTstruct3 )

Return


Function xSombraVert(  cJanela, nRow1, nCol1, zBitmap1   )

	LOCAL Width  := BT_ClientAreaWidth( cJanela )
	LOCAL Height := BT_ClientAreaHeight( cJanela )

	Local lVeritcal := .t.

	Local BTstruct, BTstruct3

// Local zBitMap
	Local zBitMap2
	Local zBmp1

	Local zBmp2


	Local hDC := BT_CreateDC ( cJanela, BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	Local hB1 := BT_BitmapCreateNew ( Width, Height,  { 135, 135, 135 }  )
	hDC3 := BT_CreateDC ( hB1, BT_HDC_BITMAP, @BTstruct3 )


	If lVeritcal

		BT_DrawGradientFillVertical( hDC3, 0, 0, 1, Height, { 143, 143, 143 }, { 143, 143, 143, 143 }    )
		BT_DrawGradientFillVertical( hDC3, 0, 1, 1, Height, { 172, 172, 172 },  { 172, 172, 172 }        )
		BT_DrawGradientFillVertical( hDC3, 0, 2, 1, Height, { 212, 212, 212 }, { 212, 212, 212 }    )
		BT_DrawGradientFillVertical( hDC3, 0, 3, 1, Height, { 241, 241, 241 }, { 241, 241, 241 }    )
		BT_DrawGradientFillVertical( hDC3, 0, 4, 2, Height,  WHITE, WHITE    )


		BT_DrawBitmapAlphaBlend ( hDC3,  0, 0, 5,  Height, 45, BT_COPY, zBitmap1 )
		//	DoEvents()


		BT_DrawDCtoDC ( hDC, 0, 0, 5, Height, BT_SCALE, hDC3, 0, 0, 4, Height )
		//DoEvents()

	Else




	End If

	BT_BitmapRelease ( hB1 )
	BT_DeleteDC ( BTstruct )
	BT_DeleteDC ( BTstruct3 )

Return



Function xBmpToTrans( cImage, nColor, nW1, nH1 )

	Local aRGBcolor   := SELCOR
	Local hBitmapx    := BT_BitmapCreateNew ( nW1, nH1, nColor )
	Local BTstruct3
	Local hBolaAzul   := BT_BitmapLoadFile( cImage )
	Local hDC3     := BT_CreateDC ( hBitmapX, BT_HDC_BITMAP, @BTstruct3 )

	BT_DrawBitmapTransparent ( hDC3, 0, 0, nW1, nH1, BT_COPY, hBolaAzul, Nil )
	BT_DeleteDC ( BTstruct3 )

Return hBitmapx



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





Function BringToTop( nHandle )

	If nHandle > 0
		DoEvents()
		HMG_CallDLL( "User32.dll", DLL_OSAPI, "BringWindowToTop", nHandle )
		HMG_CallDLL( "User32.dll", DLL_OSAPI, "BringWindowToTop", nHandle )
		DoEvents()
	Else
		msginfo( 'Nio Handler' )
	End If

RETURN .t.



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



Function ScrollMenu( nDirecao, hWnd1, nScr1, nPonteiro, nTotal, lHtp, lHtb, nDrop, cJanela, nHeight1, lInvalidate, lAtuSetas1, lCond1 )

	Local lOk := .t.
	Local nLineSeta := nHeight1

	Local nItens := Int( nTamSubMenuConsulta / nItemSubHeight )

	Default lInvalidate := .t.
	Default lAtuSetas1  := .f.

	DEFAULT lCond1 := Nil

	If nDirecao == 2
		If !lHtb

			nScr1 += nItemSubHeight
			nPonteiro++
			lHtp := .f.

			If lInvalidate
				BT_ClientAreaInvalidateRect( cJanela, ( (nDrop * nItemSubHeight ) + nLineSeta +  nItemSubHeight ), 0, ;
					nColTamMenu, nItemSubHeight, .t.  ) // 16
			End If

			If ( nPonteiro = nTotal )
				lHtb := .t.
				If lInvalidate
					BT_ClientAreaInvalidateRect( cJanela, ( nDrop * nitemSubHeight ) + nLineSeta - 1, 0, ;
						nColTamMenu, nItemSubHeight, .t.  ) // 16
				End If
			End If

			If lCond1 != Nil
				lHtb := lCond1
				If lHtb
				End If
			End If

		Else
			lOk := .f.
		End If
	Else
		If !lHtp
			nScr1 -= nItemSubHeight
			nPonteiro--
			lHtb := .f.
			If lInvalidate
				BT_ClientAreaInvalidateRect( cJanela, ( nDrop * nitemSubHeight ) + nLineSeta - 1, 0, ;
					nColTamMenu, 16, .t.  )
			End If

			If ( nPonteiro == nItens )
				lHtp := .t.
				If lInvalidate
					BT_ClientAreaInvalidateRect( cJanela, ( (nDrop * nItemSubHeight ) + nLineSeta +  nItemSubHeight ), 0, ;
						nColTamMenu, nItemSubHeight, .t.  )
				End If

			End If
		Else

			lOk := .f.
		End If
	End If
	If ( lOk )
		DoEvents()
		_HMG_PRINTER_SETVSCROLLVALUE(   hWnd1, nScr1 )
		DoEvents()
	End If

	If ( lInvalidate ) .and. ( _isWindowDefined(  'JanMenuSub'  ) )
		DoEvents()
		DoEvents()
	End If

Return



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




Function xLimpSub( cJan, nOpsely, nClr, nHeight1, nitemH1, nColTam1, nRow1  )

	DEFAULT nHeight1 := 0
	DEFAULT nitemH1 := nItemSubHeight
	DEFAULT nColTam1 := nColTamMenu
	DEFAULT nRow1 := -( GetProperty( cJan, "VscrollBar", "Value" ) )

	If nOpsely > 0
		BT_ClientAreaInvalidateRect( cJan, ( nHeight1  + nRow1 + ( (nOpsely - 1 ) * nitemH1 ) ), 0, nColTam1,  nitemH1, .t. )
	End If

Return


Function xFindEvent(  cEvent, nHandle1 )

	Local nindex1 := 0
	Local ni := 1

	DEFAULT nHandle1 := 0

	While nI <= Len( _HMG_EventData )

		If ( Valtype( _HMG_EventData[ nI ][ 2 ] ) == 'N' ) .And. ( Valtype( _HMG_EventData[ nI ][ 1 ] ) == 'C' )
			If nHandle1 > 0
				If  ( ( _HMG_EventData[ nI ][ 1 ] ==  cEvent ) .And. ( _HMG_EventData[ nI ][ 2 ] ==  nHandle1 ) )
					nIndex1 := ni
				End If
			Else
				If  ( _HMG_EventData[ nI ][ 1 ] ==  cEvent )
					nIndex1 := ni
				End If
			End If

		End If

		ni++
		DoEvents()

	Enddo

Return ( nIndex1 )


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



Function xPaintPopup( cForm, aMtrOp, nOpselx1, nClear1, cTextSel, nItemDropedDown, nHeightDroped, lSetas, lSubMenu1, lHitB, lHitT, lPopup )

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
	Local nHeightBmp := nItemSubHeight * Len( aMtrOp )
	Local hBitmap2



	LOCAL Width  := BT_ClientAreaWidth  ( cForm )
	LOCAL Height := BT_ClientAreaHeight ( cForm )


	Local nTypeText    := BT_TEXT_TRANSPARENT  // + BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''


	Local nRow := -( GetProperty( cForm, "VscrollBar", "Value" ) )
	Local nLineSeta := nTamSubMenuConsulta
	Local nLinDrop := 0
	Local lEnabled := .t.
	Local cCor



	DEFAULT nItemDropedDown := 0
	DEFAULT nHeightDroped   := 0
	DEFAULT lSetas          := .f.

	DEFAULT lSubMenu1       := .f.

	DEFAULT lHitB := .f.
	DEFAULT lHitT := .f.

	DEFAULT lPopup := .f.



	hDC2 = BT_CreateDC ( cForm, BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )

	If !lSubMenu1
		BT_DrawGradientFillVertical ( hDC2,   0, 0, Width,    Height, aCorSub1, aCorSub1  )
	Else
		BT_DrawGradientFillVertical ( hDC2,   0, 0, Width,    Height, aCorSub2, aCorSub2  )
	End If

	If nClear1 > 0

		If !lSubMenu1
			BT_DrawGradientFillVertical ( hDC2,   ( nClear1  * nItemSubHeight ), 0, nColTamMenu,    nHeightBmp,  aCorSub1, aCorSub1  )
		Else

			BT_DrawGradientFillVertical ( hDC2,   ( nClear1  * nItemSubHeight ), 0, nColTamMenu,    nHeightBmp,  aCorSub2, aCorSub2  )

		End If

	End If



	For n1 := 1 To Len( aMtrOp )

		cTexto := alltrim(  Right( aMtrOp[ n1 ][ 1 ], Len(  aMtrOp[ n1 ][ 1 ] ) - 2  ) )

		IF lPopup
			cTexto := Alltrim( aMtrOp[ n1 ][ 1 ]  )
		End If

		lSeta1 := .f.

		If Len( aMtrOp[ n1 ] ) >= 5
			lSeta1   := ( aMtrOp[ n1 ][ 5 ] ) .And. ( aMtrOp[ n1 ][ 3 ] )
		End If

		lEnabled := aMtrOp[ n1 ][ 3 ]
		lSeta1   := .f.

		cCor := FONTCOR

		IF lPopup
			cCor := FONTCOR2
		End If

		If Len( aMtrOp[ n1 ] ) >= 5
			lSeta1   := aMtrOp[ n1 ][ 5 ]
		End If

		If ( ( nOpselx1 > 0 ) .And. ( nOpSelx1 = n1 ) .And. aMtrOp[ n1 ][ 3 ] ) .or. (   ( lEnabled ) .And. ( nOpselx1 > 0 ) .And. ( Alltrim(cTextSel ) = Alltrim(cTexto ) )  )

			nTypeText    := BT_TEXT_TRANSPARENT
			nTypeText    := BT_TEXT_BOLD

			If !aMtrOp[ n1 ][ 3 ]
				cCor := CorDisabled2
			End If


			BT_DrawGradientFillVertical ( hDC2,  nLine + nRow, 00, nColTamMenu,    nItemSubHeight, aMenuBarCor, aMenuBarCor  )

			If ( At( '%', cTexto ) > 0 )
				DrawSubl(   hDC2, nLine + nRow, 32, Alltrim( Hb_AnsiToOem( cTexto ) ), cCor )
			Else
				BT_DrawText ( hDC2, nLine + nRow, Iif( !lSubMenu1, 25,32 ),  Hb_AnsiToOem( cTexto ), XFONT2, nSizeFont,  cCor,  aCorSub2, ;
					Iif( !lPopUp, BT_TEXT_TRANSPARENT + BT_TEXT_BOLD, BT_TEXT_TRANSPARENT ), nAlingText, nOrientation )
			End If

			If lSeta1
				BT_DrawBitmapTransparent ( hDC2,  nLine  + nRow + 2, Width - 20, 16, 16, BT_COPY,  hBitSeta2, { 7, 101, 125 } )
			End If


		Else

			nTypeText    := BT_TEXT_TRANSPARENT


			IF lPopup
				cCor := FONTCOR2
			End If


			If !aMtrOp[ n1 ][ 3 ]
				cCor := CorDisabled2
			End If


			If ( At( '%', cTexto ) > 0 )
				DrawSubl(   hDC2, nLine + nRow, 32, Alltrim( Hb_AnsiToOem( cTexto ) ), cCor )
			Else
				BT_DrawText ( hDC2, nLine + nRow, 32,  Hb_AnsiToOem( cTexto ), XFONT2, nSizeFont,  cCor, aCorSub2, nTypeText, nAlingText, nOrientation )
			End If

			If lSeta1
				BT_DrawBitmapTransparent ( hDC2,  nLine  + nRow + 2, Width - 20, 16, 16, BT_COPY,  hBitSeta, { 7, 101, 125 } )
			End If



		End If

		nLine += ( nItemSubHeight )

		If ( nItemDropedDown > 0 ) .and. ( !lPopup )
			If ( nItemDropedDown == n1 )
				nLinDrop := nLine
				nLine += Iif( !lSetas, nHeightDroped, ( nTamSubMenuConsulta + ( 2 * nItemSubHeight ) )   )
			End If
		Else


		End If

	Next



	If ( lSubMenu1 ) .or. ( lPopup )
		DrawVertL( hDC2, 0, Height, .t. )
		DrawVertL( hDC2, Width - 1, Height + 1, .t. )
		DrawVertH( hDc2, 0, nColTamMenu, .t.  )
	Else
		If ( ( !lSubMenu1 ) .And. ( !lPopup ) )
			DrawVertL( hDC2, Width - 1, Height + 1, .t. )
			DrawVertH( hDc2, Height - 1,   Width, .t.  )
		End If

	End If


	BT_DeleteDC ( BTstruct2 )

REturn




Function xCloseDlg( nHnd1 )

	DestroyWindow(  nHnd1 )
	SendMessage( nHnd1, WM_SYSCOMMAND, SC_CLOSE, 0 )
	SendMessage( nHnd1, WM_SYSCOMMAND, WM_DESTROY, 0 )
	DoEvents()

Return


Function xOpSelPos( cJan, nHeit2, nItMax, nItDopred, nHeightCalc, nScroolPos  )

	Local nCol := 0
	Local nRow := 0
	Local ar1
	Local NewPos
	Local nRow1 := 0
	Local nIa1, nIa2

	Local nItem := 0

	If !_isWindowDefined( cJan )
		Return
	End If

	nRow1 := -( GetProperty( cJan, "VscrollBar", "Value" ) )


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


	If ( lSetasDown ) .And. ( cJan != "Win_Browser" )

		nIa1 := ( nItDopred * nHeightCalc ) + nTamSubMenuConsulta
		nIa2 := nIa1 + ( nItemSubHeight * 2 )

		If ( Ar1[ 1 ] >= nIa1 ) .And. (  Ar1[ 1 ] <= nIa2 )

			If Ar1[ 1 ] <  ( nIa1 + nHeightCalc )
				nItem := 1000
			Else
				nItem := 2000
			End If

		End If

	End If

Return Abs( nItem )







Function RemoveHandler( cProcName )

	Local nind := Ascan( _HMG_SYSDATA[ 60 ],   ALLTRIM ( HMG_UPPER ( cProcName  ) )  )
	Local nTam := Len( _HMG_SYSDATA[ 60 ] )

	If ( nInd > 0 )
		Adel( _HMG_SYSDATA[ 60 ], nInd )
		Asize( _HMG_SYSDATA[ 60 ], nTam - 1 )
	End If

Return ( nInd > 0 )






	#pragma BEGINDUMP


	#include "SET_COMPILE_HMG_UNICODE.ch"
	#include "HMG_UNICODE.h"

	#include <windows.h>
	#include "hbapi.h"

// https://msdn.microsoft.com/en-us/library/windows/desktop/ms646265(v=vs.85).aspx
// TrackMouseEvent(nHWnd, [nFlags], [nHoverTime]) --> lSuccess
	HB_FUNC( TRACKMOUSEEVENT )
	{
	TRACKMOUSEEVENT tmi;

	tmi.cbSize      = sizeof(TRACKMOUSEEVENT);
		tmi.dwFlags     = hb_parnidef(2, TME_LEAVE);
		tmi.hwndTrack   = (HWND) HMG_parnl(1);
		tmi.dwHoverTime = hb_parnidef(3, HOVER_DEFAULT);

	hb_retl(TrackMouseEvent(&tmi));
		}
