import "CoreLibs/object"
import "NamedEntity"

class('Dragon').extends(NamedEntity)
function Dragon:feed(food) self.hunger = self.hunger - food.nutritionalValue end
