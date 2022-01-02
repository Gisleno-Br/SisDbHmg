#require "hbxpp"


#include <hmg.ch>
#include <dll.ch>



#define WM_DESTROY          0x0002
#define SC_CLOSE            61536





#define FONTCOR {0,106,133}

#define BACK1 {229,237,242}

#define BACK5 {255,255,255}


#define CORSEL {215,228,236}
//{180,205,220}
//{216,228,236}

#define FONT1 {102,102,102}

#define XMAXITEM 15

*//xMenuOp	

Static aOpz11 := {}
Static nItemx2 := 0
Static nItemZ1 := 0
Static cOpy2 := ''
Static nItDrop1 := 1
Static nHtDrop := 300

Static lHttb := .f.
Static lHttp := .t.

Static nAcumulador := 0

Static nLinha1 := 0

//Static nHandle1 := 0
//Static nHandle2 := 0



STATIC lTracking192 := .f.

Function xMenuOp(aOp1 , nTop , nLeft )

	Local lOk     := .f.
	Local nHeight := (Len(aOp1) * nItemSubHeight)+5

	aOpz11 := Aclone(aOp1)

	nItemx2 := 0

	nItemZ1 := 0

	cOpy2 := ''

	nAcumulador := 0



	DEFINE WINDOW Win_Menu1 AT nTop, nLeft WIDTH nColTamMenu HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight ,  300    ) TITLE 'Men1' ;
		NOMAXIMIZE NOMINIMIZE NOSIZE NOSYSMENU NOCAPTION CHILD BACKCOLOR aCorSub1 VIRTUAL HEIGHT Iif(  Len(aOpz11) <=  XMAXITEM , nHeight+1 ,  (Len(aOp1) * nItemSubHeight)  ) ;
		ON PAINT xPaintMenu( ThisWindow.Name , aOpz11 , nItemx2 , nItemZ1 , cOpy2 , 0 , 0 ,  .f. ,  .t. ,  ,  , .t. )
	END WINDOW


	If  (Len(aOpz11) > XMAXITEM)
		DEFINE WINDOW Win_Scroll1 AT nTop+GetProperty('Win_Menu1' , 'Height')   , nLeft WIDTH nColTamMenu HEIGHT 32 TITLE 'T1' ;
			NOMAXIMIZE NOMINIMIZE NOSIZE CHILD NOSYSMENU NOCAPTION BACKCOLOR GRAY ;
			ON PAINT xPaintScrool( ThisWindow.Name )
		END WINDOW
	End If


	If Ascan( _HMG_SYSDATA [ 60 ]  ,   ALLTRIM ( HMG_UPPER ( "EventMenu1"  ) )  ) = 0
		InstallEventHandler( "EventMenu1" )
	End If

	HMG_ChangeWindowStyle( Win_Menu1.Handle    , WS_EX_DLGMODALFRAME, , NIL, .F., .T.)
	//HMG_ChangeWindowStyle( Win_Menu1.Handle    , NIL, WS_EX_STATICEDGE, .T., .T.)


	ShowScrollBar( GetFormHandle( 'Win_Menu1' ), 0, .F. )
	ShowScrollBar( GetFormHandle( 'Win_Menu1' ), 1, .F. )


	//    nHandle1 := Win_Menu1.Handle



	_ShowWindow("Win_Menu1")


	BT_ClientAreaInvalidateAll(   'Win_Menu1'  )

	If  (Len(aOpz11) > XMAXITEM) .And. (_isWindowDefined(  'Win_Scroll1'   ))

		HMG_ChangeWindowStyle( Win_Scroll1.Handle    , WS_BORDER, NIL, .F., .T.)
		HMG_ChangeWindowStyle( Win_Scroll1.Handle    , NIL, WS_EX_STATICEDGE, .T., .T.)


		_ShowWindow( 'Win_Scroll1' )

		BT_ClientAreaInvalidateAll(   'Win_Scroll1'  )

		// nHandle2 := Win_Scroll1.Handle


	End If



Return lOk



Function xFechaMen()

	Local nI1 := 0

	Local nHandle1  := DoFindWin("Men1")
	Local nHandle2  := DoFindWin("T1")


	If (nHandle1 > 0)



		SendMessage( nHandle1, WM_SYSCOMMAND, SC_CLOSE , 0 )

    	Do Events
        Do Events

        SendMessage( nHandle1, WM_SYSCOMMAND, WM_DESTROY , 0 )

        Do Events
        

        If (nHandle2 > 0)             

            SendMessage( nHandle2, WM_SYSCOMMAND, SC_CLOSE , 0 )

            Do Events
            Do Events

            SendMessage( nHandle2, WM_SYSCOMMAND, WM_DESTROY , 0 )

            Do Events   


        End If 

        
        If !RemoveHandler( "EventMenu1"  )
            msginfo("Erro ao remover Handle Event.")
        End If



    End If

//msginfo('ok2')




Return



