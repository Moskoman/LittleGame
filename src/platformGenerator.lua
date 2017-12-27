platformGenerator = {}
platformGenerator.platforms = {}
newPlatform = require ("src.platform")


function platformGenerator:makeNewPlatform (platformX, platformY, platformSizeX, platformSizeY)
	a = {}
	a = newPlatform:new (a, platformX, platformY, platformSizeX, platformSizeY)
	table.insert(platformGenerator.platforms, a)
	return a
end

return platformGenerator