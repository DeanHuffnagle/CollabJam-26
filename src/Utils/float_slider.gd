extends Resource
class_name FloatSlider

@export_range(-10, 10, 1) var big: int = 0
@export_range(-1, 1, 0.01) var small: float = 1
	
var value: float: 
	get: return small * (2 ** big)
