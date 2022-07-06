#include "hmg.ch"

//25-09-2021

#define QUEBRA chr(13)+chr(10)

#define WM_SETFOCUS 7

Declare window fSplit6
Declare window fSplit10
Declare window fSplit2
Declare window Main





Function GetCampoOrdem( cTabela , cCampo)

	LOCAL oServ   := GetConexao()
	LOCAL aCampos := {}
	Local nOrdem := 0

	LOCAL i := 1

	LOCAL oQuery
	Local oRow

	LOCAL cSql  := "Select ordem from dicionario where tabela = '" + AllTrim( cTabela ) + "' and camposistema = '" + cCampo + "'"

	oQuery := oServ:Query( cSql )

	If oQuery:LastRec() > 0
		oRow := oQuery:GetRow( 1 )
		nOrdem := oRow:FieldGet(1)
	End If

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

Return nOrdem

Function SetCampoOrdem(cTabela , cCampo , nOrdem1 )

	LOCAL oServ   := GetConexao()
	LOCAL aCampos := {}
	Local nOrdem := 0

	Local lOk := .t.

	LOCAL i := 1

	LOCAL oQuery
	Local oRow

	LOCAL cSql  := "update dicionario set ordem = "  + Alltrim(Str(nOrdem1))
	cSql += " where tabela = '" + AllTrim( cTabela ) + "' and camposistema = '" + cCampo + "'"
	

	
	oServer := GetConexao()
	oQuery := oServer:Query( cSql)

	IF oQuery:NetErr()
		yAviso( '(SetOrder) Erro ao Executar Atualização -> ' + Chr( 13 ) + Chr( 10 ) + oQuery:Error()  ,, .f.  )
		Return .f.
	END IF

	lOk := .t.

	oServer:Destroy()
	oServer := Nil


Return lOk


Function EventSTOPAll (lStop)
LOCAL n1 := 0

   For n1 := 1 To Len(_HMG_EventData)
		_HMG_EventData [n1] [4]  := lStop 
   Next 

   /*

   IF ValType (lStop) == "L"
      _HMG_EventData [nIndex] [4] := lStop
   ENDIF
   */

Return .t. 



Function TroqOrdens(cTabela1 , nOrd1 , nOrd2  , cCampoName )

	LOCAL oServ   := GetConexao()
	LOCAL aCampos := {}
	Local nOrdem := 0

	Local lOk := .t.

	LOCAL i := 1

	LOCAL oQuery
	Local oRow

	Local cSql1 := ''
	Local cSql2 := ''


	If nOrd1 == nOrd2 
		Return 
	End If 


	If (nOrd2 > 1) .And. (nOrd1 < nOrd2)
		cSql1  := "update dicionario set ordem = ordem - 1 "  
		cSQl1 += " where tabela = '" + AllTrim( cTabela1 ) + "' and ordem > " + Alltrim(Str(  nOrd1   )) + " and Ordem <= " + Alltrim(Str(  nOrd2   )) + ";"

		cSql2  := "update dicionario set ordem = " + Alltrim(Str(  nOrd2   ))
		cSQl2 += " where tabela = '" + AllTrim( cTabela1 ) + "' and ordem = " + Alltrim(Str(  nOrd1   )) +  " and camposistema = '" + Alltrim(cCampoName) + "';"   
	Else 



		If  (nOrd1 > nOrd2)

			//msginfo('ok2')

			cSql1  := "update dicionario set ordem = ordem + 1 "  
			cSQl1 += " where tabela = '" + AllTrim( cTabela1 ) + "' and ordem >= " + Alltrim(Str(  nOrd2   )) + " and Ordem < " + Alltrim(Str(  nOrd1   )) + ";"

			cSql2  := "update dicionario set ordem = " + Alltrim(Str(  nOrd2   ))
			cSQl2 += " where tabela = '" + AllTrim( cTabela1 ) + "' and ordem = " + Alltrim(Str(  nOrd1   )) +  " and camposistema = '" + Alltrim(cCampoName) + "';" 


		End If 



	End If 	

	SaveLog("Logs\SqlTrocaCampos"  + Dtos(Date()) + ".Log"  , cSql1   )
	SaveLog("Logs\SqlTrocaCampos"  + Dtos(Date()) + ".Log"  , cSql2   )

	oServer := GetConexao()

	//oQuery := oServer:Query( 'START TRANSACTION;')

	oServer:StartTransaction()

	oQuery := oServer:Query( cSql1)

	IF oQuery:NetErr()		
		xDialog( Hb_AnsiToOem('(CampoTam1) Erro ao Executar Atualização -> ' + Chr( 10 ) + Chr( 13 ) + oQuery:Error() ), .f.  )
		RETURN .f.
	END IF
	
	

	oQuery := oServer:Query( cSql2)

	IF oQuery:NetErr()		
		xDialog( Hb_AnsiToOem('(CampoTam2) Erro ao Executar Atualização -> ' + Chr( 10 ) + Chr( 13 ) + oQuery:Error() ), .f.  )
		RETURN .f.
	END IF

	
	oServer:Commit()

	lOk := .t.

	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	

Return lOk




Function SetCampoTam(cTabela , cCampo , nOrdem1 )

	LOCAL oServ   := GetConexao()
	LOCAL aCampos := {}
	Local nOrdem := 0

	Local lOk := .t.

	LOCAL i := 1

	LOCAL oQuery
	Local oRow



	LOCAL cSql  := "update dicionario set tamdisp = "  + Alltrim(Str(nOrdem1))
	cSQl += " where tabela = '" + AllTrim( cTabela ) + "' and camposistema = '" + cCampo + "'"


	SaveLog("Logs\SqlTrocaTamanho_" + Dtos(Date()) + ".Log" , cSql + QUEBRA )
	oServer := GetConexao()
	oQuery := oServer:Query( cSql)

	IF oQuery:NetErr()		
		xDialog( Hb_AnsiToOem('(CampoTam) Erro ao Executar Atualização -> ' + Chr( 10 ) + Chr( 13 ) + oQuery:Error() ), .f.  )
		RETURN .f.
	END IF


	oQuery := oServer:Query('Commit')

	lOk := .t.

	oServer:Destroy()
	oServer := Nil


Return lOk




