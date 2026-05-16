extends State

class_name TowerBaseLightState
@onready var animation_player: AnimationPlayer = $"../../Visuals/AnimationPlayer"
@onready var tower_base: TowerBase = $"../.."
var lights: int
var previous_lights = 0


func enter():
	lights = 0
	animation_player.play("light_idle_0")
	
func exit():
	# Use this to cleanup any variables that you set during the time this state was active.
	pass	

func update(delta: float):
	lights = tower_base.kill_count / 10
	if previous_lights != lights:
		previous_lights = lights
		handle_animation()
	
func handle_animation():
	var transition_animation_name = ("light_transition_{light_no}".format({"light_no":lights}))
	var idle_animation_name = ("light_idle{light_no}".format({"light_no":lights}))
	animation_player.play(transition_animation_name)
	await animation_player.animation_finished
	animation_player.play(idle_animation_name)

	
	
