extends KinematicBody2D

#how fast the player moves
var speed : int  = 450
#multiplier for roll distance
var rollMultiplier : int = 20

#to store velocity
var velocity : Vector2  = Vector2(0, 0)


#TO DO: implement delta so people w/ faster fps dont move faster
#maybe you dont even have to do ^^ cuz _physics_process calls 60times_a_second
# warning-ignore:unused_argument
func _physics_process(delta):
	#reset
	velocity = Vector2(0, 0)
	#movement inputs
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	#make sure that you dont move faster diag
	velocity = velocity.normalized() * speed
	
	#if rolling, multiply move distance
	if Input.is_action_just_pressed("roll"):
		velocity *= rollMultiplier
	
	#animation stuff
	if velocity.x > 0:
		$Gfx.flip_h = false
		$AnimationPlayer.play("running")
	elif velocity.x < 0:
		$Gfx.flip_h = true
		$AnimationPlayer.play("running")
	else:
		$AnimationPlayer.play("idle")

	#movement
	move_and_slide(velocity)
	
	
