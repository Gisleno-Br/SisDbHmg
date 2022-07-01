#include <hmg.ch>
#include "inkey.ch"
#include <minigui.ch>
#require "hbxpp"
#include <hmg.ch>
#include <dll.ch>
#include "hbthread.ch"
#include "BosTaurus.ch"
#define XQUEBRA Chr(13)+Chr(10)





#define FONTCOR   {102,102,102}
#define CORBROWSE {241,241,241}
#define SELCOR    {28,157,189}

#DEFINE CORHEAD1 {110,125,129}
#DEFINE CORHEAD2  {92,104,107}

#DEFINE CORHEAD3  {102,116,120}
#DEFINE CORHEAD4  {80,91,94}

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

Static nColHeader    := 0
Static cHeaderJan    := ''
Static cHeaderSombra := ''

Static aMapsCol := {}

Static aColsTam := {}
Static aTipsy   := {}

Static aCabecs   := {}


Static nColSel1 := 0
Static nColAntx := 0

Static lMove1 := .f.

Static lTrack39 := .f.

Static lSizeMode := .f.
//Static lDragMode := .f. 

Static cTable := ''

Static lTracking546 := .f.
Static nTotz2 := 0

Static lEnabled2 := .t.
Static lDisphint := .f.

Static c_BrowName := ''

Static lAndamento := .f.

Static nColDrag := 0

Static nOrdCol := 0

Static s1 := ''
Static s2 := ''

Static nOrdemSel := 0
Static lAscending := .f.


Static nColSele := 1

Static lDragMode := .f.
Static nSteps    := 5
Static nColx5    := 0


Static nColMove := 0
Static nColY1   := 0
Static nIncr1   := 0

Static nColSav1 := 0
Static nColTam1 := 0
Static nColTarget := 0

Static cTituloCol := ''
Static nQConter := 1

Static hBit201 := Nil

Static nQDrag1 := 0

Static nPageScrolH := 1

Static nLimiteAtu := 0

Static lAtuDic  := .t.
Static lScrool5 := .t.

Function xHeaderMtr( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1 , aTps , cTabela , lAtivo , lDic1  , nR1 , nC1  )

	Local nRowI   := nR1
	Local nColI   := nC1
	Local lOk     := .t.
	Local nLarg1  := GetProperty( cBrwName1 , 'Width')
	Local aPos := {0,0,0,0}

	Local nHWnd := GetSplitChildWindowHandle (cBrwName1, cParent1)
	Local nIndex22

	//GetWindowRect (nHWnd, aPos)

	DEFAULT lAtivo := .t.
	lAtuDic := lDic1

	lEnabled2 := lAtivo

	//msginfo(Str(  nLarg1  ))

	cHeaderJan := cHName

	cHeaderSombra := 'fSombra' + Right(cHeaderJan , 3)


	aColsTam := aTams
	aTipsy   := aTps
	aCabecs  := aCabecalho

	c_BrowName := cBrwName1

	cTable := cTabela
	nLimiteAtu := nLarg1 + 1



	DEFINE WINDOW &cHName ;
		AT nRowI - 28 , nColi - 2 ;
		CHILD ;	                                                                                                 //nLarg1+1
		PANEL ;
		PARENT &cParent1 ;
		VISIBLE .F. ;
		WIDTH nLarg1 - 1 HEIGHT 31 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Iif( (nLargTot1 > 0) .And. ( nLargTot1 > (nLarg1+1)) , nLargTot1 , Nil )  ;
		TITLE 'xHeader1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION NOAUTORELEASE NOMINIMIZE NOMAXIMIZE BACKCOLOR WHITE ;
		ON PAINT xPaintHeader( ThisWindow.Name , aCabecs  , aColsTam , aTipsy )
	END WINDOW


	DEFINE WINDOW &cHeaderSombra ;
		AT nRowI - 28 , nColi - 2 ;
		CHILD ;	                                                                                                 //nLarg1+1
		PANEL ;
		PARENT &cParent1 ;
		WIDTH nLarg1 - 1 HEIGHT 31 VIRTUAL HEIGHT Nil   ;
		TITLE 'xHeaderSombra1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION NOAUTORELEASE NOMINIMIZE NOMAXIMIZE BACKCOLOR WHITE ;

		DEFINE LABEL Label2
			ROW    0
			COL    0
			WIDTH  nLarg1+1
			HEIGHT 30
			VALUE " "
			FONTNAME "Arial"
			FONTSIZE 9
			TOOLTIP ""
			FONTBOLD .F.
			FONTITALIC .F.
			FONTUNDERLINE .F.
			FONTSTRIKEOUT .F.
			HELPID Nil
			VISIBLE .T.
			TRANSPARENT .T.
			ACTION Nil
			AUTOSIZE .F.
			BACKCOLOR Nil
			FONTCOLOR NIL
		END LABEL


	END WINDOW

	CREATE EVENT PROCNAME EventHeaMtr() HWND GetControlHandle(  'Label2' ,  cHeaderSombra ) STOREINDEX nIndex22
	EventProcessAllHookMessage(nIndex22 , .t.)

	//WS_EX_STATICEDGE
	//HMG_ChangeWindowStyle(  GetFormHandle(cHeaderSombra) , Nil , WS_EX_CONTROLPARENT  ,  .t. , .T. )
	HMG_ChangeWindowStyle(  GetFormHandle(cHeaderSombra) , Nil , WS_EX_STATICEDGE     ,  .t. , .T. )


	//HMG_ChangeWindowStyle(  GetFormHandle(cHeaderSombra) , Nil , WS_BORDER     ,  .f. , .T. )



	SET WINDOW &cHName TRANSPARENT TO Iif(!lEnabled2 , 167 , 0)



//DoEvents()





	nTotz2 := xMapCols( aCabecs , aColsTam , aTipsy )

	If !CheckRet( nTotz2)
		MsgInfo('Algo Deu Errado nas Colunas , Favor Reconfigurar ou Reduzir Tamanhos.')
		lOk := .f.
	End If


Return lOk

Function xh_InitLim()
	nLimiteAtu := GetProperty( c_BrowName , 'Width')
Return nLimiteAtu

Static Function SetOrdGrid( nColuna1 , lAsc1 )


	nOrdemSel  := nColuna1
	lAscending := lAsc1

	BT_ClientAreaInvalidateAll(cHeaderJan)

	DoEvents()
	yDcBarH1eMtr()

	SysWait(0.02)


