#include <hmg.ch>

//DECLARE WINDOW fCliCad

STATIC lTracking55 := .F.

DECLARE WINDOW fCadcli

DECLARE WINDOW fProgress

DECLARE WINDOW fNewCadcli

//DECLARE WINDOW fCadcli1
//DECLARE WINDOW fCadcli2



REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850


Function xInitFrm()

	//Load Window fNewCadCli

	Load Window fCadCli


	//SetWindowCursor (GetControlHandle( 'br_grid' , cActiveJan) , IDC_WAIT) 

	//xMudaTab()

	//msginfo('E2nd')	

	HMG_ChangeWindowStyle(  fCadCli.Handle , WS_EX_DLGMODALFRAME, NIL, .T., .T. )


	ON KEY F5 OF fCadCli ACTION xPesqCep() 

	Center Window fCadCli
		/*
	
	fCadCli1.Col := GetProperty("fNewCadCli" , "Col" )
	fCadCli1.Row := GetProperty("fNewCadCli" , "Row" ) + 55

	DoMethod("fCadCli2" , "Hide")

	fCadCli2.Height := 347
	fCadCli1.Height := 347


	fCadCli2.Col := GetProperty("fNewCadCli" , "Col" )
	fCadCli2.Row := GetProperty("fNewCadCli" , "Row" ) + 55

	*/

	//xMudaTab()

	//msginfo('End')

Return 



Function xCadCli( lNew  , cCodigo1 )

	Local aValores := {}
	Local cSalvaJan := cActiveJan
	Local aMx       := {}


	//l1 := xrt1()



	Private cDiaName := 'fCadCli'

	Private nIndexDlg := 0

	Private nZa1 := 0
	Private nZa2 := 0



	Private aUf      := {}
	Private aCidades := {}
	Private aBairros := {}

	Private lNovo     := lNew
	Private cCodclien := cCodigo1

	Private aButCli := {}

	


	lOkCad := .f.


	Private aButx1 := {}
	Private cJanx1  := ''

	//SETWAITCURSOR(   GetFormHandle(cActiveJan)    )
	

	//aMx := yEfect(  cActiveJan  )

	//yAviso2('ok')
	
	
	//yRun("Aguarde Inicializando Tela..... " , { ||   xInitFrm()  } )


	//EfectEnd(cActiveJan , aMx )

	xInitFrm()


	
	//ON KEY ESCAPE OF fNewCadCli ACTION _FechaJan('fNewCadCli' )

	ON KEY ESCAPE OF fCadCli ACTION _FechaJan('fCadCli' )
	

	InstallEventHandler('EventClih')
	
	//Activate Window fNewCadCli

	Activate Window fCadCli 


	RemoveHandler('EventClih')


REturn 




Function xInitCad()

	cJanx := 'fCadCli'


	aRotHnd := {}


	EncheCmb( 'fCadcli' , 'CmbCidade' , "select municipio from ibge where uf = '" + cUfEmp + "' order by 1" )
	EncheCmb( 'fCadcli' , 'CmbCidEnt' , "select municipio from ibge where uf = '"  + cUfEmp + "' order by 1" )

	EncheCmb( 'fCadcli' , 'CmbClasse' , "select descricao from classes where status = 'Normal' order by 1" )


	EncheCmb( 'fCadcli' , 'CmbCategoria' , "select descricao from categorias where status = 'Normal' order by 1" )


	EncheCmb( 'fCadcli' , 'CmbUf' , "select distinct uf from ibge order by 1" )

	SetProperty('fCadcli' , 'CmbUf' , 'Value', 2 )


	cJanx := 'fCadCli'


	OBTN_Create( cJanx, 353, "&Ok", 420 , 670,  62 ,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
	OBTN_Create( cJanx, 54, "&Cancelar" , 420 , 735 ,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )

	OBTN_Create( 'fCadCli', 98 , "&Consultar CEP" , 148 , 479 ,  82,  22 ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )


	OBTN_Font( cJanx, 353,  { cFontName, nFontSize, .F., .F., .F., .F. } )
	OBTN_Font( cJanx, 54,  { cFontName, nFontSize, .F., .F., .F., .F. } )	

	OBTN_Font( 'fCadCli', 98,  { cFontName, nFontSize, .F., .F., .F., .F. } )	

	OBTN_Enable( cJanx , 353 , .f.)


	AAdd( aButCli, {  353,  OBTN_Handle( cJanx, 353 ),   { || ( PushButton( cJanx , 353)  , GrvClien(lNovo) )    } ,  cJanx   } )
	AAdd( aButCli, {  54 ,  OBTN_Handle( cJanx, 54 ),   { ||  _FechaJan(cJanx)  } ,  cJanx   } )

	//AAdd( aButCli, {  98 ,  OBTN_Handle(  'fCadCli' , 98 ),   { || ( PushButton( 'fCadCli' , 98) , xPesqCep() )  } ,  'fCadCli'   } )

	//msginfo('ok')


//     Do Events

	EventProcessAllHookMessage( nZa1 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 353 )   ), .T. )
	EventProcessAllHookMessage( nZa2 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 54 )   ), .T. )


	EventProcessAllHookMessage( nZa3 := EventCreate( {|| InputEvButton( aButx1, 'fCadCli' ) },    OBTN_Handle( 'fCadCli', 98 )   ), .T. )
		

	ON KEY ESCAPE OF fCadCli Action DoMethod( cDiaName , "Release") 

	If !lNovo
		LoadCliente(  cCodClien )
	Else


	End If

	HabilGrv()

	//xMudaTab()


	//fCadCli1 .nome.SetFocus()

	fCadCli .nome.SetFocus()

	//Syswait(.1)

	//TimerRed()

	

