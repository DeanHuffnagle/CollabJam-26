extends TowerState
class_name ShieldGeneratorState

@onready var hurt_box: HurtBox = $"../../HurtBox"
@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready  var turret_body: CharacterBody2D = $"../.."
var HP: int = 5

func enter():
	super()
	hurt_box.took_damage.connect(_on_take_damage)
	handle_animation()
	
func exit():
	hurt_box.took_damage.disconnect(_on_take_damage)
	

func handle_animation():
	animation_player.play(str(HP))
	
func _on_take_damage():
		HP -=1
		handle_animation()
		if HP <= 0:
			Global.game_over()
