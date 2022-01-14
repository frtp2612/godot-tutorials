extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _draw():
	var start = Vector2.ZERO
	var end = Vector2.ZERO
	for row_index in Settings.WORLD_GRID_ROWS + 1:
		start = Vector2(0, row_index) * Settings.TILE_SIZE
		end = Vector2(Settings.WORLD_GRID_COLUMNS, row_index) * Settings.TILE_SIZE
		draw_line(start, end, Color.white)
	
	for column_index in Settings.WORLD_GRID_COLUMNS + 1:
		start = Vector2(column_index, 0) * Settings.TILE_SIZE
		end = Vector2(column_index, Settings.WORLD_GRID_ROWS) * Settings.TILE_SIZE
		draw_line(start, end, Color.white)
