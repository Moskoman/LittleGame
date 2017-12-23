player = require ("src.player")
platformGenerator = require ("src.platformGenerator")
platform = require ("src.platform")
camera = require ("src.camera")



function love.load()
	timeSinceLoad = 0
	platform = platformGenerator:makeNewPlatform (0, 250)
	p2 = platformGenerator:makeNewPlatform (700, 200)
	p3 = platformGenerator:makeNewPlatform (700, -100)
end

function love.update(dt)
	timeSinceLoad = timeSinceLoad + dt
	player.update(dt)
end


function love.draw()

	camera:set (player.positionX)

	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 4800, 270)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.positionX, player.positionY, player.sizeX, player.sizeY)

	for i, v in ipairs (platformGenerator.platforms) do

		love.graphics.draw (v.image, v.positionX, v.positionY)
	end

	camera:unset ()
	
end 