display.setStatusBar (display.HiddenStatusBar);
widget = require("widget")
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2
 
local composer = require ("composer")

local bg = display.newImageRect ("Images/main.png", 700, 340)
bg.x = centerX
bg.y = centerY

local Bground = display.newImageRect("Images/MYICON.png", 320, 320)
Bground.x = 243
Bground.y = 164

local function endBackground()
	Bground:removeSelf()
	Bground:removeSelf()
	bg:removeSelf()
	bg:removeSelf()
	Bground = nil
	bg = nil

	local Background = {
    effect = "crossFade",
    time = 700,
	}
	composer.gotoScene( "Files.mainscreen", Background )
    --composer.gotoScene ("Files.mainscreen")
end

timer.performWithDelay(1500, endBackground)

return scene