extends StaticBody2D

var shot_pattern = load("res://Entities/Shot Pattern/Shot_Pattern.gd")
var pos1
var pos2
var targets
var dir

# Called when the node enters the scene tree for the first time.
func _ready():
#	print("I am ready")
	pos1 = $Position_Left.global_position
	pos2 = $Position_Right.global_position
	targets = $targets
	
func shoot():
	var shot1 = shot_pattern.new()
	add_child(shot1)
	shot1.pos = $Position_Left.global_position
	#shot1.straight_shot(0, 1, 100, 0.2)
	shot1.tracking_shot(targets, 1, 0, 100, 0.2, 10)
	#shot1.multi_shot(0, 2, 20, 1, 100, 0.2)
	#shot1.concentric_shot(0, 5, 1, 100, 0.2)
	var shot2 = shot_pattern.new()
	add_child(shot2)
	shot2.pos = $Position_Right.global_position
	#shot2.tracking_shot(target, 1, 0, 100, 0.2, 10)
	shot2.multi_shot(0, 2, 20, 1, 100, 0.2)
	#shot2.concentric_shot(0, 5, 1, 100, 0.2)
	
func _process(delta):
	pass
