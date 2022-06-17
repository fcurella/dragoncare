import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "CoreLibs/object"
import "lib/Screen"
import "components/Form"
import "components/TextInput"
import "gameState"

local gfx<const> = playdate.graphics
local keyboard<const> = playdate.keyboard

local textInput = TextInput(20, 20, "playerName", {selected = true})

local function setName()
    gameState.player.name = textInput.value
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
