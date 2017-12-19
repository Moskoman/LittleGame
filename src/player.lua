local player = {}

player.x = -40
player.y = 240
player.sizeX = 30
player.sizeY = 30

function player.update(dt)
	player.IncreaseX(100)
end


function player.IncreaseX (finalX)

	if player.x < finalX then
		player.x = player.x + 1
	end
end

function player.jump()
	
end



return player