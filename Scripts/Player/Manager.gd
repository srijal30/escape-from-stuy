extends Node2D

#Currently this script takes care of: (maybe split it up
# items
# weapons
# interaction (in a way)

#weapon setup
var weapons = [] #storage of preloaded scenes
var activeWeapon
var current : int = 0

#passive setup
var passives = []

func add_passive( passive ):
	pass

func remove_passive( passive ):
	pass

func _process(delta):
	#switching weapon
	if Input.is_action_just_pressed("switch"):
		current = (current + 1) % len(weapons) #go to the next one in the cycle
		
		#get rid of old weapon
		if activeWeapon != null:
			activeWeapon.queue_free()
		
		#instantiate new weapon
		activeWeapon = weapons[current].instance()
		add_child(activeWeapon)
		
	#attacking
	if Input.is_action_just_pressed("attack"):
		#first check if there is weapon
		if activeWeapon != null:
			activeWeapon.attack()
		
		#if no weapon then debug message
		else:
			print("you have no weapon selected!")
	
	#TO DO
	#other attacks
