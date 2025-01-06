







HandleHotkey(hotkey) {
    ; 从热键字符串中提取最后两个字符
    StringRight, KeyM, hotkey, 2
    
    ; 在这里添加你的处理代码
    ; 例如：MsgBox % "The last two characters are: " KeyM
}




#IfWinActive ahk_exe Game1.exe
~F2::HandleHotkey(A_ThisHotkey)
~m::HandleHotkey(A_ThisHotkey)
~v::HandleHotkey(A_ThisHotkey)
~b::HandleHotkey(A_ThisHotkey)

#IfWinActive ahk_exe Game2.exe
~F2::HandleHotkey(A_ThisHotkey)
~b::HandleHotkey(A_ThisHotkey)
















; 1,2,7   10,

SysGet , VirtualWidth, 16
SysGet , VirtualHeight, 17
CoordMode , ToolTip, Screen

Process, Priority, , High
#Persistent
#SingleInstance
isStart := false
boxLine := 20




; 调用动态链接库
; gm := DllCall("LoadLibrary", "Str", "D:\code\python\hotkey\PUBGRecognizeAndGunpress-master\ghub_device.dll")
; DllCall("ghub_device\moveR","UInt",10,"UInt",10,"Bool",False)

; function====================================================================================


SmoothMouseMove(x, y, steps=10, duration=100) {
    ; MouseGetPos, currentX, currentY
    ; startX := currentX
    ; startY := currentY
    ; stepX := (x - startX) / steps
    ; stepY := (y - startY) / steps
    ; sleepDuration := duration / steps
    ; MsgBox, %A_Index%
    ; Loop % steps {
        ; newX := Round(startX + stepX)
        ; newY := Round(startY + stepY)
        ; newX := (startX + stepX)
        ; newY := (startY + stepY)
        ; DllCall("SetCursorPos", "int", newX, "int", newY)
        ; Sleep sleepDuration
    ; }

    DllCall("SetCursorPos", "int", x, "int", y)
}



getPosition2(){



    targetColor := 0x806454  ; 目标颜色
    gradientThreshold := 10    ; 渐变阈值

    ; 获取鼠标当前位置的颜色
    MouseGetPos, mouseX, mouseY
    PixelGetColor, currentColor, mouseX, mouseY

    ; 判断颜色是否在指定的范围内
    if (abs(currentColor - targetColor) <= gradientThreshold) {
        Click mouseX mouseY
        ToolTip %mouseX% %mouseY%, 850,700,3
    } else {
        ; ToolTip %OutputVarX% %OutputVarY%, 850,700,3
    }

}



getPosition(){

    MouseGetPos, mouseX, mouseY


    ; Click
    MouseMove, 1, 1, 20, R
    ; Send {WheelUp 1} ;
}


RandomNumber()
{
    Random, num, 0, 1   ; 随机生成 0 或 1
    if (num == 0)
        return 10
    else
        return -10
}
 

move(x,y){
    step := 3
    xstep := x/step
    ystep := y/step
    loop %step%{

        DllCall("mouse_event", "UInt", 1, "UInt", Round(xstep), "UInt", Round(ystep), "UInt", 0, "UInt", 0)
        Sleep, 10

    }
}



; command=================================================================================

loopClick:
    MouseGetPos, currentX, currentY
    Click
    ; x:= currentX + RandomNumber()
    ; y:= currentY - 15
    ; x:= RandomNumber()
    ; y:= -15
    x:= 0
    y:= -15

    move(x,y)
    ; SmoothMouseMove(x,y)
    ; MouseMove, x, y, 2
    ; DllCall("SetCursorPos", "int", x, "int", y)
    ; Send {MouseMove, 0, 20, 2, R}
    ; MouseMove, RandomNumber(), -10, 1, R
return













F3::

    Loop, 30 {
        send 你干嘛哎唷
        send {Enter}
    }


Return



; key==============================================================================

F1::
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, mouseX, mouseY

    info := "鼠标位置：X=" mouseX " Y=" mouseY " color=" color

    ; 将信息复制到剪切板
    Clipboard := info

    ToolTip, %info%, 300,500,1
    ; ToolTip, 鼠标位置：X=%mouseX% Y=%mouseY% color=%color%, 300,500,1
    ; step := 20
    ; 显示鼠标位置的坐标 
    ; DllCall("SetCursorPos", "int", 100, "int", 100)
    ; move(100,100)
    /* 
    
    
    鼠标位置：X=63 Y=110 color=0xD4CED9
    鼠标位置：X=-1015 Y=952 color=0xD47E15
    鼠标位置：X=628 Y=557 color=0x863E39
    鼠标位置：X=88 Y=110 color=0xD47E15
    鼠标位置：X=26 Y=107 color=0xD47E15
    鼠标位置：X=898 Y=946 color=0xD47E15
    鼠标位置：X=836 Y=944 color=0xD47E15
    
    
    
     */

Return
; 693,196
; 744,243

F2::
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
Return



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






#IfWinActive 
检查指定的窗口是否存在, 并且当前处于活动状态(在最前面)

if WinActive("")
检查指定的窗口是否处于活动状态, 并返回其唯一 ID(HWND).



exe1热键


if WinActive("")


exe2热键





















