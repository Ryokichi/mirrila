extends Sprite

<<<<<<< HEAD
#signal spell_animation

=======
onready var player = get_tree().get_root().get_node('Level/YSort/Mirrila')
>>>>>>> 796a87c992b347b84923ae1dda1260d2598f3929
var base_heal = 0
var base_mana = 0
var base_time_cast = 0
var base_time_cd = 0
var curr_time_cast = 0
var curr_time_cd = 0

#var alvo = null
var curr_state = null
#var mirrila = null
#var prev_state = null
#var stand_by = true

enum states {ready, casting, on_cd}

func _ready():
	$CDMask.visible = false
<<<<<<< HEAD
	self.curr_state = self.states.ready
	print("To carregado: ", self.curr_state)
=======
	curr_state = states.ready
>>>>>>> 796a87c992b347b84923ae1dda1260d2598f3929
	pass

func set_ini_values():
	print("Funcao set_ini_values deve ser sobrescrita pelo objeto filho")
	pass

<<<<<<< HEAD
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if (!GlobalParameters.game_active):
		return
	elif (event.is_pressed()):
		set_active()
	pass

#func _physics_process(delta):
#	if (self.curr_state == self.states.ready):
#		return
#	if (self.curr_state == self.states.casting && self.base_time_cast != 0):
#		GlobalParameters.emit_signal('update_cast', 1 - (self.curr_time_cast / base_time_cast))
#		pass
#
#	if (self.curr_time_cast > 0):
#		self.curr_time_cast -= delta
#	else:
#		if (self.curr_state == self.states.casting):
#			GlobalParameters.emit_signal("spell_animation")
#			self.curr_time_cast = 0
#			self.curr_state = self.states.on_cd
#			pass
#		if (self.curr_time_cd >= 0):
#			self.curr_time_cd -= delta
#		else:
#			self.reset_spell()
#	$CDMask.value = (self.curr_time_cd/self.base_time_cd)
#	pass
#
func set_active():
	print("pew pew", self.curr_state)
	if (self.curr_state == self.states.ready):
		self.curr_state = self.states.casting
		self.curr_time_cast = self.base_time_cast
		self.curr_time_cd = self.base_time_cd
=======
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
>>>>>>> 796a87c992b347b84923ae1dda1260d2598f3929
		$CDMask.visible = true
	pass

func reset_spell():
	print('desativando o parnaue')
	$CDMask.visible = false
<<<<<<< HEAD
	self.curr_state = self.states.ready
	self.curr_time_cast = 0
	self.curr_time_cd = 0
	pass

#func set_target (target):
#	self.alvo = target
#	pass

func set_texture_image():
	self.texture = load(self.texture_image)
	pass
=======
	is_active = false
	curr_time_cast = 0
	curr_time_cd = 0
	curr_state = states.ready
	pass

func get_state():
	return curr_state
>>>>>>> 796a87c992b347b84923ae1dda1260d2598f3929
