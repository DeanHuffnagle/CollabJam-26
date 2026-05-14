extends EnemyState
class_name EnemyStunnedState


@onready var hitBox: HitBox = $"../../HitBox"
@onready var hurt_box: HurtBox = $"../../HurtBox"
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@export var stun_time: float = 5
var stun_timer: Timer

func enter():
	print("stunned state enter")
	super()
	create_timer()
	hurt_box.took_damage.connect(_on_take_damage)
	animation_player.play("Stunned")

func exit():
	stun_timer.stop()
	stun_timer.timeout.disconnect(on_timer_timeout)
	stun_timer.queue_free()
	hurt_box.took_damage.disconnect(_on_take_damage)
	
	
	
func _on_take_damage():
	state_machine.change_state("enemydeathstate")
	
	
func create_timer():
	stun_timer = Timer.new()
	add_child(stun_timer)
	stun_timer.wait_time = stun_time
	stun_timer.timeout.connect(on_timer_timeout)
	stun_timer.start()
	
	
func on_timer_timeout():
	state_machine.change_state("enemymovingstate")
	
