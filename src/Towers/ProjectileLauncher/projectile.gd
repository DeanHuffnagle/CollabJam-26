@icon("res://Assets/Icons/bullet.png")
extends CharacterBody2D
class_name Projectile


@export var sprite: AnimatedSprite2D
@export var hit_box: HitBox
@export var direction: Vector2
@export var damage: float = 10
@export var movement_speed: float = 10000
signal enemy_killed
var tower: Tower

func _ready() -> void:
	get_tree().create_timer(5.0).timeout.connect(self.queue_free)
