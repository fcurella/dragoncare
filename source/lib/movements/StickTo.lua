import "CoreLibs/object"
import "lib/movements/BaseMovement"
import "CoreLibs/graphics"

class("StickTo").extends(BaseMovement)
function StickTo:init(otherMovement)
    self.otherMovement = otherMovement
    StickTo.super.init(self, otherMovement.origin, otherMovement.target)
end

function StickTo:updateLocation(speed)
    self:setPosition(self.otherMovement.position)
    return point
end
