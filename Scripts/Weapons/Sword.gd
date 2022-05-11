extends Area2D

var swinging = false
var damage = 50

#to swing the sword
func attack():
	$AnimationPlayer.play("swing")
	
#physics processing
func _physics_process(delta):
	#using interpolation
	if swinging and rotation_degrees < 180:
		rotation_degrees += 20
	#reset to 0		
	if rotation_degrees >= 180:
		rotation_degrees = 0
		swinging = false
	
	#check all overlapping bodies if there is a dummy
	#issue that it hits multiple times
	for body in get_overlapping_areas(): 
		if body.is_in_group("enemy") and $AnimationPlayer.is_playing():
			body.get_parent().take_damage( damage )
			
