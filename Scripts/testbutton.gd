extends Button

var frame_scene = load("res://Scenes/Buildings/frame.tscn")

func _on_pressed() -> void:
	var frame = frame_scene.instantiate()
	frame.position = self.position
	get_tree().current_scene.add_child(frame)
	self.release_focus()
