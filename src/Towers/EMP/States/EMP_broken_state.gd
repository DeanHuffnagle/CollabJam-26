extends TowerState
class_name EMPBrokenState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."

func enter():
	super()
	handle_animation()

func handle_animation():
	animation_player.play("broken")


func repair():
	state_machine.change_state("empidlestate")
