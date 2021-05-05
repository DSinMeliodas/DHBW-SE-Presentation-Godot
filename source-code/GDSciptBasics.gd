extends Node #inheritance from a GODOT specific type

#constant:
const cd = "I am a dynamic constant"
const cst : String = "I am a stronglytyped constant"

#member that will be initialised when then _ready function is called
onready var ready = preload("res://icon.png")

#casual members
var a : int = 2 #an integer
var b = 1 #could be either an int or an float

func _init():
	pass

func _ready():
	emit_signal("on_ready") #emitting the signal to potential listeners
	pass


signal on_ready()

func on_ready_action() -> void:
	return
