local player = {}

player.positionX = -40
player.positionY = 240
player.sizeX = 30
player.sizeY = 30
local speed = 100

function player.update(dt)
	player.IncreaseX(100, dt)
end


function player.IncreaseX (finalX, dt)

	if player.positionX < finalX then
		player.positionX = player.positionX + (speed * dt)
	end
end

function player.jump()
	-- body
end



return player