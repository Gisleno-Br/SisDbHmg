
#include <hmg.ch>
#include <minigui.ch>


#require "hbxpp"

#include <hmg.ch>
#include <dll.ch>

#include "hbthread.ch"


#define XQUEBRA Chr(13)+Chr(10)

#DEFINE FONTBROWSER 'Lucida Sans Typewriter'
//'Lucida Sans Typewriter'




#define FONTCOR   {102,102,102}
#define CORBROWSE {241,241,241}
#define SELCOR    {28,157,189}



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







Static aOpx1 := 0
Static nItemx1 := 1

Static lHitB := .f.
Static lHitT := .f.



//Static lTermino := .f.
Static aThread2 := Nil
Static aMResult := {}

Static nLArgura := 0

Static cAndamento := ''

Static nTamPag := 35


Static nItemBrwHeight := 0



Static nClearSel := 1
Static cOpMainSel  := ''

Static hBitOk 

Static nSelLine := 0

Static nIndexEventZ := 0 


Static lTermino := .f.


Static lColor1 := .f.

Static aMtrColor := {}

Static nLinScrool := 0

Static nItemScrool := 0

Static aMt1 := {}

Static nLinhaBarra := 1

Static nColScrool := 0

Static nHSCrool := 30

Static nLargTotal := 0

Static lNoHorzScr := .f. 



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

	aThread2 := hb_threadStart( HB_THREAD_INHERIT_PUBLIC, @TestBrow(),  cParentx , cTabela  )

	

REturn Nil 
//(TestBrow(  cParentx , cTabela  ))



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

//	Local oServer
	Local oQuery

	LOCAL lBold      := .F.
	LOCAL lItalic    := .F.
	LOCAL lUnderline := .F.
	LOCAL lStrikeOut := .F.

	Local aDynfont   := {}

	Local nColy

	Local lAtivo := .f.

	// Local aTams := {}

	Local am1 := {}


	Local cGridname := 'Br_grid'

	Local bGrid1 := {}
	Local bGrid2 := {}

	Local nW1

	Local aItens := {}

	Local oServer

	Local nTamLargura := 0

	Local nTam1 := GetTextoTam( ''  , cParent1 ) 

	Local cLabelx := 'Lblx01'


	Local i

	Local nX1


	aMtrHeader := {}




//	msginfo(Str(   nTam1  ))

	//SetWindowCursor( GetFormHandle(  cActiveJan ) , HOURGLASS )

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

	cSq2 += " order by codigo desc limit 500"





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

	//SET CODEPAGE TO PORTUGUESE
	//REQUEST HB_LANG_PT
	//REQUEST HB_CODEPAGE_PT850


	//HB_SETCODEPAGE("UTF8")

//	HB_SetCodePage("PT850")

	aDynFont := {}




//    msginfo(   cSq2  )

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

			//msginfo( fieldName(nx1) )




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


			//nTam1 := 1

			//Aadd(aM1 , { Padr(cValor , Int( (aTams[nx1]+3) * 1.03)  )   ,  Int( (aTams[nx1]+3) * 1.03)           }  )

			nQAcento := QtAcento(cValor)

			nTam := If( (nQAcento =  0)   , aTams[nx1] ,  aTams[nx1] + nQAcento )



			If ( Alltrim(aTips[nx1]) = 'C') //.or. ( Alltrim(aTips[nx1]) = 'D')
				Aadd(aM1 , { Padr( (cValor) ,nTam )  ,  nTam          }  )
			Else
				Aadd(aM1 , { Padl( (cValor) ,nTam )  ,  nTam          }  )
			End If

			Do Events

		Next



		c1 := ' '

		Aeval(aM1 , { |a|  c1 += ( a[1]   )     })

		//msginfo(c1)

		c1 += "."



		If (nTamLargura == 0)

			Aeval(aM1 , { |a|    nTamLargura += (a[2]+1)   })

			nLargura := (nTamLargura * nTam1)
			//msginfo( ' e1 ' + Str(nLargura) )

		End If


		//Aadd(aItens , aM1 )

		cAndamento := 'Andamento : '  + Alltrim(Str(I)) + "/" + Alltrim(Str(   oQuery:LastRec() ))

		//	Do Events

		Aadd(aItens , { c1 , lAtivo }  )

		//Dbskip()


	Next


	oServer:Destroy()
	oServer := Nil




	oQuery:Destroy()
	oQuery := Nil



	aMResult := Aclone(aItens)

	//msginfo(Str(  Len(aMResult)  ))


	lTermino := .t.


