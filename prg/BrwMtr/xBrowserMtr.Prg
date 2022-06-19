
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



Static nDragColi := 0

Static nLArgura := 0
Static aMt1 := {}
Static aOpx1 := 0
Static lHitB := .f.
Static l_HitB := .f.
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
Static hBitExcl
Static cBrowserName := ''
Static cEspelhoBrw := ''
Static cBarraVfrm := ''
Static cBarraVSombra := ''
Static nColLeft := 0
Static lTracking96 := .f.
Static nQTotCol := 0
Static nLast1 := 0
Static aMDisplay := {}
Static lScrool1 := .f.
Static lDuplo := .f. 
Static nAcumTot2 := 0
Static nMaxBar := 0
Static cJanObj := ''
Static cHeaderName  := ''
Static cHSombraName := ''

Static nMaxBarh := 0
	

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

Static lDrag_Mode := .f. 

Static nIndex1 := 1

Static lExit := .f.

Static nColDrag := 0

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

Static l_Hitt := .t.

Static nColz2 := 1
Static nLimiteCol := 0

Static nAcumz5 := 0

Static lNoHorzScy := .f. 


//DECLARE WINDOW Win_Browser



Function yRetLargura( aMatriz1 )

	Local nLarg := 0
	Local n1    := 0
	Local BTstruct

	Local hDC   := BT_CreateDC ( 'Main'  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	Local hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )

	For n1 := 1 To Len(aMatriz1)

		nTam1 := aMatriz1[n1 ]
		cTexto := Replicate('A' ,  nTam1 + 1  )
		nLarg += GetTextWidth( hDC , cTexto , hfont )

	Next

	BT_DeleteDC(BTstruct   )

	//Aeval(   aMatriz1 , { |a| nLarg += (a * GetTextoTam( ' '  , cActiveJan ))  }  )

REturn nLarg


Function xRetTamPg()
Return nTamPag


//Function DoMatriz( cParentx , cTabela )

//aThread2 := hb_threadStart( HB_THREAD_INHERIT_PUBLIC, @TestBrow(),  cParentx , cTabela  )

