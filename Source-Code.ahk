;gui setup
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Gui -MaximizeBox
Gui Font, s9, Segoe UI
Gui Font
Gui Font, s10 Bold, Segoe UI
Gui Add, Text, x10 y4 w89 h23, MSG SPAM
Gui Font
Gui Font, s9, Segoe UI
Gui Add, Text, x10 y29 w97 h13, Text:
Gui Add, Edit, vmessage x10 y44 w280 h125 +Multi
Gui Add, Edit, vmsgInterval x9 y174 w50 h21 +Number, 500
Gui Add, Text, x66 y176 w20 h13, ms
Gui Add, Button, gmsgToggle x108 y177 w95 h49, TOGGLE
Gui Font
Gui Font, s10 Bold, Segoe UI
Gui Add, Text, x10 y241 w93 h24, AUTOCLICKER
Gui Font
Gui Font, s9, Segoe UI
Gui Add, Edit, vaclickerInterval x10 y266 w50 h21, 200
Gui Add, Text, x66 y268 w20 h13, ms
Gui Add, Button, gAClicker x108 y305 w95 h49, TOGGLE
Gui Add, Text, x-3 y235 w300 h2 0x10
Gui Add, GroupBox, x1 y289 w97 h75, Hotkeys
Gui Add, Text, x10 y307 w84 h21, Reload: F2
Gui Add, Text, x10 y333 w84 h21, Terminate: F3
Gui Add, StatusBar,, Made by Yenteryx
Gui Add, Text, x173 y240 w120 h23 +0x200, Toggle Autoclicker: F5
Gui Add, Text, x173 y1 w120 h23 +0x200, Toggle Msg Spam: F4

Gui Show, w300 h391, YSH
Return

;functions

f4:: ;msg spam
msgToggle:
Gui, Submit, NoHide
Sendactive := !Sendactive
If Sendactive
{
    SB_SetText("Message spam toggled")
	SetTimer spam, %msgInterval% ;loop
	}
Else
{
    SB_SetText("Made by Yenteryx")
	SetTimer spam, Off
	}
Return
spam:
	SendInput, %message%
	Sleep 50
	SendInput, {Enter}
Return

f5::
AClicker:
Gui, Submit, NoHide
active := !active
If active
{
    SB_SetText("Autoclicker toggled")
    SetTimer aclick, %aclickerInterval%
}
Else
{
    SB_SetText("Made by Yenteryx")
	SetTimer aclick, Off
}
Return
aclick:
SendInput, {Click}
Return

f2::Reload

f3::ExitApp
GuiEscape:
GuiClose:
    ExitApp
