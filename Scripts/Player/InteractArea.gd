extends Area2D

#INTerACtion Manager
#curretnly only works with items (weapons and passives)

#in the future maybe for chests, doors, etc
var currentItem #will store the item area

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		#first check if there even is an item to interat with
		if currentItem != null:
			#then find out what type
			
			if currentItem.is_in_group("weapon"):
				get_parent().weapons.append( currentItem.itemSrc )
				print("got weapon")
				print( get_parent().weapons )
				currentItem.queue_free()
				
			if currentItem.is_in_group("passive"):
				get_parent().passives.append( currentItem.itemSrc )
				print("got passive")
				print( get_parent().passives )
				currentItem.queue_free()

func _on_InteractArea_area_entered(area):
	#check if you can pick it up
	if area.owner == null:
		return
	if area.owner.is_in_group("pickup"):
		currentItem = area.owner #cuz we want the object not area
	print("you can pick up")
	print(currentItem)
	print()

#i think this is scuffed
func _on_InteractArea_area_exited(area):
	if area == currentItem:
		currentItem = null
	print("you cant pick up")
	print(currentItem)
	print()
