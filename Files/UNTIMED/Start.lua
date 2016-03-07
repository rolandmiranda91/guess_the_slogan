display.setStatusBar(display.HiddenStatusBar)
centerX = display.contentWidth / 2
centerY = display.contentHeight / 2

local widget = require("widget")
local usefulFunc = require("Files.UsefulFunctions")
local g = require("Files.UNTIMED.guess")

local composer = require ("composer")
local scene = composer.newScene()
composer.recycleOnSceneChange = true

local guess = Guess:new(nil,"Guess.sqlite3")
guess:init()

--guess:setKeys(guess.answer)
guess:initUserInput()
guess:initUser()


local Hint1, Hint2, background, Line, Coin, Back, scoreText
local buttons = {}
local fields = {}

local function onUpdate( event )

end

function scene:create( event )

	
    --guess:getRandomTest()
    guess:printTest()
	guess:printUser()
 	guess:setKeys(guess.answer)
 	guess:initUserInput()
 	guess.score = guess:getUserScore()
 

    local sceneGroup = self.view

	background = display.newImage("Images/GAME BG.jpg", centerX, centerY)
	sceneGroup:insert( background )

	Line = display.newLine(0, 227, 480, 227)
	Line:setStrokeColor(0, 0, 1)
	sceneGroup:insert( Line )

	Coin = display.newImageRect("Images/Coin.png", 105, 33)
	Coin.x = 440
	Coin.y = 25
	Coin.label = "100"
	sceneGroup:insert( Coin )

	scoreText = display.newText( guess.score , Coin.x, Coin.y, "GrilledCheese BTN Cn", 10 )
	scoreText:setFillColor(0)
	sceneGroup:insert( scoreText )

	local flashtext = display.newText( guess.slogan , centerX, 70, "GrilledCheese BTN Cn", 30 )
	flashtext:setFillColor(0)
	sceneGroup:insert( flashtext )

------------- Back buttons ------------------------------------------------------------------------------------------

	Back = widget.newButton
	{
		width = 85,
		height = 33,
		defaultFile = "Images/Backquit.png",
		overFile = "Images/Backquit1.png",
	}
	Back.x = 25
	Back.y = 25
	sceneGroup:insert( Back )
	Back:addEventListener( "tap", Back )
	function Back:tap(event)
		local Back = {
	    effect = "crossFade",
	    time = 500,
		}
		composer.gotoScene( "Files.mainscreen", Back )
		--mainscreen=storyboard.getSceneName()
		guess:updateTest(guess.currentTest,2)
	end

------------- Text fields / display Letter ------------------------------------------------------------------------------------------
	local str = string.gsub(guess.answer, "%s", "")
	
	local spaces = 0
	for w in string.gmatch(guess.answer, "%s+") do
		spaces = spaces + 1
	end
	local y =  200 - (35*spaces)
	local a = 0
	local str = ""
	for w in string.gmatch(guess.answer, "%w+") do
		local i = 0

		while string.len(w) > i do
		   	a = a + 1
		   	i = i + 1
			fields[a] = widget.newButton
			{
				font = "GrilledCheese BTN Cn",
				fontSize = 18,
				labelColor = { default={0,0,0}, over={0,0,0} },
				height = 30,
				width = 30,
				defaultFile = "Images/Keyfield.png",
				overFile = "Images/Keyfield.png",
				onEvent = groupFieldAction
			}
		 	 fields[a].x =  centerX - (string.len(w)/2*33)+ (i*33)  
		     
		 	 fields[a].y =  y 
			 fields[a].id = a
			 fields[a]:setLabel("_")
			 sceneGroup:insert( fields[a] )
		 end
		 str = str..w
		 a = string.len(str)
		 y = y + 35

	end

------------- Key buttons Letters ------------------------------------------------------------------------------------------

	for i=1,#guess.btnLabels do
		btnIndex = "btn"..i
		buttons[btnIndex] = widget.newButton
		{
			label = guess.btnLabels[i],
			font = "GrilledCheese BTN Cn",
			fontSize = 20,
			labelColor = { default={0,0,0}, over={1,1,1} },
			height = 30,
			width = 30,
			defaultFile = "Key.png",
			overFile = "Key1.png",
			onEvent = groupBtnAction
		}
		if i <= 9 then
		  buttons[btnIndex].x = 32 + ((i-1)*44)
		  buttons[btnIndex].y = 252
		else
		  buttons[btnIndex].x = 32 + (table.getn(guess.btnLabels)-i)*44
		  buttons[btnIndex].y = 294
		end
		buttons[btnIndex].id = btnIndex
		buttons[btnIndex]:setEnabled(true)
		sceneGroup:insert( buttons[btnIndex] )

	end

	-- removed 2 letters cost 20
	Hint1 = widget.newButton
	{
		height = 38,
		width = 50,
		defaultFile = "Images/Hint 1.png",
		overFile = "Images/Hint 2.png",
		onEvent = groupBtnActionHint1
	}
	Hint1.x = 440
	Hint1.y = 252
	sceneGroup:insert( Hint1 )

	-- show 2 letters cost 40
	Hint2 = widget.newButton
	{
		height = 38,
		width = 50,
		defaultFile = "Images/Hint 2.png",
		overFile = "Images/Hint 1.png",
		onEvent = groupBtnActionHint2
	}
	Hint2.x = 440
	Hint2.y = 294
	sceneGroup:insert( Hint2 )

