extends "res://Control.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _on_Eagle_health_change(value):
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
