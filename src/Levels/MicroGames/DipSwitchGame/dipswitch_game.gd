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
		get_node("DipswitchLayout/Dipswitches/Dipswitch" + str(i + 1)).connect("pressed", playClick)
	
	for i in range (dipswitchArray.size()):
		if dipswitchArray[i] == 1:
			get_node("DipswitchLayout/Dipswitches/Dipswitch" + str(i + 1)).button_pressed = true
			
	for i in range (answerArray.size()):
		get_node("DipswitchLayout/Answers/Answer" + str(i+1)).frame = randi_range(1,8)
		if answerArray[i] == 1:
			get_node("DipswitchLayout/Answers/Answer" + str(i+1)).position.y = 6
		
		
func _process(_delta):
	for i in range (dipswitchArray.size()):
		if get_node("DipswitchLayout/Dipswitches/Dipswitch" + str(i + 1)).button_pressed == true:
			dipswitchArray[i] = 1
		else:
			dipswitchArray[i] = 0

	if answerArray == dipswitchArray:
		answerArray.clear()
		dipswitchArray.clear()
		for i in range (answerArray.size()):
			get_node("DipswitchLayout/Answers/Answer" + str(i+1)).frame = 8
			get_node("DipswitchLayout/Answers/Answer" + str(i+1)).position.y = 35
		ended.emit()		

func generateConfiguration(array, length):
	for i in range (length):
		array.push_back(randi_range(0,1))

func playClick()->void:
	$SFX/ButtonSound.play()
