extends Area2D

var playerInArea = false
var upgradeCost = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelText.clear()
	$LevelText.add_text("Level : " + str(Global.offenceBuildingLevel))
	var buyString = "Press F to Upgrade to Level %s for %.0f gold" % [str(Global.offenceBuildingLevel + 1), upgradeCost]
	$UpgradeText.clear()
	$UpgradeText.add_text(buyString)


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
	if (Global.gold >= upgradeCost):
		Global.gold -= upgradeCost
		Global.offenceBuildingLevel += 1
		upgradeCost = Global.offenceBuildingLevel * 2
	
		$LevelText.clear()
		$LevelText.add_text("Level : " + str(Global.offenceBuildingLevel))
		var buyString = "Press F to Upgrade to Level %s for %.0f gold" % [str(Global.offenceBuildingLevel + 1), upgradeCost]
		$UpgradeText.clear()
		$UpgradeText.add_text(buyString)
	
	
