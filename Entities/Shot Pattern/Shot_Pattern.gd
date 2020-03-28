extends Node

const proj = preload("res://Entities/Projectile/Projectile.tscn")

var pos

var shot_type
var target: Tank
var projectile_speed

var shot_timer
var shot_final_vel: Vector2

var multiplicity

enum SHOT_TYPE{
	STRAIGHT = 0,
	MOMENTARY_TRACKING = 1,
	MULTI = 2
}	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func create_shot_timer(frequency):
	shot_timer = Timer.new()
	add_child(shot_timer)
	shot_timer.wait_time = frequency
	shot_timer.connect("timeout", self, "_on_Timer_timeout")
	
func straight_shot(angle, size, speed, frequency, multi=1):
	
	shot_type = SHOT_TYPE.STRAIGHT
	target = null
	projectile_speed = null
	multiplicity = 1
	
	create_shot_timer(frequency)
	
	angle = angle * PI / 180
	var target_vect = Vector2(cos(angle), sin(angle))
	shot_final_vel = target_vect * speed
	
#	print('Here')
	shot_timer.start()
#	print('Now here')

# Target expected to be tank (has velocity and global_position)
func tracking_shot(target_2, track_type, size, speed, frequency, multi=1):
	
	shot_type = SHOT_TYPE.MOMENTARY_TRACKING
	target = target_2
	projectile_speed = speed
	multiplicity = multi
	
	create_shot_timer(frequency)
	
#	print('Here')
	shot_timer.start()
#	print('Now here')

func get_targeting_path(target, proj_speed):
	
	var t_vel = -target.velocity
	var t_pos = target.global_position
#	print(target.global_position)

	var a = t_vel.dot(t_vel) - pow(proj_speed, 2)
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
		return dir*proj_speed
		
	
func multi_shot(initial_angle, num_projs, offset_angle, size, speed, frequency, multi=1):
	
	create_shot_timer(frequency)

func concentric_shot():
	pass	
	
func _on_Timer_timeout():
	
	if shot_type == SHOT_TYPE.STRAIGHT or shot_type == SHOT_TYPE.MOMENTARY_TRACKING:
	#	print('Timer timed out')
		var projectile = proj.instance()
		self.get_parent().add_child(projectile)
		projectile.global_position = pos
		
	#	Generate tracking shot data
		if shot_type == SHOT_TYPE.MOMENTARY_TRACKING:
			shot_final_vel = get_targeting_path(target, projectile_speed)
			
		projectile.VELOCITY = shot_final_vel
	elif shot_type == SHOT_TYPE.MULTI:
		
		for proj_num in range(
		
#	Decrement multiplicity, queue free when 0
	multiplicity = multiplicity - 1
	if multiplicity == 0:
#		print("Bye")
		queue_free()