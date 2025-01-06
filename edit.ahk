;------------------------------------------------游戏为置顶窗口才会生效
#IfWinActive ahk_exe Game.exe
SysGet , VirtualWidth, 16
SysGet , VirtualHeight, 17
CoordMode , ToolTip, Screen
Process, Priority, , High
#Persistent
#SingleInstance
;-------------------------------------------------定义变量
GetColor(x, y)
{
	PixelGetColor , color, x, y, RGB
	StringRight color, color, 10	;
	return color
}
GetColorAt(x, y) {
    PixelGetColor, color, %x%, %y%
    return Format("0x{:X}", color) ; 将颜色转换为十六进制字符串
}

;Pause
;Suspend
;~$*Alt Up::
;	Send {Alt Up}
;return
;--------------------------------------------------F键 自动拾取

str := []
v_Enable = true
baal = true
v_w = true
statusfb = true
v_cli = true
v_clia = true
init_int_a := 122
v_p = true
i := 1
t4 = 1
int_a := 10
; 1 true 	0 false
aa:=true
bb:=true

;------------------fdsfd
userpass(u,p){
	
	if(GetColor(741,252)=="0x666666"){
		SendRaw, %u%
		Send, {Tab}
		Sleep, 50
		SendRaw, %p%
		Sleep, 50
		Click 561,546
		Sleep, 50
		Click 702,591
		ToolTip %u%, 1000,20,16
		return
	}
	Click 1522,841
	Sleep, 50
	if(GetColor(911,348)!="0xFFFFFF" ){
		Click 895,507
	}
	Sleep, 400
	if(GetColor(741,252)!="0x666666"){
		return
	}
	; Sleep, 400
	; SendRaw, %u%
	; Send, {Tab}
	; Sleep, 50
	; SendRaw, %p%
	; Sleep, 50
	; Click 702,591
	return
}

g::	;F键 开关
{
	v_Enable := !v_Enable
	if (v_Enable = true){
		offautof()
	} else{
		onautof()
	}
}
return


onautof(){
	SetTimer , autolbg, 100
	ToolTip GG, 1000,960,1	
}

offautof(){
	SetTimer , autolbg, Off
	ToolTip ,,,,1
}

autolbg:
{
	SendInput, f
	Sendinput, {WheelDown}
}
return

F2::
m::
v::
b::
	StringRight KeyM,A_ThisHotkey,2 
	{
		v_Enable := !v_Enable
		v_cli := !v_cli
		v_clia := !v_clia
		; 如果下次为开启状态，就关闭，否则就恢复原来状态
		if (v_Enable = true){
			offautof()
		}
		else{v_Enable := !v_Enable}

		if (v_Enable = true){
			SetTimer, onClick,off
			ToolTip    ,,,,2
		}
		else{v_cli := !v_cli}

		if (v_Enable = true){
			SetTimer, cla,off
			ToolTip    ,,,,5
		}
		else{v_clia := !v_clia}


		
		if KeyM=m
		{
			Send, m
			v_p := !v_p
			if (v_p = True)
			{
				ToolTip ,,,,7
				SetTimer, fdse,off
			} else {
				ToolTip p, 800,960,7
				SetTimer, fdse, 
			}
		}
		if KeyM=v
		{
			Send, v
		}
		if KeyM=b
		{
			Send, b
		}
		If KeyM=F2
		{
			Send, l
		}
	}
return



fdse:
{
	; if  GetColor(1233,868)=="0xFFCC33"  ;自动点击传送
	; 12小秘境34,1传送2神像，3小秘境，4大秘境
	if GetColor(1082,634)=="0x09EDF9" or GetColor(1083,634)=="0x99ECF5" or GetColor(1084,636)=="0x00FFFF" or GetColor(1083,638)=="0x4FCAE6"{
		Click 1085,644
	}else if(GetColor(1085,697)=="0x2D91D9" or GetColor(1082,702)=="0x99ECF5" or GetColor(1081,699)=="0x04EFF7" or GetColor(1083,702)=="0xCCFFFF"){
		Click 1082,695
	}
	if GetColor(1318,865)=="0x4A5366"   ; if GetColor(1232,870)=="0xFFCB32" ;if GetColor(1233,870)=="0xFFCC33"
	{
		Click 1320,867
		v_p := !v_p
		if (v_p = True)
		{
			ToolTip ,,,,7
			SetTimer, fdse,off
		}
	}

}
Return

X::
{
	v_cli := !v_cli
	If (v_cli = true){
		SetTimer, onClick,off
		ToolTip    ,,,,2
	}else{
		Click
		SetTimer, onClick,200
		ToolTip on, 940,960,2	;On显示的位置坐标
	}
}
return
onClick:
{
		;SendInput, {Click}
		Click
}
return

F8::
{
	Send {F2}
}
return

f10::
{
	Click, 1519,664
	Sleep, 40
	Click, 1485,868
	Sleep, 40
	Click, 114,160
	Sleep, 40
	Click, 117,211
	Sleep, 40
	Click, 1519,500
}
return





f7::
{
	v_clia := !v_clia
	If (v_clia = true){
		SetTimer, cla,off
		ToolTip    ,,,,5
	}else{
		SetTimer, cla,100
		ToolTip on, 960,960,5	;On显示的位置坐标
	}
}
return

