#require "rddsql"
#require "sddmy"

#include <hmg.ch>

//#include "hmg.ch"





*** CONSTANTS (nControl) ***
#Define _GRID_COLUMNCAPTION_    7
#Define _GRID_COLUMNWIDTH_      31
#Define _GRID_COLUMNJUSTIFY_    37
#Define _GRID_COLUMNCONTROLS_   2
#Define _GRID_DYNAMICBACKCOLOR_ 3
#Define _GRID_DYNAMICFORECOLOR_ 4
#Define _GRID_COLUMNVALID_      5
#Define _GRID_COLUMNWHEN_       6
#Define _GRID_ONHEADCLICK_      17


#include "dbinfo.ch"
#include "error.ch"



#DEFINE COLUNA  1
#DEFINE TAMANHO 2
#DEFINE TEXTO   3



#define QUEBRA Chr(13)+Chr(10)
#define WM_HSCROLL          276

#define WS_BORDER           0x00800000
#define WM_SETREDRAW        0x0b
#define WM_SETFOCUS 7
#define NROWINI 53
#include "dbinfo.ch"
#include "error.ch"

#define WM_CLOSE            0x0010

#include "hmg.ch"

#define IDC_BTN_1   2001
#define IDC_BTN_2   2002
#define IDC_BTN_3   2003
#define IDC_BTN_4   2104
#define IDC_BTN_5   2005
// #define IDC_BTN_YES 201
// #define IDC_BTN_NO  1102

#define FONTCOR {0,106,133}
#define BACK1 {229,237,242}

#define CORSEL     {216,228,236}

/*
#define DBI_QUERY             1001
#define RDDI_CONNECT          1001
#define RDDI_DISCONNECT       1002
#define RDDI_EXECUTE          1003
#define RDDI_ERROR            1004
#define RDDI_ERRORNO          1005
#define RDDI_NEWID            1006
#define RDDI_AFFECTEDROWS     1007
#define RDDI_QUERY            1008
*/




REQUEST SDDMY, SQLMIX

//ANNOUNCE RDDSYS

STATIC nIndexEvent := 1

//STATIC aButtons := {}


Define Window Main

REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850


