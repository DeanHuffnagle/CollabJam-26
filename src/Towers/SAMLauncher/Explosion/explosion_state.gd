extends State

class_name ExplosionState

@onready var hit_box: HitBox = $"../../HitBox"
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@onready var explosion:AreaOfEffect = $"../.."
func enter():
	hit_box.enemy_hit.connect(on_enemy_hit)
	animation_player.play("explosion")
	
func exit():
	hit_box.enemy_hit.disconnect(on_enemy_hit)

func on_enemy_hit(area):
	hit_box.emit_damage_signal()
	explosion.tower.killed_enemy.emit()


	