Return aItens



Function xBrowser( aDatas1 , cParent  , nTamWidth )


	Local nLarg1 := GetDeskTopWidth() - 45

	aMt1 := Aclone(aDatas1)

	nMaxItem1 := Len(aDatas1)

	//msginfo(Str(  Len(aDatas1)   ))

	nItemBrwHeight := nItemSubHeight - 5

	nItemScrool := 0

	nLargTotal := nTamWidth

	lNoHorzScr := .f. 

	hBitOk := BT_BitmapLoadFile ('OKMARK')

	//msginfo(Str(   nLarg1  )   + '    ' + Str(   nLargTotal ))

	//nLinScrool := nItemBrwHeight * nTamPag
	

    If (nLarg1 < nLargTotal)
		DEFINE WINDOW Win_Browser ;
			AT 145,10 ;
			CHILD ;			
			WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH nLargTotal  ;
			TITLE 'xBrowser' + Left(cParent,4)  	;
			NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE ;
			ON PAINT xPaintBrowser( ThisWindow.Name , aMt1 , nItemx1 ,     nClearSel )
		END WINDOW
	Else 

		DEFINE WINDOW Win_Browser ;
			AT 145,10 ;
			CHILD ;
			WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH Nil  ;
			TITLE 'xBrowser' + Left(cParent,4)  	;
			NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE ;
			ON PAINT xPaintBrowser( ThisWindow.Name , aMt1 , nItemx1 ,     nClearSel )
		END WINDOW

		lNoHorzScr := .t. 


	End If 



	
	//SET WINDOW Win_Browser TRANSPARENT TO 2


	
	//COLOR WHITE 





	DEFINE LABEL Labelx1
		PARENT Win_Browser
		ROW    95
		COL    20
		WIDTH  120
		HEIGHT 24
		VALUE "  "
		FONTNAME FONTBROWSER
		FONTSIZE 9
		TOOLTIP ""
		FONTBOLD .T.
		FONTITALIC .F.
		FONTUNDERLINE .F.
		FONTSTRIKEOUT .F.
		HELPID Nil
		VISIBLE .T.
		TRANSPARENT .T.
		ACTION Nil
		AUTOSIZE .F.
		BACKCOLOR NIL
		FONTCOLOR {150,150,150}
	END LABEL




	nCol11 := GetDeskTopWidth() - 32

 /*

	DEFINE WINDOW Win_Role1 ;
		AT 145,nCol11  ;
		CHILD ;
		WIDTH 20 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH Nil  ;
		TITLE 'xScroxRoleol1' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
		ON SCROLLDOWN ScrolUp1( .f.  ) ; 
		ON SCROLLUP ScrolUp1( .t.  )  ;
		ON VSCROLLBOX vScrolBox() 
	END WINDOW
	*/


	DEFINE WINDOW Win_Role1 ;
		AT 145,nCol11  ;
		CHILD ;
		WIDTH 20 HEIGHT (nTamPag * nItemBrwHeight) ;
		TITLE 'xScroxRoleol1' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
		ON PAINT xPaintScroll( ThisWindow.Name )

	END WINDOW



	_ShowWindow("Win_Browser")


	SHOWSCROLLBAR (GetFormHandle("Win_Browser") , 0, .f.)
	SHOWSCROLLBAR (GetFormHandle("Win_Browser") , 1, .f.)




	SHOWSCROLLBAR (GetFormHandle("Win_Role1") , 0, .f.)
	SHOWSCROLLBAR (GetFormHandle("Win_Role1") , 1, .f.)



	HMG_ChangeWindowStyle( Win_Role1.Handle, WS_BORDER, NIL, .t., .T. )
	HMG_ChangeWindowStyle( Win_Role1.Handle, NIL, WS_EX_STATICEDGE, .T., .T. )



	BT_ClientAreaInvalidateAll('Win_Browser')



	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBrowser"  ) )  ) = 0
		InstallEventHandler( "EventBrowser" )
		nIndexEventZ := EventCreate (  { ||   xTeclasBrow( )   }  )
	End If

	_ShowWindow("Win_Role1")

	//SysWait(.3)


	//BT_ClientAreaInvalidateAll('Win_Browser')




