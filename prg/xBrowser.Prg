
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




Static cHeaderName  := ''
Static cHSombraName := ''




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

Static nLargX := 0

Static cBarrah := ''

Static lHasHeader := .f. 

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

	cSq2 += " order by codigo limit 500"


	If (Select(calias) > 0)
		dbSelectArea( cAlias )
		Use
	End If


	cSqlx2 := cSqlx1
	SaveLog("st121.txt" , cSq2 + XQUEBRA )

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
				cValor := alltrim(Transform( oRow:FieldGet(nx1) , "@E 999,999,999.99" ))
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
			Else
				Aadd(aM1 , { Padl( (cValor) ,nTam , " ")  ,  nTam          }  )
			End If

			Do Events

		Next


		c1 := ''
		Aeval(aM1 , { |a|  c1 += ( a[1] + ' '  )     })
		c1 += "."

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

		Aadd(aItens , { c1 , lAtivo , nPagNum }  )
		
	Next


	oServer:Destroy()
	oServer := Nil

	oQuery:Destroy()
	oQuery := Nil

	aMResult := Aclone(aItens)
	lTermino := .t.


Return aItens

Function EncheMVis( nRec , lFrente , lCalcPage  )


	Local N1 := 1
	Local nAcum := nRec
	Local z1 := nTamPag

	Default lFrente := .f.
	Default lCalcPage := .t. 

	aMVisible := {}

	If !lFrente
		For n1 := 1 to nTamPag
			Aadd(aMVisible  , {    z1  ,   nAcum         })
			z1--
			nAcum--
		Next
	Else
		For n1 := 1 to nTamPag
			Aadd(aMVisible  , {    n1  ,   nAcum         })
			nAcum++
		Next
	End If

Return


