extends Node

const proj = preload("res://Entities/Projectile/Projectile.tscn")

var pos

var shot_type
var target: Tank
var projectile_speed

var shot_timer
var shot_final_vel: Vector2

var multiplicity
var delay

var init_angle
var num_projs
var offset_angle
var size
var speed

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
	shot_timer.connect("timeout", self, "_on_shot_Timer_timeout")
	
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


func multi_shot(initial_angle, num_projs, offset_angle, size, speed, frequency, multi=1, delay=0):
	
	shot_type = SHOT_TYPE.MULTI
	
	create_shot_timer(frequency)
	
	self.init_angle = initial_angle
	self.multiplicity = multi
	self.num_projs = num_projs
	self.offset_angle = offset_angle
	self.size = size
	self.speed = speed
	self.delay = delay
	
	shot_timer.start()
	
func concentric_shot():
	pass	
	
func _on_shot_Timer_timeout():
	
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
		var current_angle = self.init_angle
		
		if self.num_projs % 2 != 0:  # Odd number of projectiles			
			for val in range(self.num_projs):
				
				# Iterate and determine new angle
				current_angle = current_angle + self.offset_angle*val*pow(-1, val)
				print(current_angle)
				
				var angle_rad = current_angle * PI/180  # Convert to radians
				var target_vect = Vector2(cos(angle_rad), sin(angle_rad))
				shot_final_vel = target_vect * self.speed
				
				# Create projectile and give it velocity
				var projectile = proj.instance()
				self.get_parent().add_child(projectile)
				projectile.global_position = pos
				projectile.VELOCITY = shot_final_vel
				
		else:  # Even number of projectiles
			for val in range(1, self.num_projs + 1):
				current_angle = current_angle + self.offset_angle*val*pow(-1, val)
				print(current_angle)
				var angle_rad = current_angle * PI/180  # Convert to radians
				var target_vect = Vector2(cos(angle_rad), sin(angle_rad))
				shot_final_vel = target_vect * self.speed
				
				# Create projectile and give it velocity
				var projectile = proj.instance()
				self.get_parent().add_child(projectile)
				projectile.global_position = pos
				projectile.VELOCITY = shot_final_vel
		
#	Decrement multiplicity, queue free when 0
	multiplicity = multiplicity - 1
	if multiplicity == 0:
		queue_free()
#	Attempting to add delay with multiple shots, doesn't work
#	if self.delay != null: 
#		var t = Timer.new()
#		t.set_wait_time(self.delay)
#		t.set_one_shot(true)
#		self.add_child(t)
#		t.start()
#		yield(t, "timeout")