player = require ("src.player")
platform = require ("src.platform")


function love.load()
end

function love.update(dt)
	player.update(dt)
end


function love.draw()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 480, 270)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.x, player.y, player.sizeX, player.sizeY)

	
end