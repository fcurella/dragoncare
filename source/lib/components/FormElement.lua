import "CoreLibs/object"
import "BaseComponent"

class('FormElement').extends(BaseComponent)
function FormElement:init(x, y, name, attrs)
    FormElement.super.init(self, x, y)
    self.name = name
    self.attrs = attrs
end

function FormElement:draw()
    if (self.attrs.selected == true) then
        self:drawFocus()
    else
        self:drawBlur()
    end
end

function FormElement:focus()
    self.attrs.selected = true
    self:onFocus()
end

function FormElement:blur()
    self.attrs.selected = false
    self:onBlur()
end

function FormElement:drawFocus() end

function FormElement:drawBlur() end

function FormElement:onFocus() end
function FormElement:onBlur() end
