import "CoreLibs/graphics"

local gfx<const> = playdate.graphics

class('Button').extends()
function Button:init(text, x, y)
    Button.super.init(self)
    self.radius = 4
    self.text = text
    self.x = x
    self.y = y
    local padding_h = 12
    local padding_v = 6
    local w, h = gfx.getTextSize(text)
    self.w = w + (padding_h * 2)
    self.h = h + (padding_v * 2)
    self.text_x = x + padding_h
    self.text_y = y + padding_v
end

function Button:draw()
    gfx.drawRoundRect(self.x, self.y, self.w, self.h, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawText(self.text, self.text_x, self.text_y)
end

function Button:hover()
    gfx.fillRoundRect(self.x, self.y, self.w, self.h, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawText(self.text, self.text_x, self.text_y)
end
