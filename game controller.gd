extends Node2D

var score = 0
@onready var score_label = $Score  # Replace with actual path to label node

func coin_collected():
	score += 1
	score_label.text = "Score: " + str(score)
	
	if score >= 5:
		change_scene_to_game_over()

func change_scene_to_game_over():
	get_tree().change_scene_to_file("res://Labs/6/game_over.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
