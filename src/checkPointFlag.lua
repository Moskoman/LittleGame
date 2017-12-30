checkPointFlag = {}
checkPointFlag.positionX = 0
checkPointFlag.positionY = 0
checkPointFlag.image = love.graphics.newImage ("assets/world/checkPointFlag.png")


function checkPointFlag:new(positionX, positionY)
	newCheckPointFlag = {}
	setmetatable(newCheckPointFlag, self)
	self.__index = self
	newCheckPointFlag.positionX = positionX
	newCheckPointFlag.positionY = positionY

	return newCheckPointFlag
end

return checkPointFlag