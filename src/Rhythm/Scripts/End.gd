extends Node2D

onready var sprites = ['Janitor', 'Cosplay', 'Himbo', 'Mother', 'Oliver', 'Shoppin']

func _ready():
	$Sprite.set_animation(sprites[RhythmGlobal.sceneInt])
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




	
