extends PlayerState

func enter(msg:={}):
	player.animation.play("hoe_" + msg.direction)
	
	await player.animation.animation_finished
	
	state_machine.transition_to("Idle", {'direction': msg.direction})
