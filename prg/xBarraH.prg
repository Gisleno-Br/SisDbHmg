

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
Static lEnabled := .t. 
Static cBrwName := ''

Static nTamBarra := 0

Static nColtotal := 0
Static nColz2 := 1
Static lDesligado := .f. 
Static cHead1 := ''

Static nAcumZ1 := 0


Function xBarraH( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela  , cBrowser , nTotCol , nTamBar , cHeaderN1   )


   Private cJanName   := 'Win_Bh' + Left(cActiveJan,4)
   Private cJanSombra := 'Win_SombraBh' + Left(cActiveJan,4)
   cBarraSombra := cJanSombra
   nLarTotalx   := nLarguraTot2
   cBarraName   := cJanName
   cBrwName     := cBrowser
   nLargJan     := nLargJanela

   
   nColTotal := nTotCol   
   nTamBarra := nTamBar

   cHead1 := cHeaderN1


        
    DEFINE WINDOW &cJanName ;
        AT nLinha1 ,  GetProperty(  cBrowserName , 'Col'  )  ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 20 ;
        TITLE 'xScroxRoleol1' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
        ON PAINT xPaintBarraH( ThisWindow.Name , nAcende , nColDrag )
    END WINDOW  

    //msginfo(  Str(GetProperty(  cBrowserName , 'Width'  )+22) )


    DEFINE WINDOW &cJanSombra ;
        AT nLinha1 ,  GetProperty(  cBrowserName , 'Col'  )  ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+22   HEIGHT 40 ;
        TITLE 'xScroxRoleol1Sombra' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR RGB(242,242,242) ;
        ON MOUSEMOVE (cObjSelected := 'BarraH')	
    END WINDOW  


	
    
    lEnabled := (nTamBarra > 0)
    //lEnabled := .f. 


    SET WINDOW &cJanName TRANSPARENT TO Iif(!lEnabled , 167 , 0)
    If (Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarra"  ) )  ) = 0) .And. (lEnabled)
		InstallEventHandler( "EventBarra" )		
	End If
    HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER, NIL, .T. )

     
Return cJanName    


Function xShowHint( nRow1 , nCol1 , cMsg )


	If !_isWindowDefined("Win_Msg")
		CrieJanTip( nRow1 - 20  , nCol1 - 250   ,   Alltrim(cMsg)      ,, 0.5 )
	Else
		xDispHint( Alltrim(cMsg)  , nRow1 - 20 ,  nCol1 - 250  )
	End If

	xDispUpTam(cMsg)

	BringTop('xHint')

REturn     




Function xCalcBarH( nWidth )

	Local nCalc := 0
    Local n2    := 0
	Local nLargTotal := nWidth - (nColTotal * 20)
    


Return nLargTotal 

Function xGoBarR()

    nScroxy  := (GetProperty( cBarraName  , 'Width') ) - nTamBarra - 5
    nColDrag := (GetProperty( cBarraName  , 'Width') ) - nTamBarra - 5

    
    BT_ClientAreaInvalidateAll(cBarraName)  
    xDcBarH()


    
    Do Events
    Do Events


Return     

Function xGoBarl()

    nScroxy  := 21
    nColDrag := 21
    
    BT_ClientAreaInvalidateAll(cBarraName)  
    xDcBarH()

    Do Events
    Do Events    

REturn     



Function xRetBarH()

REturn nScroxy    


Function UpdateBarH( nPos1 )

    nScroxy += nPos1     
    nColDrag += nPos1 


    BT_ClientAreaInvalidateAll(cBarraName)  
    xDcBarH()


    Do Events
    Do Events


Return 


