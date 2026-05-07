extends Area2D

class_name HitBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var parent=get_parent()
	print(parent)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
