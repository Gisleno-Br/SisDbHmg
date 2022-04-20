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
Static lDragMode := .f. 

Static cTable := ''

Static lEnabled1 := .t. 

Static c_BrowName := ''

Static lAndamento := .f.

Static nColDrag := 0

Static nOrdCol := 0

Static s1 := ''
Static s2 := ''

Static nOrdemSel := 0
Static lAscending := .f. 


Static nColSele := 1


Function xHeader( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1 , aTps , cTabela , lAtivo  )

    Local nRowIni := GetProperty( cBrwName1 , 'Row')
    Local nCol    := GetProperty( cBrwName1 , 'Col')
    Local nLarg1  := GetProperty( cBrwName1 , 'Width')

    Local nIndex22 

    DEFAULT lAtivo := .t. 

    lEnabled1 := lAtivo

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
		PARENT &cParent1 ;
		WIDTH nLarg1+1 HEIGHT 30 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Iif( nLargTot1 > 0 , nLargTot1 , nLarg1+1)  ;
		TITLE 'xHeader1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE  ;		
		ON PAINT xPaintHeader( ThisWindow.Name , aCabecs  , aColsTam , aTipsy )  		
	END WINDOW


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
                BACKCOLOR NIL
                FONTCOLOR NIL
            END LABEL




	END WINDOW

    CREATE EVENT PROCNAME EventHeader() HWND GetControlHandle(  'Label2' ,  cHeaderSombra ) STOREINDEX nIndex22 
    EventProcessAllHookMessage(nIndex22 , .t.)

    SET WINDOW &cHName TRANSPARENT TO Iif(!lEnabled1 , 167 , 0)

    
    If (lEnabled1)
    
        xMapCols( aCabecs , aColsTam , aTipsy )

        If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHeader"  ) )  ) = 0
           // InstallEventHandler( "EventHeader" )	            
        End If        


    End If 


Return .t. 


Function SetOrdGrid( nColuna1 , lAsc1 )

 
    nOrdemSel  := nColuna1
    lAscending := lAsc1

    BT_ClientAreaInvalidateAll(cHeaderJan)

    DO EVENTS     
	xDcBarHeader()

    SysWait(0.02)                        


Return 


Function xCheckOk()

    lOCAL A1 := Seconds()
    Local nDiff := 150000

      //  DO EVENTS    

       // DO EVENTS     

        If Empty(s1)
            s1 := Str(a1)
        Else 
            s2 := Str(a1)    
            nDiff := Val(s2) - Val(s1)        
        End If 

        If (nDiff <= 0.20)        
            s1:=''
            s2:=''
        End If     
           


Return (nDiff <= 0.20)




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
    If !lEnabled1
        BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 5 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
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
    Local aM1     := aMapsCol[nCol1]
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


   /*
    For nx1 := 1 To Len(aZZ1)
        Aadd( aZZ2 , aZZ1[nx1][6]   )
    Next 
    */

    DO EVENTS

    //msginfo('1')

    If lAsc1
    //    aM4 := Asort(aZZ2 ,,, { |a,b| a[nCol1]  <  b[nCol1]    })
    Else 
    //    aM4 := Asort(aZZ2 ,,, { |a,b|  a[nCol1]  > b[nCol1]   })
    End If 


  /*

    If (nTipo == 'C')
        If lAsc1
            aM4 := Asort(aZZ1 ,,, { |a,b|  Substr(a[1] , nPos1 , nTam1 + QtAcento(a[1]) ) < Substr(b[1] , nPos1 , nTam1 + QtAcento(b[1]) )  })
        Else 
            aM4 := Asort(aZZ1 ,,, { |a,b|  Substr(a[1] , nPos1 , nTam1 + QtAcento(a[1]) ) > Substr(b[1] , nPos1 , nTam1 + QtAcento(b[1]) )  })
        End If 
    End If     

    If (nTipo = 'I')
        If lAsc1
            aM4 := Asort(aZZ1 ,,, { |a,b|  Val(Substr(a[1] , nPos1 , nTam1 + QtAcento(a[1]) )) < Val(Substr(b[1] , nPos1 , nTam1 + QtAcento(b[1]) ))  })
        Else 
            aM4 := Asort(aZZ1 ,,, { |a,b|  Val(Substr(a[1] , nPos1 , nTam1 + QtAcento(a[1]) )) > Val(Substr(b[1] , nPos1 , nTam1 + QtAcento(b[1]) ))  })
        End If 
    End If   



    If (nTipo = 'B')
        If lAsc1
            aM4 := Asort(aZZ1 ,,, { |a,b|  Rtrans(Substr(a[1] , nPos1 , nTam1 + QtAcento(a[1])   )) < Rtrans(Substr(b[1] , nPos1 , nTam1 + QtAcento(b[1]) ))  })
        Else 
            aM4 := Asort(aZZ1 ,,, { |a,b|  Rtrans(Substr(a[1] , nPos1 , nTam1 + QtAcento(a[1]) )) > Rtrans(Substr(b[1] , nPos1 , nTam1 + QtAcento(b[1]) ))  })
        End If 
    End If     

    
    If (nTipo == 'D')
     //   msginfo(Str(  Len(aZZ1)     ))
        If lAsc1
            aM4 := Asort(aZZ1 ,,, { |a,b|  ( xFormDt(a[1] , nPos1 , nTam1 + QtAcento(a[1]) )) < ( xFormDt(b[1] , nPos1 , nTam1 + QtAcento(b[1])  ))  })
        Else 
            aM4 := Asort(aZZ1 ,,, { |a,b|  ( xFormDt(a[1] , nPos1 , nTam1  + QtAcento(a[1]))) > ( xFormDt(b[1] , nPos1 , nTam1 + QtAcento(b[1]) ))  })
        End If 
    //    msginfo(Str(  Len(aM4)     ))
    End If  


    //msginfo('1')

    */



   // msginfo('2')

  /*
    For n1 := 1 To Len(aM4)

        nCont5++

		If nCont5 > nTamPg
			nPagNum++
			nCont5 := 1
		End If 
        
        aM4[n1][3] := nPagNum

    Next        
    */

    xAtuDados(   nCol1 , lAsc1 , aColsTam  )

    Do Events 
    //SetArray( aM4 )    

    //SysWait(0.01)

    xShowBrw(  cTabela , .t.  )       
    xGoTop()

    xCursorWait(.f.)
   // SysWait(0.03)

