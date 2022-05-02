extends Node2D

#bascially a wrapper for item on the floor

#should link to actual item scene
export (Resource) var itemSrc = null
export (Texture) var texture
export (String) var group

#start float animation
func _ready():
	#change the texture
	$Sprite.texture = texture
	#add to group
	add_to_group(group)
	#start the animation
	$AnimationPlayer.play("Float")
