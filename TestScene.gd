extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Players = [$Lion, $Tiger,$Eagle,$Bear]

var players = [$Player, $Player2, $Player3, $Player4]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if not globals.player_1_joined:
		$Bear.queue_free()
	if not globals.player_2_joined:
		$Tiger.queue_free()
	if not globals.player_3_joined:
		$Eagle.queue_free()
	if not globals.player_4_joined:
		$Lion.queue_free()
	
	$Boss.targets = $Bear
	$Boss.shoot()
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
