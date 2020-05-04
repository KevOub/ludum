extends TileMap

enum TILES {Air,Ground}

export (int) var width = 50
export (int) var height = 50

var current_map_size = Vector2(width,height)
var Candle = preload("res://items/Light.tscn")
var Slinger = preload("res://enemies/springer/springer.tscn")
var Groot = preload("res://enemies/groot/groot.tscn")
var WeakZombie = preload("res://enemies/weak_zombie/zombie.tscn")
var CommonChest = preload("res://items/chests/CommonChest.tscn")
var RareChest = preload("res://items/chests/RareChest.tscn")


var player = null

export (float, 0.0,100.0) var percentage_floors
export (float, 0.0,100.0) var percentage_candles
export (float, 0.0,100.0) var percentage_ok_chests
export (float, 0.0,100.0) var percentage_good_chests
export (float, 0.0,100.0) var percentage_enemies
export (int) var steps

var neighbor_dir = [Vector2(1,0),Vector2(1,1),Vector2(0,1),Vector2(-1,0),
Vector2(-1,-1),Vector2(0,-1),Vector2(1,-1),Vector2(-1,1)]

func _ready():
	player = get_node("Player")
	randomize()
	make_map()
	for i in range(steps):
		smooth_map()
		update_bitmask_region()
	
	add_sprites()
	
	player.position = place_player()
	#sgetallnodes(get_tree().root.get_node("InfiniteWorld/TileMap"))

func _process(delta):
	pass


func getallnodes(node):
	for N in node.get_children():
		if N.get_child_count() > 0:
			print("["+N.get_name()+"]")
			getallnodes(N)
		else:
			# Do something
			print("- "+N.get_name())


func make_map():
	# create the boundary with air!
	for x in range(0,current_map_size.x):
		for y in range(0,current_map_size.y):
			var num = rand_range(0.0,100.0)
			set_cell(x,y,TILES.Air)
							
	# Set core of map
	for x in range(1,current_map_size.x-1):
		for y in range(1,current_map_size.y-1):
			
			var num = rand_range(0.0,100.0)
			# if the number generated is greater than the percentage
			# put ground
			if num  < percentage_floors:
				set_cell(x,y,TILES.Ground)
			else:
				set_cell(x,y,TILES.Air)
	
func smooth_map():
	for x in range(1,current_map_size.x-1):
		for y in range(1,current_map_size.y-1):
			var number_of_neighbors_walls = 0
			for direction in neighbor_dir:
				if get_cell(x+direction.x,y+direction.y) == TILES.Air:
					number_of_neighbors_walls += 1
			if number_of_neighbors_walls < 4:
				set_cell(x,y,TILES.Ground)
	
			elif number_of_neighbors_walls > 4:
				set_cell(x,y,TILES.Air)

func create_sprite_at(sprite,x,y):
	
	self.add_child(sprite)
	sprite.global_position = map_to_world(Vector2(x,y))
				
	
func add_sprites():
	for x in range(1,current_map_size.x-1):
		for y in range(1,current_map_size.y-1):	
			var number_of_neighbors_walls = 0
			for direction in neighbor_dir:
				if get_cell(x+direction.x,y+direction.y) == TILES.Ground:
					number_of_neighbors_walls += 1
			
			var num = rand_range(0.0,100.0)
			
			if get_cell(x,y) == TILES.Ground and number_of_neighbors_walls >= 5 and number_of_neighbors_walls <= 7:
				# candles go here
				if num < percentage_candles:
					var candle = Candle.instance()
					create_sprite_at(candle,x,y)
					
			# TODO improve random number generation
			if get_cell(x,y) == TILES.Ground and number_of_neighbors_walls == 8:
				# since all the blocks are solid
				# enemies go here
				
				if num < percentage_enemies:
					var slinger = Slinger.instance()
					create_sprite_at(slinger,x,y)
					continue
				
				if num < (percentage_enemies + (percentage_enemies * rand_range(0,1))):
					var groot = Groot.instance()
					create_sprite_at(groot,x,y)
					continue
					
				
				if num < (percentage_ok_chests):
					var chest = CommonChest.instance()
					create_sprite_at(chest,x,y)
					continue
				
				
				if num < (percentage_good_chests):
					var chest = RareChest.instance()
					create_sprite_at(chest,x,y)
					continue

func place_player():
	var coords = Vector2()
	var number_of_neighbors_walls = 0
	while true:
		number_of_neighbors_walls = 0
		var random_x = int(rand_range(1,current_map_size.x-1))
		var random_y = int(rand_range(1,current_map_size.y-1))
		coords = Vector2(random_x,random_y)
		for direction in neighbor_dir:
			if get_cell(random_x+direction.x,random_y+direction.y) == TILES.Ground:
				number_of_neighbors_walls += 1
							
		if get_cell(coords.x,coords.y) == TILES.Ground and number_of_neighbors_walls >= 5:
			break
	return map_to_world(coords)
	
