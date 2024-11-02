extends Node2D

@export var score = 0
@export var key = false
var interact = false
var climbing = false
var insideDoor = false
var insideChest = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score >= 3 and insideDoor and Input.is_action_just_pressed("interact_with_door"):
		#change scene
		get_tree().change_scene_to_file("res://menu.tscn")
		key = false
	
	if interact and Input.is_action_just_pressed("interact_with_npc"):
		$NiceNPC/NPCLabel.text = "Good luck in your adventure!"
		interact = false
	
	if insideChest and key and Input.is_action_just_pressed("interact_with_chest"):
		$Chest/ChestLabel.text = "You have unlocked a coin!"
		
	pass


func addScore():
	score += 1
	#TODO: update UI :)
	$Player/Score.text = "score: " + str(score)
	
	
func gotKey():
	key = true
	
func npcInteracted():
	interact = true
	pass
	
func playerLeft():
	$NiceNPC/NPCLabel.text = "Press [F] to interact"
	pass

func checkDoor():
	insideDoor = true

func exitedDoor():
	insideDoor = false
	
func checkChest():
	insideChest = true
	
func exitedChest():
	insideChest = false