Function xBrowser( nRowIni ,  aDatas1 , cParent   , nLarg1  , cBrwName , nCol  , aCabecalho , aTamanhos , aTipos)


	Local nTamWidth := xRetLargura()
	Local nTam1 := GetTextoTam( ' '  , cActiveJan )
	Private aOpx1 := 0
	DEFAULT nLarg1  := GetDeskTopWidth() - 40
	DEFAULT nCol := 10
	DEFAULT nRowIni   := 145
	DEFAULT aCabecalho := {}



	//msginfo(Str(  nLarg1  ))


	nLargx := nLarg1 

	aMt1      := Aclone(aDatas1)
	nMaxItem1 := Len(aDatas1)
	nItemBrwHeight := nItemSubHeight - 5
	nItemScrool := 0
	nLargTotal := nTamWidth
	lNoHorzScr := .f.
	hBitOk 	   := BT_BitmapLoadFile ('OKMARK')

	EncheMVis( nTamPag  , , .f.  )


	cBrowserName  := cBrwName
	//'Win_Browser'
	cEspelhoBrw   := 'Win_E' + Left(cBrowserName,4)
	cBarraVfrm 	  := 'Win_R1' +  Left(cBrowserName,4)
	cBarraVSombra := 'Win_Resp' +  Left(cBrowserName,4)


	cHeaderName := 'Win_Header' + Left(cBrowserName,4)

	
	

	If Len(aDatas1) > 0 
		nLArg1 := (Len( aDatas1[1][1]) * nTam1)+18
		If (nLarg1 > GetDeskTopWidth() - 40)		
			nLarg1  := GetDeskTopWidth() - 40			
			nLargx := nLarg1 		
		End If 
	End If 

	DEFINE WINDOW &cBrowserName ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH nLargTotal+1  ;
		TITLE 'xBrowser' + Left(cActiveJan,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil  ;		
		ON PAINT (xPaintBrowser( ThisWindow.Name , aMt1 , nItemx5 ,     nClearIt2  , .t.  )  ) 		
	END WINDOW



	DEFINE WINDOW &cEspelhoBrw ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH nLargTotal+1  ;
		TITLE 'xEspelho' + Left(cActiveJan,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLACK ;
		ON MOUSEMOVE ( xCheckObj() ,   cObjSelected := 'Browser')				
	END WINDOW



	cBarrah := xBarraH( cParent ,  cBrowserName , nRowIni+(nTamPag * nItemBrwHeight)+2  , nLargTotal  ,  nLargX , cBrowserName )

	If Len(aCabecalho) > 0
		lHasHeader := xHeader( cHeaderName , aCabecalho , aTamanhos , cParent ,  cBrowserName ,  nLargTotal , aTipos  )
	End If 	



	//SET WINDOW Win_Browser TRANSPARENT TO 0


	SET WINDOW &cBrowserName TRANSPARENT TO 0




	If (Mod( nMaxItem1 ,  nTamPag ) == 0)
		nPageTotal := Int(nMaxItem1 / nTamPag)
	Else 
		nPageTotal := Int(nMaxItem1 / nTamPag)+1
	End If


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
		AT nRowIni,nCol11  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 21 HEIGHT (nTamPag * nItemBrwHeight) ;
		TITLE 'xScroxRoleol1' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
		ON PAINT xPaintScroll( ThisWindow.Name )
	END WINDOW



	DEFINE WINDOW &cBarraVSombra ;
		AT nRowIni,nCol11  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 27 HEIGHT (nTamPag * nItemBrwHeight)  ;
		TITLE 'xScroxSombra' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR {240,240,240}  ;
		ON MOUSEMOVE (cObjSelected := 'BarraV')				  
	END WINDOW


		//366
		//+90

	SET WINDOW &cBarraVfrm TRANSPARENT TO 0
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

	SysWait(0.03)
	xDcToDEspe()


	_ShowWindow( xGetBarName(1) )
	BT_ClientAreaInvalidateAll(xGetBarName(1))


	_ShowWindow( xGetBarName(2 ) )
	BT_ClientAreaInvalidateAll(xGetBarName(2))

	Do Events 

	xDcBarH()




    Do Events
    Do Events


Return

Function xCalcPosV(nReg1)

	Local nPos 	  := 0
	Local n1      := xCalcBarV()
	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83

	nPos := Int ((  (nTamBar  - n1)  *  nREg1 ) / Len(aMt1))

Return nPos


Function xCalcBarV()

	Local nCalc := 0

	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83

	nCalc := Int (( nTamBar *  nTamPag ) / Len(aMt1))


Return nCalc 

Function xShowBrw(  cTable1   )

	Local cBrwName        := 'Brw' + Left(cTable1,4) 
	Local cEspelhoBrw     := 'Win_E' + Left(cBrwName,4)
	Local cBarraVfrm 	  := 'Win_R1' +  Left(cBrwName,4)
	Local cBarraVSombra   := 'Win_Resp' +  Left(cBrwName,4)


	
	If (_isWindowDefined(cBrwName))

		_ShowWindow(cBrwName )  
		_ShowWindow(cEspelhoBrw)  

		_ShowWindow(cBarraVfrm)
		_ShowWindow(cBarraVSombra)
		xDcToDc() 

		SysWait(0.03)
		xDcToDEspe()	
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

	Local nLarg1 := nLargX
	//GetDeskTopWidth() - 45

	Local nDiff := nLargTotal - nLarg1 + 30



	//xFechaMen
	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)
	


	If nMsg == WM_KEYDOWN

		If (nWParam == VK_RIGHT)
			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If
	
				
			If (nColScrool <= nDiff )
			//if !((nColScrool - (nLargTotal - nLargX  )) > 40 )
				nColScrool += nHSCrool 
				SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -(nHSCrool)    , 2 )
			
				Do Events 

				If lHasHeader
					SETVSCROLLVALUE( GetFormHandle( cHeaderName  )  ,  -(nHSCrool)    , 2 )
					UpdHeader(  cHeaderName ,    (nHSCrool)   )					
					Do Events 
				End If 					
				xDcToDc()

				If (nLParam > 0)
					UpdateBarH( nHSCrool )					
				End If 

			Else 
			    xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida. ") )


			End If

		End If



		If (nWParam == VK_LEFT)
			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If
			HMG_CleanLastVirtualKeyDown()


			If (nColScrool > 0)
				nColScrool -= nHSCrool
				SETVSCROLLVALUE( GetFormHandle( cBrowserName   )  , nHSCrool , 2 )

				If lHasHeader
					SETVSCROLLVALUE( GetFormHandle( cHeaderName  )  ,  nHSCrool    , 2 )
					UpdHeader(  cHeaderName ,    -nHSCrool   )
					Do Events 
				End If 	

				xDcToDc()

				If (nLParam > 0)
					UpdateBarH( -(nHSCrool) )					
				End If 


			Else				
				 xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida."))
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
				xWaitDlg()
				Return
			End If

			nColScrool := 0			
			SETVSCROLLVALUE( GetFormHandle(  cBrowserName  )  , 0 , 2 )
			BT_ClientAreaInvalidateAll(cBrowserName)
			xDcToDc()



		End If

		IF (nWParam == VK_RIGHT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))				
				xWaitDlg()
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
	End If 

	

	If (nWPAram == 33)			
		xGoPgUp()
	End If 


	If (nWParam == VK_DOWN)



		lHitt := .f.

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
				xSelItem( nItemx5  , .t.  )
				ScrolUp1(.f.)				

				EncheMVis( nItemx5 )
				nItemx5 := nSav2
				nSelLine := nItemx5
				SysWait(0.04)

			Else
				xSelItem( nItemx5  , .f.  )
				SysWait(0.04)
			End If

			xSaveVars()

		Else

			//msginfo('ok')	
			xDialog('Maximo Atingido! ' + Str(nItemx5) + '  ' + Str(nMaxItem1) + '   '  + Str(nLinScrool)  )
			nLinhaBarra := nTamPag
			lHtb := .t.
			nItemx5 := nMaxItem1
			lHtt := .f.
			xWaitDlg()
			//SysWait(0.06)		
		End If

		BT_ClientAreaInvalidateAll (cBarraVfrm)		
		xDcToDc()				
		xDcToDEspe()	

	End If

	If (nWParam == VK_UP) 			

		HMG_CleanLastVirtualKeyUp()	

		If nItemx5 > 1
			nItemx5--
			lHitB := .f.
			If (nLinhaBarra = 1)
				lHitt := .t.
			Else
				nLinhaBarra--
			End If

			If (lHitt)
				//SysWait(0.09)
				xSelItem( nItemx5  , .t. , .f.  )
				ScrolUp1(.t.)				
				EncheMVis( nItemx5  , .t. )
				SysWait(0.04)
				HMG_CleanLastMouseMessage()
			Else

				xSelItem( nItemx5  , .f.  , .f. )				
				SysWait(0.07)
			End If				

		Else
			lHitt := .t.
			nItemx5 := 1
			nClearIt2 := 1
			nLinScrool := 0
			nLinhaBarra := 1
			xDialog('Top Atingido!' , .f.  )			
		End If

		BT_ClientAreaInvalidateAll (cBarraVfrm)		
		xDcToDc()				
		xDcToDEspe()

	End If


