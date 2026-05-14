extends Node

const GAMES: Array[String] = [
	"res://src/Levels/MicroGames/WaitingForGodot/waiting_for_godot.tscn",
	"res://src/Levels/MicroGames/DipSwitchGame/dipswitch_game.tscn"
]

const window_scene: PackedScene = preload(
	"res://src/Levels/MicroGames/Manager/MicroGameWindow/microgame_window.tscn"
)

signal micro_game_start(micro_game: MicroGameWindow)

func _on_game_start() -> void:
	var microgame: MicroGame = select_microgame()
	var window: MicroGameWindow = intialise_window(microgame)
	
	micro_game_start.emit(window)
	
func select_microgame() -> MicroGame:
	return load(GAMES.pick_random()).instantiate()

func intialise_window(microgame: MicroGame) -> MicroGameWindow:
	var window: MicroGameWindow = window_scene.instantiate()
	window.set_microgame(microgame)
	
	var handler_function: Callable = _on_game_end.bind(window)
	microgame.ended.connect(handler_function)
	
	return window

func _on_game_end(microgame_window: MicroGameWindow) -> void:
	microgame_window.queue_free()
	
	
	
