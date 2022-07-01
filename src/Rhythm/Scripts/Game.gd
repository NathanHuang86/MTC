extends Node2D

onready var map = File.new()
onready var scripts = ['res://src/Rhythm/Maps/Janitor.txt','res://src/Rhythm/Maps/Cosplay.txt','res://src/Rhythm/Maps/Himbo.txt', 'res://src/Rhythm/Maps/Mother.txt', 'res://src/Rhythm/Maps/Oliver.txt', 'res://src/Rhythm/Maps/Skater.txt', 'res://src/Rhythm/Maps/Ominous.txt']
onready var sprites = ['Janitor', 'Cosplayer', 'Himbo', 'Mother', 'Oliver', 'Shoppin'] #add skater and ominous when you can
var song_bpm = [90, 350, 220, 320, 00, 120, 360, 00]
#Janitor, cosplay(brodie), himbo 110, mother160, oliver(wesley), woman, skater, ominous


var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = song_bpm[RhythmGlobal.sceneInt]


var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

#var spawn_1_beat = 0
#var spawn_2_beat = 0
#var spawn_3_beat = 0
#var spawn_4_beat = 1

var arrow = 0;
var count = 0;

var lane1 = 0
var lane2 = 0
var lane3 = 0
var lane4 = 0

var rand = 0
var note = load("res://src/Rhythm/Scenes/Note.tscn")

var instance
var instance2
var instance3
var instance4

#I'm thinking we have the arrows to the left, Janitor sprite to the right, 
#if you reach certain point milestones, like every 500 points or something,
#their sprite will change, like smile or something. If you break your combo
#they could frown, maybe even have dialogue?? idk just a thought
var background

func _ready():
	$Sprite.set_animation(sprites[RhythmGlobal.sceneInt])
	match RhythmGlobal.sceneInt:
		0:
			background = preload('res://assets/Images/Background/elevator.jpg')
		1:
			background = preload('res://assets/Images/Background/People Bench.jpg')
		2:
			background = preload('res://assets/Images/Background/plaza area.jpg')
		3:
			background = preload('res://assets/Images/Background/plaza area.jpg')
	$TextureRect.set_texture(background)
	randomize()
	$Conductor.play_with_beat_offset(8)
	map.open(scripts[RhythmGlobal.sceneInt], File.READ)
	$Sprite.set_animation(sprites[RhythmGlobal.sceneInt])


func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene("res://Scenes/Menu.tscn") != OK:
			print ("Error changing scene to Menu")


func _on_Conductor_measure(position):
	if position == 1:
		if(count == 1):
			_spawn_notes_single(lane1)
		if(count == 2):
			_spawn_notes_double(lane1, lane2)
		if(count == 3):
			_spawn_notes_triple(lane1, lane2, lane3)
		if(count == 4):
			_spawn_notes_quad()
		
	elif position == 2:
		if(count == 1):
			_spawn_notes_single(lane1)
		if(count == 2):
			_spawn_notes_double(lane1, lane2)
		if(count == 3):
			_spawn_notes_triple(lane1, lane2, lane3)
		if(count == 4):
			_spawn_notes_quad()
	elif position == 3:
		if(count == 1):
			_spawn_notes_single(lane1)
		if(count == 2):
			_spawn_notes_double(lane1, lane2)
		if(count == 3):
			_spawn_notes_triple(lane1, lane2, lane3)
		if(count == 4):
			_spawn_notes_quad()
	elif position == 4:
		if(count == 1):
			_spawn_notes_single(lane1)
		if(count == 2):
			_spawn_notes_double(lane1, lane2)
		if(count == 3):
			_spawn_notes_triple(lane1, lane2, lane3)
		if(count == 4):
			_spawn_notes_quad()


#every 4 beats = 1 measure
#songs starts with 2 measures of silence
#therefore beats are off by 8
#to compensate for arrows taking a while to fall, subract 2 beats off for a better transition

func _on_Conductor_beat(position):
	
	
	#$Sprite/AnimationPlayer.play("Bounce")
	var beat = map.get_line()
	
	count = int(beat.substr(0, 1))
	lane1 = int(beat.substr(2, 1))
	lane2 = int(beat.substr(4, 1))
	lane3 = int(beat.substr(6, 1))
	
#
	if map.eof_reached():
		RhythmGlobal.combo = max_combo
		RhythmGlobal.great = great
		RhythmGlobal.good = good
		RhythmGlobal.okay = okay
		RhythmGlobal.missed = missed
		RhythmGlobal.set_score(score)
		get_tree().change_scene("res://src/Rhythm/Scenes/End.tscn")
		if get_tree().change_scene("res://src/Rhythm/Scenes/End.tscn") != OK:
			print ("Error changing scene to End")



func _spawn_notes_single(lane_numb):
		var lane = lane_numb
		instance = note.instance()
		instance.initialize(lane)
		add_child(instance)

func _spawn_notes_double(lane_numb1, lane_numb2):

		instance = note.instance()
		instance.initialize(lane_numb1)
		add_child(instance)
		instance2 = note.instance()
		instance2.initialize(lane_numb2)
		add_child(instance2)
	
func _spawn_notes_triple(lane_numb1, lane_numb2, lane_numb3):
		instance = note.instance()
		instance.initialize(lane_numb1)
		add_child(instance)
		instance2 = note.instance()
		instance2.initialize(lane_numb2)
		add_child(instance2)
		instance3 = note.instance()
		instance3.initialize(lane_numb3)
		add_child(instance3)
	
func _spawn_notes_quad():
		instance = note.instance()
		instance.initialize(0)
		add_child(instance)
		instance2 = note.instance()
		instance2.initialize(1)
		add_child(instance2)
		instance3 = note.instance()
		instance3.initialize(2)
		add_child(instance3)
		instance4 = note.instance()
		instance4.initialize(3)
		add_child(instance4)


func increment_score(by):
	if by > 0:
		combo += 1
	else:
		combo = 0
	
	if by == 3:
		great += 1
	elif by == 2:
		good += 1
	elif by == 1:
		okay += 1
	else:
		missed += 1
	
	
	score += (by * 100)
	$Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " combo!"
		if combo > max_combo:
			max_combo = combo
			if combo > 25:
				$Sprite.frame = 1
			elif combo > 50:
				$Sprite.frame = 2
	else:
		$Combo.text = ""
		$Sprite.frame = 0


func reset_combo():
	combo = 0
	$Combo.text = ""
