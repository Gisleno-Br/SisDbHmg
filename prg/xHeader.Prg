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

Static nColHeader    := 0
Static cHeaderJan    := ''
Static cHeaderSombra := ''

Static aMapsCol := {}

Static aColsTam := {}
Static aTipsy   := {}

Static aCabecs   := {}


Static nColSel1 := 0
Static nColAntx := 0

Static lTrack39 := .f. 

Static lSizeMode := .f. 
//Static lDragMode := .f. 

Static cTable := ''

Static lEnabled2 := .t. 

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

Static hBit201 := Nil 

Static nQDrag1 := 0

Static lAtuDic  := .t. 
Static lScrool5 := .t. 

Function xHeader( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1 , aTps , cTabela , lAtivo , lDic1  )

    Local nRowIni := GetProperty( cBrwName1 , 'Row')
    Local nCol    := GetProperty( cBrwName1 , 'Col')
    Local nLarg1  := GetProperty( cBrwName1 , 'Width')


    Local nIndex22 

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

        
	DEFINE WINDOW &cHName ;
		AT nRowIni - 92 , nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent1 ;                                                                                                        //nLarg1+1
		WIDTH nLarg1+1 HEIGHT 30 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Iif( (nLargTot1 > 0) .And. ( nLargTot1 > (nLarg1+1)) , nLargTot1 , Nil )  ;
		TITLE 'xHeader1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR Nil  ;		
		ON PAINT xPaintHeader( ThisWindow.Name , aCabecs  , aColsTam , aTipsy ) 
	END WINDOW



    lScrool5 :=  (nLargTot1 > 0) .And. (nLargTot1 > (nLarg1+1)) 

    If (!lScrool5)
       //msginfo('no Scr')     

    End If 



    DEFINE WINDOW &cHeaderSombra ;
		AT nRowIni - 92 , nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent1 ;
		WIDTH nLarg1+1 HEIGHT 30 VIRTUAL HEIGHT Nil   ;
		TITLE 'xHeaderSombra1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR RGB(242,242,242)                 

        
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

    CREATE EVENT PROCNAME EventHeader() HWND GetControlHandle(  'Label2' ,  cHeaderSombra ) STOREINDEX nIndex22 
    EventProcessAllHookMessage(nIndex22 , .t.)

    SET WINDOW &cHName TRANSPARENT TO Iif(!lEnabled2 , 167 , 0)

    
    

    xMapCols( aCabecs , aColsTam , aTipsy )     

    


Return .t. 

/*
Function SetOrdGrid( nColuna1 , lAsc1 )

 
    nOrdemSel  := nColuna1
    lAscending := lAsc1

    BT_ClientAreaInvalidateAll(cHeaderJan)

    DO EVENTS     
	xDcBarHeader()

    SysWait(0.02)                        


Return 
*/




Function xGetHeadName(nTipo)
Return Iif(nTipo = 1, cHeaderJan, cHeaderSombra)

Function xDcBarHeader()

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



Function xLimpMode()

    lSizeMode := .f. 
    lDragMode := .f. 
    nColSel1 := 0
    nColAntx := 0

    lAndamento := .f. 

    lTrack39 := .f.

Return 

Static Function xOrdene( nCol1 , lAsc1 )

    Local aCampos := GetCamposDic( cTabela, 'S' , .t. , .t. )
	Local aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )	
	Local aTips   := GetCamposInf( cTabela, 'TIPO' )    
    Local aZZ1    := xRetArray()
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


    /*
    nPos1 := aM1[7]
    nTam1 := aM1[6]
    nTipo := Alltrim(aM1[4])
    */

    SetWindowCursor( GetFormHandle(cHeaderJan)  , 'CURSOR1'  )
    DO EVENTS
    

    xAtuDados(   nCol1 , lAsc1 , aColsTam  )
    Do Events 
  
    xShowBrw(  cTabela , .t.  )       
   // xGoTop()

    xCursorWait(.f.)
  

Return 


Function xFormDt(cData , n1 , n2 ) 
  Local cD1 := Alltrim(Left(  Alltrim(  Substr(cData , n1 , n2  )     ) , 10  ) )


Return Right(cD1,4) + Substr(Cd1,4,2) + Left(cD1,2)

Function xRetOrdem()

    Local aCampos := GetCamposDic( cTabela, 'S' , .t. , .t. )

    //msginfo(  Alltrim(aCampos[nOrdemSel]) )

