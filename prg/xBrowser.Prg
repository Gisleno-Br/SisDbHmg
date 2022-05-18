
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

Static lScrool1 := .f. 

Static nAcumTot2 := 0
Static nLastadd := 0




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

Static nPgNum1 := 1


Static nLargX := 0

Static cBarrah := ''

Static lHasHeader := .f. 

Static nColH1 := 0

Static nColEsquerda := 1

Static nPageNum := 0

Static nLastPage := 0

Static lAtivo1 := .t. 
Static cTabelay := ''

Static aTam2     := {}
Static aTips2    := {}

Static cSqlp := ''

Static aMatReg := {}


//DECLARE WINDOW Win_Browser



Function xRodaImp()


	While !lTermino
		Do Events
	Enddo



	hb_threadDetach( aThread2 )   // close thread handle
	hb_threadQuitRequest( aThread2 )


	aThread2 := Nil


Return aMResult



Function xRetLargura()

REturn nLargura


Function xRetTamPg()
Return nTamPag


Function DoMatriz( cParentx , cTabela )

	//aThread2 := hb_threadStart( HB_THREAD_INHERIT_PUBLIC, @TestBrow(),  cParentx , cTabela  )



REturn (TestBrow(  cParentx , cTabela  ))




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
	Local calias  := "T_" + Left(cTabela,3)
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

Function EncheMVis( nRec , lFrente , z2   )


	Local N1 := 1
	Local nAcum := nRec
	Local z1 := nTamPag

	DEFAULT z2 := nTamPag 	
	Default lFrente := .f.
	
	aMVisible := {}	




	If !lFrente
		For n1 := 1 to z2			
			Aadd(aMVisible  , {    z1  ,   nAcum         })
			z1--
			nAcum--
		Next
	Else
		For n1 := 1 to z2			
			Aadd(aMVisible  , {    n1  ,   nAcum         })
			nAcum++
		Next
	End If


Return




