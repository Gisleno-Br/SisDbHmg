
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


// Variaveis do Header
Static nColHeader    := 0
Static cHeaderJan    := ''
Static cHeaderSombra := ''
Static aMapsCol := {}
Static aColsTam := {}
Static aTipsy   := {}
Static aCabecs   := {}
Static nColSel1 := 0
Static nColAntx := 0
Static lDispHint1 := .f. 
Static lMove1 := .f.
Static lTrack39 := .f.
Static lSizeMode := .f.
Static lDragHeader := .f. 
Static lEnabled2 := .t.
Static bBlock1   := Nil 
Static lDisphint := .f.
Static c_BrowName := ''
Static lAndamento := .f.
Static nColDrag1 := 0
Static nOrdCol := 0
Static s1 := ''
Static s2 := ''
Static nOrdemSel := 0
Static lAscending := .f.
Static nColSele := 1
Static nSteps    := 5
Static nColx5    := 0
Static nColMove := 0
Static nColY1   := 0
Static nIncr1   := 0
Static nColSav1 := 0
Static nColTam1 := 0
Static nColTarget := 0
Static cTituloCol := ''
Static hBit201 := Nil
Static nLimiteAtu := 0
Static hBitOk 
Static hBitOrd1 
Static hBitOrd2 

Static bBlkEdit

Static lCheckBox := .f. 

Static aDataOrig := {}

Static nIndDel := 0


Static a_Bmp1 := Nil 
Static a_Bmp2 := Nil 
Static a_Bmp3 := Nil 
Static a_Bmp4 := Nil 
Static a_Bmp5 := Nil 

Static aArrayBmp := { }




//Variaveis do Browser 
Static nDragColi := 0
Static nLArgura := 0
Static aMt1 := {}
Static aOpx1 := 0
Static lHitB := .f.
Static l_HitB := .f.
Static lTracking85 := .f. 
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
Static l_Eofh := .f. 
Static l_Bofh := .t. 
Static cParentName := ''
Static cBrowserName := ''
Static cEspelhoBrw := ''
Static cBarraVfrm := ''
Static cBarraVSombra := ''
Static lLibera1 := .f.
Static nColLeft := 1
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
Static lDownMouse := .f.
Static lUpMouse := .f.
Static yBmp1 
Static yBmp2 
Static yBmp3 
Static zBmp1 
Static zBmp2 
Static zBmp3 
Static zBmpDel 
Static lFirst := .f. 
Static nQEtp := 0
Static nLargx := 0
Static nQxy := 1
Static lTrackingL1 := .t. 
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
Static lBrwVisible := .f.
Static nQCont1 := 1
Static nSave1 := 0
Static aMVisible := {}
Static nLinhaBarra := 1
Static nQtotPass := 0
Static nColScrool := 0
Static nAcumP  := 0
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
Static nColDragy := 0
Static lKeyPressed := .f.
Static nQtCol := 0
Static cBarrah := ''
Static lHasHeader := .f.
Static nColH1 := 0
Static nColEsquerda := 1
Static hFontBrw 
Static nPageNum := 0
Static lAtivo1 := .t.
Static nQy1 := 0
Static aCabec1 := {}
Static aTams2  := {}
Static aTips   := {}
Static l_Hitt := .t.
Static nColz2 := 1
Static nLimiteCol := 0
Static nAcumz5 := 0
Static lNoHorzScy := .f.
Static bBmpZ 
Static bBmpa 	
//Static hBitOk  
Static hBitExcl 

Static bBlkDel := Nil 




Static cBarraName2:= ''
Static cBarraSombra := ''
Static nLarTotalx := 0
Static nAcende := 0
Static lTracking26 := .f. 
Static lTracking37 := .f. 
Static nModeBut := 0
Static nSaveCol := 0
Static lDragMode := .f. 
Static nLargJan := 0
Static nScroxy := 19
Static lEnabledy := .t. 
Static cBrwName := ''
Static lScrollFim := .f. 
Static lScrolIni  := .f. 
Static nTamBarra := 0
Static nColtotal := 0
Static cHead1 := ''
Static nQ1 := 0
Static lDraHighM := .f. 
Static nPassoy := 0
Static lTracking44 := .f. 
Static yBmpDireita  
Static yBmpEsquerda 
Static yBmpDireitad
Static yBmpEsquerdad 
Static yBmpDireita2  
Static yBmpEsquerda2 



Static Function yRetLargura( aMatriz1 )

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

REturn nLarg



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


	If Len(	aMVisible ) == 0
		msginfo('Erro no MVisible')
	End If 


Return





Function xBrowserMtr( nRowIni ,  aDatas1 ,  bBlockMtr ,   cParent   , nLarg1  , cBrwName , nCol  , aCabecalho , aTamanhos , aTipos , lDicionario , lEnabled1 , nAltura1 ,   bFuncEdit  , ;
     bFunDel  , nIndiceDel )


	Local nTamWidth := yRetLargura(  aTamanhos  )
	Local nTam1 := GetTextoTam( ' '  , cParent )
	Local nIndex22
	Local aM1  := {}
	Private aOpx1 := 0
	DEFAULT nLarg1  := GetDeskTopWidth() - 40
	DEFAULT nCol := 10
	DEFAULT nRowIni   := 145
	//145
	DEFAULT aCabecalho := {}
	DEFAULT lDicionario := .t.
	DEFAULT lEnabled1   := .t.


	DEFAULT bFuncEdit := Nil 


	cParentName := cParent


	bBlkEdit := bFuncEdit

	nIndDel := nIndiceDel

	bBlkDel  := bFunDel
	nItemBrwHeight := nItemSubHeight 
	nTamPag := Int(  nAltura1 / nItemBrwHeight   )


	nPageTotal := Int(   Len(aDatas1)  / nTamPag  ) + 1
	nLimiteCol := nLarg1


	bBmpZ := xBmpToTrans( 'BOLAZAZUL1')
	bBmpa := xBmpToTrans( 'NGITRANS' , SELCOR , 20,20 )

	hBitOk     := BT_BitmapLoadFile ('NGITRANS')
	hBitExcl   := BT_BitmapLoadFile ('EXCLA1')

	
	yBmp1 := BT_BitMapLoadFile('SCRUP1')
	yBmp2 := BT_BitMapLoadFile('SCRUP2')
	yBmp3 := BT_BitMapLoadFile('SCRUP3')
	zBmp1 := BT_BitMapLoadFile('SCRDOWN1')
	zBmp2 := BT_BitMapLoadFile('SCRDOWN2')
	zBmp3 := BT_BitMapLoadFile('SCRDOWN3')

	zBmpDel := BT_BitMapLoadFile('DELETED1')



	hFontBrw := HMG_CreateFont (  GetDc( GetFormHandle('Main') ) ,  FONTBROWSER , FONTBROWSERSIZE, .f., .f., .f., .f. )


	aDataOrig := aDatas1

	aCabec1 := Aclone(aCabecalho)
	aTams2  := Aclone(aTamanhos)
	aTips   := AClone( aTipos)


	lAtivo1 := lEnabled1

	cJanObj := cParent



	nLargx := nLarg1

	nQtCol := Len(aCabecalho)

	aMt1      := Aclone(aDatas1)
	nMaxItem1 := Len(aDatas1)
	nItemBrwHeight := nItemSubHeight 
	//- 5
	nItemScrool := 0
	nLargTotal := nTamWidth
	lNoHorzScr := .f.


	aM1 := {}

    For nZ1 := 1 To Len(aDatas1)
       Aadd( aM1 ,  Eval(  bBlockMtr , nZ1 ) )    
    Next 

    aMt1 := Aclone(aM1)

	EncheMVis( nTamPag  , .f.  )

	cBrowserName  := cBrwName
	//'Win_Browser'
	cEspelhoBrw   := 'Win_Ert1' + Left(cBrowserName,6)
	cBarraVfrm 	  := 'Win_R1' +  Left(cBrowserName,6)
	cBarraVSombra := 'Win_Resp' +  Left(cBrowserName,6)
	cHeaderName   := 'Win_HeadMtr' + Left(cBrowserName,6)
	nQEtp := 0



	//PANEL ;
	DEFINE WINDOW &cBrowserName ;
		AT nRowIni - 1,nCol - 3 ;
		CHILD ;		
		PANEL ;
		PARENT &cParent ;		
		WIDTH nLarg1+5 HEIGHT nAltura1 + 2 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Nil ; 
		TITLE 'xBrowser' + Left( cParent ,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil  ;
		ON PAINT Iif( lLibera1 ,  xPaintBrwMtr( ThisWindow.Name , aMDisplay , 100 ,     nClearIt2  , lAtivo1  )  , ) 		
	END WINDOW
	

	//WIDTH nLarg1+5 HEIGHT nAltura1 + 2 VIRTUAL HEIGHT Iif(  Len(aMt1) > nTamPag , (Len(aMt1) * nItemBrwHeight) , Nil) VIRTUAL WIDTH Iif( nLargTotal+1 > nLarg1 ,  nLargTotal+1 , Nil) ;

	//PANEL ;		



	DEFINE WINDOW &cEspelhoBrw ;
		AT nRowIni - 1,nCol - 3  ;
		CHILD ;		
		PANEL ;
		PARENT &cParent ;		
		WIDTH nLarg1+5 HEIGHT nAltura1 + 2 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Nil ; 
		TITLE 'xEspelho' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR Nil ;
		ON MOUSEMOVE ( ObjSelected := 'aMtrBrowser' )


		DEFINE LABEL LabelBrw
			ROW    0
			COL    0
			WIDTH  nLarg1+5
			HEIGHT nAltura1 + 2
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

	nIndk1 := 4852
	//CREATE EVENT PROCNAME ProcOnKey() STOREINDEX nIndk1   
	//CREATE EVENT PROCNAME LabelBrwEvnt() HWND GetControlHandle(  'LabelBrw' ,  cEspelhoBrw ) STOREINDEX nIndex23

	CREATE EVENT PROCNAME xHandleEvent() STOREINDEX nIndk1   
	EventProcessAllHookMessage( nIndk1  , .t.)
	//EventProcessAllHookMessage(nIndex23 , .t.)
	
	nMaxBarh := GetProperty(  cBrowserName , 'Width'  )


	

	bBlock1 := bBlockMtr


	
   nindex230 := 133
  

	lAtivo1 := ((nLargTotal+1) > nLarg1)


	If Len(aDatas1) == 0
		lAtivo1 := .f. 
	End If 

	//aCabecalho := {}

	If Len(aCabecalho) > 0

		lHasHeader := xHeaderMtr( cHeaderName , aCabecalho , aTamanhos , cParent ,  cBrowserName ,  nLarg1  , aTipos , cTabela , ;
		 lAtivo1 , lDicionario , nRowIni - 2 , nCol )	

		If !lHasHeader
		//	Return .f.
		End If

	End If


	HMG_ChangeWindowStyle(  GetFormHandle(cEspelhoBrw) , Nil , WS_EX_STATICEDGE     ,  .t. , .T. )


	cBarrah := xBarHMtr( cParent ,  cBrowserName , nRowIni+nAltura1 + 4  , nLarg1  ,  nLargX , cBrowserName , ;
		(nQTotCol := xGetColQw1()) , nLarg1 - ((nLargTotal - nLargX) )   , cHeaderName , lAtivo1 , nCol	, lAtivo1 )


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



	DEFINE WINDOW &cBarraVfrm ;
		AT nRowIni - 30 ,nCol11 + 2  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 27 HEIGHT nAltura1 + 32 ;
		TITLE 'xScroxRoleol1' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
		ON PAINT xPaintScroll( ThisWindow.Name )
	END WINDOW


	DEFINE WINDOW &cBarraVSombra ;
		AT nRowIni - 30 ,nCol11 + 2  ;
		CHILD ;
		PANEL ;
		PARENT &cParent ;
		WIDTH 27 HEIGHT nAltura1+ 32 ;
		TITLE 'xScroxSombra' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE ; //{240,240,240}  ;
		ON MOUSEMOVE (cObjSelected := 'BarraV')
	END WINDOW



	SET WINDOW &cBarraVfrm TRANSPARENT TO Iif(  lAtivo1 , 0 , 190 )


	ShowScrollbar (GetFormHandle(cBrowserName ) , 0, .f.)
	ShowScrollbar (GetFormHandle(cBrowserName ) , 1, .f.)

	ShowScrollbar (GetFormHandle(cEspelhoBrw) , 0, .f.)
	ShowScrollbar (GetFormHandle(cEspelhoBrw) , 1, .f.)

	If _isWindowDefined(cBarraVfrm)
		ShowScrollbar (GetFormHandle(cBarraVfrm) , 0, .f.)
		ShowScrollbar (GetFormHandle(cBarraVfrm) , 1, .f.)

		ShowScrollbar (GetFormHandle(cBarraVSombra) , 0, .f.)
		ShowScrollbar (GetFormHandle(cBarraVSombra) , 1, .f.)

	End If	

	HMG_ChangeWindowStyle(  GetFormHandle(cBarraVSombra) , Nil , WS_EX_STATICEDGE     ,  .t. , .T. )

	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBrowMtr"  ) )  ) = 0
		nIndexEventX := 20050
		//CREATE EVENT PROCNAME xTecBrowMtr() STOREINDEX nIndexEventX
	End If


	If _isWindowDefined(cBarraVfrm)
		_ShowWindow(cBarraVfrm)
	End If

	If _isWindowDefined(cBarraVSombra)
		_ShowWindow(cBarraVSombra)
	End If




	
	If (lHasHeader)
		ShowScrollbar (GetFormHandle(cHeaderName) , 0, .f.)
		ShowScrollbar (GetFormHandle(cHeaderName) , 1, .f.)
		_ShowWindow(cHeaderName)
		BT_ClientAreaInvalidateAll(cHeaderName)
	End If
	

	//WinYeLLow( GetProperty(cParent , 'Row') + GetProperty(  cBrowserName , 'Height'  )+65 ,  ;
     //GetProperty(cParent , 'Col') + 25  , 'Click e Arraste Devagar para ' + XQUEBRA + ' Navegar entre as Colunas.'  )     

	nLimteLin := yCriaButs()	

Return .t.


Static Function ySetTam( aTamanhos )
	aTams2 := Aclone(  aTamanhos )
REturn


Function xHandleEvent()

	Local nHWnd := EventHwnd() 
	Local cForm1 := ''


	GetFormNameByHandle(   nHWnd , @cForm1     )

	If (nHWnd == GetControlHandle(  'LabelBrw' ,  cEspelhoBrw  ))
		LabelBrwEvnt(   EventMsg() )	
	End If 

	If _isWindowDefined(cBarraSombra )	
		If (nHWnd == GetProperty(  cBarraSombra , "HANDLE" )   )
			EventBarMtr( nHWnd, EventMsg() , ,  )					
		End If 
	End if 


	If (EventMsg() == WM_KEYDOWN) .And. (cForm1 == cParentName )		
		ProcOnKey( EventMsg() , EventWPARAM() )	
	End If 


	If _IsControlDefined('Label2' ,  cHeaderSombra)
		If (nHWnd == GetControlHandle(  'Label2' ,  cHeaderSombra ))			
			EventHeaMtr( nHWnd ,  EventMsg() )		
		End If 
	End If

	If _isWindowDefined(cBarraVSombra )
		If (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))		
			xTecBrowMtr( nHWnd , EventMsg() )		
		End If 
	End If 

    


