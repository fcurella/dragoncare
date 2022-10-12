import "CoreLibs/object"

local geom<const> = playdate.geometry

class("BaseMovement").extends()
function BaseMovement:init(origin, target)
    BaseMovement.super.init(self, origin, target)
    self.origin = origin
    self.position = origin
    self.target = target
    self.tolerance = 4
    self.v = self.target - self.origin
    self.normal = self.v:normalized()
    self.running = true
end

function BaseMovement:setTarget(point)
    self.target = point
    self.v = self.target - self.position
    self.normal = self.v:normalized()
end

function BaseMovement:setPosition(point)
    self.position = point
    self.v = self.target - self.position
    self.normal = self.v:normalized()
end

function BaseMovement:pause() self.running = false end

function BaseMovement:resume() self.running = true end

function BaseMovement:update(speed)
    if (self.running) then self:updateLocation(speed) end
    return self.position
end

function BaseMovement:updateLocation(speed) end
