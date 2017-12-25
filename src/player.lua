platformGenerator = require ('src.platformGenerator')
local player = {}

--general variables
gravity = 300
player.positionX = -40
player.positionY = 200
player.sizeX = 30
player.sizeY = 30
player.isGrounded = false
player.walkSpeed = 200

--dash variables
player.dashSpeed = 200
player.dashDistance = 40

--jump variables
player.canJump = true
player.speedY = 0
player.jumpCoolDown = 2.0
player.jumpCoolDownTimeStamp = 0
player.jumpInitialPosition = 0
player.jumpHeight = 100
player.isJumping = false
player.jumpSpeed = 40


function player.update(dt)

	player.CheckColisions()
	player.checkJumpCoolDown ()
	player.Dash(100, dt)

	if (not player.isGrounded) then
		player.ApplyGravity(dt)
	end

	if (love.keyboard.isDown ("lshift")) then
		player.Dash ((player.positionX + player.dashDistance), dt)
	end

	if (love.keyboard.isDown ("space") and player.canJump) then
		player.speedY = 250
		player.isJumping = true
		player.jumpInitialPosition = player.positionY
		player.jumpCoolDownTimeStamp = player.jumpCoolDownTimeStamp + player.jumpCoolDown
	end


	if (player.isJumping) then
		player.canJump = false
		player.Jump (player.jumpInitialPosition, dt)
	end

	player.Walk (dt)

end

function player.ApplyGravity (dt)
	player.speedY = player.speedY - (gravity * dt)
	player.positionY = player.positionY - (player.speedY * dt)
end

function player.Walk (dt)
	player.positionX = player.positionX + (player.walkSpeed * dt)
end

function player.Dash (finalX, dt)

	if player.positionX < finalX then
		player.positionX = player.positionX + (player.dashSpeed * dt)
	end
end

function player.Jump(jumpInitialPosition, dt) -- NO FUTURO CALCULAR SPEEDY EM FUNÇÃO DO JUMPHEIGHT
	if ((player.positionY >= jumpInitialPosition - player.jumpHeight) and player.speedY > 0) then
		player.positionY = player.positionY - (player.speedY * dt)
		player.speedY = player.speedY - (gravity * dt)
	else 
		player.isJumping = false
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                 
end

function player.checkJumpCoolDown()
	if ((player.jumpCoolDownTimeStamp <= player.jumpCoolDown + timeSinceLoad) and (player.isGrounded)) then
		player.canJump = true
	else
		player.canJump = false
	end
end

function player.CheckColisions()
	--pega lista de colisores do montador de cenário
	local breakCondition = false
	for i, v in ipairs(platformGenerator.platforms) do
		if (breakCondition == false) then
			breakCondition = player.CheckFloorColision(v)
		end
	end
	
end

function player.CheckFloorColision (platform)
	if (((player.positionY >= platform.positionY - player.sizeY) and (player.positionY <= platform.positionY + platform.sizeY)) and ((player.positionX >= platform.positionX) and (player.positionX <= (platform.positionX + platform.sizeX)))) then
		if (platform.positionY < player.positionY) then
			player.speedY = -40
		else
			player.isGrounded = true
		end

		if (player.positionX <= platform.positionX + 4) then
			print "colidiu lateral"
		end

		return true
	else
		player.isGrounded = false
		return false
	end

end

function player.CheckWallColision (wall)

end

return player