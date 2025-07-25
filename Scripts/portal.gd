extends Area2D

var playerInArea = false
var destination: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and playerInArea:
		get_tree().change_scene_to_file(destination)
		

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		$PortalText.visible = true
		playerInArea = true

func _on_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		$PortalText.visible = false
		playerInArea = false

func _change_Text(string: String):
	$PortalText.clear()
	$PortalText.add_text(string)
