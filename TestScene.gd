extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Players = [$Lion, $Tiger,$Eagle,$Bear]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Turret.target = $Eagle
	$AT_Turret.target = $Eagle



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass 
