import "CoreLibs/object"
import "CoreLibs/graphics"

import "lib/Screen"
import "models/Fish"
import "models/Hook"

local gfx<const> = playdate.graphics

class('PondScreen').extends(Screen)
function PondScreen:onLoad(state)
    PondScreen.super.onLoad(self, state)
    gfx.clear()
    print("loaded test")
    self.fish = {Fish(50)}
    self.hook = Hook()
end

function PondScreen:onUpdate()
    self.hook:update()
    playdate.display.setInverted(false)
    for i, fish in ipairs(self.fish) do
        fish:update()
        if (self.hook:isCloseTo(fish)) then
            playdate.display.setInverted(true)
            fish:startEating()
        end
    end
end
