extends Node2D

#bullet
onready var Bullet = load("res://Scenes/Items/TestGun/Bullet.tscn")

func _ready():
	print("gun created")

#for shooting
func attack():
	#create instance of new bullet
	var bullet = Bullet.instance()
	#add it as child to mainScene
	get_parent().get_parent().add_child(bullet)
	#set position of bullet to gfx position
	bullet.global_position = $Gfx.global_position
	bullet.set_rotation_degrees( rotation_degrees - 90 )	

#for process update
func _process(delta):
	rotation_degrees = rad2deg( get_global_mouse_position().angle_to_point( global_position ) ) + 90
