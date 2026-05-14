@icon("res://Assets/Icons/radar.png")
extends Area2D

class_name HitBox
@onready var parent: CharacterBody2D = $".."
var is_projectile: bool = false
var is_enemy: bool = false
var is_area_of_effect: bool = false
signal tower_hit(area:HurtBox)
signal enemy_hit(area:HurtBox)
signal damage
signal stun

func _ready():
	print("HitBox parent is: ", parent)
	if parent is Enemy: 
		is_enemy = true
	if parent is Projectile:
		is_projectile = true
	if parent is AreaOfEffect:
		is_area_of_effect = true

func _process(delta: float) -> void:
		for area in get_overlapping_areas():
			if area is HurtBox:
				handle_emit_signal(area)
									
func handle_emit_signal(area: HurtBox):
	if area.is_tower:
		emit_signal("tower_hit", area)
	if area.is_enemy:
		emit_signal("enemy_hit", area)
		

func emit_damage_signal():
	emit_signal("damage")
	
func emit_stun_signal():
	emit_signal("stun")
