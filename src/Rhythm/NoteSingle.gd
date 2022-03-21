extends Node2D

signal hit(lane, score, timing)
signal miss(lane)

var lane: String
var able = false
var has_hit = false

var length: float = 32
var width: float = 128
var color = Color.white


onready var cursor = get_parent().get_parent().get_node("Cursor")
onready var world_3d = get_tree().get_root().get_node("World3D")

func _ready():
	connect("hit", world_3d, "on_hit")
	connect("miss", world_3d, "on_miss")
	
	var new_stylebox = $Panel.get_stylebox("panel").duplicate()
	new_stylebox.bg_color = color
	$Panel.add_stylebox_override("panel", new_stylebox)

	$Panel.margin_top = length * -0.5
	$Panel.margin_bottom = length * 0.5
	$Panel.margin_left = width * -0.5
	$Panel.margin_right = width * 0.5
	
	$CollisionShape2D.shape.extents = Vector2(20, 20)
	
	

func _on_HitDetector_area_entered(area):
	able = true

func _on_HitDetector_area_exited(area):
	able = false
	if not has_hit:
		miss()

func _process(delta):
	if able and not has_hit:
		if Input.is_action_just_pressed(String("note_" + lane)):
			hit()


func hit():
	has_hit = true
	emit_signal("hit", lane, get_score(), get_timing())

func miss():
	emit_signal("miss", lane)


func get_score() -> int:
	return cursor.position.y - position.y

func get_timing() -> String:
	if cursor.position.y > position.y:
		return "early"
	if cursor.position.y < position.y:
		return "late"
	else: 
		return "perfect" #failsafe
