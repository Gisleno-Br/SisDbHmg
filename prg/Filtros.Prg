// 25-09

#include <hmg.ch>

REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850

#define QUEBRA Chr(13)+Chr(10)

DECLARE WINDOW fFiltro
DECLARE WINDOW WinSombra3





FUNCTION LoadFitros( cTabela1 )

   LOCAL lBold      := .F.
   LOCAL lItalic    := .F.
   LOCAL lUnderline := .F.
   LOCAL lStrikeOut := .F.
   LOCAL oSErver
   LOCAL nIndexFiltro := 0
   LOCAL oQuery
   LOCAL oRo
   LOCAL cCab1 :=  ''
   Local l_Ok := .t. 


   


   HB_SETCODEPAGE("PT850")



   PRIVATE aHed1 := { 'Id', 'Filtro', Hb_AnsiToOem('Expressão') }


   PRIVATE cTabx := cTabela1
   PRIVATE aCampos1 := {}

   PRIVATE cFiltrox1 := ''

   Private aMtFiltr := {}

   Private lNextOp := .f. 


     

   
   SET LANGUAGE TO PORTUGUESE
   SET CODEPAGE TO PORTUGUESE

   
   
	DEFINE WINDOW fFiltrosCad ;
		AT 0,0  ;				
		WIDTH 850 HEIGHT 350 ;
		CHILD TITLE 'xProcFiltro'  ;		
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE  ; 
		ON PAINT xProcDlg( ThisWindow.Name ,  'Filtros - ' + Alltrim(cTabela) )  				
	END WINDOW	



   
   aMtrFiltr := xLoadFiltros( cTabela1  )

   If !CheckRet(aMtrFiltr)
      Return 
   End If   
   

   //Load Window fFiltrosCad

   
   HMG_ChangeWindowStyle( GetFormHandle('fFiltrosCad') , WS_EX_DLGMODALFRAME, NIL, .T., .T. )


   Center Window fFiltrosCad


   
   /*


   HMG_ChangeWindowStyle(  fFiltrosCad.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )

   PRIVATE cJanx := 'fFiltrosCad'
   PRIVATE aButx1 := {}

   fFiltrosCad .LblTabela. Value := cTabx




   OBTN_Create( cJanx,  1598, "&Ok", 320, 428,  65,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJanx, 1598,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJanx, 1599, "&Cancelar", 320, 495,  65,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJanx, 1599,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJanx, 1597, "&Novo Filtro", 290, 4,  85,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJanx, 1597,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJanx, 1596, "&Modificar", 290, 89,  62,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJanx, 1596,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJanx, 1595, "&Excluir", 290, 152,  62,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJanx, 1595,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   AAdd( aButx1, {  1599,  OBTN_Handle( cJanx, 1599 ),   {||    fFechaF()  },  cJanx   } )

//   AAdd( aButx1, {  1597,  OBTN_Handle( cJanx, 1597 ),   {||  (PushButton( cJanx, 1597 ), SysWait( .1 ), xNovoFilt() )  },  cJanx   } )

   AAdd( aButx1, {  1597,  OBTN_Handle( cJanx, 1597 ),   {||   ( PushButton( cjanx  , 1597 ) , xNovoFilt() )  } ,  cJanx   } )



   AAdd( aButx1, {  1595,  OBTN_Handle( cJanx, 1595 ),   {|| PushButton( cJanx, 1595 ),SysWait( .1 ),  xExclFiltro()   },  cJanx   } )


   AAdd( aButx1, {  1596,  OBTN_Handle( cJanx, 1596 ),   {|| PushButton( cJanx, 1596 ),SysWait( .1 ),  xEditFiltro()   },  cJanx   } )


   AAdd( aButx1, {  1598,  OBTN_Handle( cJanx, 1598 ),    {|| cFiltrox1 := SetFiltOk() },  cJanx   } )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 1598 )   ), .T. )


   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 1599 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 1597 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 1596 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 1595 )   ), .T. )



   OBTN_Enable( cjanx, 1598, .F. )
   OBTN_Enable( cJanx, 1595, .F. )
   OBTN_Enable( cJanx, 1596, .F. )
   // OBTN_Enable( 'fCriaConsulta', 6595, .F. )


   HMG_ChangeWindowStyle( fFiltrosCad.Handle, WS_EX_STATICEDGE, NIL, .T., .T. )

   HMG_ChangeWindowStyle( fFiltrosCad.Handle, WS_BORDER, NIL, .F., .T. )
   HMG_ChangeWindowStyle( fFiltrosCad.Handle, NIL, WS_EX_STATICEDGE, .T., .T. )

   ON KEY ESCAPE of fFiltrosCad ACTION fFechaF()

   InstallEventHandler(  'EventConsu' )   

      
   xLoadFiltros(cTabx , .t.  )

   */

   //Private zBitMap := BT_BitmapCaptureDesktop ( 181 + 12 , 292 + 625  + 2 , 5 , 378 - 7  )


   


   //ON KEY ESCAPE of fFiltrosCad ACTION fFechaF()

   //Center Window fFiltrosCad

   //Activate Window fFiltrosCad

   //RemoveHandler( 'EventConsu' )  

   RemoveHandler( "EventBrowser" )
   xInitFiltr()


   
	WinSombra3.Show()
   
	Bt_ClientAreaInvalidateAll('WinSombra3')	
	_ShowWindow('fFiltrosCad')


   cSalvaJan  :=  cActiveJan
   cActiveJan := 'fFiltrosCad'   


   
   aMtrFiltr := {}

   For n1 := 1 to 500
         Aadd( aMtrFiltr , { StrZero(n1,3) , ' Filtro  ' + Strzero(n1,5) , 'adasdsadas'  , '|||||||||||||| AAAAAAAAAAA' , Repl("=",145) , ;
             'LLPPPPPPPPPPPPPPPPP' , 'GISLENO GUIMARAES JUNIOR '} )

   Next   

   
   l_Ok := xBrowserMtr( 51 ,  aMtrFiltr , 'fFiltrosCad'   , 820  , 'LstBoxFiltro' , 2  , { 'Codigo' , 'Descrição' , 'Expressão Filtro ' , 'cAMPO 1','Campo 2','Campo 3' , 'Campo 4'} , ;
      {10,50,60 , 75 , 60 ,35,75  }  , {'C' , 'C' , 'C' , 'C' , 'C' ,'C' ,'C'} , .f. , .t. , 150 )

   
   //_ShowWindow('LstBoxFiltro')

   BringTop('xProcFiltro')  

   
   //xWaitY( 'fFiltrosCad' )

   If (l_Ok)    
      Do Events 
      _ShowWindow('fFiltrosCad')
      Do Events       
      _ShowWindow('LstBoxFiltro')      
      xInitBrw()
      DoEvents()
   End If    

   /*
   Do Events 

   DoMethod( 'fFiltrosCad' , 'Activate')
   DoMethod( 'fFiltrosCad' , 'SetFocus')

   Do Events 
   */

   



   //747






