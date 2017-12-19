platform = {}

platform.positionX = 350
platform.positionY = 30
platform.sizeX = 59
platform.sizeY = 30
local moveSpeed = 150

function platform.update(dt)
	platform.Anda(dt)

end

function platform.Anda(dt)
	platform.positionX = platform.positionX - (moveSpeed * dt )

end

return platform