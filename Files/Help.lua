display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local BlackBG, HelpBG, ins, Time, Time1, Time2, Time3, Untime, Untime1, Untime2, Untime3, Untime4, Back

local function onUpdate( event )
    
end

function scene:create( event )
    local sceneGroup = self.view
	
    HelpBG = display.newImageRect("Images/Popup.png", 500, 310)
	HelpBG.x = centerX
    HelpBG.y = centerY
    sceneGroup:insert( HelpBG )
    
	ins = display.newText("Instruction", centerX, 44, "GrilledCheese BTN Toasted", 40)
	ins:setTextColor(0)
	sceneGroup:insert( ins )
	Time = display.newText("TIMED MODE",centerX, 85, "Arial", 21)
	Time:setTextColor(0)
	sceneGroup:insert( Time )
	Time1 = display.newText("In this Mode, you will choose either 3 or 5 minutes",centerX, 111, "Arial", 18)
	Time1:setTextColor(0)
	sceneGroup:insert( Time1 )
	Time2 = display.newText("of time to answer the following given problem as many",centerX, 135, "Arial", 18)
	Time2:setTextColor(0)
	sceneGroup:insert( Time2 )
	Time3 = display.newText("as you can. Until the end of time.",centerX, 159, "Arial", 18)
	Time3:setTextColor(0)
	sceneGroup:insert( Time3 )
	
	Untime = display.newText("UNTIMED MODE",centerX, 190, "Arial", 20)
	Untime:setTextColor(0)
	sceneGroup:insert( Untime )
	Untime1 = display.newText("In this Mode, you need to answer the different given", centerX, 216, "Arial", 18)
	Untime1:setTextColor(0)
	sceneGroup:insert( Untime1 )
	Untime2 = display.newText("problem. In every correct answer you will earn 3 coins.", centerX, 238, "Arial", 18)
	Untime2:setTextColor(0)
	sceneGroup:insert( Untime2 )
	Untime3 = display.newText("You can use this coins to buy hints. 5 coins for showing",centerX, 260, "Arial", 18)
	Untime3:setTextColor(0)
	sceneGroup:insert( Untime3 )
	Untime4 = display.newText("letter and 25 coins for revealing the correct answer.",centerX, 282, "Arial", 18)
	Untime4:setTextColor(0)
	sceneGroup:insert( Untime4 )
	
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