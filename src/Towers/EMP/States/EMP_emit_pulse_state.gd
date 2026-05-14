extends TowerState
class_name EMPEmitPulseState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
var projectile_speed: int = 200

func enter():
	super()
	handle_animation()
	

	

func handle_animation():
	animation_player.play("emit_pulse")
	await animation_player.animation_finished
	state_machine.change_state("empidlestate")
	
