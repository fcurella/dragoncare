import "CoreLibs/object"

import "lib/components/MovingSprite"
import "lib/movements/CluelessWanderer"
import "lib/movements/BackAndForth"

class('FishSprite').extends(MovingSprite)
function FishSprite:init()
    local x = math.random(10, 390)
    local y = math.random(10, 190)
    local position = playdate.geometry.point.new(x, y)

    local boundsRect = playdate.geometry.rect.new(10, 10, 390, 192)
    local movement = CluelessWanderer(position, boundsRect, 40)
    local imagePath = "assets/bubbles"
    FishSprite.super.init(self, position.x, position.y, imagePath, movement)
    self.states = {
        nibbling = function() self:pause() end,
        swimming = function()
            self.movement = CluelessWanderer(position, boundsRect, 40)
            self:resume()
        end
    }
    self.state = "swimming"
end
