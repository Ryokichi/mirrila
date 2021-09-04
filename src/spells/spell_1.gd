extends "res://src/spells/spell.gd"
var texture_image = "res://assets/spells/spell_1.png"


func set_ini_values():
	my_id = 1
	base_heal = 10
	base_mana = 10
	base_time_cast = 2
	base_time_cd = 2
	curr_time_cast = 3
	curr_time_cd = 3
	set_texture_image()
	reset_spell()
	print(self.name)
	pass

func set_active():
	.set_active()
	pass

func execute_spell():
	self.target_ally.take_heal(self.base_heal, self.my_id)
	GlobalSignals.emit_signal('spell_executed')
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
