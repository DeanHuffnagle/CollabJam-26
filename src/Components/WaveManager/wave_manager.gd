@icon("res://Assets/Icons/radar.png")
extends Node
class_name WaveManager
@onready var audio: PitchableAudioPlayer2D =$"../Audio/PitchableAudioPlayer2D"
@export var initial_wave_wait_time: float = 30.0
@export var initial_enemy_count: int = 10
@export var base_enemies_added_per_wave: int = 5
@export var wave_enemy_increase_scale: float = 1.5
@export var wave_energy_reward_scale: float = 1.5
@export var spawn_interval: float = 0.1
@export var max_wave_size = 150
@onready var spawn_point_collection: SpawnPointCollection = get_tree().get_first_node_in_group("SpawnPointCollection")
@onready var enemy_collection: EnemyCollection = get_tree().get_first_node_in_group("EnemyCollection")
@export var enemy_move_speed_increment: int = 10

var max_enemies_achieved: bool = false
var current_wave: int = 0
var next_wave_size: int = 0
var spawn_queue: int = 0
var is_spawning: bool = false
var spawner_array: Array = []

var game_start_timer: Timer
var spawn_timer: Timer


func _ready() -> void:
	next_wave_size = initial_enemy_count
	spawner_array = spawn_point_collection.get_children()
	enemy_collection.is_empty.connect(_on_enemies_cleared)
	_create_spawn_timer()
	_create_game_start_timer()


func _create_game_start_timer() -> void:
	game_start_timer = Timer.new()
	game_start_timer.one_shot = true
	game_start_timer.wait_time = initial_wave_wait_time
	game_start_timer.timeout.connect(_on_game_start_timer_timeout)
	add_child(game_start_timer)
	game_start_timer.start()


func _create_spawn_timer() -> void:
	spawn_timer = Timer.new()
	spawn_timer.wait_time = spawn_interval
	spawn_timer.timeout.connect(_on_spawn_tick)
	add_child(spawn_timer)


func _on_game_start_timer_timeout() -> void:
	game_start_timer.queue_free()
	_on_enemies_cleared()


func _on_enemies_cleared() -> void:
	if is_spawning:
		return
	Global.add_energy(current_wave * wave_energy_reward_scale)
	if current_wave % 5 == 0 || max_enemies_achieved:
		Global.increase_enemy_move_speed(enemy_move_speed_increment)
	audio.increase_pitch(0.01)	
	_start_wave()


func _start_wave() -> void:
	current_wave += 1
	spawn_queue = next_wave_size
	is_spawning = true
	spawn_timer.start()
	if not max_enemies_achieved:
		_increase_enemy_count()


func _on_spawn_tick() -> void:
	if spawn_queue <= 0:
		spawn_timer.stop()
		is_spawning = false
		if enemy_collection.get_child_count() == 0:
			_on_enemies_cleared()
		return

	for spawner in spawner_array:
		if spawn_queue <= 0:
			break
		spawner.spawn()
		spawn_queue -= 1


func _increase_enemy_count() -> void:
	var scaled_increase: float = current_wave * wave_enemy_increase_scale
	next_wave_size += base_enemies_added_per_wave + int(scaled_increase)
	if next_wave_size > max_wave_size:
		next_wave_size = max_wave_size
		max_enemies_achieved = true
		
