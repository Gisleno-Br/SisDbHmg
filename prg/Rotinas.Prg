#include <hmg.ch>


#define FONTCOR {0,106,133}

#define BACK1 {229,237,242}

#define BACK5 {255,255,255}


#define CORSEL {215,228,236}
//{180,205,220}
//{216,228,236}

#define FONT1 {102,102,102}




FUNCTION AltTamCampo( cTabx, cCampo, cForm )

   LOCAL cSql := "select * from dicionario where tabela = '" + cTabx + "' and camposistema = '" + AllTrim( hb_OEMToANSI( cCampo ) ) + "'"

   LOCAL oServer := GetConexao()
   LOCAL oQuery  := oServer:Query( cSql )
   LOCAL oRow

   LOCAL lBold      := .F.
   LOCAL lItalic    := .F.
   LOCAL lUnderline := .F.
   LOCAL lStrikeOut := .F.




   PRIVATE lOkz := .F.
   PRIVATE aButx1

   PRIVATE pCampo   := cCampo
   PRIVATE pTabelax := cTabx

   IF ( oQuery:LastRec() > 0 )

      oRow := oQuery:GetRow( 1 )

      Load Window fEditTam

      SET NAVIGATION EXTENDED

      fEditTam .lblcampo. value := AllTrim( GetCampo( oRow, 'campo' ) )

      fEditTam .tamanho. value   := GetCampo( oRow, 'tamdisp' )
      fEditTam .cabecalho. value := hb_ANSIToOEM( GetCampo( oRow, 'camposistema' ) )

      fEditTam .mascara. value := GetCampo( oRow, 'mascara' )

      fEditTam .chkBrowse. Value := GetCampo( oRow, 'browse' ) == 'S'

      ON KEY ESCAPE Of fEditTam Action _ReleaseWindow( 'fEditTam' )

      HMG_ChangeWindowStyle( fEditTam.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )
      HMG_ChangeWindowStyle( fEditTam.Handle, WS_EX_STATICEDGE, NIL, .T., .T. )


      OBTN_Create( 'fEditTam',  6798, "Ok", 135, 180,  65,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
      OBTN_Font( 'fEditTam', 6798,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

      OBTN_Create( 'fEditTam', 6799, "Cancelar", 135, 245,  65,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
      OBTN_Font( 'fEditTam', 6799,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

      aButx1 := {}
      AAdd( aButx1, {  6798,  OBTN_Handle( 'fEditTam', 6798 )    } )
      AAdd( aButx1, {  6799,  OBTN_Handle( 'fEditTam', 6799 )    } )

      SetProperty( 'fEditTam', "Label_5", "Value",  hb_ANSIToOEM( 'Propriedades Visualização Campo' ) )

      EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, 'fEditTam'  ) },   OBTN_Handle( 'fEditTam', 6798 )   ), .T. )
      EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, 'fEditTam' ) },     OBTN_Handle( 'fEditTam', 6799 )   ), .T. )

      Obtn_Enable(  'fEditTam',  6798, .F. )


      Activate Window fEditTam


   ELSE
      yAviso( 'Campo/Tabela Não Localizado no Dicionario de Dados.' , .f.)
      SetProperty( cForm, 'Image_baixo', 'Visible', .F. )
      SetProperty( cForm, 'Image_cima', 'Visible', .F. )
      Refreshall( cForm )
   END IF


   oQuery:Destroy()
   oQuery := Nil

   oServer:Destroy()
   oServer := Nil

RETURN lOkz


