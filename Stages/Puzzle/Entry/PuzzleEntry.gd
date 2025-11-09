extends Node2D

var puzzles: Dictionary[String, PackedScene] = {
	"yellow puzzle" : preload("uid://c20l2qah52w7m")
}

func _ready() -> void:
	var key = GameManager.puzzle_key
	
	if puzzles.has(key):
		var instance = puzzles[key].instantiate()
		add_child(instance)
