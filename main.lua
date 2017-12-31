player = require ("src.player")
levelManager = require ("src.levelManager")
powerStar = require ("src.powerStar")
camera = require ("src.camera")



function love.load()


	levelManager:load ()
	timeSinceLoad = 0
	camera.positionX = 80
	camera.positionY = player.positionY - 200
	player.Dash (100, 0.1)
end

function love.update(dt)

	levelManager:update ()
	timeSinceLoad = timeSinceLoad + dt
	player.update(dt)
	
	--camera follows player
	if (player.isAlive) then	
		camera.positionX = camera.positionX + (200 * dt)
		if (player.positionY - 100 < camera.positionY) then 
			camera.positionY = camera.positionY - (200 * dt)
		elseif (player.positionY - 160 > camera.positionY) then
			camera.positionY = camera.positionY + (200 * dt)
		end

		if (player.positionX > camera.positionX - 70) then
			camera.positionX = camera.positionX + (100 * dt)
		end
	end
end



function love.draw()

	camera:set (camera.positionX, camera.positionY)

	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", -300, -300, 8800, 2700)

	love.graphics.setColor(0, 255, 0)

	for i, v in ipairs (prefabFactory.walls) do
		love.graphics.rectangle("fill", v.positionX, v.positionY, v.sizeX, v.sizeY)
	end

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.positionX, player.positionY, player.sizeX, player.sizeY)

	love.graphics.setColor (0, 0, 255)

	for i, v in ipairs (prefabFactory.platforms) do
		love.graphics.rectangle("fill", v.positionX, v.positionY, v.sizeX, v.sizeY)
	end

	for i, v in ipairs (prefabFactory.powerStars) do
		love.graphics.draw (v.image, v.positionX, v.positionY, v.sizeX, v.sizeY)
	end

	for i, v in ipairs (prefabFactory.checkPointFlags) do
		love.graphics.draw (v.image, v.positionX, v.positionY, v.sizeX, v.sizeY)
	end

	camera:unset ()
	
end 