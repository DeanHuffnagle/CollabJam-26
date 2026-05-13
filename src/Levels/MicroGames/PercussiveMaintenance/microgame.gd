extends MicroGame


@export var gradient: GradientTexture1D
@export var goal: Vector2


	
func _on_computer_player_force(player_distance: float) -> void:
	
	if player_distance < 0.2:
		ended.emit()
	
	$Computer.sprite.modulate = gradient.gradient.sample(player_distance)