//REturn (TestBrow(  cParentx , cTabela  ))





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
			If (nAcum <= nMaxItem1)
				Aadd(aMVisible  , {    n1  ,   nAcum         })
				nAcum++
			End If
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
	nLimiteCol := nLarg1


	//msginfo(  Str( nLimiteCol  )  )


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


	EncheMVis( nTamPag  , .f.  )



	cBrowserName  := cBrwName
	//'Win_Browser'
	cEspelhoBrw   := 'Win_Ert1' + Left(cBrowserName,4)
	cBarraVfrm 	  := 'Win_R1' +  Left(cBrowserName,4)
	cBarraVSombra := 'Win_Resp' +  Left(cBrowserName,4)


	cHeaderName := 'Win_HeadMtr' + Left(cBrowserName,4)
	nQEtp := 0

	

	DEFINE WINDOW &cBrowserName ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT nAltura1 VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag , (Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil) ;
		TITLE 'xBrowser' + Left( cParent ,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil  ;
		ON PAINT (xPaintBrwMtr( ThisWindow.Name , aMDisplay , 100 ,     nClearIt2  , .t.  )  )
	END WINDOW



	DEFINE WINDOW &cEspelhoBrw ;
		AT nRowIni,nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH nLarg1 HEIGHT nAltura1 VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag ,(Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil)  ;
		TITLE 'xEspelho' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLACK ;
		ON MOUSEMOVE ( yCheckObj() ,   cObjSelected := 'aMtrBrowser'   )
	END WINDOW


	
    nMaxBarh := GetProperty(  cBrowserName , 'Width'  ) 


	lAtivo1 := ((nLargTotal+1) > nLarg1)

	If Len(aCabecalho) > 0
		lHasHeader := xHeaderMtr( cHeaderName , aCabecalho , aTamanhos , cParent ,  cBrowserName ,  nLarg1 , aTipos , cTabela , lAtivo1 , lDicionario , nRowIni - 2 , nCol )
		//msginfo('ok2')

		If !lHasHeader
			Return .f. 
		End If 

	End If



	cBarrah := xBarHMtr( cParent ,  cBrowserName , nRowIni+nAltura1 , nLarg1  ,  nLargX , cBrowserName , ;
		(nQTotCol := xGetColQw1()) , nLarg1 - ((nLargTotal - nLargX) )   , cHeaderName , ((nLargTotal+1) > nLarg1)  , nCol	 )


	//SET WINDOW Win_Browser TRANSPARENT TO 0

	//yIncConter( .t. )
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

		nIndexEventX := 20050

		CREATE EVENT PROCNAME xTecBrowMtr() STOREINDEX nIndexEventX


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

	DoEvents()

	SysWait(0.01)
	xDcToDEspe()


	If _isWindowDefined(yGetBarNome(1) )
		_ShowWindow( yGetBarNome(1) )
		BT_ClientAreaInvalidateAll(yGetBarNome(1))


		_ShowWindow( yGetBarNome(2 ) )
		BT_ClientAreaInvalidateAll(yGetBarNome(2))
	End If

	//DoEvents()


	yDcBarH1()


	//DoEvents()


	SysWait(0.01)


	If _isWindowDefined(yGetHeadName(1))
		_ShowWindow( yGetHeadName(1) )
		BT_ClientAreaInvalidateAll(yGetHeadName(1))


		_ShowWindow( yGetHeadName(2 ) )
		BT_ClientAreaInvalidateAll(yGetHeadName(2))

		yDcBarH1eMtr()

	End If


	//SysWait(0.01)
	BT_ClientAreaInvalidateAll(cBarraVfrm)

	//SysWait(0.01)

	BT_ClientAreaInvalidateAll(cBarraVSombra)
	xDcToDEspe()

	

	xDcToDc()
	DoEvents()

    

Return .t. 


Function ySetTam( aTamanhos )
	aTams2 := Aclone(  aTamanhos )
REturn



Function xCalcTam()

	Local nTam12 := 0
	Local nTam   := 0
	Local nTam1  := 0
	Local cTexto := ''
	Local hDc 
	Local hFont 
	Local nQAcento
	Local BTstruct

    hDC = BT_CreateDC ( 'Main'  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
    hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )

    For n1 := 1 To Len(aCabec1)
        
        nTam1  := aTams2[n1]
        nQAcento := QtAcento(Alltrim(aCabec1[n1]) )
        nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
        cTexto := Replicate('A' ,  nTam1 + 1  )    
        n12 := GetTextWidth( hDC , cTexto , hfont )	
        nTam := n12              

        nTam12 += (nTam)

    Next 

	

	//Altd()
    

	
    BT_DeleteDC (BTstruct )

Return nTam12

Function xWaitY( cForm )

	Local i
	Local ar1
	Local nRow1,nCol1
	//Local nHWnd := GetFormHandle('Win_Dialog')
	Local nHWnd1


	For i := 1 To 255
		GetAsyncKeyState(i)
	Next i

	//xIndiDlg()

	DoEvents()
	DoEvents()

	//aMx := yEfect(  cActiveJan , .t.  )


	Do While .Not. lExit

		DoEvents()

		For i := 1 To 255
			If (GetAsyncKeyState(VK_RETURN) != 0)
				lExit := .T.
				Exit
			EndIf
		Next i

		BringTop(cForm)
		SysWait(0.01)
		//_ShowWindow('Win_Dialog')

	Enddo

	//msginfo('Exit')

Return .t.


Function SetArray( aMz1 )

	If Len(aMz1) > 0
		nOpselx1 := 0
		nItemx5 := 0
		nClearIt2 := 0
		nIndex1 := 0
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

		DoEvents()
		_ShowWindow( yGetBarNome(1) )
		BT_ClientAreaInvalidateAll(yGetBarNome(1))

		_ShowWindow( yGetBarNome(2 ) )
		BT_ClientAreaInvalidateAll(yGetBarNome(2))
		DoEvents()
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


Function yRetNFocus()
Return nHasFocus


Static Function SetLargx(n1 )

	nLargx := n1

REturn

Function SetNewLarg( nLarg )

	nLargTotal := nLarg

Return


Function xChangeOrd( nOrigem ,  nDest )

	//	Local a1 := aMt1[nDest]

	Local a1 := {}
	Local n1 := 1
	Local nSalva


	For n1 := 1 To Len(aMt1)
		nSalva := aMt1[n1][nDest]
		aMt1[n1][nDest]   := aMt1[n1][nOrigem]
		aMt1[n1][nOrigem] := nSalva
	Next

	xGoTop()


REturn

 






Function yCalcEtap1(   nWid1  ) 

	Local nCol2  := 1
	Local nWidth := 0
	Local nPos2 := 1
	Local nLargz1 := nLargx
	Local nRet := 0
	Local nc1 := 0
	Local nColEsq := 1
	Local nTamWidth := xCalcTam() 	
	Local lnoF  := .t.
	Local nLim1 := xGetInfCw1( nQTotCol , 3) - 17

	Default nWid1 := 0

	If (nWid1 > 0)
	   nLim1 := nWid1
	End If 



    While .t. 

			nPos2 := xGetInfCw1(   nCol2 , 2  )

	       If ((nPos2 + nLargz1  ) >= nLim1)
		   		Exit 
		   Else 
		   		nc1++
		   End If 

		   nCol2++

	Enddo 



Return nC1



Function xBarInicio()
REturn (nColEsquerda == 1)



Function xRetPasso(  nQt11 , lFim )

		//nLargTotal
	Local nLargx1 :=  (xCalcTam() - nLargX)
	Local nPasso  := Int(  nLargx1 / nQt11 )
	Local nZ1 := (nQt11  * nPasso)

	If lFim 
		nPasso += ( nLargx1 - nZ1 )
	End If 

REturn (nPasso)





Function xBarFim()
REturn (nColScrool >= (nLargTotal - nLargX))

Function yDecrLefa()
	nColEsquerda--
Return


Function yScrollCaM( lFrente , lUpdBar , nW1  )


	Local nColTam
	Local lFim := .f.

	Local nWidth := Iif( nColEsquerda > 0 , xGetColW1(  nColEsquerda   ) , 0 )

	DEFAULT nW1 := 0

	If nW1 > 0
	   nWidth := nW1
	End If 


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

		nColScrool += nWidth
		SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -(nWidth)    , 2 )

		nColEsquerda++
		nPageNum++


	Else

		nColScrool -= nWidth
		SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  nWidth    , 2 )


		nPageNum--

		nColEsquerda--

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

	DoEvents()

	yUpHead1(  cHeaderName ,   Iif( lFrente , nWidth , -(nWidth)  ) )
	DoEvents()

      /*
	If (nColEsquerda == 1) .And. (!lFrente)
		yUpHead1(  cHeaderName ,   -15  )
		DoEvents()
	End If
	*/


	xDcToDc()

	DoEvents()


REturn nWidth


Static Function xUpHead(  nValor    )


	yUpHead1(  cHeaderName ,   nValor  )
	DoEvents()

Return



Static Function DoScrolly( nVert1 )

	nColScrool += nVert1
	SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -nVert1    , 2 )

	SysWait(0.02)
	xDcToDc()

	DoEvents()


Return


Function UxLib96()

	lTracking96 := .f.

