extends TextureButton

onready var dialog = get_node("Dialog")
onready var f = File.new()
onready var scenes = ['res://src/Dialog/Janitor.txt', 'res://src/Dialog/Cosplay.txt', 'res://src/Dialog/Chadwick.txt', 'res://src/Dialog/Mother.txt', 'res://src/Dialog/Oliver.txt', 'res://src/Dialog/Prep.txt', 'res://src/Dialog/Ominous.txt', 'res://src/Dialog/Skater.txt', 'res://src/Dialog/End.txt']
onready var imgBackGround = File.new()
onready var tracker = 0
onready var aniEnable = false

func _ready():
	f.open(scenes[sigGlobal.gamedata["intScene"]], File.READ)
	var line = f.get_line()
	dialog.text = nextScript(line)
	get_node("Dialog/Sprite").self_modulate.a = 0.5
	
	if sigGlobal.gamedata["scriptLine"] != null:
		var lineLeft = sigGlobal.gamedata.scriptLine
		while lineLeft != 1:
				dialog.text = nextScript(f.get_line())
				lineLeft = lineLeft - 1
				print(lineLeft)

func nextScript(line):
	
	var script = ""
	
	if line == '[BACKGROUND]':
		line = f.get_line()
		self.set_normal_texture(load('res://assets/Images/Background/' + line + '.jpg'))
		line = f.get_line()
	
	if line == "[JANITOR]":
		get_node("CurrentCharacter").text = "Janitor"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Janitor Frames/Janitor ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[COSPLAYER]" or line == "[ANNIE]":
		if line == "[COSPLAYER]":
			get_node("CurrentCharacter").text = "Cosplayer"
		elif line == "[ANNIE]":
			get_node("CurrentCharacter").text = "Annie"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Cosplayer Frames/Cosplay ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[CHADWICK]":
		get_node("CurrentCharacter").text = "Chadwick"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Himbo Frames/Himbo ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[OLIVER]":
		get_node("CurrentCharacter").text = "Oliver"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Oliver Frames/Oliver ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
		
	if line == "[RAVEN]" or line == "[OMINOUS]":
		if line == "[RAVEN]":
			get_node("CurrentCharacter").text = "Raven"
		elif line == "[OMINOUS]":
			get_node("CurrentCharacter").text = "Ominous"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Ominous Frames/Ominous ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[MOTHER]" or line == "[CHILD]" or line == "[ELLIE]" or line == "[NATALIE]":
		if line == "[CHILD]":
			get_node("CurrentCharacter").text = "Child"
		elif line == "[ELLIE]":
			get_node("CurrentCharacter").text = "Ellie"
		elif line == "[NATALIE]":
			get_node("CurrentCharacter").text = "Natalie"
		else:
			get_node("CurrentCharacter").text = "Mother"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Mother Frames/Mother ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[PREP]" or line == "[VIVIAN]":
		if line == "[PREP]":
			get_node("CurrentCharacter").text = "Prep"
		elif line == "[VIVIAN]":
			get_node("CurrentCharacter").text = "Vivian"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Woman Frames/Woman ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[SKATER]" or line == "[LUKE]":
		if line == "[SKATER]":
			get_node("CurrentCharacter").text = "Skater"
		elif line == "[LUKE]":
			get_node("CurrentCharacter").text = "Luke"
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Skater Frames/Skater ' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.219, 0.211)
		get_node("sprCharacter").position = Vector2(920, 584)
		line = f.get_line()
	
	if line == "[PLAYER]":
		if sigGlobal.gamedata["strProtagName"] == null:
			get_node("CurrentCharacter").text = "Player"
		else:
			get_node("CurrentCharacter").text = sigGlobal.gamedata.strProtagName
		line = f.get_line()
	
	if line == "[ENVIRONMENT]":
		get_node("CurrentCharacter").text = " "
		line = f.get_line()
	
	if line == "[PROFESSOR]":
		get_node("CurrentCharacter").text = "Professor"
		line = f.get_line()
		
	if line == "[STAFF]":
		get_node("CurrentCharacter").text = "Concert Staff"
		line = f.get_line()
	
	if line == "[LEAVE]":
		get_node("sprCharacter").texture = StreamTexture.new()
		line = f.get_line()
	
	if line == "[RHYTHM]":
		nodTransition.goto_scene("res://src/Rhythm/Scenes/RhythmDefault.tscn")
		return get_parent().get_node("Background/Dialog").text
	
	if line == "[CREDITS]":
		nodTransition.goto_scene("res://src/VisualNovel/Credits.tscn")
		return get_parent().get_node("Background/Dialog").text
	
	if line == "(day ends)":
#		$sprCharacter/aniCharacterEntrance/colDayNight.visible = true
		$sprCharacter/aniCharacterEntrance.play("DayNight")
		self.disabled = true
	
	if tracker == 23 and sigGlobal.gamedata["intScene"] == 0 and sigGlobal.gamedata["strProtagName"] == null:
		print("Player name here...")
		script = str(script) + "\n" + str(line)
		self.disabled = true
		get_node("liePlayerInput").visible = true
		line = f.get_line()
	
	while not line == "":
		script = str(script) + "\n" + str(line)
		line = f.get_line()
	
	tracker= tracker + 1
	
	return script

func _pressed():
	if $Dialog/aniText.is_playing():
		$Dialog/aniText.advance(999)
	else:
		var line = f.get_line()
		if not line == "":
			dialog.text = nextScript(line)
			$Dialog/aniText.playback_speed = float(1.0 / dialog.text.length())
			$Dialog/aniText.play("Text Crawl")

func _on_liePlayerInput_text_entered(new_text):
	self.disabled = false
	sigGlobal.gamedata.strProtagName = new_text
	get_node("liePlayerInput").visible = false


func _on_aniCharacterEntrance_animation_finished(anim_name):
	if anim_name == "DayNight":
		$sprCharacter/aniCharacterEntrance.play_backwards("DayNight")
		self.disabled = false

func _on_btnSave_pressed():
	var save_game = File.new()
	save_game.open("user://game-data.json", File.WRITE)
	sigGlobal.gamedata["scriptLine"] = get_parent().get_node("Background").tracker
	save_game.store_string(to_json(sigGlobal.gamedata))
	save_game.close()

func _on_btnLoad_pressed():
	var file = File.new()
	if file.file_exists("user://game-data.json"):
		file.open("user://game-data.json", File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		sigGlobal.gamedata = data
		get_tree().change_scene("res://src/VisualNovel/nodVisualNovel.tscn")

func _on_btnMainMenu_pressed():
	sigGlobal.gamedata["intScene"] = 0
	sigGlobal.gamedata["strProtagName"] = null
	sigGlobal.gamedata["scriptLine"] = null
	get_tree().change_scene("res://src/Main Menu/nodMainMenu.tscn")
