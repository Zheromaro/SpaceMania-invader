extends Node

signal health_changed ()
signal died

var current_health := 1 :
	set(value):
		current_health = value
		health_changed.emit()
		if current_health <= 0 :
			current_health = 0
			died.emit()

@export var max_health := 1 :
	set(value):
		max_health = value
		if current_health != max_health:
			current_health = max_health

func damage_by(damage_value : float):
	current_health -= damage_value
