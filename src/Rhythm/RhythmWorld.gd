extends Node2D

var currentMusic = ['res://src/Audio/Janitor.wav', 'res://src/Audio/Cosplayer.mp3']

func _ready():
	get_node("aspMusic").stream = load(currentMusic[sigGlobal.gamedata.intScene])
	get_node("aspMusic").play()



func _on_aspMusic_finished():
	sigGlobal.gamedata.intScene = + 1
	nodTransition.goto_scene("res://src/VisualNovel/nodVisualNovel.tscn")
