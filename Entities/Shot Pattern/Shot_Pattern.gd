extends Node

const proj = preload("res://Entities/Projectile/Projectile.tscn")

var barrel_tip_pos

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
var node

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
	
func straight_shot(node, size, speed, frequency, multi=1):
	
	shot_type = SHOT_TYPE.STRAIGHT
	target = null
	projectile_speed = null
	multiplicity = multi
	self.node = node
	self.speed = speed
	
	create_shot_timer(frequency)
	shot_timer.start()

# Target expected to be tank (has velocity and global_position)
func tracking_shot(target, size, speed, frequency, multi=1):
	
	if target == null:
		return
	
	shot_type = SHOT_TYPE.MOMENTARY_TRACKING
	self.target = target
	self.projectile_speed = speed
	multiplicity = multi
	
	create_shot_timer(frequency)
	
	shot_timer.start()

func get_targeting_path(target, proj_speed):
	
	var t_vel = target.velocity
	var t_pos = target.global_position

	var a = t_vel.dot(t_vel) - pow(proj_speed, 2)
	var b = 2*(t_pos - barrel_tip_pos.global_position).dot(t_vel)
	var c = (t_pos - barrel_tip_pos.global_position).dot((t_pos - barrel_tip_pos.global_position))
	
	if pow(b, 2) > 4*a*c and a != 0:
		var t1 = (-b + sqrt(pow(b, 2) - 4*a*c))/(2*a)
		var t2 = (-b - sqrt(pow(b, 2) - 4*a*c))/(2*a)
		var t
		if t1 < t2 and t1 > 0:  # Pick minimum positive time
			t = t1
		else:
			t = t2
		var predicted_pos = t_pos + t_vel*t
		var dir = (predicted_pos - barrel_tip_pos.global_position).normalized()

		return dir*proj_speed


func multi_shot(node, num_projs, offset_angle, size, speed, frequency, multi=1, delay=0):
	
	shot_type = SHOT_TYPE.MULTI
	
	create_shot_timer(frequency)
	
	self.node = node
	self.multiplicity = multi
	self.num_projs = num_projs
	self.offset_angle = offset_angle
	self.size = size
	self.speed = speed
	self.delay = delay
	
	shot_timer.start()
	
func concentric_shot(intial_angle, num_projs, size, speed, frequency):
	var offset_ang = 360/num_projs
	self.multi_shot(intial_angle, num_projs, offset_ang, size, speed, frequency)
	
func _on_shot_Timer_timeout():
	
	if shot_type == SHOT_TYPE.STRAIGHT or shot_type == SHOT_TYPE.MOMENTARY_TRACKING:
		
		var projectile = proj.instance()
		self.get_parent().add_child(projectile)
		projectile.global_position = barrel_tip_pos.global_position
		
	#	Generate tracking shot data
		if shot_type == SHOT_TYPE.MOMENTARY_TRACKING:
			shot_final_vel = get_targeting_path(self.target, self.projectile_speed)
			projectile.VELOCITY = shot_final_vel
		else:
			var angle = self.node.rotation
			print("current_angle (s): %s" % angle)
			var target_vect = Vector2(cos(angle), sin(angle)).normalized()
			shot_final_vel = target_vect * speed
			projectile.VELOCITY = shot_final_vel
		
		
		
	elif shot_type == SHOT_TYPE.MULTI:
		var current_angle = self.node.rotation
		
		if self.num_projs % 2 != 0:  # Odd number of projectiles			
			for val in range(self.num_projs):
				
				# Create projectile and give it velocity
				var projectile = proj.instance()
				self.get_parent().add_child(projectile)
				projectile.global_position = barrel_tip_pos.global_position
				
				# Iterate and determine new angle
				current_angle = current_angle + self.offset_angle*val*pow(-1, val)
				var angle_rad = current_angle * PI/180  # Convert to radians
				print("current_angle: %s" % angle_rad)
				var target_vect = Vector2(cos(angle_rad), sin(angle_rad))
				shot_final_vel = target_vect * self.speed
				
				projectile.VELOCITY = shot_final_vel
				
			print("\n")
		else:  # Even number of projectiles
			for val in range(1, self.num_projs + 1):
				current_angle = current_angle + self.offset_angle*val*pow(-1, val)
				var angle_rad = current_angle * PI/180  # Convert to radians
				var target_vect = Vector2(cos(angle_rad), sin(angle_rad))
				shot_final_vel = target_vect * self.speed
				
				# Create projectile and give it velocity
				var projectile = proj.instance()
				self.get_parent().add_child(projectile)
				projectile.global_position = barrel_tip_pos.global_position
				projectile.VELOCITY = shot_final_vel
		
#	Decrement multiplicity, queue free when 0
	multiplicity = multiplicity - 1
	if multiplicity == 0:
		queue_free()