Return



FUNCTION EventClih( nHWnd, nMsg, nWParam, nLParam )
//FUNCTION EventConsu()

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

		nI1 := AScan( aButCli, {| n| n[ 1 ] == nId } )

		IF nI1 > 0
			OBTN_Draw( nHWnd,  nWParam, nLParam )
		END IF


	END IF

	IF nMsg == 273

		nID := LoWord( nWParam )

		IF nID == IDOK
			nID := GetDlgCtrlID( GetFocus() )
		ENDIF

		nI1 := AScan( aButCli, {| n| n[ 1 ] == nId } )

		IF nI1 > 0
			Eval(   aButCli[ ni1 ][ 3 ] )
		END IF


		IF nId == 6598

		END IF

		IF nId == 6599

		END IF

	END IF

	//END IF

RETURN NIL





Function gColor1( cJan , cObj )

	SetProperty(  cJan , cObj , "BACKCOLOR" , {28,157,189})
	SetProperty(  cJan , cObj , "FONTCOLOR" , { 255,255,255})

	//HabilGrv()

Return



Function gColor2( cJan , cObj )

	SetProperty(  cJan , cObj , "BACKCOLOR" , { 255,255,255 } )
	SetProperty(  cJan , cObj , "FONTCOLOR" , { 0,0,0})

	//HabilGrv()

Return


Static Function ShowButConsul(lVisible)

	Local cForm := 'fCadCli'



return

FUNCTION EveCadCli( cJan1 )

	//STATIC lTracking45 := .F.


	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  nLParam := EventLPARAM()

	LOCAL cFormx := 'fCadCli'


	LOCAL nind1
	LOCAL nIdBut := 0

	LOCAL n1
	LOCAL ButHnd

	lTracking55 := .F.

	//DEFAULT cFormx := 'fDialogo'


	// LOCAL n1
	If (Alltrim(cJan1) = "fCadCli")
		For n1 := 50 TO 400
			If ( OBTN_Handle( cFormx, n1 ) == nHWnd )
				If nIdBut == 0
					nIdBut := n1
				End If
			End If
		Next
	End If


	If (alltrim(cJan1) != "fCadCli")

		FOR n1 := 1 TO 100
			IF ( OBTN_Handle( cJan1, n1 ) == nHWnd )
				IF nIdBut == 0
					cFormx := cJan1
					//msginfo( Str(n1) )
					nIdBut := n1
				END IF
			END IF
		Next

	End If




	IF ( nIdBut > 0 )

		//	IF nHWnd == GetFormHandle( 'fCadCli')
		//OBTN_Handle( cFormx, nIdBut )

		IF nMsg == WM_DRAWITEM

			//	IF ( nWParam >=  6652 ) .AND.  ( nWParam <=  6669 )
			//		OBTN_Draw( nHWnd,  nwParam, nLParam )
			//	END IF

			IF ( nWParam >=  50 ) .AND.  ( nWParam <=  360 )
				OBTN_Draw( nHWnd,  nwParam, nLParam )
			END IF



		END IF

		//	End If



		IF nMsg == 273
			msginfo('zz1')
		End If

		IF ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking55)

			lTracking55 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag

			OBTN_Color( cFormx, nIdBut, RetColor1( 2 ), .T. )

			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

		END IF




		IF ( nMsg == WM_MOUSELEAVE )

			OBTN_Color( cFormx,  nIdBut, RetColor1( 1 ), .T. )
			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

			lTracking55 := .F.

		END IF


	ELSE

	END IF

RETURN