REturn



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
	Local nDiff := nLargTotal - nLarg1 + 30
	Local aMVisible1 := Iif( nColScrool >= nLarg1  , yColsVisible(nColScrool) , {} )
	Local nPos2
	Local nTotal := 0
	Local lDownMouse := .f.
	Local lUpMouse := .f.
	Local nInd1
	Local nRow1
	Local nCol1
	Local nCol	
	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)

	If HMG_GetLastMouseMessage (@nHWnd) == 513
		//	msginfo(Str(    HMG_GetLastMouseMessage (@nHWnd)   ))
		//	msginfo( Str(nWParam)  )
	End If


	If HMG_GetLastMouseMessage (@nHWnd) == WM_MOUSEWHEEL
		HMG_CleanLastMouseMessage()
		DoEvents()
		DoEvents()
		If HIWORD( nWParam ) == 120
			lUpMouse := .t.
		Else
			lDownMouse := .t.
		End If
	End If

	



	If (nMsg == WM_LBUTTONUP)

		lDrag_Mode := .f. 
		nColDrag   := 0

		//DoEvents()


		//msginfo('ok2')

		If (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))
			
			If (nHasFocus > 0 )
				PostMessage(OBTN_Handle( cBarraVfrm , nHasFocus   )  , WM_MOUSELEAVE , 0, 0  )
				DoEvents()
				xDcToDEspe()			
				lTracking75 := .f.
				lTracking45 := .t.
				SysWait(0.01)
			End If
			
		End If

	End If


	// Arrasto da BarraH	
	If (nMsg == WM_MOUSEMOVE)

	
		If (nHasFocus > 0)	
			DoEvents()			
			yLimpBarV()	
		End If 	

		If (yRetAcende() > 0) .And. (cObjSelected != 'BarraH')			
			yOffBarra( cBarrah  )			//msginfo(Str(yRetAcende()))			
		End If 	

		DoEvents()

		
		If  _isWindowDefined("Win_Msg")
			xHidehint()
		End If

		
		GetCursorPos (@nCol, @nRow)
		ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
		nCol := ar1[2]
		
		If (lDrag_Mode)	
			
			If nColDrag == 0
				nColDrag := nCol
		 	End If 	

			DoEvents()            

			nConstH := Xh_RetPasy()
                
            If (nCol > nColDrag) .And. (Abs(nCol - nColDrag) >= nConstH) //.And. (nSaveCol > 0)
                If  ( yGetScrXy(.t.) < nMaxBarh) 
                    DoEvents()
                    nColDrag := nCol 
                    yUpdatBha1( nConstH     )	                            
                End If   
            Else
                If (nCol < nColDrag) .And. (Abs(nColDrag - nCol) >= nConstH) //And. (nSaveCol > 0)
                    If (yGetScrXy( .f. ) > 21)
                        DoEvents()                        
                        nColDrag := nCol 
                        yUpdatBha1( -(nConstH)  )	                                                         
                    End If     
                End If     
            End If 

			Return 

			
		End If 

	

		//MOUSEMOVE DA BARRAV
		If (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))

		

			lTracking75 := .f.

			If (lHasHeader)
				SysWait(0.03)
				yDcBarH1eMtr()
				SysWait(0.03)
				yDragOff()				
			End If



			GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )

			If (ar1[2] > 21) .or. (ar1[2] < 0)
				CursorArrow1(nHWnd)			
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
				//SysWait(0.01)
				//msginfo('ok2')
				yLimpBarV()				
				Return
			End If


			If (nRow1 >= 61) .And. (nRow1 <= (GetProperty(cBarraVfrm,'Height') - 61) ) .And. (nId = 0)				
				xOffBarVert( nHWnd )
				//DoEvents()					
				Return
			End If


			If (nHasFocus > 0)
				If (nId != nHasFocus)
					xDcToDEspe()				
					lTracking75 := .f.
					lTracking135 := .f.					
				//	nHasFocus := 0
				End If
			End If



			If (nId > 0) .And. (!lTracking75)

				yOffBarra( cBarrah  )

				nModeBrw := yDoHint(   nId  ,  , .t.  )
				CursorHand1( nHWnd  )
				nHasFocus := nId
				BT_ClientAreaInvalidateAll( cBarraVfrm )
				DoEvents()
				xDcToDEspe()	
				lTracking135 := .t.
				lTracking75  := .t.

			

			End If

		End If


	End If




	If (nMsg == WM_LBUTTONDOWN)

		DoEvents()

		If (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))	.And. (nModeBrw > 0)

			If nModeBrw = 1
				lControlOk := .t.
				xGoTop()
				lControlOk := .f.
			End If

			If nModeBrw = 4
				lControlOk := .t.
				xGoBottom()
				lControlOk := .f.
			End If


			While( nModeBrw = 3) .And. (!lTracking45)

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				SysWait(0.02)

				xGoUp(.t.)

				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If

			End

			While (nModeBrw = 6) .And. (!lTracking45)

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i


				//DoEvents()

				xGoDown(.t. )

				SysWait(0.02)

				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If

				//SysWait(0.01)

			End


			While (nModeBrw = 5) .And. (!lTracking45)

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				//SysWait(0.02)
				xGoPgDn( .t. )
				SysWait(0.02)
				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If

			End If

			While (nModeBrw = 2) .And. (!lTracking45)

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i


				xGoPgUp( .t. )

				SysWait(0.02)
				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If
			End

			//SysWait(0.05)

			lTracking45 := .f.

		End If


		//msginfo('g1')

		If (nHWnd == GetProperty( cEspelhoBrw , "HANDLE" ))

			//MSGINFO('LP2')	

			DoEvents()
			nSaveX5 := nItemX5
			nItem :=  xGetPos(cEspelhoBrw)


			If (nItem > Len(aMt1))
				msginfo('Here2')
				Return
			End If

			If yApagueH( cHeaderName )

			End If


			nRow1 := -(nLinScrool)


			If nClearIt2 > 0
				xLimpSub(cBrowserName ,  @nClearIt2 ,  nItemx5 , 0 ,   nItemBrwHeight , GetProperty(  cBrowserName,'Width')  , -(nLinScrool) )
			End If


			nItemx5 := 	nItem
			nClearIt2 := nItemx5
			
			nInd1 := Ascan(  aMVisible , { |a|  a[2] == nItemX5   }   )

			lNoscr := .f.
			If nind1 > 0
				nLinhaBarra := aMVisible[   nInd1  ][1]
				nIndex1 := 	aMVisible[   nInd1  ][2]
			Else
				//nLinhaBarra := Mod(nItemX5 , nTamPag )

				nLinhaBarra := nItem

				If nItemX5 <= Len(aMVisible)
					nItem := aMVisible[nItemX5][2]
				End If

				nItemX5 := nItem



			End If

			If (nItemx5 > 0)
				BT_ClientAreaInvalidateRect(cBrowserName ,  nRow1  +  ( ( nLinhaBarra - 1 ) * nItemBrwHeight)  , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight   , .t. )

			End If

			nSelLine := nItem
			nIndex1 := nItemX5


			nClearIt2 := nIndex1

			//ysWait(0.01)


			lHitb := (nLinhaBarra = nTamPag)
			lHitt := (nLinhaBarra = 1)


			BT_ClientAreaInvalidateAll (cBarraVfrm)

			BT_ClientAreaInvalidateAll(cBrowserName)
			DoEvents()

			xDcToDc()
			xDcToDEspe()
			nItemX5 := nSaveX5


			DoEvents()

		End If

	End If




	If nMsg == WM_KEYUP
		//msginfo('Up')
		DoEvents()
		nWParam:=0

	End If


	If nMsg == WM_KEYDOWN

		For i := 1 To 255
			GetAsyncKeyState(i)
		Next i


		While (GetAsyncKeyState(34)) != 0

			xGoPgDn()

			DoEvents()

			For i := 1 To 255
				GetAsyncKeyState(i)
			Next i

			SysWait(0.06)

		Enddo


		While (GetAsyncKeyState(33)) != 0

			xGoPgUp()

			DoEvents()

			For i := 1 To 255
				GetAsyncKeyState(i)
			Next i

			SysWait(0.06)

		Enddo



		If (nWParam == VK_RIGHT)

			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If
			
			nQTotEt := yCalcEtap1()	
			nColZ2++
			//msginfo(Str(nColZ2))

			nPos1 := xGetInfCw1(   nColz2 , 2  )
			nPos2 := xGetInfCw1(   nColz2 , 3  )			


			//msginfo(Str(nLargz1) + '   ' + Str(nPos1) + ' '  + Str(nPos2) + '   ' + Str((nLimiteCol -  nAcumz5)) + '  qt ' + Str(nQTotEt) )
			
			If (nPos2 > nLimiteCol)				
				nW1 := nPos1				
				nLast1 := nW1
				yScrollCaM( .t. , .f. , nW1 ) 				
				nLimiteCol := nW1 + nLarg1 				
				nAcumz5 += nW1
				nLast1 := nW1				

				If nLimiteCol >= xCalcTam()
					//yUpdatBha1( nWidth    )
					yGoBarR()
					DoEvents()
					//msginfo('pl2')				
					yDcBarH1()
				Else 
					nW1 := xRetPasso(  nQTotEt  , ( (nColZ2 + 1) >= nQtotcol)  )    
					
					yUpdatBha1( nW1     )

				End If 	

			Else 
				
			End If 
			
			lNoHorzScy := .f.

			ySelCol( nColz2 )
			
			DoEvents()
			SysWait(0.02)	


			If (nColz2 = nQtotcol )  					
				lNoHorzScr := .t. 
			End If 	


			/*

			If (nColz2 = nQtotcol )  				

			  
				nTam5 := xCalcTam()  
				
				If (nTam5 - nLimiteCol) >= 10				
					xRoleTela( .t. , (nTam5 - nLimiteCol)   , .t. ,  .t. ,  nColZ2  )					
					//msginfo(Str(  (nTam5 - nLimiteCol) ))
					nAcumz5 += (nTam5 - nLimiteCol)	
					nLast1 += (nTam5 - nLimiteCol)
					nLimiteCol += (nTam5 - nLimiteCol)
					lNoHorzScr := (nColz2 = nQtotcol) 
					lDuplo := .t. 
				Else 
					
				End If 	
				

				lNoHorzScr := .t. 


				Return

			End If		
			*/
			
			DoEvents()
			SysWait(0.02)	


		End If


		If (nWParam == VK_LEFT)

			/*
			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If
			*/

			If  lNoHorzScy
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return
			End If


			
			nQTotEt := yCalcEtap1()

			lNoHorzScr := .f. 
			nColZ2--
			//msginfo(Str(nColZ2))

			nPos1 := xGetInfCw1(   nColz2 , 2  )
			nPos2 := xGetInfCw1(   nColz2 , 3  )	


			msginfo(Str(nLargz1) + '   ' + Str(nPos1) + ' '  + Str(nPos2) + '   ' + Str((nLimiteCol -  nAcumz5)) + '  qt ' + Str(nAcumz5) )


			If (nPos1 < (nLimiteCol -  nAcumz5) ) //.And. (   nPos2 >= (nLimiteCol -  nAcumz5) )
				//msginfo('ok2')

				nW1 := nPos1				
				//nLast1 := nW1
				yScrollCaM( .f. , .f. , nW1 ) 		


				If (nPos2 < nLargz1)
					yGoBarL()
					DoEvents()
					
					yDcBarH1()
					msginfo('ok2 222')

				Else 


				End If
			
				//nW1 := xRetPasso(  nQTotEt  , ( (nColZ2 + 1) >= nQtotcol)  )     	

				//If nLast1 > 0
					//nW1 := nLast1					
				//End If 
											
				//xRoleTela( .f. , -nW1 , .t. , .t. ,  nColZ2 )
				//nLimiteCol -= nW1
				
				/*
				If (lDuplo)

					nSav1 := nColZ2 
					nColZ2--
					nW1 := xRetPasso(  nQTotEt  , ( (nColZ2 + 1) >= nQtotcol)  )  
					xRoleTela( .f. , -nW1 , .t. , .t. ,  nColZ2 )   
					nLimiteCol -= nW1

                    If (nColz2 == 1 )
						//nLimiteCol := nLarg1
						nLast1 := 0
						nAcumz5    := 0
					End If 	

					nColz2 := nSav1 
					//msginfo('Duplo ' + Str(nColz2) )	
					lDuplo := .f.				

				End If 	
				*/

				lNoHorzScr := .f. 


				If (nLast1 > 0)
					nAcumz5 -= nLast1
					nLast1  := 0
				Else 
					nAcumz5 -= nW1
				End If 	

				If nAcumz5 <= 5						
					nAcumz5 := 0
					//msginfo('Zerou')					
				End If 

			Else 	
				
			End If 

			

			ySelCol( nColz2 )
			lNoHorzScr := .f.
			DoEvents()
			SysWait(0.06)	

			If nColZ2 == 1
				xInitSxy()
				lNoHorzScy := .t. 
				nLast1 := 0				
				nLimiteCol := nLarg1				
				nAcumz5    := 0
				//ySelCol( nColz2 )
				//msginfo('Zerou')
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

				DoEvents()
				xDispUpTam(  cTp1 )
				xFecheAnimate(  GetFormHandle('Win_Msg') )


				l_HitB := .f.

				BT_ClientAreaInvalidateAll (cBarraVfrm)
				xDcToDc()
				xDcToDEspe()


				xCursorWait( .f. )

			End If

			IF (nWParam == VK_END)

				xGoBottom()
				DOEVENTS()
				HMG_CleanLastVirtualKeyDown()
				cTp1 := "Final do Navegador Atingido..."
				If !_isWindowDefined("Win_Msg")
					nHan1 := CrieJanTip(  GetProperty(cBrowserName , 'Row') - 10  , GetProperty(cBrowserName, 'Col') + 150   ,   Alltrim(cTp1)      ,, 0.5 )

				Else
					xDispHint( cTp1 , GetProperty(cBrowserName , 'Row') - 10 ,  GetProperty(cBrowserName, 'Col') + 150  )
				End If
				DoEvents()
				xDispUpTam(  cTp1 )
				xFecheAnimate(  GetFormHandle('Win_Msg') )
				BT_ClientAreaInvalidateAll (cBarraVfrm)
				xDcToDc()
				xDcToDEspe()
				xCursorWait( .f. )

			End If

		End If




	End If





	If (nWParam == VK_DOWN) .or. (lDownMouse)

		xGoDown()

		lDownMouse := .f.




		HMG_CleanLastVirtualKeyDown()


		PostMessage(  nHWnd , WM_KEYUP , 0,0 )
		DoEvents()


	End If

	If (nWParam == VK_UP) .or. (lUpMouse)


		lUpMouse := .f.

		xGoUp()





		HMG_CleanLastVirtualKeyUp()


		PostMessage(  nHWnd , WM_KEYDOWN , 0,0 )
		DoEvents()

	End If


