class_name Comic

extends Control

@onready var illustration: TextureRect = $PanelParent/Illustration
@onready var illustration_2: TextureRect = $PanelParent/Illustration2

@onready var text_area: TextureRect = $TextArea
@onready var speaker_label: Label = $TextArea/MarginContainer/VBoxContainer/SpeakerLabel
@onready var line_label: RichTextLabel = $TextArea/MarginContainer/VBoxContainer/LineLabel

@onready var typing_timer: Timer = $TypingTimer
@onready var comic_animation: AnimationPlayer = $ComicAnimation

@onready var remove_cover_button: GameButton = $RemoveCoverButton

@export var dialogue: DialogueResource
@export var next_scene_key: String

var text: String = " "
var letter_index: int = 0
var line_index: int = 0
var is_typing: bool = false

var is_event_ready: bool = true

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("advance"):
		_handle_line_events()

func _ready() -> void:
	_handle_line_events()

func _handle_line_events() -> void:
	if line_index >= dialogue.lines.size():
		GameManager.handle_next_scene_key(next_scene_key)
		return
	
	if is_event_ready == false:
		_handle_text_area()
		return
	
	match dialogue.lines[line_index].line_event:
		DialogueStruct.EVENTS.PANEL_CHANGE:
			comic_animation.play("Change Panel")
		DialogueStruct.EVENTS.FADE_IN:
			comic_animation.play("Fade In")
		DialogueStruct.EVENTS.FLASH:
			comic_animation.play("Flash")
		DialogueStruct.EVENTS.TEXT_SPEEDUP:
			if dialogue.lines[line_index].panel != null:
				_direct_panel_change()
			
			typing_timer.wait_time = 0.01
			_handle_text_area()
		DialogueStruct.EVENTS.TEXT_SPEEDBACK:
			if dialogue.lines[line_index].panel != null:
				_direct_panel_change()
			
			typing_timer.wait_time = 0.05
			_handle_text_area()
		DialogueStruct.EVENTS.REMOVE_COVER_POPUP:
			text_area.hide()
			remove_cover_button.show()
		DialogueStruct.EVENTS.NONE:
			if dialogue.lines[line_index].panel != null:
				_direct_panel_change()
			
			_handle_text_area()
		DialogueStruct.EVENTS.FINISH_GAME:
			GameManager.go_to_main_menu()

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
	
	is_event_ready = true

func _new_panel_setup() -> void:
	illustration_2.texture = dialogue.lines[line_index].panel

func _new_panel_finished_animating() -> void:
	illustration.texture = dialogue.lines[line_index].panel
	illustration.modulate = Color(1.0, 1.0, 1.0, 1.0)
	is_event_ready = false
	_handle_text_area()

func _direct_panel_change() -> void:
	illustration.texture = dialogue.lines[line_index].panel

func _next_line_index() -> void:
	line_index += 1

func _on_timer_timeout() -> void:
	_type_text()

func _on_remove_cover_button_pressed() -> void:
	line_index += 1
	remove_cover_button.hide()
	_handle_line_events()
