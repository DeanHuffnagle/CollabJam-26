extends MicroGame


@export var gradient: GradientTexture1D
@export var goal: Vector2

func _on_computer_player_force(player_distance: float) -> void:
	if player_distance > 1.5:
		$Computer.animate("glitch")
	elif player_distance > 1.0:
		$Computer.animate("crying")
	elif player_distance > 0.7:
		$Computer.animate("angry")
	elif player_distance > 0.4:
		$Computer.animate("neutral")
	else:
		$Computer.sprite.play("win")
		$Computer/RigidBody2D.freeze_mode = true
		$Timer.start(1.5)
	$Computer.screen.modulate = gradient.gradient.sample(player_distance)

func end_game():
	ended.emit()
