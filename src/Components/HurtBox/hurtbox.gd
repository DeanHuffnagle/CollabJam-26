@icon("res://Assets/Icons/radar.png")
extends Area2D
class_name HurtBox

@onready var parent: CharacterBody2D = $".."
var is_tower: bool = false
var is_enemy: bool = false
signal took_damage(amount:float)
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
	
func on_area_exited(area:Area2D):
	if area is HitBox:
		area.damage.disconnect(on_take_damage.bind(area))
	
func on_take_damage(amount:float, area: HitBox):
	if area.is_projectile && self.is_enemy:
		emit_signal("took_damage", amount)
	if area.is_enemy && self.is_tower:
		emit_signal("took_damage", amount)