Return




Static Function xGoUp( lMsg  )

	Local nInd1
	Local nItem7

	Default lMsg := .f.
  

	If (l_Hitt) .And. (!lMsg)
		xDialog( Hb_AnsiToOem("Primeiro Registro Posicionado.") , .f. )
		Return
	End If


	lUpMouse := .f.

	If (nIndex1 > 1)

		nItemx5--
		nIndex1--
		lHitB := .f.

		If (nLinhaBarra = 1)
			lHitt := .t.
			nSelLine := 1
		Else
			nLinhaBarra--
		End If



		l_HitB := .f.


		

		If (lHitt)

			nInd1 := Ascan(aMDisplay , { |a|  a[1] == nIndex1 })

			If nInd1 == 0		
				nItem7 := Len(aMDisplay) + 1
				Aadd(aMDisplay , { nIndex1 ,   xRetItem(   aMt1[nIndex1]    )   , nItem7   }  )

				aMDisplay := Asort( aMDisplay ,,, { |a,b|  a[1] < b[1]   })

				DoEvents()
				SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , nItemBrwHeight  , 1 )
				BT_ClientAreaInvalidateAll(cBrowserName)
				DoEvents()
			Else
				ScrolUp1(.t.)
			End If


			nLinhaBarra := 1
			EncheMVis(  nIndex1  , .t. )
			ySelItem( nIndex1  )
			SysWait(0.01)



		Else
			ySelItem( nIndex1  , .f.  , .f. )
			SysWait(0.01)
		End If



	Else
		lHitt := .t.
		nItemx5 := 1
		nClearIt2 := 1
		nLinScrool := 0
		nLinhaBarra := 1
		nPageNumber := 1
		nIndex1 := 1
		If (!lMsg)
			xDialog('Top Atingido!' , .f.  )
		End If

	End If

	BT_ClientAreaInvalidateAll (cBarraVfrm)
	xDcToDc()
	xDcToDEspe()

