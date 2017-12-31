powerStar = {}

powerStar.positionX = 0
powerStar.positionY = 0
powerStar.sizeX = 3
powerStar.sizeY = 3
love.graphics.setDefaultFilter ("nearest", "nearest", 1)
powerStar.image = love.graphics.newImage("assets/world/powerStar.png")

function powerStar:new (posX, posY)
	newStar = {}
	setmetatable(newStar, self)
	self.__index = self
	newStar.positionX = posX
	newStar.positionY = posY
	return newStar
end


return powerStar