end
------------- Enter New Scene ------------------------------------------------------------------------------------------

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


function groupFieldAction(event)
	

	if (event.phase == "ended") then
		button_label=fields[event.target.id]:getLabel()
	    if button_label ~= "_" then 
			button_label=fields[event.target.id]:getLabel()
			field=fields[event.target.id]
			buttons[field['fromButton']]:setLabel(button_label)
			buttons[field['fromButton']]:setEnabled(true)
			field:setLabel("_")
			local btn=field['fromButton']
			guess.userInput[event.target.id] = "_"	

		end
	end
end

function groupBtnAction(event)

	if (event.phase == "ended" and inTable(guess.userInput,"_") ) then
	   
	  for key,field in pairs(fields) do 
	  	if field:getLabel() == "_" then
	  		field:setLabel(buttons[event.target.id]:getLabel())
	  		field['fromButton']=event.target.id
	  		guess.userInput[field.id]=buttons[event.target.id]:getLabel()
	  		break
	  	end
	  end

	  local userInput = ""

	  for key, value in pairs(guess.userInput) do 
	  		 userInput = userInput .. value
	  end

	   buttons[event.target.id]:setLabel("")
	   buttons[event.target.id]:setEnabled(false)

	  print("userInput=",userInput," == guess.answer=",trim3(guess.answer))
	  if (userInput== trim3(guess.answer) ) then 
			guess:updateTest(guess.currentTest,1) -- 1 stands for done, 0 for open, 2 for returning
			guess:meritUser(guess.points)
			guess:getRandomTest()
			scene:create(event)
	  end
    end
	
end

function groupBtnActionHint1(event)

	if (event.phase == "ended") then
	  local key = 0
	  local fieldRand=0
	  local randStr = {}

	  if guess.score >= 40 then
	  	  
	  	for key, field in pairs(fields) do 
	  		if field:getLabel() == "_" then 
	  			fieldRand = fieldRand + 1
	  			randStr[fieldRand] = key
	  		end
	 	 end

	  	if fieldRand > 0 then 
	  		local i =math.random(1,fieldRand)
	  		key = randStr[i]
	  		fields[key]:setLabel(string.char(guess.answer:byte(key)))
	  		for i, button in pairs(buttons) do 
	  			if button:getLabel() == string.char(guess.answer:byte(key)) then 
	  				button:setLabel("")
	  				button:setEnabled(false)
	  				fields[key]['fromButton'] = button.id
	  				break
	  			end
	  		end
	  		
	  		guess:demeritUser(40)
	  		guess.score=guess:getUserScore() 
	  		scoreText.text = guess.score

	  		local userInput = "" 
	  		for key, field in pairs(fields) do 
		  		if field:getLabel() ~= "_" then 
		  			userInput = userInput..field:getLabel()
		  		end
	  		end
	  		if userInput == trim3(guess.answer) then 
	  			guess:updateTest(guess.currentTest,1) -- 1 stands for done, 0 for open, 2 for returning
				guess:meritUser(guess.points)
				guess:getRandomTest()
				scene:create(event)
	  		end
	 	 end
	    end
	  	
	  	--guess:demeritUser(40)
	  	--guess.score=guess:getUserScore() 
	  	--scoreText.text = guess.score 
	  
	end
end
function groupBtnActionHint2(event)

	if (event.phase == "ended") then
		if guess.score >= 20 then
			local buttonStr = ""
			for i,button in pairs(buttons) do
				buttonStr=buttonStr..button:getLabel()
			end
			local randStr = {}
			local x = 0
			for i,button in pairs(buttons) do
				--print(string.match(trim3(guess.answer),button:getLabel()))
				if string.match(trim3(guess.answer),button:getLabel()) == nil and button:getLabel() ~= "" then 
					print("chars not included ",  button:getLabel())
					x = x + 1
					randStr[x] = button.id
			    else
			    	local dup = 0
			    	local rep = 0
			    	for word in string.gmatch(trim3(guess.answer),button:getLabel()) do 
			    		rep = rep + 1
			    	end
					for word in string.gmatch(buttonStr,button:getLabel()) do
	  				  dup = dup + 1
	  				  if dup > rep and button:getLabel() ~= "" then
	  				  	print("duplicate ",button:getLabel())
	  				    x = x + 1
					    randStr[x] = button.id
					    break
					  end
					end
				end
				
			end
			for key,value  in pairs(randStr) do
				print("excluded . .  ",buttons[value]:getLabel())
				print(key,value)
			end
			print("xx ", x)
			if x ~= 0 then
			 local key=math.random(1,x)
			  local btnIndex=randStr[key]
			  print(" removed "..btnIndex,  buttons[btnIndex]:getLabel())
			  buttons[btnIndex]:setLabel("")
      		  buttons[btnIndex]:setEnabled(false)
      		  randStr[key]=nil
      		  guess:demeritUser(20)
			  guess.score=guess:getUserScore() 
			  scoreText.text = guess.score 
			end
		end
	end

end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

return scene
