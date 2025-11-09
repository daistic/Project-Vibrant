extends Node

const INTRO = preload("uid://b55qor3r7rpy4")
const COMIC_ENTRY = preload("uid://dma2xa2vhpt7m")
const PUZZLE_ENTRY = preload("uid://daggm4ioimut0")
const INTRO_OPTIONS = preload("uid://b5pmvvi56h3vd")
const MAIN_MENU = preload("uid://bl2upi75da1co")

var comic_key: String = ""
var puzzle_key: String = ""

var intro_options_picked: Array[bool] = [false, false, false]

var black_counter: int = 0
var white_counter: int = 0

func handle_next_scene_key(next_scene_key: String) -> void:
	if next_scene_key.contains("puzzle:"):
		puzzle_key = next_scene_key.get_slice(":", 1)
		go_to_puzzle_scene()
	elif next_scene_key.contains("comic:"):
		comic_key = next_scene_key.get_slice(":", 1)
		print(comic_key)
		go_to_comic_scene()
	elif next_scene_key == "intro_options":
		go_to_intro_options()
	elif next_scene_key == "ending":
		if black_counter > white_counter:
			comic_key = "ending black"
		else:
			comic_key = "ending white"
		go_to_comic_scene()

func go_to_intro_scene() -> void:
	comic_key = ""
	puzzle_key = ""
	intro_options_picked = [false, false, false]
	black_counter = 0
	white_counter = 0
	
	get_tree().change_scene_to_packed(INTRO)

func go_to_comic_scene() -> void:
	get_tree().change_scene_to_packed(COMIC_ENTRY)

func go_to_puzzle_scene() -> void:
	get_tree().change_scene_to_packed(PUZZLE_ENTRY)

func go_to_intro_options() -> void:
	get_tree().change_scene_to_packed(INTRO_OPTIONS)

func go_to_main_menu() -> void:
	get_tree().change_scene_to_packed(MAIN_MENU)
