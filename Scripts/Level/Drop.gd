extends Node2D

#bascially a wrapper for item on the floor

#should link to actual item scene
export (String) var item_name

#start float animation
func _ready():
	
	#if we set item name
	if item_name:
		var info = ItemManager.get_item(item_name)
		$Sprite.texture = info.texture
		add_to_group(info.type)
	
	#start the animation
	$AnimationPlayer.play("Float")