FUNCTION MntFornec()

	LOCAL wCad := 'fornecedores'
	Local aOp1 := {'Consultas','Relatorios','Parametros' }

	Local cControl

	Local  aButOpcoes := {  { "&Incluir", {|| ( fx2( "I")  )     }, .T., "Cadastra um Novo Fornecedor", 0 }, ;
		{ "&Modificar", {||  fx2("edit")   } , .T., "Modifica um Fornecedor Existente." , 0 }, ;
		{ "&Bloquear", {||  fx1( "bloquear" ) }, .T., "Bloqueia/Inativa um Cadastro Ativo.", 0 } ,;
		{ "&Filtrar", {|| ProcFiltro( 'fornecedor' )    }, .T., "Filtra Registros", 0 } ,;
		{ Hb_AnsiToOem("OpÔøΩÔøΩes") , {|| xSetOpcao()  }, .T., Hb_AnsiToOem("OpÔøΩÔøΩes Diversas") , 0 } }


	//Local cform



	Local aOp2 := { {'2-Geral' , { || msginfo('ok') } } ,   ;
		{'2-Geral1' , { || msginfo('ok1')} },;
		{'2-Geral2' , { || msginfo('ok3')} } ,;
		{'3-Geral4' , { || msginfo('ok4') } },;
		{'3-Geral' , { || msginfo('ok5') } } }


	LOCAL aTam    := GetCamposInf( wCad, 'TAM' )
	LOCAL aCabec  := GetCamposInf( wCad, 'CABEC' )
	LOCAL aCampos := GetCamposDic( wCad, 'S', .T. )



	Private nItMax := 18
	Private nItx1  := nItMax

	Private nItemId := 0

	Private lArrastou := .f.

	Private lDrag     := .f.
	Private nObjDrag  := 0

	Private lDrawOk := .f.

	private cButVerde := ".&Filtrar."

	//Private nTotWidth := 0

	Private nRowIni2 := 10

	Private cTituloJan := ''
	Private nQRegx     := 0

	Private nColOrder  := 0


	Private lAumentou := .f.

	Private aMtrHeader := {}

	Private nEven1 := 0
	Private nEven2 := 0


	Private aFont2 := ARRAY FONT "Arial" SIZE 9 BOLD ITALIC
	Private aFont1 := ARRAY FONT "Arial" SIZE 9
	//BOLD ITALIC


	PRIVATE nGradDirF  := 0
	PRIVATE cFontName  := 'Arial'
	PRIVATE nFontSize  := 9

	PRIVATE aBtnFont  := { cFontName , 8 , .F., .F., .F., .F. }


	Private nPosAnt  := -1


	Private nInd2 := 0

	Private lAscendente := .t.

	Private lDragMode := .f.

	Private lDrawHead := .f.
	Private nSec11    := 0


	Private nSaveScr := 0

	Private nColIni := 0

	Private lOkCad := .f.

	Private nColSel := 0

	Private nIndexEve1 := 0


	Private cLblConsu := ''

	Private lSoltou := .f.

	Private nTotWidth := 0

	Private nObjSize := 0
	Private lmodeSize := .f.

	Private cBufHeader := ''

	Private aButx1 := {}



	SET LANGUAGE TO PORTUGUESE
	SET CODEPAGE TO PORTUGUESE

	HB_SetCodePage( "PT850" )
	hb_langSelect( "PT" )

	// MSGINFO(HB_LANGSELECT() )

	_HMG_SYSDATA[ 348 ] := { 199, 250, 225 }
	_HMG_SYSDATA[ 349 ] := { 007, 071, 041 }
	_HMG_SYSDATA[ 350 ] := { 235, 237, 095 }
	_HMG_SYSDATA[ 351 ] := { 069, 015, 135 }

	//Private aButtons := Aclone(aButOpcoes)

	ManutDb( aCabec, aCampos,  GetSql( "Fornecedores", .F. ), "Forne", aTam, "Cadastro de Fornecedores" ,"Fornecedores" , aOp1  , aOp2 , aButOpcoes )



RETURN




Static Function Fx2( cTexto )


	Local nValue1 := GetProperty(  cActiveJan , 'Br_grid' , 'Value' )
	Local aItems := GetProperty(  cActiveJan , 'br_grid' , 'Items' )
	Local aCli := GetProperty( cactiveJan , 'br_grid', 'Item' ,   nValue1[1]    )
	Local cAx1 := 'FTop1' + Right( cActiveJan,5)
	Local cTexto1 := OBTN_Caption(cAx1   , aButtons[3][5] )



	If cTexto = 'I'

		xCadFor(   .t. , '' )

		If lOkCad
			yAviso('Fornecedor Cadastrado com Sucesso!')
			nReg1 := Len(OpenReg( ''  , ,   1 ))
		End If

	End If


	If cTexto = "edit"
		xCadFor(   .f. ,  aCli[1] )

	End If

Return



Function xCadFor( lNovox , cCodigo )

	Local lOk := .f.

	Private cJanx := 'fCadForne'

	Private lNew1 := lNovox

	Private cCodFornx := cCodigo 

	Load Window fCadForne



	SetProperty("fCadForne" , "Label_2","Value", Hb_AnsiToOem("Nome\RazÔøΩo Social") )
	SetProperty("fCadForne" , "Label_3","Value", Hb_AnsiToOem("EndereÔøΩo") )

	SetProperty("fCadForne" , "Label_15","Value", Hb_AnsiToOem("ObservaÔøΩÔøΩo") )


	Center Window fCadForne

	ON KEY ESCAPE OF fCadForne ACTION _FechaJan('fCadForne' )

	HMG_ChangeWindowStyle(  fCadForne.Handle , WS_EX_DLGMODALFRAME, NIL, .T., .T. )


	EncheCmb(  cJanx , 'CmbCidade' , "select municipio from ibge where uf = '" + cUfEmp + "' order by 1" )
	//EncheCmb( cJanx , 'CmbBairros' , "select municipio from ibge where uf = '"  + cUfEmp + "' order by 1" )

	EncheCmb(   cJanx , 'CmbUf' , "select distinct uf from ibge order by 1" )


	EncheCmb( 'fCadForne' , 'CmbCategoria' , "select descricao from categorias where status = 'Normal' order by 1" )

	If !lNovox
		If !xLoadfor( cCodigo )
			yAviso("NÔøΩo foi Possivel recuperar informaÔøΩÔøΩes deste Cadastro." , .t. )
		End If 
	End If 


	Activate Window fCadForne


