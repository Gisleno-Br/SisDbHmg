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

Static nColHeader := 0
Static cHeaderJan := ''

Static aMapsCol := {}

Static aColsTam := {}
Static aTipsy   := {}

Static aCabecs   := {}


Static nColSel1 := 0
Static nColAntx := 0

Static lTrack39 := .f. 

Static lSizeMode := .f. 
Static lDragMode := .f. 

Static cTable := ''

Static c_BrowName := ''

Static lAndamento := .f.

Static nColDrag := 0

Static nOrdCol := 0


Static nColSele := 1


Function xHeader( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1 , aTps , cTabela  )

    Local nRowIni := GetProperty( cBrwName1 , 'Row')
    Local nCol    := GetProperty( cBrwName1 , 'Col')
    Local nLarg1  := GetProperty( cBrwName1 , 'Width')

    cHeaderJan := cHName

    aColsTam := aTams 
    aTipsy   := aTps
    aCabecs  := aCabecalho

    c_BrowName := cBrwName1

    cTable := cTabela
        
	DEFINE WINDOW &cHName ;
		AT nRowIni - 92 , nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent1 ;
		WIDTH nLarg1+1 HEIGHT 30 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Iif( nLargTot1 > 0 , nLargTot1 , nLarg1+1)  ;
		TITLE 'xHeader1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE  ;		
		ON PAINT xPaintHeader( ThisWindow.Name , aCabecs  , aColsTam , aTipsy )  		
	END WINDOW
    
    xMapCols( aCabecs , aColsTam , aTipsy )

    If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHeader"  ) )  ) = 0
		InstallEventHandler( "EventHeader" )		
	End If


Return .t. 


Function xLimpMode()

    lSizeMode := .f. 
    lDragMode := .f. 
    nColSel1 := 0
    nColAntx := 0

    lAndamento := .f. 

    lTrack39 := .f.

Return 


Static Function xAtuDados(   nIndice1 , lAscedente )


    Local aCampos := GetCamposDic( cTabela, 'S' , .t. , .t. )
	Local aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )
	Local aTams   := GetCamposInf( cTabela, 'TAM' )
	Local aTips   := GetCamposInf( cTabela, 'TIPO' )
    Local aMz1    
    Local aZZ1    := xRetArray()
    Local cTexto  := ''
    Local aM4     := {}
    Local aZ1     := {}
    Local nQAcento := 0
    Local nTam 
    Local nTam1 
    Local lAtivo 
    Local nNum2
    Local cTxt1 := ''
    Local cTipo := ''
    Local nX1 
    Local cCOrd := ''
    Local cChaveOrd := ''


    DEFAULT nIndice1   := 0
    DEFAULT lAscedente := .f. 
    
	xCursorWait( .t. )


    For nx1 := 1 To Len(aZZ1)

        aMz1 := aZZ1[nx1][4]     

        aZ1  := {}   

        lAtivo := aZZ1[nx1][2]
        nNum2  := aZZ1[nx1][3]
        cTexto := ''

        cChaveOrd := ''

        For n1 := 1 To Len(aCampos)

            cTxt1 := ''           


            //nx1 := n1 
            cTxt1 := aMz1[n1][1]

            If  Alltrim(aTips[n1]) == 'D'
				cTxt1 := Padl(aMz1[n1][1] ,10)
			End If

			lNum := .f.

			If Alltrim(aTips[n1]) == 'B'
				cTxt1 := alltrim(Transform( rTrans(aMz1[n1][1]  ) , "@E 999,999,999.99" ))
				lNum := .t.
			End If

			If ( Alltrim(aTips[n1]) == 'I')
				If (n1 > 1)
					cTxt1 := alltrim( Str(   Val( aMz1[n1][1] )    )  )
					lNum := .t.
				Else
					cTxt1 := Alltrim( Str(   Val( aMz1[n1][1] )    ) )
				End If
			End If

            nTam1 := aTams[n1] 
            nQAcento := QtAcento( cTxt1  )			

            nTam := If( (nQAcento =  0)   , nTam1 ,  nTam1 + nQAcento )
            cTexto += (Padr(   cTxt1 , nTam  ) + ' ')


            If (nIndice1 > 0)
                If (nIndice1 = n1)
                    cChaveOrd := cTxt1
                End If 
            End If 

            Aadd(aZ1 , {cTxt1 ,  aMz1[n1][2] ,   n1 , nTam     }  )

            Do Events 

        Next     

        Do Events 
        Aadd(aM4 , { cTexto , lAtivo , nNum2  , aZ1 , cChaveOrd }  )

    Next 


    If (nIndice1 > 0)
        If lAscedente
            aM4 := Asort(aM4 ,,, { |a,b|  a[5] <  b[5]  })
        Else 
            aM4 := Asort(aM4 ,,, { |a,b|  a[5] >  b[5]  })
        End If     
    End If 




    Do Events 
    SetArray( aM4 )
  
    Do Events 
  
    If _IsWindowDefined(c_BrowName)        
        xShowBrw(  cTabela , .t.  )       
        xGoTop()
    End If      

