import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "CoreLibs/object"
import "lib/Screen"
import "gameState"

local gfx<const> = playdate.graphics
local keyboard<const> = playdate.keyboard
local playerName = ""

local function updateText()
    playerName = keyboard.text
    gfx.drawText(playerName, 20, 20)
end
local function setName()
    gameState.player.name = playerName
    gameState.router:push("home")
end

class('NewPlayerScreen').extends(Screen)
function NewPlayerScreen:onLoad()
    gfx.clear()
    keyboard.textChangedCallback = updateText
    keyboard.keyboardDidHideCallback = setName
    keyboard.show()
end
