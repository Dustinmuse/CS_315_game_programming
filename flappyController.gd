extends Node2D

@export var rock_resource: PackedScene = preload("res://spinnyplane/rock.tscn")

@onready var rock_timer: Timer = $rock_timer
@onready var game_over_control: Control = $GameOver
@onready var plane: RigidBody2D = $plane
@onready var animation_player: AnimationPlayer = $GameOver/AnimationPlayer

func _ready():
	rock_timer.start()  # Start the timer to spawn rocks

func plane_hit():
	game_over_control.visible = true
	$Spinnyplane/sfx/thud.play()
	animation_player.play("slide in")
	rock_timer.stop()

func _on_rock_timer_timeout():
	var rock_instance = rock_resource.instantiate()
	rock_instance.position.x = get_viewport_rect().size.x
	if randf() < 0.5:
		rock_instance.position.y = 0  # Spawn at top of the screen
		rock_instance.scale.y = -1  # Flip the rock if spawned at the top
	else:
		rock_instance.position.y = get_viewport_rect().size.y  # Spawn at bottom
		rock_instance.scale.y = 1  # Reset the rock's scale if spawned at the bottom
	add_child(rock_instance)

func _on_button_pressed():
	rock_timer.start()  # Restart rock spawning
	var plane = get_node("/root/Spinnyplane/plane")
	plane.position = Vector2(0, 0)  # Reposition plane at the center
	game_over_control.visible = false  # Hide GameOver control
