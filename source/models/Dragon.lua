import "CoreLibs/object"
import "NamedEntity"

class('Dragon', {name = "", age = 0}).extends(NamedEntity)
function Dragon:init(name, age)
    Dragon.super.init(self, name)
    self.age = age
end

function Dragon:feed(food) self.hunger = self.hunger - food.nutritionalValue end
