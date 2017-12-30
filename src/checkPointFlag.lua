checkPointFlag = {}
checkPointFlag.positionX = 0
checkPointFlag.positionY = 0


function checkPointFlag::new(positionX, positionY)
	newCheckPointFlag = {}
	setmetatable(newCheckPointFlag, self)
	self.__index = self
	newCheckPointFlag.positionX = positionX
	newCheckPointFlag.positionY = positionY

	return newCheckPointFlag
end

return checkPointFlag