REturn 


Function ProcOnKey( nEventMsg , nEvWPARAM  )

	Local lCtrl := .f. 

	Local nHWnd := EventHwnd() 


	//Edit Mode

	If _isWindowDefined('_InputWindow')
		Return 
	End If 
	

	If nEventMsg == WM_CHAR
		msginfo('l2p Char ' + Str(EventWPARAM()) )

	End If 

	If nEventMSG == WM_KEYDOWN

		If (nEvWPARAM == VK_RIGHT)
			lScrollFim := ( (xGetScrolPos()+ xH_RtLimite() ) <= xCalcTam()  )			
			If  !lScrollFim
				//xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal.")  )
				Return
			End If			
		    If !(Alltrim(Str( nColz2)) $ xGetColsVis( nLimiteCol ) )
				 yGoColumn()	
			End If 
			nColZ2++
			nPos1  := xGetInfCw1(   nColz2 , 2  )
			nPos2  := xGetInfCw1(   nColz2 , 3  )
			nSize1 := xGetInfCw1(   nColz2 , 5  )			

			If (nPos2 >= nLimiteCol) 
			    While ( (nPos1 - xGetScrolPos()) > 5) .And. ;
					( (xGetScrolPos()+ xH_RtLimite() ) <= xCalcTam()  )
						nY1 := xDoScrolV( .t. , .t. , , ,2  )       
						IncrCont1( .t. )
						DoEvents()				

						If nY1 > 0
							nLimiteCol += nY1
						End If 
				Enddo 
			Else

			End If			
			
			ySelCol( nColz2 )
			DoEvents()
			SysWait(0.01)
		End If


		If (nEvWPARAM == VK_LEFT)
			
			If nColz2 == 0
				Return
			End If 
			If  (xGetScrolPos() <= 0)
			//	xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return			
			End If

			lScrollFim := (xGetScrolPos() > 0)			
			If !(Alltrim(Str( nColz2)) $ xGetColsVis( nLimiteCol ) )			
				 yGoColumn()	
			End If 

			nColZ2--
			nPos1  := xGetInfCw1(   nColz2 , 2  )
			nPos2  := xGetInfCw1(   nColz2 , 3  )
			nSize1 := xGetInfCw1(   nColz2 , 5  )
						
			If (nPos1 <= xGetScrolPos() ) 
			    While ( ( xGetScrolPos() - nPos1  ) >= 3 ) .And. ;
					( xGetScrolPos() > 0)
						nY1 := xDoScrolV( .f. , .t.  )       
						IncrCont1( .f. )
						DoEvents()				
						If nY1 > 0
							nLimiteCol -= nY1
						End If 
				Enddo                 
			Else

			End If
			
			ySelCol( nColz2 )				
			DoEvents()
			SysWait(0.02)

		End If 


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



		lCtrl := (GetKeyState ( VK_CONTROL ) < 0) .or. (lControlOk)

		IF (lCtrl)

			IF (EventWPARAM() == VK_HOME)
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
				yDcToDc()
				yDcToDEspe()
				SysWait(0.03)
			End If

			IF (EventWPARAM() == VK_END)

				xGoBottom()
				//DoEvents()
				
				cTp1 := "Final do Navegador Atingido..."
				If !_isWindowDefined("Win_Msg")
					nHan1 := CrieJanTip(  GetProperty(cBrowserName , 'Row') - 10  , GetProperty(cBrowserName, 'Col') + 150   ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , GetProperty(cBrowserName , 'Row') - 10 ,  GetProperty(cBrowserName, 'Col') + 150  )
				End If

				//DoEvents()
				xDispUpTam(  cTp1 )
				xFecheAnimate(  GetFormHandle('Win_Msg') )
				BT_ClientAreaInvalidateAll (cBarraVfrm)
				yDcToDc()
				yDcToDEspe()
				xCursorWait( .f. )

				DoEvents()				
				SysWait(0.03)

			End If

		End If
	
		If (EventWPARAM() == 13)			
			If !_isWindowDefined('_InputWindow')	
				If (bBlkEdit != Nil)							
					Eval(   bBlkEdit , cEspelhoBrw , nLinhaBarra , nColSele , aMapsCol[nColSele] , nColScrool   )			
				End If 
			End If 
		End If 
		
		If (EventWPARAM() == VK_UP) .or. (lUpMouse)
			lUpMouse := .f.
			xGoUp()
			HMG_CleanLastVirtualKeyUp()		
			DoEvents()
			lDownMouse := .f.
			lUpMouse := .f.
		End If

		

		If (EventWPARAM() == VK_DOWN) .or. (lDownMouse)	
			xGoDown()
			lDownMouse := .f.	
			DoEvents()
			lDownMouse := .f.
			lUpMouse := .f.			
		End If

		If (EventWPARAM() == 46)			
			If (bBlkDel != Nil)  //.And. (   nHWnd == GetControlHandle('LabelBrw' , cEspelhoBrw)  )			
				If nIndex1 <= Len(aMDisplay)
					aMDisplay[ nIndex1][4]  		:= Eval(bBlkDel)
				Else 
					aMDisplay[ nLinhaBarra][4]  	:= Eval(bBlkDel)
				End If 
				xRefBrow()					
			End If 
		End If 

	End If 

REturn 




Function LabelBrwEvnt(    nEventMsg    )
	#define WM_LBUTTONDBLCLK 515


	//If EventMSG() == WM_MOUSEMOVE
	If nEventMsg == WM_MOUSEMOVE

		If (nHasFocus > 0)
			yZeraBarV()			
		End If 

		cObjSelected := 'BrowserMtr'									
		nModeBrw := 0
			
		If (lHasHeader) .And. (!isDrgMode())
			DoEvents()
			yOffBarra( cBarrah  )
			yDcBarH1eMtr()
			DoEvents()		
			DoEvents()
			DoEvents()		
		End If
	End If 	

	If nEventMSG == WM_LBUTTONDOWN
		BrwSelItem()
	End If 
	
    IF nEventMSG == WM_LBUTTONDBLCLK
		If (bBlkEdit != Nil)			//nColSele
			Eval(   bBlkEdit , cEspelhoBrw , nLinhaBarra , nColSele , aMapsCol[nColSele] , nColScrool   )			
		End If 
	End If 

Return 

Static Function xCalcTam()

	Local nTam12 := 0
	Local nTam   := 0
	Local nTam1  := 0
	Local cTexto := ''
	Local hDc
	Local hFont
	Local nQAcento
	Local BTstruct
	Local n1

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

	nTam1 := 10
	cTexto := Replicate('A' ,  nTam1 + 1  )
	n12 := GetTextWidth( hDC , cTexto , hfont )
	nTam12 += n12


	BT_DeleteDC (BTstruct )

Return nTam12



Static Function SetArray( aMz1 )

	If Len(aMz1) > 0
		nOpselx1 := 0
		nItemx5 := 0
		nClearIt2 := 0
		nIndex1 := 0
		aMt1 := Aclone(aMz1)
	End If

REturn

Static Function yRetArray()
Return aMt1


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

// Function yShowBMt(  cTable1 , lDisplay   )

// 	Local cBrwName        := 'aBrw' + Left(cTable1,4)
// 	Local cEspelhoBrw     := 'aWin_E' + Left(cBrwName,4)
// 	Local cBarraVfrm 	  := 'aWin_R1' +  Left(cBrwName,4)
// 	Local cBarraVSombra   := 'aWin_Resp' +  Left(cBrwName,4)

// 	DEFAULT lDisplay := .F.


// 	If (_isWindowDefined(cBrwName))


// 		If lDisplay
// 			//msginfo( Str(  Len(aMt1)  ))

// 			BT_ClientAreaInvalidateAll (cEspelhoBrw)
// 			BT_ClientAreaInvalidateAll (cBrwName)
// 			SysWait(0.02)

// 		End If

// 		_ShowWindow(cBrwName )
// 		_ShowWindow(cEspelhoBrw)

// 		_ShowWindow(cBarraVfrm)
// 		_ShowWindow(cBarraVSombra)


// 		yDcToDc()

// 		SysWait(0.03)
// 		yDcToDEspe()

// 		DoEvents()
// 		_ShowWindow( yGetBarNome(1) )
// 		BT_ClientAreaInvalidateAll(yGetBarNome(1))

// 		_ShowWindow( yGetBarNome(2 ) )
// 		BT_ClientAreaInvalidateAll(yGetBarNome(2))
// 		DoEvents()
// 		yDcBarH1()


// 	End If


// Return


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



Static Function SetLargx(n1 )

	nLargx := n1

REturn

Static Function SetNewLarg( nLarg )

	nLargTotal := nLarg

Return



Static Function xChangeOrd( nOrigem ,  nDest )

	//	Local a1 := aMt1[nDest]

	Local a1 := {}
	Local n1 := 1
	Local nSalva
	Local aM2 := {}
	Local y 
	Local aM1

	aM1 := {}

	y := Len(aMt1[1])


	For i := 1 to Len(aMt1)
		aM1 := {}
		nOri := Nil 
		For z := 1 To y 
			If (z != nOrigem) 
				Aadd(aM1 ,  aMt1[i][z]   )
			Else 
				nOri := aMt1[i][z]
			End If 
		Next 	
		hb_AIns( aM1 ,  nDest , nOri , .T.)
		Aadd(aM2 , aM1)
	Next	

	aMt1 := Aclone(aM2)

	DoEvents()	
	xGoTop()


REturn



Static Function yCalcEtap1(   nWid1  )

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



Static Function xBarInicio()
REturn (nColEsquerda == 1)


Static Function xGetScrolPos()
Return nColScrool
//Iif( nColScrool < 0,0,nColScrool)

Static Function xInitScroll()
    nColScrool := 0
Return 



Static Function yScrollCaM( lFrente , lUpdBar , nW1 , lUpdHeader )


	Local nColTam
	Local lFim := .f.

	Local nWidth := 0
	//Iif( nColEsquerda > 0 , xGetColW1(  nColEsquerda   ) , 0 )

	DEFAULT nW1 := 0
	DEFAULT lUpdHeader := .t.

	//If nW1 > 0
	nWidth := nW1
	//End If

	DEFAULT lUpdBar := .t.

	If nWidth == 0
		Return -1
	End If


	If lFrente
		nColScrool += nWidth
		SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  -(nWidth)    , 2 )	
	Else
		nColScrool -= nWidth
		SETVSCROLLVALUE( GetFormHandle( cBrowserName  )  ,  nWidth    , 2 )
	End If

	If lUpdHeader
		yUpHead1(  cHeaderName ,   Iif( lFrente , nWidth , -(nWidth)  ) )		
	End If 

	yDcToDc()
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
	yDcToDc()

	DoEvents()


Return

Static Function BrwSelItem()

	Local ar1 
	Local aMCol 
	Local nRow , nCol 
	Local nInd1 
	Local nHWnd := GetControlHandle(  'LabelBrw' ,  cEspelhoBrw )


	DoEvents()
	nSaveX5 := nItemX5
	nItem :=  xGetPos(cEspelhoBrw)

	nModeBrw := 0
		
	GetCursorPos (@nCol, @nRow)
	ar1 := GetPos_ScreenToClient(   nHWnd , , nCol )

	aMCol := xSearchPos(ar1[2])

	If Len(aMCol) > 0 
		ySelCol( aMCol[1][2] )	
	End If 
	DoEvents()
	SysWait(0.01)
	
	If (nItem > Len(aMt1))			
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

	lHitb := (nLinhaBarra = nTamPag)
	lHitt := (nLinhaBarra = 1)

	l_Hitt := (nIndex1 = 1)
	l_HitB := ( nIndex1 = Len(aMt1))

	BT_ClientAreaInvalidateAll (cBarraVfrm)

	BT_ClientAreaInvalidateAll(cBrowserName)
	DoEvents()


	
	//msginfo(Str(nLinhaBarra) + '  ' + Str(  aMCol[1][2] ) + '  ' + Str(  nIndex1))


	yDcToDc()
	yDcToDEspe()
	nItemX5 := nSaveX5
	DoEvents()


