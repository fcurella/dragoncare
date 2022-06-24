import "CoreLibs/graphics"
import "CoreLibs/sprites"
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
    local boundsRect = playdate.geometry.rect.new(10, 10, 390, 192)
    self.movement = CluelessWanderer(self.start, boundsRect, 40)
    local spriteImg = gfx.image.new("assets/bubbles")
    self.sprite = gfx.sprite.new(spriteImg)
    self.sprite:add()
end

function Fish:update()
    self.position = self.movement:update(5)
    self.sprite:moveTo(self.position.x, self.position.y)
end
