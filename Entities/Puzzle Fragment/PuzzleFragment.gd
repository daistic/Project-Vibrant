class_name PuzzleFragment

extends Area2D

@export var sprite: CompressedTexture2D
@export var polygon_points: PackedVector2Array
@export var fragment_id: int = 0

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

var dragging: bool = false
var offset: Vector2 = Vector2(0, 0)

func _ready() -> void:
	sprite_2d.texture = sprite
	collision_polygon_2d.polygon = polygon_points

func _process(_delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - offset

func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("click_puzzle"):
		dragging = true
		offset = get_global_mouse_position() - global_position
		z_index = 1
	
	if event.is_action_released("click_puzzle"):
		dragging = false
		z_index = 0