REturn 



Function xTecBrowMtr( nHWnd , nMsg )



	//LOCAL  nHWnd   := EventHWND()
	//LOCAL  nMsg    := EventMSG()
	//LOCAL  nWParam := EventWPARAM()
	//LOCAL  nLParam := EventLPARAM()
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
	//Local aMVisible1 := Iif( nColScrool >= nLarg1  , yColsVisible(nColScrool) , {} )
	Local nPos2
	Local nTotal := 0
	
	Local nInd1
	Local nRow1
	Local nCol1
	Local nCol
	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)
	Local nQTot := 7
	Local cForm1 := ''
	//xQbrwCol()

	If HMG_GetLastMouseMessage (@nHWnd) == 513

	End If

	
	If nHWnd != GetFormHandle( cEspelhoBrw )
	//	Return 
	End If 


	//If nLParam


/*
	If HMG_GetLastMouseMessage (@nHWnd) == WM_MOUSEWHEEL	
		If (nHWnd == GetFormHandle(cEspelhoBrw))			
			If HIWORD( nWParam ) == 120
				xGoUp()			
			Else
				xGoDown()			
			End If
		End If 
	End If

	If HMG_GetLastMouseMessage (@nHWnd) != 512
		//msginfo( Str(   nWParam  ) )
	End If 

	*/
	


	If (nHWnd != GetProperty(  cBarraVSombra , "HANDLE" ))
		Return 
	End If 




	If (nMsg == WM_LBUTTONUP)

		DoEvents()

		lDrag_Mode  := .f.
		nColDragy   := 0

		DoEvents()

		yOffBarra( cBarrah  )
		DoEvents()




		If (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))
			If (nHasFocus > 0 )
				PostMessage(OBTN_Handle( cBarraVfrm , nHasFocus   )  , WM_MOUSELEAVE , 0, 0  )
				DoEvents()
				yDcToDEspe()
				lTracking75 := .f.
				lTracking45 := .t.
				SysWait(0.01)
			End If


		End If

	End If


	If (nMsg == 71)
		If (nHWnd == GetProperty(  'fFiltrosCad' , "HANDLE" ))
		//	msginfo('p2')
		End If 
	End If 


		If (nMsg == WM_LBUTTONDBLCLK)
			//msginfo('ok22 -33333-')
		End If 


	// Arrasto da BarraH
	If (nMsg == WM_MOUSEMOVE)
	

		If (yRetAcende() > 0) .And. (cObjSelected != 'BarraH')
			yOffBarra( cBarrah  )		
		End If

		If (cObjSelected = 'BarraH') .And. (yRetAcende() > 0)
			lDrag_Mode := .f.			
		End If 

		
		If  (_isWindowDefined("Win_Msg")) .And. ( isWindowVisible(GetFormHandle("Win_Msg")))
			xHidehint()
		End If

		//DoEvents()
	
		GetCursorPos (@nCol, @nRow)
		nHWnd1 := WindowFromPoint (nCol, nRow)

		cForm1 := ''

		GetFormNameByHandle( nHWnd1 , @cForm1 )

		ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
		nCol := ar1[2]				

		If (lDrag_Mode)		

			//msginfo('l11')
		
			For i := 1 To 255
				GetAsyncKeyState(i)
			Next i			
						

			If nColDragy == 0
				nColDragy := nCol
			End If	

			nConstH  := Xh_RetPasy()	
			nPuloy   := Int(nConstH - (0.10 * nConstH))
			nScr1    := 0	

			If ( (nCol - nColDragY) >= nPuloy ) 
				nScr1 := nConstH																				
				If ( nQxy  >=  yRetQPAsso()  )
					l_Eofh := .t. 							
				End If 
			Else 					
				If ((nColDragy - nCol) >= nPuloy)
					nScr1 := -nConstH	
				End If 
			End If 



			If (nScr1 != 0 )

				If ((nScr1 > 0) .And. (!l_Eofh)) .Or. ; 
					((nScr1 < 0) .And. (!l_Bofh))				   			

				//	msginfo('lp22')
					
					yUpdatBha1(nScr1 )
					nColDragy := nCol

					If nScr1 > 0
						nY1 := xDoScrolV( .t. , .f. )       
						If nY1 > 0
							nLimiteCol += nY1
							IncrCont1( .t. )       
							DoEvents()            	
						End If  
					Else 
						nY1 := xDoScrolV( .f. , .f.  )       
						If nY1 > 0
							nLimiteCol -= nY1
							IncrCont1( .f. )                   	
							DoEvents()
						End If 						

						If (xGetScrolPos() <= 0)												
							nScr1 	  := 0						
							nColDragy := 0						
							nQxy      := 1
							l_Bofh 	  := .t. 							
						End If 

						

					End If 

					SysWait(0.03)           
					
					nAcumP += nScr1	


					If nScr1 > 0 	
						If (nAcumP >= (nQxy * nConstH)  )
							//nQxy++						
							l_Bofh := .f. 
							l_Eofh := .f. 
						End If 
					Else 					
						If (nAcumP <= (nQxy * nConstH)  ) //.And. ( nQXy >= 2)
							If nAcumP > 0
							//	nQxy--								
								l_Eofh := .f. 
								l_Bofh := .f. 
							End If 	
						End If 
					End If 
				End If 					
			End If 
				
			If (GetAsyncKeyState(VK_LBUTTON)) == 0					
				lDrag_Mode := .f. 
			End If 			

		End If	

	End If


	If (nMsg == WM_MOUSEMOVE) .And. (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" ))
	//	msginfo('z1')
		cObjSelected := 'BarraV'
		//DoEvents()

	End If 
	

	If (nMsg == WM_MOUSEMOVE) .And. (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" )) .And. ;
	   (  cObjSelected == 'BarraV') .And. (lTrackingL1 )

	   	GetCursorPos (@nCol, @nRow)
		ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )

		//DoEvents()


		If (ar1[2] > 21) .or. (ar1[2] < 0)
			xOffBarVert( nHWnd )			
			Return
		End If

		nRow1 := ar1[1]
		nId2 := xModeBrw(nRow1)	
		nModeBr2 := yDoHint(   nId2  ,  , .t.  )

		//DoEvents()
		

		If (nId2 = 0)
			yLimpBarV( '2')		
			Return
		Else 
		 
		End If



		cObjSelected := 'BarraV'

		lTrackingL1 := ( nModeBrw = nModeBr2)

		If lTrackingL1
			BT_ClientAreaInvalidateAll( cBarraVfrm )
		//	DoEvents()
			yDcToDEspe()
			DoEvents()
			//SysWait(0.03)
		End If 

		//DoEvents()

		
	End If 



	//MOUSEMOVE DA BARRAV
	If (nMsg == WM_MOUSEMOVE) .And. (nHWnd == GetProperty(  cBarraVSombra , "HANDLE" )) .And. ;
	   (  cObjSelected == 'BarraV') .And. (!lTrackingL1 )

	    
		lTracking75 := .f.	

		If (lHasHeader)
			SysWait(0.03)
			yDcBarH1eMtr()
			SysWait(0.03)
			yDragOff()
			DoEvents()
		End If


		GetCursorPos (@nCol, @nRow)
		ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )

		If (ar1[2] > 21) .or. (ar1[2] < 0)			
			xOffBarVert( nHWnd )
			lTrackingL1 := .t. 
			Return
		End If

		nRow1 := ar1[1]
		nId := xModeBrw(nRow1)

		If (nId = 0)
			yLimpBarV( '3')						
			lTrackingL1 := .t. 
			Return
		End If

		If (nRow1 >= 61) .And. (nRow1 <= (GetProperty(cBarraVfrm,'Height') - 61) ) .And. (nId = 0)
			xOffBarVert( nHWnd )
			lTrackingL1 := .t. 
			Return
		End If

		If (nHasFocus > 0)
			If (nId != nHasFocus)
				yDcToDEspe()
				lTracking75 := .f.
				lTracking135 := .f.
			End If
		End If


		If (nId > 0) 
			//.And. (!lTracking75)
			yOffBarra( cBarrah  )
			nModeBrw := yDoHint(   nId  ,  , .f.  )
			nHasFocus := nId
			BT_ClientAreaInvalidateAll( cBarraVfrm )
			DoEvents()
			yDcToDEspe()
			lTracking135 := .t.
			lTracking75  := .t.

			SysWait(0.04)
			//msginfo('11')

		End If

		lTrackingL1 := .t. 

		
		lTracking1714  := TrackMouseEvent(nHWnd)



		//msginfo('zz1 ' + cObjSelected)

	End If


	If (nMsg == WM_LBUTTONDOWN)

	
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
				SysWait(0.05)
				xGoUp(.t.)
				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If
			End

			While (nModeBrw = 6) .And. (!lTracking45)
				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i
				xGoDown(.t. )
				SysWait(0.05)
				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If
			End


			While (nModeBrw = 5) .And. (!lTracking45)

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				//SysWait(0.02)
				xGoPgDn( .t. )
				SysWait(0.05)
				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If

			End If

			While (nModeBrw = 2) .And. (!lTracking45)

				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i


				xGoPgUp( .t. )

				SysWait(0.05)
				If (GetAsyncKeyState(VK_LBUTTON)) == 0
					lTracking45 := .t.
				End If
			End

			//SysWait(0.05)

			lTracking45 := .f.

		End If		

	End If


	

	


Return

Static Function yZeraBarV()

	nHasFocus := 0
	DoEvents()
	BT_ClientAreaInvalidateAll (cBarraVfrm)
	yDcToDc()
	DoEvents()
	yDcToDEspe()		


Return 

Static Function yGoColumn()
 	
	Local nWz1 := xGetScrolPos()

	xDoScrolHroz( .f. , nWz1 , .t. , .t. )       
	DoEvents()

	nWz1 := xRetBarH()

	If nWz1 != 0
		xInitSxy()
		xInitScroll()
		yUpdatBha1( 0 )				
	End If 

	nLimiteCol := nLargx			
	DoEvents()

Return 

Static Function IncrCont1( lFrente  , nWalk1 )

	Local nScr1 := Xh_RetPasy()
	DEFAULT nWalk1 := 0	

	If lFrente
		nQxy++		
		l_Bofh := .f. 
		nAcumP += nScr1		
		nLimiteCol += nWalk1
	Else 
		nQxy--		
		l_Eofh := .f. 
		nAcumP -= nScr1		
		nLimiteCol -= nWalk1
	End If


Return 



Static Function xModeBrw(nRowL)
	Local nL
	Local nId := 0

	If (nRowl >= nLimteLin)
		nL := GetProperty(cBarraVfrm,'Height') - 20
		If (nRowL > (nL + 1))
			If (Len(aMt1) > nTamPag)
				nId := 858
			Else
				nModeBrw := 0				
			End If
		Else
			If (nRowL <= (nLimteLin + 20   ))
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
		If nRowL <= 20
			nId := 855
			DoEvents()
			//msginfo('p2')
		Else
			If (Len(aMt1) > nTamPag)
				If (nRowL >= 41) .And. (nRowL <= 61)
					nId := 857
				Else
					If (nRowL >= 21) .And. (nRowL <= 40)
						nId := 856
					End If
				End If
			Else
				nModeBrw := 0				
			End	If
		End If
	End If

	DoEvents()


Return nId


Static Function xGoUp( lMsg  )

	Local nInd1
	Local nItem7

	Default lMsg := .f.


	If (l_Hitt) .And. (!lMsg)
		//xDialog( Hb_AnsiToOem("Primeiro Registro Posicionado.") )
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
				Aadd(aMDisplay , { nIndex1 ,    aMt1[nIndex1]  , nItem7  , aDataOrig[ nIndex1  ][1]   }  )

				aMDisplay := Asort( aMDisplay ,,, { |a,b|  a[1] < b[1]   })

			
				SETVSCROLLVALUE( GetFormHandle(  cBrowserName )  , nItemBrwHeight  , 1 )
				BT_ClientAreaInvalidateAll(cBrowserName)
			
			Else
			//	aMDisplay[nInd1][ 4 ] := aDataOrig[ nIndex1  ][1] 
				ScrolUp1(.t.)
			End If

			nLinhaBarra := 1
			EncheMVis(  nIndex1  , .t. )
			ySelItem( nIndex1  )
			

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
			//xDialog('Linha Top Atingido!' )
		End If

	End If

	DoEvents()




	BT_ClientAreaInvalidateAll (cBarraVfrm)
	yDcToDc()
	yDcToDEspe()

	


	//DoEvents()
//	DoEvents()
	
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
				Aadd(aMDisplay , { nIndex1 ,    aMt1[nIndex1]      , nItem7  , aDataOrig[ nIndex1  ][1]  }  )
			Else 
			   // aMDisplay[nInd1][ 4 ] := aDataOrig[ nIndex1  ][1] 
			End If

			nLinhaBarra := nTamPag	
			EncheMVis(  nIndex1 - nTamPag + 1  , .t. )
			ScrolUp1(.f.)
		//	DoEvents()
			ySelItem( nIndex1  )
	

		Else
			ySelItem( nIndex1  , .f.  )
		End If		

	Else

		
		If (!lMsg)		
			DoEvents()
		End If

		lHtb := .t.
		lHtt := .f.


	End If


	DoEvents()


	BT_ClientAreaInvalidateAll (cBarraVfrm)
	yDcToDc()

	
	yDcToDEspe()
	DoEvents()


