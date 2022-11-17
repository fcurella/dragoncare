import "CoreLibs/object"

import "models/Food"

class('Fish').extends(Food)
function Fish:init(nutritionalValue)
    Fish.super.init(self, nutritionalValue)
    self.age = 0
    self.maxAge = math.random(3, 10)
    self.hunger = math.random(1, 5)
    self.patience = self.hunger * math.random(2, 4)
end
