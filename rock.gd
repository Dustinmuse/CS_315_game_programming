extends Area2D

# Called when the node enters the area
func _on_body_entered(body):
	if body.name == "plane":  # Assuming the plane is named "plane"
		# Get the root node
		var root = get_tree().root.get_node("/root/Spinnyplane")
		root.plane_hit()  # Invoke the "plane_hit" function

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
