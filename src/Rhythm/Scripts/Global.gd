extends Node2D


var score = 0
var gradescore = 0
var combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0
var grade = "NA"

#standardize scoring somehow
func set_score(new, character):
	gradescore = new
	#MAKE SURE GRADESCORE IS CALCULATED UNIQULY DEPENDING ON CHARACTER
	
	
#	if character = "Janitor":
#
#	if character = "Cosplay":
#
#	if character = "Himbo":
#
#	if character = "Mother":
#
#	if character = "Oliver":
#
#	if character = "Shopping":
#
#	if character = "Janitor":
#
#	if character = "Janitor":
		
	score = new
	
	if gradescore == 1000:
		grade = "S"
	elif gradescore > 900:
		grade = "A"
	elif gradescore > 800:
		grade = "B"
	elif gradescore > 600:
		grade = "C"
	elif gradescore > 400:
		grade = "D"
	else:
		grade = "F"
		
