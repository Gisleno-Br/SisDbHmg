

#include <hmg.ch>
#include "inkey.ch"
#include <minigui.ch>
#require "hbxpp"
#include <hmg.ch>
#include <dll.ch>
#include "hbthread.ch"
#define XQUEBRA Chr(13)+Chr(10)
//#DEFINE FONTBROWSER 'Lucida Sans Typewriter'

#DEFINE FONTBROWSER 'Courier New'

Static cBarraName := ''
Static cBarraSombra := ''
Static nLarTotalx := 0
Static nAcende := 0
Static lTracking26 := .f. 
Static lDispo1 := .t. 
Static nColBarra := 18
Static nModeBut := 0
Static nSaveCol := 0
Static lDragMode := .f. 
Static nLargJan := 0
Static nScroxy := 18
Static lEnabled := .t. 
Static cBrwName := ''


Function xBarraH( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela  , cBrowser )


   Private cJanName := 'Win_Bh' + LEft(cActiveJan,4)
   Private cJanSombra := 'Win_SombraBh' + LEft(cActiveJan,4)
   cBarraSombra := cJanSombra
   nLarTotalx   := nLarguraTot2
   cBarraName   := cJanName
   cBrwName     := cBrowser
   nLargJan     := nLargJanela
        
    DEFINE WINDOW &cJanName ;
        AT nLinha1 ,  GetProperty(  cBrowserName , 'Col'  )  ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 20 ;
        TITLE 'xScroxRoleol1' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
        ON PAINT xPaintBarraH( ThisWindow.Name , nAcende )
    END WINDOW  


    DEFINE WINDOW &cJanSombra ;
        AT nLinha1 ,  GetProperty(  cBrowserName , 'Col'  )  ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 20 ;
        TITLE 'xScroxRoleol1Sombra' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR BLACK   
    END WINDOW  

	
    
    lEnabled := (xCalcBarH() > 0)
    //lEnabled := .f. 


    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabled , 167 , 0)
    If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarra"  ) )  ) = 0) .And. (lEnabled)
		InstallEventHandler( "EventBarra" )		
	End If
    HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER, NIL, .T. )

     
Return     


Function xShowHint( nRow1 , nCol1 , cMsg )


	If !_isWindowDefined("Win_Msg")
		CrieJanTip( nRow1 - 20  , nCol1 - 250   ,   Alltrim(cMsg)      ,, 0.5 )
	Else
		xDispHint( Alltrim(cMsg)  , nRow1 - 20 ,  nCol1 - 250  )
	End If

	xDispUpTam(cMsg)

	BringTop('xHint')

REturn     



Function xCalcBarH()

	Local nCalc := 0
    Local n2    := 0
	Local nLargTotal := GetProperty(  cBarraName , 'Width'  ) - 58

    Local n1 := (( nLargJan  / nLarTotalx) * 100)
    Local nConst := Int(nLarTotalx / 10)
    //270



	
    If (nLarTotalx <= nLargJan) .or. (n1 >= 95)
        nCalc := 0
        nConst := 0
    Else         
         nCalc := Int((  n1 / 100) * nLargJan   )
    End If    

    //nCalc := nLarTotalx - nLargJan 


Return nCalc - nConst





Function UpdateBarH( nPos )


Return 


Function xPaintBarraH( cJanela , nAcende1 )

    //BT_DRAWEDGE

    Local BTstruct
    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local nWidBarra := xCalcBarH()

    Local yEsquerda := BT_BitMapLoadFile('ESQUERDA')
    Local yDireita  := BT_BitMapLoadFile('DIREITA')

    Local hDC2 := BT_CreateDC (cJanela ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)


    If (nAcende1 > 0)

        If nAcende1 = 2
            yDireita  := BT_BitMapLoadFile('DIREITA1')
        Else 
            yEsquerda := BT_BitMapLoadFile('ESQUERDA1')
        End If 

    End If 

    If (!lEnabled)
        yEsquerda := BT_BitMapLoadFile('ESQUERDAD')
        yDireita  := BT_BitMapLoadFile('DIREITAD')
    End If 



    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )


    BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 20  	, 18  , 18  ,      BT_COPY,  yDireita)

    If (!lDragMode) .And. (lEnabled)
        BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra - 6 , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)
    Else 

        If lEnabled
            BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra - 6 , 10 , 5 ,5 ,  {12,134,166}   , {166 , 166 , 166}  , 0)
        End If     

    End If     

    BT_BitmapRelease (yEsquerda)
    BT_BitmapRelease (yDireita)
	BT_DeleteDC (BTstruct )