REturn lOk


Static Function xLoadfor( cCodForne )

	Local cSql := "Select * from Fornecedores where codigo = '" + cCodForne + "'"
	Local lOk := .f.

	Local oServer := GetConexao()
	Local oQuery := oServer:Query( cSql)
	Local oRow

	Local aUf
	Local aBairros
	Local nInd2

	Local cRet1

	
	If oQuery:LastRec() > 0

		oRow := oQuery:GetRow(1)

		lOk := .t.


		fCadForne .RazaoSocial. value := GetCampo(oRow , 'Razao')
		fCadForne .endereco. value := GetCampo(oRow , 'Endereco')

		aUf := GetCmbItens( 'fCadForne' , 'cmbUf'  )


		nind2 := Ascan(aUf , Alltrim(GetCampo(oRow , 'Uf')) )

		If (nInd2 > 0)
			fCadForne .CmbUf.Value := nind2
		End If

		fCadForne .CmbCidade.Value := Ascan( GetCmbItens( 'fCadForne' , 'cmbCidade'  )  , Alltrim(GetCampo(oRow , 'Cidade')) )
		xChgCidade()
	


		fCadForne .CmbBairros.Value := Ascan( GetCmbItens( 'fCadForne' , 'cmbBairros'  )  , Alltrim(GetCampo(oRow , 'Bairro')) )


		fCadForne .fantasia. value := GetCampo(oRow , 'fantasia')


		fCadForne .cnpj. value := GetCampo(oRow , 'Cnpj')

		fCadForne .rg. value := GetCampo(oRow , 'Rg')

		fCadForne .cep. value := GetCampo(oRow , 'Cep')

		fCadForne .Referencia. value := GetCampo(oRow , 'referencia')

		fCadForne .Telefone. value := GetCampo(oRow , 'fone')
		fCadForne .email. value := GetCampo(oRow , 'email')
		fCadForne .contato. value := GetCampo(oRow , 'contato')
		fCadForne .EdtObs. value  :=GetCampo(oRow , 'observacao')

		fCadForne.LblStatus.Value := GetCampo(oRow , 'status')

		fCadForne.Lblcodigo.Value := GetCampo(oRow , 'codigo')

		fCadForne.inEst.Value := GetCampo(oRow , 'ie')


		fCadForne.foneCon.Value := GetCampo(oRow , 'contatofor')

		fCadForne.WhatsAp.Value := GetCampo(oRow , 'whastapp')

		
		If !Empty(GetCampo(oRow , 'Categoria'))
			cRet1 := AllTrim( RetSql( "select descricao from categorias where codigo = " + Quotedstr(GetCampo(oRow , 'Categoria')) + " And Status = 'Normal'"  ))
			fCadForne .CmbCategoria.Value := Ascan( GetCmbItens( 'fCadForne' , 'CmbCategoria'  )  , Alltrim(cRet1) )
		End If


		If GetCampo(oRow , 'tipofor') = 'F'
			fCadForne.CmbTipo.Value := 1
		Else
			fCadForne.CmbTipo.Value := 2
		End If

		If Alltrim(GetCampo(oRow , 'Status')) = 'Inativo'
			yAviso("Fornecedor com Cadastro Bloqueado\Inativo.Apenas sera Visualizado(Somente Leitura).")
			SetWindowControlsEnable('fCadForne' , .f. )
			//SetWindowControlsEnable('fCadCli2' , .f. )
		End If 





	Else

	End If


	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil


