extends KinematicBody2D

var speed = 70
var velocity = Vector2()

func get_input():
	# Detect up/down/left/right keystate and only move when pressed.
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		$AnimatedSprite.play("right")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		$AnimatedSprite.play("right")
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		$AnimatedSprite.play('up')
		$AnimatedSprite.flip_v = true
		print("Down")
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		$AnimatedSprite.play('up')
		$AnimatedSprite.flip_v = false
		print("Up")	
		
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)