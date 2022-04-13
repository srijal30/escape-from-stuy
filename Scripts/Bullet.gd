extends Node2D


var speed :int = 2500
var trajectory : Vector2 = Vector2(0, 0)

	
func _physics_process(delta):
	
	if abs(position.x) == 200:
		queue_free()
		
	if abs(position.y) == 200:
		queue_free()
	
	position += transform.x * speed * delta

	