Function xBrowser( cTabx ,   aDatas1 , cParent   ,  cBrwName , nCol  , aCabecalho , aTamanhos , aTipos , lDicionario , lEnabled1 , nRowIni)


	Local nTamWidth := xRetLargura()
	Local nTam1 := GetTextoTam( ' '  , cActiveJan )
	Local nIndex22
	Private aOpx1 := 0
	Private cAlias := Left(cTabx,4)

	
	Private nLarg1  := GetDeskTopWidth() - 40


	cSqlp  := GetSql( cTabx  , .f. )

	DEFAULT nCol := 10
	DEFAULT nRowIni   := 145
	//145
	DEFAULT aCabecalho := {}
	DEFAULT lDicionario := .t. 
	DEFAULT lEnabled1   := .t.


	aTam2     := aTamanhos 
	aTips2    := aTipos



	lAtivo1 := lEnabled1

	cTabelay := cTabx 


	nLargx := nLarg1 

	aMt1      := Aclone(aDatas1)
	//nMaxItem1 := Len(aDatas1)
	nItemBrwHeight := nItemSubHeight - 5
	nItemScrool := 0
	nLargTotal := nTamWidth
	lNoHorzScr := .f.
	hBitOk 	   := BT_BitmapLoadFile ('OKMARK')


	//EncheMVis( nTamPag  , .f.  )


	cBrowserName  := cBrwName
	//'Win_Browser'
	cEspelhoBrw   := 'Win_E' + Left(cBrowserName,4)
	cBarraVfrm 	  := 'Win_R1' +  Left(cBrowserName,4)
	cBarraVSombra := 'Win_Resp' +  Left(cBrowserName,4)


	cHeaderName := 'Win_Header' + Left(cBrowserName,4)

	nQEtp := 0

	aMt1 := {}

	
	dbUseArea( .T.,,  cSqlp , cAlias )
	dbSelectArea( cAlias )
	dbGoTop()

	
	
	nLargTotal := xRecords()	

	SysWait(0.01)

	DbGotop()

	nMaxItem1 := RecCount()

	DEFINE WINDOW &cBrowserName ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag , (Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil) ;
		TITLE 'xBrowser' + Left(cActiveJan,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil  ;		
		ON PAINT (xPaintBrowser( ThisWindow.Name , aMt1 , nItemx5 ,     nClearIt2  , .t.  )  ) 		
	END WINDOW



	DEFINE WINDOW &cEspelhoBrw ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag ,(Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil)  ;
		TITLE 'xEspelho' + Left(cActiveJan,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLACK ;
		ON MOUSEMOVE ( xCheckObj() ,   cObjSelected := 'Browser')				
	END WINDOW

	
	lAtivo1 := ((nLargTotal+1) > nLarg1) 	


	
	If Len(aCabecalho) > 0		
		lHasHeader := xHeader( cHeaderName , aCabecalho , aTamanhos , cParent ,  cBrowserName ,  nLargTotal , aTipos , cTabela , lAtivo1 , lDicionario )		
	End If 	


	cBarrah := xBarraH( cParent ,  cBrowserName , nRowIni+(nTamPag * nItemBrwHeight)+2  , nLargTotal  ,  nLargX , cBrowserName , ;
	(nQTotCol := xGetColQtd()) , nLarg1 - ((nLargTotal - nLargX) )   , cHeaderName , ((nLargTotal+1) > nLarg1) 	 ) 


	//SET WINDOW Win_Browser TRANSPARENT TO 0

	

	SET WINDOW &cBrowserName TRANSPARENT TO Iif(  lAtivo1 , 0 , 190 )



	If (Mod( nMaxItem1 ,  nTamPag ) == 0)
		nPageTotal := Int(nMaxItem1 / nTamPag)
	Else 
		nPageTotal := Int(nMaxItem1 / nTamPag)+1
	End If

	//msginfo(Str( nPageTotal))


	DEFINE LABEL Labelx1
		//PARENT Win_Browser
		PARENT &cActiveJan  
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

	DEFINE WINDOW &cBarraVfrm ;
		AT nRowIni - 31 ,nCol11  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 21 HEIGHT (nTamPag * nItemBrwHeight) + 31 ;
		TITLE 'xScroxRoleol1' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
		ON PAINT xPaintScroll( ThisWindow.Name )
	END WINDOW



	DEFINE WINDOW &cBarraVSombra ;
		AT nRowIni - 31 ,nCol11  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 27 HEIGHT (nTamPag * nItemBrwHeight) + 31  ;
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

	ShowScrollbar (GetFormHandle(cBarraVfrm) , 0, .f.)
	ShowScrollbar (GetFormHandle(cBarraVfrm) , 1, .f.)

	ShowScrollbar (GetFormHandle(cBarraVSombra) , 0, .f.)
	ShowScrollbar (GetFormHandle(cBarraVSombra) , 1, .f.)


	BT_ClientAreaInvalidateAll(cBrowserName )
	BT_ClientAreaInvalidateAll(cBarraVfrm)

	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBrowser"  ) )  ) = 0
		InstallEventHandler( "EventBrowser" )
		nIndexEventZ := EventCreate (  { ||   xTeclasBrow( )   }  )		
	End If


	
	_ShowWindow(cBarraVfrm)
	_ShowWindow(cEspelhoBrw)
	_ShowWindow(cBarraVSombra)

	If (lHasHeader)
		
		ShowScrollbar (GetFormHandle(cHeaderName) , 0, .f.)
		ShowScrollbar (GetFormHandle(cHeaderName) , 1, .f.)

		_ShowWindow(cHeaderName)


		BT_ClientAreaInvalidateAll(cHeaderName)

	End If 


	nLimteLin := xCriaButs()
	xDcToDc()
		
	Do Events 

	SysWait(0.01)
	xDcToDEspe()


	_ShowWindow( xGetBarName(1) )
	BT_ClientAreaInvalidateAll(xGetBarName(1))


	_ShowWindow( xGetBarName(2 ) )
	BT_ClientAreaInvalidateAll(xGetBarName(2))

	Do Events 

	xDcBarH()


	Do Events 

	
	SysWait(0.01)

	//_ShowWindow(    )
	//BT_ClientAreaInvalidateAll( cHeaderName)

	
	_ShowWindow( xGetHeadName(1) )
	BT_ClientAreaInvalidateAll(xGetHeadName(1))


	_ShowWindow( xGetHeadName(2 ) )
	BT_ClientAreaInvalidateAll(xGetHeadName(2))



	xDcBarHeader()



    Do Events

	SysWait(0.05)
    //Do Events

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

Function xRetArray()
Return aMt1 

Function xRetPgNum()
REturn nPageNum
   

Function xCalcPosV(nReg1)

	Local nPos 	  := 0
	Local n1      := xCalcBarV()
	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83

	nPos := Int ((  (nTamBar  - n1)  *  nREg1 ) / Len(aMt1))

Return nPos


Function xCalcBarV()

	Local nCalc := 0

	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83

	If RecCount() == 0
		Return 0
	End If 	


	
	nCalc := nTamBar *  Val(Transform(nTamPag / RecCount() , "999,999.999999"))

	If (RecCount() <= nTamPag)
		nCalc := GetProperty(cBarraVfrm , 'Height') - 135 
	End If 

	If nCalc <= 30
	   nCalc := 30	   
	End If   
	

Return nCalc 

Function xShowBrw(  cTable1 , lDisplay   )

	Local cBrwName        := 'Brw' + Left(cTable1,4) 
	Local cEspelhoBrw     := 'Win_E' + Left(cBrwName,4)
	Local cBarraVfrm 	  := 'Win_R1' +  Left(cBrwName,4)
	Local cBarraVSombra   := 'Win_Resp' +  Left(cBrwName,4)

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

		
		_ShowWindow( xGetBarName(1) )
		BT_ClientAreaInvalidateAll(xGetBarName(1))


		_ShowWindow( xGetBarName(2 ) )
		BT_ClientAreaInvalidateAll(xGetBarName(2))

		Do Events 

		xDcBarH()


	End If 


Return 


Function xRetImgs(  nId  )

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

Function xSaveVars()

	nSave1 := nItemx5

return

Function RetScrPos()

	Local nWidth := xGetColWidth(  nColEsquerda   )	- 3

Return nWidth 

Function xRtColEsq()
REturn nColEsquerda


Function SetLargx(n1 )

 nLargx := n1

REturn 


Function CalcEtapas()

	Local nCol2  := 1
	Local nWidth := 0
	Local nPos2
	Local nLargz1 := nLargx
	Local nRet := 0
	Local nc1 := 0
	Local nColEsq := 1

	//msginfo(Str(  nLargz1    ))


	While .t. 

			nWidth := xGetColWidth(  nCol2   )		
			nPos2 := xGetInfC(   nCol2 , 3  )	

			
			If (nPos2 >= nLargz1) 

				//msginfo(Str( nColEsq  ))


				nWidth := xGetColWidth(  nColEsq   ) - 3
				nc1 += nWidth
			   	nRet++



				nColEsq++   

				//msginfo('lp2')

				If (nC1 >= (nLargTotal - nLargX - 15))			
				    Exit
				End If 

			End If 

			nCol2++


	Enddo 

	nConst2 := int((nLargTotal - nLargX) / nRet)

	//msginfo(Str( nRet ) + '  ' + Str(nConst2) )

	

Return nRet 


Function xSrolUni( nW1  )

    nColScrool += nW1
	SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  nW1    , 2 )			

	Do Events

	UpdHeader(  cHeaderName ,   nW1  )		
	
	xDcToDc()			


	DO EVENTS




REturn 


Function xBarInicio()
REturn (nColEsquerda == 1)	



Function xBarFim()
REturn (nColScrool >= (nLargTotal - nLargX))	

Function DecrLeft()
	nColEsquerda--
Return 	


Function ScrollCol( lFrente , lUpdBar )

				
    Local nColTam 
	Local lFim := .f. 	

	Local nWidth := Iif( nColEsquerda > 0 , xGetColWidth(  nColEsquerda   )	- 3 , 0 )


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
				xGoBarR()
			Else 	
				UpdateBarH( nWidth    )		
			End If 			
		Else 
			If (nColScrool < 21)						
				xGoBarl()
			Else 	
				UpdateBarH(  -(nWidth)    )		
			End If 			
		End If 	
		
    	xDcBarH()
		

	End If 	

	//nAcumTot2 += nHSCrool
	
	Do Events				

	UpdHeader(  cHeaderName ,   Iif( lFrente , nWidth , -(nWidth)  ) )					
	Do Events 


	If (nColEsquerda == 1) .And. (!lFrente)
		UpdHeader(  cHeaderName ,   -15  )					
		Do Events 
	End If 

	xDcToDc()			

	DO EVENTS


REturn nWidth


Function xUpHead(  nValor    )


	UpdHeader(  cHeaderName ,   nValor  )					
	Do Events 

Return 



Function DoScrolly( nVert1 )

	nColScrool += nVert1
	SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -nVert1    , 2 )	

	SysWait(0.02)
	xDcToDc()

	Do Events				


Return 	


