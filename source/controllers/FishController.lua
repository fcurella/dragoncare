import "lib/components/MovingSprite"
import "lib/movements/CluelessWanderer"
import "models/Fish"

class('FishController').extends()
function FishController:init(nutritionalValue)
    FishController.super.init(self)

    local x = math.random(10, 390)
    local y = math.random(10, 190)
    local position = playdate.geometry.point.new(x, y)

    local boundsRect = playdate.geometry.rect.new(10, 10, 390, 192)
    local movement = CluelessWanderer(position, boundsRect, 40)
    local imagePath = "assets/bubbles"
    self.sprite = MovingSprite(position.x, position.y, imagePath, movement)

    self.model = Fish(nutritionalValue)
end

function FishController:remove()
    self.sprite:remove()
end
