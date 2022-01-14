extends Sprite

export var speed = 4

var target_position = Vector2.ZERO
var movement_direction = Vector2.ZERO

var snap_vector = Vector2.ZERO


func _ready():
	target_position = position
	snap_vector = Vector2(Settings.TILE_SIZE, Settings.TILE_SIZE)

func _process(delta):
	if position == target_position:
		if Input.is_action_pressed("ui_up"):
			movement_direction = Vector2.UP
		elif Input.is_action_pressed("ui_down"):
			movement_direction = Vector2.DOWN
		elif Input.is_action_pressed("ui_left"):
			movement_direction = Vector2.LEFT
		elif Input.is_action_pressed("ui_right"):
			movement_direction = Vector2.RIGHT
		else:
			movement_direction = Vector2.ZERO
		
		if is_position_allowed():
			target_position += movement_direction * Settings.TILE_SIZE
	else:
		move(movement_direction)
	
func move(direction : Vector2) -> void:
	if position.distance_to(target_position) > speed:
		position += direction * speed
	else:
		position = position.snapped(snap_vector)
		position = target_position
		movement_direction = Vector2.ZERO

func is_position_allowed():
	var new_position = target_position / Settings.TILE_SIZE + movement_direction
	return new_position.x > 0 && new_position.x < Settings.WORLD_GRID_COLUMNS && new_position.y > 0 && new_position.y < Settings.WORLD_GRID_ROWS
