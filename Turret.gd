extends StaticBody2D

var target: Tank
var PROJECTILE_SPEED = .01
var pos

const proj = preload("res://Projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()
	print("I am ready")
	pos = $Position.global_position

func _process(delta):
	pass


func track():
	
	pass
	var t_vel = target.velocity
	var t_pos = target.global_position

	var a = t_vel.dot(t_vel) - PROJECTILE_SPEED
	var b = 2*(t_pos - pos).dot(t_vel)
	var c = (t_pos - pos).dot((t_pos - pos))
	
	print('a: %s,\t b: %s,\t c: %s' % [a, b, c])
	print('pow(b, 2) > 4*a*c \t %s' % str(pow(b, 2) > 4*a*c))
	
	
	if pow(b, 2) > 4*a*c and a != 0:
		var t1 = (-b + sqrt(pow(b, 2) - 4*a*c))/(2*a)
		var t2 = (-b - sqrt(pow(b, 2) - 4*a*c))/(2*a)
		var t = min(t1, t2)
		var predicted_pos = t_pos + t_vel*t
		var dir = (predicted_pos - pos).normalized()
		var final_vel = dir*PROJECTILE_SPEED
		var projectile = proj.instance()
		self.get_parent().add_child(projectile)
		projectile.global_position = pos
		print(final_vel)
		projectile.VELOCITY = final_vel

func _on_Timer_timeout():
	print("Firing")
	track()
