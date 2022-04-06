extends KinematicBody2D


#player movement vars
var speed : int  = 300
var velocity : Vector2  = Vector2(0, 0)
var dashMultiplier : int = 10

#store mouse position and create pointer object
var mousePos : Vector2 = Vector2(0, 0)
onready var pointer = get_node("Pointer")


#store bullet
onready var Bullet = preload("res://Bullet.tscn")


func _physics_process(delta):
	#reset
	velocity.x = 0
	velocity.y = 0
	
	#movement inputs
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	
	#for rolling
	if Input.is_action_just_pressed("roll"):
		velocity *= dashMultiplier
		
	#moving
	move_and_slide(velocity)
	
	#hide the pointer
	if Input.is_action_just_pressed("hide"):
		if pointer.visible:
			pointer.visible = false
		else:
			pointer.visible = true

	#right direction of pointer
	if pointer.visible:
		pointer.set_rotation_degrees( rad2deg( mousePos.angle_to_point(position) ) + 90)
		
	#shoot
	if Input.is_action_just_pressed("attack"):
		#create instance of new bullet
		var bullet = Bullet.instance()
		#add it as child to owner
		owner.add_child(bullet)
		#set position of bullet to player position
		bullet.position = position
		bullet.set_rotation_degrees( pointer.get_rotation_degrees() - 90)
			


func _input(event):
	if event is InputEventMouse:
		mousePos = event.position
