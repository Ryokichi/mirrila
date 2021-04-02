extends Sprite

onready var player = get_tree().get_root().get_node('Level/YSort/Mirrila')
var base_heal = 0
var base_mana = 0
var base_time_cast = 0
var base_time_cd = 0
var curr_time_cast = 0
var curr_time_cd = 0
var curr_state = null
var prev_state = null
var is_active = false
var tartget = null

enum states {ready, casting, on_cd}

func _ready():
	$CDMask.visible = false
	curr_state = states.ready
	pass

func set_ini_values():
	print("Funcao deve ser sobrescrita pelo objeto filho")
	pass

func set_texture_image():
	texture = load(self.texture_image)
	pass

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event.is_pressed()):
		active_spell()
	pass

func _physics_process(delta):
	if (curr_state != states.ready):
		if (curr_state == states.casting):
			if (curr_time_cast > 0):
				curr_state = states.casting
				curr_time_cast -= delta
			else:
				curr_time_cast = 0
				curr_state = states.on_cd
		elif (curr_state == states.on_cd):
			if (curr_time_cd > 0):
				curr_time_cd -= delta
				curr_state = states.on_cd
			else:
				reset_spell()
			$CDMask.value = (curr_time_cd/base_time_cd)
	pass

func active_spell():
	if (is_active == false):
		is_active = true
		curr_time_cast = base_time_cast
		curr_time_cd = base_time_cd
		curr_state = states.casting
		$CDMask.visible = true
	pass

func reset_spell():
	print('desativando o parnaue')
	$CDMask.visible = false
	is_active = false
	curr_time_cast = 0
	curr_time_cd = 0
	curr_state = states.ready
	pass

func get_state():
	return curr_state
