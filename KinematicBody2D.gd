extends KinematicBody2D

var speed = 70
var velocity = Vector2()
var shot_cooldown_begin = OS.get_ticks_msec()
var facing_dir = null

const PROJECTILE = preload("res://tank_projectile.tscn")


func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.play("right")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.play("right")
		$AnimatedSprite.flip_h = true	
	elif Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$AnimatedSprite.play('up')
		$AnimatedSprite.flip_v = true
	elif Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$AnimatedSprite.play('up')
		$AnimatedSprite.flip_v = false
	else:
		if $AnimatedSprite.animation.get_basename() == "up":
			$AnimatedSprite.play("idle_up")
		elif $AnimatedSprite.animation.get_basename() == "right":
			$AnimatedSprite.play("idle_right")
		
	if Input.is_key_pressed(KEY_SPACE):
		
		if abs(shot_cooldown_begin - OS.get_ticks_msec()) > 1000:
			shot_cooldown_begin = OS.get_ticks_msec()
			var projectile = PROJECTILE.instance()
			projectile.set_direction(Vector2(1,1))
			get_parent().add_child(projectile)
			projectile.position = $Position2D.global_position
		
		
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)