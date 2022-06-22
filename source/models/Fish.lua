import "CoreLibs/graphics"
import "lib/movements/GoStraight"
import "Food"

local gfx<const> = playdate.graphics

class('Fish').extends(Food)
function Fish:init(nutritionalValue)
    Food.super.init(self, nutritionalValue)
    self.age = 0
    self.maxAge = math.random(3, 10)
    local x = math.random(3, 10)
    local y = math.random(3, 10)
    self.start = playdate.geometry.point.new(x, y)

    self.target = playdate.geometry.point.new(200, 200)
    self.movement = GoStraight(self.start, self.target)
    gfx.drawLine(self.start.x, self.start.y, self.start.x + self.movement.v.dx,
                 self.start.y + self.movement.v.dy)
end

function Fish:draw()
    local position = self.movement:update(10)
    gfx.drawText("X", position.x, position.y)
    gfx.drawText("O", self.target.x, self.target.y)
end