Function xRetReg()

	Local c1 := ''
	Local aTams   := Aclone(aTam2)
	Local aTips   := Aclone(aTips2)
	Local aM1     := {}
	Local aResult := {}
	Local aRes2   := {}
	Local nPagNum := 0
	Local aItens := {}

	Local nTam1 := 0
	

	Local n1 := 1


	For n1 := 1 To FCount()
			
		lAtivo := .t.

		aResults := {}
		aRes2	 := {}
		nQAcento := 0
		cValor := ''

	

		If (Alltrim(aTips[n1]) == 'C')
			cValor := &(FieldName(n1))			
			nQAcento := QtAcento(cValor)		

			
			If (Alltrim(cValor) = 'Inativo')
				lAtivo := .f.
			End If

		End If

		If  Alltrim(aTips[n1]) == 'D'
			cValor := Padl(&(FieldName(n1)) ,10)
		End If

		lNum := .f.

		If Alltrim(aTips[n1]) == 'B'
			cValor := alltrim(Transform( &(FieldName(n1)) , "999,999,999.99" ))
			lNum := .t.
		End If

		If ( Alltrim(aTips[n1]) == 'I')
			If (n1 > 1)
				cValor := alltrim( Str( &(FieldName(n1)) ))
				lNum := .t.
			Else
				cValor := Alltrim( Str( &(FieldName(n1))  ) )
			End If
		End If
	
		nTam := If( (nQAcento =  0)   , aTams[n1] ,  aTams[n1] + nQAcento )

		nTam1 += nTam 

		If ( Alltrim(aTips[n1]) = 'C') //.or. ( Alltrim(aTips[nx1]) = 'D')			
			c1 += Padr( (cValor) ,nTam , " " ) + Space(1)
			Aadd(aResults , {   Padr( (cValor) ,nTam , " " )  ,   &(FieldName(n1))  , n1  , nTam }   )
			Aadd(aRes2 ,  &(FieldName(n1))   )
		Else			

			c1 += Padl( (cValor) ,nTam , " " ) + Space(1)
			Aadd(aResults , {   Padl( (cValor) ,nTam , " " )  ,   &(FieldName(n1))  , n1  , nTam }   )
			Aadd(aRes2 , &(FieldName(n1)) )
			Aadd(aRes2 , &(FieldName(n1)) )

		End If		

		//Do Events

	Next
	

	Aadd(aMVisible , {    Len(aMVisible)+1 ,    Recno()   })
	
	Aadd(aItens , { c1 , lAtivo , 0  , aResults , '' , aRes2 , Recno()  , nTam1  , 0 }  )	


Return aItens 


function xReordena( nRecno1 )

	Local nPg1 := 1
	Local n1 := 0
	Local n2 := 0

	
	Local cDump1 := 'Logs\Dump1566_' + StrZero(Random(32322),7) + '.txt'
	

	For n1 := 1 To Len(aMt1)

		
		aMt1[n1][1][3] := nPg1

		If (aMt1[n1][1][7] == nRecno1)
            n2 := nPg1
		End If 

		If Mod(  n1 , nTamPag      ) == 0	
			nPg1++
		End If 

	Next	


	
	Do Events 



	For n1 := 1 To Len(aMt1)
		SaveLog(cDump1 ,  'Pg Num : '  + Alltrim(Str( aMt1[n1][1][3])) + '   ' +   Alltrim(Str( aMt1[n1][1][7]))  + '   ' +  aMt1[n1][1][1]  )
	Next 	



Return n2	

Function xAtuMtreg( cPg , nQt )


	Local nIndi := Ascan(aMatReg ,  { |a| a[1] == cPg   }) 



	If nIndi == 0
		Aadd( aMatReg , {cPg , nQt     })
	Else 
		aMatReg[nindi][2] += nQt 
	End If 


Return 	

Function xRecords(  nRecs , lFrente , lNoq1 )

	Local nCont1 := 0
	Local nTotz := 0
	Local nIndz := 0
	Local lSort := .f. 

	Local nTamz1 := GetTextoTam( ' '  , cActiveJan )
	Local bBlock := { || Eof()}
	

	Local aRet   := {}
	Local nBarra := 0

	Local cDump1 := 'Logs\Dump1566_' + StrZero(Random(32322),7) + '.txt'

	DEFAULT lFrente := .t.
	DEFAULT nRecs := nTamPag 

	DEFAULT lNoq1 := .f. 
	//Local nContador :=



	//SaveLog()


	If !lFrente
		bBlock := { || Bof() }
	End If 

	While !Eval(bBlock)

		  aRet := xRetReg()
		  nBarra++
		  aRet[1][9] := nBarra 

		
		  If nTotz == 0
			 nTotz := (aRet[1][8] * nTamz1)			 
		  End If 	

		  nCont1++	


		  nIndz := Ascan(aMt1 , { |a| a[1][7] == Recno() }  )

		  If nIndz == 0 					

			  aRet[1][3] := nPgNum1

			  xAtuMtreg( Alltrim(Str( nPgNum1 )) , 1 )

			  Aadd(aMt1 , aRet )	
			  
			  If Mod(  Len(aMt1) , nTamPag      ) == 0				 				 
				 If !lNoq1
				    nPgNum1++
				 End If 	
			  End If 	

			  lSort := .t.
		  Else 
			  aMt1[nIndz][1][1]	:= aRet[1][1]	  			  
			  aMt1[nIndz][1][4]	:= Aclone(aRet[1][4] )	  
		  End If 	

		  Do Events 



		  If (nCont1 >= nRecs)
			  Exit 
		  End If 	
		  
		  
		  If  lFrente
		  	  Dbskip()		
		  Else 
			  Dbskip(-1)		
		  End If 

	Enddo




	If (lSort)
		aMt1 := Asort( aMt1 ,,, { |a,b|  a[1][7] < b[1][7]    })
	End If 

	

	For n1 := 1 To Len(aMt1)
	//	SaveLog(cDump1 ,  'Pg Num : '  + Alltrim(Str( aMt1[n1][1][3])) + '   ' +   Alltrim(Str( aMt1[n1][1][7]))  + '   ' +  aMt1[n1][1][1]  )
	Next 	

	

Return nTotz