Return


Function xTeclasBrow()


	LOCAL  nHWnd   := EventHWND()
	LOCAL  nMsg    := EventMSG()
	LOCAL  nWParam := EventWPARAM()
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
	
	Local nLarg1 := GetDeskTopWidth() - 45
	Local nDiff := nLargTotal - nLarg1


	//xFechaMen

	Local nMaxItem := Int(nTamSubMenuConsulta / nItemSubHeight)



	If nMsg == WM_KEYDOWN

		If (nWParam == VK_RIGHT)

			
			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				REturn 			
			End If 


			If (nColScrool < nDiff )

				nColScrool += nHSCrool		

				nR := GetProperty(  "Win_Browser"  , "Row"     )
				nC := GetProperty(  "Win_Browser"  , "Col"     )

				W1 := GetProperty(  "Win_Browser"  , "Width"     )

				W2 := GetProperty(  "Win_Browser"  , "Height"     )

				MoveWindow(  GetFormHandle(  'Win_Browser'  ) ,  nc - nHSCrool   , nr , w1  , w2 , .f.    )


				SetProperty(  "Win_Browser"  , "Width"   , w1+nHSCrool  )

				Do Events


			End If 

		End If 


		
		If (nWParam == VK_LEFT)

				
			If  lNoHorzScr
				xDialog( Hb_AnsiToOem("Não Há Scrool Horizontal."))
				Return 			
			End If 


			If (nColScrool > 0)

				nColScrool -= nHSCrool


				nR := GetProperty(  "Win_Browser"  , "Row"     )
				nC := GetProperty(  "Win_Browser"  , "Col"     )

				W1 := GetProperty(  "Win_Browser"  , "Width"     )
				W2 := GetProperty(  "Win_Browser"  , "Height"     )

				MoveWindow(  GetFormHandle(  'Win_Browser'  ) ,  nc + nHSCrool   , nr , w1  , w2 , .f.    )


				SetProperty(  "Win_Browser"  , "Width"   , w1-nHSCrool  )

				Do Events


			
			End If 

		End If 


		If (nWParam == VK_DOWN)

			 //msginfo('ojk2222')

			
			HMG_CleanLastVirtualKeyUp() 

			nItemx1++
			lHitt := .f. 
			


			If nLinhaBarra >= nTamPag 
				lHitB := .t. 			
				//msginfo('ojk2222')
			Else
				nLinhaBarra++				
			End If 

		//	msginfo(Str(nMaxItem1    ))		
					
			If (nItemx1 <= nMaxItem1 )

				If (lHitB)



					nLinhaBarra := nTamPag
					
					xSelItem( nItemx1  , .t.  )		

					if nitemx1 > 80 	
						msginfo('ok1')
					End If 	

					ScrolUp1(.f.)				

					if nitemx1 > 80 	
						msginfo('ok2')
					End If 	
					
							

					sysWait(0.05)			



			
					
				Else
					xSelItem( nItemx1  , .f.  )
				End If 
			Else 
				xDialog('Maximo Atingido!' , .f. )

			End If 

			sysWait(0.05)

		
		
	
		End If 



		If (nWParam == VK_UP)


			If nItemx1 > 1


				nItemx1--
				lHitB := .f.

				If (nLinhaBarra = 1)
					lHitt := .t. 	


				Else
					nLinhaBarra--
					//msginfo(Str(nLinhaBarra))

				End If     

				If (lHitt)
					

					If nItemx1 == 2
						//msginfo('ok')
					End If 


					xSelItem( nItemx1  , .t. , .f.  )
					ScrolUp1(.t.)
				Else
					xSelItem( nItemx1  , .f.  , .f. )
				End If 

			Else 

				//SysWait(.3)
				nItemx1 := 1
				nClearSel := 1
				Bt_ClientAreaInvalidateAll('Win_Browser')
				xDialog('Top Atingido!' , .f. )

			End If 	



		End If 



	End If 


Return 

Function ScrolUp1( lUpDir )

	Local hwnd


	If (lUpDir)

		If (nLinScrool = 0)

		
		Else

			
//			Do Events

			nLinScrool -= nItemBrwHeight

		//	SysWait(.04)

	
			_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , nLinScrool )

			



			//SysWait(.1)

		End If

	Else


		If nItemScrool >= Len(aMt1)


		Else


			//Do Events

			
		//	SysWait(.1)

			nLinScrool += nItemBrwHeight
			hwnd :=  GetFormHandle(  'Win_Browser'  )  

			//SysWait(.1)

		//	SysWait(0.05)
	
			SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , -(nItemBrwHeight) )


			//
			//SysWait(0.05)
			
			//_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , nLinScrool )

				


/*
			SysWait(.1)


			nR := GetProperty(  "Win_Browser"  , "Row"     )
			nC := GetProperty(  "Win_Browser"  , "Col"     )

			W1 := GetProperty(  "Win_Browser"  , "Width"     )
			W2 := GetProperty(  "Win_Browser"  , "Height"     )
			*/

            

		End If


	End If





Return


Function vScrolBox()
	Local nPos := GetProperty( 'Win_Role1' , "VscrollBar" , "Value")


	_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , nPos )

	nLinScrool  := nPos
	nItemScrool := nPos / nItemBrwHeight


	Do Events
	Do Events
	Do Events

//SysWait(.1)



//Local NewPos := GetScrollPos( GetFormHandle( 'Win_Role1' ), 1 )

 /*
	SysWait(.2)
    msginfo(Str( nPos ) + '   ' + Str(NewPos) )
	SysWait(.2)
	*/

Return

function GetTextoTam( cMsg  , cParent )

	Local  FontHandle := _SetFont ( GetControlHandle( 'LblMsg1' , cParent ), FONTBROWSER, 9 , .f. , .f. ,.f. ,.f. )

Return (GetTextWidth(  0,  'L' , FontHandle  )  + 1 )

	//   xPaintBrowser( , aMt1 , nItemx1 ,     nClearSel ,  lHitB , lHitT  )
Function xPaintBrowser( cForm , aMtrOp ,  nOpselx1 , nClear1 )

	Local aRGBcolor := 'BACK1'

	Local nWidthBmp := 170


	Local nHandle1
	Local nHandle2
	Local hWnd
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

	Local hBitmap2


	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)


	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''


	//Local nTypeText    := BT_TEXT_TRANSPARENT +  BT_TEXT_BOLD

	

	Local xFont2 := FONTBROWSER


	//Local hBitSeta := BT_BitmapLoadFile ( 'SETATRANSP')

	Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))

	Local nCol := -(GetProperty( cForm    , "HscrollBar" , "Value"))


	Local nLineSeta := nTamSubMenuConsulta

	Local nLinDrop := 0

	Local lEnabled := .t.

	Local cCor

	Local nCor


	Local nIndice := 0

	nRow := -(nLinScrool)





