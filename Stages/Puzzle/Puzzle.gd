class_name Puzzle

extends Node2D

@export var puzzle_grids: Array[PuzzleGrid]

var empty_grids: int

func _ready() -> void:
	empty_grids = puzzle_grids.size()

func fragment_placed() -> void:
	empty_grids -= 1
	
	if empty_grids <= 0:
		_puzzle_finished()

func _puzzle_finished() -> void:
	print("solved")
	print(puzzle_grids[1].fragment_on_grid.name)
