extends Node3D


const TILE_SIZE := 1.0 #el := significa que le pone el tipo de dato autoamticamente a travez del valor, en este caso un FLOAT
const HEXT_TILE = preload("res://Assets/HexTile.tscn")

const TILE_MATERIALS = [
	preload("res://Assets/green.tres"),
	preload("res://Assets/red.tres"),
	preload("res://Assets/yellow.tres"),
	preload("res://Assets/blue.tres"),
]

var grid_size := 10


# Called when the node enters the scene tree for the first time.
func _ready():
	_generate_grid()
	
func _generate_grid(): #seria una funcion privada
	var tile_index := 0
	for x in range(grid_size):
		var tile_coordinates := Vector2.ZERO
		tile_coordinates.x = x * TILE_SIZE * cos(deg_to_rad(30))
		tile_coordinates.y = 0 if x % 2 == 0 else TILE_SIZE / 2
		for y in range(grid_size):
			var tile = HEXT_TILE.instantiate()
			add_child(tile) 
			tile.translate(Vector3(tile_coordinates.x, 0, tile_coordinates.y))
			tile_coordinates.y += TILE_SIZE
			tile.get_node("unit_hex/mergedBlocks(Clone)").material_override = get_tile_material(tile_index)
			tile_index += 1
			
func get_tile_material(tile_index: int):
	var index = tile_index % TILE_MATERIALS.size()
	return TILE_MATERIALS[index]