Return Iif(nOrdemSel > 0 , Alltrim(aCampos[nOrdemSel]) , '')


Function xRetAsced()
Return lAscending

Static Function xAtuDados(   nIndice1 , lAscedente , aTams  , lTrocaCol )


    Local aCampos := GetCamposDic( cTabela, 'S' , .t. , .t. )
	Local aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )	
	Local aTips   := GetCamposInf( cTabela, 'TIPO' )
    Local aMz1    
    Local aZZ1    := xRetArray()
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

    Local cSqlp

    Local nRec1 := Recno()
	Local cAlias  := "T_" + Left(cTabela,3)

    
    //nQ1 := CalcEtapas()

   // msginfo(Str( nQ1 ))
      

    If nIndice1 <= 0
       // Return 
    End If 
   

	cSqlp  := GetSql( cTabela  , .f. )

    cOrdem1 := ''
    

    If nIndice1 > 0 
        If !lAscedente        
            cSqlp += '   Order by ' + Alltrim(aCampos[nIndice1] )  + ' Desc '
        Else 
            cSqlp += '   Order by ' + Alltrim(aCampos[nIndice1] )  + ' Asc '
        End If 
        cOrdem1 := Alltrim(aCampos[nIndice1] ) 
    End If 


    //msginfo(cSqlp)    
  

	Use 
	SysWait(0.01)

	
	dbUseArea( .T.,,  cSqlp , cAlias )
	dbSelectArea( cAlias )

    DbGoTop()
    xGoTop()
    

    Do Events 
    
    
  
    If _IsWindowDefined(c_BrowName)      

        nTot2 := xMapCols( aCabec , aTams , aTips  )          
        nQ1 := CalcEtapas()

        xShowBrw(  cTabela , .t.  )       
        xGoTop()
      

    End If      


//    msginfo(Codigo)

    


    /*


    DEFAULT nIndice1   := 0
    DEFAULT lAscedente := .f. 
    DEFAULT lTrocaCol := .f. 
   

    For nx1 := 1 To Len(aZZ1)

        aMz1 := aZZ1[nx1][4] 

        aMtr1 := {}

        If (lTrocaCol)

            For n1 := 1 To Len(aCampos)

                nIz1 := Ascan(aMz1 , { |a|  a[2] == Alltrim(aCampos[n1]) })

                If nIz1 > 0
                    Aadd(aMtr1 ,  {  aMz1[nIz1][1] ,  aMz1[nIz1][2] , aMz1[nIz1][3]  ,  aMz1[nIz1][4]  } )
                End If 

            Next 

            aMZ1 := Aclone(aMtr1)

        End If 

        aZ1  := {}   

        lAtivo := aZZ1[nx1][2]
        nNum2  := aZZ1[nx1][3]
        cTexto := ''        

        cChaveOrd := ''

        For n1 := 1 To Len(aCampos)

            cTxt1 := ''                              
            cTxt1 := aMz1[n1][1]

            Val1 := cTxt1

            If  Alltrim(aTips[n1]) == 'D'
				cTxt1 := Padl(aMz1[n1][1] ,15)
                Val1  := Ctod(Alltrim( cTxt1   ))
			End If

			lNum := .f.

			If Alltrim(aTips[n1]) == 'B'
				cTxt1 := alltrim(Transform( rTrans(aMz1[n1][1]  ) , "999,999,999.99" ))
                Val1 := Rtrans(cTxt1)
				lNum := .t.
			End If

			If ( Alltrim(aTips[n1]) == 'I')
				If (n1 > 1)
					cTxt1 := alltrim( Str(   Val( aMz1[n1][1] )    )  )
                    Val1  := Val( aMz1[n1][1] )  
					lNum := .t.
				Else
					cTxt1 := Alltrim( Str(   Val( aMz1[n1][1] )    ) )
                    Val1  := Val( aMz1[n1][1] )  
				End If
			End If

            nTam1 := aTams[n1] 
            nQAcento := QtAcento( cTxt1  )			            

            nTam := If( (nQAcento =  0)   , nTam1 ,  nTam1 + nQAcento )

            If (nX1 == 1 )
                nTot2 += nTam 
            End If     

            cTexto += (Padr(   cTxt1 , nTam  ) + ' ')


            If (nIndice1 > 0)
                If (nIndice1 = n1)
                    cChaveOrd := Val1                                
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

        nTot2 := xMapCols( aCabec , aTams , aTips  )          

      //  SysWait(0.02)

        nQ1 := CalcEtapas()
      
        nTamBar1 := (GetProperty( c_BrowName , 'Width') - ( nQ1 * nConst1 ))
        SetBarraTam(  nTamBar1 , nQ1  )

        xShowBrw(  cTabela , .t.  )       
        xGoTop()

       // SysWait(0.03)

    End If      

    */

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
                Exit 
            End If    

            nCol++

    Enddo             




