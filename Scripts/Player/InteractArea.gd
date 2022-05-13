extends Area2D

#Interaction Manager (job is to pickup weapons and passives)

#currently only works with items (weapons and passives)
#in the future maybe for chests, doors, etc

func add_weapon( weapon ):
	get_parent().weapons.append( weapon )
	
func add_passive( passive ):
	print("passives not implemented yet")

#precondition, valid pickupable
func pickup( current ):
	#if a weapon
	if current.is_in_group("weapon"):
		add_weapon( current.item_name )
		current.queue_free()
	#if a passive
	elif current.is_in_group("passive"):
		add_passive( current.item_name )
		current.queue_free()
	#something else
	else:
		print( current )
		print( current.item_name )
		print( current.is_in_group("weapon") )
		print("something went wrong in item pickup")

func _physics_process(delta):
	#when we pick up, we add the item string name
	if Input.is_action_just_pressed("interact"):
		var areas = get_overlapping_areas()
		
		if areas != []: #check if we are overlapping w/ areas
			
			#for item pickup
			if areas[0].is_in_group("pickupable"): #check if we are overlapping w/ pickup
				pickup( areas[0].get_parent() )
			#for scene transitions
			if areas[0].is_in_group("portal"):
				areas[0].get_parent().change()
			
		#default no items to pickup message
			else:
				print("no items to pickup!")
		else:
			print("no items to pickup!")
			
		
