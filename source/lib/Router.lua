import "CoreLibs/object"
import "lib/Stack"

class("Router").extends()
function Router:init(routes, initial)
    Router.super.init(self)
    self.routes = routes
    self.history = Stack({initial})
end
function Router:current() return self.routes[self.history:last()] end
function Router:push(route)
    self:current():unload()
    self.history:push(route)
end
function Router:pop()
    local last = self.history:pop(route)
    last:unload()
    return self.routes[last]
end
