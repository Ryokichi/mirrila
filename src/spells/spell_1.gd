extends "res://src/spells/spell.gd"
var texture_image = "res://assets/spells/spell_1.png"


func set_ini_values():
	base_heal = 10
	base_mana = 10
	base_time_cast = 2
	base_time_cd = 2
	curr_time_cast = 3
	curr_time_cd = 3
	set_texture_image()
	pass

func set_active():
	.set_active()
	print("blabla")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