REturn     


Function xGetColSel()
Return nColSele


Function xGetColQtd()
Return Len(aMapsCol)



Function xGetColWidth(   nColuna )
Return aMapsCol[ nColuna  ][5] 

Function xGetInfC(   nColuna , nIndice  )
Return aMapsCol[ nColuna  ][nIndice] 


Function xColMEsquerda( nLargura )

    Local nCol := 1 
    Local nWidth 
    Local nPos1 
    Local nPos2  
    Local lScrool1
    Local nQt1 := xGetColQtd()

    While .t. 
         

			nWidth := xGetColWidth(  nCol    )			
			nPos1 := xGetInfC(   nCol , 2  )
			nPos2 := xGetInfC(   nCol , 3  )
			
			lScrool1 := (nPos2 >= nLargura) 

            If (lScrool1) .or. (nCol = nQt1 )
             //   msginfo(Str(  nCol   ))     
                Exit 
            End If    

            nCol++

    Enddo             




Return nCol     


Function xColsVisible(nPos1 )

   Local am1 := {} 
   Local n1 := 0

   For n1 := 1 To Len(  aMapsCol )
        //SaveLog('Out1.txt' ,  aMapsCol[n1][1] + '  Pos1 : ' + Str(aMapsCol[n1][2])  + '   Pos2 : ' +  Str(aMapsCol[n1][3]) + '  Tam : ' + Str(aMapsCol[n1][5]) + XQUEBRA  )
        If (aMapsCol[n1][3] <= (nPos1+3) )
            Aadd(aM1 , n1)

            
        End If 
   Next    



Return aM1

Function xSelCol( nCol1 )

    nColSele := nCol1            
    BT_ClientAreaInvalidateAll(cHeaderJan)
    SysWait(0.02)                            


Return 

