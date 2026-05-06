extends Button

var frame_scene = load("res://Scenes/Buildings/frame.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var frame = frame_scene.instantiate()
	frame.position = self.position
	get_tree().current_scene.add_child(frame)
	self.release_focus()
