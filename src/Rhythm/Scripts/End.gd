extends Node2D


var background
func _ready():
	$Sprite.frame = RhythmGlobal.sceneInt
	match RhythmGlobal.sceneInt:
		0:
			background = preload('res://assets/Images/Background/elevator.jpg')
		1:
			background = preload('res://assets/Images/Background/People Bench.jpg')
		2:
			background = preload('res://assets/Images/Background/plaza area.jpg')
		3:
			background = preload('res://assets/Images/Background/plaza area.jpg')
		4:
			background = preload('res://assets/Images/Background/Lecture Hall.jpg')
		5:
			background = preload('res://assets/Images/Background/Hallway 1.jpg')
		6:
			background = preload('res://assets/Images/Background/Path 6.jpg')
		
	$TextureRect.set_texture(background)
	#sprites[RhythmGlobal.sceneInt]
	
	
	$GradeNumber.text = RhythmGlobal.grade
	$ScoreNumber.text = str(RhythmGlobal.score)
	$ComboNumber.text = str(RhythmGlobal.combo)
	$GreatNumber.text = str(RhythmGlobal.great)
	$GoodNumber.text = str(RhythmGlobal.good)
	$OkayNumber.text = str(RhythmGlobal.okay)
	$MissedNumber.text = str(RhythmGlobal.missed)
	if RhythmGlobal.grade == "D" || RhythmGlobal.grade == "F":
		$PassFail.text = "You have to get a C or better to continue. Try Again!"
	else:
		$PassFail.text = "Well Done! I'd love to join you in the battle of the bands!"




	
