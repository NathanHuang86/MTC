extends Node2D

var next = ""

func goto_scene(path):
	self.z_index = 1
	next = path
	$aniTransition.play("FadeBlack")

func _on_aniTransition_animation_finished(anim_name):
	if anim_name == "FadeBlack":
		get_tree().change_scene(next)
		$aniTransition.play("FadeOut")
