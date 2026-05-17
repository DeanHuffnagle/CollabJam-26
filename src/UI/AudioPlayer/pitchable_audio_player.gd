extends AudioStreamPlayer2D
class_name PitchableAudioPlayer2D

@export var max_pitch_scale: float = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func increase_pitch(amount: float):
	var new_pitch_scale = self.pitch_scale + amount
	if  new_pitch_scale > max_pitch_scale:
		self.max_pitch_scale = max_pitch_scale
	else: 
		self.pitch_scale = new_pitch_scale
