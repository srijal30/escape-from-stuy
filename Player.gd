extends KinematicBody2D


var speed : int  = 300
var velocity : Vector2  = Vector2(0, 0)
var dashMultiplier : int = 10

var mousePos : Vector2 = Vector2(0, 0)

var pointer

func _ready():
	pointer = get_node("Pointer")	

func _physics_process(delta):
	
	#reset
	velocity.x = 0
	velocity.y = 0
	
	#inputs
	if Input.is_action_pressed("move_up"):
		velocity.y -= speed
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	
	if Input.is_action_just_pressed("dash"):
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


func _input(event):
	if event is InputEventMouse:
		mousePos = event.position
