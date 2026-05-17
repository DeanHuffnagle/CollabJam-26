extends TowerState
class_name LaserTurretFiringState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
@onready var hurt_box: HurtBox = $"../../HurtBox"
var projectile_speed: int = 200

func enter():
	super()
	hurt_box.took_damage.connect(_on_take_damage)
	handle_animation()
	tower.upgraded.connect(_on_upgraded)

func exit():
	hurt_box.took_damage.disconnect(_on_take_damage)
		
func update(delta: float):
	if enemy_detection_field.enemies_present:
		target_enemies()
	else:
		handle_disengage()
	

func handle_animation():
	var animation_name = ("{rank}_barrel_fire".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)

func handle_disengage():
	state_machine.change_state("laserturretidlestate")
	
func target_enemies():
	if enemy_detection_field.enemies_present:
		var target = enemy_detection_field.enemy_array.pick_random()
		var rotation = tower.global_position.direction_to(target.global_position)
		tower.global_rotation = rotation.angle()
	
func _on_take_damage():
	state_machine.change_state("laserturretbrokenstate")
	
func _on_upgraded():
	handle_animation()
	