/*
	DEFAULT nItemDropedDown := 0
	DEFAULT nHeightDroped   := 0
	DEFAULT lSetas          := .f.

	DEFAULT lSubMenu1       := .f.

	DEFAULT lHitB := .f.
	DEFAULT lHitT := .f.

	DEFAULT lPopup := .f. 
	*/



/*
	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	hDC2 := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)
	*/


	
	hDC2 = BT_CreateDC ( cForm  ,  BT_HDC_INVALIDCLIENTAREA , @BTstruct2 )	


	If (nOpselx1 = 0)
		BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , WHITE , WHITE  )
	End If




//6
	If nClear1 > 0

		If (Mod( nClear1, 2 ) = 0)
			nCor := WHITE
		Else
			nCor := CORBROWSE
		End If


		BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemBrwHeight)    , 0  , Width  ,    nHeightBmp     ,  nCor  , nCor   )

	//	SysWait(.1)


	End If

	nIndice := -9999









	//if nRow > 0
	//	msginfo('ok')	
  //  End if 	
  
  // msginfo(Str(nRow))


	For n1 := 1 To Len(aMtrOp)


		cTexto := Hb_Utf8ToStr(aMtrOp[n1][1])
		//msginfo(cTexto)

		cTexto := StrZero(n1,6)



		If (nOpselx1 > 0) .And. (nOpSelx1 = n1)

			nTypeText    := BT_TEXT_ITALIC
			//BT_TEXT_TRANSPARENT


			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight      , SELCOR  , SELCOR   )

			//BT_TEXT_TRANSPARENT

			BT_DrawText ( hDC2 , nLine + nRow  , 17+nCol ,   cTexto , xFont2, 9 ,  WHITE ,  SELCOR   , ;
			BT_TEXT_BOLD  ,	nAlingText, nOrientation )


			If (nSelLine == n1) .And. (nCol == 0)
				BT_DrawBitmap (hDC2  , nLine  + nRow    , 0   , 15  , nItemBrwHeight , BT_STRETCH, hBitOk)
			End If

		Else

			nTypeText    := BT_TEXT_TRANSPARENT

			nTypeText := BT_TEXT_OPAQUE

               
			If (Mod( nLine , 2 ) = 0)
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight     , WHITE  , WHITE   )
				nCorBk := WHITE
			Else
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight     , CORBROWSE  , CORBROWSE   )
				nCorBk := CORBROWSE
			End If
			

			cCor := FONTCOR

			If !aMtrOp[n1][2]
				cCor := CorDisabled
				nTypeText    :=  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT
				//BT_TEXT_TRANSPARENT
			End If

			BT_DrawText ( hDC2 , nLine + nRow  , nCol+17 ,  cTexto , xFont2, 9 ,  cCor , nCorBk , nTypeText, nAlingText, nOrientation )


		End If

		nLine += nItemBrwHeight

		//Do Events 


		/*
		Do Events 
		Do Events 
		Do Events 
		*/


	Next

	//BT_BitMapSaveFile(    hBitmap2 , 'Browser.bmp')


//	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )
	//bt_Bit

Return



