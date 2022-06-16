import "CoreLibs/object"

class('Screen').extends()
function Screen:init()
    Screen.super.init(self)
    self.loaded = false
end

-- override these methods
function Screen:onUnload() end
function Screen:update() end
function Screen:onLoad() end
function Screen:onUpdate() end

function Screen:loadScreen()
    self.loaded = true
    self:onLoad()
end
function Screen:unload()
    self.loaded = false
    self:onUnload()
end
function Screen:update()
    if (not self.loaded) then self:loadScreen() end
    self:onUpdate()
end
