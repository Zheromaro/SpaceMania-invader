extends Node2D

@export var shooting_component: Node2D 
@export var fire_rate_timer: Timer 
@export var min_fire_rate := 0.8
@export var max_fire_rate := 1.2 
@export var animation_player: AnimationPlayer

static var enemy_count := 0

func _ready() -> void:
	enemy_count += 1

func _exit_tree() -> void:
	enemy_count -= 1

func _process(delta: float) -> void:
	Enemy_fire()

func Enemy_fire():
	if fire_rate_timer.is_stopped():
		var shooting_probability = randf_range(0, enemy_count) / float(enemy_count)
		if shooting_probability > 0.9 :
			shooting_component.fire()
		
		var fire_rate = randf_range(min_fire_rate, max_fire_rate)
		fire_rate_timer.wait_time = fire_rate
		fire_rate_timer.start()


func _on_health_component_died() -> void:
	animation_player.play("died")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "died":
		queue_free()