Return     


Function xGetBarName(nTipo)

Return Iif(nTipo = 1, cBarraName, cBarraSombra)




Function EventBarra( nHWnd, nMsg, nWParam, nLParam )

	Local cOpcao := ''
	Local nCol   := 0
	Local nRow   := 0
    Local lFirst := .f. 
//	Local aR1

    Local nColx  := 0

    LOCAL Width  := BT_ClientAreaWidth  (cBarraName)

    Local nWidBarra := xCalcBarH() - 6

    //Local nWidBarra := xCalcBarH()

    Local nLimite := nLarTotalx - nLargJan - 25
    Local nLimite2 := nLarTotalx  

    //- nWidBarra
    //nLarTotalx 
    //- nLargJan  

    Local ar1 

    Local lOk := .f. 

    Local nColAnt := 0

    Local lOk2 := .f. 

    Local i 
    Local lTte := .f. 
    Local lTtd := .f. 

    Local nZacum := 18

    Local n1 := 0


	

	//If (_IsWindowDefined(cBarraName)) .And.  (nHWnd == GetProperty(  cBarraName , "HANDLE" ))		

    If (_IsWindowDefined(cBarraSombra)) .And.  (nHWnd == GetProperty(  cBarraSombra , "HANDLE" ))		


        If (nMsg == WM_LBUTTONUP)

            SysWait(0.02)
            lDragMode := .f. 
           

        End If 


        If (nMsg == WM_LBUTTONDOWN) 

            nColx := nSaveCol
            lFirst := .f.             

            nZacum := 0

            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i
           
            While (lDragMode) .And. (!lTracking26)

                   // Do Events

                    GetCursorPos (@nCol, @nRow)
			        ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
			        nColx := ar1[2]

                  //  msginfo(Str(nColx))

                  //  CursorWe()

                    lOk := .f. 
                    
			        //SetWindowCursor( GetFormHandle(cBarraName) , IDC_SIZEWE)
                 //   CursorWe()                    
                

                    If !lFirst
                        xShowHint( nRow , nCol , 'Click e Arraste para Navegar entre as Colunas.' )
                        lFirst := .t. 
                    End If 


                    
			    //    SetWindowCursor( nHWND , IDC_SIZEWE)
                //    Do Events


               //     msginfo('ok2')



                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        xOffBarra(cBarraName)
                        xDcBarH()
                        lTracking26 := .t. 
                        Do Events                  
                    End If 	


                    If (nColx != nSaveCol)
                        If (nColx > nSaveCol)
                            If ( Abs(nColx - nSaveCol) ) >= 1                              
                                If  ( (nZacum+nWidBarra)  <  (nLimite2 ) )

                                    If nColAnt > 0
                                       nScroxy += (nColx  - nColAnt )     
                                       nZAcum +=  (nColx  - nColAnt )     

                                       n1 := (nColx  - nColAnt )  

                                      
                                    Else 
                                        nScroxy += Abs(nColx - nSaveCol)                                   
                                        nZacum += Abs(nColx - nSaveCol)

                                        n1 := Abs(nColx - nSaveCol)

                                        
                                    End If 


                                    nColAnt := nColx 
                                    SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_RIGHT ,  n1 )


                                    //SendMessage( GetFormHandle(cBarraSombra)  , WM_KEYDOWN , VK_RIGHT ,  n1 )
                                 	                              
                                   
                                    
                                    SysWait(0.01)                                   

                                    Do Events
                                    xDcBarH()

                                    SysWait(0.03)                                   
                                    lOk := .t. 

                                    //msginfo('ok2')

                                    

                                Else 
                                   // nColScrool := nLimite2 + 15
                                    MsgInfo( str(nZacum+nWidBarra) + '  ' + Str(   nLimite2    ) )
                                    //MsgInfo(Str( nZAcum ) + '  ' + Str(    nLimite2 - nWidBarra - 18 )   )
                                    lTtd := .t. 
                                    lTracking26 := .t. 
                                    xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não e possivel Avançar."))
                                    Exit 
                                End If                                     
                            End If           

                        Else 

                            If ( Abs(nSaveCol - nColx) ) >= 30
                                If nScroxy > 18
                                    nScroxy -= 30     
                                    SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_LEFT ,0  ) 
                                   // Do Events
                                    xDcBarH()

                                    lTte := .f. 
                                    lOk := .t.                                   
                                Else 

                                    lTte := .t. 

                                End If 
                            Else 

                            End If 
                        End If 

                        If (lOk) .And. (!lTracking26)
                             Do Events                    

                             If (lTtd)
                           //     nColScrool := nLimite2
                              //  msginfo('lp')
                             End If 

                             BT_ClientAreaInvalidateAll(cBarraName)                                                                        	    		          
                             SysWait(0.01)
                            nSaveCol := nColX
                            
                        End If     
                      
                    End If                                                           

            Enddo  


            //msginfo('out')

            If lFirst
                lDragMode := .f.            
                xShowBrw()
                lTracking26 := .f.            
                lFirst := .f.         
            End If 


            While (nModeBut = 1) .And. (!lTracking26)           

                If nScroxy > 18
                    nScroxy -= 30 
                    SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_LEFT ,0  ) 
                    Do Events                     
                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        lTracking26 := .t. 
                    End If 	
                    xDcBarH()
                    SysWait(0.03)

                Else 

                    Do Events                    
                    BT_ClientAreaInvalidateAll(cBarraName)                                    
                    SysWait(0.04)
                    lTracking26 := .t. 
                    xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida."))

                End If     
            End If 


            While (nModeBut = 2) .And. (!lTracking26)                                        

                If nScroxy <= (nLimite  * 10000055)                     
                    nScroxy += 10               
                    BT_ClientAreaInvalidateAll(cBarraName)                
                    SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_RIGHT ,0  )                     
                 //   Do Events                 
                    
                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        lTracking26 := .t. 
                        msginfo('ok')
                    End If 	


