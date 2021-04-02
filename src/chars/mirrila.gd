extends "res://src/chars/character.gd"

onready var GameInterface = get_parent().get_node('../GameUI/Interface')
onready var current_mana = 500
onready var max_mana = 300

func _ready():
	GameInterface.set_mana_max_value(self.max_mana)
	max_health = 100
	current_health = max_health
	my_class  = "Healer"
	attack_range_rad = 40
	$Attack_Range/CollisionShape2D.shape.radius = attack_range_rad
	pass

func _process(_delta):
	
	pass


func _physics_process(delta):
	if (ParametrosGlobais.game_active):
		var axis = get_input_axis()
		if axis == Vector2.ZERO:
			apply_friction(ACCELERATION * delta)
		else:
			apply_movement(axis * ACCELERATION * delta)
		
		if (!self.state == "dead"):
			update_animation(axis)
			motion = move_and_slide(motion)
	pass


func update_animation(axis):
	var newOrientation = self.orientation
	var newState = self.state
	
	newState = "idle_"
	if (axis.x > 0):
		newState = "walk_"
		newOrientation = "right"
		pass
	elif (axis.x < 0):
		newState = "walk_"
		newOrientation = "left"
		pass
	if (axis.y < 0):
		newState = "walk_"
		newOrientation = "up"
		pass
	elif (axis.y > 0):
		newState = "walk_"
		newOrientation = "down"
		pass
	
	if ((newState != state) || (newOrientation != orientation)):
		state = newState
		orientation = newOrientation
		stateAndOrientation = state + orientation
		$Animation.play(stateAndOrientation)
		pass
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
