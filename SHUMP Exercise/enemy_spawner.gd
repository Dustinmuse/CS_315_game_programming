extends Node2D

var enemy = preload("res://SHUMP Exercise/enemy.tscn")

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var enemy = enemy.instantiate()
	enemy.position.x =  rng.randf_range(10.0, 1200.0)
	enemy.position.y = -30
	enemy.set_name("enemy")
	get_node("/root/SpaceShipShooter").add_child(enemy)
