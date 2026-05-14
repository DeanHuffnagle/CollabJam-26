extends State

class_name EMPPulseState

@onready var hit_box: HitBox = $"../../HitBox"
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"

func enter():
	hit_box.enemy_hit.connect(on_enemy_hit)
	animation_player.play("Pulse")
	
func exit():
	hit_box.enemy_hit.disconnect(on_enemy_hit)

func on_enemy_hit(area):
	hit_box.emit_stun_signal()


	
