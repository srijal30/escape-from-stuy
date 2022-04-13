extends Node2D

#bullet
onready var Bullet = preload("res://Scenes/Bullet.tscn")

#for shooting
func shoot():
	#create instance of new bullet
	var bullet = Bullet.instance()
	#add it as child to mainScene
	owner.owner.add_child(bullet)
	#set position of bullet to player position
	bullet.position = owner.position
	bullet.set_rotation_degrees( rotation_degrees - 90 )	

#for process update
func _process(delta):
	rotation_degrees = rad2deg( get_global_mouse_position().angle_to_point( global_position ) ) + 90

