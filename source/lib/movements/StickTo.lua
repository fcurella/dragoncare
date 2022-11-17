import "CoreLibs/object"
import "lib/movements/BaseMovement"
import "CoreLibs/graphics"

class("StickTo").extends(BaseMovement)
function StickTo:init(otherSprite)
    local position = playdate.geometry.point.new(otherSprite.x, otherSprite.y)
    StickTo.super.init(self, position, position)
    self.otherSprite = otherSprite
end

function StickTo:updatePosition(speed)
    local position = playdate.geometry.point.new(self.otherSprite.x,
                                                 self.otherSprite.y)
    return position
end