Return

Static Function xGoDown( lMsg )

	Local nInd1
	Local nItem7

	DEFAULT lMsg := .f.


	If (l_HitB) .And. (!lMsg)
		//xDialog( Hb_AnsiToOem("Ultimo Registro Atingido!") , .f. )
		REturn
	End If

	lHitt := .f.
	//lDownMouse := .f.


	If (nIndex1 < nMaxItem1 )

		nItemx5++
		nIndex1++

		l_Hitt := .f.

		If nLinhaBarra >= nTamPag
			lHitB := .t.
		Else
			nLinhaBarra++
		End If

		If (lHitt)
			nItemx5 := 1
			nIndex1 := 1
		End If


		If (lHitB) .And. (nIndex1 <= nMaxItem1)

			nInd1 := Ascan(aMDisplay , { |a|  a[1] == nIndex1 })

			If nInd1 == 0
				nItem7 := Len(aMDisplay) + 1
				Aadd(aMDisplay , { nIndex1 ,   xRetItem(   aMt1[nIndex1]    )  , nItem7 }  )
			End If

			nLinhaBarra := nTamPag

			SysWait(0.01)
			EncheMVis(  nIndex1 - nTamPag + 1  , .t. )
			ScrolUp1(.f.)
			ySelItem( nIndex1  )
			SysWait(0.03)

		Else
			ySelItem( nIndex1  , .f.  )
		End If

		//xSaveVars()

	Else

		//xGoBottom()
		If (!lMsg)
			//xDialog('Linha Maxima Atingida! '  , .F.  )
			//DoEvents()
			//ySelItem( nMaxItem1 , .f.  )
			DoEvents()

		End If

		lHtb := .t.
		lHtt := .f.


	End If


	DoEvents()


	BT_ClientAreaInvalidateAll (cBarraVfrm)
	xDcToDc()

	DoEvents()
	xDcToDEspe()


	//DoEvents()


Return


Static Function ScrolUp1( lUpDir  , nQtd1 )

	Local hwnd
	Local nSave2 := nItemx5
	Local nS1 := nLinScrool

	DEFAULT nQtd1 := nItemBrwHeight



	If (lUpDir)
		//	If (nLinScrool = 0)

		//	Else
		nLinScrool -= nQtd1
		SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , nQtd1  , 1 )
		//End If
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

Static Function xRecords( n1 , lFrente  )

	Local n2 := 0

	DEFAULT lFrente := .t.


	If (lFrente)

		For z := n1 To ((n1+nTamPag) - 1)

			If (z <= LEn(aMt1) )
				n2++
				Aadd(aMDisplay ,  {  Z ,  xRetItem(   aMt1[Z]    )   , n2 }  )
			End If

		Next

	Else


		For z := ((n1+nTamPag) - 1) To n1

			If (z <= LEn(aMt1) )
				Aadd(aMDisplay , { Z ,  xRetItem(   aMt1[Z]    )  }  )
			End If

		Next


	End If


REturn


Function xBmpToTrans(cImage , nColor )

	Local aRGBcolor   := SELCOR
	Local hBitmapx    := BT_BitmapCreateNew (nColIniBrw , nItemBrwHeight, nColor)
	Local BTstruct3
	Local hBolaAzul   := BT_BitmapLoadFile(cImage)
	Local hDC3 		  := BT_CreateDC (hBitmapX , BT_HDC_BITMAP, @BTstruct3 ) 

	BT_DrawBitmapTransparent (hDC3 , 0, 0, nColIniBrw, nItemBrwHeight, BT_COPY, hBolaAzul , Nil )


	BT_DeleteDC (BTstruct3 )




Return hBitmapx 	



