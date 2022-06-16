import "screens/HomeScreen"
import "screens/NewPlayerScreen"
import "lib/Router"

local routes = {newPlayer = NewPlayerScreen(), home = HomeScreen()}
router = Router(routes, "home")
