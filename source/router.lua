import "screens/HomeScreen"
import "screens/NewPlayerScreen"
import "screens/PondScreen"
import "lib/Router"

local routes = {
    newPlayer = NewPlayerScreen(),
    home = HomeScreen(),
    pond = PondScreen()
}
router = Router(routes, "home")