RETURN cFiltrox1

Function xInitFiltr()


   
	Local nTop  := GetProperTy('fFiltrosCad' , 'Row') 
	Local nLeft := GetProperTy('fFiltrosCad' , 'Col')
   Local zBitMap := BT_BitmapCaptureDesktop ( nTop + 12 , nLeft + 12 , GetProperty('fFiltrosCad' , 'Width') - 7 , GetProperTy('fFiltrosCad' , 'Height') - 7  )

   
   //Local aMtrFiltr := xLoadFiltros( cTabela  )


   //BT_BitmapC
   

   BT_BitmapSaveFile ( zBitMap  , "zBit20.bmp")


   
	DEFINE WINDOW WinSombra3 AT nTop + 12 , nLeft + 12 WIDTH GetProperty('fFiltrosCad' , 'Width') - 8 HEIGHT GetProperty('fFiltrosCad' , 'Height') - 8 TITLE 'Sombra2' ;
      NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR BLACK VIRTUAL HEIGHT Nil ;
      ON PAINT xSombra( ThisWindow.Name , nTop   , nLeft    , zBitMap ) 			
   END WINDOW



//   _ShowWindow('WinSombra2')


   //sysWait(0.05)



REturn    


Function fFechaF()

  fFiltrosCad.Release()

  
   if _IsWindowDefined('fFiltro')
		DestroyWindow( fFiltro.HANDLE	)
	End If	   


Return 

FUNCTION SetFiltOk()

   LOCAL nI1 := fFiltrosCad .GridFiltro. value
   LOCAL am1 := fFiltrosCad .GridFiltro. item( ni1 )

   // msginfo( am1[3] )


   If !Empty( am1[ 3 ] )
       Domethod( 'fFiltrosCad', 'Release' )
   End If



RETURN am1[ 3 ]

