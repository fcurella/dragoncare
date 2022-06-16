import "lib/Screen"

class('TestScreen').extends(Screen)
function TestScreen:onLoad()
    TestScreen.super.onLoad()
    print("loaded test")
end