FUNCTION GetCamposDic( cTabela, cBrowse, lCmpTab , lOem )

	LOCAL oServ   := GetConexao()
	LOCAL aCampos := {}

	LOCAL i := 1

	LOCAL oQuery

	LOCAL cSql  := "Select * from dicionario where tabela = '" + AllTrim( cTabela ) + "' order by ordem"

	Default lOem := .t.

	oQuery := oServ:Query( cSql )


	//HB_SETCODEPAGE("UTF8")


	For i := 1 TO oQuery:LastRec()

		oRow := oQuery:GetRow( i )

		If cBrowse == 'S'

			If Alltrim(oRow:FieldGet( 6 )) == 'S'
				If !Empty( oRow:FieldGet( 5 ) )

					If lCmpTab
						If (oRow:FieldGet( 4 ) == 'C') .And. (lOem)
							AAdd( aCampos,   'hb_OemToAnsi(' + AllTrim(oRow:FieldGet(3 )) + ')'    )

						Else
							AAdd( aCampos,   AllTrim(oRow:FieldGet(3 ))     )
						End If
					Else						
						AAdd( aCampos,   Alltrim(oRow:FieldGet( 5 ))  )
					End If
				End If
			End If

		Else 
			If !Empty( oRow:FieldGet( 5 ) )
				If lCmpTab
					AAdd( aCampos,  Alltrim(oRow:FieldGet( 3 ))  )	
				Else 	
					AAdd( aCampos,  Alltrim(oRow:FieldGet( 5 ))  )
				End If 	
			End If
		End If

		// msginfo(oRow:FieldGet(2) )

		oQuery:Skip( 1 )

	Next
	

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

	If Len( aCampos ) == 0
		yAviso( 'Dicionario de dados não Localizado para Tabela ' +  cTabela + QUEBRA + 'Contacte Suporte.' , .f. )
	End If

RETURN aCampos

Function GetCampoTipo(  cCampo , cTabela )

	Local cSql := "select * from dicionarios"

REturn

FUNCTION GetSql( cTabela, lWhere )

	LOCAL aCampos := GetCamposDic( cTabela, 'S',   .t. , .f. )
	Local aTipos  := GetCamposInf( cTabela, 'TIPO' )
	//Local aTam    := GetCamposInf( cTabela, 'TAM' )
	LOCAL ni
	LOCAL nQReg := GetReg( cTabela )
//   LOCAL cSql := 'select @row_number:=@row_number+1 AS row_number,'

	LOCAL cSql1 := 'select '



	For ni := 1 TO Len( aCampos )

		If (alltrim(aTipos[ni]) <> 'C')

			If (alltrim(aTipos[ni]) = 'D')
				cSql1 += "lPad(Date_Format(" + AllTrim( aCampos[ ni ] ) + ", '%d/%m/%Y'),10,' ')  As " +  alltrim(aCampos[ ni ]) + " ,"
			Else
				cSql1 += "ifNull(" + AllTrim( aCampos[ ni ] ) + " ,0 ) As " +  alltrim(aCampos[ ni ]) + " ,"
			End If

		Else
			//cSql1 += AllTrim( aCampos[ ni ] ) + ","
			cSql1 +=  "ifNull(" + AllTrim( aCampos[ ni ] ) + " ,' ') As " +  alltrim(aCampos[ ni ]) + ","
		End If


	Next

	cSql1 := Left( cSql1, Len( cSql1 ) -1 )

	IF ( lWhere )

		IF nQreg > qTotReg
			cSql1 += " from " + cTabela + " a where id >= " + AllTrim( Str( nQreg - qTotReg ) )
		ELSE
			cSql1 += " from " + cTabela + " a "
		END IF

		cSql1 += " Order by 2"

	ELSE
		cSql1 += " from " + cTabela
	END IF

	SaveLog('Logs\sqlfunc_GetSql_' + Dtos(date()) + '.txt',cSql1)

	//msginfo( cSql)

RETURN cSql1


FUNCTION GetIndexes( cTabela )

	LOCAL oServer
	LOCAL oQuery

	LOCAL n1 := 0
	LOCAL aM1 := {}
	LOCAL cSql := ''

	cSql += "SELECT INDEX_NAME , camposistema "
	cSql += "FROM INFORMATION_SCHEMA.STATISTICS s "
	cSql += "LEFT OUTER JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS t  "
	cSql += "    ON t.TABLE_SCHEMA = s.TABLE_SCHEMA "
	cSql += "       AND t.TABLE_NAME = s.TABLE_NAME "
	cSql += "       AND s.INDEX_NAME = t.CONSTRAINT_NAME "
	cSql += "LEFT OUTER JOIN dicionario b ON b.tabela = s.TABLE_NAME AND b.camporeal = s.COLUMN_NAME "
	cSql += "WHERE 0 = 0 "
	//cSql += "      AND t.CONSTRAINT_NAME IS NULL "
	cSql += "AND s.TABLE_SCHEMA = '"  + AllTrim( cBanco ) + "' and s.TABLE_NAME = '" + cTabela + "'"

	// hb_MemoWrit("Con1.txt", cSql )

	SaveLog(  'Sqlp01.txt' , cSql )

	oServer := GetConexao()
	oQuery  := oServer:Query( cSql )

	FOR n1 := 1 TO oQuery:LastRec()

		oGet := oQuery:GetRow( n1 )

//		msginfo(   oGet:FieldGet( 2 ) )
		If !Empty(Alltrim( oGet:FieldGet( 2 )   ))
			AAdd( aM1, Hb_UTF8ToStr(oGet:FieldGet( 2 )) )
		End If 

		oQuery:Skip( 1 )

	NEXT

	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

RETURN aM1



FUNCTION GetReg( cTabela , cCampoId )

	LOCAL oServ := GetConexao()
	LOCAL oQuery := oServ:Query( 'select count(*) as t1 from ' + cTabela )
	LOCAL nQreg  := 0

	Default cCampoid := ''

	If !Empty(cCampoid)
		oQuery := oServ:Query( "select max(" + cCampoid + ") as t1 from " + cTabela )
	End If

	IF oQuery:LastRec() > 0

		oR1 := oQuery:GetRow( 1 )
		nQreg := oR1:FieldGet( 1 )

	END IF

	oServ:Destroy()
	oServ := Nil

	oQuery:Destroy()
	oQuery := Nil

RETURN nQreg