FUNCTION xExclFiltro()

   LOCAL a1   := fFiltrosCad .GridFiltro. Value
   LOCAL aMtr := fFiltrosCad .GridFiltro. item( a1 )
   LOCAL cSqlx1
   LOCAL oServer
   LOCAL oQuery

   If xDialog( Hb_AnsiToOem("Confirma Exclusão desse Filtro? ") , .t. )


      cSqlx1 := "delete from filtros where tabela = '" + cTabx + "' and idfiltros = " +  AllTrim( aMtr[ 1 ] )
      // msginfo(cSqlx1)
      oServer := GetConexao()
      oQuery  := oServer:Query( cSqlx1 )


      oServer:Destroy()
      oQuery:Destroy()
      

      // fFiltrosCad.GridFiltro.Delete(a1)

      Domethod( 'fFiltrosCad', 'GridFiltro', "DeleteItem", a1 )

      fFiltrosCad .GridFiltro. Value := -1
      Domethod( 'fFiltrosCad', 'GridFiltro', 'Refresh' )


      OBTN_Enable( cjanx, 1598, .F. )
      OBTN_Enable( cJanx, 1595, .F. )
      OBTN_Enable( cJanx, 1596, .F. )



   Else

   End If

   // DoMethod('fFiltrosCad','Release')
   // ProcFiltro( cTabx , .f. )

RETURN

FUNCTION xEditFiltro()

   LOCAL a1 := fFiltrosCad .GridFiltro. Value
   LOCAL aMtr := fFiltrosCad .GridFiltro. item( a1 )

   // msginfo('k')

   IF Len( aMtr ) = 0
      RETURN
   END IF

   // msginfo('id ' + aMtr[1])

   IF xNovoFilt( .F., Val( aMtr[ 1 ] ) )


   END IF

RETURN

FUNCTION xChgIt()

   Local cJanx := 'fFiltrosCad'

   If fFiltrosCad .GridFiltro. Value > 0
      OBTN_Enable( cJanx, 1595, .T. )
      OBTN_Enable( cJanx, 1596, .T. )

      OBTN_Enable( cJanx, 1598, .T. )

      // msginfo('ok')
   End If



RETURN

FUNCTION xLoadFiltros( cTabela1  , lUltimo )

   LOCAL cSqlx1 := "select * from filtros where tabela = '" + cTabela1 + "' and ativo = 'S'"
   LOCAL oServer := GetConexao()
   LOCAL oRow
   LOCAL oQuery  := oServer:Query( cSqlx1 )
   Local aMtr1 := {}
   Local cArqLog := ''

   	If oServer:NetErr()                       

        cArqLog := xSaveErro(oServer:Error())
        xDialog( "Error Executing Query !" + QUEBRA + cSqlx1 + " : " + QUEBRA + "Arquivo de Log : " + cArqLog  , .f. )
        oServer:Destroy()
        oQuery:Destroy()
      
       Return .f. 

   End If 


   //MsgInfo('loadf ')


   Default lUltimo := .f. 

   If !_isWindowDefined('fFiltrosCad')
      xDialog( Hb_AnsiToOem(  "Erro Inesperado , Refaça a Operação.")  , .f.)     
      Return .f. 
   End If 


   //fFiltrosCad .Gridfiltro. Deleteallitems()

   FOR n1 := 1 TO oQuery:LastRec()
      oRow := oQuery:GetRow( n1 )
      //Domethod( 'fFiltroscad', 'GridFiltro', 'addItem', { AllTrim( Str(GetCampo(oRow,'IdFiltros' ) ) ),   GetCampo( oRow,'descricao' )     , GetCampo( oRow,'filtro' ) } )

      Aadd(aMtr1 , {    StrZero(GetCampo(oRow,'IdFiltros' ) , 3) , GetCampo( oRow,'descricao' ) ,  GetCampo( oRow,'filtro' )     } )
   NEXT

   //fFiltrosCad .LblQtFiltro. Value := AllTrim( Str( oQuery:LastRec()    ) )

   //If ( oQuery:LastRec() > 0 )     
     // Domethod( 'fFiltroscad', 'GridFiltro', 'SetFocus' )
   //End If



/*
   If (lUltimo)

      fFiltroscad.GridFiltro.Value := {oQuery:LastRec() ,1 }     
      Domethod( 'fFiltroscad', 'GridFiltro', 'SetFocus' )
      PostMessage( GetControlHandle(   'GridFiltro' , 'fFiltroscad' )    , 7  ,0,0)
    

      _ShowWindow('fFiltrosCad'  )

      SysWait(.1)

   End If 
   */


   oServer:Destroy()
   oSErver := Nil 


   oQuery:Destroy()
   oQuery := Nil 

   // SysWait(.8)
   // Refreshall('fFiltrosCad')

RETURN aMtr1 


