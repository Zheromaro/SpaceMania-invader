extends Node2D

@export var speed := 300.0
@export var vertical_step_length := 600
@export var horizontal_step_length := 600
@export var step_timer: Timer 
@export var ray_cast_left: RayCast2D
@export var ray_cast_right: RayCast2D 

var step_horizontal := true
var direction := 1

func _physics_process(delta: float) -> void:
	Enemy_step()

func Enemy_step():
	if step_timer.is_stopped():
		
		if ray_cast_right.is_colliding():
			direction = -1
			Calculate_step_horizontal()
			
		elif ray_cast_left.is_colliding():
			direction = 1
			Calculate_step_horizontal()
		
		if step_horizontal :
			position.x += horizontal_step_length * direction
		
		step_timer.start()

func Calculate_step_horizontal(): 
	if step_horizontal :
		position.y += horizontal_step_length
	step_horizontal = !step_horizontal
