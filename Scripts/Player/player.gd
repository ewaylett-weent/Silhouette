extends CharacterBody2D


@export var movementSpeed : float = 300
@export var dashSpeed = 1000
@export var dashDuration = 0.3
@export var dashCooldown = 1

var characterDirection : Vector2
var isDashing = false
var canDash = true
var dashTimer = Timer.new()
var dashCooldownTimer = Timer.new()

var bowEquiped = true
var bowCooldown = true
var arrow = preload("res://Scenes/Player/arrow.tscn")

var mouseLocFromPlayer = null


func _ready():
	add_child(dashTimer)
	dashTimer.wait_time = dashDuration
	dashTimer.one_shot = true
	dashTimer.timeout.connect(_on_dash_timeout)

	add_child(dashCooldownTimer)
	dashCooldownTimer.wait_time = dashCooldown
	dashCooldownTimer.one_shot = true
	dashCooldownTimer.timeout.connect(_on_dash_cooldown_timeout)

func _physics_process(_delta):
	mouseLocFromPlayer = get_global_mouse_position() - self.position
	
	characterDirection.x = Input.get_axis("move_left", "move_right")
	characterDirection.y = Input.get_axis("move_up", "move_down")
	characterDirection = characterDirection.normalized()

	if characterDirection:
		velocity = characterDirection * movementSpeed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movementSpeed)
		
	if Input.is_action_just_pressed("dash") and canDash:
		start_dash()
	if isDashing:
		velocity = velocity.normalized()*dashSpeed

	move_and_slide()
	
	var mousePos = get_global_mouse_position()
	$Marker2D.look_at(mousePos)
	
	if Input.is_action_pressed("attack") and bowEquiped and bowCooldown:
		bowCooldown = false
		var arrow_instance = arrow.instantiate()
		arrow_instance.rotation = $Marker2D.rotation
		arrow_instance.global_position = $Marker2D.global_position
		add_child(arrow_instance)
		
		await get_tree().create_timer(0.4).timeout
		bowCooldown = true
		
		
	
func start_dash():
	isDashing = true
	canDash = false
	dashTimer.start()
	
func _on_dash_timeout():
	isDashing = false
	dashCooldownTimer.start()
	
func _on_dash_cooldown_timeout():
	canDash = true
	
func player():
	pass
