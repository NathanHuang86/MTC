extends Sprite3D

export var texture_early: StreamTexture
export var texture_late: StreamTexture
export var texture_perfect: StreamTexture

var score: int
var timing: String

func _ready():
	if score < 10:
		texture = texture_perfect
	else:
		match timing:
			"early": texture = texture_early
			"late": texture = texture_late
		
	$AnimationPlayer.play("fade")
	$AudioStreamPlayer3D.play()



func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
