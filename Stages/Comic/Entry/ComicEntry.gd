extends Control

var comics: Dictionary[String, PackedScene] = {
	"Test" : preload("uid://b5yw76s4mvl7y")
}

func _ready() -> void:
	var key = GameManager.comic_key
	
	if comics.has(key):
		var instance = comics[key].instantiate()
		add_child(instance)
