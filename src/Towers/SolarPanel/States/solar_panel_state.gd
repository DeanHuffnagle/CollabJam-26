extends TowerState

class_name SolarPanelState
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@onready var energySpawner: EnergySpawner = $"../../EnergySpawner"
@onready var hurt_box: HurtBox = $"../../HurtBox"
@export var timer_wait_time: float = 3
var energy_timer: Timer
@export var energy_gain: int = 5


func enter():
	super()
	tower.is_broken = false
	create_timer()
	animation_player.play("idle")
	hurt_box.took_damage.connect(_on_take_damage)
func exit():
	energy_timer.queue_free()
	hurt_box.took_damage.connect(_on_take_damage)
	
func create_timer():
	energy_timer = Timer.new()
	add_child(energy_timer)
	energy_timer.wait_time = timer_wait_time
	energy_timer.timeout.connect(on_timer_timeout)
	energy_timer.start()
	
func on_timer_timeout():
	print("on timer timeout")
	energySpawner.spawn_energy(energy_gain)
	
func _on_take_damage():
	state_machine.change_state("solarpanelbrokenstate")
	
