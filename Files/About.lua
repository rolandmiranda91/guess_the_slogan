display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local BlackBG, AboutBG, dev, mark, mark1, mark2, mark3, glory, glory1, glory2, glory3, jumar, jumar1, jumar2, jumar3, Back

local function onUpdate( event )
    
end

function scene:create( event )
    local sceneGroup = self.view
	
    AboutBG = display.newImageRect("Images/Popup.png", 530, 310)
	AboutBG.x = centerX
    AboutBG.y = centerY
    sceneGroup:insert( AboutBG )
    	
	dev = display.newText("Developers", centerX, 42, "GrilledCheese BTN Toasted", 39)
	dev:setTextColor(0)
	sceneGroup:insert( dev )
	mark = display.newImageRect("Images/mark.png", 120, 120)
	mark.x = 80
	mark.y = 140
	sceneGroup:insert( mark )
	mark1 = display.newText("Mark Anthony Oyam", 80, 230, "Arial Narrow", 18)
	mark1:setTextColor(0)
	sceneGroup:insert( mark1 )
	mark2 = display.newText("Bugallon Pangasinan", 80, 251, "Arial Narrow", 18)
	mark2:setTextColor(0)
	sceneGroup:insert( mark2 )
	mark3 = display.newText("09109368808", 80, 275, "Arial Narrow", 18)
	mark3:setTextColor(0)
	sceneGroup:insert( mark3 )
	
	glory = display.newImageRect("Images/glory.png", 120, 120)
	glory.x = centerX
	glory.y = 140
	sceneGroup:insert( glory )
	glory1 = display.newText("Glory Ann Joy Leal", centerX, 230, "Arial Narrow", 18)
	glory1:setTextColor(0)
	sceneGroup:insert( glory1 )
	glory2 = display.newText("Lingayen Pangasinan", centerX, 251, "Arial Narrow", 18)
	glory2:setTextColor(0)
	sceneGroup:insert( glory2 )
	glory3 = display.newText("09128579563", centerX, 275, "Arial Narrow", 18)
	glory3:setTextColor(0)
	sceneGroup:insert( glory3 )
	
	jumar = display.newImageRect("Images/jumar.png", 120, 120)
	jumar.x = 400
	jumar.y = 140
	sceneGroup:insert( jumar )
	jumar1 = display.newText("Jumar Carlito Vila", 400, 230, "Arial Narrow", 18)
	jumar1:setTextColor(0)
	sceneGroup:insert( jumar1 )
	jumar2 = display.newText("Lingayen Pangasinan", 400, 251, "Arial Narrow", 18)
	jumar2:setTextColor(0)
	sceneGroup:insert( jumar2 )
	jumar3 = display.newText("09463430037", 401, 275, "Arial Narrow", 18)
	jumar3:setTextColor(0)
	sceneGroup:insert( jumar3 )
	
------------- Back Button ------------------------------------------------------------------------------------------

Back = widget.newButton
{
	width = 45,
	height = 45,
	defaultFile = "Images/Back.png",
	overFile = "Images/Back1.png",
	onPress = push1
}
Back.x = 445
Back.y = 38
sceneGroup:insert( Back )
local function spinImage (event)
transition.to(Back, {time = 3000, x = 445, y = 38, rotation = Back.rotation-360, onComplete=spinImage})
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