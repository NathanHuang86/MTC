extends Control


func _ready():
	$Tween.interpolate_property($TextureProgress, "value", 0, 100, 1.6, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()

func on_health_updated(health):
	$Tween.interpolate_property($TextureProgress, "value", $TextureProgress.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_OUT)
	$Tween.start()
