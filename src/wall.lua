wall = {}

wall.positionX = 0
wall.positionY = 0
wall.sizeX = 0
wall.sizeY = 0


function wall:new (positionX, positionY, sizeX, sizeY)

	wall = {}
	setmetatable(wall, self)
	wall.__index = self
	wall.positionX = positionX
	wall.positionY = positionY
	wall.sizeX = sizeX
	wall.sizeY = sizeY
	return wall

end


return wall