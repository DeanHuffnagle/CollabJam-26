extends EnemyState
class_name EnemyAttackingState

var target: Tower
var attackTimer: Timer
var can_attack: bool

@onready var hit_box: HitBox = $"../../HitBox"
@onready var hurt_box: HurtBox = $"../../HurtBox"
@export var attackCooldown: float = 5
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
 
func enter():
	super()
	can_attack = true
	createTimer()
	hit_box.tower_hit.connect(on_target_detected)
	hurt_box.took_damage.connect(_on_take_damage)
	hurt_box.hit_by_stun.connect(_on_hit_by_stun)

func exit():
	attackTimer.stop()
	attackTimer.timeout.disconnect(on_timer_timeout)
	attackTimer.queue_free()
	hit_box.tower_hit.disconnect(on_target_detected)
	hurt_box.took_damage.disconnect(_on_take_damage)
	hurt_box.hit_by_stun.disconnect(_on_hit_by_stun)

func update(delta: float):
	rotate_to_face_target(delta)
	if can_attack:
		attack()	
		if target:
			if target.is_broken:
				state_machine.change_state("enemymovingstate")

func on_target_detected(hurtBox):
	target = (hurtBox.get_parent() as Tower)
	
func createTimer():
	attackTimer = Timer.new()
	add_child(attackTimer)
	attackTimer.wait_time = attackCooldown
	attackTimer.timeout.connect(on_timer_timeout)
	attackTimer.start()
	
func on_timer_timeout():
	can_attack = true
	
func attack():
	can_attack = false
	animation_player.play("Attack")
	await animation_player.animation_finished
	animation_player.play("Idle")

func rotate_to_face_target(delta):
	if target:
		var move_vector = enemy.global_position.direction_to(target.global_position)
		var offset_rotation = move_vector.rotated(deg_to_rad(-90))
		enemy.rotation = offset_rotation.angle()
	
func _on_take_damage():
	state_machine.change_state("enemydeathstate")

func _on_hit_by_stun():
	print("on hit by stun")
	state_machine.change_state("enemystunnedstate")
