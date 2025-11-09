extends Control

var comics: Dictionary[String, PackedScene] = {
	"Test" : preload("uid://b5yw76s4mvl7y"),
	"Introduction": preload("uid://dvbelqw3d8d86"),
	"yellow intro": preload("uid://dkxvhdwdo2e5s"),
	"blue intro" : preload("uid://c6yba6rd4dgag"),
	"red intro" : preload("uid://dkftn1uhik8lt"),
	"after options" : preload("uid://jk828354gmde")
}

func _ready() -> void:
	var key = GameManager.comic_key
	
	if comics.has(key):
		var instance = comics[key].instantiate()
		add_child(instance)
