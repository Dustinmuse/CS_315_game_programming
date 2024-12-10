extends CharacterBody2D

@export var health = 3
@export var speed = 300.0
@export var bullet_scene: PackedScene
@export var bullet_speed = 500.0
@export var key_scene: PackedScene = preload("res://scenes/key.tscn")
@onready var label = $Camera2D/Label
@onready var camera = $Camera2D
var is_dead = false
var can_shoot = false
var key = false
var in_chest = false
var facing = 1
var close_enemy = false
var current_enemy: Node = null # Reference to the enemy in the area
var spawn_key = false
var rng = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	
	# Handle attack when an enemy is close
	if Input.is_action_just_pressed("melee") and close_enemy and current_enemy:
		current_enemy.queue_free() # Free the enemy
		close_enemy = false # Reset the flag
		current_enemy = null # Clear the reference
		if spawn_key == false:
			var chance = rng.randi_range(1, 3)
			if chance == 2:
				var key = key_scene.instantiate()
				key.position = position  # Spawn key at enemy's position
				get_parent().add_child(key)
				spawn_key = true
		
	#switches frame of the character to a frame of the character with a gun
	if Input.is_action_just_pressed("use") and key and in_chest:
		var sprite = get_node("Sprite2D")
		sprite.frame = 14
		can_shoot = true
		
	# Shooting functionality
	if Input.is_action_just_pressed("attack") and can_shoot:
		shoot_bullet()
		
	#need to change to the cursor (optional)
	var dir = Input.get_vector("left", "right", "up", "down")

	#changes the way the sprite is facing (left or right)
	if dir.x < 0 and facing == 1:
		self.scale.x *= -1
		facing = -1
		
	if dir.x > 0 and facing == -1:
		self.scale.x *= -1
		facing = 1

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement
	velocity.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	velocity.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	
	velocity = velocity.normalized()
	
	#setting the bounds/out of bounds limit
	global_position.x = clamp(global_position.x, 20, 600) #size of player, screen size (width)
	global_position.y = clamp(global_position.y, 20, 285) #size of player, screen size (height)
	 
	if is_dead == false:
		global_position += speed * velocity * delta
		
func shoot_bullet() -> void:
	if bullet_scene:
		# Create the bullet instance
		var bullet = bullet_scene.instantiate()
		bullet.position = global_position
		
		# Calculate direction towards the mouse cursor
		var direction = (get_global_mouse_position() - global_position).normalized()
		
		# Add the bullet to the scene
		get_parent().add_child(bullet)
		
		# Set bullet velocity in the bullet script
		if bullet.has_method("set_velocity"):
			bullet.set_velocity(direction * bullet_speed)
		$shooting.play()
		
		
func decrease_health():
	health -= 1
	if health <= 0:
		is_dead = true
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		queue_free()
		
func set_key_true():
	key = true


func _on_chest_body_entered(body: Node2D) -> void:
	if body.name == "player":
		in_chest = true


func _on_chest_body_exited(body: Node2D) -> void:
	if body.name == "player":
		in_chest = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	# Check if the body is an enemy
	if body.is_in_group("enemies"):
		close_enemy = true
		current_enemy = body # Store reference to the enemy


func _on_area_2d_body_exited(body: Node2D) -> void:
	# Reset the enemy reference if it leaves the area
	if body == current_enemy:
		close_enemy = false
		current_enemy = null
