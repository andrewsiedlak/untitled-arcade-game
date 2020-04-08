extends Node2D

var bar_red = preload("res://Sprites/Hud/barHorizontal_red_mid 200.png")
var bar_green = preload("res://Sprites/Hud/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://Sprites/Hud/barHorizontal_yellow_mid 200.png")

func _ready():
	for node in get_children():
		node.hide()
		
func _process(delta):
	global_rotation = 0
	
func _on_Bear_health_change(value):
	$HealthBar.texture_progress = bar_green
	if value < 80:
		$HealthBar.texture_progress = bar_yellow
	if value < 30:
		$HealthBar.texture_progress = bar_red
	if value < 100:
		$HealthBar.show()
	$HealthBar.value = value
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

