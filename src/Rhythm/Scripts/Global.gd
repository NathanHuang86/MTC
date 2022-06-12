extends Node2D


var score = 0
var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"

#standardize scoring somehow
func set_score(new):
	score = new
	if score > 11400:
		grade = "A+"
	elif score > 11000:
		grade = "A"
	elif score > 10000:
		grade = "A-"
	elif score > 9000:
		grade = "B+"
	elif score > 8000:
		grade = "B"
	elif score > 7000:
		grade = "B-"
	elif score > 6000:
		grade = "C+"
	elif score > 5000:
		grade = "C"
	elif score > 4000:
		grade = "C-"
	elif score > 3000:
		grade = "D+"
	elif score > 2000:
		grade = "D"
	elif score > 1000:
		grade = "D-"
	else:
		grade = "F"
		
