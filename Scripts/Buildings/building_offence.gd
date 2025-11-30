extends Area2D

var playerInArea = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelText.clear()
	$LevelText.add_text("Level : " + str(Global.offenceBuildingLevel))
	$UpgradeText.clear()
	$UpgradeText.add_text("Press F to Upgrade to Level  " + str(Global.offenceBuildingLevel + 1))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and playerInArea:
		LevelBuilding()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		$UpgradeText.visible = true
		playerInArea = true

func _on_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		$UpgradeText.visible = false
		playerInArea = false
	
func LevelBuilding() : 
	Global.offenceBuildingLevel += 1
	
	$LevelText.clear()
	$LevelText.add_text("Level : " + str(Global.offenceBuildingLevel))
	
	$UpgradeText.clear()
	$UpgradeText.add_text("Press F to Upgrade to Level  " + str(Global.offenceBuildingLevel + 1))
