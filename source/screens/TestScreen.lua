import "CoreLibs/object"
import "lib/Screen"

class('TestScreen').extends(Screen)
function TestScreen:onLoad(state)
    TestScreen.super.onLoad(self, state)
    print("loaded test")
end