FUNCTION SvTamCampo( cCampo1, cTab1, nTam1  )

   LOCAL oSErver
   LOCAL oQuery
   LOCAL cSqlUp := "Update dicionario "

   cSqlUp += " Set tamdisp = " + AllTrim( Str(  nTam1 ) )
   cSqlUp += " where tabela = '" + cTab1 + "' and Camposistema = '" + AllTrim( hb_OEMToANSI( cCampo1 ) ) + "'"

   oServer := GetConexao()
   oQuery := oServer:Query( cSqlUp )

   IF oQuery:NetErr()
      yAviso( '(SvCampo) Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error(), .F. )
      RETURN .F.
   END IF

   oServer:Destroy()
   oServer := Nil

   oQuery:Destroy()
   oQuery := Nil

RETURN .T.


FUNCTION SaveCampo( cCampo1, cTab1  )

   LOCAL oSErver
   LOCAL oQuery
   LOCAL cSqlUp := "Update dicionario "

   cSqlUp += " Set tamdisp = " + AllTrim( Str(  fEditTam .tamanho. value  ) ) + ","
   cSqlUp += "camposistema = '" + AllTrim( hb_ANSIToOEM( fEditTam .cabecalho. value ) ) + "',"
   cSqlUp += "mascara = '" + AllTrim( fEditTam .mascara. value ) + "',"
   cSqlUp += "browse = '" + iif( fEditTam .chkBrowse. Value, "S", "N" ) + "' "
   cSqlUp += " where tabela = '" + cTab1 + "' and Camposistema = '" + AllTrim( hb_OEMToANSI( cCampo1 ) ) + "'"

   oServer := GetConexao()
   oQuery := oServer:Query( cSqlUp )

   IF oQuery:NetErr()

      yAviso( '(SaveCampo) Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error(), .F. )

      oServer:Destroy()
      oServer := Nil

      oQuery:Destroy()
      oQuery := Nil

      RETURN .F.
   END IF

   oServer:Destroy()
   oServer := Nil

   oQuery:Destroy()
   oQuery := Nil

RETURN .T.


Function CloseJanTip(   nHwnd  )

   Local nSeconds := 1

   //AnimateWindow(hWnd, (nSeconds*300), AW_VER_NEGATIVE)
   //hb_IdleSleep(0.5)
   AnimateWindow(nHwnd, (nSeconds*1500), (AW_BLEND + AW_HIDE))
   SendMessage( nHwnd, WM_SYSCOMMAND, SC_CLOSE, 0 )

Return    

Function CrieJanTip( nTop , nLeft ,   cMsg,ERROR,nSeconds)
   LOCAL nHeight := 20 , nWidth := 304
   Local hFont 
   Local FontHandle
   //LOCAL nLeft := (GetDesktopWidth() - 5) - nWidth
   //LOCAL nTop := (GetDesktopHeight() - 50) - nHeight
   LOCAL hWnd, aBcolor, nWinRow := nTop, nWinCol := nLeft

   DEFAULT nSeconds := 2
   If ValType(ERROR) = "U"
      aBcolor := {250,243,180}
   Else
      aBcolor := {250,243,180}
   Endif

   //TOPMOST

   DEFINE WINDOW Win_Msg AT nTop, nLeft WIDTH nWidth HEIGHT nHeight  ;
      NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION BACKCOLOR aBcolor
      
      DEFINE LABEL Label_1
         ROW         0
         COL         1
         WIDTH       450
         HEIGHT      15
         VALUE       Alltrim(cMsg)
         FONTNAME    'Arial' //XFONT1
         FONTSIZE    8
         FONTBOLD    .F.
         BACKCOLOR   aBcolor
         FONTCOLOR   BLACK
         CENTERALIGN .f. 
      END LABEL

   END WINDOW
   hWnd := GetFormHandle("Win_Msg")
   //HMG_ChangeWindowStyle(hWnd, WS_EX_CLIENTEDGE, NIL, .T.)


   //FontHandle := _SetFont (GetControlHandle( 'Label_1' , 'Win_Msg' ), 'Arial', 8 , .t. , .f. ,.f. ,.t. )

   //hFont := SendMessage (GetControlHandle( 'Label_1' , 'Win_Msg' )   , WM_GETFONT, 0, 0)

   //SetProperty(   'Win_msg' , 'Width' , GetTextWidth(  0,  Alltrim(cMsg) , FontHandle  )  + 4   )


   //_ShowWindow("Win_Msg")
/*
   AnimateWindow(hWnd, (nSeconds*300), AW_VER_NEGATIVE)
   hb_IdleSleep(nSeconds)
   AnimateWindow(hWnd, (nSeconds*1500), (AW_BLEND + AW_HIDE))
   SendMessage( hWnd, WM_SYSCOMMAND, SC_CLOSE, 0 )
   */

Return hWnd


Function xHidehint()

   If IsWindowVisible(  GetFormHandle("Win_Msg") )
   	HideWindow( GetFormHandle("Win_Msg"))				
   End If 	


Return 

function SetTamJan( cMsg  )

   Local  FontHandle := _SetFont (GetControlHandle( 'Label_1' , 'Win_Msg' ), 'Arial', 8 , .f. , .f. ,.f. ,.f. )
   SetProperty(   'Win_msg' , 'Width' , GetTextWidth(  0,  Alltrim(cMsg) , FontHandle  )  + 1   )

Return 


function GetTextoLen( cMsg  )

   Local  FontHandle := _SetFont (GetControlHandle( 'Label_1' , 'Win_Msg' ), 'Arial', 8 , .f. , .f. ,.f. ,.f. )
//   SetProperty(   'Win_msg' , 'Width' , GetTextWidth(  0,  Alltrim(cMsg) , FontHandle  )  + 1   )

Return (GetTextWidth(  0,  Alltrim(cMsg) , FontHandle  )  + 1 )




Function xPaintMenu( cForm , aMtrOp , nOpselx1 , nClear1 , cTextSel)

	Local aRGBcolor := BACK1

	Local nWidthBmp := 170

	Local nHandle1
	Local nHandle2
	Local hWnd
	Local BTstruct
	Local BTstruct2
	Local hDc
	Local nTYpe
	Local nLine := 00
	
	Local nHeightBmp := nItemSubHeight * Len(aMtrOp)

	Local hBitmap2

	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)

	
	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''

	Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))



	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)

	
	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )	


	If (nOpselx1 = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , 187 ,    nHeightBmp    , WHITE , WHITE  )	
	End If 	

	If nClear1 > 0
		BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemSubHeight)    , 0  , 187 ,    nHeightBmp    ,  WHITE  , WHITE  )			
	End If 	



	For n1 := 1 To Len(aMtrOp)

		cTexto := alltrim(  Right( aMtrOp[n1][1]  , Len(  aMtrOp[n1][1] ) - 2  ) )

		//cTexto := aMtrOp[n1][1]


		If ((nOpselx1 > 0) .And. (nOpSelx1 = n1) ) .or. (   (nOpselx1 > 0) .And. ( Alltrim(cTextSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT 
			// + BT_TEXT_BOLD

			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow - 2  , 00  , 187 ,    nItemSubHeight - 1     , WHITE  , BACK1  )		

			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR ,  {32,134,200}   , ; 
			Iif( Alltrim(cTextSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ; 
			nAlingText, nOrientation )
		   

		Else 				
		
			nTypeText    := BT_TEXT_TRANSPARENT  
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  Hb_AnsiToOem( cTexto ), XFONT1, 9,  FONTCOR , WHITE , nTypeText, nAlingText, nOrientation )

		End If 	
		

		nLine += (nItemSubHeight)

	Next 

	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )


	//bt_Bit


REturn 	

Function xLimpSub(cJan , nOpsely , nClr )

	Local nRow1 := -(GetProperty( cJan , "VscrollBar" , "Value"))

	If nOpsely > 0

		//nClr := nOpsely	
		
		BT_ClientAreaInvalidateRect( cJan , nRow1 + ( (nOpsely - 1) * nItemSubHeight)  , 0 , 187 ,  nItemSubHeight - 1 , .t. )

		
		
	End If 	

Return 


Function xDispHint( cMsg1 , nRow1 )

 	SetTamJan( Alltrim(cMsg1)  )	
	SetProperty( 'Win_Msg' , 'Row' , nRow1 - 35 )
	SetProperty( 'Win_Msg' , 'Label_1' , 'Value' , Alltrim(cMsg1) )  			    	


Return 

Function xDispUpTam(  cMsg1 )

	If !IsWindowVisible(  GetFormHandle("Win_Msg") )
		SetTamJan( Alltrim(cMsg1)  )					
	   _ShowWindow("Win_Msg")
	End If   

Return 



Function xPaintSub()

	Local aRGBcolor := BACK1

	Local nWidthBmp := 170

	Local nHandle1
	Local nHandle2
	Local hWnd
	Local BTstruct
	Local BTstruct2
	Local hDc
	Local nTYpe
	Local nLine := 00
	
	Local nHeightBmp := nItemSubHeight * Len(aSubOp)

	Local hBitmap2

	LOCAL Width  := BT_ClientAreaWidth  (cMenuName)
	LOCAL Height := BT_ClientAreaHeight (cMenuName)

	
	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''

	Local nRow := -(GetProperty( cMenuName , "VscrollBar" , "Value"))



	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)

	
	hDC2 = BT_CreateDC ( cMenuName , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )	


	If (nOpselx = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , 187 ,    nHeightBmp    , BACK1 ,BACK1  )	
	End If 	

	If nClear > 0

		BT_DrawGradientFillVertical ( hDC2 ,   (nClear  * nItemSubHeight)    , 0  , 187 ,    nHeightBmp    ,  BACK1  ,BACK1  )			

		//nClear := 0

	End If 	


	For n1 := 1 To Len(aSubOp)

		cTexto := alltrim(  Right( aSubOp[n1]  , Len(  aSubOp[n1] ) - 2  ) )

		cTexto := aSubOp[n1]

		//cTexto := strzero(n1,3) + ' ' + aSubOp[n1] 

		If ((nOpselx > 0) .And. (nOpSelx = n1) ) .or. (   (nOpselx > 0) .And. ( Alltrim(cSubMenuSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT 
			// + BT_TEXT_BOLD

			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow - 2  , 00  , 187 ,    nItemSubHeight - 1     , BACK1 ,WHITE  )		
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR ,  {32,134,200}   , ; 
			Iif( Alltrim(cSubMenuSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ; 
			nAlingText, nOrientation )
		   

		Else 				
		
			nTypeText    := BT_TEXT_TRANSPARENT  
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR , BACK1 , nTypeText, nAlingText, nOrientation )

		End If 	

		

		nLine += (nItemSubHeight)

	Next 

	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )


	//bt_Bit


REturn 	




Function xOpSelPos( cJan )

	Local nCol := 0
	Local nRow := 0			
	Local ar1 
	Local NewPos 
	Local nRow1 := -(GetProperty( cJan , "VscrollBar" , "Value"))

	GetCursorPos (@nCol, @nRow)


   //SaveLog( 'LOG002.txt' , Str(nRow) + '   ' + Str(nCol)  + Chr(13)+Chr(10)  ) 

	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJan  )  , nRow, nCol )
	
	NewPos := GetScrollPos( GetFormHandle(  cJan  ), 1 ) 

	If NewPos > 0 
		nItem := (Int( (NewPos+Ar1[1])     / nItemSubHeight)+1)
	Else
		nItem := (Int(Ar1[1] / nItemSubHeight)+1)		
	End If 		

Return nItem 	






