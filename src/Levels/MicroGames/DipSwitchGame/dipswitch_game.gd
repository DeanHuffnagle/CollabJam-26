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
	
	for i in range (dipswitchArray.size()):
		if dipswitchArray[i] == 1:
			get_node("DipswitchLayout/Dipswitches/Dipswitch" + str(i + 1)).button_pressed = true
			
	for i in range (answerArray.size()):
		if answerArray[i] == 1:
			get_node("DipswitchLayout/Answer/Answer" + str(i + 1)).button_pressed = true
		
		
func _process(_delta):
	for i in range (dipswitchArray.size()):
		if get_node("DipswitchLayout/Dipswitches/Dipswitch" + str(i + 1)).button_pressed == true:
			dipswitchArray[i] = 1
		else:
			dipswitchArray[i] = 0
			
	if answerArray == dipswitchArray:
		answerArray.clear()
		dipswitchArray.clear()
		ended.emit()		

func generateConfiguration(array, length):
	for i in range (length):
		array.push_back(randi_range(0,1))
