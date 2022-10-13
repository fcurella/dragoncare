import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "CoreLibs/object"
import "lib/Screen"
import "models/Hero"
import "lib/components/Form"
import "lib/components/TextInput"
import "gameState"

local gfx<const> = playdate.graphics
local keyboard<const> = playdate.keyboard

local textInput = TextInput(20, 20, "playerName", {selected = true})

local function setName()
    local player = Hero(textInput.value)
    table.insert(gameState.players, player)
    gameState.currentPlayer = player

    gameState.router:push("home")
end

class('NewPlayerScreen').extends(Screen)
function NewPlayerScreen:onLoad()
    gfx.clear()
    keyboard.keyboardDidHideCallback = setName
    textInput:focus()
end

function NewPlayerScreen:onUnload() keyboard.keyboardDidHideCallback = nil end

function NewPlayerScreen:onUpdate() textInput:draw() end
