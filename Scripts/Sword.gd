extends Node2D


var swinging = false

func _swing():
	swinging = true
	
func _physics_process(delta):
	
	if swinging and rotation_degrees < 90:
		rotation_degrees += 10
		print( "swinging ")
			
	if rotation_degrees >= 90:
		rotation_degrees = 0
		swinging = false
