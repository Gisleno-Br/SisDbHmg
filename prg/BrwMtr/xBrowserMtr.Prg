
#include <hmg.ch>
#include "inkey.ch"
#include <minigui.ch>
#require "hbxpp"
#include <hmg.ch>
#include <dll.ch>
#include "hbthread.ch"
#define XQUEBRA Chr(13)+Chr(10)




#define FONTCOR   {102,102,102}
#define CORBROWSE {241,241,241}
#define SELCOR    {28,157,189}

//{217,255,255}



#define SB_HORZ             0
#define NM_CLICK            ( -2 )
#define BS_DEFPUSHBUTTON    1
#define BM_SETSTYLE         244
#define SB_CTL              2
#define SB_VERT             1
#define SB_LINEUP           0
#define SB_LINEDOWN         1
#define SB_LINELEFT         0
#define SB_LINERIGHT        1
#define SB_PAGEUP           2
#define SB_PAGEDOWN         3
#define SB_PAGELEFT         2
#define SB_PAGERIGHT        3
#define SB_THUMBPOSITION    4
#define SB_THUMBTRACK       5
#define SB_ENDSCROLL        8
#define SB_LEFT             6
#define SB_RIGHT            7
#define SB_BOTTOM           7
#define SB_TOP              6

#define WM_VSCROLL          0x0115





Static nLArgura := 0
Static aMt1 := {}
Static aOpx1 := 0
Static lHitB := .f.
Static lHitT := .f.
Static nPercent := 0
Static aThread2 := Nil
Static aMResult := {}
Static cAndamento := ''
Static nTamPag := 35
Static nItemBrwHeight := 0
Static nItemx5 := 1
Static nClearIt2 := 1
Static cOpMainSel  := ''
Static nPageNumber := 1
Static hBitOk
Static cBrowserName := ''
Static cEspelhoBrw := ''
Static cBarraVfrm := ''

Static cBarraVSombra := ''
Static nColLeft := 0

Static nQTotCol := 0

Static aMDisplay := {}

Static lScrool1 := .f. 

Static nAcumTot2 := 0

Static cJanObj := ''




Static cHeaderName  := ''
Static cHSombraName := ''

Static nQEtp := 0




Static nSelLine := 1
Static nIndexEventZ := 0
Static lTermino := .f.
Static nModeBrw := 1
Static lFundo := .t.
Static lFlagPaint := .t.
Static nLimteLin := 0
Static lColor1 := .f.
Static aMtrColor := {}
Static nLinScrool := 0
Static nItemScrool := 0
Static nSave1 := 0
Static aMVisible := {}
Static nLinhaBarra := 1
Static nColScrool := 0

Static nLargTotal := 0
Static lNoHorzScr := .f.
Static nPageTotal := 0
Static lControlOk := .f. 
Static lTracking135 := .f.
Static lTracking75 := .f.
Static lTracking45 := .f.
Static nHasFocus := 0

Static lKeyPressed := .f.

Static nQtCol := 0

Static nLargX := 0

Static cBarrah := ''

Static lHasHeader := .f. 

Static nColH1 := 0

Static nColEsquerda := 1

Static nPageNum := 0

Static lAtivo1 := .t. 

Static aCabec1 := {}
Static aTams2  := {}
Static aTips   := {}

//DECLARE WINDOW Win_Browser





Function yRetLargura( aMatriz1 )
	  Local nLarg := 0

	  Aeval(   aMatriz1 , { |a| nLarg += (a * GetTextoTam( ' '  , cActiveJan ))  }  )

REturn nLarg


Function xRetTamPg()
Return nTamPag


//Function DoMatriz( cParentx , cTabela )

	//aThread2 := hb_threadStart( HB_THREAD_INHERIT_PUBLIC, @TestBrow(),  cParentx , cTabela  )

//REturn (TestBrow(  cParentx , cTabela  ))



/*
Function TestBrow( cParent1 , cTabx  )


	Local cSqlx1 := ''
	Local n1 := 1
	Local aCampos
	//Local aCabec  := GetCamposDic( cTabela, 'S' , .f. , .t. )

	LOCAL aCabec
	Local nTam := 0
	Local aTams
	Local aTips
	LOCAL nQReg
	Local qReg1   := 200
	Local calias  := "TMP"
	local cTab1
	local aCabex:={}
	Local cTabela := cTabx
	Local nIndx1 := 0
	Local oQuery
	LOCAL lBold      := .F.
	LOCAL lItalic    := .F.
	LOCAL lUnderline := .F.
	LOCAL lStrikeOut := .F.
	Local aDynfont   := {}
	Local nColy
	Local lAtivo := .f.
	Local am1 := {}
	Local cGridname := 'Br_grid'
	Local bGrid1 := {}
	Local bGrid2 := {}
	Local nW1
	Local aItens := {}
	Local oServer
	Local nTamLargura := 0
	Local nTam1 := GetTextoTam( ' '  , cParent1 )
	Local cLabelx := 'Lblx01'
	Local nPagNum := 1
	Local i
	Local nX1
	Local nCont5 := 0

	Local aResults := { }
	Local aRes2    := {}






	aMtrHeader := {}
	aCampos  := GetCamposDic( cTabela, 'S' , .t. , .t. )
	//Local aCabec  := GetCamposDic( cTabela, 'S' , .f. , .t. )

	aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )
	aTams   := GetCamposInf( cTabela, 'TAM' )
	aTips   := GetCamposInf( cTabela, 'TIPO' )
	nQReg   := GetReg( cTabela )

	csq2:=''

	cFiltro1 := ''


	If !Empty(cFiltro1)
		cSq2 := GetSql( cTabela  , .f. )  + ' Where ' + cFiltro1

	Else
		cSq2 := GetSql( cTabela  , .f. )
	End If

	cSq2 += " order by codigo limit 125"

	

	If (Select(calias) > 0)
		dbSelectArea( cAlias )
		Use
	End If


	cSqlx2 := cSqlx1
	SaveLog("st121.txt" , cSq2  )

	//msginfo( cSq2 )

	aItens := {}



	nF1 := {|| ARRAY FONT "Arial"   SIZE 9 }
	nF1 := {|| ARRAY FONT "Arial"   SIZE 9 BOLD}
	aDynFont := {}
	oServer := GetConexao()
	oQuery := oServer:Query(  cSq2 )

	If oServer:NetErr()
		yAviso( "Error executing Query " + QUEBRA + cSq2 + " : " + QUEBRA + oServer:Error()  , .f. )
		Return .f.
	End If


	oQuery:LastRec()


	If (oQuery:Lastrec()  == 0 )
		yAviso( 'Este Cadastro Não Possui Registros' , .f. )
	End If

	//While !Eof()

	FOR i := 1 TO oQuery:LastRec()

		aM1 	 := {}
		aDynFont := {}
		oRow := oQuery:GetRow( i )
		lAtivo := .t.

		aResults := {}
		aRes2	 := {}

		For nx1 := 1 To Len(oRow[1])

			//cValor := Hb_AnsiToOem( oRow:FieldGet(nx1)  )
			cValor := ''

			If (Alltrim(aTips[nx1]) == 'C')
				cValor := oRow:FieldGet(nx1)
			End If


			If  Alltrim(aTips[nx1]) == 'D'
				cValor := Padl(oRow:FieldGet(nx1) ,10)
			End If

			lNum := .f.

			If Alltrim(aTips[nx1]) == 'B'
				cValor := alltrim(Transform( oRow:FieldGet(nx1) , "999,999,999.99" ))
				lNum := .t.
			End If

			If ( Alltrim(aTips[nx1]) == 'I')
				If (nX1 > 1)
					cValor := alltrim( Str( oRow:FieldGet(nx1) ))
					lNum := .t.
				Else
					cValor := Alltrim( Str( oRow:FieldGet(nx1) ) )
				End If
			End If
			If (Alltrim(cValor) = 'Inativo')
				lAtivo := .f.
			End If



			nQAcento := QtAcento(cValor)			
			nTam := If( (nQAcento =  0)   , aTams[nx1] ,  aTams[nx1] + nQAcento )

			If ( Alltrim(aTips[nx1]) = 'C') //.or. ( Alltrim(aTips[nx1]) = 'D')

				Aadd(aM1 , { Padr( (cValor) ,nTam , " " )  ,  nTam          }  )
				Aadd(aResults , {   Padr( (cValor) ,nTam , " " )  ,    oRow:FieldName(nx1)  , nx1  , nTam  }   )
				Aadd(aRes2 ,  oRow:FieldGet(nx1)  )

			Else

				Aadd(aM1 , { Padl( (cValor) ,nTam , " ")  ,  nTam          }  )
				Aadd(aResults , {   Padl( (cValor) ,nTam , " " )  ,    oRow:FieldName(nx1)  , nx1  , nTam }   )
				Aadd(aRes2 , oRow:FieldGet(nx1) )

			End If		

			Do Events
			

		Next


		c1 := ''
		Aeval(aM1 , { |a|  c1 += ( a[1] + ' '  )     })
		c1 += " "

		If (nTamLargura == 0)
			Aeval(aM1 , { |a|    nTamLargura += (a[2]+1)   })
			nLargura := (nTamLargura * nTam1)
		End If
		cAndamento := 'Andamento : '  + Alltrim(Str(I)) + "/" + Alltrim(Str(   oQuery:LastRec() ))
		nCont5++

		If nCont5 > nTamPag
			nPagNum++
			nCont5 := 1
		End If 


		Aadd(aItens , { c1 , lAtivo , nPagNum  , aResults , '' , aRes2}  )
		
	Next


	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

	aMResult := Aclone(aItens)
	lTermino := .t.


Return aItens

*/

