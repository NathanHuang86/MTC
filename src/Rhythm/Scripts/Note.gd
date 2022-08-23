extends Area2D

const TARGET_Y = 164

var speeds = [-16, -16, -50, -16, -16, -16, -120, -16, ]
var SPAWN_Y = speeds[RhythmGlobal.sceneInt]
#this adjusts the speed at which the arrows fall, but they still reach the "receptors" at the same time no matter what

var DIST_TO_TARGET = TARGET_Y - SPAWN_Y

var LEFT_LANE_SPAWN = Vector2(80, SPAWN_Y)
var UP_LANE_SPAWN = Vector2(120, SPAWN_Y)
var DOWN_LANE_SPAWN = Vector2(160, SPAWN_Y)
var RIGHT_LANE_SPAWN = Vector2(200, SPAWN_Y)

var speed = 0
var hit = false


func _ready():
	pass


func _physics_process(delta):
	if !hit:
		position.y += speed * delta
		if position.y > 200:
			queue_free()
			get_parent().reset_combo()
	else:
		$Node2D.position.y -= speed * delta


func initialize(lane):
	if lane == 0:
		$AnimatedSprite.frame = 0
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite.frame = 1
		position = UP_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite.frame = 3
		position = DOWN_LANE_SPAWN
	elif lane == 3:
		$AnimatedSprite.frame = 2
		position = RIGHT_LANE_SPAWN
	else:
		printerr("Invalid lane set for note: " + str(lane))
		return
	
	speed = DIST_TO_TARGET / 2.0
#timer is 0.3 sec

func destroy(score):
	$CPUParticles2D.emitting = true
	$AnimatedSprite.visible = false
	var collision = get_node("collision")
	remove_child(collision)
	$Timer.start()
	hit = true
	if score == 3:
		$Node2D/Label.text = "PERFECT"
		$Node2D/Label.modulate = Color("f6d6bd")
	elif score == 2:
		$Node2D/Label.text = "GREAT"
		$Node2D/Label.modulate = Color("c3a38a")
	elif score == 1:
		$Node2D/Label.text = "OKAY"
		$Node2D/Label.modulate = Color("997577")


func _on_Timer_timeout():
	queue_free()
