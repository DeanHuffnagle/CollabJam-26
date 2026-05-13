extends CharacterBody2D
class_name Enemy
@export var move_speed = 2000
@onready var hurt_box: HurtBox = $HurtBox
@onready var hit_box: HitBox = $HitBox
@onready var animation_player: AnimationPlayer = $Visuals/AnimationPlayer
