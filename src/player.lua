platform = require ('src.platform')
local player = {}

--general variables
gravity = 300
player.positionX = -40
player.positionY = 40
player.sizeX = 30
player.sizeY = 30
player.isGrounded = false
local speed = 100

--jump variables
player.canJump = true
player.speedY = 0
player.isAscending = false
player.jumpCoolDown = 2.0
player.jumpCoolDownTimeStamp = 0
player.jumpInitialPosition = 0
player.jumpHeight = 100
player.isJumping = false
local jumpSpeed = 40


function player.update(dt)

	player.CheckColisions()
	player.checkJumpCoolDown ()
	player.IncreaseX(100, dt)

	if (not player.isGrounded) then
		player.ApplyGravity(dt)
	end

	if (love.keyboard.isDown ("space") and player.canJump) then
		player.speedY = 250
		player.isJumping = true
		player.isAscending = true
		player.jumpInitialPosition = player.positionY
		player.jumpCoolDownTimeStamp = player.jumpCoolDownTimeStamp + player.jumpCoolDown
	end


	if (player.isJumping) then
		player.canJump = false
		player.Jump (player.jumpInitialPosition, dt)
	end

end


function player.IncreaseX (finalX, dt)

	if player.positionX < finalX then
		player.positionX = player.positionX + (speed * dt)
	end
end

function player.Jump(jumpInitialPosition, dt) -- NO FUTURO CALCULAR SPEEDY EM FUNÇÃO DO JUMPHEIGHT
	if ((player.positionY >= jumpInitialPosition - player.jumpHeight) and player.isAscending) then
		player.positionY = player.positionY - (player.speedY * dt)
		player.speedY = player.speedY - (gravity * dt)
	else 
		player.isAscending = false
		player.isJumping = false
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                 
end

function player.ApplyGravity (dt)
	player.speedY = player.speedY - (gravity * dt)
	player.positionY = player.positionY - (player.speedY * dt)
end

function player.CheckColisions()
	--pega lista de colisores do montador de cenário
	--if incremental com ipairs
		player.CheckFloorColision(platform)
	
end
function player.CheckFloorColision (platform)
	if ( ((player.positionY >= platform.positionY - player.sizeY) and (player.positionY <= platform.positionY + platform.sizeY)) and ((player.positionX >= platform.positionX) and (player.positionX <= (platform.positionX + platform.sizeX)))) then
		player.isGrounded = true
		player.speedY = 0
		player.positionY = platform.positionY - player.sizeY + 1 
		return true
	else
		player.isGrounded = false
		return false
	end

end

function player.checkJumpCoolDown()
	if ((player.jumpCoolDownTimeStamp <= player.jumpCoolDown + timeSinceLoad) and (player.isGrounded)) then
		player.canJump = true
	else
		player.canJump = false
	end
end

return player