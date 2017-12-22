platformGenerator = {}



function platformGenerator:makeNewPlatform (platformX, platformY)
	newPlatform = require ("src.platform")
	return newPlatform
end

return platformGenerator