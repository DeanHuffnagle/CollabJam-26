extends TowerState
class_name EMPIdleState


@onready var animation_player = $"../../Visuals/AnimationPlayer"
@onready  var enemy_detection_field: EnemyDetectionField = $"../../EnemyDetectionField"
@onready var turret_body: CharacterBody2D = $"../.."
@export var pulse_cooldown: float = 5
var can_emit_pulse = false
var pulse_timer: Timer

func enter():
	can_emit_pulse = false
	super()
	create_timer()
	enemy_detection_field.enemy_detected.connect(_on_enemy_detected)
	handle_animation()
	
func exit():
	pulse_timer.queue_free()
	enemy_detection_field.enemy_detected.disconnect(_on_enemy_detected)
	can_emit_pulse = false
		
	
func _on_enemy_detected(body: Node2D) -> void:
	if tower.is_active && can_emit_pulse:
		state_machine.change_state("empemitpulsestate")

func handle_animation():
	animation_player.play("default")

func create_timer():
	pulse_timer = Timer.new()
	add_child(pulse_timer)
	pulse_timer.wait_time = pulse_cooldown
	pulse_timer.timeout.connect(on_timer_timeout)
	pulse_timer.start()
	
func on_timer_timeout():
	print("on timer timeout")
	can_emit_pulse = true
	

	
