#require "hbxpp"


#include <hmg.ch>
#include <dll.ch>


#define FONTCOR {0,106,133}

#define SELCOR    {28,157,189}



#define QUEBRA Chr(13)+Chr(10)


#define BACK1 {229,237,242}

#define BACK5 {255,255,255}


#define CORSEL {215,228,236}
//{180,205,220}
//{216,228,236}

#define FONT1 {102,102,102}




//STATIC lTracking192 := .f.

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

Function xSaveErro(cMsg1)

	Local cError1 := "ErroLog" + StrZero(Random(7644) ,5 ) + "_" + StrZero(Random(9874) ,5 ) + ".Log"
	SaveLog('Logs\' + cError1 , cUserName + '  '  + Left(Time(),5) + '  '  + Dtoc(dDataBase) +'  ' + Alltrim(cMsg1)  )


Return cError1        

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

		Return .F.

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

Function CrieJanTip( nTop , nLeft ,   cMsg,ERROR,nSeconds , cParent )
	LOCAL nHeight := 20 , nWidth := 304
	
	Local FontHandle
	Local BTstruct

	Local hDC := BT_CreateDC ( 'Main' ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	Local hFont := HMG_CreateFont (  hDC , FONTBROWSER   , FONTBROWSERSIZE , .f., .f., .f., .f. )

	Local n12 := GetTextWidth( hDC , 'A' , hfont )

	LOCAL hWnd, aBcolor, nWinRow := nTop, nWinCol := nLeft

	DEFAULT nSeconds := 2
	DEFAULT cParent := 'Main'

	nWidth := (n12 * Len(cMsg))+5

	If ValType(ERROR) = "U"
		aBcolor := {250,243,180}
	Else
		aBcolor := {250,243,180}
	Endif

	//TOPMOST


//   HB_SETCODEPAGE("PT850")


	//REQUEST HB_CODEPAGE_PT850
	//hb_setcodepage("PT850")

   //msginfo(   Hb_AnsiToOem(cMsg) )



	//CHILD PANEL PARENT &cParent 
	DEFINE WINDOW Win_Msg AT nTop, nLeft WIDTH nWidth HEIGHT nHeight TITLE 'xHint'  ;
		NOMAXIMIZE NOMINIMIZE CHILD PANEL PARENT &cParent  NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil ; 
		ON PAINT xPaintHint(  ThisWindow.Name   )

		DEFINE LABEL Label_1
			ROW         0
			COL         1
			WIDTH       nWidth
			HEIGHT      15
			VALUE       Hb_UTF8ToStr(cMsg)
			FONTNAME    FONTBROWSER
			FONTSIZE    FONTBROWSERSIZE
			FONTBOLD    .F.
			BACKCOLOR   aBcolor
			TRANSPARENT .T.
			FONTCOLOR   BLACK
			CENTERALIGN .f.
		END LABEL

	END WINDOW


//SetProperty( "Win_msg" , "Label_1" , "Value" , cMsg )

hWnd := GetFormHandle("Win_Msg")


//HMG_ChangeWindowStyle(  hWnd, Nil , WS_EX_STATICEDGE     ,  .t. , .T. )



BT_DeleteDC (BTstruct )
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

Function xPaintHint(  cJanela )

	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)
	Local BTstruct2

	Local hDC2 := BT_CreateDC ( cJanela  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )

	
	BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , {250,242,176} , {250,242,176}  )


	BT_DeleteDC (BTstruct2 )



Return 


Function xFecheAnimate( hWnd)

	
	Local nSeconds := 0.8

	//AnimateWindow(hWnd, (nSeconds*1300), AW_VER_NEGATIVE)
	//hb_IdleSleep(nSeconds)
	AnimateWindow(hWnd, (nSeconds*2500), (AW_BLEND + AW_HIDE))
	SendMessage( hWnd, WM_SYSCOMMAND, SC_CLOSE, 0 )



Return


Function xHidehint()

	If _isWindowDefined( 'Win_Msg' )
		If IsWindowVisible(  GetFormHandle("Win_Msg") )
			HideWindow( GetFormHandle("Win_Msg"))
			//xFecheAnimate( GetFormHandle("Win_Msg"))
			//xCloseDlg( GetFormHandle("Win_Msg") )
			//DoEvents()
			//HideWindow(   'Win_msg')
			//DoEvents()

		End If
	End If


Return

