extends Node

var tile_size : int:
	get:
		return 8
	set(new_tile_size):
		tile_size = new_tile_size
		
var grid_size : int:
	get:
		return 64
	set(new_grid_size):
		grid_size = new_grid_size

func _ready() -> void:
	_generate_grid()

func _generate_grid() -> void:
	var grid_dict : Dictionary = {}

	for coor_x in range(-36, 36 + 8, tile_size):
		for coor_y in range(-32, 40 + 8, tile_size):
			var coordinates : Vector2 = Vector2(coor_x, coor_y)
			grid_dict[coordinates] = true
	
	# Making start position false since it's a grid tile that is being used
	var first_grid_position : Vector2 = Vector2(4, 0)
	grid_dict[first_grid_position] = false
	print(grid_dict)

func move_to_grid_tile(current_grid_tile: Vector2, new_direction: Vector2) -> Vector2:
	# Sjekke kor man e hen på griden, deretter flytte til neste grid tile utifra hvilken Vector2 input man har
	printt(current_grid_tile, 'this is the current grid tile')
	#print(new_direction * tile_size)
	var next_grid_tile = current_grid_tile + (new_direction * tile_size)
	printt(next_grid_tile, 'this is the next grid tile')
	return next_grid_tile
	
	
#TODO Sette riktige grid tiles som brukes til true eller false sånn at æ veit kor slangen kan gå eller kor maten kan gå
func _set_used_grid_tiles() -> void:
	pass
