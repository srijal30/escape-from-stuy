extends Area2D

export var damage = 50

#to swing the sword
func attack():
	$AnimationPlayer.play("swing")
	
#second attack (maybe parry?)
func second_attack():
	print("there is no second attack!")
	

#when area enters a body
func _on_Sword_area_entered(area):
	if area.is_in_group("enemy") and $AnimationPlayer.current_animation == "swing":
		area.get_parent().take_damage(damage)
