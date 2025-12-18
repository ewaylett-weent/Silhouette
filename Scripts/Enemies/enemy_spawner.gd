extends Node2D

@export var enemy = preload("res://Scenes/Enemies/enemy.tscn")
@export var groupSize = 2

var spawnedEnemies = false
var enemyArray = []

func _ready() -> void:
	print("setting up spawner")
	spawnEnemies()
	
func _on_timer_timeout() -> void:
	print("timer timeout")
	spawnEnemies()
	
func spawnEnemies() : 
	print(enemyArray.size())
	var i = 0
	var l = 0
	
	while l < enemyArray.size():
		print("checking validity")
		if is_instance_valid(enemyArray.get(l)) == false:
			print("node gone")
			enemyArray.remove_at(l)
		if enemyArray.is_empty():
			spawnedEnemies = false
		l += 1
	
	if spawnedEnemies == false:
		while i < groupSize:
			print("spawning enemy")
			var ene = enemy.instantiate()
			ene.position = getSpawnPosition()
			get_parent().add_child.call_deferred(ene)
			enemyArray.append(ene)
			print(enemyArray.size())
			i += 1
		
		spawnedEnemies = true
	
func getSpawnPosition() : 
	var center_position = position
	var min_distance = -200
	var max_distance = 200
	
	var newPosition = center_position
	newPosition.x = center_position.x + randf_range(min_distance, max_distance)
	newPosition.y = center_position.y + randf_range(min_distance, max_distance)
	
	print(newPosition)
	return newPosition
