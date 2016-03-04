
Guess = { 
      tests = {} , db=nil ,
      sumTest = 0 , currentTest=0, 
      slogan = "", answer="", status=0, points=0,
      btnLabels={}, userInput={}, score=0, 
    }

function Guess:new (o,name)

  o = o or {}
  setmetatable(o, self)
  self.__index = self
  local sqlite3 = require("sqlite3")
  
  local path = system.pathForFile( name, system.DocumentsDirectory)
  print("path,", path)
  self.db = sqlite3.open( path )

  -- create database and populate
  Guess:init()
  
  return o

end

function Guess:init()

  -- self.db:exec[[
  -- 	CREATE TABLE tests (id INTEGER PRIMARY KEY, answer, slogan);

  -- 	INSERT INTO tests VALUES (NULL, 'ABS-CBN', 'In the Service of the Filipino' );
  -- 	INSERT INTO tests VALUES (NULL, 'BPI', 'We will take you farther');
  -- 	INSERT INTO tests VALUES (NULL, 'BAYANTEL', 'Gaganda pa ang buhay');
  -- 	INSERT INTO tests VALUES (NULL, 'BOYSEN', 'The Quality You can Trust');
  --   INSERT INTO tests VALUES (NULL, 'MARKS AND SPENCER', 'Between love and madness lies obsession')
  -- ]]
  self.db:exec[[
    CREATE TABLE tests (id INTEGER PRIMARY KEY, answer, slogan, status, points);
    
    INSERT INTO tests VALUES (NULL, 'BAYANTEL', 'Gaganda pa ang buhay',0,100);
    INSERT INTO tests VALUES (NULL, 'MARKS AND SPENCER', 'Between love and madness lies obsession',0,100);
  ]]

  self.db:exec[[
    CREATE TABLE users (id INTEGER PRIMARY KEY, currentTest INTEGER, currentScore INTEGER);
    
    INSERT INTO users VALUES (1, NULL,100);
  ]]

  Guess:getRandomTest()
  Guess:storeCurrentTest()
end
function Guess:printTest()
    for row in self.db:nrows("SELECT * FROM tests WHERE status = 0 ORDER BY RANDOM() LIMIT 1") do 
        print(row['id'],row['slogan'],row['answer'],row['status'])
    end
end

function Guess:printUser()
   print("id","currentTest","currentScore")
   for row in self.db:nrows("SELECT * FROM users where id = 1") do 
      print(row['id'],row['currentTest'],row['currentScore'])
  end
end

function Guess:getRandomTest()

   for row in self.db:nrows("SELECT * FROM tests WHERE status = 2  ORDER BY RANDOM() LIMIT 1") do 
      self.slogan=row['slogan']
      self.answer=row['answer']
      self.status=row['status']
      self.points=row['points']
      self.currentTest=row['id']
      return
    end
    for row in self.db:nrows("SELECT * FROM tests WHERE status = 0 ORDER BY RANDOM() LIMIT 1") do 
            self.slogan=row['slogan']
            self.answer=row['answer']
            self.status=row['status']
            self.points=row['points']
            self.currentTest=row['id']
       return
    end
end

function Guess:initUser()
  print("here in inint User . . . .")
  for row in self.db:nrows("SELECT * FROM users WHERE id = 1") do 
      --print("currentScore ", row['currentScore'])
      self.score=row['currentScore']
  end
end
function Guess:getUserScore()

  for row in self.db:nrows("SELECT currentScore FROM users WHERE id = 1 ") do 
    self.score=row['currentScore']
  end
  return self.score
end

function Guess:updateTest(currentTest,status)
  self.db:exec("UPDATE tests SET status = "..status.." WHERE id = "..currentTest)
end

function Guess:storeCurrentTest()
  self.db:exec("UPDATE users SET currentTest = "..self.currentTest.." WHERE id = 1")
end

function Guess:meritUser(points)
    self.db:exec("UPDATE users SET currentScore = currentScore + "..points.." WHERE id = 1")
end

function Guess:demeritUser(points)
    self.db:exec("UPDATE users SET currentScore = currentScore - "..points.." WHERE id = 1")
end

function trim3(s)
  return string.gsub(s, "%s", "")
end
function Guess:initUserInput()
 self.userInput=Guess:initTable(self.userInput)
 local answer = string.len(string.gsub(self.answer, "%s", ""))
 for i=1,answer,1 do
    self.userInput[i]="_"
 end
end

-- function Guess:setTests()

--   local i=1
--   for row in self.db:nrows("SELECT * FROM tests ORDER BY RANDOM() LIMIT 10")  do
--     self.tests[i]=row
--     i = i+1
--   end

--   for sum in self.db:urows('SELECT COUNT(slogan) FROM tests') do self.sumTest = sum end

-- end

-- function Guess:printTests()
-- 	--  for key,value in pairs(t) do print(key,value) end
--   for row,test in pairs(self.tests) do
--   	print(row, test.answer, test.slogan)
--   end
-- end
-- function Guess:getTest(testId)
--    self.slogan = self.tests[testId].slogan
--    self.answer = self.tests[testId].answer
--    --return self.tests[testId].slogan
-- end
-- function Guess:getSlogan(testId)
--    self.slogan = self.tests[testId].slogan
--    return self.tests[testId].slogan
-- end
-- function Guess:getanswer(testId)
--    self.answer = self.tests[testId].answer
--    return self.tests[testId].answer
-- end

-- function Guess:dbClose( event )
--     if ( event.type == "applicationExit" ) then
--       db:close()
--     end
-- end
local function shuffleString(inputStr)
  local outputStr = "";
  local strLength = string.len(inputStr);

  while (strLength ~=0) do
    --get a random character of the input string
    local pos = math.random(strLength);

    --insert into output string
    outputStr = outputStr..string.sub(inputStr,pos,pos);

    --remove the used character from input string
    inputStr = inputStr:sub(1, pos-1) .. inputStr:sub(pos+1);

    --get new length of the input string
    strLength = string.len(inputStr);
  end

  return outputStr;
end
function Guess:setKeys(answer)
  local answer = trim3(answer)
  rand_length = 18 - string.len(answer)
  if string.len(answer) ~= 0 then
    local str="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    for i=1,rand_length,1 do
      answer = answer..string.char(str:byte(math.random(1, #str)))
    end
    local rand_answer = shuffleString(answer)
    self.btnLabels = Guess:initTable(self.btnLabels)
    for i=1,#rand_answer do
      self.btnLabels[i]=rand_answer:sub(i,i)
    end
    --for k,v in pairs(self.btnLabels) do
    ---  print(" KEY ** "..v)
    --end
   end
  
end
function Guess:initTable(table)
  -- body
  for k in pairs (table) do
    table [k] = nil
   end
   return table
end

