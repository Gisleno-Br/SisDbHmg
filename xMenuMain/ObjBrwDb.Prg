#include <hmg.ch>
#require "rddsql"
#require "sddmy"
#require "hbxpp"
#include "inkey.ch"
#include "hbthread.ch"
#include <minigui.ch>
#include <hbdyn.ch>
#include "hbclass.ch"

#DEFINE XQUEBRA CHR(13) + CHR(10)



REQUEST HB_LANG_PT
REQUEST HB_CODEPAGE_PT850
REQUEST SDDMY, SQLMIX


ANNOUNCE RDDSYS



#include "dbinfo.ch"
#include "error.ch"




CREATE CLASS tBrowseDb


	Var  cLblName  
  Var  aMatriz
  Var  cBrwName
  Var  lHasFocus   
  Var  aMtr_Bitmap                 //Bitmaps,Pngs to be used in the Column.
  Var  cSql       
  Var  cAlias        
  Var  nResto 
  Var  lEof			        PROTECTED //Header Color 	
  Var  lBof			        PROTECTED //Header Color 	
	Var  aCorSub2         PROTECTED //Not Used 	
	Var  aHeadSel1        PROTECTED //Header Color 	
	Var  aHeadSel2        PROTECTED //Header Color2	
	Var  aCorZebra        PROTECTED // Zebra Color	
	Var  nColSav1         PROTECTED
	Var  nRowSav1         PROTECTED
	Var  nSec2            PROTECTED	
	Var  lAscendent       PROTECTED	
	Var  nLinIniBarV      PROTECTED	
	Var  nTamVert         PROTECTED	
	Var  aCorSub1         PROTECTED	
	Var  nItMax           PROTECTED //Max Item number in a Page.	
	Var  nLinha1          PROTECTED		
	Var  aBmp             PROTECTED		
	Var  aCorZebra2 			PROTECTED		
	Var  nPagNum1         PROTECTED	
	Var  xPagNumH         PROTECTED	
	Var  hBit201          PROTECTED	
	Var  aCorSub3         PROTECTED //BackColor	
	Var  lBrwEnabled      
	Var  lHighCol1        PROTECTED	
	Var  nLineTamV        PROTECTED	
	Var  nTopRec          PROTECTED	  	
	Var  nScrollPos       PROTECTED	
	Var  lEnabled2        PROTECTED	
	Var  nHeightBrw       PROTECTED	
	Var  nLinBrw1         PROTECTED
	Var  nColBrw1         PROTECTED	
	Var  nFirstItem       PROTECTED
	Var  nLastItem        PROTECTED	
	Var  nColumnSel       //PROTECTED	
	Var  nColleft         PROTECTED	
	Var  nOptArrow        PROTECTED	
	Var  nBarraIncr       PROTECTED	
	Var  nLinhaAnt        PROTECTED	
	Var  nColBarIni       PROTECTED
	Var  isGridVisible    PROTECTED
	Var  nColBarraH       PROTECTED	
	Var  l_EofBh          PROTECTED
	Var  l_BofBh          PROTECTED	
	Var  nColorBkHeader   PROTECTED
	Var  nColorBkHSel     PROTECTED
	Var  lBarraHFocus     PROTECTED	
	Var  lBarraVFocus     PROTECTED	
	Var  lBarraHMouse     PROTECTED	
	Var  lBarraVMouse     PROTECTED
	Var  nOutlineColor    PROTECTED
	Var  lCursorSize      PROTECTED
	Var  yColorFont       PROTECTED
	Var  yColorFontHead   PROTECTED
	Var  CorDisabled      PROTECTED
	Var  xFont2           PROTECTED
	Var  nMainSel         
	Var  nAntSel          PROTECTED
	Var  lSizeMode        PROTECTED
	Var  nLinMouseAnt     PROTECTED	
	Var  lDragMode1       PROTECTED	
	Var  yRowIni          PROTECTED
	Var  aMenuBarCor      PROTECTED	
	Var  nItemSubHeight   PROTECTED  //It must be a even number.
	Var  nQUltPag         PROTECTED	
	Var  nRegOut1         PROTECTED	
	Var  nWidthBrw        PROTECTED
	Var  nColVBrw         PROTECTED
	Var  l_EofV           PROTECTED
	Var  l_BofV           PROTECTED
	Var  nScroolCol       PROTECTED
	Var  nPosY            PROTECTED   ////:= nLinI
	Var  nLastCol         PROTECTED
	Var  l_Eofh           PROTECTED
	Var  nColBrwIni       PROTECTED
	Var  nLin1            PROTECTED
	Var  nCol1            PROTECTED
	Var  nSetaSel1        
	Var  nSetaSel2        
	Var  cFormObj		  
	Var  cKeyCtrl
	Var  n_RowX           PROTECTED
	Var  n_ColY           PROTECTED
	Var  nOrdemCol        PROTECTED
	Var  nBottomLine1     PROTECTED
	Var  aMapsCols        PROTECTED
	Var  nHeightMen       PROTECTED
	Var  nScrollPosV      PROTECTED
	Var  nScrollPosH      PROTECTED
	Var  nPagRec          //PROTECTED
	Var  nPagRec2         //PROTECTED
	Var  nPageNum         //PROTECTED
	Var  nScrollMouse     PROTECTED	
	Var  aMtrCab          //PROTECTED
	Var  aTamanhos        PROTECTED
	Var  aTipos           PROTECTED
	Var  aDados           PROTECTED
	Var  aCabec           PROTECTED
	Var  hBolaAzul        PROTECTED
	Var  hBola2	          PROTECTED
	Var  hBOk		          PROTECTED
	Var  hB_uP_1D	        PROTECTED
	Var  hB_uP_2D	        PROTECTED
	Var  hB_uP_3D	        PROTECTED
	Var  hB_uP_1	        PROTECTED
	Var  hB_uP_2	        PROTECTED
	Var  hB_uP_3	        PROTECTED
	Var  hB_uP_1_1	      PROTECTED
	Var  hB_uP_2_1	      PROTECTED
	Var  hB_uP_3_1	      PROTECTED	
	Var  hB_Dwn_1D	      PROTECTED
	Var  hB_Dwn_2D	      PROTECTED	
	Var  hB_Dwn_3D	      PROTECTED
	Var  hB_Dwn_1	        PROTECTED
	Var  hB_Dwn_2	        PROTECTED
	Var  hB_Dwn_3	        PROTECTED	
	Var  hB_Dwn_1_1	      PROTECTED	
	Var  hB_Dwn_2_1	      PROTECTED	
	Var  hB_Dwn_3_1	      PROTECTED	
	Var  hB_CimaSeta      PROTECTED		
	Var  hB_CimaSeta2     PROTECTED	
	Var  hB_CimaBaixo     PROTECTED	
	Var  hB_CimaBaixo2    PROTECTED
	Var  hB_BaixoSeta     PROTECTED
	Var  hB_Esquerda	    PROTECTED	
	Var  hB_Direita  	    PROTECTED
	Var  hB_Esquerda1	    PROTECTED
	Var  hB_Direita1 	    PROTECTED
	Var  hB_Esquerdad	    PROTECTED
	Var  hB_Direitad 	    PROTECTED
	Var  nTotWidth3       PROTECTED
	Var  nTotWidth1       PROTECTED
	Var  cParentWin      
	Var  cBrwMtr          
	Var  yColorFontHeader PROTECTED
	Var  nTotWidth2       PROTECTED
	Var  hbExclam         PROTECTED
	
	Var  aMtr_Img         PROTECTED
	Var  nAtuLine          PROTECTED
	
	
	METHOD yDcToDc( cOrig , cDestJan ,nRow1,nCol1) 
	METHOD xTroquePos(nColSele , nColTarget , cCabec1 ) 
	METHOD xTrfMtr( lOrdena  , nNumber1 ) 
	METHOD xTamBarH(nqCols) 
	METHOD xSelCol( nColuna1 , lFrente , lNavigate , lHighLate )
	METHOD xSearchLim( nColuna1 ) 
	METHOD xScrolCol( lFrente , lUpdBar ) 
	METHOD xRefresh(  cName , n1 , n2 , lUpdHeader , lSelected ) 	
	METHOD xQtScrCol() 
	METHOD xProcVBar(nLinZ1)
	METHOD xProcHbar(  nLine1 , nCol11 , l_selected ) 
	METHOD xProcCol( nColuna1 , lHighLight ) 
	METHOD xOrdene( nColuna )
	METHOD xOrdemCol(nColuna1)
	METHOD CalcNPage()
	METHOD xMoveHBar(nColini) 
	METHOD xMapCols()		
	METHOD xKeySubMen(nHWnd1 , nMsg  )	
	METHOD xDrawSize( nCol_Origem ,  nColOrig1 , nSize1 )
	METHOD xDrawCol( nCol_Origem ,  nColOrig1 , nSize1 ) 
	METHOD xDrawBloq( lDeleted ) 
	METHOD xDrawBarV( cForm1 , nColXy , lSelected , lUpdateBar ) 
	METHOD xDrawBarH( cForm1 , nColXy , lSelected , lUpdateBar )
	METHOD xCheckCol(nColuna , lFrente) 
	METHOD xFillMtr( nReg1 , nReg2 ) 
	METHOD xCalcVBar(lFrente)
	METHOD MoveVBar( nPar1 )
	METHOD GetItem( nLinha ) 
	METHOD MoveHBar(lFrente)
	METHOD xCalcRec() 
	METHOD DrawDCtoDC (hDC1, Row1, Col1, Width1, Height1, Mode_Stretch, hDC2, Row2, Col2, Width2, Height2) 
	METHOD DoScroll(lDown)	
	METHOD GetCoord() 
	METHOD DefBrowser(x,y,nWidth1,nHeight1 , cBrwName1 , aMtr1 ) 			
	CLASSVAR aObjects AS ARRAY INIT {}
	METHOD initClass()
	METHOD AddMtrz(  nQt2 ) 
	
	
	EXPORT:
	
		METHOD yGoUp() 
		METHOD yGoDown() 
		METHOD xGoFirst()
		METHOD xGoLastPag()
		METHOD xGoPage(nPage , lFrente , lUpdHeader ,lUpdateBarV )  
		METHOD SetBrwEnabled( lEnabled1 )
		METHOD HandleMouse(nHWnd , nMsg) 
		METHOD xAtuBrw()
		METHOD xRetObj( nIndice1  )
		METHOD yObjCount()
		METHOD xLimpSet1()
		METHOD xUpdate()
		METHOD UpdateColSel( lFrente )
		METHOD xOpenDb() 
		METHOD xCheckRec( nRec ) 		
		METHOD ClearFocus()
		METHOD New( cJanela1 , nLinha , nColuna , cBrwName1 ,  cSql1 , aCabec1 , aSizes , nWidthBrwZ , nHeightY , 	l_Enabled  , aTips ) 
		METHOD SetImg(aMatr)		
		METHOD xInit()	
		
	PROTECTED:	
	

END CLASS


METHOD SetImg(aMatr) CLASS tBrowseDb
	::aMtr_Img := Aclone(aMatr)
RETURN Self

METHOD xUpdate() CLASS tBrowseDb
	::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )					
	::xAtuBrw()
	DoEvents()
RETURN self



METHOD initClass() CLASS tBrowseDb
	::aObjects := {}
RETURN self



METHOD yObjCount() CLASS tBrowseDb
Return Len(::aObjects)



METHOD xRetObj( nIndice1  ) CLASS tBrowseDb
RETURN ::aObjects[nIndice1]



METHOD ClearFocus() CLASS tBrowseDb

	::nSetaSel1 := 0
	::nOptArrow := 0
	::nSetaSel2 := 0
	::nSetaSel1 := 0
	::xDrawBarH( ::cBrwMtr , ::nColBarraH , .f. ) //- 45 )  			
	::xDrawBarV( ::cBrwMtr ,  ::nPosy )						
	::xAtuBrw()      				
	DoEvents()

Return Self



METHOD xTrfMtr( lOrdena  , nNumber1 ) CLASS tBrowseDb

    Local aM1 := {}
    Local cConteudo 
    Local Valor 
    Local n1
    Local nIdx1 := 0
    
  	aM1 := {}	
  	
  	DEFAULT lOrdena := .f. 
  	DEFAULT nNumber1 := 0 
  	
  	Aadd(aM1 , Recno() + nNumber1 )
				
		For n1 := 1 to FCount()	
		     Conteudo := &(FieldName(n1))
		     
		     Valor := &(FieldName(n1))					     		     
		     
		     If Alltrim(::aTipos[n1]) = 'B'				     				     	  
		     		Conteudo := Padl(Alltrim(Transform( Valor , '@E 999,999,999.99')),19)		     	
		     Else 						     
		     		If Alltrim(::aTipos[n1]) = 'I'				     
		     			 Conteudo := Alltrim( Str(   Valor )  )					     						     			 		     			 	
		     		Else 
		     		   Conteudo := Hb_UTF8ToStr(Valor)
		     		End If 				     
		     End If 				     
		  
		     
		     Aadd(aM1   , Conteudo )		     
		
		Next 				
		
		Aadd(aM1   , .t. )
		Aadd(aM1   , .f. )
		Aadd(aM1   , xRetImg() )		
				
		
		nIdx1 := Ascan(::aMatriz , { |a|a[1] == (Recno() + nNumber1)  } ) 
		
		If (nIdx1 == 0)
		   Aadd( ::aMatriz , aM1 )			  
		   ::aMatriz := Asort(    ::aMatriz ,,, { |a,b| a[1] < b[1] }    )		
		Else		    
		    For n1 := 2 To FCount()	+ 4
		        ::aMatriz[ nIdx1 ][n1] := aM1[n1]
		    Next		    		    
		End If    		
		

Return Len(::aMatriz)


METHOD xCheckRec( nRec ) CLASS tBrowseDb 
Return (Ascan( ::aMatriz , { |a| a[1] == nRec } ) > 0)



METHOD xOpenDb() CLASS tBrowseDb
 
	Local nConnection
	Local cAlias := "tmp" + Alltrim(Str(Random(956522)))
	Local nQReg := 0
	Local n1 
	Local cSqlBrw := ::cSql
	
	HB_SetCodePage( "PT850" )

	rddSetDefault( "SQLMIX" )
	RDDSETDEFAULT( "SQLMIX" )	
	
	::cAlias := cAlias
	
	nConnection := RDDINFO( RDDI_CONNECT, { "MYSQL", cServer , cUserDb , cPassDb , "sisdb"} )


	If nConnection = 0
			MsgInfo("Unable connect to the server!"+Chr(13)+Chr(10)+Str(RDDINFO( RDDI_ERRORNO ))+Chr(13)+Chr(10)+RDDINFO( RDDI_ERROR  , .f. ))
			Return .f.
	End If
	
	If Select(cAlias) > 0
		 dbSelectArea( cAlias )
		 Use
	End If 
	

	dbUseArea( .T.,,  cSqlBrw, cAlias )
	dbSelectArea( cAlias )
	dbGoTop()  	
	
	::aMatriz := {}
	
	//msginfo( Str(::nItMax))
	
	While !Eof()
				
				::xTrfMtr()	
				DbSkip()
				nQReg++				
				If nQReg >= ::nItMax
						Exit				
				End If 				
	Enddo
  

Return .t.



METHOD AddMtrz(  nQt2 ) CLASS tBrowseDb

	Local nZ1    := 0
	Local aM1    := {}
		

	For nz1 := 1 To nQt2    		
    	aM1 := Array(FCount()+4)    		    
    	Afill(aM1, ''  )    		        		    
    	aM1[1] := Len(::aMatriz)+1    		    
    	aM1[ FCount()+2]    := .f.
    	aM1[ FCount()+3]    := .f.    		    
    	Aadd( ::aMatriz , aM1 )    	
  Next     


Return 





METHOD New ( cJanela1 , nLinha , nColuna , cBrwName1 ,  cSql1 , aCabec1 , aSizes , nWidthBrwZ , nHeightY , l_Enabled  , aTips ) CLASS tBrowseDb

   //Public CURSORHAND 
	 ::aMatriz   := {}
	 ::cSql      := cSql1
	 ::aCorSub2  := {234,249,255}  
	 ::aHeadSel1 := {75,85,85}  
	 ::aHeadSel2 := {107,122,126}  	
	 ::aCorZebra := {234,249,255}	 // Zebra Color
	 ::cBrwName  := cBrwName1
	 ::aCorZebra2 := {185,255,255}		 
	 ::cFormObj	 := ''	   
	 ::cKeyCtrl  := ''
	 ::nColSav1 := 0	
	 ::nRowSav1 := 0	
	 ::lEof     := .f. 
	 ::lBof     := .t. 
	 
	 ::nSec2 := 0
	 ::lAscendent := .t.	
	 ::nLinIniBarV := 63
	 ::nTamVert := 0	
	 ::aCorSub1  := RED
	 ::nItMax := 0	
	 ::nLinha1 := 0	
	 ::nPagNum1:=0	
	 ::xPagNumH := 0	
	 ::hBit201 := Nil	
	 ::aCorSub3  := WHITE		
	 ::lBrwEnabled := .t.	
	 ::lHighCol1 := .t.	
	 ::nLineTamV := ::nLinIniBarV	
	 ::nScrollPos := 0
	 ::nAtuLine   := 1
	 ::lEnabled2  := .t. 		 
	 //::cSql       := ''
	 ::nHeightBrw  := nHeightY	 	 
	 ::nResto      := 0
	 ::nLinBrw1 := 0
	 ::nColBrw1 := 0	
	 ::nFirstItem := 0
	 ::nLastItem  := 0	
	 ::nColumnSel := 1
	 ::nColleft   := 1
	 ::nTopRec    := 0
	 ::nOptArrow := 0
	 ::nBarraIncr := 0   
	 ::lHasFocus  := .f.
	 ::nLinhaAnt  := 0	
	 ::aMtr_Bitmap := {}
	 ::nColBarIni := 20	
	 ::isGridVisible := .f.	
	 ::nColBarraH := ::nColBarIni
	 ::l_EofBh := .f.
	 ::l_BofBh := .t.		 
	 ::nColorBkHeader := {117,124,131}
	 ::nColorBkHSel   := WHITE	
	 ::lBarraHFocus := .f. 
	 ::lBarraVFocus := .f. 		 
	 ::lBarraHMouse := .f. 
	 ::lBarraVMouse := .f. 		 
	 ::nOutlineColor := {197,201,202}
   ::lCursorSize := .f.
	 ::yColorFont   			 := BLACK
	 ::yColorFontHeader   := WHITE
	 ::CorDisabled  := {192,192,192} 	
	 ::xFont2 := 'Arial Bold'  // 'Unicode ms'	
	 ::nMainSel := 1	
	 ::nAntSel  := 1	
	 ::lSizeMode := .f. 	
	 ::nLinMouseAnt := 1	
	 ::lDragMode1 := .f.	 
	 ::yRowIni := 30	
	 ::aMenuBarCor := {189,205,217}	  	 
	 ::nItemSubHeight := 20	
	 ::nQUltPag := 0		 
	 ::nRegOut1 := 3		 
	 ::nWidthBrw  := nWidthBrwZ  //GetDeskTopWidth() - 85 	
	 ::nColVBrw := 0	
	 ::l_EofV := .f.
	 ::l_BofV := .f.	
	 ::nScroolCol := 0	
	 ::nPosY := ::nLinIniBarV	
	 ::nLastCol := 0
	 ::l_Eofh := .f.
	 ::l_Eofh := .f.	
	 ::nColBrwIni := 20		 
	 ::nLin1 := nLinha
	 ::nCol1 := nColuna	 
	 ::nSetaSel1 := 0
	 ::nSetaSel2 := 0	
	 ::n_RowX := 0
	 ::n_ColY := 0	
	 ::nOrdemCol := 0	
	 ::nBottomLine1 := 0	
	 ::aMapsCols := {}	 	
	 ::nHeightMen := 20	
	 ::nScrollPosV := 0
	 ::nScrollPosH := 0	
	 ::nPagRec     := 0
	 ::nPagRec2    := 0
	 ::nPageNum    := 1	 
	 ::cAlias      := ''
	 ::nScrollMouse := 0	 	 
	 ::aMtrCab   := aCabec1
	 ::aTamanhos := Aclone(aSizes)
	 ::aTipos 	 := Aclone(aTips)
	 ::aDados := {}	 
	 ::aCabec := {}	 
	 ::nTotWidth2 := 20
	 ::nTotWidth3 := ::nWidthBrw
	 ::nTotWidth1 := ::nWidthBrw	 
	 ::lBrwEnabled := l_Enabled
	 ::aBmp        := {}
	 
	 
	 
	 Aeval( ::aTamanhos , { |a| ::nTotWidth2 += a } ) 
	 	 
	 
	 ::xMapCols()	 	 
	 ::cParentWin    := cJanela1
	 ::cBrwMtr   	   := cBrwName1   
	 ::cBrwName      := cBrwName1   
	 
	 ::hBok          := BT_BitmapLoadFile( 'OKDLG1')   
   //::hBolaAzul     := BT_BitmapLoadFile( 'AZUL1')
   
   ::hBolaAzul     := xBmpWhite( 'Png\Verde1.bmp')
   
   //xBmpWhite( 'Png\Verde1.bmp')
   
    
   ::hBola2	       := BT_BitmapLoadFile( 'AVISO1')   
   ::hB_uP_1D	     := BT_BitmapLoadFile( 'SCRUP1_D')   
   ::hB_uP_2D	     := BT_BitmapLoadFile( 'SCRUP2_D')   
   ::hB_uP_3D	     := BT_BitmapLoadFile( 'SCRUP3_D')   
   ::hB_uP_1	     := BT_BitmapLoadFile( 'SCRUP1')   
   ::hB_uP_2	     := BT_BitmapLoadFile( 'SCRUP2')   
   ::hB_uP_3	     := BT_BitmapLoadFile( 'SCRUP3')   
   ::hB_uP_1_1	   := BT_BitmapLoadFile( 'SCRUP1_1')   
   ::hB_uP_2_1	   := BT_BitmapLoadFile( 'SCRUP2_1')   
   ::hB_uP_3_1	   := BT_BitmapLoadFile( 'SCRUP3_1')   
   ::hB_Dwn_1D	   := BT_BitmapLoadFile( 'SCRDOWN1_D')   
   ::hB_Dwn_2D	   := BT_BitmapLoadFile( 'SCRDOWN2_D')   
   ::hB_Dwn_3D	   := BT_BitmapLoadFile( 'SCRDOWN3_D')   
   ::hB_Dwn_1	     := BT_BitmapLoadFile( 'SCRDOWN1')   
   ::hB_Dwn_2	     := BT_BitmapLoadFile( 'SCRDOWN2')   
   ::hB_Dwn_3	     := BT_BitmapLoadFile( 'SCRDOWN3')   
   ::hB_Dwn_1_1	   := BT_BitmapLoadFile( 'SCRDOWN1_1')   
   ::hB_Dwn_2_1	   := BT_BitmapLoadFile( 'SCRDOWN2_1')   
   ::hB_Dwn_3_1	   := BT_BitmapLoadFile( 'SCRDOWN3_1')         
   ::hB_CimaSeta   := BT_BitmapLoadFile( 'SETACIMA')  //xBmpToTrans( 'SETACIMA', ::nColorBkHeader, 15, 15 )   
   ::hB_CimaSeta2  := BT_BitmapLoadFile( 'SETACIMA2')  //xBmpToTrans( 'SETACIMA', ::nColorBkHSel  , 15, 15 )   
   ::hB_CimaBaixo  := BT_BitmapLoadFile( 'SETABAIXO') //xBmpToTrans( 'SETABAIXO', ::nColorBkHeader, 15, 15 )   
   ::hB_CimaBaixo2 := BT_BitmapLoadFile( 'SETABAIXO2')                                 // xBmpToTrans( 'SETABAIXO', ::nColorBkHSel  , 15, 15 )      
   ::hB_BaixoSeta  := BT_BitmapLoadFile( 'SETACIMA')   
   ::hB_Esquerda	 := BT_BitmapLoadFile( 'ESQUERDA')   
   ::hB_Direita  	 := BT_BitmapLoadFile( 'DIREITA')
   ::hB_Esquerda1	 := BT_BitmapLoadFile( 'ESQUERDA1')   
   ::hB_Direita1 	 := BT_BitmapLoadFile( 'DIREITA1')
   ::hB_Esquerdad	 := BT_BitmapLoadFile( 'ESQUERDAD')   
   ::hB_Direitad 	 := BT_BitmapLoadFile( 'DIREITAD')   
   ::hbExclam    	 := BT_BitmapLoadFile( 'EXCLAMACAO1')      
   
   
   
   
   ::aBmp := { ::hBolaAzul , ::hBola2 , ::hBok }

   
   CursorWe()
   
   
	 If Ascan( ::aObjects , { |a| Alltrim(a:cBrwName) == Alltrim(cBrwName1) } ) == 0
		  Aadd(::aObjects , Self )
		  Aadd( aBrwObjects , Self)
	 End If   
   
   //::xInit()

Return Self 




