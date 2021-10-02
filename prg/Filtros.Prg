// 25-09

#include <hmg.ch>

REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850

#define QUEBRA Chr(13)+Chr(10)




FUNCTION LoadFitros( cTabela1 )

   LOCAL lBold      := .F.
   LOCAL lItalic    := .F.
   LOCAL lUnderline := .F.
   LOCAL lStrikeOut := .F.
   LOCAL oSErver
   LOCAL nIndexFiltro := 0
   LOCAL oQuery
   LOCAL oRo
   LOCAL cCab1 := hb_ANSIToOEM( 'Expressão' )

   PRIVATE aHed1 := { 'Id', 'Filtro', cCab1 }


   PRIVATE cTabx := cTabela1
   PRIVATE aCampos1 := {}

   PRIVATE cFiltrox1 := ''

   SET LANGUAGE TO PORTUGUESE
   SET CODEPAGE TO PORTUGUESE

   HB_SetCodePage( "PT850" )
   hb_langSelect( "PT" )

   Load Window fFiltrosCad

   Center Window fFiltrosCad

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

   AAdd( aButx1, {  1599,  OBTN_Handle( cJanx, 1599 ),   {||   _FechaJan( cJanx )   },  cJanx   } )

   AAdd( aButx1, {  1597,  OBTN_Handle( cJanx, 1597 ),   {||  PushButton( cJanx, 1597 ), SysWait( .1 ), iif( xNovoFilt(), xLoadFiltros(cTabx ), )  },  cJanx   } )

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

   ON KEY ESCAPE of fFiltrosCad action fFiltrosCad.Release()

   // EventProcessAllHookMessage(nIndexFiltro   := EventCreate (  { ||   EventConsu()  }  ) , .t.)

   // If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( 'EventConsu'  ) )  )  = 0
   InstallEventHandler(  'EventConsu' )
   // End If


   activate Window fFiltrosCad


   RemoveHandler( 'EventConsu' )

RETURN cFiltrox1

FUNCTION SetFiltOk()

   LOCAL nI1 := fFiltrosCad .GridFiltro. value
   LOCAL am1 := fFiltrosCad .GridFiltro. item( ni1 )

   // msginfo( am1[3] )

   IF !Empty( am1[ 3 ] )
      Domethod( 'fFiltrosCad', 'Release' )
   END IF

RETURN am1[ 3 ]

FUNCTION xExclFiltro()

   LOCAL a1   := fFiltrosCad .GridFiltro. Value
   LOCAL aMtr := fFiltrosCad .GridFiltro. item( a1 )
   LOCAL cSqlx1
   LOCAL oServer
   LOCAL oQuery

   IF Confirmaviso( "Confirma  Exclusão desse Filtro ? ", , , , .F. )

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



   ELSE

   END IF

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

   IF fFiltrosCad .GridFiltro. Value > 0
      OBTN_Enable( cJanx, 1595, .T. )
      OBTN_Enable( cJanx, 1596, .T. )

      OBTN_Enable( cJanx, 1598, .T. )

      // msginfo('ok')
   END IF

RETURN

FUNCTION xLoadFiltros( cTabela1 )

   LOCAL cSqlx1 := "select * from filtros where tabela = '" + cTabela1 + "' and ativo = 'S'"
   LOCAL oServer := GetConexao()
   LOCAL oRow
   LOCAL oQuery  := oServer:Query( cSqlx1 )

   fFiltrosCad .Gridfiltro. Deleteallitems()

   FOR n1 := 1 TO oQuery:LastRec()
      oRow := oQuery:GetRow( n1 )

      Domethod( 'fFiltroscad', 'GridFiltro', 'addItem', { AllTrim( Str(GetCampo(oRow,'IdFiltros' ) ) ),   GetCampo( oRow,'descricao' ), GetCampo( oRow,'filtro' ) } )
   NEXT

   fFiltrosCad .LblQtFiltro. Value := AllTrim( Str( oQuery:LastRec()    ) )

   IF ( oQuery:LastRec() > 0 )
      // OBTN_Enable( cJanx , 1595, .t. )
      // OBTN_Enable( cJanx , 1596, .t. )
      Domethod( 'fFiltroscad', 'GridFiltro', 'SetFocus' )
   END IF

   oServer:Destroy()
   oQuery:Destroy()

   // SysWait(.8)
   // Refreshall('fFiltrosCad')

