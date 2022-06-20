

#include <hmg.ch>
#include "inkey.ch"
#include <minigui.ch>
#require "hbxpp"
#include <hmg.ch>
#include <dll.ch>
#include "hbthread.ch"
#define XQUEBRA Chr(13)+Chr(10)
//#DEFINE FONTBROWSER 'Lucida Sans Typewriter'

//#DEFINE FONTBROWSER 'Courier New'

Static cBarraName := ''
Static cBarraSombra := ''
Static nLarTotalx := 0
Static nAcende := 0
Static nColDrag := 18
Static lTracking26 := .f. 
Static lTracking37 := .f. 
Static lDispo1 := .t. 
Static nColBarra := 18
Static nModeBut := 0
Static nSaveCol := 0
Static lDragMode := .f. 
Static nLargJan := 0
Static nScroxy := 21
Static lEnabledy := .t. 
Static cBrwName := ''
Static nTotScr1 := 0

Static nTamBarra := 0
Static nLargCalc := 0
Static nColtotal := 0
Static lDesligado := .f. 
Static cHead1 := ''
Static nAcumZ1 := 0
Static nEtapas := 0 
Static nMaxBarh := 0
Static nQ1 := 0
Static nQContador := 0
Static nQContador2 := 1
Static lDraHighM := .f. 
Static lChaveY := .f. 
Static nPAssoy := 0
Static aMtrVolta := {}
Static lTracking44 := .f. 





Function xBarHMtr( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela  , cBrowser , nTotCol , nTamBar , cHeaderN1  , lDispo1  , nColuna )

   
    Private cJanName   := 'Win_BhMtr' + Left(cParent,4)
    Private cJanSombra := 'Win_SombraBhMtr' + Left(cParent,4)
    cBarraSombra := cJanSombra
    nLarTotalx   := nLarguraTot2
    cBarraName   := cJanName
    cBrwName     := cBrowser
    nLargJan     := nLargJanela

    nLargCalc := xCalcTam()


    lEnabledy := lDispo1

    nQ1 := xH_LQtot()

    

    nColTotal := nTotCol   
    
    nTamBarra := Int((nLargJanela * (   nLargJanela/xCalcTam()     )    )) - 20

    nPassoy := Int( (GetProperty(  cBrowserName , 'Width'  ) - nTamBarra ) / nQ1 )

    //msginfo(Str(  nQ1 ))

    
    cHead1 := cHeaderN1   

        
    DEFINE WINDOW &cJanName ;
        AT nLinha1 , nColuna ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 20 ;
        TITLE 'xScroxRoleol1' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLACK   ;
        ON PAINT xPaintBarraH( ThisWindow.Name , nAcende , nColDrag ) 
    END WINDOW  

    nMaxBarh := GetProperty(  cBrowserName , 'Width'  ) 
    //+ 12
    

    //msginfo(  Str(GetProperty(  cBrowserName , 'Width'  )+22) )


    DEFINE WINDOW &cJanSombra ;
        AT nLinha1 , nColuna ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 40 ;
        TITLE 'xScroxRoleol1Sombra' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR RGB(242,242,242) ;
        ON MOUSEMOVE (cObjSelected := 'BarraH')	
    END WINDOW  


    
    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabledy , 167 , 0)


    If nQ1 > 0 
        nEtapas :=  Int( (GetProperty(  cBrowserName , 'Width'  ) - nTamBarra)  /   nQ1 )                
    End If     	

    If lEnabledy     
        lEnabledy := (nTamBarra > 0)
    End If 
 


    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabledy , 167 , 0)
    If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarMtr"  ) )  ) = 0) .And. (lEnabledy)
        InstallEventHandler( "EventBarMtr" )		
    End If
    HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER, NIL, .T. )

     
Return cJanName    


Function ySetBarTam(nTamanho , nQz)
    //nWidBarra := nTamanho    

    nTamBarra := nTamanho  
  

    nQ1 := nQz 

    // yCalcEtap1()
    nEtapas :=  Int( (GetProperty(  cBrwName , 'Width'  ) - nTamBarra)  /   nQ1 )                

    BT_ClientAreaInvalidateAll(cBarraName)  
    yDcBarH1()

    Do Events 

REturn 


Function Xh_RetPasy()
Return nPassoy