//	DoEvents()
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
			If (z <= Len(aMt1) )
				n2++
				aMt1[Z] := Eval(  bBlock1 , z  )
				Aadd(aMDisplay ,  {  Z ,     aMt1[Z]    , n2 , aDataOrig[Z][nIndDel ]    }  )				
			End If
		Next
	Else
		For z := ((n1+nTamPag) - 1) To n1
			If (z <= Len(aMt1) )
				aMt1[Z] := Eval(  bBlock1 , z  )
				Aadd(aMDisplay , { Z ,     aMt1[Z]   , , aDataOrig[Z][ nIndDel] }  )
			End If
		Next
	End If

Return





Static Function xPaintBrwMtr( cForm , aMtrOp ,  nOpselx1 , nClear1 , lBrwEnable )


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
	//Local bBmpZ := xBmpToTrans( 'BOLAZAZUL1')
//	Local bBmpa := xBmpToTrans( 'NGITRANS' , SELCOR , 20,20 )
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
	Local nPulo1

	Local bBmpy 
	Local bBmpL


	//Local hBitOk     := BT_BitmapLoadFile ('NGITRANS')
	//Local hBitExcl   := xBmpToTrans('EXCLAMACAOBIG' , {250,242,176}  , 64 , 64 )
	

	Local nCol := nColIniBrw

	Local nRow := 0
	Local lDeleted := .f. 

	

	DEFAULT lBrwEnable := .t.

	//nRow := -(nLinScrool)
	//nCol := -(nColScrool)

	If nColScrool != 0
		nCol -= nColScrool 
	End If 

	If nLinScrool != 0
		nRow -= nLinScrool 
	End If 



	hDC2 := BT_CreateDC (cForm ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)
	BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width  ,    Height    , WHITE , WHITE  )
	

	If nClear1 > 0
		If (Mod( nClear1, 2 ) = 0)
			nCor := WHITE
		Else
			nCor := CORBROWSE
		End If
	End If

	nIndice := -9999

	If (Len(aMtrOp) == 0)
		BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {250,242,176}  , WHITE   )
		BT_DrawText ( hDC2 , 25  , 95 ,   "Nenhum Registro Localizado."  , 'Arial Black'  , 9 , BLACK ,  {193,255,224}    , ;
			nTypeText ,	nAlingText, nOrientation )		
		BT_DrawBitmap (hDC2, 10 , 5 , 64  , 64  ,  BT_STRETCH, hBitExcl )
		BT_DeleteDC (BTstruct )		
		Return
	End If



	For n1 := 1 To Len(aMtrOp)
		
		nQtCol := Len(  aMtrOp[n1][2]  )
		aMz1   := AClone( aMtrOp[n1][2]  )

		lDeleted := aMtrOp[n1][4]

		nCol := nColIniBrw


		If nColScrool != 0
			nCol -= nColScrool 
		End If 

		nPulo1 := 0

		If nItemBrwHeight > 15
			nPulo1 := 1
		End If 

		If nItemBrwHeight > 20
			nPulo1 := 2
		End If 


		If (nOpselx1 > 0) .And. (aMtrOp[n1][1] == nSelLine ) .And. (lBrwEnable)
			If lDeleted 
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 0  ,    Width    ,    nItemBrwHeight     , SELCOR  , SELCOR  )
			Else 
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 0  ,    Width    ,    nItemBrwHeight     ,  {153,153,153}  , {242,242,242}   )
			End If 

			If (nColScrool == 0) .And. (lEnabled) .And. (lDeleted)
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow   , 00  ,  nColIniBrw ,    nItemBrwHeight      , SELCOR  , SELCOR  )
				BT_DrawBitmap (hDC2  , nLine  + nRow + nPulo1   , 2   , 16  , nItemBrwHeight - 2 , BT_STRETCH , bBmpa  )						
			End If

			If (nColScrool == 0) .And. (lEnabled) .And. (!lDeleted)
				bBmpy := xBmpToTrans( 'DELETED1', nCorBk , 15,15 )
				BT_DrawBitmap (hDC2  , nLine  + nRow + nPulo1   , 00    , 15  , 15 , BT_SCALE , bBmpy  )				
				BT_BitmapRelease(bBmpy)
			End If

		Else 
			If (Mod( n1 , 2 ) = 0)
				nCorBk := WHITE

				If !lDeleted 
					nCorBk := {153,153,153} 
				End If 

				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width  ,    nItemBrwHeight     , nCorBk  , nCorBk   )
				lPar := .f.
			Else
				nCorBk := CORBROWSE

				If !lDeleted 
					//nCorBk := GRAY
					nCorBk := {153,153,153} 
				End If 

				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight     , nCorBk  , nCorBk   )
				lPar := .t.
			End If

			If !lDeleted 
				bBmpy := xBmpToTrans( 'DELETED1', nCorBk , 15,15 )
				BT_DrawBitmap (hDC2  , nLine  + nRow + nPulo1   , 00    , 15  , 15 , BT_SCALE , bBmpy  )				
				BT_BitmapRelease(bBmpy)
			End If 		

		End If 

		For n2 := 1 to Len(aMz1) 

			cimg1 := ''
			nTam1  	 := aTams2[n2]


			cTexto  := ''
			cTexto1 := ''

			If ( ValType(aMz1[n2]) == 'C')
				cTexto   := Alltrim(Hb_Utf8ToStr(  aMz1[n2] )) 			
				nQAcento := QtAcento(Alltrim( cTexto  ) )			
				nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1			
				n12 := GetTextWidth( hDC2 , Replicate('A' ,  nTam1 + 1  ) , hFontBrw )
				nTam := n12
				cTexto2 := Left(Alltrim(Hb_Utf8ToStr(  aMz1[n2] )) 	, nTam1 )
				cTexto1 := Padr( Alltrim(  Hb_AnsiToOem( cTexto2 )) ,n12+1) 
				n22 := nTamx1 + nCol +  (250 * nTam1)
				nTypeText    := BT_TEXT_TRANSPARENT
				cCor := FONTCOR			//DoEvents()
			End If


			If ( ValType(aMz1[n2]) == 'I')

			End If 

			If ( ValType(aMz1[n2]) == 'D')

			End If 

			If ( ValType(aMz1[n2]) == 'N')

			End If 





			If (Left(cTexto,5) = 'image') .And. (lDeleted)
				cImg1 := Right(cTexto,Len(cTexto) - 6)				
			End If 

			If (Left(cTexto,5) = 'image') .And. (!lDeleted)
				cTexto1 := ''
			End If 

			If !Empty( Alltrim(cImg1))
				cTexto1 := cImg1
			End If 

			If (nOpselx1 > 0) .And. (aMtrOp[n1][1] == nSelLine ) .And. (lBrwEnable)

				nTypeText    := BT_TEXT_BOLD+BT_TEXT_TRANSPARENT
				nFontCor     := WHITE

				If !lBrwEnable
					nTypeText    := BT_TEXT_TRANSPARENT
					nFontCor 	 := BLACK
				End If

				If lAtivo1

					If !lDeleted
                    	nFontCor := BLACK
					End If 

					If Empty(Alltrim(cImg1))
						BT_DrawText ( hDC2 , nLine + nRow + nPulo1  , nCol+1 ,   cTexto1 , xFont2  , 9 , nFontCor ,  SELCOR   , ;
						nTypeText ,	nAlingText, nOrientation )
					Else 

						nIz1 := Ascan(aArrayBmp , { |a| (a[1] == cImg1) .And. (a[3] == 'SELECTED' )  })

						If nIz1 == 0
							Aadd( aArrayBmp ,  { cImg1 ,  xBmpToTrans( cImg1, SELCOR , 15,15 ) , 'SELECTED'     } )							
							nIz1 := Len(aArrayBmp)
							msginfo('ok22333 ' +  cImg1)
						End If 


						bBmpL := aArrayBmp[nIz1][2]					


					//	bBmpy := xBmpToTrans( cImg1, SELCOR , 15,15 )
						BT_DrawBitmap (hDC2  , nLine  + nRow + nPulo1   , nCol+1    , 15  , 15 , BT_SCALE , bBmpL  )				
						//BT_BitmapRelease(bBmpy)
					End If

				End If

			Else 

				If !lDeleted
                    cCor := BLACK
				End If 

				If Empty(Alltrim(cImg1))
					BT_DrawText ( hDC2 , nLine + nRow + nPulo1  , nCol+1  ,  cTexto1 , xFont2, 9 ,  cCor , nCorBk , nTypeText, nAlingText, nOrientation )
				Else 
				//	bBmpy := xBmpToTrans( cImg1, nCorBk , 15,15 )
				//	BT_DrawBitmap (hDC2  , nLine  + nRow + nPulo1   , nCol+1    , 15  , 15 , BT_SCALE , bBmpy  )				
					//BT_BitmapRelease(bBmpy)

					nIz1 := Ascan(aArrayBmp , { |a| (a[1] == cImg1) .And. (a[3] == 'FUNDO' )  })

					If nIz1 == 0
						Aadd( aArrayBmp ,  { cImg1 ,  xBmpToTrans( cImg1,  nCorBk      , 15,15 ) , 'FUNDO'   } )							
						nIz1 := Len(aArrayBmp)						
					End If 

					bBmpL := aArrayBmp[nIz1][2]		
					BT_DrawBitmap (hDC2  , nLine  + nRow + nPulo1   , nCol+1    , 15  , 15 , BT_SCALE , bBmpL  )				

				End If 
			End If 

			nCol += nTam

		Next 

		nLine += nItemBrwHeight
		DoEvents()

	Next

	BT_DeleteDC (BTstruct )

Return






Static Function yCriaButs()

	Local cJanx := cBarraVfrm
	Local nRow1 := GetProperty(cBarraVfrm,'Height') - 65



Return nRow1 
//(nRow1 - 46)


Static Function yLimpBarV( c1 )

	lTracking75 := .f.
	lTracking135 := .f.
	lTrackingL1 := .t.
	nHasFocus := 0
	BT_ClientAreaInvalidateAll( cBarraVfrm )
	yDcToDEspe()
	DoEvents()


REturn





Static Function SetBrwDrgM(lOn1 , nColIni )

	lDrag_Mode := lOn1
	nColDragY  := nColIni

	If lOn1 
		//cObjSelected := 'BarraH'
	End If 

	//nDragColi  := nColIni
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
	/*

	If !lNoHint

		GetCursorPos( @nCol , @nRow )


		If !_isWindowDefined("Win_Msg")
			CrieJanTip( nRow  - 20 , nCol - 12   ,   Alltrim( cTp1 )     ,, 0.5 )
		Else
			xDispHint( cTp1 , nRow  - 20,  nCol - 12  )
		End If

		xDispUpTam(cTp1 )

		BringTop('xHint')
		DoEvents()

	End If
	*/


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
	nModeBrw := 0
	
	DoEvents()
	BT_ClientAreaInvalidateAll( cBarraVfrm )
	yDcToDEspe()
	

	//If  _isWindowDefined("Win_Msg")
	//	xHidehint()
	//End If

Return


Static Function xPaintScroll( cJanela )

	Local BTstruct2
	Local nLAst
	Local hDC
	Local nRIni := 65
	Local nFator , yPos
	Local nAltura := xCalcBarV()
	Local nTamBar := GetProperty(cBarraVfrm , 'Height') - 83
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
		BT_DrawFillRoundRect ( hDC , nRIni ,  3   , Width - 10 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 )
	Else

		If (nItemX5 == nMaxItem1 ) .And. ( (nLimteLin - nAltura) >= 4  )
			//msginfo('ok22')
			BT_DrawFillRoundRect ( hDC , nLimteLin - nAltura ,  3   , Width - 10 , nAltura , 5 ,5 ,   {152 , 152 ,152}   , {152 , 152 ,152}  , 0 )
		Else


			yPos := nLimteLin - nRIni - nAltura
			nFator := Int(( nIndex1 * yPos     ) /	nMaxItem1)			
			If (Len(aMt1) <= nTamPag)
				nFator := 0
			End If

			//msginfo(Str(nFator))

			BT_DrawFillRoundRect ( hDC ,   (nrIni  + nFator )  ,  3   , Width - 10 , nAltura , 5 ,5 ,  {152 , 152 ,152}   , {152 , 152 ,152}  , 0 )

		End If
	End If

	If !lAtivo1		
		BT_DeleteDC (BTstruct2 )
		Return
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

		BT_DrawBitmap (hDC  , nLinha  , 1  	, 18  , 18  ,      BT_COPY,   hBt2    )
		nLinha += 21

		BT_BitmapRelease( hBt2 )
		//DoEvents()



	Next

	BT_DeleteDC (BTstruct2 )

	// BT_BitmapRelease( yBmp1 )
	// BT_BitmapRelease( yBmp2 )
	// BT_BitmapRelease( yBmp3 )

	// BT_BitmapRelease( zBmp1 )
	// BT_BitmapRelease( zBmp1 )
	// BT_BitmapRelease( zBmp1 )




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
			//xDialog( Hb_AnsiToOem("Primeiro Registro Posicionado.")  )
		End If
		REturn
	End If


	lHitB := .f.
	lHitt := .f.

	l_HitB := .f.



	nLinScrool := 0
	aMDisplay := {}


	nRec1 := (aMVisible[ 1 ][2]) - 1


	If (nRec1 <= (nTamPag * 1))
		//msginfo('ok2')
	//	DoEvents()
		xGotop()
		xGotop()

		BT_ClientAreaInvalidateAll (cBarraVfrm)
		yDcToDc()
		yDcToDEspe()
		SysWait(0.05)
		
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

	yDcToDc()
	yDcToDEspe()	
	nPageNumber--
	SysWait(0.05)

	//SysWait(0.05)

	nClearIt2 := 1

	If l_Hitt
		nIndex1 := 1
	End If

