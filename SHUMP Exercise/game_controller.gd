extends Node2D

var score = 0
@export var txtScore : Label
@export var Player : Node2D
@export var EnemySpawner : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func incrementScore():
	$txtScore.text = str(score)
	score += 1
	
func game_over():
	if(Player != null):
		Player.queue_free()
		EnemySpawner.queue_free()
