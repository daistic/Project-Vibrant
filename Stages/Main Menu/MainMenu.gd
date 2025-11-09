extends Control

@export var start_comic_key: String = ""

func _ready() -> void:
	SoundManager.play_bgm("Story")

func _on_play_button_pressed() -> void:
	GameManager.comic_key = start_comic_key
	GameManager.go_to_intro_scene()
