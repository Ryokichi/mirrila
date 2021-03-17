extends Sprite

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

func set_ini_values():
	print("Funcao deve ser sobrescrita pelo objeto filho")
	pass


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event.is_pressed()):
		active_spell()
	pass

func _physics_process(delta):
	#
	#uma vez que a mágica for ativada, ela irá contabilizar o Cast Time
	#depois ela deve triggar o efeito
	#então deve ativar contabilizar o Cooldown para desativar a magia e liberar
	#para o próximo uso
	if (!self.is_active):
		return
	if (self.curr_time_cast > 0):
		self.curr_time_cast -= delta
	else:
		self.curr_time_cast = 0
		self.curr_time_cd = self.base_time_cd
		
	if (self.curr_time_cd > 0):
		self.curr_time_cd -= delta
	else:
		self.reset_spell()
	pass

func active_spell():
	if (self.is_active == false):
		self.is_active = true
		self.curr_time_cast = self.base_time_cast
	pass

func reset_spell():
	self.is_active = false
	self.curr_time_cast = 0
	self.curr_time_cd = 0
	
	pass

func set_texture_image():
	self.texture = load(self.texture_image)
	pass
