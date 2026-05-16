@icon("res://Assets/Icons/bullet.png")
extends CharacterBody2D
class_name Energy

@export var sprite: AnimatedSprite2D
@export var movement_speed: float = 10000
@export var timer_wait_time: float = 1.5
var energy_timer: Timer
var value: int = 1


func _ready():
	add_energy()
	createTimer()

func physics_process(delta: float):
	self.velocity = calculate_movement_vector(delta)
	self.move_and_slide()
	
func calculate_movement_vector(delta):
	var movement_vector: Vector2 = up_direction
	return movement_vector * self.movement_speed * delta

func createTimer():
	energy_timer = Timer.new()
	add_child(energy_timer)
	energy_timer.wait_time = timer_wait_time
	energy_timer.timeout.connect(on_timer_timeout)
	energy_timer.start()
	
func on_timer_timeout():
	self.queue_free()

func add_energy():
	Global.add_energy(self.value)
	
	

	
