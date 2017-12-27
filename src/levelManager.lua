level = require ("src.level")
platformGenerator = require("src.platformGenerator")
levelManager = {}
levelManager.levels = {}

levelManager.currentLevel = nil 

function levelManager:load ()
	level1 = require ("src.Levels.level01")
	table.insert (self.levels, level1)
	currentLevel = 1

	levelManager:PopulateLevel ()

end

function levelManager:update ()
end


function levelManager:PopulateLevel ()

	for i, v in ipairs(self.levels[currentLevel].platformCoordList) do
		posX = v[1]
		posY = v[2]
		platformGenerator:makeNewPlatform (posX, posY)
	end

end
return levelManager