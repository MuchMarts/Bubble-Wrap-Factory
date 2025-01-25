extends Node

var HighScore = 0
var UpgradePoints = 0

var UpgradePointCost = 10
var PointsToNextUpgradePoint = 0

func UpdateScore(highscore: int):
	if (HighScore < highscore):
		var delta = highscore - HighScore
		PointsToNextUpgradePoint += delta
		
		while true:
			if PointsToNextUpgradePoint >= UpgradePointCost:
				PointsToNextUpgradePoint -= UpgradePointCost
				UpgradePoints += 1
			else:
				break
		HighScore = highscore
