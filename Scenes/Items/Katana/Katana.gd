extends Node2D


func attack():
	$AnimationPlayer.play("swing") 
# timer: 2 sec window to perform 2nd attack
#   2nd animation
# timer: 2 sec window to perform 3rd attack
#   3rd animation

func second_attack():
	
	print("there is no second attack!")
