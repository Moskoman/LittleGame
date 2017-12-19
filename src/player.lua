platform = require ('src.platform')
local player = {}

player.positionX = -40
player.positionY = 40
player.sizeX = 30
player.sizeY = 30
player.isGrounded = false
local speed = 100

function player.update(dt)
	player.CheckColisions()
	player.IncreaseX(100, dt)
	if (not isGrounded) then
		player.ApplyGravity(dt)
	end
end


function player.IncreaseX (finalX, dt)

	if player.positionX < finalX then
		player.positionX = player.positionX + (speed * dt)
	end
end

function player.Jump()
	-- body
end

function player.ApplyGravity (dt)
	player.positionY = player.positionY + (200 * dt)
	--print "foi"
end

function player.CheckColisions()
	player.CheckFloorColision(platform)
		--if incremental com ipairs
	-- body
end
	--pega lista de colisores do montador de cenário
function player.CheckFloorColision (platform)
	if (((player.positionX >= platform.positionX) and (player.positionX <= (platform.positionX + platform.sizeX))) and (player.positionY >= platform.positionY - player.sizeY)) then
		isGrounded = true
		print "doideeZira"
		return true
	else
		isGrounded = false
		return false
	end

end

return player