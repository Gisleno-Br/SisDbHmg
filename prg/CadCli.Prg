#include <hmg.ch>

// DECLARE WINDOW fCliCad
// 25/09


STATIC lTracking55 := .F.

DECLARE WINDOW fCadcli

DECLARE WINDOW fProgress

DECLARE WINDOW fNewCadcli

// DECLARE WINDOW fCadcli1
// DECLARE WINDOW fCadcli2









REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850


FUNCTION xInitFrm()


   
   HB_SETCODEPAGE("PT850")   


   Load Window fCadCli


   HMG_ChangeWindowStyle(  fCadCli.Handle, WS_EX_DLGMODALFRAME, NIL, .T., .T. )



   ON KEY F5 OF fCadCli ACTION xPesqCep()

   // RefreshAll('fCadCli')

   // syswait(.2)

   // fCadcli.Image_1.Visible := .t.

   Center Window fCadCli

RETURN



FUNCTION xCadCli( lNew, cCodigo1 )

   LOCAL aValores := {}
   LOCAL cSalvaJan := cActiveJan
   LOCAL aMx       := {}

// l1 := xrt1()





   PRIVATE cDiaName := 'fCadCli'

   PRIVATE nIndexDlg := 0

   PRIVATE nZa1 := 0
   PRIVATE nZa2 := 0

   Private aMUf  := {}




   PRIVATE aUf      := {}
   PRIVATE aCidades := {}
   PRIVATE aBairros := {}

   PRIVATE lNovo     := lNew
   PRIVATE cCodclien := cCodigo1

   PRIVATE aButCli := {}



   lOkCad := .F.


   PRIVATE aButx1 := {}
   PRIVATE cJanx1  := ''

   xInitFrm()


   ON KEY ESCAPE OF fCadCli ACTION _FechaJan( 'fCadCli' )


   InstallEventHandler( 'EventClih' )


   Activate Window fCadCli


   RemoveHandler( 'EventClih' )

RETURN




FUNCTION xInitCad()

   cJanx := 'fCadCli'


   aRotHnd := {}


   EncheCmb( 'fCadcli', 'CmbCidade', "select municipio from ibge where uf = '" + cUfEmp + "' order by 1" )
   EncheCmb( 'fCadcli', 'CmbCidEnt', "select municipio from ibge where uf = '"  + cUfEmp + "' order by 1" )

   EncheCmb( 'fCadcli', 'CmbClasse', "select descricao from classes where status = 'Normal' order by 1" )



   EncheCmb( 'fCadcli', 'CmbCategoria', "select descricao from categorias where status = 'Normal' order by 1" )


   aMUf := EncheCmb( 'fCadcli', 'CmbUf', "select distinct uf from ibge order by 1" )

   SetProperty( 'fCadcli', 'CmbUf', 'Value', 2 )


   cJanx := 'fCadCli'


   OBTN_Create( cJanx, 353, "&Ok", 420, 670,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
   OBTN_Create( cJanx, 54, "&Cancelar", 420, 735,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

   OBTN_Create( 'fCadCli', 98, "&Consultar CEP", 148, 479,  82,  22,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )


   OBTN_Font( cJanx, 353,  { cFontName, nFontSize, .F., .F., .F., .F. } )
   OBTN_Font( cJanx, 54,  { cFontName, nFontSize, .F., .F., .F., .F. } )

   OBTN_Font( 'fCadCli', 98,  { cFontName, nFontSize, .F., .F., .F., .F. } )

   OBTN_Enable( cJanx, 353, .F. )


   AAdd( aButCli, {  353,  OBTN_Handle( cJanx, 353 ),   {|| ( PushButton( cJanx, 353 ), GrvClien(lNovo ) )    },  cJanx   } )
   AAdd( aButCli, {  54,  OBTN_Handle( cJanx, 54 ),   {||  _FechaJan( cJanx )  },  cJanx   } )

// AAdd( aButCli, {  98 ,  OBTN_Handle(  'fCadCli' , 98 ),   { || ( PushButton( 'fCadCli' , 98) , xPesqCep() )  } ,  'fCadCli'   } )

// msginfo('ok')


// Do Events

   EventProcessAllHookMessage( nZa1 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 353 )   ), .T. )
   EventProcessAllHookMessage( nZa2 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 54 )   ), .T. )


   EventProcessAllHookMessage( nZa3 := EventCreate( {|| InputEvButton( aButx1, 'fCadCli' ) },    OBTN_Handle( 'fCadCli', 98 )   ), .T. )


   ON KEY ESCAPE OF fCadCli Action DoMethod( cDiaName, "Release" )

   IF !lNovo
      LoadCliente(  cCodClien )
   ELSE


   END IF

   HabilGrv()


   fCadCli .nome. SetFocus()

RETURN



FUNCTION EventClih( nHWnd, nMsg, nWParam, nLParam )

