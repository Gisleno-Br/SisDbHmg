#include <hmg.ch>
#include "inkey.ch"
#include <minigui.ch>
#require "hbxpp"
#include <hmg.ch>
#include <dll.ch>
#include "hbthread.ch"
#define XQUEBRA Chr(13)+Chr(10)
//#DEFINE FONTBROWSER 'Lucida Sans Typewriter'




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



Function xHeader( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1  )

    Local nRowIni := GetProperty( cBrwName1 , 'Row')
    Local nCol    := GetProperty( cBrwName1 , 'Col')
    Local nLarg1  := GetProperty( cBrwName1 , 'Width')

    
	DEFINE WINDOW &cHName ;
		AT nRowIni - 92 , nCol  ;
		CHILD ;
		PANEL ;
		PARENT &cParent1 ;
		WIDTH nLarg1+27 HEIGHT 30 VIRTUAL HEIGHT Nil VIRTUAL WIDTH Iif( nLargTot1 > 0 , nLargTot1 , nLarg1+1)  ;
		TITLE 'xHeader1' + Left(cHName,4)  	;
		NOSIZE NOSYSMENU NOCAPTION BACKCOLOR WHITE  ;		
		ON PAINT xPaintHeader( ThisWindow.Name , aCabecalho  , aTams)  		
	END WINDOW


Return .t. 



Function xPaintHeader( cJanela , aCabec  , aTamanho)

    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)

    Local BTstruct

    Local cTexto := ''
    Local n1     := 1

    Local nTam1 := 0

    Local nCol := 17

    Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION

    Local nQAcento := 0
    Local nTam 
    

    
	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {230,230,230}  , {230,230,230} )


    For n1 := 1 To Len(aCabec)

        
        nTam1  := aTamanho[n1]


        nQAcento := QtAcento(Alltrim(aCabec[n1]) )

        nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento )

        cTexto += Padc( Alltrim(aCabec[n1]) ,   nTam  ,   Alltrim(Str(n1))      )


    Next 


    BT_DrawText ( hDC , 10  , nCol ,   Hb_Utf8ToStr(cTexto) , FONTBROWSER  , FONTBROWSERSIZE , {125,125,125} ,  {230,230,230}   , ;
				nTypeText ,	nAlingText, nOrientation )


    BT_DeleteDC (BTstruct )



REturn 
