extends RigidBody2D

@export var speed = 100

func _ready() -> void:
	# Set the initial downward velocity
	linear_velocity = Vector2(0, speed)

func _process(delta: float) -> void:
	# Check if the enemy has moved off-screen
	if position.y > 400:
		get_node("/root/SpaceShipShooter").game_over()

func _on_body_shape_entered(body_rid: RID, body: Node, body_shape_index: int, local_shape_index: int) -> void:
	if body.name == "Player" or body.name == "bullet":
		body.queue_free()
		var game_controller = get_node("/root/SpaceShipShooter")
		game_controller.incrementScore()
	self.queue_free()
