; MWO Chat

; Create an instance of the library
ADHD := New ADHDLib

; Ensure running as admin
ADHD.run_as_admin()

; Buffer hotkeys - important, required so rolling mouse wheel up while already zooming queues a zoom
#MaxThreadsBuffer on
; Just in case I spin my mouse wheel in free-spinning mode ;)
#MaxHotkeysPerInterval 999

; Set up vars
msgcount := 10

; ============================================================================================
; CONFIG SECTION - Configure ADHD

; You may need to edit these depending on game
;SendMode, Event
;SetKeyDelay, 0, 50

; Stuff for the About box

ADHD.config_about({name: "Chat", version: 1.0, author: "evilC", link: "<a href="""">Homepage</a>"})
; The default application to limit hotkeys to.
; Starts disabled by default, so no danger setting to whatever you want
ADHD.config_default_app("CryENGINE")

; GUI size
ADHD.config_size(375,470)

; Defines your hotkeys 
; subroutine is the label (subroutine name - like MySub: ) to be called on press of bound key
; uiname is what to refer to it as in the UI (ie Human readable, with spaces)
Loop, %msgcount% {
	ADHD.config_hotkey_add({uiname: "Message " A_Index, subroutine: "Message" A_Index})
}

; Hook into ADHD events
; First parameter is name of event to hook into, second parameter is a function name to launch on that event
ADHD.config_event("app_active", "app_active_hook")
ADHD.config_event("app_inactive", "app_inactive_hook")
ADHD.config_event("option_changed", "option_changed_hook")

ADHD.init()

ADHD.create_gui()

; The "Main" tab is tab 1
Gui, Tab, 1
; ============================================================================================
; GUI SECTION

Loop, %msgcount% {
	Gui, Add, Text, x5 yp+35, Message %A_Index%
	ADHD.gui_add("Edit", "String" A_Index, "xp+60 yp-2 W300", "", "")
}

Gui, Add, Link, x5 yp+25, Keys from the <a href="http://www.autohotkey.com/docs/KeyList.htm">AHK Key List</a> can be used inside {curly} brackets.
Gui, Add, Text, x5 yp+15, For example, t{BS}Hello!{Enter} would hit t (Open chat box) ...
Gui, Add, Text, x5 yp+15, .... then hit backspace (Clear t in case chat box was already open)
Gui, Add, Text, x5 yp+15, Then type "Hello!", then hit Enter.
;By Clive "evilC" Galway <a href="http://evilc.com/proj/adhd">HomePage</a>    <a href="https://github.com/evilC/ADHD-AHK-Dynamic-Hotkeys-for-Dummies">GitHub Page</a>

; End GUI creation section
; ============================================================================================


ADHD.finish_startup()

return

Message1:
	str := "{BS}" cleanup(String1)
	Send %str%
	return

Message2:
	str := "{BS}" cleanup(String2)
	Send %str%
	return

Message3:
	str := "{BS}" cleanup(String3)
	Send %str%
	return

Message4:
	str := "{BS}" cleanup(String4)
	Send %str%
	return

Message5:
	str := "{BS}" cleanup(String5)
	Send %str%
	return

Message6:
	str := "{BS}" cleanup(String6)
	Send %str%
	return

Message7:
	str := "{BS}" cleanup(String7)
	Send %str%
	return

Message8:
	str := "{BS}" cleanup(String8)
	Send %str%
	return

Message9:
	str := "{BS}" cleanup(String9)
	Send %str%
	return

Message10:
	str := "{BS}" cleanup(String10)
	Send %str%
	return

; Filter to allow natural language in the message boxes
; Converts ! (Which would normally be ALT) to an actual exclamation point
cleanup(str){
	str := RegExReplace(str, "!", "{!}") 
	;str := RegExReplace(str, "\+", "{+}") 
	;str := RegExReplace(str, "\^", "{^}")
	return str
}

; KEEP THIS AT THE END!!
;#Include ADHDLib.ahk		; If you have the library in the same folder as your macro, use this
#Include <ADHDLib>			; If you have the library in the Lib folder (C:\Program Files\Autohotkey\Lib), use this
