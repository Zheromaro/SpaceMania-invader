extends Area2D

signal get_hit

@export var health_component : Node
@export var tack_damage_groups : Array[String]

func _on_area_entered(area: Area2D) -> void:
	if tack_damage_groups.is_empty():
		return
	
	for group in tack_damage_groups:
		if not area.is_in_group(group):
			return
	
	get_hit.emit()
	
	if health_component != null :
		health_component.damage_by(area.damage_value)
	else:
		print("there are no HealthComponent in " + name)
	
