extends Area2D

class_name TempProjectile
export (int) var damage

var VELOCITY: Vector2 = Vector2(0, 0)

func _physics_process(delta):
	translate(VELOCITY*delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_Area2D_body_entered(body):
	if body.name == "Boss":
		pass
	elif body.has_method('take_damage'):
		body.take_damage(damage)
		explode()
	else:
		queue_free()
		
func explode():
	queue_free()