METHOD xAtuBrw( cName  ) CLASS tBrowseDb

	  DEFAULT cName := ::cBrwMtr
		::yDcToDc( ::cBrwMtr , ::cParentWin , ::nLin1 , ::nCol1 )  		

REturn 



METHOD SetBrwEnabled( lEnabled1 ) CLASS tBrowseDb

  ::lBrwEnabled := lEnabled1  
  ::xAtuBrw()      				
  
Return 


METHOD xMapCols() CLASS tBrowseDb

	 Local nSom1 	   := 19	 		 
	 Local cSoma:=''	 
	 ::aMapsCols := {}	 	 
	 
	 For n1 :=  1 To Len(::aMtrCab)	 
	 			Aadd(::aMapsCols , { ::aMtrCab[n1] , nSom1   ,  nSom1 + ::aTamanhos[n1] , ::aTamanhos[n1] } )	 				 				 				 			
	 			cSoma += Time() + ' ' + ::aMtrCab[n1] + '  ' + Str(nSom1) + ' ' + Str( nSom1 + ::aTamanhos[n1] ) + '  ' + Str(::aTamanhos[n1])  + XQUEBRA
	 			nSom1 += (::aTamanhos[n1])	 
	 Next 
	 
	 ::nTotWidth2 := 20	 	 
	 Aeval( ::aTamanhos , { |a| ::nTotWidth2 += a } ) 	 
	 
Return 





METHOD xOrdemCol(nColuna1) CLASS tBrowseDb		
		
		If !::lAscendent 
				::lAscendent := .t.											
			  ::aMatriz := Asort(::aMatriz  ,  ,   , { |a,b| a[nColuna1] < b[nColuna1] }   )				
	  Else
	  		::lAscendent := .f.	  	  			  
	  	  ::aMatriz := Asort(::aMatriz  ,  ,   , { |a,b| a[nColuna1] > b[nColuna1] }   )	  	 
	  End If			

Return .t.



METHOD xCheckCol(nColuna , lFrente) CLASS tBrowseDb


   Local nP1 := Abs(::nScrollPosH)+::nWidthBrw
   Local lRet := .t. 
   Local nDiff := 0
   Local nDif1 := 0
   
    
   If lFrente      		
   		If ( (::aMapsCols[nColuna][3] - 4) >= nP1)
   			  nDiff:= ::aMapsCols[nColuna][3] - nP1
   		End If    
   Else    	
   		nDif1 := ((::aMapsCols[nColuna][3] - 4  ) - Abs(::nScrollPosH))     		
   		If ((::aMapsCols[nColuna][3] - 4  ) <= Abs(::nScrollPosH))  
   			  nDiff := Abs(::nScrollPosH) - ::aMapsCols[nColuna][3] 
   		End If       		
   	
   End If 


Return Abs(nDiff)


METHOD yDcToDc( cOrig , cDestJan ,nRow1,nCol1) CLASS tBrowseDb


	
	Local Width1  := BT_ClientAreaWidth  (cOrig)   //cJanPrin2
	Local Height1 := BT_ClientAreaHeight (cOrig)
	
	LOCAL hDC1, BTstruct1
	LOCAL hDC2, BTstruct2 , BTstruct3 , hDc3 , hB1
	Local hBitMap2
	
		
	If !_isWindowDefined(cOrig) .or. !_isWindowDefined(cDestJan)
			//msginfo('p2')
			REturn	
	End If	
		
	
	hDc1 := GetDc( GetFormHandle(cOrig)   )
	hDc2 := GetDc( GetFormHandle(cDestJan)   )
/*
	hBitMap2 := BT_BitmapCreateNew (Width1  , Height1 , WHITE )
	hDC3 := BT_CreateDC (hBitMap2 , BT_HDC_BITMAP, @BTstruct3 )
	BT_DrawDCtoDC (hDC3, 0, 0, Width1, Height1, BT_SCALE, hDC1, 0, 0, Width1, Height1)
	Bt_BitmapSaveFile(  hBitMap2 , 'Menu11sombra343.bmp'  )
	*/	
	
	
	
	If (!::lBrwEnabled)  //.or. ( !::lHasFocus)
		//	msginfo('ok')
			hB1 := BT_BitmapCreateNew ( Width1 , Height1 , RED )
			hDC3 := BT_CreateDC ( hB1 , BT_HDC_BITMAP, @BTstruct3 )
			BT_DrawGradientFillHorizontal( hDC3 , 0,0 , Width1 , Height1 , BLACK , BLACK   )			
			BT_DrawDCtoDC (hDC2, nRow1 , nCol1, Width1, Height1, BT_SCALE, hDC1, 0, 0, Width1, Height1)											
			BT_DrawDCtoDCAlphaBlend (hDC2, nRow1 , nCol1, Width1, Height1, 85 , BT_SCALE, hDC3, 0, 0, Width1, Height1)
			BT_DeleteDC (BTstruct3)
	Else						
			::DrawDCtoDC(hDC2, nRow1 , nCol1 , Width1, Height1, BT_COPY, hDC1, 0, 0, Width1, Height1)										
	End If
	
	
	
	ReleaseDC( GetFormHandle(cOrig)      , hDC1 )
	ReleaseDC( GetFormHandle(cDestJan)   , hDC2 )	



Return 




METHOD CalcNPage() CLASS tBrowseDb

	::nPageNum := 1	
	
	
	If (::nMainSel > ::nItMax)
			::nPageNum := Int(::nMainSel/::nItMax)+1
	End If 


Return 


METHOD xCalcRec() CLASS tBrowseDb

	Local nResto := 0
	
	DbSelectArea(::cAlias)

	::nPagRec       := Round( Reccount() / ::nItMax,2)	
	::nResto        := Mod( Reccount() , ::nItMax )	
	::nQUltPag      := nResto	
	
	If (nResto != 0)
			::nPagRec++	
	End If 


Return Self



METHOD xInit() CLASS tBrowseDb

	Local nIt2 := (::nRegOut1 * ::nItemSubHeight)
	Local nIndk1 := 4856	
	Local nResto	:= 0		
	
	::nItMax := ( ( ::nHeightBrw - nIt2) / ::nItemSubHeight)		
	::nScrollMouse := 0
	::nQUltPag := nResto			
	
	::nColVBrw := ::nWidthBrw+::nCol1+1
	If !::xOpenDb()
		  Return 	
	End If 	
	::nPagRec       := Int( RecCount() / ::nItMax)	
	::nResto     	  := Mod( RecCount() , ::nItMax )	
	
	If (::nResto != 0)
			::nPagRec++	
	End If 		
	
	DoEvents()	
  ::DefBrowser( ::nLin1  , ::nCol1 ,  ::nWidthBrw , ::nHeightBrw , ::cBrwName , ::aMatriz )          
  ::xGoPage(1 , .f.)       
	::isGridVisible:=.t.  
	DbGotop()		
	
Return 




METHOD xGoFirst() CLASS tBrowseDb

	Local nItMax1 := ::nItMax	
	Local nFirstItem
	Local nLastItem
	
	
//	msginfo( '2 ' + Str( ::nMainSel ))
	
	If ::nMainSel <= 1
		 Return	
	End If	
	
	
	::nScrollPosV := 0	
	::nPagRec2    := 1	
		
	CursorWait()	
	DoEvents()
	::nAntSel 	:= 1
	::nLinhaAnt := 0  	   	 	
	::nLinMouseAnt := 1 
	::nLineTamV := ::nLinIniBarV
	::nMainSel := 1
	::lEof     := .f.
	::lBof     := .t.
	::nTopRec  := 0 
	
	nFirstItem  := 1
	nLastItem   := nItMax1 
	
	If nItMax1 > Len(::aMatriz)
		 nLastItem   := Len(::aMatriz)			  		
	End If 	
	
	::xFillMtr(  nFirstItem ,    nLastItem )			 			
	//::nPagRec := 1	
	::nAtuLine := 1	
	::nPageNum := 1	
	::nLinha1 := ::nFirstItem //- 1	 	
	::nPageNum := 1
	::xCalcVBar()	  
	::xRefresh( ::cBrwMtr , nFirstItem , nLastItem   )					
	CursorNormal()	
	

REturn 



METHOD xGoLastPag() CLASS tBrowseDb
			
			
		
		Local nItMax1 := ::nItMax		
		Local nUlt 		:= ::nItMax - 1		
		Local nResto := Mod( RecCount() , ::nItMax )
		Local nQt2   := (RecCount() - Len(::aMatriz))
		Local nFirstItem := 0
		Local nLastItem  := 0
		Local n5         := 0
		
		
		If (Reccount() > ::nItMax)
				If (::nPagRec2 = Int( Reccount() / ::nItMax)	)
					 Return
				End If 
		Else 
				Return 
		End If 
				
		
		CursorWait()							
		DbGoBottom()		    		
		
    
    If (Reccount() > Len(::aMatriz))        		
    		::AddMtrz(  nQt2 )
    End If 				
		DoEvents()
		::nAntSel := 0  	  
		If (::nResto != 0) 			 		   	
			  nFirstItem := Len(::aMatriz) - (::nResto + 1)
				nLastItem  := Len(::aMatriz) 			 						
				::nAtuLine 	 := ::nResto + 1
				n5 					 := ::nResto			
		Else			 			 	
				nFirstItem := Len(aMatriz) - (nItMax1 + 1)
				nLastItem  := Len(aMatriz)			 			 					 					 					 						
				::nAtuLine 	 := nItMax1	
				n5           := nItMax1				
		End If 			 
		
		::nPagRec2       := 1		
		If (Reccount() > ::nItMax)
			 ::nPagRec2       := Int( Reccount() / ::nItMax)	
		End If
		
		
		::nScrollPosV := ( (Len(::aMatriz) - nItMax1) * ::nItemSubHeight )				
		
		 If ( Abs(::nScrollPosV) > 0) 				    
				nLastItem		:= ( ::nItMax + (Abs(::nScrollPosV) / ::nItemSubHeight) )	
				nFirstItem 	:= (nLastItem - n5)								
		End 										
		
		::nLinMouseAnt := ::nAtuLine 
		::lEof     := .t.
		::lBof     := .f.		
		::nAntSel    := nLastItem 				
		::nTopRec  	 := nFirstItem
		::xFillMtr(  nFirstItem ,    nLastItem )			 		
		::nMainSel := nLastItem		
		::nPageNum := ::nPagRec			 		 			
		::xCalcVBar()			  
		::xRefresh( ::cBrwMtr , nFirstItem , nLastItem   )			 
		SetProperty(::cBrwMtr , 'Cursor'  , IDC_ARROW)			 			 			 
		DbGoBottom()	
		CursorNormal()		
		

Return 




METHOD xKeySubMen(nHWnd1 , nMsg  ) CLASS tBrowseDb

 Local xKeySub   := HMG_GetLastVirtualKeyDown()
 Local lCtrl := (GetKeyState ( VK_CONTROL ) < 0)
 Local i := 1
 
 
 
 
		If (xKeySub = 34) 		 		
 			 For i := 1 To 255
           GetAsyncKeyState(i)
       Next i       
       
       While (GetAsyncKeyState(34) != 0)					       
       				If ::nPageNum < ::nPagRec
		       				::nPageNum++
		       				::nPagNum1++		       						       			
		       				::xGoPage(::nPageNum, .t. ,, .f.) 				       				
		       				::xAtuBrw()      				
		       				::xCalcVBar()		       				
		       		Else 
		       		    ::xGoLastPag()
		       		End If 
       Enddo    		
       
 		End If
 		
 		
 		If (xKeySub = 33) 		
 			 For i := 1 To 255
           GetAsyncKeyState(i)
       Next i       
       
       While (GetAsyncKeyState(33) != 0)					       
       				If ::nPageNum > 1
		       				::nPageNum--		       				
		       				::xGoPage(::nPageNum, .f. ,, .f.) 				       				
		       				::xAtuBrw()
		       				::xCalcVBar()		       				
		       		Else 
		       		    ::xGoFirst()		
		       		End If 
       
       Enddo    		
 		End If 
 		

Return 


METHOD xSelCol( nColuna1 , lFrente , lNavigate , lHighLate ) CLASS tBrowseDb

	Local nT1 	:= 0
	Local nDiff := 0
	Local lScr1  := .f.
	Local nTam1 := 0	
	
	DEFAULT lFrente := .f.	
	DEFAULT lNavigate := .t.	
	DEFAULT lHighLate := .t.
	
	
	If !lFrente       	 
	 		nDiff := ::xCheckCol( nColuna1 , .f. ) 	 		
	 		lScr1 := .f. 	 			 			 			 		
	 		If (nDiff > 0)	 		
	 				 If lNavigate	
		       		::nColleft--
		       End If		       
		       nTam1 			:= ::aTamanhos[nColuna1] 				       						 		  
				   If (::nColumnSel == 1)
				       	nTam1 += 20		       						 		  				       	
				        ::nColleft := 1
				    End If 				       						 		  				    
				    ::MoveHBar(.f.)				       						 		  
				    ::nTotWidth3 -= nTam1		       						 		  
				    ::nScrollPosH += nTam1
				    lScr1 := .t. 				     				       						 		  
				     If ::nColleft = 1
				       	::nScrollPosH := 0				       						 		  
				     End If		 		
	 		Else 	 		 		
	 		
	 		
	 		End If
	 		
	 				If ::lHighCol1				 							
		       		::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem    )	   	
							DoEvents()						  
						  ::xAtuBrw()
					Else 
						
							If lScr1 								
									::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem    )	   	
							  	DoEvents()						    	
						    	::xAtuBrw()
		       		End if 						         
					End If
						
	
	Else
	
	
				 nDiff := ::xCheckCol( nColuna1 , .t. ) 
				   
				   
				 If (nDiff > 0)  
				 		
						
						nT1 := 0										
										
						If (::nColleft = 1)
								nT1 := 20
						End If 	
						
						::nLastCol   := 0												
						n1    := ::nColleft 
						
						If ::nColleft == 1
							 n1:=1						
						End If 					  
												
						
						While (nT1 < nDiff)
				  				 nT1 += ::aTamanhos[ ::nColleft ]
				  				 ::MoveHBar(.t.)
				  				 ::nColleft++					  				 
				  	Enddo 																		  	
				  					
				  	
				  	::nScrollPosH -= nT1 
						::nTotWidth3  += nT1 
						
														
						//msginfo('gy')		
						
					  ::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem  )	   	
						DoEvents()						
						::xAtuBrw()
				
				
				Else 
				
				
							If (nColuna1 = Len(::aMtrCab) )	
									If (::nTotWidth3  != ::nTotWidth2)
											 ::nLastCol   := ::nTotWidth3 - ::nTotWidth2											 											
									End If 
							End if							
							
								
							If ::lHighCol1
									::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem  )	   	
									DoEvents()
									::xAtuBrw()
							End If 									
				End If 		       				
	End If

Return 


METHOD xRefresh(  cName , n1 , n2 , lUpdHeader , lSelected ) CLASS tBrowseDb


	Local aM1  := AClone(::aMatriz)	
	Local BTstruct3
	
	DEFAULT lUpdHeader := .t.
	DEFAULT lSelected  := .f.
	
	
	//msginfo(Str(    Len(aM1)     ))
	
	
	
	//msginfo(Str(::nColleft))
	
			
	     //Here	
	     
		 		DrawBrwDc( GetDc(  GetFormHandle(cName))    , 0 , 0 , ::nWidthBrw   , ::nHeightBrw , ; 
			 ::aCorSub2 , ; //6
		 		aM1 ,; //7
				 (::nItMax+::nLinha1) ,;//8
		 		   ::nItemSubHeight ,; //9
		 		    ArrayRGB_TO_COLORREF(::aCorSub3) , ; //10
		 		    ::nMainSel , ; //11
		 		    ::XFONT2, ; //12
		 		      { ArrayRGB_TO_COLORREF(::yColorFont),  ArrayRGB_TO_COLORREF(::CorDisabled) }  , ;		 		 //13
		 		 ArrayRGB_TO_COLORREF( {53,53,153}   ) ,; //14 - Head Color
		 		  ArrayRGB_TO_COLORREF( ::aMenuBarCor ) , ; //15
		 		  ArrayRGB_TO_COLORREF(::aCorSub3) , ; //16
		 		  ::nScrollPosV , ; //17
		 		  ::lEnabled2  , ;  //18		 		 		 		 
		 		 ::aMtrCab ,; //19
		 		  ::aTamanhos  , n1 , n2  , ::nScrollPosH , ::nColbrwIni , ::aBmp , ::nWidthBrw , ::aMtrCab, ::nColumnSel , ::nColLeft , ArrayRGB_TO_COLORREF(::aCorZebra) , ::lBrwEnabled , ::hbExclam , ; 
		 		  ::aTipos , ArrayRGB_TO_COLORREF(::aCorZebra2)) 		 		//20 //21 //22 //23//24//25//26
		 		  
		 		  
		 		  	 		  
	

  
  If (lUpdHeader)		  
			::xDrawBarV( cName ,  ::nPosy )						
		  DoEvents()		  
			DrawHeader(    GetDc( GetFormHandle(cName)   ) , ::aMtrCab ,  ::aTamanhos , ::nScrollPosH , ::nColbrwIni , ;
			::nItemSubHeight,  ::nColorBkHeader   , ::nWidthBrw , ArrayRGB_TO_COLORREF( ::nColorBkHSel  )  , ::nColumnSel , ::XFONT2 , ArrayRGB_TO_COLORREF(::yColorFontHeader) , Len(::aMtrCab  ) , ;
			::nLastCol , ::lHighCol1 , ::nOrdemCol , { ::hB_CimaSeta , ::hB_CimaSeta2 , ::hB_CimaBaixo , ::hB_CimaBaixo2  } , ::lAscendent , ArrayRGB_TO_COLORREF(::aHeadSel1) , ArrayRGB_TO_COLORREF(::aHeadSel2) )			  
		  DoEvents()		  
		  ::xDrawBarH( cName , ::nColBarraH  ,  lSelected , .f.)
		  DoEvents()
		  ::xAtuBrw('sssssss')
	End If 
//	
//	
//	hBitMap2 := BT_BitmapCreateNew (::nWidthBrw  , ::nHeightBrw , RED )
//	hDC3 := BT_CreateDC (hBitMap2 , BT_HDC_BITMAP, @BTstruct3 )
//	BT_DrawDCtoDC (hDC3, 0, 0, ::nWidthBrw, ::nHeightBrw, BT_COPY ,  GetDc(  GetFormHandle(cName))  , 0, 0, ::nWidthBrw, ::nHeightBrw )
//	Bt_BitmapSaveFile(  hBitMap2 , 'xBrowt1.bmp'  )

	
  
  

REturn 





/*
METHOD xRefresh(  cName , n1 , n2 , lUpdHeader , lSelected ) CLASS tBrowseDb


	Local aM1  := AClone(::aMatriz)
	Local aBmp := { ::hBolaAzul , ::hBola2 }
	Local aColor 
	Local nTamTot := 0
	
	DEFAULT lUpdHeader := .t.
	DEFAULT lSelected  := .f.
	
	
	Aeval( ::aTamanhos , { |a| nTamTot += a } ) 	 
	
	aColor := ::aCorZebra
	
	if (!::lBrwEnabled) //.or. ( !::lHasFocus)
		 aColor := ::CorDisabled
	End If 	
	
	     
	DrawBrwDC( GetDc(  GetFormHandle(cName))    , 0 , 0 , ::nWidthBrw   , ::nHeightBrw , ; 
	Nil , ; //6
	aM1 ,; //7
	(::nItMax+::nLinha1) ,;//8
	::nItemSubHeight ,; //9
	::aCorSub3 , ; //10 ArrayRGB_TO_COLORREF
	::nMainSel , ; //11
	::xFont2, ; //12
	{ ArrayRGB_TO_COLORREF(::yColorFont),  ArrayRGB_TO_COLORREF(::CorDisabled) }  , ;		 		 //13
	ArrayRGB_TO_COLORREF( {53,53,153}   ) ,; //14 - Head Color
	ArrayRGB_TO_COLORREF( ::aMenuBarCor ) , ; //15
	::aCorSub3 , ; //16
	::nScrollPosV , ; //17
	::lEnabled2  , ;  //18		 		 
	::aMtrCab ,; //19
	::aTamanhos  , n1 , n2  , ::nScrollPosH , ::nColBrwIni , If(!::lBrwEnabled , {} , ::aMtr_Bitmap ) , ;
	::nWidthBrw , ::aMtrCab, ::nColumnSel , ::nColleft , ArrayRGB_TO_COLORREF(aColor) , ::lBrwEnabled , ::hbExclam ,   ::lHasFocus ) 		 		//20 //21 //22 //23//24//25//26	
  
  If (lUpdHeader)		    		  		
			::xDrawBarV( cName   ,   ::nPosy  )					  
		  DoEvents()		  
		  
			DrawHeader(    GetDc( GetFormHandle(cName)   ) ,;
			::aMtrCab , ;
			::aTamanhos ,; 
		  ::nScrollPosH , ; 
		  ::nColBrwIni , ;
			::nItemSubHeight, ;
			::nColorBkHeader   ,;  
			::nWidthBrw , ; 
			ArrayRGB_TO_COLORREF( ::nColorBkHSel  )  , ; 
			::nColumnSel , ; 
			::xFont2 ,; 
			ArrayRGB_TO_COLORREF(::yColorFontHeader) , ; 
			Len(::aMtrCab  ) , ;
			::nLastCol ,  ; 
			::lHighCol1 , ; 
			::nOrdemCol , ;  
			{ ::hB_CimaSeta , ::hB_CimaSeta2 , ::hB_CimaBaixo , ::hB_CimaBaixo2  } ,; 
			 ::lAscendent ,  ; 
			 ArrayRGB_TO_COLORREF(::aHeadSel1) , ;
			 ArrayRGB_TO_COLORREF(::aHeadSel2) ,;
			::nWidthBrw - ( nTamTot + 23   ) , ::lHasFocus )
			
		  DoEvents()		  
		  ::xDrawBarH( cName , ::nColBarraH  ,  lSelected , .f.)
		  DoEvents()
		  ::xAtuBrw()
	End If   
  

REturn 

*/




METHOD DefBrowser(x,y,nWidth1,nHeight1 , cBrwName1 , aMtr1 ) CLASS tBrowseDb

	Local aM1 := AClone(aMtr1)
	Local nIndexDlg22:=22
	Local cParent1 := ::cParentWin
	Local cLbl1 := ''		
	
		
	
	DEFINE WINDOW &cBrwName1 AT x , y WIDTH nWidth1+20 HEIGHT nHeight1  TITLE '' ;
		NOBORDER NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD PANEL PARENT &cParent1 BACKCOLOR ::aCorSub1 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Nil		
	END WINDOW
	
	::cLblName := 'yLblBrw_' + Right( cBrwName1 , 4 )	
	cLbl1 := ::cLblName 
	
	DEFINE LABEL &cLbl1
			ROW    x - 2
			COL    ::nCol1
			WIDTH  nWidth1+20
			HEIGHT nHeight1 //+10
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
			TRANSPARENT .t.
			ACTION Nil
			AUTOSIZE .F.
			BACKCOLOR ::aCorSub1
			FONTCOLOR NIL
			PARENT &cParent1	
	END LABEL
		
		
	//EventProcessAllHookMessage( EventCreate ( "EventMtrw"  , GetControlHandle(  cLbl1 ,  cParent1 ) ) , .t.)		
	
	
	DoEvents()	
	nIndex23 := 4125	

	
	SET WINDOW &cBrwName1 TRANSPARENT TO 0			
	_ShowWindow( ::cBrwName )						
    

Return 





