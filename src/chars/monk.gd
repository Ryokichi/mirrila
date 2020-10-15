extends "res://src/chars/character.gd"

var base_time_basic_attack = 2
var time_basic_attack = base_time_basic_attack

func _ready():
	stateAndOrientation = "attack_right"
	$Animation.play(self.stateAndOrientation)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (time_basic_attack > 0):
		time_basic_attack -= delta
	else:
		time_basic_attack = base_time_basic_attack
		stateAndOrientation = "attack_right"
		$Animation.play(self.stateAndOrientation)
	pass
