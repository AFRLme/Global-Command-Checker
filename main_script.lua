--[[
Global Command Checker [v6] (17/03/2014)
Written by AFRLme [Lee Clarke]
-- + --
alternatingfrequencies@hotmail.com | skype @ AFRLme
-- + --
This script is donation optional. In game credit is non-negotiable.
You are free to: ¹ use it in your game(s). ² modify the script.
Do not remove - or edit - this comment block.
--]]

-- * local variables * --
local cmd -- empty variables...

-- * tables * --
local t = {"close", "examine", "give", "open", "pick_up", "pull", "push", "talk", "use"} -- add command/condition names here (should both have same name)

-- * let's create the function which will determine what type of object is currently underneath the mouse cursor * --
function checkObjCmd()
 cmd = game:getLink(VGameCurrentObject) -- store the object underneath the cursor
 -- * --
 if not cmd:isEmpty() then
  if cmd:getId().tableId == eCharacters then cmd = cmd:getLinks(VCharacterActions) else cmd = cmd:getLinks(VObjectActions) end
  for i=1, table.maxn(cmd) do getCmdCond(i) end -- for each command listed in the table check if condition exists...
 end
end

-- * let's create the function which determines if command equals one of the stored conditions & sets condition accordingly * --
function getCmdCond(val)
 for i=1, table.maxn(t) do
  if cmd[val]:getName() == "'" .. t[i] .. "' executed" or cmd[val]:getName() == "'" .. t[i] .. "' executed (immediate)" then getObject("Conditions[" .. t[i] .. "_cond]"):setValue(VConditionValue, true) end
 end
end

-- * let's create the condition for on mouse out which checks which conditions are true & resets them back to false * --
function resetCmdCond()
 for i=1, table.maxn(t) do
  if getObject("Conditions[" .. t[i] .."_cond]"):getBool(VConditionValue) then getObject("Conditions[" .. t[i] .. "_cond]"):setValue(VConditionValue, false) end
 end
end
