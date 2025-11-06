extends Control

@export var start_comic_key: String = "Test"

func _on_play_button_pressed() -> void:
	GameManager.comic_key = start_comic_key
	GameManager.go_to_comic_scene()

func _on_credits_button_pressed() -> void:
	pass # Replace with function body.
