extends PlayerState

var _direction : String

func enter(msg := {}):
	if msg.has("direction"):
		_direction = msg.direction
		player.animation.play("idle_" + _direction)
	else:
		_direction = 'left'
		player.animation.play("idle_left")

func physics_update(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction_string = player.direction_to_string(direction)

	player.update_position_aim(direction_string)

	if direction != Vector2.ZERO:
		state_machine.transition_to("Walk", {'direction': direction_string})
	elif Input.is_action_just_pressed("action"):
		return
		state_machine.transition_to(player.current_item, {'direction': _direction})

func handle_input(event: InputEvent):
	if event.is_action_pressed("aim"):
		player.aim.visible = not player.aim.visible
		player.update_position_aim(_direction)