Function EventHeader( nHWnd, nMsg, nWParam, nLParam  )

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

  //  Local nUnit := xRetUnit()
   // Local nColx 

    Local nCol := 0
    Local nSaveCol1 := 0
    //-(nColHeader)

    If !_IsWindowDefined(cHeaderJan)       
        Return 
    End If 

    
	
	If nHWnd == GetProperty(  cHeaderJan   , "HANDLE" )

        /*

        If (nMsg == WM_MOUSEMOVE) .And. (lSizeMode) .And. (!lAndamento)
            //msginfo('ok2')    

            //i := 1

            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nColx := ar1[2]        

            If (nColX != nColDrag) 

                nColDrag := 0
                lSizeMode := .F.
                lDragMode := .F.  
                lAndamento := .f. 

                
                SetWindowCursor( nHWnd , IDC_ARROW)

                SysWait(0.03)
                Return


            End If     

        End If      
        */


        If (nMsg == WM_LBUTTONDOWN)	
             
            //msginfo(Str(nColSel1))

            nColSele := nColSel1            
            BT_ClientAreaInvalidateAll(cHeaderJan)
            SysWait(0.02)                            

            If (lSizeMode)                
	
                For i := 1 To 255
                    GetAsyncKeyState(i)
                Next i

                lAndamento := .t.

                GetCursorPos (@nCol, @nRow)
                ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
                nColx := ar1[2]    

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


                        If (Abs(nColx2 - nColx) >= nUnit)
                                                        
                            If (nColx2 > nColx)                            
                               aMapsCol[nSaveCol1][5] += Abs(nColx2 - nColx)
                               aColsTam[nSaveCol1] += Int(Abs(nColx2 - nColx) / nUnit)                            
                            Else                               
                               aMapsCol[nSaveCol1][5] -= Abs(nColx2 - nColx)
                               aColsTam[nSaveCol1]    -= Int(Abs(nColx2 - nColx) / nUnit)                                                          
                            End If                           

                            xMapCols( aCabecs , aColsTam , aTipsy )          
                            SysWait(0.01)                            

                            BT_ClientAreaInvalidateAll(cHeaderJan)
                            SysWait(0.01)                            

                            lOk  := .t. 
                            nColx := nColx2 

                        End If 


                        SysWait(0.02)                        

                Enddo                 

                If lOk 
                    xMapCols( aCabecs , aColsTam , aTipsy )

                    If !SetCampoTam(	cTabela  , Alltrim(   aCabecs[nSaveCol1]      ) , aColsTam[nSaveCol1] )
                        xDialog( Hb_AnsitoOem("Não Foi Possivel Atualizar o Dicionario.") )
                    End If 

                    SysWait(0.02)
                    
                    BT_ClientAreaInvalidateAll(cHeaderJan)
                    SysWait(0.02)

                    xAtuDados( 3 , .t. )

                End If     

                lSizeMode := .f. 
                lAndamento := .f. 
                //msginfo('Exit ')

            End If

        End If     


        If (nMsg == WM_LBUTTONUP)	

            lSizeMode := .f.
            lDragMode := .f.
            lAndamento := .f. 

        End If     
        		
		If (nMsg == WM_MOUSEMOVE) 
            
            //.And. (!lSizeMode) .And. (!lDragMode)

            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i


            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nColx := ar1[2]            
          //  msginfo(Str(  nUnit  ))

                

            DO EVENTS           

            If !(GetAsyncKeyState(VK_LBUTTON)) == 0					
                 REturn 
            End If 		

            SetWindowCursor( nHWnd , IDC_ARROW)
            aCords := xSearchPos(  nColx )

            If Len(aCords) = 0
                lSizeMode := .F.
                lDragMode := .F.  
                lAndamento := .f. 
                xApagueH( cHeaderJan )
                Return 
            End If            


            If ((nColx2 := xSearchLim(  nColx )) > 0)
                xDoHint(    , 'Redimensiona a Coluna ' + Hb_Utf8ToStr(Alltrim(aMapsCol[nColx2][1])) + '  '  + Str(nColSel1))                
                SetWindowCursor( nHWnd  , 'CURSORSIZE' )
                DO EVENTS                              
                lSizeMode := .t.
                Return 
            Else 

            	If  _isWindowDefined("Win_Msg")
			    	xHidehint()
			    End If

                lSizeMode := .f.
                SetWindowCursor( nHWnd , IDC_ARROW)
        
            End If   
            
            If (nColAntx != aCords[1][2]) .And. (nColAntx > 0 ) .And. (nColAntx <= Len(aMapsCol) )
           //    DO EVENTS
               nColSel1 := 0 
               n1 := aMapsCol[  nColAntx  ][2]
               n3 := aMapsCol[  nColAntx  ][5]
               BT_ClientAreaInvalidateRect(   cHeaderJan , 1 , n1 ,  n3 , Height , .t.   )              
               nColAntx := aCords[1][2] 
               lTrack39 := .f.                
               SysWait(0.03)
            End If     


            
            If Len(aCords) > 0

                If !lTrack39
                    nColSel1 := aCords[1][2]                
                    nColAntx := aCords[1][2] 
                    n1 := aMapsCol[  nColSel1  ][2]
                    n3 := aMapsCol[  nColSel1  ][5]
                    BT_ClientAreaInvalidateAll(   cHeaderJan )
                    SetWindowCursor( nHWnd , CURSORHAND)                   
                    SysWait(0.08)
                    lTrack39 := .t. 
                End If     

            End If     


        End If 

    End If     


Return 


Function xApagueH( cJanela1 )

    Local n1 
    Local n3 
    Local Height := GetProperty( cJanela1  , 'Height')    


    If (nColSel1 > 0)

        lTrack39 := .f.               

        n1 := aMapsCol[  nColSel1  ][2]
        n3 := aMapsCol[  nColSel1  ][5]
        nColSel1  := 0
        nColAntx := Len(aMapsCol) - 1       
        BT_ClientAreaInvalidateAll(   cJanela1 )     
        SysWait(0.02)        
        

    End If 


Return 


Function xRetTotal(   nCol1   )

    Local n1 := 0
    Local n2 := 0

    For n1 := 1 To Len(aMapsCol)

        If n1 >= nCol1 
            n2 += aMapsCol[n1][5]
        End If 
    Next 

    //Aeval( aMapsCol , { |  a |  n1 += a[5] })


Return n2

Static Function xMapCols( aCabs , aTamx1 , aTipos1  )

    Local i := 0
    Local nPos1 := 1 
    Local nColx := 17
    Local nTam1 
    Local nTam 
    Local BTstruct
    Local nQAcento 

    hDC = BT_CreateDC ( cHeaderJan  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
    hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )

    aMapsCol := {}

    For n1 := 1 To Len(aCabs)
        
        nTam1  := aTamx1[n1]

        nQAcento := QtAcento(Alltrim(aCabs[n1]) )
        nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1


        cTexto := Replicate('A' ,  nTam1 + 1  )              
        n12 := GetTextWidth( hDC , cTexto , hfont )
        nTam := n12

        Aadd( aMapsCol , {   aCabs[n1] , nColx , nColx +  nTam + 1 , aTipos1[n1] ,   nTam    }  )
        nColx += nTam 

    Next 

