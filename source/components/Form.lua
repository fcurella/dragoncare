import "CoreLibs/object"
import "CoreLibs/ui"
import "BaseComponent"


class('Form', {items = {}, orientation = "vertical"}).extends(BaseComponent)
function Form:init(x, y, items, orientation)
    Form.super.init(self, x, y)
    self.items = items
    self.tabindex = 1
    self.padding = 5
    self.orientation = orientation

    self.listview = playdate.ui.gridview.new(0, 10)
    self.listview:setNumberOfRows(#self.items)
    self.listview:setCellPadding(0, 0, 5, 0)
    self.listview:setCellSize(0, 30)
    function self.listview:drawCell(section, row, column, selected, x, y, width, height)
        local element = items[row]
        element.x = x
        element.y = y
        element.width = width
        element.height = height
        element.attrs.selected = selected
        element:draw()
    end
end

function Form:draw()
    self.listview:drawInRect(self.x, self.y, 160, 210)
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
