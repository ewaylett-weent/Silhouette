extends Area2D

var playerInArea = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PickupLabel.visible = false
	$PickupLabel.add_text("Press F to pickup")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and playerInArea:
		Global.level1Completed = true
		self.queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		$PickupLabel.visible = true
		playerInArea = true


func _on_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		$PickupLabel.visible = false
		playerInArea = false
