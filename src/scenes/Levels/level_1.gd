extends "res://src/scenes/Levels/level_base.gd"


var contador = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
	$YSort/Monk.move_to_point(Vector2(135,81))
	$YSort/Warrior.move_to_point(Vector2(204,51))
	$YSort/Mage.move_to_point(Vector2(197,97))
	$YSort/Hunter.move_to_point(Vector2(95,60))
	
	pass