Function xTeclasBrow()



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

	Local aMVisible1 := Iif( nColScrool >= nLarg1  , xColsVisible(nColScrool) , {} )

	
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


	


	If nMsg == WM_KEYDOWN


		
		If (nWParam == VK_RIGHT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If

				
			nColz1 := xGetColSel()

			If (nColz1 = nQTotCol)
				xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida. ") )
				REturn 
			End If 
			nColz1++

			If nLParam = 15				
				ScrollCol( .t. , .f.  )			
				REturn 
			End If 

			xSelCol( nColz1 )
			DO EVENTS 

			SysWait(0.07)			

			nQTotEt := CalcEtapas()
			

			nWidth := xGetColWidth(  nColz1   )			
			nPos1 := xGetInfC(   nColz1 , 2  )
			nPos2 := xGetInfC(   nColz1 , 3  )	
			lScrool1 := (nPos2 >= nLargz1) 					 

			If (lScrool1)		

				ScrollCol( .t. , .f. )


				//IncContador(.t.)	

				nColz1 := xGetColSel()

				

				If ( nQEtp < nQTotEt)

					IncContador(.t.)	
					UpdateBarH( nConst1     )	
					xDcBarH()                                
					SysWait(0.03)		
					nQEtp++					
					xDcBarHeader()

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

			nColz1 := xGetColSel()			

			SysWait(0.07)

			
			If nLParam = 353
				//msginfo('ok2')
				
				nColEsquerda--

				If nColEsquerda == 0
					nColEsquerda := 1
					xDialog("Coluna numero um Atingida." , .f.)
					Return 0
				End If 

				ScrollCol( .f. , .f.  )	
				Return 
			End If 



			If nColz1 > 1 

				nColz1--

				xSelCol( nColz1 )
				DO EVENTS 
				lScrool1 := (nColz1 < nColEsquerda) 				

				If (lScrool1)
					
					nColEsquerda--

					If nColEsquerda == 0
						nColEsquerda := 1
						xDialog("Coluna numero um Atingida." , .f.)
						Return 0
					End If 

					ScrollCol( .f.  , .f.  )		
					IncContador(.f.)	

					UpdateBarH( -nConst1     )	
					xDcBarH()                                
					SysWait(0.03)	
					xDcBarHeader()

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
		xGoPgDn()
		HMG_CleanLastVirtualKeyDown()
		Do Events
	End If 

	

	If (nWPAram == 33)			
		xGoPgUp()
		HMG_CleanLastVirtualKeyDown()
		Do Events
	End If 



	If (nWParam == VK_DOWN) .or. (lDownMouse)

		lHitt := .f.

		lDownMouse := .f. 
		lHitB := .f.

		nItemx5++
		DbSkip()	


		
		If Eof()
			DbSkip(-1)			
			Return
		End If 	

		If nLinhaBarra >= nTamPag
			lHitB := .t.
		Else
			nLinhaBarra++
		End If
		

		If (lHitt)
			nItemx5 := 1
		End If		
		
		If (!Eof())
		

			If (lHitB) .And. (!Eof())

				SysWait(0.01)	
				
				nLinhaBarra := nTamPag
				aRet := xRetReg()	 
				aRet[1][3] := nPgNum1

				nIndz := Ascan(aMt1 , { |a| a[1][7] == Recno() }  )

				If nIndz == 0 					
					Aadd(aMt1 , aRet )			

					aMt1 := Asort( aMt1 ,,, { |a,b|  a[1][7] < b[1][7]    })		

					aRet[1][3] := nPgNum1					
					xAtuMtreg( Alltrim(Str( nPgNum1 )) , 1 )

					If Mod(  Len(aMt1) , nTamPag      ) == 0												
						nPgNum1++
					End If 		 
					nLastadd := Len(aMt1)								

					Do Events 
					

				End If 	

				nPageNumber := aRet[1][3]
			
	
				SysWait(0.01)				
				EncheMVis( Recno()  , .f. )	
				ScrolUp1(.f.)					
				xSelItem( Recno()  )
				SysWait(0.01)

			Else							

				xSelItem( Recno()    )							
				SysWait(0.01)			
				

			End If		


		Else

		//	nLinhaBarra--
			nItemx5 := Recno()
			xDialog('Maximo Atingido! ' + Str(nLinhaBarra) + '   ' + Str(nItemX5)   , .F.  )
			//nLinhaBarra := nTamPag 
			lHtb := .t.
			
			lHtt := .f.
			//xWaitDlg()

				
		End If

		//DO EVENTS

		BT_ClientAreaInvalidateAll (cBarraVfrm)		
		xDcToDc()				
		xDcToDEspe()	

	//	SysWait(0.01)

	End If


	If (nWParam == VK_UP) .or. (lUpMouse) 			

		

		lUpMouse := .f. 

		If (!Bof())
			
			DbSkip(-1)
			nItemx5--			
		
			
			lHitt := .f.
			lHitB := .f.


			If (nLinhaBarra = 1)				
				lHitt := .t.
			Else
				nLinhaBarra--
			End If


			If (lHitt) .And. (!Bof())
			
				nIndz := Ascan(aMt1 , { |a| a[1][7] == Recno() }  )								
			

				If nIndz == 0 					

					nRec := Recno()		
					aRet := xRetReg()
					aRet[1][3] := nPgNum1					
					xAtuMtreg( Alltrim(Str( nPgNum1 )) , 1 )
					
					Aadd(aMt1 , aRet )					
					If Mod(  Len(aMt1) , nTamPag      ) == 0												
						nPgNum1++
					End If 		   

					aMt1 := Asort( aMt1 ,,, { |a,b|  a[1][7] < b[1][7]    })					

					Do Events 
					SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , nItemBrwHeight  , 1 )					
					BT_ClientAreaInvalidateAll(cBrowserName)

					nPageNumber := aRet[1][3]

				Else 
					ScrolUp1(.t. )					
				End If 		
				

				EncheMVis( Recno()  , .t. )				
				xSelItem( Recno()  )
				nSelLine := nItemx5	
				SysWait(0.01)


			Else
		

				SysWait(0.01)				
				xSelItem( Recno()  )
				SysWait(0.01)				


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


Function xGetReg1( nPageNum )

	 Local nQt := 0	
	 Local nindi := AScan(aMatReg , { |a| a[1] == Alltrim(Str(nPageNum))}   )


	 If nIndi > 0
		nQt := aMatReg[nindi][2]
	 End If  	

	 If nQt > nTamPag
		nQt := nTamPag 
	 End IKf 	


REturn nQt 

Function ScrolUp1( lUpDir  , nQtd1 )

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






function GetTextoTam( cMsg  )

	Local  FontHandle := _SetFont ( GetControlHandle( 'LblMsg1' , cActiveJan ), FONTBROWSER,  FONTBROWSERSIZE  , .f. , .f. ,.f. ,.f. )

Return (GetTextWidth(  0,  'L' , FontHandle  )   )

	//   xPaintBrowser( , aMt1 , nItemx1 ,     nClearIt2 ,  lHitB , lHitT  )



Function xPaintBrowser( cForm , aMtrOp ,  nOpselx1 , nClear1 , lBrwEnable )


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
	Local nIt1 := 0
	

	DEFAULT lBrwEnable := .t. 


	nRow := -(nLinScrool)
	nCol := -(nColScrool)

	
	//hBitMap2 := BT_BitmapCreateNew (Width  , Height , WHITE )
	hDC2 := BT_CreateDC (cForm ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)

	If (nOpselx1 = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width  ,    Height    , WHITE , WHITE  )
	End If

	If (nClear1 > 0)

	
		
		nIt1 := Ascan(aMVisible , { |a| a[2] == nClear1    })

		If nIt1 > 0 

			nItem2 := aMVisible[nIt1][1]

			If (Mod( nItem2, 2 ) = 0)
				nCor := WHITE
			Else
				nCor := CORBROWSE
			End If

			BT_DrawGradientFillVertical ( hDC2 ,   (nItem2  * nItemBrwHeight)    , 0  , Width  ,    nHeightBmp     ,  nCor  , nCor   )
		End If 	


	End If

	nIndice := -9999
	
	

	For n1 := 1 To Len(aMtrOp) 


		cTexto :=  StrZero(aMtrOp[n1][1][3],5)   + Alltrim(Str(nRow ))  + '  ' + Hb_Utf8ToStr(aMtrOp[n1][1][1]) + Replicate(' ',200)
		
		//Alltrim(Str(nLine + nRow )) + '   '  + Alltrim(Str(nRow )) + '  '   + Alltrim(Str(nLine ))  + ' ' + ;
		//Alltrim(StrZero(n1,3)) + '  '  + Hb_Utf8ToStr(aMtrOp[n1][1][1]) + Replicate(' ',200)
		//nLinb++

		//msginfo(Str(Len(aMtrOp)))

		


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

		If (nOpselx1 > 0) .And. (Recno() == aMtrOp[n1][1][7]   )
			//(nOpSelx1 = n1)   

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


			If !aMtrOp[n1][1][2]
				cCor := CorDisabled
				nTypeText    :=  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT				
			End If

			BT_DrawText ( hDC2 , nLine + nRow  , 17+nCol  ,  cTexto , xFont2, 9 ,  cCor , nCorBk , nTypeText, nAlingText, nOrientation )

		End If


		nLine += nItemBrwHeight

		//msginfo(Str(nItemBrwHeight   ))

	Next

	BT_DeleteDC (BTstruct )


