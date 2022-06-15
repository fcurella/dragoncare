import "CoreLibs/object"
import "NamedEntity"
import "Dragon"

class('Egg').extends(NamedEntity)
function Egg:hatch() return Dragon(self.name) end
