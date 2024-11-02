extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var climb_speed = 20
var climbing = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	
	if abs(velocity.x) > .1 and $AnimatedSprite2D.animation != "walk":
		$AnimatedSprite2D.play("walk")
	elif abs(velocity.x) < .1 and $AnimatedSprite2D.animation != "idle":
		$AnimatedSprite2D.play("idle")
	if $AnimatedSprite2D.animation == "walk" and $FootSteps.playing == false and is_on_floor():
		$FootSteps.play()
		
		
		
	if(velocity.x > 0):
		$AnimatedSprite2D.scale.x = -1
	elif (velocity.x < 0):
		$AnimatedSprite2D.scale.x = 1
	
	
	if climbing and Input.is_action_pressed("climb_ladder"):
		self.velocity.y -= climb_speed
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#play jump noise
		$Jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#
		
	

	move_and_slide()


func _on_lower_wall_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1,4)
	pass # Replace with function body.


func _on_lower_wall_2_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1,4)
	pass # Replace with function body.


func _on_right_wall_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1, 4)
	pass # Replace with function body.


func _on_upper_wall_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1, 4)
	pass # Replace with function body.


func _on_left_wall_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1, 4)
	pass # Replace with function body.


func _on_water_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1, 4)
	pass # Replace with function body.


func _on_water_2_body_entered(body: Node2D) -> void:
	self.position = Vector2(-1, 4)
	pass # Replace with function body.
	
func climb_ladder():
	#being access and shouldnt be
	climbing = true
	

func exited_ladder():
	climbing = false
