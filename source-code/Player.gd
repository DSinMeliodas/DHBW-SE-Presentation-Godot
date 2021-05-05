extends KinematicBody

onready var constants = preload("res://Constants.gd").new()

var cam : Camera
var dir : Vector3
var vel : Vector3

func _ready():
	#alternative for get_node("Helper/Camera)
	cam = $Helper/Camera

func _physics_process(delta):
	var input = handle_movement_input()
	process_input(input)
	process_movement(delta)

func handle_movement_input():
	dir = Vector3.ZERO
	var input = Vector2.ZERO
	if (Input.is_action_pressed("move_forward")):
		input.y += 1
	if (Input.is_action_pressed("move_backward")):
		input.y -= 1
	if (Input.is_action_pressed("move_right")):
		input.x += 1
	if (Input.is_action_pressed("move_left")):
		input.x -= 1
		
	if (is_on_floor() and Input.is_action_just_pressed("jump")):
		vel.y += constants.CJumpHeight
		
	if (Input.is_action_just_pressed("ui_cancel")):
		var mode = ui_cancel_action()
		Input.set_mouse_mode(mode)
		
	return input.normalized()

func process_input(input : Vector2):
	var camGlobalTransform = cam.get_global_transform()
	
	dir += -camGlobalTransform.basis.z * input.y
	dir += camGlobalTransform.basis.x * input.x
	
	dir.y = 0
	dir = dir.normalized()

func process_movement(delta):
	vel.y += delta * constants.CGravity
	var tvel = vel
	tvel.y = 0

	var accel = constants.get_Acceleration(dir, tvel)
	tvel = tvel.linear_interpolate(dir * constants.CSpeed, accel * delta)
	vel.x = tvel.x
	vel.z = tvel.z
	vel = move_and_slide(vel, Vector3.UP, 0.05, 4, constants.CMaxSlopeAngle)

func ui_cancel_action(): 
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		return Input.MOUSE_MODE_VISIBLE
	return Input.MOUSE_MODE_CAPTURED