FUNCTION GetConexao()

	LOCAL oServer
	LOCAL lRet
	LOCAL oQuery

	oServer := TMySQLServer():New( cServer, cUserDb, cPassDb )

	IF oServer:NetErr()
		MsGInfo( "Error ao Conectar SQL Server: " + QUEBRA + oServer:Error() )
		RELEASE Window ALL
		QUIT
	ENDIF



	oServer:SelectDB( cBanco )

	IF oServer:NetErr()
		MsGInfo( "Error ao Conectar Banco " + cBanco + " : " + QUEBRA + oServer:Error() )
		RELEASE Window ALL
		QUIT
	ENDIF

RETURN ( oServer )


FUNCTION xInit()



	LOCAL aRet
	LOCAL cIniFile := "DataBase.ini"
	LOCAL aSec
	//GetStartupFolder()

	Local cIp     := ""
	Local cBanc1  := ""
	Local cUser1  := ""
	Local cSen1   := ""

	Local nLop := 4

	
	//msginfo('ok22')


	//msginfo(  GetCurrentFolder() )


	IF !File( Alltrim(cInifile) )
		MsgInfo( 'Arquivo DataBase.ini não Localizado , Impossivel Continuar.' )
		//fPrincipal.Release()
	END IF

	//aSec := _GetSectionNames( cIniFile )

	Begin ini file cInifile

		Get cIp Section "db" ENTRY "Ip"
		Get cBanc1 Section "Db" ENTRY "Banco"

		Get cUser1 Section "Db" ENTRY "User"
		Get cSen1 Section "Db" ENTRY "Senha"

	End ini

	IF Empty(cIp)
		MsgInfo( 'Arquivo DataBase.ini Comrropido  , Impossivel Continuar.' )
		RELEASE Window ALL
		QUIT
	END IF

	cServer := cIp
	cBanco  := cBanc1
	cUserDb := cUser1
	cPassDb := cSen1

	//SysWait(.2)

	
	SetWindowCursor( GetFormHandle( 'Main'  ) , 'CURSOR1' )  


	DO EVENTS


	SetProperty("fSplit4","fUserDb","Value",cBanco)
	SetProperty("fSplit4","fServerDb","Value",cServer)

	np1 := (nDesktopHeight - 81) - GetProperty("fSplit4","Height" )
	np2 := np1 - GetProperty("fSplit3","Height" )

	SetProperty("fSplit3","Row", np2  - 0 )
	SetProperty("fSplit4","Row", np1 )

	SetProperty("fSplit5","Row",nDesktopHeight - 80 )


	SetProperty("fSplit6","Row",61 )


	np1 := (nDesktopHeight - 81) - GetProperty("fSplit4","Height" )
	np2 := np1 - GetProperty("fSplit3","Height" )
    
	

	SetProperty("fSplit6","Height", 522)

	//SetProperty("fSplit6","BackColor",aCorSub1)


	SetProperty("fSplit6","Col",0)


	SetProperty("fSplit5","Width",nDesktopWidth - nLop)

	SetProperty("fSplit2","Width",nDesktopWidth - 50 )

	SetProperty("fSplit10","Height", GetProperty("fSplit2","Height" ) )

	SetProperty("fSplit10","Width", nDesktopWidth - 1232 )

	SetProperty("fSplit10","Col",  nDesktopWidth - 50)

	


	SetProperty("fSplit10","Row", GetProperty("fSplit2","Row" )+23)

	ShowScrollBar( GetFormHandle( 'fSplit2' ), 0, .F. )
	ShowScrollBar( GetFormHandle( 'fSplit2' ), 1, .F. )


	//SetWindowCursor( GetFormHandle( 'Main'  ) , IDC_ARROW)  

	SysWait(.2)


	

	//xMenuMain( 'Main' ,  70 , 1  , aOpcoes , aItens )



	//DoMethod('Win_MenuPrincipal'  , 'Activate')

	//DoMethod('Win_MenuPrincipal'  , 'SetFocus')

	//msginfo('ok22')

	



RETURN

PROCEDURE Proc_ON_P1(wJanela)

	LOCAL Width  := BT_ClientAreaWidth  ( ThisWindow.name )
	LOCAL Height := BT_ClientAreaHeight ( ThisWindow.name )
	LOCAL hDC, BTstruct

	If hBitMap != 0

		If wJanela = 'fSplit3'
			DrawTransp(wJanela , hBitMap4)			
		End If

		If wJanela = 'fSplit4'
			DrawTransp(wJanela , hBitMap5)
		End If


		Return

	End If

	hDC = BT_CreateDC ( ThisWindow.name, BT_HDC_INVALIDCLIENTAREA, @BTstruct )

	BT_DrawGradientFillVertical ( hDC, 0,       0, Width, 15  , { 235, 235, 235 }, {235,235,235}  )

	BT_DeleteDC ( BTstruct )

REturn

Procedure ProcPaintx(wJan)

LOCAL Width  := BT_ClientAreaWidth  ( wJan )
LOCAL Height := BT_ClientAreaHeight ( wJan )
LOCAL BTstruct

Local hDC := BT_CreateDC ( wJan , BT_HDC_INVALIDCLIENTAREA, @BTstruct )

BT_DrawGradientFillVertical ( hDC,   0,       0,  Width,  Height, { 9, 111, 137 }, { 7, 101, 125 })

BT_DeleteDC ( BTstruct )

Return



Function Proc_ON_PAINT(wJanela)

