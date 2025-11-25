extends Node2D

var enemy = preload("res://Scenes/Enemies/enemy.tscn")
var spawnedenemies = 0

func _ready() -> void:
	print("setting up spawner")

func _on_timer_timeout() -> void:
	
	if spawnedenemies < 3:
		print("spawning enemy")
		var ene = enemy.instantiate()
		ene.position = position
		get_parent().add_child(ene)
		spawnedenemies += 1
	
	