Return lOk

Static Function HabilGrv()


	//Local cJanx  := 'fCadCli1'
	//Local cJanx  := 'fCadForne'
	Local lCpfOk := .f.

	If Len(Alltrim(fCadForne.Cnpj.Value)) = 11
		lCpfOk := Validcpf(  Alltrim(fCadForne.Cnpj.Value)  )
	Else
		lCpfOk := ValidCnPj(  Alltrim(fCadForne.Cnpj.Value)  )
	End If



	If (Len(Alltrim(fCadForne.RazaoSocial.Value)) > 0) .And. (  Len(Alltrim(fCadForne.Cnpj.Value)) > 0  ) .And. ;
			(Len(Alltrim(fCadForne.Endereco.Value)) > 0) .And. (lCpfOk)
		OBTN_Enable( cJanx , 353 , .t.)
	Else
		OBTN_Enable( cJanx , 353 , .f.)
	End If

REturn

Function xInitFor()


	OBTN_Create( cJanx, 353, "&Ok", 352 , 670,  62 ,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
	OBTN_Create( cJanx, 54, "&Cancelar" , 352 , 735 ,  62,  24,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )


	OBTN_Create( cJanx, 98 , "&Consultar CEP" , 153 , 279 ,  82,  22 ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )


	OBTN_Font( cJanx, 353,  { cFontName, nFontSize, .F., .F., .F., .F. } )
	OBTN_Font( cJanx, 54,  { cFontName, nFontSize, .F., .F., .F., .F. } )
	OBTN_Font( cJanx, 98,  { cFontName, nFontSize, .F., .F., .F., .F. } )

	OBTN_Enable( cJanx , 353 , .f.)

	AAdd( aButx1, {  353,  OBTN_Handle( cJanx, 353 ),   { || ( PushButton( cJanx , 353)  , GrvForne(lNew1) )    } ,  cJanx   } )
	AAdd( aButx1, {  54 ,  OBTN_Handle( cJanx, 54 ),   { ||  _FechaJan(cJanx)  } ,  cJanx   } )
	AAdd( aButx1, {  98 ,  OBTN_Handle( cJanx, 98 ),   { || ( PushButton( cJanx , 98) , xPesqCep() )  } ,  cJanx   } )

	EventProcessAllHookMessage( nZa1 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 353 )   ), .T. )
	EventProcessAllHookMessage( nZa2 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 54 )   ), .T. )

	EventProcessAllHookMessage( nZa3 := EventCreate( {|| InputEvButton( aButx1, cJanx ) },    OBTN_Handle( cJanx, 98 )   ), .T. )

	//sysWait(.2)

Return




