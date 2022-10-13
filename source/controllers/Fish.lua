import "lib/components/MovingSprite"
import "lib/movements/CluelessWanderer"
import "models/Food"

class('Fish').extends()
function Fish:init(nutritionalValue)
    Food.super.init(self)

    local x = math.random(10, 390)
    local y = math.random(10, 190)
    local position = playdate.geometry.point.new(x, y)

    local boundsRect = playdate.geometry.rect.new(10, 10, 390, 192)
    local movement = CluelessWanderer(position, boundsRect, 40)
    local imagePath = "assets/bubbles"
    self.sprite = MovingSprite(position.x, position.y, imagePath, movement)

    self.food = Food(nutritionalValue)

    self.age = 0
    self.maxAge = math.random(3, 10)
    self.hunger = math.random(3, 10)
end

function Fish:startEating()
    self.sprite:pause()
    playdate.timer.new(self.hunger * 1000,
                       function(fish) fish:finishEating() end, self)
end

function Fish:finishEating() self.sprite:resume() end
