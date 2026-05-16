@icon("res://Assets/Icons/radar.png")
extends Node
class_name WaveManager



@export var initial_wave_wait_time: float = 30
var game_start_timer: Timer
@onready var spawn_point_collection: SpawnPointCollection = get_tree().get_first_node_in_group("SpawnPointCollection")
@onready var enemy_collection: EnemyCollection = get_tree().get_first_node_in_group("EnemyCollection")
@export var initial_enemy_count: int = 10
@export var base_enemies_added_per_wave: int = 5
@export var wave_enemy_increase_scale: float =  1.5
@export var wave_energy_reward_scale: float = 1.5
@onready var next_wave_size: int = initial_enemy_count
var game_started: bool = false
var current_wave = 0
var spawner_array = []

func _ready():
	createTimer()
	spawner_array = spawn_point_collection.get_children()

func _process(delta: float) -> void:
	if game_started:
		handle_waves()



func createTimer():
	game_start_timer = Timer.new()
	add_child(game_start_timer)
	game_start_timer.wait_time = initial_wave_wait_time
	game_start_timer.timeout.connect(on_timer_timeout)
	game_start_timer.start()
	
func on_timer_timeout():
	game_started = true
	game_start_timer.stop()
	game_start_timer.queue_free()


func handle_waves():
	if enemy_collection.is_empty:
		Global.add_energy(current_wave * wave_energy_reward_scale)
		spawn_wave()
		increase_enemy_count()

func spawn_wave():
	current_wave +=1
	var enemy_count = next_wave_size
	while enemy_count > 0:
		for spawner in spawner_array:
			spawner.spawn()
			enemy_count -=1
		await get_tree().create_timer(0.1).timeout
			
	
	
func increase_enemy_count():
	var scaled_enemy_increase = current_wave * wave_enemy_increase_scale
	var new_wave_size = base_enemies_added_per_wave + scaled_enemy_increase
	next_wave_size += new_wave_size
