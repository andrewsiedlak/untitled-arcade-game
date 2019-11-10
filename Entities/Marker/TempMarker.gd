extends Sprite

var SPAWN_TIME = OS.get_ticks_msec()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if abs(OS.get_ticks_msec() - SPAWN_TIME) >= 750:
		queue_free()