Return nCol     


Function xColsVisible(nPos1 )

   Local am1 := {} 
   Local n1 := 0

   For n1 := 1 To Len(  aMapsCol )
        
        If (aMapsCol[n1][3] <= (nPos1+3) )
            Aadd(aM1 , n1)            
        End If 
   Next    



Return aM1

Function xSelCol( nCol1 )

    nColSele := nCol1            
    BT_ClientAreaInvalidateAll(cHeaderJan)

    DO EVENTS     
	xDcBarHeader()

    SysWait(0.02)                            
    




Return 

Function EventHeader()
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
    Local nQTotEt := CalcEtapas()
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

            lAscending    := !lAscending
            nOrdemSel     := nColSele             

             
            BT_ClientAreaInvalidateAll(cHeaderJan)
            SysWait(0.01)          
            xDcBarHeader()       

            If (nOrdemSel >= 0) .And. (nOrdemSel <= Len(aCabecs))       
                If nOrdemSel <= Len(aMapsCol)    
                    xOrdene( nOrdemSel , lAscending )
                End If    
            End If    


        End If 

     
        If (nMsg == WM_LBUTTONDOWN)	

            DO EVENTS       

            nColSele := nColSel1    

            If (nColSele <= 0) .Or. (nColSele > Len(aMapsCol) )
                Return      
            End If   



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

            If (lSizeMode) .And. (lSizeMode)                
	
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
                            xDcBarHeader()                     

                           // SysWait(0.01)                            

                            lOk  := .t. 
                            nColx := nColx2 

                        End If 

                        SysWait(0.01)                        

                Enddo                 

                If lOk 


                    SetWindowCursor(  GetControlHandle( 'Label2' , cHeaderSombra)  , 'CURSOR1'  )   

                    DO EVENTS 

                    xMapCols( aCabecs , aColsTam , aTipsy )

                    If !SetCampoTam(	cTabela  , Alltrim(   aCabecs[nSaveCol1]      ) , aColsTam[nSaveCol1] )
                        xDialog( Hb_AnsitoOem("Não Foi Possivel Atualizar o Dicionario.") , .f. )
                    End If 

                                        
                    BT_ClientAreaInvalidateAll(cHeaderJan)
                    
                    xDcBarHeader()
                    DO EVENTS 

                    xAtuDados( 3 , .t. ,  aColsTam  )

                    SetWindowCursor(  GetControlHandle( 'Label2' , cHeaderSombra)  , 'IDC_ARROW'  )   

                    DO EVENTS 

                    nColx5 := 0


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

            nColSav1 := 0            
            nColx5 := 0
            //msginfo('3332')



        End If     
        		
		If (nMsg == WM_MOUSEMOVE) 
            
      
            xLimpBarV()
            SysWait(0.01)				

            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i

            s1 := ''
            s2 := ''


            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nColx := ar1[2]            

            If (nColx5 > 0) .And. (lAtuDic)


                nLim1 := xGetInfC(nColSele , 2)
                nTamx := Int(xGetColWidth(  nColSele    )	/ 2)

               
                If ( Abs(nColx - nColx5) > 2) .And. (  (nColx <=  ( (nLim1 + nTamx + 20)) )     )
                    lDragMode := .t. 

                    nColx5 := nColx                   


                    xDoHint(  Nil ,   'Click e Arraste a Coluna para Mudar de Posição.' )    
                    DO EVENTS            
                    
                    nQDrag1 := xRetPgNum()
                    

                    While lDragMode 

                            For i := 1 To 255
                                GetAsyncKeyState(i)
                            Next i

                            If (GetAsyncKeyState(VK_LBUTTON)) == 0	  
                                

                                If (nColSele != nColTarget) .And. TroqOrdens(cTabela , nColSele , nColTarget , aCabecs[nColSele] )

                                    DO EVENTS                                    
                                    SetWindowCursor(  GetControlHandle( 'Label2' , cHeaderSombra)  , 'CURSOR1'  )                                  
                                    aColsTam := GetCamposInf( cTabela, 'TAM' )                                                                    

                                    SysWait(0.01)                                    

                                    xAtuTams()

                                    SysWait(0.02)                                    

                                    xAtuDados( nOrdemSel, lAscending ,  aColsTam  , .t.  )
                                 
                                    SysWait(0.02)
                                    
                                    SetWindowCursor(  GetControlHandle( 'Label2' , cHeaderSombra)  , 'IDC_ARROW'  )    
                                    

                                End If 

                                lDragMode := .f. 
                                nColx5 := 0
                                nColMove := 0
                                nColY1   := 0
                                nIncr1   := 0
                                nColSav1 := 0
                                nColTam1 := 0
                                nColTarget := 0
                                If  _isWindowDefined("Win_Msg")
                                    xHidehint()
                                End If

                                

                                Exit


                            End If 		

                            GetCursorPos (@nCol, @nRow)
                            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
                            nZ1 := ar1[2]    

                            If (nZ1 != nColx5) .or. (nZ1 <= 1)

                                DO EVENTS


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
                                xDoHint(    ,   Alltrim(Str(nColSav1))+ ' SS ' + Alltrim(Str(  (GetProperty( c_BrowName , 'Width') - 13)  )) )

                                If (nTarget > 0) .or. (lScrool1)                                   

                                    If  (lScrool1)    
                                        xDoHint(    ,   Alltrim(Str(nTarget)) + ' SS ' + Alltrim(Str(  (GetProperty( c_BrowName , 'Width') - 13)  )) )
                                    End If     

                                    DO EVENTS 
                                    

                                    If (nTarget > 0)                                            
                                        nColTarget := nTarget                                        
                                        BT_ClientAreaInvalidateAll(   cHeaderJan )
                                        xDcBarHeader()                                   

                                        Do Events 
                                     //   xDoHint(    ,   'Trocar a Posição , Coluna ' + Alltrim(aMapsCol[nTarget][1]  )  )
                                    End If                                         
                                    
                                    
                                    Do Events 

                                    While ((lScrool1) .And. (nQDrag1 <= nQTotEt) .And. (lFrente1)) .Or. ;
                                        ((lScrool1) .And. (nQDrag1 > 0) .And. (!lFrente1))
                                    

                                        If !lFrente1
                                            DecrLeft()                                               
                                            UpdateBarH( -nConst1  )	  
                                        End If                                             
                                            

                                        If lFrente1 
                                            nZp1 := ScrollCol( .t. , .f. )                                        
                                        Else 
                                            nZp1 := ScrollCol( .f. , .f. )    
                                            //msginfo('voltando')                                    
                                        End If 

                                        If (nZp1 != -1) 

                                            SysWait(0.03)                                                                                                                    
                                            
                                            If lFrente1
                                                nQDrag1++
                                                UpdateBarH( nConst1  )	                                             
                                            Else 
                                                nQDrag1--
                                            End If 

                                            xDcBarH()                                
                                            SysWait(0.03)
                                            

                                            xDcBarHeader()                                            
                                            nColSav1+=nZp1                                           

                                          //  SysWait(0.07)                                          

                                            
                                        Else                                            
                                           

                                        End If 

                                        SysWait(0.02)
                                        xMoveWin( nColSele , nColSav1 , lFrente1 )
                                      //  SysWait(0.08)       
                                        
                                        //msginfo('Exit ' + Str(nQDrag1) + '  ' + Str(nQTotEt))

                                        

                                        If (lFrente1)
                                            If (nQDrag1 >= nQTotEt)
                                                lFrente1 := .f. 
                                                nColx5 := nZ1  
                                                Exit 
                                            End If     
                                        Else 
                                            
                                            If nQDrag1 == 0
                                               //msginfo( Str(nColSele))

                                               nColHeader := 0

                                                nColTarget := 1
                                               // BT_ClientAreaInvalidateAll(   cHeaderJan )

                                                lFrente1 := .t. 
                                                nColx5 := nZ1  
                                                nColSav1 := -(nLastro1)                                                

                                                //msginfo( Str(nColSav1))

                                                SysWait(0.02)                                                

                                                xMoveWin( nColSele , nColSav1 , .f. )
                                                SysWait(0.01)

                                                xZeraContador()
                                                

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
                xDcBarHeader()
                DO EVENTS 
                Return 
            End If        
               

            If ((nColx2 := xSearchLim(  nColx )) > 0) .And. (lAtuDic)
                xDoHint(    , 'Redimensiona a Coluna ' + Alltrim( aMapsCol[nColx2][1]) + '  '  + Str(nColSel1))                
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
              // BT_ClientAreaInvalidateRect(   cHeaderJan , 1 , n1 ,  n3 , Height , .t.   )              

               BT_ClientAreaInvalidateAll(   cHeaderJan )
               nColAntx := aCords[1][2] 
               lTrack39 := .f.       
               DO EVENTS         
               xDcBarHeader()
               DO EVENTS 
               //SysWait(0.01)
            End If     


            
            If Len(aCords) > 0

                If !lTrack39
                    nColSel1 := aCords[1][2]                
                    nColAntx := aCords[1][2] 
                    n1 := aMapsCol[  nColSel1  ][2]
                    n3 := aMapsCol[  nColSel1  ][5]
                    BT_ClientAreaInvalidateAll(   cHeaderJan )
                    DO EVENTS 
                    xDcBarHeader()
                   // SetWindowCursor( nHWnd , CURSORHAND)                   
                    DO EVENTS 
                    //SysWait(0.08)
                    lTrack39 := .t. 
                End If     

            End If     


        End If 

    End If     


