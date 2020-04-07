extends StaticBody2D

const shot_pattern = preload("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos
var target

# Called when the node enters the scene tree for the first time.
func _ready():
#	print("I am ready")
	pos = $Position.global_position
	
func shoot():
	var shot = shot_pattern.new()
	add_child(shot)
	shot.pos = $Position.global_position
#	shot.tracking_shot(target, 1, 0, 100, 0.2, 10)
#	shot.multi_shot(0, 2, 20, 1, 100, 0.2)
	shot.concentric_shot(0, 5, 1, 100, 0.2)
	
func _process(delta):
	pass
