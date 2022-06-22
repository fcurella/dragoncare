import "CoreLibs/object"
import "lib/movements/GoStraight"
import "CoreLibs/graphics"

class("CluelessWanderer").extends(GoStraight)
function CluelessWanderer:init(origin, boundsRect, updateRate)
    self.boundsRect = boundsRect
    if (updateRate == nil) then
        updateRate = 10
    end
    local target = self:newTarget()
    CluelessWanderer.super.init(self, origin, target)
    self.timer = playdate.timer.keyRepeatTimerWithDelay(updateRate, updateRate, function(movement)
        movement:updateTarget()
    end, self)
end

function CluelessWanderer:newTarget()
    local x = math.random(self.boundsRect.x, self.boundsRect.x + self.boundsRect.width)
    local y = math.random(self.boundsRect.y, self.boundsRect.y + self.boundsRect.height)
    local target = playdate.geometry.point.new(x, y)
    return target
end

function CluelessWanderer:updateTarget()
    local target = self:newTarget()
    self:setTarget(target)
end
