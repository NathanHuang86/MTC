extends TextureButton

onready var dialog = get_node("Dialog")
onready var f = File.new()
onready var scenes = ['res://src/Dialog/Intro.txt', 'res://src/Dialog/Teacher.txt', 'res://src/Dialog/Chadwick.txt', 'res://src/Dialog/Mother.txt']
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
		while lineLeft != 0:
				nextScript(f.get_line())
				lineLeft = lineLeft - 1
	
	aniEnable = true

func nextScript(line):
	
	var script = ""
	
	if line == "[JANITOR]":
		line = f.get_line()
		get_node("sprCharacter").texture = load('res://assets/Images/Janitor Frames/' + line + '.png')
		get_node("sprCharacter").scale = Vector2(0.743, 0.702)
		get_node("sprCharacter").position = Vector2(920, 584)
		
		if aniEnable == true:
			$sprCharacter/aniCharacterEntrance.play("Entrance")
		else:
			get_node("sprCharacter").modulate = Color(0,0,0,255)
		
		line = f.get_line()
	
	if line == "[LEAVE]":
		get_node("sprCharacter").texture = StreamTexture.new()
		line = f.get_line()
	
	if line == "[RHYTHM]":
		nodTransition.goto_scene("res://src/Rhythm/World3D.tscn")
		return get_parent().get_node("Background/Dialog").text
	
	if line == "[CHAR:]":
		line = f.get_line()
		get_node("CurrentCharacter").text = line
		line = f.get_line()
	
	if line == '[BACKGROUND]':
		line = f.get_line()
		self.set_normal_texture(load('res://assets/Images/' + line + '.png'))
		line = f.get_line()
	
	if line == "[PLAYER]":
		get_node("CurrentCharacter").text = "[" + sigGlobal.gamedata.strProtagName + "]"
		line = f.get_line()
	
	
	
	if line == "(day ends)":
		$sprCharacter/aniCharacterEntrance.play("DayNight")
		self.disabled = true
	
	if line == "Oh cool, so you are a JANITOR here at GCC, that has to be fun. Oh yeah I should probably introduce myself. My name is":
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
		$Dialog/aniText.advance(4)
		
	else:
		var line = f.get_line()
		if not line == "":
			dialog.text = nextScript(line)
			$Dialog/aniText.play("Text Crawl")

func _on_liePlayerInput_text_entered(new_text):
	self.disabled = false
	sigGlobal.gamedata.strProtagName = new_text
	get_node("liePlayerInput").visible = false


func _on_aniCharacterEntrance_animation_finished(anim_name):
	if anim_name == "DayNight":
		$sprCharacter/aniCharacterEntrance.play_backwards("DayNight")
		self.disabled = false