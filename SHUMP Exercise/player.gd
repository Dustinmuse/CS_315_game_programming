extends CharacterBody2D

var bulletScene = preload("res://SHUMP Exercise/bullet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -350
	if Input.is_action_pressed("ui_right"):
		velocity.x = 350
		
	if Input.is_action_just_pressed("fire"):
		var bullet = bulletScene.instantiate()
		bullet.position.x = self.position.x
		bullet.position.y = self.position.y
		bullet.set_name("bullet")
		get_node("/root/SpaceShipShooter").add_child(bullet)
		
		
	velocity.x *= .96
		
	move_and_slide()
