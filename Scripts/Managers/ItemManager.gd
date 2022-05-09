extends Node

#loads all items and stores them

var items : Dictionary = {} 

func _ready():
	var directory = Directory.new()
	directory.open("res://Resources/Items")
	directory.list_dir_begin()
	
	#get/load all items
	var filename = directory.get_next()
	while(filename):
		if not directory.current_is_dir():
			#add to items
			var res = load("res://Resources/Items/" + filename)
			items[res.name] = res
		filename = directory.get_next()
		
func get_item( item_name ):
	#if item found
	if item_name in items:
		return items[item_name]
	#else
	print("not a valid item name!")
	return items[item_name]
