display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local storyboard = require ("storyboard")
local scene = storyboard.newScene()
storyboard.purgeOnSceneChange = true

local btn1, btn2, btn3, btn4, btn5, btn6, btn7, btn8, btn9, btn10, btn11, btn12, btn13, btn14, btn15, btn16, btn17, btn18, background, Line, Timer, Time, Time1, BlackBG, BackBG, Resume, Quit, choose

local function onUpdate( event )
    
end

function scene:createScene(event)
 local group = self.view

	background = display.newImage("Images/GAME BG.jpg", centerX, centerY)
	
	Line = display.newLine(0, 227, 480, 227)
	Line:setColor(0, 0, 1)

	Timer = display.newImageRect("Images/Clock.png", 85, 33)
	Timer.x = 440
	Timer.y = 25
	
------------- Back Button ------------------------------------------------------------------------------------------	

	Back = widget.newButton
{
	width = 85,
	height = 33,
	defaultFile = "Images/Backquit.png",
	overFile = "Images/Backquit1.png",
}
Back.x = 25
Back.y = 25
Back:addEventListener( "tap", Back )
function Back:tap( event )
	BlackBG.isVisible = true
	BackBG.isVisible = true
	Resume.isVisible = true
	Quit.isVisible = true
	label.isVisible = true
	choose.isVisible = true

------------- Key Button True/False ------------------------------------------------------------------------------------------

	btn1.isVisible = false
	btn2.isVisible = false
	btn3.isVisible = false
	btn4.isVisible = false
	btn5.isVisible = false
	btn6.isVisible = false
	btn7.isVisible = false
	btn8.isVisible = false
	btn9.isVisible = false
	btn10.isVisible = false
	btn11.isVisible = false
	btn12.isVisible = false
	btn13.isVisible = false
	btn14.isVisible = false
	btn15.isVisible = false
	btn16.isVisible = false
	btn17.isVisible = false
	btn18.isVisible = false
end    

	BlackBG = display.newImageRect("Images/BlackBG.png", 640, 344)
	BlackBG.x = centerX
	BlackBG.y = centerY
	
	BackBG = display.newImageRect("Images/Popup.png", 250, 240)
	BackBG.x = centerX
	BackBG.y = centerY
	
	choose = display.newText("Choose", centerX, 73, "GrilledCheese BTN Toasted", 32)
	choose:setTextColor(0)

	label = display.newText("Quit game?", centerX, 125, "Cooper Black", 24)
	label:setFillColor(0)
	
------------- Resume Button ------------------------------------------------------------------------------------------

	Resume = widget.newButton
{
	width = 170,
	height = 45,
	defaultFile = "Images/Resumebutton.png",
	overFile = "Images/Resumebutton1.png",
}
Resume.x = centerX
Resume.y = 178
Resume:addEventListener( "tap", Resume )
function Resume:tap( event )
	BlackBG.isVisible = false
	label.isVisible = false
	choose.isVisible = false
	BackBG.isVisible = false
	Resume.isVisible = false
	Quit.isVisible = false
	Timer.isVisible = true
	Line.isVisible = true
	background.isVisible = true
	Back.isVisible = true

------------- Key Button True/False ------------------------------------------------------------------------------------------

	btn1.isVisible = true
	btn2.isVisible = true
	btn3.isVisible = true
	btn4.isVisible = true
	btn5.isVisible = true
	btn6.isVisible = true
	btn7.isVisible = true
	btn8.isVisible = true
	btn9.isVisible = true
	btn10.isVisible = true
	btn11.isVisible = true
	btn12.isVisible = true
	btn13.isVisible = true
	btn14.isVisible = true
	btn15.isVisible = true
	btn16.isVisible = true
	btn17.isVisible = true
	btn18.isVisible = true
end    

