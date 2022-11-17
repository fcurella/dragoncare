import "CoreLibs/object"

import "lib/components/MovingSprite"
import "lib/movements/BaseMovement"
import "lib/movements/StickTo"

class("HookSprite").extends(MovingSprite)
function HookSprite:init(position)
    local movement = BaseMovement(position, position)
    local imagePath = "assets/bobber"
    HookSprite.super.init(self, position.x, position.y, imagePath, movement)
    self.states = {
        hooked = function(fish)
            playdate.display.setInverted(true)
            self.movement = StickTo(fish.sprite.sprite)
            self:resume()
        end,
        unhooked = function()
            playdate.display.setInverted(false)
            self:pause()
        end
    }
    self.state = "unhooked"
end
