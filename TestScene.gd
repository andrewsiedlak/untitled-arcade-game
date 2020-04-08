extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Players = [$Lion, $Tiger,$Eagle,$Bear]

#var players = [$Player, $Player2, $Player3, $Player4]

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
	
	$Boss/AT_1.targets = players
	$Boss/AT_1.q = 2
	$Boss/AT_2.targets = players
	$Boss/AT_2.q = 3
#	$Boss/AA_1.target = $Bear
#	$Boss/AA_2.target = $Bear
	$Boss/AT_1.begin()

#	$Boss/AA_1.shoot()





# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 