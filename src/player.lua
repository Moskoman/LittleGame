platform = require ('src.platform')
local player = {}

player.positionX = -40
player.positionY = 40
player.sizeX = 30
player.sizeY = 30
player.jumped = false
player.isGrounded = false
player.isJumping = false
local jumpSpeed = 40
local speed = 100

function player.update(dt)
	player.CheckColisions()
	player.IncreaseX(100, dt)
	if (not isGrounded and not isJumping) then
		player.ApplyGravity(dt)
	end

	if (love.keyboard.isDown ("space")) then
		player.Jump ()
	end
end


function player.IncreaseX (finalX, dt)

	if player.positionX < finalX then
		player.positionX = player.positionX + (speed * dt)
	end
end

function player.Jump(dt)
	if (player.positionY >= 180) then
		player.positionY = player.positionY - 10
	end
end

function player.ApplyGravity (dt)
	player.positionY = player.positionY + (200 * dt)
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
		return true
	else
		isGrounded = false
		return false
	end

end

return player