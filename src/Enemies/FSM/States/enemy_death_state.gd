extends EnemyState
class_name EnemyDeathState


@onready var hitBox: HitBox = $"../../HitBox"
@onready var hurt_box: HurtBox = $"../../HurtBox"
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
 
func enter():
	super()
	(hurt_box.get_child(0) as CollisionShape2D).disabled = true
	if animation_player:
		animation_player.play("Death")
	
