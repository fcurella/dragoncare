import "CoreLibs/object"

class('FormElement').extends()
function FormElement:init(x, y, name, attrs)
    FormElement.super.init(self)
    self.name = name
    self.x = x
    self.y = y
    self.attrs = attrs
end

function FormElement:draw()
    if (self.attrs.selected == true) then
        self:drawFocus()
    else
        self:drawBlur()
    end
end

function FormElement:focus() self.attrs.selected = true end

function FormElement:blur() self.attrs.selected = false end

function FormElement:drawFocus() end

function FormElement:drawBlur() end
