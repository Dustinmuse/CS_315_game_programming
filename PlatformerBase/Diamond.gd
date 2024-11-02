extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#get a ref to game controller
	var game_controller = get_node("/root/GameController")
	#call that increase score function
	game_controller.addScore()
	self.queue_free()
	pass # Replace with function body.
