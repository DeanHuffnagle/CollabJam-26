extends GPUParticles2D

class_name ComputerSparks

const PARTICLE_MATERIAL: ParticleProcessMaterial = preload("res://src/Levels/MicroGames/PercussiveMaintenance/sparks_material.tres")

static func from_player_hit(pos: Vector2, vel: Vector2):
	var obj: GPUParticles2D = GPUParticles2D.new()
	# update phsics materials
	obj.process_material = PARTICLE_MATERIAL.duplicate()
	obj.process_material.direction = Vector3(vel.x, vel.y, 0)
	
	# update object 
	obj.amount = 64
	obj.one_shot = true
	obj.explosiveness = 1
	
		
	# kill of finish
	obj.position = pos
	obj.finished.connect(obj.queue_free)
	
	return obj
