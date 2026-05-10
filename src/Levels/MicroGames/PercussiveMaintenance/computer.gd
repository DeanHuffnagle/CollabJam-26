extends Node2D

@export var height: int = 0
var size: Vector2:
	get:
		return Vector2i(height, height)

func _ready() -> void:
	# set sizes
	$RigidBody2D/CollisionShape2D.shape.size = size
	$StaticBody2D/CollisionShape2D.shape.size = size * 0.90
	
	# springs
	for i in 4:
		var spring: DampedSpringJoint2D
		spring.length = 1
		spring.stiffness = 64
		spring.damping = 2
		spring.bias = 0.9
		spring.node_a = ^"../../../StaticBody2D"
		spring.node_b = ^"../../../../RigidBody2D"
		spring.position = size.rotated((PI / 2) * i)
		
