

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

Static nAcende := 0



Function xBarraH( cParent , cBrowserName , nLinha1 )


    Private cJanName := 'Win_Bh' + LEft(cActiveJan,4)

    cBarraName := cJanName
        
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



Function xPaintBarraH( cJanela , nAcende1 )

    //BT_DRAWEDGE

    Local BTstruct
    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)

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


    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )


    BT_DrawBitmap (hDC2  , 0  , 0  	, 18  , 18  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 20  	, 18  , 18  ,      BT_COPY,  yDireita)

    BT_DrawFillRoundRect (hDC2 , 4 , 18 , 95 , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)


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
	Local aR1

    LOCAL Width  := BT_ClientAreaWidth  (cBarraName)
	
	//Local nRow1 := GetProperty('Win_Role1','Height') - 20

	If (_IsWindowDefined(cBarraName)) .And.  (nHWnd == GetProperty(  cBarraName , "HANDLE" ))		

        If (nMsg == WM_MOUSELEAVE) 
            msginfo('ok')

        End If 

		If (nMsg == WM_MOUSEMOVE) 		
			//msginfo('  pl332321   ')


            SetWindowCursor( nHWnd , IDC_ARROW )

            If nAcende > 0
               nAcende := 0
               BT_ClientAreaInvalidateAll(cBarraName)


            End If 


            GetCursorPos (@nCol, @nRow)
			ar1 := GetPos_ScreenToClient(   nHWnd , nRow, nCol )

			nCol := ar1[2]


            If (nCol < 20)
              

               CursorHand1( nHWnd  )

               nAcende := 1
               BT_ClientAreaInvalidateRect( cBarraName  , 0,0,25,20 , .t.    )

            End If 

            If (nCol >= (Width - 20))

                CursorHand1( nHWnd  )

               nAcende := 2
               BT_ClientAreaInvalidateRect( cBarraName  , 0,  (Width - 25)    ,25,20 , .t.    )

             
            End If 




		End If 	
		

	End If 

Return 


Function xLuzOff( cJanela )

    nAcende := 0
    BT_ClientAreaInvalidateAll(cJanela)


Return 