// FUNCTION EventConsu()

   LOCAL nID
   LOCAL ButHnd
   LOCAL nRow, nCol
   LOCAL nind1
   LOCAL cJanela := cJanx
   LOCAL cControl := ''
   LOCAL cform := ''


   IF nMsg == WM_DRAWITEM


      nID := LoWord( nWParam )

      IF nID == IDOK
         nID := GetDlgCtrlID( GetFocus() )
      ENDIF

      nI1 := AScan( aButCli, {| n | n[ 1 ] == nId } )

      IF nI1 > 0
         OBTN_Draw( nHWnd,  nWParam, nLParam )
      END IF


   END IF

   IF nMsg == 273

      nID := LoWord( nWParam )

      IF nID == IDOK
         nID := GetDlgCtrlID( GetFocus() )
      ENDIF

      nI1 := AScan( aButCli, {| n | n[ 1 ] == nId } )

      IF nI1 > 0
         Eval(   aButCli[ ni1 ][ 3 ] )
      END IF


      IF nId == 6598

      END IF

      IF nId == 6599

      END IF

   END IF

// END IF

RETURN NIL





FUNCTION gColor1( cJan, cObj )

   SetProperty(  cJan, cObj, "BACKCOLOR", { 28, 157, 189 } )
   SetProperty(  cJan, cObj, "FONTCOLOR", { 255, 255, 255 } )

// HabilGrv()

RETURN



FUNCTION gColor2( cJan, cObj )

   SetProperty(  cJan, cObj, "BACKCOLOR", { 255, 255, 255 } )
   SetProperty(  cJan, cObj, "FONTCOLOR", { 0, 0, 0 } )

// HabilGrv()

RETURN


FUNCTION LoadCliente(  cCod )

   LOCAL cSql := "Select * from clientes where codigo = '" + cCod + "'"

   LOCAL oServer := GetConexao()
   LOCAL oQuery := oServer:Query( cSql )
   LOCAL oRow

   LOCAL aUf
   LOCAL aBairros

   IF oQuery:LastRec() > 0

      oRow := oQuery:GetRow( 1 )

      fCadCli .lblCodigo. Value := cCod

      fCadCli .nome. value     := GetCampo( oRow, 'nome' )
      fCadCli .Cnpj. value     := GetCampo( oRow, 'cpf' )
      fCadCli .endereco. value := GetCampo( oRow, 'endereco' )




      fCadCli .lblSaldo. Value     := AllTrim( Transform(    GetCampo(oRow, 'Saldo' ), "@E 999,999,999.99"  ) )
      fCadCli .lblAcumulado. Value := AllTrim( Transform(    GetCampo(oRow, 'acumulado' ), "@E 999,999,999.99"  ) )

      fCadCli .LblQtVendas. Value := AllTrim( Str( GetCampo(oRow, 'QtPeds' )  ) )

      fCadCli .lblMaior. Value := AllTrim( Transform(    GetCampo(oRow, 'MaiorCompra' ), "@E 999,999,999.99"  ) )

      fCadCli .LblDtBloq. Value := GetCampo( oRow, 'dtbloqueio' )

      fCadCli .LblUltCompra. Value := GetCampo( oRow, 'dtultcompra' )

      fCadcli .LblUltAtuCad. Value := GetCampo( oRow, 'dtmodcad' )

      fCadcli .LblDtCad. Value := GetCampo( oRow, 'dtcadastro' )


      fCadCli .cmbbairros. Displayvalue := GetCampo( oRow, 'bairro' )

      fCadCli .fantasia. value := GetCampo( oRow, 'fantasia' )
      fCadCli .contato. value := GetCampo( oRow, 'contato' )

      fCadCli .CmbTipo. value := iif( GetCampo( oRow, 'tipo' ) = 'F', 1, 2 )

      fCadCli .Telefone. value  :=  GetCampo( oRow, 'fone1' )
      fCadCli .foneCon.  value  :=  GetCampo( oRow, 'fone2' )

      fCadCli .LblStatus. value  :=  GetCampo( oRow, 'Status' )

      fCadCli .Email. value    := GetCampo( oRow, 'email' )

      fCadCli .cmbcidade. Displayvalue := GetCampo( oRow, 'cidade' )

