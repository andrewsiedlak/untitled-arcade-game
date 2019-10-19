extends KinematicBody2D

var speed = 70
var velocity = Vector2()
<<<<<<< Updated upstream
=======
var shot_cooldown_begin = OS.get_ticks_msec()
var facing_dir = null

const PROJECTILE = preload("res://tank_projectile.tscn")
>>>>>>> Stashed changes

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
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)