//LOCAL Width  := BT_ClientAreaWidth  ( ThisWindow.name )
//LOCAL Height := BT_ClientAreaHeight ( ThisWindow.name )

	LOCAL Width  := BT_ClientAreaWidth  ( wJanela )
	LOCAL Height := BT_ClientAreaHeight ( wJanela )
	Local nCol

	Local nTypeText    := BT_TEXT_TRANSPARENT + BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

	Local hBitmap_aux2
	Local hBitmap_aux



	LOCAL hDC, BTstruct
	LOCAL Cont := 5


	If hBitMap != 0

		If wJanela = 'fSplit2'          //hbitmap3
			DrawTransp(wJanela , hBitMap3)
		End If

		If wJanela = 'fSplit5'          //hbitmap3
			DrawTransp(wJanela , hBitMap6)
		End If

		Return

	End If
	

	hDC = BT_CreateDC ( wJanela , BT_HDC_INVALIDCLIENTAREA, @BTstruct )



	IF ThisWindow.name = 'fCli'
		cont = 1
	END IF

	IF ThisWindow.name = 'fSplit5'
		cont = 12
	END IF

	IF Left(wJanela,5) = 'WinUp'
		cont = 13
	END IF


	DO CASE
	CASE cont = 1
		BT_DrawGradientFillHorizontal ( hDC, 0,       0, Width / 2, Height, { 213, 226, 234 }, WHITE  )
		BT_DrawGradientFillHorizontal ( hDC, 0, Width / 2, Width / 2, Height, WHITE, { 213, 226, 234 }  )



	CASE cont = 2
		// { 213, 226, 234 }
		BT_DrawGradientFillVertical ( hDC, 0,       0, Width, Height, { 213, 226, 234 }, WHITE  )


	CASE cont = 3
		BT_DrawGradientFillVertical ( hDC,        0,   0, Width, Height / 2, RED,   GREEN )
		BT_DrawGradientFillVertical ( hDC, Height / 2,   0, Width, Height / 2, GREEN, BLUE )

	CASE cont = 4
		BT_DrawGradientFillHorizontal ( hDC, 0,       0, Width / 2, Height, GREEN, BLUE )
		BT_DrawGradientFillHorizontal ( hDC, 0, Width / 2, Width / 2, Height, BLUE,  RED )

	CASE cont = 5

		//BT_DrawGradientFillVertical   ( hDC,   0,       0,  Width,  Height, { 9, 111, 137 },  { 7, 101, 125 } )

		BT_DrawGradientFillVertical   ( hDC,   0,       0,  Width,  Height, { 9, 111, 137 },  BLACK )

	CASE cont = 6
		BT_DrawGradientFillHorizontal ( hDC,   0,       0,  Width,  Height, { 100, 0, 123 }, BLACK )

	CASE cont = 12

		// fSplit5
		BT_DrawGradientFillVertical ( hDC,   0,       0,  Width,  Height, {7,101,125} , {4,57,70} )
		BT_DrawText ( hDC, 05 , 10   ,  "Empresa XYZ....." , "Arial", 9, WHITE,  BLACK, BT_TEXT_TRANSPARENT , nAlingText, nOrientation )

		//{3,39,48} )

	CASE cont = 13

		
		If (alltrim(wJanela) != alltrim(cLblSelected))
			BT_DrawGradientFillVertical ( hDC,   0,       0,  Width,  Height, { 9, 111, 137 }, {9,111,137} )
		Else
			BT_DrawGradientFillVertical ( hDC,   0,       0,  Width,  Height, { 9, 111, 137 }, { 7, 101, 125 })

		End If



	END CASE



	If wJanela = 'fSplit10'

		hBitmap_aux := BT_BitmapLoadFile ("OK24")  // load from resource
        BT_DrawBitmapTransparent (hDC, 7, 10 , 24, 24  , BT_STRETCH , hBitmap_aux, { 7 , 101,125 })
     	BT_BitmapRelease (hBitmap_aux)

	End If 

	


	If wJanela = 'fSplit2'



		hBitmap_aux2 := BT_BitmapLoadFile ("HOME1")  // load from resource
		aBk2 := BT_DrawGetPixel (hDC, 2, 32)
        BT_DrawBitmapTransparent (hDC, 1, 2 , 32, 32   , BT_SCALE , hBitmap_aux2, { 7 , 101,125 } )
     	BT_BitmapRelease (hBitmap_aux2)

	End If 



	BT_DeleteDC ( BTstruct )


RETURN


FUNCTION GetCamposInf( cTabela, cInf  ,cCampo )

	LOCAL oServ   := GetConexao()
	LOCAL aTam    := {}

	LOCAL i := 1

	LOCAL oQuery

	LOCAL cSql  := "Select * from dicionario where tabela = '" + AllTrim( cTabela ) + "' order by Ordem"

	Default cCampo := ''
	


	If !Empty(cCampo)
		cSql  := "Select * from dicionario where tabela = '" + AllTrim( cTabela ) + "' and camposistema = '" + alltrim(cCampo) + "' order by Ordem"
	End If

	oQuery      := oServ:Query( cSql )

	FOR i := 1 TO oQuery:LastRec()

		oRow := oQuery:GetRow( i )

		If Empty(Alltrim(cCampo))
			IF Alltrim(oRow:FieldGet( 6 )) == 'S'				

				IF cInf = 'CABEC'
					AAdd( aTam,   AllTrim( oRow:FieldGet(5 ) )     )
				END IF

				IF cInf = 'CAMPOS'
					AAdd( aTam,  hb_AnsiToOem( AllTrim( oRow:FieldGet(3) )  )   )
				END IF

				IF cInf = 'TAM'
					AAdd( aTam,  oRow:FieldGet( 7 )  )
				END IF

				IF cInf = 'TIPO'
					AAdd( aTam,  oRow:FieldGet( 4 )  )
				END IF
			END IF
		Else

			IF cInf = 'CABEC'
				AAdd( aTam,  hb_AnsiToOem( AllTrim( oRow:FieldGet(5 ) )  )   )
			END IF


			IF cInf = 'SISTEMA'
				AAdd( aTam,  hb_AnsiToOem( AllTrim( oRow:FieldGet(3 ) )  )   )
			END IF

			IF cInf = 'TAM'
				AAdd( aTam,  oRow:FieldGet( 7 )  )
			END IF

			IF cInf = 'TIPO'
				AAdd( aTam,  oRow:FieldGet( 4 )  )
			END IF

			IF cInf = 'MASCARA'
				AAdd( aTam,  oRow:FieldGet( 8 )  )
			END IF

			IF cInf = 'RELACAO'
				AAdd( aTam,  oRow:FieldGet( 11 )  )
			END IF

		End If

	NEXT

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

	IF Len( aTam ) == 0
		yAviso( 'Dicionario de Dados não Localizado para Tabela ' +  cTabela  + '(' + cInf + ')'   + QUEBRA + 'Contacte Suporte.' ,, .f.  )
	END IF

RETURN aTam


FUNCTION QuotedStr( cVar )
Return Chr( 39 ) + cVar + Chr( 39 )


