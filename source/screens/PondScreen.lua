import "CoreLibs/object"
import "CoreLibs/graphics"

import "lib/Screen"
import "controllers/Fish"
import "controllers/Hook"

local gfx<const> = playdate.graphics

class('PondScreen').extends(Screen)
function PondScreen:onLoad(state)
    PondScreen.super.onLoad(self, state)
    gfx.clear()
    print("loaded test")
    self.fish = {Fish(50)}
    local center = playdate.geometry.point.new(200, 100)
    self.hook = Hook(center)
end

function PondScreen:onUpdate()
    self.hook.sprite:update(5)
    playdate.display.setInverted(false)
    for i, fish in ipairs(self.fish) do
        fish.sprite:update(15)
        if (self.hook:isCloseTo(fish)) then
            fish:startEating()
            playdate.display.setInverted(true)
            self.hook.sprite:resume()
        else
            self.hook.sprite:pause()
        end
    end
end
