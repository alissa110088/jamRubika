extends CharacterBody2D
var speed_move = 300.0
var speed_rotation = 3
var current: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction_target: Vector2
	
	var moveDir =  Input.get_axis("UP", "DOWN")
	var rotationDir = Input.get_axis("LEFT", "RIGHT")
	
	if moveDir != 0:
		direction_target = Vector2(cos(rotation), sin(rotation)).normalized()
		if rotationDir >  0:
			rotation_degrees += 1 * speed_rotation
		if rotationDir <0:
			rotation_degrees -= 1 * speed_rotation
	else:
		direction_target = Vector2.ZERO
		
	direction = direction.lerp(direction_target, 10 * delta)
	print(direction)
	velocity = direction * speed_move

	
	move_and_slide()
