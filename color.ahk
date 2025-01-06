SysGet , VirtualWidth, 16
SysGet , VirtualHeight, 17
CoordMode , ToolTip, Screen
CoordMode , Mouse, Screen
CoordMode , Pixel, Screen

Process, Priority, , High
#Persistent
#SingleInstance force


GetColor(x, y)
{
	PixelGetColor , color, x, y, RGB
	StringRight color, color, 10	;
	return color
}








Gui, Color, EEAA99
; Gui +LastFound  ; 让 GUI 窗口成为上次找到的窗口以用于下一行的命令.
Gui, +LastFound +AlwaysOnTop -Caption 
; +E0x20 
; Gui, -Caption +ToolWindow
; WinSet, TransColor, EEAA99
; Gui, -Caption ; 移除标题栏和边框
Gui, Add, Button,  gButton1 Center, 说明
Gui, Add, Button,  gButton2 Center, 按钮2
Gui, Add, Button,  gButton3 Center, 按钮3
Gui, Add, Button,  gButton4 Center, 重新加载
Gui, Add, Button, gCloseGui, 关闭




Gui, Show, w200 h150, 颜色获取器


WinSet, TransColor, EEAA99


; 设置 GUI 窗口的布局和大小
; Gui, Add, Text,, ; 添加一个文本控件来占位，使按钮竖直排列
; Gui, Show, w200 h150, My GUI Window
; WinSet, Style, +0xC00000, A ; 添加边框样式

return


; 按钮点击事件处理
CloseGui:
    ; Gosub, GuiClose
    ExitApp
    return

; 处理 GUI 消息
GuiClose:
    Gui, Destroy
    return



Button1:
    MsgBox, f1获取当前鼠标位置和颜色
return

; 按钮2的回调
Button2:
    MsgBox, 你点击了按钮2!
return

; 按钮3的回调
Button3:
    MsgBox, 你点击了按钮3!
return

; 按钮4的回调
Button4:
    Gui, Destroy ; 销毁当前GUI
    Reload
return










F1::
    MouseGetPos, mouseX, mouseY
    PixelGetColor, color, mouseX, mouseY
    PixelGetColor, color_rgb, mouseX, mouseY, RGB

    info := "鼠标位置：X=" mouseX " Y=" mouseY " color=" color " rgb=" color_rgb
    Clipboard := "GetColor(" mouseX ", " mouseY ") == """ GetColor(mouseX,mouseY) """"

    ToolTip, %info%, 300,500,1
Return