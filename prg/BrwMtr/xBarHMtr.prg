

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


Static cBarraName2:= ''
Static cBarraSombra := ''
Static nLarTotalx := 0
Static nAcende := 0

Static lTracking26 := .f. 
Static lTracking37 := .f. 
//Static lDispo1 := .t. 
//Static nColBarra := 18
Static nModeBut := 0
Static nSaveCol := 0
Static lDragMode := .f. 
Static nLargJan := 0
Static nScroxy := 19
Static lEnabledy := .t. 
Static cBrwName := ''
//Static nTotScr1 := 0
//Static nTotScr2 := 0
Static lScrollFim := .f. 
Static lScrolIni  := .f. 
Static nTamBarra := 0
//Static nLargCalc := 0
Static nColtotal := 0
//Static lDesligado := .f. 
Static cHead1 := ''
//Static nAcumZ1 := 0
//Static nEtapas := 0 
//Static nMaxBarh := 0
Static nQ1 := 0
//Static nQ2 := 0
//Static nQContador := 0
//Static nQContador2 := 1

Static lDraHighM := .f. 
//Static lChaveY := .f. 
Static nPassoy := 0
//Static aMtrVolta := {}
Static lTracking44 := .f. 
//Static nLastInfo1 := 0
//Static nLastMove := 0
//Static nAcumy := 0
Static yBmpDireita  
Static yBmpEsquerda 
Static yBmpDireitad
Static yBmpEsquerdad 
//Static lTrackingH := .t. 
//Static lTracking85 := .f. 
//Static lFirst1 := .f. 
Static yBmpDireita2  
Static yBmpEsquerda2 
/*
private cBarraName := ''
private cBarraSombra := ''
private nLarTotalx := 0
private nAcende := 0
private nColDrag := 18
private lTracking26 := .f. 
private lTracking37 := .f. 
private lDispo1 := .t. 
private nColBarra := 18
private nModeBut := 0
private nSaveCol := 0
private lDragMode := .f. 
private nLargJan := 0
private nScroxy := 19
private lEnabledy := .t. 
private cBrwName := ''
private nTotScr1 := 0
private nTotScr2 := 0
private lScrollFim := .f. 
private lScrolIni  := .f. 
private nTamBarra := 0
private nLargCalc := 0
private nColtotal := 0
private lDesligado := .f. 
private cHead1 := ''
private nAcumZ1 := 0
private nEtapas := 0 
private nMaxBarh := 0
private nQ1 := 0
private nQ2 := 0
private nQContador := 0
private nQContador2 := 1
private lDraHighM := .f. 
private lChaveY := .f. 
private nPAssoy := 0
private aMtrVolta := {}
private lTracking44 := .f. 
private nLastInfo1 := 0
private nLastMove := 0
private nAcumy := 0
private yBmpDireita  
private yBmpEsquerda 
private yBmpDireitad
private yBmpEsquerdad 
private lTrackingH := .t. 
private lTracking85 := .f. 
private lFirst1 := .f. 
private yBmpDireita2  
private yBmpEsquerda2 
*/




