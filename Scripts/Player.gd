extends KinematicBody2D

#player movement vars
var speed : int  = 450
var velocity : Vector2  = Vector2(0, 0)
var dashMultiplier : int = 20

#weapon setup
onready var gun = get_node("Gun")
onready var sword = get_node("Sword")
var current_weapon = "gun"

#for other
func _process(delta):
	#switching weapon
	if Input.is_action_just_pressed("switch"):
		if current_weapon == "gun":
			current_weapon = "sword"
			gun.visible = false
			sword.visible = true
			
		else:
			current_weapon = "gun"
			sword.visible = false
			gun.visible = true
			
	#attacking
	if Input.is_action_just_pressed("attack"):
		#if gun 
		if current_weapon == "gun":
			gun.shoot()
		#if sword
		if current_weapon == "sword":
			sword._swing()
	
#for physics
func _physics_process(delta):
	#reset
	velocity.x = 0
	velocity.y = 0
	
	#movement inputs
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed("roll"):
		velocity *= dashMultiplier
	
	#moving
	move_and_slide(velocity)