FUNCTION ExecSql( oSrv1, cSql )

	LOCAL oQry := oSrv1:Query( cSql )
	LOCAL cText := hb_MemoRead( cSqlLog )

	IF  oSrv1:NetErr()
		//SetCursorOnControls( IDC_ARROW )
		MsgStop( 'Erro ao Executar Consulta -> ' + Chr( 13 ) + Chr( 10 ) + oQry:Error() )
		hb_MemoWrit( cSqlLog, cUserName + '  ' + Time() + ' --> ' + cText + Chr( 13 ) + Chr( 10 ) + cUserName +  ' ' + DToC( Date() ) + ' ' + Time() + '  ' + oQry:Error() )
		oQry := Nil
		oQry:Destroy()
	END IF

RETURN oQry


FUNCTION ConvDt( dDt1 )

	LOCAL d1 := Right( DToC( dDt1 ), 4 ) + '-' + SubStr( DToC( dDt1 ), 4, 2 ) + "-" + Left( DToC( dDt1 ), 2 )

	If Empty( Right( DToC( dDt1 ), 4 )   )
		d1 := '0000-00-00'
	End If

RETURN d1

FUNCTION RetSql( cSql )

	LOCAL oServ   := GetConexao()
	LOCAL oRow
	LOCAL oQuery
	LOCAL cDesc := ''

	oQuery := oServ:Query( cSql )

	//hb_memowrit('cons13.txt',cSql)

	IF oServ:NetErr()

		yAviso( "Error ao Executar a Consulta : " + cSql + " : " + QUEBRA + oServ:Error()  , .f. )

		oQuery:Destroy()
		oQuery := Nil

		oServ:Destroy( 0 )
		oServ := Nil

		Return ''

	ENDIF

	If oQuery:LastRec() > 0
		oRow := oQuery:GetRow( 1 )
		cDesc := oRow:FieldGet( 1 )
	End If

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

RETURN hb_ansiToOem(cDesc)


FUNCTION GetCampo( oRow1, cCampo )
RETURN ( oRow1:FieldGet(  oRow1:FieldPos(cCampo ) ) )

FUNCTION GetJoinTab( cTabela )

	LOCAL cJoin := ''

	IF cTabela = 'produtos'
		cJoin += " a inner join unidade b on b.id = a.id_unidade "
		cJoin += " inner join grupo c on c.id = a.id_grupo "
		cJoin += " inner join fornecedores d on d.id = a.id_fornecedor "
	END IF

	IF cTabela = 'movacertos'
		cJoin += " a left join produtos b on b.id = a.idprod "
		cJoin += "left join local c on c.id = a.idlocal "
		cJoin += "left join eventos d on d.id = a.idevento"
	END IF

	IF cTabela = 'colaborador'
		cJoin := " b inner join funcao a on a.id = id_funcao "
	END IF

	IF cTabela = 'Pedidos'
		cJoin := " left join clientes a on a.id = idcliente "
		cJoin += "left join vendedores b on b.id = idvendedor "
		cJoin += "left join condpgto d on d.id = idcondpg "
		cJoin += "left join local e on e.id = idlocal "
	END IF

RETURN cJoin



FUNCTION rTrans( cPar1 )

	LOCAL cRet := ''

	FOR nz := 1 TO Len( cPar1 )

		cLt := SubStr( cPar1, nz, 1 )

		IF ( cLt $ "0123456789." )
			cRet += cLt
		END IF

	NEXT

	// msginfo(' RTRans   ' + cRet )

RETURN Val( cRet )

FUNCTION GetTableId( cTabela, cValor )

	LOCAL cSql    := "select codigo from " + cTabela + " where descricao = '" + AllTrim(Hb_OemToAnsi( cValor) ) + "' and Status = 'Normal'"
	LOCAL oServ   := GetConexao()
	LOCAL oRow
	LOCAL nId := ''

	//hb_memowrit('tab1.txt' , csql )

	oQuery := oServ:Query( cSql )


	IF oQuery:LastRec() > 0
		oRow := oQuery:GetRow( 1 )
		nId := oRow:FieldGet( 1 )
	END IF

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

RETURN nId

FUNCTION GetId( cTabela, cValor )

	LOCAL cSql    := "select id from " + cTabela + " where descricao = '" + AllTrim(Hb_OemToAnsi( cValor) ) + "' and Status = 'Ativo'"
	LOCAL oServ   := GetConexao()
	LOCAL oRow
	LOCAL nId := ''

	//hb_memowrit('tab1.txt' , csql )

	oQuery := oServ:Query( cSql )


	IF oQuery:LastRec() > 0
		oRow := oQuery:GetRow( 1 )
		nId := oRow:FieldGet( 1 )
	END IF

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

RETURN nId

FUNCTION GetIdValor( cTabela, nId )

	LOCAL cSql    := "select descricao from " + cTabela + " where id = " + AllTrim( Str(  nId ) ) + " and Status = 'Ativo'"
	LOCAL oServ   := GetConexao()
	LOCAL oRow

	// Local nId := 0
	LOCAL cDesc := ''
	LOCAL oQuery

	oQuery := oServ:Query( cSql )

	IF oQuery:LastRec() > 0
		oRow := oQuery:GetRow( 1 )
		cDesc := oRow:FieldGet( 1 )
	END IF

	oQuery:Destroy()
	oQuery := Nil

	oServ:Destroy( 0 )
	oServ := Nil

RETURN cDesc

Function xCaptJan(cJanela)

	Local n1 := 100
	Local n2 := 50

	Local Ywidth := 0
	Local YHeight := 0

	If _isWindowDefined(cJanela)

		CaptTelas()

		Ywidth := GetProperty(cJanela , "Width")
		YHeight := GetProperty(cJanela , "Height")


		hBit2 := BT_BitmapCaptureWindow (cJanela , 0 , 0 , yWidth , nDeskTopHeight)

		BT_BitmapSaveFile (hBit2  , "hBit2.bmp")

	Else
		Return
	End If


Return

