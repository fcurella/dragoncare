import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "models/InventoryItem"

local gfx<const> = playdate.graphics


class("Hook").extends(InventoryItem)
function Hook:init()
    Hook.super.init(self)
    self.lurePower = 10
    self.position = playdate.geometry.point.new(200, 100)
    local spriteImg = gfx.image.new("assets/bobber")
    self.sprite = gfx.sprite.new(spriteImg)
    self.bobbing = false
    self.sprite:add()
end

function Hook:update()
    self.sprite:moveTo(self.position.x, self.position.y)
end

function Hook:isCloseTo(entity)
    return (self.position:distanceToPoint(entity.position) < self.lurePower)
end
