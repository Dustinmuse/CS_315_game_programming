extends Node2D

@export var score = 0
var interact = false
var insideDoor = false
@onready var chest_opening_sound = $sfx/ChestOpening


# Called when the node enters the scene tree for the first time.
func _ready():
	chest_opening_sound.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score >= 3 and insideDoor and Input.is_action_just_pressed("interact_with_door"):
		#change scene
		get_tree().change_scene_to_file("res://level1.tscn")
	
	if interact and Input.is_action_just_pressed("interact_with_npc"):
		$BadNPC/NPCLabel.text = "YOU ARE NOT ALLOWED TO BE ON MY FLYING SHIP! >:("
		interact = false
		
	pass


func addScore():
	score += 1
	#TODO: update UI :)
	$Player/Score.text = "score: " + str(score)
	
func npcInteracted():
	interact = true
	pass
	
func playerLeft():
	$BadNPC/NPCLabel.text = "Press [F] to interact"
	pass
	
func checkDoor():
	insideDoor = true

func exitedDoor():
	insideDoor = false
