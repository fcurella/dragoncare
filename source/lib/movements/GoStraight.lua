import "CoreLibs/object"
import "lib/movements/BaseMovement"
import "CoreLibs/graphics"

class("GoStraight").extends(BaseMovement)
function BaseMovement:preCompute(speed) end

function GoStraight:update(speed)
    local distance = self.normal * speed
    local x = self.origin.x + distance.dx
    local y = self.origin.y + distance.dy

    local point = playdate.geometry.point.new(x, y)
    self:setOrigin(point)
    return point
end
