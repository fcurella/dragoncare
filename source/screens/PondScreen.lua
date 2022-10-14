import "CoreLibs/object"
import "CoreLibs/graphics"

import "lib/Screen"
import "controllers/FishController"
import "controllers/HookController"

local gfx<const> = playdate.graphics

class('PondScreen').extends(Screen)
function PondScreen:onLoad(state)
    PondScreen.super.onLoad(self, state)
    gfx.clear()
    self.fish = {FishController(50)}
    local center = playdate.geometry.point.new(200, 100)
    self.hook = HookController(center)
end

function PondScreen:onUpdate()
    self.hook.sprite:update(5)
    playdate.display.setInverted(false)
    for i, fish in ipairs(self.fish) do
        fish.sprite:update(15)
        if (self.hook:isCloseTo(fish)) then
            print("close!")
            self:startEating(fish)
            playdate.display.setInverted(true)
            self.hook.sprite:resume()
        else
            self.hook.sprite:pause()
        end
    end
end


function PondScreen:startEating(fish)
    fish.sprite:pause()
    playdate.timer.new(fish.model.hunger * 1000,
                       function(ctrl, _fish) ctrl:finishEating(_fish) end, self, fish)
    playdate.timer.new(fish.model.patience * 1000,
                       function(ctrl, _fish) ctrl:unhook(_fish) end, self, fish)
end

function PondScreen:finishEating(fish)
    fish.sprite:resume()
    self.hook:followFish(fish)
end

function PondScreen:unhook(fish)
    fish:remove()
    self.fish = {}
    self.hook:unfollowFish()
end
