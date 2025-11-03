extends Control

@onready var typing_timer: Timer = $TypingTimer
@onready var line_label: Label = $LineLabel

@export var dialogue: DialogueResource

var text: String = " "
var letter_index: int = 0
var line_index: int = 0
var is_typing: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("advance"):
		if is_typing == false:
			start_typing(dialogue.lines[line_index].text)
		else:
			finish_typing()

func start_typing(new_text: String) -> void:
	text = new_text
	line_label.text = ""
	letter_index = 0
	is_typing = true
	_type_text()

func _type_text() -> void:
	line_label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		finish_typing()
	else:
		typing_timer.start()

func finish_typing() -> void:
	line_label.text = text
	line_index += 1
	is_typing = false
	typing_timer.stop()

func _on_timer_timeout() -> void:
	_type_text()
