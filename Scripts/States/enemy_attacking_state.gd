extends State

class_name EnemyAttackingState
var target: Node2D
var attackTimer: Timer
var canAttack: bool
@export var enemy: CharacterBody2D
@export var hitBox: HitBox
@export var attackCooldown: float

func enter():
	print("entering attacking state")
	createTimer()
	hitBox.target_detected.connect(on_target_detected.bind(hitBox))

func exit():
	attackTimer.stop()
	attackTimer.timeout.disconnect(on_timer_timeout)
	attackTimer.queue_free()

func update(delta: float):
	if canAttack:
		attack()	

func on_target_detected(hurtBox, hitBox):
	target = hurtBox.get_parent()
	
func createTimer():
	attackTimer = Timer.new()
	add_child(attackTimer)
	attackTimer.wait_time = attackCooldown
	attackTimer.timeout.connect(on_timer_timeout)
	attackTimer.start()
	
func on_timer_timeout():
	canAttack = true
	
func attack():
	print("Attacking " + str(target))
	canAttack = false
