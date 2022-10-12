import "CoreLibs/object"
import "lib/movements/GoStraight"
import "CoreLibs/graphics"

class("CluelessWanderer").extends(GoStraight)
function CluelessWanderer:init(origin, boundsRect, minDistance, updateRate)
    self.boundsRect = boundsRect
    if (updateRate == nil) then
        updateRate = 1000
    end
    self.minDistance = minDistance
    CluelessWanderer.super.init(self, origin, origin)
    self.timer = playdate.timer.keyRepeatTimerWithDelay(updateRate, updateRate, function(movement)
        movement:updateTarget()
    end, self)
end

function CluelessWanderer:newTarget()
    local target = self.position:copy()
    while (self.position:distanceToPoint(target) < self.minDistance) do
        local x = math.floor(math.random(self.boundsRect.x, self.boundsRect.x + self.boundsRect.width))
        local y = math.floor(math.random(self.boundsRect.y, self.boundsRect.y + self.boundsRect.height))
        target = playdate.geometry.point.new(x, y)
    end
    return target
end

function CluelessWanderer:updateTarget()
    local target = self:newTarget()
    self:setTarget(target)
end