Function xPaintBarraH( cJanela , nAcende1  , nCol1 )

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

    If (!lEnabled)
        yEsquerda := BT_BitMapLoadFile('ESQUERDAD')
        yDireita  := BT_BitMapLoadFile('DIREITAD')
    End If 



    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )


    BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 20  	, 18  , 18  ,      BT_COPY,  yDireita)

    If Abs(nScroxy - Width) <= 10
     //   msginfo('lp2')
    End If 

    If (!lDragMode) .And. (lEnabled)
        BT_DrawFillRoundRect (hDC2 , 4 , nScroxy , nWidBarra , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)
    Else 

        If lEnabled

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

            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i
           
            While (lDragMode) .And. (!lTracking26)

                   // Do Events

                    GetCursorPos (@nCol, @nRow)
			        ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
			        nColx := ar1[2]

                    lOk := .f.                    

                    If !lFirst
                        xShowHint( nRow , nCol , 'Click e Arraste Devagar para Navegar entre as Colunas.' )
                        lFirst := .t. 
                    End If 

                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        xOffBarra(cBarraName)
                        xDcBarH()
                        lTracking26 := .t. 
                        Do Events                  
                    End If 	
                    

                    If (nColx != nColAnt)
                        If (nColx > nColAnt)                            

                            //Msginfo(Str(  Width   ))

                            nW1 := xGetColWidth( nColz2 ) - 3

                         //   Msginfo(Str(  nW1   ))
                                                       
                            If ((nColx - nColAnt) >= 10  )                                                               

                                If ( ( nColDrag+nWidBarra  )  >= (Width - 20)    )
                                    xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não É possivel Avançar."))                                      
                                    Exit
                                End 

                                  //  MsgInfo(Str(nColz2))  

                                    nAcumZ1 += (nColx - nColAnt)                                     

                                    nColDrag += (nColx - nColAnt)                                
                                    nScroxY  += (nColx - nColAnt)                                

                              //      msginfo(Str(  nAcumZ1  )  + ' ' + Str(nW1)  )

                                    nColAnt := nColx       


                                    n12 := nw1

                                    If (nAcumZ1 >= nW1) 
                                      //  msginfo('ok2')    
                                      /*
                                        lOk := .t.                                                                        
                                        nColz2++                                
                                        DoScrolly( n12 )                                    
                                        Do Events     
                                        UpdHeader( cHead1 , n12 )                                    
                                        SysWait(0.01)
                                        xDcToDc()	

                                        DO EVENTS

                                        nAcumZ1 := 0
                                        */

                                         SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_RIGHT ,15  )    
                                         nAcumZ1 := 0

                                    End If 

                                    

                                    If ( (nColDrag+nWidBarra)  >= (Width - 20)    )
                                        xGoBarR()                                     
                                        SysWait(0.02)
                                      //  msginfo('lp2')
                                    Else                                        
                                            

                                    End If     

                                    xDcBarH()   

                              //  End If                                  



                               // Else                                     
                                 //   lTracking26 := .t. 
                                   // xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.Não É possivel Avançar."))
                                    //Exit 
                                //End If     


                            End If           

                        Else 

                            

                            If ( Abs(nColAnt - nColx) ) >= 10                                

                                If (nColDrag <= 20)
                              //  xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida.Não É possivel Retroceder."))
                                    Exit
                                End If 




                                nColDrag -= Abs(nColAnt - nColx) 
                                nScroxY  -= Abs(nColAnt - nColx)
                                //    ScrollCol( .f. , .f.  )
                                nColAnt := nColx 
                                    
                                SysWait(0.02)
                                xDcBarH()                

                            Else 

                            End If     

                            /*
                            If ( Abs(nColAnt - nColx) ) >= 10
                                If nScroxy > 21
                                    n1 := (nColAnt - nColx)
                                    nHSCrool := n1 
                                    nScroxy -= nHSCrool     
                                    nColDrag -= nHSCrool 
                                  //  SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_LEFT ,0  )                                    

                                    xDcBarH()
                                    SysWait(0.09)
                                    lTte := .f. 
                                    lOk := .t.      
                                    nColAnt := nColx                              
                                Else 
                                    lTte := .t. 
                                End If 
                            Else 

                            End If 
                            */
                        End If 


                        If (lOk) .And. (!lTracking26)                             
                            SysWait(0.01)
                        End If     


                      
                    End If                                                           

            Enddo  


            //msginfo('out')

            If lFirst
                lDragMode := .f.            
                //xShowBrw(   cTabela    )
                lTracking26 := .f.            
                lTracking37 := .f.            
                lFirst := .f.         
            End If 


            
            For i := 1 To 255
                GetAsyncKeyState(i)
            Next i



            While (nModeBut = 1) .And. (!lTracking26)           

                If nScroxy > 21
                   // nScroxy -= nHSCrool                     
                    SendMessage( GetFormHandle(cBrwName)  , WM_KEYDOWN , VK_LEFT ,353  ) 

                    HMG_CleanLastMouseMessage()

                  //  BT_ClientAreaInvalidateAll(cBarraName)                
                    Do Events                     
                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        lTracking26 := .t.                         
                        nModeBut := 0  
                        SysWait(0.03) 
                        Exit                       
                    End If 	
                   // xDcBarH()
                    SysWait(0.01)
                Else 

                    Do Events                    
                    BT_ClientAreaInvalidateAll(cBarraName)                                    
                    SysWait(0.04)
                    lTracking26 := .t. 
                    xDialog( Hb_AnsiToOem("Coluna mais a Esquerda Atingida."))

                End If     
            End If 

            



            If (nModeBut = 2) .And. (!lTracking26)                                        

                    
                    For i := 1 To 255
                         GetAsyncKeyState(i)
                    Next i
              
                 //   SysWait(0.05)
                    DO EVENTS


              
                   //If (GetAsyncKeyState(VK_LBUTTON)) != 0	
                       // msginfo('ok2  ' + Str(nModeBut) + '  ' + Iif(lTracking26 , ' Tr ', ' Tr2 ' )     )
                        While (nModeBut = 2) .And. (!lTracking26)                                 

                                If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                                    SysWait(0.03)                                   
                                    Exit 
                                End If    

                                ScrollCol( .t. )

                              
                                SysWait(0.05)
                                For i := 1 To 255
                                    GetAsyncKeyState(i)
                                Next i


                                HMG_CleanLastMouseMessage()

                        Enddo 

                        
                    //End If 

              /*
                Else         
                    xDialog( Hb_AnsiToOem("Coluna mais a Direita Atingida.") + '   ' + Str((nLargJan+nScroxy))  +'   ' + Str(nLarTotalx+18  ))
                    nScroxy -= nHSCrool  
                    Do Events                    
                    BT_ClientAreaInvalidateAll(cBarraName)                                    
                    SysWait(0.04)
                    lTracking26 := .t. 
                    
                End If     
                */
                 //Return        

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

                xOffBarra( cBarraName  )
                Return Nil


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
                        xDcBarH()
                    End If 


                    If (nCol < 18)  
                        CursorHand1( nHWnd  )
                        nAcende := 1
                        BT_ClientAreaInvalidateRect( cBarraName  , 0,0,25,20 , .t.    )
                        nModeBut := 1
                        lTracking26 := .f. 
                        lTracking37 := .t. 
                        Do Events 
                        xDcBarH()
                    End If 

                    If (nCol >= (Width - 18)) 
                        CursorHand1( nHWnd  )
                        nAcende := 2
                        BT_ClientAreaInvalidateRect( cBarraName  , 0,  (Width - 25)    ,25,20 , .t.    )
                        nModeBut := 2            
                        lTracking26 := .f. 

                     //   msginfo('ok22')
                        
                        lTracking37 := .t. 
                        SysWait(0.02)
                        xDcBarH()

                      
                     //   msginfo('z1')
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
                xDcBarH()

               // msginfo('ok')

                nAcende := 0
                BT_ClientAreaInvalidateAll(cBarraName)


                lTracking26 := .f.
                lTracking37 := .f. 

            End If 
		End If 			
	End If 


Return 



Function xCheckObj()

	If (!Empty(Alltrim(cObjSelected)) ) .And. (cObjSelected != "Browser")
  		
		xOffBarra(   cBarraName )
		SysWait(0.02)		

	End If 	  

REturn 


Function xOffBarra( cBarName  )
      
    lDragMode := .f.  
	SetWindowCursor( GetFormHandle( cBarName )  , IDC_ARROW  )
               
    BT_ClientAreaInvalidateAll( cBarName )
    Do Events 
    xDcBarH()
               // msginfo('ok')
    nAcende := 0
    BT_ClientAreaInvalidateAll(cBarName)

    xDcBarH()

    lTracking26 := .f.
    lTracking37 := .f.    

    Do Events

REturn 

Function xLuzOff( cJanela )

    nAcende   :=  0
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