Return 


Function xFormDt(cData , n1 , n2 )
  //SaveLog('Debug22.Log' ,Alltrim(Left(  Alltrim(  Substr(cData , n1 , n2 + QtAcento(cData) )     ) , 10  ))  )
  
  Local cD1 := Alltrim(Left(  Alltrim(  Substr(cData , n1 , n2  )     ) , 10  ) )

  SaveLog('Debug234.Log' , Left(cData,10) + '  ' +  cd1 + '   ->  '  +  Right(cD1,4) + Substr(Cd1,4,2) + Left(cD1,2) +'    ' + Str(n1) + '  ' + Str(n2)  )

  SaveLog('Debug2233.Log' ,cData + '  ' + Str(  QtAcento(cData)   ) )

Return Right(cD1,4) + Substr(Cd1,4,2) + Left(cD1,2)


Static Function xAtuDados(   nIndice1 , lAscedente , aTams  )


    Local aCampos := GetCamposDic( cTabela, 'S' , .t. , .t. )
	Local aCabec  := GetCamposDic( cTabela, 'S', .F. , .f. )
	//Local aTams   := GetCamposInf( cTabela, 'TAM' )
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

    Local nTot2 := 0
    Local Val1 := ''
    Local aM4  := {}


    DEFAULT nIndice1   := 0
    DEFAULT lAscedente := .f. 

   

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
                    //cTxt1                    
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
        //SaveLog('Out1.txt' ,  aMapsCol[n1][1] + '  Pos1 : ' + Str(aMapsCol[n1][2])  + '   Pos2 : ' +  Str(aMapsCol[n1][3]) + '  Tam : ' + Str(aMapsCol[n1][5]) + XQUEBRA  )
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

  //  Local nUnit := xRetUnit()
   // Local nColx 

    Local nCol := 0
    Local nSaveCol1 := 0
    //-(nColHeader)

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
    end If 

    
	If nHWnd == GetControlHandle(  'Label2' ,  cHeaderSombra )
	//If nHWnd == GetProperty(  cHeaderSombra   , "HANDLE" )


        If (nMsg == WM_LBUTTONDBLCLK)	

            nColSele := nColSel1            

            lAscending    := !lAscending
            nOrdemSel     := nColSele             

             
            BT_ClientAreaInvalidateAll(cHeaderJan)
            SysWait(0.01)          
            xDcBarHeader()              

            xOrdene( nOrdemSel , lAscending )

        End If 

     
        If (nMsg == WM_LBUTTONDOWN)	

            DO EVENTS

            //msginfo('ok2')
             
            //msginfo(Str(nColSel1))

            nColSele := nColSel1            

          //  If xCheckOk()
             //  msginfo('Dbl Click' )     
             //  lAscending    := !lAscending
             //  nOrdemSel     := nColSele
         //   End If     


            BT_ClientAreaInvalidateAll(cHeaderJan)
            SysWait(0.02)          
            xDcBarHeader()                  

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

                            SysWait(0.05)                            

                            lOk  := .t. 
                            nColx := nColx2 

                        End If 

                        SysWait(0.02)                        

                Enddo                 

                If lOk 


                    SetWindowCursor( GetActiveWindow()  , 'CURSOR1'  )

                    DO EVENTS 

                    xMapCols( aCabecs , aColsTam , aTipsy )

                    If !SetCampoTam(	cTabela  , Alltrim(   aCabecs[nSaveCol1]      ) , aColsTam[nSaveCol1] )
                        xDialog( Hb_AnsitoOem("Não Foi Possivel Atualizar o Dicionario.") )
                    End If 

                    //SysWait(0.02)
                    
                    BT_ClientAreaInvalidateAll(cHeaderJan)
                    //SysWait(0.02)
                    xDcBarHeader()
                    DO EVENTS 

                    xAtuDados( 3 , .t. ,  aColsTam  )

                    SetWindowCursor( GetActiveWindow()  , 'IDC_ARROW'  )

                    DO EVENTS 


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

            xOffBarVert( Nil )
            SysWait(0.01)
				

            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i

            s1 := ''
            s2 := ''


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
                xDcBarHeader()
                DO EVENTS 
                Return 
            End If        

               


            If ((nColx2 := xSearchLim(  nColx )) > 0)
                xDoHint(    , 'Redimensiona a Coluna ' + Alltrim(aMapsCol[nColx2][1]) + '  '  + Str(nColSel1))                
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
	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {117,124,131}  , {137,143,150} )

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
        
            
    End If       



    BT_DeleteDC (BTstruct )
    BT_BitmapRelease (hBitOk)

    BT_BitmapRelease (hBitOrd1)
    BT_BitmapRelease (hBitOrd2)



REturn 
