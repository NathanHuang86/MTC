extends Node2D

var imageTracking = 0
var next = ['res://assets/Images/Janitor Frames/Janitor Default.png',
'res://assets/Images/Cosplayer Frames/Cosplay Default.png',
'res://assets/Images/Himbo Frames/Himbo Default.png',
'res://assets/Images/Mother Frames/Mother Default.png',
'res://assets/Images/Oliver Frames/Oliver Default.png',
'res://assets/Images/Woman Frames/Woman Default.png',
'res://assets/Images/Ominous Frames/Ominous Default.png']

func _ready():
	get_node("aspBGM").play()
	$aniCharacterChange.play("Fade In")

func _on_aspBGM_finished():
	get_node("aspBGM").play()
	

func _on_aniCharacterChange_animation_finished(anim_name):
	if anim_name == "Fade In":
		$aniCharacterChange.play("Fade Out")
	
	if anim_name == "Fade Out":
		imageTracking+=1
		
		if imageTracking >= 7:
			imageTracking = 0
		
		get_node("sprCharacter").texture = load(next[imageTracking])
		get_node("sprCharacter").scale = Vector2(0.245, 0.211)
		get_node("sprCharacter").position = Vector2(1440, 576)
		$aniCharacterChange.play("Fade In")