Return





Function yGetHeadName(nTipo)
Return Iif(nTipo = 1, cHeaderJan, cHeaderSombra)

Function yDcBarH1eMtr()

	Local Width1  := BT_ClientAreaWidth  (cHeaderJan)
	Local Height1 := BT_ClientAreaHeight (cHeaderJan)

	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2

	Local nTypeText    := BT_TEXT_TRANSPARENT
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT



	Local Width2  := BT_ClientAreaWidth  (cHeaderSombra)
	Local Height2 := BT_ClientAreaHeight (cHeaderSombra)

	hDC1 = BT_CreateDC (cHeaderJan, BT_HDC_ALLCLIENTAREA, @BTstruct1)
	hDC2 = BT_CreateDC (cHeaderSombra, BT_HDC_ALLCLIENTAREA, @BTstruct2)

	//	BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	If !lEnabled2
		BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 156 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Else
		BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	End If


	//nTypeText    := BT_TEXT_TRANSPARENT
	//nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	//nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
	//BT_DrawText (hDC2, 300, 50, "Mirror of the Win1", "Times", 42, YELLOW, BLACK, nTypeText, nAlingText, nOrientation)

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)

	BT_ClientAreaInvalidateAll (cHeaderSombra)

Return



Function yLimpMode()

	lSizeMode := .f.
	lDragMode := .f.
	lDraHighM := .f.
	nColSel1 := 0
	nColAntx := 0

	lAndamento := .f.

	lTrack39 := .f.

	//msginfo('L Mode')

Return

Static Function xOrdene( nCol1 , lAsc1 )

	Local aZZ1    := yRetArray()
	Local aM1     := Iif(nCol1 > 0 , aMapsCol[nCol1] , {} )
	Local nPos1
	Local nTam1
	Local aM4 := {}



	Local nTipo
	Local nTamPg := xRetTamPg()
	Local nPagNum := 1
	Local nCont5 := 0


	Local aZZ2 := {}
	Local aZZ3 := {}
	Local nX1

	nPos1 := aM1[7]
	nTam1 := aM1[6]
	nTipo := Alltrim(aM1[4])

	SetWindowCursor( GetFormHandle(cHeaderJan)  , 'CURSOR1'  )

	DoEvents()



	xAtuDados(   nCol1 , lAsc1 , aColsTam  )

	DoEvents()

	xCursorWait(.f.)


	BT_ClientAreaInvalidateAll(   cHeaderJan )
	SysWait(0.02)


	xDcBarHeader()
	yDcBarH1eMtr()

	yGoTop()


Return


Static Function xFormDt(cData , n1 , n2 )
	Local cD1 := Alltrim(Left(  Alltrim(  Substr(cData , n1 , n2  )     ) , 10  ) )


Return Right(cD1,4) + Substr(Cd1,4,2) + Left(cD1,2)


Function xRetAscan(nd1)
	Local	nI1 := Ascan(aMapsCol , { |a| (a[2] <= nD1) .And. (a[3] >= nD1)  })
REturn nI1



Static Function xAtuDados(   nIndice1 , lAscedente , aTams  , lTrocaCol )


	/*
    Local aCampos := GetCamposDic( cTabela, 'S' , .t. , .t. )
	Local aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )	
	Local aTips   := GetCamposInf( cTabela, 'TIPO' )
    */


	Local aMz1
	Local aZZ1    := yRetArray()
	Local cTexto  := ''

	//  Local aM4     := {}
	Local aZ1     := {}
	Local nQAcento := 0
	Local nTam
	Local nTam1
	Local lAtivo
	Local nNum2
	Local cTxt1 := ''
	Local cTipo := ''
	Local nX1  := 1
	Local cCOrd := ''
	Local cChaveOrd := ''
	Local nQ1
	Local l1 := .f.
	Local aMtr1 := {}

	Local nTot2 := 0
	Local Val1 := ''
	Local aM4  := {}


	DEFAULT nIndice1   := 0
	DEFAULT lAscedente := .f.
	DEFAULT lTrocaCol := .f.





	If (nIndice1 > 0)
		If lAscedente
			aM4 := Asort(aZZ1 ,,, { |a,b|  a[nIndice1] <  b[nIndice1]  })
		Else
			aM4 := Asort(aZZ1 ,,, { |a,b|  a[nIndice1] >  b[nIndice1]  })
		End If
	End If

	DoEvents()
	SetArray( aM4 )



	DoEvents()

	If _IsWindowDefined(c_BrowName)

		nTot2 := xMapCols( aCabecs , aTams , aTipsy  )
		nQ1 := yCalcEtap1(  nTot2  )


		If (nTot2 <= GetProperty( c_BrowName , 'Width') )
			yEnable1Bh(  .f. )
		Else
			yEnable1Bh(  .t. )
		End If

		DoEvents()

		BT_ClientAreaInvalidateAll(c_BrowName )
		DoEvents()
		yDctoDc()

		SysWait(0.04)

	End If

REturn


Function xGetColSw1()
Return nColSele


Function xGetColQw1()
Return Len(aMapsCol)





Function xGetColW1(   nColuna )





	If nColuna > Len(aMapsCol)
		msginfo('eror1')
	End If



Return aMapsCol[ nColuna  ][5]



Function xGetInfCw1(   nColuna , nIndice  )
Return aMapsCol[ nColuna  ][nIndice]


Static Function xColMEsquerda( nLargura )

	Local nCol := 1
	Local nWidth
	Local nPos1
	Local nPos2
	Local lScrool1
	Local nQt1 := xGetColQw1()

	While .t.


		nWidth := xGetColW1(  nCol    )
		nPos1 := xGetInfCw1(   nCol , 2  )
		nPos2 := xGetInfCw1(   nCol , 3  )

		lScrool1 := (nPos2 >= nLargura)

		If (lScrool1) .or. (nCol = nQt1 )
			Exit
		End If

		nCol++

	Enddo




Return nCol


Function yColsVisible(nPos1 )

	Local am1 := {}
	Local n1 := 0

	For n1 := 1 To Len(  aMapsCol )

		If (aMapsCol[n1][3] <= (nPos1+3) )
			Aadd(aM1 , n1)
		End If
	Next



Return aM1

