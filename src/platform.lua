class = require ("lib.middleclass")

local Platform = class("Platform")

function Platform:initialize (positionX, positionY, sizeX, sizeY)

	self.sizeX = sizeX
	self.sizeY = sizeY
	self.positionX = positionX
	self.positionY = positionY

	return self
end

function  Platform:anda(speed)
	positionX = positionX - speed
end

return Platform