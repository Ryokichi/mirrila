extends "res://src/scenes/levels/level_base.gd"


func _ready():
	GlobalParameters.game_active = true
	pass


#func _process(delta):
#	pass

func _input(event):
	if (event.is_action_pressed("KEY_Q")):
		$YSort/Magia_1.emitting = true
		$YSort/Magia_2.emitting = true
		pass
	
	pass