Function EventMenu1( nHWnd, nMsg, nWParam, nLParam )

	Local cOpcao := ''
	Local nCol   := 0
	Local nRow   := 0
	Local aR1
	Local nInd2  := 0
	Local cTp1   := ''
	Local nRow1 := 0
	Local lCima := .t.



	If !_isWindowDefined( 'Win_Menu1')
		Return
	End If


	If ( _isWindowDefined( 'Win_Scroll1') ) .And.  (nHWnd == GetProperty(  'Win_Scroll1' , "HANDLE" ))


		If ( nMsg == WM_MOUSEMOVE )

			GetCursorPos (@nCol, @nRow)

			aR1 := GetPos_ScreenToClient(   GetFormHandle(  'Win_Scroll1'  )  , nRow, nCol )

			lCima := .t.

			If (ar1[1]  < 16)
				lCima := .f.
			End If


			If lCima

				If !lHttp
					SetWindowCursor( nHWnd , CURSORHAND  )
				Else
					SetWindowCursor( nHWnd , 'NAOPODE' )
				End If

			Else

				If !lHttb
					SetWindowCursor( nHWnd , CURSORHAND  )
				Else
					SetWindowCursor( nHWnd , 'NAOPODE' )
				End If

			End If


		End If


		If (nMsg == WM_LBUTTONDOWN)

			GetCursorPos (@nCol, @nRow)

			aR1 := GetPos_ScreenToClient(   GetFormHandle(  'Win_Scroll1'  )  , nRow, nCol )

			lCima := .t.

			If (ar1[1]  < 16)
				lCima := .f.
			End If


			If (nLinha1 == 0)
				nLinha1 := XMAXITEM
			End If

			If lCima
				ScrollMenu( 1 , GetProperty(  'Win_Menu1' , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @lHttp , @lHttb , 1 , 'Win_Menu1' , 300 , .f.  )
			Else
				ScrollMenu( 2 , GetProperty(  'Win_Menu1' , "HANDLE" ) , @nAcumulador , @nLinha1 ,   Len(aOpz11)  , @lHttp , @lHttb , 1 , 'Win_Menu1' , 300 , .f. )
			End if

			Bt_ClientAreaInvalidateAll( 'Win_Scroll1' )


		End If
	End If




	If (nHWnd == GetProperty(  'Win_Menu1' , "HANDLE" ))

		If ( nMsg == WM_MOUSELEAVE )  .and. (   lTracking192  )

			nItemx2 := 0
			nItemZ1 := 0
			BT_ClientAreaInvalidateAll( nHWnd  )
			SetWindowCursor( nHWnd , IDC_ARROW )
			xHideHint()


		End If


		If (nMsg == WM_LBUTTONDOWN)



			If (nItemx2 <= Len(aOpz11))

				If !aOpz11[nItemx2][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					yaviso("Opção Indisponivel." , .f. )
					Return
				End If

				If (aOpz11[nItemx2][4] != Nil )
					Eval( aOpz11[nItemx2][4]   )
					//  xFechaMen()
					Return
				End If


			End If


		End If



		If ( nMsg == WM_MOUSEMOVE )
			//.And. (!lTracking42)


			If (nItemx2 > 0)
				If (nItemx2 = xOpSelPos( 'Win_Menu1' , 0 , Len(aOpz11) , 0 )	)
					Return
				End If
			End If

			nItemx2 := xOpSelPos( 'Win_Menu1', 0 , Len(aOpz11) , 0 )
			nRow1 := -(GetProperty( 'Win_Menu1' , "VscrollBar" , "Value"))



			If (nItemx2 <= Len(aOpz11))
				If !aOpz11[nItemx2][3]
					SetWindowCursor( nHWnd , IDC_ARROW)
					xHideHint()
					Return
				End If
			End If


			SetWindowCursor( nHWnd , CURSORHAND  )



			If nItemZ1 > 0
				xLimpSub( 'Win_Menu1', @nItemZ1 ,  @nItemx2 , 0 )
			End If


			If nItemx2 > 0
				nItemZ1 := nItemx2
			Else
				Return
			End If


			If nItemx2 > Len(aOpz11)
				xHideHint()
				Return
			End If


			If nItemx2 > 0
				BT_ClientAreaInvalidateRect( 'Win_Menu1',  nRow1  +  ( ( nItemx2 - 1) * nItemSubHeight)  , 0 , nColTamMenu ,  nItemSubHeight - 1  , .t. )
			End If



			If !Empty(    Alltrim(  aOpz11[nItemx2][2]  )   )

				cTp1 :=	  Alltrim( 	 aOpz11[nItemx2][2]  )

				nRow1 := 0
				

				GetCursorPos (@nCol, @nRow1)

				If !_isWindowDefined("Win_Msg")
					CrieJanTip( nRow1  , GetProperty('Win_Menu1', 'Width') - 15 ,   Alltrim(cTp1)      ,, 0.5 )
				Else
					xDispHint( cTp1 , nRow1 + 15   , GetProperty('Win_Menu1', 'Col') + GetProperty('Win_Menu1', 'Width') + 3 + 5 )
					DoFindWin('xHint')
				End If


				xDispUpTam(cTp1 )


			Else
				xHideHint()
			End If



			lTracking192 := TrackMouseEvent(nHWnd)


		End If


	End If


Return

Function xPaintScrool( cForm )

	Local hBit10
	Local hBit11

	Local hDc2

	Local BTstruct2


	hDC2 = BT_CreateDC ( cForm  , BT_HDC_INVALIDCLIENTAREA, @BTstruct2 )


	If !lHttb
		hBit10 := BT_BitmapLoadFile ( 'SETAB2' )
		//SETAB2
	Else
		hBit10 := BT_BitmapLoadFile ('SETAB2D')
	End If



	If !lHttp
		hBit11 := BT_BitmapLoadFile ( 'SETAC2' )
	Else
		hBit11 := BT_BitmapLoadFile ( 'SETAC2D'  )
		//SETAC2D
	End If


	BT_DrawBitmap (hDC2,  0  ,  0   , nColTamMenu , 15 , 3 , hBit10)
	BT_DrawBitmap (hDC2, 16 ,   0   , nColTamMenu  , 16 , 3 , hBit11)


	BT_BitmapRelease ( hBit10 )
	BT_BitmapRelease ( hBit11 )


	BT_DeleteDC (BTstruct2 )



Return


