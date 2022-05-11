extends Node2D

export var swingDamage = 25


func _ready():
	pass # Replace with function body.


#not strum
func attack():
	$AnimationPlayer.play("swing")
	
	
#strum (maybe cooldown)
func second_attack():
	print("there is no second attack!")

func _on_AttackArea_area_entered(area):
	if area.is_in_group("enemy") and $AnimationPlayer.current_animation == "swing":
		area.get_parent().take_damage( swingDamage )