Function ySelCol( nCol1 )

	nColSele := nCol1
	BT_ClientAreaInvalidateAll(cHeaderJan)

	DoEvents()
	yDcBarH1eMtr()

	SysWait(0.02)





Return

Function EventHeaMtr()

	//( nHWnd, nMsg, nWParam, nLParam  )

	Local nRow
	//Local nCol
	Local lOk  := .f.
	Local nColx
	Local ar1
	Local aCords := {}
	Local n1
	Local n2
	Local Height := GetProperty( cHeaderJan  , 'Height')
	Local nColx2 := 0
	Local i

	Local nLimite1 := xh_InitLim()

	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
	LOCAL  nLParam := EventLPARAM()

	Local nZ1 := 0
	Local lFrente1 := .f.
	Local nLastro1 := 0

	//  Local nUnit := xRetUnit()
	// Local nColx

	Local nCol := 0
	Local nSaveCol1 := 0
	Local nQTotEt := 0

	//CalcEtapas()
	//-(nColHeader)

	//msginfo(Str(  nQTotEt     ))

	If !_IsWindowDefined(cHeaderJan)
		Return
	End If

	/*
          IF GetNotifyCode ( nLParam ) == -3
              msginfo('lp33')
              
      
          ENDIF
          */  

	If nHWnd == GetProperty(  cHeaderSombra   , "HANDLE" )
		//   msginfo('12')
	End If


	If nHWnd == GetControlHandle(  'Label2' ,  cHeaderSombra )


		If (nMsg == WM_LBUTTONDBLCLK)

			nColSele := nColSel1
			UxLib96()

			lAscending    := !lAscending
			nOrdemSel     := nColSele

			BT_ClientAreaInvalidateAll(cHeaderJan)
			SysWait(0.01)
			xDcBarHeader()

			If (nOrdemSel > 0) .And. (nOrdemSel <= Len(aCabecs))
				If nOrdemSel <= Len(aMapsCol)
					xOrdene( nOrdemSel , lAscending )
				End If
			End If


		End If


		If (nMsg == WM_LBUTTONDOWN)


			DoEvents()

			nColSele := nColSel1

			DoEvents()
					

			If (nColSele <= 0) .Or. (nColSele > Len(aMapsCol) )
				Return
			End If

			xCaptBmp(nColSele)

			UxLib96()

			nColSav1 := aMapsCol[nColSele][2]
			nColTam1 := aMapsCol[nColSele][5]
			cTituloCol := aMapsCol[nColSele][1]


			BT_ClientAreaInvalidateAll(cHeaderJan)
			SysWait(0.02)
			xDcBarHeader()

			GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
			nColx := ar1[2]

			nColx5 := nColX

			If (lSizeMode)


				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				lAndamento := .t.

				nSaveCol1 := nColSel1
				nUnit := xRetUnit()
				lOk  := .f.


				While (.t. )

					If (GetAsyncKeyState(VK_LBUTTON)) == 0
						Exit
					End If

					lAndamento := .t.

					GetCursorPos (@nCol, @nRow)
					ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
					nColx2 := ar1[2]

					nColDrag := nSaveCol1


					If (Abs(nColx2 - nColx) >= nUnit )

						If (nColx2 > nColx)
							aMapsCol[nSaveCol1][5] += Abs(nColx2 - nColx)
							aColsTam[nSaveCol1] += Int(Abs(nColx2 - nColx) / nUnit)
						Else
							aMapsCol[nSaveCol1][5] -= Abs(nColx2 - nColx)
							aColsTam[nSaveCol1]    -= Int(Abs(nColx2 - nColx) / nUnit)
						End If

						xMapCols( aCabecs , aColsTam , aTipsy )

						BT_ClientAreaInvalidateAll(cHeaderJan)
						SysWait(0.02)


						xDcBarHeader()
						yDcBarH1eMtr()

						lOk  := .t.
						nColx := nColx2

					End If

					SysWait(0.01)

				Enddo

				If lOk


					nHw1 := CursorOn1( cHeaderSombra  )

					SetWindowCursor(  GetControlHandle( 'Label2' , cHeaderSombra)  , 'CURSOR1'  )
					DoEvents()
					xMapCols( aCabecs , aColsTam , aTipsy )
					BT_ClientAreaInvalidateAll(cHeaderJan)
					xDcBarHeader()
					DoEvents()
					ySetTam( aColsTam )
					xAtuDados( 3 , .t. ,  aColsTam  )
					SetWindowCursor(  GetControlHandle( 'Label2' , cHeaderSombra)  , 'IDC_ARROW'  )
					yGoTop()
					DoEvents()
					yRefresh( c_BrowName )
					nColx5 := 0

					xH_CalcBar()
					DoEvents()

					CursorOff1( nHw1   , cHeaderSombra  )

				End If

				lSizeMode := .f.
				lAndamento := .f.

			Else


			End If

		End If




		If (nMsg == WM_LBUTTONUP)

			lSizeMode := .f.
			lDragMode := .f.
			lAndamento := .f.

			lDraHighM := .f.

			nColSav1 := 0
			nColx5 := 0
			//msginfo('3332')



		End If

		If (nMsg == WM_MOUSEMOVE)
			xLimpBarV()

			s1 := ''
			s2 := ''

			GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
			nColx := ar1[2]

			If (!lDisphint)
				DoEvents()
				SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , Hb_AnsiToOem('Click e Arraste a Coluna para Mudar de Posição.')   )
				SysWait(0.01)

				lDisphint := .t.
			End If

			nColx5 := 0
			i:=1

			nQT1 := xH_xClcDir(  Len(aMapsCol[1])   ) - 1


			//msginfo(Str( nQt1 ))

			For i := 1 To 255
				GetAsyncKeyState(i)
			Next i

			lDragMode := .t.

			While (GetAsyncKeyState(VK_LBUTTON) != 0)

				GetCursorPos (@nCol, @nRow)
				ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
				nColx := ar1[2]

				If (nColx5 == 0)
					nColx5 := nColx
				End If

				If ( Abs(nColx - nColx5) > 1)

					DoEvents()
					nTarget := xBusqTar( nColSav1  , lFrente1 )

					DoEvents()

					If (nColx < 10) .And. (nColSele > 0) .And. (nQConter > 1)
						nZ1 := xDoScrolV( .f. , .t. , .t.  , .f. )
						nQConter--
						nColSav1 -= nZ1
						xMoveWin( nColSele , nColSav1 , lFrente1 )
						SysWait(0.03)
						DoEvents()
						yUpHead1(  cHeaderJan , -(nZ1) )
						DoEvents()
					Else 

						If (nColx > (nLimite1 - 10) ) .And. (nColSele > 0) .And. (nQConter <= nQT1)
							nZ1 := xDoScrolV( .t. , .t. , .t.  , .f. )
							nQConter++
							nColSav1 += nZ1
							xMoveWin( nColSele , nColSav1 , lFrente1 )
							SysWait(0.03)
							DoEvents()
							yUpHead1(  cHeaderJan , (nZ1) )
							DoEvents()
						Else
							If (nColx  > nColx5)
								lFrente1 := .t.
								nColSav1 += ( nColx - nColx5  )
							Else
								lFrente1 := .f.
								nColSav1 -= ( nColx5 - nColx  )
							End If

							If (nTarget > 0)
								nColTarget := nTarget
								BT_ClientAreaInvalidateAll(   cHeaderJan )
								xDcBarHeader()

								DoEvents()
								SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , hb_AnsitoOem('Trocar a Posição , Coluna ' + QuotedStr(Alltrim(aMapsCol[nTarget][1]  )) ) )
								SysWait(0.01)

							End If

							lDragMode := .t.

							xMoveWin( nColSele , nColSav1 , lFrente1 )
							nColx5 := nColx

							If !lMove1
								lMove1 := (nColSele != nColTarget)
							End If

						End If

					End If 	
					DoEvents()

				Else


				End If

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

			Enddo

			If  (lMove1) .And. (nColSele > 0) 
			
			    If (nColSele != nColTarget) 				
				    xTroquePos(nColSele , nColTarget , aCabecs[nColSele] )
					DoEvents()
				End If  	

				nColSele1 := 0
				nColSele  := 0
				DoEvents()
				yRefresh( c_BrowName )
				DoEvents()
				lMove1 := .f.
				lDragMode := .f.

				BT_BitmapRelease(hBit201)
				hBit201 := Nil	

				SysWait(0.05)
				xH_CalcBar()
				SysWait(0.04)
			    	
			End If

			//msginfo('ok2')


             /*
			If (nColx5 > 0)


				nLim1 := xGetInfC(nColSele , 2)
				nTamx := Int(xGetColWidth(  nColSele    )	/ 2)


				If ( Abs(nColx - nColx5) > 1)
					DoEvents()
				//	yDoHint(   ,   Hb_AnsiToOem('Click e Arraste a Coluna para Mudar de Posição.')  )

					DoEvents()

					//msginfo('l1')

					//.And. (  (nColx <=  ( (nLim1 + nTamx + 20)) )     )
					lDragMode := .t.

					nQTotEt := xH_xClcDir(   Len(aMapsCol[1])     )				
					nColx5 := nColx

					//  SysWait(0.02)


					//SysWait(0.05)
					// DoEvents()


					nQDrag1 := xRetPgNum()


					While lDragMode

						For i := 1 To 255
							GetAsyncKeyState(i)
						Next i

						If (GetAsyncKeyState(VK_LBUTTON)) == 0


							If (nColSele != nColTarget) .And. xTroquePos(nColSele , nColTarget , aCabecs[nColSele] )								
								nColSele1 := 0
								nColSele  := 0
								DoEvents()
								yRefresh( c_BrowName )								
								DoEvents()							
							End If

							lDragMode := .f.
							lDraHighM := .f.
							lDisphint := .f. 
							nColx5 := 0
							nColMove := 0
							nColY1   := 0
							nIncr1   := 0
							nColSav1 := 0
							nColTam1 := 0
							nColTarget := 0
						

							Exit


						End If

						GetCursorPos (@nCol, @nRow)
						ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
						nZ1 := ar1[2]

						If (nZ1 != nColx5) .or. (nZ1 <= 1)

							//DoEvents()


							If nLastro1 == 0
								nLastro1 := Abs(   (-(nColHeader) + nColX5)  - nColSav1)

								If (nColTam1 <= nLastro1)
									nLastro1 := int(nColTam1/2)
								End If

							End If


							If nZ1 > nColx5
								lFrente1 := .t.
								nColSav1 += (  nZ1 - nColx5  )
								lScrool1 := (  nZ1  >= (GetProperty( c_BrowName , 'Width') - 13) )
								nTarget := xBusqTar( nColSav1 + nColTam1 , lFrente1 )
							Else
								lFrente1 := .f.
								nColSav1 -= (  nColx5 - nZ1  )
								nTarget := xBusqTar( nColSav1  , lFrente1 )
								lScrool1 := ( nZ1 <= 1)
							End If


							xMoveWin( nColSele , nColSav1 , lFrente1 )
						    yDoHint(    ,   'Movendo a Coluna ... ')
							DoEvents()

							If (nTarget > 0) .or. (lScrool1)

								If  (lScrool1)
									 yDoHint(    ,   Alltrim(Str(nTarget)) + ' SS ' + Alltrim(Str(  (GetProperty( c_BrowName , 'Width') - 13)  )) )
								End If

								DoEvents()


								If (nTarget > 0)
									nColTarget := nTarget
									BT_ClientAreaInvalidateAll(   cHeaderJan )
									xDcBarHeader()

									DoEvents()
									xDoHint(    ,   'Trocar a Posição , Coluna ' + Alltrim(aMapsCol[nTarget][1]  )  )									
								End If


								DoEvents()

								While ((lScrool1) .And. (nQDrag1 <= nQTotEt) .And. (lFrente1)) .Or. ;
										((lScrool1) .And. (nQDrag1 > 0) .And. (!lFrente1))


									If !lFrente1
										DecrLeft()
										UpdateBarH( -nConst1  )
									End If

							
									If lFrente1
									//	nZp1 := ScrollCol( .t. , .f. )
										lOk1 := xDoScrolV( .t. , .t. , .t. )
									Else
									//	nZp1 := ScrollCol( .f. , .f. )
										//msginfo('voltando')
										nZp1 := yScrollCaM( lFrente1 , .f. , nW1 , .f. )
										
									End If
							

									nZp1 := yScrollCaM( lFrente1 , .t. )
									SysWait(0.02)
									
									If (nZp1 != 0)

										SysWait(0.04)

										If lFrente1
											nQDrag1++
											//UpdateBarH( nConst1  )
										Else
											nQDrag1--
										End If

										DoEvents()

										xDoHint(    ,   'Posicionando na Coluna ' + Alltrim(Str(nQDrag1))   )

										DoEvents()

										xDcBarH()
										SysWait(0.03)
										xDcBarHeader()
										nColSav1+=nZp1									

									Else


									End If

									SysWait(0.02)
									xMoveWin( nColSele , nColSav1 , lFrente1 )								
									SysWait(0.05)

									If (lFrente1)
										If (nQDrag1 >= nQTotEt)

											lFrente1 := .f.
											nColx5 := nZ1
											msginfo('Exit ' + Str(nQDrag1) + '   ' + Str( nQTotEt ))
											Exit
										End If
										
										msginfo(Str(nQDrag1) + '   ' + Str(nColSele)  + '   ' + aMapsCol[nColTarget][1]   )
									Else


										If (nQDrag1 == 0)
											nColHeader := 0
											nColTarget := 1
											lFrente1 := .t.
											nColx5 := nZ1
											nColSav1 := -(nLastro1)											
											SysWait(0.02)
											xMoveWin( nColSele , nColSav1 , .f. )
											SysWait(0.01)
											xZeraContador()
											DoEvents()
											Exit
										End If

									End If


								Enddo


							Else

							End If


						End If

						nColx5 := nZ1

					Enddo


				End If

			End If
			*/

			DoEvents()

			If !(GetAsyncKeyState(VK_LBUTTON)) == 0
				Return
			End If

			SetWindowCursor( nHWnd , IDC_ARROW)
			aCords := xSearchPos(  nColx )

			If Len(aCords) = 0
				lSizeMode := .F.
				lDragMode := .F.
				lAndamento := .f.
				lTrack39 := .f.
				xApagueH( cHeaderJan )
				xDcBarHeader()
				DoEvents()
				Return
			End If

			If ((nColx2 := xSearchLim(  nColx )) > 0) .And. (!lSizeMode)
				xDoHint(    , 'Redimensiona a Coluna ' + Hb_AnsiToOem(Alltrim( aMapsCol[nColx2][1])) + '  '  + Str(nColSel1))
				SetWindowCursor( nHWnd  , 'CURSORSIZE' )
				DoEvents()
				lSizeMode := .t.
				Return
			Else

				If  (_isWindowDefined("Win_Msg")) .And. (IsWindowVisible(  GetFormHandle('Win_Msg')    ))
					xHidehint()
				End If

				lSizeMode := .f.
				SetWindowCursor( nHWnd , IDC_ARROW)

			End If

			If (nColAntx != aCords[1][2]) .And. (nColAntx > 0 ) .And. (nColAntx <= Len(aMapsCol) )

				nColSel1 := 0

				n1 := aMapsCol[  nColAntx  ][2]
				n3 := aMapsCol[  nColAntx  ][5]


				BT_ClientAreaInvalidateAll(   cHeaderJan )
				nColAntx := aCords[1][2]
				lTrack39 := .f.
				DoEvents()
				xDcBarHeader()
				DoEvents()

			End If

			If Len(aCords) > 0

				If !lTrack39
					//DoEvents()

					SysWait(0.02)
					nColSel1 := aCords[1][2]
					//lTracking546 := .t.



					UxLib96()

					//msginfo(' Dbl ' + Str( nColSel1 ))


					nColAntx := aCords[1][2]

					n1 := aMapsCol[  nColSel1  ][2]
					n3 := aMapsCol[  nColSel1  ][5]
					BT_ClientAreaInvalidateAll(   cHeaderJan )
					DoEvents()
					yDcBarH1eMtr()

					SysWait(0.02)
					//DoEvents()

					lTrack39 := .t.

				End If

			End If


		End If

	End If


