extends TowerState
class_name LaserTurretIdleState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
@onready var hurt_box: HurtBox = $"../../HurtBox"
func enter():
	super()
	enemy_detection_field.enemy_detected.connect(_on_enemy_detected)
	hurt_box.took_damage.connect(_on_take_damage)
	handle_animation()
	
func exit():
	enemy_detection_field.enemy_detected.disconnect(_on_enemy_detected)
	hurt_box.took_damage.disconnect(_on_take_damage)
	
func _on_enemy_detected(body: Node2D) -> void:
	if tower.is_active:
		state_machine.change_state("laserturretfiringstate")

func handle_animation():
	var animation_name = ("{rank}_barrel_idle".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)

func _on_take_damage():
	state_machine.change_state("laserturretbrokenstate")
