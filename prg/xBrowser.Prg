
#include <hmg.ch>
#include <minigui.ch>


#require "hbxpp"

#include <hmg.ch>
#include <dll.ch>


#define XQUEBRA Chr(13)+Chr(10)


Static aOpx1 := {}
Static nItemx1 := 0
 
Static lHitB := .f. 
Static lHitT := .t. 


Function TestBrow( cParent1 )



	Local cSqlx1 := ''
	Local n1 := 1
	Local aCampos
	//Local aCabec  := GetCamposDic( cTabela, 'S' , .f. , .t. )

	LOCAL aCabec

	Local aTams

	Local aTips
	LOCAL nQReg

	Local qReg1   := 200
	Local calias  := "TMP"
	local cTab1
	local aCabex:={}
    Local cTabela := 'clientes'





	Local nIndx1 := 0

//	Local oServer
	Local oQuery

	LOCAL lBold      := .F.
	LOCAL lItalic    := .F.
	LOCAL lUnderline := .F.
	LOCAL lStrikeOut := .F.

	Local aDynfont   := {}

	Local nColy

	// Local aTams := {}

	Local am1 := {}


	Local cGridname := 'Br_grid'

	Local bGrid1 := {}
	Local bGrid2 := {}

	Local nW1

	Local aItens := {}

	Local oServer

	Local cLabelx := 'Lblx01'


	aMtrHeader := {}



	SetWindowCursor( GetFormHandle(  cActiveJan ) , HOURGLASS )

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

    cSq2 += " order by codigo desc limit 6000 "


	If (Select(calias) > 0)
		dbSelectArea( cAlias )
		Use
	End If

	cSqlx2 := cSqlx1 

	SaveLog("st121.txt" , cSq2 + XQUEBRA )

  //  msginfo( cSq2 )

    


	aItens := {}


	nF1 := {|| ARRAY FONT "Arial"   SIZE 9 }
	nF1 := {|| ARRAY FONT "Arial"   SIZE 9 BOLD}

	SET CODEPAGE TO PORTUGUESE
	REQUEST HB_LANG_PT
	REQUEST HB_CODEPAGE_PT850

	HB_SETCODEPAGE("UTF8")

	//HB_SetCodePage("PT850")

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

		For nx1 := 1 To Len(oRow[1])

			cValor := Hb_AnsiToOem( oRow:FieldGet(nx1)  )


			If Alltrim(aTips[nx1]) == 'C'
				cValor := Hb_Utf8TOStr( Alltrim(oRow:FieldGet(nx1)) )
			End If

			//msginfo( fieldName(nx1) )


			lNum := .f.

			If Alltrim(aTips[nx1]) == 'B'
				cValor := PadL(alltrim(Transform( oRow:FieldGet(nx1) , "@E 999,999,999.99" )),14)
				lNum := .t.
			End If

			If ( Alltrim(aTips[nx1]) == 'I')

				If (nX1 > 1)
					cValor := Padl(alltrim( Str( oRow:FieldGet(nx1) )),25)
					lNum := .t.
				Else
					cValor := Alltrim( Str( oRow:FieldGet(nx1) ) )
				End If

			End If


			If (lNum)
				Aadd(aDynFont , {|| ARRAY FONT "Courier"   SIZE 12 ITALIC UNDERLINE } )
			Else

				If (FieldName(nx1)  = 'Codigo') .or. (FieldName(nx1)  = 'Status')
					Aadd(aDynFont , {|| ARRAY FONT "Arial"  SIZE 8 BOLD } )
				Else
					Aadd(aDynFont , {|| ARRAY FONT "Arial"   SIZE 8 } )
				End If

			End If

			Aadd(aM1 , cValor )


		Next

		Aadd(aItens , aM1 )

		//Dbskip()

	Next


    //msginfo( Str(   Len(aItens)     )   )


	oServer:Destroy()
	oServer := Nil



	oQuery:Destroy()
	oQuery := Nil



//    xBrowser( aItens , cParent1 )


    //xBrowser( aDatas1 , cParent )
	//msginfo(' l232 ')





Return aItens 



Function xBrowser( aDatas1 , cParent )


    Private aMt1 := Aclone(aDatas1)
  
	DEFINE WINDOW Win_Browser ;
		AT 45,15 ;
        PARENT &cParent ;
		WIDTH 850 HEIGHT 547 ;
		TITLE 'xBrowser' + Left(cParent,4)  ;		
		PANEL NOSIZE NOSYSMENU NOCAPTION BACKCOLOR RED VIRTUAL HEIGHT Len(aDatas1) * nItemSubHeight 
		//ON PAINT xPaintBrowser( ThisWindow.Name , aMt1 ,  nOpselx1 , nClear1 , lHitB , lHitT  )
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


    Win_Browser.Show()




