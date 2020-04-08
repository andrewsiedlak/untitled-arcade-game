extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var players = [$Player, $Player2, $Player3, $Player4]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boss.targets = players
	$Boss.shoot()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
