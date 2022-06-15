import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "gameState"
import "screens/routes"

local gfx<const> = playdate.graphics

function playdate.update()
    gfx.clear()
    routes[gameState.history:last()]()
end
