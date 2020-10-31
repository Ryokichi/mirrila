extends Node2D


var time_until_game_begin = 3
var game_started = false
var char_selected = null

# Called when the node enters the scene tree for the first time.
func _ready():
	ParametrosGlobais.game_active = false
	pass

func _process(_delta):
	if (char_selected != null):
		$YSort/char_selection.global_position = char_selected.global_position
	pass

func _physics_process(delta):
	if (!ParametrosGlobais.game_active):
		if (time_until_game_begin > 0):
			time_until_game_begin -= delta
		else:
			ParametrosGlobais.game_active = true
			begin_attack()
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
	game_started = true
	pass

func set_char_selected(char_clicked):
	char_selected = char_clicked
	pass
