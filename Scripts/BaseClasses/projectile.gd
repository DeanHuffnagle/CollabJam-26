@icon("res://Assets/Icons/bullet.png")
extends Area2D
class_name Projectile

@export var sprite: AnimatedSprite2D

func _ready():
	sprite.play("default")
