extends Area2D

const SPEED = 120
var velocity = Vector2()
var direction = null

func set_direction(dir):
	direction = dir

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.x = direction.normalized().x * SPEED * delta
	velocity.y = direction.normalized().y * SPEED * delta
	translate(velocity)
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
