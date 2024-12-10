extends CharacterBody2D

@export var speed = 100
@onready var player = get_parent().get_node("player")
@onready var audio_player = $Grrr
var player_position
var target_position


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta: float) -> void:
	if is_instance_valid(player):
		# Get the player's position
		player_position = player.position
		
		# Calculate the direction towards the player
		var direction = (player_position - position).normalized()
		
		# Update velocity to move towards the player
		if position.distance_to(player_position) > 3:
			position += direction * speed * delta
			#plays Grrr sound
			if not audio_player.is_playing():
				audio_player.play()
		else:
			var game_controller = get_node("/root/GameController")
			self.queue_free()
			game_controller.add_hit()
