extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _pressed():
	sigGlobal.gamedata["intScene"] = 0
	sigGlobal.gamedata["strProtagName"] = null
	sigGlobal.gamedata["scriptLine"] = null
	get_tree().change_scene("res://src/Main Menu/nodMainMenu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
