extends KinematicBody2D

var velocity = Vector2.ZERO
export var movement_speed = 128

func _ready():
	pass

func _process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	
	if velocity != Vector2.ZERO:
		move_and_slide(velocity * movement_speed, Vector2.UP)
#	value_based_movement(delta)
	vector_based_movement(delta)

func value_based_movement(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1
	
	if velocity != Vector2.ZERO:
		move_and_slide(velocity * movement_speed, Vector2.UP)

func vector_based_movement(delta):
	velocity = Vector2.ZERO
	
	velocity = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)

	if velocity != Vector2.ZERO:
		move_and_slide(velocity * movement_speed, Vector2.UP)
