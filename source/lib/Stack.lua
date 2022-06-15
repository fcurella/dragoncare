import "CoreLibs/object"

class('Stack', {items = {}, limit = 999}).extends()

function Stack:init(items, limit)
    Stack.super.init(self)
    self.items = items
    self.limit = limit
end
function Stack:push(item)
    table.insert(self.items, item)
    if (#self.items > self.limit) then table.remove(self.items, 1) end
end
function Stack:pop() return table.remove(self.items) end
function Stack:last() return self.items[#self.items] end
