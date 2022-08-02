extends Button

func _on_btnMainMenu_pressed():
	sigGlobal.gamedata["intScene"] = 0
	sigGlobal.gamedata["strProtagName"] = "???"
	sigGlobal.gamedata["scriptLine"] = null
	get_tree().change_scene("res://src/Main Menu/nodMainMenu.tscn")
