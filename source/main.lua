import "CoreLibs/timer"
import "gameState"

function playdate.update()
    gameState.router:current():update(gameState)
    playdate.timer.updateTimers()
end