function SetTamJan( cMsg  )

	Local  FontHandle := _SetFont (GetControlHandle( 'Label_1' , 'Win_Msg' ), 'Arial', 8 , .f. , .f. ,.f. ,.f. )
	Local BTstruct
	Local hDC := BT_CreateDC ( 'Main' ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	Local hFont := HMG_CreateFont (  hDC , FONTBROWSER   , FONTBROWSERSIZE , .f., .f., .f., .f. )

	Local n12 := GetTextWidth( hDC , cMsg , hfont )

	SetProperty(   'Win_msg' , 'Width' , n12   )
	

	BT_DeleteDC (BTstruct )


Return




Function xLimpSub(cJan , nOpsely , nClr , nHeight1 , nitemH1 , nColTam1 , nRow1  )

	
	DEFAULT nHeight1 := 0

	DEFAULT nitemH1 := nItemSubHeight

	DEFAULT nColTam1 := nColTamMenu

	DEFAULT nRow1 := -(GetProperty( cJan , "VscrollBar" , "Value"))



	
	If nOpsely > 0						
	    BT_ClientAreaInvalidateRect( cJan , ( nHeight1  + nRow1 + ( (nOpsely - 1 ) * nitemH1)) , 0 , nColTam1 ,  nitemH1   , .t. )												
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



	//hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	//hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)


	hDC2 = BT_CreateDC ( cMenuName , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	If (nOpselx = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , nColTamMenu ,    nHeightBmp    , BACK1 ,BACK1  )
	End If

	If nClear > 0
		BT_DrawGradientFillVertical ( hDC2 ,   (nClear  * nItemSubHeight)    , 0  , nColTamMenu ,    nHeightBmp    ,  BACK1  ,BACK1  )
	End If


	For n1 := 1 To Len(aSubOp)

		cTexto := alltrim(  Right( aSubOp[n1]  , Len(  aSubOp[n1] ) - 2  ) )

		cTexto := aSubOp[n1]


		//cTexto := strzero(n1,3) + ' ' + aSubOp[n1]

		If ((nOpselx > 0) .And. (nOpSelx = n1) ) .or. (   (nOpselx > 0) .And. ( Alltrim(cSubMenuSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT
			// + BT_TEXT_BOLD

			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow - 2  , 00  , nColTamMenu ,    nItemSubHeight - 1     , BACK1 ,WHITE  )
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR ,  {32,134,200}   , ;
				Iif( Alltrim(cSubMenuSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ;
				nAlingText, nOrientation )


		Else



			nTypeText    := BT_TEXT_TRANSPARENT
			BT_DrawText ( hDC2 , nLine + nRow  , 05 ,  Hb_AnsiToOem(cTexto)   , XFONT1, 9,  FONTCOR , BACK1 , nTypeText, nAlingText, nOrientation )

		End If



		nLine += (nItemSubHeight)

	Next

	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )


	//bt_Bit


REturn


Function xMove1()

	Local nRow , nCol
	Local ar1

	nRow := _HMG_SYSDATA [ 191 ] // Mouse Row
	nCol := _HMG_SYSDATA [ 192 ] // Mouse Col

	ar1 := GetPos_ScreenToClient(   GetFormHandle(  'fSplit6'  )  , nRow, nCol )


Return ar1



Function xRetLinha(  cJan )

	Local nCol := 0
	Local nRow := 0
	Local nRow1 := -(GetProperty( cJan , "VscrollBar" , "Value"))

	GetCursorPos (@nCol, @nRow)

	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJan  )  , nRow, nCol )

Return Ar1[1]


Function CloseYeLLow()


	If _isWindowDefined('yFormSplash')		
		//xCloseDlg( GetFormHandle(  'yFormSplash'   )    )
		xFecheAnimate( GetFormHandle(  'yFormSplash'   ))
		DoEvents()
	End If 


Return  


Function WinYeLLow(nRow , nCol , cMsg1 , cParent  )

    Local nLines := MlCount(   cMsg1    )    
	Local nWidth := 205


	If nLines <= 4          
		nWidth := 209
		//209
	End If 
	


 	DEFINE WINDOW yFormSplash;		 
        AT nRow,nCol ;  
        WIDTH nWidth ;
        HEIGHT 165 ; 
        BACKCOLOR WHITE ; 
        NOSYSMENU;
        NOSIZE;
        NOMINIMIZE;
        NOMAXIMIZE; 
        NOCAPTION    ;				
		TOPMOST        
			 
		 
		 
		 // TOPMOST;         

         SET WINDOW yFormSplash TRANSPARENT TO COLOR WHITE
         
         ON KEY ESCAPE ACTION yFormSplash.Release


		 If nLines <= 4          
         	@ 0, 5 IMAGE Image_1 PICTURE 'JANAMARELA2'          
         	@ 7 ,  75 LABEL Label_1 VALUE "Aviso" TRANSPARENT FONT 'Arial' SIZE 10 FONTCOLOR BLACK BOLD
         	@ 25, 30 LABEL Label_2 VALUE cMsg1 TRANSPARENT  FONT "Arial" SIZE 8 FONTCOLOR BLACK HEIGHT 650 WIDTH 200
		Else 
			@ 0, 5 IMAGE Image_1 PICTURE 'JANAMARELA1'          
         	@20,  75 LABEL Label_1 VALUE "Aviso" TRANSPARENT FONT 'Arial' SIZE 10 FONTCOLOR BLACK BOLD
         	@45, 30 LABEL Label_2 VALUE cMsg1 TRANSPARENT  FONT "Arial" SIZE 8 FONTCOLOR BLACK HEIGHT 650 WIDTH 200
		End If 
		 
         
   END WINDOW

   //HMG_ChangeWindowStyle(  GetProperty(  'yFormSplash' , 'HANDLE' ) , WS_BORDER, NIL, .T. )

	_ShowWindow(  'yFormSplash'  )
	//DoMethod( 'yFormSplash' , 'Activate')


	DoEvents()
	

Return 

Function xWaitY( cForm )

	Local i
	Local ar1
	Local nRow1,nCol1
	//Local nHWnd := GetFormHandle('Win_Dialog')
	Local nHWnd1


	For i := 1 To 255
		GetAsyncKeyState(i)
	Next i

	//xIndiDlg()

	DoEvents()
	DoEvents()

	//aMx := yEfect(  cActiveJan , .t.  )


	Do While .Not. lExit

		DoEvents()

		For i := 1 To 255
			If (GetAsyncKeyState(VK_RETURN) != 0)
				lExit := .T.
				Exit
			EndIf
		Next i

		BringTop(cForm)
		SysWait(0.01)
		//_ShowWindow('Win_Dialog')

	Enddo

	//msginfo('Exit')

Return .t.



Function xBmpToTrans(cImage , nColor , nW1 , nH1 )

	Local aRGBcolor   := SELCOR
	Local hBitmapx    := BT_BitmapCreateNew (nW1 , nH1, nColor)
	Local BTstruct3
	Local hBolaAzul   := BT_BitmapLoadFile(cImage)
	Local hDC3 		  := BT_CreateDC (hBitmapX , BT_HDC_BITMAP, @BTstruct3 )

	BT_DrawBitmapTransparent (hDC3 , 0, 0, nW1, nH1, BT_COPY, hBolaAzul , Nil )
	BT_DeleteDC (BTstruct3 )


Return hBitmapx

Function CursorOn1(  cExtra1 )
		
		Local nRow1 , nCol1 
		Local nHWnd 

		GetCursorPos (@nCol1, @nRow1)
		nHWnd := WindowFromPoint (nCol1, nRow1)
	
		
		SetWindowCursor( nHWnd  , 'CURSOR1'  )		
		SetWindowCursor( GetFormHandle( cBrowDbActive )  , 'CURSOR1'  )
		SetWindowCursor( GetFormHandle( cActiveMdi ) , 'CURSOR1' )

		If !Empty(Alltrim(  cExtra1 ))
			SetWindowCursor( GetFormHandle( cExtra1 ) , 'CURSOR1' )
		End If 

		SetWindowCursor( GetFormHandle( cActiveJan ) , 'CURSOR1' )


Return nHWnd

Function CursorOff1( nhW1 , cExtra1   )			
		
		SetWindowCursor( nhW1  , IDC_ARROW  )		
		SetWindowCursor( GetFormHandle( cBrowDbActive )  , IDC_ARROW )
		SetWindowCursor( GetFormHandle( cActiveMdi ) , IDC_ARROW)
		If !Empty(Alltrim(  cExtra1 ))
			SetWindowCursor( GetFormHandle( cExtra1 ) , IDC_ARROW )
		End If 
		SetWindowCursor( GetFormHandle( cActiveJan ) , IDC_ARROW )


Return 

 Function xShowHint( nRow1 , nCol1 , cMsg )


    If !_isWindowDefined("Win_Msg")
        CrieJanTip( nRow1 - 20  , nCol1 - 250   ,   Alltrim(cMsg)      ,, 0.5 )
    Else
        xDispHint( Alltrim(cMsg)  , nRow1 - 20 ,  nCol1 - 250  )
    End If

    xDispUpTam(cMsg)

    BringTop('xHint')

REturn     

Function DraVertL( hDc1 , nCol , nHeight1 , lSingle )

	Local aCorBorda := {153,153,153}

	DEFAULT lSingle := .f. 

	BT_DrawLine ( hDc1, 0 , nCol   , nHeight1 , nCol    ,   aCorBorda ,   1 )

	If !lSingle
		BT_DrawLine ( hDc1, 0 , nCol+1 , nHeight1,  nCol+1  ,   aCorBorda , 1 )
	End If 

Return



Function DraVertH( hDc1 , nRow , nWidth , lSingle )
	
	Local aCorBorda := {153,153,153}

	DEFAULT lSingle := .f. 

	BT_DrawLine ( hDc1, nRow ,  0   ,  nRow    ,  nWidth     ,   aCorBorda , 1 )

	If !lSingle
		BT_DrawLine ( hDc1, nRow+1 ,0   ,  nRow+ 1 ,  nWidth + 1 ,  aCorBorda , 1 )
	End If 
	

Return

