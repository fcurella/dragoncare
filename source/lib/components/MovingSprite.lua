import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

import "BaseComponent"

local gfx<const> = playdate.graphics

class("MovingSprite").extends(BaseComponent)
function MovingSprite:init(x, y, imagePath, movement)
    MovingSprite.super.init(self, x, y)
    local spriteImg = gfx.image.new(imagePath)
    self.sprite = gfx.sprite.new(spriteImg)
    self.sprite:setCollideRect(0, 0, spriteImg.width, spriteImg.height)
    self.sprite:add()
    self.movement = movement
    self.start = playdate.geometry.point.new(x, y)
    self.position = self.start
end

function MovingSprite:update(speed)
    self.position = self.movement:update(speed)
    self.sprite:moveTo(self.position.x, self.position.y)
end

function MovingSprite:pause() self.movement:pause() end

function MovingSprite:resume() self.movement:resume() end
