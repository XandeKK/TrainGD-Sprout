extends PlayerState

func enter(msg:={}):
	player.animation.play("sprinkler_" + msg.direction)
	
	player.water.position = player.get_node("WaterMarkers/" + msg.direction).position
	
	await player.animation.animation_finished
	
	state_machine.transition_to("Idle", {'direction': msg.direction})

