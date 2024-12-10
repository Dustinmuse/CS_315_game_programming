extends Area2D

var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()
var chance = rng.randi_range(1, 3)

func set_velocity(new_velocity: Vector2):
	velocity = new_velocity

func _process(delta: float) -> void:
	# Move the bullet
	position += velocity * delta
	
	# Remove the bullet if it goes out of the screen
	if not get_viewport_rect().has_point(global_position):
		queue_free()

func _on_area_2d_body_entered(body):
	# If the bullet collides with something, remove it
	if body.is_in_group("enemies"):
		body.queue_free()
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
