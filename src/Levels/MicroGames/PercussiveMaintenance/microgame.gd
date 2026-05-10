extends Node2D

@export var shake_force: FloatSlider
@export var gradient: GradientTexture1D

@onready var collision_object: RigidBody2D = $Computer/RigidBody2D

var goal: Vector2

var debug_arrow: PackedScene = load($Area2D.d)

func _ready() -> void:
	collision_object.mouse_entered.connect(_on_computer_mouse_entered)
	set_goal()

func set_goal():
	$XPath/PathFollow2D.progress_ratio = randf() 
	$YPath/PathFollow2D.progress_ratio = randf() 

	goal = Vector2(
		$XPath/PathFollow2D.position.x,
		$YPath/PathFollow2D.position.y
	)
	
	

func _on_computer_mouse_entered() -> void:
	var mouse_v = Input.get_last_mouse_velocity()
	var mouse_p = get_viewport().get_mouse_position()
	
	var vector = Area2D.new()
	
	
	collision_object.apply_force(mouse_v, mouse_p)
	
	var goal_distance: int = ((mouse_p + mouse_v) /  - goal).length()
	var colour
	var height = $Computer/RigidBody2D/CollisionShape2D.shape.size.x * 4
	if goal_distance > height:
		colour = gradient.gradient.sample(1)
	else:
		colour = gradient.gradient.sample(goal_distance / height)
	
	$ColorRect.color = colour
	print_debug("mouse hit ", mouse_v) # Replace with function body.
	print_debug("distance to goal ",  goal_distance)
