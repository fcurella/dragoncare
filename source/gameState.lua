import "models/Hero"
import "router"

gameState = {
    router = router,
    inventory = {},
    players = {Hero("Cleo")},
    currentPlayer = nil
}
