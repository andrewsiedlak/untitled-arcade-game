extends StaticBody2D

var shot_pattern = load("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos1
var pos2
var targets
var dir

# Called when the node enters the scene tree for the first time.
func _ready():
	pos1 = $Position_Left.global_position
	
func shoot():
	var shot_1 = shot_pattern.new()
	add_child(shot_1)
	shot_1.pos = $Position_Left.global_position
#	shot_1.concentric_shot(0, 5, 1, 100, 0.2)
	shot_1.straight_shot(0, 1, 100, .1, 10)
	
func _process(delta):
	pass
