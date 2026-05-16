extends TowerState
class_name SAMLauncherFiringState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
@onready var hurt_box: HurtBox = $"../../HurtBox"
var projectile_speed: int = 200
var is_reloading = false

func enter():
	super()
	hurt_box.took_damage.connect(_on_take_damage)

func exit():
	hurt_box.took_damage.disconnect(_on_take_damage)	
func update(delta: float):
	if enemy_detection_field.enemies_present:
		if not is_reloading:
			target_enemies()
			fire()
	else:
		handle_disengage()
	

func fire():
	is_reloading = true
	var animation_name = ("{rank}_fire".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)
	await animation_player.animation_finished
	is_reloading = false
	

func handle_disengage():
	if not is_reloading:
		state_machine.change_state("samlauncheridlestate")
	
func target_enemies():
		if enemy_detection_field.enemies_present:
			var target = enemy_detection_field.enemy_array.pick_random()
			var rotation = tower.global_position.direction_to(target.global_position)
			tower.global_rotation = rotation.angle()
	
	
func _on_take_damage():
	state_machine.change_state("samlauncherbrokenstate")
