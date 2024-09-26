extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		var game_controller = get_tree().root.get_node("Node2D")
		game_controller.coin_collected()
		self.queue_free()
	pass # Replace with function body.
