extends State

class_name SolarPanelBrokenState
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@onready var energySpawner: EnergySpawner = $"../../EnergySpawner"
@export var timer_wait_time: float = 3
var energy_timer: Timer


func enter():
	animation_player.play("broken")
	

func repair():
	state_machine.change_state("solarpanelstate")
	
