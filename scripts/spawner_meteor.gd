extends Node

const meteors = [
	preload("res://scenes/small_meteor.tscn"),
	preload("res://scenes/big_meteor.tscn")
]

func _ready():
	yield(utils.create_timer(5), "timeout")
	spawn()
	pass

func spawn():
	while true:
		randomize()
		
		var meteor = utils.choose(meteors).instance()
		var mt_pos = Vector2()
		mt_pos.x   = rand_range(0+16, utils.view_size.x-16)
		mt_pos.y   = 0-16
		meteor.position = mt_pos
		$container.add_child(meteor)
		yield(Functions.yield_wait(rand_range(2, 2.5), self), "completed")
	pass
