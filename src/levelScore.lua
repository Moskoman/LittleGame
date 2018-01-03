player = require ("src.player")
levelManager = require ("src.levelManager")
levelScore = {}
levelScore.maxScore = 0
levelScore.currentScore = 0
levelScore.scorePositionX = 300
levelScore.scorePositionY = 20

function levelScore:New ()
end

function levelScore:ShowScore (playerPositionX, playerPositionY)
	self.maxScore = levelManager.levels[levelManager.currentLevel].maxScore
	self.currentScore = player.powerStarCounter
	love.graphics.setColor (0, 0, 0)
	love.graphics.print (self.currentScore .. "/" .. self.maxScore, (self.scorePositionX + playerPositionX), (self.scorePositionY + playerPositionY))


		
end

return levelScore