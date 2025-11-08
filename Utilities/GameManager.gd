extends Node

const INTRO = preload("uid://b55qor3r7rpy4")
const COMIC_ENTRY = preload("uid://dma2xa2vhpt7m")
const PUZZLE_ENTRY = preload("uid://daggm4ioimut0")

var comic_key: String = ""
var puzzle_key: String = ""

func go_to_intro_scene() -> void:
	get_tree().change_scene_to_packed(INTRO)

func go_to_comic_scene() -> void:
	get_tree().change_scene_to_packed(COMIC_ENTRY)

func go_to_puzzle_scene() -> void:
	get_tree().change_scene_to_packed(PUZZLE_ENTRY)
