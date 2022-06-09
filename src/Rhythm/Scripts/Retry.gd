extends Button


func _pressed():
	if text == "Retry":
		get_tree().change_scene("res://src/Rhythm/Scenes/RhythmDefault.tscn")
	elif text == "Continue":
		get_tree().change_scene("")
