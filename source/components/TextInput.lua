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
    local padding_h = 12
    local padding_v = 6
    local w, h = gfx.getTextSize("MMMMMMMMM")
    self.width = w + (padding_h * 2)
    self.height = h + (padding_v * 2)
    self.text_x = x + padding_h
    self.text_y = y + padding_v
    self.rect = playdate.geometry.rect.new(self.x, self.y, self.width,
                                           self.height)
    self.value = ""
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
