platform = {}

platform.positionX = -50
platform.positionY = 250
platform.image = love.graphics.newImage ("assets/world/platform_1.png")
platform.sizeX = 500
platform.sizeY = 235

function platform:new (a, positionX, positionY, platformSizeX, platformSizeY)
	
	a = a or {}
	setmetatable(a, self)
	self.__index = self
	a.positionX = positionX
	a.positionY = positionY
	a.sizeX = platformSizeX or platform.sizeX
	a.sizeY = platformSizeY or platform.sizeY
	return a 

end

return platform