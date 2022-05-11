extends Node2D

#function for taking damage
#maybe in the future pass a parameter for how much 
#right now only does animation

var health = 100

func take_damage( amount ):
	#graphix	
	$AnimationPlayer.play("hurt")

	#not fully implemented yet
	health -= amount
	if amount <= 0:
		die()

#not implemented yet
func die():
	print( name + " has died!" )	
	queue_free()
	
