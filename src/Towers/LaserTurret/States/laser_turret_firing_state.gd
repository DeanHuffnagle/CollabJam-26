extends TowerState
class_name LaserTurretFiringState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
var projectile_speed: int = 200

func enter():
	super()
	enemy_detection_field.enemy_detected.connect(_on_enemy_detected)
	handle_animation()
	
func update(delta: float):
	if enemy_detection_field.enemies_present:
		target_enemies()
	else:
		handle_disengage()
	
func _on_enemy_detected(body: Node2D) -> void:
	state_machine.change_state("laserturretfiringstate")

func handle_animation():
	var animation_name = ("{rank}_barrel_fire".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)

func handle_disengage():
	state_machine.change_state("laserturretidlestate")
	
func target_enemies():
	if enemy_detection_field.enemies_present:
		var target = enemy_detection_field.enemy_array.pick_random()
		var rotation = tower.global_position.direction_to(target.global_position)
		tower.rotation = rotation.angle()
	
