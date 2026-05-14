extends MicroGame

var answerArray: Array[int]
var dipswitchArray: Array[int]
@export var switchCount: int

func _ready():
	generateConfiguration(answerArray, switchCount)
	generateConfiguration(dipswitchArray, switchCount)
	while dipswitchArray == answerArray:
		dipswitchArray.clear()
		generateConfiguration(dipswitchArray, switchCount)
	print(answerArray)
	print(dipswitchArray)
	
	for i in range (dipswitchArray.size() - 1):
		if dipswitchArray[i] == 1:
			get_node("DipswitchLayout/Dipswitches/Dipswitch" + str(i + 1)).button_pressed = true
			
	for i in range (answerArray.size() - 1):
		if answerArray[i] == 1:
			get_node("DipswitchLayout/Answer/Answer" + str(i + 1)).button_pressed = true
		
		
func _update():
	if answerArray == dipswitchArray:
		ended.emit()		

func generateConfiguration(array, length):
	for i in range (length):
		array.push_back(randi_range(0,1))
