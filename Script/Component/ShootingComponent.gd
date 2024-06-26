extends Node2D

@export var bullet : PackedScene


func fire():

	var new_bullet = bullet.instantiate()
	new_bullet.position = global_position
	new_bullet.rotation = global_rotation
	get_tree().get_root().add_child(new_bullet)
