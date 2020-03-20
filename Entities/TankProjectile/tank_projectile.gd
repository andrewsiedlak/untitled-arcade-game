extends Area2D

var SPEED = 120
var velocity = Vector2()
var direction = "up"

func set_direction(facing_dir):
	
	var dir_vector
	var x_pos = 0
	var y_pos = 0
	
	x_pos = cos(facing_dir * (PI/180))
	y_pos = sin(facing_dir * (PI/180))
	
	dir_vector = Vector2(x_pos, y_pos)
	$AnimatedSprite.global_rotation_degrees = facing_dir + 90
	
	
#	if facing_dir == 360 or facing_dir == 0:
#		dir_vector = Vector2(1, 0)
#		$AnimatedSprite.global_rotation_degrees = 90
#	elif facing_dir == 180:
#		dir_vector = Vector2(-1, 0)
#		$AnimatedSprite.global_rotation_degrees = -90
#	elif facing_dir == "up":
#		dir_vector = Vector2(0, -1)
#	elif facing_dir == "down":
#		dir_vector = Vector2(0, 1)
#		$AnimatedSprite.global_rotation_degrees = 180
				
	direction = dir_vector

func _physics_process(delta):
	velocity.x = direction.normalized().x * SPEED * delta
	velocity.y = direction.normalized().y * SPEED * delta
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_body_entered(body):
	queue_free()