//                    Do Events

                    SysWait(0.01)    


                    xDcBarH()


                Else                    

                    Do Events                    
                    BT_ClientAreaInvalidateAll(cBarraName)                                    
                    SysWait(0.04)
                    lTracking26 := .t. 
                    xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida."))

                End If     

            End If 


        End If 

        If (nMsg == WM_MOUSELEAVE) 
           // msginfo('ok')

        End If 

		If (nMsg == WM_MOUSEMOVE) 					
            nModeBut := 0
            SetWindowCursor( nHWnd , IDC_ARROW )

            If nAcende > 0
               nAcende := 0
               BT_ClientAreaInvalidateAll(cBarraName)
               Do Events 
                xDcBarH()
            End If 

            GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
			nCol := ar1[2]

            If (nCol < 18)  
               CursorHand1( nHWnd  )
               nAcende := 1
               BT_ClientAreaInvalidateRect( cBarraName  , 0,0,25,20 , .t.    )
               nModeBut := 1
               lTracking26 := .f. 
               Do Events 
                xDcBarH()
            End If 

            If (nCol >= (Width - 18))
               CursorHand1( nHWnd  )
               nAcende := 2
               BT_ClientAreaInvalidateRect( cBarraName  , 0,  (Width - 25)    ,25,20 , .t.    )
               nModeBut := 2            
               lTracking26 := .f. 
               Do Events 
                xDcBarH()
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
                xDcBarH()

            End If 
		End If 			
	End If 

Return 


Function xOffBarra( cBarName  )

    lDragMode := .f.                        
    nAcende := 0
    SetWindowCursor(  GetFormHandle(cBarName ) , IDC_ARROW )   
    BT_ClientAreaInvalidateAll(cBarName)                         


REturn 

Function xLuzOff( cJanela )

    nAcende := 0
    lDragmode := .f. 
    BT_ClientAreaInvalidateAll(cJanela)

  //  SysWait(0.02)
  //  msginfo('ok')

Return 



Function xDcBarH()

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

//	BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
    If !lEnabled
        BT_DrawDCtoDCAlphaBlend (hDC2, 0, 0, Width2, Height2, 185 , BT_SCALE, hDC1, 0, 0, Width1, Height1)
    Else 
        BT_DrawDCtoDC (hDC2, 0, 0, Width2, Height2, BT_SCALE, hDC1, 0, 0, Width1, Height1)
    End If     


	//nTypeText    := BT_TEXT_TRANSPARENT    
	//nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP 
	//nOrientation := BT_TEXT_DIAGONAL_ASCENDANT
	//BT_DrawText (hDC2, 300, 50, "Mirror of the Win1", "Times", 42, YELLOW, BLACK, nTypeText, nAlingText, nOrientation)

	BT_DeleteDC (BTstruct1)
	BT_DeleteDC (BTstruct2)

	BT_ClientAreaInvalidateAll (cBarraSombra)

Return 

