extends StaticBody2D

var shot_pattern = load("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos
var targets

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func begin():
	print("Here here")
	var shot_1 = shot_pattern.new()
	add_child(shot_1)
	shot_1.pos = $Position.global_position
	shot_1.straight_shot(0, 1, 100, 10, 3)
	print("Now Here")
	
func _process(delta):
	pass