static FUNCTION  QtAcento(cString)
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
	//Local ar1   := {}



    *// Menu Principal
	//nItemx1 ,     nClearSel ,



	If (nHWnd == GetProperty(  'Win_Role1' , "HANDLE" ))



		If nMsg == WM_MOUSELEAVE
			//m//sginfo('ok2')

		End If


		If nMsg == WM_MOUSEMOVE

			GetCursorPos( @nCol , @nRow )


			aR1 := GetPos_ScreenToClient(nHWnd, nRow, nCol )

			SetWindowCursor( nHWnd , IDC_ARROW)





			//	msginfo('ok')

			If (ar1[1] <= 63)
				SetWindowCursor( nHWnd , CURSORHAND)
				lOkHint := .t.

				If ar1[1] <= 22
					cTp1 := "Desloca Grid ate Primeiro Registro."
				Else

					If ar1[1] <= 42
						cTp1 := "Retorna uma Pagina para Tras no Grid."
					Else
						cTp1 := "Retorna uma Registro para Tras no Grid."
					End If

				End If




			Else

				If (ar1[1] >=   (GetProperty(  'Win_Role1' , "Height" )  - 60))

					SetWindowCursor( nHWnd , CURSORHAND)

					nR := GetProperty(  'Win_Role1' , "Height" )  - 60
					lOkHint := .t.



					If (ar1[1] >= nr + 43)
						cTp1 := "Desloca Grid ate Ultimo Registro."
					Else

						If (ar1[1] >= (nr + 22)  )
							cTp1 := "Avança uma Pagina para Frente no Grid."
						Else
							cTp1 := "Proximo Registro no grid"
						End If

					End If


				Else
					If  _isWindowDefined("Win_Msg")
						xHidehint()
					End If

				End If


			End If


			If lOkHint
				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow  , nCol - 250   ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow ,  nCol - 250  )
				End If

				xDispUpTam(cTp1 )

				BringTop('xHint')

				SysWait(.1)
			End If


		End If




		If nMsg == WM_LBUTTONDOWN

		End If




	End If


	If (nHWnd == GetProperty(  'Win_Browser' , "HANDLE" ))


		If nMsg == WM_MOUSELEAVE
			nClearSel := 0
			nitemx1   := 0

			BT_ClientAreaInvalidateAll('Win_Browser')

			//msginfo('Leave')

		End If

		If nMsg == WM_VSCROLL

			If LoWord(nWParam) == SB_LINEDOWN

			//	NewPos := GetScrollPos(nHWnd,SB_VERT) + _HMG_SYSDATA [ 345 ]
				//SetScrollPos ( nHWnd , SB_VERT , NewPos , .T. )

			End If 	




		End If 


		If nMsg == WM_MOUSEMOVE



			//SetWindowCursor( nHWnd , CURSORHAND)

			If (nItemx1 > 0) .And. (nWParam != 90 )
				If (nItemx1 = xOpSelPos( 'Win_Browser' ,  0,0,0 ,  nItemBrwHeight )   )
					Return
				End If
			End If


			If (nWParam != 90 )
				nItemx1 = xOpSelPos( 'Win_Browser' ,  0,0,0 ,  nItemBrwHeight )
			End If

			//msginfo('32')


			nRow1 := -(GetProperty( 'Win_Browser' , "VscrollBar" , "Value"))



			If (nItemx1 <= Len(aMt1 ))
				If !aMt1[nItemx1][2]
					SetWindowCursor( nHWnd , IDC_ARROW)
					Return
				End If
			End If

			SetWindowCursor( nHWnd , CURSORHAND)


			If nSelLine > 0
				Return
			End If


			SetWindowCursor( nHWnd , CURSORHAND)

			If nClearSel > 0
				xLimpSub( 'Win_Browser' ,  @nClearSel ,  @nItemx1 , 0 ,   nItemBrwHeight , GetProperty(  'Win_Browser','Width') )
			End If


			If nItemx1 > 0
				nClearSel := nItemx1
			Else
				Return
			End If


			If (nItemx1 > 0)
				BT_ClientAreaInvalidateRect( 'Win_Browser' ,  nRow1  +  ( ( nItemx1 - 1 ) * nItemBrwHeight)  , 0 , GetProperty(  'Win_Browser','Width')  ,  nItemBrwHeight   , .t. )
			End If


		End If



		If nMsg == WM_LBUTTONDOWN

			nItem := xOpSelPos( 'Win_Browser' ,  0,0,0 ,  nItemBrwHeight )


			nRow1 := -(GetProperty( 'Win_Browser' , "VscrollBar" , "Value"))



			If nClearSel > 0
				xLimpSub( 'Win_Browser' ,  @nClearSel ,  @nItemx1 , 0 ,   nItemBrwHeight , GetProperty(  'Win_Browser','Width') )
			End If

			nClearSel := nItemx1


			nItemx1 := 	nItem

			If (nItemx1 > 0)
				BT_ClientAreaInvalidateRect( 'Win_Browser' ,  nRow1  +  ( ( nItemx1 - 1 ) * nItemBrwHeight)  , 0 , GetProperty(  'Win_Browser','Width')  ,  nItemBrwHeight   , .t. )
			End If


			nSelLine := nItem


		End If



	End If


