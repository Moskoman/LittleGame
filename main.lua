player = require ("src.player")
platform = require ("src.platform")



function love.load()

end

function love.update(dt)
	player.update(dt)
	platform.update(dt)
end


function love.draw()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 480, 270)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.positionX, player.positionY, player.sizeX, player.sizeY)

	love.graphics.setColor (0, 255, 0)
	love.graphics.rectangle ("fill", platform.positionX, platform.positionY, platform.sizeX, platform.sizeY)

	
end