level = require ("src.level")
prefabFactory = require("src.prefabFactory")
levelManager = {}
levelManager.levels = {}

levelManager.currentLevel = nil 

function levelManager:load ()
	level1 = require ("src.Levels.level01")
	level2 = require ("src.Levels.level02")
	level3 = require ("src.Levels.level03")
	table.insert (self.levels, level1)
	table.insert (self.levels, level2)
	table.insert (self.levels, level3)
	levelManager.currentLevel = 1

	levelManager:PopulateLevel ()

end

function levelManager:PopulateLevel ()

	for i, v in ipairs(self.levels[levelManager.currentLevel].platformCoordList) do
		posX = v[1]
		posY = v[2]
		sizeX = v[3] or platform.sizeX
		sizeY = v[4] or platform.sizeY

		prefabFactory:makeNewPlatform (posX, posY, sizeX, sizeY)
	end

	for i, v in ipairs(self.levels[levelManager.currentLevel].wallCoordList) do
		posX = v[1]
		posY = v[2]
		sizeX = v[3]
		sizeY = v[4]
		prefabFactory:makeNewWall (posX, posY, sizeX, sizeY)
	end

	for i, v in ipairs (self.levels[levelManager.currentLevel].powerStarList) do
		posX = v[1]
		posY = v[2]
		prefabFactory:makeNewPowerStar (posX, posY)

	end

	for i, v in ipairs (self.levels[levelManager.currentLevel].checkPointFlags) do
		posX = v[1]
		posY = v[2]
		prefabFactory:makeNewCheckPointFlag (posX, posY)
	end
end

function levelManager:NextLevel ()
	self.currentLevel = self.currentLevel + 1
	levelManager:ClearLevel ()
	levelManager:PopulateLevel ()
end

function levelManager:ClearLevel ()

	prefabFactory.platforms = {}
	prefabFactory.walls = {}
	prefabFactory.powerStars = {}
	prefabFactory.checkPointFlags = {}
		
end

return levelManager