Static Function EncheMVis( nRec , lFrente , z2   )


	Local N1 := 1
	Local nAcum := nRec
	Local z1 := nTamPag

	DEFAULT z2 := nTamPag 	
	Default lFrente := .f.
	
	aMVisible := {}		


	If !lFrente
		For n1 := 1 to z2
			//nTamPag
			Aadd(aMVisible  , {    z1  ,   nAcum         })
			z1--
			nAcum--
		Next
	Else
		For n1 := 1 to z2
			//nTamPag
			Aadd(aMVisible  , {    n1  ,   nAcum         })
			nAcum++
		Next
	End If


Return


Function xRetItem( aMatriz )

	Local c1 := ''
	Local cV1 := ''
	Local n1 := 0
	Local nTam := 0
	Local lNum := .f. 

	For n1 := 1 To Len( aCabec1 )

		If aTips[n1] == 'C'

			nQAcento := QtAcento(aMatriz[n1])			
			nTam := If( (nQAcento =  0)   , aTams2[n1] ,  aTams2[n1] + nQAcento )

		 	cV1 := Padr( aMatriz[n1] , nTam )

		End If 	 

		If aTips[n1] == 'D'
			cV1 := Padl( Alltrim(aMatriz[n1])  ,10)
		End If

		lNum := .f.

		If aTips[n1] == 'B'
			cV1 := alltrim(Transform(aMatriz[n1] , "999,999,999.99" ))
			lNum := .t.
		End If

		If ( Alltrim(aTips[n1]) == 'I')
			If (n1 > 1)
				cV1 := alltrim( Str(   aMatriz[n1]   ))
				lNum := .t.
			Else
				cV1 := Alltrim( Str( aMatriz[n1]  ) )
			End If
		End If

		c1 += (cV1 + ' ')

	Next 	

Return (c1)	


Function xBrowserMtr( nRowIni ,  aDatas1 , cParent   , nLarg1  , cBrwName , nCol  , aCabecalho , aTamanhos , aTipos , lDicionario , lEnabled1 , nAltura1 )


	Local nTamWidth := yRetLargura(  aTamanhos  )
	Local nTam1 := GetTextoTam( ' '  , cParent )
	Local nIndex22
	Private aOpx1 := 0
	DEFAULT nLarg1  := GetDeskTopWidth() - 40
	DEFAULT nCol := 10
	DEFAULT nRowIni   := 145
	//145
	DEFAULT aCabecalho := {}
	DEFAULT lDicionario := .t. 
	DEFAULT lEnabled1   := .t.

	nItemBrwHeight := nItemSubHeight - 5


	nTamPag := Int(  nAltura1 / nItemBrwHeight   ) 

	nPageTotal := Int(   Len(aDatas1)  / nTamPag  ) + 1

	
	//msginfo(  Str( nTamPag  )  )


	
	aCabec1 := Aclone(aCabecalho)
    aTams2  := Aclone(aTamanhos)
	aTips   := AClone( aTipos)


	lAtivo1 := lEnabled1

	cJanObj := cParent 



	nLargx := nLarg1 

	nQtCol := Len(aCabecalho)

	aMt1      := Aclone(aDatas1)
	nMaxItem1 := Len(aDatas1)
	nItemBrwHeight := nItemSubHeight - 5
	nItemScrool := 0
	nLargTotal := nTamWidth
	lNoHorzScr := .f.
	hBitOk 	   := BT_BitmapLoadFile ('OKMARK')


	EncheMVis( nTamPag  , .f.  )


	cBrowserName  := cBrwName
	//'Win_Browser'
	cEspelhoBrw   := 'Win_Ert1' + Left(cBrowserName,4)
	cBarraVfrm 	  := 'Win_R1' +  Left(cBrowserName,4)
	cBarraVSombra := 'Win_Resp' +  Left(cBrowserName,4)


	cHeaderName := 'Win_HeadMtr' + Left(cBrowserName,4)
	nQEtp := 0
	
	
