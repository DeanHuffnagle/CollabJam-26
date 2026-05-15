extends State

class_name MissileMoveState

@export var projectile: Projectile
@onready var anim: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var AOE_emitter: AreaOfEffectEmitter = $"../../AreaOfEffectEmitter"

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
	var wobble = randf_range(-0.5, 0.5)
	var movement_vector: Vector2 = projectile.direction.rotated(wobble)
	return movement_vector * projectile.movement_speed * delta
	
func on_enemy_hit(area):
	AOE_emitter.emit_area_of_effect()
	projectile.queue_free()

	
