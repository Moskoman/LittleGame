platformGenerator = {}
platformGenerator.platforms = {}
newPlatform = require ("src.platform")


function platformGenerator:makeNewPlatform (platformX, platformY)
	a = {}
	a = newPlatform:new (a, platformX, platformY)
	table.insert(platformGenerator.platforms, a)
	return a
end

return platformGenerator