

#include <hmg.ch>
#include "inkey.ch"
#include <minigui.ch>
#require "hbxpp"
#include <hmg.ch>
#include <dll.ch>
#include "hbthread.ch"
#define XQUEBRA Chr(13)+Chr(10)
#DEFINE FONTBROWSER 'Lucida Sans Typewriter'

Static cBarraName := ''


Static nLarTotalx := 0
Static nAcende := 0
Static lTracking26 := .f. 
Static lDispo1 := .t. 
Static nColBarra := 18
Static nModeBut := 0

Static nSaveCol := 0

Static lDragMode := .f. 

Static nLargJan := 0
Static nColScrool := 18


Function xBarraH( cParent , cBrowserName , nLinha1  , nLarguraTot2 , nLargJanela )


    Private cJanName := 'Win_Bh' + LEft(cActiveJan,4)

    nLarTotalx := nLarguraTot2

    cBarraName := cJanName

    nLargJan := nLargJanela

        
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

    If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventBarra"  ) )  ) = 0
		InstallEventHandler( "EventBarra" )		
	End If

   HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER, NIL, .T. )
   

Return     


Function xShowHint( nRow1 , nCol1 , cMsg )


	If !_isWindowDefined("Win_Msg")
		CrieJanTip( nRow1 - 20  , nCo1l - 250   ,   Alltrim(cMsg)      ,, 0.5 )
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

	nCalc := nLarTotalx - nLargJan 

    If (nCalc < 0)
        nCalc := 0
    End If 


Return (nLargJan  - nCalc  )



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

    If (nWidBarra == 0)
        yEsquerda := BT_BitMapLoadFile('ESQUERDAD')
        yDireita  := BT_BitMapLoadFile('DIREITAD')
    End If 



    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )


    BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 20  	, 18  , 18  ,      BT_COPY,  yDireita)

    BT_DrawFillRoundRect (hDC2 , 4 , nColScrool , nWidBarra - 6 , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)


    BT_BitmapRelease (yEsquerda)
    BT_BitmapRelease (yDireita)
	BT_DeleteDC (BTstruct )


Return     


Function xGetBarName()

Return  cBarraName   



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

    Local ar1 

    Local lOk := .f. 

	

	

	If (_IsWindowDefined(cBarraName)) .And.  (nHWnd == GetProperty(  cBarraName , "HANDLE" ))		


        If (nMsg == WM_LBUTTONUP)
            xLuzOff( cBarraName )            
            SysWait(0.02)
            lTracking26 := .f. 
            SysWait(0.02)

            lDragMode := .f. 
            //msginfo('123213')            
        End If 


        If (nMsg == WM_LBUTTONDOWN)

            nColx := nSaveCol

            lFirst := .f. 

           
            While (lDragMode) 


                    GetCursorPos (@nCol, @nRow)
			        ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )
			        nColx := ar1[2]

                    CursorWe()

                    lOk := .f. 
                    
			        //SetWindowCursor( nHWnd , IDC_SIZEWE)

                    
                    If !lFirst
                        xShowHint( nRow , nCol , 'Click e Arraste para Navegar entre as Colunas.' )
                        lFirst := .t. 
                    End If 



                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        lDragMode := .f.
                    End If 	


                    If (nColx != nSaveCol)
                        If (nColx > nSaveCol)

                            If ( Abs(nColx - nSaveCol) ) >= 30                               
                                If nColScrool <= (nLimite )                                                         
                                    nColScrool += 30                                       
                                Else 

                                End If                                     
                            End If           

                        Else 

                            If ( Abs(nSaveCol - nColx) ) >= 30
                                If nColScrool > 18
                                    nColScrool -= 30                                       
                                Else 

                                End If 


                            Else 

                            End If 
                        End If 


                        If (lOk)
                             Do Events                    
                             BT_ClientAreaInvalidateAll(cBarraName)                                                                        
	    		             CursorWe()
                             SysWait(0.02)
                            nSaveCol := nColX
                        End If     


                      //  nSaveCol := nColX
                    End If                     

                   // SysWait(0.03)
                    

            Enddo  

            If lFirst
                xFecheAnimate(  GetFormHandle('Win_Msg') )
                xShowBrw()
                SetWindowCursor( nHWnd , IDC_ARROW )
                SetWindowCursor( GetFormHandle('Win_Browser') , IDC_ARROW )
                SetWindowCursor( GetFormHandle('Win_Role1')   , IDC_ARROW )
                SysWait(0.04)                 
            End If 


            While (nModeBut = 1) .And. (!lTracking26)           

                If nColScrool > 18
                    nColScrool -= 30 
                    SendMessage( GetFormHandle('Win_Browser')  , WM_KEYDOWN , VK_LEFT ,0  ) 
                    Do Events                     
                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        lTracking26 := .t. 
                    End If 	
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

                If nColScrool <= (nLimite )                     
                    nColScrool += 30               
                    BT_ClientAreaInvalidateAll(cBarraName)                
                    SendMessage( GetFormHandle('Win_Browser')  , WM_KEYDOWN , VK_RIGHT ,0  ) 
                    Do Events                 
                    If (GetAsyncKeyState(VK_LBUTTON)) == 0					
                        lTracking26 := .t. 
                    End If 	
                    SysWait(0.03)
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
            msginfo('ok')

        End If 

		If (nMsg == WM_MOUSEMOVE) 		

            Do Events
            Do Events
			
            nModeBut := 0
            SetWindowCursor( nHWnd , IDC_ARROW )

            If nAcende > 0
               nAcende := 0
               BT_ClientAreaInvalidateAll(cBarraName)
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
            End If 

            If (nCol >= (Width - 18))
               CursorHand1( nHWnd  )
               nAcende := 2
               BT_ClientAreaInvalidateRect( cBarraName  , 0,  (Width - 25)    ,25,20 , .t.    )
               nModeBut := 2            
               lTracking26 := .f. 
            End If 


            If (nModeBut = 0)

                If (nCol >= nColScrool) .And. ( nCol <= (nColScrool+nWidBarra) )                    
                    nModeBut := 999
                    lDragMode := .t.
                    nSaveCol := nCol
                  //  msginfo('Dm')
                End If 

            End If 



		End If 	
		

	End If 

Return 


Function xLuzOff( cJanela )

    nAcende := 0
    BT_ClientAreaInvalidateAll(cJanela)


Return 