Function Grayness_effect_start(  cJanela  )

	Local n1 := 100
	Local n2 := 50


	Local Ywidth := 0
	Local YHeight := 0


	If _isWindowDefined(cJanela)
		Ywidth := GetProperty(cJanela , "Width")
		YHeight := GetProperty(cJanela , "Height")
	Else
		Return
	End If

	Default cJanela := ''

	lApaga := .t.

	YHeight := nDeskTopHeight - 68
	hBitmapDes := 0

	lTelaToda := .f.

	If cJanela = 'Main'

		hBitMain := BT_BitmapCaptureWindow (cJanela , 25 , 1 , yWidth, nDeskTopHeight)
		//msginfo( ' d ' + cJanela )

	Else

		hBit2 := BT_BitmapCaptureWindow ( cJanela , 0 , 0 , yWidth, nDeskTopHeight)
		lTelaToda := .t.

	End If


	lDrawMain := .f.

	If Alltrim(cJanela) == 'Main'
	    DoMethod("fSplit6","Hide")
		DoMethod("fSplit2","Hide")
		DoMethod("fSplit3","Hide")
		DoMethod("fSplit4","Hide")
		DoMethod("fSplit5","Hide")
		DoMethod("fSplit10","Hide")
		BT_BitmapSaveFile (hBitMain  , "hBit2.bmp")
		lDrawMain := .t.
	Else
		BT_BitmapSaveFile (hBit2  , "hBit2.bmp")
		hBitMain  := hBit2
	End If


	If (_isWindowDefined( cActiveJan )  ) .And. ( Alltrim(cActiveJan) != "Main")
		DoMethod(cActiveJan , "Hide" )
	//SysWait(.1)
		HideMain()
	End If



//sysWait(.1)
	BT_ClientAreaInvalidateAll ('Main')


Return

Function HideMain()

	DoMethod("fSplit6","Hide")
	DoMethod("fSplit3","Hide")
	DoMethod("fSplit4","Hide")


Return

Function ShowMain()

	DoMethod("fSplit6","Show")
	DoMethod("fSplit3","Show")
	DoMethod("fSplit4","Show")


Return



Function Grayness_effect_end(cJanela1)

	//Local hWnd := GetFormHandle( cJanela1 )

	Local n1 := 0

	//msginfo(cJanela1)

	lApaga := .f.

	hBitmap := 0
	hBitmap2 := 0
	hBitmap3 := 0
	hBitmap4 := 0
	hBitmap5 := 0



	hBitmap6 := 0


	Flag_AlphaBlend_Effect := .f.

	BT_ClientAreaInvalidateAll ('Main')

	hBitMain  := 0



	If (Alltrim(cActiveJan) == "Main")
	DoMethod("fSplit6","Show")
DoMethod("fSplit2","Show")
DoMethod("fSplit10","Show")
DoMethod("fSplit3","Show")
DoMethod("fSplit4","Show")
DoMethod("fSplit5","Show")
Else



DoMethod("fSplit6","Show")
DoMethod("fSplit10","Show")
DoMethod("fSplit3","Show")
DoMethod("fSplit4","Show")
DoMethod("fSplit5","Show")


If _isWindowDefined( cActiveJan )
DoMethod(cActiveJan , "Show" )
End If

// BT_ClientAreaInvalidateAll ('Main')
BT_ClientAreaInvalidateAll ('fSplit2')
BT_ClientAreaInvalidateAll ('fSplit5')
BT_ClientAreaInvalidateAll ('fSplit10')

End If

lAtivaBlack := .f.

// SysWait(.1)
// BT_SCR_INVALIDATERECT( ListView_GetHeader(GetControlHandle( 'br_grid', cActiveJan )) , Nil , .t. )



RETURN

function SetWindowControlsEnable(cForm , lEnabled)

	Local aControlList := {}
	Local i        := 0
	Local cCompo   := ''
	Local aM1      := {}
	Local lVisi2 := .f.
	Local nIndice := 0
	Local lEnab := .f.


	//sysWait(.1)


	For i := 1 to Len(_HMG_SYSDATA[4])
		If _HMG_SYSDATA[4,i] == GetFormHandle(cForm)
			If len(alltrim(_HMG_SYSDATA [  2,i])) > 0

				lEnab := GetProperty( cForm , _HMG_SYSDATA [  2,i] , "Enabled"  )

				If lEnab
					Setproperty( cForm , _HMG_SYSDATA [  2,i] , "Enabled" , lEnabled )
				End If


			End If
		End If
	Next i

	hb_memowrit('compo125.txt' , cCompo)


Return aM1




function SetWindowControlsVisible(cForm , lVisible , aMVisible , lShow  )

	Local aControlList := {}
	Local i        := 0
	Local cCompo   := ''
	Local aM1      := {}
	Local lVisi2 := .f.
	Local nIndice := 0

	Default aMVisible := {}
	Default lShow     := .f. 


	//sysWait(.1)


	For i := 1 to Len(_HMG_SYSDATA[4])
		If _HMG_SYSDATA[4,i] == GetFormHandle(cForm)
			If len(alltrim(_HMG_SYSDATA [  2,i])) > 0

				lVisi2 := GetProperty( cForm , _HMG_SYSDATA [  2,i] , "Visible"  )

				If lVisible

					nIndice := Ascan( aMVisible , {|a,b| (a[1] == cForm) .And. (a[2] == _HMG_SYSDATA [  2,i] )  }  )

					If (Len(aMVisible) > 0) .And. (nIndice > 0)
						Setproperty( cForm , _HMG_SYSDATA [  2,i] , "Visible" , aMVisible[nIndice][3] )

						If (lShow) .And. (aMVisible[nIndice][3] )
							DoMethod( cForm ,   _HMG_SYSDATA [  2,i] , "Show" )
						End If 

					End If

				Else
					Aadd(aM1 , {   cForm , _HMG_SYSDATA [  2,i],  lVisi2 } )
					Setproperty( cForm , _HMG_SYSDATA [  2,i] , "Visible" , lVisible )
				End If

				cCompo += (cForm + ' ' +  _HMG_SYSDATA [  2,i] )  + QUEBRA

			End If
		End If
	Next i

	hb_memowrit('compo1.txt' , cCompo)



Return aM1
//aclone(aControlList)



Function RefreshAll(cForm)

	Local aControlList := {}
	Local i := 0
	//Local cform := 'fClien'
	Local cTxt1 := ''
	Local nHan := 0



	If (Empty(cForm)) .or. (cForm == Nil)
		Return
	End If

	For i := 1 to len(_HMG_SYSDATA[4])
		If _HMG_SYSDATA[4,i] == GetFormHandle(cForm)
			If len(alltrim(_HMG_SYSDATA [  2,i])) > 0
				nHan := GetControlHandle(_HMG_SYSDATA [  2,i]   , cForm)
				if nHan != 0
					cTxt1 += ( Procname(1) + ' ' + cForm +  ' ' +  _HMG_SYSDATA [  2,i]  + Chr(13)+Chr(10) )

					PostMessage( nHan   , WM_MOUSEMOVE , 0, 0)

					PostMessage( nHan   , WM_MOUSELEAVE , 0, 0)



				End If
			End If
		End If
	Next i


	ShowWindow( GetFormHandle(cForm))
	
	SysWait(.3)
	

	//SaveLog( 'Janelas2.txt', cTxt1)


