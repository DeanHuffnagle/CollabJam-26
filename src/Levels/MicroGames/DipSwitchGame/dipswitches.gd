extends HBoxContainer

func _ready():
	for i in range (get_parent().get_parent().get("dipswitchArray").size()):
		if get_parent().get_parent().get("dipswitchArray")[i-1] == 1:
			get_child(i).button_pressed = true
