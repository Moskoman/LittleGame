level = require ("src.level")
prefabFactory = require("src.prefabFactory")
levelManager = {}
levelManager.levels = {}

levelManager.currentLevel = nil 

function levelManager:load ()
	level1 = require ("src.Levels.level01")
	level2 = require ("src.Levels.level02")
	table.insert (self.levels, level1)
	table.insert (self.levels, level2)
	levelManager.currentLevel = 1

	levelManager:PopulateLevel ()

end

function levelManager:update ()
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

function levelManager:ClearLevel ()

	print "levels"
	print (#self.levels)
	print "current"
	print (levelManager.currentLevel)

		for i, v in ipairs (self.levels[levelManager.currentLevel].platformCoordList) do
			table.remove (prefabFactory.platforms, i)
		end

		for i, v in ipairs (self.levels[levelManager.currentLevel].wallCoordList) do
			table.remove (prefabFactory.walls, i)
		end

		for i, v in ipairs (self.levels[levelManager.currentLevel].powerStarList) do
			table.remove (prefabFactory.powerStars, i)
		end

		for i, v in ipairs (self.levels[levelManager.currentLevel].checkPointFlags) do
			table.remove (prefabFactory.checkPointFlags, i)
		end

		levelManager.currentLevel = 2
		levelManager:PopulateLevel ()
		
end

return levelManager