Function xPaintBrwMtr( cForm , aMtrOp ,  nOpselx1 , nClear1 , lBrwEnable )

	Local aRGBcolor := 'BACK1'
	Local nWidthBmp := 170
	Local nHandle1
	Local nHandle2
	Local BTstruct
	Local BTstruct2
	Local BTstruct3
	Local hDc
	Local hDc2
	Local nTamx1 := xCalcTam()
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
	Local bBmpZ := xBmpToTrans( 'BOLAZAZUL1')
	Local bBmpa := xBmpToTrans( 'NGITRANS' , SELCOR)
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

	Local hBitOk     := BT_BitmapLoadFile ('NGITRANS')
	Local hBitExcl   := BT_BitmapLoadFile ('EXCLA1')

	//Local hBolaAzul   := BT_BitmapLoadFile('tra1.Bmp')
	
	//BT_BitmapLoadFile ('BOLAZAZUL1')


	DEFAULT lBrwEnable := .t.


	nRow := -(nLinScrool)
	nCol := -(nColScrool)


	//hBitMap2 := BT_BitmapCreateNew (Width  , Height , WHITE )
	hDC2 := BT_CreateDC (cForm ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)



	//BT_BitmapRelease ( hBitExcl )

	If (nOpselx1 = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width  ,    Height    , WHITE , WHITE  )
	End If

	If nClear1 > 0

		If (Mod( nClear1, 2 ) = 0)
			nCor := WHITE
		Else
			nCor := CORBROWSE
		End If
		//BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemBrwHeight)    , 0  , Width  ,    nHeightBmp     ,  nCor  , nCor   )

	End If

	nIndice := -9999


	If (Len(aMtrOp) == 0)
		BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {193,255,224}  , WHITE   )
		BT_DrawText ( hDC2 , 20  , 80 ,   "Nenhum Registro Localizado."  , 'Arial Black'  , 9 , FONTCOR ,  {193,255,224}    , ;
			nTypeText ,	nAlingText, nOrientation )
		BT_DrawBitmapAlphaBlend (hDC2, 10 , 5 , 48  , 48  , 55  , BT_COPY, hBitExcl )
		BT_DeleteDC (BTstruct )
		REturn

	End If


	For n1 := 1 To Len(aMtrOp)

		cTexto := Hb_Utf8ToStr( aMtrOp[n1][2])  + '.'
		//+ Replicate(' ',200)
		nLinb++


		IF (nLinb > nTamPag)
			nLinB := 0
		End If


		nPg := Int(    n1  / nTamPag )+1

		If (l_HitB)


			n12 := (Len(cTexto) * nTam1 )

			If !lPaint
				BT_DrawGradientFillHorizontal ( hDC2 ,  nLine + nRow   , 0  , n12   ,    (nTamPag+2) * nItemBrwHeight     ,  WHITE  , {193,255,224}   )
			End If

			lPaint := .t.

		End If

		If (nOpselx1 > 0) .And. (aMtrOp[n1][1] == nSelLine )
			//(nOpselx1 = n1)

			nTypeText    := BT_TEXT_BOLD
			nFontCor     := WHITE



			If !lBrwEnable
				nTypeText    := BT_TEXT_TRANSPARENT
				nFontCor 	 := BLACK
			End If


			If lAtivo1
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 0  ,    Width    ,    nItemBrwHeight+5     , SELCOR  , SELCOR  )

				BT_DrawText ( hDC2 , nLine + nRow  , nColIniBrw+nCol ,   cTexto , xFont2  , 9 , nFontCor ,  SELCOR   , ;
					nTypeText ,	nAlingText, nOrientation )
			End If
			
			If (aMtrOp[n1][1] == nSelLine) .And. (nColScrool == 0)



				//aRGBcolor := SELCOR			

				
				//hBitmapx := BT_BitmapCreateNew (nColIniBrw , nItemBrwHeight, aRGBcolor)

				//hDC3 := BT_CreateDC (hBitmapX , BT_HDC_BITMAP, @BTstruct3 ) 

				//BT_DrawBitmapTransparent (hDC3 , 0, 0, nColIniBrw, nItemBrwHeight, BT_SCALE, hBolaAzul , NIL)

				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 00  ,  nColIniBrw ,    nItemBrwHeight     , SELCOR  , SELCOR  )

				//BT_DrawBitmapTransparent(hDC2  , nLine  + nRow    , 0   , nColIniBrw  , nItemBrwHeight , BT_STRETCH , bBmpZ  , WHITE )



				BT_DrawBitmap (hDC2  , nLine  + nRow    , 0   , 17  , nItemBrwHeight , BT_SCALE , bBmpa  )

				//BT_DrawBitmapAlphaBlend (hDC2  , nLine  + nRow    , 0   , nColIniBrw  , nItemBrwHeight , 95 , BT_SCALE , bBmpZ  )

				//BT_DrawBitmapAlphaBlend (hDC, nRow ,  nCol  , nil, nil, 120 , BT_COPY  , zBitmap)

				//BT_DrawBitmap(hDC3, nLine  + nRow , 0   , nColIniBrw - 3 , nItemBrwHeight, BT_SCALE, hBitmapx  )

				//Bt_BitmapSaveFile(  bBmpZ , 'tra2221_23.Bmp'  )


			//	BT_BitmapRelease (hBitmapx)
  
  				// Release hDC bitmap  
  				//BT_DeleteDC (BTstruct3)   



			End If

		Else

			nTypeText    := BT_TEXT_TRANSPARENT
			n12 := (Len(cTexto) * nTam1 )
			n12 := nTamx1 + nCol + nColIniBrw			
				

			If (Mod( n1 , 2 ) = 0)
				nCorBk := WHITE
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , n12 ,    nItemBrwHeight     , nCorBk  , nCorBk   )
				lPar := .f.
			Else
				nCorBk := CORBROWSE
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , n12 ,    nItemBrwHeight     , nCorBk  , nCorBk   )
				lPar := .t.
			End If


			//BT_DrawBitmapTransparent (hDC2  , nLine  + nRow    , 0   , 16  , nItemBrwHeight , BT_SCALE , hBitOk , Nil)

			cCor := FONTCOR

			/*
			If !aMtrOp[n1][2]
				cCor := CorDisabled
				nTypeText    :=  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT				
			End If
			*/


			BT_DrawText ( hDC2 , nLine + nRow  , nColIniBrw+nCol  ,  cTexto , xFont2, 9 ,  cCor , nCorBk , nTypeText, nAlingText, nOrientation )

		End If

		nLine += nItemBrwHeight

	Next

	BT_DeleteDC (BTstruct )

	BT_BitmapRelease ( hBitOk )
	BT_BitmapRelease ( hBitExcl )

	BT_BitmapRelease (bBmpZ)
	BT_BitmapRelease (bBmpa)

	//BT_BitmapRelease(hBolaAzul)


	//BT_BitmapRelease ( hBitMap2 )


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

	DoEvents()
	BT_ClientAreaInvalidateAll( cBarraVfrm )

	xDcToDEspe()
	
	DoEvents()




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








	If (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))

		

	End If



	If (nHWnd == GetProperty( cBarraVfrm , "HANDLE" ))

		If (nMsg == WM_LBUTTONDOWN)


		End If

		If (nMsg == WM_DRAWITEM)
			If ( nWParam >=  855 ) .AND.  ( nWParam <=  860 )
				//OBTN_Draw( nHWnd,  nwParam, nLParam , (  nHasFocus == nWParam  )  ,  yRetImgs(  nWParam  ) , .f. , 20 )
			End If
		End If


	End If

	

	If (nHWnd == GetProperty( cEspelhoBrw , "HANDLE" ))

		

		If nMsg == WM_MOUSELEAVE
			nClearIt2 := 0
			nitemx5   := 0

			BT_ClientAreaInvalidateAll(cBrowserName)

		End If



		If nMsg == WM_MOUSEMOVE
		

			If (lHasHeader)
				DoEvents()
				yDcBarH1eMtr()
				DoEvents()
				yDragOff()
				DoEvents()
				DoEvents()
			End If



			If (nHasFocus > 0)
				lTracking75 := .f.
				lTracking135 := .f.
			//	nHasFocus := 0
				SetWindowCursor( nHWnd , IDC_ARROW )
				xRefreshBut()
				DoEvents()
				xDcToDEspe()
				DoEvents()

				If  _isWindowDefined("Win_Msg")
					xHidehint()
				End If
				DoEvents()				

				DoEvents()	
				yOffBarra( cBarrah  )			

			Else
			End If
			If  _isWindowDefined("Win_Msg")
				xHidehint()
			End If

		End If

	End If

