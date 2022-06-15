import "CoreLibs/graphics"
import "gameState"
import "components/Button"

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
    local btn = Button("Create Player", 20, 20)
    btn:draw()
end
