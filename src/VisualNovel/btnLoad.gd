extends Button

func _on_btnLoad_pressed():
	var file = File.new()
	
	if file.file_exists("res://src/Save/game-data.json"):
		file.open("res://src/Save/game-data.json", File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		sigGlobal.gamedata = data
		get_tree().change_scene("res://src/VisualNovel/nodVisualNovel.tscn")