STATIC FUNCTION xNovoFilt( lNew1, nIdFiltro )

   LOCAL lOk := .F.
   LOCAL cJan := 'fFiltro'
   LOCAL lBold      := .F.
   LOCAL lItalic    := .F.
   LOCAL lUnderline := .F.
   LOCAL lStrikeOut := .F.
   LOCAL oSErver
   LOCAL oQuery
   LOCAL oRow
   LOCAL n1 := 1
   LOCAL aCabec1  := GetCamposDic( cTabela, ' ', .F. , .f. )
   LOCAL cSqlx1 := ''

   LOCAL nIdFlt := nIdFiltro


   // Local oServer
   // Local oQuery

   DEFAULT lNew1 := .T.


   Public lNovoFilt := lNew1

   
	Public aButFilt := {}

   
   
   If !_IsWindowDefined('fFiltro')
      Load Window fFiltro
   End If    

   Center Window fFiltro

   fFiltro.chkOrdem.visible := .f.

   fFiltro .Lbltabela. value := cTabela

   //HB_SETCODEPAGE("UTF8")

   HB_SETCODEPAGE("PT850")

   SetProperty("fFiltro" , "Frame_1" , "Caption" , hb_ANSIToOEM("Criação de Filtros" )  ) 
   

         
   ON KEY ESCAPE OF fFiltro Action xFechay()


   PRIVATE aBtx := {}
   
   

   //HB_SETCODEPAGE("PT850")
   //Hb_AnsiToOem



   While n1 <= Len( aCabec1 )

      If  !Empty( AllTrim( aCabec1[ n1 ] ) )
          fFiltro .cmbCampo. Additem(  hb_UTF8ToStr(aCabec1[ n1 ] )  )
          fFiltro .cmbOrdem. Additem(  hb_UTF8ToStr(aCabec1[ n1 ] ) )
          AAdd( aCampos1,  hb_UTF8ToStr(aCabec1[ n1 ])  )
      End If

      n1++

   Enddo


   If !lNew1

      cSqlx1 := "select * from filtros where tabela = '" + cTabela + "' and idFiltros = " + AllTrim( Str( nIdFiltro ) )
      oServer := GetConexao()

      //msginfo( cSqlx1 )

      // oRow
      oQuery  := oServer:Query( cSqlx1 )

      If  !oQuery:Eof()

         oRow := oQuery:GetRow( 1 )

         fFiltro .titulo. value    := GetCampo( oRow, 'descricao' )
         fFiltro .EdtFiltro. value := GetCampo( oRow, 'filtro' )

         //msginfo(   GetCampo( oRow, 'descricao' ) )

         IF !Empty( GetCampo( oRow, 'ordem' ) )
             fFiltro .cmbOrdem. value := AScan( aCampos1,  AllTrim( GetCampo(oRow, 'ordem' ) ) )
         END IF

         lNextOp := .t.

      End If 


      oQuery:Destroy()
      oSErver:Destroy()



   End If

   //cJan := cFiltroDlg


    //9598 9599 959 958 9291 9281 9541 9481
   OBTN_Create( cJan,  9598, "Gravar Filtro", 345, 255,  70,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 9598,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJan,  9599, "Cancelar", 345, 325,  65,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 9599,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )


   OBTN_Create( cJan,  959, "Adicionar", 300, 13,  70,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 959,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJan,  958, "Limpar", 300, 85,  65,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 958,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )


   OBTN_Create( cJan,  9291, "(", 300, 180,  45,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 9291,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJan,  9281, ")", 300, 232,  45,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 9281,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJan,  9541, "And", 300, 280,  45,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 9541,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )

   OBTN_Create( cJan,  9481, "Or", 300, 325,  45,  24,  .T., .T., .T.,  8, aBtnColor, aBtnFont )
   OBTN_Font( cJan, 9481,  { cFontName, nFontSize, lBold, lItalic, lUnderline, lStrikeOut } )



   

   AAdd( aButFilt , { 9598,  OBTN_Handle( cJan , 9598 ),   {||  ( PushButton( cJan  , 9598 ) , SysWait(.1) ,  lOk := SaveFiltro( lNew1  , nIdFlt )  )  } ,  cJan   } )
   AAdd( aButFilt, {  9599, OBTN_Handle( cJan, 9599 ),   {||   (PushButton( cJan, 9599 ) , xFechay() )  },  cJan   } )

  
   AAdd( aButFilt  , {  959,  OBTN_Handle( cJan, 959 ),   {|| ( PushButton( cJan, 959 ), FiltroAdx()   )  },  cJan   } )
   AAdd( aButFilt  , {  958,  OBTN_Handle( cJan, 958 ),   {||  ( PushButton( cJan, 958 ),  LimpaFilx() )  },  cJan   } )

   AAdd( aButFilt , {  9291,  OBTN_Handle( cJan, 9291 ),   {||  PushButton( cJan, 9291 ),  UpdFiltrox( '(' )   },  cJan   } )
   AAdd( aButFilt , {  9281,  OBTN_Handle( cJan, 9281 ),   {||  PushButton( cJan, 9281 ),  UpdFiltrox( ')' )   },  cJan   } )


   AAdd( aButFilt , {  9541,  OBTN_Handle( cJan, 9541 ),   {||  PushButton( cJan, 9541 ),  UpdFiltrox( 'And' )   },  cJan   } )
   AAdd( aButFilt , {  9481,  OBTN_Handle( cJan, 9481 ),   {||  PushButton( cJan, 9481 ),  UpdFiltrox( 'Or' )   },  cJan   } )

    
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 9598 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 9599 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 959 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 958 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 9291 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 9281 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 9541 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButFilt, cJan ) },    OBTN_Handle( cJan, 9481 )   ), .T. )


   OBTN_Enable( cJan, 9598, .F. )
   OBTN_Enable( cJan, 959, .F. )

   
   HMG_ChangeWindowStyle( fFiltro.Handle, WS_BORDER, NIL, .F., .T. )
   HMG_ChangeWindowStyle( fFiltro.Handle, NIL, WS_EX_STATICEDGE, .T., .T. )


   InstallEventHandler('EvFiltButton')

   If lNew1

      fFiltro. Titulo. Value := ''
      fFiltro. Valor.  Value := ''


      fFiltro.CmbOperador.value := 0
      fFiltro.CmbCampo.value    := 0

      fFiltro.EdtFiltro.Value := ''

      fFiltro.CmbOrdem.value    := 0

   End If 



   lNextOp := .f. 

   fFiltro.Show()

   fFiltro.SetFocus()