Return

Function ScrolUp1( lUpDir )

	Local hwnd
	Local nSave2 := nItemx5


	If (lUpDir)
		If (nLinScrool = 0)

		Else
			nLinScrool -= nItemBrwHeight
			SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , nItemBrwHeight  , 1 )
		End If
	Else
		If nItemScrool >= Len(aMt1)

		Else

			nLinScrool += nItemBrwHeight
			hwnd :=  GetFormHandle( cBrowserName )
			SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , -(nItemBrwHeight) , 1)

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
	

	DEFAULT lBrwEnable := .t. 


	nRow := -(nLinScrool)
	nCol := -(nColScrool)

	hBitMap2 := BT_BitmapCreateNew (Width  , Height , WHITE )
	hDC2 := BT_CreateDC (cForm ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)

	If (nOpselx1 = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , WHITE , WHITE  )
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

		cTexto := Hb_Utf8ToStr(aMtrOp[n1][1])		
		nLinb++


		//cTexto := StrZero(n1,6) + '    ' + StrZero(nItemx5,5) + '   ' + StrZero(nLinB,6) + '   ' + Alltrim(Str(nRow) + '   ' + Str(  aMtrOp[n1][3]   )  )

		IF (nLinb > nTamPag)
			nLinB := 0
		End If

		nPg := Int(    n1  / nTamPag )+1

		If (nPg = nPageTotal)
        //   cTexto := cTexto := StrZero(n1,6) + '    ' + StrZero(nItemx5,5) + '   Ultimo '

		   n12 := (Len(cTexto) * nTam1 )

		   If !lPaint 				
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 0  , n12  ,    (nTamPag+2) * nItemBrwHeight     ,  RED  , RED   )	
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

		//	cTexto := StrZero(n1,6) + '    ' + StrZero(nItemx5,5) + '   ' + StrZero(nLinB,6) + '   ' + Alltrim(Str(nRow))  + "** " + Str(aMtrOp[n1][3])

			BT_DrawText ( hDC2 , nLine + nRow  , 17+nCol ,   cTexto , xFont2  , 9 , nFontCor ,  SELCOR   , ;
				nTypeText ,	nAlingText, nOrientation )


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

			If !aMtrOp[n1][2]
				cCor := CorDisabled
				nTypeText    :=  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT				
			End If

			BT_DrawText ( hDC2 , nLine + nRow  , nCol+17 ,  cTexto , xFont2, 9 ,  cCor , nCorBk , nTypeText, nAlingText, nOrientation )

		End If

		nLine += nItemBrwHeight

	Next

	BT_DeleteDC (BTstruct )


