extends Control

const MICROGAMES: Array[String] = [
	"waiting_for_godot"
]

func on_microgame_start():
	# Select microgame
	var microgame_name: String = MICROGAMES.pick_random()
	var microgame: MicroGame = load(
		"res://Scenes/Levels/MicroGames/" + microgame_name + ".tscn"
	).instantiate()
	
	# Connect player win condition
	microgame.ended.connect(on_microgame_end.bind(microgame))
	
	# Add to scene tree
	$SubViewportContainer.show()
	$SubViewportContainer/SubViewport.add_child(microgame)
	
	# Show container
	visible = true
	
func on_microgame_end(microgame: MicroGame):
	$SubViewportContainer.hide()
	microgame.queue_free()
	