// fCadCli .CmbUf. value    := GetCampo(oRow , 'uf')

      aUf := GetCmbItens( 'fCadCli', 'cmbUf'  )

      nind2 := AScan( aUf, GetCampo( oRow, 'Uf' ) )

      IF ( nInd2 > 0 )
         fCadCli .CmbUf. Value := nind2
      END IF






      fCadCli .CmbCidade. Value := AScan( GetCmbItens( 'fCadCli', 'cmbCidade'  ), AllTrim( GetCampo(oRow, 'Cidade' ) ) )

      fCadCli .CmbBairros. Value := AScan( GetCmbItens( 'fCadCli', 'cmbBairros'  ), AllTrim( GetCampo(oRow, 'Bairro' ) ) )


      fCadCli .CmbCidEnt. Value := AScan( GetCmbItens( 'fCadCli', 'cmbCidEnt'  ), AllTrim( GetCampo(oRow, 'CidEnt' ) ) )


      fCadCli .CmbBaiEnt. Value := AScan( GetCmbItens( 'fCadCli', 'cmbBaiEnt'  ), AllTrim( GetCampo(oRow, 'BaiEnt' ) ) )


      IF !Empty( GetCampo( oRow, 'Categoria' ) )
         cRet1 := AllTrim( RetSql( "select descricao from categorias where codigo = " + Quotedstr(GetCampo(oRow, 'Categoria' ) ) + " And Status = 'Normal'"  ) )
         fCadCli .CmbCategoria. Value := AScan( GetCmbItens( 'fCadCli', 'CmbCategoria'  ), AllTrim( cRet1 ) )
      END IF


      IF !Empty( GetCampo( oRow, 'Classe' ) )
         cRet2 := AllTrim( RetSql( "select descricao from classes where codigo = " + Quotedstr(GetCampo(oRow, 'classe' )  )  + " And Status = 'Normal'" ) )
         fCadCli .CmbClasse. Value    := AScan( GetCmbItens( 'fCadCli', 'CmbClasse'     ), AllTrim( cRet2 ) )
      END IF


      fCadCli .Rg. value          := GetCampo( oRow, 'Rg' )
      fCadCli .DataNasc. value    := GetCampo( oRow, 'DataNasc' )

      fCadCli .cep. value := GetCampo( oRow, 'Cep' )
      fCadCli .Referencia. value := GetCampo( oRow, 'Referencia' )

      fCadCli .EdtObs. value  := GetCampo( oRow, 'observacao' )

      fCadCli .InEst. value  := GetCampo( oRow, 'Ie' )


      fCadCli .EndEnt. value := GetCampo( oRow, 'Endent' )


      fCadCli .CepEnt. value := GetCampo( oRow, 'CepEnt' )
      fCadCli .RefEnt. value := GetCampo( oRow, 'RefEnt' )

      fCadCli .WhatsAp. value := GetCampo( oRow, 'Whatzap' )

      IF AllTrim( GetCampo( oRow, 'Status' ) ) = 'Inativo'
         yAviso( "Cliente com Cadastro Bloqueado\Inativo.Apenas sera Visualizado(Somente Leitura)." )
         SetWindowControlsEnable( 'fCadCli', .F. )
      END IF

   ELSE




   END IF

   oServer:Destroy()
   oServer := Nil

   oQuery:Destroy()
   oQuery := Nil

RETURN



FUNCTION GrvClien( lNovo )

   LOCAL cSqlinsert
   LOCAL cCodClasse := GetTableId( 'Classes', fCadCli .CmbClasse. DisplayValue )
   LOCAL cCodCateg  := GetTableId( 'Categorias', fCadCli .CmbCategoria. DisplayValue )
   LOCAL nId        := GetReg( "Clientes" )
   LOCAL cCodMun    := ''
   LOCAL cMsg       := 'Confirma Cadastro desse Cliente?'
   LOCAL aValores   := {}
   LOCAL aCamposf := { 'qtpeds', 'saldo', 'acumulado', 'dtbloqueio', 'status', 'dtcadastro', ;
      'dtultcompra', 'dtprimcompra', 'dtbloqueio', 'maiorcompra', 'codmun', 'fone3', 'codigo' }

   LOCAL aCamposf1 := { 'qtpeds', 'saldo', 'acumulado', 'dtbloqueio', 'dtultcompra', 'dtprimcompra', 'dtmodcad', ;
      'dtbloqueio', 'maiorcompra', 'codmun', 'fone3' }

   IF !lNovo
      cMsg := 'Confirma Alteração no Cadastro deste Cliente?'
   END IF


   IF !Confirmaviso( cMsg, cActiveJan, .F. )


// DoMethod( 'fCadCli' , 'SetFocus' )


      SendMessage( OBTN_Handle(  'fNewCadCli', 353 ), WM_MOUSEMOVE, 0, 0 )
      SendMessage( OBTN_Handle(  'fNewCadCli', 54 ), WM_MOUSEMOVE, 0, 0 )