/*
	If Len(aDatas1) > 0 
		nLArg1 := (Len( aDatas1[1][1]) * nTam1)+18
		If (nLarg1 > GetDeskTopWidth() - 40)		
			nLarg1  := GetDeskTopWidth() - 40			
			nLargx := nLarg1 		
		End If 
	End If 
	*/

	

	DEFINE WINDOW &cBrowserName ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT nAltura1 VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag , (Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil) ;
		TITLE 'xBrowser' + Left( cParent ,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil  ;		
		ON PAINT (xPaintBrwMtr( ThisWindow.Name , aMDisplay , nItemx5 ,     nClearIt2  , .t.  )  ) 				
	END WINDOW



	
	DEFINE WINDOW &cEspelhoBrw ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT nAltura1 VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag ,(Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil)  ;
		TITLE 'xEspelho' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLACK ;
		ON MOUSEMOVE ( yCheckObj() ,   cObjSelected := 'aMtrBrowser')				
	END WINDOW

	
	lAtivo1 := ((nLargTotal+1) > nLarg1) 	




	If Len(aCabecalho) > 0		
		lHasHeader := xHeaderMtr( cHeaderName , aCabecalho , aTamanhos , cParent ,  cBrowserName ,  nLarg1 , aTipos , cTabela , lAtivo1 , lDicionario , nRowIni - 2 , nCol )		
	End If 	


	cBarrah := xBarHMtr( cParent ,  cBrowserName , nRowIni+nAltura1 , nLarg1  ,  nLargX , cBrowserName , ;
	(nQTotCol := xGetColQw1()) , nLarg1 - ((nLargTotal - nLargX) )   , cHeaderName , ((nLargTotal+1) > nLarg1)  , nCol	 ) 


	//SET WINDOW Win_Browser TRANSPARENT TO 0
	

	SET WINDOW &cBrowserName TRANSPARENT TO Iif(  lAtivo1 , 0 , 190 )



	If (Mod( nMaxItem1 ,  nTamPag ) == 0)
		nPageTotal := Int(nMaxItem1 / nTamPag)
	Else 
		nPageTotal := Int(nMaxItem1 / nTamPag)+1
	End If


	DEFINE LABEL Labelx1
		//PARENT Win_Browser
		PARENT &cParent  
		ROW    720
		COL    20
		WIDTH  120
		HEIGHT 24
		VALUE " "
		FONTNAME FONTBROWSER
		FONTSIZE FONTBROWSERSIZE
		TOOLTIP ""
		FONTBOLD .T.
		FONTITALIC .F.
		FONTUNDERLINE .F.
		FONTSTRIKEOUT .F.
		HELPID Nil
		VISIBLE .f.
		TRANSPARENT .f.
		ACTION Nil
		AUTOSIZE .F.
		BACKCOLOR NIL
		FONTCOLOR {150,150,150}
	END LABEL



	nCol11 := nCol + nLarg1 


	//msginfo(Str( nCol11 ))

	DEFINE WINDOW &cBarraVfrm ;
		AT nRowIni - 29 ,nCol11  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 21 HEIGHT nAltura1 + 30 ;
		TITLE 'xScroxRoleol1' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
		ON PAINT xPaintScroll( ThisWindow.Name ) 		
	END WINDOW


	DEFINE WINDOW &cBarraVSombra ;
		AT nRowIni - 29 ,nCol11  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 27 HEIGHT nAltura1+ 30 ;
		TITLE 'xScroxSombra' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR {240,240,240}  ;
		ON MOUSEMOVE (cObjSelected := 'BarraV')				  
	END WINDOW


	SET WINDOW &cBarraVfrm TRANSPARENT TO Iif(  lAtivo1 , 0 , 190 )
	_ShowWindow(cBrowserName )


	xCalcBarV()


	ShowScrollbar (GetFormHandle(cBrowserName ) , 0, .f.)
	ShowScrollbar (GetFormHandle(cBrowserName ) , 1, .f.)	

	ShowScrollbar (GetFormHandle(cEspelhoBrw) , 0, .f.)
	ShowScrollbar (GetFormHandle(cEspelhoBrw) , 1, .f.)

	If _isWindowDefined(cBarraVfrm)
		ShowScrollbar (GetFormHandle(cBarraVfrm) , 0, .f.)
		ShowScrollbar (GetFormHandle(cBarraVfrm) , 1, .f.)

		ShowScrollbar (GetFormHandle(cBarraVSombra) , 0, .f.)
		ShowScrollbar (GetFormHandle(cBarraVSombra) , 1, .f.)


		BT_ClientAreaInvalidateAll(cBrowserName )
		BT_ClientAreaInvalidateAll(cBarraVfrm)

	End If 	



	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBrowMtr"  ) )  ) = 0

		InstallEventHandler( "EventBrowMtr" )
		//nIndexEventZ := EventCreate (  { ||   xTecBrowMtr()   }   )		

		nIndexEventZ := EventCreate (  "xTecBrowMtr"   )		

		//EventProcessAllHookMessage( EventCreate (  { ||   xTecBrowMtr()   }   , GetFormHandle('fFiltrosCad') ) , .t. )

	End If






	If _isWindowDefined(cBarraVfrm)
		_ShowWindow(cBarraVfrm)
	End If 	

	_ShowWindow(cEspelhoBrw)

	If _isWindowDefined(cBarraVSombra)
		_ShowWindow(cBarraVSombra)
	End If 	

	//lHasHeader := .f. 


	If (lHasHeader)
		
		ShowScrollbar (GetFormHandle(cHeaderName) , 0, .f.)
		ShowScrollbar (GetFormHandle(cHeaderName) , 1, .f.)

		_ShowWindow(cHeaderName)


		BT_ClientAreaInvalidateAll(cHeaderName)

	End If 

	nLimteLin := yCriaButs()
	xDcToDc()
		
	Do Events 

	SysWait(0.01)
	xDcToDEspe()


	If _isWindowDefined(yGetBarNome(1) )
		_ShowWindow( yGetBarNome(1) )
		BT_ClientAreaInvalidateAll(yGetBarNome(1))


		_ShowWindow( yGetBarNome(2 ) )
		BT_ClientAreaInvalidateAll(yGetBarNome(2))
	End If 

	Do Events 

	
	yDcBarH1()

	Do Events 

	
	SysWait(0.01)

	
	If _isWindowDefined(yGetHeadName(1))
		_ShowWindow( yGetHeadName(1) )
		BT_ClientAreaInvalidateAll(yGetHeadName(1))


		_ShowWindow( yGetHeadName(2 ) )
		BT_ClientAreaInvalidateAll(yGetHeadName(2))

		yDcBarH1eMtr()

	End If 	



	SysWait(0.01)
	BT_ClientAreaInvalidateAll(cBarraVfrm)

	SysWait(0.01)

	BT_ClientAreaInvalidateAll(cBarraVSombra)



    //Do Events
   // Do Events


	SysWait(0.02)

	
	//yDcBarH1()
	xDcToDEspe()

	SysWait(0.02)

	xDcToDc()




	//msginfo('ko2')


Return

Function SetArray( aMz1 )

	If Len(aMz1) > 0 
		nOpselx1 := 0
		nItemx5 := 0
		nClearIt2 := 0
 		aMt1 := Aclone(aMz1)
	End If 	 

REturn   

Function yRetArray()
Return aMt1 

Function yRetPgNum()
REturn nPageNum
   

Static Function xCalcPosV(nReg1)

	Local nPos 	  := 0
	Local n1      := xCalcBarV()
	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83

	nPos := Int ((  (nTamBar  - n1)  *  nREg1 ) / Len(aMt1))

Return nPos


Static Function xCalcBarV()

	Local nCalc := 0

	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83

	nCalc := Int (( nTamBar *  nTamPag ) / Len(aMt1))

	If Len(aMt1) <= nTamPag
		nCalc := GetProperty(cBarraVfrm , 'Height') - 135 
	End If 

	If nCalc <= 30
	   nCalc := 30
	End If 


Return nCalc 

Function yShowBMt(  cTable1 , lDisplay   )

	Local cBrwName        := 'aBrw' + Left(cTable1,4) 
	Local cEspelhoBrw     := 'aWin_E' + Left(cBrwName,4)
	Local cBarraVfrm 	  := 'aWin_R1' +  Left(cBrwName,4)
	Local cBarraVSombra   := 'aWin_Resp' +  Left(cBrwName,4)

	DEFAULT lDisplay := .F. 


	
	If (_isWindowDefined(cBrwName))


		If lDisplay 

			//msginfo( Str(  Len(aMt1)  ))

		   BT_ClientAreaInvalidateAll (cEspelhoBrw)	

		   BT_ClientAreaInvalidateAll (cBrwName)	
		   SysWait(0.02)

		End If 

		_ShowWindow(cBrwName )  
		_ShowWindow(cEspelhoBrw)  

		_ShowWindow(cBarraVfrm)
		_ShowWindow(cBarraVSombra)


		xDcToDc() 

		SysWait(0.03)
		xDcToDEspe()	

		DO EVENTS

		
		_ShowWindow( yGetBarNome(1) )
		BT_ClientAreaInvalidateAll(yGetBarNome(1))


		_ShowWindow( yGetBarNome(2 ) )
		BT_ClientAreaInvalidateAll(yGetBarNome(2))

		Do Events 

		yDcBarH1()


	End If 


Return 


Static Function yRetImgs(  nId  )

	Local aMtr1 := {}

	If (nId == 855)      
      aMtr1 := { 'SCRUP1' , 'SCRUP1_1', 1 , 'SCRUP1_D' }
	End If 
	   
	If (nId == 856)      
		aMtr1 := { 'SCRUP2' , 'SCRUP2_1', 1  , 'SCRUP2_D' }
	End If 

	If (nId == 857)      
		aMtr1 := { 'SCRUP3' , 'SCRUP3_1', 1 , 'SCRUP3_D' }
	End If 

	If (nId == 858)      
		aMtr1 := { 'SCRDOWN3' , 'SCRDOWN3_1', 1 , 'SCRDOWN3_D' }
	 End If 

	 If (nId == 859)      
		aMtr1 := { 'SCRDOWN2' , 'SCRDOWN2_1', 1 , 'SCRDOWN2_D'}
	End If 

  
	If (nId == 860)      
		aMtr1 := { 'SCRDOWN1' , 'SCRDOWN1_1', 1 ,  'SCRDOWN1_D'}
	End If 	

   
Return aMtr1

Static Function xSaveVars()

	nSave1 := nItemx5

return

Function xRtColEsq()
REturn nColEsquerda


Static Function SetLargx(n1 )

 nLargx := n1

REturn 


Function yCalcEtap1()

	Local nCol2  := 1
	Local nWidth := 0
	Local nPos2
	Local nLargz1 := nLargx
	Local nRet := 0
	Local nc1 := 0
	Local nColEsq := 1

	//msginfo(Str(  nLargz1    ))



	While .t. 

			//nWidth := xGetColW1(  nCol2   )		

			nPos2 := xGetInfCw1(   nCol2 , 3  )	
			
			If (nPos2 >= nLargz1) 


				nWidth := xGetColW1(  nColEsq   ) - 3
				nc1 += nWidth
		   		nRet++

				nColEsq++   



				If (nC1 >= (nLargTotal - nLargX - 15))			
				    Exit
				End If 

			End If 

			nCol2++

			If (nCol2 > nQtCol)
				Exit 
			End 	


	Enddo 

	nConst2 := int((nLargTotal - nLargX) / nRet)

		

Return nRet 


Static Function xSrolUni( nW1  )

    nColScrool += nW1
	SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  nW1    , 2 )			

	Do Events

	yUpHead1(  cHeaderName ,   nW1  )		
	
	xDcToDc()			


	DO EVENTS




REturn 


Function xBarInicio()
REturn (nColEsquerda == 1)	



Function xBarFim()
REturn (nColScrool >= (nLargTotal - nLargX))	

Function yDecrLefa()
	nColEsquerda--
Return 	


Function yScrollCaM( lFrente , lUpdBar )

				
    Local nColTam 
	Local lFim := .f. 	

	Local nWidth := Iif( nColEsquerda > 0 , xGetColW1(  nColEsquerda   )	- 3 , 0 )


	DEFAULT lUpdBar := .t. 	

	If nWidth == 0
		REturn -1
	End If 


	If lFrente 

		If (nColScrool >= (nLargTotal - nLargX))			
			lFim := .t.
			//msginfo('End')
			Return -1
		End If 


		
		If nColEsquerda == 1
			nWidth += 15
		End If 				

		nColScrool += nWidth				
		SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -(nWidth)    , 2 )				

		nColEsquerda++		

		nPageNum++


	Else 	

		nColScrool -= nWidth
		SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  nWidth    , 2 )				

		
		
		If nColEsquerda == 1
			nColScrool -= 15
			SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  15    , 2 )					
			//nWidth := -1
		End If 	

		nPageNum--			

		//nColEsquerda--

	End If 	

	
	//nWidth := nConst1
		

	If (lUpdBar)
		//msginfo('lp232')

		If lFrente
			If (nColScrool >= (nLargTotal - nLargX))		
				nVal := xRetBarH()		
				yGoBarR()
			Else 	
				yUpdatBha1( nWidth    )		
			End If 			
		Else 
			If (nColScrool < 21)						
				yGoBarl()
			Else 	
				yUpdatBha1(  -(nWidth)    )		
			End If 			
		End If 	
		
    	yDcBarH1()
		

	End If 	

	//nAcumTot2 += nHSCrool
	
	Do Events				

	yUpHead1(  cHeaderName ,   Iif( lFrente , nWidth , -(nWidth)  ) )					
	Do Events 


	If (nColEsquerda == 1) .And. (!lFrente)
		yUpHead1(  cHeaderName ,   -15  )					
		Do Events 
	End If 

	xDcToDc()			

	DO EVENTS


REturn nWidth


Static Function xUpHead(  nValor    )


	yUpHead1(  cHeaderName ,   nValor  )					
	Do Events 

Return 



Static Function DoScrolly( nVert1 )

	nColScrool += nVert1
	SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -nVert1    , 2 )	

	SysWait(0.02)
	xDcToDc()

	Do Events				


Return 	




