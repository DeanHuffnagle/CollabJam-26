extends EnemyState
class_name EnemyMovingState

var target: Node2D
@onready var hit_box: HitBox = $"../../HitBox"
@onready var hurt_box: HurtBox = $"../../HurtBox"
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
var move_speed: float



func enter():
	super()
	move_speed = enemy.move_speed
	hit_box.tower_hit.connect(_on_target_detected)
	hurt_box.took_damage.connect(_on_take_damage)
	target = pick_target()
	animation_player.play("Idle")

func exit():
	hit_box.tower_hit.disconnect(_on_target_detected)
	hurt_box.took_damage.disconnect(_on_take_damage)
	target = null
	
func physics_update(delta: float):
	if !target:
		target = pick_target()
	rotate_to_face_target(delta)
	move_to_target(delta)

	
func _on_target_detected(hurtBox):
	state_machine.change_state("enemyattackingstate")
	
func pick_target() -> Tower:
	return get_tree().get_nodes_in_group("Towers").pick_random() as Tower

func rotate_to_face_target(delta):
	var move_vector = enemy.global_position.direction_to(target.global_position)
	var offset_rotation = move_vector.rotated(deg_to_rad(-90))
	enemy.rotation = offset_rotation.angle()
	
func move_to_target(delta):
	var move_vector = enemy.global_position.direction_to(target.global_position)
	enemy.velocity = move_vector * enemy.move_speed * delta
	enemy.move_and_slide()
	
func _on_take_damage():
	state_machine.change_state("enemydeathstate")
	
		
