extends Spatial

onready var constants = preload("res://Constants.gd").new()

var player : KinematicBody
var cam : Camera

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	player = get_parent()
	#alternative for get_node("Camera")
	cam = $Camera

func _input(event):
	if (!(event is InputEventMouseMotion) 
	or Input.get_mouse_mode() != Input.MOUSE_MODE_CAPTURED):
		return
	rotate_x(deg2rad(event.relative.y * constants.CMouseSensitivity))
	player.rotate_y(deg2rad(event.relative.x * constants.CMouseSensitivity * -1))
	rotation_degrees.x = clamp(rotation_degrees.x, -70, 70)