Function xTecBrowMtr()



	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()		
	LOCAL  nLParam := EventLPARAM()
	Local nContItens := 0
	Local nQt        := 0
	Local nRow       := 0
	Local nindice
	Local nRow2
	Local nCol2
	Local cTp1       := ''
	Local nR
	Local nC
	Local w1
	Local w2
	Local cControl := ''
	Local cForm    := ''

	Local n1 
	Local nIdBut 

	Local lCtrl := .f. 

	Local nPos1
	Local nWidth 

	Local nLarg1 := nLargX

	Local nLargz1 := nLargx
	//GetDeskTopWidth() - 45

	Local nDiff := nLargTotal - nLarg1 + 30

	Local aMVisible1 := Iif( nColScrool >= nLarg1  , yColsVisible(nColScrool) , {} )

	
	Local nPos2

	Local nTotal := 0

	Local lDownMouse := .f. 

	Local lUpMouse := .f. 


	//xFechaMen
	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)

	

	If HMG_GetLastMouseMessage (@nHWnd) == 513
	//	msginfo(Str(    HMG_GetLastMouseMessage (@nHWnd)   ))
	//	msginfo( Str(nWParam)  )
	End If 


	If HMG_GetLastMouseMessage (@nHWnd) == WM_MOUSEWHEEL

	  HMG_CleanLastMouseMessage()
	  Do Events
	  Do Events

	  //MSGINFO('ok2')


      If HIWORD( nWParam ) == 120
	  	lUpMouse := .t.        		 
      Else 
	  	lDownMouse := .t. 
      End If 		



	End If 


	If (nMsg == WM_LBUTTONDOWN)


		
		If (nHWnd == GetProperty( cEspelhoBrw , "HANDLE" ))

			nItem := xGetPos(cEspelhoBrw)			

			If (nItem > Len(aMt1))
				Return 	
			End If 		

			nItem := xGetPos(cEspelhoBrw)
			
			If (nItem > Len(aMt1))
				Return 	
			End If 		
			
			nRow1 := -(nLinScrool)
			If nClearIt2 > 0
				xLimpSub(cBrowserName ,  @nClearIt2 ,  nItemx5 , 0 ,   nItemBrwHeight , GetProperty(  cBrowserName,'Width')  , -(nLinScrool) )
			End If
			nItemx5 := 	nItem
			nClearIt2 := nItemx5
			If (nItemx5 > 0)
				BT_ClientAreaInvalidateRect(cBrowserName ,  nRow1  +  ( ( nItemx5 - 1 ) * nItemBrwHeight)  , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight   , .t. )
			End If
			nSelLine := nItem
			*// calcular nlinhaBarra

			nInd1 := Ascan(  aMVisible , { |a|  a[2] == nItemX5   }   )

			If nind1 > 0
				nLinhaBarra := aMVisible[   nInd1  ][1]												
			End If
			


			lHitb := (nLinhaBarra = nTamPag)
			lHitt := (nLinhaBarra = 1)			
			Do Events
			xDcToDc()			
			Do Events

			
		End If 	

	End If 	


	


	If nMsg == WM_KEYDOWN

		

		If (nWParam == 34) 
			//.And. (!lKeyPressed)


			//SysWait(0.9)
			
			
			HMG_CleanLastVirtualKeyDown()

			lKeyPressed := .t. 	

			xGoPgDn()


			
			//msginfo('ok2')
			//SysWait(0.9)

			Do Events 

			PostMessage(  nHWnd , WM_MOUSELEAVE , 0,0 )

			SysWait(0.03)

			
			HMG_CleanLastVirtualKeyDown()

			lKeyPressed := .f. 


		End If 	

		
		If (nWParam == VK_RIGHT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If

				
			nColz1 := xGetColSw1()

			If (nColz1 = nQTotCol)
				xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida. ") )
				REturn 
			End If 
			nColz1++

			If nLParam = 15				
				yScrollCaM( .t. , .f.  )			
				REturn 
			End If 

			ySelCol( nColz1 )
			DO EVENTS 

			SysWait(0.07)			

			nQTotEt := yCalcEtap1()

			nWidth := xGetColW1(  nColz1   )			
			nPos1 := xGetInfCw1(   nColz1 , 2  )
			nPos2 := xGetInfCw1(   nColz1 , 3  )	
			lScrool1 := (nPos2 >= nLargz1) 					 

			If (lScrool1)		

				yScrollCaM( .t. , .f. )
				yIncConter(.t.)	
				nColz1 := xGetColSw1()

				

				If ( nQEtp < nQTotEt)
										
					yUpdatBha1( nConst1     )	
					yDcBarH1()                                
					SysWait(0.03)		
					nQEtp++					
					yDcBarH1eMtr()

					DO EVENTS 

				End If 	

			Else 
			
			End If 

		

		End If
		


				
		If (nWParam == VK_LEFT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If
		//	HMG_CleanLastVirtualKeyDown()

			nColz1 := xGetColSw1()			

			SysWait(0.07)

			
			If nLParam = 353
				//msginfo('ok2')
				
				nColEsquerda--

				If nColEsquerda == 0
					nColEsquerda := 1
					xDialog("Coluna numero um Atingida." , .f.)
					Return 0
				End If 

				yScrollCaM( .f. , .f.  )	
				Return 
			End If 



			If nColz1 > 1 

				nColz1--

				ySelCol( nColz1 )
				DO EVENTS 
				lScrool1 := (nColz1 < nColEsquerda) 				

				If (lScrool1)
					
					nColEsquerda--

					If nColEsquerda == 0
						nColEsquerda := 1
						xDialog("Coluna numero um Atingida." , .f.)
						Return 0
					End If 

					yScrollCaM( .f.  , .f.  )		
					yIncConter(.f.)	

					yUpdatBha1( -nConst1     )	
					yDcBarH1()                                
					SysWait(0.03)	
					yDcBarH1eMtr()

					nQEtp--

					DO EVENTS 	

				End If 				


			Else 
				nColEsquerda := 1
				xDialog("Coluna Numero um Atingida." , .f.)				
			End If 	


		End If

		


		lCtrl := (GetKeyState ( VK_CONTROL ) < 0) .or. (lControlOk)

		IF (lCtrl)
			

			IF (nWParam == VK_HOME)
				
				xGoTop()				
				cTp1 := "Inicio do Navegador Atingido..."

				If !_isWindowDefined("Win_Msg")
					nHan1 := CrieJanTip(  GetProperty( cBrowserName   , 'Row') - 10  , GetProperty(cBrowserName , 'Col') + 150   ,   Alltrim(cTp1)      ,, 0.5 )
					
				Else
					xDispHint( cTp1 , GetProperty( cBrowserName , 'Row') - 10 ,  GetProperty( cBrowserName , 'Col') + 150  )
				End If

				Do Events
				xDispUpTam(  cTp1 )
				xFecheAnimate(  GetFormHandle('Win_Msg') )

				BT_ClientAreaInvalidateAll (cBarraVfrm)		
				xDcToDc()				
				xDcToDEspe()

				
				xCursorWait( .f. )
				
			End If

			IF (nWParam == VK_END)				

				xGoBottom()
				DO EVENTS
				HMG_CleanLastVirtualKeyDown()
				cTp1 := "Final do Navegador Atingido..."
				If !_isWindowDefined("Win_Msg")
					nHan1 := CrieJanTip(  GetProperty(cBrowserName , 'Row') - 10  , GetProperty(cBrowserName, 'Col') + 150   ,   Alltrim(cTp1)      ,, 0.5 )
		
				Else
					xDispHint( cTp1 , GetProperty(cBrowserName , 'Row') - 10 ,  GetProperty(cBrowserName, 'Col') + 150  )
				End If
				Do Events
				xDispUpTam(  cTp1 )	
				xFecheAnimate(  GetFormHandle('Win_Msg') )
				BT_ClientAreaInvalidateAll (cBarraVfrm)		
				xDcToDc()				
				xDcToDEspe()				
				xCursorWait( .f. )

			End If

		End If


	End If 

	IF (GetKeyState ( VK_SHIFT ) < 0)
		//msginfo('ok2')

		IF (nWParam == VK_LEFT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))				
			//	xWaitDlg()
				Return
			End If

			nColScrool := 0			
			SETVSCROLLVALUE( GetFormHandle(  cBrowserName  )  , 0 , 2 )
			BT_ClientAreaInvalidateAll(cBrowserName)
			xDcToDc()

			//msginfo('lp2')



		End If

		IF (nWParam == VK_RIGHT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))				
				//xWaitDlg()
				REturn
			End If

			nColScrool := nLargTotal - GetProperty(cBrowserName, 'Width')
			SETVSCROLLVALUE( GetFormHandle( cBrowserName )  , -(nColScrool) , 2 )
			BT_ClientAreaInvalidateAll(cBrowserName)			
			xDcToDc()

			

		End If


	END IF


	If (nWPAram == 34) 

		  /*

		If (nHWnd == GetProperty( 'fFiltrosCad' , "HANDLE" ))
		//	msginfo('lp2')

		End If 
		
		HMG_CleanLastVirtualKeyDown()
		xGoPgDn()
		//DO EVENTS
		
		
		//SysWait(0.03)
		//nWPAram := 0
		msginfo('g1')
		SysWait(0.07)
		*/
	End If 


	

	If (nWPAram == 33)			
		xGoPgUp()
	End If 


	If (nWParam == VK_DOWN) .or. (lDownMouse)

		lHitt := .f.

		lDownMouse := .f. 


		If (lHitt)
			nItemx5 := 1
		End If		

		nItemx5++

		If nLinhaBarra >= nTamPag
			lHitB := .t.
		Else
			nLinhaBarra++
		End If



		If (nItemx5 <= nMaxItem1 )

			If (lHitB)
				nLinhaBarra := nTamPag
				nSav2 := nItemx5
				ySelItem( nItemx5  , .t.  )
				ScrolUp1(.f.)				

				EncheMVis( nItemx5 )
				nItemx5 := nSav2
				nSelLine := nItemx5
				SysWait(0.03)		
					

			Else
				ySelItem( nItemx5  , .f.  )
				SysWait(0.07)
			End If

			xSaveVars()

		Else

			nLinhaBarra--
			xDialog('Maximo Atingido! ' + Str(nLinhaBarra) , .F.  )
			//nLinhaBarra := nTamPag 
			lHtb := .t.
			nItemx5 := nMaxItem1
			lHtt := .f.
			//xWaitDlg()
				
		End If

		BT_ClientAreaInvalidateAll (cBarraVfrm)		
		xDcToDc()				
		xDcToDEspe()	

	End If

	If (nWParam == VK_UP) .or. (lUpMouse) 			

		HMG_CleanLastVirtualKeyUp()	


		lUpMouse := .f. 

		If nItemx5 > 1
			nItemx5--
			lHitB := .f.
			If (nLinhaBarra = 1)				
				lHitt := .t.
			Else
				nLinhaBarra--
			End If

			//MSGINFO('OK2 ' + Str(nLinhaBarra))


			If (lHitt)
				//SysWait(0.09)
				ySelItem( nItemx5  , .t. , .f.  )


				//If nLinhaBarra == 1	
				ScrolUp1(.t.)				
				//End If 	

				EncheMVis( nItemx5  , .t. )
				SysWait(0.04)
				HMG_CleanLastMouseMessage()

			Else

				ySelItem( nItemx5  , .f.  , .f. )		
				SysWait(0.07)

			End If		
			
			
			If nItemX5 == 1
				lHitt := .t.
				nClearIt2 := 1
				nLinScrool := 0
				nLinhaBarra := 1			
				nPageNumber := 1
				//msginfo('333')	

			End If 

		Else
			lHitt := .t.
			nItemx5 := 1
			nClearIt2 := 1
			nLinScrool := 0
			nLinhaBarra := 1			
			nPageNumber := 1
			xDialog('Top Atingido!' , .f.  )			
		End If

		BT_ClientAreaInvalidateAll (cBarraVfrm)		
		xDcToDc()				
		xDcToDEspe()

	End If


