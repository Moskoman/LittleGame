wallGenerator = {}
wallGenerator.walls = {}
wall = require ("src.wall")

function wallGenerator:makeNewWall (positionX, positionY, sizeX, sizeY)
	newWall = {}
	newWall = wall:new (positionX, positionY, sizeX, sizeY)
	table.insert(wallGenerator.walls, newWall)
	return wall
end

return wallGenerator 