Return Nil 

Function xRetUnit()

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


Function UpdHeader( cHeader1 ,  nValor   )

    
   nColHeader += nValor    
   BT_ClientAreaInvalidateAll (cHeader1)	

return 



Static Function xPaintHeader( cJanela , aCabec  , aTamanho , aTps2 )

    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local BTstruct
    Local cTexto  := ''
    Local cTexto1 := ''
    Local n1     := 1
    Local nTam1 := 0
    Local nTamx1 := GetTextoTam( 'A'  , cActiveJan ) 
    Local hFont 
    Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
    Local nQAcento := 0
    Local nTam 
    Local nTam2
    Local nCol := -(nColHeader)
    Local nColx := 17
    Local hBitOk := BT_BitmapLoadFile ('OKMARK22')
    
	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {117,124,131}  , {137,143,150} )

    //BT_DrawGradientFillHorizontal ( hDC ,   0 , 0  , Width ,    Height    ,  {128,128,128}  , {128,128,128} )


    If (nColHeader > 0)
        nColx += nCol         
    End If 

    BT_DRAWEDGE (hDC, 0 , 0 ,  Width     , Height ,  BDR_SUNKENINNER  , BF_LEFT + BF_RIGHT)


    BT_DrawBitmap (hDC  , 6 ,  (0+nColx) - 16  , 15  , 15 , BT_STRETCH, hBitOk)
    hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )


    For n1 := 1 To Len(aMapsCol)
        
        nTam1  := aMapsCol[n1][5] 
        nQAcento := QtAcento(Alltrim( aMapsCol[n1][1]  ) )
        nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
        nTam2 := If( (nQAcento =  0)   , aTamanho[n1] , aTamanho[n1] + nQAcento ) //* nTamX1

         
        cTexto1 += Padc( Alltrim(  aMapsCol[n1][1] )   ,   nTam2 + 1  )

       

        If (nColSel1 > 0) .And. (nColSel1 = n1)             
            If nColSel1 != Len(aCabecs)
               BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam + 1 ,    Height    , {163,168,173} , {163,168,173} )        
            Else 
                BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam + 250 ,    Height    , {163,168,173} , {163,168,173} )        
            End If     


        Else 
            
        End If     

        BT_DRAWEDGE (hDC, 1, nColx , nColx + 2     , Height ,  BDR_SUNKENINNER  , BF_LEFT + BF_RIGHT)
        BT_DRAWEDGE (hDC, 1, nColx+1 , nColx + 3   , Height ,  BDR_SUNKENINNER  , BF_LEFT + BF_RIGHT)
        nColx += nTam1 

    Next 

    BT_DrawText ( hDC , 10  , 17+nCol ,   Hb_Utf8ToStr(cTexto1) , FONTBROWSER  , FONTBROWSERSIZE , WHITE,  {230,230,230}   , ;
				nTypeText ,	nAlingText, nOrientation )



     If (nColSele > 0)                 

        nColx := 17        

        If (nColHeader > 0)
            nColx += nCol         
        End If 

        nTam1  := aMapsCol[nColSele][5]              
        nColx +=  (aMapsCol[nColSele][2] - 13)
        cTexto1 := aMapsCol[nColSele][1]              

        //msginfo('ok2')


        

        nQAcento := QtAcento(Alltrim( aMapsCol[nColSele][1]  ) )
        nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
        nTam2 := If( (nQAcento =  0)   , aTamanho[nColSele] , aTamanho[nColSele] + nQAcento ) //

        cTexto1 := Padc( Alltrim(  aMapsCol[nColSele][1] ) ,   nTam2 + 1  )


       If nColSele != Len(aCabecs)   
            BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam - 5   ,    Height    ,  {163,168,173} , {128,128,128} )        
       Else 
            BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam + 350   ,    Height    ,  {163,168,173} , {128,128,128} )               
       End If 
       
    
        
       BT_DrawText ( hDC , 10  , nColx,   Hb_Utf8ToStr(cTexto1) , FONTBROWSER  , FONTBROWSERSIZE , WHITE,  {230,230,230}   , ;
				BT_TEXT_TRANSPARENT+BT_TEXT_BOLD ,	nAlingText, nOrientation )
        
            
    End If       



    BT_DeleteDC (BTstruct )
    BT_BitmapRelease (hBitOk)



REturn 
