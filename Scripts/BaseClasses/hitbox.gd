extends Area2D

class_name HitBox

signal target_detected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent=get_parent()
	print(parent)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		for area in get_overlapping_areas():
			if area is HurtBox:
				if hitbox_is_valid(area):
					emit_signal("target_detected", area)
					
func hitbox_is_valid(area: HurtBox):
	if area.isTower:
		return true
