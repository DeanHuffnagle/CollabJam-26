extends TowerState
class_name LaserTurretBrokenState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
@onready var hurt_box: HurtBox = $"../../HurtBox"
func enter():
	super()
	handle_animation()

func handle_animation():
	var animation_name = ("{rank}_barrel_broken".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)
	
func repair():
	state_machine.change_state("laserturretidlestate")
