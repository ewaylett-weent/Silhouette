extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$buildings/Portal.destination = "res://Scenes/silhouette.tscn"
	$buildings/Portal._change_Text("Press 'F' to Travel to the Void")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