Return 

Static Function xBusqTar( nPoint , lFrente5 )

  Local nColz1 := 0
  Local nQtt   := xGetColQtd()
  Local nLimite := xGetInfC( nQtt , 2)

  //Aadd( aMapsCol , {   aCabs[n1] , nColx , nColx +  nTam + 1 , aTipos1[n1] ,   nTam ,  aTamx1[n1] , nAcum   }  )

  If lFrente5
     N1 := Ascan( aMapsCol , { |a| Abs(a[3] - nPoint) <= 25     })

     If n1 == 0


        If ((nLimite - nPoint) <= 10)
            n1 := nQtt 
          //  msginfo( Str(n1 ))
        End If     


     End If    

  Else 
    N1 := Ascan( aMapsCol , { |a| Abs(nPoint - a[2] ) <= 25     })    
  End If   

  nColz1 := n1 


Return nColz1


Static function xMoveWin( nColuna , NColIni   )
    

    nColMove := nColuna 
    nColY1   := nColIni

    BT_ClientAreaInvalidateAll(   cHeaderJan )
    xDcBarHeader()
  

    Do Events 


Return     




Function xApagueH( cJanela1 )

    Local n1 
    Local n3 
    Local Height := GetProperty( cJanela1  , 'Height')    


    If (nColSel1 > 0)

        lTrack39 := .f.               

        //xOffBarVert( Nil )


        n1 := aMapsCol[  nColSel1  ][2]
        n3 := aMapsCol[  nColSel1  ][5]
        nColSel1  := 0
        nColAntx := Len(aMapsCol) - 1       
        BT_ClientAreaInvalidateAll(   cJanela1 )     
        SysWait(0.02)        
        

    End If 


