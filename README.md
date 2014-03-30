Global Command Checker for Visionaire Studio: Adventure Game Engine [Lua] - more info [here](http://wiki.visionaire-tracker.net/wiki/Global_Command_Checker_%28CMS%29 "global command checker wiki article")

This script allows you to check which commands can be executed on each object, item, or character. This script was made with the coin command interface in mind. 

**Instructions**

*1*. Add the main script to the Visionaire Studio Script Editor & set the script as a definition script.

*2*. Replace the strings inside of the **t** table with the name of your commands; the order is not important, but the names are case sensitive.
```
local t = {"close", "examine", "give", "open", "pick_up", "pull", "push", "talk", "use"}
```
*3a*. Inside of the condition tab of your your command interface, create a condition for each command you have created; the names should reflect the names given to the *interface buttons* & those of the **t** table.

*3b*. Add "**_cond**" prefix to the end of each of the conditions you just created; like so...
```
use_cond
talk_cond
etc...
```
*4*. On mouse over for each object, item ,& character, create an *execute a script* action containing...
```
checkObjCmd()
```
*5*. On mouse out for each object, character & item, create an execute a script action containing...
```
resetCmdCond()
```
