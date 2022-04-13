extends Node2D

var speed :int = 750
var despawnSpeed : float = 2.5 #in seconds

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

#when something collides with bullet
func _on_Bullet_body_entered(body):
	#if it is a dummy, make it take damage and delete it
	if body.is_in_group("dummy"):
		body.take_damage()
		queue_free() 
		

