extends Node

signal health_change

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var max_health
var health


# Called when the node enters the scene tree for the first time.
func _ready():
	health = max_health
	pass # Replace with function body.
	
func take_damage(amount):
	health -= amount
	emit_signal('health_change', health * 100/max_health)
	if health <= 0:
		explode()

func explode():
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
