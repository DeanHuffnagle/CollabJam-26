extends HBoxContainer
var dipswitch: CheckBox
var checkBoxArray: Array
func _ready():
	for i in range (get_parent().dipswitchArray.count):
		checkBoxArray.push_back(add_child(dipswitch))
		if get_parent().dipswitchArray[i-1] == 1:
			checkboxArray[i-1].button_pressed = true