Return

Function xSetl75Trk()
	lTracking75 := .t.
REturn	



Function SetBrwDrgM(lOn1 , nColIni )
	lDrag_Mode := lOn1 
	nDragColi  := nColIni
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


	//DoEvents()

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
	Local nLBar := 0

	Default lFrente := .t.

	If (nClearIt2 > 0)
		nIndice1 := Ascan(aMVisible , { |a| a[2] == nClearIt2 })

		If nindice1 > 0
			nLBar := aMVisible[nindice1][1]
		Else
			If nLinScrool == 0
				nLBar := nClearIt2			
			End If
		End If
		BT_ClientAreaInvalidateRect( cBrowserName , ( (nLBar - 1) * nItemBrwHeight )        , 0 , GetProperty( cBrowserName,'Width') ,  nItemBrwHeight   , .t. )

	Else

	End If

	If nItem1 > 0
		nClearIt2 := nItem1
	Else
		Return
	End If

	If nLinScrool > 0
		nRow1 := -(nLinScrool)
	End If	
	nSelLine := nItem1

	If (nItem1 > 0)

		nRow1 := 0
		BT_ClientAreaInvalidateRect( cBrowserName,  ( (nLinhaBarra - 1 ) * nItemBrwHeight) - nRow1    , 0 , GetProperty( cBrowserName,'Width')  ,  nItemBrwHeight  , .t. )

	End If

	nPerCent := ( nItem1 / nMaxItem1) * 100


	nI := 63
	nR := (nTamPag * nItemBrwHeight) - 83

	BT_ClientAreaInvalidateRect(cBarraVfrm   ,  nI  ,0,  20,  (nR - nI) + 45  , .t.  )

Return


Static Function xOffBarVert( nWh1 )


	lTracking75 := .f.
	lTracking135 := .f.
//	nHasFocus := 0
	nModeBrw := 0

	//xRefreshBut()

	DoEvents()
	BT_ClientAreaInvalidateAll( cBarraVfrm )

	//yOffBarra( cBarrah  )
	

	//xLuzOff( cBarrah )
	xDcToDEspe()
	//DoEvents()


	If  _isWindowDefined("Win_Msg")
		xHidehint()
	End If

	//DoEvents()


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

	Local hBt2



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

		BT_BitmapRelease( yBmp1 )
		BT_BitmapRelease( yBmp2 )
		BT_BitmapRelease( yBmp3 )

		BT_BitmapRelease( zBmp1 )
		BT_BitmapRelease( zBmp1 )
		BT_BitmapRelease( zBmp1 )

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

		If (nHasFocus == aMtrz1[n1] ) .And. (cObjSelected = 'BarraV')
			cImg := aImgs[2]
		End If

		If (Len(aMt1) <= nTamPag)

			If (aMtrz1[n1] != 855) .And. (aMtrz1[n1] != 860)
				cImg := aImgs[4]
			End If

		End If

		hBt2 := BT_BitMapLoadFile( cImg   )

		BT_DrawBitmap (hDC  , nLinha  , 0  	, 18  , 18  ,      BT_COPY,   hBt2    )
		nLinha += 21

		BT_BitmapRelease( hBt2 )
		//DoEvents()



	Next

	BT_DeleteDC (BTstruct2 )

	BT_BitmapRelease( yBmp1 )
	BT_BitmapRelease( yBmp2 )
	BT_BitmapRelease( yBmp3 )

	BT_BitmapRelease( zBmp1 )
	BT_BitmapRelease( zBmp1 )
	BT_BitmapRelease( zBmp1 )




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
	Local nIt2


	Local nHeightCalc := nItemBrwHeight



	GetCursorPos (@nCol, @nRow)

	aR1 := GetPos_ScreenToClient(   GetFormHandle(  cJanela  )  , nRow, nCol )

	NewPos := nLinScrool

	nItem := (Int(  Ar1[1]  / nHeightCalc)+1)



	/*
	If NewPos > 0
		nItem := (Int( (NewPos+Ar1[1])     / nHeightCalc)+1)
	Else

		//msginfo('Zerado')
		nItem := (Int(  Ar1[1]  / nHeightCalc)+1)

		//msginfo('zero Aqui')

		If (nIndex1 > nTamPag) 
            //msginfo(     Str(nItem)  )

			//nItem := 0


			If nItem <= Len(aMVisible)
				nIt2 := aMVisible[  nItem  ][2]
				nItem := nIt2
		//		msginfo('Aqui')
			End If 


		End If 	

		
	End If
	*/



Return Abs(nItem)



