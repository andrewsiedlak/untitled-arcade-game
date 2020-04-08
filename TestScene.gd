extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Players = [$Lion, $Tiger,$Eagle,$Bear]

#var players = [$Player, $Player2, $Player3, $Player4]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Boss/AA_1.targets = $Bear
	$Boss/AA_1.shoot()
	$Boss/AA_2.targets = $Tiger
	$Boss/AA_2.shoot()
	
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
