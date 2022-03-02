

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



Function xBarraH( cParent , cBrowserName , nLinha1 )


    Private cJanName := 'Win_Bh' + LEft(cActiveJan,4)

    cBarraName := cJanName
        
    DEFINE WINDOW &cJanName ;
        AT nLinha1 ,  GetProperty(  cBrowserName , 'Col'  )  ;
        CHILD ;
        PANEL ;
        PARENT &cParent ;
        WIDTH  GetProperty(  cBrowserName , 'Width'  )+18   HEIGHT 16 ;
        TITLE 'xScroxRoleol1' + Left(cBrowserName,4)  	;
        NOSIZE NOSYSMENU NOCAPTION  BACKCOLOR WHITE   ;
        ON PAINT xPaintBarraH( ThisWindow.Name )
    END WINDOW  

   HMG_ChangeWindowStyle(  GetProperty(  cJanName , 'HANDLE' ) , WS_BORDER, NIL, .T. )
   

Return     



Function xPaintBarraH( cJanela )

    //BT_DRAWEDGE

    Local BTstruct
    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)

    Local yEsquerda := BT_BitMapLoadFile('ESQUERDA')
    Local yDireita  := BT_BitMapLoadFile('DIREITA')

    Local hDC2 := BT_CreateDC (cJanela ,   BT_HDC_INVALIDCLIENTAREA  , @BTstruct)
    BT_DrawGradientFillHorizontal ( hDC2 ,  0   , 0  , Width  ,    Height     ,  {230,230,230}  , {230,230,230}   )
    BT_DrawBitmap (hDC2  , 0  , 0  	, 15  , 15  ,      BT_COPY,  yEsquerda )
    BT_DrawBitmap (hDC2  , 0  , Width - 12  	, 15  , 15  ,      BT_COPY,  yDireita)

    BT_DrawFillRoundRect (hDC2 , 1 , 18 , 95 , 10 , 5 ,5 ,   {178 , 178 ,178}   , {178 , 178 ,178}  , 0)


    BT_BitmapRelease (yEsquerda)
    BT_BitmapRelease (yDireita)
	BT_DeleteDC (BTstruct )


Return     


Function xGetBarName()

Return  cBarraName   
