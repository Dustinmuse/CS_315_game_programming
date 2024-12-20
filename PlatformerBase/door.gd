extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var game_controller = get_node("/root/GameController") 
		game_controller.checkDoor()
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		var game_controller = get_node("/root/GameController") 
		game_controller.exitedDoor()
	pass # Replace with function body.
