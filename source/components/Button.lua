import "CoreLibs/object"
import "CoreLibs/graphics"
import "FormElement"

local gfx<const> = playdate.graphics

class('Button', {onClick = nil}).extends(FormElement)
function Button:init(x, y, name, attrs, text, onClick)
    Button.super.init(self, x, y, name, attrs)
    self.radius = 4
    self.padding_h = 12
    self.padding_v = 6
    self.text = text
    local w, h = gfx.getTextSize(text)
    self.width = w + (self.padding_h * 2)
    self.height = h + (self.padding_v * 2)
    self.onClick = onClick
end

function Button:draw()
    self.rect = playdate.geometry.rect.new(self.x, self.y, self.width,
                                           self.height)
    self.text_x = self.x + self.padding_h
    self.text_y = self.y + self.padding_v
    Button.super.draw(self)
end

function Button:drawFocus()
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawText(self.text, self.text_x, self.text_y)
end

function Button:drawBlur()
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawText(self.text, self.text_x, self.text_y)
end

function Button:click() if (self.onClick ~= nil) then self:onClick() end end
