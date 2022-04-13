extends StaticBody2D

#function for taking damage
#maybe in the future pass a parameter for how much 
#right now only does animation
func take_damage():
	$gfx.texture = load("res://Textures/Temp/hurt_dummy.png")
	yield( get_tree().create_timer(.1), "timeout")
	$gfx.texture = load("res://Textures/Temp/dummy.png")

