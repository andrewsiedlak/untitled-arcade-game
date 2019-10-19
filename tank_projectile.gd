extends Area2D

const SPEED = 10
var velocity = Vector2()
var direction = null

func set_direction(dir):
	direction = dir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = direction.normalized().x * SPEED
	velocity.y = direction.normalized().y * SPEED
	translate(velocity)
	
