extends Sprite

#signal spell_animation


var base_heal = 0
var base_mana = 0
var base_time_cast = 0
var base_time_cd = 0
var curr_time_cast = 0
var curr_time_cd = 0

var target_ally = null
var curr_state = null
#var prev_state = null
#var stand_by = true

enum states {ready, casting, on_cd}

func _ready():
	$CDMask.visible = false
	self.curr_state = self.states.ready  #por algum motivo ao chamar o set_active ele vem nulo
	pass

func set_ini_values():
	print("Funcao set_ini_values deve ser sobrescrita pelo objeto filho")
	pass

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (!GlobalParameters.game_active):
		return
	elif (event.is_pressed()):
		set_active()
	pass

func _physics_process(delta):
	if (self.curr_state == self.states.ready):
		return
	if (self.curr_state == self.states.casting && self.base_time_cast != 0):
		GlobalParameters.emit_signal('update_cast', 1 - (self.curr_time_cast / base_time_cast))
		pass

	if (self.curr_time_cast > 0):
		self.curr_time_cast -= delta
	else:
		if (self.curr_state == self.states.casting):
			GlobalParameters.emit_signal("spell_animation")
			self.curr_time_cast = 0
			self.curr_state = self.states.on_cd
			pass
		if (self.curr_time_cd >= 0):
			self.curr_time_cd -= delta
		else:
			self.reset_spell()
	$CDMask.value = (self.curr_time_cd/self.base_time_cd)
	pass

func set_active():
	if (self.curr_state == self.states.ready || self.curr_state == null):
		if (get_target_ally()):
			$CDMask.visible = true
			set_curr_state(self.states.casting)
			self.curr_time_cast = self.base_time_cast
			self.curr_time_cd = self.base_time_cd
			self.target_ally = GlobalParameters.ally_selected
			print(self.name, " foi ativada e meu alvo é: ", self.target_ally.name)
	pass

func reset_cool_down():
	pass

func reset_cast_time():
	pass

func set_curr_state(state):
	self.curr_state = state
	pass

func reset_spell():
	print('Resetando spell: ', self.name)
	$CDMask.visible = false
	self.curr_state = self.states.ready
	self.curr_time_cast = 0
	self.curr_time_cd = 0
	self.target_ally = null
	pass

func get_target_ally ():
	self.target_ally = GlobalParameters.ally_selected
	return self.target_ally
	pass

func set_texture_image():
	self.texture = load(self.texture_image)
	pass
