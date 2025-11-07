class_name PuzzleGrid

extends Area2D

@export var sprite: CompressedTexture2D
@export var polygon_points: PackedVector2Array
@export var grid_id: int = 0

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

var fragment_has_entered: bool = false
var fragment_on_grid: PuzzleFragment

func _ready() -> void:
	sprite_2d.texture = sprite
	collision_polygon_2d.polygon = polygon_points

func _input(event: InputEvent) -> void:
	if event.is_action_released("click_puzzle"):
		if fragment_has_entered and grid_id == fragment_on_grid.fragment_id:
			var tween: Tween = get_tree().create_tween()
			tween.tween_property(
				fragment_on_grid, "position", self.position, 0.2
				).set_ease(Tween.EASE_OUT)

func _on_area_entered(area: Area2D) -> void:
	fragment_has_entered = true
	fragment_on_grid = area

func _on_area_exited(_area: Area2D) -> void:
	fragment_has_entered = false
	fragment_on_grid = null
