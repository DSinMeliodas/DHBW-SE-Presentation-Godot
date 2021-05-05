extends Object
	
const CAccel : float = 1.5
const CCamera : String = "camera"
const CDeaccel : float = 16.0
const CGravity : float = -24.8
const CJumpHeight : float = 13.0
const CMouseSensitivity : float = 0.075
const CMaxSlopeAngle : float = PI/4.5
const CSpeed : float = 20.0

func get_Acceleration(dir, vel):
	if dir.dot(vel) > 0:
		return CAccel
	return CDeaccel
