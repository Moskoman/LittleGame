camera = {}

camera.x = 0
camera.y = 0
camera.scaleX = 1
camera.scaleY = 1

function camera:set ()
	love.graphics.push ()
	love.graphics.rotate (0)
	love.graphics.scale (1/self.scaleX, 1/self.scaleY)
	love.graphics.translate (-self.x, -self.y)
end

function camera:move (dx, dy)
	self.x = self.x + (dx or 0)
	self.y = self.y + (dy or 0)
end

return camera