Return 

/*

Function xRetTotal(   nCol1   )

    Local n1 := 0
    Local n2 := 0

    For n1 := 1 To Len(aMapsCol)

        If n1 <= nCol1 
            n2 += aMapsCol[n1][5]
        End If 
    Next 

    //Aeval( aMapsCol , { |  a |  n1 += a[5] })


Return n2

*/


Static Function xMapCols( aCabs , aTamx1 , aTipos1  )

    Local i := 0
    Local nPos1 := 1 
    Local nColx := 17
    Local nTam1 
    Local nTam 
    Local BTstruct
    Local nQAcento 
    Local nTam12 := 0
    Local nAcum := 1


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

        Aadd( aMapsCol , {   aCabs[n1] , nColx , nColx +  nTam + 1 , aTipos1[n1] ,   nTam ,  aTamx1[n1] , nAcum   }  )
        nColx += nTam 

        nAcum += aTamx1[n1]+1

        nTam12 += nTam 

    Next 

    
    BT_DeleteDC (BTstruct )
    


Return nTam12 

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

/*
Function isDrgMode()

REturn (lDragMode)
*/


Function xDragOff()

    nClearit  := 0
    lSizeMode := .f.
    lDragMode := .f.
    lAndamento := .f. 

    nColTarget := 0

    nColSav1 := 0            
    nColx5 := 0

    BT_ClientAreaInvalidateAll(  cHeaderJan)

    Do Events
    Do Events


