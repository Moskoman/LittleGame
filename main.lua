player = require ("src.player")
platform = require ("src.platform")
camera = require ("src.camera")



function love.load()
	timeSinceLoad = 0
end

function love.update(dt)
	timeSinceLoad = timeSinceLoad + dt
	player.update(dt)
	platform.update(dt)
end


function love.draw()

	camera:set (player.positionX)

	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 4800, 270)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.positionX, player.positionY, player.sizeX, player.sizeY)

	love.graphics.draw (platform.image, platform.positionX, platform.positionY)

	camera:unset ()
	
end 