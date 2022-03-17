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

Static nColHeader := 0
Static cHeaderJan := ''

Static aMapsCol := {}

Static nColSel := 0



Function xHeader( cHName , aCabecalho , aTams , cParent1 , cBrwName1 , nLargTot1 , aTps  )

    Local nRowIni := GetProperty( cBrwName1 , 'Row')
    Local nCol    := GetProperty( cBrwName1 , 'Col')
    Local nLarg1  := GetProperty( cBrwName1 , 'Width')

    cHeaderJan := cHName

    
    xMapCols( aCabecalho , aTams , aTps )


    
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



    If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventHeader"  ) )  ) = 0
		InstallEventHandler( "EventHeader" )
		//nIndexEventZ := EventCreate (  { ||   xTeclasBrow( )   }  )
	End If


Return .t. 


Function EventHeader( nHWnd, nMsg, nWParam, nLParam  )


    If !_IsWindowDefined(cHeaderJan)
       // msgingfo('ok2')
        Return 
    End If 
    
	
	If nHWnd == GetProperty(  cHeaderJan   , "HANDLE" )
				
		If nMsg == WM_MOUSEMOVE
            //MsgInfo('ok')
        End If 

    End If     


Return 

Function xMapCols( aCabs , aTamx1 , aTipos1 )

    Local i := 0
    Local nPos1 := 1 

    aMapsCol := {}

    For i := 1 To Len(aCabs)

        Aadd( aMapsCol , {   aCabs[i] , nPos1 , nPos1 +  aTamx1[i]  , aTipos1[i]     }  )
        nPos1 := nPos1 +  aTamx1[i] + 1

    Next 

Return 


Function UpdHeader( cHeader1 ,  nValor   )

    
   nColHeader += nValor    
   BT_ClientAreaInvalidateAll (cHeader1)	

return 



Function xPaintHeader( cJanela , aCabec  , aTamanho)

    LOCAL Width  := BT_ClientAreaWidth  (cJanela)
	LOCAL Height := BT_ClientAreaHeight (cJanela)
    Local BTstruct
    Local cTexto  := ''
    Local cTexto1 := ''
    Local n1     := 1
    Local nTam1 := 0
    Local nTamx1 := GetTextoTam( 'A'  , cActiveJan ) 
    Local hFont 
    Local nTypeText    := BT_TEXT_TRANSPARENT  //+ BT_TEXT_BOLD
	Local nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
	Local nOrientation := BT_TEXT_NORMAL_ORIENTATION
    Local nQAcento := 0
    Local nTam 
    Local nCol := -(nColHeader)
    Local nColx := 17
    
	hDC = BT_CreateDC ( cJanela  ,  BT_HDC_INVALIDCLIENTAREA, @BTstruct )
	BT_DrawGradientFillVertical ( hDC ,   0 , 0  , Width ,    Height    ,  {230,230,230}  , {230,230,230} )


    If (nColHeader > 0)
        nColx += nCol 
    End If 

    hFont := HMG_CreateFont (  hDC , FONTBROWSER, FONTBROWSERSIZE, .f., .f., .f., .f. )

    For n1 := 1 To Len(aCabec)
        
        nTam1  := aTamanho[n1]
        nQAcento := QtAcento(Alltrim(aCabec[n1]) )
        nTam := If( (nQAcento =  0)   , nTam1 , nTam1 + nQAcento ) //* nTamX1
        cTexto1 += Padc( Alltrim(aCabec[n1]) ,   nTam + 1      )
        cTexto := Replicate('A' ,  aTamanho[n1] + 1 )
        n12 := GetTextWidth( hDC , cTexto , hfont )
        nTam := n12

        If (n1 = 2)
            nColx+=3
        End If 

        BT_DRAWEDGE (hDC, 1, nColx , nColx + 2   , Height ,  EDGE_ETCHED  , BF_LEFT + BF_RIGHT)
        BT_DRAWEDGE (hDC, 1, nColx+1 , nColx + 3   , Height ,  EDGE_ETCHED  , BF_LEFT + BF_RIGHT)

        nColx += nTam        

    Next 


    BT_DrawText ( hDC , 10  , 17+nCol ,   Hb_Utf8ToStr(cTexto1) , FONTBROWSER  , FONTBROWSERSIZE , {125,125,125} ,  {230,230,230}   , ;
				nTypeText ,	nAlingText, nOrientation )


    BT_DeleteDC (BTstruct )



REturn 
