level = require ("src.level")
platform = require ("src.platform")
wall = require ("src.wall")

level02 = {}

level02.platformCoordList = {{0, 300, 600}, {700, 300, 300}, {1150, 300, 100}, {1450, 340, 1000}, {2450, 300, 300}, {2600, 240, 500}, {2850, 130, 1000}}
level02.wallCoordList = {{1800, 280, 40, 60}, {2100, 100, 40, 300}, {0, 0, 0, 0}} 
level02.powerStarList = {{1870, 330}, {1900, 330}, {1930, 330}}
level02.checkPointFlags = {}
level02.playerInitialPosition = {-40, 200}
level02.cameraInitialPosition = {80, 100}

return level02