Return



Static Function xTroquePos(nColSele , nColTarget , cCabec1 )

	//Local cC1 := aCa[nColSele]
	Local cC1 := aCabecs[nColTarget]
	Local nN1  := aColsTam[nColTarget]
	Local cTp  := aTipsy[nColTarget]
	Local nH1
	Local c1  := aCabecs[nColSele]
	Local n2  := aColsTam[nColSele]
	Local c3  := aTipsy[nColSele]
	Local n1  := Len(aCabecs)

	nH1 := CursorOn1( cHeaderSombra )

	
	//msginfo(Str(   Len(aCabecs)  )   + '   ' +  Str(   Len(aColsTam)  )   )



	Adel( aCabecs ,  nColSele )
	Asize(aCabecs , n1 - 1)

	Adel( aColsTam ,  nColSele )
	Asize(aColsTam , n1 - 1)

	
	Adel( aTipsy ,  nColSele )
	Asize(aTipsy , n1 - 1)
	
    DoEvents()

	Hb_Ains( aCabecs ,   nColTarget  , c1 , .t.  )
	Hb_Ains( aColsTam ,  nColTarget  , n2 , .t.  )
	Hb_Ains( aTipsy   ,  nColTarget  , c3 , .t.  )

    DoEvents()

	


	ySetTam( aColsTam )
	DoEvents()

	xChangeOrd(   nColSele , nColTarget )
	xMapCols( aCabecs , aColsTam , aTipsy )

	BT_ClientAreaInvalidateAll(   cHeaderJan )
	DoEvents()
	yDcBarH1eMtr()

	xH_CalcBar()

	SysWait(0.02)
	CursorOff1(  nH1  , '')


