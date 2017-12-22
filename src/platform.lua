platform = {}

platform.positionX = -50
platform.positionY = 250
platform.image = love.graphics.newImage ("assets/world/platform_1.png")
platform.sizeX = 5000
platform.sizeY = 235

function platform.update(dt)
end

function platform:new (a, positionX, positionY)
	
	a = a or {}
	setmetatable(a, self)
	self.__index = self
	a.positionX = positionX
	a.positionY = positionY
	return a 

end

return platform