Function xBarHMtr( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela  , cBrowser , nTotCol , nTamBar , cHeaderN1  , lDispo1  , nColuna )

   
    Private cJanName   := 'Win_BhMtr' + Left(cParent,4)
    Private cJanSombra := 'Win_SombraBhMtr' + Left(cParent,4)
    cBarraSombra := cJanSombra
    nLarTotalx   := nLarguraTot2
    cBarraName2   := cJanName
    cBrwName     := cBrowser
    nLargJan     := nLargJanela

    //nLargCalc := xCalcTam()

    yBmpDireita2  := BT_BitMapLoadFile('DIREITA1')    
    yBmpEsquerda2 := BT_BitMapLoadFile('ESQUERDA1')

    
    yBmpDireita  := BT_BitMapLoadFile('DIREITA')    
    yBmpEsquerda := BT_BitMapLoadFile('ESQUERDA')


    yBmpEsquerdad := BT_BitMapLoadFile('ESQUERDAD')
    yBmpDireitad  := BT_BitMapLoadFile('DIREITAD')


    lEnabledy := lDispo1
    nColTotal := nTotCol   

    nTamBarra := 0
    xH_CalcBar()

    cHead1 := cHeaderN1   

        
    DEFINE WINDOW &cJanName ;
        AT nLinha1 - 3, nColuna - 3 ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 20 ;
        TITLE 'xScroxRoleol1' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE  ; 
        ON PAINT xPaintBarraH( ThisWindow.Name , nAcende  ) 
    END WINDOW  

    //+ 12
    

    //msginfo(  Str(GetProperty(  cBrowserName , 'Width'  )+22) )




    DEFINE WINDOW &cJanSombra ;
        AT nLinha1 - 3 , nColuna - 3 ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 40 ;
        TITLE 'xScroxRoleol1Sombra' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR RGB(242,242,242) ;
        ON MOUSEMOVE (cObjSelected := 'BarraH')	
    END WINDOW  


    
    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabledy , 167 , 0)

    If lEnabledy     
        lEnabledy := (nTamBarra > 0)
    End If 


    xh_InitLim()
    //yZeraConter()

    If !_isWindowDefined('yFormSplah')
        WinYeLLow( GetProperty(cParent , 'Row') + GetProperty(  cBrowserName , 'Height'  )+65 ,  ;
        GetProperty(cParent , 'Col') + 25  , 'Click e Arraste Devagar para ' + XQUEBRA + ' Navegar entre as Colunas.'  )                               
    End If 


    

	HMG_ChangeWindowStyle(  GetFormHandle(cJanSombra) , Nil , WS_EX_STATICEDGE     ,  .t. , .T. )
 


    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabledy , 167 , 0)
    If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarMtr"  ) )  ) = 0) .And. (lEnabledy)
        InstallEventHandler( "EventBarMtr" )		
    End If

    //HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER , NIL, .T. )


     
Return cJanName    


Function xQbrwCol()
Return xH_xClcDir(  nColTotal  )




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

Function xH_CalcBar( lAtuBarra )
 
    Local nQB1 := xH_xClcDir(  nColTotal   )
    Local nTamAnt := nTamBarra
    Local nI1
    //Local nQ1 

    DEFAULT lAtuBarra := .f. 



    xh_InitLim()

    If nQB1 > 0
        nZ1 := Transform( (nQB1 / nColTotal) , '999,999.999999')         
        nP1 :=  Int( (nLargJan - 15)  * rTrans(  nZ1   ) )
        nTamBarra := (nLargJan - 15) - nP1               
        nPassoy := Int( np1 / (nQB1 - 1 )) 
        nQ1 := (nQB1 - 1 )             
        If _IsWindowDefined(cBarraName2)         
            BT_ClientAreaInvalidateAll(cBarraName2)  
            yDcBarH1()
            DoEvents() 
        End If     
    End If 
    
    xh_InitLim()

Return nQB1



Function yRetQPAsso()
Return nQ1 + 1



Function xRetBarH()
REturn nScroxy    


Function yUpdatBha1( nPos1 )

    nScroxy += nPos1     
   
    DoEvents()    
    BT_ClientAreaInvalidateAll(cBarraName2)  

    DoEvents()  
    yDcBarH1()  

Return 