Return 



function GetTextoTam( cMsg  )

	Local  FontHandle := _SetFont (GetControlHandle( 'Label_1' , 'Win_Browser' ), XFONT1, 9 , .f. , .f. ,.f. ,.f. )

Return (GetTextWidth(  0,  'L' , FontHandle  )  + 1 )


Function xPaintBrowser( cForm , aMtrOp , aMtrTam ,  nOpselx1 , nClear1 , lHitB , lHitT  )

	Local aRGBcolor := BACK1

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


	Local nHeightBmp := nItemSubHeight * Len(aMtrOp)

	Local hBitmap2


	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)


	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''

	Local hBitOk := BT_BitmapLoadFile ('OKMARK')

	
	Local hBitSeta := BT_BitmapLoadFile ( 'SETATRANSP')

	Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))


	Local nLineSeta := nTamSubMenuConsulta

	Local nLinDrop := 0

	Local lEnabled := .t.

	Local cCor




	DEFAULT nItemDropedDown := 0
	DEFAULT nHeightDroped   := 0
	DEFAULT lSetas          := .f.

	DEFAULT lSubMenu1       := .f.

	DEFAULT lHitB := .f.
	DEFAULT lHitT := .f.

	DEFAULT lPopup := .f. 



	hBitMap2 := BT_BitmapCreateNew (nWidthBmp , nHeightBmp , BLACK)

	hDC := BT_CreateDC (hBitmap2, BT_HDC_BITMAP  , @BTstruct)


	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	If (nOpselx1 = 0)

		If !lSubMenu1
			BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , WHITE , WHITE  )
		Else
			BT_DrawGradientFillVertical ( hDC2 ,   0 , 0  , Width ,    Height    , aCorSub1 , aCorSub1  )
		End If

	End If

	If nClear1 > 0

		If !lSubMenu1
			BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemSubHeight)    , 0  , nColTamMenu ,    nHeightBmp    ,  WHITE  , WHITE  )
		Else
			BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemSubHeight)    , 0  , nColTamMenu ,    nHeightBmp    ,  aCorSub1  , aCorSub1  )
		End If



	End If


	For n1 := 1 To Len(aMtrOp)

		cTexto := alltrim(  Right( aMtrOp[n1][1]  , Len(  aMtrOp[n1][1] ) - 2  ) )

		lEnabled := aMtrOp[n1][3]

		lSeta1   := .f.


		If Len(aMtrOp[n1]) >= 5
			lSeta1   := aMtrOp[n1][5]
		End If 	

		If ((nOpselx1 > 0) .And. (nOpSelx1 = n1) .And. aMtrOp[n1][3] ) .or. (   (lEnabled ) .And. (nOpselx1 > 0) .And. ( Alltrim(cTextSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT

			If !lSubMenu1
				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , nColTamMenu ,    nItemSubHeight      , WHITE  , BACK1  )

				BT_DrawText ( hDC2 , nLine + nRow  , 25 ,  hb_ANSIToOEM( cTexto ), XFONT1, 9,  FONTCOR ,  {132,134,200}   , ;
					Iif( Alltrim(cTextSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ;
					nAlingText, nOrientation )


				BT_DrawBitmap (hDC2  , nLine  + nRow    , 1   , 20  , 20 , BT_STRETCH, hBitOk)

			Else

				BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , nColTamMenu ,    nItemSubHeight      , WHITE  , aCorSub1  )
				

				BT_DrawText ( hDC2 , nLine + nRow  , 35 ,  Hb_AnsiToOem( cTexto ), XFONT1, 9,  FONTCOR ,  aCorSub1  , ;
					Iif( Alltrim(cTextSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ;
					nAlingText, nOrientation )


			
			End If


		Else

			nTypeText    := BT_TEXT_TRANSPARENT

			cCor := FONTCOR

			If !aMtrOp[n1][3]

				cCor := CorDisabled

				If lSubMenu1
					cCor := CorDisabled2
				End If

			End If

		
			BT_DrawText ( hDC2 , nLine + nRow  , 25 ,  Hb_AnsiToOem( cTexto ), XFONT1, 9,  cCor , WHITE , nTypeText, nAlingText, nOrientation )
		
		End If



		nLine += (nItemSubHeight)
	

	Next


	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )
	//bt_Bit


REturn
