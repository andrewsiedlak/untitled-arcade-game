extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boss/AT_1.targets = [$Tiger]
	$Boss/AT_1.q = 2
	$Boss/AT_2.targets = [$Tiger]
	$Boss/AT_2.q = 3

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
