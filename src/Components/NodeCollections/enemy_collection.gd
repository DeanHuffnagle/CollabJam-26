extends NodeCollection
class_name EnemyCollection

var is_empty = true

func _ready() -> void:
	add_to_group("EnemyCollection")

func _process(delta: float) -> void:
	if self.get_child_count() == 0:
		is_empty = true
	else:
		is_empty = false