Static Function xGoPgUp( lSaida )

	Local nPos1 := 0
	Local nLast1
	//Local nPageNum := aMt1[nItemx5][3]
	Local nI


	Default lSaida := .f.


	If (l_Hitt)
		If (!lSaida)
			xDialog( Hb_AnsiToOem("Primeiro Registro Posicionado.") , .f. )
		End If
		REturn
	End If


	lHitB := .f.
	lHitt := .f.

	l_HitB := .f.



	nLinScrool := 0
	aMDisplay := {}


	nRec1 := (aMVisible[ 1 ][2]) - 1


	If (nRec1 <= (nTamPag * 2))
		//msginfo('ok2')
		xGotop()
		Return .t.
	End If

	nItemX5  := ( nRec1   - (nTamPag - 1) )



	xRecords(nItemx5 , .t. )
	EncheMVis(nItemX5  , .t. )

	nLinhaBarra := 1


	nIndex1     := nItemx5
	nClearIt2   := nItemX5
	nClear1     := nItemX5


	nSelLine := nItemx5



	BT_ClientAreaInvalidateAll (cBarraVfrm)

	BT_ClientAreaInvalidateAll(cBrowserName)
	DoEvents()

	xDcToDc()
	xDcToDEspe()


	nPageNumber--
	SysWait(0.05)

	//SysWait(0.05)

	nClearIt2 := 1

	If l_Hitt
		nIndex1 := 1
	End If




Return




Static Function xGoPgDn( lSaida )

	Local nPos1 := ( (nPageNumber *  nTamPag) * nItemBrwHeight)
	Local nLast1
	Local ni
	//Local nPageNumber := aMt1[nItemx5][3]
	Local nResto := Mod( nMaxItem1 , nTamPag) - 1
	Local lUltimaPg := .f.


	Default lSaida := .f.



	If (l_HitB)
		If (!lSaida)
			//xDialog(  Hb_AnsiToOem("Fim das Informações Atingido.") , .f. )
		End If
		Return
	End If


	nClearIt2 := nTamPag


	lHitt := .f.

	l_Hitt := .f.

	DoEvents()


	CursorArrow1(   GetFormHandle(  'fFiltrosCad' )       )
	nRec1 := (aMVisible[  nTamPag ][2])+1


	If (nResto != 0)

		If ( (nRec1 + nTamPag) >= nMaxItem1)
			lUltimaPg := .t.
			nResto := (nRec1 + nTamPag) - nMaxItem1
			ScrolUp1( .t. , nTamPAg * nItemBrwHeight)
			l_HitB := .t.

			lHitB := .t.
			nClearIt2 := nResto - 1

		End If

		If nResto > 0
			ScrolUp1( .t. , nTamPAg * nItemBrwHeight)
		End If

	End If




	//msginfo(Str(nRec1))

	nLinScrool := 0
	aMDisplay := {}



	xRecords(nRec1 , .t. )
	EncheMVis(nRec1  , .t. )



	If (Len(aMDisplay) < nTamPag ) .or. (nRec1 > nMaxItem1)
		nResto:=Len(aMDisplay)
		lUltimaPg := .t.
		lHitB := .t.
	End If

	If !lUltimaPg
		nItemX5     := (nRec1) + (nTamPag - 1)
		nLinhaBarra := nTamPag
	Else
		nItemX5     += nResto
		nLinhaBarra := nResto
	End If


	nIndex1     := nItemx5
	//nClearIt2   := nItemX5
	nClear1     := nItemX5


	nSelLine := nItemx5
	BT_ClientAreaInvalidateAll (cBarraVfrm)

	BT_ClientAreaInvalidateAll(cBrowserName)
	DoEvents()

	xDcToDc()
	xDcToDEspe()



	nPageNumber++
	SysWait(0.05)



	If l_HitB
		nIndex1 := nMaxItem1
	End If

Return .t.





Static Function xGoBottom()


	Local nPos1 := (Len(aMt1) * nItemBrwHeight) - (nTamPAg * nItemBrwHeight)




	//DoEvents()

	nIndex1     := Len(aMt1)

	nItemX5     := Len(aMt1)
	nClearIt2   := nItemX5
	nClear1     := nItemX5


	nLinScrool := 0
	aMDisplay := {}
	xRecords( nItemX5 - nTamPag + 1 , .t. )
	EncheMVis(nItemX5 - nTamPag + 1 , .t. )



	lHitB := .t.
	lHitt := .f.

	l_Hitt := .f.
	nLinhaBarra := nTamPag
	nItemX5 := nTamPag
	ySelItem(nItemX5)
	nSelLine := Len(aMt1)
	nClearIt2   := Len(aMt1)
	BT_ClientAreaInvalidateAll(cBrowserName)
	BT_ClientAreaInvalidateAll(cBarraVfrm)
	SysWait(0.01)
	xDcToDc()
	xDcToDEspe()
	nIndex1 := Len(aMt1)


	nClearIt2 := nTamPag


	//SysWait(0.01)
	l_HitB := .t.



Return


Function xInitBrw()

	DoEvents()
	xGoTop()



	//SysWait(0.04)

Return

Function yGoTop()
	xGoTop()
REturn

Static Function xGoTop()

	xCursorWait( .t. )

	nPageNumber := 1

	nItemX5     := 1
	nClearIt2   := 1
	nClear1     := 1
	nLinhaBarra := 1
	lHitB := .f.
	lHitt := .t.


	l_HitB := .f.

	l_Hitt := .t.


	nLinScrool := 0
	nIndex1 := 1
	//	nColScrool := 0

	nSelLine := 1

	aMDisplay := {}
	xRecords( nItemX5 )

	EncheMVis( nTamPag )

	BT_ClientAreaInvalidateAll(cBrowserName)
	BT_ClientAreaInvalidateAll(cBarraVfrm)



	//SysWait(0.02)

	xDcToDEspe()



	xCursorWait( .f. )

	xDcToDc()
	//DoEvents()


	nClearIt2 := 1


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

	
    //hBit201 := BT_BitmapCaptureWindow ( cBrowserName , 0 , 0, 3052 , Height1)
    //BT_BitmapSaveFile (hBit201  , "TEla12.bmp")
            


Return

Function xSaveBmp()

	Local hDc := GetDc(cBrowserName)

Return

Static Function xDoDrag(  cJan1 )

	Local nRow , nCol 

	DoEvents()

	If lDrag_Mode			

		DoEvents()

		GetCursorPos (@nCol, @nRow)
		aR1 := GetPos_ScreenToClient(   GetFormHandle(cJan1) , nRow, nCol )

		
		nCol := ar1[2]

		If nColDrag == 0
			nColDrag := nCol 				
		End If 

		msginfo('Drg Mode')
		Return 




	End If 


REturn 	

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


	DoEvents()
					


Return 
*/


