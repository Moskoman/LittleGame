platform = {}

platform.positionX = -50
platform.positionY = 250
platform.image = love.graphics.newImage ("assets/world/platform_1.png")
platform.sizeX = 5000
platform.sizeY = 30
local moveSpeed = 150

function platform.update(dt)

end
	

function platform.Walk(dt)
	platform.positionX = platform.positionX - (moveSpeed * dt )

end

return platform