Return


Static Function ScrolUp1( lUpDir  , nQtd1 )

	Local hwnd
	Local nSave2 := nItemx5
	Local nS1 := nLinScrool

	DEFAULT nQtd1 := nItemBrwHeight

	

	If (lUpDir)
		If (nLinScrool = 0)

		Else
			nLinScrool -= nQtd1
			SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , nQtd1  , 1 )
		End If
	Else
		If nItemScrool >= Len(aMt1)

		Else

			nLinScrool += nQtd1
			hwnd :=  GetFormHandle( cBrowserName )
			SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , -(nQtd1) , 1)

		End If
	End If
	

	nItemx5 := nSave2
	

Return

/*
function GetTextoTam( cMsg  )

	Local  FontHandle := _SetFont ( GetControlHandle( 'LblMsg1' , cParent ), FONTBROWSER,  FONTBROWSERSIZE  , .f. , .f. ,.f. ,.f. )

Return (GetTextWidth(  0,  'L' , FontHandle  )   )
*/


	//   xPaintBrowser( , aMt1 , nItemx1 ,     nClearIt2 ,  lHitB , lHitT  )

Static Function xRecords( n1 , lFrente  )	


	DEFAULT lFrente := .t. 

	If (lFrente)
		
		For z := n1 To ((n1+nTamPag) - 1)

			If (z <= LEn(aMt1) )
				Aadd(aMDisplay ,  xRetItem(   aMt1[Z]    )   )
			End If 	

		Next 	

	Else 


		For z := ((n1+nTamPag) - 1) To n1 

			If (z <= LEn(aMt1) )
				Aadd(aMDisplay ,  xRetItem(   aMt1[Z]    )   )
			End If 	

		Next 	


	End If 





REturn 	


Function xPaintBrwMtr( cForm , aMtrOp ,  nOpselx1 , nClear1 , lBrwEnable )

	Local aRGBcolor := 'BACK1'
	Local nWidthBmp := 170
	Local nHandle1
	Local nHandle2	
	Local BTstruct
	Local BTstruct2
	Local hDc
	Local hDc2
	Local lSeta1
	Local nTYpe
	Local nLine := 00
	Local hBit10
	Local hBit11
	Local nHeightBmp := nItemBrwHeight * Len(aMtrOp)
	Local nTam1 := GetTextoTam( ' '  , cActiveJan )
	Local hBitmap2
	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)
	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''
	Local xFont2 := FONTBROWSER
	//Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))
	//Local nCol := -(GetProperty( cForm    , "HscrollBar" , "Value"))
	Local nLineSeta := nTamSubMenuConsulta
	Local nLinDrop := 0
	Local lEnabled := .t.
	Local cCor
	Local nCor
	Local nLinB := 0
	Local lPaint := .f. 
	Local lPar := .t.
	Local hWnd 	
	Local nResto := Mod( nMaxItem1 , nTamPag   )
	Local nIndice := 0
	Local nPg := 0
	Local hBitmap 
	

	DEFAULT lBrwEnable := .t. 


	nRow := -(nLinScrool)
	nCol := -(nColScrool)

	
	hBitMap2 := BT_BitmapCreateNew (Width  , Height , WHITE )
	hDC2 := BT_CreateDC (cForm ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)

	If (nOpselx1 = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width  ,    Height    , WHITE , WHITE  )
	End If

	If nClear1 > 0

		If (Mod( nClear1, 2 ) = 0)
			nCor := WHITE
		Else
			nCor := CORBROWSE
		End If
		BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemBrwHeight)    , 0  , Width  ,    nHeightBmp     ,  nCor  , nCor   )

	End If

	nIndice := -9999
	

	For n1 := 1 To Len(aMtrOp) 
		  

		//cTexto := Hb_Utf8ToStr( aMtrOp[n1][1]) + Replicate(' ',200)

		//xRetItem( aMatriz )
		//cTexto := Hb_Utf8ToStr( xRetItem(aMtrOp[n1])       ) + Replicate(' ',200)

		cTexto := Hb_Utf8ToStr( aMtrOp[n1]  ) + Replicate(' ',200)
		nLinb++
		

		IF (nLinb > nTamPag)
			nLinB := 0
		End If

		nPg := Int(    n1  / nTamPag )+1

		If (nPg = nPageTotal)
        
		   n12 := (Len(cTexto) * nTam1 )

		   If !lPaint 				
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 0  , n12   ,    (nTamPag+2) * nItemBrwHeight     ,  WHITE  , {218,218,218}   )	
		   End If 	

		   lPaint := .t. 

		End If 	

		If (nOpselx1 > 0) .And. (nOpSelx1 = n1)   

			nTypeText    := BT_TEXT_BOLD
			nFontCor     := WHITE	

			If !lBrwEnable
				nTypeText    := BT_TEXT_TRANSPARENT				
				nFontCor 	 := BLACK
			End If 	



		
			If lAtivo1
				BT_DrawText ( hDC2 , nLine + nRow  , 17+nCol ,   cTexto , xFont2  , 9 , nFontCor ,  SELCOR   , ;
				nTypeText ,	nAlingText, nOrientation )
			End If


			If (nSelLine == n1) .And. (nColScrool == 0)
				BT_DrawBitmap (hDC2  , nLine  + nRow    , 0   , 15  , nItemBrwHeight , BT_STRETCH, hBitOk)
			End If

		Else

			nTypeText    := BT_TEXT_TRANSPARENT
			n12 := (Len(cTexto) * nTam1 )


			If (Mod( n1 , 2 ) = 0)				
				nCorBk := WHITE
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , n12 ,    nItemBrwHeight     , nCorBk  , nCorBk   )
				lPar := .f.
			Else
				nCorBk := CORBROWSE
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , n12 ,    nItemBrwHeight     , nCorBk  , nCorBk   )
				lPar := .t.
			End If
						
			cCor := FONTCOR

			/*
			If !aMtrOp[n1][2]
				cCor := CorDisabled
				nTypeText    :=  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT				
			End If
			*/


			BT_DrawText ( hDC2 , nLine + nRow  , 17+nCol  ,  cTexto , xFont2, 9 ,  cCor , nCorBk , nTypeText, nAlingText, nOrientation )

		End If

		nLine += nItemBrwHeight

	Next

	BT_DeleteDC (BTstruct )


Return


