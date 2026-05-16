extends TowerState
class_name SAMLauncherBrokenState

@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"


func enter():
	super()
	tower.is_broken = true
	handle_animation()
	
func handle_animation():
	var animation_name = ("{rank}_broken".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)

func repair():
	state_machine.change_state("samlauncheridlestate")
