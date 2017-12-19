platform = require ('src.platform')
local player = {}

player.positionX = -40
player.positionY = 240
player.sizeX = 30
player.sizeY = 30
local speed = 100

function player.update(dt)
	player.CheckColisions()
	player.IncreaseX(100, dt)
end


function player.IncreaseX (finalX, dt)

	if player.positionX < finalX then
		player.positionX = player.positionX + (speed * dt)
	end
end

function player.Jump()
	-- body
end

function player.CheckColisions()
	player.CheckFloorColision(platform)
	-- body
end
	--pega lista de colisores do montador de cenário
function player.CheckFloorColision (platform)
	if ((player.positionX >= platform.positionX) and (player.positionX <= (platform.positionX + platform.sizeX))) then
		print "BOOM"
	end
			--checa se colide
		--if incremental com ipairs
	--true se colidiu, falso se não

end

return player