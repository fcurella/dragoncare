import "CoreLibs/object"

class('Stack', {items = {}}).extends()

function Stack:init(items)
    Stack.super.init(self)
    self.items = items
end
function Stack:push(item) table.insert(self.items, item) end
function Stack:pop() return table.remove(self.items) end
function Stack:last() return self.items[#self.items] end