RETURN


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
   LOCAL aCabec  := GetCamposDic( cTabela, ' ', .F. )
   LOCAL cSqlx1

   LOCAL nIdFlt := nIdFiltro

   // Local oServer
   // Local oQuery

   DEFAULT lNew1 := .T.

   PRIVATE lNovoFilt := lNew1

   Load Window fFiltro

   Center Window fFiltro

   // fFiltro.chkOrdem.visible := .f.

   fFiltro .Lbltabela. value := cTabela

   cJanx := cJan

   ON KEY ESCAPE OF fFiltro action ( _FechaJan( cJanx ), cJanx := 'fFiltrosCad',  refreshall( 'fFiltrosCad' ), Domethod( 'fFiltrosCad','SetFocus' ) )

   PRIVATE aBtx := {}

   WHILE n1 <= Len( aCabec )

      IF !Empty( AllTrim( aCabec[ n1 ] ) )
         fFiltro .cmbCampo. Additem( hb_ANSIToOEM( aCabec[ n1 ] ) )
         fFiltro .cmbOrdem. Additem( hb_ANSIToOEM( aCabec[ n1 ] ) )
         AAdd( aCampos1, hb_ANSIToOEM( aCabec[ n1 ] ) )
      END IF
      n1++

   ENDDO

   IF !lNew1

      cSqlx1 := "select * from filtros where tabela = '" + cTabela + "' and idFiltros = " + AllTrim( Str( nIdFiltro ) )
      oServer := GetConexao()
      // oRow
      oQuery  := oServer:Query( cSqlx1 )

      IF !oQuery:Eof()

         oRow := oQuery:GetRow( 1 )

         fFiltro .titulo. value    := GetCampo( oRow, 'descricao' )
         fFiltro .EdtFiltro. value := GetCampo( oRow, 'filtro' )

         IF !Empty( GetCampo( oRow, 'ordem' ) )

            fFiltro .cmbOrdem. value := AScan( aCampos1,  AllTrim( GetCampo(oRow, 'ordem' ) ) )
         END IF

      END IF


      oQuery:Destroy()
      oSErver:Destroy()


   END IF

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





   // AAdd( aButx1, { 9598,  OBTN_Handle( cJan , 9598 ),   {||  ( PushButton( cJan  , 9598 ) , Iif( lOk := (SaveFiltro( lNew1  , nIdFlt )) , (DoMethod('fFiltro','Release'),DoMethod('fFiltrosCad','Release') ,ProcFiltro( cTabela )   ) ,    ) )  } ,  cJan   } )

   AAdd( aButx1, { 9598,  OBTN_Handle( cJan, 9598 ),   {||  ( PushButton( cJan, 9598 ), iif( lOk := (SaveFiltro( lNew1, nIdFlt ) ),  (_FechaJan( 'fFiltro' ), _FechaJan('fFiltrosCad' ),ProcFiltro( cTabela, .F. )   ),    ) )  },  cJan   } )
   AAdd( aButx1, {  9599, OBTN_Handle( cJan, 9599 ),   {||  ( _FechaJan(cJanx ), cJanx := 'fFiltrosCad',  refreshall('fFiltrosCad' ), Domethod('fFiltrosCad','SetFocus' ) )  },  cJan   } )

   AAdd( aButx1, {  959,  OBTN_Handle( cJan, 959 ),   {|| ( PushButton( cJan, 959 ), FiltroAdx()   )  },  cJan   } )
   AAdd( aButx1, {  958,  OBTN_Handle( cJan, 958 ),   {||  ( PushButton( cJan, 958 ),  LimpaFilx() )  },  cJan   } )

   AAdd( aButx1, {  9291,  OBTN_Handle( cJan, 9291 ),   {||  PushButton( cJan, 9291 ),  UpdFiltrox( '(' )   },  cJan   } )
   AAdd( aButx1, {  9281,  OBTN_Handle( cJan, 9281 ),   {||  PushButton( cJan, 9281 ),  UpdFiltrox( ')' )   },  cJan   } )


   AAdd( aButx1, {  9541,  OBTN_Handle( cJan, 9541 ),   {||  PushButton( cJan, 9541 ), sysWait( .5 ), UpdFiltrox( 'And' )   },  cJan   } )
   AAdd( aButx1, {  9481,  OBTN_Handle( cJan, 9481 ),   {||  PushButton( cJan, 9481 ), sysWait( .5 ), UpdFiltrox( 'Or' )   },  cJan   } )


   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 9598 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 9599 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 959 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 958 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 9291 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 9281 )   ), .T. )

   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 9541 )   ), .T. )
   EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJan ) },    OBTN_Handle( cJan, 9481 )   ), .T. )

   OBTN_Enable( cjan, 9598, .F. )
   OBTN_Enable( cjan, 959, .F. )

   // EventProcessAllHookMessage( EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 1599 )   ), .T. )

   HMG_ChangeWindowStyle( fFiltro.Handle, WS_BORDER, NIL, .F., .T. )
   HMG_ChangeWindowStyle( fFiltro.Handle, NIL, WS_EX_STATICEDGE, .T., .T. )
   // HMG_ChangeWindowStyle( GetControlHandle( 'Titulo' , 'fFiltro')   , NIL, WS_EX_STATICEDGE , .T., .T.)




   Activate Window fFiltro

