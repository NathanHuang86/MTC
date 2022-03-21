extends Node2D

func _ready():
	get_node("aspBGM").play()
	$aniCharacterChange.play("Fade In")

func _on_aspBGM_finished():
	get_node("aspBGM").play()
	

func _on_aniCharacterChange_animation_finished(anim_name):
	if anim_name == "Fade In":
		$aniCharacterChange.play("Fade Out")
	
	if anim_name == "Fade Out":
		$aniCharacterChange.play("Fade In")
