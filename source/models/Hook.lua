import "CoreLibs/object"

class('Hook').extends()
function Hook:init()
    Hook.super.init(self)
    self.lurePower = 10
    self.taken = false
end
