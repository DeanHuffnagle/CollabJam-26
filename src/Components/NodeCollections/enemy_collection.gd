extends NodeCollection
class_name EnemyCollection

signal is_empty

func _ready() -> void:
	add_to_group("EnemyCollection")
	var timer := Timer.new()
	timer.wait_time = 0.5
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start()

func _on_timer_timeout() -> void:
	if get_child_count() == 1:
		is_empty.emit()
