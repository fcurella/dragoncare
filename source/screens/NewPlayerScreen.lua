import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "CoreLibs/object"
import "lib/Screen"
import "gameState"

local gfx<const> = playdate.graphics
local keyboard<const> = playdate.keyboard
local playerName = ""

class('NewPlayerScreen').extends(Screen)
function NewPlayerScreen:onLoad() gfx.clear() end

function updateText() playerName = keyboard.text end
function setName(pressedOk)
    if (pressedOk == true) then
        gameState.player.name = playerName
        gameState.router:push("home")
    end
end

function NewPlayerScreen:onUpdate()
    if (not keyboard.isVisible()) then
        keyboard.textChangedCallback = updateText
        keyboard.keyboardWillHideCallback = setName
        keyboard.show()
    end
    gfx.drawText(playerName, 20, 20)
end
