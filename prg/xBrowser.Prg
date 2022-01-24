
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





Static aOpx1 := 0
Static nItemx1 := 0

Static lHitB := .f.
Static lHitT := .t.



Static lTermino := .f.
Static aThread2 := Nil
Static aMResult := {}

Static nLArgura := 0

Static cAndamento := ''

Static nTamPag := 35


Static nItemBrwHeight := 0

Static aMt1 := {}

Static nClearSel := 0 
Static cOpMainSel  := ''

Static nSelLine := 0

Static lColor1 := .f. 

Static aMtrColor := {}

Static nLinScrool := 0

Static nItemScrool := 0


//DECLARE WINDOW Win_Browser


Function xRodaImp()


	While !lTermino
		  Do Events
	Enddo



	hb_threadDetach( aThread2 )   // close thread handle
	hb_threadQuitRequest( aThread2 )


Return aMResult



Function xRetLargura()

REturn nLargura



Function DoMatriz( cParentx , cTabela )

	aThread2 := hb_threadStart( HB_THREAD_INHERIT_PUBLIC, @TestBrow(),  cParentx , cTabela  )

REturn



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

	Local nTam1 := GetTextoTam( ''  , cParent1 ) - 1

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

	cSq2 += " order by codigo desc limit 1000"





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



		c1 := ''

		Aeval(aM1 , { |a|  c1 += ( a[1] + ' '  )     })

		If (nTamLargura == 0)

			Aeval(aM1 , { |a|    nTamLargura += (a[2]+1)   })

			nLargura := nTamLargura
			//  msginfo( ' e1 ' + Str(nLargura) )

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

	nItemBrwHeight := nItemSubHeight - 5

	nItemScrool := 0
	
	nLinScrool := nItemBrwHeight * nTamPag



	DEFINE WINDOW Win_Browser ;
		AT 145,10 ;
		CHILD ;
		WIDTH nLarg1 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH nLarg1 + 1  ;
		TITLE 'xBrowser' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE ;  
		ON PAINT xPaintBrowser( ThisWindow.Name , aMt1 , nItemx1 ,     nClearSel ,  lHitB , lHitT  )
	END WINDOW	




	DEFINE LABEL Labelx1
		PARENT Win_Browser
		ROW    95
		COL    20
		WIDTH  120
		HEIGHT 24
		VALUE Hb_AnsiToOem("Aviso Informação")
		FONTNAME XFONT1
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



	_ShowWindow("Win_Browser")


	SHOWSCROLLBAR (GetFormHandle("Win_Browser") , 0, .f.)
	SHOWSCROLLBAR (GetFormHandle("Win_Browser") , 1, .f.)



	BT_ClientAreaInvalidateAll('Win_Browser')

	

	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBrowser"  ) )  ) = 0
		InstallEventHandler( "EventBrowser" )
	End If



	//1 - Veritcal 

	msginfo( Str(Len(aMt1) * nItemBrwHeight) + '    ' + Str(Len(aMt1))    )   
	
	SetScrollRange ( GetFormHandle('Win_Role1') , 1 , 0 , Len(aMt1) * nItemBrwHeight ,   .T. )

	
	_HMG_PRINTER_SETVSCROLLVALUE(   GetFormHandle('Win_Role1') , 0 )	

	//SetScrollRange ( GetFormHandle('Win_Role1') , HORZ , 0 , 100 , .T. )
	

	
	_ShowWindow("Win_Role1")

	//SysWait(.1)

	




	//msginfo('ok')


//	SysWait(.1)


Return


Function ScrolUp1( lUpDir )


	If (lUpDir)

		If (nLinScrool = 0)

			SysWait(.2)
			msginfo('minimo Atingido')
			SysWait(.2)

		Else 

			nLinScrool -= nItemBrwHeight

			nItemScrool--

			_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , nLinScrool )

		End If 

	Else 

		If nItemScrool >= Len(aMt1) 

			SysWait(.2)
			msginfo('maximo Atingido')
			SysWait(.2)

		Else 


			nLinScrool += nItemBrwHeight

			nItemScrool += 1

			_HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , nLinScrool )

		End If 	


	End If 	
	 
	



Return 


Function vScrolBox()
  Local nPos := GetProperty( 'Win_Role1' , "VscrollBar" , "Value")

  
   _HMG_PRINTER_SETVSCROLLVALUE( GetFormHandle(  'Win_Browser'  )  , nPos )

   nLinScrool  := nPos 
   nItemScrool := nPos / nItemBrwHeight


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
Function xPaintBrowser( cForm , aMtrOp ,  nOpselx1 , nClear1 , lHitB , lHitT  )

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

	Local hBitOk := BT_BitmapLoadFile ('OKMARK')

	Local xFont2 := FONTBROWSER


	Local hBitSeta := BT_BitmapLoadFile ( 'SETATRANSP')

	Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))


	Local nLineSeta := nTamSubMenuConsulta

	Local nLinDrop := 0

	Local lEnabled := .t.

	Local cCor

	Local nCor


	Local nIndice := 0




/*
	DEFAULT nItemDropedDown := 0
	DEFAULT nHeightDroped   := 0
	DEFAULT lSetas          := .f.

	DEFAULT lSubMenu1       := .f.

	DEFAULT lHitB := .f.
	DEFAULT lHitT := .f.

	DEFAULT lPopup := .f. 
	*/




	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)


	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


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


		If (nOpselx1 > 0) .And. (nOpSelx1 = n1)
		
			nTypeText    := BT_TEXT_TRANSPARENT


			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight     , SELCOR  , SELCOR   )

		//	BT_DrawText ( hDC2 , nLine + nRow  , 15 ,   cTexto , xFont2, 9 ,  FONTCOR ,  {132,134,200}   , ;
		//		 BT_TEXT_BOLD+BT_TEXT_TRANSPARENT   ,	nAlingText, nOrientation )

			BT_DrawText ( hDC2 , nLine + nRow  , 15 ,   cTexto , xFont2, 9 ,  WHITE ,  SELCOR   , ;
				 BT_TEXT_BOLD+BT_TEXT_TRANSPARENT   ,	nAlingText, nOrientation )

			If (nSelLine == n1)
				BT_DrawBitmap (hDC2  , nLine  + nRow    , 0   , 15  , nItemBrwHeight , BT_STRETCH, hBitOk)
			End If 	

		Else

			nTypeText    := BT_TEXT_TRANSPARENT


			If (Mod( nLine , 2 ) = 0)
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight     , WHITE  , WHITE   )
			Else 
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , Width ,    nItemBrwHeight     , CORBROWSE  , CORBROWSE   )
			End If 

			cCor := FONTCOR		

			If !aMtrOp[n1][2]
				cCor := CorDisabled
				nTypeText    := BT_TEXT_TRANSPARENT + BT_TEXT_BOLD
			End If			

			BT_DrawText ( hDC2 , nLine + nRow  , 15 ,  cTexto , xFont2, 9 ,  cCor , WHITE , nTypeText, nAlingText, nOrientation )


		End If

		nLine += nItemBrwHeight 

	Next


	BT_DeleteDC (BTstruct )
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



    *// Menu Principal
	//nItemx1 ,     nClearSel ,


	If (nHWnd == GetProperty(  'Win_Browser' , "HANDLE" )) 


		If nMsg == WM_MOUSELEAVE
			nClearSel := 0
			nitemx1   := 0

			BT_ClientAreaInvalidateAll('Win_Browser')

			//msginfo('Leave')
		
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




