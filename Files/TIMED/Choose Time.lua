display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local BlackBG, BG, choose, three, three1, five, five1, Home

local function onUpdate( event )
    
end

function scene:create( event )
    local sceneGroup = self.view

	BG = display.newImageRect("Images/Popup.png", 370, 260)
	BG.x = centerX
	BG.y = centerY
	sceneGroup:insert( BG )

	choose = display.newText("Choose", centerX, 65, "GrilledCheese BTN Toasted", 36)
	choose:setTextColor(0)
	sceneGroup:insert( choose )
	
------------- 3 Minutes Label & Button ------------------------------------------------------------------------------------------

	three = display.newText("3 Minutes", 160, 252, "Cooper Black", 22)
	three:setTextColor(0)
	sceneGroup:insert( three )
	
	three1 = widget.newButton
{
	width = 130,
	height = 130,
    defaultFile = "Images/TimedUntimed.png",
	overFile = "Images/TimedUntimed1.png",
}
three1.x = 160
three1.y = 170
sceneGroup:insert( three1 )
three1:addEventListener("tap", three1)
function three1:tap( event )
	local three1 = {
    effect = "fade",
    time = 700,
	}
	composer.gotoScene( "Files.TIMED.3 Minutes", three1 )
end

------------- 5 Minutes Label & Button ------------------------------------------------------------------------------------------

five = display.newText("5 Minutes", 325, 252, "Cooper Black", 22)
	five:setTextColor(0)
	sceneGroup:insert( five )
	
	five1 = widget.newButton
{
	width = 130,
	height = 130,
    defaultFile = "Images/TimedUntimed.png",
	overFile = "Images/TimedUntimed1.png",
}
five1.x = 325
five1.y = 170
sceneGroup:insert( five1 )
five1:addEventListener("tap", five1)
function five1:tap( event )
	local five1 = {
    effect = "fade",
    time = 700,
	}
	composer.gotoScene( "Files.TIMED.5 Minutes", five1 )
end

------------- Home Button ------------------------------------------------------------------------------------------

Home = widget.newButton
{
	width = 45,
	height = 45,
	defaultFile = "Images/Home.png",
	overFile = "Images/Home1.png",
	onPress = push1
}
Home.x = 90
Home.y = 55
sceneGroup:insert( Home )
local function spinImage (event)
transition.to(Home, {time = 3000, x = 90, y = 55, rotation = Home.rotation-360, onComplete=spinImage})
end
spinImage()
Home:addEventListener("tap", Home)
function Home:tap( event )
	local Home = {
    effect = "crossFade",
    time = 500,
	}
	composer.gotoScene( "Files.mainscreen", Home )
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