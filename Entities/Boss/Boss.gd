extends StaticBody2D

var target: Tank
var PROJECTILE_SPEED = 100
var pos

var shot_timer
var shot_final_vel: Vector2

const proj = preload("res://Entities/Projectile/Projectile.tscn")

enum tracking_type{
	NONE = 0,
	SINGLE = 1,
	CONTINUOUS = 2
}	

# Called when the node enters the scene tree for the first time.
func _ready():	
	print("I am ready")
	pos = $Position.global_position
	create_shot_pattern(180, 0, 0, 0, .5, 0)

func _process(delta):
	pass

func create_shot_pattern(angle, size, speed, multiplicity, frequency, tracking=0):
	
	shot_timer = Timer.new()
	add_child(shot_timer)
	shot_timer.wait_time = frequency
	shot_timer.connect("timeout", self, "_on_Timer_timeout")
	
	angle = angle * PI / 180
	var target_vect = Vector2(cos(angle), sin(angle))
	shot_final_vel = target_vect * PROJECTILE_SPEED
	
	print('Here')
	shot_timer.start()
	
func track_and_shoot():
	
#	pass
	var t_vel = -target.velocity
	var t_pos = target.global_position

	var a = t_vel.dot(t_vel) - pow(PROJECTILE_SPEED, 2)
	var b = 2*(t_pos - pos).dot(t_vel)
	var c = (t_pos - pos).dot((t_pos - pos))
	
#	print("Pos: %s" % t_pos)
#	print("Vel: %s" % t_vel)
#	print('a: %s,\t b: %s,\t c: %s' % [a, b, c])
#	print('pow(b, 2) > 4*a*c \t %s\n' % str(pow(b, 2) > 4*a*c))
	
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
#		print(final_vel)
		projectile.VELOCITY = final_vel

func _on_Timer_timeout():
	
	print('Timer timed out')
	var projectile = proj.instance()
	self.get_parent().add_child(projectile)
	projectile.global_position = pos
	projectile.VELOCITY = shot_final_vel