Function LoadCliente(  cCod )

	Local cSql := "Select * from clientes where codigo = '" + cCod + "'"

	Local oServer := GetConexao()
	Local oQuery := oServer:Query( cSql)
	Local oRow

	Local aUf
	Local aBairros


	If oQuery:LastRec() > 0

		oRow := oQuery:GetRow(1)

		fCadCli.lblCodigo.Value := cCod

		fCadCli .nome. value     := GetCampo(oRow , 'nome')
		fCadCli .Cnpj. value     := GetCampo(oRow , 'cpf')
		fCadCli .endereco. value := GetCampo(oRow , 'endereco')


		fCadCli.lblSaldo.Value     := Alltrim( Transform(    GetCampo(oRow , 'Saldo') , "@E 999,999,999.99"  ) )
		fCadCli.lblAcumulado.Value := Alltrim( Transform(    GetCampo(oRow , 'acumulado') , "@E 999,999,999.99"  ) )

		fCadCli.LblQtVendas.Value := Alltrim( Str( GetCampo(oRow , 'QtPeds')  ))

		fCadCli.lblMaior.Value := Alltrim( Transform(    GetCampo(oRow , 'MaiorCompra') , "@E 999,999,999.99"  ) )

		fCadCli.LblDtBloq.Value := GetCampo(oRow , 'dtbloqueio')

		fCadCli.LblUltCompra.Value := GetCampo(oRow , 'dtultcompra')

		fCadcli.LblUltAtuCad.Value := GetCampo(oRow , 'dtmodcad')

		fCadcli.LblDtCad.Value := GetCampo(oRow , 'dtcadastro')


		fCadCli .cmbbairros.Displayvalue := GetCampo(oRow , 'bairro')

		fCadCli .fantasia. value := GetCampo(oRow , 'fantasia')
		fCadCli .contato. value := GetCampo(oRow , 'contato')

		fCadCli .CmbTipo. value := Iif( GetCampo(oRow , 'tipo') = 'F' , 1, 2 )

		fCadCli .Telefone. value  :=  GetCampo(oRow , 'fone1')
		fCadCli .foneCon.  value  :=  GetCampo(oRow , 'fone2')

		fCadCli .LblStatus. value  :=  GetCampo(oRow , 'Status')

		fCadCli .Email. value    := GetCampo(oRow , 'email')

		fCadCli .cmbcidade. Displayvalue := GetCampo(oRow , 'cidade')

		//fCadCli .CmbUf. value    := GetCampo(oRow , 'uf')

		aUf := GetCmbItens( 'fCadCli' , 'cmbUf'  )

		nind2 := Ascan(aUf , GetCampo(oRow , 'Uf') )

		If (nInd2 > 0)
			fCadCli .CmbUf.Value := nind2
		End If


		//msginfo( GetCampo(oRow , 'Cidade')  + ' ' + Str( Ascan( GetCmbItens( 'fCadCli' , 'cmbCidade'  )  , alltrim(GetCampo(oRow , 'Cidade')) ) ) )


		fCadCli .CmbCidade.Value := Ascan( GetCmbItens( 'fCadCli' , 'cmbCidade'  )  , Alltrim(GetCampo(oRow , 'Cidade')) )

		fCadCli .CmbBairros.Value := Ascan( GetCmbItens( 'fCadCli' , 'cmbBairros'  )  , Alltrim(GetCampo(oRow , 'Bairro')) )


		fCadCli .CmbCidEnt.Value := Ascan( GetCmbItens( 'fCadCli' , 'cmbCidEnt'  )  , Alltrim(GetCampo(oRow , 'CidEnt')) )


		fCadCli.CmbBaiEnt.Value := Ascan( GetCmbItens( 'fCadCli' , 'cmbBaiEnt'  )  , Alltrim(GetCampo(oRow , 'BaiEnt')) )


		If !Empty(GetCampo(oRow , 'Categoria'))
			cRet1 := AllTrim( RetSql( "select descricao from categorias where codigo = " + Quotedstr(GetCampo(oRow , 'Categoria')) + " And Status = 'Normal'"  ))
			fCadCli .CmbCategoria.Value := Ascan( GetCmbItens( 'fCadCli' , 'CmbCategoria'  )  , Alltrim(cRet1) )
		End If


		If !Empty(GetCampo(oRow , 'Classe'))
			cRet2 := AllTrim( RetSql( "select descricao from classes where codigo = " + Quotedstr(GetCampo(oRow , 'classe')  )  + " And Status = 'Normal'" ))
			fCadCli .CmbClasse.Value    := Ascan( GetCmbItens( 'fCadCli' , 'CmbClasse'     )  , Alltrim(cRet2) )
		End If


		fCadCli .Rg. value          := GetCampo(oRow , 'Rg')
		fCadCli .DataNasc. value    := GetCampo(oRow , 'DataNasc')

		fCadCli .cep. value := GetCampo(oRow , 'Cep')
		fCadCli .Referencia. value := GetCampo(oRow , 'Referencia')

		fCadCli .EdtObs. value  := GetCampo(oRow , 'observacao')

		fCadCli .InEst. value  := GetCampo(oRow , 'Ie')


		fCadCli .EndEnt.value := GetCampo(oRow , 'Endent')


		fCadCli .CepEnt.value := GetCampo(oRow , 'CepEnt')
		fCadCli .RefEnt.value := GetCampo(oRow , 'RefEnt')

		fCadCli .WhatsAp. value := GetCampo(oRow , 'Whatzap')

		If Alltrim(GetCampo(oRow , 'Status')) = 'Inativo'
			yAviso("Cliente com Cadastro Bloqueado\Inativo.Apenas sera Visualizado(Somente Leitura)." )
			SetWindowControlsEnable('fCadCli' , .f. )
			//SetWindowControlsEnable('fCadCli' , .f. )
		End If 

	Else




	End If

	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil


