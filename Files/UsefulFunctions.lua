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

--local function main()
--  local testString = "Shuffle Me!!";
--  print("Before Shuffle: ",testString);
--
--  testString = shuffleString(testString);
--  print("After Shuffle: ",testString);
--end

--run the code:
--main();