Return



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



Function xCriaButs()

	Local cJanx := cBarraVfrm

	Local nRow1 := GetProperty(cBarraVfrm,'Height') - 20


   
Return (nRow1 - 46)


Function xLimpBarV()

	lTracking75 := .f. 
	lTracking135 := .f.
	nHasFocus := 0				
	
	//xRefreshBut()				

	Do Events 	
	BT_ClientAreaInvalidateAll( cBarraVfrm )

	xDcToDEspe()											
	Do Events 	
		



REturn 

Function xDoPesq( cCampo1  , cBrwName , cValor  )

	Local cSqlp  := GetSql( cTabela  , .f. )
	Local aCabec  := GetCamposDic( cTabela, 'N', .f. , .f. )
	LOCAL aCampos := GetCamposDic( cTabela, 'N', .t. , .f. )
	Local nindice 
	Local cSalva := Alias()
	Local nInd1 
	Local nRecSalva := Recno()

	LOCAL cAlias1 := 'T_' + Left(Alltrim(Str(Int( hb_Random( 234355 ) ))),4)
	Local nRec1 := 0
	Local nRt1 := 0

	nClearIt2 := Recno()


	//Msginfo(Hb_UTF8ToStr(aCabec[1]) + '   ' + cCampo1 )

	//msginfo(Str(nPageNumber)  )





	If _isWindowDefined( cBrwName  )
		
		If Hb_UTF8ToStr(aCabec[1]) == Alltrim( cCampo1) 
			nIndice := 1
		Else 
			nindice := Ascan(aCabec , Alltrim( Hb_UTF8ToStr(cCampo1))   )
		End If 

		csqlp := "Select Numreg from " + cTabela + "  Where " + aCampos[nindice] + " = " + QuotedStr(Alltrim(cValor)) 

		
		SaveLog('Sqlp.Txt' , cSqlp )		
		dbUseArea( .T.,,  cSqlp , cAlias1 )
		dbSelectArea( cAlias1 )
		dbGoTop()



		If Eof()

			dbSelectArea( cAlias1 )
			Use 

			xDialog( Hb_Utf8ToStr("Pesquisa Não Localizada.")   , .f.  )
			DbSelectArea(  cSAlva  )	

		Else 

			nRec1 := NumReg 
			
			dbSelectArea( cAlias1 )
			Use 
			DbSelectArea(  cSAlva  )			

			DbGoto(nRecSalva)

			If ( nRec1 <= nTamPag)					

				nInd1 := Ascan(  aMVisible , { |a|  a[2] == nRec1   }   )

				If nInd1 > 0				
					nLinhaBarra := aMVisible[   nInd1  ][1]					
					DbGoto(        aMVisible[   nInd1  ][2]	   )				
				End If 					
	
				nItemx5 := 	Recno()
				nSelLine := nItemx5			
	
				lHitb := (nLinhaBarra = nTamPag)
				lHitt := (nLinhaBarra = 1)			
				Do Events
				xDcToDc()			
				Do Events				

			Else 				


				nIndz := Ascan(aMt1 , { |a| a[1][7] == nRec1 }  )		

				If (nIndz == 0)

					DbGoTo( nRec1 - 1)
		
					EncheMVis( Recno() + 1   , .t. )			
					DbSkip()							
					

					If !Eof()						

						nLinhaBarra := 1

						If (nLinScrool != 0)		
							nPgNum1 := aMt1[LEn(aMt1)][1][3] + 1 
							nPageNumber := nPgNum1									
						End If 							

						aMt1 := {}
						aMatReg := {}
						nPgNum1 := 1

						nLinScrool := 0

						
						xRecords(  , ,    )
						
						DbGoTo( nRec1 )
						nSv1 := 0
						nRt1 := 0				
				

						nItemX5     := Recno()			
						nClearIt2   := Recno()
						nClear1     := nItemX5	
						nSelLine    := nItemx5		

						If nSv1 > 0
							nPgNum1 := nSv1 
						End If 												

						SysWait(0.01)					
						xSelItem( Recno()  , .t. )


						//BT_ClientAreaInvalidateAll(cBarraVfrm)


						BT_ClientAreaInvalidateAll(cBrowserName)
						SysWait(0.02)						

						Do Events
						xDcToDc()			
						Do Events		
	
							
						SysWait(0.02)

					Else 			
						xDialog("Fim do Arquivo Atingido!" , .f. )
					End If 	


					//msginfo(Codigo )



				Else 

					nPg1   := aMt1[nIndz][1][3]
					nLBar  := aMt1[nIndz][1][9]

					n1 := nRec1 - (nLBar - 1)
					DbGoto(   n1 )  
			

					EncheMVis( Recno()   , .t. )	
					
					nLinhaBarra := nLBar	
					DbGoto(nRec1)

					nClearIt2 := Recno()


					lHitb := (nLinhaBarra = nTamPag)
					lHitt := (nLinhaBarra = 1)		


					If (nPageNumber != nPg1) 
					
						Do Events 
						nLinScrool := ((nPg1 - 1) *  (nItemBrwHeight * nTamPag) )
						SysWait(0.01)						
						
					End If 	
					


					xSelItem( Recno()  , .t. )

					//BT_ClientAreaInvalidateAll(cBarraVfrm)
					
					
					BT_ClientAreaInvalidateAll(cBrowserName)

					Do Events
					xDcToDc()			
					Do Events		

					n2 := nRec1 + (nTamPag - nLBar)

					SysWait(0.02)
					
					nPageNumber := nPg1 


				//	msginfo('Found! '  + Str(nPg1) + '  ' + Str(nPageNumber) + '   ' + Str(nLBar) + '   ' + Str(n1) + '    ' + Str(n2) )


				End If
				
				
			End If 


		End If 





		//msginfo( cAlias1 + '  '  + cSqlp)

	End If 


REturn 	



