extends KinematicBody2D

const MAX_SPEED = 35
const ACCELERATION = 1000

onready var motion = Vector2.ZERO
onready var new_destiny = Vector2.ZERO
onready var state = "idle_"
onready var orientation = "down"
onready var stateAndOrientation = "idle_down"
onready var current_health  = 100
onready var max_health = 100
onready var attack_range_rad = 5
onready var target = null
onready var base_time_basic_attack = 1
onready var time_basic_attack = base_time_basic_attack


func _ready():
	$Animation.play(self.stateAndOrientation)
	pass

func _draw():
#	draw_circle(Vector2(0,-11), attack_range_rad, Color(.867, .91, .247,  0.2))
	pass

func _process(delta):
	update()
	pass

func _physics_process(delta):
	if (new_destiny != Vector2.ZERO):
		move_and_slide((new_destiny - global_position).normalized() * MAX_SPEED)
		pass
	if (target != null):
		if (time_basic_attack > 0):
			time_basic_attack -= delta
		else:
			time_basic_attack = base_time_basic_attack
			set_state("attack")
			self.attack_enemy()
	pass
	
func _on_Attack_Range_body_entered(body):
	if (target):
		return
	target = body
	new_destiny = Vector2.ZERO
	print("Entrou")
	pass


func _on_Attack_Range_body_exited(body):
	if (body == target):
		target = null
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
	
func move_to_point(point):
	print('tenho que me mover para', point)
	new_destiny = point
	pass


func attack_enemy():
	$Animation.play(self.stateAndOrientation)
	pass


func take_damage(amount):
	pass


func set_orientation(ori):
	self.orientation = ori
	updade_StateAndOrientation()
	pass


func set_state(stt):
	self.state = stt
	updade_StateAndOrientation()
	pass


func update_health(percentage):
	print('o pencentual é: '+str(percentage))
	$Health_Bar/Progress.value = percentage
	pass


func updade_StateAndOrientation():
	self.stateAndOrientation = self.state + self.orientation
	pass