METHOD xDrawBarH( cForm1 , nColXy , lSelected , lUpdateBar ) CLASS tBrowseDb


  Local hDC2 := GetDc( GetFormHandle(cForm1)   )
  Local nCol1 := 0
  Local nTam1 := 0   
  Local nC1 := 0      
  Local nPos := ::nLinIniBarV //63
  Local nIncremento := 0   
  LOCAL BTstruct3	
	Local nWidth   := BT_ClientAreaWidth(cForm1) - 20	
	Local nHeight  := BT_ClientAreaHeight(cForm1)	
	Local hB1 := BT_BitmapCreateNew ( nWidth , 30 , {135,135,135} )
  Local hDC := BT_CreateDC ( hB1 , BT_HDC_BITMAP, @BTstruct3 )  
  Local n_qCols := ::xQtScrCol()
  Local nTamBar := ::xTamBarH(n_qCols)  
  Local nColz1 := 0
  
  DEFAULT lSelected  := .f.   
  DEFAULT lUpdateBar := .t.  
  DEFAULT nColXy := 20  	   
  
  BT_DrawGradientFillVertical ( hDC,   0 ,  0   , nWidth ,  30  ,   { 240, 240 , 240 }  , { 240, 240 , 240 } )   
  BT_DrawGradientFillVertical ( hDC,   7 ,  0   , nWidth ,  17  ,  { 185,185,185}  ,{217, 217 , 217} )   
  
  
	If (::nSetaSel2 == 0)
			BT_DrawBitmap (hDC  ,   7 ,   nWidth - 17     , 20  , 17  ,      BT_SCALE ,  ::hB_Direita )  
			BT_DrawBitmap (hDC  ,   7 ,   0             	, 20  , 17  ,      BT_SCALE ,  ::hB_Esquerda )    		  		
	Else  
	
			If (::nSetaSel2 == 1)  		
					BT_DrawBitmap (hDC  ,   7 ,   nWidth - 17     , 20  , 17  ,      BT_SCALE ,  ::hB_Direita1 )  
					BT_DrawBitmap (hDC  ,   7 ,   0             	, 20  , 17  ,      BT_SCALE ,  ::hB_Esquerda )    		
			Else  		
					BT_DrawBitmap (hDC  ,   7 ,   nWidth - 17     , 20  , 17  ,      BT_SCALE ,  ::hB_Direita )  
					BT_DrawBitmap (hDC  ,   7 ,  	0						   	, 20  , 17  ,      BT_SCALE ,  ::hB_Esquerda1 )    		  					
			End If 
			
	End If  		  
	
	
	
	If (!::lBrwEnabled) //.or. (!::lHasFocus)   
			BT_DrawGradientFillVertical ( hDC,   0 ,  0   , nWidth ,  30  ,   { 240, 240 , 240 }  , { 240, 240 , 240 } )   
  		BT_DrawGradientFillVertical ( hDC,   7 ,  0   , nWidth ,  17  ,  { 185,185,185}  ,{217, 217 , 217} )   
			BT_DrawBitmap (hDC  ,   7 ,   nWidth - 17     , 20  , 17  ,      BT_SCALE ,  ::hB_Direitad )  
			BT_DrawBitmap (hDC  ,   7 ,   0             	, 20  , 17  ,      BT_SCALE ,  ::hB_Esquerdad )    		  		
	End If   
	DrawVertL( hDc, 0 , 30 , .t. , {197,201,202} )      		
	DrawVertH( hDc, 0 ,  nWidth , .t. , {197,201,202}  )    
	DrawVertH( hDc, 29 , nWidth , .t. , {197,201,202}  )      
  
  If (n_qCols > 0)     
  		If (::lBrwEnabled) //.And. (::lHasFocus)  
  			 BT_DrawGradientFillVertical (hDC, 9, nColXy, nTamBar , 12 , {44,137 , 224  } ,  { 40,125,204 }  )  		
  		Else
  			 BT_DrawGradientFillVertical (hDC, 9, nColXy, nTamBar , 12 , {197,197 , 197  } ,  { 197,197,197 }  )  		
  		End If 	 
  		nC1 	 := nColXy+nTamBar  		
  		nColz1 := nColXy - 1  		 
  		 For n1 := 1 To 4
  		 	   BT_DrawSetPixel (hDC, 9 , nC1 - n1 ,  { 188,188,188 } ) 		 	     		 	   
  		 	   BT_DrawSetPixel (hDC, 20 , nC1 - n1 ,  { 207,207,207 } )  		 	 
  		 Next  		   		 
  		 For n1 := 1 To 4
  		 	   BT_DrawSetPixel (hDC, 9 , nColZ1 + n1  ,  { 188,188,188 } ) 		 	     		 	   
  		 	   BT_DrawSetPixel (hDC, 20 ,nColZ1 + n1  ,  { 207,207,207 } )  		 	    		 	   
  		 Next   		
  		 For n1 := 1 To 2  		 
  		 	   BT_DrawSetPixel (hDC, 10 , nC1 - n1 ,  { 188,188,188 } )  		 	   
  		 	   BT_DrawSetPixel (hDC, 19 , nC1 - n1 ,  { 207,207,207 } )
  		 	   BT_DrawSetPixel (hDC, 10 , nColXy+n1 - 1 ,  { 188,188,188 } ) 		 	   
  		 	   BT_DrawSetPixel (hDC, 19 ,nColXy+n1  - 1, { 207,207,207 } )  		 	     		 	   
  		 Next  		   		   		 	     		 
  		 BT_DrawSetPixel (hDC, 11 , nC1 - 1 ,  { 188,188,188 } )
  		 BT_DrawSetPixel (hDC, 18 , nC1 - 1 , { 207,207,207 } )
  		 BT_DrawSetPixel (hDC, 11 , nColxy  ,  { 188,188,188 } )
  		 BT_DrawSetPixel (hDC, 18 , nColxy ,  { 207,207,207 } )  		   	 
 	End If
  
  ::DrawDCtoDC (hDC2 ,   nHeight - 30 ,  0 ,  nWidth , 30 , BT_SCALE, hDC , 0, 0 ,  nWidth , 30)  
  BT_DeleteDC (BTstruct3 )  
	ReleaseDC( GetFormHandle( cForm1 ), hDC2  )

REturn 


METHOD xTamBarH(nqCols) CLASS tBrowseDb

	Local n1 := 0
	Local nTamini := 120	
	Local nTamTotal := ::nTotWidth1 - 40 
	Local nProd1 := 0	
	
	While .t. 	
	
				 nProd1 := (nTamIni * nqCols)				 				 
				 
				 If nProd1 > nTamTotal
				    nTamini -= 20
				 Else
				 	  Exit				 
				 End If 				 	
	
	
	Enddo	
	
	::nBarraIncr  := nTamini	
	

Return nTamTotal - nProd1


METHOD xQtScrCol() CLASS tBrowseDb

	Local nQt := 0
	Local n   := 1
	Local nLast := ::aMapsCols[Len(::aMapsCols)][3]
	Local nTam1 := 0
	Local lOk   := .f.   
	Local nScr1 := 0
   
   
	If (::nWidthBrw >= nLast)
			Return 0   
	End If 
   
   
	While (n <= Len(::aMtrCab)) .And. (!lOk)         			   
				nTam1 := 0				   	
			  If (n == 1)
			      nTam1 += 20
			  End If 
			  nTam1 += ::aTamanhos[n]			    
			  nScr1 -= nTam1	   			   
			  nQt++
   			If ((Abs(nScr1)+::nWidthBrw) >= nLast)
			    		lOk := .t.
			  End If 
			  n++   
	Enddo


Return nQt


METHOD MoveHBar(lFrente) CLASS tBrowseDb


	If lFrente
		  ::nColBarraH += ::nBarraIncr 				  	 
	Else
			::nColBarraH -= ::nBarraIncr 				  	 
	End If 
	
	::xDrawBarH( ::cBrwMtr , ::nColBarraH , .F. , .t.) //- 45 )  	
	::xAtuBrw()
	DoEvents()  

Return 


METHOD xScrolCol( lFrente , lUpdBar ) CLASS tBrowseDb

	Local nTam1 := 0
	Local nLast := ::aMapsCols[  Len(::aMapsCols)  ][3]
	
	
	DEFAULT lUpdBar := .t.
	
	
	::nLastCol := 0

	If (lFrente)	
					
			If (::nScroolCol < Len(::aMtrCab)) .And. (!::l_EofBh)								
			
			    ::nScroolCol++			    
			    ::nColleft := ::nScroolCol+1			   			    
			    If ::nScroolCol == 1
			       nTam1 += 20			       
			    End If 			    
			    ::l_BofBh := .f.			    
			    nTam1 += ::aTamanhos[::nScroolCol]			    
			    ::nScrollPosH -= nTam1				    			    			    
			    ::nTotWidth3 += nTam1		       						 		  			    
			    If ((Abs(::nScrollPosH)+::nWidthBrw) >= nLast)			    				    
			    		::l_EofBh := .t.			    					    					    					    	
			    		
							If (::nTotWidth3  != ::nTotWidth2)
									::nLastCol   := ::nTotWidth3 - ::nTotWidth2											 											
							End If 										    		
			    End If 			    		     
				  
				  If lUpdBar
				  	 ::nColBarraH += ::nBarraIncr 				  	 				  	
				  End If 				  
				  ::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem  ,, .t.   )	   					  		   
			End If 	
	Else
				If (::nScroolCol > 0) .And. (!::l_BofBh)		
						
						::nScroolCol--																													
						::nColleft := ::nScroolCol+1			    
				    If ::nScroolCol == 0				  
				       nTam1 += 20				       
				    End If 				    
				    
				    nTam1 += ::aTamanhos[::nScroolCol+1]			    				    				    
				    ::nScrollPosH += nTam1				    				    
				    ::nTotWidth3 -= nTam1		       						 		  				    				    
				    ::l_EofBh := .f.				    
				    If lUpdBar
						    ::nColBarraH -= ::nBarraIncr				  						  
				  	End If 				   				    				    
				    ::xRefresh(::cBrwMtr , ::nFirstItem , ::nLastItem ,, .t.    )	   										  	
			  End If		
	
	End If 



Return .t.



METHOD xDrawBarV( cForm1 , nColXy , lSelected , lUpdateBar ) CLASS tBrowseDb


  Local hDC2 := GetDc( GetFormHandle(cForm1)   )
  Local nCol1 := 0
  Local nTam1 := 0
  Local nPos := ::nLinIniBarV //63
  Local nIncremento := 0   
  LOCAL BTstruct3	
  Local n1 := 0
	Local nWidth   := 20
	Local nHeight  := BT_ClientAreaHeight(cForm1)	
	Local hB1 := BT_BitmapCreateNew ( 20 , nHeight , {135,135,135} )
  Local hDC := BT_CreateDC ( hB1 , BT_HDC_BITMAP, @BTstruct3 )
  
  DEFAULT lSelected  := .f.   
  DEFAULT lUpdateBar := .t.  
	   
  BT_DrawGradientFillVertical ( hDC,   0 , 0   , nWidth ,  nHeight , { 240, 240 , 240 } , { 240, 240 , 240 } ) 
  
  //up
  
  If !::lDragMode1    		
  
  		If ::nMainSel == 1
  			 BT_DrawBitmap (hDC  ,   1 ,  nCol1    	, 20  , 20  ,      BT_COPY, ::hB_Up_1d   )	
  		Else
  				BT_DrawBitmap (hDC  ,   1 ,  nCol1    	, 20  , 20  ,      BT_COPY,  Iif(::nSetaSel1 == 4  , ::hB_Up_1_1  ,  ::hB_Up_1 ) )	
  		End If  		
  		
		  If ::nPagRec > 1 		  		  
		  		If (::nPageNum == 1)
		  				BT_DrawBitmap (hDC  ,  22  ,nCol1 + 1 	, 20  , 20  ,      BT_COPY,  ::hB_Up_2d  )  
		  				BT_DrawBitmap (hDC  ,  43  ,nCol1 + 1	, 20  , 20  ,        BT_COPY,  ::hB_Up_3d  )  
		  		Else		  
				  		BT_DrawBitmap (hDC  ,  22  ,nCol1 + 1  	, 20  , 20  ,      BT_COPY,  Iif(::nSetaSel1 == 5  , ::hB_Up_2_1 ,  ::hB_Up_2  )  )  
				  		BT_DrawBitmap (hDC  ,  43  ,nCol1 + 1  , 20  , 20  ,       BT_COPY,  Iif(::nSetaSel1 == 6  , ::hB_Up_3_1 ,  ::hB_Up_3  )  )				  		
				  End If		
		  Else   		  
		  
		  		BT_DrawBitmap (hDC  ,  22  ,nCol1 + 1 	, 20  , 20  ,      BT_COPY,  ::hB_Up_2d  )  
		  		BT_DrawBitmap (hDC  ,  43  ,nCol1 + 1	, 20  , 20  ,        BT_COPY,  ::hB_Up_3d  )  
		  		
		  End If   
  Else 
  
  		BT_DrawBitmap (hDC  ,   1 ,   nCol1   	, 20  , 20  ,      BT_COPY,    ::hB_Up_1d )  
  		BT_DrawBitmap (hDC  ,  22  ,	nCol1+1  	, 20  , 20  ,      BT_COPY,    ::hB_Up_2d  )  
		  BT_DrawBitmap (hDC  ,  43  ,  nCol1+1 	, 20  , 20  ,      BT_COPY,    ::hB_Up_3d  )  
  
  End If   

  
  
  //Down
   
  If !::lDragMode1  
    
    	If (::nMainSel == Len(::aMatriz)) .And. (::nPagRec == 1)
    		 BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_1D )	    	
    	Else  
				  BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1   	, 20  , 20  ,      BT_COPY,  Iif(::nSetaSel1 == 1  ,;		  
				  ::hB_Dwn_1_1  ,  ::hB_Dwn_1 ) )		  
			End If 						  
			
			
		  
		  If ::nPagRec > 1 
		  		If (::nPageNum == ::nPagRec)		  		
		  				BT_DrawBitmap (hDC  ,  nHeight - 41 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_2D  ) 		    		
  						BT_DrawBitmap (hDC  ,  nHeight - 61 ,nCol1 - 1 	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_3D  )  
		  		
		  		Else		  
			  			BT_DrawBitmap (hDC  ,  nHeight - 41 ,nCol1 + 1   	, 20  , 20  ,      BT_COPY,  Iif(::nSetaSel1 == 2  , ::hB_Dwn_2_1 ,  ::hB_Dwn_2  )  )  
			  			BT_DrawBitmap (hDC  ,  nHeight - 61 ,nCol1 	, 20  , 20  ,      BT_COPY,  Iif(::nSetaSel1 == 3  , ::hB_Dwn_3_1 ,  ::hB_Dwn_3  )  )
			  	End If 	
			  	
			  	DbSelectArea( ::cAlias )
			  	
			  	If (::nMainSel == Reccount())			  
			  			BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_1D )					  	
			  	End If 
			  	
		  Else 
		  
		  		//If ::nPagRec = 1 		  		
		  		If Len(::aMatriz) > 0 
		  			 BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1 + 1  	, 20  , 20  ,      BT_COPY,  Iif( ::nSetaSel1 == 1 ,  ::hB_Dwn_1_1 ,   ::hB_Dwn_1 ) )		  					  
		  		Else 		  		
		  			 BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1 + 1  	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_1D )		  					  
		  		End If 		  		
		  		//Else 
		  				//BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1 + 1  	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_1D )		  					  		  		  		
		  		//End If 		  
		  
		  		BT_DrawBitmap (hDC  ,  nHeight - 41 ,nCol1 + 1  	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_2D  )  
		  		BT_DrawBitmap (hDC  ,  nHeight - 61 ,nCol1  	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_3D  )  
		  		
		  		
		  End If   
		  
  Else 
  
  		BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_1D )
  		BT_DrawBitmap (hDC  ,  nHeight - 41 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_2D  ) 		    		
  		BT_DrawBitmap (hDC  ,  nHeight - 61 ,nCol1 - 1 	, 20  , 20  ,    BT_COPY,  ::hB_Dwn_3D  )  
  
  
  End If 		  
  
  
  If (!::lBrwEnabled) //.or. (!::lHasFocus)
  	  BT_DrawGradientFillVertical ( hDC,   0 , 0   , nWidth ,  nHeight , { 240, 240 , 240 } , { 240, 240 , 240 } ) 
  	  BT_DrawBitmap (hDC  ,  nHeight - 21 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_1D )
  		BT_DrawBitmap (hDC  ,  nHeight - 41 ,nCol1   	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_2D  ) 		    		
  		BT_DrawBitmap (hDC  ,  nHeight - 61 ,nCol1 - 1 	, 20  , 20  ,      BT_COPY,  ::hB_Dwn_3D  )    
  		BT_DrawBitmap (hDC  ,   1 ,   nCol1   	, 20  , 20  ,      BT_COPY,    ::hB_Up_1d )  
  		BT_DrawBitmap (hDC  ,  22  ,	nCol1+1  	, 20  , 20  ,      BT_COPY,    ::hB_Up_2d  )  
		  BT_DrawBitmap (hDC  ,  43  ,  nCol1+1 	, 20  , 20  ,      BT_COPY,    ::hB_Up_3d  )    
  End If 
  
  
  nTam1 := nHeight - 125
  BT_DrawGradientFillHorizontal ( hDC,   63 , 3  , 14 , nTam1 , { 188,188,188}  ,{217, 217 , 217} )  
  
    
  DrawVertL( hDc, 0 , nHeight , .t. ,::nOutlineColor )    
  DrawVertL( hDc, 19 , nHeight , .t. , ::nOutlineColor )
  DrawVertH( hDc, 0 , nWidth , .t. , ::nOutlineColor )    
  
  
  ::nTamVert := nTam1
  ::nTamVert -= (( ::nPagRec/nTam1) * nTam1 )
  
 
  If ::nTamVert < 0
  	 ::nTamVert := 60  
  End If 
  
  If (::nPageNum > 1)        
  	 	nIncremento := Int((::nPageNum/::nPagRec) * Abs(nTam1 - ::nTamVert)) 
  End If  	   	   	 
  
  
	If ::nBottomLine1 = 0  	 
  	 	  ::nBottomLine1 := ::nLinIniBarV+(  Abs(nTam1 - ::nTamVert) )  	 	
	End If
   
  If (!::lBrwEnabled) //.or. (!::lHasFocus)
  		BT_DrawGradientFillHorizontal (hDC, ::nLineTamV, 4 , 12 , ::nTamVert , {193,193,193},  {193,193,193}  )
  		
  Else   
  	  BT_DrawGradientFillVertical (hDC, ::nLineTamV, 4 , 12 , ::nTamVert ,  { 40,125,204 } , {44,137 , 224  } )  	    	  
  End If 
  
  nR1 := ::nLineTamV+::nTamVert
  
  For n1 := 1 To 4  
      BT_DrawSetPixel (hDC,  nR1 - n1   ,  4   ,  { 188,188,188 } )              
      BT_DrawSetPixel (hDC,  nR1 - n1   ,  15   ,  { 212,212,212 } )              
      BT_DrawSetPixel (hDC,  ::nLineTamV + n1 - 1   ,  4   ,  { 188,188,188 } )              
      BT_DrawSetPixel (hDC,  ::nLineTamV + n1 - 1   ,  15   ,  { 212,212,212 } )        
  Next  
  
  BT_DrawSetPixel (hDC,  nR1 - 1   ,  5   ,  { 188,188,188 } )        
  BT_DrawSetPixel (hDC,  nR1 - 2   ,  5   ,  { 188,188,188 } )        
  BT_DrawSetPixel (hDC,  nR1 - 1   ,  6   ,  { 188,188,188 } )           
  BT_DrawSetPixel (hDC,  ::nLineTamV   ,  14   ,  { 212,212,212 }  )        
  BT_DrawSetPixel (hDC,  ::nLineTamV + 1, 14   ,  { 212,212,212 }  )          
  BT_DrawSetPixel (hDC,  ::nLineTamV   ,  13   ,   { 212,212,212 } )            
  BT_DrawSetPixel (hDC,  ::nLineTamV+ 1 ,  5   ,  { 188,188,188 } )        
  BT_DrawSetPixel (hDC,  ::nLineTamV    ,  5   ,  { 188,188,188 } )          
  BT_DrawSetPixel (hDC,  ::nLineTamV    ,  6   ,  { 188,188,188 } )        
  BT_DrawSetPixel (hDC,  nR1 - 1   ,  14   ,  { 188,188,188 } )        
  BT_DrawSetPixel (hDC,  nR1 - 2   ,  14   ,  { 188,188,188 } )        
  BT_DrawSetPixel (hDC,  nR1 - 1   ,  13   ,  { 188,188,188 } )        
  DoEvents()  
  ::DrawDCtoDC (hDC2 , 0 , ::nWidthBrw ,  20 ,  nHeight, BT_SCALE, hDC , 0, 0 , 20, nHeight)				  
  BT_DeleteDC (BTstruct3 )  
	ReleaseDC( GetFormHandle( cForm1 ), hDC2  )


REturn 


METHOD xCalcVBar(lFrente) CLASS tBrowseDb

	Local nWidth   := 20
	Local nHeight  := BT_ClientAreaHeight(::cBrwMtr)
	Local nTam1 := 0
 	Local nPos := ::nLinIniBarV //63
 	Local nIncremento := 0   
  LOCAL BTstruct3	
   
   DEFAULT lFrente := .t. 
	

	If (::nPageNum > 1)              			
  		nTam1 := nHeight - 125
  	 	nIncremento := Int((::nPageNum/::nPagRec) * Abs(nTam1 - ::nTamVert))   	   	 	
  	 	::nLineTamV := (nPos+nIncremento) //- 1   	 	  	 	
  	 	::nPosy :=::nLineTamV  	 	  	 	
  	 	If ::lBrwEnabled
				 ::xDrawBarV( ::cBrwMtr ,  ::nPosy  )
			End If 
			::xAtuBrw()
   End If
   

Return


METHOD xDrawBloq( lDeleted ) CLASS tBrowseDb

	Local nTotTam := 0
	
	Aeval(::aTamanhos , { |a| nTotTam += a } )


	
	SetSelect(  GetDc(  GetFormHandle( ::cBrwMtr ))   , ; 
						::yRowIni + (((::nAtuLine - 1 ) * ::nItemSubHeight))   ,; 
						(::aMenuBarCor) , ;
						::aMatriz[::nMainSel] , ; 
						Len(::aMatriz[::nMainSel]) ,  ; 
						::aTamanhos , ; 
						::nItemSubHeight  ,;
						 GetProperty(::cBrwMtr,'Width')  , ;
						::yRowIni + (::nLinhaAnt  ) * nItemSubHeight   , ;
						::nScrollPosV  ,;
						ArrayRGB_TO_COLORREF(::aCorSub3)  , ;
						Iif(::nAntSel > 0 , ::aMatriz[::nAntSel] ,  ) , ; 
						::nScrollPosH , ; 
						::nColBrwIni , ;
						::nWidthBrw , ; 
						::nColleft , ; 
						::xFont2 , ; 
						ArrayRGB_TO_COLORREF(::aCorZebra) , ;
						::nAntSel ,;
						::aMtr_img    , ; 
						::nMainSel , ;
						::aTipos , ;
						ArrayRGB_TO_COLORREF(::aCorZebra2)  )					//23 

	::xAtuBrw()



Return 



METHOD yGoUp() CLASS tBrowseDb

  Local nItem
  Local nLinhaY := 0 
  Local nLastItem := 0
  Local nPrimeiro := 0
  
  
 
 	If ( Abs(::nScrollPosV) > 0) 				    
			nLastItem 		:= ( ::nItMax + (Abs(::nScrollPosV) / ::nItemSubHeight) )	+ 1									
			nPrimeiro 		:= (nLastItem - ::nItMax)+1					
	End 

  
  
  If ::nMainSel <= 0  		 		  
  	 DbGotop()
  	 ::nAtuLine := 1
     ::nMainSel := 1               
     Return       		 		   
  End If 
  
  
  If ( Len(::aMatriz) > ::nItMax) .And. (::nAtuLine <= 1 ) .And. (::nMainSel > 1)            // ( ::nMainSel <= ::nFirstItem  )         		 
  		 If !Bof()  		     
  		 		::nAntSel := ::nMainSel	
  		 		::nMainSel--	    				  		 		  		 		
  		 		
  		 		::nAtuLine := 1
  		 		::lEof     := .f.
  		 		
  		 		DbSkip( -1 )  		 		  		 		
  		 		If Empty( Alltrim(::aMatriz[ ::nMainSel    ][2] ) )
  		 		   ::xTrfMtr()		
   				End If             				
  		 		::nLinha1--			
  				::DoScroll(.f.)  			
  				DoEvents()  				  				
  				::CalcNPage()  				  				
		 			DoEvents()		 			
		 			::xAtuBrw()		 					 			
		 			::xCalcVBar()	 					 					 					 			
		 			
		 	 Else 
		 	 
		 	  
		 			
  		 End If
							
  Else 
      
  		::nAntSel := ::nMainSel						   		  		
  		::nAtuLine--  		
  		::nMainSel--
  		DbSkip( -1 )  		
  		
  		If ::nMainSel <= 0
  			 Return 
  		End If 
  		
  		If Empty( Alltrim(::aMatriz[ ::nMainSel    ][2] ) )
  		 		::xTrfMtr()		
   		End If            		
  		
  	//	msginfo( Codigo + '  ' + Str(Len(aMatriz)) )
  		nItem := ::nMainSel  	   		
  		::CalcNPage()  		
  		
  		If (::nMainSel <= 0)
  			 ::nMainSel := 1
  			 ::nAntSel  := 1
  			 ::nMainSel := 1    
  			 Return  		
  		End If 
  		
  	 nLinhaY := (::nMainSel - ::nFirstItem)   	 
  	 //::nScrollPosV:=0  	 
  	 ::nLinMouseAnt := nLinhaY+1  	 
  	 ::nLinBrw1 := ::yRowIni + (nLinhaY ) * ::nItemSubHeight   	   	 
  	 
		
		 ::lEof     := .f.
		
  	 
  	 
  	 
  	 SetSelect(  GetDc(  GetFormHandle(::cBrwName))   , ; 
						::yRowIni + (((::nAtuLine - 1 ) * ::nItemSubHeight))   ,; 
						 (::aMenuBarCor) , ;
						::aMatriz[nItem] , ; 
						Len(::aMatriz[nItem]) ,  ; 
						::aTamanhos , ; 
						::nItemSubHeight  ,;
						 GetProperty(::cBrwName,'Width')  , ;
						::yRowIni + (((::nAtuLine  ) * ::nItemSubHeight))   ,; 
						 ::nScrollPosV  ,;
						 ArrayRGB_TO_COLORREF(::aCorSub3)  , ;
						 Iif(::nAntSel > 0 , ::aMatriz[::nAntSel] ,  ) , ::nScrollPosH , ::nColbrwIni , ::nWidthBrw , ::nColleft , ::xFont2 , ArrayRGB_TO_COLORREF(::aCorZebra) , ::nAntSel ,  ::aMtr_Img , ;
						   nItem , ::aTipos , ArrayRGB_TO_COLORREF(::aCorZebra2) )
						 
		 
		
  	::nLinhaAnt:= nLinhaY		   		 
  
		::xAtuBrw()		 
	//	msginfo(Str( ::nAntSel  ) + '  ' + Str( ::nAtuLine  ))
		::xCalcVBar()

	End If					
	