/*
FUNCTION QtAcento(cString)
	Local cChar  := ""
	Local nX     := 0
	Local nY     := 0
	Local cVogal := "aeiouAEIOU"
	Local cAgudo := "áéíóú"+"ÁÉÍÓÚ"
	Local cCircu := "âêîôû"+"ÂÊÎÔÛ"
	Local cTrema := "äëïöü"+"ÄËÏÖÜ"
	Local cCrase := "àèìòù"+"ÀÈÌÒÙ"
	Local cTio   := "ãõÃÕ"
	Local cCecid := "çÇ"
	Local cMaior := "&lt;"
	Local cMenor := "&gt;"
	Local lOk    := .f.
	Local nQt1   := 0
	Local aResult := { }

	For nX:= 1 To Len(cString)
		cChar:=SubStr(cString, nX, 1)
		IF cChar$cAgudo+cCircu+cTrema+cCecid+cTio+cCrase
			nY:= At(cChar,cAgudo)
			If nY > 0
				lOk    := .t.
				nQt1++
			EndIf
			nY:= At(cChar,cCircu)
			If nY > 0
				lOk    := .t.
				nQt1++
			EndIf
			nY:= At(cChar,cTrema)
			If nY > 0
				lOk    := .t.
				nQt1++
			EndIf
			nY:= At(cChar,cCrase)
			If nY > 0
				lOk    := .t.
				nQt1++
			EndIf
			nY:= At(cChar,cTio)
			If nY > 0
				lOk    := .t.
				nQt1++
			EndIf
			nY:= At(cChar,cCecid)
			If nY > 0
				lOk    := .t.
				nQt1++
			EndIf
		Endif
	Next

	If cMaior$ cString
		lOk    := .t.
		nQt1++
	EndIf
	If cMenor$ cString
		lOk    := .t.
		nQt1++
	EndIf

	//cString := StrTran( cString, CRLF, " " )

Return nQt1

*/




Function yCriaButs()

	Local cJanx := cBarraVfrm

	Local nRow1 := GetProperty(cBarraVfrm,'Height') - 20


   
Return (nRow1 - 46)


Function yLimpBarV()

	lTracking75 := .f. 
	lTracking135 := .f.
	nHasFocus := 0				
	
	//xRefreshBut()				

	Do Events 	
	BT_ClientAreaInvalidateAll( cBarraVfrm )

	xDcToDEspe()											
	Do Events 	
		



REturn 



Function EventBrowMtr( nHWnd, nMsg, nWParam, nLParam )

	Local cOpcao := ''
	Local nCol   := 0
	Local nRow   := 0
	Local aR1
	Local nInd2  := 0
	Local cTp1   := ''
//	Local nCol := 0
	Local nRow1 := 0

	Local nRow2 :=0
	Local nCol2 := 0
	Local nItem := 0
	Local lOkHint := .f.
	Local nInd1 := 0

	
	Local nIdBut := 0
	Local nId   := 0
	Local nL := 0

	Local cControl := ''

	Local nCol1   

	Local hWnd

	Local cBrwName        := 'Brw' + Left(cTabela,4) 
	Local cEspelhoBrw     := 'Win_E' + Left(cBrwName,4)
	Local cBarraVfrm 	  := 'Win_R1' +  Left(cBrwName,4)
	Local cBarraVSombra   := 'Win_Resp' +  Left(cBrwName,4)

	Local cFormName := ''
	
	//Local nRow1 := GetProperty('Win_Role1','Height') - 20

	
	
	If HMG_GetLastMouseMessage() == WM_LBUTTONDBLCLK
	//	msginfo('ok455555')
	End If 	


	
	IF nHWnd == GetProperty(  cJanObj   , "HANDLE" )				
	
		If nMsg == WM_MOUSEMOVE

			yLimpBarV()			


			GetCursorPos (@nCol1, @nRow1)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow1, nCol1 )
			hWnd := WindowFromPoint ( ar1[1] , ar1[2])


			If (lHasHeader)
				yApagueH( cHeaderName )
				yLimpMode()
				DO EVENTS 
				yDcBarH1eMtr()
				DO EVENTS 
				yDragOff()				
				Do Events
			End If 

			If  _isWindowDefined("Win_Msg")
			   	xHidehint()
			End If
			

			Return 



		End If 

	End If 	




	
	

	If (nHWnd == GetProperty(  cBarraVSombra, "HANDLE" ))		
		
		If (nMsg == WM_LBUTTONUP)			

			If (nHasFocus > 0 )
				PostMessage(OBTN_Handle( cBarraVfrm , nHasFocus   )  , WM_MOUSELEAVE , 0, 0  )												
				Do Events
				xDcToDEspe()				
				nHasFocus := 0
				lTracking75 := .f.					
				lTracking45 := .t. 			
				SysWait(0.01)
			End If 	


		End If 	

		If nmsg == WM_LBUTTONDBLCLK
			//msginfo('lp3333')	
		End If	


		If (nMsg == WM_LBUTTONDOWN) 			
	

			If nModeBrw = 1
				lControlOk := .t. 
				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_HOME , 0 )
				lControlOk := .f. 
			//	msginfo('up')
			End If 


			If nModeBrw = 4
				lControlOk := .t. 
				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_END , 0 )
				lControlOk := .f. 
			End If 

	

			While( nModeBrw = 3) .And. (!lTracking45)	
				
				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i				
			
				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_UP , 0 )				
				
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 				
				SysWait(0.03)
			End 

			
			
			While (nModeBrw = 6) .And. (!lTracking45)

				
				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i
			
				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_DOWN , 0 )	
				
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 										

				SysWait(0.03)

			End  


			While (nModeBrw = 5) .And. (!lTracking45)			

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				SysWait(0.02)
				xGoPgDn()				
				SysWait(0.02)				
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 	
			End If 



			While (nModeBrw = 2) .And. (!lTracking45)	

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				SysWait(0.02)
				xGoPgUp()
				SysWait(0.02)					
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 		
			End 



			SysWait(0.02)
			
			lTracking45 := .f. 
			//SysWait(0.09)
			
		
		End If 	




		If (nMsg == WM_MOUSEMOVE) 			

			Do Events	
		//	CursorArrow1(nHWnd)
			Do Events	
			


			If (lHasHeader)
				yApagueH( cHeaderName )
				SysWait(0.03)
				yDcBarH1eMtr()
				SysWait(0.03)
				//msginfo('ok2')

				yDragOff()				
				Do Events
			End If 


         	GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )

			If (ar1[2] > 21) .or. (ar1[2] < 0)				
				CursorArrow1(nHWnd)
				DO EVENTS	
				xOffBarVert( nHWnd )				
				Return 
			End If 

			nRow1 := ar1[1]
			nId := 0 


			If (nRow1 >= nLimteLin)			

				nL := GetProperty(cBarraVfrm,'Height') - 20

			    If (nRow1 > (nL + 1))
					If (Len(aMt1) > nTamPag)
				    	nId := 858						
					Else
						nModeBrw := 0	
					End If 	
				Else 

					If (nRow1 <= (nLimteLin + 20   ))
					    nId := 860
					Else 

						If (Len(aMt1) > nTamPag)							
					   		nId := 859	
						Else 
							nModeBrw := 0		   
						End If 

					End If 

				End If 	
			Else 
				If nRow1 <= 20
					nId := 855					
				Else 
					
					If (Len(aMt1) > nTamPag)
						If (nRow1 >= 41) .And. (nRow1 <= 61)
							nId := 857					
						Else 
							If (nRow1 >= 21) .And. (nRow1 <= 40)
								nId := 856
							End If 
						End If 
					Else 
						nModeBrw := 0		
					End	If 

				End If 
			End If 					


			If (nId = 0)
			//	msginfo('ll21 ' + Str(nModeBrw) + '  ' + Str(nHasFocus))
			    SysWait(0.01)
				yLimpBarV()
				//SysWait(0.01)
				Return 

			End If 	


			If (nRow1 >= 61) .And. (nRow1 <= (GetProperty(cBarraVfrm,'Height') - 61) ) .And. (nId = 0) 							
				xOffBarVert( nHWnd )
				Return 
			End If 


			If (nHasFocus > 0) 				
				If (nId != nHasFocus)									
					xDcToDEspe()
					Do Events 			
					lTracking75 := .f. 		
					lTracking135 := .f.
					nHasFocus := 0							
				End If 					
			End If 


			
			If (nId > 0) .And. (!lTracking75)			
			
				nModeBrw := yDoHint(   nId  ,  , .t.  )			
				CursorHand1( nHWnd  )	
				
				//msginfo('222222 ' + Str(nId))
			
				nHasFocus := nId		
				BT_ClientAreaInvalidateAll( cBarraVfrm )
				Do Events 
				xDcToDEspe()				
				Do Events
		
				lTracking135 := .t.
				lTracking75  := .t.

				SysWait(0.03)
		
			End If 	

			

				

			
		End If 

	End If 	



	If (nHWnd == GetProperty( cBarraVfrm , "HANDLE" ))

		If (nMsg == WM_LBUTTONDOWN) 			

			msginfo('kk2')
		End If 	
		
		If (nMsg == WM_DRAWITEM)				
			If ( nWParam >=  855 ) .AND.  ( nWParam <=  860 )
				//OBTN_Draw( nHWnd,  nwParam, nLParam , (  nHasFocus == nWParam  )  ,  yRetImgs(  nWParam  ) , .f. , 20 ) 				
			End If
		End If 	


	End If



	If (nHWnd == GetProperty( cEspelhoBrw , "HANDLE" ))

	//	msginfo('lp2 ' + cEspelhoBrw)

		If nMsg == WM_MOUSELEAVE
			nClearIt2 := 0
			nitemx5   := 0

			BT_ClientAreaInvalidateAll(cBrowserName)
	
		End If



		If nMsg == WM_MOUSEMOVE

			//msginfo('d2')

			If (lHasHeader)
				yApagueH( cHeaderName )
				DO EVENTS 
				yDcBarH1eMtr()
				DO EVENTS 
				yDragOff()				
				Do Events
			End If 


			If (nHasFocus > 0) 					

				lTracking75 := .f. 
				lTracking135 := .f.
				nHasFocus := 0				
				SetWindowCursor( nHWnd , IDC_ARROW )
				xRefreshBut()				
				Do Events 				
				xDcToDEspe()											
				Do Events 				
				
				If  _isWindowDefined("Win_Msg")
					xHidehint()
				End If
				Do EVENTS	
				yOffBarra( cBarrah  )

			Else 
			End If 		          
			If  _isWindowDefined("Win_Msg")
				xHidehint()
			End If

		End If 

		
	        

		If nMsg == WM_LBUTTONDOWN

			nItem := xGetPos(cEspelhoBrw)

			
			If (nItem > Len(aMt1))
				Return 	
			End If 		

			
			nRow1 := -(nLinScrool)
			If nClearIt2 > 0
				xLimpSub(cBrowserName ,  @nClearIt2 ,  nItemx5 , 0 ,   nItemBrwHeight , GetProperty(  cBrowserName,'Width')  , -(nLinScrool) )
			End If
			nItemx5 := 	nItem
			nClearIt2 := nItemx5
			If (nItemx5 > 0)
				BT_ClientAreaInvalidateRect(cBrowserName ,  nRow1  +  ( ( nItemx5 - 1 ) * nItemBrwHeight)  , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight   , .t. )
			End If
			nSelLine := nItem
			*// calcular nlinhaBarra

			nInd1 := Ascan(  aMVisible , { |a|  a[2] == nItemX5   }   )

			If nind1 > 0
				nLinhaBarra := aMVisible[   nInd1  ][1]								
				//MSGINFO(Str(nLinhaBarra))
			End If
			


			lHitb := (nLinhaBarra = nTamPag)
			lHitt := (nLinhaBarra = 1)			
			Do Events
			xDcToDc()			
			Do Events


		End If

	End If

