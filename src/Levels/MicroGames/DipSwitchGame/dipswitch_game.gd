extends MicroGame

var answerArray: Array[int]
var dipswitchArray: Array[int]
@export var switchCount: int

func _ready():
	generateConfiguration(answerArray, switchCount)
	while dipswitchArray != answerArray:
		generateConfiguration(dipswitchArray, switchCount)
		
func _update():
	if answerArray == dipswitchArray:
		ended.emit()		

func generateConfiguration(array, length):
	for i in range (length):
		array.push_back(randi_range(0,1))