Return lOk



Function xFechay()

   
   Local i := 0
   RemoveHandler('EvFiltButton')

   i := OBTN_Handle('fFiltro' , 959) 




   DestroyWindow(   OBTN_Handle('fFiltro' , 9598)    )
   DestroyWindow(   OBTN_Handle('fFiltro' , 9599)    )
   DestroyWindow(   OBTN_Handle('fFiltro' , 959)    )


   DestroyWindow(   OBTN_Handle('fFiltro' , 958)    )
   DestroyWindow(   OBTN_Handle('fFiltro' , 9291)    )

   DestroyWindow(   OBTN_Handle('fFiltro' , 9281)    )


   DestroyWindow(   OBTN_Handle('fFiltro' , 9541)    )
   DestroyWindow(   OBTN_Handle('fFiltro' , 9481)    )
   

   fFiltro.Hide()
   

Return 



FUNCTION EvFiltButton( nHWnd, nMsg, nWParam, nLParam )

   Local nId := 1


   If nMsg == WM_DRAWITEM

		nID := LoWord( nWParam )

		If nID == IDOK
			nID := GetDlgCtrlID( GetFocus() )
		End If 

		nI1 := AScan( aButFilt   , {| n| n[ 1 ] == nId } )

		If nI1 > 0
			OBTN_Draw( nHWnd,  nWParam, nLParam )
		End If


	End If

	If nMsg == 273

		nID := LoWord( nWParam )

		If nID == IDOK
			nID := GetDlgCtrlID( GetFocus() )
		End If 

      nI1 := AScan( aButFilt, {| n | n[ 1 ] == nId } )

      If nI1 > 0
         Eval(   aButFilt[ ni1 ][ 3 ] )       
      End If
		

	End If

Return    





FUNCTION UpdFiltrox( cCar1 )

   LOCAL c1 := AllTrim( GetProperty( "fFiltro","EdtFiltro","Value" ) )

   If (cCar1 = 'And') .or. (cCar1 = 'Or')
      If !lNextOp
         yAviso(  hb_ANSIToOEM("Proximo Elemento do Filtro deve ser Uma Expressão. EX: (Codigo = '0000').") , .f. )  
         //Hb_AnsiToOem
         Return 
      End If 
   End If 


   RefreshAll( "fFiltro" )

   c1 := AllTrim( GetProperty( "fFiltro","EdtFiltro","Value" ) )

   fFiltro .EdtFiltro. value := c1 + ' ' + cCar1 

   If (cCar1 = 'And') .or. (cCar1 = 'Or')
      lNextOp := .f. 
   End If    

RETURN

