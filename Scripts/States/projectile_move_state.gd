extends State

class_name ProjectileMoveState

@export var projectile: Projectile

func enter():
	print("enter running")
	projectile.hit_box.enemy_hit.connect(on_enemy_hit)
	
func exit():
	#projectile.hit_box.enemy_hit.disconnect(on_enemy_hit)
	pass

func physics_update(delta: float):
	projectile.velocity = calculate_movement_vector(delta)
	projectile.move_and_slide()
	
func calculate_movement_vector(delta):
	var movement_vector: Vector2 = projectile.direction
	return movement_vector * projectile.movement_speed * delta
	
func on_enemy_hit():
	projectile.hit_box.emit_damage_signal(projectile.damage)
	projectile.queue_free()

	
