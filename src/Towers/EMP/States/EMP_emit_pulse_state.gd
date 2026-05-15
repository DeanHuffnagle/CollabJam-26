extends TowerState
class_name EMPEmitPulseState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
@onready var hurt_box: HurtBox = $"../../HurtBox"
var projectile_speed: int = 200

func enter():
	super()
	hurt_box.took_damage.connect(_on_take_damage)
	handle_animation()
	
func exit():
	hurt_box.took_damage.disconnect(_on_take_damage)

func handle_animation():
	animation_player.play("emit_pulse")
	await animation_player.animation_finished
	state_machine.change_state("empidlestate")
	
func _on_take_damage():
	state_machine.change_state("empbrokenstate")