Function EventBrowser( nHWnd, nMsg, nWParam, nLParam )

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


	
	IF nHWnd == GetProperty(  cActiveJan   , "HANDLE" )				
		If nMsg == WM_MOUSEMOVE

			xLimpBarV()

			


			GetCursorPos (@nCol1, @nRow1)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow1, nCol1 )
			hWnd := WindowFromPoint ( ar1[1] , ar1[2])


			If (lHasHeader)
				xApagueH( cHeaderName )
				xLimpMode()
				DO EVENTS 
				xDcBarHeader()
				DO EVENTS 
				xDragOff()				
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
				xApagueH( cHeaderName )
				SysWait(0.03)
				xDcBarHeader()
				SysWait(0.03)
				//msginfo('ok2')

				xDragOff()				
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
				xLimpBarV()
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
			
				nModeBrw := xDoHint(   nId  ,  , .t.  )			
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
				//OBTN_Draw( nHWnd,  nwParam, nLParam , (  nHasFocus == nWParam  )  ,  xRetImgs(  nWParam  ) , .f. , 20 ) 				
			End If
		End If 	


	End If



	If (nHWnd == GetProperty( cEspelhoBrw , "HANDLE" ))

		//msginfo('lp2')

		If nMsg == WM_MOUSELEAVE
			nClearIt2 := 0
			nitemx5   := 0


			BT_ClientAreaInvalidateAll(cBrowserName)
	
		End If


		If nMsg == WM_MOUSEMOVE

		//	msginfo('d2')

			If (lHasHeader)
				xApagueH( cHeaderName )
				DO EVENTS 
				xDcBarHeader()
				DO EVENTS 
				xDragOff()				
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
				xOffBarra( cBarrah  )

			Else 
			End If 		          
			If  _isWindowDefined("Win_Msg")
				xHidehint()
			End If

		End If 

		        

		If nMsg == WM_LBUTTONDOWN

			nItem := xGetPos(cEspelhoBrw)

			If (nItem > Len(aMt1)) .or. (nItem <= 0)				
				Return 	
			End If 		


			DbGoto(   aMt1[nItem][1][7]    )			
			nRow1 := -(nLinScrool)			

			
			nInd1 := Ascan(  aMVisible , { |a|  a[2] == Recno()   }   )

			If nind1 > 0
				nLinhaBarra := aMVisible[   nInd1  ][1]					
			End If



			nItemx5 := 	nItem
			xSelItem( nItem  , .t. )


			nClearIt2 := Recno()

              
             /*
			If nClearIt2 > 0
				xLimpSub(cBrowserName ,  @nClearIt2 ,  nItemx5 , 0 ,   nItemBrwHeight , GetProperty(  cBrowserName,'Width')  , -(nLinScrool) )
			End If
			nItemx5 := 	nItem
			nClearIt2 := nItemx5
			If (nItemx5 > 0)
				BT_ClientAreaInvalidateRect(cBrowserName ,  nRow1  +  ( ( nItemx5 - 1 ) * nItemBrwHeight)  , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight   , .t. )
			End If

			*/ 
			nSelLine := nItem		


			lHitb := (nLinhaBarra = nTamPag)
			lHitt := (nLinhaBarra = 1)			
			Do Events
			xDcToDc()			
			Do Events


		End If

	End If

Return




Function xDoHint(   nIdBut , cMsg , lNoHint   )

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



Function xRefreshBut()

	
	Local n11 := xCriaButs()


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

Function xButsOffs()
/*
	PostMessage(OBTN_Handle(  'Win_Role1' , 855   )  , WM_MOUSELEAVE , 0, 0  )															
	//Do Events 


	PostMessage(OBTN_Handle(  'Win_Role1' , 856   )  , WM_MOUSELEAVE , 0, 0  )															
//	Do Events 


	PostMessage(OBTN_Handle(  'Win_Role1' , 857   )  , WM_MOUSELEAVE , 0, 0  )															
	//Do Events 

	PostMessage(OBTN_Handle(  'Win_Role1' , 858   )  , WM_MOUSELEAVE , 0, 0  )															
//	Do Events 


	PostMessage(OBTN_Handle(  'Win_Role1' , 859   )  , WM_MOUSELEAVE , 0, 0  )															
	//Do Events 

	PostMessage(OBTN_Handle(  'Win_Role1' , 860   )  , WM_MOUSELEAVE , 0, 0  )															
	Do Events 
	*/

REturn 



Function xSelItem( nItem1 , lRefresh)

	Local nRow1 := 0
	Local nItem := nItem1
	Local nR := 0
	Local nI := 0
	Local nLBar := 0
	Local nIndice1
	Local nRec := Recno()
	
	Default lRefresh := .f.
	

	If (nClearIt2 > 0) 	


		
		DbGoto(nClearIt2)
		nIndice1 := Ascan(aMVisible , { |a| a[2] == Recno() })

		If nindice1 > 0			
			nLBar := aMVisible[nindice1][1]			
		End If 

		DbGoto(nRec)
		BT_ClientAreaInvalidateRect( cBrowserName , ( (nLBar - 1) * nItemBrwHeight )        , 0 , GetProperty( cBrowserName,'Width') ,  nItemBrwHeight   , .t. )						

	End If


	
	//SysWait(0.01)




	nItemx5 := nItem

	If nItemx5 > 0
		nClearIt2 := Recno()
	Else
		Return
	End If	



	If nLinScrool > 0
		nRow1 := -(nLinScrool)		
	End If


	nSelLine := nItemx5

	If (nItemx5 > 0)		

		nRow1 := 0		
		BT_ClientAreaInvalidateRect( cBrowserName,  ( (nLinhaBarra - 1) * nItemBrwHeight) - nRow1    , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight   , .t. )
		
	End If

	nPerCent := ( Recno() /  Reccount()  ) * 100

/*

	nI := 63
	nR := (nTamPag * nItemBrwHeight) - 83

	BT_ClientAreaInvalidateRect(cBarraVfrm   ,  nI  ,0,  20,  (nR - nI) + 45  , .t.  )
	*/

	SysWait(0.02)

	If lRefresh
		SysWait(0.04)
	End If 	

	BT_ClientAreaInvalidateAll(cBarraVfrm)  
	

	If lRefresh
		SysWait(0.04)
	End If 	
	
	xDcToDc()				
	xDcToDEspe()	




Return


Function xOffBarVert( nWh1 )
	

	lTracking75 := .f. 
	lTracking135 := .f.
	nHasFocus := 0		
	nModeBrw := 0		
	
	//xRefreshBut()				

	Do Events 	
	BT_ClientAreaInvalidateAll( cBarraVfrm )

	xOffBarra( cBarrah  )

				//xLuzOff( cBarrah )
	xDcToDEspe()											
	Do Events 				
				
	If  _isWindowDefined("Win_Msg")
		xHidehint()
	End If

	Do EVENTS


Return 




