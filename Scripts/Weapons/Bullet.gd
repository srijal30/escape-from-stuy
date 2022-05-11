extends Node2D

var speed :int = 2000
var despawnSpeed : float = 2.5 #in seconds

var damage = 10

#on the creation
func _ready():
	#prepare to destroy after specified tiem
	$Timer.connect("timeout", self, "queue_free")
	$Timer.set_wait_time(despawnSpeed)
	$Timer.start()

#every frame physics
func _physics_process(delta):
	#continously move the bullet
	position += transform.x * speed * delta



func _on_Bullet_area_entered(area):
	#if it is a dummy, make it take damage and delete it
	if area.is_in_group("enemy"):
		area.get_parent().take_damage(damage)
		queue_free() 
