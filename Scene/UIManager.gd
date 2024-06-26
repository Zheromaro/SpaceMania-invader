extends CanvasLayer

@export var pause_menu: Panel 
@export var play_menu: Panel
var is_playing = false

func _ready() -> void:
	get_tree().paused = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause") && is_playing == true:
		ManagePause()

func _on_continue_button_pressed() -> void:
	ManagePause()

func ManagePause() -> void:
	if get_tree().paused == false :
		pause_menu.visible = true
		get_tree().paused = true
	elif get_tree().paused == true :
		pause_menu.visible = false
		get_tree().paused = false


func _on_play_button_pressed() -> void:
	is_playing = true
	play_menu.visible = false
	get_tree().paused = false


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