// _ShowWindow('fCadCli')
      SysWait( .3 )

      RETURN .F.

   END IF

   IF ( lNovo )
      AAdd( aValores, Quotedstr(  AllTrim( StrZero( nId + 1, 6 ) ) )  )
   END IF


   AAdd( aValores, Quotedstr( AllTrim(fCadCli .nome. value ) )  )
   AAdd( aValores, Quotedstr( AllTrim(fCadCli .cnpj. value ) )  )
   AAdd( aValores, Quotedstr( AllTrim(fCadCli .endereco. value ) ) )

   AAdd( aValores, Quotedstr( AllTrim(fCadCli .cmbbairros. Displayvalue ) ) )
   AAdd( aValores, Quotedstr( AllTrim(fCadCli .fantasia. value ) )   )
   AAdd( aValores, Quotedstr( AllTrim(fCadCli .contato. value ) )    )

   AAdd( aValores, Quotedstr( iif( fCadCli .CmbTipo. value = 1, 'F', 'J' ) ) )

   AAdd( aValores, Quotedstr( AllTrim( fCadCli .Telefone. value ) ) )
   AAdd( aValores, Quotedstr( AllTrim( fCadCli .FoneCon. value ) ) )



   AAdd( aValores, Quotedstr( AllTrim( fCadCli .Email. value ) ) )
   AAdd( aValores, Quotedstr( AllTrim( fCadCli .cmbcidade. Displayvalue ) )  )

   AAdd( aValores, Quotedstr( AllTrim( fCadCli .cmbUf. DisplayValue ) ) )

   AAdd( aValores, Quotedstr( AllTrim( fCadCli .rg. value ) ) )

   AAdd( aValores, Quotedstr( ConvDt( fCadCli .DataNasc. value ) )  )

   AAdd( aValores, Quotedstr( AllTrim( fCadCli .cep. value ) ) )
   AAdd( aValores, Quotedstr( AllTrim( fCadCli .Referencia. value ) ) )

   IF ( lNovo )
      AAdd( aValores, QuotedStr( 'Normal' ) )
      AAdd( aValores, Quotedstr( ConvDt( dDataBase ) )  )
   END IF

   AAdd( aValores, Quotedstr( AllTrim( fCadCli .EdtObs. value ) ) )
   AAdd( aValores, Quotedstr( AllTrim( fCadCli .InEst. value ) ) )
   IF ( !lNovo )
      AAdd( aValores, Quotedstr( ConvDt( dDataBase ) )  )
   END IF
   AAdd( aValores, Chr( 39 ) + AllTrim( fCadCli .EndEnt. value ) + Chr( 39 ) )
   AAdd( aValores, Chr( 39 ) + AllTrim( fCadCli .CmbBaiEnt. Displayvalue ) + Chr( 39 ) )

   AAdd( aValores, Chr( 39 ) + AllTrim( fCadCli .CmbCidEnt. Displayvalue ) + Chr( 39 ) )



   AAdd( aValores, Chr( 39 ) + AllTrim( fTiraChar(fCadCli .CepEnt. value ) ) + Chr( 39 ) )

   AAdd( aValores, Chr( 39 ) + AllTrim( fCadCli .RefEnt. value ) + Chr( 39 ) )

   AAdd( aValores, Quotedstr( AllTrim( fCadCli .WhatsAp. value ) ) )

   AAdd( aValores,   Chr( 39 ) + AllTrim( cCodClasse ) + Chr( 39 )  )
   AAdd( aValores,   Chr( 39 ) + AllTrim( cCodCateg ) + Chr( 39 )   )



   IF !lNovo
      cSqlz1 := xSqlUpdate( 'Clientes', aValores, aCamposF, "Codigo = " + QuotedStr( cCodclien ) )
   ELSE
      cSqlZ1 := xSqlInsert( 'Clientes', aValores, aCamposF1 )
   END IF


   hb_MemoWrit( 'InsCli.txt', cSqlz1 )

   oServer := GetConexao()
   oQuery := oServer:Query( cSqlz1 )

   IF oQuery:NetErr()
      yAviso( 'Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error(), .F. )
      RETURN .F.
   END IF

   oServer:Destroy()
   oServer := Nil

   oQuery:Destroy()
   oQuery := Nil

// SysWait(.1)

   fCadCli.Release()

   lOkCad := .T.

RETURN .T.


FUNCTION AtuGrdLine( cTb, Condicao, cJan, cSql1 )

   LOCAL cSqx1
   LOCAL a1     := GetProperty( cJan, "Br_Grid", "Value" )
   LOCAL nCol
   LOCAL aRec

// msginfo( a1[1]   )


   cSqx1 := GetSql( ctb, .F. )
   cSqx1 += " Where  " + Condicao

   IF cSql1 != Nil
      cSqx1 := cSql1
   END IF

   aRec := RetRecord(  cSqx1, cTb )

   nCol := 1
   FOR n1 := 1 TO Len( aRec )
      SetProperty( cJan, "br_Grid", "Cell", a1[ 1 ], nCol, arec[ n1 ] )
      nCol++
   NEXT

   SetProperty( cJan, "br_Grid", "Value", a1    )

   DoMethod( cJan, "Br_grid", "SetFocus" )
   DoMethod( cJan, "br_GRid", "Refresh" )

RETURN

FUNCTION AtuNewLine( cTb, Condicao, cJan, cSql1 )

   LOCAL cSqx1
   LOCAL a1    := GetProperty( cJan, "br_grid", "Value" )
   LOCAL nCol
   LOCAL aRec
   LOCAL aIt1  := GetProperty( cJan, "br_Grid", "Item", 1 )
   LOCAL nCount

   LOCAL cTipo
   LOCAL cMask
   LOCAL nZ
   LOCAL n1 := 1

   DoMethod( cJan, "Br_Grid", "Additem", aIt1 )
   nCount  := GetProperty( cJan, "br_Grid", "ItemCount" )

// msginfo( Str(nCount) )

   cSqx1 := GetSql( ctb, .F. )
   cSqx1 += " Where  " + Condicao
// idcliente = " +  Alltrim(nIdCli)

   IF cSql1 != Nil
      cSqx1 := cSql1
   END IF


   hb_MemoWrit( 'l1.txt', cSqx1 )

   aRec := RetRecord(  cSqx1, cTb )

   nCol := 1

   FOR nz := 1 TO Len( aRec )

      SetProperty( cJan, "br_Grid", "Cell", nCount, nCol, aRec[ nz ]   )
      nCol++

   NEXT

   SetProperty( cJan, "br_Grid", "Value", nCount    )

   DoMethod( cJan, "Br_Grid", "SetFocus" )
   DoMethod( cJan, "br_GRid", "Refresh" )

RETURN

FUNCTION RetRecord( cSql1, cTabela )

   LOCAL oServer := GetConexao()
   LOCAL oQuery  := oServer:Query( cSql1 )
   LOCAL nQreg1  := 0
   LOCAL aM1     := {}
   LOCAL nlinha  := 0
   LOCAL aM5 := {}
   LOCAL aCabec := GetCamposInf( cTabela, 'CABEC' )
   LOCAL cMask := ''

   cInativ := ''

   IF oQuery:LastRec() > 0

      FOR n1 := 1 TO oQuery:LastRec()

         oRow := oQuery:GetRow( n1 )
         aM1 := {}

         FOR nz := 1 TO Len( aCabec )

            cTipo := GetInfoDic( aCabec[ nz ], cTabela, 'TIPO' )
            cMask := GetInfoDic( aCabec[ nz ], cTabela, 'MASCARA' )

            IF cTipo == 'I'
               AAdd( aM1,  PadL( AllTrim( Str(oRow:FieldGet(nz ) ) ), 25 )    )
            END IF

            IF ( cTipo == 'C' ) .OR. ( cTipo == 'D'  )
               AAdd( aM1, AllTrim( oRow:FieldGet(nz ) )  )
            END IF

            IF cTipo == 'B'
               AAdd( aM1,   PadL( AllTrim(Transform( oRow:FieldGet(nz ), "@E 999,999,999.99" ) ),14 ) )
            END IF

         NEXT

         oQuery:Skip( 1 )


      NEXT

      nQreg1 := oQuery:LastRec()

   ELSE

   END IF

   oQuery:Destroy()
   oQuery := Nil

   oServer:Destroy()
   oServer := Nil

   DO Events

RETURN aM1






FUNCTION InpCadCli()

   STATIC lTracking45 := .F.

   LOCAL  nHWnd   := EventHWND()
   LOCAL  nMsg    := EventMSG()
   LOCAL  nWParam := EventWPARAM()
   LOCAL  nLParam := EventLPARAM()
   LOCAL cControl
   LOCAL cForm


   

   IF ( nMsg == WM_MOUSEMOVE ) .AND. ( !lTracking45 )

      lTracking45 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag
      GetControlNameByHandle( nHWnd, @cControl, @cForm )
// msginfo(cControl)

      IF ( cControl = 'ImgLupa' ) .OR. ( cControl = 'ImgEnd' )

         SetHandCursor( GetControlHandle( cControl, 'fCadCli' ), "Finger.cur" )
         _SetToolTip( cControl, 'fCadCli', hb_ANSIToOEM( "Resgata Endereço Baseado no CEP Informado." ) )


      END IF

   END IF

   IF ( nMsg == WM_MOUSELEAVE )


      lTracking45 := .F.

   END IF

   IF ( nMsg == WM_LBUTTONDOWN )

      GetControlNameByHandle( nHWnd, @cControl, @cForm )

      IF cControl = 'ImgLupa'
         xPesqCep()
      END IF

      IF cControl = 'ImgEnd'
         xPesqEnt()
      END IF

   END IF

RETURN


FUNCTION GetCmbItens( cForm1, cCmb  )

   LOCAL nCount := 0
   LOCAL aM2    := {}
   LOCAL nZ1    := 1

   IF !_isControlDefined( cCmb, cForm1 )
      RETURN aM2
   END IF


   nCount := Getproperty( cForm1, cCmb, 'ItemCount' )

   // DoMethod( cForm1, cCmb, 'DeleteAllItems' )

   FOR nz1 := 1 TO ncount

      AAdd( aM2, AllTrim( Getproperty( cForm1, cCmb, 'Item', nZ1 ) ) )

   NEXT

RETURN aM2






FUNCTION EncheCmb( cForm1, cCmb, cSqlx1 )

   LOCAL oServer := GetConexao()
   LOCAL oQry
   LOCAL aMatr1 := {}

   DoMethod( cForm1, cCmb, 'DeleteAllItems' )

   oQry := oServer:Query( cSqlx1 )

   IF oServer:NetErr()
      MsGInfo( "Error executing Query " + QUEBRA +  " : " + QUEBRA + oServer:Error() )

      oServer:Destroy()
      oSErver := Nil


      oQry:Destroy()
      oQry := Nil
      RETURN .F.

   END IF

   FOR n1 := 1 TO oQry:LastRec()
      oRow := oQry:GetRow( n1 )
      DoMethod( cForm1, cCmb, 'AddItem', hb_UTF8ToStr( GetCampo(  oRow, oQry:FieldName(1 )  ) )    )
      AAdd( aMatr1, hb_UTF8ToStr( GetCampo(  oRow, oQry:FieldName(1 )  ) )   )
   NEXT

   oServer:Destroy()
   oSErver := Nil


   oQry:Destroy()
   oQry := Nil

RETURN ( aMatr1 )


FUNCTION xChgUf( nUf1 , cControl )

   //LOCAL cUf1 := fCadcli .cmbUf. DisplayValue
   Local aZ1  := {}
   Local cUf1 := aMUf[nUf1]



   DEFAULT cControl := ''
   
   IF !Empty( cUf1 )     
      
      If (cControl != 'CepEnt')
         DoMethod( 'fCadcli', 'CmbBairros', 'DeleteAllItems' )
         aZ1 := EncheCmb( 'fCadcli', 'CmbCidade', "select municipio from ibge where uf = '" + cUf1  + "' order by 1" )
      Else    
         DoMethod( 'fCadcli', 'CmbBaiEnt', 'DeleteAllItems' )
         aZ1 := EncheCmb( 'fCadcli', 'CmbCidEnt', "select municipio from ibge where uf = '" + cUf1  + "' order by 1" )
      End If    

   END IF

Return aZ1 


FUNCTION xPesqCep()

   LOCAL cCep := fTiraChar( GetProperty( 'fCadCli','Cep','Value' ) )

   LOCAL cCepEnt := fTiraChar( GetProperty( 'fCadCli','CepEnt','Value' ) )

   LOCAL oServer := GetConexao()
   LOCAL oQry

   Local nindice := 0

   LOCAL cControl
   LOCAL cForm


   LOCAL aM1
   LOCAL oRow
   LOCAL nCidade
   LOCAL aBairros := {}
   LOCAL cJanx1 := 'fCadCli'

   GetControlNameByHandle( GetFocus(), @cControl, @cForm )


   IF ( AllTrim( cControl ) != 'Cep' ) .AND. ( AllTrim( cControl ) != 'CepEnt' )
      yAviso( "Campo CEP(Cadastro ou Entrega) Deve estar Selecionado Para Fazer a Consulta.", .F. )
      RETURN
   END IF

   // SysWait( .1 )


   IF AllTrim( cControl ) == 'Cep'
      oQry := oServer:Query( "select * from cep where cep = '" + cCep + "'" )
   ELSE
      oQry := oServer:Query( "select * from cep where cep = '" + cCepEnt + "'" )
   END IF


   IF oQry:LastRec() > 0

      oRow := oQry:GetRow( 1 )
      
      
      
      SetProperty( 'fCadCli', 'CmbUf', 'Value', AScan( aMUf  , AllTrim(GetCampo(oRow, 'Uf' ) ) )  )


      nindice := Ascan(aMUf , AllTrim(GetCampo(oRow, 'Uf' ) )    )
           
      
      IF AllTrim( cControl ) = 'CepEnt'

        aM1 := xChgUf( nIndice   ,   'CepEnt' )   
        nCidade := AScan( aM1, AllTrim( GetCampo(oRow, 'Cidade' ) ) )



         SetProperty( 'fCadCli', 'CmbCidEnt', 'Value',  nCidade )

         aBairros := xChgCidade(  .T. )
         

         SetProperty( 'fCadCli', 'EndEnt', 'Value', AllTrim( GetCampo(oRow, 'Endereco' ) ) )
         SetProperty( 'fCadCli', 'CmbBaiEnt', 'Value', AScan( aBairros, AllTrim(GetCampo(oRow, 'Bairro' ) ) )  )

      ELSE

         aM1 := xChgUf( nIndice   ,   'Cep' )   
         
         nCidade := AScan( aM1, AllTrim( GetCampo(oRow, 'Cidade' ) ) )

         SetProperty( 'fCadCli', 'Endereco', 'Value', AllTrim( GetCampo(oRow, 'Endereco' ) ) )
         SetProperty( 'fCadCli', 'CmbCidade', 'Value',  nCidade )

         aBairros := xChgCidade( .F. )

         SetProperty( 'fCadCli', 'CmbBairros', 'Value', AScan( aBairros, AllTrim(GetCampo(oRow, 'Bairro' ) ) )  )

      END IF


   ELSE

      SetProperty( 'fCadCli', 'Endereco', 'Value', '' )
      yAviso( 'Cep Não Localizado.', .F. )
      SysWait( .2 )
      fCadCli .nome. SetFocus()

   END IF


   oServer:Destroy()
   oSErver := Nil

   oQry:Destroy()
   oQry := Nil

RETURN

FUNCTION xChgCidade( lEntrega )

   LOCAL cCid := AllTrim( fCadcli .cmbCidade. DisplayValue )
   LOCAL cCid2 := AllTrim( fCadcli .cmbCidEnt. DisplayValue )
   LOCAL cUf1 := fCadcli .cmbUf. DisplayValue
   LOCAL cCidade := ''
   Local aMtrz1 := {}

   IF !Empty( AllTrim( cCid + cCid2 ) )


      IF !Empty( AllTrim( cCid ) )
         cCidade := cCid
      ELSE
         cCidade := cCid2
      END IF


      IF !lEntrega
         aMtrz1 := EncheCmb( 'fCadcli', 'CmbBairros', "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCidade + "' order by 1" )
      ELSE
         aMtrz1 := EncheCmb( 'fCadcli', 'CmbBaiEnt', "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCidade + "' order by 1" )
      END IF

   END IF

RETURN aMtrz1




FUNCTION xCidEnt()

   LOCAL cUf1 := fCadcli .cmbUf. DisplayValue
   LOCAL cCid := fCadcli .cmbCidEnt. DisplayValue

   SetHandCursor( GetFormHandle( 'fCadCli' ), "Finger.cur" )

   EncheCmb( 'fCadcli', 'CmbBaiEnt', "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCid + "' order by 1" )

RETURN

FUNCTION xGrvCli()

   IF !ConfirmAviso( 'Confirma Cadastro desse Cliente?' )
      RETURN
   END IF

RETURN




STATIC FUNCTION HabilGrv()

// Local cJanx  := 'fCadCli1'
   LOCAL cJanx  := 'fCadCli'
   LOCAL lCpfOk := .F.

   IF Len( AllTrim( fCadCli .Cnpj. Value ) ) = 11
      lCpfOk := Validcpf(  AllTrim( fCadCli .Cnpj. Value )  )
   ELSE
      lCpfOk := ValidCnPj(  AllTrim( fCadCli .Cnpj. Value )  )
   END IF



   IF ( Len( AllTrim(fCadCli .Nome. Value ) ) > 0 ) .AND. (  Len( AllTrim(fCadCli .Cnpj. Value ) ) > 0  ) .AND. ;
         ( Len( AllTrim(fCadCli .Endereco. Value ) ) > 0 ) .AND. ( lCpfOk )
      OBTN_Enable( cJanx, 353, .T. )
   ELSE
      OBTN_Enable( cJanx, 353, .F. )
   END IF

// SetFocus(fCadCli1 .nome.handle)

RETURN

FUNCTION Validcpf()

   PARAMETER c_ic
   LOCAL d_1, d_2, x_x, con_ta, digito, res_to

   d_1 := 0
   d_2 := 0
   x_x := 1

   FOR con_ta := 1 TO Len( c_ic ) - 2
      IF At( subs( c_ic,con_ta,1 ), "/-." ) == 0
         d_1 := d_1 + ( 11 - x_x ) * Val( SubStr( c_ic,con_ta,1 ) )
         d_2 := d_2 + ( 12 - x_x ) * Val( SubStr( c_ic,con_ta,1 ) )
         x_x := x_x + 1
      END IF
   NEXT

   res_to  := d_1 - ( Int( d_1 / 11 ) * 11 )
   dig_ito := iif( res_to < 2, 0, 11 - res_to )
   d_2     := d_2 + 2 * dig_ito
   res_to  := d_2 - ( Int( d_2 / 11 ) * 11 )
   dig_ito := Val( Str( dig_ito,1 ) + Str( iif(res_to < 2,0,11 - res_to ),1 ) )

   IF dig_ito <> Val( SubStr( c_ic,Len(c_ic ) - 1,2 ) )
      RETURN .F.
   ELSE
      RETURN .T.
   END IF

RETURN




FUNCTION ValidCnpj()

   PARAMETER c_gc

   LOCAL d_1, d_4, x_x, con_ta, dig_ito, res_to

   d_1  := 0
   d_4  := 0
   x_x  := 1

   FOR con_ta := 1 TO Len( c_gc ) - 2
      IF At( subs( c_gc,con_ta,1 ), "/-." ) = 0
         d_1 := d_1 + Val( SubStr( c_gc,con_ta,1 ) ) * ( iif( x_x < 5,6,14 ) - x_x )
         d_4 := d_4 + Val( SubStr( c_gc,con_ta,1 ) ) * ( iif( x_x < 6,7,15 ) - x_x )
         x_x := x_x + 1
      END IF
   NEXT

   res_to  := d_1 - ( Int( d_1 / 11 ) * 11 )
   dig_ito := iif( res_to < 2, 0, 11 - res_to )
   d_4     := d_4 + 2 * dig_ito
   res_to  := d_4 - ( Int( d_4 / 11 ) * 11 )
   dig_ito := Val( Str( dig_ito,1 ) + Str( iif(res_to < 2, 0, 11 - res_to ),1 ) )

   IF dig_ito <> Val( SubStr( c_gc,Len(c_gc ) - 1,2 ) )
      RETURN .F.
   ELSE
      RETURN .T.
   ENDIF

RETURN




FUNCTION xPesqEnt()

   LOCAL cCep := fTiraChar( GetProperty( 'fCadCli','CepEnt','Value' ) )

   LOCAL oServer := GetConexao()
   LOCAL oQry

   LOCAL aM1
   LOCAL oRow
   LOCAL nCidade

   LOCAL cJanx := 'fCadCli'

   SetWaitCursor( GetControlHandle( 'imgEnd', cJanx ) )

   oQry := oServer:Query( "select * from cep where cep = '" + cCep + "'" )


   IF oQry:LastRec() > 0

      oRow := oQry:GetRow( 1 )


      aM1 := GetCmbItens( 'fCadCli', 'CmbCidEnt'  )

      nCidade := AScan( aM1, AllTrim( GetCampo(oRow, 'Cidade' ) ) )


      SetProperty( 'fCadCli', 'CmbCidEnt', 'Value',  nCidade )

      SetProperty( 'fCadCli', 'EndEnt', 'Value', AllTrim( GetCampo(oRow, 'Endereco' ) ) )



      SetProperty( 'fCadCli', 'CmbBaiEnt', 'Value', AScan( GetCmbItens( 'fCadCli', 'CmbBaiEnt'  ), AllTrim(GetCampo(oRow, 'Bairro' ) ) )  )


   ELSE

      SetProperty( 'fCadCli', 'EndEnt', 'Value', '' )

      yAviso( 'Cep não Localizado.',, 'fCadCli' )

   END IF




   oServer:Destroy()
   oSErver := Nil

   oQry:Destroy()
   oQry := Nil

RETURN





FUNCTION fTiraChar( wCampo )

// // Remover Caracteres Especiais (/,*)

   LOCAL lRet  := .T.
   LOCAL cStr1 := ''
   LOCAL i     := 1

   FOR i := 1 TO Len( wCampo )
      IF SubStr( wCampo, i, 1 ) == "'" .OR. SubStr( wCampo, i, 1 ) == ")" .OR. SubStr( wCampo, i, 1 ) == "(" .OR. SubStr( wCampo, i, 1 ) == "*" .OR. SubStr( wCampo, i, 1 ) == "/"  .OR. SubStr( wCampo, i, 1 ) == "\"  .OR. SubStr( wCampo, i, 1 ) == '%' .OR. SubStr( wCampo, i, 1 ) == "-"

      ELSE
         cStr1 += SubStr( wCampo, i, 1 )
      ENDIF
   NEXT i

RETURN cStr1


FUNCTION xBloquear(  cCodCli, cStatus )

   LOCAL cSql  := "update " + AllTrim( cTabela ) + " set status = '" + cStatus + "' , dtbloqueio = " + Quotedstr( ConvDt( dDataBase ) )  + " where codigo = '" + cCodCli + "'"

   IF !Confirmaviso( 'Confirma Mudança de Status(' + cStatus + ') Para Este Registro?', cActiveJan, .T. )
      RETURN .F.
   END IF

   IF ( cStatus = 'Ativo' )
      cSql  := "update " + AllTrim( cTabela ) + " set status = '" + cStatus + "' , dtbloqueio = null where codigo = '" + cCodCli + "'"
   END IF

   SetWaitCursor()


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

RETURN .T.



FUNCTION xMudaTab()

   LOCAL nInd1 := fCadCli .Tab_1. Value

   IF nInd1 = 1
      fCadCli .nome. SetFocus()
   ELSE

      fCadCli .Endent. SetFocus()

   END IF

RETURN
