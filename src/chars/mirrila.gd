extends KinematicBody2D

const MAX_SPEED = 50
const ACCELERATION = 1000

var motion = Vector2.ZERO
var orientation = "down"
var state = "idle_"
var stateAndOrientation = "idle_down"

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	var axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(ACCELERATION * delta)
	else:
		apply_movement(axis  * ACCELERATION * delta)
	
	if (!self.state == "dead"):
		update_animation(axis)
		motion = move_and_slide(motion)
	pass
	
func update_animation(axis):
	var newOrientation = self.orientation
	var newState = self.state
	var newStateAndOrientation = self.state + self.orientation
	
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
	
	if ((newState != self.state) || (newOrientation != self.orientation)):
		self.state = newState
		self.orientation = newOrientation
		self.stateAndOrientation = self.state + self.orientation
		$AnimationPlayer.play(self.stateAndOrientation)
		pass
	print (self.stateAndOrientation)
	pass

func get_input_axis():
	var  axis = Vector2.ZERO
		
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_down"))  - int(Input.is_action_pressed("ui_up"))
	return axis.normalized()
	pass

func apply_friction(amount):
	if motion.length() > amount:
		motion -= motion.normalized() * amount
	else:
		motion = Vector2.ZERO
	pass

func apply_movement(acceleration):
	motion += acceleration
	motion = motion.clamped(MAX_SPEED)
	pass
