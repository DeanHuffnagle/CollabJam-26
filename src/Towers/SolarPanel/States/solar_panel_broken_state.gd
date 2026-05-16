extends TowerState

class_name SolarPanelBrokenState
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@onready var energySpawner: EnergySpawner = $"../../EnergySpawner"
@export var timer_wait_time: float = 3
var energy_timer: Timer


func enter():
	super()
	tower.is_broken = true
	animation_player.play("broken")
	

func repair():
	state_machine.change_state("solarpanelstate")
	
