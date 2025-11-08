class_name Comic

extends Control

@onready var illustration: TextureRect = $PanelParent/Illustration
@onready var illustration_2: TextureRect = $PanelParent/Illustration2

@onready var text_area: TextureRect = $TextArea
@onready var speaker_label: Label = $TextArea/MarginContainer/VBoxContainer/SpeakerLabel
@onready var line_label: RichTextLabel = $TextArea/MarginContainer/VBoxContainer/LineLabel

@onready var typing_timer: Timer = $TypingTimer
@onready var comic_animation: AnimationPlayer = $ComicAnimation

@export var dialogue: DialogueResource

var text: String = " "
var letter_index: int = 0
var line_index: int = 0
var is_typing: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("advance"):
		_handle_line_events()

func _handle_line_events() -> void:
	if line_index >= dialogue.lines.size():
		GameManager.go_to_puzzle_scene()
		return
	
	match dialogue.lines[line_index].line_event:
		DialogueStruct.EVENTS.PANEL_CHANGE:
			comic_animation.play("Change Panel")
		DialogueStruct.EVENTS.FADE_IN:
			comic_animation.play("Fade In")
		DialogueStruct.EVENTS.NONE:
			_handle_text_area()

func _handle_text_area() -> void:
	if is_typing == false:
		speaker_label.text = dialogue.lines[line_index].speaker_name
		_start_typing(dialogue.lines[line_index].text)
	else:
		_finish_typing()

func _start_typing(new_text: String) -> void:
	text_area.show()
	text = new_text
	line_label.text = ""
	letter_index = 0
	is_typing = true
	_type_text()

func _type_text() -> void:
	if text[letter_index] == "[":
		while (text[letter_index] != "]"):
			line_label.text += text[letter_index]
			letter_index += 1
	
	line_label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		_finish_typing()
	else:
		typing_timer.start()

func _finish_typing() -> void:
	text_area.show()
	line_label.text = text
	line_index += 1
	is_typing = false
	typing_timer.stop()

func _new_panel_setup() -> void:
	illustration_2.texture = dialogue.lines[line_index].panel

func _new_panel_finished_animating() -> void:
	illustration.texture = dialogue.lines[line_index].panel
	illustration.self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	_handle_text_area()

func _direct_panel_change() -> void:
	illustration.texture = dialogue.lines[line_index].panel

func _next_line_index() -> void:
	line_index += 1

func _on_timer_timeout() -> void:
	_type_text()
