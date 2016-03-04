display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local QuitBG, confirm, quit, quit1, yes, no, BlackBG

local function onUpdate( event )
    
end

function scene:create( event )
    local sceneGroup = self.view

 	QuitBG = display.newImageRect("Images/Popup.png", 310, 220)
	QuitBG.x = centerX
    QuitBG.y = centerY
    sceneGroup:insert( QuitBG )
    
	confirm = display.newText("Confirm", centerX, 80, "GrilledCheese BTN Toasted", 32)
	confirm:setTextColor(0)
	sceneGroup:insert( confirm )
	quit = display.newText("Are you sure you", centerX, 130, "Cooper Black", 22)
	quit:setTextColor(0)
	sceneGroup:insert( quit )
	quit1 = display.newText("want to exit?", centerX, 160, "Cooper Black", 22)
	quit1:setTextColor(0)
	sceneGroup:insert( quit1 )
	
------------- Yes Button ------------------------------------------------------------------------------------------

	yes = widget.newButton
{
	width = 120,
	height = 45,
    defaultFile = "Images/Yes.png",
	overFile = "Images/Yes1.png",
}
yes.x = 175
yes.y = 225
sceneGroup:insert( yes )
yes:addEventListener("tap", yes)
	function yes:tap (event)
		os.exit()
		return true
	end
    
------------- No Button ------------------------------------------------------------------------------------------

    no = widget.newButton
{
	width = 120,
	height = 45,
	defaultFile = "Images/No.png",
	overFile = "Images/No1.png",
	onPress = push1
}
no.x = 305
no.y = 225
sceneGroup:insert( no )
no:addEventListener( "tap", no )
function no:tap( event )
	local Home = {
    effect = "crossFade",
    time = 500,
	}
	composer.gotoScene( "Files.mainscreen", Home )
end

end

------------- Enter Scene ------------------------------------------------------------------------------------------

function scene:show( event )
    local sceneGroup = self.view
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
    local sceneGroup = self.view
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
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene