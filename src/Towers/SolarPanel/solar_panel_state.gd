extends State

class_name SolarPanelState
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@onready var energySpawner: EnergySpawner = $"../../EnergySpawner"
@export var timer_wait_time: float = 3
var energy_timer: Timer


func enter():
	create_timer()
	animation_player.play("idle")
	
func exit():
	energy_timer.queue_free()
	
func create_timer():
	energy_timer = Timer.new()
	add_child(energy_timer)
	energy_timer.wait_time = timer_wait_time
	energy_timer.timeout.connect(on_timer_timeout)
	energy_timer.start()
	
func on_timer_timeout():
	print("on timer timeout")
	energySpawner.spawn_energy()
	
