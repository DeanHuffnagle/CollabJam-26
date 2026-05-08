extends Area2D
class_name HurtBox

@export var is_tower: bool = false
@export var is_enemy: bool = false

signal hit_by_enemy
signal hit_by_projectile

func _ready():
	self.area_entered.connect(on_area_entered)
	self.area_exited.connect(on_area_exited)
									
func on_area_entered(area:Area2D):
	if area is HitBox:
		area.damage.connect(on_take_damage.bind(area))
	
func on_area_exited(area:Area2D):
	if area is HitBox:
		area.damage.disconnect(on_take_damage.bind(area))
	
func on_take_damage(amount:float, area: HitBox):
	if area.is_projectile:
		emit_signal("hit_by_projectile", amount)
	if area.is_enemy:
		emit_signal("hit_by_enemy", amount)
