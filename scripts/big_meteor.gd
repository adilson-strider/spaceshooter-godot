extends "res://scripts/meteor.gd"

func _ready():
	velocity.x = utils.choose([+velocity.x, -velocity.x])
	
	yield(Functions.yield_wait(5, self), "completed")
	pass

func _process(delta):
	# bouncing from screen
	if self.position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if self.position.x >= utils.view_size.x-16:
		velocity.x = -abs(velocity.x)
	pass

