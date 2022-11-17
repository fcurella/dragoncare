import "CoreLibs/object"

import "models/Fish"
import "sprites/FishSprite"

class('FishController').extends()
function FishController:init(nutritionalValue)
    FishController.super.init(self)

    self.sprite = FishSprite()
    self.model = Fish(nutritionalValue)
end

function FishController:remove() self.sprite:remove() end