Return Nil


**********************************************************************
Function GetControls( cForm )
	Local hWnd := GetFormHandle( cForm )
	Local aControls := {}		//List of controls {ControlType, ControlName}
	AEVAL( _HMG_SYSDATA[ 4 ], { | hCtrWnd, nPos | IF( hCtrWnd == hWnd, AADD( aControls , { _HMG_SYSDATA[ 1, nPos ], _HMG_SYSDATA[ 2, nPos ] }), Nil ) } )

	MsgDebug( 'List of controls', aControls)

Return aControls


Function SysWait(nWait)

	Local iTime := Seconds()
	Local ntim := 0

	DEFAULT nWait := .1

	Do While Seconds() - iTime < nWait
		ntim++
		DO EVENTS
		//SaveLog( 'Syswait.txt' ,  " SysWait " + Str(nTim) )
	EndDo

Return


FUNCTION ReleaseButton(cForm, nID)

	IF OBTN_Handle(cForm, nID) == 0
		MsgBox("Button does not exist!")
	ELSE
		OBTN_Release(cForm, nID)
	ENDIF

RETURN NIL




Function xSqlUpdate(cTabela , aValores ,aCamposF , cChave )

	//   Local cSql := "select * from " + alltrim(cTabela)
	Local cAlias := 'Tmp'
	Local cSql2
	Local cValues := ''
	// Local nId     := GetReg(cTabela)+1
	//Local cSql1
	Local cSqlx1 := ''
	Local cSQl := "Select * from " + cTabela + " Where 1 = 2 "

	Local n1 := 0
	Local n2 := 0

	Default aCamposF := {}

	dbUseArea( .T.,,  cSql, cAlias )
	dbSelectArea( cAlias )
	dbGoTop()

	cSql2 := 'Update ' + cTabela + ' set '

	For n1 := 1 To FCount()

		If (Len(aCamposf) > 0)
			If Ascan(aCamposF,   lower(Alltrim(Fieldname(n1)))  ) == 0
				n2++
				cSql2+= Alltrim(Fieldname(n1))  +' = ' + aValores[n2]+","
			End If
		Else
			n2++
			cSql2+= Alltrim(Fieldname(n1))  +' = ' + aValores[n2]+","
		End If

	Next

	cSql1 := Left(cSql2,Len(cSql2) - 1 ) + " Where " + cChave

	dbSelectArea( cAlias )
	Use


Return cSql1



Function xSqlInsert(cTabela , aValores ,aCamposF )

	//   Local cSql := "select * from " + alltrim(cTabela)
	Local cAlias := 'Tmp'
	Local cSql2
	Local cValues := ''
	// Local nId     := GetReg(cTabela)+1
	//Local cSql1
	Local cSqlx1 := ''
	Local cSQl := "Select * from " + cTabela + " Where 1 = 2 "

	Local n2 := 0

	Default aCamposF := {}

	dbUseArea( .T.,,  cSql, cAlias )
	dbSelectArea( cAlias )
	dbGoTop()

	cSql2 := 'insert into ' + cTabela + '('

	For n1 := 1 To FCount()

		If (Len(aCamposf) > 0)
			If Ascan(aCamposF,   lower(Alltrim(Fieldname(n1)))  ) == 0

				cSql2+=( Alltrim(Fieldname(n1))  +',' )
				n2++
				cValues += aValores[n2]+","

			End If
		Else

			cSql2+=( Alltrim(Fieldname(n1))  +',' )
			n2++
			cValues += aValores[n2]+","

		End If
	Next

	cSql1 := Left(cSql2,Len(cSql2) - 1 ) + ") Values (" + Left(cValues,Len(cValues) - 1 ) + ")"

	dbSelectArea( cAlias )
	Use

	cSqlx1 := cSql1 + ") Values (" + Left(cValues,Len(cValues) - 1 )  + ")"

REturn cSql1



Function yEfect(cFormName , lEfect)

	LOCAL cControl := ''
	LOCAL cForm    := ''
	//LOCAL cFormName := ''
	Local cSave1    := cDiaName
	Local yWidth
	Local YHeight
	Local aZ1 := {}
	Local cMenuName := 'fMenu' + Right(cFormName,5)


	If _isWindowDefined(cActiveJan)
		Ywidth := GetProperty(cActiveJan , "Width")
		YHeight := GetProperty(cActiveJan , "Height")
	End If

	Default lEfect := .t.

	cDiaName := 'fProgress'




	//GetFormNameByHandle ( GetActiveWindow(), @cFormName )

	lAtivaBlack := (Alltrim(cFormName) != "Main" )

	BT_BitmapRelease (hBit10)
	BT_BitmapRelease (hBit11)
	BT_BitmapRelease (hBit12)
	BT_BitmapRelease (hBit20)

	//CaptTelas()

	

	If (lEfect)

		Flag_AlphaBlend_Effect := .T.

		
		If _isWindowDefined(cMenuName)
			DoMethod( cMenuName , 'Hide')
		End If 

		

		hBit11 := BT_BitmapCaptureWindow ('fSplit2' , 0 , 0 , fSplit2.Width , fSplit2.Height)
		hBit12 := BT_BitmapCaptureWindow ('fSplit10' , 0 , 0 , fSplit10.Width , fSplit10.Height)

		//bt_BitMapSaveFile(  hBit11 , 'Buit11.bmp'  )

		DoMethod("fSplit6","Hide")


		//DoMethod("fSplit2","Hide")




		DoMethod("fSplit3","Hide")
		DoMethod("fSplit4","Hide")
		DoMethod("fSplit5","Hide")

		//DoMethod("fSplit10","Hide")

		DoMethod('Win_MenuPrincipal' , 'Hide')

		If cFormName = 'Main'


			DoMethod("fSplit2","Hide")
			DoMethod("fSplit10","Hide")

			hBitMain := BT_BitmapCaptureDesktop ( 25 , 1 , yWidth, nDeskTopHeight)
								

			If _IsWindowDefined( "Win_Menu1")
			    DoMethod( "Win_Menu1" , "Hide"  )
			End If 

			If _IsWindowDefined( "Win_Scroll1")
			    DoMethod( "Win_Scroll1" , "Hide"  )
			End If 
	
		Else
	
			hBit2 := BT_BitmapCaptureWindow ( cActiveJan , 0 , 0 , yWidth, nDeskTopHeight)
	
		End If
		

		aZ1 := SetWindowControlsVisible(  cActiveJan , .f. )		


		If _isWindowDefined( 'fTop1' + Right(cActiveJan,5) )
			DoMethod( 'fTop1' + Right(cActiveJan,5) , 'Hide')
		End If

		If _isWindowDefined( 'fSplit2' )			
			SetWindowControlsVisible(  'fSplit2' , .f. )	
		End If


		lAtivaBlack := .t.				
		BT_ClientAreaInvalidateAll ( cActiveJan  )		
		BT_ClientAreaInvalidateAll ( 'fSplit2'  )
		BT_ClientAreaInvalidateAll ( 'fSplit10'  )	
		
		
	Else
		lativaBlack := .f.
	End If

