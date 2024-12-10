extends Node2D

var enemy = preload("res://scenes/enemy.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	#spwans enemy
	var enemy = enemy.instantiate()
	enemy.position.x = rng.randf_range(100.0, 900.0)
	enemy.position.y = rng.randf_range(100.0, 900.0)
	enemy.set_name("enemy")
	
	# Access the Sprite2D node inside the enemy scene
	var sprite = enemy.get_node("Sprite2D")
	var frame = rng.randi_range(16, 23)
	sprite.frame = frame
	
	get_node("/root/GameController").add_child(enemy)