Static Function xPaintBarraH( cJanela , nAcende1  )

    //BT_DRAWEDGE
    Local BTstruct
    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
    LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local nWidBarra := nTamBarra 
    Local hDC2 := BT_CreateDC (cJanela ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)



    If (!lEnabledy)

    End If 

    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )    

     If (!lEnabledy)
        BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerdad )
        BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireitad  )
    Else 

        If (nAcende1 > 0) .And. ( Alltrim(cObjSelected) = 'BarraH')

             If nAcende1 = 2
                BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerda )
                BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireita2  )
             Else 
                BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerda2 )
                BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireita  )
            End If 

        Else 
            BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,                  BT_COPY,  yBmpEsquerda )            
            BT_DrawBitmap (hDC2  , 0  , Width - 22  	, 18  , 18  ,      BT_COPY,  yBmpDireita  )
        End If 
    End If 
    

    If (!lDragMode) .And. (lEnabledy) .And. (!lDraHighM)
        BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}   , 0)        
    Else 

        If lEnabledy        
            If (lDragMode) .or. (lDraHighM) 
                If nScroxy >= 5
                    BT_DrawFillRoundRect (hDC2 , 4 , nScroxy   , nWidBarra    , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
                End If 
            Else 
                BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra  , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
            End If    
        End If     

    End If     

    BT_DeleteDC (BTstruct )

Return     


Function yGetBarNome(nTipo)

Return Iif(nTipo = 1, cBarraName2, cBarraSombra)


//Function yZeraConter()
    //nQContador := 0
// REturn 

// Function yIncConter( lFrente , nNumber1 )

//     DEFAULT nNumber1 := 1

//     If lFrente     
//         nQContador += nNumber1     
//     Else 
//         nQContador -= nNumber1
//     End If 

// REturn     


Function EventBarMtr( nHWnd, nMsg, nWParam, nLParam )

    Local cOpcao := ''
    Local nCol   := 0
    Local nRow   := 0
    Local lFirst := .f. 
    //	Local aR1

    Local nColx  := 0

    LOCAL Width  := BT_ClientAreaWidth (cBarraName2)

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

                DoEvents()
                
                yDcBarH1()
                lTracking26 := .t. 
                lDragMode := .f.           
                lDraHighM := .f. 
                SetBrwDrgM( .f. , nSaveCol )     

                SysWait(0.07)
               // msginfo('lp2')  
            
            End If            
          
        End If 


        //MOUSEDOWN BARRAH
        If (nMsg == WM_LBUTTONDOWN) 

            nColx := nSaveCol
            nColAnt := nSaveCol
            lFirst := .f.             
            nZacum := 0
         //   SysWait(0.02)
         

            GetCursorPos (@nCol, @nRow)
            ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
            nCol := ar1[2]      


            If (nModeBut = 0)
                If (nCol >= nScroxy) .And. ( nCol <= (nScroxy+nWidBarra) )                                   
                    
                    nModeBut := 999
                    lDragMode := .t.
                    nSaveCol := nCol   
                    SetBrwDrgM( .t. , nSaveCol )                                       
                    
                End If     
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
                    
                    nY2 := xDoScrolV( .f. ,  ,  )       
                    DoEvents()
                    SysWait(0.04)         

                    IncrCont1( .f.  , nY2)

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

                    nY2 := xDoScrolV( .t. ,,  )                   
                    SysWait(0.04)         

                    IncrCont1( .t. , nY2  )
                    DoEvents()

           
                Enddo 
                 
            End If 

            PostMessage( GetProperty(  cBarraSombra , "HANDLE" ) , WM_MOUSEMOVE , 0,0)
            DoEvents()



        End If 
      
        //MOUSEMOVE BARRAH
        If (nMsg == WM_MOUSEMOVE) 

            GetCursorPos (@nCol, @nRow)
            nCol2 := nCol 
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

                    yOffBarra( cBarraName2  )                              
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
                        BT_ClientAreaInvalidateAll(cBarraName2)
                        DoEvents() 
                        yDcBarH1()
                    End If 

                    If (nCol < 21)                        
                        nAcende := 1                        
                        BT_ClientAreaInvalidateAll(cBarraName2)
                        nModeBut := 1
                        lTracking26 := .f. 
                        lTracking37 := .t.                         
                        DoEvents() 
                        yDcBarH1()
                    End If 

                    If (nCol >= (Width - 18))                                                
                        yLimpBarV( '7')	                        
                        DoEvents() 
                        nAcende := 2                                             
                        BT_ClientAreaInvalidateAll(cBarraName2)                        
                        nModeBut := 2            
                        lTracking26 := .f. 
                        lTracking37 := .t.  
                        DoEvents()                        
                        yDcBarH1()                          
                    End If 
                End If 
            End If     

            

            If (nModeBut = 0) //.And. (!lTracking85)
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
                BT_ClientAreaInvalidateAll(cBarraName2)

                DoEvents() 
                yDcBarH1()
                lTracking26 := .f.
                lTracking37 := .f. 
            Else 

               


            End If          


        End If 			
    End If 


Return 

Function xInitSxy()
    nScroxy := 19
Return 




Function xDoScrolV( lFrente , lAtuBar ,  lAtuHead1 , lAviso1  , nColZ1)

 //   Local nSaldo1 := xH_ColResto( xH_RtLimite() )       
    //Local aMInfo := xH_CalcPulo( nQContador + 1 , nSaldo1)
    Local nW1 := GetProperty(  cBrwName , 'Width'  ) - 21
    Local np1
    Local nI1     
    Local nSoma1 := 0
    Local nColAtu := 0
    Local aMInfo := {}

    //DEFAULT lModo1 := .f. 
    DEFAULT lAtuBar := .t. 
    DEFAULT lAtuHead1 := .t. 
    DEFAULT lAviso1   := .t. 
               
    //SysWait(0.03)
    
    
    If lFrente                
        If (lScrollFim)
            If lAviso1
                xDialog( Hb_AnsiToOem("Não há Mais Tela para Rolar a Direita.")  )
            End If 
            Return -1
        End If                       

        nColAtu := xGetColPos( .t. )                                                                    
        nSaldo1 := xGetInfCw1(   nColAtu   , 5  ) 

          //  msginfo(Str(nColAtu))
        lScrolIni := .f. 

                
        If (xGetScrolPos() == 0)
            nSaldo1 += nColIniBrw 
        End If 

        DoEvents()
                                    

        xDoScrolHroz( .t. , nSaldo1 , lAtuHead1 , lAtuBar )       
        lScrollFim := ((xGetScrolPos()+xH_RtLimite()) >= (xCalcTam() ) )

        SysWait(0.02)
            
       // End If                    
    Else 
        

        If (lScrolIni) 
            If lAviso1
                xDialog( hb_ANSIToOEM("Não ha mais ESpaço para Rolar a Esquerda."))
            End If 
            Return -1
        End If 


        nColAtu := xGetColPos( .f. )   
        nSaldo1 := (xGetScrolPos() - xGetInfCw1(   nColAtu   , 2  )) + 5        

        aMInfo := {}
        Aadd(aMInfo , nSaldo1)
        Aadd(aMInfo , 1)

        DoEvents()
        SysWait(0.03)                

        xDoScrolHroz( .f. , nSaldo1 , lAtuHead1 , lAtuBar )
        lScrollFim := .f. 
        DoEvents()  

                  
        lScrolIni := (nColAtu == 1)

        If lScrolIni

            n1 := xGetScrolPos()
            If (n1 != 0)
                //  xDoScrolHroz( .f. ,  n1 , lAtuHead1 , lAtuBar )
            End If 

            xDoScrolHroz( .f. , n1 , lAtuHead1 , lAtuBar )

            DoEvents()

            xInitSxy()
            xInitScroll()
               
        End If             

    End If



Return nSaldo1


Function xDoScrolHroz( lFrente , nValue , lAtuH , lAtBar )

    DoEvents()
    yScrollCaM( lFrente , .f. , nValue , lAtuH  )      
    
    If lAtBar
        If xGetScrolPos()  != 0
            yUpdatBha1(  Iif(  !lFrente , -(Xh_RetPasy()) ,  Xh_RetPasy()  )    )            
            yDcBarH1()                                                             
        End If  
    End If  

    yDcBarH1eMtr()
    DoEvents()    

    
Return                     

/*
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


*/




Function yCheckObj()

    If (!Empty(Alltrim(cObjSelected)) ) .And. (cObjSelected != "Browser")


        If _isWindowDefined(cBarraName2)  
            If !lDragMode		
                yOffBarra(   cBarraName2 )
            End If     
            SysWait(0.02)		

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
        yOffBarra( cBarraName2 )
    End If 

    DoEvents() 

REturn 


Function yDcBarH1()

    Local Width1  := BT_ClientAreaWidth  (cBarraName2)
    Local Height1 := BT_ClientAreaHeight (cBarraName2)

    LOCAL hDC1, BTstruct1
    LOCAL hDC2, BTstruct2

    Local nTypeText    := BT_TEXT_TRANSPARENT    
    Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP 
    Local nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
	


    Local Width2  := BT_ClientAreaWidth  (cBarraSombra)
    Local Height2 := BT_ClientAreaHeight (cBarraSombra)

    hDC1 = BT_CreateDC (cBarraName2, BT_HDC_ALLCLIENTAREA, @BTstruct1)
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

