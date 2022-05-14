extends Node

var weapons = []
var passives = []

func add_weapon(addition):
	weapons.append(addition)

func add_passive(addition):
	passives.append(addition)

func remove_weapon(remove):
	weapons.remove(remove)

func remove_passive(remove):
	passives.remove(remove)
	
