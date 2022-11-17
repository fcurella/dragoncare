import "CoreLibs/graphics"

local gfx<const> = playdate.graphics

class('BaseComponent').extends()
function BaseComponent:init(x, y)
    BaseComponent.super.init(self)
    self.x = x
    self.y = y
    self.states = {default = function(this) end}
    self.position = playdate.geometry.point.new(x, y)
end

function BaseComponent:setState(state, ...)
    print(state)
    self.state = state
    self.states[state](...)
end