REturn .t.


Static Function xBusqTar( nPoint , lFrente5 )

	Local nColz1 := 0
	Local nQtt   := nQT1
	Local nLimite := xGetInfCw1( nQtt , 2)


	If lFrente5
		N1 := Ascan( aMapsCol , { |a| Abs(a[2] - nPoint) <= 25     })

		If n1 == 0
			If ((nLimite - nPoint) <= 10)
				n1 := nQtt
			End If
		End If

	Else
		N1 := Ascan( aMapsCol , { |a| Abs(a[3] - nPoint) <= 25     })
	End If


	nColz1 := n1


Return nColz1


Static function xMoveWin( nColuna , NColIni   )


	nColMove := nColuna
	nColY1   := nColIni

	BT_ClientAreaInvalidateAll(   cHeaderJan )
	yDcBarH1eMtr()


	DoEvents()


Return


Function yRelColSel()
REturn nColSel1


Function yApagueH( cJanela1 )

	Local n1
	Local n3
	Local Height := GetProperty( cJanela1  , 'Height')
	Local lRet := .f.


	DoEvents()



	If (nColSel1 > 0)

		lTrack39 := .f.
		lTracking546 := .f.
		n1 := aMapsCol[  nColSel1  ][2]
		n3 := aMapsCol[  nColSel1  ][5]
		nColSel1  := 0
		nColAntx := Len(aMapsCol) - 1

		DoEvents()

		//msginfo('y Apag')

		BT_ClientAreaInvalidateAll(   cJanela1 )
		SysWait(0.02)


		xDcBarHeader()
		yDcBarH1eMtr()

		lRet := .t.


	End If

	//SysWait(0.02)



