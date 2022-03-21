extends Sprite3D


func _ready():
	$AnimationPlayer.play("fade")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