Return


Function yRetIndex()
Return nIndex1


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

	yDcToDc()
	yDcToDEspe()



	nPageNumber++
	SysWait(0.05)



	If l_HitB
		nIndex1 := nMaxItem1
	End If

Return .t.





Static Function xGoBottom()



	Local nPos1 := (Len(aMt1) * nItemBrwHeight) - (nTamPAg * nItemBrwHeight)

	nIndex1     := Len(aMt1)
	nItemX5     := Len(aMt1)
	nClearIt2   := nItemX5
	nClear1     := nItemX5

	nLinScrool := 0
	aMDisplay := {}
	If nItemX5 > nTamPAg
		xRecords( nItemX5 - nTamPag + 1 , .t. )
		EncheMVis(nItemX5 - nTamPag + 1 , .t. )
	Else 
		xRecords(  1  , .t. )
		EncheMVis( 1  , .t. )
	End If 

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
	yDcToDc()
	yDcToDEspe()
	nIndex1 := Len(aMt1)
	nClearIt2 := nTamPag
	l_HitB := .t.

Return


// Function xInitBrw()


// 	//_ShowWindow('LstBoxFiltro')
// 	//_ShowWindow(cEspelhoBrw)

// 	If _isWindowDefined(yGetHeadName(1))
// 		_ShowWindow( yGetHeadName(1) )
// 		BT_ClientAreaInvalidateAll(yGetHeadName(1))


// 		_ShowWindow( yGetHeadName(2 ) )
// 		BT_ClientAreaInvalidateAll(yGetHeadName(2))

// 		yDcBarH1eMtr()

// 	End If

// 	If _isWindowDefined(yGetBarNome(1) )
// 		_ShowWindow( yGetBarNome(1) )
// 		BT_ClientAreaInvalidateAll(yGetBarNome(1))


// 		_ShowWindow( yGetBarNome(2 ) )
// 		BT_ClientAreaInvalidateAll(yGetBarNome(2))
// 	End If

// 	DoEvents()

// 	nQtotPass := xQbrwCol()

// 	//msginfo(Str(  nQtotPass))

// 	yDcBarH1()
// 	yDcBarH1eMtr()


// Return


Function yBrwEnabled()
Return lAtivo1 


Function yEnabledBrw( lEnabled )

	lAtivo1 := lEnabled

	If !lAtivo1 

		SET WINDOW &cBrowserName TRANSPARENT TO 225
		yRefresh( c_BrowName )
		DoEvents()

		lEnabled2 := .f. 				
		lEnabledy := .f. 

		SET WINDOW &cHeaderJan TRANSPARENT TO 225
		DoEvents()					
		BT_ClientAreaInvalidateAll(cHeaderJan)
		xDcBarHeader()
		DoEvents()				

		DoEvents() 
		yDcBarH1()							
		SET WINDOW &cBarraVfrm TRANSPARENT TO 225

		SET WINDOW &cBarraName2 TRANSPARENT TO 225

			

	Else 


		SET WINDOW &cBrowserName TRANSPARENT TO 0
		yRefresh( c_BrowName )
		DoEvents()

		lEnabled2 := .t. 				
		lEnabledy := .t. 

		SET WINDOW &cHeaderJan TRANSPARENT TO 0
		DoEvents()					
		BT_ClientAreaInvalidateAll(cHeaderJan)
		xDcBarHeader()
		DoEvents()				

		DoEvents() 
		yDcBarH1()							
		SET WINDOW &cBarraVfrm TRANSPARENT TO 0

		SET WINDOW &cBarraName2 TRANSPARENT TO 0

		
	End If 



	BT_ClientAreaInvalidateAll(cBarraVfrm)
	yDcBarH1eMtr()

	BT_ClientAreaInvalidateAll(cBarraName2)
	DoEvents() 
	yDcBarH1()			

	

	If lAtivo1
		yGoTop()
	End If 

	SysWait(0.04)
	DoEvents()

	

	//xRefBrow()



Return 



Function yRefresh( cBrName , lNovo1 , nItemEdit  )

	Local nHw1 
	Local n1 
	Local lEmpty := (Len(aMt1) == 0)
	Local aMz1 := {}	

	
	DEFAULT lNovo1 := .f.
	DEFAULT nItemEdit := 0


	If (_isWindowDefined(cBrName)) .And. (!isWindowVisible(  GetFormHandle(cBrName)   ))		
		  
		 
		DoEvents()
		_ShowWindow(cBrName)
		_ShowWindow(cEspelhoBrw)

		yGoTop()

		If _isWindowDefined(yGetHeadName(1))
			_ShowWindow( yGetHeadName(1) )
			BT_ClientAreaInvalidateAll(yGetHeadName(1))


			_ShowWindow( yGetHeadName(2 ) )
			BT_ClientAreaInvalidateAll(yGetHeadName(2))

			yDcBarH1eMtr()

		End If

		If _isWindowDefined(yGetBarNome(1) )
			_ShowWindow( yGetBarNome(1) )
			BT_ClientAreaInvalidateAll(yGetBarNome(1))


			_ShowWindow( yGetBarNome(2 ) )
			BT_ClientAreaInvalidateAll(yGetBarNome(2))
		End If

		DoEvents()

		nQtotPass := xQbrwCol()

		yDcBarH1()
		yDcBarH1eMtr()

		BT_ClientAreaInvalidateAll(cBrName)		

		yDcToDc()
		DoEvents()	

		//CursorOff1( nHw1   , cEspelhoBrw  )		
		DoEvents()

	Else

		If (_isWindowDefined(cBrName))

		
			DoEvents()
			BT_ClientAreaInvalidateAll(cBrName)
			yDcToDc()


			BT_ClientAreaInvalidateAll(cBarraVfrm)
			yDcToDEspe()
			DoEvents()
			SysWait(0.05)

			If lNovo1        
				

				nQItem := Len(  aDataOrig )				
				Aadd(aMt1 , Eval(  bBlock1 , nQItem  ) )
				nMaxItem1 := Len(aMt1)

				nColZ2 := 1
				l_Hitt := .f. 
			
				//Horizontal B

				If (lEmpty)
					lAtivo1 := .t. 				
					SET WINDOW &cBarraName2 TRANSPARENT TO 0
					yEnable1Bh(  .t. )
					If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarMtr"  ) )  ) = 0) .And. (lEnabledy)
						//InstallEventHandler( "EventBarMtr" )		
					End If
					SET WINDOW &cBrowserName TRANSPARENT TO 0
					nAcende := 0
					BT_ClientAreaInvalidateAll(cBarraName2)
					DoEvents() 
					yDcBarH1()							
					SET WINDOW &cBarraVfrm TRANSPARENT TO 0				
					yDcBarH1eMtr()
					//Header
					lEnabled2 := .t. 				
					SET WINDOW &cHeaderJan TRANSPARENT TO 0
					DoEvents()					
					BT_ClientAreaInvalidateAll(cHeaderJan)
					xDcBarHeader()
					DoEvents()				
					xGoBottom()
					BT_ClientAreaInvalidateAll(cBrowserName)
					BT_ClientAreaInvalidateAll(cBarraVfrm)
					SysWait(0.01)
					yDcToDc()
					yDcToDEspe()
					DoEvents() 
				Else 

					DoEvents()				
					xGoBottom()
					DoEvents() 					
				    	   
				End If 

				ySelCol( 1 )					
				
			Else 

				If (nItemEdit > 0)										
					DoEvents()				
					//aDataOrig[ nItemEdit ] := Eval(  bBlock1 )                            //aDataOrig[nItemEdit]																			             
					If nIndex1 <= Len(aMDisplay)
						aMDisplay[ nIndex1][2]  		:= Eval(  bBlock1 ,   nItemEdit )						
					Else 
						aMDisplay[ nLinhaBarra][2]  	:= Eval(  bBlock1 ,   nItemEdit )						
					End If 		
					xRefBrow()			
				End If 	
			End If 	


		End If	

	End If

REturn

Static Function xRefBrow()

	BT_ClientAreaInvalidateAll(cBrowserName)					
	SysWait(0.01)
	yDcToDc()
	yDcToDEspe()
	DoEvents() 				

REturn 

Static Function yGoTop()

	lLibera1 := .t.
	xGoTop()
	
REturn

Static Function xGoTop()

	//xCursorWait( .t. )
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

	nSelLine := 1
	aMDisplay := {}
	xRecords( nItemX5 )
	EncheMVis( nTamPag )
	DoEvents()

	BT_ClientAreaInvalidateAll(cBrowserName)
	yDcToDc()

	BT_ClientAreaInvalidateAll(cBarraVfrm)
	yDcToDEspe()

	nClearIt2 := 1

REturn



Static Function yDcToDEspe()

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




Static Function yDcToDc()

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
	BT_DrawText (hDC2, 300, 50, "Mirror of the Win22", "Times", 42, YELLOW, BLACK, nTypeText, nAlingText, nOrientation)

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)

//	BT_ClientAreaInvalidateAll (cEspelhoBrw)

	//SysWait(0.04)


	//hBit201 := BT_BitmapCaptureWindow ( cBrowserName , 0 , 0, Width1 , Height1)
	//BT_BitmapSaveFile (hBit201  , "TEla12.bmp")



Return

Static Function xSaveBmp()

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



Static Function xHeaderMtr( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1 , aTps , cTabela , lAtivo , lDic1  , nR1 , nC1  )

	Local nRowI   := nR1
	Local nColI   := nC1
	Local lOk     := .t.
	Local nLarg1  := GetProperty( cBrwName1 , 'Width')
	Local aPos := {0,0,0,0}

	//Local nHWnd := GetSplitChildWindowHandle (cBrwName1, cParent1)
	Local nIndex22

	//GetWindowRect (nHWnd, aPos)

	DEFAULT lAtivo := .t.

	
	

	lEnabled2 := lAtivo

	//msginfo(Str(  nLarg1  ))

	cHeaderJan := cHName

	cHeaderSombra := 'fSombra' + Right(cHeaderJan , 3)


	aColsTam := aTams
	aTipsy   := aTps
	aCabecs  := aCabecalho

	c_BrowName := cBrwName1

	
	nLimiteAtu := nLarg1 + 1


	hBitOk 	 := BT_BitmapLoadFile ('OKMARK22')
	hBitOrd1 := BT_BitmapLoadFile ('SETTA')
	hBitOrd2 := BT_BitmapLoadFile ('SETAB')



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

	//CREATE EVENT PROCNAME EventHeaMtr() HWND GetControlHandle(  'Label2' ,  cHeaderSombra ) STOREINDEX nIndex22
	//EventProcessAllHookMessage(nIndex22 , .t.)



	nIndex22 := 34322


	 If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHeaMtr"  ) )  ) = 0) //.And. (lEnabledy)
        
    End If

	HMG_ChangeWindowStyle(  GetFormHandle(cHeaderSombra) , Nil , WS_EX_STATICEDGE     ,  .t. , .T. )	

	SET WINDOW &cHName TRANSPARENT TO Iif(!lEnabled2 , 167 , 0)

	If !CheckRet( xMapCols( aCabecs , aColsTam , aTipsy ) )
		MsgInfo('Algo Deu Errado nas Colunas , Favor Reconfigurar ou Reduzir Tamanhos.')
		lOk := .f.
	End If


Return lOk

Static Function xh_InitLim()
	nLimiteAtu := GetProperty( c_BrowName , 'Width')
Return nLimiteAtu






Static Function yGetHeadName(nTipo)
Return Iif(nTipo = 1, cHeaderJan, cHeaderSombra)

Static Function yDcBarH1eMtr()

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




Static Function xOrdene( nCol1 , lAsc1 )

	Local aZZ1    := yRetArray()
	Local aM1     := Iif(nCol1 > 0 , aMapsCol[nCol1] , {} )
	Local nPos1
	Local nTam1
	Local aM4 := {}
	Local nTipo
	//Local nTamPg := xRetTamPg()
	Local nPagNum := 1
	Local nCont5 := 0


	Local aZZ2 := {}
	Local aZZ3 := {}
	Local nX1

	nPos1 := aM1[7]
	nTam1 := aM1[6]
	nTipo := Alltrim(aM1[4])

	xAtuDados(   nCol1 , lAsc1 , aColsTam  )
	BT_ClientAreaInvalidateAll(   cHeaderJan )
	DoEvents()
	

	xDcBarHeader()
	yDcBarH1eMtr()

	yGoTop()	
	DoEvents()



Return


Static Function xFormDt(cData , n1 , n2 )
	Local cD1 := Alltrim(Left(  Alltrim(  Substr(cData , n1 , n2  )     ) , 10  ) )
Return Right(cD1,4) + Substr(Cd1,4,2) + Left(cD1,2)





Static Function xAtuDados(   nIndice1 , lAscedente , aTams  , lTrocaCol )


	Local aMz1
	Local aZZ1    := yRetArray()
	Local cTexto  := ''
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

		//SysWait(0.04)

	End If

REturn




Static Function xGetColQw1()
Return Len(aMapsCol)





Static Function xGetColW1(   nColuna )

	If nColuna > Len(aMapsCol)
		msginfo('eror1')
	End If

Return aMapsCol[ nColuna  ][5]



Static Function xGetInfCw1(   nColuna , nIndice  )
Return aMapsCol[ nColuna  ][nIndice]




