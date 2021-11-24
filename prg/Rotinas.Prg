#include <hmg.ch>



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


function SetTamJan( cMsg  )

   Local  FontHandle := _SetFont (GetControlHandle( 'Label_1' , 'Win_Msg' ), 'Arial', 8 , .f. , .f. ,.f. ,.f. )
   SetProperty(   'Win_msg' , 'Width' , GetTextWidth(  0,  Alltrim(cMsg) , FontHandle  )  + 1   )

Return 




