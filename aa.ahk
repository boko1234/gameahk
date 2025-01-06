



; 1,2,7   10,


Process, Priority, , High

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
    Click
    ; PixelSearch, OutputVarX, OutputVarY, 14, 101, 658, 404, "0x806466" 
    ; PixelSearch, OutputVarX, OutputVarY, 250, 150, 500, 300, "0x806466" ,10
    
    ; MouseGetPos, mouseX, mouseY
    ; PixelSearch, OutputVarX, OutputVarY, mouseX, mouseY, mouseX, mouseY, "0xFC6466" ,50
    ; PixelSearch, OutputVarX, OutputVarY, mouseX-10, mouseY-10, mouseX+10, mouseY+10, "0xFC6466" ,50
    ; PixelSearch, OutputVarX, OutputVarY, mouseX-20, mouseY, mouseX+20, mouseY, "0xFC6466" ,50



    ; if(OutputVarX>0 or OutputVarY>0){
        ; MouseMove, OutputVarX, OutputVarY, 1,
        ; Click OutputVarX, OutputVarY
        ; MouseMove, RandomNumber(), -10, 3, R
        ; ToolTip %OutputVarX% %OutputVarY%, 850,700,3
        ; MsgBox, OutputVarX,OutputVarY
    ; }
    ; Click OutputVarX,OutputVarY
    ; MsgBox, OutputVarX,OutputVarY

    ; gm.moveR

    DllCall("ghub_device\moveR","UInt",10,"UInt",10,"Bool",False)
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








; key==============================================================================

F1::
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, mouseX, mouseY
    step := 20
    ; 显示鼠标位置的坐标 
    ToolTip, 鼠标位置：X=%mouseX% Y=%mouseY% color=%color%, 300,300,1
    ; DllCall("SetCursorPos", "int", 100, "int", 100)
    move(100,100)
    

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
        ToolTip, f2, 800, 960, 2
    }else{
        SetTimer, getPosition, off
        ToolTip, , , , 2
    }
Return

F3::

    MouseGetPos, currentX, currentY
    ; MsgBox, %currentX%,%currentY%
    DllCall("SetCursorPos", "int", currentX, "int", currentY)
    ; MsgBox, %currentX%,%currentY%

return 


; SendMode, Play

; 1::
    ; ImageSearch, FoundX, FoundY, 800, 400, 1000, 600, C:\code\bg\klmfb.png
    ; MsgBox, FoundX, FoundY
; Return

; ~$*LButton::
;     SetTimer , loopClick, 120
;     ToolTip p, 800,960,7
; return

; LButton Up::
;     SetTimer , loopClick, Off
;     ToolTip,,,,7
; return


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





; f::

;     Send, {Enter}
;     Send, [Model_1730M0613301]
;     Send, Socket_1=1(36),2(36),3(16),4(16),5(00),6(00),7(00),8(00),9(00)
;     Send, Socket_2=1(32),2(32),3(32),4(32),5(00),6(00),7(00),8(00),9(00)
;     Send, Socket_3=1(32),2(32),3(32),4(32),5(00),6(00),7(00),8(00),9(00)
;     Send, Socket_4=1(00),2(00),3(00),4(00),5(00),6(24),7(32),8(24),9(32)

; Return