RETURN lOk


FUNCTION UpdFiltrox( cCar1 )

   LOCAL c1 := AllTrim( GetProperty( "fFiltro","EdtFiltro","Value" ) )

   // msginfo( cCar1 )

   RefreshAll( "fFiltro" )

   c1 := AllTrim( GetProperty( "fFiltro","EdtFiltro","Value" ) )
   // msginfo( c1 )

   fFiltro .EdtFiltro. value := c1 + ' ' + cCar1 + ' '
   // DoMethod("fFiltro","EdtFiltro","Refresh")

   // SysWait(.2)

   // msginfo( fFiltro.EdtFiltro.value  )

RETURN

FUNCTION ChgxFltr( cName )

   IF ( Len( AllTrim(fFiltro .titulo. value ) ) > 0 ) .AND. ;
         (  !Empty( AllTrim( fFiltro .CmbCampo. Item(fFiltro .CmbCampo. Value ) ) )    )
      OBTN_Enable( 'fFiltro', 959, .T. )
   END IF


   IF lNovoFilt
      IF  ( Len( AllTrim(fFiltro .Valor. Value ) ) > 0 ) .OR. ( fFiltro .Getdata1. Visible  ) .OR. ;
            ( fFiltro .DoubleEdit. Value > 0 ) .OR. ( fFiltro .EdtNum. Value > 0 )
         // msginfo('p ' + cName )

         IF ( fFiltro .CmbCampo. value > 0 )
            // OBTN_Enable( cjanx , 959, .t. )
         END IF

      ELSE
         // OBTN_Enable( cjanx , 959 , .f. )
      END IF
   ELSE
      OBTN_Enable( cjanx, 9598, .T. )
   END IF

RETURN

