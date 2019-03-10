#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;================================================================
;auto hot key script for windows
;mac風キーバインド
;================================================================

#InstallKeybdHook
#UseHook

;================================================================
;関数
;================================================================

;----------------------------------------------------------------
;キーバインドを無効にするウィンドウかどうか判断する
; ahk_classはauto hot key付属のAU3_Spy.exeを使用して調べる。
;  引数 なし
;  戻り値 1:キーバインドを無効にするウィンドウ
;         0:キーバインドを有効にするウィンドウ
;----------------------------------------------------------------
is_disable_window()
{
	;gvim
	IfWinActive,ahk_class Vim
	{
		return 1
	}
	;tera term
	IfWinActive,ahk_class VTWin32
	{
		return 1
	}
	;vmware player
	IfWinActive,ahk_class VMPlayerFrame
	{
		return 1
	}
	return 0
}

;----------------------------------------------------------------
;キーを送信する
; キーバインドを無効にするウィンドウでは、送信されたキーをそのまま使用する
; キーバインドを有効にするウィンドウでは、送信されたキーを置き換える
;
;  引数 original_key:キーバインドを無効にするウィンドウの場合、送信するキー
;       replace_key:キーバインドを有効にするウィンドウの場合、送信するキー
;  戻り値 なし
;----------------------------------------------------------------
send_key(original_key,replace_key)
{
	if (is_disable_window())
	{
		Send,%original_key%
		return
	}
	Send,%replace_key%
	return
}

;================================================================
;ctrlキーバインド
;================================================================

;----------------------------------------------------------------
;移動系（shiftキーとの同時押し対応）
;ctrl + n : 下
;ctrl + p : 上
;ctrl + f : 右
;ctrl + b : 左
;ctrl + a : Home
;ctrl + e : End
;----------------------------------------------------------------

<^n::send_key("^n","{Down}")
<^+n::send_key("^+n","+{Down}")
<^p::send_key("^p","{Up}")
<^+p::send_key("^+p","+{Up}")
<^f::send_key("^f","{Right}")
<^+f::send_key("^+f","+{Right}")
<^b::send_key("^b","{Left}")
<^+b::send_key("^+b","+{Left}")
<^a::send_key("^a","{Home}")
<^+a::send_key("^+a","+{Home}")
<^e::send_key("^e","{End}")
<^+e::send_key("^+e","+{End}")

;----------------------------------------------------------------
;編集系
;ctrl + h : BackSpace
;ctrl + d : Delete
;ctrl + m : Enter
;ctrl + k : カーソルから行末まで削除
;----------------------------------------------------------------

<^h::send_key("^h","{BS}")
<^d::send_key("^d","{Del}")
<^m::send_key("^m","{Return}")
<^k::send_key("^k","+{End}{Del}")

;================================================================
;Altキーバインド
;================================================================
!Q::WinClose,A
;================================================================
;add_setting
;================================================================
<!n::send_key("!+n","^+n")
<!a::send_key("!+a","^+a")
<!c::send_key("!+c","^+c")
<!v::send_key("!+v","^+v")
<!x::send_key("!+x","^+x")
<!f::send_key("!+f","^+f")
<!p::send_key("!+p","^+p")