Static Function xGetColsVis( nLimite1 )

	Local n2 := xGetScrolPos()
	Local aM2 := {}
	Local c1 := ''

	For n1 := 1 To (Len(aMapsCol) - 1)
		If (aMapsCol[n1][2] >=  n2) .And. (  aMapsCol[n1][3] <=  nLimite1   )
			c1 += (Alltrim(Str(n1)) + ".")
		End If 
	Next 

Return c1 



Static Function ySelCol( nCol1 )

	nColSele := nCol1
	BT_ClientAreaInvalidateAll(cHeaderJan)

	DoEvents()

	
	xDcBarHeader()
	yDcBarH1eMtr()

	SysWait(0.02)

Return


Static Function xGetColPos( lFrente )
	 Local nPos1 := xGetScrolPos()+nColIniBrw
	 Local n1 := 0

	 If !lFrente
		nPos1 -= nColIniBrw
	 End If 


	 If (xGetScrolPos() == 0)
		 nPos1 += 17
	 End If 
	 
	 n1 := Ascan( aMapsCol , { |a| ( a[2] <= nPos1) .And. (a[3] >= nPos1 )   })

	 If (n1 == 0)
	     n1 := 1
	 End If 


Return n1



Function EventHeaMtr( nHWnd1, nMsg )
//( nHWnd, nMsg, nWParam, nLParam )

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


	//LOCAL  nHWnd1   := EventHWND()
	//LOCAL  nMsg    := EventMSG()
	//LOCAL  nWParam := EventWPARAM()
	//LOCAL  nLParam := EventLPARAM()


	Local nZ1 := 0
	Local lFrente1 := .t.
	Local nLastro1 := 0

	Local lFim := .f. 
	Local lIni := .f. 

	//  Local nUnit := xRetUnit()
	// Local nColx

	Local nCol := 0
	Local nSaveCol1 := 0
	Local nQTotEt := 0


	If !_IsWindowDefined(cHeaderJan)
		Return
	End If


	If nHWnd1 == GetControlHandle(  'Label2' ,  cHeaderSombra )

		If (nMsg == WM_LBUTTONDBLCLK)

			DoEvents()
			nHw1 := CursorOn1( cHeaderSombra  )				
			lAscending    := !lAscending
			nOrdemSel     := nColSel1

			BT_ClientAreaInvalidateAll(cHeaderJan)		
			xDcBarHeader()

			If (nOrdemSel > 0) .And. (nOrdemSel <= Len(aCabecs))
				If nOrdemSel <= Len(aMapsCol)
					xOrdene( nOrdemSel , lAscending )

					BT_ClientAreaInvalidateAll(c_BrowName)
					DoEvents()

					yDcToDc()
					DoEvents()
					
				End If
			End If

			//SysWait(0.04)

			DoEvents()
			CursorOff1( nHw1   , cHeaderSombra  )		

		End If


		If (nMsg == WM_LBUTTONDOWN)
         
			DoEvents()		
			nColSele := nColSel1

			DoEvents()					
			//msginfo('lpp3333 ' + Str(nColSele))

			If (nColSele <= 0) .Or. (nColSele > Len(aMapsCol) )
				//msginfo('lpp3333')
				Return
			End If

			lDragHeader := .t.

			xCaptBmp(nColSele)
		
			//UxLib96()

			nColSav1 := aMapsCol[nColSele][2]
			nColTam1 := aMapsCol[nColSele][5]
			cTituloCol := aMapsCol[nColSele][1]

			BT_ClientAreaInvalidateAll(cHeaderJan)
			SysWait(0.02)
			xDcBarHeader()

			GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd1 , nRow, nCol )
			nColx := ar1[2]

			//msginfo(nColSav1)

			nColx5 := nColX
			//SIZEMODE

			
			ySelCol( nColSel1 )				
			DoEvents()
			SysWait(0.01)

			//msginfo(Str(  nColSel1   ))


			If (lSizeMode)

			
				For i := 1 To 255
					GetAsyncKeyState(i)
				Next i

				lAndamento := .t.

				nSaveCol1 := nColSel1
				nUnit 	  := xRetUnit()
				lOk  := .f.

				While (.t. )

					If (GetAsyncKeyState(VK_LBUTTON)) == 0
						Exit
					End If

					lAndamento := .t.					

					GetCursorPos (@nCol, @nRow)
					ar1 := GetPos_ScreenToClient(   nHWnd1 , nRow, nCol )
					nColx2 := ar1[2]


					DoEvents()			

					nColDrag1 := nSaveCol1

					If (Abs(nColx2 - nColx) >= nUnit ) .And. (nColx2 < GetProperty(cHeaderJan , 'Width'))

						DoSizeCol( nColx , nColx2 , nSaveCol1)
						DoEvents()
						nOrdemSel := 0
						lOk  := .t.
						nColx := nColx2

						DoEvents()
						iz:=1

						For iz := 1 To 255
							GetAsyncKeyState(iz)
						Next iz
						SysWait(0.01)

					Else 							

					End If					

				Enddo

				If lOk

					nHw1 := CursorOn1( cHeaderSombra  )					
					DoEvents()					
					BT_ClientAreaInvalidateAll(cHeaderJan)
					xDcBarHeader()
					DoEvents()

					ySetTam( aColsTam )
					xAtuDados( 3 , .t. ,  aColsTam  )
					
					yGoTop()
					DoEvents()
					yRefresh( c_BrowName )
					nColx5 := 0
					xH_CalcBar( .t. )
					DoEvents()

					CursorOff1( nHw1   , cHeaderSombra  )

				End If

				lSizeMode := .f.
				lAndamento := .f.
				lDispHint1 := .f. 
				lDispHint := .f. 
				SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , '')

				
				xHidehint()
				DoEvents()

			Else


			End If

		End If




		If (nMsg == WM_LBUTTONUP)

			lSizeMode := .f.
			lDispHint1 := .f. 
			lDispHint := .f. 
			SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , '')
			lDragHeader := .f.
			lAndamento := .f.

			lDraHighM := .f.

			nColSav1 := 0
			nColx5 := 0
			xHidehint()
			DoEvents()
			//msginfo('3332')

		End If

		If (nMsg == WM_LBUTTONDBLCLK)
			//msginfo('Double ' + Str(nColSel))

		End If 

		If (nMsg == WM_MOUSEMOVE) 
				//.And. (1 == 2)
			//xLimpBarV()

			s1 := ''
			s2 := ''

			//msginfo('h11')

			CloseYeLLow()
		
			cObjSelected := 'HeaderMtr'

			nModeBrw := 0

			
			GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd1 , nRow, nCol )
			nColx := ar1[2]
			
			DoEvents()

			 If (!lDisphint)			
			 	SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , Hb_AnsiToOem('Click e Arraste a Colunas para Mudar de Posição.')   )	
			 	DoEvents()
				SetWindowCursor( nHWnd1 , IDC_ARROW)
			 	lDisphint := .t.								
			 End If

			nColx5 := 0
			i:=1

			nQT1 := xH_xClcDir(  Len(aMapsCol[1])   ) - 1
			For i := 1 To 255
				GetAsyncKeyState(i)
			Next i

			//lDragHeader := .t.
			lPassou := .f. 
			//DRAGMODE

			nDiff1:=0


			If nColSele > 0
				nDiff1 := (xGetScrolPos() + nColx) - (  xGetInfCw1( nColSele , 2  )      )
			Else 				
			
			End If 		

			

			While (GetAsyncKeyState(VK_LBUTTON) != 0) .And. (lDragHeader)
			   //.And. (lDragHeader) 			  

				For i := 1 To 255
					GetAsyncKeyState(i)					
				Next i

				DoEvents()

				GetCursorPos (@nCol, @nRow)
				ar1 := GetPos_ScreenToClient(   nHWnd1 , nRow, nCol )
				nColx := (xGetScrolPos()+ar1[2])
				DoEvents()
				
				If ( (nColx - nDiff1) > nLimite1)
					SysWait(0.03)
					nColx += 1
					lPassou := .t.
					DoEvents()									
					nColx5 := nColx+1			
				End If 

				If (nColx5 == 0) .And. (!lPassou)
					nColx5 := nColx					
				End If

				//DoEvents()


				If ( Abs(nColx - nColx5) > 1) .or. (lPassou)					
					DoEvents()					
					nTarget := xBusqTar(  (nColx - nDiff1)  , lFrente1 )														

					If ( (  nColx - xGetScrolPos()  )   < 10) .And. (nColSele > 0) 

						If !lIni						

							nZ1 := xDoScrolV( .f. , .t. ,  .f.  )
							
							If nZ1 != -1									
								nColx5 := nColx			
								DoEvents()															
							Else 
								lIni := .t. 
							End If 					
							
						    SysWait(0.01)
							DoEvents()						

						End If 
					
					Else 	
						If ( ( nColx - xGetScrolPos())  > (nLimite1 - 10) ) .And. (nColSele > 0) 						     

							 If (!lFim)					    							 	
							 	SysWait(0.01)
							 	DoEvents()
							    
								nZ1 := xDoScrolV( .t. , .t. ,  .f.  )																				
								nz1 := 0
						
								If nZ1 != -1									
									nColx5 := nColx			
									DoEvents()															
									//msginfo('ok2')
								Else 								    
									DoMethod('fFiltrosCad' , 'SetFocus')
									SysWait(0.02)
									yRefresh(c_BrowName)							
									DoEvents()								
									lFim := .t. 									
								End If 	

								SysWait(0.04)
								DoEvents()						

						    Else 
							
							End If 							

						Else			

							lPassou := .f.


							If (nTarget > 0) .And. ( nTarget <= (Len(aMapsCol) - 1) )
								nColTarget := nTarget
								xHidehint()
								BT_ClientAreaInvalidateAll(   cHeaderJan )
								xDcBarHeader()							
								DoEvents()
								SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , hb_AnsitoOem('Trocar a Posição , Coluna ' + ; 
								QuotedStr(Alltrim(aMapsCol[nTarget][1]  )) ) )
								DoEvents()																		
							End If

							DoEvents()

							lIni := .f. 
							lFim := .f.

							lDragHeader := .t.
							xMoveWin( nColSele , nColx - nDiff1 , lFrente1   )							
							nColx5 := nColx

							SysWait(0.03)

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

				DoEvents()

			Enddo								

			lDragHeader := .f. 
			SetBrwDrgM( .f. , nColx5 )							

			
			If  (lMove1) .And. (nColSele > 0) 

				//msginfo(Str(nColTarget))
			
			    If (nColSele != nColTarget) .And. ( nColTarget <= (Len(aMapsCol) - 1) )	.And. (nColTarget > 0)			
				    xTroquePos(nColSele , nColTarget , aCabecs[nColSele] )
					DoEvents()					
				End If  			


				BT_BitmapRelease(hBit201)
				hBit201 := Nil	
				lMove1 := .f.
				lDragHeader := .f.
				nColSele1 := 0
				nColSele  := 0
				nColTarget := 0
				DoEvents()
				yRefresh( c_BrowName )
				DoEvents()
				SetBrwDrgM( .f. , nColx5 )						
				nColMove := 0
				BT_ClientAreaInvalidateAll(   cHeaderJan )
				SysWait(0.06)

			    	
			End If			

			DoEvents()

			If !(GetAsyncKeyState(VK_LBUTTON)) == 0
				Return
			End If

			//SetWindowCursor( nHWnd , IDC_ARROW)
			aCords := xSearchPos(  nColx )


			If Len(aCords) = 0
				lSizeMode := .F.
				lDispHint1 := .f. 
				lDispHint := .f. 
				//SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , '')
				lDragHeader := .F.
				lAndamento := .f.
				lTrack39 := .f.
				xApagueH( cHeaderJan )
				xDcBarHeader()
				DoEvents()

				
				xHidehint()
				DoEvents()
				//msginfo('Zero')
				Return
			End If

			If ((nColx2 := xSearchLim(  nColx )) > 0) 
				
				 If !lSizeMode
				 	lSizeMode := .t.
				 Else 
				 	If !lDispHint1
				 		SetWindowCursor( nHWnd1  , 'CURSORSIZE' )
						DoEvents()
				 		SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , 'Redimensiona a Coluna ' + Hb_AnsiToOem(Alltrim( aMapsCol[nColx2][1])) + '  '  + Str(nColSel1)  )									 
						lDispHint1 := .t. 
					//	msginfo('lp22')
					End If 				
				 End If 
				
				Return

			Else

				If  (_isWindowDefined("Win_Msg")) .And. (IsWindowVisible(  GetFormHandle('Win_Msg')    ))
					xHidehint()
				End If

				lSizeMode := .f.
				lDispHint1 := .f. 
				SetWindowCursor( nHWnd1 , IDC_ARROW)
				If ('Redimensiona a Coluna' $  Alltrim(GetProperty( cHeaderSombra  , 'Label2' , 'ToolTip')))
					SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , '')
					lDispHint := .f. 					
				End If 
								
				xHidehint()
				DoEvents()

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
					
					SysWait(0.02)
					nColSel1 := aCords[1][2]
				//	UxLib96()


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




Static Function DoSizeCol( nCol1 , nCol2 , nColunax)

	Local nUnit   := xRetUnit() - 2
	Local nFator1 := Int((nCol2 - nCol1)/nUnit)
	Local nFator2 := Int((nCol1 - nCol2)/nUnit)
	Local lOk	  := .t. 
	Local nTam 	  := Len(aMapsCol) - 1
	
	//nFator1:=1

	If (nCol2 > nCol1)								
		If (nColunax < nTam)
			aColsTam[nColunax]    += nFator1
		Else 
			lOk := .f. 
		End If 
	Else	
		If nCol2 >= 17 
			aColsTam[nColunax]    -= nFator2
		Else 
			lOk := .f. 
		End If 
	End If	
	
	If lOk 
		xMapCols( aCabecs , aColsTam , aTipsy )
		BT_ClientAreaInvalidateAll(cHeaderJan)
		
		xDcBarHeader()
		yDcBarH1eMtr()		
	Else 
	  //	msginfo('lp22')
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

	xH_CalcBar(  .t.  )

	SysWait(0.02)
	CursorOff1(  nH1  , '')


