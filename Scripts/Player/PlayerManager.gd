extends Node2D

#Currently this script takes care of: (maybe split it up
# items
# weapons
# interaction (in a way)

#weapon setup
var weapons = [] #storage weapon name strings
var activeWeapon = null #storage of activated weapon scene instance
var current : int = 0

#passive setup
#NOT IMPLEMENTED YET
var passives = []

func add_passive( passive ):
	pass

func remove_passive( passive ):
	pass

func switch_weapon():
	if PlayerInv.weapons == []:
		print("you have no weapons!")
		return
	current = (current + 1) % len(PlayerInv.weapons) #go to the next one in the cycle
	#get rid of old weapon
	if activeWeapon != null:
		activeWeapon.queue_free()
	#instantiate new weapon
	activeWeapon = ItemManager.get_item( PlayerInv.weapons[current] ).src.instance()
	activeWeapon.transform = $Hand.transform
	add_child(activeWeapon)
	

func _process(delta):
	#switching weapon
	if Input.is_action_just_pressed("switch"):
		switch_weapon()
		
	#attacking
	if Input.is_action_just_pressed("attack"):
		#first check if there is weapon
		if activeWeapon != null:
			activeWeapon.attack()
		#if no weapon then debug message
		else:
			print("you have no weapon selected!")
	
	if Input.is_action_just_pressed("second_attack"):
		#first  check if there is a weapon
		if activeWeapon != null:
			activeWeapon.second_attack()
		else:
			print("you have no weapon selected!")
	
	
