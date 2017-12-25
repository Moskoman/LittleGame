player = require ("src.player")
platformGenerator = require ("src.platformGenerator")
wallGenerator = require ("src.wallGenerator")
platform = require ("src.platform")
camera = require ("src.camera")



function love.load()
	timeSinceLoad = 0
	camera.positionX = 80
	platform = platformGenerator:makeNewPlatform (0, 250)
	--p2 = platformGenerator:makeNewPlatform (700, 200)
	--p3 = platformGenerator:makeNewPlatform (700, -100)
	wall1 = wallGenerator:makeNewWall (400, 180, 3000, 500)
	wall2 = wallGenerator:makeNewWall (900, 100, 50, 500)
	player.Dash (100, 0.1)
end

function love.update(dt)
	timeSinceLoad = timeSinceLoad + dt
	player.update(dt)
	camera.positionX = camera.positionX + (200 * dt)
end


function love.draw()

	camera:set (camera.positionX)

	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 4800, 270)


	love.graphics.setColor(0, 255, 0)

	for i, v in ipairs (wallGenerator.walls) do
		love.graphics.rectangle("fill", v.positionX, v.positionY, v.sizeX, v.sizeY)
	end

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.positionX, player.positionY, player.sizeX, player.sizeY)

	for i, v in ipairs (platformGenerator.platforms) do
		love.graphics.draw (v.image, v.positionX, v.positionY)
	end

	camera:unset ()
	
end 