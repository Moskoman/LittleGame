levelManager = require ("src.levelManager")
camera = require ("src.camera")

endLevelMenu = {}
endLevelMenu.positionX = camera.positionX + ((love.graphics.getWidth() / 10) * 2)
endLevelMenu.positionY = camera.positionY + ((love.graphics.getHeight() / 10) * 4)
endLevelMenu.sizeX = love.graphics.getWidth () / 10 * 6
endLevelMenu.sizeY = love.graphics.getHeight () / 10 * 4 

function endLevelMenu:New ()

	newEndLevelMenu = {}
	setmetatable(newEndLevelMenu, self)
	self.__index = self
	
	return newCheckPointFlag
end

function endlevelMenu:Update ()
	self:CheckInput ()
	self:Draw ()

end

function endLevelMenu:CheckInput ()
	if (love.keyboard.isDown ('space')) then
		levelManager:ClearLevel ()
		levelManager:NextLevel ()
		levelManager:PopulateLevel ()		
	end
end

function endLevelMenu:Draw()

end

return endLevelMenu