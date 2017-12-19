local player = {}

player.positionX = -40
player.positionY = 240
player.sizeX = 30
player.sizeY = 30

function player.update(dt)
	player.IncreaseX(100)
end


function player.IncreaseX (finalX)

	if player.positionX < finalX then
		player.positionX = player.positionX + 1
	end
end

function player.jump()
	-- body
end



return player