REturn .t.


Static Function xBusqTar( nPoint , lFrente5  )

	Local nColz1 := 0
	Local nQtt   := nQT1
	Local nLimite := xCalcTam()
	Local n2 := Ascan( aMapsCol , { |a| (a[2] <= nPoint) .And. ( a[3] >= nPoint ) }  )
	Local n1 := 0
	Local nTam1	

	If (n2 > 0)
	   nTam1 := aMapsCol[n2][3] - aMapsCol[n2][2]
	   n5 := (0.25 * nTam1)
	   If (nPoint >= ( aMapsCol[n2][2] - n5)  ) .And. (  nPoint <= ( aMapsCol[n2][3] - n5)  )
	   		n1 := n2
	   End If 
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


Static Function yApagueH( cJanela1 )

	Local n1
	Local n3
	Local Height := GetProperty( cJanela1  , 'Height')
	Local lRet := .f.

	DoEvents()

	If (nColSel1 > 0)

		lTrack39 := .f.
		
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

Return n2



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
	Local cArqTemp := "Temp\T1_" + StrZero(Random(7644) ,5 ) + "_" + StrZero(Random(9874) ,5 ) + ".Log"
	//'Arial'
	//FONTBROWSER

	hDC = BT_CreateDC ( cHeaderJan  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	hFont := HMG_CreateFont (  hDC ,  cFont1 , FONTBROWSERSIZE, .f., .f., .f., .f. )

	aMapsCol := {}

	For n1 := 1 To Len(aCabs) + 1 		

		If (n1 < (Len(aCabs) + 1 ))
			nTam1  := aTamx1[n1]
			nQAcento := QtAcento(Alltrim(aCabs[n1]) )
			nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
			cTexto := Replicate('A' ,  nTam1 + 1 )
			n12 := GetTextWidth( hDC , cTexto , hfont )
			nTam := n12
			nAcum2 += ( (nColx +  nTam + 1 ) - nColx )
			Aadd( aMapsCol , {   aCabs[n1] , nColx , nColx +  nTam , aTipos1[n1] ,   nTam ,  aTamx1[n1] , nAcum  , nAcum2 }  )
			nColx += (nTam + 1)
			If (nTam >=  nLimiteAtu)
				Return .f.
			End If
			nAcum += aTamx1[n1]+2
			nTam12 += nTam
			//SaveLog(cArqTemp , Str(n1) + '  '  +  aMapsCol[n1][1] + '  ' + Str(aMapsCol[n1][2])  + '   ' + Str(aMapsCol[n1 ][3]) + '   ' + Str(aMapsCol[n1][5]) + XQUEBRA   )
		Else

			nTam1 := 5
			cTexto := Replicate('A' ,  nTam1 + 1   )
			n12 := GetTextWidth( hDC , cTexto , hfont )
			nTam := n12

			nAcum += 11
			nAcum2 += ( (nColx +  nTam + 1 ) - nColx )			

			Aadd( aMapsCol , {   '   ' , nColx , nColx +  nTam + 1 , 'C' ,   nTam ,  10  , nAcum  , nAcum2 }  )
		//	SaveLog(cArqTemp , Str(n1) + '  '  +  aMapsCol[n1][1] + '  ' + Str(aMapsCol[n1][2])  + '   ' + Str(aMapsCol[n1 ][3]) + '   ' + Str(aMapsCol[n1][5]) + XQUEBRA   )


		End If
	Next

	BT_DeleteDC (BTstruct )

Return nAcum2

Static Function xH_RtLimite()
Return nLimiteAtu



Static Function xH_xClcDir( nTotCol1 )

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






// Function xH_ColResto( nLimite )



// 	Local nCol1 := 0
// 	Local nResto := 0
// 	Local nIndice := Ascan(aMapsCol , { |a|  a[3] > nLimite  }  )
// 	Local nSoma := 0
// 	Local n1 := 1

// 	If (nIndice > 0)
// 		nResto := aMapsCol[nIndice][3] - nLimite
// 	End if

// Return nResto





Static Function xRetUnit()

	Local BTstruct
	Local nQAcento
	Local hDC
	Local hFont
	Local n12

	hDC    := BT_CreateDC ( cHeaderJan  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	hFont  := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )	
	n12    := GetTextWidth( hDC , 'A' , hfont )

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

	n1 := Ascan(  aMapsCol , { |a|   Abs( (a[3]+nCol) - nCol1 )  <= 10    }     )

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


Static Function yUpHead1( cHeader1 ,  nValor   )


	nColHeader += nValor
	BT_ClientAreaInvalidateAll (cHeader1)

return

Static Function isDrgMode()
REturn (lDragHeader)

Static Function yDragOff()

	lSizeMode := .f.
	lDispHint1 := .f. 	
	lDispHint := .f. 
	lAndamento := .f.
	nColTarget := 0	
	nColx5 := 0


	SetProperty(  cHeaderSombra , 'Label2' , 'ToolTip' , '')


	
	xHidehint()
	DoEvents()

	BT_ClientAreaInvalidateAll(  cHeaderJan)


REturn





Static Function xCaptBmp(nCol1)

	Local nTam1  := aMapsCol[nCol1][3] - aMapsCol[nCol1][2]
	LOCAL Height := BT_ClientAreaHeight (cHeaderJan)
	Local nColx  := nColIniBrw
	
	nColx :=  (aMapsCol[nCol1][2] - 0) //13
	hBit201 := BT_BitmapCaptureWindow ( cHeaderJan , 0 , nColx , nTam1 - 1  , Height )



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
	Local cFontHead := FONTBROWSER
	//'Arial MS Unicode'
	//'Arial'
	//FONTBROWSER
	Local nfontSize := FONTBROWSERSIZE
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
	Local n12 


	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )

	BT_DrawLine ( hDC, 0 , 0 , 0 , Width, {100,103,105}, 1 )

	If lEnabled2
		BT_DrawGradientFillVertical ( hDC ,   1 , 0  , Width    ,    Height - 1    , CORHEAD1  , CORHEAD1 )
	Else
		BT_DrawGradientFillHorizontal ( hDC ,   1 , 0  , Width ,    Height  - 1  ,  {110,110,110}  , GRAY )
	End If
	
	BT_DrawLine ( hDC, Height - 1 , 0 , Height - 1 , Width, {75,75,75}, 1 )
	If (nColHeader > 0)
		nColx += nCol
	End If

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

		cTexto1 := Padc( Alltrim(  Hb_AnsiToOem(aMapsCol[n1][1] ))   ,   nTam2 + 1  ) 

		
		If nOrdemSel == n1

			//msginfo('llpp22')

			If (aTamanho[nOrdemSel]  <= 13)

				n12 := GetTextWidth( hDC , cTexto1 , hfont )
				BT_DrawBitmapTransparent (hDC  , 6 ,  nColx + n12 + 1  , 16  , 16 , BT_STRETCH, Iif(lAscending ,  hBitOrd1 ,  hBitOrd2 ) )			

			Else 
				BT_DrawBitmapTransparent (hDC  , 6 ,  nColx + 4 , 16  , 16 , BT_STRETCH, Iif(lAscending ,  hBitOrd1 ,  hBitOrd2 ) )
			End If 

		End If


		BT_DrawText ( hDC , nLinha  ,nColx + 5 ,    cTexto1  , cFontHead  , nfontSize , WHITE,  {230,230,230}   , ;
			nTypeText ,	nAlingText, nOrientation )

		nColx += nTam1

	Next


	nColx += aMapsCol[Len(aMapsCol)][5]
	DraVertL( hDc  , nColx , Height - 1 )

	If !lEnabled2
		REturn
	End If



	If (nColSele > 0) .And. (nColSele <= Len(aTamanho))

		//nColx := nColIniBrw
		nColx := 1

		If (nColHeader > 0)
			nColx += nCol  
		End If

		If nColSele > 1 
			nColx -= nColSele
			nTam -= (nColSele * 2)
		End If 

		nTam1  := aMapsCol[nColSele][5] 
		nColx +=  aMapsCol[nColSele][2] 
		cTexto1 := Alltrim(aMapsCol[nColSele][1])


		nQAcento := QtAcento(Alltrim( aMapsCol[nColSele][1]  ) )
		nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
		nTam2 := If( (nQAcento =  0)   , aTamanho[nColSele] , aTamanho[nColSele] + nQAcento ) //

		cTexto1 := Padc( Alltrim(  aMapsCol[nColSele][1] ) ,   nTam2 + 1  )
		BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx + 1   , nTam - 2       ,    Height - 1    ,  CORHEAD4, CORHEAD3 )
		

		If nOrdemSel == nColSele

			If aTamanho[nOrdemSel]  <= 13
				n12 := GetTextWidth( hDC , cTexto1 , hfont )

				BT_DrawBitmapTransparent (hDC  , 6 ,  nColx+n12+1  , 16  , 16 , BT_STRETCH, Iif(lAscending ,  hBitOrd1 ,  hBitOrd2 ) )			
			Else 
				BT_DrawBitmapTransparent (hDC  , 6 ,  nColx+2 , 16  , 16 , BT_STRETCH, Iif(lAscending ,  hBitOrd1 ,  hBitOrd2 ) )
			End If 

		End If


		BT_DrawText ( hDC , nLinha  , nColx,   Hb_AnsiToOem(cTexto1) , cFontHead  , nfontSize, WHITE,  {230,230,230}   , ;
			BT_TEXT_TRANSPARENT+BT_TEXT_BOLD ,	nAlingText, nOrientation )
	

	End If



	
	If (lDragHeader) .And. (nColMove > 0) .And. (nColMove <= Len(aMapsCol))  
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


Return 


Static Function xBarHMtr( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela  , cBrowser , nTotCol , nTamBar , cHeaderN1  , lDispo1  , nColuna  , l_Ativo )

   
    Private cJanName   := 'Win_BhMtr' + Left(cParent,4)
    Private cJanSombra := 'Win_SombraBhMtr' + Left(cParent,4)
    cBarraSombra := cJanSombra
    nLarTotalx   := nLarguraTot2
    cBarraName2   := cJanName
    cBrwName     := cBrowser
    nLargJan     := nLargJanela

    //nLargCalc := xCalcTam()

    yBmpDireita2  := BT_BitMapLoadFile('DIREITA1')    
    yBmpEsquerda2 := BT_BitMapLoadFile('ESQUERDA1')

    
    yBmpDireita  := BT_BitMapLoadFile('DIREITA')    
    yBmpEsquerda := BT_BitMapLoadFile('ESQUERDA')


    yBmpEsquerdad := BT_BitMapLoadFile('ESQUERDAD')
    yBmpDireitad  := BT_BitMapLoadFile('DIREITAD')


    lEnabledy := lDispo1
    nColTotal := nTotCol   

    nTamBarra := 0
    xH_CalcBar()

    cHead1 := cHeaderN1   

        
    DEFINE WINDOW &cJanName ;
        AT nLinha1 - 3, nColuna - 3 ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 20 ;
        TITLE 'xScroxRoleol1' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE  ; 
        ON PAINT xPaintBarraH( ThisWindow.Name , nAcende  ) 
    END WINDOW  

    //+ 12
    

    //msginfo(  Str(GetProperty(  cBrowserName , 'Width'  )+22) )




    DEFINE WINDOW &cJanSombra ;
        AT nLinha1 - 3 , nColuna - 3 ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 40 ;
        TITLE 'xScroxRoleol1Sombra' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR RGB(242,242,242) ;
        ON MOUSEMOVE (cObjSelected := 'BarraH')	
    END WINDOW  


    
    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabledy , 167 , 0)

    If lEnabledy     
        lEnabledy := (nTamBarra > 0)
    End If 


    xh_InitLim()
    //yZeraConter()

    If !_isWindowDefined('yFormSplah')
      //  WinYeLLow( GetProperty(cParent , 'Row') + GetProperty(  cBrowserName , 'Height'  )+65 ,  ;
       // GetProperty(cParent , 'Col') + 25  , 'Click e Arraste Devagar para ' + XQUEBRA + ' Navegar entre as Colunas.'  , cActiveJan )                               


	//	WinYeLLow( GetProperty(  cBrowserName , 'Height'  )+5  , 25 , 'Click e Arraste Devagar para ' + XQUEBRA + ' Navegar entre as Colunas.'  , cBrowserName )                               
	//	BT_DELAY_EXECUTION_WITH_DOEVENTS(250)		
		//CloseYeLLow()
    End If 
    

	HMG_ChangeWindowStyle(  GetFormHandle(cJanSombra) , Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
 


    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabledy , 167 , 0)
    If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarMtr"  ) )  ) = 0) .And. (lEnabledy)
       // InstallEventHandler( "EventBarMtr" )		
    End If

    //HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER , NIL, .T. )


     
Return cJanName    


Static Function xQbrwCol()
Return xH_xClcDir(  nColTotal  )




Static Function Xh_RetPasy()
Return nPassoy