Function xValidaFlt()

      Local lOk := .t. 
      Local n1  := 0 
      Local n2  := 0 
      Local n3  := 0 
      Local cTexto := Alltrim(fFiltro .EdtFiltro. value)

      For n1 := 1 To Len(Alltrim(    cTexto     ))

           If Substr(  Alltrim(    cTexto      ) , n1, 1 ) = '('

               If Substr(  Alltrim(   cTexto    ) , n1+1, 2 ) = ' )'
                  lOk := .f.       
               End If    


               n2++
           End If 

           If Substr(  Alltrim(   cTexto      ) , n1, 1 ) = ')'
               n3++

               If Substr(  Alltrim(   cTexto      ) , n1+1, 2 ) = '( '
                  lOk := .f.       
               End If    

           End If 

           
      Next    

Return ((n3 = n2) .And. (lOk))




FUNCTION ChgxFltr( cName )

   If ( Len( AllTrim(fFiltro .titulo. value ) ) > 0 ) .AND. ;
         (  !Empty( AllTrim( fFiltro .CmbCampo. Item(fFiltro .CmbCampo. Value ) ) )    )
      OBTN_Enable( 'fFiltro', 959, .T. )

      OBTN_Enable( 'fFiltro', 6600, .T. )

      //6600
   End If


   If lNovoFilt
      If  ( Len( AllTrim(fFiltro .Valor. Value ) ) > 0 ) .OR. ( fFiltro .Getdata1. Visible  ) .OR. ;
            ( fFiltro .DoubleEdit. Value > 0 ) .OR. ( fFiltro .EdtNum. Value > 0 )
         
         If ( fFiltro .CmbCampo. value > 0 )
         
         End If

      Else
         
      End If
   Else 
      OBTN_Enable( cjanx, 9598, .T. )
      OBTN_Enable( 'fFiltro', 9598, .T. )
   End If

RETURN

FUNCTION FiltroAdx()

   LOCAL cVal   := AllTrim( fFiltro .EdtFiltro. Value )


   LOCAL cTabela := cTabx
   //AllTrim( fFiltro .lblTabela. CAPTION )

   LOCAL cC1    := AllTrim( fFiltro .CmbCampo. Item( fFiltro .CmbCampo. Value ) )
   

   LOCAL cFiltro := ''
   LOCAL cMask := "999,999,999.99"

   Local cCampo
   Local cTipo 
   Local cOperador
   
   
   If Empty(Alltrim(cC1))
      yAviso("Necessario Informar o Campo para o Filtro." , .f. )  
      REturn 
   End If    


   HB_SetCodePage('UTF8')

   cCampo := Lower( GetInfoDic(    cC1, cTabela, 'CAMPO' ) )

   cTipo  := AllTrim( GetInfoDic(    cC1, cTabela, 'TIPO' ) )

   cOperador := Left( AllTrim( fFiltro .CmbOperador. DisplayValue ), 2 )

    cValor := AllTrim( fFiltro .Valor. Value )


   If (lNextOp)
      yAviso("Proximo Elemento do Filtro deve ser Um Operador Relacional. EX: ( And , Or )." , .f. )  
      Return 
   End If 



   If  ( ( cTipo == 'I' ) .OR. ( cTipo == 'B' ) )

      If IsAlpha( cValor )
         Aviso( 'Formato Invalido para Tipo Numerico.' )
         fFiltro .Valor. Value := ''
         Return 
      End If

      If ( cTipo == 'I' )
         cValor := AllTrim( Str( fFiltro .EdtNum. Value ) )
      Else 
         cValor := AllTrim( Transform( fFiltro .DoubleEdit . Value, cMask ) )
      End If

   End If

   If AllTrim( fFiltro .CmbOperador. DisplayValue ) = 'CONTEM'
      If ( cTipo != 'C' )
         yAviso( "Operador 'CONTEM' funciona apenas com campos Tipo Caracter." , .f. )
         RETURN
      End If
   End If

   If ( cTipo == 'C' )
      If AllTrim( fFiltro .CmbOperador. DisplayValue ) != 'Co'
         cFiltro := AllTrim( cCampo ) + ' ' + coperador + ' ' + Chr( 39 ) + AllTrim( cValor ) + Chr( 39 )
         
      Else
         cFiltro := AllTrim( cCampo ) + ' LIKE ' + Chr( 39 ) + AllTrim( cValor ) + '%' + Chr( 39 )         
      End If

   End If



   If ( cTipo == 'I' ) .OR. ( cTipo == 'B' ) .OR. ( cTipo == 'N' )
      cFiltro := AllTrim( cCampo ) + ' ' +  cOperador + ' ' + cValor
   End If

   If ( cTipo == 'D' )

      // '2018-01-15

      cValor   := DToC( fFiltro .GetData1. Value )
      cValDate := Right( cValor, 4 ) + '-' + SubStr( cValor, 4, 2 ) + '-' + Left( cValor, 2 )
      cFiltro := AllTrim( cCampo ) + ' ' + coperador + ' '  + Chr( 39 ) + cValDate + Chr( 39 )

   End If

   SetProperty( 'fFiltro', 'DoubleEdit', 'Value', 0 )
   SetProperty( 'fFiltro', 'EdtNum', 'Value', 0 )
   SetProperty( 'fFiltro', 'Valor', 'Value', '' )

   fFiltro .CmbCampo. Value := 1
   fFiltro .CmbOrdem. Value := 1

   
   fFiltro .EdtFiltro. Value := cVal +  ' ' + cFiltro


   OBTN_Enable( 'fFiltro', 9598, .T. )
   OBTN_Enable( 'fFiltro', 959, .F. )

   DoMethod( 'fFiltro', 'cmbCampo', 'SetFocus' )

   lNextOp := .t.

