class_name Puzzle

extends Node2D

@export var puzzle_grids: Array[PuzzleGrid]
@export var next_scene_key: String

@onready var finish_button: GameButton = $CanvasLayer/MarginContainer/FinishButton

func _input(event: InputEvent) -> void:
	if event.is_action_released("click_puzzle"):
		for grid in puzzle_grids:
			if grid.placed_fragment == null:
				_puzzle_unfinished()
				return
		
		_puzzle_finished()

func _puzzle_finished() -> void:
	finish_button.show()

func _puzzle_unfinished() -> void:
	finish_button.hide()

func _on_finish_button_pressed() -> void:
	for grid in puzzle_grids:
		if grid.placed_fragment.is_monochrome:
			if grid.placed_fragment.is_black:
				GameManager.black_counter += 1
			else:
				GameManager.white_counter += 1
	
	GameManager.handle_next_scene_key(next_scene_key)
