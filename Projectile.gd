extends Area2D

class_name TempProjectile

var VELOCITY: Vector2 = Vector2(0, 0)

func _physics_process(delta):
	translate(VELOCITY*delta)
