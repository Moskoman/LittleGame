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

function camera:unset ()
	love.graphics.pop ()
end

function camera:move (dx, dy)
	self.x = self.x + (dx or 0)
	self.y = self.y + (dy or 0)
end

function camera:scale (sx, sy)
	sx = sx or 1
	self.scaleX = self.scaleX * sx
	self.scaleY = self.scaleY * (sy or sx)
end

function camera:setPosition(newPositionX, newPositionY)
	self.x = newPositionX or self.x
	self.y = newPositionY or self.y
end

function camera:setScale (newScaleX, newScaleY)
	self.scaleX = newScaleX or self.scaleX
	self.scaleY = newScaleY or self.scaleY
end

return camera