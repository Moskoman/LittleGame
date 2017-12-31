level = require ("src.level")
platform = require ("src.platform")
wall = require ("src.wall")

level01 = {}

level01.platformCoordList = {{0, 250}, {300, 250}, {800, 350}, {1200, 350}, {1500, 350, 300}, {1800, 300, 200}, {2100, 300, 200}, {2480, 300, 100}, {2840, 300, 1000}}
level01.wallCoordList = {} 
level01.powerStarList = {{850, 190}, {1400, 250}}
level01.checkPointFlags = {{3000, 230}}

return level01