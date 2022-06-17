import "CoreLibs/graphics"
import "CoreLibs/object"
import "lib/Screen"
import "components/Button"
import "components/Form"
import "gameState"

local gfx<const> = playdate.graphics

function goToPlayer() gameState.router:push("newPlayer") end

class('HomeScreen').extends(Screen)
function HomeScreen:onLoad(state)
    gfx.clear()
    print(state)

    local btnNew = Button(0, 0, "btnNew", {selected = true}, "Create Player",
                          goToPlayer)

    local buttons = {}
    for i, player in ipairs(state.players) do
        print("player" .. i, player.name)
        local btn = Button(0, 0, "player" .. i, {}, player.name)
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
