extends Node2D

@onready var player = get_node("player")
var hit_counter = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#takes away health each time the player is hit
func add_hit():
	hit_counter += 1
	player.decrease_health()
