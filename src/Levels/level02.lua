level = require ("src.level")
platform = require ("src.platform")
wall = require ("src.wall")

level02 = {}

level02.platformCoordList = {{0, 300, 600}, {700, 300, 300}, {1150, 300, 100}, {1450, 340, 1000}}
level02.wallCoordList = {{1800, 280, 40, 60}} 
level02.powerStarList = {{1870, 330}, {1900, 330}, {1930, 330}}
level02.checkPointFlags = {{3000, 230}}

return level02