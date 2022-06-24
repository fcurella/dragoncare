import "CoreLibs/timer"
import "gameState"

function playdate.update()
    gameState.router:current():update(gameState)
    playdate.graphics.sprite.update()
    playdate.timer.updateTimers()
end
