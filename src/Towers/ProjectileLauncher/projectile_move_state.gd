extends State

class_name ProjectileMoveState

@export var projectile: Projectile
@onready var anim: AnimatedSprite2D = $"../../AnimatedSprite2D"

func enter():
	print("enter running")
	projectile.hit_box.enemy_hit.connect(on_enemy_hit)
	anim.play("default")
	
	
func exit():
	#projectile.hit_box.enemy_hit.disconnect(on_enemy_hit)
	pass

func physics_update(delta: float):
	projectile.velocity = calculate_movement_vector(delta)
	projectile.move_and_slide()
	
func calculate_movement_vector(delta):
	var movement_vector: Vector2 = projectile.direction
	return movement_vector * projectile.movement_speed * delta
	
func on_enemy_hit(area):
	projectile.hit_box.emit_damage_signal()
	projectile.queue_free()
	projectile.tower.killed_enemy.emit()

	
