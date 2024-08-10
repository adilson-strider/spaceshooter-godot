extends "res://scripts/enemy.gd"

# [x] bounce screen
# [ ] shoot lasers

const scn_laser = preload("res://scenes/laser_enemy.tscn")

func _ready():
	velocity.x = utils.choose([+velocity.x, -velocity.x])

	yield(Functions.yield_wait(1.0, self), "completed")

	if(is_instance_valid(self)): 
		shoot()

func safe_free():
	if shoot().is_valid():
		shoot().resume()
	queue_free()

func _process(delta):
	# bouncing from screen
	if self.position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if self.position.x >= utils.view_size.x-16:
		velocity.x = -abs(velocity.x)

func shoot():
	while true:

		if(is_instance_valid(self)):
			var laser = scn_laser.instance()
			laser.position = $cannon.global_position
			utils.main_node.add_child(laser)
			
		yield(get_tree().create_timer(1.5), "timeout")
