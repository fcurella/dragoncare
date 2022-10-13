import "lib/components/MovingSprite"
import "lib/movements/BackAndForth"

class("Hook").extends()
function Hook:init(position)
    Hook.super.init(self)
    local movement = BackAndForth(position, position:offsetBy(0, 5))
    local imagePath = "assets/bobber"
    self.sprite = MovingSprite(position.x, position.y, imagePath, movement)
    self.sprite:pause()
    self.lurePower = 10
end

function Hook:isCloseTo(entity)
    return (self.sprite.position:distanceToPoint(entity.sprite.position) <
               self.lurePower)
end
