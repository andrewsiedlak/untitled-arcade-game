extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var players = []
	if not globals.player_1_joined:
		$Bear.queue_free()
	else:
		players.append($Bear)
	if not globals.player_2_joined:
		$Tiger.queue_free()
	else:
		players.append($Tiger)
	if not globals.player_3_joined:
		$Eagle.queue_free()
	else:
		players.append($Eagle)
	if not globals.player_4_joined:
		$Lion.queue_free()
	else:
		players.append($Lion)
	
	$Boss.targets = $Bear
	$Boss.shoot()
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
