extends Control

# Declare member variables here. Examples:
var player_1_joined = false
var player_2_joined = false
var player_3_joined = false
var player_4_joined = false

onready var bear = get_node("Background/Bear")
onready var eagle = get_node("Background/Eagle")
onready var lion = get_node("Background/Lion")
onready var tiger = get_node("Background/Tiger")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventKey and not event.echo:
		
		if Input.is_action_just_pressed("Player1_fire") and not player_1_joined:
			player_1_joined = true
			bear.get_node("Label").percent_visible = 1
		elif Input.is_action_just_pressed("Player2_fire") and not player_2_joined:
			player_2_joined = true
			tiger.get_node("Label").percent_visible = 1
		elif Input.is_action_just_pressed("Player3_fire") and not player_3_joined:
			player_3_joined = true
			eagle.get_node("Label").percent_visible = 1
		elif Input.is_action_just_pressed("Player4_fire") and not player_4_joined:
			player_4_joined = true
			lion.get_node("Label").percent_visible = 1