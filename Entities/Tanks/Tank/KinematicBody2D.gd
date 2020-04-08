extends KinematicBody2D

class_name Tank

signal health_change

const PROJECTILE = preload("res://Entities/TankProjectile/tank_projectile.tscn")
const SHOT_COOLDOWN_MSEC = 300
const SPEED = 200
export (int) var PlayerID = 1
export (int) var max_health

var velocity = Vector2(0, 0)
var shot_cooldown_begin = OS.get_ticks_msec()
var facing_dir = "up"
var health

func _ready():
	health = max_health
	emit_signal('health_change', health * 100/max_health)

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("Player" + str(PlayerID) + "_right"):
		velocity.x += 1
		$AnimatedSprite.play("moving")
		self.global_rotation_degrees = 90
		facing_dir = "right"
	elif Input.is_action_pressed("Player" + str(PlayerID) + "_left"):
		velocity.x -= 1
		$AnimatedSprite.play("moving")
		self.global_rotation_degrees = -90
		facing_dir = "left"	
	elif Input.is_action_pressed("Player" + str(PlayerID) + "_down"):
		velocity.y += 1
		$AnimatedSprite.play("moving")
		global_rotation_degrees = 180
		facing_dir = "down"
	elif Input.is_action_pressed("Player" + str(PlayerID) + "_up"):
		velocity.y -= 1
		$AnimatedSprite.play('moving')
		self.global_rotation_degrees = 0
		facing_dir = "up"
	else:
		$AnimatedSprite.play("idle")
		health += .01
		emit_signal('health_change', health * 100/max_health)
		
		
	if Input.is_action_pressed("Player" + str(PlayerID) + "_fire"):
		
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > SHOT_COOLDOWN_MSEC:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.set_direction(facing_dir)
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
			
	if Input.is_action_pressed("Player" + str(PlayerID) + "_alt"):
		
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > SHOT_COOLDOWN_MSEC:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.set_direction(facing_dir)
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
		
		
	velocity = velocity.normalized() * SPEED
	
func take_damage(amount):
	health -= amount
	emit_signal('health_change', health * 100/max_health)
	if health <= 0:
		explode()

func explode():
	globals.players.erase(self)
	queue_free()

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	
func _process(delta):
#	print("I am at %f , %f" % [self.get_global_position().x, self.get_global_position().y])
	pass