REturn     


Static Function xPaintHeader( cJanela , aCabec  , aTamanho , aTps2 )

    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local BTstruct
    Local cTexto  := ''
    Local cTexto1 := ''
    Local n1     := 1
    Local nCol21
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


    Local hBitOrd1 := BT_BitmapLoadFile ('SETTA')
    Local hBitOrd2 := BT_BitmapLoadFile ('SETAB')
    
	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )

    If lEnabled2
	    BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {117,124,131}  , {137,143,150} )
    else
        BT_DrawGradientFillHorizontal ( hDC ,   0 , 0  , Width ,    Height    ,  {110,110,110}  , GRAY )
    End If 

    //BT_DrawGradientFillHorizontal ( hDC ,   0 , 0  , Width ,    Height    ,  {128,128,128}  , {128,128,128} )



    If (nColHeader > 0)
        nColx += nCol         
    End If 

    BT_DRAWEDGE (hDC, 0 , 0 ,  Width     , Height ,  BDR_SUNKENINNER  , BF_LEFT + BF_RIGHT)


    BT_DrawBitmap (hDC  , 6 ,  (0+nColx) - 16  , 15  , 15 , BT_STRETCH, hBitOk)
    hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )

    nCol21 := 0


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

            If (nColTarget == n1) 
                If nColTarget ==  Len(aCabecs)
                    BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam + 300 ,    Height    , {163,168,173}, WHITE )            
                Else 
                    BT_DrawGradientFillVertical ( hDC ,   1 ,  nColx  , nTam + 1 ,    Height    ,{163,168,173} , WHITE )            
                End If 
                
            End If     
            
        End If     

        BT_DRAWEDGE (hDC, 1, nColx , nColx + 2     , Height ,  BDR_SUNKENINNER  , BF_LEFT + BF_RIGHT)
        BT_DRAWEDGE (hDC, 1, nColx+1 , nColx + 3   , Height ,  BDR_SUNKENINNER  , BF_LEFT + BF_RIGHT)

        
       If (nOrdemSel == n1)
          nCol21 := nColx+4            
       End If 

       nColx += nTam1 
       

    Next 

    BT_DrawText ( hDC , 10  , 17+nCol ,   Hb_Utf8ToStr(cTexto1) , FONTBROWSER  , FONTBROWSERSIZE , WHITE,  {230,230,230}   , ;
				nTypeText ,	nAlingText, nOrientation )


    If !lEnabled2
        REturn 
    End If 
    


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

       If nOrdemSel == nColSele 
          BT_DrawBitmapTransparent (hDC  , 6 ,  nColx+2 , 16  , 16 , BT_STRETCH, Iif(lAscending ,  hBitOrd1 ,  hBitOrd2 ) )
       End If    
    
        
       BT_DrawText ( hDC , 10  , nColx,   Hb_Utf8ToStr(cTexto1) , FONTBROWSER  , FONTBROWSERSIZE , WHITE,  {230,230,230}   , ;
				BT_TEXT_TRANSPARENT+BT_TEXT_BOLD ,	nAlingText, nOrientation )

       
       
        hBit201 := BT_BitmapCaptureWindow ( cJanela , 1 , nColx , nTam - 5  , Height )
        BT_BitmapSaveFile (hBit201  , "hBit201.bmp")
            

        
            
    End If       


    If (lDragMode) .And. (nColMove > 0) .And. (nColMove <= Len(aMapsCol)) 

        
        nColx1 := aMapsCol[nColMove][2]+nIncr1 
        nColx2 := aMapsCol[nColMove][5]


        nColx1 := nColY1

        If (nColHeader != 0)
            nColX1 +=  -(nColHeader)
        End If       


        BT_DrawBitmapAlphaBlend (hDC, 1 ,  nColx1  , nColx1+nColx2, Height, 100 , BT_COPY  , hBit201)

    End If      



    BT_DeleteDC (BTstruct )
    BT_BitmapRelease (hBitOk)

    BT_BitmapRelease (hBitOrd1)
    BT_BitmapRelease (hBitOrd2)



REturn 
