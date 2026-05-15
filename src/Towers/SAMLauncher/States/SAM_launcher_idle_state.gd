extends TowerState
class_name SAMLauncherIdleState

@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"


func enter():
	super()
	enemy_detection_field.enemy_detected.connect(_on_enemy_detected)
	handle_animation()
	
func _on_enemy_detected(body: Node2D) -> void:
	if tower.is_active:
		state_machine.change_state("samlauncherfiringstate")

func handle_animation():
	var animation_name = ("{rank}_idle".format({"rank":tower.current_rank}))
	animation_player.play(animation_name)
