



; 1,2,7   10,

SysGet , VirtualWidth, 16
SysGet , VirtualHeight, 17
CoordMode , ToolTip, Screen
CoordMode , Mouse, Screen
CoordMode , Pixel, Screen

Process, Priority, , High
#Persistent
#SingleInstance
isStart := false
isStart := false
boxLine := 20


GetColor(x, y)
{
	PixelGetColor , color, x, y, RGB
	StringRight color, color, 10	;
	return color
}

; 调用动态链接库
; gm := DllCall("LoadLibrary", "Str", "D:\code\python\hotkey\PUBGRecognizeAndGunpress-master\ghub_device.dll")
; DllCall("ghub_device\moveR","UInt",10,"UInt",10,"Bool",False)

; function====================================================================================



/*
GetColor(865, 582) == "0x464646"
GetColor(-1014, 950) != "0xFCFCFC"
GetColor(2790, 463) == "0xFFFFFF"
GetColor(866, 580) == "0xE9E9E9"
GetColor(864, 581) == "0x362E2E"
GetColor(865, 582) == "0xE6E6E6"
GetColor(865, 582) == "0x7F4132"
GetColor(865, 582) == "0x934636"
GetColor(865, 582) == "0x934636"
GetColor(865, 582) == "0x362E2E"
GetColor(865, 582) == "0x934636"
GetColor(865, 582) == "0x364693"
GetColor(865, 582) == "0xB7C0F0"
GetColor(1557, 45) == "0x0162A9"
*/

getPosition(){

    ; MouseGetPos, mouseX, mouseY 

    if ( GetColor(865, 582) != "0xB7C0F0" ) {
        Click 1557, 45
        ; xuexi
        ; Click 865, 582
    }

    ; Click
    MouseMove, 1, 1, 20, R
    ; Send {WheelUp 1} ;提示当前要打的怪物
}
stop_ahk_fn(){
    Suspend
}

click_func(){
    click
}


; command=================================================================================

loopClick:
    ; MouseGetPos, currentX, currentY
    ; Click
    ; x:= currentX + RandomNumber()
    ; y:= currentY - 15
    ; x:= RandomNumber()
    ; y:= -15
    ; x:= 0
    ; y:= -15

    
    ; SmoothMouseMove(x,y)
    ; MouseMove, x, y, 2
    ; DllCall("SetCursorPos", "int", x, "int", y)
    ; Send {MouseMove, 0, 20, 2, R}
    ; MouseMove, RandomNumber(), -10, 1, R
return

label_f2:
    isStart := !isStart
    ; gm.moveR(10,10, False)
    ; getPosition()
    ; DllCall("D:\code\python\hotkey\PUBGRecognizeAndGunpress-master\ghub_device.dll\moveR","UInt",10,"UInt",10,"Bool",False)

    if (isStart){
        SetTimer, getPosition, 1000
        ToolTip, f2, 2840, 945, 2
    }else{
        SetTimer, getPosition, off
        ToolTip, , , , 2
    }
    ToolTip, , , , 3
    ToolTip, , , , 1
Return


stop_ahk:
    Suspend
Return


mouse_up:
    loop, 5 {

        MouseMove, 0, -5, 0, R  ; Win+UpArrow 热键 => 上移光标
    }
Return
mouse_down:
    loop, 5 {
        MouseMove, 0, 5, 0, R  ; Win+UpArrow 热键 => 上移光标
    }
Return
mouse_left:
    loop, 5 {
        MouseMove, -5, 0, 0, R  ; Win+UpArrow 热键 => 上移光标
    }
Return
mouse_right:
    loop, 5 {
        MouseMove, 5, 0, 0, R  ; Win+UpArrow 热键 => 上移光标
    }
Return




; #IfWinActive ahk_exe Code.exe
; #if WinActive("ahk_exe Code.exe")

; key==============================================================================



; *up::MouseMove, 0, -10, 0, R  ; Win+UpArrow 热键 => 上移光标
; *Down::MouseMove, 0, 10, 0, R  ; Win+DownArrow => 下移光标
; *Left::MouseMove, -10, 0, 0, R  ; Win+LeftArrow => 左移光标
; *Right::MouseMove, 10, 0, 0, R  ; Win+RightArrow => 右移光标
; *up::Gosub, mouse_up  ; Win+UpArrow 热键 => 上移光标
; *Down::Gosub, mouse_down  ; Win+UpArrow 热键 => 上移光标
; *Left::Gosub, mouse_left  ; Win+UpArrow 热键 => 上移光标
; *Right::Gosub, mouse_right  ; Win+UpArrow 热键 => 上移光标


F3::

    ; Loop, 30 {
    ;     send 你干嘛哎唷
    ;     send {Enter}
    ; }
    MouseMove, 865, 582
    ; GetColor(-1015, 950) == "0xD47E15"
Return

; Clipboard := "GetColor(" mouseX ", " mouseY ") == """ color """"



F1::
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, mouseX, mouseY
    PixelGetColor, color_rgb, mouseX, mouseY, RGB

    info := "鼠标位置：X=" mouseX " Y=" mouseY " color=" color " rgb=" color_rgb
    ; 将信息复制到剪切板
    Clipboard := "GetColor(" mouseX ", " mouseY ") == """ GetColor(mouseX,mouseY) """"

    ToolTip, %info%, 300,500,1
    ; ToolTip, 鼠标位置：X=%mouseX% Y=%mouseY% color=%color%, 300,500,1
    ; step := 20
    ; 显示鼠标位置的坐标 
    ; DllCall("SetCursorPos", "int", 100, "int", 100)
    ; move(100,100)
    /* 
    
    GetColor(-1015, 950) == "0xFCFCFC"
    鼠标位置：X=63 Y=110 color=0xD4CED9
    鼠标位置：X=-1015 Y=952 color=0xD47E15
    鼠标位置：X=628 Y=557 color=0x863E39
    鼠标位置：X=88 Y=110 color=0xD47E15
    鼠标位置：X=26 Y=107 color=0xD47E15
    鼠标位置：X=898 Y=946 color=0xD47E15
    鼠标位置：X=836 Y=944 color=0xD47E15
    GetColor(-1015, 950) == "0xD47E15"
    
    
     */

Return
; 693,196
; 744,243

F2::Gosub, label_f2
return

F6::
{
    isStart := !isStart
    if (isStart){
        SetTimer, click_func, 1000
        ToolTip, "f6", 2840, 945, 3
    }else{
        SetTimer, click_func, off
        ToolTip, , , , 3
    }
    
}
return
; F3::
;     MouseMove, -1014, 950
; Return
; F5::Gosub, stop_ahk
; F5::stop_ahk_fn()


; n::
;     Send, n
; Return
; ~$m::
;     Send, m
;     ; MsgBox Sending m
;     ToolTip, Text, 1, 1, 3
; Return


F12::
    Reload
Return

F4::
    Suspend
    ; if (A_IsSuspended=1)
	; 	ToolTip,Suspend,929,129,10
	; else if (A_IsSuspended=0)
    ;     ToolTip,,,,10
Return










