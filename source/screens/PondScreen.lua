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
    self.fish = {FishController(50), FishController(50)}
    local center = playdate.geometry.point.new(200, 100)
    self.hook = HookController(center)
end

function PondScreen:onUpdate()

    if (#self.fish == 0) then
        self.hook.sprite:pause()
    else
        self.hook.sprite:update(15)
    end

    for i, fish in ipairs(self.fish) do
        fish.sprite:update(15)
        if (self.hook:isCloseTo(fish)) then
            if (self.hook.sprite.state == "unhooked" and fish.sprite.state ==
                "swimming") then
                print("close!")
                self:startEating(fish)
            end
        end
    end
end

function PondScreen:startEating(fish)
    fish.sprite:setState("nibbling")
    self.hook.sprite:setState("hooked", fish)
    playdate.timer.new(fish.model.hunger * 1000,
                       function(ctrl, _fish) ctrl:finishEating(_fish) end, self,
                       fish)
    playdate.timer.new(fish.model.patience * 1000,
                       function(ctrl, _fish) ctrl:unhook(_fish) end, self, fish)
end

function PondScreen:finishEating(fish) fish.sprite:setState("swimming") end

function PondScreen:unhook(fish) self.hook.sprite:setState("unhooked") end
