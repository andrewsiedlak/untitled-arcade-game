extends StaticBody2D

var shot_pattern = load("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos
var targets
var target
var timer: Timer
var tracking_timer: Timer

var q  # quadrant

var in_pattern = false

var tracking_timer_timeout = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = .1
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()
	
func begin():
	
	pass
	
func rotate_sprite(target=null):
	if target != null:
		$Node2D.look_at(target.get_global_position())
#	$Sprite.rotation_degrees = 90

func tracking_shot(size, speed, frequency, multi=1):
	
	tracking_timer = Timer.new()
	add_child(tracking_timer)
	tracking_timer.wait_time = .1
	tracking_timer.connect("timeout", self, "_on_tracking_Timer_timeout")
	tracking_timer.start()
	
	

func shoot_tracking_shot():
	var shot = shot_pattern.new()
	add_child(shot)
	shot.barrel_tip_pos = $Node2D/Sprite/Position
	shot.tracking_shot(self.target, 1, 500, .1, 3)
	in_pattern = false
#	var vect = shot.get_targeting_path(target, 200)
	
func _process(delta):
	pass

func _on_Timer_timeout():
	if not in_pattern:
		for tar in targets:
			self.target = null
			if self.q == 1 and tar.get_global_position().x < 916.4 and tar.get_global_position().y < 547.8:  # Q2
	#			print("1")
				self.target = tar
			elif self.q == 2 and tar.get_global_position().x > 916.4 and tar.get_global_position().y < 547.8:  # Q2
	#			print("2")
				self.target = tar
			elif self.q == 3 and tar.get_global_position().x < 916.4 and tar.get_global_position().y > 547.8:  # Q3
	#			print("3")
				self.target = tar
			elif self.q == 4 and tar.get_global_position().x > 916.4 and tar.get_global_position().y > 547.8:  # Q4
	#			print("4")
				self.target = tar
		
			if self.target != null:
				in_pattern = true
				self.tracking_shot(1, 100, .1, 1)
			
func _on_tracking_Timer_timeout():
	rotate_sprite(self.target)
	self.tracking_timer_timeout -= 1
	if self.tracking_timer_timeout == 0:
		tracking_timer.stop()
		self.tracking_timer_timeout = 30
		self.shoot_tracking_shot()