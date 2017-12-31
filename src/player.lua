prefabFactory = require ('src.prefabFactory')
levelManager = require ("src.levelManager")
camera = require ("src.camera")
local player = {}

--general variables
gravity = 300
player.positionX = -40
player.positionY = 200
player.sizeX = 30
player.sizeY = 30
player.isGrounded = false
player.walkSpeed = 200
player.isAlive = true
player.powerStarCounter = 0

--dash variables
player.canDash = true
player.dashSpeed = 200
player.dashDistance = 200
player.dashInitialPosition = 0
player.dashCoolDown = 2.0
player.dashCoolDownTimeStamp = 0
player.isDashing = false

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


	player.CheckDeath()
	player.CheckColisions()
	player.checkCoolDowns ()

	if (not player.isGrounded) then
		player.ApplyGravity(dt)
	end

	if (player.isAlive) then

		if (love.keyboard.isDown ("lshift") and player.canDash) then
			player.isDashing = true
			player.dashInitialPosition = player.positionX
			player.dashCoolDownTimeStamp = player.dashCoolDownTimeStamp + player.dashCoolDown
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

		if (player.isDashing) then
			player.canDash = false
			player.Dash ((player.dashInitialPosition + player.dashDistance), dt)
		end

		player.Walk (dt)

	end
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
		player.isDashing = true
	else
		player.canDash = true
		player.isDashing = false
	end
end

function player.Jump(jumpInitialPosition, dt) -- NO FUTURO CALCULAR SPEEDY EM FUNÇÃO DO JUMPHEIGHT
	if (player.speedY > 0) then
		player.positionY = player.positionY - (player.speedY * dt)
		player.speedY = player.speedY - (gravity * dt)
	else 
		player.isJumping = false
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                 
end

function player.checkCoolDowns()

	player.canDash = player.CheckDashCoolDown ()
	player.canJump = player.CheckJumpCoolDown ()

end

function player.CheckDashCoolDown ()

	if (player.dashCoolDownTimeStamp <= player.dashCoolDown + timeSinceLoad) then
		return true
	else
		return false
	end
end

function player.CheckJumpCoolDown ()

	if ((player.jumpCoolDownTimeStamp <= player.jumpCoolDown + timeSinceLoad) and (player.isGrounded)) then
		return true
	else
		return false
	end

end

function player.CheckColisions()
	local breakCondition = false
	for i, v in ipairs(prefabFactory.platforms) do
		if (breakCondition == false) then
			breakCondition = player.CheckFloorColision(v)
		end
	end
	
	for i, v in ipairs (prefabFactory.walls) do
		player.CheckWallColision (i, v)
	end

	for i, v in ipairs(prefabFactory.powerStars) do
		player.CheckPowerStarCollision(i, v)
	end

	for i, v in ipairs (prefabFactory.checkPointFlags) do 
		player.checkCheckPointFlagCollision (i, v)
	end

end

function player.CheckFloorColision (platform)
	if (((player.positionY >= platform.positionY - player.sizeY) and (player.positionY <= platform.positionY + platform.sizeY)) and ((player.positionX + player.sizeX >= platform.positionX) and (player.positionX <= (platform.positionX + platform.sizeX)))) then
		if (platform.positionY < player.positionY) then
			player.speedY = -40
		else
			player.isGrounded = true
		end

		if (player.positionX <= platform.positionX - player.sizeX + 4) then
			--print "colidiu lateral"
		end

		return true
	else
		player.isGrounded = false
		return false
	end

end

function player.CheckWallColision (i,wall)
	if ((player.positionX + player.sizeX >= wall.positionX) and (player.positionX < wall.positionX + wall.sizeX)) then
		if ((player.positionY >= wall.positionY) and (player.positionY < wall.positionY + wall.sizeY)) then
			if (player.isDashing) then 
				table.remove(prefabFactory.walls, i)
				player.walkSpeed = 200
			else
				player.walkSpeed = 0
			end
		elseif (player.positionY < wall.positionY and player.positionY > wall.positionY - player.sizeY - 1) then
			player.positionY = wall.positionY - player.sizeY
			player.isGrounded = true
			player.speedY = 0
		end
	end
end

function player.CheckPowerStarCollision (i, powerStar)
	if ((player.positionX + player.sizeX >= powerStar.positionX) and (player.positionX <= powerStar.positionX) and (player.positionY >= powerStar.positionY - 60) and (player.positionY < powerStar.positionY + powerStar.sizeY + 30)) then
		player.powerStarCounter = player.powerStarCounter + 1
		table.remove (prefabFactory.powerStars, i)
	end
end

function player.checkCheckPointFlagCollision (i, checkPointFlag)
	if ((player.positionX + player.sizeX >= checkPointFlag.positionX) and (player.positionX <= checkPointFlag.positionX)) then
		print "colided flag"
		player.positionX = -40
		player.positionY = 200
		camera.positionX = 80
		camera.positionY = player.positionY - 200
		levelManager:ClearLevel()
	end
end
 

function player.CheckDeath ()
	if (player.positionX < camera.positionX - player.sizeX - 200) then
		player.isAlive = false
		--print "morreu"
	end
end

return player