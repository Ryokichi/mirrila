extends "res://src/chars/character.gd"

onready var current_mana : float = 100
onready var max_mana : float = 100
onready var mana_regen_time_base : float = 2
onready var mana_regen_time : float = 2
onready var mana_regen_val : float = 1

func _ready():
	self.my_class  = "Healer"
	self.max_health = 100
	self.current_health = max_health
	self.attack_range_rad = 40
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	GlobalSignals.connect("spell_cast_begin", self, "spell_cast_begin")
	GlobalSignals.connect("spell_cast_finished", self, "spell_cast_finished")
	GlobalSignals.connect("spell_executed", self, "spell_executed")
	GlobalSignals.connect("update_cast", self, "update_cast_bar")
	SpellManager.connect("set_spell_is_casting", self, "set_spell_is_casting")
	pass


func update_cast_bar(perc):
	$Cast_Bar.update_bar(perc)
	pass

func spell_cast_begin():
	self.state = "casting_"
	$Cast_Bar.visible = true
	play_animation(self.state + self.orientation)
	pass

func spell_cast_finished():
	$Cast_Bar.visible = false
	self.state = "idle_"
	play_animation(self.state + self.orientation)
	pass
	
func spell_executing():
	
	pass

func spell_executed(mana_cost):
#	fazer o paranaue para mudar animação
	self.state = "executing_"
	play_animation(self.state + self.orientation)
	self.current_mana -= mana_cost
	update_mana()
	pass

func update_mana():
	if (self.current_mana < 0):
		self.current_mana = 0
	elif (self.current_mana > self.max_mana):
		self.current_mana = self.max_mana
	update_mana_bar()
	pass

func update_mana_bar():
	print(self.current_mana, self.max_mana)
	var perc = (self.current_mana / self.max_mana)
	GlobalSignals.emit_signal("update_mana", perc)
	pass

func _process(_delta):
	pass

func _physics_process(delta):
	if (GlobalParameters.game_active):
		if (!self.state == "dead"):
			var axis = get_input_axis()
			if axis == Vector2.ZERO:
				apply_friction(ACCELERATION * delta)
			else:
				apply_movement(axis * ACCELERATION * delta)
				
			update_animation(axis)
			motion = move_and_slide(motion)
	
	if (self.mana_regen_time <= 0 && self.current_mana != self.max_mana):
		self.mana_regen_time = self.mana_regen_time_base
		self.current_mana += self.mana_regen_val
		self.update_mana()
		pass
	self.mana_regen_time -= delta
	pass

func update_animation(axis):
	if (self.state == "casting_"):
		if (axis.x == 0 && axis.y == 0):
			return
		else :
			GlobalSignals.emit_signal("spell_interrupted")
			spell_cast_finished()
	
	if (self.state == "executing_"):
		return

	self.newState = "idle_"
	
	if (axis.x != 0 || axis.y != 0):
		self.newState = "walk_"
	
	if (axis.x > 0):
		self.newOrientation = "right"
	elif (axis.x < 0):
		self.newOrientation = "left"
	
	if (axis.y > 0):
		self.newOrientation = "down"
	elif (axis.y < 0):
		self.newOrientation = "up"
	
	if ((self.newState != self.state) || (self.newOrientation != self.orientation)):
		self.state = newState
		self.orientation = newOrientation
		play_animation(self.state + self.orientation)
		pass
	pass

func play_animation(stateAndOrientation):
	$Animation.play(stateAndOrientation)
	pass

func get_input_axis():
	var  axis = Vector2.ZERO
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down"))  - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()
	pass

func take_damage(amount):
	self.current_health = self.current_health - amount
	self.current_health = 0 if (self.current_health < 0) else self.current_health
	var health_perc = int(100*self.current_health / self.max_health)
	self.update_health(health_perc)
	pass
