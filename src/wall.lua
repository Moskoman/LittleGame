wall = {}

wall.positionX = 0
wall.positionY = 0
wall.sizeX = 0
wall.sizeY = 0


function wall:new (positionX, positionY, sizeX, sizeY)

	a = {}
	setmetatable(a, self)
	a.__index = self
	a.positionX = positionX
	a.positionY = positionY
	a.sizeX = sizeX
	a.sizeY = sizeY
	return a

end


return wall