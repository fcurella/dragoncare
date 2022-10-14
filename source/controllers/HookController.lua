import "lib/components/MovingSprite"
import "lib/movements/StickTo"
import "lib/movements/BackAndForth"

import "models/Hook"

class("HookController").extends()
function HookController:init(position)
    HookController.super.init(self)
    local movement = BackAndForth(position, position:offsetBy(0, 5))
    local imagePath = "assets/bobber"
    self.sprite = MovingSprite(position.x, position.y, imagePath, movement)
    self.sprite:pause()
    self.model = Hook()
end

function HookController:isCloseTo(entity) return self.sprite:overlapsWith(entity.sprite) end

function HookController:followFish(fish)
    self.sprite.movement = StickTo(fish.sprite.movement)
end

function HookController:unfollowFish()
    self.sprite:pause()
    self.sprite.movement = BackAndForth(self.sprite.position, self.sprite.position:offsetBy(0, 5))
end
