player = require ("src.player")


function love.load()
end

x = 1;
comingBack = false

function love.update(dt)
	print (player.x)
	if (comingBack == false and player.x <= 270)
		then player.x = player.x + 2;
	else
		player.x = player.x - 2;
		comingBack = true
		if (player.x <= 0)
			then comingBack = false
		end
	end
end


function love.draw()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 0, 0, 300, 400)

	love.graphics.setColor (0, 0, 255)
	love.graphics.rectangle ("fill", 0, 0, 100, 20)

	love.graphics.setColor (255, 0, 0)
	love.graphics.rectangle ("fill", player.x, 370, 30, 30)

	
end