Function xPaintScroll( cJanela )

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
	Local yBmp4
	//Local zRolagem := BT_BitMapLoadFile('ROLAGEM')


	

	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)


	Local nRow1 := Height - 20

	Local n11 := xCriaButs()

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
		
		
		If (Recno() == nMaxItem1 )	
			nAltura := xCalcBarV()
			BT_DrawFillRoundRect ( hDC , nLimteLin - nAltura ,  2   , Width - 5 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 								
		Else	


			yPos := nLimteLin - nRIni - nAltura
			nFator := Int(( Recno() * yPos     ) /	RecCount())

			If (RecCount() <= nTamPag)
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

		aImgs := xRetImgs(  aMtrz1[n1]   )
	

		If (aMtrz1[n1] >= 858) .And. ( !lFlag	)
			nLinha := n11			
			lFlag := .t. 
		Else 
			
		End If 	


		cImg := aImgs[1]


		If (nHasFocus == aMtrz1[n1] )
			cImg := aImgs[2]						
		End If 	

		
		If (nPageNumber == 1) .And. (Recno() <= nTamPag)	
			If (aMtrz1[n1] >= 855) .And. (aMtrz1[n1] <= 857)
				If (aMtrz1[n1] = 855)
					If (Recno() == 1) 						
						cImg := aImgs[4]
					End If 					
				Else 
					cImg := aImgs[4]	
				End If 
			End If 	
		End If 


		If (nPageNumber == nPageTotal)					  
			If (aMtrz1[n1] >= 858) .And. (aMtrz1[n1] <= 860)
				If (aMtrz1[n1] = 860)
					If (Recno() == nMaxItem1) 						
						cImg := aImgs[4]
					End If 					
				Else 
					cImg := aImgs[4]	
				End If 
			End If 	
		End If 

		

		yBmp4 := BT_BitMapLoadFile( cImg   )

		BT_DrawBitmap (hDC  , nLinha  , 0  	, 18  , 18  ,      BT_COPY,   yBmp4  )	    
		nLinha += 21

		
		BT_BitmapRelease ( yBmp4 )


	Next 	

	BT_DeleteDC (BTstruct2 )

	
	BT_BitmapRelease ( yBmp1 )
	BT_BitmapRelease ( yBmp2 )
	BT_BitmapRelease ( yBmp3 )

	BT_BitmapRelease ( zBmp1 )
	BT_BitmapRelease ( zBmp2 )
	BT_BitmapRelease ( zBmp3 )



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



Function xGoPgUp()

	Local nPos1 := 0
	Local nLast1 
	//Local nPageNum := aMt1[nItemx5][3]
	Local nI 
	Local nn1 := 0
	Local nRec1
	Local nDiff1 


	//nPageNumber := Int(Recno() / nTamPag)	

	
	If (nPageNumber = 1 )	
		xDialog("Inicio das informações Atingido." , .f. )
		Return 
	End If 	

	
	If (nPageNumber = 2)
		nPageNumber := 1
		xGoTop()		
		Return 
	End If 	
	
	
	lHitB := .f.
	lHitt := .f.

	nRec1 := 0

	SysWait(0.02)



	If (aMVisible[1][2] > aMVisible[nTamPag][2] )
		nRec1 := aMVisible[nTamPag][2]	
	Else 
		nRec1 := aMVisible[1][2]
	End If 


	DbGoto(nRec1 )	

	
	SysWait(0.01)		
	EncheMVis( Recno() - nTamPag , .t. )
		
	DbSkip(-1)		

	//msginfo('kk2')

	DO EVENTS

	

	If !Bof()

		
		nIndz := Ascan(aMt1 , { |a| a[1][7] == Recno() - nTamPag }  )				
		xRecords(   , .f. )
		
		If (nIndz > 0) .or. (nTamPag > Recno())					
			ScrolUp1(.t. ,(nItemBrwHeight * nTamPag) )	

		Else 		

		End If 	
		

		SysWait(0.09)	
		nItemX5     := Recno()
		nClearIt2   := Recno()
		

		nSelLine := Recno()	
		nLinhaBarra := 1 

		Do Events
		nPageNumber--	
		nIndz := Ascan(aMt1 , { |a| a[1][7] == Recno() }  )

		BT_ClientAreaInvalidateAll(cBrowserName)
		nDiff1 := (nLinScrool - (nItemBrwHeight * nTamPag))

		If (nDiff1 != 0) .And. (nDiff1 < 1000)			
			//ScrolUp1(.t. ,nDiff1)	
		End If 	


		
	//	SysWait(0.04)

	Else 
		xDialog("Inicio das informações Atingido." , .f. )		
	End If 	

	

	SysWait(0.01)	
	BT_ClientAreaInvalidateAll (cBarraVfrm)		
	
	BT_ClientAreaInvalidateAll(cBrowserName)


	
	Do Events 


	xDcToDc()				
	xDcToDEspe()

	//msginfo('ok22')

	
	SysWait(0.01)			
	
		

Return 






Function xGoPgDn()

	Local nPos1 := ( (nPageNumber *  nTamPag) * nItemBrwHeight)
	Local nLast1 
	Local ni := 0
	Local nN1 := 0
	//Local nPageNumber := aMt1[nItemx5][3]
	Local nResto := Mod( nMaxItem1 , nTamPag)
	Local nRec1


	
	//nPageNumber := Int(Recno() / nTamPag)+1

//	nPos1 := ( (  (nPageNumber )  *  nTamPag) * nItemBrwHeight)

/*
	If ( nPageNumber = nPageTotal )		 			
		xDialog(  Hb_AnsiToOem("Final das informações Atingido.") , .f. )
		Return 
	End If 	
	*/



	
	If ( nPageNumber >= (nPageTotal - 1) )		 			
		xGoBottom()
		Return 
	End If 	


	lHitB := .f.
	lHitt := .f.

	SysWait(0.07)						
		
	ScrolUp1(.f. , nItemBrwHeight * nTamPag)			
	nIndice := 1

	If nIndice > 0
		//msginfo(Str(   aMVisible[nIndice][2]          ))

		nLinhaBarra := 1
		nN1         := aMVisible[nTamPag][2] + 1
		

		If (aMVisible[1][2] < aMVisible[nTamPag][2] )
			nRec1 := aMVisible[nTamPag][2]	
		Else 
			nRec1 := aMVisible[1][2]
		End If 
		
		DbGoto( nRec1   )
		EncheMVis( Recno() + 1  , .t. )			
		DbSkip()
	

		If !Eof()
			
			
			xRecords()
			nItemX5     := Recno()			
			nClearIt2   := Recno()
			nClear1     := nItemX5	
			nSelLine := nItemx5		
			nLinhaBarra := nTamPag 

			nPageNumber++
			BT_ClientAreaInvalidateAll(cBrowserName)

			//msginfo(Str(  nPageNumber  ))



			SysWait(0.03)						

		Else 			
			xDialog("Fim do Arquivo Atingido!" , .f. )
		End If 	
		
	Else 
		
		msginfo("Error em R1")

	End If 	


	BT_ClientAreaInvalidateAll (cBarraVfrm)		
	//Do Events 

	xDcToDc()	
	xDcToDEspe()

	
	SysWait(0.07)	
	
Return 








Function xGoBottom()


	Local nPos1 := (nTamPAg * nItemBrwHeight)  	
	Local nSav := nLinScrool
	
	
	nPageNumber := Int(Recno() / nTamPag)+1
	
   
	If ( nPageNumber = nPageTotal )		 			
		xDialog(  Hb_AnsiToOem("Final das informações Atingido.") , .f. )
		Return 
	End If 		


	If Eof()
		xDialog(  Hb_AnsiToOem("Final das informações Atingido.") , .f. )
		Return
	End If 		

	If (nMaxItem1 < nTamPag)
		xDialog(Hb_AnsiToOem("Já Posicionado na Ultima Pagina.") , .f. )
		Return
	End If 

	nItemX5 := nMaxItem1

	/*


	xCursorWait( .t. )	

	nLinScrool := 0

	aMt1 := {}
	DbGotop()

	*/
	




	nPageNumber := nPageTotal

	
	nLinScrool := (nTamPAg * nItemBrwHeight) 

	aMt1 := {}
	aMatReg := {}
	
	nPgNum1 := 1
	
	xRecords()	
	SysWait(0.01)

	//ScrolUp1(.f. ,  nPos1 )			
	dbGoBottom()		
	
	
	SysWait(0.01)		
	DbGoto(   Recno() - nTamPag + 1          )

	
	
	aMVisible := {}
	xRecords()    
	
	nLinhaBarra := nTamPag
	nItemX5     := Len(aMt1)

	nClearIt2   := Recno()

    
	dbGoBottom()

	SysWait(0.03)	


	//msginfo(Str(Recno()))



	nSelLine := nItemx5	
	BT_ClientAreaInvalidateAll(cBrowserName)

	SysWait(0.01)			


	Do Events

	xSelItem( Recno() , .t.  )
	//BT_ClientAreaInvalidateAll(cBarraVfrm)


	xDcToDc()	
	xDcToDEspe()


	DoMethod(cBrowserName , 'SetFocus')
	DO EVENTS


//	xCursorWait( .f. )	
	//SysWait(0.06)


Return



Function xGoTop( lScrol1 )


	Local nPos1 := (nTamPAg * nItemBrwHeight) 

	DEFAULT lScrol1 := .f. 

	If Bof()
		xDialog("Inicio das informações Atingido." , .f. )
		Return
	End If 		

	If (nMaxItem1 < nTamPag)
		xDialog("Já Posicionado na Primeira Pagina." , .f. )
		Return
	End If 

	xCursorWait( .t. )	


	nLinScrool := 0

	nPgNum1 := 1

	nPageNumber := 1

	aMatReg := {}

	aMt1 := {}
	DbGotop()

	
	xRecords()	

	SysWait(0.01)

	
	SysWait(0.01)		
	DbGotop()
	
	EncheMVis( Recno() , .t. )	
	   
	
	nLinhaBarra := 1
	nItemX5     := 1

	nClearIt2   := Recno()
	nClear1     := nItemX5

	nSelLine := nItemx5		
	BT_ClientAreaInvalidateAll(cBrowserName)
	SysWait(0.01)			

	Do Events
	//BT_ClientAreaInvalidateAll(cBarraVfrm)

	xSelItem( Recno() , .t.  )

	xDcToDc()	
	xDcToDEspe()

	xCursorWait( .f. )	

	SysWait(0.01)



REturn


Function xBrwRefresh(cFormObj)

	Local nRec1 := Recno()
	Local cAlias  := "T_" + Left(cTabela,3)


	Use 

	SysWait(0.03)

	
	dbUseArea( .T.,,  cSqlp , cAlias )
	dbSelectArea( cAlias )

	

	//msginfo(RddName())

	xCursorWait(.t.)

	
	If _isWindowDefined(cFormObj)		

		DbGoto( aMVisible[1][2]  )	
		xRecords()	


		DbGoto(nRec1)
		BT_ClientAreaInvalidateAll(cBrowserName)
		SysWait(0.01)			


		Do Events
		BT_ClientAreaInvalidateAll(cBarraVfrm)

		xDcToDc()	
		xDcToDEspe()

	End If 

	xCursorWait(.f.)
	

Return 



Function xDcToDEspe()

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




Function xDcToDc()

	Local Width1  := BT_ClientAreaWidth  (cBrowserName)
	Local Height1 := BT_ClientAreaHeight (cBrowserName)

	Local hBit20 

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


	//BT_BitmapSaveFile (hBit20  , "hBit20.bmp")

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)
	BT_ClientAreaInvalidateAll (cEspelhoBrw)

