display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local BlackBG, ModeBG, mode, Timed, Untimed, Back

local function onUpdate( event )
    
end

function scene:create( event )
    local sceneGroup = self.view

	ModeBG = display.newImageRect("Images/ModeBG.png", 290, 220)
	ModeBG.x = centerX
    ModeBG.y = 170
    sceneGroup:insert( ModeBG )
    
    mode = display.newText("Choose Mode", centerX, 110, "Cooper Black", 30)
	mode:setTextColor(0)
	sceneGroup:insert( mode )
	
------------- Timed Button ------------------------------------------------------------------------------------------

Timed = widget.newButton
{
    width = 180,
    height = 50,
    defaultFile = "Images/Timedbutton.png",
    overFile = "Images/Timedbutton1.png",
    onPress = push1
}
Timed.x = centerX
Timed.y = 170
sceneGroup:insert( Timed )
Timed:addEventListener("tap", Timed)
function Timed:tap( event )
	local Timed = {
    effect = "fromBottom",
    time = 700,
	}
	composer.gotoScene( "Files.TIMED.Choose Time", Timed )
end

------------- Untimed Button ------------------------------------------------------------------------------------------

	Untimed = widget.newButton
{
    width = 180,
    height = 50,
	defaultFile = "Images/Untimedbutton.png",
    overFile = "Images/Untimedbutton1.png",
    onPress = push1
}
Untimed.x = centerX
Untimed.y = 230
sceneGroup:insert( Untimed )
Untimed:addEventListener("tap", Untimed)
function Untimed:tap( event )
	local Untimed = {
    effect = "fade",
    time = 500,
	}
	composer.gotoScene( "Files.UNTIMED.Start", Untimed )
end

------------- Back Button ------------------------------------------------------------------------------------------

Back = widget.newButton
{
	width = 45,
	height = 45,
	defaultFile = "Images/Back.png",
	overFile = "Images/Back1.png",
	onPress = push1
}
Back.x = 368
Back.y = 80
sceneGroup:insert( Back )
local function spinImage (event)
transition.to(Back, {time = 3000, x = 368, y = 80, rotation = Back.rotation-360, onComplete=spinImage})
end
spinImage()
Back:addEventListener( "tap", Back )
function Back:tap( event )
	local Back = {
    effect = "crossFade",
    time = 500,
	}
	composer.gotoScene( "Files.mainscreen", Back )
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