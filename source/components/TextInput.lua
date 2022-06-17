import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/keyboard"
import "FormElement"

local gfx<const> = playdate.graphics
local keyboard<const> = playdate.keyboard

class('TextInput', {onClick = nil}).extends(FormElement)
function TextInput:init(x, y, name, attrs)
    TextInput.super.init(self, x, y, name, attrs)
    self.radius = 4
    self.padding_h = 12
    self.padding_v = 6
    local w, h = gfx.getTextSize("MMMMMMMMM")
    self.width = w + (self.padding_h * 2)
    self.height = h + (self.padding_v * 2)
    self.value = ""
end

function TextInput:draw()
    self.rect = playdate.geometry.rect.new(self.x, self.y, self.width,
                                           self.height)
    self.text_x = self.x + self.padding_h
    self.text_y = self.y + self.padding_v
    TextInput.super.draw(self)
end

function TextInput:drawText() gfx.drawText(self.value, self.text_x, self.text_y) end

function TextInput:drawFocus()
    gfx.setColor(gfx.kColorBlack)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
    self:drawText()
end

function TextInput:drawBlur()
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRoundRect(self.rect, self.radius)
    gfx.setColor(gfx.kColorBlack)
    gfx.drawRoundRect(self.rect, self.radius)
    gfx.setImageDrawMode(gfx.kDrawModeFillBlack)
    self:drawText()
end

function TextInput:onTextChangedCallback()
    if (self.attrs.selected) then
        self.value = keyboard.text
        self:drawText()
    end
end

function TextInput:onFocus()
    keyboard.textChangedCallback = function() self:onTextChangedCallback() end
    keyboard.show()
end

function TextInput:onBlur()
    keyboard.textChangedCallback = nil
    keyboard.hide()
end
