import "CoreLibs/object"
import "CoreLibs/graphics"

import "lib/Screen"
import "models/Fish"
local gfx<const> = playdate.graphics

class('PondScreen').extends(Screen)
function PondScreen:onLoad(state)
    PondScreen.super.onLoad(self, state)
    gfx.clear()
    print("loaded test")
    self.fish = {Fish(50)}
end

function PondScreen:onUpdate()
    for i, fish in ipairs(self.fish) do fish:draw() end
end
