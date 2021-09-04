extends Node

var solto =  load("res://assets/cursor/cursor_normal.png")
var pressionado = load("res://assets/cursor/cursor_pressionado.png")
var game_active =  false
var ally_selected = null


#signal spell_animation
#signal set_selected_char(character)



func _ready():
#	Input.set_custom_mouse_cursor(solto)
#	Input.set_custom_mouse_cursor(pressionado,Input.CURSOR_CAN_DROP)
#	Input.set_custom_mouse_cursor(pressionado,Input.CURSOR_IBEAM)
	GlobalSignals.connect('set_ally_selected', self, 'set_ally_selected')
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	pass

func set_ally_selected(character):
	ally_selected = character
	print('Char selecionado: ', character.name)
	pass
