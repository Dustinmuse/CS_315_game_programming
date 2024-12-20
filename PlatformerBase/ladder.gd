extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var player_controller = get_node("/root/GameController/Player")
		player_controller.climb_ladder() #change to a function for climbing ladder
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		var player_controller = get_node("/root/GameController/Player")
		player_controller.exited_ladder() #change to a function for climbing ladder
	pass # Replace with function body.
