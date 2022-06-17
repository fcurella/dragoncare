import "CoreLibs/object"
import "BaseComponent"

class('Form', {items = {}, orientation = "vertical"}).extends(BaseComponent)
function Form:init(x, y, items, orientation)
    Form.super.init(self, x, y)
    self.items = items
    self.tabindex = 1
    self.padding = 5
    self.orientation = orientation
end

function Form:draw()
    for i, element in ipairs(self.items) do
        local xItem = self.x
        local yItem
        if (self.orientation == "vertical") then
            if (i == 1) then
                yItem = self.y
            else
                local previousRect = self.items[i - 1].rect
                yItem = previousRect.y + previousRect.height + self.padding
            end
        end
        element.x = xItem
        element.y = yItem
        element:draw()
        coroutine.yield()
    end
end

function Form:focus(name)
    for i, element in ipairs(self.items) do
        if (element.name == name) then
            element:focus()
        else
            element:blur()
        end
        element:draw()
    end
end

function Form:nextElement()
    self.tabindex = self.tabindex + 1
    if (self.tabindex > #self.items) then self.tabindex = 1 end
    for i, element in ipairs(self.items) do
        if (i == self.tabindex) then
            element:focus()
        else
            element:blur()
        end
        element:draw()
    end
end

function Form:getElementWithFocus() return self.items[self.tabindex] end

function Form:getElementByName(name)
    for i, element in ipairs(self.items) do
        if (element.name == name) then return element end
    end
end
