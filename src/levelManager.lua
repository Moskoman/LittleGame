level = require ("src.level")
platform = require("src.platform")
prefabFactory = require("src.prefabFactory")
powerStar = require ("src.powerStar")
levelManager = {}
levelManager.levels = {}

levelManager.currentLevel = nil 

function levelManager:load ()
	level1 = require ("src.Levels.level01")
	level2 = require ("src.Levels.level02")
	table.insert (self.levels, level1)
	table.insert (self.levels, level2)
	currentLevel = 1

	levelManager:PopulateLevel ()

end

function levelManager:update ()
end


function levelManager:PopulateLevel ()

	for i, v in ipairs(self.levels[currentLevel].platformCoordList) do
		posX = v[1]
		posY = v[2]
		sizeX = v[3] or platform.sizeX
		sizeY = v[4] or platform.sizeY

		prefabFactory:makeNewPlatform (posX, posY, sizeX, sizeY)
	end

	for i, v in ipairs(self.levels[currentLevel].wallCoordList) do
		posX = v[1]
		posY = v[2]
		sizeX = v[3]
		sizeY = v[4]
		prefabFactory:makeNewWall (posX, posY, sizeX, sizeY)
	end

	for i, v in ipairs (self.levels[currentLevel].powerStarList) do
		posX = v[1]
		posY = v[2]
		prefabFactory:makeNewPowerStar (posX, posY)

	end

	for i, v in ipairs (self.levels[currentLevel].checkPointFlags) do
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

		for i, v in ipairs (self.levels[currentLevel].platformCoordList) do
			table.remove (self.levels[currentLevel].platformCoordList, i)
			table.remove (prefabFactory.platforms, i)
		end

	
end

return levelManager