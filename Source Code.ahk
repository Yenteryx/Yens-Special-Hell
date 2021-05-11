Gui, New,, Yen's Special Hell
Gui, Add, Text,, MSG SPAM                                                  [Toggle: F4]
Gui, Add, Text,x10 y25, Enter message here:
Gui, Add, Edit, r9 vmessage w280 +HwndhxEdit
Gui, Add, Edit, x10 y174 W50 vInterval, 500
Gui, Add, Text, x66 y176, ms
Gui, Add, Button, x10 y200 gToggle, TOGGLE
Gui, Add, Text,x10 y225, ______________________________________________
Gui, Add, Text,x10 y247, AUTOCLICKER                                             [Toggle: F5]
Gui, Add, Text,x220 y266, [Reload: F2]
Gui, Add, Text,x220 y283, [Terminate: F3]
Gui, Add, Edit, x10 y266 W50 vclickinterval, 200
Gui, Add, Text, x66 y268, ms
Gui, Add, Button, x10 y293 gAClicker, TOGGLE
Gui, Show, h335 w300
return

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir% 
#SingleInstance Force 
#MaxThreadsPerHotkey 3

f4::
Toggle:
Gui, Submit, NoHide
Sendactive := !Sendactive
If Sendactive
	SetTimer spam, %Interval%
Else
	SetTimer spam, Off
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
	SetTimer aclick, %clickinterval%
Else
	SetTimer aclick, Off
Return
aclick:
	SendInput, {Click}
Return

f2::Reload

f3::ExitApp 
GuiClose:
ExitApp