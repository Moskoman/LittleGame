level = require ("src.level")
platform = require ("src.platform")
wall = require ("src.wall")

level01 = {}

level01.platformCoordList = {{0, 250}, {300, 250}, {800, 350}, {1200, 350}, {1500, 350, 300}, {1800, 300, 200}, {2100, 300, 200}, {2480, 300, 100}, {2840, 300, 1000}}
level01.wallCoordList = {} 
level01.powerStarList = {{830, 190}, {1400, 250,}, {2400, 200}, {2620, 250}, {2720, 200}, {2820, 250}}
level01.checkPointFlags = {{3000, 268}}
level01.playerInitialPosition = {-40, 200}
level01.cameraInitialPosition = {80, 0}
level01.maxScore = (#level01.powerStarList)


return level01