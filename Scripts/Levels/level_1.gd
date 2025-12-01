extends Node2D

var level = 1
var player = preload("res://Scenes/Player/player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Loading Level")
	var playerInst = player.instantiate()
	playerInst.position = $Portal.position
	add_child(playerInst)
	$Portal.destination = "res://Scenes/village.tscn"
	$Portal._change_Text("Press 'F' to Return Home")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