Return



Function GrvClien(lNovo)


	Local cSqlinsert
	Local cCodClasse := GetTableId( 'Classes', fCadCli.CmbClasse.DisplayValue )
	Local cCodCateg  := GetTableId( 'Categorias', fCadCli.CmbCategoria.DisplayValue )
	Local nId        := GetReg("Clientes")
	Local cCodMun    := ''
	Local cMsg       := 'Confirma Cadastro desse Cliente?'
	Local aValores   := {}
	Local aCamposf := {'qtpeds','saldo','acumulado','dtbloqueio','status','dtcadastro',;
		'dtultcompra','dtprimcompra','dtbloqueio','maiorcompra','codmun','fone3','codigo'}

	Local aCamposf1 := {'qtpeds','saldo','acumulado','dtbloqueio','dtultcompra','dtprimcompra','dtmodcad',;
		'dtbloqueio','maiorcompra','codmun','fone3'}

	If !lNovo
		cMsg := 'Confirma Alteração no Cadastro deste Cliente?'
	End If


	IF !Confirmaviso( cMsg  , cActiveJan , .f. )


		//DoMethod( 'fCadCli' , 'SetFocus' )


		SendMessage( OBTN_Handle(  'fNewCadCli' , 353 )  , WM_MOUSEMOVE , 0, 0)
		SendMessage( OBTN_Handle(  'fNewCadCli' , 54 )   , WM_MOUSEMOVE , 0, 0)

		//_ShowWindow('fCadCli')
		SysWait(.3)

		Return .f.

	End If

	If (lNovo)
		Aadd(aValores , Quotedstr(  AllTrim( StrZero( nId + 1 , 6 ) ) )  )
	End If


	Aadd(aValores , Quotedstr(Alltrim(fCadCli .nome. value))  )
	Aadd(aValores , Quotedstr(Alltrim(fCadCli .cnpj. value))  )
	Aadd(aValores , Quotedstr(Alltrim(fCadCli .endereco. value)) )

	Aadd(aValores , Quotedstr(Alltrim(fCadCli .cmbbairros.Displayvalue)) )
	Aadd(aValores , Quotedstr(Alltrim(fCadCli .fantasia. value))   )
	Aadd(aValores , Quotedstr(Alltrim(fCadCli .contato. value))    )

	Aadd(aValores, Quotedstr(Iif( fCadCli .CmbTipo. value = 1, 'F', 'J' )) )

	Aadd(aValores , Quotedstr(AllTrim( fCadCli .Telefone. value )) )
	Aadd(aValores , Quotedstr(AllTrim( fCadCli .FoneCon. value )) )



	Aadd(aValores , Quotedstr(AllTrim( fCadCli .Email. value )) )
	Aadd(aValores , Quotedstr(AllTrim( fCadCli .cmbcidade. Displayvalue ))  )

	Aadd(aValores , Quotedstr(AllTrim( fCadCli .cmbUf.DisplayValue)) )

	Aadd(aValores , Quotedstr(AllTrim( fCadCli .rg. value )) )

	Aadd(aValores , Quotedstr(ConvDt( fCadCli .DataNasc. value ) )  )

	Aadd(aValores , Quotedstr(AllTrim( fCadCli .cep. value )) )
	Aadd(aValores , Quotedstr(AllTrim( fCadCli .Referencia. value )) )

	If (lNovo)
		Aadd(aValores , QuotedStr('Normal') )
		Aadd(aValores , Quotedstr(ConvDt( dDataBase ) )  )
	End If

	Aadd(aValores , Quotedstr(AllTrim( fCadCli .EdtObs. value )) )
	Aadd(aValores , Quotedstr(AllTrim( fCadCli .InEst. value )) )
	If (!lNovo)
		Aadd(aValores , Quotedstr(ConvDt( dDataBase ) )  )
	End If
	Aadd(aValores , chr( 39 ) + AllTrim( fCadCli .EndEnt.value ) + Chr( 39 ) )
	Aadd(aValores ,chr( 39 ) + AllTrim( fCadCli .CmbBaiEnt.Displayvalue ) + Chr( 39 ) )

	Aadd(aValores ,chr( 39 ) + AllTrim( fCadCli .CmbCidEnt.Displayvalue ) + Chr( 39 ) )



	Aadd(aValores ,chr( 39 ) + AllTrim( fTiraChar(fCadCli .CepEnt.value) ) + Chr( 39 ) )

	Aadd(aValores ,chr( 39 ) + AllTrim( fCadCli .RefEnt.value ) + Chr( 39 ) )

	Aadd(aValores , Quotedstr(AllTrim( fCadCli .WhatsAp. value )) )

	Aadd(aValores ,   Chr( 39 ) + AllTrim( cCodClasse ) + Chr( 39 )  )
	Aadd(aValores ,   Chr( 39 ) + AllTrim( cCodCateg ) + Chr( 39 )   )



	If !lNovo
		cSqlz1 := xSqlUpdate('Clientes' , aValores ,aCamposF , "Codigo = " + QuotedStr(cCodclien) )
	Else
		cSqlZ1 := xSqlInsert('Clientes' , aValores ,aCamposF1 )
	End If


	hb_MemoWrit( 'InsCli.txt', cSqlz1 )

	oServer := GetConexao()
	oQuery := oServer:Query(cSqlz1)

	IF oQuery:NetErr()
		//CursorArrow()
		yAviso( 'Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error()  , .f. )
		Return .f.
	END IF

	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

	//SysWait(.1)

	fCadCli.Release()

	lOkCad := .t.



Return .t.


FUNCTION AtuGrdLine( cTb, Condicao, cJan, cSql1 )

	LOCAL cSqx1
	LOCAL a1     := GetProperty( cJan, "Br_Grid", "Value" )
	LOCAL nCol
	LOCAL aRec

	//msginfo( a1[1]   )


	cSqx1 := GetSql( ctb, .F. )
	cSqx1 += " Where  " + Condicao

	IF cSql1 != Nil
		cSqx1 := cSql1
	END IF

	aRec := RetRecord(  cSqx1, cTb )

	nCol := 1
	FOR n1 := 1 TO Len( aRec )
		SetProperty( cJan, "br_Grid", "Cell", a1[1]  , nCol, arec[ n1 ] )
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
					AAdd( aM1,  Padl(AllTrim( Str(oRow:FieldGet(nz ) ) )  , 25)    )
				END IF

				IF (cTipo == 'C') .or. ( cTipo == 'D'  )
					AAdd( aM1, AllTrim( oRow:FieldGet(nz ) )  )
				END IF

				If cTipo == 'B'
					AAdd( aM1,   PadL(alltrim(Transform( oRow:FieldGet(nz ), "@E 999,999,999.99" )),14) )
				End If

			Next

			oQuery:Skip( 1 )
			// ProcessMessages()

		Next

		nQreg1 := oQuery:LastRec()

	ELSE

	END IF

	oQuery:Destroy()
	oQuery := Nil

	oServer:Destroy()
	oServer := Nil

	Do Events

RETURN aM1






FUNCTION InpCadCli()

	STATIC lTracking45 := .F.

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  nLParam := EventLPARAM()
	Local cControl
	Local cForm



	IF ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking45)

		lTracking45 := TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag
		GetControlNameByHandle(nHWnd, @cControl, @cForm)
		//msginfo(cControl)




		If (cControl = 'ImgLupa') .Or. (cControl = 'ImgEnd')			

			SetHandCursor(GetControlHandle( cControl , 'fCadCli' )   , "Finger.cur" )
			_SetToolTip(cControl,'fCadCli',hb_AnsiToOem("Resgata Endereço Baseado no CEP Informado.") )


		End If

	END IF

	IF ( nMsg == WM_MOUSELEAVE )


		lTracking45 := .F.

	END IF

	If (nMsg == WM_LBUTTONDOWN)

		GetControlNameByHandle(nHWnd, @cControl, @cForm)

		If cControl = 'ImgLupa'
			xPesqCep()
		End If

		If cControl = 'ImgEnd'
			xPesqEnt()
		End If

	End If