Static Function xChgCidade()

	Local cCid := Alltrim(fCadForne.cmbCidade.DisplayValue)
	Local cUf1 := fCadForne.cmbUf.DisplayValue

	If !Empty(cCid)
		SetHandCursor(GetControlHandle( 'Frame_1' , 'fCadForne' )   , "Finger.cur" )
		EncheCmb( 'fCadForne' , 'CmbBairros' , "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCid + "' order by 1" )
		//EncheCmb( 'fCadcli2' , 'CmbBaiEnt' , "select  bairro from bairros where uf = '" + cUf1  + "' and cidade = '"  + cCid + "' order by 1" )
	End If

Return


Static Function xChgUf()

	Local cUf1 := fCadForne.cmbUf.DisplayValue


	If !Empty(cUf1)
		DoMethod( 'fCadForne' , 'CmbBairros'  , 'DeleteAllItems' )
		EncheCmb( 'fCadForne' , 'CmbCidade' , "select municipio from ibge where uf = '" + cUf1  + "' order by 1" )
	End If

return

Static Function xPesqCep()

	Local cCep := fTiraChar(GetProperty('fCadForne','Cep','Value'))

	Local oServer:=GetConexao()
	Local oQry

	Local aM1
	Local oRow
	Local nCidade
	Local aBairros


	Local cJanx1 := 'fCadCli1'

	//SetWaitCursor(GetControlHandle( 'imgLupa' , cJanx1 ) )

	SetWaitCursor( fCadForne.Handle  )


	SetWaitCursor( fCadForne.Handle   , "Finger.cur" )

	oQry := oServer:Query("select * from cep where cep = '" + cCep + "'")


	If oQry:LastRec() > 0

		oRow := oQry:GetRow(1)

		aM1      := GetCmbItens( 'fCadForne' , 'CmbUf'  )
		SetProperty( 'fCadForne','CmbUf','Value' , Ascan(aM1 , Alltrim(GetCampo(oRow , 'Uf')) )  )


		xChgUf()

		aM1 := GetCmbItens( 'fCadForne' , 'CmbCidade'  )

		nCidade := Ascan( aM1  , alltrim(GetCampo(oRow , 'Cidade')) )


		SetProperty( 'fCadForne','CmbCidade','Value' ,  nCidade )

		xChgCidade()

		aBairros := GetCmbItens( 'fCadForne' , 'CmbBairros'  )


		SetProperty( 'fCadForne','Endereco','Value' , Alltrim(GetCampo(oRow , 'Endereco')) )


		SetProperty( 'fCadForne','CmbBairros','Value' , Ascan( aBairros  , Alltrim(GetCampo(oRow , 'Bairro')) )  )

		//	SetProperty( 'fCadForne','CmbBaiEnt','Value' , Ascan( aBairros  , Alltrim(GetCampo(oRow , 'Bairro')) )  )


	Else

		SetProperty( 'fCadForne','Endereco','Value' , '' )
		yAviso('Cep nÔøΩo Localizado.' ,, 'fCadForne' )

	End If


	oServer:Destroy()
	oSErver := Nil

	oQry:Destroy()
	oQry := Nil


Return

Function GrvForne(lNovo1)

	Local cSqlinsert
	//Local cCodClasse := GetTableId( 'Classes', fCadForne.CmbClasse.DisplayValue )
	Local cCodCateg  := GetTableId( 'Categorias', fCadForne.CmbCategoria.DisplayValue )
	Local nId        := GetReg("Fornecedores")
	Local cCodMun    := ''
	Local cMsg       := 'Confirma Cadastro desse Fornecedor?'
	Local aValores   := {}
	Local aCamposf := {'codigo' , 'dtbloqueio' ,'status' , 'datcad' }

	Local aCamposf1 := {'dtbloqueio','dtmodcad'}


	If !lNovo1
		cMsg := 'Confirma AlteraÔøΩÔøΩo no Cadastro deste Fornecedor?'
	End If


	IF !Confirmaviso( cMsg  , cActiveJan , .f. )


		SendMessage( OBTN_Handle(  'fCadForne' , 353 )  , WM_MOUSEMOVE , 0, 0)
		SendMessage( OBTN_Handle(  'fCadForne' , 54 )   , WM_MOUSEMOVE , 0, 0)


		SysWait(.3)

		Return .f.

	End If

	If (lNovo1)
		Aadd(aValores , Quotedstr(  AllTrim( StrZero( nId + 1 , 6 ) ) )  )
	End If


	//Aadd(aValores , Quotedstr(Alltrim(fCadCli1 .nome. value))  )

	Aadd(aValores , Quotedstr(Alltrim(fCadForne .RazaoSocial. value))  )
	Aadd(aValores , Quotedstr(Alltrim(fCadForne .endereco. value)) )

	Aadd(aValores , Quotedstr(Alltrim(fCadForne .cmbbairros.Displayvalue)) )
	Aadd(aValores , Quotedstr(Alltrim(fCadForne .fantasia. value))   )

	Aadd(aValores , Quotedstr(AllTrim( fCadForne .cmbcidade. Displayvalue ))  )
	Aadd(aValores , Quotedstr(AllTrim( fCadForne .cmbUf.DisplayValue)) )

	Aadd(aValores , Quotedstr(Alltrim(fCadForne .cnpj. value))  )


	Aadd(aValores , Quotedstr(AllTrim( fCadForne .cep. value )) )
	Aadd(aValores , Quotedstr(AllTrim( fCadForne .Referencia. value )) )

	Aadd(aValores , Quotedstr(AllTrim( fCadForne .Telefone. value )) )


	Aadd(aValores , Quotedstr(AllTrim( fCadForne .Email. value )) )

	Aadd(aValores , Quotedstr(Alltrim(fCadForne .contato. value))    )

	Aadd(aValores, Quotedstr(Iif( fCadForne .CmbTipo. value = 1, 'F', 'J' )) )

	Aadd(aValores , Quotedstr(AllTrim( fCadForne .EdtObs. value )) )


	If (lNovo1)
		Aadd(aValores , QuotedStr('Normal') )
	End If

	Aadd(aValores , Quotedstr(AllTrim( fCadForne .InEst. value )) )



	If (lNovo1)
		Aadd(aValores , Quotedstr(ConvDt( dDataBase ) )  )
		
	End If


	Aadd(aValores , Quotedstr(AllTrim( fCadForne .rg. value )) )

	
	If (!lNovo1)
		Aadd(aValores , Quotedstr(ConvDt( dDataBase ) )  )		
	End If


	Aadd(aValores ,   Chr( 39 ) + AllTrim( cCodCateg ) + Chr( 39 )   )


	Aadd(aValores , Quotedstr(AllTrim( fCadForne .WhatsAp. value )) )

	Aadd(aValores , Quotedstr(AllTrim( fCadForne .FoneCon. value )) )




	//Aadd(aValores , Quotedstr(AllTrim( fCadCli1 .FoneCon. value )) )


/*
	Aadd(aValores , Quotedstr(ConvDt( fCadCli1 .DataNasc. value ) )  )

	
	If (lNovo)
		Aadd(aValores , QuotedStr('Normal') )
		Aadd(aValores , Quotedstr(ConvDt( dDataBase ) )  )
	End If

	
	

	If (!lNovo)
		Aadd(aValores , Quotedstr(ConvDt( dDataBase ) )  )
	End If
	Aadd(aValores , chr( 39 ) + AllTrim( fCadCli2 .EndEnt.value ) + Chr( 39 ) )
	Aadd(aValores ,chr( 39 ) + AllTrim( fCadCli2 .CmbBaiEnt.Displayvalue ) + Chr( 39 ) )

	Aadd(aValores ,chr( 39 ) + AllTrim( fCadCli2 .CmbCidEnt.Displayvalue ) + Chr( 39 ) )



	Aadd(aValores ,chr( 39 ) + AllTrim( fTiraChar(fCadCli2 .CepEnt.value) ) + Chr( 39 ) )

	Aadd(aValores ,chr( 39 ) + AllTrim( fCadCli2 .RefEnt.value ) + Chr( 39 ) )

	Aadd(aValores , Quotedstr(AllTrim( fCadCli1 .WhatsAp. value )) )

	Aadd(aValores ,   Chr( 39 ) + AllTrim( cCodClasse ) + Chr( 39 )  )

	*/


	If !lNovo1
		cSqlz1 := xSqlUpdate('Fornecedores' , aValores ,aCamposF , "Codigo = " + QuotedStr(cCodFornx) )
	Else
		cSqlZ1 := xSqlInsert('Fornecedores' , aValores ,aCamposF1 )
	End If

	hb_MemoWrit( 'InsFornec.txt', cSqlz1 )

	oServer := GetConexao()
	oQuery := oServer:Query(cSqlz1)

	IF oQuery:NetErr()
		//CursorArrow()
		yAviso( 'Erro ao Executar AtualizaÁ„o -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error() , .f.)
		Return .f.
	END IF


	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

	//SysWait(.1)

	fCadForne.Release()

	lOkCad := .t.

	yAviso("Manuten√ß√£o Realizada com Sucesso!" , .t. )


Return .t.


