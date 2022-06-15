import "CoreLibs/object"

class('Food').extends()
function Food:init(nutritionalValue)
    Food.super.init(self)
    self.nutritionalValue = nutritionalValue
end
