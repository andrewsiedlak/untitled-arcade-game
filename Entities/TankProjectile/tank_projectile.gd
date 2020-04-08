extends Area2D

const SPEED = 240
var velocity = Vector2()
var direction = "up"

export (int) var damage

func set_direction(facing_dir):
	
	var dir_vector
	if facing_dir == "right":
		dir_vector = Vector2(1, 0)
		$AnimatedSprite.global_rotation_degrees = 90
	elif facing_dir == "left":
		dir_vector = Vector2(-1, 0)
		$AnimatedSprite.global_rotation_degrees = -90
	elif facing_dir == "up":
		dir_vector = Vector2(0, -1)
	elif facing_dir == "down":
		dir_vector = Vector2(0, 1)
		$AnimatedSprite.global_rotation_degrees = 180
				
	direction = dir_vector

func _physics_process(delta):
	velocity.x = direction.normalized().x * SPEED * delta
	velocity.y = direction.normalized().y * SPEED * delta
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Eagle" or body.name == "Lion" or body.name == "Bear" or body.name == "Tiger":
		pass
	elif body.has_method('take_damage'):
		body.take_damage(damage)
		explode()
	else:
		queue_free()

func explode():
	queue_free()