Return




Static Function yDoHint(   nIdBut , cMsg , lNoHint   )

	Local cTp1 := ''
	Local nModeBrw := 0
	Local nRow , nCol 

	DEFAULT cMsg := Nil 
	DEFAULT lNoHint := .F. 

	If (cMsg = Nil)
		If nIdBut = 855
			cTp1 := "Retorna uma Registro para Tras no Grid."
			nModeBrw := 3
		End If 	

		If nIdBut = 856
			cTp1 := "Retorna uma Pagina para Tras no Grid."
			nModeBrw := 2
		End If 	

		If nIdBut = 857
			cTp1 := "Desloca Grid ate Primeiro Registro."
			nModeBrw := 1
		End If 	

		If nIdBut = 858
			cTp1 := "Desloca Grid ate o Ultimo Registro."
			nModeBrw := 4
		End If 	

		If nIdBut = 859
			cTp1 := "Avança uma Pagina no Grid"
			nModeBrw := 5
		End If 	

		If nIdBut = 860
			cTp1 := "Avança um registro no Grid"
			nModeBrw := 6
		End If 	

		
		lTracking135 := .t.
		lTracking75  := .t.

	Else 
	 	 cTp1 := cMsg
	End If 


	//Do Events 
    
	If !lNoHint

 	    GetCursorPos( @nCol , @nRow )

	
	    If !_isWindowDefined("Win_Msg")
		    CrieJanTip( nRow  - 20 , nCol - 15   ,   Alltrim( cTp1 )     ,, 0.5 )
    	Else
	    	xDispHint( cTp1 , nRow  - 20,  nCol - 15  )
	    End If

	    xDispUpTam(cTp1 )

    	BringTop('xHint')

	End If 

	
REturn nModeBrw



Static Function xRefreshBut()

	
	Local n11 := yCriaButs()


	If (nHasFocus == 0)

		BT_ClientAreaInvalidateAll( cBarraVfrm )
	Else 
		If (nHasFocus < 858 )
			BT_ClientAreaInvalidateRect( cBarraVfrm, 0,0, 20 , 61 , .t.)
		Else 		
			BT_ClientAreaInvalidateRect( cBarraVfrm, n11 ,0, 20 , 61 , .t.)
		End If	
	End If 

	//BT_ClientAreaInvalidateAll('Win_Role1')	


Return 



Static Function ySelItem( nItem1 , lScr1 , lFrente  )

	Local nRow1 := 0
	Local nItem := nItem1
	Local nR := 0
	Local nI := 0

	Default lFrente := .t.


	If nClearIt2 > 0
		xLimpSub(cBrowserName,  @nClearIt2 ,  @nItemx5 , 0 ,   nItemBrwHeight , GetProperty(  cBrowserName,'Width') , -(nLinScrool) )
	End If

	nItemx5 := nItem

	If nItemx5 > 0
		nClearIt2 := nItemx5
	Else
		Return
	End If

	If nLinScrool > 0
		nRow1 := -(nLinScrool)
	End If
	nSelLine := nItemx5


	If (nItemx5 > 0)
		BT_ClientAreaInvalidateRect( cBrowserName,  nRow1  +  ( ( nItemx5 - 1 ) * nItemBrwHeight)  , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight   , .t. )
	End If

	nPerCent := ( nItemx5 / nMaxItem1) * 100


	nI := 63
	nR := (nTamPag * nItemBrwHeight) - 83

	BT_ClientAreaInvalidateRect(cBarraVfrm   ,  nI  ,0,  20,  (nR - nI) + 45  , .t.  )

Return


Static Function xOffBarVert( nWh1 )
	

	lTracking75 := .f. 
	lTracking135 := .f.
	nHasFocus := 0		
	nModeBrw := 0		
	
	//xRefreshBut()				

	Do Events 	
	BT_ClientAreaInvalidateAll( cBarraVfrm )

	yOffBarra( cBarrah  )

				//xLuzOff( cBarrah )
	xDcToDEspe()											
	Do Events 				
				
	If  _isWindowDefined("Win_Msg")
		xHidehint()
	End If

	Do EVENTS


Return 


