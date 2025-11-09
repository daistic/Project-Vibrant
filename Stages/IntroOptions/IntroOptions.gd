extends Control

@onready var yellow_button: GameButton = $VBoxContainer/YellowButton
@onready var blue_button: GameButton = $VBoxContainer/BlueButton
@onready var red_button: GameButton = $VBoxContainer/RedButton

func _ready() -> void:
	if GameManager.intro_options_picked[0] == true:
		yellow_button.hide()
	if GameManager.intro_options_picked[1] == true:
		blue_button.hide()
	if GameManager.intro_options_picked[2] == true:
		red_button.hide()
	if GameManager.intro_options_picked.has(false) == false:
		GameManager.handle_next_scene_key("comic:after options")

func _on_yellow_button_pressed() -> void:
	GameManager.intro_options_picked[0] = true
	GameManager.handle_next_scene_key("comic:yellow intro")

func _on_blue_button_pressed() -> void:
	GameManager.intro_options_picked[1] = true
	GameManager.handle_next_scene_key("comic:blue intro")

func _on_red_button_pressed() -> void:
	GameManager.intro_options_picked[2] = true
	GameManager.handle_next_scene_key("comic:red intro")
