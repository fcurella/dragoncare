import "CoreLibs/graphics"
import "lib/movements/GoStraight"
import "lib/movements/CluelessWanderer"
import "Food"

local gfx<const> = playdate.graphics

class('Fish').extends(Food)
function Fish:init(nutritionalValue)
    Food.super.init(self, nutritionalValue)
    self.age = 0
    self.maxAge = math.random(3, 10)
    local x = math.random(10, 390)
    local y = math.random(10, 190)
    self.start = playdate.geometry.point.new(x, y)

    self.target = playdate.geometry.point.new(200, 100)
    local boundsRect = playdate.geometry.rect.new(10, 10, 390, 192)
    self.movement = CluelessWanderer(self.start, boundsRect)
    --gfx.drawLine(self.start.x, self.start.y, self.start.x + self.movement.v.dx,
    --             self.start.y + self.movement.v.dy)

end

function Fish:draw()
    local position = self.movement:update(10)
    gfx.drawText("X", position.x, position.y)
    --gfx.drawText("O", self.target.x, self.target.y)
end
