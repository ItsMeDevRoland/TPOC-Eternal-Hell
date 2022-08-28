extends KinematicBody2D

export var speed = 200
export var acceleration = 450
export var decceleration = 800
var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var inp_vel: Vector2
	inp_vel.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	inp_vel.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	inp_vel = inp_vel.normalized()
	
	if inp_vel != Vector2.ZERO:
		velocity = velocity.move_toward(speed*inp_vel, acceleration*delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, decceleration*delta)
	
	move_and_slide(velocity)
