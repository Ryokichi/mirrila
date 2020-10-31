extends "res://src/levels/level_base.gd"


var contador = 100


func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed('KEY_P'):
		$YSort/Mirrila.take_damage(2)
	if event.is_action_pressed('KEY_M'):
		pass
	pass

func begin_attack():
	.begin_attack()
	$YSort/Hunter.move_to_point(Vector2(95,60))
	$YSort/Mage.move_to_point(Vector2(197,97))
	$YSort/Monk.move_to_point(Vector2(135,81))
	$YSort/Warrior.move_to_point(Vector2(202,50))
	pass

func get_heroes():
	var heroes = [$YSort/Monk, $YSort/Warrior, $YSort/Hunter, $YSort/Mage, $YSort/Mirrila]
	return heroes

