extends Node2D

func _ready():
	if sigGlobal.intScene > 2:
		$lblTextStuff.text = "END OF DEMO!"
		$btnContinue.visible = false