FUNCTION FiltroAdx()

   LOCAL cVal   := AllTrim( fFiltro .EdtFiltro. Value )

   LOCAL cTabela := AllTrim( fFiltro .lblTabela. CAPTION )

   LOCAL cC1    := AllTrim( fFiltro .CmbCampo. Item( fFiltro .CmbCampo. Value ) )

   LOCAL cFiltro := ''
   LOCAL cMask := "999,999,999.99"

   // Local cCampo := Left( cc1 , Len(cc1) - 2 )

   LOCAL cCampo := Lower( GetInfoDic( cC1, cTabela, 'CAMPO' ) )

   LOCAL cTipo  := AllTrim( GetInfoDic( cC1, cTabela, 'TIPO' ) )

   LOCAL cOperador := Left( AllTrim( fFiltro .CmbOperador. DisplayValue ), 2 )


   LOCAL cValor := AllTrim( fFiltro .Valor. Value )



   IF ( ( cTipo == 'I' ) .OR. ( cTipo == 'B' ) )

      IF IsAlpha( cValor )
         Aviso( 'Formato Invalido para Tipo Numerico.' )
         fFiltro .Valor. Value := ''
         RETURN
      END IF

      IF ( cTipo == 'I' )
         cValor := AllTrim( Str( fFiltro .EdtNum. Value ) )
      ELSE
         cValor := AllTrim( Transform( fFiltro .DoubleEdit . Value, cMask ) )
      END IF

   END IF

   IF AllTrim( fFiltro .CmbOperador. DisplayValue ) = 'CONTEM'
      IF ( cTipo != 'C' )
         MsgExclamation( "Operador 'CONTEM' funciona apenas com campos Tipo Caracter." )
         RETURN
      END IF
   END IF

   IF ( cTipo == 'C' )
      IF AllTrim( fFiltro .CmbOperador. DisplayValue ) != 'CONTEM'
         cFiltro := AllTrim( cCampo ) + ' ' + coperador + ' ' + Chr( 39 ) + AllTrim( cValor ) + Chr( 39 )
         // msginfo(cFiltro)
      ELSE
         cFiltro := AllTrim( cCampo ) + ' LIKE ' + Chr( 39 ) + AllTrim( cValor ) + '%' + Chr( 39 )
         // msginfo(cFiltro)
      END IF
   END IF

   IF ( cTipo == 'I' ) .OR. ( cTipo == 'B' ) .OR. ( cTipo == 'N' )
      cFiltro := AllTrim( cCampo ) + ' ' +  cOperador + ' ' + cValor
   END IF

   IF ( cTipo == 'D' )

      // '2018-01-15

      cValor   := DToC( fFiltro .GetData1. Value )
      cValDate := Right( cValor, 4 ) + '-' + SubStr( cValor, 4, 2 ) + '-' + Left( cValor, 2 )
      cFiltro := AllTrim( cCampo ) + ' ' + coperador + ' '  + Chr( 39 ) + cValDate + Chr( 39 )

   END IF

   SetProperty( 'fFiltro', 'DoubleEdit', 'Value', 0 )
   SetProperty( 'fFiltro', 'EdtNum', 'Value', 0 )
   SetProperty( 'fFiltro', 'Valor', 'Value', '' )

   fFiltro .CmbCampo. Value := 1
   fFiltro .CmbOrdem. Value := 1

   // msginfo(cFiltro)

   fFiltro .EdtFiltro. Value := cVal +  ' ' + cFiltro

// OBTN_Enable( 'fFiltro', 9598, .t. )

   OBTN_Enable( 'fFiltro', 9598, .T. )
   OBTN_Enable( 'fFiltro', 959, .F. )

   DoMethod( 'fFiltro', 'cmbCampo', 'SetFocus' )

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

RETURN

