import "CoreLibs/graphics"
import "CoreLibs/object"
import "lib/Screen"
import "components/Button"
import "components/Form"
import "gameState"

local gfx<const> = playdate.graphics

function goToPlayer() gameState.router:push("newPlayer") end
function goToPond() gameState.router:push("pond") end

class('HomeScreen').extends(Screen)
function HomeScreen:onLoad(state)
    gfx.clear()
    local buttons = {}
    for i, player in ipairs(state.players) do
        local btn
        if (player ~= false) then
            btn = Button(0, 0, "player" .. i, {}, player.name, 140, goToPond)
        else
            btn = Button(0, 0, "btnNew" .. i, {}, "Create Player", 140,
                         goToPlayer)
        end
        table.insert(buttons, btn)
    end
    table.insert(buttons, btnNew)

    local form = Form(20, 20, buttons)

    local inputHandlers = {
        AButtonDown = function() form:getElementWithFocus():click() end,

        downButtonDown = function() form:nextElement() end,
        cranked = function(change, acceleratedChange)
            -- do other stuff
        end

        -- etc.
    }
    playdate.inputHandlers.push(inputHandlers)

    form:draw()
end
function HomeScreen:onUnload() playdate.inputHandlers.pop() end
-- function HomeScreen:onUpdate() form:draw() end
