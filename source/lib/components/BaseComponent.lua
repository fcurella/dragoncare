import "CoreLibs/graphics"

local gfx<const> = playdate.graphics

class('BaseComponent').extends()
function BaseComponent:init(x, y)
    BaseComponent.super.init(self)
    self.x = x
    self.y = y
    self.position = playdate.geometry.point.new(x, y)
end
