extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var contador = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	$gameUI.set_z_index(1000)
	$Boss.set_z_index($Boss.get_position().y)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Mirrila.set_z_index(int($Mirrila.get_position().y))
	$Monk.set_z_index(int($Monk.get_position().y))
	pass

func _input(event):
	if event.is_action_pressed('KEY_P'):
		$Mirrila.take_damage(2)
	pass
