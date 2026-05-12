extends EnemyState
class_name EnemyDeathState


@onready var hitBox: HitBox = $"../../HitBox"
@onready var hurt_box: HurtBox = $"../../HurtBox"
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
 
func enter():
	super()
	if animation_player:
		animation_player.play("Death")
	
