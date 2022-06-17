import "CoreLibs/graphics"
import "CoreLibs/object"
import "lib/Screen"
import "gameState"
import "components/Button"
import "components/Form"

local gfx<const> = playdate.graphics

local function goToPlayer() gameState.router:push("newPlayer") end

local btn1 = Button(20, 20, "btn1", {selected = true}, "Create Player",
                    goToPlayer)
local btn2 = Button(20, 55, "btn2", {}, "Create Player")
local form = Form({btn1, btn2})

local inputHandlers = {
    AButtonDown = function() btn1:click() end,

    downButtonDown = function() form:nextElement() end,
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
function HomeScreen:onUpdate() form:draw() end