Return


Function GetCmbItens( cForm1 , cCmb  )

	Local nCount := 0
	Local aM2    := {}
	Local nZ1

	If !_isControlDefined( cCmb , cForm1 )
		Return aM2
	End If 


	nCount := Getproperty( cForm1 , cCmb  , 'ItemCount' )

	For nz1 := 1 To ncount
		//If ValType(Getproperty( cForm1 , cCmb  , 'Item' , nZ1 )) = 'C'
		Aadd(aM2 , Alltrim(Getproperty( cForm1 , cCmb  , 'Item' , nZ1 )) )
		//End If 	
	Next

REturn aM2

//aM2

Function EncheCmb( cForm1 , cCmb , cSqlx1 )

	Local oServer:=GetConexao()
	Local oQry

	DoMethod( cForm1 , cCmb , 'DeleteAllItems' )

	oQry := oServer:Query(cSqlx1)

	For n1 := 1 to oQry:LastRec()
		oRow := oQry:GetRow(n1)
		DoMethod( cForm1 , cCmb , 'AddItem' , hb_UTF8TOSTR(GetCampo(  oRow , oQry:FieldName(1)  ) )    )

	Next


	oServer:Destroy()
	oSErver := Nil


	oQry:Destroy()
	oQry := Nil


Return


Function xChgUf()

	Local cUf1 := fCadcli.cmbUf.DisplayValue

	If !Empty(cUf1)

		//	SetWaitCursor( fCadCli.Handle )

		//sysWait(.1)


		DoMethod( 'fCadcli' , 'CmbBairros'  , 'DeleteAllItems' )
		DoMethod( 'fCadcli' , 'CmbBaiEnt'  , 'DeleteAllItems' )


		EncheCmb( 'fCadcli' , 'CmbCidade' , "select municipio from ibge where uf = '" + cUf1  + "' order by 1" )
		EncheCmb( 'fCadcli' , 'CmbCidEnt' , "select municipio from ibge where uf = '" + cUf1  + "' order by 1" )



		End If

