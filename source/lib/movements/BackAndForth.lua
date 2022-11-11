import "CoreLibs/object"
import "CoreLibs/graphics"

import "lib/movements/GoStraight"

class("BackAndForth").extends(GoStraight)

function BackAndForth:updatePosition(speed)
    if (self.position:distanceToPoint(self.target) < self.tolerance) then
        self.origin, self.target = self.target, self.origin
    end

    local distance = self.normal * speed
    local x = math.floor(self.position.x + distance.dx)
    local y = math.floor(self.position.y + distance.dy)

    local point = playdate.geometry.point.new(x, y)
    return point
end
