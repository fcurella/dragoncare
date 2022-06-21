import "models/Hero"
import "router"

gameState = {
    router = router,
    inventory = {},
    players = {Hero("Cleo"), false, false},
    currentPlayer = nil
}