STATIC FUNCTION SaveFiltro( lNovo, nIdFiltro1 )

   LOCAL lOk := .F.
   LOCAL cSQl := ''
   LOCAL oSErver
   LOCAL oQuery

   // Local cSql

   DEFAULT lNovo := .T.

   IF Confirmaviso( "Confirma Gravação desse Filtro ? ", , .F. )

      IF lNovo
         lOk := GrvFiltro( cTabx, AllTrim( fFiltro .Titulo. Value ), AllTrim( fFiltro .EdtFiltro. Value ),  fFiltro .CmbOrdem. DisplayValue, ;
            fFiltro .ChkOrdem. Value  )
      ELSE


         cSQl := "Update filtros set filtro = " + Chr( 34 ) + AllTrim( fFiltro .EdtFiltro. Value ) +  Chr( 34 ) +  " , descricao = '" + AllTrim( fFiltro .Titulo. Value ) + "',"
         cSQl += "ordem = '" + AllTrim( ffiltro .CmbOrdem. DisplayValue )  + "',crescente = '" +  iif( fFiltro .Chkordem. value, 'S', 'N' ) + "' Where idFiltros = " + AllTrim( Str( nIdFiltro1 ) )

         // msginfo(cSql)

         oServer := GetConexao()
         oQuery := oServer:Query( cSql )


         IF oQuery:NetErr()
            MsgStop( 'Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error(), .F. )
            RETURN .F.
         END IF

         lOk := .T.

         oServer:Destroy()
         oServer := Nil

         oQuery:Destroy()
         oQuery := Nil

      END IF

   ELSE
      DoMethod( 'fFiltro', 'SetFocus' )
      SysWait( .2 )

   END IF

RETURN lOk


FUNCTION gField()

   LOCAL cCampo := fFiltro .CmbCampo. DisplayValue
   LOCAL cTabela := AllTrim( fFiltro .lblTabela. CAPTION )
   LOCAL cTipo := ''

   // Local cTipo
   LOCAL cMask

   IF ( Empty( cCampo ) )
      RETURN
   END IF



   cTipo := AllTrim( GetInfoDic( cCampo, cTabela, 'TIPO' ) )
   cMask := AllTrim( GetInfoDic( cCampo, cTabela, 'MASCARA' ) )

   SetProperty( "fFiltro", "Valor", "InputMask", NIL )

   SetProperty( "fFiltro", "GetData1", "Visible", .F. )
   SetProperty( "fFiltro", "DoubleEdit", "Visible", .F. )
   SetProperty( "fFiltro", "Valor", "Visible", .F. )
   SetProperty( "fFiltro", "EdtNum", "Visible", .F. )

   IF cTipo == 'D'

      SetProperty( "fFiltro", "GetData1", "Visible", .T. )
      SetProperty( "fFiltro", "GetData1", "Col", 150 )
      SetProperty( "fFiltro", "Valor", "Visible", .F. )

      // SetProperty( 'fFiltro', 'BtnOk', 'Enabled', .T. )
      OBTN_Enable( 'fFiltro', 6600, .T. )
      // Aviso('kk')

      DO EVENTS

   END IF

   IF ( cTipo == 'B' )

      SetProperty( "fFiltro", "DoubleEdit", "Visible", .T. )
      SetProperty( "fFiltro", "DoubleEdit", "Col", 150 )
      SetProperty( "fFiltro", "DoubleEdit", "Row", 116 )

      fFiltro .DoubleEdit. Value := AllTrim( Transform( 0, cMask ) )
      SendMessage( GetControlHandle( "DoubleEdit", ThisWindow.Name ), WM_PAINT, 0, 0 )

      // fFiltro .Btnok. Enabled := .T.
      OBTN_Enable( 'fFiltro', 6600, .T. )
      fFiltro .DoubleEdit. SetFocus()
      // fFiltro .Valor. Refresh()
   END IF


   IF ( cTipo == 'N' ) .OR. ( cTipo == 'I' )


      SetProperty( "fFiltro", "EdtNum", "Visible", .T. )
      SetProperty( "fFiltro", "EdtNum", "Col", 150 )
      SetProperty( "fFiltro", "EdtNum", "Row", 116 )

      fFiltro .EdtNum. Value := AllTrim( Transform( 0, cMask ) )
      SendMessage( GetControlHandle( "EdtNum", ThisWindow.Name ), WM_PAINT, 0, 0 )

      fFiltro .EdtNum. SetFocus()

   END IF

   IF cTipo == 'C'
      SetProperty( "fFiltro", "Valor", "Visible", .T. )
      fFiltro .Valor. Value := ''
      SendMessage( GetControlHandle( "Valor", ThisWindow.Name ), WM_PAINT, 0, 0 )
      OBTN_Enable( 'fFiltro', 6600, .T. )
      fFiltro .Valor. SetFocus()
   END IF


   IF ( Len( AllTrim(fFiltro .titulo. value ) ) > 0 )
      OBTN_Enable( 'fFiltro', 959, .T. )
   END IF


   DO EVENTS

RETURN