REturn aZ1 



Function EfectEnd(cFname1 , aMtr1 )

	Local lEfect := .t.
	Local cMenuName := 'fMenu' + Right(cFname1,5)

	If (lEfect)
		
		
		hBitmap := 0
		hBitmap2 := 0
		hBitmap3 := 0
		hBitmap4 := 0
		hBitmap5 := 0


		hBitmap6 := 0

		Flag_AlphaBlend_Effect := .f.
		lAtivaBlack := .f.				
	

		// If _isWindowDefined( 'fSplit2' )	
		// 	ShowButTop( .t. )			
		// 	SetWindowControlsVisible(  'fSplit2' , .t. )
		// 	DoMethod( 'fsplit2' , "Show" )
		// End If

		
		If _isWindowDefined( cActiveJan )
			
		End If



		hBitMain  := 0	

		
		If _isWindowDefined( 'fTop1' + Right(cActiveJan,5) )
			DoMethod( 'fTop1' + Right(cActiveJan,5) , 'Show')
		End If



		SetWindowControlsVisible(  cActiveJan , .t.  ,  aMtr1 , .t. )	

		BT_ClientAreaInvalidateAll ( cActiveJan )
		BT_ClientAreaInvalidateAll ('Main')

		
		If _isWindowDefined(cMenuName)
			DoMethod( cMenuName , 'Show')
		End If 

		
		If (Alltrim(cActiveJan) == "Main")

			DoMethod("fSplit6","Show")
			DoMethod("fSplit2","Show")
			DoMethod("fSplit10","Show")
			DoMethod("fSplit3","Show")
			DoMethod("fSplit4","Show")
			DoMethod("fSplit5","Show")


			DoMethod('Win_MenuPrincipal' , 'Show')

			If _IsWindowDefined( "Win_Menu1")
			    DoMethod( "Win_Menu1" , "Show"  )
			End If 

			If _IsWindowDefined( "Win_Scroll1")
			    DoMethod( "Win_Scroll1" , "Show"  )
			End If 

		End If 	


		Syswait(.1)
		lInvalid := .f.	



		If _isWindowDefined( cMenuName)
			DoMethod(cMenuName , 'Hide')
        End If 


		If _isControlDefined(    'br_grid', cActiveJan   )
			PostMessage(   GetControlHandle( 'br_grid', cActiveJan ) , WM_LBUTTONUP,0,0)
		End If 


	End If

	lAtivaBlack := .f.

Return



Procedure RefreshBrowseLine( cForm, cBrowse, p_cUpDtCol )

	Local i
	Local nRow
	Local xValue
	Local aStruct	//  array of FIELD names

	p_cUpDtCol := iif( p_cUpDtCol == NIL, NIL, upper( p_cUpDtCol ) )

	h		:= GetControlHandle ( cBrowse, cForm )
	nRow	:= ListView_GetFirstItem ( h )	// Returns the BROWSE's current row number
	aStruct := DBStruct()

	For  i := 1 to  len( aStruct )	// The number of fields in this record
		If ( p_cUpDtCol != Nil ) .AND. ( ! ( p_cUpDtCol == aStruct[ i,1 ] ) )
			loop	//	If not NIL then only field p_cUpDtCol
		End If
		xValue := &( aStruct[ i,1 ] )
		If ( valtype( xValue ) == "N" )
			xValue := hb_ntos( xValue )
		End If
		SetProperty( cForm, cBrowse, "CELL", nRow, i, xValue )
	Next i

Return 

**********************************************************
Function SetAndDoEvent( cWindow, cControl, cEventName, bNewProc, lDoEvent )

	LOCAL nIndex:=GetControlIndex( cControl, cWindow )
	LOCAL nEvent:= 0	

	Default lDoEvent := .F.

	If  !hb_IsLogical ( lDoEvent )
		lDoEvent := .F.
	End If 

	If nIndex =0
		RETURN Nil
	End If 

	DO CASE
		CASE Upper(cEventName) = "ONCHANGE"
			nEvent := 12
		CASE Upper(cEventName) = "ONLOSTFOCUS"
			nEvent := 10
		CASE Upper(cEventName) = "ONGOTFOCUS"
			nEvent := 11
		CASE Upper(cEventName) = "ONENTER" .AND. ( _HMG_SYSDATA [ 1 ][ nIndex ] == "NUMTEXT" .OR. _HMG_SYSDATA [ 1 ][ nIndex ] == "TEXT") 	//textbox
			nEvent := 16
		CASE Upper(cEventName) = "ONENTER" .OR. Upper(cEventName) = "ACTION" .OR. Upper(cEventName) = "ONDISPLAYCHANGE"		//other controls
			nEvent := 6
	ENDCASE

	If nEvent > 0
		If bNewProc <> Nil .AND. hb_IsBlock ( bNewProc )
			_HMG_SYSDATA [ nEvent ][nIndex] := bNewProc		//set new event procedure
		End If 
		If lDoEvent
			_DoControlEventProcedure( _HMG_SYSDATA [ nEvent ][nIndex], nIndex )	//do event procedure
		End If 
	End If 


Return Nil



