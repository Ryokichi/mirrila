extends Sprite

var base_heal = 0
var base_mana = 0
var base_cast = 0
var base_cd = 0



func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event.is_pressed()):
		active_spell()
	pass


func active_spell():
	pass
