import "CoreLibs/object"
import "lib/movements/BaseMovement"
import "CoreLibs/graphics"

class("GoStraight").extends(BaseMovement)
function GoStraight:update(speed)
    if (self.origin:distanceToPoint(self.target) < self.tolerance) then
        return self.origin
    end

    local distance = self.normal * speed
    local x = math.floor(self.origin.x + distance.dx)
    local y = math.floor(self.origin.y + distance.dy)

    local point = playdate.geometry.point.new(x, y)
    self:setOrigin(point)
    return point
end
