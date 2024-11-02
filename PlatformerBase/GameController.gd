extends Node2D

@export var score = 0
@export var key = false
var insideChest = false
var insideDoor = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if score >= 3 and insideDoor and Input.is_action_just_pressed("interact_with_door"):
		#change scene
		get_tree().change_scene_to_file("res://level2.tscn")
		key = false
		pass
	if insideChest and key and Input.is_action_just_pressed("interact_with_chest"):
		get_tree().change_scene_to_file("res://hidden_level.tscn")
	pass


func addScore():
	score += 1
	#TODO: update UI :)
	$Player/Score.text = "score: " + str(score)
	
	
func gotKey():
	key = true
	
func checkChest():
	insideChest = true
	
func exitedChest():
	insideChest = false

func checkDoor():
	insideDoor = true

func exitedDoor():
	insideDoor = false
