

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
Static nScroxy := 18
Static lEnabledy := .t. 
Static cBrwName := ''

Static nTamBarra := 0

Static nColtotal := 0
Static nColz2 := 1
Static lDesligado := .f. 
Static cHead1 := ''

Static nAcumZ1 := 0

Static nEtapas := 0 

Static nQ1 := 0
Static nQContador := 0





Function xBarHMtr( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela  , cBrowser , nTotCol , nTamBar , cHeaderN1  , lDispo1  , nColuna )

   
    Private cJanName   := 'Win_BhMtr' + Left(cParent,4)
    Private cJanSombra := 'Win_SombraBhMtr' + Left(cParent,4)
    cBarraSombra := cJanSombra
    nLarTotalx   := nLarguraTot2
    cBarraName   := cJanName
    cBrwName     := cBrowser
    nLargJan     := nLargJanela


    lEnabledy := lDispo1



    nQ1 := yCalcEtap1()


    nColTotal := nTotCol   
    nTamBarra := nLargJanela -  ( nQ1 * nConst1 )
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


    BT_ClientAreaInvalidateAll(cBarraName)  
    yDcBarH1()


    Do Events
    Do Events


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


    If (nAcende1 > 0)

        If nAcende1 = 2
            yDireita  := BT_BitMapLoadFile('DIREITA1')
        Else 
            yEsquerda := BT_BitMapLoadFile('ESQUERDA1')
        End If 

        lDesligado := .t. 

    End If 

    If (!lEnabledy)
        yEsquerda := BT_BitMapLoadFile('ESQUERDAD')
        yDireita  := BT_BitMapLoadFile('DIREITAD')
    End If 



    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )


    BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 20  	, 18  , 18  ,      BT_COPY,  yDireita)

    If Abs(nScroxy - Width) <= 10
        //   msginfo('lp2')
    End If 
    /*
    If !lEnabled
        BT_BitmapRelease (yEsquerda)
        BT_BitmapRelease (yDireita)
	    BT_DeleteDC (BTstruct )
        msginfo('ok2')
      //  Return 

    End If 
    */

    If (!lDragMode) .And. (lEnabledy)
        BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)
    Else 

        If lEnabledy

            If (lDragMode) 
                BT_DrawFillRoundRect (hDC2 , 4 , nCol1   , nWidBarra    , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
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
        //msginfo('g22')
    Else 
        nQContador--
    End If 

REturn     

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
    Local nZ1 := 0
    Local nLinx := 0
    Local nLinAnt := 0
	

    //If (_IsWindowDefined(cBarraName)) .And.  (nHWnd == GetProperty(  cBarraName , "HANDLE" ))		

    If (_IsWindowDefined(cBarraSombra)) .And.  (nHWnd == GetProperty(  cBarraSombra , "HANDLE" ))		


        If (nMsg == WM_LBUTTONUP)

            SysWait(0.02)
            lDragMode := .f. 
            //  lTracking26 := .t. 
            //msginfo('ok2')
           

        End If 


        If (nMsg == WM_LBUTTONDOWN) 

            nColx := nSaveCol
            nColAnt := nSaveCol
            lFirst := .f.             
            nZacum := 0
            SysWait(0.02)

            //nEtapas := 65

            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i
           
            While (lDragMode) .And. (!lTracking26)

                // Do Events

                GetCursorPos (@nCol, @nRow)
                ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
                nColx := ar1[2]
                nLinx := ar1[1]

                lOk := .f.                    

                If !lFirst
                    xShowHint( nRow , nCol , 'Click e Arraste Devagar para Navegar entre as Colunas.' )
                    lFirst := .t. 
                End If 

                If ((GetAsyncKeyState(VK_LBUTTON)) == 0) .And. ( _isWindowDefined(cBarraName)  )					

                    yOffBarra(cBarraName)
                    yDcBarH1()
                    lTracking26 := .t. 
                    Do Events          
                    //msginfo('22')        
                End If 	
                    

                If (nColx != nColAnt)
                    If (nColx > nColAnt)        
                            
                        If nLinAnt != 0
                            If (Abs(nLinAnt - nLinx) >= 10)
                                lTracking26 := .t. 
                                Do Events          
                                Exit                                  
                            End If  
                        End If     
                            
                         
                        nW1 := xGetColW1( nColz2 ) - 3                                
                                                       
                        If ((nColx - nColAnt) >= 1  )      

                            If (nQContador  == nQ1)
                                xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não É possivel Avançar. " + Str(nQContador) + '  ' + Str(nQ1)))
                                Exit
                            End If 


                            If ( (nColDrag+nWidBarra) > (Width - 7))                                                                    
                                SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_RIGHT ,15  )                                           
                                nAcumZ1 := 0
                                SysWait(0.02)
                                nQContador++
                                nColAnt  := nColx                                                                       
                                EXIT                                 
                            End If 
                                  
                            nAcumZ1  += (nColx - nColAnt)
                            nColAnt  := nColx      
                            nLinAnt  := nLinx
                            n12 := nw1     
                             
                            If (nAcumZ1 >= nConst1 )                                                                      

                                nColDrag += nConst1
                                nScroxY  += nConst1
                                    
                                SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_RIGHT ,15  )                                   
                                nZ1  += nEtapas                                                                     

                                nAcumZ1 := 0
                                nQContador++                                                                  
                                    

                            End If                                                                                       

                            SysWait(0.01)
                            BT_ClientAreaInvalidateAll(cBarraName)                                      
                            yDcBarH1()                                    

                            //Do Events     

                            yDcBarH1eMtr()

                            DO EVENTS                               

                        End If           

                    Else 
                            

                        If ( Abs(nColAnt - nColx) ) >= 1

                            If (nQContador == 0)
                                xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida.Não É possivel Retroceder..."))
                                Exit
                            End If 

                                    
                            If nLinAnt != 0
                                If (Abs(nLinAnt - nLinx) >= 10)
                                    lTracking26 := .t. 
                                    Do Events          
                                    Exit                                  
                                End If  
                            End If     


                            If (nColDrag <= 21)                                    
                                nAcumZ1 := 0
                                nColAnt := nColx 
                                nQContador--                                    
                                SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_LEFT ,353  )  
                                DO EVENTS                                
                                Exit 
                            End If                                 


                            nAcumZ1  += Abs(nColAnt - nColx)                                    
                            nColAnt  := nColx 
                            nLinAnt  := nLinx
                               

                            If (nAcumZ1 >= nConst1)                               

                                nColDrag -= nConst1
                                nScroxY  -= nConst1

                                SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_LEFT ,353  )                                     
                                nAcumZ1 := 0
                                nQContador--                                                                                                                
                                    
                            End If                                                

                            BT_ClientAreaInvalidateAll(cBarraName)                                      
                            yDcBarH1()                                         

                            Do Events
                            yDcBarH1eMtr()
                            DO EVENTS 
                      
                        Else 

                        End If     
                       
                    End If 


                    If (lOk) .And. (!lTracking26)                             
                        SysWait(0.01)
                    End If     

                      
                End If   

                For i := 1 To 255
                    GetAsyncKeyState(i)
                Next i
                    
                                                                   

            Enddo  

            nZacum := 0

            //msginfo(Str(nAcumZ1)+ '  ' + Str(nConst1) )



            //msginfo('out')

            If lFirst
                lDragMode := .f.                            
                lTracking26 := .f.            
                lTracking37 := .f.            
                lFirst := .f.         
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
                        
                    If (nQContador > 0)

                        yDecrLefa()    
                        yScrollCaM( .f. , .f. )
                            

                        nQContador--
                            
                        yUpdatBha1( -nConst1     )	
                        yDcBarH1()                                
                        SysWait(0.03)

                        yDcBarH1eMtr()
                        DO EVENTS 
                                
                    Else 
                        xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida.Não É possivel Retroceder."))
                    End If     

                    SysWait(0.05)

                    For i := 1 To 255
                        GetAsyncKeyState(i)
                    Next i

                    HMG_CleanLastMouseMessage()                      
                
                Enddo 

            End If 
            



            If (nModeBut = 2) .And. (!lTracking26)                                        
                    
                For i := 1 To 255
                    GetAsyncKeyState(i)
                Next i              
                 
                DO EVENTS              
                   
                While (nModeBut = 2) .And. (!lTracking26)                                 

                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        SysWait(0.03)                                   
                        Exit 
                    End If    

                    If !(nQContador  == nQ1)

                        yScrollCaM( .t. , .f. )
                            
                        yUpdatBha1( nConst1     )	
                        yDcBarH1()                                
                        SysWait(0.03)
                        nQContador++
                        //msginfo('lp33333')

                        yDcBarH1eMtr()
                        //DO EVENTS 

                        SysWait(0.05)

                    Else 
                        xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não É possivel Avançar.zz"))
                        SysWait(0.05)
                    End If     

                    For i := 1 To 255
                        GetAsyncKeyState(i)
                    Next i

                    HMG_CleanLastMouseMessage()                        

                Enddo 

                 
            End If 


        End If 

        If (nMsg == WM_MOUSELEAVE) 
            // msginfo('ok')

        End If 

        If (nMsg == WM_MOUSEMOVE)     

            
            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nCol := ar1[2]

            //   msginfo('mm')

            If (ar1[1] >= 20)        


                If _isWindowDefined(cBarraName)  
                    yOffBarra( cBarraName  )
                    Return Nil
                End If     


            End If 

            If (nCol > 18) .And. (nCol < (Width - 18)) 
                nModeBut := 0

            Else                         
            
                If (!lTracking37)					

                    nModeBut := 0
                
                    SetWindowCursor( nHWnd , IDC_ARROW )

                    If nAcende > 0
                        nAcende := 0
                        BT_ClientAreaInvalidateAll(cBarraName)
                        Do Events 
                        yDcBarH1()
                    End If 


                    If (nCol < 18)  
                      
                        nAcende := 1
                        BT_ClientAreaInvalidateRect( cBarraName  , 0,0,25,20 , .t.    )
                        nModeBut := 1
                        lTracking26 := .f. 
                        lTracking37 := .t. 
                        Do Events 
                        yDcBarH1()
                    End If 

                    If (nCol >= (Width - 25)) 

                        //SysWait(0.01)
                 
                        nAcende := 2
                        //BT_ClientAreaInvalidateRect( cBarraName  , 0,  (Width - 25)    ,25,20 , .t.    )
                        BT_ClientAreaInvalidateAll(cBarraName)
                        nModeBut := 2            
                        lTracking26 := .f. 
                        lTracking37 := .t.  
                        Do Events                        
                        yDcBarH1()
                        //msginfo('ok2')
                      
                    End If 

                End If 

            End If     

            If (nModeBut = 0)

                If (nCol >= nScroxy) .And. ( nCol <= (nScroxy+nWidBarra) )                    
                    nModeBut := 999
                    lDragMode := .t.
                    nSaveCol := nCol             
                Else 
                    lDragMode := .f.
                    lFirst    := .f. 
                End If 


                BT_ClientAreaInvalidateAll( cBarraName )
                Do Events 
                yDcBarH1()

                // msginfo('ok')

                nAcende := 0
                BT_ClientAreaInvalidateAll(cBarraName)


                lTracking26 := .f.
                lTracking37 := .f. 

            End If 
        End If 			
    End If 


Return 





Function yCheckObj()

    If (!Empty(Alltrim(cObjSelected)) ) .And. (cObjSelected != "Browser")

        If _isWindowDefined(cBarraName)  		
            yOffBarra(   cBarraName )
            SysWait(0.02)		

            yApagueH( cHead1 )

            DO EVENTS
        End If             

        //msginfo('ok2')

    End If 	  

REturn 


Function yOffBarra( cBarName  )
      
    lDragMode := .f.  
    SetWindowCursor( GetFormHandle( cBarName )  , IDC_ARROW  )
               
    BT_ClientAreaInvalidateAll( cBarName )
    Do Events 
    yDcBarH1()
    // msginfo('ok')
    nAcende := 0
    BT_ClientAreaInvalidateAll(cBarName)

    yDcBarH1()

    lTracking26 := .f.
    lTracking37 := .f.    

    Do Events

REturn 

Static Function xLuzOff( cJanela )

    nAcende   :=  0
    lDragmode := .f. 
    BT_ClientAreaInvalidateAll(cJanela)


Return 



Function yEnable1Bh(  lEnabled1 )

    lEnabledy := lEnabled1

    If !lEnabled1
        yOffBarra( cBarraName )
    End If 

    DO EVENTS 

REturn 

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

