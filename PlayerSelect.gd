extends Control

# Declare member variables here. Examples:

onready var bear = get_node("Background/Bear")
onready var eagle = get_node("Background/Eagle")
onready var lion = get_node("Background/Lion")
onready var tiger = get_node("Background/Tiger")

var countdown_timer: Timer
const time = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	self.countdown_timer = Timer.new()
	add_child(self.countdown_timer)
	self.countdown_timer.connect("timeout", self, "_on_Timer_timeout")
	self.countdown_timer.wait_time = time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_text = "Time Remaining: {s}"
	var time_left = "%3.1f" % countdown_timer.get_time_left()
	$Background/TimeLabel.text = time_text.format({"s": time_left})
	
func _input(event):
	if event is InputEventKey and not event.echo:
		
		if Input.is_action_just_pressed("Player1_fire") and not globals.player_1_joined:
			globals.player_1_joined = true
			bear.get_node("Label").percent_visible = 1
		elif Input.is_action_just_pressed("Player2_fire") and not globals.player_2_joined:
			globals.player_2_joined = true
			tiger.get_node("Label").percent_visible = 1
		elif Input.is_action_just_pressed("Player3_fire") and not globals.player_3_joined:
			globals.player_3_joined = true
			eagle.get_node("Label").percent_visible = 1
		elif Input.is_action_just_pressed("Player4_fire") and not globals.player_4_joined:
			globals.player_4_joined = true
			lion.get_node("Label").percent_visible = 1
			
		if Input.is_action_just_pressed("Player1_alt") and globals.player_1_joined:
			globals.player_1_joined = false
			bear.get_node("Label").percent_visible = 0
		elif Input.is_action_just_pressed("Player2_alt") and globals.player_2_joined:
			globals.player_2_joined = false
			tiger.get_node("Label").percent_visible = 0
		elif Input.is_action_just_pressed("Player3_alt") and globals.player_3_joined:
			globals.player_3_joined = false
			eagle.get_node("Label").percent_visible = 0
		elif Input.is_action_just_pressed("Player4_alt") and globals.player_4_joined:
			globals.player_4_joined = false
			lion.get_node("Label").percent_visible = 0
	
	check_timer()

func check_timer():
	
	if countdown_timer.is_stopped() and (globals.player_1_joined or 
								globals.player_2_joined or
								globals.player_3_joined or
								globals.player_4_joined):
		
		self.countdown_timer.start()
		
	elif not countdown_timer.is_stopped() and (not globals.player_1_joined and 
								not globals.player_2_joined and
								not globals.player_3_joined and
								not globals.player_4_joined):

		self.countdown_timer.stop()
#		self.countdown_timer.set_wait_time(time)

func _on_Timer_timeout():
	get_tree().change_scene("res://TestScene.tscn")