extends CharacterBody2D
class_name Player

@export var speed : float = 100.0

@onready var animation = $AnimationPlayer
@onready var aim := $Aim
@onready var water := $Water

var directions = {
	Vector2.ZERO: '',
	Vector2.LEFT: 'left',
	Vector2.RIGHT: 'right',
	Vector2.UP: 'up',
	Vector2.DOWN: 'down',
	Vector2(-1, -1).normalized(): 'left',
	Vector2(-1, 1).normalized(): 'left',
	Vector2(1, 1).normalized(): 'right',
	Vector2(1, -1).normalized(): 'right',
}

func _ready():
	aim.hide()

func update_position_aim(direction_string:String) -> void:
	if not aim.visible:
		return
	
	var direction : Vector2
	
	match direction_string:
		'left':
			direction = Vector2.LEFT
		'right':
			direction = Vector2.RIGHT
		'up':
			direction = Vector2.UP
		'down':
			direction = Vector2.DOWN
		_:
			return
	
	var tmp = direction * 16
	
	aim.global_position = Vector2(
		snapped(position.x + tmp.x, 16),
		snapped(position.y + tmp.y, 16),
	)

func direction_to_string(direction : Vector2) -> String:
	return directions[direction]
