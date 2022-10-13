import "CoreLibs/object"
import "CoreLibs/graphics"
import "FormElement"

local gfx<const> = playdate.graphics

class('Button', {onClick = nil}).extends(FormElement)
function Button:init(x, y, name, attrs, text, width, onClick)
    Button.super.init(self, x, y, name, attrs)
    self.radius = 4
    self.padding_h = 12
    self.padding_v = 6
    self.text = text
    local _, h = gfx.getTextSize(text)
    self.width = width
    self.height = h + (self.padding_v * 2)
    self.onClick = onClick
end

function Button:draw()
    self.rect = playdate.geometry.rect.new(self.x, self.y, self.width,
                                           self.height)

    self.text_rect = playdate.geometry.rect.new(self.x + self.padding_h,
                                                self.y + self.padding_v,
                                                self.width -
                                                    (self.padding_h * 2),
                                                self.height)

    self.text_x = self.x + self.padding_h
    self.text_y = self.y + self.padding_v
    Button.super.draw(self)
end

function Button:drawFocus()
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawTextInRect(self.text, self.text_rect, nil, "…",
                       kTextAlignment.center)
end

function Button:drawBlur()
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawTextInRect(self.text, self.text_rect, nil, "…",
                       kTextAlignment.center)
end

function Button:click() if (self.onClick ~= nil) then self:onClick() end end
