extends "res://src/spells/spell.gd"

var texture_image = "res://assets/spells/spell_4.png"

func set_ini_values():
	base_heal = 10
	base_mana = 10
	base_time_cast = 10
	base_time_cd = 10
	curr_time_cast = 10
	curr_time_cd = 10
	set_texture_image()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
