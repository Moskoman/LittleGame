platform = {}

platform.positionX = -50
platform.positionY = 250
platform.sizeX = 5000
platform.sizeY = 30
local moveSpeed = 150

function platform.update(dt)
	platform.Anda(dt)

end

function platform.Anda(dt)
	platform.positionX = platform.positionX - (moveSpeed * dt )

end

return platform