Return 

Function xSaveBmp()

	Local hDc := GetDc(cBrowserName)

Return
/*
Function EventRole1()

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	Local nLParam  := EventLPARAM()

	Local cFormx := 'Win_Role1'

	Local nIdBut := 0
	Local n1 

	Local i 

	Local nSvfocus := nHasFocus 

	Local cTp1 := ''

	Local nRow , nCol 

	If !_IsWindowDefined(cBarraVfrm)
		Return 
	End If 

	
	For i := 1 To 255
		GetAsyncKeyState(i)
	Next i


	
	For n1 := 855 TO 860
		If ( OBTN_Handle( cBarraVfrm, n1 ) == nHWnd )
			If (nIdBut == 0)
				nIdBut := n1			
			End If 
		End If
	Next	



	If (nIdBut > 0)

	
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
				

				//Do Events 
				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_UP , 0 )				

				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 				

			End 

			
			While (nModeBrw = 6) .And. (!lTracking45)
				//Do Events

				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_DOWN , 0 )				


				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 				
						
			End  


			While (nModeBrw = 5) .And. (!lTracking45)
			
				SysWait(0.02)
				xGoPgDn()				
				SysWait(0.02)

				
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 			
				
			End If 



			While (nModeBrw = 2) .And. (!lTracking45)
	
				SysWait(0.02)
				xGoPgUp()
				SysWait(0.02)

					
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 			

			End 

			lTracking45 := .f. 
			SysWait(0.09)
			SendMessage(  OBTN_Handle( cBarraVfrm , nHasFocus ) , WM_MOUSELEAVE , 0,0)


		End If 



		
		If (nMsg == WM_LBUTTONUP)			
	

			Do Events

			nHasFocus := 0

			lTracking45 := .t. 
			//msginfo('up222 ')


			Do Events
			Do Events

		End If 
		


		If ( nMsg == WM_MOUSEMOVE ) .and. (!lTracking135)


			If (nHasFocus = nIdBut)
				REturn 
			End If 
		
			nHasFocus := nIdBut


			OBTN_Color( cFormx, nIdBut, RetColor1( 2 ), .T. )

			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

			cTp1 := ''

			
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
		
			Do Events 

			

			GetCursorPos( @nCol , @nRow )

			
			If !_isWindowDefined("Win_Msg")
				CrieJanTip( nRow  , nCol - 250   ,   Alltrim(cTp1)      ,, 0.5 )
			Else
				xDispHint( cTp1 , nRow ,  nCol - 250  )
			End If

			xDispUpTam(cTp1 )

			BringTop('xHint')

			lTracking135 := .t.
			lTracking75  := .t.
			//TrackMouseEvent( nHWnd ) // TME_LEAVE is default flag


		End If

		If ( nMsg == WM_MOUSELEAVE )
			
			
			If nHasFocus > 0
				OBTN_Enable( cFormx, nSvFocus, .T. )
				OBTN_Visible( cFormx, nSvFocus, .T. )
				Do Events 							
			End If 		

			nHasFocus := 0
			nModeBrw := 0


	
			OBTN_Color( cFormx,  nIdBut, RetColor1( 1 ), .T. )
			OBTN_Enable( cFormx, nIdBut, .T. )
			OBTN_Visible( cFormx, nIdBut, .T. )

			lTracking135 := .F.
			lTracking75  := .f.
				

			//msginfo('k2')

			SysWait(0.05)


		End IF




	End If 




Return 
*/

Function xCursorWait( lOn )


	If lOn 
		//SetWindowCursor( GetFormHandle( cFormPrin )  , 'CURSOR1'  )
		SetWindowCursor( GetFocus()  , 'CURSOR1'  )
		
	Else 

		//SetWindowCursor( GetFormHandle( cFormPrin )  , IDC_ARROW  )
		//SetWindowCursor( GetFormHandle(cEspelhoBrw )  , IDC_ARROW  )	

		SetWindowCursor( GetFocus()  ,IDC_ARROW  )
		
		
	End If 	


	Do Events
					


Return 

