prefabFactory = {}
newPlatform = require ("src.platform")
wall = require ("src.wall")
prefabFactory.platforms = {}
prefabFactory.walls = {}
prefabFactory.powerStars = {}


function prefabFactory:makeNewPlatform (platformX, platformY, platformSizeX, platformSizeY)
	a = {}
	a = newPlatform:new (a, platformX, platformY, platformSizeX, platformSizeY)
	table.insert(prefabFactory.platforms, a)
	return a
end


function prefabFactory:makeNewWall (positionX, positionY, sizeX, sizeY)
	newWall = {}
	newWall = wall:new (positionX, positionY, sizeX, sizeY)
	table.insert(prefabFactory.walls, newWall)
	return newWall
end

function prefabFactory:makeNewPowerStar (positionX, positionY)
	newPowerStar = {}
	newPowerStar = powerStar:new (positionX, positionY)
	table.insert (prefabFactory.powerStars, newPowerStar)
	return newPowerStar
end

return prefabFactory