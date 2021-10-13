extends Control

onready var script_1 = preload("res://src/spells/spell_1.gd")
onready var script_2 = preload("res://src/spells/spell_2.gd")
onready var script_3 = preload("res://src/spells/spell_3.gd")
onready var script_4 = preload("res://src/spells/spell_4.gd")
onready var script_5 = preload("res://src/spells/spell_5.gd")

func _ready():
	GlobalSignals.connect("update_mana", self, "update_mana_bar")
	
	$Spell_Bar/Spell_1.set_script(script_1)
	$Spell_Bar/Spell_2.set_script(script_2)
	$Spell_Bar/Spell_3.set_script(script_3)
	$Spell_Bar/Spell_4.set_script(script_4)
	$Spell_Bar/Spell_5.set_script(script_5)
	
	$Spell_Bar/Spell_1.set_ini_values()
	$Spell_Bar/Spell_2.set_ini_values()
	$Spell_Bar/Spell_3.set_ini_values()
	$Spell_Bar/Spell_4.set_ini_values()
	$Spell_Bar/Spell_5.set_ini_values()
	pass

func update_mana_bar(perc):
	print("Ta funfando ", perc)
	$mana_bar.value = perc
	pass

func set_max_boss_health(value):
	if (value < 0):
		value = 100
	$boss_health_bar.max_value = value
	pass

func update_boss_helth(value):
	if (value > $boss_health_bar.max_value):
		value = $boss_health_bar.max_value
	$boss_health_bar.value = value
	pass
