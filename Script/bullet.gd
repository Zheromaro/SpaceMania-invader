extends Area2D

@export var bullet_speed := 900.0
@export var damage_value := 1.0 :
	get:
		queue_free()
		return damage_value

func _physics_process(delta: float) -> void:
	position.y += bullet_speed * delta;


func _on_body_entered(body: Node2D) -> void:
	queue_free() 

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
