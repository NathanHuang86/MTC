extends Node2D

var score = 0
var combo = 0

var max_combo = 0
var great = 0
var good = 0
var okay = 0
var missed = 0

var bpm = 90

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
func _ready():
	randomize()
	$Conductor.play_with_beat_offset(8)


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
	#$Janitor._call_bounce()
	song_position_in_beats = position
	
	if song_position_in_beats > 4:##
		count = 1
		lane1 = 2
	if song_position_in_beats > 5:
		count = 0
		lane1 = 1
	if song_position_in_beats > 8:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 9:
		count = 0
		lane1 = 1
	if song_position_in_beats > 12:##
		count = 1
		lane1 = 1
	if song_position_in_beats > 13:
		count = 0
		lane1 = 1
	if song_position_in_beats > 16:##
		count = 1
		lane1 = 0
	if song_position_in_beats > 17:
		count = 0
		lane1 = 1
	if song_position_in_beats > 20:##
		count = 1
		lane1 = 3
		lane2 = 0
	if song_position_in_beats > 21:
		count = 0
		lane1 = 1
	if song_position_in_beats > 24:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 25:
		count = 0
		lane1 = 1
	if song_position_in_beats > 28:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 29:
		count = 0
		lane1 = 1
	if song_position_in_beats > 32:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 33:
		count = 0
		lane1 = 1
	if song_position_in_beats > 36:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 37:
		count = 0
		lane1 = 1
	if song_position_in_beats > 38:
		count = 2
		lane1 = 1
		lane2 = 0
	if song_position_in_beats > 39:
		count = 0
		lane1 = 1
		lane2 = 0
	if song_position_in_beats > 40:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 41:
		count = 0
		lane1 = 1
	if song_position_in_beats > 42:
		count = 2
		lane1 = 2
		lane2 = 3
	if song_position_in_beats > 43:
		count = 0
		lane1 = 2
		lane2 = 3
	if song_position_in_beats > 44:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 45:
		count = 0
		lane1 = 1
	if song_position_in_beats > 48:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 49:
		count = 0
		lane1 = 1
	if song_position_in_beats > 52:##
		count = 1
		lane1 = 3
	if song_position_in_beats > 53:
		count = 0
		lane1 = 1
	if song_position_in_beats > 54:##
		count = 1
		lane1 = 3

	if song_position_in_beats > 158:
		RhythmGlobal.set_score(score, "Janitor")
		RhythmGlobal.combo = max_combo
		RhythmGlobal.great = great
		RhythmGlobal.good = good
		RhythmGlobal.okay = okay
		RhythmGlobal.missed = missed
		get_tree().change_scene("res://Scenes/End.tscn")
		if get_tree().change_scene("res://Scenes/End.tscn") != OK:
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
	
	
	score += by * combo
	$Label.text = str(score)
	if combo > 0:
		$Combo.text = str(combo) + " combo!"
		if combo > max_combo:
			max_combo = combo
	else:
		$Combo.text = ""


func reset_combo():
	combo = 0
	$Combo.text = ""
