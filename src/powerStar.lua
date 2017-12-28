powerStar = {}

powerStar.positionX = 0
powerStar.positionY = 0
powerStar.sizeX = 10
powerStar.sizeY = 10
powerStar.image = love.graphics.newImage("assets/world/powerStar.png")

function powerStar:new (posX, posY)
	newStar = {}
	setmetatable(newStar, self)
	self.__index = self
	newStar.positionX = posX
	newStar.positionY = posY

end


return powerStar