------------- Quit Button ------------------------------------------------------------------------------------------

	Quit = widget.newButton
{
	width = 170,
	height = 45,
	defaultFile = "Images/Quitbutton.png",
	overFile = "Images/Quitbutton1.png",
}
Quit.x = centerX
Quit.y = 228
Quit:addEventListener( "tap", Quit )
function Quit:tap( event )
	storyboard.gotoScene("Files.TIMED.Choose Time")
	background.isVisible = false
	Back.isVisible = false
	Timer.isVisible = false
	Line.isVisible = false
	BackBG.isVisible = false
	choose.isVisible = false
	Resume.isVisible = false
	Quit.isVisible = false
	BlackBG.isVisible = false
	label.isVisible = false

------------- Key Button True/False ------------------------------------------------------------------------------------------

	btn1.isVisible = false
	btn2.isVisible = false
	btn3.isVisible = false
	btn4.isVisible = false
	btn5.isVisible = false
	btn6.isVisible = false
	btn7.isVisible = false
	btn8.isVisible = false
	btn9.isVisible = false
	btn10.isVisible = false
	btn11.isVisible = false
	btn12.isVisible = false
	btn13.isVisible = false
	btn14.isVisible = false
	btn15.isVisible = false
	btn16.isVisible = false
	btn17.isVisible = false
	btn18.isVisible = false
end    

------------- Key Button Letters ------------------------------------------------------------------------------------------

	btn1 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn1.x = 64
btn1.y = 252

------------- Button 2 -------------

btn2 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn2.x = 108
btn2.y = 252

------------- Button 3 -------------

btn3 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn3.x = 152
btn3.y = 252

------------- Button 4 -------------

btn4 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn4.x = 196
btn4.y = 252

------------- Button 5 -------------

btn5 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn5.x = 240
btn5.y = 252

------------- Button 6 -------------

btn6 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn6.x = 284
btn6.y = 252

------------- Button 7 -------------

btn7 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn7.x = 328
btn7.y = 252

------------- Button 8 -------------

btn8 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn8.x = 372
btn8.y = 252

------------- Button 9 -------------

btn9 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn9.x = 416
btn9.y = 252

------------- Button 10 -------------

btn10 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn10.x = 64
btn10.y = 294

------------- Button 11 -------------

btn11 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn11.x = 108
btn11.y = 294

------------- Button 12 -------------

btn12 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn12.x = 152
btn12.y = 294

------------- Button 13 -------------

btn13 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn13.x = 196
btn13.y = 294

------------- Button 14 -------------

btn14 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn14.x = 240
btn14.y = 294

------------- Button 15 -------------

btn15 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn15.x = 284
btn15.y = 294

------------- Button 16 -------------

	btn16 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn16.x = 328
btn16.y = 294

------------- Button 17 -------------

btn17 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn17.x = 372
btn17.y = 294

------------- Button 18 -------------

btn18 = widget.newButton
{
	height = 35,
	width = 35,
	defaultFile = "Key.png",
	overFile = "Key1.png",
	onPress = push1
}
btn18.x = 416
btn18.y = 294

end

------------- Enter New Scene ------------------------------------------------------------------------------------------

function scene:enterScene( event )
	background.isVisible = true
	Timer.isVisible = true
	Back.isVisible = true
	Line.isVisible = true
	BlackBG.isVisible = false
	BackBG.isVisible = false
	Resume.isVisible = false
	Quit.isVisible = false
	choose.isVisible = false
	label.isVisible = false

------------- Key Button True/False ------------------------------------------------------------------------------------------

	btn1.isVisible = true
	btn2.isVisible = true
	btn3.isVisible = true
	btn4.isVisible = true
	btn5.isVisible = true
	btn6.isVisible = true
	btn7.isVisible = true
	btn8.isVisible = true
	btn9.isVisible = true
	btn10.isVisible = true
	btn11.isVisible = true
	btn12.isVisible = true
	btn13.isVisible = true
	btn14.isVisible = true
	btn15.isVisible = true
	btn16.isVisible = true
	btn17.isVisible = true
	btn18.isVisible = true
end

function scene:exitScene( event )
		print( "Successfully Transitioned." )
end

function scene:destroyScene( event )
     
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene