extends Area2D


var swinging = false

func _swing():
	swinging = true
	
func _physics_process(delta):
	#using interpolation
	if swinging and rotation_degrees < 180:
		rotation_degrees += 20
			
	if rotation_degrees >= 180:
		rotation_degrees = 0
		swinging = false
	
	if len(get_overlapping_areas()) > 0:
		print("we collided")
		
