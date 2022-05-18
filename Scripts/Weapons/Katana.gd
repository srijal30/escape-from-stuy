extends Node2D

export var damage = 70

func attack():
	$AnimationPlayer.play("katana_swing") 
# timer: 2 sec window to perform 2nd attack
#   2nd animation
# timer: 2 sec window to perform 3rd attack
#   3rd animation

func second_attack():
	
	print("there is no second attack!")

func _on_katana_area_entered(area):
	if area.is_in_group("enemy") and $AnimationPlayer.current_animation == "swing":
		area.get_parent().take_damage(damage)
