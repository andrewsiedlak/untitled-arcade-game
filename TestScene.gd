extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Players = [$Lion, $Tiger,$Eagle,$Bear]

var players = [$Player, $Player2, $Player3, $Player4]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boss.targets = $Bear
	$Boss.shoot()
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
