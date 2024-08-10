extends Node

const enemies = [
	preload("res://scenes/enemy_kamikaze.tscn"),
	preload("res://scenes/enemy_clever.tscn")
]

func _ready():
	yield(Functions.yield_wait(1.0, self), "completed")
	spawn()
	pass

func spawn():
	while true:
		randomize()
		
		var enemy = utils.choose(enemies).instance()
		var enm_pos = Vector2()
		enm_pos.x   = rand_range(0+16, utils.view_size.x-16)
		enm_pos.y   = 0-16
		enemy.position = enm_pos
		$container.add_child(enemy)

		if(is_instance_valid(self)): 
			yield(utils.create_timer(rand_range(0.5, 1.25)), "timeout")
	pass