Static Function xPaintScroll( cJanela )

	Local BTstruct2
	Local nLAst
	Local hDC
	Local nRIni := 65
	Local nFator , yPos

	Local nAltura := xCalcBarV()

	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83


	Local yBmp1 := BT_BitMapLoadFile('SCRUP1')
	Local yBmp2 := BT_BitMapLoadFile('SCRUP2')
	Local yBmp3 := BT_BitMapLoadFile('SCRUP3')
	Local zBmp1 := BT_BitMapLoadFile('SCRDOWN1')
	Local zBmp2 := BT_BitMapLoadFile('SCRDOWN2')
	Local zBmp3 := BT_BitMapLoadFile('SCRDOWN3')
	//Local zRolagem := BT_BitMapLoadFile('ROLAGEM')

	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)


	Local nRow1 := Height - 20

	Local n11 := yCriaButs()

	Local aMtrz1 := { 855 , 856 , 857 , 860 , 859 , 858}

	Local nLinha := 0
	Local lFlag  := .f. 

	Local n1 

	If (nAltura <= 1)

	End If 
	

	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )
	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {230,230,230}  , {230,230,230} )



	nLAst := nRow1 - 63
	

	If (nItemX5 == 1)		
		BT_DrawFillRoundRect ( hDC , nRIni ,  2   , Width - 5 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 				
	Else

		If (nItemX5 == nMaxItem1 )			
			BT_DrawFillRoundRect ( hDC , nLimteLin - nAltura ,  2   , Width - 5 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 				
		
			
		Else			


			yPos := nLimteLin - nRIni - nAltura
			nFator := Int(( nItemX5 * yPos     ) /	nMaxItem1)

			If (Len(aMt1) <= nTamPag)
				nFator := 0	
			End If 
					

			BT_DrawFillRoundRect ( hDC ,   (nrIni  + nFator )  ,  2   , Width - 5 , nAltura , 5 ,5 ,  {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 				
			
		End If
	End If

	If !lAtivo1		
		BT_DeleteDC (BTstruct2 )	
		REturn 
	End If 


	For n1 := 1 To Len(aMtrz1)



		aImgs := yRetImgs(  aMtrz1[n1]   )
	

		If (aMtrz1[n1] >= 858) .And. ( !lFlag	)
			nLinha := n11			
			lFlag := .t. 
		Else 
			
		End If 	


		cImg := aImgs[1]




		If (nHasFocus == aMtrz1[n1] )
			cImg := aImgs[2]						
		End If 	

		If (Len(aMt1) <= nTamPag)

			If (aMtrz1[n1] != 855) .And. (aMtrz1[n1] != 860)
				cImg := aImgs[4]
			End If 

		End If 



		BT_DrawBitmap (hDC  , nLinha  , 0  	, 18  , 18  ,      BT_COPY,   BT_BitMapLoadFile( cImg   )    )	    
		nLinha += 21


	Next 	

	BT_DeleteDC (BTstruct2 )



Return


Static Function xGetPos( cJanela )
	Local nCol := 0
	Local nRow := 0
	Local ar1
	Local NewPos
	Local nIa1 , nIa2

	Local nItem := 0

	Local nHeit2 := 0
	Local  nItDopred := 0

	Local nHeightCalc := nItemBrwHeight

	
	GetCursorPos (@nCol, @nRow)

	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJanela  )  , nRow, nCol )

	NewPos := nLinScrool


	If NewPos > 0
		nItem := (Int( (NewPos+Ar1[1])     / nHeightCalc)+1)
	Else
		nItem := (Int(  Ar1[1]  / nHeightCalc)+1)
	End If



Return Abs(nItem)



Static Function xGoPgUp()

	Local nPos1 := 0
	Local nLast1 
	Local nPageNum := aMt1[nItemx5][3]
	Local nI 

	
	If (nPageNumber = 1 )	
		xDialog("Inicio das informações Atingido." , .f. )
		Return 
	End If 	

	
	lHitB := .f.
	lHitt := .f.

	
	For ni := 1 To nTamPag
		ScrolUp1(.t.)		
	Next 	

	nLast1 := nPageNum * nTamPag
	nItemX5-=(nTamPag)
	nClearIt2   := nItemX5
	nClear1     := nItemX5	
	nSelLine := nItemx5	
	EncheMVis( nLast1 , .f.   )


	BT_ClientAreaInvalidateAll(cBrowserName)
	

	SysWait(0.03)	

	

	BT_ClientAreaInvalidateAll (cBarraVfrm)		

	
	Do Events 

	xDcToDc()				
	xDcToDEspe()
		

Return 




Static Function xGoPgDn()

	Local nPos1 := ( (nPageNumber *  nTamPag) * nItemBrwHeight)
	Local nLast1 
	Local ni 
	//Local nPageNumber := aMt1[nItemx5][3]
	Local nResto := Mod( nMaxItem1 , nTamPag)


   

	lKeyPressed := .t.


	//nPos1 := ( (  (nPageNumber )  *  nTamPag) * nItemBrwHeight)

	/*

	If ( nPageNumber = nPageTotal )		 			
		xDialog("Final das informações Atingido." , .f. )
		Return 
	End If 	

	*/



	lHitB := .f.
	lHitt := .f.

	DO EVENTS

	
	//SysWait(0.05)



	
	CursorArrow1(   GetFormHandle(  'fFiltrosCad' )       )


	//DO EVENTS


	//SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , npos1  , 1 )



	For ni := 1 To nTamPag  	
		//ScrolUp1(.f.)	

	//ScrolUp1(.f. , (nTamPag * nItemBrwHeight)  )			
	Next 	

	//ScrolUp1(.f.)	

	//nColScrool += (nTamPag * nItemBrwHeight) 

	ScrolUp1(.f. , (nTamPag * nItemBrwHeight)  )

	nPos := aMVisible[nTamPag][2]

	//msginfo(Str(nPos))


	//msginfo('ok6666 9992')



	
	//msginfo(Str(nResto) + '   ' + Str(nTamPag) )

	nLast1      := (nPageNumber * nTamPag)+1

	nItemX5     := (nPageNumber * nTamPag)+1
	nItemX5     += (nTamPag)


//	MSGINFO(Str( nItemX5 ))

	nClearIt2   := nItemX5
	nClear1     := nItemX5

	
	
	//SysWait(0.05)

	nSelLine := nItemx5		

	EncheMVis(nItemX5  , .t. )

	
	nLinhaBarra:=nTamPag 


	//msginfo('Ser 1 ' + Str(nLast1) + '  ' + Str(nPageNumber) + '  ' + Str(nPageTotal))

	/*
	
	If (nResto != 0 ) 
		EncheMVis( nLast1 + 1   , .t.  , Int(nResto)    )
	Else 		

		EncheMVis( nLast1 + 1 , .t. )
	End If 

*/ 
	//ScrolUp1(.f.)

	//SysWait(0.9)



	//BT_ClientAreaInvalidateAll(cBrowserName)

	/*
	If aMt1[nItemx5][3] == nPageTotal
	

		
	End If 
	*/
	

	
  /*
	If (nPageNumber+1) == nPageTotal		
		nLinhaBarra := 1
	End If 	
	*/

	//xDcToDc()	





	//BT_ClientAreaInvalidateAll (cBarraVfrm)		
//	Do Events 

	xDcToDc()	
	xDcToDEspe()



	msginfo('21  yy')



	nPageNumber++

	lKeyPressed := .f.

	//SysWait(0.05)


	
Return .t.





Static Function xGoBottom()


	Local nPos1 := (Len(aMt1) * nItemBrwHeight) - (nTamPAg * nItemBrwHeight)

	

	If ( nPageNumber = nPageTotal )		 			
		xDialog("Final das informações Atingido." , .f. )
		Return 
	End If 	


	xCursorWait( .t. )	

	Do Events

	nItemX5     := Len(aMt1)
	nClearIt2   := nItemX5
	nClear1     := nItemX5
	nLinhaBarra := nTamPag

	

	aMDisplay := {}
	xRecords( nItemX5  , .f. )

	lHitB := .t.

	lHitt := .f.

	//_HMG_PRINTER_SETVSCROLLVALUE(   GetFormHandle(cBrowserName)  , nPos1 )


	
	nLinScrool := (nTamPAg * nItemBrwHeight) 

	//nLinScrool := nPos1
	
	EncheMVis( Len(aMt1) , .f.  )




	nPageNumber := nPageTotal

	ySelItem(nItemX5)

	BT_ClientAreaInvalidateAll(cBrowserName)
	BT_ClientAreaInvalidateAll(cBarraVfrm)

	


	
	SysWait(0.01)

	xDcToDEspe()
	


Return


Function xInitBrw()

	xGoTop()

Return 	

Static Function xGoTop()

	xCursorWait( .t. )

	nPageNumber := 1

	nItemX5     := 1
	nClearIt2   := 1
	nClear1     := 1
	nLinhaBarra := 1
	lHitB := .f.
	lHitt := .t.

	nLinScrool := 0
//	nColScrool := 0

    aMDisplay := {}
	xRecords( nItemX5 )

	EncheMVis( nTamPag )

	BT_ClientAreaInvalidateAll(cBrowserName)
	BT_ClientAreaInvalidateAll(cBarraVfrm)	


	
	SysWait(0.05)

	xDcToDEspe()
	

				
	xCursorWait( .f. )

	xDcToDc()
				
	Do Events 

	//SysWait(0.05)

	//msginfo('lpp22')

REturn



Static Function xDcToDEspe()

	Local Width1  := BT_ClientAreaWidth  (cBarraVfrm)
	Local Height1 := BT_ClientAreaHeight (cBarraVfrm)

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2


	Local Width2  := BT_ClientAreaWidth  (cBarraVSombra)
	Local Height2 := BT_ClientAreaHeight (cBarraVSombra)

	hDC1 = BT_CreateDC (cBarraVfrm, BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cBarraVSombra, BT_HDC_ALLCLIENTAREA, @BTstruct2)

	//BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 90 , 0, Width1, 366 )

	If lAtivo1
		BT_DrawDCtoDC (hDC2, 0, 0 , Width2, Height2, BT_SCALE, hDC1, 0 , 0, Width1, Height1 )
	else
		BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 135, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	End If 



	nTypeText    := BT_TEXT_TRANSPARENT    
	nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP 
	nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
//	BT_DrawText (hDC2, 300, 50, "Mirror of the Win1", "Times", 42, YELLOW, BLACK, nTypeText, nAlingText, nOrientation)

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)

	BT_ClientAreaInvalidateAll (cBarraVSombra)

Return 




Static Function xDcToDc()

	Local Width1  := BT_ClientAreaWidth  (cBrowserName)
	Local Height1 := BT_ClientAreaHeight (cBrowserName)

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2


	Local Width2  := BT_ClientAreaWidth  (cEspelhoBrw)
	Local Height2 := BT_ClientAreaHeight (cEspelhoBrw)

	hDC1 = BT_CreateDC (cBrowserName, BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cEspelhoBrw, BT_HDC_ALLCLIENTAREA, @BTstruct2)

	If lAtivo1
		BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Else 
	    BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 135, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	End If 	


	nTypeText    := BT_TEXT_TRANSPARENT    
	nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP 
	nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
	BT_DrawText (hDC2, 300, 50, "Mirror of the Win1", "Times", 42, YELLOW, BLACK, nTypeText, nAlingText, nOrientation)

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)
	BT_ClientAreaInvalidateAll (cEspelhoBrw)

Return 

Function xSaveBmp()

	Local hDc := GetDc(cBrowserName)

Return

/*
Static Function xCursorWait( lOn )


	If lOn 
		//SetWindowCursor( GetFormHandle( cFormPrin )  , 'CURSOR1'  )
		SetWindowCursor( GetActiveWindow()  , 'CURSOR1'  )
		
	Else 

		//SetWindowCursor( GetFormHandle( cFormPrin )  , IDC_ARROW  )
		//SetWindowCursor( GetFormHandle(cEspelhoBrw )  , IDC_ARROW  )	

		SetWindowCursor( GetActiveWindow()  ,IDC_ARROW  )
		
		
	End If 	


	Do Events
					


Return 
*/