Return


Function xSelItem( nItem1 , lScr1 , lFrente  )


	Local nRow1 := 0
	Local nItem := nItem1

	Default lFrente := .t. 

	If (lFrente)
		If (nItem <= Len(aMt1 ))
			While (nItem <= Len(aMt1 )) .And. (!aMt1[nItem][2]) 
				nItem++		
				nLinhaBarra++

				lHitt := .f. 

				If lScr1
					ScrolUp1(  .f.  )				
				End If 

			Enddo 
		End If
	Else 



		If (nItem > 1)

			While (nItem > 1) .And. (!aMt1[nItem][2]) 


				nItem--
				nLinhaBarra--


				lHitb := .f. 
			

			//	MSGINFO('ok')

				If (lHitt)
				    //msginfo('ok2')
					
					ScrolUp1(  .t. )				
					
				//	msginfo('ok2' + str(nItem ) + '  ' +  str(nLinhaBarra ) )
				End If 

				

			Enddo 

		End If 

	End If 



	If nClearSel > 0
		xLimpSub( 'Win_Browser' ,  @nClearSel ,  @nItemx1 , 0 ,   nItemBrwHeight , GetProperty(  'Win_Browser','Width') , -(nLinScrool) )
	End If

	nItemx1 := nItem


	If nItemx1 > 0
		nClearSel := nItemx1
	Else
		Return
	End If
	
	//nRow1 := -(GetProperty( 'Win_Browser' , "VscrollBar" , "Value"))

	nRow1 := -(nLinScrool)

	
	nSelLine := nItemx1



	If (nItemx1 > 0)		
		BT_ClientAreaInvalidateRect( 'Win_Browser' ,  nRow1  +  ( ( nItemx1 - 1 ) * nItemBrwHeight)  , 0 , GetProperty(  'Win_Browser','Width')  ,  nItemBrwHeight   , .t. )	
	End If



Return


Function xPaintScroll( cJanela )



	//hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	//hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)

	Local BTstruct2


	Local hDC


	Local yBmp1 := BT_BitMapLoadFile('SCRUP1')
	Local yBmp2 := BT_BitMapLoadFile('SCRUP2')
	Local yBmp3 := BT_BitMapLoadFile('SCRUP3')



	Local zBmp1 := BT_BitMapLoadFile('SCRDOWN1')
	Local zBmp2 := BT_BitMapLoadFile('SCRDOWN2')
	Local zBmp3 := BT_BitMapLoadFile('SCRDOWN3')



	LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)

	Local nRow1 := Height - 20

	hDC = BT_CreateDC ( cJanela  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )



	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    , {209,209,209} ,   {249,249,249})


	BT_DrawBitmap (hDC  , nRow1       , 0  , 20  , 20  ,      BT_STRETCH,  zBmp3)
	BT_DrawBitmap (hDC  , nRow1 - 22  , 0   , 20  , 20 , BT_STRETCH,  zBmp2)
	BT_DrawBitmap (hDC  , nRow1 - 43  , 0   , 20  , 20 , BT_STRETCH,  zBmp1)




	BT_DrawBitmap (hDC  , 0  , 0  	, 20  , 20  ,      BT_STRETCH,  yBmp3)
	BT_DrawBitmap (hDC  , 22  , 0   , 20  , 20 , BT_STRETCH,  yBmp2)
	BT_DrawBitmap (hDC  , 43  , 0   , 20  , 20 , BT_STRETCH,  yBmp1)


	BT_DeleteDC (BTstruct2 )



Return




