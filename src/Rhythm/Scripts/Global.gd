extends Node2D

var sceneInt = 3

var score = 0
var totalNotes = [46, 286, 302, 1]
#remember to customize
var percent = 0

var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"

func set_score(new):
	
	score = new
	
	percent = float(great + good + okay) / totalNotes[sceneInt]

	if percent == 1:
		grade = "S"
	elif percent > 0.9:
		grade = "A"
	elif percent > 0.8:
		grade = "B"
	elif percent > 0.7:
		grade = "C"
	elif percent > 0.6:
		grade = "D"
	else:
		grade = "F"
		
