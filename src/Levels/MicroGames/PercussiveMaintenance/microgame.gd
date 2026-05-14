extends MicroGame

@export var gradient: GradientTexture1D

func _physics_process(delta: float) -> void:
	$Sprite2D.look_at($Computer.global_position)
	$Sprite2D.global_position = lerp($Sprite2D.global_position, get_global_mouse_position(), 20 * delta)

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
