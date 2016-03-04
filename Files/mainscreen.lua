widget = require("widget")
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local background, BillBoard, Title, Play, Quit, Help, About

local function onUpdate( event )
    
end

function scene:create( event )
    local sceneGroup = self.view

	background = display.newImage("Images/BG.jpg")
	background.x = centerX
	background.y = centerY
	sceneGroup:insert( background )
	
	BillBoard = display.newImageRect("Images/BillBoard.png", 640, 344)
	BillBoard.x = centerX
	BillBoard.y = 167
	sceneGroup:insert( BillBoard )
 
    Title = display.newImageRect("Images/Title.png", 340, 150)
    Title.x = centerX
    Title.y = 	0
    transition.to(Title, {time = 1200, x = centerX, y = 95, transition = easing.outBounce})
    sceneGroup:insert( Title )

------------- Play Button ------------------------------------------------------------------------------------------

Play = widget.newButton
{
	height = 45,
	width = 150,
    defaultFile = "Images/Playbutton.png",
    overFile = "Images/Playbutton1.png",
    onPress = push1,
}
Play.x = centerX
Play.y = 230
sceneGroup:insert( Play )
Play:addEventListener("tap", Play)
function Play:tap( event )
	local Play = {
    effect = "fromBottom",
    time = 700,
	}
	composer.gotoScene( "Files.Play", Play )
end

------------- Quit Button ------------------------------------------------------------------------------------------

Quit = widget.newButton
{
	height = 45,
	width = 150,
    defaultFile = "Images/Quitbutton.png",
    overFile = "Images/Quitbutton1.png",
    onPress = push1
}
Quit.x = centerX
Quit.y = 283
sceneGroup:insert( Quit )
Quit:addEventListener( "tap", Quit )
function Quit:tap( event )
	local Quit = {
    effect = "fromBottom",
    time = 700,
	}
	composer.gotoScene( "Files.Quit", Quit )
end


------------- Help Button ------------------------------------------------------------------------------------------

Help = widget.newButton
{
	height = 40,
	width = 40,
    defaultFile = "Images/Help.png",
    overFile = "Images/Help1.png",
    onPress = push1
}
Help.x = -30
Help.y = 238
sceneGroup:insert( Help )
transition.to(Help, {time = 1100, x = 15, y = 238, transition = easing.outBack, rotation = 360})
Help:addEventListener("tap", Help)
function Help:tap( event )
	local Help = {
    effect = "fromBottom",
    time = 700,
	}
	composer.gotoScene( "Files.Help", Help )
end

------------- About Button ------------------------------------------------------------------------------------------

About = widget.newButton
{
	height = 40,
	width = 40,
	defaultFile = "Images/About.png",
	overFile = "Images/About1.png",
}
About.x = -30
About.y = 290
sceneGroup:insert( About )
transition.to(About, {time = 1300, x = 15, y = 290, transition = easing.outBack, rotation = 360})
About:addEventListener( "tap", About )
function About:tap( event )
	local About = {
    effect = "fromBottom",
    time = 700,
	}
	composer.gotoScene( "Files.About", About )
end

end
------------- Enter Scene ------------------------------------------------------------------------------------------

function scene:show( event )
    local phase = event.phase
    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end

function scene:hide( event )
    local phase = event.phase
    if ( event.phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end

function scene:destroy( event )

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene
