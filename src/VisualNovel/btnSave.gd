extends Button

func _on_btnSave_pressed():
	var file = File.new()
	file.open("res://src/Save/game-data.json", File.WRITE)
	sigGlobal.gamedata["scriptLine"] = get_parent().get_parent().get_parent().get_node("Background").tracker
	file.store_string(to_json(sigGlobal.gamedata))
	file.close()
