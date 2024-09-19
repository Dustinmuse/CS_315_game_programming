extends RigidBody2D

# Declare necessary variables
var flap_force = Vector2(0, -300)

func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("flap"):
		linear_velocity = flap_force
