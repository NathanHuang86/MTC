extends MenuButton

const FILE_NAME = "res://src/Save/game-data.json"

func _ready():
	self.get_popup().add_item("Save")
	self.get_popup().add_item("Load")
	self.get_popup().add_item("Main Menu")
	self.get_popup().connect("id_pressed", self, "_on_item_pressed")

func _on_item_pressed(id):
	var itemName = self.get_popup().get_item_text(id)
	
	if itemName == "Save":
		var file = File.new()
		file.open(FILE_NAME, File.WRITE)
		sigGlobal.gamedata["scriptLine"] = get_parent().get_node("Background").tracker
		file.store_string(to_json(sigGlobal.gamedata))
		file.close()
	
	if itemName == "Load":
		var file = File.new()
		if file.file_exists(FILE_NAME):
			file.open(FILE_NAME, File.READ)
			var data = parse_json(file.get_as_text())
			file.close()
			sigGlobal.gamedata = data
			get_tree().reload_current_scene()
	
	if itemName == "Main Menu":
		sigGlobal.gamedata["intScene"] = 0
		sigGlobal.gamedata["strProtagName"] = "???"
		sigGlobal.gamedata["scriptLine"] = null
		get_tree().change_scene("res://src/Main Menu/nodMainMenu.tscn")
