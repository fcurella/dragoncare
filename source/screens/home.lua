import "CoreLibs/graphics"
import "gameState"

local gfx<const> = playdate.graphics

local inputHandlers = {

    AButtonDown = function()
        playdate.inputHandlers.pop()
        gameState.history:push("newPlayer")
    end,

    cranked = function(change, acceleratedChange)
        -- do other stuff
    end

    -- etc.
}

function homeScreen()
    playdate.inputHandlers.push(inputHandlers)
    gfx.drawText("hello world", 20, 20)
end