Return



FUNCTION  QtAcento(cString)
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

	/*

    OBTN_Create( cJanx,  855 , "&A", 0    , 0 ,  20 ,  20  ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont  )
    OBTN_Create( cJanx,  856 , "&A", 21   , 0 ,  20 ,  20  ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont  )
    OBTN_Create( cJanx,  857 , "&A", 41   , 0 ,  20 ,  20 ,  .T., .T., .T. ,  8, RetColor1( 1 ), aBtnFont  )



	EventProcessAllHookMessage( EventCreate( {|| EventRole1() }  ,   OBTN_Handle( cJanx, 855 )   ), .T. )	
	EventProcessAllHookMessage( EventCreate( {|| EventRole1() }  ,   OBTN_Handle( cJanx,  856 )   ), .T. )			
	EventProcessAllHookMessage( EventCreate( {|| EventRole1() }  ,   OBTN_Handle( cJanx, 857 )   ), .T. )



	OBTN_Font( cJanx, 855,  { cFontName, nFontSize, .F., .F., .F., .F. } )
 	OBTN_Font( cJanx, 856,  { cFontName, nFontSize, .F., .F., .F., .F. } )
	OBTN_Font( cJanx, 857,  { cFontName, nFontSize, .F., .F., .F., .F. } )


	   
	OBTN_Create( cJanx,  858 , "&4", nRow1 - 6    , 0  ,  20,  20  ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
	OBTN_Create( cJanx,  859 , "&R", nRow1 - 26   , 0  ,  20,  20  ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )
	OBTN_Create( cJanx,  860 , "&T", nRow1 - 46   , 0  ,  20,  20 ,  .T., .T., .T.,  8, RetColor1( 1 ), aBtnFont )


	EventProcessAllHookMessage( EventCreate( {|| EventRole1()  },   OBTN_Handle( cJanx, 858 )   ), .T. )		
	EventProcessAllHookMessage( EventCreate( {|| EventRole1() },   OBTN_Handle( cJanx,  859 )   ), .T. )			
	EventProcessAllHookMessage( EventCreate( {|| EventRole1() },   OBTN_Handle( cJanx, 860 )   ), .T. )

	OBTN_Font( cJanx, 858,  { cFontName, nFontSize, .F., .F., .F., .F. } )
	OBTN_Font( cJanx, 859,  { cFontName, nFontSize, .F., .F., .F., .F. } )
	OBTN_Font( cJanx, 860,  { cFontName, nFontSize, .F., .F., .F., .F. } )

	*/




   
Return (nRow1 - 46)



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

	
	IF nHWnd == GetProperty(  cActiveJan   , "HANDLE" )				
		If nMsg == WM_MOUSEMOVE
		

			GetCursorPos (@nCol1, @nRow1)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow1, nCol1 )
			hWnd := WindowFromPoint ( ar1[1] , ar1[2])


			If (lHasHeader)
				xApagueH( cHeaderName )
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
				SendMessage( GetFormHandle(cBrowserName)  , WM_KEYDOWN , VK_UP , 0 )				
				If (GetAsyncKeyState(VK_LBUTTON)) == 0					
					lTracking45 := .t. 
				End If 				
				SysWait(0.03)
			End 

			
			
			While (nModeBrw = 6) .And. (!lTracking45)
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



			SysWait(0.02)
			