return


Function xPesqCep()

	Local cCep := fTiraChar(GetProperty('fCadCli','Cep','Value'))

	Local cCepEnt := fTiraChar(GetProperty('fCadCli','CepEnt','Value'))

	Local oServer:=GetConexao()
	Local oQry

	Local cControl
	Local cForm 

	Local aM1
	Local oRow
	Local nCidade
	Local aBairros
	Local cJanx1 := 'fCadCli'

	GetControlNameByHandle(GetFocus() , @cControl , @cForm )


	If (Alltrim(cControl) != 'Cep') .And. (Alltrim(cControl) != 'CepEnt')
		yAviso("Campo CEP(Cadastro ou Entrega) Deve estar Selecionado Para Fazer a Consulta." , .f.)	
		Return 
	End If 	

	SysWait(.1)

	
	If Alltrim(cControl) == 'Cep'
		oQry := oServer:Query("select * from cep where cep = '" + cCep + "'")
	Else 		
		oQry := oServer:Query("select * from cep where cep = '" + cCepEnt + "'")
	End If 	

	If oQry:LastRec() > 0

		oRow := oQry:GetRow(1)

		aM1      := GetCmbItens( 'fCadCli' , 'CmbUf'  )
		SetProperty( 'fCadCli','CmbUf','Value' , Ascan(aM1 , Alltrim(GetCampo(oRow , 'Uf')) )  )


		xChgUf()


		aM1 := GetCmbItens( 'fCadCli' , 'CmbCidade'  )
		nCidade := Ascan( aM1  , alltrim(GetCampo(oRow , 'Cidade')) )

		//xChgCidade


		If Alltrim(cControl) = 'CepEnt'
			

			SetProperty( 'fCadCli','CmbCidEnt','Value' ,  nCidade )
			xChgCidade(  .t. )

			aBairros := GetCmbItens( 'fCadCli' , 'CmbBaiEnt'  )

			SetProperty( 'fCadCli','EndEnt','Value' , Alltrim(GetCampo(oRow , 'Endereco')) )
			SetProperty( 'fCadCli','CmbBaiEnt','Value' , Ascan( aBairros  , Alltrim(GetCampo(oRow , 'Bairro')) )  )

			//SetProperty( 'fCadCli','CepEnt','Value' , cCep )

			//SetProperty( 'fCadCli','CmbCidade','Value' ,  nCidade )

		Else 


			nCidade := Ascan( aM1  , alltrim(GetCampo(oRow , 'Cidade')) )	

			SetProperty( 'fCadCli','Endereco','Value' , Alltrim(GetCampo(oRow , 'Endereco')) )
			SetProperty( 'fCadCli','CmbCidade','Value' ,  nCidade )

			xChgCidade( .f. )

			aBairros := GetCmbItens( 'fCadCli' , 'CmbBairros'  )

			SetProperty( 'fCadCli','CmbBairros','Value' , Ascan( aBairros  , Alltrim(GetCampo(oRow , 'Bairro')) )  )			
			//SetProperty( 'fCadCli','CmbCidade','Value' ,  nCidade )
			
		End If 		


	Else

		SetProperty( 'fCadCli','Endereco','Value' , '' )
		yAviso('Cep Não Localizado.' , .f. )
		SysWait(.2)
		fCadCli.nome.SetFocus()

	End If



	oServer:Destroy()
	oSErver := Nil

	oQry:Destroy()
	oQry := Nil


