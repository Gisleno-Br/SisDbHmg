
#include <hmg.ch>
#include <minigui.ch>


#require "hbxpp"

#include <hmg.ch>
#include <dll.ch>

#include "hbthread.ch"


#define XQUEBRA Chr(13)+Chr(10)

#DEFINE FONTBROWSER 'Lucida Sans Typewriter'
//'Lucida Sans Typewriter'





#define FONTCOR {0,106,133}






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


			If Alltrim(aTips[nx1]) == 'C'
				cValor := oRow:FieldGet(nx1)
				//	msginfo( cValor )
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




			If (Alltrim(cValor) = 'Inativo')
				lAtivo := .f.
			End If


			//nTam1 := 1

			//Aadd(aM1 , { Padr(cValor , Int( (aTams[nx1]+3) * 1.03)  )   ,  Int( (aTams[nx1]+3) * 1.03)           }  )

			nQAcento := QtAcento(cValor)

			nTam := If( (nQAcento =  0)   , aTams[nx1] ,  aTams[nx1] + nQAcento ) 


			Aadd(aM1 , { Padr( (cValor) ,nTam )  ,  nTam          }  )

			Do Events

		Next




		c1 := ''

		Aeval(aM1 , { |a|  c1 += ( a[1] + ' '  )     })

		If (nTamLargura == 0)

			Aeval(aM1 , { |a|    nTamLargura += a[2]   })

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


	aMt1 := Aclone(aDatas1)
	nItemBrwHeight := nItemSubHeight - 5

	//lSetasDown := .f. 




	//	PARENT &cParent ;
//		PANEL ;


	DEFINE WINDOW Win_Browser ;
		AT 145,15 ;
		CHILD ;
		WIDTH 1650 HEIGHT (nTamPag * nItemBrwHeight) VIRTUAL HEIGHT (Len(aMt1) * nItemBrwHeight) VIRTUAL WIDTH nTamWidth+1000 ;
		TITLE 'xBrowser' + Left(cParent,4)  	;
		NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLUE ;  
		ON PAINT xPaintBrowser( ThisWindow.Name , aMt1 ,  aOpx1  , nItemx1 , lHitB , lHitT  )
	END WINDOW

//xPaintBrowser( cForm , aMtrOp , aMtrTam ,  nOpselx1 , nClear1 , lHitB , lHitT  )


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



	_ShowWindow("Win_Browser")


	BT_ClientAreaInvalidateAll('Win_Browser')

	
	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBrowser"  ) )  ) = 0
		InstallEventHandler( "EventBrowser" )
		//nIndexEventY := EventCreate (  { ||   xTeclasMenu( )   }  )
	End If





	//msginfo('ok')


//	SysWait(.1)


Return







function GetTextoTam( cMsg  , cParent )

	Local  FontHandle := _SetFont ( GetControlHandle( 'LblMsg1' , cParent ), FONTBROWSER, 9 , .f. , .f. ,.f. ,.f. )

Return (GetTextWidth(  0,  'L' , FontHandle  )  + 1 )


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


	Local nHeightBmp := nItemSubHeight * Len(aMtrOp)

	Local hBitmap2


	LOCAL Width  := BT_ClientAreaWidth  (cForm)
	LOCAL Height := BT_ClientAreaHeight (cForm)


	Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
	Local cTexto := ''

	Local hBitOk := BT_BitmapLoadFile ('OKMARK')

	Local xFont2 := FONTBROWSER


	Local hBitSeta := BT_BitmapLoadFile ( 'SETATRANSP')

	Local nRow := -(GetProperty( cForm    , "VscrollBar" , "Value"))


	Local nLineSeta := nTamSubMenuConsulta

	Local nLinDrop := 0

	Local lEnabled := .t.

	Local cCor



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
		BT_DrawGradientFillVertical ( hDC2 ,   (nClear1  * nItemSubHeight)    , 0  , nColTamMenu ,    nHeightBmp    ,  WHITE  , WHITE  )

	End If





	For n1 := 1 To Len(aMtrOp)

		//cTexto := Hb_UTF8TOSTR(alltrim(  Right( aMtrOp[n1][1]  , Len(  aMtrOp[n1][1] ) - 2  ) ))

		//cTexto := NoAcento(   Upper(aMtrOp[n1][1])   ) 

		cTexto := Hb_Utf8ToStr(aMtrOp[n1][1])

		lSeta1   := .f.



		If (nOpselx1 > 0) .And. (nOpSelx1 = n1)
			//.And. aMtrOp[n1][3] ) .or. (   (lEnabled ) .And. (nOpselx1 > 0) .And. ( Alltrim(cTextSel) = Alltrim(cTexto) )  )

			nTypeText    := BT_TEXT_TRANSPARENT


			BT_DrawGradientFillVertical ( hDC2 ,  nLine + nRow    , 00  , nColTamMenu ,    nItemSubHeight      , WHITE  , BACK1  )

			BT_DrawText ( hDC2 , nLine + nRow  , 25 ,   cTexto , xFont2, 8 ,  FONTCOR ,  {132,134,200}   , ;
				Iif( Alltrim(cTextSel) = Alltrim(cTexto)  ,  BT_TEXT_BOLD+BT_TEXT_TRANSPARENT ,  BT_TEXT_TRANSPARENT)   , ;
				nAlingText, nOrientation )


			BT_DrawBitmap (hDC2  , nLine  + nRow    , 1   , 20  , 20 , BT_STRETCH, hBitOk)





		Else

			nTypeText    := BT_TEXT_TRANSPARENT

			cCor := FONTCOR


			/*

			If !aMtrOp[n1][3]

				cCor := CorDisabled

				If lSubMenu1
					cCor := CorDisabled2
				End If

			End If

			*/


			BT_DrawText ( hDC2 , nLine + nRow  , 15 ,  cTexto , xFont2, 9 ,  cCor , WHITE , nTypeText, nAlingText, nOrientation )





		End If



		nLine += nItemBrwHeight 



	Next


	BT_DeleteDC (BTstruct )
	BT_DeleteDC (BTstruct2 )
	//bt_Bit


REturn



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


	If (nHWnd == GetProperty(  'Win_Browser' , "HANDLE" )) 


		If nMsg == WM_MOUSEMOVE	
		//	msginfo('ok')


		End If 	


		If nMsg == WM_LBUTTONDOWN
			//msginfo('ok')
			nItem := xOpSelPos( 'Win_Browser' ,  0,0,0 ,  nItemBrwHeight )

			msginfo(Str( nItem ) + '   ' + aMt1[nItem][1] )
		End If 	
		


	End If 	


Return  	




