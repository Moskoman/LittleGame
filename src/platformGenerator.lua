platformGenerator = {}
newPlatform = require ("src.platform")


function platformGenerator:makeNewPlatform (platformX, platformY)
	a = {}
	a = newPlatform:new (a, platformX, platformY)
	return a
end

return platformGenerator