Static Function xH_CalcBar( lAtuBarra )
 
    Local nQB1 := xH_xClcDir(  nColTotal   )
    Local nTamAnt := nTamBarra
    Local nI1
    //Local nQ1 

    DEFAULT lAtuBarra := .f. 



    xh_InitLim()

    If nQB1 > 0
        nZ1 := Transform( (nQB1 / nColTotal) , '999,999.999999')         
        nP1 :=  Int( (nLargJan - 15)  * rTrans(  nZ1   ) )
        nTamBarra := (nLargJan - 15) - nP1               
        nPassoy := Int( np1 / (nQB1 - 1 )) 
        nQ1 := (nQB1 - 1 )             
        If _IsWindowDefined(cBarraName2)         
            BT_ClientAreaInvalidateAll(cBarraName2)  
            yDcBarH1()
            DoEvents() 
        End If     
    End If 
    
    xh_InitLim()

Return nQB1



Static Function yRetQPAsso()
Return nQ1 + 1



Static Function xRetBarH()
REturn nScroxy    


Static Function yUpdatBha1( nPos1 )

    nScroxy += nPos1     
   
    DoEvents()    
    BT_ClientAreaInvalidateAll(cBarraName2)  

    DoEvents()  
    yDcBarH1()  

Return 


Static Function xPaintBarraH( cJanela , nAcende1  )

    //BT_DRAWEDGE
    Local BTstruct
    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
    LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local nWidBarra := nTamBarra 
    Local hDC2 := BT_CreateDC (cJanela ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)



    If (!lEnabledy)

    End If 

    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )    

     If (!lEnabledy)
        BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerdad )
        BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireitad  )
    Else 

        If (nAcende1 > 0) .And. ( Alltrim(cObjSelected) = 'BarraH')

             If nAcende1 = 2
                BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerda )
                BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireita2  )
             Else 
                BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerda2 )
                BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireita  )
            End If 

        Else 
            BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerda )            
            BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireita  )
        End If 
    End If 
    

    If (!lDragMode) .And. (lEnabledy) .And. (!lDraHighM)
        BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}   , 0)        
    Else 

        If lEnabledy        
            If (lDragMode) .or. (lDraHighM) 
                If nScroxy >= 5
                    BT_DrawFillRoundRect (hDC2 , 4 , nScroxy   , nWidBarra    , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
                End If 
            Else 
                BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra  , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
            End If    
        End If     

    End If     

    BT_DeleteDC (BTstruct )

Return     


Static Function yGetBarNome(nTipo)

Return Iif(nTipo = 1, cBarraName2, cBarraSombra)


Function EventBarMtr( nHWnd, nMsg, nWParam, nLParam )

    Local cOpcao := ''
    Local nCol   := 0
    Local nRow   := 0
    Local lFirst := .f. 
    //	Local aR1

    Local nColx  := 0

    LOCAL Width  := BT_ClientAreaWidth (cBarraName2)

    Local nWidBarra := nTamBarra
    Local nLimite := nLarTotalx - nWidBarra   
    Local nLimite2 := (nLargJan - nWidBarra)  
  
    Local ar1 

    Local lOk := .f. 

    Local nColAnt := 0

    

    Local lOk2 := .f. 

    Local i 
    Local lTte := .f. 
    Local lTtd := .f. 

    Local nZacum := 18

    Local n1 := 0
    Local nMaior := 0
    
    Local nLinx := 0
    Local nLinAnt := 0
    

    If (_IsWindowDefined(cBarraSombra)) .And.  (nHWnd == GetProperty(  cBarraSombra , "HANDLE" ))		


        //MOUSEDOWN BARRAH
        If (nMsg == WM_LBUTTONUP)           

            If nModeBut == 0
                nSaveCol := 0    

                DoEvents()
                
                yDcBarH1()
                lTracking26 := .t. 
                lDragMode := .f.           
                lDraHighM := .f. 
                SetBrwDrgM( .f. , nSaveCol )     

                SysWait(0.02)
			//	nModeBut := 0
                //msginfo('lp2')  
            
            End If            
          
        End If 


        //MOUSEDOWN BARRAH
        If (nMsg == WM_LBUTTONDOWN) 
			

            nColx := nSaveCol
            nColAnt := nSaveCol
            lFirst := .f.             
            nZacum := 0
         //   SysWait(0.02)
         

            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nCol := ar1[2]      


            If (nModeBut = 0)
                If (nCol >= nScroxy) .And. ( nCol <= (nScroxy+nWidBarra) )                                   
                    
                    nModeBut := 999
                    lDragMode := .t.
                    nSaveCol := nCol   
                    SetBrwDrgM( .t. , nSaveCol )                                       
                    
                End If     
            End If       
            
            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i

            If (nModeBut = 1) .And. (!lTracking26)  

                While (nModeBut = 1) .And. (!lTracking26)           

                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        SysWait(0.03)                                   
                        Exit 
                    End If  
                    
                    nY2 := xDoScrolV( .f. ,  ,  )       
                    DoEvents()
                    SysWait(0.04)         

                    IncrCont1( .f.  , nY2)

                Enddo 
               
            End If 

            If (nModeBut = 2) .And. (!lTracking26)                                        
                    
                For i := 1 To 255
                    GetAsyncKeyState(i)
                Next i              
                 
                DoEvents()
                   
                While (nModeBut = 2) .And. (!lTracking26)                                                     
                    

                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        SysWait(0.03)                                                    
                        Exit 
                    End If                      

                    nY2 := xDoScrolV( .t. ,,  )                   
                    SysWait(0.04)         

                    IncrCont1( .t. , nY2  )
                    DoEvents()

           
                Enddo 
                 
            End If 

            PostMessage( GetProperty(  cBarraSombra , "HANDLE" ) , WM_MOUSEMOVE , 0,0)
            DoEvents()


        End If 
      
        //MOUSEMOVE BARRAH
        If (nMsg == WM_MOUSEMOVE) 

			//msginfo('G1')

            GetCursorPos (@nCol, @nRow)
            nCol2 := nCol 
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nCol := ar1[2]
            lTracking26 := .f.                   
            
            cObjSelected := 'BarraH'
			CloseYeLLow()
			nModeBrw := 0

            If (nCol > 18) .And. (nCol < (Width - 20))                           
                If (!lTracking44)
                    If !lDragMode
                        DoEvents()
                        lDraHighM := .f.                     
                        DoEvents()						                                  
                    End If       
                    yOffBarra( cBarraName2  )                              
                    lTracking37 := .f. 
                    lTracking44 := .t. 
                End If 
            Else                         
            
                If (!lTracking37)                    
                    lTracking44 := .f. 
                    nModeBut := 0                
                    SetWindowCursor( nHWnd , IDC_ARROW )           
                                        
                    If nAcende > 0
                        nAcende := 0
                        BT_ClientAreaInvalidateAll(cBarraName2)
                        DoEvents() 
                        yDcBarH1()
                    End If 

                    If (nCol < 21)                        
                        nAcende := 1                        
                        BT_ClientAreaInvalidateAll(cBarraName2)
                        nModeBut := 1
                        lTracking26 := .f. 
                        lTracking37 := .t.                         
                        DoEvents() 
                        yDcBarH1()
                    End If 

                    If (nCol >= (Width - 18))                                                
					//	msginfo('op2')
                        yLimpBarV( '7')	                        
                        DoEvents() 
                        nAcende := 2                                             
                        BT_ClientAreaInvalidateAll(cBarraName2)                        
                        nModeBut := 2            
                        lTracking26 := .f. 
                        lTracking37 := .t.  
                        DoEvents()                        
                        yDcBarH1()                          
                    End If 
                End If 
            End If     
            

            If (nModeBut = 0) //.And. ()
                lDraHighM := .f.
                
                If (nCol >= nScroxy) .And. ( nCol <= (nScroxy+nWidBarra) ) 
                    If (ar1[1] <= 20) 					                               
                        lDraHighM := .t.                    						
                    End If     
                Else 

                    lDragMode := .f.
                    lFirst    := .f. 
					lDraHighM := .f. 
					CloseYeLLow()

                End If                       
                nAcende := 0
                BT_ClientAreaInvalidateAll(cBarraName2)

                DoEvents() 
                yDcBarH1()
                lTracking26 := .f.
                lTracking37 := .f. 

            Else                


            End If          

        End If 			
    End If 


Return 

Static Function xInitSxy()
    nScroxy := 19
Return 




Static Function xDoScrolV( lFrente , lAtuBar ,  lAtuHead1 , lAviso1  , nColZ1)

 //   Local nSaldo1 := xH_ColResto( xH_RtLimite() )       
    //Local aMInfo := xH_CalcPulo( nQContador + 1 , nSaldo1)
    Local nW1 := GetProperty(  cBrwName , 'Width'  ) - 21
    Local np1
    Local nI1     
    Local nSoma1 := 0
    Local nColAtu := 0
    Local aMInfo := {}

    //DEFAULT lModo1 := .f. 
    DEFAULT lAtuBar := .t. 
    DEFAULT lAtuHead1 := .t. 
    DEFAULT lAviso1   := .t. 

	DEFAULT nColZ1 := 0
               
    //SysWait(0.03)    

    
    If lFrente                
		
        If (lScrollFim) .And. ( nColZ1 == 0)
            If lAviso1
              //  xDialog( Hb_AnsiToOem("Não há Mais Tela para Rolar a Direita.")  )
            End If 
            Return -1
        End If                       	



        nColAtu := xGetColPos( .t. )                                                                    
        nSaldo1 := xGetInfCw1(   nColAtu   , 5  ) 

          //  msginfo(Str(nColAtu))
        lScrolIni := .f. 

                
        If (xGetScrolPos() == 0)
            nSaldo1 += nColIniBrw 
        End If 

        DoEvents()
                                    

        xDoScrolHroz( .t. , nSaldo1 , lAtuHead1 , lAtuBar )       
        lScrollFim := ((xGetScrolPos()+xH_RtLimite()) >= (xCalcTam() ) )
        SysWait(0.02)		
		
    Else 
        

        If (lScrolIni) 
            If lAviso1
              //;  xDialog( hb_ANSIToOEM("Não ha mais ESpaço para Rolar a Esquerda."))
            End If 
            Return -1
        End If 


        nColAtu := xGetColPos( .f. )   
        nSaldo1 := (xGetScrolPos() - xGetInfCw1(   nColAtu   , 2  )) + 5        

        aMInfo := {}
        Aadd(aMInfo , nSaldo1)
        Aadd(aMInfo , 1)

        DoEvents()
        SysWait(0.03)                

        xDoScrolHroz( .f. , nSaldo1 , lAtuHead1 , lAtuBar )
        lScrollFim := .f. 
        DoEvents()  

                  
        lScrolIni := (nColAtu == 1)

        If lScrolIni

            n1 := xGetScrolPos()
            If (n1 != 0)
                //  xDoScrolHroz( .f. ,  n1 , lAtuHead1 , lAtuBar )
            End If 

            xDoScrolHroz( .f. , n1 , lAtuHead1 , lAtuBar )

            DoEvents()

			nScr1 	  := 0						
			nColDragy := 0						
			nQxy      := 1
			l_Bofh 	  := .t. 	

			l_Eofh := .f. 	
					
			//msginfo('Zerou')

            xInitSxy()
            xInitScroll()
               
        End If             

    End If



Return nSaldo1


Static Function xDoScrolHroz( lFrente , nValue , lAtuH , lAtBar )

    DoEvents()
    yScrollCaM( lFrente , .f. , nValue , lAtuH  )      
    
    If lAtBar
        If xGetScrolPos()  != 0
            yUpdatBha1(  Iif(  !lFrente , -(Xh_RetPasy()) ,  Xh_RetPasy()  )    )            
            yDcBarH1()                                                             
        End If  
    End If  

    yDcBarH1eMtr()
    DoEvents()    

    
Return                     




Static Function yCheckObj()

    If (!Empty(Alltrim(cObjSelected)) ) .And. (cObjSelected != "Browser")


        If _isWindowDefined(cBarraName2)  
            If !lDragMode		
                yOffBarra(   cBarraName2 )
            End If     
            SysWait(0.02)		

            yApagueH( cHead1 )
            DoEvents()
            

        End If             

        //msginfo('ok2')

    End If 	  
    

REturn 


Static Function yRetAcende()
Return nAcende


Static Function yOffBarra( cBarName  )
      
    lDragMode := .f.     
    lDraHighM := .f.
  
    nAcende := 0
    nModeBut := 0

    
    BT_ClientAreaInvalidateAll(cBarName)

    yDcBarH1()

    lTracking26 := .f.    
    lTracking37 := .f.    

    

REturn 


Static Function yEnable1Bh(  lEnabled1 )

    lEnabledy := lEnabled1

    If !lEnabled1
        yOffBarra( cBarraName2 )
    End If 

    DoEvents() 

REturn 


Static Function yDcBarH1()

    Local Width1  := BT_ClientAreaWidth  (cBarraName2)
    Local Height1 := BT_ClientAreaHeight (cBarraName2)

    LOCAL hDC1, BTstruct1
    LOCAL hDC2, BTstruct2

    Local nTypeText    := BT_TEXT_TRANSPARENT    
    Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP 
    Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
	


    Local Width2  := BT_ClientAreaWidth  (cBarraSombra)
    Local Height2 := BT_ClientAreaHeight (cBarraSombra)

    hDC1 = BT_CreateDC (cBarraName2, BT_HDC_ALLCLIENTAREA, @BTstruct1)
    hDC2 = BT_CreateDC (cBarraSombra, BT_HDC_ALLCLIENTAREA, @BTstruct2)


    If !lEnabledy        
        BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 245 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
    Else 
        BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
    End If     



    BT_DeleteDC (BTstruct1)
    BT_DeleteDC (BTstruct2)

    BT_ClientAreaInvalidateAll (cBarraSombra)

Return 





