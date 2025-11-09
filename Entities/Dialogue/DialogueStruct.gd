class_name DialogueStruct

extends Resource

@export var speaker_name: String = ""
@export var text: String = ""
@export var panel: CompressedTexture2D
@export var line_event: EVENTS

enum EVENTS{
	NONE,
	START,
	FADE_IN,
	PANEL_CHANGE,
	HIDE_TEXT_AREA,
	FLASH,
	TEXT_SPEEDUP,
	TEXT_SPEEDBACK,
	REMOVE_COVER_POPUP,
	GOTO_PUZZLE,
}
