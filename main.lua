require = "player.lua"

x = 1;
comingBack = false

function love.update(dt)
	if (comingBack == false and x <= 200)
		then x = x + 2;
	else
		x = x - 2;
		comingBack = true
		if (x <= 0)
			then comingBack = false
		end
	end
end

function love.draw()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 300, 400)

	love.graphics.setColor (0, 0, 255)
	love.graphics.rectangle ("fill", x, 0, 100, 20)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", 135, 370, 30, 30)
end