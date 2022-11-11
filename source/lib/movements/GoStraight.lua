import "CoreLibs/object"
import "lib/movements/BaseMovement"
import "CoreLibs/graphics"

class("GoStraight").extends(BaseMovement)
function GoStraight:updatePosition(speed)
    if (self.position:distanceToPoint(self.target) < self.tolerance) then
        return self.position
    end

    local distance = self.normal * speed
    local x = math.floor(self.position.x + distance.dx)
    local y = math.floor(self.position.y + distance.dy)

    local point = playdate.geometry.point.new(x, y)
    return point
end
