import "CoreLibs/object"
import "CoreLibs/graphics"

local gfx<const> = playdate.graphics

class('Button', {selected = false, onClick = nil}).extends()
function Button:init(text, x, y, selected)
    Button.super.init(self)
    self.radius = 4
    self.text = text
    self.x = x
    self.y = y
    local padding_h = 12
    local padding_v = 6
    local w, h = gfx.getTextSize(text)
    self.width = w + (padding_h * 2)
    self.height = h + (padding_v * 2)
    self.text_x = x + padding_h
    self.text_y = y + padding_v
    self.rect = playdate.geometry.rect.new(self.x, self.y, self.width,
                                           self.height)
    self.selected = selected
    self.onClick = onClick
end

function Button:draw()
    if (self.selected == true) then
        self:focus()
    else
        self:blur()
    end
end

function Button:focus()
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    gfx.drawText(self.text, self.text_x, self.text_y)
end

function Button:blur()
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    gfx.drawText(self.text, self.text_x, self.text_y)
end

function Button:click() if (self.onClick ~= nil) then self:onClick() end end
