extends StaticBody2D

@export var life := 1
@export var have_fruits := false

func hit(damage : int, direction_string : String) -> void:
	life -= damage
	$AnimationPlayer.play("hit")
	if life < 1:
		fall(direction_string)

func fall(direction_string : String):
	var tween = get_tree().create_tween()
	$HitCollision/CollisionShape2D.set_deferred("disabled", true)
	var direction = 1
	
	if direction_string == 'left' or direction_string == 'up':
		direction = -1
	
	tween.tween_property($Sprite2D, "rotation", 2 * direction, 0.5)
	tween.tween_callback(queue_free)
