import "lib/movements/StickTo"

import "sprites/HookSprite"
import "models/Hook"

class("HookController").extends()
function HookController:init(position)
    HookController.super.init(self)
    self.sprite = HookSprite(position)
    self.sprite:pause()
    self.model = Hook()
end

function HookController:isCloseTo(entity)
    return self.sprite:overlapsWith(entity.sprite)
end