Static Function xShowHint( nRow1 , nCol1 , cMsg )


    If !_isWindowDefined("Win_Msg")
        CrieJanTip( nRow1 - 20  , nCol1 - 250   ,   Alltrim(cMsg)      ,, 0.5 )
    Else
        xDispHint( Alltrim(cMsg)  , nRow1 - 20 ,  nCol1 - 250  )
    End If

    xDispUpTam(cMsg)

    BringTop('xHint')

REturn     




Static Function xCalcBarH( nWidth )

    Local nCalc := 0
    Local n2    := 0
    Local nLargTotal := nWidth - (nColTotal * 20)
    


Return nLargTotal 

Function yGoBarR()

    nScroxy  := (GetProperty( cBarraName  , 'Width') ) - nTamBarra - 5
    nColDrag := (GetProperty( cBarraName  , 'Width') ) - nTamBarra - 5

    
    BT_ClientAreaInvalidateAll(cBarraName)  
    yDcBarH1()
    
    Do Events
    Do Events


Return     

Function yGoBarl()

    nScroxy  := 21
    nColDrag := 21
    
    BT_ClientAreaInvalidateAll(cBarraName)  
    yDcBarH1()

    Do Events
    Do Events    

REturn     





Function xRetBarH()

REturn nScroxy    


Function yUpdatBha1( nPos1 )

    nScroxy += nPos1     
    nColDrag += nPos1 


    DoEvents()    
    BT_ClientAreaInvalidateAll(cBarraName)  

    DoEvents()  
    yDcBarH1()  


Return 