Return

Function xChgCidade( lEntrega )

	Local cCid := Alltrim(fCadcli.cmbCidade.DisplayValue)
	Local cCid2 := Alltrim(fCadcli.cmbCidEnt.DisplayValue)
	Local cUf1 := fCadcli.cmbUf.DisplayValue
	Local cCidade := ''


	If !Empty(Alltrim(cCid+cCid2))


		IF !Empty(Alltrim(cCid))
			cCidade := cCid	
		Else 			
			cCidade := cCid2	
	    End If		


		//SetHandCursor(GetControlHandle( 'Tab_1' , 'fCadCli' )   , "Finger.cur" )

		If !lEntrega
			EncheCmb( 'fCadcli' , 'CmbBairros' , "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCidade + "' order by 1" )
		Else 	
			EncheCmb( 'fCadcli' , 'CmbBaiEnt' , "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCidade + "' order by 1" )
		End If 	

	End If

Return




Function xCidEnt()

	Local cUf1 := fCadcli.cmbUf.DisplayValue
	Local cCid := fCadcli.cmbCidEnt.DisplayValue

	SetHandCursor( GetFormHandle( 'fCadCli' )   , "Finger.cur" )

	EncheCmb( 'fCadcli' , 'CmbBaiEnt' , "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCid + "' order by 1" )


REturn

Function xGrvCli()

	If !ConfirmAviso('Confirma Cadastro desse Cliente?')
		Return
	End If


Return




Static Function HabilGrv()


	//Local cJanx  := 'fCadCli1'
	Local cJanx  := 'fCadCli'
	Local lCpfOk := .f.

	If Len(Alltrim(fCadCli.Cnpj.Value)) = 11
		lCpfOk := Validcpf(  Alltrim(fCadCli.Cnpj.Value)  )
	Else
		lCpfOk := ValidCnPj(  Alltrim(fCadCli.Cnpj.Value)  )
	End If



	If (Len(Alltrim(fCadCli.Nome.Value)) > 0) .And. (  Len(Alltrim(fCadCli.Cnpj.Value)) > 0  ) .And. ;
			(Len(Alltrim(fCadCli.Endereco.Value)) > 0) .And. (lCpfOk)
		OBTN_Enable( cJanx , 353 , .t.)
	Else
		OBTN_Enable( cJanx , 353 , .f.)
	End If

	//SetFocus(fCadCli1 .nome.handle)

REturn

FUNCTION Validcpf()

	PARAMETER c_ic
	LOCAL d_1, d_2, x_x, con_ta, digito, res_to

	d_1 := 0
	d_2 := 0
	x_x := 1

	FOR con_ta := 1 TO Len( c_ic ) -2
		IF At( subs( c_ic,con_ta,1 ), "/-." ) == 0
			d_1 := d_1 + ( 11 -x_x ) * Val( SubStr( c_ic,con_ta,1 ) )
			d_2 := d_2 + ( 12 -x_x ) * Val( SubStr( c_ic,con_ta,1 ) )
			x_x := x_x + 1
		END IF
	NEXT

	res_to  := d_1 - ( Int( d_1 / 11 ) * 11 )
	dig_ito := iif( res_to < 2, 0, 11 -res_to )
	d_2     := d_2 + 2 * dig_ito
	res_to  := d_2 - ( Int( d_2 / 11 ) * 11 )
	dig_ito := Val( Str( dig_ito,1 ) + Str( iif(res_to < 2,0,11 -res_to ),1 ) )

	IF dig_ito <> Val( SubStr( c_ic,Len(c_ic ) -1,2 ) )
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

	FOR con_ta := 1 TO Len( c_gc ) -2
		IF At( subs( c_gc,con_ta,1 ), "/-." ) = 0
			d_1 := d_1 + Val( SubStr( c_gc,con_ta,1 ) ) * ( iif( x_x < 5,6,14 ) -x_x )
			d_4 := d_4 + Val( SubStr( c_gc,con_ta,1 ) ) * ( iif( x_x < 6,7,15 ) -x_x )
			x_x := x_x + 1
		END IF
	NEXT

	res_to  := d_1 - ( Int( d_1 / 11 ) * 11 )
	dig_ito := iif( res_to < 2, 0, 11 - res_to )
	d_4     := d_4 + 2 * dig_ito
	res_to  := d_4 - ( Int( d_4 / 11 ) * 11 )
	dig_ito := Val( Str( dig_ito,1 ) + Str( iif(res_to < 2, 0, 11 - res_to ),1 ) )

	IF dig_ito <> Val( SubStr( c_gc,Len(c_gc ) -1,2 ) )
		RETURN .F.
	ELSE
		RETURN .T.
	ENDIF

RETURN




Function xPesqEnt()

	Local cCep := fTiraChar(GetProperty('fCadCli','CepEnt','Value'))

	Local oServer:=GetConexao()
	Local oQry

	Local aM1
	Local oRow
	Local nCidade

	Local cJanx := 'fCadCli'

	SetWaitCursor(GetControlHandle( 'imgEnd' , cJanx ) )

	oQry := oServer:Query("select * from cep where cep = '" + cCep + "'")


	If oQry:LastRec() > 0

		oRow := oQry:GetRow(1)

		//aM1 := GetCmbItens( 'fCadCli' , 'CmbUfEnt'  )
		//SetProperty( 'fCadCli','CmbUfEnt','Value' , Ascan(aM1 , GetCampo(oRow , 'Uf') )  )

		//xChgUf()

		aM1 := GetCmbItens( 'fCadCli' , 'CmbCidEnt'  )

		nCidade := Ascan( aM1  , alltrim(GetCampo(oRow , 'Cidade')) )

		//msginfo(  Str(Len(aM1)) + ' ' +  ' ' + Str(nCidade)  )

		SetProperty( 'fCadCli','CmbCidEnt','Value' ,  nCidade )

		SetProperty( 'fCadCli','EndEnt','Value' , Alltrim(GetCampo(oRow , 'Endereco')) )



		SetProperty( 'fCadCli','CmbBaiEnt','Value' , Ascan( GetCmbItens( 'fCadCli' , 'CmbBaiEnt'  )  , Alltrim(GetCampo(oRow , 'Bairro')) )  )


	Else

		SetProperty( 'fCadCli','EndEnt','Value' , '' )

		yAviso('Cep não Localizado.' ,, 'fCadCli' )

	End If




	oServer:Destroy()
	oSErver := Nil

	oQry:Destroy()
	oQry := Nil


Return





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


Function xBloquear(  cCodCli , cStatus )


	LOCAL cSql  := "update " + Alltrim(cTabela) + " set status = '" + cStatus + "' , dtbloqueio = " + Quotedstr(ConvDt( dDataBase ) )  + " where codigo = '" + cCodCli + "'"

	IF !Confirmaviso( 'Confirma Mudança de Status(' + cStatus + ') Para Este Registro?' , cActiveJan , .t. ) 
		Return .f.
	End If 	
		
	If (cStatus = 'Ativo')
		cSql  := "update " + Alltrim(cTabela) + " set status = '" + cStatus + "' , dtbloqueio = null where codigo = '" + cCodCli + "'"
	End If

	SetWaitCursor()
	

	oServer := GetConexao()
	oQuery := oServer:Query( cSql)


	IF oQuery:NetErr()
		MsgStop( 'Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error()  , .f. )
		RETURN .f.
	END IF

	lOk := .t.

	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

Return .t. 



Function xMudaTab()
	Local nInd1 := fCadCli.Tab_1.Value


	//DoMethod("fCadCli1" , "Hide")
	//DoMethod("fCadCli2" , "Hide")

	
	If nInd1 = 1

	//	DoMethod("fCadCli2" , "Hide")
	//	DoMethod("fCadCli1" , "Show")


	//	fCadCli1.Col := 292
	//	fCadCli1.Row := 270
		//fCadCli1.Height := 347

		fCadCli .nome.SetFocus()

	Else

	//	DoMethod("fCadCli1" , "Hide")
	//	DoMethod("fCadCli2" , "Show")

	//	fCadCli2.Col := 292
		//fCadCli2.Row := 270
		//fCadCli2.Height := 347

		fCadCli .Endent.SetFocus()

	End If



Return


