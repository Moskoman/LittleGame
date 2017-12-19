player = require ("src.player")
splatform = require ("src.platform")
class = require ("lib.middleclass")


function love.load()
	platform = splatform:new (60, 40, 20, 30)
end

function love.update(dt)
	player.update(dt)
end


function love.draw()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 480, 270)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.positionX, player.positionY, player.sizeX, player.sizeY)

	print (platform.positionY)
	love.graphics.setColor (0, 255, 0)
	love.graphics.rectangle ("fill", platform.positionX, platform.positionY, platform.sizeX, platform.sizeY)

	
end