Return lRet



Static Function xRetTotal(   nCol1   )

	Local n1 := 0
	Local n2 := 0

	For n1 := 1 To Len(aMapsCol)

		If n1 <= nCol1
			n2 += aMapsCol[n1][5]
		End If
	Next

	//Aeval( aMapsCol , { |  a |  n1 += a[5] })


Return n2

Function xRetTam( nTam )
	//Local nTam := 0
	Local hDC
	Local hFont
	Local BTstruct
	Local cTexto
	Local n12
	Local cFontHead := FONTBROWSER
	//FONTBROWSER

	hDC = BT_CreateDC ( cHeaderJan  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	hFont := HMG_CreateFont (  hDC , cFontHead, FONTBROWSERSIZE, .f., .f., .f., .f. )

	cTexto := Replicate('A' ,  nTam )
	n12 := GetTextWidth( hDC , cTexto , hfont )

	BT_DeleteDC (BTstruct )


Return n12



Static Function xMapCols( aCabs , aTamx1 , aTipos1  )

	Local i := 0
	Local nPos1 := 1
	Local nColx := nColIniBrw
	Local nTam1
	Local nTam
	Local BTstruct
	Local nQAcento
	Local nTam12 := 0
	Local nAcum := 1
	Local hDC
	Local nAcum2 := 0
	Local cFont1 := FONTBROWSER
	//'Arial'
	//FONTBROWSER

	hDC = BT_CreateDC ( cHeaderJan  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	hFont := HMG_CreateFont (  hDC ,  cFont1 , FONTBROWSERSIZE, .f., .f., .f., .f. )

	aMapsCol := {}

	For n1 := 1 To Len(aCabs) + 1

		If (n1 < (Len(aCabs) + 1))
			nTam1  := aTamx1[n1]
			nQAcento := QtAcento(Alltrim(aCabs[n1]) )
			nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
			cTexto := Replicate('A' ,  nTam1 + 1  )
			n12 := GetTextWidth( hDC , cTexto , hfont )
			nTam := n12
			nAcum2 += ( (nColx +  nTam + 1 ) - nColx )
			Aadd( aMapsCol , {   aCabs[n1] , nColx , nColx +  nTam , aTipos1[n1] ,   nTam ,  aTamx1[n1] , nAcum  , nAcum2 }  )

			//		SaveLog('Colunas.txt' , aMapsCol[n1][1] + '  ' + Str(aMapsCol[n1][2])  + '   ' + Str(aMapsCol[n1][3]) + '   ' + Str(aMapsCol[n1][5]) + XQUEBRA   )
			nColx += (nTam + 1)
			If (nTam >=  nLimiteAtu)
				Return .f.
			End If
			nAcum += aTamx1[n1]+2
			nTam12 += nTam
		Else

			nTam1 := 10
			cTexto := Replicate('A' ,  nTam1 + 1  )
			n12 := GetTextWidth( hDC , cTexto , hfont )
			nTam := n12

			nAcum += 11
			nAcum2 += ( (nColx +  nTam + 1 ) - nColx )

			Aadd( aMapsCol , {   '   ' , nColx , nColx +  nTam + 1 , 'C' ,   nTam ,  10  , nAcum  , nAcum2 }  )


		End If

	Next




	//msginfo(Str(     nAcum2 ))




	//Altd()
	/*

    RemoveHandler('EventBrowMtr')
    RemoveHandler('EventBarMtr')
    RemoveHandler('EventHeaMtr')
    RemoveHandler('EVENTHNDCLI')    
    RemoveHandler('EventHndMain')

    SysWait(0.06)


    DoEvents()
    */


	/*

    RemoveHandler('EventBrowMtr')
    RemoveHandler('EventBarMtr')
    RemoveHandler('EventHeaMtr')
    RemoveHandler('EVENTHNDCLI')    
    RemoveHandler('EventHndMain')

    SysWait(0.06)
    */



	BT_DeleteDC (BTstruct )


	/*

    nres := xLimColResto( nLimiteAtu )

    nColl1 := xLimCol( nLimiteAtu )
    nPl1 := xLimPulo(1 , nres)   
    */



	//msginfo(Str( nTam12 ))



Return nAcum2

Function xH_RtLimite()
Return nLimiteAtu

Function xH_IncLim( nValor )
	nLimiteAtu += nValor
Return

Function xH_DecLim( nValor )
	nLimiteAtu -= nValor
Return


Function xH_xClcDir( nTotCol1 )

	Local nCol1 := 0
	Local nSaldo1
	Local lOk  := .f.
	Local nY1  := xH_RtLimite()


	While !lOk

		nCol1++

		If (nCol1 <= nTotCol1)
			nSaldo1 := xGetInfCw1(   nCol1   , 5  )

			If (nCol1 == 1)
				nSaldo1 += nColIniBrw
			End If

			If ((xGetInfCw1(  nCol1 , 2  ) + nY1) > xCalcTam())
				lOk := .t.
				Exit
			End If
		Else
			nCol1 := 1
			Exit
		End If

	Enddo

	//msginfo(   ' -> ' + Str(nCol1)  )


Return (nCol1)


Function xH_LQtot( nTipo )

	Local nRet := 0
	Local n1 := 1
	Local n2 := 0
	Local nQ1 := 0
	Local nSom1 := 0
	Local nSAldo1
	Local aMInfo := {}
	Local nQPasso := 0
	Local lOk := .f.
	Local nLim1 := nTotz2 - xH_RtLimite()
	Local nLimz := aMapsCol[  Len(aMapsCol) ]
	Local nTotz1 := 0
	Local nY1 := xH_RtLimite()

	Local nTotz4 := xH_RtLimite()

	DEFAULT nTipo := 1

	While !lOk

		nSaldo1 := xH_ColResto( xH_RtLimite() )
		aMInfo  := xH_CalcPulo( nQ1 + 1 , nSaldo1)
		nTotz1 += aMInfo[1]
		nTotz4 += aMInfo[1]

		yIncConter( .t. , aMInfo[2] )
		xH_IncLim( aMInfo[1] )
		nQPasso++

		nQ1 += aMInfo[2]

		If ((xGetInfCw1(  yRetContador() , 2  ) + nY1) > xCalcTam())
			lOk := .t.
			Exit
		End If
	Enddo


	nRet := nQ1

REturn Iif(nTipo == 1 , nQPasso  , nQ1 )

Function xH_CalcPulo(nColIni , nSalto)

	Local n1 := 0
	Local nz1 := nColIni
	Local nPulo := 0
	Local nSoma := 0
	Local lOk := .f.
	Local nQColy := 0



	If (nColIni == 1)
		nSoma := nColIniBrw
	End If


	While (!lOk) .And. ( nZ1 <= Len(aMapsCol) )

		nSoma += aMapsCol[nz1][5]
		nQColy++

		If (nSoma >= nSalto)
			lOk   := .t.
		Else

		End If

		nZ1++

	Enddo

	nPulo := nSoma

Return ({nPulo,nqColy})



Function xH_ColResto( nLimite )


	Local nCol1 := 0
	Local nResto := 0
	Local nIndice := Ascan(aMapsCol , { |a|  a[3] > nLimite  }  )
	Local nSoma := 0
	Local n1 := 1

	If (nIndice > 0)
		nResto := aMapsCol[nIndice][3] - nLimite
	End if

Return nResto




Function xH_ColVolta( nLimite1  )

	Local nCol1 := 0
	Local nResto := 0
	Local nIndice := Ascan(aMapsCol , { |a|  (a[2] <= nLimite1) .And. (a[3] >= nLimite1)  }  )

	If (nIndice > 1)
		nResto := nLimite1 - aMapsCol[nIndice][2]
	Else
		nResto := aMapsCol[1][5]+nColIniBrw
	End if

Return nResto

Function Xh_LimCol( nLimite )

	Local nCol1 := 0
	Local nResto := 0
	Local nIndice := Ascan(aMapsCol , { |a|  a[3] > nLimite  }  )

Return nIndice




Static Function xRetUnit()

	Local BTstruct
	Local nQAcento
	Local hDC
	Local hFont
	Local n12

	hDC = BT_CreateDC ( cHeaderJan  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )

	n12 := GetTextWidth( hDC , Replicate(' ' ,  1  ) , hfont )

	BT_DeleteDC (BTstruct )



REturn n12



Static Function xSearchLim(  nCol1 )

	Local nColuna := 0
	Local n1
	Local aMatriz := {}
	Local nCol := -(nColHeader)
	Local nColz1
	Local nRow1
	Local ar1
	Local nColX
	Local aCords := {}
	Local nHWnd := GetFormHandle(  cHeaderJan )



	GetCursorPos (@nColz1, @nRow1)
	ar1 := GetPos_ScreenToClient(   nHWnd , nRow1 , nColz1 )
	nColx := ar1[2]

	aCords := xSearchPos(  nColx )

	n1 := Ascan(  aMapsCol , { |a|   Abs( (a[3]+nCol) - nCol1 )  <= 20    }     )


	If (n1 > 0) .And. (Len(aCords) > 0)
		If (aCords[1][2]  == n1)
			If (nColSel1 == aCords[1][2])
				nColuna := n1
			End If
		End If
	End If

REturn nColuna


Static Function xSearchPos(  nCol1 )

	Local nColuna := 0
	Local n1
	Local aMatriz := {}

	Local nCol := -(nColHeader)


	n1 := Ascan(  aMapsCol , { |a| (  (a[2]+nCol) <= nCol1) .And. ( (a[3]+nCol) >= nCol1) } )


	If n1 > 0
		nColuna := n1
		Aadd(aMatriz , { aMapsCol[n1][1] ,nColuna   })
	End If


REturn aMatriz


Function yUpHead1( cHeader1 ,  nValor   )


	nColHeader += nValor
	BT_ClientAreaInvalidateAll (cHeader1)

return

Static Function isDrgMode()

REturn (lDragMode)

Function yDragOff()

	lSizeMode := .f.
	lDragMode := .f.
	lAndamento := .f.

	nColTarget := 0

	nColSav1 := 0
	nColx5 := 0

	BT_ClientAreaInvalidateAll(  cHeaderJan)


REturn


Function DraVertL( hDc1 , nCol , nHeight1 )

	BT_DrawLine ( hDc1, 0 , nCol   , nHeight1 , nCol    ,   {63,69,72}, 1 )
	BT_DrawLine ( hDc1, 0 , nCol+1 , nHeight1,  nCol+1  ,   {144,152,157}, 1 )


Return

Static Function xCaptBmp(nCol1)

	Local nTam1  := aMapsCol[nCol1][3] - aMapsCol[nCol1][2]
	LOCAL Height := BT_ClientAreaHeight (cHeaderJan)
	Local nColx  := nColIniBrw
	
	nColx :=  (aMapsCol[nCol1][2] - 0) //13
	hBit201 := BT_BitmapCaptureWindow ( cHeaderJan , 0 , nColx , nTam1 - 1  , Height )

    Bt_BitMapSaveFile(  hBit201 , 'hBity221.Bmp'    )

Return

Static Function xPaintHeader( cJanela , aCabec  , aTamanho , aTps2 )

	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)
	Local BTstruct
	Local cTexto  := ''
	Local cTexto1 := ''
	Local n1     := 1
	Local nLinha := 5
	Local nCol21
	Local nTam1 := 0
	Local cFontHead := 'Arial'
	//FONTBROWSER
	Local nfontSize := 9
	Local nTamx1 := GetTextoTam( 'A'  , cActiveJan )
	Local hFont
	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local nQAcento := 0
	Local nTam
	Local nTam2
	Local nCol := -(nColHeader)
	Local nColx := nColIniBrw
	Local hBitOk := BT_BitmapLoadFile ('OKMARK22')


	Local hBitOrd1 := BT_BitmapLoadFile ('SETTA')
	Local hBitOrd2 := BT_BitmapLoadFile ('SETAB')

	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )

	BT_DrawLine ( hDC, 0 , 0 , 0 , Width, {100,103,105}, 1 )

	If lEnabled2
		BT_DrawGradientFillVertical ( hDC ,   1 , 0  , Width    ,    Height - 1    , CORHEAD1  , CORHEAD1 )
	else
		BT_DrawGradientFillHorizontal ( hDC ,   1 , 0  , Width ,    Height  - 1  ,  {110,110,110}  , GRAY )
	End If

	//BT_DrawGradientFillHorizontal ( hDC ,   0 , 0  , Width ,    Height    ,  {128,128,128}  , {128,128,128} )

	BT_DrawLine ( hDC, Height - 1 , 0 , Height - 1 , Width, {75,75,75}, 1 )


	If (nColHeader > 0)
		nColx += nCol
	End If

	//BT_DRAWEDGE (hDC, 0 , 0 ,  Width     , Height ,  BDR_RAISED  , BF_LEFT + BF_RIGHT)


	BT_DrawBitmap (hDC  , 6 ,  (0+nColx) - 16  , 15  , 15 , BT_STRETCH, hBitOk)
	hFont := HMG_CreateFont (  hDC , cFontHead  ,  nfontSize , .f., .f., .f., .f. )

	nCol21 := 0



	For n1 := 1 To Len(aMapsCol)

		nTam1  := aMapsCol[n1][5]
		nQAcento := QtAcento(Alltrim( aMapsCol[n1][1]  ) )
		nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1


		If n1 <= Len(aTamanho)
			nTam2 := If( (nQAcento =  0)   , aTamanho[n1] , aTamanho[n1] + nQAcento ) //* nTamX1
		Else
			nTam2 := 15
			nTam1 := 15
		End If


		cTexto1 += Padc( Alltrim(  aMapsCol[n1][1] )   ,   nTam2 + 1  )



		If (nColSel1 > 0) .And. (nColSel1 = n1)
			If nColSel1 != Len(aCabecs)
				BT_DrawGradientFillHorizontal ( hDC ,   1 ,  nColx  , nTam - 1 ,    Height - 1    ,CORHEAD3 , CORHEAD4 )
			Else
				BT_DrawGradientFillHorizontal ( hDC ,   1 ,  nColx  , nTam + 250 ,    Height - 1    , CORHEAD3 , CORHEAD4 )
			End If

		Else


			If (nColTarget == n1)
				If nColTarget ==  Len(aCabecs)
					BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam + 300 ,    Height  - 1   ,CORHEAD3, CORHEAD4 )
				Else
					BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam - 1 ,    Height - 1   ,CORHEAD3 , CORHEAD4 )
				End If
			End If


		End If

		DraVertL( hDc  , nColx , Height - 1 )


		If (nOrdemSel == n1)
			nCol21 := nColx+4
		End If

		BT_DrawText ( hDC , nLinha  ,nColx + 5 ,     Padc( Alltrim(  Hb_AnsiToOem(aMapsCol[n1][1] ))   ,   nTam2 + 1  )   , cFontHead  , nfontSize , WHITE,  {230,230,230}   , ;
			nTypeText ,	nAlingText, nOrientation )

		nColx += nTam1

	Next


	nColx += aMapsCol[Len(aMapsCol)][5]
	DraVertL( hDc  , nColx , Height - 1 )

	If !lEnabled2
		REturn
	End If



	If (nColSele > 0)

		nColx := nColIniBrw

		If (nColHeader > 0)
			nColx += nCol
		End If

		nTam1  := aMapsCol[nColSele][5]
		nColx +=  (aMapsCol[nColSele][2] - 13)
		cTexto1 := aMapsCol[nColSele][1]


		nQAcento := QtAcento(Alltrim( aMapsCol[nColSele][1]  ) )
		nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
		nTam2 := If( (nQAcento =  0)   , aTamanho[nColSele] , aTamanho[nColSele] + nQAcento ) //

		cTexto1 := Padc( Alltrim(  aMapsCol[nColSele][1] ) ,   nTam2 + 1  )


		If nColSele != Len(aCabecs)
			BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  - 3 , nTam - 1   ,    Height - 1    ,  CORHEAD4, CORHEAD3 )
		Else
			BT_DrawGradientFillHorizontal ( hDC ,   1 ,  nColx  , nTam + 350   ,    Height  - 1   ,  CORHEAD4 , CORHEAD3 )
		End If

		If nOrdemSel == nColSele
			BT_DrawBitmapTransparent (hDC  , 6 ,  nColx+2 , 16  , 16 , BT_STRETCH, Iif(lAscending ,  hBitOrd1 ,  hBitOrd2 ) )
		End If


		BT_DrawText ( hDC , nLinha  , nColx,   Hb_AnsiToOem(cTexto1) , cFontHead  , nfontSize, WHITE,  {230,230,230}   , ;
			BT_TEXT_TRANSPARENT+BT_TEXT_BOLD ,	nAlingText, nOrientation )

		//If (hBit201 == Nil) .And. (!lDragMode)
		///	hBit201 := BT_BitmapCaptureWindow ( cJanela , 0 , nColx , nTam - 5  , Height )
		//End If

	End If


	If (lDragMode) .And. (nColMove > 0) .And. (nColMove <= Len(aMapsCol))
		nColx1 := aMapsCol[nColMove][2] // +nIncr1
		nColx2 := aMapsCol[nColMove][5]
		nColx1 := nColY1
		If (nColHeader != 0)
			nColX1 +=  -(nColHeader)
		End If
		BT_DrawBitmapAlphaBlend (hDC, 0 ,  nColx1  , nColx1+nColx2, Height, 110 , BT_COPY  , hBit201)
	End If


	BT_DrawLine ( hDC, 0 , 0 , 0 , Width, {100,103,105}, 1 )
	BT_DrawLine ( hDC, Height - 1 , 0 , Height - 1 , Width, {75,75,75}, 1 )



	BT_DeleteDC (BTstruct )
	BT_BitmapRelease (hBitOk)

	BT_BitmapRelease (hBitOrd1)
	BT_BitmapRelease (hBitOrd2)

	//BT_BitmapRelease(hBit201)



REturn

