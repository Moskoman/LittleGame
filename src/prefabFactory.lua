prefabFactory = {}
newPlatform = require ("src.platform")
wall = require ("src.wall")
checkPoint = require ("src.checkPointFlag")
prefabFactory.platforms = {}
prefabFactory.walls = {}
prefabFactory.powerStars = {}
prefabFactory.checkPointFlags = {}


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

function prefabFactory:makeNewCheckPointFlag (positionX, positionY)
	newCheckPoint = {}
	newCheckPoint = checkPoint:new (positionX, positionY)
	table.insert (prefabFactory.checkPointFlags, newCheckPoint)
	return newCheckPoint
end

function prefabFactory:makeNewEndLevelMenu ()
	newEndLevelMenu = {}
	newEndLevelMenu = endLevelMenu:New ()
	return newEndLevelMenu
end

return prefabFactory