class_name Puzzle

extends Node2D

@export var puzzle_grids: Array[PuzzleGrid]

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
	print("solved")
	print(puzzle_grids[0].placed_fragment.name)

func _puzzle_unfinished() -> void:
	finish_button.hide()