cla:
{
	; 多人
	if GetColor(1232,855)=="0x373232" or GetColor(1235,861)=="0x984646" {
		Click 1232,855
	}
	if GetColor(65,83)=="0xD3BC8E" and GetColor(1261,869)=="0x38A1E4"{
		Click 1296,865
	}
	; 购买
	if GetColor(525,541)=="0xB5B4B1"{
		Click 984,548
		Sleep, 20
		Click 908,650
		if GetColor(525,541)!="0xB5B4B1"{
			Click 908,650
		}
	}
	; 活动商店 GetColor(989,543)=="0xAAAEB7"
	if GetColor(1436,873)=="0xECE5D8"{
		Click 1436,873
	}
	if GetColor(961,498)=="0xE4E2DE"{
		Click 989,543
		Sleep, 40
		click 942,657
		Sleep, 40
		click
	}
	; 遮挡
	if GetColor(799,227)=="0xFFE199" or GetColor(801,210)=="0xFFE199" or GetColor(799,212)=="0xFFE199"{
			Send, {esc}
		}
	; 检测四角形
	If (GetColor(849,257)=="0xD3BC8E" or GetColor(119,302)=="0xD3BC8E" or GetColor(887,258)=="0xD3BC8E"){
			Click 1443,870
		}
		; 委托
	if GetColor(1201,705)=="0xEDE3D5"{
		if GetColor(1335,875)=="0x99CC33"{
			Click 1335,875
			Sleep, 100
			Click 1335,875
		}
		if GetColor(1341,874)=="0x313131"{
			Click 1341,874
			Sleep, 20
			MouseMove 180,200
		}
	}
	; 打造
	if (GetColor(72,48)=="0xD3BC8E" and GetColor(52,68)=="0xD2BB8E"){
		if GetColor(1310,574)=="0xECE5D8"{
			Click 1228,582
			Sleep, 50
			Click 1409,871
		}
		; if(GetColor(856,575)=="0xECE5D8"){
		; 	Click 1409,871
		; }
	}
	if GetColor(1310,351)=="0xF39800" or GetColor(1225,592)=="0xFFB738"{
		Click 1415,870
	}
	; 炼金
	
}
return





Ctrl::   ;禁用或启用所有的热键和热字串.（打字用）
	Suspend ;停止脚本
	; SetCapsLockState,off
	; DllCall("SendMessage", UInt, WinActive("ahk_exe YuanShen.exe"), UInt, 80, UInt, 1, UInt, DllCall("LoadKeyboardLayout", Str,"00000804", UInt, 1))
	; v_Enable:=true
	; ; SetTimer, Label, Off
	; ToolTip
	; WinSet AlwaysOnTop,Off,A
	; if (A_IsSuspended=1)
	; 	ToolTip,Suspend,929,129,10
	; else
	; 	if (A_IsSuspended=0)
	; 		ToolTip,,,,10
return


F9::
{
	v_w := !v_w
 	if (v_w = true)	;
 	{
		Send {w Up}
 		ToolTip,,,,8
 	} else {
		Send {w Down}
 		ToolTip on, 1200,960,8	;On显示的位置坐标
	}
}
return



; F11::
; {
; 	if(GetColor(959,600)=="0xFFFFFF" ){
; 		Click 959,655
; 		return
; 	}
; 		Send {Esc}
; 		Sleep 600
; 		Click 46,879
; 		Sleep, 200
; 		Click 959,655
; }
; return

escbiu(k){
	ToolTip %k%, 960,20,17
	if(GetColor(60,62)=="0xFFFFFF"){
		Send {Esc}
		Sleep 600
		Click 46,879
		Sleep, 200
		Click 959,655
	}
}

6::
{
	escbiu("6")
	; userpass("","")
	userpass("","")
}
return
7::
{
	escbiu("7")
	userpass("","")
}
return
8::
{
	escbiu("8")
	userpass("","")
}
return
9::
{
	escbiu("9")
	userpass("","")
}
return

4::
	t4 = 2
	; if(GetColor(313,62)=="0x3C4456"){
	if(GetColor(306,77)=="0x34D6FE"){
		SendInput, 2
	}else{
		SendInput, 4
	}
	Sleep 250
	SendInput {e Down}
	Sleep 950
	SendInput {e Up}
	SetTimer, time4,1000
return

time4:
{
	ToolTip %t4%, 1550,600,4
	t4++
	if(t4==50){
		SetTimer, time4,off
		ToolTip ,,,,4
	}
}
return


F4::
	Send, {f4}

return


WheelDown::
	Send, {WheelDown 10}
return

WheelUp::
	Send, {WheelUp 10}
Return


F1::
	Send {F1}
	Sleep 800
	Click 250,480   ;Alt+F3 讨伐
	Sleep 200
	MouseMove 450,640  ;Alt+F4 无相之风傍边
	{
		Send {WheelDown 200} ;提示当前要打的怪物
	}
return
f12::
	Reload
return









#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; 获取屏幕分辨率
SysGet, Monitor, Monitor

; 计算准星的位置
CrosshairSize := 20 ; 准星大小
CrosshairX := (MonitorRight - MonitorLeft) / 2
CrosshairY := (MonitorBottom - MonitorTop) / 2

; 绘制准星
Gui +LastFound
Gui, Add, Line, x1%CrosshairX% y%CrosshairY% x2%CrosshairX% y%CrosshairY% w%CrosshairSize%
Gui, Add, Line, x%CrosshairX% y1%CrosshairY% x%CrosshairX% y2%CrosshairY% h%CrosshairSize%
Gui, Show, w1 h1 NoActivate, CenterCrosshair
return




^SPACE::  Winset, Alwaysontop, , A

^space:: 
;将当前激活窗口存入变量w
WinGetActiveTitle, w
;对w窗口置顶，Toggle表示在on 与 off 中切换
Winset, AlwaysOnTop, Toggle, %w%
;返回执行
return


add:
{
	MouseMove, 0, 20, 0, R  ; R 参数表示相对移动，0 表示不改变水平位置
}
return








