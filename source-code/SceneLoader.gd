extends Area

func _ready():
	pass

func on_goal_reached(body):
	get_tree().change_scene("res://Winning Screen.tscn")