RETURN

STATIC FUNCTION LimpaFilx()

   fFiltro .EdtFiltro. Value := ''

   OBTN_Enable( 'fFiltro', 9598, .F. )
   OBTN_Enable( 'fFiltro', 959, .F. )

   SetProperty( 'fFiltro', 'DoubleEdit', 'Value', 0 )
   SetProperty( 'fFiltro', 'EdtNum', 'Value', 0 )
   SetProperty( 'fFiltro', 'Valor', 'Value', '' )

   fFiltro .CmbCampo. Value := 1
   fFiltro .CmbOrdem. Value := 1

   lNextOp := .f. 

RETURN

STATIC FUNCTION SaveFiltro( lNovo, nIdFiltro1 )

   LOCAL lOk := .F.
   LOCAL cSQl := ''
   LOCAL oSErver
   LOCAL oQuery

   // Local cSql

   DEFAULT lNovo := .T.   
     

   /*
   If At("()", Alltrim(fFiltro.EdtFiltro.Value)) > 0
      yAviso("Elemento Invalido () para o Filtro." , .f. )  
      Return .f. 
   End If    
   */     

   If !xValidaFlt()
       yAviso( hb_ANSIToOEM("Inconsistencias Detectadas no Filtro com Relação aos Parenteses ( ) .)" ) , .f. )  
       Return .f. 
   End If    

   If Empty(  Alltrim(fFiltro .Titulo. Value)   )
      yAviso( hb_ANSIToOEM("O Titulo do Filtro deve estar Informado para Realizar Gravação. ") , .f. )  
      Return .f. 
   End If 


   xFechay()      


   If xDialog( hb_AnsiToOem("Confirma Gravação desse Filtro ? ") , .T. )   
     
      If lNovo
         lOk := GrvFiltro( cTabx, AllTrim( fFiltro .Titulo. Value ), AllTrim( fFiltro .EdtFiltro. Value ),  fFiltro .CmbOrdem. DisplayValue, ;
            fFiltro .ChkOrdem. Value  )

      Else 


         cSQl := "Update filtros set filtro = " + Chr( 34 ) + AllTrim( fFiltro .EdtFiltro. Value ) +  Chr( 34 ) +  " , descricao = '" + AllTrim( fFiltro .Titulo. Value ) + "',"
         cSQl += "ordem = '" + AllTrim( ffiltro .CmbOrdem. DisplayValue )  + "',crescente = '" +  iif( fFiltro .Chkordem. value, 'S', 'N' ) + "' Where idFiltros = " + AllTrim( Str( nIdFiltro1 ) )

         // msginfo(cSql)

         oServer := GetConexao()
         oQuery := oServer:Query( cSql )


         If oQuery:NetErr()

            MsgStop( 'Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error(), .F. )

            
            oServer:Destroy()
            oServer := Nil

            oQuery:Destroy()
            oQuery := Nil

            Return .F.

         End If

         lOk := .T.

         oServer:Destroy()
         oServer := Nil

         oQuery:Destroy()
         oQuery := Nil



      END IF

   Else 
      DoMethod( 'fFiltro', 'SetFocus' )      

   End If

   //SysWait( .2 )

   If lOk 
      
      //SysWait( .2 )
      yAviso('Filtro Gravado com Sucesso!' , .f. )
      xLoadFiltros( cTabx , .t. )

   End If 

RETURN lOk


FUNCTION gField()

   LOCAL cCampo := hb_ANSIToOEM(fFiltro .CmbCampo. DisplayValue)
   LOCAL cTabela := AllTrim( cTabx )
   LOCAL cTipo := ''

   
   LOCAL cMask

   If ( Empty( Alltrim(cCampo) ) )
         Return 
   End If

   //msginfo(cCampo)


   HB_SetCodePage("UTF8")

   //HB_SetCodePage("PT850")


   cCampo := fFiltro .CmbCampo. item(   fFiltro .CmbCampo.Value  )

   //msginfo(cCampo)

   cTipo := AllTrim( GetInfoDic( cCampo, cTabela, 'TIPO' ) )
   cMask := AllTrim( GetInfoDic( cCampo, cTabela, 'MASCARA' ) )

   SetProperty( "fFiltro", "Valor", "InputMask", NIL )

   SetProperty( "fFiltro", "GetData1", "Visible", .F. )
   SetProperty( "fFiltro", "DoubleEdit", "Visible", .F. )
   SetProperty( "fFiltro", "Valor", "Visible", .F. )
   SetProperty( "fFiltro", "EdtNum", "Visible", .F. )

   If cTipo == 'D'

      SetProperty( "fFiltro", "GetData1", "Visible", .T. )
      SetProperty( "fFiltro", "GetData1", "Col", 150 )
      SetProperty( "fFiltro", "Valor", "Visible", .F. )

      // SetProperty( 'fFiltro', 'BtnOk', 'Enabled', .T. )
      OBTN_Enable( 'fFiltro', 6600, .T. )
      // Aviso('kk')

      DO EVENTS

   End If


   If ( cTipo == 'B' )

      SetProperty( "fFiltro", "DoubleEdit", "Visible", .T. )
      SetProperty( "fFiltro", "DoubleEdit", "Col", 150 )
      SetProperty( "fFiltro", "DoubleEdit", "Row", 116 )

      fFiltro .DoubleEdit. Value := AllTrim( Transform( 0, cMask ) )
      SendMessage( GetControlHandle( "DoubleEdit", ThisWindow.Name ), WM_PAINT, 0, 0 )

      // fFiltro .Btnok. Enabled := .T.
      OBTN_Enable( 'fFiltro', 6600, .T. )
      fFiltro .DoubleEdit. SetFocus()
      // fFiltro .Valor. Refresh()
   End If


   If ( cTipo == 'N' ) .OR. ( cTipo == 'I' )


      SetProperty( "fFiltro", "EdtNum", "Visible", .T. )
      SetProperty( "fFiltro", "EdtNum", "Col", 150 )
      SetProperty( "fFiltro", "EdtNum", "Row", 116 )

      fFiltro .EdtNum. Value := AllTrim( Transform( 0, cMask ) )
      SendMessage( GetControlHandle( "EdtNum", ThisWindow.Name ), WM_PAINT, 0, 0 )

      fFiltro .EdtNum. SetFocus()

   End If

   If cTipo == 'C'
      SetProperty( "fFiltro", "Valor", "Visible", .T. )
      fFiltro .Valor. Value := ''
      SendMessage( GetControlHandle( "Valor", ThisWindow.Name ), WM_PAINT, 0, 0 )
      OBTN_Enable( 'fFiltro', 6600, .T. )
      fFiltro .Valor. SetFocus()
   End If


   If ( Len( AllTrim(fFiltro .titulo. value ) ) > 0 )
      OBTN_Enable( 'fFiltro', 959, .T. )
   End If


   DO EVENTS

RETURN

FUNCTION GrvFiltro( cTabela, cDescr, cFiltro, cOrdem, lCresc )

	LOCAL nIdFilt := GetReg( "filtros" , "idfiltros")
	LOCAL oServer := GetConexao()

	LOCAL cSql := "insert into filtros values(" + AllTrim( Str( nIdFilt + 1 ) ) + "," + Chr( 34 ) + cdescr + Chr( 34 ) + "," + Chr( 34 ) + ;
		cTabela + Chr( 34 ) + "," + Chr( 34 ) + cFiltro + Chr( 34 ) + "," + Chr( 34 ) + "S" + Chr( 34 ) + "," + Chr( 34 ) + cOrdem + Chr( 34 ) + "," + ;
		Chr( 34 ) + iif( lCresc, " ", "N" ) + Chr( 34 ) + ")"

	hb_MemoWrit( 'SqlInsert.txt', cSql )

	oQuery := oServer:Query(  cSql )

	If oServer:NetErr()
		yAviso( "Error ao Executar Query " + cSql + " : " + oServer:Error()  , .f. )

		
		oServer:Destroy()
		oServer := Nil

		oQuery:Destroy()
		oQuery := Nil

		RETURN .F.

	End If 

	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

Return .T.


