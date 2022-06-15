import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "gameState"

local gfx<const> = playdate.graphics
local keyboard<const> = playdate.keyboard
local playerName = ""

function updateText() playerName = keyboard.text end

function newPlayerScreen()
    if (not keyboard.isVisible()) then
        keyboard.textChangedCallback = updateText
        keyboard.show()
    end
    gfx.drawText(playerName, 20, 20)

end
