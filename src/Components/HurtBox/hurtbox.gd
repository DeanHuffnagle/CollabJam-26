@icon("res://Assets/Icons/radar.png")
extends Area2D
class_name HurtBox

@onready var parent: CharacterBody2D = $".."
var is_tower: bool = false
var is_enemy: bool = false
signal took_damage
signal hit_by_stun

func _ready():
	self.area_entered.connect(on_area_entered)
	self.area_exited.connect(on_area_exited)
	if parent is Enemy: 
		is_enemy = true
	if parent is Tower:
		is_tower = true
									
func on_area_entered(area:Area2D):
	if area is HitBox:
		area.damage.connect(on_take_damage.bind(area))
		area.stun.connect(on_hit_by_stun)
	
	
func on_area_exited(area:Area2D):
	if area is HitBox:
		area.damage.disconnect(on_take_damage.bind(area))
		area.stun.disconnect(on_hit_by_stun)
	
func on_take_damage(area: HitBox):
	print("on_take_damage called, is_projectile: ", area.is_projectile, " is_enemy: ", area.is_enemy, " self.is_enemy: ", self.is_enemy, " self.is_tower: ", self.is_tower)
	if self.is_enemy:
		if area.is_area_of_effect || area.is_projectile:
			emit_signal("took_damage")
	if area.is_enemy && self.is_tower:
		emit_signal("took_damage")

func on_hit_by_stun():
		emit_signal("hit_by_stun")
