extends CharacterBody2D

@export var speed := 300.0
@export var fire_rate: Timer 
@export var shooting_component: Node2D 
@export var animation_player: AnimationPlayer 

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Fire"):
		player_fire()

func player_fire() -> void:
	if not fire_rate.is_stopped():
		return
	
	shooting_component.fire()
	fire_rate.start()

# Health

func _on_health_component_health_changed() -> void:
	animation_player.stop()
	animation_player.play("hit")
	
func _on_health_component_died() -> void:
	animation_player.play("died")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "died":
		get_tree().reload_current_scene()
