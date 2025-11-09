class_name PuzzleGrid

extends Area2D

@export var sprite: CompressedTexture2D
@export var polygon_points: PackedVector2Array
@export var grid_id: int = 0

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D

var fragment_has_entered: bool = false
var fragment_placed: bool = false
var entered_fragments: Array[PuzzleFragment]
var placed_fragment: PuzzleFragment

func _ready() -> void:
	sprite_2d.texture = sprite
	collision_polygon_2d.polygon = polygon_points

func _input(event: InputEvent) -> void:
	if event.is_action_released("click_puzzle"):
		if (fragment_has_entered == true and 
			entered_fragments.back().fragment_id == grid_id and 
			fragment_placed == false and placed_fragment == null):
			placed_fragment = entered_fragments.back()
			_reposition_placed_fragment()
		
		if fragment_has_entered == false:
			placed_fragment = null
			
			for fragment in entered_fragments:
				if fragment.fragment_id == grid_id and placed_fragment == null:
					placed_fragment = fragment
					_reposition_placed_fragment()
					break

func _reposition_placed_fragment() -> void:
	var tween: Tween = get_tree().create_tween()
	tween.tween_property(
		placed_fragment, "position", self.position, 0.2
		).set_ease(Tween.EASE_OUT)
	
	placed_fragment.z_index = 0
	SoundManager.play_sfx("Put Puzzle")

func _on_area_entered(area: Area2D) -> void:
	if area is PuzzleFragment:
		fragment_has_entered = true
		entered_fragments.append(area)

func _on_area_exited(area: Area2D) -> void:
	if area is PuzzleFragment:
		fragment_has_entered = false
		entered_fragments.erase(area)
