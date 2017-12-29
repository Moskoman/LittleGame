prefabFactory = {}
newPlatform = require ("src.platform")
wall = require ("src.wall")
prefabFactory.platforms = {}
prefabFactory.walls = {}


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

return prefabFactory