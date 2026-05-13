extends Camera2D
class_name EdgeScrollingCamera

@export var scroll_speed: float = 400.0
@export var edge_margin: int = 20

func _process(delta: float) -> void:
	var viewport_size = get_viewport_rect().size
	var mouse_pos = get_viewport().get_mouse_position()
	var direction = Vector2.ZERO

	if mouse_pos.x < edge_margin:
		direction.x = -1
	elif mouse_pos.x > viewport_size.x - edge_margin:
		direction.x = 1

	if mouse_pos.y < edge_margin:
		direction.y = -1
	elif mouse_pos.y > viewport_size.y - edge_margin:
		direction.y = 1

	position += direction * scroll_speed * delta