REturn Self 




METHOD yGoDown() CLASS tBrowseDb

	Local nItem
	Local nLinha := 0
	Local nAt1 := Len(::aMatriz[1]) - 2
	Local nLastItem := ::nItMax
	Local nPrimeiro := 1
 
 
	If ::nMainSel == 0
 			::nMainSel := 1 
 	End If  
 	
 	
		
	If (Reccount() == ::nMainSel)				
			Return					
	End If 
 
 
 	If ( Abs(::nScrollPosV) > 0) 				    
			nLastItem 		:= ( ::nItMax + (Abs(::nScrollPosV) / ::nItemSubHeight) )	+ 1									
			nPrimeiro 		:= (nLastItem - ::nItMax)+1					
	End 


  If (::nAtuLine < ::nItMax ) .And. ( ::nMainSel < Len(::aMatriz) )    //(nItMax+nLinha1)       
  	 ::nAntSel := ::nMainSel						  	   	 
  	 ::nLinhaAnt := (::nMainsel - ::nFirstItem) + 1 	 
  	 ::nMainSel++	
  	 DbSkip()  	   	 
  	 ::nAtuLine++ 
  	 nItem	 := ::nMainSel  	   	 
  	 nLinha  := (::nMainsel - ::nFirstItem) + 1  	 
  	 ::CalcNPage()  	 
  	 ::nLinMouseAnt := nLinha  	   	   	 
  	 ::nLinBrw1 := ::yRowIni + (((nLinha - 1 ) * ::nItemSubHeight))  	   	   	 
		 SetSelect(  GetDc(  GetFormHandle(::cBrwName))   , ; 
								 ::yRowIni + (((::nAtuLine - 1 ) * ::nItemSubHeight))   ,; 
								 (::aMenuBarCor) , ;
								::aMatriz[nItem] , ; 
								Len(::aMatriz[nItem]) ,  ; 
								::aTamanhos , ; 
								::nItemSubHeight  ,;
								 GetProperty(::cBrwName,'Width')  , ;
								 ::yRowIni + ((::nAtuLine - 2) * ::nItemSubHeight)   , ;
								 ::nScrollPosV  ,;
								 ArrayRGB_TO_COLORREF(::aCorSub3)  , ;
								 Iif(::nAntSel > 0 , ::aMatriz[::nAntSel] ,  ) , ::nScrollPosH , ::nColbrwIni , ;
								 ::nWidthBrw , ::nColleft , ::xFont2 , ArrayRGB_TO_COLORREF(::aCorZebra) , ::nAntSel,   ::aMtr_Img , ;
								 nItem , ::aTipos , ArrayRGB_TO_COLORREF(::aCorZebra2) ) //21
								 
				 
			::xAtuBrw()		 
			::xCalcVBar()
		   
  Else  		
      If !Eof()      
      	  Dbskip()
      	  ::nAtuLine := ::nItMax       	  
      		::xTrfMtr()      		       		   			    		      		
   				::nAntSel := ::nMainSel	      	   				
   				::nMainSel++	  			  				   				
  				::nLinha1++  				  				
  				::DoScroll(.t.)  				
  				::CalcNPage() 				  				
		 			::xAtuBrw()
		 			::xCalcVBar()		 			
      End If   		   		 
  
  End If

Return 




METHOD xFillMtr( nReg1 , nReg2 ) CLASS tBrowseDb
 
  Local nQreg := 0 
  
  DbGoto(nReg1)
  
  While !Eof()			
				::xTrfMtr()						  
				DbSkip()
				nQReg++				
				If (nQReg >= ::nItMax)
						Exit				
				End If 				
	Enddo	
	
	DbGoto(nReg1)

Return Self 




METHOD xGoPage(nPage , lFrente , lUpdHeader ,lUpdateBarV , nLine1  , nLine2 ) CLASS tBrowseDb

   Local n1 := Mod( Len(::aMatriz) , ::nPagRec )
   Local nY1 := 0
   Local nY2 := 0   
   Local nIt1 := ::nItMax

   
   DEFAULT lFrente := .t.
   DEFAULT lUpdHeader := .t. 
   DEFAULT lUpdateBarV := .t.
   DEFAULT nLine1      := 0
   DEFAULT nLine2      := 0
   
   If  (nPage > 0) //.And. (nPage < nPagRec)
       
       nY1 := ( (nPage - 1) * nIt1) + 1       
       nY2 := nY1 + nIt1 - 1       
       
       If (nY2 > Len(::aMatriz))
    	   	::AddMtrz(  nY2 - Len(::aMatriz)  )
    	 End If        
              
       ::xFillMtr( nY1 , nY2 )              
       DbGoto(  nY2    )
       ::nMainSel 	 := nY1             
       //::nScrollPosV := 0        
       ::nLinha1     := 0
       
       If nPage > 1		       
		       ::nScrollPosV  := (::nItMax * ::nItemSubHeight)
		       ::nLinha1      := nY1
		       ::nScrollMouse := ((::nItMax - 1)  * ::nItemSubHeight)		       
		   End If		   		   
		   ::nScrollPosV := (((nPage - 1) * ::nItMax) * ::nItemSubHeight )
			 ::nFirstItem := nY1
			 ::nLastItem  := nY2			 
			 If !lFrente
			 		::nAtuLine     := 1
			 	  ::nMainSel 		 := nY1 			 			 	  			 	  
			 	  ::nLinMouseAnt := 1
			 	  ::nLinhaAnt 	 := 1
			 	  ::nAntSel 		 := nY1			 	  
			 	  ::nTopRec      := 0
			 Else 			 			 		
			 		::nAtuLine     := ::nItMax
			 		::nMainSel := nY2 			 			 					 					 		
			 		::nAntSel := nY2
  	 			::nLinhaAnt := nIt1 - 1  	 			
  	 			::nLinMouseAnt := nIt1   	 						 					 					 		
			 End If 			 
			 
			 If lUpdateBarV
			 	  ::xCalcVBar()			 
			 End If			 
			 
			 DoEvents()		
			 
			 If (nLine1 > 0)			     
			     ::nLinhaAnt    := nLine1
			     ::nLinMouseAnt := nLine1			 			     
			     If nLine2 > 0			     			     
			        ::nMainSel := nLine2 
			        ::nAntSel  := nLine2			     			        
			        ::nLinha1  := nLine2			     			        
			     End If 			     			     
			 End If 
			 
			 ::xRefresh( ::cBrwName , nY1 , nY2 , (lUpdHeader) .And. (lUpdateBarV)  )
   
   End If 

Return Self





METHOD xLimpSet1() CLASS tBrowseDb

	If ::nSetaSel1 > 0	
			::nSetaSel1 := 0			
			If ::lBrwEnabled	
				  ::xDrawBarV(::cBrwMtr , ::nWidthBrw ) //- 45 )  
			End If 	  
			DoEvents()			
			::xAtuBrw()
	End If 
	
	If ::nSetaSel2 > 0	
			::nSetaSel2 := 0			
			If ::lBrwEnabled	
				   ::xDrawBarH( ::cBrwMtr , ::nColBarraH  ,  .f. , .f.)
			End If 	  
			DoEvents()			
			::xAtuBrw()
	End If 
	
Return 



METHOD xProcCol( nColuna1 , lHighLight ) CLASS tBrowseDb

  Local nCol := 0
  Local n2 := Ascan(::aMapsCols , { |a| (a[2] <= nColuna1 ) .And. (a[3] >= nColuna1) } )
  Local lFrente := (n2 > ::nColumnSel)  
  
  DEFAULT lHighLight := .t.   
  
  If n2 > 0 
     If lHighLight
     		::nColumnSel := n2     
  	 		::xSelCol( ::nColumnSel , lFrente , .f. )	    	 		
  	 End If
  End If   
  nCol := n2

Return nCol 


METHOD xDrawCol( nCol_Origem ,  nColOrig1 , nSize1 ) CLASS tBrowseDb

  Local cTexto := ::aMtrCab[nCol_Origem]  
  Local hDc1 := GetDc( GetFormHandle(::cBrwMtr)   )
  
	
  ::nLastCol := 0  
  
  If ::hBit201 != Nil  
  	 BT_DrawBitmap (hDC1 , 1  ,  0  ,  ::nWidthBrw  , 29 ,  BT_COPY  , hBit202)  	
  	 BT_DrawBitmapAlphaBlend (hDC1 , 1  ,  nColOrig1  ,  nSize1  , 29 , 110 , BT_COPY  , ::hBit201) 	
  End If
  
  DoEvents()
	::yDcToDc( ::cBrwMtr , ::cParentWin , ::nLin1 , ::nCol1 )  				  
	
	ReleaseDC( GetFormHandle(::cBrwMtr)    , hDC1 )

Return 


METHOD xDrawSize( nCol_Origem ,  nColOrig1 , nSize1 ) CLASS tBrowseDb

  Local cTexto := ::aMtrCab[nCol_Origem]    
  LOCAL hDC, BTstruct, BTstruct2
  Local hDc2 := GetDc( GetFormHandle(::cBrwMtr)   )	
	Local aRGBcolor := WHITE
	Local hBitmap := BT_BitmapCreateNew ( nSize1,  29 , aRGBcolor )
	
	Local nTypeText    := BT_TEXT_TRANSPARENT  
	Local nAlingText   := BT_TEXT_CENTER + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

	
  BT_DrawGradientFillVertical (hDc2  ,  1  ,  nColOrig1  ,  nSize1,  28 , ::aHeadSel1 , ::aHeadSel2)              //        
  BT_DrawText ( hDC2 , 8  ,   nColOrig + int(nSize1/2)  ,   cTexto , ::xFont2, 9, WHITE,  BLACK, nTypeText, nAlingText, nOrientation )  
  
  
	::yDcToDc(::cBrwMtr , ::cParentWin , ::nLin1 , ::nCol1 )  				  	
	ReleaseDC( GetFormHandle(::cBrwMtr)    , hDC2 )	


Return 





METHOD xSearchLim( nColuna1 ) CLASS tBrowseDb
  Local n1 := Ascan(::aMapsCols , { |a| ( nColuna1 >= (a[3] - 10) ) .And. (  nColuna1 <= a[3]  )     }  )
Return n1


METHOD xProcVBar(nLinZ1) CLASS tBrowseDb

	Local nOp1 := 0	
		
		//msginfo(Str(  nLinZ1  ))
		
	If (nLinZ1 >= 2) .And. (nLinZ1 <= 20)				
		  nOp1 := 4						
	End If 				
		
	If (nLinZ1 >= 21) .And. (nLinZ1 <= 39)				
		  nOp1 := 5						
	End If 				
		
	If (nLinZ1 >= 40) .And. (nLinZ1 <= 58)				
		  nOp1 := 6						
	End If 				
		
		
	nLimite := ::nHeightBrw - 64
		
		
	If (nLinZ1 >= ::nHeightBrw - 20) .And. (nLinZ1 <= ::nHeightBrw)
		  nOp1 := 1						
	End If 				
		
	If (nLinZ1 >= ::nHeightBrw - 40) .And. (nLinZ1 <= ::nHeightBrw - 20)
		  nOp1 := 2						
	End If 				
		
		
	If (nLinZ1 >= ::nHeightBrw - 60) .And. (nLinZ1 <= ::nHeightBrw - 40)
		  nOp1 := 3						
	End If 						
				
		
	If (nOp1 == 0) .And. (nLinZ1 >= ::nLineTamV) .And. ( nLinZ1 <= (::nLineTamV+::nTamVert)) .And. (!::lBarraVMouse)				
			::nSetaSel1:=0																				
			::lBarraVMouse := .t.
			::xDrawBarV( ::cBrwMtr , ::nPosy  , .t. )										
			::xAtuBrw()		
	End If
		
		
	If (::nSetaSel1 != nOp1) .And. (nOp1 > 0)
	  	::nSetaSel2 := 0				
		  ::nSetaSel1 := nOp1									
			::xDrawBarV( ::cBrwMtr , ::nPosy  ) //- 45 )  													  
			::xAtuBrw()			 			 
	End If 
			 
			 
	If (nOp1 = 0) .And. (::lBarraVMouse) .And.   ( ( nLinZ1 > (::nLineTamV+::nTamVert)  ) .or. ( nLinZ1 < ::nLineTamV) )			 
			::lBarraVFocus := .f.			  				 		 
			::lBarraVMouse := .f.			 		 			 		 
			::xDrawBarV( ::cBrwMtr , ::nPosy  , .f. )										
			::xAtuBrw()			  	 			 
	End If 		


Return 


METHOD xProcHbar(  nLine1 , nCol11 , l_selected ) CLASS tBrowseDb

	Local nColZ1 := ::nHeightBrw - 24
	Local nRow, nCol
	Local n_qCols := ::xQtScrCol()
  Local nTamBar := ::xTamBarH(n_qCols)
  Local aR1 := ::GetCoord()
  
 
	If ( nLine1 > (nColZ1+5)  ) .And. ( nLine1 <= (nColZ1+25) )	.And. ( aR1[2] <= (::nCol1+::nWidthBrw)  )			  				  							
			::nSetaSel2 := 0	
			If (nCol11 <= 16) .And. ( nCol11 > 0)						
					::nSetaSel2 := 2																	
					//Left
		  End If 		  
		  If (nCol11 <= ::nWidthBrw) .And. ( nCol11 >= (::nWidthBrw - 16) )						
					::nSetaSel2 := 1
					// Right
		  End If 
		  ::xDrawBarH( ::cBrwMtr , ::nColBarraH , l_selected ) //- 45 )  			
			::xAtuBrw()			
	Else 	
	      If (::nSetaSel2 != 0)	      
	      		nSetaSel2 := 0
	      		DoEvents()
	      		::xDrawBarH( ::cBrwMtr , ::nColBarraH ) //- 45 )  
						DoEvents()						
						::xAtuBrw()
						DoEvents()
	      End If 		
	End If 



REturn 


METHOD xMoveHBar(nColini) CLASS tBrowseDb

	
	
	Local nRow , nCol , nCol2 	
	Local nColS := nColini	
	Local nQ1 := ::xQtScrCol()
	Local nSize1 := (nQ1 * ::nBarraIncr)
	Local nCol_b := 0	
	Local nAcum1 := 0	
	Local i	
	Local nPg_1  := 0	
	Local lMove1 := .f.
	Local nPageNum5 := 0
	
	
	 If (GetAsyncKeyState(VK_LBUTTON)) == 0				       		 					       		 				 		 
	 		 ::lBarraHFocus := .f.
	 		 ::lBarraHMouse := .f.
	 		 ::xDrawBarH( ::cBrwMtr , ::nColBarraH , .f. , .f. ) //- 45 )  									    				 				  						  						  
			 ::xAtuBrw()
	 		 ::nColSav1 := 0
		   Return
	End If		
	
		
	
	If (nColS != ::nColSav1) .And. (Abs( nColS - :: nColSav1 )	>= 10) .And. (nColS > :: nColSav1 ) .And. (!::l_EofBh)		
			If (::nColBarraH < (::nColBarIni+nSize1))					
					nPulo1 := Abs( nColS - ::nColSav1 ) //10 
					::nColBarraH += nPulo1 					
					If (::nColBarraH > (::nColBarIni+nSize1)  )
							::nColBarraH := ::nColBarIni+nSize1														
							::xScrolCol( .t. , .f. )																																																	  
							::xDrawBarH( ::cBrwMtr , ::nColBarraH , .t. , .f. ) //- 45 )  									    				 				  						  						  
						  ::xAtuBrw()
					Else							
						  ::xDrawBarH( ::cBrwMtr , ::nColBarraH , .t. , .f. ) //- 45 )  									    				 				  						  
						  ::xAtuBrw()
						  lMove1 := .t.						  
						  ::l_BofBh := .f.						  
					End If 	  					
					nPageNum5 := Int(  ::nColBarraH / ::nBarraIncr  )										
					If nPageNum5 > 0						 						 
						 If (::xPagNumH != nPageNum5)
						 		 
						 		 ::xPagNumH := nPageNum5						 		 
						 		 ::xScrolCol( .t. , .f. )																																											
						 		 
						 		 If ::xPagNumH >= nQ1
						 		 		If (::nColBarraH != (::nColBarIni + nSize1))
						 		 				nDif1 := Abs( ::nColBarraH - (::nColBarIni + nSize1 )   )
						 		 				::nColBarraH += nDif1
						 		 				::xDrawBarH( ::cBrwMtr , ::nColBarraH , .t. , .f. ) //- 45 )  									    				 				  						  
						 		 				::xAtuBrw()
						 		 		End If 
						 		 End If						 
						 		 
						 End If 					
					End If 														
					::nColSav1 := nColS 				  											
			End If	  		  
  Else 
  		 
  	  If (nColS != ::nColSav1) .And. (Abs( nColS - :: nColSav1 )	>= 10) .And. (nColS < :: nColSav1 )	  	     	       	     
  	     If (::nColBarraH > ::nColBarIni )  	     
  	     		 nPulo1 := Abs( nColS - ::nColSav1 ) //10 										
  	     		 If ((::nColBarraH - nPulo1 ) < ::nColBarIni)
  	     		     nPulo1 := ::nColBarraH - ::nColBarIni
  	     		 End If   	     		 
					   ::nColBarraH -= nPulo1 					   
					   ::xDrawBarH( ::cBrwMtr , ::nColBarraH , .t. , .f. ) //- 45 )  									    				 				  						  
					   ::xAtuBrw()						  
						 ::l_EofBh := .f.  	       	     
  	     Else   	         
  	         ::xScrolCol( .f. , .f. )								 		 	
  	     End If 
  	     
  	     ::nColSav1  := nColS 				  			  	       	     
  	     nPageNum5 := Int(  ::nColBarraH / ::nBarraIncr  )					
					
				 If (nPageNum5 >= 0) //.or. (::xPagNumH == 0)						 						 
				 
						 If (::xPagNumH > nPageNum5)						 		 
						 		 ::xPagNumH := nPageNum5						 		 
						 		 ::xScrolCol( .f. , .f. )								 		 
						 End If 					
					End If   	   
  	     
  	  End If
	End If
	
	
	

Return 

/*

METHOD bEventHandler(nHwnd , nMsg1) CLASS tBrowseDb

	If nMsg1 == 71	
		 if isWindowDefined(::cBrwMtr)
		 		 If ::isGridVisible
		 	       xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )				 	       
		 	       DoEvents()		 	       //msginfo('ok2')
		 	   End If
		 End If		 
	End If 

REturn
*/


METHOD GetCoord() CLASS tBrowseDb

	Local nRow := 0
	Local nCol := 0
	Local aR1		
	GetCursorPos (@nCol, @nRow)				
	aR1   := GetPos_ScreenToClient(   GetFormHandle( ::cBrwName )  , nRow  , nCol )						
Return aR1


METHOD UpdateColSel( lFrente )

	If (lFrente)
			::nColumnSel++
	Else 
			::nColumnSel--
	End If 	
	//DoEvents()

Return Self 


