import "CoreLibs/object"

local geom<const> = playdate.geometry

class("BaseMovement").extends()
function BaseMovement:init(origin, target)
    BaseMovement.super.init(self, origin, target)
    self.origin = origin
    self.target = target
    self.speed = speed
    self.tolerance = 4
    self.v = self.target - self.origin
    self.normal = self.v:normalized()
    self.running = true
end

function BaseMovement:setTarget(point)
    self.target = point
    self.v = self.target - self.origin
    self.normal = self.v:normalized()
end

function BaseMovement:setOrigin(point)
    self.origin = point
    self.v = self.target - self.origin
    self.normal = self.v:normalized()
end

function BaseMovement:pause()
    self.running = false
end

function BaseMovement:resume()
    self.running = true
end

function BaseMovement:update(speed)
    if (self.running) then
        self:updateLocation(speed)
    end
    return self.origin
end

function BaseMovement:updateLocation(speed) end
