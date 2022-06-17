import "CoreLibs/object"

class('Screen').extends()
function Screen:init()
    Screen.super.init(self)
    self.loaded = false
end

-- override these methods
function Screen:onUnload() end
function Screen:onLoad(state) end
function Screen:onUpdate(state) end

function Screen:loadScreen(state)
    self.loaded = true
    self:onLoad(state)
end
function Screen:unload()
    self.loaded = false
    self:onUnload()
end
function Screen:update(state)
    if (not self.loaded) then self:loadScreen(state) end
    self:onUpdate(state)
end
