-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Wendi Yu
-- Created on: May 2018
-- 
-- This file animates a charact using a spritesheet
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
 
centerX = display.contentWidth * .5
centerY = display.contentHeight * .5

local sheetOptionsIdle1 =
{
    width = 232,
    height = 439,
    numFrames = 10
}
local sheetIdleNinja = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyIdle.png", sheetOptionsIdle1 )

local sheetOptionsIdle2 =
{
    width = 567,
    height = 556,
    numFrames = 10
}
local sheetIdleRobot = graphics.newImageSheet( "./assets/spritesheets/robotIdle.png", sheetOptionsIdle2 )

local sheetOptionsAttact =
{
    width = 536,
    height = 495,
    numFrames = 10
}
local sheetAttactNinja = graphics.newImageSheet( "./assets/spritesheets/ninjaBoyAttack.png", sheetOptionsAttact )

-- sequences table
local sequence_data = {
    -- consecutive frames sequence
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleNinja
    },
    {
        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleRobot
    },
    {
        name = "attack",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetAttactNinja
    }    
}

local Ninja = display.newSprite( sheetIdleNinja, sequence_data )
Ninja.x = centerX
Ninja.y = centerY

Ninja:play()

local Robot = display.newSprite( sheetIdleRobot, sequence_data )
Robot.x = centerX + 600
Robot.y = centerY

Robot:play()

-- After a short time, swap the sequence to 'seq2' which uses the second image sheet
local function swapSheet()
    Ninja:setSequence( "attack" )
    Ninja:play()
    print("attack")
end

timer.performWithDelay( 2000, swapSheet )