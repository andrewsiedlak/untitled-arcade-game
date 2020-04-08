extends StaticBody2D

var shot_pattern = load("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos
var targets
var target
var timer: Timer
var tracking_timer: Timer
var cooldown_timer: Timer

var rand

var q  # quadrant
var polarity

var in_pattern = false

var tracking_timer_timeout = 30
var random_timer_timeout = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	
	rand = RandomNumberGenerator.new()
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = .1
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()
	
	cooldown_timer = Timer.new()
	add_child(cooldown_timer)
	cooldown_timer.wait_time = 3 + rand.randi_range(0, 2)
	cooldown_timer.connect("timeout", self, "_on_cooldown_Timer_timeout")
	
func begin():
	
	pass
	
func rotate_sprite(target=null):
	if target != null:
		$Node2D.look_at(target.get_global_position())
	pass
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
	shot.barrel_tip_pos = $Node2D/Sprite/Position_Left
	print($Node2D/Sprite/Position_Left.global_position)
	var shot_speed = 500
	if self.q == 3 or self.q == 4:
		shot_speed *= -1
	shot.tracking_shot(self.target, 1, shot_speed, .1, 3)
	in_pattern = false
	cooldown_timer.start()
#	var vect = shot.get_targeting_path(target, 200)

func random_shots():
	for val in range(3):
		var random_timer = Timer.new()
		add_child(random_timer)
		var time = rand.randf() + (1.5*val)
		random_timer.wait_time = time
		random_timer.one_shot = 1
		random_timer.connect("timeout", self, "_on_random_Timer_timeout")
		random_timer.start()

func straight_shot():
	var shot = shot_pattern.new()
	add_child(shot)
	shot.barrel_tip_pos = $Node2D/Sprite/Position_Left
	shot.straight_shot($Node2D, 1, 200, .2, 1 + rand.randi_range(0,1))
	
	var shot_2 = shot_pattern.new()
	add_child(shot_2)
	shot_2.barrel_tip_pos = $Node2D/Sprite/Position_Right
	shot_2.multi_shot(0, 3, 15, 1, 200, 1)
	
func _process(delta):
	pass

func _on_Timer_timeout():
	if not in_pattern:
		for tar in targets:
			
			timer.stop()
			
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
			
			in_pattern = true
			if self.target != null:
				self.tracking_shot(1, -100, .1, 1)
			else:
				self.random_shots()
			
func _on_tracking_Timer_timeout():
	rotate_sprite(self.target)
	self.tracking_timer_timeout -= 1
	if self.tracking_timer_timeout == 0:
		tracking_timer.stop()
		self.tracking_timer_timeout = 30
		self.shoot_tracking_shot()

func _on_random_Timer_timeout():
	$Node2D.rotation = rotation + ((20 + rand.randf_range(0, 8)) * pow(-1, random_timer_timeout))
	random_timer_timeout -= 1
	self.straight_shot()
	if random_timer_timeout == 0:
		cooldown_timer.start()
		in_pattern = false
		random_timer_timeout = 3
	
	
func _on_cooldown_Timer_timeout():
	cooldown_timer.stop()
	timer.wait_time = 3 + rand.randi_range(0, 2)
	timer.start()