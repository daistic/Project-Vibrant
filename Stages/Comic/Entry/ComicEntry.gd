extends Control

var comics: Dictionary[String, PackedScene] = {
	"Test" : preload("uid://b5yw76s4mvl7y"),
	"Introduction": preload("uid://dvbelqw3d8d86"),
	"yellow intro": preload("uid://dkxvhdwdo2e5s"),
	"blue intro" : preload("uid://c6yba6rd4dgag"),
	"red intro" : preload("uid://dkftn1uhik8lt"),
	"after options" : preload("uid://jk828354gmde"),
	"yellow dimension": preload("uid://rq55mcauhsnx"),
	"after yellow": preload("uid://cdwhp365u6bgk"),
	"red dimension" : preload("uid://c8d6gv0d0pgxm"),
	"after red" : preload("uid://ujk27j4w3fcj")
}

func _ready() -> void:
	var key = GameManager.comic_key
	
	if comics.has(key):
		var instance = comics[key].instantiate()
		add_child(instance)
