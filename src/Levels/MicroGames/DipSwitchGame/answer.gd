extends HBoxContainer

func _ready():
	for i in range (get_parent().get_parent().get("answerArray").size()):
		if get_parent().get_parent().get("answerArray")[i-1] == 1:
			get_child(i).button_pressed = true
