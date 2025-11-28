extends CharacterBody2D

var floatingText = preload("res://Scenes/Misc/Floating_Text.tscn")

var speed = 300
var health = 200
var damage = 100
var dead = false
var playerInArea = false
var player

func _ready():
	dead = false
	
func _physics_process(delta: float) -> void:
	if !dead:
		$detectionBox/CollisionShape2D.disabled = false
		if playerInArea:
			position += (player.position - position).normalized() * speed * delta
			
	if dead:
		$detectionBox/CollisionShape2D.disabled = true
		
	move_and_slide()
	

func _on_detection_box_body_entered(body):
	if body.has_method("player"):
		playerInArea = true
		player = body


func _on_detection_box_body_exited(body):
	pass

func _on_hit_box_area_entered(area):
	var dmg
	if area.has_method("arrow"):
		dmg = area.damage
		takeDamage(dmg)
		
func takeDamage(dmg):
	health = health - dmg
	
	var text = floatingText.instantiate()
	text.amount = dmg
	text.position.y = text.position.y - 30
	add_child(text)
	
	if health <= 0 and !dead:
		death()
		
func death():
	dead = true
	queue_free()
