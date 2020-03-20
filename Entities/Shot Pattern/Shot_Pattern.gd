extends Node

const proj = preload("res://Entities/Projectile/Projectile.tscn")

var pos

var tracking
var target: Tank
var projectile_speed

var shot_timer
var shot_final_vel: Vector2

var multiplicity

enum TRACKING_TYPE{
	NONE = 0,
	MOMENTARY = 1,
	CONTINUOUS = 2
}	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func straight_shot(angle, size, speed, frequency, multiplicity=1):
	
	tracking = TRACKING_TYPE.NONE
	target = null
	projectile_speed = null
	
	shot_timer = Timer.new()
	add_child(shot_timer)
	shot_timer.wait_time = frequency
	shot_timer.connect("timeout", self, "_on_Timer_timeout")
	
	angle = angle * PI / 180
	var target_vect = Vector2(cos(angle), sin(angle))
	shot_final_vel = target_vect * speed
	
#	print('Here')
	shot_timer.start()
#	print('Now here')

# Target expected to be tank (has velocity and global_position)
func tracking_shot(target_2, track_type, size, speed, frequency, multiplicity=1):
	
	tracking = track_type
	target = target_2
	projectile_speed = speed
	
	shot_timer = Timer.new()
	add_child(shot_timer)
	shot_timer.wait_time = frequency
	shot_timer.connect("timeout", self, "_on_Timer_timeout")
	
#	print('Here')
	shot_timer.start()
#	print('Now here')

func get_targeting_path(target, proj_speed):
	
	var t_vel = -target.velocity
	var t_pos = target.global_position
	print(target.global_position)

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
		
	
func multi_shot():
	pass

func concentric_shot():
	pass	
	
func _on_Timer_timeout():
		
#	print('Timer timed out')
	var projectile = proj.instance()
	self.get_parent().add_child(projectile)
	projectile.global_position = pos
	
#	Generate tracking shot data
	if tracking == TRACKING_TYPE.MOMENTARY:
		shot_final_vel = get_targeting_path(target, projectile_speed)
		
	projectile.VELOCITY = shot_final_vel
	
#	Decrement multiplicity, queue free when 0
	multiplicity -= 1
	if multiplicity == 0:
		queue_free()