METHOD HandleMouse(nHWnd , nMsg) CLASS tBrowseDb

	Local cC1 := ''
	Local n1 
	Local nRow := 0
	Local nCol := 0
	Local nItem := 0
	Local lCtrl := (GetKeyState ( VK_CONTROL ) < 0)
	Local nLimite 
	Local i 
	Local nRowY1 := 0
	Local lDown	
	Local nColZ1  := ::nHeightBrw - 24			
	Local n_qCols := ::xQtScrCol()
  Local nTamBar := ::xTamBarH(n_qCols)    
  Local l_selected := .f.
  Local nTam1 := If( _isWindowDefined(::cBrwMtr) ,  Bt_ClientAreaHeight(::cBrwMtr) - 125 , 0)  
  Local nPosV1 := ::nLinIniBarV 
  Local nTotTam := 0 
	Local nTot2   := 0
	Local nIndice5
	Local n12
	Local hMgFont 
	Local nLastItem := 0
	Local nPrimeiro := 0
	Local nReg1
	Local nAtuAnt
	Local nFator1
	
	
	HMG_CleanLastVirtualKeyDown()	
	
	
	If (nMsg == WM_LBUTTONUP)				
			::nSetaSel1 := 0
			::nOptArrow := 0
			Return
	End if 
	
	
	If (nMsg == WM_MOUSEMOVE) .And. ( ::nOptArrow = 0)
						
			GetCursorPos (@nCol, @nRow)
			aR1 := ::GetCoord()
			
			If ::lBarraHFocus		   		 			
					If ( (nCol+nRow) != (::n_RowX+::n_ColY) )						
								::n_RowX := nRow
						    ::n_ColY := nCol								
						    ::lHasFocus := .t.
								::xMoveHBar(  Ar1[2]  )							  
					End If 
					Return							  
			Else
			    If ::lBarraVFocus			    			    
			    	 	If ( (nCol+nRow) != (::n_RowX+::n_ColY) )						    	 	
			    	 			::n_RowX := nRow
						    	::n_ColY := nCol										    	 				    	 	
						    	nRowY1 := Ar1[1]														    	 
						    	 
								  If ::nRowSav1 = 0
								   	::nRowSav1 := nRowY1
								  End If 								   
								  ::lHasFocus := .t.
								   
									::MoveVBar(nRowY1 ,  ::nRowSav1   )				  			    			    
									DoEvents()						    	 						    	 									 
						  End If   	 
						  Return
					Else
					    //msginfo( 'Here')
			    End If 		
			End If 
							
			
			//Header
			
			If (ar1[1] > 0) .And. (ar1[1] <= 30) .And.  (Ar1[2] < ::nWidthBrw)													
					If ((nPos1 := ::xSearchLim(  Ar1[2] + Abs(::nScrollPosH)    )) > 0)							
							SetWindowCursor( nHWnd   , 'CURSORSIZE' )				//	nHWnd
							::lHasFocus := .t.
							DoEvents()
							::lSizeMode := .t.						
							::lCursorSize := .t.
					Else 
					
								If ::lSizeMode					    
					    		SetWindowCursor( nHWnd , IDC_ARROW)
					    		DoEvents()
					    		::lSizeMode := .f.
					      End If
					    
					End If 					
					Return 
					
			End If 			
			
		
	
			// msginfo('z')	
			
			If (nRow >= ::nLin1) .And. (ar1[1] <= ( (::nHeightBrw) - 24) ) .And. (Ar1[2] < ::nWidthBrw)	 					  		
			
			
						If !::lBrwEnabled
							 Return						
						End If 
					  		
					  		
					 
					  If ::lCursorSize					 					  
					  	 SetWindowCursor( nHWnd, IDC_ARROW )						  	 					  	 
					  	 ::lCursorSize := .f.					  	 
					  	 ::lHasFocus := .t.
					  	 DoEvents()					  	 
					  End If
					  			
					  							  		
					  If (::lBarraHMouse) .or. (::lBarraHFocus)					  				
					  		::lBarraHMouse := .f.							  	
					  		::lBarraHFocus := .f.							  								
							 	::xDrawBarH( ::cBrwMtr , ::nColBarraH , .f. )
							 	DoEvents()							 	
							 	::lHasFocus := .t.
							 	::xAtuBrw()
						End If 									  
						
					//	msginfo('fy')
							
					  
					   If ((::lBarraVFocus) .or. (::lBarraVMouse )) .And. (!::lDragMode1)
							  ::lBarraVFocus := .f.			  				 		 
							  ::lBarraVMouse := .f. 
					  		::xDrawBarV( ::cBrwMtr , ::nPosy  , .f. )												//DoEvents()					  		
					  		::lHasFocus := .t.
					  		::xAtuBrw()
					  		DoEvents()
					  		
					  End If

					  
					  If (::nSetaSel1 > 0) .or. (::nSetaSel2 > 0)
							  ::nSetaSel1 := 0					  
							  ::nSetaSel2 := 0
							  SetWindowCursor( nHWnd , IDC_ARROW)
							  ::xDrawBarV( ::cBrwMtr , ::nPosy  , .f. )												//DoEvents()				  
							  ::xDrawBarH( ::cBrwMtr , ::nColBarraH , .f. )
							  ::lHasFocus := .t.
							  ::xAtuBrw()							  
							//  DoEvents()
						End If 
					  
					
					 Return
					  
		  End If 			  						
			
			
			If (Ar1[2] >= ::nWidthBrw)														
						
						aR2 := ::GetCoord()				
						nOp1	:= 0
						nLinZ := Ar2[1] //- ::yRowIni													
	
						If ( (nCol+nRow) != (::n_RowX+::n_ColY) )						
						     ::n_RowX := nRow
						     ::n_ColY := nCol						     						      
						     ::xProcVBar(  nLinZ   )														
						     DoEvents()
						     ::lHasFocus := .t.						    
							  Return 
					  
					  End If  
					  
					  
			Else 
				
					  ::xLimpSet1()						
					  
					  If ::lSizeMode					    
					  		SetWindowCursor( nHWnd , IDC_ARROW)
					  		DoEvents()
					  		::lSizeMode := .f.
					  		::lHasFocus := .t.
					  End If
					  
					  If (::lBarraVFocus) .And. (!::lDragMode1)
							  ::lBarraVFocus := .f.			  				 		 
							  ::lBarraVMouse := .f.
					  		::xDrawBarV( ::cBrwMtr , ::nPosy  , .f. )												//DoEvents()
					  		::lHasFocus := .t.
					  Else 					  			
					  		
					  End If
					  
					  
					  	//msginfo('z2')						 
					  
						If ( (nCol+nRow) != (::n_RowX+::n_ColY) )												
									::n_RowX := nRow
									::n_ColY := nCol						     									
									l_selected   := .f.									
									If ( aR1[1] > (nColZ1+5)  ) .And. ( aR1[1] <= (nColZ1+25) )										
											::lBarraHMouse := (aR1[2] >= ::nColBarraH)	.And. (aR1[2] <= (::nColBarraH+nTamBar) )
				     		 			::xProcHbar(  aR1[1] , ar1[2]  , ::lBarraHMouse  )																		     		 							     		 			
									Else
												::lBarraHFocus := .f.
												::lBarraHMouse := .f.
									End If 								 									
									::lHasFocus := .t.									 
									Return 									
									
						End If  
						
					  
					  
				End If 				
				
		  
	End If 
	
	
	
	
	
		If (nMsg == WM_LBUTTONDBLCLK)						
		
				
				/*
				aR2 := ::GetCoord()
				
				
				If (ar2[1] <= 30)	.And. ;
				   (ar2[2] <= ::nWidthBrw)				    			
						::xOrdene( ar2[2]+Abs(::nScrollPosH)   )					  
			  Else 			     						
			  
			  		MSGINFO(Str(::nMainSel) + ' ' + Str(::nLastItem ) + '   ' + Str(  Len( ::aMatriz ) ))
						
			  End If 											
			  
			  */
			  
				Return 
				
		End If 	
	
	
	
		If (nMsg == WM_LBUTTONDOWN) //.or. (nMsg == WM_LBUTTONDBLCLK)
				
			  If ::nMainSel <= Len(::aMatriz)
				//	 ::nAntSel := ::nMainSel				
				End If
				
				GetCursorPos (@nCol, @nRow)								
				aR1   := GetPos_ScreenToClient(   GetFormHandle( ::cBrwMtr )  , nRow - (::yRowIni+::nItemSubHeight) , nCol )																					
				aR2   := GetPos_ScreenToClient(   GetFormHandle( ::cBrwMtr )  , nRow  , nCol )													
				nRowY := Int(aR2[1]/ ::nItemSubHeight ) 								
				nV1   := Val(  Transform(aR2[1]/ ::nItemSubHeight , "99999,99999999")   )
				
				if ::nScrollposV > 0 
				//	 msginfo('f')
				end if
				
				//msginfo(Str( ::nAtuLine  ) + '  ' + Str( ::GetItem( aR2[1] - 30  )    ))
				
				//Down 
				If (aR2[1] >= ::nHeightBrw - 20) .And. (aR2[1] <= ::nHeightBrw) .And. ( Len(::aMatriz) > 0) .And. ;
				    (aR2[2] >= ::nWidthBrw  )
				
						For i := 1 To 255
				         GetAsyncKeyState(i)
				    Next i 
				
						While ((GetAsyncKeyState(VK_LBUTTON)) != 0)						      						      
									::yGoDown()
									SysWait(0.07)
									
									For i := 1 To 255
				         			GetAsyncKeyState(i)
				    			Next i 													
									
						Enddo			  		
						HMG_CleanLastMouseMessage()                                      				  
   		 	 		DoEvents()			  		
			  		Return 
			  		
				End If 				
				
				
				If (aR2[1] >= ::nHeightBrw - 40) .And. (aR2[1] <= ::nHeightBrw - 20) .And. ( Len(::aMatriz) > 0) .And. ;
				    (aR2[2] >= (::nWidthBrw - 20) ) .And. ( ::nPagRec > 1 )				    								    	
				 								    				    
						While ((GetAsyncKeyState(VK_LBUTTON)) != 0)																		
										For i := 1 To 255
				         				GetAsyncKeyState(i)
				    				Next i 							
										If ::nPageNum < ::nPagRec
											 ::nPageNum++						 	
										   ::xGoPage(::nPageNum  , .f.) 				       									   					   											 											 
										Else 						       		    
										    ::xGoLastPag()
								    End If 				   									 								   								 				
				    				SysWait(0.05)				    				
						Enddo			  							
						SysWait(0.09)
						 HMG_CleanLastMouseMessage()                                      				  
   		 	 		DoEvents()	
			  		Return 			  		
			  
				End If 			
				
				
				If (aR2[1] >= ::nHeightBrw - 60) .And. (aR2[1] <= ::nHeightBrw - 40) .And. ( Len(::aMatriz) > 0) .And. ;
				    (aR2[2] >= (::nWidthBrw - 20) ) 
				    ::xGoLastPag()					    
            HMG_CleanLastMouseMessage()                                      				  
   		 	 		DoEvents()				    				       		 	 		
   		 	 		Return 
				End If
				
				//Up
				
				If ((aR2[1] >= 2) .And. (aR2[1] <= 20) .And. ( Len(::aMatriz) > 0) .And. ;
				    (aR2[2] >= (::nWidthBrw - 20) )	)							    
						For i := 1 To 255
				         GetAsyncKeyState(i)
				    Next i 								    
						While ((GetAsyncKeyState(VK_LBUTTON)) != 0)
									::yGoUp()
									SysWait(0.07)
									
									For i := 1 To 255
				         			GetAsyncKeyState(i)
				    			Next i 				
									
									
						Enddo			  	
			  		Return 
				End If 				
				
				
				If ((aR2[1] >= 21) .And. (aR2[1] <= 39) .And. ( Len(::aMatriz) > 0) .And. (::nPagRec > 1) .And. ;
				   (aR2[2] >= (::nWidthBrw - 20) )	)			
				   	
				    
						While ((GetAsyncKeyState(VK_LBUTTON)) != 0)						
									 
									For i := 1 To 255
							         GetAsyncKeyState(i)
							    Next i 			
									 
							 		If ::nPageNum > 1
										 ::nPageNum--
										 ::xGoPage(::nPageNum, .f.) 				       											       														 
									Else 
										 ::xGoFirst()		
									End If 								 									
									SysWait(0.05)									
						Enddo			  					  								
						HMG_CleanLastMouseMessage()                                      				  
   		 	 		DoEvents()	
			  		Return 
			  		
				End If 				
				
				
				If ((aR2[1] >= 40) .And. (aR2[1] <= 58) .And. ( Len(::aMatriz) > 0) .And.  ;
				    (aR2[2] >= (::nWidthBrw - 20) )	)							    
						::xGoFirst()								
						HMG_CleanLastMouseMessage()                                      				  
   		 	 		DoEvents()							
						Return 
				End If 								
				
				
				If (!::lBarraHFocus) .And. (::nSetaSel1 == 0)
						If ( aR2[1] > (nColZ1+5)  ) .And. ( aR2[1] <= (nColZ1+25) )	.And. (ar2[2] <= (::nCol1+::nWidthBrw)  )			  				  															
								  If (ar2[2] >= ::nColBarraH) .And. (ar1[2] <= (::nColBarraH+nTamBar)    )													
											l_selected   := .t.
				     		 			::lBarraHFocus := .t.
				     		 			::nColSav1 := aR2[2]
				     		 			::xDrawBarH( ::cBrwMtr , ::nColBarraH , .t. , .f. ) //- 45 )  	
				     		 			DoEvents()
				     		 			Return
				     		 	Else 
				     		 			::lBarraHFocus := .f.		
				     		 	End If		
									
						 Else
								::lBarraHFocus := .f.
						 End If 								 				
				End If				
				
				
				If (::lBarraVMouse) .And. (ar2[2] >= ( (::nWidthBrw) - 20)  )	
						::lBarraVFocus := ::lBarraVMouse
				    Return 			
				End If 
			
				
				
				If (::lSizeMode) .And. (::nSetaSel1 == 0)				     
					  ::xProcCol( ar2[2]+Abs(::nScrollPosH) )					  					  
					  For i := 1 To 255
				         GetAsyncKeyState(i)
				    Next i     				    				    
				    hMgFont := HMG_CreateFont(  GetDC( GetFormHandle(::cBrwMtr))  , ::xFont2 , 10 , .f., .f., .f., .f. )
				    nColSav  := ar2[2] 				    
				    nColOrig := ::aMapsCols[::nColumnSel][2] - Abs(::nScrollPosH) 
					 	nTam1    := ::aMapsCols[::nColumnSel][4]  
					 	nSaveTam1 := ::aMapsCols[::nColumnSel][4]  
					 	nSaveTam := ::aMapsCols[::nColumnSel][4]  					 	
					 	::lCursorSize := .t.					  
					  While .t. 
					  			GetCursorPos (@nCol, @nRow)				    
			    				aR2   := GetPos_ScreenToClient(   GetFormHandle( ::cBrwMtr )  , nRow - 22  , nCol )									    							    				
			    				If (aR2[2] != nColSav)		    							    							    				
			    						nTam1 += (ar2[2] - nColSav)
			    						nColSav := ar2[2]			    						
			    						SetWindowCursor( GetFormHandle( ::cParentWin )   , 'CURSORSIZE' )								    						
											n12 := GetTextWidth( GetDC( GetFormHandle(::cBrwMtr))  , Alltrim(::aMapsCols[::nColumnSel][1]) , hMgFont )
					    				If (nColOrig+nTam1 > 0) .And. ( (nColOrig+nTam1) <= (::nWidthBrw) ) .And. (nTam1 >= 0)			    							  					    							  
					    						DrawColumny(GetDC( GetFormHandle(::cBrwMtr)) , ;
					    						nColOrig , nTam1 , 0 ,Alltrim(::aMapsCols[::nColumnSel][1]) , ArrayRGB_TO_COLORREF(::yColorFontHeader)  , ::xFont2 , ;
					    						::nItemSubHeight  , ::nLastCol , ;
					    						ArrayRGB_TO_COLORREF(::aHeadSel1) , ;
			 										ArrayRGB_TO_COLORREF(::aHeadSel2) , ( (nTam1+nColOrig) < ::aMapsCols[::nColumnSel][3]) , nSaveTam )				    							  			    							  			 															 												
					    						::yDcToDc(::cBrwMtr , ::cParentWin , ::nLin1 , ::nCol1 )  							    							  
					    						SysWait(0.05)
					    				End If
			    				End If 					  			
					  		  If (GetAsyncKeyState(VK_LBUTTON)) == 0				       		 					       		 			
										  Exit
									End If		
					  Enddo					  
					  SetWindowCursor( GetFormHandle( ::cParentWin )  , IDC_ARROW)
					  DoEvents()
					  ::lSizeMode := .f.					   
					  If (nSaveTam != nTam1) 					   						
								nTot2 := 0								
								n1    := ::nColleft 						
								If ::nColleft == 0
									 n1:=1						
								End If 								
								
								While n1 <= Len(::aMapsCols)								
											If (n1 != ::nColumnSel)
												 nTot2 += ::aMapsCols[n1][4]
											End If 
											n1++
								Enddo													
								
								
								If ( ::nColumnSel = Len(::aMapsCols)  ) .And. (::nColumnSel > 1)
								    nIndice5 := ::nColumnSel - 1								    								    
								    If (::aMapsCols[nIndice5][3] + nTam1 ) > ::nWidthBrw 
								    	  msginfo('Tamanho invalido!')										 
					   						DoEvents()				 					   		
					 		  				::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )				
							  				CursorNormal()						 
												::lSizeMode := .f.								
												Return								    
								    End If 
								    
								End If 																
								
									
								If nTam1 > nTot2
										msginfo('Tamanho invalido!')										 
					   				DoEvents()				 					   		
					 		  		::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )				
							  		CursorNormal()						 
										::lSizeMode := .f.								
										Return
								End If 
					   		
					   
					   		::aTamanhos[ ::nColumnSel ] := nTam1
					   		DoEvents()				
					   		::xMapCols()					   		
					   		
					   		DoEvents()				
					   		
					 		  ::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )				
							  CursorNormal()						 			
							  
							  If (::nColumnSel = Len(::aMtrCab))
					   			 ::xSelCol( ::nColumnSel , .t.  , .t. )	    	 		
					   		End If 							  
						 Else 	  
						 
						    DoEvents()									      
					      ::nColumnSel:=0					   		
					 		  ::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )				
							  SetWindowCursor( nHWnd , IDC_ARROW)
					    	DoEvents()
					    	::lSizeMode := .f.						 						 
					   			
					   End If 					   					 
				
						 Return 
						 
				End If 				
				
				//Header Click 

				If (ar2[1] <= 30) .And. (!::lSizeMode) .And. (::nSetaSel1 == 0)	.And. (::nColumnSel > 0)					 						 
					 ::xProcCol( ar2[2]+Abs(::nScrollPosH) )					
					 hBit202 := BT_BitmapCaptureWindow (::cBrwMtr , 1 , 0 , ::nWidthBrw  , 29 )						 	
					 nColOrigem := ::nColumnSel					 
					 nColOrig := ::aMapsCols[nColOrigem][2]-Abs(::nScrollPosH)  
					 nTam1    := ::aMapsCols[nColOrigem][4]  					 
					 ::hBit201 := BT_BitmapCaptureWindow ( ::cBrwMtr , 1 , nColOrig , nTam1 - 1  , 29 )					 					 
					 nColSav  := ar2[2] 
					 n_Colsel := 0					 					 					 
					 For i := 1 To 255
				         GetAsyncKeyState(i)
				   Next i    
					 lok1 := .f.											 
					 While .t.
			 						GetCursorPos (@nCol, @nRow)				    
			    				aR2   := GetPos_ScreenToClient(   GetFormHandle(::cBrwMtr )  , nRow - 22  , nCol )									    				
			    				If (ar2[2] != nColSav) .And. (Abs( aR2[2] - nColSav )	> 5)		    					    				
			    						::lHighCol1 := .f.			    				
					    				If nColSav == 0					    					 
					    				Else 
					    				   nColOrig += (ar2[2] - nColSav)
					    				End If						    				
							 				nCol1z := ::xProcCol( ar2[2]+Abs(::nScrollPosH)  , .f. )						 											 											 				
							 				If (nCol1z != ::nColumnSel) .And. (nCol1z > 0)							 				
							 					 lFrente1 := 	(nCol1z > ::nColumnSel)
							 					 ::nColumnSel := nCol1z 
							 					 ::xSelCol( ::nColumnSel , lFrente1   , .t. )	    	 		
							 					 DoEvents()													 					 
							 				End If 							 											 											 				
							 				lok1 := .t.							 				
							 				nColSav := ar2[2]			    				
							 				::xDrawCol( nColOrigem ,  nColOrig , nTam1 )							 											 					 							 											 				
							 		End If 							 									 							 			
					 				 If (GetAsyncKeyState(VK_LBUTTON)) == 0				       		 					       		 			
										  Exit
									End If				 					 					 
					 
					 Enddo					 
					 
					 If (::nColumnSel > 0) .And. (nColOrigem != ::nColumnSel)					 
					 		 ::lHighCol1 := .t.						 		 					 		 
					 		 CursorWait() 
					 		 ::xTroquePos(nColOrigem  , ::nColumnSel , '' )					 					 		 
					 		 DoEvents()				
					 		 ::xRefresh( ::cBrwMtr , ::nFirstItem , ::nLastItem   )				
							 CursorNormal()						 										 
							 ::xMapCols()
							 ::hBit201 := Nil
							 hBit202 := Nil												 
					 Else 			 					 		
					 			If lOk1					 					 					
					 				 ::lHighCol1 := .t.	
							     DoEvents()									      
							     ::nColumnSel:=0					   		
							 		 ::xRefresh(::cBrwMtr , ::nFirstItem , ::nLastItem   )				
									 CursorNormal()						 			
								End If					 	
					 End If					 
					 Return				   									 
					 
				End If 				
				
				
				If ::nSetaSel1 > 0									
					 
					 *//Down					 
					 
					 ::nOptArrow := ::nSetaSel1					
					 PostMessage( nHWnd , WM_MOUSEMOVE , 0,0)										 
					 Return
					 
				End If 				
				
				If (::nSetaSel2 > 0)				
						For i := 1 To 255
								GetAsyncKeyState(i)
						Next i
				    While (.t.)
									SysWait(0.10)								
									//msginfo( '2' )
									::xScrolCol(::nSetaSel2 == 1 )																	
									If (GetAsyncKeyState(VK_LBUTTON)) == 0
											Exit
									End If
						End
						Return
				End If 
				
				
				//::nMainSel := ::nFirstItem + (nRowY - 1)												
			//	aR3 := ::GetCoord()				
				
			//	Aeval(::aTamanhos , { |a| nTotTam += a } )				
				
				
				
				If (::nMainSel > 0) .And. ( ::nMainSel <= Len( ::aMatriz  )) .And.  ; //(nCol >= nCol1) .And. (nCol <= (nCol1+::nWidthBrw)  ) .And. ;
				  (nRow >= ::nLin1) .And. (ar2[1] <= ( (::nHeightBrw) - 24) )				  				  				  				  					
				  
				  
				  	nReg1          := ::nMainSel						  			
						nAtuAnt 			 := ::nAtuLine
				  	DbSelectArea( ::cAlias )
				  	
				  	If ( Abs(::nScrollPosV) > 0)				  				  					  	
						  	If ((::nAtuLine == 1) .or. (::nAtuLine == ::nItMax   ) .or. (  ::nMainSel == Reccount()   )  )				  									  	
						  			::nAtuLine     := ::GetItem( aR2[1] - 30  ) 
						  			nRowY          := ::nAtuLine				  				  																		
						  			If nAtuAnt == 1 				  			
						  				  ::nMainSel += (	nRowY - 1  )				  									  				  						  				  
						  				  //msginfo(Str( nRowY ))
						  			Else						  				
						  					nFator1 := ::nItMax - 1						  											  					
						  					If ::nTopRec > 0
						  						  nQ1 := ((nReg1 - ::nTopRec) - 	nRowY)+1
						  						  ::nMainSel -= nQ1						  					
						  					Else 
						  					   ::nMainSel -= ( nFator1 -  (nRowY - 1) )				  									  					
						  					End If 						  					
						  			
						  			End If 				  								  	
						  	Else 						  	
						  			::nAtuLine  := ::GetItem( aR2[1] - 30  ) 
						  			nRowY       := ::nAtuLine
						  			nQ1   		  := (nRowY - nAtuAnt )						  									  									  		
						  	   	::nMainSel +=  nQ1						  	    								  	   	
						  	End If 
						  	
						Else						
								::nAtuLine     := ::GetItem( aR2[1] - 30  )  
								::nMainSel     := ::nAtuLine  					
								nRowY   	     := ::nAtuLine								
						End If 	  	
				  	
												
						DbSelectArea( ::cAlias )
						DbGoto(::aMatriz[::nMainSel][1] )																		
						::nLinBrw1 := (::yRowIni) + (nRowY - 1 ) * ::nItemSubHeight																								
						
						
						SetSelect(  GetDc(  GetFormHandle(::cBrwMtr))   , ; // 1
						::nLinBrw1  ,;  //2
						 (::aMenuBarCor) , ; //3
						::aMatriz[::nMainSel] , ;  //4
						Len(::aMatriz[::nMainSel])     ,  ;  //5
						::aTamanhos , ;  //6
						::nItemSubHeight  ,; //7
						 GetProperty(::cBrwMtr  ,'Width')  , ; //8
						 (::yRowIni)+ ( ::nLinMouseAnt - 1  ) * ::nItemSubHeight   , ; //9
						  0 /*::nScrollPosV*/   ,; //10
						 ArrayRGB_TO_COLORREF(::aCorSub3)  , ; //11
						 Iif(::nAntSel > 0 , ::aMatriz[::nAntSel] ,  )  ,  ; 
						 ::nScrollPosH ,  ; 
						 ::nColBrwIni ,  ; 
						 ::nWidthBrw , ; 
						 ::nColleft ,  ; 
						 ::xFont2 , ;
						 ArrayRGB_TO_COLORREF(::aCorZebra) , ;
						 ::nAntSel , ;
						 ::aMtr_Img, ; 
						 ::nMainSel, ; 
						 ::aTipos , ; 
						 ArrayRGB_TO_COLORREF(::aCorZebra2) ) 						 						 
						
						 
						 ::nAntSel 			:= ::nMainSel										 						 
						 ::nLinMouseAnt := nRowY						 						 						 
						 
						 ::xDrawBarV( ::cBrwMtr , ::nPosy  ) //- 45 )  						 						 
						 ::xAtuBrw()
						 DoEvents()										 
						 
						 SysWait(0.05)
						 
				Else 
				     //msginfo( 'p' )		 
				End If 			
		End If 


Return


METHOD GetItem( nLinha ) CLASS tBrowseDb

	Local nItem   := 0
	Local n1    	:= nLinha - 30
	Local nLine1  := 1
	Local nZ1     := 1
	Local nP1			:= 0
	Local nP2     := 0
	Local lFound  := .f. 
	
	
	While (nZ1 <= ::nItMax) .And. (!lFound)
	
			   nP1 := ( nZ1 - 1) * ::nItemSubHeight
			   nP2 := nP1 			 + ::nItemSubHeight			   
			   
			   If (nLinha >= nP1) .And. (nLinha <=  nP2)			     
			      lFound := .t.
			      Exit
			   End If 
				 nZ1++		
	Enddo
	
	
	If lFound
			nItem := nZ1	
	End If 

Return nItem


METHOD xOrdene( nColuna ) CLASS tBrowseDb
	

	CursorWait()
				
  ::xProcCol( nColuna )										
	::nOrdemCol := ::nColumnSel + 1 																						  	
	::xOrdemCol(::nOrdemCol)											  
	DoEvents()	
	::xGoFirst()	  				  	
	CursorNormal()


Return 






METHOD xTroquePos(nColSele , nColTarget , cCabec1 ) CLASS tBrowseDb

	
	Local cC1 :=  ::aMtrCab[nColTarget]
	Local nN1  := ::aTamanhos[nColTarget]
	Local cTp  := ::aTipos[nColTarget]
	Local nH1
	Local c1  := ::aMtrCab[nColSele]
	Local n2  := ::aTamanhos[nColSele]
	Local c3  := ::aTipos[nColSele]
	Local n1  := Len(::aMtrCab)
	Local nSom1 := 0
	Local y1 := 1
	Local aM1 , aM2
	Local cElem:=''
	Local x := 0

	
	
	CursorWait()
	Adel( ::aMtrCab ,  nColSele )
	Asize(::aMtrCab , n1 - 1)
	Adel( ::aTamanhos ,  nColSele )
	Asize(::aTamanhos , n1 - 1)
	Adel( ::aTipos ,  nColSele )
	Asize(::aTipos , n1 - 1)
	
  DoEvents()

	Hb_Ains( ::aMtrCab 	 ,   nColTarget  , c1 , .t.  )
	Hb_Ains( ::aTamanhos ,  nColTarget  , n2 , .t.  )
	Hb_Ains( ::aTipos    ,  nColTarget  , c3 , .t.  )

  DoEvents()	
  nSom1 := 20  
  aM2 := {}	 	 
	::aMapsCols := {}
	 
	For n1 :=  1 To Len(::aMtrCab)
	 
	 			Aadd(::aMapsCols , { ::aMtrCab[n1] , nSom1   ,  nSom1+ ::aTamanhos[n1] , ::aTamanhos[n1] } )	 				 				 			
	 			nSom1 += (::aTamanhos[n1]+1)
	 
	Next 
	 
	y1 := Len(::aMtrCab)+4 
	
	For i := 1 To Len(::aMatriz)
	
	    aM1 := {  ::aMatriz[i][1]   }	    
	    cElem:=''	     	    
	    For x := 2 To y1	    			
	    		If (x != (nColSele+1) ) 		     		
	    				Aadd(aM1 , ::aMatriz[i][x])	     			     		
	    		Else
	    		    cElem := ::aMatriz[i][x]
	    		End If 	    
	    Next
	    
	    hb_AIns( aM1 ,  nColTarget + 1 , cElem , .T.)
		  Aadd(aM2 , aM1)		 
	
	Next	 
	 
	 
	::aMatriz := AClone(aM2)	 
	CursorNormal()
    


REturn .t.




