extends Node2D

var time_until_game_begin = 3
var game_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("carregou o level")
	GlobalParameters.game_active = false
	pass

func _process(_delta):
	
	pass

func _physics_process(delta):
	if (!GlobalParameters.game_active):
		if (time_until_game_begin > 0):
			time_until_game_begin -= delta
		else:
			GlobalParameters.game_active = true
#			begin_attack()
	if (GlobalParameters.ally_selected != null):
		$YSort/char_selection.global_position = GlobalParameters.ally_selected.global_position
	pass
	
func _input(event):
	if event.is_action_pressed("KEY_1"):
		$GameUI/Interface/Spell_Bar/Spell_1.active_spell()
	if event.is_action_pressed("KEY_2"):
		$GameUI/Interface/Spell_Bar/Spell_2.active_spell()
	if event.is_action_pressed("KEY_3"):
		$GameUI/Interface/Spell_Bar/Spell_3.active_spell()
	if event.is_action_pressed("KEY_4"):
		$GameUI/Interface/Spell_Bar/Spell_4.active_spell()
	if event.is_action_pressed("KEY_5"):
		$GameUI/Interface/Spell_Bar/Spell_5.active_spell()
	pass

func begin_attack():
#	game_started = true
	pass
