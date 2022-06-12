extends Node2D


func _ready():
	$GradeNumber.text = RhythmGlobal.grade
	$ScoreNumber.text = str(RhythmGlobal.score)
	$ComboNumber.text = str(RhythmGlobal.combo)
	$GreatNumber.text = str(RhythmGlobal.great)
	$GoodNumber.text = str(RhythmGlobal.good)
	$OkayNumber.text = str(RhythmGlobal.okay)
	$MissedNumber.text = str(RhythmGlobal.missed)
	

