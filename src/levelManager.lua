level = require ("src.level")
levelManager = {}
levelManager.levels = {}

levelManager.currentLevel = nil 

function levelManager:load ()
	level1 = require ("src.Levels.level01")
	table.insert (self.levels, level1)
	currentLevel = 1

end

function levelManager:update ()
	print (#self.levels)
	print (self.levels[currentLevel])

end
return levelManager