//			HMG_CLEANLASTMOUSEMESSAGE()

			lTracking45 := .f. 
			SysWait(0.09)
			
		
		End If 	



		If (nMsg == WM_MOUSEMOVE) 			

			Do Events	
			Do Events	

			If (lHasHeader)
				xApagueH( cHeaderName )
			End If 


         	GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )

			If (ar1[2] > 21)				
				xOffBarVert( nHWnd )
				Return 
			End If 

			nRow1 := ar1[1]
			nId := 0 

			If (nRow1 >= nLimteLin)			

				nL := GetProperty(cBarraVfrm,'Height') - 20

			    If (nRow1 > (nL + 1))
				    nId := 858
				Else 
					If (nRow1 <= (nLimteLin + 20   ))
					    nId := 860
					Else 
					   nId := 859	
					End If 
				End If 	
			Else 
				If nRow1 <= 20
					nId := 855
				Else 
					
					If (nRow1 >= 41) .And. (nRow1 <= 61)
						nId := 857					
					Else 
						If (nRow1 >= 21) .And. (nRow1 <= 40)
							nId := 856
						End If 
					End If 

				End If 
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
				nModeBrw := xDoHint(   nId  )
				Do Events 
				CursorHand1( nHWnd  )				
				Do Events 				
				nHasFocus := nId
				xRefreshBut()
				Do Events 
				xDcToDEspe()
				lTracking135 := .t.
				lTracking75  := .t.
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

Return




Function xDoHint(   nIdBut , cMsg  )

	Local cTp1 := ''
	Local nModeBrw := 0
	Local nRow , nCol 

	DEFAULT cMsg := Nil 
	
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

	Do Events 


	GetCursorPos( @nCol , @nRow )

	
	If !_isWindowDefined("Win_Msg")
		CrieJanTip( nRow  - 20 , nCol - 15   ,   Alltrim(cTp1)      ,, 0.5 )
	Else
		xDispHint( cTp1 , nRow  - 20,  nCol - 15  )
	End If

	xDispUpTam(cTp1 )

	BringTop('xHint')

	
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



Function xSelItem( nItem1 , lScr1 , lFrente  )

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


