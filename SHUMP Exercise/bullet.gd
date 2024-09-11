extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.linear_velocity.y = -2000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y < -10:
		queue_free()

func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Enemy":
		body.queue_free()
		self.queue_free()