METHOD MoveVBar( nPar1 ) CLASS tBrowseDb
		   //MoveVBar(nRowY1 ,  ::nPosy  )


	  Local aR2 
	  Local nRow,nCol
	  Local nY1    := 0//nPar2
	  Local nRowY1 := nPar1	  
		Local lDown  := .f.
		Local nPosV1 := ::nLinIniBarV 
		Local n1 := 0
		Local nHeight  := BT_ClientAreaHeight(::cBrwMtr) - ::nTamVert - 125
		Local nPercent := 0
		Local lMove := .f.
		
		If (GetAsyncKeyState(VK_LBUTTON)) == 0													  
			  ::lBarraVFocus := .f.							
				::lDragMode1 := .f.				       		 															
				Return										
		End If
		
		
		
		If (Abs(nRowY1 - ::nRowSav1) >= 10) 
		
				If (nRowY1 > ::nRowSav1)		    										    										    						
				
					 lDown := .t. 				    						
				   nY1 	 := Abs(::nRowSav1 - nRowY1)				    						   				    						   				   
				   ::nPosy  += nY1							   
				   ::l_BofV := .f. 				   				   

				   
				   If (::nPosy  > ::nBottomLine1)
				   		 ::nPosy  := ::nBottomLine1
				   End If 				    						   				   
				   
				Else 				    																
				
					 nY1 	 := Abs(::nRowSav1 - nRowY1)						 				
				   ::nPosy  -= nY1				    					
				   ::l_EofV := .f. 				   
				   
				   If ::nPosy  <= nPosV1				   	  
				   	  ::nPosy  := nPosV1				    						   	  
				   End If 
				   
				End If 				    										
				
				::lDragMode1 := .t.								
				lMove := .t.				
				::nRowSav1 := nRowY1	
				::nLineTamV := ::nPosy 				    						   				    						   				    						   					    					
			  ::xDrawBarV( ::cBrwMtr , ::nPosy  ,  .t. , .f. ) //- 45 )  			  
				::xAtuBrw()
			  //msginfo(Str(::nPageNum))
				
	
	End If			
	
	
	
	If (lMove)		
			If (lDown) 			 												
				If !::l_EofV			 																	
				   If (::nPosy  != ::nBottomLine1)				  		
				  		nPercent := Val(Transform( (( (::nPosy  - ::nLinIniBarV) )/nHeight) , "999999.999999999999999999999999" ))			  
					  	::nPageNum := Int(nPercent * ::nPagRec)
							::xGoPage(::nPageNum, .t. ,, .f.) 				   
							::xAtuBrw()
							DoEvents()							 	 							 	 						 	 	 
					 Else										    			 											    			 			
						 	::xGoLastPag()										    			 		  
						 	::l_EofV := .t.
					End If  	 						 		  		
					
				End If	 								    			 	
			Else
			    If !::l_BofV							    			
			    
							If (::nPosy  != nPosV1)					 	 			 	 		 		 
			 	 		 		 	nPercent := Val(Transform( (( (::nPosy  - ::nLinIniBarV) )/nHeight) , "999999.999999999999999999999999" ))			  
					  			::nPageNum := Int(nPercent * ::nPagRec)					  			
					  			::xGoPage(::nPageNum, .t. ,, .f.) 				   
							 	 	::xAtuBrw()
							 	 	DoEvents()			 	 		 		 
			 	 		  Else
			 	 		  	 ::xGoFirst()	
			 	 		  	 ::l_BofV := .t.							    			 	 		  
			 	 		  End If 
			 	 		  
			 	 		  ::xAtuBrw()
			 	 		  
			 	 	End If			 	 	
			End If 		
	End If
	


Return 

METHOD DoScroll(lDown) CLASS tBrowseDb


	Local aR1   := GetPos_ClientToScreen(   GetFormHandle(  ::cBrwMtr )  , 0,0)
	Local nitem := 35	
	Local nUlt  := ::nItMax - 1
	Local n5 	  := (( ::nRegOut1 * ::nItemSubHeight )) +  ::nItemSubHeight	
	Local nIz1  := ::nItMax
	Local nTotTam := 0
	
	
	Aeval(::aTamanhos , { |a| nTotTam += a } )	
	
	::aCorSub3 := ::aCorZebra2

   
	If lDown	
   
  	// ::nLinBrw1 := ::yRowIni + ( nUlt  * ::nItemSubHeight)   
  	
  	 ::nLinBrw1 := ::yRowIni + ( ::nAtuLine  * ::nItemSubHeight)   
   
   	 DrawItem( GetDc(  GetFormHandle(::cBrwMtr)) , ;
   		 ::yRowIni + ( nUlt  * ::nItemSubHeight) ,;
   		   .F. , ;
   		     ::aMatriz[::nAntSel] , ; 
   		     ::aTamanhos , ; 
   		     Len(::aMatriz[1]) , ;
   		      ::nItemSubHeight , ;
   		      ::aCorSub2 , ;
   		      GetProperty( ::cBrwMtr ,'Width') , ;
   		      ::aCorSub3 ,  ;
   		      ::nScrollPosH , ; 
   		      ::nColBrwIni  , ;  
   		      ::nWidthBrw ,  ; 
   		      ::nColleft , ; 
   		      ArrayRGB_TO_COLORREF(::aCorZebra) , ; 
   		      ::nAntSel , ;
   		       ::xFont2 , ;
   		      { ArrayRGB_TO_COLORREF(::yColorFont),  ArrayRGB_TO_COLORREF(::CorDisabled) }  ,  ; 
   		      ::aMatriz[::nAntSel][  Len(::aMatriz[1]) - 2] ,  ;
   		       ::aMatriz[::nAntSel][  Len(::aMatriz[1]) - 1]   ,; 
   		      ::aMtr_Img , ; 
   		      ::aTipos, ; 
   		      ArrayRGB_TO_COLORREF(::aCorSub3) , ; 
   		      ::nWidthBrw - ( nTotTam + 23   )   )					//23  )
   
   	

   		nitem := ::nMainSel   		
   		::nScrollPosV -= ::nItemSubHeight   		   		
   		::nScrollMouse -= ::nItemSubHeight   		   		
   		SetVScrollValue( GetFormHandle( ::cBrwMtr ), -(::nItemSubHeight)  ,  1 , 0 ,  ::yRowIni + ::nItemSubHeight  ,   GetProperty(::cBrwMtr ,'Width') - 20  ,GetProperty(::cBrwMtr ,'Height') - n5 )   		
   		::nLinMouseAnt := nUlt + 1
   		
   		::nAntSel 			:= ::nMainSel
   		
   		DrawItem( GetDc(  GetFormHandle(::cBrwMtr)) , ; //1
   		 ::yRowIni + ( nUlt  * ::nItemSubHeight) ,; // 2
   		   .t. , ; //3
   		     ::aMatriz[nItem] , ; 
   		     ::aTamanhos , ; 
   		     Len(::aMatriz[nItem])   , ;
   		      ::nItemSubHeight , ;
   		      ::aMenuBarCor , ;
   		      GetProperty(::cBrwMtr,'Width') , ;
   		       ::aCorSub3 , ; 
   		       ::nScrollPosH , ; 
   		       ::nColBrwIni , ; 
   		       ::nWidthBrw , ; 
   		       ::nColleft,; 
   		       ArrayRGB_TO_COLORREF(::aCorZebra)  , ; 
   		       ::nAntSel , ;
   		       ::xFont2 ,   ;
   		       { ArrayRGB_TO_COLORREF(::yColorFont),  ArrayRGB_TO_COLORREF(::CorDisabled) }   , ;
   		       ::aMatriz[nItem][  Len(::aMatriz[1]) - 2   ] ,  ; 
   		       ::aMatriz[nItem][  Len(::aMatriz[1]) - 1]  , ;
   		       ::aMtr_Img , ;
   		       ::aTipos,  ; 
   		       ArrayRGB_TO_COLORREF(::aCorSub3) , ; 
   		       ::nWidthBrw - ( nTotTam + 23   )   )					//23 )
   		
   	
   		
   		
   		::xAtuBrw()
   	//	::nFirstItem++
   	//::nLastItem := ::nFirstItem+nIz1-1 
   		
   		
   		
   Else 
   
   			
   			::nLinBrw1 := ::yRowIni
   			
   			DrawItem( GetDc(  GetFormHandle(::cBrwMtr)) , ;
   		  ::yRowIni ,;
   		   .F. , ;
   		     ::aMatriz[::nAntSel] , ; 
   		     ::aTamanhos , ; 
   		     Len(::aMatriz[1]) , ;
   		      ::nItemSubHeight , ;
   		      ::aCorSub2 , ;
   		      GetProperty(::cBrwMtr,'Width') , ;
   		      ::aCorSub3 , ::nScrollPosH , ::nColBrwIni ,::nWidthBrw , ::nColleft , ArrayRGB_TO_COLORREF(::aCorZebra) , ::nAntSel , ::xFont2 ,  ;
   		      { ArrayRGB_TO_COLORREF(::yColorFont),  ArrayRGB_TO_COLORREF(::CorDisabled) } ,  ::aMatriz[::nAntSel][  Len(::aMatriz[1]) - 2] , ::aMatriz[::nAntSel][  Len(::aMatriz[1]) - 1]  , ;
   		      ::aMtr_Img , ::aTipos, ArrayRGB_TO_COLORREF(::aCorSub3) ,  ::nWidthBrw - ( nTotTam + 23   )   )					//23  )
   		         		      
   		      
   		      ::nLinMouseAnt := 1
   		      		       	
   		       	
   		::nScrollPosV  -= ::nItemSubHeight   		   		
   		::nScrollMouse += ::nItemSubHeight   		   		   		
   		SetVScrollValue( GetFormHandle( ::cBrwMtr), (::nItemSubHeight)  ,  1 , 0 ,  ::yRowIni    ,   GetProperty(::cBrwMtr ,'Width') - 20  ,GetProperty(::cBrwMtr ,'Height') - n5 )
   		DoEvents()   		
   	
     
   		nItem 		:= ::nMainSel   		
   		::nTopRec := nItem
   		
   		::nAntSel 			:= ::nMainSel
   		
   		DbSelectArea(::cAlias)   		
   		   		
   		If ( (nItem + ::nItMax) <= RecCount() )   				
   				::nTopRec := 0
   		End If 
   		
   		DrawItem( GetDc(  GetFormHandle(::cBrwMtr)) , ; //1
   		  ::yRowIni ,; // 2
   		   .t. , ; //3
   		     ::aMatriz[nItem] , ; 
   		     ::aTamanhos , ; 
   		     Len(::aMatriz[nItem]) , ;
   		      ::nItemSubHeight , ;
   		      ::aMenuBarCor , ;
   		      GetProperty(::cBrwMtr,'Width') , ;
   		       ::aCorSub3 , ::nScrollPosH , ::nColBrwIni , ::nWidthBrw , ::nColleft , ArrayRGB_TO_COLORREF(::aCorZebra)  , ::nAntSel , ::xFont2 ,  ;
   		      { ArrayRGB_TO_COLORREF(::yColorFont),  ArrayRGB_TO_COLORREF(::CorDisabled) }  , ::aMatriz[nItem][  Len(::aMatriz[1]) - 2] , ::aMatriz[nItem][  Len(::aMatriz[1]) - 1]  ,;
   		      ::aMtr_Img , ::aTipos, ArrayRGB_TO_COLORREF(::aCorSub3)  , ::nWidthBrw - ( nTotTam + 23   )   )					//23  )
   
   
   		::xAtuBrw()
   
   
   
   End If
   
   

Return 



METHOD DrawDCtoDC (hDC1, Row1, Col1, Width1, Height1, Mode_Stretch, hDC2, Row2, Col2, Width2, Height2) CLASS tBrowseDb
   BT_DRAW_HDC_TO_HDC (hDC1, Col1, Row1, Width1, Height1, hDC2, Col2, Row2, Width2, Height2, Mode_Stretch, BT_HDC_OPAQUE, 0)
Return Nil




#pragma BEGINDUMP


	#include "SET_COMPILE_HMG_UNICODE.ch"
	#include "HMG_UNICODE.h"
	#include <windows.h>
	#include <winuser.h>
	#include "hbapi.h"
	#include "hbdefs.h"
	#include <commctrl.h>
	#include <tchar.h>
	#include <wingdi.h>
	#include <math.h>
	#include "hbvm.h"
	#include <shlobj.h>



#define BT_TEXT_OPAQUE      0
#define BT_TEXT_TRANSPARENT 1

#define BT_TEXT_BOLD        2
#define BT_TEXT_ITALIC      4
#define BT_TEXT_UNDERLINE   8
#define BT_TEXT_STRIKEOUT   16


// Align
#define BT_TEXT_LEFT        0
#define BT_TEXT_CENTER      6
#define BT_TEXT_RIGHT       2

#define BT_TEXT_TOP         0  
#define BT_TEXT_BASELINE   24
#define BT_TEXT_BOTTOM      8 


static void GoToPoint( HDC hDC, int ix, int iy );

//static void DrawLegend();
static void DrawLegend( HDC hDC1 , HBITMAP hBitmap , INT nLinha1 , COLORREF color_transp );
void WndBoxDraw( HDC hDC, RECT *rct, HPEN hPUpLeft, HPEN hPBotRit, int nLineStyle, BOOL bHeader );


	HB_FUNC( CURSORNORMAL )
											{
											hb_retnl( (LONG) SetCursor(LoadCursor(0, IDC_ARROW)) );
												}
												
												
HB_FUNC( REFRESHCURSOR )
											{
											hb_retnl( (LONG) ShowCursor(  TRUE ) );
												}												


	HB_FUNC( CURSORWAIT )
											{
											hb_retnl( (LONG) SetCursor(LoadCursor(0, IDC_WAIT)) );
												}




HB_FUNC(  DRAWITEM )

