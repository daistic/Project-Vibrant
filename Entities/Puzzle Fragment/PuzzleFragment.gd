class_name PuzzleFragment

extends Area2D

@export var sprite: CompressedTexture2D
@export var polygon_points: PackedVector2Array
@export var fragment_id: int = 0
@export var is_monochrome: bool = false
@export var is_black: bool = false

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

static var currently_dragging = false
static var last_z_index = 0

var dragging: bool = false
var offset: Vector2 = Vector2(0, 0)

func _ready() -> void:
	sprite_2d.texture = sprite
	collision_polygon_2d.polygon = polygon_points
	last_z_index = 0

func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - offset

func _input(event: InputEvent) -> void:
	if event.is_action_released("click_puzzle"):
		dragging = false
		currently_dragging = false

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if currently_dragging == true and dragging == false:
		return
	
	if event.is_action_pressed("click_puzzle"):
		dragging = true
		currently_dragging = true
		offset = get_global_mouse_position() - global_position
		last_z_index += 1
		z_index = last_z_index
		
		SoundManager.play_sfx("Drag Puzzle")
