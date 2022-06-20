extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if RhythmGlobal.grade == "D" || RhythmGlobal.grade == "F":
		text = "Retry?"
	else:
		text = "Continue"
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if RhythmGlobal.grade == "D" || RhythmGlobal.grade == "F":
		get_tree().change_scene("res://src/Rhythm/Scenes/RhythmDefault.tscn")
	else:
		RhythmGlobal.sceneInt += 1
		get_tree().change_scene("res://src/VisualNovel/nodVisualNovel.tscn")
