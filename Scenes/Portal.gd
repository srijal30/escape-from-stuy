extends Node2D

#by default it is main scene
export (String) var scenePath = "res://Scenes/Levels/MainScene.tscn"

func change():
	get_tree().change_scene( scenePath )

