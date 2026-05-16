extends TowerState
class_name EMPBrokenState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."

func enter():
	super()
	tower.is_broken = true
	handle_animation()

func handle_animation():
	animation_player.play("broken")


func repair():
	tower.is_broken = false
	state_machine.change_state("empidlestate")
