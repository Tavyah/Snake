extends Node

var tile_size : int:
	get:
		return 8
	set(new_tile_size):
		tile_size = new_tile_size
		
var grid_size : int:
	get:
		return 16
	set(new_grid_size):
		grid_size = new_grid_size

func _ready() -> void:
	_generate_grid()

func _generate_grid() -> void:
	var grid_dict : Dictionary = {}

	for coor_x in range(tile_size / 2, grid_size + 1, tile_size / 2):
		for coor_y in range(0, grid_size + 1, tile_size / 2):
			var coordinates : Vector2 = Vector2(coor_x, coor_y)
			grid_dict[coordinates] = true
	
	# Making start position false since it's a grid tile that is being used
	var first_grid_position : Vector2 = Vector2(4, 0)
	grid_dict[first_grid_position] = false
	print(grid_dict)

func move_to_grid_tile(current_grid_tile: Vector2, new_direction: Vector2) -> Vector2:
	# Sjekke kor man e hen på griden, deretter flytte til neste grid tile utifra hvilken Vector2 input man har
	print(current_grid_tile)
	current_grid_tile.snapped(current_grid_tile)
	print(current_grid_tile)
	print(new_direction * tile_size)
	return current_grid_tile + (new_direction * tile_size)
	
	
#TODO Sette riktige grid tiles som brukes til true eller false sånn at æ veit kor slangen kan gå eller kor maten kan gå
func _set_used_grid_tiles() -> void:
	pass
