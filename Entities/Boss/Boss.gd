extends StaticBody2D

const shot_pattern = preload("res://Entities/Shot Pattern/Shot_Pattern.gd")
var tower_tex1 = preload("res://Sprites/Boss/flak tower.png")
var tower_tex2 = preload("res://Sprites/Boss/flak tower degraded.png")
var tower_tex3 = preload("res://Sprites/Boss/flak tower destroyed.png")

signal health_change

export (int) var max_health
var health

# Called when the node enters the scene tree for the first time.
func _ready():
#	print("I am ready")
	health = max_health
	emit_signal("health_change", health * 100/max_health)
	$Tower.set_texture(tower_tex1)
	
func take_damage(amount):
	health -= amount
	print(health)
	emit_signal("health_change", health * 100/max_health)
	if health <= 1000 and health > 100:
		$Tower.set_texture(tower_tex2)
	elif health <= 100 and health > 0:
		$Tower.set_texture(tower_tex3)
	elif health <= 0:
		explode()
		
func explode():
	queue_free()
	

func _process(delta):
	pass
