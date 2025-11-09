extends Control

func _on_next_button_pressed() -> void:
	GameManager.comic_key = "Introduction"
	GameManager.go_to_comic_scene()