{
  
	HDC hDC1 = (HDC) HMG_parnl (1); 
	INT nRow = (INT) hb_parni(2);    
	HBITMAP hBitmap;
	BOOL lSelected = hb_parl(3);	
	INT n1 = 0;
	INT nTotal = (INT) hb_parni(6);	
	INT nColtxt = 20;	
	INT nItSubH = (INT) hb_parni(7);
	INT nWidth1 = 1;
	INT nW1 = (INT) hb_parni(9);
	INT iFirstChar = 0;   
	TCHAR *p25 = _TEXT("False");	
	TCHAR *cImage1;
	TCHAR *cPng = _TEXT("1");		
	TCHAR *cTipo ; 
	RECT rect15;	
	RECT rect0;
	RECT rectzebra;	
	HBRUSH hbrush2 = CreateSolidBrush( (COLORREF) RGB(hb_parvni(8 , 1),
	hb_parvni(8, 2),
	hb_parvni(8, 3)) );	
	HBRUSH hbrush3 = CreateSolidBrush( (COLORREF) RGB(hb_parvni(10 , 1),
	hb_parvni(10, 2),
	hb_parvni(10, 3)) );	
	COLORREF ColorRegBlq  = (COLORREF) RGB(214,214,214);
  COLORREF ColorFontBlq = (COLORREF) RGB(255,255,255);
  COLORREF Colorwhite = (COLORREF) RGB(255,255,255);
  COLORREF Colorsely = (COLORREF) RGB(hb_parvni(8 , 1),
	hb_parvni(8, 2),
	hb_parvni(8, 3));	
  HBRUSH hbrushblq = CreateSolidBrush( ColorRegBlq);  		
	INT nW_Scr = (INT) hb_parni(11);	
	INT nCol1 = (INT) hb_parni(12);	
	INT nWidth_t = (INT) hb_parni(13);	
	INT nColleft = (INT) hb_parni(14);	
	nColtxt = nCol1+nW_Scr;	
	INT nTotw = 0;
  COLORREF Colorzebra = (COLORREF) hb_parni(15);      
  COLORREF Colorzebra2 = (COLORREF) hb_parni(23);    
  HBRUSH hbrushz  = CreateSolidBrush( Colorzebra );  
  HBRUSH hbrushz5 = CreateSolidBrush( Colorzebra2 );  
  INT nSelAnt = (INT) hb_parni(16);  
  HFONT hFont; 
  HFONT hFont2; 
  TCHAR *cFontName = (TCHAR*) HMG_parc (17);  
  INT nFontSize;
  INT nBold, nItalic, nUnderline, nStrikeOut;
  INT nOrientation = 0;
  BOOL lBloq1 = hb_parl(19);  
  BOOL lHigh1 = hb_parl(20);   
  nFontSize   = 10;
  nBold       = FW_NORMAL;
  nItalic     =  0;
  nUnderline  =  0;
  nStrikeOut  =  0;
  nFontSize = nFontSize * GetDeviceCaps (hDC1 , LOGPIXELSY) / 72;   
          
  hFont = CreateFont (0-nFontSize, 6 , nOrientation, nOrientation, nBold, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
           
 hFont2 = CreateFont (0-nFontSize, 6 , nOrientation, nOrientation, FW_BOLD, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
           
  COLORREF Color5 = (COLORREF) RGB(102,102,106);	         
  COLORREF ColorRed = (COLORREF) RGB(128,0,0);
	SelectObject(hDC1 , hFont);
	SetTextColor( hDC1  ,  Color5 );
	SetRect(&rect15,  0   ,  nRow  ,  nWidth_t , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   
	
	if (lSelected)
	 {
	
		FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrush2 );	
	  }
		else		
		 {
		 FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrush3 );					 
		 }
		 
		
		
	cImage1 = HMG_parvc(4 , nTotal);
	cImage1[4] = '\0';   			   		  		 
	
	
	for (n1 = 1; n1 <= nTotal ; n1++)
   {	  
 
 	 	 nWidth1 = hb_parvni(5 , n1 - 1);	 //(INT) sz.cx *     	      					  			 	 	  	 	 
 	 	 nTotw = (nWidth_t - nColtxt);   
 	 	 
 	 	 	if ((n1 > 1) && (    n1 < (nTotal - 2)  ))
					{
				   cTipo = HMG_parvc(22, n1 - 1) ;				   		 
					 cTipo[1] = '\0';
				  }
			  			
		 if (nTotw > 0) 	 
		 
		 			{
		 			
		 				if (nWidth1 > nTotw)
			  			  {
			  			  nWidth1 = nTotw;
			  			  } 		 	
	 		 			SetRect(&rect15,  nColtxt   , nRow , nColtxt+nWidth1  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  	 		 				 		 			
	 		 						
						if (nColleft > 0)
							  {			   		  		       
								if ( n1 == (nColleft+1)	)	
									 {									 
									  SetRect(&rect15,  nColtxt+3   , nRow , nColtxt+nWidth1  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
									 }
								else
								   {
								    SetRect(&rect15,  nColtxt   , nRow , nColtxt+nWidth1  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
								   }								   	 
									 
	 		 			    }	
	 		 			    
	 		 			
	 		 			if (nSelAnt > 0) 
	 		 			   {
	 		 			     if (nSelAnt % 2 == 0)    
	 		 			          {
	 		 			         if (n1 == nTotal)
	 		 			             {
	 		 			              SetRect(&rect15,  nColtxt   , nRow , nWidth_t  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  	 		 			             
	 		 			             }
	 		 			             
	 		 			             if (n1 == 1)
			 		 			             {
			 		 			              SetRect(&rect15,  0   , nRow , nColtxt+nWidth1+3  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  	 		 			             
			 		 			             }
			 		 			             
	 		 			             FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushz );				 		 			         	 		 			         
	 		 			         
	 		 			          }
	 		 			     else
	 		 			          {
	 		 			          
		 		 			         if (n1 == nTotal)
		 		 			             {
		 		 			              SetRect(&rect15,  nColtxt   , nRow , nWidth_t  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  	 		 			             
		 		 			             }
		 		 			             
		 		 			             if (n1 == 1)
				 		 			             {
				 		 			              SetRect(&rect15,  0   , nRow , nColtxt+nWidth1+3  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  	 		 			             
				 		 			             }
				 		 			             
		 		 			         		 FillRect(hDC1 ,&rect15 ,(HBRUSH) CreateSolidBrush( Colorzebra2 )  );				 		 			         
		 		 			         		 
		 		 			         		 	
	 		 			             //FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushz5 );		
	 		 			         	
	 		 			           	}	
	 		 			           	
	 		 			           	if (lSelected)
	 		 			           			{
	 		 			           			FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrush2 );	
	 		 			           			}	 		 			           			
	 		 			           	
	 		 			         
	 		 			   }    
	 		 			     
	 		 			     
	 		 				 if (!lBloq1)	 
									 {											     														    
									   SetTextColor( hDC1  ,  ColorFontBlq );	
										 FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushblq );	 	 		     											     														     
											if (n1 == 1)
													 {
														SetRect(&rect0 ,  0 , nRow  ,  23   , nRow+nItSubH  );	 													   		   			
														FillRect(hDC1 ,&rect0 ,(HBRUSH) hbrushblq );	 	 		     											     														         
													 }														     
														     
									 }												     
									 
									  if ((lHigh1) && (lBloq1))
											   { 
											   		SelectObject(hDC1 , hFont2);																										   		      
											      SetTextColor( hDC1  ,  ColorRed );
											  }  
	 		 			
	 		 			if (n1 < (nTotal - 2))
	 		 			    {
			 		 			if ((lstrcmp(cTipo ,_TEXT("B")) == 0) || (lstrcmp(cTipo ,_TEXT("I")) == 0))			  							       	 		 			
			 		 			      {
			 		 			      
			 		 			       	SetRect(&rect15,  nColtxt   , nRow , nColtxt+nWidth1 - 5  , nRow+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
			 		 			        DrawText( hDC1 ,  HMG_parvc(4, n1) , -1 ,  &rect15 , DT_RIGHT );
			 		 			      }
			 		 			    else
			 		 			      {
			 		 					    DrawText( hDC1 ,  HMG_parvc(4, n1) , -1 ,  &rect15 , DT_NOCLIP | DT_WORD_ELLIPSIS  );			  			
			 		 					   }  
	 		 					}
	 		 					
	 		 					 
	 		 			nColtxt += nWidth1;
 		 			
 		 			}
 
   }
   
    if ( lstrcmp(cImage1 ,_TEXT("IMG=") ) == 0)
				{	  
				 	  cImage1 = HMG_parvc(4, nTotal);
				    cPng = &cImage1[4];										  								   		          
				 		iFirstChar = atoi(cPng);   								   			          
				 		hBitmap = (INT) hb_parvnl(21, iFirstChar);     																						 		
				 		
				 		if (hBitmap != NULL)								   		    
						     {				 		     
						     
						     if (lSelected)
						        { 
						         DrawLegend( hDC1 , hBitmap , nRow , Colorsely);
						        }
						     else						        
						        { 						        
								     if (nSelAnt % 2 == 0)  								   		       
								         {								   		     
								          DrawLegend( hDC1 , hBitmap ,nRow , Colorzebra);
								         }
								     else
								         { 
								         	DrawLegend( hDC1 , hBitmap , nRow, Colorzebra2);
								         } 						        
						        }    						         
					       }					
				 }			 
   
}




HB_FUNC(  SETSELECT )

{

	HDC hDC1 = (HDC) HMG_parnl (1); 
	INT nRow = (INT) hb_parni(2);    
	INT nWidth1 = 0;
	INT nColtxt = 0;	
	INT nTotw = 1024;	
	INT iFirstChar = 0;   
	TCHAR *cTexto;	
	TCHAR *cTipo ; 
	TCHAR *cImage1;
	TCHAR *cPng = _TEXT("1");	
	HBRUSH hbrush2 = CreateSolidBrush( (COLORREF) RGB(hb_parvni(3 , 1),
	hb_parvni(3, 2),
	hb_parvni(3, 3)) );	
	RECT rect15;
	RECT rect0;	
	RECT rect21;	
	RECT rectzebra;	
	RECT recttot;		
	COLORREF ColorSel1 = (COLORREF) RGB(hb_parvni(3 , 1),
	hb_parvni(3, 2), 
	hb_parvni(3, 3));	
	
	
  COLORREF ColorWhite = (COLORREF) RGB(255,255,255);
  INT nItemsel = (INT) hb_parni(21);	
	INT nItSubH = (INT) hb_parni(7);	
	INT nW1     = (INT) hb_parni(8);
	INT nScrool1 =  0 ; // (INT) hb_parni(10);	
	INT nScrool2 = (INT) hb_parni(13);	
	INT nCol1 = (INT) hb_parni(14);	
	INT nBrwWidth = (INT) hb_parni(15);
	INT nColleft = (INT) hb_parni(16);	
	BOOL lBloq1 = FALSE;
	BOOL lHigh1 = FALSE;	
	INT n1 = 0;
	INT nTotal = (INT) hb_parni(5);	
	INT nClear = (INT) hb_parni(9);	
	nTotw = nBrwWidth;
	HBRUSH hbrush3 = CreateSolidBrush( (COLORREF) RGB(hb_parvni(11 , 1),
	hb_parvni(11, 2),
	hb_parvni(11, 3)) );	
	nColtxt = nScrool2+nCol1;	
	HFONT hFont;
	HFONT hFont2;
	HBITMAP hBitmap;
	//COLORREF Color5 = (COLORREF) RGB(117,124,131);	
	COLORREF Color5 = (COLORREF) RGB(102,102,106);	
	SetTextColor( hDC1  ,  Color5 );
  COLORREF Color7 = (COLORREF) RGB(32,22,209);	
	HBRUSH hbrush7 = CreateSolidBrush( Color7 );
	INT nFontSize;
  INT nBold, nItalic, nUnderline, nStrikeOut;
  INT nOrientation = 0;  
   TCHAR *cFontName = (TCHAR*) HMG_parc (17);  
  COLORREF Colorzebra = (COLORREF) hb_parni(18);    
  COLORREF Colorzebra2 = (COLORREF) hb_parni(23);    
  
  HBRUSH hbrushz = CreateSolidBrush( Colorzebra );
  HBRUSH hbrushz2 = CreateSolidBrush( Colorzebra2 );
  INT nSelAnt = (INT) hb_parni(19);
  COLORREF ColorRegBlq  = (COLORREF) RGB(214,214,214);
  COLORREF ColorFontBlq = (COLORREF) RGB(255,255,255);  
  COLORREF ColorRed  = (COLORREF) RGB(128,0,0);
  HBRUSH hbrushblq = CreateSolidBrush( ColorRegBlq);
  nFontSize   = 10;
  nBold       = FW_NORMAL;
  nItalic     =  0;
  nUnderline  =  0;
  nStrikeOut  =  0;
  nFontSize = nFontSize * GetDeviceCaps (hDC1, LOGPIXELSY) / 72;
  
   
        
   hFont = CreateFont (0-nFontSize, 6 , nOrientation, nOrientation, nBold, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
           
  
  hFont2 = CreateFont (0-nFontSize, 6 , nOrientation, nOrientation, FW_BOLD, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
 
 	SelectObject(hDC1 , hFont);	
	nTotw -= nScrool2+nCol1;
	
	
	//nClear = 1;
	
	if (nClear >= 0)		
	
		 { 
			
	 		lBloq1 = hb_parvl(12, nTotal - 2);
	 		lHigh1 = hb_parvl(12, nTotal - 1);
	 		
	 		SelectObject(hDC1 , hFont);
	 		SetTextColor( hDC1  ,  Color5 );
	 		
	 		cImage1 = HMG_parvc(12, nTotal);
	 		cImage1[4] = '\0';   			   		  		 	 			 		
	 
	 
	 		SetRect(&rect15,  0   ,  nClear+nScrool1  ,   nBrwWidth  , nClear+nItSubH+nScrool1  );	   	   				  		    	  		      	   		  	   	   		  	   
	 		SetRect(&recttot,  0   ,  nClear+nScrool1  ,   nBrwWidth  , nClear+nItSubH+nScrool1  );	   	   				  		    	  		      	   		  	   	   		  	   
	 		FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushz );			 			 		
	 		
	 		
			for (n1 = 2; n1 <= nTotal ; n1++)
			  {	  			  
			  			nWidth1 = hb_parvni(6 , n1 - 1);	 //(INT) sz.cx *     	      					  						  			
			  			nTotw = (nBrwWidth - nColtxt);   
			  			
			  			if ((n1 > 1) && (    n1 < (nTotal - 2)  ))
						  	  {
						  		 cTipo = HMG_parvc(22, n1 - 1) ;				   		 
						   		 cTipo[1] = '\0';
						   	  }
			  			
			  			if (nTotw > 0)
			  			   {			  			
			  			   
			  			   			if (nWidth1 > nTotw)
			  			   			{
			  			   					nWidth1 = nTotw;
			  			   			}			  							
			  										
						  			  if (nColleft > 0)
												   {			   		  		       
												   if ( n1 == (nColleft+1)	)													   		  {
												   		  		    
												   		  	SetRect(&rect15,  nColtxt+3   , nClear+nScrool1 , nColtxt+nWidth1  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												   		  	
												   		  }												   		  		 
												   else
												   		   
												   		  { 
												   		   SetRect(&rect15,  nColtxt   , nClear+nScrool1 , nColtxt+nWidth1  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
												   		  }
												   		  		 
												   		 }
											else	  		     
												   {											    
											     			SetRect(&rect15,  nColtxt   , nClear+nScrool1 , nColtxt+nWidth1  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
											    }	
											    
											 
											     if ( n1 == nTotal )
												   		  { 												   		   				
												   		   SetRect(&rect15,  nColtxt   , nClear+nScrool1 , /*nColtxt+nWidth1*/   nBrwWidth  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												   		   			
												   		 }											     					 
											     		    
											    
											    
											if (nSelAnt % 2 == 0) 
													{																																									
													  if (n1 == 2	)													  
															  {															  
															   SetRect(&rect21,  0  , nClear+nScrool1 , nColtxt+nWidth1  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
															   FillRect(hDC1 ,&rect21  ,(HBRUSH) hbrushz );	 										    											   																	  
															  }
													  else
													      {			
													   		FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushz );	 										    											   		
													   		}
													   		
													}       													
											else 
											   { 
											   
											   		 if (n1 == 2	)													  
															  {															  
															   SetRect(&rect21,  0  , nClear+nScrool1 , nColtxt+nWidth1  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
															   FillRect(hDC1 ,&rect21  ,(HBRUSH) hbrushz2 );	 										    											   																	  
															   //MessageBox(0, _TEXT("Error!")  , _TEXT("Error!"),MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);									 		
															  }
													  else
													      {			
													   		FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushz2 );	 										    											   		
													   		}
													   		
											   
											   }															
											 if (!lBloq1)	 
											     {											     
											     
											       if (n1 == 2)
											          {											          
											           SetRect(&rect0,  0  , nClear+nScrool1 , 23  , nClear+nScrool1+nItSubH   );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
											           FillRect(hDC1 , &rect0 ,(HBRUSH) hbrushblq );	 	 		     											     											          											          
											          }
											     
												     	SetTextColor( hDC1  ,  ColorFontBlq    );	
											     		FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrushblq );	 	 		     											     
											     }							
											     
											     
											if ((lHigh1) && (lBloq1))
													{ 													
														SelectObject(hDC1 , hFont2);
	 													SetTextColor( hDC1  ,  ColorRed );
													}
													
													
			  							if (n1 < (nTotal - 2) )			  							
			  							    { 
			  							    
			  							       if ((lstrcmp(cTipo ,_TEXT("B")) == 0) || (lstrcmp(cTipo ,_TEXT("I")) == 0))			  							       
			  							           { 
			  							           	SetRect(&rect15,  nColtxt   , nClear+nScrool1 , nColtxt+nWidth1 - 5  , nClear+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  
			  							           	DrawText( hDC1 ,  HMG_parvc(12, n1) , -1 ,  &rect15 , DT_RIGHT );
			  							           
			  							           } 
			  							       else    
			  							           {
			  							           DrawText( hDC1 ,  HMG_parvc(12, n1) , -1 ,  &rect15 , DT_NOCLIP | DT_WORD_ELLIPSIS  );			  			
			  							           }
			  							    } 
			  							    
			  							    
			  							nColtxt += nWidth1;			  							
			  							
			  			   }				
			  
			   }
			   
			   /*
			   
			   if ( lstrcmp(cImage1 ,_TEXT("IMG=") ) == 0)
							{	  
							 	  cImage1 = HMG_parvc(12, nTotal);
							    cPng = &cImage1[4];										  								   		          
							 		iFirstChar = atoi(cPng);   								   			          
							 		hBitmap = (INT) hb_parvnl(20, iFirstChar);     																						 		
							 		
							 		if (hBitmap != NULL)								   		    
						 		     {				 		     
						 		     if (nItemsel % 2 == 0)  								   		       
						 		         {								   		     
						 		          DrawLegend( hDC1 , hBitmap , nClear+nScrool1 , ColorWhite);
						 		         }
						 		     else
						 		         { 
						 		         	DrawLegend( hDC1 , hBitmap , nClear+nScrool1 , Colorzebra);
						 		         } 
				  		       }															 		        							 		
							 }			 
							 */
							 
							 
			      if ( lstrcmp(cImage1 ,_TEXT("IMG=") ) == 0)
							{	  
							 	  cImage1 = HMG_parvc(12, nTotal);
							    cPng = &cImage1[4];										  								   		          
							 		iFirstChar = atoi(cPng);   								   			          
							 		hBitmap = (INT) hb_parvnl(20, iFirstChar);     																						 									 		
							 		
							 		
							 		if (iFirstChar == 1)
							 				{
							 				//	MessageBox(0, _TEXT("Error!")  , _TEXT("Error!"),MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);									 		
							 				}
							 				
							 		
							 		if (hBitmap != NULL)								   		    
						 		     {				 		     						 		     						 		     
						 		       if (!lBloq1)	
						 		      		{
						 		      		DrawLegend( hDC1 , hBitmap , nClear+nScrool1 , ColorRegBlq);				 		         						 		      				 		      		
						 		      		}
						 		    	 else
						 		          {						 		     
									 		     if (nItemsel % 2 == 0)  								   		       
									 		         {								   		     
									 		          DrawLegend( hDC1 , hBitmap , nClear+nScrool1 ,  Colorzebra2  );									 		          
									 		         }
									 		     else
									 		         { 
									 		        // MessageBox(0, _TEXT("Error!")  , _TEXT("Error!"),MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);									 			
									 		         DrawLegend( hDC1 , hBitmap , nClear+nScrool1 , Colorzebra );									 		         	
									 		         } 
									 		    }						 		         
				  		       }															 		        							 		
							 }								 
	 
	  }
	
	
	 SetRect(&rect15  ,  0   ,  nRow+nScrool1  ,   nBrwWidth   , nRow+nItSubH+nScrool1  );	   	   				  		    	  		      	   		  	   	   		  	    	                                                //nw1//	 
	 SetRect(&recttot ,  0   ,  nRow+nScrool1  ,   nBrwWidth   , nRow+nItSubH+nScrool1  );	   	   				  		    	  		      	   		  	   	   		  	    	                                                //nw1//	 
	 
	 
	 
	 FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrush2 );	 	 
	 nColtxt = nScrool2+nCol1;	 
	 nTotw = nScrool2+nCol1;
	 
	 lBloq1 = hb_parvl(4, nTotal - 2);
	 lHigh1 = hb_parvl(4, nTotal - 1);
	 
	 
	 SelectObject(hDC1 , hFont);
	 SetTextColor( hDC1  ,  Color5 );
	 
	 cImage1 = HMG_parvc(4, nTotal);
	 cImage1[4] = '\0';   			   		  		 
	 
	 
	 if (!lBloq1)	
	     {	 			
	 		FillRect(hDC1 ,&rect15 ,(HBRUSH) hbrush7 );	 	 
	 		 }	
	 
	 	 
	 
	  for (n1 = 2; n1 <= nTotal ; n1++)
	  {	  
	  			
			  	nWidth1 = hb_parvni(6 , n1 - 1);	 //(INT) sz.cx *     	      					  						  						  	
			  	nTotw = (nBrwWidth - nColtxt);   			  				  	
			  	
			  	if ((n1 > 1) && (    n1 < (nTotal - 2) ))
			  	    {
			  		 cTipo = HMG_parvc(22, n1 - 1) ;				   		 
			   		 cTipo[1] = '\0';
			   		 }			   	
			  	
			  	
			  	if (nTotw > 0)
			  	    {
						  	if (nWidth1 <= nTotw)			  				  	
						  	    {						  	    	
						  	    	
						  	    	if (nColleft > 0)
												  {			   		  		       												  
												   if ( n1 == (nColleft+1)	)	
												   		  {
												   		  	SetRect(&rect15,  nColtxt+3   , nRow+nScrool1 , nColtxt+nWidth1  , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												   		  												   		  
												   		  }												   		  												   		  
												   else
												        {
												        	SetRect(&rect15,  nColtxt   , nRow+nScrool1 , nColtxt+nWidth1  , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												         
												        }		  
						  	    	
						  	    			}						  	    	
						  	    			
						  	    	if (!lBloq1)	 
											     {											     
											     SetTextColor( hDC1  ,  ColorFontBlq );	
											     
											     if (n1 == 2)
											          {											          
											           SetRect(&rect0,  0  , nRow+nScrool1 , 23  , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  											         
											          }
											     
											     }					
											     
											 
											  
											 		if ((lHigh1) && (lBloq1))
													{ 													
														SelectObject(hDC1 , hFont2);
	 													SetTextColor( hDC1  ,  ColorRed );
													}         
						  	    	
								  	    	if (n1 < (nTotal - 2)  )
								  	    	    { 
								  	    	    
								  	    	       if ((lstrcmp(cTipo ,_TEXT("B")) == 0) || (lstrcmp(cTipo ,_TEXT("I")) == 0))
											   	           { 											   	          
											   	           	SetRect(&rect15,  nColtxt   , nRow+nScrool1 , nColtxt+nWidth1 - 5 , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												         
								  	    	            DrawText( hDC1 ,  HMG_parvc(4, n1) , -1 ,  &rect15 , DT_RIGHT  );			  			
								  	    	           } 
								  	    	       else      
								  	    	            {
								  				            DrawText( hDC1 ,  HMG_parvc(4, n1) , -1 ,  &rect15 , DT_NOCLIP | DT_WORD_ELLIPSIS  );			  			
								  				            }
								  				            
								  				    }
						  				
						  				nColtxt += nWidth1;			  				
						  			}	
						  			
						  	else
						  	   { 						  	   
						  	   		
						  	   		nWidth1 = nTotw;
						  	   		if (nColleft > 0)
												  {			   		  		       												  
												   if ( n1 == (nColleft+1)	)	
												   		  {
												   		  	SetRect(&rect15,  nColtxt+3   , nRow+nScrool1 , nColtxt+nWidth1  , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												   		  												   		  
												   		  }												   		  												   		  
												   else
												        {
												        	SetRect(&rect15,  nColtxt   , nRow+nScrool1 , nColtxt+nWidth1  , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												         
												        }		  
						  	    	
						  	    			}
						  	    			
						  	    	
						  	    
											 if (!lBloq1)	 
											     {			
											     if (n1 == 2)
											          {											          
											           SetRect(&rect0,  0  , nRow+nScrool1 , 23  , nRow+nScrool1+nItSubH   );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  											  
											          }
											     
											     SetTextColor( hDC1  ,  /*ColorFontBlq*/  Colorzebra );
											     }			  	   		
											     
											 		if ((lHigh1) && (lBloq1))
													{ 													
														SelectObject(hDC1 , hFont2);
	 													SetTextColor( hDC1  ,  ColorRed );
													}    
													
													
						  	   	 	if (n1 < nTotal  )
						  	   	 	    { 
						  				     if ((lstrcmp(cTipo ,_TEXT("B")) == 0) || (lstrcmp(cTipo ,_TEXT("I")) == 0))
											   	    { 
											   	    SetRect(&rect15,  nColtxt   , nRow+nScrool1 , nColtxt+nWidth1 - 5  , nRow+nScrool1+nItSubH  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	  												         
											   	     DrawText( hDC1 ,  HMG_parvc(4, n1)   , -1 ,  &rect15 ,   DT_RIGHT   );	  	
											   	    } 
											   	else
											   	    { 											   		           
											   	      DrawText( hDC1 ,  HMG_parvc(4, n1) , -1 ,  &rect15 , DT_NOCLIP  | DT_WORD_ELLIPSIS  );			  									  				
											   	    }   						  				     
						  				    } 
						  				    
						  				    
						  				    
						  				nColtxt += nWidth1;			  										  	      
						  	   
						  	   }		
			  	   
			  	   }
	  
	   }
	   
	   
	  if ( lstrcmp(cImage1 ,_TEXT("IMG=") ) == 0)
				{	  
				 	  cImage1 = HMG_parvc(4, nTotal);
				 	  //cImage1 = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , nLen   ));    	   		  		 
				    cPng = &cImage1[4];										  								   		          
				 		iFirstChar = atoi(cPng);   								   			          
				 		hBitmap = (INT) hb_parvnl(20, iFirstChar);     																						 		
				 		        
				 		if (hBitmap != NULL)								   		    
				 		     {		
				 		      DrawLegend( hDC1 , hBitmap , nRow+nScrool1 , ColorSel1);				 		         
				  		   }											  		       			
				 }			   			
	
	}	
	
	

// DrawHeader(    GetDc( GetFormHandle(cBrwName)   ) , aMtrCab ,  aTamanhos , nScrollPosH , nColbrwIni , 
//nItemSubHeight, ArrayRGB_TO_COLORREF( {53,53,153}   ) )


  //nScrollPosH , nColbrwIni , aBmp , nWidthBrw , aMtrCab, nColumnSel) 

HB_FUNC( DRAWHEADER )

{

	HDC hDC1 = (HDC) HMG_parnl (1); 	

	INT nScrollH = hb_parvni(4);
	INT nColHead = 10+nScrollH;
	INT nCol = (INT) hb_parni(5);    	
	INT nColtxt = nCol+3;
	INT nItSubHeight = (INT) hb_parni(6);    
	INT nBrwWidth = (INT) hb_parni(8);    
	INT nLastCol = (INT) hb_parni(14);    	
	TRIVERTEX      Vert [2];	
	GRADIENT_RECT  gRect;		
	INT z;
	INT nLen = (INT) hb_parni(13); 	
	BOOL lHigh1 = (BOOL) hb_parl(15); 		
	INT nOrdcol = (INT) hb_parni(16); 
	INT nLast1 = 300;
	INT nWidth  = 0;
	INT nTam1 = 0;
	INT nTotw = 0;	
	HFONT hFont;	
	INT nRowinicab = 5;	
 	INT nSelCol = (INT) hb_parni(10);  	
	TCHAR *cTexto;		
	RECT rectsel;
	INT nFontSize;
  INT nBold, nItalic, nUnderline, nStrikeOut;
  INT nOrientation = 0;
  
  COLORREF Color5 = (COLORREF) hb_parvni(12);
  
  TCHAR *cFontName = (TCHAR*) HMG_parc (11);  
  nFontSize   = 9;
  nBold       = FW_NORMAL;
  nItalic     =  0;
  nUnderline  =  0;
  nStrikeOut  =  0;
  nFontSize = nFontSize * GetDeviceCaps (hDC1, LOGPIXELSY) / 78;	
	
	hFont = CreateFont (0-nFontSize, 5 , nOrientation, nOrientation, nBold, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
 
  
	SelectObject( hDC1  ,  hFont);
	SetTextColor( hDC1  ,  Color5 );	
	
	//HeadColor
	HBRUSH hbrush3 = CreateSolidBrush( (COLORREF) RGB(hb_parvni(7, 1),
	hb_parvni(7, 2),
	hb_parvni(7, 3)) );
	COLORREF Color_1 = (COLORREF) hb_parni(7);  
	COLORREF Color_10 = (COLORREF) RGB(117,124,131);	
	HBRUSH hbrush = CreateSolidBrush( (COLORREF) RGB(hb_parvni(9, 1),
	hb_parvni(9, 2),
	hb_parvni(9, 3)) );	
	HBITMAP hBitmap;	
	BOOL lAscend1 = hb_parl(18);
	COLORREF Color_s1 = (COLORREF) hb_parni(19);  
	COLORREF Color_s2 = (COLORREF) hb_parni(20);  
  HPEN hWhitePen = CreatePen( PS_SOLID, 1 ,  (COLORREF) RGB(100,103,105) );
	HPEN hGrayPen =  CreatePen( PS_SOLID, 1 ,  (COLORREF) RGB(75,75,75) );	
	HPEN hBarra1 = CreatePen( PS_SOLID, 1 ,  (COLORREF) RGB(63,69,72) );
	HPEN hBarra2 =  CreatePen( PS_SOLID, 1 ,  (COLORREF) RGB(144,152,177) );	
	RECT rect_1;
	RECT rectcbtx;
	RECT rectcab;
	nColtxt  = nCol+nScrollH;
	SetRect(&rectcab, 0 ,  0  , nBrwWidth ,  30);
  FillRect(hDC1 ,&rectcab ,hbrush3); //(HBRUSH) hbrush3 ) );	 
  //WndBoxDraw( hDC1 ,  &rectcab , hWhitePen, hGrayPen, 4 , 1 );	 
	
	
  if (nScrollH == 0)
	   {
	    
		
				SelectObject( hDC1 , hWhitePen );											
						      			
				GoToPoint( hDC1 , 0     , 0);												
				LineTo(    hDC1 , 20    , 0 );
				
				SelectObject( hDC1 , hBarra2 );											
						      			
				GoToPoint( hDC1 , 0     , 0);												
				LineTo(    hDC1 , 0     , 29 );
		
		
		
		 }
	else 
		 {
		 
		 }
		 
  
  
   for ( z=1 ; z <= nLen  ; z++ )
	   		  
	   { 		   
	   		 
	   		 nTotw = (nBrwWidth - nColtxt);   
	   		 
	   		 if (nTotw > 0)
	   		     {
	   		     
				   		 nTam1 		= hb_parvni(3 , z );		   		 	   		 	   		 
				   		 nWidth   = nTam1;	   		  	   	   		  	   
											    
							 if (nWidth > nTotw)
						  		 {
						  			nWidth = nTotw;
						  		 }				   		 
						  		 
						  	
						  nColHead = nColtxt - 1;
						  	
						  SetRect(&rect_1  ,  nColHead   , 0 , nColHead+nWidth+nLastCol   ,29);  
						  WndBoxDraw( hDC1 ,  &rect_1 , hWhitePen, hGrayPen, 4 , 1 );	 
						  
						  if (nSelCol == z)
						      { 						      
						      	if (lHigh1)
						      			{
						      	 			Vert [0] .x      = nColHead+1;
													Vert [0] .y      = 0;
													Vert [0] .Red    = (USHORT) GetRValue(Color_s1) << 8;
													Vert [0] .Green  = (USHORT) GetGValue(Color_s1) << 8;
													Vert [0] .Blue   = (USHORT) GetBValue(Color_s1) << 8;
													Vert [0] .Alpha  = 0x0000;
													Vert [1] .x      = nColHead+nWidth;
													Vert [1] .y      = 29;  
													Vert [1] .Red    = (USHORT) GetRValue(Color_s2) << 8;
													Vert [1] .Green  = (USHORT) GetGValue(Color_s2) << 8;
													Vert [1] .Blue   = (USHORT) GetBValue(Color_s2) << 8;
													Vert [1] .Alpha  = 0x0000; 										      	 			
													
													gRect.UpperLeft  = 0;
  												gRect.LowerRight = 1;
  												GradientFill (hDC1  , Vert, 2, &gRect, 1, 1);     
						      	 		}						     						      
						      }						      
						      
						  if (nLastCol > 0)
						      {
						      
						       if (z == nLen)		
						           {
						      			SelectObject( hDC1 , hBarra1 );											
						      			
												GoToPoint( hDC1, nColHead+nWidth    , 0);												
												LineTo( hDC1   , nColHead+nWidth    , 29 );
												
												
												SelectObject( hDC1 , hBarra2 );											
						      			
												GoToPoint( hDC1 , nColHead+nWidth+1    , 0);												
												LineTo(    hDC1 , nColHead+nWidth+1    , 29 );
												
												
												
												 
												}
						      
						      
						      }  										   		 
				   		 
				   		 cTexto = HMG_parvc(2, z) ;				   		 
				   		 SetRect(&rectcbtx,  nColtxt + 1   , nRowinicab+2 ,nColtxt+nWidth  , nRowinicab+nItSubHeight  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   	   		 
				   		 DrawText( hDC1 ,  cTexto   , -1 ,  &rectcbtx , DT_CENTER    );	  	//DT_WORD_ELLIPSIS	  		    	  		       	  		       								   		  	   		     //				   		 				   		 
				   		 
				   		 
				   		 if (nOrdcol > 0)
				   		     {
				   		     
				   		     	//MessageBox(0, _TEXT("Printer Configuration Failed! (005)"), _TEXT("Error!"),MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);		
				   		      if ( (nOrdcol - 1) == z)
				   		          {
				   		          
				   		            hBitmap = (INT) hb_parvnl(17, 1);   
				   		            
				   		            
				   		            if (lAscend1)
				   		                 {				   		                 
				   		                 	hBitmap = (INT) hb_parvnl(17, 3);     																			   		                 
				   		                 }
				   		            
				   		            
				   		            if ( (nOrdcol - 1) != nSelCol)				   		               
				   		                {
				   		                hBitmap = (INT) hb_parvnl(17, 2);     															
				   		                
				   		                if (lAscend1)
						   		                 {				   		                 
						   		                 	hBitmap = (INT) hb_parvnl(17, 4);     																			   		                 
						   		                	
						   		                 }
				   		                
				   		                }				   		            
				   		            
			   								   			        
			   								  if (hBitmap != NULL)
			   								   			{			   								   			
			     											
			     											 //DrawTransp( hDC1 , hBitmap , nRowinicab   , nColtxt+ 4  , 15 , 15 , 0 ,  NULL , TRUE );  							
			     											 //MessageBox(0, _TEXT("Printer Configuration Failed! (005)"), _TEXT("Error!"),MB_ICONEXCLAMATION | MB_OK | MB_SYSTEMMODAL);		
			     											 DrawBitmapX( hDC1 , hBitmap , nRowinicab   , nColtxt+ 4  , 15 , 15 , 0 ,  NULL , TRUE );  							
			     								      	}				   		           
				   		          
				   		          }				   		     
				   		     }
				   		 
				   		 
				   		   nColtxt += nWidth;					   	
				   		 
	   		     }	   		  
	   		  
	   }

}




// ult.parmetro 29







HB_FUNC(  DRAWBRWDC )
{


	HDC hDC1 = (HDC) HMG_parnl (1); 
	INT nRow = (INT) hb_parni(2);    
	INT nCol = (INT) hb_parni(3);    	
	INT nColtxt = nCol+3;
	TCHAR *cTexto;	
	TCHAR *cTexto1;	
	TCHAR *cTexto3;		
	TCHAR *cImage1;
	TCHAR *cPng = _TEXT("1");	
	INT nWidth1  = (INT) hb_parni(4);    	
	INT nWidth  = 0;	
	INT nHeight = (INT) hb_parni(5);   	
	INT nRowText = 0; //nRow;	
	TCHAR *p25 = _TEXT("A");	
	RECT rect3;
	RECT rect2;	
	RECT rect10;
	RECT rect15;
	RECT rectcab;	
	RECT rect_y;	
	RECT rectcbtx;
	INT Zebra = 1;
  INT z = 0;	
	RECT rect5;
	RECT rect_1;	
	RECT rect21;	
	RECT rect0;
	INT n_1 = (INT) hb_parni(21);    
	INT n_2 = (INT) hb_parni(22);    	
	INT nScrollH = (INT) hb_parni(23);    	
	INT nCol1 = (INT) hb_parni(24);    
	INT nColleft = (INT) hb_parni(29);    
	INT y = 1;
	INT nTam = (INT) hb_parni(8);    
	INT nItSubHeight = (INT) hb_parni(9);    	
	INT nSelected = 0;
	INT nFocused  = (INT) hb_parni(11);
	INT nLenReg = 0;
	HBITMAP hBitmap;	
	HBITMAP hBitmap2;	
	HBITMAP hBitmapEx;	
	TRIVERTEX      Vert [2];	
	TCHAR *pAviso ;	
	TCHAR *cTipo ; 
  TCHAR *cFontName = (TCHAR*) HMG_parc (12);    
  INT lEnabled = 0;  
  BOOL lEstouro = FALSE;  
  BOOL lImage = FALSE;	
	INT nErased  = 4;
	INT nTam1    = 0;
	HBRUSH hbrush = CreateSolidBrush( (COLORREF) RGB(hb_parvni(6, 1),
	hb_parvni(6, 2),
	hb_parvni(6, 3)) );
	//Bar Selection Color
		
	
	//Back Color
	HBRUSH hbrush2 = CreateSolidBrush( (COLORREF) RGB(hb_parvni(10 , 1),
	hb_parvni(10, 2),
	hb_parvni(10, 3)) );
	HBRUSH hbrush5;
  COLORREF Color6 = (COLORREF) hb_parvni(13, 2);      
  INT nScrool1     = (INT) hb_parni(17);      
  BOOL lEnableAll = hb_parl(18);  
  COLORREF Color_dis = (COLORREF) hb_parni(20);  
  HBRUSH hbrushd = CreateSolidBrush( Color_dis ); 
	SetRect(&rect3, nCol ,  30  , nCol + nWidth1 ,  nHeight - 30);
  COLORREF Color1 = (COLORREF) hb_parni(6);    
	COLORREF Color_1 = (COLORREF) hb_parni(14);  
  COLORREF Color_2 = (COLORREF) hb_parni(15);  
  COLORREF Colorzebra  = (COLORREF) hb_parni(30);    
  COLORREF Colorzebra2 = (COLORREF) hb_parni(34);    
  COLORREF TransRGB;   
  BOOL lBrwEnabled = hb_parl(31);
  COLORREF ColorBrwDisable = (COLORREF) RGB(235,235,235);  
  COLORREF ColorWhite = (COLORREF) RGB(255,255,255);  
  COLORREF ColorRegBlq  = (COLORREF) RGB(214,214,214);
  COLORREF ColorFontBlq = (COLORREF) RGB(255,255,255);  
  COLORREF ColorYellow = (COLORREF) RGB(254,244,205);
  HBRUSH hbrushblq = CreateSolidBrush( ColorRegBlq);  
  
  
  if (!lBrwEnabled)
  		{
  		 Colorzebra = ColorBrwDisable;
  		}
  
  // 249 251 162
  HBRUSH hbrush3  = CreateSolidBrush( Color_1 );  
  HBRUSH hbrush4  = CreateSolidBrush( Color_2 );  
  HBRUSH hbrushz  = CreateSolidBrush( Colorzebra );
  HBRUSH hbrushz2 = CreateSolidBrush( Colorzebra2 );
  
  BOOL lBloq1;
  BOOL lHigh1;
  
  GRADIENT_RECT  gRect;	  
  TCHAR *cLetra = _TEXT("1");	
  
   HDC memDc2;
   HFONT hFont;
   HFONT hFont2;
   HDC  hDC;  
   HPEN hPen;   
   SIZE sz;
   INT nFontSize;
   INT nBold, nItalic, nUnderline, nStrikeOut;
   INT nOrientation = 0;

   if ( HB_ISNIL (1) || HMG_parnl (1) == 0)
      hDC = GetDC ( GetDesktopWindow() );
   else
      hDC = (HDC) HMG_parnl (1);

   cFontName   = (TCHAR *) HMG_parc (12);
   nFontSize   = 10;
   nBold       = FW_NORMAL;
   nItalic     =  0;
   nUnderline  =  0;
   nStrikeOut  =  0;

   nFontSize = nFontSize * GetDeviceCaps (hDC, LOGPIXELSY) / 72;
   INT iFirstChar = 0;   
   INT nBrwWidth = (INT) hb_parni(26);
   
   COLORREF Color5 = (COLORREF) RGB(102,102,106);	
   COLORREF ColorRed = (COLORREF) RGB(128,0,0);	
   COLORREF ColorTransp = (COLORREF) RGB(0,0,0);

        
   hFont = CreateFont (0-nFontSize, 6 , nOrientation, nOrientation, nBold, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
           
           
  hFont2 = CreateFont (0-nFontSize, 6 , nOrientation, nOrientation, FW_BOLD, nItalic, nUnderline, nStrikeOut,
           DEFAULT_CHARSET, OUT_TT_PRECIS, CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY, DEFAULT_PITCH | FF_DONTCARE, cFontName);
 
  
	SelectObject(hDC1 , hFont);
	SetTextColor( hDC1  ,  Color5 );	
	HDC hDCmem3;
	FillRect(hDC1 ,&rect3,(HBRUSH) hbrush2 );					
	PHB_ITEM pArray 	 = hb_param (7, HB_IT_ARRAY);	
	nLenReg = hb_arrayLen ( pArray );		
	nRowText = 30;   
	hBitmapEx = (INT) hb_parni(32);
  SetBkMode(hDC1  , TRANSPARENT);	
  SetGraphicsMode ( hDC1 , GM_ADVANCED);		
	
	
	
	
	
	if (nLenReg == 0)
	    { 
	    
	    		nColtxt  = 1;
	    		nColtxt  = nCol1+nScrollH;	    		
  				Vert [0] .x      = 0;
			    Vert [0] .y      = nRowText;
					Vert [0] .Red    = (USHORT) GetRValue(ColorYellow) << 8;
					Vert [0] .Green  = (USHORT) GetGValue(ColorYellow) << 8;
					Vert [0] .Blue   = (USHORT) GetBValue(ColorYellow) << 8;
					Vert [0] .Alpha  = 0x0000;
					Vert [1] .x      = nBrwWidth;
					Vert [1] .y      = nHeight - 30 ;  
					Vert [1] .Red    = (USHORT) GetRValue(ColorWhite) << 8;
					Vert [1] .Green  = (USHORT) GetGValue(ColorWhite) << 8;
					Vert [1] .Blue   = (USHORT) GetBValue(ColorWhite) << 8;
					Vert [1] .Alpha  = 0x0000; 										      	 								
					gRect.UpperLeft  = 0;
  				gRect.LowerRight = 1;
  				GradientFill (hDC1  , Vert, 2, &gRect, 1, 1);     
  				DrawBitmapX( hDC1 , hBitmapEx , 60   , 95+nColtxt  , 15 , 15 , 0 ,  ColorYellow , TRUE );  							  				
  				SetRect(&rect10,  25+nColtxt   , 42   , nBrwWidth   , nRowText+nItSubHeight+10  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	     				
  				SelectObject(hDC1 , hFont);															  				
  				DrawText( hDC1 ,  _TEXT("Consulta Executada Sem Retornar Registros.")  , -1 ,  &rect10 ,  DT_WORD_ELLIPSIS   );	  	//DT_WORD_ELLIPSIS	  		    	  		       	  		       								   		  	   		     //											   		   	    
	    } 
	    
	 else
	    
	    {
	    
	        nColtxt  = 1;
	    		nColtxt  = nCol1+nScrollH;	    		
  				Vert [0] .x      = 0;
			    Vert [0] .y      = 35 + (nItSubHeight * ( n_2 - n_1 )) ;
					Vert [0] .Red    = (USHORT) GetRValue(Colorzebra) << 8;
					Vert [0] .Green  = (USHORT) GetGValue(Colorzebra) << 8;
					Vert [0] .Blue   = (USHORT) GetBValue(Colorzebra) << 8;
					Vert [0] .Alpha  = 0x0000;
					Vert [1] .x      = nBrwWidth;
					Vert [1] .y      = nHeight - 30 ;  
					Vert [1] .Red    = (USHORT) GetRValue(Colorzebra2) << 8;
					Vert [1] .Green  = (USHORT) GetGValue(Colorzebra2) << 8;
					Vert [1] .Blue   = (USHORT) GetBValue(Colorzebra2) << 8;
					Vert [1] .Alpha  = 0x0000; 										      	 								
					gRect.UpperLeft  = 0;
  				gRect.LowerRight = 1;
  				GradientFill (hDC1  , Vert, 2, &gRect, 1, 1);     	    
	    
	    }
	
	
	PHB_ITEM pSubarray = hb_itemNew ( NULL );	
	
	
  SetBkMode(hDC1  , TRANSPARENT);	
  SetGraphicsMode ( hDC1 , GM_ADVANCED);		
	
   
    if (hb_arrayLen (pSubarray) == 9)
    
    {
      cTexto = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , 3   ));      
    
    }
    
    
     cTexto = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , 2   ));    
     
     
   INT nLen = 0;
   nColtxt  = 1;
   
   INT nTotw = 0;
   
   RECT rectsel;
   
   RECT rectzebra;
   
  
  nColtxt  = nCol1+nScrollH;
  
  PHB_ITEM pArrayCab 	 = hb_param (27 , HB_IT_ARRAY);
  
    
  INT nSelCol = (INT) hb_parni(28);  
  
  nLen = hb_arrayLen ( pArrayCab );	  
  INT nRowinicab = 5;
	BOOL lOk = TRUE;
	
	BOOL lImg1;
	 
	
	for ( y=n_1; y <= n_2  ; y++)
	
	   { 
	   
	      	pSubarray = hb_itemNew ( NULL );			   
	   		  hb_arrayGet (pArray, y , pSubarray);
	   		  
	   		  nColtxt  = nCol1+nScrollH;
	   		  nLen 		 = hb_arrayLen ( pSubarray );	   		  
	   		  
	   		  
	   		  lBloq1 = hb_arrayGetL( pSubarray , nLen - 2  );	   		  	   		  
	   		  lHigh1 = hb_arrayGetL( pSubarray , nLen - 1  );	   		  
	   		  
	   	    cImage1 = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , nLen   ));    	   		  		 
	   	    cImage1[4] = '\0';   			   		  		 	   		  	   		  
	   		  
	   		  lOk = TRUE;
	   		  
	   		  SelectObject(hDC1 , hFont);
					SetTextColor( hDC1  ,  Color5 );
					
					lImg1 = FALSE;										
	   		  
	   		  for ( z=2 ; z <= nLen - 3 ; z++ )
	   		  
	   		  { 	   		       	   		  
	   		  	
			   		  		 cTexto  = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , z   ));    	   		  		 
			   		  		 cTexto1 = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , z   ));    	   		  		 			   		  		 
			   		  		 cTexto1[4] = '\0';   			   		  		 
			   		  		 lImage = FALSE;			   		  		 
			   		  		 
			   		  		 cTipo = HMG_parvc(33, z - 1) ;				   		 
			   		  		 cTipo[1] = '\0';
			   		  		// cLetra = cTipo[0];
			   		  	 		
			   		  		
								   if ((y == nFocused) && (lOk))	   		  		
								   		 {								   		  		
								   		  SetRect(&rect10,  0   , nRowText   , nBrwWidth   , nRowText+nItSubHeight  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   
								   		  
								   		  if (lImg1)
								   		      { 
								   		       SetRect(&rect10,  20   , nRowText   , nBrwWidth   , nRowText+nItSubHeight  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   								   		       
								   		      }
								   		  
								   		  
								   		  FillRect(hDC1 ,&rect10 ,(HBRUSH) hbrush4 );	 
								   		  lOk = FALSE;	   		  		    								   		  		
								   		}
								   		  		
								   		  		 
								   	cTexto1[4] = '\0'; 								   		  		
								    nTam1 = hb_parvni(20 , z - 1 );	 //(INT) sz.cx *     	      				
								    
								    nTotw = (nBrwWidth - nColtxt);   
								    
								    if (nTotw > 0)
								    
								    		{
											    nWidth = nTam1;	   		  	   	   		  	   
											    
											    if (nWidth > nTotw)
						  			   				{
						  			   					nWidth = nTotw;
						  			   				}							    						  			   				
						  			   				
						  			   		 if (nColleft > 0)
												   		 {			   		  		       
												   		  if ( z == (nColleft+1)	)	
												   		  		{												   		  		    
												   		  		 SetRect(&rect10,  nColtxt+3   , nRowText  ,nColtxt+nWidth  , nRowText+nItSubHeight  );	    												   		  		    												   		  		  
												   		  		 }												   		  		 
												   		   else												   		   
												   		       { 
												   		        SetRect(&rect10,  nColtxt   , nRowText  ,nColtxt+nWidth  , nRowText+nItSubHeight  );	 
												   		       }												   		       												   		  		 
												   		 }
												   else	  		     
												       {											    
											     			SetRect(&rect10,  nColtxt   , nRowText  ,nColtxt+nWidth  , nRowText+nItSubHeight  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   											    											     														     			
											     			
											     		 }	
											     		 
											     		 
											     if ( z == nLen - 3  )
												   		  { 												   		   				
												   		   SetRect(&rect10,  nColtxt   , nRowText  ,  /*nColtxt+nWidth*/  nBrwWidth  , nRowText+nItSubHeight  );	 													   		   			
												   		  }											     					 												  						     					 
											   
													if (y % 2 == 0) 
															{		
															  if (y != nFocused) 															
															      {
																			if ( z == 2 )
																	   		  { 												   		   				
																	   		   SetRect(&rect21,  0 , nRowText  , nColtxt+nWidth    , nRowText+nItSubHeight  );	 													   		   			
																	   		   FillRect(hDC1 ,&rect21 ,(HBRUSH) hbrushz );	 										    											   		
																	   		   
																	   		  }					
																	   	else
																	   	    {
														   		  	    FillRect(hDC1 ,&rect10 ,(HBRUSH) hbrushz );	 										    											   		
														   		  	    }
														   		 } 	    
															}   
													else 
													    {
													    
													       if (y != nFocused) 															
															      {
																			if ( z == 2 )
																	   		  { 												   		   				
																	   		   SetRect(&rect21,  0 , nRowText  , nColtxt+nWidth    , nRowText+nItSubHeight  );	 													   		   			
																	   		   FillRect(hDC1 ,&rect21 ,(HBRUSH) hbrushz2 );	 										    											   		
																	   		   
																	   		  }					
																	   	else
																	   	    {
														   		  	    FillRect(hDC1 ,&rect10 ,(HBRUSH) hbrushz2 );	 										    											   		
														   		  	    }
														   		 } 	    													    
													    
													    } 		
													    
													    
															
															
													 if (!lBloq1)	 
														    {											     
														    
														     SetTextColor( hDC1  ,  ColorFontBlq );	
														     FillRect(hDC1 ,&rect10 ,(HBRUSH) hbrushblq );	 	 		     											     
														     
														     
														     if (z == 2)
														         {
														          SetRect(&rect0 ,  0 , nRowText  ,  23   , nRowText+nItSubHeight  );	 													   		   			
														          FillRect(hDC1 ,&rect0 ,(HBRUSH) hbrushblq );	 	 		     											     														         
														         }
														     
														    }																					
													else
													      {
													      SetTextColor( hDC1  ,  Color5 );
													      }
													      
														    
															
											   		  	   
											   	if ( lstrcmp(cTexto1 ,_TEXT("IMG=") ) != 0)
											   		  {											   		  
											   		  SelectObject(hDC1 , hFont);															
											   		  
											   		  if ((lHigh1) && (lBloq1))
											   		      { 
											   		      SelectObject(hDC1 , hFont2);																										   		      
																	SetTextColor( hDC1  ,  ColorRed );
											   		      } 
											   		      
											   		      
											   		      //if (lstrcmp(cTipo ,_TEXT("B")) != 0)
											   		       if ((lstrcmp(cTipo ,_TEXT("B")) == 0) || (lstrcmp(cTipo ,_TEXT("I")) == 0))
											   		           { 
											   		           SetRect(&rect10,  nColtxt    , nRowText  ,nColtxt+nWidth - 5 , nRowText+nItSubHeight  );	   	   				  		    	  		      	   		  	   	   		  	   	   		  	   	   		  	   											    											     														     														   		           	
											   		            DrawText( hDC1 ,  cTexto   , -1 ,  &rect10 ,  /*DT_WORD_ELLIPSIS*/  DT_RIGHT   );	  	//DT_WORD_ELLIPSIS	  		    	  		       	  		       								   		  	   		     //											   		   																	   
											   		           } 
											   		       else
											   		           { 											   		           
											   		             DrawText( hDC1 ,  cTexto   , -1 ,  &rect10 ,  DT_WORD_ELLIPSIS );	  	//DT_WORD_ELLIPSIS	  		    	  		       	  		       								   		  	   		     //											   		   
											   		           }     
											   		   
											   		  }    
											  		       								  		       
											  		       
											    if ( lstrcmp(cTexto1 ,_TEXT("IMG=") ) == 0)
											  		  {
											  		    cTexto1 = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , z   ));    	   		  		 
											  		    cPng = &cTexto1[4];
			   								   			          
			   								   			iFirstChar = atoi(cPng);   								   			          
			   								   			hBitmap = (INT) hb_parvnl(25, iFirstChar);     															
			   								   			        
			   								   			if (hBitmap != NULL)
			   								   			     {
			   								   			     	 			
			     													   DrawBitmapX( hDC1 , hBitmap , nRowText   , nColtxt  , nItSubHeight , nItSubHeight , 0 ,  Color_1 , TRUE );  							
			     													 }											  		       			
			   								       }			   								   						
			   								   						
			   								   		nColtxt += nWidth;	  			  		       							  		       						  	
		   								   }		
								  		       
	   		          
	   		  }	   		  
	   		  
	   		  
	   		  		 if ((lstrcmp(cImage1 ,_TEXT("IMG=") ) == 0) && (nColleft == 1))
										{
										 
										 	cImage1 = HMG_CHAR_TO_WCHAR(hb_arrayGetC( pSubarray , nLen   ));    	   		  		 
										  cPng = &cImage1[4];										  								   		          
								   		iFirstChar = atoi(cPng);   								   			          
								   		hBitmap = (INT) hb_parvnl(25, iFirstChar);     																		
								   		        
								   		if (hBitmap != NULL)								   		    
								   		     {
								   		     
								   		     if (y == nFocused)
								   		          { 
								   		           DrawLegend( hDC1 , hBitmap , nRowText , Color_2);
								   		          }    
								   		     else
								   		          {
												   		     if (y % 2 == 0)  								   		       
												   		         {								   		     
												   		          DrawLegend( hDC1 , hBitmap , nRowText , Colorzebra );												   		         
												   		         }
												   		     else
												   		         { 
												   		         	DrawLegend( hDC1 , hBitmap , nRowText , Colorzebra2);
												   		         } 
												   		   }      
												   		   
								    		   
								    		   lImg1 = TRUE;
								    		   
								    		   			if (!lBloq1)	   
												   		    { 
												   		     	DrawLegend( hDC1 , hBitmap , nRowText , ColorRegBlq);
												   		          
												   		     }													    		   
								    		 }											  		       											    		 								    		 								    		 
								   	  }			   			
	   		  
	   		  
	   		  nRowText += nItSubHeight;	   		
		 }   
	   
	   DeleteObject(hFont);
   

} 

static void GoToPoint( HDC hDC, int ix, int iy )
								{
								POINT pt;

								MoveToEx( hDC, ix, iy, &pt );
									}


void WndBoxDraw( HDC hDC, RECT *rct, HPEN hPUpLeft, HPEN hPBotRit, int nLineStyle, BOOL bHeader )
								{
								HPEN  hOldPen = SelectObject( hDC, hPUpLeft );
									HPEN  hBlack = CreatePen( PS_SOLID, 1, 0 );
									
									
									HPEN hBarra1 = CreatePen( PS_SOLID, 1 ,  (COLORREF) RGB(63,69,72) );
									HPEN hBarra2 =  CreatePen( PS_SOLID, 1 ,  (COLORREF) RGB(144,152,177) );

								switch( nLineStyle )
								{
							case 0:
								break;

							case 1:
								SelectObject( hDC, hPBotRit );
									GoToPoint( hDC, rct->left, rct->bottom - (bHeader ? 1 : 0) );
									LineTo( hDC, rct->right - 1, rct->bottom - (bHeader ? 1 : 0) );
									LineTo( hDC, rct->right - 1, rct->top - 1 );
									if( bHeader )
									{
									LineTo( hDC, rct->left - 1, rct->top - 1 );
										}
									break;

								case 2:
									SelectObject( hDC, hPBotRit );
										GoToPoint( hDC, rct->right - 1, rct->bottom );
										LineTo( hDC, rct->right - 1, rct->top - 1 );
										break;

								case 3:
									SelectObject( hDC, hPBotRit );
										GoToPoint( hDC, rct->left, rct->bottom );
										LineTo( hDC, rct->right, rct->bottom );
										break;

								case 4:										
										
										
										SelectObject( hDC, hPUpLeft );	
										GoToPoint( hDC, rct->left , 0 );
										LineTo( hDC, rct->right , 0 );
										
										
										
										
										SelectObject( hDC, hBarra1 );	
										GoToPoint( hDC, rct->left, rct->bottom );										
										LineTo( hDC, rct->left, rct->top );
										
										
										SelectObject( hDC, hBarra2 );											
										GoToPoint( hDC, rct->left+1, rct->bottom );										
										LineTo( hDC, rct->left+1, rct->top );
										
										
										SelectObject( hDC, hPBotRit );										
									  GoToPoint( hDC, 0 , rct->bottom );
										LineTo( hDC, rct->right , rct->bottom   );
	
										
										
//										GoToPoint( hDC, rct->left, rct->bottom - (bHeader ? 1 : 0) );
									//	LineTo( hDC, rct->right - 1, rct->bottom - (bHeader ? 1 : 0) );
							//			LineTo( hDC, rct->right - 1, rct->top - 1 );
										break;

								case 5:
									rct->top += 1;
										rct->left += 1;
										rct->bottom -= 1;
										rct->right -= 1;
										DrawFocusRect( hDC, rct );
										break;
										}

									SelectObject( hDC, hOldPen );
										DeleteObject( hBlack );
										}



#define BT_BITMAP_OPAQUE        0
#define BT_BITMAP_TRANSPARENT   1


static void DrawLegend( HDC hDC1 , HBITMAP hBitmap , INT nLinha1 , COLORREF color_transp )

{ 
		
		HDC memDc2;
		HBITMAP hBitmap2;	 
		RECT rect2;					
		RECT rect3;
		hBitmap2 = bt_bmp_create_24bpp (20,20);
		memDc2 = CreateCompatibleDC(NULL);								   		       
		//SelectObject (memDc2, hBitmap2);
		SetRect(&rect2, 0, 0, 20,20);          										 
    FillRect(memDc2, &rect2,(HBRUSH) CreateSolidBrush(   color_transp	  )   );                
    DrawBitmapX( hDC1 , hBitmap , nLinha1+2   , 2  , 20 , 20 , 0 , RGB(255,255,255)  , FALSE );  							       										 
    
    
    //TransparentBlt (hDC1  , 1 , nLinha1 , 20 , 20 , hBitmap , 0, 0 , 20 , 20 , RGB(255,255,255)   );                                                         							  														    		   		   
    
    
  	
		DeleteDC  (memDc2);        
   	DeleteObject (hBitmap2);   	
   	hb_retl (TRUE);


}







	HB_FUNC( CURSORWE )
	{
	hb_retnl( ( long ) SetCursor(LoadCursor(0, IDC_SIZEWE)) );
		}




