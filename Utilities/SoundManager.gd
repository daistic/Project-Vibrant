extends Node

const BGM_MAP: Dictionary[String, AudioStream] = {
	"Story" : preload("uid://6sqlvc21miaj"),
	"Puzzle" : preload("uid://k42i8ke6fl4k"),
	"Ending" : preload("uid://23d6vpyfqrft")
}

const SFX_MAP: Dictionary[String, AudioStream] = {
	"Button Click" : preload("uid://syd44ncvjikw"),
	"Drag Puzzle" : preload("uid://dsvdu5ekol7rb"),
	"Put Puzzle" : preload("uid://bdqmevxtuhe3p")
}

var bgm_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer

func _ready() -> void:
	bgm_player = AudioStreamPlayer.new()
	add_child(bgm_player)
	
	sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)

func play_bgm(bgm: String) -> void:
	if !BGM_MAP.has(bgm):
		return
	
	if bgm_player.stream == BGM_MAP[bgm]:
		return
	
	bgm_player.stop()
	bgm_player.stream  = BGM_MAP[bgm]
	bgm_player.play()

func disable_bgm() -> void:
	bgm_player.stop()

func play_sfx(sfx: String) -> void:
	if !SFX_MAP.has(sfx):
		return
	
	sfx_player.stop()
	sfx_player.stream  = SFX_MAP[sfx]
	sfx_player.play()
