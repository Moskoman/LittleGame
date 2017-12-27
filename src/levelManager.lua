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

	for xi, xv in ipairs(self.levels[currentLevel].platformList) do
		for i, v in ipairs(self.levels[currentLevel].platformList[xi]) do
			print (v)
			print "loko"
		end
	end

end
return levelManager