Static Function xPaintBarraH( cJanela , nAcende1  , nCol1 )

    //BT_DRAWEDGE


    Local BTstruct
    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
    LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local nWidBarra := nTamBarra - 20


    Local yEsquerda := BT_BitMapLoadFile('ESQUERDA')
    Local yDireita  := BT_BitMapLoadFile('DIREITA')

    Local hDC2 := BT_CreateDC (cJanela ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)

    DEFAULT nCol1 := 0



    lDesligado := .f. 


    If (nAcende1 > 0) .And. ( Alltrim(cObjSelected) = 'BarraH')

        If nAcende1 = 2
            yDireita  := BT_BitMapLoadFile('DIREITA1')
        Else 
            yEsquerda := BT_BitMapLoadFile('ESQUERDA1')
        End If 


        lDesligado := .t. 
    Else 
           

    End If 

    If (!lEnabledy)

        
        BT_BitmapRelease (yEsquerda)
        BT_BitmapRelease (yDireita)

        yEsquerda := BT_BitMapLoadFile('ESQUERDAD')
        yDireita  := BT_BitMapLoadFile('DIREITAD')

    End If 



    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )


    BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 20  	, 18  , 18  ,      BT_COPY,  yDireita)

    If Abs(nScroxy - Width) <= 10
        //   msginfo('lp2')
    End If 
 
    

    If (!lDragMode) .And. (lEnabledy) .And. (!lDraHighM)
        BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)
    Else 

        If lEnabledy
            If (lDragMode) .or. (lDraHighM) 
                BT_DrawFillRoundRect (hDC2 , 4 , nScroxy   , nWidBarra    , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
            Else 
                BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra  , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
            End If    
        End If     

    End If     

    BT_BitmapRelease (yEsquerda)
    BT_BitmapRelease (yDireita)

    BT_DeleteDC (BTstruct )


Return     


Function yGetBarNome(nTipo)

Return Iif(nTipo = 1, cBarraName, cBarraSombra)


Function yZeraConter()
    nQContador := 0
REturn 

Function yIncConter( lFrente )

    If lFrente     
        nQContador++        
    Else 
        nQContador--
    End If 

REturn     

Function yRetContador()
REturn nQContador

Function EventBarMtr( nHWnd, nMsg, nWParam, nLParam )

    Local cOpcao := ''
    Local nCol   := 0
    Local nRow   := 0
    Local lFirst := .f. 
    //	Local aR1

    Local nColx  := 0

    LOCAL Width  := BT_ClientAreaWidth  (cBarraName)

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


    If (nHWnd == GetProperty(  cBrwName , "HANDLE" ))

        If (nMsg == WM_MOUSEMOVE) 
            //msginfo('llp3')


        End If     

    End If         
    
    

    If (_IsWindowDefined(cBarraSombra)) .And.  (nHWnd == GetProperty(  cBarraSombra , "HANDLE" ))		


        //MOUSEDOWN BARRAH
        If (nMsg == WM_LBUTTONUP)           

            If nModeBut == 0
                nSaveCol := 0    
                
                yDcBarH1()
                lTracking26 := .t. 
                lDragMode := .f.           
                lDraHighM := .f. 
                SetBrwDrgM( .f. , nSaveCol )       
            
            End If            
          
        End If 


        //MOUSEDOWN BARRAH
        If (nMsg == WM_LBUTTONDOWN) 

            nColx := nSaveCol
            nColAnt := nSaveCol
            lFirst := .f.             
            nZacum := 0
            SysWait(0.02)

            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nCol := ar1[2]            

            If (nModeBut = 0)
                If (nCol >= nScroxy) .And. ( nCol <= (nScroxy+nWidBarra) )                    

                    If !lFirst
                        xShowHint( nRow , nCol , 'Click e Arraste Devagar para Navegar entre as Colunas.' )
                        lFirst := .t. 
                    End If 
                    DoEvents()
                    nModeBut := 999
                    lDragMode := .t.
                    nSaveCol := nCol   
                    SetBrwDrgM( .t. , nSaveCol )                                       
                End If     
            End If                             

//            For i := 1 To 255
  //              GetAsyncKeyState(i)
    //        Next i

            
            
            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i

            If (nModeBut = 1) .And. (!lTracking26)  

                While (nModeBut = 1) .And. (!lTracking26)           

                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        SysWait(0.03)                                   
                        Exit 
                    End If  

                    
                    //xDoScrolV( .f. , nQContador , @nTotScr1  , nQ1 )

                    
                    xDoScrolV( .f. )

                    /*
                    If (nQContador == 0)
                        xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida.Não É possivel Retroceder."))
                        Return 
                    End If                     
                    
                    nSoma1 := xH_ColVolta(  nTotScr1 )
                    nTotScr1 -= nSoma1                          

                    DoEvents()                    
                    SysWait(0.04)                               
                    xRoleTela( .f. , -(Xh_RetPasy()) , .t.   ,  nSoma1 , 1 )    


                    If (nQContador == 0)
                        nTotScr1 := 0
                    End If                                                                                    

                    For i := 1 To 255
                        GetAsyncKeyState(i)
                    Next i

                    HMG_CleanLastMouseMessage()                      
                    */

                
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


                    xDoScrolV( .t. )

                    /*

                    nSaldo1 := xH_ColResto( xH_RtLimite() )
                    aMInfo := xH_CalcPulo( nQContador + 1 , nSaldo1)
               
                    SysWait(0.05)

                    If (nQContador < nQ1)
                        xRoleTela( .t. , Xh_RetPasy() , .t.   ,  aMInfo[1] , aMInfo[2] )                                                                                       
                        nTotScr1 += aMInfo[1]
                        DoEvents()       
                    Else 
                        xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não É possivel Avançar.zz"))                     
                    End If     

                    For i := 1 To 255
                        GetAsyncKeyState(i)
                    Next i

                    HMG_CleanLastMouseMessage()                        
                    */
                    

                Enddo 

                 
            End If 


        End If 

      
        //MOUSEMOVE BARRAH
        If (nMsg == WM_MOUSEMOVE) 
            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nCol := ar1[2]
            lTracking26 := .f.       
            
            cObjSelected := 'BarraH'

            If (nCol > 18) .And. (nCol < (Width - 20))          
                If (!lTracking44)

                    If !lDragMode
                        DoEvents()
                        lDraHighM := .f.                     
                        DoEvents()						                                  
                    End If                 

                    yOffBarra( cBarraName  )                              
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
                        BT_ClientAreaInvalidateAll(cBarraName)
                        DoEvents() 
                        yDcBarH1()
                    End If 

                    If (nCol < 21)                        
                        nAcende := 1                        
                        BT_ClientAreaInvalidateAll(cBarraName)
                        nModeBut := 1
                        lTracking26 := .f. 
                        lTracking37 := .t. 
                        DoEvents() 
                        yDcBarH1()
                    End If 

                    If (nCol >= (Width - 18))                           
                        yLimpBarV()	                        
                        DoEvents() 
                        nAcende := 2                                             
                        BT_ClientAreaInvalidateAll(cBarraName)                        
                        nModeBut := 2            
                        lTracking26 := .f. 
                        lTracking37 := .t.  
                        DoEvents()                        
                        yDcBarH1()                          
                    End If 

                End If 

            End If     

            

            If (nModeBut = 0)

                lDraHighM := .f.

                If (nCol >= nScroxy) .And. ( nCol <= (nScroxy+nWidBarra) )                                        
                    If ar1[1] <= 20
                        lDraHighM := .t.                        
                    End If     
                Else 
                    lDragMode := .f.
                    lFirst    := .f. 
                End If                       
                nAcende := 0
                BT_ClientAreaInvalidateAll(cBarraName)

                DoEvents() 
                yDcBarH1()
                lTracking26 := .f.
                lTracking37 := .f. 

            End If             


        End If 			
    End If 


Return 

Function xInitSxy()
    nScroxy := 21
Return 



Function xDoScrolV( lFrente , lAtuBar )

    //, nQCont1 , @nTotY1  , nQTot1  )

    Local nSaldo1 := xH_ColResto( xH_RtLimite() )
    Local aMInfo := xH_CalcPulo( nQContador + 1 , nSaldo1)
    Local nSoma1 := 0

    DEFAULT lAtuBar := .t. 
               
    SysWait(0.05)

    If lFrente
        If (nQContador < nQ1)
            xRoleTela( .t. , Xh_RetPasy() ,  lAtuBar   ,  aMInfo[1] , aMInfo[2] )                                                                                       
            nTotScr1 += aMInfo[1]
            DoEvents()       
        Else 
            xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não É possivel Avançar.zz"))                     
        End If     
    Else 

        If (nQContador == 0)
            xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida.Não É possivel Retroceder."))
            Return 
        End If                     
                    
        nSoma1 := xH_ColVolta(  nTotScr1 )
        nTotScr1 -= nSoma1                          

        DoEvents()                    
        SysWait(0.04)                               
        xRoleTela( .f. , -(Xh_RetPasy()) ,  lAtuBar    ,  nSoma1 , 1 )    


        If (nQContador == 0)
            nTotScr1 := 0
        End If                                                                                    

        For i := 1 To 255
            GetAsyncKeyState(i)
        Next i

        HMG_CleanLastMouseMessage()                              

    End If


REturn 



Function xRoleTela( lFrente , nQp1  , lUpdBar1  , nConter , nQSkip )

    DEFAULT lUpdBar1 := .t. 
    
     
    If !lFrente         
        nQContador -= nQSkip
        yScrollCaM( .f. , .f. , nConter )

        If lUpdBar1
            yUpdatBha1( nQp1     )	
        End If    

        yDcBarH1()                                
        SysWait(0.02)
        yDcBarH1eMtr()
        DoEvents()
        If (nQContador == 0) 
            nScroxy := 21
        End If         
    Else 
    
        nQContador += nQSkip
                
        yScrollCaM( .t. , .f. , nConter )                            
        If lUpdBar1
            yUpdatBha1( nQp1    )	
        End If     
        yDcBarH1()                                
        SysWait(0.02)                                             
        yDcBarH1eMtr()        
    End If 

Return 





Function yCheckObj()

    If (!Empty(Alltrim(cObjSelected)) ) .And. (cObjSelected != "Browser")


        If _isWindowDefined(cBarraName)  
            If !lDragMode		
                yOffBarra(   cBarraName )
            End If     
            //SysWait(0.02)		

            yApagueH( cHead1 )
            DoEvents()

        End If             

        //msginfo('ok2')

    End If 	  
    

REturn 


Function yRetAcende()
Return nAcende


Function yOffBarra( cBarName  )
      
    lDragMode := .f.     
    lDraHighM := .f.
  
    nAcende := 0
    nModeBut := 0

    
    BT_ClientAreaInvalidateAll(cBarName)

    yDcBarH1()

    lTracking26 := .f.    
    lTracking37 := .f.    

    

REturn 


Function yEnable1Bh(  lEnabled1 )

    lEnabledy := lEnabled1

    If !lEnabled1
        yOffBarra( cBarraName )
    End If 

    DO EVENTS 

REturn 

Function yGetScrXy( lFlag )
Return Iif( !lFlag , nScroxy , nScroxy+nTamBarra)    

Function yDcBarH1()

    Local Width1  := BT_ClientAreaWidth  (cBarraName)
    Local Height1 := BT_ClientAreaHeight (cBarraName)

    LOCAL hDC1, BTstruct1
    LOCAL hDC2, BTstruct2

    Local nTypeText    := BT_TEXT_TRANSPARENT    
    Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP 
    Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
	


    Local Width2  := BT_ClientAreaWidth  (cBarraSombra)
    Local Height2 := BT_ClientAreaHeight (cBarraSombra)

    hDC1 = BT_CreateDC (cBarraName, BT_HDC_ALLCLIENTAREA, @BTstruct1)
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

