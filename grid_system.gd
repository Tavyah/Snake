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
	
	print(grid_dict)

#TODO Sette riktige grid tiles som brukes til true eller false sånn at æ veit kor slangen kan gå eller kor maten kan gå
func _set_used_grid_tiles() -> void:
	pass
