extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Players = [$Lion, $Tiger,$Eagle,$Bear]

#var players = [$Player, $Player2, $Player3, $Player4]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if not globals.player_1_joined:
		$Bear.queue_free()
	else:
		globals.players.append($Bear)
	if not globals.player_2_joined:
		$Tiger.queue_free()
	else:
		globals.players.append($Tiger)
	if not globals.player_3_joined:
		$Eagle.queue_free()
	else:
		globals.players.append($Eagle)
	if not globals.player_4_joined:
		$Lion.queue_free()
	else:
		globals.players.append($Lion)

	$Boss/AT_1.targets = globals.players
	$Boss/AT_1.q = 2
	$Boss/AT_2.targets = globals.players
	$Boss/AT_2.q = 3
	$Boss/AA_1.targets = globals.players
	$Boss/AA_1.q = 1
	$Boss/AA_2.targets = globals.players
	$Boss/AA_2.q = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 