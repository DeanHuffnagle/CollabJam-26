extends Node2D

signal player_hit(player_distance: float)

const START_ANGLE: float = -(3 * PI / 4)
const TURN: float = PI / 2

@export var cosmetic_sensitivity: FloatSlider
@export var hit_sensitivity: FloatSlider
@export var goal: Vector2

@onready var size = %Shape.shape.size
@onready var sprite = $RigidBody2D/Face
@onready var screen = $RigidBody2D/Screen
@onready var timer = $RigidBody2D/Face/Timer

func _ready() -> void:
	set_goal()
	debug_arrow(Vector2.ZERO, goal, Color.BLUE)

func set_goal():
	var corner: Vector2 = size / 2.5
	goal = Vector2(
		randf() * corner.x, # randomise X
		randf() * corner.y # randomise y
		).rotated(PI / 2 * randi_range(0, 4))

func _on_rigid_body_2d_mouse_entered() -> void:
	var mouse_velocity = Input.get_last_mouse_screen_velocity()
	var mouse_position = get_local_mouse_position()
	# Orthogonally lock mouse velocity
	var smack_direction =  get_force_direction(mouse_position.angle_to_point(to_local(position)))
	var smack_vector = smack_direction * mouse_velocity.length() 
	
	debug_arrow(mouse_position, mouse_position + (smack_vector * hit_sensitivity.value), Color.GREEN)
	
	$RigidBody2D.apply_impulse(smack_vector * cosmetic_sensitivity.value, mouse_position)
	var player_position = mouse_position + (smack_vector * hit_sensitivity.value)
	handle_particles(player_position, smack_vector)
	var player_distance = (player_position - goal).length()
	player_hit.emit(player_distance / (size / 2).length())

func get_force_direction(angle: float):
	for i in 4:
		if (START_ANGLE + (TURN * i)) < angle and angle <= (START_ANGLE + (TURN * (i + 1))):
			return Vector2.from_angle((i - 1) * PI / 2)
	return Vector2.from_angle(-PI)

func handle_particles(target_position: Vector2, direction: Vector2):
	var clamped_target = Vector2(clamp(target_position,- size / 2, size / 2))
	var particles = ComputerSparks.from_player_hit(clamped_target, direction)

	add_child(particles)

	
func animate(animation: String):
	sprite.play(animation) 
	timer.start()

func reset_animation():
	if sprite.animation == "win":
		return
	sprite.animation = "default"
	sprite.pause()

func debug_arrow(start: Vector2, end: Vector2, color: Color) -> Area2D:
	var arrow_shape = CollisionShape2D.new()
	arrow_shape.shape = SeparationRayShape2D.new()
	arrow_shape.shape.length = (end - start).length()
	
	arrow_shape.debug_color = color
	# print(start, " to ", end)
	
	var arrow_collider = Area2D.new()
	arrow_collider.add_child(arrow_shape)
	arrow_collider.position = start
	arrow_collider.rotation = (start - end).angle() + (PI / 2)
		
	add_child(arrow_collider)
	
	return arrow_collider
