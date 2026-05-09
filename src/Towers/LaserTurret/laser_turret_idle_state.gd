extends State


# Called when the node enters the scene tree for the first time.
class_name LaserTurretIdleState

@export var enemy_detect_area: Area2D
@export var turret_body: CharacterBody2D
@export var rotation_speed: float = 100

func enter():
	print("entering eidle state")
	enemy_detect_area.connect("body_entered",_on_enemy_detection_body_entered)
	
	
func physics_update(delta: float):
	turret_body.rotate(deg_to_rad(rotation_speed*delta))
	
func handle_input(event: InputEvent):
	print(event)
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.change_state("examplestate")
		
func _on_enemy_detection_body_entered(body: Node2D) -> void:
	print(body)
