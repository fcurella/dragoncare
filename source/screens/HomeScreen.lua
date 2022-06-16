import "CoreLibs/graphics"
import "CoreLibs/object"
import "lib/Screen"
import "gameState"
import "components/Button"

local gfx<const> = playdate.graphics

local function goToPlayer() gameState.history:push("newPlayer") end

local btn1 = Button("Create Player", 20, 20, true, goToPlayer)
local btn2 = Button("Create Player", 20, 55)

local inputHandlers = {
    AButtonDown = function() playdate.inputHandlers.pop() end,

    downButtonDown = function()
        btn1.selected = false
        btn2.selected = true
        print("down")
    end,
    cranked = function(change, acceleratedChange)
        -- do other stuff
    end

    -- etc.
}
class('HomeScreen').extends(Screen)
function HomeScreen:onLoad()
    gfx.clear()
    playdate.inputHandlers.push(inputHandlers)
end
function HomeScreen:onUnload() playdate.inputHandlers.pop() end
function HomeScreen:onUpdate()
    btn1:draw()
    btn2:draw()
end
