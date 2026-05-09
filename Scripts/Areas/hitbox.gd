@icon("res://Assets/Icons/radar.png")
extends Area2D

class_name HitBox

@export var is_projectile: bool = false
@export var is_enemy: bool = false


signal tower_hit(area:HurtBox)
signal enemy_hit(area:HurtBox)
signal damage(amount:float)

func _process(delta: float) -> void:
		for area in get_overlapping_areas():
			if area is HurtBox:
				handle_emit_signal(area)
									
func handle_emit_signal(area: HurtBox):
	if area.is_tower && self.is_enemy:
		emit_signal("tower_hit", area)
	if area.is_enemy && self.is_projectile:
		emit_signal("enemy_hit")
		
func emit_damage_signal(damage_amount: float):
	print("sending damage signal: ", damage_amount)
	emit_signal("damage", damage_amount)
