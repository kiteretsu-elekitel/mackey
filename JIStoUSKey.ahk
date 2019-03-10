#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#UseHook

; ひらカタ、無変換殺す
vkF2sc070::
vk1Dsc07B::
  return
; 変換:space
vk1Csc079::SPACE

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 1段目
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 VKF4::Send,{``}    ;         半角/全角     -> `
 +VKF4::Send,{~}    ; Shift + 半角/全角     -> ~
 +2::Send,{@}       ; Shift + 2         ["] -> @
 +6::Send,{^}       ; Shift + 6         [&] -> ^
 +7::Send,{&}       ; Shift + 7         ['] -> &
 +8::Send,{*}       ; Shift + 8         [(] -> *
 +9::Send,{(}       ; Shift + 9         [)] -> (
 +0::Send,{)}       ; Shift + 0         [ ] -> )
 +-::Send,{_}       ; Shift + -         [=] -> _
 ^::Send,{=}        ;                   [^] -> =
 +^::Send,{+}       ; Shift + ^         [~] -> +

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 2段目
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 @::[              ;                   [@] -> [
 +@::{             ; Shift + @         [`] -> {
 [::]              ;                   [[] -> ]
 +[::Send,{}}      ; Shift + [         [{] -> }
;ENTER::\
+ENTER::|
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; 3段目
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 +;::Send,{:}      ; Shift + ;         [+] -> ;
 :::Send,{'}       ;                   [:] -> '
 *::Send,{"}       ; Shift + :         [*] -> "
; ]::ENTER          ;                   []] -> ENTER


;alt + space で全角/半角
!Space::Send, {vkF3sc029}
