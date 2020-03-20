extends KinematicBody2D

class_name Tank

const PROJECTILE = preload("res://Entities/TankProjectile/tank_projectile.tscn")
var SHOT_COOLDOWN_MSEC = 300
const SPEED = 70

var velocity = Vector2()
var shot_cooldown_begin = OS.get_ticks_msec()
var facing_dir = 270

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.play("moving")
		self.global_rotation_degrees = 90
		facing_dir = 360
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.play("moving")
		self.global_rotation_degrees = -90
		facing_dir = 180
	elif Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$AnimatedSprite.play("moving")
		global_rotation_degrees = 180
		facing_dir = 90
	elif Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$AnimatedSprite.play('moving')
		self.global_rotation_degrees = 0
		facing_dir = 270
	else:
		$AnimatedSprite.play("idle")
	
	#normal fire
	if Input.is_key_pressed(KEY_SPACE):
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > SHOT_COOLDOWN_MSEC:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.set_direction(facing_dir)
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
			shot_cooldown_begin = OS.get_ticks_msec()
	#Rapid
	if Input.is_key_pressed(KEY_1):
		SHOT_COOLDOWN_MSEC = 150
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > SHOT_COOLDOWN_MSEC:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.set_direction(facing_dir)
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
			shot_cooldown_begin = OS.get_ticks_msec()
		SHOT_COOLDOWN_MSEC = 300
	#Rocket
	if Input.is_key_pressed(KEY_2):
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > SHOT_COOLDOWN_MSEC:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.SPEED = 240
			projectile.set_direction(facing_dir)
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
			shot_cooldown_begin = OS.get_ticks_msec()
	#Multi
	if Input.is_key_pressed(KEY_3):
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > SHOT_COOLDOWN_MSEC:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.set_direction(facing_dir-20)
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile2 = PROJECTILE.instance()
			projectile2.set_direction(facing_dir)
			get_parent().add_child(projectile2)
			projectile2.position = $Position2D.global_position
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile3 = PROJECTILE.instance()
			projectile3.set_direction(facing_dir+20)
			get_parent().add_child(projectile3)
			projectile3.position = $Position2D.global_position
		
		
	velocity = velocity.normalized() * SPEED

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
