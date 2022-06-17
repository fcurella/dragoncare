import "CoreLibs/object"

class('Form', {items = {}}).extends()
function Form:init(items)
    Form.super.init(self)
    self.items = items
    self.tabindex = 1
end

function Form:draw()
    for i, element in ipairs(self.items) do
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

function Form:getElementByName(name)
    for i, element in ipairs(self.items) do
        if (element.name == name) then return element end
    end
end
