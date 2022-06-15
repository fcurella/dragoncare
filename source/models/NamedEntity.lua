import "CoreLibs/object"

class('NamedEntity', {name = '', hunger = 0}).extends()

function NamedEntity:init(name, hunger)
    NamedEntity.super.init(self)
    self.name = name
    self.hunger = hunger
end
