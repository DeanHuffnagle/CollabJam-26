extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Enemy:
		body.queue_free()
	
