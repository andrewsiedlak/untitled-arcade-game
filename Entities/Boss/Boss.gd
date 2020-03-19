extends StaticBody2D

const shot_pattern = preload("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos

# Called when the node enters the scene tree for the first time.
func _ready():	
	print("I am ready")
	var shot = shot_pattern.new()
	add_child(shot)
	shot.pos = $Position.global_position
	shot.create_shot_pattern(180, 0, 100, 0, .5, 0)
	pos = $Position.global_position
	

func _process(delta):
	pass