Function xOffBarVert( nWh1 )
	

	lTracking75 := .f. 
	lTracking135 := .f.
	nHasFocus := 0				
	//SetWindowCursor( nHWnd , IDC_ARROW )
	xRefreshBut()				
	Do Events 	

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
	//Local zRolagem := BT_BitMapLoadFile('ROLAGEM')

	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)

	Local nRow1 := Height - 20

	Local n11 := xCriaButs()

	Local aMtrz1 := { 855 , 856 , 857 , 860 , 859 , 858}

	Local nLinha := 0
	Local lFlag  := .f. 

	Local n1 
	

	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )
	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {230,230,230}  , {230,230,230} )


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



		BT_DrawBitmap (hDC  , nLinha  , 0  	, 18  , 18  ,      BT_COPY,   BT_BitMapLoadFile( cImg   )    )
		nLinha += 21

	Next 	

	Do Events 


	nLAst := nRow1 - 63

	If (nItemX5 == 1)
		
		BT_DrawFillRoundRect ( hDC , nRIni ,  2   , Width - 5 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 				

	Else

		If (nItemX5 == nMaxItem1 )			
			BT_DrawFillRoundRect ( hDC , nLimteLin - nAltura ,  2   , Width - 5 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 				
		
			
		Else				

			yPos := nLimteLin - nRIni - nAltura
			nFator := Int(( nItemX5 * yPos     ) /	nMaxItem1)

			BT_DrawFillRoundRect ( hDC ,   (nrIni  + nFator )  ,  2   , Width - 5 , nAltura , 5 ,5 ,  {152 , 152 ,152}   , {152 , 152 ,152}  , 0 ) 				
			

		End If
	End If

	BT_DeleteDC (BTstruct2 )
//	BT_BitmapRelease (zRolagem)


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
	Local nPageNum := aMt1[nItemx5][3]
	Local nI 

	
	If (nPageNum = 1 )	
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
	EncheMVis( nLast1 , .f.  , .f. )


	BT_ClientAreaInvalidateAll(cBrowserName)
	

	SysWait(0.03)	

	

	BT_ClientAreaInvalidateAll (cBarraVfrm)		

	
	Do Events 

	xDcToDc()				
	xDcToDEspe()
		

Return 






Function xGoPgDn()

	Local nPos1 := ( (nPageNumber *  nTamPag) * nItemBrwHeight)
	Local nLast1 
	Local ni 
	Local nPageNumber := aMt1[nItemx5][3]
	Local nResto := Mod( nMaxItem1 , nTamPag)

	nPos1 := ( (  (nPageNumber )  *  nTamPag) * nItemBrwHeight)

	If ( nPageNumber = nPageTotal )		 			
		xDialog("Final das informações Atingido." , .f. )
		Return 
	End If 	

	lHitB := .f.
	lHitt := .f.

	xCursorWait(.t.)

	
	For ni := 1 To nTamPag  		
		ScrolUp1(.f.)		
	Next 	

	nLast1      := nPageNumber * nTamPag
	nItemX5     += (nTamPag)
	nClearIt2   := nItemX5
	nClear1     := nItemX5

	nSelLine := nItemx5	
	EncheMVis( nLast1 , .f. , .f.   )

	BT_ClientAreaInvalidateAll(cBrowserName)
	

	SysWait(0.04)




	If (nPageNumber+1) == nPageTotal
		nLinhaBarra := 1
	End If 	

	//xDcToDc()	

	BT_ClientAreaInvalidateAll (cBarraVfrm)		

	Do Events 

	xDcToDc()				
	xDcToDEspe()


	
	xCursorWait(.f.)


	
	//SysWait(0.07)

Return 






Function xGoBottom()


	Local nPos1 := (Len(aMt1) * nItemBrwHeight) - (nTamPAg * nItemBrwHeight)

	

	If ( nPageNumber = nPageTotal )		 			
		xDialog("Final das informações Atingido." , .f. )
		Return 
	End If 	


	xCursorWait( .t. )	

	Do Events

	nItemX5     := nMaxItem1
	nClearIt2   := nItemX5
	nClear1     := nItemX5
	nLinhaBarra := nTamPag

	lHitB := .t.

	lHitt := .f.

	_HMG_PRINTER_SETVSCROLLVALUE(   GetFormHandle(cBrowserName)  , nPos1 )

	nLinScrool := nPos1
	EncheMVis( nTamPag )

	nPageNumber := nPageTotal

	xSelItem(nItemX5)

	BT_ClientAreaInvalidateAll(cBrowserName)
	BT_ClientAreaInvalidateAll(cBarraVfrm)

	
	
	SysWait(0.05)

	xDcToDEspe()
	


Return



Function xGoTop()

	xCursorWait( .t. )

	nPageNumber := 1

	nItemX5     := 1
	nClearIt2   := 1
	nClear1     := 1
	nLinhaBarra := 1
	lHitB := .f.
	lHitt := .t.

	nLinScrool := 0
	nColScrool := 0

	EncheMVis( nTamPag )

	BT_ClientAreaInvalidateAll(cBrowserName)
	BT_ClientAreaInvalidateAll(cBarraVfrm)	


	
	SysWait(0.05)

	xDcToDEspe()
	//Do Events 

REturn



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


	BT_DrawDCtoDC (hDC2, 0, 0 , Width2, Height2, BT_SCALE, hDC1, 0 , 0, Width1, Height1 )



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

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2


	Local Width2  := BT_ClientAreaWidth  (cEspelhoBrw)
	Local Height2 := BT_ClientAreaHeight (cEspelhoBrw)

	hDC1 = BT_CreateDC (cBrowserName, BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cEspelhoBrw, BT_HDC_ALLCLIENTAREA, @BTstruct2)

	BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
//    BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 50, BT_SCALE, hDC1, 0, 0, Width1, Height1)


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

Static Function xCursorWait( lOn )


	If lOn 
		SetWindowCursor( GetFormHandle( cFormPrin )  , 'CURSOR1'  )
		SetWindowCursor( GetFormHandle( cEspelhoBrw )  , 'CURSOR1'  )
		
	Else 

		SetWindowCursor( GetFormHandle( cFormPrin )  , IDC_ARROW  )
		SetWindowCursor( GetFormHandle(cEspelhoBrw )  , IDC_ARROW  )	
		
		
	End If 	


	Do Events
					


Return 

