extends PlayerState

func enter(msg:={}):
	player.animation.play("axe_" + msg.direction)
	
	await player.animation.animation_finished

	var target = get_target()
	
	if target != null and target.has_method("hit"):
		target.hit(1, msg.direction)
	
	state_machine.transition_to("Idle", {'direction': msg.direction})


func get_target() -> Node2D:
	var targets = player.aim.get_overlapping_areas()
	if not targets.is_empty():
		return targets[0].get_parent()
	return null
	
