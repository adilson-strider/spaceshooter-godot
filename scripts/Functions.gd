extends Node

func yield_wait(var timeout : float, var parent = get_tree().get_root()):

	var timeoutCap = max(0, timeout) 

	if timeoutCap <= 0:     
		return 

	var timer = Timer.new()
	timer.set_one_shot(true)

	yield(yield_call_deferred(parent, "add_child", timer), "completed")     
	timer.start(timeoutCap)
	yield(_yield_wait(timer), "completed")
	yield(yield_call_deferred(parent, "remove_child", timer), "completed")
	timer.free() #avoid orphans

func _yield_wait(var timer : Timer):
	yield(timer, "timeout")

func yield_call_deferred(var node, var action, var parameter):
	node.call_deferred(action, parameter)
	yield(get_tree(), "idle_frame")
